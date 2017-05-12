-module(element_ins).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"cite">>, Record#ins.cite},
      {<<"datetime">>, Record#ins.datetime}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"ins">>, nitro:render(case Record#ins.body of undefined -> []; B -> B end), List).