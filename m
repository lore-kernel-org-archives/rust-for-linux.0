Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8171738B
	for <rust-for-linux@vger.kernel.org>; Thu, 29 May 2025 18:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748544386; cv=fail; b=dHb9pc+G+o3xPJ6sOfupHNhpe1pYOGArNLmxv9w8mBqNRYTEpuQLKuKdvsgqcvagrA1CElGMhXrgGreKMf6m0wjk/LNIs/FKpuRWa2BJybsdwFdMy2qqgCSVngCY9guv5fy+zlcplpo6PuMECePL4pCgMwjPon0oTQBVpdA3vqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748544386; c=relaxed/simple;
	bh=PdNHkQ+BKjxjDyx8m+V3pLSz2JxmkHRa5rLL7eQY8RE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jph/Wzcxj7wHdv2Ia/oa1V+2cZ5LmUAyuyIHrBMO3erSR+2Rq55iqQjpd1ViDF6/76MS2cRqsU3X4imlV26pktjcwIh/FHjMV6a6MrVuzQYcIDxyuBUcET/3CQ7yoJMjTF8o90dE6e7Sr/lau7SM7sP7PfAW/MNW28ed3O3bwAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CL7b3NRZ; arc=fail smtp.client-ip=40.107.237.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CL7b3NRZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4bSAfgMXE51B0YTOf237SIrrpT9EjajJS4iGmMPNTx3MXjDwyGGa6OgPitkcNTf6legTAegAaXO7zQY6jRNTZNaiINryfJKAcINLx1C8ZjGs1a/yT+9ZSfQBS4UjgUWI8NdJNdfW/dn5iFpxjCQY6SRYHrTkSXk6ya6jxYookpkabm8+Txjx1KJiODKvpxGOmotSbBqZzAmBGW/i0Swvo0g8sZHEVlVUr/HEAEy9Eiay2sEZMkwN/GQHKiVRFgCtzyBFnHng0N5M3BXGiqXwkhE5TjcwYMJPCwYs6Wl505bCym3VoTrL/NX9wf+Y8JJKoDn4Z9zm+KIAvSp9mvSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RO3rf8CkcCA9qZwr0+ewxgE/AUqAslnMh0VrxMD00hU=;
 b=aeMFRImz0eEZbKHIcfc2V9WMN1w2z8aqpErzTJ+YC9wUUGdpMIWL033eaflm0mevzoRTpBkldL6ErQ4//Q386+OkOoiHc0oTFWvzaqawTqxYvvRYHgX24RSwlJ6knuS0kZSg/TS68znxpayhUuIbNLuqCaUWBvb3ZPP3nWh+dAKQ2d6leBzgPOYazKW9mcEDNmR48BEJe7GvG35pd9b2z+vlFf2V4MwSndsBfX9xYBC+31pvfnWgI2QoOImw6nA+thXkzG8Ip2LndYVos8IVUdo8Cde3Kw0OF8OX0wlhqTfawuwesaVzsc56I6XkWqkxAuYqpfEIU9jLwoDBJ18uIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RO3rf8CkcCA9qZwr0+ewxgE/AUqAslnMh0VrxMD00hU=;
 b=CL7b3NRZ/pYIqV6raJMOkgc6nqfc0oJFYYtW27LHCvxu4rQQJNo/CIsEuqom1LCGZnJELVSHJGR7tYrTaabyiqI49MkWzXJwvWr2wsQYKZVMGbC8bu5ywL8N3r2KgmM6L08XzM7zVCjIG4NuiaVcysBepFqU58FxxsPKm2qB8oH+MKwKcCG5XmV3OG/bJ+TSoojibpC6twJ2wuaNP4BIWmN4tyfivOpPdX8zH1HF5TGgSbFbJwUg+YykQpdjUFs64aMJ7BTk4FLtATuzoNua8V13lOG0Uk83cHopQN4CvhZ/ULmMiqKmID/P7GDMMECyVQiiQdgqmYIXnXmGmT23uQ==
Received: from CY5PR20CA0016.namprd20.prod.outlook.com (2603:10b6:930:3::19)
 by CY5PR12MB6454.namprd12.prod.outlook.com (2603:10b6:930:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 18:46:21 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:3:cafe::d5) by CY5PR20CA0016.outlook.office365.com
 (2603:10b6:930:3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Thu,
 29 May 2025 18:46:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Thu, 29 May 2025 18:46:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 29 May
 2025 11:46:06 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 29 May
 2025 11:46:06 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>, Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH] rust: introduce sfile macro for easier code tracing
