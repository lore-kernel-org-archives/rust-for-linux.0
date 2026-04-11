Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EC8325705;
	Sat, 11 Apr 2026 02:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875841; cv=fail; b=YCKNlQFw0aOoEitGFilRmmEqQ5QSXSintlXK5+CHKnSN23skzfcZig3MGc0ErSkiKar/+iBOSmTq/aJ509HWmcVkQmtyPxVp4p4epZs5mjcbgyCgGkUvRP5irqlRAMgm+QeL9T2IEYOUfAZzmo7JgZHFgsCPM6uDIXua03hmoSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875841; c=relaxed/simple;
	bh=Zsw1eww0LwUXhAPMp0aYRKlsle9cCOmIgGVwUbDpGbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FQH2HR27YH9iEeeSN+24GwAhUzKrNmxYQ9ZT2PbiY1l5sv1DUDN3NbPyIWru8is8lPCXWNlw2qP5byEuCquf/I/xJJ68STCgCebqYf/EFOQFt+NzmEnVP4MuFKuYIg97dp6/ndOASp1eB6t11Dh9JP8eMBns48R41IrIFkdOtLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lb/qJehG; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lb/qJehG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qV/MKrpMYLrlLY1hwzCpVRjA6+Oovypq5xWhcdFnN4zBk7TEU/oFHawqeuZ25u2PdGe96fBeVBtrWouoA411XrBBV6NoYQCobtDk8Ig9Z/YZ0mhkMg1xGbMvi1xunIGBm4kdOneifo5WH95SjvAO5D3sXVKQ6WqQ62lwmNU5foO1JkItOiSLfuruOA1e0ZOzkREyf1L+R63ZYWt0aDhct9A+QJNr/fV6OiG5IoG+xgtPakEWZRr+vlnubxlb+wc8cHLUWB0BtuDh5wtZ4qq9k2B1bjzfcYQMGG9xjyDvNU2QeYGF81j92016Wx2Rdc8YyD0FpOzJFEwkzhVrRnxfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i42mUdIXcWa2AX3u/+pcKm1zBBzcwuXcIOfyi4/tx90=;
 b=e+50rVUA/1f2yEVGQoWFKL/Ub5eMVoJhWfvTTgSiDJ/MzAPXPwM7YjpV7UX/5HywKMHgdqPEUZBHWrr8mIhy03r3aRJhz4AzL3LBDSJJJre8jNPIr/SOzl6TlpGrK49QKhpSw914vkbGT9/HDwj/fsbl0SSpZZD2i87C6hC8/UwkmcEVYRdXt9ztNaywJ235ArY4IvzKYZwljeiMBcu5kt9MllA0F6sUWjZgNf8QDnuIsH42FfvPeVMFYpLBiiVbBFdX2fpxkWiIGcfwIqimVSylezhZTMuPys4Kt3Ug4CG9Jr91VWEogtI25Q9hEKyWWRKr1dc2hsM3UVQ+GXsoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i42mUdIXcWa2AX3u/+pcKm1zBBzcwuXcIOfyi4/tx90=;
 b=lb/qJehGT4DTOH02D9s8ZB2osqvMUJwkikAkUC9VB/mV6Su0a4s+PeVIU15JjBnhdJ7SN57FcdAR533FwpEIBP2Cb34jjfluIGEyzI6nhlKENYNZS5mbY52JrMVUHHKzdNSsXYiHOXwrRHl2At0faAQh/1s4O5mR17SzdtFr9ncfnLWi8BkYoQKTGQFVmyfPUMQT/VcsYerRHp9vdf6VaRWQQnZOjJmxrBcStp/NXyfPWZEMzjYTA+BAbCBWjAFy79ijRQNkIMexB3UCmpwcwJ6u2fhnHp7McgWkJc30eylr1dQeyEv+eIl5HpMFBKbnZK7/ewf6IWzqjJ5Mp3snxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:29 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v10 24/28] gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
