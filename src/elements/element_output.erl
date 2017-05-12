-module(element_output).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"for">>,Record#output.for},
      {<<"form">>,Record#output.form},
      {<<"name">>,Record#output.name}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"output">>, nitro:render(case Record#output.body of undefined -> []; B -> B end), List).