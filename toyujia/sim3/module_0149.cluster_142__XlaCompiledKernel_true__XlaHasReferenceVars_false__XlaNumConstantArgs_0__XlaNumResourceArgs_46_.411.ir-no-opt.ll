target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@2 = private unnamed_addr constant [4 x i8] zeroinitializer
@3 = private unnamed_addr constant [4 x i8] c"\00\00\80\FF"
@4 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@5 = private unnamed_addr constant [4 x i8] c"\00\00\80\FF"
@6 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@7 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"

define void @concatenate_11(ptr noalias align 16 dereferenceable(31719424) %arg0, ptr noalias align 16 dereferenceable(8388608) %arg1, ptr noalias align 16 dereferenceable(8388608) %arg2, ptr noalias align 128 dereferenceable(48496640) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3031040
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 1480
  %5 = udiv i32 %linear_index_base, 1480
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 1480
  %8 = udiv i32 %linear_index1, 1480
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 1480
  %11 = udiv i32 %linear_index2, 1480
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 1480
  %14 = udiv i32 %linear_index3, 1480
  %15 = icmp ult i32 %linear_index_base, 12124160
  br i1 %15, label %concatenate_11.in_bounds-true, label %concatenate_11.in_bounds-after

concatenate_11.in_bounds-after:                   ; preds = %concatenate.4.merge21, %entry
  ret void

concatenate_11.in_bounds-true:                    ; preds = %entry
  br label %concatenate.pivot.968.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %16 = phi i32 [ 0, %concatenate.pivot.0. ]
  %17 = sub nsw i32 %4, %16
  %18 = udiv i32 %linear_index_base, 1480
  %19 = mul i32 %18, 968
  %20 = add i32 %19, %17
  %21 = udiv i32 %20, 1
  %22 = urem i32 %21, 968
  %23 = udiv i32 %20, 968
  %24 = getelementptr inbounds float, ptr %arg0, i32 %20
  %25 = load float, ptr %24, align 4, !invariant.load !38
  br label %concatenate.4.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.968.1
  %26 = phi i32 [ 968, %concatenate.pivot.968.1 ]
  %27 = sub nsw i32 %4, %26
  %28 = udiv i32 %linear_index_base, 1480
  %29 = mul i32 %28, 256
  %30 = add i32 %29, %27
  %31 = udiv i32 %30, 1
  %32 = urem i32 %31, 256
  %33 = udiv i32 %30, 256
  %34 = getelementptr inbounds float, ptr %arg1, i32 %30
  %35 = load float, ptr %34, align 4, !invariant.load !38
  br label %concatenate.4.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.1224.2
  %36 = phi i32 [ 1224, %concatenate.pivot.1224.2 ]
  %37 = sub nsw i32 %4, %36
  %38 = udiv i32 %linear_index_base, 1480
  %39 = mul i32 %38, 256
  %40 = add i32 %39, %37
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 256
  %43 = udiv i32 %40, 256
  %44 = getelementptr inbounds float, ptr %arg2, i32 %40
  %45 = load float, ptr %44, align 4, !invariant.load !38
  br label %concatenate.4.merge

concatenate.pivot.968.:                           ; preds = %concatenate_11.in_bounds-true
  %46 = icmp ult i32 %4, 968
  br i1 %46, label %concatenate.pivot.0., label %concatenate.pivot.1224.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.968.
  br label %concat_index_from_operand_id0

concatenate.pivot.1224.:                          ; preds = %concatenate.pivot.968.
  %47 = icmp ult i32 %4, 1224
  br i1 %47, label %concatenate.pivot.968.1, label %concatenate.pivot.1224.2

concatenate.pivot.968.1:                          ; preds = %concatenate.pivot.1224.
  br label %concat_index_from_operand_id1

concatenate.pivot.1224.2:                         ; preds = %concatenate.pivot.1224.
  br label %concat_index_from_operand_id2

concatenate.4.merge:                              ; preds = %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %48 = phi float [ %25, %concat_index_from_operand_id0 ], [ %35, %concat_index_from_operand_id1 ], [ %45, %concat_index_from_operand_id2 ]
  %49 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %48, ptr %49, align 4
  br label %concatenate.pivot.968.7

concat_index_from_operand_id04:                   ; preds = %concatenate.pivot.0.8
  %50 = phi i32 [ 0, %concatenate.pivot.0.8 ]
  %51 = sub nsw i32 %7, %50
  %52 = udiv i32 %linear_index1, 1480
  %53 = mul i32 %52, 968
  %54 = add i32 %53, %51
  %55 = udiv i32 %54, 1
  %56 = urem i32 %55, 968
  %57 = udiv i32 %54, 968
  %58 = getelementptr inbounds float, ptr %arg0, i32 %54
  %59 = load float, ptr %58, align 4, !invariant.load !38
  br label %concatenate.4.merge3

concat_index_from_operand_id15:                   ; preds = %concatenate.pivot.968.10
  %60 = phi i32 [ 968, %concatenate.pivot.968.10 ]
  %61 = sub nsw i32 %7, %60
  %62 = udiv i32 %linear_index1, 1480
  %63 = mul i32 %62, 256
  %64 = add i32 %63, %61
  %65 = udiv i32 %64, 1
  %66 = urem i32 %65, 256
  %67 = udiv i32 %64, 256
  %68 = getelementptr inbounds float, ptr %arg1, i32 %64
  %69 = load float, ptr %68, align 4, !invariant.load !38
  br label %concatenate.4.merge3

concat_index_from_operand_id26:                   ; preds = %concatenate.pivot.1224.11
  %70 = phi i32 [ 1224, %concatenate.pivot.1224.11 ]
  %71 = sub nsw i32 %7, %70
  %72 = udiv i32 %linear_index1, 1480
  %73 = mul i32 %72, 256
  %74 = add i32 %73, %71
  %75 = udiv i32 %74, 1
  %76 = urem i32 %75, 256
  %77 = udiv i32 %74, 256
  %78 = getelementptr inbounds float, ptr %arg2, i32 %74
  %79 = load float, ptr %78, align 4, !invariant.load !38
  br label %concatenate.4.merge3

concatenate.pivot.968.7:                          ; preds = %concatenate.4.merge
  %80 = icmp ult i32 %7, 968
  br i1 %80, label %concatenate.pivot.0.8, label %concatenate.pivot.1224.9

concatenate.pivot.0.8:                            ; preds = %concatenate.pivot.968.7
  br label %concat_index_from_operand_id04

concatenate.pivot.1224.9:                         ; preds = %concatenate.pivot.968.7
  %81 = icmp ult i32 %7, 1224
  br i1 %81, label %concatenate.pivot.968.10, label %concatenate.pivot.1224.11

concatenate.pivot.968.10:                         ; preds = %concatenate.pivot.1224.9
  br label %concat_index_from_operand_id15

concatenate.pivot.1224.11:                        ; preds = %concatenate.pivot.1224.9
  br label %concat_index_from_operand_id26

concatenate.4.merge3:                             ; preds = %concat_index_from_operand_id26, %concat_index_from_operand_id15, %concat_index_from_operand_id04
  %82 = phi float [ %59, %concat_index_from_operand_id04 ], [ %69, %concat_index_from_operand_id15 ], [ %79, %concat_index_from_operand_id26 ]
  %83 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %82, ptr %83, align 4
  br label %concatenate.pivot.968.16

concat_index_from_operand_id013:                  ; preds = %concatenate.pivot.0.17
  %84 = phi i32 [ 0, %concatenate.pivot.0.17 ]
  %85 = sub nsw i32 %10, %84
  %86 = udiv i32 %linear_index2, 1480
  %87 = mul i32 %86, 968
  %88 = add i32 %87, %85
  %89 = udiv i32 %88, 1
  %90 = urem i32 %89, 968
  %91 = udiv i32 %88, 968
  %92 = getelementptr inbounds float, ptr %arg0, i32 %88
  %93 = load float, ptr %92, align 4, !invariant.load !38
  br label %concatenate.4.merge12

concat_index_from_operand_id114:                  ; preds = %concatenate.pivot.968.19
  %94 = phi i32 [ 968, %concatenate.pivot.968.19 ]
  %95 = sub nsw i32 %10, %94
  %96 = udiv i32 %linear_index2, 1480
  %97 = mul i32 %96, 256
  %98 = add i32 %97, %95
  %99 = udiv i32 %98, 1
  %100 = urem i32 %99, 256
  %101 = udiv i32 %98, 256
  %102 = getelementptr inbounds float, ptr %arg1, i32 %98
  %103 = load float, ptr %102, align 4, !invariant.load !38
  br label %concatenate.4.merge12

concat_index_from_operand_id215:                  ; preds = %concatenate.pivot.1224.20
  %104 = phi i32 [ 1224, %concatenate.pivot.1224.20 ]
  %105 = sub nsw i32 %10, %104
  %106 = udiv i32 %linear_index2, 1480
  %107 = mul i32 %106, 256
  %108 = add i32 %107, %105
  %109 = udiv i32 %108, 1
  %110 = urem i32 %109, 256
  %111 = udiv i32 %108, 256
  %112 = getelementptr inbounds float, ptr %arg2, i32 %108
  %113 = load float, ptr %112, align 4, !invariant.load !38
  br label %concatenate.4.merge12

concatenate.pivot.968.16:                         ; preds = %concatenate.4.merge3
  %114 = icmp ult i32 %10, 968
  br i1 %114, label %concatenate.pivot.0.17, label %concatenate.pivot.1224.18

concatenate.pivot.0.17:                           ; preds = %concatenate.pivot.968.16
  br label %concat_index_from_operand_id013

concatenate.pivot.1224.18:                        ; preds = %concatenate.pivot.968.16
  %115 = icmp ult i32 %10, 1224
  br i1 %115, label %concatenate.pivot.968.19, label %concatenate.pivot.1224.20

concatenate.pivot.968.19:                         ; preds = %concatenate.pivot.1224.18
  br label %concat_index_from_operand_id114

concatenate.pivot.1224.20:                        ; preds = %concatenate.pivot.1224.18
  br label %concat_index_from_operand_id215

concatenate.4.merge12:                            ; preds = %concat_index_from_operand_id215, %concat_index_from_operand_id114, %concat_index_from_operand_id013
  %116 = phi float [ %93, %concat_index_from_operand_id013 ], [ %103, %concat_index_from_operand_id114 ], [ %113, %concat_index_from_operand_id215 ]
  %117 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %116, ptr %117, align 4
  br label %concatenate.pivot.968.25

concat_index_from_operand_id022:                  ; preds = %concatenate.pivot.0.26
  %118 = phi i32 [ 0, %concatenate.pivot.0.26 ]
  %119 = sub nsw i32 %13, %118
  %120 = udiv i32 %linear_index3, 1480
  %121 = mul i32 %120, 968
  %122 = add i32 %121, %119
  %123 = udiv i32 %122, 1
  %124 = urem i32 %123, 968
  %125 = udiv i32 %122, 968
  %126 = getelementptr inbounds float, ptr %arg0, i32 %122
  %127 = load float, ptr %126, align 4, !invariant.load !38
  br label %concatenate.4.merge21

concat_index_from_operand_id123:                  ; preds = %concatenate.pivot.968.28
  %128 = phi i32 [ 968, %concatenate.pivot.968.28 ]
  %129 = sub nsw i32 %13, %128
  %130 = udiv i32 %linear_index3, 1480
  %131 = mul i32 %130, 256
  %132 = add i32 %131, %129
  %133 = udiv i32 %132, 1
  %134 = urem i32 %133, 256
  %135 = udiv i32 %132, 256
  %136 = getelementptr inbounds float, ptr %arg1, i32 %132
  %137 = load float, ptr %136, align 4, !invariant.load !38
  br label %concatenate.4.merge21

concat_index_from_operand_id224:                  ; preds = %concatenate.pivot.1224.29
  %138 = phi i32 [ 1224, %concatenate.pivot.1224.29 ]
  %139 = sub nsw i32 %13, %138
  %140 = udiv i32 %linear_index3, 1480
  %141 = mul i32 %140, 256
  %142 = add i32 %141, %139
  %143 = udiv i32 %142, 1
  %144 = urem i32 %143, 256
  %145 = udiv i32 %142, 256
  %146 = getelementptr inbounds float, ptr %arg2, i32 %142
  %147 = load float, ptr %146, align 4, !invariant.load !38
  br label %concatenate.4.merge21

concatenate.pivot.968.25:                         ; preds = %concatenate.4.merge12
  %148 = icmp ult i32 %13, 968
  br i1 %148, label %concatenate.pivot.0.26, label %concatenate.pivot.1224.27

concatenate.pivot.0.26:                           ; preds = %concatenate.pivot.968.25
  br label %concat_index_from_operand_id022

concatenate.pivot.1224.27:                        ; preds = %concatenate.pivot.968.25
  %149 = icmp ult i32 %13, 1224
  br i1 %149, label %concatenate.pivot.968.28, label %concatenate.pivot.1224.29

concatenate.pivot.968.28:                         ; preds = %concatenate.pivot.1224.27
  br label %concat_index_from_operand_id123

concatenate.pivot.1224.29:                        ; preds = %concatenate.pivot.1224.27
  br label %concat_index_from_operand_id224

concatenate.4.merge21:                            ; preds = %concat_index_from_operand_id224, %concat_index_from_operand_id123, %concat_index_from_operand_id022
  %150 = phi float [ %127, %concat_index_from_operand_id022 ], [ %137, %concat_index_from_operand_id123 ], [ %147, %concat_index_from_operand_id224 ]
  %151 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %150, ptr %151, align 4
  br label %concatenate_11.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @concatenate_7(ptr noalias align 16 dereferenceable(262144) %arg0, ptr noalias align 16 dereferenceable(46080) %arg1, ptr noalias align 16 dereferenceable(3072) %arg2, ptr noalias align 16 dereferenceable(3072) %arg3, ptr noalias align 128 dereferenceable(314368) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !39
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !40
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 78848
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 614
  %5 = udiv i32 %linear_index, 614
  %6 = icmp ult i32 %linear_index, 78592
  br i1 %6, label %concatenate_7.in_bounds-true, label %concatenate_7.in_bounds-after

concatenate_7.in_bounds-after:                    ; preds = %concatenate.5.merge, %entry
  ret void

concatenate_7.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.602.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %7 = phi i32 [ 0, %concatenate.pivot.0. ]
  %8 = sub nsw i32 %4, %7
  %9 = udiv i32 %linear_index, 614
  %10 = mul i32 %9, 512
  %11 = add i32 %10, %8
  %12 = udiv i32 %11, 1
  %13 = urem i32 %12, 512
  %14 = udiv i32 %11, 512
  %15 = getelementptr inbounds float, ptr %arg0, i32 %11
  %16 = load float, ptr %15, align 4, !invariant.load !38
  br label %concatenate.5.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.512.1
  %17 = phi i32 [ 512, %concatenate.pivot.512.1 ]
  %18 = sub nsw i32 %4, %17
  %19 = udiv i32 %linear_index, 614
  %20 = mul i32 %19, 90
  %21 = add i32 %20, %18
  %22 = udiv i32 %21, 1
  %23 = urem i32 %22, 90
  %24 = udiv i32 %21, 90
  %25 = getelementptr inbounds float, ptr %arg1, i32 %21
  %26 = load float, ptr %25, align 4, !invariant.load !38
  br label %concatenate.5.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.602.2
  %27 = phi i32 [ 602, %concatenate.pivot.602.2 ]
  %28 = sub nsw i32 %4, %27
  %29 = udiv i32 %linear_index, 614
  %30 = mul i32 %29, 6
  %31 = add i32 %30, %28
  %32 = udiv i32 %31, 1
  %33 = urem i32 %32, 6
  %34 = udiv i32 %31, 6
  %35 = getelementptr inbounds float, ptr %arg2, i32 %31
  %36 = load float, ptr %35, align 4, !invariant.load !38
  br label %concatenate.5.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.608.3
  %37 = phi i32 [ 608, %concatenate.pivot.608.3 ]
  %38 = sub nsw i32 %4, %37
  %39 = udiv i32 %linear_index, 614
  %40 = mul i32 %39, 6
  %41 = add i32 %40, %38
  %42 = udiv i32 %41, 1
  %43 = urem i32 %42, 6
  %44 = udiv i32 %41, 6
  %45 = getelementptr inbounds float, ptr %arg3, i32 %41
  %46 = load float, ptr %45, align 4, !invariant.load !38
  br label %concatenate.5.merge

concatenate.pivot.602.:                           ; preds = %concatenate_7.in_bounds-true
  %47 = icmp ult i32 %4, 602
  br i1 %47, label %concatenate.pivot.512., label %concatenate.pivot.608.

concatenate.pivot.512.:                           ; preds = %concatenate.pivot.602.
  %48 = icmp ult i32 %4, 512
  br i1 %48, label %concatenate.pivot.0., label %concatenate.pivot.512.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.512.
  br label %concat_index_from_operand_id0

concatenate.pivot.512.1:                          ; preds = %concatenate.pivot.512.
  br label %concat_index_from_operand_id1

concatenate.pivot.608.:                           ; preds = %concatenate.pivot.602.
  %49 = icmp ult i32 %4, 608
  br i1 %49, label %concatenate.pivot.602.2, label %concatenate.pivot.608.3

concatenate.pivot.602.2:                          ; preds = %concatenate.pivot.608.
  br label %concat_index_from_operand_id2

concatenate.pivot.608.3:                          ; preds = %concatenate.pivot.608.
  br label %concat_index_from_operand_id3

concatenate.5.merge:                              ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %50 = phi float [ %16, %concat_index_from_operand_id0 ], [ %26, %concat_index_from_operand_id1 ], [ %36, %concat_index_from_operand_id2 ], [ %46, %concat_index_from_operand_id3 ]
  %51 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %50, ptr %51, align 4
  br label %concatenate_7.in_bounds-after
}

define void @fusion_29(ptr noalias align 16 dereferenceable(2048) %arg0, ptr noalias align 128 dereferenceable(16777216) %arg1, ptr noalias align 128 dereferenceable(20119552) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !41
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1048576
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index_base, 512
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 512
  %8 = udiv i32 %linear_index1, 512
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 512
  %11 = udiv i32 %linear_index2, 512
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 512
  %14 = udiv i32 %linear_index3, 512
  %15 = icmp ult i32 %linear_index_base, 4194304
  br i1 %15, label %fusion_29.in_bounds-true, label %fusion_29.in_bounds-after

fusion_29.in_bounds-after:                        ; preds = %fusion_29.in_bounds-true, %entry
  ret void

fusion_29.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %17 = load float, ptr %16, align 4
  %18 = add i32 %5, 0
  %19 = add i32 %4, 0
  %20 = getelementptr inbounds [8192 x [614 x float]], ptr %arg2, i32 0, i32 %18, i32 %19
  %21 = load float, ptr %20, align 4, !invariant.load !38
  %add.5 = fadd float %17, %21
  %22 = getelementptr inbounds [512 x float], ptr %arg0, i32 0, i32 %4
  %23 = load float, ptr %22, align 4, !invariant.load !38
  %add.7 = fadd float %add.5, %23
  %region_0_11_constant_8 = load float, ptr @0, align 4
  %24 = fcmp oge float %add.7, %region_0_11_constant_8
  %25 = fcmp une float %add.7, %add.7
  %26 = or i1 %24, %25
  %maximum.10 = select i1 %26, float %add.7, float %region_0_11_constant_8
  %27 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %maximum.10, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %29 = load float, ptr %28, align 4
  %30 = add i32 %8, 0
  %31 = add i32 %7, 0
  %32 = getelementptr inbounds [8192 x [614 x float]], ptr %arg2, i32 0, i32 %30, i32 %31
  %33 = load float, ptr %32, align 4, !invariant.load !38
  %add.51 = fadd float %29, %33
  %34 = getelementptr inbounds [512 x float], ptr %arg0, i32 0, i32 %7
  %35 = load float, ptr %34, align 4, !invariant.load !38
  %add.72 = fadd float %add.51, %35
  %region_0_11_constant_83 = load float, ptr @0, align 4
  %36 = fcmp oge float %add.72, %region_0_11_constant_83
  %37 = fcmp une float %add.72, %add.72
  %38 = or i1 %36, %37
  %maximum.104 = select i1 %38, float %add.72, float %region_0_11_constant_83
  %39 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %maximum.104, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %41 = load float, ptr %40, align 4
  %42 = add i32 %11, 0
  %43 = add i32 %10, 0
  %44 = getelementptr inbounds [8192 x [614 x float]], ptr %arg2, i32 0, i32 %42, i32 %43
  %45 = load float, ptr %44, align 4, !invariant.load !38
  %add.55 = fadd float %41, %45
  %46 = getelementptr inbounds [512 x float], ptr %arg0, i32 0, i32 %10
  %47 = load float, ptr %46, align 4, !invariant.load !38
  %add.76 = fadd float %add.55, %47
  %region_0_11_constant_87 = load float, ptr @0, align 4
  %48 = fcmp oge float %add.76, %region_0_11_constant_87
  %49 = fcmp une float %add.76, %add.76
  %50 = or i1 %48, %49
  %maximum.108 = select i1 %50, float %add.76, float %region_0_11_constant_87
  %51 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %maximum.108, ptr %51, align 4
  %52 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %53 = load float, ptr %52, align 4
  %54 = add i32 %14, 0
  %55 = add i32 %13, 0
  %56 = getelementptr inbounds [8192 x [614 x float]], ptr %arg2, i32 0, i32 %54, i32 %55
  %57 = load float, ptr %56, align 4, !invariant.load !38
  %add.59 = fadd float %53, %57
  %58 = getelementptr inbounds [512 x float], ptr %arg0, i32 0, i32 %13
  %59 = load float, ptr %58, align 4, !invariant.load !38
  %add.710 = fadd float %add.59, %59
  %region_0_11_constant_811 = load float, ptr @0, align 4
  %60 = fcmp oge float %add.710, %region_0_11_constant_811
  %61 = fcmp une float %add.710, %add.710
  %62 = or i1 %60, %61
  %maximum.1012 = select i1 %62, float %add.710, float %region_0_11_constant_811
  %63 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %maximum.1012, ptr %63, align 4
  br label %fusion_29.in_bounds-after
}

define void @fusion_27(ptr noalias align 16 dereferenceable(2048) %arg0, ptr noalias align 128 dereferenceable(16777216) %arg1, ptr noalias align 128 dereferenceable(16777216) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !41
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1048576
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index_base, 512
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 512
  %8 = udiv i32 %linear_index1, 512
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 512
  %11 = udiv i32 %linear_index2, 512
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 512
  %14 = udiv i32 %linear_index3, 512
  %15 = icmp ult i32 %linear_index_base, 4194304
  br i1 %15, label %fusion_27.in_bounds-true, label %fusion_27.in_bounds-after

fusion_27.in_bounds-after:                        ; preds = %fusion_27.in_bounds-true, %entry
  ret void

fusion_27.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %17 = load float, ptr %16, align 4
  %18 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %19 = load float, ptr %18, align 4, !invariant.load !38
  %add.4 = fadd float %17, %19
  %20 = getelementptr inbounds [512 x float], ptr %arg0, i32 0, i32 %4
  %21 = load float, ptr %20, align 4, !invariant.load !38
  %add.6 = fadd float %add.4, %21
  %region_0_10_constant_7 = load float, ptr @1, align 4
  %22 = fcmp oge float %add.6, %region_0_10_constant_7
  %23 = fcmp une float %add.6, %add.6
  %24 = or i1 %22, %23
  %maximum.9 = select i1 %24, float %add.6, float %region_0_10_constant_7
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %maximum.9, ptr %25, align 4
  %26 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %27 = load float, ptr %26, align 4
  %28 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %29 = load float, ptr %28, align 4, !invariant.load !38
  %add.41 = fadd float %27, %29
  %30 = getelementptr inbounds [512 x float], ptr %arg0, i32 0, i32 %7
  %31 = load float, ptr %30, align 4, !invariant.load !38
  %add.62 = fadd float %add.41, %31
  %region_0_10_constant_73 = load float, ptr @1, align 4
  %32 = fcmp oge float %add.62, %region_0_10_constant_73
  %33 = fcmp une float %add.62, %add.62
  %34 = or i1 %32, %33
  %maximum.94 = select i1 %34, float %add.62, float %region_0_10_constant_73
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %maximum.94, ptr %35, align 4
  %36 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %37 = load float, ptr %36, align 4
  %38 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %39 = load float, ptr %38, align 4, !invariant.load !38
  %add.45 = fadd float %37, %39
  %40 = getelementptr inbounds [512 x float], ptr %arg0, i32 0, i32 %10
  %41 = load float, ptr %40, align 4, !invariant.load !38
  %add.66 = fadd float %add.45, %41
  %region_0_10_constant_77 = load float, ptr @1, align 4
  %42 = fcmp oge float %add.66, %region_0_10_constant_77
  %43 = fcmp une float %add.66, %add.66
  %44 = or i1 %42, %43
  %maximum.98 = select i1 %44, float %add.66, float %region_0_10_constant_77
  %45 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %maximum.98, ptr %45, align 4
  %46 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %47 = load float, ptr %46, align 4
  %48 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %49 = load float, ptr %48, align 4, !invariant.load !38
  %add.49 = fadd float %47, %49
  %50 = getelementptr inbounds [512 x float], ptr %arg0, i32 0, i32 %13
  %51 = load float, ptr %50, align 4, !invariant.load !38
  %add.610 = fadd float %add.49, %51
  %region_0_10_constant_711 = load float, ptr @1, align 4
  %52 = fcmp oge float %add.610, %region_0_10_constant_711
  %53 = fcmp une float %add.610, %add.610
  %54 = or i1 %52, %53
  %maximum.912 = select i1 %54, float %add.610, float %region_0_10_constant_711
  %55 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %maximum.912, ptr %55, align 4
  br label %fusion_27.in_bounds-after
}

define void @fusion_45(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 16 dereferenceable(1024) %arg1, ptr noalias align 128 dereferenceable(8388608) %arg2, ptr noalias align 16 dereferenceable(1024) %arg3, ptr noalias align 128 dereferenceable(8388608) %arg4, ptr noalias align 16 dereferenceable(1024) %arg5, ptr noalias align 128 dereferenceable(8388608) %arg6, ptr noalias align 16 dereferenceable(1024) %arg7, ptr noalias align 128 dereferenceable(8388608) %arg8, ptr noalias align 16 dereferenceable(1024) %arg9, ptr noalias align 128 dereferenceable(8388608) %arg10, ptr noalias align 16 dereferenceable(1024) %arg11, ptr noalias align 128 dereferenceable(8388608) %arg12, ptr noalias align 128 dereferenceable(8388608) %arg13, ptr noalias align 128 dereferenceable(8388608) %arg14, ptr noalias align 128 dereferenceable(8388608) %arg15, ptr noalias align 128 dereferenceable(8388608) %arg16, ptr noalias align 128 dereferenceable(8388608) %arg17) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !42
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 524288
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index_base, 256
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 256
  %8 = udiv i32 %linear_index1, 256
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 256
  %11 = udiv i32 %linear_index2, 256
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 256
  %14 = udiv i32 %linear_index3, 256
  %15 = icmp ult i32 %linear_index_base, 2097152
  br i1 %15, label %fusion_45.in_bounds-true, label %fusion_45.in_bounds-after

fusion_45.in_bounds-after:                        ; preds = %fusion_45.in_bounds-true, %entry
  ret void

fusion_45.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !38
  %18 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %4
  %19 = load float, ptr %18, align 4, !invariant.load !38
  %add.14 = fadd float %17, %19
  %region_0_34_constant_15 = load float, ptr @2, align 4
  %20 = fcmp oge float %add.14, %region_0_34_constant_15
  %21 = fcmp une float %add.14, %add.14
  %22 = or i1 %20, %21
  %maximum.17 = select i1 %22, float %add.14, float %region_0_34_constant_15
  %23 = insertvalue { float, float, float, float, float, float } undef, float %maximum.17, 0
  %24 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !38
  %26 = getelementptr inbounds [256 x float], ptr %arg3, i32 0, i32 %4
  %27 = load float, ptr %26, align 4, !invariant.load !38
  %add.19 = fadd float %25, %27
  %28 = fcmp oge float %add.19, %region_0_34_constant_15
  %29 = fcmp une float %add.19, %add.19
  %30 = or i1 %28, %29
  %maximum.20 = select i1 %30, float %add.19, float %region_0_34_constant_15
  %31 = insertvalue { float, float, float, float, float, float } %23, float %maximum.20, 1
  %32 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  %33 = load float, ptr %32, align 4, !invariant.load !38
  %34 = getelementptr inbounds [256 x float], ptr %arg5, i32 0, i32 %4
  %35 = load float, ptr %34, align 4, !invariant.load !38
  %add.22 = fadd float %33, %35
  %36 = fcmp oge float %add.22, %region_0_34_constant_15
  %37 = fcmp une float %add.22, %add.22
  %38 = or i1 %36, %37
  %maximum.23 = select i1 %38, float %add.22, float %region_0_34_constant_15
  %39 = insertvalue { float, float, float, float, float, float } %31, float %maximum.23, 2
  %40 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  %41 = load float, ptr %40, align 4, !invariant.load !38
  %42 = getelementptr inbounds [256 x float], ptr %arg7, i32 0, i32 %4
  %43 = load float, ptr %42, align 4, !invariant.load !38
  %add.25 = fadd float %41, %43
  %44 = fcmp oge float %add.25, %region_0_34_constant_15
  %45 = fcmp une float %add.25, %add.25
  %46 = or i1 %44, %45
  %maximum.26 = select i1 %46, float %add.25, float %region_0_34_constant_15
  %47 = insertvalue { float, float, float, float, float, float } %39, float %maximum.26, 3
  %48 = getelementptr inbounds float, ptr %arg8, i32 %linear_index_base
  %49 = load float, ptr %48, align 4, !invariant.load !38
  %50 = getelementptr inbounds [256 x float], ptr %arg9, i32 0, i32 %4
  %51 = load float, ptr %50, align 4, !invariant.load !38
  %add.28 = fadd float %49, %51
  %52 = fcmp oge float %add.28, %region_0_34_constant_15
  %53 = fcmp une float %add.28, %add.28
  %54 = or i1 %52, %53
  %maximum.29 = select i1 %54, float %add.28, float %region_0_34_constant_15
  %55 = insertvalue { float, float, float, float, float, float } %47, float %maximum.29, 4
  %56 = getelementptr inbounds float, ptr %arg10, i32 %linear_index_base
  %57 = load float, ptr %56, align 4, !invariant.load !38
  %58 = getelementptr inbounds [256 x float], ptr %arg11, i32 0, i32 %4
  %59 = load float, ptr %58, align 4, !invariant.load !38
  %add.31 = fadd float %57, %59
  %60 = fcmp oge float %add.31, %region_0_34_constant_15
  %61 = fcmp une float %add.31, %add.31
  %62 = or i1 %60, %61
  %maximum.32 = select i1 %62, float %add.31, float %region_0_34_constant_15
  %63 = insertvalue { float, float, float, float, float, float } %55, float %maximum.32, 5
  %64 = extractvalue { float, float, float, float, float, float } %63, 0
  %65 = getelementptr inbounds float, ptr %arg12, i32 %linear_index_base
  store float %64, ptr %65, align 4
  %66 = extractvalue { float, float, float, float, float, float } %63, 1
  %67 = getelementptr inbounds float, ptr %arg13, i32 %linear_index_base
  store float %66, ptr %67, align 4
  %68 = extractvalue { float, float, float, float, float, float } %63, 2
  %69 = getelementptr inbounds float, ptr %arg14, i32 %linear_index_base
  store float %68, ptr %69, align 4
  %70 = extractvalue { float, float, float, float, float, float } %63, 3
  %71 = getelementptr inbounds float, ptr %arg15, i32 %linear_index_base
  store float %70, ptr %71, align 4
  %72 = extractvalue { float, float, float, float, float, float } %63, 4
  %73 = getelementptr inbounds float, ptr %arg16, i32 %linear_index_base
  store float %72, ptr %73, align 4
  %74 = extractvalue { float, float, float, float, float, float } %63, 5
  %75 = getelementptr inbounds float, ptr %arg17, i32 %linear_index_base
  store float %74, ptr %75, align 4
  %76 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %77 = load float, ptr %76, align 4, !invariant.load !38
  %78 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %7
  %79 = load float, ptr %78, align 4, !invariant.load !38
  %add.141 = fadd float %77, %79
  %region_0_34_constant_152 = load float, ptr @2, align 4
  %80 = fcmp oge float %add.141, %region_0_34_constant_152
  %81 = fcmp une float %add.141, %add.141
  %82 = or i1 %80, %81
  %maximum.173 = select i1 %82, float %add.141, float %region_0_34_constant_152
  %83 = insertvalue { float, float, float, float, float, float } undef, float %maximum.173, 0
  %84 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %85 = load float, ptr %84, align 4, !invariant.load !38
  %86 = getelementptr inbounds [256 x float], ptr %arg3, i32 0, i32 %7
  %87 = load float, ptr %86, align 4, !invariant.load !38
  %add.194 = fadd float %85, %87
  %88 = fcmp oge float %add.194, %region_0_34_constant_152
  %89 = fcmp une float %add.194, %add.194
  %90 = or i1 %88, %89
  %maximum.205 = select i1 %90, float %add.194, float %region_0_34_constant_152
  %91 = insertvalue { float, float, float, float, float, float } %83, float %maximum.205, 1
  %92 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  %93 = load float, ptr %92, align 4, !invariant.load !38
  %94 = getelementptr inbounds [256 x float], ptr %arg5, i32 0, i32 %7
  %95 = load float, ptr %94, align 4, !invariant.load !38
  %add.226 = fadd float %93, %95
  %96 = fcmp oge float %add.226, %region_0_34_constant_152
  %97 = fcmp une float %add.226, %add.226
  %98 = or i1 %96, %97
  %maximum.237 = select i1 %98, float %add.226, float %region_0_34_constant_152
  %99 = insertvalue { float, float, float, float, float, float } %91, float %maximum.237, 2
  %100 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  %101 = load float, ptr %100, align 4, !invariant.load !38
  %102 = getelementptr inbounds [256 x float], ptr %arg7, i32 0, i32 %7
  %103 = load float, ptr %102, align 4, !invariant.load !38
  %add.258 = fadd float %101, %103
  %104 = fcmp oge float %add.258, %region_0_34_constant_152
  %105 = fcmp une float %add.258, %add.258
  %106 = or i1 %104, %105
  %maximum.269 = select i1 %106, float %add.258, float %region_0_34_constant_152
  %107 = insertvalue { float, float, float, float, float, float } %99, float %maximum.269, 3
  %108 = getelementptr inbounds float, ptr %arg8, i32 %linear_index1
  %109 = load float, ptr %108, align 4, !invariant.load !38
  %110 = getelementptr inbounds [256 x float], ptr %arg9, i32 0, i32 %7
  %111 = load float, ptr %110, align 4, !invariant.load !38
  %add.2810 = fadd float %109, %111
  %112 = fcmp oge float %add.2810, %region_0_34_constant_152
  %113 = fcmp une float %add.2810, %add.2810
  %114 = or i1 %112, %113
  %maximum.2911 = select i1 %114, float %add.2810, float %region_0_34_constant_152
  %115 = insertvalue { float, float, float, float, float, float } %107, float %maximum.2911, 4
  %116 = getelementptr inbounds float, ptr %arg10, i32 %linear_index1
  %117 = load float, ptr %116, align 4, !invariant.load !38
  %118 = getelementptr inbounds [256 x float], ptr %arg11, i32 0, i32 %7
  %119 = load float, ptr %118, align 4, !invariant.load !38
  %add.3112 = fadd float %117, %119
  %120 = fcmp oge float %add.3112, %region_0_34_constant_152
  %121 = fcmp une float %add.3112, %add.3112
  %122 = or i1 %120, %121
  %maximum.3213 = select i1 %122, float %add.3112, float %region_0_34_constant_152
  %123 = insertvalue { float, float, float, float, float, float } %115, float %maximum.3213, 5
  %124 = extractvalue { float, float, float, float, float, float } %123, 0
  %125 = getelementptr inbounds float, ptr %arg12, i32 %linear_index1
  store float %124, ptr %125, align 4
  %126 = extractvalue { float, float, float, float, float, float } %123, 1
  %127 = getelementptr inbounds float, ptr %arg13, i32 %linear_index1
  store float %126, ptr %127, align 4
  %128 = extractvalue { float, float, float, float, float, float } %123, 2
  %129 = getelementptr inbounds float, ptr %arg14, i32 %linear_index1
  store float %128, ptr %129, align 4
  %130 = extractvalue { float, float, float, float, float, float } %123, 3
  %131 = getelementptr inbounds float, ptr %arg15, i32 %linear_index1
  store float %130, ptr %131, align 4
  %132 = extractvalue { float, float, float, float, float, float } %123, 4
  %133 = getelementptr inbounds float, ptr %arg16, i32 %linear_index1
  store float %132, ptr %133, align 4
  %134 = extractvalue { float, float, float, float, float, float } %123, 5
  %135 = getelementptr inbounds float, ptr %arg17, i32 %linear_index1
  store float %134, ptr %135, align 4
  %136 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %137 = load float, ptr %136, align 4, !invariant.load !38
  %138 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %10
  %139 = load float, ptr %138, align 4, !invariant.load !38
  %add.1414 = fadd float %137, %139
  %region_0_34_constant_1515 = load float, ptr @2, align 4
  %140 = fcmp oge float %add.1414, %region_0_34_constant_1515
  %141 = fcmp une float %add.1414, %add.1414
  %142 = or i1 %140, %141
  %maximum.1716 = select i1 %142, float %add.1414, float %region_0_34_constant_1515
  %143 = insertvalue { float, float, float, float, float, float } undef, float %maximum.1716, 0
  %144 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %145 = load float, ptr %144, align 4, !invariant.load !38
  %146 = getelementptr inbounds [256 x float], ptr %arg3, i32 0, i32 %10
  %147 = load float, ptr %146, align 4, !invariant.load !38
  %add.1917 = fadd float %145, %147
  %148 = fcmp oge float %add.1917, %region_0_34_constant_1515
  %149 = fcmp une float %add.1917, %add.1917
  %150 = or i1 %148, %149
  %maximum.2018 = select i1 %150, float %add.1917, float %region_0_34_constant_1515
  %151 = insertvalue { float, float, float, float, float, float } %143, float %maximum.2018, 1
  %152 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  %153 = load float, ptr %152, align 4, !invariant.load !38
  %154 = getelementptr inbounds [256 x float], ptr %arg5, i32 0, i32 %10
  %155 = load float, ptr %154, align 4, !invariant.load !38
  %add.2219 = fadd float %153, %155
  %156 = fcmp oge float %add.2219, %region_0_34_constant_1515
  %157 = fcmp une float %add.2219, %add.2219
  %158 = or i1 %156, %157
  %maximum.2320 = select i1 %158, float %add.2219, float %region_0_34_constant_1515
  %159 = insertvalue { float, float, float, float, float, float } %151, float %maximum.2320, 2
  %160 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  %161 = load float, ptr %160, align 4, !invariant.load !38
  %162 = getelementptr inbounds [256 x float], ptr %arg7, i32 0, i32 %10
  %163 = load float, ptr %162, align 4, !invariant.load !38
  %add.2521 = fadd float %161, %163
  %164 = fcmp oge float %add.2521, %region_0_34_constant_1515
  %165 = fcmp une float %add.2521, %add.2521
  %166 = or i1 %164, %165
  %maximum.2622 = select i1 %166, float %add.2521, float %region_0_34_constant_1515
  %167 = insertvalue { float, float, float, float, float, float } %159, float %maximum.2622, 3
  %168 = getelementptr inbounds float, ptr %arg8, i32 %linear_index2
  %169 = load float, ptr %168, align 4, !invariant.load !38
  %170 = getelementptr inbounds [256 x float], ptr %arg9, i32 0, i32 %10
  %171 = load float, ptr %170, align 4, !invariant.load !38
  %add.2823 = fadd float %169, %171
  %172 = fcmp oge float %add.2823, %region_0_34_constant_1515
  %173 = fcmp une float %add.2823, %add.2823
  %174 = or i1 %172, %173
  %maximum.2924 = select i1 %174, float %add.2823, float %region_0_34_constant_1515
  %175 = insertvalue { float, float, float, float, float, float } %167, float %maximum.2924, 4
  %176 = getelementptr inbounds float, ptr %arg10, i32 %linear_index2
  %177 = load float, ptr %176, align 4, !invariant.load !38
  %178 = getelementptr inbounds [256 x float], ptr %arg11, i32 0, i32 %10
  %179 = load float, ptr %178, align 4, !invariant.load !38
  %add.3125 = fadd float %177, %179
  %180 = fcmp oge float %add.3125, %region_0_34_constant_1515
  %181 = fcmp une float %add.3125, %add.3125
  %182 = or i1 %180, %181
  %maximum.3226 = select i1 %182, float %add.3125, float %region_0_34_constant_1515
  %183 = insertvalue { float, float, float, float, float, float } %175, float %maximum.3226, 5
  %184 = extractvalue { float, float, float, float, float, float } %183, 0
  %185 = getelementptr inbounds float, ptr %arg12, i32 %linear_index2
  store float %184, ptr %185, align 4
  %186 = extractvalue { float, float, float, float, float, float } %183, 1
  %187 = getelementptr inbounds float, ptr %arg13, i32 %linear_index2
  store float %186, ptr %187, align 4
  %188 = extractvalue { float, float, float, float, float, float } %183, 2
  %189 = getelementptr inbounds float, ptr %arg14, i32 %linear_index2
  store float %188, ptr %189, align 4
  %190 = extractvalue { float, float, float, float, float, float } %183, 3
  %191 = getelementptr inbounds float, ptr %arg15, i32 %linear_index2
  store float %190, ptr %191, align 4
  %192 = extractvalue { float, float, float, float, float, float } %183, 4
  %193 = getelementptr inbounds float, ptr %arg16, i32 %linear_index2
  store float %192, ptr %193, align 4
  %194 = extractvalue { float, float, float, float, float, float } %183, 5
  %195 = getelementptr inbounds float, ptr %arg17, i32 %linear_index2
  store float %194, ptr %195, align 4
  %196 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %197 = load float, ptr %196, align 4, !invariant.load !38
  %198 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %13
  %199 = load float, ptr %198, align 4, !invariant.load !38
  %add.1427 = fadd float %197, %199
  %region_0_34_constant_1528 = load float, ptr @2, align 4
  %200 = fcmp oge float %add.1427, %region_0_34_constant_1528
  %201 = fcmp une float %add.1427, %add.1427
  %202 = or i1 %200, %201
  %maximum.1729 = select i1 %202, float %add.1427, float %region_0_34_constant_1528
  %203 = insertvalue { float, float, float, float, float, float } undef, float %maximum.1729, 0
  %204 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %205 = load float, ptr %204, align 4, !invariant.load !38
  %206 = getelementptr inbounds [256 x float], ptr %arg3, i32 0, i32 %13
  %207 = load float, ptr %206, align 4, !invariant.load !38
  %add.1930 = fadd float %205, %207
  %208 = fcmp oge float %add.1930, %region_0_34_constant_1528
  %209 = fcmp une float %add.1930, %add.1930
  %210 = or i1 %208, %209
  %maximum.2031 = select i1 %210, float %add.1930, float %region_0_34_constant_1528
  %211 = insertvalue { float, float, float, float, float, float } %203, float %maximum.2031, 1
  %212 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  %213 = load float, ptr %212, align 4, !invariant.load !38
  %214 = getelementptr inbounds [256 x float], ptr %arg5, i32 0, i32 %13
  %215 = load float, ptr %214, align 4, !invariant.load !38
  %add.2232 = fadd float %213, %215
  %216 = fcmp oge float %add.2232, %region_0_34_constant_1528
  %217 = fcmp une float %add.2232, %add.2232
  %218 = or i1 %216, %217
  %maximum.2333 = select i1 %218, float %add.2232, float %region_0_34_constant_1528
  %219 = insertvalue { float, float, float, float, float, float } %211, float %maximum.2333, 2
  %220 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  %221 = load float, ptr %220, align 4, !invariant.load !38
  %222 = getelementptr inbounds [256 x float], ptr %arg7, i32 0, i32 %13
  %223 = load float, ptr %222, align 4, !invariant.load !38
  %add.2534 = fadd float %221, %223
  %224 = fcmp oge float %add.2534, %region_0_34_constant_1528
  %225 = fcmp une float %add.2534, %add.2534
  %226 = or i1 %224, %225
  %maximum.2635 = select i1 %226, float %add.2534, float %region_0_34_constant_1528
  %227 = insertvalue { float, float, float, float, float, float } %219, float %maximum.2635, 3
  %228 = getelementptr inbounds float, ptr %arg8, i32 %linear_index3
  %229 = load float, ptr %228, align 4, !invariant.load !38
  %230 = getelementptr inbounds [256 x float], ptr %arg9, i32 0, i32 %13
  %231 = load float, ptr %230, align 4, !invariant.load !38
  %add.2836 = fadd float %229, %231
  %232 = fcmp oge float %add.2836, %region_0_34_constant_1528
  %233 = fcmp une float %add.2836, %add.2836
  %234 = or i1 %232, %233
  %maximum.2937 = select i1 %234, float %add.2836, float %region_0_34_constant_1528
  %235 = insertvalue { float, float, float, float, float, float } %227, float %maximum.2937, 4
  %236 = getelementptr inbounds float, ptr %arg10, i32 %linear_index3
  %237 = load float, ptr %236, align 4, !invariant.load !38
  %238 = getelementptr inbounds [256 x float], ptr %arg11, i32 0, i32 %13
  %239 = load float, ptr %238, align 4, !invariant.load !38
  %add.3138 = fadd float %237, %239
  %240 = fcmp oge float %add.3138, %region_0_34_constant_1528
  %241 = fcmp une float %add.3138, %add.3138
  %242 = or i1 %240, %241
  %maximum.3239 = select i1 %242, float %add.3138, float %region_0_34_constant_1528
  %243 = insertvalue { float, float, float, float, float, float } %235, float %maximum.3239, 5
  %244 = extractvalue { float, float, float, float, float, float } %243, 0
  %245 = getelementptr inbounds float, ptr %arg12, i32 %linear_index3
  store float %244, ptr %245, align 4
  %246 = extractvalue { float, float, float, float, float, float } %243, 1
  %247 = getelementptr inbounds float, ptr %arg13, i32 %linear_index3
  store float %246, ptr %247, align 4
  %248 = extractvalue { float, float, float, float, float, float } %243, 2
  %249 = getelementptr inbounds float, ptr %arg14, i32 %linear_index3
  store float %248, ptr %249, align 4
  %250 = extractvalue { float, float, float, float, float, float } %243, 3
  %251 = getelementptr inbounds float, ptr %arg15, i32 %linear_index3
  store float %250, ptr %251, align 4
  %252 = extractvalue { float, float, float, float, float, float } %243, 4
  %253 = getelementptr inbounds float, ptr %arg16, i32 %linear_index3
  store float %252, ptr %253, align 4
  %254 = extractvalue { float, float, float, float, float, float } %243, 5
  %255 = getelementptr inbounds float, ptr %arg17, i32 %linear_index3
  store float %254, ptr %255, align 4
  br label %fusion_45.in_bounds-after
}