Date: Fri, 10 Apr 2026 19:49:49 -0700
Message-ID: <20260411024953.473149-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 068063af-8a41-451e-4da3-08de977515df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+rlU7d58D8F/OcQdn0ByBpfbHtGlk/gaMbKouJmX71Ln0pfqwWSSwyywhKZ6U5XWc7LPm4nSpcwlcGPmi9HW+iUCRfE3xBFYCfFIbJ43cn1CCYYXulnFWYY9hhxYBoeIwLWZgm/MP9vXiiVkqYQX3sokatjuJMU5pH7M8f7IaMvkmBr/zLWqtmWxkEyEgLpOY3ax81ceykdWeXBUi0rbchuwc7FO0woYUzNN03tqSV6jI40sbJjDWLoT8mciGwVKMYCY0tNuq8Idhwr8b+HG8NUfhXO266NSJp/KaI/Hxtv+4uRjp1yCJ28xqO7gcucxJV2g07No+cy/8WkylQRDKxhu7spb4jzMxdCNzrSiy8JYAN8JHUb0s0Gbn1Xag6Wfkb0jcDDq+rfVzLvmsSjkhgh4istUY0bvkXv3Up9HTQVlO1aKA5X/t90cYpBSoDyIyOzLqZOPGVG30xbgNyf+n7ddKQNXi/Q/exq4YrbFJyds+4h+OUImb9YC1Y2Sa/C20LaueEclsiLW/D4ZJ4SZJ8kpYAYMY0jeMAQ8/S18tHFazriAJpBqo7naGMDOt3EA53h43udUkmhkuIXc09UmIWIsYtc+EN7GsLpHhzCFXSOguLJ6A0QJp7bhsiHazyYar2lXvVNaQV0ClVcyMBMDkwrhI6wTXrqbKbMOLalxIuCySXzlF0zS7BbSUogHGVh+CU6UBiuQeg440eMdcOH3K0hjbjEEN54sJ4aHS5SqxQw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4QcO225sjYY+ZKkbzQe0D6C5ksVV80MtssF+tsLdwnH2iEpqb2tKPdoLk7n5?=
 =?us-ascii?Q?i3FOfO6iE3TsrG3qFrSSPSkS65ZkinMUCm8tpFTtb0R7sz8fyt3hswfIyNwm?=
 =?us-ascii?Q?npMBoKrxz67HKvDU0EQCAzkyIG6uGNiCfVrxjMBKF6ZFHLTMK7k+Jq0pqCyS?=
 =?us-ascii?Q?ZRvpC+scPEdhbQ3BDlCpfw3GCQwQYi5KYxwBcMZOcymP8rwefB3JA7nqF99y?=
 =?us-ascii?Q?9AZ0Y2gVJGy1GAcfHBmN5jEbfQhtxtms4Hq8Re9Su6LsHupAx+y5yne9SDAl?=
 =?us-ascii?Q?eDtiI2Y4QpY1tt1lA9AS66YfqxoBvA/7d9DEHH4tEUGvjGfq6E/zdhsfcD2k?=
 =?us-ascii?Q?vMwsRi4o2wAEnq1vX08CWsqMPb2UeqeY7VyE8RwQNtfx2UcohenoWC0WLji2?=
 =?us-ascii?Q?7uN3mJgtIkY9268R8uFp8F85DOJ89FkeYmy6sFJYS1WMMABH4pU0GKWBUJeO?=
 =?us-ascii?Q?tkAGrIAb1dHRUDNvumrO0YkV6K9ZWsbI4RTrvUzYrZUYEctSYy6ZP6Z6yfhW?=
 =?us-ascii?Q?B4rE8HRlCBAlefVgkJA8OKf/ZGplgAwI0IgjMOrso7BIehILdstRiZ4VVf8Y?=
 =?us-ascii?Q?XpSxfuXNINeb5Z2j0CeJP96hAf6/K6gZHJQZaIqRvwJwwxkkkNx5J7k7xyXR?=
 =?us-ascii?Q?Nyy9W5bhpn55vLQ8/sNCNq6rMMbst6SuZt5+ATXvTJbX2mQzSrSUxgLNMsNJ?=
 =?us-ascii?Q?Nb3FXx5BPTrN+GbBGITrlimdVzzQNawrzHShBiyOp4nX+R25YoNxXk1ruY9h?=
 =?us-ascii?Q?KEeQS0Mc53T67aDrgBFwIBNB87Vb9ACyuUiTzbbS9LO98DwnpS14z64uuptt?=
 =?us-ascii?Q?eEWexzZxfr2q89joSuQKJpi0oDAFoaEYr1lia7pw6E+VqPeUXA5n2LWwO3EK?=
 =?us-ascii?Q?CntW7Sme1uZclm5wFHIasme4qHFCSjbckzBMQiDx47sPKqIlImmqp3pJPwbY?=
 =?us-ascii?Q?5GRl51VlC1TGbDpmlqGGSLyiPVlNTwe7HIU/nDL3ftq48IPaeTRC1XCuxYqW?=
 =?us-ascii?Q?LlzLMf98gonke0xf9y1+x4wSgUG2KsvA+4TY9kXCrXmFrhbT+qFOo2C23zjs?=
 =?us-ascii?Q?mxjfu9rGHQySMA8+KgQSPapDo8ctkdauN95zBN26VcWztY7axNGpyfokKX+E?=
 =?us-ascii?Q?mCD8+/7M6J/Acd8zjy4cFiwefDoZ5+jWIrSvBJmJEjLVrLGUzNl8FYUMl8Ds?=
 =?us-ascii?Q?Rz4A9O75ccnsoPgUb2b1Guk1YUpFyqgBRnB/jOkUUkxYYTWCaqnkmWyfiEtd?=
 =?us-ascii?Q?kV9bMWWxk1dxZrQb2s66Pu/oZ/XLDvH2W8KA/Chuuth553bweZueRSMVc+MT?=
 =?us-ascii?Q?b6dHHkU+C/j6i79wjNBBzixBU5Zm9r97ZaCLlUZYTEAqLl5kv/tDqCGoW0f3?=
 =?us-ascii?Q?IUbWznJ15+zDTCQdgapc0gMcjEJxRpSM0tfqG1wMdEkdygMdZbpwjSYaoOT4?=
 =?us-ascii?Q?O7tEDPP87xz0QaWSinAd/LJu0XlRpxLRw8bZt2mADlHZd76pOp7yCBbrwvQ/?=
 =?us-ascii?Q?1HyLM4aB8WJ/PK0VLQmHsyR6bhpI05wKWu1vZtrerdhA5kW6LazotwasD3xG?=
 =?us-ascii?Q?MT5JfXC0ELGHFLM2WdATL2f2d5bmWP6JEX5CUS0hZMfj8mPG/6qPZ/zhjwMr?=
 =?us-ascii?Q?CFRh8UI58liUa/Z1njkFta8b9uSug8+ydq0E4XFVti/RxcPadVM+dXjOYHK7?=
 =?us-ascii?Q?QI/0W7zZaGU0UzQ7IcEI9XHU1q5qPNGkyukuJefGcjv/g6wXh9jGBB53d8KG?=
 =?us-ascii?Q?ZR+45IybfQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068063af-8a41-451e-4da3-08de977515df
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:26.8800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrOFHWXOU1n4tyS2c8yOt5MYDU+GL5REpWkkxHNS0ezZLUK9G00s9RNowT5HM209wWJABBio915vJ+96ZJzDnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

