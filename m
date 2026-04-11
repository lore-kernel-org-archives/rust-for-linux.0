Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D661A2FE598;
	Sat, 11 Apr 2026 02:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875824; cv=fail; b=YFppipxg+MuqUNA5+pdlkkSLW7FNBEPUEvmc4B7ybjvrGqgA/9HmkezQsz7y6XYADgfA+yrToQE/xbUK8M3iyV1yVVrpxlepgioQG0V+ZTKoH/rcJn3S2hPB/4CrO0JUd+huEk4UqfZfBTArI3rW91eo4D7DJtH1VTvwDDfZ4wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875824; c=relaxed/simple;
	bh=XxH89a9vxFEqIWEsDBWnZxsUuuVYhazL7q9s/Lw5SkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gai1n53L6XLFsH4oOhK7zOWjNEGMszsNneKYwPc+De/NYiMIO7GY9jLQ6h1OVxpfjkGKnrogEhaeVmM807zitodw2dxnaCCdwHb7O5evsUMwolirnk5Ji4z+Zt9C4j7Lp/93g1vkKbYc9l72nFstiZUv4/wClnRSabKrzvMmFmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j/hoNEOP; arc=fail smtp.client-ip=52.101.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j/hoNEOP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/dzeXT7kGpIAptNLhMp/G0uASnH+66Pb+wbKZmNEFrRNSikOupJMvO+KLGcu6pOlxau33LL6eugdlo0M4IpZK4R8ttWJS20bUa8Mb+ztO91L3Zh+pgOB453n/oS4iJRDRXVCRyteWAtj52nby+4CEl5NwFhEukStt5Qf5sOIq+7OJ7EKk5E0er285oKJA6wMXjBuBV0smcxwj4WUAsbO7Mzm+3QFwI4OVys3S5bLleOBFtIv5hiphllJE7pvm2BQcyCMnUEn3WtVhZIPMFuetfYWmSqCicd+R675WM664lWJLm1DwMli14tKViavD+6yc51SsVEF505HRIrdim9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRn9O/AnGzOY/0uYnlRZ9DmzWO1vYJnj99tZfC72c50=;
 b=XuDflU39DZR3sFzTBFY5XGEl8hbvBEzal8ZT9aQlWEwrEDo70uVk/ldh6MZ3uXsVHCUM36WN7yCRSur7wZGspVK6yGB01+aiReTtCJp1Qb3OzPvUJq4fKSselhTOEm1dLhSH/WFDb0ALrSIVMdwZUez7jW0lGZlQVYLd8DKi+IeUs96xuAeUvALqzYYEFpUrJjjKVawCtFrmvBiGhpjsK4GF4nUZI4XaZO0aWu8/wkrJkh1AIViXxcS0qtZ5axfXTOXP2wa4djeW1hCo6OcvKAy/0Yl1XVFLDN8aiEkpC4gAts8gbq31vstR6wCXySgZaOb+bW4rcx0cc6NH67NA6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRn9O/AnGzOY/0uYnlRZ9DmzWO1vYJnj99tZfC72c50=;
 b=j/hoNEOPt4iCQGOY3Q0F2xsdn6SWuwEHPsZpze19qez7nOXJb+vVw9EQi7bWPDzAFzJVeyO8KEVGM+zCxOve2LZUw9TIGcAzgjQObm5QROckJ/joxyfJXVOzvf1Iyu3FI1OpdZLsg9k3t7sBAacnx4u64Uyz6tS8tmJWBBcQudF4Vd6cDXnUePz5cUxr2S6FN61r84JVPHA7B9a4zXG/Eth79Q8v8OpfJXVUz0FgYt+8GVjkTjLfLls1eyWRpUXv9jfljWX1fdvREsgXyvsqRRxxcR9q/aKmUyR8JWNJJU83yUweiiWOtcaZmvy/HVzcPRKex3rAOHjNiKLyVc6tKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:50:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:09 +0000
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
Subject: [PATCH v10 10/28] gpu: nova-core: refactor SEC2 booter loading into BooterFirmware::run()
Date: Fri, 10 Apr 2026 19:49:35 -0700
Message-ID: <20260411024953.473149-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f8c9bb-12bf-4a61-e923-08de97750b7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bFTpND0XCx0eQHpt3WzBc245yaNSWGh9W9g8feYlxESk4TJQtdwFyurcqhbl3K66SoYiu2WMBotRYTnsnTpUPpDDGsspzO/JqTizTwGH2IGnZuqYRw4z6zA4d0Ne/gRV/2rtbw1o1LA7CVY1/yDFtebUq28xcaE6+N4FTvRQPEjOcQvYzvb0xMVEF98FceBHr5CTdB4vW4Ds9DEl0qTAtwBLVP/ApNgSsi8v8B4fK3hNcvlpkkSs9IMh3DtTy5Yj82+9o9VMWOg/ChuqZVIJ8ZNEl1IvU3fddgCJpyWo0jh7q3c9B3+5uthd4xX8+tJs5izhFZyeSXl6Wy5T3UBbRVLmK0otbScQJ8WKuQ+FeJ5CHyU2neUe1l2Om3l5tmnQ6AXDpIFj5AvGSc9chFZGfjmxio05X1ksMc2PXVBuZT6qVtDsVQgEWylvbDiyalCfWgl8NdvnfalX0WUZ/b1s7WTE4q/I/p/MKH7PkY7EFPauFVHmodXD8o7Vvp+xIGyEjRXnfx0zgvSBlDW4ubdV1jxUeoZxW1g9Vd756fRfykVNXHCQvCn+SED0KlVSB+pgCgGCuEAPDH4WVaoKuYayOdbM6GnXD2akylVpe4mn2LXG4/s/dpFgMLmFJTrPJrHPqNuuscLR41pRzQX6my/DdAyHH8prmY5Q+xjFRp+Zuq2FxyJ9dS1vrmg8AIWP3h1Q5ltnxIUaXsODEY8HiTJG2ga9faQm2nsuKGe6NJJ3zVA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rz2807gQRN171cYdlM+Q8f6n8aradjltaS0z5AYdH+Qpl9cxV6QLNLhcMOeZ?=
 =?us-ascii?Q?akOAyqLNzvIy7FSc12pELZS4KhQoKFUSD7ZtV74Zn4zGRR5GUh47Zy72kDNi?=
 =?us-ascii?Q?rH2dR/qsSPLpCNgw9RMyOFQibROjLXRkJLkcFD56NIW4rQw8XeR/vugDHBmD?=
 =?us-ascii?Q?G0P1dbCgAKEnyR/mjjeQa9SpJM9XYsp4H/XyjM2MDEgg9Tc8E7uPUGbwDm2I?=
 =?us-ascii?Q?ONIm4Iw4n6NZ5ATmShD436r+XTsj6uLIJqgNpmOK1WHrrI1o6rO+/Ee8VHFc?=
 =?us-ascii?Q?2b7slrjFgh8pieAaCCpErvQpFdKyQimkO+riy58SuuqMI/In9swyL2nrEfSM?=
 =?us-ascii?Q?CyrusbxAJVmXxq0jXJ5yQ3tU3ZZMmQ5z1lO0JWUNScaWKa1SQS/icJRz/EgA?=
 =?us-ascii?Q?cXJvTg3q5oMcKZONu66zcCAM0Y2il4bVXAVV63tXHMjy/k9ZRUZkTC9yqE2l?=
 =?us-ascii?Q?5qagxDiwzqD6BULV+INzGkm3KQNAL7R1uoyCJ9Wq8sePmkVFgd0vfmvkXp5E?=
 =?us-ascii?Q?mHuoYmvu0CRpB7KGH5Aw6h7emj+z4+NMe6gCA2ufGP9mlYIwEK/UDbNSiUxh?=
 =?us-ascii?Q?oPTCrus4tuYc1YHJVk+3Y6oYkg3vJKe5BzGPstcZllmrA/h8E+CakoaGxqdY?=
 =?us-ascii?Q?/WRu93w27tRmkOznqh4aH6EFdO5JRHt38bjVj5hra1r/TxD0FMu4QLwLMxBb?=
 =?us-ascii?Q?XOD/4sKQ/HCxWc7jOlQwzJRI2Je/lS6tSRhc1QnPqntzMeaCdJUK5pFM0W/c?=
 =?us-ascii?Q?su2PDxAngn8qpAFT6vIwaUrNWf/vxrLf4OVw+jHzEKB9g2xJKSPkTxhLbLBq?=
 =?us-ascii?Q?Se+hYJ7L3+3WG5QPhKlgiYFc8wAYc+JDNDA38Sux2dBipze5hjEg/SjOLiHM?=
 =?us-ascii?Q?UP+wyfP8FL2u8DyqCHlK9PtK/csvr2AMLPF0sXuXIr9+AWrLotj/w+BQRqgm?=
 =?us-ascii?Q?nL60VapSKeDQiKmLCpfOSrAJEXSU4BXu3bjtyvDYpzuhF4nb2wuaMLlGIudK?=
 =?us-ascii?Q?nvWFFV3xw/Jyn/g3UHgtsgkC1G5Rx7KVvxSKsTkNGnW3uGLLTankNJXVhWV+?=
 =?us-ascii?Q?X33WGx9Ccmi8kYoZD8r01gOfmBbzUNbG6MwEWLB9mucDxZd5xSPj+fmqiitl?=
 =?us-ascii?Q?0DEt289TZKgfcLVyQdFf4gvCMBxfk7n1M8sGHwpIsn+naD6XkAN5hctFvq9e?=
 =?us-ascii?Q?W19ouSlE9XuO5x0Naqpv4hgABrNebvGcZ399OAgoVl+SR97fYaWZsVCJfhnv?=
 =?us-ascii?Q?eebNEVOVb/ON9js9KyrkE4AxBjtCI3ZiaKfJa/smqDdft1vLjI0WW5Vn/G4X?=
 =?us-ascii?Q?R4V7ibJUH1elCxboMLOx5ZxCe/RTH/uxeDDAezaZBTCKGFaY82CO9m94DWPf?=
 =?us-ascii?Q?Oio7XSjkPIFrcBe9nAjui26oGUkqZGL+bJGJ1QI7si+K0Tu7nmnnxjCABFxx?=
 =?us-ascii?Q?yzooq0aLFR8noB7zO//bQrQnzsURiBGWEViF10fAaQYHn7HyZjANR8Do6xsF?=
 =?us-ascii?Q?Xq2dRuk9suuqj//EEeB7G/6nlhHJ0MA/8Jios3V0VNSom/0RzJl4FPcgvGqW?=
 =?us-ascii?Q?om+wV11vx5bd8k9J9S5o3S5CihavZcquMr7oA2E2upZRFtflxaBd1Sj6pE4u?=
 =?us-ascii?Q?gzTNWGy0DR/Y9L/l6lwi+rkm2DExa1JnkwuiIlcKrQ2lZ5GVZpSaWa9YjFJR?=
 =?us-ascii?Q?q7sTDfz9BqAoOGWVLu8W/lPgb/AWaJXoW2MdqgDrGSN6Lt2vPOc8QjC6ERwu?=
 =?us-ascii?Q?0Z0kRphgsA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f8c9bb-12bf-4a61-e923-08de97750b7d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:09.5109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzYMwawpmiaJTWiDrgTuqlTzlVTpzx0p28xE6Vzv85Qec+U0p1JBEWCec/Aw1qKUcHDZ85NRb4Yu3gsmGm8OSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

