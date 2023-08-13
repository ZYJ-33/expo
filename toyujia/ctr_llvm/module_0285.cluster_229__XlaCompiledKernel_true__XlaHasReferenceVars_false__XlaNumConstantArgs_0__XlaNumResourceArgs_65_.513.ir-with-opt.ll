target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_23(ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(48496640) %arg3) local_unnamed_addr #0 {
entry:
  %arg352 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg250 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg148 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg046 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 1480
  %5 = mul i32 %4, 1480
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 1480
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 1480
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 1480
  %9 = icmp ult i32 %.decomposed, 968
  br i1 %9, label %concatenate.pivot.0., label %concatenate.pivot.1224.

concatenate.pivot.0.:                             ; preds = %entry
  %10 = udiv i32 %linear_index_base, 1480
  %11 = mul nuw nsw i32 %10, 968
  %12 = add nuw nsw i32 %11, %.decomposed
  br label %concatenate.4.merge

concatenate.pivot.1224.:                          ; preds = %entry
  %13 = icmp ult i32 %.decomposed, 1224
  %14 = udiv i32 %linear_index_base, 1480
  %15 = shl nuw nsw i32 %14, 8
  br i1 %13, label %concatenate.pivot.968.1, label %concatenate.pivot.1224.2

concatenate.pivot.968.1:                          ; preds = %concatenate.pivot.1224.
  %16 = add nsw i32 %.decomposed, -968
  %17 = add nuw nsw i32 %16, %15
  br label %concatenate.4.merge

concatenate.pivot.1224.2:                         ; preds = %concatenate.pivot.1224.
  %18 = add nsw i32 %.decomposed, -1224
  %19 = add nuw nsw i32 %18, %15
  br label %concatenate.4.merge

concatenate.4.merge:                              ; preds = %concatenate.pivot.1224.2, %concatenate.pivot.968.1, %concatenate.pivot.0.
  %.sink39 = phi i32 [ %19, %concatenate.pivot.1224.2 ], [ %17, %concatenate.pivot.968.1 ], [ %12, %concatenate.pivot.0. ]
  %arg2.sink = phi ptr addrspace(1) [ %arg250, %concatenate.pivot.1224.2 ], [ %arg148, %concatenate.pivot.968.1 ], [ %arg046, %concatenate.pivot.0. ]
  %20 = zext i32 %.sink39 to i64
  %21 = getelementptr inbounds float, ptr addrspace(1) %arg2.sink, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !46
  %23 = zext i32 %linear_index_base to i64
  %24 = getelementptr float, ptr addrspace(1) %arg352, i64 %23
  store float %22, ptr addrspace(1) %24, align 16
  %25 = icmp ult i32 %6, 968
  br i1 %25, label %concatenate.pivot.0.8, label %concatenate.pivot.1224.9

concatenate.pivot.0.8:                            ; preds = %concatenate.4.merge
  %26 = udiv i32 %linear_index_base, 1480
  %27 = mul nuw nsw i32 %26, 968
  %28 = add nuw nsw i32 %27, %6
  br label %concatenate.4.merge3

concatenate.pivot.1224.9:                         ; preds = %concatenate.4.merge
  %29 = icmp ult i32 %6, 1224
  %30 = udiv i32 %linear_index_base, 1480
  %31 = shl nuw nsw i32 %30, 8
  br i1 %29, label %concatenate.pivot.968.10, label %concatenate.pivot.1224.11

concatenate.pivot.968.10:                         ; preds = %concatenate.pivot.1224.9
  %32 = add nsw i32 %6, -968
  %33 = add nuw nsw i32 %32, %31
  br label %concatenate.4.merge3

concatenate.pivot.1224.11:                        ; preds = %concatenate.pivot.1224.9
  %34 = add nsw i32 %6, -1224
  %35 = add nuw nsw i32 %34, %31
  br label %concatenate.4.merge3

concatenate.4.merge3:                             ; preds = %concatenate.pivot.1224.11, %concatenate.pivot.968.10, %concatenate.pivot.0.8
  %.sink41 = phi i32 [ %35, %concatenate.pivot.1224.11 ], [ %33, %concatenate.pivot.968.10 ], [ %28, %concatenate.pivot.0.8 ]
  %arg2.sink40 = phi ptr addrspace(1) [ %arg250, %concatenate.pivot.1224.11 ], [ %arg148, %concatenate.pivot.968.10 ], [ %arg046, %concatenate.pivot.0.8 ]
  %36 = zext i32 %.sink41 to i64
  %37 = getelementptr inbounds float, ptr addrspace(1) %arg2.sink40, i64 %36
  %38 = load float, ptr addrspace(1) %37, align 4, !invariant.load !46
  %39 = getelementptr inbounds float, ptr addrspace(1) %24, i64 1
  store float %38, ptr addrspace(1) %39, align 4
  %40 = icmp ult i32 %7, 968
  br i1 %40, label %concatenate.pivot.0.17, label %concatenate.pivot.1224.18

concatenate.pivot.0.17:                           ; preds = %concatenate.4.merge3
  %41 = udiv i32 %linear_index_base, 1480
  %42 = mul nuw nsw i32 %41, 968
  %43 = add nuw nsw i32 %42, %7
  br label %concatenate.4.merge12

concatenate.pivot.1224.18:                        ; preds = %concatenate.4.merge3
  %44 = icmp ult i32 %7, 1224
  %45 = udiv i32 %linear_index_base, 1480
  %46 = shl nuw nsw i32 %45, 8
  br i1 %44, label %concatenate.pivot.968.19, label %concatenate.pivot.1224.20

concatenate.pivot.968.19:                         ; preds = %concatenate.pivot.1224.18
  %47 = add nsw i32 %7, -968
  %48 = add nuw nsw i32 %47, %46
  br label %concatenate.4.merge12

concatenate.pivot.1224.20:                        ; preds = %concatenate.pivot.1224.18
  %49 = add nsw i32 %7, -1224
  %50 = add nuw nsw i32 %49, %46
  br label %concatenate.4.merge12

concatenate.4.merge12:                            ; preds = %concatenate.pivot.1224.20, %concatenate.pivot.968.19, %concatenate.pivot.0.17
  %.sink43 = phi i32 [ %50, %concatenate.pivot.1224.20 ], [ %48, %concatenate.pivot.968.19 ], [ %43, %concatenate.pivot.0.17 ]
  %arg2.sink42 = phi ptr addrspace(1) [ %arg250, %concatenate.pivot.1224.20 ], [ %arg148, %concatenate.pivot.968.19 ], [ %arg046, %concatenate.pivot.0.17 ]
  %51 = zext i32 %.sink43 to i64
  %52 = getelementptr inbounds float, ptr addrspace(1) %arg2.sink42, i64 %51
  %53 = load float, ptr addrspace(1) %52, align 4, !invariant.load !46
  %54 = getelementptr inbounds float, ptr addrspace(1) %24, i64 2
  store float %53, ptr addrspace(1) %54, align 8
  %55 = icmp ult i32 %8, 968
  br i1 %55, label %concatenate.pivot.0.26, label %concatenate.pivot.1224.27

concatenate.pivot.0.26:                           ; preds = %concatenate.4.merge12
  %56 = udiv i32 %linear_index_base, 1480
  %57 = mul nuw nsw i32 %56, 968
  %58 = add nuw nsw i32 %57, %8
  br label %concatenate.4.merge21

concatenate.pivot.1224.27:                        ; preds = %concatenate.4.merge12
  %59 = icmp ult i32 %8, 1224
  %60 = shl nuw nsw i32 %4, 8
  br i1 %59, label %concatenate.pivot.968.28, label %concatenate.pivot.1224.29

concatenate.pivot.968.28:                         ; preds = %concatenate.pivot.1224.27
  %61 = add nsw i32 %8, -968
  %62 = add nuw nsw i32 %61, %60
  br label %concatenate.4.merge21

concatenate.pivot.1224.29:                        ; preds = %concatenate.pivot.1224.27
  %63 = add nsw i32 %8, -1224
  %64 = add nuw nsw i32 %63, %60
  br label %concatenate.4.merge21

concatenate.4.merge21:                            ; preds = %concatenate.pivot.1224.29, %concatenate.pivot.968.28, %concatenate.pivot.0.26
  %.sink45 = phi i32 [ %64, %concatenate.pivot.1224.29 ], [ %62, %concatenate.pivot.968.28 ], [ %58, %concatenate.pivot.0.26 ]
  %arg2.sink44 = phi ptr addrspace(1) [ %arg250, %concatenate.pivot.1224.29 ], [ %arg148, %concatenate.pivot.968.28 ], [ %arg046, %concatenate.pivot.0.26 ]
  %65 = zext i32 %.sink45 to i64
  %66 = getelementptr inbounds float, ptr addrspace(1) %arg2.sink44, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4, !invariant.load !46
  %68 = getelementptr inbounds float, ptr addrspace(1) %24, i64 3
  store float %67, ptr addrspace(1) %68, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_18(ptr noalias nocapture readonly align 16 dereferenceable(524288) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(92160) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(6144) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(628736) %arg4) local_unnamed_addr #0 {
entry:
  %arg466 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg364 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg262 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg160 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg058 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 614
  %5 = mul i32 %4, 614
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 614
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index2.frozen = freeze i32 %linear_index2
  %7 = udiv i32 %linear_index2.frozen, 614
  %8 = mul i32 %7, 614
  %.decomposed56 = sub i32 %linear_index2.frozen, %8
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index3.frozen = freeze i32 %linear_index3
  %9 = udiv i32 %linear_index3.frozen, 614
  %10 = mul i32 %9, 614
  %.decomposed57 = sub i32 %linear_index3.frozen, %10
  %11 = icmp ult i32 %linear_index_base, 157184
  br i1 %11, label %concatenate.pivot.602., label %concatenate_18.in_bounds-after

concatenate_18.in_bounds-after:                   ; preds = %concatenate.5.merge28, %entry
  ret void

concatenate.pivot.602.:                           ; preds = %entry
  %12 = icmp ult i32 %.decomposed, 602
  br i1 %12, label %concatenate.pivot.512., label %concatenate.pivot.608.

concatenate.pivot.512.:                           ; preds = %concatenate.pivot.602.
  %13 = icmp ult i32 %.decomposed, 512
  br i1 %13, label %concatenate.pivot.0., label %concatenate.pivot.512.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.512.
  %14 = udiv i32 %linear_index_base, 614
  %15 = shl nuw nsw i32 %14, 9
  %16 = add nuw nsw i32 %15, %.decomposed
  br label %concatenate.5.merge

concatenate.pivot.512.1:                          ; preds = %concatenate.pivot.512.
  %17 = add nsw i32 %.decomposed, -512
  %18 = udiv i32 %linear_index_base, 614
  %19 = mul nuw nsw i32 %18, 90
  %20 = add nuw nsw i32 %17, %19
  br label %concatenate.5.merge

concatenate.pivot.608.:                           ; preds = %concatenate.pivot.602.
  %21 = icmp ult i32 %.decomposed, 608
  %22 = udiv i32 %linear_index_base, 614
  %23 = mul nuw nsw i32 %22, 6
  br i1 %21, label %concatenate.pivot.602.2, label %concatenate.pivot.608.3

concatenate.pivot.602.2:                          ; preds = %concatenate.pivot.608.
  %24 = add nsw i32 %.decomposed, -602
  %25 = add nuw nsw i32 %24, %23
  br label %concatenate.5.merge

concatenate.pivot.608.3:                          ; preds = %concatenate.pivot.608.
  %26 = add nsw i32 %.decomposed, -608
  %27 = add nuw nsw i32 %26, %23
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.608.3, %concatenate.pivot.602.2, %concatenate.pivot.512.1, %concatenate.pivot.0.
  %.sink49 = phi i32 [ %27, %concatenate.pivot.608.3 ], [ %25, %concatenate.pivot.602.2 ], [ %20, %concatenate.pivot.512.1 ], [ %16, %concatenate.pivot.0. ]
  %arg3.sink = phi ptr addrspace(1) [ %arg364, %concatenate.pivot.608.3 ], [ %arg262, %concatenate.pivot.602.2 ], [ %arg160, %concatenate.pivot.512.1 ], [ %arg058, %concatenate.pivot.0. ]
  %28 = zext i32 %.sink49 to i64
  %29 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4, !invariant.load !46
  %31 = zext i32 %linear_index_base to i64
  %32 = getelementptr float, ptr addrspace(1) %arg466, i64 %31
  store float %30, ptr addrspace(1) %32, align 16
  %33 = icmp ult i32 %6, 602
  br i1 %33, label %concatenate.pivot.512.10, label %concatenate.pivot.608.13

concatenate.pivot.512.10:                         ; preds = %concatenate.5.merge
  %34 = icmp ult i32 %6, 512
  br i1 %34, label %concatenate.pivot.0.11, label %concatenate.pivot.512.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.512.10
  %35 = udiv i32 %linear_index_base, 614
  %36 = shl nuw nsw i32 %35, 9
  %37 = add nuw nsw i32 %36, %6
  br label %concatenate.5.merge4

concatenate.pivot.512.12:                         ; preds = %concatenate.pivot.512.10
  %38 = add nsw i32 %6, -512
  %39 = udiv i32 %linear_index_base, 614
  %40 = mul nuw nsw i32 %39, 90
  %41 = add nuw nsw i32 %38, %40
  br label %concatenate.5.merge4

concatenate.pivot.608.13:                         ; preds = %concatenate.5.merge
  %42 = icmp ult i32 %6, 608
  %43 = mul nuw nsw i32 %4, 6
  br i1 %42, label %concatenate.pivot.602.14, label %concatenate.pivot.608.15

concatenate.pivot.602.14:                         ; preds = %concatenate.pivot.608.13
  %44 = add nsw i32 %6, -602
  %45 = add nuw nsw i32 %44, %43
  br label %concatenate.5.merge4

concatenate.pivot.608.15:                         ; preds = %concatenate.pivot.608.13
  %46 = add nsw i32 %6, -608
  %47 = add nuw nsw i32 %46, %43
  br label %concatenate.5.merge4

concatenate.5.merge4:                             ; preds = %concatenate.pivot.608.15, %concatenate.pivot.602.14, %concatenate.pivot.512.12, %concatenate.pivot.0.11
  %.sink51 = phi i32 [ %47, %concatenate.pivot.608.15 ], [ %45, %concatenate.pivot.602.14 ], [ %41, %concatenate.pivot.512.12 ], [ %37, %concatenate.pivot.0.11 ]
  %arg3.sink50 = phi ptr addrspace(1) [ %arg364, %concatenate.pivot.608.15 ], [ %arg262, %concatenate.pivot.602.14 ], [ %arg160, %concatenate.pivot.512.12 ], [ %arg058, %concatenate.pivot.0.11 ]
  %48 = zext i32 %.sink51 to i64
  %49 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink50, i64 %48
  %50 = load float, ptr addrspace(1) %49, align 4, !invariant.load !46
  %51 = getelementptr inbounds float, ptr addrspace(1) %32, i64 1
  store float %50, ptr addrspace(1) %51, align 4
  %52 = icmp ult i32 %.decomposed56, 602
  br i1 %52, label %concatenate.pivot.512.22, label %concatenate.pivot.608.25

concatenate.pivot.512.22:                         ; preds = %concatenate.5.merge4
  %53 = icmp ult i32 %.decomposed56, 512
  br i1 %53, label %concatenate.pivot.0.23, label %concatenate.pivot.512.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.512.22
  %54 = udiv i32 %linear_index2, 614
  %55 = shl nuw nsw i32 %54, 9
  %56 = add nuw nsw i32 %55, %.decomposed56
  br label %concatenate.5.merge16

concatenate.pivot.512.24:                         ; preds = %concatenate.pivot.512.22
  %57 = add nsw i32 %.decomposed56, -512
  %58 = udiv i32 %linear_index2, 614
  %59 = mul nuw nsw i32 %58, 90
  %60 = add nuw nsw i32 %57, %59
  br label %concatenate.5.merge16

concatenate.pivot.608.25:                         ; preds = %concatenate.5.merge4
  %61 = icmp ult i32 %.decomposed56, 608
  %62 = mul nuw nsw i32 %7, 6
  br i1 %61, label %concatenate.pivot.602.26, label %concatenate.pivot.608.27

concatenate.pivot.602.26:                         ; preds = %concatenate.pivot.608.25
  %63 = add nsw i32 %.decomposed56, -602
  %64 = add nuw nsw i32 %63, %62
  br label %concatenate.5.merge16

concatenate.pivot.608.27:                         ; preds = %concatenate.pivot.608.25
  %65 = add nsw i32 %.decomposed56, -608
  %66 = add nuw nsw i32 %65, %62
  br label %concatenate.5.merge16

concatenate.5.merge16:                            ; preds = %concatenate.pivot.608.27, %concatenate.pivot.602.26, %concatenate.pivot.512.24, %concatenate.pivot.0.23
  %.sink53 = phi i32 [ %66, %concatenate.pivot.608.27 ], [ %64, %concatenate.pivot.602.26 ], [ %60, %concatenate.pivot.512.24 ], [ %56, %concatenate.pivot.0.23 ]
  %arg3.sink52 = phi ptr addrspace(1) [ %arg364, %concatenate.pivot.608.27 ], [ %arg262, %concatenate.pivot.602.26 ], [ %arg160, %concatenate.pivot.512.24 ], [ %arg058, %concatenate.pivot.0.23 ]
  %67 = zext i32 %.sink53 to i64
  %68 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink52, i64 %67
  %69 = load float, ptr addrspace(1) %68, align 4, !invariant.load !46
  %70 = getelementptr inbounds float, ptr addrspace(1) %32, i64 2
  store float %69, ptr addrspace(1) %70, align 8
  %71 = icmp ult i32 %.decomposed57, 602
  br i1 %71, label %concatenate.pivot.512.34, label %concatenate.pivot.608.37

concatenate.pivot.512.34:                         ; preds = %concatenate.5.merge16
  %72 = icmp ult i32 %.decomposed57, 512
  br i1 %72, label %concatenate.pivot.0.35, label %concatenate.pivot.512.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.512.34
  %73 = udiv i32 %linear_index3, 614
  %74 = shl nuw nsw i32 %73, 9
  %75 = add nuw nsw i32 %74, %.decomposed57
  br label %concatenate.5.merge28

concatenate.pivot.512.36:                         ; preds = %concatenate.pivot.512.34
  %76 = add nsw i32 %.decomposed57, -512
  %77 = udiv i32 %linear_index3, 614
  %78 = mul nuw nsw i32 %77, 90
  %79 = add nuw nsw i32 %76, %78
  br label %concatenate.5.merge28

concatenate.pivot.608.37:                         ; preds = %concatenate.5.merge16
  %80 = icmp ult i32 %.decomposed57, 608
  %81 = mul nuw nsw i32 %9, 6
  br i1 %80, label %concatenate.pivot.602.38, label %concatenate.pivot.608.39

concatenate.pivot.602.38:                         ; preds = %concatenate.pivot.608.37
  %82 = add nsw i32 %.decomposed57, -602
  %83 = add nuw nsw i32 %82, %81
  br label %concatenate.5.merge28

concatenate.pivot.608.39:                         ; preds = %concatenate.pivot.608.37
  %84 = add nsw i32 %.decomposed57, -608
  %85 = add nuw nsw i32 %84, %81
  br label %concatenate.5.merge28

concatenate.5.merge28:                            ; preds = %concatenate.pivot.608.39, %concatenate.pivot.602.38, %concatenate.pivot.512.36, %concatenate.pivot.0.35
  %.sink55 = phi i32 [ %85, %concatenate.pivot.608.39 ], [ %83, %concatenate.pivot.602.38 ], [ %79, %concatenate.pivot.512.36 ], [ %75, %concatenate.pivot.0.35 ]
  %arg3.sink54 = phi ptr addrspace(1) [ %arg364, %concatenate.pivot.608.39 ], [ %arg262, %concatenate.pivot.602.38 ], [ %arg160, %concatenate.pivot.512.36 ], [ %arg058, %concatenate.pivot.0.35 ]
  %86 = zext i32 %.sink55 to i64
  %87 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink54, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4, !invariant.load !46
  %89 = getelementptr inbounds float, ptr addrspace(1) %32, i64 3
  store float %88, ptr addrspace(1) %89, align 4
  br label %concatenate_18.in_bounds-after
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_19(ptr noalias nocapture readonly align 16 dereferenceable(114688) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1344) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(1344) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(20160) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(137536) %arg4) local_unnamed_addr #0 {
entry:
  %arg425 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg323 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg221 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg119 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg017 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !48
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %.lhs.trunc = trunc i32 %linear_index to i16
  %.lhs.trunc.frozen = freeze i16 %.lhs.trunc
  %3 = udiv i16 %.lhs.trunc.frozen, 614
  %4 = mul i16 %3, 614
  %.decomposed = sub i16 %.lhs.trunc.frozen, %4
  %.zext = zext i16 %.decomposed to i32
  %5 = icmp ult i32 %linear_index, 34384
  br i1 %5, label %concatenate.pivot.518., label %concatenate_19.in_bounds-after

concatenate_19.in_bounds-after:                   ; preds = %concatenate.5.merge, %entry
  ret void

concatenate.pivot.518.:                           ; preds = %entry
  %6 = icmp ult i16 %.decomposed, 518
  br i1 %6, label %concatenate.pivot.512., label %concatenate.pivot.524.

concatenate.pivot.512.:                           ; preds = %concatenate.pivot.518.
  %7 = icmp ult i16 %.decomposed, 512
  br i1 %7, label %concatenate.pivot.0., label %concatenate.pivot.512.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.512.
  %8 = udiv i16 %.lhs.trunc, 614
  %9 = shl nuw i16 %8, 9
  %10 = zext i16 %9 to i32
  br label %concatenate.5.merge

concatenate.pivot.512.1:                          ; preds = %concatenate.pivot.512.
  %11 = add nsw i32 %.zext, -512
  %12 = udiv i16 %.lhs.trunc, 614
  %narrow14 = mul nuw nsw i16 %12, 6
  %13 = zext i16 %narrow14 to i32
  br label %concatenate.5.merge

concatenate.pivot.524.:                           ; preds = %concatenate.pivot.518.
  %14 = icmp ult i16 %.decomposed, 524
  br i1 %14, label %concatenate.pivot.518.2, label %concatenate.pivot.524.3

concatenate.pivot.518.2:                          ; preds = %concatenate.pivot.524.
  %15 = add nsw i32 %.zext, -518
  %narrow13 = mul nuw nsw i16 %3, 6
  %16 = zext i16 %narrow13 to i32
  br label %concatenate.5.merge

concatenate.pivot.524.3:                          ; preds = %concatenate.pivot.524.
  %17 = add nsw i32 %.zext, -524
  %narrow = mul nuw nsw i16 %3, 90
  %18 = zext i16 %narrow to i32
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.524.3, %concatenate.pivot.518.2, %concatenate.pivot.512.1, %concatenate.pivot.0.
  %.sink16 = phi i32 [ %18, %concatenate.pivot.524.3 ], [ %16, %concatenate.pivot.518.2 ], [ %13, %concatenate.pivot.512.1 ], [ %.zext, %concatenate.pivot.0. ]
  %.sink = phi i32 [ %17, %concatenate.pivot.524.3 ], [ %15, %concatenate.pivot.518.2 ], [ %11, %concatenate.pivot.512.1 ], [ %10, %concatenate.pivot.0. ]
  %arg3.sink = phi ptr addrspace(1) [ %arg323, %concatenate.pivot.524.3 ], [ %arg221, %concatenate.pivot.518.2 ], [ %arg119, %concatenate.pivot.512.1 ], [ %arg017, %concatenate.pivot.0. ]
  %19 = add nuw nsw i32 %.sink, %.sink16
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !46
  %23 = zext i32 %linear_index to i64
  %24 = getelementptr inbounds float, ptr addrspace(1) %arg425, i64 %23
  store float %22, ptr addrspace(1) %24, align 4
  br label %concatenate_19.in_bounds-after
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_17(ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(46080) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(314368) %arg4) local_unnamed_addr #0 {
entry:
  %arg414 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %linear_index.frozen = freeze i32 %linear_index
  %3 = udiv i32 %linear_index.frozen, 614
  %4 = mul i32 %3, 614
  %.decomposed = sub i32 %linear_index.frozen, %4
  %5 = icmp ult i32 %linear_index, 78592
  br i1 %5, label %concatenate.pivot.602., label %concatenate_17.in_bounds-after

concatenate_17.in_bounds-after:                   ; preds = %concatenate.5.merge, %entry
  ret void

concatenate.pivot.602.:                           ; preds = %entry
  %6 = icmp ult i32 %.decomposed, 602
  br i1 %6, label %concatenate.pivot.512., label %concatenate.pivot.608.

concatenate.pivot.512.:                           ; preds = %concatenate.pivot.602.
  %7 = icmp ult i32 %.decomposed, 512
  br i1 %7, label %concatenate.pivot.0., label %concatenate.pivot.512.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.512.
  %8 = udiv i32 %linear_index, 614
  %9 = shl nuw nsw i32 %8, 9
  %10 = add nuw nsw i32 %9, %.decomposed
  br label %concatenate.5.merge

concatenate.pivot.512.1:                          ; preds = %concatenate.pivot.512.
  %11 = add nsw i32 %.decomposed, -512
  %12 = udiv i32 %linear_index, 614
  %13 = mul nuw nsw i32 %12, 90
  %14 = add nuw nsw i32 %11, %13
  br label %concatenate.5.merge

concatenate.pivot.608.:                           ; preds = %concatenate.pivot.602.
  %15 = icmp ult i32 %.decomposed, 608
  %16 = mul nuw nsw i32 %3, 6
  br i1 %15, label %concatenate.pivot.602.2, label %concatenate.pivot.608.3

concatenate.pivot.602.2:                          ; preds = %concatenate.pivot.608.
  %17 = add nsw i32 %.decomposed, -602
  %18 = add nuw nsw i32 %17, %16
  br label %concatenate.5.merge

