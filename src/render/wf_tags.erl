-module(wf_tags).
-author('Maxim Sokhatsky').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).
-define(VOID(Tag),  (Tag =:= <<"br">>     orelse Tag =:= <<"hr">>
              orelse Tag =:= <<"link">>   orelse Tag =:= <<"img">>
              orelse Tag =:= <<"input">>  orelse Tag =:= <<"option">>
              orelse Tag =:= <<"meta">>   orelse Tag =:= <<"param">>
              orelse Tag =:= <<"base">>   orelse Tag =:= <<"area">>
              orelse Tag =:= <<"col">>    orelse Tag =:= <<"command">>
              orelse Tag =:= <<"keygen">> orelse Tag =:= <<"source">>)).

emit_tag(TagName, Props) -> [<<"<">>, TagName, write_props(Props), <<"/>">>].
emit_tag(TagName, undefined, Props) -> emit_tag(TagName, [], Props);
emit_tag(TagName, [undefined], Props) -> emit_tag(TagName, [], Props);
emit_tag(TagName, [], Props) when ?VOID(TagName) -> emit_tag(TagName, Props);
emit_tag(TagName, [], Props) -> [<<"<">>, TagName, write_props(Props), <<">">>, <<"</">>, TagName, <<">">>];
emit_tag(TagName, Content, Props) -> [<<"<">>, TagName, write_props(Props), <<">">>, Content, <<"</">>, TagName, <<">">>].

write_props(Props) -> [display_property(Prop) || {_, Val} = Prop <- Props, Val =/= undefined, Val =/= []].

display_property({Prop, Value}) when Prop =:= <<"class">>; Prop =:= <<"data-toggle">> -> prop({Prop, Value});
display_property({Prop, Value}) when is_binary(Value), is_binary(Prop) -> [<<" ">>, Prop, <<"=\"">>, Value, <<"\"">>];
display_property({Prop, Value}) -> [<<" ">>, nitro:to_binary(Prop), <<"=\"">>, nitro:to_binary(Value), <<"\"">>].

prop({Prop, Value}) when is_atom(Value) ->   [<<" ">>, Prop, <<"=\"">>, nitro:to_binary(Value), <<"\"">>];
prop({Prop, Value}) when is_binary(Value) -> [<<" ">>, Prop, <<"=\"">>, Value, <<"\"">>];
prop({Prop, Value}) -> [<<" ">>, Prop, <<"=\"">>, lists:join(<<" ">>, [nitro:to_binary(V) || V <- Value]), <<"\"">>].