target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@buffer_for_constant_12 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_12(ptr noalias nocapture readonly align 16 dereferenceable(1572864) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(786432) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4456448) %arg3) local_unnamed_addr #0 {
entry:
  %arg352 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg250 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg148 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg046 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
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
  %25 = load float, ptr addrspace(1) %24, align 4, !invariant.load !36
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
  %41 = load float, ptr addrspace(1) %40, align 4, !invariant.load !36
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
  %56 = load float, ptr addrspace(1) %55, align 4, !invariant.load !36
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
  %71 = load float, ptr addrspace(1) %70, align 4, !invariant.load !36
  %72 = getelementptr inbounds float, ptr addrspace(1) %27, i64 3
  store float %71, ptr addrspace(1) %72, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_13(ptr noalias nocapture readonly align 16 dereferenceable(14680064) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(27262976) %arg4) local_unnamed_addr #0 {
entry:
  %arg464 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg362 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg260 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg158 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg056 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
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
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !36
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
  %47 = load float, ptr addrspace(1) %46, align 4, !invariant.load !36
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
  %65 = load float, ptr addrspace(1) %64, align 4, !invariant.load !36
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
  %83 = load float, ptr addrspace(1) %82, align 4, !invariant.load !36
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !38
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
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
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !36
  %14 = zext i32 %linear_index to i64
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg28, i64 %14
  store float %13, ptr addrspace(1) %15, align 4
  ret void
}

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @add_5(ptr noalias nocapture align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg1) local_unnamed_addr #2 {
entry:
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !41
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = shl nuw nsw i64 %4, 2
  %6 = add nuw nsw i64 %5, 1769484
  %scevgep = getelementptr i8, ptr addrspace(1) %arg05, i64 %6
  %scevgep46 = getelementptr i8, ptr addrspace(1) %arg17, i64 %6
  br label %loop.loop_body

loop.loop_body:                                   ; preds = %add_5.in_bounds-after.1, %entry
  %lsr.iv47 = phi ptr addrspace(1) [ %scevgep48, %add_5.in_bounds-after.1 ], [ %scevgep46, %entry ]
  %lsr.iv37 = phi ptr addrspace(1) [ %scevgep38, %add_5.in_bounds-after.1 ], [ %scevgep, %entry ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %add_5.in_bounds-after.1 ], [ 442368, %entry ]
  %scevgep39 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 -1769484
  %7 = load <4 x float>, ptr addrspace(1) %scevgep39, align 16
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %scevgep50 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 -1769484
  %12 = load <4 x float>, ptr addrspace(1) %scevgep50, align 16, !invariant.load !36
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
  br i1 %22, label %add_5.in_bounds-true.1, label %add_5.in_bounds-after.1

add_5.in_bounds-true.1:                           ; preds = %loop.loop_body
  %scevgep43 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 -12
  %23 = load <4 x float>, ptr addrspace(1) %scevgep43, align 16
  %24 = extractelement <4 x float> %23, i32 0
  %25 = extractelement <4 x float> %23, i32 1
  %26 = extractelement <4 x float> %23, i32 2
  %27 = extractelement <4 x float> %23, i32 3
  %scevgep49 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 -12
  %28 = load <4 x float>, ptr addrspace(1) %scevgep49, align 16, !invariant.load !36
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
  br label %add_5.in_bounds-after.1

add_5.in_bounds-after.1:                          ; preds = %add_5.in_bounds-true.1, %loop.loop_body
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 884736
  %37 = add i32 %lsr.iv.next, -1327104
  %scevgep38 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 3538944
  %scevgep48 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 3538944
  %38 = icmp ugt i32 %37, 3309567
  br i1 %38, label %loop.loop_exit, label %loop.loop_body, !llvm.loop !42

loop.loop_exit:                                   ; preds = %add_5.in_bounds-after.1
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_17(ptr noalias nocapture readonly align 128 dereferenceable(20971520) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20971520) %arg1, ptr noalias nocapture align 128 dereferenceable(16777216) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg3) local_unnamed_addr #3 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
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
  %17 = load <4 x float>, ptr addrspace(1) %16, align 16, !invariant.load !36
  %18 = extractelement <4 x float> %17, i32 0
  %19 = extractelement <4 x float> %17, i32 1
  %20 = extractelement <4 x float> %17, i32 2
  %21 = extractelement <4 x float> %17, i32 3
  %add.5 = fadd float %12, %18
  %22 = zext i32 %4 to i64
  %23 = zext i32 %8 to i64
  %24 = getelementptr inbounds [8192 x [640 x float]], ptr addrspace(1) %arg112, i64 0, i64 %22, i64 %23
  %25 = load <2 x float>, ptr addrspace(1) %24, align 16, !invariant.load !36
  %26 = extractelement <2 x float> %25, i32 0
  %27 = extractelement <2 x float> %25, i32 1
  %add.7 = fadd float %add.5, %26
  %28 = getelementptr inbounds [8192 x [640 x float]], ptr addrspace(1) %arg010, i64 0, i64 %22, i64 %23
  %29 = load <2 x float>, ptr addrspace(1) %28, align 16, !invariant.load !36
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
  %35 = load float, ptr addrspace(1) %34, align 8, !invariant.load !36
  %add.75 = fadd float %add.54, %35
  %36 = getelementptr inbounds [8192 x [640 x float]], ptr addrspace(1) %arg010, i64 0, i64 %22, i64 %33
  %37 = load float, ptr addrspace(1) %36, align 8, !invariant.load !36
  %add.96 = fadd float %add.75, %37
  %add.57 = fadd float %15, %21
  %38 = zext i32 %5 to i64
  %39 = getelementptr inbounds [8192 x [640 x float]], ptr addrspace(1) %arg112, i64 0, i64 %22, i64 %38
  %40 = load float, ptr addrspace(1) %39, align 4, !invariant.load !36
  %add.78 = fadd float %add.57, %40
  %41 = getelementptr inbounds [8192 x [640 x float]], ptr addrspace(1) %arg010, i64 0, i64 %22, i64 %38
  %42 = load float, ptr addrspace(1) %41, align 4, !invariant.load !36
  %add.99 = fadd float %add.78, %42
  %43 = insertelement <4 x float> poison, float %add.9, i32 0
  %44 = insertelement <4 x float> %43, float %add.93, i32 1
  %45 = insertelement <4 x float> %44, float %add.96, i32 2
  %46 = insertelement <4 x float> %45, float %add.99, i32 3
  store <4 x float> %46, ptr addrspace(1) %10, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_16(ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(2048) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(16777216) %arg2) local_unnamed_addr #3 {
entry:
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
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
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16, !invariant.load !36
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg115, i64 0, i64 %15
  %17 = load <2 x float>, ptr addrspace(1) %16, align 16, !invariant.load !36
  %18 = extractelement <2 x float> %17, i32 0
  %19 = extractelement <2 x float> %17, i32 1
  %add.4 = fadd float %11, %18
  %.inv = fcmp olt float %add.4, 0.000000e+00
  %maximum.7 = select i1 %.inv, float 0.000000e+00, float %add.4
  %20 = getelementptr float, ptr addrspace(1) %arg217, i64 %8
  %21 = zext i32 %6 to i64
  %add.41 = fadd float %12, %19
  %.inv10 = fcmp olt float %add.41, 0.000000e+00
  %maximum.73 = select i1 %.inv10, float 0.000000e+00, float %add.41
  %22 = zext i32 %5 to i64
  %23 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg115, i64 0, i64 %22
  %24 = load float, ptr addrspace(1) %23, align 8, !invariant.load !36
  %add.44 = fadd float %13, %24
  %.inv11 = fcmp olt float %add.44, 0.000000e+00
  %maximum.76 = select i1 %.inv11, float 0.000000e+00, float %add.44
  %25 = zext i32 %4 to i64
  %26 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg115, i64 0, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !36
  %add.47 = fadd float %14, %27
  %.inv12 = fcmp olt float %add.47, 0.000000e+00
  %maximum.79 = select i1 %.inv12, float 0.000000e+00, float %add.47
  %28 = insertelement <4 x float> poison, float %maximum.7, i32 0
  %29 = insertelement <4 x float> %28, float %maximum.73, i32 1
  %30 = insertelement <4 x float> %29, float %maximum.76, i32 2
  %31 = insertelement <4 x float> %30, float %maximum.79, i32 3
  store <4 x float> %31, ptr addrspace(1) %20, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_15(ptr noalias nocapture readonly align 128 dereferenceable(983040) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(120) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(983040) %arg2) local_unnamed_addr #3 {