concatenate.pivot.608.3:                          ; preds = %concatenate.pivot.608.
  %19 = add nsw i32 %.decomposed, -608
  %20 = add nuw nsw i32 %19, %16
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.608.3, %concatenate.pivot.602.2, %concatenate.pivot.512.1, %concatenate.pivot.0.
  %.sink5 = phi i32 [ %20, %concatenate.pivot.608.3 ], [ %18, %concatenate.pivot.602.2 ], [ %14, %concatenate.pivot.512.1 ], [ %10, %concatenate.pivot.0. ]
  %arg3.sink = phi ptr addrspace(1) [ %arg312, %concatenate.pivot.608.3 ], [ %arg210, %concatenate.pivot.602.2 ], [ %arg18, %concatenate.pivot.512.1 ], [ %arg06, %concatenate.pivot.0. ]
  %21 = zext i32 %.sink5 to i64
  %22 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !46
  %24 = zext i32 %linear_index to i64
  %25 = getelementptr inbounds float, ptr addrspace(1) %arg414, i64 %24
  store float %23, ptr addrspace(1) %25, align 4
  br label %concatenate_17.in_bounds-after
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_29(ptr noalias nocapture readonly align 16 dereferenceable(2048) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg2, ptr noalias nocapture align 128 dereferenceable(16777216) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg4) local_unnamed_addr #2 {
entry:
  %arg430 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg328 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg226 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg124 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg022 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !51
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
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
  %10 = getelementptr float, ptr addrspace(1) %arg328, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = zext i32 %4 to i64
  %17 = zext i32 %8 to i64
  %18 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg430, i64 0, i64 %16, i64 %17
  %19 = load <2 x float>, ptr addrspace(1) %18, align 8, !invariant.load !46
  %20 = extractelement <2 x float> %19, i32 0
  %21 = extractelement <2 x float> %19, i32 1
  %add.7 = fadd float %12, %20
  %22 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg226, i64 0, i64 %16, i64 %17
  %23 = load <2 x float>, ptr addrspace(1) %22, align 8, !invariant.load !46
  %24 = extractelement <2 x float> %23, i32 0
  %25 = extractelement <2 x float> %23, i32 1
  %add.9 = fadd float %add.7, %24
  %26 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg124, i64 0, i64 %16, i64 %17
  %27 = load <2 x float>, ptr addrspace(1) %26, align 8, !invariant.load !46
  %28 = extractelement <2 x float> %27, i32 0
  %29 = extractelement <2 x float> %27, i32 1
  %add.11 = fadd float %add.9, %28
  %30 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg022, i64 0, i64 %17
  %31 = load <2 x float>, ptr addrspace(1) %30, align 16, !invariant.load !46
  %32 = extractelement <2 x float> %31, i32 0
  %33 = extractelement <2 x float> %31, i32 1
  %add.13 = fadd float %add.11, %32
  %.inv = fcmp olt float %add.13, 0.000000e+00
  %maximum.16 = select i1 %.inv, float 0.000000e+00, float %add.13
  %34 = zext i32 %7 to i64
  %add.71 = fadd float %13, %21
  %add.92 = fadd float %add.71, %25
  %add.113 = fadd float %add.92, %29
  %add.134 = fadd float %add.113, %33
  %.inv19 = fcmp olt float %add.134, 0.000000e+00
  %maximum.166 = select i1 %.inv19, float 0.000000e+00, float %add.134
  %35 = zext i32 %6 to i64
  %36 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg430, i64 0, i64 %16, i64 %35
  %37 = load float, ptr addrspace(1) %36, align 8, !invariant.load !46
  %add.77 = fadd float %14, %37
  %38 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg226, i64 0, i64 %16, i64 %35
  %39 = load float, ptr addrspace(1) %38, align 8, !invariant.load !46
  %add.98 = fadd float %add.77, %39
  %40 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg124, i64 0, i64 %16, i64 %35
  %41 = load float, ptr addrspace(1) %40, align 8, !invariant.load !46
  %add.119 = fadd float %add.98, %41
  %42 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg022, i64 0, i64 %35
  %43 = load float, ptr addrspace(1) %42, align 8, !invariant.load !46
  %add.1310 = fadd float %add.119, %43
  %.inv20 = fcmp olt float %add.1310, 0.000000e+00
  %maximum.1612 = select i1 %.inv20, float 0.000000e+00, float %add.1310
  %44 = zext i32 %5 to i64
  %45 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg430, i64 0, i64 %16, i64 %44
  %46 = load float, ptr addrspace(1) %45, align 4, !invariant.load !46
  %add.713 = fadd float %15, %46
  %47 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg226, i64 0, i64 %16, i64 %44
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !46
  %add.914 = fadd float %add.713, %48
  %49 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg124, i64 0, i64 %16, i64 %44
  %50 = load float, ptr addrspace(1) %49, align 4, !invariant.load !46
  %add.1115 = fadd float %add.914, %50
  %51 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg022, i64 0, i64 %44
  %52 = load float, ptr addrspace(1) %51, align 4, !invariant.load !46
  %add.1316 = fadd float %add.1115, %52
  %.inv21 = fcmp olt float %add.1316, 0.000000e+00
  %maximum.1618 = select i1 %.inv21, float 0.000000e+00, float %add.1316
  %53 = insertelement <4 x float> poison, float %maximum.16, i32 0
  %54 = insertelement <4 x float> %53, float %maximum.166, i32 1
  %55 = insertelement <4 x float> %54, float %maximum.1612, i32 2
  %56 = insertelement <4 x float> %55, float %maximum.1618, i32 3
  store <4 x float> %56, ptr addrspace(1) %10, align 16
  ret void
}

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @add_21(ptr noalias nocapture align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg1) local_unnamed_addr #3 {
entry:
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !52
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !53
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = shl nuw nsw i64 %4, 2
  %6 = add nuw nsw i64 %5, 1769484
  %scevgep = getelementptr i8, ptr addrspace(1) %arg05, i64 %6
  %scevgep46 = getelementptr i8, ptr addrspace(1) %arg17, i64 %6
  br label %loop.loop_body

loop.loop_body:                                   ; preds = %add_21.in_bounds-after.1, %entry
  %lsr.iv47 = phi ptr addrspace(1) [ %scevgep48, %add_21.in_bounds-after.1 ], [ %scevgep46, %entry ]
  %lsr.iv37 = phi ptr addrspace(1) [ %scevgep38, %add_21.in_bounds-after.1 ], [ %scevgep, %entry ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %add_21.in_bounds-after.1 ], [ 442368, %entry ]
  %scevgep39 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 -1769484
  %7 = load <4 x float>, ptr addrspace(1) %scevgep39, align 16
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %scevgep50 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 -1769484
  %12 = load <4 x float>, ptr addrspace(1) %scevgep50, align 16, !invariant.load !46
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
  br i1 %22, label %add_21.in_bounds-true.1, label %add_21.in_bounds-after.1

add_21.in_bounds-true.1:                          ; preds = %loop.loop_body
  %scevgep43 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 -12
  %23 = load <4 x float>, ptr addrspace(1) %scevgep43, align 16
  %24 = extractelement <4 x float> %23, i32 0
  %25 = extractelement <4 x float> %23, i32 1
  %26 = extractelement <4 x float> %23, i32 2
  %27 = extractelement <4 x float> %23, i32 3
  %scevgep49 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 -12
  %28 = load <4 x float>, ptr addrspace(1) %scevgep49, align 16, !invariant.load !46
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
  br label %add_21.in_bounds-after.1

add_21.in_bounds-after.1:                         ; preds = %add_21.in_bounds-true.1, %loop.loop_body
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 884736
  %37 = add i32 %lsr.iv.next, -1327104
  %scevgep38 = getelementptr i8, ptr addrspace(1) %lsr.iv37, i64 3538944
  %scevgep48 = getelementptr i8, ptr addrspace(1) %lsr.iv47, i64 3538944
  %38 = icmp ugt i32 %37, 3309567
  br i1 %38, label %loop.loop_exit, label %loop.loop_body, !llvm.loop !54

loop.loop_exit:                                   ; preds = %add_21.in_bounds-after.1
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_27(ptr noalias nocapture readonly align 16 dereferenceable(2048) %arg0, ptr noalias nocapture align 128 dereferenceable(16777216) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg2) local_unnamed_addr #2 {
entry:
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !51
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
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
  %9 = getelementptr float, ptr addrspace(1) %arg118, i64 %8
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %15 = getelementptr float, ptr addrspace(1) %arg220, i64 %8
  %16 = load <4 x float>, ptr addrspace(1) %15, align 16, !invariant.load !46
  %17 = extractelement <4 x float> %16, i32 0
  %18 = extractelement <4 x float> %16, i32 1
  %19 = extractelement <4 x float> %16, i32 2
  %20 = extractelement <4 x float> %16, i32 3
  %add.4 = fadd float %11, %17
  %21 = zext i32 %7 to i64
  %22 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg016, i64 0, i64 %21
  %23 = load <2 x float>, ptr addrspace(1) %22, align 16, !invariant.load !46
  %24 = extractelement <2 x float> %23, i32 0
  %25 = extractelement <2 x float> %23, i32 1
  %add.6 = fadd float %add.4, %24
  %.inv = fcmp olt float %add.6, 0.000000e+00
  %maximum.9 = select i1 %.inv, float 0.000000e+00, float %add.6
  %add.41 = fadd float %12, %18
  %26 = zext i32 %6 to i64
  %add.62 = fadd float %add.41, %25
  %.inv13 = fcmp olt float %add.62, 0.000000e+00
  %maximum.94 = select i1 %.inv13, float 0.000000e+00, float %add.62
  %add.45 = fadd float %13, %19
  %27 = zext i32 %5 to i64
  %28 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg016, i64 0, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 8, !invariant.load !46
  %add.66 = fadd float %add.45, %29
  %.inv14 = fcmp olt float %add.66, 0.000000e+00
  %maximum.98 = select i1 %.inv14, float 0.000000e+00, float %add.66
  %add.49 = fadd float %14, %20
  %30 = zext i32 %4 to i64
  %31 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg016, i64 0, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4, !invariant.load !46
  %add.610 = fadd float %add.49, %32
  %.inv15 = fcmp olt float %add.610, 0.000000e+00
  %maximum.912 = select i1 %.inv15, float 0.000000e+00, float %add.610
  %33 = insertelement <4 x float> poison, float %maximum.9, i32 0
  %34 = insertelement <4 x float> %33, float %maximum.94, i32 1
  %35 = insertelement <4 x float> %34, float %maximum.98, i32 2
  %36 = insertelement <4 x float> %35, float %maximum.912, i32 3
  store <4 x float> %36, ptr addrspace(1) %9, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_45(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg17) local_unnamed_addr #2 {
entry:
  %arg1797 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1695 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1593 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1491 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1389 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1287 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1185 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1083 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg981 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg879 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg777 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg675 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg573 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg471 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg369 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg267 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg165 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg063 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = and i32 %linear_index3, 255
  %linear_index2 = or i32 %linear_index_base, 2
  %5 = and i32 %linear_index2, 254
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = and i32 %linear_index1, 253
  %7 = and i32 %3, 252
  %8 = zext i32 %linear_index_base to i64
  %9 = getelementptr float, ptr addrspace(1) %arg063, i64 %8
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16, !invariant.load !46
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg165, i64 0, i64 %15
  %17 = load <2 x float>, ptr addrspace(1) %16, align 16, !invariant.load !46
  %18 = extractelement <2 x float> %17, i32 0
  %19 = extractelement <2 x float> %17, i32 1
  %add.14 = fadd float %11, %18
  %.inv = fcmp olt float %add.14, 0.000000e+00
  %maximum.17 = select i1 %.inv, float 0.000000e+00, float %add.14
  %20 = getelementptr float, ptr addrspace(1) %arg267, i64 %8
  %21 = load <4 x float>, ptr addrspace(1) %20, align 16, !invariant.load !46
  %22 = extractelement <4 x float> %21, i32 0
  %23 = extractelement <4 x float> %21, i32 1
  %24 = extractelement <4 x float> %21, i32 2
  %25 = extractelement <4 x float> %21, i32 3
  %26 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg369, i64 0, i64 %15
  %27 = load <2 x float>, ptr addrspace(1) %26, align 16, !invariant.load !46
  %28 = extractelement <2 x float> %27, i32 0
  %29 = extractelement <2 x float> %27, i32 1
  %add.19 = fadd float %22, %28
  %.inv40 = fcmp olt float %add.19, 0.000000e+00
  %maximum.20 = select i1 %.inv40, float 0.000000e+00, float %add.19
  %30 = getelementptr float, ptr addrspace(1) %arg471, i64 %8
  %31 = load <4 x float>, ptr addrspace(1) %30, align 16, !invariant.load !46
  %32 = extractelement <4 x float> %31, i32 0
  %33 = extractelement <4 x float> %31, i32 1
  %34 = extractelement <4 x float> %31, i32 2
  %35 = extractelement <4 x float> %31, i32 3
  %36 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg573, i64 0, i64 %15
  %37 = load <2 x float>, ptr addrspace(1) %36, align 16, !invariant.load !46
  %38 = extractelement <2 x float> %37, i32 0
  %39 = extractelement <2 x float> %37, i32 1
  %add.22 = fadd float %32, %38
  %.inv41 = fcmp olt float %add.22, 0.000000e+00
  %maximum.23 = select i1 %.inv41, float 0.000000e+00, float %add.22
  %40 = getelementptr float, ptr addrspace(1) %arg675, i64 %8
  %41 = load <4 x float>, ptr addrspace(1) %40, align 16, !invariant.load !46
  %42 = extractelement <4 x float> %41, i32 0
  %43 = extractelement <4 x float> %41, i32 1
  %44 = extractelement <4 x float> %41, i32 2
  %45 = extractelement <4 x float> %41, i32 3
  %46 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg777, i64 0, i64 %15
  %47 = load <2 x float>, ptr addrspace(1) %46, align 16, !invariant.load !46
  %48 = extractelement <2 x float> %47, i32 0
  %49 = extractelement <2 x float> %47, i32 1
  %add.25 = fadd float %42, %48
  %.inv42 = fcmp olt float %add.25, 0.000000e+00
  %maximum.26 = select i1 %.inv42, float 0.000000e+00, float %add.25
  %50 = getelementptr float, ptr addrspace(1) %arg879, i64 %8
  %51 = load <4 x float>, ptr addrspace(1) %50, align 16, !invariant.load !46
  %52 = extractelement <4 x float> %51, i32 0
  %53 = extractelement <4 x float> %51, i32 1
  %54 = extractelement <4 x float> %51, i32 2
  %55 = extractelement <4 x float> %51, i32 3
  %56 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg981, i64 0, i64 %15
  %57 = load <2 x float>, ptr addrspace(1) %56, align 16, !invariant.load !46
  %58 = extractelement <2 x float> %57, i32 0
  %59 = extractelement <2 x float> %57, i32 1
  %add.28 = fadd float %52, %58
  %.inv43 = fcmp olt float %add.28, 0.000000e+00
  %maximum.29 = select i1 %.inv43, float 0.000000e+00, float %add.28
  %60 = getelementptr float, ptr addrspace(1) %arg1083, i64 %8
  %61 = load <4 x float>, ptr addrspace(1) %60, align 16, !invariant.load !46
  %62 = extractelement <4 x float> %61, i32 0
  %63 = extractelement <4 x float> %61, i32 1
  %64 = extractelement <4 x float> %61, i32 2
  %65 = extractelement <4 x float> %61, i32 3
  %66 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg1185, i64 0, i64 %15
  %67 = load <2 x float>, ptr addrspace(1) %66, align 16, !invariant.load !46
  %68 = extractelement <2 x float> %67, i32 0
  %69 = extractelement <2 x float> %67, i32 1
  %add.31 = fadd float %62, %68
  %.inv44 = fcmp olt float %add.31, 0.000000e+00
  %maximum.32 = select i1 %.inv44, float 0.000000e+00, float %add.31
  %70 = getelementptr float, ptr addrspace(1) %arg1287, i64 %8
  %71 = getelementptr float, ptr addrspace(1) %arg1389, i64 %8
  %72 = getelementptr float, ptr addrspace(1) %arg1491, i64 %8
  %73 = getelementptr float, ptr addrspace(1) %arg1593, i64 %8
  %74 = getelementptr float, ptr addrspace(1) %arg1695, i64 %8
  %75 = getelementptr float, ptr addrspace(1) %arg1797, i64 %8
  %76 = zext i32 %6 to i64
  %add.141 = fadd float %12, %19
  %.inv45 = fcmp olt float %add.141, 0.000000e+00
  %maximum.173 = select i1 %.inv45, float 0.000000e+00, float %add.141
  %add.194 = fadd float %23, %29
  %.inv46 = fcmp olt float %add.194, 0.000000e+00
  %maximum.205 = select i1 %.inv46, float 0.000000e+00, float %add.194
  %add.226 = fadd float %33, %39
  %.inv47 = fcmp olt float %add.226, 0.000000e+00
  %maximum.237 = select i1 %.inv47, float 0.000000e+00, float %add.226
  %add.258 = fadd float %43, %49
  %.inv48 = fcmp olt float %add.258, 0.000000e+00
  %maximum.269 = select i1 %.inv48, float 0.000000e+00, float %add.258
  %add.2810 = fadd float %53, %59
  %.inv49 = fcmp olt float %add.2810, 0.000000e+00
  %maximum.2911 = select i1 %.inv49, float 0.000000e+00, float %add.2810
  %add.3112 = fadd float %63, %69
  %.inv50 = fcmp olt float %add.3112, 0.000000e+00
  %maximum.3213 = select i1 %.inv50, float 0.000000e+00, float %add.3112
  %77 = zext i32 %5 to i64
  %78 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg165, i64 0, i64 %77
  %79 = load float, ptr addrspace(1) %78, align 8, !invariant.load !46
  %add.1414 = fadd float %13, %79
  %.inv51 = fcmp olt float %add.1414, 0.000000e+00
  %maximum.1716 = select i1 %.inv51, float 0.000000e+00, float %add.1414
  %80 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg369, i64 0, i64 %77
  %81 = load float, ptr addrspace(1) %80, align 8, !invariant.load !46
  %add.1917 = fadd float %24, %81
  %.inv52 = fcmp olt float %add.1917, 0.000000e+00
  %maximum.2018 = select i1 %.inv52, float 0.000000e+00, float %add.1917
  %82 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg573, i64 0, i64 %77
  %83 = load float, ptr addrspace(1) %82, align 8, !invariant.load !46
  %add.2219 = fadd float %34, %83
  %.inv53 = fcmp olt float %add.2219, 0.000000e+00
  %maximum.2320 = select i1 %.inv53, float 0.000000e+00, float %add.2219
  %84 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg777, i64 0, i64 %77
  %85 = load float, ptr addrspace(1) %84, align 8, !invariant.load !46
  %add.2521 = fadd float %44, %85
  %.inv54 = fcmp olt float %add.2521, 0.000000e+00
  %maximum.2622 = select i1 %.inv54, float 0.000000e+00, float %add.2521
  %86 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg981, i64 0, i64 %77
  %87 = load float, ptr addrspace(1) %86, align 8, !invariant.load !46
  %add.2823 = fadd float %54, %87
  %.inv55 = fcmp olt float %add.2823, 0.000000e+00
  %maximum.2924 = select i1 %.inv55, float 0.000000e+00, float %add.2823
  %88 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg1185, i64 0, i64 %77
  %89 = load float, ptr addrspace(1) %88, align 8, !invariant.load !46
  %add.3125 = fadd float %64, %89
  %.inv56 = fcmp olt float %add.3125, 0.000000e+00
  %maximum.3226 = select i1 %.inv56, float 0.000000e+00, float %add.3125
  %90 = zext i32 %4 to i64
  %91 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg165, i64 0, i64 %90
  %92 = load float, ptr addrspace(1) %91, align 4, !invariant.load !46
  %add.1427 = fadd float %14, %92
  %.inv57 = fcmp olt float %add.1427, 0.000000e+00
  %maximum.1729 = select i1 %.inv57, float 0.000000e+00, float %add.1427
  %93 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg369, i64 0, i64 %90
  %94 = load float, ptr addrspace(1) %93, align 4, !invariant.load !46
  %add.1930 = fadd float %25, %94
  %.inv58 = fcmp olt float %add.1930, 0.000000e+00
  %maximum.2031 = select i1 %.inv58, float 0.000000e+00, float %add.1930
  %95 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg573, i64 0, i64 %90
  %96 = load float, ptr addrspace(1) %95, align 4, !invariant.load !46
  %add.2232 = fadd float %35, %96
  %.inv59 = fcmp olt float %add.2232, 0.000000e+00
  %maximum.2333 = select i1 %.inv59, float 0.000000e+00, float %add.2232
  %97 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg777, i64 0, i64 %90
  %98 = load float, ptr addrspace(1) %97, align 4, !invariant.load !46
  %add.2534 = fadd float %45, %98
  %.inv60 = fcmp olt float %add.2534, 0.000000e+00
  %maximum.2635 = select i1 %.inv60, float 0.000000e+00, float %add.2534
  %99 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg981, i64 0, i64 %90
  %100 = load float, ptr addrspace(1) %99, align 4, !invariant.load !46
  %add.2836 = fadd float %55, %100
  %.inv61 = fcmp olt float %add.2836, 0.000000e+00
  %maximum.2937 = select i1 %.inv61, float 0.000000e+00, float %add.2836
  %101 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg1185, i64 0, i64 %90
  %102 = load float, ptr addrspace(1) %101, align 4, !invariant.load !46
  %add.3138 = fadd float %65, %102
  %.inv62 = fcmp olt float %add.3138, 0.000000e+00
  %maximum.3239 = select i1 %.inv62, float 0.000000e+00, float %add.3138
  %103 = insertelement <4 x float> poison, float %maximum.17, i32 0
  %104 = insertelement <4 x float> %103, float %maximum.173, i32 1
  %105 = insertelement <4 x float> %104, float %maximum.1716, i32 2
  %106 = insertelement <4 x float> %105, float %maximum.1729, i32 3
  store <4 x float> %106, ptr addrspace(1) %70, align 16
  %107 = insertelement <4 x float> poison, float %maximum.20, i32 0
  %108 = insertelement <4 x float> %107, float %maximum.205, i32 1
  %109 = insertelement <4 x float> %108, float %maximum.2018, i32 2
  %110 = insertelement <4 x float> %109, float %maximum.2031, i32 3
  store <4 x float> %110, ptr addrspace(1) %71, align 16
  %111 = insertelement <4 x float> poison, float %maximum.23, i32 0
  %112 = insertelement <4 x float> %111, float %maximum.237, i32 1
  %113 = insertelement <4 x float> %112, float %maximum.2320, i32 2
  %114 = insertelement <4 x float> %113, float %maximum.2333, i32 3
  store <4 x float> %114, ptr addrspace(1) %72, align 16
  %115 = insertelement <4 x float> poison, float %maximum.26, i32 0
  %116 = insertelement <4 x float> %115, float %maximum.269, i32 1
  %117 = insertelement <4 x float> %116, float %maximum.2622, i32 2
  %118 = insertelement <4 x float> %117, float %maximum.2635, i32 3
  store <4 x float> %118, ptr addrspace(1) %73, align 16
  %119 = insertelement <4 x float> poison, float %maximum.29, i32 0
  %120 = insertelement <4 x float> %119, float %maximum.2911, i32 1
  %121 = insertelement <4 x float> %120, float %maximum.2924, i32 2
  %122 = insertelement <4 x float> %121, float %maximum.2937, i32 3
  store <4 x float> %122, ptr addrspace(1) %74, align 16
  %123 = insertelement <4 x float> poison, float %maximum.32, i32 0
  %124 = insertelement <4 x float> %123, float %maximum.3213, i32 1
  %125 = insertelement <4 x float> %124, float %maximum.3226, i32 2
  %126 = insertelement <4 x float> %125, float %maximum.3239, i32 3
  store <4 x float> %126, ptr addrspace(1) %75, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_17(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(50331648) %arg6) local_unnamed_addr #0 {
entry:
  %arg681 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg579 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg477 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg375 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg273 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg171 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg069 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !57
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 252
  %5 = lshr i32 %linear_index_base, 8
  %.lhs.trunc = trunc i32 %5 to i16
  %6 = urem i16 %.lhs.trunc, 6
  %.zext = zext i16 %6 to i32
  %7 = udiv i32 %linear_index_base, 1536
  %linear_index1 = or i32 %linear_index_base, 1
  %8 = and i32 %linear_index1, 253
  %linear_index2 = or i32 %linear_index_base, 2
  %9 = and i32 %linear_index2, 254
  %linear_index3 = or i32 %linear_index_base, 3
  %10 = and i32 %linear_index3, 255
  %11 = icmp ult i16 %6, 3
  br i1 %11, label %concatenate.pivot.1., label %concatenate.pivot.4.

concatenate.pivot.1.:                             ; preds = %entry
  switch i32 %.zext, label %concatenate.pivot.2.2 [
    i32 0, label %concatenate.pivot.0.
    i32 1, label %concatenate.pivot.1.1
  ]

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  %12 = zext i32 %7 to i64
  %13 = zext i32 %4 to i64
  %14 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg579, i64 0, i64 %12, i64 %13
  br label %concatenate.13.merge

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.1.
  %15 = zext i32 %7 to i64
  %16 = zext i32 %4 to i64
  %17 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg477, i64 0, i64 %15, i64 %16
  br label %concatenate.13.merge

concatenate.pivot.2.2:                            ; preds = %concatenate.pivot.1.
  %18 = zext i32 %7 to i64
  %19 = zext i32 %4 to i64
  %20 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg375, i64 0, i64 %18, i64 %19
  br label %concatenate.13.merge

concatenate.pivot.4.:                             ; preds = %entry
  %21 = icmp eq i16 %6, 3
  br i1 %21, label %concatenate.pivot.3.3, label %concatenate.pivot.5.

concatenate.pivot.3.3:                            ; preds = %concatenate.pivot.4.
  %22 = zext i32 %7 to i64
  %23 = zext i32 %4 to i64
  %24 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg273, i64 0, i64 %22, i64 %23
  br label %concatenate.13.merge

concatenate.pivot.5.:                             ; preds = %concatenate.pivot.4.
  %25 = icmp ult i16 %6, 5
  %26 = zext i32 %7 to i64
  %27 = zext i32 %4 to i64
  br i1 %25, label %concatenate.pivot.4.4, label %concatenate.pivot.5.5

concatenate.pivot.4.4:                            ; preds = %concatenate.pivot.5.
  %28 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg171, i64 0, i64 %26, i64 %27
  br label %concatenate.13.merge

concatenate.pivot.5.5:                            ; preds = %concatenate.pivot.5.
  %29 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg069, i64 0, i64 %26, i64 %27
  br label %concatenate.13.merge

concatenate.13.merge:                             ; preds = %concatenate.pivot.5.5, %concatenate.pivot.4.4, %concatenate.pivot.3.3, %concatenate.pivot.2.2, %concatenate.pivot.1.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %14, %concatenate.pivot.0. ], [ %17, %concatenate.pivot.1.1 ], [ %20, %concatenate.pivot.2.2 ], [ %24, %concatenate.pivot.3.3 ], [ %28, %concatenate.pivot.4.4 ], [ %29, %concatenate.pivot.5.5 ]
  %30 = icmp ult i16 %6, 3
  %31 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !46
  %32 = zext i32 %linear_index_base to i64
  %33 = getelementptr float, ptr addrspace(1) %arg681, i64 %32
  store float %31, ptr addrspace(1) %33, align 16
  br i1 %30, label %concatenate.pivot.1.14, label %concatenate.pivot.4.19

concatenate.pivot.1.14:                           ; preds = %concatenate.13.merge
  switch i32 %.zext, label %concatenate.pivot.2.18 [
    i32 0, label %concatenate.pivot.0.15
    i32 1, label %concatenate.pivot.1.17
  ]

concatenate.pivot.0.15:                           ; preds = %concatenate.pivot.1.14
  %34 = zext i32 %7 to i64
  %35 = zext i32 %8 to i64
  %36 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg579, i64 0, i64 %34, i64 %35
  br label %concatenate.13.merge6

concatenate.pivot.1.17:                           ; preds = %concatenate.pivot.1.14
  %37 = zext i32 %7 to i64
  %38 = zext i32 %8 to i64
  %39 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg477, i64 0, i64 %37, i64 %38
  br label %concatenate.13.merge6

concatenate.pivot.2.18:                           ; preds = %concatenate.pivot.1.14
  %40 = zext i32 %7 to i64
  %41 = zext i32 %8 to i64
  %42 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg375, i64 0, i64 %40, i64 %41
  br label %concatenate.13.merge6

concatenate.pivot.4.19:                           ; preds = %concatenate.13.merge
  %43 = icmp eq i16 %6, 3
  br i1 %43, label %concatenate.pivot.3.20, label %concatenate.pivot.5.21

concatenate.pivot.3.20:                           ; preds = %concatenate.pivot.4.19
  %44 = zext i32 %7 to i64
  %45 = zext i32 %8 to i64
  %46 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg273, i64 0, i64 %44, i64 %45
  br label %concatenate.13.merge6

concatenate.pivot.5.21:                           ; preds = %concatenate.pivot.4.19
  %47 = icmp ult i16 %6, 5
  %48 = zext i32 %7 to i64
  %49 = zext i32 %8 to i64
  br i1 %47, label %concatenate.pivot.4.22, label %concatenate.pivot.5.23

concatenate.pivot.4.22:                           ; preds = %concatenate.pivot.5.21
  %50 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg171, i64 0, i64 %48, i64 %49
  br label %concatenate.13.merge6

concatenate.pivot.5.23:                           ; preds = %concatenate.pivot.5.21
  %51 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg069, i64 0, i64 %48, i64 %49
  br label %concatenate.13.merge6

concatenate.13.merge6:                            ; preds = %concatenate.pivot.5.23, %concatenate.pivot.4.22, %concatenate.pivot.3.20, %concatenate.pivot.2.18, %concatenate.pivot.1.17, %concatenate.pivot.0.15
  %.in66 = phi ptr addrspace(1) [ %36, %concatenate.pivot.0.15 ], [ %39, %concatenate.pivot.1.17 ], [ %42, %concatenate.pivot.2.18 ], [ %46, %concatenate.pivot.3.20 ], [ %50, %concatenate.pivot.4.22 ], [ %51, %concatenate.pivot.5.23 ]
  %52 = icmp ult i16 %6, 3
  %53 = load float, ptr addrspace(1) %.in66, align 4, !invariant.load !46
  %54 = getelementptr inbounds float, ptr addrspace(1) %33, i64 1
  store float %53, ptr addrspace(1) %54, align 4
  br i1 %52, label %concatenate.pivot.1.32, label %concatenate.pivot.4.37

concatenate.pivot.1.32:                           ; preds = %concatenate.13.merge6
  switch i32 %.zext, label %concatenate.pivot.2.36 [
    i32 0, label %concatenate.pivot.0.33
    i32 1, label %concatenate.pivot.1.35
  ]

