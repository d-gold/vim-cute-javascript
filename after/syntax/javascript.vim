" Cf - check a flag. Return true if the flag is specified.
function! Cf(flag)
    return exists('g:jscoptions') && stridx(g:jscoptions, a:flag) >= 0
endfunction

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

" There Exists and For All handling
if ! Cf('A')
    syntax match jsNiceOperator "\<forEach\>" conceal cchar=∀

    syntax match jsExists1 contained "\." conceal cchar=.
    syntax match jsExists2 contained "e" conceal cchar=∃
    syntax match jsExists3 contained "\.exists\>" conceal cchar= 
    syntax match jsExists "\.exists\>" contains=jsExists1,jsExists2,jsExists3
else
    syntax match jsEvery1 contained "\<e" conceal cchar=∀
    syntax match jsEvery2 contained "every" conceal cchar= 
    syntax match jsEvery "\<every\>" contains=jsEvery1,jsEvery2

    syntax match jsSome contained "\." conceal cchar=.
    syntax match jsSome contained "s" conceal cchar=∃
    syntax match jsSome contained "ome\>" conceal cchar= 
    syntax match jsSome"\.some\>" contains=jsSome,jsSome,jsSome
endif



syntax keyword jsNiceReturn return conceal cchar=↵

" Maths

syntax match jsInfinity1 contained "\<I" conceal cchar= 
syntax match jsInfinity2 contained "n" conceal cchar=∞
syntax match jsInfinity3 contained "finity\>" conceal cchar= 
syntax match jsInfinity "\<Infinity\>" contains=jsInfinity1,jsInfinity2,jsInfinity3

syntax match jsNiceOperator "\<ceil\>" conceal cchar=⌈
syntax match jsNiceOperator "\<floor\>" conceal cchar=⌊


syntax match jsArrow /\s+=>\s+/ conceal cchar=→
"syntax match jsArrow /\s+=>\s+/ conceal cchar=⇒

" Mongo

if !Cf('M')
    syntax match jsMongoWhere1 contained "\$" conceal cchar=∵
    syntax match jsMongoWhere2 contained "where\>" conceal cchar= 
    syntax match jsMongoWhere "\$where\>" contains=jsMongoWhere1,jsMongoWhere2


    syntax match jsMongoExists1 contained "\$" conceal cchar=$
    syntax match jsMongoExists2 contained "e" conceal cchar=∃
    syntax match jsMongoExists3 contained "xists\>" conceal cchar= 
    syntax match jsMongoExists "\$exists\>" contains=jsMongoExists1,jsMongoExists2,jsMongoExists3

    " syntax match jsMongoIn1 contained "\$" conceal cchar=$
    " syntax match jsMongoIn2 contained "\i" conceal cchar=∃
    " syntax match jsMongoIn3 contained "n\>" conceal cchar= 
    " syntax match jsMongoIn "\$in\>" contains=jsMongoIn1,jsMongoIn2,jsMongoIn3

    syntax match jsMongoNin1 contained "\$" conceal cchar=$
    syntax match jsMongoNin2 contained "n" conceal cchar=∄
    syntax match jsMongoNin3 contained "in\>" conceal cchar= 
    syntax match jsMongoNin "\$nin\>" contains=jsMongoNin1,jsMongoNin2,jsMongoNin3

    syntax match jsMongoAll1 contained "\$" conceal cchar=$
    syntax match jsMongoAll2 contained "a" conceal cchar=∀
    syntax match jsMongoAll3 contained "ll\>" conceal cchar= 
    syntax match jsMongoAll "\$all\>" contains=jsMongoAll1,jsMongoAll2,jsMongoAll3

    syntax match jsMongoSize1 contained "\$" conceal cchar=$
    syntax match jsMongoSize2 contained "s" conceal cchar=#
    syntax match jsMongoSize3 contained "ize\>" conceal cchar= 
    syntax match jsMongoSize "\$size\>" contains=jsMongoSize1,jsMongoSize2,sMongoSize3
endif

if !Cf('S')
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
endif