entry:
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !45
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
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
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16, !invariant.load !36
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds [30 x float], ptr addrspace(1) %arg115, i64 0, i64 %15
  %17 = load float, ptr addrspace(1) %16, align 4, !invariant.load !36
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
  %31 = getelementptr float, ptr addrspace(1) %arg217, i64 %8
  %32 = zext i32 %6 to i64
  %33 = getelementptr inbounds [30 x float], ptr addrspace(1) %arg115, i64 0, i64 %32
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !36
  %add.62 = fadd float %12, %34
  %35 = fneg float %add.62
  %36 = tail call float @llvm.fma.f32(float %35, float 0x3F777313A0000000, float 5.000000e-01)
  %37 = tail call float @llvm.nvvm.saturate.f(float %36) #4
  %38 = tail call float @llvm.nvvm.fma.rm.f(float %37, float 2.520000e+02, float 0x4168000020000000) #4
  %39 = fadd float %38, 0xC168000FE0000000
  %40 = fneg float %39
  %41 = tail call float @llvm.fma.f32(float %35, float 0x3FF7154760000000, float %40)
  %42 = tail call float @llvm.fma.f32(float %35, float 0x3E54AE0C00000000, float %41)
  %43 = bitcast float %38 to i32
  %44 = shl i32 %43, 23
  %45 = bitcast i32 %44 to float
  %46 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %42) #4
  %47 = fmul float %46, %45
  %add.93 = fadd float %47, 1.000000e+00
  %divide.104 = fdiv float 1.000000e+00, %add.93
  %48 = zext i32 %5 to i64
  %49 = getelementptr inbounds [30 x float], ptr addrspace(1) %arg115, i64 0, i64 %48
  %50 = load float, ptr addrspace(1) %49, align 4, !invariant.load !36
  %add.66 = fadd float %13, %50
  %51 = fneg float %add.66
  %52 = tail call float @llvm.fma.f32(float %51, float 0x3F777313A0000000, float 5.000000e-01)
  %53 = tail call float @llvm.nvvm.saturate.f(float %52) #4
  %54 = tail call float @llvm.nvvm.fma.rm.f(float %53, float 2.520000e+02, float 0x4168000020000000) #4
  %55 = fadd float %54, 0xC168000FE0000000
  %56 = fneg float %55
  %57 = tail call float @llvm.fma.f32(float %51, float 0x3FF7154760000000, float %56)
  %58 = tail call float @llvm.fma.f32(float %51, float 0x3E54AE0C00000000, float %57)
  %59 = bitcast float %54 to i32
  %60 = shl i32 %59, 23
  %61 = bitcast i32 %60 to float
  %62 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %58) #4
  %63 = fmul float %62, %61
  %add.97 = fadd float %63, 1.000000e+00
  %divide.108 = fdiv float 1.000000e+00, %add.97
  %64 = zext i32 %4 to i64
  %65 = getelementptr inbounds [30 x float], ptr addrspace(1) %arg115, i64 0, i64 %64
  %66 = load float, ptr addrspace(1) %65, align 4, !invariant.load !36
  %add.610 = fadd float %14, %66
  %67 = fneg float %add.610
  %68 = tail call float @llvm.fma.f32(float %67, float 0x3F777313A0000000, float 5.000000e-01)
  %69 = tail call float @llvm.nvvm.saturate.f(float %68) #4
  %70 = tail call float @llvm.nvvm.fma.rm.f(float %69, float 2.520000e+02, float 0x4168000020000000) #4
  %71 = fadd float %70, 0xC168000FE0000000
  %72 = fneg float %71
  %73 = tail call float @llvm.fma.f32(float %67, float 0x3FF7154760000000, float %72)
  %74 = tail call float @llvm.fma.f32(float %67, float 0x3E54AE0C00000000, float %73)
  %75 = bitcast float %70 to i32
  %76 = shl i32 %75, 23
  %77 = bitcast i32 %76 to float
  %78 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %74) #4
  %79 = fmul float %78, %77
  %add.911 = fadd float %79, 1.000000e+00
  %divide.1012 = fdiv float 1.000000e+00, %add.911
  %80 = insertelement <4 x float> poison, float %divide.10, i32 0
  %81 = insertelement <4 x float> %80, float %divide.104, i32 1
  %82 = insertelement <4 x float> %81, float %divide.108, i32 2
  %83 = insertelement <4 x float> %82, float %divide.1012, i32 3
  store <4 x float> %83, ptr addrspace(1) %31, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_7(ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(14680064) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(1572864) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(786432) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(38010880) %arg9) local_unnamed_addr #0 {
entry:
  %arg9124 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8122 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7120 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6118 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5116 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4114 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3112 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2110 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1108 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0106 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !46
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 1160
  %5 = mul i32 %4, 1160
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 1160
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 1160
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 1160
  %9 = icmp ult i32 %.decomposed, 768
  br i1 %9, label %concatenate.pivot.192., label %concatenate.pivot.1024.

concatenate.pivot.192.:                           ; preds = %entry
  %10 = icmp ult i32 %.decomposed, 192
  br i1 %10, label %concatenate.pivot.64., label %concatenate.pivot.640.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.192.
  %11 = icmp ult i32 %.decomposed, 64
  br i1 %11, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  %12 = udiv i32 %linear_index_base, 1160
  %13 = shl nuw nsw i32 %12, 6
  %14 = add nuw nsw i32 %13, %.decomposed
  br label %concatenate.10.merge

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  %15 = add nsw i32 %.decomposed, -64
  %16 = udiv i32 %linear_index_base, 1160
  %17 = shl nuw nsw i32 %16, 7
  %18 = add nuw nsw i32 %15, %17
  br label %concatenate.10.merge

concatenate.pivot.640.:                           ; preds = %concatenate.pivot.192.
  %19 = icmp ult i32 %.decomposed, 640
  %20 = udiv i32 %linear_index_base, 1160
  br i1 %19, label %concatenate.pivot.192.2, label %concatenate.pivot.640.3

concatenate.pivot.192.2:                          ; preds = %concatenate.pivot.640.
  %21 = add nsw i32 %.decomposed, -192
  %22 = mul nuw nsw i32 %20, 448
  %23 = add nuw nsw i32 %21, %22
  br label %concatenate.10.merge

concatenate.pivot.640.3:                          ; preds = %concatenate.pivot.640.
  %24 = add nsw i32 %.decomposed, -640
  %25 = shl nuw nsw i32 %20, 7
  %26 = add nuw nsw i32 %24, %25
  br label %concatenate.10.merge

concatenate.pivot.1024.:                          ; preds = %entry
  %27 = icmp ult i32 %.decomposed, 1024
  %28 = udiv i32 %linear_index_base, 1160
  br i1 %27, label %concatenate.pivot.896., label %concatenate.pivot.1072.

concatenate.pivot.896.:                           ; preds = %concatenate.pivot.1024.
  %29 = icmp ult i32 %.decomposed, 896
  %30 = shl nuw nsw i32 %28, 7
  br i1 %29, label %concatenate.pivot.768.4, label %concatenate.pivot.896.5

concatenate.pivot.768.4:                          ; preds = %concatenate.pivot.896.
  %31 = add nsw i32 %.decomposed, -768
  %32 = add nuw nsw i32 %31, %30
  br label %concatenate.10.merge

concatenate.pivot.896.5:                          ; preds = %concatenate.pivot.896.
  %33 = add nsw i32 %.decomposed, -896
  %34 = add nuw nsw i32 %33, %30
  br label %concatenate.10.merge

concatenate.pivot.1072.:                          ; preds = %concatenate.pivot.1024.
  %35 = icmp ult i32 %.decomposed, 1072
  br i1 %35, label %concatenate.pivot.1024.6, label %concatenate.pivot.1136.

concatenate.pivot.1024.6:                         ; preds = %concatenate.pivot.1072.
  %36 = add nsw i32 %.decomposed, -1024
  %37 = mul nuw nsw i32 %28, 48
  %38 = add nuw nsw i32 %36, %37
  br label %concatenate.10.merge

concatenate.pivot.1136.:                          ; preds = %concatenate.pivot.1072.
  %39 = icmp ult i32 %.decomposed, 1136
  br i1 %39, label %concatenate.pivot.1072.7, label %concatenate.pivot.1136.8

concatenate.pivot.1072.7:                         ; preds = %concatenate.pivot.1136.
  %40 = add nsw i32 %.decomposed, -1072
  %41 = shl nuw nsw i32 %28, 6
  %42 = add nuw nsw i32 %40, %41
  br label %concatenate.10.merge

concatenate.pivot.1136.8:                         ; preds = %concatenate.pivot.1136.
  %43 = add nsw i32 %.decomposed, -1136
  %44 = mul nuw nsw i32 %28, 24
  %45 = add nuw nsw i32 %43, %44
  br label %concatenate.10.merge

concatenate.10.merge:                             ; preds = %concatenate.pivot.1136.8, %concatenate.pivot.1072.7, %concatenate.pivot.1024.6, %concatenate.pivot.896.5, %concatenate.pivot.768.4, %concatenate.pivot.640.3, %concatenate.pivot.192.2, %concatenate.pivot.64.1, %concatenate.pivot.0.
  %.sink99 = phi i32 [ %45, %concatenate.pivot.1136.8 ], [ %42, %concatenate.pivot.1072.7 ], [ %38, %concatenate.pivot.1024.6 ], [ %34, %concatenate.pivot.896.5 ], [ %32, %concatenate.pivot.768.4 ], [ %26, %concatenate.pivot.640.3 ], [ %23, %concatenate.pivot.192.2 ], [ %18, %concatenate.pivot.64.1 ], [ %14, %concatenate.pivot.0. ]
  %arg8.sink = phi ptr addrspace(1) [ %arg8122, %concatenate.pivot.1136.8 ], [ %arg7120, %concatenate.pivot.1072.7 ], [ %arg6118, %concatenate.pivot.1024.6 ], [ %arg5116, %concatenate.pivot.896.5 ], [ %arg4114, %concatenate.pivot.768.4 ], [ %arg3112, %concatenate.pivot.640.3 ], [ %arg2110, %concatenate.pivot.192.2 ], [ %arg1108, %concatenate.pivot.64.1 ], [ %arg0106, %concatenate.pivot.0. ]
  %46 = zext i32 %.sink99 to i64
  %47 = getelementptr inbounds float, ptr addrspace(1) %arg8.sink, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !36
  %49 = zext i32 %linear_index_base to i64
  %50 = getelementptr float, ptr addrspace(1) %arg9124, i64 %49
  store float %48, ptr addrspace(1) %50, align 16
  %51 = icmp ult i32 %6, 768
  br i1 %51, label %concatenate.pivot.192.20, label %concatenate.pivot.1024.27

