target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_18 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_10 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@tr_tile_0 = private unnamed_addr addrspace(3) global [1 x [32 x [33 x float]]] undef
@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [1 x [1 x [1 x float]]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [1 x [1 x [1 x float]]] undef
@shared_cache4 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache5 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache6 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache7 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache8 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache9 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache10 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache11 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache12 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache13 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache14 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache15 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache16 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache17 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache18 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache19 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache20 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache21 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache22 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache23 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache24 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache25 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache26 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache27 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache28 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache29 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache30 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_98(ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg3) local_unnamed_addr #0 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !97
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg19, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !99
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = getelementptr float, ptr addrspace(1) %arg211, i64 %4
  %12 = load <4 x float>, ptr addrspace(1) %11, align 16, !invariant.load !99
  %13 = extractelement <4 x float> %12, i32 0
  %14 = extractelement <4 x float> %12, i32 1
  %15 = extractelement <4 x float> %12, i32 2
  %16 = extractelement <4 x float> %12, i32 3
  %add.4 = fadd float %7, %13
  %17 = getelementptr float, ptr addrspace(1) %arg07, i64 %4
  %18 = load <4 x float>, ptr addrspace(1) %17, align 16, !invariant.load !99
  %19 = extractelement <4 x float> %18, i32 0
  %20 = extractelement <4 x float> %18, i32 1
  %21 = extractelement <4 x float> %18, i32 2
  %22 = extractelement <4 x float> %18, i32 3
  %add.5 = fadd float %add.4, %19
  %23 = getelementptr float, ptr addrspace(1) %arg313, i64 %4
  %add.41 = fadd float %8, %14
  %add.52 = fadd float %add.41, %20
  %add.43 = fadd float %9, %15
  %add.54 = fadd float %add.43, %21
  %add.45 = fadd float %10, %16
  %add.56 = fadd float %add.45, %22
  %24 = insertelement <4 x float> poison, float %add.5, i32 0
  %25 = insertelement <4 x float> %24, float %add.52, i32 1
  %26 = insertelement <4 x float> %25, float %add.54, i32 2
  %27 = insertelement <4 x float> %26, float %add.56, i32 3
  store <4 x float> %27, ptr addrspace(1) %23, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nounwind
define void @fusion_21(ptr noalias nocapture readonly align 16 dereferenceable(33554432) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(33554432) %arg1) local_unnamed_addr #2 {
entry:
  %arg127 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg025 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !100
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !101
  %thread_id.x = and i32 %1, 31
  %thread_id.y19 = lshr i32 %1, 5
  %2 = lshr i32 %0, 9
  %3 = shl nuw nsw i32 %0, 5
  %tile_origin.0 = and i32 %3, 16352
  %4 = shl nuw nsw i32 %2, 5
  %5 = zext i32 %thread_id.x to i64
  %6 = add nuw nsw i32 %thread_id.y19, -16
  %7 = trunc i32 %0 to i9
  %8 = zext i9 %7 to i32
  %9 = shl nuw nsw i32 %8, 14
  %10 = shl nuw nsw i32 %thread_id.y19, 9
  %11 = add i32 %9, %10
  %12 = add i32 %11, %4
  %13 = add i32 %12, %thread_id.x
  %14 = add i32 %13, 6144
  %15 = zext i32 %14 to i64
  %16 = shl nuw nsw i64 %15, 2
  %scevgep54 = getelementptr i8, ptr addrspace(1) %arg025, i64 %16
  %17 = add i32 %13, 4096
  %18 = zext i32 %17 to i64
  %19 = shl nuw nsw i64 %18, 2
  %scevgep57 = getelementptr i8, ptr addrspace(1) %arg025, i64 %19
  %20 = add i32 %13, 2048
  %21 = zext i32 %20 to i64
  %22 = shl nuw nsw i64 %21, 2
  %scevgep60 = getelementptr i8, ptr addrspace(1) %arg025, i64 %22
  %23 = zext i32 %13 to i64
  %24 = shl nuw nsw i64 %23, 2
  %scevgep63 = getelementptr i8, ptr addrspace(1) %arg025, i64 %24
  %25 = zext i32 %1 to i64
  %26 = lshr i64 %25, 5
  %27 = mul nuw nsw i64 %26, 132
  %28 = shl nuw nsw i64 %5, 2
  %29 = add i64 %27, %28
  %30 = add i64 %29, 1056
  %scevgep66 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %30
  br label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_body, %entry
  %lsr.iv67 = phi ptr addrspace(3) [ %scevgep68, %y_in_tile.loop_body ], [ %scevgep66, %entry ]
  %lsr.iv64 = phi ptr addrspace(1) [ %scevgep65, %y_in_tile.loop_body ], [ %scevgep63, %entry ]
  %lsr.iv61 = phi ptr addrspace(1) [ %scevgep62, %y_in_tile.loop_body ], [ %scevgep60, %entry ]
  %lsr.iv58 = phi ptr addrspace(1) [ %scevgep59, %y_in_tile.loop_body ], [ %scevgep57, %entry ]
  %lsr.iv55 = phi ptr addrspace(1) [ %scevgep56, %y_in_tile.loop_body ], [ %scevgep54, %entry ]
  %lsr.iv52 = phi i32 [ %lsr.iv.next53, %y_in_tile.loop_body ], [ %6, %entry ]
  %Arg_0.13 = load float, ptr addrspace(1) %lsr.iv64, align 4, !invariant.load !99
  %scevgep69 = getelementptr i8, ptr addrspace(3) %lsr.iv67, i64 -1056
  store float %Arg_0.13, ptr addrspace(3) %scevgep69, align 4
  %Arg_0.13.1 = load float, ptr addrspace(1) %lsr.iv61, align 4, !invariant.load !99
  %scevgep71 = getelementptr i8, ptr addrspace(3) %lsr.iv67, i64 -528
  store float %Arg_0.13.1, ptr addrspace(3) %scevgep71, align 4
  %Arg_0.13.2 = load float, ptr addrspace(1) %lsr.iv58, align 4, !invariant.load !99
  store float %Arg_0.13.2, ptr addrspace(3) %lsr.iv67, align 4
  %Arg_0.13.3 = load float, ptr addrspace(1) %lsr.iv55, align 4, !invariant.load !99
  %scevgep70 = getelementptr i8, ptr addrspace(3) %lsr.iv67, i64 528
  store float %Arg_0.13.3, ptr addrspace(3) %scevgep70, align 4
  %lsr.iv.next53 = add nsw i32 %lsr.iv52, 16
  %scevgep56 = getelementptr i8, ptr addrspace(1) %lsr.iv55, i64 32768
  %scevgep59 = getelementptr i8, ptr addrspace(1) %lsr.iv58, i64 32768
  %scevgep62 = getelementptr i8, ptr addrspace(1) %lsr.iv61, i64 32768
  %scevgep65 = getelementptr i8, ptr addrspace(1) %lsr.iv64, i64 32768
  %scevgep68 = getelementptr i8, ptr addrspace(3) %lsr.iv67, i64 2112
  %31 = icmp ugt i32 %lsr.iv.next53, 15
  br i1 %31, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %32 = trunc i64 %5 to i32
  tail call void @llvm.nvvm.barrier0()
  %33 = shl nuw nsw i32 %2, 14
  %34 = shl nuw nsw i32 %thread_id.y19, 18
  %35 = add i32 %34, %33
  %36 = add i32 %35, %tile_origin.0
  %37 = add i32 %36, %32
  %38 = add i32 %37, 3145728
  %39 = zext i32 %38 to i64
  %40 = shl nuw nsw i64 %39, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %arg127, i64 %40
  %41 = add i32 %37, 2097152
  %42 = zext i32 %41 to i64
  %43 = shl nuw nsw i64 %42, 2
  %scevgep37 = getelementptr i8, ptr addrspace(1) %arg127, i64 %43
  %44 = add i32 %37, 1048576
  %45 = zext i32 %44 to i64
  %46 = shl nuw nsw i64 %45, 2
  %scevgep40 = getelementptr i8, ptr addrspace(1) %arg127, i64 %46
  %47 = zext i32 %37 to i64
  %48 = shl nuw nsw i64 %47, 2
  %scevgep43 = getelementptr i8, ptr addrspace(1) %arg127, i64 %48
  %49 = mul nuw nsw i64 %5, 132
  %50 = shl nuw nsw i64 %26, 2
  %51 = add i64 %49, %50
  %52 = add i64 %51, 32
  %scevgep46 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %52
  br label %y_in_tile.loop_body6

y_in_tile.loop_body6:                             ; preds = %y_in_tile.loop_body6, %y_in_tile.loop_exit
  %lsr.iv47 = phi ptr addrspace(3) [ %scevgep48, %y_in_tile.loop_body6 ], [ %scevgep46, %y_in_tile.loop_exit ]
  %lsr.iv44 = phi ptr addrspace(1) [ %scevgep45, %y_in_tile.loop_body6 ], [ %scevgep43, %y_in_tile.loop_exit ]
  %lsr.iv41 = phi ptr addrspace(1) [ %scevgep42, %y_in_tile.loop_body6 ], [ %scevgep40, %y_in_tile.loop_exit ]
  %lsr.iv38 = phi ptr addrspace(1) [ %scevgep39, %y_in_tile.loop_body6 ], [ %scevgep37, %y_in_tile.loop_exit ]
  %lsr.iv35 = phi ptr addrspace(1) [ %scevgep36, %y_in_tile.loop_body6 ], [ %scevgep, %y_in_tile.loop_exit ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %y_in_tile.loop_body6 ], [ %6, %y_in_tile.loop_exit ]
  %scevgep49 = getelementptr i8, ptr addrspace(3) %lsr.iv47, i64 -32
  %tiled_buffer = load float, ptr addrspace(3) %scevgep49, align 4
  store float %tiled_buffer, ptr addrspace(1) %lsr.iv44, align 4
  %scevgep51 = getelementptr i8, ptr addrspace(3) %lsr.iv47, i64 -16
  %tiled_buffer.1 = load float, ptr addrspace(3) %scevgep51, align 4
  store float %tiled_buffer.1, ptr addrspace(1) %lsr.iv41, align 4
  %tiled_buffer.2 = load float, ptr addrspace(3) %lsr.iv47, align 4
  store float %tiled_buffer.2, ptr addrspace(1) %lsr.iv38, align 4
  %scevgep50 = getelementptr i8, ptr addrspace(3) %lsr.iv47, i64 16
  %tiled_buffer.3 = load float, ptr addrspace(3) %scevgep50, align 4
  store float %tiled_buffer.3, ptr addrspace(1) %lsr.iv35, align 4
  %lsr.iv.next = add nsw i32 %lsr.iv, 16
  %scevgep36 = getelementptr i8, ptr addrspace(1) %lsr.iv35, i64 16777216
  %scevgep39 = getelementptr i8, ptr addrspace(1) %lsr.iv38, i64 16777216
  %scevgep42 = getelementptr i8, ptr addrspace(1) %lsr.iv41, i64 16777216
  %scevgep45 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 16777216
  %scevgep48 = getelementptr i8, ptr addrspace(3) %lsr.iv47, i64 64
  %53 = icmp ugt i32 %lsr.iv.next, 15
  br i1 %53, label %common.ret, label %y_in_tile.loop_body6

common.ret:                                       ; preds = %y_in_tile.loop_body6
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

; Function Attrs: nounwind
define void @fusion_97(ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(838860800) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(838860800) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg4) local_unnamed_addr #2 {
entry:
  %arg460 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg358 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg256 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg154 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg052 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !102
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !103
  %2 = lshr i32 %0, 5
  %3 = mul nuw nsw i32 %1, 3
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 3276800
  br i1 %5, label %tile_loop.loop_header9.preheader, label %common.ret

tile_loop.loop_header9.preheader:                 ; preds = %entry
  %6 = and i32 %0, 31
  %7 = shl nuw nsw i32 %4, 6
  %8 = or i32 %6, %7
  %9 = and i32 %4, 3
  %10 = udiv i32 %4, 400
  %11 = zext i32 %10 to i64
  %12 = zext i32 %9 to i64
  %13 = zext i32 %6 to i64
  %Arg_1.215 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr addrspace(1) %arg154, i64 0, i64 %11, i64 %12, i64 %13
  %Arg_1.216 = load float, ptr addrspace(1) %Arg_1.215, align 4, !invariant.load !99
  %14 = zext i32 %8 to i64
  %Arg_2.317 = getelementptr inbounds float, ptr addrspace(1) %arg256, i64 %14
  %Arg_2.318 = load float, ptr addrspace(1) %Arg_2.317, align 4, !invariant.load !99
  %multiply.919 = fmul float %Arg_1.216, %Arg_2.318
  %add.14.i49 = fadd float %multiply.919, 0.000000e+00
  %15 = zext i32 %4 to i64
  %Arg_0.123 = getelementptr inbounds float, ptr addrspace(1) %arg052, i64 %15
  %Arg_0.124 = load float, ptr addrspace(1) %Arg_0.123, align 4, !invariant.load !99
  %multiply.725 = fmul float %Arg_1.216, %Arg_0.124
  %16 = getelementptr inbounds float, ptr addrspace(1) %arg358, i64 %14
  store float %multiply.725, ptr addrspace(1) %16, align 4
  %Arg_1.215.163 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.215, i64 32
  %Arg_1.216.1 = load float, ptr addrspace(1) %Arg_1.215.163, align 4, !invariant.load !99
  %17 = zext i32 %7 to i64
  %18 = add i64 %13, %17
  %19 = getelementptr float, ptr addrspace(1) %arg256, i64 %18
  %Arg_2.317.165 = getelementptr inbounds float, ptr addrspace(1) %19, i64 32
  %Arg_2.318.1 = load float, ptr addrspace(1) %Arg_2.317.165, align 4, !invariant.load !99
  %multiply.919.1 = fmul float %Arg_1.216.1, %Arg_2.318.1
  %add.14.i49.1 = fadd float %add.14.i49, %multiply.919.1
  %multiply.725.1 = fmul float %Arg_1.216.1, %Arg_0.124
  %20 = getelementptr float, ptr addrspace(1) %arg358, i64 %18
  %21 = getelementptr inbounds float, ptr addrspace(1) %20, i64 32
  store float %multiply.725.1, ptr addrspace(1) %21, align 4
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i49.1, i32 16, i32 31)
  %add.14.i = fadd float %add.14.i49.1, %22
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i, i32 8, i32 31)
  %add.14.i45 = fadd float %add.14.i, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i45, i32 4, i32 31)
  %add.14.i46 = fadd float %add.14.i45, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i46, i32 2, i32 31)
  %add.14.i47 = fadd float %add.14.i46, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i47, i32 1, i32 31)
  %27 = icmp eq i32 %6, 0
  %28 = zext i32 %2 to i64
  %29 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 %28, i64 0, i64 0
  %add.14.i48 = fadd float %add.14.i47, %26
  br i1 %27, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %tile_loop.loop_header9.preheader
  %30 = icmp eq i32 %6, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %30, label %reduction_write_output-true, label %common.ret

intra_warp_reduce_write-true:                     ; preds = %tile_loop.loop_header9.preheader
  store float %add.14.i48, ptr addrspace(3) %29, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %31 = lshr i32 %4, 2
  %32 = urem i32 %31, 100
  %33 = zext i32 %32 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg460, i64 0, i64 %11, i64 %12, i64 %33
  %output.then.val = load float, ptr addrspace(3) %29, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #4

; Function Attrs: nounwind
define void @fusion_93(ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #2 {
entry:
  %arg248 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !102
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !104
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 32768
  br i1 %6, label %tile_loop.loop_header6.preheader, label %common.ret

tile_loop.loop_header6.preheader:                 ; preds = %entry
  %7 = mul nuw nsw i32 %5, 100
  %8 = add nuw nsw i32 %2, %7
  %9 = zext i32 %8 to i64
  %Arg_0.114 = getelementptr inbounds float, ptr addrspace(1) %arg044, i64 %9
  %Arg_1.212 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %9
  %Arg_1.213 = load float, ptr addrspace(1) %Arg_1.212, align 4, !invariant.load !99
  %Arg_0.115 = load float, ptr addrspace(1) %Arg_0.114, align 4, !invariant.load !99
  %multiply.416 = fmul float %Arg_1.213, %Arg_0.115
  %add.9.i41 = fadd float %multiply.416, 0.000000e+00
  %10 = zext i32 %7 to i64
  %11 = zext i32 %2 to i64
  %12 = add i64 %11, %10
  %13 = getelementptr float, ptr addrspace(1) %arg044, i64 %12
  %Arg_0.114.151 = getelementptr inbounds float, ptr addrspace(1) %13, i64 32
  %14 = getelementptr float, ptr addrspace(1) %arg146, i64 %12
  %Arg_1.212.153 = getelementptr inbounds float, ptr addrspace(1) %14, i64 32
  %Arg_1.213.1 = load float, ptr addrspace(1) %Arg_1.212.153, align 4, !invariant.load !99
  %Arg_0.115.1 = load float, ptr addrspace(1) %Arg_0.114.151, align 4, !invariant.load !99
  %multiply.416.1 = fmul float %Arg_1.213.1, %Arg_0.115.1
  %add.9.i41.1 = fadd float %add.9.i41, %multiply.416.1
  %Arg_0.114.255 = getelementptr inbounds float, ptr addrspace(1) %13, i64 64
  %Arg_1.212.257 = getelementptr inbounds float, ptr addrspace(1) %14, i64 64
  %Arg_1.213.2 = load float, ptr addrspace(1) %Arg_1.212.257, align 4, !invariant.load !99
  %Arg_0.115.2 = load float, ptr addrspace(1) %Arg_0.114.255, align 4, !invariant.load !99
  %multiply.416.2 = fmul float %Arg_1.213.2, %Arg_0.115.2
  %add.9.i41.2 = fadd float %add.9.i41.1, %multiply.416.2
  %x_loc11.3 = or i32 %0, 96
  %15 = icmp ult i32 %x_loc11.3, 100
  %16 = add nuw nsw i32 %x_loc11.3, %7
  %17 = zext i32 %16 to i64
  %Arg_0.114.3 = getelementptr inbounds float, ptr addrspace(1) %arg044, i64 %17
  %Arg_1.212.3 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %17
  br i1 %15, label %x_in_tile-true.3, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %18 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %19 = lshr i32 %5, 2
  %20 = zext i32 %19 to i64
  %21 = and i32 %5, 3
  %22 = zext i32 %21 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg248, i64 0, i64 %20, i64 %22
  br i1 %18, label %reduction_write_output-true, label %common.ret

x_in_tile-true.3:                                 ; preds = %tile_loop.loop_header6.preheader
  %Arg_1.213.3 = load float, ptr addrspace(1) %Arg_1.212.3, align 4, !invariant.load !99
  %Arg_0.115.3 = load float, ptr addrspace(1) %Arg_0.114.3, align 4, !invariant.load !99
  %multiply.416.3 = fmul float %Arg_1.213.3, %Arg_0.115.3
  %add.9.i41.3 = fadd float %add.9.i41.2, %multiply.416.3
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.3, %tile_loop.loop_header6.preheader
  %partial_reduction_result.1.3 = phi float [ %add.9.i41.3, %x_in_tile-true.3 ], [ %add.9.i41.2, %tile_loop.loop_header6.preheader ]
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.3, i32 16, i32 31)
  %add.9.i = fadd float %partial_reduction_result.1.3, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i, i32 8, i32 31)
  %add.9.i37 = fadd float %add.9.i, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i37, i32 4, i32 31)
  %add.9.i38 = fadd float %add.9.i37, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i38, i32 2, i32 31)
  %add.9.i39 = fadd float %add.9.i38, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i39, i32 1, i32 31)
  %28 = icmp eq i32 %2, 0
  %29 = zext i32 %3 to i64
  %30 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 %29, i64 0, i64 0
  %add.9.i40 = fadd float %add.9.i39, %27
  br i1 %28, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.9.i40, ptr addrspace(3) %30, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %30, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_92(ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg3) local_unnamed_addr #0 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = udiv i32 %linear_index_base, 100
  %5 = zext i32 %linear_index_base to i64
  %6 = getelementptr float, ptr addrspace(1) %arg211, i64 %5
  %7 = load <4 x float>, ptr addrspace(1) %6, align 16, !invariant.load !99
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %12 = zext i32 %4 to i64
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg19, i64 %12
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !99
  %subtract.6 = fsub float %8, %14
  %15 = getelementptr float, ptr addrspace(1) %arg07, i64 %5
  %16 = load <4 x float>, ptr addrspace(1) %15, align 16, !invariant.load !99
  %17 = extractelement <4 x float> %16, i32 0
  %18 = extractelement <4 x float> %16, i32 1
  %19 = extractelement <4 x float> %16, i32 2
  %20 = extractelement <4 x float> %16, i32 3
  %multiply.7 = fmul float %subtract.6, %17
  %21 = getelementptr float, ptr addrspace(1) %arg313, i64 %5
  %subtract.61 = fsub float %9, %14
  %multiply.72 = fmul float %subtract.61, %18
  %subtract.63 = fsub float %10, %14
  %multiply.74 = fmul float %subtract.63, %19
  %subtract.65 = fsub float %11, %14
  %multiply.76 = fmul float %subtract.65, %20
  %22 = insertelement <4 x float> poison, float %multiply.7, i32 0
  %23 = insertelement <4 x float> %22, float %multiply.72, i32 1
  %24 = insertelement <4 x float> %23, float %multiply.74, i32 2
  %25 = insertelement <4 x float> %24, float %multiply.76, i32 3
  store <4 x float> %25, ptr addrspace(1) %21, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_95(ptr noalias nocapture readonly align 16 dereferenceable(40960) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(172032) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(40960) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !106
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %linear_index = or i32 %1, %2
  %3 = lshr i32 %linear_index, 8
  %4 = and i32 %2, 255
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !99
  %8 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %9 = zext i32 %4 to i64
  %10 = zext i32 %3 to i64
  %11 = getelementptr [168 x [256 x float]], ptr addrspace(1) %arg13, i64 0, i64 %10, i64 %9
  %12 = getelementptr inbounds float, ptr addrspace(1) %11, i64 32768
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !99
  %multiply.6 = fmul float %8, %13
  %subtract.7 = fsub float %7, %multiply.6
  %14 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %5
  store float %subtract.7, ptr addrspace(1) %14, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_52(ptr noalias nocapture readonly align 16 dereferenceable(88080384) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(672) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(550502400) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(524288) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(524288) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(524288) %arg5) local_unnamed_addr #2 {
entry:
  %arg5113 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4111 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3109 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2107 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1105 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0103 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !108
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !109
  %2 = mul nuw nsw i32 %1, 168
  %3 = add nuw nsw i32 %0, %2
  %.frozen = freeze i32 %3
  %4 = udiv i32 %.frozen, 168
  %5 = mul i32 %4, 168
  %.decomposed = sub i32 %.frozen, %5
  %6 = and i32 %4, 15
  %7 = udiv i32 %3, 2688
  %8 = mul nuw nsw i32 %7, 100
  %9 = add nuw nsw i32 %6, %8
  %10 = zext i32 %9 to i64
  %11 = zext i32 %.decomposed to i64
  %Arg_2.318 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg2107, i64 0, i64 %10, i64 %11
  %Arg_2.319 = load float, ptr addrspace(1) %Arg_2.318, align 4, !invariant.load !99
  %Arg_1.220 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg1105, i64 0, i64 %11
  %Arg_1.221 = load float, ptr addrspace(1) %Arg_1.220, align 4, !invariant.load !99
  %multiply.822 = fmul float %Arg_2.319, %Arg_1.221
  %12 = zext i32 %3 to i64
  %Arg_0.123 = getelementptr inbounds float, ptr addrspace(1) %arg0103, i64 %12
  %Arg_0.124 = load float, ptr addrspace(1) %Arg_0.123, align 4, !invariant.load !99
  %multiply.925 = fmul float %multiply.822, %Arg_0.124
  %add.14.i88 = fadd float %multiply.925, 0.000000e+00
  %13 = zext i32 %4 to i64
  %Arg_3.427 = getelementptr inbounds float, ptr addrspace(1) %arg3109, i64 %13
  %Arg_3.428 = load float, ptr addrspace(1) %Arg_3.427, align 4, !invariant.load !99
  %14 = fmul float %multiply.822, %Arg_3.428
  %add.23.i89 = fsub float 0.000000e+00, %14
  %x_loc17.1 = or i32 %0, 32
  %15 = add nuw nsw i32 %x_loc17.1, %2
  %.frozen93 = freeze i32 %15
  %16 = udiv i32 %.frozen93, 168
  %17 = mul i32 %16, 168
  %.decomposed94 = sub i32 %.frozen93, %17
  %18 = and i32 %16, 15
  %19 = udiv i32 %15, 2688
  %20 = mul nuw nsw i32 %19, 100
  %21 = add nuw nsw i32 %18, %20
  %22 = zext i32 %21 to i64
  %23 = zext i32 %.decomposed94 to i64
  %Arg_2.318.1 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg2107, i64 0, i64 %22, i64 %23
  %Arg_2.319.1 = load float, ptr addrspace(1) %Arg_2.318.1, align 4, !invariant.load !99
  %Arg_1.220.1 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg1105, i64 0, i64 %23
  %Arg_1.221.1 = load float, ptr addrspace(1) %Arg_1.220.1, align 4, !invariant.load !99
  %multiply.822.1 = fmul float %Arg_2.319.1, %Arg_1.221.1
  %24 = zext i32 %2 to i64
  %25 = zext i32 %0 to i64
  %26 = add i64 %25, %24
  %27 = getelementptr float, ptr addrspace(1) %arg0103, i64 %26
  %Arg_0.123.1116 = getelementptr inbounds float, ptr addrspace(1) %27, i64 32
  %Arg_0.124.1 = load float, ptr addrspace(1) %Arg_0.123.1116, align 4, !invariant.load !99
  %multiply.925.1 = fmul float %multiply.822.1, %Arg_0.124.1
  %add.14.i88.1 = fadd float %add.14.i88, %multiply.925.1
  %28 = zext i32 %16 to i64
  %Arg_3.427.1 = getelementptr inbounds float, ptr addrspace(1) %arg3109, i64 %28
  %Arg_3.428.1 = load float, ptr addrspace(1) %Arg_3.427.1, align 4, !invariant.load !99
  %29 = fmul float %multiply.822.1, %Arg_3.428.1
  %add.23.i89.1 = fsub float %add.23.i89, %29
  %x_loc17.2 = or i32 %0, 64
  %30 = add nuw nsw i32 %x_loc17.2, %2
  %.frozen95 = freeze i32 %30
  %31 = udiv i32 %.frozen95, 168
  %32 = mul i32 %31, 168
  %.decomposed96 = sub i32 %.frozen95, %32
  %33 = and i32 %31, 15
  %34 = udiv i32 %30, 2688
  %35 = mul nuw nsw i32 %34, 100
  %36 = add nuw nsw i32 %33, %35
  %37 = zext i32 %36 to i64
  %38 = zext i32 %.decomposed96 to i64
  %Arg_2.318.2 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg2107, i64 0, i64 %37, i64 %38
  %Arg_2.319.2 = load float, ptr addrspace(1) %Arg_2.318.2, align 4, !invariant.load !99
  %Arg_1.220.2 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg1105, i64 0, i64 %38
  %Arg_1.221.2 = load float, ptr addrspace(1) %Arg_1.220.2, align 4, !invariant.load !99
  %multiply.822.2 = fmul float %Arg_2.319.2, %Arg_1.221.2
  %Arg_0.123.2118 = getelementptr inbounds float, ptr addrspace(1) %27, i64 64
  %Arg_0.124.2 = load float, ptr addrspace(1) %Arg_0.123.2118, align 4, !invariant.load !99
  %multiply.925.2 = fmul float %multiply.822.2, %Arg_0.124.2
  %add.14.i88.2 = fadd float %add.14.i88.1, %multiply.925.2
  %39 = zext i32 %31 to i64
  %Arg_3.427.2 = getelementptr inbounds float, ptr addrspace(1) %arg3109, i64 %39
  %Arg_3.428.2 = load float, ptr addrspace(1) %Arg_3.427.2, align 4, !invariant.load !99
  %40 = fmul float %multiply.822.2, %Arg_3.428.2
  %add.23.i89.2 = fsub float %add.23.i89.1, %40
  %x_loc17.3 = or i32 %0, 96
  %41 = add nuw nsw i32 %x_loc17.3, %2
  %.frozen97 = freeze i32 %41
  %42 = udiv i32 %.frozen97, 168
  %43 = mul i32 %42, 168
  %.decomposed98 = sub i32 %.frozen97, %43
  %44 = and i32 %42, 15
  %45 = udiv i32 %41, 2688
  %46 = mul nuw nsw i32 %45, 100
  %47 = add nuw nsw i32 %44, %46
  %48 = zext i32 %47 to i64
  %49 = zext i32 %.decomposed98 to i64
  %Arg_2.318.3 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg2107, i64 0, i64 %48, i64 %49
  %Arg_2.319.3 = load float, ptr addrspace(1) %Arg_2.318.3, align 4, !invariant.load !99
  %Arg_1.220.3 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg1105, i64 0, i64 %49
  %Arg_1.221.3 = load float, ptr addrspace(1) %Arg_1.220.3, align 4, !invariant.load !99
  %multiply.822.3 = fmul float %Arg_2.319.3, %Arg_1.221.3
  %Arg_0.123.3120 = getelementptr inbounds float, ptr addrspace(1) %27, i64 96
  %Arg_0.124.3 = load float, ptr addrspace(1) %Arg_0.123.3120, align 4, !invariant.load !99
  %multiply.925.3 = fmul float %multiply.822.3, %Arg_0.124.3
  %add.14.i88.3 = fadd float %add.14.i88.2, %multiply.925.3
  %50 = zext i32 %42 to i64
  %Arg_3.427.3 = getelementptr inbounds float, ptr addrspace(1) %arg3109, i64 %50
  %Arg_3.428.3 = load float, ptr addrspace(1) %Arg_3.427.3, align 4, !invariant.load !99
  %51 = fmul float %multiply.822.3, %Arg_3.428.3
  %add.23.i89.3 = fsub float %add.23.i89.2, %51
  %x_loc17.4 = or i32 %0, 128
  %52 = add nuw nsw i32 %x_loc17.4, %2
  %.frozen99 = freeze i32 %52
  %53 = udiv i32 %.frozen99, 168
  %54 = mul i32 %53, 168
  %.decomposed100 = sub i32 %.frozen99, %54
  %55 = and i32 %53, 15
  %56 = udiv i32 %52, 2688
  %57 = mul nuw nsw i32 %56, 100
  %58 = add nuw nsw i32 %55, %57
  %59 = zext i32 %58 to i64
  %60 = zext i32 %.decomposed100 to i64
  %Arg_2.318.4 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg2107, i64 0, i64 %59, i64 %60
  %Arg_2.319.4 = load float, ptr addrspace(1) %Arg_2.318.4, align 4, !invariant.load !99
  %Arg_1.220.4 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg1105, i64 0, i64 %60
  %Arg_1.221.4 = load float, ptr addrspace(1) %Arg_1.220.4, align 4, !invariant.load !99
  %multiply.822.4 = fmul float %Arg_2.319.4, %Arg_1.221.4
  %Arg_0.123.4122 = getelementptr inbounds float, ptr addrspace(1) %27, i64 128
  %Arg_0.124.4 = load float, ptr addrspace(1) %Arg_0.123.4122, align 4, !invariant.load !99
  %multiply.925.4 = fmul float %multiply.822.4, %Arg_0.124.4
  %add.14.i88.4 = fadd float %add.14.i88.3, %multiply.925.4
  %61 = zext i32 %53 to i64
  %Arg_3.427.4 = getelementptr inbounds float, ptr addrspace(1) %arg3109, i64 %61
  %Arg_3.428.4 = load float, ptr addrspace(1) %Arg_3.427.4, align 4, !invariant.load !99
  %62 = fmul float %multiply.822.4, %Arg_3.428.4
  %add.23.i89.4 = fsub float %add.23.i89.3, %62
  %x_loc17.5 = or i32 %0, 160
  %63 = icmp ult i32 %x_loc17.5, 168
  br i1 %63, label %x_in_tile-true.5, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after62, %reduction_write_output-true66
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %64 = icmp eq i32 %89, 0
  tail call void @llvm.nvvm.barrier0()
  %65 = lshr i32 %1, 4
  %66 = zext i32 %65 to i64
  %67 = and i32 %1, 15
  %68 = zext i32 %67 to i64
  %output_element_address = getelementptr inbounds [8192 x [16 x float]], ptr addrspace(1) %arg4111, i64 0, i64 %66, i64 %68
  %69 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %25
  br i1 %64, label %reduction_write_output-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  %70 = icmp eq i32 %89, 0
  %71 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result2.1.5, i32 16, i32 31)
  %add.23.i = fadd float %partial_reduction_result2.1.5, %71
  %72 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i, i32 8, i32 31)
  %add.23.i84 = fadd float %add.23.i, %72
  %73 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i84, i32 4, i32 31)
  %add.23.i85 = fadd float %add.23.i84, %73
  %74 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i85, i32 2, i32 31)
  %add.23.i86 = fadd float %add.23.i85, %74
  %75 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i86, i32 1, i32 31)
  %add.23.i87 = fadd float %add.23.i86, %75
  br i1 %70, label %intra_warp_reduce_write-true61, label %intra_warp_reduce_write-after62

intra_warp_reduce_write-after62:                  ; preds = %intra_warp_reduce_write-true61, %inter_warp_reduce-after
  %76 = icmp eq i32 %89, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address68 = getelementptr inbounds [8192 x [16 x float]], ptr addrspace(1) %arg5113, i64 0, i64 %66, i64 %68
  %77 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %25
  br i1 %76, label %reduction_write_output-true66, label %common.ret

x_in_tile-true.5:                                 ; preds = %entry
  %78 = add nuw nsw i32 %x_loc17.5, %2
  %.frozen101 = freeze i32 %78
  %79 = udiv i32 %.frozen101, 168
  %80 = mul i32 %79, 168
  %.decomposed102 = sub i32 %.frozen101, %80
  %81 = and i32 %79, 15
  %82 = udiv i32 %78, 2688
  %83 = mul nuw nsw i32 %82, 100
  %84 = add nuw nsw i32 %81, %83
  %85 = zext i32 %84 to i64
  %86 = zext i32 %.decomposed102 to i64
  %Arg_2.318.5 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg2107, i64 0, i64 %85, i64 %86
  %Arg_2.319.5 = load float, ptr addrspace(1) %Arg_2.318.5, align 4, !invariant.load !99
  %Arg_1.220.5 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg1105, i64 0, i64 %86
  %Arg_1.221.5 = load float, ptr addrspace(1) %Arg_1.220.5, align 4, !invariant.load !99
  %multiply.822.5 = fmul float %Arg_2.319.5, %Arg_1.221.5
  %Arg_0.123.5124 = getelementptr inbounds float, ptr addrspace(1) %27, i64 160
  %Arg_0.124.5 = load float, ptr addrspace(1) %Arg_0.123.5124, align 4, !invariant.load !99
  %multiply.925.5 = fmul float %multiply.822.5, %Arg_0.124.5
  %add.14.i88.5 = fadd float %add.14.i88.4, %multiply.925.5
  %87 = zext i32 %79 to i64
  %Arg_3.427.5 = getelementptr inbounds float, ptr addrspace(1) %arg3109, i64 %87
  %Arg_3.428.5 = load float, ptr addrspace(1) %Arg_3.427.5, align 4, !invariant.load !99
  %88 = fmul float %multiply.822.5, %Arg_3.428.5
  %add.23.i89.5 = fsub float %add.23.i89.4, %88
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.5, %entry
  %partial_reduction_result.1.5 = phi float [ %add.14.i88.5, %x_in_tile-true.5 ], [ %add.14.i88.4, %entry ]
  %partial_reduction_result2.1.5 = phi float [ %add.23.i89.5, %x_in_tile-true.5 ], [ %add.23.i89.4, %entry ]
  %89 = trunc i64 %25 to i32
  %90 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.5, i32 16, i32 31)
  %add.14.i = fadd float %partial_reduction_result.1.5, %90
  %91 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i, i32 8, i32 31)
  %add.14.i80 = fadd float %add.14.i, %91
  %92 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i80, i32 4, i32 31)
  %add.14.i81 = fadd float %add.14.i80, %92
  %93 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i81, i32 2, i32 31)
  %add.14.i82 = fadd float %add.14.i81, %93
  %94 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i82, i32 1, i32 31)
  %95 = icmp eq i32 %89, 0
  %add.14.i83 = fadd float %add.14.i82, %94
  br i1 %95, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.14.i83, ptr addrspace(3) @shared_cache2, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %69, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %inter_warp_reduce-after

intra_warp_reduce_write-true61:                   ; preds = %inter_warp_reduce-after
  store float %add.23.i87, ptr addrspace(3) @shared_cache3, align 4
  br label %intra_warp_reduce_write-after62

reduction_write_output-true66:                    ; preds = %intra_warp_reduce_write-after62
  %output69.then.val = load float, ptr addrspace(3) %77, align 4
  store float %output69.then.val, ptr addrspace(1) %output_element_address68, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_84(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg12) local_unnamed_addr #2 {
entry:
  %arg12273 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11271 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10269 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9267 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8265 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7263 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6261 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5259 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4257 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3255 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2253 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1251 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0249 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !102
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !104
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 32768
  br i1 %6, label %tile_loop.loop_header37.preheader, label %common.ret

tile_loop.loop_header37.preheader:                ; preds = %entry
  %7 = mul nuw nsw i32 %5, 100
  %Arg_5.672 = load float, ptr addrspace(1) %arg5259, align 16
  %8 = add nuw nsw i32 %2, %7
  %9 = urem i32 %8, 100
  %.frozen = freeze i32 %8
  %10 = udiv i32 %.frozen, 400
  %11 = zext i32 %10 to i64
  %12 = zext i32 %9 to i64
  %Arg_1.243 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1251, i64 0, i64 %11, i64 %12, i64 0
  %Arg_1.244 = load float, ptr addrspace(1) %Arg_1.243, align 4, !invariant.load !99
  %13 = zext i32 %8 to i64
  %Arg_0.145 = getelementptr inbounds float, ptr addrspace(1) %arg0249, i64 %13
  %Arg_0.146 = load float, ptr addrspace(1) %Arg_0.145, align 4, !invariant.load !99
  %multiply.947 = fmul float %Arg_1.244, %Arg_0.146
  %add.14.i235 = fadd float %multiply.947, 0.000000e+00
  %Arg_2.349 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2253, i64 0, i64 %11, i64 %12, i64 0
  %Arg_2.350 = load float, ptr addrspace(1) %Arg_2.349, align 4, !invariant.load !99
  %multiply.1853 = fmul float %Arg_0.146, %Arg_2.350
  %add.22.i236 = fadd float %multiply.1853, 0.000000e+00
  %Arg_3.455 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3255, i64 0, i64 %11, i64 %12, i64 0
  %Arg_3.456 = load float, ptr addrspace(1) %Arg_3.455, align 4, !invariant.load !99
  %multiply.2659 = fmul float %Arg_0.146, %Arg_3.456
  %add.30.i237 = fadd float %multiply.2659, 0.000000e+00
  %Arg_4.561 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4257, i64 0, i64 %11, i64 %12, i64 0
  %Arg_4.562 = load float, ptr addrspace(1) %Arg_4.561, align 4, !invariant.load !99
  %multiply.3465 = fmul float %Arg_0.146, %Arg_4.562
  %add.38.i238 = fadd float %multiply.3465, 0.000000e+00
  %add.48.i239 = fadd float %Arg_0.146, 0.000000e+00
  %14 = mul i32 %10, 400
  %urem.decomposed = sub i32 %.frozen, %14
  %15 = and i32 %urem.decomposed, 3
  %16 = lshr i32 %.frozen, 2
  %17 = urem i32 %16, 100
  %18 = zext i32 %15 to i64
  %19 = zext i32 %17 to i64
  %Arg_0.170 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %11, i64 %18, i64 %19
  %Arg_0.171 = load float, ptr addrspace(1) %Arg_0.170, align 4, !invariant.load !99
  %20 = lshr i32 %urem.decomposed, 2
  %21 = zext i32 %20 to i64
  %Arg_0.173 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %11, i64 %18, i64 %21
  %Arg_0.174 = load float, ptr addrspace(1) %Arg_0.173, align 4, !invariant.load !99
  %multiply.4375 = fmul float %Arg_5.672, %Arg_0.174
  %22 = getelementptr inbounds float, ptr addrspace(1) %arg10269, i64 %13
  store float %Arg_0.171, ptr addrspace(1) %22, align 4
  %23 = getelementptr inbounds float, ptr addrspace(1) %arg11271, i64 %13
  store float %multiply.4375, ptr addrspace(1) %23, align 4
  %x_loc42.1 = or i32 %2, 32
  %24 = add nuw nsw i32 %x_loc42.1, %7
  %25 = urem i32 %24, 100
  %.frozen246 = freeze i32 %24
  %26 = udiv i32 %.frozen246, 400
  %27 = zext i32 %26 to i64
  %28 = zext i32 %25 to i64
  %Arg_1.243.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1251, i64 0, i64 %27, i64 %28, i64 0
  %Arg_1.244.1 = load float, ptr addrspace(1) %Arg_1.243.1, align 4, !invariant.load !99
  %29 = zext i32 %7 to i64
  %30 = zext i32 %2 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr float, ptr addrspace(1) %arg0249, i64 %31
  %Arg_0.145.1276 = getelementptr inbounds float, ptr addrspace(1) %32, i64 32
  %Arg_0.146.1 = load float, ptr addrspace(1) %Arg_0.145.1276, align 4, !invariant.load !99
  %multiply.947.1 = fmul float %Arg_1.244.1, %Arg_0.146.1
  %add.14.i235.1 = fadd float %add.14.i235, %multiply.947.1
  %Arg_2.349.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2253, i64 0, i64 %27, i64 %28, i64 0
  %Arg_2.350.1 = load float, ptr addrspace(1) %Arg_2.349.1, align 4, !invariant.load !99
  %multiply.1853.1 = fmul float %Arg_0.146.1, %Arg_2.350.1
  %add.22.i236.1 = fadd float %add.22.i236, %multiply.1853.1
  %Arg_3.455.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3255, i64 0, i64 %27, i64 %28, i64 0
  %Arg_3.456.1 = load float, ptr addrspace(1) %Arg_3.455.1, align 4, !invariant.load !99
  %multiply.2659.1 = fmul float %Arg_0.146.1, %Arg_3.456.1
  %add.30.i237.1 = fadd float %add.30.i237, %multiply.2659.1
  %Arg_4.561.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4257, i64 0, i64 %27, i64 %28, i64 0
  %Arg_4.562.1 = load float, ptr addrspace(1) %Arg_4.561.1, align 4, !invariant.load !99
  %multiply.3465.1 = fmul float %Arg_0.146.1, %Arg_4.562.1
  %add.38.i238.1 = fadd float %add.38.i238, %multiply.3465.1
  %add.48.i239.1 = fadd float %add.48.i239, %Arg_0.146.1
  %33 = mul i32 %26, 400
  %urem.1.decomposed = sub i32 %.frozen246, %33
  %34 = and i32 %urem.1.decomposed, 3
  %35 = lshr i32 %.frozen246, 2
  %36 = urem i32 %35, 100
  %37 = zext i32 %34 to i64
  %38 = zext i32 %36 to i64
  %Arg_0.170.1 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %27, i64 %37, i64 %38
  %Arg_0.171.1 = load float, ptr addrspace(1) %Arg_0.170.1, align 4, !invariant.load !99
  %39 = lshr i32 %urem.1.decomposed, 2
  %40 = zext i32 %39 to i64
  %Arg_0.173.1 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %27, i64 %37, i64 %40
  %Arg_0.174.1 = load float, ptr addrspace(1) %Arg_0.173.1, align 4, !invariant.load !99
  %multiply.4375.1 = fmul float %Arg_5.672, %Arg_0.174.1
  %41 = getelementptr float, ptr addrspace(1) %arg10269, i64 %31
  %42 = getelementptr inbounds float, ptr addrspace(1) %41, i64 32
  store float %Arg_0.171.1, ptr addrspace(1) %42, align 4
  %43 = getelementptr float, ptr addrspace(1) %arg11271, i64 %31
  %44 = getelementptr inbounds float, ptr addrspace(1) %43, i64 32
  store float %multiply.4375.1, ptr addrspace(1) %44, align 4
  %x_loc42.2 = or i32 %2, 64
  %45 = add nuw nsw i32 %x_loc42.2, %7
  %46 = urem i32 %45, 100
  %.frozen247 = freeze i32 %45
  %47 = udiv i32 %.frozen247, 400
  %48 = zext i32 %47 to i64
  %49 = zext i32 %46 to i64
  %Arg_1.243.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1251, i64 0, i64 %48, i64 %49, i64 0
  %Arg_1.244.2 = load float, ptr addrspace(1) %Arg_1.243.2, align 4, !invariant.load !99
  %Arg_0.145.2280 = getelementptr inbounds float, ptr addrspace(1) %32, i64 64
  %Arg_0.146.2 = load float, ptr addrspace(1) %Arg_0.145.2280, align 4, !invariant.load !99
  %multiply.947.2 = fmul float %Arg_1.244.2, %Arg_0.146.2
  %add.14.i235.2 = fadd float %add.14.i235.1, %multiply.947.2
  %Arg_2.349.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2253, i64 0, i64 %48, i64 %49, i64 0
  %Arg_2.350.2 = load float, ptr addrspace(1) %Arg_2.349.2, align 4, !invariant.load !99
  %multiply.1853.2 = fmul float %Arg_0.146.2, %Arg_2.350.2
  %add.22.i236.2 = fadd float %add.22.i236.1, %multiply.1853.2
  %Arg_3.455.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3255, i64 0, i64 %48, i64 %49, i64 0
  %Arg_3.456.2 = load float, ptr addrspace(1) %Arg_3.455.2, align 4, !invariant.load !99
  %multiply.2659.2 = fmul float %Arg_0.146.2, %Arg_3.456.2
  %add.30.i237.2 = fadd float %add.30.i237.1, %multiply.2659.2
  %Arg_4.561.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4257, i64 0, i64 %48, i64 %49, i64 0
  %Arg_4.562.2 = load float, ptr addrspace(1) %Arg_4.561.2, align 4, !invariant.load !99
  %multiply.3465.2 = fmul float %Arg_0.146.2, %Arg_4.562.2
  %add.38.i238.2 = fadd float %add.38.i238.1, %multiply.3465.2
  %add.48.i239.2 = fadd float %add.48.i239.1, %Arg_0.146.2
  %50 = mul i32 %47, 400
  %urem.2.decomposed = sub i32 %.frozen247, %50
  %51 = and i32 %urem.2.decomposed, 3
  %52 = lshr i32 %.frozen247, 2
  %53 = urem i32 %52, 100
  %54 = zext i32 %51 to i64
  %55 = zext i32 %53 to i64
  %Arg_0.170.2 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %48, i64 %54, i64 %55
  %Arg_0.171.2 = load float, ptr addrspace(1) %Arg_0.170.2, align 4, !invariant.load !99
  %56 = lshr i32 %urem.2.decomposed, 2
  %57 = zext i32 %56 to i64
  %Arg_0.173.2 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %48, i64 %54, i64 %57
  %Arg_0.174.2 = load float, ptr addrspace(1) %Arg_0.173.2, align 4, !invariant.load !99
  %multiply.4375.2 = fmul float %Arg_5.672, %Arg_0.174.2
  %58 = getelementptr inbounds float, ptr addrspace(1) %41, i64 64
  store float %Arg_0.171.2, ptr addrspace(1) %58, align 4
  %59 = getelementptr inbounds float, ptr addrspace(1) %43, i64 64
  store float %multiply.4375.2, ptr addrspace(1) %59, align 4
  %x_loc42.3 = or i32 %0, 96
  %60 = icmp ult i32 %x_loc42.3, 100
  br i1 %60, label %x_in_tile-true.3, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after182, %reduction_write_output-true186, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %x_in_tile-after.15, %intra_warp_reduce_write-true
  %61 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %62 = lshr i32 %5, 2
  %63 = zext i32 %62 to i64
  %64 = and i32 %5, 3
  %65 = zext i32 %64 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg6261, i64 0, i64 %63, i64 %65
  %66 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache4, i64 0, i64 %125, i64 0, i64 %30
  br i1 %61, label %reduction_write_output-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  %67 = icmp eq i32 %2, 0
  %68 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result2.1.3, i32 16, i32 31)
  %add.22.i = fadd float %partial_reduction_result2.1.3, %68
  %69 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i, i32 8, i32 31)
  %add.22.i219 = fadd float %add.22.i, %69
  %70 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i219, i32 4, i32 31)
  %add.22.i220 = fadd float %add.22.i219, %70
  %71 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i220, i32 2, i32 31)
  %add.22.i221 = fadd float %add.22.i220, %71
  %72 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i221, i32 1, i32 31)
  %73 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache5, i64 0, i64 %125, i64 0, i64 0
  %add.22.i222 = fadd float %add.22.i221, %72
  br i1 %67, label %intra_warp_reduce_write-true106, label %intra_warp_reduce_write-after107

intra_warp_reduce_write-after107:                 ; preds = %intra_warp_reduce_write-true106, %inter_warp_reduce-after
  %74 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address113 = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg7263, i64 0, i64 %63, i64 %65
  %75 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache5, i64 0, i64 %125, i64 0, i64 %30
  br i1 %74, label %reduction_write_output-true111, label %inter_warp_reduce-after109

inter_warp_reduce-after109:                       ; preds = %intra_warp_reduce_write-after107, %reduction_write_output-true111
  %76 = icmp eq i32 %2, 0
  %77 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result5.1.3, i32 16, i32 31)
  %add.30.i = fadd float %partial_reduction_result5.1.3, %77
  %78 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.30.i, i32 8, i32 31)
  %add.30.i223 = fadd float %add.30.i, %78
  %79 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.30.i223, i32 4, i32 31)
  %add.30.i224 = fadd float %add.30.i223, %79
  %80 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.30.i224, i32 2, i32 31)
  %add.30.i225 = fadd float %add.30.i224, %80
  %81 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.30.i225, i32 1, i32 31)
  %82 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache6, i64 0, i64 %125, i64 0, i64 0
  %add.30.i226 = fadd float %add.30.i225, %81
  br i1 %76, label %intra_warp_reduce_write-true131, label %intra_warp_reduce_write-after132

intra_warp_reduce_write-after132:                 ; preds = %intra_warp_reduce_write-true131, %inter_warp_reduce-after109
  %83 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address138 = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg8265, i64 0, i64 %63, i64 %65
  %84 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache6, i64 0, i64 %125, i64 0, i64 %30
  br i1 %83, label %reduction_write_output-true136, label %inter_warp_reduce-after134

inter_warp_reduce-after134:                       ; preds = %intra_warp_reduce_write-after132, %reduction_write_output-true136
  %85 = icmp eq i32 %2, 0
  %86 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result8.1.3, i32 16, i32 31)
  %add.38.i = fadd float %partial_reduction_result8.1.3, %86
  %87 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.38.i, i32 8, i32 31)
  %add.38.i227 = fadd float %add.38.i, %87
  %88 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.38.i227, i32 4, i32 31)
  %add.38.i228 = fadd float %add.38.i227, %88
  %89 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.38.i228, i32 2, i32 31)
  %add.38.i229 = fadd float %add.38.i228, %89
  %90 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.38.i229, i32 1, i32 31)
  %91 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache7, i64 0, i64 %125, i64 0, i64 0
  %add.38.i230 = fadd float %add.38.i229, %90
  br i1 %85, label %intra_warp_reduce_write-true156, label %intra_warp_reduce_write-after157

intra_warp_reduce_write-after157:                 ; preds = %intra_warp_reduce_write-true156, %inter_warp_reduce-after134
  %92 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address163 = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg9267, i64 0, i64 %63, i64 %65
  %93 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache7, i64 0, i64 %125, i64 0, i64 %30
  br i1 %92, label %reduction_write_output-true161, label %inter_warp_reduce-after159

inter_warp_reduce-after159:                       ; preds = %intra_warp_reduce_write-after157, %reduction_write_output-true161
  %94 = icmp eq i32 %2, 0
  %95 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result11.1.3, i32 16, i32 31)
  %add.48.i = fadd float %partial_reduction_result11.1.3, %95
  %96 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.48.i, i32 8, i32 31)
  %add.48.i231 = fadd float %add.48.i, %96
  %97 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.48.i231, i32 4, i32 31)
  %add.48.i232 = fadd float %add.48.i231, %97
  %98 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.48.i232, i32 2, i32 31)
  %add.48.i233 = fadd float %add.48.i232, %98
  %99 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.48.i233, i32 1, i32 31)
  %100 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache8, i64 0, i64 %125, i64 0, i64 0
  %add.48.i234 = fadd float %add.48.i233, %99
  br i1 %94, label %intra_warp_reduce_write-true181, label %intra_warp_reduce_write-after182

intra_warp_reduce_write-after182:                 ; preds = %intra_warp_reduce_write-true181, %inter_warp_reduce-after159
  %101 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address188 = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg12273, i64 0, i64 %63, i64 %65
  %102 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache8, i64 0, i64 %125, i64 0, i64 %30
  br i1 %101, label %reduction_write_output-true186, label %common.ret

x_in_tile-true.3:                                 ; preds = %tile_loop.loop_header37.preheader
  %103 = add nuw nsw i32 %x_loc42.3, %7
  %104 = urem i32 %103, 100
  %.frozen248 = freeze i32 %103
  %105 = udiv i32 %.frozen248, 400
  %106 = zext i32 %105 to i64
  %107 = zext i32 %104 to i64
  %Arg_1.243.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1251, i64 0, i64 %106, i64 %107, i64 0
  %Arg_1.244.3 = load float, ptr addrspace(1) %Arg_1.243.3, align 4, !invariant.load !99
  %108 = zext i32 %103 to i64
  %Arg_0.145.3 = getelementptr inbounds float, ptr addrspace(1) %arg0249, i64 %108
  %Arg_0.146.3 = load float, ptr addrspace(1) %Arg_0.145.3, align 4, !invariant.load !99
  %multiply.947.3 = fmul float %Arg_1.244.3, %Arg_0.146.3
  %add.14.i235.3 = fadd float %add.14.i235.2, %multiply.947.3
  %Arg_2.349.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2253, i64 0, i64 %106, i64 %107, i64 0
  %Arg_2.350.3 = load float, ptr addrspace(1) %Arg_2.349.3, align 4, !invariant.load !99
  %multiply.1853.3 = fmul float %Arg_0.146.3, %Arg_2.350.3
  %add.22.i236.3 = fadd float %add.22.i236.2, %multiply.1853.3
  %Arg_3.455.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3255, i64 0, i64 %106, i64 %107, i64 0
  %Arg_3.456.3 = load float, ptr addrspace(1) %Arg_3.455.3, align 4, !invariant.load !99
  %multiply.2659.3 = fmul float %Arg_0.146.3, %Arg_3.456.3
  %add.30.i237.3 = fadd float %add.30.i237.2, %multiply.2659.3
  %Arg_4.561.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4257, i64 0, i64 %106, i64 %107, i64 0
  %Arg_4.562.3 = load float, ptr addrspace(1) %Arg_4.561.3, align 4, !invariant.load !99
  %multiply.3465.3 = fmul float %Arg_0.146.3, %Arg_4.562.3
  %add.38.i238.3 = fadd float %add.38.i238.2, %multiply.3465.3
  %add.48.i239.3 = fadd float %add.48.i239.2, %Arg_0.146.3
  %109 = mul i32 %105, 400
  %urem.3.decomposed = sub i32 %.frozen248, %109
  %110 = and i32 %urem.3.decomposed, 3
  %111 = lshr i32 %.frozen248, 2
  %112 = urem i32 %111, 100
  %113 = zext i32 %110 to i64
  %114 = zext i32 %112 to i64
  %Arg_0.170.3 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %106, i64 %113, i64 %114
  %Arg_0.171.3 = load float, ptr addrspace(1) %Arg_0.170.3, align 4, !invariant.load !99
  %115 = lshr i32 %urem.3.decomposed, 2
  %116 = zext i32 %115 to i64
  %Arg_0.173.3 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %106, i64 %113, i64 %116
  %Arg_0.174.3 = load float, ptr addrspace(1) %Arg_0.173.3, align 4, !invariant.load !99
  %multiply.4375.3 = fmul float %Arg_5.672, %Arg_0.174.3
  %117 = getelementptr inbounds float, ptr addrspace(1) %arg10269, i64 %108
  store float %Arg_0.171.3, ptr addrspace(1) %117, align 4
  %118 = getelementptr inbounds float, ptr addrspace(1) %arg11271, i64 %108
  store float %multiply.4375.3, ptr addrspace(1) %118, align 4
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.3, %tile_loop.loop_header37.preheader
  %partial_reduction_result5.1.3 = phi float [ %add.30.i237.3, %x_in_tile-true.3 ], [ %add.30.i237.2, %tile_loop.loop_header37.preheader ]
  %partial_reduction_result2.1.3 = phi float [ %add.22.i236.3, %x_in_tile-true.3 ], [ %add.22.i236.2, %tile_loop.loop_header37.preheader ]
  %partial_reduction_result8.1.3 = phi float [ %add.38.i238.3, %x_in_tile-true.3 ], [ %add.38.i238.2, %tile_loop.loop_header37.preheader ]
  %partial_reduction_result.1.3 = phi float [ %add.14.i235.3, %x_in_tile-true.3 ], [ %add.14.i235.2, %tile_loop.loop_header37.preheader ]
  %partial_reduction_result11.1.3 = phi float [ %add.48.i239.3, %x_in_tile-true.3 ], [ %add.48.i239.2, %tile_loop.loop_header37.preheader ]
  %119 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.3, i32 16, i32 31)
  %add.14.i = fadd float %partial_reduction_result.1.3, %119
  %120 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i, i32 8, i32 31)
  %add.14.i215 = fadd float %add.14.i, %120
  %121 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i215, i32 4, i32 31)
  %add.14.i216 = fadd float %add.14.i215, %121
  %122 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i216, i32 2, i32 31)
  %add.14.i217 = fadd float %add.14.i216, %122
  %123 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i217, i32 1, i32 31)
  %124 = icmp eq i32 %2, 0
  %125 = zext i32 %3 to i64
  %126 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache4, i64 0, i64 %125, i64 0, i64 0
  %add.14.i218 = fadd float %add.14.i217, %123
  br i1 %124, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.14.i218, ptr addrspace(3) %126, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %66, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %inter_warp_reduce-after

intra_warp_reduce_write-true106:                  ; preds = %inter_warp_reduce-after
  store float %add.22.i222, ptr addrspace(3) %73, align 4
  br label %intra_warp_reduce_write-after107

reduction_write_output-true111:                   ; preds = %intra_warp_reduce_write-after107
  %output114.then.val = load float, ptr addrspace(3) %75, align 4
  store float %output114.then.val, ptr addrspace(1) %output_element_address113, align 4
  br label %inter_warp_reduce-after109

intra_warp_reduce_write-true131:                  ; preds = %inter_warp_reduce-after109
  store float %add.30.i226, ptr addrspace(3) %82, align 4
  br label %intra_warp_reduce_write-after132

reduction_write_output-true136:                   ; preds = %intra_warp_reduce_write-after132
  %output139.then.val = load float, ptr addrspace(3) %84, align 4
  store float %output139.then.val, ptr addrspace(1) %output_element_address138, align 4
  br label %inter_warp_reduce-after134

intra_warp_reduce_write-true156:                  ; preds = %inter_warp_reduce-after134
  store float %add.38.i230, ptr addrspace(3) %91, align 4
  br label %intra_warp_reduce_write-after157

reduction_write_output-true161:                   ; preds = %intra_warp_reduce_write-after157
  %output164.then.val = load float, ptr addrspace(3) %93, align 4
  store float %output164.then.val, ptr addrspace(1) %output_element_address163, align 4
  br label %inter_warp_reduce-after159

intra_warp_reduce_write-true181:                  ; preds = %inter_warp_reduce-after159
  store float %add.48.i234, ptr addrspace(3) %100, align 4
  br label %intra_warp_reduce_write-after182

reduction_write_output-true186:                   ; preds = %intra_warp_reduce_write-after182
  %output189.then.val = load float, ptr addrspace(3) %102, align 4
  store float %output189.then.val, ptr addrspace(1) %output_element_address188, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_78(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg7) local_unnamed_addr #2 {
entry:
  %arg7254 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6252 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5250 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4248 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3246 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2244 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1242 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0240 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !110
  switch i32 %0, label %entry.unreachabledefault [
    i32 0, label %reduce-group-0-true
    i32 1, label %reduce-group-1-true
    i32 2, label %entry.reduce-group-2-true_crit_edge
    i32 3, label %entry.reduce-group-3-true_crit_edge
  ]

entry.reduce-group-2-true_crit_edge:              ; preds = %entry
  %.pre = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !111
  %.pre225 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %.pre227 = and i32 %.pre225, 31
  %.pre228 = lshr i32 %.pre225, 5
  %1 = shl i32 %.pre, 9
  %2 = shl nuw nsw i32 %.pre228, 2
  %3 = add i32 %1, %2
  %4 = add i32 %3, %.pre227
  %5 = zext i32 %4 to i64
  %6 = shl nuw nsw i64 %5, 2
  %scevgep267 = getelementptr i8, ptr addrspace(1) %arg2244, i64 %6
  %7 = add nuw nsw i32 %.pre228, -32
  br label %y_in_tile.loop_body83

entry.reduce-group-3-true_crit_edge:              ; preds = %entry
  %.pre229 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !111
  %.pre231 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %.pre233 = and i32 %.pre231, 31
  %.pre234 = lshr i32 %.pre231, 5
  %8 = shl nuw nsw i32 %.pre229, 9
  %9 = or i32 %8, %.pre233
  %10 = shl i32 %.pre234, 2
  %11 = add i32 %9, %10
  %12 = add i32 %.pre234, -32
  br label %y_in_tile.loop_body134

entry.unreachabledefault:                         ; preds = %entry
  unreachable

common.ret.sink.split:                            ; preds = %y_in_tile.loop_exit132, %y_in_tile.loop_exit30, %y_in_tile.loop_exit
  %.sink239 = phi i32 [ %19, %y_in_tile.loop_exit ], [ %39, %y_in_tile.loop_exit30 ], [ %.pre231, %y_in_tile.loop_exit132 ]
  %.sink238 = phi i32 [ %18, %y_in_tile.loop_exit ], [ %38, %y_in_tile.loop_exit30 ], [ %.pre229, %y_in_tile.loop_exit132 ]
  %thread_id.y23173.sink = phi i32 [ %thread_id.y174, %y_in_tile.loop_exit ], [ %thread_id.y23173, %y_in_tile.loop_exit30 ], [ %.pre234, %y_in_tile.loop_exit132 ]
  %arg5.sink = phi ptr addrspace(1) [ %arg4248, %y_in_tile.loop_exit ], [ %arg5250, %y_in_tile.loop_exit30 ], [ %arg7254, %y_in_tile.loop_exit132 ]
  %add.16.i202.sink = phi float [ %add.10.i197, %y_in_tile.loop_exit ], [ %add.16.i202, %y_in_tile.loop_exit30 ], [ %add.28.i212, %y_in_tile.loop_exit132 ]
  %13 = lshr i32 %.sink239, 7
  %14 = add nuw nsw i32 %13, %.sink238
  %15 = zext i32 %14 to i64
  %16 = and i32 %thread_id.y23173.sink, 3
  %17 = zext i32 %16 to i64
  %output_element_address67 = getelementptr inbounds [64 x [4 x float]], ptr addrspace(1) %arg5.sink, i64 0, i64 %15, i64 %17
  store float %add.16.i202.sink, ptr addrspace(1) %output_element_address67, align 4
  br label %common.ret

common.ret:                                       ; preds = %reduction_write_output-after117, %common.ret.sink.split, %y_in_tile.loop_exit30, %y_in_tile.loop_exit, %y_in_tile.loop_exit132
  ret void

reduce-group-0-true:                              ; preds = %entry
  %18 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !111
  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x = and i32 %19, 31
  %thread_id.y174 = lshr i32 %19, 5
  %20 = shl i32 %18, 9
  %21 = shl nuw nsw i32 %thread_id.y174, 2
  %22 = add i32 %20, %21
  %23 = add i32 %22, %thread_id.x
  %24 = zext i32 %23 to i64
  %25 = shl nuw nsw i64 %24, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0240, i64 %25
  %26 = add nuw nsw i32 %thread_id.y174, -32
  br label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %reduce-group-0-true, %x_in_tile-after
  %lsr.iv257 = phi i32 [ %26, %reduce-group-0-true ], [ %lsr.iv.next, %x_in_tile-after ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %reduce-group-0-true ], [ %scevgep256, %x_in_tile-after ]
  %partial_reduction_result.0222 = phi float [ 0.000000e+00, %reduce-group-0-true ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %27 = icmp ult i32 %thread_id.x, 4
  br i1 %27, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %y_in_tile.loop_body
  %partial_reduction_result.1 = phi float [ %add.10.i198, %x_in_tile-true ], [ %partial_reduction_result.0222, %y_in_tile.loop_body ]
  %scevgep256 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 512
  %lsr.iv.next = add nsw i32 %lsr.iv257, 32
  %28 = icmp ugt i32 %lsr.iv.next, 95
  br i1 %28, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after
  %29 = zext i32 %thread_id.x to i64
  %30 = zext i32 %thread_id.y174 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i64 0, i64 0, i64 0, i64 %29, i64 %30
  store float %partial_reduction_result.1, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i64 0, i64 0, i64 0, i64 %30, i64 %29
  %partial_reduction_result4 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %31 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  %add.10.i = fadd float %partial_reduction_result4, %31
  %32 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i, i32 8, i32 31)
  %add.10.i194 = fadd float %add.10.i, %32
  %33 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i194, i32 4, i32 31)
  %add.10.i195 = fadd float %add.10.i194, %33
  %34 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i195, i32 2, i32 31)
  %add.10.i196 = fadd float %add.10.i195, %34
  %35 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i196, i32 1, i32 31)
  %add.10.i197 = fadd float %add.10.i196, %35
  store float %add.10.i197, ptr addrspace(3) %shmem_transposed_addr, align 4
  %36 = and i32 %19, 927
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %common.ret.sink.split, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %Arg_0.13 = load float, ptr addrspace(1) %lsr.iv, align 4, !invariant.load !99
  %add.10.i198 = fadd float %partial_reduction_result.0222, %Arg_0.13
  br label %x_in_tile-after

reduce-group-1-true:                              ; preds = %entry
  %38 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !111
  %39 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x22 = and i32 %39, 31
  %thread_id.y23173 = lshr i32 %39, 5
  %40 = shl i32 %38, 9
  %41 = shl nuw nsw i32 %thread_id.y23173, 2
  %42 = add i32 %40, %41
  %43 = add i32 %42, %thread_id.x22
  %44 = zext i32 %43 to i64
  %45 = shl nuw nsw i64 %44, 2
  %scevgep258 = getelementptr i8, ptr addrspace(1) %arg1242, i64 %45
  %46 = add nuw nsw i32 %thread_id.y23173, -32
  br label %y_in_tile.loop_body32

y_in_tile.loop_body32:                            ; preds = %reduce-group-1-true, %x_in_tile-after44
  %lsr.iv261 = phi i32 [ %46, %reduce-group-1-true ], [ %lsr.iv.next262, %x_in_tile-after44 ]
  %lsr.iv259 = phi ptr addrspace(1) [ %scevgep258, %reduce-group-1-true ], [ %scevgep260, %x_in_tile-after44 ]
  %partial_reduction_result19.0214 = phi float [ 0.000000e+00, %reduce-group-1-true ], [ %partial_reduction_result19.1, %x_in_tile-after44 ]
  %47 = icmp ult i32 %thread_id.x22, 4
  br i1 %47, label %x_in_tile-true43, label %x_in_tile-after44

x_in_tile-after44:                                ; preds = %x_in_tile-true43, %y_in_tile.loop_body32
  %partial_reduction_result19.1 = phi float [ %add.16.i203, %x_in_tile-true43 ], [ %partial_reduction_result19.0214, %y_in_tile.loop_body32 ]
  %scevgep260 = getelementptr i8, ptr addrspace(1) %lsr.iv259, i64 512
  %lsr.iv.next262 = add nsw i32 %lsr.iv261, 32
  %48 = icmp ugt i32 %lsr.iv.next262, 95
  br i1 %48, label %y_in_tile.loop_exit30, label %y_in_tile.loop_body32

y_in_tile.loop_exit30:                            ; preds = %x_in_tile-after44
  %49 = zext i32 %thread_id.x22 to i64
  %50 = zext i32 %thread_id.y23173 to i64
  %shmem_output_address47 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i64 0, i64 0, i64 0, i64 %49, i64 %50
  store float %partial_reduction_result19.1, ptr addrspace(3) %shmem_output_address47, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr49 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i64 0, i64 0, i64 0, i64 %50, i64 %49
  %partial_reduction_result51 = load float, ptr addrspace(3) %shmem_transposed_addr49, align 4
  %51 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 16, i32 31)
  %add.16.i = fadd float %partial_reduction_result51, %51
  %52 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i, i32 8, i32 31)
  %add.16.i199 = fadd float %add.16.i, %52
  %53 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i199, i32 4, i32 31)
  %add.16.i200 = fadd float %add.16.i199, %53
  %54 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i200, i32 2, i32 31)
  %add.16.i201 = fadd float %add.16.i200, %54
  %55 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i201, i32 1, i32 31)
  %add.16.i202 = fadd float %add.16.i201, %55
  store float %add.16.i202, ptr addrspace(3) %shmem_transposed_addr49, align 4
  %56 = and i32 %39, 927
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %common.ret.sink.split, label %common.ret

x_in_tile-true43:                                 ; preds = %y_in_tile.loop_body32
  %Arg_1.245 = load float, ptr addrspace(1) %lsr.iv259, align 4, !invariant.load !99
  %add.16.i203 = fadd float %partial_reduction_result19.0214, %Arg_1.245
  br label %x_in_tile-after44

y_in_tile.loop_body83:                            ; preds = %entry.reduce-group-2-true_crit_edge, %x_in_tile-after95
  %lsr.iv270 = phi i32 [ %7, %entry.reduce-group-2-true_crit_edge ], [ %lsr.iv.next271, %x_in_tile-after95 ]
  %lsr.iv268 = phi ptr addrspace(1) [ %scevgep267, %entry.reduce-group-2-true_crit_edge ], [ %scevgep269, %x_in_tile-after95 ]
  %partial_reduction_result70.0216 = phi float [ 0.000000e+00, %entry.reduce-group-2-true_crit_edge ], [ %partial_reduction_result70.1, %x_in_tile-after95 ]
  %58 = icmp ult i32 %.pre227, 4
  br i1 %58, label %x_in_tile-true94, label %x_in_tile-after95

x_in_tile-after95:                                ; preds = %x_in_tile-true94, %y_in_tile.loop_body83
  %partial_reduction_result70.1 = phi float [ %add.22.i208, %x_in_tile-true94 ], [ %partial_reduction_result70.0216, %y_in_tile.loop_body83 ]
  %scevgep269 = getelementptr i8, ptr addrspace(1) %lsr.iv268, i64 512
  %lsr.iv.next271 = add nsw i32 %lsr.iv270, 32
  %59 = icmp ugt i32 %lsr.iv.next271, 95
  br i1 %59, label %y_in_tile.loop_exit81, label %y_in_tile.loop_body83

y_in_tile.loop_exit81:                            ; preds = %x_in_tile-after95
  %60 = zext i32 %.pre227 to i64
  %61 = zext i32 %.pre228 to i64
  %shmem_output_address98 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i64 0, i64 0, i64 0, i64 %60, i64 %61
  store float %partial_reduction_result70.1, ptr addrspace(3) %shmem_output_address98, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr100 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i64 0, i64 0, i64 0, i64 %61, i64 %60
  %partial_reduction_result102 = load float, ptr addrspace(3) %shmem_transposed_addr100, align 4
  %62 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result102, i32 16, i32 31)
  %add.22.i = fadd float %partial_reduction_result102, %62
  %63 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i, i32 8, i32 31)
  %add.22.i204 = fadd float %add.22.i, %63
  %64 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i204, i32 4, i32 31)
  %add.22.i205 = fadd float %add.22.i204, %64
  %65 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i205, i32 2, i32 31)
  %add.22.i206 = fadd float %add.22.i205, %65
  %66 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i206, i32 1, i32 31)
  %add.22.i207 = fadd float %add.22.i206, %66
  store float %add.22.i207, ptr addrspace(3) %shmem_transposed_addr100, align 4
  %67 = and i32 %.pre225, 927
  %68 = icmp eq i32 %67, 0
  %69 = lshr i32 %.pre225, 7
  %70 = add nuw nsw i32 %69, %.pre
  %71 = zext i32 %70 to i64
  %72 = and i32 %.pre228, 3
  %73 = zext i32 %72 to i64
  %output_element_address118 = getelementptr inbounds [64 x [4 x float]], ptr addrspace(1) %arg6252, i64 0, i64 %71, i64 %73
  br i1 %68, label %reduction_write_output-true116, label %reduction_write_output-after117

reduction_write_output-after117:                  ; preds = %reduction_write_output-true116, %y_in_tile.loop_exit81
  br label %common.ret

x_in_tile-true94:                                 ; preds = %y_in_tile.loop_body83
  %Arg_2.396 = load float, ptr addrspace(1) %lsr.iv268, align 4, !invariant.load !99
  %add.22.i208 = fadd float %partial_reduction_result70.0216, %Arg_2.396
  br label %x_in_tile-after95

reduction_write_output-true116:                   ; preds = %y_in_tile.loop_exit81
  store float %add.22.i207, ptr addrspace(1) %output_element_address118, align 4
  br label %reduction_write_output-after117

y_in_tile.loop_body134:                           ; preds = %entry.reduce-group-3-true_crit_edge, %x_in_tile-after146
  %lsr.iv265 = phi i32 [ %12, %entry.reduce-group-3-true_crit_edge ], [ %lsr.iv.next266, %x_in_tile-after146 ]
  %lsr.iv263 = phi i32 [ %11, %entry.reduce-group-3-true_crit_edge ], [ %lsr.iv.next264, %x_in_tile-after146 ]
  %partial_reduction_result121.0219 = phi float [ 0.000000e+00, %entry.reduce-group-3-true_crit_edge ], [ %partial_reduction_result121.1, %x_in_tile-after146 ]
  %74 = icmp ult i32 %.pre233, 4
  %75 = zext i32 %lsr.iv263 to i64
  %Arg_3.4 = getelementptr inbounds float, ptr addrspace(1) %arg3246, i64 %75
  br i1 %74, label %x_in_tile-true145, label %x_in_tile-after146

x_in_tile-after146:                               ; preds = %x_in_tile-true145, %y_in_tile.loop_body134
  %partial_reduction_result121.1 = phi float [ %add.28.i213, %x_in_tile-true145 ], [ %partial_reduction_result121.0219, %y_in_tile.loop_body134 ]
  %lsr.iv.next264 = add i32 %lsr.iv263, 128
  %lsr.iv.next266 = add i32 %lsr.iv265, 32
  %76 = icmp ugt i32 %lsr.iv.next266, 95
  br i1 %76, label %y_in_tile.loop_exit132, label %y_in_tile.loop_body134

y_in_tile.loop_exit132:                           ; preds = %x_in_tile-after146
  %77 = zext i32 %.pre233 to i64
  %78 = zext i32 %.pre234 to i64
  %shmem_output_address149 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i64 0, i64 0, i64 0, i64 %77, i64 %78
  store float %partial_reduction_result121.1, ptr addrspace(3) %shmem_output_address149, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr151 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i64 0, i64 0, i64 0, i64 %78, i64 %77
  %partial_reduction_result153 = load float, ptr addrspace(3) %shmem_transposed_addr151, align 4
  %79 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result153, i32 16, i32 31)
  %add.28.i = fadd float %partial_reduction_result153, %79
  %80 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.28.i, i32 8, i32 31)
  %add.28.i209 = fadd float %add.28.i, %80
  %81 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.28.i209, i32 4, i32 31)
  %add.28.i210 = fadd float %add.28.i209, %81
  %82 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.28.i210, i32 2, i32 31)
  %add.28.i211 = fadd float %add.28.i210, %82
  %83 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.28.i211, i32 1, i32 31)
  %add.28.i212 = fadd float %add.28.i211, %83
  store float %add.28.i212, ptr addrspace(3) %shmem_transposed_addr151, align 4
  %84 = and i32 %.pre231, 927
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %common.ret.sink.split, label %common.ret

x_in_tile-true145:                                ; preds = %y_in_tile.loop_body134
  %Arg_3.4147 = load float, ptr addrspace(1) %Arg_3.4, align 4, !invariant.load !99
  %add.28.i213 = fadd float %partial_reduction_result121.0219, %Arg_3.4147
  br label %x_in_tile-after146
}

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @fusion_77(ptr noalias nocapture readonly align 16 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1024) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(1024) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(1024) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(1024) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg12) local_unnamed_addr #5 {
entry:
  %arg1259 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1157 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1055 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg953 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg851 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg749 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg647 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg545 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg443 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg341 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg239 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg137 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg035 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !110
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg035, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !99
  %4 = load float, ptr addrspace(1) %arg239, align 16, !invariant.load !99
  %5 = shl nuw nsw i64 %1, 2
  %6 = add nuw nsw i64 %5, 64
  %scevgep136 = getelementptr i8, ptr addrspace(1) %arg137, i64 %6
  br label %reduce.16.inner.loop_body.reduction_dim.0

reduce.16.inner.loop_body.reduction_dim.0:        ; preds = %reduce.16.inner.loop_body.reduction_dim.0, %entry
  %lsr.iv133 = phi i64 [ %lsr.iv.next134, %reduce.16.inner.loop_body.reduction_dim.0 ], [ 0, %entry ]
  %accumulator_0.025 = phi float [ 0.000000e+00, %entry ], [ %add.15.i.7, %reduce.16.inner.loop_body.reduction_dim.0 ]
  %scevgep138 = getelementptr i8, ptr addrspace(1) %scevgep136, i64 %lsr.iv133
  %scevgep139 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 -64
  %7 = load float, ptr addrspace(1) %scevgep139, align 4, !invariant.load !99
  %add.15.i = fadd float %accumulator_0.025, %7
  %scevgep142 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 -48
  %8 = load float, ptr addrspace(1) %scevgep142, align 4, !invariant.load !99
  %add.15.i.1 = fadd float %add.15.i, %8
  %scevgep144 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 -32
  %9 = load float, ptr addrspace(1) %scevgep144, align 4, !invariant.load !99
  %add.15.i.2 = fadd float %add.15.i.1, %9
  %scevgep145 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 -16
  %10 = load float, ptr addrspace(1) %scevgep145, align 4, !invariant.load !99
  %add.15.i.3 = fadd float %add.15.i.2, %10
  %11 = load float, ptr addrspace(1) %scevgep138, align 4, !invariant.load !99
  %add.15.i.4 = fadd float %add.15.i.3, %11
  %scevgep148 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 16
  %12 = load float, ptr addrspace(1) %scevgep148, align 4, !invariant.load !99
  %add.15.i.5 = fadd float %add.15.i.4, %12
  %scevgep147 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 32
  %13 = load float, ptr addrspace(1) %scevgep147, align 4, !invariant.load !99
  %add.15.i.6 = fadd float %add.15.i.5, %13
  %scevgep141 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 48
  %14 = load float, ptr addrspace(1) %scevgep141, align 4, !invariant.load !99
  %add.15.i.7 = fadd float %add.15.i.6, %14
  %lsr.iv.next134 = add nuw nsw i64 %lsr.iv133, 128
  %tmp135 = trunc i64 %lsr.iv.next134 to i32
  %exitcond.7 = icmp eq i32 %tmp135, 1024
  br i1 %exitcond.7, label %reduce.16.inner.loop_exit.reduction_dim.0, label %reduce.16.inner.loop_body.reduction_dim.0

reduce.16.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.16.inner.loop_body.reduction_dim.0
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg341, i64 %1
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !99
  %scevgep120 = getelementptr i8, ptr addrspace(1) %arg443, i64 %6
  br label %reduce.24.inner.loop_body.reduction_dim.0

reduce.24.inner.loop_body.reduction_dim.0:        ; preds = %reduce.24.inner.loop_body.reduction_dim.0, %reduce.16.inner.loop_exit.reduction_dim.0
  %lsr.iv117 = phi i64 [ %lsr.iv.next118, %reduce.24.inner.loop_body.reduction_dim.0 ], [ 0, %reduce.16.inner.loop_exit.reduction_dim.0 ]
  %accumulator_02.027 = phi float [ 0.000000e+00, %reduce.16.inner.loop_exit.reduction_dim.0 ], [ %add.23.i.7, %reduce.24.inner.loop_body.reduction_dim.0 ]
  %scevgep122 = getelementptr i8, ptr addrspace(1) %scevgep120, i64 %lsr.iv117
  %scevgep123 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 -64
  %17 = load float, ptr addrspace(1) %scevgep123, align 4, !invariant.load !99
  %add.23.i = fadd float %accumulator_02.027, %17
  %scevgep126 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 -48
  %18 = load float, ptr addrspace(1) %scevgep126, align 4, !invariant.load !99
  %add.23.i.1 = fadd float %add.23.i, %18
  %scevgep128 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 -32
  %19 = load float, ptr addrspace(1) %scevgep128, align 4, !invariant.load !99
  %add.23.i.2 = fadd float %add.23.i.1, %19
  %scevgep129 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 -16
  %20 = load float, ptr addrspace(1) %scevgep129, align 4, !invariant.load !99
  %add.23.i.3 = fadd float %add.23.i.2, %20
  %21 = load float, ptr addrspace(1) %scevgep122, align 4, !invariant.load !99
  %add.23.i.4 = fadd float %add.23.i.3, %21
  %scevgep132 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 16
  %22 = load float, ptr addrspace(1) %scevgep132, align 4, !invariant.load !99
  %add.23.i.5 = fadd float %add.23.i.4, %22
  %scevgep131 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 32
  %23 = load float, ptr addrspace(1) %scevgep131, align 4, !invariant.load !99
  %add.23.i.6 = fadd float %add.23.i.5, %23
  %scevgep125 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 48
  %24 = load float, ptr addrspace(1) %scevgep125, align 4, !invariant.load !99
  %add.23.i.7 = fadd float %add.23.i.6, %24
  %lsr.iv.next118 = add nuw nsw i64 %lsr.iv117, 128
  %tmp119 = trunc i64 %lsr.iv.next118 to i32
  %exitcond32.7 = icmp eq i32 %tmp119, 1024
  br i1 %exitcond32.7, label %reduce.24.inner.loop_exit.reduction_dim.0, label %reduce.24.inner.loop_body.reduction_dim.0

reduce.24.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.24.inner.loop_body.reduction_dim.0
  %25 = getelementptr inbounds float, ptr addrspace(1) %arg545, i64 %1
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !99
  %scevgep104 = getelementptr i8, ptr addrspace(1) %arg647, i64 %6
  br label %reduce.32.inner.loop_body.reduction_dim.0

reduce.32.inner.loop_body.reduction_dim.0:        ; preds = %reduce.32.inner.loop_body.reduction_dim.0, %reduce.24.inner.loop_exit.reduction_dim.0
  %lsr.iv101 = phi i64 [ %lsr.iv.next102, %reduce.32.inner.loop_body.reduction_dim.0 ], [ 0, %reduce.24.inner.loop_exit.reduction_dim.0 ]
  %accumulator_08.029 = phi float [ 0.000000e+00, %reduce.24.inner.loop_exit.reduction_dim.0 ], [ %add.31.i.7, %reduce.32.inner.loop_body.reduction_dim.0 ]
  %scevgep106 = getelementptr i8, ptr addrspace(1) %scevgep104, i64 %lsr.iv101
  %scevgep107 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 -64
  %27 = load float, ptr addrspace(1) %scevgep107, align 4, !invariant.load !99
  %add.31.i = fadd float %accumulator_08.029, %27
  %scevgep110 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 -48
  %28 = load float, ptr addrspace(1) %scevgep110, align 4, !invariant.load !99
  %add.31.i.1 = fadd float %add.31.i, %28
  %scevgep112 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 -32
  %29 = load float, ptr addrspace(1) %scevgep112, align 4, !invariant.load !99
  %add.31.i.2 = fadd float %add.31.i.1, %29
  %scevgep113 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 -16
  %30 = load float, ptr addrspace(1) %scevgep113, align 4, !invariant.load !99
  %add.31.i.3 = fadd float %add.31.i.2, %30
  %31 = load float, ptr addrspace(1) %scevgep106, align 4, !invariant.load !99
  %add.31.i.4 = fadd float %add.31.i.3, %31
  %scevgep116 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 16
  %32 = load float, ptr addrspace(1) %scevgep116, align 4, !invariant.load !99
  %add.31.i.5 = fadd float %add.31.i.4, %32
  %scevgep115 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 32
  %33 = load float, ptr addrspace(1) %scevgep115, align 4, !invariant.load !99
  %add.31.i.6 = fadd float %add.31.i.5, %33
  %scevgep109 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 48
  %34 = load float, ptr addrspace(1) %scevgep109, align 4, !invariant.load !99
  %add.31.i.7 = fadd float %add.31.i.6, %34
  %lsr.iv.next102 = add nuw nsw i64 %lsr.iv101, 128
  %tmp103 = trunc i64 %lsr.iv.next102 to i32
  %exitcond33.7 = icmp eq i32 %tmp103, 1024
  br i1 %exitcond33.7, label %reduce.32.inner.loop_exit.reduction_dim.0, label %reduce.32.inner.loop_body.reduction_dim.0

reduce.32.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.32.inner.loop_body.reduction_dim.0
  %35 = getelementptr inbounds float, ptr addrspace(1) %arg749, i64 %1
  %36 = load float, ptr addrspace(1) %35, align 4, !invariant.load !99
  %scevgep = getelementptr i8, ptr addrspace(1) %arg851, i64 %6
  br label %reduce.40.inner.loop_body.reduction_dim.0

reduce.40.inner.loop_body.reduction_dim.0:        ; preds = %reduce.40.inner.loop_body.reduction_dim.0, %reduce.32.inner.loop_exit.reduction_dim.0
  %lsr.iv = phi i64 [ %lsr.iv.next, %reduce.40.inner.loop_body.reduction_dim.0 ], [ 0, %reduce.32.inner.loop_exit.reduction_dim.0 ]
  %accumulator_014.031 = phi float [ 0.000000e+00, %reduce.32.inner.loop_exit.reduction_dim.0 ], [ %add.39.i.7, %reduce.40.inner.loop_body.reduction_dim.0 ]
  %scevgep90 = getelementptr i8, ptr addrspace(1) %scevgep, i64 %lsr.iv
  %scevgep91 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 -64
  %37 = load float, ptr addrspace(1) %scevgep91, align 4, !invariant.load !99
  %add.39.i = fadd float %accumulator_014.031, %37
  %scevgep94 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 -48
  %38 = load float, ptr addrspace(1) %scevgep94, align 4, !invariant.load !99
  %add.39.i.1 = fadd float %add.39.i, %38
  %scevgep96 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 -32
  %39 = load float, ptr addrspace(1) %scevgep96, align 4, !invariant.load !99
  %add.39.i.2 = fadd float %add.39.i.1, %39
  %scevgep97 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 -16
  %40 = load float, ptr addrspace(1) %scevgep97, align 4, !invariant.load !99
  %add.39.i.3 = fadd float %add.39.i.2, %40
  %41 = load float, ptr addrspace(1) %scevgep90, align 4, !invariant.load !99
  %add.39.i.4 = fadd float %add.39.i.3, %41
  %scevgep100 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 16
  %42 = load float, ptr addrspace(1) %scevgep100, align 4, !invariant.load !99
  %add.39.i.5 = fadd float %add.39.i.4, %42
  %scevgep99 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 32
  %43 = load float, ptr addrspace(1) %scevgep99, align 4, !invariant.load !99
  %add.39.i.6 = fadd float %add.39.i.5, %43
  %scevgep93 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 48
  %44 = load float, ptr addrspace(1) %scevgep93, align 4, !invariant.load !99
  %add.39.i.7 = fadd float %add.39.i.6, %44
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 128
  %tmp = trunc i64 %lsr.iv.next to i32
  %exitcond34.7 = icmp eq i32 %tmp, 1024
  br i1 %exitcond34.7, label %reduce.40.inner.loop_exit.reduction_dim.0, label %reduce.40.inner.loop_body.reduction_dim.0

reduce.40.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.40.inner.loop_body.reduction_dim.0
  %multiply.33 = fmul float %4, %add.31.i.7
  %subtract.35 = fsub float %26, %multiply.33
  %multiply.25 = fmul float %4, %add.23.i.7
  %subtract.27 = fsub float %16, %multiply.25
  %multiply.17 = fmul float %4, %add.15.i.7
  %subtract.19 = fsub float %3, %multiply.17
  %multiply.41 = fmul float %4, %add.39.i.7
  %subtract.43 = fsub float %36, %multiply.41
  %45 = getelementptr inbounds float, ptr addrspace(1) %arg953, i64 %1
  store float %subtract.19, ptr addrspace(1) %45, align 4
  %46 = getelementptr inbounds float, ptr addrspace(1) %arg1055, i64 %1
  store float %subtract.27, ptr addrspace(1) %46, align 4
  %47 = getelementptr inbounds float, ptr addrspace(1) %arg1157, i64 %1
  store float %subtract.35, ptr addrspace(1) %47, align 4
  %48 = getelementptr inbounds float, ptr addrspace(1) %arg1259, i64 %1
  store float %subtract.43, ptr addrspace(1) %48, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_91(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg1) local_unnamed_addr #2 {
entry:
  %arg132 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg030 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !111
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x = and i32 %1, 31
  %thread_id.y18 = lshr i32 %1, 5
  %2 = shl i32 %0, 9
  %3 = shl nuw nsw i32 %thread_id.y18, 2
  %4 = add i32 %2, %3
  %5 = add i32 %4, %thread_id.x
  %6 = zext i32 %5 to i64
  %7 = shl nuw nsw i64 %6, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %arg030, i64 %7
  %8 = add nuw nsw i32 %thread_id.y18, -32
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %y_in_tile.loop_exit, %reduction_write_output-true
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %x_in_tile-after
  %lsr.iv35 = phi i32 [ %8, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep34, %x_in_tile-after ]
  %partial_reduction_result.028 = phi float [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %9 = icmp ult i32 %thread_id.x, 4
  br i1 %9, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %y_in_tile.loop_body
  %partial_reduction_result.1 = phi float [ %add.7.i27, %x_in_tile-true ], [ %partial_reduction_result.028, %y_in_tile.loop_body ]
  %scevgep34 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 512
  %lsr.iv.next = add nsw i32 %lsr.iv35, 32
  %10 = icmp ugt i32 %lsr.iv.next, 95
  br i1 %10, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after
  %11 = zext i32 %thread_id.x to i64
  %12 = zext i32 %thread_id.y18 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache13, i64 0, i64 0, i64 0, i64 %11, i64 %12
  store float %partial_reduction_result.1, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache13, i64 0, i64 0, i64 0, i64 %12, i64 %11
  %partial_reduction_result4 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %13 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  %add.7.i = fadd float %partial_reduction_result4, %13
  %14 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i, i32 8, i32 31)
  %add.7.i23 = fadd float %add.7.i, %14
  %15 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i23, i32 4, i32 31)
  %add.7.i24 = fadd float %add.7.i23, %15
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i24, i32 2, i32 31)
  %add.7.i25 = fadd float %add.7.i24, %16
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i25, i32 1, i32 31)
  %add.7.i26 = fadd float %add.7.i25, %17
  store float %add.7.i26, ptr addrspace(3) %shmem_transposed_addr, align 4
  %18 = and i32 %1, 927
  %19 = icmp eq i32 %18, 0
  %20 = lshr i32 %1, 7
  %21 = add nuw nsw i32 %20, %0
  %22 = zext i32 %21 to i64
  %23 = and i32 %thread_id.y18, 3
  %24 = zext i32 %23 to i64
  %output_element_address = getelementptr inbounds [64 x [4 x float]], ptr addrspace(1) %arg132, i64 0, i64 %22, i64 %24
  br i1 %19, label %reduction_write_output-true, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %Arg_0.13 = load float, ptr addrspace(1) %lsr.iv, align 4, !invariant.load !99
  %add.7.i27 = fadd float %partial_reduction_result.028, %Arg_0.13
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.7.i26, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @fusion_90(ptr noalias nocapture readonly align 16 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1024) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg3) local_unnamed_addr #5 {
entry:
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !110
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg05, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !99
  %4 = load float, ptr addrspace(1) %arg29, align 16, !invariant.load !99
  %5 = shl nuw nsw i64 %1, 2
  %6 = add nuw nsw i64 %5, 64
  %scevgep = getelementptr i8, ptr addrspace(1) %arg17, i64 %6
  br label %reduce.10.inner.loop_body.reduction_dim.0

reduce.10.inner.loop_body.reduction_dim.0:        ; preds = %reduce.10.inner.loop_body.reduction_dim.0, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %reduce.10.inner.loop_body.reduction_dim.0 ], [ 0, %entry ]
  %accumulator_0.04 = phi float [ 0.000000e+00, %entry ], [ %add.9.i.7, %reduce.10.inner.loop_body.reduction_dim.0 ]
  %scevgep21 = getelementptr i8, ptr addrspace(1) %scevgep, i64 %lsr.iv
  %scevgep22 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 -64
  %7 = load float, ptr addrspace(1) %scevgep22, align 4, !invariant.load !99
  %add.9.i = fadd float %accumulator_0.04, %7
  %scevgep25 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 -48
  %8 = load float, ptr addrspace(1) %scevgep25, align 4, !invariant.load !99
  %add.9.i.1 = fadd float %add.9.i, %8
  %scevgep27 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 -32
  %9 = load float, ptr addrspace(1) %scevgep27, align 4, !invariant.load !99
  %add.9.i.2 = fadd float %add.9.i.1, %9
  %scevgep28 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 -16
  %10 = load float, ptr addrspace(1) %scevgep28, align 4, !invariant.load !99
  %add.9.i.3 = fadd float %add.9.i.2, %10
  %11 = load float, ptr addrspace(1) %scevgep21, align 4, !invariant.load !99
  %add.9.i.4 = fadd float %add.9.i.3, %11
  %scevgep31 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 16
  %12 = load float, ptr addrspace(1) %scevgep31, align 4, !invariant.load !99
  %add.9.i.5 = fadd float %add.9.i.4, %12
  %scevgep30 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 32
  %13 = load float, ptr addrspace(1) %scevgep30, align 4, !invariant.load !99
  %add.9.i.6 = fadd float %add.9.i.5, %13
  %scevgep24 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 48
  %14 = load float, ptr addrspace(1) %scevgep24, align 4, !invariant.load !99
  %add.9.i.7 = fadd float %add.9.i.6, %14
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 128
  %tmp = trunc i64 %lsr.iv.next to i32
  %exitcond.7 = icmp eq i32 %tmp, 1024
  br i1 %exitcond.7, label %reduce.10.inner.loop_exit.reduction_dim.0, label %reduce.10.inner.loop_body.reduction_dim.0

reduce.10.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.10.inner.loop_body.reduction_dim.0
  %multiply.11 = fmul float %4, %add.9.i.7
  %subtract.12 = fsub float %3, %multiply.11
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg311, i64 %1
  store float %subtract.12, ptr addrspace(1) %15, align 4
  ret void
}

; Function Attrs: nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @fusion_86(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg8) local_unnamed_addr #6 {
entry:
  %arg8132 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7130 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6128 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5126 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4124 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3122 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2120 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0116 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !102
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !112
  %2 = lshr i32 %0, 2
  %3 = mul nuw nsw i32 %1, 24
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 819200
  br i1 %5, label %tile_loop.loop_header27.preheader, label %common.ret

tile_loop.loop_header27.preheader:                ; preds = %entry
  %6 = and i32 %0, 3
  %7 = zext i32 %4 to i64
  %8 = zext i32 %6 to i64
  %Arg_0.133 = getelementptr inbounds [819200 x [4 x float]], ptr addrspace(1) %arg0116, i64 0, i64 %7, i64 %8
  %Arg_0.134 = load float, ptr addrspace(1) %Arg_0.133, align 4, !invariant.load !99
  %Arg_1.235 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg1118, i64 0, i64 0, i64 %8
  %Arg_1.236 = load float, ptr addrspace(1) %Arg_1.235, align 4, !invariant.load !99
  %multiply.837 = fmul float %Arg_0.134, %Arg_1.236
  %add.13.i107 = fadd float %multiply.837, 0.000000e+00
  %Arg_2.341 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg2120, i64 0, i64 0, i64 %8
  %Arg_2.342 = load float, ptr addrspace(1) %Arg_2.341, align 4, !invariant.load !99
  %multiply.1743 = fmul float %Arg_0.134, %Arg_2.342
  %add.21.i108 = fadd float %multiply.1743, 0.000000e+00
  %Arg_3.447 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg3122, i64 0, i64 0, i64 %8
  %Arg_3.448 = load float, ptr addrspace(1) %Arg_3.447, align 4, !invariant.load !99
  %multiply.2549 = fmul float %Arg_0.134, %Arg_3.448
  %add.29.i109 = fadd float %multiply.2549, 0.000000e+00
  %Arg_4.553 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg4124, i64 0, i64 0, i64 %8
  %Arg_4.554 = load float, ptr addrspace(1) %Arg_4.553, align 4, !invariant.load !99
  %multiply.3355 = fmul float %Arg_0.134, %Arg_4.554
  %add.37.i110 = fadd float %multiply.3355, 0.000000e+00
  %9 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i107, i32 2, i32 31)
  %add.13.i = fadd float %add.13.i107, %9
  %10 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i, i32 1, i32 31)
  %11 = icmp eq i32 %6, 0
  %output_element_address = getelementptr inbounds [819200 x float], ptr addrspace(1) %arg5126, i64 0, i64 %7
  %add.13.i103 = fadd float %add.13.i, %10
  br i1 %11, label %reduction_write_output-true, label %reduction_write_output-after

common.ret:                                       ; preds = %entry, %reduction_write_output-after81, %reduction_write_output-true91
  ret void

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %tile_loop.loop_header27.preheader
  %12 = icmp eq i32 %6, 0
  %13 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.21.i108, i32 2, i32 31)
  %add.21.i = fadd float %add.21.i108, %13
  %14 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.21.i, i32 1, i32 31)
  %output_element_address71 = getelementptr inbounds [819200 x float], ptr addrspace(1) %arg6128, i64 0, i64 %7
  %add.21.i104 = fadd float %add.21.i, %14
  br i1 %12, label %reduction_write_output-true69, label %reduction_write_output-after70

reduction_write_output-after70:                   ; preds = %reduction_write_output-true69, %reduction_write_output-after
  %15 = icmp eq i32 %6, 0
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.29.i109, i32 2, i32 31)
  %add.29.i = fadd float %add.29.i109, %16
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.29.i, i32 1, i32 31)
  %output_element_address82 = getelementptr inbounds [819200 x float], ptr addrspace(1) %arg7130, i64 0, i64 %7
  %add.29.i105 = fadd float %add.29.i, %17
  br i1 %15, label %reduction_write_output-true80, label %reduction_write_output-after81

reduction_write_output-after81:                   ; preds = %reduction_write_output-true80, %reduction_write_output-after70
  %18 = icmp eq i32 %6, 0
  %19 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.37.i110, i32 2, i32 31)
  %add.37.i = fadd float %add.37.i110, %19
  %20 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.37.i, i32 1, i32 31)
  %output_element_address93 = getelementptr inbounds [819200 x float], ptr addrspace(1) %arg8132, i64 0, i64 %7
  %add.37.i106 = fadd float %add.37.i, %20
  br i1 %18, label %reduction_write_output-true91, label %common.ret

reduction_write_output-true:                      ; preds = %tile_loop.loop_header27.preheader
  store float %add.13.i103, ptr addrspace(1) %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true69:                    ; preds = %reduction_write_output-after
  store float %add.21.i104, ptr addrspace(1) %output_element_address71, align 4
  br label %reduction_write_output-after70

reduction_write_output-true80:                    ; preds = %reduction_write_output-after70
  store float %add.29.i105, ptr addrspace(1) %output_element_address82, align 4
  br label %reduction_write_output-after81

reduction_write_output-true91:                    ; preds = %reduction_write_output-after81
  store float %add.37.i106, ptr addrspace(1) %output_element_address93, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_85(ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(3276800) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(3276800) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(3276800) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(3276800) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg12) local_unnamed_addr #0 {
entry:
  %arg1249 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1147 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1045 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg943 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg841 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg739 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg637 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg535 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg433 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg331 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg229 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg127 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg025 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !113
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg025, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !99
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = load float, ptr addrspace(1) %arg229, align 16, !invariant.load !99
  %12 = getelementptr float, ptr addrspace(1) %arg127, i64 %4
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16, !invariant.load !99
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %multiply.11 = fmul float %11, %14
  %subtract.13 = fsub float %7, %multiply.11
  %18 = getelementptr float, ptr addrspace(1) %arg331, i64 %4
  %19 = load <4 x float>, ptr addrspace(1) %18, align 16, !invariant.load !99
  %20 = extractelement <4 x float> %19, i32 0
  %21 = extractelement <4 x float> %19, i32 1
  %22 = extractelement <4 x float> %19, i32 2
  %23 = extractelement <4 x float> %19, i32 3
  %24 = getelementptr float, ptr addrspace(1) %arg433, i64 %4
  %25 = load <4 x float>, ptr addrspace(1) %24, align 16, !invariant.load !99
  %26 = extractelement <4 x float> %25, i32 0
  %27 = extractelement <4 x float> %25, i32 1
  %28 = extractelement <4 x float> %25, i32 2
  %29 = extractelement <4 x float> %25, i32 3
  %multiply.14 = fmul float %11, %26
  %subtract.16 = fsub float %20, %multiply.14
  %30 = getelementptr float, ptr addrspace(1) %arg535, i64 %4
  %31 = load <4 x float>, ptr addrspace(1) %30, align 16, !invariant.load !99
  %32 = extractelement <4 x float> %31, i32 0
  %33 = extractelement <4 x float> %31, i32 1
  %34 = extractelement <4 x float> %31, i32 2
  %35 = extractelement <4 x float> %31, i32 3
  %36 = getelementptr float, ptr addrspace(1) %arg637, i64 %4
  %37 = load <4 x float>, ptr addrspace(1) %36, align 16, !invariant.load !99
  %38 = extractelement <4 x float> %37, i32 0
  %39 = extractelement <4 x float> %37, i32 1
  %40 = extractelement <4 x float> %37, i32 2
  %41 = extractelement <4 x float> %37, i32 3
  %multiply.17 = fmul float %11, %38
  %subtract.19 = fsub float %32, %multiply.17
  %42 = getelementptr float, ptr addrspace(1) %arg739, i64 %4
  %43 = load <4 x float>, ptr addrspace(1) %42, align 16, !invariant.load !99
  %44 = extractelement <4 x float> %43, i32 0
  %45 = extractelement <4 x float> %43, i32 1
  %46 = extractelement <4 x float> %43, i32 2
  %47 = extractelement <4 x float> %43, i32 3
  %48 = getelementptr float, ptr addrspace(1) %arg841, i64 %4
  %49 = load <4 x float>, ptr addrspace(1) %48, align 16, !invariant.load !99
  %50 = extractelement <4 x float> %49, i32 0
  %51 = extractelement <4 x float> %49, i32 1
  %52 = extractelement <4 x float> %49, i32 2
  %53 = extractelement <4 x float> %49, i32 3
  %multiply.20 = fmul float %11, %50
  %subtract.22 = fsub float %44, %multiply.20
  %54 = getelementptr float, ptr addrspace(1) %arg943, i64 %4
  %55 = getelementptr float, ptr addrspace(1) %arg1045, i64 %4
  %56 = getelementptr float, ptr addrspace(1) %arg1147, i64 %4
  %57 = getelementptr float, ptr addrspace(1) %arg1249, i64 %4
  %multiply.111 = fmul float %11, %15
  %subtract.132 = fsub float %8, %multiply.111
  %multiply.143 = fmul float %11, %27
  %subtract.164 = fsub float %21, %multiply.143
  %multiply.175 = fmul float %11, %39
  %subtract.196 = fsub float %33, %multiply.175
  %multiply.207 = fmul float %11, %51
  %subtract.228 = fsub float %45, %multiply.207
  %multiply.119 = fmul float %11, %16
  %subtract.1310 = fsub float %9, %multiply.119
  %multiply.1411 = fmul float %11, %28
  %subtract.1612 = fsub float %22, %multiply.1411
  %multiply.1713 = fmul float %11, %40
  %subtract.1914 = fsub float %34, %multiply.1713
  %multiply.2015 = fmul float %11, %52
  %subtract.2216 = fsub float %46, %multiply.2015
  %multiply.1117 = fmul float %11, %17
  %subtract.1318 = fsub float %10, %multiply.1117
  %multiply.1419 = fmul float %11, %29
  %subtract.1620 = fsub float %23, %multiply.1419
  %multiply.1721 = fmul float %11, %41
  %subtract.1922 = fsub float %35, %multiply.1721
  %multiply.2023 = fmul float %11, %53
  %subtract.2224 = fsub float %47, %multiply.2023
  %58 = insertelement <4 x float> poison, float %subtract.13, i32 0
  %59 = insertelement <4 x float> %58, float %subtract.132, i32 1
  %60 = insertelement <4 x float> %59, float %subtract.1310, i32 2
  %61 = insertelement <4 x float> %60, float %subtract.1318, i32 3
  store <4 x float> %61, ptr addrspace(1) %54, align 16
  %62 = insertelement <4 x float> poison, float %subtract.16, i32 0
  %63 = insertelement <4 x float> %62, float %subtract.164, i32 1
  %64 = insertelement <4 x float> %63, float %subtract.1612, i32 2
  %65 = insertelement <4 x float> %64, float %subtract.1620, i32 3
  store <4 x float> %65, ptr addrspace(1) %55, align 16
  %66 = insertelement <4 x float> poison, float %subtract.19, i32 0
  %67 = insertelement <4 x float> %66, float %subtract.196, i32 1
  %68 = insertelement <4 x float> %67, float %subtract.1914, i32 2
  %69 = insertelement <4 x float> %68, float %subtract.1922, i32 3
  store <4 x float> %69, ptr addrspace(1) %56, align 16
  %70 = insertelement <4 x float> poison, float %subtract.22, i32 0
  %71 = insertelement <4 x float> %70, float %subtract.228, i32 1
  %72 = insertelement <4 x float> %71, float %subtract.2216, i32 2
  %73 = insertelement <4 x float> %72, float %subtract.2224, i32 3
  store <4 x float> %73, ptr addrspace(1) %57, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion_48(ptr noalias nocapture readonly align 16 dereferenceable(524288) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(672) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(550502400) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(524288) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(88080384) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(524288) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(524288) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(88080384) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(172032) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(88080384) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(172032) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(172032) %arg11) local_unnamed_addr #2 {
entry:
  %arg11192 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10190 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9188 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8186 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7184 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6182 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5180 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4178 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3176 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2174 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1172 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0170 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x = and i32 %1, 31
  %thread_id.y125 = lshr i32 %1, 5
  %.lhs.trunc = trunc i32 %0 to i16
  %2 = udiv i16 %.lhs.trunc, 6
  %3 = mul i16 %2, 6
  %.decomposed = sub i16 %.lhs.trunc, %3
  %.zext156 = zext i16 %2 to i32
  %4 = icmp eq i16 %.decomposed, 5
  %tile_bound7 = select i1 %4, i32 8, i32 32
  %5 = shl nuw nsw i16 %.decomposed, 5
  %tile_origin.2 = zext i16 %5 to i32
  %6 = mul nuw nsw i32 %.zext156, 86016
  %7 = or i32 %6, %tile_origin.2
  %8 = add nuw nsw i32 %thread_id.y125, -32
  %9 = mul nuw nsw i32 %thread_id.y125, 168
  %10 = add i32 %7, %9
  %11 = add i32 %10, %thread_id.x
  %12 = zext i32 %11 to i64
  %13 = shl nuw nsw i64 %12, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %arg4178, i64 %13
  %scevgep198 = getelementptr i8, ptr addrspace(1) %arg7184, i64 %13
  %scevgep201 = getelementptr i8, ptr addrspace(1) %arg9188, i64 %13
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after100, %reduction_write_output-true121
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %x_in_tile-after
  %lsr.iv202 = phi ptr addrspace(1) [ %scevgep201, %entry ], [ %scevgep203, %x_in_tile-after ]
  %lsr.iv199 = phi ptr addrspace(1) [ %scevgep198, %entry ], [ %scevgep200, %x_in_tile-after ]
  %lsr.iv196 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep197, %x_in_tile-after ]
  %lsr.iv194 = phi i32 [ %11, %entry ], [ %lsr.iv.next195, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %8, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result5.0159 = phi float [ 0.000000e+00, %entry ], [ %partial_reduction_result5.1, %x_in_tile-after ]
  %partial_reduction_result.0158 = phi float [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %partial_reduction_result2.0157 = phi float [ 0.000000e+00, %entry ], [ %partial_reduction_result2.1, %x_in_tile-after ]
  %14 = icmp ult i32 %thread_id.x, %tile_bound7
  br i1 %14, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %y_in_tile.loop_body
  %partial_reduction_result2.1 = phi float [ %add.51.i153, %x_in_tile-true ], [ %partial_reduction_result2.0157, %y_in_tile.loop_body ]
  %partial_reduction_result.1 = phi float [ %add.45.i152, %x_in_tile-true ], [ %partial_reduction_result.0158, %y_in_tile.loop_body ]
  %partial_reduction_result5.1 = phi float [ %add.58.i154, %x_in_tile-true ], [ %partial_reduction_result5.0159, %y_in_tile.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %lsr.iv.next195 = add nuw nsw i32 %lsr.iv194, 5376
  %scevgep197 = getelementptr i8, ptr addrspace(1) %lsr.iv196, i64 21504
  %scevgep200 = getelementptr i8, ptr addrspace(1) %lsr.iv199, i64 21504
  %scevgep203 = getelementptr i8, ptr addrspace(1) %lsr.iv202, i64 21504
  %15 = icmp ugt i32 %lsr.iv.next, 479
  br i1 %15, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after
  %16 = zext i32 %thread_id.x to i64
  %17 = zext i32 %thread_id.y125 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache14, i64 0, i64 0, i64 0, i64 %16, i64 %17
  store float %partial_reduction_result.1, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache14, i64 0, i64 0, i64 0, i64 %17, i64 %16
  %partial_reduction_result67 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %18 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result67, i32 16, i32 31)
  %add.45.i = fadd float %partial_reduction_result67, %18
  %19 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.45.i, i32 8, i32 31)
  %add.45.i140 = fadd float %add.45.i, %19
  %20 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.45.i140, i32 4, i32 31)
  %add.45.i141 = fadd float %add.45.i140, %20
  %21 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.45.i141, i32 2, i32 31)
  %add.45.i142 = fadd float %add.45.i141, %21
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.45.i142, i32 1, i32 31)
  %add.45.i143 = fadd float %add.45.i142, %22
  store float %add.45.i143, ptr addrspace(3) %shmem_transposed_addr, align 4
  %23 = icmp ult i32 %thread_id.y125, %tile_bound7
  %24 = icmp eq i32 %thread_id.x, 0
  %25 = and i1 %24, %23
  br i1 %25, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address81 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache15, i64 0, i64 0, i64 0, i64 %16, i64 %17
  store float %partial_reduction_result2.1, ptr addrspace(3) %shmem_output_address81, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache15, i64 0, i64 0, i64 0, i64 %17, i64 %16
  %partial_reduction_result85 = load float, ptr addrspace(3) %shmem_transposed_addr83, align 4
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  %add.51.i = fadd float %partial_reduction_result85, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.51.i, i32 8, i32 31)
  %add.51.i144 = fadd float %add.51.i, %27
  %28 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.51.i144, i32 4, i32 31)
  %add.51.i145 = fadd float %add.51.i144, %28
  %29 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.51.i145, i32 2, i32 31)
  %add.51.i146 = fadd float %add.51.i145, %29
  %30 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.51.i146, i32 1, i32 31)
  %add.51.i147 = fadd float %add.51.i146, %30
  store float %add.51.i147, ptr addrspace(3) %shmem_transposed_addr83, align 4
  br i1 %25, label %reduction_write_output-true99, label %reduction_write_output-after100

reduction_write_output-after100:                  ; preds = %reduction_write_output-true99, %reduction_write_output-after
  %shmem_output_address103 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache16, i64 0, i64 0, i64 0, i64 %16, i64 %17
  store float %partial_reduction_result5.1, ptr addrspace(3) %shmem_output_address103, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr105 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache16, i64 0, i64 0, i64 0, i64 %17, i64 %16
  %partial_reduction_result107 = load float, ptr addrspace(3) %shmem_transposed_addr105, align 4
  %31 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result107, i32 16, i32 31)
  %add.58.i = fadd float %partial_reduction_result107, %31
  %32 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.58.i, i32 8, i32 31)
  %add.58.i148 = fadd float %add.58.i, %32
  %33 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.58.i148, i32 4, i32 31)
  %add.58.i149 = fadd float %add.58.i148, %33
  %34 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.58.i149, i32 2, i32 31)
  %add.58.i150 = fadd float %add.58.i149, %34
  %35 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.58.i150, i32 1, i32 31)
  %add.58.i151 = fadd float %add.58.i150, %35
  store float %add.58.i151, ptr addrspace(3) %shmem_transposed_addr105, align 4
  br i1 %25, label %reduction_write_output-true121, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %.frozen = freeze i32 %lsr.iv194
  %36 = udiv i32 %.frozen, 168
  %37 = mul i32 %36, 168
  %.decomposed163 = sub i32 %.frozen, %37
  %38 = and i32 %36, 496
  %39 = udiv i32 %lsr.iv194, 86016
  %40 = shl nuw nsw i32 %39, 9
  %41 = or i32 %38, %40
  %42 = and i32 %36, 15
  %43 = lshr exact i32 %41, 4
  %44 = zext i32 %36 to i64
  %Arg_0.1 = getelementptr inbounds float, ptr addrspace(1) %arg0170, i64 %44
  %Arg_0.19 = load float, ptr addrspace(1) %Arg_0.1, align 4, !invariant.load !99
  %multiply.13 = fmul float %Arg_0.19, %Arg_0.19
  %multiply.14 = fmul float %Arg_0.19, %multiply.13
  %Arg_6.7 = getelementptr inbounds float, ptr addrspace(1) %arg6182, i64 %44
  %Arg_6.714 = load float, ptr addrspace(1) %Arg_6.7, align 4, !invariant.load !99
  %multiply.17 = fmul float %Arg_6.714, 5.000000e-01
  %multiply.19 = fmul float %multiply.14, %multiply.17
  %multiply.20 = fmul float %multiply.19, 0x3F78618620000000
  %multiply.21 = fmul float %multiply.20, 2.000000e+00
  %Arg_4.515 = load float, ptr addrspace(1) %lsr.iv196, align 4, !invariant.load !99
  %Arg_5.6 = getelementptr inbounds float, ptr addrspace(1) %arg5180, i64 %44
  %Arg_5.616 = load float, ptr addrspace(1) %Arg_5.6, align 4, !invariant.load !99
  %subtract.26 = fsub float %Arg_4.515, %Arg_5.616
  %multiply.27 = fmul float %subtract.26, %multiply.21
  %Arg_3.4 = getelementptr inbounds float, ptr addrspace(1) %arg3176, i64 %44
  %Arg_3.418 = load float, ptr addrspace(1) %Arg_3.4, align 4, !invariant.load !99
  %multiply.29 = fmul float %Arg_3.418, 0x3F78618620000000
  %45 = fsub float %multiply.29, %multiply.27
  %46 = mul nuw nsw i32 %43, 100
  %47 = add nuw nsw i32 %46, %42
  %48 = zext i32 %47 to i64
  %49 = zext i32 %.decomposed163 to i64
  %Arg_2.3 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg2174, i64 0, i64 %48, i64 %49
  %Arg_2.319 = load float, ptr addrspace(1) %Arg_2.3, align 4, !invariant.load !99
  %Arg_1.2 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg1172, i64 0, i64 %49
  %Arg_1.220 = load float, ptr addrspace(1) %Arg_1.2, align 4, !invariant.load !99
  %multiply.35 = fmul float %Arg_2.319, %Arg_1.220
  %multiply.38 = fmul float %Arg_0.19, %multiply.35
  %add.39 = fadd float %45, %multiply.38
  %add.45.i152 = fadd float %partial_reduction_result.0158, %add.39
  %add.51.i153 = fadd float %partial_reduction_result2.0157, %Arg_2.319
  %Arg_7.828 = load float, ptr addrspace(1) %lsr.iv199, align 4, !invariant.load !99
  %multiply.53 = fmul float %Arg_2.319, %Arg_7.828
  %add.58.i154 = fadd float %partial_reduction_result5.0159, %multiply.53
  store float %add.39, ptr addrspace(1) %lsr.iv202, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %50 = or i32 %thread_id.y125, %tile_origin.2
  %51 = mul nuw nsw i32 %.zext156, 168
  %52 = add nuw nsw i32 %50, %51
  %.frozen164 = freeze i32 %52
  %53 = udiv i32 %.frozen164, 168
  %54 = mul i32 %53, 168
  %.decomposed165 = sub i32 %.frozen164, %54
  %55 = zext i32 %53 to i64
  %56 = zext i32 %.decomposed165 to i64
  %output_element_address = getelementptr inbounds [256 x [168 x float]], ptr addrspace(1) %arg8186, i64 0, i64 %55, i64 %56
  store float %add.45.i143, ptr addrspace(1) %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true99:                    ; preds = %reduction_write_output-after
  %57 = or i32 %thread_id.y125, %tile_origin.2
  %58 = mul nuw nsw i32 %.zext156, 168
  %59 = add nuw nsw i32 %57, %58
  %.frozen166 = freeze i32 %59
  %60 = udiv i32 %.frozen166, 168
  %61 = mul i32 %60, 168
  %.decomposed167 = sub i32 %.frozen166, %61
  %62 = zext i32 %60 to i64
  %63 = zext i32 %.decomposed167 to i64
  %output_element_address101 = getelementptr inbounds [256 x [168 x float]], ptr addrspace(1) %arg10190, i64 0, i64 %62, i64 %63
  store float %add.51.i147, ptr addrspace(1) %output_element_address101, align 4
  br label %reduction_write_output-after100

reduction_write_output-true121:                   ; preds = %reduction_write_output-after100
  %64 = or i32 %thread_id.y125, %tile_origin.2
  %65 = mul nuw nsw i32 %.zext156, 168
  %66 = add nuw nsw i32 %64, %65
  %.frozen168 = freeze i32 %66
  %67 = udiv i32 %.frozen168, 168
  %68 = mul i32 %67, 168
  %.decomposed169 = sub i32 %.frozen168, %68
  %69 = zext i32 %67 to i64
  %70 = zext i32 %.decomposed169 to i64
  %output_element_address123 = getelementptr inbounds [256 x [168 x float]], ptr addrspace(1) %arg11192, i64 0, i64 %69, i64 %70
  store float %add.58.i151, ptr addrspace(1) %output_element_address123, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_101(ptr noalias nocapture readonly align 128 dereferenceable(172032) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(172032) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(172032) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(672) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(672) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(672) %arg6) local_unnamed_addr #2 {
entry:
  %arg6179 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5177 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4175 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3173 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2171 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1169 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0167 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !115
  switch i32 %0, label %common.ret [
    i32 0, label %reduce-group-0-true
    i32 1, label %reduce-group-1-true
    i32 2, label %entry.reduce-group-2-true_crit_edge
  ]

entry.reduce-group-2-true_crit_edge:              ; preds = %entry
  %Arg_1.271.pre = load float, ptr addrspace(1) %arg1169, align 128, !invariant.load !99
  %.pre = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !116
  %.pre161 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %.pre163 = and i32 %.pre161, 31
  %.pre164 = lshr i32 %.pre161, 5
  %.pre165 = shl nuw nsw i32 %.pre, 5
  %1 = icmp eq i32 %.pre, 5
  %tile_bound77 = select i1 %1, i32 8, i32 32
  %2 = icmp ult i32 %.pre163, %tile_bound77
  %3 = or i32 %.pre165, %.pre163
  %4 = zext i32 %3 to i64
  %5 = zext i32 %.pre164 to i64
  %Arg_3.4 = getelementptr inbounds [256 x [168 x float]], ptr addrspace(1) %arg3173, i64 0, i64 %5, i64 %4
  br i1 %2, label %x_in_tile-true94, label %y_in_tile.loop_body83.1

common.ret.sink.split:                            ; preds = %reduction_write_output-true116, %reduction_write_output-true, %reduction_write_output-true65
  %.sink166 = phi i32 [ %58, %reduction_write_output-true65 ], [ %32, %reduction_write_output-true ], [ %77, %reduction_write_output-true116 ]
  %arg5.sink = phi ptr addrspace(1) [ %arg5177, %reduction_write_output-true65 ], [ %arg4175, %reduction_write_output-true ], [ %arg6179, %reduction_write_output-true116 ]
  %add.13.i145.sink = phi float [ %add.13.i145, %reduction_write_output-true65 ], [ %add.8.i140, %reduction_write_output-true ], [ %add.18.i150, %reduction_write_output-true116 ]
  %6 = zext i32 %.sink166 to i64
  %output_element_address67 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg5.sink, i64 0, i64 %6
  store float %add.13.i145.sink, ptr addrspace(1) %output_element_address67, align 4
  br label %common.ret

common.ret:                                       ; preds = %common.ret.sink.split, %y_in_tile.loop_exit30, %y_in_tile.loop_exit, %y_in_tile.loop_exit81, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !116
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x = and i32 %8, 31
  %thread_id.y122 = lshr i32 %8, 5
  %9 = icmp eq i32 %7, 5
  %tile_bound1 = select i1 %9, i32 8, i32 32
  %tile_origin.2 = shl nuw nsw i32 %7, 5
  %Arg_1.2 = load float, ptr addrspace(1) %arg1169, align 128, !invariant.load !99
  %10 = icmp ult i32 %thread_id.x, %tile_bound1
  %11 = or i32 %tile_origin.2, %thread_id.x
  %12 = zext i32 %11 to i64
  %13 = zext i32 %thread_id.y122 to i64
  %Arg_0.1 = getelementptr inbounds [256 x [168 x float]], ptr addrspace(1) %arg0167, i64 0, i64 %13, i64 %12
  br i1 %10, label %x_in_tile-true, label %y_in_tile.loop_body.1

y_in_tile.loop_body.1:                            ; preds = %reduce-group-0-true, %x_in_tile-true
  %partial_reduction_result.1 = phi float [ %add.8.i141, %x_in_tile-true ], [ %Arg_1.2, %reduce-group-0-true ]
  %14 = icmp ult i32 %thread_id.x, %tile_bound1
  br i1 %14, label %x_in_tile-true.1, label %y_in_tile.loop_body.2

x_in_tile-true.1:                                 ; preds = %y_in_tile.loop_body.1
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %Arg_0.1, i64 21504
  %Arg_0.13.1 = load float, ptr addrspace(1) %sunkaddr, align 4, !invariant.load !99
  %add.8.i141.1 = fadd float %partial_reduction_result.1, %Arg_0.13.1
  br label %y_in_tile.loop_body.2

y_in_tile.loop_body.2:                            ; preds = %y_in_tile.loop_body.1, %x_in_tile-true.1
  %partial_reduction_result.1.1 = phi float [ %add.8.i141.1, %x_in_tile-true.1 ], [ %partial_reduction_result.1, %y_in_tile.loop_body.1 ]
  %15 = icmp ult i32 %thread_id.x, %tile_bound1
  br i1 %15, label %x_in_tile-true.2, label %y_in_tile.loop_body.3

x_in_tile-true.2:                                 ; preds = %y_in_tile.loop_body.2
  %sunkaddr223 = getelementptr inbounds i8, ptr addrspace(1) %Arg_0.1, i64 43008
  %Arg_0.13.2 = load float, ptr addrspace(1) %sunkaddr223, align 4, !invariant.load !99
  %add.8.i141.2 = fadd float %partial_reduction_result.1.1, %Arg_0.13.2
  br label %y_in_tile.loop_body.3

y_in_tile.loop_body.3:                            ; preds = %y_in_tile.loop_body.2, %x_in_tile-true.2
  %partial_reduction_result.1.2 = phi float [ %add.8.i141.2, %x_in_tile-true.2 ], [ %partial_reduction_result.1.1, %y_in_tile.loop_body.2 ]
  %16 = icmp ult i32 %thread_id.x, %tile_bound1
  br i1 %16, label %x_in_tile-true.3, label %y_in_tile.loop_body.4

x_in_tile-true.3:                                 ; preds = %y_in_tile.loop_body.3
  %sunkaddr224 = getelementptr inbounds i8, ptr addrspace(1) %Arg_0.1, i64 64512
  %Arg_0.13.3 = load float, ptr addrspace(1) %sunkaddr224, align 4, !invariant.load !99
  %add.8.i141.3 = fadd float %partial_reduction_result.1.2, %Arg_0.13.3
  br label %y_in_tile.loop_body.4

y_in_tile.loop_body.4:                            ; preds = %y_in_tile.loop_body.3, %x_in_tile-true.3
  %partial_reduction_result.1.3 = phi float [ %add.8.i141.3, %x_in_tile-true.3 ], [ %partial_reduction_result.1.2, %y_in_tile.loop_body.3 ]
  %17 = icmp ult i32 %thread_id.x, %tile_bound1
  br i1 %17, label %x_in_tile-true.4, label %y_in_tile.loop_body.5

x_in_tile-true.4:                                 ; preds = %y_in_tile.loop_body.4
  %sunkaddr225 = getelementptr inbounds i8, ptr addrspace(1) %Arg_0.1, i64 86016
  %Arg_0.13.4 = load float, ptr addrspace(1) %sunkaddr225, align 4, !invariant.load !99
  %add.8.i141.4 = fadd float %partial_reduction_result.1.3, %Arg_0.13.4
  br label %y_in_tile.loop_body.5

y_in_tile.loop_body.5:                            ; preds = %y_in_tile.loop_body.4, %x_in_tile-true.4
  %partial_reduction_result.1.4 = phi float [ %add.8.i141.4, %x_in_tile-true.4 ], [ %partial_reduction_result.1.3, %y_in_tile.loop_body.4 ]
  %18 = icmp ult i32 %thread_id.x, %tile_bound1
  br i1 %18, label %x_in_tile-true.5, label %y_in_tile.loop_body.6

x_in_tile-true.5:                                 ; preds = %y_in_tile.loop_body.5
  %sunkaddr226 = getelementptr inbounds i8, ptr addrspace(1) %Arg_0.1, i64 107520
  %Arg_0.13.5 = load float, ptr addrspace(1) %sunkaddr226, align 4, !invariant.load !99
  %add.8.i141.5 = fadd float %partial_reduction_result.1.4, %Arg_0.13.5
  br label %y_in_tile.loop_body.6

y_in_tile.loop_body.6:                            ; preds = %y_in_tile.loop_body.5, %x_in_tile-true.5
  %partial_reduction_result.1.5 = phi float [ %add.8.i141.5, %x_in_tile-true.5 ], [ %partial_reduction_result.1.4, %y_in_tile.loop_body.5 ]
  %19 = icmp ult i32 %thread_id.x, %tile_bound1
  br i1 %19, label %x_in_tile-true.6, label %y_in_tile.loop_body.7

x_in_tile-true.6:                                 ; preds = %y_in_tile.loop_body.6
  %sunkaddr227 = getelementptr inbounds i8, ptr addrspace(1) %Arg_0.1, i64 129024
  %Arg_0.13.6 = load float, ptr addrspace(1) %sunkaddr227, align 4, !invariant.load !99
  %add.8.i141.6 = fadd float %partial_reduction_result.1.5, %Arg_0.13.6
  br label %y_in_tile.loop_body.7

y_in_tile.loop_body.7:                            ; preds = %y_in_tile.loop_body.6, %x_in_tile-true.6
  %partial_reduction_result.1.6 = phi float [ %add.8.i141.6, %x_in_tile-true.6 ], [ %partial_reduction_result.1.5, %y_in_tile.loop_body.6 ]
  %20 = icmp ult i32 %thread_id.x, %tile_bound1
  br i1 %20, label %x_in_tile-true.7, label %y_in_tile.loop_exit

x_in_tile-true.7:                                 ; preds = %y_in_tile.loop_body.7
  %sunkaddr228 = getelementptr inbounds i8, ptr addrspace(1) %Arg_0.1, i64 150528
  %Arg_0.13.7 = load float, ptr addrspace(1) %sunkaddr228, align 4, !invariant.load !99
  %add.8.i141.7 = fadd float %partial_reduction_result.1.6, %Arg_0.13.7
  br label %y_in_tile.loop_exit

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body.7, %x_in_tile-true.7
  %partial_reduction_result.1.7 = phi float [ %add.8.i141.7, %x_in_tile-true.7 ], [ %partial_reduction_result.1.6, %y_in_tile.loop_body.7 ]
  %21 = trunc i64 %13 to i32
  %22 = zext i32 %thread_id.x to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache17, i64 0, i64 0, i64 0, i64 %22, i64 %13
  store float %partial_reduction_result.1.7, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache17, i64 0, i64 0, i64 0, i64 %13, i64 %22
  %partial_reduction_result4 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  %add.8.i = fadd float %partial_reduction_result4, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.8.i, i32 8, i32 31)
  %add.8.i137 = fadd float %add.8.i, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.8.i137, i32 4, i32 31)
  %add.8.i138 = fadd float %add.8.i137, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.8.i138, i32 2, i32 31)
  %add.8.i139 = fadd float %add.8.i138, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.8.i139, i32 1, i32 31)
  %add.8.i140 = fadd float %add.8.i139, %27
  store float %add.8.i140, ptr addrspace(3) %shmem_transposed_addr, align 4
  %28 = icmp ult i32 %21, %tile_bound1
  %29 = icmp eq i32 %thread_id.x, 0
  %30 = and i1 %29, %28
  br i1 %30, label %reduction_write_output-true, label %common.ret

x_in_tile-true:                                   ; preds = %reduce-group-0-true
  %Arg_0.13 = load float, ptr addrspace(1) %Arg_0.1, align 4, !invariant.load !99
  %add.8.i141 = fadd float %Arg_1.2, %Arg_0.13
  br label %y_in_tile.loop_body.1

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %31 = trunc i64 %13 to i32
  %32 = or i32 %tile_origin.2, %31
  br label %common.ret.sink.split

reduce-group-1-true:                              ; preds = %entry
  %33 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !116
  %34 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x22 = and i32 %34, 31
  %thread_id.y23121 = lshr i32 %34, 5
  %35 = icmp eq i32 %33, 5
  %tile_bound26 = select i1 %35, i32 8, i32 32
  %tile_origin.229 = shl nuw nsw i32 %33, 5
  %Arg_1.220 = load float, ptr addrspace(1) %arg1169, align 128, !invariant.load !99
  %36 = icmp ult i32 %thread_id.x22, %tile_bound26
  %37 = or i32 %tile_origin.229, %thread_id.x22
  %38 = zext i32 %37 to i64
  %39 = zext i32 %thread_id.y23121 to i64
  %Arg_2.3 = getelementptr inbounds [256 x [168 x float]], ptr addrspace(1) %arg2171, i64 0, i64 %39, i64 %38
  br i1 %36, label %x_in_tile-true43, label %y_in_tile.loop_body32.1

y_in_tile.loop_body32.1:                          ; preds = %reduce-group-1-true, %x_in_tile-true43
  %partial_reduction_result19.1 = phi float [ %add.13.i146, %x_in_tile-true43 ], [ %Arg_1.220, %reduce-group-1-true ]
  %40 = icmp ult i32 %thread_id.x22, %tile_bound26
  br i1 %40, label %x_in_tile-true43.1, label %y_in_tile.loop_body32.2

x_in_tile-true43.1:                               ; preds = %y_in_tile.loop_body32.1
  %sunkaddr229 = getelementptr inbounds i8, ptr addrspace(1) %Arg_2.3, i64 21504
  %Arg_2.345.1 = load float, ptr addrspace(1) %sunkaddr229, align 4, !invariant.load !99
  %add.13.i146.1 = fadd float %partial_reduction_result19.1, %Arg_2.345.1
  br label %y_in_tile.loop_body32.2

y_in_tile.loop_body32.2:                          ; preds = %y_in_tile.loop_body32.1, %x_in_tile-true43.1
  %partial_reduction_result19.1.1 = phi float [ %add.13.i146.1, %x_in_tile-true43.1 ], [ %partial_reduction_result19.1, %y_in_tile.loop_body32.1 ]
  %41 = icmp ult i32 %thread_id.x22, %tile_bound26
  br i1 %41, label %x_in_tile-true43.2, label %y_in_tile.loop_body32.3

x_in_tile-true43.2:                               ; preds = %y_in_tile.loop_body32.2
  %sunkaddr230 = getelementptr inbounds i8, ptr addrspace(1) %Arg_2.3, i64 43008
  %Arg_2.345.2 = load float, ptr addrspace(1) %sunkaddr230, align 4, !invariant.load !99
  %add.13.i146.2 = fadd float %partial_reduction_result19.1.1, %Arg_2.345.2
  br label %y_in_tile.loop_body32.3

y_in_tile.loop_body32.3:                          ; preds = %y_in_tile.loop_body32.2, %x_in_tile-true43.2
  %partial_reduction_result19.1.2 = phi float [ %add.13.i146.2, %x_in_tile-true43.2 ], [ %partial_reduction_result19.1.1, %y_in_tile.loop_body32.2 ]
  %42 = icmp ult i32 %thread_id.x22, %tile_bound26
  br i1 %42, label %x_in_tile-true43.3, label %y_in_tile.loop_body32.4

x_in_tile-true43.3:                               ; preds = %y_in_tile.loop_body32.3
  %sunkaddr231 = getelementptr inbounds i8, ptr addrspace(1) %Arg_2.3, i64 64512
  %Arg_2.345.3 = load float, ptr addrspace(1) %sunkaddr231, align 4, !invariant.load !99
  %add.13.i146.3 = fadd float %partial_reduction_result19.1.2, %Arg_2.345.3
  br label %y_in_tile.loop_body32.4

y_in_tile.loop_body32.4:                          ; preds = %y_in_tile.loop_body32.3, %x_in_tile-true43.3
  %partial_reduction_result19.1.3 = phi float [ %add.13.i146.3, %x_in_tile-true43.3 ], [ %partial_reduction_result19.1.2, %y_in_tile.loop_body32.3 ]
  %43 = icmp ult i32 %thread_id.x22, %tile_bound26
  br i1 %43, label %x_in_tile-true43.4, label %y_in_tile.loop_body32.5

x_in_tile-true43.4:                               ; preds = %y_in_tile.loop_body32.4
  %sunkaddr232 = getelementptr inbounds i8, ptr addrspace(1) %Arg_2.3, i64 86016
  %Arg_2.345.4 = load float, ptr addrspace(1) %sunkaddr232, align 4, !invariant.load !99
  %add.13.i146.4 = fadd float %partial_reduction_result19.1.3, %Arg_2.345.4
  br label %y_in_tile.loop_body32.5

y_in_tile.loop_body32.5:                          ; preds = %y_in_tile.loop_body32.4, %x_in_tile-true43.4
  %partial_reduction_result19.1.4 = phi float [ %add.13.i146.4, %x_in_tile-true43.4 ], [ %partial_reduction_result19.1.3, %y_in_tile.loop_body32.4 ]
  %44 = icmp ult i32 %thread_id.x22, %tile_bound26
  br i1 %44, label %x_in_tile-true43.5, label %y_in_tile.loop_body32.6

x_in_tile-true43.5:                               ; preds = %y_in_tile.loop_body32.5
  %sunkaddr233 = getelementptr inbounds i8, ptr addrspace(1) %Arg_2.3, i64 107520
  %Arg_2.345.5 = load float, ptr addrspace(1) %sunkaddr233, align 4, !invariant.load !99
  %add.13.i146.5 = fadd float %partial_reduction_result19.1.4, %Arg_2.345.5
  br label %y_in_tile.loop_body32.6

y_in_tile.loop_body32.6:                          ; preds = %y_in_tile.loop_body32.5, %x_in_tile-true43.5
  %partial_reduction_result19.1.5 = phi float [ %add.13.i146.5, %x_in_tile-true43.5 ], [ %partial_reduction_result19.1.4, %y_in_tile.loop_body32.5 ]
  %45 = icmp ult i32 %thread_id.x22, %tile_bound26
  br i1 %45, label %x_in_tile-true43.6, label %y_in_tile.loop_body32.7

x_in_tile-true43.6:                               ; preds = %y_in_tile.loop_body32.6
  %sunkaddr234 = getelementptr inbounds i8, ptr addrspace(1) %Arg_2.3, i64 129024
  %Arg_2.345.6 = load float, ptr addrspace(1) %sunkaddr234, align 4, !invariant.load !99
  %add.13.i146.6 = fadd float %partial_reduction_result19.1.5, %Arg_2.345.6
  br label %y_in_tile.loop_body32.7

y_in_tile.loop_body32.7:                          ; preds = %y_in_tile.loop_body32.6, %x_in_tile-true43.6
  %partial_reduction_result19.1.6 = phi float [ %add.13.i146.6, %x_in_tile-true43.6 ], [ %partial_reduction_result19.1.5, %y_in_tile.loop_body32.6 ]
  %46 = icmp ult i32 %thread_id.x22, %tile_bound26
  br i1 %46, label %x_in_tile-true43.7, label %y_in_tile.loop_exit30

x_in_tile-true43.7:                               ; preds = %y_in_tile.loop_body32.7
  %sunkaddr235 = getelementptr inbounds i8, ptr addrspace(1) %Arg_2.3, i64 150528
  %Arg_2.345.7 = load float, ptr addrspace(1) %sunkaddr235, align 4, !invariant.load !99
  %add.13.i146.7 = fadd float %partial_reduction_result19.1.6, %Arg_2.345.7
  br label %y_in_tile.loop_exit30

y_in_tile.loop_exit30:                            ; preds = %y_in_tile.loop_body32.7, %x_in_tile-true43.7
  %partial_reduction_result19.1.7 = phi float [ %add.13.i146.7, %x_in_tile-true43.7 ], [ %partial_reduction_result19.1.6, %y_in_tile.loop_body32.7 ]
  %47 = trunc i64 %39 to i32
  %48 = zext i32 %thread_id.x22 to i64
  %shmem_output_address47 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache18, i64 0, i64 0, i64 0, i64 %48, i64 %39
  store float %partial_reduction_result19.1.7, ptr addrspace(3) %shmem_output_address47, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr49 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache18, i64 0, i64 0, i64 0, i64 %39, i64 %48
  %partial_reduction_result51 = load float, ptr addrspace(3) %shmem_transposed_addr49, align 4
  %49 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 16, i32 31)
  %add.13.i = fadd float %partial_reduction_result51, %49
  %50 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i, i32 8, i32 31)
  %add.13.i142 = fadd float %add.13.i, %50
  %51 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i142, i32 4, i32 31)
  %add.13.i143 = fadd float %add.13.i142, %51
  %52 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i143, i32 2, i32 31)
  %add.13.i144 = fadd float %add.13.i143, %52
  %53 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i144, i32 1, i32 31)
  %add.13.i145 = fadd float %add.13.i144, %53
  store float %add.13.i145, ptr addrspace(3) %shmem_transposed_addr49, align 4
  %54 = icmp ult i32 %47, %tile_bound26
  %55 = icmp eq i32 %thread_id.x22, 0
  %56 = and i1 %55, %54
  br i1 %56, label %reduction_write_output-true65, label %common.ret

x_in_tile-true43:                                 ; preds = %reduce-group-1-true
  %Arg_2.345 = load float, ptr addrspace(1) %Arg_2.3, align 4, !invariant.load !99
  %add.13.i146 = fadd float %Arg_1.220, %Arg_2.345
  br label %y_in_tile.loop_body32.1

reduction_write_output-true65:                    ; preds = %y_in_tile.loop_exit30
  %57 = trunc i64 %39 to i32
  %58 = or i32 %tile_origin.229, %57
  br label %common.ret.sink.split

y_in_tile.loop_body83.1:                          ; preds = %entry.reduce-group-2-true_crit_edge, %x_in_tile-true94
  %partial_reduction_result70.1 = phi float [ %add.18.i151, %x_in_tile-true94 ], [ %Arg_1.271.pre, %entry.reduce-group-2-true_crit_edge ]
  %59 = icmp ult i32 %.pre163, %tile_bound77
  br i1 %59, label %x_in_tile-true94.1, label %y_in_tile.loop_body83.2

x_in_tile-true94.1:                               ; preds = %y_in_tile.loop_body83.1
  %sunkaddr236 = getelementptr inbounds i8, ptr addrspace(1) %Arg_3.4, i64 21504
  %Arg_3.496.1 = load float, ptr addrspace(1) %sunkaddr236, align 4, !invariant.load !99
  %add.18.i151.1 = fadd float %partial_reduction_result70.1, %Arg_3.496.1
  br label %y_in_tile.loop_body83.2

y_in_tile.loop_body83.2:                          ; preds = %y_in_tile.loop_body83.1, %x_in_tile-true94.1
  %partial_reduction_result70.1.1 = phi float [ %add.18.i151.1, %x_in_tile-true94.1 ], [ %partial_reduction_result70.1, %y_in_tile.loop_body83.1 ]
  %60 = icmp ult i32 %.pre163, %tile_bound77
  br i1 %60, label %x_in_tile-true94.2, label %y_in_tile.loop_body83.3

x_in_tile-true94.2:                               ; preds = %y_in_tile.loop_body83.2
  %sunkaddr237 = getelementptr inbounds i8, ptr addrspace(1) %Arg_3.4, i64 43008
  %Arg_3.496.2 = load float, ptr addrspace(1) %sunkaddr237, align 4, !invariant.load !99
  %add.18.i151.2 = fadd float %partial_reduction_result70.1.1, %Arg_3.496.2
  br label %y_in_tile.loop_body83.3

y_in_tile.loop_body83.3:                          ; preds = %y_in_tile.loop_body83.2, %x_in_tile-true94.2
  %partial_reduction_result70.1.2 = phi float [ %add.18.i151.2, %x_in_tile-true94.2 ], [ %partial_reduction_result70.1.1, %y_in_tile.loop_body83.2 ]
  %61 = icmp ult i32 %.pre163, %tile_bound77
  br i1 %61, label %x_in_tile-true94.3, label %y_in_tile.loop_body83.4

x_in_tile-true94.3:                               ; preds = %y_in_tile.loop_body83.3
  %sunkaddr238 = getelementptr inbounds i8, ptr addrspace(1) %Arg_3.4, i64 64512
  %Arg_3.496.3 = load float, ptr addrspace(1) %sunkaddr238, align 4, !invariant.load !99
  %add.18.i151.3 = fadd float %partial_reduction_result70.1.2, %Arg_3.496.3
  br label %y_in_tile.loop_body83.4

y_in_tile.loop_body83.4:                          ; preds = %y_in_tile.loop_body83.3, %x_in_tile-true94.3
  %partial_reduction_result70.1.3 = phi float [ %add.18.i151.3, %x_in_tile-true94.3 ], [ %partial_reduction_result70.1.2, %y_in_tile.loop_body83.3 ]
  %62 = icmp ult i32 %.pre163, %tile_bound77
  br i1 %62, label %x_in_tile-true94.4, label %y_in_tile.loop_body83.5

x_in_tile-true94.4:                               ; preds = %y_in_tile.loop_body83.4
  %sunkaddr239 = getelementptr inbounds i8, ptr addrspace(1) %Arg_3.4, i64 86016
  %Arg_3.496.4 = load float, ptr addrspace(1) %sunkaddr239, align 4, !invariant.load !99
  %add.18.i151.4 = fadd float %partial_reduction_result70.1.3, %Arg_3.496.4
  br label %y_in_tile.loop_body83.5

y_in_tile.loop_body83.5:                          ; preds = %y_in_tile.loop_body83.4, %x_in_tile-true94.4
  %partial_reduction_result70.1.4 = phi float [ %add.18.i151.4, %x_in_tile-true94.4 ], [ %partial_reduction_result70.1.3, %y_in_tile.loop_body83.4 ]
  %63 = icmp ult i32 %.pre163, %tile_bound77
  br i1 %63, label %x_in_tile-true94.5, label %y_in_tile.loop_body83.6

x_in_tile-true94.5:                               ; preds = %y_in_tile.loop_body83.5
  %sunkaddr240 = getelementptr inbounds i8, ptr addrspace(1) %Arg_3.4, i64 107520
  %Arg_3.496.5 = load float, ptr addrspace(1) %sunkaddr240, align 4, !invariant.load !99
  %add.18.i151.5 = fadd float %partial_reduction_result70.1.4, %Arg_3.496.5
  br label %y_in_tile.loop_body83.6

y_in_tile.loop_body83.6:                          ; preds = %y_in_tile.loop_body83.5, %x_in_tile-true94.5
  %partial_reduction_result70.1.5 = phi float [ %add.18.i151.5, %x_in_tile-true94.5 ], [ %partial_reduction_result70.1.4, %y_in_tile.loop_body83.5 ]
  %64 = icmp ult i32 %.pre163, %tile_bound77
  br i1 %64, label %x_in_tile-true94.6, label %y_in_tile.loop_body83.7

x_in_tile-true94.6:                               ; preds = %y_in_tile.loop_body83.6
  %sunkaddr241 = getelementptr inbounds i8, ptr addrspace(1) %Arg_3.4, i64 129024
  %Arg_3.496.6 = load float, ptr addrspace(1) %sunkaddr241, align 4, !invariant.load !99
  %add.18.i151.6 = fadd float %partial_reduction_result70.1.5, %Arg_3.496.6
  br label %y_in_tile.loop_body83.7

y_in_tile.loop_body83.7:                          ; preds = %y_in_tile.loop_body83.6, %x_in_tile-true94.6
  %partial_reduction_result70.1.6 = phi float [ %add.18.i151.6, %x_in_tile-true94.6 ], [ %partial_reduction_result70.1.5, %y_in_tile.loop_body83.6 ]
  %65 = icmp ult i32 %.pre163, %tile_bound77
  br i1 %65, label %x_in_tile-true94.7, label %y_in_tile.loop_exit81

x_in_tile-true94.7:                               ; preds = %y_in_tile.loop_body83.7
  %sunkaddr242 = getelementptr inbounds i8, ptr addrspace(1) %Arg_3.4, i64 150528
  %Arg_3.496.7 = load float, ptr addrspace(1) %sunkaddr242, align 4, !invariant.load !99
  %add.18.i151.7 = fadd float %partial_reduction_result70.1.6, %Arg_3.496.7
  br label %y_in_tile.loop_exit81

y_in_tile.loop_exit81:                            ; preds = %y_in_tile.loop_body83.7, %x_in_tile-true94.7
  %partial_reduction_result70.1.7 = phi float [ %add.18.i151.7, %x_in_tile-true94.7 ], [ %partial_reduction_result70.1.6, %y_in_tile.loop_body83.7 ]
  %66 = trunc i64 %5 to i32
  %67 = zext i32 %.pre163 to i64
  %shmem_output_address98 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache19, i64 0, i64 0, i64 0, i64 %67, i64 %5
  store float %partial_reduction_result70.1.7, ptr addrspace(3) %shmem_output_address98, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr100 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache19, i64 0, i64 0, i64 0, i64 %5, i64 %67
  %partial_reduction_result102 = load float, ptr addrspace(3) %shmem_transposed_addr100, align 4
  %68 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result102, i32 16, i32 31)
  %add.18.i = fadd float %partial_reduction_result102, %68
  %69 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.18.i, i32 8, i32 31)
  %add.18.i147 = fadd float %add.18.i, %69
  %70 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.18.i147, i32 4, i32 31)
  %add.18.i148 = fadd float %add.18.i147, %70
  %71 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.18.i148, i32 2, i32 31)
  %add.18.i149 = fadd float %add.18.i148, %71
  %72 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.18.i149, i32 1, i32 31)
  %add.18.i150 = fadd float %add.18.i149, %72
  store float %add.18.i150, ptr addrspace(3) %shmem_transposed_addr100, align 4
  %73 = icmp ult i32 %66, %tile_bound77
  %74 = icmp eq i32 %.pre163, 0
  %75 = and i1 %74, %73
  br i1 %75, label %reduction_write_output-true116, label %common.ret

x_in_tile-true94:                                 ; preds = %entry.reduce-group-2-true_crit_edge
  %Arg_3.496 = load float, ptr addrspace(1) %Arg_3.4, align 4, !invariant.load !99
  %add.18.i151 = fadd float %Arg_1.271.pre, %Arg_3.496
  br label %y_in_tile.loop_body83.1

reduction_write_output-true116:                   ; preds = %y_in_tile.loop_exit81
  %76 = trunc i64 %5 to i32
  %77 = or i32 %.pre165, %76
  br label %common.ret.sink.split
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_88(ptr noalias nocapture readonly align 16 dereferenceable(672) %arg0, ptr noalias nocapture align 128 dereferenceable(672) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(672) %arg3, ptr noalias nocapture align 128 dereferenceable(672) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(672) %arg5, ptr noalias nocapture align 128 dereferenceable(672) %arg6) local_unnamed_addr #0 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !99
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.9 = fmul float %4, %6
  %subtract.10 = fsub float %3, %multiply.9
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %1
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !99
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %1
  %10 = load float, ptr addrspace(1) %9, align 4
  %multiply.11 = fmul float %4, %10
  %subtract.12 = fsub float %8, %multiply.11
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %1
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !99
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg613, i64 %1
  %14 = load float, ptr addrspace(1) %13, align 4
  %multiply.13 = fmul float %4, %14
  %subtract.14 = fsub float %12, %multiply.13
  store float %subtract.10, ptr addrspace(1) %13, align 4
  store float %subtract.12, ptr addrspace(1) %9, align 4
  store float %subtract.14, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_46(ptr noalias nocapture readonly align 16 dereferenceable(172032) %arg0, ptr noalias nocapture align 128 dereferenceable(172032) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !118
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !99
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_44(ptr noalias nocapture readonly align 16 dereferenceable(134217728) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(134217728) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(134217728) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(262144) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(134217728) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(262144) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(134217728) %arg6) local_unnamed_addr #2 {
entry:
  %arg6224 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5222 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4220 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3218 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1214 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0212 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !107
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x = and i32 %1, 31
  %thread_id.y157 = lshr i32 %1, 5
  %2 = lshr i32 %0, 2
  %3 = shl nuw nsw i32 %0, 6
  %tile_origin.2 = and i32 %3, 192
  %4 = shl nuw nsw i32 %thread_id.x, 1
  %5 = shl nuw nsw i32 %2, 17
  %6 = shl nuw nsw i32 %thread_id.y157, 8
  %7 = add i32 %6, %tile_origin.2
  %8 = add i32 %7, %4
  %9 = add i32 %5, %6
  %10 = add i32 %9, %tile_origin.2
  %11 = add i32 %10, %4
  %12 = add i32 %11, 1
  %13 = lshr i32 %12, 8
  %14 = lshr i32 %11, 8
  %15 = zext i32 %11 to i64
  %16 = shl nuw nsw i64 %15, 2
  %17 = add nuw nsw i64 %16, 4
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0212, i64 %17
  %scevgep240 = getelementptr i8, ptr addrspace(1) %arg1214, i64 %17
  %scevgep244 = getelementptr i8, ptr addrspace(1) %arg2216, i64 %17
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after130, %reduction_write_output-true151
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %y_in_tile.loop_body
  %lsr.iv245 = phi ptr addrspace(1) [ %scevgep244, %entry ], [ %scevgep246, %y_in_tile.loop_body ]
  %lsr.iv241 = phi ptr addrspace(1) [ %scevgep240, %entry ], [ %scevgep242, %y_in_tile.loop_body ]
  %lsr.iv237 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep238, %y_in_tile.loop_body ]
  %lsr.iv235 = phi i32 [ %8, %entry ], [ %lsr.iv.next236, %y_in_tile.loop_body ]
  %lsr.iv = phi i32 [ 0, %entry ], [ %lsr.iv.next, %y_in_tile.loop_body ]
  %partial_reduction_result2155.sroa.4.0207 = phi float [ 0.000000e+00, %entry ], [ %add.22.i183, %y_in_tile.loop_body ]
  %partial_reduction_result156.sroa.0.0206 = phi float [ 0.000000e+00, %entry ], [ %add.15.i, %y_in_tile.loop_body ]
  %partial_reduction_result156.sroa.4.0205 = phi float [ 0.000000e+00, %entry ], [ %add.15.i182, %y_in_tile.loop_body ]
  %partial_reduction_result2155.sroa.0.0204 = phi float [ 0.000000e+00, %entry ], [ %add.22.i, %y_in_tile.loop_body ]
  %18 = add i32 %thread_id.y157, %lsr.iv
  %19 = and i32 %lsr.iv235, 254
  %20 = add i32 %14, %lsr.iv
  %21 = and i32 %20, 16776704
  %22 = or i32 %21, %18
  %23 = zext i32 %22 to i64
  %24 = zext i32 %19 to i64
  %Arg_1.2 = getelementptr inbounds [131072 x [256 x float]], ptr addrspace(1) %arg1214, i64 0, i64 %23, i64 %24
  %Arg_1.26 = load float, ptr addrspace(1) %Arg_1.2, align 8, !invariant.load !99
  %Arg_2.3 = getelementptr inbounds [131072 x [256 x float]], ptr addrspace(1) %arg2216, i64 0, i64 %23, i64 %24
  %Arg_2.37 = load float, ptr addrspace(1) %Arg_2.3, align 8, !invariant.load !99
  %multiply.4 = fmul float %Arg_1.26, %Arg_2.37
  %Arg_0.1 = getelementptr inbounds [131072 x [256 x float]], ptr addrspace(1) %arg0212, i64 0, i64 %23, i64 %24
  %Arg_0.18 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !99
  %multiply.5 = fmul float %multiply.4, %Arg_0.18
  %subtract.8 = fsub float 1.000000e+00, %Arg_0.18
  %multiply.9 = fmul float %multiply.5, %subtract.8
  %add.15.i = fadd float %partial_reduction_result156.sroa.0.0206, %multiply.9
  %multiply.17 = fmul float %Arg_1.26, %Arg_0.18
  %add.22.i = fadd float %partial_reduction_result2155.sroa.0.0204, %multiply.17
  %scevgep243 = getelementptr i8, ptr addrspace(1) %lsr.iv241, i64 -4
  %25 = load <2 x float>, ptr addrspace(1) %scevgep243, align 8, !invariant.load !99
  %Arg_1.217248 = extractelement <2 x float> %25, i32 0
  %Arg_1.258249 = extractelement <2 x float> %25, i32 1
  %scevgep247 = getelementptr i8, ptr addrspace(1) %lsr.iv245, i64 -4
  %26 = load <2 x float>, ptr addrspace(1) %scevgep247, align 8, !invariant.load !99
  %Arg_2.319250 = extractelement <2 x float> %26, i32 0
  %Arg_2.360251 = extractelement <2 x float> %26, i32 1
  %multiply.420 = fmul float %Arg_1.217248, %Arg_2.319250
  %scevgep239 = getelementptr i8, ptr addrspace(1) %lsr.iv237, i64 -4
  %27 = load <2 x float>, ptr addrspace(1) %scevgep239, align 8, !invariant.load !99
  %Arg_0.122252 = extractelement <2 x float> %27, i32 0
  %Arg_0.163253 = extractelement <2 x float> %27, i32 1
  %multiply.523 = fmul float %multiply.420, %Arg_0.122252
  %subtract.827 = fsub float 1.000000e+00, %Arg_0.122252
  %multiply.928 = fmul float %multiply.523, %subtract.827
  %multiply.1733 = fmul float %Arg_1.217248, %Arg_0.122252
  %28 = getelementptr inbounds [131072 x [256 x float]], ptr addrspace(1) %arg4220, i64 0, i64 %23, i64 %24
  store float %multiply.928, ptr addrspace(1) %28, align 8
  %29 = getelementptr inbounds [131072 x [256 x float]], ptr addrspace(1) %arg6224, i64 0, i64 %23, i64 %24
  store float %multiply.1733, ptr addrspace(1) %29, align 8
  %30 = add i32 %lsr.iv235, 1
  %31 = and i32 %30, 255
  %32 = add i32 %13, %lsr.iv
  %33 = and i32 %32, 16776704
  %34 = or i32 %33, %18
  %35 = zext i32 %34 to i64
  %36 = zext i32 %31 to i64
  %Arg_1.237 = getelementptr inbounds [131072 x [256 x float]], ptr addrspace(1) %arg1214, i64 0, i64 %35, i64 %36
  %Arg_1.238 = load float, ptr addrspace(1) %Arg_1.237, align 4, !invariant.load !99
  %Arg_2.339 = getelementptr inbounds [131072 x [256 x float]], ptr addrspace(1) %arg2216, i64 0, i64 %35, i64 %36
  %Arg_2.340 = load float, ptr addrspace(1) %Arg_2.339, align 4, !invariant.load !99
  %multiply.441 = fmul float %Arg_1.238, %Arg_2.340
  %Arg_0.142 = getelementptr inbounds [131072 x [256 x float]], ptr addrspace(1) %arg0212, i64 0, i64 %35, i64 %36
  %Arg_0.143 = load float, ptr addrspace(1) %Arg_0.142, align 4, !invariant.load !99
  %multiply.544 = fmul float %multiply.441, %Arg_0.143
  %subtract.848 = fsub float 1.000000e+00, %Arg_0.143
  %multiply.949 = fmul float %multiply.544, %subtract.848
  %add.15.i182 = fadd float %partial_reduction_result156.sroa.4.0205, %multiply.949
  %multiply.1755 = fmul float %Arg_1.238, %Arg_0.143
  %add.22.i183 = fadd float %partial_reduction_result2155.sroa.4.0207, %multiply.1755
  %multiply.461 = fmul float %Arg_1.258249, %Arg_2.360251
  %multiply.564 = fmul float %multiply.461, %Arg_0.163253
  %subtract.868 = fsub float 1.000000e+00, %Arg_0.163253
  %multiply.969 = fmul float %multiply.564, %subtract.868
  %multiply.1774 = fmul float %Arg_1.258249, %Arg_0.163253
  %37 = getelementptr inbounds [131072 x [256 x float]], ptr addrspace(1) %arg4220, i64 0, i64 %35, i64 %36
  store float %multiply.969, ptr addrspace(1) %37, align 4
  %38 = getelementptr inbounds [131072 x [256 x float]], ptr addrspace(1) %arg6224, i64 0, i64 %35, i64 %36
  store float %multiply.1774, ptr addrspace(1) %38, align 4
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 32
  %39 = add i32 %thread_id.y157, %lsr.iv.next
  %40 = add i32 %39, -32
  %lsr.iv.next236 = add nuw nsw i32 %lsr.iv235, 8192
  %scevgep238 = getelementptr i8, ptr addrspace(1) %lsr.iv237, i64 32768
  %scevgep242 = getelementptr i8, ptr addrspace(1) %lsr.iv241, i64 32768
  %scevgep246 = getelementptr i8, ptr addrspace(1) %lsr.iv245, i64 32768
  %41 = icmp ugt i32 %40, 479
  br i1 %41, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %42 = zext i32 %thread_id.x to i64
  %43 = zext i32 %thread_id.y157 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache20, i64 0, i64 0, i64 0, i64 %42, i64 %43
  store float %add.15.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache20, i64 0, i64 0, i64 0, i64 %43, i64 %42
  %partial_reduction_result75 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %44 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result75, i32 16, i32 31)
  %add.15.i184 = fadd float %partial_reduction_result75, %44
  %45 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i184, i32 8, i32 31)
  %add.15.i185 = fadd float %add.15.i184, %45
  %46 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i185, i32 4, i32 31)
  %add.15.i186 = fadd float %add.15.i185, %46
  %47 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i186, i32 2, i32 31)
  %add.15.i187 = fadd float %add.15.i186, %47
  %48 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i187, i32 1, i32 31)
  %add.15.i188 = fadd float %add.15.i187, %48
  store float %add.15.i188, ptr addrspace(3) %shmem_transposed_addr, align 4
  %49 = shl nuw nsw i32 %thread_id.y157, 1
  %50 = icmp eq i32 %thread_id.x, 0
  %51 = zext i32 %2 to i64
  %52 = or i32 %49, %tile_origin.2
  %53 = zext i32 %52 to i64
  %output_element_address = getelementptr inbounds [256 x [256 x float]], ptr addrspace(1) %arg3218, i64 0, i64 %51, i64 %53
  br i1 %50, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %54 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address89229 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.15.i182, ptr addrspace(3) %shmem_output_address89229, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr91230 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result93 = load float, ptr addrspace(3) %shmem_transposed_addr91230, align 4
  %55 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result93, i32 16, i32 31)
  %add.15.i189 = fadd float %partial_reduction_result93, %55
  %56 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i189, i32 8, i32 31)
  %add.15.i190 = fadd float %add.15.i189, %56
  %57 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i190, i32 4, i32 31)
  %add.15.i191 = fadd float %add.15.i190, %57
  %58 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i191, i32 2, i32 31)
  %add.15.i192 = fadd float %add.15.i191, %58
  %59 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i192, i32 1, i32 31)
  %add.15.i193 = fadd float %add.15.i192, %59
  store float %add.15.i193, ptr addrspace(3) %shmem_transposed_addr91230, align 4
  br i1 %54, label %reduction_write_output-true107, label %reduction_write_output-after108

reduction_write_output-after108:                  ; preds = %reduction_write_output-true107, %reduction_write_output-after
  %60 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address111 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache21, i64 0, i64 0, i64 0, i64 %42, i64 %43
  store float %add.22.i, ptr addrspace(3) %shmem_output_address111, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr113 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache21, i64 0, i64 0, i64 0, i64 %43, i64 %42
  %partial_reduction_result115 = load float, ptr addrspace(3) %shmem_transposed_addr113, align 4
  %61 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result115, i32 16, i32 31)
  %add.22.i194 = fadd float %partial_reduction_result115, %61
  %62 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i194, i32 8, i32 31)
  %add.22.i195 = fadd float %add.22.i194, %62
  %63 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i195, i32 4, i32 31)
  %add.22.i196 = fadd float %add.22.i195, %63
  %64 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i196, i32 2, i32 31)
  %add.22.i197 = fadd float %add.22.i196, %64
  %65 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i197, i32 1, i32 31)
  %add.22.i198 = fadd float %add.22.i197, %65
  store float %add.22.i198, ptr addrspace(3) %shmem_transposed_addr113, align 4
  %output_element_address131 = getelementptr inbounds [256 x [256 x float]], ptr addrspace(1) %arg5222, i64 0, i64 %51, i64 %53
  br i1 %60, label %reduction_write_output-true129, label %reduction_write_output-after130

reduction_write_output-after130:                  ; preds = %reduction_write_output-true129, %reduction_write_output-after108
  %66 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address133231 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address111, i64 1056
  store float %add.22.i183, ptr addrspace(3) %shmem_output_address133231, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr135232 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr113, i64 1056
  %partial_reduction_result137 = load float, ptr addrspace(3) %shmem_transposed_addr135232, align 4
  %67 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result137, i32 16, i32 31)
  %add.22.i199 = fadd float %partial_reduction_result137, %67
  %68 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i199, i32 8, i32 31)
  %add.22.i200 = fadd float %add.22.i199, %68
  %69 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i200, i32 4, i32 31)
  %add.22.i201 = fadd float %add.22.i200, %69
  %70 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i201, i32 2, i32 31)
  %add.22.i202 = fadd float %add.22.i201, %70
  %71 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i202, i32 1, i32 31)
  %add.22.i203 = fadd float %add.22.i202, %71
  store float %add.22.i203, ptr addrspace(3) %shmem_transposed_addr135232, align 4
  br i1 %66, label %reduction_write_output-true151, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.15.i188, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true107:                   ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.15.i193, ptr addrspace(1) %sunkaddr, align 4
  br label %reduction_write_output-after108

reduction_write_output-true129:                   ; preds = %reduction_write_output-after108
  store float %add.22.i198, ptr addrspace(1) %output_element_address131, align 8
  br label %reduction_write_output-after130

reduction_write_output-true151:                   ; preds = %reduction_write_output-after130
  %sunkaddr254 = getelementptr inbounds i8, ptr addrspace(1) %output_element_address131, i64 4
  store float %add.22.i203, ptr addrspace(1) %sunkaddr254, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_38(ptr noalias nocapture readonly align 128 dereferenceable(67108864) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg1) local_unnamed_addr #2 {
entry:
  %arg178 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg076 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !119
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x = and i32 %1, 31
  %thread_id.y47 = lshr i32 %1, 5
  %2 = lshr i32 %0, 1
  %3 = shl nuw nsw i32 %0, 6
  %tile_origin.2 = and i32 %3, 64
  %4 = shl nuw nsw i32 %thread_id.x, 1
  %5 = or i32 %4, %tile_origin.2
  %6 = shl nuw nsw i32 %2, 9
  %7 = zext i32 %5 to i64
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after, %reduction_write_output-true42
  ret void

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_body, %entry
  %y_in_tile.invar_address.074 = phi i32 [ %thread_id.y47, %entry ], [ %32, %y_in_tile.loop_body ]
  %partial_reduction_result46.sroa.4.073 = phi float [ 0.000000e+00, %entry ], [ %add.7.i61.3, %y_in_tile.loop_body ]
  %partial_reduction_result46.sroa.0.072 = phi float [ 0.000000e+00, %entry ], [ %add.7.i.3, %y_in_tile.loop_body ]
  %8 = add i32 %6, %y_in_tile.invar_address.074
  %9 = and i32 %8, 33553920
  %10 = or i32 %9, %y_in_tile.invar_address.074
  %11 = zext i32 %10 to i64
  %Arg_0.1 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg076, i64 0, i64 %11, i64 %7
  %12 = load <2 x float>, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !99
  %Arg_0.1387 = extractelement <2 x float> %12, i32 0
  %Arg_0.1888 = extractelement <2 x float> %12, i32 1
  %add.7.i = fadd float %partial_reduction_result46.sroa.0.072, %Arg_0.1387
  %add.7.i61 = fadd float %partial_reduction_result46.sroa.4.073, %Arg_0.1888
  %13 = add i32 %8, 32
  %14 = and i32 %13, 33553920
  %15 = add i32 %y_in_tile.invar_address.074, 32
  %16 = or i32 %14, %15
  %17 = zext i32 %16 to i64
  %Arg_0.1.1 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg076, i64 0, i64 %17, i64 %7
  %18 = load <2 x float>, ptr addrspace(1) %Arg_0.1.1, align 8, !invariant.load !99
  %Arg_0.13.189 = extractelement <2 x float> %18, i32 0
  %Arg_0.18.190 = extractelement <2 x float> %18, i32 1
  %add.7.i.1 = fadd float %add.7.i, %Arg_0.13.189
  %add.7.i61.1 = fadd float %add.7.i61, %Arg_0.18.190
  %19 = add i32 %8, 64
  %20 = and i32 %19, 33553920
  %21 = add i32 %15, 32
  %22 = or i32 %20, %21
  %23 = zext i32 %22 to i64
  %Arg_0.1.2 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg076, i64 0, i64 %23, i64 %7
  %24 = load <2 x float>, ptr addrspace(1) %Arg_0.1.2, align 8, !invariant.load !99
  %Arg_0.13.291 = extractelement <2 x float> %24, i32 0
  %Arg_0.18.292 = extractelement <2 x float> %24, i32 1
  %add.7.i.2 = fadd float %add.7.i.1, %Arg_0.13.291
  %add.7.i61.2 = fadd float %add.7.i61.1, %Arg_0.18.292
  %25 = add i32 %8, 96
  %26 = and i32 %25, 33553920
  %27 = add i32 %21, 32
  %28 = or i32 %26, %27
  %29 = zext i32 %28 to i64
  %Arg_0.1.3 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg076, i64 0, i64 %29, i64 %7
  %30 = load <2 x float>, ptr addrspace(1) %Arg_0.1.3, align 8, !invariant.load !99
  %Arg_0.13.393 = extractelement <2 x float> %30, i32 0
  %Arg_0.18.394 = extractelement <2 x float> %30, i32 1
  %add.7.i.3 = fadd float %add.7.i.2, %Arg_0.13.393
  %add.7.i61.3 = fadd float %add.7.i61.2, %Arg_0.18.394
  %31 = icmp ugt i32 %y_in_tile.invar_address.074, 383
  %32 = add i32 %y_in_tile.invar_address.074, 128
  br i1 %31, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %33 = zext i32 %thread_id.x to i64
  %34 = zext i32 %thread_id.y47 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache22, i64 0, i64 0, i64 0, i64 %33, i64 %34
  store float %add.7.i.3, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache22, i64 0, i64 0, i64 0, i64 %34, i64 %33
  %partial_reduction_result10 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %35 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  %add.7.i62 = fadd float %partial_reduction_result10, %35
  %36 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i62, i32 8, i32 31)
  %add.7.i63 = fadd float %add.7.i62, %36
  %37 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i63, i32 4, i32 31)
  %add.7.i64 = fadd float %add.7.i63, %37
  %38 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i64, i32 2, i32 31)
  %add.7.i65 = fadd float %add.7.i64, %38
  %39 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i65, i32 1, i32 31)
  %add.7.i66 = fadd float %add.7.i65, %39
  store float %add.7.i66, ptr addrspace(3) %shmem_transposed_addr, align 4
  %40 = shl nuw nsw i32 %thread_id.y47, 1
  %41 = icmp eq i32 %thread_id.x, 0
  %42 = zext i32 %2 to i64
  %43 = or i32 %40, %tile_origin.2
  %44 = zext i32 %43 to i64
  %output_element_address = getelementptr inbounds [256 x [128 x float]], ptr addrspace(1) %arg178, i64 0, i64 %42, i64 %44
  br i1 %41, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %45 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address2484 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.7.i61.3, ptr addrspace(3) %shmem_output_address2484, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr2685 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result28 = load float, ptr addrspace(3) %shmem_transposed_addr2685, align 4
  %46 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  %add.7.i67 = fadd float %partial_reduction_result28, %46
  %47 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i67, i32 8, i32 31)
  %add.7.i68 = fadd float %add.7.i67, %47
  %48 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i68, i32 4, i32 31)
  %add.7.i69 = fadd float %add.7.i68, %48
  %49 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i69, i32 2, i32 31)
  %add.7.i70 = fadd float %add.7.i69, %49
  %50 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i70, i32 1, i32 31)
  %add.7.i71 = fadd float %add.7.i70, %50
  store float %add.7.i71, ptr addrspace(3) %shmem_transposed_addr2685, align 4
  br i1 %45, label %reduction_write_output-true42, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.7.i66, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.7.i71, ptr addrspace(1) %sunkaddr, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @reduce_541(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(512) %arg2) local_unnamed_addr #2 {
entry:
  %arg278 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg176 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg074 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !120
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x = and i32 %1, 31
  %thread_id.y47 = lshr i32 %1, 5
  %tile_origin.2 = shl nuw nsw i32 %0, 6
  %2 = shl nuw nsw i32 %thread_id.x, 1
  %3 = or i32 %2, %tile_origin.2
  %4 = zext i32 %3 to i64
  %Arg_1.2 = load float, ptr addrspace(1) %arg176, align 128, !invariant.load !99
  %5 = zext i32 %thread_id.y47 to i64
  %Arg_0.1 = getelementptr inbounds [256 x [128 x float]], ptr addrspace(1) %arg074, i64 0, i64 %5, i64 %4
  %6 = load <2 x float>, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !99
  %Arg_0.13112 = extractelement <2 x float> %6, i32 0
  %Arg_0.18113 = extractelement <2 x float> %6, i32 1
  %add.6.i = fadd float %Arg_1.2, %Arg_0.13112
  %add.6.i59 = fadd float %Arg_1.2, %Arg_0.18113
  %Arg_0.1.182 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 4096
  %7 = load <2 x float>, ptr addrspace(1) %Arg_0.1.182, align 8, !invariant.load !99
  %Arg_0.13.1114 = extractelement <2 x float> %7, i32 0
  %Arg_0.18.1115 = extractelement <2 x float> %7, i32 1
  %add.6.i.1 = fadd float %add.6.i, %Arg_0.13.1114
  %add.6.i59.1 = fadd float %add.6.i59, %Arg_0.18.1115
  %Arg_0.1.286 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 8192
  %8 = load <2 x float>, ptr addrspace(1) %Arg_0.1.286, align 8, !invariant.load !99
  %Arg_0.13.2116 = extractelement <2 x float> %8, i32 0
  %Arg_0.18.2117 = extractelement <2 x float> %8, i32 1
  %add.6.i.2 = fadd float %add.6.i.1, %Arg_0.13.2116
  %add.6.i59.2 = fadd float %add.6.i59.1, %Arg_0.18.2117
  %Arg_0.1.390 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 12288
  %9 = load <2 x float>, ptr addrspace(1) %Arg_0.1.390, align 8, !invariant.load !99
  %Arg_0.13.3118 = extractelement <2 x float> %9, i32 0
  %Arg_0.18.3119 = extractelement <2 x float> %9, i32 1
  %add.6.i.3 = fadd float %add.6.i.2, %Arg_0.13.3118
  %add.6.i59.3 = fadd float %add.6.i59.2, %Arg_0.18.3119
  %Arg_0.1.494 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 16384
  %10 = load <2 x float>, ptr addrspace(1) %Arg_0.1.494, align 8, !invariant.load !99
  %Arg_0.13.4120 = extractelement <2 x float> %10, i32 0
  %Arg_0.18.4121 = extractelement <2 x float> %10, i32 1
  %add.6.i.4 = fadd float %add.6.i.3, %Arg_0.13.4120
  %add.6.i59.4 = fadd float %add.6.i59.3, %Arg_0.18.4121
  %Arg_0.1.598 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 20480
  %11 = load <2 x float>, ptr addrspace(1) %Arg_0.1.598, align 8, !invariant.load !99
  %Arg_0.13.5122 = extractelement <2 x float> %11, i32 0
  %Arg_0.18.5123 = extractelement <2 x float> %11, i32 1
  %add.6.i.5 = fadd float %add.6.i.4, %Arg_0.13.5122
  %add.6.i59.5 = fadd float %add.6.i59.4, %Arg_0.18.5123
  %Arg_0.1.6102 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 24576
  %12 = load <2 x float>, ptr addrspace(1) %Arg_0.1.6102, align 8, !invariant.load !99
  %Arg_0.13.6124 = extractelement <2 x float> %12, i32 0
  %Arg_0.18.6125 = extractelement <2 x float> %12, i32 1
  %add.6.i.6 = fadd float %add.6.i.5, %Arg_0.13.6124
  %add.6.i59.6 = fadd float %add.6.i59.5, %Arg_0.18.6125
  %Arg_0.1.7106 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 28672
  %13 = load <2 x float>, ptr addrspace(1) %Arg_0.1.7106, align 8, !invariant.load !99
  %Arg_0.13.7126 = extractelement <2 x float> %13, i32 0
  %Arg_0.18.7127 = extractelement <2 x float> %13, i32 1
  %add.6.i.7 = fadd float %add.6.i.6, %Arg_0.13.7126
  %add.6.i59.7 = fadd float %add.6.i59.6, %Arg_0.18.7127
  %14 = zext i32 %thread_id.x to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache23, i64 0, i64 0, i64 0, i64 %14, i64 %5
  store float %add.6.i.7, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache23, i64 0, i64 0, i64 0, i64 %5, i64 %14
  %partial_reduction_result10 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %15 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  %add.6.i60 = fadd float %partial_reduction_result10, %15
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i60, i32 8, i32 31)
  %add.6.i61 = fadd float %add.6.i60, %16
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i61, i32 4, i32 31)
  %add.6.i62 = fadd float %add.6.i61, %17
  %18 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i62, i32 2, i32 31)
  %add.6.i63 = fadd float %add.6.i62, %18
  %19 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i63, i32 1, i32 31)
  %add.6.i64 = fadd float %add.6.i63, %19
  store float %add.6.i64, ptr addrspace(3) %shmem_transposed_addr, align 4
  %20 = shl nuw nsw i32 %thread_id.y47, 1
  %21 = icmp eq i32 %thread_id.x, 0
  %22 = or i32 %20, %tile_origin.2
  %23 = zext i32 %22 to i64
  %output_element_address = getelementptr inbounds [128 x float], ptr addrspace(1) %arg278, i64 0, i64 %23
  br i1 %21, label %reduction_write_output-true, label %reduction_write_output-after

common.ret:                                       ; preds = %reduction_write_output-after, %reduction_write_output-true42
  ret void

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %entry
  %24 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address24109 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.6.i59.7, ptr addrspace(3) %shmem_output_address24109, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26110 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result28 = load float, ptr addrspace(3) %shmem_transposed_addr26110, align 4
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  %add.6.i65 = fadd float %partial_reduction_result28, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i65, i32 8, i32 31)
  %add.6.i66 = fadd float %add.6.i65, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i66, i32 4, i32 31)
  %add.6.i67 = fadd float %add.6.i66, %27
  %28 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i67, i32 2, i32 31)
  %add.6.i68 = fadd float %add.6.i67, %28
  %29 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i68, i32 1, i32 31)
  %add.6.i69 = fadd float %add.6.i68, %29
  store float %add.6.i69, ptr addrspace(3) %shmem_transposed_addr26110, align 4
  br i1 %24, label %reduction_write_output-true42, label %common.ret

reduction_write_output-true:                      ; preds = %entry
  store float %add.6.i64, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.6.i69, ptr addrspace(1) %sunkaddr, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_37(ptr noalias nocapture readonly align 16 dereferenceable(512) %arg0, ptr noalias nocapture align 128 dereferenceable(512) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !101
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !99
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.5 = fmul float %4, %6
  %subtract.6 = fsub float %3, %multiply.5
  store float %subtract.6, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_36(ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg0, ptr noalias nocapture align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !108
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !99
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_104(ptr noalias nocapture readonly align 128 dereferenceable(262144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(262144) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(262144) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(262144) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg8) local_unnamed_addr #2 {
entry:
  %arg8439 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7437 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6435 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5433 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4431 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3429 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2427 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1425 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0423 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !110
  switch i32 %0, label %entry.unreachabledefault [
    i32 0, label %reduce-group-0-true
    i32 1, label %reduce-group-1-true
    i32 2, label %entry.reduce-group-2-true_crit_edge
    i32 3, label %entry.reduce-group-3-true_crit_edge
  ]

entry.reduce-group-3-true_crit_edge:              ; preds = %entry
  %Arg_1.2206.pre = load float, ptr addrspace(1) %arg1425, align 128, !invariant.load !99
  %.pre415 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !110
  %.pre417 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %.pre419 = and i32 %.pre417, 31
  %.pre420 = lshr i32 %.pre417, 5
  %.pre421 = shl nuw nsw i32 %.pre415, 6
  %1 = shl nuw nsw i32 %.pre419, 1
  %2 = or i32 %1, %.pre421
  %3 = zext i32 %2 to i64
  %4 = zext i32 %.pre420 to i64
  %Arg_4.5 = getelementptr inbounds [256 x [256 x float]], ptr addrspace(1) %arg4431, i64 0, i64 %4, i64 %3
  %5 = load <2 x float>, ptr addrspace(1) %Arg_4.5, align 8, !invariant.load !99
  %Arg_4.5231612 = extractelement <2 x float> %5, i32 0
  %Arg_4.5237613 = extractelement <2 x float> %5, i32 1
  %add.24.i = fadd float %Arg_1.2206.pre, %Arg_4.5231612
  %add.24.i378 = fadd float %Arg_1.2206.pre, %Arg_4.5237613
  %6 = icmp ugt i32 %.pre420, 223
  br i1 %6, label %y_in_tile.loop_exit216, label %y_in_tile.loop_body218.1

entry.reduce-group-2-true_crit_edge:              ; preds = %entry
  %Arg_1.2127.pre = load float, ptr addrspace(1) %arg1425, align 128, !invariant.load !99
  %.pre = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !110
  %.pre410 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %.pre412 = and i32 %.pre410, 31
  %.pre413 = lshr i32 %.pre410, 5
  %.pre414 = shl nuw nsw i32 %.pre, 6
  %7 = shl nuw nsw i32 %.pre412, 1
  %8 = or i32 %7, %.pre414
  %9 = zext i32 %8 to i64
  %10 = zext i32 %.pre413 to i64
  %Arg_3.4 = getelementptr inbounds [256 x [256 x float]], ptr addrspace(1) %arg3429, i64 0, i64 %10, i64 %9
  %11 = load <2 x float>, ptr addrspace(1) %Arg_3.4, align 8, !invariant.load !99
  %Arg_3.4152614 = extractelement <2 x float> %11, i32 0
  %Arg_3.4158615 = extractelement <2 x float> %11, i32 1
  %add.19.i = fadd float %Arg_1.2127.pre, %Arg_3.4152614
  %add.19.i367 = fadd float %Arg_1.2127.pre, %Arg_3.4158615
  %Arg_3.4.1443 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 8192
  %12 = load <2 x float>, ptr addrspace(1) %Arg_3.4.1443, align 8, !invariant.load !99
  %Arg_3.4152.1616 = extractelement <2 x float> %12, i32 0
  %Arg_3.4158.1617 = extractelement <2 x float> %12, i32 1
  %add.19.i.1 = fadd float %add.19.i, %Arg_3.4152.1616
  %add.19.i367.1 = fadd float %add.19.i367, %Arg_3.4158.1617
  %Arg_3.4.2447 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 16384
  %13 = load <2 x float>, ptr addrspace(1) %Arg_3.4.2447, align 8, !invariant.load !99
  %Arg_3.4152.2618 = extractelement <2 x float> %13, i32 0
  %Arg_3.4158.2619 = extractelement <2 x float> %13, i32 1
  %add.19.i.2 = fadd float %add.19.i.1, %Arg_3.4152.2618
  %add.19.i367.2 = fadd float %add.19.i367.1, %Arg_3.4158.2619
  %Arg_3.4.3451 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 24576
  %14 = load <2 x float>, ptr addrspace(1) %Arg_3.4.3451, align 8, !invariant.load !99
  %Arg_3.4152.3620 = extractelement <2 x float> %14, i32 0
  %Arg_3.4158.3621 = extractelement <2 x float> %14, i32 1
  %add.19.i.3 = fadd float %add.19.i.2, %Arg_3.4152.3620
  %add.19.i367.3 = fadd float %add.19.i367.2, %Arg_3.4158.3621
  %Arg_3.4.4455 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 32768
  %15 = load <2 x float>, ptr addrspace(1) %Arg_3.4.4455, align 8, !invariant.load !99
  %Arg_3.4152.4622 = extractelement <2 x float> %15, i32 0
  %Arg_3.4158.4623 = extractelement <2 x float> %15, i32 1
  %add.19.i.4 = fadd float %add.19.i.3, %Arg_3.4152.4622
  %add.19.i367.4 = fadd float %add.19.i367.3, %Arg_3.4158.4623
  %Arg_3.4.5459 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 40960
  %16 = load <2 x float>, ptr addrspace(1) %Arg_3.4.5459, align 8, !invariant.load !99
  %Arg_3.4152.5624 = extractelement <2 x float> %16, i32 0
  %Arg_3.4158.5625 = extractelement <2 x float> %16, i32 1
  %add.19.i.5 = fadd float %add.19.i.4, %Arg_3.4152.5624
  %add.19.i367.5 = fadd float %add.19.i367.4, %Arg_3.4158.5625
  %Arg_3.4.6463 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 49152
  %17 = load <2 x float>, ptr addrspace(1) %Arg_3.4.6463, align 8, !invariant.load !99
  %Arg_3.4152.6626 = extractelement <2 x float> %17, i32 0
  %Arg_3.4158.6627 = extractelement <2 x float> %17, i32 1
  %add.19.i.6 = fadd float %add.19.i.5, %Arg_3.4152.6626
  %add.19.i367.6 = fadd float %add.19.i367.5, %Arg_3.4158.6627
  %Arg_3.4.7467 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 57344
  %18 = load <2 x float>, ptr addrspace(1) %Arg_3.4.7467, align 8, !invariant.load !99
  %Arg_3.4152.7628 = extractelement <2 x float> %18, i32 0
  %Arg_3.4158.7629 = extractelement <2 x float> %18, i32 1
  %add.19.i.7 = fadd float %add.19.i.6, %Arg_3.4152.7628
  %add.19.i367.7 = fadd float %add.19.i367.6, %Arg_3.4158.7629
  %19 = zext i32 %.pre412 to i64
  %shmem_output_address160 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache26, i64 0, i64 0, i64 0, i64 %19, i64 %10
  store float %add.19.i.7, ptr addrspace(3) %shmem_output_address160, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr162 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache26, i64 0, i64 0, i64 0, i64 %10, i64 %19
  %partial_reduction_result164 = load float, ptr addrspace(3) %shmem_transposed_addr162, align 4
  %20 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result164, i32 16, i32 31)
  %add.19.i368 = fadd float %partial_reduction_result164, %20
  %21 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i368, i32 8, i32 31)
  %add.19.i369 = fadd float %add.19.i368, %21
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i369, i32 4, i32 31)
  %add.19.i370 = fadd float %add.19.i369, %22
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i370, i32 2, i32 31)
  %add.19.i371 = fadd float %add.19.i370, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i371, i32 1, i32 31)
  %add.19.i372 = fadd float %add.19.i371, %24
  store float %add.19.i372, ptr addrspace(3) %shmem_transposed_addr162, align 4
  %25 = shl nuw nsw i32 %.pre413, 1
  %26 = icmp eq i32 %.pre412, 0
  %27 = or i32 %25, %.pre414
  %28 = zext i32 %27 to i64
  %output_element_address180 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg7437, i64 0, i64 %28
  br i1 %26, label %reduction_write_output-true178, label %reduction_write_output-after179

entry.unreachabledefault:                         ; preds = %entry
  unreachable

common.ret.sink.split:                            ; preds = %reduction_write_output-after258, %reduction_write_output-after100, %reduction_write_output-after
  %.sink = phi i32 [ %53, %reduction_write_output-after ], [ %83, %reduction_write_output-after100 ], [ %125, %reduction_write_output-after258 ]
  %arg6.sink = phi ptr addrspace(1) [ %arg5433, %reduction_write_output-after ], [ %arg6435, %reduction_write_output-after100 ], [ %arg8439, %reduction_write_output-after258 ]
  %add.14.i366.sink = phi float [ %add.9.i355, %reduction_write_output-after ], [ %add.14.i366, %reduction_write_output-after100 ], [ %add.24.i388, %reduction_write_output-after258 ]
  %29 = or i32 %.sink, 1
  %30 = zext i32 %29 to i64
  %output_element_address123 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg6.sink, i64 0, i64 %30
  store float %add.14.i366.sink, ptr addrspace(1) %output_element_address123, align 4
  br label %common.ret

common.ret:                                       ; preds = %reduction_write_output-after201, %common.ret.sink.split, %reduction_write_output-after100, %reduction_write_output-after, %reduction_write_output-after258
  ret void

reduce-group-0-true:                              ; preds = %entry
  %31 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !110
  %32 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x = and i32 %32, 31
  %thread_id.y297 = lshr i32 %32, 5
  %tile_origin.2 = shl nuw nsw i32 %31, 6
  %33 = shl nuw nsw i32 %thread_id.x, 1
  %34 = or i32 %33, %tile_origin.2
  %35 = zext i32 %34 to i64
  %Arg_1.2 = load float, ptr addrspace(1) %arg1425, align 128, !invariant.load !99
  %36 = zext i32 %thread_id.y297 to i64
  %Arg_0.1 = getelementptr inbounds [256 x [256 x float]], ptr addrspace(1) %arg0423, i64 0, i64 %36, i64 %35
  %37 = load <2 x float>, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !99
  %Arg_0.13566 = extractelement <2 x float> %37, i32 0
  %Arg_0.18567 = extractelement <2 x float> %37, i32 1
  %add.9.i = fadd float %Arg_1.2, %Arg_0.13566
  %add.9.i345 = fadd float %Arg_1.2, %Arg_0.18567
  %Arg_0.1.1472 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 8192
  %38 = load <2 x float>, ptr addrspace(1) %Arg_0.1.1472, align 8, !invariant.load !99
  %Arg_0.13.1568 = extractelement <2 x float> %38, i32 0
  %Arg_0.18.1569 = extractelement <2 x float> %38, i32 1
  %add.9.i.1 = fadd float %add.9.i, %Arg_0.13.1568
  %add.9.i345.1 = fadd float %add.9.i345, %Arg_0.18.1569
  %Arg_0.1.2476 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 16384
  %39 = load <2 x float>, ptr addrspace(1) %Arg_0.1.2476, align 8, !invariant.load !99
  %Arg_0.13.2570 = extractelement <2 x float> %39, i32 0
  %Arg_0.18.2571 = extractelement <2 x float> %39, i32 1
  %add.9.i.2 = fadd float %add.9.i.1, %Arg_0.13.2570
  %add.9.i345.2 = fadd float %add.9.i345.1, %Arg_0.18.2571
  %Arg_0.1.3480 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 24576
  %40 = load <2 x float>, ptr addrspace(1) %Arg_0.1.3480, align 8, !invariant.load !99
  %Arg_0.13.3572 = extractelement <2 x float> %40, i32 0
  %Arg_0.18.3573 = extractelement <2 x float> %40, i32 1
  %add.9.i.3 = fadd float %add.9.i.2, %Arg_0.13.3572
  %add.9.i345.3 = fadd float %add.9.i345.2, %Arg_0.18.3573
  %Arg_0.1.4484 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 32768
  %41 = load <2 x float>, ptr addrspace(1) %Arg_0.1.4484, align 8, !invariant.load !99
  %Arg_0.13.4574 = extractelement <2 x float> %41, i32 0
  %Arg_0.18.4575 = extractelement <2 x float> %41, i32 1
  %add.9.i.4 = fadd float %add.9.i.3, %Arg_0.13.4574
  %add.9.i345.4 = fadd float %add.9.i345.3, %Arg_0.18.4575
  %Arg_0.1.5488 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 40960
  %42 = load <2 x float>, ptr addrspace(1) %Arg_0.1.5488, align 8, !invariant.load !99
  %Arg_0.13.5576 = extractelement <2 x float> %42, i32 0
  %Arg_0.18.5577 = extractelement <2 x float> %42, i32 1
  %add.9.i.5 = fadd float %add.9.i.4, %Arg_0.13.5576
  %add.9.i345.5 = fadd float %add.9.i345.4, %Arg_0.18.5577
  %Arg_0.1.6492 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 49152
  %43 = load <2 x float>, ptr addrspace(1) %Arg_0.1.6492, align 8, !invariant.load !99
  %Arg_0.13.6578 = extractelement <2 x float> %43, i32 0
  %Arg_0.18.6579 = extractelement <2 x float> %43, i32 1
  %add.9.i.6 = fadd float %add.9.i.5, %Arg_0.13.6578
  %add.9.i345.6 = fadd float %add.9.i345.5, %Arg_0.18.6579
  %Arg_0.1.7496 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 57344
  %44 = load <2 x float>, ptr addrspace(1) %Arg_0.1.7496, align 8, !invariant.load !99
  %Arg_0.13.7580 = extractelement <2 x float> %44, i32 0
  %Arg_0.18.7581 = extractelement <2 x float> %44, i32 1
  %add.9.i.7 = fadd float %add.9.i.6, %Arg_0.13.7580
  %add.9.i345.7 = fadd float %add.9.i345.6, %Arg_0.18.7581
  %45 = zext i32 %thread_id.x to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache24, i64 0, i64 0, i64 0, i64 %45, i64 %36
  store float %add.9.i.7, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache24, i64 0, i64 0, i64 0, i64 %36, i64 %45
  %partial_reduction_result10 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %46 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  %add.9.i346 = fadd float %partial_reduction_result10, %46
  %47 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i346, i32 8, i32 31)
  %add.9.i347 = fadd float %add.9.i346, %47
  %48 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i347, i32 4, i32 31)
  %add.9.i348 = fadd float %add.9.i347, %48
  %49 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i348, i32 2, i32 31)
  %add.9.i349 = fadd float %add.9.i348, %49
  %50 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i349, i32 1, i32 31)
  %add.9.i350 = fadd float %add.9.i349, %50
  store float %add.9.i350, ptr addrspace(3) %shmem_transposed_addr, align 4
  %51 = shl nuw nsw i32 %thread_id.y297, 1
  %52 = icmp eq i32 %thread_id.x, 0
  %53 = or i32 %51, %tile_origin.2
  %54 = zext i32 %53 to i64
  %output_element_address = getelementptr inbounds [256 x float], ptr addrspace(1) %arg5433, i64 0, i64 %54
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %reduce-group-0-true
  %55 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address24499 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.9.i345.7, ptr addrspace(3) %shmem_output_address24499, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26500 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result28 = load float, ptr addrspace(3) %shmem_transposed_addr26500, align 4
  %56 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  %add.9.i351 = fadd float %partial_reduction_result28, %56
  %57 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i351, i32 8, i32 31)
  %add.9.i352 = fadd float %add.9.i351, %57
  %58 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i352, i32 4, i32 31)
  %add.9.i353 = fadd float %add.9.i352, %58
  %59 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i353, i32 2, i32 31)
  %add.9.i354 = fadd float %add.9.i353, %59
  %60 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i354, i32 1, i32 31)
  %add.9.i355 = fadd float %add.9.i354, %60
  store float %add.9.i355, ptr addrspace(3) %shmem_transposed_addr26500, align 4
  br i1 %55, label %common.ret.sink.split, label %common.ret

reduction_write_output-true:                      ; preds = %reduce-group-0-true
  store float %add.9.i350, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduce-group-1-true:                              ; preds = %entry
  %61 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !110
  %62 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x50 = and i32 %62, 31
  %thread_id.y51296 = lshr i32 %62, 5
  %tile_origin.257 = shl nuw nsw i32 %61, 6
  %63 = shl nuw nsw i32 %thread_id.x50, 1
  %64 = or i32 %63, %tile_origin.257
  %65 = zext i32 %64 to i64
  %Arg_1.248 = load float, ptr addrspace(1) %arg1425, align 128, !invariant.load !99
  %66 = zext i32 %thread_id.y51296 to i64
  %Arg_2.3 = getelementptr inbounds [256 x [256 x float]], ptr addrspace(1) %arg2427, i64 0, i64 %66, i64 %65
  %67 = load <2 x float>, ptr addrspace(1) %Arg_2.3, align 8, !invariant.load !99
  %Arg_2.373582 = extractelement <2 x float> %67, i32 0
  %Arg_2.379583 = extractelement <2 x float> %67, i32 1
  %add.14.i = fadd float %Arg_1.248, %Arg_2.373582
  %add.14.i356 = fadd float %Arg_1.248, %Arg_2.379583
  %Arg_2.3.1503 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 8192
  %68 = load <2 x float>, ptr addrspace(1) %Arg_2.3.1503, align 8, !invariant.load !99
  %Arg_2.373.1584 = extractelement <2 x float> %68, i32 0
  %Arg_2.379.1585 = extractelement <2 x float> %68, i32 1
  %add.14.i.1 = fadd float %add.14.i, %Arg_2.373.1584
  %add.14.i356.1 = fadd float %add.14.i356, %Arg_2.379.1585
  %Arg_2.3.2507 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 16384
  %69 = load <2 x float>, ptr addrspace(1) %Arg_2.3.2507, align 8, !invariant.load !99
  %Arg_2.373.2586 = extractelement <2 x float> %69, i32 0
  %Arg_2.379.2587 = extractelement <2 x float> %69, i32 1
  %add.14.i.2 = fadd float %add.14.i.1, %Arg_2.373.2586
  %add.14.i356.2 = fadd float %add.14.i356.1, %Arg_2.379.2587
  %Arg_2.3.3511 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 24576
  %70 = load <2 x float>, ptr addrspace(1) %Arg_2.3.3511, align 8, !invariant.load !99
  %Arg_2.373.3588 = extractelement <2 x float> %70, i32 0
  %Arg_2.379.3589 = extractelement <2 x float> %70, i32 1
  %add.14.i.3 = fadd float %add.14.i.2, %Arg_2.373.3588
  %add.14.i356.3 = fadd float %add.14.i356.2, %Arg_2.379.3589
  %Arg_2.3.4515 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 32768
  %71 = load <2 x float>, ptr addrspace(1) %Arg_2.3.4515, align 8, !invariant.load !99
  %Arg_2.373.4590 = extractelement <2 x float> %71, i32 0
  %Arg_2.379.4591 = extractelement <2 x float> %71, i32 1
  %add.14.i.4 = fadd float %add.14.i.3, %Arg_2.373.4590
  %add.14.i356.4 = fadd float %add.14.i356.3, %Arg_2.379.4591
  %Arg_2.3.5519 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 40960
  %72 = load <2 x float>, ptr addrspace(1) %Arg_2.3.5519, align 8, !invariant.load !99
  %Arg_2.373.5592 = extractelement <2 x float> %72, i32 0
  %Arg_2.379.5593 = extractelement <2 x float> %72, i32 1
  %add.14.i.5 = fadd float %add.14.i.4, %Arg_2.373.5592
  %add.14.i356.5 = fadd float %add.14.i356.4, %Arg_2.379.5593
  %Arg_2.3.6523 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 49152
  %73 = load <2 x float>, ptr addrspace(1) %Arg_2.3.6523, align 8, !invariant.load !99
  %Arg_2.373.6594 = extractelement <2 x float> %73, i32 0
  %Arg_2.379.6595 = extractelement <2 x float> %73, i32 1
  %add.14.i.6 = fadd float %add.14.i.5, %Arg_2.373.6594
  %add.14.i356.6 = fadd float %add.14.i356.5, %Arg_2.379.6595
  %Arg_2.3.7527 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 57344
  %74 = load <2 x float>, ptr addrspace(1) %Arg_2.3.7527, align 8, !invariant.load !99
  %Arg_2.373.7596 = extractelement <2 x float> %74, i32 0
  %Arg_2.379.7597 = extractelement <2 x float> %74, i32 1
  %add.14.i.7 = fadd float %add.14.i.6, %Arg_2.373.7596
  %add.14.i356.7 = fadd float %add.14.i356.6, %Arg_2.379.7597
  %75 = zext i32 %thread_id.x50 to i64
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache25, i64 0, i64 0, i64 0, i64 %75, i64 %66
  store float %add.14.i.7, ptr addrspace(3) %shmem_output_address81, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache25, i64 0, i64 0, i64 0, i64 %66, i64 %75
  %partial_reduction_result85 = load float, ptr addrspace(3) %shmem_transposed_addr83, align 4
  %76 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  %add.14.i357 = fadd float %partial_reduction_result85, %76
  %77 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i357, i32 8, i32 31)
  %add.14.i358 = fadd float %add.14.i357, %77
  %78 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i358, i32 4, i32 31)
  %add.14.i359 = fadd float %add.14.i358, %78
  %79 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i359, i32 2, i32 31)
  %add.14.i360 = fadd float %add.14.i359, %79
  %80 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i360, i32 1, i32 31)
  %add.14.i361 = fadd float %add.14.i360, %80
  store float %add.14.i361, ptr addrspace(3) %shmem_transposed_addr83, align 4
  %81 = shl nuw nsw i32 %thread_id.y51296, 1
  %82 = icmp eq i32 %thread_id.x50, 0
  %83 = or i32 %81, %tile_origin.257
  %84 = zext i32 %83 to i64
  %output_element_address101 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg6435, i64 0, i64 %84
  br i1 %82, label %reduction_write_output-true99, label %reduction_write_output-after100

reduction_write_output-after100:                  ; preds = %reduction_write_output-true99, %reduce-group-1-true
  %85 = icmp eq i32 %thread_id.x50, 0
  %shmem_output_address103530 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address81, i64 1056
  store float %add.14.i356.7, ptr addrspace(3) %shmem_output_address103530, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr105531 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr83, i64 1056
  %partial_reduction_result107 = load float, ptr addrspace(3) %shmem_transposed_addr105531, align 4
  %86 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result107, i32 16, i32 31)
  %add.14.i362 = fadd float %partial_reduction_result107, %86
  %87 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i362, i32 8, i32 31)
  %add.14.i363 = fadd float %add.14.i362, %87
  %88 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i363, i32 4, i32 31)
  %add.14.i364 = fadd float %add.14.i363, %88
  %89 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i364, i32 2, i32 31)
  %add.14.i365 = fadd float %add.14.i364, %89
  %90 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i365, i32 1, i32 31)
  %add.14.i366 = fadd float %add.14.i365, %90
  store float %add.14.i366, ptr addrspace(3) %shmem_transposed_addr105531, align 4
  br i1 %85, label %common.ret.sink.split, label %common.ret

reduction_write_output-true99:                    ; preds = %reduce-group-1-true
  store float %add.14.i361, ptr addrspace(1) %output_element_address101, align 8
  br label %reduction_write_output-after100

reduction_write_output-after179:                  ; preds = %reduction_write_output-true178, %entry.reduce-group-2-true_crit_edge
  %91 = icmp eq i32 %.pre412, 0
  %shmem_output_address182532 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address160, i64 1056
  store float %add.19.i367.7, ptr addrspace(3) %shmem_output_address182532, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr184533 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr162, i64 1056
  %partial_reduction_result186 = load float, ptr addrspace(3) %shmem_transposed_addr184533, align 4
  %92 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result186, i32 16, i32 31)
  %add.19.i373 = fadd float %partial_reduction_result186, %92
  %93 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i373, i32 8, i32 31)
  %add.19.i374 = fadd float %add.19.i373, %93
  %94 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i374, i32 4, i32 31)
  %add.19.i375 = fadd float %add.19.i374, %94
  %95 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i375, i32 2, i32 31)
  %add.19.i376 = fadd float %add.19.i375, %95
  %96 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i376, i32 1, i32 31)
  %add.19.i377 = fadd float %add.19.i376, %96
  store float %add.19.i377, ptr addrspace(3) %shmem_transposed_addr184533, align 4
  br i1 %91, label %reduction_write_output-true200, label %reduction_write_output-after201

reduction_write_output-after201:                  ; preds = %reduction_write_output-true200, %reduction_write_output-after179
  br label %common.ret

reduction_write_output-true178:                   ; preds = %entry.reduce-group-2-true_crit_edge
  store float %add.19.i372, ptr addrspace(1) %output_element_address180, align 8
  br label %reduction_write_output-after179

reduction_write_output-true200:                   ; preds = %reduction_write_output-after179
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address180, i64 4
  store float %add.19.i377, ptr addrspace(1) %sunkaddr, align 4
  br label %reduction_write_output-after201

y_in_tile.loop_body218.1:                         ; preds = %entry.reduce-group-3-true_crit_edge
  %97 = trunc i64 %4 to i32
  %Arg_4.5.1537 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 8192
  %98 = load <2 x float>, ptr addrspace(1) %Arg_4.5.1537, align 8, !invariant.load !99
  %Arg_4.5231.1610 = extractelement <2 x float> %98, i32 0
  %Arg_4.5237.1611 = extractelement <2 x float> %98, i32 1
  %add.24.i.1 = fadd float %add.24.i, %Arg_4.5231.1610
  %add.24.i378.1 = fadd float %add.24.i378, %Arg_4.5237.1611
  %99 = icmp ugt i32 %97, 191
  br i1 %99, label %y_in_tile.loop_exit216, label %y_in_tile.loop_body218.2

y_in_tile.loop_body218.2:                         ; preds = %y_in_tile.loop_body218.1
  %100 = trunc i64 %4 to i32
  %Arg_4.5.2541 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 16384
  %101 = load <2 x float>, ptr addrspace(1) %Arg_4.5.2541, align 8, !invariant.load !99
  %Arg_4.5231.2608 = extractelement <2 x float> %101, i32 0
  %Arg_4.5237.2609 = extractelement <2 x float> %101, i32 1
  %add.24.i.2 = fadd float %add.24.i.1, %Arg_4.5231.2608
  %add.24.i378.2 = fadd float %add.24.i378.1, %Arg_4.5237.2609
  %102 = icmp ugt i32 %100, 159
  br i1 %102, label %y_in_tile.loop_exit216, label %y_in_tile.loop_body218.3

y_in_tile.loop_body218.3:                         ; preds = %y_in_tile.loop_body218.2
  %103 = trunc i64 %4 to i32
  %Arg_4.5.3545 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 24576
  %104 = load <2 x float>, ptr addrspace(1) %Arg_4.5.3545, align 8, !invariant.load !99
  %Arg_4.5231.3606 = extractelement <2 x float> %104, i32 0
  %Arg_4.5237.3607 = extractelement <2 x float> %104, i32 1
  %add.24.i.3 = fadd float %add.24.i.2, %Arg_4.5231.3606
  %add.24.i378.3 = fadd float %add.24.i378.2, %Arg_4.5237.3607
  %105 = icmp ugt i32 %103, 127
  br i1 %105, label %y_in_tile.loop_exit216, label %y_in_tile.loop_body218.4

y_in_tile.loop_body218.4:                         ; preds = %y_in_tile.loop_body218.3
  %106 = trunc i64 %4 to i32
  %Arg_4.5.4549 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 32768
  %107 = load <2 x float>, ptr addrspace(1) %Arg_4.5.4549, align 8, !invariant.load !99
  %Arg_4.5231.4604 = extractelement <2 x float> %107, i32 0
  %Arg_4.5237.4605 = extractelement <2 x float> %107, i32 1
  %add.24.i.4 = fadd float %add.24.i.3, %Arg_4.5231.4604
  %add.24.i378.4 = fadd float %add.24.i378.3, %Arg_4.5237.4605
  %108 = icmp ugt i32 %106, 95
  br i1 %108, label %y_in_tile.loop_exit216, label %y_in_tile.loop_body218.5

y_in_tile.loop_body218.5:                         ; preds = %y_in_tile.loop_body218.4
  %109 = trunc i64 %4 to i32
  %Arg_4.5.5553 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 40960
  %110 = load <2 x float>, ptr addrspace(1) %Arg_4.5.5553, align 8, !invariant.load !99
  %Arg_4.5231.5602 = extractelement <2 x float> %110, i32 0
  %Arg_4.5237.5603 = extractelement <2 x float> %110, i32 1
  %add.24.i.5 = fadd float %add.24.i.4, %Arg_4.5231.5602
  %add.24.i378.5 = fadd float %add.24.i378.4, %Arg_4.5237.5603
  %111 = icmp ugt i32 %109, 63
  br i1 %111, label %y_in_tile.loop_exit216, label %y_in_tile.loop_body218.6

y_in_tile.loop_body218.6:                         ; preds = %y_in_tile.loop_body218.5
  %112 = trunc i64 %4 to i32
  %Arg_4.5.6557 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 49152
  %113 = load <2 x float>, ptr addrspace(1) %Arg_4.5.6557, align 8, !invariant.load !99
  %Arg_4.5231.6600 = extractelement <2 x float> %113, i32 0
  %Arg_4.5237.6601 = extractelement <2 x float> %113, i32 1
  %add.24.i.6 = fadd float %add.24.i.5, %Arg_4.5231.6600
  %add.24.i378.6 = fadd float %add.24.i378.5, %Arg_4.5237.6601
  %114 = icmp ugt i32 %112, 31
  br i1 %114, label %y_in_tile.loop_exit216, label %y_in_tile.loop_body218.7

y_in_tile.loop_body218.7:                         ; preds = %y_in_tile.loop_body218.6
  %sunkaddr630 = getelementptr inbounds i8, ptr addrspace(1) %Arg_4.5, i64 229376
  %115 = load <2 x float>, ptr addrspace(1) %sunkaddr630, align 8, !invariant.load !99
  %Arg_4.5231.7598 = extractelement <2 x float> %115, i32 0
  %Arg_4.5237.7599 = extractelement <2 x float> %115, i32 1
  %add.24.i.7 = fadd float %add.24.i.6, %Arg_4.5231.7598
  %add.24.i378.7 = fadd float %add.24.i378.6, %Arg_4.5237.7599
  br label %y_in_tile.loop_exit216

y_in_tile.loop_exit216:                           ; preds = %y_in_tile.loop_body218.7, %y_in_tile.loop_body218.6, %y_in_tile.loop_body218.5, %y_in_tile.loop_body218.4, %y_in_tile.loop_body218.3, %y_in_tile.loop_body218.2, %y_in_tile.loop_body218.1, %entry.reduce-group-3-true_crit_edge
  %add.24.i.lcssa = phi float [ %add.24.i, %entry.reduce-group-3-true_crit_edge ], [ %add.24.i.1, %y_in_tile.loop_body218.1 ], [ %add.24.i.2, %y_in_tile.loop_body218.2 ], [ %add.24.i.3, %y_in_tile.loop_body218.3 ], [ %add.24.i.4, %y_in_tile.loop_body218.4 ], [ %add.24.i.5, %y_in_tile.loop_body218.5 ], [ %add.24.i.6, %y_in_tile.loop_body218.6 ], [ %add.24.i.7, %y_in_tile.loop_body218.7 ]
  %add.24.i378.lcssa = phi float [ %add.24.i378, %entry.reduce-group-3-true_crit_edge ], [ %add.24.i378.1, %y_in_tile.loop_body218.1 ], [ %add.24.i378.2, %y_in_tile.loop_body218.2 ], [ %add.24.i378.3, %y_in_tile.loop_body218.3 ], [ %add.24.i378.4, %y_in_tile.loop_body218.4 ], [ %add.24.i378.5, %y_in_tile.loop_body218.5 ], [ %add.24.i378.6, %y_in_tile.loop_body218.6 ], [ %add.24.i378.7, %y_in_tile.loop_body218.7 ]
  %116 = trunc i64 %4 to i32
  %117 = zext i32 %.pre419 to i64
  %shmem_output_address239 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache27, i64 0, i64 0, i64 0, i64 %117, i64 %4
  store float %add.24.i.lcssa, ptr addrspace(3) %shmem_output_address239, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr241 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache27, i64 0, i64 0, i64 0, i64 %4, i64 %117
  %partial_reduction_result243 = load float, ptr addrspace(3) %shmem_transposed_addr241, align 4
  %118 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result243, i32 16, i32 31)
  %add.24.i379 = fadd float %partial_reduction_result243, %118
  %119 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i379, i32 8, i32 31)
  %add.24.i380 = fadd float %add.24.i379, %119
  %120 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i380, i32 4, i32 31)
  %add.24.i381 = fadd float %add.24.i380, %120
  %121 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i381, i32 2, i32 31)
  %add.24.i382 = fadd float %add.24.i381, %121
  %122 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i382, i32 1, i32 31)
  %add.24.i383 = fadd float %add.24.i382, %122
  store float %add.24.i383, ptr addrspace(3) %shmem_transposed_addr241, align 4
  %123 = shl nuw nsw i32 %116, 1
  %124 = icmp eq i32 %.pre419, 0
  %125 = or i32 %123, %.pre421
  %126 = zext i32 %125 to i64
  %output_element_address259 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg8439, i64 0, i64 %126
  br i1 %124, label %reduction_write_output-true257, label %reduction_write_output-after258

reduction_write_output-after258:                  ; preds = %reduction_write_output-true257, %y_in_tile.loop_exit216
  %127 = icmp eq i32 %.pre419, 0
  %shmem_output_address261564 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address239, i64 1056
  store float %add.24.i378.lcssa, ptr addrspace(3) %shmem_output_address261564, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr263565 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr241, i64 1056
  %partial_reduction_result265 = load float, ptr addrspace(3) %shmem_transposed_addr263565, align 4
  %128 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result265, i32 16, i32 31)
  %add.24.i384 = fadd float %partial_reduction_result265, %128
  %129 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i384, i32 8, i32 31)
  %add.24.i385 = fadd float %add.24.i384, %129
  %130 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i385, i32 4, i32 31)
  %add.24.i386 = fadd float %add.24.i385, %130
  %131 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i386, i32 2, i32 31)
  %add.24.i387 = fadd float %add.24.i386, %131
  %132 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i387, i32 1, i32 31)
  %add.24.i388 = fadd float %add.24.i387, %132
  store float %add.24.i388, ptr addrspace(3) %shmem_transposed_addr263565, align 4
  br i1 %127, label %common.ret.sink.split, label %common.ret

reduction_write_output-true257:                   ; preds = %y_in_tile.loop_exit216
  store float %add.24.i383, ptr addrspace(1) %output_element_address259, align 8
  br label %reduction_write_output-after258
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_43(ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg0, ptr noalias nocapture align 128 dereferenceable(1024) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg3, ptr noalias nocapture align 128 dereferenceable(1024) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg5, ptr noalias nocapture align 128 dereferenceable(1024) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg7, ptr noalias nocapture align 128 dereferenceable(1024) %arg8) local_unnamed_addr #0 {
entry:
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !99
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.11 = fmul float %4, %6
  %subtract.12 = fsub float %3, %multiply.11
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %1
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !99
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %1
  %10 = load float, ptr addrspace(1) %9, align 4
  %multiply.13 = fmul float %4, %10
  %subtract.14 = fsub float %8, %multiply.13
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %1
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !99
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg613, i64 %1
  %14 = load float, ptr addrspace(1) %13, align 4
  %multiply.15 = fmul float %4, %14
  %subtract.16 = fsub float %12, %multiply.15
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg715, i64 %1
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !99
  %17 = getelementptr inbounds float, ptr addrspace(1) %arg817, i64 %1
  %18 = load float, ptr addrspace(1) %17, align 4
  %multiply.17 = fmul float %4, %18
  %subtract.18 = fsub float %16, %multiply.17
  store float %subtract.12, ptr addrspace(1) %17, align 4
  store float %subtract.14, ptr addrspace(1) %13, align 4
  store float %subtract.16, ptr addrspace(1) %9, align 4
  store float %subtract.18, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_96(ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(172032) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg3, ptr noalias nocapture align 128 dereferenceable(131072) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg5, ptr noalias nocapture align 128 dereferenceable(131072) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg7, ptr noalias nocapture align 128 dereferenceable(131072) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg9, ptr noalias nocapture align 128 dereferenceable(131072) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg11) local_unnamed_addr #0 {
entry:
  %arg1123 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1021 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg919 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !108
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %linear_index = or i32 %1, %2
  %3 = lshr i32 %linear_index, 8
  %4 = and i32 %2, 255
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !99
  %8 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %9 = zext i32 %3 to i64
  %10 = zext i32 %4 to i64
  %11 = getelementptr inbounds [168 x [256 x float]], ptr addrspace(1) %arg13, i64 0, i64 %9, i64 %10
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !99
  %multiply.14 = fmul float %8, %12
  %subtract.15 = fsub float %7, %multiply.14
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %5
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !99
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %5
  %16 = load float, ptr addrspace(1) %15, align 4
  %multiply.16 = fmul float %8, %16
  %subtract.17 = fsub float %14, %multiply.16
  %17 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %5
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !99
  %19 = getelementptr inbounds float, ptr addrspace(1) %arg613, i64 %5
  %20 = load float, ptr addrspace(1) %19, align 4
  %multiply.18 = fmul float %8, %20
  %subtract.19 = fsub float %18, %multiply.18
  %21 = getelementptr inbounds float, ptr addrspace(1) %arg715, i64 %5
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !99
  %23 = getelementptr inbounds float, ptr addrspace(1) %arg817, i64 %5
  %24 = load float, ptr addrspace(1) %23, align 4
  %multiply.20 = fmul float %8, %24
  %subtract.21 = fsub float %22, %multiply.20
  %25 = getelementptr inbounds float, ptr addrspace(1) %arg919, i64 %5
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !99
  %27 = getelementptr inbounds float, ptr addrspace(1) %arg1021, i64 %5
  %28 = load float, ptr addrspace(1) %27, align 4
  %multiply.22 = fmul float %8, %28
  %subtract.23 = fsub float %26, %multiply.22
  %29 = getelementptr inbounds float, ptr addrspace(1) %arg1123, i64 %5
  store float %subtract.15, ptr addrspace(1) %29, align 4
  store float %subtract.17, ptr addrspace(1) %27, align 4
  store float %subtract.19, ptr addrspace(1) %23, align 4
  store float %subtract.21, ptr addrspace(1) %19, align 4
  store float %subtract.23, ptr addrspace(1) %15, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_28(ptr noalias nocapture readonly align 128 dereferenceable(67108864) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(67108864) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !121
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %2, 4
  %5 = and i32 %linear_index3, 63
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = and i32 %linear_index2, 62
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 61
  %8 = and i32 %3, 60
  %9 = lshr i32 %0, 7
  %10 = and i32 %9, 64
  %11 = or i32 %8, %10
  %12 = shl nuw nsw i32 %0, 4
  %13 = and i32 %12, 131056
  %14 = or i32 %13, %4
  %15 = zext i32 %14 to i64
  %16 = zext i32 %11 to i64
  %17 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg01, i64 0, i64 %15, i64 %16
  %18 = load <2 x float>, ptr addrspace(1) %17, align 16, !invariant.load !99
  %19 = extractelement <2 x float> %18, i32 0
  %20 = extractelement <2 x float> %18, i32 1
  %21 = zext i32 %linear_index_base to i64
  %22 = getelementptr float, ptr addrspace(1) %arg13, i64 %21
  %23 = or i32 %7, %10
  %24 = zext i32 %23 to i64
  %25 = or i32 %6, %10
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg01, i64 0, i64 %15, i64 %26
  %28 = load float, ptr addrspace(1) %27, align 8, !invariant.load !99
  %29 = or i32 %5, %10
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg01, i64 0, i64 %15, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4, !invariant.load !99
  %33 = insertelement <4 x float> poison, float %19, i32 0
  %34 = insertelement <4 x float> %33, float %20, i32 1
  %35 = insertelement <4 x float> %34, float %28, i32 2
  %36 = insertelement <4 x float> %35, float %32, i32 3
  store <4 x float> %36, ptr addrspace(1) %22, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_27(ptr noalias nocapture readonly align 128 dereferenceable(67108864) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(67108864) %arg1) local_unnamed_addr #0 {
entry:
  %arg150 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg048 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !121
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 124
  %linear_index1 = or i32 %linear_index_base, 1
  %5 = and i32 %linear_index1, 125
  %6 = lshr i32 %linear_index_base, 7
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = and i32 %linear_index2, 126
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = and i32 %linear_index3, 127
  %9 = and i32 %6, 15
  %10 = lshr i32 %0, 1
  %11 = icmp ugt i32 %4, 63
  %12 = add nsw i32 %4, -64
  %.sink32 = select i1 %11, i32 %12, i32 %4
  %.sink = zext i1 %11 to i64
  %13 = zext i32 %10 to i64
  %14 = zext i32 %9 to i64
  %15 = zext i32 %.sink32 to i64
  %16 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr addrspace(1) %arg048, i64 0, i64 %.sink, i64 %13, i64 %14, i64 %15
  %17 = load float, ptr addrspace(1) %16, align 16, !invariant.load !99
  %18 = zext i32 %linear_index_base to i64
  %19 = getelementptr float, ptr addrspace(1) %arg150, i64 %18
  %20 = icmp ugt i32 %5, 63
  %21 = add nsw i32 %5, -64
  %.sink37 = select i1 %20, i32 %21, i32 %5
  %.sink33 = zext i1 %20 to i64
  %22 = zext i32 %.sink37 to i64
  %23 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr addrspace(1) %arg048, i64 0, i64 %.sink33, i64 %13, i64 %14, i64 %22
  %24 = load float, ptr addrspace(1) %23, align 4, !invariant.load !99
  %25 = icmp ugt i32 %7, 63
  %26 = add nsw i32 %7, -64
  %.sink42 = select i1 %25, i32 %26, i32 %7
  %.sink38 = zext i1 %25 to i64
  %27 = zext i32 %.sink42 to i64
  %28 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr addrspace(1) %arg048, i64 0, i64 %.sink38, i64 %13, i64 %14, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 8, !invariant.load !99
  %30 = icmp ugt i32 %8, 63
  %31 = add nsw i32 %8, -64
  %.sink47 = select i1 %30, i32 %31, i32 %8
  %.sink43 = zext i1 %30 to i64
  %32 = zext i32 %.sink47 to i64
  %33 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr addrspace(1) %arg048, i64 0, i64 %.sink43, i64 %13, i64 %14, i64 %32
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !99
  %35 = insertelement <4 x float> poison, float %17, i32 0
  %36 = insertelement <4 x float> %35, float %24, i32 1
  %37 = insertelement <4 x float> %36, float %29, i32 2
  %38 = insertelement <4 x float> %37, float %34, i32 3
  store <4 x float> %38, ptr addrspace(1) %19, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_26(ptr noalias nocapture readonly align 16 dereferenceable(86016) %arg0, ptr noalias nocapture align 128 dereferenceable(86016) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !122
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !99
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @fusion_25(ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(16777216) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(1048576) %arg2) local_unnamed_addr #6 {
entry:
  %arg243 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg141 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg039 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !102
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !123
  %2 = lshr i32 %0, 4
  %3 = mul nuw nsw i32 %1, 6
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 262144
  br i1 %5, label %x_in_tile-true, label %common.ret

common.ret:                                       ; preds = %entry, %x_in_tile-true, %reduction_write_output-true
  ret void

x_in_tile-true:                                   ; preds = %entry
  %6 = and i32 %0, 15
  %7 = shl nuw nsw i32 %4, 4
  %8 = or i32 %6, %7
  %9 = zext i32 %8 to i64
  %Arg_1.214 = getelementptr inbounds float, ptr addrspace(1) %arg141, i64 %9
  %Arg_0.112 = getelementptr inbounds float, ptr addrspace(1) %arg039, i64 %9
  %Arg_0.113 = load float, ptr addrspace(1) %Arg_0.112, align 4, !invariant.load !99
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !99
  %multiply.316 = fmul float %Arg_0.113, %Arg_1.215
  %add.8.i36 = fadd float %multiply.316, 0.000000e+00
  %10 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.8.i36, i32 8, i32 31)
  %add.8.i = fadd float %add.8.i36, %10
  %11 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.8.i, i32 4, i32 31)
  %add.8.i33 = fadd float %add.8.i, %11
  %12 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.8.i33, i32 2, i32 31)
  %add.8.i34 = fadd float %add.8.i33, %12
  %13 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.8.i34, i32 1, i32 31)
  %14 = icmp eq i32 %6, 0
  br i1 %14, label %reduction_write_output-true, label %common.ret

reduction_write_output-true:                      ; preds = %x_in_tile-true
  %add.8.i35 = fadd float %add.8.i34, %13
  %15 = and i32 %4, 15
  %16 = lshr i32 %4, 4
  %17 = and i32 %16, 8191
  %18 = lshr i32 %4, 17
  %19 = zext i32 %18 to i64
  %20 = zext i32 %17 to i64
  %21 = zext i32 %15 to i64
  %output_element_address = getelementptr inbounds [2 x [8192 x [16 x float]]], ptr addrspace(1) %arg243, i64 0, i64 %19, i64 %20, i64 %21
  store float %add.8.i35, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_24(ptr noalias nocapture readonly align 16 dereferenceable(16777216) %arg0, ptr noalias nocapture align 128 dereferenceable(16777216) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1048576) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(16777216) %arg3) local_unnamed_addr #0 {
entry:
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !124
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %0, 11
  %5 = lshr i32 %linear_index_base, 8
  %6 = and i32 %5, 8191
  %7 = lshr i32 %linear_index_base, 4
  %8 = and i32 %7, 15
  %9 = and i32 %linear_index3, 15
  %linear_index2 = or i32 %linear_index_base, 2
  %10 = and i32 %linear_index2, 14
  %linear_index1 = or i32 %linear_index_base, 1
  %11 = and i32 %linear_index1, 13
  %12 = and i32 %3, 12
  %13 = zext i32 %4 to i64
  %14 = zext i32 %12 to i64
  %15 = zext i32 %6 to i64
  %16 = zext i32 %8 to i64
  %17 = getelementptr inbounds [2 x [16 x [8192 x [16 x float]]]], ptr addrspace(1) %arg319, i64 0, i64 %13, i64 %14, i64 %15, i64 %16
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !99
  %compare.8 = fcmp ogt float %18, 0.000000e+00
  %19 = zext i32 %linear_index_base to i64
  %20 = getelementptr float, ptr addrspace(1) %arg115, i64 %19
  %21 = load <4 x float>, ptr addrspace(1) %20, align 16
  %22 = extractelement <4 x float> %21, i32 0
  %23 = extractelement <4 x float> %21, i32 1
  %24 = extractelement <4 x float> %21, i32 2
  %25 = extractelement <4 x float> %21, i32 3
  %26 = zext i32 %7 to i64
  %27 = getelementptr inbounds float, ptr addrspace(1) %arg217, i64 %26
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !99
  %subtract.10 = fsub float %22, %28
  %29 = getelementptr float, ptr addrspace(1) %arg013, i64 %19
  %30 = load <4 x float>, ptr addrspace(1) %29, align 16, !invariant.load !99
  %31 = extractelement <4 x float> %30, i32 0
  %32 = extractelement <4 x float> %30, i32 1
  %33 = extractelement <4 x float> %30, i32 2
  %34 = extractelement <4 x float> %30, i32 3
  %multiply.11 = fmul float %subtract.10, %31
  %35 = select i1 %compare.8, float %multiply.11, float 0.000000e+00
  %36 = zext i32 %11 to i64
  %37 = getelementptr inbounds [2 x [16 x [8192 x [16 x float]]]], ptr addrspace(1) %arg319, i64 0, i64 %13, i64 %36, i64 %15, i64 %16
  %38 = load float, ptr addrspace(1) %37, align 4, !invariant.load !99
  %compare.82 = fcmp ogt float %38, 0.000000e+00
  %subtract.103 = fsub float %23, %28
  %multiply.114 = fmul float %subtract.103, %32
  %39 = select i1 %compare.82, float %multiply.114, float 0.000000e+00
  %40 = zext i32 %10 to i64
  %41 = getelementptr inbounds [2 x [16 x [8192 x [16 x float]]]], ptr addrspace(1) %arg319, i64 0, i64 %13, i64 %40, i64 %15, i64 %16
  %42 = load float, ptr addrspace(1) %41, align 4, !invariant.load !99
  %compare.86 = fcmp ogt float %42, 0.000000e+00
  %subtract.107 = fsub float %24, %28
  %multiply.118 = fmul float %subtract.107, %33
  %43 = select i1 %compare.86, float %multiply.118, float 0.000000e+00
  %44 = zext i32 %9 to i64
  %45 = getelementptr inbounds [2 x [16 x [8192 x [16 x float]]]], ptr addrspace(1) %arg319, i64 0, i64 %13, i64 %44, i64 %15, i64 %16
  %46 = load float, ptr addrspace(1) %45, align 4, !invariant.load !99
  %compare.810 = fcmp ogt float %46, 0.000000e+00
  %subtract.1011 = fsub float %25, %28
  %multiply.1112 = fmul float %subtract.1011, %34
  %47 = select i1 %compare.810, float %multiply.1112, float 0.000000e+00
  %48 = insertelement <4 x float> poison, float %35, i32 0
  %49 = insertelement <4 x float> %48, float %39, i32 1
  %50 = insertelement <4 x float> %49, float %43, i32 2
  %51 = insertelement <4 x float> %50, float %47, i32 3
  store <4 x float> %51, ptr addrspace(1) %20, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion_23(ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(16777216) %arg2) local_unnamed_addr #2 {
entry:
  %arg236 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg134 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg032 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !119
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x = and i32 %1, 31
  %thread_id.y20 = lshr i32 %1, 5
  %2 = shl i32 %0, 13
  %3 = and i32 %1, 15
  %4 = zext i32 %3 to i64
  %5 = shl nuw nsw i32 %thread_id.y20, 4
  %6 = add i32 %5, %thread_id.x
  %7 = add i32 %6, 512
  %8 = lshr i32 %7, 4
  %9 = add i32 %2, %5
  %10 = add i32 %9, %thread_id.x
  %11 = add i32 %10, 512
  %12 = zext i32 %11 to i64
  %13 = shl nuw nsw i64 %12, 2
  %14 = lshr i32 %11, 4
  %15 = add nuw nsw i32 %thread_id.y20, -64
  %16 = lshr i32 %6, 4
  %17 = zext i32 %10 to i64
  %18 = shl nuw nsw i64 %17, 2
  %19 = lshr i32 %10, 4
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %y_in_tile.loop_exit, %reduction_write_output-true
  ret void

y_in_tile.loop_body:                              ; preds = %x_in_tile-after.1, %entry
  %lsr.iv42 = phi ptr addrspace(1) [ %scevgep43, %x_in_tile-after.1 ], [ %arg236, %entry ]
  %lsr.iv40 = phi ptr addrspace(1) [ %scevgep, %x_in_tile-after.1 ], [ %arg032, %entry ]
  %lsr.iv38 = phi i32 [ %lsr.iv.next39, %x_in_tile-after.1 ], [ %10, %entry ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %x_in_tile-after.1 ], [ 0, %entry ]
  %partial_reduction_result.030 = phi float [ -0.000000e+00, %entry ], [ %partial_reduction_result.1.1, %x_in_tile-after.1 ]
  %20 = icmp ult i32 %thread_id.x, 16
  br i1 %20, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %y_in_tile.loop_body
  %partial_reduction_result.1 = phi float [ %add.7.i29, %x_in_tile-true ], [ %partial_reduction_result.030, %y_in_tile.loop_body ]
  %21 = icmp ult i32 %thread_id.x, 16
  br i1 %21, label %x_in_tile-true.1, label %x_in_tile-after.1

x_in_tile-true.1:                                 ; preds = %x_in_tile-after
  %22 = add i32 %lsr.iv38, 512
  %23 = add i32 %8, %lsr.iv
  %24 = add i32 %14, %lsr.iv
  %25 = and i32 %24, 7680
  %26 = or i32 %25, %23
  %scevgep41 = getelementptr i8, ptr addrspace(1) %lsr.iv40, i64 %13
  %Arg_0.13.1 = load float, ptr addrspace(1) %scevgep41, align 4, !invariant.load !99
  %add.7.i29.1 = fadd float %partial_reduction_result.1, %Arg_0.13.1
  %27 = lshr i32 %22, 17
  %28 = and i32 %27, 1
  %29 = lshr i32 %22, 18
  %30 = zext i32 %28 to i64
  %31 = zext i32 %26 to i64
  %32 = zext i32 %29 to i64
  %Arg_0.14.1 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr addrspace(1) %arg032, i64 0, i64 %30, i64 %31, i64 %32, i64 %4
  %Arg_0.15.1 = load float, ptr addrspace(1) %Arg_0.14.1, align 4, !invariant.load !99
  %scevgep44 = getelementptr i8, ptr addrspace(1) %lsr.iv42, i64 %13
  store float %Arg_0.15.1, ptr addrspace(1) %scevgep44, align 4
  br label %x_in_tile-after.1

x_in_tile-after.1:                                ; preds = %x_in_tile-true.1, %x_in_tile-after
  %partial_reduction_result.1.1 = phi float [ %add.7.i29.1, %x_in_tile-true.1 ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 64
  %lsr.iv.next39 = add nuw nsw i32 %lsr.iv38, 1024
  %scevgep = getelementptr i8, ptr addrspace(1) %lsr.iv40, i64 4096
  %scevgep43 = getelementptr i8, ptr addrspace(1) %lsr.iv42, i64 4096
  %33 = add i32 %15, %lsr.iv.next
  %34 = icmp ugt i32 %33, 447
  br i1 %34, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after.1
  %35 = zext i32 %thread_id.x to i64
  %36 = zext i32 %thread_id.y20 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache28, i64 0, i64 0, i64 0, i64 %35, i64 %36
  store float %partial_reduction_result.1.1, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache28, i64 0, i64 0, i64 0, i64 %36, i64 %35
  %partial_reduction_result6 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %37 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result6, i32 16, i32 31)
  %add.7.i = fadd float %partial_reduction_result6, %37
  %38 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i, i32 8, i32 31)
  %add.7.i25 = fadd float %add.7.i, %38
  %39 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i25, i32 4, i32 31)
  %add.7.i26 = fadd float %add.7.i25, %39
  %40 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i26, i32 2, i32 31)
  %add.7.i27 = fadd float %add.7.i26, %40
  %41 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i27, i32 1, i32 31)
  %add.7.i28 = fadd float %add.7.i27, %41
  store float %add.7.i28, ptr addrspace(3) %shmem_transposed_addr, align 4
  %42 = and i32 %1, 543
  %43 = icmp eq i32 %42, 0
  %44 = lshr i32 %1, 9
  %45 = add nuw nsw i32 %44, %0
  %46 = zext i32 %45 to i64
  %47 = and i32 %thread_id.y20, 15
  %48 = zext i32 %47 to i64
  %output_element_address = getelementptr inbounds [512 x [16 x float]], ptr addrspace(1) %arg134, i64 0, i64 %46, i64 %48
  br i1 %43, label %reduction_write_output-true, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %49 = add i32 %16, %lsr.iv
  %50 = add i32 %19, %lsr.iv
  %51 = and i32 %50, 7680
  %52 = or i32 %51, %49
  %scevgep45 = getelementptr i8, ptr addrspace(1) %lsr.iv40, i64 %18
  %Arg_0.13 = load float, ptr addrspace(1) %scevgep45, align 4, !invariant.load !99
  %add.7.i29 = fadd float %partial_reduction_result.030, %Arg_0.13
  %53 = lshr i32 %lsr.iv38, 17
  %54 = and i32 %53, 1
  %55 = lshr i32 %lsr.iv38, 18
  %56 = zext i32 %54 to i64
  %57 = zext i32 %52 to i64
  %58 = zext i32 %55 to i64
  %Arg_0.14 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr addrspace(1) %arg032, i64 0, i64 %56, i64 %57, i64 %58, i64 %4
  %Arg_0.15 = load float, ptr addrspace(1) %Arg_0.14, align 4, !invariant.load !99
  %scevgep46 = getelementptr i8, ptr addrspace(1) %lsr.iv42, i64 %18
  store float %Arg_0.15, ptr addrspace(1) %scevgep46, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.7.i28, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @reduce_615(ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(64) %arg2) local_unnamed_addr #2 {
entry:
  %arg234 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg132 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg030 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.y18 = lshr i32 %0, 5
  %thread_id.x = and i32 %0, 31
  %Arg_1.2 = load float, ptr addrspace(1) %arg132, align 128, !invariant.load !99
  %1 = zext i32 %thread_id.x to i64
  %2 = add nuw nsw i32 %thread_id.y18, -256
  %3 = zext i32 %0 to i64
  %4 = lshr i64 %3, 5
  %5 = shl nuw nsw i64 %4, 6
  %6 = shl nuw nsw i64 %1, 2
  %7 = add i64 %5, %6
  %8 = add i64 %7, 8192
  %scevgep = getelementptr i8, ptr addrspace(1) %arg030, i64 %8
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %y_in_tile.loop_exit, %reduction_write_output-true
  ret void

y_in_tile.loop_body:                              ; preds = %x_in_tile-after.7, %entry
  %lsr.iv50 = phi ptr addrspace(1) [ %scevgep51, %x_in_tile-after.7 ], [ %scevgep, %entry ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %x_in_tile-after.7 ], [ %2, %entry ]
  %partial_reduction_result.028 = phi float [ %Arg_1.2, %entry ], [ %partial_reduction_result.1.7, %x_in_tile-after.7 ]
  %9 = trunc i64 %1 to i32
  %10 = icmp ult i32 %9, 16
  br i1 %10, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %y_in_tile.loop_body
  %partial_reduction_result.1 = phi float [ %add.6.i27, %x_in_tile-true ], [ %partial_reduction_result.028, %y_in_tile.loop_body ]
  %11 = trunc i64 %1 to i32
  %12 = icmp ult i32 %11, 16
  br i1 %12, label %x_in_tile-true.1, label %x_in_tile-after.1

x_in_tile-true.1:                                 ; preds = %x_in_tile-after
  %sunkaddr = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -6144
  %Arg_0.13.1 = load float, ptr addrspace(1) %sunkaddr, align 4, !invariant.load !99
  %add.6.i27.1 = fadd float %partial_reduction_result.1, %Arg_0.13.1
  br label %x_in_tile-after.1

x_in_tile-after.1:                                ; preds = %x_in_tile-true.1, %x_in_tile-after
  %partial_reduction_result.1.1 = phi float [ %add.6.i27.1, %x_in_tile-true.1 ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %13 = trunc i64 %1 to i32
  %14 = icmp ult i32 %13, 16
  br i1 %14, label %x_in_tile-true.2, label %x_in_tile-after.2

x_in_tile-true.2:                                 ; preds = %x_in_tile-after.1
  %sunkaddr59 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -4096
  %Arg_0.13.2 = load float, ptr addrspace(1) %sunkaddr59, align 4, !invariant.load !99
  %add.6.i27.2 = fadd float %partial_reduction_result.1.1, %Arg_0.13.2
  br label %x_in_tile-after.2

x_in_tile-after.2:                                ; preds = %x_in_tile-true.2, %x_in_tile-after.1
  %partial_reduction_result.1.2 = phi float [ %add.6.i27.2, %x_in_tile-true.2 ], [ %partial_reduction_result.1.1, %x_in_tile-after.1 ]
  %15 = trunc i64 %1 to i32
  %16 = icmp ult i32 %15, 16
  br i1 %16, label %x_in_tile-true.3, label %x_in_tile-after.3

x_in_tile-true.3:                                 ; preds = %x_in_tile-after.2
  %sunkaddr60 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -2048
  %Arg_0.13.3 = load float, ptr addrspace(1) %sunkaddr60, align 4, !invariant.load !99
  %add.6.i27.3 = fadd float %partial_reduction_result.1.2, %Arg_0.13.3
  br label %x_in_tile-after.3

x_in_tile-after.3:                                ; preds = %x_in_tile-true.3, %x_in_tile-after.2
  %partial_reduction_result.1.3 = phi float [ %add.6.i27.3, %x_in_tile-true.3 ], [ %partial_reduction_result.1.2, %x_in_tile-after.2 ]
  %17 = trunc i64 %1 to i32
  %18 = icmp ult i32 %17, 16
  br i1 %18, label %x_in_tile-true.4, label %x_in_tile-after.4

x_in_tile-true.4:                                 ; preds = %x_in_tile-after.3
  %Arg_0.13.4 = load float, ptr addrspace(1) %lsr.iv50, align 4, !invariant.load !99
  %add.6.i27.4 = fadd float %partial_reduction_result.1.3, %Arg_0.13.4
  br label %x_in_tile-after.4

x_in_tile-after.4:                                ; preds = %x_in_tile-true.4, %x_in_tile-after.3
  %partial_reduction_result.1.4 = phi float [ %add.6.i27.4, %x_in_tile-true.4 ], [ %partial_reduction_result.1.3, %x_in_tile-after.3 ]
  %19 = trunc i64 %1 to i32
  %20 = icmp ult i32 %19, 16
  br i1 %20, label %x_in_tile-true.5, label %x_in_tile-after.5

x_in_tile-true.5:                                 ; preds = %x_in_tile-after.4
  %sunkaddr61 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 2048
  %Arg_0.13.5 = load float, ptr addrspace(1) %sunkaddr61, align 4, !invariant.load !99
  %add.6.i27.5 = fadd float %partial_reduction_result.1.4, %Arg_0.13.5
  br label %x_in_tile-after.5

x_in_tile-after.5:                                ; preds = %x_in_tile-true.5, %x_in_tile-after.4
  %partial_reduction_result.1.5 = phi float [ %add.6.i27.5, %x_in_tile-true.5 ], [ %partial_reduction_result.1.4, %x_in_tile-after.4 ]
  %21 = trunc i64 %1 to i32
  %22 = icmp ult i32 %21, 16
  br i1 %22, label %x_in_tile-true.6, label %x_in_tile-after.6

x_in_tile-true.6:                                 ; preds = %x_in_tile-after.5
  %sunkaddr62 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 4096
  %Arg_0.13.6 = load float, ptr addrspace(1) %sunkaddr62, align 4, !invariant.load !99
  %add.6.i27.6 = fadd float %partial_reduction_result.1.5, %Arg_0.13.6
  br label %x_in_tile-after.6

x_in_tile-after.6:                                ; preds = %x_in_tile-true.6, %x_in_tile-after.5
  %partial_reduction_result.1.6 = phi float [ %add.6.i27.6, %x_in_tile-true.6 ], [ %partial_reduction_result.1.5, %x_in_tile-after.5 ]
  %23 = trunc i64 %1 to i32
  %24 = icmp ult i32 %23, 16
  br i1 %24, label %x_in_tile-true.7, label %x_in_tile-after.7

x_in_tile-true.7:                                 ; preds = %x_in_tile-after.6
  %sunkaddr63 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 6144
  %Arg_0.13.7 = load float, ptr addrspace(1) %sunkaddr63, align 4, !invariant.load !99
  %add.6.i27.7 = fadd float %partial_reduction_result.1.6, %Arg_0.13.7
  br label %x_in_tile-after.7

x_in_tile-after.7:                                ; preds = %x_in_tile-true.7, %x_in_tile-after.6
  %partial_reduction_result.1.7 = phi float [ %add.6.i27.7, %x_in_tile-true.7 ], [ %partial_reduction_result.1.6, %x_in_tile-after.6 ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 256
  %scevgep51 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 16384
  %25 = icmp ugt i32 %lsr.iv.next, 255
  br i1 %25, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after.7
  %26 = zext i32 %thread_id.y18 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache29, i64 0, i64 0, i64 0, i64 %1, i64 %26
  store float %partial_reduction_result.1.7, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache29, i64 0, i64 0, i64 0, i64 %26, i64 %1
  %partial_reduction_result4 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  %add.6.i = fadd float %partial_reduction_result4, %27
  %28 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i, i32 8, i32 31)
  %add.6.i23 = fadd float %add.6.i, %28
  %29 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i23, i32 4, i32 31)
  %add.6.i24 = fadd float %add.6.i23, %29
  %30 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i24, i32 2, i32 31)
  %add.6.i25 = fadd float %add.6.i24, %30
  %31 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i25, i32 1, i32 31)
  %add.6.i26 = fadd float %add.6.i25, %31
  store float %add.6.i26, ptr addrspace(3) %shmem_transposed_addr, align 4
  %32 = and i32 %0, 543
  %33 = icmp eq i32 %32, 0
  %output_element_address = getelementptr inbounds [16 x float], ptr addrspace(1) %arg234, i64 0, i64 %26
  br i1 %33, label %reduction_write_output-true, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %sunkaddr64 = getelementptr i8, ptr addrspace(1) %lsr.iv50, i64 -8192
  %Arg_0.13 = load float, ptr addrspace(1) %sunkaddr64, align 4, !invariant.load !99
  %add.6.i27 = fadd float %partial_reduction_result.028, %Arg_0.13
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.6.i26, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_22(ptr noalias nocapture readonly align 16 dereferenceable(64) %arg0, ptr noalias nocapture align 128 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !125
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !99
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.5 = fmul float %4, %6
  %subtract.6 = fsub float %3, %multiply.5
  store float %subtract.6, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_19(ptr noalias nocapture readonly align 16 dereferenceable(2048) %arg0, ptr noalias nocapture align 128 dereferenceable(2048) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !99
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.5 = fmul float %4, %6
  %subtract.6 = fsub float %3, %multiply.5
  store float %subtract.6, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_18(ptr noalias nocapture readonly align 16 dereferenceable(4) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(33554432) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(16777216) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(16777216) %arg4) local_unnamed_addr #0 {
entry:
  %arg415 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !124
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %2, 2
  %5 = and i32 %4, 15
  %6 = and i32 %linear_index3, 15
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = and i32 %linear_index2, 14
  %linear_index1 = or i32 %linear_index_base, 1
  %8 = and i32 %linear_index1, 13
  %9 = and i32 %3, 12
  %10 = lshr i32 %linear_index_base, 4
  %11 = and i32 %10, 131056
  %12 = shl nuw nsw i32 %0, 6
  %13 = and i32 %12, 131072
  %14 = or i32 %13, %5
  %15 = or i32 %14, %11
  %16 = zext i32 %15 to i64
  %17 = zext i32 %9 to i64
  %18 = getelementptr [262144 x [32 x float]], ptr addrspace(1) %arg19, i64 0, i64 %16, i64 %17
  %19 = getelementptr inbounds float, ptr addrspace(1) %18, i64 16
  %20 = load <2 x float>, ptr addrspace(1) %19, align 16, !invariant.load !99
  %21 = extractelement <2 x float> %20, i32 0
  %22 = extractelement <2 x float> %20, i32 1
  %23 = load float, ptr addrspace(1) %arg07, align 16, !invariant.load !99
  %multiply.7 = fmul float %21, %23
  %24 = load <2 x float>, ptr addrspace(1) %18, align 16, !invariant.load !99
  %25 = extractelement <2 x float> %24, i32 0
  %26 = extractelement <2 x float> %24, i32 1
  %27 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !99
  %multiply.10 = fmul float %25, %27
  %28 = zext i32 %linear_index_base to i64
  %29 = getelementptr float, ptr addrspace(1) %arg313, i64 %28
  %30 = getelementptr float, ptr addrspace(1) %arg415, i64 %28
  %31 = zext i32 %8 to i64
  %multiply.71 = fmul float %23, %22
  %multiply.102 = fmul float %27, %26
  %32 = zext i32 %7 to i64
  %33 = getelementptr [262144 x [32 x float]], ptr addrspace(1) %arg19, i64 0, i64 %16, i64 %32
  %34 = getelementptr inbounds float, ptr addrspace(1) %33, i64 16
  %35 = load float, ptr addrspace(1) %34, align 8, !invariant.load !99
  %multiply.73 = fmul float %23, %35
  %36 = load float, ptr addrspace(1) %33, align 8, !invariant.load !99
  %multiply.104 = fmul float %27, %36
  %37 = zext i32 %6 to i64
  %38 = getelementptr [262144 x [32 x float]], ptr addrspace(1) %arg19, i64 0, i64 %16, i64 %37
  %39 = getelementptr inbounds float, ptr addrspace(1) %38, i64 16
  %40 = load float, ptr addrspace(1) %39, align 4, !invariant.load !99
  %multiply.75 = fmul float %23, %40
  %41 = load float, ptr addrspace(1) %38, align 4, !invariant.load !99
  %multiply.106 = fmul float %27, %41
  %42 = insertelement <4 x float> poison, float %multiply.7, i32 0
  %43 = insertelement <4 x float> %42, float %multiply.71, i32 1
  %44 = insertelement <4 x float> %43, float %multiply.73, i32 2
  %45 = insertelement <4 x float> %44, float %multiply.75, i32 3
  store <4 x float> %45, ptr addrspace(1) %29, align 16
  %46 = insertelement <4 x float> poison, float %multiply.10, i32 0
  %47 = insertelement <4 x float> %46, float %multiply.102, i32 1
  %48 = insertelement <4 x float> %47, float %multiply.104, i32 2
  %49 = insertelement <4 x float> %48, float %multiply.106, i32 3
  store <4 x float> %49, ptr addrspace(1) %30, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_15(ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(16777216) %arg1) local_unnamed_addr #0 {
entry:
  %arg150 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg048 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !124
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 28
  %linear_index1 = or i32 %linear_index_base, 1
  %5 = and i32 %linear_index1, 29
  %6 = lshr i32 %1, 3
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = and i32 %linear_index2, 30
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = and i32 %linear_index3, 31
  %9 = and i32 %6, 15
  %10 = lshr i32 %linear_index_base, 9
  %11 = icmp ugt i32 %4, 15
  %12 = add nsw i32 %4, -16
  %.sink32 = select i1 %11, i32 %12, i32 %4
  %.sink = zext i1 %11 to i64
  %13 = zext i32 %10 to i64
  %14 = zext i32 %9 to i64
  %15 = zext i32 %.sink32 to i64
  %16 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr addrspace(1) %arg048, i64 0, i64 %.sink, i64 %13, i64 %14, i64 %15
  %17 = load float, ptr addrspace(1) %16, align 16, !invariant.load !99
  %18 = zext i32 %linear_index_base to i64
  %19 = getelementptr float, ptr addrspace(1) %arg150, i64 %18
  %20 = icmp ugt i32 %5, 15
  %21 = add nsw i32 %5, -16
  %.sink37 = select i1 %20, i32 %21, i32 %5
  %.sink33 = zext i1 %20 to i64
  %22 = zext i32 %.sink37 to i64
  %23 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr addrspace(1) %arg048, i64 0, i64 %.sink33, i64 %13, i64 %14, i64 %22
  %24 = load float, ptr addrspace(1) %23, align 4, !invariant.load !99
  %25 = icmp ugt i32 %7, 15
  %26 = add nsw i32 %7, -16
  %.sink42 = select i1 %25, i32 %26, i32 %7
  %.sink38 = zext i1 %25 to i64
  %27 = zext i32 %.sink42 to i64
  %28 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr addrspace(1) %arg048, i64 0, i64 %.sink38, i64 %13, i64 %14, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 8, !invariant.load !99
  %30 = icmp ugt i32 %8, 15
  %31 = add nsw i32 %8, -16
  %.sink47 = select i1 %30, i32 %31, i32 %8
  %.sink43 = zext i1 %30 to i64
  %32 = zext i32 %.sink47 to i64
  %33 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr addrspace(1) %arg048, i64 0, i64 %.sink43, i64 %13, i64 %14, i64 %32
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !99
  %35 = insertelement <4 x float> poison, float %17, i32 0
  %36 = insertelement <4 x float> %35, float %24, i32 1
  %37 = insertelement <4 x float> %36, float %29, i32 2
  %38 = insertelement <4 x float> %37, float %34, i32 3
  store <4 x float> %38, ptr addrspace(1) %19, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_16(ptr noalias nocapture readonly align 16 dereferenceable(5120) %arg0, ptr noalias nocapture align 128 dereferenceable(5120) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(5120) %arg3, ptr noalias nocapture align 128 dereferenceable(5120) %arg4) local_unnamed_addr #0 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !120
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = icmp ult i32 %linear_index, 1280
  br i1 %3, label %fusion_16.in_bounds-true, label %fusion_16.in_bounds-after

fusion_16.in_bounds-after:                        ; preds = %fusion_16.in_bounds-true, %entry
  ret void

fusion_16.in_bounds-true:                         ; preds = %entry
  %4 = zext i32 %linear_index to i64
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %4
  %6 = load float, ptr addrspace(1) %5, align 4, !invariant.load !99
  %7 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %8 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %4
  %9 = load float, ptr addrspace(1) %8, align 4
  %multiply.7 = fmul float %7, %9
  %subtract.8 = fsub float %6, %multiply.7
  %10 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %4
  %11 = load float, ptr addrspace(1) %10, align 4, !invariant.load !99
  %12 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %4
  %13 = load float, ptr addrspace(1) %12, align 4
  %multiply.9 = fmul float %7, %13
  %subtract.10 = fsub float %11, %multiply.9
  store float %subtract.8, ptr addrspace(1) %12, align 4
  store float %subtract.10, ptr addrspace(1) %8, align 4
  br label %fusion_16.in_bounds-after
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_10(ptr noalias nocapture readonly align 128 dereferenceable(33554432) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(33554432) %arg1) local_unnamed_addr #0 {
entry:
  %arg150 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg048 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !100
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 60
  %linear_index1 = or i32 %linear_index_base, 1
  %5 = and i32 %linear_index1, 61
  %6 = lshr i32 %1, 4
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = and i32 %linear_index2, 62
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = and i32 %linear_index3, 63
  %9 = icmp ugt i32 %4, 31
  %10 = add nsw i32 %4, -32
  %.sink32 = select i1 %9, i32 %10, i32 %4
  %.sink = zext i1 %9 to i64
  %11 = zext i32 %0 to i64
  %12 = zext i32 %6 to i64
  %13 = zext i32 %.sink32 to i64
  %14 = getelementptr inbounds [2 x [8192 x [16 x [32 x float]]]], ptr addrspace(1) %arg048, i64 0, i64 %.sink, i64 %11, i64 %12, i64 %13
  %15 = load float, ptr addrspace(1) %14, align 16, !invariant.load !99
  %16 = zext i32 %linear_index_base to i64
  %17 = getelementptr float, ptr addrspace(1) %arg150, i64 %16
  %18 = icmp ugt i32 %5, 31
  %19 = add nsw i32 %5, -32
  %.sink37 = select i1 %18, i32 %19, i32 %5
  %.sink33 = zext i1 %18 to i64
  %20 = zext i32 %.sink37 to i64
  %21 = getelementptr inbounds [2 x [8192 x [16 x [32 x float]]]], ptr addrspace(1) %arg048, i64 0, i64 %.sink33, i64 %11, i64 %12, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !99
  %23 = icmp ugt i32 %7, 31
  %24 = add nsw i32 %7, -32
  %.sink42 = select i1 %23, i32 %24, i32 %7
  %.sink38 = zext i1 %23 to i64
  %25 = zext i32 %.sink42 to i64
  %26 = getelementptr inbounds [2 x [8192 x [16 x [32 x float]]]], ptr addrspace(1) %arg048, i64 0, i64 %.sink38, i64 %11, i64 %12, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 8, !invariant.load !99
  %28 = icmp ugt i32 %8, 31
  %29 = add nsw i32 %8, -32
  %.sink47 = select i1 %28, i32 %29, i32 %8
  %.sink43 = zext i1 %28 to i64
  %30 = zext i32 %.sink47 to i64
  %31 = getelementptr inbounds [2 x [8192 x [16 x [32 x float]]]], ptr addrspace(1) %arg048, i64 0, i64 %.sink43, i64 %11, i64 %12, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4, !invariant.load !99
  %33 = insertelement <4 x float> poison, float %15, i32 0
  %34 = insertelement <4 x float> %33, float %22, i32 1
  %35 = insertelement <4 x float> %34, float %27, i32 2
  %36 = insertelement <4 x float> %35, float %32, i32 3
  store <4 x float> %36, ptr addrspace(1) %17, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_11(ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg0, ptr noalias nocapture align 128 dereferenceable(32768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg3, ptr noalias nocapture align 128 dereferenceable(32768) %arg4) local_unnamed_addr #0 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !126
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !99
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.7 = fmul float %6, %8
  %subtract.8 = fsub float %5, %multiply.7
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !99
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4
  %multiply.9 = fmul float %6, %12
  %subtract.10 = fsub float %10, %multiply.9
  store float %subtract.8, ptr addrspace(1) %11, align 4
  store float %subtract.10, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_60(ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(838860800) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(838860800) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg4) local_unnamed_addr #2 {
entry:
  %arg494 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg392 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg290 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg188 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg086 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !127
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %thread_id.x = and i32 %1, 31
  %thread_id.y59 = lshr i32 %1, 5
  %2 = lshr i32 %0, 2
  %3 = shl nuw nsw i32 %0, 6
  %tile_origin.2 = and i32 %3, 192
  %4 = shl nuw nsw i32 %thread_id.x, 1
  %5 = mul nuw nsw i32 %2, 25600
  %6 = zext i32 %4 to i64
  %7 = add nuw nsw i32 %thread_id.y59, -32
  %8 = shl nuw nsw i32 %thread_id.y59, 8
  %9 = add i32 %5, %8
  %10 = add i32 %9, %tile_origin.2
  %11 = add i32 %10, %4
  %12 = zext i32 %11 to i64
  %13 = lshr i64 %12, 8
  %14 = shl nuw nsw i64 %13, 4
  %15 = lshr i32 %11, 6
  %16 = trunc i32 %15 to i2
  %17 = zext i2 %16 to i64
  %18 = shl nuw nsw i64 %17, 2
  %19 = add i64 %14, %18
  %20 = shl nuw nsw i64 %13, 10
  %21 = shl nuw nsw i64 %17, 8
  %22 = add i64 %20, %21
  %23 = trunc i32 %1 to i5
  %24 = zext i5 %23 to i64
  %25 = shl nuw nsw i64 %24, 3
  %26 = add i64 %22, %25
  %scevgep107 = getelementptr i8, ptr addrspace(1) %arg290, i64 %26
  %27 = lshr i32 %11, 8
  %28 = lshr i64 %12, 6
  %29 = shl nuw nsw i64 %28, 2
  %30 = add nuw nsw i64 %12, 1
  %31 = lshr i64 %30, 8
  %32 = shl nuw nsw i64 %31, 10
  %33 = add i32 %11, 1
  %34 = lshr i32 %33, 6
  %35 = trunc i32 %34 to i2
  %36 = zext i2 %35 to i64
  %37 = shl nuw nsw i64 %36, 8
  %38 = add i64 %32, %37
  %39 = add i64 %38, %25
  %40 = add i64 %39, 4
  %scevgep120 = getelementptr i8, ptr addrspace(1) %arg290, i64 %40
  %41 = shl nuw nsw i64 %31, 4
  %42 = shl nuw nsw i64 %36, 2
  %43 = add i64 %41, %42
  %44 = lshr i32 %33, 8
  %45 = lshr i64 %30, 6
  %46 = shl nuw nsw i64 %45, 2
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after, %reduction_write_output-true54
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %y_in_tile.loop_body
  %lsr.iv138 = phi i32 [ %34, %entry ], [ %lsr.iv.next139, %y_in_tile.loop_body ]
  %lsr.iv135 = phi i64 [ %46, %entry ], [ %lsr.iv.next136, %y_in_tile.loop_body ]
  %lsr.iv133 = phi i32 [ %44, %entry ], [ %lsr.iv.next134, %y_in_tile.loop_body ]
  %lsr.iv128 = phi i64 [ %43, %entry ], [ %lsr.iv.next129, %y_in_tile.loop_body ]
  %lsr.iv125 = phi i64 [ %31, %entry ], [ %lsr.iv.next126, %y_in_tile.loop_body ]
  %lsr.iv123 = phi i64 [ %30, %entry ], [ %lsr.iv.next124, %y_in_tile.loop_body ]
  %lsr.iv121 = phi ptr addrspace(1) [ %scevgep120, %entry ], [ %scevgep122, %y_in_tile.loop_body ]
  %lsr.iv118 = phi i32 [ %15, %entry ], [ %lsr.iv.next119, %y_in_tile.loop_body ]
  %lsr.iv115 = phi i64 [ %29, %entry ], [ %lsr.iv.next116, %y_in_tile.loop_body ]
  %lsr.iv113 = phi i32 [ %27, %entry ], [ %lsr.iv.next114, %y_in_tile.loop_body ]
  %lsr.iv108 = phi ptr addrspace(1) [ %scevgep107, %entry ], [ %scevgep109, %y_in_tile.loop_body ]
  %lsr.iv105 = phi i64 [ %13, %entry ], [ %lsr.iv.next106, %y_in_tile.loop_body ]
  %lsr.iv103 = phi i64 [ %12, %entry ], [ %lsr.iv.next104, %y_in_tile.loop_body ]
  %lsr.iv101 = phi i64 [ %19, %entry ], [ %lsr.iv.next102, %y_in_tile.loop_body ]
  %lsr.iv = phi i32 [ 0, %entry ], [ %lsr.iv.next, %y_in_tile.loop_body ]
  %partial_reduction_result58.sroa.4.083 = phi float [ 0.000000e+00, %entry ], [ %add.14.i71, %y_in_tile.loop_body ]
  %partial_reduction_result58.sroa.0.082 = phi float [ 0.000000e+00, %entry ], [ %add.14.i, %y_in_tile.loop_body ]
  %47 = trunc i64 %6 to i32
  %lsr142 = trunc i64 %lsr.iv103 to i32
  %lsr140 = trunc i64 %lsr.iv123 to i32
  %48 = udiv i64 %lsr.iv103, 25600
  %49 = mul nuw nsw i64 %48, 1600
  %50 = add i64 %lsr.iv101, %49
  %51 = udiv i64 %lsr.iv105, 100
  %52 = mul nuw nsw i64 %51, 1600
  %53 = sub i64 %50, %52
  %54 = mul nuw nsw i64 %48, 102400
  %55 = mul nuw nsw i64 %51, 102400
  %56 = sub i64 %54, %55
  %scevgep110 = getelementptr i8, ptr addrspace(1) %lsr.iv108, i64 %56
  %57 = udiv i32 %lsr142, 25600
  %58 = mul nuw nsw i32 %57, 100
  %59 = add i32 %27, %58
  %60 = udiv i32 %lsr.iv113, 100
  %61 = mul nuw nsw i32 %60, 100
  %62 = sub i32 %59, %61
  %63 = udiv i64 %lsr.iv123, 25600
  %64 = mul nuw nsw i64 %63, 102400
  %65 = udiv i64 %lsr.iv125, 100
  %66 = mul nuw nsw i64 %65, 102400
  %67 = sub i64 %64, %66
  %scevgep127 = getelementptr i8, ptr addrspace(1) %lsr.iv121, i64 %67
  %68 = mul nuw nsw i64 %63, 1600
  %69 = add i64 %lsr.iv128, %68
  %70 = mul nuw nsw i64 %65, 1600
  %71 = sub i64 %69, %70
  %72 = udiv i32 %lsr140, 25600
  %73 = mul nuw nsw i32 %72, 100
  %74 = add i32 %44, %73
  %75 = udiv i32 %lsr.iv133, 100
  %76 = mul nuw nsw i32 %75, 100
  %77 = sub i32 %74, %76
  %78 = and i32 %lsr.iv118, 3
  %79 = zext i32 %78 to i64
  %scevgep = getelementptr i8, ptr addrspace(1) %arg188, i64 %53
  %Arg_1.23 = load float, ptr addrspace(1) %scevgep, align 4, !invariant.load !99
  %Arg_2.34 = load float, ptr addrspace(1) %scevgep110, align 8, !invariant.load !99
  %multiply.9 = fmul float %Arg_1.23, %Arg_2.34
  %add.14.i = fadd float %partial_reduction_result58.sroa.0.082, %multiply.9
  %80 = shl nuw nsw i32 %78, 6
  %81 = or i32 %80, %47
  %82 = add i32 %lsr.iv, %62
  %83 = udiv i32 %82, 100
  %scevgep117 = getelementptr i8, ptr addrspace(1) %arg188, i64 %lsr.iv115
  %Arg_1.26 = load float, ptr addrspace(1) %scevgep117, align 4, !invariant.load !99
  %84 = zext i32 %83 to i64
  %Arg_0.1 = getelementptr inbounds [8192 x [1 x [4 x [64 x float]]]], ptr addrspace(1) %arg086, i64 0, i64 %84, i64 0, i64 %79, i64 %6
  %Arg_0.17 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !99
  %multiply.7 = fmul float %Arg_1.26, %Arg_0.17
  %85 = zext i32 %82 to i64
  %86 = zext i32 %81 to i64
  %87 = getelementptr inbounds [819200 x [256 x float]], ptr addrspace(1) %arg392, i64 0, i64 %85, i64 %86
  store float %multiply.7, ptr addrspace(1) %87, align 8
  %88 = and i32 %lsr.iv138, 3
  %89 = zext i32 %88 to i64
  %scevgep130 = getelementptr i8, ptr addrspace(1) %arg188, i64 %71
  %Arg_1.212 = load float, ptr addrspace(1) %scevgep130, align 4, !invariant.load !99
  %Arg_2.314 = load float, ptr addrspace(1) %scevgep127, align 4, !invariant.load !99
  %multiply.915 = fmul float %Arg_1.212, %Arg_2.314
  %add.14.i71 = fadd float %partial_reduction_result58.sroa.4.083, %multiply.915
  %90 = shl nuw nsw i32 %88, 6
  %91 = add i32 %lsr.iv, %77
  %92 = udiv i32 %91, 100
  %scevgep137 = getelementptr i8, ptr addrspace(1) %arg188, i64 %lsr.iv135
  %Arg_1.218 = load float, ptr addrspace(1) %scevgep137, align 4, !invariant.load !99
  %93 = zext i32 %92 to i64
  %94 = getelementptr [8192 x [1 x [4 x [64 x float]]]], ptr addrspace(1) %arg086, i64 0, i64 %93, i64 0, i64 %89, i64 %6
  %Arg_0.11997 = getelementptr inbounds float, ptr addrspace(1) %94, i64 1
  %Arg_0.120 = load float, ptr addrspace(1) %Arg_0.11997, align 4, !invariant.load !99
  %multiply.721 = fmul float %Arg_1.218, %Arg_0.120
  %95 = zext i32 %91 to i64
  %96 = zext i32 %90 to i64
  %97 = add i64 %96, %6
  %98 = getelementptr [819200 x [256 x float]], ptr addrspace(1) %arg392, i64 0, i64 %95, i64 %97
  %99 = getelementptr inbounds float, ptr addrspace(1) %98, i64 1
  store float %multiply.721, ptr addrspace(1) %99, align 4
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 32
  %100 = add i32 %7, %lsr.iv.next
  %lsr.iv.next102 = add nuw nsw i64 %lsr.iv101, 512
  %lsr.iv.next104 = add nuw nsw i64 %lsr.iv103, 8192
  %lsr.iv.next106 = add nuw nsw i64 %lsr.iv105, 32
  %scevgep109 = getelementptr i8, ptr addrspace(1) %lsr.iv108, i64 32768
  %lsr.iv.next114 = add nuw nsw i32 %lsr.iv113, 32
  %lsr.iv.next116 = add nuw nsw i64 %lsr.iv115, 512
  %lsr.iv.next119 = add nuw nsw i32 %lsr.iv118, 128
  %scevgep122 = getelementptr i8, ptr addrspace(1) %lsr.iv121, i64 32768
  %lsr.iv.next124 = add nuw nsw i64 %lsr.iv123, 8192
  %lsr.iv.next126 = add nuw nsw i64 %lsr.iv125, 32
  %lsr.iv.next129 = add nuw nsw i64 %lsr.iv128, 512
  %lsr.iv.next134 = add nuw nsw i32 %lsr.iv133, 32
  %lsr.iv.next136 = add nuw nsw i64 %lsr.iv135, 512
  %lsr.iv.next139 = add nuw nsw i32 %lsr.iv138, 128
  %101 = icmp ugt i32 %100, 67
  br i1 %101, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %102 = zext i32 %thread_id.x to i64
  %103 = zext i32 %thread_id.y59 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache30, i64 0, i64 0, i64 0, i64 %102, i64 %103
  store float %add.14.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache30, i64 0, i64 0, i64 0, i64 %103, i64 %102
  %partial_reduction_result22 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %104 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 16, i32 31)
  %add.14.i72 = fadd float %partial_reduction_result22, %104
  %105 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i72, i32 8, i32 31)
  %add.14.i73 = fadd float %add.14.i72, %105
  %106 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i73, i32 4, i32 31)
  %add.14.i74 = fadd float %add.14.i73, %106
  %107 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i74, i32 2, i32 31)
  %add.14.i75 = fadd float %add.14.i74, %107
  %108 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i75, i32 1, i32 31)
  %add.14.i76 = fadd float %add.14.i75, %108
  store float %add.14.i76, ptr addrspace(3) %shmem_transposed_addr, align 4
  %109 = shl nuw nsw i32 %thread_id.y59, 1
  %110 = icmp eq i32 %thread_id.x, 0
  %111 = zext i32 %2 to i64
  %112 = and i32 %0, 3
  %113 = zext i32 %112 to i64
  %114 = zext i32 %109 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr addrspace(1) %arg494, i64 0, i64 %111, i64 %113, i64 %114
  br i1 %110, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %115 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address3698 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.14.i71, ptr addrspace(3) %shmem_output_address3698, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr3899 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result40 = load float, ptr addrspace(3) %shmem_transposed_addr3899, align 4
  %116 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 16, i32 31)
  %add.14.i77 = fadd float %partial_reduction_result40, %116
  %117 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i77, i32 8, i32 31)
  %add.14.i78 = fadd float %add.14.i77, %117
  %118 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i78, i32 4, i32 31)
  %add.14.i79 = fadd float %add.14.i78, %118
  %119 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i79, i32 2, i32 31)
  %add.14.i80 = fadd float %add.14.i79, %119
  %120 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i80, i32 1, i32 31)
  %add.14.i81 = fadd float %add.14.i80, %120
  store float %add.14.i81, ptr addrspace(3) %shmem_transposed_addr3899, align 4
  br i1 %115, label %reduction_write_output-true54, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.14.i76, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true54:                    ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.14.i81, ptr addrspace(1) %sunkaddr, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_59(ptr noalias nocapture readonly align 16 dereferenceable(204800) %arg0, ptr noalias nocapture align 128 dereferenceable(204800) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !128
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !99
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_56(ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1056768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(65536) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !125
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !107
  %linear_index = or i32 %1, %2
  %3 = lshr i32 %linear_index, 8
  %4 = and i32 %2, 255
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !99
  %8 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !99
  %9 = zext i32 %4 to i64
  %10 = zext i32 %3 to i64
  %11 = getelementptr [1032 x [256 x float]], ptr addrspace(1) %arg13, i64 0, i64 %10, i64 %9
  %12 = getelementptr inbounds float, ptr addrspace(1) %11, i64 247808
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !99
  %multiply.6 = fmul float %8, %13
  %subtract.7 = fsub float %7, %multiply.6
  %14 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %5
  store float %subtract.7, ptr addrspace(1) %14, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_57(ptr noalias nocapture readonly align 16 dereferenceable(991232) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1056768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(991232) %arg3) local_unnamed_addr #0 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !129
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
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
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg07, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !99
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !99
  %17 = zext i32 %4 to i64
  %18 = zext i32 %8 to i64
  %19 = getelementptr inbounds [1032 x [256 x float]], ptr addrspace(1) %arg19, i64 0, i64 %17, i64 %18
  %20 = load <2 x float>, ptr addrspace(1) %19, align 16, !invariant.load !99
  %21 = extractelement <2 x float> %20, i32 0
  %22 = extractelement <2 x float> %20, i32 1
  %multiply.6 = fmul float %16, %21
  %subtract.7 = fsub float %12, %multiply.6
  %23 = getelementptr float, ptr addrspace(1) %arg313, i64 %9
  %24 = zext i32 %7 to i64
  %multiply.61 = fmul float %16, %22
  %subtract.72 = fsub float %13, %multiply.61
  %25 = zext i32 %6 to i64
  %26 = getelementptr inbounds [1032 x [256 x float]], ptr addrspace(1) %arg19, i64 0, i64 %17, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 8, !invariant.load !99
  %multiply.63 = fmul float %16, %27
  %subtract.74 = fsub float %14, %multiply.63
  %28 = zext i32 %5 to i64
  %29 = getelementptr inbounds [1032 x [256 x float]], ptr addrspace(1) %arg19, i64 0, i64 %17, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4, !invariant.load !99
  %multiply.65 = fmul float %16, %30
  %subtract.76 = fsub float %15, %multiply.65
  %31 = insertelement <4 x float> poison, float %subtract.7, i32 0
  %32 = insertelement <4 x float> %31, float %subtract.72, i32 1
  %33 = insertelement <4 x float> %32, float %subtract.74, i32 2
  %34 = insertelement <4 x float> %33, float %subtract.76, i32 3
  store <4 x float> %34, ptr addrspace(1) %23, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_54(ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(33816576) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg5) local_unnamed_addr #0 {
entry:
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !119
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 6
  %5 = and i32 %linear_index3, 63
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = and i32 %linear_index2, 62
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 61
  %8 = and i32 %3, 60
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg013, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !99
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg421, align 16, !invariant.load !99
  %17 = zext i32 %4 to i64
  %18 = zext i32 %8 to i64
  %19 = getelementptr [8192 x [1032 x float]], ptr addrspace(1) %arg319, i64 0, i64 %17, i64 %18
  %20 = getelementptr inbounds float, ptr addrspace(1) %19, i64 968
  %21 = load <2 x float>, ptr addrspace(1) %20, align 16, !invariant.load !99
  %22 = extractelement <2 x float> %21, i32 0
  %23 = extractelement <2 x float> %21, i32 1
  %24 = getelementptr float, ptr addrspace(1) %arg217, i64 %9
  %25 = load <4 x float>, ptr addrspace(1) %24, align 16, !invariant.load !99
  %26 = extractelement <4 x float> %25, i32 0
  %27 = extractelement <4 x float> %25, i32 1
  %28 = extractelement <4 x float> %25, i32 2
  %29 = extractelement <4 x float> %25, i32 3
  %add.10 = fadd float %22, %26
  %30 = getelementptr float, ptr addrspace(1) %arg115, i64 %9
  %31 = load <4 x float>, ptr addrspace(1) %30, align 16, !invariant.load !99
  %32 = extractelement <4 x float> %31, i32 0
  %33 = extractelement <4 x float> %31, i32 1
  %34 = extractelement <4 x float> %31, i32 2
  %35 = extractelement <4 x float> %31, i32 3
  %add.11 = fadd float %add.10, %32
  %multiply.12 = fmul float %16, %add.11
  %subtract.13 = fsub float %12, %multiply.12
  %36 = getelementptr float, ptr addrspace(1) %arg523, i64 %9
  %37 = zext i32 %7 to i64
  %38 = getelementptr [8192 x [1032 x float]], ptr addrspace(1) %arg319, i64 0, i64 %17, i64 %37
  %add.101 = fadd float %23, %27
  %add.112 = fadd float %add.101, %33
  %multiply.123 = fmul float %16, %add.112
  %subtract.134 = fsub float %13, %multiply.123
  %39 = zext i32 %6 to i64
  %40 = getelementptr [8192 x [1032 x float]], ptr addrspace(1) %arg319, i64 0, i64 %17, i64 %39
  %41 = getelementptr inbounds float, ptr addrspace(1) %40, i64 968
  %42 = load float, ptr addrspace(1) %41, align 8, !invariant.load !99
  %add.105 = fadd float %42, %28
  %add.116 = fadd float %add.105, %34
  %multiply.127 = fmul float %16, %add.116
  %subtract.138 = fsub float %14, %multiply.127
  %43 = zext i32 %5 to i64
  %44 = getelementptr [8192 x [1032 x float]], ptr addrspace(1) %arg319, i64 0, i64 %17, i64 %43
  %45 = getelementptr inbounds float, ptr addrspace(1) %44, i64 968
  %46 = load float, ptr addrspace(1) %45, align 4, !invariant.load !99
  %add.109 = fadd float %46, %29
  %add.1110 = fadd float %add.109, %35
  %multiply.1211 = fmul float %16, %add.1110
  %subtract.1312 = fsub float %15, %multiply.1211
  %47 = insertelement <4 x float> poison, float %subtract.13, i32 0
  %48 = insertelement <4 x float> %47, float %subtract.134, i32 1
  %49 = insertelement <4 x float> %48, float %subtract.138, i32 2
  %50 = insertelement <4 x float> %49, float %subtract.1312, i32 3
  store <4 x float> %50, ptr addrspace(1) %36, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion(ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(655360000) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(550502400) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(20971520) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(88080384) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg15, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg19, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg20, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg21, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg22, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg23, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg24) local_unnamed_addr #0 {
entry:
  %arg24286 = addrspacecast ptr %arg24 to ptr addrspace(1)
  %arg23284 = addrspacecast ptr %arg23 to ptr addrspace(1)
  %arg22282 = addrspacecast ptr %arg22 to ptr addrspace(1)
  %arg21280 = addrspacecast ptr %arg21 to ptr addrspace(1)
  %arg20278 = addrspacecast ptr %arg20 to ptr addrspace(1)
  %arg19276 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18274 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17272 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16270 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15268 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14266 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13264 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12262 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11260 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10258 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9256 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8254 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7252 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6250 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5248 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4246 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3244 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2242 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1240 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0238 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !130
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 4
  %5 = lshr i32 %linear_index_base, 3
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 800
  %linear_index1 = or i32 %linear_index_base, 1
  %8 = and i32 %linear_index1, 5
  %linear_index2 = or i32 %linear_index_base, 2
  %9 = and i32 %linear_index2, 6
  %linear_index3 = or i32 %linear_index_base, 3
  %10 = and i32 %linear_index3, 7
  %11 = zext i32 %linear_index_base to i64
  %12 = getelementptr float, ptr addrspace(1) %arg0238, i64 %11
  %13 = load float, ptr addrspace(1) %12, align 16, !invariant.load !99
  %14 = load float, ptr addrspace(1) %arg1240, align 16, !invariant.load !99
  %15 = mul nuw nsw i32 %7, 100
  %16 = add nuw nsw i32 %6, %15
  %17 = zext i32 %16 to i64
  %18 = zext i32 %4 to i64
  %19 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg2242, i64 0, i64 %17, i64 %18
  %20 = getelementptr inbounds float, ptr addrspace(1) %19, i64 128
  %21 = load float, ptr addrspace(1) %20, align 16, !invariant.load !99
  %22 = icmp ult i32 %6, 16
  br i1 %22, label %concatenate.pivot.0., label %concatenate.pivot.16.1

concatenate.pivot.0.:                             ; preds = %entry
  %23 = trunc i64 %17 to i32
  %24 = mul i32 %7, -84
  %25 = add i32 %23, %24
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %26, i64 %18
  %28 = load float, ptr addrspace(1) %27, align 16, !invariant.load !99
  %29 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %26, i64 %18
  %30 = getelementptr inbounds float, ptr addrspace(1) %29, i64 128
  %31 = load float, ptr addrspace(1) %30, align 16, !invariant.load !99
  %add.24 = fadd float %28, %31
  %32 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %18
  %33 = getelementptr inbounds float, ptr addrspace(1) %32, i64 128
  %34 = load float, ptr addrspace(1) %33, align 16, !invariant.load !99
  %add.28 = fadd float %add.24, %34
  br label %concatenate.30.merge

concatenate.pivot.16.1:                           ; preds = %entry
  %35 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %18
  %36 = getelementptr inbounds float, ptr addrspace(1) %35, i64 128
  %37 = load float, ptr addrspace(1) %36, align 16, !invariant.load !99
  br label %concatenate.30.merge

concatenate.30.merge:                             ; preds = %concatenate.pivot.16.1, %concatenate.pivot.0.
  %38 = phi float [ %add.28, %concatenate.pivot.0. ], [ %37, %concatenate.pivot.16.1 ]
  %39 = icmp ult i32 %6, 16
  %add.32 = fadd float %21, %38
  %multiply.33 = fmul float %14, %add.32
  %subtract.34 = fsub float %13, %multiply.33
  %40 = getelementptr float, ptr addrspace(1) %arg6250, i64 %11
  %41 = load float, ptr addrspace(1) %40, align 16, !invariant.load !99
  br i1 %39, label %concatenate.pivot.0.8, label %concatenate.pivot.16.9

concatenate.pivot.0.8:                            ; preds = %concatenate.30.merge
  %42 = trunc i64 %17 to i32
  %43 = mul i32 %7, -84
  %44 = add i32 %42, %43
  %45 = zext i32 %44 to i64
  %46 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %45, i64 %18
  %47 = getelementptr inbounds float, ptr addrspace(1) %46, i64 16
  %48 = load float, ptr addrspace(1) %47, align 16, !invariant.load !99
  %49 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %45, i64 %18
  %50 = getelementptr inbounds float, ptr addrspace(1) %49, i64 144
  %51 = load float, ptr addrspace(1) %50, align 16, !invariant.load !99
  %add.244 = fadd float %48, %51
  %52 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %18
  %53 = getelementptr inbounds float, ptr addrspace(1) %52, i64 144
  %54 = load float, ptr addrspace(1) %53, align 16, !invariant.load !99
  %add.285 = fadd float %add.244, %54
  br label %concatenate.30.merge2

concatenate.pivot.16.9:                           ; preds = %concatenate.30.merge
  %55 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %18
  %56 = getelementptr inbounds float, ptr addrspace(1) %55, i64 144
  %57 = load float, ptr addrspace(1) %56, align 16, !invariant.load !99
  br label %concatenate.30.merge2

concatenate.30.merge2:                            ; preds = %concatenate.pivot.16.9, %concatenate.pivot.0.8
  %58 = phi float [ %add.285, %concatenate.pivot.0.8 ], [ %57, %concatenate.pivot.16.9 ]
  %59 = icmp ult i32 %6, 16
  %multiply.36 = fmul float %14, %58
  %subtract.37 = fsub float %41, %multiply.36
  %60 = getelementptr float, ptr addrspace(1) %arg7252, i64 %11
  %61 = load float, ptr addrspace(1) %60, align 16, !invariant.load !99
  br i1 %59, label %concatenate.pivot.0.16, label %concatenate.pivot.16.17

concatenate.pivot.0.16:                           ; preds = %concatenate.30.merge2
  %62 = trunc i64 %17 to i32
  %63 = mul i32 %7, -84
  %64 = add i32 %62, %63
  %65 = zext i32 %64 to i64
  %66 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %65, i64 %18
  %67 = getelementptr inbounds float, ptr addrspace(1) %66, i64 8
  %68 = load float, ptr addrspace(1) %67, align 16, !invariant.load !99
  %69 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %65, i64 %18
  %70 = getelementptr inbounds float, ptr addrspace(1) %69, i64 136
  %71 = load float, ptr addrspace(1) %70, align 16, !invariant.load !99
  %add.2412 = fadd float %68, %71
  %72 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %18
  %73 = getelementptr inbounds float, ptr addrspace(1) %72, i64 136
  %74 = load float, ptr addrspace(1) %73, align 16, !invariant.load !99
  %add.2813 = fadd float %add.2412, %74
  br label %concatenate.30.merge10

concatenate.pivot.16.17:                          ; preds = %concatenate.30.merge2
  %75 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %18
  %76 = getelementptr inbounds float, ptr addrspace(1) %75, i64 136
  %77 = load float, ptr addrspace(1) %76, align 16, !invariant.load !99
  br label %concatenate.30.merge10

concatenate.30.merge10:                           ; preds = %concatenate.pivot.16.17, %concatenate.pivot.0.16
  %78 = phi float [ %add.2813, %concatenate.pivot.0.16 ], [ %77, %concatenate.pivot.16.17 ]
  %79 = icmp ult i32 %6, 16
  %multiply.39 = fmul float %14, %78
  %subtract.40 = fsub float %61, %multiply.39
  %80 = getelementptr float, ptr addrspace(1) %arg8254, i64 %11
  %81 = load float, ptr addrspace(1) %80, align 16, !invariant.load !99
  br i1 %79, label %concatenate.pivot.0.24, label %concatenate.pivot.16.25

concatenate.pivot.0.24:                           ; preds = %concatenate.30.merge10
  %82 = trunc i64 %17 to i32
  %83 = mul i32 %7, -84
  %84 = add i32 %82, %83
  %85 = zext i32 %84 to i64
  %86 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %85, i64 %18
  %87 = getelementptr inbounds float, ptr addrspace(1) %86, i64 24
  %88 = load float, ptr addrspace(1) %87, align 16, !invariant.load !99
  %89 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %85, i64 %18
  %90 = getelementptr inbounds float, ptr addrspace(1) %89, i64 152
  %91 = load float, ptr addrspace(1) %90, align 16, !invariant.load !99
  %add.2420 = fadd float %88, %91
  %92 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %18
  %93 = getelementptr inbounds float, ptr addrspace(1) %92, i64 152
  %94 = load float, ptr addrspace(1) %93, align 16, !invariant.load !99
  %add.2821 = fadd float %add.2420, %94
  br label %concatenate.30.merge18

concatenate.pivot.16.25:                          ; preds = %concatenate.30.merge10
  %95 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %18
  %96 = getelementptr inbounds float, ptr addrspace(1) %95, i64 152
  %97 = load float, ptr addrspace(1) %96, align 16, !invariant.load !99
  br label %concatenate.30.merge18

concatenate.30.merge18:                           ; preds = %concatenate.pivot.16.25, %concatenate.pivot.0.24
  %98 = phi float [ %add.2821, %concatenate.pivot.0.24 ], [ %97, %concatenate.pivot.16.25 ]
  %99 = icmp ult i32 %6, 16
  %multiply.42 = fmul float %14, %98
  %subtract.43 = fsub float %81, %multiply.42
  %100 = getelementptr float, ptr addrspace(1) %arg9256, i64 %11
  %101 = load float, ptr addrspace(1) %100, align 16, !invariant.load !99
  br i1 %99, label %concatenate.pivot.0.32, label %concatenate.pivot.16.33

concatenate.pivot.0.32:                           ; preds = %concatenate.30.merge18
  %102 = shl nuw nsw i32 %7, 4
  %103 = add nuw nsw i32 %6, %102
  %104 = zext i32 %103 to i64
  %105 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %104, i64 %18
  %106 = getelementptr inbounds float, ptr addrspace(1) %105, i64 32
  %107 = load float, ptr addrspace(1) %106, align 16, !invariant.load !99
  %108 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %104, i64 %18
  %109 = getelementptr inbounds float, ptr addrspace(1) %108, i64 160
  %110 = load float, ptr addrspace(1) %109, align 16, !invariant.load !99
  %add.2428 = fadd float %107, %110
  %111 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %18
  %112 = getelementptr inbounds float, ptr addrspace(1) %111, i64 160
  %113 = load float, ptr addrspace(1) %112, align 16, !invariant.load !99
  %add.2829 = fadd float %add.2428, %113
  br label %concatenate.30.merge26

concatenate.pivot.16.33:                          ; preds = %concatenate.30.merge18
  %114 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %18
  %115 = getelementptr inbounds float, ptr addrspace(1) %114, i64 160
  %116 = load float, ptr addrspace(1) %115, align 16, !invariant.load !99
  br label %concatenate.30.merge26

concatenate.30.merge26:                           ; preds = %concatenate.pivot.16.33, %concatenate.pivot.0.32
  %117 = phi float [ %add.2829, %concatenate.pivot.0.32 ], [ %116, %concatenate.pivot.16.33 ]
  %118 = icmp ult i32 %6, 16
  %multiply.45 = fmul float %14, %117
  %subtract.46 = fsub float %101, %multiply.45
  %119 = getelementptr float, ptr addrspace(1) %arg10258, i64 %11
  %120 = load float, ptr addrspace(1) %119, align 16, !invariant.load !99
  %121 = getelementptr float, ptr addrspace(1) %arg11260, i64 %11
  %122 = load float, ptr addrspace(1) %121, align 16, !invariant.load !99
  %multiply.47 = fmul float %14, %122
  %subtract.48 = fsub float %120, %multiply.47
  %123 = getelementptr float, ptr addrspace(1) %arg12262, i64 %11
  %124 = load float, ptr addrspace(1) %123, align 16, !invariant.load !99
  %125 = getelementptr float, ptr addrspace(1) %arg13264, i64 %11
  %126 = load float, ptr addrspace(1) %125, align 16, !invariant.load !99
  %multiply.49 = fmul float %14, %126
  %subtract.50 = fsub float %124, %multiply.49
  %127 = getelementptr float, ptr addrspace(1) %arg14266, i64 %11
  %128 = load float, ptr addrspace(1) %127, align 16, !invariant.load !99
  %129 = getelementptr float, ptr addrspace(1) %arg15268, i64 %11
  %130 = load float, ptr addrspace(1) %129, align 16, !invariant.load !99
  %131 = getelementptr float, ptr addrspace(1) %arg16270, i64 %11
  %132 = load float, ptr addrspace(1) %131, align 16, !invariant.load !99
  %add.51 = fadd float %130, %132
  %multiply.52 = fmul float %14, %add.51
  %subtract.53 = fsub float %128, %multiply.52
  %133 = getelementptr float, ptr addrspace(1) %arg17272, i64 %11
  store float %subtract.34, ptr addrspace(1) %133, align 16
  %134 = getelementptr float, ptr addrspace(1) %arg18274, i64 %11
  store float %subtract.37, ptr addrspace(1) %134, align 16
  %135 = getelementptr float, ptr addrspace(1) %arg19276, i64 %11
  store float %subtract.40, ptr addrspace(1) %135, align 16
  %136 = getelementptr float, ptr addrspace(1) %arg20278, i64 %11
  store float %subtract.43, ptr addrspace(1) %136, align 16
  %137 = getelementptr float, ptr addrspace(1) %arg21280, i64 %11
  store float %subtract.46, ptr addrspace(1) %137, align 16
  %138 = getelementptr float, ptr addrspace(1) %arg22282, i64 %11
  store float %subtract.48, ptr addrspace(1) %138, align 16
  %139 = getelementptr float, ptr addrspace(1) %arg23284, i64 %11
  store float %subtract.50, ptr addrspace(1) %139, align 16
  %140 = getelementptr float, ptr addrspace(1) %arg24286, i64 %11
  store float %subtract.53, ptr addrspace(1) %140, align 16
  %141 = getelementptr inbounds float, ptr addrspace(1) %12, i64 1
  %142 = load float, ptr addrspace(1) %141, align 4, !invariant.load !99
  %143 = zext i32 %8 to i64
  %144 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg2242, i64 0, i64 %17, i64 %143
  %145 = getelementptr inbounds float, ptr addrspace(1) %144, i64 128
  %146 = load float, ptr addrspace(1) %145, align 4, !invariant.load !99
  br i1 %118, label %concatenate.pivot.0.40, label %concatenate.pivot.16.41

concatenate.pivot.0.40:                           ; preds = %concatenate.30.merge26
  %147 = shl nuw nsw i32 %7, 4
  %148 = add nuw nsw i32 %6, %147
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %149, i64 %143
  %151 = load float, ptr addrspace(1) %150, align 4, !invariant.load !99
  %152 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %149, i64 %143
  %153 = getelementptr inbounds float, ptr addrspace(1) %152, i64 128
  %154 = load float, ptr addrspace(1) %153, align 4, !invariant.load !99
  %add.2436 = fadd float %151, %154
  %155 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %143
  %156 = getelementptr inbounds float, ptr addrspace(1) %155, i64 128
  %157 = load float, ptr addrspace(1) %156, align 4, !invariant.load !99
  %add.2837 = fadd float %add.2436, %157
  br label %concatenate.30.merge34

concatenate.pivot.16.41:                          ; preds = %concatenate.30.merge26
  %158 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %143
  %159 = getelementptr inbounds float, ptr addrspace(1) %158, i64 128
  %160 = load float, ptr addrspace(1) %159, align 4, !invariant.load !99
  br label %concatenate.30.merge34

concatenate.30.merge34:                           ; preds = %concatenate.pivot.16.41, %concatenate.pivot.0.40
  %161 = phi float [ %add.2837, %concatenate.pivot.0.40 ], [ %160, %concatenate.pivot.16.41 ]
  %162 = icmp ult i32 %6, 16
  %add.3242 = fadd float %146, %161
  %multiply.3343 = fmul float %14, %add.3242
  %subtract.3444 = fsub float %142, %multiply.3343
  %163 = getelementptr inbounds float, ptr addrspace(1) %40, i64 1
  %164 = load float, ptr addrspace(1) %163, align 4, !invariant.load !99
  br i1 %162, label %concatenate.pivot.0.51, label %concatenate.pivot.16.52

concatenate.pivot.0.51:                           ; preds = %concatenate.30.merge34
  %165 = shl nuw nsw i32 %7, 4
  %166 = add nuw nsw i32 %6, %165
  %167 = zext i32 %166 to i64
  %168 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %167, i64 %143
  %169 = getelementptr inbounds float, ptr addrspace(1) %168, i64 16
  %170 = load float, ptr addrspace(1) %169, align 4, !invariant.load !99
  %171 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %167, i64 %143
  %172 = getelementptr inbounds float, ptr addrspace(1) %171, i64 144
  %173 = load float, ptr addrspace(1) %172, align 4, !invariant.load !99
  %add.2447 = fadd float %170, %173
  %174 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %143
  %175 = getelementptr inbounds float, ptr addrspace(1) %174, i64 144
  %176 = load float, ptr addrspace(1) %175, align 4, !invariant.load !99
  %add.2848 = fadd float %add.2447, %176
  br label %concatenate.30.merge45

concatenate.pivot.16.52:                          ; preds = %concatenate.30.merge34
  %177 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %143
  %178 = getelementptr inbounds float, ptr addrspace(1) %177, i64 144
  %179 = load float, ptr addrspace(1) %178, align 4, !invariant.load !99
  br label %concatenate.30.merge45

concatenate.30.merge45:                           ; preds = %concatenate.pivot.16.52, %concatenate.pivot.0.51
  %180 = phi float [ %add.2848, %concatenate.pivot.0.51 ], [ %179, %concatenate.pivot.16.52 ]
  %181 = icmp ult i32 %6, 16
  %multiply.3653 = fmul float %14, %180
  %subtract.3754 = fsub float %164, %multiply.3653
  %182 = getelementptr inbounds float, ptr addrspace(1) %60, i64 1
  %183 = load float, ptr addrspace(1) %182, align 4, !invariant.load !99
  br i1 %181, label %concatenate.pivot.0.61, label %concatenate.pivot.16.62

concatenate.pivot.0.61:                           ; preds = %concatenate.30.merge45
  %184 = shl nuw nsw i32 %7, 4
  %185 = add nuw nsw i32 %6, %184
  %186 = zext i32 %185 to i64
  %187 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %186, i64 %143
  %188 = getelementptr inbounds float, ptr addrspace(1) %187, i64 8
  %189 = load float, ptr addrspace(1) %188, align 4, !invariant.load !99
  %190 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %186, i64 %143
  %191 = getelementptr inbounds float, ptr addrspace(1) %190, i64 136
  %192 = load float, ptr addrspace(1) %191, align 4, !invariant.load !99
  %add.2457 = fadd float %189, %192
  %193 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %143
  %194 = getelementptr inbounds float, ptr addrspace(1) %193, i64 136
  %195 = load float, ptr addrspace(1) %194, align 4, !invariant.load !99
  %add.2858 = fadd float %add.2457, %195
  br label %concatenate.30.merge55

concatenate.pivot.16.62:                          ; preds = %concatenate.30.merge45
  %196 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %143
  %197 = getelementptr inbounds float, ptr addrspace(1) %196, i64 136
  %198 = load float, ptr addrspace(1) %197, align 4, !invariant.load !99
  br label %concatenate.30.merge55

concatenate.30.merge55:                           ; preds = %concatenate.pivot.16.62, %concatenate.pivot.0.61
  %199 = phi float [ %add.2858, %concatenate.pivot.0.61 ], [ %198, %concatenate.pivot.16.62 ]
  %200 = icmp ult i32 %6, 16
  %multiply.3963 = fmul float %14, %199
  %subtract.4064 = fsub float %183, %multiply.3963
  %201 = getelementptr inbounds float, ptr addrspace(1) %80, i64 1
  %202 = load float, ptr addrspace(1) %201, align 4, !invariant.load !99
  br i1 %200, label %concatenate.pivot.0.71, label %concatenate.pivot.16.72

concatenate.pivot.0.71:                           ; preds = %concatenate.30.merge55
  %203 = shl nuw nsw i32 %7, 4
  %204 = add nuw nsw i32 %6, %203
  %205 = zext i32 %204 to i64
  %206 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %205, i64 %143
  %207 = getelementptr inbounds float, ptr addrspace(1) %206, i64 24
  %208 = load float, ptr addrspace(1) %207, align 4, !invariant.load !99
  %209 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %205, i64 %143
  %210 = getelementptr inbounds float, ptr addrspace(1) %209, i64 152
  %211 = load float, ptr addrspace(1) %210, align 4, !invariant.load !99
  %add.2467 = fadd float %208, %211
  %212 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %143
  %213 = getelementptr inbounds float, ptr addrspace(1) %212, i64 152
  %214 = load float, ptr addrspace(1) %213, align 4, !invariant.load !99
  %add.2868 = fadd float %add.2467, %214
  br label %concatenate.30.merge65

concatenate.pivot.16.72:                          ; preds = %concatenate.30.merge55
  %215 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %143
  %216 = getelementptr inbounds float, ptr addrspace(1) %215, i64 152
  %217 = load float, ptr addrspace(1) %216, align 4, !invariant.load !99
  br label %concatenate.30.merge65

concatenate.30.merge65:                           ; preds = %concatenate.pivot.16.72, %concatenate.pivot.0.71
  %218 = phi float [ %add.2868, %concatenate.pivot.0.71 ], [ %217, %concatenate.pivot.16.72 ]
  %219 = icmp ult i32 %6, 16
  %multiply.4273 = fmul float %14, %218
  %subtract.4374 = fsub float %202, %multiply.4273
  %220 = getelementptr inbounds float, ptr addrspace(1) %100, i64 1
  %221 = load float, ptr addrspace(1) %220, align 4, !invariant.load !99
  br i1 %219, label %concatenate.pivot.0.81, label %concatenate.pivot.16.82

concatenate.pivot.0.81:                           ; preds = %concatenate.30.merge65
  %222 = shl nuw nsw i32 %7, 4
  %223 = add nuw nsw i32 %6, %222
  %224 = zext i32 %223 to i64
  %225 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %224, i64 %143
  %226 = getelementptr inbounds float, ptr addrspace(1) %225, i64 32
  %227 = load float, ptr addrspace(1) %226, align 4, !invariant.load !99
  %228 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %224, i64 %143
  %229 = getelementptr inbounds float, ptr addrspace(1) %228, i64 160
  %230 = load float, ptr addrspace(1) %229, align 4, !invariant.load !99
  %add.2477 = fadd float %227, %230
  %231 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %143
  %232 = getelementptr inbounds float, ptr addrspace(1) %231, i64 160
  %233 = load float, ptr addrspace(1) %232, align 4, !invariant.load !99
  %add.2878 = fadd float %add.2477, %233
  br label %concatenate.30.merge75

concatenate.pivot.16.82:                          ; preds = %concatenate.30.merge65
  %234 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %143
  %235 = getelementptr inbounds float, ptr addrspace(1) %234, i64 160
  %236 = load float, ptr addrspace(1) %235, align 4, !invariant.load !99
  br label %concatenate.30.merge75

concatenate.30.merge75:                           ; preds = %concatenate.pivot.16.82, %concatenate.pivot.0.81
  %237 = phi float [ %add.2878, %concatenate.pivot.0.81 ], [ %236, %concatenate.pivot.16.82 ]
  %238 = icmp ult i32 %6, 16
  %multiply.4583 = fmul float %14, %237
  %subtract.4684 = fsub float %221, %multiply.4583
  %239 = getelementptr inbounds float, ptr addrspace(1) %119, i64 1
  %240 = load float, ptr addrspace(1) %239, align 4, !invariant.load !99
  %241 = getelementptr inbounds float, ptr addrspace(1) %121, i64 1
  %242 = load float, ptr addrspace(1) %241, align 4, !invariant.load !99
  %multiply.4785 = fmul float %14, %242
  %subtract.4886 = fsub float %240, %multiply.4785
  %243 = getelementptr inbounds float, ptr addrspace(1) %123, i64 1
  %244 = load float, ptr addrspace(1) %243, align 4, !invariant.load !99
  %245 = getelementptr inbounds float, ptr addrspace(1) %125, i64 1
  %246 = load float, ptr addrspace(1) %245, align 4, !invariant.load !99
  %multiply.4987 = fmul float %14, %246
  %subtract.5088 = fsub float %244, %multiply.4987
  %247 = getelementptr inbounds float, ptr addrspace(1) %127, i64 1
  %248 = load float, ptr addrspace(1) %247, align 4, !invariant.load !99
  %249 = getelementptr inbounds float, ptr addrspace(1) %129, i64 1
  %250 = load float, ptr addrspace(1) %249, align 4, !invariant.load !99
  %251 = getelementptr inbounds float, ptr addrspace(1) %131, i64 1
  %252 = load float, ptr addrspace(1) %251, align 4, !invariant.load !99
  %add.5189 = fadd float %250, %252
  %multiply.5290 = fmul float %14, %add.5189
  %subtract.5391 = fsub float %248, %multiply.5290
  %253 = getelementptr inbounds float, ptr addrspace(1) %133, i64 1
  store float %subtract.3444, ptr addrspace(1) %253, align 4
  %254 = getelementptr inbounds float, ptr addrspace(1) %134, i64 1
  store float %subtract.3754, ptr addrspace(1) %254, align 4
  %255 = getelementptr inbounds float, ptr addrspace(1) %135, i64 1
  store float %subtract.4064, ptr addrspace(1) %255, align 4
  %256 = getelementptr inbounds float, ptr addrspace(1) %136, i64 1
  store float %subtract.4374, ptr addrspace(1) %256, align 4
  %257 = getelementptr inbounds float, ptr addrspace(1) %137, i64 1
  store float %subtract.4684, ptr addrspace(1) %257, align 4
  %258 = getelementptr inbounds float, ptr addrspace(1) %138, i64 1
  store float %subtract.4886, ptr addrspace(1) %258, align 4
  %259 = getelementptr inbounds float, ptr addrspace(1) %139, i64 1
  store float %subtract.5088, ptr addrspace(1) %259, align 4
  %260 = getelementptr inbounds float, ptr addrspace(1) %140, i64 1
  store float %subtract.5391, ptr addrspace(1) %260, align 4
  %261 = getelementptr inbounds float, ptr addrspace(1) %12, i64 2
  %262 = load float, ptr addrspace(1) %261, align 8, !invariant.load !99
  %263 = zext i32 %9 to i64
  %264 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg2242, i64 0, i64 %17, i64 %263
  %265 = getelementptr inbounds float, ptr addrspace(1) %264, i64 128
  %266 = load float, ptr addrspace(1) %265, align 8, !invariant.load !99
  br i1 %238, label %concatenate.pivot.0.98, label %concatenate.pivot.16.99

concatenate.pivot.0.98:                           ; preds = %concatenate.30.merge75
  %267 = shl nuw nsw i32 %7, 4
  %268 = add nuw nsw i32 %6, %267
  %269 = zext i32 %268 to i64
  %270 = getelementptr inbounds [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %269, i64 %263
  %271 = load float, ptr addrspace(1) %270, align 8, !invariant.load !99
  %272 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %269, i64 %263
  %273 = getelementptr inbounds float, ptr addrspace(1) %272, i64 128
  %274 = load float, ptr addrspace(1) %273, align 8, !invariant.load !99
  %add.2494 = fadd float %271, %274
  %275 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %263
  %276 = getelementptr inbounds float, ptr addrspace(1) %275, i64 128
  %277 = load float, ptr addrspace(1) %276, align 8, !invariant.load !99
  %add.2895 = fadd float %add.2494, %277
  br label %concatenate.30.merge92

concatenate.pivot.16.99:                          ; preds = %concatenate.30.merge75
  %278 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %263
  %279 = getelementptr inbounds float, ptr addrspace(1) %278, i64 128
  %280 = load float, ptr addrspace(1) %279, align 8, !invariant.load !99
  br label %concatenate.30.merge92

concatenate.30.merge92:                           ; preds = %concatenate.pivot.16.99, %concatenate.pivot.0.98
  %281 = phi float [ %add.2895, %concatenate.pivot.0.98 ], [ %280, %concatenate.pivot.16.99 ]
  %282 = icmp ult i32 %6, 16
  %add.32100 = fadd float %266, %281
  %multiply.33101 = fmul float %14, %add.32100
  %subtract.34102 = fsub float %262, %multiply.33101
  %283 = getelementptr inbounds float, ptr addrspace(1) %40, i64 2
  %284 = load float, ptr addrspace(1) %283, align 8, !invariant.load !99
  br i1 %282, label %concatenate.pivot.0.109, label %concatenate.pivot.16.110

concatenate.pivot.0.109:                          ; preds = %concatenate.30.merge92
  %285 = shl nuw nsw i32 %7, 4
  %286 = add nuw nsw i32 %6, %285
  %287 = zext i32 %286 to i64
  %288 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %287, i64 %263
  %289 = getelementptr inbounds float, ptr addrspace(1) %288, i64 16
  %290 = load float, ptr addrspace(1) %289, align 8, !invariant.load !99
  %291 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %287, i64 %263
  %292 = getelementptr inbounds float, ptr addrspace(1) %291, i64 144
  %293 = load float, ptr addrspace(1) %292, align 8, !invariant.load !99
  %add.24105 = fadd float %290, %293
  %294 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %263
  %295 = getelementptr inbounds float, ptr addrspace(1) %294, i64 144
  %296 = load float, ptr addrspace(1) %295, align 8, !invariant.load !99
  %add.28106 = fadd float %add.24105, %296
  br label %concatenate.30.merge103

concatenate.pivot.16.110:                         ; preds = %concatenate.30.merge92
  %297 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %263
  %298 = getelementptr inbounds float, ptr addrspace(1) %297, i64 144
  %299 = load float, ptr addrspace(1) %298, align 8, !invariant.load !99
  br label %concatenate.30.merge103

concatenate.30.merge103:                          ; preds = %concatenate.pivot.16.110, %concatenate.pivot.0.109
  %300 = phi float [ %add.28106, %concatenate.pivot.0.109 ], [ %299, %concatenate.pivot.16.110 ]
  %301 = icmp ult i32 %6, 16
  %multiply.36111 = fmul float %14, %300
  %subtract.37112 = fsub float %284, %multiply.36111
  %302 = getelementptr inbounds float, ptr addrspace(1) %60, i64 2
  %303 = load float, ptr addrspace(1) %302, align 8, !invariant.load !99
  br i1 %301, label %concatenate.pivot.0.119, label %concatenate.pivot.16.120

concatenate.pivot.0.119:                          ; preds = %concatenate.30.merge103
  %304 = shl nuw nsw i32 %7, 4
  %305 = add nuw nsw i32 %6, %304
  %306 = zext i32 %305 to i64
  %307 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %306, i64 %263
  %308 = getelementptr inbounds float, ptr addrspace(1) %307, i64 8
  %309 = load float, ptr addrspace(1) %308, align 8, !invariant.load !99
  %310 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %306, i64 %263
  %311 = getelementptr inbounds float, ptr addrspace(1) %310, i64 136
  %312 = load float, ptr addrspace(1) %311, align 8, !invariant.load !99
  %add.24115 = fadd float %309, %312
  %313 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %263
  %314 = getelementptr inbounds float, ptr addrspace(1) %313, i64 136
  %315 = load float, ptr addrspace(1) %314, align 8, !invariant.load !99
  %add.28116 = fadd float %add.24115, %315
  br label %concatenate.30.merge113

concatenate.pivot.16.120:                         ; preds = %concatenate.30.merge103
  %316 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %263
  %317 = getelementptr inbounds float, ptr addrspace(1) %316, i64 136
  %318 = load float, ptr addrspace(1) %317, align 8, !invariant.load !99
  br label %concatenate.30.merge113

concatenate.30.merge113:                          ; preds = %concatenate.pivot.16.120, %concatenate.pivot.0.119
  %319 = phi float [ %add.28116, %concatenate.pivot.0.119 ], [ %318, %concatenate.pivot.16.120 ]
  %320 = icmp ult i32 %6, 16
  %multiply.39121 = fmul float %14, %319
  %subtract.40122 = fsub float %303, %multiply.39121
  %321 = getelementptr inbounds float, ptr addrspace(1) %80, i64 2
  %322 = load float, ptr addrspace(1) %321, align 8, !invariant.load !99
  br i1 %320, label %concatenate.pivot.0.129, label %concatenate.pivot.16.130

concatenate.pivot.0.129:                          ; preds = %concatenate.30.merge113
  %323 = shl nuw nsw i32 %7, 4
  %324 = add nuw nsw i32 %6, %323
  %325 = zext i32 %324 to i64
  %326 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %325, i64 %263
  %327 = getelementptr inbounds float, ptr addrspace(1) %326, i64 24
  %328 = load float, ptr addrspace(1) %327, align 8, !invariant.load !99
  %329 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %325, i64 %263
  %330 = getelementptr inbounds float, ptr addrspace(1) %329, i64 152
  %331 = load float, ptr addrspace(1) %330, align 8, !invariant.load !99
  %add.24125 = fadd float %328, %331
  %332 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %263
  %333 = getelementptr inbounds float, ptr addrspace(1) %332, i64 152
  %334 = load float, ptr addrspace(1) %333, align 8, !invariant.load !99
  %add.28126 = fadd float %add.24125, %334
  br label %concatenate.30.merge123

concatenate.pivot.16.130:                         ; preds = %concatenate.30.merge113
  %335 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %263
  %336 = getelementptr inbounds float, ptr addrspace(1) %335, i64 152
  %337 = load float, ptr addrspace(1) %336, align 8, !invariant.load !99
  br label %concatenate.30.merge123

concatenate.30.merge123:                          ; preds = %concatenate.pivot.16.130, %concatenate.pivot.0.129
  %338 = phi float [ %add.28126, %concatenate.pivot.0.129 ], [ %337, %concatenate.pivot.16.130 ]
  %339 = icmp ult i32 %6, 16
  %multiply.42131 = fmul float %14, %338
  %subtract.43132 = fsub float %322, %multiply.42131
  %340 = getelementptr inbounds float, ptr addrspace(1) %100, i64 2
  %341 = load float, ptr addrspace(1) %340, align 8, !invariant.load !99
  br i1 %339, label %concatenate.pivot.0.139, label %concatenate.pivot.16.140

concatenate.pivot.0.139:                          ; preds = %concatenate.30.merge123
  %342 = shl nuw nsw i32 %7, 4
  %343 = add nuw nsw i32 %6, %342
  %344 = zext i32 %343 to i64
  %345 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %344, i64 %263
  %346 = getelementptr inbounds float, ptr addrspace(1) %345, i64 32
  %347 = load float, ptr addrspace(1) %346, align 8, !invariant.load !99
  %348 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %344, i64 %263
  %349 = getelementptr inbounds float, ptr addrspace(1) %348, i64 160
  %350 = load float, ptr addrspace(1) %349, align 8, !invariant.load !99
  %add.24135 = fadd float %347, %350
  %351 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %263
  %352 = getelementptr inbounds float, ptr addrspace(1) %351, i64 160
  %353 = load float, ptr addrspace(1) %352, align 8, !invariant.load !99
  %add.28136 = fadd float %add.24135, %353
  br label %concatenate.30.merge133

concatenate.pivot.16.140:                         ; preds = %concatenate.30.merge123
  %354 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %263
  %355 = getelementptr inbounds float, ptr addrspace(1) %354, i64 160
  %356 = load float, ptr addrspace(1) %355, align 8, !invariant.load !99
  br label %concatenate.30.merge133

concatenate.30.merge133:                          ; preds = %concatenate.pivot.16.140, %concatenate.pivot.0.139
  %357 = phi float [ %add.28136, %concatenate.pivot.0.139 ], [ %356, %concatenate.pivot.16.140 ]
  %358 = icmp ult i32 %6, 16
  %multiply.45141 = fmul float %14, %357
  %subtract.46142 = fsub float %341, %multiply.45141
  %359 = getelementptr inbounds float, ptr addrspace(1) %119, i64 2
  %360 = load float, ptr addrspace(1) %359, align 8, !invariant.load !99
  %361 = getelementptr inbounds float, ptr addrspace(1) %121, i64 2
  %362 = load float, ptr addrspace(1) %361, align 8, !invariant.load !99
  %multiply.47143 = fmul float %14, %362
  %subtract.48144 = fsub float %360, %multiply.47143
  %363 = getelementptr inbounds float, ptr addrspace(1) %123, i64 2
  %364 = load float, ptr addrspace(1) %363, align 8, !invariant.load !99
  %365 = getelementptr inbounds float, ptr addrspace(1) %125, i64 2
  %366 = load float, ptr addrspace(1) %365, align 8, !invariant.load !99
  %multiply.49145 = fmul float %14, %366
  %subtract.50146 = fsub float %364, %multiply.49145
  %367 = getelementptr inbounds float, ptr addrspace(1) %127, i64 2
  %368 = load float, ptr addrspace(1) %367, align 8, !invariant.load !99
  %369 = getelementptr inbounds float, ptr addrspace(1) %129, i64 2
  %370 = load float, ptr addrspace(1) %369, align 8, !invariant.load !99
  %371 = getelementptr inbounds float, ptr addrspace(1) %131, i64 2
  %372 = load float, ptr addrspace(1) %371, align 8, !invariant.load !99
  %add.51147 = fadd float %370, %372
  %multiply.52148 = fmul float %14, %add.51147
  %subtract.53149 = fsub float %368, %multiply.52148
  %373 = getelementptr inbounds float, ptr addrspace(1) %133, i64 2
  store float %subtract.34102, ptr addrspace(1) %373, align 8
  %374 = getelementptr inbounds float, ptr addrspace(1) %134, i64 2
  store float %subtract.37112, ptr addrspace(1) %374, align 8
  %375 = getelementptr inbounds float, ptr addrspace(1) %135, i64 2
  store float %subtract.40122, ptr addrspace(1) %375, align 8
  %376 = getelementptr inbounds float, ptr addrspace(1) %136, i64 2
  store float %subtract.43132, ptr addrspace(1) %376, align 8
  %377 = getelementptr inbounds float, ptr addrspace(1) %137, i64 2
  store float %subtract.46142, ptr addrspace(1) %377, align 8
  %378 = getelementptr inbounds float, ptr addrspace(1) %138, i64 2
  store float %subtract.48144, ptr addrspace(1) %378, align 8
  %379 = getelementptr inbounds float, ptr addrspace(1) %139, i64 2
  store float %subtract.50146, ptr addrspace(1) %379, align 8
  %380 = getelementptr inbounds float, ptr addrspace(1) %140, i64 2
  store float %subtract.53149, ptr addrspace(1) %380, align 8
  %381 = getelementptr inbounds float, ptr addrspace(1) %12, i64 3
  %382 = load float, ptr addrspace(1) %381, align 4, !invariant.load !99
  %383 = zext i32 %10 to i64
  %384 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg2242, i64 0, i64 %17, i64 %383
  %385 = getelementptr inbounds float, ptr addrspace(1) %384, i64 128
  %386 = load float, ptr addrspace(1) %385, align 4, !invariant.load !99
  br i1 %358, label %concatenate.pivot.0.156, label %concatenate.pivot.16.157

concatenate.pivot.0.156:                          ; preds = %concatenate.30.merge133
  %387 = shl nuw nsw i32 %7, 4
  %388 = add nuw nsw i32 %6, %387
  %389 = zext i32 %388 to i64
  %390 = getelementptr inbounds [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %389, i64 %383
  %391 = load float, ptr addrspace(1) %390, align 4, !invariant.load !99
  %392 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %389, i64 %383
  %393 = getelementptr inbounds float, ptr addrspace(1) %392, i64 128
  %394 = load float, ptr addrspace(1) %393, align 4, !invariant.load !99
  %add.24152 = fadd float %391, %394
  %395 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %383
  %396 = getelementptr inbounds float, ptr addrspace(1) %395, i64 128
  %397 = load float, ptr addrspace(1) %396, align 4, !invariant.load !99
  %add.28153 = fadd float %add.24152, %397
  br label %concatenate.30.merge150

concatenate.pivot.16.157:                         ; preds = %concatenate.30.merge133
  %398 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %383
  %399 = getelementptr inbounds float, ptr addrspace(1) %398, i64 128
  %400 = load float, ptr addrspace(1) %399, align 4, !invariant.load !99
  br label %concatenate.30.merge150

concatenate.30.merge150:                          ; preds = %concatenate.pivot.16.157, %concatenate.pivot.0.156
  %401 = phi float [ %add.28153, %concatenate.pivot.0.156 ], [ %400, %concatenate.pivot.16.157 ]
  %402 = icmp ult i32 %6, 16
  %403 = getelementptr inbounds float, ptr addrspace(1) %40, i64 3
  %404 = load float, ptr addrspace(1) %403, align 4, !invariant.load !99
  br i1 %402, label %concatenate.pivot.0.167, label %concatenate.pivot.16.168

concatenate.pivot.0.167:                          ; preds = %concatenate.30.merge150
  %405 = shl nuw nsw i32 %7, 4
  %406 = add nuw nsw i32 %6, %405
  %407 = zext i32 %406 to i64
  %408 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %407, i64 %383
  %409 = getelementptr inbounds float, ptr addrspace(1) %408, i64 16
  %410 = load float, ptr addrspace(1) %409, align 4, !invariant.load !99
  %411 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %407, i64 %383
  %412 = getelementptr inbounds float, ptr addrspace(1) %411, i64 144
  %413 = load float, ptr addrspace(1) %412, align 4, !invariant.load !99
  %add.24163 = fadd float %410, %413
  %414 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %383
  %415 = getelementptr inbounds float, ptr addrspace(1) %414, i64 144
  %416 = load float, ptr addrspace(1) %415, align 4, !invariant.load !99
  %add.28164 = fadd float %add.24163, %416
  br label %concatenate.30.merge161

concatenate.pivot.16.168:                         ; preds = %concatenate.30.merge150
  %417 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %383
  %418 = getelementptr inbounds float, ptr addrspace(1) %417, i64 144
  %419 = load float, ptr addrspace(1) %418, align 4, !invariant.load !99
  br label %concatenate.30.merge161

concatenate.30.merge161:                          ; preds = %concatenate.pivot.16.168, %concatenate.pivot.0.167
  %420 = phi float [ %add.28164, %concatenate.pivot.0.167 ], [ %419, %concatenate.pivot.16.168 ]
  %421 = icmp ult i32 %6, 16
  %422 = getelementptr inbounds float, ptr addrspace(1) %60, i64 3
  %423 = load float, ptr addrspace(1) %422, align 4, !invariant.load !99
  br i1 %421, label %concatenate.pivot.0.177, label %concatenate.pivot.16.178

concatenate.pivot.0.177:                          ; preds = %concatenate.30.merge161
  %424 = shl nuw nsw i32 %7, 4
  %425 = add nuw nsw i32 %6, %424
  %426 = zext i32 %425 to i64
  %427 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %426, i64 %383
  %428 = getelementptr inbounds float, ptr addrspace(1) %427, i64 8
  %429 = load float, ptr addrspace(1) %428, align 4, !invariant.load !99
  %430 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %426, i64 %383
  %431 = getelementptr inbounds float, ptr addrspace(1) %430, i64 136
  %432 = load float, ptr addrspace(1) %431, align 4, !invariant.load !99
  %add.24173 = fadd float %429, %432
  %433 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %383
  %434 = getelementptr inbounds float, ptr addrspace(1) %433, i64 136
  %435 = load float, ptr addrspace(1) %434, align 4, !invariant.load !99
  %add.28174 = fadd float %add.24173, %435
  br label %concatenate.30.merge171

concatenate.pivot.16.178:                         ; preds = %concatenate.30.merge161
  %436 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %383
  %437 = getelementptr inbounds float, ptr addrspace(1) %436, i64 136
  %438 = load float, ptr addrspace(1) %437, align 4, !invariant.load !99
  br label %concatenate.30.merge171

concatenate.30.merge171:                          ; preds = %concatenate.pivot.16.178, %concatenate.pivot.0.177
  %439 = phi float [ %add.28174, %concatenate.pivot.0.177 ], [ %438, %concatenate.pivot.16.178 ]
  %440 = icmp ult i32 %6, 16
  %441 = getelementptr inbounds float, ptr addrspace(1) %80, i64 3
  %442 = load float, ptr addrspace(1) %441, align 4, !invariant.load !99
  br i1 %440, label %concatenate.pivot.0.187, label %concatenate.pivot.16.188

concatenate.pivot.0.187:                          ; preds = %concatenate.30.merge171
  %443 = shl nuw nsw i32 %7, 4
  %444 = add nuw nsw i32 %6, %443
  %445 = zext i32 %444 to i64
  %446 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %445, i64 %383
  %447 = getelementptr inbounds float, ptr addrspace(1) %446, i64 24
  %448 = load float, ptr addrspace(1) %447, align 4, !invariant.load !99
  %449 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %445, i64 %383
  %450 = getelementptr inbounds float, ptr addrspace(1) %449, i64 152
  %451 = load float, ptr addrspace(1) %450, align 4, !invariant.load !99
  %add.24183 = fadd float %448, %451
  %452 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %383
  %453 = getelementptr inbounds float, ptr addrspace(1) %452, i64 152
  %454 = load float, ptr addrspace(1) %453, align 4, !invariant.load !99
  %add.28184 = fadd float %add.24183, %454
  br label %concatenate.30.merge181

concatenate.pivot.16.188:                         ; preds = %concatenate.30.merge171
  %455 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %383
  %456 = getelementptr inbounds float, ptr addrspace(1) %455, i64 152
  %457 = load float, ptr addrspace(1) %456, align 4, !invariant.load !99
  br label %concatenate.30.merge181

concatenate.30.merge181:                          ; preds = %concatenate.pivot.16.188, %concatenate.pivot.0.187
  %458 = phi float [ %add.28184, %concatenate.pivot.0.187 ], [ %457, %concatenate.pivot.16.188 ]
  %459 = icmp ult i32 %6, 16
  %460 = getelementptr inbounds float, ptr addrspace(1) %100, i64 3
  %461 = load float, ptr addrspace(1) %460, align 4, !invariant.load !99
  br i1 %459, label %concatenate.pivot.0.197, label %concatenate.pivot.16.198

concatenate.pivot.0.197:                          ; preds = %concatenate.30.merge181
  %462 = shl nuw nsw i32 %7, 4
  %463 = add nuw nsw i32 %6, %462
  %464 = zext i32 %463 to i64
  %465 = getelementptr [131072 x [40 x float]], ptr addrspace(1) %arg4246, i64 0, i64 %464, i64 %383
  %466 = getelementptr inbounds float, ptr addrspace(1) %465, i64 32
  %467 = load float, ptr addrspace(1) %466, align 4, !invariant.load !99
  %468 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5248, i64 0, i64 %464, i64 %383
  %469 = getelementptr inbounds float, ptr addrspace(1) %468, i64 160
  %470 = load float, ptr addrspace(1) %469, align 4, !invariant.load !99
  %add.24193 = fadd float %467, %470
  %471 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %383
  %472 = getelementptr inbounds float, ptr addrspace(1) %471, i64 160
  %473 = load float, ptr addrspace(1) %472, align 4, !invariant.load !99
  %add.28194 = fadd float %add.24193, %473
  br label %concatenate.30.merge191

concatenate.pivot.16.198:                         ; preds = %concatenate.30.merge181
  %474 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3244, i64 0, i64 %17, i64 %383
  %475 = getelementptr inbounds float, ptr addrspace(1) %474, i64 160
  %476 = load float, ptr addrspace(1) %475, align 4, !invariant.load !99
  br label %concatenate.30.merge191

concatenate.30.merge191:                          ; preds = %concatenate.pivot.16.198, %concatenate.pivot.0.197
  %477 = phi float [ %add.28194, %concatenate.pivot.0.197 ], [ %476, %concatenate.pivot.16.198 ]
  %multiply.42189 = fmul float %14, %458
  %subtract.43190 = fsub float %442, %multiply.42189
  %multiply.39179 = fmul float %14, %439
  %subtract.40180 = fsub float %423, %multiply.39179
  %multiply.36169 = fmul float %14, %420
  %subtract.37170 = fsub float %404, %multiply.36169
  %add.32158 = fadd float %386, %401
  %multiply.33159 = fmul float %14, %add.32158
  %subtract.34160 = fsub float %382, %multiply.33159
  %multiply.45199 = fmul float %14, %477
  %subtract.46200 = fsub float %461, %multiply.45199
  %478 = getelementptr inbounds float, ptr addrspace(1) %119, i64 3
  %479 = load float, ptr addrspace(1) %478, align 4, !invariant.load !99
  %480 = getelementptr inbounds float, ptr addrspace(1) %121, i64 3
  %481 = load float, ptr addrspace(1) %480, align 4, !invariant.load !99
  %multiply.47201 = fmul float %14, %481
  %subtract.48202 = fsub float %479, %multiply.47201
  %482 = getelementptr inbounds float, ptr addrspace(1) %123, i64 3
  %483 = load float, ptr addrspace(1) %482, align 4, !invariant.load !99
  %484 = getelementptr inbounds float, ptr addrspace(1) %125, i64 3
  %485 = load float, ptr addrspace(1) %484, align 4, !invariant.load !99
  %multiply.49203 = fmul float %14, %485
  %subtract.50204 = fsub float %483, %multiply.49203
  %486 = getelementptr inbounds float, ptr addrspace(1) %127, i64 3
  %487 = load float, ptr addrspace(1) %486, align 4, !invariant.load !99
  %488 = getelementptr inbounds float, ptr addrspace(1) %129, i64 3
  %489 = load float, ptr addrspace(1) %488, align 4, !invariant.load !99
  %490 = getelementptr inbounds float, ptr addrspace(1) %131, i64 3
  %491 = load float, ptr addrspace(1) %490, align 4, !invariant.load !99
  %add.51205 = fadd float %489, %491
  %multiply.52206 = fmul float %14, %add.51205
  %subtract.53207 = fsub float %487, %multiply.52206
  %492 = getelementptr inbounds float, ptr addrspace(1) %133, i64 3
  store float %subtract.34160, ptr addrspace(1) %492, align 4
  %493 = getelementptr inbounds float, ptr addrspace(1) %134, i64 3
  store float %subtract.37170, ptr addrspace(1) %493, align 4
  %494 = getelementptr inbounds float, ptr addrspace(1) %135, i64 3
  store float %subtract.40180, ptr addrspace(1) %494, align 4
  %495 = getelementptr inbounds float, ptr addrspace(1) %136, i64 3
  store float %subtract.43190, ptr addrspace(1) %495, align 4
  %496 = getelementptr inbounds float, ptr addrspace(1) %137, i64 3
  store float %subtract.46200, ptr addrspace(1) %496, align 4
  %497 = getelementptr inbounds float, ptr addrspace(1) %138, i64 3
  store float %subtract.48202, ptr addrspace(1) %497, align 4
  %498 = getelementptr inbounds float, ptr addrspace(1) %139, i64 3
  store float %subtract.50204, ptr addrspace(1) %498, align 4
  %499 = getelementptr inbounds float, ptr addrspace(1) %140, i64 3
  store float %subtract.53207, ptr addrspace(1) %499, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(655360000) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(550502400) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(67108864) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(88080384) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg16) local_unnamed_addr #0 {
entry:
  %arg16138 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15136 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14134 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13132 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12130 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11128 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10126 = addrspacecast ptr %arg10 to ptr addrspace(1)
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !131
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 60
  %5 = lshr i32 %linear_index_base, 6
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 6400
  %linear_index1 = or i32 %linear_index_base, 1
  %8 = and i32 %linear_index1, 61
  %linear_index2 = or i32 %linear_index_base, 2
  %9 = and i32 %linear_index2, 62
  %linear_index3 = or i32 %linear_index_base, 3
  %10 = and i32 %linear_index3, 63
  %11 = zext i32 %linear_index_base to i64
  %12 = getelementptr float, ptr addrspace(1) %arg0106, i64 %11
  %13 = load float, ptr addrspace(1) %12, align 16, !invariant.load !99
  %14 = load float, ptr addrspace(1) %arg1108, align 16, !invariant.load !99
  %15 = mul nuw nsw i32 %7, 100
  %16 = add nuw nsw i32 %6, %15
  %17 = zext i32 %16 to i64
  %18 = zext i32 %4 to i64
  %19 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg2110, i64 0, i64 %17, i64 %18
  %20 = getelementptr inbounds float, ptr addrspace(1) %19, i64 64
  %21 = load float, ptr addrspace(1) %20, align 16, !invariant.load !99
  %22 = icmp ult i32 %6, 16
  br i1 %22, label %concatenate.pivot.0., label %concatenate.pivot.16.1

concatenate.pivot.0.:                             ; preds = %entry
  %23 = trunc i64 %17 to i32
  %24 = mul i32 %7, -84
  %25 = add i32 %23, %24
  %26 = zext i32 %25 to i64
  %27 = getelementptr [131072 x [128 x float]], ptr addrspace(1) %arg4114, i64 0, i64 %26, i64 %18
  %28 = getelementptr inbounds float, ptr addrspace(1) %27, i64 64
  %29 = load float, ptr addrspace(1) %28, align 16, !invariant.load !99
  %30 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5116, i64 0, i64 %26, i64 %18
  %31 = getelementptr inbounds float, ptr addrspace(1) %30, i64 64
  %32 = load float, ptr addrspace(1) %31, align 16, !invariant.load !99
  %add.20 = fadd float %29, %32
  %33 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %18
  %34 = getelementptr inbounds float, ptr addrspace(1) %33, i64 64
  %35 = load float, ptr addrspace(1) %34, align 16, !invariant.load !99
  %add.24 = fadd float %add.20, %35
  br label %concatenate.26.merge

concatenate.pivot.16.1:                           ; preds = %entry
  %36 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %18
  %37 = getelementptr inbounds float, ptr addrspace(1) %36, i64 64
  %38 = load float, ptr addrspace(1) %37, align 16, !invariant.load !99
  br label %concatenate.26.merge

concatenate.26.merge:                             ; preds = %concatenate.pivot.16.1, %concatenate.pivot.0.
  %39 = phi float [ %add.24, %concatenate.pivot.0. ], [ %38, %concatenate.pivot.16.1 ]
  %40 = icmp ult i32 %6, 16
  %add.28 = fadd float %21, %39
  %multiply.29 = fmul float %14, %add.28
  %subtract.30 = fsub float %13, %multiply.29
  %41 = getelementptr float, ptr addrspace(1) %arg6118, i64 %11
  %42 = load float, ptr addrspace(1) %41, align 16, !invariant.load !99
  %43 = load float, ptr addrspace(1) %19, align 16, !invariant.load !99
  br i1 %40, label %concatenate.pivot.0.8, label %concatenate.pivot.16.9

concatenate.pivot.0.8:                            ; preds = %concatenate.26.merge
  %44 = trunc i64 %17 to i32
  %45 = mul i32 %7, -84
  %46 = add i32 %44, %45
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg4114, i64 0, i64 %47, i64 %18
  %49 = load float, ptr addrspace(1) %48, align 16, !invariant.load !99
  %50 = getelementptr inbounds [131072 x [168 x float]], ptr addrspace(1) %arg5116, i64 0, i64 %47, i64 %18
  %51 = load float, ptr addrspace(1) %50, align 16, !invariant.load !99
  %add.204 = fadd float %49, %51
  %52 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %18
  %53 = load float, ptr addrspace(1) %52, align 16, !invariant.load !99
  %add.245 = fadd float %add.204, %53
  br label %concatenate.26.merge2

concatenate.pivot.16.9:                           ; preds = %concatenate.26.merge
  %54 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %18
  %55 = load float, ptr addrspace(1) %54, align 16, !invariant.load !99
  br label %concatenate.26.merge2

concatenate.26.merge2:                            ; preds = %concatenate.pivot.16.9, %concatenate.pivot.0.8
  %56 = phi float [ %add.245, %concatenate.pivot.0.8 ], [ %55, %concatenate.pivot.16.9 ]
  %57 = icmp ult i32 %6, 16
  %add.33 = fadd float %43, %56
  %multiply.34 = fmul float %14, %add.33
  %subtract.35 = fsub float %42, %multiply.34
  %58 = getelementptr float, ptr addrspace(1) %arg7120, i64 %11
  %59 = load float, ptr addrspace(1) %58, align 16, !invariant.load !99
  %60 = getelementptr float, ptr addrspace(1) %arg8122, i64 %11
  %61 = load float, ptr addrspace(1) %60, align 16, !invariant.load !99
  %62 = getelementptr float, ptr addrspace(1) %arg9124, i64 %11
  %63 = load float, ptr addrspace(1) %62, align 16, !invariant.load !99
  %add.36 = fadd float %61, %63
  %multiply.37 = fmul float %14, %add.36
  %subtract.38 = fsub float %59, %multiply.37
  %64 = getelementptr float, ptr addrspace(1) %arg10126, i64 %11
  %65 = load float, ptr addrspace(1) %64, align 16, !invariant.load !99
  %66 = getelementptr float, ptr addrspace(1) %arg11128, i64 %11
  %67 = load float, ptr addrspace(1) %66, align 16, !invariant.load !99
  %68 = getelementptr float, ptr addrspace(1) %arg12130, i64 %11
  %69 = load float, ptr addrspace(1) %68, align 16, !invariant.load !99
  %add.39 = fadd float %67, %69
  %multiply.40 = fmul float %14, %add.39
  %subtract.41 = fsub float %65, %multiply.40
  %70 = getelementptr float, ptr addrspace(1) %arg13132, i64 %11
  store float %subtract.30, ptr addrspace(1) %70, align 16
  %71 = getelementptr float, ptr addrspace(1) %arg14134, i64 %11
  store float %subtract.35, ptr addrspace(1) %71, align 16
  %72 = getelementptr float, ptr addrspace(1) %arg15136, i64 %11
  store float %subtract.38, ptr addrspace(1) %72, align 16
  %73 = getelementptr float, ptr addrspace(1) %arg16138, i64 %11
  store float %subtract.41, ptr addrspace(1) %73, align 16
  %74 = getelementptr inbounds float, ptr addrspace(1) %12, i64 1
  %75 = load float, ptr addrspace(1) %74, align 4, !invariant.load !99
  %76 = zext i32 %8 to i64
  %77 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg2110, i64 0, i64 %17, i64 %76
  %78 = getelementptr inbounds float, ptr addrspace(1) %77, i64 64
  %79 = load float, ptr addrspace(1) %78, align 4, !invariant.load !99
  br i1 %57, label %concatenate.pivot.0.16, label %concatenate.pivot.16.17

concatenate.pivot.0.16:                           ; preds = %concatenate.26.merge2
  %80 = shl nuw nsw i32 %7, 4
  %81 = add nuw nsw i32 %6, %80
  %82 = zext i32 %81 to i64
  %83 = getelementptr [131072 x [128 x float]], ptr addrspace(1) %arg4114, i64 0, i64 %82, i64 %76
  %84 = getelementptr inbounds float, ptr addrspace(1) %83, i64 64
  %85 = load float, ptr addrspace(1) %84, align 4, !invariant.load !99
  %86 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5116, i64 0, i64 %82, i64 %76
  %87 = getelementptr inbounds float, ptr addrspace(1) %86, i64 64
  %88 = load float, ptr addrspace(1) %87, align 4, !invariant.load !99
  %add.2012 = fadd float %85, %88
  %89 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %76
  %90 = getelementptr inbounds float, ptr addrspace(1) %89, i64 64
  %91 = load float, ptr addrspace(1) %90, align 4, !invariant.load !99
  %add.2413 = fadd float %add.2012, %91
  br label %concatenate.26.merge10

concatenate.pivot.16.17:                          ; preds = %concatenate.26.merge2
  %92 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %76
  %93 = getelementptr inbounds float, ptr addrspace(1) %92, i64 64
  %94 = load float, ptr addrspace(1) %93, align 4, !invariant.load !99
  br label %concatenate.26.merge10

concatenate.26.merge10:                           ; preds = %concatenate.pivot.16.17, %concatenate.pivot.0.16
  %95 = phi float [ %add.2413, %concatenate.pivot.0.16 ], [ %94, %concatenate.pivot.16.17 ]
  %96 = icmp ult i32 %6, 16
  %add.2818 = fadd float %79, %95
  %multiply.2919 = fmul float %14, %add.2818
  %subtract.3020 = fsub float %75, %multiply.2919
  %97 = getelementptr inbounds float, ptr addrspace(1) %41, i64 1
  %98 = load float, ptr addrspace(1) %97, align 4, !invariant.load !99
  %99 = load float, ptr addrspace(1) %77, align 4, !invariant.load !99
  br i1 %96, label %concatenate.pivot.0.27, label %concatenate.pivot.16.28

concatenate.pivot.0.27:                           ; preds = %concatenate.26.merge10
  %100 = shl nuw nsw i32 %7, 4
  %101 = add nuw nsw i32 %6, %100
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg4114, i64 0, i64 %102, i64 %76
  %104 = load float, ptr addrspace(1) %103, align 4, !invariant.load !99
  %105 = getelementptr inbounds [131072 x [168 x float]], ptr addrspace(1) %arg5116, i64 0, i64 %102, i64 %76
  %106 = load float, ptr addrspace(1) %105, align 4, !invariant.load !99
  %add.2023 = fadd float %104, %106
  %107 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %76
  %108 = load float, ptr addrspace(1) %107, align 4, !invariant.load !99
  %add.2424 = fadd float %add.2023, %108
  br label %concatenate.26.merge21

concatenate.pivot.16.28:                          ; preds = %concatenate.26.merge10
  %109 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %76
  %110 = load float, ptr addrspace(1) %109, align 4, !invariant.load !99
  br label %concatenate.26.merge21

concatenate.26.merge21:                           ; preds = %concatenate.pivot.16.28, %concatenate.pivot.0.27
  %111 = phi float [ %add.2424, %concatenate.pivot.0.27 ], [ %110, %concatenate.pivot.16.28 ]
  %112 = icmp ult i32 %6, 16
  %add.3329 = fadd float %99, %111
  %multiply.3430 = fmul float %14, %add.3329
  %subtract.3531 = fsub float %98, %multiply.3430
  %113 = getelementptr inbounds float, ptr addrspace(1) %58, i64 1
  %114 = load float, ptr addrspace(1) %113, align 4, !invariant.load !99
  %115 = getelementptr inbounds float, ptr addrspace(1) %60, i64 1
  %116 = load float, ptr addrspace(1) %115, align 4, !invariant.load !99
  %117 = getelementptr inbounds float, ptr addrspace(1) %62, i64 1
  %118 = load float, ptr addrspace(1) %117, align 4, !invariant.load !99
  %add.3632 = fadd float %116, %118
  %multiply.3733 = fmul float %14, %add.3632
  %subtract.3834 = fsub float %114, %multiply.3733
  %119 = getelementptr inbounds float, ptr addrspace(1) %64, i64 1
  %120 = load float, ptr addrspace(1) %119, align 4, !invariant.load !99
  %121 = getelementptr inbounds float, ptr addrspace(1) %66, i64 1
  %122 = load float, ptr addrspace(1) %121, align 4, !invariant.load !99
  %123 = getelementptr inbounds float, ptr addrspace(1) %68, i64 1
  %124 = load float, ptr addrspace(1) %123, align 4, !invariant.load !99
  %add.3935 = fadd float %122, %124
  %multiply.4036 = fmul float %14, %add.3935
  %subtract.4137 = fsub float %120, %multiply.4036
  %125 = getelementptr inbounds float, ptr addrspace(1) %70, i64 1
  store float %subtract.3020, ptr addrspace(1) %125, align 4
  %126 = getelementptr inbounds float, ptr addrspace(1) %71, i64 1
  store float %subtract.3531, ptr addrspace(1) %126, align 4
  %127 = getelementptr inbounds float, ptr addrspace(1) %72, i64 1
  store float %subtract.3834, ptr addrspace(1) %127, align 4
  %128 = getelementptr inbounds float, ptr addrspace(1) %73, i64 1
  store float %subtract.4137, ptr addrspace(1) %128, align 4
  %129 = getelementptr inbounds float, ptr addrspace(1) %12, i64 2
  %130 = load float, ptr addrspace(1) %129, align 8, !invariant.load !99
  %131 = zext i32 %9 to i64
  %132 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg2110, i64 0, i64 %17, i64 %131
  %133 = getelementptr inbounds float, ptr addrspace(1) %132, i64 64
  %134 = load float, ptr addrspace(1) %133, align 8, !invariant.load !99
  br i1 %112, label %concatenate.pivot.0.44, label %concatenate.pivot.16.45

concatenate.pivot.0.44:                           ; preds = %concatenate.26.merge21
  %135 = shl nuw nsw i32 %7, 4
  %136 = add nuw nsw i32 %6, %135
  %137 = zext i32 %136 to i64
  %138 = getelementptr [131072 x [128 x float]], ptr addrspace(1) %arg4114, i64 0, i64 %137, i64 %131
  %139 = getelementptr inbounds float, ptr addrspace(1) %138, i64 64
  %140 = load float, ptr addrspace(1) %139, align 8, !invariant.load !99
  %141 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5116, i64 0, i64 %137, i64 %131
  %142 = getelementptr inbounds float, ptr addrspace(1) %141, i64 64
  %143 = load float, ptr addrspace(1) %142, align 8, !invariant.load !99
  %add.2040 = fadd float %140, %143
  %144 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %131
  %145 = getelementptr inbounds float, ptr addrspace(1) %144, i64 64
  %146 = load float, ptr addrspace(1) %145, align 8, !invariant.load !99
  %add.2441 = fadd float %add.2040, %146
  br label %concatenate.26.merge38

concatenate.pivot.16.45:                          ; preds = %concatenate.26.merge21
  %147 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %131
  %148 = getelementptr inbounds float, ptr addrspace(1) %147, i64 64
  %149 = load float, ptr addrspace(1) %148, align 8, !invariant.load !99
  br label %concatenate.26.merge38

concatenate.26.merge38:                           ; preds = %concatenate.pivot.16.45, %concatenate.pivot.0.44
  %150 = phi float [ %add.2441, %concatenate.pivot.0.44 ], [ %149, %concatenate.pivot.16.45 ]
  %151 = icmp ult i32 %6, 16
  %add.2846 = fadd float %134, %150
  %multiply.2947 = fmul float %14, %add.2846
  %subtract.3048 = fsub float %130, %multiply.2947
  %152 = getelementptr inbounds float, ptr addrspace(1) %41, i64 2
  %153 = load float, ptr addrspace(1) %152, align 8, !invariant.load !99
  %154 = load float, ptr addrspace(1) %132, align 8, !invariant.load !99
  br i1 %151, label %concatenate.pivot.0.55, label %concatenate.pivot.16.56

concatenate.pivot.0.55:                           ; preds = %concatenate.26.merge38
  %155 = shl nuw nsw i32 %7, 4
  %156 = add nuw nsw i32 %6, %155
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg4114, i64 0, i64 %157, i64 %131
  %159 = load float, ptr addrspace(1) %158, align 8, !invariant.load !99
  %160 = getelementptr inbounds [131072 x [168 x float]], ptr addrspace(1) %arg5116, i64 0, i64 %157, i64 %131
  %161 = load float, ptr addrspace(1) %160, align 8, !invariant.load !99
  %add.2051 = fadd float %159, %161
  %162 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %131
  %163 = load float, ptr addrspace(1) %162, align 8, !invariant.load !99
  %add.2452 = fadd float %add.2051, %163
  br label %concatenate.26.merge49

concatenate.pivot.16.56:                          ; preds = %concatenate.26.merge38
  %164 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %131
  %165 = load float, ptr addrspace(1) %164, align 8, !invariant.load !99
  br label %concatenate.26.merge49

concatenate.26.merge49:                           ; preds = %concatenate.pivot.16.56, %concatenate.pivot.0.55
  %166 = phi float [ %add.2452, %concatenate.pivot.0.55 ], [ %165, %concatenate.pivot.16.56 ]
  %167 = icmp ult i32 %6, 16
  %add.3357 = fadd float %154, %166
  %multiply.3458 = fmul float %14, %add.3357
  %subtract.3559 = fsub float %153, %multiply.3458
  %168 = getelementptr inbounds float, ptr addrspace(1) %58, i64 2
  %169 = load float, ptr addrspace(1) %168, align 8, !invariant.load !99
  %170 = getelementptr inbounds float, ptr addrspace(1) %60, i64 2
  %171 = load float, ptr addrspace(1) %170, align 8, !invariant.load !99
  %172 = getelementptr inbounds float, ptr addrspace(1) %62, i64 2
  %173 = load float, ptr addrspace(1) %172, align 8, !invariant.load !99
  %add.3660 = fadd float %171, %173
  %multiply.3761 = fmul float %14, %add.3660
  %subtract.3862 = fsub float %169, %multiply.3761
  %174 = getelementptr inbounds float, ptr addrspace(1) %64, i64 2
  %175 = load float, ptr addrspace(1) %174, align 8, !invariant.load !99
  %176 = getelementptr inbounds float, ptr addrspace(1) %66, i64 2
  %177 = load float, ptr addrspace(1) %176, align 8, !invariant.load !99
  %178 = getelementptr inbounds float, ptr addrspace(1) %68, i64 2
  %179 = load float, ptr addrspace(1) %178, align 8, !invariant.load !99
  %add.3963 = fadd float %177, %179
  %multiply.4064 = fmul float %14, %add.3963
  %subtract.4165 = fsub float %175, %multiply.4064
  %180 = getelementptr inbounds float, ptr addrspace(1) %70, i64 2
  store float %subtract.3048, ptr addrspace(1) %180, align 8
  %181 = getelementptr inbounds float, ptr addrspace(1) %71, i64 2
  store float %subtract.3559, ptr addrspace(1) %181, align 8
  %182 = getelementptr inbounds float, ptr addrspace(1) %72, i64 2
  store float %subtract.3862, ptr addrspace(1) %182, align 8
  %183 = getelementptr inbounds float, ptr addrspace(1) %73, i64 2
  store float %subtract.4165, ptr addrspace(1) %183, align 8
  %184 = getelementptr inbounds float, ptr addrspace(1) %12, i64 3
  %185 = load float, ptr addrspace(1) %184, align 4, !invariant.load !99
  %186 = zext i32 %10 to i64
  %187 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg2110, i64 0, i64 %17, i64 %186
  %188 = getelementptr inbounds float, ptr addrspace(1) %187, i64 64
  %189 = load float, ptr addrspace(1) %188, align 4, !invariant.load !99
  br i1 %167, label %concatenate.pivot.0.72, label %concatenate.pivot.16.73

concatenate.pivot.0.72:                           ; preds = %concatenate.26.merge49
  %190 = shl nuw nsw i32 %7, 4
  %191 = add nuw nsw i32 %6, %190
  %192 = zext i32 %191 to i64
  %193 = getelementptr [131072 x [128 x float]], ptr addrspace(1) %arg4114, i64 0, i64 %192, i64 %186
  %194 = getelementptr inbounds float, ptr addrspace(1) %193, i64 64
  %195 = load float, ptr addrspace(1) %194, align 4, !invariant.load !99
  %196 = getelementptr [131072 x [168 x float]], ptr addrspace(1) %arg5116, i64 0, i64 %192, i64 %186
  %197 = getelementptr inbounds float, ptr addrspace(1) %196, i64 64
  %198 = load float, ptr addrspace(1) %197, align 4, !invariant.load !99
  %add.2068 = fadd float %195, %198
  %199 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %186
  %200 = getelementptr inbounds float, ptr addrspace(1) %199, i64 64
  %201 = load float, ptr addrspace(1) %200, align 4, !invariant.load !99
  %add.2469 = fadd float %add.2068, %201
  br label %concatenate.26.merge66

concatenate.pivot.16.73:                          ; preds = %concatenate.26.merge49
  %202 = getelementptr [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %186
  %203 = getelementptr inbounds float, ptr addrspace(1) %202, i64 64
  %204 = load float, ptr addrspace(1) %203, align 4, !invariant.load !99
  br label %concatenate.26.merge66

concatenate.26.merge66:                           ; preds = %concatenate.pivot.16.73, %concatenate.pivot.0.72
  %205 = phi float [ %add.2469, %concatenate.pivot.0.72 ], [ %204, %concatenate.pivot.16.73 ]
  %206 = icmp ult i32 %6, 16
  %207 = getelementptr inbounds float, ptr addrspace(1) %41, i64 3
  %208 = load float, ptr addrspace(1) %207, align 4, !invariant.load !99
  %209 = load float, ptr addrspace(1) %187, align 4, !invariant.load !99
  br i1 %206, label %concatenate.pivot.0.83, label %concatenate.pivot.16.84

concatenate.pivot.0.83:                           ; preds = %concatenate.26.merge66
  %210 = shl nuw nsw i32 %7, 4
  %211 = add nuw nsw i32 %6, %210
  %212 = zext i32 %211 to i64
  %213 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg4114, i64 0, i64 %212, i64 %186
  %214 = load float, ptr addrspace(1) %213, align 4, !invariant.load !99
  %215 = getelementptr inbounds [131072 x [168 x float]], ptr addrspace(1) %arg5116, i64 0, i64 %212, i64 %186
  %216 = load float, ptr addrspace(1) %215, align 4, !invariant.load !99
  %add.2079 = fadd float %214, %216
  %217 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %186
  %218 = load float, ptr addrspace(1) %217, align 4, !invariant.load !99
  %add.2480 = fadd float %add.2079, %218
  br label %concatenate.26.merge77

concatenate.pivot.16.84:                          ; preds = %concatenate.26.merge66
  %219 = getelementptr inbounds [819200 x [168 x float]], ptr addrspace(1) %arg3112, i64 0, i64 %17, i64 %186
  %220 = load float, ptr addrspace(1) %219, align 4, !invariant.load !99
  br label %concatenate.26.merge77

concatenate.26.merge77:                           ; preds = %concatenate.pivot.16.84, %concatenate.pivot.0.83
  %221 = phi float [ %add.2480, %concatenate.pivot.0.83 ], [ %220, %concatenate.pivot.16.84 ]
  %add.2874 = fadd float %189, %205
  %multiply.2975 = fmul float %14, %add.2874
  %subtract.3076 = fsub float %185, %multiply.2975
  %add.3385 = fadd float %209, %221
  %multiply.3486 = fmul float %14, %add.3385
  %subtract.3587 = fsub float %208, %multiply.3486
  %222 = getelementptr inbounds float, ptr addrspace(1) %58, i64 3
  %223 = load float, ptr addrspace(1) %222, align 4, !invariant.load !99
  %224 = getelementptr inbounds float, ptr addrspace(1) %60, i64 3
  %225 = load float, ptr addrspace(1) %224, align 4, !invariant.load !99
  %226 = getelementptr inbounds float, ptr addrspace(1) %62, i64 3
  %227 = load float, ptr addrspace(1) %226, align 4, !invariant.load !99
  %add.3688 = fadd float %225, %227
  %multiply.3789 = fmul float %14, %add.3688
  %subtract.3890 = fsub float %223, %multiply.3789
  %228 = getelementptr inbounds float, ptr addrspace(1) %64, i64 3
  %229 = load float, ptr addrspace(1) %228, align 4, !invariant.load !99
  %230 = getelementptr inbounds float, ptr addrspace(1) %66, i64 3
  %231 = load float, ptr addrspace(1) %230, align 4, !invariant.load !99
  %232 = getelementptr inbounds float, ptr addrspace(1) %68, i64 3
  %233 = load float, ptr addrspace(1) %232, align 4, !invariant.load !99
  %add.3991 = fadd float %231, %233
  %multiply.4092 = fmul float %14, %add.3991
  %subtract.4193 = fsub float %229, %multiply.4092
  %234 = getelementptr inbounds float, ptr addrspace(1) %70, i64 3
  store float %subtract.3076, ptr addrspace(1) %234, align 4
  %235 = getelementptr inbounds float, ptr addrspace(1) %71, i64 3
  store float %subtract.3587, ptr addrspace(1) %235, align 4
  %236 = getelementptr inbounds float, ptr addrspace(1) %72, i64 3
  store float %subtract.3890, ptr addrspace(1) %236, align 4
  %237 = getelementptr inbounds float, ptr addrspace(1) %73, i64 3
  store float %subtract.4193, ptr addrspace(1) %237, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_55(ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(655360000) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg5) local_unnamed_addr #0 {
entry:
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !131
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !98
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 6400
  %5 = urem i32 %linear_index3, 6400
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = urem i32 %linear_index2, 6400
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = urem i32 %linear_index1, 6400
  %8 = mul i32 %4, 6400
  %.decomposed = sub i32 %linear_index_base.frozen, %8
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg013, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !99
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = and i32 %.decomposed, 63
  %17 = lshr i32 %.decomposed, 6
  %18 = load float, ptr addrspace(1) %arg319, align 16, !invariant.load !99
  %19 = mul nuw nsw i32 %4, 100
  %20 = add nuw nsw i32 %17, %19
  %21 = zext i32 %20 to i64
  %22 = zext i32 %16 to i64
  %23 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg421, i64 0, i64 %21, i64 %22
  %24 = getelementptr inbounds float, ptr addrspace(1) %23, i64 136
  %25 = load float, ptr addrspace(1) %24, align 4, !invariant.load !99
  %26 = getelementptr float, ptr addrspace(1) %arg217, i64 %9
  %27 = load <4 x float>, ptr addrspace(1) %26, align 16, !invariant.load !99
  %28 = extractelement <4 x float> %27, i32 0
  %29 = extractelement <4 x float> %27, i32 1
  %30 = extractelement <4 x float> %27, i32 2
  %31 = extractelement <4 x float> %27, i32 3
  %add.9 = fadd float %25, %28
  %32 = getelementptr float, ptr addrspace(1) %arg115, i64 %9
  %33 = load <4 x float>, ptr addrspace(1) %32, align 16, !invariant.load !99
  %34 = extractelement <4 x float> %33, i32 0
  %35 = extractelement <4 x float> %33, i32 1
  %36 = extractelement <4 x float> %33, i32 2
  %37 = extractelement <4 x float> %33, i32 3
  %add.10 = fadd float %add.9, %34
  %multiply.11 = fmul float %18, %add.10
  %subtract.13 = fsub float %12, %multiply.11
  %38 = getelementptr float, ptr addrspace(1) %arg523, i64 %9
  %39 = and i32 %7, 63
  %40 = lshr i32 %7, 6
  %41 = add nuw nsw i32 %40, %19
  %42 = zext i32 %41 to i64
  %43 = zext i32 %39 to i64
  %44 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg421, i64 0, i64 %42, i64 %43
  %45 = getelementptr inbounds float, ptr addrspace(1) %44, i64 136
  %46 = load float, ptr addrspace(1) %45, align 4, !invariant.load !99
  %add.91 = fadd float %46, %29
  %add.102 = fadd float %add.91, %35
  %multiply.113 = fmul float %18, %add.102
  %subtract.134 = fsub float %13, %multiply.113
  %47 = and i32 %6, 63
  %48 = lshr i32 %6, 6
  %49 = add nuw nsw i32 %48, %19
  %50 = zext i32 %49 to i64
  %51 = zext i32 %47 to i64
  %52 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg421, i64 0, i64 %50, i64 %51
  %53 = getelementptr inbounds float, ptr addrspace(1) %52, i64 136
  %54 = load float, ptr addrspace(1) %53, align 4, !invariant.load !99
  %add.95 = fadd float %54, %30
  %add.106 = fadd float %add.95, %36
  %multiply.117 = fmul float %18, %add.106
  %subtract.138 = fsub float %14, %multiply.117
  %55 = and i32 %5, 63
  %56 = lshr i32 %5, 6
  %57 = add nuw nsw i32 %56, %19
  %58 = zext i32 %57 to i64
  %59 = zext i32 %55 to i64
  %60 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg421, i64 0, i64 %58, i64 %59
  %61 = getelementptr inbounds float, ptr addrspace(1) %60, i64 136
  %62 = load float, ptr addrspace(1) %61, align 4, !invariant.load !99
  %add.99 = fadd float %62, %31
  %add.1010 = fadd float %add.99, %37
  %multiply.1111 = fmul float %18, %add.1010
  %subtract.1312 = fsub float %15, %multiply.1111
  %63 = insertelement <4 x float> poison, float %subtract.13, i32 0
  %64 = insertelement <4 x float> %63, float %subtract.134, i32 1
  %65 = insertelement <4 x float> %64, float %subtract.138, i32 2
  %66 = insertelement <4 x float> %65, float %subtract.1312, i32 3
  store <4 x float> %66, ptr addrspace(1) %38, align 16
  ret void
}

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #5 = { nofree nosync nounwind memory(argmem: readwrite) }
attributes #6 = { nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95}
!llvm.module.flags = !{!96}

!0 = !{ptr @fusion_98, !"kernel", i32 1}
!1 = !{ptr @fusion_98, !"reqntidx", i32 256}
!2 = !{ptr @fusion_21, !"kernel", i32 1}
!3 = !{ptr @fusion_21, !"reqntidx", i32 128}
!4 = !{ptr @fusion_97, !"kernel", i32 1}
!5 = !{ptr @fusion_97, !"reqntidx", i32 96}
!6 = !{ptr @fusion_93, !"kernel", i32 1}
!7 = !{ptr @fusion_93, !"reqntidx", i32 96}
!8 = !{ptr @fusion_92, !"kernel", i32 1}
!9 = !{ptr @fusion_92, !"reqntidx", i32 256}
!10 = !{ptr @fusion_95, !"kernel", i32 1}
!11 = !{ptr @fusion_95, !"reqntidx", i32 1024}
!12 = !{ptr @fusion_52, !"kernel", i32 1}
!13 = !{ptr @fusion_52, !"reqntidx", i32 32}
!14 = !{ptr @fusion_84, !"kernel", i32 1}
!15 = !{ptr @fusion_84, !"reqntidx", i32 96}
!16 = !{ptr @fusion_78, !"kernel", i32 1}
!17 = !{ptr @fusion_78, !"reqntidx", i32 1024}
!18 = !{ptr @fusion_77, !"kernel", i32 1}
!19 = !{ptr @fusion_77, !"reqntidx", i32 4}
!20 = !{ptr @fusion_91, !"kernel", i32 1}
!21 = !{ptr @fusion_91, !"reqntidx", i32 1024}
!22 = !{ptr @fusion_90, !"kernel", i32 1}
!23 = !{ptr @fusion_90, !"reqntidx", i32 4}
!24 = !{ptr @fusion_86, !"kernel", i32 1}
!25 = !{ptr @fusion_86, !"reqntidx", i32 96}
!26 = !{ptr @fusion_85, !"kernel", i32 1}
!27 = !{ptr @fusion_85, !"reqntidx", i32 256}
!28 = !{ptr @fusion_48, !"kernel", i32 1}
!29 = !{ptr @fusion_48, !"reqntidx", i32 1024}
!30 = !{ptr @fusion_101, !"kernel", i32 1}
!31 = !{ptr @fusion_101, !"reqntidx", i32 1024}
!32 = !{ptr @fusion_88, !"kernel", i32 1}
!33 = !{ptr @fusion_88, !"reqntidx", i32 168}
!34 = !{ptr @fusion_46, !"kernel", i32 1}
!35 = !{ptr @fusion_46, !"reqntidx", i32 1024}
!36 = !{ptr @fusion_44, !"kernel", i32 1}
!37 = !{ptr @fusion_44, !"reqntidx", i32 1024}
!38 = !{ptr @fusion_38, !"kernel", i32 1}
!39 = !{ptr @fusion_38, !"reqntidx", i32 1024}
!40 = !{ptr @reduce_541, !"kernel", i32 1}
!41 = !{ptr @reduce_541, !"reqntidx", i32 1024}
!42 = !{ptr @fusion_37, !"kernel", i32 1}
!43 = !{ptr @fusion_37, !"reqntidx", i32 128}
!44 = !{ptr @fusion_36, !"kernel", i32 1}
!45 = !{ptr @fusion_36, !"reqntidx", i32 1024}
!46 = !{ptr @fusion_104, !"kernel", i32 1}
!47 = !{ptr @fusion_104, !"reqntidx", i32 1024}
!48 = !{ptr @fusion_43, !"kernel", i32 1}
!49 = !{ptr @fusion_43, !"reqntidx", i32 256}
!50 = !{ptr @fusion_96, !"kernel", i32 1}
!51 = !{ptr @fusion_96, !"reqntidx", i32 1024}
!52 = !{ptr @fusion_28, !"kernel", i32 1}
!53 = !{ptr @fusion_28, !"reqntidx", i32 256}
!54 = !{ptr @fusion_27, !"kernel", i32 1}
!55 = !{ptr @fusion_27, !"reqntidx", i32 256}
!56 = !{ptr @fusion_26, !"kernel", i32 1}
!57 = !{ptr @fusion_26, !"reqntidx", i32 1024}
!58 = !{ptr @fusion_25, !"kernel", i32 1}
!59 = !{ptr @fusion_25, !"reqntidx", i32 96}
!60 = !{ptr @fusion_24, !"kernel", i32 1}
!61 = !{ptr @fusion_24, !"reqntidx", i32 256}
!62 = !{ptr @fusion_23, !"kernel", i32 1}
!63 = !{ptr @fusion_23, !"reqntidx", i32 1024}
!64 = !{ptr @reduce_615, !"kernel", i32 1}
!65 = !{ptr @reduce_615, !"reqntidx", i32 1024}
!66 = !{ptr @fusion_22, !"kernel", i32 1}
!67 = !{ptr @fusion_22, !"reqntidx", i32 16}
!68 = !{ptr @fusion_19, !"kernel", i32 1}
!69 = !{ptr @fusion_19, !"reqntidx", i32 512}
!70 = !{ptr @fusion_18, !"kernel", i32 1}
!71 = !{ptr @fusion_18, !"reqntidx", i32 256}
!72 = !{ptr @fusion_15, !"kernel", i32 1}
!73 = !{ptr @fusion_15, !"reqntidx", i32 256}
!74 = !{ptr @fusion_16, !"kernel", i32 1}
!75 = !{ptr @fusion_16, !"reqntidx", i32 1024}
!76 = !{ptr @fusion_10, !"kernel", i32 1}
!77 = !{ptr @fusion_10, !"reqntidx", i32 256}
!78 = !{ptr @fusion_11, !"kernel", i32 1}
!79 = !{ptr @fusion_11, !"reqntidx", i32 1024}
!80 = !{ptr @fusion_60, !"kernel", i32 1}
!81 = !{ptr @fusion_60, !"reqntidx", i32 1024}
!82 = !{ptr @fusion_59, !"kernel", i32 1}
!83 = !{ptr @fusion_59, !"reqntidx", i32 1024}
!84 = !{ptr @fusion_56, !"kernel", i32 1}
!85 = !{ptr @fusion_56, !"reqntidx", i32 1024}
!86 = !{ptr @fusion_57, !"kernel", i32 1}
!87 = !{ptr @fusion_57, !"reqntidx", i32 256}
!88 = !{ptr @fusion_54, !"kernel", i32 1}
!89 = !{ptr @fusion_54, !"reqntidx", i32 256}
!90 = !{ptr @fusion, !"kernel", i32 1}
!91 = !{ptr @fusion, !"reqntidx", i32 256}
!92 = !{ptr @fusion_1, !"kernel", i32 1}
!93 = !{ptr @fusion_1, !"reqntidx", i32 256}
!94 = !{ptr @fusion_55, !"kernel", i32 1}
!95 = !{ptr @fusion_55, !"reqntidx", i32 256}
!96 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!97 = !{i32 0, i32 2048}
!98 = !{i32 0, i32 256}
!99 = !{}
!100 = !{i32 0, i32 8192}
!101 = !{i32 0, i32 128}
!102 = !{i32 0, i32 96}
!103 = !{i32 0, i32 1092267}
!104 = !{i32 0, i32 10923}
!105 = !{i32 0, i32 3200}
!106 = !{i32 0, i32 10}
!107 = !{i32 0, i32 1024}
!108 = !{i32 0, i32 32}
!109 = !{i32 0, i32 131072}
!110 = !{i32 0, i32 4}
!111 = !{i32 0, i32 64}
!112 = !{i32 0, i32 34134}
!113 = !{i32 0, i32 800}
!114 = !{i32 0, i32 1536}
!115 = !{i32 0, i32 3}
!116 = !{i32 0, i32 6}
!117 = !{i32 0, i32 168}
!118 = !{i32 0, i32 42}
!119 = !{i32 0, i32 512}
!120 = !{i32 0, i32 2}
!121 = !{i32 0, i32 16384}
!122 = !{i32 0, i32 21}
!123 = !{i32 0, i32 43691}
!124 = !{i32 0, i32 4096}
!125 = !{i32 0, i32 16}
!126 = !{i32 0, i32 8}
!127 = !{i32 0, i32 32768}
!128 = !{i32 0, i32 50}
!129 = !{i32 0, i32 242}
!130 = !{i32 0, i32 6400}
!131 = !{i32 0, i32 51200}
