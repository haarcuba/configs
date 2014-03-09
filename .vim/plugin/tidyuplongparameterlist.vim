function! TidyUpLongParameterList()
python << endpython
import vim
#from vim import *
def _normal( string ):
	vim.command( "normal %s" % string )
def _main():
	call = vim.current.line
	current = vim.current
	index = len( call ) - 1
	while index > 0 and call[ index ] != '(':
		index -= 1
	if index < 0:
		return
	arguments = call[ index + 1 : ]
	current.line = call[ : index + 1 ] 
	words = [ word.strip() for word in arguments.split( ',' ) ]
	TABSTOP = 4
	tabs = ( index + 1 ) / TABSTOP + 1
	tabPrefix = '\t' * tabs
	current.line = current.line + '\t' + words[ 0 ] + ','
	current.range.append( tabPrefix + words[ -1 ] )
	for word in reversed( words[ 1: -1 ] ):
		current.range.append( tabPrefix + word + ',' )
	
_main()
endpython
endfunction

map <F6> :call TidyUpLongParameterList() <CR>
