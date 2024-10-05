Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazolkn19010023.outbound.protection.outlook.com [52.103.2.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F5C130AC8
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Oct 2024 19:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728157887; cv=fail; b=efh6SE8bRcj2XzAVF8pLeonaC1H83GffhMQWJlB/zdHjc/cbr/agp1qlt0PaXfWcLFsSx9YnQKIWS5OdgkJn4qhhyBVpy0OnG4evoisQZ92FvUF1B039NkIfsBELxbGio4vlaTl7VZCUgMzAhX+mnUAvE8DpxSAlWx3ksfAGJus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728157887; c=relaxed/simple;
	bh=g2uXx418nCmsvp9Og2QrPojE4tf0CcCPV6iuOZmjHBU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BrDxY3E0/IJK91Wtg9xgsnFQbLjg8AY2ACg2xj/iK44RRXEey3L2we3KWjZCgHUe9MLPKwzzl2FHkmbQvMfNXmqBOwdr4n1EDG/rgjmUEOwGKARz1L3r1p3fN7G7dH98oSAVCqBUCBp4YyGyks+n2FnVG8iF2JSidjJ6c/iNnTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=fDtgNMFM; arc=fail smtp.client-ip=52.103.2.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="fDtgNMFM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaOeBSyjQtp1T+w75KY9sy9Yy2VYq6Rlkqv+cxrXCnArAHQE9Yzi3aFCgUJSHV0UIbpEWatVxdvYvam8Yk7rK3NlnPPqAk0LOsgl7JyuOcC1oaGyWPQnO1SolRWhLYggPe5Ig22DJc6V4H0abZk8yej/tTly8Ratw1uyOmKVShJjg2y7enPKk8YWRwnstpmvtGMy8c0oYNDDxXGov8GL54F0gDGhokr7busNI61lzNnrCKSAAVdbLyqvZNmgJnlYd9K4YBAWncoHz6XpG2alWNbvRsRdhrwa2ALQpJXmGGpC4NzLLPVwkzoGr62PJIXEr4uLiIvt16VKL4+yFrDw1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZPEM1na+6+gRvmyG8h+XBRKVHsUrpvkk9vED0QOUSc=;
 b=f7OArJO890TvzjH7IcKLnkcok0Go+GocDxOhBeiLdkktjrmrA3jKhk3O7cw/vlJ1lbb3GoT70jkoRE79GY6LghNJvoP5KyNOLA1Vp+zQuDdaEdilfVcYBcca2vS/n69YroUlwUvc2DRN7qLjjseI2cFEJWxbyznhJ3JmE3Sm9u6Rka0Wtcn+DVquNLHlao4WdcOyAEKaXkWtJXmp+DRCiEMgfaSn1l+LjFWDyQ27ddj7e7BTtRBzk3q0eqhE/YLYykl4TUmPdQrRWh2y85hZEA9u1Y0Tv6MyJtzST+szLFZJiOvgzW82VWSygvFJMUOlFNw9mkDKRuy2SWDPngR/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZPEM1na+6+gRvmyG8h+XBRKVHsUrpvkk9vED0QOUSc=;
 b=fDtgNMFMHm0fE+Lw8rbNlxHHRb6coVSWShJfH4hCN6p3VXL646EvTsGmBCMpmyULYbYkNyhDFAHRAKuGtHVc9uCH9b0gYXV4Z7kAggQtONID4xNfws1KdGAMo1swIUKfvyoQzZ6wUY4ArQXE8gsaC31ZpiPIeXI7nr2CWkTzTz7+AUDgTGODArsZjTvgdPAmbuQ+Hi4pQFLvc6t3z7fl9y+yDPbw5ANVWjfSf4BA8DOuOO9yfbwLVgUuzgjDq58/Cdnmropb0DxnM7GX55/GWC+fBxEKigSZQ6AceocwvpmlHZS8fkQ0YeG/hUuhqJLbmgjmVu3ZNkaucrJQpq9B8A==
Received: from BL0PR02MB4914.namprd02.prod.outlook.com (2603:10b6:208:53::23)
 by CYYPR02MB9667.namprd02.prod.outlook.com (2603:10b6:930:ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Sat, 5 Oct
 2024 19:51:23 +0000
Received: from BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089]) by BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089%6]) with mapi id 15.20.8026.019; Sat, 5 Oct 2024
 19:51:23 +0000
