target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@buffer_for_constant_1 = constant [64 x i8] c"\00\00\80\FF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@shared_cache1 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@1 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache2 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@2 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache3 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

define void @fusion_6(ptr noalias align 16 dereferenceable(2097152) %arg0, ptr noalias align 16 dereferenceable(31719424) %arg1, ptr noalias align 128 dereferenceable(33816576) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2113536
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 1032
  %5 = udiv i32 %linear_index_base, 1032
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 1032
  %8 = udiv i32 %linear_index1, 1032
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 1032
  %11 = udiv i32 %linear_index2, 1032
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 1032
  %14 = udiv i32 %linear_index3, 1032
  %15 = icmp ult i32 %linear_index_base, 8454144
  br i1 %15, label %fusion_6.in_bounds-true, label %fusion_6.in_bounds-after

fusion_6.in_bounds-after:                         ; preds = %concatenate.5.merge14, %entry
  ret void

fusion_6.in_bounds-true:                          ; preds = %entry
  br label %concatenate.pivot.968.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %16 = phi i32 [ 0, %concatenate.pivot.0. ]
  %17 = sub nsw i32 %4, %16
  %18 = udiv i32 %linear_index_base, 1032
  %19 = mul i32 %18, 968
  %20 = add i32 %19, %17
  %21 = udiv i32 %20, 1
  %22 = urem i32 %21, 968
  %23 = udiv i32 %20, 968
  %24 = urem i32 %23, 8192
  %25 = udiv i32 %20, 7929856
  %26 = getelementptr inbounds float, ptr %arg1, i32 %20
  %27 = load float, ptr %26, align 4, !invariant.load !28
  br label %concatenate.5.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.968.1
  %28 = phi i32 [ 968, %concatenate.pivot.968.1 ]
  %29 = sub nsw i32 %4, %28
  %30 = udiv i32 %linear_index_base, 1032
  %31 = mul i32 %30, 64
  %32 = add i32 %31, %29
  %33 = udiv i32 %32, 1
  %34 = urem i32 %33, 64
  %35 = udiv i32 %32, 64
  %36 = urem i32 %35, 8192
  %37 = udiv i32 %32, 524288
  %38 = getelementptr inbounds float, ptr %arg0, i32 %32
  %39 = load float, ptr %38, align 4, !invariant.load !28
  br label %concatenate.5.merge

concatenate.pivot.968.:                           ; preds = %fusion_6.in_bounds-true
  %40 = icmp ult i32 %4, 968
  br i1 %40, label %concatenate.pivot.0., label %concatenate.pivot.968.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.968.
  br label %concat_index_from_operand_id0

concatenate.pivot.968.1:                          ; preds = %concatenate.pivot.968.
  br label %concat_index_from_operand_id1

concatenate.5.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %41 = phi float [ %27, %concat_index_from_operand_id0 ], [ %39, %concat_index_from_operand_id1 ]
  %42 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %41, ptr %42, align 4
  br label %concatenate.pivot.968.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %43 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %44 = sub nsw i32 %7, %43
  %45 = udiv i32 %linear_index1, 1032
  %46 = mul i32 %45, 968
  %47 = add i32 %46, %44
  %48 = udiv i32 %47, 1
  %49 = urem i32 %48, 968
  %50 = udiv i32 %47, 968
  %51 = urem i32 %50, 8192
  %52 = udiv i32 %47, 7929856
  %53 = getelementptr inbounds float, ptr %arg1, i32 %47
  %54 = load float, ptr %53, align 4, !invariant.load !28
  br label %concatenate.5.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.968.7
  %55 = phi i32 [ 968, %concatenate.pivot.968.7 ]
  %56 = sub nsw i32 %7, %55
  %57 = udiv i32 %linear_index1, 1032
  %58 = mul i32 %57, 64
  %59 = add i32 %58, %56
  %60 = udiv i32 %59, 1
  %61 = urem i32 %60, 64
  %62 = udiv i32 %59, 64
  %63 = urem i32 %62, 8192
  %64 = udiv i32 %59, 524288
  %65 = getelementptr inbounds float, ptr %arg0, i32 %59
  %66 = load float, ptr %65, align 4, !invariant.load !28
  br label %concatenate.5.merge2

concatenate.pivot.968.5:                          ; preds = %concatenate.5.merge
  %67 = icmp ult i32 %7, 968
  br i1 %67, label %concatenate.pivot.0.6, label %concatenate.pivot.968.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.968.5
  br label %concat_index_from_operand_id03

concatenate.pivot.968.7:                          ; preds = %concatenate.pivot.968.5
  br label %concat_index_from_operand_id14

concatenate.5.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %68 = phi float [ %54, %concat_index_from_operand_id03 ], [ %66, %concat_index_from_operand_id14 ]
  %69 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %68, ptr %69, align 4
  br label %concatenate.pivot.968.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %70 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %71 = sub nsw i32 %10, %70
  %72 = udiv i32 %linear_index2, 1032
  %73 = mul i32 %72, 968
  %74 = add i32 %73, %71
  %75 = udiv i32 %74, 1
  %76 = urem i32 %75, 968
  %77 = udiv i32 %74, 968
  %78 = urem i32 %77, 8192
  %79 = udiv i32 %74, 7929856
  %80 = getelementptr inbounds float, ptr %arg1, i32 %74
  %81 = load float, ptr %80, align 4, !invariant.load !28
  br label %concatenate.5.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.968.13
  %82 = phi i32 [ 968, %concatenate.pivot.968.13 ]
  %83 = sub nsw i32 %10, %82
  %84 = udiv i32 %linear_index2, 1032
  %85 = mul i32 %84, 64
  %86 = add i32 %85, %83
  %87 = udiv i32 %86, 1
  %88 = urem i32 %87, 64
  %89 = udiv i32 %86, 64
  %90 = urem i32 %89, 8192
  %91 = udiv i32 %86, 524288
  %92 = getelementptr inbounds float, ptr %arg0, i32 %86
  %93 = load float, ptr %92, align 4, !invariant.load !28
  br label %concatenate.5.merge8

concatenate.pivot.968.11:                         ; preds = %concatenate.5.merge2
  %94 = icmp ult i32 %10, 968
  br i1 %94, label %concatenate.pivot.0.12, label %concatenate.pivot.968.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.968.11
  br label %concat_index_from_operand_id09

concatenate.pivot.968.13:                         ; preds = %concatenate.pivot.968.11
  br label %concat_index_from_operand_id110

concatenate.5.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %95 = phi float [ %81, %concat_index_from_operand_id09 ], [ %93, %concat_index_from_operand_id110 ]
  %96 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %95, ptr %96, align 4
  br label %concatenate.pivot.968.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %97 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %98 = sub nsw i32 %13, %97
  %99 = udiv i32 %linear_index3, 1032
  %100 = mul i32 %99, 968
  %101 = add i32 %100, %98
  %102 = udiv i32 %101, 1
  %103 = urem i32 %102, 968
  %104 = udiv i32 %101, 968
  %105 = urem i32 %104, 8192
  %106 = udiv i32 %101, 7929856
  %107 = getelementptr inbounds float, ptr %arg1, i32 %101
  %108 = load float, ptr %107, align 4, !invariant.load !28
  br label %concatenate.5.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.968.19
  %109 = phi i32 [ 968, %concatenate.pivot.968.19 ]
  %110 = sub nsw i32 %13, %109
  %111 = udiv i32 %linear_index3, 1032
  %112 = mul i32 %111, 64
  %113 = add i32 %112, %110
  %114 = udiv i32 %113, 1
  %115 = urem i32 %114, 64
  %116 = udiv i32 %113, 64
  %117 = urem i32 %116, 8192
  %118 = udiv i32 %113, 524288
  %119 = getelementptr inbounds float, ptr %arg0, i32 %113
  %120 = load float, ptr %119, align 4, !invariant.load !28
  br label %concatenate.5.merge14

concatenate.pivot.968.17:                         ; preds = %concatenate.5.merge8
  %121 = icmp ult i32 %13, 968
  br i1 %121, label %concatenate.pivot.0.18, label %concatenate.pivot.968.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.968.17
  br label %concat_index_from_operand_id015

concatenate.pivot.968.19:                         ; preds = %concatenate.pivot.968.17
  br label %concat_index_from_operand_id116

concatenate.5.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %122 = phi float [ %108, %concat_index_from_operand_id015 ], [ %120, %concat_index_from_operand_id116 ]
  %123 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %122, ptr %123, align 4
  br label %fusion_6.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @concatenate_4(ptr noalias align 16 dereferenceable(991232) %arg0, ptr noalias align 16 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(1056768) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !29
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 66048
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
  %15 = icmp ult i32 %linear_index_base, 264192
  br i1 %15, label %concatenate_4.in_bounds-true, label %concatenate_4.in_bounds-after

concatenate_4.in_bounds-after:                    ; preds = %concatenate.3.merge14, %entry
  ret void

concatenate_4.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.968.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %16 = phi i32 [ 0, %concatenate.pivot.0. ]
  %17 = sub nsw i32 %5, %16
  %18 = getelementptr inbounds [968 x [256 x float]], ptr %arg0, i32 0, i32 %17, i32 %4
  %19 = load float, ptr %18, align 4, !invariant.load !28
  br label %concatenate.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.968.1
  %20 = phi i32 [ 968, %concatenate.pivot.968.1 ]
  %21 = sub nsw i32 %5, %20
  %22 = getelementptr inbounds [64 x [256 x float]], ptr %arg1, i32 0, i32 %21, i32 %4
  %23 = load float, ptr %22, align 4, !invariant.load !28
  br label %concatenate.3.merge

concatenate.pivot.968.:                           ; preds = %concatenate_4.in_bounds-true
  %24 = icmp ult i32 %5, 968
  br i1 %24, label %concatenate.pivot.0., label %concatenate.pivot.968.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.968.
  br label %concat_index_from_operand_id0

concatenate.pivot.968.1:                          ; preds = %concatenate.pivot.968.
  br label %concat_index_from_operand_id1

concatenate.3.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %25 = phi float [ %19, %concat_index_from_operand_id0 ], [ %23, %concat_index_from_operand_id1 ]
  %26 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %25, ptr %26, align 4
  br label %concatenate.pivot.968.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %27 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %28 = sub nsw i32 %8, %27
  %29 = getelementptr inbounds [968 x [256 x float]], ptr %arg0, i32 0, i32 %28, i32 %7
  %30 = load float, ptr %29, align 4, !invariant.load !28
  br label %concatenate.3.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.968.7
  %31 = phi i32 [ 968, %concatenate.pivot.968.7 ]
  %32 = sub nsw i32 %8, %31
  %33 = getelementptr inbounds [64 x [256 x float]], ptr %arg1, i32 0, i32 %32, i32 %7
  %34 = load float, ptr %33, align 4, !invariant.load !28
  br label %concatenate.3.merge2

concatenate.pivot.968.5:                          ; preds = %concatenate.3.merge
  %35 = icmp ult i32 %8, 968
  br i1 %35, label %concatenate.pivot.0.6, label %concatenate.pivot.968.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.968.5
  br label %concat_index_from_operand_id03

concatenate.pivot.968.7:                          ; preds = %concatenate.pivot.968.5
  br label %concat_index_from_operand_id14

concatenate.3.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %36 = phi float [ %30, %concat_index_from_operand_id03 ], [ %34, %concat_index_from_operand_id14 ]
  %37 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %36, ptr %37, align 4
  br label %concatenate.pivot.968.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %38 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %39 = sub nsw i32 %11, %38
  %40 = getelementptr inbounds [968 x [256 x float]], ptr %arg0, i32 0, i32 %39, i32 %10
  %41 = load float, ptr %40, align 4, !invariant.load !28
  br label %concatenate.3.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.968.13
  %42 = phi i32 [ 968, %concatenate.pivot.968.13 ]
  %43 = sub nsw i32 %11, %42
  %44 = getelementptr inbounds [64 x [256 x float]], ptr %arg1, i32 0, i32 %43, i32 %10
  %45 = load float, ptr %44, align 4, !invariant.load !28
  br label %concatenate.3.merge8

concatenate.pivot.968.11:                         ; preds = %concatenate.3.merge2
  %46 = icmp ult i32 %11, 968
  br i1 %46, label %concatenate.pivot.0.12, label %concatenate.pivot.968.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.968.11
  br label %concat_index_from_operand_id09

concatenate.pivot.968.13:                         ; preds = %concatenate.pivot.968.11
  br label %concat_index_from_operand_id110

concatenate.3.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %47 = phi float [ %41, %concat_index_from_operand_id09 ], [ %45, %concat_index_from_operand_id110 ]
  %48 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %47, ptr %48, align 4
  br label %concatenate.pivot.968.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %49 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %50 = sub nsw i32 %14, %49
  %51 = getelementptr inbounds [968 x [256 x float]], ptr %arg0, i32 0, i32 %50, i32 %13
  %52 = load float, ptr %51, align 4, !invariant.load !28
  br label %concatenate.3.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.968.19
  %53 = phi i32 [ 968, %concatenate.pivot.968.19 ]
  %54 = sub nsw i32 %14, %53
  %55 = getelementptr inbounds [64 x [256 x float]], ptr %arg1, i32 0, i32 %54, i32 %13
  %56 = load float, ptr %55, align 4, !invariant.load !28
  br label %concatenate.3.merge14

concatenate.pivot.968.17:                         ; preds = %concatenate.3.merge8
  %57 = icmp ult i32 %14, 968
  br i1 %57, label %concatenate.pivot.0.18, label %concatenate.pivot.968.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.968.17
  br label %concat_index_from_operand_id015

concatenate.pivot.968.19:                         ; preds = %concatenate.pivot.968.17
  br label %concat_index_from_operand_id116

concatenate.3.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %58 = phi float [ %52, %concat_index_from_operand_id015 ], [ %56, %concat_index_from_operand_id116 ]
  %59 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %58, ptr %59, align 4
  br label %concatenate_4.in_bounds-after
}

define void @fusion_5(ptr noalias align 16 dereferenceable(209715200) %arg0, ptr noalias align 16 dereferenceable(209715200) %arg1, ptr noalias align 16 dereferenceable(26214400) %arg2, ptr noalias align 16 dereferenceable(209715200) %arg3, ptr noalias align 128 dereferenceable(655360000) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !30
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
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
  br i1 %15, label %fusion_5.in_bounds-true, label %fusion_5.in_bounds-after

fusion_5.in_bounds-after:                         ; preds = %concatenate.6.merge28, %entry
  ret void

fusion_5.in_bounds-true:                          ; preds = %entry
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
  %35 = load float, ptr %34, align 4, !invariant.load !28
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
  %47 = load float, ptr %46, align 4, !invariant.load !28
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
  %59 = load float, ptr %58, align 4, !invariant.load !28
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
  %79 = load float, ptr %78, align 4, !invariant.load !28
  br label %concatenate.6.merge

concatenate.pivot.128.:                           ; preds = %fusion_5.in_bounds-true
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
  %104 = load float, ptr %103, align 4, !invariant.load !28
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
  %116 = load float, ptr %115, align 4, !invariant.load !28
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
  %128 = load float, ptr %127, align 4, !invariant.load !28
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
  %148 = load float, ptr %147, align 4, !invariant.load !28
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
  %173 = load float, ptr %172, align 4, !invariant.load !28
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
  %185 = load float, ptr %184, align 4, !invariant.load !28
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
  %197 = load float, ptr %196, align 4, !invariant.load !28
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
  %217 = load float, ptr %216, align 4, !invariant.load !28
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
  %242 = load float, ptr %241, align 4, !invariant.load !28
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
  %254 = load float, ptr %253, align 4, !invariant.load !28
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
  %266 = load float, ptr %265, align 4, !invariant.load !28
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
  %286 = load float, ptr %285, align 4, !invariant.load !28
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
  br label %fusion_5.in_bounds-after
}

define void @fusion_4(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(838860800) %arg1, ptr noalias align 128 dereferenceable(13107200) %arg2) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %result_from_other_lane29 = alloca float, align 4
  %return_buffer28 = alloca float, align 4
  %result_from_other_lane26 = alloca float, align 4
  %return_buffer25 = alloca float, align 4
  %result_from_other_lane23 = alloca float, align 4
  %return_buffer22 = alloca float, align 4
  %result_from_other_lane20 = alloca float, align 4
  %return_buffer19 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %tile_loop.invar_address8 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !31
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_13_constant_7 = load float, ptr @0, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_13_constant_7, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !33
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

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !34

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %22 = load float, ptr %return_buffer19, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane20, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %24 = load float, ptr %return_buffer22, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane23, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %26 = load float, ptr %return_buffer25, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result27 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane26, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane26, ptr %return_buffer28)
  %28 = load float, ptr %return_buffer28, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result30 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane29, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane29, ptr %return_buffer31)
  %30 = load float, ptr %return_buffer31, align 4
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
  %43 = mul nuw nsw i32 %39, 64
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 209715200
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 64
  %49 = udiv i32 %46, 64
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 256
  %52 = urem i32 %51, 100
  %53 = udiv i32 %46, 25600
  %54 = mul nuw nsw i32 %48, 1
  %55 = add nuw nsw i32 0, %54
  %56 = mul nuw nsw i32 %50, 64
  %57 = add nuw nsw i32 %55, %56
  %58 = udiv i32 %57, 256
  %59 = mul nuw nsw i32 %53, 1
  %60 = add nuw nsw i32 0, %59
  %61 = udiv i32 %60, 8192
  %Arg_0.1 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %60, i32 %57
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !28
  %62 = mul nuw nsw i32 %48, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %50, 64
  %65 = add nuw nsw i32 %63, %64
  %66 = udiv i32 %65, 256
  %67 = mul nuw nsw i32 %52, 1
  %68 = add nuw nsw i32 0, %67
  %69 = mul nuw nsw i32 %53, 100
  %70 = add nuw nsw i32 %68, %69
  %71 = udiv i32 %70, 819200
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %46
  %Arg_1.24 = load float, ptr %Arg_1.2, align 4, !invariant.load !28
  %multiply.6 = fmul float %Arg_0.13, %Arg_1.24
  store float %multiply.6, ptr %reduction_input_address, align 4
  %72 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_8(ptr %72, ptr %reduction_input_address, ptr %return_buffer)
  %73 = load float, ptr %return_buffer, align 4
  store float %73, ptr %72, align 4
  br label %tile_loop.loop_header, !llvm.loop !36

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %74 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %75 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %75, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %76 = icmp eq i32 %tile_loop.indvar9, 0
  %77 = mul i32 %tile_loop.indvar9, 32
  %78 = add i32 %77, 0
  %x_loc11 = add i32 %78, %74
  %79 = add i32 %tile_origin.1, %y_in_tile.indvar
  %80 = add i32 %tile_origin.2, %x_loc11
  %81 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %81, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !38

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %82 = mul nuw nsw i32 %80, 1
  %83 = add nuw nsw i32 0, %82
  %84 = mul nuw nsw i32 %79, 64
  %85 = add nuw nsw i32 %83, %84
  %86 = mul nuw nsw i32 %tile_origin.0, 209715200
  %87 = add nuw nsw i32 %85, %86
  %88 = udiv i32 %87, 1
  %89 = urem i32 %88, 64
  %90 = udiv i32 %87, 64
  %91 = urem i32 %90, 4
  %92 = udiv i32 %87, 256
  %93 = urem i32 %92, 100
  %94 = udiv i32 %87, 25600
  %95 = mul nuw nsw i32 %89, 1
  %96 = add nuw nsw i32 0, %95
  %97 = mul nuw nsw i32 %91, 64
  %98 = add nuw nsw i32 %96, %97
  %99 = udiv i32 %98, 256
  %100 = mul nuw nsw i32 %94, 1
  %101 = add nuw nsw i32 0, %100
  %102 = udiv i32 %101, 8192
  %Arg_0.112 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %101, i32 %98
  %Arg_0.113 = load float, ptr %Arg_0.112, align 4, !invariant.load !28
  %103 = mul nuw nsw i32 %89, 1
  %104 = add nuw nsw i32 0, %103
  %105 = mul nuw nsw i32 %91, 64
  %106 = add nuw nsw i32 %104, %105
  %107 = udiv i32 %106, 256
  %108 = mul nuw nsw i32 %93, 1
  %109 = add nuw nsw i32 0, %108
  %110 = mul nuw nsw i32 %94, 100
  %111 = add nuw nsw i32 %109, %110
  %112 = udiv i32 %111, 819200
  %Arg_1.214 = getelementptr inbounds float, ptr %arg1, i32 %87
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !28
  %multiply.616 = fmul float %Arg_0.113, %Arg_1.215
  store float %multiply.616, ptr %reduction_input_address, align 4
  %113 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_8(ptr %113, ptr %reduction_input_address, ptr %return_buffer17)
  %114 = load float, ptr %return_buffer17, align 4
  store float %114, ptr %113, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %115 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %31
  %116 = addrspacecast ptr addrspace(3) %115 to ptr
  %117 = load float, ptr %current_output, align 4
  store float %117, ptr %116, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %118 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %lane_id
  %119 = addrspacecast ptr addrspace(3) %118 to ptr
  store float %region_0_13_constant_7, ptr %initial_value_addr, align 4
  %120 = icmp ult i32 %thread_id.x, 1
  %121 = select i1 %120, ptr %119, ptr %initial_value_addr
  %122 = icmp eq i32 %thread_id.x, 0
  br i1 %122, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %123 = mul i32 %thread_id.x, 1
  %124 = add i32 %tile_origin.1, %thread_id.y
  %125 = add i32 %tile_origin.2, %123
  %126 = add i32 %125, 0
  %127 = udiv i32 %124, 1
  %128 = urem i32 %127, 4
  %129 = udiv i32 %124, 4
  %130 = urem i32 %129, 100
  %131 = udiv i32 %124, 400
  %output_element_address = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg2, i32 0, i32 %131, i32 %128, i32 %130
  %output = load float, ptr %121, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

