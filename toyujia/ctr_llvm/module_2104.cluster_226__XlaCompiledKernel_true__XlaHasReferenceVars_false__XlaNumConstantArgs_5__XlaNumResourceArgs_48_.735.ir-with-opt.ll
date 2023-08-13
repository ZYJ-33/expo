target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@buffer_for_constant_4 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@shared_cache2 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache4 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache5 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache6 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache7 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache8 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache9 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache10 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache11 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache12 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache13 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache14 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache15 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache16 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache17 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef

; Function Attrs: nounwind
define void @fusion_71(ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(16384) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(16384) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg7) local_unnamed_addr #0 {
entry:
  %arg7285 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6283 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5281 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4279 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3277 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2275 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1273 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0271 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !75
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
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
  %Arg_3.46 = load float, ptr addrspace(1) %Arg_3.4, align 8, !invariant.load !77
  %compare.7 = fcmp ogt float %Arg_3.46, 0.000000e+00
  %Arg_2.3 = getelementptr inbounds [8192 x [1 x float]], ptr addrspace(1) %arg2275, i64 0, i64 %24, i64 0
  %Arg_2.37 = load float, ptr addrspace(1) %Arg_2.3, align 4, !invariant.load !77
  %Arg_1.2 = getelementptr inbounds [8192 x [1 x float]], ptr addrspace(1) %arg1273, i64 0, i64 %24, i64 0
  %Arg_1.28 = load float, ptr addrspace(1) %Arg_1.2, align 4, !invariant.load !77
  %multiply.8 = fmul float %Arg_2.37, %Arg_1.28
  %subtract.11 = fsub float 1.000000e+00, %Arg_1.28
  %multiply.12 = fmul float %multiply.8, %subtract.11
  %Arg_0.1 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg0271, i64 0, i64 %24, i64 %4
  %Arg_0.111 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !77
  %multiply.15 = fmul float %Arg_0.111, %multiply.12
  %25 = select i1 %compare.7, float %multiply.15, float 0.000000e+00
  %add.22.i = fadd float %partial_reduction_result216.sroa.0.0265, %25
  %compare.24 = fcmp ogt float %Arg_0.111, 0.000000e+00
  %multiply.25 = fmul float %Arg_3.46, %multiply.12
  %26 = select i1 %compare.24, float %multiply.25, float 0.000000e+00
  %add.31.i = fadd float %partial_reduction_result2215.sroa.0.0263, %26
  %scevgep302 = getelementptr i8, ptr addrspace(1) %arg3277, i64 %lsr.iv300
  %Arg_3.429 = load float, ptr addrspace(1) %scevgep302, align 8, !invariant.load !77
  %compare.731 = fcmp ogt float %Arg_3.429, 0.000000e+00
  %scevgep303 = getelementptr i8, ptr addrspace(1) %arg0271, i64 %lsr.iv300
  %Arg_0.143 = load float, ptr addrspace(1) %scevgep303, align 8, !invariant.load !77
  %multiply.1544 = fmul float %multiply.12, %Arg_0.143
  %27 = select i1 %compare.731, float %multiply.1544, float 0.000000e+00
  %compare.2448 = fcmp ogt float %Arg_0.143, 0.000000e+00
  %multiply.2561 = fmul float %multiply.12, %Arg_3.429
  %28 = select i1 %compare.2448, float %multiply.2561, float 0.000000e+00
  %29 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg5281, i64 0, i64 %24, i64 %4
  store float %27, ptr addrspace(1) %29, align 8
  %30 = getelementptr inbounds [8192 x [64 x float]], ptr addrspace(1) %arg7285, i64 0, i64 %24, i64 %4
  store float %28, ptr addrspace(1) %30, align 8
  %31 = add i32 %16, %lsr.iv
  %32 = and i32 %31, 67108736
  %33 = or i32 %32, %20
  %34 = zext i32 %33 to i64
  %35 = getelementptr [8192 x [64 x float]], ptr addrspace(1) %arg3277, i64 0, i64 %34, i64 %4
  %Arg_3.465287 = getelementptr inbounds float, ptr addrspace(1) %35, i64 1
  %Arg_3.466 = load float, ptr addrspace(1) %Arg_3.465287, align 4, !invariant.load !77
  %compare.768 = fcmp ogt float %Arg_3.466, 0.000000e+00
  %Arg_2.369 = getelementptr inbounds [8192 x [1 x float]], ptr addrspace(1) %arg2275, i64 0, i64 %34, i64 0
  %Arg_2.370 = load float, ptr addrspace(1) %Arg_2.369, align 4, !invariant.load !77
  %Arg_1.271 = getelementptr inbounds [8192 x [1 x float]], ptr addrspace(1) %arg1273, i64 0, i64 %34, i64 0
  %Arg_1.272 = load float, ptr addrspace(1) %Arg_1.271, align 4, !invariant.load !77
  %multiply.873 = fmul float %Arg_2.370, %Arg_1.272
  %subtract.1177 = fsub float 1.000000e+00, %Arg_1.272
  %multiply.1278 = fmul float %multiply.873, %subtract.1177
  %36 = getelementptr [8192 x [64 x float]], ptr addrspace(1) %arg0271, i64 0, i64 %34, i64 %4
  %Arg_0.179288 = getelementptr inbounds float, ptr addrspace(1) %36, i64 1
  %Arg_0.180 = load float, ptr addrspace(1) %Arg_0.179288, align 4, !invariant.load !77
  %multiply.1581 = fmul float %Arg_0.180, %multiply.1278
  %37 = select i1 %compare.768, float %multiply.1581, float 0.000000e+00
  %add.22.i241 = fadd float %partial_reduction_result216.sroa.4.0264, %37
  %compare.2486 = fcmp ogt float %Arg_0.180, 0.000000e+00
  %multiply.2599 = fmul float %Arg_3.466, %multiply.1278
  %38 = select i1 %compare.2486, float %multiply.2599, float 0.000000e+00
  %add.31.i242 = fadd float %partial_reduction_result2215.sroa.4.0266, %38
  %scevgep299 = getelementptr i8, ptr addrspace(1) %arg3277, i64 %lsr.iv297
  %Arg_3.4102 = load float, ptr addrspace(1) %scevgep299, align 4, !invariant.load !77
  %compare.7104 = fcmp ogt float %Arg_3.4102, 0.000000e+00
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0271, i64 %lsr.iv297
  %Arg_0.1116 = load float, ptr addrspace(1) %scevgep, align 4, !invariant.load !77
  %multiply.15117 = fmul float %multiply.1278, %Arg_0.1116
  %39 = select i1 %compare.7104, float %multiply.15117, float 0.000000e+00
  %compare.24121 = fcmp ogt float %Arg_0.1116, 0.000000e+00
  %multiply.25134 = fmul float %multiply.1278, %Arg_3.4102
  %40 = select i1 %compare.24121, float %multiply.25134, float 0.000000e+00
  %41 = getelementptr [8192 x [64 x float]], ptr addrspace(1) %arg5281, i64 0, i64 %34, i64 %4
  %42 = getelementptr inbounds float, ptr addrspace(1) %41, i64 1
  store float %39, ptr addrspace(1) %42, align 4
  %43 = getelementptr [8192 x [64 x float]], ptr addrspace(1) %arg7285, i64 0, i64 %34, i64 %4
  %44 = getelementptr inbounds float, ptr addrspace(1) %43, i64 1
  store float %40, ptr addrspace(1) %44, align 4
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
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache, i64 0, i64 0, i64 0, i64 %48, i64 %49
  store float %add.22.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache, i64 0, i64 0, i64 0, i64 %49, i64 %48
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
  %shmem_output_address171 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache1, i64 0, i64 0, i64 0, i64 %48, i64 %49
  store float %add.31.i, ptr addrspace(3) %shmem_output_address171, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr173 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache1, i64 0, i64 0, i64 0, i64 %49, i64 %48
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #3

; Function Attrs: nounwind
define void @fusion_79(ptr noalias nocapture readonly align 128 dereferenceable(16384) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16384) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(256) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(256) %arg4) local_unnamed_addr #0 {
entry:
  %arg4196 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3194 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2192 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1190 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0188 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !78
  %trunc.not = icmp eq i32 %0, 0
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %thread_id.x = and i32 %1, 31
  %thread_id.y131 = lshr i32 %1, 5
  %Arg_1.2 = load float, ptr addrspace(1) %arg1190, align 128, !invariant.load !77
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
  %21 = load <2 x float>, ptr addrspace(1) %scevgep209, align 8, !invariant.load !77
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
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %23, i64 %24
  store float %add.7.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %24, i64 %23
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
  %39 = load <2 x float>, ptr addrspace(1) %scevgep215, align 8, !invariant.load !77
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
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %41, i64 %42
  store float %add.12.i, ptr addrspace(3) %shmem_output_address81, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %42, i64 %41
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
define void @fusion_73(ptr noalias nocapture readonly align 16 dereferenceable(256) %arg0, ptr noalias nocapture align 128 dereferenceable(256) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(256) %arg3, ptr noalias nocapture align 128 dereferenceable(256) %arg4) local_unnamed_addr #4 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !77
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.7 = fmul float %4, %6
  %subtract.8 = fsub float %3, %multiply.7
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %1
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !77
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %1
  %10 = load float, ptr addrspace(1) %9, align 4
  %multiply.9 = fmul float %4, %10
  %subtract.10 = fsub float %8, %multiply.9
  store float %subtract.8, ptr addrspace(1) %9, align 4
  store float %subtract.10, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_69(ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg0, ptr noalias nocapture align 128 dereferenceable(32768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg3, ptr noalias nocapture align 128 dereferenceable(32768) %arg4) local_unnamed_addr #4 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !79
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !77
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.7 = fmul float %6, %8
  %subtract.8 = fsub float %5, %multiply.7
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !77
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4
  %multiply.9 = fmul float %6, %12
  %subtract.10 = fsub float %10, %multiply.9
  store float %subtract.8, ptr addrspace(1) %11, align 4
  store float %subtract.10, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_66(ptr noalias nocapture readonly align 128 dereferenceable(4194304) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg3) local_unnamed_addr #0 {
entry:
  %arg397 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg295 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg193 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg091 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !80
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
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
  %Arg_1.23 = load float, ptr addrspace(1) %Arg_1.2, align 8, !invariant.load !77
  %compare.5 = fcmp ogt float %Arg_1.23, 0.000000e+00
  %Arg_0.1 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg091, i64 0, i64 %23, i64 %24
  %Arg_0.14 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !77
  %25 = select i1 %compare.5, float %Arg_0.14, float 0.000000e+00
  %add.12.i = fadd float %partial_reduction_result63.sroa.0.087, %25
  %scevgep108 = getelementptr i8, ptr addrspace(1) %lsr.iv106, i64 -4
  %26 = load <2 x float>, ptr addrspace(1) %scevgep108, align 8, !invariant.load !77
  %Arg_1.26113 = extractelement <2 x float> %26, i32 0
  %Arg_1.222114 = extractelement <2 x float> %26, i32 1
  %compare.58 = fcmp ogt float %Arg_1.26113, 0.000000e+00
  %scevgep112 = getelementptr i8, ptr addrspace(1) %lsr.iv110, i64 -4
  %27 = load <2 x float>, ptr addrspace(1) %scevgep112, align 8, !invariant.load !77
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
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !77
  %compare.517 = fcmp ogt float %Arg_1.215, 0.000000e+00
  %Arg_0.118 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg091, i64 0, i64 %35, i64 %36
  %Arg_0.119 = load float, ptr addrspace(1) %Arg_0.118, align 4, !invariant.load !77
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
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i64 0, i64 0, i64 0, i64 %43, i64 %44
  store float %add.12.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i64 0, i64 0, i64 0, i64 %44, i64 %43
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
define void @fusion_81(ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(512) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(512) %arg4) local_unnamed_addr #0 {
entry:
  %arg4197 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3195 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2193 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1191 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0189 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !78
  %trunc.not = icmp eq i32 %0, 0
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !78
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %thread_id.x = and i32 %2, 31
  %thread_id.y131 = lshr i32 %2, 5
  %tile_origin.2 = shl nuw nsw i32 %1, 6
  %Arg_1.2 = load float, ptr addrspace(1) %arg1191, align 128, !invariant.load !77
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
  %21 = load <2 x float>, ptr addrspace(1) %scevgep209, align 8, !invariant.load !77
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
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i64 0, i64 0, i64 0, i64 %23, i64 %24
  store float %add.7.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i64 0, i64 0, i64 0, i64 %24, i64 %23
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
  %40 = load <2 x float>, ptr addrspace(1) %scevgep215, align 8, !invariant.load !77
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
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache6, i64 0, i64 0, i64 0, i64 %42, i64 %43
  store float %add.12.i, ptr addrspace(3) %shmem_output_address81, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache6, i64 0, i64 0, i64 0, i64 %43, i64 %42
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
define void @fusion_65(ptr noalias nocapture readonly align 16 dereferenceable(512) %arg0, ptr noalias nocapture align 128 dereferenceable(512) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(512) %arg3, ptr noalias nocapture align 128 dereferenceable(512) %arg4) local_unnamed_addr #4 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !80
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !77
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.7 = fmul float %4, %6
  %subtract.8 = fsub float %3, %multiply.7
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %1
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !77
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %1
  %10 = load float, ptr addrspace(1) %9, align 4
  %multiply.9 = fmul float %4, %10
  %subtract.10 = fsub float %8, %multiply.9
  store float %subtract.8, ptr addrspace(1) %9, align 4
  store float %subtract.10, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_61(ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg0, ptr noalias nocapture align 128 dereferenceable(65536) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg3, ptr noalias nocapture align 128 dereferenceable(65536) %arg4) local_unnamed_addr #4 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !81
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !77
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.7 = fmul float %6, %8
  %subtract.8 = fsub float %5, %multiply.7
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !77
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4
  %multiply.9 = fmul float %6, %12
  %subtract.10 = fsub float %10, %multiply.9
  store float %subtract.8, ptr addrspace(1) %11, align 4
  store float %subtract.10, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_58(ptr noalias nocapture readonly align 16 dereferenceable(27262976) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(27262976) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(425984) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(425984) %arg6) local_unnamed_addr #0 {
entry:
  %arg6151 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5149 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4147 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3145 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2143 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1141 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0139 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !78
  %trunc.not = icmp eq i32 %0, 0
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !82
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !83
  %3 = and i32 %1, 31
  %4 = lshr i32 %1, 5
  %5 = mul nuw nsw i32 %2, 3
  %6 = add nuw nsw i32 %5, %4
  br i1 %trunc.not, label %reduce-group-0-true, label %reduce-group-1-true

common.ret.sink.split:                            ; preds = %intra_warp_reduce_write-after99, %intra_warp_reduce_write-after
  %.pre-phi165 = phi i64 [ %42, %intra_warp_reduce_write-after99 ], [ %16, %intra_warp_reduce_write-after ]
  %.pre-phi163 = phi i32 [ %38, %intra_warp_reduce_write-after99 ], [ %12, %intra_warp_reduce_write-after ]
  %.pre-phi = phi i64 [ %63, %intra_warp_reduce_write-after99 ], [ %32, %intra_warp_reduce_write-after ]
  %shared_cache7.sink = phi ptr addrspace(3) [ @shared_cache7, %intra_warp_reduce_write-after ], [ @shared_cache8, %intra_warp_reduce_write-after99 ]
  %arg5.sink = phi ptr addrspace(1) [ %arg5149, %intra_warp_reduce_write-after ], [ %arg6151, %intra_warp_reduce_write-after99 ]
  %7 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) %shared_cache7.sink, i64 0, i64 %.pre-phi, i64 0, i64 0
  %8 = zext i32 %.pre-phi163 to i64
  %output_element_address = getelementptr inbounds [8192 x [13 x float]], ptr addrspace(1) %arg5.sink, i64 0, i64 %.pre-phi165, i64 %8
  %output.then.val = load float, ptr addrspace(3) %7, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret

common.ret:                                       ; preds = %common.ret.sink.split, %intra_warp_reduce_write-after, %intra_warp_reduce_write-after99, %reduce-group-1-true, %reduce-group-0-true
  ret void

reduce-group-0-true:                              ; preds = %entry
  %9 = icmp ult i32 %6, 106496
  br i1 %9, label %tile_loop.loop_header6.preheader, label %common.ret

tile_loop.loop_header6.preheader:                 ; preds = %reduce-group-0-true
  %10 = shl nuw nsw i32 %6, 6
  %11 = or i32 %3, %10
  %12 = urem i32 %6, 13
  %13 = udiv i32 %6, 13
  %14 = shl nuw nsw i32 %12, 6
  %15 = or i32 %14, %3
  %16 = zext i32 %13 to i64
  %17 = zext i32 %15 to i64
  %Arg_1.212 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg1141, i64 0, i64 %16, i64 %17
  %Arg_1.213 = load float, ptr addrspace(1) %Arg_1.212, align 4, !invariant.load !77
  %18 = zext i32 %11 to i64
  %Arg_0.114 = getelementptr inbounds float, ptr addrspace(1) %arg0139, i64 %18
  %Arg_0.115 = load float, ptr addrspace(1) %Arg_0.114, align 4, !invariant.load !77
  %multiply.816 = fmul float %Arg_1.213, %Arg_0.115
  %add.13.i124 = fadd float %multiply.816, 0.000000e+00
  %19 = zext i32 %14 to i64
  %20 = zext i32 %3 to i64
  %21 = add i64 %19, %20
  %22 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg1141, i64 0, i64 %16, i64 %21
  %Arg_1.212.1154 = getelementptr inbounds float, ptr addrspace(1) %22, i64 32
  %Arg_1.213.1 = load float, ptr addrspace(1) %Arg_1.212.1154, align 4, !invariant.load !77
  %23 = zext i32 %10 to i64
  %24 = add i64 %20, %23
  %25 = getelementptr float, ptr addrspace(1) %arg0139, i64 %24
  %Arg_0.114.1156 = getelementptr inbounds float, ptr addrspace(1) %25, i64 32
  %Arg_0.115.1 = load float, ptr addrspace(1) %Arg_0.114.1156, align 4, !invariant.load !77
  %multiply.816.1 = fmul float %Arg_1.213.1, %Arg_0.115.1
  %add.13.i124.1 = fadd float %add.13.i124, %multiply.816.1
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i124.1, i32 16, i32 31)
  %add.13.i = fadd float %add.13.i124.1, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i, i32 8, i32 31)
  %add.13.i120 = fadd float %add.13.i, %27
  %28 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i120, i32 4, i32 31)
  %add.13.i121 = fadd float %add.13.i120, %28
  %29 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i121, i32 2, i32 31)
  %add.13.i122 = fadd float %add.13.i121, %29
  %30 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i122, i32 1, i32 31)
  %31 = icmp eq i32 %3, 0
  %32 = zext i32 %4 to i64
  %33 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache7, i64 0, i64 %32, i64 0, i64 0
  %add.13.i123 = fadd float %add.13.i122, %30
  br i1 %31, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %tile_loop.loop_header6.preheader
  %34 = icmp eq i32 %3, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %34, label %common.ret.sink.split, label %common.ret

