-module(element_input_image).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"input">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id),
        {<<"alt">>,Record#input_image.alt},
        {<<"autofocus">>,if Record#input_image.autofocus == true -> <<"autofocus">>; true -> undefined end},
        {<<"disabled">>, if Record#input_image.disabled == true -> <<"disabled">>; true -> undefined end},
        {<<"form">>,Record#input_image.form},
        {<<"formaction">>,Record#input_image.formaction},
        {<<"formenctype">>,Record#input_image.formenctype},
        {<<"formmethod">>,Record#input_image.formmethod},
        {<<"formnovalue">>,Record#input_image.formnovalue},
        {<<"formtarget">>,Record#input_image.formtarget},
        {<<"height">>,Record#input_image.height},
        {<<"name">>,Record#input_image.name},
        {<<"src">>,Record#input_image.src},
        {<<"type">>, <<"image">>},
        {<<"width">>,Record#input_image.width}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).