From: Filipe Xavier <felipe_life@live.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, Benno Lossin <benno.lossin@proton.me>,
	"gary@garyguo.net" <gary@garyguo.net>, "boqun.feng@gmail.com"
	<boqun.feng@gmail.com>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>
CC: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Filipe
 Xavier <felipe_life@live.com>
Subject: [PATCH v4] rust: optimize error type to use nonzero
Thread-Topic: [PATCH v4] rust: optimize error type to use nonzero
Thread-Index: AQHbF19Tl03gCs7SL0+Wusk0lwVfcQ==
Date: Sat, 5 Oct 2024 19:51:23 +0000
Message-ID:
 <BL0PR02MB4914B9B088865CF237731207E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4914:EE_|CYYPR02MB9667:EE_
x-ms-office365-filtering-correlation-id: 7ed7a500-3e5a-4110-98bc-08dce5771748
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|7092599003|8060799006|15030799003|19110799003|461199028|8062599003|5062599005|3412199025|4302099013|440099028|1602099012|10035399004|102099032|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VgTtui8ZJGXUvUZSFyUE+A4pm4kDQ85PsmUpJFQvC4KJG98uOPsFlzxHFD?=
 =?iso-8859-1?Q?Bc66gqESw/48uMCoC+NUMyMUwYbvVAFOPhnDaKv6gmJ+HKV7qCQh6QVPrt?=
 =?iso-8859-1?Q?QA3hg6ij9QXmwRp49FWx534ktVQ7//hhM1oaGUbRbnOt2eSaswbNmJf1fv?=
 =?iso-8859-1?Q?KPUtF9vOgUtiqgc8zzTjeDcDPDU+Am9t8s+XQK5zfeiRVWLgwK25qPzMNU?=
 =?iso-8859-1?Q?0tCbQsq1SzWlFot+9fO66cJa+IAORRh6I4GMLedCtuFIicuXduC/u9MICx?=
 =?iso-8859-1?Q?AiVls+GHHOqIvItaP9sFDYVyex31tlpXXBWMaid9j/GoAtvZWjiCJPGNVk?=
 =?iso-8859-1?Q?MJWeEekEeB7Q7IqIAuK/7QCzvbWd8LdZNHtc7qSke/Q+sf3slKn3l/6fZe?=
 =?iso-8859-1?Q?h/4rooTC3RmYhTF+B6nP+ctSZm6ldOLIgYftFxCKxkOMRMvDBL3KUK/ryB?=
 =?iso-8859-1?Q?NnlItusYMgDkdhCZ1Jr40tmi+6DOxGLCUQh2TejHd7z3tb+l3LmIHz1W1v?=
 =?iso-8859-1?Q?AuETm91NEbIK3fqBKJ/bZKrraerLhizEKUid9gLE3t7ijd1Tf31u4g+S0z?=
 =?iso-8859-1?Q?T3LIKRjiDaXrMSu0yaZRVSggbDPulBg65riDtNnjOtVJCCw+uyHIoTiZ3K?=
 =?iso-8859-1?Q?LtHdL6jZr4/3TmZ43sBZVuySvI+P3V87yFLUvOSBuu+1EglBB+gHsiKrTt?=
 =?iso-8859-1?Q?s72umYV3gM7qMiFkqDqGq9CzRiZlUgcTe+I/5qI3i3V1QvqrXCbP4DcXGY?=
 =?iso-8859-1?Q?Iz6K/XOcnhkRzgcnf4NM4cpka81QeZSADJ4t98H+xElrSqZKDYwGPpzlor?=
 =?iso-8859-1?Q?CAiT7HPuxM4H5mouRCEV8gSyQmlh/NjLbYqMdNyYHn0cXiORoqF9Yu0JeX?=
 =?iso-8859-1?Q?BQY+DKAA4ZOVNgtoxfB+Bzt0lNp8XUD4RfETHhfDYljQMULXLkhQduC/Jv?=
 =?iso-8859-1?Q?oqUc/LIZFGALyjIcZESbKaptSc6e/HO4kEXXA4Ie4NfV2Ytv8btJ1ZtyNG?=
 =?iso-8859-1?Q?F6e+ortGnwdPSJv2SNLkvBwA9iRRzqamvBJRpv5N3P4n/gTv608pz/dOlk?=
 =?iso-8859-1?Q?LA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7pkdNcbP7k4osyHOxf+0PPHXO1hcUYL2zQgVVm9HnoaDY1QjE/9oGVBA2Z?=
 =?iso-8859-1?Q?5agzbRGvmRpusnexHPyBluazh8+mqPleDLE4vJAcoJyP5dqliOHd6gcU/E?=
 =?iso-8859-1?Q?kSBmFb+1OlXBDpVOTZCrJi3JhYnQ2Dcp76cAaopV8cuXOZMiGqufoS9rcN?=
 =?iso-8859-1?Q?kZWUQbGp8xn8eVif/kIojGNOGZwV8it1gzWx1NJOwldIq+P3vl/uHcDhD0?=
 =?iso-8859-1?Q?dnFc0pqeOdfd+qFHw6UISGfDlQIiLYjpUp/6J7jLnOnqf07caBwxCWPQc4?=
 =?iso-8859-1?Q?nLQqW+l+8kBwEO+tDldYOR45SvNwdjbaAUE8OrO2CpdhD8shWM+/5se0Yg?=
 =?iso-8859-1?Q?MOYB4+ibayBC8n6hQ5kAFNcoKfFBu3nPZtgpEzOdgSZCmm2koHnCDmGfOh?=
 =?iso-8859-1?Q?JMRilGQ2W5IroLmzXmpT79piF4N5QpddAsVBOhVQweWKQsfsynoXaaSj2B?=
 =?iso-8859-1?Q?FuVZ/S039TTAbLITyQqc4qqRkUzWVNKiZdfw2RsDvqCYahhLJJVIkP33rm?=
 =?iso-8859-1?Q?h0hCx1WbVitTiePhLVkm18XPqKHz2zxQxZko7aT/iSfpnZDLJDjqiJBDq1?=
 =?iso-8859-1?Q?4PN2PZeFwQGVhHG8IXJCW69HYODnkR1pUlLdbTkXda7D3c99LPBhyHI6vB?=
 =?iso-8859-1?Q?7RLwFyqSfZGFAtdi6TAX4ZRmdIirYB5TLlfUTTgHsMBWRi/M3wFpOcqsFf?=
 =?iso-8859-1?Q?ZimxNvN816PZl5k0J2s1+D1YJfZVQSk/BTuCHQMHVYqyq3HIUL8FjcdYkk?=
 =?iso-8859-1?Q?R7WJcZ3KEMJLW7Enojm62oVL+uhOf8SllnNjokwBqoNqKynhqhIN9J6JU5?=
 =?iso-8859-1?Q?CSoDyLVKQj/92Re1RL07E7WIKMhUMtGruEZ++aQ2PrsXrFZEz66WVFM52I?=
 =?iso-8859-1?Q?4/g6mpgdwd9D2mtTN+F1lLYEAdJ8Ng9YvUHXprpuAYDSepnZYYlTANgX/B?=
 =?iso-8859-1?Q?tB7OE8O3S0jtOulFxwniJj59zcT4uUvsImph6LtbJK+QEI0Utlc0tUZ34m?=
 =?iso-8859-1?Q?lc5fKpeSJzHlhqbDXoitvGXvGGAzsEA8UFFACQhc7N+bks040T5aiR/NEe?=
 =?iso-8859-1?Q?gL3LABAk6qkHO94PB9E04h3HCfkp88t347LutwINMhbTIUZXVJxls1kbGD?=
 =?iso-8859-1?Q?Dr7TTNdh+OXAa6XQo/g8u1Pys9AQ0TNsx/TjLiMqkEPQcWjvC2BuLdtaqR?=
 =?iso-8859-1?Q?t+wf+XWY1+KlMDqWrV+UAcIrnERGPOqku9mgzRjjuveLk9osql4N3ridO1?=
 =?iso-8859-1?Q?25xdGk7SBQlT7Av1SDEevlpYXSMJPO5yl11kjFmO0mNBM7bymvUHxaste4?=
 =?iso-8859-1?Q?s+gSatx7oE/rc8XduOw002IcfnMSHWJ9E0+Qv/Qo/NoNJtY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed7a500-3e5a-4110-98bc-08dce5771748
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2024 19:51:23.3805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR02MB9667

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
Changes in v4:=0A=
- Created const fn try_from_errno to use on macro.=0A=
- Adjusted macro declare_err to use try_from_errno and remain safe.=0A=
Link to v3: https://lore.kernel.org/rust-for-linux/BL0PR02MB491443BD775D5D6=
3635C3F4FE9712@BL0PR02MB4914.namprd02.prod.outlook.com/=0A=
=0A=
Changes in v3:=0A=
- Adjusted safety comment of function from_errno.=0A=
- Adjusted macro declare_err to check if error code is valid and =0A=
  its safety comment fixed.=0A=
