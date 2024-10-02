Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2072.outbound.protection.outlook.com [40.92.18.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132D1991A9
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Oct 2024 23:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.18.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727913169; cv=fail; b=cKhOgTpFPmI3ePkRkmZWl+PpF4YQZEGXeseLF8KxsGnVGjAj9pH7JyLVGnm8zqBwL+qK7cj8SuJBDBURadkpZSp65krPPYDNhFsgZSWJTL96MYGTllDcWlhn/KEhiJ/SnDVSKjVMrvevW7dTOatRlxmJcW1kb3x8sZGxrytfxrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727913169; c=relaxed/simple;
	bh=HTILw6rrTk6elBwf7YUNAt2xHpYxLQjFYmnrdQGZotE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TiivMOzTpETywq3hHMNJwWKLdn/fSXYOU/1u8I/Ew8ZzNlRsaerHEFtXy8QwgNm5w7qev756v4lntHDGudR9zshqXekQ5T/ZcS8kZhGqLwBqKnIc45/gNejFVTuU8e4x1CiQ//bYLQ1OJNZQDLtRaAW8PJ8yCcIJdXfcqEzYO0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=oNjmNL3X; arc=fail smtp.client-ip=40.92.18.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="oNjmNL3X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfsxJ08UyaNV4/8z9QGsCTNXjQLDbSKtAjMcYpSPhrJvQy8nHefFpB7hboE6LQc7EnDvVqoBd20CZZC0pTMgThHkXR9epQ91oe9eA7jum3iUT8TYCpcgANDcehVnDVUM9JPKxojzX34v7/taUbw649M4grC92OzKGIwW+ifn0FWDvpGc59Wxa5QIeNkoEoQ6Xz9OZIU1Xju6ohb32zVHPchreYppzfwbfSA3+yNd1R/rvAQ07/n28iFUi2mtThwc4WZXBOoqkJDlUocpEa4DuAMu5gVPTQe6t+uxrfb7NuU5BaGlMsvE8hYbxuSLFsv5+t+tfXifzZPKMaoy5RnMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTagyiQyNh3LOksKCDN5XZIAioN0GTDm+QUMx4EEJpU=;
 b=j6rXjzs1xsXPKhbZTR+nMOmiQUueFYk40hIbgf2FDGJnzE1GmTv7fgSY3Wvg+LzeRALq8q0xxIHWCGdGg2iGvELOogqigPrtKddID5b9U6KjYsOlbMJNRZs1NOL2o5oMge/+DtQaqFosGUyQ/W0QVqpfZQG57kRSyWoQ1He+eZQSOs0+tJ4BoBm5t3V8JDUqWnffCp1Zs6QLgpoRDqt7S/GpUMDIWRyKAoPSUso89sEAKHulwhmn40m9sYQvbwYN7jKNatqAY1vDlHIo/o0XzTslRiq1/NSgAjD+2yfeXdpp/pqN9Kr4ylF2xQzjZtCYRYoLNq8yy9gtFgN1e6Idiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTagyiQyNh3LOksKCDN5XZIAioN0GTDm+QUMx4EEJpU=;
 b=oNjmNL3XctYZm0Oph5omPChW8+EzRWUx1+/DjLQtNAW0eOai3bYpGOeOYdS09WkW+LGxSSLE5j33Q18vH9+Ib2W0Hz2VMXI4hTz4Kli0D6rbLNkCvB81segY2+meUxVqE6QWT21tV4mc8FIjAGgNzMpFI/X23K9atoBAfA7uXXaPVYc/8yAUBqKVLIEPQ+y6KLSo7WFVw2WU2s+1UJ3e74Br/s5NUUfRafh++Br7SOYEIRlf19hj/l5j8N0zJtgxT9npDLjCc+uyoJUeTd+hB2MUrzpg2226rZBaMZQgpo74uq5/nGc9AL5Xnv5SDcSH57cm7ea3Gn90Mf7ygI2BeQ==
Received: from BL0PR02MB4914.namprd02.prod.outlook.com (2603:10b6:208:53::23)
 by CYYPR02MB9804.namprd02.prod.outlook.com (2603:10b6:930:be::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 23:52:45 +0000
Received: from BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089]) by BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089%6]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 23:52:45 +0000
From: Felipe Alves <felipe_life@live.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Benno
 Lossin <benno.lossin@proton.me>, "gary@garyguo.net" <gary@garyguo.net>
