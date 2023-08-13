target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_9 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_8 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@shared_cache = private unnamed_addr addrspace(3) global [1 x [1 x [16 x float]]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [1 x [1 x [16 x float]]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache4 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache5 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache6 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache7 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache8 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache9 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

; Function Attrs: nounwind
define void @fusion_27(ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg5) local_unnamed_addr #0 {
entry:
  %arg5281 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4279 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3277 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2275 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1273 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0271 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !39
  %trunc.not = icmp eq i32 %0, 0
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !40
  %2 = shl nuw nsw i32 %1, 1
  %3 = zext i32 %2 to i64
  br i1 %trunc.not, label %reduce-group-0-true, label %reduce-group-1-true

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont, %inter_warp_reduce-true178.cont.cont.cont.cont.cont.cont, %reduction_write_output-true196, %intra_warp_reduce_write-after177
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = getelementptr float, ptr addrspace(1) %arg1273, i64 %3
  %4 = load <2 x float>, ptr addrspace(1) %Arg_1.2, align 8, !invariant.load !41
  %Arg_1.23403 = extractelement <2 x float> %4, i32 0
  %Arg_1.29404 = extractelement <2 x float> %4, i32 1
  %Arg_0.1 = getelementptr float, ptr addrspace(1) %arg0271, i64 %3
  %5 = load <2 x float>, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !41
  %Arg_0.14419 = extractelement <2 x float> %5, i32 0
  %Arg_0.111420 = extractelement <2 x float> %5, i32 1
  %multiply.5 = fmul float %Arg_1.23403, %Arg_0.14419
  %subtract.8 = fsub float 1.000000e+00, %Arg_0.14419
  %multiply.9 = fmul float %multiply.5, %subtract.8
  %multiply.512 = fmul float %Arg_1.29404, %Arg_0.111420
  %subtract.816 = fsub float 1.000000e+00, %Arg_0.111420
  %multiply.917 = fmul float %multiply.512, %subtract.816
  %add.15.i230 = fadd float %multiply.9, %multiply.917
  %Arg_1.2.1288 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.2, i64 1024
  %6 = load <2 x float>, ptr addrspace(1) %Arg_1.2.1288, align 8, !invariant.load !41
  %Arg_1.23.1405 = extractelement <2 x float> %6, i32 0
  %Arg_1.29.1406 = extractelement <2 x float> %6, i32 1
  %Arg_0.1.1290 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 1024
  %7 = load <2 x float>, ptr addrspace(1) %Arg_0.1.1290, align 8, !invariant.load !41
  %Arg_0.14.1421 = extractelement <2 x float> %7, i32 0
  %Arg_0.111.1422 = extractelement <2 x float> %7, i32 1
  %multiply.5.1 = fmul float %Arg_1.23.1405, %Arg_0.14.1421
  %subtract.8.1 = fsub float 1.000000e+00, %Arg_0.14.1421
  %multiply.9.1 = fmul float %multiply.5.1, %subtract.8.1
  %add.15.i229.1 = fadd float %add.15.i230, %multiply.9.1
  %multiply.512.1 = fmul float %Arg_1.29.1406, %Arg_0.111.1422
  %subtract.816.1 = fsub float 1.000000e+00, %Arg_0.111.1422
  %multiply.917.1 = fmul float %multiply.512.1, %subtract.816.1
  %add.15.i230.1 = fadd float %add.15.i229.1, %multiply.917.1
  %Arg_1.2.2296 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.2, i64 2048
  %8 = load <2 x float>, ptr addrspace(1) %Arg_1.2.2296, align 8, !invariant.load !41
  %Arg_1.23.2407 = extractelement <2 x float> %8, i32 0
  %Arg_1.29.2408 = extractelement <2 x float> %8, i32 1
  %Arg_0.1.2298 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 2048
  %9 = load <2 x float>, ptr addrspace(1) %Arg_0.1.2298, align 8, !invariant.load !41
  %Arg_0.14.2423 = extractelement <2 x float> %9, i32 0
  %Arg_0.111.2424 = extractelement <2 x float> %9, i32 1
  %multiply.5.2 = fmul float %Arg_1.23.2407, %Arg_0.14.2423
  %subtract.8.2 = fsub float 1.000000e+00, %Arg_0.14.2423
  %multiply.9.2 = fmul float %multiply.5.2, %subtract.8.2
  %add.15.i229.2 = fadd float %add.15.i230.1, %multiply.9.2
  %multiply.512.2 = fmul float %Arg_1.29.2408, %Arg_0.111.2424
  %subtract.816.2 = fsub float 1.000000e+00, %Arg_0.111.2424
  %multiply.917.2 = fmul float %multiply.512.2, %subtract.816.2
  %add.15.i230.2 = fadd float %add.15.i229.2, %multiply.917.2
  %Arg_1.2.3304 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.2, i64 3072
  %10 = load <2 x float>, ptr addrspace(1) %Arg_1.2.3304, align 8, !invariant.load !41
  %Arg_1.23.3409 = extractelement <2 x float> %10, i32 0
  %Arg_1.29.3410 = extractelement <2 x float> %10, i32 1
  %Arg_0.1.3306 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 3072
  %11 = load <2 x float>, ptr addrspace(1) %Arg_0.1.3306, align 8, !invariant.load !41
  %Arg_0.14.3425 = extractelement <2 x float> %11, i32 0
  %Arg_0.111.3426 = extractelement <2 x float> %11, i32 1
  %multiply.5.3 = fmul float %Arg_1.23.3409, %Arg_0.14.3425
  %subtract.8.3 = fsub float 1.000000e+00, %Arg_0.14.3425
  %multiply.9.3 = fmul float %multiply.5.3, %subtract.8.3
  %add.15.i229.3 = fadd float %add.15.i230.2, %multiply.9.3
  %multiply.512.3 = fmul float %Arg_1.29.3410, %Arg_0.111.3426
  %subtract.816.3 = fsub float 1.000000e+00, %Arg_0.111.3426
  %multiply.917.3 = fmul float %multiply.512.3, %subtract.816.3
  %add.15.i230.3 = fadd float %add.15.i229.3, %multiply.917.3
  %Arg_1.2.4312 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.2, i64 4096
  %12 = load <2 x float>, ptr addrspace(1) %Arg_1.2.4312, align 8, !invariant.load !41
  %Arg_1.23.4411 = extractelement <2 x float> %12, i32 0
  %Arg_1.29.4412 = extractelement <2 x float> %12, i32 1
  %Arg_0.1.4314 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 4096
  %13 = load <2 x float>, ptr addrspace(1) %Arg_0.1.4314, align 8, !invariant.load !41
  %Arg_0.14.4427 = extractelement <2 x float> %13, i32 0
  %Arg_0.111.4428 = extractelement <2 x float> %13, i32 1
  %multiply.5.4 = fmul float %Arg_1.23.4411, %Arg_0.14.4427
  %subtract.8.4 = fsub float 1.000000e+00, %Arg_0.14.4427
  %multiply.9.4 = fmul float %multiply.5.4, %subtract.8.4
  %add.15.i229.4 = fadd float %add.15.i230.3, %multiply.9.4
  %multiply.512.4 = fmul float %Arg_1.29.4412, %Arg_0.111.4428
  %subtract.816.4 = fsub float 1.000000e+00, %Arg_0.111.4428
  %multiply.917.4 = fmul float %multiply.512.4, %subtract.816.4
  %add.15.i230.4 = fadd float %add.15.i229.4, %multiply.917.4
  %Arg_1.2.5320 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.2, i64 5120
  %14 = load <2 x float>, ptr addrspace(1) %Arg_1.2.5320, align 8, !invariant.load !41
  %Arg_1.23.5413 = extractelement <2 x float> %14, i32 0
  %Arg_1.29.5414 = extractelement <2 x float> %14, i32 1
  %Arg_0.1.5322 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 5120
  %15 = load <2 x float>, ptr addrspace(1) %Arg_0.1.5322, align 8, !invariant.load !41
  %Arg_0.14.5429 = extractelement <2 x float> %15, i32 0
  %Arg_0.111.5430 = extractelement <2 x float> %15, i32 1
  %multiply.5.5 = fmul float %Arg_1.23.5413, %Arg_0.14.5429
  %subtract.8.5 = fsub float 1.000000e+00, %Arg_0.14.5429
  %multiply.9.5 = fmul float %multiply.5.5, %subtract.8.5
  %add.15.i229.5 = fadd float %add.15.i230.4, %multiply.9.5
  %multiply.512.5 = fmul float %Arg_1.29.5414, %Arg_0.111.5430
  %subtract.816.5 = fsub float 1.000000e+00, %Arg_0.111.5430
  %multiply.917.5 = fmul float %multiply.512.5, %subtract.816.5
  %add.15.i230.5 = fadd float %add.15.i229.5, %multiply.917.5
  %Arg_1.2.6328 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.2, i64 6144
  %16 = load <2 x float>, ptr addrspace(1) %Arg_1.2.6328, align 8, !invariant.load !41
  %Arg_1.23.6415 = extractelement <2 x float> %16, i32 0
  %Arg_1.29.6416 = extractelement <2 x float> %16, i32 1
  %Arg_0.1.6330 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 6144
  %17 = load <2 x float>, ptr addrspace(1) %Arg_0.1.6330, align 8, !invariant.load !41
  %Arg_0.14.6431 = extractelement <2 x float> %17, i32 0
  %Arg_0.111.6432 = extractelement <2 x float> %17, i32 1
  %multiply.5.6 = fmul float %Arg_1.23.6415, %Arg_0.14.6431
  %subtract.8.6 = fsub float 1.000000e+00, %Arg_0.14.6431
  %multiply.9.6 = fmul float %multiply.5.6, %subtract.8.6
  %add.15.i229.6 = fadd float %add.15.i230.5, %multiply.9.6
  %multiply.512.6 = fmul float %Arg_1.29.6416, %Arg_0.111.6432
  %subtract.816.6 = fsub float 1.000000e+00, %Arg_0.111.6432
  %multiply.917.6 = fmul float %multiply.512.6, %subtract.816.6
  %add.15.i230.6 = fadd float %add.15.i229.6, %multiply.917.6
  %Arg_1.2.7336 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.2, i64 7168
  %18 = load <2 x float>, ptr addrspace(1) %Arg_1.2.7336, align 8, !invariant.load !41
  %Arg_1.23.7417 = extractelement <2 x float> %18, i32 0
  %Arg_1.29.7418 = extractelement <2 x float> %18, i32 1
  %Arg_0.1.7338 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 7168
  %19 = load <2 x float>, ptr addrspace(1) %Arg_0.1.7338, align 8, !invariant.load !41
  %Arg_0.14.7433 = extractelement <2 x float> %19, i32 0
  %Arg_0.111.7434 = extractelement <2 x float> %19, i32 1
  %multiply.5.7 = fmul float %Arg_1.23.7417, %Arg_0.14.7433
  %subtract.8.7 = fsub float 1.000000e+00, %Arg_0.14.7433
  %multiply.9.7 = fmul float %multiply.5.7, %subtract.8.7
  %add.15.i229.7 = fadd float %add.15.i230.6, %multiply.9.7
  %multiply.512.7 = fmul float %Arg_1.29.7418, %Arg_0.111.7434
  %subtract.816.7 = fsub float 1.000000e+00, %Arg_0.111.7434
  %multiply.917.7 = fmul float %multiply.512.7, %subtract.816.7
  %add.15.i230.7 = fadd float %add.15.i229.7, %multiply.917.7
  %lane_id = and i32 %1, 31
  %20 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i230.7, i32 16, i32 31)
  %add.15.i = fadd float %add.15.i230.7, %20
  %21 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i, i32 8, i32 31)
  %add.15.i225 = fadd float %add.15.i, %21
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i225, i32 4, i32 31)
  %add.15.i226 = fadd float %add.15.i225, %22
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i226, i32 2, i32 31)
  %add.15.i227 = fadd float %add.15.i226, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i227, i32 1, i32 31)
  %25 = icmp eq i32 %lane_id, 0
  %26 = lshr i32 %1, 5
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds [1 x [1 x [16 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 0, i64 0, i64 %27
  %add.15.i228 = fadd float %add.15.i227, %24
  br i1 %25, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %reduce-group-0-true
  tail call void @llvm.nvvm.barrier0()
  %29 = icmp ult i32 %1, 32
  br i1 %29, label %inter_warp_reduce-true, label %common.ret

intra_warp_reduce_write-true:                     ; preds = %reduce-group-0-true
  store float %add.15.i228, ptr addrspace(3) %28, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %30 = zext i32 %lane_id to i64
  %31 = getelementptr inbounds [1 x [1 x [16 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 0, i64 0, i64 %30
  %32 = icmp ult i32 %1, 16
  br i1 %32, label %inter_warp_reduce-true.then256, label %inter_warp_reduce-true.cont255

inter_warp_reduce-true.then256:                   ; preds = %inter_warp_reduce-true
  %partial_reduction_result66.then.val = load float, ptr addrspace(3) %31, align 4
  br label %inter_warp_reduce-true.cont255

inter_warp_reduce-true.cont255:                   ; preds = %inter_warp_reduce-true, %inter_warp_reduce-true.then256
  %partial_reduction_result66 = phi float [ %partial_reduction_result66.then.val, %inter_warp_reduce-true.then256 ], [ -0.000000e+00, %inter_warp_reduce-true ]
  %33 = icmp ult i32 %1, 16
  %34 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result66, i32 16, i32 31)
  br i1 %33, label %inter_warp_reduce-true.then, label %inter_warp_reduce-true.cont

inter_warp_reduce-true.then:                      ; preds = %inter_warp_reduce-true.cont255
  %.val205.then.val = load float, ptr addrspace(3) %31, align 4
  br label %inter_warp_reduce-true.cont

inter_warp_reduce-true.cont:                      ; preds = %inter_warp_reduce-true.cont255, %inter_warp_reduce-true.then
  %.val205 = phi float [ %.val205.then.val, %inter_warp_reduce-true.then ], [ -0.000000e+00, %inter_warp_reduce-true.cont255 ]
  %35 = icmp ult i32 %1, 16
  %add.15.i231 = fadd float %34, %.val205
  br i1 %35, label %inter_warp_reduce-true.cont.then254, label %inter_warp_reduce-true.cont.cont253

inter_warp_reduce-true.cont.then254:              ; preds = %inter_warp_reduce-true.cont
  store float %add.15.i231, ptr addrspace(3) %31, align 4
  br label %inter_warp_reduce-true.cont.cont253

inter_warp_reduce-true.cont.cont253:              ; preds = %inter_warp_reduce-true.cont, %inter_warp_reduce-true.cont.then254
  %initial_value_addr.0 = phi float [ -0.000000e+00, %inter_warp_reduce-true.cont.then254 ], [ %add.15.i231, %inter_warp_reduce-true.cont ]
  %36 = icmp ult i32 %1, 16
  %37 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i231, i32 8, i32 31)
  br i1 %36, label %inter_warp_reduce-true.cont.then, label %inter_warp_reduce-true.cont.cont

inter_warp_reduce-true.cont.then:                 ; preds = %inter_warp_reduce-true.cont.cont253
  %.val204.then.val = load float, ptr addrspace(3) %31, align 4
  br label %inter_warp_reduce-true.cont.cont

inter_warp_reduce-true.cont.cont:                 ; preds = %inter_warp_reduce-true.cont.cont253, %inter_warp_reduce-true.cont.then
  %.val204 = phi float [ %.val204.then.val, %inter_warp_reduce-true.cont.then ], [ %initial_value_addr.0, %inter_warp_reduce-true.cont.cont253 ]
  %38 = icmp ult i32 %1, 16
  %add.15.i232 = fadd float %37, %.val204
  br i1 %38, label %inter_warp_reduce-true.cont.cont.then252, label %inter_warp_reduce-true.cont.cont.cont251

inter_warp_reduce-true.cont.cont.then252:         ; preds = %inter_warp_reduce-true.cont.cont
  store float %add.15.i232, ptr addrspace(3) %31, align 4
  br label %inter_warp_reduce-true.cont.cont.cont251

inter_warp_reduce-true.cont.cont.cont251:         ; preds = %inter_warp_reduce-true.cont.cont, %inter_warp_reduce-true.cont.cont.then252
  %initial_value_addr.1 = phi float [ %initial_value_addr.0, %inter_warp_reduce-true.cont.cont.then252 ], [ %add.15.i232, %inter_warp_reduce-true.cont.cont ]
  %39 = icmp ult i32 %1, 16
  %40 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i232, i32 4, i32 31)
  br i1 %39, label %inter_warp_reduce-true.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont

inter_warp_reduce-true.cont.cont.then:            ; preds = %inter_warp_reduce-true.cont.cont.cont251
  %.val203.then.val = load float, ptr addrspace(3) %31, align 4
  br label %inter_warp_reduce-true.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont:            ; preds = %inter_warp_reduce-true.cont.cont.cont251, %inter_warp_reduce-true.cont.cont.then
  %.val203 = phi float [ %.val203.then.val, %inter_warp_reduce-true.cont.cont.then ], [ %initial_value_addr.1, %inter_warp_reduce-true.cont.cont.cont251 ]
  %41 = icmp ult i32 %1, 16
  %add.15.i233 = fadd float %40, %.val203
  br i1 %41, label %inter_warp_reduce-true.cont.cont.cont.then250, label %inter_warp_reduce-true.cont.cont.cont.cont249

inter_warp_reduce-true.cont.cont.cont.then250:    ; preds = %inter_warp_reduce-true.cont.cont.cont
  store float %add.15.i233, ptr addrspace(3) %31, align 4
  br label %inter_warp_reduce-true.cont.cont.cont.cont249

inter_warp_reduce-true.cont.cont.cont.cont249:    ; preds = %inter_warp_reduce-true.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.then250
  %initial_value_addr.2 = phi float [ %initial_value_addr.1, %inter_warp_reduce-true.cont.cont.cont.then250 ], [ %add.15.i233, %inter_warp_reduce-true.cont.cont.cont ]
  %42 = icmp ult i32 %1, 16
  %43 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i233, i32 2, i32 31)
  br i1 %42, label %inter_warp_reduce-true.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.then:       ; preds = %inter_warp_reduce-true.cont.cont.cont.cont249
  %.val202.then.val = load float, ptr addrspace(3) %31, align 4
  br label %inter_warp_reduce-true.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont:       ; preds = %inter_warp_reduce-true.cont.cont.cont.cont249, %inter_warp_reduce-true.cont.cont.cont.then
  %.val202 = phi float [ %.val202.then.val, %inter_warp_reduce-true.cont.cont.cont.then ], [ %initial_value_addr.2, %inter_warp_reduce-true.cont.cont.cont.cont249 ]
  %44 = icmp ult i32 %1, 16
  %add.15.i234 = fadd float %43, %.val202
  br i1 %44, label %inter_warp_reduce-true.cont.cont.cont.cont.then248, label %inter_warp_reduce-true.cont.cont.cont.cont.cont247

inter_warp_reduce-true.cont.cont.cont.cont.then248: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont
  store float %add.15.i234, ptr addrspace(3) %31, align 4
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont247

inter_warp_reduce-true.cont.cont.cont.cont.cont247: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.cont.then248
  %initial_value_addr.3 = phi float [ %initial_value_addr.2, %inter_warp_reduce-true.cont.cont.cont.cont.then248 ], [ %add.15.i234, %inter_warp_reduce-true.cont.cont.cont.cont ]
  %45 = icmp ult i32 %1, 16
  %46 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i234, i32 1, i32 31)
  br i1 %45, label %inter_warp_reduce-true.cont.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.then:  ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont247
  %.val.then.val = load float, ptr addrspace(3) %31, align 4
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont:  ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont247, %inter_warp_reduce-true.cont.cont.cont.cont.then
  %.val = phi float [ %.val.then.val, %inter_warp_reduce-true.cont.cont.cont.cont.then ], [ %initial_value_addr.3, %inter_warp_reduce-true.cont.cont.cont.cont.cont247 ]
  %47 = icmp ult i32 %1, 16
  %add.15.i235 = fadd float %46, %.val
  br i1 %47, label %inter_warp_reduce-true.cont.cont.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont
  store float %add.15.i235, ptr addrspace(3) %31, align 4
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.cont.cont.then
  %48 = icmp eq i32 %1, 0
  br i1 %48, label %reduction_write_output-true, label %common.ret

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont
  store float %add.15.i235, ptr addrspace(1) %arg4279, align 128
  br label %common.ret

reduce-group-1-true:                              ; preds = %entry
  %Arg_3.4 = getelementptr float, ptr addrspace(1) %arg3277, i64 %3
  %49 = load <2 x float>, ptr addrspace(1) %Arg_3.4, align 8, !invariant.load !41
  %Arg_3.4108435 = extractelement <2 x float> %49, i32 0
  %Arg_3.4116436 = extractelement <2 x float> %49, i32 1
  %Arg_2.3 = getelementptr float, ptr addrspace(1) %arg2275, i64 %3
  %50 = load <2 x float>, ptr addrspace(1) %Arg_2.3, align 8, !invariant.load !41
  %Arg_2.3109451 = extractelement <2 x float> %50, i32 0
  %Arg_2.3118452 = extractelement <2 x float> %50, i32 1
  %multiply.17 = fmul float %Arg_3.4108435, %Arg_2.3109451
  %subtract.18 = fsub float 1.000000e+00, %Arg_2.3109451
  %multiply.19 = fmul float %multiply.17, %subtract.18
  %multiply.17119 = fmul float %Arg_3.4116436, %Arg_2.3118452
  %subtract.18123 = fsub float 1.000000e+00, %Arg_2.3118452
  %multiply.19124 = fmul float %multiply.17119, %subtract.18123
  %add.24.i241 = fadd float %multiply.19, %multiply.19124
  %Arg_3.4.1348 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 1024
  %51 = load <2 x float>, ptr addrspace(1) %Arg_3.4.1348, align 8, !invariant.load !41
  %Arg_3.4108.1437 = extractelement <2 x float> %51, i32 0
  %Arg_3.4116.1438 = extractelement <2 x float> %51, i32 1
  %Arg_2.3.1350 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 1024
  %52 = load <2 x float>, ptr addrspace(1) %Arg_2.3.1350, align 8, !invariant.load !41
  %Arg_2.3109.1453 = extractelement <2 x float> %52, i32 0
  %Arg_2.3118.1454 = extractelement <2 x float> %52, i32 1
  %multiply.17.1 = fmul float %Arg_3.4108.1437, %Arg_2.3109.1453
  %subtract.18.1 = fsub float 1.000000e+00, %Arg_2.3109.1453
  %multiply.19.1 = fmul float %multiply.17.1, %subtract.18.1
  %add.24.i240.1 = fadd float %add.24.i241, %multiply.19.1
  %multiply.17119.1 = fmul float %Arg_3.4116.1438, %Arg_2.3118.1454
  %subtract.18123.1 = fsub float 1.000000e+00, %Arg_2.3118.1454
  %multiply.19124.1 = fmul float %multiply.17119.1, %subtract.18123.1
  %add.24.i241.1 = fadd float %add.24.i240.1, %multiply.19124.1
  %Arg_3.4.2356 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 2048
  %53 = load <2 x float>, ptr addrspace(1) %Arg_3.4.2356, align 8, !invariant.load !41
  %Arg_3.4108.2439 = extractelement <2 x float> %53, i32 0
  %Arg_3.4116.2440 = extractelement <2 x float> %53, i32 1
  %Arg_2.3.2358 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 2048
  %54 = load <2 x float>, ptr addrspace(1) %Arg_2.3.2358, align 8, !invariant.load !41
  %Arg_2.3109.2455 = extractelement <2 x float> %54, i32 0
  %Arg_2.3118.2456 = extractelement <2 x float> %54, i32 1
  %multiply.17.2 = fmul float %Arg_3.4108.2439, %Arg_2.3109.2455
  %subtract.18.2 = fsub float 1.000000e+00, %Arg_2.3109.2455
  %multiply.19.2 = fmul float %multiply.17.2, %subtract.18.2
  %add.24.i240.2 = fadd float %add.24.i241.1, %multiply.19.2
  %multiply.17119.2 = fmul float %Arg_3.4116.2440, %Arg_2.3118.2456
  %subtract.18123.2 = fsub float 1.000000e+00, %Arg_2.3118.2456
  %multiply.19124.2 = fmul float %multiply.17119.2, %subtract.18123.2
  %add.24.i241.2 = fadd float %add.24.i240.2, %multiply.19124.2
  %Arg_3.4.3364 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 3072
  %55 = load <2 x float>, ptr addrspace(1) %Arg_3.4.3364, align 8, !invariant.load !41
  %Arg_3.4108.3441 = extractelement <2 x float> %55, i32 0
  %Arg_3.4116.3442 = extractelement <2 x float> %55, i32 1
  %Arg_2.3.3366 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 3072
  %56 = load <2 x float>, ptr addrspace(1) %Arg_2.3.3366, align 8, !invariant.load !41
  %Arg_2.3109.3457 = extractelement <2 x float> %56, i32 0
  %Arg_2.3118.3458 = extractelement <2 x float> %56, i32 1
  %multiply.17.3 = fmul float %Arg_3.4108.3441, %Arg_2.3109.3457
  %subtract.18.3 = fsub float 1.000000e+00, %Arg_2.3109.3457
  %multiply.19.3 = fmul float %multiply.17.3, %subtract.18.3
  %add.24.i240.3 = fadd float %add.24.i241.2, %multiply.19.3
  %multiply.17119.3 = fmul float %Arg_3.4116.3442, %Arg_2.3118.3458
  %subtract.18123.3 = fsub float 1.000000e+00, %Arg_2.3118.3458
  %multiply.19124.3 = fmul float %multiply.17119.3, %subtract.18123.3
  %add.24.i241.3 = fadd float %add.24.i240.3, %multiply.19124.3
  %Arg_3.4.4372 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 4096
  %57 = load <2 x float>, ptr addrspace(1) %Arg_3.4.4372, align 8, !invariant.load !41
  %Arg_3.4108.4443 = extractelement <2 x float> %57, i32 0
  %Arg_3.4116.4444 = extractelement <2 x float> %57, i32 1
  %Arg_2.3.4374 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 4096
  %58 = load <2 x float>, ptr addrspace(1) %Arg_2.3.4374, align 8, !invariant.load !41
  %Arg_2.3109.4459 = extractelement <2 x float> %58, i32 0
  %Arg_2.3118.4460 = extractelement <2 x float> %58, i32 1
  %multiply.17.4 = fmul float %Arg_3.4108.4443, %Arg_2.3109.4459
  %subtract.18.4 = fsub float 1.000000e+00, %Arg_2.3109.4459
  %multiply.19.4 = fmul float %multiply.17.4, %subtract.18.4
  %add.24.i240.4 = fadd float %add.24.i241.3, %multiply.19.4
  %multiply.17119.4 = fmul float %Arg_3.4116.4444, %Arg_2.3118.4460
  %subtract.18123.4 = fsub float 1.000000e+00, %Arg_2.3118.4460
  %multiply.19124.4 = fmul float %multiply.17119.4, %subtract.18123.4
  %add.24.i241.4 = fadd float %add.24.i240.4, %multiply.19124.4
  %Arg_3.4.5380 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 5120
  %59 = load <2 x float>, ptr addrspace(1) %Arg_3.4.5380, align 8, !invariant.load !41
  %Arg_3.4108.5445 = extractelement <2 x float> %59, i32 0
  %Arg_3.4116.5446 = extractelement <2 x float> %59, i32 1
  %Arg_2.3.5382 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 5120
  %60 = load <2 x float>, ptr addrspace(1) %Arg_2.3.5382, align 8, !invariant.load !41
  %Arg_2.3109.5461 = extractelement <2 x float> %60, i32 0
  %Arg_2.3118.5462 = extractelement <2 x float> %60, i32 1
  %multiply.17.5 = fmul float %Arg_3.4108.5445, %Arg_2.3109.5461
  %subtract.18.5 = fsub float 1.000000e+00, %Arg_2.3109.5461
  %multiply.19.5 = fmul float %multiply.17.5, %subtract.18.5
  %add.24.i240.5 = fadd float %add.24.i241.4, %multiply.19.5
  %multiply.17119.5 = fmul float %Arg_3.4116.5446, %Arg_2.3118.5462
  %subtract.18123.5 = fsub float 1.000000e+00, %Arg_2.3118.5462
  %multiply.19124.5 = fmul float %multiply.17119.5, %subtract.18123.5
  %add.24.i241.5 = fadd float %add.24.i240.5, %multiply.19124.5
  %Arg_3.4.6388 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 6144
  %61 = load <2 x float>, ptr addrspace(1) %Arg_3.4.6388, align 8, !invariant.load !41
  %Arg_3.4108.6447 = extractelement <2 x float> %61, i32 0
  %Arg_3.4116.6448 = extractelement <2 x float> %61, i32 1
  %Arg_2.3.6390 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 6144
  %62 = load <2 x float>, ptr addrspace(1) %Arg_2.3.6390, align 8, !invariant.load !41
  %Arg_2.3109.6463 = extractelement <2 x float> %62, i32 0
  %Arg_2.3118.6464 = extractelement <2 x float> %62, i32 1
  %multiply.17.6 = fmul float %Arg_3.4108.6447, %Arg_2.3109.6463
  %subtract.18.6 = fsub float 1.000000e+00, %Arg_2.3109.6463
  %multiply.19.6 = fmul float %multiply.17.6, %subtract.18.6
  %add.24.i240.6 = fadd float %add.24.i241.5, %multiply.19.6
  %multiply.17119.6 = fmul float %Arg_3.4116.6448, %Arg_2.3118.6464
  %subtract.18123.6 = fsub float 1.000000e+00, %Arg_2.3118.6464
  %multiply.19124.6 = fmul float %multiply.17119.6, %subtract.18123.6
  %add.24.i241.6 = fadd float %add.24.i240.6, %multiply.19124.6
  %Arg_3.4.7396 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 7168
  %63 = load <2 x float>, ptr addrspace(1) %Arg_3.4.7396, align 8, !invariant.load !41
  %Arg_3.4108.7449 = extractelement <2 x float> %63, i32 0
  %Arg_3.4116.7450 = extractelement <2 x float> %63, i32 1
  %Arg_2.3.7398 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 7168
  %64 = load <2 x float>, ptr addrspace(1) %Arg_2.3.7398, align 8, !invariant.load !41
  %Arg_2.3109.7465 = extractelement <2 x float> %64, i32 0
  %Arg_2.3118.7466 = extractelement <2 x float> %64, i32 1
  %multiply.17.7 = fmul float %Arg_3.4108.7449, %Arg_2.3109.7465
  %subtract.18.7 = fsub float 1.000000e+00, %Arg_2.3109.7465
  %multiply.19.7 = fmul float %multiply.17.7, %subtract.18.7
  %add.24.i240.7 = fadd float %add.24.i241.6, %multiply.19.7
  %multiply.17119.7 = fmul float %Arg_3.4116.7450, %Arg_2.3118.7466
  %subtract.18123.7 = fsub float 1.000000e+00, %Arg_2.3118.7466
  %multiply.19124.7 = fmul float %multiply.17119.7, %subtract.18123.7
  %add.24.i241.7 = fadd float %add.24.i240.7, %multiply.19124.7
  %lane_id86 = and i32 %1, 31
  %65 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i241.7, i32 16, i32 31)
  %add.24.i = fadd float %add.24.i241.7, %65
  %66 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i, i32 8, i32 31)
  %add.24.i236 = fadd float %add.24.i, %66
  %67 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i236, i32 4, i32 31)
  %add.24.i237 = fadd float %add.24.i236, %67
  %68 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i237, i32 2, i32 31)
  %add.24.i238 = fadd float %add.24.i237, %68
  %69 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i238, i32 1, i32 31)
  %70 = icmp eq i32 %lane_id86, 0
  %71 = lshr i32 %1, 5
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds [1 x [1 x [16 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 0, i64 0, i64 %72
  %add.24.i239 = fadd float %add.24.i238, %69
  br i1 %70, label %intra_warp_reduce_write-true176, label %intra_warp_reduce_write-after177

intra_warp_reduce_write-after177:                 ; preds = %intra_warp_reduce_write-true176, %reduce-group-1-true
  tail call void @llvm.nvvm.barrier0()
  %74 = icmp ult i32 %1, 32
  br i1 %74, label %inter_warp_reduce-true178, label %common.ret

intra_warp_reduce_write-true176:                  ; preds = %reduce-group-1-true
  store float %add.24.i239, ptr addrspace(3) %73, align 4
  br label %intra_warp_reduce_write-after177

inter_warp_reduce-true178:                        ; preds = %intra_warp_reduce_write-after177
  %75 = zext i32 %lane_id86 to i64
  %76 = getelementptr inbounds [1 x [1 x [16 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 0, i64 0, i64 %75
  %77 = icmp ult i32 %1, 16
  br i1 %77, label %inter_warp_reduce-true178.then266, label %inter_warp_reduce-true178.cont265

inter_warp_reduce-true178.then266:                ; preds = %inter_warp_reduce-true178
  %partial_reduction_result182.then.val = load float, ptr addrspace(3) %76, align 4
  br label %inter_warp_reduce-true178.cont265

inter_warp_reduce-true178.cont265:                ; preds = %inter_warp_reduce-true178, %inter_warp_reduce-true178.then266
  %partial_reduction_result182 = phi float [ %partial_reduction_result182.then.val, %inter_warp_reduce-true178.then266 ], [ -0.000000e+00, %inter_warp_reduce-true178 ]
  %78 = icmp ult i32 %1, 16
  %79 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result182, i32 16, i32 31)
  br i1 %78, label %inter_warp_reduce-true178.then, label %inter_warp_reduce-true178.cont

inter_warp_reduce-true178.then:                   ; preds = %inter_warp_reduce-true178.cont265
  %.val217.then.val = load float, ptr addrspace(3) %76, align 4
  br label %inter_warp_reduce-true178.cont

inter_warp_reduce-true178.cont:                   ; preds = %inter_warp_reduce-true178.cont265, %inter_warp_reduce-true178.then
  %.val217 = phi float [ %.val217.then.val, %inter_warp_reduce-true178.then ], [ -0.000000e+00, %inter_warp_reduce-true178.cont265 ]
  %80 = icmp ult i32 %1, 16
  %add.24.i242 = fadd float %79, %.val217
  br i1 %80, label %inter_warp_reduce-true178.cont.then264, label %inter_warp_reduce-true178.cont.cont263

inter_warp_reduce-true178.cont.then264:           ; preds = %inter_warp_reduce-true178.cont
  store float %add.24.i242, ptr addrspace(3) %76, align 4
  br label %inter_warp_reduce-true178.cont.cont263

inter_warp_reduce-true178.cont.cont263:           ; preds = %inter_warp_reduce-true178.cont, %inter_warp_reduce-true178.cont.then264
  %initial_value_addr180.0 = phi float [ -0.000000e+00, %inter_warp_reduce-true178.cont.then264 ], [ %add.24.i242, %inter_warp_reduce-true178.cont ]
  %81 = icmp ult i32 %1, 16
  %82 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i242, i32 8, i32 31)
  br i1 %81, label %inter_warp_reduce-true178.cont.then, label %inter_warp_reduce-true178.cont.cont

inter_warp_reduce-true178.cont.then:              ; preds = %inter_warp_reduce-true178.cont.cont263
  %.val216.then.val = load float, ptr addrspace(3) %76, align 4
  br label %inter_warp_reduce-true178.cont.cont

inter_warp_reduce-true178.cont.cont:              ; preds = %inter_warp_reduce-true178.cont.cont263, %inter_warp_reduce-true178.cont.then
  %.val216 = phi float [ %.val216.then.val, %inter_warp_reduce-true178.cont.then ], [ %initial_value_addr180.0, %inter_warp_reduce-true178.cont.cont263 ]
  %83 = icmp ult i32 %1, 16
  %add.24.i243 = fadd float %82, %.val216
  br i1 %83, label %inter_warp_reduce-true178.cont.cont.then262, label %inter_warp_reduce-true178.cont.cont.cont261

inter_warp_reduce-true178.cont.cont.then262:      ; preds = %inter_warp_reduce-true178.cont.cont
  store float %add.24.i243, ptr addrspace(3) %76, align 4
  br label %inter_warp_reduce-true178.cont.cont.cont261

inter_warp_reduce-true178.cont.cont.cont261:      ; preds = %inter_warp_reduce-true178.cont.cont, %inter_warp_reduce-true178.cont.cont.then262
  %initial_value_addr180.1 = phi float [ %initial_value_addr180.0, %inter_warp_reduce-true178.cont.cont.then262 ], [ %add.24.i243, %inter_warp_reduce-true178.cont.cont ]
  %84 = icmp ult i32 %1, 16
  %85 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i243, i32 4, i32 31)
  br i1 %84, label %inter_warp_reduce-true178.cont.cont.then, label %inter_warp_reduce-true178.cont.cont.cont

inter_warp_reduce-true178.cont.cont.then:         ; preds = %inter_warp_reduce-true178.cont.cont.cont261
  %.val215.then.val = load float, ptr addrspace(3) %76, align 4
  br label %inter_warp_reduce-true178.cont.cont.cont

inter_warp_reduce-true178.cont.cont.cont:         ; preds = %inter_warp_reduce-true178.cont.cont.cont261, %inter_warp_reduce-true178.cont.cont.then
  %.val215 = phi float [ %.val215.then.val, %inter_warp_reduce-true178.cont.cont.then ], [ %initial_value_addr180.1, %inter_warp_reduce-true178.cont.cont.cont261 ]
  %86 = icmp ult i32 %1, 16
  %add.24.i244 = fadd float %85, %.val215
  br i1 %86, label %inter_warp_reduce-true178.cont.cont.cont.then260, label %inter_warp_reduce-true178.cont.cont.cont.cont259

inter_warp_reduce-true178.cont.cont.cont.then260: ; preds = %inter_warp_reduce-true178.cont.cont.cont
  store float %add.24.i244, ptr addrspace(3) %76, align 4
  br label %inter_warp_reduce-true178.cont.cont.cont.cont259

inter_warp_reduce-true178.cont.cont.cont.cont259: ; preds = %inter_warp_reduce-true178.cont.cont.cont, %inter_warp_reduce-true178.cont.cont.cont.then260
  %initial_value_addr180.2 = phi float [ %initial_value_addr180.1, %inter_warp_reduce-true178.cont.cont.cont.then260 ], [ %add.24.i244, %inter_warp_reduce-true178.cont.cont.cont ]
  %87 = icmp ult i32 %1, 16
  %88 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i244, i32 2, i32 31)
  br i1 %87, label %inter_warp_reduce-true178.cont.cont.cont.then, label %inter_warp_reduce-true178.cont.cont.cont.cont

inter_warp_reduce-true178.cont.cont.cont.then:    ; preds = %inter_warp_reduce-true178.cont.cont.cont.cont259
  %.val214.then.val = load float, ptr addrspace(3) %76, align 4
  br label %inter_warp_reduce-true178.cont.cont.cont.cont

inter_warp_reduce-true178.cont.cont.cont.cont:    ; preds = %inter_warp_reduce-true178.cont.cont.cont.cont259, %inter_warp_reduce-true178.cont.cont.cont.then
  %.val214 = phi float [ %.val214.then.val, %inter_warp_reduce-true178.cont.cont.cont.then ], [ %initial_value_addr180.2, %inter_warp_reduce-true178.cont.cont.cont.cont259 ]
  %89 = icmp ult i32 %1, 16
  %add.24.i245 = fadd float %88, %.val214
  br i1 %89, label %inter_warp_reduce-true178.cont.cont.cont.cont.then258, label %inter_warp_reduce-true178.cont.cont.cont.cont.cont257

inter_warp_reduce-true178.cont.cont.cont.cont.then258: ; preds = %inter_warp_reduce-true178.cont.cont.cont.cont
  store float %add.24.i245, ptr addrspace(3) %76, align 4
  br label %inter_warp_reduce-true178.cont.cont.cont.cont.cont257

inter_warp_reduce-true178.cont.cont.cont.cont.cont257: ; preds = %inter_warp_reduce-true178.cont.cont.cont.cont, %inter_warp_reduce-true178.cont.cont.cont.cont.then258
  %initial_value_addr180.3 = phi float [ %initial_value_addr180.2, %inter_warp_reduce-true178.cont.cont.cont.cont.then258 ], [ %add.24.i245, %inter_warp_reduce-true178.cont.cont.cont.cont ]
  %90 = icmp ult i32 %1, 16
  %91 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i245, i32 1, i32 31)
  br i1 %90, label %inter_warp_reduce-true178.cont.cont.cont.cont.then, label %inter_warp_reduce-true178.cont.cont.cont.cont.cont

inter_warp_reduce-true178.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true178.cont.cont.cont.cont.cont257
  %.val213.then.val = load float, ptr addrspace(3) %76, align 4
  br label %inter_warp_reduce-true178.cont.cont.cont.cont.cont

inter_warp_reduce-true178.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true178.cont.cont.cont.cont.cont257, %inter_warp_reduce-true178.cont.cont.cont.cont.then
  %.val213 = phi float [ %.val213.then.val, %inter_warp_reduce-true178.cont.cont.cont.cont.then ], [ %initial_value_addr180.3, %inter_warp_reduce-true178.cont.cont.cont.cont.cont257 ]
  %92 = icmp ult i32 %1, 16
  %add.24.i246 = fadd float %91, %.val213
  br i1 %92, label %inter_warp_reduce-true178.cont.cont.cont.cont.cont.then, label %inter_warp_reduce-true178.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true178.cont.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true178.cont.cont.cont.cont.cont
  store float %add.24.i246, ptr addrspace(3) %76, align 4
  br label %inter_warp_reduce-true178.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true178.cont.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true178.cont.cont.cont.cont.cont, %inter_warp_reduce-true178.cont.cont.cont.cont.cont.then
  %93 = icmp eq i32 %1, 0
  br i1 %93, label %reduction_write_output-true196, label %common.ret

reduction_write_output-true196:                   ; preds = %inter_warp_reduce-true178.cont.cont.cont.cont.cont.cont
  store float %add.24.i246, ptr addrspace(1) %arg5281, align 128
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

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_20(ptr noalias nocapture readonly align 16 dereferenceable(4) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg6) local_unnamed_addr #4 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load float, ptr addrspace(1) %arg01, align 16, !invariant.load !41
  %1 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !41
  %2 = load float, ptr addrspace(1) %arg13, align 128, !invariant.load !41
  %multiply.8 = fmul float %1, %2
  %subtract.9 = fsub float %0, %multiply.8
  %3 = load float, ptr addrspace(1) %arg37, align 16, !invariant.load !41
  %4 = load float, ptr addrspace(1) %arg49, align 128, !invariant.load !41
  %multiply.11 = fmul float %1, %4
  %subtract.12 = fsub float %3, %multiply.11
  store float %subtract.9, ptr addrspace(1) %arg511, align 128
  store float %subtract.12, ptr addrspace(1) %arg613, align 128
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_10(ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(229376) %arg4) local_unnamed_addr #5 {
entry:
  %arg412 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg310 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !42
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = and i32 %1, 255
  %4 = lshr i32 %linear_index, 8
  %5 = icmp ult i32 %linear_index, 24576
  br i1 %5, label %concatenate.pivot.64., label %concatenate.pivot.160.

concatenate.pivot.64.:                            ; preds = %entry
  %6 = icmp ult i32 %linear_index, 16384
  br i1 %6, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  %7 = zext i32 %4 to i64
  %8 = zext i32 %3 to i64
  %9 = getelementptr inbounds [64 x [256 x float]], ptr addrspace(1) %arg04, i64 0, i64 %7, i64 %8
  br label %concatenate.5.merge

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  %10 = zext i32 %3 to i64
  %11 = sext i32 %4 to i64
  %12 = getelementptr [32 x [256 x float]], ptr addrspace(1) %arg16, i64 0, i64 %11, i64 %10
  %13 = getelementptr inbounds float, ptr addrspace(1) %12, i64 -16384
  br label %concatenate.5.merge

concatenate.pivot.160.:                           ; preds = %entry
  %14 = icmp ult i32 %linear_index, 40960
  %15 = zext i32 %3 to i64
  br i1 %14, label %concatenate.pivot.96.2, label %concatenate.pivot.160.3

concatenate.pivot.96.2:                           ; preds = %concatenate.pivot.160.
  %16 = sext i32 %4 to i64
  %17 = getelementptr [64 x [256 x float]], ptr addrspace(1) %arg28, i64 0, i64 %16, i64 %15
  %18 = getelementptr inbounds float, ptr addrspace(1) %17, i64 -24576
  br label %concatenate.5.merge

concatenate.pivot.160.3:                          ; preds = %concatenate.pivot.160.
  %19 = sext i32 %4 to i64
  %20 = getelementptr [64 x [256 x float]], ptr addrspace(1) %arg310, i64 0, i64 %19, i64 %15
  %21 = getelementptr inbounds float, ptr addrspace(1) %20, i64 -40960
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.160.3, %concatenate.pivot.96.2, %concatenate.pivot.64.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %9, %concatenate.pivot.0. ], [ %13, %concatenate.pivot.64.1 ], [ %18, %concatenate.pivot.96.2 ], [ %21, %concatenate.pivot.160.3 ]
  %22 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !41
  %23 = zext i32 %linear_index to i64
  %24 = getelementptr inbounds float, ptr addrspace(1) %arg412, i64 %23
  store float %22, ptr addrspace(1) %24, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_14(ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(512) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(512) %arg12, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg13, ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg14, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg17, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg18, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg19) local_unnamed_addr #0 {
