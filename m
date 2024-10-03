Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazolkn19010009.outbound.protection.outlook.com [52.103.13.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E654154C0B
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Oct 2024 11:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727955224; cv=fail; b=Rw94QeosCLzb716LmQ+Q4/HVN3U6yUXVpqbWc779dOax1GBwvucEHkbW6vufutpzsPlv4+RsgxL32Q2GFe2zeVahZwsghT295Db2t+fdpe4gVd5Cdnb2Hd2Qw6gCFdlpwH7jilmZSbDsKlOwSQEO3fnNpiANGGXI5GxaK0o2xAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727955224; c=relaxed/simple;
	bh=7gtIe9EplR6j0awwCDF73AtAOkPZVKCWJcnqAEPAu7w=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OOzd1xPmaol2ObsPRPyI4UuRFAslbOLkHk2p+zMdqHrQvtZltKPLkRyxXywsLETGJsI43Zoe110XzcLekNm1hJATWsEe4sfPD8hcGuxOVUlYAqUnR1d+e3u0hf/nTdL+7R4tPBfOJsbYVeYhp5PfdjaZaDPXtlX+WTwYgVeq/9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=ASjc6wRe; arc=fail smtp.client-ip=52.103.13.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="ASjc6wRe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgNSeE4e+X2JeBhfdzQJYvx+z99/N/dS0vRVxAgojikxHcLnfOgsOjYYuo4L98EAcjL7uE/McQOZJlfxMLmTfNHH/vokpYk3v+xWjnpBQiVscExnA7skMyga2NnK4JZAysnfZLQGsMloEbWgY8TYp3wP3uwQUlPirq4MpVv932Y0peAJCp9HGRsyN+q9PuAZ65j7JOI3yMvX/AFXzbsfNPTvhves0rMw6z8rzCjDLRndZgK+7x6Jyn/igK9l5JGjGPndbJRNx3ol+K3Tu+NKTOq+af/NiBxD/wf32HfcEzNVh9xOlbuaTmHvc5mASo0TemQ1mGfK9JD+uvqqJo5CvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOL52zy/4JTGtXO+E0euHKWG8n2SEjU5fvkkRMFn2zg=;
 b=C4xpkhgWPeGe5QQl+6sCSQuvh0IGfbioUYK3RLNf0OnvI4V/vRBVOX7p2HPLoeaod4Qf4jBHl3qbRyEhGUt5/SS14pjm4r7drD9L7xBXz3FVbGAZMONi/vrAuF/wuohLkTx39c637gsc8zJGhbAhxgL87enF50n+M5y1Jeydla0sKREXY3I+i0jJNR48Fpys9EmEvFH3ekvngNAlp6oi7WaBpkoFUMiJ/7Pz9vXAxXdDufiViXi0kiWtpKoxvj0WzYKdNlw2H4tu9gtGwPznpQYLFHp8vHszSH9tsfTt+gOP3eACfoJ3+wXjzi79+a//UYno2PiC2B9PkRllRriz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOL52zy/4JTGtXO+E0euHKWG8n2SEjU5fvkkRMFn2zg=;
 b=ASjc6wRej+gkHLc2Le3ULtA3MBOyk6RVZpyQGpVkLXk7QMqqtJFeEznP8oEV2cRHpnT4jn+mBVppRcENboojCIpAyRuC8U8rpIb/I3ajdEmX5kqTNqZUSCsnARzHWB8O0PZREjll0meM/AZ0VX7cvV5ZYHOJK4thY6QP35qN6+aFSDPZ/cNx4I8gmGAzZ0CJcA0cK8ObQ3hZeQNepz615SZkvFwShe9iq+qF5uV4q5AXLmre5tZ+7CguZUt0hyEw5wzN8h3tO5k6K6Yme2vUjJfy87++FCvmUmqrZdfjybh1XT++S+P2CMoTUb/PjXOrpH9KSON96Im0dQ7nBCWrkA==
Received: from BL0PR02MB4914.namprd02.prod.outlook.com (2603:10b6:208:53::23)
 by SA1PR02MB9698.namprd02.prod.outlook.com (2603:10b6:806:385::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 11:33:40 +0000
Received: from BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089]) by BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089%6]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 11:33:40 +0000
From: Filipe Xavier <felipe_life@live.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Benno
 Lossin <benno.lossin@proton.me>, "gary@garyguo.net" <gary@garyguo.net>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>
CC: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Filipe
 Xavier <felipe_life@live.com>
Subject: [PATCH v2] rust: optimize error type to use nonzero
Thread-Topic: [PATCH v2] rust: optimize error type to use nonzero
Thread-Index: AQHbFYTtKZzDLN/vT0Kwm4DgR84C9g==
Date: Thu, 3 Oct 2024 11:33:40 +0000
Message-ID:
 <BL0PR02MB49141A172569679932EBA20CE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4914:EE_|SA1PR02MB9698:EE_
