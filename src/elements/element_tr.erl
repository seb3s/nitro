-module(element_tr).
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    Id = nitro:wire_postback(Record),
    wf_tags:emit_tag(<<"tr">>, nitro:render(Record#tr.cells), [
        ?NITRO_GLOBAL_ATTRIBUTES(Id)
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).