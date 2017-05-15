-module(element_number).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"autocomplete">>, case Record#number.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
        {<<"autofocus">>,if Record#number.autofocus == true -> "autofocus"; true -> undefined end},            
        {<<"disabled">>, if Record#number.disabled == true -> "disabled"; true -> undefined end},
        {<<"form">>,Record#number.form},
        {<<"list">>,Record#number.list},
        {<<"max">>,Record#number.max},
        {<<"min">>,Record#number.min},      
        {<<"name">>,Record#number.name},
        {<<"placeholder">>,Record#number.placeholder},
        {<<"readonly">>,if Record#number.readonly == true -> "readonly"; true -> undefined end},      
        {<<"required">>,if Record#number.required == true -> "required"; true -> undefined end},      
        {<<"step">>,Record#number.step},
        {<<"type">>, <<"number">>},
        {<<"value">>, Record#number.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).