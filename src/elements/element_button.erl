-module(element_button).
-author('Andrew Zadorozhny').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"button">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"type">>, Record#button.type},
        {<<"name">>, Record#button.name},
        {<<"onchange">>, Record#button.onchange},
        {<<"onclick">>, Record#button.onclick},
        {<<"disabled">>, if Record#button.disabled == true -> "disabled"; true -> undefined end},
        {<<"value">>, Record#button.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).