Date: Thu, 29 May 2025 13:45:47 -0500
Message-ID: <20250529184547.1447995-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|CY5PR12MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 848dfd90-9809-4e2d-c02e-08dd9ee11b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dtM5pXaHNozf9pXIe3O0TE5sW/DKkYWhIwpYWdgsxTqshbndmwWHFvXg8aFM?=
 =?us-ascii?Q?x61hM4CtT4oI9neTqPiDc0Oj57sFumBdkGX1W250fWx/bPffP0kys0r1mjry?=
 =?us-ascii?Q?IpvcMjR28dY+Xbk7ppy7JwWTbeckB/5+WlfMwI8YaBxF9xq6tzvjQ7vUCI3i?=
 =?us-ascii?Q?0rHgh7DQdBRY1YDc6sYHYNMeVk14I/7ts4cjSTPihhBZfxV+M1ImUDGqwjOD?=
 =?us-ascii?Q?j4qz85nN9AnXAZAK5O1H6cuPaJT/VtRUwHf1SkaJtBC29gr4sfenFbVAISAE?=
 =?us-ascii?Q?qm7gQ0y1fWb/YyJ8nNZSnMZ8eHkVooHuIxoxCrt6cALKaXSM/+Bck1HXtITG?=
 =?us-ascii?Q?WKVaw/NtMuN0AZs2p1OdIkzAzxpQ3ycsdnTx2S3BXOCWso4URSEVIYaJpC5e?=
 =?us-ascii?Q?0uaBUfzqPIqUSEJqcdAopsLBV0MUJ/0pa4IiUhfWQAIVnjeXfxlMNxugbB6A?=
 =?us-ascii?Q?VGhgaMwgwikUHdDnqAKt3nS/kNvgnx/QBTFwtkmFBT1vBItrM/i93AHFyX5l?=
 =?us-ascii?Q?ES91wCE9YkbBa54Jmp07CZGo4c/ftQ+E9F/XqWQ102PlS8YV7A3NiSwISm7X?=
 =?us-ascii?Q?6C9h6PcA/kaJ1e3dUH8/fgcb12kigWGJInrL9dW8zNfBQkv0KAX/Pa0kad5B?=
 =?us-ascii?Q?l2rJOC/bGbZtLVOHlUiHomVxqtI0uqIUnoqJPRY8TQ9hgWNIXcyu0MBzAI8U?=
 =?us-ascii?Q?+gFGaPgAyy5pWfO7R85ksWDMXGmvgNNnd1a+hBk3/QjEqHdjkgHPdvifRIjb?=
 =?us-ascii?Q?zjKTlWglqMjKiYyNOl4ThhoqKVcz7Vyrlsm/XiWtrOOW0FSL/DVZO2E1Gs83?=
 =?us-ascii?Q?OKh31emowNWLO6GAA1/n/pyW4TPwMdn+fKtPc+aA2qCeDjlFj3eIbJ+ZA5qQ?=
 =?us-ascii?Q?dEvMFPHxpziJzf7PF0/7akkTIl1S7Vsn3deYozD4Wi+optmHjqZIgTYQoFjW?=
 =?us-ascii?Q?XjJgKaN8/VTydH93jmfrBtiO71zuKSGUJO3fM5GNZPf1ntFEH8YidjfiMk2H?=
 =?us-ascii?Q?Y6miHWD9rxfOO995r3uJD6mBqXZptwpLXNzLvi2yQ+A5U+cKMKnbbgcFSlg3?=
 =?us-ascii?Q?U23fEhwdp7p5A+8YtzBlZI+m0lpILrqMh86mddthYFMyI48B6ttbcOwARyUg?=
 =?us-ascii?Q?d/TERONu/JxVnx0y5rQqDC2TWmGbcD8i0qku6G4aiUcgrroIy9v3ETDe6B6l?=
 =?us-ascii?Q?exCycSXprKw5EnmKbkondoX2rzAlxhcxzSFYuvnY0sZkUe3hviO+kreh6Vda?=
 =?us-ascii?Q?6OKknNpDzzmGuiwDbANWFctSuhWCkbW7fnjpD0fQ8SRrlNUozYjvQJ9USSR7?=
 =?us-ascii?Q?cSp5g6+LqqV2jpS3cWxO8yySxGVdA5b0YjkTZ1ziIDe2pDFS46HNWWNFYa36?=
 =?us-ascii?Q?vCtg/QwgBk427A0lbyYqAA43Zx2/EkpHNaCgjqueTbwlKA+6+y6uPMfUoXhc?=
 =?us-ascii?Q?cjbODwESP1FMShuCKRNi+IrvQEWWu9ZgFiaG10oVHBtzLLK9+atkjwbhoVFM?=
 =?us-ascii?Q?do7MJYw2b9REO2W4MRV+7sYRJ6KHxr40XI9L?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 18:46:21.6351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 848dfd90-9809-4e2d-c02e-08dd9ee11b31
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6454

Introduce the sfile (short file) macro that returns the stem of
the current source file filename.

Rust provides a file!() macro that is similar to C's __FILE__ predefined
macro.  Unlike __FILE__, however, file!() returns a full path, which is
klunky when used for debug traces such as

	pr_info!("{}:{}\n", file!(), line!());

sfile!() can be used in situations instead, to provide a more compact
print.  For example, if file!() returns "rust/kernel/print.rs", sfile!()
returns just "print".

The macro goes avoids str::rfind() because currently, that function is not
const.  The compiler emits a call to memrchr, even when called on string
literals.  Instead, the macro implements its own versions of rfind(),
allowing the compiler to generate the slice at compile time.

Unfortunately, Rust does not consider the .. operator to be const either,
so sfind!() cannot be assigned to consts.  For example, the following will
not compile:

	const SFILE: &'static str = sfile!();

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/print.rs | 48 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index cf4714242e14..3c7b0c74bfb9 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -414,3 +414,51 @@ macro_rules! pr_cont (
         $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
     )
 );
+
+/// Returns just the base filename of the current file.
+/// file!() returns the full path of the current file, which is often too long.
+/// Use this macro to trace your code:
+/// pr_err!("{}:{}\n", sfile!(), line!());
+/// Note: Avoiding rfind() allows this macro to be evaluated at compile time
+/// in most situations, such as the above pr_err!() example.  However,
+/// because .. is apparently a non-const operator, the following will not work:
+///     const SFILE: &'static str = sfile!();
+#[macro_export]
+macro_rules! sfile {
+    () => {{
+        const FILE: &str = file!();
+
+        /// Return the index of the last occurrence of @needle in @haystack,
+        /// or zero if not found.  We can't use rfind() because it's not const (yet).
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
+        /// Return the index of the last occurrence of @needle in @haystack,
+        /// or the length of the string if not found.
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
+
+        let start = find_last_or_zero(FILE, '/') + 1;
+        let len = find_last_or_len(&FILE[start..], '.');
+        &FILE[start..start+len]
+    }};
+}
-- 
2.43.0

