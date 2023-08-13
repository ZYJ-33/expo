target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@buffer_for_constant_9 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_7(ptr noalias nocapture readonly align 16 dereferenceable(1572864) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(786432) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4456448) %arg3) local_unnamed_addr #0 {
entry:
  %arg352 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg250 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg148 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg046 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = udiv i32 %linear_index_base, 136
  %linear_index1 = or i32 %linear_index_base, 1
  %5 = and i32 %linear_index1, 5
  %6 = lshr i32 %linear_index_base, 3
  %7 = urem i32 %6, 17
  %linear_index2 = or i32 %linear_index_base, 2
  %8 = and i32 %linear_index2, 6
  %linear_index3 = or i32 %linear_index_base, 3
  %9 = and i32 %linear_index3, 7
  %10 = and i32 %3, 4
  %11 = shl nuw nsw i32 %7, 3
  %12 = or i32 %11, %10
  %13 = icmp ult i32 %12, 48
  br i1 %13, label %concatenate.pivot.0., label %concatenate.pivot.112.

concatenate.pivot.0.:                             ; preds = %entry
  %14 = mul nuw nsw i32 %4, 48
  %15 = add nuw nsw i32 %12, %14
  br label %concatenate.4.merge

concatenate.pivot.112.:                           ; preds = %entry
  %16 = icmp ult i32 %12, 112
  br i1 %16, label %concatenate.pivot.48.1, label %concatenate.pivot.112.2

concatenate.pivot.48.1:                           ; preds = %concatenate.pivot.112.
  %17 = shl nuw nsw i32 %4, 6
  %18 = add nsw i32 %17, -48
  %19 = add nsw i32 %18, %12
  br label %concatenate.4.merge

concatenate.pivot.112.2:                          ; preds = %concatenate.pivot.112.
  %20 = mul nuw nsw i32 %4, 24
  %21 = add nsw i32 %20, -112
  %22 = add nsw i32 %21, %12
  br label %concatenate.4.merge

concatenate.4.merge:                              ; preds = %concatenate.pivot.112.2, %concatenate.pivot.48.1, %concatenate.pivot.0.
  %.sink39 = phi i32 [ %22, %concatenate.pivot.112.2 ], [ %19, %concatenate.pivot.48.1 ], [ %15, %concatenate.pivot.0. ]
  %arg2.sink = phi ptr addrspace(1) [ %arg250, %concatenate.pivot.112.2 ], [ %arg148, %concatenate.pivot.48.1 ], [ %arg046, %concatenate.pivot.0. ]
  %23 = zext i32 %.sink39 to i64
  %24 = getelementptr inbounds float, ptr addrspace(1) %arg2.sink, i64 %23
  %25 = load float, ptr addrspace(1) %24, align 4, !invariant.load !28
  %26 = zext i32 %linear_index_base to i64
  %27 = getelementptr float, ptr addrspace(1) %arg352, i64 %26
  store float %25, ptr addrspace(1) %27, align 16
  %28 = or i32 %11, %5
  %29 = icmp ult i32 %28, 48
  br i1 %29, label %concatenate.pivot.0.8, label %concatenate.pivot.112.9

concatenate.pivot.0.8:                            ; preds = %concatenate.4.merge
  %30 = mul nuw nsw i32 %4, 48
  %31 = add nuw nsw i32 %28, %30
  br label %concatenate.4.merge3

concatenate.pivot.112.9:                          ; preds = %concatenate.4.merge
  %32 = icmp ult i32 %28, 112
  br i1 %32, label %concatenate.pivot.48.10, label %concatenate.pivot.112.11

concatenate.pivot.48.10:                          ; preds = %concatenate.pivot.112.9
  %33 = shl nuw nsw i32 %4, 6
  %34 = add nsw i32 %33, -48
  %35 = add nsw i32 %34, %28
  br label %concatenate.4.merge3

concatenate.pivot.112.11:                         ; preds = %concatenate.pivot.112.9
  %36 = mul nuw nsw i32 %4, 24
  %37 = add nsw i32 %36, -112
  %38 = add nsw i32 %37, %28
  br label %concatenate.4.merge3

concatenate.4.merge3:                             ; preds = %concatenate.pivot.112.11, %concatenate.pivot.48.10, %concatenate.pivot.0.8
  %.sink41 = phi i32 [ %38, %concatenate.pivot.112.11 ], [ %35, %concatenate.pivot.48.10 ], [ %31, %concatenate.pivot.0.8 ]
  %arg2.sink40 = phi ptr addrspace(1) [ %arg250, %concatenate.pivot.112.11 ], [ %arg148, %concatenate.pivot.48.10 ], [ %arg046, %concatenate.pivot.0.8 ]
  %39 = zext i32 %.sink41 to i64
  %40 = getelementptr inbounds float, ptr addrspace(1) %arg2.sink40, i64 %39
  %41 = load float, ptr addrspace(1) %40, align 4, !invariant.load !28
  %42 = getelementptr inbounds float, ptr addrspace(1) %27, i64 1
  store float %41, ptr addrspace(1) %42, align 4
  %43 = or i32 %11, %8
  %44 = icmp ult i32 %43, 48
  br i1 %44, label %concatenate.pivot.0.17, label %concatenate.pivot.112.18

concatenate.pivot.0.17:                           ; preds = %concatenate.4.merge3
  %45 = mul nuw nsw i32 %4, 48
  %46 = add nuw nsw i32 %43, %45
  br label %concatenate.4.merge12

concatenate.pivot.112.18:                         ; preds = %concatenate.4.merge3
  %47 = icmp ult i32 %43, 112
  br i1 %47, label %concatenate.pivot.48.19, label %concatenate.pivot.112.20

concatenate.pivot.48.19:                          ; preds = %concatenate.pivot.112.18
  %48 = shl nuw nsw i32 %4, 6
  %49 = add nsw i32 %48, -48
  %50 = add nsw i32 %49, %43
  br label %concatenate.4.merge12

concatenate.pivot.112.20:                         ; preds = %concatenate.pivot.112.18
  %51 = mul nuw nsw i32 %4, 24
  %52 = add nsw i32 %51, -112
  %53 = add nsw i32 %52, %43
  br label %concatenate.4.merge12

concatenate.4.merge12:                            ; preds = %concatenate.pivot.112.20, %concatenate.pivot.48.19, %concatenate.pivot.0.17
  %.sink43 = phi i32 [ %53, %concatenate.pivot.112.20 ], [ %50, %concatenate.pivot.48.19 ], [ %46, %concatenate.pivot.0.17 ]
  %arg2.sink42 = phi ptr addrspace(1) [ %arg250, %concatenate.pivot.112.20 ], [ %arg148, %concatenate.pivot.48.19 ], [ %arg046, %concatenate.pivot.0.17 ]
  %54 = zext i32 %.sink43 to i64
  %55 = getelementptr inbounds float, ptr addrspace(1) %arg2.sink42, i64 %54
  %56 = load float, ptr addrspace(1) %55, align 4, !invariant.load !28
  %57 = getelementptr inbounds float, ptr addrspace(1) %27, i64 2
  store float %56, ptr addrspace(1) %57, align 8
  %58 = or i32 %11, %9
  %59 = icmp ult i32 %58, 48
  br i1 %59, label %concatenate.pivot.0.26, label %concatenate.pivot.112.27

concatenate.pivot.0.26:                           ; preds = %concatenate.4.merge12
  %60 = mul nuw nsw i32 %4, 48
  %61 = add nuw nsw i32 %58, %60
  br label %concatenate.4.merge21