intra_warp_reduce_write-true:                     ; preds = %tile_loop.loop_header6.preheader
  store float %add.13.i123, ptr addrspace(3) %33, align 4
  br label %intra_warp_reduce_write-after

reduce-group-1-true:                              ; preds = %entry
  %35 = icmp ult i32 %6, 106496
  br i1 %35, label %tile_loop.loop_header65.preheader, label %common.ret

tile_loop.loop_header65.preheader:                ; preds = %reduce-group-1-true
  %36 = shl nuw nsw i32 %6, 6
  %37 = or i32 %3, %36
  %38 = urem i32 %6, 13
  %39 = udiv i32 %6, 13
  %40 = shl nuw nsw i32 %38, 6
  %41 = or i32 %40, %3
  %42 = zext i32 %39 to i64
  %43 = zext i32 %41 to i64
  %Arg_3.473 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg3145, i64 0, i64 %42, i64 %43
  %Arg_3.474 = load float, ptr addrspace(1) %Arg_3.473, align 4, !invariant.load !77
  %Arg_4.575 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg4147, i64 0, i64 %42, i64 %43
  %Arg_4.576 = load float, ptr addrspace(1) %Arg_4.575, align 4, !invariant.load !77
  %add.1577 = fadd float %Arg_3.474, %Arg_4.576
  %44 = zext i32 %37 to i64
  %Arg_2.378 = getelementptr inbounds float, ptr addrspace(1) %arg2143, i64 %44
  %Arg_2.379 = load float, ptr addrspace(1) %Arg_2.378, align 4, !invariant.load !77
  %multiply.1880 = fmul float %add.1577, %Arg_2.379
  %add.22.i129 = fadd float %multiply.1880, 0.000000e+00
  %.frozen = freeze i32 %6
  %45 = udiv i32 %.frozen, 13
  %46 = mul i32 %45, 13
  %.decomposed = sub i32 %.frozen, %46
  %47 = shl nuw nsw i32 %.decomposed, 6
  %48 = zext i32 %45 to i64
  %49 = zext i32 %47 to i64
  %50 = zext i32 %3 to i64
  %51 = add i64 %49, %50
  %52 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg3145, i64 0, i64 %48, i64 %51
  %Arg_3.473.1158 = getelementptr inbounds float, ptr addrspace(1) %52, i64 32
  %Arg_3.474.1 = load float, ptr addrspace(1) %Arg_3.473.1158, align 4, !invariant.load !77
  %53 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg4147, i64 0, i64 %48, i64 %51
  %Arg_4.575.1160 = getelementptr inbounds float, ptr addrspace(1) %53, i64 32
  %Arg_4.576.1 = load float, ptr addrspace(1) %Arg_4.575.1160, align 4, !invariant.load !77
  %add.1577.1 = fadd float %Arg_3.474.1, %Arg_4.576.1
  %54 = zext i32 %36 to i64
  %55 = add i64 %50, %54
  %56 = getelementptr float, ptr addrspace(1) %arg2143, i64 %55
  %Arg_2.378.1162 = getelementptr inbounds float, ptr addrspace(1) %56, i64 32
  %Arg_2.379.1 = load float, ptr addrspace(1) %Arg_2.378.1162, align 4, !invariant.load !77
  %multiply.1880.1 = fmul float %add.1577.1, %Arg_2.379.1
  %add.22.i129.1 = fadd float %add.22.i129, %multiply.1880.1
  %57 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i129.1, i32 16, i32 31)
  %add.22.i = fadd float %add.22.i129.1, %57
  %58 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i, i32 8, i32 31)
  %add.22.i125 = fadd float %add.22.i, %58
  %59 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i125, i32 4, i32 31)
  %add.22.i126 = fadd float %add.22.i125, %59
  %60 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i126, i32 2, i32 31)
  %add.22.i127 = fadd float %add.22.i126, %60
  %61 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i127, i32 1, i32 31)
  %62 = icmp eq i32 %3, 0
  %63 = zext i32 %4 to i64
  %64 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache8, i64 0, i64 %63, i64 0, i64 0
  %add.22.i128 = fadd float %add.22.i127, %61
  br i1 %62, label %intra_warp_reduce_write-true98, label %intra_warp_reduce_write-after99

intra_warp_reduce_write-after99:                  ; preds = %intra_warp_reduce_write-true98, %tile_loop.loop_header65.preheader
  %65 = icmp eq i32 %3, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %65, label %common.ret.sink.split, label %common.ret

intra_warp_reduce_write-true98:                   ; preds = %tile_loop.loop_header65.preheader
  store float %add.22.i128, ptr addrspace(3) %64, align 4
  br label %intra_warp_reduce_write-after99
}

; Function Attrs: nounwind memory(write, argmem: readwrite, inaccessiblemem: readwrite)
define void @fusion_56(ptr noalias nocapture readonly align 16 dereferenceable(4456448) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4456448) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(557056) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(557056) %arg6) local_unnamed_addr #5 {
entry:
  %arg6124 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5122 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4120 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3118 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2116 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0112 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !78
  %trunc.not = icmp eq i32 %0, 0
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !82
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !84
  %3 = and i32 %1, 7
  %4 = lshr i32 %1, 3
  %5 = mul nuw nsw i32 %2, 12
  %6 = add nuw nsw i32 %5, %4
  br i1 %trunc.not, label %reduce-group-0-true, label %reduce-group-1-true

common.ret.sink.split:                            ; preds = %reduction_write_output-true86, %reduction_write_output-true
  %.pre-phi132 = phi i64 [ %.pre131, %reduction_write_output-true86 ], [ %14, %reduction_write_output-true ]
  %.pre-phi = phi i32 [ %.pre, %reduction_write_output-true86 ], [ %11, %reduction_write_output-true ]
  %arg5.sink = phi ptr addrspace(1) [ %arg5122, %reduction_write_output-true ], [ %arg6124, %reduction_write_output-true86 ]
  %add.13.i100.sink = phi float [ %add.13.i100, %reduction_write_output-true ], [ %add.22.i103, %reduction_write_output-true86 ]
  %7 = zext i32 %.pre-phi to i64
  %output_element_address = getelementptr inbounds [8192 x [17 x float]], ptr addrspace(1) %arg5.sink, i64 0, i64 %.pre-phi132, i64 %7
  store float %add.13.i100.sink, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret

common.ret:                                       ; preds = %common.ret.sink.split, %x_in_tile-true, %reduce-group-1-true, %x_in_tile-true65, %reduce-group-0-true
  ret void

reduce-group-0-true:                              ; preds = %entry
  %8 = icmp ult i32 %6, 139264
  br i1 %8, label %x_in_tile-true, label %common.ret

x_in_tile-true:                                   ; preds = %reduce-group-0-true
  %9 = shl nuw nsw i32 %6, 3
  %10 = or i32 %3, %9
  %11 = urem i32 %6, 17
  %12 = udiv i32 %6, 17
  %13 = shl nuw nsw i32 %11, 3
  %14 = zext i32 %12 to i64
  %15 = zext i32 %13 to i64
  %16 = zext i32 %3 to i64
  %17 = add i64 %16, %15
  %18 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg1114, i64 0, i64 %14, i64 %17
  %Arg_1.212126 = getelementptr inbounds float, ptr addrspace(1) %18, i64 832
  %Arg_1.213 = load float, ptr addrspace(1) %Arg_1.212126, align 4, !invariant.load !77
  %19 = zext i32 %10 to i64
  %Arg_0.114 = getelementptr inbounds float, ptr addrspace(1) %arg0112, i64 %19
  %Arg_0.115 = load float, ptr addrspace(1) %Arg_0.114, align 4, !invariant.load !77
  %multiply.816 = fmul float %Arg_1.213, %Arg_0.115
  %add.13.i101 = fadd float %multiply.816, 0.000000e+00
  %20 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i101, i32 4, i32 31)
  %add.13.i = fadd float %add.13.i101, %20
  %21 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i, i32 2, i32 31)
  %add.13.i99 = fadd float %add.13.i, %21
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i99, i32 1, i32 31)
  %23 = icmp eq i32 %3, 0
  br i1 %23, label %reduction_write_output-true, label %common.ret

reduction_write_output-true:                      ; preds = %x_in_tile-true
  %add.13.i100 = fadd float %add.13.i99, %22
  br label %common.ret.sink.split

reduce-group-1-true:                              ; preds = %entry
  %24 = icmp ult i32 %6, 139264
  br i1 %24, label %x_in_tile-true65, label %common.ret

x_in_tile-true65:                                 ; preds = %reduce-group-1-true
  %25 = shl nuw nsw i32 %6, 3
  %26 = or i32 %3, %25
  %.frozen = freeze i32 %6
  %27 = udiv i32 %.frozen, 17
  %28 = mul i32 %27, 17
  %.decomposed = sub i32 %.frozen, %28
  %29 = shl nuw nsw i32 %.decomposed, 3
  %30 = zext i32 %27 to i64
  %31 = zext i32 %29 to i64
  %32 = zext i32 %3 to i64
  %33 = add i64 %32, %31
  %34 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg3118, i64 0, i64 %30, i64 %33
  %Arg_3.467127 = getelementptr inbounds float, ptr addrspace(1) %34, i64 832
  %Arg_3.468 = load float, ptr addrspace(1) %Arg_3.467127, align 4, !invariant.load !77
  %35 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg4120, i64 0, i64 %30, i64 %33
  %Arg_4.569128 = getelementptr inbounds float, ptr addrspace(1) %35, i64 832
  %Arg_4.570 = load float, ptr addrspace(1) %Arg_4.569128, align 4, !invariant.load !77
  %add.1571 = fadd float %Arg_3.468, %Arg_4.570
  %36 = zext i32 %26 to i64
  %Arg_2.372 = getelementptr inbounds float, ptr addrspace(1) %arg2116, i64 %36
  %Arg_2.373 = load float, ptr addrspace(1) %Arg_2.372, align 4, !invariant.load !77
  %multiply.1874 = fmul float %add.1571, %Arg_2.373
  %add.22.i104 = fadd float %multiply.1874, 0.000000e+00
  %37 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i104, i32 4, i32 31)
  %add.22.i = fadd float %add.22.i104, %37
  %38 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i, i32 2, i32 31)
  %add.22.i102 = fadd float %add.22.i, %38
  %39 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i102, i32 1, i32 31)
  %40 = icmp eq i32 %3, 0
  br i1 %40, label %reduction_write_output-true86, label %common.ret

reduction_write_output-true86:                    ; preds = %x_in_tile-true65
  %add.22.i103 = fadd float %add.22.i102, %39
  %.pre = urem i32 %6, 17
  %.pre129 = udiv i32 %6, 17
  %.pre131 = zext i32 %.pre129 to i64
  br label %common.ret.sink.split
}

; Function Attrs: nounwind
define void @fusion_54(ptr noalias nocapture readonly align 16 dereferenceable(983040) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(425984) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(557056) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(983040) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(425984) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(557056) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(983040) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(7680) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(983040) %arg10) local_unnamed_addr #0 {
entry:
  %arg10152 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9150 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8148 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7146 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6144 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5142 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4140 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3138 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2136 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1134 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0132 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !75
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %thread_id.x = and i32 %1, 31
  %thread_id.y101 = lshr i32 %1, 5
  %2 = mul i32 %0, 3840
  %Arg_1.2 = load float, ptr addrspace(1) %arg1134, align 16
  %3 = add nuw nsw i32 %thread_id.y101, -32
  %4 = mul nuw nsw i32 %thread_id.y101, 30
  %5 = add i32 %2, %4
  %6 = add i32 %5, %thread_id.x
  %7 = zext i32 %6 to i64
  %8 = shl nuw nsw i64 %7, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0132, i64 %8
  %scevgep162 = getelementptr i8, ptr addrspace(1) %arg4140, i64 %8
  %scevgep165 = getelementptr i8, ptr addrspace(1) %arg8148, i64 %8
  %scevgep168 = getelementptr i8, ptr addrspace(1) %arg10152, i64 %8
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after, %reduction_write_output-true97
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %x_in_tile-after
  %lsr.iv169 = phi ptr addrspace(1) [ %scevgep168, %entry ], [ %scevgep170, %x_in_tile-after ]
  %lsr.iv166 = phi ptr addrspace(1) [ %scevgep165, %entry ], [ %scevgep167, %x_in_tile-after ]
  %lsr.iv163 = phi ptr addrspace(1) [ %scevgep162, %entry ], [ %scevgep164, %x_in_tile-after ]
  %lsr.iv160 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep161, %x_in_tile-after ]
  %lsr.iv158 = phi i32 [ %6, %entry ], [ %lsr.iv.next159, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %3, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result2.0125 = phi float [ -0.000000e+00, %entry ], [ %partial_reduction_result2.1, %x_in_tile-after ]
  %partial_reduction_result.0124 = phi float [ -0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %9 = icmp ult i32 %thread_id.x, 30
  br i1 %9, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %concatenate.23.merge45, %y_in_tile.loop_body
  %partial_reduction_result.1 = phi float [ %add.21.i122, %concatenate.23.merge45 ], [ %partial_reduction_result.0124, %y_in_tile.loop_body ]
  %partial_reduction_result2.1 = phi float [ %add.32.i123, %concatenate.23.merge45 ], [ %partial_reduction_result2.0125, %y_in_tile.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %lsr.iv.next159 = add nuw nsw i32 %lsr.iv158, 960
  %scevgep161 = getelementptr i8, ptr addrspace(1) %lsr.iv160, i64 3840
  %scevgep164 = getelementptr i8, ptr addrspace(1) %lsr.iv163, i64 3840
  %scevgep167 = getelementptr i8, ptr addrspace(1) %lsr.iv166, i64 3840
  %scevgep170 = getelementptr i8, ptr addrspace(1) %lsr.iv169, i64 3840
  %10 = icmp ugt i32 %lsr.iv.next, 95
  br i1 %10, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after
  %11 = zext i32 %thread_id.x to i64
  %12 = zext i32 %thread_id.y101 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i64 0, i64 0, i64 0, i64 %11, i64 %12
  store float %partial_reduction_result.1, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i64 0, i64 0, i64 0, i64 %12, i64 %11
  %partial_reduction_result65 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %13 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result65, i32 16, i32 31)
  %add.21.i = fadd float %partial_reduction_result65, %13
  %14 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.21.i, i32 8, i32 31)
  %add.21.i114 = fadd float %add.21.i, %14
  %15 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.21.i114, i32 4, i32 31)
  %add.21.i115 = fadd float %add.21.i114, %15
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.21.i115, i32 2, i32 31)
  %add.21.i116 = fadd float %add.21.i115, %16
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.21.i116, i32 1, i32 31)
  %add.21.i117 = fadd float %add.21.i116, %17
  store float %add.21.i117, ptr addrspace(3) %shmem_transposed_addr, align 4
  %18 = icmp ult i32 %1, 960
  %19 = icmp eq i32 %thread_id.x, 0
  %20 = and i1 %18, %19
  br i1 %20, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address79 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i64 0, i64 0, i64 0, i64 %11, i64 %12
  store float %partial_reduction_result2.1, ptr addrspace(3) %shmem_output_address79, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr81 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i64 0, i64 0, i64 0, i64 %12, i64 %11
  %partial_reduction_result83 = load float, ptr addrspace(3) %shmem_transposed_addr81, align 4
  %21 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result83, i32 16, i32 31)
  %add.32.i = fadd float %partial_reduction_result83, %21
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.32.i, i32 8, i32 31)
  %add.32.i118 = fadd float %add.32.i, %22
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.32.i118, i32 4, i32 31)
  %add.32.i119 = fadd float %add.32.i118, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.32.i119, i32 2, i32 31)
  %add.32.i120 = fadd float %add.32.i119, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.32.i120, i32 1, i32 31)
  %add.32.i121 = fadd float %add.32.i120, %25
  store float %add.32.i121, ptr addrspace(3) %shmem_transposed_addr81, align 4
  br i1 %20, label %reduction_write_output-true97, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %.frozen = freeze i32 %lsr.iv158
  %26 = udiv i32 %.frozen, 30
  %27 = mul i32 %26, 30
  %.decomposed = sub i32 %.frozen, %27
  %28 = icmp ult i32 %.decomposed, 13
  br i1 %28, label %concatenate.pivot.0., label %concatenate.pivot.13.8

concatenate.pivot.0.:                             ; preds = %x_in_tile-true
  %29 = mul nuw nsw i32 %26, 13
  %30 = add nuw nsw i32 %29, %.decomposed
  %31 = zext i32 %30 to i64
  %Arg_2.3 = getelementptr inbounds float, ptr addrspace(1) %arg2136, i64 %31
  br label %concatenate.8.merge

concatenate.pivot.13.8:                           ; preds = %x_in_tile-true
  %32 = mul nuw nsw i32 %26, 17
  %33 = sext i32 %32 to i64
  %34 = sext i32 %.decomposed to i64
  %35 = add i64 %34, %33
  %36 = getelementptr float, ptr addrspace(1) %arg3138, i64 %35
  %Arg_3.4154 = getelementptr inbounds float, ptr addrspace(1) %36, i64 -13
  br label %concatenate.8.merge

