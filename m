Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0239822D78A;
	Thu, 26 Mar 2026 01:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489195; cv=fail; b=TU897icH4gkw3WV2kwFnSMA+SR++hK7iwb2SGKbai1z2lnsQXj/gDqLdZbZZq+OESnOLEl4SSVQRfGfhpPNMxR2dHebNiaXGY+zQEpB0f4VF8GT2cYo+/dCRXBP5+wyxwOtPefQfYppzphzXGUvngQzpwtarQXAGWo6YNMHQPbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489195; c=relaxed/simple;
	bh=goQCWRqKqKLNPgamAM0ATF+zrf5Cqc5Ee55vGd6iECo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SDZKYHfjgeYQPs4pQISEEEkaW0QLINbNK1Dzsh2idspA9my7YmqcFN4qWu34IdaG2dk6iCFNui5YWyTXQJDSjx5cMgNv3CGcfc/ptm3zlCmMZrNHIK8Z+puDb+ZtOR/D+4Cipkf5YVckqwESjuX6AYDnOx8DDJAkIqasO+SmNpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OFNn4KPl; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OFNn4KPl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asWonZGmETYO+O5FL9ZYIyRx96/i3CW9xyMzFpU6Sdn2JcQ3a9y7AcHexC5HDil86px1Pg+aH5td3Rx8EJfmFiDtrO36DvPUav3SBV7uSOGtglCTjFOF3PEeJre8fPyCq+bpIdmogkrWcQrkd1grh45Dg2+Vaxy/IkZSZ+R8goRrLi+Hge1RePcgSTeqYH3J2SiYqWrpl5Ef9u4ymwoLotjGp+RdKEPgvWHi/4rCdT7+7MSpv5Nav6KU1DVqegRxomOzNXf1s4bGAbeldZqHzCVH1dk/bUnrP4g1G9ErfwPBjF6qRH9hvWouUGutyVtEDRkzrOlqiz8zxb0P5oNMhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8lsjK+T8C+VefcRwOof0e2gkcljba1q2sMTxddl5AQ=;
 b=WQju6u9vK6qMCS/Dm/KkqYITLqo37K35lc37SkRg0iw6A0Cq0Pp1EVl/p10LvvxdfFgxW22yORvDhLmCoUVD050ZNmSWNHvJ5okqz662FHkQiiZx5wEmAII/qlqEwG9cs9A535Ww4sNQJJCZkFoPVT2rTc+QMeZIVlBK0T0OMKPFfKpzNrwDaXBcdVkPbuUtXzWLokdc9RFVR/e8JNiA+ai1ag2KsqdLVVlrcbi4eaxlKs5vgZapHAsauUwyOUN/jJ1T8g+/26b3/Ay0A+7QgWAOrQqEnk+9ZG3fdoPfmNfY8MuGYOPMdpo2EyfYKMPz8vwBuQ4zYMNWXdOA971Zeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8lsjK+T8C+VefcRwOof0e2gkcljba1q2sMTxddl5AQ=;
 b=OFNn4KPlfjCld67hwW5ZmDWuLWnEO27IkIN5RBXDBcX/0+/VBzqY+oeZsKZgD+ehLVRl42prxv3W5F1dkR0GEGscz40NHL5vAdyNOLUBJLl6v+eKGoVXnwBgGDZusZa+/8Ju9Bcx+fwhYJT6531kIzKp1RSayNqZP4qBcWNkkEMa/4qYLQA3gDSiGRBJwrABvmiCaHp6TIC8pqsQ6aAtPKUaGDcakbzSOV7LZ5KJaWlkSLhjeqmKJuDNLjfUly7Ue42yxVTvITsYYYHKYKuyPticZZM9MNAco7Kq4krraIj51aCkvhLqxF9nNB0kyJ2p5M8W7N9YlOHv/OnMm4oCbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:43 +0000
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
Subject: [PATCH v9 26/31] gpu: nova-core: make WPR heap sizing fallible
Date: Wed, 25 Mar 2026 18:38:57 -0700
Message-ID: <20260326013902.588242-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:a03:100::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: ba4afa9b-e1a9-47f4-fed8-08de8ad88da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AhQqG75giak8BT5MbbVdg6LTRWxDXUIp/uIDAs0OPDvTlIlQvVD695pK2Y0f3d6Aj4tkXVwyXh0JIXnCDnYClw+NH50oia16hksRzAiVRiKb9nPemWFg20j5PNjH/EwzMwl+ifOHEeCqh3e3Czj8Nj+WyjoNjkJCPP2d1hbUh663O5X8CIf9PpphybVvB0clOBS3nHZW4taf92gygvh7Vdapwtf/AfXQAH1EeqGVD3BMt7SEtaYZQ6w4IuVQY3s6lAcZDs3CG3bdRcUolX1ss4rXXHhiM5+lXOCgxdqFJNtzlG9xg5gr+3per/nX72kyqctG7rQqXRt8pbREk25EE2EapLJ/csvbqxWUF+Cugu0Phrwa+5KB0Q9dRt8EHa55b7DaBBFXzqpqSI5QFRWE75AivbXsEhgcpe1naDfxkORhG25PQ+u3HzbkG3O++OCKwX/JnwrFNHo6DRwJijNNhGHXEo13Fjbb0oBn1ef7bIsVNnTy1gYoF2cjZcC1wGGGQdt6fVEoNV0T4UnC5BPAXfr0a6Ztx4wCKokC+3WtACiNMAgzX4ITmDPZdD2bi6dUl3Ida34Af8+CR40txUBghF3V2Nxj1uUe8c75dVzfVytfxVG0kbYbPwzqOJ+eMSyPkVooicxpXME2ALiU78/3zVGywDA0KXIH0OptGe5xMOksVK9K2EJdZ6VbIpwUYuS9OziwBc49NGkqadZeGc4NhgqnrWmStR6Vc+HVy7EA2wg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pKhTxnLJfBlLYf4gL0upMEdIWbEiE5x2M5dtNXaaUFI9clV1bwM1t8kWGW11?=
 =?us-ascii?Q?b6wrMIFIvEa3nUxG6k4ILQMM2rLiT2C7/KArNBBxc2w8MpWcn6UA0dCKUd61?=
 =?us-ascii?Q?ZMbAZWdPjTJoZMFT41+EIpz8zgO20hp8Qt3xvU5O03/fs8PQIJYqrYd1CUEq?=
 =?us-ascii?Q?OiZuWMQ5vVDIlmIq3/atak//Ma2HdJvfsseyxn0hTIgkQf074Jvs3toDfeRe?=
 =?us-ascii?Q?boAm3+roQ09jJ+dOLykB5QdaNRuguQKtL/MS372RpxJMiiaJvJKUimx++aam?=
 =?us-ascii?Q?zwjwlg99jWYthBid0s/z4zzLuRLNf/hP5Q1eagnfaJIu3voETlCj2VXafCVO?=
 =?us-ascii?Q?XfIwaN2nsZviMo4rp4fbGZACFVq/0UDSoUMLCIWWa5aP+wmOG4Tu+GVWdB9P?=
 =?us-ascii?Q?BY0kW+vhfjAr7Iu8b1RHwnVnUpfitgFWJxx4ue0q3yV7DOhPfNhYSStKiRjp?=
 =?us-ascii?Q?02XG3Ue0wSgEAeTgXdGKf/vU4Sv+l4/jt2VejqBwtLfoE9ZYu75gmJt+sdPU?=
 =?us-ascii?Q?Qlq8QBG1k++SLvg+L+xd/8MnlJC4p5ZybhFO3kl93vT6jzWNhUmwtSVQe+Qu?=
 =?us-ascii?Q?OqpRKUUw6ZSlqG9sm5kt6CMtHlMJsdX5fYPOC8VmQGM7OWG7z9fvxtmngarX?=
 =?us-ascii?Q?aQE/vrlGfjnGBEY8HwqQrWKIqnP4uq+uvWgDey7L66FPW2MLGMxaC6FK9jfz?=
 =?us-ascii?Q?EsYxKhmcvvSOXVHqMPb3bsla1W9OQWv/J9gQbomn2RgH+1W9LDUfwdHtdVQj?=
 =?us-ascii?Q?nYhsgp6PVpi7XQ/0oZ6cUZotVc+GmXbCHPOY0pepbotV+/knBRe/fyQ29dPE?=
 =?us-ascii?Q?EAahzH/4s0Z4cBO53vi2bUzVpt6dBWH4LCoE8p8tYCtqHdhIrJ4vFlk+HK4r?=
 =?us-ascii?Q?Xv909XfFp3xJTVw71WRzLQja+Zu747d9O6eUwdOFeECp9ouhhLqHuxLB6Iiu?=
 =?us-ascii?Q?rqDtOB2fF3aOH7MmYUA9DahHlZmXe9aPh+OpQEkj8VNxoTneMtvp8JvZdt3l?=
 =?us-ascii?Q?c/REdTt0UFcWAG/yo3+Rc7zpHpEDs/QLktPyTJzPJqE74OkMRCzAD+ajZaaj?=
 =?us-ascii?Q?/66/TlvLo+wTsvD9udkASm6+1WnpTzgjh4D435OY/ysQAOU1eBHLUgV/BCt1?=
 =?us-ascii?Q?8BlE/8nzrsKYZNuc3KFCsnHyUxlRwSKjCZ29SWNKZD714zlCCWrbAtU8v7B0?=
 =?us-ascii?Q?eNh1vD9eOncNTHZkdlSau1hnG7RqyoBVfMcs1LsjGSqQUWVGO0Hx12trFm+u?=
 =?us-ascii?Q?5z0HLJ4txpkyZoPmKBumJn0aACCB768K/n8iycCNSmYpk6WJaI0R79krIa/O?=
 =?us-ascii?Q?P6RHPHm+p2QelqbyaI/5zcYwJAyupMAFu2aUDkzEWEoengu+WzkClFpa8Yqj?=
 =?us-ascii?Q?NiUsDUT25P3XftfWAweRGavDPFMOsl+fjRuuRcOwPDs02AKEWReopgMHuQ2u?=
 =?us-ascii?Q?FjsRK5948IwzLcpRlOTcsr2FzgcUBHv5aPoFKakkjD0+4itxJTW55naXcQSs?=
 =?us-ascii?Q?HR3M/goaeV13lbwoYclMCoARt+skdf8xpepUboK6XQBvLVnA6MdSbBueh1OE?=
 =?us-ascii?Q?PlLUfkOLsgKVUZClxzrgnBur+d+C2UEDcJZmSXuZ7VLWk4HOu3jDkdUW2iix?=
 =?us-ascii?Q?k/J1K6uCFwtaHOdqwW/UBb1deKYL/FqbEcWkEkI4HfeLbFNcdy4bMJaRIlQN?=
 =?us-ascii?Q?AUbJRLCdp8n7+2qcjrHIf+PVUiokcvTd1+DRvIiaemqM5ChPHpYunyCJCJj9?=
 =?us-ascii?Q?yUhuLPywGA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4afa9b-e1a9-47f4-fed8-08de8ad88da7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:43.0745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKRKIT7QhQ8LkkGAgLE+Dry5TbwTxEmosmYsogZUrikxGYj4R+0T7o0x1YtxJGYC9dAfmuaMWgTQ7KvO7bKEoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

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

