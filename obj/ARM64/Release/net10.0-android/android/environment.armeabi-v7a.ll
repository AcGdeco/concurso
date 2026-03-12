; ModuleID = 'environment.armeabi-v7a.ll'
source_filename = "environment.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.ApplicationConfig = type {
	i1, ; bool uses_mono_llvm
	i1, ; bool uses_mono_aot
	i1, ; bool aot_lazy_load
	i1, ; bool uses_assembly_preload
	i1, ; bool broken_exception_transitions
	i1, ; bool jni_add_native_method_registration_attribute_present
	i1, ; bool have_runtime_config_blob
	i1, ; bool have_assemblies_blob
	i1, ; bool marshal_methods_enabled
	i1, ; bool ignore_split_configs
	i8, ; uint8_t bound_stream_io_exception_type
	i32, ; uint32_t package_naming_policy
	i32, ; uint32_t environment_variable_count
	i32, ; uint32_t system_property_count
	i32, ; uint32_t number_of_assemblies_in_apk
	i32, ; uint32_t bundled_assembly_name_width
	i32, ; uint32_t number_of_dso_cache_entries
	i32, ; uint32_t number_of_aot_cache_entries
	i32, ; uint32_t number_of_shared_libraries
	i32, ; uint32_t android_runtime_jnienv_class_token
	i32, ; uint32_t jnienv_initialize_method_token
	i32, ; uint32_t jnienv_registerjninatives_method_token
	i32, ; uint32_t jni_remapping_replacement_type_count
	i32, ; uint32_t jni_remapping_replacement_method_index_entry_count
	i32, ; uint32_t mono_components_mask
	ptr, ; char* android_package_name
	i1 ; bool managed_marshal_methods_lookup_enabled
}

%struct.AssemblyStoreAssemblyDescriptor = type {
	i32, ; uint32_t data_offset
	i32, ; uint32_t data_size
	i32, ; uint32_t debug_data_offset
	i32, ; uint32_t debug_data_size
	i32, ; uint32_t config_data_offset
	i32 ; uint32_t config_data_size
}

%struct.AssemblyStoreRuntimeData = type {
	ptr, ; uint8_t data_start
	i32, ; uint32_t assembly_count
	i32, ; uint32_t index_entry_count
	ptr ; AssemblyStoreAssemblyDescriptor assemblies
}

%struct.AssemblyStoreSingleAssemblyRuntimeData = type {
	ptr, ; uint8_t image_data
	ptr, ; uint8_t debug_info_data
	ptr, ; uint8_t config_data
	ptr ; AssemblyStoreAssemblyDescriptor descriptor
}

%struct.DSOApkEntry = type {
	i64, ; uint64_t name_hash
	i32, ; uint32_t offset
	i32 ; int32_t fd
}

%struct.DSOCacheEntry = type {
	i64, ; uint64_t hash
	i64, ; uint64_t real_name_hash
	i1, ; bool ignore
	i1, ; bool is_jni_library
	ptr, ; char* name
	ptr ; void* handle
}

%struct.XamarinAndroidBundledAssembly = type {
	i32, ; int32_t file_fd
	ptr, ; char* file_name
	i32, ; uint32_t data_offset
	i32, ; uint32_t data_size
	ptr, ; uint8_t data
	i32, ; uint32_t name_length
	ptr ; char* name
}

; 0x25e6972616d58
@format_tag = dso_local local_unnamed_addr constant i64 666756936985944, align 8

@mono_aot_mode_name = dso_local local_unnamed_addr constant ptr @.env.0, align 4

; Application environment variables array, name:value
@app_environment_variables = dso_local local_unnamed_addr constant [4 x ptr] [
	ptr @.env.var.0, ; 0 ('MONO_GC_PARAMS')
	ptr @.env.var.1, ; 1 ('major=marksweep-conc')
	ptr @.env.var.2, ; 2 ('XA_HTTP_CLIENT_HANDLER_TYPE')
	ptr @.env.var.3 ; 3 ('Xamarin.Android.Net.AndroidMessageHandler')
], align 4

; System properties defined by the application
@app_system_properties = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@application_config = dso_local local_unnamed_addr constant %struct.ApplicationConfig {
	i1 false, ; bool uses_mono_llvm
	i1 true, ; bool uses_mono_aot
	i1 true, ; bool aot_lazy_load
	i1 false, ; bool uses_assembly_preload
	i1 false, ; bool broken_exception_transitions
	i1 false, ; bool jni_add_native_method_registration_attribute_present
	i1 true, ; bool have_runtime_config_blob
	i1 true, ; bool have_assemblies_blob
	i1 true, ; bool marshal_methods_enabled
	i1 false, ; bool ignore_split_configs
	i8 0, ; uint8_t bound_stream_io_exception_type
	i32 3, ; uint32_t package_naming_policy
	i32 4, ; uint32_t environment_variable_count
	i32 0, ; uint32_t system_property_count
	i32 122, ; uint32_t number_of_assemblies_in_apk
	i32 0, ; uint32_t bundled_assembly_name_width
	i32 28, ; uint32_t number_of_dso_cache_entries
	i32 792, ; uint32_t number_of_aot_cache_entries
	i32 95, ; uint32_t number_of_shared_libraries
	i32 u0x020002cf, ; uint32_t android_runtime_jnienv_class_token
	i32 u0x06001c96, ; uint32_t jnienv_initialize_method_token
	i32 u0x06001c95, ; uint32_t jnienv_registerjninatives_method_token
	i32 0, ; uint32_t jni_remapping_replacement_type_count
	i32 0, ; uint32_t jni_remapping_replacement_method_index_entry_count
	i32 u0x00000000, ; uint32_t mono_components_mask
	ptr @.ApplicationConfig.0_android_package_name, ; char* android_package_name
	i1 false; bool managed_marshal_methods_lookup_enabled
}, align 4

; DSO cache entries
@dso_cache = dso_local local_unnamed_addr global [28 x %struct.DSOCacheEntry] [
	%struct.DSOCacheEntry {
		i64 u0x00000000093625cd, ; from name: libSystem.Security.Cryptography.Native.Android
		i64 u0x000000007d3da8be, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.3_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle
	}, ; 0
	%struct.DSOCacheEntry {
		i64 u0x000000000daac0a4, ; from name: monodroid.so
		i64 u0x00000000cbfba5ef, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.6_name, ; name: libmonodroid.so
		ptr null; void* handle
	}, ; 1
	%struct.DSOCacheEntry {
		i64 u0x00000000129d396d, ; from name: System.Globalization.Native
		i64 u0x000000001acdcfe7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.0_name, ; name: libSystem.Globalization.Native.so
		ptr null; void* handle
	}, ; 2
	%struct.DSOCacheEntry {
		i64 u0x00000000175bc058, ; from name: mono-component-marshal-ilgen.so
		i64 u0x000000007be514c4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle
	}, ; 3
	%struct.DSOCacheEntry {
		i64 u0x000000001acdcfe7, ; from name: libSystem.Globalization.Native.so
		i64 u0x000000001acdcfe7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.0_name, ; name: libSystem.Globalization.Native.so
		ptr null; void* handle
	}, ; 4
	%struct.DSOCacheEntry {
		i64 u0x000000001dd6b3a3, ; from name: System.Native.so
		i64 u0x0000000079d6a0ba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Native.so
		ptr null; void* handle
	}, ; 5
	%struct.DSOCacheEntry {
		i64 u0x000000002c9b28d2, ; from name: monodroid
		i64 u0x00000000cbfba5ef, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.6_name, ; name: libmonodroid.so
		ptr null; void* handle
	}, ; 6
	%struct.DSOCacheEntry {
		i64 u0x0000000033e41c10, ; from name: System.Security.Cryptography.Native.Android.so
		i64 u0x000000007d3da8be, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.3_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle
	}, ; 7
	%struct.DSOCacheEntry {
		i64 u0x000000005360f89d, ; from name: System.Security.Cryptography.Native.Android
		i64 u0x000000007d3da8be, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.3_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle
	}, ; 8
	%struct.DSOCacheEntry {
		i64 u0x000000005825b448, ; from name: libmono-component-marshal-ilgen
		i64 u0x000000007be514c4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle
	}, ; 9
	%struct.DSOCacheEntry {
		i64 u0x000000005b9ade60, ; from name: libSystem.Native
		i64 u0x0000000079d6a0ba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Native.so
		ptr null; void* handle
	}, ; 10
	%struct.DSOCacheEntry {
		i64 u0x0000000074cebc58, ; from name: System.IO.Compression.Native
		i64 u0x00000000af29a07d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle
	}, ; 11
	%struct.DSOCacheEntry {
		i64 u0x0000000079d6a0ba, ; from name: libSystem.Native.so
		i64 u0x0000000079d6a0ba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Native.so
		ptr null; void* handle
	}, ; 12
	%struct.DSOCacheEntry {
		i64 u0x000000007b8c1361, ; from name: System.IO.Compression.Native.so
		i64 u0x00000000af29a07d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle
	}, ; 13
	%struct.DSOCacheEntry {
		i64 u0x000000007be514c4, ; from name: libmono-component-marshal-ilgen.so
		i64 u0x000000007be514c4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle
	}, ; 14
	%struct.DSOCacheEntry {
		i64 u0x000000007d3da8be, ; from name: libSystem.Security.Cryptography.Native.Android.so
		i64 u0x000000007d3da8be, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.3_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle
	}, ; 15
	%struct.DSOCacheEntry {
		i64 u0x0000000094c7a87b, ; from name: libmonosgen-2.0
		i64 u0x00000000e391d1b5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.5_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle
	}, ; 16
	%struct.DSOCacheEntry {
		i64 u0x0000000099abd194, ; from name: System.Native
		i64 u0x0000000079d6a0ba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Native.so
		ptr null; void* handle
	}, ; 17
	%struct.DSOCacheEntry {
		i64 u0x000000009e770032, ; from name: monosgen-2.0.so
		i64 u0x00000000e391d1b5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.5_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle
	}, ; 18
	%struct.DSOCacheEntry {
		i64 u0x00000000a66f1e5a, ; from name: libSystem.Globalization.Native
		i64 u0x000000001acdcfe7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.0_name, ; name: libSystem.Globalization.Native.so
		ptr null; void* handle
	}, ; 19
	%struct.DSOCacheEntry {
		i64 u0x00000000af29a07d, ; from name: libSystem.IO.Compression.Native.so
		i64 u0x00000000af29a07d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle
	}, ; 20
	%struct.DSOCacheEntry {
		i64 u0x00000000afe3142c, ; from name: libSystem.IO.Compression.Native
		i64 u0x00000000af29a07d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle
	}, ; 21
	%struct.DSOCacheEntry {
		i64 u0x00000000cbfba5ef, ; from name: libmonodroid.so
		i64 u0x00000000cbfba5ef, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.6_name, ; name: libmonodroid.so
		ptr null; void* handle
	}, ; 22
	%struct.DSOCacheEntry {
		i64 u0x00000000d8bef4d7, ; from name: libmonodroid
		i64 u0x00000000cbfba5ef, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.6_name, ; name: libmonodroid.so
		ptr null; void* handle
	}, ; 23
	%struct.DSOCacheEntry {
		i64 u0x00000000e1ed3ce0, ; from name: monosgen-2.0
		i64 u0x00000000e391d1b5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.5_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle
	}, ; 24
	%struct.DSOCacheEntry {
		i64 u0x00000000e391d1b5, ; from name: libmonosgen-2.0.so
		i64 u0x00000000e391d1b5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.5_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle
	}, ; 25
	%struct.DSOCacheEntry {
		i64 u0x00000000f39dc351, ; from name: mono-component-marshal-ilgen
		i64 u0x000000007be514c4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle
	}, ; 26
	%struct.DSOCacheEntry {
		i64 u0x00000000f4494c74, ; from name: System.Globalization.Native.so
		i64 u0x000000001acdcfe7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.0_name, ; name: libSystem.Globalization.Native.so
		ptr null; void* handle
	} ; 27
], align 8

@dso_jni_preloads_idx_stride = dso_local local_unnamed_addr constant i32 4, align 4

@dso_jni_preloads_idx_count = dso_local local_unnamed_addr constant i64 4, align 8

; Indices into dso_cache[] of DSO libraries to preload because of JNI use
@dso_jni_preloads_idx = dso_local local_unnamed_addr constant [4 x i32] [
	i32 15, ; libSystem.Security.Cryptography.Native.Android.so
	i32 0, ; libSystem.Security.Cryptography.Native.Android
	i32 7, ; System.Security.Cryptography.Native.Android.so
	i32 8 ; System.Security.Cryptography.Native.Android
], align 4