entry:
  %arg19244 = addrspacecast ptr %arg19 to ptr addrspace(1)
  %arg18242 = addrspacecast ptr %arg18 to ptr addrspace(1)
  %arg17240 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg16238 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg15236 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg14234 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg13232 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12230 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11228 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10226 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9224 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8222 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7220 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6218 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5216 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4214 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3212 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1208 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0206 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
  %thread_id.x = and i32 %1, 31
  %thread_id.y170 = lshr i32 %1, 5
  %2 = lshr i32 %0, 2
  %3 = shl nuw nsw i32 %0, 5
  %tile_origin.2 = and i32 %3, 96
  %4 = shl nuw nsw i32 %2, 14
  %5 = or i32 %tile_origin.2, %thread_id.x
  %6 = zext i32 %5 to i64
  %Arg_12.13 = getelementptr inbounds [128 x [1 x float]], ptr addrspace(1) %arg12230, i64 0, i64 %6, i64 0
  %Arg_12.1314 = load float, ptr addrspace(1) %Arg_12.13, align 4, !invariant.load !41
  %Arg_9.10 = getelementptr inbounds [128 x [1 x float]], ptr addrspace(1) %arg9224, i64 0, i64 %6, i64 0
  %Arg_9.1019 = load float, ptr addrspace(1) %Arg_9.10, align 4, !invariant.load !41
  %7 = shl nuw nsw i32 %thread_id.y170, 7
  %8 = add i32 %4, %7
  %9 = add i32 %8, %tile_origin.2
  %10 = add i32 %9, %thread_id.x
  %11 = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %11, 2
  %13 = lshr i32 %10, 7
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after145, %reduction_write_output-true166
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %y_in_tile.loop_body
  %lsr.iv277 = phi i32 [ %13, %entry ], [ %lsr.iv.next, %y_in_tile.loop_body ]
  %lsr.iv274 = phi ptr addrspace(1) [ %arg17240, %entry ], [ %scevgep275, %y_in_tile.loop_body ]
  %lsr.iv271 = phi ptr addrspace(1) [ %arg0206, %entry ], [ %scevgep272, %y_in_tile.loop_body ]
  %lsr.iv268 = phi ptr addrspace(1) [ %arg1208, %entry ], [ %scevgep269, %y_in_tile.loop_body ]
  %lsr.iv265 = phi ptr addrspace(1) [ %arg2210, %entry ], [ %scevgep266, %y_in_tile.loop_body ]
  %lsr.iv262 = phi ptr addrspace(1) [ %arg3212, %entry ], [ %scevgep263, %y_in_tile.loop_body ]
  %lsr.iv259 = phi ptr addrspace(1) [ %arg4214, %entry ], [ %scevgep260, %y_in_tile.loop_body ]
  %lsr.iv256 = phi ptr addrspace(1) [ %arg5216, %entry ], [ %scevgep257, %y_in_tile.loop_body ]
  %lsr.iv253 = phi ptr addrspace(1) [ %arg6218, %entry ], [ %scevgep254, %y_in_tile.loop_body ]
  %lsr.iv250 = phi ptr addrspace(1) [ %arg7220, %entry ], [ %scevgep251, %y_in_tile.loop_body ]
  %lsr.iv247 = phi ptr addrspace(1) [ %arg8222, %entry ], [ %scevgep248, %y_in_tile.loop_body ]
  %lsr.iv = phi ptr addrspace(1) [ %arg15236, %entry ], [ %scevgep, %y_in_tile.loop_body ]
  %y_in_tile.invar_address.0203 = phi i32 [ %thread_id.y170, %entry ], [ %invar.inc, %y_in_tile.loop_body ]
  %partial_reduction_result4.0202 = phi float [ 0.000000e+00, %entry ], [ %add.68.i, %y_in_tile.loop_body ]
  %partial_reduction_result.0201 = phi float [ -0.000000e+00, %entry ], [ %add.54.i, %y_in_tile.loop_body ]
  %partial_reduction_result2.0200 = phi float [ 0.000000e+00, %entry ], [ %add.61.i, %y_in_tile.loop_body ]
  %invar.inc = add nuw nsw i32 %y_in_tile.invar_address.0203, 32
  %14 = and i32 %lsr.iv277, 33554304
  %15 = or i32 %14, %y_in_tile.invar_address.0203
  %scevgep246 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 %12
  %Arg_15.168 = load float, ptr addrspace(1) %scevgep246, align 4, !invariant.load !41
  %compare.19 = fcmp ogt float %Arg_15.168, 0.000000e+00
  %16 = zext i32 %15 to i64
  %Arg_14.15 = getelementptr inbounds [8192 x [1 x float]], ptr addrspace(1) %arg14234, i64 0, i64 %16, i64 0
  %Arg_14.1510 = load float, ptr addrspace(1) %Arg_14.15, align 4, !invariant.load !41
  %Arg_13.14 = getelementptr inbounds [8192 x [1 x float]], ptr addrspace(1) %arg13232, i64 0, i64 %16, i64 0
  %Arg_13.1411 = load float, ptr addrspace(1) %Arg_13.14, align 4, !invariant.load !41
  %multiply.20 = fmul float %Arg_14.1510, %Arg_13.1411
  %subtract.23 = fsub float 1.000000e+00, %Arg_13.1411
  %multiply.24 = fmul float %multiply.20, %subtract.23
  %multiply.29 = fmul float %Arg_12.1314, %multiply.24
  %Arg_11.12 = getelementptr inbounds [8192 x [1 x float]], ptr addrspace(1) %arg11228, i64 0, i64 %16, i64 0
  %Arg_11.1215 = load float, ptr addrspace(1) %Arg_11.12, align 4, !invariant.load !41
  %Arg_10.11 = getelementptr inbounds [8192 x [1 x float]], ptr addrspace(1) %arg10226, i64 0, i64 %16, i64 0
  %Arg_10.1116 = load float, ptr addrspace(1) %Arg_10.11, align 4, !invariant.load !41
  %multiply.30 = fmul float %Arg_11.1215, %Arg_10.1116
  %subtract.31 = fsub float 1.000000e+00, %Arg_10.1116
  %multiply.32 = fmul float %multiply.30, %subtract.31
  %multiply.37 = fmul float %Arg_9.1019, %multiply.32
  %add.38 = fadd float %multiply.29, %multiply.37
  %scevgep249 = getelementptr i8, ptr addrspace(1) %lsr.iv247, i64 %12
  %Arg_8.920 = load float, ptr addrspace(1) %scevgep249, align 4, !invariant.load !41
  %add.39 = fadd float %Arg_8.920, %add.38
  %scevgep252 = getelementptr i8, ptr addrspace(1) %lsr.iv250, i64 %12
  %Arg_7.821 = load float, ptr addrspace(1) %scevgep252, align 4, !invariant.load !41
  %add.40 = fadd float %Arg_7.821, %add.39
  %scevgep255 = getelementptr i8, ptr addrspace(1) %lsr.iv253, i64 %12
  %Arg_6.722 = load float, ptr addrspace(1) %scevgep255, align 4, !invariant.load !41
  %add.41 = fadd float %Arg_6.722, %add.40
  %scevgep258 = getelementptr i8, ptr addrspace(1) %lsr.iv256, i64 %12
  %Arg_5.623 = load float, ptr addrspace(1) %scevgep258, align 4, !invariant.load !41
  %add.42 = fadd float %Arg_5.623, %add.41
  %scevgep261 = getelementptr i8, ptr addrspace(1) %lsr.iv259, i64 %12
  %Arg_4.524 = load float, ptr addrspace(1) %scevgep261, align 4, !invariant.load !41
  %add.43 = fadd float %Arg_4.524, %add.42
  %scevgep264 = getelementptr i8, ptr addrspace(1) %lsr.iv262, i64 %12
  %Arg_3.425 = load float, ptr addrspace(1) %scevgep264, align 4, !invariant.load !41
  %add.44 = fadd float %Arg_3.425, %add.43
  %scevgep267 = getelementptr i8, ptr addrspace(1) %lsr.iv265, i64 %12
  %Arg_2.326 = load float, ptr addrspace(1) %scevgep267, align 4, !invariant.load !41
  %add.45 = fadd float %Arg_2.326, %add.44
  %scevgep270 = getelementptr i8, ptr addrspace(1) %lsr.iv268, i64 %12
  %Arg_1.227 = load float, ptr addrspace(1) %scevgep270, align 4, !invariant.load !41
  %add.46 = fadd float %Arg_1.227, %add.45
  %scevgep273 = getelementptr i8, ptr addrspace(1) %lsr.iv271, i64 %12
  %Arg_0.128 = load float, ptr addrspace(1) %scevgep273, align 4, !invariant.load !41
  %add.47 = fadd float %Arg_0.128, %add.46
  %17 = select i1 %compare.19, float %add.47, float 0.000000e+00
  %add.54.i = fadd float %partial_reduction_result.0201, %17
  %multiply.56 = fmul float %Arg_15.168, %multiply.24
  %add.61.i = fadd float %partial_reduction_result2.0200, %multiply.56
  %multiply.63 = fmul float %Arg_15.168, %multiply.32
  %add.68.i = fadd float %partial_reduction_result4.0202, %multiply.63
  %scevgep276 = getelementptr i8, ptr addrspace(1) %lsr.iv274, i64 %12
  store float %17, ptr addrspace(1) %scevgep276, align 4
  %scevgep = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 16384
  %scevgep248 = getelementptr i8, ptr addrspace(1) %lsr.iv247, i64 16384
  %scevgep251 = getelementptr i8, ptr addrspace(1) %lsr.iv250, i64 16384
  %scevgep254 = getelementptr i8, ptr addrspace(1) %lsr.iv253, i64 16384
  %scevgep257 = getelementptr i8, ptr addrspace(1) %lsr.iv256, i64 16384
  %scevgep260 = getelementptr i8, ptr addrspace(1) %lsr.iv259, i64 16384
  %scevgep263 = getelementptr i8, ptr addrspace(1) %lsr.iv262, i64 16384
  %scevgep266 = getelementptr i8, ptr addrspace(1) %lsr.iv265, i64 16384
  %scevgep269 = getelementptr i8, ptr addrspace(1) %lsr.iv268, i64 16384
  %scevgep272 = getelementptr i8, ptr addrspace(1) %lsr.iv271, i64 16384
  %scevgep275 = getelementptr i8, ptr addrspace(1) %lsr.iv274, i64 16384
  %lsr.iv.next = add nuw nsw i32 %lsr.iv277, 32
  %18 = icmp ugt i32 %y_in_tile.invar_address.0203, 95
  br i1 %18, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %19 = zext i32 %thread_id.x to i64
  %20 = zext i32 %thread_id.y170 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %19, i64 %20
  store float %add.54.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %20, i64 %19
  %partial_reduction_result112 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %21 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result112, i32 16, i32 31)
  %add.54.i185 = fadd float %partial_reduction_result112, %21
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.54.i185, i32 8, i32 31)
  %add.54.i186 = fadd float %add.54.i185, %22
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.54.i186, i32 4, i32 31)
  %add.54.i187 = fadd float %add.54.i186, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.54.i187, i32 2, i32 31)
  %add.54.i188 = fadd float %add.54.i187, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.54.i188, i32 1, i32 31)
  %add.54.i189 = fadd float %add.54.i188, %25
  store float %add.54.i189, ptr addrspace(3) %shmem_transposed_addr, align 4
  %26 = icmp eq i32 %thread_id.x, 0
  %27 = zext i32 %2 to i64
  %28 = or i32 %tile_origin.2, %thread_id.y170
  %29 = zext i32 %28 to i64
  %output_element_address = getelementptr inbounds [64 x [128 x float]], ptr addrspace(1) %arg16238, i64 0, i64 %27, i64 %29
  br i1 %26, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %30 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address126 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %19, i64 %20
  store float %add.61.i, ptr addrspace(3) %shmem_output_address126, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr128 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %20, i64 %19
  %partial_reduction_result130 = load float, ptr addrspace(3) %shmem_transposed_addr128, align 4
  %31 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result130, i32 16, i32 31)
  %add.61.i190 = fadd float %partial_reduction_result130, %31
  %32 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.61.i190, i32 8, i32 31)
  %add.61.i191 = fadd float %add.61.i190, %32
  %33 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.61.i191, i32 4, i32 31)
  %add.61.i192 = fadd float %add.61.i191, %33
  %34 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.61.i192, i32 2, i32 31)
  %add.61.i193 = fadd float %add.61.i192, %34
  %35 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.61.i193, i32 1, i32 31)
  %add.61.i194 = fadd float %add.61.i193, %35
  store float %add.61.i194, ptr addrspace(3) %shmem_transposed_addr128, align 4
  %output_element_address146 = getelementptr inbounds [64 x [128 x float]], ptr addrspace(1) %arg18242, i64 0, i64 %27, i64 %29
  br i1 %30, label %reduction_write_output-true144, label %reduction_write_output-after145

