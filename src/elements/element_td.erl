-module(element_td).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"td">>, nitro:render(element(#element.body, Record)), [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"rowspan">>, Record#td.rowspan},
        {<<"bgcolor">>, Record#td.bgcolor},
        {<<"colspan">>, Record#td.colspan},
        {<<"scope">>, Record#td.scope}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).