define internal void @region_1_8(ptr dereferenceable(4) %Arg_0.9.typed, ptr dereferenceable(4) %Arg_1.10.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.11.typed = alloca float, align 4
  %Arg_0.9 = load float, ptr %Arg_0.9.typed, align 4
  %Arg_1.10 = load float, ptr %Arg_1.10.typed, align 4
  %add.11 = fadd float %Arg_0.9, %Arg_1.10
  store float %add.11, ptr %add.11.typed, align 4
  %load_ret_value = load float, ptr %add.11.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define void @fusion_3(ptr noalias align 16 dereferenceable(16) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(16) %arg3, ptr noalias align 16 dereferenceable(3276800) %arg4, ptr noalias align 16 dereferenceable(16) %arg5, ptr noalias align 16 dereferenceable(3276800) %arg6, ptr noalias align 16 dereferenceable(16) %arg7, ptr noalias align 16 dereferenceable(3276800) %arg8, ptr noalias align 16 dereferenceable(16) %arg9, ptr noalias align 16 dereferenceable(3276800) %arg10, ptr noalias align 128 dereferenceable(13107200) %arg11) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !39
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 819200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 100
  %5 = udiv i32 %linear_index_base, 100
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index_base, 400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 100
  %10 = udiv i32 %linear_index1, 100
  %11 = urem i32 %10, 4
  %12 = udiv i32 %linear_index1, 400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 100
  %15 = udiv i32 %linear_index2, 100
  %16 = urem i32 %15, 4
  %17 = udiv i32 %linear_index2, 400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 100
  %20 = udiv i32 %linear_index3, 100
  %21 = urem i32 %20, 4
  %22 = udiv i32 %linear_index3, 400
  %23 = icmp ult i32 %linear_index_base, 3276800
  br i1 %23, label %fusion_3.in_bounds-true, label %fusion_3.in_bounds-after

fusion_3.in_bounds-after:                         ; preds = %fusion_3.in_bounds-true, %entry
  ret void

fusion_3.in_bounds-true:                          ; preds = %entry
  %24 = mul nuw nsw i32 %6, 1
  %25 = add nuw nsw i32 0, %24
  %26 = udiv i32 %25, 4
  %27 = mul nuw nsw i32 %4, 1
  %28 = add nuw nsw i32 0, %27
  %29 = mul nuw nsw i32 %7, 100
  %30 = add nuw nsw i32 %28, %29
  %31 = udiv i32 %30, 819200
  %32 = mul nuw nsw i32 %30, 1
  %33 = add nuw nsw i32 0, %32
  %34 = urem i32 %33, 100
  %35 = udiv i32 %33, 100
  %36 = udiv i32 %35, 8192
  %37 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %35, i32 %34, i32 0
  %38 = load float, ptr %37, align 4, !invariant.load !28
  %39 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %25
  %40 = load float, ptr %39, align 4, !invariant.load !28
  %multiply.16 = fmul float %38, %40
  %41 = mul nuw nsw i32 %30, 1
  %42 = add nuw nsw i32 0, %41
  %43 = urem i32 %42, 100
  %44 = udiv i32 %42, 100
  %45 = udiv i32 %44, 8192
  %46 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %44, i32 %43, i32 0
  %47 = load float, ptr %46, align 4, !invariant.load !28
  %48 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %25
  %49 = load float, ptr %48, align 4, !invariant.load !28
  %multiply.21 = fmul float %47, %49
  %add.22 = fadd float %multiply.16, %multiply.21
  %50 = mul nuw nsw i32 %30, 1
  %51 = add nuw nsw i32 0, %50
  %52 = urem i32 %51, 100
  %53 = udiv i32 %51, 100
  %54 = udiv i32 %53, 8192
  %55 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %53, i32 %52, i32 0
  %56 = load float, ptr %55, align 4, !invariant.load !28
  %57 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %25
  %58 = load float, ptr %57, align 4, !invariant.load !28
  %multiply.27 = fmul float %56, %58
  %add.28 = fadd float %add.22, %multiply.27
  %59 = mul nuw nsw i32 %30, 1
  %60 = add nuw nsw i32 0, %59
  %61 = urem i32 %60, 100
  %62 = udiv i32 %60, 100
  %63 = udiv i32 %62, 8192
  %64 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %62, i32 %61, i32 0
  %65 = load float, ptr %64, align 4, !invariant.load !28
  %66 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %25
  %67 = load float, ptr %66, align 4, !invariant.load !28
  %multiply.33 = fmul float %65, %67
  %add.34 = fadd float %add.28, %multiply.33
  %68 = load float, ptr %arg2, align 4, !invariant.load !28
  %69 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %70 = load float, ptr %69, align 4, !invariant.load !28
  %multiply.39 = fmul float %68, %70
  %add.40 = fadd float %add.34, %multiply.39
  %71 = getelementptr inbounds [4 x float], ptr %arg0, i32 0, i32 %6
  %72 = load float, ptr %71, align 4, !invariant.load !28
  %add.42 = fadd float %add.40, %72
  %73 = getelementptr inbounds float, ptr %arg11, i32 %linear_index_base
  store float %add.42, ptr %73, align 4
  %74 = mul nuw nsw i32 %11, 1
  %75 = add nuw nsw i32 0, %74
  %76 = udiv i32 %75, 4
  %77 = mul nuw nsw i32 %9, 1
  %78 = add nuw nsw i32 0, %77
  %79 = mul nuw nsw i32 %12, 100
  %80 = add nuw nsw i32 %78, %79
  %81 = udiv i32 %80, 819200
  %82 = mul nuw nsw i32 %80, 1
  %83 = add nuw nsw i32 0, %82
  %84 = urem i32 %83, 100
  %85 = udiv i32 %83, 100
  %86 = udiv i32 %85, 8192
  %87 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %85, i32 %84, i32 0
  %88 = load float, ptr %87, align 4, !invariant.load !28
  %89 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %75
  %90 = load float, ptr %89, align 4, !invariant.load !28
  %multiply.161 = fmul float %88, %90
  %91 = mul nuw nsw i32 %80, 1
  %92 = add nuw nsw i32 0, %91
  %93 = urem i32 %92, 100
  %94 = udiv i32 %92, 100
  %95 = udiv i32 %94, 8192
  %96 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %94, i32 %93, i32 0
  %97 = load float, ptr %96, align 4, !invariant.load !28
  %98 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %75
  %99 = load float, ptr %98, align 4, !invariant.load !28
  %multiply.212 = fmul float %97, %99
  %add.223 = fadd float %multiply.161, %multiply.212
  %100 = mul nuw nsw i32 %80, 1
  %101 = add nuw nsw i32 0, %100
  %102 = urem i32 %101, 100
  %103 = udiv i32 %101, 100
  %104 = udiv i32 %103, 8192
  %105 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %103, i32 %102, i32 0
  %106 = load float, ptr %105, align 4, !invariant.load !28
  %107 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %75
  %108 = load float, ptr %107, align 4, !invariant.load !28
  %multiply.274 = fmul float %106, %108
  %add.285 = fadd float %add.223, %multiply.274
  %109 = mul nuw nsw i32 %80, 1
  %110 = add nuw nsw i32 0, %109
  %111 = urem i32 %110, 100
  %112 = udiv i32 %110, 100
  %113 = udiv i32 %112, 8192
  %114 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %112, i32 %111, i32 0
  %115 = load float, ptr %114, align 4, !invariant.load !28
  %116 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %75
  %117 = load float, ptr %116, align 4, !invariant.load !28
  %multiply.336 = fmul float %115, %117
  %add.347 = fadd float %add.285, %multiply.336
  %118 = load float, ptr %arg2, align 4, !invariant.load !28
  %119 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %120 = load float, ptr %119, align 4, !invariant.load !28
  %multiply.398 = fmul float %118, %120
  %add.409 = fadd float %add.347, %multiply.398
  %121 = getelementptr inbounds [4 x float], ptr %arg0, i32 0, i32 %11
  %122 = load float, ptr %121, align 4, !invariant.load !28
  %add.4210 = fadd float %add.409, %122
  %123 = getelementptr inbounds float, ptr %arg11, i32 %linear_index1
  store float %add.4210, ptr %123, align 4
  %124 = mul nuw nsw i32 %16, 1
  %125 = add nuw nsw i32 0, %124
  %126 = udiv i32 %125, 4
  %127 = mul nuw nsw i32 %14, 1
  %128 = add nuw nsw i32 0, %127
  %129 = mul nuw nsw i32 %17, 100
  %130 = add nuw nsw i32 %128, %129
  %131 = udiv i32 %130, 819200
  %132 = mul nuw nsw i32 %130, 1
  %133 = add nuw nsw i32 0, %132
  %134 = urem i32 %133, 100
  %135 = udiv i32 %133, 100
  %136 = udiv i32 %135, 8192
  %137 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %135, i32 %134, i32 0
  %138 = load float, ptr %137, align 4, !invariant.load !28
  %139 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %125
  %140 = load float, ptr %139, align 4, !invariant.load !28
  %multiply.1611 = fmul float %138, %140
  %141 = mul nuw nsw i32 %130, 1
  %142 = add nuw nsw i32 0, %141
  %143 = urem i32 %142, 100
  %144 = udiv i32 %142, 100
  %145 = udiv i32 %144, 8192
  %146 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %144, i32 %143, i32 0
  %147 = load float, ptr %146, align 4, !invariant.load !28
  %148 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %125
  %149 = load float, ptr %148, align 4, !invariant.load !28
  %multiply.2112 = fmul float %147, %149
  %add.2213 = fadd float %multiply.1611, %multiply.2112
  %150 = mul nuw nsw i32 %130, 1
  %151 = add nuw nsw i32 0, %150
  %152 = urem i32 %151, 100
  %153 = udiv i32 %151, 100
  %154 = udiv i32 %153, 8192
  %155 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %153, i32 %152, i32 0
  %156 = load float, ptr %155, align 4, !invariant.load !28
  %157 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %125
  %158 = load float, ptr %157, align 4, !invariant.load !28
  %multiply.2714 = fmul float %156, %158
  %add.2815 = fadd float %add.2213, %multiply.2714
  %159 = mul nuw nsw i32 %130, 1
  %160 = add nuw nsw i32 0, %159
  %161 = urem i32 %160, 100
  %162 = udiv i32 %160, 100
  %163 = udiv i32 %162, 8192
  %164 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %162, i32 %161, i32 0
  %165 = load float, ptr %164, align 4, !invariant.load !28
  %166 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %125
  %167 = load float, ptr %166, align 4, !invariant.load !28
  %multiply.3316 = fmul float %165, %167
  %add.3417 = fadd float %add.2815, %multiply.3316
  %168 = load float, ptr %arg2, align 4, !invariant.load !28
  %169 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %170 = load float, ptr %169, align 4, !invariant.load !28
  %multiply.3918 = fmul float %168, %170
  %add.4019 = fadd float %add.3417, %multiply.3918
  %171 = getelementptr inbounds [4 x float], ptr %arg0, i32 0, i32 %16
  %172 = load float, ptr %171, align 4, !invariant.load !28
  %add.4220 = fadd float %add.4019, %172
  %173 = getelementptr inbounds float, ptr %arg11, i32 %linear_index2
  store float %add.4220, ptr %173, align 4
  %174 = mul nuw nsw i32 %21, 1
  %175 = add nuw nsw i32 0, %174
  %176 = udiv i32 %175, 4
  %177 = mul nuw nsw i32 %19, 1
  %178 = add nuw nsw i32 0, %177
  %179 = mul nuw nsw i32 %22, 100
  %180 = add nuw nsw i32 %178, %179
  %181 = udiv i32 %180, 819200
  %182 = mul nuw nsw i32 %180, 1
  %183 = add nuw nsw i32 0, %182
  %184 = urem i32 %183, 100
  %185 = udiv i32 %183, 100
  %186 = udiv i32 %185, 8192
  %187 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %185, i32 %184, i32 0
  %188 = load float, ptr %187, align 4, !invariant.load !28
  %189 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %175
  %190 = load float, ptr %189, align 4, !invariant.load !28
  %multiply.1621 = fmul float %188, %190
  %191 = mul nuw nsw i32 %180, 1
  %192 = add nuw nsw i32 0, %191
  %193 = urem i32 %192, 100
  %194 = udiv i32 %192, 100
  %195 = udiv i32 %194, 8192
  %196 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %194, i32 %193, i32 0
  %197 = load float, ptr %196, align 4, !invariant.load !28
  %198 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %175
  %199 = load float, ptr %198, align 4, !invariant.load !28
  %multiply.2122 = fmul float %197, %199
  %add.2223 = fadd float %multiply.1621, %multiply.2122
  %200 = mul nuw nsw i32 %180, 1
  %201 = add nuw nsw i32 0, %200
  %202 = urem i32 %201, 100
  %203 = udiv i32 %201, 100
  %204 = udiv i32 %203, 8192
  %205 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %203, i32 %202, i32 0
  %206 = load float, ptr %205, align 4, !invariant.load !28
  %207 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %175
  %208 = load float, ptr %207, align 4, !invariant.load !28
  %multiply.2724 = fmul float %206, %208
  %add.2825 = fadd float %add.2223, %multiply.2724
  %209 = mul nuw nsw i32 %180, 1
  %210 = add nuw nsw i32 0, %209
  %211 = urem i32 %210, 100
  %212 = udiv i32 %210, 100
  %213 = udiv i32 %212, 8192
  %214 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %212, i32 %211, i32 0
  %215 = load float, ptr %214, align 4, !invariant.load !28
  %216 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %175
  %217 = load float, ptr %216, align 4, !invariant.load !28
  %multiply.3326 = fmul float %215, %217
  %add.3427 = fadd float %add.2825, %multiply.3326
  %218 = load float, ptr %arg2, align 4, !invariant.load !28
  %219 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %220 = load float, ptr %219, align 4, !invariant.load !28
  %multiply.3928 = fmul float %218, %220
  %add.4029 = fadd float %add.3427, %multiply.3928
  %221 = getelementptr inbounds [4 x float], ptr %arg0, i32 0, i32 %21
  %222 = load float, ptr %221, align 4, !invariant.load !28
  %add.4230 = fadd float %add.4029, %222
  %223 = getelementptr inbounds float, ptr %arg11, i32 %linear_index3
  store float %add.4230, ptr %223, align 4
  br label %fusion_3.in_bounds-after
}

