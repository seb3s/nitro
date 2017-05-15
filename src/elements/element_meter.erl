-module(element_meter).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"meter">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"high">>,Record#meter.high},
        {<<"low">>,Record#meter.low},
        {<<"max">>,Record#meter.max},
        {<<"min">>,Record#meter.min},
        {<<"optimum">>,Record#meter.optimum},
        {<<"value">>, Record#meter.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).