concatenate.pivot.192.20:                         ; preds = %concatenate.10.merge
  %52 = icmp ult i32 %6, 192
  br i1 %52, label %concatenate.pivot.64.21, label %concatenate.pivot.640.24

concatenate.pivot.64.21:                          ; preds = %concatenate.pivot.192.20
  %53 = icmp ult i32 %6, 64
  br i1 %53, label %concatenate.pivot.0.22, label %concatenate.pivot.64.23

concatenate.pivot.0.22:                           ; preds = %concatenate.pivot.64.21
  %54 = udiv i32 %linear_index_base, 1160
  %55 = shl nuw nsw i32 %54, 6
  %56 = add nuw nsw i32 %55, %6
  br label %concatenate.10.merge9

concatenate.pivot.64.23:                          ; preds = %concatenate.pivot.64.21
  %57 = add nsw i32 %6, -64
  %58 = udiv i32 %linear_index_base, 1160
  %59 = shl nuw nsw i32 %58, 7
  %60 = add nuw nsw i32 %57, %59
  br label %concatenate.10.merge9

concatenate.pivot.640.24:                         ; preds = %concatenate.pivot.192.20
  %61 = icmp ult i32 %6, 640
  %62 = udiv i32 %linear_index_base, 1160
  br i1 %61, label %concatenate.pivot.192.25, label %concatenate.pivot.640.26

concatenate.pivot.192.25:                         ; preds = %concatenate.pivot.640.24
  %63 = add nsw i32 %6, -192
  %64 = mul nuw nsw i32 %62, 448
  %65 = add nuw nsw i32 %63, %64
  br label %concatenate.10.merge9

concatenate.pivot.640.26:                         ; preds = %concatenate.pivot.640.24
  %66 = add nsw i32 %6, -640
  %67 = shl nuw nsw i32 %62, 7
  %68 = add nuw nsw i32 %66, %67
  br label %concatenate.10.merge9

concatenate.pivot.1024.27:                        ; preds = %concatenate.10.merge
  %69 = icmp ult i32 %6, 1024
  %70 = udiv i32 %linear_index_base, 1160
  br i1 %69, label %concatenate.pivot.896.28, label %concatenate.pivot.1072.31

concatenate.pivot.896.28:                         ; preds = %concatenate.pivot.1024.27
  %71 = icmp ult i32 %6, 896
  %72 = shl nuw nsw i32 %70, 7
  br i1 %71, label %concatenate.pivot.768.29, label %concatenate.pivot.896.30

concatenate.pivot.768.29:                         ; preds = %concatenate.pivot.896.28
  %73 = add nsw i32 %6, -768
  %74 = add nuw nsw i32 %73, %72
  br label %concatenate.10.merge9

concatenate.pivot.896.30:                         ; preds = %concatenate.pivot.896.28
  %75 = add nsw i32 %6, -896
  %76 = add nuw nsw i32 %75, %72
  br label %concatenate.10.merge9

concatenate.pivot.1072.31:                        ; preds = %concatenate.pivot.1024.27
  %77 = icmp ult i32 %6, 1072
  br i1 %77, label %concatenate.pivot.1024.32, label %concatenate.pivot.1136.33

concatenate.pivot.1024.32:                        ; preds = %concatenate.pivot.1072.31
  %78 = add nsw i32 %6, -1024
  %79 = mul nuw nsw i32 %70, 48
  %80 = add nuw nsw i32 %78, %79
  br label %concatenate.10.merge9

concatenate.pivot.1136.33:                        ; preds = %concatenate.pivot.1072.31
  %81 = icmp ult i32 %6, 1136
  br i1 %81, label %concatenate.pivot.1072.34, label %concatenate.pivot.1136.35

concatenate.pivot.1072.34:                        ; preds = %concatenate.pivot.1136.33
  %82 = add nsw i32 %6, -1072
  %83 = shl nuw nsw i32 %70, 6
  %84 = add nuw nsw i32 %82, %83
  br label %concatenate.10.merge9

concatenate.pivot.1136.35:                        ; preds = %concatenate.pivot.1136.33
  %85 = add nsw i32 %6, -1136
  %86 = mul nuw nsw i32 %70, 24
  %87 = add nuw nsw i32 %85, %86
  br label %concatenate.10.merge9

concatenate.10.merge9:                            ; preds = %concatenate.pivot.1136.35, %concatenate.pivot.1072.34, %concatenate.pivot.1024.32, %concatenate.pivot.896.30, %concatenate.pivot.768.29, %concatenate.pivot.640.26, %concatenate.pivot.192.25, %concatenate.pivot.64.23, %concatenate.pivot.0.22
  %.sink101 = phi i32 [ %87, %concatenate.pivot.1136.35 ], [ %84, %concatenate.pivot.1072.34 ], [ %80, %concatenate.pivot.1024.32 ], [ %76, %concatenate.pivot.896.30 ], [ %74, %concatenate.pivot.768.29 ], [ %68, %concatenate.pivot.640.26 ], [ %65, %concatenate.pivot.192.25 ], [ %60, %concatenate.pivot.64.23 ], [ %56, %concatenate.pivot.0.22 ]
  %arg8.sink100 = phi ptr addrspace(1) [ %arg8122, %concatenate.pivot.1136.35 ], [ %arg7120, %concatenate.pivot.1072.34 ], [ %arg6118, %concatenate.pivot.1024.32 ], [ %arg5116, %concatenate.pivot.896.30 ], [ %arg4114, %concatenate.pivot.768.29 ], [ %arg3112, %concatenate.pivot.640.26 ], [ %arg2110, %concatenate.pivot.192.25 ], [ %arg1108, %concatenate.pivot.64.23 ], [ %arg0106, %concatenate.pivot.0.22 ]
  %88 = zext i32 %.sink101 to i64
  %89 = getelementptr inbounds float, ptr addrspace(1) %arg8.sink100, i64 %88
  %90 = load float, ptr addrspace(1) %89, align 4, !invariant.load !36
  %91 = getelementptr inbounds float, ptr addrspace(1) %50, i64 1
  store float %90, ptr addrspace(1) %91, align 4
  %92 = icmp ult i32 %7, 768
  br i1 %92, label %concatenate.pivot.192.47, label %concatenate.pivot.1024.54

concatenate.pivot.192.47:                         ; preds = %concatenate.10.merge9
  %93 = icmp ult i32 %7, 192
  br i1 %93, label %concatenate.pivot.64.48, label %concatenate.pivot.640.51

concatenate.pivot.64.48:                          ; preds = %concatenate.pivot.192.47
  %94 = icmp ult i32 %7, 64
  br i1 %94, label %concatenate.pivot.0.49, label %concatenate.pivot.64.50

concatenate.pivot.0.49:                           ; preds = %concatenate.pivot.64.48
  %95 = udiv i32 %linear_index_base, 1160
  %96 = shl nuw nsw i32 %95, 6
  %97 = add nuw nsw i32 %96, %7
  br label %concatenate.10.merge36

concatenate.pivot.64.50:                          ; preds = %concatenate.pivot.64.48
  %98 = add nsw i32 %7, -64
  %99 = udiv i32 %linear_index_base, 1160
  %100 = shl nuw nsw i32 %99, 7
  %101 = add nuw nsw i32 %98, %100
  br label %concatenate.10.merge36

concatenate.pivot.640.51:                         ; preds = %concatenate.pivot.192.47
  %102 = icmp ult i32 %7, 640
  %103 = udiv i32 %linear_index_base, 1160
  br i1 %102, label %concatenate.pivot.192.52, label %concatenate.pivot.640.53

concatenate.pivot.192.52:                         ; preds = %concatenate.pivot.640.51
  %104 = add nsw i32 %7, -192
  %105 = mul nuw nsw i32 %103, 448
  %106 = add nuw nsw i32 %104, %105
  br label %concatenate.10.merge36

concatenate.pivot.640.53:                         ; preds = %concatenate.pivot.640.51
  %107 = add nsw i32 %7, -640
  %108 = shl nuw nsw i32 %103, 7
  %109 = add nuw nsw i32 %107, %108
  br label %concatenate.10.merge36

concatenate.pivot.1024.54:                        ; preds = %concatenate.10.merge9
  %110 = icmp ult i32 %7, 1024
  %111 = udiv i32 %linear_index_base, 1160
  br i1 %110, label %concatenate.pivot.896.55, label %concatenate.pivot.1072.58

concatenate.pivot.896.55:                         ; preds = %concatenate.pivot.1024.54
  %112 = icmp ult i32 %7, 896
  %113 = shl nuw nsw i32 %111, 7
  br i1 %112, label %concatenate.pivot.768.56, label %concatenate.pivot.896.57

concatenate.pivot.768.56:                         ; preds = %concatenate.pivot.896.55
  %114 = add nsw i32 %7, -768
  %115 = add nuw nsw i32 %114, %113
  br label %concatenate.10.merge36

concatenate.pivot.896.57:                         ; preds = %concatenate.pivot.896.55
  %116 = add nsw i32 %7, -896
  %117 = add nuw nsw i32 %116, %113
  br label %concatenate.10.merge36

concatenate.pivot.1072.58:                        ; preds = %concatenate.pivot.1024.54
  %118 = icmp ult i32 %7, 1072
  br i1 %118, label %concatenate.pivot.1024.59, label %concatenate.pivot.1136.60

concatenate.pivot.1024.59:                        ; preds = %concatenate.pivot.1072.58
  %119 = add nsw i32 %7, -1024
  %120 = mul nuw nsw i32 %111, 48
  %121 = add nuw nsw i32 %119, %120
  br label %concatenate.10.merge36