concatenate.pivot.0.33:                           ; preds = %concatenate.pivot.1.32
  %55 = zext i32 %7 to i64
  %56 = zext i32 %9 to i64
  %57 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg579, i64 0, i64 %55, i64 %56
  br label %concatenate.13.merge24

concatenate.pivot.1.35:                           ; preds = %concatenate.pivot.1.32
  %58 = zext i32 %7 to i64
  %59 = zext i32 %9 to i64
  %60 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg477, i64 0, i64 %58, i64 %59
  br label %concatenate.13.merge24

concatenate.pivot.2.36:                           ; preds = %concatenate.pivot.1.32
  %61 = zext i32 %7 to i64
  %62 = zext i32 %9 to i64
  %63 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg375, i64 0, i64 %61, i64 %62
  br label %concatenate.13.merge24

concatenate.pivot.4.37:                           ; preds = %concatenate.13.merge6
  %64 = icmp eq i16 %6, 3
  br i1 %64, label %concatenate.pivot.3.38, label %concatenate.pivot.5.39

concatenate.pivot.3.38:                           ; preds = %concatenate.pivot.4.37
  %65 = zext i32 %7 to i64
  %66 = zext i32 %9 to i64
  %67 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg273, i64 0, i64 %65, i64 %66
  br label %concatenate.13.merge24

concatenate.pivot.5.39:                           ; preds = %concatenate.pivot.4.37
  %68 = icmp ult i16 %6, 5
  %69 = zext i32 %7 to i64
  %70 = zext i32 %9 to i64
  br i1 %68, label %concatenate.pivot.4.40, label %concatenate.pivot.5.41

concatenate.pivot.4.40:                           ; preds = %concatenate.pivot.5.39
  %71 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg171, i64 0, i64 %69, i64 %70
  br label %concatenate.13.merge24

concatenate.pivot.5.41:                           ; preds = %concatenate.pivot.5.39
  %72 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg069, i64 0, i64 %69, i64 %70
  br label %concatenate.13.merge24

concatenate.13.merge24:                           ; preds = %concatenate.pivot.5.41, %concatenate.pivot.4.40, %concatenate.pivot.3.38, %concatenate.pivot.2.36, %concatenate.pivot.1.35, %concatenate.pivot.0.33
  %.in67 = phi ptr addrspace(1) [ %57, %concatenate.pivot.0.33 ], [ %60, %concatenate.pivot.1.35 ], [ %63, %concatenate.pivot.2.36 ], [ %67, %concatenate.pivot.3.38 ], [ %71, %concatenate.pivot.4.40 ], [ %72, %concatenate.pivot.5.41 ]
  %73 = icmp ult i16 %6, 3
  %74 = load float, ptr addrspace(1) %.in67, align 4, !invariant.load !46
  %75 = getelementptr inbounds float, ptr addrspace(1) %33, i64 2
  store float %74, ptr addrspace(1) %75, align 8
  br i1 %73, label %concatenate.pivot.1.50, label %concatenate.pivot.4.55

concatenate.pivot.1.50:                           ; preds = %concatenate.13.merge24
  switch i32 %.zext, label %concatenate.pivot.2.54 [
    i32 0, label %concatenate.pivot.0.51
    i32 1, label %concatenate.pivot.1.53
  ]

concatenate.pivot.0.51:                           ; preds = %concatenate.pivot.1.50
  %76 = zext i32 %7 to i64
  %77 = zext i32 %10 to i64
  %78 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg579, i64 0, i64 %76, i64 %77
  br label %concatenate.13.merge42

concatenate.pivot.1.53:                           ; preds = %concatenate.pivot.1.50
  %79 = zext i32 %7 to i64
  %80 = zext i32 %10 to i64
  %81 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg477, i64 0, i64 %79, i64 %80
  br label %concatenate.13.merge42

concatenate.pivot.2.54:                           ; preds = %concatenate.pivot.1.50
  %82 = zext i32 %7 to i64
  %83 = zext i32 %10 to i64
  %84 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg375, i64 0, i64 %82, i64 %83
  br label %concatenate.13.merge42

concatenate.pivot.4.55:                           ; preds = %concatenate.13.merge24
  %85 = icmp eq i16 %6, 3
  br i1 %85, label %concatenate.pivot.3.56, label %concatenate.pivot.5.57

concatenate.pivot.3.56:                           ; preds = %concatenate.pivot.4.55
  %86 = zext i32 %7 to i64
  %87 = zext i32 %10 to i64
  %88 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg273, i64 0, i64 %86, i64 %87
  br label %concatenate.13.merge42

concatenate.pivot.5.57:                           ; preds = %concatenate.pivot.4.55
  %89 = icmp ult i16 %6, 5
  %90 = zext i32 %7 to i64
  %91 = zext i32 %10 to i64
  br i1 %89, label %concatenate.pivot.4.58, label %concatenate.pivot.5.59

concatenate.pivot.4.58:                           ; preds = %concatenate.pivot.5.57
  %92 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg171, i64 0, i64 %90, i64 %91
  br label %concatenate.13.merge42

concatenate.pivot.5.59:                           ; preds = %concatenate.pivot.5.57
  %93 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg069, i64 0, i64 %90, i64 %91
  br label %concatenate.13.merge42

concatenate.13.merge42:                           ; preds = %concatenate.pivot.5.59, %concatenate.pivot.4.58, %concatenate.pivot.3.56, %concatenate.pivot.2.54, %concatenate.pivot.1.53, %concatenate.pivot.0.51
  %.in68 = phi ptr addrspace(1) [ %78, %concatenate.pivot.0.51 ], [ %81, %concatenate.pivot.1.53 ], [ %84, %concatenate.pivot.2.54 ], [ %88, %concatenate.pivot.3.56 ], [ %92, %concatenate.pivot.4.58 ], [ %93, %concatenate.pivot.5.59 ]
  %94 = load float, ptr addrspace(1) %.in68, align 4, !invariant.load !46
  %95 = getelementptr inbounds float, ptr addrspace(1) %33, i64 3
  store float %94, ptr addrspace(1) %95, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_20(ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(524288) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(49020928) %arg4) local_unnamed_addr #0 {
entry:
  %arg464 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg362 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg260 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg158 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg056 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !58
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 1496
  %5 = mul i32 %4, 1496
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 1496
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 1496
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 1496
  %9 = icmp ult i32 %.decomposed, 1224
  br i1 %9, label %concatenate.pivot.968., label %concatenate.pivot.1480.

concatenate.pivot.968.:                           ; preds = %entry
  %10 = icmp ult i32 %.decomposed, 968
  br i1 %10, label %concatenate.pivot.0., label %concatenate.pivot.968.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.968.
  %11 = udiv i32 %linear_index_base, 1496
  %12 = mul nuw nsw i32 %11, 968
  %13 = add nuw nsw i32 %12, %.decomposed
  br label %concatenate.5.merge

concatenate.pivot.968.1:                          ; preds = %concatenate.pivot.968.
  %14 = add nsw i32 %.decomposed, -968
  %15 = udiv i32 %linear_index_base, 1496
  %16 = shl nuw nsw i32 %15, 8
  %17 = add nuw nsw i32 %14, %16
  br label %concatenate.5.merge

concatenate.pivot.1480.:                          ; preds = %entry
  %18 = icmp ult i32 %.decomposed, 1480
  %19 = udiv i32 %linear_index_base, 1496
  br i1 %18, label %concatenate.pivot.1224.2, label %concatenate.pivot.1480.3

concatenate.pivot.1224.2:                         ; preds = %concatenate.pivot.1480.
  %20 = add nsw i32 %.decomposed, -1224
  %21 = shl nuw nsw i32 %19, 8
  %22 = add nuw nsw i32 %20, %21
  br label %concatenate.5.merge

concatenate.pivot.1480.3:                         ; preds = %concatenate.pivot.1480.
  %23 = add nsw i32 %.decomposed, -1480
  %24 = shl nuw nsw i32 %19, 4
  %25 = add nuw nsw i32 %23, %24
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.1480.3, %concatenate.pivot.1224.2, %concatenate.pivot.968.1, %concatenate.pivot.0.
  %.sink49 = phi i32 [ %25, %concatenate.pivot.1480.3 ], [ %22, %concatenate.pivot.1224.2 ], [ %17, %concatenate.pivot.968.1 ], [ %13, %concatenate.pivot.0. ]
  %arg3.sink = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.1480.3 ], [ %arg260, %concatenate.pivot.1224.2 ], [ %arg158, %concatenate.pivot.968.1 ], [ %arg056, %concatenate.pivot.0. ]
  %26 = zext i32 %.sink49 to i64
  %27 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink, i64 %26
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !46
  %29 = zext i32 %linear_index_base to i64
  %30 = getelementptr float, ptr addrspace(1) %arg464, i64 %29
  store float %28, ptr addrspace(1) %30, align 16
  %31 = icmp ult i32 %6, 1224
  br i1 %31, label %concatenate.pivot.968.10, label %concatenate.pivot.1480.13

concatenate.pivot.968.10:                         ; preds = %concatenate.5.merge
  %32 = icmp ult i32 %6, 968
  br i1 %32, label %concatenate.pivot.0.11, label %concatenate.pivot.968.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.968.10
  %33 = udiv i32 %linear_index_base, 1496
  %34 = mul nuw nsw i32 %33, 968
  %35 = add nuw nsw i32 %34, %6
  br label %concatenate.5.merge4

concatenate.pivot.968.12:                         ; preds = %concatenate.pivot.968.10
  %36 = add nsw i32 %6, -968
  %37 = udiv i32 %linear_index_base, 1496
  %38 = shl nuw nsw i32 %37, 8
  %39 = add nuw nsw i32 %36, %38
  br label %concatenate.5.merge4

concatenate.pivot.1480.13:                        ; preds = %concatenate.5.merge
  %40 = icmp ult i32 %6, 1480
  %41 = udiv i32 %linear_index_base, 1496
  br i1 %40, label %concatenate.pivot.1224.14, label %concatenate.pivot.1480.15

concatenate.pivot.1224.14:                        ; preds = %concatenate.pivot.1480.13
  %42 = add nsw i32 %6, -1224
  %43 = shl nuw nsw i32 %41, 8
  %44 = add nuw nsw i32 %42, %43
  br label %concatenate.5.merge4

concatenate.pivot.1480.15:                        ; preds = %concatenate.pivot.1480.13
  %45 = add nsw i32 %6, -1480
  %46 = shl nuw nsw i32 %41, 4
  %47 = add nuw nsw i32 %45, %46
  br label %concatenate.5.merge4

concatenate.5.merge4:                             ; preds = %concatenate.pivot.1480.15, %concatenate.pivot.1224.14, %concatenate.pivot.968.12, %concatenate.pivot.0.11
  %.sink51 = phi i32 [ %47, %concatenate.pivot.1480.15 ], [ %44, %concatenate.pivot.1224.14 ], [ %39, %concatenate.pivot.968.12 ], [ %35, %concatenate.pivot.0.11 ]
  %arg3.sink50 = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.1480.15 ], [ %arg260, %concatenate.pivot.1224.14 ], [ %arg158, %concatenate.pivot.968.12 ], [ %arg056, %concatenate.pivot.0.11 ]
  %48 = zext i32 %.sink51 to i64
  %49 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink50, i64 %48
  %50 = load float, ptr addrspace(1) %49, align 4, !invariant.load !46
  %51 = getelementptr inbounds float, ptr addrspace(1) %30, i64 1
  store float %50, ptr addrspace(1) %51, align 4
  %52 = icmp ult i32 %7, 1224
  br i1 %52, label %concatenate.pivot.968.22, label %concatenate.pivot.1480.25

concatenate.pivot.968.22:                         ; preds = %concatenate.5.merge4
  %53 = icmp ult i32 %7, 968
  br i1 %53, label %concatenate.pivot.0.23, label %concatenate.pivot.968.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.968.22
  %54 = udiv i32 %linear_index_base, 1496
  %55 = mul nuw nsw i32 %54, 968
  %56 = add nuw nsw i32 %55, %7
  br label %concatenate.5.merge16

concatenate.pivot.968.24:                         ; preds = %concatenate.pivot.968.22
  %57 = add nsw i32 %7, -968
  %58 = udiv i32 %linear_index_base, 1496
  %59 = shl nuw nsw i32 %58, 8
  %60 = add nuw nsw i32 %57, %59
  br label %concatenate.5.merge16

concatenate.pivot.1480.25:                        ; preds = %concatenate.5.merge4
  %61 = icmp ult i32 %7, 1480
  %62 = udiv i32 %linear_index_base, 1496
  br i1 %61, label %concatenate.pivot.1224.26, label %concatenate.pivot.1480.27

concatenate.pivot.1224.26:                        ; preds = %concatenate.pivot.1480.25
  %63 = add nsw i32 %7, -1224
  %64 = shl nuw nsw i32 %62, 8
  %65 = add nuw nsw i32 %63, %64
  br label %concatenate.5.merge16

concatenate.pivot.1480.27:                        ; preds = %concatenate.pivot.1480.25
  %66 = add nsw i32 %7, -1480
  %67 = shl nuw nsw i32 %62, 4
  %68 = add nuw nsw i32 %66, %67
  br label %concatenate.5.merge16

concatenate.5.merge16:                            ; preds = %concatenate.pivot.1480.27, %concatenate.pivot.1224.26, %concatenate.pivot.968.24, %concatenate.pivot.0.23
  %.sink53 = phi i32 [ %68, %concatenate.pivot.1480.27 ], [ %65, %concatenate.pivot.1224.26 ], [ %60, %concatenate.pivot.968.24 ], [ %56, %concatenate.pivot.0.23 ]
  %arg3.sink52 = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.1480.27 ], [ %arg260, %concatenate.pivot.1224.26 ], [ %arg158, %concatenate.pivot.968.24 ], [ %arg056, %concatenate.pivot.0.23 ]
  %69 = zext i32 %.sink53 to i64
  %70 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink52, i64 %69
  %71 = load float, ptr addrspace(1) %70, align 4, !invariant.load !46
  %72 = getelementptr inbounds float, ptr addrspace(1) %30, i64 2
  store float %71, ptr addrspace(1) %72, align 8
  %73 = icmp ult i32 %8, 1224
  br i1 %73, label %concatenate.pivot.968.34, label %concatenate.pivot.1480.37

concatenate.pivot.968.34:                         ; preds = %concatenate.5.merge16
  %74 = icmp ult i32 %8, 968
  br i1 %74, label %concatenate.pivot.0.35, label %concatenate.pivot.968.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.968.34
  %75 = udiv i32 %linear_index_base, 1496
  %76 = mul nuw nsw i32 %75, 968
  %77 = add nuw nsw i32 %76, %8
  br label %concatenate.5.merge28

concatenate.pivot.968.36:                         ; preds = %concatenate.pivot.968.34
  %78 = add nsw i32 %8, -968
  %79 = udiv i32 %linear_index_base, 1496
  %80 = shl nuw nsw i32 %79, 8
  %81 = add nuw nsw i32 %78, %80
  br label %concatenate.5.merge28

concatenate.pivot.1480.37:                        ; preds = %concatenate.5.merge16
  %82 = icmp ult i32 %8, 1480
  br i1 %82, label %concatenate.pivot.1224.38, label %concatenate.pivot.1480.39

concatenate.pivot.1224.38:                        ; preds = %concatenate.pivot.1480.37
  %83 = add nsw i32 %8, -1224
  %84 = shl nuw nsw i32 %4, 8
  %85 = add nuw nsw i32 %83, %84
  br label %concatenate.5.merge28

concatenate.pivot.1480.39:                        ; preds = %concatenate.pivot.1480.37
  %86 = add nsw i32 %8, -1480
  %87 = shl nuw nsw i32 %4, 4
  %88 = add nuw nsw i32 %86, %87
  br label %concatenate.5.merge28

concatenate.5.merge28:                            ; preds = %concatenate.pivot.1480.39, %concatenate.pivot.1224.38, %concatenate.pivot.968.36, %concatenate.pivot.0.35
  %.sink55 = phi i32 [ %88, %concatenate.pivot.1480.39 ], [ %85, %concatenate.pivot.1224.38 ], [ %81, %concatenate.pivot.968.36 ], [ %77, %concatenate.pivot.0.35 ]
  %arg3.sink54 = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.1480.39 ], [ %arg260, %concatenate.pivot.1224.38 ], [ %arg158, %concatenate.pivot.968.36 ], [ %arg056, %concatenate.pivot.0.35 ]
  %89 = zext i32 %.sink55 to i64
  %90 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink54, i64 %89
  %91 = load float, ptr addrspace(1) %90, align 4, !invariant.load !46
  %92 = getelementptr inbounds float, ptr addrspace(1) %30, i64 3
  store float %91, ptr addrspace(1) %92, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @slice_33(ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(196608) %arg1) local_unnamed_addr #2 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !59
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %linear_index = or i32 %1, %2
  %.lhs.trunc = trunc i32 %linear_index to i16
  %.lhs.trunc.frozen = freeze i16 %.lhs.trunc
  %3 = udiv i16 %.lhs.trunc.frozen, 6
  %4 = mul i16 %3, 6
  %.decomposed = sub i16 %.lhs.trunc.frozen, %4
  %5 = zext i16 %3 to i64
  %6 = zext i16 %.decomposed to i64
  %7 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg03, i64 0, i64 %5, i64 %6
  %8 = getelementptr inbounds float, ptr addrspace(1) %7, i64 602
  %9 = load float, ptr addrspace(1) %8, align 4, !invariant.load !46
  %10 = zext i32 %linear_index to i64
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg15, i64 %10
  store float %9, ptr addrspace(1) %11, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @slice_38(ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(196608) %arg1) local_unnamed_addr #2 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !59
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %linear_index = or i32 %1, %2
  %.lhs.trunc = trunc i32 %linear_index to i16
  %.lhs.trunc.frozen = freeze i16 %.lhs.trunc
  %3 = udiv i16 %.lhs.trunc.frozen, 6
  %4 = mul i16 %3, 6
  %.decomposed = sub i16 %.lhs.trunc.frozen, %4
  %5 = or i16 %.decomposed, 608
  %6 = zext i16 %3 to i64
  %7 = zext i16 %5 to i64
  %8 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg03, i64 0, i64 %6, i64 %7
  %9 = load float, ptr addrspace(1) %8, align 4, !invariant.load !46
  %10 = zext i32 %linear_index to i64
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg15, i64 %10
  store float %9, ptr addrspace(1) %11, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_43(ptr noalias nocapture readonly align 16 dereferenceable(24) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(24) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg7) local_unnamed_addr #2 {
entry:
  %arg728 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds [8192 x [6 x float]], ptr addrspace(1) %arg218, i64 0, i64 %3, i64 0
  %5 = load <2 x float>, ptr addrspace(1) %4, align 8, !invariant.load !46
  %6 = extractelement <2 x float> %5, i32 0
  %7 = extractelement <2 x float> %5, i32 1
  %8 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg320, i64 0, i64 %3, i64 0
  %9 = getelementptr inbounds float, ptr addrspace(1) %8, i64 602
  %10 = load <2 x float>, ptr addrspace(1) %9, align 8, !invariant.load !46
  %11 = extractelement <2 x float> %10, i32 0
  %12 = extractelement <2 x float> %10, i32 1
  %add.8 = fadd float %6, %11
  %13 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg116, i64 0, i64 %3, i64 0
  %14 = getelementptr inbounds float, ptr addrspace(1) %13, i64 512
  %15 = load <2 x float>, ptr addrspace(1) %14, align 8, !invariant.load !46
  %16 = extractelement <2 x float> %15, i32 0
  %17 = extractelement <2 x float> %15, i32 1
  %add.10 = fadd float %add.8, %16
  %18 = load <4 x float>, ptr addrspace(1) %arg014, align 16, !invariant.load !46
  %19 = extractelement <4 x float> %18, i32 0
  %20 = extractelement <4 x float> %18, i32 1
  %21 = extractelement <4 x float> %18, i32 2
  %22 = extractelement <4 x float> %18, i32 3
  %add.12 = fadd float %add.10, %19
  %23 = fcmp ole float %add.12, 0xFFF0000000000000
  %maximum.17.i = select i1 %23, float 0xFFF0000000000000, float %add.12
  %add.8.1 = fadd float %7, %12
  %add.10.1 = fadd float %add.8.1, %17
  %add.12.1 = fadd float %add.10.1, %20
  %24 = fcmp oge float %maximum.17.i, %add.12.1
  %25 = fcmp uno float %maximum.17.i, 0.000000e+00
  %26 = or i1 %25, %24
  %maximum.17.i.1 = select i1 %26, float %maximum.17.i, float %add.12.1
  %27 = getelementptr inbounds float, ptr addrspace(1) %4, i64 2
  %28 = load <2 x float>, ptr addrspace(1) %27, align 8, !invariant.load !46
  %29 = extractelement <2 x float> %28, i32 0
  %30 = extractelement <2 x float> %28, i32 1
  %31 = getelementptr inbounds float, ptr addrspace(1) %8, i64 604
  %32 = load <2 x float>, ptr addrspace(1) %31, align 8, !invariant.load !46
  %33 = extractelement <2 x float> %32, i32 0
  %34 = extractelement <2 x float> %32, i32 1
  %add.8.2 = fadd float %29, %33
  %35 = getelementptr inbounds float, ptr addrspace(1) %13, i64 514
  %36 = load <2 x float>, ptr addrspace(1) %35, align 8, !invariant.load !46
  %37 = extractelement <2 x float> %36, i32 0
  %38 = extractelement <2 x float> %36, i32 1
  %add.10.2 = fadd float %add.8.2, %37
  %add.12.2 = fadd float %add.10.2, %21
  %39 = fcmp oge float %maximum.17.i.1, %add.12.2
  %40 = fcmp uno float %maximum.17.i.1, 0.000000e+00
  %41 = or i1 %40, %39
  %maximum.17.i.2 = select i1 %41, float %maximum.17.i.1, float %add.12.2
  %add.8.3 = fadd float %30, %34
  %add.10.3 = fadd float %add.8.3, %38
  %add.12.3 = fadd float %add.10.3, %22
  %42 = fcmp oge float %maximum.17.i.2, %add.12.3
  %43 = fcmp uno float %maximum.17.i.2, 0.000000e+00
  %44 = or i1 %43, %42
  %maximum.17.i.3 = select i1 %44, float %maximum.17.i.2, float %add.12.3
  %45 = getelementptr inbounds float, ptr addrspace(1) %4, i64 4
  %46 = load <2 x float>, ptr addrspace(1) %45, align 8, !invariant.load !46
  %47 = extractelement <2 x float> %46, i32 0
  %48 = extractelement <2 x float> %46, i32 1
  %49 = getelementptr inbounds float, ptr addrspace(1) %8, i64 606
  %50 = load <2 x float>, ptr addrspace(1) %49, align 8, !invariant.load !46
  %51 = extractelement <2 x float> %50, i32 0
  %52 = extractelement <2 x float> %50, i32 1
  %add.8.4 = fadd float %47, %51
  %53 = getelementptr inbounds float, ptr addrspace(1) %13, i64 516
  %54 = load <2 x float>, ptr addrspace(1) %53, align 8, !invariant.load !46
  %55 = extractelement <2 x float> %54, i32 0
  %56 = extractelement <2 x float> %54, i32 1
  %add.10.4 = fadd float %add.8.4, %55
  %57 = getelementptr inbounds [6 x float], ptr addrspace(1) %arg014, i64 0, i64 4
  %58 = load <2 x float>, ptr addrspace(1) %57, align 16, !invariant.load !46
  %59 = extractelement <2 x float> %58, i32 0
  %60 = extractelement <2 x float> %58, i32 1
  %add.12.4 = fadd float %add.10.4, %59
  %61 = fcmp oge float %maximum.17.i.3, %add.12.4
  %62 = fcmp uno float %maximum.17.i.3, 0.000000e+00
  %63 = or i1 %62, %61
  %maximum.17.i.4 = select i1 %63, float %maximum.17.i.3, float %add.12.4
  %add.8.5 = fadd float %48, %52
  %add.10.5 = fadd float %add.8.5, %56
  %add.12.5 = fadd float %add.10.5, %60
  %64 = fcmp oge float %maximum.17.i.4, %add.12.5
  %65 = fcmp uno float %maximum.17.i.4, 0.000000e+00
  %66 = or i1 %65, %64
  %67 = getelementptr inbounds [8192 x [6 x float]], ptr addrspace(1) %arg524, i64 0, i64 %3, i64 0
  %68 = load <2 x float>, ptr addrspace(1) %67, align 8, !invariant.load !46
  %69 = extractelement <2 x float> %68, i32 0
  %70 = extractelement <2 x float> %68, i32 1
  %71 = getelementptr inbounds float, ptr addrspace(1) %8, i64 608
  %72 = load <2 x float>, ptr addrspace(1) %71, align 8, !invariant.load !46
  %73 = extractelement <2 x float> %72, i32 0
  %74 = extractelement <2 x float> %72, i32 1
  %add.20 = fadd float %69, %73
  %75 = getelementptr inbounds float, ptr addrspace(1) %13, i64 518
  %76 = load <2 x float>, ptr addrspace(1) %75, align 8, !invariant.load !46
  %77 = extractelement <2 x float> %76, i32 0
  %78 = extractelement <2 x float> %76, i32 1
  %add.22 = fadd float %add.20, %77
  %79 = load <4 x float>, ptr addrspace(1) %arg422, align 16, !invariant.load !46
  %80 = extractelement <4 x float> %79, i32 0
  %81 = extractelement <4 x float> %79, i32 1
  %82 = extractelement <4 x float> %79, i32 2
  %83 = extractelement <4 x float> %79, i32 3
  %add.24 = fadd float %add.22, %80
  %84 = fcmp ole float %add.24, 0xFFF0000000000000
  %maximum.28.i = select i1 %84, float 0xFFF0000000000000, float %add.24
  %add.20.1 = fadd float %70, %74
  %add.22.1 = fadd float %add.20.1, %78
  %add.24.1 = fadd float %add.22.1, %81
  %85 = fcmp oge float %maximum.28.i, %add.24.1
  %86 = fcmp uno float %maximum.28.i, 0.000000e+00
  %87 = or i1 %86, %85
  %maximum.28.i.1 = select i1 %87, float %maximum.28.i, float %add.24.1
  %88 = getelementptr inbounds float, ptr addrspace(1) %67, i64 2
  %89 = load <2 x float>, ptr addrspace(1) %88, align 8, !invariant.load !46
  %90 = extractelement <2 x float> %89, i32 0
  %91 = extractelement <2 x float> %89, i32 1
  %92 = getelementptr inbounds float, ptr addrspace(1) %8, i64 610
  %93 = load <2 x float>, ptr addrspace(1) %92, align 8, !invariant.load !46
  %94 = extractelement <2 x float> %93, i32 0
  %95 = extractelement <2 x float> %93, i32 1
  %add.20.2 = fadd float %90, %94
  %96 = getelementptr inbounds float, ptr addrspace(1) %13, i64 520
  %97 = load <2 x float>, ptr addrspace(1) %96, align 8, !invariant.load !46
  %98 = extractelement <2 x float> %97, i32 0
  %99 = extractelement <2 x float> %97, i32 1
  %add.22.2 = fadd float %add.20.2, %98
  %add.24.2 = fadd float %add.22.2, %82
  %100 = fcmp oge float %maximum.28.i.1, %add.24.2
  %101 = fcmp uno float %maximum.28.i.1, 0.000000e+00
  %102 = or i1 %101, %100
  %maximum.28.i.2 = select i1 %102, float %maximum.28.i.1, float %add.24.2
  %add.20.3 = fadd float %91, %95
  %add.22.3 = fadd float %add.20.3, %99
  %add.24.3 = fadd float %add.22.3, %83
  %103 = fcmp oge float %maximum.28.i.2, %add.24.3
  %104 = fcmp uno float %maximum.28.i.2, 0.000000e+00
  %105 = or i1 %104, %103
  %maximum.28.i.3 = select i1 %105, float %maximum.28.i.2, float %add.24.3
  %106 = getelementptr inbounds float, ptr addrspace(1) %67, i64 4
  %107 = load <2 x float>, ptr addrspace(1) %106, align 8, !invariant.load !46
  %108 = extractelement <2 x float> %107, i32 0
  %109 = extractelement <2 x float> %107, i32 1
  %110 = getelementptr inbounds float, ptr addrspace(1) %8, i64 612
  %111 = load <2 x float>, ptr addrspace(1) %110, align 8, !invariant.load !46
  %112 = extractelement <2 x float> %111, i32 0
  %113 = extractelement <2 x float> %111, i32 1
  %add.20.4 = fadd float %108, %112
  %114 = getelementptr inbounds float, ptr addrspace(1) %13, i64 522
  %115 = load <2 x float>, ptr addrspace(1) %114, align 8, !invariant.load !46
  %116 = extractelement <2 x float> %115, i32 0
  %117 = extractelement <2 x float> %115, i32 1
  %add.22.4 = fadd float %add.20.4, %116
  %118 = getelementptr inbounds [6 x float], ptr addrspace(1) %arg422, i64 0, i64 4
  %119 = load <2 x float>, ptr addrspace(1) %118, align 16, !invariant.load !46
  %120 = extractelement <2 x float> %119, i32 0
  %121 = extractelement <2 x float> %119, i32 1
  %add.24.4 = fadd float %add.22.4, %120
  %122 = fcmp oge float %maximum.28.i.3, %add.24.4
  %123 = fcmp uno float %maximum.28.i.3, 0.000000e+00
  %124 = or i1 %123, %122
  %maximum.28.i.4 = select i1 %124, float %maximum.28.i.3, float %add.24.4
  %add.20.5 = fadd float %109, %113
  %add.22.5 = fadd float %add.20.5, %117
  %add.24.5 = fadd float %add.22.5, %121
  %125 = fcmp oge float %maximum.28.i.4, %add.24.5
  %126 = fcmp uno float %maximum.28.i.4, 0.000000e+00
  %127 = or i1 %126, %125
  %maximum.28.i.5 = select i1 %127, float %maximum.28.i.4, float %add.24.5
  %maximum.17.i.5 = select i1 %66, float %maximum.17.i.4, float %add.12.5
  %128 = getelementptr inbounds float, ptr addrspace(1) %arg626, i64 %3
  store float %maximum.17.i.5, ptr addrspace(1) %128, align 4
  %129 = getelementptr inbounds float, ptr addrspace(1) %arg728, i64 %3
  store float %maximum.28.i.5, ptr addrspace(1) %129, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_35(ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(24) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(24) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg9) local_unnamed_addr #2 {
