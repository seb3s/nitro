-module(element_meta_link).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"href">>,Record#meta_link.href},
      {<<"hreflang">>,Record#meta_link.hreflang},
      {<<"media">>,Record#meta_link.media},
      {<<"rel">>,Record#meta_link.rel},
      {<<"sizes">>,Record#meta_link.sizes},
      {<<"type">>,Record#meta_link.type}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"link">>, List).