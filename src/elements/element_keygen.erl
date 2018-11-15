-module(element_keygen).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"keygen">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"autofocus">>,if Record#keygen.autofocus == true -> <<"autofocus">>; true -> undefined end},
        {<<"challenge">>,Record#keygen.challenge},
        {<<"disabled">>, if Record#keygen.disabled == true -> <<"disabled">>; true -> undefined end},
        {<<"form">>,Record#keygen.form},
        {<<"keytype">>,<<"rsa">>},
        {<<"name">>,Record#keygen.name}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).