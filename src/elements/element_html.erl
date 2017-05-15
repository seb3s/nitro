-module(element_html).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"html">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"manifest">>, Record#html.manifest}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).