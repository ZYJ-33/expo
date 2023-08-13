target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache4 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache5 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@buffer_for_constant_4 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@shared_cache6 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache7 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache8 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache9 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache10 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache11 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef

; Function Attrs: nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @fusion_20(ptr noalias nocapture readonly align 16 dereferenceable(4456448) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(557056) %arg2) local_unnamed_addr #0 {
entry:
  %arg238 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg136 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg034 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !61
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !62
  %2 = lshr i32 %0, 3
  %3 = mul nuw nsw i32 %1, 12
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 139264
  br i1 %5, label %x_in_tile-true, label %common.ret

common.ret:                                       ; preds = %entry, %x_in_tile-true, %reduction_write_output-true
  ret void

x_in_tile-true:                                   ; preds = %entry
  %6 = and i32 %0, 7
  %7 = shl nuw nsw i32 %4, 3
  %8 = or i32 %6, %7
  %9 = urem i32 %4, 17
  %10 = udiv i32 %4, 17
  %11 = shl nuw nsw i32 %9, 3
  %12 = zext i32 %10 to i64
  %13 = zext i32 %11 to i64
  %14 = zext i32 %6 to i64
  %15 = add i64 %14, %13
  %16 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg136, i64 0, i64 %12, i64 %15
  %Arg_1.21240 = getelementptr inbounds float, ptr addrspace(1) %16, i64 832
  %Arg_1.213 = load float, ptr addrspace(1) %Arg_1.21240, align 4, !invariant.load !63
  %17 = zext i32 %8 to i64
  %Arg_0.114 = getelementptr inbounds float, ptr addrspace(1) %arg034, i64 %17
  %Arg_0.115 = load float, ptr addrspace(1) %Arg_0.114, align 4, !invariant.load !63
  %multiply.516 = fmul float %Arg_1.213, %Arg_0.115
  %add.10.i31 = fadd float %multiply.516, 0.000000e+00
  %18 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i31, i32 4, i32 31)
  %add.10.i = fadd float %add.10.i31, %18
  %19 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i, i32 2, i32 31)
  %add.10.i29 = fadd float %add.10.i, %19
  %20 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i29, i32 1, i32 31)
  %21 = icmp eq i32 %6, 0
  br i1 %21, label %reduction_write_output-true, label %common.ret

reduction_write_output-true:                      ; preds = %x_in_tile-true
  %add.10.i30 = fadd float %add.10.i29, %20
  %.frozen = freeze i32 %4
  %22 = udiv i32 %.frozen, 17
  %23 = mul i32 %22, 17
  %.decomposed = sub i32 %.frozen, %23
  %24 = zext i32 %22 to i64
  %25 = zext i32 %.decomposed to i64
  %output_element_address = getelementptr inbounds [8192 x [17 x float]], ptr addrspace(1) %arg238, i64 0, i64 %24, i64 %25
  store float %add.10.i30, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #2

; Function Attrs: nounwind
define void @fusion_21(ptr noalias nocapture readonly align 16 dereferenceable(27262976) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(425984) %arg2) local_unnamed_addr #3 {
entry:
  %arg248 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !61
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %2 = lshr i32 %0, 5
  %3 = mul nuw nsw i32 %1, 3
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 106496
  br i1 %5, label %tile_loop.loop_header6.preheader, label %common.ret

tile_loop.loop_header6.preheader:                 ; preds = %entry
  %6 = and i32 %0, 31
  %7 = shl nuw nsw i32 %4, 6
  %8 = or i32 %6, %7
  %9 = urem i32 %4, 13
  %10 = udiv i32 %4, 13
  %11 = shl nuw nsw i32 %9, 6
  %12 = or i32 %11, %6
  %13 = zext i32 %10 to i64
  %14 = zext i32 %12 to i64
  %Arg_1.212 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg146, i64 0, i64 %13, i64 %14
  %Arg_1.213 = load float, ptr addrspace(1) %Arg_1.212, align 4, !invariant.load !63
  %15 = zext i32 %8 to i64
  %Arg_0.114 = getelementptr inbounds float, ptr addrspace(1) %arg044, i64 %15
  %Arg_0.115 = load float, ptr addrspace(1) %Arg_0.114, align 4, !invariant.load !63
  %multiply.516 = fmul float %Arg_1.213, %Arg_0.115
  %add.10.i41 = fadd float %multiply.516, 0.000000e+00
  %16 = zext i32 %11 to i64
  %17 = zext i32 %6 to i64
  %18 = add i64 %16, %17
  %19 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg146, i64 0, i64 %13, i64 %18
  %Arg_1.212.151 = getelementptr inbounds float, ptr addrspace(1) %19, i64 32
  %Arg_1.213.1 = load float, ptr addrspace(1) %Arg_1.212.151, align 4, !invariant.load !63
  %20 = zext i32 %7 to i64
  %21 = add i64 %17, %20
  %22 = getelementptr float, ptr addrspace(1) %arg044, i64 %21
  %Arg_0.114.153 = getelementptr inbounds float, ptr addrspace(1) %22, i64 32
  %Arg_0.115.1 = load float, ptr addrspace(1) %Arg_0.114.153, align 4, !invariant.load !63
  %multiply.516.1 = fmul float %Arg_1.213.1, %Arg_0.115.1
  %add.10.i41.1 = fadd float %add.10.i41, %multiply.516.1
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i41.1, i32 16, i32 31)
  %add.10.i = fadd float %add.10.i41.1, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i, i32 8, i32 31)
  %add.10.i37 = fadd float %add.10.i, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i37, i32 4, i32 31)
  %add.10.i38 = fadd float %add.10.i37, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i38, i32 2, i32 31)
  %add.10.i39 = fadd float %add.10.i38, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i39, i32 1, i32 31)
  %28 = icmp eq i32 %6, 0
  %29 = zext i32 %2 to i64
  %30 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 %29, i64 0, i64 0
  %add.10.i40 = fadd float %add.10.i39, %27
  br i1 %28, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %tile_loop.loop_header6.preheader
  %31 = icmp eq i32 %6, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %31, label %reduction_write_output-true, label %common.ret

intra_warp_reduce_write-true:                     ; preds = %tile_loop.loop_header6.preheader
  store float %add.10.i40, ptr addrspace(3) %30, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %.frozen = freeze i32 %4
  %32 = udiv i32 %.frozen, 13
  %33 = mul i32 %32, 13
  %.decomposed = sub i32 %.frozen, %33
  %34 = zext i32 %32 to i64
  %35 = zext i32 %.decomposed to i64
  %output_element_address = getelementptr inbounds [8192 x [13 x float]], ptr addrspace(1) %arg248, i64 0, i64 %34, i64 %35
  %output.then.val = load float, ptr addrspace(3) %30, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #4

; Function Attrs: nounwind
define void @fusion_18(ptr noalias nocapture readonly align 16 dereferenceable(983040) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(425984) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(557056) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(983040) %arg5) local_unnamed_addr #3 {
entry:
  %arg568 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg466 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg364 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg262 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg160 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg058 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !65
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %thread_id.x = and i32 %1, 31
  %thread_id.y43 = lshr i32 %1, 5
  %2 = mul i32 %0, 3840
  %Arg_1.2 = load float, ptr addrspace(1) %arg160, align 16
  %3 = add nuw nsw i32 %thread_id.y43, -32
  %4 = mul nuw nsw i32 %thread_id.y43, 30
  %5 = add i32 %2, %4
  %6 = add i32 %5, %thread_id.x
  %7 = zext i32 %6 to i64
  %8 = shl nuw nsw i64 %7, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %arg058, i64 %8
  %scevgep76 = getelementptr i8, ptr addrspace(1) %arg568, i64 %8
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %y_in_tile.loop_exit, %reduction_write_output-true
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %x_in_tile-after
  %lsr.iv77 = phi ptr addrspace(1) [ %scevgep76, %entry ], [ %scevgep78, %x_in_tile-after ]
  %lsr.iv74 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep75, %x_in_tile-after ]
  %lsr.iv72 = phi i32 [ %6, %entry ], [ %lsr.iv.next73, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %3, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.054 = phi float [ -0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %9 = icmp ult i32 %thread_id.x, 30
  br i1 %9, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %concatenate.5.merge9, %y_in_tile.loop_body
  %partial_reduction_result.1 = phi float [ %add.18.i53, %concatenate.5.merge9 ], [ %partial_reduction_result.054, %y_in_tile.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %lsr.iv.next73 = add nuw nsw i32 %lsr.iv72, 960
  %scevgep75 = getelementptr i8, ptr addrspace(1) %lsr.iv74, i64 3840
  %scevgep78 = getelementptr i8, ptr addrspace(1) %lsr.iv77, i64 3840
  %10 = icmp ugt i32 %lsr.iv.next, 95
  br i1 %10, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after
  %11 = zext i32 %thread_id.x to i64
  %12 = zext i32 %thread_id.y43 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache1, i64 0, i64 0, i64 0, i64 %11, i64 %12
  store float %partial_reduction_result.1, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache1, i64 0, i64 0, i64 0, i64 %12, i64 %11
  %partial_reduction_result29 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %13 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result29, i32 16, i32 31)
  %add.18.i = fadd float %partial_reduction_result29, %13
  %14 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.18.i, i32 8, i32 31)
  %add.18.i49 = fadd float %add.18.i, %14
  %15 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.18.i49, i32 4, i32 31)
  %add.18.i50 = fadd float %add.18.i49, %15
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.18.i50, i32 2, i32 31)
  %add.18.i51 = fadd float %add.18.i50, %16
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.18.i51, i32 1, i32 31)
  %add.18.i52 = fadd float %add.18.i51, %17
  store float %add.18.i52, ptr addrspace(3) %shmem_transposed_addr, align 4
  %18 = icmp ult i32 %1, 960
  %19 = icmp eq i32 %thread_id.x, 0
  %20 = and i1 %18, %19
  br i1 %20, label %reduction_write_output-true, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %.frozen = freeze i32 %lsr.iv72
  %21 = udiv i32 %.frozen, 30
  %22 = mul i32 %21, 30
  %.decomposed = sub i32 %.frozen, %22
  %23 = icmp ult i32 %.decomposed, 13
  br i1 %23, label %concatenate.pivot.0., label %concatenate.pivot.13.5

concatenate.pivot.0.:                             ; preds = %x_in_tile-true
  %24 = mul nuw nsw i32 %21, 13
  %25 = add nuw nsw i32 %24, %.decomposed
  %26 = zext i32 %25 to i64
  %Arg_2.3 = getelementptr inbounds float, ptr addrspace(1) %arg262, i64 %26
  br label %concatenate.5.merge

concatenate.pivot.13.5:                           ; preds = %x_in_tile-true
  %27 = mul nuw nsw i32 %21, 17
  %28 = sext i32 %27 to i64
  %29 = sext i32 %.decomposed to i64
  %30 = add i64 %29, %28
  %31 = getelementptr float, ptr addrspace(1) %arg364, i64 %30
  %Arg_3.470 = getelementptr inbounds float, ptr addrspace(1) %31, i64 -13
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.13.5, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %Arg_2.3, %concatenate.pivot.0. ], [ %Arg_3.470, %concatenate.pivot.13.5 ]
  %32 = icmp ult i32 %.decomposed, 13
  %33 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !63
  %multiply.7 = fmul float %33, %Arg_1.2
  %Arg_0.16 = load float, ptr addrspace(1) %lsr.iv74, align 4, !invariant.load !63
  %multiply.8 = fmul float %multiply.7, %Arg_0.16
  %subtract.11 = fsub float 1.000000e+00, %Arg_0.16
  %multiply.12 = fmul float %multiply.8, %subtract.11
  %add.18.i53 = fadd float %partial_reduction_result.054, %multiply.12
  br i1 %32, label %concatenate.pivot.0.17, label %concatenate.pivot.13.18

concatenate.pivot.0.17:                           ; preds = %concatenate.5.merge
  %34 = mul nuw nsw i32 %21, 13
  %35 = add nuw nsw i32 %34, %.decomposed
  %36 = zext i32 %35 to i64
  %Arg_2.311 = getelementptr inbounds float, ptr addrspace(1) %arg262, i64 %36
  br label %concatenate.5.merge9

concatenate.pivot.13.18:                          ; preds = %concatenate.5.merge
  %37 = mul nuw nsw i32 %21, 17
  %38 = sext i32 %37 to i64
  %39 = sext i32 %.decomposed to i64
  %40 = add i64 %39, %38
  %41 = getelementptr float, ptr addrspace(1) %arg364, i64 %40
  %Arg_3.41471 = getelementptr inbounds float, ptr addrspace(1) %41, i64 -13
  br label %concatenate.5.merge9

concatenate.5.merge9:                             ; preds = %concatenate.pivot.13.18, %concatenate.pivot.0.17
  %.in44 = phi ptr addrspace(1) [ %Arg_2.311, %concatenate.pivot.0.17 ], [ %Arg_3.41471, %concatenate.pivot.13.18 ]
  %42 = load float, ptr addrspace(1) %.in44, align 4, !invariant.load !63
  %multiply.720 = fmul float %Arg_1.2, %42
  %multiply.823 = fmul float %Arg_0.16, %multiply.720
  %multiply.1228 = fmul float %subtract.11, %multiply.823
  store float %multiply.1228, ptr addrspace(1) %lsr.iv77, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %43 = mul nuw nsw i32 %0, 30
  %44 = add nuw nsw i32 %43, %thread_id.y43
  %.frozen56 = freeze i32 %44
  %45 = udiv i32 %.frozen56, 30
  %46 = mul i32 %45, 30
  %.decomposed57 = sub i32 %.frozen56, %46
  %47 = zext i32 %45 to i64
  %48 = zext i32 %.decomposed57 to i64
  %output_element_address = getelementptr inbounds [64 x [30 x float]], ptr addrspace(1) %arg466, i64 0, i64 %47, i64 %48
  store float %add.18.i52, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_14(ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(16777216) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(16777216) %arg3) local_unnamed_addr #3 {