concatenate.pivot.1136.60:                        ; preds = %concatenate.pivot.1072.58
  %122 = icmp ult i32 %7, 1136
  br i1 %122, label %concatenate.pivot.1072.61, label %concatenate.pivot.1136.62

concatenate.pivot.1072.61:                        ; preds = %concatenate.pivot.1136.60
  %123 = add nsw i32 %7, -1072
  %124 = shl nuw nsw i32 %111, 6
  %125 = add nuw nsw i32 %123, %124
  br label %concatenate.10.merge36

concatenate.pivot.1136.62:                        ; preds = %concatenate.pivot.1136.60
  %126 = add nsw i32 %7, -1136
  %127 = mul nuw nsw i32 %111, 24
  %128 = add nuw nsw i32 %126, %127
  br label %concatenate.10.merge36

concatenate.10.merge36:                           ; preds = %concatenate.pivot.1136.62, %concatenate.pivot.1072.61, %concatenate.pivot.1024.59, %concatenate.pivot.896.57, %concatenate.pivot.768.56, %concatenate.pivot.640.53, %concatenate.pivot.192.52, %concatenate.pivot.64.50, %concatenate.pivot.0.49
  %.sink103 = phi i32 [ %128, %concatenate.pivot.1136.62 ], [ %125, %concatenate.pivot.1072.61 ], [ %121, %concatenate.pivot.1024.59 ], [ %117, %concatenate.pivot.896.57 ], [ %115, %concatenate.pivot.768.56 ], [ %109, %concatenate.pivot.640.53 ], [ %106, %concatenate.pivot.192.52 ], [ %101, %concatenate.pivot.64.50 ], [ %97, %concatenate.pivot.0.49 ]
  %arg8.sink102 = phi ptr addrspace(1) [ %arg8122, %concatenate.pivot.1136.62 ], [ %arg7120, %concatenate.pivot.1072.61 ], [ %arg6118, %concatenate.pivot.1024.59 ], [ %arg5116, %concatenate.pivot.896.57 ], [ %arg4114, %concatenate.pivot.768.56 ], [ %arg3112, %concatenate.pivot.640.53 ], [ %arg2110, %concatenate.pivot.192.52 ], [ %arg1108, %concatenate.pivot.64.50 ], [ %arg0106, %concatenate.pivot.0.49 ]
  %129 = zext i32 %.sink103 to i64
  %130 = getelementptr inbounds float, ptr addrspace(1) %arg8.sink102, i64 %129
  %131 = load float, ptr addrspace(1) %130, align 4, !invariant.load !36
  %132 = getelementptr inbounds float, ptr addrspace(1) %50, i64 2
  store float %131, ptr addrspace(1) %132, align 8
  %133 = icmp ult i32 %8, 768
  br i1 %133, label %concatenate.pivot.192.74, label %concatenate.pivot.1024.81

concatenate.pivot.192.74:                         ; preds = %concatenate.10.merge36
  %134 = icmp ult i32 %8, 192
  br i1 %134, label %concatenate.pivot.64.75, label %concatenate.pivot.640.78

concatenate.pivot.64.75:                          ; preds = %concatenate.pivot.192.74
  %135 = icmp ult i32 %8, 64
  br i1 %135, label %concatenate.pivot.0.76, label %concatenate.pivot.64.77

concatenate.pivot.0.76:                           ; preds = %concatenate.pivot.64.75
  %136 = udiv i32 %linear_index_base, 1160
  %137 = shl nuw nsw i32 %136, 6
  %138 = add nuw nsw i32 %137, %8
  br label %concatenate.10.merge63

concatenate.pivot.64.77:                          ; preds = %concatenate.pivot.64.75
  %139 = add nsw i32 %8, -64
  %140 = udiv i32 %linear_index_base, 1160
  %141 = shl nuw nsw i32 %140, 7
  %142 = add nuw nsw i32 %139, %141
  br label %concatenate.10.merge63

concatenate.pivot.640.78:                         ; preds = %concatenate.pivot.192.74
  %143 = icmp ult i32 %8, 640
  %144 = udiv i32 %linear_index_base, 1160
  br i1 %143, label %concatenate.pivot.192.79, label %concatenate.pivot.640.80

concatenate.pivot.192.79:                         ; preds = %concatenate.pivot.640.78
  %145 = add nsw i32 %8, -192
  %146 = mul nuw nsw i32 %144, 448
  %147 = add nuw nsw i32 %145, %146
  br label %concatenate.10.merge63

concatenate.pivot.640.80:                         ; preds = %concatenate.pivot.640.78
  %148 = add nsw i32 %8, -640
  %149 = shl nuw nsw i32 %144, 7
  %150 = add nuw nsw i32 %148, %149
  br label %concatenate.10.merge63

concatenate.pivot.1024.81:                        ; preds = %concatenate.10.merge36
  %151 = icmp ult i32 %8, 1024
  br i1 %151, label %concatenate.pivot.896.82, label %concatenate.pivot.1072.85

concatenate.pivot.896.82:                         ; preds = %concatenate.pivot.1024.81
  %152 = icmp ult i32 %8, 896
  %153 = shl nuw nsw i32 %4, 7
  br i1 %152, label %concatenate.pivot.768.83, label %concatenate.pivot.896.84

concatenate.pivot.768.83:                         ; preds = %concatenate.pivot.896.82
  %154 = add nsw i32 %8, -768
  %155 = add nuw nsw i32 %154, %153
  br label %concatenate.10.merge63

concatenate.pivot.896.84:                         ; preds = %concatenate.pivot.896.82
  %156 = add nsw i32 %8, -896
  %157 = add nuw nsw i32 %156, %153
  br label %concatenate.10.merge63

concatenate.pivot.1072.85:                        ; preds = %concatenate.pivot.1024.81
  %158 = icmp ult i32 %8, 1072
  br i1 %158, label %concatenate.pivot.1024.86, label %concatenate.pivot.1136.87

concatenate.pivot.1024.86:                        ; preds = %concatenate.pivot.1072.85
  %159 = add nsw i32 %8, -1024
  %160 = mul nuw nsw i32 %4, 48
  %161 = add nuw nsw i32 %159, %160
  br label %concatenate.10.merge63

concatenate.pivot.1136.87:                        ; preds = %concatenate.pivot.1072.85
  %162 = icmp ult i32 %8, 1136
  br i1 %162, label %concatenate.pivot.1072.88, label %concatenate.pivot.1136.89

concatenate.pivot.1072.88:                        ; preds = %concatenate.pivot.1136.87
  %163 = add nsw i32 %8, -1072
  %164 = shl nuw nsw i32 %4, 6
  %165 = add nuw nsw i32 %163, %164
  br label %concatenate.10.merge63

concatenate.pivot.1136.89:                        ; preds = %concatenate.pivot.1136.87
  %166 = add nsw i32 %8, -1136
  %167 = mul nuw nsw i32 %4, 24
  %168 = add nuw nsw i32 %166, %167
  br label %concatenate.10.merge63

concatenate.10.merge63:                           ; preds = %concatenate.pivot.1136.89, %concatenate.pivot.1072.88, %concatenate.pivot.1024.86, %concatenate.pivot.896.84, %concatenate.pivot.768.83, %concatenate.pivot.640.80, %concatenate.pivot.192.79, %concatenate.pivot.64.77, %concatenate.pivot.0.76
  %.sink105 = phi i32 [ %168, %concatenate.pivot.1136.89 ], [ %165, %concatenate.pivot.1072.88 ], [ %161, %concatenate.pivot.1024.86 ], [ %157, %concatenate.pivot.896.84 ], [ %155, %concatenate.pivot.768.83 ], [ %150, %concatenate.pivot.640.80 ], [ %147, %concatenate.pivot.192.79 ], [ %142, %concatenate.pivot.64.77 ], [ %138, %concatenate.pivot.0.76 ]
  %arg8.sink104 = phi ptr addrspace(1) [ %arg8122, %concatenate.pivot.1136.89 ], [ %arg7120, %concatenate.pivot.1072.88 ], [ %arg6118, %concatenate.pivot.1024.86 ], [ %arg5116, %concatenate.pivot.896.84 ], [ %arg4114, %concatenate.pivot.768.83 ], [ %arg3112, %concatenate.pivot.640.80 ], [ %arg2110, %concatenate.pivot.192.79 ], [ %arg1108, %concatenate.pivot.64.77 ], [ %arg0106, %concatenate.pivot.0.76 ]
  %169 = zext i32 %.sink105 to i64
  %170 = getelementptr inbounds float, ptr addrspace(1) %arg8.sink104, i64 %169
  %171 = load float, ptr addrspace(1) %170, align 4, !invariant.load !36
  %172 = getelementptr inbounds float, ptr addrspace(1) %50, i64 3
  store float %171, ptr addrspace(1) %172, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_9(ptr noalias nocapture align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(2048) %arg1) local_unnamed_addr #3 {
