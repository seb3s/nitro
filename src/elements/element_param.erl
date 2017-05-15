-module(element_param).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"param">>, [
      	?NITRO_GLOBAL_ATTRIBUTES,
      	{<<"name">>,Record#param.name},
      	{<<"value">>,Record#param.value}
      	?NITRO_DATA_ARIA_ATTRIBUTES
    ]).