Link to v2: https://lore.kernel.org/rust-for-linux/BL0PR02MB49141A172569679=
932EBA20CE9712@BL0PR02MB4914.namprd02.prod.outlook.com/=0A=
=0A=
Changes in v2:=0A=
- Adjusted on commit message.=0A=
- Added safety comment on macro.=0A=
- Reverted signature of function from_errno.=0A=
- Removed explicit type on function to_ptr.=0A=
Link to v1: https://lore.kernel.org/rust-for-linux/BL0PR02MB49142BDF011175D=
ADD6E79D0E9702@BL0PR02MB4914.namprd02.prod.outlook.com/=0A=
=0A=
 rust/kernel/error.rs | 38 +++++++++++++++++++++++++++++---------=0A=
 1 file changed, 29 insertions(+), 9 deletions(-)=0A=
=0A=
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs=0A=
index d7965ded2973..36015ed7b258 100644=0A=
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
@@ -20,7 +21,12 @@ macro_rules! declare_err {=0A=
             $(=0A=
             #[doc =3D $doc]=0A=
             )*=0A=
-            pub const $err: super::Error =3D super::Error(-(crate::binding=
s::$err as i32));=0A=
+            pub const $err: super::Error =3D {=0A=
+                match super::Error::try_from_errno(-(crate::bindings::$err=
 as i32)) {=0A=
+                    Some(err) =3D> err,=0A=
+                    None =3D> panic!("Invalid errno in declare_err!"),=0A=
+                }=0A=
+            };=0A=
         };=0A=
     }=0A=
 =0A=