entry:
  %arg932 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg830 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg728 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg626 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds [8192 x float], ptr addrspace(1) %arg014, i64 0, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !46
  %6 = getelementptr inbounds [8192 x [6 x float]], ptr addrspace(1) %arg320, i64 0, i64 %3, i64 0
  %7 = load <2 x float>, ptr addrspace(1) %6, align 8, !invariant.load !46
  %8 = extractelement <2 x float> %7, i32 0
  %9 = extractelement <2 x float> %7, i32 1
  %10 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg422, i64 0, i64 %3, i64 0
  %11 = getelementptr inbounds float, ptr addrspace(1) %10, i64 602
  %12 = load <2 x float>, ptr addrspace(1) %11, align 8, !invariant.load !46
  %13 = extractelement <2 x float> %12, i32 0
  %14 = extractelement <2 x float> %12, i32 1
  %add.10 = fadd float %8, %13
  %15 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg218, i64 0, i64 %3, i64 0
  %16 = getelementptr inbounds float, ptr addrspace(1) %15, i64 512
  %17 = load <2 x float>, ptr addrspace(1) %16, align 8, !invariant.load !46
  %18 = extractelement <2 x float> %17, i32 0
  %19 = extractelement <2 x float> %17, i32 1
  %add.12 = fadd float %add.10, %18
  %20 = load <4 x float>, ptr addrspace(1) %arg116, align 16, !invariant.load !46
  %21 = extractelement <4 x float> %20, i32 0
  %22 = extractelement <4 x float> %20, i32 1
  %23 = extractelement <4 x float> %20, i32 2
  %24 = extractelement <4 x float> %20, i32 3
  %add.14 = fadd float %add.12, %21
  %subtract.17 = fsub float %add.14, %5
  %25 = tail call float @llvm.fma.f32(float %subtract.17, float 0x3F777313A0000000, float 5.000000e-01)
  %26 = tail call float @llvm.nvvm.saturate.f(float %25) #6
  %27 = tail call float @llvm.nvvm.fma.rm.f(float %26, float 2.520000e+02, float 0x4168000020000000) #6
  %28 = fadd float %27, 0xC168000FE0000000
  %29 = fneg float %28
  %30 = tail call float @llvm.fma.f32(float %subtract.17, float 0x3FF7154760000000, float %29)
  %31 = tail call float @llvm.fma.f32(float %subtract.17, float 0x3E54AE0C00000000, float %30)
  %32 = bitcast float %27 to i32
  %33 = shl i32 %32, 23
  %34 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %31) #6
  %add.10.1 = fadd float %9, %14
  %add.12.1 = fadd float %add.10.1, %19
  %add.14.1 = fadd float %add.12.1, %22
  %subtract.17.1 = fsub float %add.14.1, %5
  %35 = tail call float @llvm.fma.f32(float %subtract.17.1, float 0x3F777313A0000000, float 5.000000e-01)
  %36 = tail call float @llvm.nvvm.saturate.f(float %35) #6
  %37 = tail call float @llvm.nvvm.fma.rm.f(float %36, float 2.520000e+02, float 0x4168000020000000) #6
  %38 = fadd float %37, 0xC168000FE0000000
  %39 = fneg float %38
  %40 = tail call float @llvm.fma.f32(float %subtract.17.1, float 0x3FF7154760000000, float %39)
  %41 = tail call float @llvm.fma.f32(float %subtract.17.1, float 0x3E54AE0C00000000, float %40)
  %42 = bitcast float %37 to i32
  %43 = shl i32 %42, 23
  %44 = bitcast i32 %43 to float
  %45 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %41) #6
  %46 = fmul float %45, %44
  %47 = getelementptr inbounds float, ptr addrspace(1) %6, i64 2
  %48 = load <2 x float>, ptr addrspace(1) %47, align 8, !invariant.load !46
  %49 = extractelement <2 x float> %48, i32 0
  %50 = extractelement <2 x float> %48, i32 1
  %51 = getelementptr inbounds float, ptr addrspace(1) %10, i64 604
  %52 = load <2 x float>, ptr addrspace(1) %51, align 8, !invariant.load !46
  %53 = extractelement <2 x float> %52, i32 0
  %54 = extractelement <2 x float> %52, i32 1
  %add.10.2 = fadd float %49, %53
  %55 = getelementptr inbounds float, ptr addrspace(1) %15, i64 514
  %56 = load <2 x float>, ptr addrspace(1) %55, align 8, !invariant.load !46
  %57 = extractelement <2 x float> %56, i32 0
  %58 = extractelement <2 x float> %56, i32 1
  %add.12.2 = fadd float %add.10.2, %57
  %add.14.2 = fadd float %add.12.2, %23
  %subtract.17.2 = fsub float %add.14.2, %5
  %59 = tail call float @llvm.fma.f32(float %subtract.17.2, float 0x3F777313A0000000, float 5.000000e-01)
  %60 = tail call float @llvm.nvvm.saturate.f(float %59) #6
  %61 = tail call float @llvm.nvvm.fma.rm.f(float %60, float 2.520000e+02, float 0x4168000020000000) #6
  %62 = fadd float %61, 0xC168000FE0000000
  %63 = fneg float %62
  %64 = tail call float @llvm.fma.f32(float %subtract.17.2, float 0x3FF7154760000000, float %63)
  %65 = tail call float @llvm.fma.f32(float %subtract.17.2, float 0x3E54AE0C00000000, float %64)
  %66 = bitcast float %61 to i32
  %67 = shl i32 %66, 23
  %68 = bitcast i32 %67 to float
  %69 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %65) #6
  %70 = fmul float %69, %68
  %add.10.3 = fadd float %50, %54
  %add.12.3 = fadd float %add.10.3, %58
  %add.14.3 = fadd float %add.12.3, %24
  %subtract.17.3 = fsub float %add.14.3, %5
  %71 = tail call float @llvm.fma.f32(float %subtract.17.3, float 0x3F777313A0000000, float 5.000000e-01)
  %72 = tail call float @llvm.nvvm.saturate.f(float %71) #6
  %73 = tail call float @llvm.nvvm.fma.rm.f(float %72, float 2.520000e+02, float 0x4168000020000000) #6
  %74 = fadd float %73, 0xC168000FE0000000
  %75 = fneg float %74
  %76 = tail call float @llvm.fma.f32(float %subtract.17.3, float 0x3FF7154760000000, float %75)
  %77 = tail call float @llvm.fma.f32(float %subtract.17.3, float 0x3E54AE0C00000000, float %76)
  %78 = bitcast float %73 to i32
  %79 = shl i32 %78, 23
  %80 = bitcast i32 %79 to float
  %81 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %77) #6
  %82 = fmul float %81, %80
  %83 = getelementptr inbounds float, ptr addrspace(1) %6, i64 4
  %84 = load <2 x float>, ptr addrspace(1) %83, align 8, !invariant.load !46
  %85 = extractelement <2 x float> %84, i32 0
  %86 = extractelement <2 x float> %84, i32 1
  %87 = getelementptr inbounds float, ptr addrspace(1) %10, i64 606
  %88 = load <2 x float>, ptr addrspace(1) %87, align 8, !invariant.load !46
  %89 = extractelement <2 x float> %88, i32 0
  %90 = extractelement <2 x float> %88, i32 1
  %add.10.4 = fadd float %85, %89
  %91 = getelementptr inbounds float, ptr addrspace(1) %15, i64 516
  %92 = load <2 x float>, ptr addrspace(1) %91, align 8, !invariant.load !46
  %93 = extractelement <2 x float> %92, i32 0
  %94 = extractelement <2 x float> %92, i32 1
  %add.12.4 = fadd float %add.10.4, %93
  %95 = getelementptr inbounds [6 x float], ptr addrspace(1) %arg116, i64 0, i64 4
  %96 = load <2 x float>, ptr addrspace(1) %95, align 16, !invariant.load !46
  %97 = extractelement <2 x float> %96, i32 0
  %98 = extractelement <2 x float> %96, i32 1
  %add.14.4 = fadd float %add.12.4, %97
  %subtract.17.4 = fsub float %add.14.4, %5
  %99 = tail call float @llvm.fma.f32(float %subtract.17.4, float 0x3F777313A0000000, float 5.000000e-01)
  %100 = tail call float @llvm.nvvm.saturate.f(float %99) #6
  %101 = tail call float @llvm.nvvm.fma.rm.f(float %100, float 2.520000e+02, float 0x4168000020000000) #6
  %102 = fadd float %101, 0xC168000FE0000000
  %103 = fneg float %102
  %104 = tail call float @llvm.fma.f32(float %subtract.17.4, float 0x3FF7154760000000, float %103)
  %105 = tail call float @llvm.fma.f32(float %subtract.17.4, float 0x3E54AE0C00000000, float %104)
  %106 = bitcast float %101 to i32
  %107 = shl i32 %106, 23
  %108 = bitcast i32 %107 to float
  %109 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %105) #6
  %110 = fmul float %109, %108
  %add.10.5 = fadd float %86, %90
  %add.12.5 = fadd float %add.10.5, %94
  %add.14.5 = fadd float %add.12.5, %98
  %subtract.17.5 = fsub float %add.14.5, %5
  %111 = tail call float @llvm.fma.f32(float %subtract.17.5, float 0x3F777313A0000000, float 5.000000e-01)
  %112 = tail call float @llvm.nvvm.saturate.f(float %111) #6
  %113 = tail call float @llvm.nvvm.fma.rm.f(float %112, float 2.520000e+02, float 0x4168000020000000) #6
  %114 = fadd float %113, 0xC168000FE0000000
  %115 = fneg float %114
  %116 = tail call float @llvm.fma.f32(float %subtract.17.5, float 0x3FF7154760000000, float %115)
  %117 = tail call float @llvm.fma.f32(float %subtract.17.5, float 0x3E54AE0C00000000, float %116)
  %118 = bitcast float %113 to i32
  %119 = shl i32 %118, 23
  %120 = bitcast i32 %119 to float
  %121 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %117) #6
  %122 = fmul float %121, %120
  %123 = getelementptr inbounds [8192 x float], ptr addrspace(1) %arg524, i64 0, i64 %3
  %124 = load float, ptr addrspace(1) %123, align 4, !invariant.load !46
  %125 = getelementptr inbounds [8192 x [6 x float]], ptr addrspace(1) %arg728, i64 0, i64 %3, i64 0
  %126 = load <2 x float>, ptr addrspace(1) %125, align 8, !invariant.load !46
  %127 = extractelement <2 x float> %126, i32 0
  %128 = extractelement <2 x float> %126, i32 1
  %129 = getelementptr inbounds float, ptr addrspace(1) %10, i64 608
  %130 = load <2 x float>, ptr addrspace(1) %129, align 8, !invariant.load !46
  %131 = extractelement <2 x float> %130, i32 0
  %132 = extractelement <2 x float> %130, i32 1
  %add.27 = fadd float %127, %131
  %133 = getelementptr inbounds float, ptr addrspace(1) %15, i64 518
  %134 = load <2 x float>, ptr addrspace(1) %133, align 8, !invariant.load !46
  %135 = extractelement <2 x float> %134, i32 0
  %136 = extractelement <2 x float> %134, i32 1
  %add.29 = fadd float %add.27, %135
  %137 = load <4 x float>, ptr addrspace(1) %arg626, align 16, !invariant.load !46
  %138 = extractelement <4 x float> %137, i32 0
  %139 = extractelement <4 x float> %137, i32 1
  %140 = extractelement <4 x float> %137, i32 2
  %141 = extractelement <4 x float> %137, i32 3
  %add.31 = fadd float %add.29, %138
  %subtract.34 = fsub float %add.31, %124
  %142 = tail call float @llvm.fma.f32(float %subtract.34, float 0x3F777313A0000000, float 5.000000e-01)
  %143 = tail call float @llvm.nvvm.saturate.f(float %142) #6
  %144 = tail call float @llvm.nvvm.fma.rm.f(float %143, float 2.520000e+02, float 0x4168000020000000) #6
  %145 = fadd float %144, 0xC168000FE0000000
  %146 = fneg float %145
  %147 = tail call float @llvm.fma.f32(float %subtract.34, float 0x3FF7154760000000, float %146)
  %148 = tail call float @llvm.fma.f32(float %subtract.34, float 0x3E54AE0C00000000, float %147)
  %149 = bitcast float %144 to i32
  %150 = shl i32 %149, 23
  %151 = bitcast i32 %150 to float
  %152 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %148) #6
  %153 = fmul float %152, %151
  %add.27.1 = fadd float %128, %132
  %add.29.1 = fadd float %add.27.1, %136
  %add.31.1 = fadd float %add.29.1, %139
  %subtract.34.1 = fsub float %add.31.1, %124
  %154 = tail call float @llvm.fma.f32(float %subtract.34.1, float 0x3F777313A0000000, float 5.000000e-01)
  %155 = tail call float @llvm.nvvm.saturate.f(float %154) #6
  %156 = tail call float @llvm.nvvm.fma.rm.f(float %155, float 2.520000e+02, float 0x4168000020000000) #6
  %157 = fadd float %156, 0xC168000FE0000000
  %158 = fneg float %157
  %159 = tail call float @llvm.fma.f32(float %subtract.34.1, float 0x3FF7154760000000, float %158)
  %160 = tail call float @llvm.fma.f32(float %subtract.34.1, float 0x3E54AE0C00000000, float %159)
  %161 = bitcast float %156 to i32
  %162 = shl i32 %161, 23
  %163 = bitcast i32 %162 to float
  %164 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %160) #6
  %165 = fmul float %164, %163
  %add.40.i.1 = fadd float %153, %165
  %166 = getelementptr inbounds float, ptr addrspace(1) %125, i64 2
  %167 = load <2 x float>, ptr addrspace(1) %166, align 8, !invariant.load !46
  %168 = extractelement <2 x float> %167, i32 0
  %169 = extractelement <2 x float> %167, i32 1
  %170 = getelementptr inbounds float, ptr addrspace(1) %10, i64 610
  %171 = load <2 x float>, ptr addrspace(1) %170, align 8, !invariant.load !46
  %172 = extractelement <2 x float> %171, i32 0
  %173 = extractelement <2 x float> %171, i32 1
  %add.27.2 = fadd float %168, %172
  %174 = getelementptr inbounds float, ptr addrspace(1) %15, i64 520
  %175 = load <2 x float>, ptr addrspace(1) %174, align 8, !invariant.load !46
  %176 = extractelement <2 x float> %175, i32 0
  %177 = extractelement <2 x float> %175, i32 1
  %add.29.2 = fadd float %add.27.2, %176
  %add.31.2 = fadd float %add.29.2, %140
  %subtract.34.2 = fsub float %add.31.2, %124
  %178 = tail call float @llvm.fma.f32(float %subtract.34.2, float 0x3F777313A0000000, float 5.000000e-01)
  %179 = tail call float @llvm.nvvm.saturate.f(float %178) #6
  %180 = tail call float @llvm.nvvm.fma.rm.f(float %179, float 2.520000e+02, float 0x4168000020000000) #6
  %181 = fadd float %180, 0xC168000FE0000000
  %182 = fneg float %181
  %183 = tail call float @llvm.fma.f32(float %subtract.34.2, float 0x3FF7154760000000, float %182)
  %184 = tail call float @llvm.fma.f32(float %subtract.34.2, float 0x3E54AE0C00000000, float %183)
  %185 = bitcast float %180 to i32
  %186 = shl i32 %185, 23
  %187 = bitcast i32 %186 to float
  %188 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %184) #6
  %189 = fmul float %188, %187
  %add.40.i.2 = fadd float %add.40.i.1, %189
  %add.27.3 = fadd float %169, %173
  %add.29.3 = fadd float %add.27.3, %177
  %add.31.3 = fadd float %add.29.3, %141
  %subtract.34.3 = fsub float %add.31.3, %124
  %190 = tail call float @llvm.fma.f32(float %subtract.34.3, float 0x3F777313A0000000, float 5.000000e-01)
  %191 = tail call float @llvm.nvvm.saturate.f(float %190) #6
  %192 = tail call float @llvm.nvvm.fma.rm.f(float %191, float 2.520000e+02, float 0x4168000020000000) #6
  %193 = fadd float %192, 0xC168000FE0000000
  %194 = fneg float %193
  %195 = tail call float @llvm.fma.f32(float %subtract.34.3, float 0x3FF7154760000000, float %194)
  %196 = tail call float @llvm.fma.f32(float %subtract.34.3, float 0x3E54AE0C00000000, float %195)
  %197 = bitcast float %192 to i32
  %198 = shl i32 %197, 23
  %199 = bitcast i32 %198 to float
  %200 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %196) #6
  %201 = fmul float %200, %199
  %add.40.i.3 = fadd float %add.40.i.2, %201
  %202 = getelementptr inbounds float, ptr addrspace(1) %125, i64 4
  %203 = load <2 x float>, ptr addrspace(1) %202, align 8, !invariant.load !46
  %204 = extractelement <2 x float> %203, i32 0
  %205 = extractelement <2 x float> %203, i32 1
  %206 = getelementptr inbounds float, ptr addrspace(1) %10, i64 612
  %207 = load <2 x float>, ptr addrspace(1) %206, align 8, !invariant.load !46
  %208 = extractelement <2 x float> %207, i32 0
  %209 = extractelement <2 x float> %207, i32 1
  %add.27.4 = fadd float %204, %208
  %210 = getelementptr inbounds float, ptr addrspace(1) %15, i64 522
  %211 = load <2 x float>, ptr addrspace(1) %210, align 8, !invariant.load !46
  %212 = extractelement <2 x float> %211, i32 0
  %213 = extractelement <2 x float> %211, i32 1
  %add.29.4 = fadd float %add.27.4, %212
  %214 = getelementptr inbounds [6 x float], ptr addrspace(1) %arg626, i64 0, i64 4
  %215 = load <2 x float>, ptr addrspace(1) %214, align 16, !invariant.load !46
  %216 = extractelement <2 x float> %215, i32 0
  %217 = extractelement <2 x float> %215, i32 1
  %add.31.4 = fadd float %add.29.4, %216
  %subtract.34.4 = fsub float %add.31.4, %124
  %218 = tail call float @llvm.fma.f32(float %subtract.34.4, float 0x3F777313A0000000, float 5.000000e-01)
  %219 = tail call float @llvm.nvvm.saturate.f(float %218) #6
  %220 = tail call float @llvm.nvvm.fma.rm.f(float %219, float 2.520000e+02, float 0x4168000020000000) #6
  %221 = fadd float %220, 0xC168000FE0000000
  %222 = fneg float %221
  %223 = tail call float @llvm.fma.f32(float %subtract.34.4, float 0x3FF7154760000000, float %222)
  %224 = tail call float @llvm.fma.f32(float %subtract.34.4, float 0x3E54AE0C00000000, float %223)
  %225 = bitcast float %220 to i32
  %226 = shl i32 %225, 23
  %227 = bitcast i32 %226 to float
  %228 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %224) #6
  %229 = fmul float %228, %227
  %add.40.i.4 = fadd float %add.40.i.3, %229
  %add.27.5 = fadd float %205, %209
  %add.29.5 = fadd float %add.27.5, %213
  %add.31.5 = fadd float %add.29.5, %217
  %subtract.34.5 = fsub float %add.31.5, %124
  %230 = tail call float @llvm.fma.f32(float %subtract.34.5, float 0x3F777313A0000000, float 5.000000e-01)
  %231 = tail call float @llvm.nvvm.saturate.f(float %230) #6
  %232 = tail call float @llvm.nvvm.fma.rm.f(float %231, float 2.520000e+02, float 0x4168000020000000) #6
  %233 = fadd float %232, 0xC168000FE0000000
  %234 = fneg float %233
  %235 = tail call float @llvm.fma.f32(float %subtract.34.5, float 0x3FF7154760000000, float %234)
  %236 = tail call float @llvm.fma.f32(float %subtract.34.5, float 0x3E54AE0C00000000, float %235)
  %237 = bitcast float %232 to i32
  %238 = shl i32 %237, 23
  %239 = bitcast i32 %238 to float
  %240 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %236) #6
  %241 = fmul float %240, %239
  %add.40.i.5 = fadd float %add.40.i.4, %241
  %242 = bitcast i32 %33 to float
  %243 = fmul float %34, %242
  %add.24.i.1 = fadd float %243, %46
  %add.24.i.2 = fadd float %add.24.i.1, %70
  %add.24.i.3 = fadd float %add.24.i.2, %82
  %add.24.i.4 = fadd float %add.24.i.3, %110
  %add.24.i.5 = fadd float %add.24.i.4, %122
  %244 = getelementptr inbounds float, ptr addrspace(1) %arg830, i64 %3
  store float %add.24.i.5, ptr addrspace(1) %244, align 4
  %245 = getelementptr inbounds float, ptr addrspace(1) %arg932, i64 %3
  store float %add.40.i.5, ptr addrspace(1) %245, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_34(ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(24) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(24) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(196608) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(196608) %arg11) local_unnamed_addr #2 {
entry:
  %arg1125 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1023 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg921 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg819 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg717 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg615 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg513 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg411 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg39 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg27 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !59
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %linear_index = or i32 %1, %2
  %.lhs.trunc = trunc i32 %linear_index to i16
  %.lhs.trunc.frozen = freeze i16 %.lhs.trunc
  %3 = udiv i16 %.lhs.trunc.frozen, 6
  %4 = mul i16 %3, 6
  %.decomposed = sub i16 %.lhs.trunc.frozen, %4
  %.zext2 = zext i16 %.decomposed to i32
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg411, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !46
  %8 = zext i16 %3 to i64
  %9 = zext i32 %.zext2 to i64
  %10 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg513, i64 0, i64 %8, i64 %9
  %11 = getelementptr inbounds float, ptr addrspace(1) %10, i64 602
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !46
  %add.12 = fadd float %7, %12
  %13 = or i32 %.zext2, 512
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg39, i64 0, i64 %8, i64 %14
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !46
  %add.14 = fadd float %add.12, %16
  %17 = zext i16 %.decomposed to i64
  %18 = getelementptr inbounds [6 x float], ptr addrspace(1) %arg27, i64 0, i64 %17
  %19 = load float, ptr addrspace(1) %18, align 4, !invariant.load !46
  %add.16 = fadd float %add.14, %19
  %20 = getelementptr inbounds [8192 x float], ptr addrspace(1) %arg15, i64 0, i64 %8
  %21 = load float, ptr addrspace(1) %20, align 4, !invariant.load !46
  %subtract.19 = fsub float %add.16, %21
  %22 = tail call float @llvm.fma.f32(float %subtract.19, float 0x3F777313A0000000, float 5.000000e-01)
  %23 = tail call float @llvm.nvvm.saturate.f(float %22) #6
  %24 = tail call float @llvm.nvvm.fma.rm.f(float %23, float 2.520000e+02, float 0x4168000020000000) #6
  %25 = fadd float %24, 0xC168000FE0000000
  %26 = fneg float %25
  %27 = tail call float @llvm.fma.f32(float %subtract.19, float 0x3FF7154760000000, float %26)
  %28 = tail call float @llvm.fma.f32(float %subtract.19, float 0x3E54AE0C00000000, float %27)
  %29 = bitcast float %24 to i32
  %30 = shl i32 %29, 23
  %31 = bitcast i32 %30 to float
  %32 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %28) #6
  %33 = fmul float %32, %31
  %34 = getelementptr inbounds [8192 x float], ptr addrspace(1) %arg03, i64 0, i64 %8
  %35 = load float, ptr addrspace(1) %34, align 4, !invariant.load !46
  %divide.22 = fdiv float %33, %35
  %36 = getelementptr inbounds float, ptr addrspace(1) %arg921, i64 %5
  %37 = load float, ptr addrspace(1) %36, align 4, !invariant.load !46
  %38 = or i32 %.zext2, 608
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg513, i64 0, i64 %8, i64 %39
  %41 = load float, ptr addrspace(1) %40, align 4, !invariant.load !46
  %add.25 = fadd float %37, %41
  %42 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg39, i64 0, i64 %8, i64 %9
  %43 = getelementptr inbounds float, ptr addrspace(1) %42, i64 518
  %44 = load float, ptr addrspace(1) %43, align 4, !invariant.load !46
  %add.27 = fadd float %add.25, %44
  %45 = getelementptr inbounds [6 x float], ptr addrspace(1) %arg819, i64 0, i64 %17
  %46 = load float, ptr addrspace(1) %45, align 4, !invariant.load !46
  %add.29 = fadd float %add.27, %46
  %47 = getelementptr inbounds [8192 x float], ptr addrspace(1) %arg717, i64 0, i64 %8
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !46
  %subtract.32 = fsub float %add.29, %48
  %49 = tail call float @llvm.fma.f32(float %subtract.32, float 0x3F777313A0000000, float 5.000000e-01)
  %50 = tail call float @llvm.nvvm.saturate.f(float %49) #6
  %51 = tail call float @llvm.nvvm.fma.rm.f(float %50, float 2.520000e+02, float 0x4168000020000000) #6
  %52 = fadd float %51, 0xC168000FE0000000
  %53 = fneg float %52
  %54 = tail call float @llvm.fma.f32(float %subtract.32, float 0x3FF7154760000000, float %53)
  %55 = tail call float @llvm.fma.f32(float %subtract.32, float 0x3E54AE0C00000000, float %54)
  %56 = bitcast float %51 to i32
  %57 = shl i32 %56, 23
  %58 = bitcast i32 %57 to float
  %59 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %55) #6
  %60 = fmul float %59, %58
  %61 = getelementptr inbounds [8192 x float], ptr addrspace(1) %arg615, i64 0, i64 %8
  %62 = load float, ptr addrspace(1) %61, align 4, !invariant.load !46
  %divide.35 = fdiv float %60, %62
  %63 = getelementptr inbounds float, ptr addrspace(1) %arg1023, i64 %5
  store float %divide.22, ptr addrspace(1) %63, align 4
  %64 = getelementptr inbounds float, ptr addrspace(1) %arg1125, i64 %5
  store float %divide.35, ptr addrspace(1) %64, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @slice_30(ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(2949120) %arg1) local_unnamed_addr #2 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !61
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index3.frozen = freeze i32 %linear_index3
  %4 = udiv i32 %linear_index3.frozen, 90
  %5 = mul i32 %4, 90
  %.decomposed = sub i32 %linear_index3.frozen, %5
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index2.frozen = freeze i32 %linear_index2
  %6 = udiv i32 %linear_index2.frozen, 90
  %7 = mul i32 %6, 90
  %.decomposed1 = sub i32 %linear_index2.frozen, %7
  %linear_index1 = or i32 %linear_index_base, 1
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %8 = udiv i32 %linear_index_base.frozen, 90
  %9 = urem i32 %linear_index1, 90
  %10 = mul i32 %8, 90
  %.decomposed2 = sub i32 %linear_index_base.frozen, %10
  %11 = or i32 %.decomposed2, 512
  %12 = zext i32 %8 to i64
  %13 = zext i32 %11 to i64
  %14 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg03, i64 0, i64 %12, i64 %13
  %15 = load float, ptr addrspace(1) %14, align 4, !invariant.load !46
  %16 = zext i32 %linear_index_base to i64
  %17 = getelementptr float, ptr addrspace(1) %arg15, i64 %16
  %18 = zext i32 %9 to i64
  %19 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg03, i64 0, i64 %12, i64 %18
  %20 = getelementptr inbounds float, ptr addrspace(1) %19, i64 512
  %21 = load float, ptr addrspace(1) %20, align 4, !invariant.load !46
  %22 = or i32 %.decomposed1, 512
  %23 = zext i32 %6 to i64
  %24 = zext i32 %22 to i64
  %25 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg03, i64 0, i64 %23, i64 %24
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !46
  %27 = or i32 %.decomposed, 512
  %28 = zext i32 %4 to i64
  %29 = zext i32 %27 to i64
  %30 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg03, i64 0, i64 %28, i64 %29
  %31 = load float, ptr addrspace(1) %30, align 4, !invariant.load !46
  %32 = insertelement <4 x float> poison, float %15, i32 0
  %33 = insertelement <4 x float> %32, float %21, i32 1
  %34 = insertelement <4 x float> %33, float %26, i32 2
  %35 = insertelement <4 x float> %34, float %31, i32 3
  store <4 x float> %35, ptr addrspace(1) %17, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_41(ptr noalias nocapture readonly align 16 dereferenceable(360) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2949120) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(491520) %arg4) local_unnamed_addr #2 {
