Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CEF289E29
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 19:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750102548; cv=fail; b=kDWlSsL7eS2NyxCVdhz0JEUMufEROXfEDf70fbwxAgjKzOa6nHVl7vSpgP1RHF0sYh9juooTYBo9G/eIeDND928L6Th2mH3Iz7KS8odNactrOECNsm9m0tI/hxmoYNsD/v0vlqs+UIYfAxEQ+AZfYLdZHuoo/wR9NoYFhuiq5Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750102548; c=relaxed/simple;
	bh=6MkQsxVAqYorfMl3g7vQ60oEMFmnvyu/seA+7QenwUk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LHrXrpByzhYZFHcaSOi37GVozXrpffDDOtr3yF5zcm+Fz6bZxHExP5zKG+2SvsUH5bJBheoUX5gFSk+NbBSlRIwORrKDGjW/+AESKLgapG89h2F6bkV5EhKLn0hExq4mDalh16FC2TPBpp8nEDeZ6j0sR1AOrF7DL6hvs+//+gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=idtp8wHK; arc=fail smtp.client-ip=40.107.243.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="idtp8wHK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsXqczMg6hOW4k9IARRoA2q8PungpAkf6/n3vOWfxbtwcMzBVJo0OXIuVQBxTOD6fhzxg7OjLzT29csqswRAZOpvzuVfUeq3poZn6SeQvTbuUnZGW397BBN/q807jzdz6PErBrw0TFlCiDXxR2qt6Lm4n5hSf+I0q/IzHWZAoFX4eJFD2gaZFGBtzkWYXSW9doKGKeOcXe9es7VoMQQ+EnWm9kfZKdrRdbsMQboOARJ5kMsYPHnO55EyD0RDyVy9eh18G39dMzPpgY5UcLbCgSxPeYxtKwNtZjnBhLsrsIxItRBvapv2nNGyGqu/Tt1iSaiSKw0zmtEfMqhSCmYIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3vOjH1TTwopLXhceXUADYAr2udLIEB2Gvl++BC5HgM=;
 b=MBchzt3t951J4OC0RY0yqQh0/I4NQOioIDc3Pye3Oj1oCK03pCHRf4oMKreNDwV68TyWouu6vqsDT5lXIVYIxUgFo4WWomNZ4T+BaUjFPoz/SQBnqiaKsuxenJ9OlHDGWdBbdYEYJz0a6qdSm5RF+GGDJ4kHi3NW97HqJLlupZ/EsgzfWJ4OYeP6FWFQ3tgswdlufKE9kzTG3yOxITWE2+0hjKy8dlI5lbFW91QZtGiwVERrzAr1PSF0j82TL9S15Yc7vjdM4f0CI3k0tVJwysAPU/SkFjVVwpJdiGASH4cWohGjugt9MZynFkmY59jsksTl3x+ZaO6MRnP2945W+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3vOjH1TTwopLXhceXUADYAr2udLIEB2Gvl++BC5HgM=;
 b=idtp8wHKzCbYwp8UnK5Oe5hhbBX8oAeZKjq5M4ql56NvRVbq64uFvjp1gWt3kbq3zXBRvc4ZcHF6ur3aKGp1QNmYga61NACbE1Ql5gf9aBX2TbAYPy7ki9xyDUq29WSWzvBodtMeoD/0v0rpunRKdr/PaJs8YqbsO+zwM9lfLLu9ThhORWFszx7c5hn8JU99KsQ1U0NZarAHrOa1wgM1ehD4G6n9Gz0Kim/6B0H39MW0FBD9h2usWkAcD+r/2I71j/mTTlybeAePl/f3QbHztiMFkYgh6FQ8/XB10HPowodyEu5l/hG6jhA0v5N/JGRyeUl2eLQgRkGj57JmgbaDkQ==