define void @fusion_17(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(8388608) %arg1, ptr noalias align 128 dereferenceable(8388608) %arg2, ptr noalias align 128 dereferenceable(8388608) %arg3, ptr noalias align 128 dereferenceable(8388608) %arg4, ptr noalias align 128 dereferenceable(8388608) %arg5, ptr noalias align 128 dereferenceable(50331648) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !43
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3145728
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index_base, 256
  %6 = urem i32 %5, 6
  %7 = udiv i32 %linear_index_base, 1536
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 256
  %10 = udiv i32 %linear_index1, 256
  %11 = urem i32 %10, 6
  %12 = udiv i32 %linear_index1, 1536
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 256
  %15 = udiv i32 %linear_index2, 256
  %16 = urem i32 %15, 6
  %17 = udiv i32 %linear_index2, 1536
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 256
  %20 = udiv i32 %linear_index3, 256
  %21 = urem i32 %20, 6
  %22 = udiv i32 %linear_index3, 1536
  %23 = icmp ult i32 %linear_index_base, 12582912
  br i1 %23, label %fusion_17.in_bounds-true, label %fusion_17.in_bounds-after

fusion_17.in_bounds-after:                        ; preds = %concatenate.13.merge42, %entry
  ret void

fusion_17.in_bounds-true:                         ; preds = %entry
  br label %concatenate.pivot.3.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %6, %24
  %26 = getelementptr inbounds [8192 x [256 x float]], ptr %arg5, i32 0, i32 %7, i32 %4
  %27 = load float, ptr %26, align 4, !invariant.load !38
  br label %concatenate.13.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.1
  %28 = phi i32 [ 1, %concatenate.pivot.1.1 ]
  %29 = sub nsw i32 %6, %28
  %30 = getelementptr inbounds [8192 x [256 x float]], ptr %arg4, i32 0, i32 %7, i32 %4
  %31 = load float, ptr %30, align 4, !invariant.load !38
  br label %concatenate.13.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.2.2
  %32 = phi i32 [ 2, %concatenate.pivot.2.2 ]
  %33 = sub nsw i32 %6, %32
  %34 = getelementptr inbounds [8192 x [256 x float]], ptr %arg3, i32 0, i32 %7, i32 %4
  %35 = load float, ptr %34, align 4, !invariant.load !38
  br label %concatenate.13.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.3.3
  %36 = phi i32 [ 3, %concatenate.pivot.3.3 ]
  %37 = sub nsw i32 %6, %36
  %38 = getelementptr inbounds [8192 x [256 x float]], ptr %arg2, i32 0, i32 %7, i32 %4
  %39 = load float, ptr %38, align 4, !invariant.load !38
  br label %concatenate.13.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.4.4
  %40 = phi i32 [ 4, %concatenate.pivot.4.4 ]
  %41 = sub nsw i32 %6, %40
  %42 = getelementptr inbounds [8192 x [256 x float]], ptr %arg1, i32 0, i32 %7, i32 %4
  %43 = load float, ptr %42, align 4, !invariant.load !38
  br label %concatenate.13.merge

concat_index_from_operand_id5:                    ; preds = %concatenate.pivot.5.5
  %44 = phi i32 [ 5, %concatenate.pivot.5.5 ]
  %45 = sub nsw i32 %6, %44
  %46 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %7, i32 %4
  %47 = load float, ptr %46, align 4, !invariant.load !38
  br label %concatenate.13.merge

concatenate.pivot.3.:                             ; preds = %fusion_17.in_bounds-true
  %48 = icmp ult i32 %6, 3
  br i1 %48, label %concatenate.pivot.1., label %concatenate.pivot.4.

concatenate.pivot.1.:                             ; preds = %concatenate.pivot.3.
  %49 = icmp ult i32 %6, 1
  br i1 %49, label %concatenate.pivot.0., label %concatenate.pivot.2.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.2.:                             ; preds = %concatenate.pivot.1.
  %50 = icmp ult i32 %6, 2
  br i1 %50, label %concatenate.pivot.1.1, label %concatenate.pivot.2.2

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.2.
  br label %concat_index_from_operand_id1

concatenate.pivot.2.2:                            ; preds = %concatenate.pivot.2.
  br label %concat_index_from_operand_id2

concatenate.pivot.4.:                             ; preds = %concatenate.pivot.3.
  %51 = icmp ult i32 %6, 4
  br i1 %51, label %concatenate.pivot.3.3, label %concatenate.pivot.5.

concatenate.pivot.3.3:                            ; preds = %concatenate.pivot.4.
  br label %concat_index_from_operand_id3

concatenate.pivot.5.:                             ; preds = %concatenate.pivot.4.
  %52 = icmp ult i32 %6, 5
  br i1 %52, label %concatenate.pivot.4.4, label %concatenate.pivot.5.5

concatenate.pivot.4.4:                            ; preds = %concatenate.pivot.5.
  br label %concat_index_from_operand_id4

concatenate.pivot.5.5:                            ; preds = %concatenate.pivot.5.
  br label %concat_index_from_operand_id5

concatenate.13.merge:                             ; preds = %concat_index_from_operand_id5, %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %53 = phi float [ %27, %concat_index_from_operand_id0 ], [ %31, %concat_index_from_operand_id1 ], [ %35, %concat_index_from_operand_id2 ], [ %39, %concat_index_from_operand_id3 ], [ %43, %concat_index_from_operand_id4 ], [ %47, %concat_index_from_operand_id5 ]
  %54 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  store float %53, ptr %54, align 4
  br label %concatenate.pivot.3.13

concat_index_from_operand_id07:                   ; preds = %concatenate.pivot.0.15
  %55 = phi i32 [ 0, %concatenate.pivot.0.15 ]
  %56 = sub nsw i32 %11, %55
  %57 = getelementptr inbounds [8192 x [256 x float]], ptr %arg5, i32 0, i32 %12, i32 %9
  %58 = load float, ptr %57, align 4, !invariant.load !38
  br label %concatenate.13.merge6

concat_index_from_operand_id18:                   ; preds = %concatenate.pivot.1.17
  %59 = phi i32 [ 1, %concatenate.pivot.1.17 ]
  %60 = sub nsw i32 %11, %59
  %61 = getelementptr inbounds [8192 x [256 x float]], ptr %arg4, i32 0, i32 %12, i32 %9
  %62 = load float, ptr %61, align 4, !invariant.load !38
  br label %concatenate.13.merge6

concat_index_from_operand_id29:                   ; preds = %concatenate.pivot.2.18
  %63 = phi i32 [ 2, %concatenate.pivot.2.18 ]
  %64 = sub nsw i32 %11, %63
  %65 = getelementptr inbounds [8192 x [256 x float]], ptr %arg3, i32 0, i32 %12, i32 %9
  %66 = load float, ptr %65, align 4, !invariant.load !38
  br label %concatenate.13.merge6

concat_index_from_operand_id310:                  ; preds = %concatenate.pivot.3.20
  %67 = phi i32 [ 3, %concatenate.pivot.3.20 ]
  %68 = sub nsw i32 %11, %67
  %69 = getelementptr inbounds [8192 x [256 x float]], ptr %arg2, i32 0, i32 %12, i32 %9
  %70 = load float, ptr %69, align 4, !invariant.load !38
  br label %concatenate.13.merge6

concat_index_from_operand_id411:                  ; preds = %concatenate.pivot.4.22
  %71 = phi i32 [ 4, %concatenate.pivot.4.22 ]
  %72 = sub nsw i32 %11, %71
  %73 = getelementptr inbounds [8192 x [256 x float]], ptr %arg1, i32 0, i32 %12, i32 %9
  %74 = load float, ptr %73, align 4, !invariant.load !38
  br label %concatenate.13.merge6

concat_index_from_operand_id512:                  ; preds = %concatenate.pivot.5.23
  %75 = phi i32 [ 5, %concatenate.pivot.5.23 ]
  %76 = sub nsw i32 %11, %75
  %77 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %12, i32 %9
  %78 = load float, ptr %77, align 4, !invariant.load !38
  br label %concatenate.13.merge6

concatenate.pivot.3.13:                           ; preds = %concatenate.13.merge
  %79 = icmp ult i32 %11, 3
  br i1 %79, label %concatenate.pivot.1.14, label %concatenate.pivot.4.19

concatenate.pivot.1.14:                           ; preds = %concatenate.pivot.3.13
  %80 = icmp ult i32 %11, 1
  br i1 %80, label %concatenate.pivot.0.15, label %concatenate.pivot.2.16

concatenate.pivot.0.15:                           ; preds = %concatenate.pivot.1.14
  br label %concat_index_from_operand_id07

concatenate.pivot.2.16:                           ; preds = %concatenate.pivot.1.14
  %81 = icmp ult i32 %11, 2
  br i1 %81, label %concatenate.pivot.1.17, label %concatenate.pivot.2.18

concatenate.pivot.1.17:                           ; preds = %concatenate.pivot.2.16
  br label %concat_index_from_operand_id18

concatenate.pivot.2.18:                           ; preds = %concatenate.pivot.2.16
  br label %concat_index_from_operand_id29

concatenate.pivot.4.19:                           ; preds = %concatenate.pivot.3.13
  %82 = icmp ult i32 %11, 4
  br i1 %82, label %concatenate.pivot.3.20, label %concatenate.pivot.5.21

concatenate.pivot.3.20:                           ; preds = %concatenate.pivot.4.19
  br label %concat_index_from_operand_id310

concatenate.pivot.5.21:                           ; preds = %concatenate.pivot.4.19
  %83 = icmp ult i32 %11, 5
  br i1 %83, label %concatenate.pivot.4.22, label %concatenate.pivot.5.23

concatenate.pivot.4.22:                           ; preds = %concatenate.pivot.5.21
  br label %concat_index_from_operand_id411

concatenate.pivot.5.23:                           ; preds = %concatenate.pivot.5.21
  br label %concat_index_from_operand_id512

concatenate.13.merge6:                            ; preds = %concat_index_from_operand_id512, %concat_index_from_operand_id411, %concat_index_from_operand_id310, %concat_index_from_operand_id29, %concat_index_from_operand_id18, %concat_index_from_operand_id07
  %84 = phi float [ %58, %concat_index_from_operand_id07 ], [ %62, %concat_index_from_operand_id18 ], [ %66, %concat_index_from_operand_id29 ], [ %70, %concat_index_from_operand_id310 ], [ %74, %concat_index_from_operand_id411 ], [ %78, %concat_index_from_operand_id512 ]
  %85 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  store float %84, ptr %85, align 4
  br label %concatenate.pivot.3.31

concat_index_from_operand_id025:                  ; preds = %concatenate.pivot.0.33
  %86 = phi i32 [ 0, %concatenate.pivot.0.33 ]
  %87 = sub nsw i32 %16, %86
  %88 = getelementptr inbounds [8192 x [256 x float]], ptr %arg5, i32 0, i32 %17, i32 %14
  %89 = load float, ptr %88, align 4, !invariant.load !38
  br label %concatenate.13.merge24

concat_index_from_operand_id126:                  ; preds = %concatenate.pivot.1.35
  %90 = phi i32 [ 1, %concatenate.pivot.1.35 ]
  %91 = sub nsw i32 %16, %90
  %92 = getelementptr inbounds [8192 x [256 x float]], ptr %arg4, i32 0, i32 %17, i32 %14
  %93 = load float, ptr %92, align 4, !invariant.load !38
  br label %concatenate.13.merge24

concat_index_from_operand_id227:                  ; preds = %concatenate.pivot.2.36
  %94 = phi i32 [ 2, %concatenate.pivot.2.36 ]
  %95 = sub nsw i32 %16, %94
  %96 = getelementptr inbounds [8192 x [256 x float]], ptr %arg3, i32 0, i32 %17, i32 %14
  %97 = load float, ptr %96, align 4, !invariant.load !38
  br label %concatenate.13.merge24

concat_index_from_operand_id328:                  ; preds = %concatenate.pivot.3.38
  %98 = phi i32 [ 3, %concatenate.pivot.3.38 ]
  %99 = sub nsw i32 %16, %98
  %100 = getelementptr inbounds [8192 x [256 x float]], ptr %arg2, i32 0, i32 %17, i32 %14
  %101 = load float, ptr %100, align 4, !invariant.load !38
  br label %concatenate.13.merge24

concat_index_from_operand_id429:                  ; preds = %concatenate.pivot.4.40
  %102 = phi i32 [ 4, %concatenate.pivot.4.40 ]
  %103 = sub nsw i32 %16, %102
  %104 = getelementptr inbounds [8192 x [256 x float]], ptr %arg1, i32 0, i32 %17, i32 %14
  %105 = load float, ptr %104, align 4, !invariant.load !38
  br label %concatenate.13.merge24

concat_index_from_operand_id530:                  ; preds = %concatenate.pivot.5.41
  %106 = phi i32 [ 5, %concatenate.pivot.5.41 ]
  %107 = sub nsw i32 %16, %106
  %108 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %17, i32 %14
  %109 = load float, ptr %108, align 4, !invariant.load !38
  br label %concatenate.13.merge24

concatenate.pivot.3.31:                           ; preds = %concatenate.13.merge6
  %110 = icmp ult i32 %16, 3
  br i1 %110, label %concatenate.pivot.1.32, label %concatenate.pivot.4.37

concatenate.pivot.1.32:                           ; preds = %concatenate.pivot.3.31
  %111 = icmp ult i32 %16, 1
  br i1 %111, label %concatenate.pivot.0.33, label %concatenate.pivot.2.34

concatenate.pivot.0.33:                           ; preds = %concatenate.pivot.1.32
  br label %concat_index_from_operand_id025

concatenate.pivot.2.34:                           ; preds = %concatenate.pivot.1.32
  %112 = icmp ult i32 %16, 2
  br i1 %112, label %concatenate.pivot.1.35, label %concatenate.pivot.2.36

concatenate.pivot.1.35:                           ; preds = %concatenate.pivot.2.34
  br label %concat_index_from_operand_id126

concatenate.pivot.2.36:                           ; preds = %concatenate.pivot.2.34
  br label %concat_index_from_operand_id227

concatenate.pivot.4.37:                           ; preds = %concatenate.pivot.3.31
  %113 = icmp ult i32 %16, 4
  br i1 %113, label %concatenate.pivot.3.38, label %concatenate.pivot.5.39

concatenate.pivot.3.38:                           ; preds = %concatenate.pivot.4.37
  br label %concat_index_from_operand_id328

concatenate.pivot.5.39:                           ; preds = %concatenate.pivot.4.37
  %114 = icmp ult i32 %16, 5
  br i1 %114, label %concatenate.pivot.4.40, label %concatenate.pivot.5.41

concatenate.pivot.4.40:                           ; preds = %concatenate.pivot.5.39
  br label %concat_index_from_operand_id429

concatenate.pivot.5.41:                           ; preds = %concatenate.pivot.5.39
  br label %concat_index_from_operand_id530

concatenate.13.merge24:                           ; preds = %concat_index_from_operand_id530, %concat_index_from_operand_id429, %concat_index_from_operand_id328, %concat_index_from_operand_id227, %concat_index_from_operand_id126, %concat_index_from_operand_id025
  %115 = phi float [ %89, %concat_index_from_operand_id025 ], [ %93, %concat_index_from_operand_id126 ], [ %97, %concat_index_from_operand_id227 ], [ %101, %concat_index_from_operand_id328 ], [ %105, %concat_index_from_operand_id429 ], [ %109, %concat_index_from_operand_id530 ]
  %116 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  store float %115, ptr %116, align 4
  br label %concatenate.pivot.3.49

concat_index_from_operand_id043:                  ; preds = %concatenate.pivot.0.51
  %117 = phi i32 [ 0, %concatenate.pivot.0.51 ]
  %118 = sub nsw i32 %21, %117
  %119 = getelementptr inbounds [8192 x [256 x float]], ptr %arg5, i32 0, i32 %22, i32 %19
  %120 = load float, ptr %119, align 4, !invariant.load !38
  br label %concatenate.13.merge42

concat_index_from_operand_id144:                  ; preds = %concatenate.pivot.1.53
  %121 = phi i32 [ 1, %concatenate.pivot.1.53 ]
  %122 = sub nsw i32 %21, %121
  %123 = getelementptr inbounds [8192 x [256 x float]], ptr %arg4, i32 0, i32 %22, i32 %19
  %124 = load float, ptr %123, align 4, !invariant.load !38
  br label %concatenate.13.merge42

concat_index_from_operand_id245:                  ; preds = %concatenate.pivot.2.54
  %125 = phi i32 [ 2, %concatenate.pivot.2.54 ]
  %126 = sub nsw i32 %21, %125
  %127 = getelementptr inbounds [8192 x [256 x float]], ptr %arg3, i32 0, i32 %22, i32 %19
  %128 = load float, ptr %127, align 4, !invariant.load !38
  br label %concatenate.13.merge42

concat_index_from_operand_id346:                  ; preds = %concatenate.pivot.3.56
  %129 = phi i32 [ 3, %concatenate.pivot.3.56 ]
  %130 = sub nsw i32 %21, %129
  %131 = getelementptr inbounds [8192 x [256 x float]], ptr %arg2, i32 0, i32 %22, i32 %19
  %132 = load float, ptr %131, align 4, !invariant.load !38
  br label %concatenate.13.merge42

concat_index_from_operand_id447:                  ; preds = %concatenate.pivot.4.58
  %133 = phi i32 [ 4, %concatenate.pivot.4.58 ]
  %134 = sub nsw i32 %21, %133
  %135 = getelementptr inbounds [8192 x [256 x float]], ptr %arg1, i32 0, i32 %22, i32 %19
  %136 = load float, ptr %135, align 4, !invariant.load !38
  br label %concatenate.13.merge42

concat_index_from_operand_id548:                  ; preds = %concatenate.pivot.5.59
  %137 = phi i32 [ 5, %concatenate.pivot.5.59 ]
  %138 = sub nsw i32 %21, %137
  %139 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %22, i32 %19
  %140 = load float, ptr %139, align 4, !invariant.load !38
  br label %concatenate.13.merge42

concatenate.pivot.3.49:                           ; preds = %concatenate.13.merge24
  %141 = icmp ult i32 %21, 3
  br i1 %141, label %concatenate.pivot.1.50, label %concatenate.pivot.4.55

concatenate.pivot.1.50:                           ; preds = %concatenate.pivot.3.49
  %142 = icmp ult i32 %21, 1
  br i1 %142, label %concatenate.pivot.0.51, label %concatenate.pivot.2.52

concatenate.pivot.0.51:                           ; preds = %concatenate.pivot.1.50
  br label %concat_index_from_operand_id043

concatenate.pivot.2.52:                           ; preds = %concatenate.pivot.1.50
  %143 = icmp ult i32 %21, 2
  br i1 %143, label %concatenate.pivot.1.53, label %concatenate.pivot.2.54

concatenate.pivot.1.53:                           ; preds = %concatenate.pivot.2.52
  br label %concat_index_from_operand_id144

concatenate.pivot.2.54:                           ; preds = %concatenate.pivot.2.52
  br label %concat_index_from_operand_id245

concatenate.pivot.4.55:                           ; preds = %concatenate.pivot.3.49
  %144 = icmp ult i32 %21, 4
  br i1 %144, label %concatenate.pivot.3.56, label %concatenate.pivot.5.57

concatenate.pivot.3.56:                           ; preds = %concatenate.pivot.4.55
  br label %concat_index_from_operand_id346

concatenate.pivot.5.57:                           ; preds = %concatenate.pivot.4.55
  %145 = icmp ult i32 %21, 5
  br i1 %145, label %concatenate.pivot.4.58, label %concatenate.pivot.5.59

concatenate.pivot.4.58:                           ; preds = %concatenate.pivot.5.57
  br label %concat_index_from_operand_id447

concatenate.pivot.5.59:                           ; preds = %concatenate.pivot.5.57
  br label %concat_index_from_operand_id548

concatenate.13.merge42:                           ; preds = %concat_index_from_operand_id548, %concat_index_from_operand_id447, %concat_index_from_operand_id346, %concat_index_from_operand_id245, %concat_index_from_operand_id144, %concat_index_from_operand_id043
  %146 = phi float [ %120, %concat_index_from_operand_id043 ], [ %124, %concat_index_from_operand_id144 ], [ %128, %concat_index_from_operand_id245 ], [ %132, %concat_index_from_operand_id346 ], [ %136, %concat_index_from_operand_id447 ], [ %140, %concat_index_from_operand_id548 ]
  %147 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  store float %146, ptr %147, align 4
  br label %fusion_17.in_bounds-after
}

