-module(element_image).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"img">>, [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"alt">>, Record#image.alt},
        {<<"width">>, Record#image.width},
        {<<"height">>, Record#image.height},
        {<<"src">>, nitro:coalesce([Record#image.src, Record#image.image])}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).