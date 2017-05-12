-module(element_command).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"disabled">>, if Record#command.disabled == true -> "disabled"; true -> undefined end},
      {<<"icon">>, Record#command.icon},
      {<<"label">>, Record#command.label},
      {<<"radiogroup">>, Record#command.radiogroup},
      {<<"type">>, case Record#command.type of "command" -> "command"; "radio" -> "radio"; "checkbox" -> "checkbox"; _ -> undefined end}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"command">>, List).