-module(element_form).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"form">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"accept-charset">>, Record#form.accept_charset},
        {<<"action">>, Record#form.action},
        {<<"autocomplete">>, case Record#form.autocomplete of true -> <<"on">>; false -> <<"off">>; _ -> undefined end},
        {<<"enctype">>, case nitro:to_binary(Record#form.enctype) of
            <<"application/x-www-form-urlencoded">> -> <<"application/x-www-form-urlencoded">>;
            <<"multipart/form-data">> -> <<"multipart/form-data">>;
            <<"text/plain">> -> <<"text/plain">>;
            _ -> undefined end},
        {<<"method">>, case nitro:to_binary(Record#form.method) of <<"post">> -> <<"post">>; _ -> <<"get">> end},
        {<<"name">>,Record#form.name},
        {<<"novalidate">>, case Record#form.novalidate of true -> <<"novalidate">>; _ -> undefined end},
        {<<"target">>, Record#form.target}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).