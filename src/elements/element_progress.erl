-module(element_progress).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"max">>,Record#progress.max},
      {<<"value">>,Record#progress.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"progress">>, nitro:render(case Record#progress.body of undefined -> []; B -> B end), List).