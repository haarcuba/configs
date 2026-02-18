# Neovim LSP Quick Reference

## Mapped LSP Commands

These `vim.lsp.buf.*` functions are mapped in your config (see `lua/config/lsp.lua`):

| Shortcut      | Function                      | What it does |
|---------------|-------------------------------|--------------|
| `gd`          | `vim.lsp.buf.definition`      | Jump to where the symbol under the cursor is **defined**. The most common way to navigate code — e.g. jump from a function call to its source. |
| `gD`          | `vim.lsp.buf.declaration`     | Jump to the **declaration** of the symbol. In languages like C/C++ this goes to the header declaration rather than the implementation. In many languages this behaves the same as `definition`. |
| `K`           | `vim.lsp.buf.hover`           | Show a floating window with documentation/type info for the symbol under the cursor. Press `K` again (or scroll) to enter the floating window. |
| `gi`          | `vim.lsp.buf.implementation`  | Jump to the **implementation** of an interface or abstract method. Useful in TypeScript/Java where interfaces and implementations are separate. |
| `<leader>rn`  | `vim.lsp.buf.rename`          | Rename the symbol under the cursor **project-wide**. The LSP server handles finding all references across files so the rename is accurate. |
| `<leader>ca`  | `vim.lsp.buf.code_action`     | Show available **code actions** — quick fixes, refactors, and source actions suggested by the LSP server (e.g. "add missing import", "extract to variable"). |
| `gr`          | `vim.lsp.buf.references`      | List all **references** to the symbol under the cursor across the project, shown in the quickfix list. |

## Other Useful LSP Functions (Not Currently Mapped)

These are worth knowing about if you want to add more mappings:

| Function                           | What it does |
|------------------------------------|--------------|
| `vim.lsp.buf.signature_help()`     | Show the **signature** (parameter list and types) of the function you're currently typing arguments for. Typically bound in insert mode. |
| `vim.lsp.buf.type_definition()`    | Jump to the **type definition** of the symbol — e.g. from a variable to the class/interface that defines its type. |
| `vim.lsp.buf.format()`             | **Format** the current buffer (or a range) using the LSP server's formatter. Accepts options like `async = true` and `timeout_ms`. |
| `vim.lsp.buf.document_symbol()`    | List all **symbols** in the current file (functions, classes, variables) — useful for getting an overview of a file's structure. |
| `vim.lsp.buf.workspace_symbol()`   | Search for a symbol by name across the entire **workspace/project**. |
| `vim.lsp.buf.incoming_calls()`     | Show the **call hierarchy** — which functions call the function under the cursor. |
| `vim.lsp.buf.outgoing_calls()`     | The reverse — which functions does the current function **call**. |

## Related: Diagnostics

Your config also maps `Ctrl-W Ctrl-D` to send all LSP **diagnostics** (errors, warnings) to the quickfix list via `vim.diagnostic.setqflist()`. Navigate them with `Ctrl-J` / `Ctrl-K`.