concatenate.8.merge:                              ; preds = %concatenate.pivot.13.8, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %Arg_2.3, %concatenate.pivot.0. ], [ %Arg_3.4154, %concatenate.pivot.13.8 ]
  %37 = icmp ult i32 %.decomposed, 13
  %38 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !77
  %multiply.10 = fmul float %38, %Arg_1.2
  %Arg_0.19 = load float, ptr addrspace(1) %lsr.iv160, align 4, !invariant.load !77
  %multiply.11 = fmul float %multiply.10, %Arg_0.19
  %subtract.14 = fsub float 1.000000e+00, %Arg_0.19
  %multiply.15 = fmul float %multiply.11, %subtract.14
  %add.21.i122 = fadd float %partial_reduction_result.0124, %multiply.15
  br i1 %37, label %concatenate.pivot.0.17, label %concatenate.pivot.13.18

concatenate.pivot.0.17:                           ; preds = %concatenate.8.merge
  %39 = mul nuw nsw i32 %26, 13
  %40 = add nuw nsw i32 %39, %.decomposed
  %41 = zext i32 %40 to i64
  %Arg_5.6 = getelementptr inbounds float, ptr addrspace(1) %arg5142, i64 %41
  br label %concatenate.23.merge

concatenate.pivot.13.18:                          ; preds = %concatenate.8.merge
  %42 = mul nuw nsw i32 %26, 17
  %43 = sext i32 %42 to i64
  %44 = sext i32 %.decomposed to i64
  %45 = add i64 %44, %43
  %46 = getelementptr float, ptr addrspace(1) %arg6144, i64 %45
  %Arg_6.7155 = getelementptr inbounds float, ptr addrspace(1) %46, i64 -13
  br label %concatenate.23.merge

concatenate.23.merge:                             ; preds = %concatenate.pivot.13.18, %concatenate.pivot.0.17
  %.in102 = phi ptr addrspace(1) [ %Arg_5.6, %concatenate.pivot.0.17 ], [ %Arg_6.7155, %concatenate.pivot.13.18 ]
  %47 = icmp ult i32 %.decomposed, 13
  %48 = load float, ptr addrspace(1) %.in102, align 4, !invariant.load !77
  %multiply.24 = fmul float %Arg_1.2, %48
  %Arg_4.520 = load float, ptr addrspace(1) %lsr.iv163, align 4, !invariant.load !77
  %multiply.25 = fmul float %multiply.24, %Arg_4.520
  %subtract.26 = fsub float 1.000000e+00, %Arg_4.520
  %multiply.27 = fmul float %multiply.25, %subtract.26
  %add.32.i123 = fadd float %partial_reduction_result2.0125, %multiply.27
  br i1 %47, label %concatenate.pivot.0.33, label %concatenate.pivot.13.34

concatenate.pivot.0.33:                           ; preds = %concatenate.23.merge
  %49 = mul nuw nsw i32 %26, 13
  %50 = add nuw nsw i32 %49, %.decomposed
  %51 = zext i32 %50 to i64
  %Arg_2.327 = getelementptr inbounds float, ptr addrspace(1) %arg2136, i64 %51
  br label %concatenate.8.merge25

concatenate.pivot.13.34:                          ; preds = %concatenate.23.merge
  %52 = mul nuw nsw i32 %26, 17
  %53 = sext i32 %52 to i64
  %54 = sext i32 %.decomposed to i64
  %55 = add i64 %54, %53
  %56 = getelementptr float, ptr addrspace(1) %arg3138, i64 %55
  %Arg_3.430156 = getelementptr inbounds float, ptr addrspace(1) %56, i64 -13
  br label %concatenate.8.merge25

concatenate.8.merge25:                            ; preds = %concatenate.pivot.13.34, %concatenate.pivot.0.33
  %.in103 = phi ptr addrspace(1) [ %Arg_2.327, %concatenate.pivot.0.33 ], [ %Arg_3.430156, %concatenate.pivot.13.34 ]
  %57 = icmp ult i32 %.decomposed, 13
  %58 = load float, ptr addrspace(1) %.in103, align 4, !invariant.load !77
  %multiply.1036 = fmul float %Arg_1.2, %58
  %multiply.1139 = fmul float %Arg_0.19, %multiply.1036
  %multiply.1544 = fmul float %subtract.14, %multiply.1139
  br i1 %57, label %concatenate.pivot.0.53, label %concatenate.pivot.13.54

concatenate.pivot.0.53:                           ; preds = %concatenate.8.merge25
  %59 = mul nuw nsw i32 %26, 13
  %60 = add nuw nsw i32 %59, %.decomposed
  %61 = zext i32 %60 to i64
  %Arg_5.647 = getelementptr inbounds float, ptr addrspace(1) %arg5142, i64 %61
  br label %concatenate.23.merge45

concatenate.pivot.13.54:                          ; preds = %concatenate.8.merge25
  %62 = mul nuw nsw i32 %26, 17
  %63 = sext i32 %62 to i64
  %64 = sext i32 %.decomposed to i64
  %65 = add i64 %64, %63
  %66 = getelementptr float, ptr addrspace(1) %arg6144, i64 %65
  %Arg_6.750157 = getelementptr inbounds float, ptr addrspace(1) %66, i64 -13
  br label %concatenate.23.merge45

concatenate.23.merge45:                           ; preds = %concatenate.pivot.13.54, %concatenate.pivot.0.53
  %.in104 = phi ptr addrspace(1) [ %Arg_5.647, %concatenate.pivot.0.53 ], [ %Arg_6.750157, %concatenate.pivot.13.54 ]
  %67 = load float, ptr addrspace(1) %.in104, align 4, !invariant.load !77
  %multiply.2456 = fmul float %Arg_1.2, %67
  %multiply.2559 = fmul float %Arg_4.520, %multiply.2456
  %multiply.2764 = fmul float %subtract.26, %multiply.2559
  store float %multiply.1544, ptr addrspace(1) %lsr.iv166, align 4
  store float %multiply.2764, ptr addrspace(1) %lsr.iv169, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %68 = mul nuw nsw i32 %0, 30
  %69 = add nuw nsw i32 %68, %thread_id.y101
  %.frozen128 = freeze i32 %69
  %70 = udiv i32 %.frozen128, 30
  %71 = mul i32 %70, 30
  %.decomposed129 = sub i32 %.frozen128, %71
  %72 = zext i32 %70 to i64
  %73 = zext i32 %.decomposed129 to i64
  %output_element_address = getelementptr inbounds [64 x [30 x float]], ptr addrspace(1) %arg7146, i64 0, i64 %72, i64 %73
  store float %add.21.i117, ptr addrspace(1) %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true97:                    ; preds = %reduction_write_output-after
  %74 = mul nuw nsw i32 %0, 30
  %75 = add nuw nsw i32 %74, %thread_id.y101
  %.frozen130 = freeze i32 %75
  %76 = udiv i32 %.frozen130, 30
  %77 = mul i32 %76, 30
  %.decomposed131 = sub i32 %.frozen130, %77
  %78 = zext i32 %76 to i64
  %79 = zext i32 %.decomposed131 to i64
  %output_element_address99 = getelementptr inbounds [64 x [30 x float]], ptr addrspace(1) %arg9150, i64 0, i64 %78, i64 %79
  store float %add.32.i121, ptr addrspace(1) %output_element_address99, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_83(ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(7680) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(120) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(120) %arg4) local_unnamed_addr #0 {
entry:
  %arg4106 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3104 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2102 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1100 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg098 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !78
  %trunc.not = icmp eq i32 %0, 0
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %thread_id.x = and i32 %1, 31
  %thread_id.y70 = lshr i32 %1, 5
  %Arg_1.2 = load float, ptr addrspace(1) %arg1100, align 128, !invariant.load !77
  %2 = zext i32 %thread_id.x to i64
  br i1 %trunc.not, label %y_in_tile.loop_body.preheader, label %y_in_tile.loop_body32.preheader

y_in_tile.loop_body32.preheader:                  ; preds = %entry
  %3 = add nuw nsw i32 %thread_id.y70, -32
  %4 = zext i32 %1 to i64
  %5 = lshr i64 %4, 5
  %6 = mul nuw nsw i64 %5, 120
  %7 = shl nuw nsw i64 %2, 2
  %8 = add i64 %6, %7
  %scevgep112 = getelementptr i8, ptr addrspace(1) %arg2102, i64 %8
  br label %y_in_tile.loop_body32

y_in_tile.loop_body.preheader:                    ; preds = %entry
  %9 = add nuw nsw i32 %thread_id.y70, -32
  %10 = zext i32 %1 to i64
  %11 = lshr i64 %10, 5
  %12 = mul nuw nsw i64 %11, 120
  %13 = shl nuw nsw i64 %2, 2
  %14 = add i64 %12, %13
  %scevgep = getelementptr i8, ptr addrspace(1) %arg098, i64 %14
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %y_in_tile.loop_exit, %reduction_write_output-true, %y_in_tile.loop_exit30, %reduction_write_output-true65
  ret void

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_body.preheader, %x_in_tile-after
  %lsr.iv108 = phi ptr addrspace(1) [ %scevgep, %y_in_tile.loop_body.preheader ], [ %scevgep109, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %9, %y_in_tile.loop_body.preheader ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.093 = phi float [ %partial_reduction_result.1, %x_in_tile-after ], [ %Arg_1.2, %y_in_tile.loop_body.preheader ]
  %15 = trunc i64 %2 to i32
  %16 = icmp ult i32 %15, 30
  br i1 %16, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %y_in_tile.loop_body
  %partial_reduction_result.1 = phi float [ %add.7.i85, %x_in_tile-true ], [ %partial_reduction_result.093, %y_in_tile.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep109 = getelementptr i8, ptr addrspace(1) %lsr.iv108, i64 3840
  %17 = icmp ugt i32 %lsr.iv.next, 31
  br i1 %17, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after
  %18 = trunc i64 %2 to i32
  %19 = zext i32 %thread_id.y70 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i64 0, i64 0, i64 0, i64 %2, i64 %19
  store float %partial_reduction_result.1, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i64 0, i64 0, i64 0, i64 %19, i64 %2
  %partial_reduction_result4 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %20 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  %add.7.i = fadd float %partial_reduction_result4, %20
  %21 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i, i32 8, i32 31)
  %add.7.i81 = fadd float %add.7.i, %21
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i81, i32 4, i32 31)
  %add.7.i82 = fadd float %add.7.i81, %22
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i82, i32 2, i32 31)
  %add.7.i83 = fadd float %add.7.i82, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i83, i32 1, i32 31)
  %add.7.i84 = fadd float %add.7.i83, %24
  store float %add.7.i84, ptr addrspace(3) %shmem_transposed_addr, align 4
  %25 = icmp ult i32 %1, 960
  %26 = icmp eq i32 %18, 0
  %27 = and i1 %25, %26
  %output_element_address = getelementptr inbounds [30 x float], ptr addrspace(1) %arg3104, i64 0, i64 %19
  br i1 %27, label %reduction_write_output-true, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %Arg_0.13 = load float, ptr addrspace(1) %lsr.iv108, align 4, !invariant.load !77
  %add.7.i85 = fadd float %partial_reduction_result.093, %Arg_0.13
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.7.i84, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret

y_in_tile.loop_body32:                            ; preds = %y_in_tile.loop_body32.preheader, %x_in_tile-after44
  %lsr.iv113 = phi ptr addrspace(1) [ %scevgep112, %y_in_tile.loop_body32.preheader ], [ %scevgep114, %x_in_tile-after44 ]
  %lsr.iv110 = phi i32 [ %3, %y_in_tile.loop_body32.preheader ], [ %lsr.iv.next111, %x_in_tile-after44 ]
  %partial_reduction_result19.091 = phi float [ %partial_reduction_result19.1, %x_in_tile-after44 ], [ %Arg_1.2, %y_in_tile.loop_body32.preheader ]
  %28 = trunc i64 %2 to i32
  %29 = icmp ult i32 %28, 30
  br i1 %29, label %x_in_tile-true43, label %x_in_tile-after44

x_in_tile-after44:                                ; preds = %x_in_tile-true43, %y_in_tile.loop_body32
  %partial_reduction_result19.1 = phi float [ %add.12.i90, %x_in_tile-true43 ], [ %partial_reduction_result19.091, %y_in_tile.loop_body32 ]
  %lsr.iv.next111 = add nsw i32 %lsr.iv110, 32
  %scevgep114 = getelementptr i8, ptr addrspace(1) %lsr.iv113, i64 3840
  %30 = icmp ugt i32 %lsr.iv.next111, 31
  br i1 %30, label %y_in_tile.loop_exit30, label %y_in_tile.loop_body32

y_in_tile.loop_exit30:                            ; preds = %x_in_tile-after44
  %31 = trunc i64 %2 to i32
  %32 = zext i32 %thread_id.y70 to i64
  %shmem_output_address47 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i64 0, i64 0, i64 0, i64 %2, i64 %32
  store float %partial_reduction_result19.1, ptr addrspace(3) %shmem_output_address47, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr49 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i64 0, i64 0, i64 0, i64 %32, i64 %2
  %partial_reduction_result51 = load float, ptr addrspace(3) %shmem_transposed_addr49, align 4
  %33 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 16, i32 31)
  %add.12.i = fadd float %partial_reduction_result51, %33
  %34 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i, i32 8, i32 31)
  %add.12.i86 = fadd float %add.12.i, %34
  %35 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i86, i32 4, i32 31)
  %add.12.i87 = fadd float %add.12.i86, %35
  %36 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i87, i32 2, i32 31)
  %add.12.i88 = fadd float %add.12.i87, %36
  %37 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.12.i88, i32 1, i32 31)
  %add.12.i89 = fadd float %add.12.i88, %37
  store float %add.12.i89, ptr addrspace(3) %shmem_transposed_addr49, align 4
  %38 = icmp ult i32 %1, 960
  %39 = icmp eq i32 %31, 0
  %40 = and i1 %38, %39
  %output_element_address67 = getelementptr inbounds [30 x float], ptr addrspace(1) %arg4106, i64 0, i64 %32
  br i1 %40, label %reduction_write_output-true65, label %common.ret

x_in_tile-true43:                                 ; preds = %y_in_tile.loop_body32
  %Arg_2.345 = load float, ptr addrspace(1) %lsr.iv113, align 4, !invariant.load !77
  %add.12.i90 = fadd float %partial_reduction_result19.091, %Arg_2.345
  br label %x_in_tile-after44

reduction_write_output-true65:                    ; preds = %y_in_tile.loop_exit30
  store float %add.12.i89, ptr addrspace(1) %output_element_address67, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_53(ptr noalias nocapture readonly align 16 dereferenceable(120) %arg0, ptr noalias nocapture align 128 dereferenceable(120) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(120) %arg3, ptr noalias nocapture align 128 dereferenceable(120) %arg4) local_unnamed_addr #4 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !85
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !77
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.7 = fmul float %4, %6
  %subtract.8 = fsub float %3, %multiply.7
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %1
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !77
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %1
  %10 = load float, ptr addrspace(1) %9, align 4
  %multiply.9 = fmul float %4, %10
  %subtract.10 = fsub float %8, %multiply.9
  store float %subtract.8, ptr addrspace(1) %9, align 4
  store float %subtract.10, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_52(ptr noalias nocapture readonly align 16 dereferenceable(61440) %arg0, ptr noalias nocapture align 128 dereferenceable(61440) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(61440) %arg3, ptr noalias nocapture align 128 dereferenceable(61440) %arg4) local_unnamed_addr #4 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !86
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !77
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.7 = fmul float %6, %8
  %subtract.8 = fsub float %5, %multiply.7
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !77
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4
  %multiply.9 = fmul float %6, %12
  %subtract.10 = fsub float %10, %multiply.9
  store float %subtract.8, ptr addrspace(1) %11, align 4
  store float %subtract.10, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_50(ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(16777216) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(16777216) %arg3) local_unnamed_addr #0 {
entry:
  %arg397 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg295 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg193 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg091 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !87
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
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
  %Arg_1.23 = load float, ptr addrspace(1) %Arg_1.2, align 8, !invariant.load !77
  %compare.5 = fcmp ogt float %Arg_1.23, 0.000000e+00
  %Arg_0.1 = getelementptr inbounds [8192 x [512 x float]], ptr addrspace(1) %arg091, i64 0, i64 %23, i64 %24
  %Arg_0.14 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !77
  %25 = select i1 %compare.5, float %Arg_0.14, float 0.000000e+00
  %add.12.i = fadd float %partial_reduction_result63.sroa.0.087, %25
  %scevgep108 = getelementptr i8, ptr addrspace(1) %lsr.iv106, i64 -4
  %26 = load <2 x float>, ptr addrspace(1) %scevgep108, align 8, !invariant.load !77
  %Arg_1.26113 = extractelement <2 x float> %26, i32 0
  %Arg_1.222114 = extractelement <2 x float> %26, i32 1
  %compare.58 = fcmp ogt float %Arg_1.26113, 0.000000e+00
  %scevgep112 = getelementptr i8, ptr addrspace(1) %lsr.iv110, i64 -4
  %27 = load <2 x float>, ptr addrspace(1) %scevgep112, align 8, !invariant.load !77
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
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !77
  %compare.517 = fcmp ogt float %Arg_1.215, 0.000000e+00
  %Arg_0.118 = getelementptr inbounds [8192 x [512 x float]], ptr addrspace(1) %arg091, i64 0, i64 %35, i64 %36
  %Arg_0.119 = load float, ptr addrspace(1) %Arg_0.118, align 4, !invariant.load !77
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
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache13, i64 0, i64 0, i64 0, i64 %43, i64 %44
  store float %add.12.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache13, i64 0, i64 0, i64 0, i64 %44, i64 %43
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

; Function Attrs: nounwind
define void @fusion_85(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(2048) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(2048) %arg4) local_unnamed_addr #0 {
entry:
  %arg4197 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3195 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2193 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1191 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0189 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !78
  %trunc.not = icmp eq i32 %0, 0
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !79
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %thread_id.x = and i32 %2, 31
  %thread_id.y131 = lshr i32 %2, 5
  %tile_origin.2 = shl nuw nsw i32 %1, 6
  %Arg_1.2 = load float, ptr addrspace(1) %arg1191, align 128, !invariant.load !77
  %3 = shl nuw nsw i32 %thread_id.x, 1
  %4 = or i32 %3, %tile_origin.2
  %5 = zext i32 %4 to i64
  br i1 %trunc.not, label %y_in_tile.loop_body.preheader, label %y_in_tile.loop_body60.preheader

