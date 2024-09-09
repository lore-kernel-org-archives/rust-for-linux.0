Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2078.outbound.protection.outlook.com [40.92.21.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A642B171066
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Sep 2024 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725911985; cv=fail; b=hxnwFnplVNmRw44PptqNF5ODCvU/sXrUEWNdZRl8x2bkam5fVbrGarU+hAsr2enCcP2ksoDylfO/dEGAWAtexINvzt+LDa9eoX3Iq9leBhwjCTpE0rsG5nap2QjuF5/bg43yV8La6XfhHyrKJHZtuw50vdZ2XCPWDh3F0bYPIs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725911985; c=relaxed/simple;
	bh=wqIlK68vMUIiKHWF5xW6S7NbM43vygXRVQAGg0F2nmc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SUXl/GRm0stDb6uuBQ7vsGFKKRnUxXQOHavtkJlXeDbZtmFZX/XhU/QEYQnQsUDHmwEDBtbeaRTKiHG7ntwQjhseyAZG0zwXhvZ7I2A89VyfsiUXSL4/ZW42Yi0lzGqpgbmhh0XbapGYdqMF+UHh98KodGKSqA50B2QUee3pJzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=AidjN0i+; arc=fail smtp.client-ip=40.92.21.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="AidjN0i+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GB5ymbLoeCYB5ZNcPucVLF8jhlsQuW6rbHCt2r3k+eca2HyzFjLS00GLeTIHkIZDirth9A7qw9G3M/lmXT3+mJYeP8311siD0gKse3podbLpRxJoPt2/QofS82jYxk6O3v84wIahmNmG+usdiwwdFw9jg3kCIKMSr5NBdQUzRrlUjqoODQyOouQy7qm8GFSxlyvSd8xhPbnIO+zbAoatwXIuzCodyR4svI9PYOMwkQvX+CUrcQrmeTNnnEIi52L1PMG6moCymVKtAQLjz1bnx2ayXfYI3zqeJgCmEujVzFEoYNUj7r48T2A2HNzmE0FUjlNWa21lUHDw0F+xxRPJaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiyWW+Nbi6BTcdS4Bvxz8d20B8oJaHl9vN3o9lXnAsE=;
 b=izJ4jKB0ZISM7H+1oFfw8E3CJw8/OGfRf//JdeHKY3IJilCKVMfLnMjl2XfdhSjg5IinL18NMPGLl+SgOmEGUlLXAy5KKE4bRFMxsPr4WzWS3nttvpNd06tLzp8FJoBwogx7RFvrj61uvD6KmE+IXbvv+uC8eJdI+I9Z6yJZwr8CpfOtJ9J/ACvjYfQI2rfJEg1nxIsBfmcXy3b0YPmLXtl9IrAPGwc+S7Qb3asNRqsu6QGwT1MfoQuosNaiqG0xrnNgJntP7QazO9RmlrYeuTzORbzDT0yFjxJ1eoE9hG8m4qaWyT7E8KfnEORa5S+2+E424mFE4CQkwhvc9t33GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiyWW+Nbi6BTcdS4Bvxz8d20B8oJaHl9vN3o9lXnAsE=;
 b=AidjN0i+3p5W7IrtDLzJ9QUCDS/n6049EMZb6U9Ty01vpaDyg5GkuW5/RwiG2yOxTMHeGG+xr9leOhu5woEZEjpuY8R2e5f5hAwi/v1je4FE7SSgvmviHPlblVanGhhoaUimUUuAQDLiHSWk5ByDxTZzV34xDsnTPhCQ3iNzxKHzrabkO08CBCudrIDBLqQQReARZNCxssxMgWZoy1OIeW7N4BXq6YrT90JbW7H5uNfmNhHYvHKzSPtnPHzueDw5lEcukG/0+S92OL2OplqQuGwIwscQa79G3BywfC2gHi0s8W98tmdj5bcH5VivEKzR0mzo1jOKQ+KDXiiRYXR4rA==
Received: from DM4PR14MB7276.namprd14.prod.outlook.com (2603:10b6:8:186::13)
 by BY5PR14MB3669.namprd14.prod.outlook.com (2603:10b6:a03:1d2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 19:59:39 +0000
Received: from DM4PR14MB7276.namprd14.prod.outlook.com
 ([fe80::744f:71ea:aec:9c4d]) by DM4PR14MB7276.namprd14.prod.outlook.com
 ([fe80::744f:71ea:aec:9c4d%4]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 19:59:39 +0000
From: Filipe Xavier <felipe_life@live.com>
To: aliceryhl@google.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	Filipe Xavier <felipe_life@live.com>
Subject: [PATCH v2] rust: Make functions accessible outside the kernel crate
Date: Mon,  9 Sep 2024 16:59:26 -0300
Message-ID:
 <DM4PR14MB727613E0669989AF7E12357FE9992@DM4PR14MB7276.namprd14.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Yroo4Z5fL8M1YMOwsPUKJvnXY5c1H100pBvdH610J2AAq8Qavxyuzr085qFnxO90]
X-ClientProxiedBy: CP5P284CA0040.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:96::9) To DM4PR14MB7276.namprd14.prod.outlook.com
 (2603:10b6:8:186::13)
X-Microsoft-Original-Message-ID: <20240909195926.35655-1-felipe_life@live.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR14MB7276:EE_|BY5PR14MB3669:EE_
X-MS-Office365-Filtering-Correlation-Id: c2641a9d-6011-416e-bc6e-08dcd109f007
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|15080799006|8060799006|5072599009|19110799003|3412199025|440099028|4302099013|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	K9yW8BHiEY65AgSlDOhSVbnr6g1VkPEzMv206doDVEIK4F5lB6cBkThRH/BgZ02PddJAeyuUd4E8VA0K7OkmK7+fy6dZF5A0mhxaQ3Us9bJEYwwz9Cm9y0zugUy3hvBihf8NDyqBPGdS8+8p8giuc88ztlKLfHGcTgtwg2X6GdmUxKX+J1ZGDEAq28Vjc9tPopuzZub44AoCKKAGVr/3l8AZdjDIEvzzleFwUk3sauQ9WyyAjRRXs2e3wcyTv2B3UoWlOSAUeVLs++DHSiwkwDOGUUbtztDMkQYJiRk/XjZT27PVTlOTe3bpArrL5WPlaep4rYW3tGiFcX6xw7QYgiX7mNV8BGRlWYKNF+03ypDkin/2PoEsmVPNYwZr1MjOI9DQuXoTL5elRk0uhQQ+e09gssKC/nREwkxChGgG/129+KbjhScYyLaF99GK4NJr2GKWVpTy3kjOJrolfzedIv7m9QuYM7L5JscKCL5boGmUGajJllp5v59g8zn89GfmS8E3z5FbIMoPNsQYu3KF6GBP4yzPLghtc13+3kmgeHGk5ZCuTRSUl1DceQAp4X2yI7nT5mpACmewgCIDm+geLjf+zCWDSSFD/shMi8B7aSKtw7/jDf7X5tNGjB5So8KmvdvG4uqzJBk6Tdxbiu2LxxDKMvllPiGkMoGtoObb5TXMeAiyK9PGCwKx8YuIaq6HLjGv0G4ThamGxFSDD6JX/+NTDdnqNwxEq24jUWPaWw0z2EQqKk9e5wvyPaqBjsL8p2fxxaKGA+vjG+5Zqx1yYW4pHd+S1usjS9OWtoBsRBlERR8ACHdgmTYJXHvKoN0kYSdxgkWo68nr+gCNgmqOSw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eTO2seG96qn45bCf5rxt9ZW9Mn2jolOam5aq7q5mUlryCpoRwWnKp8Tu9lY7?=
 =?us-ascii?Q?ExvFb2MiUtsKDiYys9lplVoniOwHRWqPdMhtkv8drz6dF7wJZOPes5pG2NYt?=
 =?us-ascii?Q?HaykGpJk/S2ddcDbWIx36wfjkQ5r9mAjbkjZKTE84Hb7LwibKKKOjMo08MZO?=
 =?us-ascii?Q?JIyCmRzeHcyExcy0gm2ODCSQwExHbLerTXMW2QtAZM7IWBVOWgvgLzcHqj3S?=
 =?us-ascii?Q?Jg4Q/xv3FmuTVLRNoPGGz1fbhHQxhlImWKsH2NCP2fjcQRnflkHiZ2xDbDxb?=
 =?us-ascii?Q?yc5bCkJrEH2rvGrNCTatINMOJEyK+hEtbOJ4VZQ2COB9BYBfFNirt/c+LU5u?=
 =?us-ascii?Q?pTQFh7HBAF4atNWKvjk8i/zx+eh8YILMiHrQsn696ly8NM0/bjV0+yH1Q8Bf?=
 =?us-ascii?Q?dM+jKZHHNdqjbRnyJRUqe8A48LnJ2UhR/PBm8nrHn/zcqv6ddasldpa7UL/z?=
 =?us-ascii?Q?Ajic3YZ2FHWhx/JZHcXiuSSIxLcl/0ZlPAAlaxxXIZInf4juAyZEIeyJjnls?=
 =?us-ascii?Q?3DMQUWn26YMYvukvelYZtita+BW2Fcp3eCPxI7XEyVX0nc26Bxtd8S/mvQtS?=
 =?us-ascii?Q?hmcqX6+oxzDUJu7xJG6tU01vm5VHNu1S9yinRF5hB6jFnOHMhJEussY2WZvP?=
 =?us-ascii?Q?PYuSmQegYcYkz+DWFUuJSjGP/BJ1jxvBzcnbUgAgEXyn2619DZ3Hb1AHPW4r?=
 =?us-ascii?Q?Lk5bn3s9/B3NZIjQ9MLQgLim19Mmpwam41VxobYC9VGxvjmqx/0hZtB8rTRo?=
 =?us-ascii?Q?BV8cWJXILkhmzPhY760Wf6jy/VTL1Q20qqHX8nklZasE1zBT0V3Yk9oZm1j9?=
 =?us-ascii?Q?WmvFCcLz5NKx0nPHr7f0sxqw/C6RGz/skEyMZrniOPyLI0zD1XaeEU3NwMQi?=
 =?us-ascii?Q?5fNaPSMLfR4PFW3rV+aT1V6zmCukV5NIWguT1GyISXhgGM4NPOjU9QLKQkW+?=
 =?us-ascii?Q?mZnp1pA17leAvnqz4maw7xX1tZT7aQeYiyDqa9Q+3xuoYmafDJEp79yBDvUL?=
 =?us-ascii?Q?u4XOqx0+dsbFAVeovI/68PdL3g8DJt2JaIunOjqKJcOFVvv7z2S1ckZ6qSoB?=
 =?us-ascii?Q?7FvECwGVYuiQGBIWeGBGeFRjlKMbs07OBfibKSviIq3iAJ1pSwPxS5aXIH3b?=
 =?us-ascii?Q?L0n/7PDfbC8JzrsUEFLX71+t1Vj0QOD9Ec8G3tMD2DWTMU4ykvToHKOejD7r?=
 =?us-ascii?Q?Bgz0n4niJNnsccxGMBLXEp5M/fYDz5/3uPkaWqULq7nEBbvuHSA+vTn8+wsd?=
 =?us-ascii?Q?TidCmEZXeNn9aRTG0hXU9PZ4nYtpdKxbITN1EGjsFnF2+55tfsPiajYlYekM?=
 =?us-ascii?Q?S3I=3D?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-e4812.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c2641a9d-6011-416e-bc6e-08dcd109f007
X-MS-Exchange-CrossTenant-AuthSource: DM4PR14MB7276.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 19:59:39.6165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR14MB3669

Change visibility to public of functions in error.rs:
from_err_ptr, from_result and to_ptr. 
Additionally, remove dead_code annotations.

Link: https://github.com/Rust-for-Linux/linux/issues/1105
Signed-off-by: Filipe Xavier <felipe_life@live.com>

---
 rust/kernel/error.rs | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 6f1587a2524e..ecfa6aa41034 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -133,8 +133,7 @@ pub(crate) fn to_blk_status(self) -> bindings::blk_status_t {
     }
 
     /// Returns the error encoded as a pointer.
-    #[allow(dead_code)]
-    pub(crate) fn to_ptr<T>(self) -> *mut T {
+    pub fn to_ptr<T>(self) -> *mut T {
         #[cfg_attr(target_pointer_width = "32", allow(clippy::useless_conversion))]
         // SAFETY: `self.0` is a valid error due to its invariant.
         unsafe {
@@ -268,9 +267,7 @@ pub fn to_result(err: core::ffi::c_int) -> Result {
 ///     from_err_ptr(unsafe { bindings::devm_platform_ioremap_resource(pdev.to_ptr(), index) })
 /// }
 /// ```
-// TODO: Remove `dead_code` marker once an in-kernel client is available.
-#[allow(dead_code)]
-pub(crate) fn from_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
+pub fn from_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
     // CAST: Casting a pointer to `*const core::ffi::c_void` is always valid.
     let const_ptr: *const core::ffi::c_void = ptr.cast();
     // SAFETY: The FFI function does not deref the pointer.
@@ -315,9 +312,7 @@ pub(crate) fn from_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
 ///     })
 /// }
 /// ```
-// TODO: Remove `dead_code` marker once an in-kernel client is available.
-#[allow(dead_code)]
-pub(crate) fn from_result<T, F>(f: F) -> T
+pub fn from_result<T, F>(f: F) -> T
 where
     T: From<i16>,
     F: FnOnce() -> Result<T>,
-- 
2.46.0

