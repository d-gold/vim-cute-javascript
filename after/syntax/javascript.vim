" we need the conceal feature (vim ≥ 7.3)
if exists('g:no_js_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif


syntax match jsNiceFunction "\<function\>" conceal cchar=𝐹

" Constants
syntax match jsNull1 contained "\<n" conceal cchar=⊥
syntax match jsNull2 contained "u" conceal cchar=ₙ
syntax match jsNull3 contained "ll\>" conceal cchar= 
syntax match jsNull "\<null\>" contains=jsNull1,jsNull2,jsNull3

syntax match jsUndefined1 contained "\<u" conceal cchar=⊥
syntax match jsUndefined2 contained "n" conceal cchar=ᵤ
syntax match jsUndefined3 contained "defined\>" conceal cchar= 
syntax match jsUndefined "\<undefined\>" contains=jsUndefined1,jsUndefined2,jsUndefined3

syntax match jsTrue1 contained "\<t" conceal cchar= 
syntax match jsTrue2 contained "r" conceal cchar=𝐓
syntax match jsTrue3 contained "ue\>" conceal cchar= 
syntax match jsTrue "\<true\>" contains=jsTrue1,jsTrue2,jsTrue3

syntax match jsFalse1 contained "\<f" conceal cchar= 
syntax match jsFalse2 contained "a" conceal cchar=𝐅
syntax match jsFalse3 contained "lse\>" conceal cchar= 
syntax match jsFalse "\<false\>" contains=jsFalse1,jsFalse2,jsFalse3

" Comparisons
syntax match jsNiceOperator "\s<=\s" conceal cchar=≤
syntax match jsNiceOperator "\s>=\s" conceal cchar=≥
syntax match jsNiceOperator "=\@<!===\@!" conceal cchar=≡
syntax match jsNiceOperator "=\@<!====\@!" conceal cchar=≣
syntax match jsNiceOperator "!=" conceal cchar=≢

" Boolean operations
syntax match jsOr1 contained "\s|" conceal cchar=∨
syntax match jsOr2 contained "|\s" conceal cchar= 
syntax match jsOrFull "\s||\s" contains=jsOr1,jsOr2

syntax match jsAnd1 contained "\s&" conceal cchar=∧
syntax match jsAnd2 contained "&\s" conceal cchar= 
syntax match jsAndFull "\s&&\s" contains=jsAnd1,jsAnd2

syntax match jsNiceOperator "\s&&\s*!" conceal cchar=⊼
syntax match jsNiceOperator "\s||\s*!" conceal cchar=⊽
syntax match jsNiceOperator "\s^\s" conceal cchar=⊻
syntax match jsNiceOperator "\<not\>" conceal cchar=¬
syntax match jsNiceOperator "!" conceal cchar=¬ 

" Types
syntax match jsNiceType "\<Boolean\>" conceal cchar=𝔹
syntax match jsNiceType "\<Integer\>" conceal cchar=ℤ
syntax match jsNiceType "\<Number\>" conceal cchar=ℜ
syntax match jsNiceType "\<boolean\>" conceal cchar=𝔹
syntax match jsNiceType "\<number\>" conceal cchar=ℜ

" Assignment
syntax match jsRLArrow1 contained "\s\+" conceal cchar= 
syntax match jsRLArrow2 contained "=" conceal cchar=←
syntax match jsRLArrow3 contained "\s\+" conceal cchar= 
syntax match jsRLArrowFull "\s\+=\s\+" contains=jsRLArrow1,jsRLArrow2,jsRLArrow3

" Sets
syntax match jsEmptySet1 contained "\s+\[" conceal cchar=∅
syntax match jsEmptySet2 contained "\]" conceal cchar= 
syntax match jsEmptySetFull "\s+\[\]" contains=jsEmptySet1,jsEmptySet2

syntax match jsEmptyMap1 contained "{" conceal cchar=∅
syntax match jsEmptyMap2 contained "\s*}" conceal cchar=ₒ
syntax match jsEmptyMapFull "{\s*}" contains=jsEmptyMap1,jsEmptyMap2,jsEmptyMap3

" Functions
syntax match jsNiceBuiltin "\<length\>" conceal cchar=#
syntax match jsNiceOperator "\<forEach\>" conceal cchar=∀






    syntax keyword jsNiceStatement a conceal cchar=𝒂
    syntax keyword jsNiceStatement b conceal cchar=𝒃
    syntax keyword jsNiceStatement c conceal cchar=𝒄
    syntax keyword jsNiceStatement d conceal cchar=𝒅
    syntax keyword jsNiceStatement e conceal cchar=𝒆
    syntax keyword jsNiceStatement f conceal cchar=𝒇
    syntax keyword jsNiceStatement g conceal cchar=𝒈
    syntax keyword jsNiceStatement h conceal cchar=𝒉
    syntax keyword jsNiceStatement i conceal cchar=𝒊
    syntax keyword jsNiceStatement j conceal cchar=𝒋
    syntax keyword jsNiceStatement k conceal cchar=𝒌
    syntax keyword jsNiceStatement l conceal cchar=𝒍
    syntax keyword jsNiceStatement m conceal cchar=𝒎
    syntax keyword jsNiceStatement n conceal cchar=𝒏
    syntax keyword jsNiceStatement o conceal cchar=𝒐
    syntax keyword jsNiceStatement p conceal cchar=𝒑
    syntax keyword jsNiceStatement q conceal cchar=𝒒
    syntax keyword jsNiceStatement r conceal cchar=𝒓
    syntax keyword jsNiceStatement s conceal cchar=𝒔
    syntax keyword jsNiceStatement t conceal cchar=𝒕
    syntax keyword jsNiceStatement u conceal cchar=𝒖
    syntax keyword jsNiceStatement v conceal cchar=𝒗
    syntax keyword jsNiceStatement w conceal cchar=𝒘
    syntax keyword jsNiceStatement x conceal cchar=𝒙
    syntax keyword jsNiceStatement y conceal cchar=𝒚
    syntax keyword jsNiceStatement z conceal cchar=𝒛


hi link jsNiceOperator Operator

hi! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=LightGreen

setlocal conceallevel=2
setlocal concealcursor=nv

