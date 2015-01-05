" we need the conceal feature (vim ≥ 7.3)
if exists('g:no_groovy_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif


syntax clear javaScriptFunction
syntax keyword jsNiceFunction function conceal cchar=𝒇

hi link jsNiceFunction Operator
hi! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=LightGreen

setlocal conceallevel=2
setlocal concealcursor=nv

