Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486892ECEB9
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Jun 2025 20:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750970169; cv=fail; b=f0Go3s+FWpEJ6f0lP7LH6XSFVJ3VH7HyJi/W7ewgcfHYqXeQiev+WSnnP7VM3JKs+TQaK6nUJwmYb/9G/KtVNLPSVoW6yR8xCQRur4ZUsm4p4lMztdmXfnHMCWUQOdKn6/sC/4G7bSt3OeNL1XXAJUWUmbJUA5WEYIMoHR21plg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750970169; c=relaxed/simple;
	bh=yuZRe9czWyQAU/7kGtWd0MFY4rFjvD8Iqil0v5aVtzg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NHGtvwxl2CowWwox7hKYu/S0ocIQKjpAPB/qQb5aQUd+0swEE2C0grJzCrG8YzHaa8sjKImxNe2xubDJNyhoX6SDZZk/8ih27u76oIOErsusiLA8OCbmrTY8xr8igQi4h4GaXD95yOCSz9y/VIL8x1W/VNmSgiZhTOEFssLBq5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UwOnyngy; arc=fail smtp.client-ip=40.107.92.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UwOnyngy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUCdthGMVIMDlLW0Ov2VozJlJzbW+XBLODNWlpLjqIFUz2UuljVCE65ARibpurqPkT2r48BddTySzK/1CTz+aC9Z/uYilPCr83/vU/nmV5IJmCmABy4L+4+/uiqpPaESXYVzTrR9jilm8eG95H1o4Apll9LUKl3RPDCQR0z/H9t33rsEvBBMK6mJb8n3O+RAJPsM7HhxJQh3mdKghlTvjSrNJ2FKB79P3CW6zY4YlJgqNsvRalUrD8MaxinYSqxvrnAzzJol4aFF+gQi7hjzDxQ015uYLMvGUK1bhsPi9toOXeKW9JO7JuLrReeW8h5XO3hx6m2Zi22uAcJrM2BW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fErW3U2pq0vVohl0baS74undX9opU5l5Ih/maw+NGKo=;
 b=IoLRCPA7t+Y+SWsuKPFQ0AM4IXumnBeBEfQDX+u7pd6RUtuwtSSfpJX50SRjJ3E1bBK+ZAtHrq2uCI2qAlQIuXk2ElDzwpBBrjPCfV73lXyL8iVPxI9tbDoMbt8CPLfsEDFT6tROwXB3+iVZpx9R487vLJLKeUGvs5BKMPoep4Y8LHYQyoJeTxVJ0m8B9btoftQlV+YTUiu80DxE01ANotPTdjO7/mESf0aWfZByUw4KKOou4MpWpdpq1hoxrYBr9o2V5hmNCLFdD+DJLZ4AZdfdcbiEkZx8uuEQv/179+sHEKQfi5yUuRGl4XO4bdjWIoX8VRKTHUx5BqYkyjZ1Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fErW3U2pq0vVohl0baS74undX9opU5l5Ih/maw+NGKo=;
 b=UwOnyngyB3P1MR9mYRtzpEEVXWxwrDH32IGbFnikLt+8DPhHRdkx+sASRvbVGnRFwcPmnXn4oYSHE6k8uYrysZe6wZFAHu9ne1xYj+tMOeHalJMyjXVKzsBNXOZufM+147NoGBRfdAtxjy9U29M6em1D92i5ogMY9T0InYU89z9+VThcONfXfCq9rC0ABMYsl22sngr3SxJ6NH82Nq7C1ImTcxh1KdCvZvOtP5P1bMXajOJliG3NYs7vwM3ckFqun+/P8Soxqb1EXN2CeYPgOy43KXWZ1xlyIYnziPHv8vP/m5h4/TxGvVCq++TaQFAu7A7o3ZWzFB3gVZM/wg27RQ==