define void @concatenate_8(ptr noalias align 16 dereferenceable(31719424) %arg0, ptr noalias align 16 dereferenceable(8388608) %arg1, ptr noalias align 16 dereferenceable(8388608) %arg2, ptr noalias align 16 dereferenceable(524288) %arg3, ptr noalias align 128 dereferenceable(49020928) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 3063808
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 1496
  %5 = udiv i32 %linear_index_base, 1496
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 1496
  %8 = udiv i32 %linear_index1, 1496
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 1496
  %11 = udiv i32 %linear_index2, 1496
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 1496
  %14 = udiv i32 %linear_index3, 1496
  %15 = icmp ult i32 %linear_index_base, 12255232
  br i1 %15, label %concatenate_8.in_bounds-true, label %concatenate_8.in_bounds-after

concatenate_8.in_bounds-after:                    ; preds = %concatenate.5.merge28, %entry
  ret void

concatenate_8.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.1224.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %16 = phi i32 [ 0, %concatenate.pivot.0. ]
  %17 = sub nsw i32 %4, %16
  %18 = udiv i32 %linear_index_base, 1496
  %19 = mul i32 %18, 968
  %20 = add i32 %19, %17
  %21 = udiv i32 %20, 1
  %22 = urem i32 %21, 968
  %23 = udiv i32 %20, 968
  %24 = getelementptr inbounds float, ptr %arg0, i32 %20
  %25 = load float, ptr %24, align 4, !invariant.load !38
  br label %concatenate.5.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.968.1
  %26 = phi i32 [ 968, %concatenate.pivot.968.1 ]
  %27 = sub nsw i32 %4, %26
  %28 = udiv i32 %linear_index_base, 1496
  %29 = mul i32 %28, 256
  %30 = add i32 %29, %27
  %31 = udiv i32 %30, 1
  %32 = urem i32 %31, 256
  %33 = udiv i32 %30, 256
  %34 = getelementptr inbounds float, ptr %arg1, i32 %30
  %35 = load float, ptr %34, align 4, !invariant.load !38
  br label %concatenate.5.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.1224.2
  %36 = phi i32 [ 1224, %concatenate.pivot.1224.2 ]
  %37 = sub nsw i32 %4, %36
  %38 = udiv i32 %linear_index_base, 1496
  %39 = mul i32 %38, 256
  %40 = add i32 %39, %37
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 256
  %43 = udiv i32 %40, 256
  %44 = getelementptr inbounds float, ptr %arg2, i32 %40
  %45 = load float, ptr %44, align 4, !invariant.load !38
  br label %concatenate.5.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.1480.3
  %46 = phi i32 [ 1480, %concatenate.pivot.1480.3 ]
  %47 = sub nsw i32 %4, %46
  %48 = udiv i32 %linear_index_base, 1496
  %49 = mul i32 %48, 16
  %50 = add i32 %49, %47
  %51 = udiv i32 %50, 1
  %52 = urem i32 %51, 16
  %53 = udiv i32 %50, 16
  %54 = getelementptr inbounds float, ptr %arg3, i32 %50
  %55 = load float, ptr %54, align 4, !invariant.load !38
  br label %concatenate.5.merge

concatenate.pivot.1224.:                          ; preds = %concatenate_8.in_bounds-true
  %56 = icmp ult i32 %4, 1224
  br i1 %56, label %concatenate.pivot.968., label %concatenate.pivot.1480.

concatenate.pivot.968.:                           ; preds = %concatenate.pivot.1224.
  %57 = icmp ult i32 %4, 968
  br i1 %57, label %concatenate.pivot.0., label %concatenate.pivot.968.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.968.
  br label %concat_index_from_operand_id0

concatenate.pivot.968.1:                          ; preds = %concatenate.pivot.968.
  br label %concat_index_from_operand_id1

concatenate.pivot.1480.:                          ; preds = %concatenate.pivot.1224.
  %58 = icmp ult i32 %4, 1480
  br i1 %58, label %concatenate.pivot.1224.2, label %concatenate.pivot.1480.3

concatenate.pivot.1224.2:                         ; preds = %concatenate.pivot.1480.
  br label %concat_index_from_operand_id2

concatenate.pivot.1480.3:                         ; preds = %concatenate.pivot.1480.
  br label %concat_index_from_operand_id3

concatenate.5.merge:                              ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %59 = phi float [ %25, %concat_index_from_operand_id0 ], [ %35, %concat_index_from_operand_id1 ], [ %45, %concat_index_from_operand_id2 ], [ %55, %concat_index_from_operand_id3 ]
  %60 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %59, ptr %60, align 4
  br label %concatenate.pivot.1224.9

concat_index_from_operand_id05:                   ; preds = %concatenate.pivot.0.11
  %61 = phi i32 [ 0, %concatenate.pivot.0.11 ]
  %62 = sub nsw i32 %7, %61
  %63 = udiv i32 %linear_index1, 1496
  %64 = mul i32 %63, 968
  %65 = add i32 %64, %62
  %66 = udiv i32 %65, 1
  %67 = urem i32 %66, 968
  %68 = udiv i32 %65, 968
  %69 = getelementptr inbounds float, ptr %arg0, i32 %65
  %70 = load float, ptr %69, align 4, !invariant.load !38
  br label %concatenate.5.merge4

concat_index_from_operand_id16:                   ; preds = %concatenate.pivot.968.12
  %71 = phi i32 [ 968, %concatenate.pivot.968.12 ]
  %72 = sub nsw i32 %7, %71
  %73 = udiv i32 %linear_index1, 1496
  %74 = mul i32 %73, 256
  %75 = add i32 %74, %72
  %76 = udiv i32 %75, 1
  %77 = urem i32 %76, 256
  %78 = udiv i32 %75, 256
  %79 = getelementptr inbounds float, ptr %arg1, i32 %75
  %80 = load float, ptr %79, align 4, !invariant.load !38
  br label %concatenate.5.merge4

concat_index_from_operand_id27:                   ; preds = %concatenate.pivot.1224.14
  %81 = phi i32 [ 1224, %concatenate.pivot.1224.14 ]
  %82 = sub nsw i32 %7, %81
  %83 = udiv i32 %linear_index1, 1496
  %84 = mul i32 %83, 256
  %85 = add i32 %84, %82
  %86 = udiv i32 %85, 1
  %87 = urem i32 %86, 256
  %88 = udiv i32 %85, 256
  %89 = getelementptr inbounds float, ptr %arg2, i32 %85
  %90 = load float, ptr %89, align 4, !invariant.load !38
  br label %concatenate.5.merge4

concat_index_from_operand_id38:                   ; preds = %concatenate.pivot.1480.15
  %91 = phi i32 [ 1480, %concatenate.pivot.1480.15 ]
  %92 = sub nsw i32 %7, %91
  %93 = udiv i32 %linear_index1, 1496
  %94 = mul i32 %93, 16
  %95 = add i32 %94, %92
  %96 = udiv i32 %95, 1
  %97 = urem i32 %96, 16
  %98 = udiv i32 %95, 16
  %99 = getelementptr inbounds float, ptr %arg3, i32 %95
  %100 = load float, ptr %99, align 4, !invariant.load !38
  br label %concatenate.5.merge4

concatenate.pivot.1224.9:                         ; preds = %concatenate.5.merge
  %101 = icmp ult i32 %7, 1224
  br i1 %101, label %concatenate.pivot.968.10, label %concatenate.pivot.1480.13

concatenate.pivot.968.10:                         ; preds = %concatenate.pivot.1224.9
  %102 = icmp ult i32 %7, 968
  br i1 %102, label %concatenate.pivot.0.11, label %concatenate.pivot.968.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.968.10
  br label %concat_index_from_operand_id05

concatenate.pivot.968.12:                         ; preds = %concatenate.pivot.968.10
  br label %concat_index_from_operand_id16

concatenate.pivot.1480.13:                        ; preds = %concatenate.pivot.1224.9
  %103 = icmp ult i32 %7, 1480
  br i1 %103, label %concatenate.pivot.1224.14, label %concatenate.pivot.1480.15

concatenate.pivot.1224.14:                        ; preds = %concatenate.pivot.1480.13
  br label %concat_index_from_operand_id27

concatenate.pivot.1480.15:                        ; preds = %concatenate.pivot.1480.13
  br label %concat_index_from_operand_id38

concatenate.5.merge4:                             ; preds = %concat_index_from_operand_id38, %concat_index_from_operand_id27, %concat_index_from_operand_id16, %concat_index_from_operand_id05
  %104 = phi float [ %70, %concat_index_from_operand_id05 ], [ %80, %concat_index_from_operand_id16 ], [ %90, %concat_index_from_operand_id27 ], [ %100, %concat_index_from_operand_id38 ]
  %105 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %104, ptr %105, align 4
  br label %concatenate.pivot.1224.21

concat_index_from_operand_id017:                  ; preds = %concatenate.pivot.0.23
  %106 = phi i32 [ 0, %concatenate.pivot.0.23 ]
  %107 = sub nsw i32 %10, %106
  %108 = udiv i32 %linear_index2, 1496
  %109 = mul i32 %108, 968
  %110 = add i32 %109, %107
  %111 = udiv i32 %110, 1
  %112 = urem i32 %111, 968
  %113 = udiv i32 %110, 968
  %114 = getelementptr inbounds float, ptr %arg0, i32 %110
  %115 = load float, ptr %114, align 4, !invariant.load !38
  br label %concatenate.5.merge16

concat_index_from_operand_id118:                  ; preds = %concatenate.pivot.968.24
  %116 = phi i32 [ 968, %concatenate.pivot.968.24 ]
  %117 = sub nsw i32 %10, %116
  %118 = udiv i32 %linear_index2, 1496
  %119 = mul i32 %118, 256
  %120 = add i32 %119, %117
  %121 = udiv i32 %120, 1
  %122 = urem i32 %121, 256
  %123 = udiv i32 %120, 256
  %124 = getelementptr inbounds float, ptr %arg1, i32 %120
  %125 = load float, ptr %124, align 4, !invariant.load !38
  br label %concatenate.5.merge16

concat_index_from_operand_id219:                  ; preds = %concatenate.pivot.1224.26
  %126 = phi i32 [ 1224, %concatenate.pivot.1224.26 ]
  %127 = sub nsw i32 %10, %126
  %128 = udiv i32 %linear_index2, 1496
  %129 = mul i32 %128, 256
  %130 = add i32 %129, %127
  %131 = udiv i32 %130, 1
  %132 = urem i32 %131, 256
  %133 = udiv i32 %130, 256
  %134 = getelementptr inbounds float, ptr %arg2, i32 %130
  %135 = load float, ptr %134, align 4, !invariant.load !38
  br label %concatenate.5.merge16

concat_index_from_operand_id320:                  ; preds = %concatenate.pivot.1480.27
  %136 = phi i32 [ 1480, %concatenate.pivot.1480.27 ]
  %137 = sub nsw i32 %10, %136
  %138 = udiv i32 %linear_index2, 1496
  %139 = mul i32 %138, 16
  %140 = add i32 %139, %137
  %141 = udiv i32 %140, 1
  %142 = urem i32 %141, 16
  %143 = udiv i32 %140, 16
  %144 = getelementptr inbounds float, ptr %arg3, i32 %140
  %145 = load float, ptr %144, align 4, !invariant.load !38
  br label %concatenate.5.merge16

concatenate.pivot.1224.21:                        ; preds = %concatenate.5.merge4
  %146 = icmp ult i32 %10, 1224
  br i1 %146, label %concatenate.pivot.968.22, label %concatenate.pivot.1480.25

concatenate.pivot.968.22:                         ; preds = %concatenate.pivot.1224.21
  %147 = icmp ult i32 %10, 968
  br i1 %147, label %concatenate.pivot.0.23, label %concatenate.pivot.968.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.968.22
  br label %concat_index_from_operand_id017

concatenate.pivot.968.24:                         ; preds = %concatenate.pivot.968.22
  br label %concat_index_from_operand_id118

concatenate.pivot.1480.25:                        ; preds = %concatenate.pivot.1224.21
  %148 = icmp ult i32 %10, 1480
  br i1 %148, label %concatenate.pivot.1224.26, label %concatenate.pivot.1480.27

concatenate.pivot.1224.26:                        ; preds = %concatenate.pivot.1480.25
  br label %concat_index_from_operand_id219

concatenate.pivot.1480.27:                        ; preds = %concatenate.pivot.1480.25
  br label %concat_index_from_operand_id320

concatenate.5.merge16:                            ; preds = %concat_index_from_operand_id320, %concat_index_from_operand_id219, %concat_index_from_operand_id118, %concat_index_from_operand_id017
  %149 = phi float [ %115, %concat_index_from_operand_id017 ], [ %125, %concat_index_from_operand_id118 ], [ %135, %concat_index_from_operand_id219 ], [ %145, %concat_index_from_operand_id320 ]
  %150 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %149, ptr %150, align 4
  br label %concatenate.pivot.1224.33

concat_index_from_operand_id029:                  ; preds = %concatenate.pivot.0.35
  %151 = phi i32 [ 0, %concatenate.pivot.0.35 ]
  %152 = sub nsw i32 %13, %151
  %153 = udiv i32 %linear_index3, 1496
  %154 = mul i32 %153, 968
  %155 = add i32 %154, %152
  %156 = udiv i32 %155, 1
  %157 = urem i32 %156, 968
  %158 = udiv i32 %155, 968
  %159 = getelementptr inbounds float, ptr %arg0, i32 %155
  %160 = load float, ptr %159, align 4, !invariant.load !38
  br label %concatenate.5.merge28

concat_index_from_operand_id130:                  ; preds = %concatenate.pivot.968.36
  %161 = phi i32 [ 968, %concatenate.pivot.968.36 ]
  %162 = sub nsw i32 %13, %161
  %163 = udiv i32 %linear_index3, 1496
  %164 = mul i32 %163, 256
  %165 = add i32 %164, %162
  %166 = udiv i32 %165, 1
  %167 = urem i32 %166, 256
  %168 = udiv i32 %165, 256
  %169 = getelementptr inbounds float, ptr %arg1, i32 %165
  %170 = load float, ptr %169, align 4, !invariant.load !38
  br label %concatenate.5.merge28

concat_index_from_operand_id231:                  ; preds = %concatenate.pivot.1224.38
  %171 = phi i32 [ 1224, %concatenate.pivot.1224.38 ]
  %172 = sub nsw i32 %13, %171
  %173 = udiv i32 %linear_index3, 1496
  %174 = mul i32 %173, 256
  %175 = add i32 %174, %172
  %176 = udiv i32 %175, 1
  %177 = urem i32 %176, 256
  %178 = udiv i32 %175, 256
  %179 = getelementptr inbounds float, ptr %arg2, i32 %175
  %180 = load float, ptr %179, align 4, !invariant.load !38
  br label %concatenate.5.merge28

concat_index_from_operand_id332:                  ; preds = %concatenate.pivot.1480.39
  %181 = phi i32 [ 1480, %concatenate.pivot.1480.39 ]
  %182 = sub nsw i32 %13, %181
  %183 = udiv i32 %linear_index3, 1496
  %184 = mul i32 %183, 16
  %185 = add i32 %184, %182
  %186 = udiv i32 %185, 1
  %187 = urem i32 %186, 16
  %188 = udiv i32 %185, 16
  %189 = getelementptr inbounds float, ptr %arg3, i32 %185
  %190 = load float, ptr %189, align 4, !invariant.load !38
  br label %concatenate.5.merge28

concatenate.pivot.1224.33:                        ; preds = %concatenate.5.merge16
  %191 = icmp ult i32 %13, 1224
  br i1 %191, label %concatenate.pivot.968.34, label %concatenate.pivot.1480.37

concatenate.pivot.968.34:                         ; preds = %concatenate.pivot.1224.33
  %192 = icmp ult i32 %13, 968
  br i1 %192, label %concatenate.pivot.0.35, label %concatenate.pivot.968.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.968.34
  br label %concat_index_from_operand_id029

concatenate.pivot.968.36:                         ; preds = %concatenate.pivot.968.34
  br label %concat_index_from_operand_id130

concatenate.pivot.1480.37:                        ; preds = %concatenate.pivot.1224.33
  %193 = icmp ult i32 %13, 1480
  br i1 %193, label %concatenate.pivot.1224.38, label %concatenate.pivot.1480.39

concatenate.pivot.1224.38:                        ; preds = %concatenate.pivot.1480.37
  br label %concat_index_from_operand_id231

concatenate.pivot.1480.39:                        ; preds = %concatenate.pivot.1480.37
  br label %concat_index_from_operand_id332

concatenate.5.merge28:                            ; preds = %concat_index_from_operand_id332, %concat_index_from_operand_id231, %concat_index_from_operand_id130, %concat_index_from_operand_id029
  %194 = phi float [ %160, %concat_index_from_operand_id029 ], [ %170, %concat_index_from_operand_id130 ], [ %180, %concat_index_from_operand_id231 ], [ %190, %concat_index_from_operand_id332 ]
  %195 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %194, ptr %195, align 4
  br label %concatenate_8.in_bounds-after
}

