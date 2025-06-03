Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264F418C03F
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Jun 2025 19:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748980505; cv=fail; b=U0Ve7BU4LRqVpK3bqusFkeiiBoruEhFoQjMac4W+0nP8RsmFkW4BVuLfpYWEw7R2qp7hoO5uEFk/lRdzfUW8iehIIhkNw0v5UXmGcBQwi6k7Rx0su4HXX6BYQm66mVqnuYWGEj0xbr1bzbK2kl14YfS3dBYm1DHw31NuYSu4KzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748980505; c=relaxed/simple;
	bh=PQnhtPCu6awUs1gS+++IL3gjhFL80WQ+oqBpwG9ZPww=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fz1zuVFHncn/KmDnBgkhI1rQymPQ5xgVIEcqGaI+Sv/p/JXTPMGGYiJRAxYUy/xSVzmldIKsiRhhPFeYhAhM3iE74JW2mKU4XreU7SxwDo/h41DYKGg72ZxSraS/B50F3JLf6ZsnLU+bYcFSinKhRR4kzy8SxFPHMbpclPRRDFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qx3a+y+N; arc=fail smtp.client-ip=40.107.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qx3a+y+N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHfzAdvNZgo5OLgO3mMMMcr7S0Opplbgn2nP7kC3E6j3a/UrWOBOV62i5wEvOgWtL69ajBX4zv3y8cs/+fhiVmGhVBWroQaahWJCmyWZeswWuTPoE74emmzAzSw5+gaEBtn6/pS9mK0IK9WfdOR++Hgzm2F2JY2igDcspX3U5daLrqsbUb8Yjcx5Ajg7FjAy5fDxG3F3Jf6L4WWR1VFzZD+p3OK/9V+QSvUx4fH7ZdBYnqvM5lmXcRLZ3zIdUWYSRlvyA2zKyPONfV5Fn35y1HQOHMN4opk43hhMhZxw6JqUr7zwaf6wtCPe3o7xJhI5FsumfnQmhYD1yIMJZSn1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgwTtzyZ+PvcUeFvXU3aa+oesFh35fdQ2YvbQoAnx6A=;
 b=irPBIX2BCIKVFhuUDw8WaRxNo41WPIL/Jw2BL/uB19YsfVNXR0sfvE6GCuGziIKhocp1NwK//FiPfaXVW/L+Z3evO4ewppjZ5YwUJwiCiHKe7ZvcYC5KVYDHPS2lBeDArK9AINV6/ZIIxnqyir6wAGF3j4lBmM7/UBTuryOdvu1AWaFNQj+0zzf1qfpWQLzLSJ4A4I9jVDcydpqk/BNDOSTRnDb4sui9vJK7kxKvBBwVba7EUR51pGuScl3Xd54wlAvwtOkNofZ136XlCkfcQKO+W8AMK96Sy5N2yPC/7JUJEtfkfiKirhG6+oCavdAb7zJTufCXtTTq6RugNfZJIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgwTtzyZ+PvcUeFvXU3aa+oesFh35fdQ2YvbQoAnx6A=;
 b=qx3a+y+NYjDrcMETOHmpXCYbb0dK7wXbaEbANFrcmwpUnizS9bemcw5hwgMsqwM8jnkHaARfH3eFKqeKDipenQKtOR7mk0pDOUZbpfdyTpWClfXtUF45nlp/HldqKLODFA1tTqa0kzmifCL/KEg2pll2YMlgcXUldp75zVdsBWCNSv9SCiAke6y2XSVhd/W2iA+dGpD9X51LFcmT/dCN4AcXOQIUF7URDhybQtx26ZD4cD3QSwMuPbiStzRGCVIlMJHbvKEoQyXtaL5+7IWTFUQZQ1zHSBaCYNQgxJ8RRroOkmM4fS4gQjQFAZZLxxQlfYCsq1+7tW2yo/4pn45C2A==
