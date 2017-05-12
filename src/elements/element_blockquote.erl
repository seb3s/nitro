-module (element_blockquote).
-author('Andrew Zadorozhny').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
  wf_tags:emit_tag(<<"blockquote">>, nitro:render(Record#blockquote.body), [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"cite">>, Record#blockquote.cite}
      ?NITRO_DATA_ARIA_ATTRIBUTES
  ]).