Move the SEC2 reset/load/boot sequence into a BooterFirmware::run()
method, and call it from a thin run_booter() helper on Gsp. This is a
pure refactoring with no behavior change, done in preparation for adding
an alternative FSP boot path.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 30 +++++++++++++++++
 drivers/gpu/nova-core/gsp/boot.rs        | 43 +++++++++++-------------
 2 files changed, 50 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index de2a4536b532..6a41690e72c6 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -8,6 +8,7 @@
 
 use kernel::{
     device,
+    dma::Coherent,
     prelude::*,
     transmute::FromBytes, //
 };
@@ -396,6 +397,35 @@ pub(crate) fn new(
             ucode: ucode_signed,
         })
     }
+
+    /// Load and run the booter firmware on SEC2.
+    ///
+    /// Resets SEC2, loads this firmware image, then boots with the WPR metadata
+    /// address passed via the SEC2 mailboxes.
+    pub(crate) fn run<T>(
+        &self,
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &Coherent<T>,
+    ) -> Result {
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.load(dev, bar, self)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+
+        if mbox0 != 0 {
+            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0);
+            return Err(ENODEV);
+        }
+
+        Ok(())
+    }
 }
 
 impl FalconDmaLoadable for BooterFirmware {
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 1aa869693b75..bb4f0757e084 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -131,6 +131,25 @@ fn run_fwsec_frts(
         }
     }
 