entry:
  %arg397 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg295 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg193 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg091 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !67
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %thread_id.x = and i32 %1, 31
  %thread_id.y64 = lshr i32 %1, 5
  %2 = lshr i32 %0, 3
  %3 = shl nuw nsw i32 %0, 6
  %tile_origin.2 = and i32 %3, 448
  %4 = shl nuw nsw i32 %thread_id.x, 1
  %5 = shl nuw nsw i32 %2, 16
  %6 = shl nuw nsw i32 %thread_id.y64, 9
  %7 = add i32 %6, %tile_origin.2
  %8 = add i32 %7, %4
  %9 = add i32 %5, %6
  %10 = add i32 %9, %tile_origin.2
  %11 = add i32 %10, %4
  %12 = add i32 %11, 1
  %13 = lshr i32 %12, 9
  %14 = lshr i32 %11, 9
  %15 = zext i32 %11 to i64
  %16 = shl nuw nsw i64 %15, 2
  %17 = add nuw nsw i64 %16, 4
  %scevgep = getelementptr i8, ptr addrspace(1) %arg193, i64 %17
  %scevgep109 = getelementptr i8, ptr addrspace(1) %arg091, i64 %17
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after, %reduction_write_output-true59
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %y_in_tile.loop_body
  %lsr.iv110 = phi ptr addrspace(1) [ %scevgep109, %entry ], [ %scevgep111, %y_in_tile.loop_body ]
  %lsr.iv106 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep107, %y_in_tile.loop_body ]
  %lsr.iv104 = phi i32 [ %8, %entry ], [ %lsr.iv.next105, %y_in_tile.loop_body ]
  %lsr.iv = phi i32 [ 0, %entry ], [ %lsr.iv.next, %y_in_tile.loop_body ]
  %partial_reduction_result63.sroa.4.088 = phi float [ -0.000000e+00, %entry ], [ %add.12.i76, %y_in_tile.loop_body ]
  %partial_reduction_result63.sroa.0.087 = phi float [ -0.000000e+00, %entry ], [ %add.12.i, %y_in_tile.loop_body ]
  %18 = add i32 %thread_id.y64, %lsr.iv
  %19 = and i32 %lsr.iv104, 510
  %20 = add i32 %14, %lsr.iv
  %21 = and i32 %20, 8388480
  %22 = or i32 %21, %18
  %23 = zext i32 %22 to i64
  %24 = zext i32 %19 to i64
  %Arg_1.2 = getelementptr inbounds [8192 x [512 x float]], ptr addrspace(1) %arg193, i64 0, i64 %23, i64 %24
  %Arg_1.23 = load float, ptr addrspace(1) %Arg_1.2, align 8, !invariant.load !63
  %compare.5 = fcmp ogt float %Arg_1.23, 0.000000e+00
  %Arg_0.1 = getelementptr inbounds [8192 x [512 x float]], ptr addrspace(1) %arg091, i64 0, i64 %23, i64 %24
  %Arg_0.14 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !63
  %25 = select i1 %compare.5, float %Arg_0.14, float 0.000000e+00
  %add.12.i = fadd float %partial_reduction_result63.sroa.0.087, %25
  %scevgep108 = getelementptr i8, ptr addrspace(1) %lsr.iv106, i64 -4
  %26 = load <2 x float>, ptr addrspace(1) %scevgep108, align 8, !invariant.load !63
  %Arg_1.26113 = extractelement <2 x float> %26, i32 0
  %Arg_1.222114 = extractelement <2 x float> %26, i32 1
  %compare.58 = fcmp ogt float %Arg_1.26113, 0.000000e+00
  %scevgep112 = getelementptr i8, ptr addrspace(1) %lsr.iv110, i64 -4
  %27 = load <2 x float>, ptr addrspace(1) %scevgep112, align 8, !invariant.load !63
  %Arg_0.110115 = extractelement <2 x float> %27, i32 0
  %Arg_0.126116 = extractelement <2 x float> %27, i32 1
  %28 = select i1 %compare.58, float %Arg_0.110115, float 0.000000e+00
  %29 = getelementptr inbounds [8192 x [512 x float]], ptr addrspace(1) %arg397, i64 0, i64 %23, i64 %24
  store float %28, ptr addrspace(1) %29, align 8
  %30 = add i32 %lsr.iv104, 1
  %31 = and i32 %30, 511
  %32 = add i32 %13, %lsr.iv
  %33 = and i32 %32, 8388480
  %34 = or i32 %33, %18
  %35 = zext i32 %34 to i64
  %36 = zext i32 %31 to i64
  %Arg_1.214 = getelementptr inbounds [8192 x [512 x float]], ptr addrspace(1) %arg193, i64 0, i64 %35, i64 %36
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !63
  %compare.517 = fcmp ogt float %Arg_1.215, 0.000000e+00
  %Arg_0.118 = getelementptr inbounds [8192 x [512 x float]], ptr addrspace(1) %arg091, i64 0, i64 %35, i64 %36
  %Arg_0.119 = load float, ptr addrspace(1) %Arg_0.118, align 4, !invariant.load !63
  %37 = select i1 %compare.517, float %Arg_0.119, float 0.000000e+00
  %add.12.i76 = fadd float %partial_reduction_result63.sroa.4.088, %37
  %compare.524 = fcmp ogt float %Arg_1.222114, 0.000000e+00
  %38 = select i1 %compare.524, float %Arg_0.126116, float 0.000000e+00
  %39 = getelementptr inbounds [8192 x [512 x float]], ptr addrspace(1) %arg397, i64 0, i64 %35, i64 %36
  store float %38, ptr addrspace(1) %39, align 4
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 32
  %40 = add i32 %thread_id.y64, %lsr.iv.next
  %41 = add i32 %40, -32
  %lsr.iv.next105 = add nuw nsw i32 %lsr.iv104, 16384
  %scevgep107 = getelementptr i8, ptr addrspace(1) %lsr.iv106, i64 65536
  %scevgep111 = getelementptr i8, ptr addrspace(1) %lsr.iv110, i64 65536
  %42 = icmp ugt i32 %41, 95
  br i1 %42, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %43 = zext i32 %thread_id.x to i64
  %44 = zext i32 %thread_id.y64 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %43, i64 %44
  store float %add.12.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %44, i64 %43
  %partial_reduction_result27 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %45 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 16, i32 31)
  %add.12.i77 = fadd float %partial_reduction_result27, %45
  %46 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i77, i32 8, i32 31)
  %add.12.i78 = fadd float %add.12.i77, %46
  %47 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i78, i32 4, i32 31)
  %add.12.i79 = fadd float %add.12.i78, %47
  %48 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i79, i32 2, i32 31)
  %add.12.i80 = fadd float %add.12.i79, %48
  %49 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i80, i32 1, i32 31)
  %add.12.i81 = fadd float %add.12.i80, %49
  store float %add.12.i81, ptr addrspace(3) %shmem_transposed_addr, align 4
  %50 = shl nuw nsw i32 %thread_id.y64, 1
  %51 = icmp eq i32 %thread_id.x, 0
  %52 = zext i32 %2 to i64
  %53 = or i32 %50, %tile_origin.2
  %54 = zext i32 %53 to i64
  %output_element_address = getelementptr inbounds [64 x [512 x float]], ptr addrspace(1) %arg295, i64 0, i64 %52, i64 %54
  br i1 %51, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %55 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address41101 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.12.i76, ptr addrspace(3) %shmem_output_address41101, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr43102 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result45 = load float, ptr addrspace(3) %shmem_transposed_addr43102, align 4
  %56 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result45, i32 16, i32 31)
  %add.12.i82 = fadd float %partial_reduction_result45, %56
  %57 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i82, i32 8, i32 31)
  %add.12.i83 = fadd float %add.12.i82, %57
  %58 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i83, i32 4, i32 31)
  %add.12.i84 = fadd float %add.12.i83, %58
  %59 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i84, i32 2, i32 31)
  %add.12.i85 = fadd float %add.12.i84, %59
  %60 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i85, i32 1, i32 31)
  %add.12.i86 = fadd float %add.12.i85, %60
  store float %add.12.i86, ptr addrspace(3) %shmem_transposed_addr43102, align 4
  br i1 %55, label %reduction_write_output-true59, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.12.i81, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true59:                    ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.12.i86, ptr addrspace(1) %sunkaddr, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg0, ptr noalias nocapture align 128 dereferenceable(262144) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg3, ptr noalias nocapture align 128 dereferenceable(262144) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg5, ptr noalias nocapture align 128 dereferenceable(262144) %arg6) local_unnamed_addr #5 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !65
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !63
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.9 = fmul float %6, %8
  %subtract.10 = fsub float %5, %multiply.9
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !63
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4
  %multiply.11 = fmul float %6, %12
  %subtract.12 = fsub float %10, %multiply.11
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %3
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !63
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg613, i64 %3
  %16 = load float, ptr addrspace(1) %15, align 4
  %multiply.13 = fmul float %6, %16
  %subtract.14 = fsub float %14, %multiply.13
  store float %subtract.10, ptr addrspace(1) %15, align 4
  store float %subtract.12, ptr addrspace(1) %11, align 4
  store float %subtract.14, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_11(ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg0, ptr noalias nocapture align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg3, ptr noalias nocapture align 128 dereferenceable(131072) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg5, ptr noalias nocapture align 128 dereferenceable(131072) %arg6) local_unnamed_addr #5 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !68
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !63
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.9 = fmul float %6, %8
  %subtract.10 = fsub float %5, %multiply.9
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !63
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4
  %multiply.11 = fmul float %6, %12
  %subtract.12 = fsub float %10, %multiply.11
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %3
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !63
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg613, i64 %3
  %16 = load float, ptr addrspace(1) %15, align 4
  %multiply.13 = fmul float %6, %16
  %subtract.14 = fsub float %14, %multiply.13
  store float %subtract.10, ptr addrspace(1) %15, align 4
  store float %subtract.12, ptr addrspace(1) %11, align 4
  store float %subtract.14, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_25(ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(557056) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg4, ptr noalias nocapture align 128 dereferenceable(2097152) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg6, ptr noalias nocapture align 128 dereferenceable(2097152) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg8) local_unnamed_addr #5 {
entry:
  %arg838 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg736 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg634 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg532 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg430 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg328 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg226 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg124 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg022 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !67
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !69
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 6
  %5 = and i32 %3, 56
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = zext i32 %linear_index_base to i64
  %7 = getelementptr float, ptr addrspace(1) %arg022, i64 %6
  %8 = load <4 x float>, ptr addrspace(1) %7, align 16, !invariant.load !63
  %9 = extractelement <4 x float> %8, i32 0
  %10 = extractelement <4 x float> %8, i32 1
  %11 = extractelement <4 x float> %8, i32 2
  %12 = extractelement <4 x float> %8, i32 3
  %13 = load float, ptr addrspace(1) %arg124, align 16, !invariant.load !63
  %14 = add nuw nsw i32 %5, 48
  %15 = and i32 %3, 4
  %16 = lshr exact i32 %14, 3
  %17 = zext i32 %4 to i64
  %18 = zext i32 %14 to i64
  %19 = zext i32 %15 to i64
  %20 = add i64 %19, %18
  %21 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg328, i64 0, i64 %17, i64 %20
  %22 = getelementptr inbounds float, ptr addrspace(1) %21, i64 832
  %23 = load <2 x float>, ptr addrspace(1) %22, align 16, !invariant.load !63
  %24 = extractelement <2 x float> %23, i32 0
  %25 = extractelement <2 x float> %23, i32 1
  %26 = zext i32 %16 to i64
  %27 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg226, i64 0, i64 %17, i64 %26, i64 0
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !63
  %multiply.14 = fmul float %24, %28
  %multiply.17 = fmul float %13, %multiply.14
  %subtract.18 = fsub float %9, %multiply.17
  %29 = getelementptr float, ptr addrspace(1) %arg430, i64 %6
  %30 = load <4 x float>, ptr addrspace(1) %29, align 16, !invariant.load !63
  %31 = extractelement <4 x float> %30, i32 0
  %32 = extractelement <4 x float> %30, i32 1
  %33 = extractelement <4 x float> %30, i32 2
  %34 = extractelement <4 x float> %30, i32 3
  %35 = getelementptr float, ptr addrspace(1) %arg532, i64 %6
  %36 = load <4 x float>, ptr addrspace(1) %35, align 16
  %37 = extractelement <4 x float> %36, i32 0
  %38 = extractelement <4 x float> %36, i32 1
  %39 = extractelement <4 x float> %36, i32 2
  %40 = extractelement <4 x float> %36, i32 3
  %multiply.19 = fmul float %13, %37
  %subtract.20 = fsub float %31, %multiply.19
  %41 = getelementptr float, ptr addrspace(1) %arg634, i64 %6
  %42 = load <4 x float>, ptr addrspace(1) %41, align 16, !invariant.load !63
  %43 = extractelement <4 x float> %42, i32 0
  %44 = extractelement <4 x float> %42, i32 1
  %45 = extractelement <4 x float> %42, i32 2
  %46 = extractelement <4 x float> %42, i32 3
  %47 = getelementptr float, ptr addrspace(1) %arg736, i64 %6
  %48 = load <4 x float>, ptr addrspace(1) %47, align 16
  %49 = extractelement <4 x float> %48, i32 0
  %50 = extractelement <4 x float> %48, i32 1
  %51 = extractelement <4 x float> %48, i32 2
  %52 = extractelement <4 x float> %48, i32 3
  %multiply.21 = fmul float %13, %49
  %subtract.22 = fsub float %43, %multiply.21
  %53 = getelementptr float, ptr addrspace(1) %arg838, i64 %6
  %54 = and i32 %linear_index1, 5
  %55 = zext i32 %54 to i64
  %56 = zext i32 %5 to i64
  %57 = add i64 %56, %55
  %58 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg328, i64 0, i64 %17, i64 %57
  %multiply.141 = fmul float %28, %25
  %multiply.172 = fmul float %13, %multiply.141
  %subtract.183 = fsub float %10, %multiply.172
  %multiply.194 = fmul float %13, %38
  %subtract.205 = fsub float %32, %multiply.194
  %multiply.216 = fmul float %13, %50
  %subtract.227 = fsub float %44, %multiply.216
  %59 = and i32 %linear_index2, 6
  %60 = zext i32 %59 to i64
  %61 = add i64 %56, %60
  %62 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg328, i64 0, i64 %17, i64 %61
  %63 = getelementptr inbounds float, ptr addrspace(1) %62, i64 880
  %64 = load float, ptr addrspace(1) %63, align 8, !invariant.load !63
  %multiply.148 = fmul float %28, %64
  %multiply.179 = fmul float %13, %multiply.148
  %subtract.1810 = fsub float %11, %multiply.179
  %multiply.1911 = fmul float %13, %39
  %subtract.2012 = fsub float %33, %multiply.1911
  %multiply.2113 = fmul float %13, %51
  %subtract.2214 = fsub float %45, %multiply.2113
  %65 = and i32 %linear_index3, 7
  %66 = zext i32 %65 to i64
  %67 = add i64 %56, %66
  %68 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg328, i64 0, i64 %17, i64 %67
  %69 = getelementptr inbounds float, ptr addrspace(1) %68, i64 880
  %70 = load float, ptr addrspace(1) %69, align 4, !invariant.load !63
  %multiply.1415 = fmul float %28, %70
  %multiply.1716 = fmul float %13, %multiply.1415
  %subtract.1817 = fsub float %12, %multiply.1716
  %multiply.1918 = fmul float %13, %40
  %subtract.2019 = fsub float %34, %multiply.1918
  %multiply.2120 = fmul float %13, %52
  %subtract.2221 = fsub float %46, %multiply.2120
  %71 = insertelement <4 x float> poison, float %subtract.18, i32 0
  %72 = insertelement <4 x float> %71, float %subtract.183, i32 1
  %73 = insertelement <4 x float> %72, float %subtract.1810, i32 2
  %74 = insertelement <4 x float> %73, float %subtract.1817, i32 3
  store <4 x float> %74, ptr addrspace(1) %53, align 16
  %75 = insertelement <4 x float> poison, float %subtract.20, i32 0
  %76 = insertelement <4 x float> %75, float %subtract.205, i32 1
  %77 = insertelement <4 x float> %76, float %subtract.2012, i32 2
  %78 = insertelement <4 x float> %77, float %subtract.2019, i32 3
  store <4 x float> %78, ptr addrspace(1) %47, align 16
  %79 = insertelement <4 x float> poison, float %subtract.22, i32 0
  %80 = insertelement <4 x float> %79, float %subtract.227, i32 1
  %81 = insertelement <4 x float> %80, float %subtract.2214, i32 2
  %82 = insertelement <4 x float> %81, float %subtract.2221, i32 3
  store <4 x float> %82, ptr addrspace(1) %35, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion_44(ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(16384) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(16384) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg7) local_unnamed_addr #3 {
