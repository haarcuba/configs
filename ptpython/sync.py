import ptpython

def myconfig(repl):
    repl.vi_mode = True
    repl.enable_output_formatting = True

ptpython.repl.embed(globals(), locals(), configure=myconfig)