concatenate.pivot.112.27:                         ; preds = %concatenate.4.merge12
  %62 = icmp ult i32 %58, 112
  br i1 %62, label %concatenate.pivot.48.28, label %concatenate.pivot.112.29

concatenate.pivot.48.28:                          ; preds = %concatenate.pivot.112.27
  %63 = shl nuw nsw i32 %4, 6
  %64 = add nsw i32 %63, -48
  %65 = add nsw i32 %64, %58
  br label %concatenate.4.merge21

concatenate.pivot.112.29:                         ; preds = %concatenate.pivot.112.27
  %66 = mul nuw nsw i32 %4, 24
  %67 = add nsw i32 %66, -112
  %68 = add nsw i32 %67, %58
  br label %concatenate.4.merge21

concatenate.4.merge21:                            ; preds = %concatenate.pivot.112.29, %concatenate.pivot.48.28, %concatenate.pivot.0.26
  %.sink45 = phi i32 [ %68, %concatenate.pivot.112.29 ], [ %65, %concatenate.pivot.48.28 ], [ %61, %concatenate.pivot.0.26 ]
  %arg2.sink44 = phi ptr addrspace(1) [ %arg250, %concatenate.pivot.112.29 ], [ %arg148, %concatenate.pivot.48.28 ], [ %arg046, %concatenate.pivot.0.26 ]
  %69 = zext i32 %.sink45 to i64
  %70 = getelementptr inbounds float, ptr addrspace(1) %arg2.sink44, i64 %69
  %71 = load float, ptr addrspace(1) %70, align 4, !invariant.load !28
  %72 = getelementptr inbounds float, ptr addrspace(1) %27, i64 3
  store float %71, ptr addrspace(1) %72, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_8(ptr noalias nocapture readonly align 16 dereferenceable(14680064) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(27262976) %arg4) local_unnamed_addr #0 {
entry:
  %arg464 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg362 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg260 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg158 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg056 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !29
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = udiv i32 %linear_index_base, 832
  %linear_index1 = or i32 %linear_index_base, 1
  %5 = and i32 %linear_index1, 61
  %6 = lshr i32 %linear_index_base, 6
  %7 = urem i32 %6, 13
  %linear_index2 = or i32 %linear_index_base, 2
  %8 = and i32 %linear_index2, 62
  %linear_index3 = or i32 %linear_index_base, 3
  %9 = and i32 %linear_index3, 63
  %10 = and i32 %3, 60
  %11 = shl nuw nsw i32 %7, 6
  %12 = or i32 %11, %10
  %13 = icmp ult i32 %12, 576
  br i1 %13, label %concatenate.pivot.448., label %concatenate.pivot.704.

concatenate.pivot.448.:                           ; preds = %entry
  %14 = icmp ult i32 %12, 448
  br i1 %14, label %concatenate.pivot.0., label %concatenate.pivot.448.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.448.
  %15 = mul nuw nsw i32 %4, 448
  %16 = add nuw nsw i32 %12, %15
  br label %concatenate.5.merge

concatenate.pivot.448.1:                          ; preds = %concatenate.pivot.448.
  %17 = shl nuw nsw i32 %4, 7
  %18 = add nsw i32 %17, -448
  %19 = add nsw i32 %18, %12
  br label %concatenate.5.merge

concatenate.pivot.704.:                           ; preds = %entry
  %20 = icmp ult i32 %12, 704
  %21 = shl nuw nsw i32 %4, 7
  br i1 %20, label %concatenate.pivot.576.2, label %concatenate.pivot.704.3

concatenate.pivot.576.2:                          ; preds = %concatenate.pivot.704.
  %22 = add nsw i32 %21, -576
  %23 = add nsw i32 %22, %12
  br label %concatenate.5.merge

concatenate.pivot.704.3:                          ; preds = %concatenate.pivot.704.
  %24 = add nsw i32 %21, -704
  %25 = add nsw i32 %24, %12
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.704.3, %concatenate.pivot.576.2, %concatenate.pivot.448.1, %concatenate.pivot.0.
  %.sink49 = phi i32 [ %25, %concatenate.pivot.704.3 ], [ %23, %concatenate.pivot.576.2 ], [ %19, %concatenate.pivot.448.1 ], [ %16, %concatenate.pivot.0. ]
  %arg3.sink = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.704.3 ], [ %arg260, %concatenate.pivot.576.2 ], [ %arg158, %concatenate.pivot.448.1 ], [ %arg056, %concatenate.pivot.0. ]
  %26 = zext i32 %.sink49 to i64
  %27 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink, i64 %26
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !28
  %29 = zext i32 %linear_index_base to i64
  %30 = getelementptr float, ptr addrspace(1) %arg464, i64 %29
  store float %28, ptr addrspace(1) %30, align 16
  %31 = or i32 %11, %5
  %32 = icmp ult i32 %31, 576
  br i1 %32, label %concatenate.pivot.448.10, label %concatenate.pivot.704.13

concatenate.pivot.448.10:                         ; preds = %concatenate.5.merge
  %33 = icmp ult i32 %31, 448
  br i1 %33, label %concatenate.pivot.0.11, label %concatenate.pivot.448.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.448.10
  %34 = mul nuw nsw i32 %4, 448
  %35 = add nuw nsw i32 %31, %34
  br label %concatenate.5.merge4

concatenate.pivot.448.12:                         ; preds = %concatenate.pivot.448.10
  %36 = shl nuw nsw i32 %4, 7
  %37 = add nsw i32 %36, -448
  %38 = add nsw i32 %37, %31
  br label %concatenate.5.merge4

concatenate.pivot.704.13:                         ; preds = %concatenate.5.merge
  %39 = icmp ult i32 %31, 704
  %40 = shl nuw nsw i32 %4, 7
  br i1 %39, label %concatenate.pivot.576.14, label %concatenate.pivot.704.15

concatenate.pivot.576.14:                         ; preds = %concatenate.pivot.704.13
  %41 = add nsw i32 %40, -576
  %42 = add nsw i32 %41, %31
  br label %concatenate.5.merge4

concatenate.pivot.704.15:                         ; preds = %concatenate.pivot.704.13
  %43 = add nsw i32 %40, -704
  %44 = add nsw i32 %43, %31
  br label %concatenate.5.merge4

concatenate.5.merge4:                             ; preds = %concatenate.pivot.704.15, %concatenate.pivot.576.14, %concatenate.pivot.448.12, %concatenate.pivot.0.11
  %.sink51 = phi i32 [ %44, %concatenate.pivot.704.15 ], [ %42, %concatenate.pivot.576.14 ], [ %38, %concatenate.pivot.448.12 ], [ %35, %concatenate.pivot.0.11 ]
  %arg3.sink50 = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.704.15 ], [ %arg260, %concatenate.pivot.576.14 ], [ %arg158, %concatenate.pivot.448.12 ], [ %arg056, %concatenate.pivot.0.11 ]
  %45 = zext i32 %.sink51 to i64
  %46 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink50, i64 %45
  %47 = load float, ptr addrspace(1) %46, align 4, !invariant.load !28
  %48 = getelementptr inbounds float, ptr addrspace(1) %30, i64 1
  store float %47, ptr addrspace(1) %48, align 4
  %49 = or i32 %11, %8
  %50 = icmp ult i32 %49, 576
  br i1 %50, label %concatenate.pivot.448.22, label %concatenate.pivot.704.25

