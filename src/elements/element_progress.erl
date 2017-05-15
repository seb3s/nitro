-module(element_progress).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"progress">>, nitro:render(element(#element.body, Record)), [
      	?NITRO_GLOBAL_ATTRIBUTES,
      	{<<"max">>,Record#progress.max},
      	{<<"value">>,Record#progress.value}
      	?NITRO_DATA_ARIA_ATTRIBUTES
    ]).