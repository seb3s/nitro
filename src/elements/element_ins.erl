-module(element_ins).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"ins">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"cite">>, Record#ins.cite},
        {<<"datetime">>, Record#ins.datetime}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).