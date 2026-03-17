Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7003FB07E;
	Tue, 17 Mar 2026 22:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788080; cv=fail; b=eqxsv5fVzmx6eFPmRQGUZWSyZtzmv8drYb9NYzOIkeF9+IhsSXzSqEVRzNseiCakQys8/jE4SnkKT7kIFPIsXtxasyNRCaGHWsnOAVEn8UTKd1UqgMB25xmxkSO778+pRY5Tr+ZNj6Jqpnq18FdVFj+9dsM/M6AkmbpSGB8fHIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788080; c=relaxed/simple;
	bh=Z8wFYYXKqzYO9fHaKX4a31J2bHLXI80LtHf7mdhgk6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=thiWb/mah4wpaVeBCeInwpFYZw5e081hcgLlx/Sx5Ynq1AiGeFCbhPVjxlQTu9bUdtrq1fF9VPIWFOY4fSJ9BixslP6F996nmU3KieXNQPcrHPiX4CgdItH0byWJKnzGgP2/GXLRyPXIaMm+iKsRmxoYnofA8Pu6UIP1teDuVeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Sa4uWlmm; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sa4uWlmm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPRiCy7PrND27BwR9ba8y9lcfxV/xSH+KDyuJ6Sog0fY4Q3g/5cY8gGj80GQvngcPA60RKlv0FQRRDMqNciNsBeozcp19vpDOH9y84Be3GfKgD0Y7nDajprAL3chfNE5L8kR3zPLWd8b5bPBEoaQPlrTGbTZyf2HOtin9TzbRHgUSKkE0FbheCy+BxgVd/TfcN0gGwcPmtWMqUNV3KAT/HI92gKwlgVfXwFk9UAsnoDiB4LRhe4T9VIVYcW147qVCiV2f+Skqs3sm/H7KQ/65P4i/a3Y4YhLzvAv2YC/vHby3PWS+WNywJ4L4xwgOFm8YbAAyEN9ueQAYizd2VGNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFH1Lc2bn0mDibm+LFHNmx3AOI/x+Q1b1+c3JJOh73M=;
 b=b74V558DAf8Hh8EHFTkTlKzsZVGWk9l6K8njN8IshUn7LLmX9ZSkAZcjBZBTLQnz6yrzQtjfsRggqU6XLPogEONohbW2CDNx+srMsc2yPlApLzSe8AGs5MnErvhE7IX0HrhXCH9nlpejI6isw6izP5FE+IUDeL4/elzkc3k51CwdQB64+/wDi/9leO859hwP5KXuuQKyTp9qQ2P6pqLdYMRrbG8ARxWlB5YlKrRFiR1VstRGZTBWWM0r4H4NYvb3GQB4qirWaoHpZ9futlF/aU/Jc16bFWp6usRh5EpmHibFu+8dFn6r3wVHN4Z0gAZwGLTIQ8dM33BzOEYBZ2+NZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFH1Lc2bn0mDibm+LFHNmx3AOI/x+Q1b1+c3JJOh73M=;
 b=Sa4uWlmmtuflELOCsFXvnNmz2wm+b5NsoMlMKZAbfp/7UmOWcPZgEiqvUcxRy2rL+eG90Tz8EGGqlJ6kz4Qnj/DNv5j/T4djMRxpGhRsd0UPOfyDGLqzJtyBOV7UcRzQOfpn5TlVl4I2ZVzZvr7ldVGZZSFlcq8Jpwb61mYK0krgGk2ijDA3rkhK1QV891dTW78+EUff5kUnY2JKHv+iZ2bbHnT/Jo4SfTaBo8Yh9BK6xxwJwMamhUh5WIebZzmm8FN9WkosFvQ0wh1gHKcFdJamNkuJ7TPQ35nCm6X4A2KM6SfLSy17BSVeoUbNAZJtqftsYjAvu4v+jX87i9LbmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:54:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:28 +0000
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
Subject: [PATCH v7 23/31] gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
Date: Tue, 17 Mar 2026 15:53:47 -0700
Message-ID: <20260317225355.549853-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:a03:60::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7c8c33-0c53-448b-7978-08de847824c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C9prGvC4GdQJBLsLcc4Q9fl8sWAT0ec/Q3iKfV/K7f5/VD0wrQA0yzfiZCeqJrBvo82ikuCQXHs4IeHon8uc6HvGQL+RwMA4nv04EO675+khCIqxk0RNvCfO4gqca4+KJVo1wLotFg+ayCeVmpanpIgamUmrieVTgwSoxVqMTgd3kc1hbtLm9yXThj9COGOasMJX3gI1Wi6OAaOL5OeHFQIkmIU8PMPIogLintubvsDYmTbKO0dHbJjsl7MSe2iC/wxWnW6HlJv+YzNDlEk3WlbB+0UFzBscGLM73EBxt4W5pZTJRjSk6ScgDBPLft9SswuZVXeGlVFOIK2k/x9aVXaCOkoyxakSBvAFToxks0IajXSB5pokHWCoynzEc64QyLtQ2tGdH6Z96k/O1h4a9cXtAS+VJ+Ffrfh5Nl0mz8dP7IdHULf+Q96kiUuwPBaehy9IrgglgSh5RXlrN5Guko3xr8SOQH9rmTJOqK+Hu1DSDDwQ8CPHvULu+Cqv+Tlx7UiBknb5WnN9lE/oDNXiDcByNmmhMuhAr/9HOtq95jgo/V0eu3YWtNd/ol51wdAnjjGwLZcefSktM6eIpZd8EiWt9Vq+pR0Hn+8exnxEsb7dnOyTVWsn4YXuWEaQivsLAq99l0gr0TW6j05BzZyh8z/5dowfFxmo30HuwMM097Rm6Z8EJPtlcdAbZ3IHtWf/kKGNKUEeHJh/OMECKqvejDhpB6J9zKRiS2myj8rLmuY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZQDHBRokIthJYvZHQUuBs6ZGNvHGZIPbCTRUIcVLQxMI7HSUseEszFcLewFP?=
 =?us-ascii?Q?+WwFszZ2Mmqe/g3QM3Wg8MMTdkvyQP/zST2Tl6AzzR51KKaQEVSuLEnHV9Ek?=
 =?us-ascii?Q?P0qChMYgIXZ7akfWfU+PQ64FY/Ve2f3gP3vN3wJnRDUwUMnP5MfyBEZq0v40?=
 =?us-ascii?Q?ZAOQ9IVtmLGePKr6mcj1ka/VaDj+XFzrgv+a4zlXCZmbP54Ir5uq0geJ0xmy?=
 =?us-ascii?Q?nWzd4Q2TlaX9lwK/wIlOmxcxa8f+eiQmG7PzvitDJE8XHdPxyQ0GU33wmeB5?=
 =?us-ascii?Q?NFkabz+zyjq3vtzH5re55RNARqEopkDANzhKvK2mbdDluEhu3gqx2p9LTekq?=
 =?us-ascii?Q?aj8ObqMzCHqfRxV8b+eiuh7vHCJJpfKeSRP8uYOY4cdZTWVJSO178oW72Mfd?=
 =?us-ascii?Q?2mAiuXnu0QOYqJIIKYNiYg9CoaPTKmYKRxCxTO+RAl05C7fwfVrqW6Saa7j3?=
 =?us-ascii?Q?2hfcBjH+rPRhmjJq82UEeu4pqtwrUqKfZqXbflTTY+Z0zRA75MFxps58FKiK?=
 =?us-ascii?Q?Xivdhg/L5czDAN4UcmsdotuqW1F2xgUmRWoBOVKw3rvR20dwbXkSJU8Nc+3+?=
 =?us-ascii?Q?WslnE3LDJTYCNMaCJYu9Y0qyAM618dxYRPS6+9sk21eOwZmfFBgZwUFle4Zr?=
 =?us-ascii?Q?2N1ExwOtoqU6vOb2/J4L8SbQOU3a4HGxA2qVJsS8MYqs9poJ7+y+UwQcSs6t?=
 =?us-ascii?Q?r3qfwTmH/RzErweE5qcjxlV/G7bTDFFs9HHg876XY1uoGcu9AAXMDaav3ztZ?=
 =?us-ascii?Q?pQyyVGpB9W9DddPVXssOa/sshxq4Q1uW+YITK9uZmUeLmQwN7mg8xzn0A44a?=
 =?us-ascii?Q?d3sFh/ZMaAHj8gIvtR0J74r6SZ7pXRqdRhn24LjrFzZI5qzdx3eWw+wOTx26?=
 =?us-ascii?Q?EjTpkCAVVlw86vlLue/22M6EtFGfYb5KCrXFVWe/9XrqV1uhCqLJrzSD9NfO?=
 =?us-ascii?Q?28tjY8rL3NdGVdcj6GGri1JqOI8D4saUeckS/Ub6gQJu3eoJwHOJi0XPGGJP?=
 =?us-ascii?Q?nZ8ZtkxYHXyafKGCx720MOmHqBkO0XWyXmf/kwDB+5w7x+atLwGpKsP4Wy6S?=
 =?us-ascii?Q?IM9UX0eTTS0HQRbNHrk3iZf3rnT4/VocLPUFrhuo2bBRtebOBYg/qCbMI85p?=
 =?us-ascii?Q?+tDBzUrvOVm5B9DOrDWenAebmPWUi8U9qxKqKluDqu0cToBjuRAG9rIuZBSB?=
 =?us-ascii?Q?MQd8L5gJCJpvc9OewX4igR9giNFhtA8Z3B9V7p4IqDwOCkUtbNSFGFtWmRTo?=
 =?us-ascii?Q?dBUiRRtxOLUsNGSOYhAFl7/oWw5LjYJAy5R3SbgzN4g/G12YLjBgGCiJSYdq?=
 =?us-ascii?Q?4DrdursUzysFpCWOgMQDEZpYLPSd0HIx153i9USTjaFt5u5Fp/798NOk80IF?=
 =?us-ascii?Q?PVNtzVcaSmNdTzWEyFfC6k7nbUSwAU44em8x2Xfs29zQJmLfIfqMPC2P8jTf?=
 =?us-ascii?Q?G8oZQ+56VN1RB64lFIc3H/p58zIoBWYmmbs80aEivR9kXqQMiQMWAetamRER?=
 =?us-ascii?Q?tYMg4tUnVeMOaUS353e6oxo61m70D7o6ewJ+4WJr6GKuwIYcxWRUFZUn7GK9?=
 =?us-ascii?Q?mtX8awrwRqGqsneCrQUz0R61rmHSPCRJSbxpVZuYmK3BTgFaN9EeLyxs/DPn?=
 =?us-ascii?Q?S7NL8kElXQIe93PNIodsvAsbGOUlxVnPyhpgNSxt9NhSkg4xA0x19j5yUBJK?=
 =?us-ascii?Q?52AQMR4V/sHDiMcu7K+IYEE27aTSgxIpo56WZlsZc+hsdi1wWWaULIyggoTj?=
 =?us-ascii?Q?IBgSUQ9Wfw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7c8c33-0c53-448b-7978-08de847824c5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:28.2325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgHG+b4nNMmVDd5abZ5AGajxStNWInKHVm7WwRW9r6u08XVBlQElIF0lJGsKc3AREkAHtk0RyvV1HbDGPsSZag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