Received: from DS7PR03CA0005.namprd03.prod.outlook.com (2603:10b6:5:3b8::10)
 by CY3PR12MB9680.namprd12.prod.outlook.com (2603:10b6:930:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 20:36:04 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3b8:cafe::4d) by DS7PR03CA0005.outlook.office365.com
 (2603:10b6:5:3b8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Thu,
 26 Jun 2025 20:36:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 20:36:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 26 Jun
 2025 13:35:48 -0700
Received: from localhost.localdomain (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 26 Jun
 2025 13:35:47 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5] rust: introduce sfile macro for succinct code tracing
Date: Thu, 26 Jun 2025 15:35:35 -0500
Message-ID: <20250626203535.331219-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|CY3PR12MB9680:EE_
X-MS-Office365-Filtering-Correlation-Id: 9beb7c58-3a53-4342-ef94-08ddb4f1123e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x20hqgU5tewI30hXuDxocamorUvr6RAlqqMAucDl+LhY8SO9awNynP6m9pQq?=
 =?us-ascii?Q?w7ygvT8ySbXDYi2zIhNIZjty8CkpIzypQFxi6EQc1Q/Gq4tPNAjAONiOnMzB?=
 =?us-ascii?Q?CoLHrSqlnLL8RHB3k1SThyn+1biEvG1Y303LR6MJFMw4MCA+9/2C/weVW8+G?=
 =?us-ascii?Q?KJUX3Ubktle3W3HEIgwUYf27hQjwEWApSYrdrp92i5gRuAjiN8ZNCvs8PUeq?=
 =?us-ascii?Q?gxQWqWDgMDe0GBglzSPx+LsCWQruOnEYZOsfuZIl/2YTZDdCLjwryGE2x3HW?=
 =?us-ascii?Q?BxrimJp0IzNgNKDEqwJkw49+qm6XwLOb5mjsCcno/uMfljuHd2iUtPrTjIve?=
 =?us-ascii?Q?Mz9c2Kz8V2eczPQRkNvkmhMnyS+T0fdzb8VXLU02nmKWvYsAz5Buy/ahKnni?=
 =?us-ascii?Q?JdyCk/RA9AK4bYGRc3wOQNWFGombi7KxuRa1nzRqylaSj7ELOEpdTKyiYJaq?=
 =?us-ascii?Q?cwryVdVo57WbGs+TNHmKue3QUX5GU6NgU1lKMxSbqoHn/tVHHgDcdyes1Tft?=
 =?us-ascii?Q?eqFsVHoSkaJq4+vwy0lJvhrcnXwbxvmrQoCQhwvah5LVG9fAL5EmAKtp0R/J?=
 =?us-ascii?Q?xg86aBgCRaOMkEqXuk7S1bDxt39ZCLWJsGPOvN/xOXz/Iq6YLBkrnWv5HtT1?=
 =?us-ascii?Q?gjB4rhD8Eo/4KaL0V8C0a8HyNmuBGlrKXL76ai993g4/LoJYY1lEMmC1cAHc?=
 =?us-ascii?Q?mITnwySql/BAs2y8mdbyPy98baPZV4mlNpPdv+2I3EmQLzwdE4KIfw1EZg18?=
 =?us-ascii?Q?N3K+dxSsSNt33P6AnW55NfK9WNvLoNMfymxK6HXMEfUWZ8Fhu2+z9oZSGLGn?=
 =?us-ascii?Q?bv069lvDDBd9GZ0qOtsnMfJtfQw5EVHQgCgA+gQFF82FeGepbb2oxb22lyJ+?=
 =?us-ascii?Q?F9LXEDIOf6sdDZo4GEZjryG/AI+q7qG6SQKWqkUTMwFP1nCqwlMjChNrVHwQ?=
 =?us-ascii?Q?ko5pP3BR1dZiiZL/zrSH0xLxyz8LuM507kQC85807jy3p/G6naGoIbR/W9U4?=
 =?us-ascii?Q?yG0O4/YG6GLeJTwhMbMoeazHUU4YsdkOZQyhBAnItsJEp+LEYCCLB8nXgXL1?=
 =?us-ascii?Q?F6wpSGf5+/vzndyg6YmFVfIBBEfOzTW79FKd8Le1cYGWF9Q157rDeFlGdy3F?=
 =?us-ascii?Q?4TAmLfegh0jsNev6lSCPmN9Z+rqBg9EHlq+OBqWy4tsbrCIjhCgXpXHTi4OS?=
 =?us-ascii?Q?xfbGXtWwnZ+DCN8eOpq3TZptdiAmrFr4Pro5/sgtaUYFCMQMPdvYNCRSKcvc?=
 =?us-ascii?Q?66lnuPg9/BgwNjqQtzXWmWudV+JXMnwCWhRFa+z4tGV3VrYFlOBC15/mnlGK?=
 =?us-ascii?Q?zRbiPFlCcSlCaUJcytog2Kz45Z6VXV7qEcPvmNRmUxB660R6cBXbyc5bGNMA?=
 =?us-ascii?Q?jv9blpHmnT/r8rspwUCkrhB+AKmX2yGPJlJoav0o4K6o35HX6tUEUUAHHxfA?=
 =?us-ascii?Q?LtGZS0wZE9JOtBy4wZYLatIWG+j15Yslt1kpB6qHEK5pFZpncvevnA9bIh/c?=
 =?us-ascii?Q?OEEvLaOu4vLSL3/HOx3yphRiUMix2QuA+f6X?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 20:36:04.1730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9beb7c58-3a53-4342-ef94-08ddb4f1123e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9680

Introduce the sfile (short file) macro that returns the stem of
the current source file filename.

Rust provides a file!() macro that is similar to C's __FILE__ predefined
macro.  Unlike __FILE__, however, file!() returns a full path, which is
klunky when used for debug traces such as

	pr_info!("{}:{}\n", file!(), line!());

sfile!() can be used in situations instead, to provide a more compact
print.  For example, if file!() returns "rust/kernel/print.rs", sfile!()
returns just "print".

The macro avoids str::rfind() because currently, that function is not
const.  The compiler emits a call to memrchr, even when called on string
literals.  Instead, the macro implements its own versions of rfind(),
allowing the compiler to generate the slice at compile time.

The macro also uses some unsafe functions in order to avoid indexing
into a str, which is necessary to fully support const contexts.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/print.rs | 63 ++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs   | 28 ++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 9783d960a97a..40f1ff0342af 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -423,3 +423,66 @@ macro_rules! pr_cont (
         $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
     )
 );
