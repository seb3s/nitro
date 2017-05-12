-module(element_textarea).
-author('Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) ->
    List = [
      ?NITRO_GLOBAL_ATTRIBUTES,
      {<<"autofocus">>,if Record#textarea.autofocus == true -> "autofocus"; true -> undefined end},
      {<<"cols">>,Record#textarea.cols},
      {<<"dirname">>,Record#textarea.dirname},      
      {<<"disabled">>, if Record#textarea.disabled == true -> "disabled"; true -> undefined end},
      {<<"form">>,Record#textarea.form},
      {<<"maxlength">>,Record#textarea.maxlength},      
      {<<"name">>,Record#textarea.name},
      {<<"placeholder">>,Record#textarea.placeholder},
      {<<"readonly">>,if Record#textarea.readonly == true -> "readonly"; true -> undefined end},
      {<<"required">>,if Record#textarea.required == true -> "required"; true -> undefined end},
      {<<"rows">>,Record#textarea.rows},      
      {<<"form">>,Record#textarea.wrap},
      {<<"value">>,Record#textarea.value},
      {<<"wrap">>, case Record#textarea.wrap of "hard" -> "hard"; "soft" -> "soft"; _ -> undefined end}
      ?NITRO_DATA_ARIA_ATTRIBUTES
    ],
    wf_tags:emit_tag(<<"textarea">>, nitro:render(case Record#textarea.body of undefined -> []; B -> B end), List).