entry:
  %arg7285 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6283 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5281 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4279 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3277 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2275 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1273 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0271 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !65
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %thread_id.x = and i32 %1, 31
  %thread_id.y217 = lshr i32 %1, 5
  %2 = shl nuw nsw i32 %thread_id.x, 1
  %3 = shl nuw nsw i32 %0, 13
  %4 = zext i32 %2 to i64
  %5 = zext i32 %0 to i64
  %6 = shl nuw nsw i64 %5, 15
  %7 = shl nuw nsw i32 %thread_id.y217, 6
  %8 = add i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = shl nuw nsw i64 %9, 2
  %11 = add i64 %6, %10
  %12 = add i64 %11, 4
  %13 = add i32 %3, %7
  %14 = add i32 %13, %2
  %15 = add i32 %14, 1
  %16 = lshr i32 %15, 6
  %17 = zext i32 %14 to i64
  %18 = shl nuw nsw i64 %17, 2
  %19 = lshr i32 %14, 6
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after190, %reduction_write_output-true211
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %y_in_tile.loop_body
  %lsr.iv300 = phi i64 [ %18, %entry ], [ %lsr.iv.next301, %y_in_tile.loop_body ]
  %lsr.iv297 = phi i64 [ %12, %entry ], [ %lsr.iv.next298, %y_in_tile.loop_body ]
  %lsr.iv = phi i32 [ 0, %entry ], [ %lsr.iv.next, %y_in_tile.loop_body ]
  %partial_reduction_result2215.sroa.4.0266 = phi float [ -0.000000e+00, %entry ], [ %add.31.i242, %y_in_tile.loop_body ]
  %partial_reduction_result216.sroa.0.0265 = phi float [ -0.000000e+00, %entry ], [ %add.22.i, %y_in_tile.loop_body ]
  %partial_reduction_result216.sroa.4.0264 = phi float [ -0.000000e+00, %entry ], [ %add.22.i241, %y_in_tile.loop_body ]
  %partial_reduction_result2215.sroa.0.0263 = phi float [ -0.000000e+00, %entry ], [ %add.31.i, %y_in_tile.loop_body ]
  %20 = add i32 %thread_id.y217, %lsr.iv
  %21 = add i32 %19, %lsr.iv
  %22 = and i32 %21, 67108736
  %23 = or i32 %22, %20
  %24 = zext i32 %23 to i64
  %Arg_3.4 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg3277, i64 0, i64 %24, i64 %4
  %Arg_3.46 = load float, ptr addrspace(1) %Arg_3.4, align 8, !invariant.load !63
  %compare.7 = fcmp ogt float %Arg_3.46, 0.000000e+00
  %Arg_2.3 = getelementptr inbounds [8192 x [1 x float]], ptr addrspace(1) %arg2275, i64 0, i64 %24, i64 0
  %Arg_2.37 = load float, ptr addrspace(1) %Arg_2.3, align 4, !invariant.load !63
  %Arg_1.2 = getelementptr inbounds [8192 x [1 x float]], ptr addrspace(1) %arg1273, i64 0, i64 %24, i64 0
  %Arg_1.28 = load float, ptr addrspace(1) %Arg_1.2, align 4, !invariant.load !63
  %multiply.8 = fmul float %Arg_2.37, %Arg_1.28
  %subtract.11 = fsub float 1.000000e+00, %Arg_1.28
  %multiply.12 = fmul float %multiply.8, %subtract.11
  %Arg_0.1 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg0271, i64 0, i64 %24, i64 %4
  %Arg_0.111 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !63
  %multiply.15 = fmul float %Arg_0.111, %multiply.12
  %25 = select i1 %compare.7, float %multiply.15, float 0.000000e+00
  %add.22.i = fadd float %partial_reduction_result216.sroa.0.0265, %25
  %compare.24 = fcmp ogt float %Arg_0.111, 0.000000e+00
  %multiply.25 = fmul float %Arg_3.46, %multiply.12
  %26 = select i1 %compare.24, float %multiply.25, float 0.000000e+00
  %add.31.i = fadd float %partial_reduction_result2215.sroa.0.0263, %26
  %scevgep302 = getelementptr i8, ptr addrspace(1) %arg3277, i64 %lsr.iv300
  %Arg_3.429 = load float, ptr addrspace(1) %scevgep302, align 8, !invariant.load !63
  %compare.731 = fcmp ogt float %Arg_3.429, 0.000000e+00
  %scevgep303 = getelementptr i8, ptr addrspace(1) %arg0271, i64 %lsr.iv300
  %Arg_0.143 = load float, ptr addrspace(1) %scevgep303, align 8, !invariant.load !63
  %multiply.1544 = fmul float %multiply.12, %Arg_0.143
  %27 = select i1 %compare.731, float %multiply.1544, float 0.000000e+00
  %compare.2448 = fcmp ogt float %Arg_0.143, 0.000000e+00
  %multiply.2561 = fmul float %multiply.12, %Arg_3.429
  %28 = select i1 %compare.2448, float %multiply.2561, float 0.000000e+00
  %29 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg7285, i64 0, i64 %24, i64 %4
  store float %28, ptr addrspace(1) %29, align 8
  %30 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg5281, i64 0, i64 %24, i64 %4
  store float %27, ptr addrspace(1) %30, align 8
  %31 = add i32 %16, %lsr.iv
  %32 = and i32 %31, 67108736
  %33 = or i32 %32, %20
  %34 = zext i32 %33 to i64
  %35 = getelementptr [8192 x [64 x float]], ptr addrspace(1) %arg3277, i64 0, i64 %34, i64 %4
  %Arg_3.465287 = getelementptr inbounds float, ptr addrspace(1) %35, i64 1
  %Arg_3.466 = load float, ptr addrspace(1) %Arg_3.465287, align 4, !invariant.load !63
  %compare.768 = fcmp ogt float %Arg_3.466, 0.000000e+00
  %Arg_2.369 = getelementptr inbounds [8192 x [1 x float]], ptr addrspace(1) %arg2275, i64 0, i64 %34, i64 0
  %Arg_2.370 = load float, ptr addrspace(1) %Arg_2.369, align 4, !invariant.load !63
  %Arg_1.271 = getelementptr inbounds [8192 x [1 x float]], ptr addrspace(1) %arg1273, i64 0, i64 %34, i64 0
  %Arg_1.272 = load float, ptr addrspace(1) %Arg_1.271, align 4, !invariant.load !63
  %multiply.873 = fmul float %Arg_2.370, %Arg_1.272
  %subtract.1177 = fsub float 1.000000e+00, %Arg_1.272
  %multiply.1278 = fmul float %multiply.873, %subtract.1177
  %36 = getelementptr [8192 x [64 x float]], ptr addrspace(1) %arg0271, i64 0, i64 %34, i64 %4
  %Arg_0.179288 = getelementptr inbounds float, ptr addrspace(1) %36, i64 1
  %Arg_0.180 = load float, ptr addrspace(1) %Arg_0.179288, align 4, !invariant.load !63
  %multiply.1581 = fmul float %Arg_0.180, %multiply.1278
  %37 = select i1 %compare.768, float %multiply.1581, float 0.000000e+00
  %add.22.i241 = fadd float %partial_reduction_result216.sroa.4.0264, %37
  %compare.2486 = fcmp ogt float %Arg_0.180, 0.000000e+00
  %multiply.2599 = fmul float %Arg_3.466, %multiply.1278
  %38 = select i1 %compare.2486, float %multiply.2599, float 0.000000e+00
  %add.31.i242 = fadd float %partial_reduction_result2215.sroa.4.0266, %38
  %scevgep299 = getelementptr i8, ptr addrspace(1) %arg3277, i64 %lsr.iv297
  %Arg_3.4102 = load float, ptr addrspace(1) %scevgep299, align 4, !invariant.load !63
  %compare.7104 = fcmp ogt float %Arg_3.4102, 0.000000e+00
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0271, i64 %lsr.iv297
  %Arg_0.1116 = load float, ptr addrspace(1) %scevgep, align 4, !invariant.load !63
  %multiply.15117 = fmul float %multiply.1278, %Arg_0.1116
  %39 = select i1 %compare.7104, float %multiply.15117, float 0.000000e+00
  %compare.24121 = fcmp ogt float %Arg_0.1116, 0.000000e+00
  %multiply.25134 = fmul float %multiply.1278, %Arg_3.4102
  %40 = select i1 %compare.24121, float %multiply.25134, float 0.000000e+00
  %41 = getelementptr [8192 x [64 x float]], ptr addrspace(1) %arg7285, i64 0, i64 %34, i64 %4
  %42 = getelementptr inbounds float, ptr addrspace(1) %41, i64 1
  store float %40, ptr addrspace(1) %42, align 4
  %43 = getelementptr [8192 x [64 x float]], ptr addrspace(1) %arg5281, i64 0, i64 %34, i64 %4
  %44 = getelementptr inbounds float, ptr addrspace(1) %43, i64 1
  store float %39, ptr addrspace(1) %44, align 4
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 32
  %45 = add i32 %thread_id.y217, %lsr.iv.next
  %46 = add i32 %45, -32
  %lsr.iv.next298 = add i64 %lsr.iv297, 8192
  %lsr.iv.next301 = add nuw nsw i64 %lsr.iv300, 8192
  %47 = icmp ugt i32 %46, 95
  br i1 %47, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %48 = zext i32 %thread_id.x to i64
  %49 = zext i32 %thread_id.y217 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %48, i64 %49
  store float %add.22.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %49, i64 %48
  %partial_reduction_result135 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %50 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result135, i32 16, i32 31)
  %add.22.i243 = fadd float %partial_reduction_result135, %50
  %51 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i243, i32 8, i32 31)
  %add.22.i244 = fadd float %add.22.i243, %51
  %52 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i244, i32 4, i32 31)
  %add.22.i245 = fadd float %add.22.i244, %52
  %53 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i245, i32 2, i32 31)
  %add.22.i246 = fadd float %add.22.i245, %53
  %54 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i246, i32 1, i32 31)
  %add.22.i247 = fadd float %add.22.i246, %54
  store float %add.22.i247, ptr addrspace(3) %shmem_transposed_addr, align 4
  %55 = shl nuw nsw i32 %thread_id.y217, 1
  %56 = icmp eq i32 %thread_id.x, 0
  %57 = zext i32 %55 to i64
  %output_element_address = getelementptr inbounds [64 x [64 x float]], ptr addrspace(1) %arg4279, i64 0, i64 %5, i64 %57
  br i1 %56, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %58 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address149291 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.22.i241, ptr addrspace(3) %shmem_output_address149291, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr151292 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result153 = load float, ptr addrspace(3) %shmem_transposed_addr151292, align 4
  %59 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result153, i32 16, i32 31)
  %add.22.i248 = fadd float %partial_reduction_result153, %59
  %60 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i248, i32 8, i32 31)
  %add.22.i249 = fadd float %add.22.i248, %60
  %61 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i249, i32 4, i32 31)
  %add.22.i250 = fadd float %add.22.i249, %61
  %62 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i250, i32 2, i32 31)
  %add.22.i251 = fadd float %add.22.i250, %62
  %63 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i251, i32 1, i32 31)
  %add.22.i252 = fadd float %add.22.i251, %63
  store float %add.22.i252, ptr addrspace(3) %shmem_transposed_addr151292, align 4
  br i1 %58, label %reduction_write_output-true167, label %reduction_write_output-after168

reduction_write_output-after168:                  ; preds = %reduction_write_output-true167, %reduction_write_output-after
  %64 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address171 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i64 0, i64 0, i64 0, i64 %48, i64 %49
  store float %add.31.i, ptr addrspace(3) %shmem_output_address171, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr173 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i64 0, i64 0, i64 0, i64 %49, i64 %48
  %partial_reduction_result175 = load float, ptr addrspace(3) %shmem_transposed_addr173, align 4
  %65 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result175, i32 16, i32 31)
  %add.31.i253 = fadd float %partial_reduction_result175, %65
  %66 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.31.i253, i32 8, i32 31)
  %add.31.i254 = fadd float %add.31.i253, %66
  %67 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.31.i254, i32 4, i32 31)
  %add.31.i255 = fadd float %add.31.i254, %67
  %68 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.31.i255, i32 2, i32 31)
  %add.31.i256 = fadd float %add.31.i255, %68
  %69 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.31.i256, i32 1, i32 31)
  %add.31.i257 = fadd float %add.31.i256, %69
  store float %add.31.i257, ptr addrspace(3) %shmem_transposed_addr173, align 4
  %output_element_address191 = getelementptr inbounds [64 x [64 x float]], ptr addrspace(1) %arg6283, i64 0, i64 %5, i64 %57
  br i1 %64, label %reduction_write_output-true189, label %reduction_write_output-after190

reduction_write_output-after190:                  ; preds = %reduction_write_output-true189, %reduction_write_output-after168
  %70 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address193293 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address171, i64 1056
  store float %add.31.i242, ptr addrspace(3) %shmem_output_address193293, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr195294 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr173, i64 1056
  %partial_reduction_result197 = load float, ptr addrspace(3) %shmem_transposed_addr195294, align 4
  %71 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result197, i32 16, i32 31)
  %add.31.i258 = fadd float %partial_reduction_result197, %71
  %72 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.31.i258, i32 8, i32 31)
  %add.31.i259 = fadd float %add.31.i258, %72
  %73 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.31.i259, i32 4, i32 31)
  %add.31.i260 = fadd float %add.31.i259, %73
  %74 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.31.i260, i32 2, i32 31)
  %add.31.i261 = fadd float %add.31.i260, %74
  %75 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.31.i261, i32 1, i32 31)
  %add.31.i262 = fadd float %add.31.i261, %75
  store float %add.31.i262, ptr addrspace(3) %shmem_transposed_addr195294, align 4
  br i1 %70, label %reduction_write_output-true211, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.22.i247, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true167:                   ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.22.i252, ptr addrspace(1) %sunkaddr, align 4
  br label %reduction_write_output-after168

reduction_write_output-true189:                   ; preds = %reduction_write_output-after168
  store float %add.31.i257, ptr addrspace(1) %output_element_address191, align 8
  br label %reduction_write_output-after190

reduction_write_output-true211:                   ; preds = %reduction_write_output-after190
  %sunkaddr304 = getelementptr inbounds i8, ptr addrspace(1) %output_element_address191, i64 4
  store float %add.31.i262, ptr addrspace(1) %sunkaddr304, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_36(ptr noalias nocapture readonly align 128 dereferenceable(4194304) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg3) local_unnamed_addr #3 {