concatenate.pivot.448.22:                         ; preds = %concatenate.5.merge4
  %51 = icmp ult i32 %49, 448
  br i1 %51, label %concatenate.pivot.0.23, label %concatenate.pivot.448.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.448.22
  %52 = mul nuw nsw i32 %4, 448
  %53 = add nuw nsw i32 %49, %52
  br label %concatenate.5.merge16

concatenate.pivot.448.24:                         ; preds = %concatenate.pivot.448.22
  %54 = shl nuw nsw i32 %4, 7
  %55 = add nsw i32 %54, -448
  %56 = add nsw i32 %55, %49
  br label %concatenate.5.merge16

concatenate.pivot.704.25:                         ; preds = %concatenate.5.merge4
  %57 = icmp ult i32 %49, 704
  %58 = shl nuw nsw i32 %4, 7
  br i1 %57, label %concatenate.pivot.576.26, label %concatenate.pivot.704.27

concatenate.pivot.576.26:                         ; preds = %concatenate.pivot.704.25
  %59 = add nsw i32 %58, -576
  %60 = add nsw i32 %59, %49
  br label %concatenate.5.merge16

concatenate.pivot.704.27:                         ; preds = %concatenate.pivot.704.25
  %61 = add nsw i32 %58, -704
  %62 = add nsw i32 %61, %49
  br label %concatenate.5.merge16

concatenate.5.merge16:                            ; preds = %concatenate.pivot.704.27, %concatenate.pivot.576.26, %concatenate.pivot.448.24, %concatenate.pivot.0.23
  %.sink53 = phi i32 [ %62, %concatenate.pivot.704.27 ], [ %60, %concatenate.pivot.576.26 ], [ %56, %concatenate.pivot.448.24 ], [ %53, %concatenate.pivot.0.23 ]
  %arg3.sink52 = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.704.27 ], [ %arg260, %concatenate.pivot.576.26 ], [ %arg158, %concatenate.pivot.448.24 ], [ %arg056, %concatenate.pivot.0.23 ]
  %63 = zext i32 %.sink53 to i64
  %64 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink52, i64 %63
  %65 = load float, ptr addrspace(1) %64, align 4, !invariant.load !28
  %66 = getelementptr inbounds float, ptr addrspace(1) %30, i64 2
  store float %65, ptr addrspace(1) %66, align 8
  %67 = or i32 %11, %9
  %68 = icmp ult i32 %67, 576
  br i1 %68, label %concatenate.pivot.448.34, label %concatenate.pivot.704.37

concatenate.pivot.448.34:                         ; preds = %concatenate.5.merge16
  %69 = icmp ult i32 %67, 448
  br i1 %69, label %concatenate.pivot.0.35, label %concatenate.pivot.448.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.448.34
  %70 = mul nuw nsw i32 %4, 448
  %71 = add nuw nsw i32 %67, %70
  br label %concatenate.5.merge28

concatenate.pivot.448.36:                         ; preds = %concatenate.pivot.448.34
  %72 = shl nuw nsw i32 %4, 7
  %73 = add nsw i32 %72, -448
  %74 = add nsw i32 %73, %67
  br label %concatenate.5.merge28

concatenate.pivot.704.37:                         ; preds = %concatenate.5.merge16
  %75 = icmp ult i32 %67, 704
  %76 = shl nuw nsw i32 %4, 7
  br i1 %75, label %concatenate.pivot.576.38, label %concatenate.pivot.704.39

concatenate.pivot.576.38:                         ; preds = %concatenate.pivot.704.37
  %77 = add nsw i32 %76, -576
  %78 = add nsw i32 %77, %67
  br label %concatenate.5.merge28

concatenate.pivot.704.39:                         ; preds = %concatenate.pivot.704.37
  %79 = add nsw i32 %76, -704
  %80 = add nsw i32 %79, %67
  br label %concatenate.5.merge28

concatenate.5.merge28:                            ; preds = %concatenate.pivot.704.39, %concatenate.pivot.576.38, %concatenate.pivot.448.36, %concatenate.pivot.0.35
  %.sink55 = phi i32 [ %80, %concatenate.pivot.704.39 ], [ %78, %concatenate.pivot.576.38 ], [ %74, %concatenate.pivot.448.36 ], [ %71, %concatenate.pivot.0.35 ]
  %arg3.sink54 = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.704.39 ], [ %arg260, %concatenate.pivot.576.38 ], [ %arg158, %concatenate.pivot.448.36 ], [ %arg056, %concatenate.pivot.0.35 ]
  %81 = zext i32 %.sink55 to i64
  %82 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink54, i64 %81
  %83 = load float, ptr addrspace(1) %82, align 4, !invariant.load !28
  %84 = getelementptr inbounds float, ptr addrspace(1) %30, i64 3
  store float %83, ptr addrspace(1) %84, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_3(ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(327680) %arg2) local_unnamed_addr #0 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !30
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !31
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %linear_index.frozen = freeze i32 %linear_index
  %3 = udiv i32 %linear_index.frozen, 640
  %4 = mul i32 %3, 640
  %.decomposed = sub i32 %linear_index.frozen, %4
  %5 = icmp ult i32 %.decomposed, 512
  br i1 %5, label %concatenate.pivot.0., label %concatenate.pivot.512.1

concatenate.pivot.0.:                             ; preds = %entry
  %6 = udiv i32 %linear_index, 640
  %7 = shl nuw nsw i32 %6, 9
  br label %concatenate.3.merge

concatenate.pivot.512.1:                          ; preds = %entry
  %8 = add nsw i32 %.decomposed, -512
  %9 = shl nuw nsw i32 %3, 7
  br label %concatenate.3.merge

concatenate.3.merge:                              ; preds = %concatenate.pivot.512.1, %concatenate.pivot.0.
  %.sink3 = phi i32 [ %9, %concatenate.pivot.512.1 ], [ %.decomposed, %concatenate.pivot.0. ]
  %.sink = phi i32 [ %8, %concatenate.pivot.512.1 ], [ %7, %concatenate.pivot.0. ]
  %arg1.sink = phi ptr addrspace(1) [ %arg16, %concatenate.pivot.512.1 ], [ %arg04, %concatenate.pivot.0. ]
  %10 = add nuw nsw i32 %.sink, %.sink3
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink, i64 %11
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !28
  %14 = zext i32 %linear_index to i64
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg28, i64 %14
  store float %13, ptr addrspace(1) %15, align 4
  ret void
}

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @add_4(ptr noalias nocapture align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg1) local_unnamed_addr #2 {
entry:
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !32
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = shl nuw nsw i64 %4, 2
  %6 = add nuw nsw i64 %5, 1769484
  %scevgep = getelementptr i8, ptr addrspace(1) %arg05, i64 %6
  %scevgep46 = getelementptr i8, ptr addrspace(1) %arg17, i64 %6
  br label %loop.loop_body

