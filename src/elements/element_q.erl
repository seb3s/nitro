-module(element_q).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag( <<"q">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"cite">>,Record#q.cite}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).