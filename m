Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2101.outbound.protection.outlook.com [40.92.41.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B0A14F124
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Oct 2024 23:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727997406; cv=fail; b=CtfprYK3pyeQzrZzHeh/tFx6d0QY4UB8siYdDprYZlUDjF3YdJjTWSHhy8JO5tixZFM6UmhO9LhBPuFVjRafG60Ck+KkDbakaJ/JfIKF6fdEvfvmRckjBg03FVy5LSlHgTX/JfIbq17pBwOCdW8vABLp+HpPFAn/2pK/ytE6GDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727997406; c=relaxed/simple;
	bh=b8GsWrvfy+pPZKDlQYenwvJGbSV/l1QYI4WqzCNQq5U=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=X9TIxJP4456C7IS1PyPj/a5VJKwqBvjUqwPlDYDijK3ii8y1u8EXtaWdoCJQ8uOiLpIBO1jp3LyXga4hrlekntGn3vRWTfhtbP3KonAG9Y6tU24oc88SHyzWMv8AqMU2WuwzSjS5DRGmT2UctJ+D6pVptOcX/Lv1I37s8TXhcas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=BmGUiNgX; arc=fail smtp.client-ip=40.92.41.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="BmGUiNgX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtKWAgf0M1aoVcjSRtp44mUqpivfAu+gga7E5lSGOZbty3j1mYRLWEp+yTSqDT5URQ3v3wEyxcJJAoy9hklCl/RbOtX9ZTLgT+xFvZhUOwCuJ5eKf8NcaJLLpY8tdKR7t8wY6qS3/3higAKWQdob9stsHBzrza/p2eggDJgaYXjaBq3QOytK1Zj+8ACJj9ApND0zAH7b4nW/r5m0XlN5HVzpcH0DANHQzC7ZmYZFWnOFGFNp61AGH82d8KvkSf3sFIpWjYRXIFUVbsnLA9rcKFlYNzMaLXTwRndjw8Lh8F+CNpX1pcS6iUCcPHoKhc3kzSurBznu9z8jSSImDMxQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Qa9tHYAwmwkGdlGN9W/xo1e40jn+5Ym5HuWpnhyBmw=;
 b=NbaUBKpSMcn4L1ZXUMFm6Z/2B+4VH6wfpik8cWXonZTK+qy3qSkACV7NJlNQPk+W0MoUseMQNiCotFJEviEyir3B96zcyuTk63+XEqOUML2AvRhEWfPsR1eR7Vp3LESjqh8l0q/ILHCVtrmrneqLjswI0vQTCca9Pk1GSAL4G0YWrhs1qrp+hNdR1mvzJ5qqS3s1qZ/2nIYvXK45ZmZi50RzMk2stieR/TLPUeXp9MkiT7+98HkoXHhKR56XXNaSOF7N07wwXaJ31tmiNVhlNRCmMVJ6zJtHy5U0iCVxoE7DjW8/sizWlM46YSjui5MzUE7M62pwW5VQ7EhqAhF3nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Qa9tHYAwmwkGdlGN9W/xo1e40jn+5Ym5HuWpnhyBmw=;
 b=BmGUiNgXkR9jjx80Sr2626apm/GGjNaZFNZpYygSca3WU/HAUqwIMq+5lMHaSm0FXp8GBjcXz9uxv6k/y8bQQiyh5rVxv87yfInJ9xsCByD/FLJSBb+hRUFZH0m4yVMQLx0fX+qpLmbU3BQ5oURfJ9L8MnWb+6BKd8MLC0XiHfnW9rGZOoiS4jM8vck0JuWgrB0ehq8mkENp8wJovzMLJ416PBWn+3ygjYCPMSTTyRI/G6Ny+mJOZOVyuMqi2UmTsbxK1rdWIF/yf4QZhNBfgDk85ZqQ5b9DGHjNMARHpg2RkrzEomw4Z03bz61/5C6KvaFCufMx+Z2L7bLriegFeg==
Received: from BL0PR02MB4914.namprd02.prod.outlook.com (2603:10b6:208:53::23)
 by PH0PR02MB9306.namprd02.prod.outlook.com (2603:10b6:510:287::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Thu, 3 Oct
 2024 23:16:38 +0000
Received: from BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089]) by BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089%6]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 23:16:38 +0000
From: Filipe Xavier <felipe_life@live.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Benno
 Lossin <benno.lossin@proton.me>, "gary@garyguo.net" <gary@garyguo.net>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>