entry:
  %arg397 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg295 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg193 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg091 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !70
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %thread_id.x = and i32 %1, 31
  %thread_id.y64 = lshr i32 %1, 5
  %2 = lshr i32 %0, 1
  %3 = shl nuw nsw i32 %0, 6
  %tile_origin.2 = and i32 %3, 64
  %4 = shl nuw nsw i32 %thread_id.x, 1
  %5 = shl nuw nsw i32 %2, 14
  %6 = shl nuw nsw i32 %thread_id.y64, 7
  %7 = add i32 %6, %tile_origin.2
  %8 = add i32 %7, %4
  %9 = add i32 %5, %6
  %10 = add i32 %9, %tile_origin.2
  %11 = add i32 %10, %4
  %12 = add i32 %11, 1
  %13 = lshr i32 %12, 7
  %14 = lshr i32 %11, 7
  %15 = zext i32 %11 to i64
  %16 = shl nuw nsw i64 %15, 2
  %17 = add nuw nsw i64 %16, 4
  %scevgep = getelementptr i8, ptr addrspace(1) %arg193, i64 %17
  %scevgep109 = getelementptr i8, ptr addrspace(1) %arg091, i64 %17
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after, %reduction_write_output-true59
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %y_in_tile.loop_body
  %lsr.iv110 = phi ptr addrspace(1) [ %scevgep109, %entry ], [ %scevgep111, %y_in_tile.loop_body ]
  %lsr.iv106 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep107, %y_in_tile.loop_body ]
  %lsr.iv104 = phi i32 [ %8, %entry ], [ %lsr.iv.next105, %y_in_tile.loop_body ]
  %lsr.iv = phi i32 [ 0, %entry ], [ %lsr.iv.next, %y_in_tile.loop_body ]
  %partial_reduction_result63.sroa.4.088 = phi float [ -0.000000e+00, %entry ], [ %add.12.i76, %y_in_tile.loop_body ]
  %partial_reduction_result63.sroa.0.087 = phi float [ -0.000000e+00, %entry ], [ %add.12.i, %y_in_tile.loop_body ]
  %18 = add i32 %thread_id.y64, %lsr.iv
  %19 = and i32 %lsr.iv104, 126
  %20 = add i32 %14, %lsr.iv
  %21 = and i32 %20, 33554304
  %22 = or i32 %21, %18
  %23 = zext i32 %22 to i64
  %24 = zext i32 %19 to i64
  %Arg_1.2 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg193, i64 0, i64 %23, i64 %24
  %Arg_1.23 = load float, ptr addrspace(1) %Arg_1.2, align 8, !invariant.load !63
  %compare.5 = fcmp ogt float %Arg_1.23, 0.000000e+00
  %Arg_0.1 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg091, i64 0, i64 %23, i64 %24
  %Arg_0.14 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !63
  %25 = select i1 %compare.5, float %Arg_0.14, float 0.000000e+00
  %add.12.i = fadd float %partial_reduction_result63.sroa.0.087, %25
  %scevgep108 = getelementptr i8, ptr addrspace(1) %lsr.iv106, i64 -4
  %26 = load <2 x float>, ptr addrspace(1) %scevgep108, align 8, !invariant.load !63
  %Arg_1.26113 = extractelement <2 x float> %26, i32 0
  %Arg_1.222114 = extractelement <2 x float> %26, i32 1
  %compare.58 = fcmp ogt float %Arg_1.26113, 0.000000e+00
  %scevgep112 = getelementptr i8, ptr addrspace(1) %lsr.iv110, i64 -4
  %27 = load <2 x float>, ptr addrspace(1) %scevgep112, align 8, !invariant.load !63
  %Arg_0.110115 = extractelement <2 x float> %27, i32 0
  %Arg_0.126116 = extractelement <2 x float> %27, i32 1
  %28 = select i1 %compare.58, float %Arg_0.110115, float 0.000000e+00
  %29 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg397, i64 0, i64 %23, i64 %24
  store float %28, ptr addrspace(1) %29, align 8
  %30 = add i32 %lsr.iv104, 1
  %31 = and i32 %30, 127
  %32 = add i32 %13, %lsr.iv
  %33 = and i32 %32, 33554304
  %34 = or i32 %33, %18
  %35 = zext i32 %34 to i64
  %36 = zext i32 %31 to i64
  %Arg_1.214 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg193, i64 0, i64 %35, i64 %36
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !63
  %compare.517 = fcmp ogt float %Arg_1.215, 0.000000e+00
  %Arg_0.118 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg091, i64 0, i64 %35, i64 %36
  %Arg_0.119 = load float, ptr addrspace(1) %Arg_0.118, align 4, !invariant.load !63
  %37 = select i1 %compare.517, float %Arg_0.119, float 0.000000e+00
  %add.12.i76 = fadd float %partial_reduction_result63.sroa.4.088, %37
  %compare.524 = fcmp ogt float %Arg_1.222114, 0.000000e+00
  %38 = select i1 %compare.524, float %Arg_0.126116, float 0.000000e+00
  %39 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg397, i64 0, i64 %35, i64 %36
  store float %38, ptr addrspace(1) %39, align 4
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 32
  %40 = add i32 %thread_id.y64, %lsr.iv.next
  %41 = add i32 %40, -32
  %lsr.iv.next105 = add nuw nsw i32 %lsr.iv104, 4096
  %scevgep107 = getelementptr i8, ptr addrspace(1) %lsr.iv106, i64 16384
  %scevgep111 = getelementptr i8, ptr addrspace(1) %lsr.iv110, i64 16384
  %42 = icmp ugt i32 %41, 95
  br i1 %42, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %43 = zext i32 %thread_id.x to i64
  %44 = zext i32 %thread_id.y64 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i64 0, i64 0, i64 0, i64 %43, i64 %44
  store float %add.12.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i64 0, i64 0, i64 0, i64 %44, i64 %43
  %partial_reduction_result27 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %45 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 16, i32 31)
  %add.12.i77 = fadd float %partial_reduction_result27, %45
  %46 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i77, i32 8, i32 31)
  %add.12.i78 = fadd float %add.12.i77, %46
  %47 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i78, i32 4, i32 31)
  %add.12.i79 = fadd float %add.12.i78, %47
  %48 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i79, i32 2, i32 31)
  %add.12.i80 = fadd float %add.12.i79, %48
  %49 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i80, i32 1, i32 31)
  %add.12.i81 = fadd float %add.12.i80, %49
  store float %add.12.i81, ptr addrspace(3) %shmem_transposed_addr, align 4
  %50 = shl nuw nsw i32 %thread_id.y64, 1
  %51 = icmp eq i32 %thread_id.x, 0
  %52 = zext i32 %2 to i64
  %53 = or i32 %50, %tile_origin.2
  %54 = zext i32 %53 to i64
  %output_element_address = getelementptr inbounds [64 x [128 x float]], ptr addrspace(1) %arg295, i64 0, i64 %52, i64 %54
  br i1 %51, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %55 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address41101 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.12.i76, ptr addrspace(3) %shmem_output_address41101, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr43102 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result45 = load float, ptr addrspace(3) %shmem_transposed_addr43102, align 4
  %56 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result45, i32 16, i32 31)
  %add.12.i82 = fadd float %partial_reduction_result45, %56
  %57 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i82, i32 8, i32 31)
  %add.12.i83 = fadd float %add.12.i82, %57
  %58 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i83, i32 4, i32 31)
  %add.12.i84 = fadd float %add.12.i83, %58
  %59 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i84, i32 2, i32 31)
  %add.12.i85 = fadd float %add.12.i84, %59
  %60 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i85, i32 1, i32 31)
  %add.12.i86 = fadd float %add.12.i85, %60
  store float %add.12.i86, ptr addrspace(3) %shmem_transposed_addr43102, align 4
  br i1 %55, label %reduction_write_output-true59, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.12.i81, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true59:                    ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.12.i86, ptr addrspace(1) %sunkaddr, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_54(ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(512) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(512) %arg4) local_unnamed_addr #3 {
entry:
  %arg4197 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3195 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2193 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1191 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0189 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !71
  %trunc.not = icmp eq i32 %0, 0
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !71
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %thread_id.x = and i32 %2, 31
  %thread_id.y131 = lshr i32 %2, 5
  %tile_origin.2 = shl nuw nsw i32 %1, 6
  %Arg_1.2 = load float, ptr addrspace(1) %arg1191, align 128, !invariant.load !63
  %3 = shl nuw nsw i32 %thread_id.x, 1
  %4 = or i32 %3, %tile_origin.2
  %5 = zext i32 %4 to i64
  br i1 %trunc.not, label %y_in_tile.loop_body.preheader, label %y_in_tile.loop_body60.preheader

y_in_tile.loop_body60.preheader:                  ; preds = %entry
  %6 = add nuw nsw i32 %thread_id.y131, -32
  %7 = zext i32 %2 to i64
  %8 = lshr i64 %7, 5
  %9 = shl nuw nsw i64 %8, 9
  %10 = shl nuw nsw i64 %5, 2
  %11 = add i64 %9, %10
  %12 = add i64 %11, 4
  %scevgep212 = getelementptr i8, ptr addrspace(1) %arg2193, i64 %12
  br label %y_in_tile.loop_body60

y_in_tile.loop_body.preheader:                    ; preds = %entry
  %13 = add nuw nsw i32 %thread_id.y131, -32
  %14 = zext i32 %2 to i64
  %15 = lshr i64 %14, 5
  %16 = shl nuw nsw i64 %15, 9
  %17 = shl nuw nsw i64 %5, 2
  %18 = add i64 %16, %17
  %19 = add i64 %18, 4
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0189, i64 %19
  br label %y_in_tile.loop_body

common.ret.sink.split:                            ; preds = %reduction_write_output-after100, %reduction_write_output-after
  %.pre-phi206 = phi i64 [ %52, %reduction_write_output-after100 ], [ %33, %reduction_write_output-after ]
  %arg3.sink = phi ptr addrspace(1) [ %arg3195, %reduction_write_output-after ], [ %arg4197, %reduction_write_output-after100 ]
  %add.7.i166.sink = phi float [ %add.7.i166, %reduction_write_output-after ], [ %add.12.i177, %reduction_write_output-after100 ]
  %20 = getelementptr [128 x float], ptr addrspace(1) %arg3.sink, i64 0, i64 %.pre-phi206
  %output_element_address44199 = getelementptr inbounds float, ptr addrspace(1) %20, i64 1
  store float %add.7.i166.sink, ptr addrspace(1) %output_element_address44199, align 4
  br label %common.ret

common.ret:                                       ; preds = %common.ret.sink.split, %reduction_write_output-after, %reduction_write_output-after100
  ret void

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_body.preheader, %y_in_tile.loop_body
  %lsr.iv207 = phi ptr addrspace(1) [ %scevgep, %y_in_tile.loop_body.preheader ], [ %scevgep208, %y_in_tile.loop_body ]
  %lsr.iv = phi i32 [ %13, %y_in_tile.loop_body.preheader ], [ %lsr.iv.next, %y_in_tile.loop_body ]
  %partial_reduction_result129.sroa.0.0183 = phi float [ %add.7.i, %y_in_tile.loop_body ], [ %Arg_1.2, %y_in_tile.loop_body.preheader ]
  %partial_reduction_result129.sroa.4.0182 = phi float [ %add.7.i156, %y_in_tile.loop_body ], [ %Arg_1.2, %y_in_tile.loop_body.preheader ]
  %scevgep209 = getelementptr i8, ptr addrspace(1) %lsr.iv207, i64 -4
  %21 = load <2 x float>, ptr addrspace(1) %scevgep209, align 8, !invariant.load !63
  %Arg_0.13216 = extractelement <2 x float> %21, i32 0
  %Arg_0.18217 = extractelement <2 x float> %21, i32 1
  %add.7.i = fadd float %partial_reduction_result129.sroa.0.0183, %Arg_0.13216
  %add.7.i156 = fadd float %partial_reduction_result129.sroa.4.0182, %Arg_0.18217
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep208 = getelementptr i8, ptr addrspace(1) %lsr.iv207, i64 16384
  %22 = icmp ugt i32 %lsr.iv.next, 31
  br i1 %22, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %23 = zext i32 %thread_id.x to i64
  %24 = zext i32 %thread_id.y131 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache6, i64 0, i64 0, i64 0, i64 %23, i64 %24
  store float %add.7.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache6, i64 0, i64 0, i64 0, i64 %24, i64 %23
  %partial_reduction_result10 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  %add.7.i157 = fadd float %partial_reduction_result10, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i157, i32 8, i32 31)
  %add.7.i158 = fadd float %add.7.i157, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i158, i32 4, i32 31)
  %add.7.i159 = fadd float %add.7.i158, %27
  %28 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i159, i32 2, i32 31)
  %add.7.i160 = fadd float %add.7.i159, %28
  %29 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i160, i32 1, i32 31)
  %add.7.i161 = fadd float %add.7.i160, %29
  store float %add.7.i161, ptr addrspace(3) %shmem_transposed_addr, align 4
  %30 = shl nuw nsw i32 %thread_id.y131, 1
  %31 = icmp eq i32 %thread_id.x, 0
  %32 = or i32 %30, %tile_origin.2
  %33 = zext i32 %32 to i64
  %output_element_address = getelementptr inbounds [128 x float], ptr addrspace(1) %arg3195, i64 0, i64 %33
  br i1 %31, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %34 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address24201 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.7.i156, ptr addrspace(3) %shmem_output_address24201, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26202 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result28 = load float, ptr addrspace(3) %shmem_transposed_addr26202, align 4
  %35 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  %add.7.i162 = fadd float %partial_reduction_result28, %35
  %36 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i162, i32 8, i32 31)
  %add.7.i163 = fadd float %add.7.i162, %36
  %37 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i163, i32 4, i32 31)
  %add.7.i164 = fadd float %add.7.i163, %37
  %38 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i164, i32 2, i32 31)
  %add.7.i165 = fadd float %add.7.i164, %38
  %39 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i165, i32 1, i32 31)
  %add.7.i166 = fadd float %add.7.i165, %39
  store float %add.7.i166, ptr addrspace(3) %shmem_transposed_addr26202, align 4
  br i1 %34, label %common.ret.sink.split, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.7.i161, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

y_in_tile.loop_body60:                            ; preds = %y_in_tile.loop_body60.preheader, %y_in_tile.loop_body60
  %lsr.iv213 = phi ptr addrspace(1) [ %scevgep212, %y_in_tile.loop_body60.preheader ], [ %scevgep214, %y_in_tile.loop_body60 ]
  %lsr.iv210 = phi i32 [ %6, %y_in_tile.loop_body60.preheader ], [ %lsr.iv.next211, %y_in_tile.loop_body60 ]
  %partial_reduction_result47128.sroa.4.0179 = phi float [ %add.12.i167, %y_in_tile.loop_body60 ], [ %Arg_1.2, %y_in_tile.loop_body60.preheader ]
  %partial_reduction_result47128.sroa.0.0178 = phi float [ %add.12.i, %y_in_tile.loop_body60 ], [ %Arg_1.2, %y_in_tile.loop_body60.preheader ]
  %scevgep215 = getelementptr i8, ptr addrspace(1) %lsr.iv213, i64 -4
  %40 = load <2 x float>, ptr addrspace(1) %scevgep215, align 8, !invariant.load !63
  %Arg_2.373218 = extractelement <2 x float> %40, i32 0
  %Arg_2.379219 = extractelement <2 x float> %40, i32 1
  %add.12.i = fadd float %partial_reduction_result47128.sroa.0.0178, %Arg_2.373218
  %add.12.i167 = fadd float %partial_reduction_result47128.sroa.4.0179, %Arg_2.379219
  %lsr.iv.next211 = add nsw i32 %lsr.iv210, 32
  %scevgep214 = getelementptr i8, ptr addrspace(1) %lsr.iv213, i64 16384
  %41 = icmp ugt i32 %lsr.iv.next211, 31
  br i1 %41, label %y_in_tile.loop_exit58, label %y_in_tile.loop_body60

