Received: from sonic310-23.consmr.mail.ne1.yahoo.com (sonic310-23.consmr.mail.ne1.yahoo.com [66.163.186.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352A12B2CF
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Mar 2025 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.186.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743421559; cv=none; b=pF00D4pO6D+sHEaICYglPJw90zo+52B309O/Cm67PGg+STLPzUAnL+IfYiOwpHHuNkh3RxNeTpfEw+YrB/JMghOycYonTS+RtKKqcpuCQzfKRZLCBEykDyYdqYg/qPOgTWQeti+CpvzBSSjLOrI1gvYzzEAiBi4RIRGTdE/tOC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743421559; c=relaxed/simple;
	bh=acnmWoGfRFfeB7Xm2VH5JoHEy9CU83i/VLOKPDwFsSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4P+m6DxAS7OylE13xB9MetRz/SyXcpHgwYFvD9sU27m7Pj1fofOG/OChXU3uNQnbAc3FYkt7eHnK/MS3JI/GDzvK4rhyGc/PBm9RQx5ZI+2vry6RmMAB6L34IokrfF0kITICZHzCfqt6KJCWycitdZ9i1I1R+GNsO/HQkmM4K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=YZgyhU6u; arc=none smtp.client-ip=66.163.186.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="YZgyhU6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743421556; bh=VttGrAYkkWca+601Abqsvn3ewhW73cfMpbkNsZbY7wg=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=YZgyhU6uf3EVnSfOoqhe9HgSAFEL4nlqDenIQR66RKbGZyvQ0W19hZi360wsRzL5W8x0o6XHZzFxWDEVrW6dH3UAtoDkxQwVrxFIV8AkNpTxY+54MHxCeyShJoe8kn59+xSGKe75fOG9urA940YXkNWF3EEIh5uzJEhQHmSR9OPAJe9+flZitxsdaFQWjbPYiFNajLTDui648PQ8yZQXfjwkG+ymlVTUoOSn+A2kyH+tFxdL/ef9otz0BC9LrujJAIUsmwLtIErPaiVlsQId+Etbd+jZ6uTdzJFwGJCxRKIlrSg7nRNpJpb7j4JhDABXV2cCjgRZlxGU/2nhjVmzgw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743421556; bh=XVNJCAKAfT3vFNgZNYPjN8yCs5BMfvVIb8w3XSoVcFa=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ATfq1Dgr5xwZQnLafTJ31XapJiWtaLMdIDybpACjFfi/b/u+w73T60UsjopbeQtVCEUog4pzTgcWslgSeZ26ypdkMMJdigp+0fgaIcWGgXAxktaBlRBVHLKywF7+aY9vktw9qLPNXtVP6tRNU+v+vW3v0/ZK47bv+eKSGKgWnnykTp1UCbMF2FjTwXdoINWO37lnGEHyPDZQ+IVlpdDbjwLl2wh4+dvjj8VB3RSziOk+c7d7VjGdb/fsPBiLNIqdq+h6xiLOZxxfKz4nO11gPsSMw/SGYjsc5iQHdCvJWF0L1tZZ9AX9r2ZK/VSzTsb7M0h3Cs6C0FUmBilzSook7Q==
X-YMail-OSG: CvAimM4VM1kGJl6CMbXuX4A5vq3Qt38AFwnJ7pa.bFYR0o25XarTy55W3kvNpuY
 SqtfzZXyAZ6INAseaBTr0vN56qvpwy5t5MTtuUBv8ScIKuHSIZa.jb3tUNZ9xqxVulJi2GfuoLpe
 8auCAPWIEzXDV1fJxO0txJRLBdKr9eQ2BToQOvXz3xLi2Yc.3V5B..J54dmSI.ioyf9qEcbB_.i2
 OABKLCYuhWw3f5kGIa27mpRBKztN9pTrgtL6RPa0iznwodlL3dDdYxoYD4kRILT1ZauytPdFcd_C
 AxVV40ZmBAkOh9w0W2zh.NA1FvyGpmq08s7pD_N_yFp4F3a8bho2jUXamujyTKALUxBg2u4awmeH
 muat_gxNYEzSFygzzy_Xoz6Icnf4VQlqpMgZt8wX8jRFWpsoVe7P6N56R.B.VR4.QrMbtXRDPMcE
 4OXGIBqt664S4yLYuYMxqvBR7ZLmb3CCcCNdpKUtlxsuAkehvqSSJWKp3fXVlhBhxUM0_TwCqzkc
 cisZpSrUnoa43LhgJWK322_2N3Ryz3R5nVk_wofu.2nsGdljXRB1aJSBK6UaGKiOjewZgD6wo1az
 pQmVLpxd7b2hvku14izTXXm5ovu5srwrtXSsjDm2KXzAIxhkauLeJgrlIrSwfk0uLPMvJjklyd8t
 UzVTe0DskzN0P_gqm_7KI42qF9n8r7lOMSJ_twKt2.7iHQTZlb_i6yBXJFU7AMVREAo.BDXAUhY9
 9ag57hzWTwOR0ckNlQ0a1jQb3rqtHtBRKwIJe2JB29jUG_E299PkcBzcO2mefAzVB1J0.kgEfsHd
 2sxnx7riUP0rlvHaX_LyQ7bWaYuSF6xxPIcTdmMWvQV1VimPXihbzG0gm85i6rwrJIN8Hbyp9qgQ
 5ACaYe.QVCnFrEya8aM9DjJyOfZlbJKkXcl6xw2fxNNiJeelkzcUjlXJTQAAQGRVa.wO1RYzrb9a
 ftl2iRcy91hF3RHCE4Ca897tsz7iTGsyvUd7EMje4tfZ07QGHN4enp6LcOnp44pcW2dhTsu_O8CX
 66gUfP87cOtiJkBfWVOyI9u.miqalD2RsA.krEkBi2lwr5oUj_H3RZ6xqNM4333m_qfW2fpWQLOU
 F7uSNcUuAgwc8Yz_lWBAnQjp1BipRm39djV5CHbcPcXDFxfo.83xzjIEXevajiU2d3MSMB2005s7
 816Ce4hAoVmLdKM5OC_aK9xIpoR6MQKG_gbyNZsFqIKsT6BvpNV105rPyQ7MJYbByeBgUxDaRBUe
 RE6Ivz9VvSX4Y9HrgkBviMVZVA2QUJCeUARZBny7AMWUEuqj8ATYIx4yB4h4meg4WAsOHMyzBROJ
 09WNAVsMVtfes78hLaLWCu2ko9yvh.7vTvnZBP61hJGE8G9ZP4etJCZyHXZVYFUNaJAxGvh1gIsi
 7orAIk_J1VoZMrSYpyXCZ6ouzAGBrCA3yManjzROGYLaRmjN0VcsKbEpCxKTl8yHIVG9Fx4fBkS3
 KSl9ljp6.pBuDLZ8QMAJXAUknbUXrUMkVPei0sXtOvKiwo9k0vtdMf592HoCi77BGSlanrmJHStO
 qtncn2QAD.UAQzd7tO.9SO8onsANlxKnSyHbjBrcF0hIQSPKI6MUXvwjxfYzy.CYlOQjGEYbTFSV
 Eqo7WaFFY268TbRb5adpPuANmS5NSPI8okZ9bzA_kpAjIRa2nfCZFLGEFodVc1Pqq1IO9cubjI9W
 CE67US6kFG861lSMTMoI4nNtZ1FSvR9OAbDdz9rAL7wehiGugk6ExDmMVfVLXoGPPvBGib7WfVa4
 26Cb.piS_CF_P5L75JcrNuD6gY7dJ7t5JlS.YklxHHIPQwoly..7qoUCc4RmxN3GIoF1_hU_YFah
 hNcNR7cixtLQfk34Ry2nQJ432py6vGLEfDcHlkWWiXBW9kNWn6F2XeMhTb4WiN0Hz0nqbL0tGhvN
 hj7zihTMZUsv1Tw1rM0eqrD.QYk5BSFdiPsz3VXT_y_q1WFSWwwEJzd81k3BH.c3W7q75zmtoyvJ
 p2KUaZfY0g7U89i9iskkhbdbw5wr6BqznXASdyjZ60BEcE7sXsw7TW3ilDFr_XXyGQBjNjBvKIE9
 GnKids_3wc7q1LFdvOBRr2JARIeIDht_J0L5sc3BzgSBynYKqOR7Ys1VnAqjRGxBZ7XEQXmCw.eP
 SXvkZgzIz4lR0ZbyEXDxgRGzTI3dbTSRf8JuQpt65W62Ht9.A5EKXyaROXDf6Z9O2foAkS9gtha9
 6AEFXYQ6elHJAC4nmwdx9AhE2jHjncs2rzheW_LeCmRx9G_GlIqEE0PT8GCza3OFm1iVk84TCaGq
 qjQEY8gFCc.XyJo8MxzH1EQ--
X-Sonic-MF: <igor.korotin@yahoo.com>
X-Sonic-ID: 161b5e3c-16f1-4464-abfb-c8d2512b16f3
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Mon, 31 Mar 2025 11:45:56 +0000
Received: by hermes--production-ir2-54ff696c44-q4r8d (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 53259e9f323217de5b5eb3981fea127f;
          Mon, 31 Mar 2025 10:24:54 +0000 (UTC)
From: Igor Korotin <igor.korotin@yahoo.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Igor Korotin <igor.korotin@yahoo.com>
Subject: [PATCH] rust: macros: Fix macro referencing core and kernel crates
Date: Mon, 31 Mar 2025 11:24:51 +0100
Message-ID: <20250331102451.2362415-1-igor.korotin@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me>
References: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix macros and auto-generated code to use absolute paths, `::core::...`
and `::kernel::...`, for core and kernel references. This prevents issues
where user-defined modules named `core` or `kernel` could be picked up
instead of the `core` or `kernel` crates.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Closes: https://github.com/Rust-for-Linux/linux/issues/1150
Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>
---

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
 rust/kernel/static_assert.rs    |  4 ++--
 rust/kernel/str.rs              |  4 ++--
 rust/macros/kunit.rs            | 22 +++++++++++-----------
 rust/macros/lib.rs              |  6 +++---
 rust/macros/module.rs           | 31 ++++++++++++++++---------------
 scripts/rustdoc_test_builder.rs |  9 ++++++---
 scripts/rustdoc_test_gen.rs     | 16 ++++++++++------
 11 files changed, 58 insertions(+), 50 deletions(-)

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
index db2d9658ba47..2b19a8597158 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -214,7 +214,7 @@ unsafe impl Sync for Device {}
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
index 3115ee0ba8e9..f3f8c6eb7360 100644
--- a/rust/kernel/static_assert.rs
+++ b/rust/kernel/static_assert.rs
@@ -16,7 +16,7 @@
 ///
 /// ```
 /// static_assert!(42 > 24);
-/// static_assert!(core::mem::size_of::<u8>() == 1);
+/// static_assert!(::core::mem::size_of::<u8>() == 1);
 ///
 /// const X: &[u8] = b"bar";
 /// static_assert!(X[1] == b'a');
@@ -29,6 +29,6 @@
 #[macro_export]
 macro_rules! static_assert {
     ($condition:expr) => {
-        const _: () = core::assert!($condition);
+        const _: () = ::core::assert!($condition);
     };
 }
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 878111cb77bc..aed7b2617c32 100644
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
index 4f553ecf40c0..61fc25228e72 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -88,29 +88,29 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
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
         let kunit_wrapper_fn_name = format!("kunit_rust_wrapper_{}", test);
         let kunit_wrapper = format!(
-            "unsafe extern \"C\" fn {}(_test: *mut kernel::bindings::kunit) {{ {}(); }}",
+            "unsafe extern \"C\" fn {}(_test: *mut ::kernel::bindings::kunit) {{ {}(); }}",
             kunit_wrapper_fn_name, test
         );
         writeln!(kunit_macros, "{kunit_wrapper}").unwrap();
         writeln!(
             test_cases,
-            "    kernel::kunit::kunit_case(kernel::c_str!(\"{}\"), {}),",
+            "    ::kernel::kunit::kunit_case(::kernel::c_str!(\"{}\"), {}),",
             test, kunit_wrapper_fn_name
         )
         .unwrap();
@@ -119,14 +119,14 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
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
index 8ab4e1f3eb45..615cefd4160a 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -224,20 +224,20 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
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
 
-            impl kernel::ModuleMetadata for {type_} {{
-                const NAME: &'static kernel::str::CStr = kernel::c_str!(\"{name}\");
+            impl ::kernel::ModuleMetadata for {type_} {{
+                const NAME: &'static ::kernel::str::CStr = ::kernel::c_str!(\"{name}\");
             }}
 
             // Double nested modules, since then nobody can access the public items inside.
@@ -255,8 +255,8 @@ mod __module_init {{
                     #[used]
                     static __IS_RUST_MODULE: () = ();
 
-                    static mut __MOD: core::mem::MaybeUninit<{type_}> =
-                        core::mem::MaybeUninit::uninit();
+                    static mut __MOD: ::core::mem::MaybeUninit<{type_}> =
+                        ::core::mem::MaybeUninit::uninit();
 
                     // Loadable modules need to export the `{{init,cleanup}}_module` identifiers.
                     /// # Safety
@@ -267,7 +267,7 @@ mod __module_init {{
                     #[doc(hidden)]
                     #[no_mangle]
                     #[link_section = \".init.text\"]
-                    pub unsafe extern \"C\" fn init_module() -> kernel::ffi::c_int {{
+                    pub unsafe extern \"C\" fn init_module() -> ::kernel::ffi::c_int {{
                         // SAFETY: This function is inaccessible to the outside due to the double
                         // module wrapping it. It is called exactly once by the C side via its
                         // unique name.
@@ -306,11 +306,12 @@ mod __module_init {{
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
@@ -321,7 +322,7 @@ mod __module_init {{
                     #[cfg(not(MODULE))]
                     #[doc(hidden)]
                     #[no_mangle]
-                    pub extern \"C\" fn __{name}_init() -> kernel::ffi::c_int {{
+                    pub extern \"C\" fn __{name}_init() -> ::kernel::ffi::c_int {{
                         // SAFETY: This function is inaccessible to the outside due to the double
                         // module wrapping it. It is called exactly once by the C side via its
                         // placement above in the initcall section.
@@ -344,9 +345,9 @@ mod __module_init {{
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
index e5894652f12c..f9bfff989f38 100644
--- a/scripts/rustdoc_test_builder.rs
+++ b/scripts/rustdoc_test_builder.rs
@@ -28,7 +28,8 @@ fn main() {
     //
     // ```
     // fn main() { #[allow(non_snake_case)] fn _doctest_main_rust_kernel_file_rs_28_0() {
-    // fn main() { #[allow(non_snake_case)] fn _doctest_main_rust_kernel_file_rs_37_0() -> Result<(), impl core::fmt::Debug> {
+    // fn main() { #[allow(non_snake_case)] fn _doctest_main_rust_kernel_file_rs_37_0() -> \
+    //     Result<(), impl ::core::fmt::Debug> {
     // ```
     //
     // It should be unlikely that doctest code matches such lines (when code is formatted properly).
@@ -49,8 +50,10 @@ fn main() {
 
     // Qualify `Result` to avoid the collision with our own `Result` coming from the prelude.
     let body = body.replace(
-        &format!("{rustdoc_function_name}() -> Result<(), impl core::fmt::Debug> {{"),
-        &format!("{rustdoc_function_name}() -> core::result::Result<(), impl core::fmt::Debug> {{"),
+        &format!("{rustdoc_function_name}() -> Result<(), impl ::core::fmt::Debug> {{"),
+        &format!(
+            "{rustdoc_function_name}() -> ::core::result::Result<(), impl ::core::fmt::Debug> {{"
+        ),
     );
 
     // For tests that get generated with `Result`, like above, `rustdoc` generates an `unwrap()` on
diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index 036635fb1621..f8d053f75270 100644
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