loop.loop_body:                                   ; preds = %add_4.in_bounds-after.1, %entry
  %lsr.iv47 = phi ptr addrspace(1) [ %scevgep48, %add_4.in_bounds-after.1 ], [ %scevgep46, %entry ]
  %lsr.iv37 = phi ptr addrspace(1) [ %scevgep38, %add_4.in_bounds-after.1 ], [ %scevgep, %entry ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %add_4.in_bounds-after.1 ], [ 442368, %entry ]
  %scevgep39 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 -1769484
  %7 = load <4 x float>, ptr addrspace(1) %scevgep39, align 16
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %scevgep50 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 -1769484
  %12 = load <4 x float>, ptr addrspace(1) %scevgep50, align 16, !invariant.load !28
  %13 = extractelement <4 x float> %12, i32 0
  %14 = extractelement <4 x float> %12, i32 1
  %15 = extractelement <4 x float> %12, i32 2
  %16 = extractelement <4 x float> %12, i32 3
  %add.3 = fadd float %8, %13
  %add.31 = fadd float %9, %14
  %add.32 = fadd float %10, %15
  %add.33 = fadd float %11, %16
  %17 = insertelement <4 x float> poison, float %add.3, i32 0
  %18 = insertelement <4 x float> %17, float %add.31, i32 1
  %19 = insertelement <4 x float> %18, float %add.32, i32 2
  %20 = insertelement <4 x float> %19, float %add.33, i32 3
  store <4 x float> %20, ptr addrspace(1) %scevgep39, align 16
  %21 = add i32 %linear_index_base, %lsr.iv
  %22 = icmp ult i32 %21, 4194304
  br i1 %22, label %add_4.in_bounds-true.1, label %add_4.in_bounds-after.1

add_4.in_bounds-true.1:                           ; preds = %loop.loop_body
  %scevgep43 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 -12
  %23 = load <4 x float>, ptr addrspace(1) %scevgep43, align 16
  %24 = extractelement <4 x float> %23, i32 0
  %25 = extractelement <4 x float> %23, i32 1
  %26 = extractelement <4 x float> %23, i32 2
  %27 = extractelement <4 x float> %23, i32 3
  %scevgep49 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 -12
  %28 = load <4 x float>, ptr addrspace(1) %scevgep49, align 16, !invariant.load !28
  %29 = extractelement <4 x float> %28, i32 0
  %30 = extractelement <4 x float> %28, i32 1
  %31 = extractelement <4 x float> %28, i32 2
  %32 = extractelement <4 x float> %28, i32 3
  %add.3.1 = fadd float %24, %29
  %add.31.1 = fadd float %25, %30
  %add.32.1 = fadd float %26, %31
  %add.33.1 = fadd float %27, %32
  %33 = insertelement <4 x float> poison, float %add.3.1, i32 0
  %34 = insertelement <4 x float> %33, float %add.31.1, i32 1
  %35 = insertelement <4 x float> %34, float %add.32.1, i32 2
  %36 = insertelement <4 x float> %35, float %add.33.1, i32 3
  store <4 x float> %36, ptr addrspace(1) %scevgep43, align 16
  br label %add_4.in_bounds-after.1

add_4.in_bounds-after.1:                          ; preds = %add_4.in_bounds-true.1, %loop.loop_body
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 884736
  %37 = add i32 %lsr.iv.next, -1327104
  %scevgep38 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 3538944
  %scevgep48 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 3538944
  %38 = icmp ugt i32 %37, 3309567
  br i1 %38, label %loop.loop_exit, label %loop.loop_body, !llvm.loop !34

loop.loop_exit:                                   ; preds = %add_4.in_bounds-after.1
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_12(ptr noalias nocapture readonly align 128 dereferenceable(20971520) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20971520) %arg1, ptr noalias nocapture align 128 dereferenceable(16777216) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg3) local_unnamed_addr #3 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 9
  %5 = and i32 %linear_index3, 511
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = and i32 %linear_index2, 510
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 509
  %8 = and i32 %3, 508
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg214, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = getelementptr float, ptr addrspace(1) %arg316, i64 %9
  %17 = load <4 x float>, ptr addrspace(1) %16, align 16, !invariant.load !28
  %18 = extractelement <4 x float> %17, i32 0
  %19 = extractelement <4 x float> %17, i32 1
  %20 = extractelement <4 x float> %17, i32 2
  %21 = extractelement <4 x float> %17, i32 3
  %add.5 = fadd float %12, %18
  %22 = zext i32 %4 to i64
  %23 = zext i32 %8 to i64
  %24 = getelementptr inbounds [8192 x [640 x float]], ptr addrspace(1) %arg112, i64 0, i64 %22, i64 %23
  %25 = load <2 x float>, ptr addrspace(1) %24, align 16, !invariant.load !28
  %26 = extractelement <2 x float> %25, i32 0
  %27 = extractelement <2 x float> %25, i32 1
  %add.7 = fadd float %add.5, %26
  %28 = getelementptr inbounds [8192 x [640 x float]], ptr addrspace(1) %arg010, i64 0, i64 %22, i64 %23
  %29 = load <2 x float>, ptr addrspace(1) %28, align 16, !invariant.load !28
  %30 = extractelement <2 x float> %29, i32 0
  %31 = extractelement <2 x float> %29, i32 1
  %add.9 = fadd float %add.7, %30
  %add.51 = fadd float %13, %19
  %32 = zext i32 %7 to i64
  %add.72 = fadd float %add.51, %27
  %add.93 = fadd float %add.72, %31
  %add.54 = fadd float %14, %20
  %33 = zext i32 %6 to i64
  %34 = getelementptr inbounds [8192 x [640 x float]], ptr addrspace(1) %arg112, i64 0, i64 %22, i64 %33
  %35 = load float, ptr addrspace(1) %34, align 8, !invariant.load !28
  %add.75 = fadd float %add.54, %35
  %36 = getelementptr inbounds [8192 x [640 x float]], ptr addrspace(1) %arg010, i64 0, i64 %22, i64 %33
  %37 = load float, ptr addrspace(1) %36, align 8, !invariant.load !28
  %add.96 = fadd float %add.75, %37
  %add.57 = fadd float %15, %21
  %38 = zext i32 %5 to i64
  %39 = getelementptr inbounds [8192 x [640 x float]], ptr addrspace(1) %arg112, i64 0, i64 %22, i64 %38
  %40 = load float, ptr addrspace(1) %39, align 4, !invariant.load !28
  %add.78 = fadd float %add.57, %40
  %41 = getelementptr inbounds [8192 x [640 x float]], ptr addrspace(1) %arg010, i64 0, i64 %22, i64 %38
  %42 = load float, ptr addrspace(1) %41, align 4, !invariant.load !28
  %add.99 = fadd float %add.78, %42
  %43 = insertelement <4 x float> poison, float %add.9, i32 0
  %44 = insertelement <4 x float> %43, float %add.93, i32 1
  %45 = insertelement <4 x float> %44, float %add.96, i32 2
  %46 = insertelement <4 x float> %45, float %add.99, i32 3
  store <4 x float> %46, ptr addrspace(1) %10, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_11(ptr noalias nocapture align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(2048) %arg1) local_unnamed_addr #3 {
entry:
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = and i32 %linear_index3, 511
  %linear_index2 = or i32 %linear_index_base, 2
  %5 = and i32 %linear_index2, 510
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = and i32 %linear_index1, 509
  %7 = and i32 %3, 508
  %8 = zext i32 %linear_index_base to i64
  %9 = getelementptr float, ptr addrspace(1) %arg013, i64 %8
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg115, i64 0, i64 %15
  %17 = load <2 x float>, ptr addrspace(1) %16, align 16, !invariant.load !28
  %18 = extractelement <2 x float> %17, i32 0
  %19 = extractelement <2 x float> %17, i32 1
  %add.4 = fadd float %11, %18
  %.inv = fcmp olt float %add.4, 0.000000e+00
  %maximum.7 = select i1 %.inv, float 0.000000e+00, float %add.4
  %20 = zext i32 %6 to i64
  %add.41 = fadd float %12, %19
  %.inv10 = fcmp olt float %add.41, 0.000000e+00
  %maximum.73 = select i1 %.inv10, float 0.000000e+00, float %add.41
  %21 = zext i32 %5 to i64
  %22 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg115, i64 0, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 8, !invariant.load !28
  %add.44 = fadd float %13, %23
  %.inv11 = fcmp olt float %add.44, 0.000000e+00
  %maximum.76 = select i1 %.inv11, float 0.000000e+00, float %add.44
  %24 = zext i32 %4 to i64
  %25 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg115, i64 0, i64 %24
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !28
  %add.47 = fadd float %14, %26
  %.inv12 = fcmp olt float %add.47, 0.000000e+00
  %maximum.79 = select i1 %.inv12, float 0.000000e+00, float %add.47
  %27 = insertelement <4 x float> poison, float %maximum.7, i32 0
  %28 = insertelement <4 x float> %27, float %maximum.73, i32 1
  %29 = insertelement <4 x float> %28, float %maximum.76, i32 2
  %30 = insertelement <4 x float> %29, float %maximum.79, i32 3
  store <4 x float> %30, ptr addrspace(1) %9, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_10(ptr noalias nocapture align 128 dereferenceable(983040) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(120) %arg1) local_unnamed_addr #3 {