y_in_tile.loop_exit58:                            ; preds = %y_in_tile.loop_body60
  %42 = zext i32 %thread_id.x to i64
  %43 = zext i32 %thread_id.y131 to i64
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i64 0, i64 0, i64 0, i64 %42, i64 %43
  store float %add.12.i, ptr addrspace(3) %shmem_output_address81, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i64 0, i64 0, i64 0, i64 %43, i64 %42
  %partial_reduction_result85 = load float, ptr addrspace(3) %shmem_transposed_addr83, align 4
  %44 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  %add.12.i168 = fadd float %partial_reduction_result85, %44
  %45 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i168, i32 8, i32 31)
  %add.12.i169 = fadd float %add.12.i168, %45
  %46 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i169, i32 4, i32 31)
  %add.12.i170 = fadd float %add.12.i169, %46
  %47 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i170, i32 2, i32 31)
  %add.12.i171 = fadd float %add.12.i170, %47
  %48 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i171, i32 1, i32 31)
  %add.12.i172 = fadd float %add.12.i171, %48
  store float %add.12.i172, ptr addrspace(3) %shmem_transposed_addr83, align 4
  %49 = shl nuw nsw i32 %thread_id.y131, 1
  %50 = icmp eq i32 %thread_id.x, 0
  %51 = or i32 %49, %tile_origin.2
  %52 = zext i32 %51 to i64
  %output_element_address101 = getelementptr inbounds [128 x float], ptr addrspace(1) %arg4197, i64 0, i64 %52
  br i1 %50, label %reduction_write_output-true99, label %reduction_write_output-after100

reduction_write_output-after100:                  ; preds = %reduction_write_output-true99, %y_in_tile.loop_exit58
  %53 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address103204 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address81, i64 1056
  store float %add.12.i167, ptr addrspace(3) %shmem_output_address103204, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr105205 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr83, i64 1056
  %partial_reduction_result107 = load float, ptr addrspace(3) %shmem_transposed_addr105205, align 4
  %54 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result107, i32 16, i32 31)
  %add.12.i173 = fadd float %partial_reduction_result107, %54
  %55 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i173, i32 8, i32 31)
  %add.12.i174 = fadd float %add.12.i173, %55
  %56 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i174, i32 4, i32 31)
  %add.12.i175 = fadd float %add.12.i174, %56
  %57 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i175, i32 2, i32 31)
  %add.12.i176 = fadd float %add.12.i175, %57
  %58 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i176, i32 1, i32 31)
  %add.12.i177 = fadd float %add.12.i176, %58
  store float %add.12.i177, ptr addrspace(3) %shmem_transposed_addr105205, align 4
  br i1 %53, label %common.ret.sink.split, label %common.ret

reduction_write_output-true99:                    ; preds = %y_in_tile.loop_exit58
  store float %add.12.i172, ptr addrspace(1) %output_element_address101, align 8
  br label %reduction_write_output-after100
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_38(ptr noalias nocapture readonly align 16 dereferenceable(512) %arg0, ptr noalias nocapture align 128 dereferenceable(512) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(512) %arg3, ptr noalias nocapture align 128 dereferenceable(512) %arg4) local_unnamed_addr #5 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !63
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.7 = fmul float %4, %6
  %subtract.8 = fsub float %3, %multiply.7
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %1
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !63
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %1
  %10 = load float, ptr addrspace(1) %9, align 4
  %multiply.9 = fmul float %4, %10
  %subtract.10 = fsub float %8, %multiply.9
  store float %subtract.8, ptr addrspace(1) %9, align 4
  store float %subtract.10, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_51(ptr noalias nocapture readonly align 16 dereferenceable(425984) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg6) local_unnamed_addr #5 {
entry:
  %arg630 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg528 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg426 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg324 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg222 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg120 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg018 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !66
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !69
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
  %9 = add nuw nsw i32 %8, 704
  %10 = and i32 %3, 60
  %11 = lshr i32 %9, 6
  %12 = and i32 %9, -64
  %13 = or i32 %12, %10
  %14 = zext i32 %4 to i64
  %15 = zext i32 %13 to i64
  %16 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg120, i64 0, i64 %14, i64 %15
  %17 = load float, ptr addrspace(1) %16, align 16, !invariant.load !63
  %18 = zext i32 %11 to i64
  %19 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg018, i64 0, i64 %14, i64 %18, i64 0
  %20 = load float, ptr addrspace(1) %19, align 4, !invariant.load !63
  %multiply.9 = fmul float %17, %20
  %21 = zext i32 %linear_index_base to i64
  %22 = getelementptr float, ptr addrspace(1) %arg222, i64 %21
  %23 = load <4 x float>, ptr addrspace(1) %22, align 16, !invariant.load !63
  %24 = extractelement <4 x float> %23, i32 0
  %25 = extractelement <4 x float> %23, i32 1
  %26 = extractelement <4 x float> %23, i32 2
  %27 = extractelement <4 x float> %23, i32 3
  %28 = load float, ptr addrspace(1) %arg324, align 16, !invariant.load !63
  %29 = add nuw nsw i32 %8, 448
  %30 = lshr i32 %29, 6
  %31 = and i32 %29, -64
  %32 = or i32 %31, %10
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg120, i64 0, i64 %14, i64 %33
  %35 = load float, ptr addrspace(1) %34, align 16, !invariant.load !63
  %36 = zext i32 %30 to i64
  %37 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg018, i64 0, i64 %14, i64 %36, i64 0
  %38 = load float, ptr addrspace(1) %37, align 4, !invariant.load !63
  %multiply.91 = fmul float %35, %38
  %multiply.14 = fmul float %28, %multiply.91
  %subtract.15 = fsub float %24, %multiply.14
  %39 = add nuw nsw i32 %8, 576
  %40 = lshr i32 %39, 6
  %41 = and i32 %39, -64
  %42 = or i32 %41, %10
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg120, i64 0, i64 %14, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 16, !invariant.load !63
  %46 = zext i32 %40 to i64
  %47 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg018, i64 0, i64 %14, i64 %46, i64 0
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !63
  %multiply.92 = fmul float %45, %48
  %49 = getelementptr float, ptr addrspace(1) %arg426, i64 %21
  %50 = getelementptr float, ptr addrspace(1) %arg528, i64 %21
  %51 = getelementptr float, ptr addrspace(1) %arg630, i64 %21
  %52 = add nuw nsw i32 %7, 704
  %53 = and i32 %linear_index1, 61
  %54 = lshr i32 %52, 6
  %55 = and i32 %52, -64
  %56 = or i32 %55, %53
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg120, i64 0, i64 %14, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4, !invariant.load !63
  %60 = zext i32 %54 to i64
  %61 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg018, i64 0, i64 %14, i64 %60, i64 0
  %62 = load float, ptr addrspace(1) %61, align 4, !invariant.load !63
  %multiply.93 = fmul float %59, %62
  %63 = add nuw nsw i32 %7, 448
  %64 = lshr i32 %63, 6
  %65 = and i32 %63, -64
  %66 = or i32 %65, %53
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg120, i64 0, i64 %14, i64 %67
  %69 = load float, ptr addrspace(1) %68, align 4, !invariant.load !63
  %70 = zext i32 %64 to i64
  %71 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg018, i64 0, i64 %14, i64 %70, i64 0
  %72 = load float, ptr addrspace(1) %71, align 4, !invariant.load !63
  %multiply.94 = fmul float %69, %72
  %multiply.145 = fmul float %28, %multiply.94
  %subtract.156 = fsub float %25, %multiply.145
  %73 = add nuw nsw i32 %7, 576
  %74 = lshr i32 %73, 6
  %75 = and i32 %73, -64
  %76 = or i32 %75, %53
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg120, i64 0, i64 %14, i64 %77
  %79 = load float, ptr addrspace(1) %78, align 4, !invariant.load !63
  %80 = zext i32 %74 to i64
  %81 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg018, i64 0, i64 %14, i64 %80, i64 0
  %82 = load float, ptr addrspace(1) %81, align 4, !invariant.load !63
  %multiply.97 = fmul float %79, %82
  %83 = add nuw nsw i32 %6, 704
  %84 = and i32 %linear_index2, 62
  %85 = lshr i32 %83, 6
  %86 = and i32 %83, -64
  %87 = or i32 %86, %84
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg120, i64 0, i64 %14, i64 %88
  %90 = load float, ptr addrspace(1) %89, align 8, !invariant.load !63
  %91 = zext i32 %85 to i64
  %92 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg018, i64 0, i64 %14, i64 %91, i64 0
  %93 = load float, ptr addrspace(1) %92, align 4, !invariant.load !63
  %multiply.98 = fmul float %90, %93
  %94 = add nuw nsw i32 %6, 448
  %95 = lshr i32 %94, 6
  %96 = and i32 %94, -64
  %97 = or i32 %96, %84
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg120, i64 0, i64 %14, i64 %98
  %100 = load float, ptr addrspace(1) %99, align 8, !invariant.load !63
  %101 = zext i32 %95 to i64
  %102 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg018, i64 0, i64 %14, i64 %101, i64 0
  %103 = load float, ptr addrspace(1) %102, align 4, !invariant.load !63
  %multiply.99 = fmul float %100, %103
  %multiply.1410 = fmul float %28, %multiply.99
  %subtract.1511 = fsub float %26, %multiply.1410
  %104 = add nuw nsw i32 %6, 576
  %105 = lshr i32 %104, 6
  %106 = and i32 %104, -64
  %107 = or i32 %106, %84
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg120, i64 0, i64 %14, i64 %108
  %110 = load float, ptr addrspace(1) %109, align 8, !invariant.load !63
  %111 = zext i32 %105 to i64
  %112 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg018, i64 0, i64 %14, i64 %111, i64 0
  %113 = load float, ptr addrspace(1) %112, align 4, !invariant.load !63
  %multiply.912 = fmul float %110, %113
  %114 = add nuw nsw i32 %5, 704
  %115 = and i32 %linear_index3, 63
  %116 = lshr i32 %114, 6
  %117 = and i32 %114, -64
  %118 = or i32 %117, %115
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg120, i64 0, i64 %14, i64 %119
  %121 = load float, ptr addrspace(1) %120, align 4, !invariant.load !63
  %122 = zext i32 %116 to i64
  %123 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg018, i64 0, i64 %14, i64 %122, i64 0
  %124 = load float, ptr addrspace(1) %123, align 4, !invariant.load !63
  %multiply.913 = fmul float %121, %124
  %125 = add nuw nsw i32 %5, 448
  %126 = lshr i32 %125, 6
  %127 = and i32 %125, -64
  %128 = or i32 %127, %115
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg120, i64 0, i64 %14, i64 %129
  %131 = load float, ptr addrspace(1) %130, align 4, !invariant.load !63
  %132 = zext i32 %126 to i64
  %133 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg018, i64 0, i64 %14, i64 %132, i64 0
  %134 = load float, ptr addrspace(1) %133, align 4, !invariant.load !63
  %multiply.914 = fmul float %131, %134
  %multiply.1415 = fmul float %28, %multiply.914
  %subtract.1516 = fsub float %27, %multiply.1415
  %135 = add nuw nsw i32 %5, 576
  %136 = lshr i32 %135, 6
  %137 = and i32 %135, -64
  %138 = or i32 %137, %115
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg120, i64 0, i64 %14, i64 %139
  %141 = load float, ptr addrspace(1) %140, align 4, !invariant.load !63
  %142 = zext i32 %136 to i64
  %143 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg018, i64 0, i64 %14, i64 %142, i64 0
  %144 = load float, ptr addrspace(1) %143, align 4, !invariant.load !63
  %multiply.917 = fmul float %141, %144
  %145 = insertelement <4 x float> poison, float %multiply.9, i32 0
  %146 = insertelement <4 x float> %145, float %multiply.93, i32 1
  %147 = insertelement <4 x float> %146, float %multiply.98, i32 2
  %148 = insertelement <4 x float> %147, float %multiply.913, i32 3
  store <4 x float> %148, ptr addrspace(1) %49, align 16
  %149 = insertelement <4 x float> poison, float %subtract.15, i32 0
  %150 = insertelement <4 x float> %149, float %subtract.156, i32 1
  %151 = insertelement <4 x float> %150, float %subtract.1511, i32 2
  %152 = insertelement <4 x float> %151, float %subtract.1516, i32 3
  store <4 x float> %152, ptr addrspace(1) %50, align 16
  %153 = insertelement <4 x float> poison, float %multiply.92, i32 0
  %154 = insertelement <4 x float> %153, float %multiply.97, i32 1
  %155 = insertelement <4 x float> %154, float %multiply.912, i32 2
  %156 = insertelement <4 x float> %155, float %multiply.917, i32 3
  store <4 x float> %156, ptr addrspace(1) %51, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_22(ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg0, ptr noalias nocapture align 128 dereferenceable(4194304) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg3, ptr noalias nocapture align 128 dereferenceable(4194304) %arg4) local_unnamed_addr #5 {