Add dedicated FB HALs for Hopper (GH100) and Blackwell (GB100) with
architecture-specific non-WPR heap sizes. Hopper uses 2 MiB, Blackwell
uses 2 MiB + 128 KiB. These are needed for the larger reserved memory
regions that Hopper/Blackwell GPUs require.

Also adds the non_wpr_heap_size() method to the FbHal trait, and
the total_reserved_size field to FbLayout.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 16 ++++++++---
 drivers/gpu/nova-core/fb/hal.rs       | 16 ++++++++---
 drivers/gpu/nova-core/fb/hal/ga102.rs |  2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 38 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/gh100.rs | 38 +++++++++++++++++++++++++++
 5 files changed, 102 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index ffb996b918f8..c12705f5f742 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -31,7 +31,7 @@
     regs,
 };
 
-mod hal;
+pub(crate) mod hal;
 
 /// Type holding the sysmem flush memory page, a page of memory to be written into the
 /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR*` registers and used to maintain memory coherency.
@@ -99,6 +99,15 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+/// Calculate non-WPR heap size based on chipset architecture.
+/// This matches the logic used in FSP for consistency.
+pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
+    hal::fb_hal(chipset)
+        .non_wpr_heap_size()
+        .map(u64::from)
+        .unwrap_or(usize_as_u64(SZ_1M))
+}
+
 pub(crate) struct FbRange(Range<u64>);
 
 impl FbRange {
@@ -253,9 +262,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
-
-            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
+            let heap_size = calc_non_wpr_heap_size(chipset);
+            FbRange(wpr2.start - heap_size..wpr2.start)
         };
 
         Ok(Self {
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index d33ca0f96417..ebd12247f771 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -12,6 +12,8 @@
 
 mod ga100;
 mod ga102;
+mod gb100;
+mod gh100;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -28,14 +30,22 @@ pub(crate) trait FbHal {
 
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
-        Architecture::Ada | Architecture::Hopper | Architecture::Blackwell => ga102::GA102_HAL,
+        Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
+        Architecture::Hopper => gh100::GH100_HAL,
+        Architecture::Blackwell => gb100::GB100_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index 734605905031..f8d8f01e3c5d 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -8,7 +8,7 @@
     regs, //
 };
 
-fn vidmem_size_ga102(bar: &Bar0) -> u64 {
+pub(super) fn vidmem_size_ga102(bar: &Bar0) -> u64 {
     regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
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

