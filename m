Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11olkn2035.outbound.protection.outlook.com [40.92.19.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582E636B0D
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Sep 2024 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.19.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725809167; cv=fail; b=YHeSSxjpnTccQ2lY5z8Bw2mDvzLKa15ycYEuYG9+pJwP8JYwrnBupWUcAWWzGpxVSz6/2RtxTyaqj/x4DoBV0wZDZKhKWM2kQNlYRTcoa1PEktFy9eNTeNFNc+7D1Gtpufv/jZ49lKqLgpB1ulxrpfGcZtDr8rAOG4/A+hByGxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725809167; c=relaxed/simple;
	bh=q1TDUAw5STU0aTJ6ECockCNXekn/RI0PPNZqcPJvbrg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WocL+Oq1dCCO8vsvY0RsIWQwbZDrlLtlLELHsQxlVfalYmcEEPyYz3wMC3wwvNoYhGsCfhx1LRpzrYdbqYCjhFx1db1d87SJFT1KrQFKacEota5fz98VjnvogEl5TPvEDIDV8uazJM3OvgGWgeElP+4I1zoP9UnQonqi+O6mq5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=TG/aiawg; arc=fail smtp.client-ip=40.92.19.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="TG/aiawg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POvYm7GMJRO32+SVqp716yQQjXKzgTH3GqPCkAnjqa5nJ/gBka7jps1TOjCdBMC4DHwecQaecTyzErzldnYVPB/0fkFXmqkmTrs1uuJp4yoJ5fXaG286Jc/ore90M1sSjbTmuv5a07tJRhHoNPCfM9aQuet6vtM9NHZQUVvYpzzzLQrwNYICXwJPbCxOAObQwYP4fDLm2obEf9+C5JPEK9044dEFrMaj4x5mSWz1cOxIR0+j1LItPrUrK9hVlfhYzQAYK0Uudn8iLULkYvpsSZRx4FtRMkxYIPSkEZRcx2ZW3DVU4PnfMr5AiNDU+3DMxtY3KWEJyNiy1jw/rWMLVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56h2VfpiZE2ZyRpiaDdYxDjNv0YeygKbleKtawfL4ZM=;
 b=FqIsAfdmJkSqQL9EhH2gS4emsw4JDhIpBa+u/a3zBmIuqAbjoXnFRDqZsPi3Ady6vBIMX73QfKsgYbocpGYC4mt1GnPD7zdowLqLbpd5xMSGZpErl48jlAs8/0/mDXC2/jjO08CVjtvvHkrAA9TAmRFwiWvlU2s+6Y15oCrZhdtyEB60ZOrZMd6z8O0J33StB+CeULlClJMBs5qLAckp0ypr2x+/HARrwL00bf+7qQbT+AxLORg8XO7ApdAIZmcjQSO5FC7u04Uw1E9g3gCDGmmNc20G6ylea2LoXMZP9rkf25d+Ak8KZnJ5vy5BMQJimA2js3vVy6WYQGjatWxKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56h2VfpiZE2ZyRpiaDdYxDjNv0YeygKbleKtawfL4ZM=;
 b=TG/aiawg0cMAjnZu3AzUvojUvsxJd2/L0PzyCIPIrt6s6yiagMYEEjm3/Ac1wxfvXyM57mW8YxnlkGfWbbqM7W/SWrMIe5E4b1hQHvRTByiAcdch67tp1TO9kePTvVhtpAXAyt9fMGQ5jCWzb4TA3HB84BzPvLn1sZ8ui1+YcwWI8rsq90baSHy2hGNKOvfpls2BAS47H9/MT9coJBU2oRMxHfC3+EDrz+TLO3OTcndtr5ViumlZO8qdLA/XEiMbl35pyrC0Z5Qhe4tQlJnwulIAggyG8qswWFbwhRIm3nN9b7vil2zqjIwBtA6qLb9abwzx+rL2LI8r/QX24xUF7w==
Received: from DM4PR14MB7276.namprd14.prod.outlook.com (2603:10b6:8:186::13)
 by PH7PR14MB5848.namprd14.prod.outlook.com (2603:10b6:510:1b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.21; Sun, 8 Sep
 2024 15:26:03 +0000
Received: from DM4PR14MB7276.namprd14.prod.outlook.com
 ([fe80::744f:71ea:aec:9c4d]) by DM4PR14MB7276.namprd14.prod.outlook.com
 ([fe80::744f:71ea:aec:9c4d%4]) with mapi id 15.20.7918.024; Sun, 8 Sep 2024
 15:26:03 +0000
From: Filipe Xavier <felipe_life@live.com>
To: aliceryhl@google.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	Filipe Xavier <felipe_life@live.com>
Subject: [PATCH] rust: error.rs: Remove dead_code marker and make from_err_ptr, from_result and to_ptr public
Date: Sun,  8 Sep 2024 12:24:57 -0300
Message-ID:
 <DM4PR14MB72767619350CA0C447D9A965E9982@DM4PR14MB7276.namprd14.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [E/bKafub5U1sPFAZ4obT3tjdEf9VyKDwZGX//bN0OG7W7/S/eb4jJZTHHEtF8e+w]
X-ClientProxiedBy: CP5P284CA0178.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:226::16) To DM4PR14MB7276.namprd14.prod.outlook.com
 (2603:10b6:8:186::13)
X-Microsoft-Original-Message-ID:
 <20240908152457.405888-1-felipe_life@live.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR14MB7276:EE_|PH7PR14MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 467eae7f-165f-4b07-b508-08dcd01a8cba
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|15080799006|461199028|5072599009|8060799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	DTdWVs+4PceBBpsAXWH+Ro3isTYuujwwzHgUXP2ZScfM3YXASFpqxoaugqeTLbxQMYaNewrqKiMHC+XfhsUc8vUAltV7i4Q9/R09bNhwqGXfthrqN/CyXkpo/OKVXXLxNb6xLBDX2u9npiA3pOqaMDt5xUic9RQ1dseZBBIGE2gzizPqMojYcN8xy5z7c2yflmPXcKcgpcgz7Lp8cQjv/RwUaEqtK/HsGyT5g9O79/GOpvqam16wxeDZAYTEVqjEU5q9naro/xeYxlR//2QKrwEFOKJ12puA/IhmhHnneimALTvlybqiBzj+rxwzhNPY3Sqvdw/ETpBe+gJe3UpIdJzAZzO4hKnQDb1n1EoUmt/VyscHryGMJDZIADJ8xKhK+rc/sRnjqoLvLrIcdgIQZSnZqUlf1zrMLw2QQA76aL2pIQ3PagXtKOP9espsZjYHmeOS/TV0L/zBkfWPNieLvyRERDXjSb7nz603splVlq4IxTUw8WC0AimaQIRChXD9Tpo0sUnVDUtGwieBFyPezx2NwcUcZzKOL5QdLkfEQPArfwiaf8CR3NR8uUzk7Het0gVLVoneWP26B0vIlTUgsD69d7rxafkWDiTYcfEMIggbzvZkGVw+SI6WGpsjBEjYhEnybwJn0rO8QySU3qZ9mVes1Lh6pfEBx4fML+tVQiZgxg9KImQuRKKRHbE+Fz1hoVQa1JY7Afrfty9m2IswBcyQ8PXadlZXZES0yYAHhDE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u6v+iuSwx0JoTTF3NgVjo4avtO49/Qu3tG7oWi1Qmkw+SGFstVNEtUX4LvQx?=
 =?us-ascii?Q?IgYs3fY13zjjcTfZnh6+oMRKJ548VpxzNSShFDmiCW0dmI9oUjhe4Ispxl8M?=
 =?us-ascii?Q?0pOjszCHrVPBU8DHk6uVYVPxN8TwVyZcXteanJzAyHacZiWrdTaH0uEk42Nh?=
 =?us-ascii?Q?RqQLKIkbH1xpFF+FHzJsvM89On2mHG4JhUCQPZlumf+Kz4ppCByv3ywjhiNd?=
 =?us-ascii?Q?DgrpSUL15E/lBa9oPaLio/aZPz1iO0lL50Rv1eToLEfTYxQIYShwHlKOJs/M?=
 =?us-ascii?Q?EoHE7Odw/qHYS4eH67s3rS3YH3C8XW/AnjwsmiC0yOan14REq8zpZTr5EIau?=
 =?us-ascii?Q?ug8gE+AetO45+9QFNq+IoFlezNSuYUjWOkSU/Kb5Q/NugGNZGeb9bozQUxDG?=
 =?us-ascii?Q?xNcAKc/RIS/ptRaEHx7+VvM1aXr4hVQMFBcLJinLx0iXnSie++8nqGwASY8v?=
 =?us-ascii?Q?ZnE7rscKtOzwRFQo/6BjkZFCKbJJWZzhWMnHWQiF8qLZY3vF6Wk8L2n5QbL9?=
 =?us-ascii?Q?R/bz5spY2C1ZC4EVtdEnekVBBrvwSVP6kSBujuTQSxl4lqYT6Q5DRtmr/GZf?=
 =?us-ascii?Q?wCjqH83NNGxlrYqnGtc2lp6WyFI4XjLWB31UXKspio/iUZ3JceuY+KTSfNPO?=
 =?us-ascii?Q?T5eD/r6sYXnozF99dazPka06YYg8i2f9aCwdmWPLbjTxNUsfRiX83bYBVcds?=
 =?us-ascii?Q?Q2XKai1yvVDBGzO7Gnk/89YLGAN7x6PpnQnAsdJm3672VxG2AdX7h5D6vkPE?=
 =?us-ascii?Q?uavEPdzguKGPOrmgssG0H0YXUTkfHQIFOEZ506L/ECC3Zg7jd+wAfBA1tWd9?=
 =?us-ascii?Q?205pBfgeN4mM7JtFnRMYC2z5cAORZiIb5i0ozoiKT5FEPQPitUcme941d1au?=
 =?us-ascii?Q?O22EK0bPZHeTVPH75Idh4kqCBiugimYvPNaKKhiFVFh/5LVKiRIPPZ/MOAuG?=
 =?us-ascii?Q?+5TLizdZ8EcqA8fatEZB3n51Zz4DNwHNckwH16s3RZE+x2ypN+8WjlSzVR5A?=
 =?us-ascii?Q?H1YpHvzSTT8hf0b2U1KWzrw4WJ2sUJPjHqqShRN+OGmvPn8p+aCmJxrDIY40?=
 =?us-ascii?Q?WGABoH41/uLL1iIxespKq/pp0d4igHvIiNEXOJbqbMt6Y9K/ke9HBsI1N8Ix?=
 =?us-ascii?Q?gO+CFT+EdzmIJhsnhvWBlPP+fBMeePDnQFSKCZcHoQMgbY0d6rPPxGpqA+Ri?=
 =?us-ascii?Q?in/7CqqO5tulJwGJku/tLoQxeUSKkUiVfbNepoz32Tn4ze6aNvT3cwzrGxWI?=
 =?us-ascii?Q?yIPxRKVssbm5zDPa9ncPrgpZ9mfSPItW0EhyMwTfS+QsICrMMNtogPMhrELo?=
 =?us-ascii?Q?sTI=3D?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-e4812.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 467eae7f-165f-4b07-b508-08dcd01a8cba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR14MB7276.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:26:03.0500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR14MB5848

Remove dead_code annotation from from_err_ptr, from_result and to_ptr functions in error.rs file and change visibility to public, making it accessible outside the kernel crate(issue #1105).

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

