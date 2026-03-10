Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012050.outbound.protection.outlook.com [40.93.195.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB939A7E3;
	Tue, 10 Mar 2026 02:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773109918; cv=fail; b=pNrP04JmwfnXehbnXAfas1HVxdvWeU0IOjXEVex3K2sXviwtbueK87QkCNaktqa1TgxfGNg94D9skaFGkxjMwRTC89J8+zzg/Aq0zl6EToqIc9Pqt2XQd6IDFoxVUmtBa6pGCnYolcFw5W+zjz4laeoqhTkUr1oYTTVsV1lHlcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773109918; c=relaxed/simple;
	bh=scepazTYTYc3bxrgKjO+nZJkUIdUTSPDIUGnhW27cL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TUMUUUcbZLAwkjz6LUuZ9nSunHFXPiaIaPCth/hMXf/ooKVwR10nhlFFJq5yxZ9jFE213suMLYBLIk25Ge+ZZaw/46D6Zs3YAN0f684S7Zewl5KCknUd0R45b7fqUS3d8iZTIjz1h/zCPfth2yZwCfKgenVTKyHPgKWK2ldDxCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t5QoO5j/; arc=fail smtp.client-ip=40.93.195.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t5QoO5j/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuXC1f29t9WmouY9RNwyfjqfAIkSfBjDBOiDSboW2HDLEdAhbQQc7+S5e5lK1haDYSJ1sLdYFt2kpWv6oSnJdM2k+CIPdw8/fXm9SFkEuREa1cbZrg+6T/9wsNrWNF0ykZ3e8lEkRMqjSQqnI9O88+Jw5/CuDyF9nmWhhOuUKl5UumnO9K1kfHVjXnnrC5O5R0kM+z5uN4VIrfNcU9y9Qj1946tpVMstJoBcG04G9E+t7W/pthde4OGivJavXs6taLhsRf3FCXUcvsV9P4Jakb04OCKte1qZOkXhIR7bxwN2oM4aVz/CRfn6crxuakbYXWJxTd6n+nIt2JbYYVxi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNn/28lD/FL43P4TRBucF6Sg+GrV06MzDTOJqkREXwA=;
 b=efIqOXjIBUlzw3lHVGQD5pQXokGUpJL25PZPruUB31WcPMq/xyPBF6bExOIy9aq05xK2vTqaHs3gKG2/bfRwz1EepqHKxXty5OzTKk4kSHLMYVNmCgkOwGLQBr1SfIongTfKnA9HcWEHf/BtEVOBlwZVKuRDCdmfFboT2YH6a7nTDphbQuIPRQ7h52aVanxgX8MCe96+m6ArwsAEfQwKBGaQZ+vztls0Tvi36XEm2zC+kWfN2rYClYvKcjS52Rr1BALTct/UKaZNOtfGxtVfvqr8UDrq47u7rZsPxP3487M7kwc8RNhV1OP602roXVzSQ4AWQCv+n26D2ZmZ3YJxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNn/28lD/FL43P4TRBucF6Sg+GrV06MzDTOJqkREXwA=;
 b=t5QoO5j/Y6JE7uEZIrXAF62reEM8ZWA4KIzMzlNVobWhQh/Ic9DhkbCmR9aQ4VjlT3HUI05lS93sE/3Fc0PJ0td9TmgmxfPDoB0lQy2+qganb46lbHh59NQWjOFhujlBnfEolh7gI4S8NK8878egfkX6TiOJp1j1tvyF37bf9E2m/OWqR7niXjqGL4fQqRWw0TqcNb7Rz/ZPq0JH+P51If/Z9SQjIzo9pwjUrhz5Ce5Et08iGVcovfEjDtEl8O2zNmdBlkEuq/DuehJK2MxjK/8z+v80HSgCQl54awusMA1gz/Wn9cCdoouXQJ3XFWioeGOqlWnGdwbeMZBn5PVZlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB8142.namprd12.prod.outlook.com (2603:10b6:806:334::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:31:49 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:31:49 +0000
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
Subject: [PATCH 2/2] gpu: nova-core: use SZ_*_U64 constants from kernel::sizes
Date: Mon,  9 Mar 2026 19:31:45 -0700
Message-ID: <20260310023145.120037-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310023145.120037-1-jhubbard@nvidia.com>
References: <20260310023145.120037-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb4e628-6b9d-4c92-4bf6-08de7e4d2ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	Ha1xAt07cJtwHaHZHqLV3C/dAcPdFvAxgtmUD3AVMIe3LFuzoPtm8HnvNoj+SmQS+hflRQN/Hre6wlUGQ1xf2Ot87ui8XIZPrRXmE10gmIYNKqJFb9XZ//l+LQnChPnyOcfVr5ac1KzwbjtxthDEyfFqW5GqqEdUv9Jlx76mHgtMCicVl1DIvZHylf4J0gd4mQL3HVnWGC9qiSqeeLq6x/O8jidXuGmAcetAhD939LcV32WCz74aKXuXdy9ORsZKvSImWBf3nU3XDtDCEq9TPwFPmADX2OTtxJS+7B79tIOFthE+g2iSprJUebL0qzZi6EFgpMqsW05pUXcFbEUwnb894Y1vsNtl1T6Ne/qlhIJBFiMg+XphvyR0Z+fyniArBoM2yVozoUbMqNV3ZRt8kajbpWiTqvkisTB8M+z9BCL1U0r0ca9LsNJqN7QmarUtRCXPcYnNuUMUWv0XtzpQefTKTIRAw9TW9ORNv+ga43mNVKy293veq478lyHaqbpXlDG4n9POCwxUIHKuwxy4F9TSmhzzmRFM2epB7Ol1NvqfEZBNqDVW8MME9jbEcIHMXGzEVjFXI/VeB2L8NUNid+/VctWtCNm2hBB/uPoCnuPPF0U9h3R7i/POXyh5NeXdfml3z+HRxuDhN9SRDABq6FKBkhqvCbMeEFTRcTVKloG9IlPrSO3aH8Ovvwu9R3jcqIZiYzy9s7x14v6UKPs2uTJBJpHslvxgnYMklZFR2LA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OZ6oBSJTQucRwvQnXzfAv0u8819SwuMQy+Da4FhNx2EEXnAvTJiYp5ElRPaS?=
 =?us-ascii?Q?YXxlrgN/htjw4ONnjss/1Yj9zwKvBFraqeTS/p+708egsfP4maqEHtFfEgWL?=
 =?us-ascii?Q?WI4bO8lj4nz5L0F4721ofOsRFmyVsioIAFaXlU1UUr0T5CsQyw83L3NARHsc?=
 =?us-ascii?Q?fkONQuGw/dgFZ0ryP2uX+aTJ2P2KPXAII9gb1mTfJVqeXW4a/pGyM7Dn92Qu?=
 =?us-ascii?Q?BpTWd7yuU++jKhGg7ddWo7a6MZDWbPS1QIb2nr53gIUQiemrdATwinjWr6Xp?=
 =?us-ascii?Q?sSbb59F3nW6lH0uvN8IcSGIBzVmVR+q3dvDKzaIVjlfX8ZKqZ6sHZd/buL/P?=
 =?us-ascii?Q?M4aUYAPQmUOS48P33fq7dtz306c1UVjZjt3LpT25eMPbQbq7ZXE/rb/lXEGF?=
 =?us-ascii?Q?nkrKNpI860tQ/YFd6wXVWyAHq2eesU4YNJiw+Hsrzn2WFiJptldkP8074yET?=
 =?us-ascii?Q?KGxQWVlvslyIPHdJcFQ7Nwro1uB3xOIU2Mn+7cZaPmOSdgMRxPvsx/DvTt/0?=
 =?us-ascii?Q?UDjtUQj5k6lgSJo246Q9Fp8NrYAVuCvxYdeB4+TJ8F3m158GgQv+drgkZEBi?=
 =?us-ascii?Q?36n27WMaVKi6SL/Fe/reA6YrUxfY6hKCBRzwkaVkUYm7X8xgC0BfKBm3u6gj?=
 =?us-ascii?Q?uHPLmFA1pe2eOz5LbISmSwlirsQa0LkrcOY4mdPijxjco2rXbwyFE84fiW8s?=
 =?us-ascii?Q?dY56jqEPFPjSfWHFds95Nvo9ukB3fMhaZSUdqtp+dLC6CnGagO/wnycY+m9h?=
 =?us-ascii?Q?4BbL74q0HM/vJJBb7ScGuA/P9zpxyLSQWTggEMn7Rj3ckEw1wgdo0mI4KUOr?=
 =?us-ascii?Q?O8vG9dbb4RTWDsnqc4lOGxkFeqKddDlHbQ1lW1+SoQvACfsGVET0WMOzOiGE?=
 =?us-ascii?Q?zKFhVW5gnY8NuAc5JC5U4FeLG9gdQWTaO9cvDxx1RaJzRUHT1xIFjvh4hiwc?=
 =?us-ascii?Q?EPv8z7a+QKftWEhlZASzqhZMt5c2fVESTZNC3z+4dReD0fbn54fTf0KTFTfN?=
 =?us-ascii?Q?Tya10VWvBfA/6GXor88tRVZFHnF9S6HNWltgQPNewwgcuED6/9mIGDpBwj/A?=
 =?us-ascii?Q?ywhwmweFIOUAwDWX6cBT4DmgXJigYInDVvl2uS8YftFwxEG9GM6btZ2rfJRw?=
 =?us-ascii?Q?hfKt29d/PaB4SZ0i0kxBCl7ef8wje/sAJpeWZzUrV/8h8ulGi3k6tppTcj8n?=
 =?us-ascii?Q?wwt4qZWU04SlT9wHDcOaJrN/1AkI3fBdEjXUk1geKwL+dDlc2QHrIIALPsVu?=
 =?us-ascii?Q?4UBl3hsmSW9cdIK+rWZ4QNz+LWlCjVe3gqS39rGKYmI9OeXtlOyrHwwnKtSr?=
 =?us-ascii?Q?h/+OUjpZ8jjqFvKNtd4SkkrQgpiVjCJZU0kSXyHGfZRBnfje9ijL88uEmApf?=
 =?us-ascii?Q?fgbOGrS71My1G0ZEm03XvBzMegD/Pnti6esTfqQ4mvEB1xnZngIcgd6Qmnfm?=
 =?us-ascii?Q?Z8keSM2fvWe0/YhHEYTZKhawOsuF2M5zU+Bvlg32Nv8Dpr0DmeGWDpz3Hw13?=
 =?us-ascii?Q?c3jd3lO14bu/fs1cDjqzTLBsBA2HhmNtO2R8HyBCiDF7poZmAiTDfaPPp85D?=
 =?us-ascii?Q?HL/Anrzsg5YEi2Q8G1cxeuKYaM/yYZwXWoa9s45UhpnQtnzuuhkdwPqtO5Lo?=
 =?us-ascii?Q?Ptoi5SOuZI9cVJBbIlk60RaWZ9kK6v9uVa8kCBSttYpgG+aqPgp+7+tEKafT?=
 =?us-ascii?Q?dDnqVarqOf9C6KNBLknlzzVKc+mKxfbLBNoBbsMgQGbwjTDtO7KddUbKnkdd?=
 =?us-ascii?Q?2n9P1OqjGA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb4e628-6b9d-4c92-4bf6-08de7e4d2ed4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:31:49.7726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WfV3rWRCWfA9q9vueJ16ce7wRIBLUX0Nee+r2+1UL1WFSxFtFFsE6o8w9t+dZ7ZLr7amQvpkfFw5NZiKHZYAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8142

Replace manual usize_as_u64(SZ_*) and u64::from_safe_cast(SZ_*)
conversions with the new SZ_*_U64 constants throughout fb.rs, gsp/fw.rs,
and regs.rs. This removes the conversion boilerplate and the now-unused
usize_as_u64 import in fb.rs.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 19 ++++++++-----------
 drivers/gpu/nova-core/gsp/fw.rs | 23 ++++++++++-------------
 drivers/gpu/nova-core/regs.rs   |  6 +++---
 3 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 5943db2b619b..1a84a15581a4 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -24,10 +24,7 @@
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp,
-    num::{
-        usize_as_u64,
-        FromSafeCast, //
-    },
+    num::FromSafeCast,
     regs,
 };
 
@@ -105,7 +102,7 @@ pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
     hal::fb_hal(chipset)
         .non_wpr_heap_size()
         .map(u64::from)
-        .unwrap_or(usize_as_u64(SZ_1M))
+        .unwrap_or(SZ_1M_U64)
 }
 
 pub(crate) struct FbRange(Range<u64>);