reduction_write_output-after145:                  ; preds = %reduction_write_output-true144, %reduction_write_output-after
  %36 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address148 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i64 0, i64 0, i64 0, i64 %19, i64 %20
  store float %add.68.i, ptr addrspace(3) %shmem_output_address148, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr150 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i64 0, i64 0, i64 0, i64 %20, i64 %19
  %partial_reduction_result152 = load float, ptr addrspace(3) %shmem_transposed_addr150, align 4
  %37 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result152, i32 16, i32 31)
  %add.68.i195 = fadd float %partial_reduction_result152, %37
  %38 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.68.i195, i32 8, i32 31)
  %add.68.i196 = fadd float %add.68.i195, %38
  %39 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.68.i196, i32 4, i32 31)
  %add.68.i197 = fadd float %add.68.i196, %39
  %40 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.68.i197, i32 2, i32 31)
  %add.68.i198 = fadd float %add.68.i197, %40
  %41 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.68.i198, i32 1, i32 31)
  %add.68.i199 = fadd float %add.68.i198, %41
  store float %add.68.i199, ptr addrspace(3) %shmem_transposed_addr150, align 4
  %output_element_address168 = getelementptr inbounds [64 x [128 x float]], ptr addrspace(1) %arg19244, i64 0, i64 %27, i64 %29
  br i1 %36, label %reduction_write_output-true166, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.54.i189, ptr addrspace(1) %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true144:                   ; preds = %reduction_write_output-after
  store float %add.61.i194, ptr addrspace(1) %output_element_address146, align 4
  br label %reduction_write_output-after145

