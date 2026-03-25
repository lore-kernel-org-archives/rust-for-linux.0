Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0353043DE;
	Wed, 25 Mar 2026 03:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410808; cv=fail; b=BDv4a7zhclRuE2OC3Rw7V0U2hypCs8ESAnJM132uOoyUgoOmHHmBFbsDndrKqz5JqZ2YTsfTRzAEoK+OxzH8hqyZHmAQYeJF8Klu8gu2u80Cy9ZqqfHD4zRWXNNpmDhp18vq1guj3i5nxfWcUR9Pybjjnf+hTCiRJ9hhPJxebR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410808; c=relaxed/simple;
	bh=OAbvXs1iVb/XLEvKjPFuyEpzSkpqvD1l8fRf0A+Jfb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BNIcLECaF/1fBdH4Bq21UEeeBq5bAT2Ca7BnI95UMtcTY3my2DwoMXGA1EOoPoUXIsISjmo040Esrw/GhvDF34AJw4VvsIWuZjPwKRvJpdJ17baGj2W8jS5W6m+v+8NFWtot3lJv0/yIlCASL3XleIlVj1On8Bj1swPPd4HZns4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uYbftMyz; arc=fail smtp.client-ip=52.101.46.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uYbftMyz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8hzLvYJihWGT80IevnbjKr+XM6gJsNsBPcl+lz1CrKneB4O/IhndRjNwi7U+zgWRns7+BHUo2SYDoMLCY/QAAad0DIHawH9BF9juBl9ndquzAvG7LZ7seGjWz0ZYHrhXGJcGNk8xLhNwO3aVh9UAJwqs7z6XW64dvH///6FnPWOHhK8+hSeNh7n7YxifUb4ORORclH5OSp+ZyLT0NOG7xYfseCGsRsVLsuvaRf8WujXFDWeuI/+dlK+wW7VLlyoS7y+OhAvznA7znnyuaqjlguGrH3/OXYJAJmtLSRZBSSnxBz7Hjd+d5u7pB6R9SRogYxlsZSowRrexdxIRUqySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsEu9mBfeGVvo7S6locRZnt7gXRSAwhq3iTy6fNQ4Ps=;
 b=Ss+vGH5GLTQ/wpM3PRloV01PFfOde6Ijs9k/GAeutAWuYUrqypUV2JWe0J7qyWzrJjFj7QhcPVUDpjzBo52U3J85BMb5ti/IdNRBFBO9Q5I1iTttj7awAH35iAvAN82L85i/MQWHlrBB+h94shbTEEh2f8eaMrHm7zvyGqxrG5cljippsOQoXS7PcScD3lhENqsNvDbBfZKCLl+EXlBk6l+WJPEAGGOfgjCMTUVtmxrnWdy2zICuP9Gub4aDwu/cVtSATeqRjFdSCHOPb2EMFeM9eM5XsFKvc5VeIq0sVIm9QjDSQZacnpZ35xC2E/xVCHj0BvrajhOekGk1QztlXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsEu9mBfeGVvo7S6locRZnt7gXRSAwhq3iTy6fNQ4Ps=;
 b=uYbftMyzXQbQthdejgXgB/UMkF6ZOktyWTW351yXFzLmpSJWvlnpl9RaGe4wfha+MPYCrEIRIrHaKc4RkJ9Es7dPSIEg/iuNl0Abqq6d9BRwDBfVuQpGGrQY1JOGnWEgHPYSOykC4LGbODQYQ5P3aD7RlpTSmkp8opDy1tq88y5gvCC0ASj0RLIBLPF/LGA992EjC9jl4l5FGATjyWbicCmsq7E0086Q/Anfgryvn//YY1FlQCMbhvcr3JpBNbgBgxTieu7TUwvyCHj+ihzJge1KSiQQJ4E+S1nJ86ZofbYJ6IOgq8X3iDOJdOif4exT1mKBQFNmrUOfo50hYZfU0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:21 +0000
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
Subject: [PATCH v8 28/31] gpu: nova-core: refactor SEC2 booter loading into BooterFirmware::run()
Date: Tue, 24 Mar 2026 20:52:39 -0700
Message-ID: <20260325035242.368661-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: fb23c6c1-1a59-4a1d-2588-08de8a220eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|22082099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info:
	n4ym+CY9EgIHpWeT1fDosKt08/gYumwZMlq0GAYxJJAZUnvkuzy6YD0uMdmJ/Uhi//Lqi/wsLw/IqgjG5JA3SeuGhcgyHfw+cvPjrjYo6740x1oRmGFFCkJx0kXkZE/5fGL2/6bkqrxIjnjaxhvab1t6VPNXdQGGt1dAPDlpd5z00NZoqzmeZ65ZdIKcDlz+JjsWFv0T/HWOk+a6rObOSpe6sF1PXjrOdzFyMReMnKYeMdX5RVDHb2KIKiN3cZi4jRP08gHhxRg+4PMBJN7ttAqe1jteTGlUa+f5jouI+cbrlOHc5yRIDlpXOPVgymXVRF8gVGd+juS0voXP1gRkGPnrA+50UxLrSPh+wofqrPeWvKapBxADZ60VdGpuAN+tIW3Ffrug4+qjrAnZODxDs20V3GWfC3KbfPqNv6BPi5k+XX0wBz+euWkUHHo1R/Is3mc+4kFixZfP1g6FfOLIqONgKVRig/RUn8za+Rv8xBqL8Yq1SXjca7uxLD991de4RiXnouDlwEZ6FEgu6QAO2AJBcVsssImOTfAiylsntSsIUidpJ7LM4vavHVE5ks2iP6erU8uoZQSB1cRXmh68jGiA/o5NPWxpPxKnOpJ9UFU7gFgkIvNh2IkNcTqqLfQ7541a4uQEXHWT+kapCXsb3RmqgevPPsGghPsN0CAJrDD3UhHXV/GETWuAG8jsu6ZRPivbL3OdSiWMNCswjbMuY+k2/+0HB3S/ECQoPEZXkqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SGO+NvKK2zlyUcgEfh9HBFUob7O42mWNvZOO7WAW8JlnEf//yc5C2zd9qbOA?=
 =?us-ascii?Q?q4nZEjTBo+aj9M3Sds+9WC2b5KzM/SnwOzo1MWyEm262QZiUeuQMxPuWhveF?=
 =?us-ascii?Q?K9EB7IkfqKR1hBdZBDGCAwJclLFQnmLspKXkAmkca93VPoyyOzd1JJBXnNBb?=
 =?us-ascii?Q?2BW0ZPVOprcniiIu3JINfd0jwcu3X/WNdcc9L+84SPM/3A+Av/w+/vH96qcD?=
 =?us-ascii?Q?MMF93JZRKAJx8K4qkcCN4qok4ZlvrQoPjIAJBsVJTm4ckpLk8P5z/QNVkjKi?=
 =?us-ascii?Q?Jese2QrujNcN4Z2P+ibmv+GCYKUhQnOiNIyMXWXUjrfvu6OdAN2is1XNeZ8s?=
 =?us-ascii?Q?eyqk/IGOTqMxBsMwM+DWb6f9os/KoVxl4H9aHbUzPev/JGLb8RtVr4+RY4Gw?=
 =?us-ascii?Q?XKrGSI4YlTPJlMhWar2aG5EwVK1DHvujoQLZcYU05CanOihWN7HccBeO9NLK?=
 =?us-ascii?Q?v8enDeXPCy5W8q6jcwbtFbWtabFnJ2l7+wAPXLiT0DU+wxrXif/7gdjCZWX+?=
 =?us-ascii?Q?XL4xZUqkHtUWy9ORxnNMMAGZFGaQ4lF7RhjEhHcKduiCQVpZRUwy7gZsAaXp?=
 =?us-ascii?Q?rbwA9GCiJ4phyTiUzkzi7daD3hBGTrw4VLc1pU33Agb13m7FX6EKgu/UdQi9?=
 =?us-ascii?Q?CrApP1D00VvJewUFEraDQunU5+iZq6qd1XxptESPpV5RWxP3+DmyNGVJ6iLG?=
 =?us-ascii?Q?x/4cbZNnaD3WZ3uMSDrlC5EwdS7mOvebD7k79gjk7N4pAFIJP8wNqT/nEep6?=
 =?us-ascii?Q?C5A6+qpWGxGPx5awX7tD0wudCI00/FVDK5Fg3Dd7PB4D7QYtomdvuhSiz7Aj?=
 =?us-ascii?Q?MrXMT5s24y4ukG2Ts+eAWZ8EoDm0ZEA57i57Tksba2t/d9iWhu4mcYRNC4vx?=
 =?us-ascii?Q?Bh3Qd9vWSyrh+65nO+to6/HWp5oaClD5rk9f+OrcdUKKyJs9GmTjoh4ic1JX?=
 =?us-ascii?Q?IP3i6JVgZ+7tMcN/4/1tkBOreumEtdgwAXEH84zthlIbgOT3JDWKEX/S9Ove?=
 =?us-ascii?Q?kXASFmbkNEBgAnhKzPvtv16b4JXztgJcB79+WVbXY08n9Z9aPXMcaArwyULZ?=
 =?us-ascii?Q?boId26y4hrmCFgSQZESfUP1TlSMBeodoU+D1S+ys2ey3z8Nc5f7wows9WucQ?=
 =?us-ascii?Q?AI1WbaSIUD6NdjVq1SrZ5c1i7NeF8+dek3d4CZRD63StcfNb9tp11SDoASxs?=
 =?us-ascii?Q?66VB1ze0FcSKIvoiZB0o1srww0JIzoO0k0wqMGFhdodyLjX5Ptp7oAT7mZyt?=
 =?us-ascii?Q?Ti+BvALF/E+U8bhkXQDNdE8Qq/V3gMB0iKnUFVwTRHEWRwgk1GjN+CCso39A?=
 =?us-ascii?Q?v+aZIYYwoIdQrqcjG2jrYQEmVuVOPJExig66FLk11eTpR5/tR3Gp8oRsbpFg?=
 =?us-ascii?Q?AHBe5JN6Ah7J7rcyuPFME3KqVajEkT79kvtidX+kd40kjz3AQhs/Tm6b+NCA?=
 =?us-ascii?Q?MmY7z1isrwOwE7j2Mb4vEVWgm/dj421R9apLg95sLe+tOA7+ZJXuTOn2d5OC?=
 =?us-ascii?Q?F0V00TO/P/IoGzPJu2li4dtFZYbM6LRcW0/cJ9ouXZs7NfEODoDJNpyCjhQz?=
 =?us-ascii?Q?iP+HFp9xsL3CyXNlj7RgiwfxPTRoJeN394bavGvgJMN/q/uMx/3fIQ6CcsW9?=
 =?us-ascii?Q?qAB+lnjCMYtoGLZMkzqguksuRzdnbloS6xCYuNpiefFQNMZY0jfhEQXsQpzB?=
 =?us-ascii?Q?3n6OoKI+cJUPc0QJrogzMIOIrPNVRCZ+8SFFHxI7FiBuCuxEl37vqTdCQSBT?=
 =?us-ascii?Q?bP2nwA2UtA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb23c6c1-1a59-4a1d-2588-08de8a220eb3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:21.4462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGggIVUntgn/p1rJ8mX6wvMX5xY4EWLCOw5KEjtUWV3wGJyT5bpvsbyCYWhwx7CrG/ZaftvXp6QEBoiVmxkwWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121