+    fn run_booter(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &Coherent<GspFwWprMeta>,
+    ) -> Result {
+        let booter = BooterFirmware::new(
+            dev,
+            BooterKind::Loader,
+            chipset,
+            FIRMWARE_VERSION,
+            sec2_falcon,
+            bar,
+        )?;
+
+        booter.run(dev, bar, sec2_falcon, wpr_meta)
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
@@ -157,15 +176,6 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let booter_loader = BooterFirmware::new(
-            dev,
-            BooterKind::Loader,
-            chipset,
-            FIRMWARE_VERSION,
-            sec2_falcon,
-            bar,
-        )?;
-
         let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
@@ -187,20 +197,7 @@ pub(crate) fn boot(
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
-        sec2_falcon.reset(bar)?;
-        sec2_falcon.load(dev, bar, &booter_loader)?;
-        let wpr_handle = wpr_meta.dma_handle();
-        let (mbox0, mbox1) = sec2_falcon.boot(
-            bar,
-            Some(wpr_handle as u32),
-            Some((wpr_handle >> 32) as u32),
-        )?;
-        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
-
-        if mbox0 != 0 {
-            dev_err!(pdev, "Booter-load failed with error {:#x}\n", mbox0);
-            return Err(ENODEV);
-        }
+        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
 
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
-- 
2.53.0