entry:
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = urem i32 %linear_index3, 30
  %linear_index2 = or i32 %linear_index_base, 2
  %5 = urem i32 %linear_index2, 30
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 30
  %7 = urem i32 %linear_index_base, 30
  %8 = zext i32 %linear_index_base to i64
  %9 = getelementptr float, ptr addrspace(1) %arg013, i64 %8
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds [30 x float], ptr addrspace(1) %arg115, i64 0, i64 %15
  %17 = load float, ptr addrspace(1) %16, align 4, !invariant.load !28
  %add.6 = fadd float %11, %17
  %18 = fneg float %add.6
  %19 = tail call float @llvm.fma.f32(float %18, float 0x3F777313A0000000, float 5.000000e-01)
  %20 = tail call float @llvm.nvvm.saturate.f(float %19) #4
  %21 = tail call float @llvm.nvvm.fma.rm.f(float %20, float 2.520000e+02, float 0x4168000020000000) #4
  %22 = fadd float %21, 0xC168000FE0000000
  %23 = fneg float %22
  %24 = tail call float @llvm.fma.f32(float %18, float 0x3FF7154760000000, float %23)
  %25 = tail call float @llvm.fma.f32(float %18, float 0x3E54AE0C00000000, float %24)
  %26 = bitcast float %21 to i32
  %27 = shl i32 %26, 23
  %28 = bitcast i32 %27 to float
  %29 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %25) #4
  %30 = fmul float %29, %28
  %add.9 = fadd float %30, 1.000000e+00
  %divide.10 = fdiv float 1.000000e+00, %add.9
  %31 = zext i32 %6 to i64
  %32 = getelementptr inbounds [30 x float], ptr addrspace(1) %arg115, i64 0, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 4, !invariant.load !28
  %add.62 = fadd float %12, %33
  %34 = fneg float %add.62
  %35 = tail call float @llvm.fma.f32(float %34, float 0x3F777313A0000000, float 5.000000e-01)
  %36 = tail call float @llvm.nvvm.saturate.f(float %35) #4
  %37 = tail call float @llvm.nvvm.fma.rm.f(float %36, float 2.520000e+02, float 0x4168000020000000) #4
  %38 = fadd float %37, 0xC168000FE0000000
  %39 = fneg float %38
  %40 = tail call float @llvm.fma.f32(float %34, float 0x3FF7154760000000, float %39)
  %41 = tail call float @llvm.fma.f32(float %34, float 0x3E54AE0C00000000, float %40)
  %42 = bitcast float %37 to i32
  %43 = shl i32 %42, 23
  %44 = bitcast i32 %43 to float
  %45 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %41) #4
  %46 = fmul float %45, %44
  %add.93 = fadd float %46, 1.000000e+00
  %divide.104 = fdiv float 1.000000e+00, %add.93
  %47 = zext i32 %5 to i64
  %48 = getelementptr inbounds [30 x float], ptr addrspace(1) %arg115, i64 0, i64 %47
  %49 = load float, ptr addrspace(1) %48, align 4, !invariant.load !28
  %add.66 = fadd float %13, %49
  %50 = fneg float %add.66
  %51 = tail call float @llvm.fma.f32(float %50, float 0x3F777313A0000000, float 5.000000e-01)
  %52 = tail call float @llvm.nvvm.saturate.f(float %51) #4
  %53 = tail call float @llvm.nvvm.fma.rm.f(float %52, float 2.520000e+02, float 0x4168000020000000) #4
  %54 = fadd float %53, 0xC168000FE0000000
  %55 = fneg float %54
  %56 = tail call float @llvm.fma.f32(float %50, float 0x3FF7154760000000, float %55)
  %57 = tail call float @llvm.fma.f32(float %50, float 0x3E54AE0C00000000, float %56)
  %58 = bitcast float %53 to i32
  %59 = shl i32 %58, 23
  %60 = bitcast i32 %59 to float
  %61 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %57) #4
  %62 = fmul float %61, %60
  %add.97 = fadd float %62, 1.000000e+00
  %divide.108 = fdiv float 1.000000e+00, %add.97
  %63 = zext i32 %4 to i64
  %64 = getelementptr inbounds [30 x float], ptr addrspace(1) %arg115, i64 0, i64 %63
  %65 = load float, ptr addrspace(1) %64, align 4, !invariant.load !28
  %add.610 = fadd float %14, %65
  %66 = fneg float %add.610
  %67 = tail call float @llvm.fma.f32(float %66, float 0x3F777313A0000000, float 5.000000e-01)
  %68 = tail call float @llvm.nvvm.saturate.f(float %67) #4
  %69 = tail call float @llvm.nvvm.fma.rm.f(float %68, float 2.520000e+02, float 0x4168000020000000) #4
  %70 = fadd float %69, 0xC168000FE0000000
  %71 = fneg float %70
  %72 = tail call float @llvm.fma.f32(float %66, float 0x3FF7154760000000, float %71)
  %73 = tail call float @llvm.fma.f32(float %66, float 0x3E54AE0C00000000, float %72)
  %74 = bitcast float %69 to i32
  %75 = shl i32 %74, 23
  %76 = bitcast i32 %75 to float
  %77 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %73) #4
  %78 = fmul float %77, %76
  %add.911 = fadd float %78, 1.000000e+00
  %divide.1012 = fdiv float 1.000000e+00, %add.911
  %79 = insertelement <4 x float> poison, float %divide.10, i32 0
  %80 = insertelement <4 x float> %79, float %divide.104, i32 1
  %81 = insertelement <4 x float> %80, float %divide.108, i32 2
  %82 = insertelement <4 x float> %81, float %divide.1012, i32 3
  store <4 x float> %82, ptr addrspace(1) %9, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_6(ptr noalias nocapture readonly align 128 dereferenceable(4456448) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(27262976) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(983040) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(31719424) %arg3) local_unnamed_addr #0 {
entry:
  %arg375 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg273 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg171 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg069 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !38
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 968
  %5 = mul i32 %4, 968
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 968
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 968
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 968
  %9 = icmp ult i32 %.decomposed, 832
  br i1 %9, label %concatenate.pivot.0., label %concatenate.pivot.832.3

concatenate.pivot.0.:                             ; preds = %entry
  %10 = mul nuw nsw i32 %4, 832
  %11 = add nuw nsw i32 %10, %.decomposed
  %12 = lshr i32 %.decomposed, 6
  br label %concatenate.15.merge

