CodeHighlighter.addStyle("ruby",{
	comment : {
		exp  : /#[^\n]*/
	},
	brackets : {
		exp  : /\(|\)|\[|\]|\{|\}/
	},
	string : {
		exp  : /'[^']*'|"[^"]*"/
	},
	keywords : {
		exp  : /\b(do|end|self|class|def|if|module|yield|then|else|for|until|unless|while|elsif|case|when|break|retry|redo|rescue|require|raise)\b/
	},
	constants : {
	  exp  : /\b(true|false|__[A-Z][^\W]+|[A-Z]\w+)\b/
	},
	symbol : {
	  exp  : /:[^\W]+/
	},
	instance : {
	  exp  : /@+[^\W]+/
	},
	method : {
	  exp  : /[^\w]*\.(\w*)[!?]*/
	}
});