-module(element_input).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"autofocus">>,Record#input.autofocus},
        {<<"disabled">>, if Record#input.disabled == true -> <<"disabled">>; true -> undefined end},
        {<<"name">>,Record#input.name},
        {<<"type">>, Record#input.type},
        {<<"accept">>, Record#input.accept},
        {<<"max">>, Record#input.max},
        {<<"placeholder">>,Record#input.placeholder},
        {<<"min">>, Record#input.min},
        {<<"multiple">>, Record#input.multiple},
        {<<"pattern">>, Record#input.pattern},
        {<<"value">>, Record#input.value},
        {<<"onkeypress">>, Record#input.onkeypress},
        {<<"onkeyup">>, Record#input.onkeyup},
        {<<"onkeydown">>, Record#input.onkeydown},
        {<<"onclick">>, Record#input.onclick},
        {<<"onchange">>, Record#input.onchange}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).