concatenate.pivot.832.3:                          ; preds = %entry
  %13 = add nsw i32 %.decomposed, -832
  %14 = mul nuw nsw i32 %4, 136
  %15 = add nuw nsw i32 %14, %13
  %16 = lshr i32 %13, 3
  %17 = add nuw nsw i32 %16, 13
  br label %concatenate.15.merge

concatenate.15.merge:                             ; preds = %concatenate.pivot.832.3, %concatenate.pivot.0.
  %.sink50 = phi i32 [ %17, %concatenate.pivot.832.3 ], [ %12, %concatenate.pivot.0. ]
  %.sink47 = phi i32 [ %15, %concatenate.pivot.832.3 ], [ %11, %concatenate.pivot.0. ]
  %arg0.sink = phi ptr addrspace(1) [ %arg069, %concatenate.pivot.832.3 ], [ %arg171, %concatenate.pivot.0. ]
  %18 = zext i32 %4 to i64
  %19 = zext i32 %.sink50 to i64
  %20 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg273, i64 0, i64 %18, i64 %19
  %21 = load float, ptr addrspace(1) %20, align 4, !invariant.load !28
  %multiply.62 = fmul float %21, 2.000000e+00
  %22 = zext i32 %.sink47 to i64
  %23 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink, i64 %22
  %24 = load float, ptr addrspace(1) %23, align 4, !invariant.load !28
  %multiply.13 = fmul float %multiply.62, %24
  %25 = zext i32 %linear_index_base to i64
  %26 = getelementptr float, ptr addrspace(1) %arg375, i64 %25
  store float %multiply.13, ptr addrspace(1) %26, align 16
  %27 = icmp ult i32 %6, 832
  br i1 %27, label %concatenate.pivot.0.14, label %concatenate.pivot.832.15

concatenate.pivot.0.14:                           ; preds = %concatenate.15.merge
  %28 = mul nuw nsw i32 %4, 832
  %29 = add nuw nsw i32 %28, %6
  %30 = lshr i32 %6, 6
  br label %concatenate.15.merge4

concatenate.pivot.832.15:                         ; preds = %concatenate.15.merge
  %31 = add nsw i32 %6, -832
  %32 = mul nuw nsw i32 %4, 136
  %33 = add nuw nsw i32 %31, %32
  %34 = lshr i32 %31, 3
  %35 = add nuw nsw i32 %34, 13
  br label %concatenate.15.merge4

concatenate.15.merge4:                            ; preds = %concatenate.pivot.832.15, %concatenate.pivot.0.14
  %.sink56 = phi i32 [ %35, %concatenate.pivot.832.15 ], [ %30, %concatenate.pivot.0.14 ]
  %.sink53 = phi i32 [ %33, %concatenate.pivot.832.15 ], [ %29, %concatenate.pivot.0.14 ]
  %arg0.sink52 = phi ptr addrspace(1) [ %arg069, %concatenate.pivot.832.15 ], [ %arg171, %concatenate.pivot.0.14 ]
  %36 = zext i32 %.sink56 to i64
  %37 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg273, i64 0, i64 %18, i64 %36
  %38 = load float, ptr addrspace(1) %37, align 4, !invariant.load !28
  %multiply.611 = fmul float %38, 2.000000e+00
  %39 = zext i32 %.sink53 to i64
  %40 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink52, i64 %39
  %41 = load float, ptr addrspace(1) %40, align 4, !invariant.load !28
  %multiply.1312 = fmul float %multiply.611, %41
  %42 = getelementptr inbounds float, ptr addrspace(1) %26, i64 1
  store float %multiply.1312, ptr addrspace(1) %42, align 4
  %43 = icmp ult i32 %7, 832
  br i1 %43, label %concatenate.pivot.0.26, label %concatenate.pivot.832.27

concatenate.pivot.0.26:                           ; preds = %concatenate.15.merge4
  %44 = mul nuw nsw i32 %4, 832
  %45 = add nuw nsw i32 %44, %7
  %46 = lshr i32 %7, 6
  br label %concatenate.15.merge16

concatenate.pivot.832.27:                         ; preds = %concatenate.15.merge4
  %47 = add nsw i32 %7, -832
  %48 = mul nuw nsw i32 %4, 136
  %49 = add nuw nsw i32 %47, %48
  %50 = lshr i32 %47, 3
  %51 = add nuw nsw i32 %50, 13
  br label %concatenate.15.merge16

concatenate.15.merge16:                           ; preds = %concatenate.pivot.832.27, %concatenate.pivot.0.26
  %.sink62 = phi i32 [ %51, %concatenate.pivot.832.27 ], [ %46, %concatenate.pivot.0.26 ]
  %.sink59 = phi i32 [ %49, %concatenate.pivot.832.27 ], [ %45, %concatenate.pivot.0.26 ]
  %arg0.sink58 = phi ptr addrspace(1) [ %arg069, %concatenate.pivot.832.27 ], [ %arg171, %concatenate.pivot.0.26 ]
  %52 = zext i32 %.sink62 to i64
  %53 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg273, i64 0, i64 %18, i64 %52
  %54 = load float, ptr addrspace(1) %53, align 4, !invariant.load !28
  %multiply.623 = fmul float %54, 2.000000e+00
  %55 = zext i32 %.sink59 to i64
  %56 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink58, i64 %55
  %57 = load float, ptr addrspace(1) %56, align 4, !invariant.load !28
  %multiply.1324 = fmul float %multiply.623, %57
  %58 = getelementptr inbounds float, ptr addrspace(1) %26, i64 2
  store float %multiply.1324, ptr addrspace(1) %58, align 8
  %59 = icmp ult i32 %8, 832
  br i1 %59, label %concatenate.pivot.0.38, label %concatenate.pivot.832.39

concatenate.pivot.0.38:                           ; preds = %concatenate.15.merge16
  %60 = mul nuw nsw i32 %4, 832
  %61 = add nuw nsw i32 %60, %8
  %62 = lshr i32 %8, 6
  br label %concatenate.15.merge28

concatenate.pivot.832.39:                         ; preds = %concatenate.15.merge16
  %63 = add nsw i32 %8, -832
  %64 = mul nuw nsw i32 %4, 136
  %65 = add nuw nsw i32 %63, %64
  %66 = lshr i32 %63, 3
  %67 = add nuw nsw i32 %66, 13
  br label %concatenate.15.merge28

concatenate.15.merge28:                           ; preds = %concatenate.pivot.832.39, %concatenate.pivot.0.38
  %.sink68 = phi i32 [ %67, %concatenate.pivot.832.39 ], [ %62, %concatenate.pivot.0.38 ]
  %.sink65 = phi i32 [ %65, %concatenate.pivot.832.39 ], [ %61, %concatenate.pivot.0.38 ]
  %arg0.sink64 = phi ptr addrspace(1) [ %arg069, %concatenate.pivot.832.39 ], [ %arg171, %concatenate.pivot.0.38 ]
  %68 = zext i32 %.sink68 to i64
  %69 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg273, i64 0, i64 %18, i64 %68
  %70 = load float, ptr addrspace(1) %69, align 4, !invariant.load !28
  %multiply.635 = fmul float %70, 2.000000e+00
  %71 = zext i32 %.sink65 to i64
  %72 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink64, i64 %71
  %73 = load float, ptr addrspace(1) %72, align 4, !invariant.load !28
  %multiply.1336 = fmul float %multiply.635, %73
  %74 = getelementptr inbounds float, ptr addrspace(1) %26, i64 3
  store float %multiply.1336, ptr addrspace(1) %74, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_3(ptr noalias nocapture readonly align 16 dereferenceable(512) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20971520) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg2) local_unnamed_addr #3 {
