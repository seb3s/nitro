-module(element_li).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) -> 
    wf_tags:emit_tag(<<"li">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"value">>, Record#li.value}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).