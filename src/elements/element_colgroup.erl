-module(element_colgroup).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"colgroup">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"span">>,Record#colgroup.span}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).