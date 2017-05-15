-module(element_meta_base).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"base">>, [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"href">>,Record#base.href},
        {<<"target">>,Record#base.target}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).