Received: from BYAPR07CA0026.namprd07.prod.outlook.com (2603:10b6:a02:bc::39)
 by MW5PR12MB5621.namprd12.prod.outlook.com (2603:10b6:303:193::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 19:35:40 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a02:bc:cafe::6f) by BYAPR07CA0026.outlook.office365.com
 (2603:10b6:a02:bc::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Mon,
 16 Jun 2025 19:35:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.0 via Frontend Transport; Mon, 16 Jun 2025 19:35:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 16 Jun
 2025 12:35:23 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 16 Jun
 2025 12:35:22 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4] rust: introduce sfile macro for succinct code tracing
Date: Mon, 16 Jun 2025 14:34:33 -0500
Message-ID: <20250616193433.2643407-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|MW5PR12MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 2406b0ef-248a-4feb-a0ac-08ddad0cf9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ozPCHAjO3cigvDfr7uGs0JW5bSNzY5M3evSoYo8ailWsM2DHOe6Hpp9m6hSr?=
 =?us-ascii?Q?eDGpdA2/BvvojyhYgj5TJHwxggzpMlGotTGUnN7bYXT4/yudn3njGHvW8ax1?=
 =?us-ascii?Q?9NWMWYi02W29X1SHWhsYldEkc3icmfvZ4XnMSF2z/VhESe9cxaW+F06imBnE?=
 =?us-ascii?Q?yiyVk8aLRYWgDp/N3+tqque1iMLT7xH5LWhPn9Y0PJf7JGkDz+Bi7A+ERjtu?=
 =?us-ascii?Q?fNX7WrnDHq015J5jcnAWDn29d13J6bwZWlJHTlE0fXJQxBjsRFpUThRkYZGx?=
 =?us-ascii?Q?1fOb9/zX9CVDDqTxJFxr8czktdGZCB1rYPTcgnpwob8LXpEpOEhIRL7Acz/b?=
 =?us-ascii?Q?Ggw2z6+oOzn46uP/eI2sP4YNNn9WYG+rFPGWhukDkZvsYoNe+/3G6hCo5S6q?=
 =?us-ascii?Q?zNcHcAVVolmPx9acz4fw+oNU5zJFmXvMkd7IX3JeVyIYuHhv2A7PlyC7oWyK?=
 =?us-ascii?Q?BLIYbPmkKJyhV55ZVGBDg4cIhXszipjWJZrK7YIcavFsTghZWmAuZxK6ULOP?=
 =?us-ascii?Q?izsP8IgpW5YzVfN8yoy4yHwX1ya34EIFFpw5hzvsw4irLHgJhTAepwM9okm1?=
 =?us-ascii?Q?c6FEEopyoM4A01oRM1S29GFsDc0AmXd3mG4+lgvs9Y/sGCVDpCikT//EaxHI?=
 =?us-ascii?Q?vgoHVSbtQswkISbLWa8FOhkd5/67PWxQ09blUgt2ibw4ro9/xXtY26AjzlYj?=
 =?us-ascii?Q?YU02ObWPwSp9bL5XlqdbQzbTvXPcjTRQ0myD3Bdl3l+js9xSh9Sd9Gw7rR2p?=
 =?us-ascii?Q?tj0vCvsQI5XCVpKk/Uu5VuByBeRzWh3z4r/wTtT+Vdxfeh1HKjJeuYefdmTP?=
 =?us-ascii?Q?OmfJpb78+EFYNm5XHSVT8SxutehhVMsFgvJKdTyUT2IYgCPYx0CNROLfw5bb?=
 =?us-ascii?Q?zJvL3ziyc3mJAG+Wt8pBOWjKFRt6JNpG5e1wY7ueV0q3VXmAo7MrYbLdXfOL?=
 =?us-ascii?Q?HyCbzcTvZwNa8faxcMQ1VkmQGfezXOZtDaSjlRdIw5jw6FIFvnhjD6pGammG?=
 =?us-ascii?Q?3XZUfz7ohAuaj/TO5IDpatcRErALIXGMIxvKCk/6r4AAvA+ncgdLSUyPc+W3?=
 =?us-ascii?Q?+NNg8vYTOwb7NeQmsF3K9Ep9VF8+dw4tZap4uCcT5aPq/og3uOPLyvK4+NEM?=
 =?us-ascii?Q?iUpHAJR9aWUqQNP9FutWYWPGmKydBYntRrwigQTvTu64L+1JqvJGbSf9ye8I?=
 =?us-ascii?Q?QchhWs4LyZv1/bawjOIRUj4En0FDwFjgMMgsDjAohyAMhxbaxQGS5BfTFQdi?=
 =?us-ascii?Q?7p8Viy1jQ2ovTC50AYLaPrAfgJg6pZhYzKsQ9Un1cU2Q+dJOjlWLwaqlyD/Q?=
 =?us-ascii?Q?02S+bAOwM9top7t7Jw/rOg7vYP7MbkDILGBghscdB7AiLz5vNQM14/FVCDUo?=
 =?us-ascii?Q?JWRlguD+2y3BYbGdYGOIllwCCXTH/WdWWMmTSg4c2FZ428IF/KqC6eldYeZS?=
 =?us-ascii?Q?8kdLmwl85uMtgiL1j6Xla2W62dJ/E6UlDEr4MW3N87EU2E7Rj9fUu3h8SDPq?=
 =?us-ascii?Q?8/MwKfLipvbfw4y9LrYf/o1rnQh2vbZ95rzd?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:35:40.0368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2406b0ef-248a-4feb-a0ac-08ddad0cf9fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5621

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
 rust/kernel/print.rs | 57 ++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs   | 25 +++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 9783d960a97a..992f8c7f6a7b 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -423,3 +423,60 @@ macro_rules! pr_cont (
         $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
     )
 );