reduction_write_output-true166:                   ; preds = %reduction_write_output-after145
  store float %add.68.i199, ptr addrspace(1) %output_element_address168, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_28(ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(512) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(512) %arg4) local_unnamed_addr #0 {
entry:
  %arg4197 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3195 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2193 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1191 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0189 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !39
  %trunc.not = icmp eq i32 %0, 0
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !39
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
  %thread_id.x = and i32 %2, 31
  %thread_id.y131 = lshr i32 %2, 5
  %tile_origin.2 = shl nuw nsw i32 %1, 6
  %Arg_1.2 = load float, ptr addrspace(1) %arg1191, align 128, !invariant.load !41
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
  %21 = load <2 x float>, ptr addrspace(1) %scevgep209, align 8, !invariant.load !41
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
  %40 = load <2 x float>, ptr addrspace(1) %scevgep215, align 8, !invariant.load !41
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
define void @fusion_17(ptr noalias nocapture readonly align 16 dereferenceable(512) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(512) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(512) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(512) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(512) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(512) %arg6) local_unnamed_addr #6 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !41
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !41
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4, !invariant.load !41
  %multiply.7 = fmul float %4, %6
  %subtract.9 = fsub float %3, %multiply.7
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %1
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !41
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %1
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !41
  %multiply.10 = fmul float %4, %10
  %subtract.12 = fsub float %8, %multiply.10
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %1
  store float %subtract.9, ptr addrspace(1) %11, align 4
  %12 = getelementptr inbounds float, ptr addrspace(1) %arg613, i64 %1
  store float %subtract.12, ptr addrspace(1) %12, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_12(ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(65536) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(65536) %arg3) local_unnamed_addr #6 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !46
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !41
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !41
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !41
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  store float %subtract.6, ptr addrspace(1) %9, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_11(ptr noalias nocapture readonly align 128 dereferenceable(4194304) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4194304) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg3) local_unnamed_addr #0 {
entry:
  %arg397 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg295 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg193 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg091 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !45
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
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
  %Arg_1.23 = load float, ptr addrspace(1) %Arg_1.2, align 8, !invariant.load !41
  %compare.5 = fcmp ogt float %Arg_1.23, 0.000000e+00
  %Arg_0.1 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg091, i64 0, i64 %23, i64 %24
  %Arg_0.14 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !41
  %25 = select i1 %compare.5, float %Arg_0.14, float 0.000000e+00
  %add.12.i = fadd float %partial_reduction_result63.sroa.0.087, %25
  %scevgep108 = getelementptr i8, ptr addrspace(1) %lsr.iv106, i64 -4
  %26 = load <2 x float>, ptr addrspace(1) %scevgep108, align 8, !invariant.load !41
  %Arg_1.26113 = extractelement <2 x float> %26, i32 0
  %Arg_1.222114 = extractelement <2 x float> %26, i32 1
  %compare.58 = fcmp ogt float %Arg_1.26113, 0.000000e+00
  %scevgep112 = getelementptr i8, ptr addrspace(1) %lsr.iv110, i64 -4
  %27 = load <2 x float>, ptr addrspace(1) %scevgep112, align 8, !invariant.load !41
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
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !41
  %compare.517 = fcmp ogt float %Arg_1.215, 0.000000e+00
  %Arg_0.118 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg091, i64 0, i64 %35, i64 %36
  %Arg_0.119 = load float, ptr addrspace(1) %Arg_0.118, align 4, !invariant.load !41
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
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i64 0, i64 0, i64 0, i64 %43, i64 %44
  store float %add.12.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i64 0, i64 0, i64 0, i64 %44, i64 %43
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

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_10(ptr noalias nocapture readonly align 16 dereferenceable(512) %arg0, ptr noalias nocapture align 128 dereferenceable(512) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(512) %arg3, ptr noalias nocapture align 128 dereferenceable(512) %arg4) local_unnamed_addr #6 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !41
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !41
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.7 = fmul float %4, %6
  %subtract.8 = fsub float %3, %multiply.7
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %1
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !41
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %1
  %10 = load float, ptr addrspace(1) %9, align 4
  %multiply.9 = fmul float %4, %10
  %subtract.10 = fsub float %8, %multiply.9
  store float %subtract.8, ptr addrspace(1) %9, align 4
  store float %subtract.10, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_9(ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg0, ptr noalias nocapture align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #6 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !41
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !41
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_8(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(65536) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg3) local_unnamed_addr #0 {
entry:
  %arg397 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg295 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg193 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg091 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
  %thread_id.x = and i32 %1, 31
  %thread_id.y64 = lshr i32 %1, 5
  %2 = lshr i32 %0, 2
  %3 = shl nuw nsw i32 %0, 6
  %tile_origin.2 = and i32 %3, 192
  %4 = shl nuw nsw i32 %thread_id.x, 1
  %5 = shl nuw nsw i32 %2, 15
  %6 = shl nuw nsw i32 %thread_id.y64, 8
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
  %19 = and i32 %lsr.iv104, 254
  %20 = add i32 %14, %lsr.iv
  %21 = and i32 %20, 16777088
  %22 = or i32 %21, %18
  %23 = zext i32 %22 to i64
  %24 = zext i32 %19 to i64
  %Arg_1.2 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg193, i64 0, i64 %23, i64 %24
  %Arg_1.23 = load float, ptr addrspace(1) %Arg_1.2, align 8, !invariant.load !41
  %compare.5 = fcmp ogt float %Arg_1.23, 0.000000e+00
  %Arg_0.1 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg091, i64 0, i64 %23, i64 %24
  %Arg_0.14 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !41
  %25 = select i1 %compare.5, float %Arg_0.14, float 0.000000e+00
  %add.12.i = fadd float %partial_reduction_result63.sroa.0.087, %25
  %scevgep108 = getelementptr i8, ptr addrspace(1) %lsr.iv106, i64 -4
  %26 = load <2 x float>, ptr addrspace(1) %scevgep108, align 8, !invariant.load !41
  %Arg_1.26113 = extractelement <2 x float> %26, i32 0
  %Arg_1.222114 = extractelement <2 x float> %26, i32 1
  %compare.58 = fcmp ogt float %Arg_1.26113, 0.000000e+00
  %scevgep112 = getelementptr i8, ptr addrspace(1) %lsr.iv110, i64 -4
  %27 = load <2 x float>, ptr addrspace(1) %scevgep112, align 8, !invariant.load !41
  %Arg_0.110115 = extractelement <2 x float> %27, i32 0
  %Arg_0.126116 = extractelement <2 x float> %27, i32 1
  %28 = select i1 %compare.58, float %Arg_0.110115, float 0.000000e+00
  %29 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg397, i64 0, i64 %23, i64 %24
  store float %28, ptr addrspace(1) %29, align 8
  %30 = add i32 %lsr.iv104, 1
  %31 = and i32 %30, 255
  %32 = add i32 %13, %lsr.iv
  %33 = and i32 %32, 16777088
  %34 = or i32 %33, %18
  %35 = zext i32 %34 to i64
  %36 = zext i32 %31 to i64
  %Arg_1.214 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg193, i64 0, i64 %35, i64 %36
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !41
  %compare.517 = fcmp ogt float %Arg_1.215, 0.000000e+00
  %Arg_0.118 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg091, i64 0, i64 %35, i64 %36
  %Arg_0.119 = load float, ptr addrspace(1) %Arg_0.118, align 4, !invariant.load !41
  %37 = select i1 %compare.517, float %Arg_0.119, float 0.000000e+00
  %add.12.i76 = fadd float %partial_reduction_result63.sroa.4.088, %37
  %compare.524 = fcmp ogt float %Arg_1.222114, 0.000000e+00
  %38 = select i1 %compare.524, float %Arg_0.126116, float 0.000000e+00
  %39 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg397, i64 0, i64 %35, i64 %36
  store float %38, ptr addrspace(1) %39, align 4
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 32
  %40 = add i32 %thread_id.y64, %lsr.iv.next
  %41 = add i32 %40, -32
  %lsr.iv.next105 = add nuw nsw i32 %lsr.iv104, 8192
  %scevgep107 = getelementptr i8, ptr addrspace(1) %lsr.iv106, i64 32768
  %scevgep111 = getelementptr i8, ptr addrspace(1) %lsr.iv110, i64 32768
  %42 = icmp ugt i32 %41, 95
  br i1 %42, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %43 = zext i32 %thread_id.x to i64
  %44 = zext i32 %thread_id.y64 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i64 0, i64 0, i64 0, i64 %43, i64 %44
  store float %add.12.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i64 0, i64 0, i64 0, i64 %44, i64 %43
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
  %output_element_address = getelementptr inbounds [64 x [256 x float]], ptr addrspace(1) %arg295, i64 0, i64 %52, i64 %54
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
define void @reduce_152(ptr noalias nocapture readonly align 128 dereferenceable(65536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg2) local_unnamed_addr #0 {
entry:
  %arg278 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg176 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg074 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !48
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
  %thread_id.x = and i32 %1, 31
  %thread_id.y47 = lshr i32 %1, 5
  %tile_origin.2 = shl nuw nsw i32 %0, 6
  %Arg_1.2 = load float, ptr addrspace(1) %arg176, align 128, !invariant.load !41
  %2 = shl nuw nsw i32 %thread_id.x, 1
  %3 = or i32 %2, %tile_origin.2
  %4 = zext i32 %3 to i64
  %5 = add nuw nsw i32 %thread_id.y47, -32
  %6 = zext i32 %1 to i64
  %7 = lshr i64 %6, 5
  %8 = shl nuw nsw i64 %7, 10
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
  %12 = load <2 x float>, ptr addrspace(1) %scevgep86, align 8, !invariant.load !41
  %Arg_0.1387 = extractelement <2 x float> %12, i32 0
  %Arg_0.1888 = extractelement <2 x float> %12, i32 1
  %add.6.i = fadd float %partial_reduction_result46.sroa.0.070, %Arg_0.1387
  %add.6.i59 = fadd float %partial_reduction_result46.sroa.4.071, %Arg_0.1888
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %scevgep85 = getelementptr i8, ptr addrspace(1) %lsr.iv84, i64 32768
  %13 = icmp ugt i32 %lsr.iv.next, 31
  br i1 %13, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %14 = zext i32 %thread_id.x to i64
  %15 = zext i32 %thread_id.y47 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i64 0, i64 0, i64 0, i64 %14, i64 %15
  store float %add.6.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i64 0, i64 0, i64 0, i64 %15, i64 %14
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
  %output_element_address = getelementptr inbounds [256 x float], ptr addrspace(1) %arg278, i64 0, i64 %24
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
define void @fusion_7(ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg0, ptr noalias nocapture align 128 dereferenceable(1024) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #6 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !44
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !41
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !41
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4
  %multiply.5 = fmul float %4, %6
  %subtract.6 = fsub float %3, %multiply.5
  store float %subtract.6, ptr addrspace(1) %5, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_3(ptr noalias nocapture readonly align 16 dereferenceable(1048576) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(7340032) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1048576) %arg3) local_unnamed_addr #6 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !44
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 5
  %5 = and i32 %linear_index3, 31
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = and i32 %linear_index2, 30
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 29
  %8 = and i32 %3, 28
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg07, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !41
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !41
  %17 = zext i32 %4 to i64
  %18 = zext i32 %8 to i64
  %19 = getelementptr [8192 x [224 x float]], ptr addrspace(1) %arg19, i64 0, i64 %17, i64 %18
  %20 = getelementptr inbounds float, ptr addrspace(1) %19, i64 64
  %21 = load <2 x float>, ptr addrspace(1) %20, align 16, !invariant.load !41
  %22 = extractelement <2 x float> %21, i32 0
  %23 = extractelement <2 x float> %21, i32 1
  %multiply.6 = fmul float %16, %22
  %subtract.7 = fsub float %12, %multiply.6
  %24 = getelementptr float, ptr addrspace(1) %arg313, i64 %9
  %25 = zext i32 %7 to i64
  %26 = getelementptr [8192 x [224 x float]], ptr addrspace(1) %arg19, i64 0, i64 %17, i64 %25
  %multiply.61 = fmul float %16, %23
  %subtract.72 = fsub float %13, %multiply.61
  %27 = zext i32 %6 to i64
  %28 = getelementptr [8192 x [224 x float]], ptr addrspace(1) %arg19, i64 0, i64 %17, i64 %27
  %29 = getelementptr inbounds float, ptr addrspace(1) %28, i64 64
  %30 = load float, ptr addrspace(1) %29, align 8, !invariant.load !41
  %multiply.63 = fmul float %16, %30
  %subtract.74 = fsub float %14, %multiply.63
  %31 = zext i32 %5 to i64
  %32 = getelementptr [8192 x [224 x float]], ptr addrspace(1) %arg19, i64 0, i64 %17, i64 %31
  %33 = getelementptr inbounds float, ptr addrspace(1) %32, i64 64
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !41
  %multiply.65 = fmul float %16, %34
  %subtract.76 = fsub float %15, %multiply.65
  %35 = insertelement <4 x float> poison, float %subtract.7, i32 0
  %36 = insertelement <4 x float> %35, float %subtract.72, i32 1
  %37 = insertelement <4 x float> %36, float %subtract.74, i32 2
  %38 = insertelement <4 x float> %37, float %subtract.76, i32 3
  store <4 x float> %38, ptr addrspace(1) %24, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @slice_20(ptr noalias nocapture readonly align 128 dereferenceable(7340032) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg1) local_unnamed_addr #6 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !44
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
  %9 = zext i32 %4 to i64
  %10 = zext i32 %8 to i64
  %11 = getelementptr [8192 x [224 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %10
  %12 = getelementptr inbounds float, ptr addrspace(1) %11, i64 160
  %13 = load <2 x float>, ptr addrspace(1) %12, align 16, !invariant.load !41
  %14 = extractelement <2 x float> %13, i32 0
  %15 = extractelement <2 x float> %13, i32 1
  %16 = zext i32 %linear_index_base to i64
  %17 = getelementptr float, ptr addrspace(1) %arg13, i64 %16
  %18 = zext i32 %7 to i64
  %19 = getelementptr [8192 x [224 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %18
  %20 = zext i32 %6 to i64
  %21 = getelementptr [8192 x [224 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %20
  %22 = getelementptr inbounds float, ptr addrspace(1) %21, i64 160
  %23 = load float, ptr addrspace(1) %22, align 8, !invariant.load !41
  %24 = zext i32 %5 to i64
  %25 = getelementptr [8192 x [224 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %24
  %26 = getelementptr inbounds float, ptr addrspace(1) %25, i64 160
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !41
  %28 = insertelement <4 x float> poison, float %14, i32 0
  %29 = insertelement <4 x float> %28, float %15, i32 1
  %30 = insertelement <4 x float> %29, float %23, i32 2
  %31 = insertelement <4 x float> %30, float %27, i32 3
  store <4 x float> %31, ptr addrspace(1) %17, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(7340032) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg5) local_unnamed_addr #6 {
entry:
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !44
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
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !41
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg217, align 16, !invariant.load !41
  %17 = zext i32 %4 to i64
  %18 = zext i32 %8 to i64
  %19 = getelementptr inbounds [8192 x [224 x float]], ptr addrspace(1) %arg115, i64 0, i64 %17, i64 %18
  %20 = load <2 x float>, ptr addrspace(1) %19, align 16, !invariant.load !41
  %21 = extractelement <2 x float> %20, i32 0
  %22 = extractelement <2 x float> %20, i32 1
  %multiply.7 = fmul float %16, %21
  %subtract.8 = fsub float %12, %multiply.7
  %23 = getelementptr float, ptr addrspace(1) %arg319, i64 %9
  %24 = load <4 x float>, ptr addrspace(1) %23, align 16, !invariant.load !41
  %25 = extractelement <4 x float> %24, i32 0
  %26 = extractelement <4 x float> %24, i32 1
  %27 = extractelement <4 x float> %24, i32 2
  %28 = extractelement <4 x float> %24, i32 3
  %29 = getelementptr inbounds float, ptr addrspace(1) %19, i64 96
  %30 = load <2 x float>, ptr addrspace(1) %29, align 16, !invariant.load !41
  %31 = extractelement <2 x float> %30, i32 0
  %32 = extractelement <2 x float> %30, i32 1
  %multiply.10 = fmul float %16, %31
  %subtract.11 = fsub float %25, %multiply.10
  %33 = getelementptr float, ptr addrspace(1) %arg421, i64 %9
  %34 = getelementptr float, ptr addrspace(1) %arg523, i64 %9
  %35 = zext i32 %7 to i64
  %36 = getelementptr inbounds [8192 x [224 x float]], ptr addrspace(1) %arg115, i64 0, i64 %17, i64 %35
  %multiply.71 = fmul float %16, %22
  %subtract.82 = fsub float %13, %multiply.71
  %multiply.103 = fmul float %16, %32
  %subtract.114 = fsub float %26, %multiply.103
  %37 = zext i32 %6 to i64
  %38 = getelementptr inbounds [8192 x [224 x float]], ptr addrspace(1) %arg115, i64 0, i64 %17, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 8, !invariant.load !41
  %multiply.75 = fmul float %16, %39
  %subtract.86 = fsub float %14, %multiply.75
  %40 = getelementptr inbounds float, ptr addrspace(1) %38, i64 96
  %41 = load float, ptr addrspace(1) %40, align 8, !invariant.load !41
  %multiply.107 = fmul float %16, %41
  %subtract.118 = fsub float %27, %multiply.107
  %42 = zext i32 %5 to i64
  %43 = getelementptr inbounds [8192 x [224 x float]], ptr addrspace(1) %arg115, i64 0, i64 %17, i64 %42
  %44 = load float, ptr addrspace(1) %43, align 4, !invariant.load !41
  %multiply.79 = fmul float %16, %44
  %subtract.810 = fsub float %15, %multiply.79
  %45 = getelementptr inbounds float, ptr addrspace(1) %43, i64 96
  %46 = load float, ptr addrspace(1) %45, align 4, !invariant.load !41
  %multiply.1011 = fmul float %16, %46
  %subtract.1112 = fsub float %28, %multiply.1011
  %47 = insertelement <4 x float> poison, float %subtract.8, i32 0
  %48 = insertelement <4 x float> %47, float %subtract.82, i32 1
  %49 = insertelement <4 x float> %48, float %subtract.86, i32 2
  %50 = insertelement <4 x float> %49, float %subtract.810, i32 3
  store <4 x float> %50, ptr addrspace(1) %33, align 16
  %51 = insertelement <4 x float> poison, float %subtract.11, i32 0
  %52 = insertelement <4 x float> %51, float %subtract.114, i32 1
  %53 = insertelement <4 x float> %52, float %subtract.118, i32 2
  %54 = insertelement <4 x float> %53, float %subtract.1112, i32 3
  store <4 x float> %54, ptr addrspace(1) %34, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_11(ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1048576) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(7340032) %arg4) local_unnamed_addr #5 {
entry:
  %arg464 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg362 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg260 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg158 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg056 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !49
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !44
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 224
  %5 = mul i32 %4, 224
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 224
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 224
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 224
  %9 = icmp ult i32 %.decomposed, 96
  br i1 %9, label %concatenate.pivot.64., label %concatenate.pivot.160.

concatenate.pivot.64.:                            ; preds = %entry
  %10 = icmp ult i32 %.decomposed, 64
  br i1 %10, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  %11 = udiv i32 %linear_index_base, 224
  %12 = shl nuw nsw i32 %11, 6
  %13 = add nuw nsw i32 %12, %.decomposed
  br label %concatenate.5.merge

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  %14 = add nsw i32 %.decomposed, -64
  %15 = udiv i32 %linear_index_base, 224
  %16 = shl nuw nsw i32 %15, 5
  %17 = add nuw nsw i32 %14, %16
  br label %concatenate.5.merge

concatenate.pivot.160.:                           ; preds = %entry
  %18 = icmp ult i32 %.decomposed, 160
  %19 = udiv i32 %linear_index_base, 224
  %20 = shl nuw nsw i32 %19, 6
  br i1 %18, label %concatenate.pivot.96.2, label %concatenate.pivot.160.3

concatenate.pivot.96.2:                           ; preds = %concatenate.pivot.160.
  %21 = add nsw i32 %.decomposed, -96
  %22 = add nuw nsw i32 %21, %20
  br label %concatenate.5.merge

concatenate.pivot.160.3:                          ; preds = %concatenate.pivot.160.
  %23 = add nsw i32 %.decomposed, -160
  %24 = add nuw nsw i32 %23, %20
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.160.3, %concatenate.pivot.96.2, %concatenate.pivot.64.1, %concatenate.pivot.0.
  %.sink49 = phi i32 [ %24, %concatenate.pivot.160.3 ], [ %22, %concatenate.pivot.96.2 ], [ %17, %concatenate.pivot.64.1 ], [ %13, %concatenate.pivot.0. ]
  %arg3.sink = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.160.3 ], [ %arg260, %concatenate.pivot.96.2 ], [ %arg158, %concatenate.pivot.64.1 ], [ %arg056, %concatenate.pivot.0. ]
  %25 = zext i32 %.sink49 to i64
  %26 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !41
  %28 = zext i32 %linear_index_base to i64
  %29 = getelementptr float, ptr addrspace(1) %arg464, i64 %28
  store float %27, ptr addrspace(1) %29, align 16
  %30 = icmp ult i32 %6, 96
  br i1 %30, label %concatenate.pivot.64.10, label %concatenate.pivot.160.13

concatenate.pivot.64.10:                          ; preds = %concatenate.5.merge
  %31 = icmp ult i32 %6, 64
  br i1 %31, label %concatenate.pivot.0.11, label %concatenate.pivot.64.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.64.10
  %32 = udiv i32 %linear_index_base, 224
  %33 = shl nuw nsw i32 %32, 6
  %34 = add nuw nsw i32 %33, %6
  br label %concatenate.5.merge4

concatenate.pivot.64.12:                          ; preds = %concatenate.pivot.64.10
  %35 = add nsw i32 %6, -64
  %36 = udiv i32 %linear_index_base, 224
  %37 = shl nuw nsw i32 %36, 5
  %38 = add nuw nsw i32 %35, %37
  br label %concatenate.5.merge4

concatenate.pivot.160.13:                         ; preds = %concatenate.5.merge
  %39 = icmp ult i32 %6, 160
  %40 = udiv i32 %linear_index_base, 224
  %41 = shl nuw nsw i32 %40, 6
  br i1 %39, label %concatenate.pivot.96.14, label %concatenate.pivot.160.15

concatenate.pivot.96.14:                          ; preds = %concatenate.pivot.160.13
  %42 = add nsw i32 %6, -96
  %43 = add nuw nsw i32 %42, %41
  br label %concatenate.5.merge4

concatenate.pivot.160.15:                         ; preds = %concatenate.pivot.160.13
  %44 = add nsw i32 %6, -160
  %45 = add nuw nsw i32 %44, %41
  br label %concatenate.5.merge4

concatenate.5.merge4:                             ; preds = %concatenate.pivot.160.15, %concatenate.pivot.96.14, %concatenate.pivot.64.12, %concatenate.pivot.0.11
  %.sink51 = phi i32 [ %45, %concatenate.pivot.160.15 ], [ %43, %concatenate.pivot.96.14 ], [ %38, %concatenate.pivot.64.12 ], [ %34, %concatenate.pivot.0.11 ]
  %arg3.sink50 = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.160.15 ], [ %arg260, %concatenate.pivot.96.14 ], [ %arg158, %concatenate.pivot.64.12 ], [ %arg056, %concatenate.pivot.0.11 ]
  %46 = zext i32 %.sink51 to i64
  %47 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink50, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !41
  %49 = getelementptr inbounds float, ptr addrspace(1) %29, i64 1
  store float %48, ptr addrspace(1) %49, align 4
  %50 = icmp ult i32 %7, 96
  br i1 %50, label %concatenate.pivot.64.22, label %concatenate.pivot.160.25

concatenate.pivot.64.22:                          ; preds = %concatenate.5.merge4
  %51 = icmp ult i32 %7, 64
  br i1 %51, label %concatenate.pivot.0.23, label %concatenate.pivot.64.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.64.22
  %52 = udiv i32 %linear_index_base, 224
  %53 = shl nuw nsw i32 %52, 6
  %54 = add nuw nsw i32 %53, %7
  br label %concatenate.5.merge16

concatenate.pivot.64.24:                          ; preds = %concatenate.pivot.64.22
  %55 = add nsw i32 %7, -64
  %56 = udiv i32 %linear_index_base, 224
  %57 = shl nuw nsw i32 %56, 5
  %58 = add nuw nsw i32 %55, %57
  br label %concatenate.5.merge16

concatenate.pivot.160.25:                         ; preds = %concatenate.5.merge4
  %59 = icmp ult i32 %7, 160
  %60 = udiv i32 %linear_index_base, 224
  %61 = shl nuw nsw i32 %60, 6
  br i1 %59, label %concatenate.pivot.96.26, label %concatenate.pivot.160.27

concatenate.pivot.96.26:                          ; preds = %concatenate.pivot.160.25
  %62 = add nsw i32 %7, -96
  %63 = add nuw nsw i32 %62, %61
  br label %concatenate.5.merge16

concatenate.pivot.160.27:                         ; preds = %concatenate.pivot.160.25
  %64 = add nsw i32 %7, -160
  %65 = add nuw nsw i32 %64, %61
  br label %concatenate.5.merge16

concatenate.5.merge16:                            ; preds = %concatenate.pivot.160.27, %concatenate.pivot.96.26, %concatenate.pivot.64.24, %concatenate.pivot.0.23
  %.sink53 = phi i32 [ %65, %concatenate.pivot.160.27 ], [ %63, %concatenate.pivot.96.26 ], [ %58, %concatenate.pivot.64.24 ], [ %54, %concatenate.pivot.0.23 ]
  %arg3.sink52 = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.160.27 ], [ %arg260, %concatenate.pivot.96.26 ], [ %arg158, %concatenate.pivot.64.24 ], [ %arg056, %concatenate.pivot.0.23 ]
  %66 = zext i32 %.sink53 to i64
  %67 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink52, i64 %66
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !41
  %69 = getelementptr inbounds float, ptr addrspace(1) %29, i64 2
  store float %68, ptr addrspace(1) %69, align 8
  %70 = icmp ult i32 %8, 96
  br i1 %70, label %concatenate.pivot.64.34, label %concatenate.pivot.160.37

concatenate.pivot.64.34:                          ; preds = %concatenate.5.merge16
  %71 = icmp ult i32 %8, 64
  br i1 %71, label %concatenate.pivot.0.35, label %concatenate.pivot.64.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.64.34
  %72 = udiv i32 %linear_index_base, 224
  %73 = shl nuw nsw i32 %72, 6
  %74 = add nuw nsw i32 %73, %8
  br label %concatenate.5.merge28

concatenate.pivot.64.36:                          ; preds = %concatenate.pivot.64.34
  %75 = add nsw i32 %8, -64
  %76 = udiv i32 %linear_index_base, 224
  %77 = shl nuw nsw i32 %76, 5
  %78 = add nuw nsw i32 %75, %77
  br label %concatenate.5.merge28

concatenate.pivot.160.37:                         ; preds = %concatenate.5.merge16
  %79 = icmp ult i32 %8, 160
  %80 = shl nuw nsw i32 %4, 6
  br i1 %79, label %concatenate.pivot.96.38, label %concatenate.pivot.160.39

concatenate.pivot.96.38:                          ; preds = %concatenate.pivot.160.37
  %81 = add nsw i32 %8, -96
  %82 = add nuw nsw i32 %81, %80
  br label %concatenate.5.merge28

concatenate.pivot.160.39:                         ; preds = %concatenate.pivot.160.37
  %83 = add nsw i32 %8, -160
  %84 = add nuw nsw i32 %83, %80
  br label %concatenate.5.merge28

concatenate.5.merge28:                            ; preds = %concatenate.pivot.160.39, %concatenate.pivot.96.38, %concatenate.pivot.64.36, %concatenate.pivot.0.35
  %.sink55 = phi i32 [ %84, %concatenate.pivot.160.39 ], [ %82, %concatenate.pivot.96.38 ], [ %78, %concatenate.pivot.64.36 ], [ %74, %concatenate.pivot.0.35 ]
  %arg3.sink54 = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.160.39 ], [ %arg260, %concatenate.pivot.96.38 ], [ %arg158, %concatenate.pivot.64.36 ], [ %arg056, %concatenate.pivot.0.35 ]
  %85 = zext i32 %.sink55 to i64
  %86 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink54, i64 %85
  %87 = load float, ptr addrspace(1) %86, align 4, !invariant.load !41
  %88 = getelementptr inbounds float, ptr addrspace(1) %29, i64 3
  store float %87, ptr addrspace(1) %88, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_2(ptr noalias nocapture readonly align 16 dereferenceable(32768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(229376) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg3) local_unnamed_addr #6 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
  %linear_index = or i32 %1, %2
  %3 = lshr i32 %linear_index, 8
  %4 = and i32 %2, 255
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !41
  %8 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !41
  %9 = zext i32 %4 to i64
  %10 = zext i32 %3 to i64
  %11 = getelementptr [224 x [256 x float]], ptr addrspace(1) %arg13, i64 0, i64 %10, i64 %9
  %12 = getelementptr inbounds float, ptr addrspace(1) %11, i64 16384
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !41
  %multiply.6 = fmul float %8, %13
  %subtract.7 = fsub float %7, %multiply.6
  %14 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %5
  store float %subtract.7, ptr addrspace(1) %14, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_6(ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(229376) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(65536) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(65536) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(65536) %arg7) local_unnamed_addr #6 {
entry:
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !46
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
  %linear_index = or i32 %1, %2
  %3 = lshr i32 %linear_index, 8
  %4 = and i32 %2, 255
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !41
  %8 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !41
  %9 = zext i32 %4 to i64
  %10 = zext i32 %3 to i64
  %11 = getelementptr [224 x [256 x float]], ptr addrspace(1) %arg13, i64 0, i64 %10, i64 %9
  %12 = getelementptr inbounds float, ptr addrspace(1) %11, i64 40960
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !41
  %multiply.8 = fmul float %8, %13
  %subtract.9 = fsub float %7, %multiply.8
  %14 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %5
  %15 = load float, ptr addrspace(1) %14, align 4, !invariant.load !41
  %16 = load float, ptr addrspace(1) %11, align 4, !invariant.load !41
  %multiply.11 = fmul float %8, %16
  %subtract.12 = fsub float %15, %multiply.11
  %17 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %5
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !41
  %19 = getelementptr inbounds float, ptr addrspace(1) %11, i64 24576
  %20 = load float, ptr addrspace(1) %19, align 4, !invariant.load !41
  %multiply.14 = fmul float %8, %20
  %subtract.15 = fsub float %18, %multiply.14
  %21 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %5
  store float %subtract.9, ptr addrspace(1) %21, align 4
  %22 = getelementptr inbounds float, ptr addrspace(1) %arg613, i64 %5
  store float %subtract.12, ptr addrspace(1) %22, align 4
  %23 = getelementptr inbounds float, ptr addrspace(1) %arg715, i64 %5
  store float %subtract.15, ptr addrspace(1) %23, align 4
  ret void
}

attributes #0 = { nounwind }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #6 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37}
!llvm.module.flags = !{!38}

!0 = !{ptr @fusion_27, !"kernel", i32 1}
!1 = !{ptr @fusion_27, !"reqntidx", i32 512}
!2 = !{ptr @fusion_20, !"kernel", i32 1}
!3 = !{ptr @fusion_20, !"reqntidx", i32 1}
!4 = !{ptr @concatenate_10, !"kernel", i32 1}
!5 = !{ptr @concatenate_10, !"reqntidx", i32 1024}
!6 = !{ptr @fusion_14, !"kernel", i32 1}
!7 = !{ptr @fusion_14, !"reqntidx", i32 1024}
!8 = !{ptr @fusion_28, !"kernel", i32 1}
!9 = !{ptr @fusion_28, !"reqntidx", i32 1024}
!10 = !{ptr @fusion_17, !"kernel", i32 1}
!11 = !{ptr @fusion_17, !"reqntidx", i32 128}
!12 = !{ptr @fusion_12, !"kernel", i32 1}
!13 = !{ptr @fusion_12, !"reqntidx", i32 1024}
!14 = !{ptr @fusion_11, !"kernel", i32 1}
!15 = !{ptr @fusion_11, !"reqntidx", i32 1024}
!16 = !{ptr @fusion_10, !"kernel", i32 1}
!17 = !{ptr @fusion_10, !"reqntidx", i32 128}
!18 = !{ptr @fusion_9, !"kernel", i32 1}
!19 = !{ptr @fusion_9, !"reqntidx", i32 1024}
!20 = !{ptr @fusion_8, !"kernel", i32 1}
!21 = !{ptr @fusion_8, !"reqntidx", i32 1024}
!22 = !{ptr @reduce_152, !"kernel", i32 1}
!23 = !{ptr @reduce_152, !"reqntidx", i32 1024}
!24 = !{ptr @fusion_7, !"kernel", i32 1}
!25 = !{ptr @fusion_7, !"reqntidx", i32 256}
!26 = !{ptr @fusion_3, !"kernel", i32 1}
!27 = !{ptr @fusion_3, !"reqntidx", i32 256}
!28 = !{ptr @slice_20, !"kernel", i32 1}
!29 = !{ptr @slice_20, !"reqntidx", i32 256}
!30 = !{ptr @fusion_5, !"kernel", i32 1}
!31 = !{ptr @fusion_5, !"reqntidx", i32 256}
!32 = !{ptr @concatenate_11, !"kernel", i32 1}
!33 = !{ptr @concatenate_11, !"reqntidx", i32 256}
!34 = !{ptr @fusion_2, !"kernel", i32 1}
!35 = !{ptr @fusion_2, !"reqntidx", i32 1024}
!36 = !{ptr @fusion_6, !"kernel", i32 1}
!37 = !{ptr @fusion_6, !"reqntidx", i32 1024}
!38 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!39 = !{i32 0, i32 2}
!40 = !{i32 0, i32 512}
!41 = !{}
!42 = !{i32 0, i32 56}
!43 = !{i32 0, i32 1024}
!44 = !{i32 0, i32 256}
!45 = !{i32 0, i32 128}
!46 = !{i32 0, i32 16}
!47 = !{i32 0, i32 32}
!48 = !{i32 0, i32 4}
!49 = !{i32 0, i32 1792}
!50 = !{i32 0, i32 8}