y_in_tile.loop_body60.preheader:                  ; preds = %entry
  %6 = add nuw nsw i32 %thread_id.y131, -32
  %7 = zext i32 %2 to i64
  %8 = lshr i64 %7, 5
  %9 = shl nuw nsw i64 %8, 11
  %10 = shl nuw nsw i64 %5, 2
  %11 = add i64 %9, %10
  %12 = add i64 %11, 4
  %scevgep212 = getelementptr i8, ptr addrspace(1) %arg2193, i64 %12
  br label %y_in_tile.loop_body60

y_in_tile.loop_body.preheader:                    ; preds = %entry
  %13 = add nuw nsw i32 %thread_id.y131, -32
  %14 = zext i32 %2 to i64
  %15 = lshr i64 %14, 5
  %16 = shl nuw nsw i64 %15, 11
  %17 = shl nuw nsw i64 %5, 2
  %18 = add i64 %16, %17
  %19 = add i64 %18, 4
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0189, i64 %19
  br label %y_in_tile.loop_body

common.ret.sink.split:                            ; preds = %reduction_write_output-after100, %reduction_write_output-after
  %.pre-phi206 = phi i64 [ %52, %reduction_write_output-after100 ], [ %33, %reduction_write_output-after ]
  %arg3.sink = phi ptr addrspace(1) [ %arg3195, %reduction_write_output-after ], [ %arg4197, %reduction_write_output-after100 ]
  %add.7.i166.sink = phi float [ %add.7.i166, %reduction_write_output-after ], [ %add.12.i177, %reduction_write_output-after100 ]
  %20 = getelementptr [512 x float], ptr addrspace(1) %arg3.sink, i64 0, i64 %.pre-phi206
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
  %21 = load <2 x float>, ptr addrspace(1) %scevgep209, align 8, !invariant.load !77
  %Arg_0.13216 = extractelement <2 x float> %21, i32 0
  %Arg_0.18217 = extractelement <2 x float> %21, i32 1
  %add.7.i = fadd float %partial_reduction_result129.sroa.0.0183, %Arg_0.13216
  %add.7.i156 = fadd float %partial_reduction_result129.sroa.4.0182, %Arg_0.18217
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep208 = getelementptr i8, ptr addrspace(1) %lsr.iv207, i64 65536
  %22 = icmp ugt i32 %lsr.iv.next, 31
  br i1 %22, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %23 = zext i32 %thread_id.x to i64
  %24 = zext i32 %thread_id.y131 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache14, i64 0, i64 0, i64 0, i64 %23, i64 %24
  store float %add.7.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache14, i64 0, i64 0, i64 0, i64 %24, i64 %23
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
  %output_element_address = getelementptr inbounds [512 x float], ptr addrspace(1) %arg3195, i64 0, i64 %33
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
  %40 = load <2 x float>, ptr addrspace(1) %scevgep215, align 8, !invariant.load !77
  %Arg_2.373218 = extractelement <2 x float> %40, i32 0
  %Arg_2.379219 = extractelement <2 x float> %40, i32 1
  %add.12.i = fadd float %partial_reduction_result47128.sroa.0.0178, %Arg_2.373218
  %add.12.i167 = fadd float %partial_reduction_result47128.sroa.4.0179, %Arg_2.379219
  %lsr.iv.next211 = add nsw i32 %lsr.iv210, 32
  %scevgep214 = getelementptr i8, ptr addrspace(1) %lsr.iv213, i64 65536
  %41 = icmp ugt i32 %lsr.iv.next211, 31
  br i1 %41, label %y_in_tile.loop_exit58, label %y_in_tile.loop_body60

