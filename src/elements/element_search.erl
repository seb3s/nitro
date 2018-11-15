-module(element_search).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"autocomplete">>, case Record#search.autocomplete of true -> <<"on">>; false -> <<"off">>; _ -> undefined end},
        {<<"autofocus">>,if Record#search.autofocus == true -> <<"autofocus">>; true -> undefined end},
        {<<"dirname">>,Record#search.dirname},
        {<<"disabled">>, if Record#search.disabled == true -> <<"disabled">>; true -> undefined end},
        {<<"form">>,Record#search.form},
        {<<"list">>,Record#search.list},
        {<<"maxlength">>,Record#search.maxlength},
        {<<"name">>,Record#search.name},
        {<<"pattern">>,Record#search.pattern},
        {<<"placeholder">>,Record#search.placeholder},
        {<<"readonly">>,if Record#search.readonly == true -> <<"readonly">>; true -> undefined end},
        {<<"required">>,if Record#search.required == true -> <<"required">>; true -> undefined end},
        {<<"size">>,Record#search.size},
        {<<"type">>, <<"search">>},
        {<<"value">>, Record#search.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).