CC: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Filipe
 Xavier <felipe_life@live.com>
Subject: [PATCH v3] rust: optimize error type to use nonzero
Thread-Topic: [PATCH v3] rust: optimize error type to use nonzero
Thread-Index: AQHbFahP9OWFfUsSZUuXZh7D51fhPQ==
Date: Thu, 3 Oct 2024 23:16:38 +0000
Message-ID:
 <BL0PR02MB491443BD775D5D63635C3F4FE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4914:EE_|PH0PR02MB9306:EE_
x-ms-office365-filtering-correlation-id: 59233325-d969-49a1-143d-08dce4016ea4
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|19110799003|15080799006|8060799006|8062599003|15030799003|7092599003|4302099013|3412199025|440099028|10035399004|102099032|1602099012|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Nu8q3Rm1UP17gwI4CsxrgkFUOBGL8zEkU4t+PVXf0ntfIeo3h5F4TOJlzu?=
 =?iso-8859-1?Q?Dpqc44GxlqQgy75XplJahVkZNwN+kXQyAv9qHjgqiqZiYHKfah8yfOSNFB?=
 =?iso-8859-1?Q?hhNSKOa5BWSHzZ36nnWaSmJBmmUqWMVpbShHCm/sUKV0lIWUI+/pUvP5zI?=
 =?iso-8859-1?Q?F5lTeX7/N1qrukY/JnMjOzdooKKstD4vlHyZWDV9nwgS9tpF9HnkAifp5o?=
 =?iso-8859-1?Q?u8l//ePK+6Gr0zK+MAXVWlK/DV8o+LIEG3+a8jseTtddqPtjInD6cc1pPR?=
 =?iso-8859-1?Q?cukvf3Hz3tre4mz+pUPrY9uMD3qOEoWkZFsQl4lo3QMXDYA3TnkUIvBvLf?=
 =?iso-8859-1?Q?ggl1ErEZKlxXOoU0sl7CxANkTAS0DS2Id5ogKeAafJQ9h8SFzTeDW6vUMN?=
 =?iso-8859-1?Q?t4TsnAl94ewMTvt3wlDxxQ8/Mjt9mQbN47lXoegU2nm8lab1t3WXgI6HFG?=
 =?iso-8859-1?Q?Hgq1UyeOLmgdKJ2cxzX3+8dzz0I6/4gNZqpVGGmsos/b3XS+K+RD9lBSie?=
 =?iso-8859-1?Q?3wYbxrHUJAn10PBRjwq9p6R38B7ZzfaxmzZWhSrcgRcZ6ltONPzNWfv6Lo?=
 =?iso-8859-1?Q?ibBFJxmKcC4NWxA5DEVfLS/jS9uq9e+M2N3gRrOBF4JnUl+cObM+2iL5bD?=
 =?iso-8859-1?Q?qZSPFiKCdO5iSPSu4hvuMUejngk20l9iaPvP68tMaFsIkKQxTM34AKl0yH?=
 =?iso-8859-1?Q?nNTpribx8kh+hlxcxPvZNbp6H7cA4TJ3LqQyo8xXWIPlRNd3MClrBUlPqS?=
 =?iso-8859-1?Q?EjUIHuUJMH8Wz70/mbF+Qm5wyFDMwecwmHMAMp8ON0Vfi86W3QA1T5hQzS?=
 =?iso-8859-1?Q?OOVul8/zgMv2fo8ed45iXHtpwiHujlkkqCrl5kc7tKZxo03IVf0j6i+UdP?=
 =?iso-8859-1?Q?Tqbv0FYaAHCLHnxuQEEeWt4U5wH5oIatVyuRZlQ1TiuI6lIpfOJkXv4dJs?=
 =?iso-8859-1?Q?9c3tFdGjN1vw6bWMceK1PCRfQXJzxtpiIv2g3xXqPCmEV3AGkzsUfnKKJa?=
 =?iso-8859-1?Q?5RtUG+QF0zc6n731U=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ODDhwcyYwON1f8T73thz0fcvyjvP81TtHVo+/rQzqCWG+f/boWZBdeBATF?=
 =?iso-8859-1?Q?aB+LXatQDllIYKOkQPPRp9hH2V5nFpXWQnSxOv2Dbm+wUcdFvwwjGNtL4a?=
 =?iso-8859-1?Q?uj/ZQzqTcI3ln9rALDa0fZk7Ldc5z7LbnfhBYAR9JBv0fEDJCBBmNH42q+?=
 =?iso-8859-1?Q?AYLBPQ1GCNTYtxZlC5cUcdMCvCzoiQG6Q6xM2tMhtAxMShv4r9ou3L/TTk?=
 =?iso-8859-1?Q?VQ08akJM6tWbEmvwdDKVL0SkSZV62qvGB20i7RworKIU18f/mIUM9fQvPy?=
 =?iso-8859-1?Q?8QRCoj7UwR0+DBL/UrbTXmezqeZSLM8Wf1dQ+xGdSj1e7Gk1mVzQ1yEI+Y?=
 =?iso-8859-1?Q?i/H0bPGcLFEeoH3WehlexXOTUTmQI1BtEQcseu43PJj0VC4cUg0lR7I41B?=
 =?iso-8859-1?Q?gNr3eFDxI4HHKLhmFD3dwI8/9o39xT1pbLQi5D4xL+ZK7DwyvTcb/FdP1X?=
 =?iso-8859-1?Q?Fct4fNwxAG8eVsPCO4oi4gGpe5/NHL/c2oH+9UR8BfzONMpu+s5SJ8spHQ?=
 =?iso-8859-1?Q?NWENAVdmuR80XiXVBXx6rNGtE2wB65yYPqFxqWFugf13XcICdAHma+Vyoc?=
 =?iso-8859-1?Q?+DEu6nOsCW1xS/dkdJteV1xSVUlZ/8f8BZqoCaJZqCVjUtW3FQYdOiJfuX?=
 =?iso-8859-1?Q?KbB+s8vexQdjvI7MQJvplvy9Du9d8NRNTQU3eQODFOV9wERXO4xL3k/jOx?=
 =?iso-8859-1?Q?BMpnmGuyTLwjZDdjbrVN6WMLxfoRMqG7NoCg28g7zVux/Y1+ecjGpxj/Y7?=
 =?iso-8859-1?Q?eeM365no72dnez6PXVaZvCD48zghJfB12hjkm8HZVTffjqKP/VE+eVtV3m?=
 =?iso-8859-1?Q?N9OjsPROYZkedO9lzsx9jxNTNMiQh7HfyE+pwsm+KFiCWiuP4soU389m1a?=
 =?iso-8859-1?Q?G8dFV1e1xMbckfqNR6XfG+GJu/6mbO53nOuOdH76Ug+BWLS6243sA9ic/b?=
 =?iso-8859-1?Q?4qjLyooI/z9L/L9DuGeb38eCZF3yqOAJVzwW0M/9MJdWEjPLWZVjwdyPMj?=
 =?iso-8859-1?Q?xL9M/eYRst/yLPkNJF/2fUnYs24yJwvhw3gRPOHe2dUfiKyF2f9LtBst1n?=
 =?iso-8859-1?Q?Nq/Kc8kYZ+VDz0VTVlJk8XWU263VYE178JVBwPjxC+wONxO9JcfN4PYmUi?=
 =?iso-8859-1?Q?DlnSA2HBUWDSY/0dIWvyWUMoT7Oa1nM3XriA6pDbIULF3t9dK3nsED3/q9?=
 =?iso-8859-1?Q?Ndlxqe68b7uBvGpB1Xal8IsDgNIwiLJJJeOl0S731xSS3z6KMwJxw+J9JZ?=
 =?iso-8859-1?Q?Xn+A/BIDuoBFWO8jCRhjOTDHeOZZSZNwgpWZxsitVSLh+vRbf5WHGBax/g?=
 =?iso-8859-1?Q?u5ppNWVgGd8/plmZ3/pmTnIJoRVonbxLa9phwpAcL1YbowI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 59233325-d969-49a1-143d-08dce4016ea4
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 23:16:38.1625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB9306