y_in_tile.loop_exit58:                            ; preds = %y_in_tile.loop_body60
  %42 = zext i32 %thread_id.x to i64
  %43 = zext i32 %thread_id.y131 to i64
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache15, i64 0, i64 0, i64 0, i64 %42, i64 %43
  store float %add.12.i, ptr addrspace(3) %shmem_output_address81, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache15, i64 0, i64 0, i64 0, i64 %43, i64 %42
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
  %output_element_address101 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg4197, i64 0, i64 %52
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
define void @fusion_49(ptr noalias nocapture readonly align 16 dereferenceable(2048) %arg0, ptr noalias nocapture align 128 dereferenceable(2048) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(2048) %arg3, ptr noalias nocapture align 128 dereferenceable(2048) %arg4) local_unnamed_addr #4 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !87
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !77
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.7 = fmul float %4, %6
  %subtract.8 = fsub float %3, %multiply.7
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %1
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !77
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %1
  %10 = load float, ptr addrspace(1) %9, align 4
  %multiply.9 = fmul float %4, %10
  %subtract.10 = fsub float %8, %multiply.9
  store float %subtract.8, ptr addrspace(1) %9, align 4
  store float %subtract.10, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_48(ptr noalias nocapture readonly align 16 dereferenceable(2375680) %arg0, ptr noalias nocapture align 128 dereferenceable(2375680) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #4 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !88
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !89
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg07, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !77
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !77
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
define void @fusion_78(ptr noalias nocapture readonly align 16 dereferenceable(425984) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(425984) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(38010880) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg12) local_unnamed_addr #4 {
entry:
  %arg1281 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1179 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1077 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg975 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg873 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg771 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg669 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg567 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg465 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg363 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg261 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg159 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg057 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !76
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !89
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
  %16 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg465, i64 0, i64 %14, i64 %15
  %17 = load float, ptr addrspace(1) %16, align 16, !invariant.load !77
  %18 = zext i32 %11 to i64
  %19 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg363, i64 0, i64 %14, i64 %18, i64 0
  %20 = load float, ptr addrspace(1) %19, align 4, !invariant.load !77
  %multiply.14 = fmul float %17, %20
  %21 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg159, i64 0, i64 %14, i64 %15
  %22 = load float, ptr addrspace(1) %21, align 16, !invariant.load !77
  %23 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg261, i64 0, i64 %14, i64 %15
  %24 = load float, ptr addrspace(1) %23, align 16, !invariant.load !77
  %add.15 = fadd float %22, %24
  %25 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg057, i64 0, i64 %14, i64 %18, i64 0
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !77
  %multiply.20 = fmul float %add.15, %26
  %add.21 = fadd float %multiply.14, %multiply.20
  %27 = add nuw nsw i32 %8, 576
  %28 = lshr i32 %27, 6
  %29 = and i32 %27, -64
  %30 = or i32 %29, %10
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg465, i64 0, i64 %14, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 16, !invariant.load !77
  %34 = zext i32 %28 to i64
  %35 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg363, i64 0, i64 %14, i64 %34, i64 0
  %36 = load float, ptr addrspace(1) %35, align 4, !invariant.load !77
  %multiply.141 = fmul float %33, %36
  %37 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg159, i64 0, i64 %14, i64 %31
  %38 = load float, ptr addrspace(1) %37, align 16, !invariant.load !77
  %39 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg261, i64 0, i64 %14, i64 %31
  %40 = load float, ptr addrspace(1) %39, align 16, !invariant.load !77
  %add.152 = fadd float %38, %40
  %41 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg057, i64 0, i64 %14, i64 %34, i64 0
  %42 = load float, ptr addrspace(1) %41, align 4, !invariant.load !77
  %multiply.203 = fmul float %add.152, %42
  %add.214 = fadd float %multiply.141, %multiply.203
  %43 = zext i32 %linear_index_base to i64
  %44 = getelementptr float, ptr addrspace(1) %arg567, i64 %43
  %45 = load <4 x float>, ptr addrspace(1) %44, align 16, !invariant.load !77
  %46 = extractelement <4 x float> %45, i32 0
  %47 = extractelement <4 x float> %45, i32 1
  %48 = extractelement <4 x float> %45, i32 2
  %49 = extractelement <4 x float> %45, i32 3
  %50 = load float, ptr addrspace(1) %arg669, align 16, !invariant.load !77
  %51 = add nuw nsw i32 %8, 448
  %52 = lshr i32 %51, 6
  %53 = and i32 %51, -64
  %54 = or i32 %53, %10
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg465, i64 0, i64 %14, i64 %55
  %57 = load float, ptr addrspace(1) %56, align 16, !invariant.load !77
  %58 = zext i32 %52 to i64
  %59 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg363, i64 0, i64 %14, i64 %58, i64 0
  %60 = load float, ptr addrspace(1) %59, align 4, !invariant.load !77
  %multiply.145 = fmul float %57, %60
  %61 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg159, i64 0, i64 %14, i64 %55
  %62 = load float, ptr addrspace(1) %61, align 16, !invariant.load !77
  %63 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg261, i64 0, i64 %14, i64 %55
  %64 = load float, ptr addrspace(1) %63, align 16, !invariant.load !77
  %add.156 = fadd float %62, %64
  %65 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg057, i64 0, i64 %14, i64 %58, i64 0
  %66 = load float, ptr addrspace(1) %65, align 4, !invariant.load !77
  %multiply.207 = fmul float %add.156, %66
  %add.218 = fadd float %multiply.145, %multiply.207
  %multiply.27 = fmul float %50, %add.218
  %subtract.28 = fsub float %46, %multiply.27
  %67 = getelementptr float, ptr addrspace(1) %arg771, i64 %43
  %68 = load <4 x float>, ptr addrspace(1) %67, align 16, !invariant.load !77
  %69 = extractelement <4 x float> %68, i32 0
  %70 = extractelement <4 x float> %68, i32 1
  %71 = extractelement <4 x float> %68, i32 2
  %72 = extractelement <4 x float> %68, i32 3
  %73 = zext i32 %8 to i64
  %74 = getelementptr [8192 x [1160 x float]], ptr addrspace(1) %arg873, i64 0, i64 %14, i64 %73
  %75 = getelementptr inbounds float, ptr addrspace(1) %74, i64 64
  %76 = load <2 x float>, ptr addrspace(1) %75, align 16, !invariant.load !77
  %77 = extractelement <2 x float> %76, i32 0
  %78 = extractelement <2 x float> %76, i32 1
  %multiply.30 = fmul float %50, %77
  %subtract.31 = fsub float %69, %multiply.30
  %79 = getelementptr float, ptr addrspace(1) %arg975, i64 %43
  %80 = getelementptr float, ptr addrspace(1) %arg1077, i64 %43
  %81 = getelementptr float, ptr addrspace(1) %arg1179, i64 %43
  %82 = getelementptr float, ptr addrspace(1) %arg1281, i64 %43
  %83 = add nuw nsw i32 %7, 704
  %84 = and i32 %linear_index1, 61
  %85 = lshr i32 %83, 6
  %86 = and i32 %83, -64
  %87 = or i32 %86, %84
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg465, i64 0, i64 %14, i64 %88
  %90 = load float, ptr addrspace(1) %89, align 4, !invariant.load !77
  %91 = zext i32 %85 to i64
  %92 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg363, i64 0, i64 %14, i64 %91, i64 0
  %93 = load float, ptr addrspace(1) %92, align 4, !invariant.load !77
  %multiply.149 = fmul float %90, %93
  %94 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg159, i64 0, i64 %14, i64 %88
  %95 = load float, ptr addrspace(1) %94, align 4, !invariant.load !77
  %96 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg261, i64 0, i64 %14, i64 %88
  %97 = load float, ptr addrspace(1) %96, align 4, !invariant.load !77
  %add.1510 = fadd float %95, %97
  %98 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg057, i64 0, i64 %14, i64 %91, i64 0
  %99 = load float, ptr addrspace(1) %98, align 4, !invariant.load !77
  %multiply.2011 = fmul float %add.1510, %99
  %add.2112 = fadd float %multiply.149, %multiply.2011
  %100 = add nuw nsw i32 %7, 576
  %101 = lshr i32 %100, 6
  %102 = and i32 %100, -64
  %103 = or i32 %102, %84
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg465, i64 0, i64 %14, i64 %104
  %106 = load float, ptr addrspace(1) %105, align 4, !invariant.load !77
  %107 = zext i32 %101 to i64
  %108 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg363, i64 0, i64 %14, i64 %107, i64 0
  %109 = load float, ptr addrspace(1) %108, align 4, !invariant.load !77
  %multiply.1413 = fmul float %106, %109
  %110 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg159, i64 0, i64 %14, i64 %104
  %111 = load float, ptr addrspace(1) %110, align 4, !invariant.load !77
  %112 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg261, i64 0, i64 %14, i64 %104
  %113 = load float, ptr addrspace(1) %112, align 4, !invariant.load !77
  %add.1514 = fadd float %111, %113
  %114 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg057, i64 0, i64 %14, i64 %107, i64 0
  %115 = load float, ptr addrspace(1) %114, align 4, !invariant.load !77
  %multiply.2015 = fmul float %add.1514, %115
  %add.2116 = fadd float %multiply.1413, %multiply.2015
  %116 = add nuw nsw i32 %7, 448
  %117 = lshr i32 %116, 6
  %118 = and i32 %116, -64
  %119 = or i32 %118, %84
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg465, i64 0, i64 %14, i64 %120
  %122 = load float, ptr addrspace(1) %121, align 4, !invariant.load !77
  %123 = zext i32 %117 to i64
  %124 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg363, i64 0, i64 %14, i64 %123, i64 0
  %125 = load float, ptr addrspace(1) %124, align 4, !invariant.load !77
  %multiply.1417 = fmul float %122, %125
  %126 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg159, i64 0, i64 %14, i64 %120
  %127 = load float, ptr addrspace(1) %126, align 4, !invariant.load !77
  %128 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg261, i64 0, i64 %14, i64 %120
  %129 = load float, ptr addrspace(1) %128, align 4, !invariant.load !77
  %add.1518 = fadd float %127, %129
  %130 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg057, i64 0, i64 %14, i64 %123, i64 0
  %131 = load float, ptr addrspace(1) %130, align 4, !invariant.load !77
  %multiply.2019 = fmul float %add.1518, %131
  %add.2120 = fadd float %multiply.1417, %multiply.2019
  %multiply.2721 = fmul float %50, %add.2120
  %subtract.2822 = fsub float %47, %multiply.2721
  %132 = zext i32 %7 to i64
  %133 = getelementptr [8192 x [1160 x float]], ptr addrspace(1) %arg873, i64 0, i64 %14, i64 %132
  %multiply.3023 = fmul float %50, %78
  %subtract.3124 = fsub float %70, %multiply.3023
  %134 = add nuw nsw i32 %6, 704
  %135 = and i32 %linear_index2, 62
  %136 = lshr i32 %134, 6
  %137 = and i32 %134, -64
  %138 = or i32 %137, %135
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg465, i64 0, i64 %14, i64 %139
  %141 = load float, ptr addrspace(1) %140, align 8, !invariant.load !77
  %142 = zext i32 %136 to i64
  %143 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg363, i64 0, i64 %14, i64 %142, i64 0
  %144 = load float, ptr addrspace(1) %143, align 4, !invariant.load !77
  %multiply.1425 = fmul float %141, %144
  %145 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg159, i64 0, i64 %14, i64 %139
  %146 = load float, ptr addrspace(1) %145, align 8, !invariant.load !77
  %147 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg261, i64 0, i64 %14, i64 %139
  %148 = load float, ptr addrspace(1) %147, align 8, !invariant.load !77
  %add.1526 = fadd float %146, %148
  %149 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg057, i64 0, i64 %14, i64 %142, i64 0
  %150 = load float, ptr addrspace(1) %149, align 4, !invariant.load !77
  %multiply.2027 = fmul float %add.1526, %150
  %add.2128 = fadd float %multiply.1425, %multiply.2027
  %151 = add nuw nsw i32 %6, 576
  %152 = lshr i32 %151, 6
  %153 = and i32 %151, -64
  %154 = or i32 %153, %135
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg465, i64 0, i64 %14, i64 %155
  %157 = load float, ptr addrspace(1) %156, align 8, !invariant.load !77
  %158 = zext i32 %152 to i64
  %159 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg363, i64 0, i64 %14, i64 %158, i64 0
  %160 = load float, ptr addrspace(1) %159, align 4, !invariant.load !77
  %multiply.1429 = fmul float %157, %160
  %161 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg159, i64 0, i64 %14, i64 %155
  %162 = load float, ptr addrspace(1) %161, align 8, !invariant.load !77
  %163 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg261, i64 0, i64 %14, i64 %155
  %164 = load float, ptr addrspace(1) %163, align 8, !invariant.load !77
  %add.1530 = fadd float %162, %164
  %165 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg057, i64 0, i64 %14, i64 %158, i64 0
  %166 = load float, ptr addrspace(1) %165, align 4, !invariant.load !77
  %multiply.2031 = fmul float %add.1530, %166
  %add.2132 = fadd float %multiply.1429, %multiply.2031
  %167 = add nuw nsw i32 %6, 448
  %168 = lshr i32 %167, 6
  %169 = and i32 %167, -64
  %170 = or i32 %169, %135
  %171 = zext i32 %170 to i64
  %172 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg465, i64 0, i64 %14, i64 %171
  %173 = load float, ptr addrspace(1) %172, align 8, !invariant.load !77
  %174 = zext i32 %168 to i64
  %175 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg363, i64 0, i64 %14, i64 %174, i64 0
  %176 = load float, ptr addrspace(1) %175, align 4, !invariant.load !77
  %multiply.1433 = fmul float %173, %176
  %177 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg159, i64 0, i64 %14, i64 %171
  %178 = load float, ptr addrspace(1) %177, align 8, !invariant.load !77
  %179 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg261, i64 0, i64 %14, i64 %171
  %180 = load float, ptr addrspace(1) %179, align 8, !invariant.load !77
  %add.1534 = fadd float %178, %180
  %181 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg057, i64 0, i64 %14, i64 %174, i64 0
  %182 = load float, ptr addrspace(1) %181, align 4, !invariant.load !77
  %multiply.2035 = fmul float %add.1534, %182
  %add.2136 = fadd float %multiply.1433, %multiply.2035
  %multiply.2737 = fmul float %50, %add.2136
  %subtract.2838 = fsub float %48, %multiply.2737
  %183 = zext i32 %6 to i64
  %184 = getelementptr [8192 x [1160 x float]], ptr addrspace(1) %arg873, i64 0, i64 %14, i64 %183
  %185 = getelementptr inbounds float, ptr addrspace(1) %184, i64 64
  %186 = load float, ptr addrspace(1) %185, align 8, !invariant.load !77
  %multiply.3039 = fmul float %50, %186
  %subtract.3140 = fsub float %71, %multiply.3039
  %187 = add nuw nsw i32 %5, 704
  %188 = and i32 %linear_index3, 63
  %189 = lshr i32 %187, 6
  %190 = and i32 %187, -64
  %191 = or i32 %190, %188
  %192 = zext i32 %191 to i64
  %193 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg465, i64 0, i64 %14, i64 %192
  %194 = load float, ptr addrspace(1) %193, align 4, !invariant.load !77
  %195 = zext i32 %189 to i64
  %196 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg363, i64 0, i64 %14, i64 %195, i64 0
  %197 = load float, ptr addrspace(1) %196, align 4, !invariant.load !77
  %multiply.1441 = fmul float %194, %197
  %198 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg159, i64 0, i64 %14, i64 %192
  %199 = load float, ptr addrspace(1) %198, align 4, !invariant.load !77
  %200 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg261, i64 0, i64 %14, i64 %192
  %201 = load float, ptr addrspace(1) %200, align 4, !invariant.load !77
  %add.1542 = fadd float %199, %201
  %202 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg057, i64 0, i64 %14, i64 %195, i64 0
  %203 = load float, ptr addrspace(1) %202, align 4, !invariant.load !77
  %multiply.2043 = fmul float %add.1542, %203
  %add.2144 = fadd float %multiply.1441, %multiply.2043
  %204 = add nuw nsw i32 %5, 576
  %205 = lshr i32 %204, 6
  %206 = and i32 %204, -64
  %207 = or i32 %206, %188
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg465, i64 0, i64 %14, i64 %208
  %210 = load float, ptr addrspace(1) %209, align 4, !invariant.load !77
  %211 = zext i32 %205 to i64
  %212 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg363, i64 0, i64 %14, i64 %211, i64 0
  %213 = load float, ptr addrspace(1) %212, align 4, !invariant.load !77
  %multiply.1445 = fmul float %210, %213
  %214 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg159, i64 0, i64 %14, i64 %208
  %215 = load float, ptr addrspace(1) %214, align 4, !invariant.load !77
  %216 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg261, i64 0, i64 %14, i64 %208
  %217 = load float, ptr addrspace(1) %216, align 4, !invariant.load !77
  %add.1546 = fadd float %215, %217
  %218 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg057, i64 0, i64 %14, i64 %211, i64 0
  %219 = load float, ptr addrspace(1) %218, align 4, !invariant.load !77
  %multiply.2047 = fmul float %add.1546, %219
  %add.2148 = fadd float %multiply.1445, %multiply.2047
  %220 = add nuw nsw i32 %5, 448
  %221 = lshr i32 %220, 6
  %222 = and i32 %220, -64
  %223 = or i32 %222, %188
  %224 = zext i32 %223 to i64
  %225 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg465, i64 0, i64 %14, i64 %224
  %226 = load float, ptr addrspace(1) %225, align 4, !invariant.load !77
  %227 = zext i32 %221 to i64
  %228 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg363, i64 0, i64 %14, i64 %227, i64 0
  %229 = load float, ptr addrspace(1) %228, align 4, !invariant.load !77
  %multiply.1449 = fmul float %226, %229
  %230 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg159, i64 0, i64 %14, i64 %224
  %231 = load float, ptr addrspace(1) %230, align 4, !invariant.load !77
  %232 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg261, i64 0, i64 %14, i64 %224
  %233 = load float, ptr addrspace(1) %232, align 4, !invariant.load !77
  %add.1550 = fadd float %231, %233
  %234 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg057, i64 0, i64 %14, i64 %227, i64 0
  %235 = load float, ptr addrspace(1) %234, align 4, !invariant.load !77
  %multiply.2051 = fmul float %add.1550, %235
  %add.2152 = fadd float %multiply.1449, %multiply.2051
  %multiply.2753 = fmul float %50, %add.2152
  %subtract.2854 = fsub float %49, %multiply.2753
  %236 = zext i32 %5 to i64
  %237 = getelementptr [8192 x [1160 x float]], ptr addrspace(1) %arg873, i64 0, i64 %14, i64 %236
  %238 = getelementptr inbounds float, ptr addrspace(1) %237, i64 64
  %239 = load float, ptr addrspace(1) %238, align 4, !invariant.load !77
  %multiply.3055 = fmul float %50, %239
  %subtract.3156 = fsub float %72, %multiply.3055
  %240 = insertelement <4 x float> poison, float %add.21, i32 0
  %241 = insertelement <4 x float> %240, float %add.2112, i32 1
  %242 = insertelement <4 x float> %241, float %add.2128, i32 2
  %243 = insertelement <4 x float> %242, float %add.2144, i32 3
  store <4 x float> %243, ptr addrspace(1) %79, align 16
  %244 = insertelement <4 x float> poison, float %add.214, i32 0
  %245 = insertelement <4 x float> %244, float %add.2116, i32 1
  %246 = insertelement <4 x float> %245, float %add.2132, i32 2
  %247 = insertelement <4 x float> %246, float %add.2148, i32 3
  store <4 x float> %247, ptr addrspace(1) %80, align 16
  %248 = insertelement <4 x float> poison, float %subtract.28, i32 0
  %249 = insertelement <4 x float> %248, float %subtract.2822, i32 1
  %250 = insertelement <4 x float> %249, float %subtract.2838, i32 2
  %251 = insertelement <4 x float> %250, float %subtract.2854, i32 3
  store <4 x float> %251, ptr addrspace(1) %81, align 16
  %252 = insertelement <4 x float> poison, float %subtract.31, i32 0
  %253 = insertelement <4 x float> %252, float %subtract.3124, i32 1
  %254 = insertelement <4 x float> %253, float %subtract.3140, i32 2
  %255 = insertelement <4 x float> %254, float %subtract.3156, i32 3
  store <4 x float> %255, ptr addrspace(1) %82, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_46(ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(38010880) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg3, ptr noalias nocapture align 128 dereferenceable(2097152) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg5, ptr noalias nocapture align 128 dereferenceable(2097152) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(557056) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(557056) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg14) local_unnamed_addr #4 {
entry:
  %arg1465 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1363 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1261 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1159 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1057 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg955 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg853 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg751 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg649 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg547 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg445 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg343 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg241 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg139 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg037 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !87
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !89
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
  %10 = getelementptr float, ptr addrspace(1) %arg037, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !77
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg241, align 16, !invariant.load !77
  %17 = zext i32 %4 to i64
  %18 = zext i32 %8 to i64
  %19 = getelementptr inbounds [8192 x [1160 x float]], ptr addrspace(1) %arg139, i64 0, i64 %17, i64 %18
  %20 = load <2 x float>, ptr addrspace(1) %19, align 16, !invariant.load !77
  %21 = extractelement <2 x float> %20, i32 0
  %22 = extractelement <2 x float> %20, i32 1
  %multiply.16 = fmul float %16, %21
  %subtract.17 = fsub float %12, %multiply.16
  %23 = getelementptr float, ptr addrspace(1) %arg343, i64 %9
  %24 = load <4 x float>, ptr addrspace(1) %23, align 16, !invariant.load !77
  %25 = extractelement <4 x float> %24, i32 0
  %26 = extractelement <4 x float> %24, i32 1
  %27 = extractelement <4 x float> %24, i32 2
  %28 = extractelement <4 x float> %24, i32 3
  %29 = getelementptr float, ptr addrspace(1) %arg445, i64 %9
  %30 = load <4 x float>, ptr addrspace(1) %29, align 16
  %31 = extractelement <4 x float> %30, i32 0
  %32 = extractelement <4 x float> %30, i32 1
  %33 = extractelement <4 x float> %30, i32 2
  %34 = extractelement <4 x float> %30, i32 3
  %multiply.18 = fmul float %16, %31
  %subtract.19 = fsub float %25, %multiply.18
  %35 = getelementptr float, ptr addrspace(1) %arg547, i64 %9
  %36 = load <4 x float>, ptr addrspace(1) %35, align 16, !invariant.load !77
  %37 = extractelement <4 x float> %36, i32 0
  %38 = extractelement <4 x float> %36, i32 1
  %39 = extractelement <4 x float> %36, i32 2
  %40 = extractelement <4 x float> %36, i32 3
  %41 = getelementptr float, ptr addrspace(1) %arg649, i64 %9
  %42 = load <4 x float>, ptr addrspace(1) %41, align 16
  %43 = extractelement <4 x float> %42, i32 0
  %44 = extractelement <4 x float> %42, i32 1
  %45 = extractelement <4 x float> %42, i32 2
  %46 = extractelement <4 x float> %42, i32 3
  %multiply.20 = fmul float %16, %43
  %subtract.21 = fsub float %37, %multiply.20
  %47 = getelementptr float, ptr addrspace(1) %arg751, i64 %9
  %48 = load <4 x float>, ptr addrspace(1) %47, align 16, !invariant.load !77
  %49 = extractelement <4 x float> %48, i32 0
  %50 = extractelement <4 x float> %48, i32 1
  %51 = extractelement <4 x float> %48, i32 2
  %52 = extractelement <4 x float> %48, i32 3
  %53 = add nuw nsw i32 %8, 48
  %54 = and i32 %3, 4
  %55 = lshr i32 %53, 3
  %56 = and i32 %53, -8
  %57 = zext i32 %56 to i64
  %58 = zext i32 %54 to i64
  %59 = add i64 %58, %57
  %60 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg1159, i64 0, i64 %17, i64 %59
  %61 = getelementptr inbounds float, ptr addrspace(1) %60, i64 832
  %62 = load float, ptr addrspace(1) %61, align 16, !invariant.load !77
  %63 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg1261, i64 0, i64 %17, i64 %59
  %64 = getelementptr inbounds float, ptr addrspace(1) %63, i64 832
  %65 = load float, ptr addrspace(1) %64, align 16, !invariant.load !77
  %add.22 = fadd float %62, %65
  %66 = zext i32 %55 to i64
  %67 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg1057, i64 0, i64 %17, i64 %66, i64 0
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !77
  %multiply.27 = fmul float %add.22, %68
  %69 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg955, i64 0, i64 %17, i64 %59
  %70 = getelementptr inbounds float, ptr addrspace(1) %69, i64 832
  %71 = load float, ptr addrspace(1) %70, align 16, !invariant.load !77
  %72 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg853, i64 0, i64 %17, i64 %66, i64 0
  %73 = load float, ptr addrspace(1) %72, align 4, !invariant.load !77
  %multiply.32 = fmul float %71, %73
  %add.33 = fadd float %multiply.27, %multiply.32
  %multiply.36 = fmul float %16, %add.33
  %subtract.37 = fsub float %49, %multiply.36
  %74 = getelementptr float, ptr addrspace(1) %arg1363, i64 %9
  %75 = getelementptr float, ptr addrspace(1) %arg1465, i64 %9
  %76 = zext i32 %7 to i64
  %multiply.161 = fmul float %16, %22
  %subtract.172 = fsub float %13, %multiply.161
  %multiply.183 = fmul float %16, %32
  %subtract.194 = fsub float %26, %multiply.183
  %multiply.205 = fmul float %16, %44
  %subtract.216 = fsub float %38, %multiply.205
  %77 = add nuw nsw i32 %7, 48
  %78 = and i32 %linear_index1, 5
  %79 = lshr i32 %77, 3
  %80 = and i32 %77, -8
  %81 = zext i32 %80 to i64
  %82 = zext i32 %78 to i64
  %83 = add i64 %82, %81
  %84 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg1159, i64 0, i64 %17, i64 %83
  %85 = getelementptr inbounds float, ptr addrspace(1) %84, i64 832
  %86 = load float, ptr addrspace(1) %85, align 4, !invariant.load !77
  %87 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg1261, i64 0, i64 %17, i64 %83
  %88 = getelementptr inbounds float, ptr addrspace(1) %87, i64 832
  %89 = load float, ptr addrspace(1) %88, align 4, !invariant.load !77
  %add.227 = fadd float %86, %89
  %90 = zext i32 %79 to i64
  %91 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg1057, i64 0, i64 %17, i64 %90, i64 0
  %92 = load float, ptr addrspace(1) %91, align 4, !invariant.load !77
  %multiply.278 = fmul float %add.227, %92
  %93 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg955, i64 0, i64 %17, i64 %83
  %94 = getelementptr inbounds float, ptr addrspace(1) %93, i64 832
  %95 = load float, ptr addrspace(1) %94, align 4, !invariant.load !77
  %96 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg853, i64 0, i64 %17, i64 %90, i64 0
  %97 = load float, ptr addrspace(1) %96, align 4, !invariant.load !77
  %multiply.329 = fmul float %95, %97
  %add.3310 = fadd float %multiply.278, %multiply.329
  %multiply.3611 = fmul float %16, %add.3310
  %subtract.3712 = fsub float %50, %multiply.3611
  %98 = zext i32 %6 to i64
  %99 = getelementptr inbounds [8192 x [1160 x float]], ptr addrspace(1) %arg139, i64 0, i64 %17, i64 %98
  %100 = load float, ptr addrspace(1) %99, align 8, !invariant.load !77
  %multiply.1613 = fmul float %16, %100
  %subtract.1714 = fsub float %14, %multiply.1613
  %multiply.1815 = fmul float %16, %33
  %subtract.1916 = fsub float %27, %multiply.1815
  %multiply.2017 = fmul float %16, %45
  %subtract.2118 = fsub float %39, %multiply.2017
  %101 = add nuw nsw i32 %6, 48
  %102 = and i32 %linear_index2, 6
  %103 = lshr i32 %101, 3
  %104 = and i32 %101, -8
  %105 = zext i32 %104 to i64
  %106 = zext i32 %102 to i64
  %107 = add i64 %106, %105
  %108 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg1159, i64 0, i64 %17, i64 %107
  %109 = getelementptr inbounds float, ptr addrspace(1) %108, i64 832
  %110 = load float, ptr addrspace(1) %109, align 8, !invariant.load !77
  %111 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg1261, i64 0, i64 %17, i64 %107
  %112 = getelementptr inbounds float, ptr addrspace(1) %111, i64 832
  %113 = load float, ptr addrspace(1) %112, align 8, !invariant.load !77
  %add.2219 = fadd float %110, %113
  %114 = zext i32 %103 to i64
  %115 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg1057, i64 0, i64 %17, i64 %114, i64 0
  %116 = load float, ptr addrspace(1) %115, align 4, !invariant.load !77
  %multiply.2720 = fmul float %add.2219, %116
  %117 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg955, i64 0, i64 %17, i64 %107
  %118 = getelementptr inbounds float, ptr addrspace(1) %117, i64 832
  %119 = load float, ptr addrspace(1) %118, align 8, !invariant.load !77
  %120 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg853, i64 0, i64 %17, i64 %114, i64 0
  %121 = load float, ptr addrspace(1) %120, align 4, !invariant.load !77
  %multiply.3221 = fmul float %119, %121
  %add.3322 = fadd float %multiply.2720, %multiply.3221
  %multiply.3623 = fmul float %16, %add.3322
  %subtract.3724 = fsub float %51, %multiply.3623
  %122 = zext i32 %5 to i64
  %123 = getelementptr inbounds [8192 x [1160 x float]], ptr addrspace(1) %arg139, i64 0, i64 %17, i64 %122
  %124 = load float, ptr addrspace(1) %123, align 4, !invariant.load !77
  %multiply.1625 = fmul float %16, %124
  %subtract.1726 = fsub float %15, %multiply.1625
  %multiply.1827 = fmul float %16, %34
  %subtract.1928 = fsub float %28, %multiply.1827
  %multiply.2029 = fmul float %16, %46
  %subtract.2130 = fsub float %40, %multiply.2029
  %125 = add nuw nsw i32 %5, 48
  %126 = and i32 %linear_index3, 7
  %127 = lshr i32 %125, 3
  %128 = and i32 %125, -8
  %129 = zext i32 %128 to i64
  %130 = zext i32 %126 to i64
  %131 = add i64 %130, %129
  %132 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg1159, i64 0, i64 %17, i64 %131
  %133 = getelementptr inbounds float, ptr addrspace(1) %132, i64 832
  %134 = load float, ptr addrspace(1) %133, align 4, !invariant.load !77
  %135 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg1261, i64 0, i64 %17, i64 %131
  %136 = getelementptr inbounds float, ptr addrspace(1) %135, i64 832
  %137 = load float, ptr addrspace(1) %136, align 4, !invariant.load !77
  %add.2231 = fadd float %134, %137
  %138 = zext i32 %127 to i64
  %139 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg1057, i64 0, i64 %17, i64 %138, i64 0
  %140 = load float, ptr addrspace(1) %139, align 4, !invariant.load !77
  %multiply.2732 = fmul float %add.2231, %140
  %141 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg955, i64 0, i64 %17, i64 %131
  %142 = getelementptr inbounds float, ptr addrspace(1) %141, i64 832
  %143 = load float, ptr addrspace(1) %142, align 4, !invariant.load !77
  %144 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg853, i64 0, i64 %17, i64 %138, i64 0
  %145 = load float, ptr addrspace(1) %144, align 4, !invariant.load !77
  %multiply.3233 = fmul float %143, %145
  %add.3334 = fadd float %multiply.2732, %multiply.3233
  %multiply.3635 = fmul float %16, %add.3334
  %subtract.3736 = fsub float %52, %multiply.3635
  %146 = insertelement <4 x float> poison, float %subtract.17, i32 0
  %147 = insertelement <4 x float> %146, float %subtract.172, i32 1
  %148 = insertelement <4 x float> %147, float %subtract.1714, i32 2
  %149 = insertelement <4 x float> %148, float %subtract.1726, i32 3
  store <4 x float> %149, ptr addrspace(1) %74, align 16
  %150 = insertelement <4 x float> poison, float %subtract.19, i32 0
  %151 = insertelement <4 x float> %150, float %subtract.194, i32 1
  %152 = insertelement <4 x float> %151, float %subtract.1916, i32 2
  %153 = insertelement <4 x float> %152, float %subtract.1928, i32 3
  store <4 x float> %153, ptr addrspace(1) %75, align 16
  %154 = insertelement <4 x float> poison, float %subtract.21, i32 0
  %155 = insertelement <4 x float> %154, float %subtract.216, i32 1
  %156 = insertelement <4 x float> %155, float %subtract.2118, i32 2
  %157 = insertelement <4 x float> %156, float %subtract.2130, i32 3
  store <4 x float> %157, ptr addrspace(1) %41, align 16
  %158 = insertelement <4 x float> poison, float %subtract.37, i32 0
  %159 = insertelement <4 x float> %158, float %subtract.3712, i32 1
  %160 = insertelement <4 x float> %159, float %subtract.3724, i32 2
  %161 = insertelement <4 x float> %160, float %subtract.3736, i32 3
  store <4 x float> %161, ptr addrspace(1) %29, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion_44(ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(247808) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(31719424) %arg5) local_unnamed_addr #0 {
entry:
  %arg558 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg456 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg354 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg252 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg150 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg048 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !90
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %thread_id.x = and i32 %1, 31
  %thread_id.y33 = lshr i32 %1, 5
  %.lhs.trunc = trunc i32 %0 to i16
  %2 = udiv i16 %.lhs.trunc, 31
  %3 = mul i16 %2, 31
  %.decomposed = sub i16 %.lhs.trunc, %3
  %.zext44 = zext i16 %2 to i32
  %4 = icmp eq i16 %.decomposed, 30
  %tile_bound1 = select i1 %4, i32 8, i32 32
  %5 = shl nuw nsw i16 %.decomposed, 5
  %tile_origin.2 = zext i16 %5 to i32
  %6 = mul nuw nsw i32 %.zext44, 123904
  %7 = or i32 %6, %tile_origin.2
  %8 = add nuw nsw i32 %thread_id.y33, -32
  %9 = mul nuw nsw i32 %thread_id.y33, 968
  %10 = add i32 %7, %9
  %11 = add i32 %10, %thread_id.x
  %12 = zext i32 %11 to i64
  %13 = shl nuw nsw i64 %12, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %arg354, i64 %13
  %scevgep62 = getelementptr i8, ptr addrspace(1) %arg150, i64 %13
  %scevgep65 = getelementptr i8, ptr addrspace(1) %arg252, i64 %13
  %scevgep68 = getelementptr i8, ptr addrspace(1) %arg048, i64 %13
  %scevgep71 = getelementptr i8, ptr addrspace(1) %arg558, i64 %13
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %y_in_tile.loop_exit, %reduction_write_output-true
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %x_in_tile-after
  %lsr.iv72 = phi ptr addrspace(1) [ %scevgep71, %entry ], [ %scevgep73, %x_in_tile-after ]
  %lsr.iv69 = phi ptr addrspace(1) [ %scevgep68, %entry ], [ %scevgep70, %x_in_tile-after ]
  %lsr.iv66 = phi ptr addrspace(1) [ %scevgep65, %entry ], [ %scevgep67, %x_in_tile-after ]
  %lsr.iv63 = phi ptr addrspace(1) [ %scevgep62, %entry ], [ %scevgep64, %x_in_tile-after ]
  %lsr.iv60 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep61, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %8, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.045 = phi float [ -0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %14 = icmp ult i32 %thread_id.x, %tile_bound1
  br i1 %14, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %y_in_tile.loop_body
  %partial_reduction_result.1 = phi float [ %add.16.i42, %x_in_tile-true ], [ %partial_reduction_result.045, %y_in_tile.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep61 = getelementptr i8, ptr addrspace(1) %lsr.iv60, i64 123904
  %scevgep64 = getelementptr i8, ptr addrspace(1) %lsr.iv63, i64 123904
  %scevgep67 = getelementptr i8, ptr addrspace(1) %lsr.iv66, i64 123904
  %scevgep70 = getelementptr i8, ptr addrspace(1) %lsr.iv69, i64 123904
  %scevgep73 = getelementptr i8, ptr addrspace(1) %lsr.iv72, i64 123904
  %15 = icmp ugt i32 %lsr.iv.next, 95
  br i1 %15, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after
  %16 = zext i32 %thread_id.x to i64
  %17 = zext i32 %thread_id.y33 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache16, i64 0, i64 0, i64 0, i64 %16, i64 %17
  store float %partial_reduction_result.1, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache16, i64 0, i64 0, i64 0, i64 %17, i64 %16
  %partial_reduction_result19 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %18 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 16, i32 31)
  %add.16.i = fadd float %partial_reduction_result19, %18
  %19 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i, i32 8, i32 31)
  %add.16.i38 = fadd float %add.16.i, %19
  %20 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i38, i32 4, i32 31)
  %add.16.i39 = fadd float %add.16.i38, %20
  %21 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i39, i32 2, i32 31)
  %add.16.i40 = fadd float %add.16.i39, %21
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i40, i32 1, i32 31)
  %add.16.i41 = fadd float %add.16.i40, %22
  store float %add.16.i41, ptr addrspace(3) %shmem_transposed_addr, align 4
  %23 = icmp ult i32 %thread_id.y33, %tile_bound1
  %24 = icmp eq i32 %thread_id.x, 0
  %25 = and i1 %24, %23
  br i1 %25, label %reduction_write_output-true, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %Arg_3.43 = load float, ptr addrspace(1) %lsr.iv60, align 4, !invariant.load !77
  %compare.7 = fcmp ogt float %Arg_3.43, 0.000000e+00
  %Arg_1.24 = load float, ptr addrspace(1) %lsr.iv63, align 4, !invariant.load !77
  %Arg_2.35 = load float, ptr addrspace(1) %lsr.iv66, align 4, !invariant.load !77
  %add.8 = fadd float %Arg_1.24, %Arg_2.35
  %Arg_0.16 = load float, ptr addrspace(1) %lsr.iv69, align 4, !invariant.load !77
  %add.9 = fadd float %add.8, %Arg_0.16
  %26 = select i1 %compare.7, float %add.9, float 0.000000e+00
  %add.16.i42 = fadd float %partial_reduction_result.045, %26
  store float %26, ptr addrspace(1) %lsr.iv72, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %27 = or i32 %thread_id.y33, %tile_origin.2
  %28 = mul nuw nsw i32 %.zext44, 968
  %29 = add nuw nsw i32 %27, %28
  %.frozen = freeze i32 %29
  %30 = udiv i32 %.frozen, 968
  %31 = mul i32 %30, 968
  %.decomposed47 = sub i32 %.frozen, %31
  %32 = zext i32 %30 to i64
  %33 = zext i32 %.decomposed47 to i64
  %output_element_address = getelementptr inbounds [64 x [968 x float]], ptr addrspace(1) %arg456, i64 0, i64 %32, i64 %33
  store float %add.16.i41, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @reduce_208(ptr noalias nocapture readonly align 128 dereferenceable(247808) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(3872) %arg2) local_unnamed_addr #0 {