x-ms-office365-filtering-correlation-id: 42a5691b-5268-4814-38fc-08dce39f3a80
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8062599003|19110799003|7092599003|8060799006|15030799003|15080799006|3412199025|4302099013|440099028|10035399004|102099032|1602099012|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?wKwshkvooTgUtQgML2bKbMKyNa5cDoXaPWsqiumH/+9td2qtRZeHKHlyqT?=
 =?iso-8859-1?Q?qBY9ZPiPW7IQlGe48kPE1rBZtNE5WKqnRzzpJt6SCY7ee5/4oidXiutbOp?=
 =?iso-8859-1?Q?Hu438xtRIrMzJqNGiw6oK9SjQhhhmDsBLYxqkZLNJfKxRDeWv+1yD24LQo?=
 =?iso-8859-1?Q?UBWpagZkJDPdk9jeMdRw+cMMlQbNETI6UobVn7g0voC46UcZH7ADuK0O8V?=
 =?iso-8859-1?Q?cLOwPzYQFzdblFDmb04wN0XsUfw8WOBZtHnsgPgjsrm8HNnk83M+c+GJzr?=
 =?iso-8859-1?Q?h1GV9ZCCxpE5JXRsyNtXvlMCW67IZ3/hQs33GNgXiJpbDHTXmvt8WDr69p?=
 =?iso-8859-1?Q?71CBOv+0uNNF/PjIYT/acO5OgFv7h7DH7kbpB9bZJdKqV1CXVCakSt3Vfh?=
 =?iso-8859-1?Q?VkAJw7YXXvWRYmzFvbqu/zbN0eK9KtCRkl46OlrI8cjOn33+llzZS+xzmA?=
 =?iso-8859-1?Q?KKtrwDunRLnv4OPNvstrgZCn67ouOp8+Kn2uHx5lIeNR57PMeRp54/Raet?=
 =?iso-8859-1?Q?3wS+5gSOPuJWdL1eeN6oHV1elbNkvjE+q2VrEXgZOFbah90sXpaomktUAC?=
 =?iso-8859-1?Q?CS9ZHNGUpZxhdRZW2hssGbT3ENg6Igvg3qRu9IQ47zxVbbZi9JNv1ziOS7?=
 =?iso-8859-1?Q?HXlnRghbGxW+adXIg2aNQpbn1fLGB02DR9esQ3LpNMLtBwN1rilZly72tO?=
 =?iso-8859-1?Q?J3NHImNpVGAEizbNtd8QDRIynIO1i/u8VYrYbk5mIEMRVJYRQf9N8Itte3?=
 =?iso-8859-1?Q?Ptrd1W1d5VnUlw8oEqbYHE4IA7ez1MN4pS/meR6rV3/gcD0ddbYe3dVGzH?=
 =?iso-8859-1?Q?H+hA49BduZRo41wmBn9WU6m9nml77yifczxo6dntD4SuV3iyi7UTvgx7eC?=
 =?iso-8859-1?Q?D1lTZP0bxNGWSgcntMnh6Dz2C7z0nbQuCiiBmnxpUWnAruDP7fuxqAhUiT?=
 =?iso-8859-1?Q?VyJc0xfmI/Dwd7qH3o2CbecXJTYmudZci5aBRk79j3aElemUKIRaNwbSfo?=
 =?iso-8859-1?Q?qhF1kRHWlWXeRVmCs=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?t6mK7da+3cBIUED+DQ5QdNQMLoQTKpAc0IV5+oiCKZYYDt6zEKuoDZ8yj7?=
 =?iso-8859-1?Q?Hx42N4Xw1CDcjX78PwjovxU9MUQ73BT/cpkyRmrnYGqf9AHjRroINobslH?=
 =?iso-8859-1?Q?Ni4tycoIT2KcR6lAdSOiHXVrmYy0LhU/irdwlNSsOGqr8QaXPc+dj8+o2c?=
 =?iso-8859-1?Q?IA28ehruQly+oSdafYZbC6ae7fsmJASl0a1o+I/J1eQDE4spVN+UD5SMWp?=
 =?iso-8859-1?Q?GBGaayVZdJQmy052erq0j1QC1faJw1y4lBSkR6wYZzbbG4Jdz4/aZl46dF?=
 =?iso-8859-1?Q?1zgZsYQ6t/KVcQv+CSPsfaOegI16F1bUyp3jxBSpwlYW0tOUWdKFEB0P46?=
 =?iso-8859-1?Q?+DA61cTaMcHSkZu09O/g4KDSVRQSIBVBxoG18YBpQl/zfDisrD7afWTm39?=
 =?iso-8859-1?Q?MAp1ccxyWXSob3I15VYPCTUKn6BGkd7YB4dkuT/WoWGc3CwbGTPbyWmwvs?=
 =?iso-8859-1?Q?KM0eEbmVUkOfm1CgkJepCaL1Gze0oHXKmhGb7tv0H6I5dWEivaSh4aMHMg?=
 =?iso-8859-1?Q?QPWj1WVHex2HctoZIM/jiGQbsYQEEo7tcysb3GJFAATpkVcLaNqEPQz9Ck?=
 =?iso-8859-1?Q?nr0P4VhqPMPL03Q4694ZiLAJQtREMyxMTyDN168NfUuPdYMGBWNqmAV1iR?=
 =?iso-8859-1?Q?oc2o7nESLUHjchBFkIee6kxy6bvfzvTUOSH1aR4ZtuJsyQtnOBfWPM/jNh?=
 =?iso-8859-1?Q?tAk+PS9vTP1eddod5dg3WKGWiLR28Ecf1/wN2NdI3E4m5tHFQanDpRFIHz?=
 =?iso-8859-1?Q?jH0/2HMrJ8hQRA3Ukdd/xx7pFAhWADHo93AoL6amEemebs+rmBPrhNuWQh?=
 =?iso-8859-1?Q?g8Ribq5Le6oN72KI/6dNzUAm4d7bVQAkYW7KmS//e8MF0uKMd5yY/72nqx?=
 =?iso-8859-1?Q?ciqTgBQWNyGV0tifb5WoVFog8Wh9MgG5+ochGqfn/c0uYqcWsBhsaj4x1i?=
 =?iso-8859-1?Q?3vLxVkxLke08qgZkPu4xnZcNHLIgkfqbe+SGhtCmF6npoAiGajD8K//B/N?=
 =?iso-8859-1?Q?p7Ld+7PJCeZx384aDP4XkGVanE0VFt9jY5+c4FDtrGEe+/88Ji/gMaPomx?=
 =?iso-8859-1?Q?vdGgk4E00AXvSEfG5rzv0lTnr2UuR79rV9SUCjpHFCJFLHCDRhZaanqjrW?=
 =?iso-8859-1?Q?UX/MGSex/2O+4Z864Hs+mBPkNeLUUiGxVr6pPTmORHk3dHyzeKTkDCeyNy?=
 =?iso-8859-1?Q?3XRDNkfjveqILTBD1XkohgC59k7qbHH3M0+KxPx7ar7+sS8eUillMu/D+p?=
 =?iso-8859-1?Q?ZMIbIE/Nb+D8t5eSgu1iODznmT+m/mFqnwKVfcWDC4T7aPXtD91QpZeR1n?=
 =?iso-8859-1?Q?v+tWuhOq9lgr1ss7cC07g5jCNQOA6KQ4Ano+0JpZl3U1TM0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a5691b-5268-4814-38fc-08dce39f3a80
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 11:33:40.0355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB9698

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
 rust/kernel/error.rs | 22 ++++++++++++++--------=0A=
 1 file changed, 14 insertions(+), 8 deletions(-)=0A=
