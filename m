Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D57FD
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 16:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747673375; cv=none; b=Cmlhu+KR58Plu8rG4Uuk828o6/KUoFUhdH3xPET6MBSTXobrkk9+rDzaNflNKV0uQEHV0941iUZE4rdMJOqglOSfspsIxfrEqq8Y3j1rau6MjwYfQ8dScnFMIwevlOgV9YDjFp6EYIdZE+B4F0nbdHtbbFaSbb4fQ9Ry9scxdcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747673375; c=relaxed/simple;
	bh=6wgRqxW8Tr6G4OE6sSsCOnsmezmIrLM8f7v1D2dr3eM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXAHdehcShk/fMbNgjJlUUaTmYEg+hCNNDMCo4wzf84qTNtRWVin1qgnsUBBKs6eH8k8o59wPvmAOTXccQfa2yIrbkwoCnW6EV98gYweyBdSaCszazgbisj5njoM1HveFbZ22UaO58kF2bC+qBE5PAu1MhPf+6m7yKDssxYaFWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyWg2Ad9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyWg2Ad9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a064a3e143so2511740f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 09:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747673371; x=1748278171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzFqUimBUMjW/eao0+4wu8agueEip+A3kH1vdT2djKM=;
        b=AyWg2Ad9Uen+aQk+kFnQ+JL8FHuyCgCuCg9KjHcyUuhaNQIHFGjRNGOl5iJE2wIgHH
         i0yUWEiYymE2/pSlCQxTmfeau0sKkcS+mHJCvUtRa+H5MZSPQIUT6+1p7so7vQ2ZxPlx
         AKj35lJTcldObbRMs2BXtJQGi6c6riQV4ALtc3FGwJmlfIZE5f6LWprcOkJ38DFwgyis
         yQuo9zc1BtP+nPtdKelrKdcvk5MF4Fpzc0S2OT0k8HYxAkG6fy+FA7iVMrYjq0kc0NpY
         tT+zsHQQqcnPz39yC9JC2UEf+gdOhhkZG+SLifZAGr902iWS6Dg9Bb0wlTQNuT3oQBwe
         x9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747673371; x=1748278171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzFqUimBUMjW/eao0+4wu8agueEip+A3kH1vdT2djKM=;
        b=LBFSEOCw1rppXXLbI90AX5R/6iFV7vkau34r8TetLK4x35e8WpUe4i+ytn/zeOgRH3
         CH0MI1u9bzNumZEURTuYl03m0zbzSSsJk2NgHlzySGmdMlxsQNiA3N0cG0PJrITgPJdM
         Ke6a958FYEFMBJcPJA0+FMqrw57MxkcSd8pBGP32xEP9lpzAUZqsT/a3W9XaQp74TpjP
         WH4u0/eBLZhgrXt0uKNyP92ZdMssonGM25J6s7JgjzfOBiaCETGWqEgG67IsTngxJHNr
         ZnNkhKi2PkRody1E8t2SZt+rm6/LhZSh3AnyHcBKd5KKB9AEtlk5Nv1NYYjqx/KeHowj
         rJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG3IVsHGqJLs0wgFGfl6QBzT2G1spX9sO87naKRE/zGGvF+y6nQQ4h84oRoWS0h8KFsuPwxKLcs+Of4G9aXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrNVRs949q8D5yoNFiZqk8ZflN0tv5gMi5agmojHfAzDk65VPr
	Wag+cmyvrczq2va5dNLANOV51I4YCNsdrtheG5gWk8WAHLFOu1DcSDt0
X-Gm-Gg: ASbGncsDv7JajVAmaFlHHY04IWnfGeeJB4GVh+g/2Y+6RBqMm3NXbDYudOGUw0N5cAz
	teU/xX6La6J/P3HYHjd/TkZgWVCrhzeo8jAmP2g5HjhyWr/7DxctaSw6HrmGCHgWcv/otTnsJbT
	LMyQkqCGY8VrxJK+zNltbygwNBYPkgGt8D7lJ1scv70EO34HPjz8Zk+Q2ub24H2IybKDYtkPedD
	OHk6qwbwovlOdpT8Xs+mWFs2f7tj7+qGxGA43f7v01DRqzn6l1Nc1ieT+09t2cjLuyZ0rVtns01
	iDl3Uii55MCViACRjcDAl+CrDyalHtpkwiMangCnJQmonCiPm3gmpgPg34dzHRu4nIK2DGH2C8n
	FgdN1mXQ+BzqJdiwpmaLizrCbL1iL96Y=
