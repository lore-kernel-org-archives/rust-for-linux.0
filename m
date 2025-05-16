Received: from sonic307-56.consmr.mail.ne1.yahoo.com (sonic307-56.consmr.mail.ne1.yahoo.com [66.163.190.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7331322F178
	for <rust-for-linux@vger.kernel.org>; Fri, 16 May 2025 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.190.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398860; cv=none; b=EL3jkeyjofGjTupJcv1h+GlRVjUQnGVmNzMbktMYpNC1ritqTzoqLFqdGoIEqm7UDp1l1Tp4hctyQ+0q7624HXn6YoAwCTksXpb4ZZQrjAx/DtOcV76DwYrJ6RZJXcyaw7tTNheKGZ5xZGsYVwS1m/nXzgz4vKjuPukzK++1iEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398860; c=relaxed/simple;
	bh=V2h+FmHFEeDEa5if+ZhjkeGid46IbeqtjzHEZTopDrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=mxTGL53354hx//oKXedwSRssEYVgdnu8aKUzkNc+eqmGYXsE9iOM2Yrdyztfo9ujZF6ayEIsaDZCurWZC6Q6TbXeusCSn7AtZh3lGY98v6kLhV0NFJQdXXpZr/tZs1hnKdMs/z45BDvffdeRhy26EggBF0hcdwur9aKf+7jnJEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=lclfwcbv; arc=none smtp.client-ip=66.163.190.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="lclfwcbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747398857; bh=HWSorOLwHAl4KGo05it67Gz6N0djB2IEsfU7bUwECxE=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=lclfwcbvjN/tvwUaQRftoTp6gcujm4B16yUv8jyPqlga/v2q/Cq26m+S73Iqlst6p/LjpuZMv5jTGmdfkDy+yQcVAX3eBy5EqA7BMB1QOf+guhsb29htvoxmHvmWQsLufIshOA8asetM3GeDN0eE64voL47xqgXHCrnJYxxiW7yrTqYdZY3Xtme1SrXxquCk9LNb2Ajd6vAEPxMDtXNxa1hMR5i4SvNoNYmuvckQLgEOV6tYMJ9Pyx6g7CCJdYhv3GE2qIQglqkJfHmo1UvFQdz/SbD73Y3Cp/qn5g3QaHmZw30JBbyWFghkO7lQoCYz5Vcz4YwOhcUDDtTagFT92A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747398857; bh=ilzqbjXHgCPKWtR45HD6yZImYKXn6tDUFt+aXkKet8g=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=LBp7ws52nwuOVzqnrn/q0j8Yd5Avtj104Lxk5AwZ3PHJDxJZ18ZAZJ+wDVwxUapsmp7A0qrKkcWJKO2kn5ygrYZ0PwttrhE23WLpV7E08OZThTASHQfNavdQ+WH/uzqsAH/pv/VBgfoV+iqTIbRrUnlo3oukZm66Uppc6cTDWljfaNDNU8IhTwsuG1kU4zgt4OjcAJ4SbvVzwJWAETDubULJaGZoNz0p/Yz8oBIbb+LMhXDhx8ZbfBP7nG4NTIY6fCtJ3jcoo+rWCWxkhDahCSuF7MLIGwIsWUV6w5jSmXdBztj8YVAwxK3F3TFVJEgs0GotQKkI2Nx6Dtgukg51oA==
X-YMail-OSG: MyYl0X0VM1kyVk0Hkfhs.3FL.T4KcdkZHMFHFrQ35KdnBrQQvTB_I5l9CIue0_f
 FqC.4x5Tni4zVSvIHg64Lk9tHhwidVvg15nK051cP5m_faJNKJQneZ1GfzeloTx_H_V2YVjak5q9
 boBbN5WIWxBKHr7AEm97pkFr4KgHQPZFjMA3DTSw3_DCUGgSn_j90vflMcczAi9b6HbKdgfsZ0S9
 qZU9tpx8b5EIoUIUtEysl9swpFYs5O69I0kC9ssE6jv9obter3KfspWHQjVbwTWWCVBMMQzM4oQS
 lp8mSabc.is7lec431NypLgz7LU78vjBNbm3J5wfezZ686nCjQ1KgQ39F.cfjYaw9T2msxdlgbbH
 VbjySW57wTM0uEiDZJFpbkhhuNxgwLRcCWCPaxslAXDYcWVmBvTmAuHgVyerSapqFwQnGzwH9j.5
 HheaV.5_RcvvEcENvH_KyVPP8HC0mINtHyCmmfMJkkffRyYTr4s.SrxtQzWqXCbEkFm3B50pdATs
 lKF1GDGjG67wBakDuC4Ze9pTvMZnfF5XnvWYFYFOdq6CM1FWTvvGjY5aBRcIRAVJcUaqlT6F6Eys
 tXdM5p438vd82C2c27Cqu4TcgyVtfl8lsJUdhBaYZbKuWpipF6hXFqu3Bi81XF5EdK2oVbjPm9XG
 L6TnVashGU.zgck2H6c5pot17beo_wrD.fFqBJr9mGjO9Gl9fKWMx6nme06AHMiEoktUqe2m3.8p
 FGmH72FPozJ9gp8buhkdNEpAt4J8zbe_juMm2DyEtZ0rA2gHRI6j0htTiP3RoX8mb467cg7AiEaK
 trfq.8_xBOFcBXYsrXscjPjeYYmxi9e6JNvyDochQ7UWKi4V8jgpCmIgG4geAq0a1l6hP5bDTPX7
 6g4Y.maz6sYxhMYnQCXgiE6OaHNfIEXCuC053YZvKc0oOzDQM7C1cdID8W1x0MvSbHU45dSB.svv
 EgVQ5sJ7B5EbPfZxWwkvrYaOoulkzQPyaY.ZkRx2v_3Ox2kmO5hTOmtg6J1_yfFXYc.W_flEfBcz
 lVy62iluRwgXJlF7auC3V5pqV9_AOxmSNnLkcbfyhqqVuLOTXaypFUhLm35emQKpbQgp_xk44UND
 EUrQ3YMGM5pkujUgNwQ0p9mOf1h4sZSj6zAq.1dJt_rE_3R3B4nELi4W38GSYlgX.O0zPAUIwQKg
 e4W.53I95EgjcM.PVZ82R0dVZ0_7aZ0k0ckmLoLRxxKXRD_PU_IQH130TNTG0DWhFZcNYQeOgAle
 ih7zKE5RdWwMtsRhoVWHVNVf.sMZFBYtP4L.xFkRyfHklBuRaQ_dtpNFKZl0poFUMaOJ5GdILTmA
 wd4clN7baqBoC7RVoUX2hIHGhTXTsMAai3uRYZY0TGgcfNxK6oelQJF5oi_jYABWDnhfr07HLNsa
 Pn83ggpuIKGNZO5J9WRsFCnc8HNWRhdB4d5akafnXvOxNpiKkxTsxA54ZcjrVA7xk7A086DXMAMu
 uBwjPspup0gPyY.ISLtTjGhUy3DE43m8P_Uk6jNKxfrnM02F5VhkTfzIcKLgy7xpfK7AvWa86dQM
 g4xVk754n21yv3bhU2IryXizc6jgSH_7nRd4y.ui4IfRw0DCFcojlLGhTTqOIxzd7C57HRdezDpE
 LhIk1YCGNqvbobvPswYlQHVK84QKtMBw.01XKZFG4bngk.XTeQPn.EVAGN7DYxeHITx.RZcUlivq
 1lQlz7PWOslWaGLvVaRPDfHHgV1ettNsK.i4EZc_TgyxjRDZLpIxIsVbUHRYFrG_8fcFm9iy7P5X
 Ret9L1abwYv9mSJ6x9FLgu_MqnspTYCOKUuvw54oEhTImI2ztfFHc60Xp9KANa9kedAR8iMziZ4m
 HM_Wix0ml4acmlreBfdLXlJ1pYp1sfG8MX9.l_b4xAPvxhGGXXUZYRehcoPYTSJHpAiF0otK5aRs
 kjbWd4OJHdDDZt.KGJpBmNUPNBo.ztZn.2ybuSXGO3WqOxEPLK0C05USLODYFyTrUjcbYdUsLFBJ
 6va_0CsljsOtdnrvXhewGOZAPh7tL8xrxTl9HuiUjkx8RlTRcZ6gvkD0NDfzQoJU0StMB0UGemiM
 uPm8BmH3HDPqzRmNADlVt69LoAAXiqXftdYjz1WsMcRG.vAHpy2O7AXR_Mr0KFWAArj4DZyDqYhb
 bevHw1vk7WuOFe5tP7VOLLfSlDGns.PMrfNSv0W5hZ7kg8AS2X4ygB.hsHAZnkKgp3a9eLKcFuaP
 vGrbCIOUksoczUeWXC9NMsXTZusE-
X-Sonic-MF: <igor.korotin@yahoo.com>
X-Sonic-ID: d3de1b00-ef39-4943-a119-3affe05944c3
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Fri, 16 May 2025 12:34:17 +0000
Received: by hermes--production-ir2-858bd4ff7b-xdmpn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID cb1759c19807fa6e7c86e3ed0012f4be;
          Fri, 16 May 2025 12:24:04 +0000 (UTC)
From: Igor Korotin <igor.korotin@yahoo.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Igor Korotin <igor.korotin@yahoo.com>
Subject: [PATCH v4] rust: macros: Fix macro referencing core and kernel crates
Date: Fri, 16 May 2025 13:23:46 +0100
Message-ID: <20250516122349.1944895-1-igor.korotin@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250516122349.1944895-1-igor.korotin.ref@yahoo.com>

Fix macros and auto-generated code to use absolute paths, `::core::...`
and `::kernel::...`, for core and kernel references. This prevents issues
where user-defined modules named `core` or `kernel` could be picked up
instead of the `core` or `kernel` crates.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Closes: https://github.com/Rust-for-Linux/linux/issues/1150
Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>
---

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
 rust/kernel/static_assert.rs    |  4 ++--
 rust/kernel/str.rs              |  4 ++--
 rust/macros/kunit.rs            | 22 +++++++++++-----------
 rust/macros/lib.rs              |  6 +++---
 rust/macros/module.rs           | 31 ++++++++++++++++---------------
 scripts/rustdoc_test_builder.rs |  6 +++---
 scripts/rustdoc_test_gen.rs     | 16 ++++++++++------
 11 files changed, 55 insertions(+), 50 deletions(-)

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
index d8120f838260..5e5a0bee9888 100644
--- a/rust/kernel/static_assert.rs
+++ b/rust/kernel/static_assert.rs
@@ -20,7 +20,7 @@
 ///
 /// ```
 /// static_assert!(42 > 24);
-/// static_assert!(core::mem::size_of::<u8>() == 1);
+/// static_assert!(::core::mem::size_of::<u8>() == 1);
 ///
 /// const X: &[u8] = b"bar";
 /// static_assert!(X[1] == b'a');
@@ -34,6 +34,6 @@
 #[macro_export]
 macro_rules! static_assert {
     ($condition:expr $(,$arg:literal)?) => {
-        const _: () = core::assert!($condition $(,$arg)?);
+        const _: () = ::core::assert!($condition $(,$arg)?);
     };
 }
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index fb61ce81ea28..fbdcbbba9c3f 100644
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

