Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1503264C1;
	Wed, 25 Mar 2026 03:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410815; cv=fail; b=Y1gmL/Z0p06l5lVj4J+o0R2w5K7gHYFCF4FSNsjdldlloZj4J+72LzklfD7CrsW6+LF5Yzbw5lhfOuvP5gCbwg/lrw8oXbM1mR6cuiW+At1V+bWWYRNs04atqm6cmHFdu9Nz0LEtybFebvxfj+65P+PuiqUA2M72GNKQ9trGn0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410815; c=relaxed/simple;
	bh=goQCWRqKqKLNPgamAM0ATF+zrf5Cqc5Ee55vGd6iECo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k6Eh/6kixewTzMrpCITRjtnehA7XGED6Cv8A2qgVUs+DSESKfSIilUfS1xNQI7mcOrtvVbn7wg/u95uVZi59SxbpwSE/t51obOeRiv9t+pmSQHUC7t3INI+C6SVZO93WUALQblXfkQGmtLdc2cIi0HyY4KvVcBG2mzrBtOXKzD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LOqMG4wH; arc=fail smtp.client-ip=52.101.46.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LOqMG4wH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/rShahcdqXlrxNfDk2Eq7M3yJwJMnHhyvmAo9Ep9LXqiVJu9l+oA8f2nJ37w147N2CC9h7ut7yuvsQ4chIWSexUVvr+k8yNfzwZCS2KR+FzlufNkpBpB8pmWSUNUxuXYL/e6soEQGj5eGhbKC4683A52YWPjrm+EQlfN02TFauj9YMlxAA04fxEbTGw5I0k7KKdYKb9bIYFsLzKejmoBMQMBb55TQrdyl9PthL8lWKK0vjM4UZ0oLMTK0+TNtSG6ADpwwqUc3FxBTzLAu9YDWej3g+3VeySUR4sIUA6pEHi+uCcyp1P0w7pro7QaQk+VJB1P9+47LQFsoQEl0n0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8lsjK+T8C+VefcRwOof0e2gkcljba1q2sMTxddl5AQ=;
 b=ev0bIDzsqJasBMV8/ygVo0S3gukOC25tKbiA8S+1y0ITIKQvCeIA8utKIOdyiU6ECeF+5qvCDqgWMDxlQ7X4kms3sGer5f+HimgG+sQGzk3yJMwxjYAvIqNG+myF5LDjo2ZvNXBpZtL+j3JIybxPFPK1eZEDaDsmHeGwT4z8V4YnOy2/SVsuHtQ5Y7HT9Zeqtwu5XRXe3Ik/pxqjmi0eroNmFooQLl7KkT6sb/nyK7u9dYreNaNi5RjoHzXcQq6EBDGYoLy4/BMnsM32F97PNvR/3QN7XbKx0yJEUzGVcWp+BlPvfotRPS6zeHndIbZ7i8p+ZQSFae7oxqwkM/iBlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8lsjK+T8C+VefcRwOof0e2gkcljba1q2sMTxddl5AQ=;
 b=LOqMG4wHCqmipnBDJG3Aeb/hQoe+B0oLhtvgEPEbCZwpHdh4P/WXS3nwh1aF3csUaSv65XmkbwCqhcR8VSfK0PFsYHJb75qaOa1TXswn5TuBBJ56t2Jhxco1B7oHyJ8QIi0wiUpBYwscW0mWvctF4clx7aWiVjumiCNF/eadz7a9d9BuwxCvf7qNXWkgCIYWXEMZVW5R0RszxAImufCmHzEfOrkbClivBAMscGb6KO4/fZj2f+tSHJ6hkZAkf3zcn3OKbwNsX/j3CS8+WH7JSCWxZiaBHjlo27bl43hjNTWaZrCthEtu3L7tJdpmP0qEzVG1bZMvu3fs3kbWeKh+CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:18 +0000
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
Subject: [PATCH v8 26/31] gpu: nova-core: make WPR heap sizing fallible
Date: Tue, 24 Mar 2026 20:52:37 -0700
Message-ID: <20260325035242.368661-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: ef708fcf-aa79-40f7-d4e0-08de8a220d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5as22SAV/PYwlIsWI46AqHpUaO7g/iZNCXeG/O/PL3V60uIZmNMrlgHmuYupsDLV9BtSMC+Im0yL6wMnfaIWRUMM5+JXtk3folOgD/RgpZ7BwPu/8E22izUIn3+a5TdqkqOfq4I7GWrFm575I6lv2Hg10EnYZ23zB3jVgSEhAhcqWuEPrjwYwdTMDviHKTfgoZ1oHaALpdsgNvGTOIcJuczpJJsM2vSZFyarlbqlsUMgWuJ9cNJpSVvtJsMZVqbL+c5aPOZ1hygX9E5KImg46IWQCUhNUN5r9JO/cqdxJ23dOE7SVgsnkzi9Uuy4Jdt7ItT9Z1mmWdIkn+2yLBAjze4PMgtXTpG4YoY70hn9GdzgtLO2klh1+kaO5NglXfsL6gpJtioHMsNJCkMo7wlmanEe6kF0+FZIaiUZq2aYAb4VSZ8CiOujsiG4g5giSc6pjnes2mddshThZGS/dkK4JnVBygCG0kj8GdFLwbJbsiqmNfZXAKcKoX7KrYtY8lwTb2uHtZrtfAjwZiMxNbiQ/V4iHMOZF243Qf608VJJIujkWkf1GMaa3NN3fhp23WQ/pbW+OBKta2IzmR0HuuB8Ag1OP9fyYhX4WoRtdV9IF9/zN2DC9X6zD5coqhXElvTgRQZk3KoV4tv3a4ncEIlMsOE0j3NqNXMzCN3k5JM8lNuKzXPst2JLCSZgie6o2xU2xsPF5ZR+PL/EReXF7b/IXIi5zP3PxWc4Xi0MkKgbQlQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QAbBzxoFoxxSmuWoG4sJq2IZXtOAAxqoNCvTmdH+HXXCtzPE7P831aCqGKaU?=
 =?us-ascii?Q?Qkx+w23cq6urA+eVQGU4MWr8cBWf3q+67rSUTXw47SLF542NX03j1N7zzcDW?=
 =?us-ascii?Q?l+cySKzyaP2lppYTTZyphVww1iiNefQUEXODQTyAEgKChftQe5x6Bd7PuKBI?=
 =?us-ascii?Q?2rG/Z9e04mi10zEo//SDO4fro+yAu+nGPdu3WDj0B5+/J0fMzXbGIPc+pcPR?=
 =?us-ascii?Q?rK+UtQz1s+gtFJTClHKtS8iNvX31M0BuaSmJDGK4G6EEQRowSiWQ1rChZ2LV?=
 =?us-ascii?Q?1mFd0XcqsOMP8X+czRlM0mWWF38VqkN4zFsNvwM8WzzV1Z1ASzxFgBu483lB?=
 =?us-ascii?Q?PqjXXdYBBSq+NUqapQc57/hg/81RbBQHG6zKS/70/E383D62zsuDUdHlHUmI?=
 =?us-ascii?Q?kogbNqOLr4KSke4oUJtGDJnZOkAaiju9RtMEZ7zTfk+VsKV1RmiV3cl97fmo?=
 =?us-ascii?Q?AxFU4OuRTZMpZzOrjW9JJYWXuxzKxwoZHIfq07/V1X3RkuUduZ2veKpInxFO?=
 =?us-ascii?Q?XBfLiKWBZoGaMWB6NRfGuIuxR5VEHR08iDhwRTT/VA7UAbKyS7JNnHECBRc/?=
 =?us-ascii?Q?2oDrF4f9FF1+ZfguUfyMxbbFK3QA2v4wmUiV61xasX1Zcx7W0x0tLSauoB8l?=
 =?us-ascii?Q?JLPIskXOZ8yvwonQerPiSJH2p793VsaK4ZuYPmDcjH+wdMyCwh91+LmEKwbq?=
 =?us-ascii?Q?3Gwv+TGHU5rEviDCk6cRjgWdEGeyW3635nHnsJFucF3Qp+ZAWFoPQ80QbIyR?=
 =?us-ascii?Q?ZLtmh4B+braXtYHNiNljTltlCDx943YMr7CI4RcosVkCHjtUH0dQsRKUrASn?=
 =?us-ascii?Q?SG0tkv3Bs1wlcg+YhceL33+dv03rqXryJTT2gRo0p7B+x7J9w82CYEeQtBAy?=
 =?us-ascii?Q?GbfoVuzBcq/KclL1daM/E4+mbICfMjfg+J14K3pHTmNzGv/zA0txCgqFxthP?=
 =?us-ascii?Q?nw/LbZO7srxkDOVuy9s2NL4r6Pjr2Hn2BHVAfjp5znX9WRMu+661zS6Mt7DX?=
 =?us-ascii?Q?NFWMz/2X+YWTw2Qfd5PCVFjGGI6iF9l0ueYCrZ/u1bT/qVJZRNktQreRPpvd?=
 =?us-ascii?Q?XI/hK6J7DpyXX8wPj3OThha/McMGX9KhhkTbaEb2XokkA9Ln+hYDVDdZRTCk?=
 =?us-ascii?Q?WmJjZSZYhnNHCFnvGO4B0twO0n0//r4plmn1RjQJWcOMztFWufjKZ4D9mLjD?=
 =?us-ascii?Q?SyMGmh1dh2hlB3Pszc+V9ETz+RT9SXghuTDCPF+vtmPJTeQpAdYGOoSYBDbI?=
 =?us-ascii?Q?TAf2nlmNjJc37y5C/vmg3/bn0XAuGI1IvWCNsFcxBZdWzTiQLZJBSPf5UIPe?=
 =?us-ascii?Q?d/v5Y8BUccZ86pLDXQxJQFnClan0L/wVghphTKH5SW+NJfHlycuBAf4DcSn/?=
 =?us-ascii?Q?wpw9/WRkbRL1ZrKanPO66C4HWDLVYHhEb5W0MIFzawMz/SXAsR0itH2IhqMP?=
 =?us-ascii?Q?X4HB8MxqzPmwEBq6gJYB8MQ6aZWXkb2iwC0z5F7C8DiQeMhQmePcTwIYx/wl?=
 =?us-ascii?Q?3ZNVyPedTXU0wurrvm79FbATboXysCr2ZPahJpYXebzyhjWRxLkDZTYhdTrS?=
 =?us-ascii?Q?dxb+DgKP+Y9rAjTgGzMfTbCAimU45Qdv6oFegg3mRCb8EZjqItD44ykd/eM0?=
 =?us-ascii?Q?IgJ6HgrHopXPH2OAgw3yvim9+P5moq0NT8TYypE9DeS0wI863YeREjzZXEfN?=
 =?us-ascii?Q?usvVbRe1FgjGdQyefwkwXSjs1M0lmrekeDOPFP1OkvPakB2MFl1SKcQtpStJ?=
 =?us-ascii?Q?8BGQpB1cgA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef708fcf-aa79-40f7-d4e0-08de8a220d0f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:18.7214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fL/uwiVk0xZ3JCSxf3eYrkyPDJbSIs5QMXaovvuWPiV7WldQULnbI5WFhae8FH2Jjmf8z5FiKYjWF6u4XgpWMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121

