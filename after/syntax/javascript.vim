" we need the conceal feature (vim ≥ 7.3)
if exists('g:no_js_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif


syntax clear jsBooleanTrue
syntax clear jsBooleanFalse
syntax clear jsNull
syntax clear jsUndefined


syntax clear jsParen
syntax clear jsBlock
syntax clear jsParensError
syntax clear jsBracket



" syntax match jsNiceFunction "\<function\>" conceal cchar=𝐹
"syntax match   jsNiceFunction /\<function\>/ nextgroup=jsFuncName,jsFuncArgs skipwhite conceal cchar=ƒ
"
syntax match jsFunctionAFull /\<function\s*(/me=e-1 conceal cchar=λ

syntax match jsFunctionB1 contained "\<f" conceal cchar=ƒ
syntax match jsFunctionB2 contained /unction\s\+[_A-Za-z]/me=e-1 conceal cchar= 
syntax match jsFunctionBFull /\<function\s\+[_A-Za-z]/ contains=jsFunctionB1,jsFunctionB2

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

syntax match jsInfinity1 contained "\<I" conceal cchar= 
syntax match jsInfinity2 contained "n" conceal cchar=∞
syntax match jsInfinity3 contained "finity\>" conceal cchar= 
syntax match jsInfinity "\<false\>" contains=jsInfinity1,jsInfinity2,jsInfinity3

" Comparisons
syntax match jsNiceOperator "\s<=\s" conceal cchar=≤
syntax match jsNiceOperator "\s>=\s" conceal cchar=≥
syntax match jsNiceOperator /![^=]/me=e-1 conceal cchar=¬ 
syntax match jsNiceOperator "=\@<!===\@!" conceal cchar=≡
syntax match jsNiceOperator "=\@<!====\@!" conceal cchar=≣
syntax match jsNiceOperator "\s\+!=\s\+" conceal cchar=≠

syntax match jsNeqA1 contained "\s\+!" conceal cchar=≢
syntax match jsNeqA2 contained "==\s\+" conceal cchar= 
syntax match jsNeqAFull "\s\+!==\s\+" contains=jsNeqA1,jsNeqA2

syntax match jsNiceOperator "\s\+==\s*!" conceal cchar=≠

syntax match jsNeqB1 contained "\s\+=" conceal cchar=≢
syntax match jsNeqB2 contained "==\s*!" conceal cchar= 
syntax match jsNeqBFull "\s\+===\s*!" contains=jsNeqB1,jsNeqB2

" Boolean operations
syntax match jsOr1 contained "\s|" conceal cchar=∨
syntax match jsOr2 contained "|\s" conceal cchar= 
syntax match jsOrFull "\s||\s" contains=jsOr1,jsOr2

syntax match jsAnd1 contained "\s&" conceal cchar=∧
syntax match jsAnd2 contained "&\s" conceal cchar= 
syntax match jsAndFull "\s&&\s" contains=jsAnd1,jsAnd2

syntax match jsNor1 contained "\s|" conceal cchar=⊽
syntax match jsNor2 contained "|\s*!" conceal cchar= 
syntax match jsNorFull "\s||\s*!" contains=jsNor1,jsNor2

syntax match jsNand1 contained "\s&" conceal cchar=⊼
syntax match jsNand2 contained "&\s*!" conceal cchar= 
syntax match jsNandFull "\s&&\s*!" contains=jsNand1,jsNand2

syntax match jsNiceOperator "\s^\s" conceal cchar=⊻
syntax match jsNiceOperator "\<not\>" conceal cchar=¬

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
syntax match jsEmptySet1 contained "\s\+\[\s*" conceal cchar=∅
syntax match jsEmptySet2 contained "\]" conceal cchar= 
syntax match jsEmptySetFull "\s\+\[\s*\]" contains=jsEmptySet1,jsEmptySet2

syntax match jsEmptyMap1 contained "{" conceal cchar=∅
syntax match jsEmptyMap2 contained "\s*}" conceal cchar=ₒ
syntax match jsEmptyMapFull "{\s*}" contains=jsEmptyMap1,jsEmptyMap2,jsEmptyMap3

" Functions
syntax match jsLength1 contained "\<l" conceal cchar=#
syntax match jsLength2 contained "ength" conceal cchar=ₗ
syntax match jsLength "\<length\>" contains=jsLength1,jsLength2
syntax match jsNiceOperator "\<forEach\>" conceal cchar=∀

syntax keyword jsNiceReturn return conceal cchar=↵


syntax match jsArrow /\s+=>\s+/ conceal cchar=→
"syntax match jsArrow /\s+=>\s+/ conceal cchar=⇒

" Mongo

syntax match jsMongoWhere1 contained "\$" conceal cchar=∵
syntax match jsMongoWhere2 contained "where\>" conceal cchar= 
syntax match jsMongoWhere "\$where\>" contains=jsMongoWhere1,jsMongoWhere2

" syntax match jsMongoExists1 contained "\$" conceal cchar=∃
" syntax match jsMongoExists2 contained "exists\>" conceal cchar= 
" syntax match jsMongoExists "\$exists\>" contains=jsMongoExists1,jsMongoExists2

syntax match jsMongoIn1 contained "\$" conceal cchar=∃
syntax match jsMongoIn2 contained "in\>" conceal cchar= 
syntax match jsMongoIn "\$in\>" contains=jsMongoIn1,jsMongoIn2

syntax match jsMongoNin1 contained "\$" conceal cchar=∄
syntax match jsMongoNin2 contained "nin\>" conceal cchar= 
syntax match jsMongoNin "\$nin\>" contains=jsMongoNin1,jsMongoNin2

syntax match jsMongoAll1 contained "\$" conceal cchar=∀
syntax match jsMongoAll2 contained "all\>" conceal cchar= 
syntax match jsMongoAll "\$all\>" contains=jsMongoAll1,jsMongoAll2

syntax match jsMongoSize1 contained "\$" conceal cchar=#
syntax match jsMongoSize2 contained "size\>" conceal cchar= 
syntax match jsMongoSize "\$size\>" contains=jsMongoSize1,jsMongoSize2

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