@@ -88,7 +94,7 @@ macro_rules! declare_err {=0A=
 ///=0A=
 /// The value is a valid `errno` (i.e. `>=3D -MAX_ERRNO && < 0`).=0A=
 #[derive(Clone, Copy, PartialEq, Eq)]=0A=
-pub struct Error(core::ffi::c_int);=0A=
+pub struct Error(NonZeroI32);=0A=
 =0A=
 impl Error {=0A=
     /// Creates an [`Error`] from a kernel error code.=0A=
@@ -107,7 +113,20 @@ pub fn from_errno(errno: core::ffi::c_int) -> Error {=
=0A=
 =0A=
         // INVARIANT: The check above ensures the type invariant=0A=
         // will hold.=0A=
-        Error(errno)=0A=
+        // SAFETY: `errno` is checked above to be in a valid range.=0A=
+        unsafe { Error::from_errno_unchecked(errno) }=0A=
+    }=0A=
+=0A=
+    /// Creates an [`Error`] from a kernel error code.=0A=
+    ///=0A=
+    /// Returns `None` if `errno` is out-of-range.=0A=
+    const fn try_from_errno(errno: core::ffi::c_int) -> Option<Error> {=0A=
+        if errno < -(bindings::MAX_ERRNO as i32) || errno >=3D 0 {=0A=
+            return None;=0A=
+        }=0A=
+=0A=
+        // SAFETY: `errno` is checked above to be in a valid range.=0A=
+        Some(unsafe { Error::from_errno_unchecked(errno) })=0A=
     }=0A=
 =0A=
     /// Creates an [`Error`] from a kernel error code.=0A=
@@ -115,21 +134,22 @@ pub fn from_errno(errno: core::ffi::c_int) -> Error {=
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
@@ -137,7 +157,7 @@ pub fn to_ptr<T>(self) -> *mut T {=0A=
         #[cfg_attr(target_pointer_width =3D "32", allow(clippy::useless_co=
nversion))]=0A=
         // SAFETY: `self.0` is a valid error due to its invariant.=0A=
         unsafe {=0A=
-            bindings::ERR_PTR(self.0.into()) as *mut _=0A=
+            bindings::ERR_PTR(self.0.get().into()) as *mut _=0A=
         }=0A=
     }=0A=
 =0A=
@@ -145,7 +165,7 @@ pub fn to_ptr<T>(self) -> *mut T {=0A=
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
