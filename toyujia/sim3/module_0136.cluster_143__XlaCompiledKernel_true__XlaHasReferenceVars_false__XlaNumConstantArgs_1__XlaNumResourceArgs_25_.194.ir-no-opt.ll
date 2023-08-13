target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@1 = private unnamed_addr constant [4 x i8] c"\00\00\80\FF"
@shared_cache1 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@2 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache2 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@3 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache3 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

define void @fusion_11(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(8388608) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !20
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 524288
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index_base, 64
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index_base, 64
  %8 = urem i32 %7, 8192
  %9 = udiv i32 %linear_index_base, 524288
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 64
  %12 = udiv i32 %linear_index1, 64
  %13 = urem i32 %12, 1
  %14 = udiv i32 %linear_index1, 64
  %15 = urem i32 %14, 8192
  %16 = udiv i32 %linear_index1, 524288
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 64
  %19 = udiv i32 %linear_index2, 64
  %20 = urem i32 %19, 1
  %21 = udiv i32 %linear_index2, 64
  %22 = urem i32 %21, 8192
  %23 = udiv i32 %linear_index2, 524288
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 64
  %26 = udiv i32 %linear_index3, 64
  %27 = urem i32 %26, 1
  %28 = udiv i32 %linear_index3, 64
  %29 = urem i32 %28, 8192
  %30 = udiv i32 %linear_index3, 524288
  %31 = icmp ult i32 %linear_index_base, 2097152
  br i1 %31, label %fusion_11.in_bounds-true, label %fusion_11.in_bounds-after

fusion_11.in_bounds-after:                        ; preds = %concatenate.11.merge28, %entry
  ret void

fusion_11.in_bounds-true:                         ; preds = %entry
  br label %concatenate.pivot.2.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %32 = phi i32 [ 0, %concatenate.pivot.0. ]
  %33 = sub nsw i32 %9, %32
  %34 = add i32 %33, 0
  %35 = add i32 %8, 0
  %36 = add i32 %4, 0
  %37 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %35, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !22
  br label %concatenate.11.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.1
  %39 = phi i32 [ 1, %concatenate.pivot.1.1 ]
  %40 = sub nsw i32 %9, %39
  %41 = add i32 %40, 0
  %42 = add i32 %8, 0
  %43 = add i32 %4, 64
  %44 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %42, i32 %43
  %45 = load float, ptr %44, align 4, !invariant.load !22
  br label %concatenate.11.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.2.2
  %46 = phi i32 [ 2, %concatenate.pivot.2.2 ]
  %47 = sub nsw i32 %9, %46
  %48 = add i32 %47, 0
  %49 = add i32 %8, 0
  %50 = add i32 %4, 128
  %51 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %49, i32 %50
  %52 = load float, ptr %51, align 4, !invariant.load !22
  br label %concatenate.11.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.3.3
  %53 = phi i32 [ 3, %concatenate.pivot.3.3 ]
  %54 = sub nsw i32 %9, %53
  %55 = add i32 %54, 0
  %56 = add i32 %8, 0
  %57 = add i32 %4, 192
  %58 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %56, i32 %57
  %59 = load float, ptr %58, align 4, !invariant.load !22
  br label %concatenate.11.merge

concatenate.pivot.2.:                             ; preds = %fusion_11.in_bounds-true
  %60 = icmp ult i32 %9, 2
  br i1 %60, label %concatenate.pivot.1., label %concatenate.pivot.3.

concatenate.pivot.1.:                             ; preds = %concatenate.pivot.2.
  %61 = icmp ult i32 %9, 1
  br i1 %61, label %concatenate.pivot.0., label %concatenate.pivot.1.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.pivot.3.:                             ; preds = %concatenate.pivot.2.
  %62 = icmp ult i32 %9, 3
  br i1 %62, label %concatenate.pivot.2.2, label %concatenate.pivot.3.3

concatenate.pivot.2.2:                            ; preds = %concatenate.pivot.3.
  br label %concat_index_from_operand_id2

concatenate.pivot.3.3:                            ; preds = %concatenate.pivot.3.
  br label %concat_index_from_operand_id3

concatenate.11.merge:                             ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %63 = phi float [ %38, %concat_index_from_operand_id0 ], [ %45, %concat_index_from_operand_id1 ], [ %52, %concat_index_from_operand_id2 ], [ %59, %concat_index_from_operand_id3 ]
  %64 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %63, ptr %64, align 4
  br label %concatenate.pivot.2.9

concat_index_from_operand_id05:                   ; preds = %concatenate.pivot.0.11
  %65 = phi i32 [ 0, %concatenate.pivot.0.11 ]
  %66 = sub nsw i32 %16, %65
  %67 = add i32 %66, 0
  %68 = add i32 %15, 0
  %69 = add i32 %11, 0
  %70 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %68, i32 %69
  %71 = load float, ptr %70, align 4, !invariant.load !22
  br label %concatenate.11.merge4

concat_index_from_operand_id16:                   ; preds = %concatenate.pivot.1.12
  %72 = phi i32 [ 1, %concatenate.pivot.1.12 ]
  %73 = sub nsw i32 %16, %72
  %74 = add i32 %73, 0
  %75 = add i32 %15, 0
  %76 = add i32 %11, 64
  %77 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %75, i32 %76
  %78 = load float, ptr %77, align 4, !invariant.load !22
  br label %concatenate.11.merge4

concat_index_from_operand_id27:                   ; preds = %concatenate.pivot.2.14
  %79 = phi i32 [ 2, %concatenate.pivot.2.14 ]
  %80 = sub nsw i32 %16, %79
  %81 = add i32 %80, 0
  %82 = add i32 %15, 0
  %83 = add i32 %11, 128
  %84 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %82, i32 %83
  %85 = load float, ptr %84, align 4, !invariant.load !22
  br label %concatenate.11.merge4

concat_index_from_operand_id38:                   ; preds = %concatenate.pivot.3.15
  %86 = phi i32 [ 3, %concatenate.pivot.3.15 ]
  %87 = sub nsw i32 %16, %86
  %88 = add i32 %87, 0
  %89 = add i32 %15, 0
  %90 = add i32 %11, 192
  %91 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %89, i32 %90
  %92 = load float, ptr %91, align 4, !invariant.load !22
  br label %concatenate.11.merge4

concatenate.pivot.2.9:                            ; preds = %concatenate.11.merge
  %93 = icmp ult i32 %16, 2
  br i1 %93, label %concatenate.pivot.1.10, label %concatenate.pivot.3.13

concatenate.pivot.1.10:                           ; preds = %concatenate.pivot.2.9
  %94 = icmp ult i32 %16, 1
  br i1 %94, label %concatenate.pivot.0.11, label %concatenate.pivot.1.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.1.10
  br label %concat_index_from_operand_id05

concatenate.pivot.1.12:                           ; preds = %concatenate.pivot.1.10
  br label %concat_index_from_operand_id16

concatenate.pivot.3.13:                           ; preds = %concatenate.pivot.2.9
  %95 = icmp ult i32 %16, 3
  br i1 %95, label %concatenate.pivot.2.14, label %concatenate.pivot.3.15

concatenate.pivot.2.14:                           ; preds = %concatenate.pivot.3.13
  br label %concat_index_from_operand_id27

concatenate.pivot.3.15:                           ; preds = %concatenate.pivot.3.13
  br label %concat_index_from_operand_id38

concatenate.11.merge4:                            ; preds = %concat_index_from_operand_id38, %concat_index_from_operand_id27, %concat_index_from_operand_id16, %concat_index_from_operand_id05
  %96 = phi float [ %71, %concat_index_from_operand_id05 ], [ %78, %concat_index_from_operand_id16 ], [ %85, %concat_index_from_operand_id27 ], [ %92, %concat_index_from_operand_id38 ]
  %97 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %96, ptr %97, align 4
  br label %concatenate.pivot.2.21

concat_index_from_operand_id017:                  ; preds = %concatenate.pivot.0.23
  %98 = phi i32 [ 0, %concatenate.pivot.0.23 ]
  %99 = sub nsw i32 %23, %98
  %100 = add i32 %99, 0
  %101 = add i32 %22, 0
  %102 = add i32 %18, 0
  %103 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %101, i32 %102
  %104 = load float, ptr %103, align 4, !invariant.load !22
  br label %concatenate.11.merge16

concat_index_from_operand_id118:                  ; preds = %concatenate.pivot.1.24
  %105 = phi i32 [ 1, %concatenate.pivot.1.24 ]
  %106 = sub nsw i32 %23, %105
  %107 = add i32 %106, 0
  %108 = add i32 %22, 0
  %109 = add i32 %18, 64
  %110 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %108, i32 %109
  %111 = load float, ptr %110, align 4, !invariant.load !22
  br label %concatenate.11.merge16

concat_index_from_operand_id219:                  ; preds = %concatenate.pivot.2.26
  %112 = phi i32 [ 2, %concatenate.pivot.2.26 ]
  %113 = sub nsw i32 %23, %112
  %114 = add i32 %113, 0
  %115 = add i32 %22, 0
  %116 = add i32 %18, 128
  %117 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %115, i32 %116
  %118 = load float, ptr %117, align 4, !invariant.load !22
  br label %concatenate.11.merge16

concat_index_from_operand_id320:                  ; preds = %concatenate.pivot.3.27
  %119 = phi i32 [ 3, %concatenate.pivot.3.27 ]
  %120 = sub nsw i32 %23, %119
  %121 = add i32 %120, 0
  %122 = add i32 %22, 0
  %123 = add i32 %18, 192
  %124 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %122, i32 %123
  %125 = load float, ptr %124, align 4, !invariant.load !22
  br label %concatenate.11.merge16

concatenate.pivot.2.21:                           ; preds = %concatenate.11.merge4
  %126 = icmp ult i32 %23, 2
  br i1 %126, label %concatenate.pivot.1.22, label %concatenate.pivot.3.25

concatenate.pivot.1.22:                           ; preds = %concatenate.pivot.2.21
  %127 = icmp ult i32 %23, 1
  br i1 %127, label %concatenate.pivot.0.23, label %concatenate.pivot.1.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.1.22
  br label %concat_index_from_operand_id017

concatenate.pivot.1.24:                           ; preds = %concatenate.pivot.1.22
  br label %concat_index_from_operand_id118

concatenate.pivot.3.25:                           ; preds = %concatenate.pivot.2.21
  %128 = icmp ult i32 %23, 3
  br i1 %128, label %concatenate.pivot.2.26, label %concatenate.pivot.3.27

concatenate.pivot.2.26:                           ; preds = %concatenate.pivot.3.25
  br label %concat_index_from_operand_id219

concatenate.pivot.3.27:                           ; preds = %concatenate.pivot.3.25
  br label %concat_index_from_operand_id320

concatenate.11.merge16:                           ; preds = %concat_index_from_operand_id320, %concat_index_from_operand_id219, %concat_index_from_operand_id118, %concat_index_from_operand_id017
  %129 = phi float [ %104, %concat_index_from_operand_id017 ], [ %111, %concat_index_from_operand_id118 ], [ %118, %concat_index_from_operand_id219 ], [ %125, %concat_index_from_operand_id320 ]
  %130 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %129, ptr %130, align 4
  br label %concatenate.pivot.2.33

concat_index_from_operand_id029:                  ; preds = %concatenate.pivot.0.35
  %131 = phi i32 [ 0, %concatenate.pivot.0.35 ]
  %132 = sub nsw i32 %30, %131
  %133 = add i32 %132, 0
  %134 = add i32 %29, 0
  %135 = add i32 %25, 0
  %136 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %134, i32 %135
  %137 = load float, ptr %136, align 4, !invariant.load !22
  br label %concatenate.11.merge28

concat_index_from_operand_id130:                  ; preds = %concatenate.pivot.1.36
  %138 = phi i32 [ 1, %concatenate.pivot.1.36 ]
  %139 = sub nsw i32 %30, %138
  %140 = add i32 %139, 0
  %141 = add i32 %29, 0
  %142 = add i32 %25, 64
  %143 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %141, i32 %142
  %144 = load float, ptr %143, align 4, !invariant.load !22
  br label %concatenate.11.merge28

concat_index_from_operand_id231:                  ; preds = %concatenate.pivot.2.38
  %145 = phi i32 [ 2, %concatenate.pivot.2.38 ]
  %146 = sub nsw i32 %30, %145
  %147 = add i32 %146, 0
  %148 = add i32 %29, 0
  %149 = add i32 %25, 128
  %150 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %148, i32 %149
  %151 = load float, ptr %150, align 4, !invariant.load !22
  br label %concatenate.11.merge28

concat_index_from_operand_id332:                  ; preds = %concatenate.pivot.3.39
  %152 = phi i32 [ 3, %concatenate.pivot.3.39 ]
  %153 = sub nsw i32 %30, %152
  %154 = add i32 %153, 0
  %155 = add i32 %29, 0
  %156 = add i32 %25, 192
  %157 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %155, i32 %156
  %158 = load float, ptr %157, align 4, !invariant.load !22
  br label %concatenate.11.merge28

concatenate.pivot.2.33:                           ; preds = %concatenate.11.merge16
  %159 = icmp ult i32 %30, 2
  br i1 %159, label %concatenate.pivot.1.34, label %concatenate.pivot.3.37

concatenate.pivot.1.34:                           ; preds = %concatenate.pivot.2.33
  %160 = icmp ult i32 %30, 1
  br i1 %160, label %concatenate.pivot.0.35, label %concatenate.pivot.1.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.1.34
  br label %concat_index_from_operand_id029

concatenate.pivot.1.36:                           ; preds = %concatenate.pivot.1.34
  br label %concat_index_from_operand_id130

concatenate.pivot.3.37:                           ; preds = %concatenate.pivot.2.33
  %161 = icmp ult i32 %30, 3
  br i1 %161, label %concatenate.pivot.2.38, label %concatenate.pivot.3.39

concatenate.pivot.2.38:                           ; preds = %concatenate.pivot.3.37
  br label %concat_index_from_operand_id231

concatenate.pivot.3.39:                           ; preds = %concatenate.pivot.3.37
  br label %concat_index_from_operand_id332

concatenate.11.merge28:                           ; preds = %concat_index_from_operand_id332, %concat_index_from_operand_id231, %concat_index_from_operand_id130, %concat_index_from_operand_id029
  %162 = phi float [ %137, %concat_index_from_operand_id029 ], [ %144, %concat_index_from_operand_id130 ], [ %151, %concat_index_from_operand_id231 ], [ %158, %concat_index_from_operand_id332 ]
  %163 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %162, ptr %163, align 4
  br label %fusion_11.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_10(ptr noalias align 16 dereferenceable(209715200) %arg0, ptr noalias align 16 dereferenceable(209715200) %arg1, ptr noalias align 16 dereferenceable(26214400) %arg2, ptr noalias align 16 dereferenceable(209715200) %arg3, ptr noalias align 128 dereferenceable(655360000) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !23
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 40960000
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 200
  %5 = udiv i32 %linear_index_base, 200
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 200
  %8 = udiv i32 %linear_index1, 200
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 200
  %11 = udiv i32 %linear_index2, 200
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 200
  %14 = udiv i32 %linear_index3, 200
  %15 = icmp ult i32 %linear_index_base, 163840000
  br i1 %15, label %fusion_10.in_bounds-true, label %fusion_10.in_bounds-after

fusion_10.in_bounds-after:                        ; preds = %concatenate.6.merge28, %entry
  ret void

fusion_10.in_bounds-true:                         ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 200
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 100
  %22 = udiv i32 %20, 100
  %23 = udiv i32 %22, 8192
  br label %concatenate.pivot.128.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %17, %24
  %26 = udiv i32 %linear_index_base, 200
  %27 = mul i32 %26, 64
  %28 = add i32 %27, %25
  %29 = udiv i32 %28, 1
  %30 = urem i32 %29, 64
  %31 = udiv i32 %28, 64
  %32 = urem i32 %31, 100
  %33 = udiv i32 %28, 6400
  %34 = getelementptr inbounds float, ptr %arg0, i32 %28
  %35 = load float, ptr %34, align 4, !invariant.load !22
  br label %concatenate.6.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.1
  %36 = phi i32 [ 64, %concatenate.pivot.64.1 ]
  %37 = sub nsw i32 %17, %36
  %38 = udiv i32 %linear_index_base, 200
  %39 = mul i32 %38, 64
  %40 = add i32 %39, %37
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 64
  %43 = udiv i32 %40, 64
  %44 = urem i32 %43, 100
  %45 = udiv i32 %40, 6400
  %46 = getelementptr inbounds float, ptr %arg1, i32 %40
  %47 = load float, ptr %46, align 4, !invariant.load !22
  br label %concatenate.6.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.128.2
  %48 = phi i32 [ 128, %concatenate.pivot.128.2 ]
  %49 = sub nsw i32 %17, %48
  %50 = udiv i32 %linear_index_base, 200
  %51 = mul i32 %50, 8
  %52 = add i32 %51, %49
  %53 = udiv i32 %52, 1
  %54 = urem i32 %53, 8
  %55 = udiv i32 %52, 8
  %56 = urem i32 %55, 100
  %57 = udiv i32 %52, 800
  %58 = getelementptr inbounds float, ptr %arg2, i32 %52
  %59 = load float, ptr %58, align 4, !invariant.load !22
  br label %concatenate.6.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.136.3
  %60 = phi i32 [ 136, %concatenate.pivot.136.3 ]
  %61 = sub nsw i32 %17, %60
  %62 = udiv i32 %linear_index_base, 200
  %63 = mul i32 %62, 64
  %64 = add i32 %63, %61
  %65 = udiv i32 %64, 1
  %66 = urem i32 %65, 64
  %67 = udiv i32 %64, 64
  %68 = urem i32 %67, 100
  %69 = udiv i32 %64, 6400
  %70 = mul nuw nsw i32 %61, 1
  %71 = add nuw nsw i32 0, %70
  %72 = mul nuw nsw i32 %21, 64
  %73 = add nuw nsw i32 %71, %72
  %74 = udiv i32 %73, 6400
  %75 = mul nuw nsw i32 %22, 1
  %76 = add nuw nsw i32 0, %75
  %77 = udiv i32 %76, 8192
  %78 = getelementptr inbounds float, ptr %arg3, i32 %64
  %79 = load float, ptr %78, align 4, !invariant.load !22
  br label %concatenate.6.merge

concatenate.pivot.128.:                           ; preds = %fusion_10.in_bounds-true
  %80 = icmp ult i32 %17, 128
  br i1 %80, label %concatenate.pivot.64., label %concatenate.pivot.136.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.128.
  %81 = icmp ult i32 %17, 64
  br i1 %81, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.pivot.136.:                           ; preds = %concatenate.pivot.128.
  %82 = icmp ult i32 %17, 136
  br i1 %82, label %concatenate.pivot.128.2, label %concatenate.pivot.136.3

concatenate.pivot.128.2:                          ; preds = %concatenate.pivot.136.
  br label %concat_index_from_operand_id2

concatenate.pivot.136.3:                          ; preds = %concatenate.pivot.136.
  br label %concat_index_from_operand_id3

concatenate.6.merge:                              ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %83 = phi float [ %35, %concat_index_from_operand_id0 ], [ %47, %concat_index_from_operand_id1 ], [ %59, %concat_index_from_operand_id2 ], [ %79, %concat_index_from_operand_id3 ]
  %84 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %83, ptr %84, align 4
  %85 = mul nuw nsw i32 %7, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 200
  %88 = mul nuw nsw i32 %8, 1
  %89 = add nuw nsw i32 0, %88
  %90 = urem i32 %89, 100
  %91 = udiv i32 %89, 100
  %92 = udiv i32 %91, 8192
  br label %concatenate.pivot.128.9

concat_index_from_operand_id05:                   ; preds = %concatenate.pivot.0.11
  %93 = phi i32 [ 0, %concatenate.pivot.0.11 ]
  %94 = sub nsw i32 %86, %93
  %95 = udiv i32 %linear_index1, 200
  %96 = mul i32 %95, 64
  %97 = add i32 %96, %94
  %98 = udiv i32 %97, 1
  %99 = urem i32 %98, 64
  %100 = udiv i32 %97, 64
  %101 = urem i32 %100, 100
  %102 = udiv i32 %97, 6400
  %103 = getelementptr inbounds float, ptr %arg0, i32 %97
  %104 = load float, ptr %103, align 4, !invariant.load !22
  br label %concatenate.6.merge4

concat_index_from_operand_id16:                   ; preds = %concatenate.pivot.64.12
  %105 = phi i32 [ 64, %concatenate.pivot.64.12 ]
  %106 = sub nsw i32 %86, %105
  %107 = udiv i32 %linear_index1, 200
  %108 = mul i32 %107, 64
  %109 = add i32 %108, %106
  %110 = udiv i32 %109, 1
  %111 = urem i32 %110, 64
  %112 = udiv i32 %109, 64
  %113 = urem i32 %112, 100
  %114 = udiv i32 %109, 6400
  %115 = getelementptr inbounds float, ptr %arg1, i32 %109
  %116 = load float, ptr %115, align 4, !invariant.load !22
  br label %concatenate.6.merge4

concat_index_from_operand_id27:                   ; preds = %concatenate.pivot.128.14
  %117 = phi i32 [ 128, %concatenate.pivot.128.14 ]
  %118 = sub nsw i32 %86, %117
  %119 = udiv i32 %linear_index1, 200
  %120 = mul i32 %119, 8
  %121 = add i32 %120, %118
  %122 = udiv i32 %121, 1
  %123 = urem i32 %122, 8
  %124 = udiv i32 %121, 8
  %125 = urem i32 %124, 100
  %126 = udiv i32 %121, 800
  %127 = getelementptr inbounds float, ptr %arg2, i32 %121
  %128 = load float, ptr %127, align 4, !invariant.load !22
  br label %concatenate.6.merge4

concat_index_from_operand_id38:                   ; preds = %concatenate.pivot.136.15
  %129 = phi i32 [ 136, %concatenate.pivot.136.15 ]
  %130 = sub nsw i32 %86, %129
  %131 = udiv i32 %linear_index1, 200
  %132 = mul i32 %131, 64
  %133 = add i32 %132, %130
  %134 = udiv i32 %133, 1
  %135 = urem i32 %134, 64
  %136 = udiv i32 %133, 64
  %137 = urem i32 %136, 100
  %138 = udiv i32 %133, 6400
  %139 = mul nuw nsw i32 %130, 1
  %140 = add nuw nsw i32 0, %139
  %141 = mul nuw nsw i32 %90, 64
  %142 = add nuw nsw i32 %140, %141
  %143 = udiv i32 %142, 6400
  %144 = mul nuw nsw i32 %91, 1
  %145 = add nuw nsw i32 0, %144
  %146 = udiv i32 %145, 8192
  %147 = getelementptr inbounds float, ptr %arg3, i32 %133
  %148 = load float, ptr %147, align 4, !invariant.load !22
  br label %concatenate.6.merge4

concatenate.pivot.128.9:                          ; preds = %concatenate.6.merge
  %149 = icmp ult i32 %86, 128
  br i1 %149, label %concatenate.pivot.64.10, label %concatenate.pivot.136.13

concatenate.pivot.64.10:                          ; preds = %concatenate.pivot.128.9
  %150 = icmp ult i32 %86, 64
  br i1 %150, label %concatenate.pivot.0.11, label %concatenate.pivot.64.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.64.10
  br label %concat_index_from_operand_id05

concatenate.pivot.64.12:                          ; preds = %concatenate.pivot.64.10
  br label %concat_index_from_operand_id16

concatenate.pivot.136.13:                         ; preds = %concatenate.pivot.128.9
  %151 = icmp ult i32 %86, 136
  br i1 %151, label %concatenate.pivot.128.14, label %concatenate.pivot.136.15

concatenate.pivot.128.14:                         ; preds = %concatenate.pivot.136.13
  br label %concat_index_from_operand_id27

concatenate.pivot.136.15:                         ; preds = %concatenate.pivot.136.13
  br label %concat_index_from_operand_id38

concatenate.6.merge4:                             ; preds = %concat_index_from_operand_id38, %concat_index_from_operand_id27, %concat_index_from_operand_id16, %concat_index_from_operand_id05
  %152 = phi float [ %104, %concat_index_from_operand_id05 ], [ %116, %concat_index_from_operand_id16 ], [ %128, %concat_index_from_operand_id27 ], [ %148, %concat_index_from_operand_id38 ]
  %153 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %152, ptr %153, align 4
  %154 = mul nuw nsw i32 %10, 1
  %155 = add nuw nsw i32 0, %154
  %156 = udiv i32 %155, 200
  %157 = mul nuw nsw i32 %11, 1
  %158 = add nuw nsw i32 0, %157
  %159 = urem i32 %158, 100
  %160 = udiv i32 %158, 100
  %161 = udiv i32 %160, 8192
  br label %concatenate.pivot.128.21

concat_index_from_operand_id017:                  ; preds = %concatenate.pivot.0.23
  %162 = phi i32 [ 0, %concatenate.pivot.0.23 ]
  %163 = sub nsw i32 %155, %162
  %164 = udiv i32 %linear_index2, 200
  %165 = mul i32 %164, 64
  %166 = add i32 %165, %163
  %167 = udiv i32 %166, 1
  %168 = urem i32 %167, 64
  %169 = udiv i32 %166, 64
  %170 = urem i32 %169, 100
  %171 = udiv i32 %166, 6400
  %172 = getelementptr inbounds float, ptr %arg0, i32 %166
  %173 = load float, ptr %172, align 4, !invariant.load !22
  br label %concatenate.6.merge16

concat_index_from_operand_id118:                  ; preds = %concatenate.pivot.64.24
  %174 = phi i32 [ 64, %concatenate.pivot.64.24 ]
  %175 = sub nsw i32 %155, %174
  %176 = udiv i32 %linear_index2, 200
  %177 = mul i32 %176, 64
  %178 = add i32 %177, %175
  %179 = udiv i32 %178, 1
  %180 = urem i32 %179, 64
  %181 = udiv i32 %178, 64
  %182 = urem i32 %181, 100
  %183 = udiv i32 %178, 6400
  %184 = getelementptr inbounds float, ptr %arg1, i32 %178
  %185 = load float, ptr %184, align 4, !invariant.load !22
  br label %concatenate.6.merge16

concat_index_from_operand_id219:                  ; preds = %concatenate.pivot.128.26
  %186 = phi i32 [ 128, %concatenate.pivot.128.26 ]
  %187 = sub nsw i32 %155, %186
  %188 = udiv i32 %linear_index2, 200
  %189 = mul i32 %188, 8
  %190 = add i32 %189, %187
  %191 = udiv i32 %190, 1
  %192 = urem i32 %191, 8
  %193 = udiv i32 %190, 8
  %194 = urem i32 %193, 100
  %195 = udiv i32 %190, 800
  %196 = getelementptr inbounds float, ptr %arg2, i32 %190
  %197 = load float, ptr %196, align 4, !invariant.load !22
  br label %concatenate.6.merge16

concat_index_from_operand_id320:                  ; preds = %concatenate.pivot.136.27
  %198 = phi i32 [ 136, %concatenate.pivot.136.27 ]
  %199 = sub nsw i32 %155, %198
  %200 = udiv i32 %linear_index2, 200
  %201 = mul i32 %200, 64
  %202 = add i32 %201, %199
  %203 = udiv i32 %202, 1
  %204 = urem i32 %203, 64
  %205 = udiv i32 %202, 64
  %206 = urem i32 %205, 100
  %207 = udiv i32 %202, 6400
  %208 = mul nuw nsw i32 %199, 1
  %209 = add nuw nsw i32 0, %208
  %210 = mul nuw nsw i32 %159, 64
  %211 = add nuw nsw i32 %209, %210
  %212 = udiv i32 %211, 6400
  %213 = mul nuw nsw i32 %160, 1
  %214 = add nuw nsw i32 0, %213
  %215 = udiv i32 %214, 8192
  %216 = getelementptr inbounds float, ptr %arg3, i32 %202
  %217 = load float, ptr %216, align 4, !invariant.load !22
  br label %concatenate.6.merge16

concatenate.pivot.128.21:                         ; preds = %concatenate.6.merge4
  %218 = icmp ult i32 %155, 128
  br i1 %218, label %concatenate.pivot.64.22, label %concatenate.pivot.136.25

concatenate.pivot.64.22:                          ; preds = %concatenate.pivot.128.21
  %219 = icmp ult i32 %155, 64
  br i1 %219, label %concatenate.pivot.0.23, label %concatenate.pivot.64.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.64.22
  br label %concat_index_from_operand_id017

concatenate.pivot.64.24:                          ; preds = %concatenate.pivot.64.22
  br label %concat_index_from_operand_id118

concatenate.pivot.136.25:                         ; preds = %concatenate.pivot.128.21
  %220 = icmp ult i32 %155, 136
  br i1 %220, label %concatenate.pivot.128.26, label %concatenate.pivot.136.27

concatenate.pivot.128.26:                         ; preds = %concatenate.pivot.136.25
  br label %concat_index_from_operand_id219

concatenate.pivot.136.27:                         ; preds = %concatenate.pivot.136.25
  br label %concat_index_from_operand_id320

concatenate.6.merge16:                            ; preds = %concat_index_from_operand_id320, %concat_index_from_operand_id219, %concat_index_from_operand_id118, %concat_index_from_operand_id017
  %221 = phi float [ %173, %concat_index_from_operand_id017 ], [ %185, %concat_index_from_operand_id118 ], [ %197, %concat_index_from_operand_id219 ], [ %217, %concat_index_from_operand_id320 ]
  %222 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %221, ptr %222, align 4
  %223 = mul nuw nsw i32 %13, 1
  %224 = add nuw nsw i32 0, %223
  %225 = udiv i32 %224, 200
  %226 = mul nuw nsw i32 %14, 1
  %227 = add nuw nsw i32 0, %226
  %228 = urem i32 %227, 100
  %229 = udiv i32 %227, 100
  %230 = udiv i32 %229, 8192
  br label %concatenate.pivot.128.33

concat_index_from_operand_id029:                  ; preds = %concatenate.pivot.0.35
  %231 = phi i32 [ 0, %concatenate.pivot.0.35 ]
  %232 = sub nsw i32 %224, %231
  %233 = udiv i32 %linear_index3, 200
  %234 = mul i32 %233, 64
  %235 = add i32 %234, %232
  %236 = udiv i32 %235, 1
  %237 = urem i32 %236, 64
  %238 = udiv i32 %235, 64
  %239 = urem i32 %238, 100
  %240 = udiv i32 %235, 6400
  %241 = getelementptr inbounds float, ptr %arg0, i32 %235
  %242 = load float, ptr %241, align 4, !invariant.load !22
  br label %concatenate.6.merge28

concat_index_from_operand_id130:                  ; preds = %concatenate.pivot.64.36
  %243 = phi i32 [ 64, %concatenate.pivot.64.36 ]
  %244 = sub nsw i32 %224, %243
  %245 = udiv i32 %linear_index3, 200
  %246 = mul i32 %245, 64
  %247 = add i32 %246, %244
  %248 = udiv i32 %247, 1
  %249 = urem i32 %248, 64
  %250 = udiv i32 %247, 64
  %251 = urem i32 %250, 100
  %252 = udiv i32 %247, 6400
  %253 = getelementptr inbounds float, ptr %arg1, i32 %247
  %254 = load float, ptr %253, align 4, !invariant.load !22
  br label %concatenate.6.merge28

concat_index_from_operand_id231:                  ; preds = %concatenate.pivot.128.38
  %255 = phi i32 [ 128, %concatenate.pivot.128.38 ]
  %256 = sub nsw i32 %224, %255
  %257 = udiv i32 %linear_index3, 200
  %258 = mul i32 %257, 8
  %259 = add i32 %258, %256
  %260 = udiv i32 %259, 1
  %261 = urem i32 %260, 8
  %262 = udiv i32 %259, 8
  %263 = urem i32 %262, 100
  %264 = udiv i32 %259, 800
  %265 = getelementptr inbounds float, ptr %arg2, i32 %259
  %266 = load float, ptr %265, align 4, !invariant.load !22
  br label %concatenate.6.merge28

concat_index_from_operand_id332:                  ; preds = %concatenate.pivot.136.39
  %267 = phi i32 [ 136, %concatenate.pivot.136.39 ]
  %268 = sub nsw i32 %224, %267
  %269 = udiv i32 %linear_index3, 200
  %270 = mul i32 %269, 64
  %271 = add i32 %270, %268
  %272 = udiv i32 %271, 1
  %273 = urem i32 %272, 64
  %274 = udiv i32 %271, 64
  %275 = urem i32 %274, 100
  %276 = udiv i32 %271, 6400
  %277 = mul nuw nsw i32 %268, 1
  %278 = add nuw nsw i32 0, %277
  %279 = mul nuw nsw i32 %228, 64
  %280 = add nuw nsw i32 %278, %279
  %281 = udiv i32 %280, 6400
  %282 = mul nuw nsw i32 %229, 1
  %283 = add nuw nsw i32 0, %282
  %284 = udiv i32 %283, 8192
  %285 = getelementptr inbounds float, ptr %arg3, i32 %271
  %286 = load float, ptr %285, align 4, !invariant.load !22
  br label %concatenate.6.merge28

concatenate.pivot.128.33:                         ; preds = %concatenate.6.merge16
  %287 = icmp ult i32 %224, 128
  br i1 %287, label %concatenate.pivot.64.34, label %concatenate.pivot.136.37

concatenate.pivot.64.34:                          ; preds = %concatenate.pivot.128.33
  %288 = icmp ult i32 %224, 64
  br i1 %288, label %concatenate.pivot.0.35, label %concatenate.pivot.64.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.64.34
  br label %concat_index_from_operand_id029

concatenate.pivot.64.36:                          ; preds = %concatenate.pivot.64.34
  br label %concat_index_from_operand_id130

concatenate.pivot.136.37:                         ; preds = %concatenate.pivot.128.33
  %289 = icmp ult i32 %224, 136
  br i1 %289, label %concatenate.pivot.128.38, label %concatenate.pivot.136.39

concatenate.pivot.128.38:                         ; preds = %concatenate.pivot.136.37
  br label %concat_index_from_operand_id231

concatenate.pivot.136.39:                         ; preds = %concatenate.pivot.136.37
  br label %concat_index_from_operand_id332

concatenate.6.merge28:                            ; preds = %concat_index_from_operand_id332, %concat_index_from_operand_id231, %concat_index_from_operand_id130, %concat_index_from_operand_id029
  %290 = phi float [ %242, %concat_index_from_operand_id029 ], [ %254, %concat_index_from_operand_id130 ], [ %266, %concat_index_from_operand_id231 ], [ %286, %concat_index_from_operand_id332 ]
  %291 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %290, ptr %291, align 4
  br label %fusion_10.in_bounds-after
}

define void @fusion_8(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(838860800) %arg1, ptr noalias align 128 dereferenceable(13107200) %arg2, ptr noalias align 128 dereferenceable(838860800) %arg3) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer58 = alloca float, align 4
  %result_from_other_lane56 = alloca float, align 4
  %return_buffer55 = alloca float, align 4
  %result_from_other_lane53 = alloca float, align 4
  %return_buffer52 = alloca float, align 4
  %result_from_other_lane50 = alloca float, align 4
  %return_buffer49 = alloca float, align 4
  %result_from_other_lane47 = alloca float, align 4
  %return_buffer46 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer44 = alloca float, align 4
  %tile_loop.invar_address17 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !24
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_23_constant_16 = load float, ptr @0, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_23_constant_16, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 3
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 3276800
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 3276800
  %15 = udiv i32 %8, 3276800
  %16 = icmp eq i32 %14, 3276799
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 64, i32 512
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 1
  %tile_origin.2 = mul i32 %12, 512
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %10
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %18 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %18, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %19 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %20 = icmp eq i32 512, %tile_bound1
  br i1 %20, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit14, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !27

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result45 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result45, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_17(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer46)
  %22 = load float, ptr %return_buffer46, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result48 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result48, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane47, align 4
  call void @region_1_17(ptr %current_output, ptr %result_from_other_lane47, ptr %return_buffer49)
  %24 = load float, ptr %return_buffer49, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result51 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane50, align 4
  call void @region_1_17(ptr %current_output, ptr %result_from_other_lane50, ptr %return_buffer52)
  %26 = load float, ptr %return_buffer52, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result54 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result54, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane53, align 4
  call void @region_1_17(ptr %current_output, ptr %result_from_other_lane53, ptr %return_buffer55)
  %28 = load float, ptr %return_buffer55, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result57 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result57, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane56, align 4
  call void @region_1_17(ptr %current_output, ptr %result_from_other_lane56, ptr %return_buffer58)
  %30 = load float, ptr %return_buffer58, align 4
  store float %30, ptr %current_output, align 4
  %31 = udiv i32 %thread_id.x, 32
  %32 = icmp eq i32 %lane_id, 0
  br i1 %32, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %33 = icmp eq i32 %31, 0
  br i1 %33, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %34 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %concatenate.14.merge, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %35 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %35, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %36 = icmp eq i32 %tile_loop.indvar, 0
  %37 = mul i32 %tile_loop.indvar, 32
  %38 = add i32 %37, 0
  %x_loc = add i32 %38, %34
  %39 = add i32 %tile_origin.1, %y_in_tile.indvar
  %40 = add i32 %tile_origin.2, %x_loc
  %41 = mul nuw nsw i32 %40, 1
  %42 = add nuw nsw i32 0, %41
  %43 = mul nuw nsw i32 %39, 64
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 209715200
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 64
  %49 = udiv i32 %46, 64
  %50 = urem i32 %49, 100
  %51 = udiv i32 %46, 6400
  %52 = urem i32 %51, 8192
  %53 = udiv i32 %46, 52428800
  %Arg_0.1 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 %53, i32 %52, i32 0, i32 %48
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !22
  br label %concatenate.pivot.2.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %54 = phi i32 [ 0, %concatenate.pivot.0. ]
  %55 = sub nsw i32 %53, %54
  %56 = add i32 %52, 0
  %57 = add i32 %50, 0
  %58 = add i32 %48, 0
  %59 = mul nuw nsw i32 %58, 1
  %60 = add nuw nsw i32 0, %59
  %61 = udiv i32 %60, 256
  %62 = mul nuw nsw i32 %57, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %56, 100
  %65 = add nuw nsw i32 %63, %64
  %66 = udiv i32 %65, 819200
  %Arg_1.2 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %65, i32 %60
  %Arg_1.24 = load float, ptr %Arg_1.2, align 4, !invariant.load !22
  br label %concatenate.14.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.11
  %67 = phi i32 [ 1, %concatenate.pivot.1.11 ]
  %68 = sub nsw i32 %53, %67
  %69 = add i32 %52, 0
  %70 = add i32 %50, 0
  %71 = add i32 %48, 64
  %72 = mul nuw nsw i32 %71, 1
  %73 = add nuw nsw i32 0, %72
  %74 = udiv i32 %73, 256
  %75 = mul nuw nsw i32 %70, 1
  %76 = add nuw nsw i32 0, %75
  %77 = mul nuw nsw i32 %69, 100
  %78 = add nuw nsw i32 %76, %77
  %79 = udiv i32 %78, 819200
  %Arg_1.25 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %78, i32 %73
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !22
  br label %concatenate.14.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.2.12
  %80 = phi i32 [ 2, %concatenate.pivot.2.12 ]
  %81 = sub nsw i32 %53, %80
  %82 = add i32 %52, 0
  %83 = add i32 %50, 0
  %84 = add i32 %48, 128
  %85 = mul nuw nsw i32 %84, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 256
  %88 = mul nuw nsw i32 %83, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %82, 100
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 819200
  %Arg_1.27 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %91, i32 %86
  %Arg_1.28 = load float, ptr %Arg_1.27, align 4, !invariant.load !22
  br label %concatenate.14.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.3.13
  %93 = phi i32 [ 3, %concatenate.pivot.3.13 ]
  %94 = sub nsw i32 %53, %93
  %95 = add i32 %52, 0
  %96 = add i32 %50, 0
  %97 = add i32 %48, 192
  %98 = mul nuw nsw i32 %97, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 256
  %101 = mul nuw nsw i32 %96, 1
  %102 = add nuw nsw i32 0, %101
  %103 = mul nuw nsw i32 %95, 100
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 819200
  %Arg_1.29 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %104, i32 %99
  %Arg_1.210 = load float, ptr %Arg_1.29, align 4, !invariant.load !22
  br label %concatenate.14.merge

concatenate.pivot.2.:                             ; preds = %tile_loop.loop_body
  %106 = icmp ult i32 %53, 2
  br i1 %106, label %concatenate.pivot.1., label %concatenate.pivot.3.

concatenate.pivot.1.:                             ; preds = %concatenate.pivot.2.
  %107 = icmp ult i32 %53, 1
  br i1 %107, label %concatenate.pivot.0., label %concatenate.pivot.1.11

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.11:                           ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.pivot.3.:                             ; preds = %concatenate.pivot.2.
  %108 = icmp ult i32 %53, 3
  br i1 %108, label %concatenate.pivot.2.12, label %concatenate.pivot.3.13

concatenate.pivot.2.12:                           ; preds = %concatenate.pivot.3.
  br label %concat_index_from_operand_id2

concatenate.pivot.3.13:                           ; preds = %concatenate.pivot.3.
  br label %concat_index_from_operand_id3

concatenate.14.merge:                             ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %109 = phi float [ %Arg_1.24, %concat_index_from_operand_id0 ], [ %Arg_1.26, %concat_index_from_operand_id1 ], [ %Arg_1.28, %concat_index_from_operand_id2 ], [ %Arg_1.210, %concat_index_from_operand_id3 ]
  %multiply.15 = fmul float %Arg_0.13, %109
  store float %multiply.15, ptr %reduction_input_address, align 4
  %110 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_17(ptr %110, ptr %reduction_input_address, ptr %return_buffer)
  %111 = load float, ptr %return_buffer, align 4
  store float %111, ptr %110, align 4
  %112 = getelementptr inbounds float, ptr %arg3, i32 %46
  store float %109, ptr %112, align 4
  br label %tile_loop.loop_header, !llvm.loop !29

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %113 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address17, align 4
  br label %tile_loop.loop_header15

tile_loop.loop_header15:                          ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar18 = load i32, ptr %tile_loop.invar_address17, align 4
  %114 = icmp uge i32 %tile_loop.indvar18, 16
  br i1 %114, label %tile_loop.loop_exit14, label %tile_loop.loop_body16

tile_loop.loop_body16:                            ; preds = %tile_loop.loop_header15
  %invar.inc19 = add nuw nsw i32 %tile_loop.indvar18, 1
  store i32 %invar.inc19, ptr %tile_loop.invar_address17, align 4
  %115 = icmp eq i32 %tile_loop.indvar18, 0
  %116 = mul i32 %tile_loop.indvar18, 32
  %117 = add i32 %116, 0
  %x_loc20 = add i32 %117, %113
  %118 = add i32 %tile_origin.1, %y_in_tile.indvar
  %119 = add i32 %tile_origin.2, %x_loc20
  %120 = icmp ult i32 %x_loc20, %tile_bound1
  br i1 %120, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %concatenate.14.merge23, %tile_loop.loop_body16
  br label %tile_loop.loop_header15, !llvm.loop !31

tile_loop.loop_exit14:                            ; preds = %tile_loop.loop_header15
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body16
  %121 = mul nuw nsw i32 %119, 1
  %122 = add nuw nsw i32 0, %121
  %123 = mul nuw nsw i32 %118, 64
  %124 = add nuw nsw i32 %122, %123
  %125 = mul nuw nsw i32 %tile_origin.0, 209715200
  %126 = add nuw nsw i32 %124, %125
  %127 = udiv i32 %126, 1
  %128 = urem i32 %127, 64
  %129 = udiv i32 %126, 64
  %130 = urem i32 %129, 100
  %131 = udiv i32 %126, 6400
  %132 = urem i32 %131, 8192
  %133 = udiv i32 %126, 52428800
  %Arg_0.121 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 %133, i32 %132, i32 0, i32 %128
  %Arg_0.122 = load float, ptr %Arg_0.121, align 4, !invariant.load !22
  br label %concatenate.pivot.2.36

concat_index_from_operand_id024:                  ; preds = %concatenate.pivot.0.38
  %134 = phi i32 [ 0, %concatenate.pivot.0.38 ]
  %135 = sub nsw i32 %133, %134
  %136 = add i32 %132, 0
  %137 = add i32 %130, 0
  %138 = add i32 %128, 0
  %139 = mul nuw nsw i32 %138, 1
  %140 = add nuw nsw i32 0, %139
  %141 = udiv i32 %140, 256
  %142 = mul nuw nsw i32 %137, 1
  %143 = add nuw nsw i32 0, %142
  %144 = mul nuw nsw i32 %136, 100
  %145 = add nuw nsw i32 %143, %144
  %146 = udiv i32 %145, 819200
  %Arg_1.225 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %145, i32 %140
  %Arg_1.226 = load float, ptr %Arg_1.225, align 4, !invariant.load !22
  br label %concatenate.14.merge23

concat_index_from_operand_id127:                  ; preds = %concatenate.pivot.1.39
  %147 = phi i32 [ 1, %concatenate.pivot.1.39 ]
  %148 = sub nsw i32 %133, %147
  %149 = add i32 %132, 0
  %150 = add i32 %130, 0
  %151 = add i32 %128, 64
  %152 = mul nuw nsw i32 %151, 1
  %153 = add nuw nsw i32 0, %152
  %154 = udiv i32 %153, 256
  %155 = mul nuw nsw i32 %150, 1
  %156 = add nuw nsw i32 0, %155
  %157 = mul nuw nsw i32 %149, 100
  %158 = add nuw nsw i32 %156, %157
  %159 = udiv i32 %158, 819200
  %Arg_1.228 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %158, i32 %153
  %Arg_1.229 = load float, ptr %Arg_1.228, align 4, !invariant.load !22
  br label %concatenate.14.merge23

concat_index_from_operand_id230:                  ; preds = %concatenate.pivot.2.41
  %160 = phi i32 [ 2, %concatenate.pivot.2.41 ]
  %161 = sub nsw i32 %133, %160
  %162 = add i32 %132, 0
  %163 = add i32 %130, 0
  %164 = add i32 %128, 128
  %165 = mul nuw nsw i32 %164, 1
  %166 = add nuw nsw i32 0, %165
  %167 = udiv i32 %166, 256
  %168 = mul nuw nsw i32 %163, 1
  %169 = add nuw nsw i32 0, %168
  %170 = mul nuw nsw i32 %162, 100
  %171 = add nuw nsw i32 %169, %170
  %172 = udiv i32 %171, 819200
  %Arg_1.231 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %171, i32 %166
  %Arg_1.232 = load float, ptr %Arg_1.231, align 4, !invariant.load !22
  br label %concatenate.14.merge23

concat_index_from_operand_id333:                  ; preds = %concatenate.pivot.3.42
  %173 = phi i32 [ 3, %concatenate.pivot.3.42 ]
  %174 = sub nsw i32 %133, %173
  %175 = add i32 %132, 0
  %176 = add i32 %130, 0
  %177 = add i32 %128, 192
  %178 = mul nuw nsw i32 %177, 1
  %179 = add nuw nsw i32 0, %178
  %180 = udiv i32 %179, 256
  %181 = mul nuw nsw i32 %176, 1
  %182 = add nuw nsw i32 0, %181
  %183 = mul nuw nsw i32 %175, 100
  %184 = add nuw nsw i32 %182, %183
  %185 = udiv i32 %184, 819200
  %Arg_1.234 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %184, i32 %179
  %Arg_1.235 = load float, ptr %Arg_1.234, align 4, !invariant.load !22
  br label %concatenate.14.merge23

concatenate.pivot.2.36:                           ; preds = %x_in_tile-true
  %186 = icmp ult i32 %133, 2
  br i1 %186, label %concatenate.pivot.1.37, label %concatenate.pivot.3.40

concatenate.pivot.1.37:                           ; preds = %concatenate.pivot.2.36
  %187 = icmp ult i32 %133, 1
  br i1 %187, label %concatenate.pivot.0.38, label %concatenate.pivot.1.39

concatenate.pivot.0.38:                           ; preds = %concatenate.pivot.1.37
  br label %concat_index_from_operand_id024

concatenate.pivot.1.39:                           ; preds = %concatenate.pivot.1.37
  br label %concat_index_from_operand_id127

concatenate.pivot.3.40:                           ; preds = %concatenate.pivot.2.36
  %188 = icmp ult i32 %133, 3
  br i1 %188, label %concatenate.pivot.2.41, label %concatenate.pivot.3.42

concatenate.pivot.2.41:                           ; preds = %concatenate.pivot.3.40
  br label %concat_index_from_operand_id230

concatenate.pivot.3.42:                           ; preds = %concatenate.pivot.3.40
  br label %concat_index_from_operand_id333

concatenate.14.merge23:                           ; preds = %concat_index_from_operand_id333, %concat_index_from_operand_id230, %concat_index_from_operand_id127, %concat_index_from_operand_id024
  %189 = phi float [ %Arg_1.226, %concat_index_from_operand_id024 ], [ %Arg_1.229, %concat_index_from_operand_id127 ], [ %Arg_1.232, %concat_index_from_operand_id230 ], [ %Arg_1.235, %concat_index_from_operand_id333 ]
  %multiply.1543 = fmul float %Arg_0.122, %189
  store float %multiply.1543, ptr %reduction_input_address, align 4
  %190 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_17(ptr %190, ptr %reduction_input_address, ptr %return_buffer44)
  %191 = load float, ptr %return_buffer44, align 4
  store float %191, ptr %190, align 4
  %192 = getelementptr inbounds float, ptr %arg3, i32 %126
  store float %189, ptr %192, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %193 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %31
  %194 = addrspacecast ptr addrspace(3) %193 to ptr
  %195 = load float, ptr %current_output, align 4
  store float %195, ptr %194, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %196 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %lane_id
  %197 = addrspacecast ptr addrspace(3) %196 to ptr
  store float %region_0_23_constant_16, ptr %initial_value_addr, align 4
  %198 = icmp ult i32 %thread_id.x, 1
  %199 = select i1 %198, ptr %197, ptr %initial_value_addr
  %200 = icmp eq i32 %thread_id.x, 0
  br i1 %200, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %201 = mul i32 %thread_id.x, 1
  %202 = add i32 %tile_origin.1, %thread_id.y
  %203 = add i32 %tile_origin.2, %201
  %204 = add i32 %203, 0
  %205 = udiv i32 %202, 1
  %206 = urem i32 %205, 100
  %207 = udiv i32 %202, 100
  %208 = urem i32 %207, 8192
  %209 = udiv i32 %202, 819200
  %output_element_address = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr %arg2, i32 0, i32 %209, i32 %208, i32 %206
  %output = load float, ptr %199, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

define internal void @region_1_17(ptr dereferenceable(4) %Arg_0.18.typed, ptr dereferenceable(4) %Arg_1.19.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.20.typed = alloca float, align 4
  %Arg_0.18 = load float, ptr %Arg_0.18.typed, align 4
  %Arg_1.19 = load float, ptr %Arg_1.19.typed, align 4
  %add.20 = fadd float %Arg_0.18, %Arg_1.19
  store float %add.20, ptr %add.20.typed, align 4
  %load_ret_value = load float, ptr %add.20.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define void @fusion_6(ptr noalias align 16 dereferenceable(16) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(16) %arg3, ptr noalias align 16 dereferenceable(3276800) %arg4, ptr noalias align 16 dereferenceable(16) %arg5, ptr noalias align 16 dereferenceable(3276800) %arg6, ptr noalias align 16 dereferenceable(16) %arg7, ptr noalias align 16 dereferenceable(3276800) %arg8, ptr noalias align 16 dereferenceable(16) %arg9, ptr noalias align 16 dereferenceable(3276800) %arg10, ptr noalias align 128 dereferenceable(131072) %arg11) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer65 = alloca float, align 4
  %result_from_other_lane63 = alloca float, align 4
  %return_buffer62 = alloca float, align 4
  %result_from_other_lane60 = alloca float, align 4
  %return_buffer59 = alloca float, align 4
  %result_from_other_lane57 = alloca float, align 4
  %return_buffer56 = alloca float, align 4
  %result_from_other_lane54 = alloca float, align 4
  %return_buffer53 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer51 = alloca float, align 4
  %tile_loop.invar_address16 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !24
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_49_constant_43 = load float, ptr @1, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_49_constant_43, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !32
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 3
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 32768
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 32768
  %15 = udiv i32 %8, 32768
  %16 = icmp eq i32 %14, 32767
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 100, i32 512
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 1
  %tile_origin.2 = mul i32 %12, 512
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %10
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %18 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %18, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %19 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %20 = icmp eq i32 512, %tile_bound1
  br i1 %20, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit13, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !33

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result52 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result52, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_44(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer53)
  %22 = load float, ptr %return_buffer53, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result55 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result55, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane54, align 4
  call void @region_1_44(ptr %current_output, ptr %result_from_other_lane54, ptr %return_buffer56)
  %24 = load float, ptr %return_buffer56, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result58 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result58, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane57, align 4
  call void @region_1_44(ptr %current_output, ptr %result_from_other_lane57, ptr %return_buffer59)
  %26 = load float, ptr %return_buffer59, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result61 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result61, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane60, align 4
  call void @region_1_44(ptr %current_output, ptr %result_from_other_lane60, ptr %return_buffer62)
  %28 = load float, ptr %return_buffer62, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result64 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result64, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane63, align 4
  call void @region_1_44(ptr %current_output, ptr %result_from_other_lane63, ptr %return_buffer65)
  %30 = load float, ptr %return_buffer65, align 4
  store float %30, ptr %current_output, align 4
  %31 = udiv i32 %thread_id.x, 32
  %32 = icmp eq i32 %lane_id, 0
  br i1 %32, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %33 = icmp eq i32 %31, 0
  br i1 %33, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %34 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %35 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %35, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %36 = icmp eq i32 %tile_loop.indvar, 0
  %37 = mul i32 %tile_loop.indvar, 32
  %38 = add i32 %37, 0
  %x_loc = add i32 %38, %34
  %39 = add i32 %tile_origin.1, %y_in_tile.indvar
  %40 = add i32 %tile_origin.2, %x_loc
  %41 = mul nuw nsw i32 %40, 1
  %42 = add nuw nsw i32 0, %41
  %43 = mul nuw nsw i32 %39, 100
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 3276800
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 100
  %49 = udiv i32 %46, 100
  %50 = urem i32 %49, 8192
  %51 = udiv i32 %46, 819200
  %52 = mul nuw nsw i32 %48, 1
  %53 = add nuw nsw i32 0, %52
  %54 = mul nuw nsw i32 %50, 100
  %55 = add nuw nsw i32 %53, %54
  %56 = udiv i32 %55, 819200
  %57 = mul nuw nsw i32 %51, 1
  %58 = add nuw nsw i32 0, %57
  %59 = udiv i32 %58, 4
  %60 = mul nuw nsw i32 %55, 1
  %61 = add nuw nsw i32 0, %60
  %62 = urem i32 %61, 100
  %63 = udiv i32 %61, 100
  %64 = udiv i32 %63, 8192
  %Arg_10.11 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %63, i32 %62, i32 0
  %Arg_10.113 = load float, ptr %Arg_10.11, align 4, !invariant.load !22
  %Arg_9.10 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %58
  %Arg_9.104 = load float, ptr %Arg_9.10, align 4, !invariant.load !22
  %multiply.16 = fmul float %Arg_10.113, %Arg_9.104
  %65 = mul nuw nsw i32 %55, 1
  %66 = add nuw nsw i32 0, %65
  %67 = urem i32 %66, 100
  %68 = udiv i32 %66, 100
  %69 = udiv i32 %68, 8192
  %Arg_8.9 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %68, i32 %67, i32 0
  %Arg_8.95 = load float, ptr %Arg_8.9, align 4, !invariant.load !22
  %Arg_7.8 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %58
  %Arg_7.86 = load float, ptr %Arg_7.8, align 4, !invariant.load !22
  %multiply.21 = fmul float %Arg_8.95, %Arg_7.86
  %add.22 = fadd float %multiply.16, %multiply.21
  %70 = mul nuw nsw i32 %55, 1
  %71 = add nuw nsw i32 0, %70
  %72 = urem i32 %71, 100
  %73 = udiv i32 %71, 100
  %74 = udiv i32 %73, 8192
  %Arg_6.7 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %73, i32 %72, i32 0
  %Arg_6.77 = load float, ptr %Arg_6.7, align 4, !invariant.load !22
  %Arg_5.6 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %58
  %Arg_5.68 = load float, ptr %Arg_5.6, align 4, !invariant.load !22
  %multiply.27 = fmul float %Arg_6.77, %Arg_5.68
  %add.28 = fadd float %add.22, %multiply.27
  %75 = mul nuw nsw i32 %55, 1
  %76 = add nuw nsw i32 0, %75
  %77 = urem i32 %76, 100
  %78 = udiv i32 %76, 100
  %79 = udiv i32 %78, 8192
  %Arg_4.5 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %78, i32 %77, i32 0
  %Arg_4.59 = load float, ptr %Arg_4.5, align 4, !invariant.load !22
  %Arg_3.4 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %58
  %Arg_3.410 = load float, ptr %Arg_3.4, align 4, !invariant.load !22
  %multiply.33 = fmul float %Arg_4.59, %Arg_3.410
  %add.34 = fadd float %add.28, %multiply.33
  %Arg_2.3 = load float, ptr %arg2, align 4, !invariant.load !22
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %46
  %Arg_1.211 = load float, ptr %Arg_1.2, align 4, !invariant.load !22
  %multiply.37 = fmul float %Arg_2.3, %Arg_1.211
  %add.38 = fadd float %add.34, %multiply.37
  %Arg_0.1 = getelementptr inbounds [4 x float], ptr %arg0, i32 0, i32 %51
  %Arg_0.112 = load float, ptr %Arg_0.1, align 4, !invariant.load !22
  %add.41 = fadd float %add.38, %Arg_0.112
  store float %add.41, ptr %reduction_input_address, align 4
  %80 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_44(ptr %80, ptr %reduction_input_address, ptr %return_buffer)
  %81 = load float, ptr %return_buffer, align 4
  store float %81, ptr %80, align 4
  br label %tile_loop.loop_header, !llvm.loop !34

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %82 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address16, align 4
  br label %tile_loop.loop_header14

tile_loop.loop_header14:                          ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar17 = load i32, ptr %tile_loop.invar_address16, align 4
  %83 = icmp uge i32 %tile_loop.indvar17, 16
  br i1 %83, label %tile_loop.loop_exit13, label %tile_loop.loop_body15

tile_loop.loop_body15:                            ; preds = %tile_loop.loop_header14
  %invar.inc18 = add nuw nsw i32 %tile_loop.indvar17, 1
  store i32 %invar.inc18, ptr %tile_loop.invar_address16, align 4
  %84 = icmp eq i32 %tile_loop.indvar17, 0
  %85 = mul i32 %tile_loop.indvar17, 32
  %86 = add i32 %85, 0
  %x_loc19 = add i32 %86, %82
  %87 = add i32 %tile_origin.1, %y_in_tile.indvar
  %88 = add i32 %tile_origin.2, %x_loc19
  %89 = icmp ult i32 %x_loc19, %tile_bound1
  br i1 %89, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body15
  br label %tile_loop.loop_header14, !llvm.loop !35

tile_loop.loop_exit13:                            ; preds = %tile_loop.loop_header14
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body15
  %90 = mul nuw nsw i32 %88, 1
  %91 = add nuw nsw i32 0, %90
  %92 = mul nuw nsw i32 %87, 100
  %93 = add nuw nsw i32 %91, %92
  %94 = mul nuw nsw i32 %tile_origin.0, 3276800
  %95 = add nuw nsw i32 %93, %94
  %96 = udiv i32 %95, 1
  %97 = urem i32 %96, 100
  %98 = udiv i32 %95, 100
  %99 = urem i32 %98, 8192
  %100 = udiv i32 %95, 819200
  %101 = mul nuw nsw i32 %97, 1
  %102 = add nuw nsw i32 0, %101
  %103 = mul nuw nsw i32 %99, 100
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 819200
  %106 = mul nuw nsw i32 %100, 1
  %107 = add nuw nsw i32 0, %106
  %108 = udiv i32 %107, 4
  %109 = mul nuw nsw i32 %104, 1
  %110 = add nuw nsw i32 0, %109
  %111 = urem i32 %110, 100
  %112 = udiv i32 %110, 100
  %113 = udiv i32 %112, 8192
  %Arg_10.1120 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %112, i32 %111, i32 0
  %Arg_10.1121 = load float, ptr %Arg_10.1120, align 4, !invariant.load !22
  %Arg_9.1022 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %107
  %Arg_9.1023 = load float, ptr %Arg_9.1022, align 4, !invariant.load !22
  %multiply.1624 = fmul float %Arg_10.1121, %Arg_9.1023
  %114 = mul nuw nsw i32 %104, 1
  %115 = add nuw nsw i32 0, %114
  %116 = urem i32 %115, 100
  %117 = udiv i32 %115, 100
  %118 = udiv i32 %117, 8192
  %Arg_8.925 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %117, i32 %116, i32 0
  %Arg_8.926 = load float, ptr %Arg_8.925, align 4, !invariant.load !22
  %Arg_7.827 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %107
  %Arg_7.828 = load float, ptr %Arg_7.827, align 4, !invariant.load !22
  %multiply.2129 = fmul float %Arg_8.926, %Arg_7.828
  %add.2230 = fadd float %multiply.1624, %multiply.2129
  %119 = mul nuw nsw i32 %104, 1
  %120 = add nuw nsw i32 0, %119
  %121 = urem i32 %120, 100
  %122 = udiv i32 %120, 100
  %123 = udiv i32 %122, 8192
  %Arg_6.731 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %122, i32 %121, i32 0
  %Arg_6.732 = load float, ptr %Arg_6.731, align 4, !invariant.load !22
  %Arg_5.633 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %107
  %Arg_5.634 = load float, ptr %Arg_5.633, align 4, !invariant.load !22
  %multiply.2735 = fmul float %Arg_6.732, %Arg_5.634
  %add.2836 = fadd float %add.2230, %multiply.2735
  %124 = mul nuw nsw i32 %104, 1
  %125 = add nuw nsw i32 0, %124
  %126 = urem i32 %125, 100
  %127 = udiv i32 %125, 100
  %128 = udiv i32 %127, 8192
  %Arg_4.537 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %127, i32 %126, i32 0
  %Arg_4.538 = load float, ptr %Arg_4.537, align 4, !invariant.load !22
  %Arg_3.439 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %107
  %Arg_3.440 = load float, ptr %Arg_3.439, align 4, !invariant.load !22
  %multiply.3341 = fmul float %Arg_4.538, %Arg_3.440
  %add.3442 = fadd float %add.2836, %multiply.3341
  %Arg_2.343 = load float, ptr %arg2, align 4, !invariant.load !22
  %Arg_1.244 = getelementptr inbounds float, ptr %arg1, i32 %95
  %Arg_1.245 = load float, ptr %Arg_1.244, align 4, !invariant.load !22
  %multiply.3746 = fmul float %Arg_2.343, %Arg_1.245
  %add.3847 = fadd float %add.3442, %multiply.3746
  %Arg_0.148 = getelementptr inbounds [4 x float], ptr %arg0, i32 0, i32 %100
  %Arg_0.149 = load float, ptr %Arg_0.148, align 4, !invariant.load !22
  %add.4150 = fadd float %add.3847, %Arg_0.149
  store float %add.4150, ptr %reduction_input_address, align 4
  %129 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_44(ptr %129, ptr %reduction_input_address, ptr %return_buffer51)
  %130 = load float, ptr %return_buffer51, align 4
  store float %130, ptr %129, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %131 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %6, i32 0, i32 %31
  %132 = addrspacecast ptr addrspace(3) %131 to ptr
  %133 = load float, ptr %current_output, align 4
  store float %133, ptr %132, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %134 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %6, i32 0, i32 %lane_id
  %135 = addrspacecast ptr addrspace(3) %134 to ptr
  store float %region_0_49_constant_43, ptr %initial_value_addr, align 4
  %136 = icmp ult i32 %thread_id.x, 1
  %137 = select i1 %136, ptr %135, ptr %initial_value_addr
  %138 = icmp eq i32 %thread_id.x, 0
  br i1 %138, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %139 = mul i32 %thread_id.x, 1
  %140 = add i32 %tile_origin.1, %thread_id.y
  %141 = add i32 %tile_origin.2, %139
  %142 = add i32 %141, 0
  %143 = udiv i32 %140, 1
  %144 = urem i32 %143, 8192
  %145 = udiv i32 %140, 8192
  %output_element_address = getelementptr inbounds [4 x [8192 x float]], ptr %arg11, i32 0, i32 %145, i32 %144
  %output = load float, ptr %137, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_44(ptr dereferenceable(4) %Arg_0.45.typed, ptr dereferenceable(4) %Arg_1.46.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %maximum.47.typed = alloca float, align 4
  %Arg_0.45 = load float, ptr %Arg_0.45.typed, align 4
  %Arg_1.46 = load float, ptr %Arg_1.46.typed, align 4
  %0 = fcmp oge float %Arg_0.45, %Arg_1.46
  %1 = fcmp une float %Arg_0.45, %Arg_0.45
  %2 = or i1 %0, %1
  %maximum.47 = select i1 %2, float %Arg_0.45, float %Arg_1.46
  store float %maximum.47, ptr %maximum.47.typed, align 4
  %load_ret_value = load float, ptr %maximum.47.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_4(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(16) %arg1, ptr noalias align 128 dereferenceable(13107200) %arg2, ptr noalias align 16 dereferenceable(4) %arg3, ptr noalias align 16 dereferenceable(16) %arg4, ptr noalias align 16 dereferenceable(3276800) %arg5, ptr noalias align 16 dereferenceable(16) %arg6, ptr noalias align 16 dereferenceable(3276800) %arg7, ptr noalias align 16 dereferenceable(16) %arg8, ptr noalias align 16 dereferenceable(3276800) %arg9, ptr noalias align 16 dereferenceable(16) %arg10, ptr noalias align 16 dereferenceable(3276800) %arg11, ptr noalias align 128 dereferenceable(131072) %arg12) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer69 = alloca float, align 4
  %result_from_other_lane67 = alloca float, align 4
  %return_buffer66 = alloca float, align 4
  %result_from_other_lane64 = alloca float, align 4
  %return_buffer63 = alloca float, align 4
  %result_from_other_lane61 = alloca float, align 4
  %return_buffer60 = alloca float, align 4
  %result_from_other_lane58 = alloca float, align 4
  %return_buffer57 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer55 = alloca float, align 4
  %tile_loop.invar_address17 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !24
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_53_constant_47 = load float, ptr @2, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_53_constant_47, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !32
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 3
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 32768
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 32768
  %15 = udiv i32 %8, 32768
  %16 = icmp eq i32 %14, 32767
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 100, i32 512
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 1
  %tile_origin.2 = mul i32 %12, 512
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %10
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %18 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %18, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %19 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %20 = icmp eq i32 512, %tile_bound1
  br i1 %20, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit14, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !36

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result56 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result56, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_48(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer57)
  %22 = load float, ptr %return_buffer57, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result59 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result59, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane58, align 4
  call void @region_1_48(ptr %current_output, ptr %result_from_other_lane58, ptr %return_buffer60)
  %24 = load float, ptr %return_buffer60, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result62 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result62, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane61, align 4
  call void @region_1_48(ptr %current_output, ptr %result_from_other_lane61, ptr %return_buffer63)
  %26 = load float, ptr %return_buffer63, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result65 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result65, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane64, align 4
  call void @region_1_48(ptr %current_output, ptr %result_from_other_lane64, ptr %return_buffer66)
  %28 = load float, ptr %return_buffer66, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result68 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result68, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane67, align 4
  call void @region_1_48(ptr %current_output, ptr %result_from_other_lane67, ptr %return_buffer69)
  %30 = load float, ptr %return_buffer69, align 4
  store float %30, ptr %current_output, align 4
  %31 = udiv i32 %thread_id.x, 32
  %32 = icmp eq i32 %lane_id, 0
  br i1 %32, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %33 = icmp eq i32 %31, 0
  br i1 %33, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %34 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %35 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %35, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %36 = icmp eq i32 %tile_loop.indvar, 0
  %37 = mul i32 %tile_loop.indvar, 32
  %38 = add i32 %37, 0
  %x_loc = add i32 %38, %34
  %39 = add i32 %tile_origin.1, %y_in_tile.indvar
  %40 = add i32 %tile_origin.2, %x_loc
  %41 = mul nuw nsw i32 %40, 1
  %42 = add nuw nsw i32 0, %41
  %43 = mul nuw nsw i32 %39, 100
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 3276800
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 100
  %49 = udiv i32 %46, 100
  %50 = urem i32 %49, 8192
  %51 = udiv i32 %46, 819200
  %52 = mul nuw nsw i32 %48, 1
  %53 = add nuw nsw i32 0, %52
  %54 = mul nuw nsw i32 %50, 100
  %55 = add nuw nsw i32 %53, %54
  %56 = udiv i32 %55, 819200
  %57 = mul nuw nsw i32 %51, 1
  %58 = add nuw nsw i32 0, %57
  %59 = udiv i32 %58, 4
  %60 = mul nuw nsw i32 %55, 1
  %61 = add nuw nsw i32 0, %60
  %62 = urem i32 %61, 100
  %63 = udiv i32 %61, 100
  %64 = udiv i32 %63, 8192
  %Arg_11.12 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg11, i32 0, i32 %63, i32 %62, i32 0
  %Arg_11.123 = load float, ptr %Arg_11.12, align 4, !invariant.load !22
  %Arg_10.11 = getelementptr inbounds [1 x [4 x float]], ptr %arg10, i32 0, i32 0, i32 %58
  %Arg_10.114 = load float, ptr %Arg_10.11, align 4, !invariant.load !22
  %multiply.17 = fmul float %Arg_11.123, %Arg_10.114
  %65 = mul nuw nsw i32 %55, 1
  %66 = add nuw nsw i32 0, %65
  %67 = urem i32 %66, 100
  %68 = udiv i32 %66, 100
  %69 = udiv i32 %68, 8192
  %Arg_9.10 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg9, i32 0, i32 %68, i32 %67, i32 0
  %Arg_9.105 = load float, ptr %Arg_9.10, align 4, !invariant.load !22
  %Arg_8.9 = getelementptr inbounds [1 x [4 x float]], ptr %arg8, i32 0, i32 0, i32 %58
  %Arg_8.96 = load float, ptr %Arg_8.9, align 4, !invariant.load !22
  %multiply.22 = fmul float %Arg_9.105, %Arg_8.96
  %add.23 = fadd float %multiply.17, %multiply.22
  %70 = mul nuw nsw i32 %55, 1
  %71 = add nuw nsw i32 0, %70
  %72 = urem i32 %71, 100
  %73 = udiv i32 %71, 100
  %74 = udiv i32 %73, 8192
  %Arg_7.8 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg7, i32 0, i32 %73, i32 %72, i32 0
  %Arg_7.87 = load float, ptr %Arg_7.8, align 4, !invariant.load !22
  %Arg_6.7 = getelementptr inbounds [1 x [4 x float]], ptr %arg6, i32 0, i32 0, i32 %58
  %Arg_6.78 = load float, ptr %Arg_6.7, align 4, !invariant.load !22
  %multiply.28 = fmul float %Arg_7.87, %Arg_6.78
  %add.29 = fadd float %add.23, %multiply.28
  %75 = mul nuw nsw i32 %55, 1
  %76 = add nuw nsw i32 0, %75
  %77 = urem i32 %76, 100
  %78 = udiv i32 %76, 100
  %79 = udiv i32 %78, 8192
  %Arg_5.6 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg5, i32 0, i32 %78, i32 %77, i32 0
  %Arg_5.69 = load float, ptr %Arg_5.6, align 4, !invariant.load !22
  %Arg_4.5 = getelementptr inbounds [1 x [4 x float]], ptr %arg4, i32 0, i32 0, i32 %58
  %Arg_4.510 = load float, ptr %Arg_4.5, align 4, !invariant.load !22
  %multiply.34 = fmul float %Arg_5.69, %Arg_4.510
  %add.35 = fadd float %add.29, %multiply.34
  %Arg_3.4 = load float, ptr %arg3, align 4, !invariant.load !22
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %46
  %Arg_2.311 = load float, ptr %Arg_2.3, align 4, !invariant.load !22
  %multiply.38 = fmul float %Arg_3.4, %Arg_2.311
  %add.39 = fadd float %add.35, %multiply.38
  %Arg_1.2 = getelementptr inbounds [4 x float], ptr %arg1, i32 0, i32 %51
  %Arg_1.212 = load float, ptr %Arg_1.2, align 4, !invariant.load !22
  %add.42 = fadd float %add.39, %Arg_1.212
  %80 = udiv i32 %46, 100
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %80
  %Arg_0.113 = load float, ptr %Arg_0.1, align 4, !invariant.load !22
  %subtract.44 = fsub float %add.42, %Arg_0.113
  %81 = call float @__nv_expf(float %subtract.44)
  store float %81, ptr %reduction_input_address, align 4
  %82 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_48(ptr %82, ptr %reduction_input_address, ptr %return_buffer)
  %83 = load float, ptr %return_buffer, align 4
  store float %83, ptr %82, align 4
  br label %tile_loop.loop_header, !llvm.loop !37

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %84 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address17, align 4
  br label %tile_loop.loop_header15

tile_loop.loop_header15:                          ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar18 = load i32, ptr %tile_loop.invar_address17, align 4
  %85 = icmp uge i32 %tile_loop.indvar18, 16
  br i1 %85, label %tile_loop.loop_exit14, label %tile_loop.loop_body16

tile_loop.loop_body16:                            ; preds = %tile_loop.loop_header15
  %invar.inc19 = add nuw nsw i32 %tile_loop.indvar18, 1
  store i32 %invar.inc19, ptr %tile_loop.invar_address17, align 4
  %86 = icmp eq i32 %tile_loop.indvar18, 0
  %87 = mul i32 %tile_loop.indvar18, 32
  %88 = add i32 %87, 0
  %x_loc20 = add i32 %88, %84
  %89 = add i32 %tile_origin.1, %y_in_tile.indvar
  %90 = add i32 %tile_origin.2, %x_loc20
  %91 = icmp ult i32 %x_loc20, %tile_bound1
  br i1 %91, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body16
  br label %tile_loop.loop_header15, !llvm.loop !38

tile_loop.loop_exit14:                            ; preds = %tile_loop.loop_header15
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body16
  %92 = mul nuw nsw i32 %90, 1
  %93 = add nuw nsw i32 0, %92
  %94 = mul nuw nsw i32 %89, 100
  %95 = add nuw nsw i32 %93, %94
  %96 = mul nuw nsw i32 %tile_origin.0, 3276800
  %97 = add nuw nsw i32 %95, %96
  %98 = udiv i32 %97, 1
  %99 = urem i32 %98, 100
  %100 = udiv i32 %97, 100
  %101 = urem i32 %100, 8192
  %102 = udiv i32 %97, 819200
  %103 = mul nuw nsw i32 %99, 1
  %104 = add nuw nsw i32 0, %103
  %105 = mul nuw nsw i32 %101, 100
  %106 = add nuw nsw i32 %104, %105
  %107 = udiv i32 %106, 819200
  %108 = mul nuw nsw i32 %102, 1
  %109 = add nuw nsw i32 0, %108
  %110 = udiv i32 %109, 4
  %111 = mul nuw nsw i32 %106, 1
  %112 = add nuw nsw i32 0, %111
  %113 = urem i32 %112, 100
  %114 = udiv i32 %112, 100
  %115 = udiv i32 %114, 8192
  %Arg_11.1221 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg11, i32 0, i32 %114, i32 %113, i32 0
  %Arg_11.1222 = load float, ptr %Arg_11.1221, align 4, !invariant.load !22
  %Arg_10.1123 = getelementptr inbounds [1 x [4 x float]], ptr %arg10, i32 0, i32 0, i32 %109
  %Arg_10.1124 = load float, ptr %Arg_10.1123, align 4, !invariant.load !22
  %multiply.1725 = fmul float %Arg_11.1222, %Arg_10.1124
  %116 = mul nuw nsw i32 %106, 1
  %117 = add nuw nsw i32 0, %116
  %118 = urem i32 %117, 100
  %119 = udiv i32 %117, 100
  %120 = udiv i32 %119, 8192
  %Arg_9.1026 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg9, i32 0, i32 %119, i32 %118, i32 0
  %Arg_9.1027 = load float, ptr %Arg_9.1026, align 4, !invariant.load !22
  %Arg_8.928 = getelementptr inbounds [1 x [4 x float]], ptr %arg8, i32 0, i32 0, i32 %109
  %Arg_8.929 = load float, ptr %Arg_8.928, align 4, !invariant.load !22
  %multiply.2230 = fmul float %Arg_9.1027, %Arg_8.929
  %add.2331 = fadd float %multiply.1725, %multiply.2230
  %121 = mul nuw nsw i32 %106, 1
  %122 = add nuw nsw i32 0, %121
  %123 = urem i32 %122, 100
  %124 = udiv i32 %122, 100
  %125 = udiv i32 %124, 8192
  %Arg_7.832 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg7, i32 0, i32 %124, i32 %123, i32 0
  %Arg_7.833 = load float, ptr %Arg_7.832, align 4, !invariant.load !22
  %Arg_6.734 = getelementptr inbounds [1 x [4 x float]], ptr %arg6, i32 0, i32 0, i32 %109
  %Arg_6.735 = load float, ptr %Arg_6.734, align 4, !invariant.load !22
  %multiply.2836 = fmul float %Arg_7.833, %Arg_6.735
  %add.2937 = fadd float %add.2331, %multiply.2836
  %126 = mul nuw nsw i32 %106, 1
  %127 = add nuw nsw i32 0, %126
  %128 = urem i32 %127, 100
  %129 = udiv i32 %127, 100
  %130 = udiv i32 %129, 8192
  %Arg_5.638 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg5, i32 0, i32 %129, i32 %128, i32 0
  %Arg_5.639 = load float, ptr %Arg_5.638, align 4, !invariant.load !22
  %Arg_4.540 = getelementptr inbounds [1 x [4 x float]], ptr %arg4, i32 0, i32 0, i32 %109
  %Arg_4.541 = load float, ptr %Arg_4.540, align 4, !invariant.load !22
  %multiply.3442 = fmul float %Arg_5.639, %Arg_4.541
  %add.3543 = fadd float %add.2937, %multiply.3442
  %Arg_3.444 = load float, ptr %arg3, align 4, !invariant.load !22
  %Arg_2.345 = getelementptr inbounds float, ptr %arg2, i32 %97
  %Arg_2.346 = load float, ptr %Arg_2.345, align 4, !invariant.load !22
  %multiply.3847 = fmul float %Arg_3.444, %Arg_2.346
  %add.3948 = fadd float %add.3543, %multiply.3847
  %Arg_1.249 = getelementptr inbounds [4 x float], ptr %arg1, i32 0, i32 %102
  %Arg_1.250 = load float, ptr %Arg_1.249, align 4, !invariant.load !22
  %add.4251 = fadd float %add.3948, %Arg_1.250
  %131 = udiv i32 %97, 100
  %Arg_0.152 = getelementptr inbounds float, ptr %arg0, i32 %131
  %Arg_0.153 = load float, ptr %Arg_0.152, align 4, !invariant.load !22
  %subtract.4454 = fsub float %add.4251, %Arg_0.153
  %132 = call float @__nv_expf(float %subtract.4454)
  store float %132, ptr %reduction_input_address, align 4
  %133 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_48(ptr %133, ptr %reduction_input_address, ptr %return_buffer55)
  %134 = load float, ptr %return_buffer55, align 4
  store float %134, ptr %133, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %135 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %6, i32 0, i32 %31
  %136 = addrspacecast ptr addrspace(3) %135 to ptr
  %137 = load float, ptr %current_output, align 4
  store float %137, ptr %136, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %138 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %6, i32 0, i32 %lane_id
  %139 = addrspacecast ptr addrspace(3) %138 to ptr
  store float %region_0_53_constant_47, ptr %initial_value_addr, align 4
  %140 = icmp ult i32 %thread_id.x, 1
  %141 = select i1 %140, ptr %139, ptr %initial_value_addr
  %142 = icmp eq i32 %thread_id.x, 0
  br i1 %142, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %143 = mul i32 %thread_id.x, 1
  %144 = add i32 %tile_origin.1, %thread_id.y
  %145 = add i32 %tile_origin.2, %143
  %146 = add i32 %145, 0
  %147 = udiv i32 %144, 1
  %148 = urem i32 %147, 8192
  %149 = udiv i32 %144, 8192
  %output_element_address = getelementptr inbounds [4 x [8192 x float]], ptr %arg12, i32 0, i32 %149, i32 %148
  %output = load float, ptr %141, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nounwind memory(none)
declare float @__nv_expf(float) #4

define internal void @region_1_48(ptr dereferenceable(4) %Arg_0.49.typed, ptr dereferenceable(4) %Arg_1.50.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.51.typed = alloca float, align 4
  %Arg_0.49 = load float, ptr %Arg_0.49.typed, align 4
  %Arg_1.50 = load float, ptr %Arg_1.50.typed, align 4
  %add.51 = fadd float %Arg_0.49, %Arg_1.50
  store float %add.51, ptr %add.51.typed, align 4
  %load_ret_value = load float, ptr %add.51.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_3(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(16) %arg2, ptr noalias align 128 dereferenceable(13107200) %arg3, ptr noalias align 16 dereferenceable(4) %arg4, ptr noalias align 16 dereferenceable(16) %arg5, ptr noalias align 16 dereferenceable(3276800) %arg6, ptr noalias align 16 dereferenceable(16) %arg7, ptr noalias align 16 dereferenceable(3276800) %arg8, ptr noalias align 16 dereferenceable(16) %arg9, ptr noalias align 16 dereferenceable(3276800) %arg10, ptr noalias align 16 dereferenceable(16) %arg11, ptr noalias align 16 dereferenceable(3276800) %arg12, ptr noalias align 128 dereferenceable(13107200) %arg13) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !39
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 819200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 100
  %5 = udiv i32 %linear_index_base, 100
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index_base, 100
  %8 = urem i32 %7, 8192
  %9 = udiv i32 %linear_index_base, 819200
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 100
  %13 = urem i32 %12, 1
  %14 = udiv i32 %linear_index1, 100
  %15 = urem i32 %14, 8192
  %16 = udiv i32 %linear_index1, 819200
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 100
  %19 = udiv i32 %linear_index2, 100
  %20 = urem i32 %19, 1
  %21 = udiv i32 %linear_index2, 100
  %22 = urem i32 %21, 8192
  %23 = udiv i32 %linear_index2, 819200
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 100
  %26 = udiv i32 %linear_index3, 100
  %27 = urem i32 %26, 1
  %28 = udiv i32 %linear_index3, 100
  %29 = urem i32 %28, 8192
  %30 = udiv i32 %linear_index3, 819200
  %31 = icmp ult i32 %linear_index_base, 3276800
  br i1 %31, label %fusion_3.in_bounds-true, label %fusion_3.in_bounds-after

fusion_3.in_bounds-after:                         ; preds = %fusion_3.in_bounds-true, %entry
  ret void

fusion_3.in_bounds-true:                          ; preds = %entry
  %32 = mul nuw nsw i32 %4, 1
  %33 = add nuw nsw i32 0, %32
  %34 = mul nuw nsw i32 %8, 100
  %35 = add nuw nsw i32 %33, %34
  %36 = udiv i32 %35, 819200
  %37 = mul nuw nsw i32 %9, 1
  %38 = add nuw nsw i32 0, %37
  %39 = udiv i32 %38, 4
  %40 = mul nuw nsw i32 %35, 1
  %41 = add nuw nsw i32 0, %40
  %42 = urem i32 %41, 100
  %43 = udiv i32 %41, 100
  %44 = udiv i32 %43, 8192
  %45 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg12, i32 0, i32 %43, i32 %42, i32 0
  %46 = load float, ptr %45, align 4, !invariant.load !22
  %47 = getelementptr inbounds [1 x [4 x float]], ptr %arg11, i32 0, i32 0, i32 %38
  %48 = load float, ptr %47, align 4, !invariant.load !22
  %multiply.18 = fmul float %46, %48
  %49 = mul nuw nsw i32 %35, 1
  %50 = add nuw nsw i32 0, %49
  %51 = urem i32 %50, 100
  %52 = udiv i32 %50, 100
  %53 = udiv i32 %52, 8192
  %54 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %52, i32 %51, i32 0
  %55 = load float, ptr %54, align 4, !invariant.load !22
  %56 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %38
  %57 = load float, ptr %56, align 4, !invariant.load !22
  %multiply.23 = fmul float %55, %57
  %add.24 = fadd float %multiply.18, %multiply.23
  %58 = mul nuw nsw i32 %35, 1
  %59 = add nuw nsw i32 0, %58
  %60 = urem i32 %59, 100
  %61 = udiv i32 %59, 100
  %62 = udiv i32 %61, 8192
  %63 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %61, i32 %60, i32 0
  %64 = load float, ptr %63, align 4, !invariant.load !22
  %65 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %38
  %66 = load float, ptr %65, align 4, !invariant.load !22
  %multiply.29 = fmul float %64, %66
  %add.30 = fadd float %add.24, %multiply.29
  %67 = mul nuw nsw i32 %35, 1
  %68 = add nuw nsw i32 0, %67
  %69 = urem i32 %68, 100
  %70 = udiv i32 %68, 100
  %71 = udiv i32 %70, 8192
  %72 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %70, i32 %69, i32 0
  %73 = load float, ptr %72, align 4, !invariant.load !22
  %74 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %38
  %75 = load float, ptr %74, align 4, !invariant.load !22
  %multiply.35 = fmul float %73, %75
  %add.36 = fadd float %add.30, %multiply.35
  %76 = load float, ptr %arg4, align 4, !invariant.load !22
  %77 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %78 = load float, ptr %77, align 4, !invariant.load !22
  %multiply.39 = fmul float %76, %78
  %add.40 = fadd float %add.36, %multiply.39
  %79 = getelementptr inbounds [4 x float], ptr %arg2, i32 0, i32 %9
  %80 = load float, ptr %79, align 4, !invariant.load !22
  %add.43 = fadd float %add.40, %80
  %81 = udiv i32 %linear_index_base, 100
  %82 = getelementptr inbounds float, ptr %arg1, i32 %81
  %83 = load float, ptr %82, align 4, !invariant.load !22
  %subtract.45 = fsub float %add.43, %83
  %84 = call float @__nv_expf(float %subtract.45)
  %85 = udiv i32 %linear_index_base, 100
  %86 = getelementptr inbounds float, ptr %arg0, i32 %85
  %87 = load float, ptr %86, align 4, !invariant.load !22
  %divide.48 = fdiv float %84, %87
  %88 = getelementptr inbounds float, ptr %arg13, i32 %linear_index_base
  store float %divide.48, ptr %88, align 4
  %89 = mul nuw nsw i32 %11, 1
  %90 = add nuw nsw i32 0, %89
  %91 = mul nuw nsw i32 %15, 100
  %92 = add nuw nsw i32 %90, %91
  %93 = udiv i32 %92, 819200
  %94 = mul nuw nsw i32 %16, 1
  %95 = add nuw nsw i32 0, %94
  %96 = udiv i32 %95, 4
  %97 = mul nuw nsw i32 %92, 1
  %98 = add nuw nsw i32 0, %97
  %99 = urem i32 %98, 100
  %100 = udiv i32 %98, 100
  %101 = udiv i32 %100, 8192
  %102 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg12, i32 0, i32 %100, i32 %99, i32 0
  %103 = load float, ptr %102, align 4, !invariant.load !22
  %104 = getelementptr inbounds [1 x [4 x float]], ptr %arg11, i32 0, i32 0, i32 %95
  %105 = load float, ptr %104, align 4, !invariant.load !22
  %multiply.181 = fmul float %103, %105
  %106 = mul nuw nsw i32 %92, 1
  %107 = add nuw nsw i32 0, %106
  %108 = urem i32 %107, 100
  %109 = udiv i32 %107, 100
  %110 = udiv i32 %109, 8192
  %111 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %109, i32 %108, i32 0
  %112 = load float, ptr %111, align 4, !invariant.load !22
  %113 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %95
  %114 = load float, ptr %113, align 4, !invariant.load !22
  %multiply.232 = fmul float %112, %114
  %add.243 = fadd float %multiply.181, %multiply.232
  %115 = mul nuw nsw i32 %92, 1
  %116 = add nuw nsw i32 0, %115
  %117 = urem i32 %116, 100
  %118 = udiv i32 %116, 100
  %119 = udiv i32 %118, 8192
  %120 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %118, i32 %117, i32 0
  %121 = load float, ptr %120, align 4, !invariant.load !22
  %122 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %95
  %123 = load float, ptr %122, align 4, !invariant.load !22
  %multiply.294 = fmul float %121, %123
  %add.305 = fadd float %add.243, %multiply.294
  %124 = mul nuw nsw i32 %92, 1
  %125 = add nuw nsw i32 0, %124
  %126 = urem i32 %125, 100
  %127 = udiv i32 %125, 100
  %128 = udiv i32 %127, 8192
  %129 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %127, i32 %126, i32 0
  %130 = load float, ptr %129, align 4, !invariant.load !22
  %131 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %95
  %132 = load float, ptr %131, align 4, !invariant.load !22
  %multiply.356 = fmul float %130, %132
  %add.367 = fadd float %add.305, %multiply.356
  %133 = load float, ptr %arg4, align 4, !invariant.load !22
  %134 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %135 = load float, ptr %134, align 4, !invariant.load !22
  %multiply.398 = fmul float %133, %135
  %add.409 = fadd float %add.367, %multiply.398
  %136 = getelementptr inbounds [4 x float], ptr %arg2, i32 0, i32 %16
  %137 = load float, ptr %136, align 4, !invariant.load !22
  %add.4310 = fadd float %add.409, %137
  %138 = udiv i32 %linear_index1, 100
  %139 = getelementptr inbounds float, ptr %arg1, i32 %138
  %140 = load float, ptr %139, align 4, !invariant.load !22
  %subtract.4511 = fsub float %add.4310, %140
  %141 = call float @__nv_expf(float %subtract.4511)
  %142 = udiv i32 %linear_index1, 100
  %143 = getelementptr inbounds float, ptr %arg0, i32 %142
  %144 = load float, ptr %143, align 4, !invariant.load !22
  %divide.4812 = fdiv float %141, %144
  %145 = getelementptr inbounds float, ptr %arg13, i32 %linear_index1
  store float %divide.4812, ptr %145, align 4
  %146 = mul nuw nsw i32 %18, 1
  %147 = add nuw nsw i32 0, %146
  %148 = mul nuw nsw i32 %22, 100
  %149 = add nuw nsw i32 %147, %148
  %150 = udiv i32 %149, 819200
  %151 = mul nuw nsw i32 %23, 1
  %152 = add nuw nsw i32 0, %151
  %153 = udiv i32 %152, 4
  %154 = mul nuw nsw i32 %149, 1
  %155 = add nuw nsw i32 0, %154
  %156 = urem i32 %155, 100
  %157 = udiv i32 %155, 100
  %158 = udiv i32 %157, 8192
  %159 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg12, i32 0, i32 %157, i32 %156, i32 0
  %160 = load float, ptr %159, align 4, !invariant.load !22
  %161 = getelementptr inbounds [1 x [4 x float]], ptr %arg11, i32 0, i32 0, i32 %152
  %162 = load float, ptr %161, align 4, !invariant.load !22
  %multiply.1813 = fmul float %160, %162
  %163 = mul nuw nsw i32 %149, 1
  %164 = add nuw nsw i32 0, %163
  %165 = urem i32 %164, 100
  %166 = udiv i32 %164, 100
  %167 = udiv i32 %166, 8192
  %168 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %166, i32 %165, i32 0
  %169 = load float, ptr %168, align 4, !invariant.load !22
  %170 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %152
  %171 = load float, ptr %170, align 4, !invariant.load !22
  %multiply.2314 = fmul float %169, %171
  %add.2415 = fadd float %multiply.1813, %multiply.2314
  %172 = mul nuw nsw i32 %149, 1
  %173 = add nuw nsw i32 0, %172
  %174 = urem i32 %173, 100
  %175 = udiv i32 %173, 100
  %176 = udiv i32 %175, 8192
  %177 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %175, i32 %174, i32 0
  %178 = load float, ptr %177, align 4, !invariant.load !22
  %179 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %152
  %180 = load float, ptr %179, align 4, !invariant.load !22
  %multiply.2916 = fmul float %178, %180
  %add.3017 = fadd float %add.2415, %multiply.2916
  %181 = mul nuw nsw i32 %149, 1
  %182 = add nuw nsw i32 0, %181
  %183 = urem i32 %182, 100
  %184 = udiv i32 %182, 100
  %185 = udiv i32 %184, 8192
  %186 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %184, i32 %183, i32 0
  %187 = load float, ptr %186, align 4, !invariant.load !22
  %188 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %152
  %189 = load float, ptr %188, align 4, !invariant.load !22
  %multiply.3518 = fmul float %187, %189
  %add.3619 = fadd float %add.3017, %multiply.3518
  %190 = load float, ptr %arg4, align 4, !invariant.load !22
  %191 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %192 = load float, ptr %191, align 4, !invariant.load !22
  %multiply.3920 = fmul float %190, %192
  %add.4021 = fadd float %add.3619, %multiply.3920
  %193 = getelementptr inbounds [4 x float], ptr %arg2, i32 0, i32 %23
  %194 = load float, ptr %193, align 4, !invariant.load !22
  %add.4322 = fadd float %add.4021, %194
  %195 = udiv i32 %linear_index2, 100
  %196 = getelementptr inbounds float, ptr %arg1, i32 %195
  %197 = load float, ptr %196, align 4, !invariant.load !22
  %subtract.4523 = fsub float %add.4322, %197
  %198 = call float @__nv_expf(float %subtract.4523)
  %199 = udiv i32 %linear_index2, 100
  %200 = getelementptr inbounds float, ptr %arg0, i32 %199
  %201 = load float, ptr %200, align 4, !invariant.load !22
  %divide.4824 = fdiv float %198, %201
  %202 = getelementptr inbounds float, ptr %arg13, i32 %linear_index2
  store float %divide.4824, ptr %202, align 4
  %203 = mul nuw nsw i32 %25, 1
  %204 = add nuw nsw i32 0, %203
  %205 = mul nuw nsw i32 %29, 100
  %206 = add nuw nsw i32 %204, %205
  %207 = udiv i32 %206, 819200
  %208 = mul nuw nsw i32 %30, 1
  %209 = add nuw nsw i32 0, %208
  %210 = udiv i32 %209, 4
  %211 = mul nuw nsw i32 %206, 1
  %212 = add nuw nsw i32 0, %211
  %213 = urem i32 %212, 100
  %214 = udiv i32 %212, 100
  %215 = udiv i32 %214, 8192
  %216 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg12, i32 0, i32 %214, i32 %213, i32 0
  %217 = load float, ptr %216, align 4, !invariant.load !22
  %218 = getelementptr inbounds [1 x [4 x float]], ptr %arg11, i32 0, i32 0, i32 %209
  %219 = load float, ptr %218, align 4, !invariant.load !22
  %multiply.1825 = fmul float %217, %219
  %220 = mul nuw nsw i32 %206, 1
  %221 = add nuw nsw i32 0, %220
  %222 = urem i32 %221, 100
  %223 = udiv i32 %221, 100
  %224 = udiv i32 %223, 8192
  %225 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %223, i32 %222, i32 0
  %226 = load float, ptr %225, align 4, !invariant.load !22
  %227 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %209
  %228 = load float, ptr %227, align 4, !invariant.load !22
  %multiply.2326 = fmul float %226, %228
  %add.2427 = fadd float %multiply.1825, %multiply.2326
  %229 = mul nuw nsw i32 %206, 1
  %230 = add nuw nsw i32 0, %229
  %231 = urem i32 %230, 100
  %232 = udiv i32 %230, 100
  %233 = udiv i32 %232, 8192
  %234 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %232, i32 %231, i32 0
  %235 = load float, ptr %234, align 4, !invariant.load !22
  %236 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %209
  %237 = load float, ptr %236, align 4, !invariant.load !22
  %multiply.2928 = fmul float %235, %237
  %add.3029 = fadd float %add.2427, %multiply.2928
  %238 = mul nuw nsw i32 %206, 1
  %239 = add nuw nsw i32 0, %238
  %240 = urem i32 %239, 100
  %241 = udiv i32 %239, 100
  %242 = udiv i32 %241, 8192
  %243 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %241, i32 %240, i32 0
  %244 = load float, ptr %243, align 4, !invariant.load !22
  %245 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %209
  %246 = load float, ptr %245, align 4, !invariant.load !22
  %multiply.3530 = fmul float %244, %246
  %add.3631 = fadd float %add.3029, %multiply.3530
  %247 = load float, ptr %arg4, align 4, !invariant.load !22
  %248 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %249 = load float, ptr %248, align 4, !invariant.load !22
  %multiply.3932 = fmul float %247, %249
  %add.4033 = fadd float %add.3631, %multiply.3932
  %250 = getelementptr inbounds [4 x float], ptr %arg2, i32 0, i32 %30
  %251 = load float, ptr %250, align 4, !invariant.load !22
  %add.4334 = fadd float %add.4033, %251
  %252 = udiv i32 %linear_index3, 100
  %253 = getelementptr inbounds float, ptr %arg1, i32 %252
  %254 = load float, ptr %253, align 4, !invariant.load !22
  %subtract.4535 = fsub float %add.4334, %254
  %255 = call float @__nv_expf(float %subtract.4535)
  %256 = udiv i32 %linear_index3, 100
  %257 = getelementptr inbounds float, ptr %arg0, i32 %256
  %258 = load float, ptr %257, align 4, !invariant.load !22
  %divide.4836 = fdiv float %255, %258
  %259 = getelementptr inbounds float, ptr %arg13, i32 %linear_index3
  store float %divide.4836, ptr %259, align 4
  br label %fusion_3.in_bounds-after
}

define void @fusion_2(ptr noalias align 16 dereferenceable(209715200) %arg0, ptr noalias align 16 dereferenceable(209715200) %arg1, ptr noalias align 16 dereferenceable(26214400) %arg2, ptr noalias align 16 dereferenceable(26214400) %arg3, ptr noalias align 16 dereferenceable(26214400) %arg4, ptr noalias align 128 dereferenceable(498073600) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 31129600
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 152
  %5 = udiv i32 %linear_index_base, 152
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 152
  %8 = udiv i32 %linear_index1, 152
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 152
  %11 = udiv i32 %linear_index2, 152
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 152
  %14 = udiv i32 %linear_index3, 152
  %15 = icmp ult i32 %linear_index_base, 124518400
  br i1 %15, label %fusion_2.in_bounds-true, label %fusion_2.in_bounds-after

fusion_2.in_bounds-after:                         ; preds = %concatenate.6.merge35, %entry
  ret void

fusion_2.in_bounds-true:                          ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 152
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 100
  %22 = udiv i32 %20, 100
  %23 = udiv i32 %22, 8192
  br label %concatenate.pivot.128.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %17, %24
  %26 = udiv i32 %linear_index_base, 152
  %27 = mul i32 %26, 64
  %28 = add i32 %27, %25
  %29 = udiv i32 %28, 1
  %30 = urem i32 %29, 64
  %31 = udiv i32 %28, 64
  %32 = urem i32 %31, 100
  %33 = udiv i32 %28, 6400
  %34 = getelementptr inbounds float, ptr %arg0, i32 %28
  %35 = load float, ptr %34, align 4, !invariant.load !22
  br label %concatenate.6.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.1
  %36 = phi i32 [ 64, %concatenate.pivot.64.1 ]
  %37 = sub nsw i32 %17, %36
  %38 = udiv i32 %linear_index_base, 152
  %39 = mul i32 %38, 64
  %40 = add i32 %39, %37
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 64
  %43 = udiv i32 %40, 64
  %44 = urem i32 %43, 100
  %45 = udiv i32 %40, 6400
  %46 = getelementptr inbounds float, ptr %arg1, i32 %40
  %47 = load float, ptr %46, align 4, !invariant.load !22
  br label %concatenate.6.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.128.2
  %48 = phi i32 [ 128, %concatenate.pivot.128.2 ]
  %49 = sub nsw i32 %17, %48
  %50 = udiv i32 %linear_index_base, 152
  %51 = mul i32 %50, 8
  %52 = add i32 %51, %49
  %53 = udiv i32 %52, 1
  %54 = urem i32 %53, 8
  %55 = udiv i32 %52, 8
  %56 = urem i32 %55, 100
  %57 = udiv i32 %52, 800
  %58 = getelementptr inbounds float, ptr %arg2, i32 %52
  %59 = load float, ptr %58, align 4, !invariant.load !22
  br label %concatenate.6.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.136.3
  %60 = phi i32 [ 136, %concatenate.pivot.136.3 ]
  %61 = sub nsw i32 %17, %60
  %62 = udiv i32 %linear_index_base, 152
  %63 = mul i32 %62, 8
  %64 = add i32 %63, %61
  %65 = udiv i32 %64, 1
  %66 = urem i32 %65, 8
  %67 = udiv i32 %64, 8
  %68 = urem i32 %67, 100
  %69 = udiv i32 %64, 800
  %70 = getelementptr inbounds float, ptr %arg3, i32 %64
  %71 = load float, ptr %70, align 4, !invariant.load !22
  br label %concatenate.6.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.144.4
  %72 = phi i32 [ 144, %concatenate.pivot.144.4 ]
  %73 = sub nsw i32 %17, %72
  %74 = udiv i32 %linear_index_base, 152
  %75 = mul i32 %74, 8
  %76 = add i32 %75, %73
  %77 = udiv i32 %76, 1
  %78 = urem i32 %77, 8
  %79 = udiv i32 %76, 8
  %80 = urem i32 %79, 100
  %81 = udiv i32 %76, 800
  %82 = getelementptr inbounds float, ptr %arg4, i32 %76
  %83 = load float, ptr %82, align 4, !invariant.load !22
  br label %concatenate.6.merge

concatenate.pivot.128.:                           ; preds = %fusion_2.in_bounds-true
  %84 = icmp ult i32 %17, 128
  br i1 %84, label %concatenate.pivot.64., label %concatenate.pivot.136.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.128.
  %85 = icmp ult i32 %17, 64
  br i1 %85, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.pivot.136.:                           ; preds = %concatenate.pivot.128.
  %86 = icmp ult i32 %17, 136
  br i1 %86, label %concatenate.pivot.128.2, label %concatenate.pivot.144.

concatenate.pivot.128.2:                          ; preds = %concatenate.pivot.136.
  br label %concat_index_from_operand_id2

concatenate.pivot.144.:                           ; preds = %concatenate.pivot.136.
  %87 = icmp ult i32 %17, 144
  br i1 %87, label %concatenate.pivot.136.3, label %concatenate.pivot.144.4

concatenate.pivot.136.3:                          ; preds = %concatenate.pivot.144.
  br label %concat_index_from_operand_id3

concatenate.pivot.144.4:                          ; preds = %concatenate.pivot.144.
  br label %concat_index_from_operand_id4

concatenate.6.merge:                              ; preds = %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %88 = phi float [ %35, %concat_index_from_operand_id0 ], [ %47, %concat_index_from_operand_id1 ], [ %59, %concat_index_from_operand_id2 ], [ %71, %concat_index_from_operand_id3 ], [ %83, %concat_index_from_operand_id4 ]
  %89 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %88, ptr %89, align 4
  %90 = mul nuw nsw i32 %7, 1
  %91 = add nuw nsw i32 0, %90
  %92 = udiv i32 %91, 152
  %93 = mul nuw nsw i32 %8, 1
  %94 = add nuw nsw i32 0, %93
  %95 = urem i32 %94, 100
  %96 = udiv i32 %94, 100
  %97 = udiv i32 %96, 8192
  br label %concatenate.pivot.128.11

concat_index_from_operand_id06:                   ; preds = %concatenate.pivot.0.13
  %98 = phi i32 [ 0, %concatenate.pivot.0.13 ]
  %99 = sub nsw i32 %91, %98
  %100 = udiv i32 %linear_index1, 152
  %101 = mul i32 %100, 64
  %102 = add i32 %101, %99
  %103 = udiv i32 %102, 1
  %104 = urem i32 %103, 64
  %105 = udiv i32 %102, 64
  %106 = urem i32 %105, 100
  %107 = udiv i32 %102, 6400
  %108 = getelementptr inbounds float, ptr %arg0, i32 %102
  %109 = load float, ptr %108, align 4, !invariant.load !22
  br label %concatenate.6.merge5

concat_index_from_operand_id17:                   ; preds = %concatenate.pivot.64.14
  %110 = phi i32 [ 64, %concatenate.pivot.64.14 ]
  %111 = sub nsw i32 %91, %110
  %112 = udiv i32 %linear_index1, 152
  %113 = mul i32 %112, 64
  %114 = add i32 %113, %111
  %115 = udiv i32 %114, 1
  %116 = urem i32 %115, 64
  %117 = udiv i32 %114, 64
  %118 = urem i32 %117, 100
  %119 = udiv i32 %114, 6400
  %120 = getelementptr inbounds float, ptr %arg1, i32 %114
  %121 = load float, ptr %120, align 4, !invariant.load !22
  br label %concatenate.6.merge5

concat_index_from_operand_id28:                   ; preds = %concatenate.pivot.128.16
  %122 = phi i32 [ 128, %concatenate.pivot.128.16 ]
  %123 = sub nsw i32 %91, %122
  %124 = udiv i32 %linear_index1, 152
  %125 = mul i32 %124, 8
  %126 = add i32 %125, %123
  %127 = udiv i32 %126, 1
  %128 = urem i32 %127, 8
  %129 = udiv i32 %126, 8
  %130 = urem i32 %129, 100
  %131 = udiv i32 %126, 800
  %132 = getelementptr inbounds float, ptr %arg2, i32 %126
  %133 = load float, ptr %132, align 4, !invariant.load !22
  br label %concatenate.6.merge5

concat_index_from_operand_id39:                   ; preds = %concatenate.pivot.136.18
  %134 = phi i32 [ 136, %concatenate.pivot.136.18 ]
  %135 = sub nsw i32 %91, %134
  %136 = udiv i32 %linear_index1, 152
  %137 = mul i32 %136, 8
  %138 = add i32 %137, %135
  %139 = udiv i32 %138, 1
  %140 = urem i32 %139, 8
  %141 = udiv i32 %138, 8
  %142 = urem i32 %141, 100
  %143 = udiv i32 %138, 800
  %144 = getelementptr inbounds float, ptr %arg3, i32 %138
  %145 = load float, ptr %144, align 4, !invariant.load !22
  br label %concatenate.6.merge5

concat_index_from_operand_id410:                  ; preds = %concatenate.pivot.144.19
  %146 = phi i32 [ 144, %concatenate.pivot.144.19 ]
  %147 = sub nsw i32 %91, %146
  %148 = udiv i32 %linear_index1, 152
  %149 = mul i32 %148, 8
  %150 = add i32 %149, %147
  %151 = udiv i32 %150, 1
  %152 = urem i32 %151, 8
  %153 = udiv i32 %150, 8
  %154 = urem i32 %153, 100
  %155 = udiv i32 %150, 800
  %156 = getelementptr inbounds float, ptr %arg4, i32 %150
  %157 = load float, ptr %156, align 4, !invariant.load !22
  br label %concatenate.6.merge5

concatenate.pivot.128.11:                         ; preds = %concatenate.6.merge
  %158 = icmp ult i32 %91, 128
  br i1 %158, label %concatenate.pivot.64.12, label %concatenate.pivot.136.15

concatenate.pivot.64.12:                          ; preds = %concatenate.pivot.128.11
  %159 = icmp ult i32 %91, 64
  br i1 %159, label %concatenate.pivot.0.13, label %concatenate.pivot.64.14

concatenate.pivot.0.13:                           ; preds = %concatenate.pivot.64.12
  br label %concat_index_from_operand_id06

concatenate.pivot.64.14:                          ; preds = %concatenate.pivot.64.12
  br label %concat_index_from_operand_id17

concatenate.pivot.136.15:                         ; preds = %concatenate.pivot.128.11
  %160 = icmp ult i32 %91, 136
  br i1 %160, label %concatenate.pivot.128.16, label %concatenate.pivot.144.17

concatenate.pivot.128.16:                         ; preds = %concatenate.pivot.136.15
  br label %concat_index_from_operand_id28

concatenate.pivot.144.17:                         ; preds = %concatenate.pivot.136.15
  %161 = icmp ult i32 %91, 144
  br i1 %161, label %concatenate.pivot.136.18, label %concatenate.pivot.144.19

concatenate.pivot.136.18:                         ; preds = %concatenate.pivot.144.17
  br label %concat_index_from_operand_id39

concatenate.pivot.144.19:                         ; preds = %concatenate.pivot.144.17
  br label %concat_index_from_operand_id410

concatenate.6.merge5:                             ; preds = %concat_index_from_operand_id410, %concat_index_from_operand_id39, %concat_index_from_operand_id28, %concat_index_from_operand_id17, %concat_index_from_operand_id06
  %162 = phi float [ %109, %concat_index_from_operand_id06 ], [ %121, %concat_index_from_operand_id17 ], [ %133, %concat_index_from_operand_id28 ], [ %145, %concat_index_from_operand_id39 ], [ %157, %concat_index_from_operand_id410 ]
  %163 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %162, ptr %163, align 4
  %164 = mul nuw nsw i32 %10, 1
  %165 = add nuw nsw i32 0, %164
  %166 = udiv i32 %165, 152
  %167 = mul nuw nsw i32 %11, 1
  %168 = add nuw nsw i32 0, %167
  %169 = urem i32 %168, 100
  %170 = udiv i32 %168, 100
  %171 = udiv i32 %170, 8192
  br label %concatenate.pivot.128.26

concat_index_from_operand_id021:                  ; preds = %concatenate.pivot.0.28
  %172 = phi i32 [ 0, %concatenate.pivot.0.28 ]
  %173 = sub nsw i32 %165, %172
  %174 = udiv i32 %linear_index2, 152
  %175 = mul i32 %174, 64
  %176 = add i32 %175, %173
  %177 = udiv i32 %176, 1
  %178 = urem i32 %177, 64
  %179 = udiv i32 %176, 64
  %180 = urem i32 %179, 100
  %181 = udiv i32 %176, 6400
  %182 = getelementptr inbounds float, ptr %arg0, i32 %176
  %183 = load float, ptr %182, align 4, !invariant.load !22
  br label %concatenate.6.merge20

concat_index_from_operand_id122:                  ; preds = %concatenate.pivot.64.29
  %184 = phi i32 [ 64, %concatenate.pivot.64.29 ]
  %185 = sub nsw i32 %165, %184
  %186 = udiv i32 %linear_index2, 152
  %187 = mul i32 %186, 64
  %188 = add i32 %187, %185
  %189 = udiv i32 %188, 1
  %190 = urem i32 %189, 64
  %191 = udiv i32 %188, 64
  %192 = urem i32 %191, 100
  %193 = udiv i32 %188, 6400
  %194 = getelementptr inbounds float, ptr %arg1, i32 %188
  %195 = load float, ptr %194, align 4, !invariant.load !22
  br label %concatenate.6.merge20

concat_index_from_operand_id223:                  ; preds = %concatenate.pivot.128.31
  %196 = phi i32 [ 128, %concatenate.pivot.128.31 ]
  %197 = sub nsw i32 %165, %196
  %198 = udiv i32 %linear_index2, 152
  %199 = mul i32 %198, 8
  %200 = add i32 %199, %197
  %201 = udiv i32 %200, 1
  %202 = urem i32 %201, 8
  %203 = udiv i32 %200, 8
  %204 = urem i32 %203, 100
  %205 = udiv i32 %200, 800
  %206 = getelementptr inbounds float, ptr %arg2, i32 %200
  %207 = load float, ptr %206, align 4, !invariant.load !22
  br label %concatenate.6.merge20

concat_index_from_operand_id324:                  ; preds = %concatenate.pivot.136.33
  %208 = phi i32 [ 136, %concatenate.pivot.136.33 ]
  %209 = sub nsw i32 %165, %208
  %210 = udiv i32 %linear_index2, 152
  %211 = mul i32 %210, 8
  %212 = add i32 %211, %209
  %213 = udiv i32 %212, 1
  %214 = urem i32 %213, 8
  %215 = udiv i32 %212, 8
  %216 = urem i32 %215, 100
  %217 = udiv i32 %212, 800
  %218 = getelementptr inbounds float, ptr %arg3, i32 %212
  %219 = load float, ptr %218, align 4, !invariant.load !22
  br label %concatenate.6.merge20

concat_index_from_operand_id425:                  ; preds = %concatenate.pivot.144.34
  %220 = phi i32 [ 144, %concatenate.pivot.144.34 ]
  %221 = sub nsw i32 %165, %220
  %222 = udiv i32 %linear_index2, 152
  %223 = mul i32 %222, 8
  %224 = add i32 %223, %221
  %225 = udiv i32 %224, 1
  %226 = urem i32 %225, 8
  %227 = udiv i32 %224, 8
  %228 = urem i32 %227, 100
  %229 = udiv i32 %224, 800
  %230 = getelementptr inbounds float, ptr %arg4, i32 %224
  %231 = load float, ptr %230, align 4, !invariant.load !22
  br label %concatenate.6.merge20

concatenate.pivot.128.26:                         ; preds = %concatenate.6.merge5
  %232 = icmp ult i32 %165, 128
  br i1 %232, label %concatenate.pivot.64.27, label %concatenate.pivot.136.30

concatenate.pivot.64.27:                          ; preds = %concatenate.pivot.128.26
  %233 = icmp ult i32 %165, 64
  br i1 %233, label %concatenate.pivot.0.28, label %concatenate.pivot.64.29

concatenate.pivot.0.28:                           ; preds = %concatenate.pivot.64.27
  br label %concat_index_from_operand_id021

concatenate.pivot.64.29:                          ; preds = %concatenate.pivot.64.27
  br label %concat_index_from_operand_id122

concatenate.pivot.136.30:                         ; preds = %concatenate.pivot.128.26
  %234 = icmp ult i32 %165, 136
  br i1 %234, label %concatenate.pivot.128.31, label %concatenate.pivot.144.32

concatenate.pivot.128.31:                         ; preds = %concatenate.pivot.136.30
  br label %concat_index_from_operand_id223

concatenate.pivot.144.32:                         ; preds = %concatenate.pivot.136.30
  %235 = icmp ult i32 %165, 144
  br i1 %235, label %concatenate.pivot.136.33, label %concatenate.pivot.144.34

concatenate.pivot.136.33:                         ; preds = %concatenate.pivot.144.32
  br label %concat_index_from_operand_id324

concatenate.pivot.144.34:                         ; preds = %concatenate.pivot.144.32
  br label %concat_index_from_operand_id425

concatenate.6.merge20:                            ; preds = %concat_index_from_operand_id425, %concat_index_from_operand_id324, %concat_index_from_operand_id223, %concat_index_from_operand_id122, %concat_index_from_operand_id021
  %236 = phi float [ %183, %concat_index_from_operand_id021 ], [ %195, %concat_index_from_operand_id122 ], [ %207, %concat_index_from_operand_id223 ], [ %219, %concat_index_from_operand_id324 ], [ %231, %concat_index_from_operand_id425 ]
  %237 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %236, ptr %237, align 4
  %238 = mul nuw nsw i32 %13, 1
  %239 = add nuw nsw i32 0, %238
  %240 = udiv i32 %239, 152
  %241 = mul nuw nsw i32 %14, 1
  %242 = add nuw nsw i32 0, %241
  %243 = urem i32 %242, 100
  %244 = udiv i32 %242, 100
  %245 = udiv i32 %244, 8192
  br label %concatenate.pivot.128.41

concat_index_from_operand_id036:                  ; preds = %concatenate.pivot.0.43
  %246 = phi i32 [ 0, %concatenate.pivot.0.43 ]
  %247 = sub nsw i32 %239, %246
  %248 = udiv i32 %linear_index3, 152
  %249 = mul i32 %248, 64
  %250 = add i32 %249, %247
  %251 = udiv i32 %250, 1
  %252 = urem i32 %251, 64
  %253 = udiv i32 %250, 64
  %254 = urem i32 %253, 100
  %255 = udiv i32 %250, 6400
  %256 = getelementptr inbounds float, ptr %arg0, i32 %250
  %257 = load float, ptr %256, align 4, !invariant.load !22
  br label %concatenate.6.merge35

concat_index_from_operand_id137:                  ; preds = %concatenate.pivot.64.44
  %258 = phi i32 [ 64, %concatenate.pivot.64.44 ]
  %259 = sub nsw i32 %239, %258
  %260 = udiv i32 %linear_index3, 152
  %261 = mul i32 %260, 64
  %262 = add i32 %261, %259
  %263 = udiv i32 %262, 1
  %264 = urem i32 %263, 64
  %265 = udiv i32 %262, 64
  %266 = urem i32 %265, 100
  %267 = udiv i32 %262, 6400
  %268 = getelementptr inbounds float, ptr %arg1, i32 %262
  %269 = load float, ptr %268, align 4, !invariant.load !22
  br label %concatenate.6.merge35

concat_index_from_operand_id238:                  ; preds = %concatenate.pivot.128.46
  %270 = phi i32 [ 128, %concatenate.pivot.128.46 ]
  %271 = sub nsw i32 %239, %270
  %272 = udiv i32 %linear_index3, 152
  %273 = mul i32 %272, 8
  %274 = add i32 %273, %271
  %275 = udiv i32 %274, 1
  %276 = urem i32 %275, 8
  %277 = udiv i32 %274, 8
  %278 = urem i32 %277, 100
  %279 = udiv i32 %274, 800
  %280 = getelementptr inbounds float, ptr %arg2, i32 %274
  %281 = load float, ptr %280, align 4, !invariant.load !22
  br label %concatenate.6.merge35

concat_index_from_operand_id339:                  ; preds = %concatenate.pivot.136.48
  %282 = phi i32 [ 136, %concatenate.pivot.136.48 ]
  %283 = sub nsw i32 %239, %282
  %284 = udiv i32 %linear_index3, 152
  %285 = mul i32 %284, 8
  %286 = add i32 %285, %283
  %287 = udiv i32 %286, 1
  %288 = urem i32 %287, 8
  %289 = udiv i32 %286, 8
  %290 = urem i32 %289, 100
  %291 = udiv i32 %286, 800
  %292 = getelementptr inbounds float, ptr %arg3, i32 %286
  %293 = load float, ptr %292, align 4, !invariant.load !22
  br label %concatenate.6.merge35

concat_index_from_operand_id440:                  ; preds = %concatenate.pivot.144.49
  %294 = phi i32 [ 144, %concatenate.pivot.144.49 ]
  %295 = sub nsw i32 %239, %294
  %296 = udiv i32 %linear_index3, 152
  %297 = mul i32 %296, 8
  %298 = add i32 %297, %295
  %299 = udiv i32 %298, 1
  %300 = urem i32 %299, 8
  %301 = udiv i32 %298, 8
  %302 = urem i32 %301, 100
  %303 = udiv i32 %298, 800
  %304 = getelementptr inbounds float, ptr %arg4, i32 %298
  %305 = load float, ptr %304, align 4, !invariant.load !22
  br label %concatenate.6.merge35

concatenate.pivot.128.41:                         ; preds = %concatenate.6.merge20
  %306 = icmp ult i32 %239, 128
  br i1 %306, label %concatenate.pivot.64.42, label %concatenate.pivot.136.45

concatenate.pivot.64.42:                          ; preds = %concatenate.pivot.128.41
  %307 = icmp ult i32 %239, 64
  br i1 %307, label %concatenate.pivot.0.43, label %concatenate.pivot.64.44

concatenate.pivot.0.43:                           ; preds = %concatenate.pivot.64.42
  br label %concat_index_from_operand_id036

concatenate.pivot.64.44:                          ; preds = %concatenate.pivot.64.42
  br label %concat_index_from_operand_id137

concatenate.pivot.136.45:                         ; preds = %concatenate.pivot.128.41
  %308 = icmp ult i32 %239, 136
  br i1 %308, label %concatenate.pivot.128.46, label %concatenate.pivot.144.47

concatenate.pivot.128.46:                         ; preds = %concatenate.pivot.136.45
  br label %concat_index_from_operand_id238

concatenate.pivot.144.47:                         ; preds = %concatenate.pivot.136.45
  %309 = icmp ult i32 %239, 144
  br i1 %309, label %concatenate.pivot.136.48, label %concatenate.pivot.144.49

concatenate.pivot.136.48:                         ; preds = %concatenate.pivot.144.47
  br label %concat_index_from_operand_id339

concatenate.pivot.144.49:                         ; preds = %concatenate.pivot.144.47
  br label %concat_index_from_operand_id440

concatenate.6.merge35:                            ; preds = %concat_index_from_operand_id440, %concat_index_from_operand_id339, %concat_index_from_operand_id238, %concat_index_from_operand_id137, %concat_index_from_operand_id036
  %310 = phi float [ %257, %concat_index_from_operand_id036 ], [ %269, %concat_index_from_operand_id137 ], [ %281, %concat_index_from_operand_id238 ], [ %293, %concat_index_from_operand_id339 ], [ %305, %concat_index_from_operand_id440 ]
  %311 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %310, ptr %311, align 4
  br label %fusion_2.in_bounds-after
}

define void @add_44(ptr noalias align 128 dereferenceable(838860800) %arg0, ptr noalias align 128 dereferenceable(838860800) %arg1, ptr noalias align 128 dereferenceable(838860800) %arg2) {
entry:
  %loop.invar_address = alloca i32, align 4
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %add_44.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %0 = icmp uge i32 %loop.indvar, 209715200
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 442368
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !41
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !42
  %4 = mul nuw nsw i32 %2, 128
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 110592
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %5 = udiv i32 %linear_index_plus_base, 1
  %6 = urem i32 %5, 256
  %7 = udiv i32 %linear_index_plus_base, 256
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 256
  %10 = udiv i32 %linear_index1, 256
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %11 = udiv i32 %linear_index2, 1
  %12 = urem i32 %11, 256
  %13 = udiv i32 %linear_index2, 256
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = urem i32 %14, 256
  %16 = udiv i32 %linear_index3, 256
  %17 = icmp ult i32 %linear_index_plus_base, 209715200
  br i1 %17, label %add_44.in_bounds-true, label %add_44.in_bounds-after

add_44.in_bounds-after:                           ; preds = %add_44.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !43

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

add_44.in_bounds-true:                            ; preds = %loop.loop_body
  %18 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  %19 = load float, ptr %18, align 4, !invariant.load !22
  %20 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_plus_base
  %21 = load float, ptr %20, align 4, !invariant.load !22
  %add.3 = fadd float %19, %21
  %22 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_plus_base
  store float %add.3, ptr %22, align 4
  %23 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %24 = load float, ptr %23, align 4, !invariant.load !22
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %26 = load float, ptr %25, align 4, !invariant.load !22
  %add.31 = fadd float %24, %26
  %27 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %add.31, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %29 = load float, ptr %28, align 4, !invariant.load !22
  %30 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %31 = load float, ptr %30, align 4, !invariant.load !22
  %add.32 = fadd float %29, %31
  %32 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %add.32, ptr %32, align 4
  %33 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %34 = load float, ptr %33, align 4, !invariant.load !22
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %36 = load float, ptr %35, align 4, !invariant.load !22
  %add.33 = fadd float %34, %36
  %37 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %add.33, ptr %37, align 4
  br label %add_44.in_bounds-after
}

define void @fusion(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(838860800) %arg1, ptr noalias align 128 dereferenceable(8388608) %arg2, ptr noalias align 128 dereferenceable(838860800) %arg3) {
entry:
  %return_buffer72 = alloca float, align 4
  %result_from_other_lane70 = alloca float, align 4
  %return_buffer69 = alloca float, align 4
  %result_from_other_lane67 = alloca float, align 4
  %return_buffer66 = alloca float, align 4
  %result_from_other_lane64 = alloca float, align 4
  %return_buffer63 = alloca float, align 4
  %result_from_other_lane61 = alloca float, align 4
  %return_buffer60 = alloca float, align 4
  %result_from_other_lane58 = alloca float, align 4
  %return_buffer54 = alloca float, align 4
  %result_from_other_lane52 = alloca float, align 4
  %return_buffer51 = alloca float, align 4
  %result_from_other_lane49 = alloca float, align 4
  %return_buffer48 = alloca float, align 4
  %result_from_other_lane46 = alloca float, align 4
  %return_buffer45 = alloca float, align 4
  %result_from_other_lane43 = alloca float, align 4
  %return_buffer42 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer40 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !24
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after74, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_23_constant_16 = load float, ptr @3, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_23_constant_16, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_23_constant_16, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !44
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !45
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 32768
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 1
  %14 = udiv i32 %9, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 1
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 100, i32 4096
  %18 = icmp eq i32 %13, 0
  %tile_bound1 = select i1 %18, i32 64, i32 64
  %tile_origin.0 = mul i32 %16, 1
  %tile_origin.1 = mul i32 %15, 4096
  %tile_origin.2 = mul i32 %13, 64
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %11
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %19 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %19, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %20 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %21 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after16, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %22 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %22, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %23 = icmp eq i32 %tile_loop.indvar, 0
  %24 = mul i32 %tile_loop.indvar, 2
  %25 = add i32 %24, 0
  %x_loc = add i32 %25, %21
  %26 = add i32 %tile_origin.1, %y_in_tile.indvar
  %27 = add i32 %tile_origin.2, %x_loc
  %28 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %28, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %concatenate.14.merge, %tile_loop.loop_body
  %29 = mul i32 %tile_loop.indvar, 2
  %30 = add i32 %29, 1
  %x_loc14 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc14
  %33 = icmp ult i32 %x_loc14, %tile_bound1
  br i1 %33, label %x_in_tile-true15, label %x_in_tile-after16

x_in_tile-after16:                                ; preds = %concatenate.14.merge19, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !46

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !47

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result41 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result41, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_17__1(ptr %36, ptr %result_from_other_lane, ptr %return_buffer42)
  %38 = load float, ptr %return_buffer42, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result44 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result44, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane43, align 4
  call void @region_1_17__1(ptr %36, ptr %result_from_other_lane43, ptr %return_buffer45)
  %40 = load float, ptr %return_buffer45, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result47 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result47, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane46, align 4
  call void @region_1_17__1(ptr %36, ptr %result_from_other_lane46, ptr %return_buffer48)
  %42 = load float, ptr %return_buffer48, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result50 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result50, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane49, align 4
  call void @region_1_17__1(ptr %36, ptr %result_from_other_lane49, ptr %return_buffer51)
  %44 = load float, ptr %return_buffer51, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result53 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result53, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane52, align 4
  call void @region_1_17__1(ptr %36, ptr %result_from_other_lane52, ptr %return_buffer54)
  %46 = load float, ptr %return_buffer54, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address55 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address55 to ptr
  %current_output56 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output56, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr57 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr57 to ptr
  %partial_reduction_result59 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result59, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane58, align 4
  call void @region_1_17__1(ptr %55, ptr %result_from_other_lane58, ptr %return_buffer60)
  %57 = load float, ptr %return_buffer60, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result62 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result62, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane61, align 4
  call void @region_1_17__1(ptr %55, ptr %result_from_other_lane61, ptr %return_buffer63)
  %59 = load float, ptr %return_buffer63, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result65 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result65, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane64, align 4
  call void @region_1_17__1(ptr %55, ptr %result_from_other_lane64, ptr %return_buffer66)
  %61 = load float, ptr %return_buffer66, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result68 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result68, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane67, align 4
  call void @region_1_17__1(ptr %55, ptr %result_from_other_lane67, ptr %return_buffer69)
  %63 = load float, ptr %return_buffer69, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result71 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result71, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane70, align 4
  call void @region_1_17__1(ptr %55, ptr %result_from_other_lane70, ptr %return_buffer72)
  %65 = load float, ptr %return_buffer72, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true73, label %reduction_write_output-after74

reduction_write_output-after74:                   ; preds = %reduction_write_output-true73, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul nuw nsw i32 %27, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %26, 64
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 6400
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 64
  %80 = udiv i32 %77, 64
  %81 = urem i32 %80, 100
  %82 = udiv i32 %77, 6400
  %83 = urem i32 %82, 8192
  %84 = udiv i32 %77, 52428800
  %85 = mul i32 %thread_id.x, 2
  %86 = sub i32 %x_loc, %85
  %Arg_0.1 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg0, i32 0, i32 %84, i32 %83, i32 0, i32 %81
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !22
  br label %concatenate.pivot.2.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %87 = phi i32 [ 0, %concatenate.pivot.0. ]
  %88 = sub nsw i32 %84, %87
  %89 = add i32 %83, 0
  %90 = add i32 %81, 0
  %91 = add i32 %79, 0
  %92 = mul nuw nsw i32 %91, 1
  %93 = add nuw nsw i32 0, %92
  %94 = udiv i32 %93, 256
  %95 = mul nuw nsw i32 %90, 1
  %96 = add nuw nsw i32 0, %95
  %97 = mul nuw nsw i32 %89, 100
  %98 = add nuw nsw i32 %96, %97
  %99 = udiv i32 %98, 819200
  %Arg_1.2 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %98, i32 %93
  %Arg_1.24 = load float, ptr %Arg_1.2, align 4, !invariant.load !22
  br label %concatenate.14.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.11
  %100 = phi i32 [ 1, %concatenate.pivot.1.11 ]
  %101 = sub nsw i32 %84, %100
  %102 = add i32 %83, 0
  %103 = add i32 %81, 0
  %104 = add i32 %79, 64
  %105 = mul nuw nsw i32 %104, 1
  %106 = add nuw nsw i32 0, %105
  %107 = udiv i32 %106, 256
  %108 = mul nuw nsw i32 %103, 1
  %109 = add nuw nsw i32 0, %108
  %110 = mul nuw nsw i32 %102, 100
  %111 = add nuw nsw i32 %109, %110
  %112 = udiv i32 %111, 819200
  %Arg_1.25 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %111, i32 %106
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !22
  br label %concatenate.14.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.2.12
  %113 = phi i32 [ 2, %concatenate.pivot.2.12 ]
  %114 = sub nsw i32 %84, %113
  %115 = add i32 %83, 0
  %116 = add i32 %81, 0
  %117 = add i32 %79, 128
  %118 = mul nuw nsw i32 %117, 1
  %119 = add nuw nsw i32 0, %118
  %120 = udiv i32 %119, 256
  %121 = mul nuw nsw i32 %116, 1
  %122 = add nuw nsw i32 0, %121
  %123 = mul nuw nsw i32 %115, 100
  %124 = add nuw nsw i32 %122, %123
  %125 = udiv i32 %124, 819200
  %Arg_1.27 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %124, i32 %119
  %Arg_1.28 = load float, ptr %Arg_1.27, align 4, !invariant.load !22
  br label %concatenate.14.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.3.13
  %126 = phi i32 [ 3, %concatenate.pivot.3.13 ]
  %127 = sub nsw i32 %84, %126
  %128 = add i32 %83, 0
  %129 = add i32 %81, 0
  %130 = add i32 %79, 192
  %131 = mul nuw nsw i32 %130, 1
  %132 = add nuw nsw i32 0, %131
  %133 = udiv i32 %132, 256
  %134 = mul nuw nsw i32 %129, 1
  %135 = add nuw nsw i32 0, %134
  %136 = mul nuw nsw i32 %128, 100
  %137 = add nuw nsw i32 %135, %136
  %138 = udiv i32 %137, 819200
  %Arg_1.29 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %137, i32 %132
  %Arg_1.210 = load float, ptr %Arg_1.29, align 4, !invariant.load !22
  br label %concatenate.14.merge

concatenate.pivot.2.:                             ; preds = %x_in_tile-true
  %139 = icmp ult i32 %84, 2
  br i1 %139, label %concatenate.pivot.1., label %concatenate.pivot.3.

concatenate.pivot.1.:                             ; preds = %concatenate.pivot.2.
  %140 = icmp ult i32 %84, 1
  br i1 %140, label %concatenate.pivot.0., label %concatenate.pivot.1.11

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.11:                           ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.pivot.3.:                             ; preds = %concatenate.pivot.2.
  %141 = icmp ult i32 %84, 3
  br i1 %141, label %concatenate.pivot.2.12, label %concatenate.pivot.3.13

concatenate.pivot.2.12:                           ; preds = %concatenate.pivot.3.
  br label %concat_index_from_operand_id2

concatenate.pivot.3.13:                           ; preds = %concatenate.pivot.3.
  br label %concat_index_from_operand_id3

concatenate.14.merge:                             ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %142 = phi float [ %Arg_1.24, %concat_index_from_operand_id0 ], [ %Arg_1.26, %concat_index_from_operand_id1 ], [ %Arg_1.28, %concat_index_from_operand_id2 ], [ %Arg_1.210, %concat_index_from_operand_id3 ]
  %multiply.15 = fmul float %Arg_0.13, %142
  store float %multiply.15, ptr %reduction_input_address, align 4
  %143 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %86
  call void @region_1_17__1(ptr %143, ptr %reduction_input_address, ptr %return_buffer)
  %144 = load float, ptr %return_buffer, align 4
  store float %144, ptr %143, align 4
  %145 = getelementptr inbounds [4 x [8192 x [100 x [64 x float]]]], ptr %arg3, i32 0, i32 %84, i32 %83, i32 %81, i32 %79
  store float %142, ptr %145, align 4
  br label %x_in_tile-after

x_in_tile-true15:                                 ; preds = %x_in_tile-after
  %146 = mul nuw nsw i32 %32, 1
  %147 = add nuw nsw i32 0, %146
  %148 = mul nuw nsw i32 %31, 64
  %149 = add nuw nsw i32 %147, %148
  %150 = mul nuw nsw i32 %tile_origin.0, 6400
  %151 = add nuw nsw i32 %149, %150
  %152 = udiv i32 %151, 1
  %153 = urem i32 %152, 64
  %154 = udiv i32 %151, 64
  %155 = urem i32 %154, 100
  %156 = udiv i32 %151, 6400
  %157 = urem i32 %156, 8192
  %158 = udiv i32 %151, 52428800
  %159 = mul i32 %thread_id.x, 2
  %160 = sub i32 %x_loc14, %159
  %Arg_0.117 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg0, i32 0, i32 %158, i32 %157, i32 0, i32 %155
  %Arg_0.118 = load float, ptr %Arg_0.117, align 4, !invariant.load !22
  br label %concatenate.pivot.2.32

concat_index_from_operand_id020:                  ; preds = %concatenate.pivot.0.34
  %161 = phi i32 [ 0, %concatenate.pivot.0.34 ]
  %162 = sub nsw i32 %158, %161
  %163 = add i32 %157, 0
  %164 = add i32 %155, 0
  %165 = add i32 %153, 0
  %166 = mul nuw nsw i32 %165, 1
  %167 = add nuw nsw i32 0, %166
  %168 = udiv i32 %167, 256
  %169 = mul nuw nsw i32 %164, 1
  %170 = add nuw nsw i32 0, %169
  %171 = mul nuw nsw i32 %163, 100
  %172 = add nuw nsw i32 %170, %171
  %173 = udiv i32 %172, 819200
  %Arg_1.221 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %172, i32 %167
  %Arg_1.222 = load float, ptr %Arg_1.221, align 4, !invariant.load !22
  br label %concatenate.14.merge19

concat_index_from_operand_id123:                  ; preds = %concatenate.pivot.1.35
  %174 = phi i32 [ 1, %concatenate.pivot.1.35 ]
  %175 = sub nsw i32 %158, %174
  %176 = add i32 %157, 0
  %177 = add i32 %155, 0
  %178 = add i32 %153, 64
  %179 = mul nuw nsw i32 %178, 1
  %180 = add nuw nsw i32 0, %179
  %181 = udiv i32 %180, 256
  %182 = mul nuw nsw i32 %177, 1
  %183 = add nuw nsw i32 0, %182
  %184 = mul nuw nsw i32 %176, 100
  %185 = add nuw nsw i32 %183, %184
  %186 = udiv i32 %185, 819200
  %Arg_1.224 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %185, i32 %180
  %Arg_1.225 = load float, ptr %Arg_1.224, align 4, !invariant.load !22
  br label %concatenate.14.merge19

concat_index_from_operand_id226:                  ; preds = %concatenate.pivot.2.37
  %187 = phi i32 [ 2, %concatenate.pivot.2.37 ]
  %188 = sub nsw i32 %158, %187
  %189 = add i32 %157, 0
  %190 = add i32 %155, 0
  %191 = add i32 %153, 128
  %192 = mul nuw nsw i32 %191, 1
  %193 = add nuw nsw i32 0, %192
  %194 = udiv i32 %193, 256
  %195 = mul nuw nsw i32 %190, 1
  %196 = add nuw nsw i32 0, %195
  %197 = mul nuw nsw i32 %189, 100
  %198 = add nuw nsw i32 %196, %197
  %199 = udiv i32 %198, 819200
  %Arg_1.227 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %198, i32 %193
  %Arg_1.228 = load float, ptr %Arg_1.227, align 4, !invariant.load !22
  br label %concatenate.14.merge19

concat_index_from_operand_id329:                  ; preds = %concatenate.pivot.3.38
  %200 = phi i32 [ 3, %concatenate.pivot.3.38 ]
  %201 = sub nsw i32 %158, %200
  %202 = add i32 %157, 0
  %203 = add i32 %155, 0
  %204 = add i32 %153, 192
  %205 = mul nuw nsw i32 %204, 1
  %206 = add nuw nsw i32 0, %205
  %207 = udiv i32 %206, 256
  %208 = mul nuw nsw i32 %203, 1
  %209 = add nuw nsw i32 0, %208
  %210 = mul nuw nsw i32 %202, 100
  %211 = add nuw nsw i32 %209, %210
  %212 = udiv i32 %211, 819200
  %Arg_1.230 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %211, i32 %206
  %Arg_1.231 = load float, ptr %Arg_1.230, align 4, !invariant.load !22
  br label %concatenate.14.merge19

concatenate.pivot.2.32:                           ; preds = %x_in_tile-true15
  %213 = icmp ult i32 %158, 2
  br i1 %213, label %concatenate.pivot.1.33, label %concatenate.pivot.3.36

concatenate.pivot.1.33:                           ; preds = %concatenate.pivot.2.32
  %214 = icmp ult i32 %158, 1
  br i1 %214, label %concatenate.pivot.0.34, label %concatenate.pivot.1.35

concatenate.pivot.0.34:                           ; preds = %concatenate.pivot.1.33
  br label %concat_index_from_operand_id020

concatenate.pivot.1.35:                           ; preds = %concatenate.pivot.1.33
  br label %concat_index_from_operand_id123

concatenate.pivot.3.36:                           ; preds = %concatenate.pivot.2.32
  %215 = icmp ult i32 %158, 3
  br i1 %215, label %concatenate.pivot.2.37, label %concatenate.pivot.3.38

concatenate.pivot.2.37:                           ; preds = %concatenate.pivot.3.36
  br label %concat_index_from_operand_id226

concatenate.pivot.3.38:                           ; preds = %concatenate.pivot.3.36
  br label %concat_index_from_operand_id329

concatenate.14.merge19:                           ; preds = %concat_index_from_operand_id329, %concat_index_from_operand_id226, %concat_index_from_operand_id123, %concat_index_from_operand_id020
  %216 = phi float [ %Arg_1.222, %concat_index_from_operand_id020 ], [ %Arg_1.225, %concat_index_from_operand_id123 ], [ %Arg_1.228, %concat_index_from_operand_id226 ], [ %Arg_1.231, %concat_index_from_operand_id329 ]
  %multiply.1539 = fmul float %Arg_0.118, %216
  store float %multiply.1539, ptr %reduction_input_address, align 4
  %217 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %160
  call void @region_1_17__1(ptr %217, ptr %reduction_input_address, ptr %return_buffer40)
  %218 = load float, ptr %return_buffer40, align 4
  store float %218, ptr %217, align 4
  %219 = getelementptr inbounds [4 x [8192 x [100 x [64 x float]]]], ptr %arg3, i32 0, i32 %158, i32 %157, i32 %155, i32 %153
  store float %216, ptr %219, align 4
  br label %x_in_tile-after16

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %220 = mul i32 %thread_id.y, 2
  %221 = add i32 %tile_origin.1, %thread_id.x
  %222 = add i32 %tile_origin.2, %220
  %223 = add i32 %222, 0
  %224 = mul i32 %tile_origin.0, 64
  %225 = add i32 %224, %223
  %226 = udiv i32 %225, 1
  %227 = urem i32 %226, 64
  %228 = udiv i32 %225, 64
  %229 = urem i32 %228, 8192
  %230 = udiv i32 %225, 524288
  %output_element_address = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg2, i32 0, i32 %229, i32 %230, i32 %227
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true73:                    ; preds = %reduction_write_output-after
  %231 = mul i32 %thread_id.y, 2
  %232 = add i32 %tile_origin.1, %thread_id.x
  %233 = add i32 %tile_origin.2, %231
  %234 = add i32 %233, 1
  %235 = mul i32 %tile_origin.0, 64
  %236 = add i32 %235, %234
  %237 = udiv i32 %236, 1
  %238 = urem i32 %237, 64
  %239 = udiv i32 %236, 64
  %240 = urem i32 %239, 8192
  %241 = udiv i32 %236, 524288
  %output_element_address75 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg2, i32 0, i32 %240, i32 %241, i32 %238
  %output76 = load float, ptr %55, align 4
  store float %output76, ptr %output_element_address75, align 4
  br label %reduction_write_output-after74
}

define internal void @region_1_17__1(ptr dereferenceable(4) %Arg_0.18.typed, ptr dereferenceable(4) %Arg_1.19.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.20.typed = alloca float, align 4
  %Arg_0.18 = load float, ptr %Arg_0.18.typed, align 4
  %Arg_1.19 = load float, ptr %Arg_1.19.typed, align 4
  %add.20 = fadd float %Arg_0.18, %Arg_1.19
  store float %add.20, ptr %add.20.typed, align 4
  %load_ret_value = load float, ptr %add.20.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @copy_fusion(ptr noalias align 16 dereferenceable(26214400) %arg0, ptr noalias align 16 dereferenceable(26214400) %arg1, ptr noalias align 128 dereferenceable(26214400) %arg2, ptr noalias align 128 dereferenceable(26214400) %arg3) {
entry:
  %loop.invar_address = alloca i32, align 4
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %copy_fusion.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %0 = icmp uge i32 %loop.indvar, 6553600
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 442368
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !41
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !42
  %4 = mul nuw nsw i32 %2, 128
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 110592
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %5 = udiv i32 %linear_index_plus_base, 1
  %6 = urem i32 %5, 8
  %7 = udiv i32 %linear_index_plus_base, 8
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 8
  %10 = udiv i32 %linear_index1, 8
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %11 = udiv i32 %linear_index2, 1
  %12 = urem i32 %11, 8
  %13 = udiv i32 %linear_index2, 8
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = urem i32 %14, 8
  %16 = udiv i32 %linear_index3, 8
  %17 = icmp ult i32 %linear_index_plus_base, 6553600
  br i1 %17, label %copy_fusion.in_bounds-true, label %copy_fusion.in_bounds-after

copy_fusion.in_bounds-after:                      ; preds = %copy_fusion.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !48

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

copy_fusion.in_bounds-true:                       ; preds = %loop.loop_body
  %18 = getelementptr inbounds [819200 x [8 x float]], ptr %arg0, i32 0, i32 %7, i32 %6
  %19 = load float, ptr %18, align 4, !invariant.load !22
  %20 = insertvalue { float, float } undef, float %19, 0
  %21 = getelementptr inbounds [819200 x [8 x float]], ptr %arg1, i32 0, i32 %7, i32 %6
  %22 = load float, ptr %21, align 4, !invariant.load !22
  %23 = insertvalue { float, float } %20, float %22, 1
  %24 = extractvalue { float, float } %23, 0
  %25 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_plus_base
  store float %24, ptr %25, align 4
  %26 = extractvalue { float, float } %23, 1
  %27 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_plus_base
  store float %26, ptr %27, align 4
  %28 = getelementptr inbounds [819200 x [8 x float]], ptr %arg0, i32 0, i32 %10, i32 %9
  %29 = load float, ptr %28, align 4, !invariant.load !22
  %30 = insertvalue { float, float } undef, float %29, 0
  %31 = getelementptr inbounds [819200 x [8 x float]], ptr %arg1, i32 0, i32 %10, i32 %9
  %32 = load float, ptr %31, align 4, !invariant.load !22
  %33 = insertvalue { float, float } %30, float %32, 1
  %34 = extractvalue { float, float } %33, 0
  %35 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %34, ptr %35, align 4
  %36 = extractvalue { float, float } %33, 1
  %37 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %36, ptr %37, align 4
  %38 = getelementptr inbounds [819200 x [8 x float]], ptr %arg0, i32 0, i32 %13, i32 %12
  %39 = load float, ptr %38, align 4, !invariant.load !22
  %40 = insertvalue { float, float } undef, float %39, 0
  %41 = getelementptr inbounds [819200 x [8 x float]], ptr %arg1, i32 0, i32 %13, i32 %12
  %42 = load float, ptr %41, align 4, !invariant.load !22
  %43 = insertvalue { float, float } %40, float %42, 1
  %44 = extractvalue { float, float } %43, 0
  %45 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %44, ptr %45, align 4
  %46 = extractvalue { float, float } %43, 1
  %47 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %46, ptr %47, align 4
  %48 = getelementptr inbounds [819200 x [8 x float]], ptr %arg0, i32 0, i32 %16, i32 %15
  %49 = load float, ptr %48, align 4, !invariant.load !22
  %50 = insertvalue { float, float } undef, float %49, 0
  %51 = getelementptr inbounds [819200 x [8 x float]], ptr %arg1, i32 0, i32 %16, i32 %15
  %52 = load float, ptr %51, align 4, !invariant.load !22
  %53 = insertvalue { float, float } %50, float %52, 1
  %54 = extractvalue { float, float } %53, 0
  %55 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %54, ptr %55, align 4
  %56 = extractvalue { float, float } %53, 1
  %57 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %56, ptr %57, align 4
  br label %copy_fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19}

!0 = !{ptr @fusion_11, !"kernel", i32 1}
!1 = !{ptr @fusion_11, !"reqntidx", i32 256}
!2 = !{ptr @fusion_10, !"kernel", i32 1}
!3 = !{ptr @fusion_10, !"reqntidx", i32 256}
!4 = !{ptr @fusion_8, !"kernel", i32 1}
!5 = !{ptr @fusion_8, !"reqntidx", i32 96}
!6 = !{ptr @fusion_6, !"kernel", i32 1}
!7 = !{ptr @fusion_6, !"reqntidx", i32 96}
!8 = !{ptr @fusion_4, !"kernel", i32 1}
!9 = !{ptr @fusion_4, !"reqntidx", i32 96}
!10 = !{ptr @fusion_3, !"kernel", i32 1}
!11 = !{ptr @fusion_3, !"reqntidx", i32 256}
!12 = !{ptr @fusion_2, !"kernel", i32 1}
!13 = !{ptr @fusion_2, !"reqntidx", i32 256}
!14 = !{ptr @add_44, !"kernel", i32 1}
!15 = !{ptr @add_44, !"reqntidx", i32 128}
!16 = !{ptr @fusion, !"kernel", i32 1}
!17 = !{ptr @fusion, !"reqntidx", i32 1024}
!18 = !{ptr @copy_fusion, !"kernel", i32 1}
!19 = !{ptr @copy_fusion, !"reqntidx", i32 128}
!20 = !{i32 0, i32 2048}
!21 = !{i32 0, i32 256}
!22 = !{}
!23 = !{i32 0, i32 160000}
!24 = !{i32 0, i32 1}
!25 = !{i32 0, i32 96}
!26 = !{i32 0, i32 1092267}
!27 = distinct !{!27, !28}
!28 = !{!"llvm.loop.vectorize.enable", i1 false}
!29 = distinct !{!29, !28, !30}
!30 = !{!"llvm.loop.unroll.full"}
!31 = distinct !{!31, !28, !30}
!32 = !{i32 0, i32 10923}
!33 = distinct !{!33, !28}
!34 = distinct !{!34, !28, !30}
!35 = distinct !{!35, !28, !30}
!36 = distinct !{!36, !28}
!37 = distinct !{!37, !28, !30}
!38 = distinct !{!38, !28, !30}
!39 = !{i32 0, i32 3200}
!40 = !{i32 0, i32 121600}
!41 = !{i32 0, i32 864}
!42 = !{i32 0, i32 128}
!43 = distinct !{!43, !28}
!44 = !{i32 0, i32 1024}
!45 = !{i32 0, i32 32768}
!46 = distinct !{!46, !28, !30}
!47 = distinct !{!47, !28}
!48 = distinct !{!48, !28}
