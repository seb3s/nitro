-module(element_area).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"alt">>,Record#area.alt},
      {<<"coords">>,Record#area.coords},
      {<<"href">>,Record#area.href},
      {<<"hreflang">>,Record#area.hreflang},
      {<<"media">>,Record#area.media},
      {<<"rel">>,Record#area.rel},
      {<<"shape">>, case Record#area.shape of "rect" -> "rect"; "circle" -> "circle"; "poly" -> "poly"; "default" -> "default"; _ -> undefined end},
      {<<"target">>,Record#area.target},
      {<<"type">>,Record#area.type} 
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"area">>, List).