entry:
  %arg470 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg368 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg266 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg164 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg062 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !62
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 15
  %5 = mul i32 %4, 15
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %linear_index1.frozen = freeze i32 %linear_index1
  %6 = udiv i32 %linear_index1.frozen, 15
  %7 = mul i32 %6, 15
  %.decomposed59 = sub i32 %linear_index1.frozen, %7
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index2.frozen = freeze i32 %linear_index2
  %8 = udiv i32 %linear_index2.frozen, 15
  %9 = mul i32 %8, 15
  %.decomposed60 = sub i32 %linear_index2.frozen, %9
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index3.frozen = freeze i32 %linear_index3
  %10 = udiv i32 %linear_index3.frozen, 15
  %11 = mul i32 %10, 15
  %.decomposed61 = sub i32 %linear_index3.frozen, %11
  %12 = mul nuw nsw i32 %.decomposed, 6
  %13 = zext i32 %4 to i64
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg266, i64 0, i64 %13, i64 %14
  %16 = load <2 x float>, ptr addrspace(1) %15, align 8, !invariant.load !46
  %17 = extractelement <2 x float> %16, i32 0
  %18 = extractelement <2 x float> %16, i32 1
  %19 = or i32 %12, 512
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg368, i64 0, i64 %13, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 8, !invariant.load !46
  %add.6 = fadd float %17, %22
  %23 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg164, i64 0, i64 %13, i64 %14
  %24 = getelementptr inbounds float, ptr addrspace(1) %23, i64 524
  %25 = load <2 x float>, ptr addrspace(1) %24, align 8, !invariant.load !46
  %26 = extractelement <2 x float> %25, i32 0
  %27 = extractelement <2 x float> %25, i32 1
  %add.8 = fadd float %add.6, %26
  %28 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg062, i64 0, i64 %14
  %29 = load <2 x float>, ptr addrspace(1) %28, align 8, !invariant.load !46
  %30 = extractelement <2 x float> %29, i32 0
  %31 = extractelement <2 x float> %29, i32 1
  %add.10 = fadd float %add.8, %30
  %32 = fcmp ole float %add.10, 0xFFF0000000000000
  %maximum.16.i = select i1 %32, float 0xFFF0000000000000, float %add.10
  %33 = or i32 %12, 513
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg368, i64 0, i64 %13, i64 %34
  %36 = load float, ptr addrspace(1) %35, align 4, !invariant.load !46
  %add.6.1 = fadd float %18, %36
  %add.8.1 = fadd float %add.6.1, %27
  %add.10.1 = fadd float %add.8.1, %31
  %37 = fcmp oge float %maximum.16.i, %add.10.1
  %38 = fcmp uno float %maximum.16.i, 0.000000e+00
  %39 = or i1 %38, %37
  %maximum.16.i.1 = select i1 %39, float %maximum.16.i, float %add.10.1
  %40 = getelementptr inbounds float, ptr addrspace(1) %15, i64 2
  %41 = load <2 x float>, ptr addrspace(1) %40, align 8, !invariant.load !46
  %42 = extractelement <2 x float> %41, i32 0
  %43 = extractelement <2 x float> %41, i32 1
  %44 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg368, i64 0, i64 %13, i64 %14
  %45 = getelementptr inbounds float, ptr addrspace(1) %44, i64 514
  %46 = load <2 x float>, ptr addrspace(1) %45, align 8, !invariant.load !46
  %47 = extractelement <2 x float> %46, i32 0
  %48 = extractelement <2 x float> %46, i32 1
  %add.6.2 = fadd float %42, %47
  %49 = getelementptr inbounds float, ptr addrspace(1) %23, i64 526
  %50 = load <2 x float>, ptr addrspace(1) %49, align 8, !invariant.load !46
  %51 = extractelement <2 x float> %50, i32 0
  %52 = extractelement <2 x float> %50, i32 1
  %add.8.2 = fadd float %add.6.2, %51
  %53 = getelementptr inbounds float, ptr addrspace(1) %28, i64 2
  %54 = load <2 x float>, ptr addrspace(1) %53, align 8, !invariant.load !46
  %55 = extractelement <2 x float> %54, i32 0
  %56 = extractelement <2 x float> %54, i32 1
  %add.10.2 = fadd float %add.8.2, %55
  %57 = fcmp oge float %maximum.16.i.1, %add.10.2
  %58 = fcmp uno float %maximum.16.i.1, 0.000000e+00
  %59 = or i1 %58, %57
  %maximum.16.i.2 = select i1 %59, float %maximum.16.i.1, float %add.10.2
  %add.6.3 = fadd float %43, %48
  %add.8.3 = fadd float %add.6.3, %52
  %add.10.3 = fadd float %add.8.3, %56
  %60 = fcmp oge float %maximum.16.i.2, %add.10.3
  %61 = fcmp uno float %maximum.16.i.2, 0.000000e+00
  %62 = or i1 %61, %60
  %maximum.16.i.3 = select i1 %62, float %maximum.16.i.2, float %add.10.3
  %63 = getelementptr inbounds float, ptr addrspace(1) %15, i64 4
  %64 = load <2 x float>, ptr addrspace(1) %63, align 8, !invariant.load !46
  %65 = extractelement <2 x float> %64, i32 0
  %66 = extractelement <2 x float> %64, i32 1
  %67 = getelementptr inbounds float, ptr addrspace(1) %44, i64 516
  %68 = load <2 x float>, ptr addrspace(1) %67, align 8, !invariant.load !46
  %69 = extractelement <2 x float> %68, i32 0
  %70 = extractelement <2 x float> %68, i32 1
  %add.6.4 = fadd float %65, %69
  %71 = getelementptr inbounds float, ptr addrspace(1) %23, i64 528
  %72 = load <2 x float>, ptr addrspace(1) %71, align 8, !invariant.load !46
  %73 = extractelement <2 x float> %72, i32 0
  %74 = extractelement <2 x float> %72, i32 1
  %add.8.4 = fadd float %add.6.4, %73
  %75 = getelementptr inbounds float, ptr addrspace(1) %28, i64 4
  %76 = load <2 x float>, ptr addrspace(1) %75, align 8, !invariant.load !46
  %77 = extractelement <2 x float> %76, i32 0
  %78 = extractelement <2 x float> %76, i32 1
  %add.10.4 = fadd float %add.8.4, %77
  %79 = fcmp oge float %maximum.16.i.3, %add.10.4
  %80 = fcmp uno float %maximum.16.i.3, 0.000000e+00
  %81 = or i1 %80, %79
  %maximum.16.i.4 = select i1 %81, float %maximum.16.i.3, float %add.10.4
  %add.6.5 = fadd float %66, %70
  %add.8.5 = fadd float %add.6.5, %74
  %add.10.5 = fadd float %add.8.5, %78
  %82 = fcmp oge float %maximum.16.i.4, %add.10.5
  %83 = fcmp uno float %maximum.16.i.4, 0.000000e+00
  %84 = or i1 %83, %82
  %maximum.16.i.5 = select i1 %84, float %maximum.16.i.4, float %add.10.5
  %85 = zext i32 %linear_index_base to i64
  %86 = getelementptr float, ptr addrspace(1) %arg470, i64 %85
  %87 = mul nuw nsw i32 %.decomposed59, 6
  %88 = zext i32 %6 to i64
  %89 = zext i32 %87 to i64
  %90 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg266, i64 0, i64 %88, i64 %89
  %91 = load <2 x float>, ptr addrspace(1) %90, align 8, !invariant.load !46
  %92 = extractelement <2 x float> %91, i32 0
  %93 = extractelement <2 x float> %91, i32 1
  %94 = or i32 %87, 512
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg368, i64 0, i64 %88, i64 %95
  %97 = load float, ptr addrspace(1) %96, align 8, !invariant.load !46
  %add.610 = fadd float %92, %97
  %98 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg164, i64 0, i64 %88, i64 %89
  %99 = getelementptr inbounds float, ptr addrspace(1) %98, i64 524
  %100 = load <2 x float>, ptr addrspace(1) %99, align 8, !invariant.load !46
  %101 = extractelement <2 x float> %100, i32 0
  %102 = extractelement <2 x float> %100, i32 1
  %add.811 = fadd float %add.610, %101
  %103 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg062, i64 0, i64 %89
  %104 = load <2 x float>, ptr addrspace(1) %103, align 8, !invariant.load !46
  %105 = extractelement <2 x float> %104, i32 0
  %106 = extractelement <2 x float> %104, i32 1
  %add.1012 = fadd float %add.811, %105
  %107 = fcmp ole float %add.1012, 0xFFF0000000000000
  %maximum.16.i48 = select i1 %107, float 0xFFF0000000000000, float %add.1012
  %108 = or i32 %87, 513
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg368, i64 0, i64 %88, i64 %109
  %111 = load float, ptr addrspace(1) %110, align 4, !invariant.load !46
  %add.610.1 = fadd float %93, %111
  %add.811.1 = fadd float %add.610.1, %102
  %add.1012.1 = fadd float %add.811.1, %106
  %112 = fcmp oge float %maximum.16.i48, %add.1012.1
  %113 = fcmp uno float %maximum.16.i48, 0.000000e+00
  %114 = or i1 %113, %112
  %maximum.16.i48.1 = select i1 %114, float %maximum.16.i48, float %add.1012.1
  %115 = getelementptr inbounds float, ptr addrspace(1) %90, i64 2
  %116 = load <2 x float>, ptr addrspace(1) %115, align 8, !invariant.load !46
  %117 = extractelement <2 x float> %116, i32 0
  %118 = extractelement <2 x float> %116, i32 1
  %119 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg368, i64 0, i64 %88, i64 %89
  %120 = getelementptr inbounds float, ptr addrspace(1) %119, i64 514
  %121 = load <2 x float>, ptr addrspace(1) %120, align 8, !invariant.load !46
  %122 = extractelement <2 x float> %121, i32 0
  %123 = extractelement <2 x float> %121, i32 1
  %add.610.2 = fadd float %117, %122
  %124 = getelementptr inbounds float, ptr addrspace(1) %98, i64 526
  %125 = load <2 x float>, ptr addrspace(1) %124, align 8, !invariant.load !46
  %126 = extractelement <2 x float> %125, i32 0
  %127 = extractelement <2 x float> %125, i32 1
  %add.811.2 = fadd float %add.610.2, %126
  %128 = getelementptr inbounds float, ptr addrspace(1) %103, i64 2
  %129 = load <2 x float>, ptr addrspace(1) %128, align 8, !invariant.load !46
  %130 = extractelement <2 x float> %129, i32 0
  %131 = extractelement <2 x float> %129, i32 1
  %add.1012.2 = fadd float %add.811.2, %130
  %132 = fcmp oge float %maximum.16.i48.1, %add.1012.2
  %133 = fcmp uno float %maximum.16.i48.1, 0.000000e+00
  %134 = or i1 %133, %132
  %maximum.16.i48.2 = select i1 %134, float %maximum.16.i48.1, float %add.1012.2
  %add.610.3 = fadd float %118, %123
  %add.811.3 = fadd float %add.610.3, %127
  %add.1012.3 = fadd float %add.811.3, %131
  %135 = fcmp oge float %maximum.16.i48.2, %add.1012.3
  %136 = fcmp uno float %maximum.16.i48.2, 0.000000e+00
  %137 = or i1 %136, %135
  %maximum.16.i48.3 = select i1 %137, float %maximum.16.i48.2, float %add.1012.3
  %138 = getelementptr inbounds float, ptr addrspace(1) %90, i64 4
  %139 = load <2 x float>, ptr addrspace(1) %138, align 8, !invariant.load !46
  %140 = extractelement <2 x float> %139, i32 0
  %141 = extractelement <2 x float> %139, i32 1
  %142 = getelementptr inbounds float, ptr addrspace(1) %119, i64 516
  %143 = load <2 x float>, ptr addrspace(1) %142, align 8, !invariant.load !46
  %144 = extractelement <2 x float> %143, i32 0
  %145 = extractelement <2 x float> %143, i32 1
  %add.610.4 = fadd float %140, %144
  %146 = getelementptr inbounds float, ptr addrspace(1) %98, i64 528
  %147 = load <2 x float>, ptr addrspace(1) %146, align 8, !invariant.load !46
  %148 = extractelement <2 x float> %147, i32 0
  %149 = extractelement <2 x float> %147, i32 1
  %add.811.4 = fadd float %add.610.4, %148
  %150 = getelementptr inbounds float, ptr addrspace(1) %103, i64 4
  %151 = load <2 x float>, ptr addrspace(1) %150, align 8, !invariant.load !46
  %152 = extractelement <2 x float> %151, i32 0
  %153 = extractelement <2 x float> %151, i32 1
  %add.1012.4 = fadd float %add.811.4, %152
  %154 = fcmp oge float %maximum.16.i48.3, %add.1012.4
  %155 = fcmp uno float %maximum.16.i48.3, 0.000000e+00
  %156 = or i1 %155, %154
  %maximum.16.i48.4 = select i1 %156, float %maximum.16.i48.3, float %add.1012.4
  %add.610.5 = fadd float %141, %145
  %add.811.5 = fadd float %add.610.5, %149
  %add.1012.5 = fadd float %add.811.5, %153
  %157 = fcmp oge float %maximum.16.i48.4, %add.1012.5
  %158 = fcmp uno float %maximum.16.i48.4, 0.000000e+00
  %159 = or i1 %158, %157
  %maximum.16.i48.5 = select i1 %159, float %maximum.16.i48.4, float %add.1012.5
  %160 = mul nuw nsw i32 %.decomposed60, 6
  %161 = zext i32 %8 to i64
  %162 = zext i32 %160 to i64
  %163 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg266, i64 0, i64 %161, i64 %162
  %164 = load <2 x float>, ptr addrspace(1) %163, align 8, !invariant.load !46
  %165 = extractelement <2 x float> %164, i32 0
  %166 = extractelement <2 x float> %164, i32 1
  %167 = or i32 %160, 512
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg368, i64 0, i64 %161, i64 %168
  %170 = load float, ptr addrspace(1) %169, align 8, !invariant.load !46
  %add.624 = fadd float %165, %170
  %171 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg164, i64 0, i64 %161, i64 %162
  %172 = getelementptr inbounds float, ptr addrspace(1) %171, i64 524
  %173 = load <2 x float>, ptr addrspace(1) %172, align 8, !invariant.load !46
  %174 = extractelement <2 x float> %173, i32 0
  %175 = extractelement <2 x float> %173, i32 1
  %add.825 = fadd float %add.624, %174
  %176 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg062, i64 0, i64 %162
  %177 = load <2 x float>, ptr addrspace(1) %176, align 8, !invariant.load !46
  %178 = extractelement <2 x float> %177, i32 0
  %179 = extractelement <2 x float> %177, i32 1
  %add.1026 = fadd float %add.825, %178
  %180 = fcmp ole float %add.1026, 0xFFF0000000000000
  %maximum.16.i49 = select i1 %180, float 0xFFF0000000000000, float %add.1026
  %181 = or i32 %160, 513
  %182 = zext i32 %181 to i64
  %183 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg368, i64 0, i64 %161, i64 %182
  %184 = load float, ptr addrspace(1) %183, align 4, !invariant.load !46
  %add.624.1 = fadd float %166, %184
  %add.825.1 = fadd float %add.624.1, %175
  %add.1026.1 = fadd float %add.825.1, %179
  %185 = fcmp oge float %maximum.16.i49, %add.1026.1
  %186 = fcmp uno float %maximum.16.i49, 0.000000e+00
  %187 = or i1 %186, %185
  %maximum.16.i49.1 = select i1 %187, float %maximum.16.i49, float %add.1026.1
  %188 = getelementptr inbounds float, ptr addrspace(1) %163, i64 2
  %189 = load <2 x float>, ptr addrspace(1) %188, align 8, !invariant.load !46
  %190 = extractelement <2 x float> %189, i32 0
  %191 = extractelement <2 x float> %189, i32 1
  %192 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg368, i64 0, i64 %161, i64 %162
  %193 = getelementptr inbounds float, ptr addrspace(1) %192, i64 514
  %194 = load <2 x float>, ptr addrspace(1) %193, align 8, !invariant.load !46
  %195 = extractelement <2 x float> %194, i32 0
  %196 = extractelement <2 x float> %194, i32 1
  %add.624.2 = fadd float %190, %195
  %197 = getelementptr inbounds float, ptr addrspace(1) %171, i64 526
  %198 = load <2 x float>, ptr addrspace(1) %197, align 8, !invariant.load !46
  %199 = extractelement <2 x float> %198, i32 0
  %200 = extractelement <2 x float> %198, i32 1
  %add.825.2 = fadd float %add.624.2, %199
  %201 = getelementptr inbounds float, ptr addrspace(1) %176, i64 2
  %202 = load <2 x float>, ptr addrspace(1) %201, align 8, !invariant.load !46
  %203 = extractelement <2 x float> %202, i32 0
  %204 = extractelement <2 x float> %202, i32 1
  %add.1026.2 = fadd float %add.825.2, %203
  %205 = fcmp oge float %maximum.16.i49.1, %add.1026.2
  %206 = fcmp uno float %maximum.16.i49.1, 0.000000e+00
  %207 = or i1 %206, %205
  %maximum.16.i49.2 = select i1 %207, float %maximum.16.i49.1, float %add.1026.2
  %add.624.3 = fadd float %191, %196
  %add.825.3 = fadd float %add.624.3, %200
  %add.1026.3 = fadd float %add.825.3, %204
  %208 = fcmp oge float %maximum.16.i49.2, %add.1026.3
  %209 = fcmp uno float %maximum.16.i49.2, 0.000000e+00
  %210 = or i1 %209, %208
  %maximum.16.i49.3 = select i1 %210, float %maximum.16.i49.2, float %add.1026.3
  %211 = getelementptr inbounds float, ptr addrspace(1) %163, i64 4
  %212 = load <2 x float>, ptr addrspace(1) %211, align 8, !invariant.load !46
  %213 = extractelement <2 x float> %212, i32 0
  %214 = extractelement <2 x float> %212, i32 1
  %215 = getelementptr inbounds float, ptr addrspace(1) %192, i64 516
  %216 = load <2 x float>, ptr addrspace(1) %215, align 8, !invariant.load !46
  %217 = extractelement <2 x float> %216, i32 0
  %218 = extractelement <2 x float> %216, i32 1
  %add.624.4 = fadd float %213, %217
  %219 = getelementptr inbounds float, ptr addrspace(1) %171, i64 528
  %220 = load <2 x float>, ptr addrspace(1) %219, align 8, !invariant.load !46
  %221 = extractelement <2 x float> %220, i32 0
  %222 = extractelement <2 x float> %220, i32 1
  %add.825.4 = fadd float %add.624.4, %221
  %223 = getelementptr inbounds float, ptr addrspace(1) %176, i64 4
  %224 = load <2 x float>, ptr addrspace(1) %223, align 8, !invariant.load !46
  %225 = extractelement <2 x float> %224, i32 0
  %226 = extractelement <2 x float> %224, i32 1
  %add.1026.4 = fadd float %add.825.4, %225
  %227 = fcmp oge float %maximum.16.i49.3, %add.1026.4
  %228 = fcmp uno float %maximum.16.i49.3, 0.000000e+00
  %229 = or i1 %228, %227
  %maximum.16.i49.4 = select i1 %229, float %maximum.16.i49.3, float %add.1026.4
  %add.624.5 = fadd float %214, %218
  %add.825.5 = fadd float %add.624.5, %222
  %add.1026.5 = fadd float %add.825.5, %226
  %230 = fcmp oge float %maximum.16.i49.4, %add.1026.5
  %231 = fcmp uno float %maximum.16.i49.4, 0.000000e+00
  %232 = or i1 %231, %230
  %maximum.16.i49.5 = select i1 %232, float %maximum.16.i49.4, float %add.1026.5
  %233 = mul nuw nsw i32 %.decomposed61, 6
  %234 = zext i32 %10 to i64
  %235 = zext i32 %233 to i64
  %236 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg266, i64 0, i64 %234, i64 %235
  %237 = load <2 x float>, ptr addrspace(1) %236, align 8, !invariant.load !46
  %238 = extractelement <2 x float> %237, i32 0
  %239 = extractelement <2 x float> %237, i32 1
  %240 = or i32 %233, 512
  %241 = zext i32 %240 to i64
  %242 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg368, i64 0, i64 %234, i64 %241
  %243 = load float, ptr addrspace(1) %242, align 8, !invariant.load !46
  %add.638 = fadd float %238, %243
  %244 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg164, i64 0, i64 %234, i64 %235
  %245 = getelementptr inbounds float, ptr addrspace(1) %244, i64 524
  %246 = load <2 x float>, ptr addrspace(1) %245, align 8, !invariant.load !46
  %247 = extractelement <2 x float> %246, i32 0
  %248 = extractelement <2 x float> %246, i32 1
  %add.839 = fadd float %add.638, %247
  %249 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg062, i64 0, i64 %235
  %250 = load <2 x float>, ptr addrspace(1) %249, align 8, !invariant.load !46
  %251 = extractelement <2 x float> %250, i32 0
  %252 = extractelement <2 x float> %250, i32 1
  %add.1040 = fadd float %add.839, %251
  %253 = fcmp ole float %add.1040, 0xFFF0000000000000
  %maximum.16.i50 = select i1 %253, float 0xFFF0000000000000, float %add.1040
  %254 = or i32 %233, 513
  %255 = zext i32 %254 to i64
  %256 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg368, i64 0, i64 %234, i64 %255
  %257 = load float, ptr addrspace(1) %256, align 4, !invariant.load !46
  %add.638.1 = fadd float %239, %257
  %add.839.1 = fadd float %add.638.1, %248
  %add.1040.1 = fadd float %add.839.1, %252
  %258 = fcmp oge float %maximum.16.i50, %add.1040.1
  %259 = fcmp uno float %maximum.16.i50, 0.000000e+00
  %260 = or i1 %259, %258
  %maximum.16.i50.1 = select i1 %260, float %maximum.16.i50, float %add.1040.1
  %261 = getelementptr inbounds float, ptr addrspace(1) %236, i64 2
  %262 = load <2 x float>, ptr addrspace(1) %261, align 8, !invariant.load !46
  %263 = extractelement <2 x float> %262, i32 0
  %264 = extractelement <2 x float> %262, i32 1
  %265 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg368, i64 0, i64 %234, i64 %235
  %266 = getelementptr inbounds float, ptr addrspace(1) %265, i64 514
  %267 = load <2 x float>, ptr addrspace(1) %266, align 8, !invariant.load !46
  %268 = extractelement <2 x float> %267, i32 0
  %269 = extractelement <2 x float> %267, i32 1
  %add.638.2 = fadd float %263, %268
  %270 = getelementptr inbounds float, ptr addrspace(1) %244, i64 526
  %271 = load <2 x float>, ptr addrspace(1) %270, align 8, !invariant.load !46
  %272 = extractelement <2 x float> %271, i32 0
  %273 = extractelement <2 x float> %271, i32 1
  %add.839.2 = fadd float %add.638.2, %272
  %274 = getelementptr inbounds float, ptr addrspace(1) %249, i64 2
  %275 = load <2 x float>, ptr addrspace(1) %274, align 8, !invariant.load !46
  %276 = extractelement <2 x float> %275, i32 0
  %277 = extractelement <2 x float> %275, i32 1
  %add.1040.2 = fadd float %add.839.2, %276
  %278 = fcmp oge float %maximum.16.i50.1, %add.1040.2
  %279 = fcmp uno float %maximum.16.i50.1, 0.000000e+00
  %280 = or i1 %279, %278
  %maximum.16.i50.2 = select i1 %280, float %maximum.16.i50.1, float %add.1040.2
  %add.638.3 = fadd float %264, %269
  %add.839.3 = fadd float %add.638.3, %273
  %add.1040.3 = fadd float %add.839.3, %277
  %281 = fcmp oge float %maximum.16.i50.2, %add.1040.3
  %282 = fcmp uno float %maximum.16.i50.2, 0.000000e+00
  %283 = or i1 %282, %281
  %maximum.16.i50.3 = select i1 %283, float %maximum.16.i50.2, float %add.1040.3
  %284 = getelementptr inbounds float, ptr addrspace(1) %236, i64 4
  %285 = load <2 x float>, ptr addrspace(1) %284, align 8, !invariant.load !46
  %286 = extractelement <2 x float> %285, i32 0
  %287 = extractelement <2 x float> %285, i32 1
  %288 = getelementptr inbounds float, ptr addrspace(1) %265, i64 516
  %289 = load <2 x float>, ptr addrspace(1) %288, align 8, !invariant.load !46
  %290 = extractelement <2 x float> %289, i32 0
  %291 = extractelement <2 x float> %289, i32 1
  %add.638.4 = fadd float %286, %290
  %292 = getelementptr inbounds float, ptr addrspace(1) %244, i64 528
  %293 = load <2 x float>, ptr addrspace(1) %292, align 8, !invariant.load !46
  %294 = extractelement <2 x float> %293, i32 0
  %295 = extractelement <2 x float> %293, i32 1
  %add.839.4 = fadd float %add.638.4, %294
  %296 = getelementptr inbounds float, ptr addrspace(1) %249, i64 4
  %297 = load <2 x float>, ptr addrspace(1) %296, align 8, !invariant.load !46
  %298 = extractelement <2 x float> %297, i32 0
  %299 = extractelement <2 x float> %297, i32 1
  %add.1040.4 = fadd float %add.839.4, %298
  %300 = fcmp oge float %maximum.16.i50.3, %add.1040.4
  %301 = fcmp uno float %maximum.16.i50.3, 0.000000e+00
  %302 = or i1 %301, %300
  %maximum.16.i50.4 = select i1 %302, float %maximum.16.i50.3, float %add.1040.4
  %add.638.5 = fadd float %287, %291
  %add.839.5 = fadd float %add.638.5, %295
  %add.1040.5 = fadd float %add.839.5, %299
  %303 = fcmp oge float %maximum.16.i50.4, %add.1040.5
  %304 = fcmp uno float %maximum.16.i50.4, 0.000000e+00
  %305 = or i1 %304, %303
  %maximum.16.i50.5 = select i1 %305, float %maximum.16.i50.4, float %add.1040.5
  %306 = insertelement <4 x float> poison, float %maximum.16.i.5, i32 0
  %307 = insertelement <4 x float> %306, float %maximum.16.i48.5, i32 1
  %308 = insertelement <4 x float> %307, float %maximum.16.i49.5, i32 2
  %309 = insertelement <4 x float> %308, float %maximum.16.i50.5, i32 3
  store <4 x float> %309, ptr addrspace(1) %86, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_42(ptr noalias nocapture readonly align 128 dereferenceable(491520) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(360) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(2949120) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(491520) %arg5) local_unnamed_addr #2 {
