-module(element_script).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"script">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"async">>, if Record#script.async == true -> <<"async">>; true -> undefined end},
        {<<"charset">>,Record#script.charset},
        {<<"defer">>, if Record#script.defer == true -> <<"defer">>; true -> undefined end},
        {<<"src">>,Record#script.src},
        {<<"type">>,Record#script.type}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).