Make management_overhead() fail on multiplication or alignment
overflow instead of silently saturating. Propagate that failure through
wpr_heap_size() and the framebuffer layout code that consumes it.

This is not Blackwell-specific, so keep it separate from the larger WPR2
heap change that follows.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     |  2 +-
 drivers/gpu/nova-core/gsp/fw.rs | 16 +++++++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index c12705f5f742..5943db2b619b 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -247,7 +247,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         let wpr2_heap = {
             const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
             let wpr2_heap_size =
-                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
+                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end)?;
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
 
             FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 3a76d24104fe..c510a9cea3ba 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -125,13 +125,14 @@ fn client_alloc_size() -> u64 {
 
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
     /// `fb_size`.
-    fn management_overhead(fb_size: u64) -> u64 {
+    fn management_overhead(fb_size: u64) -> Result<u64> {
         let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
-            .saturating_mul(fb_size_gb)
+            .checked_mul(fb_size_gb)
+            .ok_or(EINVAL)?
             .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
+            .ok_or(EINVAL)
     }
 }
 
@@ -174,18 +175,19 @@ pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
 
     /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
     /// of `fb_size` (in bytes) for `chipset`.
-    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
+    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> Result<u64> {
         // The WPR heap will contain the following:
         // LIBOS carveout,
-        self.carveout_size
+        Ok(self
+            .carveout_size
             // RM boot working memory,
             .saturating_add(GspFwHeapParams::base_rm_size(chipset))
             // One RM client,
             .saturating_add(GspFwHeapParams::client_alloc_size())
             // Overhead for memory management.
-            .saturating_add(GspFwHeapParams::management_overhead(fb_size))
+            .saturating_add(GspFwHeapParams::management_overhead(fb_size)?)
             // Clamp to the supported heap sizes.
-            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1)
+            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1))
     }
 }
 
-- 
2.53.0

