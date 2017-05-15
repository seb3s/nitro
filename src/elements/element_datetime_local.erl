-module(element_datetime_local).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"autocomplete">>, case Record#datetime_local.autocomplete of true -> "on"; false -> "off"; _ -> undefined end},
        {<<"autofocus">>,if Record#datetime_local.autofocus == true -> "autofocus"; true -> undefined end},
        {<<"disabled">>, if Record#datetime_local.disabled == true -> "disabled"; true -> undefined end},
        {<<"form">>,Record#datetime_local.form},
        {<<"list">>,Record#datetime_local.list},
        {<<"max">>,Record#datetime_local.max},
        {<<"min">>,Record#datetime_local.min},
        {<<"name">>,Record#datetime_local.name},
        {<<"readonly">>,if Record#datetime_local.readonly == true -> "readonly"; true -> undefined end},
        {<<"required">>,if Record#datetime_local.required == true -> "required"; true -> undefined end},      
        {<<"step">>,Record#datetime_local.step},
        {<<"type">>, <<"datetime-local">>},
        {<<"value">>, Record#datetime_local.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).