entry:
  %arg575 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg473 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg371 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg269 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg167 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg065 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !62
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 15
  %5 = mul i32 %4, 15
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %linear_index1.frozen = freeze i32 %linear_index1
  %6 = udiv i32 %linear_index1.frozen, 15
  %7 = mul i32 %6, 15
  %.decomposed62 = sub i32 %linear_index1.frozen, %7
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index2.frozen = freeze i32 %linear_index2
  %8 = udiv i32 %linear_index2.frozen, 15
  %9 = mul i32 %8, 15
  %.decomposed63 = sub i32 %linear_index2.frozen, %9
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index3.frozen = freeze i32 %linear_index3
  %10 = udiv i32 %linear_index3.frozen, 15
  %11 = mul i32 %10, 15
  %.decomposed64 = sub i32 %linear_index3.frozen, %11
  %12 = mul nuw nsw i32 %.decomposed, 6
  %13 = zext i32 %4 to i64
  %14 = zext i32 %.decomposed to i64
  %15 = getelementptr inbounds [8192 x [15 x float]], ptr addrspace(1) %arg065, i64 0, i64 %13, i64 %14
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !46
  %17 = zext i32 %12 to i64
  %18 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg371, i64 0, i64 %13, i64 %17
  %19 = load <2 x float>, ptr addrspace(1) %18, align 8, !invariant.load !46
  %20 = extractelement <2 x float> %19, i32 0
  %21 = extractelement <2 x float> %19, i32 1
  %22 = or i32 %12, 512
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg473, i64 0, i64 %13, i64 %23
  %25 = load float, ptr addrspace(1) %24, align 8, !invariant.load !46
  %add.7 = fadd float %20, %25
  %26 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg269, i64 0, i64 %13, i64 %17
  %27 = getelementptr inbounds float, ptr addrspace(1) %26, i64 524
  %28 = load <2 x float>, ptr addrspace(1) %27, align 8, !invariant.load !46
  %29 = extractelement <2 x float> %28, i32 0
  %30 = extractelement <2 x float> %28, i32 1
  %add.9 = fadd float %add.7, %29
  %31 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg167, i64 0, i64 %17
  %32 = load <2 x float>, ptr addrspace(1) %31, align 8, !invariant.load !46
  %33 = extractelement <2 x float> %32, i32 0
  %34 = extractelement <2 x float> %32, i32 1
  %add.11 = fadd float %add.9, %33
  %subtract.14 = fsub float %add.11, %16
  %35 = tail call float @llvm.fma.f32(float %subtract.14, float 0x3F777313A0000000, float 5.000000e-01)
  %36 = tail call float @llvm.nvvm.saturate.f(float %35) #6
  %37 = tail call float @llvm.nvvm.fma.rm.f(float %36, float 2.520000e+02, float 0x4168000020000000) #6
  %38 = fadd float %37, 0xC168000FE0000000
  %39 = fneg float %38
  %40 = tail call float @llvm.fma.f32(float %subtract.14, float 0x3FF7154760000000, float %39)
  %41 = tail call float @llvm.fma.f32(float %subtract.14, float 0x3E54AE0C00000000, float %40)
  %42 = bitcast float %37 to i32
  %43 = shl i32 %42, 23
  %44 = bitcast i32 %43 to float
  %45 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %41) #6
  %46 = fmul float %45, %44
  %47 = or i32 %12, 513
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg473, i64 0, i64 %13, i64 %48
  %50 = load float, ptr addrspace(1) %49, align 4, !invariant.load !46
  %add.7.1 = fadd float %21, %50
  %add.9.1 = fadd float %add.7.1, %30
  %add.11.1 = fadd float %add.9.1, %34
  %subtract.14.1 = fsub float %add.11.1, %16
  %51 = tail call float @llvm.fma.f32(float %subtract.14.1, float 0x3F777313A0000000, float 5.000000e-01)
  %52 = tail call float @llvm.nvvm.saturate.f(float %51) #6
  %53 = tail call float @llvm.nvvm.fma.rm.f(float %52, float 2.520000e+02, float 0x4168000020000000) #6
  %54 = fadd float %53, 0xC168000FE0000000
  %55 = fneg float %54
  %56 = tail call float @llvm.fma.f32(float %subtract.14.1, float 0x3FF7154760000000, float %55)
  %57 = tail call float @llvm.fma.f32(float %subtract.14.1, float 0x3E54AE0C00000000, float %56)
  %58 = bitcast float %53 to i32
  %59 = shl i32 %58, 23
  %60 = bitcast i32 %59 to float
  %61 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %57) #6
  %62 = fmul float %61, %60
  %add.20.i.1 = fadd float %46, %62
  %63 = getelementptr inbounds float, ptr addrspace(1) %18, i64 2
  %64 = load <2 x float>, ptr addrspace(1) %63, align 8, !invariant.load !46
  %65 = extractelement <2 x float> %64, i32 0
  %66 = extractelement <2 x float> %64, i32 1
  %67 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg473, i64 0, i64 %13, i64 %17
  %68 = getelementptr inbounds float, ptr addrspace(1) %67, i64 514
  %69 = load <2 x float>, ptr addrspace(1) %68, align 8, !invariant.load !46
  %70 = extractelement <2 x float> %69, i32 0
  %71 = extractelement <2 x float> %69, i32 1
  %add.7.2 = fadd float %65, %70
  %72 = getelementptr inbounds float, ptr addrspace(1) %26, i64 526
  %73 = load <2 x float>, ptr addrspace(1) %72, align 8, !invariant.load !46
  %74 = extractelement <2 x float> %73, i32 0
  %75 = extractelement <2 x float> %73, i32 1
  %add.9.2 = fadd float %add.7.2, %74
  %76 = getelementptr inbounds float, ptr addrspace(1) %31, i64 2
  %77 = load <2 x float>, ptr addrspace(1) %76, align 8, !invariant.load !46
  %78 = extractelement <2 x float> %77, i32 0
  %79 = extractelement <2 x float> %77, i32 1
  %add.11.2 = fadd float %add.9.2, %78
  %subtract.14.2 = fsub float %add.11.2, %16
  %80 = tail call float @llvm.fma.f32(float %subtract.14.2, float 0x3F777313A0000000, float 5.000000e-01)
  %81 = tail call float @llvm.nvvm.saturate.f(float %80) #6
  %82 = tail call float @llvm.nvvm.fma.rm.f(float %81, float 2.520000e+02, float 0x4168000020000000) #6
  %83 = fadd float %82, 0xC168000FE0000000
  %84 = fneg float %83
  %85 = tail call float @llvm.fma.f32(float %subtract.14.2, float 0x3FF7154760000000, float %84)
  %86 = tail call float @llvm.fma.f32(float %subtract.14.2, float 0x3E54AE0C00000000, float %85)
  %87 = bitcast float %82 to i32
  %88 = shl i32 %87, 23
  %89 = bitcast i32 %88 to float
  %90 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %86) #6
  %91 = fmul float %90, %89
  %add.20.i.2 = fadd float %add.20.i.1, %91
  %add.7.3 = fadd float %66, %71
  %add.9.3 = fadd float %add.7.3, %75
  %add.11.3 = fadd float %add.9.3, %79
  %subtract.14.3 = fsub float %add.11.3, %16
  %92 = tail call float @llvm.fma.f32(float %subtract.14.3, float 0x3F777313A0000000, float 5.000000e-01)
  %93 = tail call float @llvm.nvvm.saturate.f(float %92) #6
  %94 = tail call float @llvm.nvvm.fma.rm.f(float %93, float 2.520000e+02, float 0x4168000020000000) #6
  %95 = fadd float %94, 0xC168000FE0000000
  %96 = fneg float %95
  %97 = tail call float @llvm.fma.f32(float %subtract.14.3, float 0x3FF7154760000000, float %96)
  %98 = tail call float @llvm.fma.f32(float %subtract.14.3, float 0x3E54AE0C00000000, float %97)
  %99 = bitcast float %94 to i32
  %100 = shl i32 %99, 23
  %101 = bitcast i32 %100 to float
  %102 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %98) #6
  %103 = fmul float %102, %101
  %add.20.i.3 = fadd float %add.20.i.2, %103
  %104 = getelementptr inbounds float, ptr addrspace(1) %18, i64 4
  %105 = load <2 x float>, ptr addrspace(1) %104, align 8, !invariant.load !46
  %106 = extractelement <2 x float> %105, i32 0
  %107 = extractelement <2 x float> %105, i32 1
  %108 = getelementptr inbounds float, ptr addrspace(1) %67, i64 516
  %109 = load <2 x float>, ptr addrspace(1) %108, align 8, !invariant.load !46
  %110 = extractelement <2 x float> %109, i32 0
  %111 = extractelement <2 x float> %109, i32 1
  %add.7.4 = fadd float %106, %110
  %112 = getelementptr inbounds float, ptr addrspace(1) %26, i64 528
  %113 = load <2 x float>, ptr addrspace(1) %112, align 8, !invariant.load !46
  %114 = extractelement <2 x float> %113, i32 0
  %115 = extractelement <2 x float> %113, i32 1
  %add.9.4 = fadd float %add.7.4, %114
  %116 = getelementptr inbounds float, ptr addrspace(1) %31, i64 4
  %117 = load <2 x float>, ptr addrspace(1) %116, align 8, !invariant.load !46
  %118 = extractelement <2 x float> %117, i32 0
  %119 = extractelement <2 x float> %117, i32 1
  %add.11.4 = fadd float %add.9.4, %118
  %subtract.14.4 = fsub float %add.11.4, %16
  %120 = tail call float @llvm.fma.f32(float %subtract.14.4, float 0x3F777313A0000000, float 5.000000e-01)
  %121 = tail call float @llvm.nvvm.saturate.f(float %120) #6
  %122 = tail call float @llvm.nvvm.fma.rm.f(float %121, float 2.520000e+02, float 0x4168000020000000) #6
  %123 = fadd float %122, 0xC168000FE0000000
  %124 = fneg float %123
  %125 = tail call float @llvm.fma.f32(float %subtract.14.4, float 0x3FF7154760000000, float %124)
  %126 = tail call float @llvm.fma.f32(float %subtract.14.4, float 0x3E54AE0C00000000, float %125)
  %127 = bitcast float %122 to i32
  %128 = shl i32 %127, 23
  %129 = bitcast i32 %128 to float
  %130 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %126) #6
  %131 = fmul float %130, %129
  %add.20.i.4 = fadd float %add.20.i.3, %131
  %add.7.5 = fadd float %107, %111
  %add.9.5 = fadd float %add.7.5, %115
  %add.11.5 = fadd float %add.9.5, %119
  %subtract.14.5 = fsub float %add.11.5, %16
  %132 = tail call float @llvm.fma.f32(float %subtract.14.5, float 0x3F777313A0000000, float 5.000000e-01)
  %133 = tail call float @llvm.nvvm.saturate.f(float %132) #6
  %134 = tail call float @llvm.nvvm.fma.rm.f(float %133, float 2.520000e+02, float 0x4168000020000000) #6
  %135 = fadd float %134, 0xC168000FE0000000
  %136 = fneg float %135
  %137 = tail call float @llvm.fma.f32(float %subtract.14.5, float 0x3FF7154760000000, float %136)
  %138 = tail call float @llvm.fma.f32(float %subtract.14.5, float 0x3E54AE0C00000000, float %137)
  %139 = bitcast float %134 to i32
  %140 = shl i32 %139, 23
  %141 = bitcast i32 %140 to float
  %142 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %138) #6
  %143 = fmul float %142, %141
  %add.20.i.5 = fadd float %add.20.i.4, %143
  %144 = zext i32 %linear_index_base to i64
  %145 = getelementptr float, ptr addrspace(1) %arg575, i64 %144
  %146 = mul nuw nsw i32 %.decomposed62, 6
  %147 = zext i32 %6 to i64
  %148 = zext i32 %.decomposed62 to i64
  %149 = getelementptr inbounds [8192 x [15 x float]], ptr addrspace(1) %arg065, i64 0, i64 %147, i64 %148
  %150 = load float, ptr addrspace(1) %149, align 4, !invariant.load !46
  %151 = zext i32 %146 to i64
  %152 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg371, i64 0, i64 %147, i64 %151
  %153 = load <2 x float>, ptr addrspace(1) %152, align 8, !invariant.load !46
  %154 = extractelement <2 x float> %153, i32 0
  %155 = extractelement <2 x float> %153, i32 1
  %156 = or i32 %146, 512
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg473, i64 0, i64 %147, i64 %157
  %159 = load float, ptr addrspace(1) %158, align 8, !invariant.load !46
  %add.710 = fadd float %154, %159
  %160 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg269, i64 0, i64 %147, i64 %151
  %161 = getelementptr inbounds float, ptr addrspace(1) %160, i64 524
  %162 = load <2 x float>, ptr addrspace(1) %161, align 8, !invariant.load !46
  %163 = extractelement <2 x float> %162, i32 0
  %164 = extractelement <2 x float> %162, i32 1
  %add.911 = fadd float %add.710, %163
  %165 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg167, i64 0, i64 %151
  %166 = load <2 x float>, ptr addrspace(1) %165, align 8, !invariant.load !46
  %167 = extractelement <2 x float> %166, i32 0
  %168 = extractelement <2 x float> %166, i32 1
  %add.1112 = fadd float %add.911, %167
  %subtract.1413 = fsub float %add.1112, %150
  %169 = tail call float @llvm.fma.f32(float %subtract.1413, float 0x3F777313A0000000, float 5.000000e-01)
  %170 = tail call float @llvm.nvvm.saturate.f(float %169) #6
  %171 = tail call float @llvm.nvvm.fma.rm.f(float %170, float 2.520000e+02, float 0x4168000020000000) #6
  %172 = fadd float %171, 0xC168000FE0000000
  %173 = fneg float %172
  %174 = tail call float @llvm.fma.f32(float %subtract.1413, float 0x3FF7154760000000, float %173)
  %175 = tail call float @llvm.fma.f32(float %subtract.1413, float 0x3E54AE0C00000000, float %174)
  %176 = bitcast float %171 to i32
  %177 = shl i32 %176, 23
  %178 = bitcast i32 %177 to float
  %179 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %175) #6
  %180 = fmul float %179, %178
  %181 = or i32 %146, 513
  %182 = zext i32 %181 to i64
  %183 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg473, i64 0, i64 %147, i64 %182
  %184 = load float, ptr addrspace(1) %183, align 4, !invariant.load !46
  %add.710.1 = fadd float %155, %184
  %add.911.1 = fadd float %add.710.1, %164
  %add.1112.1 = fadd float %add.911.1, %168
  %subtract.1413.1 = fsub float %add.1112.1, %150
  %185 = tail call float @llvm.fma.f32(float %subtract.1413.1, float 0x3F777313A0000000, float 5.000000e-01)
  %186 = tail call float @llvm.nvvm.saturate.f(float %185) #6
  %187 = tail call float @llvm.nvvm.fma.rm.f(float %186, float 2.520000e+02, float 0x4168000020000000) #6
  %188 = fadd float %187, 0xC168000FE0000000
  %189 = fneg float %188
  %190 = tail call float @llvm.fma.f32(float %subtract.1413.1, float 0x3FF7154760000000, float %189)
  %191 = tail call float @llvm.fma.f32(float %subtract.1413.1, float 0x3E54AE0C00000000, float %190)
  %192 = bitcast float %187 to i32
  %193 = shl i32 %192, 23
  %194 = bitcast i32 %193 to float
  %195 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %191) #6
  %196 = fmul float %195, %194
  %add.20.i51.1 = fadd float %180, %196
  %197 = getelementptr inbounds float, ptr addrspace(1) %152, i64 2
  %198 = load <2 x float>, ptr addrspace(1) %197, align 8, !invariant.load !46
  %199 = extractelement <2 x float> %198, i32 0
  %200 = extractelement <2 x float> %198, i32 1
  %201 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg473, i64 0, i64 %147, i64 %151
  %202 = getelementptr inbounds float, ptr addrspace(1) %201, i64 514
  %203 = load <2 x float>, ptr addrspace(1) %202, align 8, !invariant.load !46
  %204 = extractelement <2 x float> %203, i32 0
  %205 = extractelement <2 x float> %203, i32 1
  %add.710.2 = fadd float %199, %204
  %206 = getelementptr inbounds float, ptr addrspace(1) %160, i64 526
  %207 = load <2 x float>, ptr addrspace(1) %206, align 8, !invariant.load !46
  %208 = extractelement <2 x float> %207, i32 0
  %209 = extractelement <2 x float> %207, i32 1
  %add.911.2 = fadd float %add.710.2, %208
  %210 = getelementptr inbounds float, ptr addrspace(1) %165, i64 2
  %211 = load <2 x float>, ptr addrspace(1) %210, align 8, !invariant.load !46
  %212 = extractelement <2 x float> %211, i32 0
  %213 = extractelement <2 x float> %211, i32 1
  %add.1112.2 = fadd float %add.911.2, %212
  %subtract.1413.2 = fsub float %add.1112.2, %150
  %214 = tail call float @llvm.fma.f32(float %subtract.1413.2, float 0x3F777313A0000000, float 5.000000e-01)
  %215 = tail call float @llvm.nvvm.saturate.f(float %214) #6
  %216 = tail call float @llvm.nvvm.fma.rm.f(float %215, float 2.520000e+02, float 0x4168000020000000) #6
  %217 = fadd float %216, 0xC168000FE0000000
  %218 = fneg float %217
  %219 = tail call float @llvm.fma.f32(float %subtract.1413.2, float 0x3FF7154760000000, float %218)
  %220 = tail call float @llvm.fma.f32(float %subtract.1413.2, float 0x3E54AE0C00000000, float %219)
  %221 = bitcast float %216 to i32
  %222 = shl i32 %221, 23
  %223 = bitcast i32 %222 to float
  %224 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %220) #6
  %225 = fmul float %224, %223
  %add.20.i51.2 = fadd float %add.20.i51.1, %225
  %add.710.3 = fadd float %200, %205
  %add.911.3 = fadd float %add.710.3, %209
  %add.1112.3 = fadd float %add.911.3, %213
  %subtract.1413.3 = fsub float %add.1112.3, %150
  %226 = tail call float @llvm.fma.f32(float %subtract.1413.3, float 0x3F777313A0000000, float 5.000000e-01)
  %227 = tail call float @llvm.nvvm.saturate.f(float %226) #6
  %228 = tail call float @llvm.nvvm.fma.rm.f(float %227, float 2.520000e+02, float 0x4168000020000000) #6
  %229 = fadd float %228, 0xC168000FE0000000
  %230 = fneg float %229
  %231 = tail call float @llvm.fma.f32(float %subtract.1413.3, float 0x3FF7154760000000, float %230)
  %232 = tail call float @llvm.fma.f32(float %subtract.1413.3, float 0x3E54AE0C00000000, float %231)
  %233 = bitcast float %228 to i32
  %234 = shl i32 %233, 23
  %235 = bitcast i32 %234 to float
  %236 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %232) #6
  %237 = fmul float %236, %235
  %add.20.i51.3 = fadd float %add.20.i51.2, %237
  %238 = getelementptr inbounds float, ptr addrspace(1) %152, i64 4
  %239 = load <2 x float>, ptr addrspace(1) %238, align 8, !invariant.load !46
  %240 = extractelement <2 x float> %239, i32 0
  %241 = extractelement <2 x float> %239, i32 1
  %242 = getelementptr inbounds float, ptr addrspace(1) %201, i64 516
  %243 = load <2 x float>, ptr addrspace(1) %242, align 8, !invariant.load !46
  %244 = extractelement <2 x float> %243, i32 0
  %245 = extractelement <2 x float> %243, i32 1
  %add.710.4 = fadd float %240, %244
  %246 = getelementptr inbounds float, ptr addrspace(1) %160, i64 528
  %247 = load <2 x float>, ptr addrspace(1) %246, align 8, !invariant.load !46
  %248 = extractelement <2 x float> %247, i32 0
  %249 = extractelement <2 x float> %247, i32 1
  %add.911.4 = fadd float %add.710.4, %248
  %250 = getelementptr inbounds float, ptr addrspace(1) %165, i64 4
  %251 = load <2 x float>, ptr addrspace(1) %250, align 8, !invariant.load !46
  %252 = extractelement <2 x float> %251, i32 0
  %253 = extractelement <2 x float> %251, i32 1
  %add.1112.4 = fadd float %add.911.4, %252
  %subtract.1413.4 = fsub float %add.1112.4, %150
  %254 = tail call float @llvm.fma.f32(float %subtract.1413.4, float 0x3F777313A0000000, float 5.000000e-01)
  %255 = tail call float @llvm.nvvm.saturate.f(float %254) #6
  %256 = tail call float @llvm.nvvm.fma.rm.f(float %255, float 2.520000e+02, float 0x4168000020000000) #6
  %257 = fadd float %256, 0xC168000FE0000000
  %258 = fneg float %257
  %259 = tail call float @llvm.fma.f32(float %subtract.1413.4, float 0x3FF7154760000000, float %258)
  %260 = tail call float @llvm.fma.f32(float %subtract.1413.4, float 0x3E54AE0C00000000, float %259)
  %261 = bitcast float %256 to i32
  %262 = shl i32 %261, 23
  %263 = bitcast i32 %262 to float
  %264 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %260) #6
  %265 = fmul float %264, %263
  %add.20.i51.4 = fadd float %add.20.i51.3, %265
  %add.710.5 = fadd float %241, %245
  %add.911.5 = fadd float %add.710.5, %249
  %add.1112.5 = fadd float %add.911.5, %253
  %subtract.1413.5 = fsub float %add.1112.5, %150
  %266 = tail call float @llvm.fma.f32(float %subtract.1413.5, float 0x3F777313A0000000, float 5.000000e-01)
  %267 = tail call float @llvm.nvvm.saturate.f(float %266) #6
  %268 = tail call float @llvm.nvvm.fma.rm.f(float %267, float 2.520000e+02, float 0x4168000020000000) #6
  %269 = fadd float %268, 0xC168000FE0000000
  %270 = fneg float %269
  %271 = tail call float @llvm.fma.f32(float %subtract.1413.5, float 0x3FF7154760000000, float %270)
  %272 = tail call float @llvm.fma.f32(float %subtract.1413.5, float 0x3E54AE0C00000000, float %271)
  %273 = bitcast float %268 to i32
  %274 = shl i32 %273, 23
  %275 = bitcast i32 %274 to float
  %276 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %272) #6
  %277 = fmul float %276, %275
  %add.20.i51.5 = fadd float %add.20.i51.4, %277
  %278 = mul nuw nsw i32 %.decomposed63, 6
  %279 = zext i32 %8 to i64
  %280 = zext i32 %.decomposed63 to i64
  %281 = getelementptr inbounds [8192 x [15 x float]], ptr addrspace(1) %arg065, i64 0, i64 %279, i64 %280
  %282 = load float, ptr addrspace(1) %281, align 4, !invariant.load !46
  %283 = zext i32 %278 to i64
  %284 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg371, i64 0, i64 %279, i64 %283
  %285 = load <2 x float>, ptr addrspace(1) %284, align 8, !invariant.load !46
  %286 = extractelement <2 x float> %285, i32 0
  %287 = extractelement <2 x float> %285, i32 1
  %288 = or i32 %278, 512
  %289 = zext i32 %288 to i64
  %290 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg473, i64 0, i64 %279, i64 %289
  %291 = load float, ptr addrspace(1) %290, align 8, !invariant.load !46
  %add.725 = fadd float %286, %291
  %292 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg269, i64 0, i64 %279, i64 %283
  %293 = getelementptr inbounds float, ptr addrspace(1) %292, i64 524
  %294 = load <2 x float>, ptr addrspace(1) %293, align 8, !invariant.load !46
  %295 = extractelement <2 x float> %294, i32 0
  %296 = extractelement <2 x float> %294, i32 1
  %add.926 = fadd float %add.725, %295
  %297 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg167, i64 0, i64 %283
  %298 = load <2 x float>, ptr addrspace(1) %297, align 8, !invariant.load !46
  %299 = extractelement <2 x float> %298, i32 0
  %300 = extractelement <2 x float> %298, i32 1
  %add.1127 = fadd float %add.926, %299
  %subtract.1428 = fsub float %add.1127, %282
  %301 = tail call float @llvm.fma.f32(float %subtract.1428, float 0x3F777313A0000000, float 5.000000e-01)
  %302 = tail call float @llvm.nvvm.saturate.f(float %301) #6
  %303 = tail call float @llvm.nvvm.fma.rm.f(float %302, float 2.520000e+02, float 0x4168000020000000) #6
  %304 = fadd float %303, 0xC168000FE0000000
  %305 = fneg float %304
  %306 = tail call float @llvm.fma.f32(float %subtract.1428, float 0x3FF7154760000000, float %305)
  %307 = tail call float @llvm.fma.f32(float %subtract.1428, float 0x3E54AE0C00000000, float %306)
  %308 = bitcast float %303 to i32
  %309 = shl i32 %308, 23
  %310 = bitcast i32 %309 to float
  %311 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %307) #6
  %312 = fmul float %311, %310
  %313 = or i32 %278, 513
  %314 = zext i32 %313 to i64
  %315 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg473, i64 0, i64 %279, i64 %314
  %316 = load float, ptr addrspace(1) %315, align 4, !invariant.load !46
  %add.725.1 = fadd float %287, %316
  %add.926.1 = fadd float %add.725.1, %296
  %add.1127.1 = fadd float %add.926.1, %300
  %subtract.1428.1 = fsub float %add.1127.1, %282
  %317 = tail call float @llvm.fma.f32(float %subtract.1428.1, float 0x3F777313A0000000, float 5.000000e-01)
  %318 = tail call float @llvm.nvvm.saturate.f(float %317) #6
  %319 = tail call float @llvm.nvvm.fma.rm.f(float %318, float 2.520000e+02, float 0x4168000020000000) #6
  %320 = fadd float %319, 0xC168000FE0000000
  %321 = fneg float %320
  %322 = tail call float @llvm.fma.f32(float %subtract.1428.1, float 0x3FF7154760000000, float %321)
  %323 = tail call float @llvm.fma.f32(float %subtract.1428.1, float 0x3E54AE0C00000000, float %322)
  %324 = bitcast float %319 to i32
  %325 = shl i32 %324, 23
  %326 = bitcast i32 %325 to float
  %327 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %323) #6
  %328 = fmul float %327, %326
  %add.20.i52.1 = fadd float %312, %328
  %329 = getelementptr inbounds float, ptr addrspace(1) %284, i64 2
  %330 = load <2 x float>, ptr addrspace(1) %329, align 8, !invariant.load !46
  %331 = extractelement <2 x float> %330, i32 0
  %332 = extractelement <2 x float> %330, i32 1
  %333 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg473, i64 0, i64 %279, i64 %283
  %334 = getelementptr inbounds float, ptr addrspace(1) %333, i64 514
  %335 = load <2 x float>, ptr addrspace(1) %334, align 8, !invariant.load !46
  %336 = extractelement <2 x float> %335, i32 0
  %337 = extractelement <2 x float> %335, i32 1
  %add.725.2 = fadd float %331, %336
  %338 = getelementptr inbounds float, ptr addrspace(1) %292, i64 526
  %339 = load <2 x float>, ptr addrspace(1) %338, align 8, !invariant.load !46
  %340 = extractelement <2 x float> %339, i32 0
  %341 = extractelement <2 x float> %339, i32 1
  %add.926.2 = fadd float %add.725.2, %340
  %342 = getelementptr inbounds float, ptr addrspace(1) %297, i64 2
  %343 = load <2 x float>, ptr addrspace(1) %342, align 8, !invariant.load !46
  %344 = extractelement <2 x float> %343, i32 0
  %345 = extractelement <2 x float> %343, i32 1
  %add.1127.2 = fadd float %add.926.2, %344
  %subtract.1428.2 = fsub float %add.1127.2, %282
  %346 = tail call float @llvm.fma.f32(float %subtract.1428.2, float 0x3F777313A0000000, float 5.000000e-01)
  %347 = tail call float @llvm.nvvm.saturate.f(float %346) #6
  %348 = tail call float @llvm.nvvm.fma.rm.f(float %347, float 2.520000e+02, float 0x4168000020000000) #6
  %349 = fadd float %348, 0xC168000FE0000000
  %350 = fneg float %349
  %351 = tail call float @llvm.fma.f32(float %subtract.1428.2, float 0x3FF7154760000000, float %350)
  %352 = tail call float @llvm.fma.f32(float %subtract.1428.2, float 0x3E54AE0C00000000, float %351)
  %353 = bitcast float %348 to i32
  %354 = shl i32 %353, 23
  %355 = bitcast i32 %354 to float
  %356 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %352) #6
  %357 = fmul float %356, %355
  %add.20.i52.2 = fadd float %add.20.i52.1, %357
  %add.725.3 = fadd float %332, %337
  %add.926.3 = fadd float %add.725.3, %341
  %add.1127.3 = fadd float %add.926.3, %345
  %subtract.1428.3 = fsub float %add.1127.3, %282
  %358 = tail call float @llvm.fma.f32(float %subtract.1428.3, float 0x3F777313A0000000, float 5.000000e-01)
  %359 = tail call float @llvm.nvvm.saturate.f(float %358) #6
  %360 = tail call float @llvm.nvvm.fma.rm.f(float %359, float 2.520000e+02, float 0x4168000020000000) #6
  %361 = fadd float %360, 0xC168000FE0000000
  %362 = fneg float %361
  %363 = tail call float @llvm.fma.f32(float %subtract.1428.3, float 0x3FF7154760000000, float %362)
  %364 = tail call float @llvm.fma.f32(float %subtract.1428.3, float 0x3E54AE0C00000000, float %363)
  %365 = bitcast float %360 to i32
  %366 = shl i32 %365, 23
  %367 = bitcast i32 %366 to float
  %368 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %364) #6
  %369 = fmul float %368, %367
  %add.20.i52.3 = fadd float %add.20.i52.2, %369
  %370 = getelementptr inbounds float, ptr addrspace(1) %284, i64 4
  %371 = load <2 x float>, ptr addrspace(1) %370, align 8, !invariant.load !46
  %372 = extractelement <2 x float> %371, i32 0
  %373 = extractelement <2 x float> %371, i32 1
  %374 = getelementptr inbounds float, ptr addrspace(1) %333, i64 516
  %375 = load <2 x float>, ptr addrspace(1) %374, align 8, !invariant.load !46
  %376 = extractelement <2 x float> %375, i32 0
  %377 = extractelement <2 x float> %375, i32 1
  %add.725.4 = fadd float %372, %376
  %378 = getelementptr inbounds float, ptr addrspace(1) %292, i64 528
  %379 = load <2 x float>, ptr addrspace(1) %378, align 8, !invariant.load !46
  %380 = extractelement <2 x float> %379, i32 0
  %381 = extractelement <2 x float> %379, i32 1
  %add.926.4 = fadd float %add.725.4, %380
  %382 = getelementptr inbounds float, ptr addrspace(1) %297, i64 4
  %383 = load <2 x float>, ptr addrspace(1) %382, align 8, !invariant.load !46
  %384 = extractelement <2 x float> %383, i32 0
  %385 = extractelement <2 x float> %383, i32 1
  %add.1127.4 = fadd float %add.926.4, %384
  %subtract.1428.4 = fsub float %add.1127.4, %282
  %386 = tail call float @llvm.fma.f32(float %subtract.1428.4, float 0x3F777313A0000000, float 5.000000e-01)
  %387 = tail call float @llvm.nvvm.saturate.f(float %386) #6
  %388 = tail call float @llvm.nvvm.fma.rm.f(float %387, float 2.520000e+02, float 0x4168000020000000) #6
  %389 = fadd float %388, 0xC168000FE0000000
  %390 = fneg float %389
  %391 = tail call float @llvm.fma.f32(float %subtract.1428.4, float 0x3FF7154760000000, float %390)
  %392 = tail call float @llvm.fma.f32(float %subtract.1428.4, float 0x3E54AE0C00000000, float %391)
  %393 = bitcast float %388 to i32
  %394 = shl i32 %393, 23
  %395 = bitcast i32 %394 to float
  %396 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %392) #6
  %397 = fmul float %396, %395
  %add.20.i52.4 = fadd float %add.20.i52.3, %397
  %add.725.5 = fadd float %373, %377
  %add.926.5 = fadd float %add.725.5, %381
  %add.1127.5 = fadd float %add.926.5, %385
  %subtract.1428.5 = fsub float %add.1127.5, %282
  %398 = tail call float @llvm.fma.f32(float %subtract.1428.5, float 0x3F777313A0000000, float 5.000000e-01)
  %399 = tail call float @llvm.nvvm.saturate.f(float %398) #6
  %400 = tail call float @llvm.nvvm.fma.rm.f(float %399, float 2.520000e+02, float 0x4168000020000000) #6
  %401 = fadd float %400, 0xC168000FE0000000
  %402 = fneg float %401
  %403 = tail call float @llvm.fma.f32(float %subtract.1428.5, float 0x3FF7154760000000, float %402)
  %404 = tail call float @llvm.fma.f32(float %subtract.1428.5, float 0x3E54AE0C00000000, float %403)
  %405 = bitcast float %400 to i32
  %406 = shl i32 %405, 23
  %407 = bitcast i32 %406 to float
  %408 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %404) #6
  %409 = fmul float %408, %407
  %add.20.i52.5 = fadd float %add.20.i52.4, %409
  %410 = mul nuw nsw i32 %.decomposed64, 6
  %411 = zext i32 %10 to i64
  %412 = zext i32 %.decomposed64 to i64
  %413 = getelementptr inbounds [8192 x [15 x float]], ptr addrspace(1) %arg065, i64 0, i64 %411, i64 %412
  %414 = load float, ptr addrspace(1) %413, align 4, !invariant.load !46
  %415 = zext i32 %410 to i64
  %416 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg371, i64 0, i64 %411, i64 %415
  %417 = load <2 x float>, ptr addrspace(1) %416, align 8, !invariant.load !46
  %418 = extractelement <2 x float> %417, i32 0
  %419 = extractelement <2 x float> %417, i32 1
  %420 = or i32 %410, 512
  %421 = zext i32 %420 to i64
  %422 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg473, i64 0, i64 %411, i64 %421
  %423 = load float, ptr addrspace(1) %422, align 8, !invariant.load !46
  %add.740 = fadd float %418, %423
  %424 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg269, i64 0, i64 %411, i64 %415
  %425 = getelementptr inbounds float, ptr addrspace(1) %424, i64 524
  %426 = load <2 x float>, ptr addrspace(1) %425, align 8, !invariant.load !46
  %427 = extractelement <2 x float> %426, i32 0
  %428 = extractelement <2 x float> %426, i32 1
  %add.941 = fadd float %add.740, %427
  %429 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg167, i64 0, i64 %415
  %430 = load <2 x float>, ptr addrspace(1) %429, align 8, !invariant.load !46
  %431 = extractelement <2 x float> %430, i32 0
  %432 = extractelement <2 x float> %430, i32 1
  %add.1142 = fadd float %add.941, %431
  %subtract.1443 = fsub float %add.1142, %414
  %433 = tail call float @llvm.fma.f32(float %subtract.1443, float 0x3F777313A0000000, float 5.000000e-01)
  %434 = tail call float @llvm.nvvm.saturate.f(float %433) #6
  %435 = tail call float @llvm.nvvm.fma.rm.f(float %434, float 2.520000e+02, float 0x4168000020000000) #6
  %436 = fadd float %435, 0xC168000FE0000000
  %437 = fneg float %436
  %438 = tail call float @llvm.fma.f32(float %subtract.1443, float 0x3FF7154760000000, float %437)
  %439 = tail call float @llvm.fma.f32(float %subtract.1443, float 0x3E54AE0C00000000, float %438)
  %440 = bitcast float %435 to i32
  %441 = shl i32 %440, 23
  %442 = bitcast i32 %441 to float
  %443 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %439) #6
  %444 = fmul float %443, %442
  %445 = or i32 %410, 513
  %446 = zext i32 %445 to i64
  %447 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg473, i64 0, i64 %411, i64 %446
  %448 = load float, ptr addrspace(1) %447, align 4, !invariant.load !46
  %add.740.1 = fadd float %419, %448
  %add.941.1 = fadd float %add.740.1, %428
  %add.1142.1 = fadd float %add.941.1, %432
  %subtract.1443.1 = fsub float %add.1142.1, %414
  %449 = tail call float @llvm.fma.f32(float %subtract.1443.1, float 0x3F777313A0000000, float 5.000000e-01)
  %450 = tail call float @llvm.nvvm.saturate.f(float %449) #6
  %451 = tail call float @llvm.nvvm.fma.rm.f(float %450, float 2.520000e+02, float 0x4168000020000000) #6
  %452 = fadd float %451, 0xC168000FE0000000
  %453 = fneg float %452
  %454 = tail call float @llvm.fma.f32(float %subtract.1443.1, float 0x3FF7154760000000, float %453)
  %455 = tail call float @llvm.fma.f32(float %subtract.1443.1, float 0x3E54AE0C00000000, float %454)
  %456 = bitcast float %451 to i32
  %457 = shl i32 %456, 23
  %458 = bitcast i32 %457 to float
  %459 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %455) #6
  %460 = fmul float %459, %458
  %add.20.i53.1 = fadd float %444, %460
  %461 = getelementptr inbounds float, ptr addrspace(1) %416, i64 2
  %462 = load <2 x float>, ptr addrspace(1) %461, align 8, !invariant.load !46
  %463 = extractelement <2 x float> %462, i32 0
  %464 = extractelement <2 x float> %462, i32 1
  %465 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg473, i64 0, i64 %411, i64 %415
  %466 = getelementptr inbounds float, ptr addrspace(1) %465, i64 514
  %467 = load <2 x float>, ptr addrspace(1) %466, align 8, !invariant.load !46
  %468 = extractelement <2 x float> %467, i32 0
  %469 = extractelement <2 x float> %467, i32 1
  %add.740.2 = fadd float %463, %468
  %470 = getelementptr inbounds float, ptr addrspace(1) %424, i64 526
  %471 = load <2 x float>, ptr addrspace(1) %470, align 8, !invariant.load !46
  %472 = extractelement <2 x float> %471, i32 0
  %473 = extractelement <2 x float> %471, i32 1
  %add.941.2 = fadd float %add.740.2, %472
  %474 = getelementptr inbounds float, ptr addrspace(1) %429, i64 2
  %475 = load <2 x float>, ptr addrspace(1) %474, align 8, !invariant.load !46
  %476 = extractelement <2 x float> %475, i32 0
  %477 = extractelement <2 x float> %475, i32 1
  %add.1142.2 = fadd float %add.941.2, %476
  %subtract.1443.2 = fsub float %add.1142.2, %414
  %478 = tail call float @llvm.fma.f32(float %subtract.1443.2, float 0x3F777313A0000000, float 5.000000e-01)
  %479 = tail call float @llvm.nvvm.saturate.f(float %478) #6
  %480 = tail call float @llvm.nvvm.fma.rm.f(float %479, float 2.520000e+02, float 0x4168000020000000) #6
  %481 = fadd float %480, 0xC168000FE0000000
  %482 = fneg float %481
  %483 = tail call float @llvm.fma.f32(float %subtract.1443.2, float 0x3FF7154760000000, float %482)
  %484 = tail call float @llvm.fma.f32(float %subtract.1443.2, float 0x3E54AE0C00000000, float %483)
  %485 = bitcast float %480 to i32
  %486 = shl i32 %485, 23
  %487 = bitcast i32 %486 to float
  %488 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %484) #6
  %489 = fmul float %488, %487
  %add.20.i53.2 = fadd float %add.20.i53.1, %489
  %add.740.3 = fadd float %464, %469
  %add.941.3 = fadd float %add.740.3, %473
  %add.1142.3 = fadd float %add.941.3, %477
  %subtract.1443.3 = fsub float %add.1142.3, %414
  %490 = tail call float @llvm.fma.f32(float %subtract.1443.3, float 0x3F777313A0000000, float 5.000000e-01)
  %491 = tail call float @llvm.nvvm.saturate.f(float %490) #6
  %492 = tail call float @llvm.nvvm.fma.rm.f(float %491, float 2.520000e+02, float 0x4168000020000000) #6
  %493 = fadd float %492, 0xC168000FE0000000
  %494 = fneg float %493
  %495 = tail call float @llvm.fma.f32(float %subtract.1443.3, float 0x3FF7154760000000, float %494)
  %496 = tail call float @llvm.fma.f32(float %subtract.1443.3, float 0x3E54AE0C00000000, float %495)
  %497 = bitcast float %492 to i32
  %498 = shl i32 %497, 23
  %499 = bitcast i32 %498 to float
  %500 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %496) #6
  %501 = fmul float %500, %499
  %add.20.i53.3 = fadd float %add.20.i53.2, %501
  %502 = getelementptr inbounds float, ptr addrspace(1) %416, i64 4
  %503 = load <2 x float>, ptr addrspace(1) %502, align 8, !invariant.load !46
  %504 = extractelement <2 x float> %503, i32 0
  %505 = extractelement <2 x float> %503, i32 1
  %506 = getelementptr inbounds float, ptr addrspace(1) %465, i64 516
  %507 = load <2 x float>, ptr addrspace(1) %506, align 8, !invariant.load !46
  %508 = extractelement <2 x float> %507, i32 0
  %509 = extractelement <2 x float> %507, i32 1
  %add.740.4 = fadd float %504, %508
  %510 = getelementptr inbounds float, ptr addrspace(1) %424, i64 528
  %511 = load <2 x float>, ptr addrspace(1) %510, align 8, !invariant.load !46
  %512 = extractelement <2 x float> %511, i32 0
  %513 = extractelement <2 x float> %511, i32 1
  %add.941.4 = fadd float %add.740.4, %512
  %514 = getelementptr inbounds float, ptr addrspace(1) %429, i64 4
  %515 = load <2 x float>, ptr addrspace(1) %514, align 8, !invariant.load !46
  %516 = extractelement <2 x float> %515, i32 0
  %517 = extractelement <2 x float> %515, i32 1
  %add.1142.4 = fadd float %add.941.4, %516
  %subtract.1443.4 = fsub float %add.1142.4, %414
  %518 = tail call float @llvm.fma.f32(float %subtract.1443.4, float 0x3F777313A0000000, float 5.000000e-01)
  %519 = tail call float @llvm.nvvm.saturate.f(float %518) #6
  %520 = tail call float @llvm.nvvm.fma.rm.f(float %519, float 2.520000e+02, float 0x4168000020000000) #6
  %521 = fadd float %520, 0xC168000FE0000000
  %522 = fneg float %521
  %523 = tail call float @llvm.fma.f32(float %subtract.1443.4, float 0x3FF7154760000000, float %522)
  %524 = tail call float @llvm.fma.f32(float %subtract.1443.4, float 0x3E54AE0C00000000, float %523)
  %525 = bitcast float %520 to i32
  %526 = shl i32 %525, 23
  %527 = bitcast i32 %526 to float
  %528 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %524) #6
  %529 = fmul float %528, %527
  %add.20.i53.4 = fadd float %add.20.i53.3, %529
  %add.740.5 = fadd float %505, %509
  %add.941.5 = fadd float %add.740.5, %513
  %add.1142.5 = fadd float %add.941.5, %517
  %subtract.1443.5 = fsub float %add.1142.5, %414
  %530 = tail call float @llvm.fma.f32(float %subtract.1443.5, float 0x3F777313A0000000, float 5.000000e-01)
  %531 = tail call float @llvm.nvvm.saturate.f(float %530) #6
  %532 = tail call float @llvm.nvvm.fma.rm.f(float %531, float 2.520000e+02, float 0x4168000020000000) #6
  %533 = fadd float %532, 0xC168000FE0000000
  %534 = fneg float %533
  %535 = tail call float @llvm.fma.f32(float %subtract.1443.5, float 0x3FF7154760000000, float %534)
  %536 = tail call float @llvm.fma.f32(float %subtract.1443.5, float 0x3E54AE0C00000000, float %535)
  %537 = bitcast float %532 to i32
  %538 = shl i32 %537, 23
  %539 = bitcast i32 %538 to float
  %540 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %536) #6
  %541 = fmul float %540, %539
  %add.20.i53.5 = fadd float %add.20.i53.4, %541
  %542 = insertelement <4 x float> poison, float %add.20.i.5, i32 0
  %543 = insertelement <4 x float> %542, float %add.20.i51.5, i32 1
  %544 = insertelement <4 x float> %543, float %add.20.i52.5, i32 2
  %545 = insertelement <4 x float> %544, float %add.20.i53.5, i32 3
  store <4 x float> %545, ptr addrspace(1) %145, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_38(ptr noalias nocapture readonly align 128 dereferenceable(491520) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(491520) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(360) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(2949120) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(2949120) %arg6) local_unnamed_addr #2 {
