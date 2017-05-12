-module(element_source).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"media">>,Record#source.media},
      {<<"type">>,Record#source.type},
      {<<"src">>,Record#source.src}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"source">>, List).