Move the SEC2 reset/load/boot sequence into a BooterFirmware::run()
method, and call it from a thin run_booter() helper on Gsp. This is
almost a pure refactoring with no behavior change, done in preparation
for adding an alternative FSP boot path. The one slight difference is
that an MBOX1 printing typo is fixed:

Previous output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX10x1

Fixed output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX1: 0x1

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 30 ++++++++++++++++
 drivers/gpu/nova-core/fsp.rs             | 45 ++++++++++--------------
 drivers/gpu/nova-core/gsp/boot.rs        | 43 +++++++++++-----------
 3 files changed, 69 insertions(+), 49 deletions(-)

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
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index faa0b3ae88ba..1d3092e6b14f 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -8,7 +8,10 @@
 
 use kernel::{
     device,
-    dma::CoherentAllocation,
+    dma::{
+        Coherent,
+        CoherentBox, //
+    },
     io::poll::read_poll_timeout,
     prelude::*,
     ptr::{
@@ -222,7 +225,7 @@ impl MessageToFsp for FspMessage {
 pub(crate) struct FmcBootArgs<'a> {
     chipset: crate::gpu::Chipset,
     fmc_image_fw: &'a crate::dma::DmaObject,
-    fmc_boot_params: CoherentAllocation<GspFmcBootParams>,
+    fmc_boot_params: Coherent<GspFmcBootParams>,
     resume: bool,
     signatures: &'a FmcSignatures,
 }
@@ -246,34 +249,24 @@ pub(crate) fn new(
         const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
         const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
 
-        let fmc_boot_params = CoherentAllocation::<GspFmcBootParams>::alloc_coherent(
-            dev,
-            1,
-            GFP_KERNEL | __GFP_ZERO,
-        )?;
+        let mut fmc_boot_params = CoherentBox::<GspFmcBootParams>::zeroed(dev, GFP_KERNEL)?;
 
         // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_size to be zero;
         // it obtains WPR info from other sources.
-        kernel::dma_write!(
-            fmc_boot_params,
-            [0]?.boot_gsp_rm_params,
-            GspAcrBootGspRmParams {
-                target: GSP_DMA_TARGET_COHERENT_SYSTEM,
-                gsp_rm_desc_size: wpr_meta_size,
-                gsp_rm_desc_offset: wpr_meta_addr,
-                b_is_gsp_rm_boot: 1,
-                ..Default::default()
-            }
-        );
+        fmc_boot_params.boot_gsp_rm_params = GspAcrBootGspRmParams {
+            target: GSP_DMA_TARGET_COHERENT_SYSTEM,
+            gsp_rm_desc_size: wpr_meta_size,
+            gsp_rm_desc_offset: wpr_meta_addr,
+            b_is_gsp_rm_boot: 1,
+            ..Default::default()
+        };
 
-        kernel::dma_write!(
-            fmc_boot_params,
-            [0]?.gsp_rm_params,
-            GspRmParams {
-                target: GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
-                boot_args_offset: libos_addr,
-            }
-        );
+        fmc_boot_params.gsp_rm_params = GspRmParams {
+            target: GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
+            boot_args_offset: libos_addr,
+        };
+
+        let fmc_boot_params: Coherent<GspFmcBootParams> = fmc_boot_params.into();
 
         Ok(Self {
             chipset,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index e55210ebb6d1..9d0e29e82574 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -128,6 +128,25 @@ fn run_fwsec_frts(
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
@@ -154,15 +173,6 @@ pub(crate) fn boot(
 
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
@@ -184,20 +194,7 @@ pub(crate) fn boot(
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
-        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
-
-        if mbox0 != 0 {
-            dev_err!(pdev, "Booter-load failed with error {:#x}\n", mbox0);
-            return Err(ENODEV);
-        }
+        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
 
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
-- 
2.53.0

