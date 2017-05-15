-module(element_canvas).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"canvas">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"height">>,Record#canvas.height},
        {<<"width">>,Record#canvas.width}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).