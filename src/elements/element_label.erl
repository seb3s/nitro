-module(element_label).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) -> 
    wf_tags:emit_tag(<<"label">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"for">>, Record#label.for},
        {<<"onclick">>, Record#label.onclick}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).