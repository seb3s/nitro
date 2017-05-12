-module(element_select).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record = #select{}) ->
  ID = case Record#select.id of undefined -> nitro:temp_id(); I->I end,
  case Record#select.postback of
    undefined -> skip;
    Postback -> nitro:wire(#event{ type=change,
                                target=ID,
                                postback=Postback,
                                source=[nitro:to_atom(ID)],
                                delegate=Record#select.delegate }) end,
  Props = [
    ?NITRO_GLOBAL_ATTRIBUTES(ID),
    {<<"name">>, Record#select.name},
    {<<"onchange">>, Record#select.onchange},
    {<<"required">>, case Record#select.required of true -> <<"required">>; _-> undefined end},
    {<<"disabled">>, case Record#select.disabled of true -> <<"disabled">>; _-> undefined end},
    {<<"multiple">>, case Record#select.multiple of true -> <<"multiple">>; _-> undefined end}
    ?NITRO_DATA_ARIA_ATTRIBUTES
  ],
  wf_tags:emit_tag(<<"select">>, nitro:render(Record#select.body), Props);

render_element(Record = #optgroup{}) ->
  wf_tags:emit_tag(<<"optgroup">>, nitro:render(Record#optgroup.body), [
    ?NITRO_GLOBAL_ATTRIBUTES,
    {<<"disabled">>, case Record#optgroup.disabled of true-> <<"disabled">>; _-> undefined end},
    {<<"label">>, Record#optgroup.label}
    ?NITRO_DATA_ARIA_ATTRIBUTES
  ]);

render_element(Record = #option{}) ->
  wf_tags:emit_tag(<<"option">>, nitro:render(Record#option.body), [
    ?NITRO_GLOBAL_ATTRIBUTES,
    {<<"disabled">>, case Record#option.disabled of true -> <<"disabled">>; _-> undefined end},
    {<<"label">>, Record#option.label},
    {<<"selected">>, case Record#option.selected of true -> <<"selected">>; _-> undefined end},
    {<<"value">>, Record#option.value}
    ?NITRO_DATA_ARIA_ATTRIBUTES
  ]).