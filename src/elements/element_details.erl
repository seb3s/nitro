-module(element_details).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"open">>, case Record#details.open of true -> "open"; _ -> undefined end}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"details">>, nitro:render(case Record#details.body of undefined -> []; B -> B end), List).