entry:
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !31
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 7
  %5 = and i32 %linear_index3, 127
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = and i32 %linear_index2, 126
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 125
  %8 = and i32 %3, 124
  %9 = zext i32 %4 to i64
  %10 = zext i32 %8 to i64
  %11 = getelementptr [8192 x [640 x float]], ptr addrspace(1) %arg115, i64 0, i64 %9, i64 %10
  %12 = getelementptr inbounds float, ptr addrspace(1) %11, i64 512
  %13 = load <2 x float>, ptr addrspace(1) %12, align 16, !invariant.load !28
  %14 = extractelement <2 x float> %13, i32 0
  %15 = extractelement <2 x float> %13, i32 1
  %16 = getelementptr inbounds [128 x float], ptr addrspace(1) %arg013, i64 0, i64 %10
  %17 = load <2 x float>, ptr addrspace(1) %16, align 16, !invariant.load !28
  %18 = extractelement <2 x float> %17, i32 0
  %19 = extractelement <2 x float> %17, i32 1
  %add.5 = fadd float %14, %18
  %.inv = fcmp olt float %add.5, 0.000000e+00
  %maximum.8 = select i1 %.inv, float 0.000000e+00, float %add.5
  %20 = zext i32 %linear_index_base to i64
  %21 = getelementptr float, ptr addrspace(1) %arg217, i64 %20
  %22 = zext i32 %7 to i64
  %23 = getelementptr [8192 x [640 x float]], ptr addrspace(1) %arg115, i64 0, i64 %9, i64 %22
  %add.51 = fadd float %15, %19
  %.inv10 = fcmp olt float %add.51, 0.000000e+00
  %maximum.83 = select i1 %.inv10, float 0.000000e+00, float %add.51
  %24 = zext i32 %6 to i64
  %25 = getelementptr [8192 x [640 x float]], ptr addrspace(1) %arg115, i64 0, i64 %9, i64 %24
  %26 = getelementptr inbounds float, ptr addrspace(1) %25, i64 512
  %27 = load float, ptr addrspace(1) %26, align 8, !invariant.load !28
  %28 = getelementptr inbounds [128 x float], ptr addrspace(1) %arg013, i64 0, i64 %24
  %29 = load float, ptr addrspace(1) %28, align 8, !invariant.load !28
  %add.54 = fadd float %27, %29
  %.inv11 = fcmp olt float %add.54, 0.000000e+00
  %maximum.86 = select i1 %.inv11, float 0.000000e+00, float %add.54
  %30 = zext i32 %5 to i64
  %31 = getelementptr [8192 x [640 x float]], ptr addrspace(1) %arg115, i64 0, i64 %9, i64 %30
  %32 = getelementptr inbounds float, ptr addrspace(1) %31, i64 512
  %33 = load float, ptr addrspace(1) %32, align 4, !invariant.load !28
  %34 = getelementptr inbounds [128 x float], ptr addrspace(1) %arg013, i64 0, i64 %30
  %35 = load float, ptr addrspace(1) %34, align 4, !invariant.load !28
  %add.57 = fadd float %33, %35
  %.inv12 = fcmp olt float %add.57, 0.000000e+00
  %maximum.89 = select i1 %.inv12, float 0.000000e+00, float %add.57
  %36 = insertelement <4 x float> poison, float %maximum.8, i32 0
  %37 = insertelement <4 x float> %36, float %maximum.83, i32 1
  %38 = insertelement <4 x float> %37, float %maximum.86, i32 2
  %39 = insertelement <4 x float> %38, float %maximum.89, i32 3
  store <4 x float> %39, ptr addrspace(1) %21, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(256) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2097152) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(256) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg6) local_unnamed_addr #4 {
entry:
  %arg669 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg567 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg465 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg363 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg261 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg159 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg057 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %2 = lshr i32 %0, 5
  %3 = mul nuw nsw i32 %1, 3
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 8192
  br i1 %5, label %tile_loop.loop_header9.preheader, label %common.ret

tile_loop.loop_header9.preheader:                 ; preds = %entry
  %6 = and i32 %0, 31
  %7 = zext i32 %4 to i64
  %8 = zext i32 %6 to i64
  %Arg_2.315 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg261, i64 0, i64 %7, i64 %8
  %Arg_2.316 = load float, ptr addrspace(1) %Arg_2.315, align 4, !invariant.load !28
  %Arg_3.417 = getelementptr inbounds [64 x float], ptr addrspace(1) %arg363, i64 0, i64 %8
  %Arg_3.418 = load float, ptr addrspace(1) %Arg_3.417, align 4, !invariant.load !28
  %add.619 = fadd float %Arg_2.316, %Arg_3.418
  %.inv = fcmp olt float %add.619, 0.000000e+00
  %maximum.921 = select i1 %.inv, float 0.000000e+00, float %add.619
  %Arg_0.122 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg057, i64 0, i64 %7, i64 %8
  %Arg_0.123 = load float, ptr addrspace(1) %Arg_0.122, align 4, !invariant.load !28
  %Arg_1.224 = getelementptr inbounds [64 x float], ptr addrspace(1) %arg159, i64 0, i64 %8
  %Arg_1.225 = load float, ptr addrspace(1) %Arg_1.224, align 4, !invariant.load !28
  %add.1126 = fadd float %Arg_0.123, %Arg_1.225
  %.inv44 = fcmp olt float %add.1126, 0.000000e+00
  %maximum.1227 = select i1 %.inv44, float 0.000000e+00, float %add.1126
  %multiply.1328 = fmul float %maximum.921, %maximum.1227
  %add.17.i54 = fadd float %multiply.1328, 0.000000e+00
  %9 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg669, i64 0, i64 %7, i64 %8
  store float %maximum.921, ptr addrspace(1) %9, align 4
  %10 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg567, i64 0, i64 %7, i64 %8
  store float %maximum.1227, ptr addrspace(1) %10, align 4
  %Arg_2.315.172 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.315, i64 32
  %Arg_2.316.1 = load float, ptr addrspace(1) %Arg_2.315.172, align 4, !invariant.load !28
  %Arg_3.417.174 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.417, i64 32
  %Arg_3.418.1 = load float, ptr addrspace(1) %Arg_3.417.174, align 4, !invariant.load !28
  %add.619.1 = fadd float %Arg_2.316.1, %Arg_3.418.1
  %.inv.1 = fcmp olt float %add.619.1, 0.000000e+00
  %maximum.921.1 = select i1 %.inv.1, float 0.000000e+00, float %add.619.1
  %Arg_0.122.176 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.122, i64 32
  %Arg_0.123.1 = load float, ptr addrspace(1) %Arg_0.122.176, align 4, !invariant.load !28
  %Arg_1.224.178 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.224, i64 32
  %Arg_1.225.1 = load float, ptr addrspace(1) %Arg_1.224.178, align 4, !invariant.load !28
  %add.1126.1 = fadd float %Arg_0.123.1, %Arg_1.225.1
  %.inv44.1 = fcmp olt float %add.1126.1, 0.000000e+00
  %maximum.1227.1 = select i1 %.inv44.1, float 0.000000e+00, float %add.1126.1
  %multiply.1328.1 = fmul float %maximum.921.1, %maximum.1227.1
  %add.17.i54.1 = fadd float %add.17.i54, %multiply.1328.1
  %11 = getelementptr inbounds float, ptr addrspace(1) %9, i64 32
  store float %maximum.921.1, ptr addrspace(1) %11, align 4
  %12 = getelementptr inbounds float, ptr addrspace(1) %10, i64 32
  store float %maximum.1227.1, ptr addrspace(1) %12, align 4
  %13 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.17.i54.1, i32 16, i32 31)
  %add.17.i = fadd float %add.17.i54.1, %13
  %14 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.17.i, i32 8, i32 31)
  %add.17.i50 = fadd float %add.17.i, %14
  %15 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.17.i50, i32 4, i32 31)
  %add.17.i51 = fadd float %add.17.i50, %15
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.17.i51, i32 2, i32 31)
  %add.17.i52 = fadd float %add.17.i51, %16
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.17.i52, i32 1, i32 31)
  %18 = icmp eq i32 %6, 0
  %19 = zext i32 %2 to i64
  %20 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 %19, i64 0, i64 0
  %add.17.i53 = fadd float %add.17.i52, %17
  br i1 %18, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %tile_loop.loop_header9.preheader
  %21 = icmp eq i32 %6, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [8192 x float], ptr addrspace(1) %arg465, i64 0, i64 %7
  br i1 %21, label %reduction_write_output-true, label %common.ret

