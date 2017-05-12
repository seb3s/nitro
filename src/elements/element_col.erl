-module(element_col).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"span">>,Record#col.span}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"col">>, nitro:render(case Record#col.body of undefined -> []; B -> B end), List).