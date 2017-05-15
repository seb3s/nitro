-module(element_map).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"map">>, nitro:render(element(#element.body, Record)), [
      	?NITRO_GLOBAL_ATTRIBUTES,
      	{<<"name">>,Record#map.name}
      	?NITRO_DATA_ARIA_ATTRIBUTES
    ]).