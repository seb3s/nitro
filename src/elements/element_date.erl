-module(element_date).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"autocomplete">>, case Record#date.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
        {<<"autofocus">>,if Record#date.autofocus == true -> "autofocus"; true -> undefined end},
        {<<"disabled">>, if Record#date.disabled == true -> "disabled"; true -> undefined end},
        {<<"form">>,Record#date.form},
        {<<"list">>,Record#date.list},
        {<<"max">>,Record#date.max},
        {<<"min">>,Record#date.min},
        {<<"name">>,Record#date.name},
        {<<"readonly">>,if Record#date.readonly == true -> "readonly"; true -> undefined end},
        {<<"required">>,if Record#date.required == true -> "required"; true -> undefined end},      
        {<<"step">>,Record#date.step},
        {<<"type">>, <<"date">>},
        {<<"value">>, Record#date.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).