X-Google-Smtp-Source: AGHT+IHn64ybJMcvUIk+lOAORX73VNTlo1W7mz9I2x1gXu3SGVSdIjFhowgUiTIAr5ZhTZD6/gEOww==
X-Received: by 2002:a05:6000:240a:b0:3a3:67e6:d27c with SMTP id ffacd0b85a97d-3a367e6d3d6mr7843966f8f.38.1747673370484;
        Mon, 19 May 2025 09:49:30 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a360b0b766sm13050601f8f.56.2025.05.19.09.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:49:29 -0700 (PDT)
From: igor.korotin.linux@gmail.com
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Igor Korotin <igor.korotin.linux@gmail.com>
Subject: [PATCH v5] rust: macros: Fix macro referencing core and kernel crates
Date: Mon, 19 May 2025 17:45:53 +0100
Message-ID: <20250519164615.3310844-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516122349.1944895-1-igor.korotin@yahoo.com>
References: <20250516122349.1944895-1-igor.korotin@yahoo.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Igor Korotin <igor.korotin.linux@gmail.com>

Fix macros and auto-generated code to use absolute paths, `::core::...`
and `::kernel::...`, for core and kernel references. This prevents issues
where user-defined modules named `core` or `kernel` could be picked up
instead of the `core` or `kernel` crates.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Closes: https://github.com/Rust-for-Linux/linux/issues/1150
Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---

Changes since v4:
 - dropped unrelated change in rust/kernel/static_assert.rs
 - link to v4: https://lore.kernel.org/rust-for-linux/20250516122349.1944895-1-igor.korotin@yahoo.com/
Changes since v3:
 - rebased changes on top of the branch rust-next
 - added one fix in auto-generated code in file rust/macros/module.rs
 - link to v3: https://lore.kernel.org/rust-for-linux/20250331102451.2362415-1-igor.korotin@yahoo.com/
Changes since v2:
 - rewrote commit message
 - link to v2: https://lore.kernel.org/lkml/20250328180312.2025317-2-igor.korotin@yahoo.com/
Changes since v1:
 - rewrote commit message
 - Added fixes in auto-generated code in files rust/macros/kunit.rs, 
   rust/macros/module.rs, scripts/rustdoc_test_builder.rs,
   scripts/rustdoc_test_gen.rs thanks to Benno
 - link to v1: https://lore.kernel.org/lkml/20250326182302.5650-1-igor.korotin@yahoo.com/

 rust/ffi.rs                     |  2 +-
 rust/kernel/device.rs           |  2 +-
 rust/kernel/device_id.rs        |  4 ++--
 rust/kernel/kunit.rs            |  8 ++++----
 rust/kernel/static_assert.rs    |  2 +-
 rust/kernel/str.rs              |  4 ++--
 rust/macros/kunit.rs            | 22 +++++++++++-----------
 rust/macros/lib.rs              |  6 +++---
 rust/macros/module.rs           | 31 ++++++++++++++++---------------
 scripts/rustdoc_test_builder.rs |  6 +++---
 scripts/rustdoc_test_gen.rs     | 16 ++++++++++------
 11 files changed, 54 insertions(+), 49 deletions(-)

diff --git a/rust/ffi.rs b/rust/ffi.rs
index 584f75b49862..d60aad792af4 100644
--- a/rust/ffi.rs
+++ b/rust/ffi.rs
@@ -17,7 +17,7 @@ macro_rules! alias {
 
         // Check size compatibility with `core`.
         const _: () = assert!(
-            core::mem::size_of::<$name>() == core::mem::size_of::<core::ffi::$name>()
+            ::core::mem::size_of::<$name>() == ::core::mem::size_of::<::core::ffi::$name>()
         );
     )*}
 }
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 5c372cf27ed0..539888465cc6 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -240,7 +240,7 @@ impl DeviceContext for Normal {}
 macro_rules! dev_printk {
     ($method:ident, $dev:expr, $($f:tt)*) => {
         {
-            ($dev).$method(core::format_args!($($f)*));
+            ($dev).$method(::core::format_args!($($f)*));
         }
     }
 }
diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index e5859217a579..0a4eb56d98f2 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -159,7 +159,7 @@ macro_rules! module_device_table {
                     "_", line!(),
                     "_", stringify!($table_name))
         ]
-        static $module_table_name: [core::mem::MaybeUninit<u8>; $table_name.raw_ids().size()] =
-            unsafe { core::mem::transmute_copy($table_name.raw_ids()) };
+        static $module_table_name: [::core::mem::MaybeUninit<u8>; $table_name.raw_ids().size()] =
+            unsafe { ::core::mem::transmute_copy($table_name.raw_ids()) };
     };
 }
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 1604fb6a5b1b..81833a687b75 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -59,7 +59,7 @@ macro_rules! kunit_assert {
             }
 
             static FILE: &'static $crate::str::CStr = $crate::c_str!($file);
-            static LINE: i32 = core::line!() as i32 - $diff;
+            static LINE: i32 = ::core::line!() as i32 - $diff;
             static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
 
             // SAFETY: FFI call without safety requirements.
@@ -130,11 +130,11 @@ unsafe impl Sync for UnaryAssert {}
             unsafe {
                 $crate::bindings::__kunit_do_failed_assertion(
                     kunit_test,
-                    core::ptr::addr_of!(LOCATION.0),
+                    ::core::ptr::addr_of!(LOCATION.0),
                     $crate::bindings::kunit_assert_type_KUNIT_ASSERTION,
-                    core::ptr::addr_of!(ASSERTION.0.assert),
+                    ::core::ptr::addr_of!(ASSERTION.0.assert),
                     Some($crate::bindings::kunit_unary_assert_format),
-                    core::ptr::null(),
+                    ::core::ptr::null(),
                 );
             }
 