+
+/// Returns just the base filename of the current file.
+///
+/// This differs from the built-in [`file!()`] macro, which returns the full
+/// path of the current file.
+///
+/// Useful for succinct logging purposes.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sfile;
+/// pr_err!("{}:{}\n", sfile!(), line!());
+/// const SFILE: &'static str = sfile!();
+/// ```
+#[macro_export]
+macro_rules! sfile {
+    () => {{
+        const {
+            const FILE: &str = core::file!();
+
+            // [`.as_bytes()`] does not support non-ASCII filenames
+            assert!(::core::primitive::str::is_ascii(FILE));
+
+            let start = match ::kernel::str::rfind_const(FILE, '/') {
+                Some(slash) => slash + 1,
+                None => 0,
+            };
+            let end = match ::kernel::str::rfind_const(FILE, '.') {
+                Some(dot) => dot,
+                None => FILE.len(),
+            };
+
+            // Make sure that there actually is something to return.  This also
+            // covers a lot of corner cases, such as eliminating filenames that
+            // end in a slash (not possible) or don't have an extension,
+            // and making sure that `start` < `FILE.len()` and `end` - `start` > 0.
+            assert!(start < end);
+
+            // The following code the equivalent of &FILE[start..start+len],
+            // except that it allows for const contexts.  For example,
+            //   const SFILE: &'static str = sfile!();
+
+            let base_ptr: *const u8 = FILE.as_ptr();
+
+            // SAFETY: The above assertion ensures that `start` points to inside
+            // the string.
+            let ptr: *const u8 = unsafe { base_ptr.add(start) };
+            // SAFETY: Based on all constraints on `start` and `end`, this slice
+            // will never extend beyond the string.
+            let slice = unsafe { core::slice::from_raw_parts(ptr, end - start) };
+            // SAFETY: We know that the slice is valid UTF-8, because we checked
+            // that FILE is ASCII (via is_ascii() above).
+            unsafe { core::str::from_utf8_unchecked(slice) }
+        }
+    }};
+}
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index a927db8e079c..3e4eb7a62871 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -936,3 +936,28 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 macro_rules! fmt {
     ($($f:tt)*) => ( ::core::format_args!($($f)*) )
 }
+
+/// Returns the index of the last occurrence of `needle` in `haystack`, or None.
+///
+/// Similar to [`str::rfind()`], except this one is const.  It also only supports
+/// ASCII strings.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::print::rfind_const;
+/// let l = rfind_const("when will then be now?", 'l');
+/// assert!(l == Some(8));
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

base-commit: 27605c8c0f69e319df156b471974e4e223035378
-- 
2.43.0