define void @slice_10(ptr noalias align 128 dereferenceable(20119552) %arg0, ptr noalias align 128 dereferenceable(2949120) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !45
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 184320
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 90
  %5 = udiv i32 %linear_index_base, 90
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 90
  %8 = udiv i32 %linear_index1, 90
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 90
  %11 = udiv i32 %linear_index2, 90
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 90
  %14 = udiv i32 %linear_index3, 90
  %15 = icmp ult i32 %linear_index_base, 737280
  br i1 %15, label %slice_10.in_bounds-true, label %slice_10.in_bounds-after

slice_10.in_bounds-after:                         ; preds = %slice_10.in_bounds-true, %entry
  ret void

slice_10.in_bounds-true:                          ; preds = %entry
  %16 = add i32 %5, 0
  %17 = add i32 %4, 512
  %18 = getelementptr inbounds [8192 x [614 x float]], ptr %arg0, i32 0, i32 %16, i32 %17
  %19 = load float, ptr %18, align 4, !invariant.load !38
  %20 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %19, ptr %20, align 4
  %21 = add i32 %8, 0
  %22 = add i32 %7, 512
  %23 = getelementptr inbounds [8192 x [614 x float]], ptr %arg0, i32 0, i32 %21, i32 %22
  %24 = load float, ptr %23, align 4, !invariant.load !38
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %24, ptr %25, align 4
  %26 = add i32 %11, 0
  %27 = add i32 %10, 512
  %28 = getelementptr inbounds [8192 x [614 x float]], ptr %arg0, i32 0, i32 %26, i32 %27
  %29 = load float, ptr %28, align 4, !invariant.load !38
  %30 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %29, ptr %30, align 4
  %31 = add i32 %14, 0
  %32 = add i32 %13, 512
  %33 = getelementptr inbounds [8192 x [614 x float]], ptr %arg0, i32 0, i32 %31, i32 %32
  %34 = load float, ptr %33, align 4, !invariant.load !38
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %34, ptr %35, align 4
  br label %slice_10.in_bounds-after
}

