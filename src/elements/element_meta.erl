-module(element_meta).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    wf_tags:emit_tag(<<"meta">>, [
      	?NITRO_GLOBAL_ATTRIBUTES,
      	{<<"charset">>, Record#meta.charset},
      	{<<"content">>, Record#meta.content},
      	{<<"http_equiv">>, Record#meta.http_equiv},
      	{<<"name">>, Record#meta.name},
      	{<<"type">>, Record#meta.type}
      	?NITRO_DATA_ARIA_ATTRIBUTES
    ]).