define void @reduce_102(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %result_from_other_lane25 = alloca float, align 4
  %return_buffer24 = alloca float, align 4
  %result_from_other_lane22 = alloca float, align 4
  %return_buffer21 = alloca float, align 4
  %result_from_other_lane19 = alloca float, align 4
  %return_buffer18 = alloca float, align 4
  %result_from_other_lane16 = alloca float, align 4
  %return_buffer15 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer13 = alloca float, align 4
  %tile_loop.invar_address7 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !31
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !28
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
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

is_full_tile-after:                               ; preds = %tile_loop.loop_exit4, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !41

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result14 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result14, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_3(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer15)
  %22 = load float, ptr %return_buffer15, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result17 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result17, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane16, align 4
  call void @region_1_3(ptr %current_output, ptr %result_from_other_lane16, ptr %return_buffer18)
  %24 = load float, ptr %return_buffer18, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result20 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result20, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane19, align 4
  call void @region_1_3(ptr %current_output, ptr %result_from_other_lane19, ptr %return_buffer21)
  %26 = load float, ptr %return_buffer21, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result23 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result23, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane22, align 4
  call void @region_1_3(ptr %current_output, ptr %result_from_other_lane22, ptr %return_buffer24)
  %28 = load float, ptr %return_buffer24, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result26 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result26, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane25, align 4
  call void @region_1_3(ptr %current_output, ptr %result_from_other_lane25, ptr %return_buffer27)
  %30 = load float, ptr %return_buffer27, align 4
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
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 400
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %46
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !28
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %52 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_3(ptr %52, ptr %reduction_input_address, ptr %return_buffer)
  %53 = load float, ptr %return_buffer, align 4
  store float %53, ptr %52, align 4
  br label %tile_loop.loop_header, !llvm.loop !42

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %54 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address7, align 4
  br label %tile_loop.loop_header5

tile_loop.loop_header5:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar8 = load i32, ptr %tile_loop.invar_address7, align 4
  %55 = icmp uge i32 %tile_loop.indvar8, 16
  br i1 %55, label %tile_loop.loop_exit4, label %tile_loop.loop_body6

tile_loop.loop_body6:                             ; preds = %tile_loop.loop_header5
  %invar.inc9 = add nuw nsw i32 %tile_loop.indvar8, 1
  store i32 %invar.inc9, ptr %tile_loop.invar_address7, align 4
  %56 = icmp eq i32 %tile_loop.indvar8, 0
  %57 = mul i32 %tile_loop.indvar8, 32
  %58 = add i32 %57, 0
  %x_loc10 = add i32 %58, %54
  %59 = add i32 %tile_origin.1, %y_in_tile.indvar
  %60 = add i32 %tile_origin.2, %x_loc10
  %61 = icmp ult i32 %x_loc10, %tile_bound1
  br i1 %61, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body6
  br label %tile_loop.loop_header5, !llvm.loop !43

tile_loop.loop_exit4:                             ; preds = %tile_loop.loop_header5
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body6
  %62 = mul nuw nsw i32 %60, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %59, 100
  %65 = add nuw nsw i32 %63, %64
  %66 = mul nuw nsw i32 %tile_origin.0, 3276800
  %67 = add nuw nsw i32 %65, %66
  %68 = udiv i32 %67, 1
  %69 = urem i32 %68, 100
  %70 = udiv i32 %67, 100
  %71 = urem i32 %70, 4
  %72 = udiv i32 %67, 400
  %Arg_0.111 = getelementptr inbounds float, ptr %arg0, i32 %67
  %Arg_0.112 = load float, ptr %Arg_0.111, align 4, !invariant.load !28
  store float %Arg_0.112, ptr %reduction_input_address, align 4
  %73 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_3(ptr %73, ptr %reduction_input_address, ptr %return_buffer13)
  %74 = load float, ptr %return_buffer13, align 4
  store float %74, ptr %73, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %75 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %6, i32 0, i32 %31
  %76 = addrspacecast ptr addrspace(3) %75 to ptr
  %77 = load float, ptr %current_output, align 4
  store float %77, ptr %76, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %78 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %6, i32 0, i32 %lane_id
  %79 = addrspacecast ptr addrspace(3) %78 to ptr
  store float %Arg_1.2, ptr %initial_value_addr, align 4
  %80 = icmp ult i32 %thread_id.x, 1
  %81 = select i1 %80, ptr %79, ptr %initial_value_addr
  %82 = icmp eq i32 %thread_id.x, 0
  br i1 %82, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %83 = mul i32 %thread_id.x, 1
  %84 = add i32 %tile_origin.1, %thread_id.y
  %85 = add i32 %tile_origin.2, %83
  %86 = add i32 %85, 0
  %87 = udiv i32 %84, 1
  %88 = urem i32 %87, 4
  %89 = udiv i32 %84, 4
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr %arg2, i32 0, i32 %89, i32 %88
  %output = load float, ptr %81, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_3(ptr dereferenceable(4) %Arg_0.4.typed, ptr dereferenceable(4) %Arg_1.5.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %maximum.6.typed = alloca float, align 4
  %Arg_0.4 = load float, ptr %Arg_0.4.typed, align 4
  %Arg_1.5 = load float, ptr %Arg_1.5.typed, align 4
  %0 = fcmp oge float %Arg_0.4, %Arg_1.5
  %1 = fcmp une float %Arg_0.4, %Arg_0.4
  %2 = or i1 %0, %1
  %maximum.6 = select i1 %2, float %Arg_0.4, float %Arg_1.5
  store float %maximum.6, ptr %maximum.6.typed, align 4
  %load_ret_value = load float, ptr %maximum.6.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_9(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %result_from_other_lane29 = alloca float, align 4
  %return_buffer28 = alloca float, align 4
  %result_from_other_lane26 = alloca float, align 4
  %return_buffer25 = alloca float, align 4
  %result_from_other_lane23 = alloca float, align 4
  %return_buffer22 = alloca float, align 4
  %result_from_other_lane20 = alloca float, align 4
  %return_buffer19 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %tile_loop.invar_address8 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !31
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @1, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_12_constant_6, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
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

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !44

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %22 = load float, ptr %return_buffer19, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane20, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %24 = load float, ptr %return_buffer22, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane23, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %26 = load float, ptr %return_buffer25, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result27 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane26, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane26, ptr %return_buffer28)
  %28 = load float, ptr %return_buffer28, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result30 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane29, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane29, ptr %return_buffer31)
  %30 = load float, ptr %return_buffer31, align 4
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
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 400
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %46
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !28
  %52 = udiv i32 %46, 100
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %52
  %Arg_1.24 = load float, ptr %Arg_1.2, align 4, !invariant.load !28
  %subtract.4 = fsub float %Arg_0.13, %Arg_1.24
  %53 = call float @__nv_expf(float %subtract.4)
  store float %53, ptr %reduction_input_address, align 4
  %54 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7(ptr %54, ptr %reduction_input_address, ptr %return_buffer)
  %55 = load float, ptr %return_buffer, align 4
  store float %55, ptr %54, align 4
  br label %tile_loop.loop_header, !llvm.loop !45

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %56 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %57 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %57, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %58 = icmp eq i32 %tile_loop.indvar9, 0
  %59 = mul i32 %tile_loop.indvar9, 32
  %60 = add i32 %59, 0
  %x_loc11 = add i32 %60, %56
  %61 = add i32 %tile_origin.1, %y_in_tile.indvar
  %62 = add i32 %tile_origin.2, %x_loc11
  %63 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %63, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !46

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %64 = mul nuw nsw i32 %62, 1
  %65 = add nuw nsw i32 0, %64
  %66 = mul nuw nsw i32 %61, 100
  %67 = add nuw nsw i32 %65, %66
  %68 = mul nuw nsw i32 %tile_origin.0, 3276800
  %69 = add nuw nsw i32 %67, %68
  %70 = udiv i32 %69, 1
  %71 = urem i32 %70, 100
  %72 = udiv i32 %69, 100
  %73 = urem i32 %72, 4
  %74 = udiv i32 %69, 400
  %Arg_0.112 = getelementptr inbounds float, ptr %arg0, i32 %69
  %Arg_0.113 = load float, ptr %Arg_0.112, align 4, !invariant.load !28
  %75 = udiv i32 %69, 100
  %Arg_1.214 = getelementptr inbounds float, ptr %arg1, i32 %75
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !28
  %subtract.416 = fsub float %Arg_0.113, %Arg_1.215
  %76 = call float @__nv_expf(float %subtract.416)
  store float %76, ptr %reduction_input_address, align 4
  %77 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7(ptr %77, ptr %reduction_input_address, ptr %return_buffer17)
  %78 = load float, ptr %return_buffer17, align 4
  store float %78, ptr %77, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %79 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %6, i32 0, i32 %31
  %80 = addrspacecast ptr addrspace(3) %79 to ptr
  %81 = load float, ptr %current_output, align 4
  store float %81, ptr %80, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %82 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %6, i32 0, i32 %lane_id
  %83 = addrspacecast ptr addrspace(3) %82 to ptr
  store float %region_0_12_constant_6, ptr %initial_value_addr, align 4
  %84 = icmp ult i32 %thread_id.x, 1
  %85 = select i1 %84, ptr %83, ptr %initial_value_addr
  %86 = icmp eq i32 %thread_id.x, 0
  br i1 %86, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %87 = mul i32 %thread_id.x, 1
  %88 = add i32 %tile_origin.1, %thread_id.y
  %89 = add i32 %tile_origin.2, %87
  %90 = add i32 %89, 0
  %91 = udiv i32 %88, 1
  %92 = urem i32 %91, 4
  %93 = udiv i32 %88, 4
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr %arg2, i32 0, i32 %93, i32 %92
  %output = load float, ptr %85, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nounwind memory(none)
declare float @__nv_expf(float) #4

define internal void @region_1_7(ptr dereferenceable(4) %Arg_0.8.typed, ptr dereferenceable(4) %Arg_1.9.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.10.typed = alloca float, align 4
  %Arg_0.8 = load float, ptr %Arg_0.8.typed, align 4
  %Arg_1.9 = load float, ptr %Arg_1.9.typed, align 4
  %add.10 = fadd float %Arg_0.8, %Arg_1.9
  store float %add.10, ptr %add.10.typed, align 4
  %load_ret_value = load float, ptr %add.10.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_1(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !39
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 819200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 100
  %5 = udiv i32 %linear_index_base, 100
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index_base, 400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 100
  %10 = udiv i32 %linear_index1, 100
  %11 = urem i32 %10, 4
  %12 = udiv i32 %linear_index1, 400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 100
  %15 = udiv i32 %linear_index2, 100
  %16 = urem i32 %15, 4
  %17 = udiv i32 %linear_index2, 400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 100
  %20 = udiv i32 %linear_index3, 100
  %21 = urem i32 %20, 4
  %22 = udiv i32 %linear_index3, 400
  %23 = icmp ult i32 %linear_index_base, 3276800
  br i1 %23, label %fusion_1.in_bounds-true, label %fusion_1.in_bounds-after

fusion_1.in_bounds-after:                         ; preds = %fusion_1.in_bounds-true, %entry
  ret void

fusion_1.in_bounds-true:                          ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %25 = load float, ptr %24, align 4
  %26 = udiv i32 %linear_index_base, 100
  %27 = getelementptr inbounds float, ptr %arg2, i32 %26
  %28 = load float, ptr %27, align 4, !invariant.load !28
  %subtract.5 = fsub float %25, %28
  %29 = call float @__nv_expf(float %subtract.5)
  %30 = udiv i32 %linear_index_base, 100
  %31 = getelementptr inbounds float, ptr %arg0, i32 %30
  %32 = load float, ptr %31, align 4, !invariant.load !28
  %divide.8 = fdiv float %29, %32
  %33 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %divide.8, ptr %33, align 4
  %34 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %35 = load float, ptr %34, align 4
  %36 = udiv i32 %linear_index1, 100
  %37 = getelementptr inbounds float, ptr %arg2, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !28
  %subtract.51 = fsub float %35, %38
  %39 = call float @__nv_expf(float %subtract.51)
  %40 = udiv i32 %linear_index1, 100
  %41 = getelementptr inbounds float, ptr %arg0, i32 %40
  %42 = load float, ptr %41, align 4, !invariant.load !28
  %divide.82 = fdiv float %39, %42
  %43 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %divide.82, ptr %43, align 4
  %44 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %45 = load float, ptr %44, align 4
  %46 = udiv i32 %linear_index2, 100
  %47 = getelementptr inbounds float, ptr %arg2, i32 %46
  %48 = load float, ptr %47, align 4, !invariant.load !28
  %subtract.53 = fsub float %45, %48
  %49 = call float @__nv_expf(float %subtract.53)
  %50 = udiv i32 %linear_index2, 100
  %51 = getelementptr inbounds float, ptr %arg0, i32 %50
  %52 = load float, ptr %51, align 4, !invariant.load !28
  %divide.84 = fdiv float %49, %52
  %53 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %divide.84, ptr %53, align 4
  %54 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %55 = load float, ptr %54, align 4
  %56 = udiv i32 %linear_index3, 100
  %57 = getelementptr inbounds float, ptr %arg2, i32 %56
  %58 = load float, ptr %57, align 4, !invariant.load !28
  %subtract.55 = fsub float %55, %58
  %59 = call float @__nv_expf(float %subtract.55)
  %60 = udiv i32 %linear_index3, 100
  %61 = getelementptr inbounds float, ptr %arg0, i32 %60
  %62 = load float, ptr %61, align 4, !invariant.load !28
  %divide.86 = fdiv float %59, %62
  %63 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %divide.86, ptr %63, align 4
  br label %fusion_1.in_bounds-after
}

define void @transpose_219(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !39
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 819200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index_base, 4
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 4
  %10 = udiv i32 %linear_index1, 4
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 4
  %15 = udiv i32 %linear_index2, 4
  %16 = urem i32 %15, 100
  %17 = udiv i32 %linear_index2, 400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 4
  %20 = udiv i32 %linear_index3, 4
  %21 = urem i32 %20, 100
  %22 = udiv i32 %linear_index3, 400
  %23 = icmp ult i32 %linear_index_base, 3276800
  br i1 %23, label %transpose_219.in_bounds-true, label %transpose_219.in_bounds-after

transpose_219.in_bounds-after:                    ; preds = %transpose_219.in_bounds-true, %entry
  ret void

transpose_219.in_bounds-true:                     ; preds = %entry
  %24 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %7, i32 %4, i32 %6
  %25 = load float, ptr %24, align 4, !invariant.load !28
  %26 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %25, ptr %26, align 4
  %27 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %12, i32 %9, i32 %11
  %28 = load float, ptr %27, align 4, !invariant.load !28
  %29 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %28, ptr %29, align 4
  %30 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %17, i32 %14, i32 %16
  %31 = load float, ptr %30, align 4, !invariant.load !28
  %32 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %31, ptr %32, align 4
  %33 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %22, i32 %19, i32 %21
  %34 = load float, ptr %33, align 4, !invariant.load !28
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %34, ptr %35, align 4
  br label %transpose_219.in_bounds-after
}

define void @fusion_7(ptr noalias align 16 dereferenceable(209715200) %arg0, ptr noalias align 16 dereferenceable(209715200) %arg1, ptr noalias align 16 dereferenceable(26214400) %arg2, ptr noalias align 16 dereferenceable(26214400) %arg3, ptr noalias align 16 dereferenceable(26214400) %arg4, ptr noalias align 16 dereferenceable(26214400) %arg5, ptr noalias align 16 dereferenceable(26214400) %arg6, ptr noalias align 16 dereferenceable(209715200) %arg7, ptr noalias align 128 dereferenceable(760217600) %arg8) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 47513600
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 232
  %5 = udiv i32 %linear_index_base, 232
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 232
  %8 = udiv i32 %linear_index1, 232
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 232
  %11 = udiv i32 %linear_index2, 232
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 232
  %14 = udiv i32 %linear_index3, 232
  %15 = icmp ult i32 %linear_index_base, 190054400
  br i1 %15, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %concatenate.10.merge56, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 232
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 100
  %22 = udiv i32 %20, 100
  %23 = udiv i32 %22, 8192
  br label %concatenate.pivot.144.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %17, %24
  %26 = udiv i32 %linear_index_base, 232
  %27 = mul i32 %26, 64
  %28 = add i32 %27, %25
  %29 = udiv i32 %28, 1
  %30 = urem i32 %29, 64
  %31 = udiv i32 %28, 64
  %32 = urem i32 %31, 100
  %33 = udiv i32 %28, 6400
  %34 = getelementptr inbounds float, ptr %arg0, i32 %28
  %35 = load float, ptr %34, align 4, !invariant.load !28
  br label %concatenate.10.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.1
  %36 = phi i32 [ 64, %concatenate.pivot.64.1 ]
  %37 = sub nsw i32 %17, %36
  %38 = udiv i32 %linear_index_base, 232
  %39 = mul i32 %38, 64
  %40 = add i32 %39, %37
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 64
  %43 = udiv i32 %40, 64
  %44 = urem i32 %43, 100
  %45 = udiv i32 %40, 6400
  %46 = getelementptr inbounds float, ptr %arg1, i32 %40
  %47 = load float, ptr %46, align 4, !invariant.load !28
  br label %concatenate.10.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.128.2
  %48 = phi i32 [ 128, %concatenate.pivot.128.2 ]
  %49 = sub nsw i32 %17, %48
  %50 = udiv i32 %linear_index_base, 232
  %51 = mul i32 %50, 8
  %52 = add i32 %51, %49
  %53 = udiv i32 %52, 1
  %54 = urem i32 %53, 8
  %55 = udiv i32 %52, 8
  %56 = urem i32 %55, 100
  %57 = udiv i32 %52, 800
  %58 = getelementptr inbounds float, ptr %arg2, i32 %52
  %59 = load float, ptr %58, align 4, !invariant.load !28
  br label %concatenate.10.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.136.3
  %60 = phi i32 [ 136, %concatenate.pivot.136.3 ]
  %61 = sub nsw i32 %17, %60
  %62 = udiv i32 %linear_index_base, 232
  %63 = mul i32 %62, 8
  %64 = add i32 %63, %61
  %65 = udiv i32 %64, 1
  %66 = urem i32 %65, 8
  %67 = udiv i32 %64, 8
  %68 = urem i32 %67, 100
  %69 = udiv i32 %64, 800
  %70 = getelementptr inbounds float, ptr %arg3, i32 %64
  %71 = load float, ptr %70, align 4, !invariant.load !28
  br label %concatenate.10.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.144.4
  %72 = phi i32 [ 144, %concatenate.pivot.144.4 ]
  %73 = sub nsw i32 %17, %72
  %74 = udiv i32 %linear_index_base, 232
  %75 = mul i32 %74, 8
  %76 = add i32 %75, %73
  %77 = udiv i32 %76, 1
  %78 = urem i32 %77, 8
  %79 = udiv i32 %76, 8
  %80 = urem i32 %79, 100
  %81 = udiv i32 %76, 800
  %82 = getelementptr inbounds float, ptr %arg4, i32 %76
  %83 = load float, ptr %82, align 4, !invariant.load !28
  br label %concatenate.10.merge

concat_index_from_operand_id5:                    ; preds = %concatenate.pivot.152.5
  %84 = phi i32 [ 152, %concatenate.pivot.152.5 ]
  %85 = sub nsw i32 %17, %84
  %86 = udiv i32 %linear_index_base, 232
  %87 = mul i32 %86, 8
  %88 = add i32 %87, %85
  %89 = udiv i32 %88, 1
  %90 = urem i32 %89, 8
  %91 = udiv i32 %88, 8
  %92 = urem i32 %91, 100
  %93 = udiv i32 %88, 800
  %94 = getelementptr inbounds float, ptr %arg5, i32 %88
  %95 = load float, ptr %94, align 4, !invariant.load !28
  br label %concatenate.10.merge

concat_index_from_operand_id6:                    ; preds = %concatenate.pivot.160.6
  %96 = phi i32 [ 160, %concatenate.pivot.160.6 ]
  %97 = sub nsw i32 %17, %96
  %98 = udiv i32 %linear_index_base, 232
  %99 = mul i32 %98, 8
  %100 = add i32 %99, %97
  %101 = udiv i32 %100, 1
  %102 = urem i32 %101, 8
  %103 = udiv i32 %100, 8
  %104 = urem i32 %103, 100
  %105 = udiv i32 %100, 800
  %106 = getelementptr inbounds float, ptr %arg6, i32 %100
  %107 = load float, ptr %106, align 4, !invariant.load !28
  br label %concatenate.10.merge

concat_index_from_operand_id7:                    ; preds = %concatenate.pivot.168.7
  %108 = phi i32 [ 168, %concatenate.pivot.168.7 ]
  %109 = sub nsw i32 %17, %108
  %110 = udiv i32 %linear_index_base, 232
  %111 = mul i32 %110, 64
  %112 = add i32 %111, %109
  %113 = udiv i32 %112, 1
  %114 = urem i32 %113, 64
  %115 = udiv i32 %112, 64
  %116 = urem i32 %115, 100
  %117 = udiv i32 %112, 6400
  %118 = mul nuw nsw i32 %109, 1
  %119 = add nuw nsw i32 0, %118
  %120 = mul nuw nsw i32 %21, 64
  %121 = add nuw nsw i32 %119, %120
  %122 = udiv i32 %121, 6400
  %123 = mul nuw nsw i32 %22, 1
  %124 = add nuw nsw i32 0, %123
  %125 = udiv i32 %124, 8192
  %126 = getelementptr inbounds float, ptr %arg7, i32 %112
  %127 = load float, ptr %126, align 4, !invariant.load !28
  br label %concatenate.10.merge

concatenate.pivot.144.:                           ; preds = %fusion_7.in_bounds-true
  %128 = icmp ult i32 %17, 144
  br i1 %128, label %concatenate.pivot.128., label %concatenate.pivot.160.

concatenate.pivot.128.:                           ; preds = %concatenate.pivot.144.
  %129 = icmp ult i32 %17, 128
  br i1 %129, label %concatenate.pivot.64., label %concatenate.pivot.136.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.128.
  %130 = icmp ult i32 %17, 64
  br i1 %130, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.pivot.136.:                           ; preds = %concatenate.pivot.128.
  %131 = icmp ult i32 %17, 136
  br i1 %131, label %concatenate.pivot.128.2, label %concatenate.pivot.136.3

concatenate.pivot.128.2:                          ; preds = %concatenate.pivot.136.
  br label %concat_index_from_operand_id2

concatenate.pivot.136.3:                          ; preds = %concatenate.pivot.136.
  br label %concat_index_from_operand_id3

concatenate.pivot.160.:                           ; preds = %concatenate.pivot.144.
  %132 = icmp ult i32 %17, 160
  br i1 %132, label %concatenate.pivot.152., label %concatenate.pivot.168.

concatenate.pivot.152.:                           ; preds = %concatenate.pivot.160.
  %133 = icmp ult i32 %17, 152
  br i1 %133, label %concatenate.pivot.144.4, label %concatenate.pivot.152.5

concatenate.pivot.144.4:                          ; preds = %concatenate.pivot.152.
  br label %concat_index_from_operand_id4

concatenate.pivot.152.5:                          ; preds = %concatenate.pivot.152.
  br label %concat_index_from_operand_id5

concatenate.pivot.168.:                           ; preds = %concatenate.pivot.160.
  %134 = icmp ult i32 %17, 168
  br i1 %134, label %concatenate.pivot.160.6, label %concatenate.pivot.168.7

concatenate.pivot.160.6:                          ; preds = %concatenate.pivot.168.
  br label %concat_index_from_operand_id6

concatenate.pivot.168.7:                          ; preds = %concatenate.pivot.168.
  br label %concat_index_from_operand_id7

concatenate.10.merge:                             ; preds = %concat_index_from_operand_id7, %concat_index_from_operand_id6, %concat_index_from_operand_id5, %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %135 = phi float [ %35, %concat_index_from_operand_id0 ], [ %47, %concat_index_from_operand_id1 ], [ %59, %concat_index_from_operand_id2 ], [ %71, %concat_index_from_operand_id3 ], [ %83, %concat_index_from_operand_id4 ], [ %95, %concat_index_from_operand_id5 ], [ %107, %concat_index_from_operand_id6 ], [ %127, %concat_index_from_operand_id7 ]
  %136 = getelementptr inbounds float, ptr %arg8, i32 %linear_index_base
  store float %135, ptr %136, align 4
  %137 = mul nuw nsw i32 %7, 1
  %138 = add nuw nsw i32 0, %137
  %139 = udiv i32 %138, 232
  %140 = mul nuw nsw i32 %8, 1
  %141 = add nuw nsw i32 0, %140
  %142 = urem i32 %141, 100
  %143 = udiv i32 %141, 100
  %144 = udiv i32 %143, 8192
  br label %concatenate.pivot.144.17

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.20
  %145 = phi i32 [ 0, %concatenate.pivot.0.20 ]
  %146 = sub nsw i32 %138, %145
  %147 = udiv i32 %linear_index1, 232
  %148 = mul i32 %147, 64
  %149 = add i32 %148, %146
  %150 = udiv i32 %149, 1
  %151 = urem i32 %150, 64
  %152 = udiv i32 %149, 64
  %153 = urem i32 %152, 100
  %154 = udiv i32 %149, 6400
  %155 = getelementptr inbounds float, ptr %arg0, i32 %149
  %156 = load float, ptr %155, align 4, !invariant.load !28
  br label %concatenate.10.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.64.21
  %157 = phi i32 [ 64, %concatenate.pivot.64.21 ]
  %158 = sub nsw i32 %138, %157
  %159 = udiv i32 %linear_index1, 232
  %160 = mul i32 %159, 64
  %161 = add i32 %160, %158
  %162 = udiv i32 %161, 1
  %163 = urem i32 %162, 64
  %164 = udiv i32 %161, 64
  %165 = urem i32 %164, 100
  %166 = udiv i32 %161, 6400
  %167 = getelementptr inbounds float, ptr %arg1, i32 %161
  %168 = load float, ptr %167, align 4, !invariant.load !28
  br label %concatenate.10.merge8

concat_index_from_operand_id211:                  ; preds = %concatenate.pivot.128.23
  %169 = phi i32 [ 128, %concatenate.pivot.128.23 ]
  %170 = sub nsw i32 %138, %169
  %171 = udiv i32 %linear_index1, 232
  %172 = mul i32 %171, 8
  %173 = add i32 %172, %170
  %174 = udiv i32 %173, 1
  %175 = urem i32 %174, 8
  %176 = udiv i32 %173, 8
  %177 = urem i32 %176, 100
  %178 = udiv i32 %173, 800
  %179 = getelementptr inbounds float, ptr %arg2, i32 %173
  %180 = load float, ptr %179, align 4, !invariant.load !28
  br label %concatenate.10.merge8

concat_index_from_operand_id312:                  ; preds = %concatenate.pivot.136.24
  %181 = phi i32 [ 136, %concatenate.pivot.136.24 ]
  %182 = sub nsw i32 %138, %181
  %183 = udiv i32 %linear_index1, 232
  %184 = mul i32 %183, 8
  %185 = add i32 %184, %182
  %186 = udiv i32 %185, 1
  %187 = urem i32 %186, 8
  %188 = udiv i32 %185, 8
  %189 = urem i32 %188, 100
  %190 = udiv i32 %185, 800
  %191 = getelementptr inbounds float, ptr %arg3, i32 %185
  %192 = load float, ptr %191, align 4, !invariant.load !28
  br label %concatenate.10.merge8

concat_index_from_operand_id413:                  ; preds = %concatenate.pivot.144.27
  %193 = phi i32 [ 144, %concatenate.pivot.144.27 ]
  %194 = sub nsw i32 %138, %193
  %195 = udiv i32 %linear_index1, 232
  %196 = mul i32 %195, 8
  %197 = add i32 %196, %194
  %198 = udiv i32 %197, 1
  %199 = urem i32 %198, 8
  %200 = udiv i32 %197, 8
  %201 = urem i32 %200, 100
  %202 = udiv i32 %197, 800
  %203 = getelementptr inbounds float, ptr %arg4, i32 %197
  %204 = load float, ptr %203, align 4, !invariant.load !28
  br label %concatenate.10.merge8

concat_index_from_operand_id514:                  ; preds = %concatenate.pivot.152.28
  %205 = phi i32 [ 152, %concatenate.pivot.152.28 ]
  %206 = sub nsw i32 %138, %205
  %207 = udiv i32 %linear_index1, 232
  %208 = mul i32 %207, 8
  %209 = add i32 %208, %206
  %210 = udiv i32 %209, 1
  %211 = urem i32 %210, 8
  %212 = udiv i32 %209, 8
  %213 = urem i32 %212, 100
  %214 = udiv i32 %209, 800
  %215 = getelementptr inbounds float, ptr %arg5, i32 %209
  %216 = load float, ptr %215, align 4, !invariant.load !28
  br label %concatenate.10.merge8

concat_index_from_operand_id615:                  ; preds = %concatenate.pivot.160.30
  %217 = phi i32 [ 160, %concatenate.pivot.160.30 ]
  %218 = sub nsw i32 %138, %217
  %219 = udiv i32 %linear_index1, 232
  %220 = mul i32 %219, 8
  %221 = add i32 %220, %218
  %222 = udiv i32 %221, 1
  %223 = urem i32 %222, 8
  %224 = udiv i32 %221, 8
  %225 = urem i32 %224, 100
  %226 = udiv i32 %221, 800
  %227 = getelementptr inbounds float, ptr %arg6, i32 %221
  %228 = load float, ptr %227, align 4, !invariant.load !28
  br label %concatenate.10.merge8

concat_index_from_operand_id716:                  ; preds = %concatenate.pivot.168.31
  %229 = phi i32 [ 168, %concatenate.pivot.168.31 ]
  %230 = sub nsw i32 %138, %229
  %231 = udiv i32 %linear_index1, 232
  %232 = mul i32 %231, 64
  %233 = add i32 %232, %230
  %234 = udiv i32 %233, 1
  %235 = urem i32 %234, 64
  %236 = udiv i32 %233, 64
  %237 = urem i32 %236, 100
  %238 = udiv i32 %233, 6400
  %239 = mul nuw nsw i32 %230, 1
  %240 = add nuw nsw i32 0, %239
  %241 = mul nuw nsw i32 %142, 64
  %242 = add nuw nsw i32 %240, %241
  %243 = udiv i32 %242, 6400
  %244 = mul nuw nsw i32 %143, 1
  %245 = add nuw nsw i32 0, %244
  %246 = udiv i32 %245, 8192
  %247 = getelementptr inbounds float, ptr %arg7, i32 %233
  %248 = load float, ptr %247, align 4, !invariant.load !28
  br label %concatenate.10.merge8

concatenate.pivot.144.17:                         ; preds = %concatenate.10.merge
  %249 = icmp ult i32 %138, 144
  br i1 %249, label %concatenate.pivot.128.18, label %concatenate.pivot.160.25

concatenate.pivot.128.18:                         ; preds = %concatenate.pivot.144.17
  %250 = icmp ult i32 %138, 128
  br i1 %250, label %concatenate.pivot.64.19, label %concatenate.pivot.136.22

concatenate.pivot.64.19:                          ; preds = %concatenate.pivot.128.18
  %251 = icmp ult i32 %138, 64
  br i1 %251, label %concatenate.pivot.0.20, label %concatenate.pivot.64.21

concatenate.pivot.0.20:                           ; preds = %concatenate.pivot.64.19
  br label %concat_index_from_operand_id09

concatenate.pivot.64.21:                          ; preds = %concatenate.pivot.64.19
  br label %concat_index_from_operand_id110

concatenate.pivot.136.22:                         ; preds = %concatenate.pivot.128.18
  %252 = icmp ult i32 %138, 136
  br i1 %252, label %concatenate.pivot.128.23, label %concatenate.pivot.136.24

concatenate.pivot.128.23:                         ; preds = %concatenate.pivot.136.22
  br label %concat_index_from_operand_id211

concatenate.pivot.136.24:                         ; preds = %concatenate.pivot.136.22
  br label %concat_index_from_operand_id312

concatenate.pivot.160.25:                         ; preds = %concatenate.pivot.144.17
  %253 = icmp ult i32 %138, 160
  br i1 %253, label %concatenate.pivot.152.26, label %concatenate.pivot.168.29

concatenate.pivot.152.26:                         ; preds = %concatenate.pivot.160.25
  %254 = icmp ult i32 %138, 152
  br i1 %254, label %concatenate.pivot.144.27, label %concatenate.pivot.152.28

concatenate.pivot.144.27:                         ; preds = %concatenate.pivot.152.26
  br label %concat_index_from_operand_id413

concatenate.pivot.152.28:                         ; preds = %concatenate.pivot.152.26
  br label %concat_index_from_operand_id514

concatenate.pivot.168.29:                         ; preds = %concatenate.pivot.160.25
  %255 = icmp ult i32 %138, 168
  br i1 %255, label %concatenate.pivot.160.30, label %concatenate.pivot.168.31

concatenate.pivot.160.30:                         ; preds = %concatenate.pivot.168.29
  br label %concat_index_from_operand_id615

concatenate.pivot.168.31:                         ; preds = %concatenate.pivot.168.29
  br label %concat_index_from_operand_id716

concatenate.10.merge8:                            ; preds = %concat_index_from_operand_id716, %concat_index_from_operand_id615, %concat_index_from_operand_id514, %concat_index_from_operand_id413, %concat_index_from_operand_id312, %concat_index_from_operand_id211, %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %256 = phi float [ %156, %concat_index_from_operand_id09 ], [ %168, %concat_index_from_operand_id110 ], [ %180, %concat_index_from_operand_id211 ], [ %192, %concat_index_from_operand_id312 ], [ %204, %concat_index_from_operand_id413 ], [ %216, %concat_index_from_operand_id514 ], [ %228, %concat_index_from_operand_id615 ], [ %248, %concat_index_from_operand_id716 ]
  %257 = getelementptr inbounds float, ptr %arg8, i32 %linear_index1
  store float %256, ptr %257, align 4
  %258 = mul nuw nsw i32 %10, 1
  %259 = add nuw nsw i32 0, %258
  %260 = udiv i32 %259, 232
  %261 = mul nuw nsw i32 %11, 1
  %262 = add nuw nsw i32 0, %261
  %263 = urem i32 %262, 100
  %264 = udiv i32 %262, 100
  %265 = udiv i32 %264, 8192
  br label %concatenate.pivot.144.41

concat_index_from_operand_id033:                  ; preds = %concatenate.pivot.0.44
  %266 = phi i32 [ 0, %concatenate.pivot.0.44 ]
  %267 = sub nsw i32 %259, %266
  %268 = udiv i32 %linear_index2, 232
  %269 = mul i32 %268, 64
  %270 = add i32 %269, %267
  %271 = udiv i32 %270, 1
  %272 = urem i32 %271, 64
  %273 = udiv i32 %270, 64
  %274 = urem i32 %273, 100
  %275 = udiv i32 %270, 6400
  %276 = getelementptr inbounds float, ptr %arg0, i32 %270
  %277 = load float, ptr %276, align 4, !invariant.load !28
  br label %concatenate.10.merge32

concat_index_from_operand_id134:                  ; preds = %concatenate.pivot.64.45
  %278 = phi i32 [ 64, %concatenate.pivot.64.45 ]
  %279 = sub nsw i32 %259, %278
  %280 = udiv i32 %linear_index2, 232
  %281 = mul i32 %280, 64
  %282 = add i32 %281, %279
  %283 = udiv i32 %282, 1
  %284 = urem i32 %283, 64
  %285 = udiv i32 %282, 64
  %286 = urem i32 %285, 100
  %287 = udiv i32 %282, 6400
  %288 = getelementptr inbounds float, ptr %arg1, i32 %282
  %289 = load float, ptr %288, align 4, !invariant.load !28
  br label %concatenate.10.merge32

concat_index_from_operand_id235:                  ; preds = %concatenate.pivot.128.47
  %290 = phi i32 [ 128, %concatenate.pivot.128.47 ]
  %291 = sub nsw i32 %259, %290
  %292 = udiv i32 %linear_index2, 232
  %293 = mul i32 %292, 8
  %294 = add i32 %293, %291
  %295 = udiv i32 %294, 1
  %296 = urem i32 %295, 8
  %297 = udiv i32 %294, 8
  %298 = urem i32 %297, 100
  %299 = udiv i32 %294, 800
  %300 = getelementptr inbounds float, ptr %arg2, i32 %294
  %301 = load float, ptr %300, align 4, !invariant.load !28
  br label %concatenate.10.merge32

concat_index_from_operand_id336:                  ; preds = %concatenate.pivot.136.48
  %302 = phi i32 [ 136, %concatenate.pivot.136.48 ]
  %303 = sub nsw i32 %259, %302
  %304 = udiv i32 %linear_index2, 232
  %305 = mul i32 %304, 8
  %306 = add i32 %305, %303
  %307 = udiv i32 %306, 1
  %308 = urem i32 %307, 8
  %309 = udiv i32 %306, 8
  %310 = urem i32 %309, 100
  %311 = udiv i32 %306, 800
  %312 = getelementptr inbounds float, ptr %arg3, i32 %306
  %313 = load float, ptr %312, align 4, !invariant.load !28
  br label %concatenate.10.merge32

concat_index_from_operand_id437:                  ; preds = %concatenate.pivot.144.51
  %314 = phi i32 [ 144, %concatenate.pivot.144.51 ]
  %315 = sub nsw i32 %259, %314
  %316 = udiv i32 %linear_index2, 232
  %317 = mul i32 %316, 8
  %318 = add i32 %317, %315
  %319 = udiv i32 %318, 1
  %320 = urem i32 %319, 8
  %321 = udiv i32 %318, 8
  %322 = urem i32 %321, 100
  %323 = udiv i32 %318, 800
  %324 = getelementptr inbounds float, ptr %arg4, i32 %318
  %325 = load float, ptr %324, align 4, !invariant.load !28
  br label %concatenate.10.merge32

concat_index_from_operand_id538:                  ; preds = %concatenate.pivot.152.52
  %326 = phi i32 [ 152, %concatenate.pivot.152.52 ]
  %327 = sub nsw i32 %259, %326
  %328 = udiv i32 %linear_index2, 232
  %329 = mul i32 %328, 8
  %330 = add i32 %329, %327
  %331 = udiv i32 %330, 1
  %332 = urem i32 %331, 8
  %333 = udiv i32 %330, 8
  %334 = urem i32 %333, 100
  %335 = udiv i32 %330, 800
  %336 = getelementptr inbounds float, ptr %arg5, i32 %330
  %337 = load float, ptr %336, align 4, !invariant.load !28
  br label %concatenate.10.merge32

concat_index_from_operand_id639:                  ; preds = %concatenate.pivot.160.54
  %338 = phi i32 [ 160, %concatenate.pivot.160.54 ]
  %339 = sub nsw i32 %259, %338
  %340 = udiv i32 %linear_index2, 232
  %341 = mul i32 %340, 8
  %342 = add i32 %341, %339
  %343 = udiv i32 %342, 1
  %344 = urem i32 %343, 8
  %345 = udiv i32 %342, 8
  %346 = urem i32 %345, 100
  %347 = udiv i32 %342, 800
  %348 = getelementptr inbounds float, ptr %arg6, i32 %342
  %349 = load float, ptr %348, align 4, !invariant.load !28
  br label %concatenate.10.merge32

concat_index_from_operand_id740:                  ; preds = %concatenate.pivot.168.55
  %350 = phi i32 [ 168, %concatenate.pivot.168.55 ]
  %351 = sub nsw i32 %259, %350
  %352 = udiv i32 %linear_index2, 232
  %353 = mul i32 %352, 64
  %354 = add i32 %353, %351
  %355 = udiv i32 %354, 1
  %356 = urem i32 %355, 64
  %357 = udiv i32 %354, 64
  %358 = urem i32 %357, 100
  %359 = udiv i32 %354, 6400
  %360 = mul nuw nsw i32 %351, 1
  %361 = add nuw nsw i32 0, %360
  %362 = mul nuw nsw i32 %263, 64
  %363 = add nuw nsw i32 %361, %362
  %364 = udiv i32 %363, 6400
  %365 = mul nuw nsw i32 %264, 1
  %366 = add nuw nsw i32 0, %365
  %367 = udiv i32 %366, 8192
  %368 = getelementptr inbounds float, ptr %arg7, i32 %354
  %369 = load float, ptr %368, align 4, !invariant.load !28
  br label %concatenate.10.merge32

concatenate.pivot.144.41:                         ; preds = %concatenate.10.merge8
  %370 = icmp ult i32 %259, 144
  br i1 %370, label %concatenate.pivot.128.42, label %concatenate.pivot.160.49

concatenate.pivot.128.42:                         ; preds = %concatenate.pivot.144.41
  %371 = icmp ult i32 %259, 128
  br i1 %371, label %concatenate.pivot.64.43, label %concatenate.pivot.136.46

concatenate.pivot.64.43:                          ; preds = %concatenate.pivot.128.42
  %372 = icmp ult i32 %259, 64
  br i1 %372, label %concatenate.pivot.0.44, label %concatenate.pivot.64.45

concatenate.pivot.0.44:                           ; preds = %concatenate.pivot.64.43
  br label %concat_index_from_operand_id033

concatenate.pivot.64.45:                          ; preds = %concatenate.pivot.64.43
  br label %concat_index_from_operand_id134

concatenate.pivot.136.46:                         ; preds = %concatenate.pivot.128.42
  %373 = icmp ult i32 %259, 136
  br i1 %373, label %concatenate.pivot.128.47, label %concatenate.pivot.136.48

concatenate.pivot.128.47:                         ; preds = %concatenate.pivot.136.46
  br label %concat_index_from_operand_id235

concatenate.pivot.136.48:                         ; preds = %concatenate.pivot.136.46
  br label %concat_index_from_operand_id336

concatenate.pivot.160.49:                         ; preds = %concatenate.pivot.144.41
  %374 = icmp ult i32 %259, 160
  br i1 %374, label %concatenate.pivot.152.50, label %concatenate.pivot.168.53

concatenate.pivot.152.50:                         ; preds = %concatenate.pivot.160.49
  %375 = icmp ult i32 %259, 152
  br i1 %375, label %concatenate.pivot.144.51, label %concatenate.pivot.152.52

concatenate.pivot.144.51:                         ; preds = %concatenate.pivot.152.50
  br label %concat_index_from_operand_id437

concatenate.pivot.152.52:                         ; preds = %concatenate.pivot.152.50
  br label %concat_index_from_operand_id538

concatenate.pivot.168.53:                         ; preds = %concatenate.pivot.160.49
  %376 = icmp ult i32 %259, 168
  br i1 %376, label %concatenate.pivot.160.54, label %concatenate.pivot.168.55

concatenate.pivot.160.54:                         ; preds = %concatenate.pivot.168.53
  br label %concat_index_from_operand_id639

concatenate.pivot.168.55:                         ; preds = %concatenate.pivot.168.53
  br label %concat_index_from_operand_id740

concatenate.10.merge32:                           ; preds = %concat_index_from_operand_id740, %concat_index_from_operand_id639, %concat_index_from_operand_id538, %concat_index_from_operand_id437, %concat_index_from_operand_id336, %concat_index_from_operand_id235, %concat_index_from_operand_id134, %concat_index_from_operand_id033
  %377 = phi float [ %277, %concat_index_from_operand_id033 ], [ %289, %concat_index_from_operand_id134 ], [ %301, %concat_index_from_operand_id235 ], [ %313, %concat_index_from_operand_id336 ], [ %325, %concat_index_from_operand_id437 ], [ %337, %concat_index_from_operand_id538 ], [ %349, %concat_index_from_operand_id639 ], [ %369, %concat_index_from_operand_id740 ]
  %378 = getelementptr inbounds float, ptr %arg8, i32 %linear_index2
  store float %377, ptr %378, align 4
  %379 = mul nuw nsw i32 %13, 1
  %380 = add nuw nsw i32 0, %379
  %381 = udiv i32 %380, 232
  %382 = mul nuw nsw i32 %14, 1
  %383 = add nuw nsw i32 0, %382
  %384 = urem i32 %383, 100
  %385 = udiv i32 %383, 100
  %386 = udiv i32 %385, 8192
  br label %concatenate.pivot.144.65

concat_index_from_operand_id057:                  ; preds = %concatenate.pivot.0.68
  %387 = phi i32 [ 0, %concatenate.pivot.0.68 ]
  %388 = sub nsw i32 %380, %387
  %389 = udiv i32 %linear_index3, 232
  %390 = mul i32 %389, 64
  %391 = add i32 %390, %388
  %392 = udiv i32 %391, 1
  %393 = urem i32 %392, 64
  %394 = udiv i32 %391, 64
  %395 = urem i32 %394, 100
  %396 = udiv i32 %391, 6400
  %397 = getelementptr inbounds float, ptr %arg0, i32 %391
  %398 = load float, ptr %397, align 4, !invariant.load !28
  br label %concatenate.10.merge56

concat_index_from_operand_id158:                  ; preds = %concatenate.pivot.64.69
  %399 = phi i32 [ 64, %concatenate.pivot.64.69 ]
  %400 = sub nsw i32 %380, %399
  %401 = udiv i32 %linear_index3, 232
  %402 = mul i32 %401, 64
  %403 = add i32 %402, %400
  %404 = udiv i32 %403, 1
  %405 = urem i32 %404, 64
  %406 = udiv i32 %403, 64
  %407 = urem i32 %406, 100
  %408 = udiv i32 %403, 6400
  %409 = getelementptr inbounds float, ptr %arg1, i32 %403
  %410 = load float, ptr %409, align 4, !invariant.load !28
  br label %concatenate.10.merge56

concat_index_from_operand_id259:                  ; preds = %concatenate.pivot.128.71
  %411 = phi i32 [ 128, %concatenate.pivot.128.71 ]
  %412 = sub nsw i32 %380, %411
  %413 = udiv i32 %linear_index3, 232
  %414 = mul i32 %413, 8
  %415 = add i32 %414, %412
  %416 = udiv i32 %415, 1
  %417 = urem i32 %416, 8
  %418 = udiv i32 %415, 8
  %419 = urem i32 %418, 100
  %420 = udiv i32 %415, 800
  %421 = getelementptr inbounds float, ptr %arg2, i32 %415
  %422 = load float, ptr %421, align 4, !invariant.load !28
  br label %concatenate.10.merge56

concat_index_from_operand_id360:                  ; preds = %concatenate.pivot.136.72
  %423 = phi i32 [ 136, %concatenate.pivot.136.72 ]
  %424 = sub nsw i32 %380, %423
  %425 = udiv i32 %linear_index3, 232
  %426 = mul i32 %425, 8
  %427 = add i32 %426, %424
  %428 = udiv i32 %427, 1
  %429 = urem i32 %428, 8
  %430 = udiv i32 %427, 8
  %431 = urem i32 %430, 100
  %432 = udiv i32 %427, 800
  %433 = getelementptr inbounds float, ptr %arg3, i32 %427
  %434 = load float, ptr %433, align 4, !invariant.load !28
  br label %concatenate.10.merge56

concat_index_from_operand_id461:                  ; preds = %concatenate.pivot.144.75
  %435 = phi i32 [ 144, %concatenate.pivot.144.75 ]
  %436 = sub nsw i32 %380, %435
  %437 = udiv i32 %linear_index3, 232
  %438 = mul i32 %437, 8
  %439 = add i32 %438, %436
  %440 = udiv i32 %439, 1
  %441 = urem i32 %440, 8
  %442 = udiv i32 %439, 8
  %443 = urem i32 %442, 100
  %444 = udiv i32 %439, 800
  %445 = getelementptr inbounds float, ptr %arg4, i32 %439
  %446 = load float, ptr %445, align 4, !invariant.load !28
  br label %concatenate.10.merge56

concat_index_from_operand_id562:                  ; preds = %concatenate.pivot.152.76
  %447 = phi i32 [ 152, %concatenate.pivot.152.76 ]
  %448 = sub nsw i32 %380, %447
  %449 = udiv i32 %linear_index3, 232
  %450 = mul i32 %449, 8
  %451 = add i32 %450, %448
  %452 = udiv i32 %451, 1
  %453 = urem i32 %452, 8
  %454 = udiv i32 %451, 8
  %455 = urem i32 %454, 100
  %456 = udiv i32 %451, 800
  %457 = getelementptr inbounds float, ptr %arg5, i32 %451
  %458 = load float, ptr %457, align 4, !invariant.load !28
  br label %concatenate.10.merge56

concat_index_from_operand_id663:                  ; preds = %concatenate.pivot.160.78
  %459 = phi i32 [ 160, %concatenate.pivot.160.78 ]
  %460 = sub nsw i32 %380, %459
  %461 = udiv i32 %linear_index3, 232
  %462 = mul i32 %461, 8
  %463 = add i32 %462, %460
  %464 = udiv i32 %463, 1
  %465 = urem i32 %464, 8
  %466 = udiv i32 %463, 8
  %467 = urem i32 %466, 100
  %468 = udiv i32 %463, 800
  %469 = getelementptr inbounds float, ptr %arg6, i32 %463
  %470 = load float, ptr %469, align 4, !invariant.load !28
  br label %concatenate.10.merge56

concat_index_from_operand_id764:                  ; preds = %concatenate.pivot.168.79
  %471 = phi i32 [ 168, %concatenate.pivot.168.79 ]
  %472 = sub nsw i32 %380, %471
  %473 = udiv i32 %linear_index3, 232
  %474 = mul i32 %473, 64
  %475 = add i32 %474, %472
  %476 = udiv i32 %475, 1
  %477 = urem i32 %476, 64
  %478 = udiv i32 %475, 64
  %479 = urem i32 %478, 100
  %480 = udiv i32 %475, 6400
  %481 = mul nuw nsw i32 %472, 1
  %482 = add nuw nsw i32 0, %481
  %483 = mul nuw nsw i32 %384, 64
  %484 = add nuw nsw i32 %482, %483
  %485 = udiv i32 %484, 6400
  %486 = mul nuw nsw i32 %385, 1
  %487 = add nuw nsw i32 0, %486
  %488 = udiv i32 %487, 8192
  %489 = getelementptr inbounds float, ptr %arg7, i32 %475
  %490 = load float, ptr %489, align 4, !invariant.load !28
  br label %concatenate.10.merge56

concatenate.pivot.144.65:                         ; preds = %concatenate.10.merge32
  %491 = icmp ult i32 %380, 144
  br i1 %491, label %concatenate.pivot.128.66, label %concatenate.pivot.160.73

concatenate.pivot.128.66:                         ; preds = %concatenate.pivot.144.65
  %492 = icmp ult i32 %380, 128
  br i1 %492, label %concatenate.pivot.64.67, label %concatenate.pivot.136.70

concatenate.pivot.64.67:                          ; preds = %concatenate.pivot.128.66
  %493 = icmp ult i32 %380, 64
  br i1 %493, label %concatenate.pivot.0.68, label %concatenate.pivot.64.69

concatenate.pivot.0.68:                           ; preds = %concatenate.pivot.64.67
  br label %concat_index_from_operand_id057

concatenate.pivot.64.69:                          ; preds = %concatenate.pivot.64.67
  br label %concat_index_from_operand_id158

concatenate.pivot.136.70:                         ; preds = %concatenate.pivot.128.66
  %494 = icmp ult i32 %380, 136
  br i1 %494, label %concatenate.pivot.128.71, label %concatenate.pivot.136.72

concatenate.pivot.128.71:                         ; preds = %concatenate.pivot.136.70
  br label %concat_index_from_operand_id259

concatenate.pivot.136.72:                         ; preds = %concatenate.pivot.136.70
  br label %concat_index_from_operand_id360

concatenate.pivot.160.73:                         ; preds = %concatenate.pivot.144.65
  %495 = icmp ult i32 %380, 160
  br i1 %495, label %concatenate.pivot.152.74, label %concatenate.pivot.168.77

concatenate.pivot.152.74:                         ; preds = %concatenate.pivot.160.73
  %496 = icmp ult i32 %380, 152
  br i1 %496, label %concatenate.pivot.144.75, label %concatenate.pivot.152.76

concatenate.pivot.144.75:                         ; preds = %concatenate.pivot.152.74
  br label %concat_index_from_operand_id461

concatenate.pivot.152.76:                         ; preds = %concatenate.pivot.152.74
  br label %concat_index_from_operand_id562

concatenate.pivot.168.77:                         ; preds = %concatenate.pivot.160.73
  %497 = icmp ult i32 %380, 168
  br i1 %497, label %concatenate.pivot.160.78, label %concatenate.pivot.168.79

concatenate.pivot.160.78:                         ; preds = %concatenate.pivot.168.77
  br label %concat_index_from_operand_id663

concatenate.pivot.168.79:                         ; preds = %concatenate.pivot.168.77
  br label %concat_index_from_operand_id764

concatenate.10.merge56:                           ; preds = %concat_index_from_operand_id764, %concat_index_from_operand_id663, %concat_index_from_operand_id562, %concat_index_from_operand_id461, %concat_index_from_operand_id360, %concat_index_from_operand_id259, %concat_index_from_operand_id158, %concat_index_from_operand_id057
  %498 = phi float [ %398, %concat_index_from_operand_id057 ], [ %410, %concat_index_from_operand_id158 ], [ %422, %concat_index_from_operand_id259 ], [ %434, %concat_index_from_operand_id360 ], [ %446, %concat_index_from_operand_id461 ], [ %458, %concat_index_from_operand_id562 ], [ %470, %concat_index_from_operand_id663 ], [ %490, %concat_index_from_operand_id764 ]
  %499 = getelementptr inbounds float, ptr %arg8, i32 %linear_index3
  store float %498, ptr %499, align 4
  br label %fusion_7.in_bounds-after
}

define void @concatenate_2(ptr noalias align 16 dereferenceable(155648) %arg0, ptr noalias align 16 dereferenceable(8192) %arg1, ptr noalias align 16 dereferenceable(8192) %arg2, ptr noalias align 16 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(237568) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !48
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 59392
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 59392
  br i1 %6, label %concatenate_2.in_bounds-true, label %concatenate_2.in_bounds-after

concatenate_2.in_bounds-after:                    ; preds = %concatenate.5.merge, %entry
  ret void

concatenate_2.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.160.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %7 = phi i32 [ 0, %concatenate.pivot.0. ]
  %8 = sub nsw i32 %5, %7
  %9 = getelementptr inbounds [152 x [256 x float]], ptr %arg0, i32 0, i32 %8, i32 %4
  %10 = load float, ptr %9, align 4, !invariant.load !28
  br label %concatenate.5.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.152.1
  %11 = phi i32 [ 152, %concatenate.pivot.152.1 ]
  %12 = sub nsw i32 %5, %11
  %13 = getelementptr inbounds [8 x [256 x float]], ptr %arg1, i32 0, i32 %12, i32 %4
  %14 = load float, ptr %13, align 4, !invariant.load !28
  br label %concatenate.5.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.160.2
  %15 = phi i32 [ 160, %concatenate.pivot.160.2 ]
  %16 = sub nsw i32 %5, %15
  %17 = getelementptr inbounds [8 x [256 x float]], ptr %arg2, i32 0, i32 %16, i32 %4
  %18 = load float, ptr %17, align 4, !invariant.load !28
  br label %concatenate.5.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.168.3
  %19 = phi i32 [ 168, %concatenate.pivot.168.3 ]
  %20 = sub nsw i32 %5, %19
  %21 = getelementptr inbounds [64 x [256 x float]], ptr %arg3, i32 0, i32 %20, i32 %4
  %22 = load float, ptr %21, align 4, !invariant.load !28
  br label %concatenate.5.merge

concatenate.pivot.160.:                           ; preds = %concatenate_2.in_bounds-true
  %23 = icmp ult i32 %5, 160
  br i1 %23, label %concatenate.pivot.152., label %concatenate.pivot.168.

concatenate.pivot.152.:                           ; preds = %concatenate.pivot.160.
  %24 = icmp ult i32 %5, 152
  br i1 %24, label %concatenate.pivot.0., label %concatenate.pivot.152.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.152.
  br label %concat_index_from_operand_id0

concatenate.pivot.152.1:                          ; preds = %concatenate.pivot.152.
  br label %concat_index_from_operand_id1

concatenate.pivot.168.:                           ; preds = %concatenate.pivot.160.
  %25 = icmp ult i32 %5, 168
  br i1 %25, label %concatenate.pivot.160.2, label %concatenate.pivot.168.3

concatenate.pivot.160.2:                          ; preds = %concatenate.pivot.168.
  br label %concat_index_from_operand_id2

concatenate.pivot.168.3:                          ; preds = %concatenate.pivot.168.
  br label %concat_index_from_operand_id3

concatenate.5.merge:                              ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %26 = phi float [ %10, %concat_index_from_operand_id0 ], [ %14, %concat_index_from_operand_id1 ], [ %18, %concat_index_from_operand_id2 ], [ %22, %concat_index_from_operand_id3 ]
  %27 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %26, ptr %27, align 4
  br label %concatenate_2.in_bounds-after
}

define void @fusion(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(838860800) %arg1, ptr noalias align 128 dereferenceable(8388608) %arg2) {
entry:
  %return_buffer45 = alloca float, align 4
  %result_from_other_lane43 = alloca float, align 4
  %return_buffer42 = alloca float, align 4
  %result_from_other_lane40 = alloca float, align 4
  %return_buffer39 = alloca float, align 4
  %result_from_other_lane37 = alloca float, align 4
  %return_buffer36 = alloca float, align 4
  %result_from_other_lane34 = alloca float, align 4
  %return_buffer33 = alloca float, align 4
  %result_from_other_lane31 = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %result_from_other_lane25 = alloca float, align 4
  %return_buffer24 = alloca float, align 4
  %result_from_other_lane22 = alloca float, align 4
  %return_buffer21 = alloca float, align 4
  %result_from_other_lane19 = alloca float, align 4
  %return_buffer18 = alloca float, align 4
  %result_from_other_lane16 = alloca float, align 4
  %return_buffer15 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer13 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !31
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after47, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @2, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_12_constant_6, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_12_constant_6, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
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
  %13 = urem i32 %12, 4
  %14 = udiv i32 %9, 4
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 4
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 100, i32 4096
  %18 = icmp eq i32 %13, 3
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

tile_loop.loop_header:                            ; preds = %x_in_tile-after7, %y_in_tile.loop_body
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

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %29 = mul i32 %tile_loop.indvar, 2
  %30 = add i32 %29, 1
  %x_loc5 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc5
  %33 = icmp ult i32 %x_loc5, %tile_bound1
  br i1 %33, label %x_in_tile-true6, label %x_in_tile-after7

x_in_tile-after7:                                 ; preds = %x_in_tile-true6, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !51

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !52

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result14 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result14, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_7__1(ptr %36, ptr %result_from_other_lane, ptr %return_buffer15)
  %38 = load float, ptr %return_buffer15, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result17 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result17, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane16, align 4
  call void @region_1_7__1(ptr %36, ptr %result_from_other_lane16, ptr %return_buffer18)
  %40 = load float, ptr %return_buffer18, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result20 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result20, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane19, align 4
  call void @region_1_7__1(ptr %36, ptr %result_from_other_lane19, ptr %return_buffer21)
  %42 = load float, ptr %return_buffer21, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result23 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result23, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane22, align 4
  call void @region_1_7__1(ptr %36, ptr %result_from_other_lane22, ptr %return_buffer24)
  %44 = load float, ptr %return_buffer24, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result26 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result26, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane25, align 4
  call void @region_1_7__1(ptr %36, ptr %result_from_other_lane25, ptr %return_buffer27)
  %46 = load float, ptr %return_buffer27, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address28 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address28 to ptr
  %current_output29 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output29, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr30 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr30 to ptr
  %partial_reduction_result32 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result32, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane31, align 4
  call void @region_1_7__1(ptr %55, ptr %result_from_other_lane31, ptr %return_buffer33)
  %57 = load float, ptr %return_buffer33, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result35 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result35, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane34, align 4
  call void @region_1_7__1(ptr %55, ptr %result_from_other_lane34, ptr %return_buffer36)
  %59 = load float, ptr %return_buffer36, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result38 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result38, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane37, align 4
  call void @region_1_7__1(ptr %55, ptr %result_from_other_lane37, ptr %return_buffer39)
  %61 = load float, ptr %return_buffer39, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result41 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result41, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane40, align 4
  call void @region_1_7__1(ptr %55, ptr %result_from_other_lane40, ptr %return_buffer42)
  %63 = load float, ptr %return_buffer42, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result44 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result44, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane43, align 4
  call void @region_1_7__1(ptr %55, ptr %result_from_other_lane43, ptr %return_buffer45)
  %65 = load float, ptr %return_buffer45, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true46, label %reduction_write_output-after47

reduction_write_output-after47:                   ; preds = %reduction_write_output-true46, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul nuw nsw i32 %27, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %26, 256
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 25600
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 64
  %80 = udiv i32 %77, 64
  %81 = urem i32 %80, 4
  %82 = udiv i32 %77, 256
  %83 = urem i32 %82, 100
  %84 = udiv i32 %77, 25600
  %85 = mul i32 %thread_id.x, 2
  %86 = sub i32 %x_loc, %85
  %87 = mul nuw nsw i32 %79, 1
  %88 = add nuw nsw i32 0, %87
  %89 = mul nuw nsw i32 %81, 64
  %90 = add nuw nsw i32 %88, %89
  %91 = udiv i32 %90, 256
  %92 = mul nuw nsw i32 %83, 1
  %93 = add nuw nsw i32 0, %92
  %94 = mul nuw nsw i32 %84, 100
  %95 = add nuw nsw i32 %93, %94
  %96 = udiv i32 %95, 819200
  %Arg_1.2 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %95, i32 %90
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !28
  %Arg_0.1 = getelementptr inbounds [8192 x [100 x [4 x float]]], ptr %arg0, i32 0, i32 %84, i32 %83, i32 %81
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !28
  %multiply.5 = fmul float %Arg_1.23, %Arg_0.14
  store float %multiply.5, ptr %reduction_input_address, align 4
  %97 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %86
  call void @region_1_7__1(ptr %97, ptr %reduction_input_address, ptr %return_buffer)
  %98 = load float, ptr %return_buffer, align 4
  store float %98, ptr %97, align 4
  br label %x_in_tile-after

x_in_tile-true6:                                  ; preds = %x_in_tile-after
  %99 = mul nuw nsw i32 %32, 1
  %100 = add nuw nsw i32 0, %99
  %101 = mul nuw nsw i32 %31, 256
  %102 = add nuw nsw i32 %100, %101
  %103 = mul nuw nsw i32 %tile_origin.0, 25600
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 1
  %106 = urem i32 %105, 64
  %107 = udiv i32 %104, 64
  %108 = urem i32 %107, 4
  %109 = udiv i32 %104, 256
  %110 = urem i32 %109, 100
  %111 = udiv i32 %104, 25600
  %112 = mul i32 %thread_id.x, 2
  %113 = sub i32 %x_loc5, %112
  %114 = mul nuw nsw i32 %106, 1
  %115 = add nuw nsw i32 0, %114
  %116 = mul nuw nsw i32 %108, 64
  %117 = add nuw nsw i32 %115, %116
  %118 = udiv i32 %117, 256
  %119 = mul nuw nsw i32 %110, 1
  %120 = add nuw nsw i32 0, %119
  %121 = mul nuw nsw i32 %111, 100
  %122 = add nuw nsw i32 %120, %121
  %123 = udiv i32 %122, 819200
  %Arg_1.28 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %122, i32 %117
  %Arg_1.29 = load float, ptr %Arg_1.28, align 4, !invariant.load !28
  %Arg_0.110 = getelementptr inbounds [8192 x [100 x [4 x float]]], ptr %arg0, i32 0, i32 %111, i32 %110, i32 %108
  %Arg_0.111 = load float, ptr %Arg_0.110, align 4, !invariant.load !28
  %multiply.512 = fmul float %Arg_1.29, %Arg_0.111
  store float %multiply.512, ptr %reduction_input_address, align 4
  %124 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %113
  call void @region_1_7__1(ptr %124, ptr %reduction_input_address, ptr %return_buffer13)
  %125 = load float, ptr %return_buffer13, align 4
  store float %125, ptr %124, align 4
  br label %x_in_tile-after7

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %126 = mul i32 %thread_id.y, 2
  %127 = add i32 %tile_origin.1, %thread_id.x
  %128 = add i32 %tile_origin.2, %126
  %129 = add i32 %128, 0
  %130 = mul i32 %tile_origin.0, 256
  %131 = add i32 %130, %129
  %132 = udiv i32 %131, 1
  %133 = urem i32 %132, 64
  %134 = udiv i32 %131, 64
  %135 = urem i32 %134, 4
  %136 = udiv i32 %131, 256
  %output_element_address = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg2, i32 0, i32 %136, i32 %135, i32 %133
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true46:                    ; preds = %reduction_write_output-after
  %137 = mul i32 %thread_id.y, 2
  %138 = add i32 %tile_origin.1, %thread_id.x
  %139 = add i32 %tile_origin.2, %137
  %140 = add i32 %139, 1
  %141 = mul i32 %tile_origin.0, 256
  %142 = add i32 %141, %140
  %143 = udiv i32 %142, 1
  %144 = urem i32 %143, 64
  %145 = udiv i32 %142, 64
  %146 = urem i32 %145, 4
  %147 = udiv i32 %142, 256
  %output_element_address48 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg2, i32 0, i32 %147, i32 %146, i32 %144
  %output49 = load float, ptr %55, align 4
  store float %output49, ptr %output_element_address48, align 4
  br label %reduction_write_output-after47
}

define internal void @region_1_7__1(ptr dereferenceable(4) %Arg_0.8.typed, ptr dereferenceable(4) %Arg_1.9.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.10.typed = alloca float, align 4
  %Arg_0.8 = load float, ptr %Arg_0.8.typed, align 4
  %Arg_1.9 = load float, ptr %Arg_1.9.typed, align 4
  %add.10 = fadd float %Arg_0.8, %Arg_1.9
  store float %add.10, ptr %add.10.typed, align 4
  %load_ret_value = load float, ptr %add.10.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_8(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !39
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 819200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index_base, 1
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index_base, 4
  %8 = urem i32 %7, 100
  %9 = udiv i32 %linear_index_base, 400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 1
  %12 = udiv i32 %linear_index1, 1
  %13 = urem i32 %12, 4
  %14 = udiv i32 %linear_index1, 4
  %15 = urem i32 %14, 100
  %16 = udiv i32 %linear_index1, 400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 1
  %19 = udiv i32 %linear_index2, 1
  %20 = urem i32 %19, 4
  %21 = udiv i32 %linear_index2, 4
  %22 = urem i32 %21, 100
  %23 = udiv i32 %linear_index2, 400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 1
  %26 = udiv i32 %linear_index3, 1
  %27 = urem i32 %26, 4
  %28 = udiv i32 %linear_index3, 4
  %29 = urem i32 %28, 100
  %30 = udiv i32 %linear_index3, 400
  %31 = icmp ult i32 %linear_index_base, 3276800
  br i1 %31, label %fusion_8.in_bounds-true, label %fusion_8.in_bounds-after

fusion_8.in_bounds-after:                         ; preds = %fusion_8.in_bounds-true, %entry
  ret void

fusion_8.in_bounds-true:                          ; preds = %entry
  %32 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %9, i32 %6, i32 %8
  %33 = load float, ptr %32, align 4, !invariant.load !28
  %34 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %33, ptr %34, align 4
  %35 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %16, i32 %13, i32 %15
  %36 = load float, ptr %35, align 4, !invariant.load !28
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %36, ptr %37, align 4
  %38 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %23, i32 %20, i32 %22
  %39 = load float, ptr %38, align 4, !invariant.load !28
  %40 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %39, ptr %40, align 4
  %41 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %30, i32 %27, i32 %29
  %42 = load float, ptr %41, align 4, !invariant.load !28
  %43 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %42, ptr %43, align 4
  br label %fusion_8.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25}

!0 = !{ptr @fusion_6, !"kernel", i32 1}
!1 = !{ptr @fusion_6, !"reqntidx", i32 256}
!2 = !{ptr @concatenate_4, !"kernel", i32 1}
!3 = !{ptr @concatenate_4, !"reqntidx", i32 256}
!4 = !{ptr @fusion_5, !"kernel", i32 1}
!5 = !{ptr @fusion_5, !"reqntidx", i32 256}
!6 = !{ptr @fusion_4, !"kernel", i32 1}
!7 = !{ptr @fusion_4, !"reqntidx", i32 96}
!8 = !{ptr @fusion_3, !"kernel", i32 1}
!9 = !{ptr @fusion_3, !"reqntidx", i32 256}
!10 = !{ptr @reduce_102, !"kernel", i32 1}
!11 = !{ptr @reduce_102, !"reqntidx", i32 96}
!12 = !{ptr @fusion_9, !"kernel", i32 1}
!13 = !{ptr @fusion_9, !"reqntidx", i32 96}
!14 = !{ptr @fusion_1, !"kernel", i32 1}
!15 = !{ptr @fusion_1, !"reqntidx", i32 256}
!16 = !{ptr @transpose_219, !"kernel", i32 1}
!17 = !{ptr @transpose_219, !"reqntidx", i32 256}
!18 = !{ptr @fusion_7, !"kernel", i32 1}
!19 = !{ptr @fusion_7, !"reqntidx", i32 256}
!20 = !{ptr @concatenate_2, !"kernel", i32 1}
!21 = !{ptr @concatenate_2, !"reqntidx", i32 1024}
!22 = !{ptr @fusion, !"kernel", i32 1}
!23 = !{ptr @fusion, !"reqntidx", i32 1024}
!24 = !{ptr @fusion_8, !"kernel", i32 1}
!25 = !{ptr @fusion_8, !"reqntidx", i32 256}
!26 = !{i32 0, i32 8256}
!27 = !{i32 0, i32 256}
!28 = !{}
!29 = !{i32 0, i32 258}
!30 = !{i32 0, i32 160000}
!31 = !{i32 0, i32 1}
!32 = !{i32 0, i32 96}
!33 = !{i32 0, i32 1092267}
!34 = distinct !{!34, !35}
!35 = !{!"llvm.loop.vectorize.enable", i1 false}
!36 = distinct !{!36, !35, !37}
!37 = !{!"llvm.loop.unroll.full"}
!38 = distinct !{!38, !35, !37}
!39 = !{i32 0, i32 3200}
!40 = !{i32 0, i32 10923}
!41 = distinct !{!41, !35}
!42 = distinct !{!42, !35, !37}
!43 = distinct !{!43, !35, !37}
!44 = distinct !{!44, !35}
!45 = distinct !{!45, !35, !37}
!46 = distinct !{!46, !35, !37}
!47 = !{i32 0, i32 185600}
!48 = !{i32 0, i32 58}
!49 = !{i32 0, i32 1024}
!50 = !{i32 0, i32 32768}
!51 = distinct !{!51, !35, !37}
!52 = distinct !{!52, !35}