diff --git a/rust/kernel/static_assert.rs b/rust/kernel/static_assert.rs
index d8120f838260..a57ba14315a0 100644
--- a/rust/kernel/static_assert.rs
+++ b/rust/kernel/static_assert.rs
@@ -34,6 +34,6 @@
 #[macro_export]
 macro_rules! static_assert {
     ($condition:expr $(,$arg:literal)?) => {
-        const _: () = core::assert!($condition $(,$arg)?);
+        const _: () = ::core::assert!($condition $(,$arg)?);
     };
 }
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 8768ab790580..61e6d3331b9c 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -595,7 +595,7 @@ fn deref(&self) -> &str {
 
     macro_rules! format {
         ($($f:tt)*) => ({
-            &*String::from_fmt(kernel::fmt!($($f)*))
+            &*String::from_fmt(::kernel::fmt!($($f)*))
         })
     }
 
@@ -944,5 +944,5 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// A convenience alias for [`core::format_args`].
 #[macro_export]
 macro_rules! fmt {
-    ($($f:tt)*) => ( core::format_args!($($f)*) )
+    ($($f:tt)*) => ( ::core::format_args!($($f)*) )
 }
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 99ccac82edde..b146c5894e92 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -85,28 +85,28 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     // Looks like:
     //
     // ```
-    // unsafe extern "C" fn kunit_rust_wrapper_foo(_test: *mut kernel::bindings::kunit) { foo(); }
-    // unsafe extern "C" fn kunit_rust_wrapper_bar(_test: *mut kernel::bindings::kunit) { bar(); }
+    // unsafe extern "C" fn kunit_rust_wrapper_foo(_test: *mut ::kernel::bindings::kunit) { foo(); }
+    // unsafe extern "C" fn kunit_rust_wrapper_bar(_test: *mut ::kernel::bindings::kunit) { bar(); }
     //
-    // static mut TEST_CASES: [kernel::bindings::kunit_case; 3] = [
-    //     kernel::kunit::kunit_case(kernel::c_str!("foo"), kunit_rust_wrapper_foo),
-    //     kernel::kunit::kunit_case(kernel::c_str!("bar"), kunit_rust_wrapper_bar),
-    //     kernel::kunit::kunit_case_null(),
+    // static mut TEST_CASES: [::kernel::bindings::kunit_case; 3] = [
+    //     ::kernel::kunit::kunit_case(::kernel::c_str!("foo"), kunit_rust_wrapper_foo),
+    //     ::kernel::kunit::kunit_case(::kernel::c_str!("bar"), kunit_rust_wrapper_bar),
+    //     ::kernel::kunit::kunit_case_null(),
     // ];
     //
-    // kernel::kunit_unsafe_test_suite!(kunit_test_suit_name, TEST_CASES);
+    // ::kernel::kunit_unsafe_test_suite!(kunit_test_suit_name, TEST_CASES);
     // ```
     let mut kunit_macros = "".to_owned();
     let mut test_cases = "".to_owned();
     for test in &tests {
         let kunit_wrapper_fn_name = format!("kunit_rust_wrapper_{test}");
         let kunit_wrapper = format!(
-            "unsafe extern \"C\" fn {kunit_wrapper_fn_name}(_test: *mut kernel::bindings::kunit) {{ {test}(); }}"
+            "unsafe extern \"C\" fn {kunit_wrapper_fn_name}(_test: *mut ::kernel::bindings::kunit) {{ {test}(); }}"
         );
         writeln!(kunit_macros, "{kunit_wrapper}").unwrap();
         writeln!(
             test_cases,
-            "    kernel::kunit::kunit_case(kernel::c_str!(\"{test}\"), {kunit_wrapper_fn_name}),"
+            "    ::kernel::kunit::kunit_case(::kernel::c_str!(\"{test}\"), {kunit_wrapper_fn_name}),"
         )
         .unwrap();
     }
@@ -114,14 +114,14 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     writeln!(kunit_macros).unwrap();
     writeln!(
         kunit_macros,
-        "static mut TEST_CASES: [kernel::bindings::kunit_case; {}] = [\n{test_cases}    kernel::kunit::kunit_case_null(),\n];",
+        "static mut TEST_CASES: [::kernel::bindings::kunit_case; {}] = [\n{test_cases}    ::kernel::kunit::kunit_case_null(),\n];",
         tests.len() + 1
     )
     .unwrap();
 
     writeln!(
         kunit_macros,
-        "kernel::kunit_unsafe_test_suite!({attr}, TEST_CASES);"
+        "::kernel::kunit_unsafe_test_suite!({attr}, TEST_CASES);"
     )
     .unwrap();
 
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 9acaa68c974e..cb429eceff71 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -283,7 +283,7 @@ pub fn concat_idents(ts: TokenStream) -> TokenStream {
 /// # const binder_driver_return_protocol_BR_FAILED_REPLY: u32 = 14;
 /// macro_rules! pub_no_prefix {
 ///     ($prefix:ident, $($newname:ident),+) => {
-///         kernel::macros::paste! {
+///         ::kernel::macros::paste! {
 ///             $(pub(crate) const $newname: u32 = [<$prefix $newname>];)+
 ///         }
 ///     };
@@ -340,7 +340,7 @@ pub fn concat_idents(ts: TokenStream) -> TokenStream {
 /// # const binder_driver_return_protocol_BR_FAILED_REPLY: u32 = 14;
 /// macro_rules! pub_no_prefix {
 ///     ($prefix:ident, $($newname:ident),+) => {
-///         kernel::macros::paste! {
+///         ::kernel::macros::paste! {
 ///             $(pub(crate) const fn [<$newname:lower:span>]() -> u32 { [<$prefix $newname:span>] })+
 ///         }
 ///     };
@@ -375,7 +375,7 @@ pub fn concat_idents(ts: TokenStream) -> TokenStream {
 /// ```
 /// macro_rules! create_numbered_fn {
 ///     ($name:literal, $val:literal) => {
-///         kernel::macros::paste! {
+///         ::kernel::macros::paste! {
 ///             fn [<some_ $name _fn $val>]() -> u32 { $val }
 ///         }
 ///     };
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 2f66107847f7..721454a5dbe7 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -215,24 +215,24 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             // SAFETY: `__this_module` is constructed by the kernel at load time and will not be
             // freed until the module is unloaded.
             #[cfg(MODULE)]
-            static THIS_MODULE: kernel::ThisModule = unsafe {{
+            static THIS_MODULE: ::kernel::ThisModule = unsafe {{
                 extern \"C\" {{
-                    static __this_module: kernel::types::Opaque<kernel::bindings::module>;
+                    static __this_module: ::kernel::types::Opaque<::kernel::bindings::module>;
                 }}
 
-                kernel::ThisModule::from_ptr(__this_module.get())
+                ::kernel::ThisModule::from_ptr(__this_module.get())
             }};
             #[cfg(not(MODULE))]
-            static THIS_MODULE: kernel::ThisModule = unsafe {{
-                kernel::ThisModule::from_ptr(core::ptr::null_mut())
+            static THIS_MODULE: ::kernel::ThisModule = unsafe {{
+                ::kernel::ThisModule::from_ptr(::core::ptr::null_mut())
             }};
 
             /// The `LocalModule` type is the type of the module created by `module!`,
             /// `module_pci_driver!`, `module_platform_driver!`, etc.
             type LocalModule = {type_};
 
-            impl kernel::ModuleMetadata for {type_} {{
-                const NAME: &'static kernel::str::CStr = kernel::c_str!(\"{name}\");
+            impl ::kernel::ModuleMetadata for {type_} {{
+                const NAME: &'static ::kernel::str::CStr = ::kernel::c_str!(\"{name}\");
             }}
 
             // Double nested modules, since then nobody can access the public items inside.
@@ -250,8 +250,8 @@ mod __module_init {{
                     #[used]
                     static __IS_RUST_MODULE: () = ();
 
-                    static mut __MOD: core::mem::MaybeUninit<{type_}> =
-                        core::mem::MaybeUninit::uninit();
+                    static mut __MOD: ::core::mem::MaybeUninit<{type_}> =
+                        ::core::mem::MaybeUninit::uninit();
 
                     // Loadable modules need to export the `{{init,cleanup}}_module` identifiers.
                     /// # Safety
@@ -262,7 +262,7 @@ mod __module_init {{
                     #[doc(hidden)]
                     #[no_mangle]
                     #[link_section = \".init.text\"]
-                    pub unsafe extern \"C\" fn init_module() -> kernel::ffi::c_int {{
+                    pub unsafe extern \"C\" fn init_module() -> ::kernel::ffi::c_int {{
                         // SAFETY: This function is inaccessible to the outside due to the double
                         // module wrapping it. It is called exactly once by the C side via its
                         // unique name.
@@ -301,11 +301,12 @@ mod __module_init {{
                     #[doc(hidden)]
                     #[link_section = \"{initcall_section}\"]
                     #[used]
-                    pub static __{name}_initcall: extern \"C\" fn() -> kernel::ffi::c_int = __{name}_init;
+                    pub static __{name}_initcall: extern \"C\" fn() -> ::kernel::ffi::c_int =
+                        __{name}_init;
 
                     #[cfg(not(MODULE))]
                     #[cfg(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS)]
-                    core::arch::global_asm!(
+                    ::core::arch::global_asm!(
                         r#\".section \"{initcall_section}\", \"a\"
                         __{name}_initcall:
                             .long   __{name}_init - .
@@ -316,7 +317,7 @@ mod __module_init {{
                     #[cfg(not(MODULE))]
                     #[doc(hidden)]
                     #[no_mangle]
-                    pub extern \"C\" fn __{name}_init() -> kernel::ffi::c_int {{
+                    pub extern \"C\" fn __{name}_init() -> ::kernel::ffi::c_int {{
                         // SAFETY: This function is inaccessible to the outside due to the double
                         // module wrapping it. It is called exactly once by the C side via its
                         // placement above in the initcall section.
@@ -339,9 +340,9 @@ mod __module_init {{
                     /// # Safety
                     ///
                     /// This function must only be called once.
-                    unsafe fn __init() -> kernel::ffi::c_int {{
+                    unsafe fn __init() -> ::kernel::ffi::c_int {{
                         let initer =
-                            <{type_} as kernel::InPlaceModule>::init(&super::super::THIS_MODULE);
+                            <{type_} as ::kernel::InPlaceModule>::init(&super::super::THIS_MODULE);
                         // SAFETY: No data race, since `__MOD` can only be accessed by this module
                         // and there only `__init` and `__exit` access it. These functions are only
                         // called once and `__exit` cannot be called before or during `__init`.
diff --git a/scripts/rustdoc_test_builder.rs b/scripts/rustdoc_test_builder.rs
index e5894652f12c..81233fb56b66 100644
--- a/scripts/rustdoc_test_builder.rs
+++ b/scripts/rustdoc_test_builder.rs
@@ -28,7 +28,7 @@ fn main() {
     //
     // ```
     // fn main() { #[allow(non_snake_case)] fn _doctest_main_rust_kernel_file_rs_28_0() {
-    // fn main() { #[allow(non_snake_case)] fn _doctest_main_rust_kernel_file_rs_37_0() -> Result<(), impl core::fmt::Debug> {
+    // fn main() { #[allow(non_snake_case)] fn _doctest_main_rust_kernel_file_rs_37_0() -> Result<(), impl ::core::fmt::Debug> {
     // ```
     //
     // It should be unlikely that doctest code matches such lines (when code is formatted properly).
@@ -49,8 +49,8 @@ fn main() {
 
     // Qualify `Result` to avoid the collision with our own `Result` coming from the prelude.
     let body = body.replace(
-        &format!("{rustdoc_function_name}() -> Result<(), impl core::fmt::Debug> {{"),
-        &format!("{rustdoc_function_name}() -> core::result::Result<(), impl core::fmt::Debug> {{"),
+        &format!("{rustdoc_function_name}() -> Result<(), impl ::core::fmt::Debug> {{"),
+        &format!("{rustdoc_function_name}() -> ::core::result::Result<(), impl ::core::fmt::Debug> {{"),
     );
 
     // For tests that get generated with `Result`, like above, `rustdoc` generates an `unwrap()` on
diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index ec8d70ac888b..1ca253594d38 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -167,12 +167,14 @@ fn main() {
             rust_tests,
             r#"/// Generated `{name}` KUnit test case from a Rust documentation test.
 #[no_mangle]
-pub extern "C" fn {kunit_name}(__kunit_test: *mut kernel::bindings::kunit) {{
+pub extern "C" fn {kunit_name}(__kunit_test: *mut ::kernel::bindings::kunit) {{
     /// Overrides the usual [`assert!`] macro with one that calls KUnit instead.
     #[allow(unused)]
     macro_rules! assert {{
         ($cond:expr $(,)?) => {{{{
-            kernel::kunit_assert!("{kunit_name}", "{real_path}", __DOCTEST_ANCHOR - {line}, $cond);
+            ::kernel::kunit_assert!(
+                "{kunit_name}", "{real_path}", __DOCTEST_ANCHOR - {line}, $cond
+            );
         }}}}
     }}
 
@@ -180,13 +182,15 @@ macro_rules! assert {{
     #[allow(unused)]
     macro_rules! assert_eq {{
         ($left:expr, $right:expr $(,)?) => {{{{
-            kernel::kunit_assert_eq!("{kunit_name}", "{real_path}", __DOCTEST_ANCHOR - {line}, $left, $right);
+            ::kernel::kunit_assert_eq!(
+                "{kunit_name}", "{real_path}", __DOCTEST_ANCHOR - {line}, $left, $right
+            );
         }}}}
     }}
 
     // Many tests need the prelude, so provide it by default.
     #[allow(unused)]
-    use kernel::prelude::*;
+    use ::kernel::prelude::*;
 
     // Unconditionally print the location of the original doctest (i.e. rather than the location in
     // the generated file) so that developers can easily map the test back to the source code.
@@ -197,11 +201,11 @@ macro_rules! assert_eq {{
     // This follows the syntax for declaring test metadata in the proposed KTAP v2 spec, which may
     // be used for the proposed KUnit test attributes API. Thus hopefully this will make migration
     // easier later on.
-    kernel::kunit::info(format_args!("    # {kunit_name}.location: {real_path}:{line}\n"));
+    ::kernel::kunit::info(format_args!("    # {kunit_name}.location: {real_path}:{line}\n"));
 
     /// The anchor where the test code body starts.
     #[allow(unused)]
-    static __DOCTEST_ANCHOR: i32 = core::line!() as i32 + {body_offset} + 1;
+    static __DOCTEST_ANCHOR: i32 = ::core::line!() as i32 + {body_offset} + 1;
     {{
         {body}
         main();
-- 
2.43.0

