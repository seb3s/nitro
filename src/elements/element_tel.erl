-module(element_tel).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"autocomplete">>, case Record#tel.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
        {<<"autofocus">>,if Record#tel.autofocus == true -> "autofocus"; true -> undefined end},
        {<<"disabled">>, if Record#tel.disabled == true -> "disabled"; true -> undefined end},
        {<<"form">>,Record#tel.form},
        {<<"list">>,Record#tel.list},
        {<<"maxlength">>,Record#tel.maxlength},
        {<<"name">>,Record#tel.name},
        {<<"pattern">>,Record#tel.pattern},
        {<<"placeholder">>,Record#tel.placeholder},
        {<<"readonly">>,if Record#tel.readonly == true -> "readonly"; true -> undefined end},
        {<<"required">>,if Record#tel.required == true -> "required"; true -> undefined end},      
        {<<"size">>,Record#tel.size},
        {<<"type">>, <<"tel">>},
        {<<"value">>, Record#tel.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).