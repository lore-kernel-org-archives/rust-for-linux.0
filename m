Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B93466B66;
	Tue, 31 Mar 2026 22:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774997020; cv=fail; b=eIslbaLp/Wkn6f1PisSTgEuFupzhEi6rOEnGbN6KuXGnbko0y9kHc+zx51SjjmTVvVC6emhTAcsKUbxgqn8yYqBG9TuHUITwwQLRJHZIXefTgo7/nL6sT2k7o2bTrCmj1sojaJKpZ6V1szAFFb1sgIkFy98sY1bPDNC95VRNRLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774997020; c=relaxed/simple;
	bh=JcxDpN1L5QwVE9z6DM6ResTlnZBmWCldSwSmTPu12NU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pPuz+uTjSPtr1CIxm5m7Z0HLWJVEnaZREFejSSDcYXBKuOpGOBSudjt3IuFoQ8/9wvzIhWMC/lqgDiBmjPZ/e1fZ80kVidIWk9PrfoPgKeiOZn5DtgGpxonq/ICH+eFpQFBFmkhyAybbbmicQiNPOvX/AHgSFdNahUQpV7QHUU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WY8E9eIa; arc=fail smtp.client-ip=40.107.209.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WY8E9eIa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdblP82HQCcYYtmREP8uz8FXCcM5SWacStWcrJckt1Kv3zcJ00wlK4arh44zFJfzeNtoTjUxvLEIJh8/BwDIgZ1WqNEmdHh66hje/+X/ynn9+YJ+BSt6GqxmQT7Y+yyDIJDf1Q088JIwf17qr/1pHiTesoqMV6BDGxrUuIx1HIaCaqVI1SCSiB1VoL6eBxjOXK6UrBqHChSidq0u75qcqBr2+40XBGQMCe/PH0E+tgvfHb4UsudcIrpzi3nWcWhfj7uuwuRSlaSKQfddiOv0QAJLWtrkuOtgZarGmJF4c023f0J8HxodrvjMPZ2jHZJ5Od9igM2er9P/9L8WiT/7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I35lE7w3aDiGDUT+pAeFheZd52Z8g27WNqJqcilgTnQ=;
 b=rtkIjir6z9WouQ+vstuZL7ottvaxszwPLHOrjtfCKAWHVOGzvDADFSizMpAEN3U0Slg0eBHwpTpOTLAoxhZ+i8gjKkK1MvBCELWBDBE0xKeGXv63bwjNEAwC4Ha5ugj14k1S3FJnKWRml2+cnMhSZ9Pqj4dCJ7i+o4JvyAXGsy8nKESc0lWa1mKDSYpC0NIbCDgWjGpURu654GRLMVAZRhFGWwwRnDkoa0L974PgejsXpMMcyvwpGQ5BKr6DQQSQ7j/eAtJ+foPCrFRHKodXZ2RzkwT5a9hBlEF+BCNWrvhWIIdSo2b67R7+B+sRqa4f7yBKj9Rt5oPlxoC+/MLZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I35lE7w3aDiGDUT+pAeFheZd52Z8g27WNqJqcilgTnQ=;
 b=WY8E9eIaXRiMxbJdoMliIAq+MJ1ABEJXr8ghPTFObjgQQRHTSjRuOYRK8mCN0ZMo2I2d87JH8tHhruFBdaCRAM7zAEpJRtZGqQukLV4ZkvT7r4dvKlW7Usztb0gYEBOzItLLWagrD+inRg63H5v3x7UNYamyFFCNYNm/7xd72UEAhfU6IjXHoLpyDqgBWhi3dCsZwlewEA7+O7euXmogSAh7vG5CVoynZu0O2eZHL8T78t1xSbs+ODtSRwTpF34sQDfaUF4h+1Gxiq51n9gJiYrvka4yCr9Eh5xeAad6m+LhCnh+WZXSvWprIU5i2a0w7C4k+cq9WQr5FHfbTEeowQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 22:43:24 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 22:43:24 +0000
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
Subject: [PATCH v3 2/2] gpu: nova-core: use DeviceSize trait for u64 size constants
Date: Tue, 31 Mar 2026 15:43:19 -0700
Message-ID: <20260331224319.107082-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331224319.107082-1-jhubbard@nvidia.com>
References: <20260331224319.107082-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be9ec1f-050b-4218-ead2-08de8f76eb10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	26my/tL4XIgsnbn32JYdyVl1MZSr878HCkhV+aPPzAIbXLG+JcVp9/mx4m575vOethfTvqizT7LhyWLAES01E1iS3khfr9Pw6p0D4BHkZdtV/1iSJn5aQklAksSMGFCApTXHvWdsnZ5NHilPdT0Aer5/sHNS0q2GgYGR0Gl+c587eyQtSrcS/Yc4KLutUNdQnfsYiQ7tX19CRhx6u7qTzpCvfHtI3pldpNQvcSd1k2HK78eNJdIFAbMxZywt2wRaRSoFL5EyKHOKDpM/yWODnUHdkJx7YRfjW2DLW/U03HwKPfcKrRo7sE8cJjJ7Rl2HRsYSEiIN4ONHQL0o3GlmJHnJ5bZwQ6Hot7JNTe5lYQ+PgBGNCvdNPBNxGATKHc580DX/wGcl7g33+TUqaNPBIJwtWOSvVw6j8Nxdm2Cj7bPDYRquawNXnJxgz29eFleuv26jeWaUzKIh3RaiKWmXdLXCQYeo6SCpxENi/XLHwUE+QLXW3JaK7dzD67HElqhavED/PVMsy46qGh2+JnBsIuf/wg9N9O8Q3x1t7TJMCOkVkE0Z4u1lBMC4vt0sQDQVDYsXHGDKPsrSYce8L/Ic1hNPHoPSBYQ1lyEMJKW55T4YmSpghCLJFw7CjzWoUEUZInsDRyMrZb5pKBLxhh0h/0ZcsV2XudkVC/JnmeJJBZGWZEKe1wFhe21U+6tWpfqjUYkRzwO9IPIUqE/bh9j/UT7r+KVcRFfxkHwiWPTaV9k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZsNGqwLL19NvAkZWVMLPjTjlg0B/ZRwKLszBp3LJeU+GQGRBmsp96QtaSxTo?=
 =?us-ascii?Q?CvKMLXLGbY6hOYk4De2f4Vts2qhrFoHnG+CpZMuOzkZgdJXvxH1UJfAgS65i?=
 =?us-ascii?Q?h9wbyPVM/2MyXhX8UTDY9ZwZTKcKqCmIrEesYs+7a9HmK+v+iAoOiBEJ9uLA?=
 =?us-ascii?Q?2xpjy6yzJYpfvsEoopFBhgsS8X33c3fGZaLpW8NUHbu3kyOQFyESvUXdz0MG?=
 =?us-ascii?Q?j4QznrTSuWBS745bgkT3PhTKbV8RlGFtTl56JAEcrl6CafwPEAmDVTuIua+5?=
 =?us-ascii?Q?fyNGv4olp9OjoS9+vXz3cKbSEufxIdArZTA+z58id9w+1H7i5wEy/BRhKQty?=
 =?us-ascii?Q?0q5H86RcQLBD7VzB24gylhGHGrXtIcmZMHK24AXUgOX/cE/yBnH0ugSkUGSR?=
 =?us-ascii?Q?G6y7bbIhSSgcxtkUPVpchsgEn/yaXtsjKQjBeFuBkG7cyW3qbzzNJ+KMZHm/?=
 =?us-ascii?Q?/EsIP95X7ju7HOtEoC5FkCDkcWk67es9j0NplKivm6KhyBhMRGzDMnuKY6yD?=
 =?us-ascii?Q?iJcrcSE7vxmyAgxMmtpQh6dAC3OQW6K7CvzCjubE/tRCSY3pMECoSWGBtPYQ?=
 =?us-ascii?Q?AVqVJdfbNfuyQOViNbIIW8SAo8wrJlqYENQaYAKAVHy75ulmtkBnkUEi9gDO?=
 =?us-ascii?Q?HOtDtJ0DUSMtMQDjQPEsiOfHQeRy16KZecaA2Q9pFH/oanfZRqC3D6lboIwh?=
 =?us-ascii?Q?oou/J4lznX5YeK4qs7OjN4On+2leG2KN2rATTRjLwG3F1nR9QIQtBRE308hU?=
 =?us-ascii?Q?SQkRm1GdisCPQ6JwsUBYVvyNZ8g+CwAtETZ2+4kO+OXQZGrLOG7QXJ6yX3Y/?=
 =?us-ascii?Q?mb26qu3Nv5hiA8Ay74F+iWGbpwj3DY18LDpLBJOKZityOO7T+xu7JA34xsb4?=
 =?us-ascii?Q?FPHP2ifHCUbaBrco1QV6mKS9Q4AVISt530FvsdtuowVL+qt0JgYJ8SoSkXLa?=
 =?us-ascii?Q?wdSVFG+uEZ3GBc+tv+JIcfdRmDze3sSNLqcJMhJRd1EmFcjR6dgcoxaUoNUV?=
 =?us-ascii?Q?Oyz7uk8aaHcmEA4BJHPW7lmP/YRkhisObNJ20Q9emlc6RHr1q7X11HwnHpjG?=
 =?us-ascii?Q?4uCMQFnVzcfpgqE/2r7Gpk90d43pq6EOWK9mQgfr55ByHj5UKyRiHg8pymMG?=
 =?us-ascii?Q?x2ytg89agspaxfSX4z6VGtsE4HfuJ/PHk7VHc0dzvhE0eKy9C46E95b5Rs2Q?=
 =?us-ascii?Q?U7soYp2hysxNldnQa9lrYnvX+fpt1+mR1wUBmA9pW6Gl6W1ZwCa4yC1uul6U?=
 =?us-ascii?Q?IZIxVmZknUIES6kS+qbpRYqDJzolutmqEEPHNWOqOpyZLvxkZ3ZHllOIuFeZ?=
 =?us-ascii?Q?8QGusk45OJCw//7cb7h5BfXgq51+swKp5MbDNhGK+DX0NS/ryRLL8u1QBsYc?=
 =?us-ascii?Q?nWK+WMeqBCRw5Eq/CKVgX7BS0+i2GuxeBtI3Q74JSQM63tU3ap6K7lfpGVRg?=
 =?us-ascii?Q?P3lDlVzfKiPRaOvUdeW7FLbKxIDfo7yTSKS1kfYl+yq11JQCEAw4LW9Wpl4k?=
 =?us-ascii?Q?6CuvC9WZjVbkMWXA1HsDKcJes4Pke4O4eyNFbTxZ8L0HBxYF3dO4WO+Y2YDp?=
 =?us-ascii?Q?IuqnBKj7CkxLFpVOha35Uw4k1P5oIaEVRnyQJvIqdDv30L2qbp8P0U+hZtAa?=
 =?us-ascii?Q?qp6jpC/UNpZIBpvQ/jkNjv+5emFPVUzt9g0PwmHu/rIMcLR4sQBqERJUjhPw?=
 =?us-ascii?Q?r7d6iOCtciqvhSfhEkXLEo2FWoi01l6PIubgZb/cDK/e3o55SHFCTvdiOyIp?=
 =?us-ascii?Q?pb3uDXUUbA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be9ec1f-050b-4218-ead2-08de8f76eb10
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 22:43:24.7675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SioKoRN9hea2QHgpJCo/qhRzFIy95le5du2tYDmiio4Xdp6vbCsL9yHJw3DfOjSgXpMP/AMnyM97KaSyqVbbXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

