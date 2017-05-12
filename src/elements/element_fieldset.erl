-module(element_fieldset).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"disabled">>, if Record#fieldset.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#fieldset.form},
      {<<"name">>,Record#fieldset.name}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(
      <<"fieldset">>,
      [
        case Record#fieldset.legend of 
          undefined -> [];
          B -> wf_tags:emit_tag(<<"legend">>, nitro:render(B), [])
        end, 
        nitro:render(case Record#fieldset.body of undefined -> []; B -> B end)
      ], 
      List).