CC: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: [PATCH] rust: optimize error type to use nonzero
Thread-Topic: [PATCH] rust: optimize error type to use nonzero
Thread-Index: AQHbFSXWRz10lnXxeE2ghr5p0gQajw==
Date: Wed, 2 Oct 2024 23:52:45 +0000
Message-ID:
 <BL0PR02MB49142BDF011175DADD6E79D0E9702@BL0PR02MB4914.namprd02.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4914:EE_|CYYPR02MB9804:EE_
x-ms-office365-filtering-correlation-id: 9b72cdac-d554-46e2-0b3a-08dce33d4fe9
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8060799006|8062599003|15030799003|19110799003|7092599003|15080799006|102099032|10035399004|3412199025|440099028|4302099013|1602099012;
x-microsoft-antispam-message-info:
	=?iso-8859-1?Q?SE3conXNtxW3l+jh5+3CqQ5VkFTfhO2JQwhmFnTne6VQ9wNGXLCTcJWx80?=
 =?iso-8859-1?Q?x6ojgpZjmQDqlhg3Kkgy0nZtDuLZ0eE6F1pPw5n9YOCWSkhSVBwedsW5YY?=
 =?iso-8859-1?Q?desQ22CkMDb1kcSWJb9RFMOeHgS3woKQRWMvb6o5CzNu3/GGF+JofluM+v?=
 =?iso-8859-1?Q?/NsCoNbkcwQHlqULbzWoBwqKEWgJE0+z292BcZoAbXF8dIJrHm/+4HXndL?=
 =?iso-8859-1?Q?G49yurM5m7Wh0tmmVCtOeCvtGnGvm/s7YgXhrZBWpqsCUNLxhKn9GmAtmy?=
 =?iso-8859-1?Q?cjfgCRBJGbp6CPG8W7wyAbPKW9ORNgMcqbI5YDLoaQgvM+R7OAzs8pXWbh?=
 =?iso-8859-1?Q?N52XV85qhRT7uRjUjj4AUEs+khb2E0yPnTbZwvORrViTI8WftqohtYnJLb?=
 =?iso-8859-1?Q?9zMgUeuxVytptrMg8VUSWyGsBn6CsdJlHlUd10JZbdBP6FtiKeySeDnEKP?=
 =?iso-8859-1?Q?N9wurEjS5FUZjsTKF25jN628hu7NGPOJ+GGCBsn2a48ssRNEK5GbXAJbJz?=
 =?iso-8859-1?Q?slE8FQGaz+Rzs8y6xONQfpds/cnsBk3vWnQp3sK+k+AbV9DndP8cwnmgZ+?=
 =?iso-8859-1?Q?TqeXsEjWhT9OqyG0Ox1LJcNoqUysVmeJXSj0SOUL+Pg6lKvQ9gBkMa4nmc?=
 =?iso-8859-1?Q?rkCJiT+KPr33oMs/mQq1M8BxUhfXTiiWxsao7HfTnNe+ILMg2DgnHQ9rze?=
 =?iso-8859-1?Q?kdPWLS2GIDKDMOuWEqynqF+VH/ZAFCEu3xD8qF2N0jcg8VD+Z5txuU9P0P?=
 =?iso-8859-1?Q?L5yUje8OGl2hsOHbaGqkq7wKAa4Z1hDj+NlJAt5i/lA6qtpOP/qUQ8/yQO?=
 =?iso-8859-1?Q?z3Nvl2tDchkwuKU8/GQo6xHuIn5laYX7qF3/mA3K/dQsY3mjf3uJGe1Txs?=
 =?iso-8859-1?Q?8P9bpA1kVX7zsGFaoMpXV2MxcXzW6CZkZiknCrbP1IsgoF51cjsybBN0fL?=
 =?iso-8859-1?Q?INZeUqegj9TsqB8ciD7zzhByvD9mS7Tw+NvDDRZ76ziV7/lzhteiHg=3D?=
 =?iso-8859-1?Q?=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WQvvlawH+gOqxSV8gvY0tydLV767oAG5LaYMzm8cI//L4CR7LV2EPLfvFA?=
 =?iso-8859-1?Q?ALZ5/X1Aya6kCDNuXBfzyPqLxSBWj74vW6aFjUjvM7B3JyIhzgSJh7PMoM?=
 =?iso-8859-1?Q?V4GwthTBDmr/8oZ00XG78AgHWbL2SkzlDVNYCnoSdRJdQMRAFLAyJJUGTy?=
 =?iso-8859-1?Q?ebtMcVcRicAjM8CC3ByhbwgAe0Catc3ezFW0gFOVwzPVNWSHnjzRYzcEIL?=
 =?iso-8859-1?Q?jCPZWIRUOOUwuD4FGqVTzPImFFxQz+fkaPh9aEujalOCGWi8fkS+QNSf8u?=
 =?iso-8859-1?Q?cWYsMKU3r+j2WQyYJAuoFXLKVCZ1COuisZGkhLLVJt68hKcEDSB8dNP6Ux?=
 =?iso-8859-1?Q?1zFRuWlXEFA9mQbD2NDs4enn0Qtn3jQWzUnvlMxxT8d+R3ctPukzJlBxKM?=
 =?iso-8859-1?Q?DJJZ/Q6Cq8mftB5/D84n96s8VodG6h2wiq3G03Jrv2EhMReaz/OwSxjOfK?=
 =?iso-8859-1?Q?pTbfckuyCHQ8MJAEBzVn8zUJAaeKNpsAFTtJ4tsPdVPpUkoG+oeT733sAx?=
 =?iso-8859-1?Q?zMPJrEi9rKrmOtqQAL7dKRW0Qkwhttr4MO5p2lhwgJQMLbB9IsJWc43MYk?=
 =?iso-8859-1?Q?RdJqu96hzweujAmg8NsOQquQ1n9F+I42Bh0BjXtCQopueNFed62KXkuRxk?=
 =?iso-8859-1?Q?AoDqSeueHZ7zRkHc+GoOGjuPcKv/T/GKp14vkP3/hkETUnp2x6WYmMriHC?=
 =?iso-8859-1?Q?v3WhjJWRoO/ttN8HTLvfl22bcNQub2RKm5eDP07QWlBYJXn6nImiVDWvg/?=
 =?iso-8859-1?Q?Lwx/M80CaYcCSMonAz6ruxqsy/KOOQWd46ADy/mJJGT31jS9W4pzQgZsJq?=
 =?iso-8859-1?Q?ZLECudE9qeZwGWrNjhZ2cEf6zekinH4s2P5iVDIZfrBDfIuQnvygjB/jCL?=
 =?iso-8859-1?Q?dKYZewxUzKMHjbmozRVzyfVqGg/PsVLiwQcGW+gJFsoLf79eKHDvoab0D6?=
 =?iso-8859-1?Q?RxbnQHJNK4LQA9xahd1qhbMTEWb9/CvzugbGIfQO/ivS/dNqNucWYJxl9D?=
 =?iso-8859-1?Q?5Ylucy/sdckBxVmF9rH6bNZP3VdsewRuE8ehNjkXuglk+v3CwxND0AJE6X?=
 =?iso-8859-1?Q?FI7KLP02pNeIFwvArVvzCfgXlQH4+CyjGSXDniFJ2BMcNdFgO4NySIULCv?=
 =?iso-8859-1?Q?SO4l4bzHIBf7jCvUOXVvVnWxFehh9NHChVnp4mExm8n4Q+pk1yeSR7eIqG?=
 =?iso-8859-1?Q?X1fB834vL/tJHn/mkmacUagTnQr3zp0PNd5dd3mxFql+XfSOPs1CRuQK05?=
 =?iso-8859-1?Q?qGKB6ycKsTEgOwUwcZgCCJUSQmBVNsfHHbcJN16ub9I1+tWVPoTmzx8TRw?=
 =?iso-8859-1?Q?gGCXcaNHojONCgGU6H+QQa+e9zCJ0tH9MKP/12HOuGA2eII=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-0f88b.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4914.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b72cdac-d554-46e2-0b3a-08dce33d4fe9
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2024 23:52:45.2550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR02MB9804

