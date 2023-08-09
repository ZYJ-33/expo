; ModuleID = './test-cuda-nvptx64-nvidia-cuda-sm_86.bc'
source_filename = "./test.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@_ZZ4fun1vE5share = internal addrspace(3) global [100 x float] undef, align 4
@_ZZ4fun2vE5share = internal addrspace(3) global [100 x float] undef, align 4

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z4fun1v() #0 {
entry:
  store float 0.000000e+00, ptr addrspacecast (ptr addrspace(3) @_ZZ4fun1vE5share to ptr), align 4
  store float 1.000000e+00, ptr getelementptr inbounds ([100 x float], ptr addrspacecast (ptr addrspace(3) @_ZZ4fun1vE5share to ptr), i64 0, i64 1), align 4
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local void @_Z4fun2v() #0 {
entry:
  store float 0.000000e+00, ptr addrspacecast (ptr addrspace(3) @_ZZ4fun2vE5share to ptr), align 4
  store float 1.000000e+00, ptr getelementptr inbounds ([100 x float], ptr addrspacecast (ptr addrspace(3) @_ZZ4fun2vE5share to ptr), i64 0, i64 1), align 4
  ret void
}

attributes #0 = { convergent mustprogress noinline norecurse nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_86" "target-features"="+ptx74,+sm_86" }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4, !5}
!llvm.ident = !{!6, !7}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr @_Z4fun1v, !"kernel", i32 1}
!5 = !{ptr @_Z4fun2v, !"kernel", i32 1}
!6 = !{!"clang version 17.0.0"}
!7 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
