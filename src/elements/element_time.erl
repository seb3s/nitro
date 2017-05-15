-module(element_time).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"time">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"datetime">>,Record#time.datetime}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).