Received: from SN7PR04CA0059.namprd04.prod.outlook.com (2603:10b6:806:120::34)
 by IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 19:55:00 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:120:cafe::2b) by SN7PR04CA0059.outlook.office365.com
 (2603:10b6:806:120::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 3 Jun 2025 19:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 19:55:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 3 Jun 2025
 12:54:43 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 3 Jun
 2025 12:54:42 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, <lossin@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH] [v2] rust: introduce sfile macro for succinct code tracing
Date: Tue, 3 Jun 2025 14:54:26 -0500
Message-ID: <20250603195426.2360773-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f70f0e-519b-4b77-2bf6-08dda2d8865f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zmW1AdmwqPJff3xEfThUTvtlhIfJxXt1NGDdPedJErUJNqJPnvDh/hN/Us9V?=
 =?us-ascii?Q?lR8gc3LmoPAr9/qAc/4u0Ju1EAX1VlEr40mS/26cDqLnCaq8mdiKHMdAUXaS?=
 =?us-ascii?Q?TQ8p4nhb3J+G9ZX+AEhsVVc38DN052tn98DouIazmD3ST+RmTffr1ixV60UB?=
 =?us-ascii?Q?8OeisuJ3JA+pCLNb9dKfAs1W0AhJGftBfJmtkVktzBcWu8WhSyaAw//9Jdcs?=
 =?us-ascii?Q?JnbdPurIDMZQysiJUB/0iExBnHyGzdwMkJXlxvOe2hGwh23LKSBHbO7X3aCs?=
 =?us-ascii?Q?Clm84XIu1pYpO/gwjMkem9YqsJE510ouSFZnNeLw0PKtOJ74ggScegEj/rwi?=
 =?us-ascii?Q?dymRYk9MxJ6LlQYlcuuqyBX0pqsq2LR+9DmwuWaKnMj4w9/lWwJZHKDBQVKi?=
 =?us-ascii?Q?Vvj6R6sdH+NVpB01GBl3fknfCAguCvmsvH02QlIHaFWoygaAam0PN3k0E5UX?=
 =?us-ascii?Q?8HIZTv9wrtQpUCPG98MUSVSZ6EnPU0vo6g37vqu4EIiupSuSrb9CGykvHf3k?=
 =?us-ascii?Q?cELp8kL7U9WlTbrv3Bd2QnT9bt+bJOGW7Mn5vAZkmAtICjGfo2zO3ZnDTt4V?=
 =?us-ascii?Q?ENxU2t9tut4wZ0fOIogr7+vODlp6u02tZkWZBaNvF8S7PI+69+NA/sb843SH?=
 =?us-ascii?Q?MkDiBBCncIm0yKA7IQy/AYIPh3ntqrIiCI6V1ewgn1f4PFmkTdrIwwgWrfhP?=
 =?us-ascii?Q?Nqh9V04ejCgHToqlSvhTYlMF2iBI0sy/CqgzTnsfbEhjgZa/rHVP7YvyhgGE?=
 =?us-ascii?Q?PddeJ5m8BG+iRp1uNHdJeNdG5As460xd2tYV3YBqyhKUs7TBJX1gBOfjshML?=
 =?us-ascii?Q?StdT2tiSJ73M+YtWgBQTje7LoCte54F9d3bnW0qEb+UrExZzte1pPDDEV6Ws?=
 =?us-ascii?Q?G9tQwLKl6b/bF0/dUL8R7Mv3TLm4w++c58wTAHY0B79lll3fJO8e8yu/C1OW?=
 =?us-ascii?Q?ZT5z7ltnBEvpu27hxFU4hpu7em541Mhct8qzCyJmUyJxDCCMOsYQrl3M4/cW?=
 =?us-ascii?Q?52ms1e9qu2Zr8AWMAKQxsubTisFsKw68gzgwDis0UhY2Ja1Cd4hREZxXk34w?=
 =?us-ascii?Q?GKlmMrPam8N4YBNZ9T+H1N3EpREkQVLTO4ZQiMIQ9fZqtOeYr9ZCX51wNvUd?=
 =?us-ascii?Q?mYMsDHEU9yJvcUQx0hJ2JuE09BM9eiAKplmblPaGZyAurm3J78BCB8pCxw9R?=
 =?us-ascii?Q?bLem0bZJ5uc+pWjTsPtVLQeUlyUkM7C+I5KvaTMI8oQzN4PxX6eWXaao88M3?=
 =?us-ascii?Q?dBAfTJhcBRSgrq8pWXO8Rn/SMTmj7mjEM03V622IEJnC9VCgw01p1Pjwm9ef?=
 =?us-ascii?Q?pwsFEfje2Plkg+98vVo3NkwojB3Aq1UwFP/iP8z66PU9+8p5HWOcAuGF7jhG?=
 =?us-ascii?Q?Ll62IaSQ0gexarheWd1FCvKZGuQyWbcb/isD1Ui1JwZyjjtPx/AbQ4oP7LE1?=
 =?us-ascii?Q?fwlBr+o0xIGe4CF6bA8rSQ0Poo12H6GPhbtYpmi1D8gguc7Fn6/QY0snL+Dy?=
 =?us-ascii?Q?aphSlpWGEylnl2aWnD/22fikhrL09x7UM81p?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:55:00.5861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f70f0e-519b-4b77-2bf6-08dda2d8865f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030

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
into a str, which apparently is not completely a const operation.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/print.rs | 63 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index cf4714242e14..1fd1497af887 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -414,3 +414,66 @@ macro_rules! pr_cont (
         $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
     )
 );