entry:
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !72
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !70
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = load float, ptr addrspace(1) %arg218, align 16
  %5 = zext i32 %linear_index_base to i64
  %6 = getelementptr float, ptr addrspace(1) %arg014, i64 %5
  %7 = load <4 x float>, ptr addrspace(1) %6, align 16, !invariant.load !63
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %12 = getelementptr float, ptr addrspace(1) %arg116, i64 %5
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %multiply.7 = fmul float %4, %14
  %subtract.8 = fsub float %8, %multiply.7
  %18 = getelementptr float, ptr addrspace(1) %arg320, i64 %5
  %19 = load <4 x float>, ptr addrspace(1) %18, align 16, !invariant.load !63
  %20 = extractelement <4 x float> %19, i32 0
  %21 = extractelement <4 x float> %19, i32 1
  %22 = extractelement <4 x float> %19, i32 2
  %23 = extractelement <4 x float> %19, i32 3
  %24 = getelementptr float, ptr addrspace(1) %arg422, i64 %5
  %25 = load <4 x float>, ptr addrspace(1) %24, align 16
  %26 = extractelement <4 x float> %25, i32 0
  %27 = extractelement <4 x float> %25, i32 1
  %28 = extractelement <4 x float> %25, i32 2
  %29 = extractelement <4 x float> %25, i32 3
  %multiply.9 = fmul float %4, %26
  %subtract.10 = fsub float %20, %multiply.9
  %30 = getelementptr inbounds float, ptr addrspace(1) %6, i64 1
  %31 = getelementptr inbounds float, ptr addrspace(1) %12, i64 1
  %multiply.71 = fmul float %4, %15
  %subtract.82 = fsub float %9, %multiply.71
  %32 = getelementptr inbounds float, ptr addrspace(1) %18, i64 1
  %33 = getelementptr inbounds float, ptr addrspace(1) %24, i64 1
  %multiply.93 = fmul float %4, %27
  %subtract.104 = fsub float %21, %multiply.93
  %34 = getelementptr inbounds float, ptr addrspace(1) %6, i64 2
  %35 = getelementptr inbounds float, ptr addrspace(1) %12, i64 2
  %multiply.75 = fmul float %4, %16
  %subtract.86 = fsub float %10, %multiply.75
  %36 = getelementptr inbounds float, ptr addrspace(1) %18, i64 2
  %37 = getelementptr inbounds float, ptr addrspace(1) %24, i64 2
  %multiply.97 = fmul float %4, %28
  %subtract.108 = fsub float %22, %multiply.97
  %38 = getelementptr inbounds float, ptr addrspace(1) %6, i64 3
  %39 = getelementptr inbounds float, ptr addrspace(1) %12, i64 3
  %multiply.79 = fmul float %4, %17
  %subtract.810 = fsub float %11, %multiply.79
  %40 = getelementptr inbounds float, ptr addrspace(1) %18, i64 3
  %41 = getelementptr inbounds float, ptr addrspace(1) %24, i64 3
  %multiply.911 = fmul float %4, %29
  %subtract.1012 = fsub float %23, %multiply.911
  %42 = insertelement <4 x float> poison, float %subtract.8, i32 0
  %43 = insertelement <4 x float> %42, float %subtract.82, i32 1
  %44 = insertelement <4 x float> %43, float %subtract.86, i32 2
  %45 = insertelement <4 x float> %44, float %subtract.810, i32 3
  store <4 x float> %45, ptr addrspace(1) %24, align 16
  %46 = insertelement <4 x float> poison, float %subtract.10, i32 0
  %47 = insertelement <4 x float> %46, float %subtract.104, i32 1
  %48 = insertelement <4 x float> %47, float %subtract.108, i32 2
  %49 = insertelement <4 x float> %48, float %subtract.1012, i32 3
  store <4 x float> %49, ptr addrspace(1) %12, align 16
  %50 = getelementptr inbounds float, ptr addrspace(1) %6, i64 442368
  %51 = load <4 x float>, ptr addrspace(1) %50, align 16, !invariant.load !63
  %52 = extractelement <4 x float> %51, i32 0
  %53 = extractelement <4 x float> %51, i32 1
  %54 = extractelement <4 x float> %51, i32 2
  %55 = extractelement <4 x float> %51, i32 3
  %56 = getelementptr inbounds float, ptr addrspace(1) %12, i64 442368
  %57 = load <4 x float>, ptr addrspace(1) %56, align 16
  %58 = extractelement <4 x float> %57, i32 0
  %59 = extractelement <4 x float> %57, i32 1
  %60 = extractelement <4 x float> %57, i32 2
  %61 = extractelement <4 x float> %57, i32 3
  %multiply.7.1 = fmul float %4, %58
  %subtract.8.1 = fsub float %52, %multiply.7.1
  %62 = getelementptr inbounds float, ptr addrspace(1) %18, i64 442368
  %63 = load <4 x float>, ptr addrspace(1) %62, align 16, !invariant.load !63
  %64 = extractelement <4 x float> %63, i32 0
  %65 = extractelement <4 x float> %63, i32 1
  %66 = extractelement <4 x float> %63, i32 2
  %67 = extractelement <4 x float> %63, i32 3
  %68 = getelementptr inbounds float, ptr addrspace(1) %24, i64 442368
  %69 = load <4 x float>, ptr addrspace(1) %68, align 16
  %70 = extractelement <4 x float> %69, i32 0
  %71 = extractelement <4 x float> %69, i32 1
  %72 = extractelement <4 x float> %69, i32 2
  %73 = extractelement <4 x float> %69, i32 3
  %multiply.9.1 = fmul float %4, %70
  %subtract.10.1 = fsub float %64, %multiply.9.1
  %multiply.71.1 = fmul float %4, %59
  %subtract.82.1 = fsub float %53, %multiply.71.1
  %multiply.93.1 = fmul float %4, %71
  %subtract.104.1 = fsub float %65, %multiply.93.1
  %multiply.75.1 = fmul float %4, %60
  %subtract.86.1 = fsub float %54, %multiply.75.1
  %multiply.97.1 = fmul float %4, %72
  %subtract.108.1 = fsub float %66, %multiply.97.1
  %multiply.79.1 = fmul float %4, %61
  %subtract.810.1 = fsub float %55, %multiply.79.1
  %multiply.911.1 = fmul float %4, %73
  %subtract.1012.1 = fsub float %67, %multiply.911.1
  %74 = insertelement <4 x float> poison, float %subtract.8.1, i32 0
  %75 = insertelement <4 x float> %74, float %subtract.82.1, i32 1
  %76 = insertelement <4 x float> %75, float %subtract.86.1, i32 2
  %77 = insertelement <4 x float> %76, float %subtract.810.1, i32 3
  store <4 x float> %77, ptr addrspace(1) %68, align 16
  %78 = insertelement <4 x float> poison, float %subtract.10.1, i32 0
  %79 = insertelement <4 x float> %78, float %subtract.104.1, i32 1
  %80 = insertelement <4 x float> %79, float %subtract.108.1, i32 2
  %81 = insertelement <4 x float> %80, float %subtract.1012.1, i32 3
  store <4 x float> %81, ptr addrspace(1) %56, align 16
  %82 = icmp ult i32 %linear_index_base, 163840
  br i1 %82, label %fusion_22.in_bounds-true.2, label %fusion_22.in_bounds-after.2

fusion_22.in_bounds-true.2:                       ; preds = %entry
  %83 = getelementptr inbounds float, ptr addrspace(1) %6, i64 884736
  %84 = load <4 x float>, ptr addrspace(1) %83, align 16, !invariant.load !63
  %85 = extractelement <4 x float> %84, i32 0
  %86 = extractelement <4 x float> %84, i32 1
  %87 = extractelement <4 x float> %84, i32 2
  %88 = extractelement <4 x float> %84, i32 3
  %89 = getelementptr inbounds float, ptr addrspace(1) %12, i64 884736
  %90 = load <4 x float>, ptr addrspace(1) %89, align 16
  %91 = extractelement <4 x float> %90, i32 0
  %92 = extractelement <4 x float> %90, i32 1
  %93 = extractelement <4 x float> %90, i32 2
  %94 = extractelement <4 x float> %90, i32 3
  %multiply.7.2 = fmul float %4, %91
  %subtract.8.2 = fsub float %85, %multiply.7.2
  %95 = getelementptr inbounds float, ptr addrspace(1) %18, i64 884736
  %96 = load <4 x float>, ptr addrspace(1) %95, align 16, !invariant.load !63
  %97 = extractelement <4 x float> %96, i32 0
  %98 = extractelement <4 x float> %96, i32 1
  %99 = extractelement <4 x float> %96, i32 2
  %100 = extractelement <4 x float> %96, i32 3
  %101 = getelementptr inbounds float, ptr addrspace(1) %24, i64 884736
  %102 = load <4 x float>, ptr addrspace(1) %101, align 16
  %103 = extractelement <4 x float> %102, i32 0
  %104 = extractelement <4 x float> %102, i32 1
  %105 = extractelement <4 x float> %102, i32 2
  %106 = extractelement <4 x float> %102, i32 3
  %multiply.9.2 = fmul float %4, %103
  %subtract.10.2 = fsub float %97, %multiply.9.2
  %multiply.71.2 = fmul float %4, %92
  %subtract.82.2 = fsub float %86, %multiply.71.2
  %multiply.93.2 = fmul float %4, %104
  %subtract.104.2 = fsub float %98, %multiply.93.2
  %multiply.75.2 = fmul float %4, %93
  %subtract.86.2 = fsub float %87, %multiply.75.2
  %multiply.97.2 = fmul float %4, %105
  %subtract.108.2 = fsub float %99, %multiply.97.2
  %multiply.79.2 = fmul float %4, %94
  %subtract.810.2 = fsub float %88, %multiply.79.2
  %multiply.911.2 = fmul float %4, %106
  %subtract.1012.2 = fsub float %100, %multiply.911.2
  %107 = insertelement <4 x float> poison, float %subtract.8.2, i32 0
  %108 = insertelement <4 x float> %107, float %subtract.82.2, i32 1
  %109 = insertelement <4 x float> %108, float %subtract.86.2, i32 2
  %110 = insertelement <4 x float> %109, float %subtract.810.2, i32 3
  store <4 x float> %110, ptr addrspace(1) %101, align 16
  %111 = insertelement <4 x float> poison, float %subtract.10.2, i32 0
  %112 = insertelement <4 x float> %111, float %subtract.104.2, i32 1
  %113 = insertelement <4 x float> %112, float %subtract.108.2, i32 2
  %114 = insertelement <4 x float> %113, float %subtract.1012.2, i32 3
  store <4 x float> %114, ptr addrspace(1) %89, align 16
  br label %fusion_22.in_bounds-after.2

fusion_22.in_bounds-after.2:                      ; preds = %fusion_22.in_bounds-true.2, %entry
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_6(ptr noalias nocapture readonly align 16 dereferenceable(917504) %arg0, ptr noalias nocapture align 128 dereferenceable(917504) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #5 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !73
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !69
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg07, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !63
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !63
  %12 = getelementptr float, ptr addrspace(1) %arg19, i64 %4
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %multiply.5 = fmul float %11, %14
  %subtract.6 = fsub float %7, %multiply.5
  %multiply.51 = fmul float %11, %15
  %subtract.62 = fsub float %8, %multiply.51
  %multiply.53 = fmul float %11, %16
  %subtract.64 = fsub float %9, %multiply.53
  %multiply.55 = fmul float %11, %17
  %subtract.66 = fsub float %10, %multiply.55
  %18 = insertelement <4 x float> poison, float %subtract.6, i32 0
  %19 = insertelement <4 x float> %18, float %subtract.62, i32 1
  %20 = insertelement <4 x float> %19, float %subtract.64, i32 2
  %21 = insertelement <4 x float> %20, float %subtract.66, i32 3
  store <4 x float> %21, ptr addrspace(1) %12, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_8(ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg0, ptr noalias nocapture align 128 dereferenceable(262144) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #5 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !65
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !63
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_2(ptr noalias nocapture readonly align 16 dereferenceable(98304) %arg0, ptr noalias nocapture align 128 dereferenceable(98304) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #5 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !63
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion(ptr noalias nocapture readonly align 16 dereferenceable(49152) %arg0, ptr noalias nocapture align 128 dereferenceable(49152) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #5 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !75
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !63
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_7(ptr noalias nocapture readonly align 16 dereferenceable(16384) %arg0, ptr noalias nocapture align 128 dereferenceable(16384) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #5 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !76
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !63
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_52(ptr noalias nocapture readonly align 128 dereferenceable(16384) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16384) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(256) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(256) %arg4) local_unnamed_addr #3 {
entry:
  %arg4196 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3194 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2192 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1190 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0188 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !71
  %trunc.not = icmp eq i32 %0, 0
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %thread_id.x = and i32 %1, 31
  %thread_id.y131 = lshr i32 %1, 5
  %Arg_1.2 = load float, ptr addrspace(1) %arg1190, align 128, !invariant.load !63
  br i1 %trunc.not, label %y_in_tile.loop_body.preheader, label %y_in_tile.loop_body60.preheader

y_in_tile.loop_body60.preheader:                  ; preds = %entry
  %2 = add nuw nsw i32 %thread_id.y131, -32
  %3 = zext i32 %1 to i64
  %4 = lshr i64 %3, 5
  %5 = shl nuw nsw i64 %4, 8
  %6 = trunc i32 %1 to i5
  %7 = zext i5 %6 to i64
  %8 = shl nuw nsw i64 %7, 3
  %9 = add i64 %5, %8
  %10 = add i64 %9, 4
  %scevgep212 = getelementptr i8, ptr addrspace(1) %arg2192, i64 %10
  br label %y_in_tile.loop_body60

y_in_tile.loop_body.preheader:                    ; preds = %entry
  %11 = add nuw nsw i32 %thread_id.y131, -32
  %12 = zext i32 %1 to i64
  %13 = lshr i64 %12, 5
  %14 = shl nuw nsw i64 %13, 8
  %15 = trunc i32 %1 to i5
  %16 = zext i5 %15 to i64
  %17 = shl nuw nsw i64 %16, 3
  %18 = add i64 %14, %17
  %19 = add i64 %18, 4
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0188, i64 %19
  br label %y_in_tile.loop_body

common.ret.sink.split:                            ; preds = %reduction_write_output-after100, %reduction_write_output-after
  %.pre-phi = phi i64 [ %50, %reduction_write_output-after100 ], [ %32, %reduction_write_output-after ]
  %arg3.sink = phi ptr addrspace(1) [ %arg3194, %reduction_write_output-after ], [ %arg4196, %reduction_write_output-after100 ]
  %add.7.i166.sink = phi float [ %add.7.i166, %reduction_write_output-after ], [ %add.12.i177, %reduction_write_output-after100 ]
  %20 = getelementptr [64 x float], ptr addrspace(1) %arg3.sink, i64 0, i64 %.pre-phi
  %output_element_address44198 = getelementptr inbounds float, ptr addrspace(1) %20, i64 1
  store float %add.7.i166.sink, ptr addrspace(1) %output_element_address44198, align 4
  br label %common.ret

common.ret:                                       ; preds = %common.ret.sink.split, %reduction_write_output-after, %reduction_write_output-after100
  ret void

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_body.preheader, %y_in_tile.loop_body
  %lsr.iv207 = phi ptr addrspace(1) [ %scevgep, %y_in_tile.loop_body.preheader ], [ %scevgep208, %y_in_tile.loop_body ]
  %lsr.iv = phi i32 [ %11, %y_in_tile.loop_body.preheader ], [ %lsr.iv.next, %y_in_tile.loop_body ]
  %partial_reduction_result129.sroa.0.0183 = phi float [ %add.7.i, %y_in_tile.loop_body ], [ %Arg_1.2, %y_in_tile.loop_body.preheader ]
  %partial_reduction_result129.sroa.4.0182 = phi float [ %add.7.i156, %y_in_tile.loop_body ], [ %Arg_1.2, %y_in_tile.loop_body.preheader ]
  %scevgep209 = getelementptr i8, ptr addrspace(1) %lsr.iv207, i64 -4
  %21 = load <2 x float>, ptr addrspace(1) %scevgep209, align 8, !invariant.load !63
  %Arg_0.13216 = extractelement <2 x float> %21, i32 0
  %Arg_0.18217 = extractelement <2 x float> %21, i32 1
  %add.7.i = fadd float %partial_reduction_result129.sroa.0.0183, %Arg_0.13216
  %add.7.i156 = fadd float %partial_reduction_result129.sroa.4.0182, %Arg_0.18217
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep208 = getelementptr i8, ptr addrspace(1) %lsr.iv207, i64 8192
  %22 = icmp ugt i32 %lsr.iv.next, 31
  br i1 %22, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %23 = zext i32 %thread_id.x to i64
  %24 = zext i32 %thread_id.y131 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i64 0, i64 0, i64 0, i64 %23, i64 %24
  store float %add.7.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i64 0, i64 0, i64 0, i64 %24, i64 %23
  %partial_reduction_result10 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  %add.7.i157 = fadd float %partial_reduction_result10, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i157, i32 8, i32 31)
  %add.7.i158 = fadd float %add.7.i157, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i158, i32 4, i32 31)
  %add.7.i159 = fadd float %add.7.i158, %27
  %28 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i159, i32 2, i32 31)
  %add.7.i160 = fadd float %add.7.i159, %28
  %29 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i160, i32 1, i32 31)
  %add.7.i161 = fadd float %add.7.i160, %29
  store float %add.7.i161, ptr addrspace(3) %shmem_transposed_addr, align 4
  %30 = shl nuw nsw i32 %thread_id.y131, 1
  %31 = icmp eq i32 %thread_id.x, 0
  %32 = zext i32 %30 to i64
  %output_element_address = getelementptr inbounds [64 x float], ptr addrspace(1) %arg3194, i64 0, i64 %32
  br i1 %31, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %33 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address24201 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.7.i156, ptr addrspace(3) %shmem_output_address24201, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26202 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result28 = load float, ptr addrspace(3) %shmem_transposed_addr26202, align 4
  %34 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  %add.7.i162 = fadd float %partial_reduction_result28, %34
  %35 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i162, i32 8, i32 31)
  %add.7.i163 = fadd float %add.7.i162, %35
  %36 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i163, i32 4, i32 31)
  %add.7.i164 = fadd float %add.7.i163, %36
  %37 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i164, i32 2, i32 31)
  %add.7.i165 = fadd float %add.7.i164, %37
  %38 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i165, i32 1, i32 31)
  %add.7.i166 = fadd float %add.7.i165, %38
  store float %add.7.i166, ptr addrspace(3) %shmem_transposed_addr26202, align 4
  br i1 %33, label %common.ret.sink.split, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.7.i161, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

