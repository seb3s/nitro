-module(element_password).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"autocomplete">>, case Record#password.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},      
        {<<"autofocus">>,if Record#password.autofocus == true -> "autofocus"; true -> undefined end},            
        {<<"disabled">>, if Record#password.disabled == true -> "disabled"; true -> undefined end},
        {<<"form">>,Record#password.form},
        {<<"maxlength">>,Record#password.maxlength},
        {<<"name">>,Record#password.name},
        {<<"pattern">>,Record#password.pattern},
        {<<"placeholder">>, Record#password.placeholder},
        {<<"readonly">>,if Record#password.readonly == true -> "readonly"; true -> undefined end},      
        {<<"required">>,if Record#password.required == true -> "required"; true -> undefined end},      
        {<<"size">>,Record#password.size},
        {<<"type">>, <<"password">>},
        {<<"value">>, Record#password.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).