=0A=
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs=0A=
index d7965ded2973..45f0a7227d92 100644=0A=
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
@@ -20,7 +21,10 @@ macro_rules! declare_err {=0A=
             $(=0A=
             #[doc =3D $doc]=0A=
             )*=0A=
-            pub const $err: super::Error =3D super::Error(-(crate::binding=
s::$err as i32));=0A=
+            // SAFETY: `err` is checked to be non-zero.=0A=
+            pub const $err: super::Error =3D unsafe {=0A=
+                super::Error(core::num::NonZeroI32::new_unchecked(-(crate:=
:bindings::$err as i32)))=0A=
+            };=0A=
         };=0A=
     }=0A=
 =0A=
@@ -88,7 +92,7 @@ macro_rules! declare_err {=0A=
 ///=0A=
 /// The value is a valid `errno` (i.e. `>=3D -MAX_ERRNO && < 0`).=0A=
 #[derive(Clone, Copy, PartialEq, Eq)]=0A=
-pub struct Error(core::ffi::c_int);=0A=
+pub struct Error(NonZeroI32);=0A=
 =0A=
 impl Error {=0A=
     /// Creates an [`Error`] from a kernel error code.=0A=
@@ -107,7 +111,8 @@ pub fn from_errno(errno: core::ffi::c_int) -> Error {=
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
@@ -118,18 +123,19 @@ pub fn from_errno(errno: core::ffi::c_int) -> Error {=
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
@@ -137,7 +143,7 @@ pub fn to_ptr<T>(self) -> *mut T {=0A=
         #[cfg_attr(target_pointer_width =3D "32", allow(clippy::useless_co=
nversion))]=0A=
         // SAFETY: `self.0` is a valid error due to its invariant.=0A=
         unsafe {=0A=
-            bindings::ERR_PTR(self.0.into()) as *mut _=0A=
+            bindings::ERR_PTR(self.0.get().into()) as *mut _=0A=
         }=0A=
     }=0A=
 =0A=
@@ -145,7 +151,7 @@ pub fn to_ptr<T>(self) -> *mut T {=0A=
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