entry:
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
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
  %17 = load <2 x float>, ptr addrspace(1) %16, align 16, !invariant.load !36
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
  %23 = load float, ptr addrspace(1) %22, align 8, !invariant.load !36
  %add.44 = fadd float %13, %23
  %.inv11 = fcmp olt float %add.44, 0.000000e+00
  %maximum.76 = select i1 %.inv11, float 0.000000e+00, float %add.44
  %24 = zext i32 %4 to i64
  %25 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg115, i64 0, i64 %24
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !36
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
define void @fusion_8(ptr noalias nocapture align 128 dereferenceable(983040) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(120) %arg1) local_unnamed_addr #3 {
entry:
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !45
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
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
  %17 = load float, ptr addrspace(1) %16, align 4, !invariant.load !36
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
  %33 = load float, ptr addrspace(1) %32, align 4, !invariant.load !36
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
  %49 = load float, ptr addrspace(1) %48, align 4, !invariant.load !36
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
  %65 = load float, ptr addrspace(1) %64, align 4, !invariant.load !36
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

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @add_15(ptr noalias nocapture align 128 dereferenceable(31719424) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(31719424) %arg1) local_unnamed_addr #2 {
entry:
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !41
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = shl nuw nsw i64 %4, 2
  %6 = add nuw nsw i64 %5, 1769484
  %scevgep = getelementptr i8, ptr addrspace(1) %arg05, i64 %6
  %scevgep46 = getelementptr i8, ptr addrspace(1) %arg17, i64 %6
  br label %loop.loop_body

loop.loop_body:                                   ; preds = %add_15.in_bounds-after.1, %entry
  %lsr.iv47 = phi ptr addrspace(1) [ %scevgep48, %add_15.in_bounds-after.1 ], [ %scevgep46, %entry ]
  %lsr.iv37 = phi ptr addrspace(1) [ %scevgep38, %add_15.in_bounds-after.1 ], [ %scevgep, %entry ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %add_15.in_bounds-after.1 ], [ 442368, %entry ]
  %scevgep39 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 -1769484
  %7 = load <4 x float>, ptr addrspace(1) %scevgep39, align 16
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %scevgep50 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 -1769484
  %12 = load <4 x float>, ptr addrspace(1) %scevgep50, align 16, !invariant.load !36
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
  %22 = icmp ult i32 %21, 7929856
  br i1 %22, label %add_15.in_bounds-true.1, label %add_15.in_bounds-after.1

add_15.in_bounds-true.1:                          ; preds = %loop.loop_body
  %scevgep43 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 -12
  %23 = load <4 x float>, ptr addrspace(1) %scevgep43, align 16
  %24 = extractelement <4 x float> %23, i32 0
  %25 = extractelement <4 x float> %23, i32 1
  %26 = extractelement <4 x float> %23, i32 2
  %27 = extractelement <4 x float> %23, i32 3
  %scevgep49 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 -12
  %28 = load <4 x float>, ptr addrspace(1) %scevgep49, align 16, !invariant.load !36
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
  br label %add_15.in_bounds-after.1

add_15.in_bounds-after.1:                         ; preds = %add_15.in_bounds-true.1, %loop.loop_body
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 884736
  %37 = add i32 %lsr.iv.next, -1327104
  %scevgep38 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 3538944
  %scevgep48 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 3538944
  %38 = icmp ugt i32 %37, 7045119
  br i1 %38, label %loop.loop_exit, label %loop.loop_body, !llvm.loop !47

loop.loop_exit:                                   ; preds = %add_15.in_bounds-after.1
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_10(ptr noalias nocapture readonly align 128 dereferenceable(4456448) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(27262976) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(983040) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(983040) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(3872) %arg4, ptr noalias nocapture align 128 dereferenceable(31719424) %arg5, ptr noalias nocapture align 128 dereferenceable(31719424) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(31719424) %arg7) local_unnamed_addr #0 {
entry:
  %arg7198 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6196 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5194 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4192 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3190 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2188 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1186 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0184 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !48
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
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
  br label %concatenate.19.merge

concatenate.pivot.832.3:                          ; preds = %entry
  %13 = add nsw i32 %.decomposed, -832
  %14 = mul nuw nsw i32 %4, 136
  %15 = add nuw nsw i32 %14, %13
  %16 = lshr i32 %13, 3
  %17 = add nuw nsw i32 %16, 13
  br label %concatenate.19.merge

concatenate.19.merge:                             ; preds = %concatenate.pivot.832.3, %concatenate.pivot.0.
  %.sink141 = phi i32 [ %17, %concatenate.pivot.832.3 ], [ %12, %concatenate.pivot.0. ]
  %.sink138 = phi i32 [ %15, %concatenate.pivot.832.3 ], [ %11, %concatenate.pivot.0. ]
  %arg0.sink = phi ptr addrspace(1) [ %arg0184, %concatenate.pivot.832.3 ], [ %arg1186, %concatenate.pivot.0. ]
  %18 = icmp ult i32 %.decomposed, 832
  %19 = zext i32 %4 to i64
  %20 = zext i32 %.sink141 to i64
  %21 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg2188, i64 0, i64 %19, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !36
  %multiply.102 = fmul float %22, 2.000000e+00
  %23 = zext i32 %.sink138 to i64
  %24 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink, i64 %23
  %25 = load float, ptr addrspace(1) %24, align 4, !invariant.load !36
  %multiply.17 = fmul float %multiply.102, %25
  %26 = zext i32 %linear_index_base to i64
  %27 = getelementptr float, ptr addrspace(1) %arg5194, i64 %26
  %28 = load float, ptr addrspace(1) %27, align 16
  %29 = getelementptr float, ptr addrspace(1) %arg6196, i64 %26
  %30 = load float, ptr addrspace(1) %29, align 16
  %add.20 = fadd float %28, %30
  %31 = zext i32 %.decomposed to i64
  %32 = getelementptr inbounds [968 x float], ptr addrspace(1) %arg4192, i64 0, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 4, !invariant.load !36
  %add.22 = fadd float %add.20, %33
  %.inv = fcmp olt float %add.22, 0.000000e+00
  %maximum.25 = select i1 %.inv, float 0.000000e+00, float %add.22
  %add.26 = fadd float %multiply.17, %maximum.25
  br i1 %18, label %concatenate.pivot.0.10, label %concatenate.pivot.832.11

concatenate.pivot.0.10:                           ; preds = %concatenate.19.merge
  %34 = mul nuw nsw i32 %4, 832
  %35 = add nuw nsw i32 %34, %.decomposed
  %36 = lshr i32 %.decomposed, 6
  br label %concatenate.36.merge

concatenate.pivot.832.11:                         ; preds = %concatenate.19.merge
  %37 = add nsw i32 %.decomposed, -832
  %38 = mul nuw nsw i32 %4, 136
  %39 = add nuw nsw i32 %38, %37
  %40 = lshr i32 %37, 3
  %41 = add nuw nsw i32 %40, 13
  br label %concatenate.36.merge

concatenate.36.merge:                             ; preds = %concatenate.pivot.832.11, %concatenate.pivot.0.10
  %.sink147 = phi i32 [ %41, %concatenate.pivot.832.11 ], [ %36, %concatenate.pivot.0.10 ]
  %.sink144 = phi i32 [ %39, %concatenate.pivot.832.11 ], [ %35, %concatenate.pivot.0.10 ]
  %arg0.sink143 = phi ptr addrspace(1) [ %arg0184, %concatenate.pivot.832.11 ], [ %arg1186, %concatenate.pivot.0.10 ]
  %42 = zext i32 %.sink147 to i64
  %43 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg3190, i64 0, i64 %19, i64 %42
  %44 = load float, ptr addrspace(1) %43, align 4, !invariant.load !36
  %multiply.278 = fmul float %44, 2.000000e+00
  %45 = zext i32 %.sink144 to i64
  %46 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink143, i64 %45
  %47 = load float, ptr addrspace(1) %46, align 4, !invariant.load !36
  %multiply.34 = fmul float %multiply.278, %47
  %add.37 = fadd float %maximum.25, %multiply.34
  %48 = getelementptr float, ptr addrspace(1) %arg7198, i64 %26
  store float %add.26, ptr addrspace(1) %48, align 16
  store float %add.37, ptr addrspace(1) %29, align 16
  store float %maximum.25, ptr addrspace(1) %27, align 16
  %49 = icmp ult i32 %6, 832
  br i1 %49, label %concatenate.pivot.0.26, label %concatenate.pivot.832.27

concatenate.pivot.0.26:                           ; preds = %concatenate.36.merge
  %50 = mul nuw nsw i32 %4, 832
  %51 = add nuw nsw i32 %50, %6
  %52 = lshr i32 %6, 6
  br label %concatenate.19.merge16

concatenate.pivot.832.27:                         ; preds = %concatenate.36.merge
  %53 = add nsw i32 %6, -832
  %54 = mul nuw nsw i32 %4, 136
  %55 = add nuw nsw i32 %53, %54
  %56 = lshr i32 %53, 3
  %57 = add nuw nsw i32 %56, 13
  br label %concatenate.19.merge16

concatenate.19.merge16:                           ; preds = %concatenate.pivot.832.27, %concatenate.pivot.0.26
  %.sink153 = phi i32 [ %57, %concatenate.pivot.832.27 ], [ %52, %concatenate.pivot.0.26 ]
  %.sink150 = phi i32 [ %55, %concatenate.pivot.832.27 ], [ %51, %concatenate.pivot.0.26 ]
  %arg0.sink149 = phi ptr addrspace(1) [ %arg0184, %concatenate.pivot.832.27 ], [ %arg1186, %concatenate.pivot.0.26 ]
  %58 = icmp ult i32 %6, 832
  %59 = zext i32 %.sink153 to i64
  %60 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg2188, i64 0, i64 %19, i64 %59
  %61 = load float, ptr addrspace(1) %60, align 4, !invariant.load !36
  %multiply.1023 = fmul float %61, 2.000000e+00
  %62 = zext i32 %.sink150 to i64
  %63 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink149, i64 %62
  %64 = load float, ptr addrspace(1) %63, align 4, !invariant.load !36
  %multiply.1724 = fmul float %multiply.1023, %64
  %65 = getelementptr inbounds float, ptr addrspace(1) %27, i64 1
  %66 = load float, ptr addrspace(1) %65, align 4
  %67 = getelementptr inbounds float, ptr addrspace(1) %29, i64 1
  %68 = load float, ptr addrspace(1) %67, align 4
  %add.2028 = fadd float %66, %68
  %69 = zext i32 %6 to i64
  %70 = getelementptr inbounds [968 x float], ptr addrspace(1) %arg4192, i64 0, i64 %69
  %71 = load float, ptr addrspace(1) %70, align 4, !invariant.load !36
  %add.2229 = fadd float %add.2028, %71
  %.inv131 = fcmp olt float %add.2229, 0.000000e+00
  %maximum.2531 = select i1 %.inv131, float 0.000000e+00, float %add.2229
  %add.2632 = fadd float %multiply.1724, %maximum.2531
  br i1 %58, label %concatenate.pivot.0.43, label %concatenate.pivot.832.44

