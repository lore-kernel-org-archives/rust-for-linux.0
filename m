Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2021.outbound.protection.outlook.com [40.92.41.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CFF1272A6
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 10:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726222856; cv=fail; b=U9zHp0O/o8RaFLx8ciAN3NR4tK4df5/2wQhKz87ZisZHmNPrj800hO7kmkN6EdAXq40H6yyu69WlQxZYzALzRhyF3GQsa0WX7H27bvQEUw3pHlzT9VxgX24xmmhYIYfZ5doZZSKVQ5awqQ7LTlOv3e9cVmiseBzGVQ2CZo+ON2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726222856; c=relaxed/simple;
	bh=RhvgfnsCf9C5L72lwG2pIoNyoYb4gSJsh34NYRIqPM0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZwwYPUCVGqHKY2S0tIpaTP3RrWL9f6VtFJRelH1rxe3H3VtU6gd7s5fyH0tsIqqM4tJfYYkRIzNLE3x+WQlK+tvdx+7E4mWV5tDi+SgG3ZXFxipxgpdExt1CUokrxSX+FUQKWF/K9J5+MsUiuTfcAWS8UXOEU0X/kwjk/91C8rU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=slFvwxKb; arc=fail smtp.client-ip=40.92.41.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="slFvwxKb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiYa9IvRdezUyybjdp3QDWLlOdl4zbTKt6mK1oOHGWMs00/KjJfNKc6i7DnNbDjFL4saC4XLNgjF3Rs5Qi+PpOnSqezYTCFoTXz1dmm55MHTOchV3r5ge8bafzMKcSq+CodvPaJpkKnEQ2ntTS/z7CNUC4bmzsz6SJ7+fn4sC4MWw1AT043wQ3BC1P0uZNPbjjII2P12wZfwZIotXTEPS+nol3qNW4LgrKqtIbSOhznEdCTdWW8TIcqNp39HIIAb842OmNsgld+CvQIuZfABU0glWJ34VcO/z/pPiAaQZH+9ztnemMbbdaVbkIserQmpo43bXsTmHMQ9RH0+tKi06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5t+7lSi8gTqKgzYZ+y7nzZEXDclEGpPUF8t09SUqcDk=;
 b=l1/qvg7vZbuHACeOInZF0/MYLwEZVpXh8lKyywjnBl6axA1y6N3G+c8H30VPAIxmdosL76svNrDAwuurKJwmeWlUxwkEfMB/WFS2ghyK512BR68+sUCK+Y2n6baU9TPeX5weN/RlhChqtJyAqWH8Al7qFpPh4N3wCucVbwB5ZYZof8+6Ggh9sOzvhWHnbBc+1jvTbOktOiQRmjXuhbPiqSsmNoyrhKFxv4QvlA/9CXyN+yZDKMUtkk/bKTNHCeAY8ISOf52teyoRVMrPR1Oy9PBGugoQIV+R6nr4XWWfk+OL8FUD7Yq7q/VUNO24IHsi/YuHilW9W+rCSi5EnlW+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5t+7lSi8gTqKgzYZ+y7nzZEXDclEGpPUF8t09SUqcDk=;
 b=slFvwxKbZJV7IaC/m7dL+ldYxhxExwnngVsLmyy98ukJPvWOhaHpI+ctXSLNmzKat6TC6OgJYsuLv2VuaH+9EyLbfw1K48J1vH3KY2IEe0cGkQjLJoEj8YCs+/cqXou2rmxM89ukJ3wRzIqgV6GuSpkv8qIBXIclqagiyGhlgHLQ608zed0T37GbsdUpymE7we2dwS9JwS+Yi5jQHW9k7NsiIsSaAy6HWDJQWT3fDWIs/nBeX7g/A2yqo7M9FUuvZCg7CTaSNfFtaVJfBAvnB/kA0mtY/YphFZN8Rl8Y3NUIzW70Y3T1OZFjRa1EgYsmeUMds/o9Vwig5tWnbGUNtQ==
Received: from DM4PR14MB7276.namprd14.prod.outlook.com (2603:10b6:8:186::13)
 by PH7PR14MB6988.namprd14.prod.outlook.com (2603:10b6:510:247::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 10:20:51 +0000
Received: from DM4PR14MB7276.namprd14.prod.outlook.com
 ([fe80::744f:71ea:aec:9c4d]) by DM4PR14MB7276.namprd14.prod.outlook.com
 ([fe80::744f:71ea:aec:9c4d%4]) with mapi id 15.20.7939.022; Fri, 13 Sep 2024
 10:20:51 +0000
From: Filipe Xavier <felipe_life@live.com>
To: aliceryhl@google.com,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alex.gaynor@gmail.com,
	benno.lossin@proton.me
Cc: rust-for-linux@vger.kernel.org,
	Filipe Xavier <felipe_life@live.com>
Subject: [PATCH v3] rust: error: make conversion functions public
Date: Fri, 13 Sep 2024 07:19:56 -0300
Message-ID:
 <DM4PR14MB7276E6948E67B3B23D8EA847E9652@DM4PR14MB7276.namprd14.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [VrTR0MicTZWb3gqIONnCgpO53dY81qOTrLU/Q0Cv6I29XV9YPOWl2/6myTvZcF2B]
X-ClientProxiedBy: CP6P284CA0031.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1ac::16) To DM4PR14MB7276.namprd14.prod.outlook.com
 (2603:10b6:8:186::13)
X-Microsoft-Original-Message-ID: <20240913101956.41338-1-felipe_life@live.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR14MB7276:EE_|PH7PR14MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0a84ba-3e1a-4de5-868e-08dcd3ddbe22
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|19110799003|5072599009|461199028|8060799006|1602099012|4302099013|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	zTci+BUM67phMkPbQRaixtRkAbtp2mD/sCiICcs4SvJfOp7QJPUE6XRSQBFe5Tbw6BqGw2xI/DIG9tojrIctviMuGK8fFHBG0S1EiWWAy3Q+6xDVNM1VAzu/wsGOgFbONicrDYdD7+6wZinfPzeq7QvWs9IrQZmISMvuW6WxvLtY+7dYoRIgjS9+sTE43BqWw6GRzvhcZixfONpIysW6YgMW6JYzfY26YXTQroyDwBg9jOGulJIyz51forc2mfYjfiAaMzg0Zhkqf7ABco47iNCJ91CoI5R2s9SP/18joauGmd7ExNre95+lhaEgocCuQV+z0qo920K5DZKjnPu6elKIdmuR93R46iCiidnS8yq7CCuCxZ3SRJUID4XTITwk/VVVykB5lOoJT8QkvRBapo6xQgczeAkzJ7kw8dtvYNsdPHwd4m8YzWjkLpvGD/hvlpzg0pgdi9Hbii+8hq+zkNWTQENMGsHBHfN6StgN+I2jrjvVzJy0dFo/2o3xtyGQ58Dwu4MJRMjDqnqd2l4cDsM4b3K7i7aQYxyWlddUv1klH0xYyvV/B9EENy8+ivUQHWyheifYMUHWt/L/9bwOle+UqBdMYPwAKh4TG/KOJfwti+A+WjAUS347S6sXum8/MuhXKWadJ2xvpKzvSQuLYnFD6hrZrTLWlpCXHPaVtpVq9B8fBe9qkULUkfLyB3501Xu2jTsQcdX3zg69KmV0yWh4wJYFX+++r+r3XxVDtNi+m0kS6SuaVMDIMKnQMbHJgiKhjaoAzGDAcIYJNr25WBeFUaEnBGTM80Vljs4ZTusIPYO2N3Jlm+xVcOa2dhTxRuyWBwtsp5yzcY9uCWHZo+U+QUGLD4KAHin/McRaoMI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SI9RX62/EfBWo+AUVGXUFLJkOrYdLb5HUJGVSb8Msfytfy9Vl/z850A+eXrr?=
 =?us-ascii?Q?bks+8D24nRPxjz7cUDqrfnHIKPXL9WCNgXT9ZORwUq4k2blsiJKTl4fmjltJ?=
 =?us-ascii?Q?eVadNe8ls4vKz9OIgW8CzlVM+PfgCPQhAlNNdgnRKBclYOZK8WpiKwA6BCbj?=
 =?us-ascii?Q?fqdvarEBq54V4b/zAZMuQ8spubutMs4wueildxitDz6oZgmZv5Jw2fOdnASW?=
 =?us-ascii?Q?XVo8G3kHPmSxBswKAMJn0I4j5DkjsV8Tpo90SAdsTSbN0QkjA5Jnd9DCXWK5?=
 =?us-ascii?Q?DX8lEJeTyQ/I38B2IRsCXfTZvZ8YXOmPYSX/fSlyv/x5a6aifIor9ttD7eRJ?=
 =?us-ascii?Q?OBdqTLk2qT3Z0BgoUGkZcPxfuD5bWo6iXEBoEPeGVxuJo0iS30Ozex1Kuk3B?=
 =?us-ascii?Q?wAvEs1EYFLWto3Y9vQNj3MUHrpdsJWIPU2qcbx7KtLEs5pwoWOZc1waAoV1J?=
 =?us-ascii?Q?j9mUv1SAtGkzbGNXSfMtZ4In6t8FuAhJjqqswe0APiZHE/Q15WqtbihYyMtg?=
 =?us-ascii?Q?BFm5ck/lW19U/SweXhT9kg0+4qzvvSZVc/Xv58aFEsEQp6aolzMJuD8ONG+R?=
 =?us-ascii?Q?QfS5KS1+8XmZPNKnioN4RfG/9+fHvVHMpys7LNpjUSwC1dZBLolEVDs5pZqx?=
 =?us-ascii?Q?ohBk5Hqu5ELne7isRxnmd+WFcFlH5RWNETiuNM+oc/BH6Q4qrHpQr+yQAYrZ?=
 =?us-ascii?Q?6OryUNSzbxxtepnHb++8SR5UdwG6IFz7iDOJF1h8LIQFjt/n2xPwd0BZ3O37?=
 =?us-ascii?Q?5GrVihmGOfrfjpEVp5flXCexjjv2uALux3HKmeqmJ0xw+3kSHMTQsaJDUbsP?=
 =?us-ascii?Q?vmlgrS/HuOSA2Z9I7jMHX72uKR0anvRhV2RVad6B3Q7w0qZ7W9oP1WrWfaba?=
 =?us-ascii?Q?5RLS2MmZJuuIAn7avdsjdlBoIo9T5F3F+nRKsGR0Qh+H2SEnxLU8NuN+s2Vh?=
 =?us-ascii?Q?aQvPW5RYChwjNOD7NMMHT1qa1FMSg5uovzw/LPJRjqPR2KV4npNzT6B4U/3L?=
 =?us-ascii?Q?pX8hEIOf5whRkyXrYxxiCZWqUs3DUL8ORrzZlj1cqkalxReYj02NBhYS79JM?=
 =?us-ascii?Q?Q0QpHWHUw+pTrbTqMS0JoiDzjy3F7OPwV0dzBxx/fYWC9LhXzSaX0AgkL/u9?=
 =?us-ascii?Q?Kp1yTDR0enogqHzvPpgIY+e7EPRqa86qkLclO4tVrS7KzUQpMy1mXQxc/ncZ?=
 =?us-ascii?Q?bo47id8BKzWa4ZxBFCGNUy802LPBUZMg9Y1j0EZwo4DA4p1F76LF3NDmGzVH?=
 =?us-ascii?Q?GPzId2TgLQ5X+AMbwVuPr+xuDaUYjcIcupJtIGSCzAI1H2Q2cJfMbW+UP9ud?=
 =?us-ascii?Q?sDk=3D?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-e4812.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0a84ba-3e1a-4de5-868e-08dcd3ddbe22
X-MS-Exchange-CrossTenant-AuthSource: DM4PR14MB7276.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 10:20:51.4438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR14MB6988

Change visibility to public of functions in error.rs:
from_err_ptr, from_errno, from_result and to_ptr. 
Additionally, remove dead_code annotations.

Link: https://github.com/Rust-for-Linux/linux/issues/1105
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Filipe Xavier <felipe_life@live.com>

---
 rust/kernel/error.rs | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 6f1587a2524e..d7965ded2973 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -95,7 +95,7 @@ impl Error {
     ///
     /// It is a bug to pass an out-of-range `errno`. `EINVAL` would
     /// be returned in such a case.
-    pub(crate) fn from_errno(errno: core::ffi::c_int) -> Error {
+    pub fn from_errno(errno: core::ffi::c_int) -> Error {
         if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
             // TODO: Make it a `WARN_ONCE` once available.
             crate::pr_warn!(
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