Replace manual usize-to-u64 conversions of SZ_* constants with the
DeviceSize trait's associated constants on u64. With the DeviceSize
trait in scope, u64::SZ_1M replaces usize_as_u64(SZ_1M) and similar.

This removes several now-unused imports: usize_as_u64, FromSafeCast,
and individual SZ_* type-level constants.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 21 +++++++++------------
 drivers/gpu/nova-core/gsp/fw.rs | 15 +++++++--------
 drivers/gpu/nova-core/regs.rs   |  7 +++----
 3 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index bdd5eed760e1..5c304fc03467 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -24,11 +24,8 @@
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp,
-    num::{
-        usize_as_u64,
-        FromSafeCast, //
-    },
-    regs,
+    num::FromSafeCast,
+    regs, //
 };
 
 mod hal;
@@ -127,8 +124,8 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         if f.alternate() {
             let size = self.len();
 
-            if size < usize_as_u64(SZ_1M) {
-                let size_kib = size / usize_as_u64(SZ_1K);
+            if size < u64::SZ_1M {
+                let size_kib = size / u64::SZ_1K;
                 f.write_fmt(fmt!(
                     "{:#x}..{:#x} ({} KiB)",
                     self.0.start,
@@ -136,7 +133,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                     size_kib
                 ))
             } else {
-                let size_mib = size / usize_as_u64(SZ_1M);
+                let size_mib = size / u64::SZ_1M;
                 f.write_fmt(fmt!(
                     "{:#x}..{:#x} ({} MiB)",
                     self.0.start,
@@ -186,7 +183,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 
         let vga_workspace = {
             let vga_base = {
-                const NV_PRAMIN_SIZE: u64 = usize_as_u64(SZ_1M);
+                const NV_PRAMIN_SIZE: u64 = u64::SZ_1M;
                 let base = fb.end - NV_PRAMIN_SIZE;
 
                 if hal.supports_display(bar) {
@@ -196,7 +193,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                     {
                         Some(addr) => {
                             if addr < base {
-                                const VBIOS_WORKSPACE_SIZE: u64 = usize_as_u64(SZ_128K);
+                                const VBIOS_WORKSPACE_SIZE: u64 = u64::SZ_128K;
 
                                 // Point workspace address to end of framebuffer.
                                 fb.end - VBIOS_WORKSPACE_SIZE
@@ -216,7 +213,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 
         let frts = {
             const FRTS_DOWN_ALIGN: Alignment = Alignment::new::<SZ_128K>();
-            const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
+            const FRTS_SIZE: u64 = u64::SZ_1M;
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
             FbRange(frts_base..frts_base + FRTS_SIZE)
@@ -256,7 +253,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
+            const HEAP_SIZE: u64 = u64::SZ_1M;
 
             FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0c8a74f0e8ac..5745aa50b00c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -17,8 +17,8 @@
         KnownSize, //
     },
     sizes::{
-        SZ_128K,
-        SZ_1M, //
+        DeviceSize,
+        SZ_128K, //
     },
     transmute::{
         AsBytes,
@@ -123,7 +123,7 @@ fn client_alloc_size() -> u64 {
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
     /// `fb_size`.
     fn management_overhead(fb_size: u64) -> u64 {
-        let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
+        let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .saturating_mul(fb_size_gb)
@@ -145,9 +145,8 @@ impl LibosParams {
     const LIBOS2: LibosParams = LibosParams {
         carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
         allowed_heap_size: num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB)
-            * num::usize_as_u64(SZ_1M)
-            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB)
-                * num::usize_as_u64(SZ_1M),
+            * u64::SZ_1M
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB) * u64::SZ_1M,
     };
 
     /// Version 3 of the GSP LIBOS (GA102+)
@@ -155,9 +154,9 @@ impl LibosParams {
         carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
         allowed_heap_size: num::u32_as_u64(
             bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
-        ) * num::usize_as_u64(SZ_1M)
+        ) * u64::SZ_1M
             ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
-                * num::usize_as_u64(SZ_1M),
+                * u64::SZ_1M,
     };
 
     /// Returns the libos parameters corresponding to `chipset`.
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 2f171a4ff9ba..28d69e33f7b1 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -7,6 +7,7 @@
         Io, //
     },
     prelude::*,
+    sizes::DeviceSize,
     time, //
 };
 
@@ -30,7 +31,6 @@
         Architecture,
         Chipset, //
     },
-    num::FromSafeCast,
 };
 
 // PMC
@@ -150,8 +150,7 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale()))
-            * u64::from_safe_cast(kernel::sizes::SZ_1M);
+        let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale())) * u64::SZ_1M;
 
         if self.ecc_mode_enabled() {
             // Remove the amount of memory reserved for ECC (one per 16 units).
@@ -241,7 +240,7 @@ pub(crate) fn completed(self) -> bool {
 impl NV_USABLE_FB_SIZE_IN_MB {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        u64::from(self.value()) * u64::from_safe_cast(kernel::sizes::SZ_1M)
+        u64::from(self.value()) * u64::SZ_1M
     }
 }
 
-- 
2.53.0