@@ -136,8 +133,8 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         if f.alternate() {
             let size = self.len();
 
-            if size < usize_as_u64(SZ_1M) {
-                let size_kib = size / usize_as_u64(SZ_1K);
+            if size < SZ_1M_U64 {
+                let size_kib = size / SZ_1K_U64;
                 f.write_fmt(fmt!(
                     "{:#x}..{:#x} ({} KiB)",
                     self.0.start,
@@ -145,7 +142,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                     size_kib
                 ))
             } else {
-                let size_mib = size / usize_as_u64(SZ_1M);
+                let size_mib = size / SZ_1M_U64;
                 f.write_fmt(fmt!(
                     "{:#x}..{:#x} ({} MiB)",
                     self.0.start,
@@ -195,14 +192,14 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 
         let vga_workspace = {
             let vga_base = {
-                const NV_PRAMIN_SIZE: u64 = usize_as_u64(SZ_1M);
+                const NV_PRAMIN_SIZE: u64 = SZ_1M_U64;
                 let base = fb.end - NV_PRAMIN_SIZE;
 
                 if hal.supports_display(bar) {
                     match regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar).vga_workspace_addr() {
                         Some(addr) => {
                             if addr < base {
-                                const VBIOS_WORKSPACE_SIZE: u64 = usize_as_u64(SZ_128K);
+                                const VBIOS_WORKSPACE_SIZE: u64 = SZ_128K_U64;
 
                                 // Point workspace address to end of framebuffer.
                                 fb.end - VBIOS_WORKSPACE_SIZE
@@ -222,7 +219,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 
         let frts = {
             const FRTS_DOWN_ALIGN: Alignment = Alignment::new::<SZ_128K>();
-            const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
+            const FRTS_SIZE: u64 = SZ_1M_U64;
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
             FbRange(frts_base..frts_base + FRTS_SIZE)
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 7834efc9095a..a9a86332664e 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -15,10 +15,7 @@
         Alignable,
         Alignment, //
     },
-    sizes::{
-        SZ_128K,
-        SZ_1M, //
-    },
+    sizes::*,
     transmute::{
         AsBytes,
         FromBytes, //
@@ -52,9 +49,9 @@ enum GspFwHeapParams {}
 // See Open RM: kgspCalculateGspFwHeapSize and related functions.
 //
 // 14MB for Hopper/Blackwell+.
-const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 = 14 * num::usize_as_u64(SZ_1M);
+const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 = 14 * SZ_1M_U64;
 // 142MB client alloc for ~188MB total.
-const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 = 142 * num::usize_as_u64(SZ_1M);
+const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 = 142 * SZ_1M_U64;
 // Hopper/Blackwell+ minimum heap size: 170MB (88 + 12 + 70).
 // See Open RM: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB for the base 88MB,
 // plus Hopper+ additions in kgspCalculateGspFwHeapSize_GH100.
@@ -88,7 +85,7 @@ fn client_alloc_size(chipset: Chipset) -> Result<u64> {
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
     /// `fb_size`.
     fn management_overhead(fb_size: u64) -> Result<u64> {
-        let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
+        let fb_size_gb = fb_size.div_ceil(SZ_1G_U64);
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .saturating_mul(fb_size_gb)
@@ -110,9 +107,9 @@ impl LibosParams {
     const LIBOS2: LibosParams = LibosParams {
         carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
         allowed_heap_size: num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB)
-            * num::usize_as_u64(SZ_1M)
+            * SZ_1M_U64
             ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB)
-                * num::usize_as_u64(SZ_1M),
+                * SZ_1M_U64,
     };
 
     /// Version 3 of the GSP LIBOS (GA102+)
@@ -120,9 +117,9 @@ impl LibosParams {
         carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
         allowed_heap_size: num::u32_as_u64(
             bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
-        ) * num::usize_as_u64(SZ_1M)
+        ) * SZ_1M_U64
             ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
-                * num::usize_as_u64(SZ_1M),
+                * SZ_1M_U64,
     };
 
     /// Hopper/Blackwell+ GPUs need a larger minimum heap size than the bindings specify.
@@ -131,9 +128,9 @@ impl LibosParams {
     const LIBOS_HOPPER: LibosParams = LibosParams {
         carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
         allowed_heap_size: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_HOPPER
-            * num::usize_as_u64(SZ_1M)
+            * SZ_1M_U64
             ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
-                * num::usize_as_u64(SZ_1M),
+                * SZ_1M_U64,
     };
 
     /// Returns the libos parameters corresponding to `chipset`.
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index d4efa6376acd..8d424dd23a5a 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -10,6 +10,7 @@
 use kernel::{
     io::Io,
     prelude::*,
+    sizes::*,
     time, //
 };
 
@@ -33,7 +34,6 @@
         Architecture,
         Chipset, //
     },
-    num::FromSafeCast,
 };
 
 // PMC
@@ -166,7 +166,7 @@ impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
         let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale()))
-            * u64::from_safe_cast(kernel::sizes::SZ_1M);
+            * SZ_1M_U64;
 
         if self.ecc_mode_enabled() {
             // Remove the amount of memory reserved for ECC (one per 16 units).
@@ -255,7 +255,7 @@ pub(crate) fn completed(self) -> bool {
 impl NV_USABLE_FB_SIZE_IN_MB {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        u64::from(self.value()) * u64::from_safe_cast(kernel::sizes::SZ_1M)
+        u64::from(self.value()) * SZ_1M_U64
     }
 }
 
-- 
2.53.0

