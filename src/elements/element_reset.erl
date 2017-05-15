-module(element_reset).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"autofocus">>,if Record#reset.autofocus == true -> "autofocus"; true -> undefined end},            
        {<<"disabled">>, if Record#reset.disabled == true -> "disabled"; true -> undefined end},
        {<<"form">>,Record#reset.form},
        {<<"name">>,Record#reset.name},
        {<<"type">>, <<"reset">>},
        {<<"value">>, Record#reset.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).