y_in_tile.loop_body60:                            ; preds = %y_in_tile.loop_body60.preheader, %y_in_tile.loop_body60
  %lsr.iv213 = phi ptr addrspace(1) [ %scevgep212, %y_in_tile.loop_body60.preheader ], [ %scevgep214, %y_in_tile.loop_body60 ]
  %lsr.iv210 = phi i32 [ %2, %y_in_tile.loop_body60.preheader ], [ %lsr.iv.next211, %y_in_tile.loop_body60 ]
  %partial_reduction_result47128.sroa.4.0179 = phi float [ %add.12.i167, %y_in_tile.loop_body60 ], [ %Arg_1.2, %y_in_tile.loop_body60.preheader ]
  %partial_reduction_result47128.sroa.0.0178 = phi float [ %add.12.i, %y_in_tile.loop_body60 ], [ %Arg_1.2, %y_in_tile.loop_body60.preheader ]
  %scevgep215 = getelementptr i8, ptr addrspace(1) %lsr.iv213, i64 -4
  %39 = load <2 x float>, ptr addrspace(1) %scevgep215, align 8, !invariant.load !63
  %Arg_2.373218 = extractelement <2 x float> %39, i32 0
  %Arg_2.379219 = extractelement <2 x float> %39, i32 1
  %add.12.i = fadd float %partial_reduction_result47128.sroa.0.0178, %Arg_2.373218
  %add.12.i167 = fadd float %partial_reduction_result47128.sroa.4.0179, %Arg_2.379219
  %lsr.iv.next211 = add nsw i32 %lsr.iv210, 32
  %scevgep214 = getelementptr i8, ptr addrspace(1) %lsr.iv213, i64 8192
  %40 = icmp ugt i32 %lsr.iv.next211, 31
  br i1 %40, label %y_in_tile.loop_exit58, label %y_in_tile.loop_body60

y_in_tile.loop_exit58:                            ; preds = %y_in_tile.loop_body60
  %41 = zext i32 %thread_id.x to i64
  %42 = zext i32 %thread_id.y131 to i64
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i64 0, i64 0, i64 0, i64 %41, i64 %42
  store float %add.12.i, ptr addrspace(3) %shmem_output_address81, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i64 0, i64 0, i64 0, i64 %42, i64 %41
  %partial_reduction_result85 = load float, ptr addrspace(3) %shmem_transposed_addr83, align 4
  %43 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  %add.12.i168 = fadd float %partial_reduction_result85, %43
  %44 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i168, i32 8, i32 31)
  %add.12.i169 = fadd float %add.12.i168, %44
  %45 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i169, i32 4, i32 31)
  %add.12.i170 = fadd float %add.12.i169, %45
  %46 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i170, i32 2, i32 31)
  %add.12.i171 = fadd float %add.12.i170, %46
  %47 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i171, i32 1, i32 31)
  %add.12.i172 = fadd float %add.12.i171, %47
  store float %add.12.i172, ptr addrspace(3) %shmem_transposed_addr83, align 4
  %48 = shl nuw nsw i32 %thread_id.y131, 1
  %49 = icmp eq i32 %thread_id.x, 0
  %50 = zext i32 %48 to i64
  %output_element_address101 = getelementptr inbounds [64 x float], ptr addrspace(1) %arg4196, i64 0, i64 %50
  br i1 %49, label %reduction_write_output-true99, label %reduction_write_output-after100

reduction_write_output-after100:                  ; preds = %reduction_write_output-true99, %y_in_tile.loop_exit58
  %51 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address103205 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address81, i64 1056
  store float %add.12.i167, ptr addrspace(3) %shmem_output_address103205, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr105206 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr83, i64 1056
  %partial_reduction_result107 = load float, ptr addrspace(3) %shmem_transposed_addr105206, align 4
  %52 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result107, i32 16, i32 31)
  %add.12.i173 = fadd float %partial_reduction_result107, %52
  %53 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i173, i32 8, i32 31)
  %add.12.i174 = fadd float %add.12.i173, %53
  %54 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i174, i32 4, i32 31)
  %add.12.i175 = fadd float %add.12.i174, %54
  %55 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i175, i32 2, i32 31)
  %add.12.i176 = fadd float %add.12.i175, %55
  %56 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i176, i32 1, i32 31)
  %add.12.i177 = fadd float %add.12.i176, %56
  store float %add.12.i177, ptr addrspace(3) %shmem_transposed_addr105206, align 4
  br i1 %51, label %common.ret.sink.split, label %common.ret

reduction_write_output-true99:                    ; preds = %y_in_tile.loop_exit58
  store float %add.12.i172, ptr addrspace(1) %output_element_address101, align 8
  br label %reduction_write_output-after100
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_46(ptr noalias nocapture readonly align 16 dereferenceable(256) %arg0, ptr noalias nocapture align 128 dereferenceable(256) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(256) %arg3, ptr noalias nocapture align 128 dereferenceable(256) %arg4) local_unnamed_addr #5 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !65
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !63
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.7 = fmul float %4, %6
  %subtract.8 = fsub float %3, %multiply.7
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %1
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !63
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %1
  %10 = load float, ptr addrspace(1) %9, align 4
  %multiply.9 = fmul float %4, %10
  %subtract.10 = fsub float %8, %multiply.9
  store float %subtract.8, ptr addrspace(1) %9, align 4
  store float %subtract.10, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_34(ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg0, ptr noalias nocapture align 128 dereferenceable(65536) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg3, ptr noalias nocapture align 128 dereferenceable(65536) %arg4) local_unnamed_addr #5 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !77
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !63
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.7 = fmul float %6, %8
  %subtract.8 = fsub float %5, %multiply.7
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !63
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4
  %multiply.9 = fmul float %6, %12
  %subtract.10 = fsub float %10, %multiply.9
  store float %subtract.8, ptr addrspace(1) %11, align 4
  store float %subtract.10, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_42(ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg0, ptr noalias nocapture align 128 dereferenceable(32768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg3, ptr noalias nocapture align 128 dereferenceable(32768) %arg4) local_unnamed_addr #5 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !78
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !63
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.7 = fmul float %6, %8
  %subtract.8 = fsub float %5, %multiply.7
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !63
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4
  %multiply.9 = fmul float %6, %12
  %subtract.10 = fsub float %10, %multiply.9
  store float %subtract.8, ptr addrspace(1) %11, align 4
  store float %subtract.10, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: nounwind
define void @reduce_290(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(2048) %arg2) local_unnamed_addr #3 {
entry:
  %arg278 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg176 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg074 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !78
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %thread_id.x = and i32 %1, 31
  %thread_id.y47 = lshr i32 %1, 5
  %tile_origin.2 = shl nuw nsw i32 %0, 6
  %Arg_1.2 = load float, ptr addrspace(1) %arg176, align 128, !invariant.load !63
  %2 = shl nuw nsw i32 %thread_id.x, 1
  %3 = or i32 %2, %tile_origin.2
  %4 = zext i32 %3 to i64
  %5 = add nuw nsw i32 %thread_id.y47, -32
  %6 = zext i32 %1 to i64
  %7 = lshr i64 %6, 5
  %8 = shl nuw nsw i64 %7, 11
  %9 = shl nuw nsw i64 %4, 2
  %10 = add i64 %8, %9
  %11 = add i64 %10, 4
  %scevgep = getelementptr i8, ptr addrspace(1) %arg074, i64 %11
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after, %reduction_write_output-true42
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %y_in_tile.loop_body
  %lsr.iv84 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep85, %y_in_tile.loop_body ]
  %lsr.iv = phi i32 [ %5, %entry ], [ %lsr.iv.next, %y_in_tile.loop_body ]
  %partial_reduction_result46.sroa.4.071 = phi float [ %Arg_1.2, %entry ], [ %add.6.i59, %y_in_tile.loop_body ]
  %partial_reduction_result46.sroa.0.070 = phi float [ %Arg_1.2, %entry ], [ %add.6.i, %y_in_tile.loop_body ]
  %scevgep86 = getelementptr i8, ptr addrspace(1) %lsr.iv84, i64 -4
  %12 = load <2 x float>, ptr addrspace(1) %scevgep86, align 8, !invariant.load !63
  %Arg_0.1387 = extractelement <2 x float> %12, i32 0
  %Arg_0.1888 = extractelement <2 x float> %12, i32 1
  %add.6.i = fadd float %partial_reduction_result46.sroa.0.070, %Arg_0.1387
  %add.6.i59 = fadd float %partial_reduction_result46.sroa.4.071, %Arg_0.1888
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep85 = getelementptr i8, ptr addrspace(1) %lsr.iv84, i64 65536
  %13 = icmp ugt i32 %lsr.iv.next, 31
  br i1 %13, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %14 = zext i32 %thread_id.x to i64
  %15 = zext i32 %thread_id.y47 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i64 0, i64 0, i64 0, i64 %14, i64 %15
  store float %add.6.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i64 0, i64 0, i64 0, i64 %15, i64 %14
  %partial_reduction_result10 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  %add.6.i60 = fadd float %partial_reduction_result10, %16
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i60, i32 8, i32 31)
  %add.6.i61 = fadd float %add.6.i60, %17
  %18 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i61, i32 4, i32 31)
  %add.6.i62 = fadd float %add.6.i61, %18
  %19 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i62, i32 2, i32 31)
  %add.6.i63 = fadd float %add.6.i62, %19
  %20 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i63, i32 1, i32 31)
  %add.6.i64 = fadd float %add.6.i63, %20
  store float %add.6.i64, ptr addrspace(3) %shmem_transposed_addr, align 4
  %21 = shl nuw nsw i32 %thread_id.y47, 1
  %22 = icmp eq i32 %thread_id.x, 0
  %23 = or i32 %21, %tile_origin.2
  %24 = zext i32 %23 to i64
  %output_element_address = getelementptr inbounds [512 x float], ptr addrspace(1) %arg278, i64 0, i64 %24
  br i1 %22, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %25 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address2481 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.6.i59, ptr addrspace(3) %shmem_output_address2481, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr2682 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result28 = load float, ptr addrspace(3) %shmem_transposed_addr2682, align 4
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  %add.6.i65 = fadd float %partial_reduction_result28, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i65, i32 8, i32 31)
  %add.6.i66 = fadd float %add.6.i65, %27
  %28 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i66, i32 4, i32 31)
  %add.6.i67 = fadd float %add.6.i66, %28
  %29 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i67, i32 2, i32 31)
  %add.6.i68 = fadd float %add.6.i67, %29
  %30 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i68, i32 1, i32 31)
  %add.6.i69 = fadd float %add.6.i68, %30
  store float %add.6.i69, ptr addrspace(3) %shmem_transposed_addr2682, align 4
  br i1 %25, label %reduction_write_output-true42, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.6.i64, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.6.i69, ptr addrspace(1) %sunkaddr, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_13(ptr noalias nocapture readonly align 16 dereferenceable(2048) %arg0, ptr noalias nocapture align 128 dereferenceable(2048) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #5 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !67
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !63
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.5 = fmul float %4, %6
  %subtract.6 = fsub float %3, %multiply.5
  store float %subtract.6, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_16(ptr noalias nocapture readonly align 16 dereferenceable(61440) %arg0, ptr noalias nocapture align 128 dereferenceable(61440) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #5 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !79
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !63
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: nounwind
define void @reduce_273(ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(120) %arg2) local_unnamed_addr #3 {
entry:
  %arg234 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg132 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg030 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !66
  %thread_id.x = and i32 %0, 31
  %thread_id.y18 = lshr i32 %0, 5
  %Arg_1.2 = load float, ptr addrspace(1) %arg132, align 128, !invariant.load !63
  %1 = zext i32 %thread_id.x to i64
  %2 = add nuw nsw i32 %thread_id.y18, -32
  %3 = zext i32 %0 to i64
  %4 = lshr i64 %3, 5
  %5 = mul nuw nsw i64 %4, 120
  %6 = shl nuw nsw i64 %1, 2
  %7 = add i64 %5, %6
  %scevgep = getelementptr i8, ptr addrspace(1) %arg030, i64 %7
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %y_in_tile.loop_exit, %reduction_write_output-true
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %x_in_tile-after
  %lsr.iv36 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep37, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %2, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.028 = phi float [ %Arg_1.2, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %8 = trunc i64 %1 to i32
  %9 = icmp ult i32 %8, 30
  br i1 %9, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %y_in_tile.loop_body
  %partial_reduction_result.1 = phi float [ %add.6.i27, %x_in_tile-true ], [ %partial_reduction_result.028, %y_in_tile.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep37 = getelementptr i8, ptr addrspace(1) %lsr.iv36, i64 3840
  %10 = icmp ugt i32 %lsr.iv.next, 31
  br i1 %10, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after
  %11 = trunc i64 %1 to i32
  %12 = zext i32 %thread_id.y18 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i64 0, i64 0, i64 0, i64 %1, i64 %12
  store float %partial_reduction_result.1, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i64 0, i64 0, i64 0, i64 %12, i64 %1
  %partial_reduction_result4 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %13 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  %add.6.i = fadd float %partial_reduction_result4, %13
  %14 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i, i32 8, i32 31)
  %add.6.i23 = fadd float %add.6.i, %14
  %15 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i23, i32 4, i32 31)
  %add.6.i24 = fadd float %add.6.i23, %15
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i24, i32 2, i32 31)
  %add.6.i25 = fadd float %add.6.i24, %16
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i25, i32 1, i32 31)
  %add.6.i26 = fadd float %add.6.i25, %17
  store float %add.6.i26, ptr addrspace(3) %shmem_transposed_addr, align 4
  %18 = icmp ult i32 %0, 960
  %19 = icmp eq i32 %11, 0
  %20 = and i1 %18, %19
  %output_element_address = getelementptr inbounds [30 x float], ptr addrspace(1) %arg234, i64 0, i64 %12
  br i1 %20, label %reduction_write_output-true, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %Arg_0.13 = load float, ptr addrspace(1) %lsr.iv36, align 4, !invariant.load !63
  %add.6.i27 = fadd float %partial_reduction_result.028, %Arg_0.13
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.6.i26, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_17(ptr noalias nocapture readonly align 16 dereferenceable(120) %arg0, ptr noalias nocapture align 128 dereferenceable(120) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #5 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !80
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !63
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !63
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.5 = fmul float %4, %6
  %subtract.6 = fsub float %3, %multiply.5
  store float %subtract.6, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_30(ptr noalias nocapture readonly align 16 dereferenceable(14680064) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(425984) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(14680064) %arg4) local_unnamed_addr #5 {
entry:
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !81
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !69
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 448
  %5 = urem i32 %linear_index3, 448
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = urem i32 %linear_index2, 448
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = urem i32 %linear_index1, 448
  %8 = mul i32 %4, 448
  %.decomposed = sub i32 %linear_index_base.frozen, %8
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg010, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !63
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg112, align 16, !invariant.load !63
  %17 = lshr i32 %.decomposed, 6
  %18 = zext i32 %4 to i64
  %19 = zext i32 %.decomposed to i64
  %20 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg316, i64 0, i64 %18, i64 %19
  %21 = load float, ptr addrspace(1) %20, align 4, !invariant.load !63
  %22 = zext i32 %17 to i64
  %23 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg214, i64 0, i64 %18, i64 %22, i64 0
  %24 = load float, ptr addrspace(1) %23, align 4, !invariant.load !63
  %multiply.10 = fmul float %21, %24
  %multiply.13 = fmul float %16, %multiply.10
  %subtract.14 = fsub float %12, %multiply.13
  %25 = getelementptr float, ptr addrspace(1) %arg418, i64 %9
  %26 = lshr i32 %7, 6
  %27 = zext i32 %7 to i64
  %28 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg316, i64 0, i64 %18, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 4, !invariant.load !63
  %30 = zext i32 %26 to i64
  %31 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg214, i64 0, i64 %18, i64 %30, i64 0
  %32 = load float, ptr addrspace(1) %31, align 4, !invariant.load !63
  %multiply.101 = fmul float %29, %32
  %multiply.132 = fmul float %16, %multiply.101
  %subtract.143 = fsub float %13, %multiply.132
  %33 = lshr i32 %6, 6
  %34 = zext i32 %6 to i64
  %35 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg316, i64 0, i64 %18, i64 %34
  %36 = load float, ptr addrspace(1) %35, align 4, !invariant.load !63
  %37 = zext i32 %33 to i64
  %38 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg214, i64 0, i64 %18, i64 %37, i64 0
  %39 = load float, ptr addrspace(1) %38, align 4, !invariant.load !63
  %multiply.104 = fmul float %36, %39
  %multiply.135 = fmul float %16, %multiply.104
  %subtract.146 = fsub float %14, %multiply.135
  %40 = lshr i32 %5, 6
  %41 = zext i32 %5 to i64
  %42 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg316, i64 0, i64 %18, i64 %41
  %43 = load float, ptr addrspace(1) %42, align 4, !invariant.load !63
  %44 = zext i32 %40 to i64
  %45 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg214, i64 0, i64 %18, i64 %44, i64 0
  %46 = load float, ptr addrspace(1) %45, align 4, !invariant.load !63
  %multiply.107 = fmul float %43, %46
  %multiply.138 = fmul float %16, %multiply.107
  %subtract.149 = fsub float %15, %multiply.138
  %47 = insertelement <4 x float> poison, float %subtract.14, i32 0
  %48 = insertelement <4 x float> %47, float %subtract.143, i32 1
  %49 = insertelement <4 x float> %48, float %subtract.146, i32 2
  %50 = insertelement <4 x float> %49, float %subtract.149, i32 3
  store <4 x float> %50, ptr addrspace(1) %25, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_26(ptr noalias nocapture readonly align 16 dereferenceable(1572864) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(557056) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(1572864) %arg4) local_unnamed_addr #5 {
entry:
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !82
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !69
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 48
  %5 = urem i32 %linear_index3, 48
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = urem i32 %linear_index2, 48
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = urem i32 %linear_index1, 48
  %8 = mul i32 %4, 48
  %.decomposed = sub i32 %linear_index_base.frozen, %8
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg010, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !63
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg112, align 16, !invariant.load !63
  %17 = lshr i32 %.decomposed, 3
  %18 = or i32 %.decomposed, 832
  %19 = zext i32 %4 to i64
  %20 = zext i32 %18 to i64
  %21 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg316, i64 0, i64 %19, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !63
  %23 = zext i32 %17 to i64
  %24 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg214, i64 0, i64 %19, i64 %23, i64 0
  %25 = load float, ptr addrspace(1) %24, align 4, !invariant.load !63
  %multiply.10 = fmul float %22, %25
  %multiply.13 = fmul float %16, %multiply.10
  %subtract.14 = fsub float %12, %multiply.13
  %26 = getelementptr float, ptr addrspace(1) %arg418, i64 %9
  %27 = lshr i32 %7, 3
  %28 = zext i32 %7 to i64
  %29 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg316, i64 0, i64 %19, i64 %28
  %30 = getelementptr inbounds float, ptr addrspace(1) %29, i64 832
  %31 = load float, ptr addrspace(1) %30, align 4, !invariant.load !63
  %32 = zext i32 %27 to i64
  %33 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg214, i64 0, i64 %19, i64 %32, i64 0
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !63
  %multiply.101 = fmul float %31, %34
  %multiply.132 = fmul float %16, %multiply.101
  %subtract.143 = fsub float %13, %multiply.132
  %35 = lshr i32 %6, 3
  %36 = zext i32 %6 to i64
  %37 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg316, i64 0, i64 %19, i64 %36
  %38 = getelementptr inbounds float, ptr addrspace(1) %37, i64 832
  %39 = load float, ptr addrspace(1) %38, align 4, !invariant.load !63
  %40 = zext i32 %35 to i64
  %41 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg214, i64 0, i64 %19, i64 %40, i64 0
  %42 = load float, ptr addrspace(1) %41, align 4, !invariant.load !63
  %multiply.104 = fmul float %39, %42
  %multiply.135 = fmul float %16, %multiply.104
  %subtract.146 = fsub float %14, %multiply.135
  %43 = lshr i32 %5, 3
  %44 = zext i32 %5 to i64
  %45 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg316, i64 0, i64 %19, i64 %44
  %46 = getelementptr inbounds float, ptr addrspace(1) %45, i64 832
  %47 = load float, ptr addrspace(1) %46, align 4, !invariant.load !63
  %48 = zext i32 %43 to i64
  %49 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg214, i64 0, i64 %19, i64 %48, i64 0
  %50 = load float, ptr addrspace(1) %49, align 4, !invariant.load !63
  %multiply.107 = fmul float %47, %50
  %multiply.138 = fmul float %16, %multiply.107
  %subtract.149 = fsub float %15, %multiply.138
  %51 = insertelement <4 x float> poison, float %subtract.14, i32 0
  %52 = insertelement <4 x float> %51, float %subtract.143, i32 1
  %53 = insertelement <4 x float> %52, float %subtract.146, i32 2
  %54 = insertelement <4 x float> %53, float %subtract.149, i32 3
  store <4 x float> %54, ptr addrspace(1) %26, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_24(ptr noalias nocapture readonly align 16 dereferenceable(786432) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(557056) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(786432) %arg4) local_unnamed_addr #5 {
entry:
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !83
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !69
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 24
  %5 = urem i32 %linear_index3, 24
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = urem i32 %linear_index2, 24
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = urem i32 %linear_index1, 24
  %8 = mul i32 %4, 24
  %.decomposed = sub i32 %linear_index_base.frozen, %8
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg010, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !63
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg112, align 16, !invariant.load !63
  %17 = add nuw nsw i32 %.decomposed, 112
  %18 = lshr i32 %17, 3
  %19 = zext i32 %4 to i64
  %20 = zext i32 %.decomposed to i64
  %21 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg316, i64 0, i64 %19, i64 %20
  %22 = getelementptr inbounds float, ptr addrspace(1) %21, i64 944
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !63
  %24 = zext i32 %18 to i64
  %25 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg214, i64 0, i64 %19, i64 %24, i64 0
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !63
  %multiply.10 = fmul float %23, %26
  %multiply.13 = fmul float %16, %multiply.10
  %subtract.14 = fsub float %12, %multiply.13
  %27 = getelementptr float, ptr addrspace(1) %arg418, i64 %9
  %28 = add nuw nsw i32 %7, 112
  %29 = lshr i32 %28, 3
  %30 = zext i32 %7 to i64
  %31 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg316, i64 0, i64 %19, i64 %30
  %32 = getelementptr inbounds float, ptr addrspace(1) %31, i64 944
  %33 = load float, ptr addrspace(1) %32, align 4, !invariant.load !63
  %34 = zext i32 %29 to i64
  %35 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg214, i64 0, i64 %19, i64 %34, i64 0
  %36 = load float, ptr addrspace(1) %35, align 4, !invariant.load !63
  %multiply.101 = fmul float %33, %36
  %multiply.132 = fmul float %16, %multiply.101
  %subtract.143 = fsub float %13, %multiply.132
  %37 = add nuw nsw i32 %6, 112
  %38 = lshr i32 %37, 3
  %39 = zext i32 %6 to i64
  %40 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg316, i64 0, i64 %19, i64 %39
  %41 = getelementptr inbounds float, ptr addrspace(1) %40, i64 944
  %42 = load float, ptr addrspace(1) %41, align 4, !invariant.load !63
  %43 = zext i32 %38 to i64
  %44 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg214, i64 0, i64 %19, i64 %43, i64 0
  %45 = load float, ptr addrspace(1) %44, align 4, !invariant.load !63
  %multiply.104 = fmul float %42, %45
  %multiply.135 = fmul float %16, %multiply.104
  %subtract.146 = fsub float %14, %multiply.135
  %46 = add nuw nsw i32 %5, 112
  %47 = lshr i32 %46, 3
  %48 = zext i32 %5 to i64
  %49 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg316, i64 0, i64 %19, i64 %48
  %50 = getelementptr inbounds float, ptr addrspace(1) %49, i64 944
  %51 = load float, ptr addrspace(1) %50, align 4, !invariant.load !63
  %52 = zext i32 %47 to i64
  %53 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg214, i64 0, i64 %19, i64 %52, i64 0
  %54 = load float, ptr addrspace(1) %53, align 4, !invariant.load !63
  %multiply.107 = fmul float %51, %54
  %multiply.138 = fmul float %16, %multiply.107
  %subtract.149 = fsub float %15, %multiply.138
  %55 = insertelement <4 x float> poison, float %subtract.14, i32 0
  %56 = insertelement <4 x float> %55, float %subtract.143, i32 1
  %57 = insertelement <4 x float> %56, float %subtract.146, i32 2
  %58 = insertelement <4 x float> %57, float %subtract.149, i32 3
  store <4 x float> %58, ptr addrspace(1) %27, align 16
  ret void
}

