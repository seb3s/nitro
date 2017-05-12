-module(element_menu).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"label">>, Record#menu.label},
      {<<"type">>, case Record#menu.type of "toolbar" -> "toolbar"; "context" -> "context"; _ -> undefined end}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"menu">>, nitro:render(case Record#menu.body of undefined -> []; B -> B end), List).