+
+/// Returns just the base filename of the current file.
+///
+/// This differs from the built-in [`file!()`] macro, which returns the full
+/// path of the current file.
+///
+/// # Examples
+///
+/// Useful for succinct logging purposes.
+///
+/// ```
+/// # use kernel::sfile;
+/// // Output: `example:42`.
+/// pr_err!("{}:{}\n", sfile!(), line!());
+/// ```
+///
+/// The value is a constant expression, so it can be used in const
+/// contexts, e.g.:
+///
+/// ```
+/// # use kernel::sfile;
+/// // Contains: `example`.
+/// const SFILE: &'static str = sfile!();
+/// ```
+#[macro_export]
+macro_rules! sfile {
+    () => {{
+        const fn shortname() -> Option<&'static str> {
+            const FILE: &str = core::file!();
+
+            let start = ::kernel::str::rfind_const(FILE, '/').unwrap() + 1;
+            let end = ::kernel::str::rfind_const(FILE, '.').unwrap();
+
+            // Make sure that there actually is something to return.  This also
+            // covers a lot of corner cases, such as eliminating filenames that
+            // end in a slash (not possible) or don't have an extension,
+            // and making sure that `start` < `FILE.len()` and `end` - `start` > 0.
+            if end <= start {
+                return None;
+            }
+
+            // The following code is the equivalent of &FILE[start..start+len],
+            // except that it is allowed in const contexts.
+
+            let base_ptr: *const u8 = FILE.as_ptr();
+
+            // SAFETY: The above assertion ensures that `start` points to inside
+            // the string.
+            let p = unsafe { <*const ::core::primitive::u8>::add(base_ptr, start) };
+            // SAFETY: Based on all constraints on `start` and `end`, this slice
+            // will never extend beyond the string.
+            let p = unsafe { core::slice::from_raw_parts(p, end - start) };
+            // SAFETY: We know that the slice is valid UTF-8, because we checked
+            // that `FILE` is ASCII (via `is_ascii()` above).
+            match core::str::from_utf8(p) {
+                Ok(slice) => Some(slice),
+                Err(_) => None,
+            }
+        }
+
+        shortname().unwrap()
+    }};
+}
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index a927db8e079c..d74b94a406c4 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -936,3 +936,31 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 macro_rules! fmt {
     ($($f:tt)*) => ( ::core::format_args!($($f)*) )
 }
+
+/// Returns the index of the last occurrence of `needle` in `haystack`, or [`None`].
+///
+/// Similar to [`str::rfind()`], except this one is const.  It also only supports
+/// ASCII strings.
+///
+/// # Examples
+///
+/// ```
+/// # use ::kernel::str::rfind_const;
+/// let l = rfind_const("when will then be now?", 'l');
+/// assert!(l == Some(8));
+///
+/// let q = rfind_const("when will then be now?", 'q');
+/// assert!(q == None);
+/// ```
+#[inline]
+pub const fn rfind_const(haystack: &str, needle: char) -> Option<usize> {
+    let haystack = haystack.as_bytes();
+    let mut i = haystack.len();
+    while i > 0 {
+        i -= 1;
+        if haystack[i] == needle as u8 {
+            return Some(i);
+        }
+    }
+    None
+}

base-commit: c4dce0c094a89b1bc8fde1163342bd6fe29c0370
-- 
2.48.1

