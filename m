Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0953FD125;
	Tue, 17 Mar 2026 22:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788084; cv=fail; b=lcYr35WNRlFEZuEzPNtuMZBhrCr5D+rN3Oi5K7NMBVAjXCR1jCqjG3do5Z1mvtxKsxlnMj16zP8zMnWLvhfpEToLfS0JaF0S/5R+hN1jl56qtC0VaxOLnx5CNep0Gd/oT5z303t3tFXbmJ0DRlJA5JliiOvEatyOv/ye/B3yzXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788084; c=relaxed/simple;
	bh=dW6hgLdw/5hpqM/XtREXFt1qnjVxpCzZW9VWK8wmYfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uCiBF52EOIh1IYyNw3Xjw8yMU3GQlJMwoWf+R44MCmNGxLZEpvvRR2r6vqZ0ux9OEZYlFuK0L6ATju+axi6yS3Mw87ECBCDd9sOvt9qI8H9R7FCxptCuek3wjUxaI5GYCnvHjG1zSgkbPHEAUuWHu4nv5O/c8Q8GZ4DR++1fNXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XlZ39wJB; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XlZ39wJB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3DAc6SrinUofHHN3nkjOd9GpttFA34dbvW4q/C7QIuAITN4kUFJrkb6uLyNpsgy4R/etu4YkZGgq5AKypnHtMdiuGWn84crXDOEoiHtO0oBTK3brjzYJECUsL84rY9NMeWjSoC8JFiQiSW7dAwJ5HPVSQCKLY5wmkGeI1SAv+HARWqusDyfXBPZhA1Ap1De0zAJd1UY9cfvhiz5wY4z8a+2A2IRFSYSrQ7TK0RU2P3gpP55WvO3LXV6Gd8s9jXio5n9Q4Ar2NdyYPJ97srvoVonf11CfCobxxDvtKbbJxRpmZenRaDqLLZYasJZHyW0kl49EvrhVGJV4VHSJOj36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jy1rKYFZF4pBkw7HgyarP3PH3DqXDFr8693LusEado=;
 b=Dw9vNOm5R3Wiq0yKct1MsCxGYmFqFImiwG0udzZ8l2fer67/EDSBUqfANvKxaJkGqroCBWNndFuVdi9I7lh7IJNpsriKUErynaqaZEQqtiYBIk/NpdiQgOAxQVJ3mRYkysfbI5Z1CJpOpbxovUyzwgpXa4OQJ/SE5AtnCk/3uvuqJRDWdWo7KELyqsLP7OidTCV9llOgW3zrLqHzjBbGFmFu6yNXV3/362G/N6h/olmDsfWVa1ZUwCxSceE0T/IDBvKEzKpcUgn6cUITs9z8zMO5wK6yxTyJkCGsTQ6dCKfPPZA/9sV39lZd/lUG7xT/LkHPQxYjvUKH/qt/2eqUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jy1rKYFZF4pBkw7HgyarP3PH3DqXDFr8693LusEado=;
 b=XlZ39wJBeDWmkih2/07Y7oRu+nHqOQxJnHEQtWz6lPnzDkziGwkyH203esddPFjrFeLzOCPNprHrKdxRsgKnroSw3zeUKMsvLqnY+2TwBDYTuDLgqzkd6nVgbCHrF8MB6/3NKQxZmCT7xHO41acqnb94zljDCb+wzZLP8I8UJ7cBR8GhSXLMeenv5B9/ELSpHNAvtg1fJMZBg8sewg+GfQ3GvuwIx6ys5dwkG2nyjL9dxxq6IDM7pZwtXZYaZ6AQ45NcvbxDkCPYLK/auPUXxxrEK58DBqeC/GV2pCz2PBEq1n+dNHgZNMRBje8GNBSeSxrB4GXHhVvaSU2UnhtYYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:54:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:32 +0000
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
Subject: [PATCH v7 26/31] gpu: nova-core: make WPR heap sizing fallible
Date: Tue, 17 Mar 2026 15:53:50 -0700
Message-ID: <20260317225355.549853-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0041.namprd07.prod.outlook.com
 (2603:10b6:a03:60::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f3982f-0fd6-4ff0-9410-08de84782758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i2HdMs7LQMmOVydSTxIsk1a2TMpyBKWNn9RgTRZOp0RBS+y+ZWEPQHzfYWRBFwUtxsMo/up1ifIUd5g4hht3tVr3AP/rl35rdzsDhskuFBQuw7jUee6Rtc/ArJHj6BY9kuKKJlKK5GOR6dOxIFh5htbloOA6UewCOylS6YW+HAu0ZsUh1g1KdgeuhrQh2InrS7ncPQsFkjmrjR+wDnaoGyFT0xiCrfX7sS3ha/Gkn4BqP3Ub5pCr+W1i6HPiv2aRjsV7Q2bhgxZEPT5ELo6z7KBhdyQV26WIOufh7a3CivfK8rRNYangNmXluZnj77U7Tsai1ZXHHyhssiB/phh+EOvnYHwN+p6+6Xv2UNlP/80SHdtgYp2tVWOM8+0q3HSGS3weUrDkpPBewf6W/yD8U29Is5pL8XMTNBvrYIiqxh7Qhy4S9ngpmP59MgJh0CHqvKyrO5ARNjsVJGVeUhMIgC6s1AsAB0dCNUKPiwe/ZvlK3l70GHgDuCZWnRQmMKRthS4FKApsuzBcOplcrNno5ToLsRtpMFKAGuv8TkVJeqPRcCdwEoO89psi+JDw3uR2XCfNxOc2pctvN4yBqNIa6ycO2uxB3YH7Kkn6g2qkFs7jrsRPygrayNx4Lpn1p/aO3KQ5OSyzYnx6ExijsUtRhBKeaUIqZofX/nMufwUd4B2YOrWj4V4KRa3V1pXZ7YF2iG1ZYHq6q1gw7i0s7rSC0S0gS8ZVdWc2kXDshQcznXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KRONTp2u/ynsNK4uybK4osP0/XPIK41JGD3/hI1nbKKtP2OacYFa3nLpvwc2?=
 =?us-ascii?Q?yPp2c4ebuqBAShm0OTUF7svIETEEJrwABHpkqWlgCTK3yX0Bbs1GKR1z/W4f?=
 =?us-ascii?Q?akAxtCBLHKPLj0/DX9SyEkmSwp97CiNlcodH3BHPHuYEHeiTZ+8rJjVhXHC8?=
 =?us-ascii?Q?YV2F/XooUY2hNrBudN6PmGSN2ZOCQD+L+1CxeyrJAFjYFfC6y8Wu0f2hDMEz?=
 =?us-ascii?Q?hLsszfCFY0O+YRe/2RK/2cWhCxxioVt73TpdkcVD+0gkrkfjbxEK+n10l29S?=
 =?us-ascii?Q?8Jd4ok1ybT1NJjL5Q5+w4n9V5lF9kS2919rBB96qti4tJUXT0ScLXkzE1CBu?=
 =?us-ascii?Q?NeSNSM3OkapNXGaUUIZtZUkzE3Zjo6CKwPyOzbs9NSih4fCP2fCEmgprKslx?=
 =?us-ascii?Q?luDjtZIdpczIhFv9P/b0nmi7IYlEP3RWZVVp6pFwW8LzB1peYjnYn/kefG0I?=
 =?us-ascii?Q?cDjv47o/cRTyaphI5xsrfAt/URh7DvJe92Lko1P0hZChrPgiZf1jXnxgcRSa?=
 =?us-ascii?Q?4FRsARBqrwmx0yyL9pDKaFhxBfy5ZzcfxXl2ywOwSOPGWQLKyPr/ht0dU2gS?=
 =?us-ascii?Q?6C7JXAcligZ631X+qnKY6qWy+PS4DCz2ccqyrfpOv/eP+VXLKFNNKctpu5gm?=
 =?us-ascii?Q?l/ySPwkBc4wohcrodWZFSVBHGFemtt9avgCDH9pRsnI0ACGgqcLoOw2DwO2g?=
 =?us-ascii?Q?PWdNT/moXd64T2CdN/mcNFJR3z5QRf+pVsfhbRNRfmn9vWW+GWcWFQItp5uK?=
 =?us-ascii?Q?ucDotwwjZ2mapfv3oHnIrZ7woZyRUrTg90AmwYZ2meKidpy9Fwe6wia5HDCy?=
 =?us-ascii?Q?6BUQQ8ZpJsGg6luAtbPBDFlCDL6WKPCeymb3uXtDBdS1oXtifb5LGDrFswcC?=
 =?us-ascii?Q?a8zeIjyK07SyfKI0FZV3J/3EE7G8HJ+rjd2Xshbc5XjPmK/i+pUV7lqhUa2F?=
 =?us-ascii?Q?6Rgq6pFqyJ6mQ/vXF9OJ23SEByMbyXH9v/Hp0GNxqEyt7jj81GiHa7zK5gk5?=
 =?us-ascii?Q?z42tMUqa1SetovQE3LUGJ7VDPf/j3bhJ1R33yKcW2K+gD0q5dMs0srTDX7nF?=
 =?us-ascii?Q?OpVrs1t9wzjFsxLO8pN9NEn7TzdZ6SqQEThJyQ/GMZ7jQt4Ah00aYy4kuroU?=
 =?us-ascii?Q?cSuH7QCM62cVAKfWebLdwJJrtXEGOSywwGDZEUg9+ZvEoYLfHLhMLndrpGnE?=
 =?us-ascii?Q?PzY3n682YmfiHydBG/MeC9p9CNUZhwg/LT+xbe9POwJqr886CejlKhKyU1Mj?=
 =?us-ascii?Q?/vKK8dKZcd5Lj8xMIQZwa77K8RG+M1QWOQ6fdBiSvq+yNTjND587dzGeRovC?=
 =?us-ascii?Q?xejr3mtafc4uO9aXFOB6KY410BFJY2XcxmcRKHySSZ0IUxIN3MeoUUCXGKwc?=
 =?us-ascii?Q?imFIdsuxSumUbxGv7si2JRKZ6+kEZ5tqk6F+EVT2l27KjWKwOBPWA6qJ783R?=
 =?us-ascii?Q?rzLFrzfmGeoM2ciFRq6ei3z4Qh9rGPiCZw6MuSZq6olQQ7R8J7BzSddUDqsK?=
 =?us-ascii?Q?CglVxePH3Dk9K4IsISqEYCJYr22dwmHKNyFY3V+YSGAWyuySFMpBqQcxjfwd?=
 =?us-ascii?Q?Q+sXFwIVpoSorZKhn4Qov68kHLs0tyObv6RtbMtf6ERytYKjwxLD9/oSYxh5?=
 =?us-ascii?Q?nfucZ2gEPOMoJPNlHh87LyLcL61kwERDpoGP977h0yNlEtP91k92TMLXbJvo?=
 =?us-ascii?Q?dhTkZ5rhUywfbgCDvVfdByBxBqPN4hvAVLU8p02f2pV2I/kuoVBwidMpUMGr?=
 =?us-ascii?Q?kMoTW7wWHA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f3982f-0fd6-4ff0-9410-08de84782758
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:32.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wK19o721mawykOHkBpwUN2W6tsK5RjeRUs83EGEAVXIQs+MixTKYG6jf/ecH+jiXzw5XcOjAedIMbc36Hqt/HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

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
index 92335e7fc34a..4a8ba2721dd1 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -140,13 +140,14 @@ fn client_alloc_size() -> u64 {
 
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
 
@@ -189,18 +190,19 @@ pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
 
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

