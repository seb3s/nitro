-module(element_del).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"cite">>, Record#del.cite},
      {<<"datetime">>, Record#del.datetime}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"del">>, nitro:render(case Record#del.body of undefined -> []; B -> B end), List).