define void @fusion_41(ptr noalias align 128 dereferenceable(2949120) %arg0, ptr noalias align 16 dereferenceable(360) %arg1, ptr noalias align 128 dereferenceable(491520) %arg2) {
entry:
  %return_buffer37 = alloca float, align 4
  %parameter_buffer36 = alloca float, align 4
  %parameter_buffer35 = alloca float, align 4
  %reduce.11.inner.invar_address.reduction_dim.231 = alloca i32, align 4
  %accumulator_026 = alloca float, align 4
  %return_buffer25 = alloca float, align 4
  %parameter_buffer24 = alloca float, align 4
  %parameter_buffer23 = alloca float, align 4
  %reduce.11.inner.invar_address.reduction_dim.219 = alloca i32, align 4
  %accumulator_014 = alloca float, align 4
  %return_buffer13 = alloca float, align 4
  %parameter_buffer12 = alloca float, align 4
  %parameter_buffer11 = alloca float, align 4
  %reduce.11.inner.invar_address.reduction_dim.27 = alloca i32, align 4
  %accumulator_02 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.11.inner.invar_address.reduction_dim.2 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !46
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 30720
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 15
  %5 = udiv i32 %linear_index_base, 15
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 15
  %8 = udiv i32 %linear_index1, 15
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 15
  %11 = udiv i32 %linear_index2, 15
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 15
  %14 = udiv i32 %linear_index3, 15
  %15 = icmp ult i32 %linear_index_base, 122880
  br i1 %15, label %fusion_41.in_bounds-true, label %fusion_41.in_bounds-after

fusion_41.in_bounds-after:                        ; preds = %reduce.11.inner.loop_exit.reduction_dim.228, %entry
  ret void

fusion_41.in_bounds-true:                         ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @3, align 4
  store float %region_0_12_constant_6, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.11.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.2

reduce.11.inner.loop_header.reduction_dim.2:      ; preds = %reduce.11.inner.loop_body.reduction_dim.2, %fusion_41.in_bounds-true
  %reduce.11.inner.indvar.reduction_dim.2 = load i32, ptr %reduce.11.inner.invar_address.reduction_dim.2, align 4
  %16 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.2, 6
  br i1 %16, label %reduce.11.inner.loop_exit.reduction_dim.2, label %reduce.11.inner.loop_body.reduction_dim.2

reduce.11.inner.loop_body.reduction_dim.2:        ; preds = %reduce.11.inner.loop_header.reduction_dim.2
  %17 = load float, ptr %accumulator_0, align 4
  %18 = mul nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.2, 1
  %19 = add nuw nsw i32 0, %18
  %20 = mul nuw nsw i32 %4, 6
  %21 = add nuw nsw i32 %19, %20
  %22 = udiv i32 %21, 90
  %23 = mul nuw nsw i32 %5, 1
  %24 = add nuw nsw i32 0, %23
  %25 = udiv i32 %24, 8192
  %26 = getelementptr inbounds [8192 x [90 x float]], ptr %arg0, i32 0, i32 %24, i32 %21
  %27 = load float, ptr %26, align 4, !invariant.load !38
  %28 = getelementptr inbounds [90 x float], ptr %arg1, i32 0, i32 %21
  %29 = load float, ptr %28, align 4, !invariant.load !38
  %add.4 = fadd float %27, %29
  store float %17, ptr %parameter_buffer, align 4
  store float %add.4, ptr %parameter_buffer1, align 4
  call void @region_1_7(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %30 = load float, ptr %return_buffer, align 4
  store float %30, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.2, 1
  store i32 %invar.inc, ptr %reduce.11.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.2

reduce.11.inner.loop_exit.reduction_dim.2:        ; preds = %reduce.11.inner.loop_header.reduction_dim.2
  %31 = load float, ptr %accumulator_0, align 4
  %32 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %31, ptr %32, align 4
  %region_0_12_constant_63 = load float, ptr @3, align 4
  store float %region_0_12_constant_63, ptr %accumulator_02, align 4
  store i32 0, ptr %reduce.11.inner.invar_address.reduction_dim.27, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.25

reduce.11.inner.loop_header.reduction_dim.25:     ; preds = %reduce.11.inner.loop_body.reduction_dim.26, %reduce.11.inner.loop_exit.reduction_dim.2
  %reduce.11.inner.indvar.reduction_dim.28 = load i32, ptr %reduce.11.inner.invar_address.reduction_dim.27, align 4
  %33 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.28, 6
  br i1 %33, label %reduce.11.inner.loop_exit.reduction_dim.24, label %reduce.11.inner.loop_body.reduction_dim.26

reduce.11.inner.loop_body.reduction_dim.26:       ; preds = %reduce.11.inner.loop_header.reduction_dim.25
  %34 = load float, ptr %accumulator_02, align 4
  %35 = mul nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.28, 1
  %36 = add nuw nsw i32 0, %35
  %37 = mul nuw nsw i32 %7, 6
  %38 = add nuw nsw i32 %36, %37
  %39 = udiv i32 %38, 90
  %40 = mul nuw nsw i32 %8, 1
  %41 = add nuw nsw i32 0, %40
  %42 = udiv i32 %41, 8192
  %43 = getelementptr inbounds [8192 x [90 x float]], ptr %arg0, i32 0, i32 %41, i32 %38
  %44 = load float, ptr %43, align 4, !invariant.load !38
  %45 = getelementptr inbounds [90 x float], ptr %arg1, i32 0, i32 %38
  %46 = load float, ptr %45, align 4, !invariant.load !38
  %add.410 = fadd float %44, %46
  store float %34, ptr %parameter_buffer11, align 4
  store float %add.410, ptr %parameter_buffer12, align 4
  call void @region_1_7(ptr %parameter_buffer11, ptr %parameter_buffer12, ptr %return_buffer13)
  %47 = load float, ptr %return_buffer13, align 4
  store float %47, ptr %accumulator_02, align 4
  %invar.inc9 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.28, 1
  store i32 %invar.inc9, ptr %reduce.11.inner.invar_address.reduction_dim.27, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.25

reduce.11.inner.loop_exit.reduction_dim.24:       ; preds = %reduce.11.inner.loop_header.reduction_dim.25
  %48 = load float, ptr %accumulator_02, align 4
  %49 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %48, ptr %49, align 4
  %region_0_12_constant_615 = load float, ptr @3, align 4
  store float %region_0_12_constant_615, ptr %accumulator_014, align 4
  store i32 0, ptr %reduce.11.inner.invar_address.reduction_dim.219, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.217

reduce.11.inner.loop_header.reduction_dim.217:    ; preds = %reduce.11.inner.loop_body.reduction_dim.218, %reduce.11.inner.loop_exit.reduction_dim.24
  %reduce.11.inner.indvar.reduction_dim.220 = load i32, ptr %reduce.11.inner.invar_address.reduction_dim.219, align 4
  %50 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.220, 6
  br i1 %50, label %reduce.11.inner.loop_exit.reduction_dim.216, label %reduce.11.inner.loop_body.reduction_dim.218

reduce.11.inner.loop_body.reduction_dim.218:      ; preds = %reduce.11.inner.loop_header.reduction_dim.217
  %51 = load float, ptr %accumulator_014, align 4
  %52 = mul nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.220, 1
  %53 = add nuw nsw i32 0, %52
  %54 = mul nuw nsw i32 %10, 6
  %55 = add nuw nsw i32 %53, %54
  %56 = udiv i32 %55, 90
  %57 = mul nuw nsw i32 %11, 1
  %58 = add nuw nsw i32 0, %57
  %59 = udiv i32 %58, 8192
  %60 = getelementptr inbounds [8192 x [90 x float]], ptr %arg0, i32 0, i32 %58, i32 %55
  %61 = load float, ptr %60, align 4, !invariant.load !38
  %62 = getelementptr inbounds [90 x float], ptr %arg1, i32 0, i32 %55
  %63 = load float, ptr %62, align 4, !invariant.load !38
  %add.422 = fadd float %61, %63
  store float %51, ptr %parameter_buffer23, align 4
  store float %add.422, ptr %parameter_buffer24, align 4
  call void @region_1_7(ptr %parameter_buffer23, ptr %parameter_buffer24, ptr %return_buffer25)
  %64 = load float, ptr %return_buffer25, align 4
  store float %64, ptr %accumulator_014, align 4
  %invar.inc21 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.220, 1
  store i32 %invar.inc21, ptr %reduce.11.inner.invar_address.reduction_dim.219, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.217

reduce.11.inner.loop_exit.reduction_dim.216:      ; preds = %reduce.11.inner.loop_header.reduction_dim.217
  %65 = load float, ptr %accumulator_014, align 4
  %66 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %65, ptr %66, align 4
  %region_0_12_constant_627 = load float, ptr @3, align 4
  store float %region_0_12_constant_627, ptr %accumulator_026, align 4
  store i32 0, ptr %reduce.11.inner.invar_address.reduction_dim.231, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.229

reduce.11.inner.loop_header.reduction_dim.229:    ; preds = %reduce.11.inner.loop_body.reduction_dim.230, %reduce.11.inner.loop_exit.reduction_dim.216
  %reduce.11.inner.indvar.reduction_dim.232 = load i32, ptr %reduce.11.inner.invar_address.reduction_dim.231, align 4
  %67 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.232, 6
  br i1 %67, label %reduce.11.inner.loop_exit.reduction_dim.228, label %reduce.11.inner.loop_body.reduction_dim.230

reduce.11.inner.loop_body.reduction_dim.230:      ; preds = %reduce.11.inner.loop_header.reduction_dim.229
  %68 = load float, ptr %accumulator_026, align 4
  %69 = mul nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.232, 1
  %70 = add nuw nsw i32 0, %69
  %71 = mul nuw nsw i32 %13, 6
  %72 = add nuw nsw i32 %70, %71
  %73 = udiv i32 %72, 90
  %74 = mul nuw nsw i32 %14, 1
  %75 = add nuw nsw i32 0, %74
  %76 = udiv i32 %75, 8192
  %77 = getelementptr inbounds [8192 x [90 x float]], ptr %arg0, i32 0, i32 %75, i32 %72
  %78 = load float, ptr %77, align 4, !invariant.load !38
  %79 = getelementptr inbounds [90 x float], ptr %arg1, i32 0, i32 %72
  %80 = load float, ptr %79, align 4, !invariant.load !38
  %add.434 = fadd float %78, %80
  store float %68, ptr %parameter_buffer35, align 4
  store float %add.434, ptr %parameter_buffer36, align 4
  call void @region_1_7(ptr %parameter_buffer35, ptr %parameter_buffer36, ptr %return_buffer37)
  %81 = load float, ptr %return_buffer37, align 4
  store float %81, ptr %accumulator_026, align 4
  %invar.inc33 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.232, 1
  store i32 %invar.inc33, ptr %reduce.11.inner.invar_address.reduction_dim.231, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.229

reduce.11.inner.loop_exit.reduction_dim.228:      ; preds = %reduce.11.inner.loop_header.reduction_dim.229
  %82 = load float, ptr %accumulator_026, align 4
  %83 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %82, ptr %83, align 4
  br label %fusion_41.in_bounds-after
}

define internal void @region_1_7(ptr dereferenceable(4) %Arg_0.8.typed, ptr dereferenceable(4) %Arg_1.9.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %maximum.10.typed = alloca float, align 4
  %Arg_0.8 = load float, ptr %Arg_0.8.typed, align 4
  %Arg_1.9 = load float, ptr %Arg_1.9.typed, align 4
  %0 = fcmp oge float %Arg_0.8, %Arg_1.9
  %1 = fcmp une float %Arg_0.8, %Arg_0.8
  %2 = or i1 %0, %1
  %maximum.10 = select i1 %2, float %Arg_0.8, float %Arg_1.9
  store float %maximum.10, ptr %maximum.10.typed, align 4
  %load_ret_value = load float, ptr %maximum.10.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_42(ptr noalias align 128 dereferenceable(491520) %arg0, ptr noalias align 128 dereferenceable(2949120) %arg1, ptr noalias align 16 dereferenceable(360) %arg2, ptr noalias align 128 dereferenceable(491520) %arg3) {
entry:
  %return_buffer40 = alloca float, align 4
  %parameter_buffer39 = alloca float, align 4
  %parameter_buffer38 = alloca float, align 4
  %reduce.15.inner.invar_address.reduction_dim.233 = alloca i32, align 4
  %accumulator_028 = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %parameter_buffer26 = alloca float, align 4
  %parameter_buffer25 = alloca float, align 4
  %reduce.15.inner.invar_address.reduction_dim.220 = alloca i32, align 4
  %accumulator_015 = alloca float, align 4
  %return_buffer14 = alloca float, align 4
  %parameter_buffer13 = alloca float, align 4
  %parameter_buffer12 = alloca float, align 4
  %reduce.15.inner.invar_address.reduction_dim.27 = alloca i32, align 4
  %accumulator_02 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.15.inner.invar_address.reduction_dim.2 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !46
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 30720
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 15
  %5 = udiv i32 %linear_index_base, 15
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 15
  %8 = udiv i32 %linear_index1, 15
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 15
  %11 = udiv i32 %linear_index2, 15
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 15
  %14 = udiv i32 %linear_index3, 15
  %15 = icmp ult i32 %linear_index_base, 122880
  br i1 %15, label %fusion_42.in_bounds-true, label %fusion_42.in_bounds-after

fusion_42.in_bounds-after:                        ; preds = %reduce.15.inner.loop_exit.reduction_dim.230, %entry
  ret void

fusion_42.in_bounds-true:                         ; preds = %entry
  %region_0_16_constant_10 = load float, ptr @4, align 4
  store float %region_0_16_constant_10, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.15.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.15.inner.loop_header.reduction_dim.2

reduce.15.inner.loop_header.reduction_dim.2:      ; preds = %reduce.15.inner.loop_body.reduction_dim.2, %fusion_42.in_bounds-true
  %reduce.15.inner.indvar.reduction_dim.2 = load i32, ptr %reduce.15.inner.invar_address.reduction_dim.2, align 4
  %16 = icmp uge i32 %reduce.15.inner.indvar.reduction_dim.2, 6
  br i1 %16, label %reduce.15.inner.loop_exit.reduction_dim.2, label %reduce.15.inner.loop_body.reduction_dim.2

reduce.15.inner.loop_body.reduction_dim.2:        ; preds = %reduce.15.inner.loop_header.reduction_dim.2
  %17 = load float, ptr %accumulator_0, align 4
  %18 = mul nuw nsw i32 %reduce.15.inner.indvar.reduction_dim.2, 1
  %19 = add nuw nsw i32 0, %18
  %20 = mul nuw nsw i32 %4, 6
  %21 = add nuw nsw i32 %19, %20
  %22 = udiv i32 %21, 90
  %23 = mul nuw nsw i32 %5, 1
  %24 = add nuw nsw i32 0, %23
  %25 = udiv i32 %24, 8192
  %26 = getelementptr inbounds [8192 x [90 x float]], ptr %arg1, i32 0, i32 %24, i32 %21
  %27 = load float, ptr %26, align 4, !invariant.load !38
  %28 = getelementptr inbounds [90 x float], ptr %arg2, i32 0, i32 %21
  %29 = load float, ptr %28, align 4, !invariant.load !38
  %add.5 = fadd float %27, %29
  %30 = getelementptr inbounds [8192 x [15 x float]], ptr %arg0, i32 0, i32 %5, i32 %4
  %31 = load float, ptr %30, align 4, !invariant.load !38
  %subtract.8 = fsub float %add.5, %31
  %32 = call float @__nv_expf(float %subtract.8)
  store float %17, ptr %parameter_buffer, align 4
  store float %32, ptr %parameter_buffer1, align 4
  call void @region_1_11(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %33 = load float, ptr %return_buffer, align 4
  store float %33, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.15.inner.indvar.reduction_dim.2, 1
  store i32 %invar.inc, ptr %reduce.15.inner.invar_address.reduction_dim.2, align 4
  br label %reduce.15.inner.loop_header.reduction_dim.2

reduce.15.inner.loop_exit.reduction_dim.2:        ; preds = %reduce.15.inner.loop_header.reduction_dim.2
  %34 = load float, ptr %accumulator_0, align 4
  %35 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %34, ptr %35, align 4
  %region_0_16_constant_103 = load float, ptr @4, align 4
  store float %region_0_16_constant_103, ptr %accumulator_02, align 4
  store i32 0, ptr %reduce.15.inner.invar_address.reduction_dim.27, align 4
  br label %reduce.15.inner.loop_header.reduction_dim.25

reduce.15.inner.loop_header.reduction_dim.25:     ; preds = %reduce.15.inner.loop_body.reduction_dim.26, %reduce.15.inner.loop_exit.reduction_dim.2
  %reduce.15.inner.indvar.reduction_dim.28 = load i32, ptr %reduce.15.inner.invar_address.reduction_dim.27, align 4
  %36 = icmp uge i32 %reduce.15.inner.indvar.reduction_dim.28, 6
  br i1 %36, label %reduce.15.inner.loop_exit.reduction_dim.24, label %reduce.15.inner.loop_body.reduction_dim.26

reduce.15.inner.loop_body.reduction_dim.26:       ; preds = %reduce.15.inner.loop_header.reduction_dim.25
  %37 = load float, ptr %accumulator_02, align 4
  %38 = mul nuw nsw i32 %reduce.15.inner.indvar.reduction_dim.28, 1
  %39 = add nuw nsw i32 0, %38
  %40 = mul nuw nsw i32 %7, 6
  %41 = add nuw nsw i32 %39, %40
  %42 = udiv i32 %41, 90
  %43 = mul nuw nsw i32 %8, 1
  %44 = add nuw nsw i32 0, %43
  %45 = udiv i32 %44, 8192
  %46 = getelementptr inbounds [8192 x [90 x float]], ptr %arg1, i32 0, i32 %44, i32 %41
  %47 = load float, ptr %46, align 4, !invariant.load !38
  %48 = getelementptr inbounds [90 x float], ptr %arg2, i32 0, i32 %41
  %49 = load float, ptr %48, align 4, !invariant.load !38
  %add.510 = fadd float %47, %49
  %50 = getelementptr inbounds [8192 x [15 x float]], ptr %arg0, i32 0, i32 %8, i32 %7
  %51 = load float, ptr %50, align 4, !invariant.load !38
  %subtract.811 = fsub float %add.510, %51
  %52 = call float @__nv_expf(float %subtract.811)
  store float %37, ptr %parameter_buffer12, align 4
  store float %52, ptr %parameter_buffer13, align 4
  call void @region_1_11(ptr %parameter_buffer12, ptr %parameter_buffer13, ptr %return_buffer14)
  %53 = load float, ptr %return_buffer14, align 4
  store float %53, ptr %accumulator_02, align 4
  %invar.inc9 = add nuw nsw i32 %reduce.15.inner.indvar.reduction_dim.28, 1
  store i32 %invar.inc9, ptr %reduce.15.inner.invar_address.reduction_dim.27, align 4
  br label %reduce.15.inner.loop_header.reduction_dim.25

reduce.15.inner.loop_exit.reduction_dim.24:       ; preds = %reduce.15.inner.loop_header.reduction_dim.25
  %54 = load float, ptr %accumulator_02, align 4
  %55 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %54, ptr %55, align 4
  %region_0_16_constant_1016 = load float, ptr @4, align 4
  store float %region_0_16_constant_1016, ptr %accumulator_015, align 4
  store i32 0, ptr %reduce.15.inner.invar_address.reduction_dim.220, align 4
  br label %reduce.15.inner.loop_header.reduction_dim.218

reduce.15.inner.loop_header.reduction_dim.218:    ; preds = %reduce.15.inner.loop_body.reduction_dim.219, %reduce.15.inner.loop_exit.reduction_dim.24
  %reduce.15.inner.indvar.reduction_dim.221 = load i32, ptr %reduce.15.inner.invar_address.reduction_dim.220, align 4
  %56 = icmp uge i32 %reduce.15.inner.indvar.reduction_dim.221, 6
  br i1 %56, label %reduce.15.inner.loop_exit.reduction_dim.217, label %reduce.15.inner.loop_body.reduction_dim.219

reduce.15.inner.loop_body.reduction_dim.219:      ; preds = %reduce.15.inner.loop_header.reduction_dim.218
  %57 = load float, ptr %accumulator_015, align 4
  %58 = mul nuw nsw i32 %reduce.15.inner.indvar.reduction_dim.221, 1
  %59 = add nuw nsw i32 0, %58
  %60 = mul nuw nsw i32 %10, 6
  %61 = add nuw nsw i32 %59, %60
  %62 = udiv i32 %61, 90
  %63 = mul nuw nsw i32 %11, 1
  %64 = add nuw nsw i32 0, %63
  %65 = udiv i32 %64, 8192
  %66 = getelementptr inbounds [8192 x [90 x float]], ptr %arg1, i32 0, i32 %64, i32 %61
  %67 = load float, ptr %66, align 4, !invariant.load !38
  %68 = getelementptr inbounds [90 x float], ptr %arg2, i32 0, i32 %61
  %69 = load float, ptr %68, align 4, !invariant.load !38
  %add.523 = fadd float %67, %69
  %70 = getelementptr inbounds [8192 x [15 x float]], ptr %arg0, i32 0, i32 %11, i32 %10
  %71 = load float, ptr %70, align 4, !invariant.load !38
  %subtract.824 = fsub float %add.523, %71
  %72 = call float @__nv_expf(float %subtract.824)
  store float %57, ptr %parameter_buffer25, align 4
  store float %72, ptr %parameter_buffer26, align 4
  call void @region_1_11(ptr %parameter_buffer25, ptr %parameter_buffer26, ptr %return_buffer27)
  %73 = load float, ptr %return_buffer27, align 4
  store float %73, ptr %accumulator_015, align 4
  %invar.inc22 = add nuw nsw i32 %reduce.15.inner.indvar.reduction_dim.221, 1
  store i32 %invar.inc22, ptr %reduce.15.inner.invar_address.reduction_dim.220, align 4
  br label %reduce.15.inner.loop_header.reduction_dim.218

reduce.15.inner.loop_exit.reduction_dim.217:      ; preds = %reduce.15.inner.loop_header.reduction_dim.218
  %74 = load float, ptr %accumulator_015, align 4
  %75 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %74, ptr %75, align 4
  %region_0_16_constant_1029 = load float, ptr @4, align 4
  store float %region_0_16_constant_1029, ptr %accumulator_028, align 4
  store i32 0, ptr %reduce.15.inner.invar_address.reduction_dim.233, align 4
  br label %reduce.15.inner.loop_header.reduction_dim.231

reduce.15.inner.loop_header.reduction_dim.231:    ; preds = %reduce.15.inner.loop_body.reduction_dim.232, %reduce.15.inner.loop_exit.reduction_dim.217
  %reduce.15.inner.indvar.reduction_dim.234 = load i32, ptr %reduce.15.inner.invar_address.reduction_dim.233, align 4
  %76 = icmp uge i32 %reduce.15.inner.indvar.reduction_dim.234, 6
  br i1 %76, label %reduce.15.inner.loop_exit.reduction_dim.230, label %reduce.15.inner.loop_body.reduction_dim.232

reduce.15.inner.loop_body.reduction_dim.232:      ; preds = %reduce.15.inner.loop_header.reduction_dim.231
  %77 = load float, ptr %accumulator_028, align 4
  %78 = mul nuw nsw i32 %reduce.15.inner.indvar.reduction_dim.234, 1
  %79 = add nuw nsw i32 0, %78
  %80 = mul nuw nsw i32 %13, 6
  %81 = add nuw nsw i32 %79, %80
  %82 = udiv i32 %81, 90
  %83 = mul nuw nsw i32 %14, 1
  %84 = add nuw nsw i32 0, %83
  %85 = udiv i32 %84, 8192
  %86 = getelementptr inbounds [8192 x [90 x float]], ptr %arg1, i32 0, i32 %84, i32 %81
  %87 = load float, ptr %86, align 4, !invariant.load !38
  %88 = getelementptr inbounds [90 x float], ptr %arg2, i32 0, i32 %81
  %89 = load float, ptr %88, align 4, !invariant.load !38
  %add.536 = fadd float %87, %89
  %90 = getelementptr inbounds [8192 x [15 x float]], ptr %arg0, i32 0, i32 %14, i32 %13
  %91 = load float, ptr %90, align 4, !invariant.load !38
  %subtract.837 = fsub float %add.536, %91
  %92 = call float @__nv_expf(float %subtract.837)
  store float %77, ptr %parameter_buffer38, align 4
  store float %92, ptr %parameter_buffer39, align 4
  call void @region_1_11(ptr %parameter_buffer38, ptr %parameter_buffer39, ptr %return_buffer40)
  %93 = load float, ptr %return_buffer40, align 4
  store float %93, ptr %accumulator_028, align 4
  %invar.inc35 = add nuw nsw i32 %reduce.15.inner.indvar.reduction_dim.234, 1
  store i32 %invar.inc35, ptr %reduce.15.inner.invar_address.reduction_dim.233, align 4
  br label %reduce.15.inner.loop_header.reduction_dim.231

reduce.15.inner.loop_exit.reduction_dim.230:      ; preds = %reduce.15.inner.loop_header.reduction_dim.231
  %94 = load float, ptr %accumulator_028, align 4
  %95 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %94, ptr %95, align 4
  br label %fusion_42.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare float @__nv_expf(float) #2

define internal void @region_1_11(ptr dereferenceable(4) %Arg_0.12.typed, ptr dereferenceable(4) %Arg_1.13.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.14.typed = alloca float, align 4
  %Arg_0.12 = load float, ptr %Arg_0.12.typed, align 4
  %Arg_1.13 = load float, ptr %Arg_1.13.typed, align 4
  %add.14 = fadd float %Arg_0.12, %Arg_1.13
  store float %add.14, ptr %add.14.typed, align 4
  %load_ret_value = load float, ptr %add.14.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_38(ptr noalias align 128 dereferenceable(491520) %arg0, ptr noalias align 128 dereferenceable(491520) %arg1, ptr noalias align 128 dereferenceable(2949120) %arg2, ptr noalias align 16 dereferenceable(360) %arg3, ptr noalias align 128 dereferenceable(2949120) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !45
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 184320
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 6
  %5 = udiv i32 %linear_index_base, 6
  %6 = urem i32 %5, 15
  %7 = udiv i32 %linear_index_base, 90
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 6
  %10 = udiv i32 %linear_index1, 6
  %11 = urem i32 %10, 15
  %12 = udiv i32 %linear_index1, 90
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 6
  %15 = udiv i32 %linear_index2, 6
  %16 = urem i32 %15, 15
  %17 = udiv i32 %linear_index2, 90
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 6
  %20 = udiv i32 %linear_index3, 6
  %21 = urem i32 %20, 15
  %22 = udiv i32 %linear_index3, 90
  %23 = icmp ult i32 %linear_index_base, 737280
  br i1 %23, label %fusion_38.in_bounds-true, label %fusion_38.in_bounds-after

fusion_38.in_bounds-after:                        ; preds = %fusion_38.in_bounds-true, %entry
  ret void

fusion_38.in_bounds-true:                         ; preds = %entry
  %24 = mul nuw nsw i32 %4, 1
  %25 = add nuw nsw i32 0, %24
  %26 = mul nuw nsw i32 %6, 6
  %27 = add nuw nsw i32 %25, %26
  %28 = udiv i32 %27, 90
  %29 = mul nuw nsw i32 %7, 1
  %30 = add nuw nsw i32 0, %29
  %31 = udiv i32 %30, 8192
  %32 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %33 = load float, ptr %32, align 4, !invariant.load !38
  %34 = getelementptr inbounds [90 x float], ptr %arg3, i32 0, i32 %27
  %35 = load float, ptr %34, align 4, !invariant.load !38
  %add.6 = fadd float %33, %35
  %36 = udiv i32 %linear_index_base, 6
  %37 = getelementptr inbounds float, ptr %arg1, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !38
  %subtract.9 = fsub float %add.6, %38
  %39 = call float @__nv_expf(float %subtract.9)
  %40 = udiv i32 %linear_index_base, 6
  %41 = getelementptr inbounds float, ptr %arg0, i32 %40
  %42 = load float, ptr %41, align 4, !invariant.load !38
  %divide.12 = fdiv float %39, %42
  %43 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %divide.12, ptr %43, align 4
  %44 = mul nuw nsw i32 %9, 1
  %45 = add nuw nsw i32 0, %44
  %46 = mul nuw nsw i32 %11, 6
  %47 = add nuw nsw i32 %45, %46
  %48 = udiv i32 %47, 90
  %49 = mul nuw nsw i32 %12, 1
  %50 = add nuw nsw i32 0, %49
  %51 = udiv i32 %50, 8192
  %52 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %53 = load float, ptr %52, align 4, !invariant.load !38
  %54 = getelementptr inbounds [90 x float], ptr %arg3, i32 0, i32 %47
  %55 = load float, ptr %54, align 4, !invariant.load !38
  %add.61 = fadd float %53, %55
  %56 = udiv i32 %linear_index1, 6
  %57 = getelementptr inbounds float, ptr %arg1, i32 %56
  %58 = load float, ptr %57, align 4, !invariant.load !38
  %subtract.92 = fsub float %add.61, %58
  %59 = call float @__nv_expf(float %subtract.92)
  %60 = udiv i32 %linear_index1, 6
  %61 = getelementptr inbounds float, ptr %arg0, i32 %60
  %62 = load float, ptr %61, align 4, !invariant.load !38
  %divide.123 = fdiv float %59, %62
  %63 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %divide.123, ptr %63, align 4
  %64 = mul nuw nsw i32 %14, 1
  %65 = add nuw nsw i32 0, %64
  %66 = mul nuw nsw i32 %16, 6
  %67 = add nuw nsw i32 %65, %66
  %68 = udiv i32 %67, 90
  %69 = mul nuw nsw i32 %17, 1
  %70 = add nuw nsw i32 0, %69
  %71 = udiv i32 %70, 8192
  %72 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %73 = load float, ptr %72, align 4, !invariant.load !38
  %74 = getelementptr inbounds [90 x float], ptr %arg3, i32 0, i32 %67
  %75 = load float, ptr %74, align 4, !invariant.load !38
  %add.64 = fadd float %73, %75
  %76 = udiv i32 %linear_index2, 6
  %77 = getelementptr inbounds float, ptr %arg1, i32 %76
  %78 = load float, ptr %77, align 4, !invariant.load !38
  %subtract.95 = fsub float %add.64, %78
  %79 = call float @__nv_expf(float %subtract.95)
  %80 = udiv i32 %linear_index2, 6
  %81 = getelementptr inbounds float, ptr %arg0, i32 %80
  %82 = load float, ptr %81, align 4, !invariant.load !38
  %divide.126 = fdiv float %79, %82
  %83 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %divide.126, ptr %83, align 4
  %84 = mul nuw nsw i32 %19, 1
  %85 = add nuw nsw i32 0, %84
  %86 = mul nuw nsw i32 %21, 6
  %87 = add nuw nsw i32 %85, %86
  %88 = udiv i32 %87, 90
  %89 = mul nuw nsw i32 %22, 1
  %90 = add nuw nsw i32 0, %89
  %91 = udiv i32 %90, 8192
  %92 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %93 = load float, ptr %92, align 4, !invariant.load !38
  %94 = getelementptr inbounds [90 x float], ptr %arg3, i32 0, i32 %87
  %95 = load float, ptr %94, align 4, !invariant.load !38
  %add.67 = fadd float %93, %95
  %96 = udiv i32 %linear_index3, 6
  %97 = getelementptr inbounds float, ptr %arg1, i32 %96
  %98 = load float, ptr %97, align 4, !invariant.load !38
  %subtract.98 = fsub float %add.67, %98
  %99 = call float @__nv_expf(float %subtract.98)
  %100 = udiv i32 %linear_index3, 6
  %101 = getelementptr inbounds float, ptr %arg0, i32 %100
  %102 = load float, ptr %101, align 4, !invariant.load !38
  %divide.129 = fdiv float %99, %102
  %103 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %divide.129, ptr %103, align 4
  br label %fusion_38.in_bounds-after
}

define void @slice_12(ptr noalias align 128 dereferenceable(20119552) %arg0, ptr noalias align 128 dereferenceable(196608) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !40
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 49152
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 6
  %5 = udiv i32 %linear_index, 6
  %6 = icmp ult i32 %linear_index, 49152
  br i1 %6, label %slice_12.in_bounds-true, label %slice_12.in_bounds-after

slice_12.in_bounds-after:                         ; preds = %slice_12.in_bounds-true, %entry
  ret void

slice_12.in_bounds-true:                          ; preds = %entry
  %7 = add i32 %5, 0
  %8 = add i32 %4, 608
  %9 = getelementptr inbounds [8192 x [614 x float]], ptr %arg0, i32 0, i32 %7, i32 %8
  %10 = load float, ptr %9, align 4, !invariant.load !38
  %11 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %10, ptr %11, align 4
  br label %slice_12.in_bounds-after
}

define void @fusion_44(ptr noalias align 128 dereferenceable(196608) %arg0, ptr noalias align 16 dereferenceable(24) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2) {
entry:
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.10.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !48
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !40
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 8192
  br i1 %4, label %fusion_44.in_bounds-true, label %fusion_44.in_bounds-after

fusion_44.in_bounds-after:                        ; preds = %reduce.10.inner.loop_exit.reduction_dim.1, %entry
  ret void

fusion_44.in_bounds-true:                         ; preds = %entry
  %region_0_11_constant_5 = load float, ptr @5, align 4
  store float %region_0_11_constant_5, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.10.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.10.inner.loop_header.reduction_dim.1

reduce.10.inner.loop_header.reduction_dim.1:      ; preds = %reduce.10.inner.loop_body.reduction_dim.1, %fusion_44.in_bounds-true
  %reduce.10.inner.indvar.reduction_dim.1 = load i32, ptr %reduce.10.inner.invar_address.reduction_dim.1, align 4
  %5 = icmp uge i32 %reduce.10.inner.indvar.reduction_dim.1, 6
  br i1 %5, label %reduce.10.inner.loop_exit.reduction_dim.1, label %reduce.10.inner.loop_body.reduction_dim.1

reduce.10.inner.loop_body.reduction_dim.1:        ; preds = %reduce.10.inner.loop_header.reduction_dim.1
  %6 = load float, ptr %accumulator_0, align 4
  %7 = getelementptr inbounds [8192 x [6 x float]], ptr %arg0, i32 0, i32 %3, i32 %reduce.10.inner.indvar.reduction_dim.1
  %8 = load float, ptr %7, align 4, !invariant.load !38
  %9 = getelementptr inbounds [6 x float], ptr %arg1, i32 0, i32 %reduce.10.inner.indvar.reduction_dim.1
  %10 = load float, ptr %9, align 4, !invariant.load !38
  %add.4 = fadd float %8, %10
  store float %6, ptr %parameter_buffer, align 4
  store float %add.4, ptr %parameter_buffer1, align 4
  call void @region_1_6(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %11 = load float, ptr %return_buffer, align 4
  store float %11, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.10.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, ptr %reduce.10.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.10.inner.loop_header.reduction_dim.1

reduce.10.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.10.inner.loop_header.reduction_dim.1
  %12 = load float, ptr %accumulator_0, align 4
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  store float %12, ptr %13, align 4
  br label %fusion_44.in_bounds-after
}

define internal void @region_1_6(ptr dereferenceable(4) %Arg_0.7.typed, ptr dereferenceable(4) %Arg_1.8.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %maximum.9.typed = alloca float, align 4
  %Arg_0.7 = load float, ptr %Arg_0.7.typed, align 4
  %Arg_1.8 = load float, ptr %Arg_1.8.typed, align 4
  %0 = fcmp oge float %Arg_0.7, %Arg_1.8
  %1 = fcmp une float %Arg_0.7, %Arg_0.7
  %2 = or i1 %0, %1
  %maximum.9 = select i1 %2, float %Arg_0.7, float %Arg_1.8
  store float %maximum.9, ptr %maximum.9.typed, align 4
  %load_ret_value = load float, ptr %maximum.9.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_30(ptr noalias align 128 dereferenceable(32768) %arg0, ptr noalias align 128 dereferenceable(196608) %arg1, ptr noalias align 16 dereferenceable(24) %arg2, ptr noalias align 128 dereferenceable(196608) %arg3) {
entry:
  %return_buffer = alloca float, align 4
  %parameter_buffer3 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.16.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !40
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 49152
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 6
  %5 = udiv i32 %linear_index, 6
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index, 6
  %8 = icmp ult i32 %linear_index, 49152
  br i1 %8, label %fusion_30.in_bounds-true, label %fusion_30.in_bounds-after

fusion_30.in_bounds-after:                        ; preds = %reduce.16.inner.loop_exit.reduction_dim.1, %entry
  ret void

fusion_30.in_bounds-true:                         ; preds = %entry
  %9 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %10 = load float, ptr %9, align 4, !invariant.load !38
  %11 = getelementptr inbounds [6 x float], ptr %arg2, i32 0, i32 %4
  %12 = load float, ptr %11, align 4, !invariant.load !38
  %add.5 = fadd float %10, %12
  %13 = getelementptr inbounds [8192 x float], ptr %arg0, i32 0, i32 %7
  %14 = load float, ptr %13, align 4, !invariant.load !38
  %subtract.8 = fsub float %add.5, %14
  %15 = call float @__nv_expf(float %subtract.8)
  %region_0_19_constant_11 = load float, ptr @6, align 4
  store float %region_0_19_constant_11, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.16.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.16.inner.loop_header.reduction_dim.1

reduce.16.inner.loop_header.reduction_dim.1:      ; preds = %reduce.16.inner.loop_body.reduction_dim.1, %fusion_30.in_bounds-true
  %reduce.16.inner.indvar.reduction_dim.1 = load i32, ptr %reduce.16.inner.invar_address.reduction_dim.1, align 4
  %16 = icmp uge i32 %reduce.16.inner.indvar.reduction_dim.1, 6
  br i1 %16, label %reduce.16.inner.loop_exit.reduction_dim.1, label %reduce.16.inner.loop_body.reduction_dim.1

reduce.16.inner.loop_body.reduction_dim.1:        ; preds = %reduce.16.inner.loop_header.reduction_dim.1
  %17 = load float, ptr %accumulator_0, align 4
  %18 = getelementptr inbounds [8192 x [6 x float]], ptr %arg1, i32 0, i32 %7, i32 %reduce.16.inner.indvar.reduction_dim.1
  %19 = load float, ptr %18, align 4, !invariant.load !38
  %20 = getelementptr inbounds [6 x float], ptr %arg2, i32 0, i32 %reduce.16.inner.indvar.reduction_dim.1
  %21 = load float, ptr %20, align 4, !invariant.load !38
  %add.51 = fadd float %19, %21
  %22 = getelementptr inbounds [8192 x float], ptr %arg0, i32 0, i32 %7
  %23 = load float, ptr %22, align 4, !invariant.load !38
  %subtract.82 = fsub float %add.51, %23
  %24 = call float @__nv_expf(float %subtract.82)
  store float %17, ptr %parameter_buffer, align 4
  store float %24, ptr %parameter_buffer3, align 4
  call void @region_1_12(ptr %parameter_buffer, ptr %parameter_buffer3, ptr %return_buffer)
  %25 = load float, ptr %return_buffer, align 4
  store float %25, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.16.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, ptr %reduce.16.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.16.inner.loop_header.reduction_dim.1

reduce.16.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.16.inner.loop_header.reduction_dim.1
  %26 = load float, ptr %accumulator_0, align 4
  %divide.18 = fdiv float %15, %26
  %27 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %divide.18, ptr %27, align 4
  br label %fusion_30.in_bounds-after
}

define internal void @region_1_12(ptr dereferenceable(4) %Arg_0.13.typed, ptr dereferenceable(4) %Arg_1.14.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.15.typed = alloca float, align 4
  %Arg_0.13 = load float, ptr %Arg_0.13.typed, align 4
  %Arg_1.14 = load float, ptr %Arg_1.14.typed, align 4
  %add.15 = fadd float %Arg_0.13, %Arg_1.14
  store float %add.15, ptr %add.15.typed, align 4
  %load_ret_value = load float, ptr %add.15.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @slice_11(ptr noalias align 128 dereferenceable(20119552) %arg0, ptr noalias align 128 dereferenceable(196608) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !40
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 49152
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 6
  %5 = udiv i32 %linear_index, 6
  %6 = icmp ult i32 %linear_index, 49152
  br i1 %6, label %slice_11.in_bounds-true, label %slice_11.in_bounds-after

slice_11.in_bounds-after:                         ; preds = %slice_11.in_bounds-true, %entry
  ret void

slice_11.in_bounds-true:                          ; preds = %entry
  %7 = add i32 %5, 0
  %8 = add i32 %4, 602
  %9 = getelementptr inbounds [8192 x [614 x float]], ptr %arg0, i32 0, i32 %7, i32 %8
  %10 = load float, ptr %9, align 4, !invariant.load !38
  %11 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %10, ptr %11, align 4
  br label %slice_11.in_bounds-after
}

define void @fusion_34(ptr noalias align 128 dereferenceable(32768) %arg0, ptr noalias align 128 dereferenceable(196608) %arg1, ptr noalias align 16 dereferenceable(24) %arg2, ptr noalias align 128 dereferenceable(196608) %arg3) {
entry:
  %return_buffer = alloca float, align 4
  %parameter_buffer3 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.16.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !40
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 49152
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 6
  %5 = udiv i32 %linear_index, 6
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index, 6
  %8 = icmp ult i32 %linear_index, 49152
  br i1 %8, label %fusion_34.in_bounds-true, label %fusion_34.in_bounds-after

fusion_34.in_bounds-after:                        ; preds = %reduce.16.inner.loop_exit.reduction_dim.1, %entry
  ret void

fusion_34.in_bounds-true:                         ; preds = %entry
  %9 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %10 = load float, ptr %9, align 4, !invariant.load !38
  %11 = getelementptr inbounds [6 x float], ptr %arg2, i32 0, i32 %4
  %12 = load float, ptr %11, align 4, !invariant.load !38
  %add.5 = fadd float %10, %12
  %13 = getelementptr inbounds [8192 x float], ptr %arg0, i32 0, i32 %7
  %14 = load float, ptr %13, align 4, !invariant.load !38
  %subtract.8 = fsub float %add.5, %14
  %15 = call float @__nv_expf(float %subtract.8)
  %region_0_20_constant_11 = load float, ptr @7, align 4
  store float %region_0_20_constant_11, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.16.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.16.inner.loop_header.reduction_dim.1

reduce.16.inner.loop_header.reduction_dim.1:      ; preds = %reduce.16.inner.loop_body.reduction_dim.1, %fusion_34.in_bounds-true
  %reduce.16.inner.indvar.reduction_dim.1 = load i32, ptr %reduce.16.inner.invar_address.reduction_dim.1, align 4
  %16 = icmp uge i32 %reduce.16.inner.indvar.reduction_dim.1, 6
  br i1 %16, label %reduce.16.inner.loop_exit.reduction_dim.1, label %reduce.16.inner.loop_body.reduction_dim.1

reduce.16.inner.loop_body.reduction_dim.1:        ; preds = %reduce.16.inner.loop_header.reduction_dim.1
  %17 = load float, ptr %accumulator_0, align 4
  %18 = getelementptr inbounds [8192 x [6 x float]], ptr %arg1, i32 0, i32 %7, i32 %reduce.16.inner.indvar.reduction_dim.1
  %19 = load float, ptr %18, align 4, !invariant.load !38
  %20 = getelementptr inbounds [6 x float], ptr %arg2, i32 0, i32 %reduce.16.inner.indvar.reduction_dim.1
  %21 = load float, ptr %20, align 4, !invariant.load !38
  %add.51 = fadd float %19, %21
  %22 = getelementptr inbounds [8192 x float], ptr %arg0, i32 0, i32 %7
  %23 = load float, ptr %22, align 4, !invariant.load !38
  %subtract.82 = fsub float %add.51, %23
  %24 = call float @__nv_expf(float %subtract.82)
  store float %17, ptr %parameter_buffer, align 4
  store float %24, ptr %parameter_buffer3, align 4
  call void @region_1_12__1(ptr %parameter_buffer, ptr %parameter_buffer3, ptr %return_buffer)
  %25 = load float, ptr %return_buffer, align 4
  store float %25, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.16.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, ptr %reduce.16.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.16.inner.loop_header.reduction_dim.1

reduce.16.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.16.inner.loop_header.reduction_dim.1
  %26 = load float, ptr %accumulator_0, align 4
  %divide.18 = fdiv float %15, %26
  %27 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %divide.18, ptr %27, align 4
  br label %fusion_34.in_bounds-after
}

define internal void @region_1_12__1(ptr dereferenceable(4) %Arg_0.13.typed, ptr dereferenceable(4) %Arg_1.14.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.15.typed = alloca float, align 4
  %Arg_0.13 = load float, ptr %Arg_0.13.typed, align 4
  %Arg_1.14 = load float, ptr %Arg_1.14.typed, align 4
  %add.15 = fadd float %Arg_0.13, %Arg_1.14
  store float %add.15, ptr %add.15.typed, align 4
  %load_ret_value = load float, ptr %add.15.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @concatenate_9(ptr noalias align 128 dereferenceable(2949120) %arg0, ptr noalias align 128 dereferenceable(196608) %arg1, ptr noalias align 128 dereferenceable(196608) %arg2, ptr noalias align 128 dereferenceable(3342336) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !49
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 208896
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 6
  %5 = udiv i32 %linear_index_base, 6
  %6 = urem i32 %5, 17
  %7 = udiv i32 %linear_index_base, 102
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 6
  %10 = udiv i32 %linear_index1, 6
  %11 = urem i32 %10, 17
  %12 = udiv i32 %linear_index1, 102
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 6
  %15 = udiv i32 %linear_index2, 6
  %16 = urem i32 %15, 17
  %17 = udiv i32 %linear_index2, 102
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 6
  %20 = udiv i32 %linear_index3, 6
  %21 = urem i32 %20, 17
  %22 = udiv i32 %linear_index3, 102
  %23 = icmp ult i32 %linear_index_base, 835584
  br i1 %23, label %concatenate_9.in_bounds-true, label %concatenate_9.in_bounds-after

concatenate_9.in_bounds-after:                    ; preds = %concatenate.4.merge21, %entry
  ret void

concatenate_9.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.15.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %6, %24
  %26 = getelementptr inbounds [8192 x [15 x [6 x float]]], ptr %arg0, i32 0, i32 %7, i32 %25, i32 %4
  %27 = load float, ptr %26, align 4, !invariant.load !38
  br label %concatenate.4.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.15.1
  %28 = phi i32 [ 15, %concatenate.pivot.15.1 ]
  %29 = sub nsw i32 %6, %28
  %30 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr %arg1, i32 0, i32 %7, i32 0, i32 %4
  %31 = load float, ptr %30, align 4, !invariant.load !38
  br label %concatenate.4.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.16.2
  %32 = phi i32 [ 16, %concatenate.pivot.16.2 ]
  %33 = sub nsw i32 %6, %32
  %34 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr %arg2, i32 0, i32 %7, i32 0, i32 %4
  %35 = load float, ptr %34, align 4, !invariant.load !38
  br label %concatenate.4.merge

concatenate.pivot.15.:                            ; preds = %concatenate_9.in_bounds-true
  %36 = icmp ult i32 %6, 15
  br i1 %36, label %concatenate.pivot.0., label %concatenate.pivot.16.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.15.
  br label %concat_index_from_operand_id0

concatenate.pivot.16.:                            ; preds = %concatenate.pivot.15.
  %37 = icmp ult i32 %6, 16
  br i1 %37, label %concatenate.pivot.15.1, label %concatenate.pivot.16.2

concatenate.pivot.15.1:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id1

concatenate.pivot.16.2:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id2

concatenate.4.merge:                              ; preds = %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %38 = phi float [ %27, %concat_index_from_operand_id0 ], [ %31, %concat_index_from_operand_id1 ], [ %35, %concat_index_from_operand_id2 ]
  %39 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %38, ptr %39, align 4
  br label %concatenate.pivot.15.7

concat_index_from_operand_id04:                   ; preds = %concatenate.pivot.0.8
  %40 = phi i32 [ 0, %concatenate.pivot.0.8 ]
  %41 = sub nsw i32 %11, %40
  %42 = getelementptr inbounds [8192 x [15 x [6 x float]]], ptr %arg0, i32 0, i32 %12, i32 %41, i32 %9
  %43 = load float, ptr %42, align 4, !invariant.load !38
  br label %concatenate.4.merge3

concat_index_from_operand_id15:                   ; preds = %concatenate.pivot.15.10
  %44 = phi i32 [ 15, %concatenate.pivot.15.10 ]
  %45 = sub nsw i32 %11, %44
  %46 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr %arg1, i32 0, i32 %12, i32 0, i32 %9
  %47 = load float, ptr %46, align 4, !invariant.load !38
  br label %concatenate.4.merge3

concat_index_from_operand_id26:                   ; preds = %concatenate.pivot.16.11
  %48 = phi i32 [ 16, %concatenate.pivot.16.11 ]
  %49 = sub nsw i32 %11, %48
  %50 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr %arg2, i32 0, i32 %12, i32 0, i32 %9
  %51 = load float, ptr %50, align 4, !invariant.load !38
  br label %concatenate.4.merge3

concatenate.pivot.15.7:                           ; preds = %concatenate.4.merge
  %52 = icmp ult i32 %11, 15
  br i1 %52, label %concatenate.pivot.0.8, label %concatenate.pivot.16.9

concatenate.pivot.0.8:                            ; preds = %concatenate.pivot.15.7
  br label %concat_index_from_operand_id04

concatenate.pivot.16.9:                           ; preds = %concatenate.pivot.15.7
  %53 = icmp ult i32 %11, 16
  br i1 %53, label %concatenate.pivot.15.10, label %concatenate.pivot.16.11

concatenate.pivot.15.10:                          ; preds = %concatenate.pivot.16.9
  br label %concat_index_from_operand_id15

concatenate.pivot.16.11:                          ; preds = %concatenate.pivot.16.9
  br label %concat_index_from_operand_id26

concatenate.4.merge3:                             ; preds = %concat_index_from_operand_id26, %concat_index_from_operand_id15, %concat_index_from_operand_id04
  %54 = phi float [ %43, %concat_index_from_operand_id04 ], [ %47, %concat_index_from_operand_id15 ], [ %51, %concat_index_from_operand_id26 ]
  %55 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %54, ptr %55, align 4
  br label %concatenate.pivot.15.16

concat_index_from_operand_id013:                  ; preds = %concatenate.pivot.0.17
  %56 = phi i32 [ 0, %concatenate.pivot.0.17 ]
  %57 = sub nsw i32 %16, %56
  %58 = getelementptr inbounds [8192 x [15 x [6 x float]]], ptr %arg0, i32 0, i32 %17, i32 %57, i32 %14
  %59 = load float, ptr %58, align 4, !invariant.load !38
  br label %concatenate.4.merge12

concat_index_from_operand_id114:                  ; preds = %concatenate.pivot.15.19
  %60 = phi i32 [ 15, %concatenate.pivot.15.19 ]
  %61 = sub nsw i32 %16, %60
  %62 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr %arg1, i32 0, i32 %17, i32 0, i32 %14
  %63 = load float, ptr %62, align 4, !invariant.load !38
  br label %concatenate.4.merge12

concat_index_from_operand_id215:                  ; preds = %concatenate.pivot.16.20
  %64 = phi i32 [ 16, %concatenate.pivot.16.20 ]
  %65 = sub nsw i32 %16, %64
  %66 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr %arg2, i32 0, i32 %17, i32 0, i32 %14
  %67 = load float, ptr %66, align 4, !invariant.load !38
  br label %concatenate.4.merge12

concatenate.pivot.15.16:                          ; preds = %concatenate.4.merge3
  %68 = icmp ult i32 %16, 15
  br i1 %68, label %concatenate.pivot.0.17, label %concatenate.pivot.16.18

concatenate.pivot.0.17:                           ; preds = %concatenate.pivot.15.16
  br label %concat_index_from_operand_id013

concatenate.pivot.16.18:                          ; preds = %concatenate.pivot.15.16
  %69 = icmp ult i32 %16, 16
  br i1 %69, label %concatenate.pivot.15.19, label %concatenate.pivot.16.20

concatenate.pivot.15.19:                          ; preds = %concatenate.pivot.16.18
  br label %concat_index_from_operand_id114

concatenate.pivot.16.20:                          ; preds = %concatenate.pivot.16.18
  br label %concat_index_from_operand_id215

concatenate.4.merge12:                            ; preds = %concat_index_from_operand_id215, %concat_index_from_operand_id114, %concat_index_from_operand_id013
  %70 = phi float [ %59, %concat_index_from_operand_id013 ], [ %63, %concat_index_from_operand_id114 ], [ %67, %concat_index_from_operand_id215 ]
  %71 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %70, ptr %71, align 4
  br label %concatenate.pivot.15.25

concat_index_from_operand_id022:                  ; preds = %concatenate.pivot.0.26
  %72 = phi i32 [ 0, %concatenate.pivot.0.26 ]
  %73 = sub nsw i32 %21, %72
  %74 = getelementptr inbounds [8192 x [15 x [6 x float]]], ptr %arg0, i32 0, i32 %22, i32 %73, i32 %19
  %75 = load float, ptr %74, align 4, !invariant.load !38
  br label %concatenate.4.merge21

concat_index_from_operand_id123:                  ; preds = %concatenate.pivot.15.28
  %76 = phi i32 [ 15, %concatenate.pivot.15.28 ]
  %77 = sub nsw i32 %21, %76
  %78 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr %arg1, i32 0, i32 %22, i32 0, i32 %19
  %79 = load float, ptr %78, align 4, !invariant.load !38
  br label %concatenate.4.merge21

concat_index_from_operand_id224:                  ; preds = %concatenate.pivot.16.29
  %80 = phi i32 [ 16, %concatenate.pivot.16.29 ]
  %81 = sub nsw i32 %21, %80
  %82 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr %arg2, i32 0, i32 %22, i32 0, i32 %19
  %83 = load float, ptr %82, align 4, !invariant.load !38
  br label %concatenate.4.merge21

concatenate.pivot.15.25:                          ; preds = %concatenate.4.merge12
  %84 = icmp ult i32 %21, 15
  br i1 %84, label %concatenate.pivot.0.26, label %concatenate.pivot.16.27

concatenate.pivot.0.26:                           ; preds = %concatenate.pivot.15.25
  br label %concat_index_from_operand_id022

concatenate.pivot.16.27:                          ; preds = %concatenate.pivot.15.25
  %85 = icmp ult i32 %21, 16
  br i1 %85, label %concatenate.pivot.15.28, label %concatenate.pivot.16.29

concatenate.pivot.15.28:                          ; preds = %concatenate.pivot.16.27
  br label %concat_index_from_operand_id123

concatenate.pivot.16.29:                          ; preds = %concatenate.pivot.16.27
  br label %concat_index_from_operand_id224

concatenate.4.merge21:                            ; preds = %concat_index_from_operand_id224, %concat_index_from_operand_id123, %concat_index_from_operand_id022
  %86 = phi float [ %75, %concat_index_from_operand_id022 ], [ %79, %concat_index_from_operand_id123 ], [ %83, %concat_index_from_operand_id224 ]
  %87 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %86, ptr %87, align 4
  br label %concatenate_9.in_bounds-after
}

define void @fusion_16(ptr noalias align 128 dereferenceable(142606336) %arg0, ptr noalias align 128 dereferenceable(8388608) %arg1, ptr noalias align 128 dereferenceable(8388608) %arg2, ptr noalias align 128 dereferenceable(8388608) %arg3, ptr noalias align 128 dereferenceable(8388608) %arg4, ptr noalias align 128 dereferenceable(8388608) %arg5, ptr noalias align 128 dereferenceable(8388608) %arg6, ptr noalias align 128 dereferenceable(8388608) %arg7, ptr noalias align 128 dereferenceable(8388608) %arg8, ptr noalias align 128 dereferenceable(8388608) %arg9, ptr noalias align 128 dereferenceable(8388608) %arg10, ptr noalias align 128 dereferenceable(8388608) %arg11, ptr noalias align 128 dereferenceable(8388608) %arg12, ptr noalias align 128 dereferenceable(8388608) %arg13, ptr noalias align 128 dereferenceable(8388608) %arg14, ptr noalias align 128 dereferenceable(8388608) %arg15, ptr noalias align 128 dereferenceable(8388608) %arg16, ptr noalias align 128 dereferenceable(8388608) %arg17) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !42
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 524288
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index_base, 256
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 256
  %8 = udiv i32 %linear_index1, 256
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 256
  %11 = udiv i32 %linear_index2, 256
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 256
  %14 = udiv i32 %linear_index3, 256
  %15 = icmp ult i32 %linear_index_base, 2097152
  br i1 %15, label %fusion_16.in_bounds-true, label %fusion_16.in_bounds-after

fusion_16.in_bounds-after:                        ; preds = %fusion_16.in_bounds-true, %entry
  ret void

fusion_16.in_bounds-true:                         ; preds = %entry
  %16 = add i32 %5, 0
  %17 = add i32 %4, 0
  %18 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %16, i32 0, i32 %17
  %19 = load float, ptr %18, align 4, !invariant.load !38
  %20 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %19, 0
  %21 = add i32 %5, 0
  %22 = add i32 %4, 0
  %23 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %21, i32 1, i32 %22
  %24 = load float, ptr %23, align 4, !invariant.load !38
  %25 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %20, float %24, 1
  %26 = add i32 %5, 0
  %27 = add i32 %4, 0
  %28 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %26, i32 2, i32 %27
  %29 = load float, ptr %28, align 4, !invariant.load !38
  %30 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %25, float %29, 2
  %31 = add i32 %5, 0
  %32 = add i32 %4, 0
  %33 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %31, i32 3, i32 %32
  %34 = load float, ptr %33, align 4, !invariant.load !38
  %35 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %30, float %34, 3
  %36 = add i32 %5, 0
  %37 = add i32 %4, 0
  %38 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %36, i32 4, i32 %37
  %39 = load float, ptr %38, align 4, !invariant.load !38
  %40 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %35, float %39, 4
  %41 = add i32 %5, 0
  %42 = add i32 %4, 0
  %43 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %41, i32 5, i32 %42
  %44 = load float, ptr %43, align 4, !invariant.load !38
  %45 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %40, float %44, 5
  %46 = add i32 %5, 0
  %47 = add i32 %4, 0
  %48 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %46, i32 6, i32 %47
  %49 = load float, ptr %48, align 4, !invariant.load !38
  %50 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %45, float %49, 6
  %51 = add i32 %5, 0
  %52 = add i32 %4, 0
  %53 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %51, i32 7, i32 %52
  %54 = load float, ptr %53, align 4, !invariant.load !38
  %55 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %50, float %54, 7
  %56 = add i32 %5, 0
  %57 = add i32 %4, 0
  %58 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %56, i32 8, i32 %57
  %59 = load float, ptr %58, align 4, !invariant.load !38
  %60 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %55, float %59, 8
  %61 = add i32 %5, 0
  %62 = add i32 %4, 0
  %63 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %61, i32 9, i32 %62
  %64 = load float, ptr %63, align 4, !invariant.load !38
  %65 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %60, float %64, 9
  %66 = add i32 %5, 0
  %67 = add i32 %4, 0
  %68 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %66, i32 10, i32 %67
  %69 = load float, ptr %68, align 4, !invariant.load !38
  %70 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %65, float %69, 10
  %71 = add i32 %5, 0
  %72 = add i32 %4, 0
  %73 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %71, i32 11, i32 %72
  %74 = load float, ptr %73, align 4, !invariant.load !38
  %75 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %70, float %74, 11
  %76 = add i32 %5, 0
  %77 = add i32 %4, 0
  %78 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %76, i32 12, i32 %77
  %79 = load float, ptr %78, align 4, !invariant.load !38
  %80 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, float %79, 12
  %81 = add i32 %5, 0
  %82 = add i32 %4, 0
  %83 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %81, i32 13, i32 %82
  %84 = load float, ptr %83, align 4, !invariant.load !38
  %85 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %80, float %84, 13
  %86 = add i32 %5, 0
  %87 = add i32 %4, 0
  %88 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %86, i32 14, i32 %87
  %89 = load float, ptr %88, align 4, !invariant.load !38
  %90 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %85, float %89, 14
  %91 = add i32 %5, 0
  %92 = add i32 %4, 0
  %93 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %91, i32 15, i32 %92
  %94 = load float, ptr %93, align 4, !invariant.load !38
  %95 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %90, float %94, 15
  %96 = add i32 %5, 0
  %97 = add i32 %4, 0
  %98 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %96, i32 16, i32 %97
  %99 = load float, ptr %98, align 4, !invariant.load !38
  %100 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %95, float %99, 16
  %101 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 0
  %102 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %101, ptr %102, align 4
  %103 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 1
  %104 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %103, ptr %104, align 4
  %105 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 2
  %106 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %105, ptr %106, align 4
  %107 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 3
  %108 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %107, ptr %108, align 4
  %109 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 4
  %110 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %109, ptr %110, align 4
  %111 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 5
  %112 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  store float %111, ptr %112, align 4
  %113 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 6
  %114 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  store float %113, ptr %114, align 4
  %115 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 7
  %116 = getelementptr inbounds float, ptr %arg8, i32 %linear_index_base
  store float %115, ptr %116, align 4
  %117 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 8
  %118 = getelementptr inbounds float, ptr %arg9, i32 %linear_index_base
  store float %117, ptr %118, align 4
  %119 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 9
  %120 = getelementptr inbounds float, ptr %arg10, i32 %linear_index_base
  store float %119, ptr %120, align 4
  %121 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 10
  %122 = getelementptr inbounds float, ptr %arg11, i32 %linear_index_base
  store float %121, ptr %122, align 4
  %123 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 11
  %124 = getelementptr inbounds float, ptr %arg12, i32 %linear_index_base
  store float %123, ptr %124, align 4
  %125 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 12
  %126 = getelementptr inbounds float, ptr %arg13, i32 %linear_index_base
  store float %125, ptr %126, align 4
  %127 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 13
  %128 = getelementptr inbounds float, ptr %arg14, i32 %linear_index_base
  store float %127, ptr %128, align 4
  %129 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 14
  %130 = getelementptr inbounds float, ptr %arg15, i32 %linear_index_base
  store float %129, ptr %130, align 4
  %131 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 15
  %132 = getelementptr inbounds float, ptr %arg16, i32 %linear_index_base
  store float %131, ptr %132, align 4
  %133 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 16
  %134 = getelementptr inbounds float, ptr %arg17, i32 %linear_index_base
  store float %133, ptr %134, align 4
  %135 = add i32 %8, 0
  %136 = add i32 %7, 0
  %137 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %135, i32 0, i32 %136
  %138 = load float, ptr %137, align 4, !invariant.load !38
  %139 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %138, 0
  %140 = add i32 %8, 0
  %141 = add i32 %7, 0
  %142 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %140, i32 1, i32 %141
  %143 = load float, ptr %142, align 4, !invariant.load !38
  %144 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %139, float %143, 1
  %145 = add i32 %8, 0
  %146 = add i32 %7, 0
  %147 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %145, i32 2, i32 %146
  %148 = load float, ptr %147, align 4, !invariant.load !38
  %149 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %144, float %148, 2
  %150 = add i32 %8, 0
  %151 = add i32 %7, 0
  %152 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %150, i32 3, i32 %151
  %153 = load float, ptr %152, align 4, !invariant.load !38
  %154 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %149, float %153, 3
  %155 = add i32 %8, 0
  %156 = add i32 %7, 0
  %157 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %155, i32 4, i32 %156
  %158 = load float, ptr %157, align 4, !invariant.load !38
  %159 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %154, float %158, 4
  %160 = add i32 %8, 0
  %161 = add i32 %7, 0
  %162 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %160, i32 5, i32 %161
  %163 = load float, ptr %162, align 4, !invariant.load !38
  %164 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %159, float %163, 5
  %165 = add i32 %8, 0
  %166 = add i32 %7, 0
  %167 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %165, i32 6, i32 %166
  %168 = load float, ptr %167, align 4, !invariant.load !38
  %169 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %164, float %168, 6
  %170 = add i32 %8, 0
  %171 = add i32 %7, 0
  %172 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %170, i32 7, i32 %171
  %173 = load float, ptr %172, align 4, !invariant.load !38
  %174 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %169, float %173, 7
  %175 = add i32 %8, 0
  %176 = add i32 %7, 0
  %177 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %175, i32 8, i32 %176
  %178 = load float, ptr %177, align 4, !invariant.load !38
  %179 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %174, float %178, 8
  %180 = add i32 %8, 0
  %181 = add i32 %7, 0
  %182 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %180, i32 9, i32 %181
  %183 = load float, ptr %182, align 4, !invariant.load !38
  %184 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %179, float %183, 9
  %185 = add i32 %8, 0
  %186 = add i32 %7, 0
  %187 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %185, i32 10, i32 %186
  %188 = load float, ptr %187, align 4, !invariant.load !38
  %189 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %184, float %188, 10
  %190 = add i32 %8, 0
  %191 = add i32 %7, 0
  %192 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %190, i32 11, i32 %191
  %193 = load float, ptr %192, align 4, !invariant.load !38
  %194 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %189, float %193, 11
  %195 = add i32 %8, 0
  %196 = add i32 %7, 0
  %197 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %195, i32 12, i32 %196
  %198 = load float, ptr %197, align 4, !invariant.load !38
  %199 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %194, float %198, 12
  %200 = add i32 %8, 0
  %201 = add i32 %7, 0
  %202 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %200, i32 13, i32 %201
  %203 = load float, ptr %202, align 4, !invariant.load !38
  %204 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %199, float %203, 13
  %205 = add i32 %8, 0
  %206 = add i32 %7, 0
  %207 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %205, i32 14, i32 %206
  %208 = load float, ptr %207, align 4, !invariant.load !38
  %209 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %204, float %208, 14
  %210 = add i32 %8, 0
  %211 = add i32 %7, 0
  %212 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %210, i32 15, i32 %211
  %213 = load float, ptr %212, align 4, !invariant.load !38
  %214 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %209, float %213, 15
  %215 = add i32 %8, 0
  %216 = add i32 %7, 0
  %217 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %215, i32 16, i32 %216
  %218 = load float, ptr %217, align 4, !invariant.load !38
  %219 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %214, float %218, 16
  %220 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 0
  %221 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %220, ptr %221, align 4
  %222 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 1
  %223 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %222, ptr %223, align 4
  %224 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 2
  %225 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %224, ptr %225, align 4
  %226 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 3
  %227 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %226, ptr %227, align 4
  %228 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 4
  %229 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %228, ptr %229, align 4
  %230 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 5
  %231 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  store float %230, ptr %231, align 4
  %232 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 6
  %233 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  store float %232, ptr %233, align 4
  %234 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 7
  %235 = getelementptr inbounds float, ptr %arg8, i32 %linear_index1
  store float %234, ptr %235, align 4
  %236 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 8
  %237 = getelementptr inbounds float, ptr %arg9, i32 %linear_index1
  store float %236, ptr %237, align 4
  %238 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 9
  %239 = getelementptr inbounds float, ptr %arg10, i32 %linear_index1
  store float %238, ptr %239, align 4
  %240 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 10
  %241 = getelementptr inbounds float, ptr %arg11, i32 %linear_index1
  store float %240, ptr %241, align 4
  %242 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 11
  %243 = getelementptr inbounds float, ptr %arg12, i32 %linear_index1
  store float %242, ptr %243, align 4
  %244 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 12
  %245 = getelementptr inbounds float, ptr %arg13, i32 %linear_index1
  store float %244, ptr %245, align 4
  %246 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 13
  %247 = getelementptr inbounds float, ptr %arg14, i32 %linear_index1
  store float %246, ptr %247, align 4
  %248 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 14
  %249 = getelementptr inbounds float, ptr %arg15, i32 %linear_index1
  store float %248, ptr %249, align 4
  %250 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 15
  %251 = getelementptr inbounds float, ptr %arg16, i32 %linear_index1
  store float %250, ptr %251, align 4
  %252 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %219, 16
  %253 = getelementptr inbounds float, ptr %arg17, i32 %linear_index1
  store float %252, ptr %253, align 4
  %254 = add i32 %11, 0
  %255 = add i32 %10, 0
  %256 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %254, i32 0, i32 %255
  %257 = load float, ptr %256, align 4, !invariant.load !38
  %258 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %257, 0
  %259 = add i32 %11, 0
  %260 = add i32 %10, 0
  %261 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %259, i32 1, i32 %260
  %262 = load float, ptr %261, align 4, !invariant.load !38
  %263 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %258, float %262, 1
  %264 = add i32 %11, 0
  %265 = add i32 %10, 0
  %266 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %264, i32 2, i32 %265
  %267 = load float, ptr %266, align 4, !invariant.load !38
  %268 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %263, float %267, 2
  %269 = add i32 %11, 0
  %270 = add i32 %10, 0
  %271 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %269, i32 3, i32 %270
  %272 = load float, ptr %271, align 4, !invariant.load !38
  %273 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %268, float %272, 3
  %274 = add i32 %11, 0
  %275 = add i32 %10, 0
  %276 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %274, i32 4, i32 %275
  %277 = load float, ptr %276, align 4, !invariant.load !38
  %278 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %273, float %277, 4
  %279 = add i32 %11, 0
  %280 = add i32 %10, 0
  %281 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %279, i32 5, i32 %280
  %282 = load float, ptr %281, align 4, !invariant.load !38
  %283 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %278, float %282, 5
  %284 = add i32 %11, 0
  %285 = add i32 %10, 0
  %286 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %284, i32 6, i32 %285
  %287 = load float, ptr %286, align 4, !invariant.load !38
  %288 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %283, float %287, 6
  %289 = add i32 %11, 0
  %290 = add i32 %10, 0
  %291 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %289, i32 7, i32 %290
  %292 = load float, ptr %291, align 4, !invariant.load !38
  %293 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %288, float %292, 7
  %294 = add i32 %11, 0
  %295 = add i32 %10, 0
  %296 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %294, i32 8, i32 %295
  %297 = load float, ptr %296, align 4, !invariant.load !38
  %298 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %293, float %297, 8
  %299 = add i32 %11, 0
  %300 = add i32 %10, 0
  %301 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %299, i32 9, i32 %300
  %302 = load float, ptr %301, align 4, !invariant.load !38
  %303 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %298, float %302, 9
  %304 = add i32 %11, 0
  %305 = add i32 %10, 0
  %306 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %304, i32 10, i32 %305
  %307 = load float, ptr %306, align 4, !invariant.load !38
  %308 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %303, float %307, 10
  %309 = add i32 %11, 0
  %310 = add i32 %10, 0
  %311 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %309, i32 11, i32 %310
  %312 = load float, ptr %311, align 4, !invariant.load !38
  %313 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %308, float %312, 11
  %314 = add i32 %11, 0
  %315 = add i32 %10, 0
  %316 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %314, i32 12, i32 %315
  %317 = load float, ptr %316, align 4, !invariant.load !38
  %318 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %313, float %317, 12
  %319 = add i32 %11, 0
  %320 = add i32 %10, 0
  %321 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %319, i32 13, i32 %320
  %322 = load float, ptr %321, align 4, !invariant.load !38
  %323 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %318, float %322, 13
  %324 = add i32 %11, 0
  %325 = add i32 %10, 0
  %326 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %324, i32 14, i32 %325
  %327 = load float, ptr %326, align 4, !invariant.load !38
  %328 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %323, float %327, 14
  %329 = add i32 %11, 0
  %330 = add i32 %10, 0
  %331 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %329, i32 15, i32 %330
  %332 = load float, ptr %331, align 4, !invariant.load !38
  %333 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %328, float %332, 15
  %334 = add i32 %11, 0
  %335 = add i32 %10, 0
  %336 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %334, i32 16, i32 %335
  %337 = load float, ptr %336, align 4, !invariant.load !38
  %338 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %333, float %337, 16
  %339 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 0
  %340 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %339, ptr %340, align 4
  %341 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 1
  %342 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %341, ptr %342, align 4
  %343 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 2
  %344 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %343, ptr %344, align 4
  %345 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 3
  %346 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %345, ptr %346, align 4
  %347 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 4
  %348 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %347, ptr %348, align 4
  %349 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 5
  %350 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  store float %349, ptr %350, align 4
  %351 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 6
  %352 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  store float %351, ptr %352, align 4
  %353 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 7
  %354 = getelementptr inbounds float, ptr %arg8, i32 %linear_index2
  store float %353, ptr %354, align 4
  %355 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 8
  %356 = getelementptr inbounds float, ptr %arg9, i32 %linear_index2
  store float %355, ptr %356, align 4
  %357 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 9
  %358 = getelementptr inbounds float, ptr %arg10, i32 %linear_index2
  store float %357, ptr %358, align 4
  %359 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 10
  %360 = getelementptr inbounds float, ptr %arg11, i32 %linear_index2
  store float %359, ptr %360, align 4
  %361 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 11
  %362 = getelementptr inbounds float, ptr %arg12, i32 %linear_index2
  store float %361, ptr %362, align 4
  %363 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 12
  %364 = getelementptr inbounds float, ptr %arg13, i32 %linear_index2
  store float %363, ptr %364, align 4
  %365 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 13
  %366 = getelementptr inbounds float, ptr %arg14, i32 %linear_index2
  store float %365, ptr %366, align 4
  %367 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 14
  %368 = getelementptr inbounds float, ptr %arg15, i32 %linear_index2
  store float %367, ptr %368, align 4
  %369 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 15
  %370 = getelementptr inbounds float, ptr %arg16, i32 %linear_index2
  store float %369, ptr %370, align 4
  %371 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %338, 16
  %372 = getelementptr inbounds float, ptr %arg17, i32 %linear_index2
  store float %371, ptr %372, align 4
  %373 = add i32 %14, 0
  %374 = add i32 %13, 0
  %375 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %373, i32 0, i32 %374
  %376 = load float, ptr %375, align 4, !invariant.load !38
  %377 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %376, 0
  %378 = add i32 %14, 0
  %379 = add i32 %13, 0
  %380 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %378, i32 1, i32 %379
  %381 = load float, ptr %380, align 4, !invariant.load !38
  %382 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %377, float %381, 1
  %383 = add i32 %14, 0
  %384 = add i32 %13, 0
  %385 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %383, i32 2, i32 %384
  %386 = load float, ptr %385, align 4, !invariant.load !38
  %387 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %382, float %386, 2
  %388 = add i32 %14, 0
  %389 = add i32 %13, 0
  %390 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %388, i32 3, i32 %389
  %391 = load float, ptr %390, align 4, !invariant.load !38
  %392 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %387, float %391, 3
  %393 = add i32 %14, 0
  %394 = add i32 %13, 0
  %395 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %393, i32 4, i32 %394
  %396 = load float, ptr %395, align 4, !invariant.load !38
  %397 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %392, float %396, 4
  %398 = add i32 %14, 0
  %399 = add i32 %13, 0
  %400 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %398, i32 5, i32 %399
  %401 = load float, ptr %400, align 4, !invariant.load !38
  %402 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %397, float %401, 5
  %403 = add i32 %14, 0
  %404 = add i32 %13, 0
  %405 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %403, i32 6, i32 %404
  %406 = load float, ptr %405, align 4, !invariant.load !38
  %407 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %402, float %406, 6
  %408 = add i32 %14, 0
  %409 = add i32 %13, 0
  %410 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %408, i32 7, i32 %409
  %411 = load float, ptr %410, align 4, !invariant.load !38
  %412 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %407, float %411, 7
  %413 = add i32 %14, 0
  %414 = add i32 %13, 0
  %415 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %413, i32 8, i32 %414
  %416 = load float, ptr %415, align 4, !invariant.load !38
  %417 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %412, float %416, 8
  %418 = add i32 %14, 0
  %419 = add i32 %13, 0
  %420 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %418, i32 9, i32 %419
  %421 = load float, ptr %420, align 4, !invariant.load !38
  %422 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %417, float %421, 9
  %423 = add i32 %14, 0
  %424 = add i32 %13, 0
  %425 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %423, i32 10, i32 %424
  %426 = load float, ptr %425, align 4, !invariant.load !38
  %427 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %422, float %426, 10
  %428 = add i32 %14, 0
  %429 = add i32 %13, 0
  %430 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %428, i32 11, i32 %429
  %431 = load float, ptr %430, align 4, !invariant.load !38
  %432 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %427, float %431, 11
  %433 = add i32 %14, 0
  %434 = add i32 %13, 0
  %435 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %433, i32 12, i32 %434
  %436 = load float, ptr %435, align 4, !invariant.load !38
  %437 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %432, float %436, 12
  %438 = add i32 %14, 0
  %439 = add i32 %13, 0
  %440 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %438, i32 13, i32 %439
  %441 = load float, ptr %440, align 4, !invariant.load !38
  %442 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %437, float %441, 13
  %443 = add i32 %14, 0
  %444 = add i32 %13, 0
  %445 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %443, i32 14, i32 %444
  %446 = load float, ptr %445, align 4, !invariant.load !38
  %447 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %442, float %446, 14
  %448 = add i32 %14, 0
  %449 = add i32 %13, 0
  %450 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %448, i32 15, i32 %449
  %451 = load float, ptr %450, align 4, !invariant.load !38
  %452 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %447, float %451, 15
  %453 = add i32 %14, 0
  %454 = add i32 %13, 0
  %455 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr %arg0, i32 0, i32 %453, i32 16, i32 %454
  %456 = load float, ptr %455, align 4, !invariant.load !38
  %457 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %452, float %456, 16
  %458 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 0
  %459 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %458, ptr %459, align 4
  %460 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 1
  %461 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %460, ptr %461, align 4
  %462 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 2
  %463 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %462, ptr %463, align 4
  %464 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 3
  %465 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %464, ptr %465, align 4
  %466 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 4
  %467 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %466, ptr %467, align 4
  %468 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 5
  %469 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  store float %468, ptr %469, align 4
  %470 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 6
  %471 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  store float %470, ptr %471, align 4
  %472 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 7
  %473 = getelementptr inbounds float, ptr %arg8, i32 %linear_index3
  store float %472, ptr %473, align 4
  %474 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 8
  %475 = getelementptr inbounds float, ptr %arg9, i32 %linear_index3
  store float %474, ptr %475, align 4
  %476 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 9
  %477 = getelementptr inbounds float, ptr %arg10, i32 %linear_index3
  store float %476, ptr %477, align 4
  %478 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 10
  %479 = getelementptr inbounds float, ptr %arg11, i32 %linear_index3
  store float %478, ptr %479, align 4
  %480 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 11
  %481 = getelementptr inbounds float, ptr %arg12, i32 %linear_index3
  store float %480, ptr %481, align 4
  %482 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 12
  %483 = getelementptr inbounds float, ptr %arg13, i32 %linear_index3
  store float %482, ptr %483, align 4
  %484 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 13
  %485 = getelementptr inbounds float, ptr %arg14, i32 %linear_index3
  store float %484, ptr %485, align 4
  %486 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 14
  %487 = getelementptr inbounds float, ptr %arg15, i32 %linear_index3
  store float %486, ptr %487, align 4
  %488 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 15
  %489 = getelementptr inbounds float, ptr %arg16, i32 %linear_index3
  store float %488, ptr %489, align 4
  %490 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %457, 16
  %491 = getelementptr inbounds float, ptr %arg17, i32 %linear_index3
  store float %490, ptr %491, align 4
  br label %fusion_16.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35}

!0 = !{ptr @concatenate_11, !"kernel", i32 1}
!1 = !{ptr @concatenate_11, !"reqntidx", i32 256}
!2 = !{ptr @concatenate_7, !"kernel", i32 1}
!3 = !{ptr @concatenate_7, !"reqntidx", i32 1024}
!4 = !{ptr @fusion_29, !"kernel", i32 1}
!5 = !{ptr @fusion_29, !"reqntidx", i32 256}
!6 = !{ptr @fusion_27, !"kernel", i32 1}
!7 = !{ptr @fusion_27, !"reqntidx", i32 256}
!8 = !{ptr @fusion_45, !"kernel", i32 1}
!9 = !{ptr @fusion_45, !"reqntidx", i32 256}
!10 = !{ptr @fusion_17, !"kernel", i32 1}
!11 = !{ptr @fusion_17, !"reqntidx", i32 256}
!12 = !{ptr @concatenate_8, !"kernel", i32 1}
!13 = !{ptr @concatenate_8, !"reqntidx", i32 256}
!14 = !{ptr @slice_10, !"kernel", i32 1}
!15 = !{ptr @slice_10, !"reqntidx", i32 256}
!16 = !{ptr @fusion_41, !"kernel", i32 1}
!17 = !{ptr @fusion_41, !"reqntidx", i32 256}
!18 = !{ptr @fusion_42, !"kernel", i32 1}
!19 = !{ptr @fusion_42, !"reqntidx", i32 256}
!20 = !{ptr @fusion_38, !"kernel", i32 1}
!21 = !{ptr @fusion_38, !"reqntidx", i32 256}
!22 = !{ptr @slice_12, !"kernel", i32 1}
!23 = !{ptr @slice_12, !"reqntidx", i32 1024}
!24 = !{ptr @fusion_44, !"kernel", i32 1}
!25 = !{ptr @fusion_44, !"reqntidx", i32 1024}
!26 = !{ptr @fusion_30, !"kernel", i32 1}
!27 = !{ptr @fusion_30, !"reqntidx", i32 1024}
!28 = !{ptr @slice_11, !"kernel", i32 1}
!29 = !{ptr @slice_11, !"reqntidx", i32 1024}
!30 = !{ptr @fusion_34, !"kernel", i32 1}
!31 = !{ptr @fusion_34, !"reqntidx", i32 1024}
!32 = !{ptr @concatenate_9, !"kernel", i32 1}
!33 = !{ptr @concatenate_9, !"reqntidx", i32 256}
!34 = !{ptr @fusion_16, !"kernel", i32 1}
!35 = !{ptr @fusion_16, !"reqntidx", i32 256}
!36 = !{i32 0, i32 11840}
!37 = !{i32 0, i32 256}
!38 = !{}
!39 = !{i32 0, i32 77}
!40 = !{i32 0, i32 1024}
!41 = !{i32 0, i32 4096}
!42 = !{i32 0, i32 2048}
!43 = !{i32 0, i32 12288}
!44 = !{i32 0, i32 11968}
!45 = !{i32 0, i32 720}
!46 = !{i32 0, i32 120}
!47 = !{i32 0, i32 48}
!48 = !{i32 0, i32 8}
!49 = !{i32 0, i32 816}