Optimize `Result<(), Error>` size by changing `Error` type to =0A=
`NonZero*` for niche optimization.=0A=
=0A=
This reduces the space used by the `Result` type, as the `NonZero*` =0A=
type enables the compiler to apply more efficient memory layout.=0A=
For example, the `Result<(), Error>` changes size from 8 to 4 bytes.=0A=
=0A=
Link: https://github.com/Rust-for-Linux/linux/issues/1120=0A=
Signed-off-by: Filipe Xavier <felipe_life@live.com>=0A=
---=0A=
 rust/kernel/error.rs | 32 +++++++++++++++++++++++---------=0A=
 1 file changed, 23 insertions(+), 9 deletions(-)=0A=
=0A=
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs=0A=
index d7965ded2973..9e2910a6c1ea 100644=0A=
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
@@ -20,7 +21,18 @@ macro_rules! declare_err {=0A=
             $(=0A=
             #[doc =3D $doc]=0A=
             )*=0A=
-            pub const $err: super::Error =3D super::Error(-(crate::binding=
s::$err as i32));=0A=
+            pub const $err: super::Error =3D {=0A=
+                let err_code: i32 =3D -(crate::bindings::$err as i32);=0A=
+                crate::build_assert!(=0A=
+                    err_code >=3D -(bindings::MAX_ERRNO as i32) && err_cod=
e < 0,=0A=
+                    "`err` must be within error code range (i.e. `>=3D -MA=
X_ERRNO && < 0`)"=0A=
+                );=0A=
+=0A=
+                // SAFETY: `err_code` is checked above to be in a valid ra=
nge.=0A=
+                unsafe {=0A=
+                    super::Error::from_errno_unchecked(err_code)=0A=
+                }=0A=
+            };=0A=
         };=0A=
     }=0A=
 =0A=
@@ -88,7 +100,7 @@ macro_rules! declare_err {=0A=
 ///=0A=
 /// The value is a valid `errno` (i.e. `>=3D -MAX_ERRNO && < 0`).=0A=
 #[derive(Clone, Copy, PartialEq, Eq)]=0A=
-pub struct Error(core::ffi::c_int);=0A=
+pub struct Error(NonZeroI32);=0A=
 =0A=
 impl Error {=0A=
     /// Creates an [`Error`] from a kernel error code.=0A=
@@ -107,7 +119,8 @@ pub fn from_errno(errno: core::ffi::c_int) -> Error {=
=0A=
 =0A=
         // INVARIANT: The check above ensures the type invariant=0A=
         // will hold.=0A=
-        Error(errno)=0A=
+        // SAFETY: `errno` must be within error code range (i.e. `>=3D -MA=
X_ERRNO && < 0`).=0A=
+        unsafe { Error::from_errno_unchecked(errno) }=0A=
     }=0A=
 =0A=
     /// Creates an [`Error`] from a kernel error code.=0A=
@@ -115,21 +128,22 @@ pub fn from_errno(errno: core::ffi::c_int) -> Error {=
=0A=
     /// # Safety=0A=
     ///=0A=
     /// `errno` must be within error code range (i.e. `>=3D -MAX_ERRNO && =
< 0`).=0A=
-    unsafe fn from_errno_unchecked(errno: core::ffi::c_int) -> Error {=0A=
+    const unsafe fn from_errno_unchecked(errno: core::ffi::c_int) -> Error=
 {=0A=
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
@@ -137,7 +151,7 @@ pub fn to_ptr<T>(self) -> *mut T {=0A=
         #[cfg_attr(target_pointer_width =3D "32", allow(clippy::useless_co=
nversion))]=0A=
         // SAFETY: `self.0` is a valid error due to its invariant.=0A=
         unsafe {=0A=
-            bindings::ERR_PTR(self.0.into()) as *mut _=0A=
+            bindings::ERR_PTR(self.0.get().into()) as *mut _=0A=
         }=0A=
     }=0A=
 =0A=
@@ -145,7 +159,7 @@ pub fn to_ptr<T>(self) -> *mut T {=0A=
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