intra_warp_reduce_write-true:                     ; preds = %tile_loop.loop_header9.preheader
  store float %add.17.i53, ptr addrspace(3) %20, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %20, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #5

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #6

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion(ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg1) local_unnamed_addr #3 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !41
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !31
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !28
  %6 = fneg float %5
  %7 = tail call float @llvm.fma.f32(float %6, float 0x3F777313A0000000, float 5.000000e-01)
  %8 = tail call float @llvm.nvvm.saturate.f(float %7) #4
  %9 = tail call float @llvm.nvvm.fma.rm.f(float %8, float 2.520000e+02, float 0x4168000020000000) #4
  %10 = fadd float %9, 0xC168000FE0000000
  %11 = fneg float %10
  %12 = tail call float @llvm.fma.f32(float %6, float 0x3FF7154760000000, float %11)
  %13 = tail call float @llvm.fma.f32(float %6, float 0x3E54AE0C00000000, float %12)
  %14 = bitcast float %9 to i32
  %15 = shl i32 %14, 23
  %16 = bitcast i32 %15 to float
  %17 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %13) #4
  %18 = fmul float %17, %16
  %add.6 = fadd float %18, 1.000000e+00
  %divide.7 = fdiv float 1.000000e+00, %add.6
  %19 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  store float %divide.7, ptr addrspace(1) %19, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_15(ptr noalias nocapture readonly align 128 dereferenceable(983040) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(425984) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(557056) %arg2) local_unnamed_addr #3 {
entry:
  %arg212 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg110 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg08 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !31
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = icmp ult i32 %linear_index, 106496
  br i1 %3, label %concatenate.pivot.0., label %concatenate.pivot.106496.3

fusion_15.in_bounds-after:                        ; preds = %slice0-after, %slice1-true
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %linear_index.frozen = freeze i32 %linear_index
  %4 = udiv i32 %linear_index.frozen, 13
  %5 = mul i32 %4, 13
  %.decomposed = sub i32 %linear_index.frozen, %5
  br label %concatenate.11.merge

concatenate.pivot.106496.3:                       ; preds = %entry
  %6 = add nsw i32 %linear_index, -106496
  %.frozen = freeze i32 %6
  %7 = udiv i32 %.frozen, 17
  %8 = mul i32 %7, 17
  %.decomposed7 = sub i32 %.frozen, %8
  %9 = add nuw nsw i32 %.decomposed7, 13
  br label %concatenate.11.merge

concatenate.11.merge:                             ; preds = %concatenate.pivot.106496.3, %concatenate.pivot.0.
  %.sink6 = phi i32 [ %7, %concatenate.pivot.106496.3 ], [ %4, %concatenate.pivot.0. ]
  %.sink5 = phi i32 [ %9, %concatenate.pivot.106496.3 ], [ %.decomposed, %concatenate.pivot.0. ]
  %10 = icmp ult i32 %linear_index, 106496
  %11 = zext i32 %.sink6 to i64
  %12 = zext i32 %.sink5 to i64
  %13 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg08, i64 0, i64 %11, i64 %12
  %.in = load float, ptr addrspace(1) %13, align 4, !invariant.load !28
  %14 = fmul float %.in, 2.000000e+00
  %15 = zext i32 %linear_index to i64
  %16 = getelementptr inbounds [106496 x float], ptr addrspace(1) %arg110, i64 0, i64 %15
  br i1 %10, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.11.merge
  %17 = icmp ugt i32 %linear_index, 106495
  %18 = add nsw i32 %linear_index, -106496
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds [139264 x float], ptr addrspace(1) %arg212, i64 0, i64 %19
  br i1 %17, label %slice1-true, label %fusion_15.in_bounds-after

slice0-true:                                      ; preds = %concatenate.11.merge
  store float %14, ptr addrspace(1) %16, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  store float %14, ptr addrspace(1) %20, align 4
  br label %fusion_15.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.saturate.f(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rm.f(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #8

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nofree nosync nounwind memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind }
attributes #5 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #6 = { convergent nocallback nounwind }
attributes #7 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #8 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23}
!llvm.ident = !{!24}
!llvm.module.flags = !{!25}

!0 = !{ptr @fusion_7, !"kernel", i32 1}
!1 = !{ptr @fusion_7, !"reqntidx", i32 256}
!2 = !{ptr @fusion_8, !"kernel", i32 1}
!3 = !{ptr @fusion_8, !"reqntidx", i32 256}
!4 = !{ptr @concatenate_3, !"kernel", i32 1}
!5 = !{ptr @concatenate_3, !"reqntidx", i32 1024}
!6 = !{ptr @add_4, !"kernel", i32 1}
!7 = !{ptr @add_4, !"reqntidx", i32 128}
!8 = !{ptr @fusion_12, !"kernel", i32 1}
!9 = !{ptr @fusion_12, !"reqntidx", i32 256}
!10 = !{ptr @fusion_11, !"kernel", i32 1}
!11 = !{ptr @fusion_11, !"reqntidx", i32 256}
!12 = !{ptr @fusion_10, !"kernel", i32 1}
!13 = !{ptr @fusion_10, !"reqntidx", i32 256}
!14 = !{ptr @fusion_6, !"kernel", i32 1}
!15 = !{ptr @fusion_6, !"reqntidx", i32 256}
!16 = !{ptr @fusion_3, !"kernel", i32 1}
!17 = !{ptr @fusion_3, !"reqntidx", i32 256}
!18 = !{ptr @fusion_1, !"kernel", i32 1}
!19 = !{ptr @fusion_1, !"reqntidx", i32 96}
!20 = !{ptr @fusion, !"kernel", i32 1}
!21 = !{ptr @fusion, !"reqntidx", i32 1024}
!22 = !{ptr @fusion_15, !"kernel", i32 1}
!23 = !{ptr @fusion_15, !"reqntidx", i32 1024}
!24 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!25 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!26 = !{i32 0, i32 1088}
!27 = !{i32 0, i32 256}
!28 = !{}
!29 = !{i32 0, i32 6656}
!30 = !{i32 0, i32 80}
!31 = !{i32 0, i32 1024}
!32 = !{i32 0, i32 864}
!33 = !{i32 0, i32 128}
!34 = distinct !{!34, !35}
!35 = !{!"llvm.loop.vectorize.enable", i1 false}
!36 = !{i32 0, i32 4096}
!37 = !{i32 0, i32 240}
!38 = !{i32 0, i32 7744}
!39 = !{i32 0, i32 96}
!40 = !{i32 0, i32 2731}
!41 = !{i32 0, i32 8}
