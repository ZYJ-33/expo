target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define void @cluster_1_convert_5(i8* align 16 dereferenceable(67108864) %alloc0, i8* align 64 dereferenceable(67108864) %temp_buf) {
entry:
  %loop.invar_address = alloca i32
  %convert.5.raw = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %convert.5.typed = bitcast i8* %convert.5.raw to [4096 x [4096 x i16]]*
  %arg0.1.raw = getelementptr inbounds i8, i8* %alloc0, i64 0
  %arg0.1.typed = bitcast i8* %arg0.1.raw to [4096 x [4096 x float]]*
  store i32 0, i32* %loop.invar_address
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %convert.5.in_bounds-after, %entry
  %loop.indvar = load i32, i32* %loop.invar_address
  %0 = icmp uge i32 %loop.indvar, 16777216
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 221184
  store i32 %invar.inc, i32* %loop.invar_address
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %4 = mul nuw nsw i32 %2, 128
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 55296
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %5 = udiv i32 %linear_index_plus_base, 1
  %6 = urem i32 %5, 4096
  %7 = udiv i32 %linear_index_plus_base, 4096
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 4096
  %10 = udiv i32 %linear_index1, 4096
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %11 = udiv i32 %linear_index2, 1
  %12 = urem i32 %11, 4096
  %13 = udiv i32 %linear_index2, 4096
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = urem i32 %14, 4096
  %16 = udiv i32 %linear_index3, 4096
  %17 = icmp ult i32 %linear_index_plus_base, 16777216
  br i1 %17, label %convert.5.in_bounds-true, label %convert.5.in_bounds-after

convert.5.in_bounds-after:                        ; preds = %convert.5.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !6

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

convert.5.in_bounds-true:                         ; preds = %loop.loop_body
  %18 = bitcast [4096 x [4096 x float]]* %arg0.1.typed to float*
  %arg0.1 = getelementptr inbounds float, float* %18, i32 %linear_index_plus_base
  %arg0.14 = load float, float* %arg0.1, !invariant.load !8, !noalias !9
  %19 = bitcast float %arg0.14 to i32
  %20 = and i32 %19, 65536
  %21 = lshr i32 %20, 16
  %22 = add i32 %21, 32767
  %23 = add i32 %19, %22
  %24 = and i32 %23, -65536
  %25 = bitcast i32 %24 to float
  %26 = fcmp uno float %arg0.14, %arg0.14
  %27 = select i1 %26, float %arg0.14, float %25
  %28 = bitcast float %27 to i32
  %29 = lshr i32 %28, 16
  %30 = trunc i32 %29 to i16
  %31 = bitcast [4096 x [4096 x i16]]* %convert.5.typed to i16*
  %32 = getelementptr inbounds i16, i16* %31, i32 %linear_index_plus_base
  store i16 %30, i16* %32, !alias.scope !9, !noalias !12
  %33 = bitcast [4096 x [4096 x float]]* %arg0.1.typed to float*
  %arg0.15 = getelementptr inbounds float, float* %33, i32 %linear_index1
  %arg0.16 = load float, float* %arg0.15, !invariant.load !8, !noalias !9
  %34 = bitcast float %arg0.16 to i32
  %35 = and i32 %34, 65536
  %36 = lshr i32 %35, 16
  %37 = add i32 %36, 32767
  %38 = add i32 %34, %37
  %39 = and i32 %38, -65536
  %40 = bitcast i32 %39 to float
  %41 = fcmp uno float %arg0.16, %arg0.16
  %42 = select i1 %41, float %arg0.16, float %40
  %43 = bitcast float %42 to i32
  %44 = lshr i32 %43, 16
  %45 = trunc i32 %44 to i16
  %46 = bitcast [4096 x [4096 x i16]]* %convert.5.typed to i16*
  %47 = getelementptr inbounds i16, i16* %46, i32 %linear_index1
  store i16 %45, i16* %47, !alias.scope !9, !noalias !12
  %48 = bitcast [4096 x [4096 x float]]* %arg0.1.typed to float*
  %arg0.17 = getelementptr inbounds float, float* %48, i32 %linear_index2
  %arg0.18 = load float, float* %arg0.17, !invariant.load !8, !noalias !9
  %49 = bitcast float %arg0.18 to i32
  %50 = and i32 %49, 65536
  %51 = lshr i32 %50, 16
  %52 = add i32 %51, 32767
  %53 = add i32 %49, %52
  %54 = and i32 %53, -65536
  %55 = bitcast i32 %54 to float
  %56 = fcmp uno float %arg0.18, %arg0.18
  %57 = select i1 %56, float %arg0.18, float %55
  %58 = bitcast float %57 to i32
  %59 = lshr i32 %58, 16
  %60 = trunc i32 %59 to i16
  %61 = bitcast [4096 x [4096 x i16]]* %convert.5.typed to i16*
  %62 = getelementptr inbounds i16, i16* %61, i32 %linear_index2
  store i16 %60, i16* %62, !alias.scope !9, !noalias !12
  %63 = bitcast [4096 x [4096 x float]]* %arg0.1.typed to float*
  %arg0.19 = getelementptr inbounds float, float* %63, i32 %linear_index3
  %arg0.110 = load float, float* %arg0.19, !invariant.load !8, !noalias !9
  %64 = bitcast float %arg0.110 to i32
  %65 = and i32 %64, 65536
  %66 = lshr i32 %65, 16
  %67 = add i32 %66, 32767
  %68 = add i32 %64, %67
  %69 = and i32 %68, -65536
  %70 = bitcast i32 %69 to float
  %71 = fcmp uno float %arg0.110, %arg0.110
  %72 = select i1 %71, float %arg0.110, float %70
  %73 = bitcast float %72 to i32
  %74 = lshr i32 %73, 16
  %75 = trunc i32 %74 to i16
  %76 = bitcast [4096 x [4096 x i16]]* %convert.5.typed to i16*
  %77 = getelementptr inbounds i16, i16* %76, i32 %linear_index3
  store i16 %75, i16* %77, !alias.scope !9, !noalias !12
  br label %convert.5.in_bounds-after
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #1

define void @cluster_1_convert_6(i8* align 16 dereferenceable(67108864) %alloc1, i8* align 64 dereferenceable(67108864) %temp_buf) {
entry:
  %loop.invar_address = alloca i32
  %convert.6.raw = getelementptr inbounds i8, i8* %temp_buf, i64 33554432
  %convert.6.typed = bitcast i8* %convert.6.raw to [4096 x [4096 x i16]]*
  %arg1.2.raw = getelementptr inbounds i8, i8* %alloc1, i64 0
  %arg1.2.typed = bitcast i8* %arg1.2.raw to [4096 x [4096 x float]]*
  store i32 0, i32* %loop.invar_address
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %convert.6.in_bounds-after, %entry
  %loop.indvar = load i32, i32* %loop.invar_address
  %0 = icmp uge i32 %loop.indvar, 16777216
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 221184
  store i32 %invar.inc, i32* %loop.invar_address
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %4 = mul nuw nsw i32 %2, 128
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 55296
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %5 = udiv i32 %linear_index_plus_base, 1
  %6 = urem i32 %5, 4096
  %7 = udiv i32 %linear_index_plus_base, 4096
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 4096
  %10 = udiv i32 %linear_index1, 4096
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %11 = udiv i32 %linear_index2, 1
  %12 = urem i32 %11, 4096
  %13 = udiv i32 %linear_index2, 4096
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = urem i32 %14, 4096
  %16 = udiv i32 %linear_index3, 4096
  %17 = icmp ult i32 %linear_index_plus_base, 16777216
  br i1 %17, label %convert.6.in_bounds-true, label %convert.6.in_bounds-after

convert.6.in_bounds-after:                        ; preds = %convert.6.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !15

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

convert.6.in_bounds-true:                         ; preds = %loop.loop_body
  %18 = bitcast [4096 x [4096 x float]]* %arg1.2.typed to float*
  %arg1.2 = getelementptr inbounds float, float* %18, i32 %linear_index_plus_base
  %arg1.24 = load float, float* %arg1.2, !invariant.load !8, !noalias !16
  %19 = bitcast float %arg1.24 to i32
  %20 = and i32 %19, 65536
  %21 = lshr i32 %20, 16
  %22 = add i32 %21, 32767
  %23 = add i32 %19, %22
  %24 = and i32 %23, -65536
  %25 = bitcast i32 %24 to float
  %26 = fcmp uno float %arg1.24, %arg1.24
  %27 = select i1 %26, float %arg1.24, float %25
  %28 = bitcast float %27 to i32
  %29 = lshr i32 %28, 16
  %30 = trunc i32 %29 to i16
  %31 = bitcast [4096 x [4096 x i16]]* %convert.6.typed to i16*
  %32 = getelementptr inbounds i16, i16* %31, i32 %linear_index_plus_base
  store i16 %30, i16* %32, !alias.scope !16, !noalias !17
  %33 = bitcast [4096 x [4096 x float]]* %arg1.2.typed to float*
  %arg1.25 = getelementptr inbounds float, float* %33, i32 %linear_index1
  %arg1.26 = load float, float* %arg1.25, !invariant.load !8, !noalias !16
  %34 = bitcast float %arg1.26 to i32
  %35 = and i32 %34, 65536
  %36 = lshr i32 %35, 16
  %37 = add i32 %36, 32767
  %38 = add i32 %34, %37
  %39 = and i32 %38, -65536
  %40 = bitcast i32 %39 to float
  %41 = fcmp uno float %arg1.26, %arg1.26
  %42 = select i1 %41, float %arg1.26, float %40
  %43 = bitcast float %42 to i32
  %44 = lshr i32 %43, 16
  %45 = trunc i32 %44 to i16
  %46 = bitcast [4096 x [4096 x i16]]* %convert.6.typed to i16*
  %47 = getelementptr inbounds i16, i16* %46, i32 %linear_index1
  store i16 %45, i16* %47, !alias.scope !16, !noalias !17
  %48 = bitcast [4096 x [4096 x float]]* %arg1.2.typed to float*
  %arg1.27 = getelementptr inbounds float, float* %48, i32 %linear_index2
  %arg1.28 = load float, float* %arg1.27, !invariant.load !8, !noalias !16
  %49 = bitcast float %arg1.28 to i32
  %50 = and i32 %49, 65536
  %51 = lshr i32 %50, 16
  %52 = add i32 %51, 32767
  %53 = add i32 %49, %52
  %54 = and i32 %53, -65536
  %55 = bitcast i32 %54 to float
  %56 = fcmp uno float %arg1.28, %arg1.28
  %57 = select i1 %56, float %arg1.28, float %55
  %58 = bitcast float %57 to i32
  %59 = lshr i32 %58, 16
  %60 = trunc i32 %59 to i16
  %61 = bitcast [4096 x [4096 x i16]]* %convert.6.typed to i16*
  %62 = getelementptr inbounds i16, i16* %61, i32 %linear_index2
  store i16 %60, i16* %62, !alias.scope !16, !noalias !17
  %63 = bitcast [4096 x [4096 x float]]* %arg1.2.typed to float*
  %arg1.29 = getelementptr inbounds float, float* %63, i32 %linear_index3
  %arg1.210 = load float, float* %arg1.29, !invariant.load !8, !noalias !16
  %64 = bitcast float %arg1.210 to i32
  %65 = and i32 %64, 65536
  %66 = lshr i32 %65, 16
  %67 = add i32 %66, 32767
  %68 = add i32 %64, %67
  %69 = and i32 %68, -65536
  %70 = bitcast i32 %69 to float
  %71 = fcmp uno float %arg1.210, %arg1.210
  %72 = select i1 %71, float %arg1.210, float %70
  %73 = bitcast float %72 to i32
  %74 = lshr i32 %73, 16
  %75 = trunc i32 %74 to i16
  %76 = bitcast [4096 x [4096 x i16]]* %convert.6.typed to i16*
  %77 = getelementptr inbounds i16, i16* %76, i32 %linear_index3
  store i16 %75, i16* %77, !alias.scope !16, !noalias !17
  br label %convert.6.in_bounds-after
}

attributes #0 = { nounwind readnone }
attributes #1 = { nounwind willreturn }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{void (i8*, i8*)* @cluster_1_convert_5, !"kernel", i32 1}
!1 = !{void (i8*, i8*)* @cluster_1_convert_5, !"reqntidx", i32 128}
!2 = !{void (i8*, i8*)* @cluster_1_convert_6, !"kernel", i32 1}
!3 = !{void (i8*, i8*)* @cluster_1_convert_6, !"reqntidx", i32 128}
!4 = !{i32 0, i32 432}
!5 = !{i32 0, i32 128}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.vectorize.enable", i1 false}
!8 = !{}
!9 = !{!10}
!10 = !{!"buffer: {index:3, offset:0, size:33554432}", !11}
!11 = !{!"XLA global AA domain"}
!12 = !{!13, !14}
!13 = !{!"buffer: {index:2, offset:0, size:33554432}", !11}
!14 = !{!"buffer: {index:3, offset:33554432, size:33554432}", !11}
!15 = distinct !{!15, !7}
!16 = !{!14}
!17 = !{!13, !10}