if Cf('s')
    syntax keyword jsNiceStatement A conceal cchar=𝐴
    syntax keyword jsNiceStatement B conceal cchar=𝐵
    syntax keyword jsNiceStatement C conceal cchar=𝐶
    syntax keyword jsNiceStatement D conceal cchar=𝐷
    syntax keyword jsNiceStatement E conceal cchar=𝐸
    syntax keyword jsNiceStatement F conceal cchar=𝐹
    syntax keyword jsNiceStatement G conceal cchar=𝐺
    syntax keyword jsNiceStatement H conceal cchar=𝐻
    syntax keyword jsNiceStatement I conceal cchar=𝐼
    syntax keyword jsNiceStatement J conceal cchar=𝐽
    syntax keyword jsNiceStatement K conceal cchar=𝐾
    syntax keyword jsNiceStatement L conceal cchar=𝐿
    syntax keyword jsNiceStatement M conceal cchar=𝑀
    syntax keyword jsNiceStatement N conceal cchar=𝑁
    syntax keyword jsNiceStatement O conceal cchar=𝑂
    syntax keyword jsNiceStatement P conceal cchar=𝑃
    syntax keyword jsNiceStatement Q conceal cchar=𝑄
    syntax keyword jsNiceStatement R conceal cchar=𝑅
    syntax keyword jsNiceStatement S conceal cchar=𝑆
    syntax keyword jsNiceStatement T conceal cchar=𝑇
    syntax keyword jsNiceStatement U conceal cchar=𝑈
    syntax keyword jsNiceStatement V conceal cchar=𝑉
    syntax keyword jsNiceStatement W conceal cchar=𝑊
    syntax keyword jsNiceStatement X conceal cchar=𝑋
    syntax keyword jsNiceStatement Y conceal cchar=𝑌
    syntax keyword jsNiceStatement Z conceal cchar=𝑍
endif

" Handle exponentiation
" '1' option to disable numeric superscripts concealing, e.g. x².
if !Cf('1')
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)0\>" conceal cchar=⁰
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)1\>" conceal cchar=¹
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)2\>" conceal cchar=²
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)3\>" conceal cchar=³
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)4\>" conceal cchar=⁴
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)5\>" conceal cchar=⁵
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)6\>" conceal cchar=⁶
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)7\>" conceal cchar=⁷
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)8\>" conceal cchar=⁸
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)9\>" conceal cchar=⁹
endif 

" 'a' option to disable alphabet superscripts concealing, e.g. xⁿ.
if !Cf('a')
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)a\>" conceal cchar=ᵃ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)b\>" conceal cchar=ᵇ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)c\>" conceal cchar=ᶜ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)d\>" conceal cchar=ᵈ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)e\>" conceal cchar=ᵉ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)f\>" conceal cchar=ᶠ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)g\>" conceal cchar=ᵍ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)h\>" conceal cchar=ʰ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)i\>" conceal cchar=ⁱ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)j\>" conceal cchar=ʲ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)k\>" conceal cchar=ᵏ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)l\>" conceal cchar=ˡ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)m\>" conceal cchar=ᵐ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)n\>" conceal cchar=ⁿ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)o\>" conceal cchar=ᵒ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)p\>" conceal cchar=ᵖ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)r\>" conceal cchar=ʳ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)s\>" conceal cchar=ˢ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)t\>" conceal cchar=ᵗ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)u\>" conceal cchar=ᵘ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)v\>" conceal cchar=ᵛ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)w\>" conceal cchar=ʷ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)x\>" conceal cchar=ˣ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)y\>" conceal cchar=ʸ
    syntax match jsNiceOperator "\( \|\)\*\*\( \|\)z\>" conceal cchar=ᶻ
endif



" Fractions
" 'f' option to enables fractions
if Cf('f')
    syntax match jsNiceBuiltin "\<0.250*\>" conceal cchar=¼
    syntax match jsNiceBuiltin "\<0.50*\>" conceal cchar=½
    syntax match jsNiceBuiltin "\<0.750*\>" conceal cchar=¾
    " ⅓ ¼ ⅕ ⅙ ⅛  ⅔ ⅖  ¾ ⅗ ⅜  ⅘  ⅚ ⅝a ⅞
" ¼   &frac14;    &#188;  &#xBC;
" VULGAR FRACTION 1/2 ½   &frac12;    &#189;  &#xBD;
" VULGAR FRACTION 3/4 ¾   &frac34;    &#190;  &#xBE;
" VULGAR FRACTION 1/3 ⅓   --  &#8531; &#x2153;
" VULGAR FRACTION 2/3 ⅔   --  &#8532; &#x2154;
" VULGAR FRACTION 1/5 ⅕   --  &#8533; &#x2155;
" VULGAR FRACTION 2/5 ⅖   --  &#8354; &#x2156;
" VULGAR FRACTION 3/5 ⅗   --  &#8535; &#x2157;
" VULGAR FRACTION 4/5 ⅘   --  &#8536; &#x2158;
" VULGAR FRACTION 1/6 ⅙   --  &#8537; &#x2159;
" VULGAR FRACTION 5/6 ⅚   --  &#8538; &#x215A;
" VULGAR FRACTION 1/8 ⅛   --  &#8539; &#x215B;
" VULGAR FRACTION 3/8 ⅜   --  &#8540; &#x215C;
" VULGAR FRACTION 5/8 ⅝   --  &#8541; &#x215D;
" VULGAR FRACTION 7/8 ⅞
endif 


hi link jsNiceOperator Operator
hi! link Conceal Operator
hi! Conceal ctermbg=Black ctermfg=LightGreen

setlocal conceallevel=2
setlocal concealcursor=nv