concatenate.pivot.0.43:                           ; preds = %concatenate.19.merge16
  %72 = mul nuw nsw i32 %4, 832
  %73 = add nuw nsw i32 %72, %6
  %74 = lshr i32 %6, 6
  br label %concatenate.36.merge33

concatenate.pivot.832.44:                         ; preds = %concatenate.19.merge16
  %75 = add nsw i32 %6, -832
  %76 = mul nuw nsw i32 %4, 136
  %77 = add nuw nsw i32 %75, %76
  %78 = lshr i32 %75, 3
  %79 = add nuw nsw i32 %78, 13
  br label %concatenate.36.merge33

concatenate.36.merge33:                           ; preds = %concatenate.pivot.832.44, %concatenate.pivot.0.43
  %.sink159 = phi i32 [ %79, %concatenate.pivot.832.44 ], [ %74, %concatenate.pivot.0.43 ]
  %.sink156 = phi i32 [ %77, %concatenate.pivot.832.44 ], [ %73, %concatenate.pivot.0.43 ]
  %arg0.sink155 = phi ptr addrspace(1) [ %arg0184, %concatenate.pivot.832.44 ], [ %arg1186, %concatenate.pivot.0.43 ]
  %80 = zext i32 %.sink159 to i64
  %81 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg3190, i64 0, i64 %19, i64 %80
  %82 = load float, ptr addrspace(1) %81, align 4, !invariant.load !36
  %multiply.2740 = fmul float %82, 2.000000e+00
  %83 = zext i32 %.sink156 to i64
  %84 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink155, i64 %83
  %85 = load float, ptr addrspace(1) %84, align 4, !invariant.load !36
  %multiply.3441 = fmul float %multiply.2740, %85
  %add.3749 = fadd float %maximum.2531, %multiply.3441
  %86 = getelementptr inbounds float, ptr addrspace(1) %48, i64 1
  store float %add.2632, ptr addrspace(1) %86, align 4
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %29, i64 4
  store float %add.3749, ptr addrspace(1) %sunkaddr, align 4
  %sunkaddr209 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 4
  store float %maximum.2531, ptr addrspace(1) %sunkaddr209, align 4
  %87 = icmp ult i32 %7, 832
  br i1 %87, label %concatenate.pivot.0.60, label %concatenate.pivot.832.61

concatenate.pivot.0.60:                           ; preds = %concatenate.36.merge33
  %88 = mul nuw nsw i32 %4, 832
  %89 = add nuw nsw i32 %88, %7
  %90 = lshr i32 %7, 6
  br label %concatenate.19.merge50

concatenate.pivot.832.61:                         ; preds = %concatenate.36.merge33
  %91 = add nsw i32 %7, -832
  %92 = mul nuw nsw i32 %4, 136
  %93 = add nuw nsw i32 %91, %92
  %94 = lshr i32 %91, 3
  %95 = add nuw nsw i32 %94, 13
  br label %concatenate.19.merge50

concatenate.19.merge50:                           ; preds = %concatenate.pivot.832.61, %concatenate.pivot.0.60
  %.sink165 = phi i32 [ %95, %concatenate.pivot.832.61 ], [ %90, %concatenate.pivot.0.60 ]
  %.sink162 = phi i32 [ %93, %concatenate.pivot.832.61 ], [ %89, %concatenate.pivot.0.60 ]
  %arg0.sink161 = phi ptr addrspace(1) [ %arg0184, %concatenate.pivot.832.61 ], [ %arg1186, %concatenate.pivot.0.60 ]
  %96 = icmp ult i32 %7, 832
  %97 = zext i32 %.sink165 to i64
  %98 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg2188, i64 0, i64 %19, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4, !invariant.load !36
  %multiply.1057 = fmul float %99, 2.000000e+00
  %100 = zext i32 %.sink162 to i64
  %101 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink161, i64 %100
  %102 = load float, ptr addrspace(1) %101, align 4, !invariant.load !36
  %multiply.1758 = fmul float %multiply.1057, %102
  %103 = getelementptr inbounds float, ptr addrspace(1) %27, i64 2
  %104 = load float, ptr addrspace(1) %103, align 8
  %105 = getelementptr inbounds float, ptr addrspace(1) %29, i64 2
  %106 = load float, ptr addrspace(1) %105, align 8
  %add.2062 = fadd float %104, %106
  %107 = zext i32 %7 to i64
  %108 = getelementptr inbounds [968 x float], ptr addrspace(1) %arg4192, i64 0, i64 %107
  %109 = load float, ptr addrspace(1) %108, align 4, !invariant.load !36
  %add.2263 = fadd float %add.2062, %109
  %.inv133 = fcmp olt float %add.2263, 0.000000e+00
  %maximum.2565 = select i1 %.inv133, float 0.000000e+00, float %add.2263
  %add.2666 = fadd float %multiply.1758, %maximum.2565
  br i1 %96, label %concatenate.pivot.0.77, label %concatenate.pivot.832.78

concatenate.pivot.0.77:                           ; preds = %concatenate.19.merge50
  %110 = mul nuw nsw i32 %4, 832
  %111 = add nuw nsw i32 %110, %7
  %112 = lshr i32 %7, 6
  br label %concatenate.36.merge67

concatenate.pivot.832.78:                         ; preds = %concatenate.19.merge50
  %113 = add nsw i32 %7, -832
  %114 = mul nuw nsw i32 %4, 136
  %115 = add nuw nsw i32 %113, %114
  %116 = lshr i32 %113, 3
  %117 = add nuw nsw i32 %116, 13
  br label %concatenate.36.merge67

concatenate.36.merge67:                           ; preds = %concatenate.pivot.832.78, %concatenate.pivot.0.77
  %.sink171 = phi i32 [ %117, %concatenate.pivot.832.78 ], [ %112, %concatenate.pivot.0.77 ]
  %.sink168 = phi i32 [ %115, %concatenate.pivot.832.78 ], [ %111, %concatenate.pivot.0.77 ]
  %arg0.sink167 = phi ptr addrspace(1) [ %arg0184, %concatenate.pivot.832.78 ], [ %arg1186, %concatenate.pivot.0.77 ]
  %118 = zext i32 %.sink171 to i64
  %119 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg3190, i64 0, i64 %19, i64 %118
  %120 = load float, ptr addrspace(1) %119, align 4, !invariant.load !36
  %multiply.2774 = fmul float %120, 2.000000e+00
  %121 = zext i32 %.sink168 to i64
  %122 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink167, i64 %121
  %123 = load float, ptr addrspace(1) %122, align 4, !invariant.load !36
  %multiply.3475 = fmul float %multiply.2774, %123
  %add.3783 = fadd float %maximum.2565, %multiply.3475
  %124 = getelementptr inbounds float, ptr addrspace(1) %48, i64 2
  store float %add.2666, ptr addrspace(1) %124, align 8
  %sunkaddr210 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 8
  store float %add.3783, ptr addrspace(1) %sunkaddr210, align 8
  %sunkaddr211 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 8
  store float %maximum.2565, ptr addrspace(1) %sunkaddr211, align 8
  %125 = icmp ult i32 %8, 832
  br i1 %125, label %concatenate.pivot.0.94, label %concatenate.pivot.832.95

concatenate.pivot.0.94:                           ; preds = %concatenate.36.merge67
  %126 = mul nuw nsw i32 %4, 832
  %127 = add nuw nsw i32 %126, %8
  %128 = lshr i32 %8, 6
  br label %concatenate.19.merge84

concatenate.pivot.832.95:                         ; preds = %concatenate.36.merge67
  %129 = add nsw i32 %8, -832
  %130 = mul nuw nsw i32 %4, 136
  %131 = add nuw nsw i32 %129, %130
  %132 = lshr i32 %129, 3
  %133 = add nuw nsw i32 %132, 13
  br label %concatenate.19.merge84

concatenate.19.merge84:                           ; preds = %concatenate.pivot.832.95, %concatenate.pivot.0.94
  %.sink177 = phi i32 [ %133, %concatenate.pivot.832.95 ], [ %128, %concatenate.pivot.0.94 ]
  %.sink174 = phi i32 [ %131, %concatenate.pivot.832.95 ], [ %127, %concatenate.pivot.0.94 ]
  %arg0.sink173 = phi ptr addrspace(1) [ %arg0184, %concatenate.pivot.832.95 ], [ %arg1186, %concatenate.pivot.0.94 ]
  %134 = icmp ult i32 %8, 832
  %135 = zext i32 %.sink177 to i64
  %136 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg2188, i64 0, i64 %19, i64 %135
  %137 = load float, ptr addrspace(1) %136, align 4, !invariant.load !36
  %138 = zext i32 %.sink174 to i64
  %139 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink173, i64 %138
  %140 = load float, ptr addrspace(1) %139, align 4, !invariant.load !36
  %141 = getelementptr inbounds float, ptr addrspace(1) %27, i64 3
  %142 = load float, ptr addrspace(1) %141, align 4
  %143 = getelementptr inbounds float, ptr addrspace(1) %29, i64 3
  %144 = load float, ptr addrspace(1) %143, align 4
  %145 = zext i32 %8 to i64
  %146 = getelementptr inbounds [968 x float], ptr addrspace(1) %arg4192, i64 0, i64 %145
  %147 = load float, ptr addrspace(1) %146, align 4, !invariant.load !36
  br i1 %134, label %concatenate.pivot.0.111, label %concatenate.pivot.832.112