attributes #0 = { nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { nounwind }
attributes #4 = { convergent nocallback nounwind }
attributes #5 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59}
!llvm.module.flags = !{!60}

!0 = !{ptr @fusion_20, !"kernel", i32 1}
!1 = !{ptr @fusion_20, !"reqntidx", i32 96}
!2 = !{ptr @fusion_21, !"kernel", i32 1}
!3 = !{ptr @fusion_21, !"reqntidx", i32 96}
!4 = !{ptr @fusion_18, !"kernel", i32 1}
!5 = !{ptr @fusion_18, !"reqntidx", i32 1024}
!6 = !{ptr @fusion_14, !"kernel", i32 1}
!7 = !{ptr @fusion_14, !"reqntidx", i32 1024}
!8 = !{ptr @fusion_5, !"kernel", i32 1}
!9 = !{ptr @fusion_5, !"reqntidx", i32 1024}
!10 = !{ptr @fusion_11, !"kernel", i32 1}
!11 = !{ptr @fusion_11, !"reqntidx", i32 1024}
!12 = !{ptr @fusion_25, !"kernel", i32 1}
!13 = !{ptr @fusion_25, !"reqntidx", i32 256}
!14 = !{ptr @fusion_44, !"kernel", i32 1}
!15 = !{ptr @fusion_44, !"reqntidx", i32 1024}
!16 = !{ptr @fusion_36, !"kernel", i32 1}
!17 = !{ptr @fusion_36, !"reqntidx", i32 1024}
!18 = !{ptr @fusion_54, !"kernel", i32 1}
!19 = !{ptr @fusion_54, !"reqntidx", i32 1024}
!20 = !{ptr @fusion_38, !"kernel", i32 1}
!21 = !{ptr @fusion_38, !"reqntidx", i32 128}
!22 = !{ptr @fusion_51, !"kernel", i32 1}
!23 = !{ptr @fusion_51, !"reqntidx", i32 256}
!24 = !{ptr @fusion_22, !"kernel", i32 1}
!25 = !{ptr @fusion_22, !"reqntidx", i32 128}
!26 = !{ptr @fusion_6, !"kernel", i32 1}
!27 = !{ptr @fusion_6, !"reqntidx", i32 256}
!28 = !{ptr @fusion_8, !"kernel", i32 1}
!29 = !{ptr @fusion_8, !"reqntidx", i32 1024}
!30 = !{ptr @fusion_2, !"kernel", i32 1}
!31 = !{ptr @fusion_2, !"reqntidx", i32 1024}
!32 = !{ptr @fusion, !"kernel", i32 1}
!33 = !{ptr @fusion, !"reqntidx", i32 1024}
!34 = !{ptr @fusion_7, !"kernel", i32 1}
!35 = !{ptr @fusion_7, !"reqntidx", i32 1024}
!36 = !{ptr @fusion_52, !"kernel", i32 1}
!37 = !{ptr @fusion_52, !"reqntidx", i32 1024}
!38 = !{ptr @fusion_46, !"kernel", i32 1}
!39 = !{ptr @fusion_46, !"reqntidx", i32 64}
!40 = !{ptr @fusion_34, !"kernel", i32 1}
!41 = !{ptr @fusion_34, !"reqntidx", i32 1024}
!42 = !{ptr @fusion_42, !"kernel", i32 1}
!43 = !{ptr @fusion_42, !"reqntidx", i32 1024}
!44 = !{ptr @reduce_290, !"kernel", i32 1}
!45 = !{ptr @reduce_290, !"reqntidx", i32 1024}
!46 = !{ptr @fusion_13, !"kernel", i32 1}
!47 = !{ptr @fusion_13, !"reqntidx", i32 512}
!48 = !{ptr @fusion_16, !"kernel", i32 1}
!49 = !{ptr @fusion_16, !"reqntidx", i32 1024}
!50 = !{ptr @reduce_273, !"kernel", i32 1}
!51 = !{ptr @reduce_273, !"reqntidx", i32 1024}
!52 = !{ptr @fusion_17, !"kernel", i32 1}
!53 = !{ptr @fusion_17, !"reqntidx", i32 30}
!54 = !{ptr @fusion_30, !"kernel", i32 1}
!55 = !{ptr @fusion_30, !"reqntidx", i32 256}
!56 = !{ptr @fusion_26, !"kernel", i32 1}
!57 = !{ptr @fusion_26, !"reqntidx", i32 256}
!58 = !{ptr @fusion_24, !"kernel", i32 1}
!59 = !{ptr @fusion_24, !"reqntidx", i32 256}
!60 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!61 = !{i32 0, i32 96}
!62 = !{i32 0, i32 11606}
!63 = !{}
!64 = !{i32 0, i32 35499}
!65 = !{i32 0, i32 64}
!66 = !{i32 0, i32 1024}
!67 = !{i32 0, i32 512}
!68 = !{i32 0, i32 32}
!69 = !{i32 0, i32 256}
!70 = !{i32 0, i32 128}
!71 = !{i32 0, i32 2}
!72 = !{i32 0, i32 864}
!73 = !{i32 0, i32 224}
!74 = !{i32 0, i32 24}
!75 = !{i32 0, i32 12}
!76 = !{i32 0, i32 4}
!77 = !{i32 0, i32 16}
!78 = !{i32 0, i32 8}
!79 = !{i32 0, i32 15}
!80 = !{i32 0, i32 30}
!81 = !{i32 0, i32 3584}
!82 = !{i32 0, i32 384}
!83 = !{i32 0, i32 192}