entry:
  %arg630 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg528 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg426 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !61
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index3.frozen = freeze i32 %linear_index3
  %4 = udiv i32 %linear_index3.frozen, 90
  %5 = udiv i32 %linear_index3, 6
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index2.frozen = freeze i32 %linear_index2
  %6 = udiv i32 %linear_index2.frozen, 90
  %7 = udiv i32 %linear_index2, 6
  %linear_index1 = or i32 %linear_index_base, 1
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %8 = udiv i32 %linear_index_base.frozen, 90
  %9 = udiv i32 %linear_index_base, 6
  %10 = urem i32 %9, 15
  %11 = urem i32 %linear_index1, 6
  %12 = mul i32 %8, 90
  %urem.decomposed = sub i32 %linear_index_base.frozen, %12
  %13 = zext i32 %linear_index_base to i64
  %14 = getelementptr float, ptr addrspace(1) %arg426, i64 %13
  %15 = load <4 x float>, ptr addrspace(1) %14, align 16, !invariant.load !46
  %16 = extractelement <4 x float> %15, i32 0
  %17 = extractelement <4 x float> %15, i32 1
  %18 = extractelement <4 x float> %15, i32 2
  %19 = extractelement <4 x float> %15, i32 3
  %20 = or i32 %urem.decomposed, 512
  %21 = zext i32 %8 to i64
  %22 = zext i32 %20 to i64
  %23 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg528, i64 0, i64 %21, i64 %22
  %24 = load float, ptr addrspace(1) %23, align 4, !invariant.load !46
  %add.8 = fadd float %16, %24
  %25 = zext i32 %urem.decomposed to i64
  %26 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg324, i64 0, i64 %21, i64 %25
  %27 = getelementptr inbounds float, ptr addrspace(1) %26, i64 524
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !46
  %add.10 = fadd float %add.8, %28
  %29 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg222, i64 0, i64 %25
  %30 = load float, ptr addrspace(1) %29, align 4, !invariant.load !46
  %add.12 = fadd float %add.10, %30
  %31 = zext i32 %9 to i64
  %32 = getelementptr inbounds float, ptr addrspace(1) %arg120, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 4, !invariant.load !46
  %subtract.15 = fsub float %add.12, %33
  %34 = tail call float @llvm.fma.f32(float %subtract.15, float 0x3F777313A0000000, float 5.000000e-01)
  %35 = tail call float @llvm.nvvm.saturate.f(float %34) #6
  %36 = tail call float @llvm.nvvm.fma.rm.f(float %35, float 2.520000e+02, float 0x4168000020000000) #6
  %37 = fadd float %36, 0xC168000FE0000000
  %38 = fneg float %37
  %39 = tail call float @llvm.fma.f32(float %subtract.15, float 0x3FF7154760000000, float %38)
  %40 = tail call float @llvm.fma.f32(float %subtract.15, float 0x3E54AE0C00000000, float %39)
  %41 = bitcast float %36 to i32
  %42 = shl i32 %41, 23
  %43 = bitcast i32 %42 to float
  %44 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %40) #6
  %45 = fmul float %44, %43
  %46 = getelementptr inbounds float, ptr addrspace(1) %arg018, i64 %31
  %47 = load float, ptr addrspace(1) %46, align 4, !invariant.load !46
  %divide.18 = fdiv float %45, %47
  %48 = getelementptr float, ptr addrspace(1) %arg630, i64 %13
  %49 = mul nuw nsw i32 %10, 6
  %50 = add nuw nsw i32 %49, %11
  %51 = zext i32 %50 to i64
  %52 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg528, i64 0, i64 %21, i64 %51
  %53 = getelementptr inbounds float, ptr addrspace(1) %52, i64 512
  %54 = load float, ptr addrspace(1) %53, align 4, !invariant.load !46
  %add.81 = fadd float %17, %54
  %55 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg324, i64 0, i64 %21, i64 %51
  %56 = getelementptr inbounds float, ptr addrspace(1) %55, i64 524
  %57 = load float, ptr addrspace(1) %56, align 4, !invariant.load !46
  %add.102 = fadd float %add.81, %57
  %58 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg222, i64 0, i64 %51
  %59 = load float, ptr addrspace(1) %58, align 4, !invariant.load !46
  %add.123 = fadd float %add.102, %59
  %subtract.154 = fsub float %add.123, %33
  %60 = tail call float @llvm.fma.f32(float %subtract.154, float 0x3F777313A0000000, float 5.000000e-01)
  %61 = tail call float @llvm.nvvm.saturate.f(float %60) #6
  %62 = tail call float @llvm.nvvm.fma.rm.f(float %61, float 2.520000e+02, float 0x4168000020000000) #6
  %63 = fadd float %62, 0xC168000FE0000000
  %64 = fneg float %63
  %65 = tail call float @llvm.fma.f32(float %subtract.154, float 0x3FF7154760000000, float %64)
  %66 = tail call float @llvm.fma.f32(float %subtract.154, float 0x3E54AE0C00000000, float %65)
  %67 = bitcast float %62 to i32
  %68 = shl i32 %67, 23
  %69 = bitcast i32 %68 to float
  %70 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %66) #6
  %71 = fmul float %70, %69
  %divide.185 = fdiv float %71, %47
  %72 = mul i32 %6, 90
  %urem16.decomposed = sub i32 %linear_index2.frozen, %72
  %73 = or i32 %urem16.decomposed, 512
  %74 = zext i32 %6 to i64
  %75 = zext i32 %73 to i64
  %76 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg528, i64 0, i64 %74, i64 %75
  %77 = load float, ptr addrspace(1) %76, align 4, !invariant.load !46
  %add.86 = fadd float %18, %77
  %78 = zext i32 %urem16.decomposed to i64
  %79 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg324, i64 0, i64 %74, i64 %78
  %80 = getelementptr inbounds float, ptr addrspace(1) %79, i64 524
  %81 = load float, ptr addrspace(1) %80, align 4, !invariant.load !46
  %add.107 = fadd float %add.86, %81
  %82 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg222, i64 0, i64 %78
  %83 = load float, ptr addrspace(1) %82, align 4, !invariant.load !46
  %add.128 = fadd float %add.107, %83
  %84 = zext i32 %7 to i64
  %85 = getelementptr inbounds float, ptr addrspace(1) %arg120, i64 %84
  %86 = load float, ptr addrspace(1) %85, align 4, !invariant.load !46
  %subtract.159 = fsub float %add.128, %86
  %87 = tail call float @llvm.fma.f32(float %subtract.159, float 0x3F777313A0000000, float 5.000000e-01)
  %88 = tail call float @llvm.nvvm.saturate.f(float %87) #6
  %89 = tail call float @llvm.nvvm.fma.rm.f(float %88, float 2.520000e+02, float 0x4168000020000000) #6
  %90 = fadd float %89, 0xC168000FE0000000
  %91 = fneg float %90
  %92 = tail call float @llvm.fma.f32(float %subtract.159, float 0x3FF7154760000000, float %91)
  %93 = tail call float @llvm.fma.f32(float %subtract.159, float 0x3E54AE0C00000000, float %92)
  %94 = bitcast float %89 to i32
  %95 = shl i32 %94, 23
  %96 = bitcast i32 %95 to float
  %97 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %93) #6
  %98 = fmul float %97, %96
  %99 = getelementptr inbounds float, ptr addrspace(1) %arg018, i64 %84
  %100 = load float, ptr addrspace(1) %99, align 4, !invariant.load !46
  %divide.1810 = fdiv float %98, %100
  %101 = mul i32 %4, 90
  %urem17.decomposed = sub i32 %linear_index3.frozen, %101
  %102 = or i32 %urem17.decomposed, 512
  %103 = zext i32 %4 to i64
  %104 = zext i32 %102 to i64
  %105 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg528, i64 0, i64 %103, i64 %104
  %106 = load float, ptr addrspace(1) %105, align 4, !invariant.load !46
  %add.811 = fadd float %19, %106
  %107 = zext i32 %urem17.decomposed to i64
  %108 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg324, i64 0, i64 %103, i64 %107
  %109 = getelementptr inbounds float, ptr addrspace(1) %108, i64 524
  %110 = load float, ptr addrspace(1) %109, align 4, !invariant.load !46
  %add.1012 = fadd float %add.811, %110
  %111 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg222, i64 0, i64 %107
  %112 = load float, ptr addrspace(1) %111, align 4, !invariant.load !46
  %add.1213 = fadd float %add.1012, %112
  %113 = zext i32 %5 to i64
  %114 = getelementptr inbounds float, ptr addrspace(1) %arg120, i64 %113
  %115 = load float, ptr addrspace(1) %114, align 4, !invariant.load !46
  %subtract.1514 = fsub float %add.1213, %115
  %116 = tail call float @llvm.fma.f32(float %subtract.1514, float 0x3F777313A0000000, float 5.000000e-01)
  %117 = tail call float @llvm.nvvm.saturate.f(float %116) #6
  %118 = tail call float @llvm.nvvm.fma.rm.f(float %117, float 2.520000e+02, float 0x4168000020000000) #6
  %119 = fadd float %118, 0xC168000FE0000000
  %120 = fneg float %119
  %121 = tail call float @llvm.fma.f32(float %subtract.1514, float 0x3FF7154760000000, float %120)
  %122 = tail call float @llvm.fma.f32(float %subtract.1514, float 0x3E54AE0C00000000, float %121)
  %123 = bitcast float %118 to i32
  %124 = shl i32 %123, 23
  %125 = bitcast i32 %124 to float
  %126 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %122) #6
  %127 = fmul float %126, %125
  %128 = getelementptr inbounds float, ptr addrspace(1) %arg018, i64 %113
  %129 = load float, ptr addrspace(1) %128, align 4, !invariant.load !46
  %divide.1815 = fdiv float %127, %129
  %130 = insertelement <4 x float> poison, float %divide.18, i32 0
  %131 = insertelement <4 x float> %130, float %divide.185, i32 1
  %132 = insertelement <4 x float> %131, float %divide.1810, i32 2
  %133 = insertelement <4 x float> %132, float %divide.1815, i32 3
  store <4 x float> %133, ptr addrspace(1) %48, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_21(ptr noalias nocapture readonly align 128 dereferenceable(2949120) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(3342336) %arg3) local_unnamed_addr #0 {
entry:
  %arg347 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg245 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg143 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg041 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !63
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 6
  %5 = mul i32 %4, 6
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %6 = urem i32 %4, 17
  %7 = udiv i32 %linear_index_base, 102
  %linear_index1 = or i32 %linear_index_base, 1
  %8 = urem i32 %linear_index1, 6
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index2.frozen = freeze i32 %linear_index2
  %9 = udiv i32 %linear_index2.frozen, 6
  %10 = mul i32 %9, 6
  %.decomposed39 = sub i32 %linear_index2.frozen, %10
  %11 = urem i32 %9, 17
  %12 = udiv i32 %linear_index2, 102
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index3.frozen = freeze i32 %linear_index3
  %13 = udiv i32 %linear_index3.frozen, 6
  %14 = mul i32 %13, 6
  %.decomposed40 = sub i32 %linear_index3.frozen, %14
  %15 = urem i32 %13, 17
  %16 = udiv i32 %linear_index3, 102
  %17 = icmp ult i32 %6, 15
  %18 = zext i32 %.decomposed to i64
  br i1 %17, label %concatenate.pivot.0., label %concatenate.pivot.16.

concatenate.pivot.0.:                             ; preds = %entry
  %19 = zext i32 %7 to i64
  %20 = zext i32 %6 to i64
  %21 = getelementptr inbounds [8192 x [15 x [6 x float]]], ptr addrspace(1) %arg041, i64 0, i64 %19, i64 %20, i64 %18
  br label %concatenate.4.merge

concatenate.pivot.16.:                            ; preds = %entry
  %22 = icmp eq i32 %6, 15
  %23 = zext i32 %7 to i64
  br i1 %22, label %concatenate.pivot.15.1, label %concatenate.pivot.16.2