concatenate.pivot.0.111:                          ; preds = %concatenate.19.merge84
  %148 = mul nuw nsw i32 %4, 832
  %149 = add nuw nsw i32 %148, %8
  %150 = lshr i32 %8, 6
  br label %concatenate.36.merge101

concatenate.pivot.832.112:                        ; preds = %concatenate.19.merge84
  %151 = add nsw i32 %8, -832
  %152 = mul nuw nsw i32 %4, 136
  %153 = add nuw nsw i32 %151, %152
  %154 = lshr i32 %151, 3
  %155 = add nuw nsw i32 %154, 13
  br label %concatenate.36.merge101

concatenate.36.merge101:                          ; preds = %concatenate.pivot.832.112, %concatenate.pivot.0.111
  %.sink183 = phi i32 [ %155, %concatenate.pivot.832.112 ], [ %150, %concatenate.pivot.0.111 ]
  %.sink180 = phi i32 [ %153, %concatenate.pivot.832.112 ], [ %149, %concatenate.pivot.0.111 ]
  %arg0.sink179 = phi ptr addrspace(1) [ %arg0184, %concatenate.pivot.832.112 ], [ %arg1186, %concatenate.pivot.0.111 ]
  %multiply.1091 = fmul float %137, 2.000000e+00
  %multiply.1792 = fmul float %multiply.1091, %140
  %156 = zext i32 %.sink183 to i64
  %157 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg3190, i64 0, i64 %19, i64 %156
  %158 = load float, ptr addrspace(1) %157, align 4, !invariant.load !36
  %multiply.27108 = fmul float %158, 2.000000e+00
  %159 = zext i32 %.sink180 to i64
  %160 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink179, i64 %159
  %161 = load float, ptr addrspace(1) %160, align 4, !invariant.load !36
  %multiply.34109 = fmul float %multiply.27108, %161
  %add.2096 = fadd float %142, %144
  %add.2297 = fadd float %add.2096, %147
  %.inv135 = fcmp olt float %add.2297, 0.000000e+00
  %maximum.2599 = select i1 %.inv135, float 0.000000e+00, float %add.2297
  %add.26100 = fadd float %multiply.1792, %maximum.2599
  %add.37117 = fadd float %maximum.2599, %multiply.34109
  %162 = getelementptr inbounds float, ptr addrspace(1) %48, i64 3
  store float %add.26100, ptr addrspace(1) %162, align 4
  %sunkaddr212 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 12
  store float %add.37117, ptr addrspace(1) %sunkaddr212, align 4
  %sunkaddr213 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 12
  store float %maximum.2599, ptr addrspace(1) %sunkaddr213, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_3(ptr noalias nocapture readonly align 16 dereferenceable(512) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20971520) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg2) local_unnamed_addr #3 {
entry:
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !39
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
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
  %13 = load <2 x float>, ptr addrspace(1) %12, align 16, !invariant.load !36
  %14 = extractelement <2 x float> %13, i32 0
  %15 = extractelement <2 x float> %13, i32 1
  %16 = getelementptr inbounds [128 x float], ptr addrspace(1) %arg013, i64 0, i64 %10
  %17 = load <2 x float>, ptr addrspace(1) %16, align 16, !invariant.load !36
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
  %27 = load float, ptr addrspace(1) %26, align 8, !invariant.load !36
  %28 = getelementptr inbounds [128 x float], ptr addrspace(1) %arg013, i64 0, i64 %24
  %29 = load float, ptr addrspace(1) %28, align 8, !invariant.load !36
  %add.54 = fadd float %27, %29
  %.inv11 = fcmp olt float %add.54, 0.000000e+00
  %maximum.86 = select i1 %.inv11, float 0.000000e+00, float %add.54
  %30 = zext i32 %5 to i64
  %31 = getelementptr [8192 x [640 x float]], ptr addrspace(1) %arg115, i64 0, i64 %9, i64 %30
  %32 = getelementptr inbounds float, ptr addrspace(1) %31, i64 512
  %33 = load float, ptr addrspace(1) %32, align 4, !invariant.load !36
  %34 = getelementptr inbounds [128 x float], ptr addrspace(1) %arg013, i64 0, i64 %30
  %35 = load float, ptr addrspace(1) %34, align 4, !invariant.load !36
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
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
  %Arg_2.316 = load float, ptr addrspace(1) %Arg_2.315, align 4, !invariant.load !36
  %Arg_3.417 = getelementptr inbounds [64 x float], ptr addrspace(1) %arg363, i64 0, i64 %8
  %Arg_3.418 = load float, ptr addrspace(1) %Arg_3.417, align 4, !invariant.load !36
  %add.619 = fadd float %Arg_2.316, %Arg_3.418
  %.inv = fcmp olt float %add.619, 0.000000e+00
  %maximum.921 = select i1 %.inv, float 0.000000e+00, float %add.619
  %Arg_0.122 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg057, i64 0, i64 %7, i64 %8
  %Arg_0.123 = load float, ptr addrspace(1) %Arg_0.122, align 4, !invariant.load !36
  %Arg_1.224 = getelementptr inbounds [64 x float], ptr addrspace(1) %arg159, i64 0, i64 %8
  %Arg_1.225 = load float, ptr addrspace(1) %Arg_1.224, align 4, !invariant.load !36
  %add.1126 = fadd float %Arg_0.123, %Arg_1.225
  %.inv44 = fcmp olt float %add.1126, 0.000000e+00
  %maximum.1227 = select i1 %.inv44, float 0.000000e+00, float %add.1126
  %multiply.1328 = fmul float %maximum.921, %maximum.1227
  %add.17.i54 = fadd float %multiply.1328, 0.000000e+00
  %9 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg567, i64 0, i64 %7, i64 %8
  store float %maximum.1227, ptr addrspace(1) %9, align 4
  %10 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg669, i64 0, i64 %7, i64 %8
  store float %maximum.921, ptr addrspace(1) %10, align 4
  %Arg_2.315.172 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.315, i64 32
  %Arg_2.316.1 = load float, ptr addrspace(1) %Arg_2.315.172, align 4, !invariant.load !36
  %Arg_3.417.174 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.417, i64 32
  %Arg_3.418.1 = load float, ptr addrspace(1) %Arg_3.417.174, align 4, !invariant.load !36
  %add.619.1 = fadd float %Arg_2.316.1, %Arg_3.418.1
  %.inv.1 = fcmp olt float %add.619.1, 0.000000e+00
  %maximum.921.1 = select i1 %.inv.1, float 0.000000e+00, float %add.619.1
  %Arg_0.122.176 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.122, i64 32
  %Arg_0.123.1 = load float, ptr addrspace(1) %Arg_0.122.176, align 4, !invariant.load !36
  %Arg_1.224.178 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.224, i64 32
  %Arg_1.225.1 = load float, ptr addrspace(1) %Arg_1.224.178, align 4, !invariant.load !36
  %add.1126.1 = fadd float %Arg_0.123.1, %Arg_1.225.1
  %.inv44.1 = fcmp olt float %add.1126.1, 0.000000e+00
  %maximum.1227.1 = select i1 %.inv44.1, float 0.000000e+00, float %add.1126.1
  %multiply.1328.1 = fmul float %maximum.921.1, %maximum.1227.1
  %add.17.i54.1 = fadd float %add.17.i54, %multiply.1328.1
  %11 = getelementptr inbounds float, ptr addrspace(1) %9, i64 32
  store float %maximum.1227.1, ptr addrspace(1) %11, align 4
  %12 = getelementptr inbounds float, ptr addrspace(1) %10, i64 32
  store float %maximum.921.1, ptr addrspace(1) %12, align 4
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !51
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !36
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
define void @copy_fusion(ptr noalias nocapture readonly align 128 dereferenceable(983040) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(983040) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(425984) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(425984) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(557056) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(557056) %arg5) local_unnamed_addr #3 {
entry:
  %arg561 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg459 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg357 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg255 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg153 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg051 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !45
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = icmp ult i32 %linear_index, 106496
  br i1 %3, label %concatenate.pivot.0., label %concatenate.pivot.106496.1

copy_fusion.in_bounds-after:                      ; preds = %slice1-after, %slice2-true
  ret void

concatenate.pivot.0.:                             ; preds = %entry
  %4 = urem i32 %linear_index, 13
  %5 = udiv i32 %linear_index, 13
  br label %concatenate.pivot.106496.6

concatenate.pivot.106496.1:                       ; preds = %entry
  %6 = add nsw i32 %linear_index, -106496
  %.frozen = freeze i32 %6
  %7 = udiv i32 %.frozen, 17
  %8 = mul i32 %7, 17
  %.decomposed44 = sub i32 %.frozen, %8
  %9 = add nuw nsw i32 %.decomposed44, 13
  br label %concatenate.pivot.106496.6

