-module(element_fieldset).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"fieldset">>, [
        case Record#fieldset.legend of 
            undefined -> [];
            B -> wf_tags:emit_tag(<<"legend">>, nitro:render(B), [])
        end, 
        nitro:render(element(#element.body, Record))
        ], [
        ?NITRO_GLOBAL_ATTRIBUTES,
        {<<"disabled">>, if Record#fieldset.disabled == true -> "disabled"; true -> undefined end},
        {<<"form">>,Record#fieldset.form},
        {<<"name">>,Record#fieldset.name}
        ?NITRO_DATA_ARIA_ATTRIBUTES
    ]).