Add dedicated FB HALs for Hopper (GH100) and Blackwell (GB100) with
architecture-specific non-WPR heap sizes. Hopper uses 2 MiB, Blackwell
uses 2 MiB + 128 KiB. These are needed for the larger reserved memory
regions that Hopper/Blackwell GPUs require.

Also adds the non_wpr_heap_size() method to the FbHal trait, and
the total_reserved_size field to FbLayout.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 14 +++++++---
 drivers/gpu/nova-core/fb/hal.rs       | 19 +++++++++-----
 drivers/gpu/nova-core/fb/hal/ga102.rs |  2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 38 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/gh100.rs | 38 +++++++++++++++++++++++++++
 5 files changed, 101 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index c2005e4b4177..756ff283a908 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -103,6 +103,15 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+/// Calculate non-WPR heap size based on chipset architecture.
+/// This matches the logic used in FSP for consistency.
+pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
+    hal::fb_hal(chipset)
+        .non_wpr_heap_size()
+        .map(u64::from)
+        .unwrap_or(u64::SZ_1M)
+}
+
 pub(crate) struct FbRange(Range<u64>);
 
 impl FbRange {
@@ -262,9 +271,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = u64::SZ_1M;
-
-            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
+            let heap_size = calc_non_wpr_heap_size(chipset);
+            FbRange(wpr2.start - heap_size..wpr2.start)
         };
 
         Ok(Self {
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 3b3bad0feed0..478f80d640c1 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -12,6 +12,8 @@
 
 mod ga100;
 mod ga102;
+mod gb100;
+mod gh100;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -28,17 +30,22 @@ pub(crate) trait FbHal {
 
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: &Bar0) -> u64;
+
+    /// Returns the non-WPR heap size for GPUs that need large reserved memory.
+    ///
+    /// Returns `None` for GPUs that don't need extra reserved memory.
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        None
+    }
 }
 
 /// Returns the HAL corresponding to `chipset`.
-pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
+pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
-        Architecture::Ampere => ga102::GA102_HAL,
-        Architecture::Ada
-        | Architecture::Hopper
-        | Architecture::BlackwellGB10x
-        | Architecture::BlackwellGB20x => ga102::GA102_HAL,
+        Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
+        Architecture::Hopper => gh100::GH100_HAL,
+        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => gb100::GB100_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index 4b9f0f74d0e7..79c5a44f6a29 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -11,7 +11,7 @@
     regs, //
 };
 
-fn vidmem_size_ga102(bar: &Bar0) -> u64 {
+pub(super) fn vidmem_size_ga102(bar: &Bar0) -> u64 {
     bar.read(regs::NV_USABLE_FB_SIZE_IN_MB).usable_fb_size()
 }
 
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
new file mode 100644
index 000000000000..bead99a6ca76
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gb100;
+
+impl FbHal for Gb100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        // 2 MiB + 128 KiB non-WPR heap for Blackwell (see Open RM: kgspCalculateFbLayout_GB100).
+        Some(0x220000)
+    }
+}
+
+const GB100: Gb100 = Gb100;
+pub(super) const GB100_HAL: &dyn FbHal = &GB100;
diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
new file mode 100644
index 000000000000..32d7414e6243
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gh100;
+
+impl FbHal for Gh100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        // 2 MiB non-WPR heap for Hopper (see Open RM: kgspCalculateFbLayout_GH100).
+        Some(0x200000)
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn FbHal = &GH100;
-- 
2.53.0