concatenate.pivot.106496.6:                       ; preds = %concatenate.pivot.0., %concatenate.pivot.106496.1
  %.sink34 = phi i32 [ %5, %concatenate.pivot.0. ], [ %7, %concatenate.pivot.106496.1 ]
  %.sink33 = phi i32 [ %4, %concatenate.pivot.0. ], [ %9, %concatenate.pivot.106496.1 ]
  %10 = icmp ult i32 %linear_index, 106496
  %11 = zext i32 %.sink34 to i64
  %12 = zext i32 %.sink33 to i64
  %13 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg051, i64 0, i64 %11, i64 %12
  %.in = load float, ptr addrspace(1) %13, align 4, !invariant.load !36
  %14 = fmul float %.in, 2.000000e+00
  br i1 %10, label %concatenate.pivot.0.7, label %concatenate.pivot.106496.8

concatenate.pivot.0.7:                            ; preds = %concatenate.pivot.106496.6
  %15 = urem i32 %linear_index, 13
  %16 = udiv i32 %linear_index, 13
  br label %concatenate.pivot.106496.16

concatenate.pivot.106496.8:                       ; preds = %concatenate.pivot.106496.6
  %17 = add nsw i32 %linear_index, -106496
  %.frozen45 = freeze i32 %17
  %18 = udiv i32 %.frozen45, 17
  %19 = mul i32 %18, 17
  %.decomposed46 = sub i32 %.frozen45, %19
  %20 = add nuw nsw i32 %.decomposed46, 13
  br label %concatenate.pivot.106496.16

concatenate.pivot.106496.16:                      ; preds = %concatenate.pivot.0.7, %concatenate.pivot.106496.8
  %.sink37 = phi i32 [ %16, %concatenate.pivot.0.7 ], [ %18, %concatenate.pivot.106496.8 ]
  %.sink36 = phi i32 [ %15, %concatenate.pivot.0.7 ], [ %20, %concatenate.pivot.106496.8 ]
  %21 = icmp ult i32 %linear_index, 106496
  %22 = zext i32 %.sink37 to i64
  %23 = zext i32 %.sink36 to i64
  %24 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg153, i64 0, i64 %22, i64 %23
  %.in31 = load float, ptr addrspace(1) %24, align 4, !invariant.load !36
  %25 = fmul float %.in31, 2.000000e+00
  br i1 %21, label %concatenate.pivot.0.17, label %concatenate.pivot.106496.18

concatenate.pivot.0.17:                           ; preds = %concatenate.pivot.106496.16
  %26 = urem i32 %linear_index, 13
  %27 = udiv i32 %linear_index, 13
  br label %concatenate.pivot.106496.26

concatenate.pivot.106496.18:                      ; preds = %concatenate.pivot.106496.16
  %28 = add nsw i32 %linear_index, -106496
  %.frozen47 = freeze i32 %28
  %29 = udiv i32 %.frozen47, 17
  %30 = mul i32 %29, 17
  %.decomposed48 = sub i32 %.frozen47, %30
  %31 = add nuw nsw i32 %.decomposed48, 13
  br label %concatenate.pivot.106496.26

concatenate.pivot.106496.26:                      ; preds = %concatenate.pivot.0.17, %concatenate.pivot.106496.18
  %.sink40 = phi i32 [ %27, %concatenate.pivot.0.17 ], [ %29, %concatenate.pivot.106496.18 ]
  %.sink39 = phi i32 [ %26, %concatenate.pivot.0.17 ], [ %31, %concatenate.pivot.106496.18 ]
  %32 = icmp ult i32 %linear_index, 106496
  %33 = zext i32 %.sink40 to i64
  %34 = zext i32 %.sink39 to i64
  %35 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg051, i64 0, i64 %33, i64 %34
  %.in29 = load float, ptr addrspace(1) %35, align 4, !invariant.load !36
  %36 = fmul float %.in29, 2.000000e+00
  br i1 %32, label %concatenate.pivot.0.27, label %concatenate.pivot.106496.28

concatenate.pivot.0.27:                           ; preds = %concatenate.pivot.106496.26
  %linear_index.frozen = freeze i32 %linear_index
  %37 = udiv i32 %linear_index.frozen, 13
  %38 = mul i32 %37, 13
  %.decomposed = sub i32 %linear_index.frozen, %38
  br label %concatenate.25.merge19

concatenate.pivot.106496.28:                      ; preds = %concatenate.pivot.106496.26
  %39 = add nsw i32 %linear_index, -106496
  %.frozen49 = freeze i32 %39
  %40 = udiv i32 %.frozen49, 17
  %41 = mul i32 %40, 17
  %.decomposed50 = sub i32 %.frozen49, %41
  %42 = add nuw nsw i32 %.decomposed50, 13
  br label %concatenate.25.merge19

concatenate.25.merge19:                           ; preds = %concatenate.pivot.106496.28, %concatenate.pivot.0.27
  %.sink43 = phi i32 [ %40, %concatenate.pivot.106496.28 ], [ %37, %concatenate.pivot.0.27 ]
  %.sink42 = phi i32 [ %42, %concatenate.pivot.106496.28 ], [ %.decomposed, %concatenate.pivot.0.27 ]
  %43 = icmp ult i32 %linear_index, 106496
  %44 = zext i32 %.sink43 to i64
  %45 = zext i32 %.sink42 to i64
  %46 = getelementptr inbounds [8192 x [30 x float]], ptr addrspace(1) %arg153, i64 0, i64 %44, i64 %45
  %.in30 = load float, ptr addrspace(1) %46, align 4, !invariant.load !36
  %47 = fmul float %.in30, 2.000000e+00
  %48 = zext i32 %linear_index to i64
  %49 = getelementptr inbounds [106496 x float], ptr addrspace(1) %arg357, i64 0, i64 %48
  %50 = getelementptr inbounds [106496 x float], ptr addrspace(1) %arg255, i64 0, i64 %48
  br i1 %43, label %slice0-true, label %slice1-after

slice1-after:                                     ; preds = %concatenate.25.merge19, %slice0-true
  %51 = icmp ugt i32 %linear_index, 106495
  %52 = add nsw i32 %linear_index, -106496
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds [139264 x float], ptr addrspace(1) %arg561, i64 0, i64 %53
  %55 = getelementptr inbounds [139264 x float], ptr addrspace(1) %arg459, i64 0, i64 %53
  br i1 %51, label %slice2-true, label %copy_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.25.merge19
  store float %14, ptr addrspace(1) %50, align 4
  store float %25, ptr addrspace(1) %49, align 4
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  store float %36, ptr addrspace(1) %55, align 4
  store float %47, ptr addrspace(1) %54, align 4
  br label %copy_fusion.in_bounds-after
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

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31}
!llvm.ident = !{!32}
!llvm.module.flags = !{!33}

!0 = !{ptr @fusion_12, !"kernel", i32 1}
!1 = !{ptr @fusion_12, !"reqntidx", i32 256}
!2 = !{ptr @fusion_13, !"kernel", i32 1}
!3 = !{ptr @fusion_13, !"reqntidx", i32 256}
!4 = !{ptr @concatenate_3, !"kernel", i32 1}
!5 = !{ptr @concatenate_3, !"reqntidx", i32 1024}
!6 = !{ptr @add_5, !"kernel", i32 1}
!7 = !{ptr @add_5, !"reqntidx", i32 128}
!8 = !{ptr @fusion_17, !"kernel", i32 1}
!9 = !{ptr @fusion_17, !"reqntidx", i32 256}
!10 = !{ptr @fusion_16, !"kernel", i32 1}
!11 = !{ptr @fusion_16, !"reqntidx", i32 256}
!12 = !{ptr @fusion_15, !"kernel", i32 1}
!13 = !{ptr @fusion_15, !"reqntidx", i32 256}
!14 = !{ptr @concatenate_7, !"kernel", i32 1}
!15 = !{ptr @concatenate_7, !"reqntidx", i32 256}
!16 = !{ptr @fusion_9, !"kernel", i32 1}
!17 = !{ptr @fusion_9, !"reqntidx", i32 256}
!18 = !{ptr @fusion_8, !"kernel", i32 1}
!19 = !{ptr @fusion_8, !"reqntidx", i32 256}
!20 = !{ptr @add_15, !"kernel", i32 1}
!21 = !{ptr @add_15, !"reqntidx", i32 128}
!22 = !{ptr @fusion_10, !"kernel", i32 1}
!23 = !{ptr @fusion_10, !"reqntidx", i32 256}
!24 = !{ptr @fusion_3, !"kernel", i32 1}
!25 = !{ptr @fusion_3, !"reqntidx", i32 256}
!26 = !{ptr @fusion_1, !"kernel", i32 1}
!27 = !{ptr @fusion_1, !"reqntidx", i32 96}
!28 = !{ptr @fusion, !"kernel", i32 1}
!29 = !{ptr @fusion, !"reqntidx", i32 1024}
!30 = !{ptr @copy_fusion, !"kernel", i32 1}
!31 = !{ptr @copy_fusion, !"reqntidx", i32 1024}
!32 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!33 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!34 = !{i32 0, i32 1088}
!35 = !{i32 0, i32 256}
!36 = !{}
!37 = !{i32 0, i32 6656}
!38 = !{i32 0, i32 80}
!39 = !{i32 0, i32 1024}
!40 = !{i32 0, i32 864}
!41 = !{i32 0, i32 128}
!42 = distinct !{!42, !43}
!43 = !{!"llvm.loop.vectorize.enable", i1 false}
!44 = !{i32 0, i32 4096}
!45 = !{i32 0, i32 240}
!46 = !{i32 0, i32 9280}
!47 = distinct !{!47, !43}
!48 = !{i32 0, i32 7744}
!49 = !{i32 0, i32 96}
!50 = !{i32 0, i32 2731}
!51 = !{i32 0, i32 8}