; AOT DSO cache entries
@aot_dso_cache = dso_local local_unnamed_addr global [792 x %struct.DSOCacheEntry] [
	%struct.DSOCacheEntry {
		i64 u0x0000000000db9d9c, ; from name: aot-Xamarin.KotlinX.Serialization.Core.Jvm
		i64 u0x00000000f1077784, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Xamarin.KotlinX.Serialization.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 0
	%struct.DSOCacheEntry {
		i64 u0x000000000138a661, ; from name: aot-System.Collections.NonGeneric.dll.so
		i64 u0x0000000045a298d3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 1
	%struct.DSOCacheEntry {
		i64 u0x0000000001c0fad7, ; from name: libaot-Mono.Android.Runtime
		i64 u0x000000009f9275a1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.92_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 2
	%struct.DSOCacheEntry {
		i64 u0x000000000230b688, ; from name: aot-Xamarin.KotlinX.Coroutines.Core.Jvm
		i64 u0x00000000a4839a3e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 3
	%struct.DSOCacheEntry {
		i64 u0x00000000028aa24d, ; from name: System.Threading.Thread
		i64 u0x00000000dce000c2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle
	}, ; 4
	%struct.DSOCacheEntry {
		i64 u0x00000000035fb734, ; from name: libaot-System.Numerics.Vectors
		i64 u0x0000000095f63711, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle
	}, ; 5
	%struct.DSOCacheEntry {
		i64 u0x0000000003b7ead2, ; from name: libaot-Xamarin.AndroidX.Core.dll.so
		i64 u0x0000000003b7ead2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 6
	%struct.DSOCacheEntry {
		i64 u0x000000000418b010, ; from name: libaot-Xamarin.AndroidX.SavedState.SavedState.Android.dll.so
		i64 u0x000000000418b010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Xamarin.AndroidX.SavedState.SavedState.Android.dll.so
		ptr null; void* handle
	}, ; 7
	%struct.DSOCacheEntry {
		i64 u0x00000000042feb28, ; from name: Microsoft.Extensions.DependencyInjection.Abstractions.so
		i64 u0x00000000b0dedb6b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		ptr null; void* handle
	}, ; 8
	%struct.DSOCacheEntry {
		i64 u0x00000000046b9974, ; from name: libaot-Xamarin.AndroidX.SavedState.SavedState.Android.so
		i64 u0x000000000418b010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Xamarin.AndroidX.SavedState.SavedState.Android.dll.so
		ptr null; void* handle
	}, ; 9
	%struct.DSOCacheEntry {
		i64 u0x000000000547dad8, ; from name: Xamarin.AndroidX.CustomView.so
		i64 u0x0000000080dfe53f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.CustomView.dll.so
		ptr null; void* handle
	}, ; 10
	%struct.DSOCacheEntry {
		i64 u0x0000000005dc54b4, ; from name: Microsoft.Extensions.Diagnostics.Abstractions
		i64 u0x00000000537d157f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Microsoft.Extensions.Diagnostics.Abstractions.dll.so
		ptr null; void* handle
	}, ; 11
	%struct.DSOCacheEntry {
		i64 u0x0000000006bd3d61, ; from name: aot-Xamarin.AndroidX.SavedState.SavedState.Android
		i64 u0x000000000418b010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Xamarin.AndroidX.SavedState.SavedState.Android.dll.so
		ptr null; void* handle
	}, ; 12
	%struct.DSOCacheEntry {
		i64 u0x0000000006c83ac1, ; from name: libaot-Microsoft.Maui.Controls.so
		i64 u0x000000003cd51dd1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Microsoft.Maui.Controls.dll.so
		ptr null; void* handle
	}, ; 13
	%struct.DSOCacheEntry {
		i64 u0x0000000006f248d1, ; from name: aot-Microsoft.Extensions.Logging.dll.so
		i64 u0x000000009faac168, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Microsoft.Extensions.Logging.dll.so
		ptr null; void* handle
	}, ; 14
	%struct.DSOCacheEntry {
		i64 u0x0000000006ffddbc, ; from name: System.Runtime.InteropServices
		i64 u0x000000008bbc0be1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 15
	%struct.DSOCacheEntry {
		i64 u0x00000000070078ea, ; from name: Xamarin.AndroidX.Fragment.so
		i64 u0x00000000a7e7a8bf, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 16
	%struct.DSOCacheEntry {
		i64 u0x00000000078ea0f8, ; from name: libaot-Xamarin.AndroidX.Navigation.Common.Android.dll.so
		i64 u0x00000000078ea0f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Xamarin.AndroidX.Navigation.Common.Android.dll.so
		ptr null; void* handle
	}, ; 17
	%struct.DSOCacheEntry {
		i64 u0x0000000007e991a0, ; from name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core
		i64 u0x00000000ee0cc1b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 18
	%struct.DSOCacheEntry {
		i64 u0x0000000008bcd91c, ; from name: aot-Microsoft.Extensions.Primitives.so
		i64 u0x0000000045840300, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Microsoft.Extensions.Primitives.dll.so
		ptr null; void* handle
	}, ; 19
	%struct.DSOCacheEntry {
		i64 u0x0000000009144460, ; from name: System.Collections.so
		i64 u0x00000000d3d7eec4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 20
	%struct.DSOCacheEntry {
		i64 u0x00000000092705b7, ; from name: aot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		i64 u0x00000000ee0cc1b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 21
	%struct.DSOCacheEntry {
		i64 u0x00000000099475d6, ; from name: libaot-Xamarin.AndroidX.Activity
		i64 u0x00000000915782e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 22
	%struct.DSOCacheEntry {
		i64 u0x000000000a0c1ba0, ; from name: System.Collections.Specialized.so
		i64 u0x00000000a8bf5d10, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 23
	%struct.DSOCacheEntry {
		i64 u0x000000000b4ad6ae, ; from name: aot-Xamarin.AndroidX.Lifecycle.ViewModel.Android
		i64 u0x000000009abadfdb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so
		ptr null; void* handle
	}, ; 24
	%struct.DSOCacheEntry {
		i64 u0x000000000b580fcb, ; from name: libaot-Java.Interop.so
		i64 u0x000000007e561493, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.91_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 25
	%struct.DSOCacheEntry {
		i64 u0x000000000ba20012, ; from name: libaot-Xamarin.AndroidX.CustomView
		i64 u0x0000000080dfe53f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.CustomView.dll.so
		ptr null; void* handle
	}, ; 26
	%struct.DSOCacheEntry {
		i64 u0x000000000bedf80f, ; from name: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so
		i64 u0x000000009abadfdb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so
		ptr null; void* handle
	}, ; 27
	%struct.DSOCacheEntry {
		i64 u0x000000000c38ff48, ; from name: System.ComponentModel
		i64 u0x000000005334092f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 28
	%struct.DSOCacheEntry {
		i64 u0x000000000c4866a5, ; from name: aot-System.Net.Requests
		i64 u0x000000004506f4eb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle
	}, ; 29
	%struct.DSOCacheEntry {
		i64 u0x000000000c53063e, ; from name: Xamarin.AndroidX.AppCompat.AppCompatResources.so
		i64 u0x0000000032abb588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		ptr null; void* handle
	}, ; 30
	%struct.DSOCacheEntry {
		i64 u0x000000000c7d3b7e, ; from name: libaot-Xamarin.AndroidX.Navigation.Common.Android
		i64 u0x00000000078ea0f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Xamarin.AndroidX.Navigation.Common.Android.dll.so
		ptr null; void* handle
	}, ; 31
	%struct.DSOCacheEntry {
		i64 u0x000000000d7a772a, ; from name: Xamarin.AndroidX.Lifecycle.ViewModel.Android.so
		i64 u0x000000009abadfdb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so
		ptr null; void* handle
	}, ; 32
	%struct.DSOCacheEntry {
		i64 u0x000000000dd2b6db, ; from name: libaot-System.Collections.Concurrent
		i64 u0x00000000681f5cdc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 33
	%struct.DSOCacheEntry {
		i64 u0x000000000e003282, ; from name: libaot-Xamarin.Kotlin.StdLib.dll.so
		i64 u0x000000000e003282, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 34
	%struct.DSOCacheEntry {
		i64 u0x000000000e65cd01, ; from name: libaot-System.Runtime.Loader.dll.so
		i64 u0x000000000e65cd01, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.Runtime.Loader.dll.so
		ptr null; void* handle
	}, ; 35
	%struct.DSOCacheEntry {
		i64 u0x000000000e836be3, ; from name: aot-System.Net.Http.so
		i64 u0x000000003b9fa69c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle
	}, ; 36
	%struct.DSOCacheEntry {
		i64 u0x000000000eb7b864, ; from name: libaot-System.Text.RegularExpressions.dll.so
		i64 u0x000000000eb7b864, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 37
	%struct.DSOCacheEntry {
		i64 u0x000000000f2eb11e, ; from name: libaot-Microsoft.Extensions.DependencyInjection
		i64 u0x0000000042d22978, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.dll.so
		ptr null; void* handle
	}, ; 38
	%struct.DSOCacheEntry {
		i64 u0x000000000f5f5846, ; from name: libaot-Xamarin.AndroidX.CoordinatorLayout
		i64 u0x00000000336302e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		ptr null; void* handle
	}, ; 39
	%struct.DSOCacheEntry {
		i64 u0x000000000f644acd, ; from name: Xamarin.Kotlin.StdLib.dll.so
		i64 u0x000000000e003282, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 40
	%struct.DSOCacheEntry {
		i64 u0x000000000f887e97, ; from name: System.IO.Pipelines.dll.so
		i64 u0x000000002c56a78d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.IO.Pipelines.dll.so
		ptr null; void* handle
	}, ; 41
	%struct.DSOCacheEntry {
		i64 u0x00000000101a2a05, ; from name: System.Xml.ReaderWriter.dll.so
		i64 u0x00000000716accae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle
	}, ; 42
	%struct.DSOCacheEntry {
		i64 u0x000000001063cb23, ; from name: libaot-System.Linq.so
		i64 u0x000000003812966e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 43
	%struct.DSOCacheEntry {
		i64 u0x0000000010db3025, ; from name: System.Text.Json.dll.so
		i64 u0x00000000a170e652, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle
	}, ; 44
	%struct.DSOCacheEntry {
		i64 u0x0000000011537ac4, ; from name: libaot-Xamarin.AndroidX.CustomView.so
		i64 u0x0000000080dfe53f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.CustomView.dll.so
		ptr null; void* handle
	}, ; 45
	%struct.DSOCacheEntry {
		i64 u0x00000000115da0b5, ; from name: aot-System.Xml.ReaderWriter
		i64 u0x00000000716accae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle
	}, ; 46
	%struct.DSOCacheEntry {
		i64 u0x00000000116fa401, ; from name: libaot-Mono.Android.dll.so
		i64 u0x00000000116fa401, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.93_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 47
	%struct.DSOCacheEntry {
		i64 u0x0000000011e370ce, ; from name: aot-Xamarin.AndroidX.Lifecycle.Common.Jvm
		i64 u0x000000004cae6f51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so
		ptr null; void* handle
	}, ; 48
	%struct.DSOCacheEntry {
		i64 u0x000000001297d043, ; from name: System.Threading.so
		i64 u0x00000000f97d7588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 49
	%struct.DSOCacheEntry {
		i64 u0x0000000012cb9bd6, ; from name: aot-System.Text.Json
		i64 u0x00000000a170e652, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle
	}, ; 50
	%struct.DSOCacheEntry {
		i64 u0x0000000013221fbc, ; from name: libaot-System.ComponentModel.Primitives.dll.so
		i64 u0x0000000013221fbc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 51
	%struct.DSOCacheEntry {
		i64 u0x0000000013568aaf, ; from name: System.Runtime.so
		i64 u0x0000000087de61a5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 52
	%struct.DSOCacheEntry {
		i64 u0x0000000013d7af89, ; from name: aot-System.Threading.Thread.so
		i64 u0x00000000dce000c2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle
	}, ; 53
	%struct.DSOCacheEntry {
		i64 u0x0000000013eb1120, ; from name: aot-System.ComponentModel.Primitives
		i64 u0x0000000013221fbc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 54
	%struct.DSOCacheEntry {
		i64 u0x00000000141cb47a, ; from name: libaot-Xamarin.AndroidX.Navigation.UI.dll.so
		i64 u0x00000000141cb47a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Xamarin.AndroidX.Navigation.UI.dll.so
		ptr null; void* handle
	}, ; 55
	%struct.DSOCacheEntry {
		i64 u0x00000000141fc473, ; from name: aot-Xamarin.AndroidX.Collection.Jvm.so
		i64 u0x0000000057c93dd4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-Xamarin.AndroidX.Collection.Jvm.dll.so
		ptr null; void* handle
	}, ; 56
	%struct.DSOCacheEntry {
		i64 u0x000000001454800e, ; from name: libaot-Microsoft.Extensions.Logging.Abstractions
		i64 u0x000000007d853e51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Microsoft.Extensions.Logging.Abstractions.dll.so
		ptr null; void* handle
	}, ; 57
	%struct.DSOCacheEntry {
		i64 u0x0000000014d68d23, ; from name: Xamarin.AndroidX.AppCompat.dll.so
		i64 u0x00000000b8fa92b4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 58
	%struct.DSOCacheEntry {
		i64 u0x00000000156cfb09, ; from name: libaot-System.Collections
		i64 u0x00000000d3d7eec4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 59
	%struct.DSOCacheEntry {
		i64 u0x0000000015e1c381, ; from name: aot-Microsoft.Extensions.DependencyInjection.Abstractions
		i64 u0x00000000b0dedb6b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		ptr null; void* handle
	}, ; 60
	%struct.DSOCacheEntry {
		i64 u0x00000000160bcfab, ; from name: System.Memory.dll.so
		i64 u0x00000000ebceb809, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 61
	%struct.DSOCacheEntry {
		i64 u0x000000001641ea28, ; from name: libaot-Xamarin.AndroidX.ViewPager2.dll.so
		i64 u0x000000001641ea28, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Xamarin.AndroidX.ViewPager2.dll.so
		ptr null; void* handle
	}, ; 62
	%struct.DSOCacheEntry {
		i64 u0x0000000016701fce, ; from name: libaot-System.Net.Http.so
		i64 u0x000000003b9fa69c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle
	}, ; 63
	%struct.DSOCacheEntry {
		i64 u0x0000000016e9313d, ; from name: aot-Microsoft.Extensions.Configuration.Abstractions.so
		i64 u0x000000006a6826d8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		ptr null; void* handle
	}, ; 64
	%struct.DSOCacheEntry {
		i64 u0x0000000017458336, ; from name: aot-Xamarin.AndroidX.Fragment.so
		i64 u0x00000000a7e7a8bf, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 65
	%struct.DSOCacheEntry {
		i64 u0x0000000017472541, ; from name: aot-Microsoft.Maui.Controls.dll.so
		i64 u0x000000003cd51dd1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Microsoft.Maui.Controls.dll.so
		ptr null; void* handle
	}, ; 66
	%struct.DSOCacheEntry {
		i64 u0x000000001753f886, ; from name: libaot-System.Net.Requests.so
		i64 u0x000000004506f4eb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle
	}, ; 67
	%struct.DSOCacheEntry {
		i64 u0x00000000177174fd, ; from name: aot-Java.Interop.so
		i64 u0x000000007e561493, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.91_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 68
	%struct.DSOCacheEntry {
		i64 u0x0000000017969339, ; from name: _Microsoft.Android.Resource.Designer
		i64 u0x00000000cee56696, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 69
	%struct.DSOCacheEntry {
		i64 u0x00000000184d471e, ; from name: aot-_Microsoft.Android.Resource.Designer.so
		i64 u0x00000000cee56696, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 70
	%struct.DSOCacheEntry {
		i64 u0x00000000196fe32e, ; from name: aot-Xamarin.AndroidX.Navigation.UI
		i64 u0x00000000141cb47a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Xamarin.AndroidX.Navigation.UI.dll.so
		ptr null; void* handle
	}, ; 71
	%struct.DSOCacheEntry {
		i64 u0x0000000019eae25a, ; from name: Xamarin.AndroidX.Navigation.Fragment.so
		i64 u0x00000000d57031b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		ptr null; void* handle
	}, ; 72
	%struct.DSOCacheEntry {
		i64 u0x000000001a61054f, ; from name: System.Collections
		i64 u0x00000000d3d7eec4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 73
	%struct.DSOCacheEntry {
		i64 u0x000000001aaf7199, ; from name: libaot-System.Runtime.Loader.so
		i64 u0x000000000e65cd01, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.Runtime.Loader.dll.so
		ptr null; void* handle
	}, ; 74
	%struct.DSOCacheEntry {
		i64 u0x000000001aec5648, ; from name: libaot-System.IO.Compression
		i64 u0x00000000341d0942, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 75
	%struct.DSOCacheEntry {
		i64 u0x000000001b67c841, ; from name: Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		i64 u0x0000000032abb588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		ptr null; void* handle
	}, ; 76
	%struct.DSOCacheEntry {
		i64 u0x000000001b9b2e13, ; from name: aot-System.Memory.dll.so
		i64 u0x00000000ebceb809, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 77
	%struct.DSOCacheEntry {
		i64 u0x000000001ba1ee62, ; from name: aot-Microsoft.Extensions.Diagnostics.Abstractions.so
		i64 u0x00000000537d157f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Microsoft.Extensions.Diagnostics.Abstractions.dll.so
		ptr null; void* handle
	}, ; 78
	%struct.DSOCacheEntry {
		i64 u0x000000001bdb6256, ; from name: aot-Xamarin.Kotlin.StdLib
		i64 u0x000000000e003282, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 79
	%struct.DSOCacheEntry {
		i64 u0x000000001be0ec0f, ; from name: aot-Xamarin.AndroidX.Loader
		i64 u0x000000003b171bfb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 80
	%struct.DSOCacheEntry {
		i64 u0x000000001be64ac5, ; from name: aot-Xamarin.AndroidX.Fragment.dll.so
		i64 u0x00000000a7e7a8bf, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 81
	%struct.DSOCacheEntry {
		i64 u0x000000001c80e700, ; from name: System.Private.Xml.so
		i64 u0x00000000c24a5970, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 82
	%struct.DSOCacheEntry {
		i64 u0x000000001ce5eda3, ; from name: aot-System.Text.Encodings.Web.so
		i64 u0x000000006ca8bc02, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle
	}, ; 83
	%struct.DSOCacheEntry {
		i64 u0x000000001d200783, ; from name: System.Memory.so
		i64 u0x00000000ebceb809, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 84
	%struct.DSOCacheEntry {
		i64 u0x000000001d3fe291, ; from name: aot-Xamarin.AndroidX.Core.so
		i64 u0x0000000003b7ead2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 85
	%struct.DSOCacheEntry {
		i64 u0x000000001d4102e1, ; from name: libaot-Xamarin.Kotlin.StdLib.so
		i64 u0x000000000e003282, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 86
	%struct.DSOCacheEntry {
		i64 u0x000000001d5e4f2a, ; from name: aot-System.Text.Json.dll.so
		i64 u0x00000000a170e652, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle
	}, ; 87
	%struct.DSOCacheEntry {
		i64 u0x000000001da581a0, ; from name: libaot-Concurso
		i64 u0x000000004d94027c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libaot-Concurso.dll.so
		ptr null; void* handle
	}, ; 88
	%struct.DSOCacheEntry {
		i64 u0x000000001dbae811, ; from name: System.ObjectModel
		i64 u0x000000004f0f9830, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 89
	%struct.DSOCacheEntry {
		i64 u0x000000001e175721, ; from name: aot-Xamarin.AndroidX.Activity.so
		i64 u0x00000000915782e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 90
	%struct.DSOCacheEntry {
		i64 u0x000000001f0af1b6, ; from name: libaot-Xamarin.AndroidX.Navigation.Common.Android.so
		i64 u0x00000000078ea0f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Xamarin.AndroidX.Navigation.Common.Android.dll.so
		ptr null; void* handle
	}, ; 91
	%struct.DSOCacheEntry {
		i64 u0x000000001f5d6145, ; from name: aot-System.Memory.so
		i64 u0x00000000ebceb809, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 92
	%struct.DSOCacheEntry {
		i64 u0x000000001fd35dbe, ; from name: System.Collections.NonGeneric.so
		i64 u0x0000000045a298d3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 93
	%struct.DSOCacheEntry {
		i64 u0x0000000020216150, ; from name: Microsoft.Extensions.Logging
		i64 u0x000000009faac168, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Microsoft.Extensions.Logging.dll.so
		ptr null; void* handle
	}, ; 94
	%struct.DSOCacheEntry {
		i64 u0x0000000020d5a9fc, ; from name: libaot-System.Private.Xml.so
		i64 u0x00000000c24a5970, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 95
	%struct.DSOCacheEntry {
		i64 u0x0000000021034b24, ; from name: aot-System.Collections
		i64 u0x00000000d3d7eec4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 96
	%struct.DSOCacheEntry {
		i64 u0x00000000211230ed, ; from name: aot-System.Net.Requests.dll.so
		i64 u0x000000004506f4eb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle
	}, ; 97
	%struct.DSOCacheEntry {
		i64 u0x0000000021350a7b, ; from name: System.Drawing.Primitives.so
		i64 u0x00000000508a690d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle
	}, ; 98
	%struct.DSOCacheEntry {
		i64 u0x00000000219961c6, ; from name: libaot-Xamarin.AndroidX.AppCompat
		i64 u0x00000000b8fa92b4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 99
	%struct.DSOCacheEntry {
		i64 u0x0000000022dd17c7, ; from name: aot-System.Runtime.Numerics
		i64 u0x00000000ad907b53, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle
	}, ; 100
	%struct.DSOCacheEntry {
		i64 u0x00000000232c2f3c, ; from name: aot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android
		i64 u0x000000008c4f6181, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so
		ptr null; void* handle
	}, ; 101
	%struct.DSOCacheEntry {
		i64 u0x000000002365046a, ; from name: libaot-Xamarin.AndroidX.Collection.Jvm
		i64 u0x0000000057c93dd4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-Xamarin.AndroidX.Collection.Jvm.dll.so
		ptr null; void* handle
	}, ; 102
	%struct.DSOCacheEntry {
		i64 u0x00000000237a4b6c, ; from name: Xamarin.AndroidX.Navigation.UI.dll.so
		i64 u0x00000000141cb47a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Xamarin.AndroidX.Navigation.UI.dll.so
		ptr null; void* handle
	}, ; 103
	%struct.DSOCacheEntry {
		i64 u0x0000000023ea7041, ; from name: aot-System.Text.Encodings.Web.dll.so
		i64 u0x000000006ca8bc02, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle
	}, ; 104
	%struct.DSOCacheEntry {
		i64 u0x00000000242c33a0, ; from name: aot-Xamarin.AndroidX.Navigation.Runtime.Android
		i64 u0x000000002cce3b68, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Xamarin.AndroidX.Navigation.Runtime.Android.dll.so
		ptr null; void* handle
	}, ; 105
	%struct.DSOCacheEntry {
		i64 u0x00000000251b87b9, ; from name: aot-System.Drawing.Primitives
		i64 u0x00000000508a690d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle
	}, ; 106
	%struct.DSOCacheEntry {
		i64 u0x000000002568904f, ; from name: Xamarin.AndroidX.CustomView
		i64 u0x0000000080dfe53f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.CustomView.dll.so
		ptr null; void* handle
	}, ; 107
	%struct.DSOCacheEntry {
		i64 u0x00000000258a6bf6, ; from name: Microsoft.Maui.dll.so
		i64 u0x0000000069864c69, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Microsoft.Maui.dll.so
		ptr null; void* handle
	}, ; 108
	%struct.DSOCacheEntry {
		i64 u0x00000000263a6281, ; from name: aot-System.Numerics.Vectors.dll.so
		i64 u0x0000000095f63711, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle
	}, ; 109
	%struct.DSOCacheEntry {
		i64 u0x0000000026765286, ; from name: libaot-Xamarin.AndroidX.CardView
		i64 u0x00000000eaa1bb0f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-Xamarin.AndroidX.CardView.dll.so
		ptr null; void* handle
	}, ; 110
	%struct.DSOCacheEntry {
		i64 u0x000000002734bbe1, ; from name: aot-System.Collections.Specialized
		i64 u0x00000000a8bf5d10, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 111
	%struct.DSOCacheEntry {
		i64 u0x00000000275c6592, ; from name: aot-Xamarin.Google.Android.Material.dll.so
		i64 u0x00000000a0778edb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Xamarin.Google.Android.Material.dll.so
		ptr null; void* handle
	}, ; 112
	%struct.DSOCacheEntry {
		i64 u0x00000000279fca89, ; from name: Xamarin.AndroidX.SavedState.SavedState.Android.so
		i64 u0x000000000418b010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Xamarin.AndroidX.SavedState.SavedState.Android.dll.so
		ptr null; void* handle
	}, ; 113
	%struct.DSOCacheEntry {
		i64 u0x000000002814a96c, ; from name: System.Collections.Concurrent
		i64 u0x00000000681f5cdc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 114
	%struct.DSOCacheEntry {
		i64 u0x000000002849fa24, ; from name: System.Net.Requests.dll.so
		i64 u0x000000004506f4eb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle
	}, ; 115
	%struct.DSOCacheEntry {
		i64 u0x000000002882b7c4, ; from name: aot-System.Runtime.InteropServices
		i64 u0x000000008bbc0be1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 116
	%struct.DSOCacheEntry {
		i64 u0x0000000029642c59, ; from name: libaot-Microsoft.Extensions.Configuration.Abstractions.so
		i64 u0x000000006a6826d8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		ptr null; void* handle
	}, ; 117
	%struct.DSOCacheEntry {
		i64 u0x000000002a14f79d, ; from name: libaot-System.Private.Uri.so
		i64 u0x0000000099cbecc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 118
	%struct.DSOCacheEntry {
		i64 u0x000000002a6d1cab, ; from name: System.Security.Cryptography.so
		i64 u0x00000000d72c936f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 119
	%struct.DSOCacheEntry {
		i64 u0x000000002a87f0f9, ; from name: Microsoft.Extensions.FileProviders.Abstractions.so
		i64 u0x00000000a7fa0e4d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		ptr null; void* handle
	}, ; 120
	%struct.DSOCacheEntry {
		i64 u0x000000002aa19484, ; from name: libaot-System.Collections.NonGeneric.so
		i64 u0x0000000045a298d3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 121
	%struct.DSOCacheEntry {
		i64 u0x000000002b4b7c0e, ; from name: libaot-Xamarin.KotlinX.Serialization.Core.Jvm.so
		i64 u0x00000000f1077784, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Xamarin.KotlinX.Serialization.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 122
	%struct.DSOCacheEntry {
		i64 u0x000000002baa5ced, ; from name: aot-System.Drawing.Primitives.so
		i64 u0x00000000508a690d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle
	}, ; 123
	%struct.DSOCacheEntry {
		i64 u0x000000002c046ae3, ; from name: aot-System.Memory
		i64 u0x00000000ebceb809, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 124
	%struct.DSOCacheEntry {
		i64 u0x000000002c0ccac0, ; from name: Xamarin.AndroidX.CoordinatorLayout.so
		i64 u0x00000000336302e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		ptr null; void* handle
	}, ; 125
	%struct.DSOCacheEntry {
		i64 u0x000000002c56a78d, ; from name: libaot-System.IO.Pipelines.dll.so
		i64 u0x000000002c56a78d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.IO.Pipelines.dll.so
		ptr null; void* handle
	}, ; 126
	%struct.DSOCacheEntry {
		i64 u0x000000002c58109e, ; from name: aot-Xamarin.AndroidX.AppCompat.AppCompatResources.so
		i64 u0x0000000032abb588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		ptr null; void* handle
	}, ; 127
	%struct.DSOCacheEntry {
		i64 u0x000000002cce3b68, ; from name: libaot-Xamarin.AndroidX.Navigation.Runtime.Android.dll.so
		i64 u0x000000002cce3b68, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Xamarin.AndroidX.Navigation.Runtime.Android.dll.so
		ptr null; void* handle
	}, ; 128
	%struct.DSOCacheEntry {
		i64 u0x000000002cfbd727, ; from name: libaot-Concurso.so
		i64 u0x000000004d94027c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libaot-Concurso.dll.so
		ptr null; void* handle
	}, ; 129
	%struct.DSOCacheEntry {
		i64 u0x000000002d445acd, ; from name: System.Net.Requests
		i64 u0x000000004506f4eb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle
	}, ; 130
	%struct.DSOCacheEntry {
		i64 u0x000000002d6103aa, ; from name: libaot-Microsoft.Maui.Controls.Xaml.dll.so
		i64 u0x000000002d6103aa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Microsoft.Maui.Controls.Xaml.dll.so
		ptr null; void* handle
	}, ; 131
	%struct.DSOCacheEntry {
		i64 u0x000000002e176966, ; from name: Xamarin.AndroidX.Lifecycle.Common.Jvm.so
		i64 u0x000000004cae6f51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so
		ptr null; void* handle
	}, ; 132
	%struct.DSOCacheEntry {
		i64 u0x000000002e394f87, ; from name: System.IO.Compression
		i64 u0x00000000341d0942, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 133
	%struct.DSOCacheEntry {
		i64 u0x000000002e5c9414, ; from name: libaot-Microsoft.Extensions.Hosting.Abstractions.dll.so
		i64 u0x000000002e5c9414, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Microsoft.Extensions.Hosting.Abstractions.dll.so
		ptr null; void* handle
	}, ; 134
	%struct.DSOCacheEntry {
		i64 u0x000000002f085312, ; from name: aot-System.Threading.Thread
		i64 u0x00000000dce000c2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle
	}, ; 135
	%struct.DSOCacheEntry {
		i64 u0x000000002f0980eb, ; from name: Microsoft.Extensions.Options
		i64 u0x000000003ce4cf8f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Microsoft.Extensions.Options.dll.so
		ptr null; void* handle
	}, ; 136
	%struct.DSOCacheEntry {
		i64 u0x000000002f34dabe, ; from name: libaot-Xamarin.AndroidX.Navigation.UI.so
		i64 u0x00000000141cb47a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Xamarin.AndroidX.Navigation.UI.dll.so
		ptr null; void* handle
	}, ; 137
	%struct.DSOCacheEntry {
		i64 u0x000000002fd1ec25, ; from name: aot-Xamarin.AndroidX.DrawerLayout.dll.so
		i64 u0x00000000a2e5eb85, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 138
	%struct.DSOCacheEntry {
		i64 u0x0000000030585722, ; from name: aot-_Microsoft.Android.Resource.Designer
		i64 u0x00000000cee56696, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 139
	%struct.DSOCacheEntry {
		i64 u0x000000003072713e, ; from name: aot-Microsoft.Extensions.DependencyInjection.so
		i64 u0x0000000042d22978, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.dll.so
		ptr null; void* handle
	}, ; 140
	%struct.DSOCacheEntry {
		i64 u0x00000000312d978f, ; from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.so
		i64 u0x000000008c4f6181, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so
		ptr null; void* handle
	}, ; 141
	%struct.DSOCacheEntry {
		i64 u0x00000000313c4c9a, ; from name: libaot-Microsoft.Maui.Graphics.dll.so
		i64 u0x00000000313c4c9a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Microsoft.Maui.Graphics.dll.so
		ptr null; void* handle
	}, ; 142
	%struct.DSOCacheEntry {
		i64 u0x00000000317d5b75, ; from name: System.IO.Compression.Brotli
		i64 u0x00000000e9f3ecfe, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle
	}, ; 143
	%struct.DSOCacheEntry {
		i64 u0x0000000031eae8ea, ; from name: libaot-System.Linq.Expressions
		i64 u0x00000000c4588d67, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 144
	%struct.DSOCacheEntry {
		i64 u0x0000000032670d13, ; from name: aot-System.Collections.dll.so
		i64 u0x00000000d3d7eec4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 145
	%struct.DSOCacheEntry {
		i64 u0x000000003276cbc4, ; from name: aot-System.Collections.Concurrent.dll.so
		i64 u0x00000000681f5cdc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 146
	%struct.DSOCacheEntry {
		i64 u0x0000000032abb588, ; from name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		i64 u0x0000000032abb588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		ptr null; void* handle
	}, ; 147
	%struct.DSOCacheEntry {
		i64 u0x0000000033042993, ; from name: aot-System.Threading.Thread.dll.so
		i64 u0x00000000dce000c2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle
	}, ; 148
	%struct.DSOCacheEntry {
		i64 u0x00000000336302e2, ; from name: libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		i64 u0x00000000336302e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		ptr null; void* handle
	}, ; 149
	%struct.DSOCacheEntry {
		i64 u0x0000000033bd32cc, ; from name: Microsoft.Extensions.Logging.Abstractions.so
		i64 u0x000000007d853e51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Microsoft.Extensions.Logging.Abstractions.dll.so
		ptr null; void* handle
	}, ; 150
	%struct.DSOCacheEntry {
		i64 u0x00000000341d0942, ; from name: libaot-System.IO.Compression.dll.so
		i64 u0x00000000341d0942, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 151
	%struct.DSOCacheEntry {
		i64 u0x000000003443b815, ; from name: libaot-System.Net.Primitives
		i64 u0x000000009dc5271e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 152
	%struct.DSOCacheEntry {
		i64 u0x0000000034779f61, ; from name: Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		i64 u0x00000000b0dedb6b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		ptr null; void* handle
	}, ; 153
	%struct.DSOCacheEntry {
		i64 u0x0000000034e97f3e, ; from name: aot-System.Linq.so
		i64 u0x000000003812966e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 154
	%struct.DSOCacheEntry {
		i64 u0x000000003549f58a, ; from name: Microsoft.Maui.Controls.so
		i64 u0x000000003cd51dd1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Microsoft.Maui.Controls.dll.so
		ptr null; void* handle
	}, ; 155
	%struct.DSOCacheEntry {
		i64 u0x0000000035a05df5, ; from name: aot-Microsoft.Extensions.Primitives.dll.so
		i64 u0x0000000045840300, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Microsoft.Extensions.Primitives.dll.so
		ptr null; void* handle
	}, ; 156
	%struct.DSOCacheEntry {
		i64 u0x0000000035a1cb38, ; from name: libaot-Mono.Android.so
		i64 u0x00000000116fa401, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.93_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 157
	%struct.DSOCacheEntry {
		i64 u0x00000000361aa096, ; from name: libaot-System.Security.Cryptography
		i64 u0x00000000d72c936f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 158
	%struct.DSOCacheEntry {
		i64 u0x00000000365cc3e6, ; from name: aot-Xamarin.AndroidX.Loader.so
		i64 u0x000000003b171bfb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 159
	%struct.DSOCacheEntry {
		i64 u0x00000000370b01f0, ; from name: libaot-Microsoft.Maui.Controls.Xaml.so
		i64 u0x000000002d6103aa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Microsoft.Maui.Controls.Xaml.dll.so
		ptr null; void* handle
	}, ; 160
	%struct.DSOCacheEntry {
		i64 u0x0000000037f028e5, ; from name: aot-Xamarin.AndroidX.Navigation.Runtime.Android.dll.so
		i64 u0x000000002cce3b68, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Xamarin.AndroidX.Navigation.Runtime.Android.dll.so
		ptr null; void* handle
	}, ; 161
	%struct.DSOCacheEntry {
		i64 u0x000000003812966e, ; from name: libaot-System.Linq.dll.so
		i64 u0x000000003812966e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 162
	%struct.DSOCacheEntry {
		i64 u0x00000000389ead47, ; from name: System.Diagnostics.DiagnosticSource.so
		i64 u0x0000000091f7d332, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 163
	%struct.DSOCacheEntry {
		i64 u0x0000000038a1e793, ; from name: libaot-System.Drawing.dll.so
		i64 u0x0000000038a1e793, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle
	}, ; 164
	%struct.DSOCacheEntry {
		i64 u0x0000000038fbbe9f, ; from name: aot-System.Text.Encodings.Web
		i64 u0x000000006ca8bc02, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle
	}, ; 165
	%struct.DSOCacheEntry {
		i64 u0x00000000397fbd36, ; from name: aot-System.Collections.Concurrent.so
		i64 u0x00000000681f5cdc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 166
	%struct.DSOCacheEntry {
		i64 u0x00000000398d7157, ; from name: libaot-System
		i64 u0x00000000d4110d87, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 167
	%struct.DSOCacheEntry {
		i64 u0x000000003a733b48, ; from name: aot-Xamarin.AndroidX.RecyclerView.so
		i64 u0x00000000533f79e3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Xamarin.AndroidX.RecyclerView.dll.so
		ptr null; void* handle
	}, ; 168
	%struct.DSOCacheEntry {
		i64 u0x000000003b11d4f0, ; from name: aot-System.ComponentModel.TypeConverter
		i64 u0x0000000081847c35, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 169
	%struct.DSOCacheEntry {
		i64 u0x000000003b171bfb, ; from name: libaot-Xamarin.AndroidX.Loader.dll.so
		i64 u0x000000003b171bfb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 170
	%struct.DSOCacheEntry {
		i64 u0x000000003b78f103, ; from name: aot-System.so
		i64 u0x00000000d4110d87, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 171
	%struct.DSOCacheEntry {
		i64 u0x000000003b7e5089, ; from name: libaot-Xamarin.AndroidX.CoordinatorLayout.so
		i64 u0x00000000336302e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		ptr null; void* handle
	}, ; 172
	%struct.DSOCacheEntry {
		i64 u0x000000003b97d8e0, ; from name: Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		i64 u0x00000000f52a5c06, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		ptr null; void* handle
	}, ; 173
	%struct.DSOCacheEntry {
		i64 u0x000000003b9d6dbb, ; from name: libaot-System.Xml.ReaderWriter
		i64 u0x00000000716accae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle
	}, ; 174
	%struct.DSOCacheEntry {
		i64 u0x000000003b9fa69c, ; from name: libaot-System.Net.Http.dll.so
		i64 u0x000000003b9fa69c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle
	}, ; 175
	%struct.DSOCacheEntry {
		i64 u0x000000003bd238ad, ; from name: aot-Xamarin.AndroidX.Collection.Jvm.dll.so
		i64 u0x0000000057c93dd4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-Xamarin.AndroidX.Collection.Jvm.dll.so
		ptr null; void* handle
	}, ; 176
	%struct.DSOCacheEntry {
		i64 u0x000000003c60436f, ; from name: aot-System.Diagnostics.DiagnosticSource.so
		i64 u0x0000000091f7d332, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 177
	%struct.DSOCacheEntry {
		i64 u0x000000003c7a1066, ; from name: Microsoft.Maui.Essentials.dll.so
		i64 u0x0000000085d2bea6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Microsoft.Maui.Essentials.dll.so
		ptr null; void* handle
	}, ; 178
	%struct.DSOCacheEntry {
		i64 u0x000000003cbffa41, ; from name: System.Drawing
		i64 u0x0000000038a1e793, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle
	}, ; 179
	%struct.DSOCacheEntry {
		i64 u0x000000003cd51dd1, ; from name: libaot-Microsoft.Maui.Controls.dll.so
		i64 u0x000000003cd51dd1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Microsoft.Maui.Controls.dll.so
		ptr null; void* handle
	}, ; 180
	%struct.DSOCacheEntry {
		i64 u0x000000003ce4cf8f, ; from name: libaot-Microsoft.Extensions.Options.dll.so
		i64 u0x000000003ce4cf8f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Microsoft.Extensions.Options.dll.so
		ptr null; void* handle
	}, ; 181
	%struct.DSOCacheEntry {
		i64 u0x000000003d3ac4fd, ; from name: aot-Xamarin.AndroidX.DrawerLayout
		i64 u0x00000000a2e5eb85, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 182
	%struct.DSOCacheEntry {
		i64 u0x000000003d548d92, ; from name: Microsoft.Extensions.DependencyInjection.Abstractions
		i64 u0x00000000b0dedb6b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		ptr null; void* handle
	}, ; 183
	%struct.DSOCacheEntry {
		i64 u0x000000003da046a1, ; from name: System.ObjectModel.so
		i64 u0x000000004f0f9830, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 184
	%struct.DSOCacheEntry {
		i64 u0x000000003dbaaf8f, ; from name: Xamarin.AndroidX.AppCompat
		i64 u0x00000000b8fa92b4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 185
	%struct.DSOCacheEntry {
		i64 u0x000000003f09ad2c, ; from name: libaot-Microsoft.Extensions.Primitives.so
		i64 u0x0000000045840300, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Microsoft.Extensions.Primitives.dll.so
		ptr null; void* handle
	}, ; 186
	%struct.DSOCacheEntry {
		i64 u0x000000003f7479d8, ; from name: Xamarin.AndroidX.Fragment.dll.so
		i64 u0x00000000a7e7a8bf, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 187
	%struct.DSOCacheEntry {
		i64 u0x000000003f96103f, ; from name: System.IO.Pipelines.so
		i64 u0x000000002c56a78d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.IO.Pipelines.dll.so
		ptr null; void* handle
	}, ; 188
	%struct.DSOCacheEntry {
		i64 u0x000000004005e649, ; from name: Concurso.so
		i64 u0x000000004d94027c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libaot-Concurso.dll.so
		ptr null; void* handle
	}, ; 189
	%struct.DSOCacheEntry {
		i64 u0x00000000400e2ccf, ; from name: Microsoft.Maui.Controls.Xaml.dll.so
		i64 u0x000000002d6103aa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Microsoft.Maui.Controls.Xaml.dll.so
		ptr null; void* handle
	}, ; 190
	%struct.DSOCacheEntry {
		i64 u0x0000000040102943, ; from name: libaot-Xamarin.AndroidX.SwipeRefreshLayout.so
		i64 u0x00000000f52a5c06, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		ptr null; void* handle
	}, ; 191
	%struct.DSOCacheEntry {
		i64 u0x000000004057e9b0, ; from name: libaot-Xamarin.AndroidX.CursorAdapter.dll.so
		i64 u0x000000004057e9b0, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.CursorAdapter.dll.so
		ptr null; void* handle
	}, ; 192
	%struct.DSOCacheEntry {
		i64 u0x00000000408960ce, ; from name: libaot-System.Net.Primitives.so
		i64 u0x000000009dc5271e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 193
	%struct.DSOCacheEntry {
		i64 u0x00000000408b17f4, ; from name: System.ComponentModel.TypeConverter
		i64 u0x0000000081847c35, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 194
	%struct.DSOCacheEntry {
		i64 u0x00000000409e66d8, ; from name: Xamarin.Kotlin.StdLib
		i64 u0x000000000e003282, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 195
	%struct.DSOCacheEntry {
		i64 u0x0000000040fb1487, ; from name: libaot-System.Runtime.so
		i64 u0x0000000087de61a5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 196
	%struct.DSOCacheEntry {
		i64 u0x000000004139e3d1, ; from name: Concurso
		i64 u0x000000004d94027c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libaot-Concurso.dll.so
		ptr null; void* handle
	}, ; 197
	%struct.DSOCacheEntry {
		i64 u0x0000000041761b2c, ; from name: System
		i64 u0x00000000d4110d87, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 198
	%struct.DSOCacheEntry {
		i64 u0x00000000419b374f, ; from name: libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm
		i64 u0x000000004cae6f51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so
		ptr null; void* handle
	}, ; 199
	%struct.DSOCacheEntry {
		i64 u0x0000000041ffd8b9, ; from name: libaot-System.Formats.Asn1
		i64 u0x00000000c3325126, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle
	}, ; 200
	%struct.DSOCacheEntry {
		i64 u0x00000000422dfa8a, ; from name: Microsoft.Extensions.Hosting.Abstractions
		i64 u0x000000002e5c9414, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Microsoft.Extensions.Hosting.Abstractions.dll.so
		ptr null; void* handle
	}, ; 201
	%struct.DSOCacheEntry {
		i64 u0x00000000423be4f3, ; from name: aot-Xamarin.AndroidX.AppCompat.so
		i64 u0x00000000b8fa92b4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 202
	%struct.DSOCacheEntry {
		i64 u0x00000000426f75f5, ; from name: aot-Xamarin.AndroidX.Navigation.Fragment.so
		i64 u0x00000000d57031b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		ptr null; void* handle
	}, ; 203
	%struct.DSOCacheEntry {
		i64 u0x0000000042d22978, ; from name: libaot-Microsoft.Extensions.DependencyInjection.dll.so
		i64 u0x0000000042d22978, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.dll.so
		ptr null; void* handle
	}, ; 204
	%struct.DSOCacheEntry {
		i64 u0x0000000042d65555, ; from name: Xamarin.AndroidX.Lifecycle.LiveData.Core.so
		i64 u0x00000000ee0cc1b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 205
	%struct.DSOCacheEntry {
		i64 u0x00000000443a17dc, ; from name: aot-System.Diagnostics.DiagnosticSource
		i64 u0x0000000091f7d332, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 206
	%struct.DSOCacheEntry {
		i64 u0x00000000449fc74a, ; from name: Microsoft.Extensions.Primitives.so
		i64 u0x0000000045840300, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Microsoft.Extensions.Primitives.dll.so
		ptr null; void* handle
	}, ; 207
	%struct.DSOCacheEntry {
		i64 u0x0000000044e01f0b, ; from name: libaot-Xamarin.AndroidX.Activity.so
		i64 u0x00000000915782e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 208
	%struct.DSOCacheEntry {
		i64 u0x000000004506f4eb, ; from name: libaot-System.Net.Requests.dll.so
		i64 u0x000000004506f4eb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle
	}, ; 209
	%struct.DSOCacheEntry {
		i64 u0x000000004544efd3, ; from name: aot-Xamarin.AndroidX.Activity.dll.so
		i64 u0x00000000915782e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 210
	%struct.DSOCacheEntry {
		i64 u0x00000000455202e8, ; from name: libaot-System.Collections.Specialized
		i64 u0x00000000a8bf5d10, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 211
	%struct.DSOCacheEntry {
		i64 u0x00000000457f8ab8, ; from name: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so
		i64 u0x000000008c4f6181, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so
		ptr null; void* handle
	}, ; 212
	%struct.DSOCacheEntry {
		i64 u0x0000000045840300, ; from name: libaot-Microsoft.Extensions.Primitives.dll.so
		i64 u0x0000000045840300, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Microsoft.Extensions.Primitives.dll.so
		ptr null; void* handle
	}, ; 213
	%struct.DSOCacheEntry {
		i64 u0x00000000458d887c, ; from name: System.Collections.Concurrent.dll.so
		i64 u0x00000000681f5cdc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 214
	%struct.DSOCacheEntry {
		i64 u0x0000000045a298d3, ; from name: libaot-System.Collections.NonGeneric.dll.so
		i64 u0x0000000045a298d3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 215
	%struct.DSOCacheEntry {
		i64 u0x0000000045d52b6a, ; from name: aot-Xamarin.AndroidX.CustomView.so
		i64 u0x0000000080dfe53f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.CustomView.dll.so
		ptr null; void* handle
	}, ; 216
	%struct.DSOCacheEntry {
		i64 u0x000000004690db21, ; from name: libaot-Xamarin.AndroidX.DrawerLayout.so
		i64 u0x00000000a2e5eb85, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 217
	%struct.DSOCacheEntry {
		i64 u0x000000004715d336, ; from name: System.Drawing.so
		i64 u0x0000000038a1e793, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle
	}, ; 218
	%struct.DSOCacheEntry {
		i64 u0x00000000475ae2d5, ; from name: libaot-System.Threading.Thread.so
		i64 u0x00000000dce000c2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle
	}, ; 219
	%struct.DSOCacheEntry {
		i64 u0x000000004765df1a, ; from name: libaot-System.Drawing
		i64 u0x0000000038a1e793, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle
	}, ; 220
	%struct.DSOCacheEntry {
		i64 u0x0000000048653367, ; from name: System.IO.Compression.Brotli.so
		i64 u0x00000000e9f3ecfe, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle
	}, ; 221
	%struct.DSOCacheEntry {
		i64 u0x00000000490cd999, ; from name: libaot-System.IO.Compression.so
		i64 u0x00000000341d0942, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 222
	%struct.DSOCacheEntry {
		i64 u0x000000004a694da1, ; from name: aot-System.Runtime.Loader
		i64 u0x000000000e65cd01, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.Runtime.Loader.dll.so
		ptr null; void* handle
	}, ; 223
	%struct.DSOCacheEntry {
		i64 u0x000000004a7bca6e, ; from name: Xamarin.AndroidX.CoordinatorLayout.dll.so
		i64 u0x00000000336302e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		ptr null; void* handle
	}, ; 224
	%struct.DSOCacheEntry {
		i64 u0x000000004b275854, ; from name: Xamarin.KotlinX.Serialization.Core.Jvm
		i64 u0x00000000f1077784, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Xamarin.KotlinX.Serialization.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 225
	%struct.DSOCacheEntry {
		i64 u0x000000004b573a41, ; from name: aot-Xamarin.AndroidX.CustomView
		i64 u0x0000000080dfe53f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.CustomView.dll.so
		ptr null; void* handle
	}, ; 226
	%struct.DSOCacheEntry {
		i64 u0x000000004b9feaad, ; from name: aot-System.Diagnostics.DiagnosticSource.dll.so
		i64 u0x0000000091f7d332, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 227
	%struct.DSOCacheEntry {
		i64 u0x000000004be9ed98, ; from name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.so
		i64 u0x0000000032abb588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		ptr null; void* handle
	}, ; 228
	%struct.DSOCacheEntry {
		i64 u0x000000004c69178c, ; from name: libaot-Microsoft.Maui.Controls.Xaml
		i64 u0x000000002d6103aa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Microsoft.Maui.Controls.Xaml.dll.so
		ptr null; void* handle
	}, ; 229
	%struct.DSOCacheEntry {
		i64 u0x000000004c9ea507, ; from name: aot-System.dll.so
		i64 u0x00000000d4110d87, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 230
	%struct.DSOCacheEntry {
		i64 u0x000000004cae6f51, ; from name: libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so
		i64 u0x000000004cae6f51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so
		ptr null; void* handle
	}, ; 231
	%struct.DSOCacheEntry {
		i64 u0x000000004d35874a, ; from name: Microsoft.Extensions.Logging.so
		i64 u0x000000009faac168, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Microsoft.Extensions.Logging.dll.so
		ptr null; void* handle
	}, ; 232
	%struct.DSOCacheEntry {
		i64 u0x000000004d94027c, ; from name: libaot-Concurso.dll.so
		i64 u0x000000004d94027c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libaot-Concurso.dll.so
		ptr null; void* handle
	}, ; 233
	%struct.DSOCacheEntry {
		i64 u0x000000004db3d7fc, ; from name: libaot-Microsoft.Maui.Graphics
		i64 u0x00000000313c4c9a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Microsoft.Maui.Graphics.dll.so
		ptr null; void* handle
	}, ; 234
	%struct.DSOCacheEntry {
		i64 u0x000000004e4f9e5a, ; from name: aot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so
		i64 u0x000000009abadfdb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so
		ptr null; void* handle
	}, ; 235
	%struct.DSOCacheEntry {
		i64 u0x000000004e50159c, ; from name: Xamarin.AndroidX.Navigation.Common.Android
		i64 u0x00000000078ea0f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Xamarin.AndroidX.Navigation.Common.Android.dll.so
		ptr null; void* handle
	}, ; 236
	%struct.DSOCacheEntry {
		i64 u0x000000004eed2679, ; from name: System.Linq
		i64 u0x000000003812966e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 237
	%struct.DSOCacheEntry {
		i64 u0x000000004f0f9830, ; from name: libaot-System.ObjectModel.dll.so
		i64 u0x000000004f0f9830, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 238
	%struct.DSOCacheEntry {
		i64 u0x000000004f4e6629, ; from name: libaot-System.ObjectModel
		i64 u0x000000004f0f9830, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 239
	%struct.DSOCacheEntry {
		i64 u0x000000004f8218ac, ; from name: libaot-Xamarin.AndroidX.Navigation.Runtime.Android.so
		i64 u0x000000002cce3b68, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Xamarin.AndroidX.Navigation.Runtime.Android.dll.so
		ptr null; void* handle
	}, ; 240
	%struct.DSOCacheEntry {
		i64 u0x00000000506d63f5, ; from name: libaot-Microsoft.Maui.Essentials.so
		i64 u0x0000000085d2bea6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Microsoft.Maui.Essentials.dll.so
		ptr null; void* handle
	}, ; 241
	%struct.DSOCacheEntry {
		i64 u0x00000000508a690d, ; from name: libaot-System.Drawing.Primitives.dll.so
		i64 u0x00000000508a690d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle
	}, ; 242
	%struct.DSOCacheEntry {
		i64 u0x0000000050d1744a, ; from name: Xamarin.AndroidX.Navigation.UI.so
		i64 u0x00000000141cb47a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Xamarin.AndroidX.Navigation.UI.dll.so
		ptr null; void* handle
	}, ; 243
	%struct.DSOCacheEntry {
		i64 u0x0000000050e0e57b, ; from name: Microsoft.Maui.Controls.dll.so
		i64 u0x000000003cd51dd1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Microsoft.Maui.Controls.dll.so
		ptr null; void* handle
	}, ; 244
	%struct.DSOCacheEntry {
		i64 u0x00000000511d32a7, ; from name: libaot-Xamarin.Google.Android.Material
		i64 u0x00000000a0778edb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Xamarin.Google.Android.Material.dll.so
		ptr null; void* handle
	}, ; 245
	%struct.DSOCacheEntry {
		i64 u0x0000000051404613, ; from name: libaot-Xamarin.AndroidX.Navigation.Fragment
		i64 u0x00000000d57031b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		ptr null; void* handle
	}, ; 246
	%struct.DSOCacheEntry {
		i64 u0x00000000515697b5, ; from name: System.Linq.Expressions.dll.so
		i64 u0x00000000c4588d67, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 247
	%struct.DSOCacheEntry {
		i64 u0x00000000519dbe74, ; from name: aot-Xamarin.AndroidX.ViewPager2
		i64 u0x000000001641ea28, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Xamarin.AndroidX.ViewPager2.dll.so
		ptr null; void* handle
	}, ; 248
	%struct.DSOCacheEntry {
		i64 u0x0000000051a1e938, ; from name: System.Drawing.Primitives.dll.so
		i64 u0x00000000508a690d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle
	}, ; 249
	%struct.DSOCacheEntry {
		i64 u0x0000000051dfadad, ; from name: libaot-Microsoft.Maui.Essentials
		i64 u0x0000000085d2bea6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Microsoft.Maui.Essentials.dll.so
		ptr null; void* handle
	}, ; 250
	%struct.DSOCacheEntry {
		i64 u0x000000005207bb09, ; from name: aot-System.Private.CoreLib.dll.so
		i64 u0x00000000f5dad612, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 251
	%struct.DSOCacheEntry {
		i64 u0x00000000522bfced, ; from name: Microsoft.Maui.Graphics.so
		i64 u0x00000000313c4c9a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Microsoft.Maui.Graphics.dll.so
		ptr null; void* handle
	}, ; 252
	%struct.DSOCacheEntry {
		i64 u0x00000000526f0d98, ; from name: aot-System.Net.Http.dll.so
		i64 u0x000000003b9fa69c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle
	}, ; 253
	%struct.DSOCacheEntry {
		i64 u0x000000005272fbb2, ; from name: aot-System.ObjectModel
		i64 u0x000000004f0f9830, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 254
	%struct.DSOCacheEntry {
		i64 u0x00000000529f390c, ; from name: libaot-System.Threading
		i64 u0x00000000f97d7588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 255
	%struct.DSOCacheEntry {
		i64 u0x0000000052c4e8c4, ; from name: aot-Microsoft.Extensions.DependencyInjection.dll.so
		i64 u0x0000000042d22978, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.dll.so
		ptr null; void* handle
	}, ; 256
	%struct.DSOCacheEntry {
		i64 u0x000000005334092f, ; from name: libaot-System.ComponentModel.dll.so
		i64 u0x000000005334092f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 257
	%struct.DSOCacheEntry {
		i64 u0x00000000533f79e3, ; from name: libaot-Xamarin.AndroidX.RecyclerView.dll.so
		i64 u0x00000000533f79e3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Xamarin.AndroidX.RecyclerView.dll.so
		ptr null; void* handle
	}, ; 258
	%struct.DSOCacheEntry {
		i64 u0x00000000537d157f, ; from name: libaot-Microsoft.Extensions.Diagnostics.Abstractions.dll.so
		i64 u0x00000000537d157f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Microsoft.Extensions.Diagnostics.Abstractions.dll.so
		ptr null; void* handle
	}, ; 259
	%struct.DSOCacheEntry {
		i64 u0x000000005390594d, ; from name: System.Collections.Specialized.dll.so
		i64 u0x00000000a8bf5d10, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 260
	%struct.DSOCacheEntry {
		i64 u0x0000000053a0bb56, ; from name: System.Xml.ReaderWriter.so
		i64 u0x00000000716accae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle
	}, ; 261
	%struct.DSOCacheEntry {
		i64 u0x0000000053cefc50, ; from name: Xamarin.AndroidX.CoordinatorLayout
		i64 u0x00000000336302e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		ptr null; void* handle
	}, ; 262
	%struct.DSOCacheEntry {
		i64 u0x000000005406de62, ; from name: aot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		i64 u0x0000000032abb588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		ptr null; void* handle
	}, ; 263
	%struct.DSOCacheEntry {
		i64 u0x0000000054611a79, ; from name: Xamarin.KotlinX.Serialization.Core.Jvm.dll.so
		i64 u0x00000000f1077784, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Xamarin.KotlinX.Serialization.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 264
	%struct.DSOCacheEntry {
		i64 u0x0000000055115a88, ; from name: aot-Microsoft.Extensions.Logging
		i64 u0x000000009faac168, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Microsoft.Extensions.Logging.dll.so
		ptr null; void* handle
	}, ; 265
	%struct.DSOCacheEntry {
		i64 u0x0000000055ab7451, ; from name: Xamarin.AndroidX.Lifecycle.Common.Jvm
		i64 u0x000000004cae6f51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so
		ptr null; void* handle
	}, ; 266
	%struct.DSOCacheEntry {
		i64 u0x0000000055e55df2, ; from name: Xamarin.AndroidX.Lifecycle.ViewModel.Android
		i64 u0x000000009abadfdb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so
		ptr null; void* handle
	}, ; 267
	%struct.DSOCacheEntry {
		i64 u0x00000000560b0fd8, ; from name: aot-System.Drawing
		i64 u0x0000000038a1e793, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle
	}, ; 268
	%struct.DSOCacheEntry {
		i64 u0x00000000568ef09c, ; from name: libaot-Xamarin.AndroidX.Loader
		i64 u0x000000003b171bfb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 269
	%struct.DSOCacheEntry {
		i64 u0x0000000056db2462, ; from name: aot-System.Collections.NonGeneric
		i64 u0x0000000045a298d3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 270
	%struct.DSOCacheEntry {
		i64 u0x0000000056fc029e, ; from name: aot-Microsoft.Extensions.Hosting.Abstractions
		i64 u0x000000002e5c9414, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Microsoft.Extensions.Hosting.Abstractions.dll.so
		ptr null; void* handle
	}, ; 271
	%struct.DSOCacheEntry {
		i64 u0x0000000057456fc4, ; from name: libaot-Xamarin.AndroidX.Fragment.so
		i64 u0x00000000a7e7a8bf, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 272
	%struct.DSOCacheEntry {
		i64 u0x0000000057924923, ; from name: Xamarin.AndroidX.AppCompat.AppCompatResources
		i64 u0x0000000032abb588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		ptr null; void* handle
	}, ; 273
	%struct.DSOCacheEntry {
		i64 u0x0000000057a5e912, ; from name: Microsoft.Extensions.Primitives
		i64 u0x0000000045840300, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Microsoft.Extensions.Primitives.dll.so
		ptr null; void* handle
	}, ; 274
	%struct.DSOCacheEntry {
		i64 u0x0000000057c93dd4, ; from name: libaot-Xamarin.AndroidX.Collection.Jvm.dll.so
		i64 u0x0000000057c93dd4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-Xamarin.AndroidX.Collection.Jvm.dll.so
		ptr null; void* handle
	}, ; 275
	%struct.DSOCacheEntry {
		i64 u0x00000000581ec19b, ; from name: libaot-_Microsoft.Android.Resource.Designer
		i64 u0x00000000cee56696, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 276
	%struct.DSOCacheEntry {
		i64 u0x0000000058393db1, ; from name: libaot-Xamarin.AndroidX.Fragment
		i64 u0x00000000a7e7a8bf, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 277
	%struct.DSOCacheEntry {
		i64 u0x0000000058724f0e, ; from name: System.Runtime.Numerics.dll.so
		i64 u0x00000000ad907b53, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle
	}, ; 278
	%struct.DSOCacheEntry {
		i64 u0x0000000058ba13b2, ; from name: aot-Xamarin.AndroidX.AppCompat
		i64 u0x00000000b8fa92b4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 279
	%struct.DSOCacheEntry {
		i64 u0x0000000059a1a56a, ; from name: aot-System.Runtime
		i64 u0x0000000087de61a5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 280
	%struct.DSOCacheEntry {
		i64 u0x0000000059da8f0c, ; from name: aot-Xamarin.Kotlin.StdLib.so
		i64 u0x000000000e003282, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 281
	%struct.DSOCacheEntry {
		i64 u0x000000005a2e2c5d, ; from name: aot-Microsoft.Extensions.Logging.Abstractions
		i64 u0x000000007d853e51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Microsoft.Extensions.Logging.Abstractions.dll.so
		ptr null; void* handle
	}, ; 282
	%struct.DSOCacheEntry {
		i64 u0x000000005a7e2e0e, ; from name: libaot-System.Collections.NonGeneric
		i64 u0x0000000045a298d3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 283
	%struct.DSOCacheEntry {
		i64 u0x000000005ac93109, ; from name: libaot-System.Private.CoreLib.so
		i64 u0x00000000f5dad612, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 284
	%struct.DSOCacheEntry {
		i64 u0x000000005b27178b, ; from name: aot-Microsoft.Extensions.Hosting.Abstractions.dll.so
		i64 u0x000000002e5c9414, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Microsoft.Extensions.Hosting.Abstractions.dll.so
		ptr null; void* handle
	}, ; 285
	%struct.DSOCacheEntry {
		i64 u0x000000005b4eba7a, ; from name: aot-Microsoft.Extensions.Logging.Abstractions.so
		i64 u0x000000007d853e51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Microsoft.Extensions.Logging.Abstractions.dll.so
		ptr null; void* handle
	}, ; 286
	%struct.DSOCacheEntry {
		i64 u0x000000005b607bb8, ; from name: Xamarin.AndroidX.SavedState.SavedState.Android.dll.so
		i64 u0x000000000418b010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Xamarin.AndroidX.SavedState.SavedState.Android.dll.so
		ptr null; void* handle
	}, ; 287
	%struct.DSOCacheEntry {
		i64 u0x000000005b9278ea, ; from name: Microsoft.Extensions.Hosting.Abstractions.dll.so
		i64 u0x000000002e5c9414, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Microsoft.Extensions.Hosting.Abstractions.dll.so
		ptr null; void* handle
	}, ; 288
	%struct.DSOCacheEntry {
		i64 u0x000000005b9c2937, ; from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android
		i64 u0x000000008c4f6181, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so
		ptr null; void* handle
	}, ; 289
	%struct.DSOCacheEntry {
		i64 u0x000000005b9f86f9, ; from name: aot-Xamarin.Google.Android.Material.so
		i64 u0x00000000a0778edb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Xamarin.Google.Android.Material.dll.so
		ptr null; void* handle
	}, ; 290
	%struct.DSOCacheEntry {
		i64 u0x000000005d68193d, ; from name: libaot-Mono.Android.Runtime.so
		i64 u0x000000009f9275a1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.92_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 291
	%struct.DSOCacheEntry {
		i64 u0x000000005ec1fa0d, ; from name: libaot-System.ObjectModel.so
		i64 u0x000000004f0f9830, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 292
	%struct.DSOCacheEntry {
		i64 u0x0000000060d97228, ; from name: Xamarin.AndroidX.ViewPager2
		i64 u0x000000001641ea28, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Xamarin.AndroidX.ViewPager2.dll.so
		ptr null; void* handle
	}, ; 293
	%struct.DSOCacheEntry {
		i64 u0x000000006188ba7e, ; from name: Xamarin.AndroidX.CursorAdapter
		i64 u0x000000004057e9b0, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.CursorAdapter.dll.so
		ptr null; void* handle
	}, ; 294
	%struct.DSOCacheEntry {
		i64 u0x000000006189430b, ; from name: Mono.Android.Runtime.dll.so
		i64 u0x000000009f9275a1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.92_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 295
	%struct.DSOCacheEntry {
		i64 u0x0000000061994bff, ; from name: aot-System.Private.Xml.dll.so
		i64 u0x00000000c24a5970, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 296
	%struct.DSOCacheEntry {
		i64 u0x0000000061c036ca, ; from name: System.Text.RegularExpressions
		i64 u0x000000000eb7b864, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 297
	%struct.DSOCacheEntry {
		i64 u0x0000000061f3d56a, ; from name: aot-System.Linq.Expressions
		i64 u0x00000000c4588d67, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 298
	%struct.DSOCacheEntry {
		i64 u0x000000006271c382, ; from name: aot-Xamarin.AndroidX.Core
		i64 u0x0000000003b7ead2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 299
	%struct.DSOCacheEntry {
		i64 u0x0000000062c6282e, ; from name: System.Runtime
		i64 u0x0000000087de61a5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 300
	%struct.DSOCacheEntry {
		i64 u0x0000000062e64b62, ; from name: libaot-System.Collections.Concurrent.so
		i64 u0x00000000681f5cdc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 301
	%struct.DSOCacheEntry {
		i64 u0x0000000062f3b49d, ; from name: libaot-System.Formats.Asn1.so
		i64 u0x00000000c3325126, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle
	}, ; 302
	%struct.DSOCacheEntry {
		i64 u0x0000000063578134, ; from name: libaot-Xamarin.AndroidX.Navigation.Fragment.so
		i64 u0x00000000d57031b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		ptr null; void* handle
	}, ; 303
	%struct.DSOCacheEntry {
		i64 u0x00000000636f387b, ; from name: libaot-Microsoft.Extensions.DependencyInjection.so
		i64 u0x0000000042d22978, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.dll.so
		ptr null; void* handle
	}, ; 304
	%struct.DSOCacheEntry {
		i64 u0x00000000637c296f, ; from name: aot-Xamarin.AndroidX.ViewPager2.so
		i64 u0x000000001641ea28, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Xamarin.AndroidX.ViewPager2.dll.so
		ptr null; void* handle
	}, ; 305
	%struct.DSOCacheEntry {
		i64 u0x00000000641f3e5a, ; from name: System.Security.Cryptography
		i64 u0x00000000d72c936f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 306
	%struct.DSOCacheEntry {
		i64 u0x0000000064ee00b9, ; from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.so
		i64 u0x000000009abadfdb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so
		ptr null; void* handle
	}, ; 307
	%struct.DSOCacheEntry {
		i64 u0x0000000065702383, ; from name: libaot-Xamarin.AndroidX.DrawerLayout
		i64 u0x00000000a2e5eb85, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 308
	%struct.DSOCacheEntry {
		i64 u0x000000006626f428, ; from name: aot-Concurso.dll.so
		i64 u0x000000004d94027c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libaot-Concurso.dll.so
		ptr null; void* handle
	}, ; 309
	%struct.DSOCacheEntry {
		i64 u0x0000000066bc2c40, ; from name: aot-Xamarin.AndroidX.Activity
		i64 u0x00000000915782e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 310
	%struct.DSOCacheEntry {
		i64 u0x0000000066d0dd44, ; from name: aot-System.IO.Pipelines.so
		i64 u0x000000002c56a78d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.IO.Pipelines.dll.so
		ptr null; void* handle
	}, ; 311
	%struct.DSOCacheEntry {
		i64 u0x000000006779d44a, ; from name: libaot-System.ComponentModel.Primitives.so
		i64 u0x0000000013221fbc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 312
	%struct.DSOCacheEntry {
		i64 u0x0000000067eac72b, ; from name: aot-Xamarin.AndroidX.ViewPager.dll.so
		i64 u0x00000000c5fee763, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Xamarin.AndroidX.ViewPager.dll.so
		ptr null; void* handle
	}, ; 313
	%struct.DSOCacheEntry {
		i64 u0x00000000681f5cdc, ; from name: libaot-System.Collections.Concurrent.dll.so
		i64 u0x00000000681f5cdc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 314
	%struct.DSOCacheEntry {
		i64 u0x00000000685591cb, ; from name: aot-System.Runtime.so
		i64 u0x0000000087de61a5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 315
	%struct.DSOCacheEntry {
		i64 u0x0000000068ae471f, ; from name: aot-System.Drawing.Primitives.dll.so
		i64 u0x00000000508a690d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle
	}, ; 316
	%struct.DSOCacheEntry {
		i64 u0x0000000068c5b5e9, ; from name: Xamarin.Google.Android.Material.dll.so
		i64 u0x00000000a0778edb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Xamarin.Google.Android.Material.dll.so
		ptr null; void* handle
	}, ; 317
	%struct.DSOCacheEntry {
		i64 u0x0000000068ff7754, ; from name: System.Numerics.Vectors.dll.so
		i64 u0x0000000095f63711, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle
	}, ; 318
	%struct.DSOCacheEntry {
		i64 u0x00000000694750ce, ; from name: aot-Microsoft.Extensions.Logging.so
		i64 u0x000000009faac168, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Microsoft.Extensions.Logging.dll.so
		ptr null; void* handle
	}, ; 319
	%struct.DSOCacheEntry {
		i64 u0x000000006947f945, ; from name: Xamarin.AndroidX.SwipeRefreshLayout
		i64 u0x00000000f52a5c06, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		ptr null; void* handle
	}, ; 320
	%struct.DSOCacheEntry {
		i64 u0x0000000069864c69, ; from name: libaot-Microsoft.Maui.dll.so
		i64 u0x0000000069864c69, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Microsoft.Maui.dll.so
		ptr null; void* handle
	}, ; 321
	%struct.DSOCacheEntry {
		i64 u0x000000006a6826d8, ; from name: libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		i64 u0x000000006a6826d8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		ptr null; void* handle
	}, ; 322
	%struct.DSOCacheEntry {
		i64 u0x000000006a6d71ec, ; from name: System.Net.Primitives.so
		i64 u0x000000009dc5271e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 323
	%struct.DSOCacheEntry {
		i64 u0x000000006a96652d, ; from name: Xamarin.AndroidX.Fragment
		i64 u0x00000000a7e7a8bf, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 324
	%struct.DSOCacheEntry {
		i64 u0x000000006bcd3296, ; from name: Xamarin.AndroidX.Loader
		i64 u0x000000003b171bfb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 325
	%struct.DSOCacheEntry {
		i64 u0x000000006c13413e, ; from name: Xamarin.Google.Android.Material
		i64 u0x00000000a0778edb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Xamarin.Google.Android.Material.dll.so
		ptr null; void* handle
	}, ; 326
	%struct.DSOCacheEntry {
		i64 u0x000000006c473149, ; from name: aot-Microsoft.Extensions.Configuration.Abstractions
		i64 u0x000000006a6826d8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		ptr null; void* handle
	}, ; 327
	%struct.DSOCacheEntry {
		i64 u0x000000006c698ff0, ; from name: System.ComponentModel.TypeConverter.so
		i64 u0x0000000081847c35, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 328
	%struct.DSOCacheEntry {
		i64 u0x000000006ca8bc02, ; from name: libaot-System.Text.Encodings.Web.dll.so
		i64 u0x000000006ca8bc02, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle
	}, ; 329
	%struct.DSOCacheEntry {
		i64 u0x000000006d72895b, ; from name: aot-Microsoft.Extensions.Configuration.dll.so
		i64 u0x00000000b1c9d684, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-Microsoft.Extensions.Configuration.dll.so
		ptr null; void* handle
	}, ; 330
	%struct.DSOCacheEntry {
		i64 u0x000000006de1f6f5, ; from name: libaot-Microsoft.Extensions.Configuration.so
		i64 u0x00000000b1c9d684, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-Microsoft.Extensions.Configuration.dll.so
		ptr null; void* handle
	}, ; 331
	%struct.DSOCacheEntry {
		i64 u0x000000006ead11ed, ; from name: System.Formats.Asn1.so
		i64 u0x00000000c3325126, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle
	}, ; 332
	%struct.DSOCacheEntry {
		i64 u0x000000006ec71a65, ; from name: System.Linq.Expressions
		i64 u0x00000000c4588d67, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 333
	%struct.DSOCacheEntry {
		i64 u0x000000006f5e1d44, ; from name: aot-Xamarin.AndroidX.CustomView.dll.so
		i64 u0x0000000080dfe53f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.CustomView.dll.so
		ptr null; void* handle
	}, ; 334
	%struct.DSOCacheEntry {
		i64 u0x0000000070e955a5, ; from name: aot-Xamarin.AndroidX.Navigation.Common.Android
		i64 u0x00000000078ea0f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Xamarin.AndroidX.Navigation.Common.Android.dll.so
		ptr null; void* handle
	}, ; 335
	%struct.DSOCacheEntry {
		i64 u0x00000000710541ba, ; from name: aot-System.IO.Compression.Brotli.dll.so
		i64 u0x00000000e9f3ecfe, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle
	}, ; 336
	%struct.DSOCacheEntry {
		i64 u0x00000000710bfa76, ; from name: aot-Xamarin.AndroidX.DrawerLayout.so
		i64 u0x00000000a2e5eb85, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 337
	%struct.DSOCacheEntry {
		i64 u0x00000000712f78f1, ; from name: aot-Xamarin.AndroidX.SavedState.SavedState.Android.dll.so
		i64 u0x000000000418b010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Xamarin.AndroidX.SavedState.SavedState.Android.dll.so
		ptr null; void* handle
	}, ; 338
	%struct.DSOCacheEntry {
		i64 u0x00000000714af9d2, ; from name: libaot-System.Net.Http
		i64 u0x000000003b9fa69c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle
	}, ; 339
	%struct.DSOCacheEntry {
		i64 u0x00000000716accae, ; from name: libaot-System.Xml.ReaderWriter.dll.so
		i64 u0x00000000716accae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle
	}, ; 340
	%struct.DSOCacheEntry {
		i64 u0x0000000071e9cafa, ; from name: aot-System.Security.Cryptography.dll.so
		i64 u0x00000000d72c936f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 341
	%struct.DSOCacheEntry {
		i64 u0x000000007242e646, ; from name: libaot-_Microsoft.Android.Resource.Designer.so
		i64 u0x00000000cee56696, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 342
	%struct.DSOCacheEntry {
		i64 u0x00000000724739cf, ; from name: libaot-System.ComponentModel.TypeConverter
		i64 u0x0000000081847c35, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 343
	%struct.DSOCacheEntry {
		i64 u0x000000007249e2d0, ; from name: libaot-System.Drawing.Primitives.so
		i64 u0x00000000508a690d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle
	}, ; 344
	%struct.DSOCacheEntry {
		i64 u0x0000000072deccf8, ; from name: Xamarin.AndroidX.Navigation.Fragment.dll.so
		i64 u0x00000000d57031b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		ptr null; void* handle
	}, ; 345
	%struct.DSOCacheEntry {
		i64 u0x0000000072e88b63, ; from name: aot-System.IO.Compression.Brotli.so
		i64 u0x00000000e9f3ecfe, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle
	}, ; 346
	%struct.DSOCacheEntry {
		i64 u0x0000000073963daa, ; from name: aot-System.Console
		i64 u0x0000000096dcc630, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 347
	%struct.DSOCacheEntry {
		i64 u0x0000000073eac832, ; from name: Xamarin.AndroidX.AppCompat.so
		i64 u0x00000000b8fa92b4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 348
	%struct.DSOCacheEntry {
		i64 u0x00000000741395f0, ; from name: Xamarin.AndroidX.CursorAdapter.dll.so
		i64 u0x000000004057e9b0, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.CursorAdapter.dll.so
		ptr null; void* handle
	}, ; 349
	%struct.DSOCacheEntry {
		i64 u0x00000000747626d0, ; from name: aot-System.Private.Uri.dll.so
		i64 u0x0000000099cbecc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 350
	%struct.DSOCacheEntry {
		i64 u0x000000007483ee00, ; from name: libaot-System.Console
		i64 u0x0000000096dcc630, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 351
	%struct.DSOCacheEntry {
		i64 u0x00000000748957a4, ; from name: aot-Concurso
		i64 u0x000000004d94027c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libaot-Concurso.dll.so
		ptr null; void* handle
	}, ; 352
	%struct.DSOCacheEntry {
		i64 u0x0000000074eac139, ; from name: aot-System.ComponentModel
		i64 u0x000000005334092f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 353
	%struct.DSOCacheEntry {
		i64 u0x00000000753fcadc, ; from name: libaot-Xamarin.AndroidX.ViewPager2
		i64 u0x000000001641ea28, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Xamarin.AndroidX.ViewPager2.dll.so
		ptr null; void* handle
	}, ; 354
	%struct.DSOCacheEntry {
		i64 u0x00000000756e3671, ; from name: System.ComponentModel.Primitives.dll.so
		i64 u0x0000000013221fbc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 355
	%struct.DSOCacheEntry {
		i64 u0x000000007587ffc6, ; from name: aot-System.Linq.dll.so
		i64 u0x000000003812966e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 356
	%struct.DSOCacheEntry {
		i64 u0x0000000075bfa098, ; from name: libaot-Java.Interop
		i64 u0x000000007e561493, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.91_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 357
	%struct.DSOCacheEntry {
		i64 u0x0000000077983ee6, ; from name: libaot-Xamarin.AndroidX.CursorAdapter.so
		i64 u0x000000004057e9b0, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.CursorAdapter.dll.so
		ptr null; void* handle
	}, ; 358
	%struct.DSOCacheEntry {
		i64 u0x0000000077bef378, ; from name: libaot-System.IO.Compression.Brotli.so
		i64 u0x00000000e9f3ecfe, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle
	}, ; 359
	%struct.DSOCacheEntry {
		i64 u0x0000000077c79f26, ; from name: System.Diagnostics.DiagnosticSource.dll.so
		i64 u0x0000000091f7d332, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 360
	%struct.DSOCacheEntry {
		i64 u0x000000007816b13b, ; from name: aot-_Microsoft.Android.Resource.Designer.dll.so
		i64 u0x00000000cee56696, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 361
	%struct.DSOCacheEntry {
		i64 u0x00000000788638d0, ; from name: aot-Xamarin.AndroidX.Navigation.UI.so
		i64 u0x00000000141cb47a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Xamarin.AndroidX.Navigation.UI.dll.so
		ptr null; void* handle
	}, ; 362
	%struct.DSOCacheEntry {
		i64 u0x000000007964b5a4, ; from name: aot-Xamarin.AndroidX.Navigation.UI.dll.so
		i64 u0x00000000141cb47a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Xamarin.AndroidX.Navigation.UI.dll.so
		ptr null; void* handle
	}, ; 363
	%struct.DSOCacheEntry {
		i64 u0x00000000799f7d62, ; from name: aot-Xamarin.KotlinX.Serialization.Core.Jvm.so
		i64 u0x00000000f1077784, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Xamarin.KotlinX.Serialization.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 364
	%struct.DSOCacheEntry {
		i64 u0x0000000079cce98e, ; from name: aot-System.ComponentModel.dll.so
		i64 u0x000000005334092f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 365
	%struct.DSOCacheEntry {
		i64 u0x0000000079eb68ee, ; from name: System.Private.Xml
		i64 u0x00000000c24a5970, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 366
	%struct.DSOCacheEntry {
		i64 u0x000000007a139b40, ; from name: Xamarin.Google.Android.Material.so
		i64 u0x00000000a0778edb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Xamarin.Google.Android.Material.dll.so
		ptr null; void* handle
	}, ; 367
	%struct.DSOCacheEntry {
		i64 u0x000000007b0589d0, ; from name: Microsoft.Maui.Essentials.so
		i64 u0x0000000085d2bea6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Microsoft.Maui.Essentials.dll.so
		ptr null; void* handle
	}, ; 368
	%struct.DSOCacheEntry {
		i64 u0x000000007b7fdaa3, ; from name: aot-Microsoft.Extensions.DependencyInjection
		i64 u0x0000000042d22978, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.dll.so
		ptr null; void* handle
	}, ; 369
	%struct.DSOCacheEntry {
		i64 u0x000000007c6d37a6, ; from name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.so
		i64 u0x00000000a4839a3e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 370
	%struct.DSOCacheEntry {
		i64 u0x000000007c9bf920, ; from name: System.Numerics.Vectors
		i64 u0x0000000095f63711, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle
	}, ; 371
	%struct.DSOCacheEntry {
		i64 u0x000000007ca8512d, ; from name: libaot-Microsoft.Extensions.Diagnostics.Abstractions
		i64 u0x00000000537d157f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Microsoft.Extensions.Diagnostics.Abstractions.dll.so
		ptr null; void* handle
	}, ; 372
	%struct.DSOCacheEntry {
		i64 u0x000000007cfe5915, ; from name: Microsoft.Extensions.DependencyInjection.dll.so
		i64 u0x0000000042d22978, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.dll.so
		ptr null; void* handle
	}, ; 373
	%struct.DSOCacheEntry {
		i64 u0x000000007d3987fa, ; from name: libaot-Microsoft.Maui.so
		i64 u0x0000000069864c69, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Microsoft.Maui.dll.so
		ptr null; void* handle
	}, ; 374
	%struct.DSOCacheEntry {
		i64 u0x000000007d450f90, ; from name: System.ComponentModel.Primitives.so
		i64 u0x0000000013221fbc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 375
	%struct.DSOCacheEntry {
		i64 u0x000000007d853e51, ; from name: libaot-Microsoft.Extensions.Logging.Abstractions.dll.so
		i64 u0x000000007d853e51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Microsoft.Extensions.Logging.Abstractions.dll.so
		ptr null; void* handle
	}, ; 376
	%struct.DSOCacheEntry {
		i64 u0x000000007e196819, ; from name: aot-System.Collections.Concurrent
		i64 u0x00000000681f5cdc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 377
	%struct.DSOCacheEntry {
		i64 u0x000000007e561493, ; from name: libaot-Java.Interop.dll.so
		i64 u0x000000007e561493, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.91_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 378
	%struct.DSOCacheEntry {
		i64 u0x000000007ec9ffe9, ; from name: System.Console
		i64 u0x0000000096dcc630, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 379
	%struct.DSOCacheEntry {
		i64 u0x000000007f11cc9d, ; from name: Microsoft.Extensions.FileProviders.Abstractions.dll.so
		i64 u0x00000000a7fa0e4d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		ptr null; void* handle
	}, ; 380
	%struct.DSOCacheEntry {
		i64 u0x000000007f5bfc94, ; from name: libaot-Microsoft.Extensions.Logging.Abstractions.so
		i64 u0x000000007d853e51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Microsoft.Extensions.Logging.Abstractions.dll.so
		ptr null; void* handle
	}, ; 381
	%struct.DSOCacheEntry {
		i64 u0x000000007fb38cd2, ; from name: System.Collections.Specialized
		i64 u0x00000000a8bf5d10, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 382
	%struct.DSOCacheEntry {
		i64 u0x00000000801e2c57, ; from name: aot-System.Threading.dll.so
		i64 u0x00000000f97d7588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 383
	%struct.DSOCacheEntry {
		i64 u0x0000000080bd55ad, ; from name: Microsoft.Maui
		i64 u0x0000000069864c69, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Microsoft.Maui.dll.so
		ptr null; void* handle
	}, ; 384
	%struct.DSOCacheEntry {
		i64 u0x0000000080d770b0, ; from name: aot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		i64 u0x00000000a7fa0e4d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		ptr null; void* handle
	}, ; 385
	%struct.DSOCacheEntry {
		i64 u0x0000000080dfe53f, ; from name: libaot-Xamarin.AndroidX.CustomView.dll.so
		i64 u0x0000000080dfe53f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.CustomView.dll.so
		ptr null; void* handle
	}, ; 386
	%struct.DSOCacheEntry {
		i64 u0x000000008129f7e2, ; from name: libaot-Microsoft.Maui.Controls
		i64 u0x000000003cd51dd1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Microsoft.Maui.Controls.dll.so
		ptr null; void* handle
	}, ; 387
	%struct.DSOCacheEntry {
		i64 u0x000000008138def7, ; from name: aot-Microsoft.Maui.Graphics.dll.so
		i64 u0x00000000313c4c9a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Microsoft.Maui.Graphics.dll.so
		ptr null; void* handle
	}, ; 388
	%struct.DSOCacheEntry {
		i64 u0x00000000813e704d, ; from name: aot-System.Private.Xml.so
		i64 u0x00000000c24a5970, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 389
	%struct.DSOCacheEntry {
		i64 u0x00000000815a369a, ; from name: libaot-System.Private.Xml
		i64 u0x00000000c24a5970, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 390
	%struct.DSOCacheEntry {
		i64 u0x0000000081847c35, ; from name: libaot-System.ComponentModel.TypeConverter.dll.so
		i64 u0x0000000081847c35, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 391
	%struct.DSOCacheEntry {
		i64 u0x00000000825a4144, ; from name: aot-Microsoft.Extensions.Diagnostics.Abstractions.dll.so
		i64 u0x00000000537d157f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Microsoft.Extensions.Diagnostics.Abstractions.dll.so
		ptr null; void* handle
	}, ; 392
	%struct.DSOCacheEntry {
		i64 u0x00000000827b2589, ; from name: libaot-System.Security.Cryptography.so
		i64 u0x00000000d72c936f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 393
	%struct.DSOCacheEntry {
		i64 u0x0000000082a8237c, ; from name: Microsoft.Extensions.Logging.Abstractions
		i64 u0x000000007d853e51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Microsoft.Extensions.Logging.Abstractions.dll.so
		ptr null; void* handle
	}, ; 394
	%struct.DSOCacheEntry {
		i64 u0x0000000082f0bee0, ; from name: Xamarin.AndroidX.Loader.so
		i64 u0x000000003b171bfb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 395
	%struct.DSOCacheEntry {
		i64 u0x000000008334206b, ; from name: System.Net.Http
		i64 u0x000000003b9fa69c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle
	}, ; 396
	%struct.DSOCacheEntry {
		i64 u0x0000000083cefd8a, ; from name: aot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		i64 u0x00000000b0dedb6b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		ptr null; void* handle
	}, ; 397
	%struct.DSOCacheEntry {
		i64 u0x0000000083d4e3c0, ; from name: aot-Microsoft.Maui.dll.so
		i64 u0x0000000069864c69, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Microsoft.Maui.dll.so
		ptr null; void* handle
	}, ; 398
	%struct.DSOCacheEntry {
		i64 u0x000000008479d867, ; from name: aot-Microsoft.Extensions.Hosting.Abstractions.so
		i64 u0x000000002e5c9414, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Microsoft.Extensions.Hosting.Abstractions.dll.so
		ptr null; void* handle
	}, ; 399
	%struct.DSOCacheEntry {
		i64 u0x000000008488661d, ; from name: libaot-System.ComponentModel.Primitives
		i64 u0x0000000013221fbc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 400
	%struct.DSOCacheEntry {
		i64 u0x0000000084a9383f, ; from name: Microsoft.Extensions.Logging.dll.so
		i64 u0x000000009faac168, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Microsoft.Extensions.Logging.dll.so
		ptr null; void* handle
	}, ; 401
	%struct.DSOCacheEntry {
		i64 u0x000000008527ac89, ; from name: libaot-System.Text.RegularExpressions.so
		i64 u0x000000000eb7b864, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 402
	%struct.DSOCacheEntry {
		i64 u0x000000008568de13, ; from name: libaot-Xamarin.AndroidX.Loader.so
		i64 u0x000000003b171bfb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 403
	%struct.DSOCacheEntry {
		i64 u0x0000000085713c5d, ; from name: Xamarin.AndroidX.Navigation.Runtime.Android.so
		i64 u0x000000002cce3b68, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Xamarin.AndroidX.Navigation.Runtime.Android.dll.so
		ptr null; void* handle
	}, ; 404
	%struct.DSOCacheEntry {
		i64 u0x0000000085a17d03, ; from name: libaot-Xamarin.AndroidX.RecyclerView
		i64 u0x00000000533f79e3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Xamarin.AndroidX.RecyclerView.dll.so
		ptr null; void* handle
	}, ; 405
	%struct.DSOCacheEntry {
		i64 u0x0000000085d2bea6, ; from name: libaot-Microsoft.Maui.Essentials.dll.so
		i64 u0x0000000085d2bea6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Microsoft.Maui.Essentials.dll.so
		ptr null; void* handle
	}, ; 406
	%struct.DSOCacheEntry {
		i64 u0x00000000860909ef, ; from name: aot-Microsoft.Extensions.Options
		i64 u0x000000003ce4cf8f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Microsoft.Extensions.Options.dll.so
		ptr null; void* handle
	}, ; 407
	%struct.DSOCacheEntry {
		i64 u0x0000000086ea6b74, ; from name: System.Text.RegularExpressions.so
		i64 u0x000000000eb7b864, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 408
	%struct.DSOCacheEntry {
		i64 u0x000000008703dfd2, ; from name: aot-Xamarin.AndroidX.RecyclerView
		i64 u0x00000000533f79e3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Xamarin.AndroidX.RecyclerView.dll.so
		ptr null; void* handle
	}, ; 409
	%struct.DSOCacheEntry {
		i64 u0x00000000871c9c1b, ; from name: Microsoft.Extensions.Configuration.Abstractions
		i64 u0x000000006a6826d8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		ptr null; void* handle
	}, ; 410
	%struct.DSOCacheEntry {
		i64 u0x0000000087de61a5, ; from name: libaot-System.Runtime.dll.so
		i64 u0x0000000087de61a5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 411
	%struct.DSOCacheEntry {
		i64 u0x00000000880e7ab6, ; from name: aot-Xamarin.AndroidX.Fragment
		i64 u0x00000000a7e7a8bf, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 412
	%struct.DSOCacheEntry {
		i64 u0x00000000881c0d3f, ; from name: aot-Xamarin.Kotlin.StdLib.dll.so
		i64 u0x000000000e003282, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 413
	%struct.DSOCacheEntry {
		i64 u0x0000000088280cba, ; from name: aot-Xamarin.AndroidX.Navigation.Runtime.Android.so
		i64 u0x000000002cce3b68, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Xamarin.AndroidX.Navigation.Runtime.Android.dll.so
		ptr null; void* handle
	}, ; 414
	%struct.DSOCacheEntry {
		i64 u0x00000000882ba77e, ; from name: aot-Xamarin.AndroidX.CursorAdapter.dll.so
		i64 u0x000000004057e9b0, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.CursorAdapter.dll.so
		ptr null; void* handle
	}, ; 415
	%struct.DSOCacheEntry {
		i64 u0x0000000088b53dd1, ; from name: aot-System.Threading.so
		i64 u0x00000000f97d7588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 416
	%struct.DSOCacheEntry {
		i64 u0x0000000088e9e4db, ; from name: libaot-Microsoft.Extensions.FileProviders.Abstractions
		i64 u0x00000000a7fa0e4d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		ptr null; void* handle
	}, ; 417
	%struct.DSOCacheEntry {
		i64 u0x000000008918fb3c, ; from name: aot-Java.Interop.dll.so
		i64 u0x000000007e561493, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.91_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 418
	%struct.DSOCacheEntry {
		i64 u0x000000008a21eece, ; from name: Microsoft.Maui.Controls.Xaml.so
		i64 u0x000000002d6103aa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Microsoft.Maui.Controls.Xaml.dll.so
		ptr null; void* handle
	}, ; 419
	%struct.DSOCacheEntry {
		i64 u0x000000008abfdf8b, ; from name: System.Private.Xml.dll.so
		i64 u0x00000000c24a5970, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 420
	%struct.DSOCacheEntry {
		i64 u0x000000008b320450, ; from name: libaot-System.Diagnostics.DiagnosticSource.so
		i64 u0x0000000091f7d332, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 421
	%struct.DSOCacheEntry {
		i64 u0x000000008b4c97a0, ; from name: libaot-Xamarin.AndroidX.ViewPager2.so
		i64 u0x000000001641ea28, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Xamarin.AndroidX.ViewPager2.dll.so
		ptr null; void* handle
	}, ; 422
	%struct.DSOCacheEntry {
		i64 u0x000000008bbc0be1, ; from name: libaot-System.Runtime.InteropServices.dll.so
		i64 u0x000000008bbc0be1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 423
	%struct.DSOCacheEntry {
		i64 u0x000000008c40e0db, ; from name: System.Net.Primitives
		i64 u0x000000009dc5271e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 424
	%struct.DSOCacheEntry {
		i64 u0x000000008c4f6181, ; from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so
		i64 u0x000000008c4f6181, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so
		ptr null; void* handle
	}, ; 425
	%struct.DSOCacheEntry {
		i64 u0x000000008d52b2e2, ; from name: Microsoft.Extensions.Configuration
		i64 u0x00000000b1c9d684, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-Microsoft.Extensions.Configuration.dll.so
		ptr null; void* handle
	}, ; 426
	%struct.DSOCacheEntry {
		i64 u0x000000008dd46f6f, ; from name: libaot-System.Collections.so
		i64 u0x00000000d3d7eec4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 427
	%struct.DSOCacheEntry {
		i64 u0x000000008de7e49d, ; from name: Microsoft.Extensions.Configuration.Abstractions.dll.so
		i64 u0x000000006a6826d8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		ptr null; void* handle
	}, ; 428
	%struct.DSOCacheEntry {
		i64 u0x000000008dfd6576, ; from name: aot-System.Text.Json.so
		i64 u0x00000000a170e652, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle
	}, ; 429
	%struct.DSOCacheEntry {
		i64 u0x000000008e7071e7, ; from name: aot-System.Private.Xml
		i64 u0x00000000c24a5970, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 430
	%struct.DSOCacheEntry {
		i64 u0x000000008e788bdd, ; from name: System.Text.Encodings.Web.so
		i64 u0x000000006ca8bc02, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle
	}, ; 431
	%struct.DSOCacheEntry {
		i64 u0x000000008edb19b3, ; from name: aot-Microsoft.Maui.Controls.Xaml
		i64 u0x000000002d6103aa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Microsoft.Maui.Controls.Xaml.dll.so
		ptr null; void* handle
	}, ; 432
	%struct.DSOCacheEntry {
		i64 u0x000000008efc22de, ; from name: aot-Microsoft.Extensions.Configuration.so
		i64 u0x00000000b1c9d684, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-Microsoft.Extensions.Configuration.dll.so
		ptr null; void* handle
	}, ; 433
	%struct.DSOCacheEntry {
		i64 u0x000000008f71b3c1, ; from name: libaot-System.Runtime
		i64 u0x0000000087de61a5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 434
	%struct.DSOCacheEntry {
		i64 u0x000000008f8ce545, ; from name: System.Formats.Asn1.dll.so
		i64 u0x00000000c3325126, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle
	}, ; 435
	%struct.DSOCacheEntry {
		i64 u0x00000000900ed3b0, ; from name: System.Threading.Thread.so
		i64 u0x00000000dce000c2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle
	}, ; 436
	%struct.DSOCacheEntry {
		i64 u0x0000000090984d5e, ; from name: Microsoft.Maui.so
		i64 u0x0000000069864c69, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Microsoft.Maui.dll.so
		ptr null; void* handle
	}, ; 437
	%struct.DSOCacheEntry {
		i64 u0x00000000909a39bf, ; from name: System.IO.Compression.Brotli.dll.so
		i64 u0x00000000e9f3ecfe, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle
	}, ; 438
	%struct.DSOCacheEntry {
		i64 u0x0000000090da8fbe, ; from name: aot-Xamarin.AndroidX.CursorAdapter
		i64 u0x000000004057e9b0, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.CursorAdapter.dll.so
		ptr null; void* handle
	}, ; 439
	%struct.DSOCacheEntry {
		i64 u0x000000009102fb0f, ; from name: aot-System.Text.RegularExpressions
		i64 u0x000000000eb7b864, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 440
	%struct.DSOCacheEntry {
		i64 u0x00000000915782e2, ; from name: libaot-Xamarin.AndroidX.Activity.dll.so
		i64 u0x00000000915782e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 441
	%struct.DSOCacheEntry {
		i64 u0x0000000091ec9810, ; from name: System.Private.CoreLib.dll.so
		i64 u0x00000000f5dad612, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 442
	%struct.DSOCacheEntry {
		i64 u0x0000000091f7d332, ; from name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		i64 u0x0000000091f7d332, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 443
	%struct.DSOCacheEntry {
		i64 u0x000000009232e8d8, ; from name: aot-System.Linq
		i64 u0x000000003812966e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 444
	%struct.DSOCacheEntry {
		i64 u0x00000000923651e7, ; from name: aot-Microsoft.Maui.Essentials.dll.so
		i64 u0x0000000085d2bea6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Microsoft.Maui.Essentials.dll.so
		ptr null; void* handle
	}, ; 445
	%struct.DSOCacheEntry {
		i64 u0x00000000926c445f, ; from name: Xamarin.KotlinX.Serialization.Core.Jvm.so
		i64 u0x00000000f1077784, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Xamarin.KotlinX.Serialization.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 446
	%struct.DSOCacheEntry {
		i64 u0x00000000928ab1df, ; from name: System.Collections.dll.so
		i64 u0x00000000d3d7eec4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 447
	%struct.DSOCacheEntry {
		i64 u0x0000000092af9d69, ; from name: System.Collections.Concurrent.so
		i64 u0x00000000681f5cdc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 448
	%struct.DSOCacheEntry {
		i64 u0x0000000092d372ba, ; from name: Microsoft.Extensions.Configuration.dll.so
		i64 u0x00000000b1c9d684, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-Microsoft.Extensions.Configuration.dll.so
		ptr null; void* handle
	}, ; 449
	%struct.DSOCacheEntry {
		i64 u0x000000009316be7e, ; from name: aot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.so
		i64 u0x000000009abadfdb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so
		ptr null; void* handle
	}, ; 450
	%struct.DSOCacheEntry {
		i64 u0x000000009368e3aa, ; from name: System.Threading.Thread.dll.so
		i64 u0x00000000dce000c2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle
	}, ; 451
	%struct.DSOCacheEntry {
		i64 u0x0000000093dba8a1, ; from name: Microsoft.Maui.Controls
		i64 u0x000000003cd51dd1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Microsoft.Maui.Controls.dll.so
		ptr null; void* handle
	}, ; 452
	%struct.DSOCacheEntry {
		i64 u0x000000009425ae65, ; from name: Java.Interop.so
		i64 u0x000000007e561493, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.91_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 453
	%struct.DSOCacheEntry {
		i64 u0x00000000942c97ca, ; from name: aot-Microsoft.Extensions.DependencyInjection.Abstractions.so
		i64 u0x00000000b0dedb6b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		ptr null; void* handle
	}, ; 454
	%struct.DSOCacheEntry {
		i64 u0x00000000949a444a, ; from name: aot-System.IO.Pipelines.dll.so
		i64 u0x000000002c56a78d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.IO.Pipelines.dll.so
		ptr null; void* handle
	}, ; 455
	%struct.DSOCacheEntry {
		i64 u0x0000000095f63711, ; from name: libaot-System.Numerics.Vectors.dll.so
		i64 u0x0000000095f63711, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle
	}, ; 456
	%struct.DSOCacheEntry {
		i64 u0x0000000096dcc630, ; from name: libaot-System.Console.dll.so
		i64 u0x0000000096dcc630, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 457
	%struct.DSOCacheEntry {
		i64 u0x00000000975e12ea, ; from name: libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm.so
		i64 u0x000000004cae6f51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so
		ptr null; void* handle
	}, ; 458
	%struct.DSOCacheEntry {
		i64 u0x00000000976a9260, ; from name: libaot-System.so
		i64 u0x00000000d4110d87, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 459
	%struct.DSOCacheEntry {
		i64 u0x0000000097d1d366, ; from name: libaot-Microsoft.Extensions.Configuration
		i64 u0x00000000b1c9d684, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-Microsoft.Extensions.Configuration.dll.so
		ptr null; void* handle
	}, ; 460
	%struct.DSOCacheEntry {
		i64 u0x0000000098129075, ; from name: libaot-System.Console.so
		i64 u0x0000000096dcc630, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 461
	%struct.DSOCacheEntry {
		i64 u0x00000000982549dc, ; from name: libaot-System.Diagnostics.DiagnosticSource
		i64 u0x0000000091f7d332, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 462
	%struct.DSOCacheEntry {
		i64 u0x0000000098de6d02, ; from name: Xamarin.AndroidX.Navigation.Common.Android.dll.so
		i64 u0x00000000078ea0f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Xamarin.AndroidX.Navigation.Common.Android.dll.so
		ptr null; void* handle
	}, ; 463
	%struct.DSOCacheEntry {
		i64 u0x000000009930ee42, ; from name: System.Text.Encodings.Web
		i64 u0x000000006ca8bc02, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle
	}, ; 464
	%struct.DSOCacheEntry {
		i64 u0x0000000099a2f877, ; from name: aot-Microsoft.Extensions.Diagnostics.Abstractions
		i64 u0x00000000537d157f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Microsoft.Extensions.Diagnostics.Abstractions.dll.so
		ptr null; void* handle
	}, ; 465
	%struct.DSOCacheEntry {
		i64 u0x0000000099bb36c9, ; from name: aot-System.Text.RegularExpressions.dll.so
		i64 u0x000000000eb7b864, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 466
	%struct.DSOCacheEntry {
		i64 u0x0000000099c10f26, ; from name: libaot-Xamarin.Google.Android.Material.so
		i64 u0x00000000a0778edb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Xamarin.Google.Android.Material.dll.so
		ptr null; void* handle
	}, ; 467
	%struct.DSOCacheEntry {
		i64 u0x0000000099cbecc6, ; from name: libaot-System.Private.Uri.dll.so
		i64 u0x0000000099cbecc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 468
	%struct.DSOCacheEntry {
		i64 u0x0000000099faae71, ; from name: System.IO.Compression.dll.so
		i64 u0x00000000341d0942, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 469
	%struct.DSOCacheEntry {
		i64 u0x000000009a112264, ; from name: libaot-System.Text.RegularExpressions
		i64 u0x000000000eb7b864, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 470
	%struct.DSOCacheEntry {
		i64 u0x000000009a2a5e04, ; from name: aot-System.Private.Uri
		i64 u0x0000000099cbecc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 471
	%struct.DSOCacheEntry {
		i64 u0x000000009a83ffe1, ; from name: Microsoft.Extensions.FileProviders.Abstractions
		i64 u0x00000000a7fa0e4d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		ptr null; void* handle
	}, ; 472
	%struct.DSOCacheEntry {
		i64 u0x000000009abadfdb, ; from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so
		i64 u0x000000009abadfdb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so
		ptr null; void* handle
	}, ; 473
	%struct.DSOCacheEntry {
		i64 u0x000000009ac35c46, ; from name: System.Runtime.Numerics.so
		i64 u0x00000000ad907b53, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle
	}, ; 474
	%struct.DSOCacheEntry {
		i64 u0x000000009ac748ea, ; from name: aot-System.ComponentModel.TypeConverter.dll.so
		i64 u0x0000000081847c35, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 475
	%struct.DSOCacheEntry {
		i64 u0x000000009ae3c2f5, ; from name: Xamarin.AndroidX.ViewPager2.so
		i64 u0x000000001641ea28, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Xamarin.AndroidX.ViewPager2.dll.so
		ptr null; void* handle
	}, ; 476
	%struct.DSOCacheEntry {
		i64 u0x000000009b23744e, ; from name: aot-Xamarin.AndroidX.Navigation.Fragment
		i64 u0x00000000d57031b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		ptr null; void* handle
	}, ; 477
	%struct.DSOCacheEntry {
		i64 u0x000000009b31331a, ; from name: Xamarin.KotlinX.Coroutines.Core.Jvm.so
		i64 u0x00000000a4839a3e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 478
	%struct.DSOCacheEntry {
		i64 u0x000000009b500441, ; from name: Xamarin.KotlinX.Coroutines.Core.Jvm
		i64 u0x00000000a4839a3e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 479
	%struct.DSOCacheEntry {
		i64 u0x000000009bde8c40, ; from name: System.Private.Uri.so
		i64 u0x0000000099cbecc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 480
	%struct.DSOCacheEntry {
		i64 u0x000000009c2a4fe3, ; from name: System.Private.Uri.dll.so
		i64 u0x0000000099cbecc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 481
	%struct.DSOCacheEntry {
		i64 u0x000000009c413e3d, ; from name: aot-System.ObjectModel.so
		i64 u0x000000004f0f9830, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 482
	%struct.DSOCacheEntry {
		i64 u0x000000009c539f1a, ; from name: libaot-System.Numerics.Vectors.so
		i64 u0x0000000095f63711, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle
	}, ; 483
	%struct.DSOCacheEntry {
		i64 u0x000000009d4f2592, ; from name: System.dll.so
		i64 u0x00000000d4110d87, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 484
	%struct.DSOCacheEntry {
		i64 u0x000000009dc5271e, ; from name: libaot-System.Net.Primitives.dll.so
		i64 u0x000000009dc5271e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 485
	%struct.DSOCacheEntry {
		i64 u0x000000009e2b4872, ; from name: Microsoft.Extensions.Hosting.Abstractions.so
		i64 u0x000000002e5c9414, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Microsoft.Extensions.Hosting.Abstractions.dll.so
		ptr null; void* handle
	}, ; 486
	%struct.DSOCacheEntry {
		i64 u0x000000009e890b8f, ; from name: Xamarin.AndroidX.SwipeRefreshLayout.so
		i64 u0x00000000f52a5c06, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		ptr null; void* handle
	}, ; 487
	%struct.DSOCacheEntry {
		i64 u0x000000009ebd82c2, ; from name: Java.Interop.dll.so
		i64 u0x000000007e561493, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.91_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 488
	%struct.DSOCacheEntry {
		i64 u0x000000009ec4cf01, ; from name: System.Runtime.Loader
		i64 u0x000000000e65cd01, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.Runtime.Loader.dll.so
		ptr null; void* handle
	}, ; 489
	%struct.DSOCacheEntry {
		i64 u0x000000009ed873e2, ; from name: aot-System.Runtime.Numerics.so
		i64 u0x00000000ad907b53, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle
	}, ; 490
	%struct.DSOCacheEntry {
		i64 u0x000000009ee22cc0, ; from name: System.Drawing.Primitives
		i64 u0x00000000508a690d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle
	}, ; 491
	%struct.DSOCacheEntry {
		i64 u0x000000009f370d9b, ; from name: libaot-Microsoft.Maui.Graphics.so
		i64 u0x00000000313c4c9a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Microsoft.Maui.Graphics.dll.so
		ptr null; void* handle
	}, ; 492
	%struct.DSOCacheEntry {
		i64 u0x000000009f60bf5a, ; from name: aot-Xamarin.AndroidX.SavedState.SavedState.Android.so
		i64 u0x000000000418b010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Xamarin.AndroidX.SavedState.SavedState.Android.dll.so
		ptr null; void* handle
	}, ; 493
	%struct.DSOCacheEntry {
		i64 u0x000000009f9275a1, ; from name: libaot-Mono.Android.Runtime.dll.so
		i64 u0x000000009f9275a1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.92_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 494
	%struct.DSOCacheEntry {
		i64 u0x000000009faac168, ; from name: libaot-Microsoft.Extensions.Logging.dll.so
		i64 u0x000000009faac168, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Microsoft.Extensions.Logging.dll.so
		ptr null; void* handle
	}, ; 495
	%struct.DSOCacheEntry {
		i64 u0x00000000a00692b0, ; from name: aot-Xamarin.AndroidX.CardView.so
		i64 u0x00000000eaa1bb0f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-Xamarin.AndroidX.CardView.dll.so
		ptr null; void* handle
	}, ; 496
	%struct.DSOCacheEntry {
		i64 u0x00000000a0778edb, ; from name: libaot-Xamarin.Google.Android.Material.dll.so
		i64 u0x00000000a0778edb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Xamarin.Google.Android.Material.dll.so
		ptr null; void* handle
	}, ; 497
	%struct.DSOCacheEntry {
		i64 u0x00000000a0832cb8, ; from name: libaot-Xamarin.AndroidX.Navigation.UI
		i64 u0x00000000141cb47a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Xamarin.AndroidX.Navigation.UI.dll.so
		ptr null; void* handle
	}, ; 498
	%struct.DSOCacheEntry {
		i64 u0x00000000a12c5177, ; from name: libaot-Microsoft.Extensions.Options.so
		i64 u0x000000003ce4cf8f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Microsoft.Extensions.Options.dll.so
		ptr null; void* handle
	}, ; 499
	%struct.DSOCacheEntry {
		i64 u0x00000000a13d041d, ; from name: System.Private.CoreLib.so
		i64 u0x00000000f5dad612, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 500
	%struct.DSOCacheEntry {
		i64 u0x00000000a144a338, ; from name: aot-System.Drawing.dll.so
		i64 u0x0000000038a1e793, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle
	}, ; 501
	%struct.DSOCacheEntry {
		i64 u0x00000000a170e652, ; from name: libaot-System.Text.Json.dll.so
		i64 u0x00000000a170e652, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle
	}, ; 502
	%struct.DSOCacheEntry {
		i64 u0x00000000a1830303, ; from name: aot-Mono.Android
		i64 u0x00000000116fa401, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.93_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 503
	%struct.DSOCacheEntry {
		i64 u0x00000000a1be9a79, ; from name: aot-Xamarin.Google.Android.Material
		i64 u0x00000000a0778edb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-Xamarin.Google.Android.Material.dll.so
		ptr null; void* handle
	}, ; 504
	%struct.DSOCacheEntry {
		i64 u0x00000000a247da40, ; from name: aot-Microsoft.Extensions.Primitives
		i64 u0x0000000045840300, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Microsoft.Extensions.Primitives.dll.so
		ptr null; void* handle
	}, ; 505
	%struct.DSOCacheEntry {
		i64 u0x00000000a256c142, ; from name: libaot-System.Drawing.so
		i64 u0x0000000038a1e793, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle
	}, ; 506
	%struct.DSOCacheEntry {
		i64 u0x00000000a297ac88, ; from name: aot-System.Formats.Asn1.dll.so
		i64 u0x00000000c3325126, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle
	}, ; 507
	%struct.DSOCacheEntry {
		i64 u0x00000000a2e0939b, ; from name: Xamarin.AndroidX.Activity
		i64 u0x00000000915782e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 508
	%struct.DSOCacheEntry {
		i64 u0x00000000a2e5eb85, ; from name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		i64 u0x00000000a2e5eb85, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 509
	%struct.DSOCacheEntry {
		i64 u0x00000000a2f5ed8a, ; from name: aot-Microsoft.Extensions.FileProviders.Abstractions
		i64 u0x00000000a7fa0e4d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		ptr null; void* handle
	}, ; 510
	%struct.DSOCacheEntry {
		i64 u0x00000000a3090cfd, ; from name: Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		i64 u0x00000000a4839a3e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 511
	%struct.DSOCacheEntry {
		i64 u0x00000000a3108f05, ; from name: aot-Microsoft.Maui.so
		i64 u0x0000000069864c69, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Microsoft.Maui.dll.so
		ptr null; void* handle
	}, ; 512
	%struct.DSOCacheEntry {
		i64 u0x00000000a36bc3bc, ; from name: aot-Xamarin.AndroidX.ViewPager.so
		i64 u0x00000000c5fee763, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Xamarin.AndroidX.ViewPager.dll.so
		ptr null; void* handle
	}, ; 513
	%struct.DSOCacheEntry {
		i64 u0x00000000a3869d60, ; from name: aot-Microsoft.Maui.Controls.Xaml.dll.so
		i64 u0x000000002d6103aa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Microsoft.Maui.Controls.Xaml.dll.so
		ptr null; void* handle
	}, ; 514
	%struct.DSOCacheEntry {
		i64 u0x00000000a38e2497, ; from name: aot-System.Xml.ReaderWriter.so
		i64 u0x00000000716accae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle
	}, ; 515
	%struct.DSOCacheEntry {
		i64 u0x00000000a3de87ea, ; from name: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android
		i64 u0x000000008c4f6181, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so
		ptr null; void* handle
	}, ; 516
	%struct.DSOCacheEntry {
		i64 u0x00000000a439bdee, ; from name: aot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.so
		i64 u0x000000008c4f6181, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so
		ptr null; void* handle
	}, ; 517
	%struct.DSOCacheEntry {
		i64 u0x00000000a4500736, ; from name: aot-Xamarin.AndroidX.ViewPager2.dll.so
		i64 u0x000000001641ea28, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Xamarin.AndroidX.ViewPager2.dll.so
		ptr null; void* handle
	}, ; 518
	%struct.DSOCacheEntry {
		i64 u0x00000000a4672f3b, ; from name: Microsoft.Maui.Controls.Xaml
		i64 u0x000000002d6103aa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Microsoft.Maui.Controls.Xaml.dll.so
		ptr null; void* handle
	}, ; 519
	%struct.DSOCacheEntry {
		i64 u0x00000000a4839a3e, ; from name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		i64 u0x00000000a4839a3e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 520
	%struct.DSOCacheEntry {
		i64 u0x00000000a4a8694c, ; from name: System.IO.Compression.so
		i64 u0x00000000341d0942, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 521
	%struct.DSOCacheEntry {
		i64 u0x00000000a4d9c0e6, ; from name: aot-Microsoft.Extensions.Options.so
		i64 u0x000000003ce4cf8f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Microsoft.Extensions.Options.dll.so
		ptr null; void* handle
	}, ; 522
	%struct.DSOCacheEntry {
		i64 u0x00000000a52ede3d, ; from name: aot-Xamarin.AndroidX.CoordinatorLayout
		i64 u0x00000000336302e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		ptr null; void* handle
	}, ; 523
	%struct.DSOCacheEntry {
		i64 u0x00000000a56a5500, ; from name: Xamarin.AndroidX.CardView.so
		i64 u0x00000000eaa1bb0f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-Xamarin.AndroidX.CardView.dll.so
		ptr null; void* handle
	}, ; 524
	%struct.DSOCacheEntry {
		i64 u0x00000000a671bacd, ; from name: System.Linq.so
		i64 u0x000000003812966e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 525
	%struct.DSOCacheEntry {
		i64 u0x00000000a7008e0b, ; from name: Microsoft.Maui.Graphics
		i64 u0x00000000313c4c9a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Microsoft.Maui.Graphics.dll.so
		ptr null; void* handle
	}, ; 526
	%struct.DSOCacheEntry {
		i64 u0x00000000a717a442, ; from name: System.Runtime.Loader.so
		i64 u0x000000000e65cd01, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.Runtime.Loader.dll.so
		ptr null; void* handle
	}, ; 527
	%struct.DSOCacheEntry {
		i64 u0x00000000a7209051, ; from name: Xamarin.AndroidX.CustomView.dll.so
		i64 u0x0000000080dfe53f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.CustomView.dll.so
		ptr null; void* handle
	}, ; 528
	%struct.DSOCacheEntry {
		i64 u0x00000000a7296140, ; from name: aot-Microsoft.Maui.Controls.Xaml.so
		i64 u0x000000002d6103aa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Microsoft.Maui.Controls.Xaml.dll.so
		ptr null; void* handle
	}, ; 529
	%struct.DSOCacheEntry {
		i64 u0x00000000a7902d9c, ; from name: libaot-Microsoft.Extensions.Options
		i64 u0x000000003ce4cf8f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Microsoft.Extensions.Options.dll.so
		ptr null; void* handle
	}, ; 530
	%struct.DSOCacheEntry {
		i64 u0x00000000a79639f5, ; from name: aot-Xamarin.AndroidX.SwipeRefreshLayout
		i64 u0x00000000f52a5c06, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		ptr null; void* handle
	}, ; 531
	%struct.DSOCacheEntry {
		i64 u0x00000000a7e7a8bf, ; from name: libaot-Xamarin.AndroidX.Fragment.dll.so
		i64 u0x00000000a7e7a8bf, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 532
	%struct.DSOCacheEntry {
		i64 u0x00000000a7fa0e4d, ; from name: libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		i64 u0x00000000a7fa0e4d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		ptr null; void* handle
	}, ; 533
	%struct.DSOCacheEntry {
		i64 u0x00000000a81bf22c, ; from name: Microsoft.Extensions.Logging.Abstractions.dll.so
		i64 u0x000000007d853e51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Microsoft.Extensions.Logging.Abstractions.dll.so
		ptr null; void* handle
	}, ; 534
	%struct.DSOCacheEntry {
		i64 u0x00000000a880ebeb, ; from name: Microsoft.Extensions.Configuration.so
		i64 u0x00000000b1c9d684, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-Microsoft.Extensions.Configuration.dll.so
		ptr null; void* handle
	}, ; 535
	%struct.DSOCacheEntry {
		i64 u0x00000000a8bf5d10, ; from name: libaot-System.Collections.Specialized.dll.so
		i64 u0x00000000a8bf5d10, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 536
	%struct.DSOCacheEntry {
		i64 u0x00000000a8c7aca3, ; from name: aot-System.Runtime.Loader.dll.so
		i64 u0x000000000e65cd01, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.Runtime.Loader.dll.so
		ptr null; void* handle
	}, ; 537
	%struct.DSOCacheEntry {
		i64 u0x00000000a949a41b, ; from name: aot-Microsoft.Extensions.Logging.Abstractions.dll.so
		i64 u0x000000007d853e51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Microsoft.Extensions.Logging.Abstractions.dll.so
		ptr null; void* handle
	}, ; 538
	%struct.DSOCacheEntry {
		i64 u0x00000000a95072d7, ; from name: aot-Mono.Android.so
		i64 u0x00000000116fa401, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.93_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 539
	%struct.DSOCacheEntry {
		i64 u0x00000000a954f7b1, ; from name: aot-System.Collections.NonGeneric.so
		i64 u0x0000000045a298d3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 540
	%struct.DSOCacheEntry {
		i64 u0x00000000a97b80ac, ; from name: aot-System.Console.dll.so
		i64 u0x0000000096dcc630, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 541
	%struct.DSOCacheEntry {
		i64 u0x00000000a98786d8, ; from name: aot-Xamarin.KotlinX.Coroutines.Core.Jvm.so
		i64 u0x00000000a4839a3e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 542
	%struct.DSOCacheEntry {
		i64 u0x00000000a9d5e12b, ; from name: libaot-Microsoft.Extensions.Hosting.Abstractions
		i64 u0x000000002e5c9414, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Microsoft.Extensions.Hosting.Abstractions.dll.so
		ptr null; void* handle
	}, ; 543
	%struct.DSOCacheEntry {
		i64 u0x00000000aa107fc4, ; from name: Xamarin.AndroidX.ViewPager
		i64 u0x00000000c5fee763, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Xamarin.AndroidX.ViewPager.dll.so
		ptr null; void* handle
	}, ; 544
	%struct.DSOCacheEntry {
		i64 u0x00000000aa1921b9, ; from name: libaot-System.Text.Json
		i64 u0x00000000a170e652, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle
	}, ; 545
	%struct.DSOCacheEntry {
		i64 u0x00000000aa8a4878, ; from name: Microsoft.Maui.Essentials
		i64 u0x0000000085d2bea6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Microsoft.Maui.Essentials.dll.so
		ptr null; void* handle
	}, ; 546
	%struct.DSOCacheEntry {
		i64 u0x00000000ab47d595, ; from name: libaot-System.Runtime.Numerics.so
		i64 u0x00000000ad907b53, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle
	}, ; 547
	%struct.DSOCacheEntry {
		i64 u0x00000000abcf77d1, ; from name: System.Security.Cryptography.dll.so
		i64 u0x00000000d72c936f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 548
	%struct.DSOCacheEntry {
		i64 u0x00000000ac4f8499, ; from name: libaot-System.ComponentModel.so
		i64 u0x000000005334092f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 549
	%struct.DSOCacheEntry {
		i64 u0x00000000ac820e1b, ; from name: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		i64 u0x00000000ee0cc1b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 550
	%struct.DSOCacheEntry {
		i64 u0x00000000ad2ab0cd, ; from name: System.Threading.dll.so
		i64 u0x00000000f97d7588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 551
	%struct.DSOCacheEntry {
		i64 u0x00000000ad4aee66, ; from name: libaot-Xamarin.AndroidX.CursorAdapter
		i64 u0x000000004057e9b0, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.CursorAdapter.dll.so
		ptr null; void* handle
	}, ; 552
	%struct.DSOCacheEntry {
		i64 u0x00000000ad6f1e8a, ; from name: System.Private.CoreLib
		i64 u0x00000000f5dad612, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 553
	%struct.DSOCacheEntry {
		i64 u0x00000000ad907b53, ; from name: libaot-System.Runtime.Numerics.dll.so
		i64 u0x00000000ad907b53, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle
	}, ; 554
	%struct.DSOCacheEntry {
		i64 u0x00000000aea4b4b5, ; from name: Xamarin.AndroidX.Core.so
		i64 u0x0000000003b7ead2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 555
	%struct.DSOCacheEntry {
		i64 u0x00000000aec693fa, ; from name: aot-Xamarin.AndroidX.Navigation.Common.Android.dll.so
		i64 u0x00000000078ea0f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Xamarin.AndroidX.Navigation.Common.Android.dll.so
		ptr null; void* handle
	}, ; 556
	%struct.DSOCacheEntry {
		i64 u0x00000000aece8453, ; from name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm
		i64 u0x00000000a4839a3e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 557
	%struct.DSOCacheEntry {
		i64 u0x00000000af8b9dff, ; from name: System.Collections.NonGeneric.dll.so
		i64 u0x0000000045a298d3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 558
	%struct.DSOCacheEntry {
		i64 u0x00000000afe7933d, ; from name: aot-Microsoft.Maui
		i64 u0x0000000069864c69, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Microsoft.Maui.dll.so
		ptr null; void* handle
	}, ; 559
	%struct.DSOCacheEntry {
		i64 u0x00000000b004f5bd, ; from name: libaot-Xamarin.AndroidX.SavedState.SavedState.Android
		i64 u0x000000000418b010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Xamarin.AndroidX.SavedState.SavedState.Android.dll.so
		ptr null; void* handle
	}, ; 560
	%struct.DSOCacheEntry {
		i64 u0x00000000b0bc7770, ; from name: aot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		i64 u0x00000000f52a5c06, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		ptr null; void* handle
	}, ; 561
	%struct.DSOCacheEntry {
		i64 u0x00000000b0dedb6b, ; from name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		i64 u0x00000000b0dedb6b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		ptr null; void* handle
	}, ; 562
	%struct.DSOCacheEntry {
		i64 u0x00000000b143d0b8, ; from name: aot-Xamarin.AndroidX.AppCompat.dll.so
		i64 u0x00000000b8fa92b4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 563
	%struct.DSOCacheEntry {
		i64 u0x00000000b18af942, ; from name: Xamarin.AndroidX.DrawerLayout
		i64 u0x00000000a2e5eb85, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 564
	%struct.DSOCacheEntry {
		i64 u0x00000000b1a8cb74, ; from name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources
		i64 u0x0000000032abb588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		ptr null; void* handle
	}, ; 565
	%struct.DSOCacheEntry {
		i64 u0x00000000b1c9d684, ; from name: libaot-Microsoft.Extensions.Configuration.dll.so
		i64 u0x00000000b1c9d684, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-Microsoft.Extensions.Configuration.dll.so
		ptr null; void* handle
	}, ; 566
	%struct.DSOCacheEntry {
		i64 u0x00000000b1f6b5dd, ; from name: aot-System.Xml.ReaderWriter.dll.so
		i64 u0x00000000716accae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle
	}, ; 567
	%struct.DSOCacheEntry {
		i64 u0x00000000b382fb8e, ; from name: libaot-Xamarin.AndroidX.ViewPager
		i64 u0x00000000c5fee763, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Xamarin.AndroidX.ViewPager.dll.so
		ptr null; void* handle
	}, ; 568
	%struct.DSOCacheEntry {
		i64 u0x00000000b3c35455, ; from name: Xamarin.AndroidX.Activity.so
		i64 u0x00000000915782e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 569
	%struct.DSOCacheEntry {
		i64 u0x00000000b446a791, ; from name: aot-System.Runtime.InteropServices.dll.so
		i64 u0x000000008bbc0be1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 570
	%struct.DSOCacheEntry {
		i64 u0x00000000b45a5564, ; from name: aot-Xamarin.AndroidX.AppCompat.AppCompatResources
		i64 u0x0000000032abb588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		ptr null; void* handle
	}, ; 571
	%struct.DSOCacheEntry {
		i64 u0x00000000b536b76c, ; from name: aot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		i64 u0x00000000a4839a3e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 572
	%struct.DSOCacheEntry {
		i64 u0x00000000b5755643, ; from name: aot-System.Numerics.Vectors
		i64 u0x0000000095f63711, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle
	}, ; 573
	%struct.DSOCacheEntry {
		i64 u0x00000000b5c7e763, ; from name: libaot-Xamarin.AndroidX.Collection.Jvm.so
		i64 u0x0000000057c93dd4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-Xamarin.AndroidX.Collection.Jvm.dll.so
		ptr null; void* handle
	}, ; 574
	%struct.DSOCacheEntry {
		i64 u0x00000000b5de0533, ; from name: System.Runtime.dll.so
		i64 u0x0000000087de61a5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 575
	%struct.DSOCacheEntry {
		i64 u0x00000000b5e92064, ; from name: aot-Microsoft.Maui.Essentials.so
		i64 u0x0000000085d2bea6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Microsoft.Maui.Essentials.dll.so
		ptr null; void* handle
	}, ; 576
	%struct.DSOCacheEntry {
		i64 u0x00000000b6105b69, ; from name: aot-Microsoft.Maui.Graphics.so
		i64 u0x00000000313c4c9a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Microsoft.Maui.Graphics.dll.so
		ptr null; void* handle
	}, ; 577
	%struct.DSOCacheEntry {
		i64 u0x00000000b618ac68, ; from name: Microsoft.Extensions.Diagnostics.Abstractions.dll.so
		i64 u0x00000000537d157f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Microsoft.Extensions.Diagnostics.Abstractions.dll.so
		ptr null; void* handle
	}, ; 578
	%struct.DSOCacheEntry {
		i64 u0x00000000b62b4bfc, ; from name: aot-System.Net.Primitives.dll.so
		i64 u0x000000009dc5271e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 579
	%struct.DSOCacheEntry {
		i64 u0x00000000b64116a3, ; from name: aot-System.Linq.Expressions.dll.so
		i64 u0x00000000c4588d67, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 580
	%struct.DSOCacheEntry {
		i64 u0x00000000b6480ca4, ; from name: System.Text.RegularExpressions.dll.so
		i64 u0x000000000eb7b864, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 581
	%struct.DSOCacheEntry {
		i64 u0x00000000b65adef9, ; from name: Mono.Android.Runtime
		i64 u0x000000009f9275a1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.92_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 582
	%struct.DSOCacheEntry {
		i64 u0x00000000b660be12, ; from name: System.ComponentModel.Primitives
		i64 u0x0000000013221fbc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 583
	%struct.DSOCacheEntry {
		i64 u0x00000000b6b07872, ; from name: libaot-System.Linq.Expressions.so
		i64 u0x00000000c4588d67, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 584
	%struct.DSOCacheEntry {
		i64 u0x00000000b730e35b, ; from name: aot-System.Private.CoreLib
		i64 u0x00000000f5dad612, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 585
	%struct.DSOCacheEntry {
		i64 u0x00000000b7eeaa9a, ; from name: libaot-Xamarin.AndroidX.Navigation.Runtime.Android
		i64 u0x000000002cce3b68, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Xamarin.AndroidX.Navigation.Runtime.Android.dll.so
		ptr null; void* handle
	}, ; 586
	%struct.DSOCacheEntry {
		i64 u0x00000000b823c77b, ; from name: aot-Xamarin.AndroidX.RecyclerView.dll.so
		i64 u0x00000000533f79e3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Xamarin.AndroidX.RecyclerView.dll.so
		ptr null; void* handle
	}, ; 587
	%struct.DSOCacheEntry {
		i64 u0x00000000b839bcce, ; from name: aot-System.Runtime.InteropServices.so
		i64 u0x000000008bbc0be1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 588
	%struct.DSOCacheEntry {
		i64 u0x00000000b83f8429, ; from name: libaot-System.Text.Encodings.Web.so
		i64 u0x000000006ca8bc02, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle
	}, ; 589
	%struct.DSOCacheEntry {
		i64 u0x00000000b8a3dab9, ; from name: System.Console.dll.so
		i64 u0x0000000096dcc630, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 590
	%struct.DSOCacheEntry {
		i64 u0x00000000b8fa92b4, ; from name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		i64 u0x00000000b8fa92b4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 591
	%struct.DSOCacheEntry {
		i64 u0x00000000b8fd311b, ; from name: System.Formats.Asn1
		i64 u0x00000000c3325126, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle
	}, ; 592
	%struct.DSOCacheEntry {
		i64 u0x00000000b93836a6, ; from name: libaot-Microsoft.Extensions.Hosting.Abstractions.so
		i64 u0x000000002e5c9414, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Microsoft.Extensions.Hosting.Abstractions.dll.so
		ptr null; void* handle
	}, ; 593
	%struct.DSOCacheEntry {
		i64 u0x00000000b9e50c93, ; from name: aot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		i64 u0x00000000336302e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		ptr null; void* handle
	}, ; 594
	%struct.DSOCacheEntry {
		i64 u0x00000000b9e9e92c, ; from name: aot-Microsoft.Maui.Controls
		i64 u0x000000003cd51dd1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Microsoft.Maui.Controls.dll.so
		ptr null; void* handle
	}, ; 595
	%struct.DSOCacheEntry {
		i64 u0x00000000b9f21d8b, ; from name: Mono.Android.dll.so
		i64 u0x00000000116fa401, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.93_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 596
	%struct.DSOCacheEntry {
		i64 u0x00000000ba6efa1f, ; from name: System.ObjectModel.dll.so
		i64 u0x000000004f0f9830, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 597
	%struct.DSOCacheEntry {
		i64 u0x00000000ba8b5ccc, ; from name: libaot-System.Private.Uri
		i64 u0x0000000099cbecc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 598
	%struct.DSOCacheEntry {
		i64 u0x00000000bb09e16b, ; from name: libaot-System.Net.Requests
		i64 u0x000000004506f4eb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle
	}, ; 599
	%struct.DSOCacheEntry {
		i64 u0x00000000bbb0f0a3, ; from name: aot-Xamarin.AndroidX.Collection.Jvm
		i64 u0x0000000057c93dd4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-Xamarin.AndroidX.Collection.Jvm.dll.so
		ptr null; void* handle
	}, ; 600
	%struct.DSOCacheEntry {
		i64 u0x00000000be129627, ; from name: aot-System.Runtime.Numerics.dll.so
		i64 u0x00000000ad907b53, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle
	}, ; 601
	%struct.DSOCacheEntry {
		i64 u0x00000000be5fb5a0, ; from name: aot-System.Private.CoreLib.so
		i64 u0x00000000f5dad612, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 602
	%struct.DSOCacheEntry {
		i64 u0x00000000be6f83e8, ; from name: aot-Xamarin.AndroidX.ViewPager
		i64 u0x00000000c5fee763, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Xamarin.AndroidX.ViewPager.dll.so
		ptr null; void* handle
	}, ; 603
	%struct.DSOCacheEntry {
		i64 u0x00000000bf57322e, ; from name: libaot-System.Xml.ReaderWriter.so
		i64 u0x00000000716accae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle
	}, ; 604
	%struct.DSOCacheEntry {
		i64 u0x00000000bf824d6f, ; from name: aot-System.Net.Primitives
		i64 u0x000000009dc5271e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 605
	%struct.DSOCacheEntry {
		i64 u0x00000000bfb7c24d, ; from name: aot-Microsoft.Extensions.Configuration
		i64 u0x00000000b1c9d684, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-Microsoft.Extensions.Configuration.dll.so
		ptr null; void* handle
	}, ; 606
	%struct.DSOCacheEntry {
		i64 u0x00000000bff2e236, ; from name: System.Threading
		i64 u0x00000000f97d7588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 607
	%struct.DSOCacheEntry {
		i64 u0x00000000bffc9c5b, ; from name: libaot-System.Collections.Specialized.so
		i64 u0x00000000a8bf5d10, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 608
	%struct.DSOCacheEntry {
		i64 u0x00000000c014eea3, ; from name: aot-System.Net.Primitives.so
		i64 u0x000000009dc5271e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 609
	%struct.DSOCacheEntry {
		i64 u0x00000000c0417f28, ; from name: aot-Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so
		i64 u0x000000004cae6f51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so
		ptr null; void* handle
	}, ; 610
	%struct.DSOCacheEntry {
		i64 u0x00000000c04c4f9e, ; from name: libaot-System.ComponentModel.TypeConverter.so
		i64 u0x0000000081847c35, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 611
	%struct.DSOCacheEntry {
		i64 u0x00000000c0d6f8b8, ; from name: aot-Microsoft.Maui.Controls.so
		i64 u0x000000003cd51dd1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Microsoft.Maui.Controls.dll.so
		ptr null; void* handle
	}, ; 612
	%struct.DSOCacheEntry {
		i64 u0x00000000c12d75d4, ; from name: aot-System.Threading
		i64 u0x00000000f97d7588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 613
	%struct.DSOCacheEntry {
		i64 u0x00000000c17e8388, ; from name: libaot-Microsoft.Extensions.FileProviders.Abstractions.so
		i64 u0x00000000a7fa0e4d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		ptr null; void* handle
	}, ; 614
	%struct.DSOCacheEntry {
		i64 u0x00000000c18efe86, ; from name: Microsoft.Extensions.Diagnostics.Abstractions.so
		i64 u0x00000000537d157f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Microsoft.Extensions.Diagnostics.Abstractions.dll.so
		ptr null; void* handle
	}, ; 615
	%struct.DSOCacheEntry {
		i64 u0x00000000c1a62e63, ; from name: libaot-Xamarin.AndroidX.CardView.so
		i64 u0x00000000eaa1bb0f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-Xamarin.AndroidX.CardView.dll.so
		ptr null; void* handle
	}, ; 616
	%struct.DSOCacheEntry {
		i64 u0x00000000c1b3cbef, ; from name: aot-Xamarin.AndroidX.CursorAdapter.so
		i64 u0x000000004057e9b0, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.CursorAdapter.dll.so
		ptr null; void* handle
	}, ; 617
	%struct.DSOCacheEntry {
		i64 u0x00000000c203cbe2, ; from name: aot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so
		i64 u0x000000008c4f6181, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so
		ptr null; void* handle
	}, ; 618
	%struct.DSOCacheEntry {
		i64 u0x00000000c235e84d, ; from name: Xamarin.AndroidX.CardView
		i64 u0x00000000eaa1bb0f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-Xamarin.AndroidX.CardView.dll.so
		ptr null; void* handle
	}, ; 619
	%struct.DSOCacheEntry {
		i64 u0x00000000c24a5970, ; from name: libaot-System.Private.Xml.dll.so
		i64 u0x00000000c24a5970, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.78_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 620
	%struct.DSOCacheEntry {
		i64 u0x00000000c2ca5d89, ; from name: aot-Xamarin.AndroidX.Loader.dll.so
		i64 u0x000000003b171bfb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 621
	%struct.DSOCacheEntry {
		i64 u0x00000000c306a37f, ; from name: System.ComponentModel.so
		i64 u0x000000005334092f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 622
	%struct.DSOCacheEntry {
		i64 u0x00000000c31879c3, ; from name: aot-System.Net.Requests.so
		i64 u0x000000004506f4eb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle
	}, ; 623
	%struct.DSOCacheEntry {
		i64 u0x00000000c3325126, ; from name: libaot-System.Formats.Asn1.dll.so
		i64 u0x00000000c3325126, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle
	}, ; 624
	%struct.DSOCacheEntry {
		i64 u0x00000000c33e9cca, ; from name: System.Net.Http.dll.so
		i64 u0x000000003b9fa69c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle
	}, ; 625
	%struct.DSOCacheEntry {
		i64 u0x00000000c4588d67, ; from name: libaot-System.Linq.Expressions.dll.so
		i64 u0x00000000c4588d67, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 626
	%struct.DSOCacheEntry {
		i64 u0x00000000c4b1d11f, ; from name: System.Text.Json.so
		i64 u0x00000000a170e652, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle
	}, ; 627
	%struct.DSOCacheEntry {
		i64 u0x00000000c4db4a7a, ; from name: Concurso.dll.so
		i64 u0x000000004d94027c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libaot-Concurso.dll.so
		ptr null; void* handle
	}, ; 628
	%struct.DSOCacheEntry {
		i64 u0x00000000c4e79cfe, ; from name: libaot-System.Runtime.InteropServices.so
		i64 u0x000000008bbc0be1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 629
	%struct.DSOCacheEntry {
		i64 u0x00000000c54ac704, ; from name: aot-System.Formats.Asn1.so
		i64 u0x00000000c3325126, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle
	}, ; 630
	%struct.DSOCacheEntry {
		i64 u0x00000000c5a35980, ; from name: aot-System.Collections.so
		i64 u0x00000000d3d7eec4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 631
	%struct.DSOCacheEntry {
		i64 u0x00000000c5e63b90, ; from name: System.Linq.dll.so
		i64 u0x000000003812966e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 632
	%struct.DSOCacheEntry {
		i64 u0x00000000c5ecf3d0, ; from name: aot-Mono.Android.Runtime.so
		i64 u0x000000009f9275a1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.92_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 633
	%struct.DSOCacheEntry {
		i64 u0x00000000c5fee763, ; from name: libaot-Xamarin.AndroidX.ViewPager.dll.so
		i64 u0x00000000c5fee763, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Xamarin.AndroidX.ViewPager.dll.so
		ptr null; void* handle
	}, ; 634
	%struct.DSOCacheEntry {
		i64 u0x00000000c60e9695, ; from name: libaot-System.Memory.so
		i64 u0x00000000ebceb809, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 635
	%struct.DSOCacheEntry {
		i64 u0x00000000c68ae779, ; from name: libaot-Microsoft.Maui
		i64 u0x0000000069864c69, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Microsoft.Maui.dll.so
		ptr null; void* handle
	}, ; 636
	%struct.DSOCacheEntry {
		i64 u0x00000000c6d776fc, ; from name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions.so
		i64 u0x00000000b0dedb6b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		ptr null; void* handle
	}, ; 637
	%struct.DSOCacheEntry {
		i64 u0x00000000c70c5e0f, ; from name: libaot-Xamarin.AndroidX.Core.so
		i64 u0x0000000003b7ead2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 638
	%struct.DSOCacheEntry {
		i64 u0x00000000c73e75d4, ; from name: libaot-Xamarin.AndroidX.AppCompat.so
		i64 u0x00000000b8fa92b4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 639
	%struct.DSOCacheEntry {
		i64 u0x00000000c826177e, ; from name: Microsoft.Extensions.Configuration.Abstractions.so
		i64 u0x000000006a6826d8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		ptr null; void* handle
	}, ; 640
	%struct.DSOCacheEntry {
		i64 u0x00000000c82afec1, ; from name: System.Text.Json
		i64 u0x00000000a170e652, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle
	}, ; 641
	%struct.DSOCacheEntry {
		i64 u0x00000000c86c06e3, ; from name: Xamarin.AndroidX.Core
		i64 u0x0000000003b7ead2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 642
	%struct.DSOCacheEntry {
		i64 u0x00000000c8a662e9, ; from name: Java.Interop
		i64 u0x000000007e561493, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.91_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 643
	%struct.DSOCacheEntry {
		i64 u0x00000000c8b67fc4, ; from name: Xamarin.AndroidX.Collection.Jvm.so
		i64 u0x0000000057c93dd4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-Xamarin.AndroidX.Collection.Jvm.dll.so
		ptr null; void* handle
	}, ; 644
	%struct.DSOCacheEntry {
		i64 u0x00000000c9094c00, ; from name: Xamarin.AndroidX.Navigation.Runtime.Android
		i64 u0x000000002cce3b68, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Xamarin.AndroidX.Navigation.Runtime.Android.dll.so
		ptr null; void* handle
	}, ; 645
	%struct.DSOCacheEntry {
		i64 u0x00000000c92a6809, ; from name: Xamarin.AndroidX.RecyclerView
		i64 u0x00000000533f79e3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Xamarin.AndroidX.RecyclerView.dll.so
		ptr null; void* handle
	}, ; 646
	%struct.DSOCacheEntry {
		i64 u0x00000000c9b8db9c, ; from name: aot-Xamarin.AndroidX.Navigation.Common.Android.so
		i64 u0x00000000078ea0f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Xamarin.AndroidX.Navigation.Common.Android.dll.so
		ptr null; void* handle
	}, ; 647
	%struct.DSOCacheEntry {
		i64 u0x00000000ca4ef212, ; from name: Xamarin.AndroidX.Activity.dll.so
		i64 u0x00000000915782e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 648
	%struct.DSOCacheEntry {
		i64 u0x00000000ca642251, ; from name: aot-System.Console.so
		i64 u0x0000000096dcc630, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 649
	%struct.DSOCacheEntry {
		i64 u0x00000000ca72662c, ; from name: System.Net.Primitives.dll.so
		i64 u0x000000009dc5271e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.73_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 650
	%struct.DSOCacheEntry {
		i64 u0x00000000cac06536, ; from name: Xamarin.AndroidX.ViewPager.dll.so
		i64 u0x00000000c5fee763, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Xamarin.AndroidX.ViewPager.dll.so
		ptr null; void* handle
	}, ; 651
	%struct.DSOCacheEntry {
		i64 u0x00000000cae3bce4, ; from name: aot-Xamarin.AndroidX.CardView.dll.so
		i64 u0x00000000eaa1bb0f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-Xamarin.AndroidX.CardView.dll.so
		ptr null; void* handle
	}, ; 652
	%struct.DSOCacheEntry {
		i64 u0x00000000caf1d456, ; from name: Xamarin.AndroidX.DrawerLayout.so
		i64 u0x00000000a2e5eb85, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 653
	%struct.DSOCacheEntry {
		i64 u0x00000000cca50c6c, ; from name: aot-System.Drawing.so
		i64 u0x0000000038a1e793, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle
	}, ; 654
	%struct.DSOCacheEntry {
		i64 u0x00000000cd600ec1, ; from name: aot-System.ComponentModel.Primitives.dll.so
		i64 u0x0000000013221fbc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 655
	%struct.DSOCacheEntry {
		i64 u0x00000000cd878bcd, ; from name: aot-System.IO.Compression
		i64 u0x00000000341d0942, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 656
	%struct.DSOCacheEntry {
		i64 u0x00000000ce0da789, ; from name: libaot-System.Threading.so
		i64 u0x00000000f97d7588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 657
	%struct.DSOCacheEntry {
		i64 u0x00000000ce18e2eb, ; from name: libaot-Microsoft.Extensions.Diagnostics.Abstractions.so
		i64 u0x00000000537d157f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Microsoft.Extensions.Diagnostics.Abstractions.dll.so
		ptr null; void* handle
	}, ; 658
	%struct.DSOCacheEntry {
		i64 u0x00000000cee56696, ; from name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		i64 u0x00000000cee56696, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 659
	%struct.DSOCacheEntry {
		i64 u0x00000000cf3163e6, ; from name: Mono.Android
		i64 u0x00000000116fa401, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.93_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 660
	%struct.DSOCacheEntry {
		i64 u0x00000000cf82bcf7, ; from name: aot-System.Security.Cryptography.so
		i64 u0x00000000d72c936f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 661
	%struct.DSOCacheEntry {
		i64 u0x00000000d0d0aae9, ; from name: libaot-System.IO.Pipelines.so
		i64 u0x000000002c56a78d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.IO.Pipelines.dll.so
		ptr null; void* handle
	}, ; 662
	%struct.DSOCacheEntry {
		i64 u0x00000000d0f6516c, ; from name: Xamarin.AndroidX.Collection.Jvm.dll.so
		i64 u0x0000000057c93dd4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-Xamarin.AndroidX.Collection.Jvm.dll.so
		ptr null; void* handle
	}, ; 663
	%struct.DSOCacheEntry {
		i64 u0x00000000d1061a6e, ; from name: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so
		i64 u0x000000004cae6f51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so
		ptr null; void* handle
	}, ; 664
	%struct.DSOCacheEntry {
		i64 u0x00000000d18347a9, ; from name: libaot-Xamarin.AndroidX.RecyclerView.so
		i64 u0x00000000533f79e3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Xamarin.AndroidX.RecyclerView.dll.so
		ptr null; void* handle
	}, ; 665
	%struct.DSOCacheEntry {
		i64 u0x00000000d214727d, ; from name: aot-System.Numerics.Vectors.so
		i64 u0x0000000095f63711, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle
	}, ; 666
	%struct.DSOCacheEntry {
		i64 u0x00000000d248b9ec, ; from name: System.Runtime.Loader.dll.so
		i64 u0x000000000e65cd01, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.Runtime.Loader.dll.so
		ptr null; void* handle
	}, ; 667
	%struct.DSOCacheEntry {
		i64 u0x00000000d27dea64, ; from name: Microsoft.Extensions.Options.dll.so
		i64 u0x000000003ce4cf8f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Microsoft.Extensions.Options.dll.so
		ptr null; void* handle
	}, ; 668
	%struct.DSOCacheEntry {
		i64 u0x00000000d290822c, ; from name: aot-System.IO.Compression.so
		i64 u0x00000000341d0942, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 669
	%struct.DSOCacheEntry {
		i64 u0x00000000d3634aa2, ; from name: System.so
		i64 u0x00000000d4110d87, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 670
	%struct.DSOCacheEntry {
		i64 u0x00000000d3d7eec4, ; from name: libaot-System.Collections.dll.so
		i64 u0x00000000d3d7eec4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 671
	%struct.DSOCacheEntry {
		i64 u0x00000000d4110d87, ; from name: libaot-System.dll.so
		i64 u0x00000000d4110d87, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 672
	%struct.DSOCacheEntry {
		i64 u0x00000000d46b1eed, ; from name: libaot-Microsoft.Extensions.Configuration.Abstractions
		i64 u0x000000006a6826d8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		ptr null; void* handle
	}, ; 673
	%struct.DSOCacheEntry {
		i64 u0x00000000d4735059, ; from name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.so
		i64 u0x00000000ee0cc1b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 674
	%struct.DSOCacheEntry {
		i64 u0x00000000d50b2ce3, ; from name: libaot-System.Runtime.Loader
		i64 u0x000000000e65cd01, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.Runtime.Loader.dll.so
		ptr null; void* handle
	}, ; 675
	%struct.DSOCacheEntry {
		i64 u0x00000000d57031b7, ; from name: libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		i64 u0x00000000d57031b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		ptr null; void* handle
	}, ; 676
	%struct.DSOCacheEntry {
		i64 u0x00000000d5734d48, ; from name: libaot-Xamarin.Kotlin.StdLib
		i64 u0x000000000e003282, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 677
	%struct.DSOCacheEntry {
		i64 u0x00000000d5858535, ; from name: aot-Xamarin.AndroidX.Lifecycle.LiveData.Core
		i64 u0x00000000ee0cc1b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 678
	%struct.DSOCacheEntry {
		i64 u0x00000000d592f2e6, ; from name: Mono.Android.Runtime.so
		i64 u0x000000009f9275a1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.92_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 679
	%struct.DSOCacheEntry {
		i64 u0x00000000d6916a07, ; from name: Xamarin.AndroidX.Navigation.Common.Android.so
		i64 u0x00000000078ea0f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-Xamarin.AndroidX.Navigation.Common.Android.dll.so
		ptr null; void* handle
	}, ; 680
	%struct.DSOCacheEntry {
		i64 u0x00000000d6ea0762, ; from name: aot-Xamarin.AndroidX.CoordinatorLayout.so
		i64 u0x00000000336302e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		ptr null; void* handle
	}, ; 681
	%struct.DSOCacheEntry {
		i64 u0x00000000d72c936f, ; from name: libaot-System.Security.Cryptography.dll.so
		i64 u0x00000000d72c936f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 682
	%struct.DSOCacheEntry {
		i64 u0x00000000d7f58dd0, ; from name: libaot-System.Linq
		i64 u0x000000003812966e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 683
	%struct.DSOCacheEntry {
		i64 u0x00000000d8121b54, ; from name: Xamarin.AndroidX.RecyclerView.so
		i64 u0x00000000533f79e3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Xamarin.AndroidX.RecyclerView.dll.so
		ptr null; void* handle
	}, ; 684
	%struct.DSOCacheEntry {
		i64 u0x00000000d8272714, ; from name: Xamarin.AndroidX.Navigation.Runtime.Android.dll.so
		i64 u0x000000002cce3b68, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-Xamarin.AndroidX.Navigation.Runtime.Android.dll.so
		ptr null; void* handle
	}, ; 685
	%struct.DSOCacheEntry {
		i64 u0x00000000d90e5f5a, ; from name: Xamarin.AndroidX.Lifecycle.LiveData.Core
		i64 u0x00000000ee0cc1b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 686
	%struct.DSOCacheEntry {
		i64 u0x00000000d930cda0, ; from name: Xamarin.AndroidX.Navigation.Fragment
		i64 u0x00000000d57031b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		ptr null; void* handle
	}, ; 687
	%struct.DSOCacheEntry {
		i64 u0x00000000d9654c6f, ; from name: Mono.Android.so
		i64 u0x00000000116fa401, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.93_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 688
	%struct.DSOCacheEntry {
		i64 u0x00000000d969ebec, ; from name: System.Runtime.InteropServices.dll.so
		i64 u0x000000008bbc0be1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 689
	%struct.DSOCacheEntry {
		i64 u0x00000000d9719026, ; from name: libaot-System.Runtime.Numerics
		i64 u0x00000000ad907b53, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle
	}, ; 690
	%struct.DSOCacheEntry {
		i64 u0x00000000d99246e0, ; from name: aot-Xamarin.AndroidX.Lifecycle.LiveData.Core.so
		i64 u0x00000000ee0cc1b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 691
	%struct.DSOCacheEntry {
		i64 u0x00000000d993404c, ; from name: System.Text.Encodings.Web.dll.so
		i64 u0x000000006ca8bc02, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle
	}, ; 692
	%struct.DSOCacheEntry {
		i64 u0x00000000da54043a, ; from name: aot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		i64 u0x00000000d57031b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		ptr null; void* handle
	}, ; 693
	%struct.DSOCacheEntry {
		i64 u0x00000000daba1d30, ; from name: aot-Concurso.so
		i64 u0x000000004d94027c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libaot-Concurso.dll.so
		ptr null; void* handle
	}, ; 694
	%struct.DSOCacheEntry {
		i64 u0x00000000db33dc8e, ; from name: Microsoft.Extensions.DependencyInjection.so
		i64 u0x0000000042d22978, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.dll.so
		ptr null; void* handle
	}, ; 695
	%struct.DSOCacheEntry {
		i64 u0x00000000dba80a9f, ; from name: libaot-System.IO.Compression.Brotli
		i64 u0x00000000e9f3ecfe, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle
	}, ; 696
	%struct.DSOCacheEntry {
		i64 u0x00000000dc0bf139, ; from name: Xamarin.AndroidX.Core.dll.so
		i64 u0x0000000003b7ead2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 697
	%struct.DSOCacheEntry {
		i64 u0x00000000dc12b388, ; from name: aot-System.IO.Pipelines
		i64 u0x000000002c56a78d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.IO.Pipelines.dll.so
		ptr null; void* handle
	}, ; 698
	%struct.DSOCacheEntry {
		i64 u0x00000000dce000c2, ; from name: libaot-System.Threading.Thread.dll.so
		i64 u0x00000000dce000c2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle
	}, ; 699
	%struct.DSOCacheEntry {
		i64 u0x00000000dcee011c, ; from name: libaot-Xamarin.AndroidX.ViewPager.so
		i64 u0x00000000c5fee763, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Xamarin.AndroidX.ViewPager.dll.so
		ptr null; void* handle
	}, ; 700
	%struct.DSOCacheEntry {
		i64 u0x00000000ddc9eba8, ; from name: aot-System.IO.Compression.Brotli
		i64 u0x00000000e9f3ecfe, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle
	}, ; 701
	%struct.DSOCacheEntry {
		i64 u0x00000000df6f3870, ; from name: System.Diagnostics.DiagnosticSource
		i64 u0x0000000091f7d332, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 702
	%struct.DSOCacheEntry {
		i64 u0x00000000e0baf1c8, ; from name: libaot-System.IO.Pipelines
		i64 u0x000000002c56a78d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.IO.Pipelines.dll.so
		ptr null; void* handle
	}, ; 703
	%struct.DSOCacheEntry {
		i64 u0x00000000e0dc2f6d, ; from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android
		i64 u0x000000009abadfdb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so
		ptr null; void* handle
	}, ; 704
	%struct.DSOCacheEntry {
		i64 u0x00000000e1848e59, ; from name: aot-System.Runtime.Loader.so
		i64 u0x000000000e65cd01, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.80_name, ; name: libaot-System.Runtime.Loader.dll.so
		ptr null; void* handle
	}, ; 705
	%struct.DSOCacheEntry {
		i64 u0x00000000e1d2165c, ; from name: _Microsoft.Android.Resource.Designer.dll.so
		i64 u0x00000000cee56696, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 706
	%struct.DSOCacheEntry {
		i64 u0x00000000e2098b0b, ; from name: System.Collections.NonGeneric
		i64 u0x0000000045a298d3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 707
	%struct.DSOCacheEntry {
		i64 u0x00000000e2fb1357, ; from name: libaot-System.Threading.Thread
		i64 u0x00000000dce000c2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.87_name, ; name: libaot-System.Threading.Thread.dll.so
		ptr null; void* handle
	}, ; 708
	%struct.DSOCacheEntry {
		i64 u0x00000000e301bd4f, ; from name: aot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		i64 u0x000000006a6826d8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		ptr null; void* handle
	}, ; 709
	%struct.DSOCacheEntry {
		i64 u0x00000000e3eeaf13, ; from name: aot-System.ObjectModel.dll.so
		i64 u0x000000004f0f9830, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.76_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 710
	%struct.DSOCacheEntry {
		i64 u0x00000000e4213e49, ; from name: Xamarin.AndroidX.Loader.dll.so
		i64 u0x000000003b171bfb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 711
	%struct.DSOCacheEntry {
		i64 u0x00000000e45c6f32, ; from name: System.ComponentModel.dll.so
		i64 u0x000000005334092f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 712
	%struct.DSOCacheEntry {
		i64 u0x00000000e5440634, ; from name: Xamarin.AndroidX.ViewPager.so
		i64 u0x00000000c5fee763, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-Xamarin.AndroidX.ViewPager.dll.so
		ptr null; void* handle
	}, ; 713
	%struct.DSOCacheEntry {
		i64 u0x00000000e601174a, ; from name: Microsoft.Extensions.Options.so
		i64 u0x000000003ce4cf8f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Microsoft.Extensions.Options.dll.so
		ptr null; void* handle
	}, ; 714
	%struct.DSOCacheEntry {
		i64 u0x00000000e60cd933, ; from name: aot-Microsoft.Extensions.FileProviders.Abstractions.so
		i64 u0x00000000a7fa0e4d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		ptr null; void* handle
	}, ; 715
	%struct.DSOCacheEntry {
		i64 u0x00000000e62be61a, ; from name: aot-System.ComponentModel.so
		i64 u0x000000005334092f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 716
	%struct.DSOCacheEntry {
		i64 u0x00000000e6632886, ; from name: System.Net.Http.so
		i64 u0x000000003b9fa69c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle
	}, ; 717
	%struct.DSOCacheEntry {
		i64 u0x00000000e6abb9bb, ; from name: aot-Xamarin.AndroidX.Lifecycle.Common.Jvm.so
		i64 u0x000000004cae6f51, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so
		ptr null; void* handle
	}, ; 718
	%struct.DSOCacheEntry {
		i64 u0x00000000e76d747b, ; from name: aot-Mono.Android.dll.so
		i64 u0x00000000116fa401, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.93_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 719
	%struct.DSOCacheEntry {
		i64 u0x00000000e7d5e305, ; from name: libaot-Microsoft.Extensions.Logging
		i64 u0x000000009faac168, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Microsoft.Extensions.Logging.dll.so
		ptr null; void* handle
	}, ; 720
	%struct.DSOCacheEntry {
		i64 u0x00000000e7f1899d, ; from name: aot-System.Net.Http
		i64 u0x000000003b9fa69c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Net.Http.dll.so
		ptr null; void* handle
	}, ; 721
	%struct.DSOCacheEntry {
		i64 u0x00000000e83674e6, ; from name: libaot-Microsoft.Extensions.Logging.so
		i64 u0x000000009faac168, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Microsoft.Extensions.Logging.dll.so
		ptr null; void* handle
	}, ; 722
	%struct.DSOCacheEntry {
		i64 u0x00000000e9054672, ; from name: libaot-System.Memory
		i64 u0x00000000ebceb809, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 723
	%struct.DSOCacheEntry {
		i64 u0x00000000e90fdb70, ; from name: Xamarin.AndroidX.Collection.Jvm
		i64 u0x0000000057c93dd4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-Xamarin.AndroidX.Collection.Jvm.dll.so
		ptr null; void* handle
	}, ; 724
	%struct.DSOCacheEntry {
		i64 u0x00000000e95e32cc, ; from name: aot-System.Security.Cryptography
		i64 u0x00000000d72c936f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.83_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 725
	%struct.DSOCacheEntry {
		i64 u0x00000000e9f3ecfe, ; from name: libaot-System.IO.Compression.Brotli.dll.so
		i64 u0x00000000e9f3ecfe, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.IO.Compression.Brotli.dll.so
		ptr null; void* handle
	}, ; 726
	%struct.DSOCacheEntry {
		i64 u0x00000000ea081bea, ; from name: System.Numerics.Vectors.so
		i64 u0x0000000095f63711, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.75_name, ; name: libaot-System.Numerics.Vectors.dll.so
		ptr null; void* handle
	}, ; 727
	%struct.DSOCacheEntry {
		i64 u0x00000000ea1d4ae5, ; from name: System.Linq.Expressions.so
		i64 u0x00000000c4588d67, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 728
	%struct.DSOCacheEntry {
		i64 u0x00000000ea213423, ; from name: System.Xml.ReaderWriter
		i64 u0x00000000716accae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.89_name, ; name: libaot-System.Xml.ReaderWriter.dll.so
		ptr null; void* handle
	}, ; 729
	%struct.DSOCacheEntry {
		i64 u0x00000000ea4fb52e, ; from name: Xamarin.AndroidX.Navigation.UI
		i64 u0x00000000141cb47a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-Xamarin.AndroidX.Navigation.UI.dll.so
		ptr null; void* handle
	}, ; 730
	%struct.DSOCacheEntry {
		i64 u0x00000000ea8868f3, ; from name: libaot-Mono.Android
		i64 u0x00000000116fa401, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.93_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 731
	%struct.DSOCacheEntry {
		i64 u0x00000000eaa1bb0f, ; from name: libaot-Xamarin.AndroidX.CardView.dll.so
		i64 u0x00000000eaa1bb0f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-Xamarin.AndroidX.CardView.dll.so
		ptr null; void* handle
	}, ; 732
	%struct.DSOCacheEntry {
		i64 u0x00000000eb082637, ; from name: System.Console.so
		i64 u0x0000000096dcc630, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 733
	%struct.DSOCacheEntry {
		i64 u0x00000000eb681ff1, ; from name: aot-Mono.Android.Runtime.dll.so
		i64 u0x000000009f9275a1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.92_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 734
	%struct.DSOCacheEntry {
		i64 u0x00000000ebceb809, ; from name: libaot-System.Memory.dll.so
		i64 u0x00000000ebceb809, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 735
	%struct.DSOCacheEntry {
		i64 u0x00000000ec4d1fe2, ; from name: Microsoft.Maui.Graphics.dll.so
		i64 u0x00000000313c4c9a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Microsoft.Maui.Graphics.dll.so
		ptr null; void* handle
	}, ; 736
	%struct.DSOCacheEntry {
		i64 u0x00000000ed41c4ee, ; from name: aot-System.Formats.Asn1
		i64 u0x00000000c3325126, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Formats.Asn1.dll.so
		ptr null; void* handle
	}, ; 737
	%struct.DSOCacheEntry {
		i64 u0x00000000ed70fb7c, ; from name: aot-Java.Interop
		i64 u0x000000007e561493, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.91_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 738
	%struct.DSOCacheEntry {
		i64 u0x00000000ed990d09, ; from name: System.Net.Requests.so
		i64 u0x000000004506f4eb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.74_name, ; name: libaot-System.Net.Requests.dll.so
		ptr null; void* handle
	}, ; 739
	%struct.DSOCacheEntry {
		i64 u0x00000000ee0cc1b7, ; from name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		i64 u0x00000000ee0cc1b7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 740
	%struct.DSOCacheEntry {
		i64 u0x00000000ee36b04c, ; from name: aot-System.Runtime.dll.so
		i64 u0x0000000087de61a5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.82_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 741
	%struct.DSOCacheEntry {
		i64 u0x00000000eed8ce46, ; from name: aot-System.Linq.Expressions.so
		i64 u0x00000000c4588d67, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 742
	%struct.DSOCacheEntry {
		i64 u0x00000000eef2d570, ; from name: Xamarin.AndroidX.DrawerLayout.dll.so
		i64 u0x00000000a2e5eb85, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 743
	%struct.DSOCacheEntry {
		i64 u0x00000000efd01a89, ; from name: System.IO.Pipelines
		i64 u0x000000002c56a78d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-System.IO.Pipelines.dll.so
		ptr null; void* handle
	}, ; 744
	%struct.DSOCacheEntry {
		i64 u0x00000000efd974a9, ; from name: libaot-System.Drawing.Primitives
		i64 u0x00000000508a690d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Drawing.Primitives.dll.so
		ptr null; void* handle
	}, ; 745
	%struct.DSOCacheEntry {
		i64 u0x00000000eff49a63, ; from name: System.Memory
		i64 u0x00000000ebceb809, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 746
	%struct.DSOCacheEntry {
		i64 u0x00000000f0094b1c, ; from name: libaot-Xamarin.AndroidX.SwipeRefreshLayout
		i64 u0x00000000f52a5c06, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		ptr null; void* handle
	}, ; 747
	%struct.DSOCacheEntry {
		i64 u0x00000000f032a0f8, ; from name: aot-System.Private.Uri.so
		i64 u0x0000000099cbecc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 748
	%struct.DSOCacheEntry {
		i64 u0x00000000f048a58b, ; from name: Xamarin.AndroidX.CardView.dll.so
		i64 u0x00000000eaa1bb0f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-Xamarin.AndroidX.CardView.dll.so
		ptr null; void* handle
	}, ; 749
	%struct.DSOCacheEntry {
		i64 u0x00000000f0f488d4, ; from name: libaot-System.ComponentModel
		i64 u0x000000005334092f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 750
	%struct.DSOCacheEntry {
		i64 u0x00000000f1077784, ; from name: libaot-Xamarin.KotlinX.Serialization.Core.Jvm.dll.so
		i64 u0x00000000f1077784, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Xamarin.KotlinX.Serialization.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 751
	%struct.DSOCacheEntry {
		i64 u0x00000000f1d6deb0, ; from name: Microsoft.Extensions.Primitives.dll.so
		i64 u0x0000000045840300, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Microsoft.Extensions.Primitives.dll.so
		ptr null; void* handle
	}, ; 752
	%struct.DSOCacheEntry {
		i64 u0x00000000f2336478, ; from name: aot-System.IO.Compression.dll.so
		i64 u0x00000000341d0942, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 753
	%struct.DSOCacheEntry {
		i64 u0x00000000f2f5df2f, ; from name: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.so
		i64 u0x000000008c4f6181, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so
		ptr null; void* handle
	}, ; 754
	%struct.DSOCacheEntry {
		i64 u0x00000000f32fc333, ; from name: _Microsoft.Android.Resource.Designer.so
		i64 u0x00000000cee56696, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 755
	%struct.DSOCacheEntry {
		i64 u0x00000000f412c268, ; from name: aot-System.ComponentModel.TypeConverter.so
		i64 u0x0000000081847c35, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 756
	%struct.DSOCacheEntry {
		i64 u0x00000000f462c30d, ; from name: System.Private.Uri
		i64 u0x0000000099cbecc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.77_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 757
	%struct.DSOCacheEntry {
		i64 u0x00000000f51b8298, ; from name: aot-Xamarin.AndroidX.Core.dll.so
		i64 u0x0000000003b7ead2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 758
	%struct.DSOCacheEntry {
		i64 u0x00000000f52a5c06, ; from name: libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		i64 u0x00000000f52a5c06, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		ptr null; void* handle
	}, ; 759
	%struct.DSOCacheEntry {
		i64 u0x00000000f56c3c39, ; from name: Xamarin.AndroidX.ViewPager2.dll.so
		i64 u0x000000001641ea28, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-Xamarin.AndroidX.ViewPager2.dll.so
		ptr null; void* handle
	}, ; 760
	%struct.DSOCacheEntry {
		i64 u0x00000000f5dad612, ; from name: libaot-System.Private.CoreLib.dll.so
		i64 u0x00000000f5dad612, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 761
	%struct.DSOCacheEntry {
		i64 u0x00000000f5ed690d, ; from name: System.ComponentModel.TypeConverter.dll.so
		i64 u0x0000000081847c35, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 762
	%struct.DSOCacheEntry {
		i64 u0x00000000f5f4f1f0, ; from name: Microsoft.Extensions.DependencyInjection
		i64 u0x0000000042d22978, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.dll.so
		ptr null; void* handle
	}, ; 763
	%struct.DSOCacheEntry {
		i64 u0x00000000f5f723b2, ; from name: aot-Microsoft.Maui.Graphics
		i64 u0x00000000313c4c9a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Microsoft.Maui.Graphics.dll.so
		ptr null; void* handle
	}, ; 764
	%struct.DSOCacheEntry {
		i64 u0x00000000f6da372f, ; from name: libaot-Microsoft.Extensions.Primitives
		i64 u0x0000000045840300, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Microsoft.Extensions.Primitives.dll.so
		ptr null; void* handle
	}, ; 765
	%struct.DSOCacheEntry {
		i64 u0x00000000f719e2d8, ; from name: System.Runtime.InteropServices.so
		i64 u0x000000008bbc0be1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 766
	%struct.DSOCacheEntry {
		i64 u0x00000000f735b3ac, ; from name: Xamarin.AndroidX.RecyclerView.dll.so
		i64 u0x00000000533f79e3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-Xamarin.AndroidX.RecyclerView.dll.so
		ptr null; void* handle
	}, ; 767
	%struct.DSOCacheEntry {
		i64 u0x00000000f798b9c4, ; from name: libaot-Xamarin.KotlinX.Serialization.Core.Jvm
		i64 u0x00000000f1077784, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Xamarin.KotlinX.Serialization.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 768
	%struct.DSOCacheEntry {
		i64 u0x00000000f7a11e55, ; from name: aot-System
		i64 u0x00000000d4110d87, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.90_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 769
	%struct.DSOCacheEntry {
		i64 u0x00000000f8088b43, ; from name: libaot-System.Private.CoreLib
		i64 u0x00000000f5dad612, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.94_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 770
	%struct.DSOCacheEntry {
		i64 u0x00000000f87f2874, ; from name: libaot-Xamarin.AndroidX.Core
		i64 u0x0000000003b7ead2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 771
	%struct.DSOCacheEntry {
		i64 u0x00000000f8d3ca98, ; from name: aot-Microsoft.Maui.Essentials
		i64 u0x0000000085d2bea6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Microsoft.Maui.Essentials.dll.so
		ptr null; void* handle
	}, ; 772
	%struct.DSOCacheEntry {
		i64 u0x00000000f8e063db, ; from name: aot-System.Collections.Specialized.so
		i64 u0x00000000a8bf5d10, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 773
	%struct.DSOCacheEntry {
		i64 u0x00000000f97d7588, ; from name: libaot-System.Threading.dll.so
		i64 u0x00000000f97d7588, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.88_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 774
	%struct.DSOCacheEntry {
		i64 u0x00000000f98b7593, ; from name: aot-System.Text.RegularExpressions.so
		i64 u0x000000000eb7b864, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.86_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 775
	%struct.DSOCacheEntry {
		i64 u0x00000000fa43ee91, ; from name: aot-Xamarin.AndroidX.CardView
		i64 u0x00000000eaa1bb0f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-Xamarin.AndroidX.CardView.dll.so
		ptr null; void* handle
	}, ; 776
	%struct.DSOCacheEntry {
		i64 u0x00000000fa71c0fa, ; from name: Xamarin.AndroidX.CursorAdapter.so
		i64 u0x000000004057e9b0, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.CursorAdapter.dll.so
		ptr null; void* handle
	}, ; 777
	%struct.DSOCacheEntry {
		i64 u0x00000000fa817a6a, ; from name: aot-System.ComponentModel.Primitives.so
		i64 u0x0000000013221fbc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 778
	%struct.DSOCacheEntry {
		i64 u0x00000000fac98279, ; from name: Xamarin.AndroidX.SavedState.SavedState.Android
		i64 u0x000000000418b010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-Xamarin.AndroidX.SavedState.SavedState.Android.dll.so
		ptr null; void* handle
	}, ; 779
	%struct.DSOCacheEntry {
		i64 u0x00000000fbc5aaca, ; from name: aot-Mono.Android.Runtime
		i64 u0x000000009f9275a1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.92_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 780
	%struct.DSOCacheEntry {
		i64 u0x00000000fd54c190, ; from name: Xamarin.Kotlin.StdLib.so
		i64 u0x000000000e003282, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 781
	%struct.DSOCacheEntry {
		i64 u0x00000000fd87bbbb, ; from name: libaot-System.Text.Json.so
		i64 u0x00000000a170e652, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.85_name, ; name: libaot-System.Text.Json.dll.so
		ptr null; void* handle
	}, ; 782
	%struct.DSOCacheEntry {
		i64 u0x00000000fd9a2742, ; from name: aot-System.Collections.Specialized.dll.so
		i64 u0x00000000a8bf5d10, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 783
	%struct.DSOCacheEntry {
		i64 u0x00000000fe1dc410, ; from name: aot-Xamarin.KotlinX.Serialization.Core.Jvm.dll.so
		i64 u0x00000000f1077784, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-Xamarin.KotlinX.Serialization.Core.Jvm.dll.so
		ptr null; void* handle
	}, ; 784
	%struct.DSOCacheEntry {
		i64 u0x00000000fe2826de, ; from name: libaot-System.Runtime.InteropServices
		i64 u0x000000008bbc0be1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.79_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 785
	%struct.DSOCacheEntry {
		i64 u0x00000000fe28d611, ; from name: aot-Xamarin.AndroidX.SwipeRefreshLayout.so
		i64 u0x00000000f52a5c06, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		ptr null; void* handle
	}, ; 786
	%struct.DSOCacheEntry {
		i64 u0x00000000fe92288c, ; from name: aot-Microsoft.Extensions.Options.dll.so
		i64 u0x000000003ce4cf8f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Microsoft.Extensions.Options.dll.so
		ptr null; void* handle
	}, ; 787
	%struct.DSOCacheEntry {
		i64 u0x00000000fecef6ea, ; from name: System.Runtime.Numerics
		i64 u0x00000000ad907b53, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.81_name, ; name: libaot-System.Runtime.Numerics.dll.so
		ptr null; void* handle
	}, ; 788
	%struct.DSOCacheEntry {
		i64 u0x00000000ff22cb23, ; from name: libaot-System.Text.Encodings.Web
		i64 u0x000000006ca8bc02, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.84_name, ; name: libaot-System.Text.Encodings.Web.dll.so
		ptr null; void* handle
	}, ; 789
	%struct.DSOCacheEntry {
		i64 u0x00000000ffa2715e, ; from name: System.Drawing.dll.so
		i64 u0x0000000038a1e793, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Drawing.dll.so
		ptr null; void* handle
	}, ; 790
	%struct.DSOCacheEntry {
		i64 u0x00000000fff9f20a, ; from name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions
		i64 u0x00000000b0dedb6b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		ptr null; void* handle
	} ; 791
], align 8

@dso_apk_entries = dso_local local_unnamed_addr global [95 x %struct.DSOApkEntry] zeroinitializer, align 8

; Bundled assembly name buffers, all empty (unused when assembly stores are enabled)
@bundled_assemblies = dso_local local_unnamed_addr global [0 x %struct.XamarinAndroidBundledAssembly] zeroinitializer, align 4

@assembly_store_bundled_assemblies = dso_local local_unnamed_addr global [122 x %struct.AssemblyStoreSingleAssemblyRuntimeData] zeroinitializer, align 4

@assembly_store = dso_local local_unnamed_addr global %struct.AssemblyStoreRuntimeData {
	ptr null, ; uint8_t* data_start
	i32 0, ; uint32_t assembly_count
	i32 0, ; uint32_t index_entry_count
	ptr null; AssemblyStoreAssemblyDescriptor* assemblies
}, align 4

; Strings
@.env.0 = private unnamed_addr constant [7 x i8] c"normal\00", align 1

; Application environment variables name:value pairs
@.env.var.0 = private unnamed_addr constant [15 x i8] c"MONO_GC_PARAMS\00", align 1
@.env.var.1 = private unnamed_addr constant [21 x i8] c"major=marksweep-conc\00", align 1
@.env.var.2 = private unnamed_addr constant [28 x i8] c"XA_HTTP_CLIENT_HANDLER_TYPE\00", align 1
@.env.var.3 = private unnamed_addr constant [42 x i8] c"Xamarin.Android.Net.AndroidMessageHandler\00", align 1

;ApplicationConfig
@.ApplicationConfig.0_android_package_name = private unnamed_addr constant [25 x i8] c"com.companyname.concurso\00", align 1

;DSOCacheEntry
@.DSOCacheEntry.0_name = private unnamed_addr constant [34 x i8] c"libSystem.Globalization.Native.so\00", align 1
@.DSOCacheEntry.1_name = private unnamed_addr constant [35 x i8] c"libSystem.IO.Compression.Native.so\00", align 1
@.DSOCacheEntry.2_name = private unnamed_addr constant [20 x i8] c"libSystem.Native.so\00", align 1
@.DSOCacheEntry.3_name = private unnamed_addr constant [50 x i8] c"libSystem.Security.Cryptography.Native.Android.so\00", align 1
@.DSOCacheEntry.4_name = private unnamed_addr constant [35 x i8] c"libmono-component-marshal-ilgen.so\00", align 1
@.DSOCacheEntry.5_name = private unnamed_addr constant [19 x i8] c"libmonosgen-2.0.so\00", align 1
@.DSOCacheEntry.6_name = private unnamed_addr constant [16 x i8] c"libmonodroid.so\00", align 1
@.DSOCacheEntry.7_name = private unnamed_addr constant [51 x i8] c"libaot-_Microsoft.Android.Resource.Designer.dll.so\00", align 1
@.DSOCacheEntry.8_name = private unnamed_addr constant [23 x i8] c"libaot-Concurso.dll.so\00", align 1
@.DSOCacheEntry.9_name = private unnamed_addr constant [49 x i8] c"libaot-Microsoft.Extensions.Configuration.dll.so\00", align 1
@.DSOCacheEntry.10_name = private unnamed_addr constant [62 x i8] c"libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so\00", align 1
@.DSOCacheEntry.11_name = private unnamed_addr constant [55 x i8] c"libaot-Microsoft.Extensions.DependencyInjection.dll.so\00", align 1
@.DSOCacheEntry.12_name = private unnamed_addr constant [68 x i8] c"libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so\00", align 1
@.DSOCacheEntry.13_name = private unnamed_addr constant [60 x i8] c"libaot-Microsoft.Extensions.Diagnostics.Abstractions.dll.so\00", align 1
@.DSOCacheEntry.14_name = private unnamed_addr constant [62 x i8] c"libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so\00", align 1
@.DSOCacheEntry.15_name = private unnamed_addr constant [56 x i8] c"libaot-Microsoft.Extensions.Hosting.Abstractions.dll.so\00", align 1
@.DSOCacheEntry.16_name = private unnamed_addr constant [43 x i8] c"libaot-Microsoft.Extensions.Logging.dll.so\00", align 1
@.DSOCacheEntry.17_name = private unnamed_addr constant [56 x i8] c"libaot-Microsoft.Extensions.Logging.Abstractions.dll.so\00", align 1
@.DSOCacheEntry.18_name = private unnamed_addr constant [43 x i8] c"libaot-Microsoft.Extensions.Options.dll.so\00", align 1
@.DSOCacheEntry.19_name = private unnamed_addr constant [46 x i8] c"libaot-Microsoft.Extensions.Primitives.dll.so\00", align 1
@.DSOCacheEntry.20_name = private unnamed_addr constant [38 x i8] c"libaot-Microsoft.Maui.Controls.dll.so\00", align 1
@.DSOCacheEntry.21_name = private unnamed_addr constant [43 x i8] c"libaot-Microsoft.Maui.Controls.Xaml.dll.so\00", align 1
@.DSOCacheEntry.22_name = private unnamed_addr constant [29 x i8] c"libaot-Microsoft.Maui.dll.so\00", align 1
@.DSOCacheEntry.23_name = private unnamed_addr constant [40 x i8] c"libaot-Microsoft.Maui.Essentials.dll.so\00", align 1
@.DSOCacheEntry.24_name = private unnamed_addr constant [38 x i8] c"libaot-Microsoft.Maui.Graphics.dll.so\00", align 1
@.DSOCacheEntry.25_name = private unnamed_addr constant [40 x i8] c"libaot-Xamarin.AndroidX.Activity.dll.so\00", align 1
@.DSOCacheEntry.26_name = private unnamed_addr constant [41 x i8] c"libaot-Xamarin.AndroidX.AppCompat.dll.so\00", align 1
@.DSOCacheEntry.27_name = private unnamed_addr constant [60 x i8] c"libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so\00", align 1
@.DSOCacheEntry.28_name = private unnamed_addr constant [40 x i8] c"libaot-Xamarin.AndroidX.CardView.dll.so\00", align 1
@.DSOCacheEntry.29_name = private unnamed_addr constant [46 x i8] c"libaot-Xamarin.AndroidX.Collection.Jvm.dll.so\00", align 1
@.DSOCacheEntry.30_name = private unnamed_addr constant [49 x i8] c"libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so\00", align 1
@.DSOCacheEntry.31_name = private unnamed_addr constant [36 x i8] c"libaot-Xamarin.AndroidX.Core.dll.so\00", align 1
@.DSOCacheEntry.32_name = private unnamed_addr constant [45 x i8] c"libaot-Xamarin.AndroidX.CursorAdapter.dll.so\00", align 1
@.DSOCacheEntry.33_name = private unnamed_addr constant [42 x i8] c"libaot-Xamarin.AndroidX.CustomView.dll.so\00", align 1
@.DSOCacheEntry.34_name = private unnamed_addr constant [44 x i8] c"libaot-Xamarin.AndroidX.DrawerLayout.dll.so\00", align 1
@.DSOCacheEntry.35_name = private unnamed_addr constant [40 x i8] c"libaot-Xamarin.AndroidX.Fragment.dll.so\00", align 1
@.DSOCacheEntry.36_name = private unnamed_addr constant [52 x i8] c"libaot-Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so\00", align 1
@.DSOCacheEntry.37_name = private unnamed_addr constant [55 x i8] c"libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so\00", align 1
@.DSOCacheEntry.38_name = private unnamed_addr constant [59 x i8] c"libaot-Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so\00", align 1
@.DSOCacheEntry.39_name = private unnamed_addr constant [69 x i8] c"libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so\00", align 1
@.DSOCacheEntry.40_name = private unnamed_addr constant [38 x i8] c"libaot-Xamarin.AndroidX.Loader.dll.so\00", align 1
@.DSOCacheEntry.41_name = private unnamed_addr constant [57 x i8] c"libaot-Xamarin.AndroidX.Navigation.Common.Android.dll.so\00", align 1
@.DSOCacheEntry.42_name = private unnamed_addr constant [51 x i8] c"libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so\00", align 1
@.DSOCacheEntry.43_name = private unnamed_addr constant [58 x i8] c"libaot-Xamarin.AndroidX.Navigation.Runtime.Android.dll.so\00", align 1
@.DSOCacheEntry.44_name = private unnamed_addr constant [45 x i8] c"libaot-Xamarin.AndroidX.Navigation.UI.dll.so\00", align 1
@.DSOCacheEntry.45_name = private unnamed_addr constant [44 x i8] c"libaot-Xamarin.AndroidX.RecyclerView.dll.so\00", align 1
@.DSOCacheEntry.46_name = private unnamed_addr constant [61 x i8] c"libaot-Xamarin.AndroidX.SavedState.SavedState.Android.dll.so\00", align 1
@.DSOCacheEntry.47_name = private unnamed_addr constant [50 x i8] c"libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so\00", align 1
@.DSOCacheEntry.48_name = private unnamed_addr constant [41 x i8] c"libaot-Xamarin.AndroidX.ViewPager.dll.so\00", align 1
@.DSOCacheEntry.49_name = private unnamed_addr constant [42 x i8] c"libaot-Xamarin.AndroidX.ViewPager2.dll.so\00", align 1
@.DSOCacheEntry.50_name = private unnamed_addr constant [46 x i8] c"libaot-Xamarin.Google.Android.Material.dll.so\00", align 1
@.DSOCacheEntry.51_name = private unnamed_addr constant [36 x i8] c"libaot-Xamarin.Kotlin.StdLib.dll.so\00", align 1
@.DSOCacheEntry.52_name = private unnamed_addr constant [50 x i8] c"libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so\00", align 1
@.DSOCacheEntry.53_name = private unnamed_addr constant [53 x i8] c"libaot-Xamarin.KotlinX.Serialization.Core.Jvm.dll.so\00", align 1
@.DSOCacheEntry.54_name = private unnamed_addr constant [44 x i8] c"libaot-System.Collections.Concurrent.dll.so\00", align 1
@.DSOCacheEntry.55_name = private unnamed_addr constant [44 x i8] c"libaot-System.Collections.NonGeneric.dll.so\00", align 1
@.DSOCacheEntry.56_name = private unnamed_addr constant [45 x i8] c"libaot-System.Collections.Specialized.dll.so\00", align 1
@.DSOCacheEntry.57_name = private unnamed_addr constant [33 x i8] c"libaot-System.Collections.dll.so\00", align 1
@.DSOCacheEntry.58_name = private unnamed_addr constant [47 x i8] c"libaot-System.ComponentModel.Primitives.dll.so\00", align 1
@.DSOCacheEntry.59_name = private unnamed_addr constant [50 x i8] c"libaot-System.ComponentModel.TypeConverter.dll.so\00", align 1
@.DSOCacheEntry.60_name = private unnamed_addr constant [36 x i8] c"libaot-System.ComponentModel.dll.so\00", align 1
@.DSOCacheEntry.61_name = private unnamed_addr constant [29 x i8] c"libaot-System.Console.dll.so\00", align 1
@.DSOCacheEntry.62_name = private unnamed_addr constant [50 x i8] c"libaot-System.Diagnostics.DiagnosticSource.dll.so\00", align 1
@.DSOCacheEntry.63_name = private unnamed_addr constant [40 x i8] c"libaot-System.Drawing.Primitives.dll.so\00", align 1
@.DSOCacheEntry.64_name = private unnamed_addr constant [29 x i8] c"libaot-System.Drawing.dll.so\00", align 1
@.DSOCacheEntry.65_name = private unnamed_addr constant [34 x i8] c"libaot-System.Formats.Asn1.dll.so\00", align 1
@.DSOCacheEntry.66_name = private unnamed_addr constant [43 x i8] c"libaot-System.IO.Compression.Brotli.dll.so\00", align 1
@.DSOCacheEntry.67_name = private unnamed_addr constant [36 x i8] c"libaot-System.IO.Compression.dll.so\00", align 1
@.DSOCacheEntry.68_name = private unnamed_addr constant [34 x i8] c"libaot-System.IO.Pipelines.dll.so\00", align 1
@.DSOCacheEntry.69_name = private unnamed_addr constant [38 x i8] c"libaot-System.Linq.Expressions.dll.so\00", align 1
@.DSOCacheEntry.70_name = private unnamed_addr constant [26 x i8] c"libaot-System.Linq.dll.so\00", align 1
@.DSOCacheEntry.71_name = private unnamed_addr constant [28 x i8] c"libaot-System.Memory.dll.so\00", align 1
@.DSOCacheEntry.72_name = private unnamed_addr constant [30 x i8] c"libaot-System.Net.Http.dll.so\00", align 1
@.DSOCacheEntry.73_name = private unnamed_addr constant [36 x i8] c"libaot-System.Net.Primitives.dll.so\00", align 1
@.DSOCacheEntry.74_name = private unnamed_addr constant [34 x i8] c"libaot-System.Net.Requests.dll.so\00", align 1
@.DSOCacheEntry.75_name = private unnamed_addr constant [38 x i8] c"libaot-System.Numerics.Vectors.dll.so\00", align 1
@.DSOCacheEntry.76_name = private unnamed_addr constant [33 x i8] c"libaot-System.ObjectModel.dll.so\00", align 1
@.DSOCacheEntry.77_name = private unnamed_addr constant [33 x i8] c"libaot-System.Private.Uri.dll.so\00", align 1
@.DSOCacheEntry.78_name = private unnamed_addr constant [33 x i8] c"libaot-System.Private.Xml.dll.so\00", align 1
@.DSOCacheEntry.79_name = private unnamed_addr constant [45 x i8] c"libaot-System.Runtime.InteropServices.dll.so\00", align 1
@.DSOCacheEntry.80_name = private unnamed_addr constant [36 x i8] c"libaot-System.Runtime.Loader.dll.so\00", align 1
@.DSOCacheEntry.81_name = private unnamed_addr constant [38 x i8] c"libaot-System.Runtime.Numerics.dll.so\00", align 1
@.DSOCacheEntry.82_name = private unnamed_addr constant [29 x i8] c"libaot-System.Runtime.dll.so\00", align 1
@.DSOCacheEntry.83_name = private unnamed_addr constant [43 x i8] c"libaot-System.Security.Cryptography.dll.so\00", align 1
@.DSOCacheEntry.84_name = private unnamed_addr constant [40 x i8] c"libaot-System.Text.Encodings.Web.dll.so\00", align 1
@.DSOCacheEntry.85_name = private unnamed_addr constant [31 x i8] c"libaot-System.Text.Json.dll.so\00", align 1
@.DSOCacheEntry.86_name = private unnamed_addr constant [45 x i8] c"libaot-System.Text.RegularExpressions.dll.so\00", align 1
@.DSOCacheEntry.87_name = private unnamed_addr constant [38 x i8] c"libaot-System.Threading.Thread.dll.so\00", align 1
@.DSOCacheEntry.88_name = private unnamed_addr constant [31 x i8] c"libaot-System.Threading.dll.so\00", align 1
@.DSOCacheEntry.89_name = private unnamed_addr constant [38 x i8] c"libaot-System.Xml.ReaderWriter.dll.so\00", align 1
@.DSOCacheEntry.90_name = private unnamed_addr constant [21 x i8] c"libaot-System.dll.so\00", align 1
@.DSOCacheEntry.91_name = private unnamed_addr constant [27 x i8] c"libaot-Java.Interop.dll.so\00", align 1
@.DSOCacheEntry.92_name = private unnamed_addr constant [35 x i8] c"libaot-Mono.Android.Runtime.dll.so\00", align 1
@.DSOCacheEntry.93_name = private unnamed_addr constant [27 x i8] c"libaot-Mono.Android.dll.so\00", align 1
@.DSOCacheEntry.94_name = private unnamed_addr constant [37 x i8] c"libaot-System.Private.CoreLib.dll.so\00", align 1

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ 01024bb616e7b80417a2c6d320885bfdb956f20a"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
