-module(element_textbox).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) -> 
  List = [
    ?NITRO_GLOBAL_ATTRIBUTES,
    {<<"type">>, <<"text">>},
    {<<"maxlength">>,Record#textbox.maxlength},
    {<<"name">>,Record#textbox.name},
    {<<"placeholder">>,Record#textbox.placeholder},
    {<<"value">>, Record#textbox.value},
    {<<"disabled">>,if Record#textbox.disabled == true -> "disabled"; true -> undefined end},
    {<<"autofocus">>,Record#textbox.autofocus},
    {<<"readonly">>,if Record#textbox.readonly == true -> "readonly"; true -> undefined end},
    {<<"required">>,if Record#textbox.required == true -> "required"; true -> undefined end}
    ?NITRO_DATA_ARIA_ATTRIBUTES
  ],
  wf_tags:emit_tag(<<"input">>, nitro:render(Record#textbox.body), List).