From 18d0c4b19e036572062fde15ab78c286f4840be4 Mon Sep 17 00:00:00 2001=0A=
From: Filipe Xavier <felipe_life@live.com>=0A=
Date: Wed, 2 Oct 2024 19:25:56 -0300=0A=
Subject: [PATCH] rust: optimize error type to use nonzero=0A=
=0A=
Optimize `Result<(), Error>` size by changing `Error` type to NonZero*=0A=
for niche optimization. =0A=
This reduces the space used by the `Result` type, as the NonZero* type=0A=
enables the compiler to apply more efficient memory layout.=0A=
=0A=
Link: https://github.com/Rust-for-Linux/linux/issues/1120=0A=
Signed-off-by: Filipe Xavier <felipe_life@live.com>=0A=
---=0A=
 rust/kernel/error.rs | 25 ++++++++++++++++---------=0A=
 1 file changed, 16 insertions(+), 9 deletions(-)=0A=
=0A=
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs=0A=
index d7965ded2973..1fd4d553f7d2 100644=0A=
--- a/rust/kernel/error.rs=0A=
+++ b/rust/kernel/error.rs=0A=
@@ -9,6 +9,7 @@=0A=
 use alloc::alloc::LayoutError;=0A=
 =0A=
 use core::fmt;=0A=