+
+/// Returns just the base filename of the current file.  This differs from the
+/// built-in file!() macro, which returns the full path of the current file.
+/// Using the base filename gives you more succinct logging prints.
+///
+/// # Examples
+///
+/// ```
+/// pr_err!("{}:{}\n", sfile!(), line!());
+/// ```
+#[macro_export]
+macro_rules! sfile {
+    () => {{
+        const FILE: &str = file!();
+        assert!(FILE.is_ascii()); // .as_bytes() does not support non-ascii filenames
+
+        // Return the index of the last occurrence of `needle` in `haystack`,
+        // or zero if not found.  We can't use rfind() because it's not const (yet).
+        // Avoiding rfind() allows this macro to be evaluated at compile time.
+        const fn find_last_or_zero(haystack: &str, needle: char) -> usize {
+            let bytes = haystack.as_bytes();
+            let mut i = haystack.len();
+            while i > 0 {
+                i -= 1;
+                if bytes[i] == needle as u8 {
+                    return i;
+                }
+            }
+            0
+        }
+
+        // Return the index of the last occurrence of `needle` in `haystack`,
+        // or the length of the string if not found.
+        const fn find_last_or_len(haystack: &str, needle: char) -> usize {
+            let len = haystack.len();
+            let bytes = haystack.as_bytes();
+            let mut i = len;
+            while i > 0 {
+                i -= 1;
+                if bytes[i] == needle as u8 {
+                    return i;
+                }
+            }
+            len
+        }
+        let start = find_last_or_zero(FILE, '/') + 1;
+        let end = find_last_or_len(FILE, '.');
+
+        // We use these unsafe functions because apparently indexing into
+        // a string using normal Rust methods is not completely const operation.
+
+        let base_ptr: *const u8 = FILE.as_ptr();
+        // SAFETY: We know that `start` is <= the length of FILE, because FILE
+        // never ends in a slash.
+        let ptr: *const u8 = unsafe { base_ptr.add(start) };
+        // SAFETY: We also know that `end` < the length of FILE.
+        // If `end` < `start`, this will generate a compiler error.
+        let slice = unsafe { core::slice::from_raw_parts(ptr, end - start) };
+        // SAFETY: We know that the slice is valid UTF-8, because we checked
+        // that FILE is ASCII (via is_ascii() above).
+        unsafe { core::str::from_utf8_unchecked(slice) }
+    }};
+}
-- 
2.43.0

