; distilled from 255.vortex
; RUN: llvm-as < %s | opt -globaldce | llvm-dis | not grep testfunc

declare i1 ()* @getfunc()

define internal i1 @testfunc() {
        %F = call i1 ()* ()* @getfunc( )                ; <i1 ()*> [#uses=1]
        %c = icmp eq i1 ()* %F, @testfunc               ; <i1> [#uses=1]
        ret i1 %c
}
