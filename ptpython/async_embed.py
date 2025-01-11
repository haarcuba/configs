#async
import ptpython.repl
# await ptpython.repl.embed(globals(), locals(), vi_mode=True, patch_stdout=True, return_asyncio_coroutine=True)

def myconfig(repl):
    repl.vi_mode = True
    repl.enable_output_formatting = True
    repl.patch_stdout = True
    repl.return_asyncio_coroutine = True

await ptpython.repl.embed(globals(), locals(), configure=myconfig)
