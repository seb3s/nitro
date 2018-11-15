-module(element_radio).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record, change),

    TypeChecked = case Record#radio.checked of
        true -> [{<<"checked">>, <<"">>},{<<"type">>, <<"radio">>}];
        _ -> [{<<"type">>, <<"radio">>}]
    end ++ case Record#radio.disabled of
        true -> [{<<"disabled">>, <<"disabled">>}];
        _ -> []
    end,

    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), TypeChecked ++ [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"value">>, Record#radio.value},
        {<<"name">>, nitro:coalesce([Record#radio.html_name,Record#radio.name])},
        {<<"onclick">>, Record#radio.onclick},
        {<<"required">>,if Record#radio.required == true -> <<"required">>; true -> undefined end}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).