+use core::num::NonZeroI32;=0A=
 use core::num::TryFromIntError;=0A=
 use core::str::Utf8Error;=0A=
 =0A=
@@ -20,7 +21,9 @@ macro_rules! declare_err {=0A=
             $(=0A=
             #[doc =3D $doc]=0A=
             )*=0A=
-            pub const $err: super::Error =3D super::Error(-(crate::binding=
s::$err as i32));=0A=
+            pub const $err: super::Error =3D unsafe {=0A=
+                super::Error(core::num::NonZeroI32::new_unchecked(-(crate:=
:bindings::$err as i32)))=0A=
+            };=0A=
         };=0A=
     }=0A=
 =0A=
@@ -88,14 +91,16 @@ macro_rules! declare_err {=0A=
 ///=0A=
 /// The value is a valid `errno` (i.e. `>=3D -MAX_ERRNO && < 0`).=0A=
 #[derive(Clone, Copy, PartialEq, Eq)]=0A=
-pub struct Error(core::ffi::c_int);=0A=
+pub struct Error(NonZeroI32);=0A=
 =0A=
 impl Error {=0A=
     /// Creates an [`Error`] from a kernel error code.=0A=
     ///=0A=
+    /// # Safety=0A=
+    ///=0A=
     /// It is a bug to pass an out-of-range `errno`. `EINVAL` would=0A=
     /// be returned in such a case.=0A=
-    pub fn from_errno(errno: core::ffi::c_int) -> Error {=0A=
+    pub fn from_errno(errno: i32) -> Error {=0A=
         if errno < -(bindings::MAX_ERRNO as i32) || errno >=3D 0 {=0A=
             // TODO: Make it a `WARN_ONCE` once available.=0A=
             crate::pr_warn!(=0A=
@@ -107,7 +112,8 @@ pub fn from_errno(errno: core::ffi::c_int) -> Error {=
=0A=
 =0A=
         // INVARIANT: The check above ensures the type invariant=0A=
         // will hold.=0A=
-        Error(errno)=0A=
+        // SAFETY: `errno` is checked to be non-zero.=0A=
+        unsafe { Error::from_errno_unchecked(errno) }=0A=
     }=0A=
 =0A=
     /// Creates an [`Error`] from a kernel error code.=0A=
@@ -118,18 +124,19 @@ pub fn from_errno(errno: core::ffi::c_int) -> Error {=
=0A=
     unsafe fn from_errno_unchecked(errno: core::ffi::c_int) -> Error {=0A=
         // INVARIANT: The contract ensures the type invariant=0A=
         // will hold.=0A=
-        Error(errno)=0A=
+        // SAFETY: The caller guarantees `errno` is non-zero.=0A=
+        Error(unsafe { NonZeroI32::new_unchecked(errno) })=0A=
     }=0A=
 =0A=
     /// Returns the kernel error code.=0A=
     pub fn to_errno(self) -> core::ffi::c_int {=0A=
-        self.0=0A=
+        self.0.get()=0A=
     }=0A=
 =0A=
     #[cfg(CONFIG_BLOCK)]=0A=
     pub(crate) fn to_blk_status(self) -> bindings::blk_status_t {=0A=
         // SAFETY: `self.0` is a valid error due to its invariant.=0A=
-        unsafe { bindings::errno_to_blk_status(self.0) }=0A=
+        unsafe { bindings::errno_to_blk_status(self.0.get()) }=0A=
     }=0A=
 =0A=
     /// Returns the error encoded as a pointer.=0A=
@@ -137,7 +144,7 @@ pub fn to_ptr<T>(self) -> *mut T {=0A=
         #[cfg_attr(target_pointer_width =3D "32", allow(clippy::useless_co=
nversion))]=0A=
         // SAFETY: `self.0` is a valid error due to its invariant.=0A=
         unsafe {=0A=
-            bindings::ERR_PTR(self.0.into()) as *mut _=0A=
+            bindings::ERR_PTR(self.0.get() as i64) as *mut _=0A=
         }=0A=
     }=0A=
 =0A=
@@ -145,7 +152,7 @@ pub fn to_ptr<T>(self) -> *mut T {=0A=
     #[cfg(not(testlib))]=0A=
     pub fn name(&self) -> Option<&'static CStr> {=0A=
         // SAFETY: Just an FFI call, there are no extra safety requirement=
s.=0A=
-        let ptr =3D unsafe { bindings::errname(-self.0) };=0A=
+        let ptr =3D unsafe { bindings::errname(-self.0.get()) };=0A=
         if ptr.is_null() {=0A=
             None=0A=
         } else {=0A=
-- =0A=
2.46.0=0A=
