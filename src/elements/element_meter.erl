-module(element_meter).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"high">>,Record#meter.high},
      {<<"low">>,Record#meter.low},
      {<<"max">>,Record#meter.max},
      {<<"min">>,Record#meter.min},
      {<<"optimum">>,Record#meter.optimum},
      {<<"value">>, Record#meter.value}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"meter">>, nitro:render(case Record#meter.body of undefined -> []; B -> B end), List).