entry:
  %arg234 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg132 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg030 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !91
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %thread_id.x = and i32 %1, 31
  %thread_id.y18 = lshr i32 %1, 5
  %2 = icmp eq i32 %0, 30
  %tile_bound1 = select i1 %2, i32 8, i32 32
  %tile_origin.2 = shl nuw nsw i32 %0, 5
  %Arg_1.2 = load float, ptr addrspace(1) %arg132, align 128, !invariant.load !77
  %3 = or i32 %tile_origin.2, %thread_id.x
  %4 = zext i32 %3 to i64
  %5 = add nuw nsw i32 %thread_id.y18, -32
  %6 = zext i32 %1 to i64
  %7 = lshr i64 %6, 5
  %8 = mul nuw nsw i64 %7, 3872
  %9 = shl nuw nsw i64 %4, 2
  %10 = add i64 %8, %9
  %scevgep = getelementptr i8, ptr addrspace(1) %arg030, i64 %10
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %y_in_tile.loop_exit, %reduction_write_output-true
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %x_in_tile-after
  %lsr.iv36 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep37, %x_in_tile-after ]
  %lsr.iv = phi i32 [ %5, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %partial_reduction_result.028 = phi float [ %Arg_1.2, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %11 = icmp ult i32 %thread_id.x, %tile_bound1
  br i1 %11, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %y_in_tile.loop_body
  %partial_reduction_result.1 = phi float [ %add.6.i27, %x_in_tile-true ], [ %partial_reduction_result.028, %y_in_tile.loop_body ]
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep37 = getelementptr i8, ptr addrspace(1) %lsr.iv36, i64 123904
  %12 = icmp ugt i32 %lsr.iv.next, 31
  br i1 %12, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after
  %13 = zext i32 %thread_id.x to i64
  %14 = zext i32 %thread_id.y18 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache17, i64 0, i64 0, i64 0, i64 %13, i64 %14
  store float %partial_reduction_result.1, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache17, i64 0, i64 0, i64 0, i64 %14, i64 %13
  %partial_reduction_result4 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %15 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  %add.6.i = fadd float %partial_reduction_result4, %15
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i, i32 8, i32 31)
  %add.6.i23 = fadd float %add.6.i, %16
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i23, i32 4, i32 31)
  %add.6.i24 = fadd float %add.6.i23, %17
  %18 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i24, i32 2, i32 31)
  %add.6.i25 = fadd float %add.6.i24, %18
  %19 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i25, i32 1, i32 31)
  %add.6.i26 = fadd float %add.6.i25, %19
  store float %add.6.i26, ptr addrspace(3) %shmem_transposed_addr, align 4
  %20 = icmp ult i32 %thread_id.y18, %tile_bound1
  %21 = icmp eq i32 %thread_id.x, 0
  %22 = and i1 %21, %20
  %23 = or i32 %tile_origin.2, %thread_id.y18
  %24 = zext i32 %23 to i64
  %output_element_address = getelementptr inbounds [968 x float], ptr addrspace(1) %arg234, i64 0, i64 %24
  br i1 %22, label %reduction_write_output-true, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %Arg_0.13 = load float, ptr addrspace(1) %lsr.iv36, align 4, !invariant.load !77
  %add.6.i27 = fadd float %partial_reduction_result.028, %Arg_0.13
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.6.i26, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_43(ptr noalias nocapture readonly align 16 dereferenceable(3872) %arg0, ptr noalias nocapture align 128 dereferenceable(3872) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #4 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !92
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !77
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.5 = fmul float %4, %6
  %subtract.6 = fsub float %3, %multiply.5
  store float %subtract.6, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_42(ptr noalias nocapture readonly align 16 dereferenceable(524288) %arg0, ptr noalias nocapture align 128 dereferenceable(524288) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #4 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !80
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !89
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg07, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !77
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !77
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
define void @fusion_41(ptr noalias nocapture readonly align 16 dereferenceable(61952) %arg0, ptr noalias nocapture align 128 dereferenceable(61952) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #4 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !81
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = icmp ult i32 %linear_index, 15488
  br i1 %3, label %fusion_41.in_bounds-true, label %fusion_41.in_bounds-after

fusion_41.in_bounds-after:                        ; preds = %fusion_41.in_bounds-true, %entry
  ret void

fusion_41.in_bounds-true:                         ; preds = %entry
  %4 = zext i32 %linear_index to i64
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %4
  %6 = load float, ptr addrspace(1) %5, align 4, !invariant.load !77
  %7 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %8 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %4
  %9 = load float, ptr addrspace(1) %8, align 4
  %multiply.5 = fmul float %7, %9
  %subtract.6 = fsub float %6, %multiply.5
  store float %subtract.6, ptr addrspace(1) %8, align 4
  br label %fusion_41.in_bounds-after
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_40(ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(262144) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(262144) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(262144) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg7, ptr noalias nocapture align 128 dereferenceable(262144) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg9, ptr noalias nocapture align 128 dereferenceable(262144) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(262144) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(262144) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(262144) %arg13) local_unnamed_addr #4 {
entry:
  %arg1328 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1226 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1124 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1022 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg920 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg818 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg716 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg614 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg512 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg410 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !75
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !77
  %6 = load float, ptr addrspace(1) %arg26, align 16, !invariant.load !77
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg14, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !77
  %multiply.13 = fmul float %6, %8
  %subtract.14 = fsub float %5, %multiply.13
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg38, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !77
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg410, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !77
  %multiply.15 = fmul float %6, %12
  %subtract.16 = fsub float %10, %multiply.15
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg512, i64 %3
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !77
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg614, i64 %3
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !77
  %multiply.17 = fmul float %6, %16
  %subtract.18 = fsub float %14, %multiply.17
  %17 = getelementptr inbounds float, ptr addrspace(1) %arg716, i64 %3
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !77
  %19 = getelementptr inbounds float, ptr addrspace(1) %arg818, i64 %3
  %20 = load float, ptr addrspace(1) %19, align 4
  %multiply.19 = fmul float %6, %20
  %subtract.20 = fsub float %18, %multiply.19
  %21 = getelementptr inbounds float, ptr addrspace(1) %arg920, i64 %3
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !77
  %23 = getelementptr inbounds float, ptr addrspace(1) %arg1022, i64 %3
  %24 = load float, ptr addrspace(1) %23, align 4
  %multiply.21 = fmul float %6, %24
  %subtract.22 = fsub float %22, %multiply.21
  %25 = getelementptr inbounds float, ptr addrspace(1) %arg1124, i64 %3
  store float %subtract.14, ptr addrspace(1) %25, align 4
  %26 = getelementptr inbounds float, ptr addrspace(1) %arg1226, i64 %3
  store float %subtract.16, ptr addrspace(1) %26, align 4
  %27 = getelementptr inbounds float, ptr addrspace(1) %arg1328, i64 %3
  store float %subtract.18, ptr addrspace(1) %27, align 4
  store float %subtract.20, ptr addrspace(1) %23, align 4
  store float %subtract.22, ptr addrspace(1) %19, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_39(ptr noalias nocapture readonly align 16 dereferenceable(30976) %arg0, ptr noalias nocapture align 128 dereferenceable(30976) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(30976) %arg3, ptr noalias nocapture align 128 dereferenceable(30976) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(30976) %arg5, ptr noalias nocapture align 128 dereferenceable(30976) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(30976) %arg7, ptr noalias nocapture align 128 dereferenceable(30976) %arg8) local_unnamed_addr #4 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !79
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = icmp ult i32 %linear_index, 7744
  br i1 %3, label %fusion_39.in_bounds-true, label %fusion_39.in_bounds-after

fusion_39.in_bounds-after:                        ; preds = %fusion_39.in_bounds-true, %entry
  ret void

fusion_39.in_bounds-true:                         ; preds = %entry
  %4 = zext i32 %linear_index to i64
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %4
  %6 = load float, ptr addrspace(1) %5, align 4, !invariant.load !77
  %7 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %8 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %4
  %9 = load float, ptr addrspace(1) %8, align 4
  %multiply.11 = fmul float %7, %9
  %subtract.12 = fsub float %6, %multiply.11
  %10 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %4
  %11 = load float, ptr addrspace(1) %10, align 4, !invariant.load !77
  %12 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %4
  %13 = load float, ptr addrspace(1) %12, align 4
  %multiply.13 = fmul float %7, %13
  %subtract.14 = fsub float %11, %multiply.13
  %14 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %4
  %15 = load float, ptr addrspace(1) %14, align 4, !invariant.load !77
  %16 = getelementptr inbounds float, ptr addrspace(1) %arg613, i64 %4
  %17 = load float, ptr addrspace(1) %16, align 4
  %multiply.15 = fmul float %7, %17
  %subtract.16 = fsub float %15, %multiply.15
  %18 = getelementptr inbounds float, ptr addrspace(1) %arg715, i64 %4
  %19 = load float, ptr addrspace(1) %18, align 4, !invariant.load !77
  %20 = getelementptr inbounds float, ptr addrspace(1) %arg817, i64 %4
  %21 = load float, ptr addrspace(1) %20, align 4
  %multiply.17 = fmul float %7, %21
  %subtract.18 = fsub float %19, %multiply.17
  store float %subtract.12, ptr addrspace(1) %20, align 4
  store float %subtract.14, ptr addrspace(1) %16, align 4
  store float %subtract.16, ptr addrspace(1) %12, align 4
  store float %subtract.18, ptr addrspace(1) %8, align 4
  br label %fusion_39.in_bounds-after
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_30(ptr noalias nocapture readonly align 16 dereferenceable(14680064) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(425984) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(425984) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(14680064) %arg7) local_unnamed_addr #4 {
entry:
  %arg733 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg631 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg529 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg427 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !93
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !89
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
  %10 = getelementptr float, ptr addrspace(1) %arg019, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !77
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg121, align 16, !invariant.load !77
  %17 = lshr i32 %.decomposed, 6
  %18 = zext i32 %4 to i64
  %19 = zext i32 %.decomposed to i64
  %20 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg631, i64 0, i64 %18, i64 %19
  %21 = load float, ptr addrspace(1) %20, align 4, !invariant.load !77
  %22 = zext i32 %17 to i64
  %23 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg529, i64 0, i64 %18, i64 %22, i64 0
  %24 = load float, ptr addrspace(1) %23, align 4, !invariant.load !77
  %multiply.13 = fmul float %21, %24
  %25 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg325, i64 0, i64 %18, i64 %19
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !77
  %27 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg427, i64 0, i64 %18, i64 %19
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !77
  %add.14 = fadd float %26, %28
  %29 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg223, i64 0, i64 %18, i64 %22, i64 0
  %30 = load float, ptr addrspace(1) %29, align 4, !invariant.load !77
  %multiply.19 = fmul float %add.14, %30
  %add.20 = fadd float %multiply.13, %multiply.19
  %multiply.23 = fmul float %16, %add.20
  %subtract.24 = fsub float %12, %multiply.23
  %31 = getelementptr float, ptr addrspace(1) %arg733, i64 %9
  %32 = lshr i32 %7, 6
  %33 = zext i32 %7 to i64
  %34 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg631, i64 0, i64 %18, i64 %33
  %35 = load float, ptr addrspace(1) %34, align 4, !invariant.load !77
  %36 = zext i32 %32 to i64
  %37 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg529, i64 0, i64 %18, i64 %36, i64 0
  %38 = load float, ptr addrspace(1) %37, align 4, !invariant.load !77
  %multiply.131 = fmul float %35, %38
  %39 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg325, i64 0, i64 %18, i64 %33
  %40 = load float, ptr addrspace(1) %39, align 4, !invariant.load !77
  %41 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg427, i64 0, i64 %18, i64 %33
  %42 = load float, ptr addrspace(1) %41, align 4, !invariant.load !77
  %add.142 = fadd float %40, %42
  %43 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg223, i64 0, i64 %18, i64 %36, i64 0
  %44 = load float, ptr addrspace(1) %43, align 4, !invariant.load !77
  %multiply.193 = fmul float %add.142, %44
  %add.204 = fadd float %multiply.131, %multiply.193
  %multiply.235 = fmul float %16, %add.204
  %subtract.246 = fsub float %13, %multiply.235
  %45 = lshr i32 %6, 6
  %46 = zext i32 %6 to i64
  %47 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg631, i64 0, i64 %18, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !77
  %49 = zext i32 %45 to i64
  %50 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg529, i64 0, i64 %18, i64 %49, i64 0
  %51 = load float, ptr addrspace(1) %50, align 4, !invariant.load !77
  %multiply.137 = fmul float %48, %51
  %52 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg325, i64 0, i64 %18, i64 %46
  %53 = load float, ptr addrspace(1) %52, align 4, !invariant.load !77
  %54 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg427, i64 0, i64 %18, i64 %46
  %55 = load float, ptr addrspace(1) %54, align 4, !invariant.load !77
  %add.148 = fadd float %53, %55
  %56 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg223, i64 0, i64 %18, i64 %49, i64 0
  %57 = load float, ptr addrspace(1) %56, align 4, !invariant.load !77
  %multiply.199 = fmul float %add.148, %57
  %add.2010 = fadd float %multiply.137, %multiply.199
  %multiply.2311 = fmul float %16, %add.2010
  %subtract.2412 = fsub float %14, %multiply.2311
  %58 = lshr i32 %5, 6
  %59 = zext i32 %5 to i64
  %60 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg631, i64 0, i64 %18, i64 %59
  %61 = load float, ptr addrspace(1) %60, align 4, !invariant.load !77
  %62 = zext i32 %58 to i64
  %63 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg529, i64 0, i64 %18, i64 %62, i64 0
  %64 = load float, ptr addrspace(1) %63, align 4, !invariant.load !77
  %multiply.1313 = fmul float %61, %64
  %65 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg325, i64 0, i64 %18, i64 %59
  %66 = load float, ptr addrspace(1) %65, align 4, !invariant.load !77
  %67 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg427, i64 0, i64 %18, i64 %59
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !77
  %add.1414 = fadd float %66, %68
  %69 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr addrspace(1) %arg223, i64 0, i64 %18, i64 %62, i64 0
  %70 = load float, ptr addrspace(1) %69, align 4, !invariant.load !77
  %multiply.1915 = fmul float %add.1414, %70
  %add.2016 = fadd float %multiply.1313, %multiply.1915
  %multiply.2317 = fmul float %16, %add.2016
  %subtract.2418 = fsub float %15, %multiply.2317
  %71 = insertelement <4 x float> poison, float %subtract.24, i32 0
  %72 = insertelement <4 x float> %71, float %subtract.246, i32 1
  %73 = insertelement <4 x float> %72, float %subtract.2412, i32 2
  %74 = insertelement <4 x float> %73, float %subtract.2418, i32 3
  store <4 x float> %74, ptr addrspace(1) %31, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_27(ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg0, ptr noalias nocapture align 128 dereferenceable(4194304) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(4194304) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg5) local_unnamed_addr #4 {
entry:
  %arg524 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg422 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg320 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg218 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg014 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !94
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !80
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = load float, ptr addrspace(1) %arg218, align 16
  %5 = zext i32 %linear_index_base to i64
  %6 = getelementptr float, ptr addrspace(1) %arg014, i64 %5
  %7 = load <4 x float>, ptr addrspace(1) %6, align 16, !invariant.load !77
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
  %19 = load <4 x float>, ptr addrspace(1) %18, align 16, !invariant.load !77
  %20 = extractelement <4 x float> %19, i32 0
  %21 = extractelement <4 x float> %19, i32 1
  %22 = extractelement <4 x float> %19, i32 2
  %23 = extractelement <4 x float> %19, i32 3
  %24 = getelementptr float, ptr addrspace(1) %arg422, i64 %5
  %25 = load <4 x float>, ptr addrspace(1) %24, align 16, !invariant.load !77
  %26 = extractelement <4 x float> %25, i32 0
  %27 = extractelement <4 x float> %25, i32 1
  %28 = extractelement <4 x float> %25, i32 2
  %29 = extractelement <4 x float> %25, i32 3
  %multiply.9 = fmul float %4, %26
  %subtract.10 = fsub float %20, %multiply.9
  %30 = getelementptr float, ptr addrspace(1) %arg524, i64 %5
  %31 = getelementptr inbounds float, ptr addrspace(1) %6, i64 1
  %32 = getelementptr inbounds float, ptr addrspace(1) %12, i64 1
  %multiply.71 = fmul float %4, %15
  %subtract.82 = fsub float %9, %multiply.71
  %33 = getelementptr inbounds float, ptr addrspace(1) %18, i64 1
  %34 = getelementptr inbounds float, ptr addrspace(1) %24, i64 1
  %multiply.93 = fmul float %4, %27
  %subtract.104 = fsub float %21, %multiply.93
  %35 = getelementptr inbounds float, ptr addrspace(1) %30, i64 1
  %36 = getelementptr inbounds float, ptr addrspace(1) %6, i64 2
  %37 = getelementptr inbounds float, ptr addrspace(1) %12, i64 2
  %multiply.75 = fmul float %4, %16
  %subtract.86 = fsub float %10, %multiply.75
  %38 = getelementptr inbounds float, ptr addrspace(1) %18, i64 2
  %39 = getelementptr inbounds float, ptr addrspace(1) %24, i64 2
  %multiply.97 = fmul float %4, %28
  %subtract.108 = fsub float %22, %multiply.97
  %40 = getelementptr inbounds float, ptr addrspace(1) %30, i64 2
  %41 = getelementptr inbounds float, ptr addrspace(1) %6, i64 3
  %42 = getelementptr inbounds float, ptr addrspace(1) %12, i64 3
  %multiply.79 = fmul float %4, %17
  %subtract.810 = fsub float %11, %multiply.79
  %43 = getelementptr inbounds float, ptr addrspace(1) %18, i64 3
  %44 = getelementptr inbounds float, ptr addrspace(1) %24, i64 3
  %multiply.911 = fmul float %4, %29
  %subtract.1012 = fsub float %23, %multiply.911
  %45 = getelementptr inbounds float, ptr addrspace(1) %30, i64 3
  %46 = insertelement <4 x float> poison, float %subtract.8, i32 0
  %47 = insertelement <4 x float> %46, float %subtract.82, i32 1
  %48 = insertelement <4 x float> %47, float %subtract.86, i32 2
  %49 = insertelement <4 x float> %48, float %subtract.810, i32 3
  store <4 x float> %49, ptr addrspace(1) %30, align 16
  %50 = insertelement <4 x float> poison, float %subtract.10, i32 0
  %51 = insertelement <4 x float> %50, float %subtract.104, i32 1
  %52 = insertelement <4 x float> %51, float %subtract.108, i32 2
  %53 = insertelement <4 x float> %52, float %subtract.1012, i32 3
  store <4 x float> %53, ptr addrspace(1) %12, align 16
  %54 = getelementptr inbounds float, ptr addrspace(1) %6, i64 442368
  %55 = load <4 x float>, ptr addrspace(1) %54, align 16, !invariant.load !77
  %56 = extractelement <4 x float> %55, i32 0
  %57 = extractelement <4 x float> %55, i32 1
  %58 = extractelement <4 x float> %55, i32 2
  %59 = extractelement <4 x float> %55, i32 3
  %60 = getelementptr inbounds float, ptr addrspace(1) %12, i64 442368
  %61 = load <4 x float>, ptr addrspace(1) %60, align 16
  %62 = extractelement <4 x float> %61, i32 0
  %63 = extractelement <4 x float> %61, i32 1
  %64 = extractelement <4 x float> %61, i32 2
  %65 = extractelement <4 x float> %61, i32 3
  %multiply.7.1 = fmul float %4, %62
  %subtract.8.1 = fsub float %56, %multiply.7.1
  %66 = getelementptr inbounds float, ptr addrspace(1) %18, i64 442368
  %67 = load <4 x float>, ptr addrspace(1) %66, align 16, !invariant.load !77
  %68 = extractelement <4 x float> %67, i32 0
  %69 = extractelement <4 x float> %67, i32 1
  %70 = extractelement <4 x float> %67, i32 2
  %71 = extractelement <4 x float> %67, i32 3
  %72 = getelementptr inbounds float, ptr addrspace(1) %24, i64 442368
  %73 = load <4 x float>, ptr addrspace(1) %72, align 16, !invariant.load !77
  %74 = extractelement <4 x float> %73, i32 0
  %75 = extractelement <4 x float> %73, i32 1
  %76 = extractelement <4 x float> %73, i32 2
  %77 = extractelement <4 x float> %73, i32 3
  %multiply.9.1 = fmul float %4, %74
  %subtract.10.1 = fsub float %68, %multiply.9.1
  %78 = getelementptr inbounds float, ptr addrspace(1) %30, i64 442368
  %multiply.71.1 = fmul float %4, %63
  %subtract.82.1 = fsub float %57, %multiply.71.1
  %multiply.93.1 = fmul float %4, %75
  %subtract.104.1 = fsub float %69, %multiply.93.1
  %multiply.75.1 = fmul float %4, %64
  %subtract.86.1 = fsub float %58, %multiply.75.1
  %multiply.97.1 = fmul float %4, %76
  %subtract.108.1 = fsub float %70, %multiply.97.1
  %multiply.79.1 = fmul float %4, %65
  %subtract.810.1 = fsub float %59, %multiply.79.1
  %multiply.911.1 = fmul float %4, %77
  %subtract.1012.1 = fsub float %71, %multiply.911.1
  %79 = insertelement <4 x float> poison, float %subtract.8.1, i32 0
  %80 = insertelement <4 x float> %79, float %subtract.82.1, i32 1
  %81 = insertelement <4 x float> %80, float %subtract.86.1, i32 2
  %82 = insertelement <4 x float> %81, float %subtract.810.1, i32 3
  store <4 x float> %82, ptr addrspace(1) %78, align 16
  %83 = insertelement <4 x float> poison, float %subtract.10.1, i32 0
  %84 = insertelement <4 x float> %83, float %subtract.104.1, i32 1
  %85 = insertelement <4 x float> %84, float %subtract.108.1, i32 2
  %86 = insertelement <4 x float> %85, float %subtract.1012.1, i32 3
  store <4 x float> %86, ptr addrspace(1) %60, align 16
  %87 = icmp ult i32 %linear_index_base, 163840
  br i1 %87, label %fusion_27.in_bounds-true.2, label %fusion_27.in_bounds-after.2

fusion_27.in_bounds-true.2:                       ; preds = %entry
  %88 = getelementptr inbounds float, ptr addrspace(1) %6, i64 884736
  %89 = load <4 x float>, ptr addrspace(1) %88, align 16, !invariant.load !77
  %90 = extractelement <4 x float> %89, i32 0
  %91 = extractelement <4 x float> %89, i32 1
  %92 = extractelement <4 x float> %89, i32 2
  %93 = extractelement <4 x float> %89, i32 3
  %94 = getelementptr inbounds float, ptr addrspace(1) %12, i64 884736
  %95 = load <4 x float>, ptr addrspace(1) %94, align 16
  %96 = extractelement <4 x float> %95, i32 0
  %97 = extractelement <4 x float> %95, i32 1
  %98 = extractelement <4 x float> %95, i32 2
  %99 = extractelement <4 x float> %95, i32 3
  %multiply.7.2 = fmul float %4, %96
  %subtract.8.2 = fsub float %90, %multiply.7.2
  %100 = getelementptr inbounds float, ptr addrspace(1) %18, i64 884736
  %101 = load <4 x float>, ptr addrspace(1) %100, align 16, !invariant.load !77
  %102 = extractelement <4 x float> %101, i32 0
  %103 = extractelement <4 x float> %101, i32 1
  %104 = extractelement <4 x float> %101, i32 2
  %105 = extractelement <4 x float> %101, i32 3
  %106 = getelementptr inbounds float, ptr addrspace(1) %24, i64 884736
  %107 = load <4 x float>, ptr addrspace(1) %106, align 16, !invariant.load !77
  %108 = extractelement <4 x float> %107, i32 0
  %109 = extractelement <4 x float> %107, i32 1
  %110 = extractelement <4 x float> %107, i32 2
  %111 = extractelement <4 x float> %107, i32 3
  %multiply.9.2 = fmul float %4, %108
  %subtract.10.2 = fsub float %102, %multiply.9.2
  %112 = getelementptr inbounds float, ptr addrspace(1) %30, i64 884736
  %multiply.71.2 = fmul float %4, %97
  %subtract.82.2 = fsub float %91, %multiply.71.2
  %multiply.93.2 = fmul float %4, %109
  %subtract.104.2 = fsub float %103, %multiply.93.2
  %multiply.75.2 = fmul float %4, %98
  %subtract.86.2 = fsub float %92, %multiply.75.2
  %multiply.97.2 = fmul float %4, %110
  %subtract.108.2 = fsub float %104, %multiply.97.2
  %multiply.79.2 = fmul float %4, %99
  %subtract.810.2 = fsub float %93, %multiply.79.2
  %multiply.911.2 = fmul float %4, %111
  %subtract.1012.2 = fsub float %105, %multiply.911.2
  %113 = insertelement <4 x float> poison, float %subtract.8.2, i32 0
  %114 = insertelement <4 x float> %113, float %subtract.82.2, i32 1
  %115 = insertelement <4 x float> %114, float %subtract.86.2, i32 2
  %116 = insertelement <4 x float> %115, float %subtract.810.2, i32 3
  store <4 x float> %116, ptr addrspace(1) %112, align 16
  %117 = insertelement <4 x float> poison, float %subtract.10.2, i32 0
  %118 = insertelement <4 x float> %117, float %subtract.104.2, i32 1
  %119 = insertelement <4 x float> %118, float %subtract.108.2, i32 2
  %120 = insertelement <4 x float> %119, float %subtract.1012.2, i32 3
  store <4 x float> %120, ptr addrspace(1) %94, align 16
  br label %fusion_27.in_bounds-after.2

fusion_27.in_bounds-after.2:                      ; preds = %fusion_27.in_bounds-true.2, %entry
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_24(ptr noalias nocapture readonly align 16 dereferenceable(1572864) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(557056) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(557056) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(1572864) %arg7) local_unnamed_addr #4 {
entry:
  %arg733 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg631 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg529 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg427 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !95
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !89
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
  %10 = getelementptr float, ptr addrspace(1) %arg019, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !77
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg121, align 16, !invariant.load !77
  %17 = lshr i32 %.decomposed, 3
  %18 = or i32 %.decomposed, 832
  %19 = zext i32 %4 to i64
  %20 = zext i32 %18 to i64
  %21 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg529, i64 0, i64 %19, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !77
  %23 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg631, i64 0, i64 %19, i64 %20
  %24 = load float, ptr addrspace(1) %23, align 4, !invariant.load !77
  %add.9 = fadd float %22, %24
  %25 = zext i32 %17 to i64
  %26 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg427, i64 0, i64 %19, i64 %25, i64 0
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !77
  %multiply.14 = fmul float %add.9, %27
  %28 = getelementptr inbounds [8192 x [968 x float]], ptr addrspace(1) %arg325, i64 0, i64 %19, i64 %20
  %29 = load float, ptr addrspace(1) %28, align 4, !invariant.load !77
  %30 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg223, i64 0, i64 %19, i64 %25, i64 0
  %31 = load float, ptr addrspace(1) %30, align 4, !invariant.load !77
  %multiply.19 = fmul float %29, %31
  %add.20 = fadd float %multiply.14, %multiply.19
  %multiply.23 = fmul float %16, %add.20
  %subtract.24 = fsub float %12, %multiply.23
  %32 = getelementptr float, ptr addrspace(1) %arg733, i64 %9
  %33 = lshr i32 %7, 3
  %34 = zext i32 %7 to i64
  %35 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg529, i64 0, i64 %19, i64 %34
  %36 = getelementptr inbounds float, ptr addrspace(1) %35, i64 832
  %37 = load float, ptr addrspace(1) %36, align 4, !invariant.load !77
  %38 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg631, i64 0, i64 %19, i64 %34
  %39 = getelementptr inbounds float, ptr addrspace(1) %38, i64 832
  %40 = load float, ptr addrspace(1) %39, align 4, !invariant.load !77
  %add.91 = fadd float %37, %40
  %41 = zext i32 %33 to i64
  %42 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg427, i64 0, i64 %19, i64 %41, i64 0
  %43 = load float, ptr addrspace(1) %42, align 4, !invariant.load !77
  %multiply.142 = fmul float %add.91, %43
  %44 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg325, i64 0, i64 %19, i64 %34
  %45 = getelementptr inbounds float, ptr addrspace(1) %44, i64 832
  %46 = load float, ptr addrspace(1) %45, align 4, !invariant.load !77
  %47 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg223, i64 0, i64 %19, i64 %41, i64 0
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !77
  %multiply.193 = fmul float %46, %48
  %add.204 = fadd float %multiply.142, %multiply.193
  %multiply.235 = fmul float %16, %add.204
  %subtract.246 = fsub float %13, %multiply.235
  %49 = lshr i32 %6, 3
  %50 = zext i32 %6 to i64
  %51 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg529, i64 0, i64 %19, i64 %50
  %52 = getelementptr inbounds float, ptr addrspace(1) %51, i64 832
  %53 = load float, ptr addrspace(1) %52, align 4, !invariant.load !77
  %54 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg631, i64 0, i64 %19, i64 %50
  %55 = getelementptr inbounds float, ptr addrspace(1) %54, i64 832
  %56 = load float, ptr addrspace(1) %55, align 4, !invariant.load !77
  %add.97 = fadd float %53, %56
  %57 = zext i32 %49 to i64
  %58 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg427, i64 0, i64 %19, i64 %57, i64 0
  %59 = load float, ptr addrspace(1) %58, align 4, !invariant.load !77
  %multiply.148 = fmul float %add.97, %59
  %60 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg325, i64 0, i64 %19, i64 %50
  %61 = getelementptr inbounds float, ptr addrspace(1) %60, i64 832
  %62 = load float, ptr addrspace(1) %61, align 4, !invariant.load !77
  %63 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg223, i64 0, i64 %19, i64 %57, i64 0
  %64 = load float, ptr addrspace(1) %63, align 4, !invariant.load !77
  %multiply.199 = fmul float %62, %64
  %add.2010 = fadd float %multiply.148, %multiply.199
  %multiply.2311 = fmul float %16, %add.2010
  %subtract.2412 = fsub float %14, %multiply.2311
  %65 = lshr i32 %5, 3
  %66 = zext i32 %5 to i64
  %67 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg529, i64 0, i64 %19, i64 %66
  %68 = getelementptr inbounds float, ptr addrspace(1) %67, i64 832
  %69 = load float, ptr addrspace(1) %68, align 4, !invariant.load !77
  %70 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg631, i64 0, i64 %19, i64 %66
  %71 = getelementptr inbounds float, ptr addrspace(1) %70, i64 832
  %72 = load float, ptr addrspace(1) %71, align 4, !invariant.load !77
  %add.913 = fadd float %69, %72
  %73 = zext i32 %65 to i64
  %74 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg427, i64 0, i64 %19, i64 %73, i64 0
  %75 = load float, ptr addrspace(1) %74, align 4, !invariant.load !77
  %multiply.1414 = fmul float %add.913, %75
  %76 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg325, i64 0, i64 %19, i64 %66
  %77 = getelementptr inbounds float, ptr addrspace(1) %76, i64 832
  %78 = load float, ptr addrspace(1) %77, align 4, !invariant.load !77
  %79 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg223, i64 0, i64 %19, i64 %73, i64 0
  %80 = load float, ptr addrspace(1) %79, align 4, !invariant.load !77
  %multiply.1915 = fmul float %78, %80
  %add.2016 = fadd float %multiply.1414, %multiply.1915
  %multiply.2317 = fmul float %16, %add.2016
  %subtract.2418 = fsub float %15, %multiply.2317
  %81 = insertelement <4 x float> poison, float %subtract.24, i32 0
  %82 = insertelement <4 x float> %81, float %subtract.246, i32 1
  %83 = insertelement <4 x float> %82, float %subtract.2412, i32 2
  %84 = insertelement <4 x float> %83, float %subtract.2418, i32 3
  store <4 x float> %84, ptr addrspace(1) %32, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_23(ptr noalias nocapture readonly align 16 dereferenceable(786432) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(557056) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(557056) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(786432) %arg7) local_unnamed_addr #4 {
entry:
  %arg733 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg631 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg529 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg427 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !96
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !89
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
  %10 = getelementptr float, ptr addrspace(1) %arg019, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !77
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg121, align 16, !invariant.load !77
  %17 = add nuw nsw i32 %.decomposed, 112
  %18 = lshr i32 %17, 3
  %19 = zext i32 %4 to i64
  %20 = zext i32 %.decomposed to i64
  %21 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg529, i64 0, i64 %19, i64 %20
  %22 = getelementptr inbounds float, ptr addrspace(1) %21, i64 944
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !77
  %24 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg631, i64 0, i64 %19, i64 %20
  %25 = getelementptr inbounds float, ptr addrspace(1) %24, i64 944
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !77
  %add.9 = fadd float %23, %26
  %27 = zext i32 %18 to i64
  %28 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg427, i64 0, i64 %19, i64 %27, i64 0
  %29 = load float, ptr addrspace(1) %28, align 4, !invariant.load !77
  %multiply.14 = fmul float %add.9, %29
  %30 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg325, i64 0, i64 %19, i64 %20
  %31 = getelementptr inbounds float, ptr addrspace(1) %30, i64 944
  %32 = load float, ptr addrspace(1) %31, align 4, !invariant.load !77
  %33 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg223, i64 0, i64 %19, i64 %27, i64 0
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !77
  %multiply.19 = fmul float %32, %34
  %add.20 = fadd float %multiply.14, %multiply.19
  %multiply.23 = fmul float %16, %add.20
  %subtract.24 = fsub float %12, %multiply.23
  %35 = getelementptr float, ptr addrspace(1) %arg733, i64 %9
  %36 = add nuw nsw i32 %7, 112
  %37 = lshr i32 %36, 3
  %38 = zext i32 %7 to i64
  %39 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg529, i64 0, i64 %19, i64 %38
  %40 = getelementptr inbounds float, ptr addrspace(1) %39, i64 944
  %41 = load float, ptr addrspace(1) %40, align 4, !invariant.load !77
  %42 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg631, i64 0, i64 %19, i64 %38
  %43 = getelementptr inbounds float, ptr addrspace(1) %42, i64 944
  %44 = load float, ptr addrspace(1) %43, align 4, !invariant.load !77
  %add.91 = fadd float %41, %44
  %45 = zext i32 %37 to i64
  %46 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg427, i64 0, i64 %19, i64 %45, i64 0
  %47 = load float, ptr addrspace(1) %46, align 4, !invariant.load !77
  %multiply.142 = fmul float %add.91, %47
  %48 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg325, i64 0, i64 %19, i64 %38
  %49 = getelementptr inbounds float, ptr addrspace(1) %48, i64 944
  %50 = load float, ptr addrspace(1) %49, align 4, !invariant.load !77
  %51 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg223, i64 0, i64 %19, i64 %45, i64 0
  %52 = load float, ptr addrspace(1) %51, align 4, !invariant.load !77
  %multiply.193 = fmul float %50, %52
  %add.204 = fadd float %multiply.142, %multiply.193
  %multiply.235 = fmul float %16, %add.204
  %subtract.246 = fsub float %13, %multiply.235
  %53 = add nuw nsw i32 %6, 112
  %54 = lshr i32 %53, 3
  %55 = zext i32 %6 to i64
  %56 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg529, i64 0, i64 %19, i64 %55
  %57 = getelementptr inbounds float, ptr addrspace(1) %56, i64 944
  %58 = load float, ptr addrspace(1) %57, align 4, !invariant.load !77
  %59 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg631, i64 0, i64 %19, i64 %55
  %60 = getelementptr inbounds float, ptr addrspace(1) %59, i64 944
  %61 = load float, ptr addrspace(1) %60, align 4, !invariant.load !77
  %add.97 = fadd float %58, %61
  %62 = zext i32 %54 to i64
  %63 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg427, i64 0, i64 %19, i64 %62, i64 0
  %64 = load float, ptr addrspace(1) %63, align 4, !invariant.load !77
  %multiply.148 = fmul float %add.97, %64
  %65 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg325, i64 0, i64 %19, i64 %55
  %66 = getelementptr inbounds float, ptr addrspace(1) %65, i64 944
  %67 = load float, ptr addrspace(1) %66, align 4, !invariant.load !77
  %68 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg223, i64 0, i64 %19, i64 %62, i64 0
  %69 = load float, ptr addrspace(1) %68, align 4, !invariant.load !77
  %multiply.199 = fmul float %67, %69
  %add.2010 = fadd float %multiply.148, %multiply.199
  %multiply.2311 = fmul float %16, %add.2010
  %subtract.2412 = fsub float %14, %multiply.2311
  %70 = add nuw nsw i32 %5, 112
  %71 = lshr i32 %70, 3
  %72 = zext i32 %5 to i64
  %73 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg529, i64 0, i64 %19, i64 %72
  %74 = getelementptr inbounds float, ptr addrspace(1) %73, i64 944
  %75 = load float, ptr addrspace(1) %74, align 4, !invariant.load !77
  %76 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg631, i64 0, i64 %19, i64 %72
  %77 = getelementptr inbounds float, ptr addrspace(1) %76, i64 944
  %78 = load float, ptr addrspace(1) %77, align 4, !invariant.load !77
  %add.913 = fadd float %75, %78
  %79 = zext i32 %71 to i64
  %80 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg427, i64 0, i64 %19, i64 %79, i64 0
  %81 = load float, ptr addrspace(1) %80, align 4, !invariant.load !77
  %multiply.1414 = fmul float %add.913, %81
  %82 = getelementptr [8192 x [968 x float]], ptr addrspace(1) %arg325, i64 0, i64 %19, i64 %72
  %83 = getelementptr inbounds float, ptr addrspace(1) %82, i64 944
  %84 = load float, ptr addrspace(1) %83, align 4, !invariant.load !77
  %85 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr addrspace(1) %arg223, i64 0, i64 %19, i64 %79, i64 0
  %86 = load float, ptr addrspace(1) %85, align 4, !invariant.load !77
  %multiply.1915 = fmul float %84, %86
  %add.2016 = fadd float %multiply.1414, %multiply.1915
  %multiply.2317 = fmul float %16, %add.2016
  %subtract.2418 = fsub float %15, %multiply.2317
  %87 = insertelement <4 x float> poison, float %subtract.24, i32 0
  %88 = insertelement <4 x float> %87, float %subtract.246, i32 1
  %89 = insertelement <4 x float> %88, float %subtract.2412, i32 2
  %90 = insertelement <4 x float> %89, float %subtract.2418, i32 3
  store <4 x float> %90, ptr addrspace(1) %35, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_11(ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg0, ptr noalias nocapture align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg3, ptr noalias nocapture align 128 dereferenceable(131072) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg5, ptr noalias nocapture align 128 dereferenceable(131072) %arg6) local_unnamed_addr #4 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !97
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !77
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.9 = fmul float %6, %8
  %subtract.10 = fsub float %5, %multiply.9
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !77
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4
  %multiply.11 = fmul float %6, %12
  %subtract.12 = fsub float %10, %multiply.11
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %3
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !77
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
define void @fusion_7(ptr noalias nocapture readonly align 16 dereferenceable(16384) %arg0, ptr noalias nocapture align 128 dereferenceable(16384) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #4 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !98
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !77
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_6(ptr noalias nocapture readonly align 16 dereferenceable(917504) %arg0, ptr noalias nocapture align 128 dereferenceable(917504) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #4 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !99
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !89
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg07, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !77
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !77
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
define void @fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg0, ptr noalias nocapture align 128 dereferenceable(262144) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg3, ptr noalias nocapture align 128 dereferenceable(262144) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg5, ptr noalias nocapture align 128 dereferenceable(262144) %arg6) local_unnamed_addr #4 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !75
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !77
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.9 = fmul float %6, %8
  %subtract.10 = fsub float %5, %multiply.9
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !77
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4
  %multiply.11 = fmul float %6, %12
  %subtract.12 = fsub float %10, %multiply.11
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %3
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !77
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
define void @fusion_2(ptr noalias nocapture readonly align 16 dereferenceable(98304) %arg0, ptr noalias nocapture align 128 dereferenceable(98304) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #4 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !100
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !77
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion(ptr noalias nocapture readonly align 16 dereferenceable(49152) %arg0, ptr noalias nocapture align 128 dereferenceable(49152) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #4 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !101
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !77
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !77
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

attributes #0 = { nounwind }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind }
attributes #3 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #4 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind memory(write, argmem: readwrite, inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73}
!llvm.module.flags = !{!74}

!0 = !{ptr @fusion_71, !"kernel", i32 1}
!1 = !{ptr @fusion_71, !"reqntidx", i32 1024}
!2 = !{ptr @fusion_79, !"kernel", i32 1}
!3 = !{ptr @fusion_79, !"reqntidx", i32 1024}
!4 = !{ptr @fusion_73, !"kernel", i32 1}
!5 = !{ptr @fusion_73, !"reqntidx", i32 64}
!6 = !{ptr @fusion_69, !"kernel", i32 1}
!7 = !{ptr @fusion_69, !"reqntidx", i32 1024}
!8 = !{ptr @fusion_66, !"kernel", i32 1}
!9 = !{ptr @fusion_66, !"reqntidx", i32 1024}
!10 = !{ptr @fusion_81, !"kernel", i32 1}
!11 = !{ptr @fusion_81, !"reqntidx", i32 1024}
!12 = !{ptr @fusion_65, !"kernel", i32 1}
!13 = !{ptr @fusion_65, !"reqntidx", i32 128}
!14 = !{ptr @fusion_61, !"kernel", i32 1}
!15 = !{ptr @fusion_61, !"reqntidx", i32 1024}
!16 = !{ptr @fusion_58, !"kernel", i32 1}
!17 = !{ptr @fusion_58, !"reqntidx", i32 96}
!18 = !{ptr @fusion_56, !"kernel", i32 1}
!19 = !{ptr @fusion_56, !"reqntidx", i32 96}
!20 = !{ptr @fusion_54, !"kernel", i32 1}
!21 = !{ptr @fusion_54, !"reqntidx", i32 1024}
!22 = !{ptr @fusion_83, !"kernel", i32 1}
!23 = !{ptr @fusion_83, !"reqntidx", i32 1024}
!24 = !{ptr @fusion_53, !"kernel", i32 1}
!25 = !{ptr @fusion_53, !"reqntidx", i32 30}
!26 = !{ptr @fusion_52, !"kernel", i32 1}
!27 = !{ptr @fusion_52, !"reqntidx", i32 1024}
!28 = !{ptr @fusion_50, !"kernel", i32 1}
!29 = !{ptr @fusion_50, !"reqntidx", i32 1024}
!30 = !{ptr @fusion_85, !"kernel", i32 1}
!31 = !{ptr @fusion_85, !"reqntidx", i32 1024}
!32 = !{ptr @fusion_49, !"kernel", i32 1}
!33 = !{ptr @fusion_49, !"reqntidx", i32 512}
!34 = !{ptr @fusion_48, !"kernel", i32 1}
!35 = !{ptr @fusion_48, !"reqntidx", i32 256}
!36 = !{ptr @fusion_78, !"kernel", i32 1}
!37 = !{ptr @fusion_78, !"reqntidx", i32 256}
!38 = !{ptr @fusion_46, !"kernel", i32 1}
!39 = !{ptr @fusion_46, !"reqntidx", i32 256}
!40 = !{ptr @fusion_44, !"kernel", i32 1}
!41 = !{ptr @fusion_44, !"reqntidx", i32 1024}
!42 = !{ptr @reduce_208, !"kernel", i32 1}
!43 = !{ptr @reduce_208, !"reqntidx", i32 1024}
!44 = !{ptr @fusion_43, !"kernel", i32 1}
!45 = !{ptr @fusion_43, !"reqntidx", i32 968}
!46 = !{ptr @fusion_42, !"kernel", i32 1}
!47 = !{ptr @fusion_42, !"reqntidx", i32 256}
!48 = !{ptr @fusion_41, !"kernel", i32 1}
!49 = !{ptr @fusion_41, !"reqntidx", i32 1024}
!50 = !{ptr @fusion_40, !"kernel", i32 1}
!51 = !{ptr @fusion_40, !"reqntidx", i32 1024}
!52 = !{ptr @fusion_39, !"kernel", i32 1}
!53 = !{ptr @fusion_39, !"reqntidx", i32 1024}
!54 = !{ptr @fusion_30, !"kernel", i32 1}
!55 = !{ptr @fusion_30, !"reqntidx", i32 256}
!56 = !{ptr @fusion_27, !"kernel", i32 1}
!57 = !{ptr @fusion_27, !"reqntidx", i32 128}
!58 = !{ptr @fusion_24, !"kernel", i32 1}
!59 = !{ptr @fusion_24, !"reqntidx", i32 256}
!60 = !{ptr @fusion_23, !"kernel", i32 1}
!61 = !{ptr @fusion_23, !"reqntidx", i32 256}
!62 = !{ptr @fusion_11, !"kernel", i32 1}
!63 = !{ptr @fusion_11, !"reqntidx", i32 1024}
!64 = !{ptr @fusion_7, !"kernel", i32 1}
!65 = !{ptr @fusion_7, !"reqntidx", i32 1024}
!66 = !{ptr @fusion_6, !"kernel", i32 1}
!67 = !{ptr @fusion_6, !"reqntidx", i32 256}
!68 = !{ptr @fusion_5, !"kernel", i32 1}
!69 = !{ptr @fusion_5, !"reqntidx", i32 1024}
!70 = !{ptr @fusion_2, !"kernel", i32 1}
!71 = !{ptr @fusion_2, !"reqntidx", i32 1024}
!72 = !{ptr @fusion, !"kernel", i32 1}
!73 = !{ptr @fusion, !"reqntidx", i32 1024}
!74 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!75 = !{i32 0, i32 64}
!76 = !{i32 0, i32 1024}
!77 = !{}
!78 = !{i32 0, i32 2}
!79 = !{i32 0, i32 8}
!80 = !{i32 0, i32 128}
!81 = !{i32 0, i32 16}
!82 = !{i32 0, i32 96}
!83 = !{i32 0, i32 35499}
!84 = !{i32 0, i32 11606}
!85 = !{i32 0, i32 30}
!86 = !{i32 0, i32 15}
!87 = !{i32 0, i32 512}
!88 = !{i32 0, i32 580}
!89 = !{i32 0, i32 256}
!90 = !{i32 0, i32 1984}
!91 = !{i32 0, i32 31}
!92 = !{i32 0, i32 968}
!93 = !{i32 0, i32 3584}
!94 = !{i32 0, i32 864}
!95 = !{i32 0, i32 384}
!96 = !{i32 0, i32 192}
!97 = !{i32 0, i32 32}
!98 = !{i32 0, i32 4}
!99 = !{i32 0, i32 224}
!100 = !{i32 0, i32 24}
!101 = !{i32 0, i32 12}
