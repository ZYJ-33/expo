; ModuleID = './test-cuda-nvptx64-nvidia-cuda-sm_86.bc'
source_filename = "./test.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_threadIdx_t = type { i8 }

@_ZZ6axpy_1fPfS_E5share = internal addrspace(3) global [100 x float] undef, align 4
@threadIdx = extern_weak dso_local addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@_ZZ4axpyfPfS_E5share = internal addrspace(3) global [100 x float] undef, align 4

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z6axpy_1fPfS_(float noundef %a, ptr noundef %x, ptr noundef %y) #0 {
entry:
  %a.addr = alloca float, align 4
  %x.addr = alloca ptr, align 8
  %y.addr = alloca ptr, align 8
  %id_x = alloca i32, align 4
  store float %a, ptr %a.addr, align 4
  store ptr %x, ptr %x.addr, align 8
  store ptr %y, ptr %y.addr, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  store i32 %0, ptr %id_x, align 4
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z4axpyfPfS_(float noundef %a, ptr noundef %x, ptr noundef %y) #0 {
entry:
  %a.addr = alloca float, align 4
  %x.addr = alloca ptr, align 8
  %y.addr = alloca ptr, align 8
  %id_x = alloca i32, align 4
  store float %a, ptr %a.addr, align 4
  store ptr %x, ptr %x.addr, align 8
  store ptr %y, ptr %y.addr, align 8
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  store i32 %0, ptr %id_x, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { convergent mustprogress noinline norecurse nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_86" "target-features"="+ptx74,+sm_86" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4, !5}
!llvm.ident = !{!6, !7}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr @_Z6axpy_1fPfS_, !"kernel", i32 1}
!5 = !{ptr @_Z4axpyfPfS_, !"kernel", i32 1}
!6 = !{!"clang version 17.0.0"}
!7 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