concatenate.pivot.15.1:                           ; preds = %concatenate.pivot.16.
  %24 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg143, i64 0, i64 %23, i64 0, i64 %18
  br label %concatenate.4.merge

concatenate.pivot.16.2:                           ; preds = %concatenate.pivot.16.
  %25 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg245, i64 0, i64 %23, i64 0, i64 %18
  br label %concatenate.4.merge

concatenate.4.merge:                              ; preds = %concatenate.pivot.16.2, %concatenate.pivot.15.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %21, %concatenate.pivot.0. ], [ %24, %concatenate.pivot.15.1 ], [ %25, %concatenate.pivot.16.2 ]
  %26 = icmp ult i32 %6, 15
  %27 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !46
  %28 = zext i32 %linear_index_base to i64
  %29 = getelementptr float, ptr addrspace(1) %arg347, i64 %28
  store float %27, ptr addrspace(1) %29, align 16
  %30 = zext i32 %8 to i64
  br i1 %26, label %concatenate.pivot.0.8, label %concatenate.pivot.16.9

concatenate.pivot.0.8:                            ; preds = %concatenate.4.merge
  %31 = zext i32 %7 to i64
  %32 = zext i32 %6 to i64
  %33 = getelementptr inbounds [8192 x [15 x [6 x float]]], ptr addrspace(1) %arg041, i64 0, i64 %31, i64 %32, i64 %30
  br label %concatenate.4.merge3

concatenate.pivot.16.9:                           ; preds = %concatenate.4.merge
  %34 = icmp eq i32 %6, 15
  %35 = zext i32 %7 to i64
  br i1 %34, label %concatenate.pivot.15.10, label %concatenate.pivot.16.11

concatenate.pivot.15.10:                          ; preds = %concatenate.pivot.16.9
  %36 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg143, i64 0, i64 %35, i64 0, i64 %30
  br label %concatenate.4.merge3

concatenate.pivot.16.11:                          ; preds = %concatenate.pivot.16.9
  %37 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg245, i64 0, i64 %35, i64 0, i64 %30
  br label %concatenate.4.merge3

concatenate.4.merge3:                             ; preds = %concatenate.pivot.16.11, %concatenate.pivot.15.10, %concatenate.pivot.0.8
  %.in36 = phi ptr addrspace(1) [ %33, %concatenate.pivot.0.8 ], [ %36, %concatenate.pivot.15.10 ], [ %37, %concatenate.pivot.16.11 ]
  %38 = load float, ptr addrspace(1) %.in36, align 4, !invariant.load !46
  %39 = getelementptr inbounds float, ptr addrspace(1) %29, i64 1
  store float %38, ptr addrspace(1) %39, align 4
  %40 = icmp ult i32 %11, 15
  %41 = zext i32 %.decomposed39 to i64
  br i1 %40, label %concatenate.pivot.0.17, label %concatenate.pivot.16.18

concatenate.pivot.0.17:                           ; preds = %concatenate.4.merge3
  %42 = zext i32 %12 to i64
  %43 = zext i32 %11 to i64
  %44 = getelementptr inbounds [8192 x [15 x [6 x float]]], ptr addrspace(1) %arg041, i64 0, i64 %42, i64 %43, i64 %41
  br label %concatenate.4.merge12

concatenate.pivot.16.18:                          ; preds = %concatenate.4.merge3
  %45 = icmp eq i32 %11, 15
  %46 = zext i32 %12 to i64
  br i1 %45, label %concatenate.pivot.15.19, label %concatenate.pivot.16.20

concatenate.pivot.15.19:                          ; preds = %concatenate.pivot.16.18
  %47 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg143, i64 0, i64 %46, i64 0, i64 %41
  br label %concatenate.4.merge12

concatenate.pivot.16.20:                          ; preds = %concatenate.pivot.16.18
  %48 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg245, i64 0, i64 %46, i64 0, i64 %41
  br label %concatenate.4.merge12

concatenate.4.merge12:                            ; preds = %concatenate.pivot.16.20, %concatenate.pivot.15.19, %concatenate.pivot.0.17
  %.in37 = phi ptr addrspace(1) [ %44, %concatenate.pivot.0.17 ], [ %47, %concatenate.pivot.15.19 ], [ %48, %concatenate.pivot.16.20 ]
  %49 = load float, ptr addrspace(1) %.in37, align 4, !invariant.load !46
  %50 = getelementptr inbounds float, ptr addrspace(1) %29, i64 2
  store float %49, ptr addrspace(1) %50, align 8
  %51 = icmp ult i32 %15, 15
  %52 = zext i32 %.decomposed40 to i64
  br i1 %51, label %concatenate.pivot.0.26, label %concatenate.pivot.16.27

concatenate.pivot.0.26:                           ; preds = %concatenate.4.merge12
  %53 = zext i32 %16 to i64
  %54 = zext i32 %15 to i64
  %55 = getelementptr inbounds [8192 x [15 x [6 x float]]], ptr addrspace(1) %arg041, i64 0, i64 %53, i64 %54, i64 %52
  br label %concatenate.4.merge21

concatenate.pivot.16.27:                          ; preds = %concatenate.4.merge12
  %56 = icmp eq i32 %15, 15
  %57 = zext i32 %16 to i64
  br i1 %56, label %concatenate.pivot.15.28, label %concatenate.pivot.16.29

concatenate.pivot.15.28:                          ; preds = %concatenate.pivot.16.27
  %58 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg143, i64 0, i64 %57, i64 0, i64 %52
  br label %concatenate.4.merge21

concatenate.pivot.16.29:                          ; preds = %concatenate.pivot.16.27
  %59 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg245, i64 0, i64 %57, i64 0, i64 %52
  br label %concatenate.4.merge21

concatenate.4.merge21:                            ; preds = %concatenate.pivot.16.29, %concatenate.pivot.15.28, %concatenate.pivot.0.26
  %.in38 = phi ptr addrspace(1) [ %55, %concatenate.pivot.0.26 ], [ %58, %concatenate.pivot.15.28 ], [ %59, %concatenate.pivot.16.29 ]
  %60 = load float, ptr addrspace(1) %.in38, align 4, !invariant.load !46
  %61 = getelementptr inbounds float, ptr addrspace(1) %29, i64 3
  store float %60, ptr addrspace(1) %61, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_16(ptr noalias readonly align 128 dereferenceable(142606336) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg17) local_unnamed_addr #2 {
entry:
  %arg1740 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1638 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1536 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1434 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1332 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1230 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1128 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1026 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg924 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg822 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg720 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg618 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg516 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg414 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 8
  %5 = and i32 %linear_index3, 255
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = and i32 %linear_index2, 254
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 253
  %8 = and i32 %3, 252
  %9 = zext i32 %4 to i64
  %10 = zext i32 %8 to i64
  %11 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 0, i64 %10
  %12 = load <2 x float>, ptr addrspace(1) %11, align 16, !invariant.load !46
  %13 = extractelement <2 x float> %12, i32 0
  %14 = extractelement <2 x float> %12, i32 1
  %15 = getelementptr inbounds float, ptr addrspace(1) %11, i64 256
  %16 = load <2 x float>, ptr addrspace(1) %15, align 16, !invariant.load !46
  %17 = extractelement <2 x float> %16, i32 0
  %18 = extractelement <2 x float> %16, i32 1
  %19 = getelementptr inbounds float, ptr addrspace(1) %11, i64 512
  %20 = load <2 x float>, ptr addrspace(1) %19, align 16, !invariant.load !46
  %21 = extractelement <2 x float> %20, i32 0
  %22 = extractelement <2 x float> %20, i32 1
  %23 = getelementptr inbounds float, ptr addrspace(1) %11, i64 768
  %24 = load <2 x float>, ptr addrspace(1) %23, align 16, !invariant.load !46
  %25 = extractelement <2 x float> %24, i32 0
  %26 = extractelement <2 x float> %24, i32 1
  %27 = getelementptr inbounds float, ptr addrspace(1) %11, i64 1024
  %28 = load <2 x float>, ptr addrspace(1) %27, align 16, !invariant.load !46
  %29 = extractelement <2 x float> %28, i32 0
  %30 = extractelement <2 x float> %28, i32 1
  %31 = getelementptr inbounds float, ptr addrspace(1) %11, i64 1280
  %32 = load <2 x float>, ptr addrspace(1) %31, align 16, !invariant.load !46
  %33 = extractelement <2 x float> %32, i32 0
  %34 = extractelement <2 x float> %32, i32 1
  %35 = getelementptr inbounds float, ptr addrspace(1) %11, i64 1536
  %36 = load <2 x float>, ptr addrspace(1) %35, align 16, !invariant.load !46
  %37 = extractelement <2 x float> %36, i32 0
  %38 = extractelement <2 x float> %36, i32 1
  %39 = getelementptr inbounds float, ptr addrspace(1) %11, i64 1792
  %40 = load <2 x float>, ptr addrspace(1) %39, align 16, !invariant.load !46
  %41 = extractelement <2 x float> %40, i32 0
  %42 = extractelement <2 x float> %40, i32 1
  %43 = getelementptr inbounds float, ptr addrspace(1) %11, i64 2048
  %44 = load <2 x float>, ptr addrspace(1) %43, align 16, !invariant.load !46
  %45 = extractelement <2 x float> %44, i32 0
  %46 = extractelement <2 x float> %44, i32 1
  %47 = getelementptr inbounds float, ptr addrspace(1) %11, i64 2304
  %48 = load <2 x float>, ptr addrspace(1) %47, align 16, !invariant.load !46
  %49 = extractelement <2 x float> %48, i32 0
  %50 = extractelement <2 x float> %48, i32 1
  %51 = getelementptr inbounds float, ptr addrspace(1) %11, i64 2560
  %52 = load <2 x float>, ptr addrspace(1) %51, align 16, !invariant.load !46
  %53 = extractelement <2 x float> %52, i32 0
  %54 = extractelement <2 x float> %52, i32 1
  %55 = getelementptr inbounds float, ptr addrspace(1) %11, i64 2816
  %56 = load <2 x float>, ptr addrspace(1) %55, align 16, !invariant.load !46
  %57 = extractelement <2 x float> %56, i32 0
  %58 = extractelement <2 x float> %56, i32 1
  %59 = getelementptr inbounds float, ptr addrspace(1) %11, i64 3072
  %60 = load <2 x float>, ptr addrspace(1) %59, align 16, !invariant.load !46
  %61 = extractelement <2 x float> %60, i32 0
  %62 = extractelement <2 x float> %60, i32 1
  %63 = getelementptr inbounds float, ptr addrspace(1) %11, i64 3328
  %64 = load <2 x float>, ptr addrspace(1) %63, align 16, !invariant.load !46
  %65 = extractelement <2 x float> %64, i32 0
  %66 = extractelement <2 x float> %64, i32 1
  %67 = getelementptr inbounds float, ptr addrspace(1) %11, i64 3584
  %68 = load <2 x float>, ptr addrspace(1) %67, align 16, !invariant.load !46
  %69 = extractelement <2 x float> %68, i32 0
  %70 = extractelement <2 x float> %68, i32 1
  %71 = getelementptr inbounds float, ptr addrspace(1) %11, i64 3840
  %72 = load <2 x float>, ptr addrspace(1) %71, align 16, !invariant.load !46
  %73 = extractelement <2 x float> %72, i32 0
  %74 = extractelement <2 x float> %72, i32 1
  %75 = getelementptr inbounds float, ptr addrspace(1) %11, i64 4096
  %76 = load <2 x float>, ptr addrspace(1) %75, align 16, !invariant.load !46
  %77 = extractelement <2 x float> %76, i32 0
  %78 = extractelement <2 x float> %76, i32 1
  %79 = zext i32 %linear_index_base to i64
  %80 = getelementptr float, ptr addrspace(1) %arg18, i64 %79
  %81 = getelementptr float, ptr addrspace(1) %arg210, i64 %79
  %82 = getelementptr float, ptr addrspace(1) %arg312, i64 %79
  %83 = getelementptr float, ptr addrspace(1) %arg414, i64 %79
  %84 = getelementptr float, ptr addrspace(1) %arg516, i64 %79
  %85 = getelementptr float, ptr addrspace(1) %arg618, i64 %79
  %86 = getelementptr float, ptr addrspace(1) %arg720, i64 %79
  %87 = getelementptr float, ptr addrspace(1) %arg822, i64 %79
  %88 = getelementptr float, ptr addrspace(1) %arg924, i64 %79
  %89 = getelementptr float, ptr addrspace(1) %arg1026, i64 %79
  %90 = getelementptr float, ptr addrspace(1) %arg1128, i64 %79
  %91 = getelementptr float, ptr addrspace(1) %arg1230, i64 %79
  %92 = getelementptr float, ptr addrspace(1) %arg1332, i64 %79
  %93 = getelementptr float, ptr addrspace(1) %arg1434, i64 %79
  %94 = getelementptr float, ptr addrspace(1) %arg1536, i64 %79
  %95 = getelementptr float, ptr addrspace(1) %arg1638, i64 %79
  %96 = getelementptr float, ptr addrspace(1) %arg1740, i64 %79
  %97 = zext i32 %7 to i64
  %98 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 0, i64 %97
  %99 = zext i32 %6 to i64
  %100 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 0, i64 %99
  %101 = load float, ptr addrspace(1) %100, align 8, !invariant.load !46
  %102 = getelementptr inbounds float, ptr addrspace(1) %100, i64 256
  %103 = load float, ptr addrspace(1) %102, align 8, !invariant.load !46
  %104 = getelementptr inbounds float, ptr addrspace(1) %100, i64 512
  %105 = load float, ptr addrspace(1) %104, align 8, !invariant.load !46
  %106 = getelementptr inbounds float, ptr addrspace(1) %100, i64 768
  %107 = load float, ptr addrspace(1) %106, align 8, !invariant.load !46
  %108 = getelementptr inbounds float, ptr addrspace(1) %100, i64 1024
  %109 = load float, ptr addrspace(1) %108, align 8, !invariant.load !46
  %110 = getelementptr inbounds float, ptr addrspace(1) %100, i64 1280
  %111 = load float, ptr addrspace(1) %110, align 8, !invariant.load !46
  %112 = getelementptr inbounds float, ptr addrspace(1) %100, i64 1536
  %113 = load float, ptr addrspace(1) %112, align 8, !invariant.load !46
  %114 = getelementptr inbounds float, ptr addrspace(1) %100, i64 1792
  %115 = load float, ptr addrspace(1) %114, align 8, !invariant.load !46
  %116 = getelementptr inbounds float, ptr addrspace(1) %100, i64 2048
  %117 = load float, ptr addrspace(1) %116, align 8, !invariant.load !46
  %118 = getelementptr inbounds float, ptr addrspace(1) %100, i64 2304
  %119 = load float, ptr addrspace(1) %118, align 8, !invariant.load !46
  %120 = getelementptr inbounds float, ptr addrspace(1) %100, i64 2560
  %121 = load float, ptr addrspace(1) %120, align 8, !invariant.load !46
  %122 = getelementptr inbounds float, ptr addrspace(1) %100, i64 2816
  %123 = load float, ptr addrspace(1) %122, align 8, !invariant.load !46
  %124 = getelementptr inbounds float, ptr addrspace(1) %100, i64 3072
  %125 = load float, ptr addrspace(1) %124, align 8, !invariant.load !46
  %126 = getelementptr inbounds float, ptr addrspace(1) %100, i64 3328
  %127 = load float, ptr addrspace(1) %126, align 8, !invariant.load !46
  %128 = getelementptr inbounds float, ptr addrspace(1) %100, i64 3584
  %129 = load float, ptr addrspace(1) %128, align 8, !invariant.load !46
  %130 = getelementptr inbounds float, ptr addrspace(1) %100, i64 3840
  %131 = load float, ptr addrspace(1) %130, align 8, !invariant.load !46
  %132 = getelementptr inbounds float, ptr addrspace(1) %100, i64 4096
  %133 = load float, ptr addrspace(1) %132, align 8, !invariant.load !46
  %134 = zext i32 %5 to i64
  %135 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 0, i64 %134
  %136 = load float, ptr addrspace(1) %135, align 4, !invariant.load !46
  %137 = getelementptr inbounds float, ptr addrspace(1) %135, i64 256
  %138 = load float, ptr addrspace(1) %137, align 4, !invariant.load !46
  %139 = getelementptr inbounds float, ptr addrspace(1) %135, i64 512
  %140 = load float, ptr addrspace(1) %139, align 4, !invariant.load !46
  %141 = getelementptr inbounds float, ptr addrspace(1) %135, i64 768
  %142 = load float, ptr addrspace(1) %141, align 4, !invariant.load !46
  %143 = getelementptr inbounds float, ptr addrspace(1) %135, i64 1024
  %144 = load float, ptr addrspace(1) %143, align 4, !invariant.load !46
  %145 = getelementptr inbounds float, ptr addrspace(1) %135, i64 1280
  %146 = load float, ptr addrspace(1) %145, align 4, !invariant.load !46
  %147 = getelementptr inbounds float, ptr addrspace(1) %135, i64 1536
  %148 = load float, ptr addrspace(1) %147, align 4, !invariant.load !46
  %149 = getelementptr inbounds float, ptr addrspace(1) %135, i64 1792
  %150 = load float, ptr addrspace(1) %149, align 4, !invariant.load !46
  %151 = getelementptr inbounds float, ptr addrspace(1) %135, i64 2048
  %152 = load float, ptr addrspace(1) %151, align 4, !invariant.load !46
  %153 = getelementptr inbounds float, ptr addrspace(1) %135, i64 2304
  %154 = load float, ptr addrspace(1) %153, align 4, !invariant.load !46
  %155 = getelementptr inbounds float, ptr addrspace(1) %135, i64 2560
  %156 = load float, ptr addrspace(1) %155, align 4, !invariant.load !46
  %157 = getelementptr inbounds float, ptr addrspace(1) %135, i64 2816
  %158 = load float, ptr addrspace(1) %157, align 4, !invariant.load !46
  %159 = getelementptr inbounds float, ptr addrspace(1) %135, i64 3072
  %160 = load float, ptr addrspace(1) %159, align 4, !invariant.load !46
  %161 = getelementptr inbounds float, ptr addrspace(1) %135, i64 3328
  %162 = load float, ptr addrspace(1) %161, align 4, !invariant.load !46
  %163 = getelementptr inbounds float, ptr addrspace(1) %135, i64 3584
  %164 = load float, ptr addrspace(1) %163, align 4, !invariant.load !46
  %165 = getelementptr inbounds float, ptr addrspace(1) %135, i64 3840
  %166 = load float, ptr addrspace(1) %165, align 4, !invariant.load !46
  %167 = getelementptr inbounds float, ptr addrspace(1) %135, i64 4096
  %168 = load float, ptr addrspace(1) %167, align 4, !invariant.load !46
  %169 = insertelement <4 x float> poison, float %13, i32 0
  %170 = insertelement <4 x float> %169, float %14, i32 1
  %171 = insertelement <4 x float> %170, float %101, i32 2
  %172 = insertelement <4 x float> %171, float %136, i32 3
  store <4 x float> %172, ptr addrspace(1) %80, align 16
  %173 = insertelement <4 x float> poison, float %17, i32 0
  %174 = insertelement <4 x float> %173, float %18, i32 1
  %175 = insertelement <4 x float> %174, float %103, i32 2
  %176 = insertelement <4 x float> %175, float %138, i32 3
  store <4 x float> %176, ptr addrspace(1) %81, align 16
  %177 = insertelement <4 x float> poison, float %21, i32 0
  %178 = insertelement <4 x float> %177, float %22, i32 1
  %179 = insertelement <4 x float> %178, float %105, i32 2
  %180 = insertelement <4 x float> %179, float %140, i32 3
  store <4 x float> %180, ptr addrspace(1) %82, align 16
  %181 = insertelement <4 x float> poison, float %25, i32 0
  %182 = insertelement <4 x float> %181, float %26, i32 1
  %183 = insertelement <4 x float> %182, float %107, i32 2
  %184 = insertelement <4 x float> %183, float %142, i32 3
  store <4 x float> %184, ptr addrspace(1) %83, align 16
  %185 = insertelement <4 x float> poison, float %29, i32 0
  %186 = insertelement <4 x float> %185, float %30, i32 1
  %187 = insertelement <4 x float> %186, float %109, i32 2
  %188 = insertelement <4 x float> %187, float %144, i32 3
  store <4 x float> %188, ptr addrspace(1) %84, align 16
  %189 = insertelement <4 x float> poison, float %33, i32 0
  %190 = insertelement <4 x float> %189, float %34, i32 1
  %191 = insertelement <4 x float> %190, float %111, i32 2
  %192 = insertelement <4 x float> %191, float %146, i32 3
  store <4 x float> %192, ptr addrspace(1) %85, align 16
  %193 = insertelement <4 x float> poison, float %37, i32 0
  %194 = insertelement <4 x float> %193, float %38, i32 1
  %195 = insertelement <4 x float> %194, float %113, i32 2
  %196 = insertelement <4 x float> %195, float %148, i32 3
  store <4 x float> %196, ptr addrspace(1) %86, align 16
  %197 = insertelement <4 x float> poison, float %41, i32 0
  %198 = insertelement <4 x float> %197, float %42, i32 1
  %199 = insertelement <4 x float> %198, float %115, i32 2
  %200 = insertelement <4 x float> %199, float %150, i32 3
  store <4 x float> %200, ptr addrspace(1) %87, align 16
  %201 = insertelement <4 x float> poison, float %45, i32 0
  %202 = insertelement <4 x float> %201, float %46, i32 1
  %203 = insertelement <4 x float> %202, float %117, i32 2
  %204 = insertelement <4 x float> %203, float %152, i32 3
  store <4 x float> %204, ptr addrspace(1) %88, align 16
  %205 = insertelement <4 x float> poison, float %49, i32 0
  %206 = insertelement <4 x float> %205, float %50, i32 1
  %207 = insertelement <4 x float> %206, float %119, i32 2
  %208 = insertelement <4 x float> %207, float %154, i32 3
  store <4 x float> %208, ptr addrspace(1) %89, align 16
  %209 = insertelement <4 x float> poison, float %53, i32 0
  %210 = insertelement <4 x float> %209, float %54, i32 1
  %211 = insertelement <4 x float> %210, float %121, i32 2
  %212 = insertelement <4 x float> %211, float %156, i32 3
  store <4 x float> %212, ptr addrspace(1) %90, align 16
  %213 = insertelement <4 x float> poison, float %57, i32 0
  %214 = insertelement <4 x float> %213, float %58, i32 1
  %215 = insertelement <4 x float> %214, float %123, i32 2
  %216 = insertelement <4 x float> %215, float %158, i32 3
  store <4 x float> %216, ptr addrspace(1) %91, align 16
  %217 = insertelement <4 x float> poison, float %61, i32 0
  %218 = insertelement <4 x float> %217, float %62, i32 1
  %219 = insertelement <4 x float> %218, float %125, i32 2
  %220 = insertelement <4 x float> %219, float %160, i32 3
  store <4 x float> %220, ptr addrspace(1) %92, align 16
  %221 = insertelement <4 x float> poison, float %65, i32 0
  %222 = insertelement <4 x float> %221, float %66, i32 1
  %223 = insertelement <4 x float> %222, float %127, i32 2
  %224 = insertelement <4 x float> %223, float %162, i32 3
  store <4 x float> %224, ptr addrspace(1) %93, align 16
  %225 = insertelement <4 x float> poison, float %69, i32 0
  %226 = insertelement <4 x float> %225, float %70, i32 1
  %227 = insertelement <4 x float> %226, float %129, i32 2
  %228 = insertelement <4 x float> %227, float %164, i32 3
  store <4 x float> %228, ptr addrspace(1) %94, align 16
  %229 = insertelement <4 x float> poison, float %73, i32 0
  %230 = insertelement <4 x float> %229, float %74, i32 1
  %231 = insertelement <4 x float> %230, float %131, i32 2
  %232 = insertelement <4 x float> %231, float %166, i32 3
  store <4 x float> %232, ptr addrspace(1) %95, align 16
  %233 = insertelement <4 x float> poison, float %77, i32 0
  %234 = insertelement <4 x float> %233, float %78, i32 1
  %235 = insertelement <4 x float> %234, float %133, i32 2
  %236 = insertelement <4 x float> %235, float %168, i32 3
  store <4 x float> %236, ptr addrspace(1) %96, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.saturate.f(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rm.f(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #5

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nofree nosync nounwind memory(argmem: readwrite) }
attributes #4 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41}
!llvm.ident = !{!42}
!llvm.module.flags = !{!43}

!0 = !{ptr @concatenate_23, !"kernel", i32 1}
!1 = !{ptr @concatenate_23, !"reqntidx", i32 256}
!2 = !{ptr @concatenate_18, !"kernel", i32 1}
!3 = !{ptr @concatenate_18, !"reqntidx", i32 256}
!4 = !{ptr @concatenate_19, !"kernel", i32 1}
!5 = !{ptr @concatenate_19, !"reqntidx", i32 1024}
!6 = !{ptr @concatenate_17, !"kernel", i32 1}
!7 = !{ptr @concatenate_17, !"reqntidx", i32 1024}
!8 = !{ptr @fusion_29, !"kernel", i32 1}
!9 = !{ptr @fusion_29, !"reqntidx", i32 256}
!10 = !{ptr @add_21, !"kernel", i32 1}
!11 = !{ptr @add_21, !"reqntidx", i32 128}
!12 = !{ptr @fusion_27, !"kernel", i32 1}
!13 = !{ptr @fusion_27, !"reqntidx", i32 256}
!14 = !{ptr @fusion_45, !"kernel", i32 1}
!15 = !{ptr @fusion_45, !"reqntidx", i32 256}
!16 = !{ptr @fusion_17, !"kernel", i32 1}
!17 = !{ptr @fusion_17, !"reqntidx", i32 256}
!18 = !{ptr @concatenate_20, !"kernel", i32 1}
!19 = !{ptr @concatenate_20, !"reqntidx", i32 256}
!20 = !{ptr @slice_33, !"kernel", i32 1}
!21 = !{ptr @slice_33, !"reqntidx", i32 1024}
!22 = !{ptr @slice_38, !"kernel", i32 1}
!23 = !{ptr @slice_38, !"reqntidx", i32 1024}
!24 = !{ptr @fusion_43, !"kernel", i32 1}
!25 = !{ptr @fusion_43, !"reqntidx", i32 1024}
!26 = !{ptr @fusion_35, !"kernel", i32 1}
!27 = !{ptr @fusion_35, !"reqntidx", i32 1024}
!28 = !{ptr @fusion_34, !"kernel", i32 1}
!29 = !{ptr @fusion_34, !"reqntidx", i32 1024}
!30 = !{ptr @slice_30, !"kernel", i32 1}
!31 = !{ptr @slice_30, !"reqntidx", i32 256}
!32 = !{ptr @fusion_41, !"kernel", i32 1}
!33 = !{ptr @fusion_41, !"reqntidx", i32 256}
!34 = !{ptr @fusion_42, !"kernel", i32 1}
!35 = !{ptr @fusion_42, !"reqntidx", i32 256}
!36 = !{ptr @fusion_38, !"kernel", i32 1}
!37 = !{ptr @fusion_38, !"reqntidx", i32 256}
!38 = !{ptr @concatenate_21, !"kernel", i32 1}
!39 = !{ptr @concatenate_21, !"reqntidx", i32 256}
!40 = !{ptr @fusion_16, !"kernel", i32 1}
!41 = !{ptr @fusion_16, !"reqntidx", i32 256}
!42 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!43 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!44 = !{i32 0, i32 11840}
!45 = !{i32 0, i32 256}
!46 = !{}
!47 = !{i32 0, i32 154}
!48 = !{i32 0, i32 34}
!49 = !{i32 0, i32 1024}
!50 = !{i32 0, i32 77}
!51 = !{i32 0, i32 4096}
!52 = !{i32 0, i32 864}
!53 = !{i32 0, i32 128}
!54 = distinct !{!54, !55}
!55 = !{!"llvm.loop.vectorize.enable", i1 false}
!56 = !{i32 0, i32 2048}
!57 = !{i32 0, i32 12288}
!58 = !{i32 0, i32 11968}
!59 = !{i32 0, i32 48}
!60 = !{i32 0, i32 8}
!61 = !{i32 0, i32 720}
!62 = !{i32 0, i32 120}
!63 = !{i32 0, i32 816}
