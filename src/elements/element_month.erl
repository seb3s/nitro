-module(element_month).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"alt">>,Record#month.alt},
        {<<"autofocus">>,if Record#month.autofocus == true -> <<"autofocus">>; true -> undefined end},
        {<<"disabled">>, if Record#month.disabled == true -> <<"disabled">>; true -> undefined end},
        {<<"form">>,Record#month.form},
        {<<"max">>,Record#month.max},
        {<<"min">>,Record#month.min},
        {<<"name">>,Record#month.name},
        {<<"readonly">>,if Record#month.readonly == true -> <<"readonly">>; true -> undefined end},
        {<<"required">>,if Record#month.required == true -> <<"required">>; true -> undefined end},
        {<<"step">>,Record#month.step},
        {<<"type">>, <<"month">>},
        {<<"value">>, Record#month.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).