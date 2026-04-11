Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8206D3090C4;
	Sat, 11 Apr 2026 02:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875826; cv=fail; b=JQAdxh02oYKoUNicz1uK2TzPwAGAg3jNwaJm1e8sAiatQnBi8jahdxVgiuBDOo4Cb+P9J/9yqxE7OjR/kAJyUEWX4VYGKA+jWe9LBPF4JKlbI7q9XUhfQklIF4q+6VD5sG2QB1YMLsWaXWYvHU9J/IGHNSkKRa3wK+A5/8Q+GMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875826; c=relaxed/simple;
	bh=zyBnJQZsf7hu2m3laDfSPoJ622S4yoD+aOSyOsP6l7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oVUAE2xV0Zfi+QaLYCBVOmIE7QCN/V1AtAhZSzCOB5s4SZWxc44MtjUvBR3hPsNuFMv9anCzVY4QomgwxLizsvDXGRAn96qVC1WfA3hdXnq8Im9GTVtPG+XbJLwHkEG+qpxGXPZaQfFe0DXXj7emq7ga0AxiCVzTkDaJVaMJr0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YBmkZHIr; arc=fail smtp.client-ip=52.101.52.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YBmkZHIr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ej+yYl8E+Fw9McQtVejY/bO63sPaUAL9flbx4c7oNU0rC/ZJwwq1UkpAJPGrAEPKEyPH8Kdfld4TEs4Tkjl5BshKr8Q+CES6zvONXIzupg/bo+9cT9F5KyOrCKw44Cz5YdcAV+pIn0hqikK6+eG1c4XTBAiKLf4Hu18OEjy1/1EmjdAKCIumkTKF9mSShAzTXaxX2H6y95+Aslr1v+AEHWeCN2qzAfkHehJcxW5PcUVozeg+7JQcsgOQqf2nF8FIA+GTJYXbAlCyalA6kkYW8BWO1eEh18EuerrctgQ/QBQ1sJr1LDZpn5eNkYZtkH2gVfrapJCkRU1Q1uK6AZvkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6Ps+v7VheW6gWVqcHdOB8iW24T/+yY+V25EgqMAAc0=;
 b=Bnhy3vzPaWoxbuMwVtbG58wO4rOUcn0siLawVrBlatKCvDXJ3hv9pUaNOvNp5Fp4IHXnU1CZEjAu0QRP7GkPpdrXJ3f+ixmC2btb0U4u2tuSOf2Byj6lvJ8i8ZxlkBH8Y59vd3KH6nvjclMlmd7Kva/kurNCLvQ3UpYJVacwnSb9Ed7rlhPwWenu/rpDtN1jowc38PMUX/TxjV3sIldMorjFP355zkCCJIj5m0BqdVUfc3a9rp2ffvHzezCMqHioHin8iiykH80YIYnCmfN/PvQxdglmOt8F9P1vynMG+SMIu/DNZBeNX/FuoPEoeU3JJ6aPKY3QreDlZsciuMahtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6Ps+v7VheW6gWVqcHdOB8iW24T/+yY+V25EgqMAAc0=;
 b=YBmkZHIrg/E68SUHP5QC2fm8CAc5d7hf/lxXBxnw4yN+qdC6QG/AnUaEpyAwdmzPov/R652m24978QgBid7X68MCEalGZX5EDcV4E+8/2hI7KiffgA0hymz/d63R2bG/WEQPh4HWx7szhZJEtMyGfyVQwqzcD3mQQP8aPVm38/oqAHq6LJVJsmP+DqYxOHvZrm4WBO8BGhCM/haHmcm6iHL35xElHxuD9uTC+gqWZxJZfsh5Pr1mcidR6px6yj10Twu6/PVI8hqUS6FcKS3+pjQb5xmG3BTTrXNidq5ksuFVHOMdT/myzLiYFGOAb0INVoVxIi2mxIbvWwkaWzf7xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:50:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:10 +0000
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
Subject: [PATCH v10 11/28] gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()
Date: Fri, 10 Apr 2026 19:49:36 -0700
Message-ID: <20260411024953.473149-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::48) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbe73ac-5030-44b7-9410-08de97750c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ccv2EL1RzYgJ0eIhFuLyfl3E0TydFWYAAAOX9uGfNp5FEWLXRsQXT0smUQgjk9eq/G0+6Z0THOhfpw4TzMjKaQsSSmThpnILLeXaMXpFxY4ZI04NPUUENY6rFNKjHlJnO2x2nJ1h17D77LyqVjF+N/o0sCzAGgDcJ/MpkXV3TTJztpVSixuvwOgsGkrAKnAZGg7DSTTJiEeOcHKTh91EVt0K7eObuFwSZE9BHgE6BnCk80hiGhEld79dJjekWMThHAV5ZzfaJTEM+jeIqGgMELVjt/VUa2NZGvhQUWzft7yNfOmeqN7abrkO3kmfvCmmwbQFc4wP0KtToaWG1I1GOtxdwfWVBq6x89NkhnTBFZ6CQGZiuDN0SOTjvvBjBO3u6QrqFh+IVHS4kII1+clU78Ksz+ZlTT1SdLyA1OB3oInSouQlfTISwD9X4eT7xgJ5rrvplQY60pBXMrUB4X9nITSBE2l08aKgMWsp6E0pdsgqHOZjb5wlb5MJZG06bac4+Na1NuUB8ArI5Va/k5TmZ9UtEbEOUKxhszBB+dxGvTQMg8ptIi/TmVCNxnTG6Dj7yYQAsxVzlT2ziy5Tb40nnozvm82nAl41geEk2EZ9Vs8hBpN6EhbW5H+hSp7HLg+QLe0VftMrCzajEt8f9MdlIKu3yGfsr5eEHKOliwawlwCZxdUdAQl5u8gC+8WtmfXaYOfVMKBymv+nB71gDthIhniUHc48Ig6O6rb9535pBoE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zafi2M+U7+ca3i6INx6AX/AVGipc3UctucUFFTdfP3xWzDvdI32I4CsnPjfv?=
 =?us-ascii?Q?K4ozRA9CkcFhztNFyR1BzPxGNIuIb2XaqkUHRr5T7VIrtmINZXH9IfYYWeDW?=
 =?us-ascii?Q?HaB9IJgMsqhXLPitHgPjuKc3I9Ho1mY8GMdWoVTstMsV61InaFCGfYP/i4ee?=
 =?us-ascii?Q?otI5l0godNRHA2SZh6HbjDYNUHzdG3atu7Afb9illewlSeg403ZOvYeflK03?=
 =?us-ascii?Q?DyRpcFwFREYtf2XKqQzv7Z6a6z2lUxacwBtW6LJjNw3rjxKYUD7JZMA9ypVU?=
 =?us-ascii?Q?hPaqSKYdQ0U1NuuwqiVrW3M16SLORxmZr9ee+Fd/aeROf78S8LJwLS9ni3Pz?=
 =?us-ascii?Q?7yv/xH17BA+uAqw/j7isUrJTDE0zWesqWmXRe2ih6EkhxPZNqObPygm2qQYR?=
 =?us-ascii?Q?2yX2BFTgb2AZ/YlMxG7APTvwFm/ZWp2QHX09e7ZzVhG6pYKtdCXxk884kYdi?=
 =?us-ascii?Q?KbekRi/GnsyuMsVX80vr5/pavulRPC2RgUb8r6JSiNvXc+KBPPjJ2/wpMLi6?=
 =?us-ascii?Q?R2LeixxOPfheTO0htNK427tUMikWPj/gkz+N6SHgWEIdgtwm/AvesQvFZY6E?=
 =?us-ascii?Q?tDPLqJUe8jjZrIUjP4DVbz6DEubg8rQu52oUsUSw/4bzJSWBagDi9OprPdfu?=
 =?us-ascii?Q?3Y82+0ri1wpytBhoYTAKq4TdstM54NqeQCFLFEsiIl8P0criVTnY0skOnUGN?=
 =?us-ascii?Q?N6A2jg/E0lb4pnVsi+mVCLhf99QnCx0zkMWHq8xVNoSCEzfzli3kahVkqX38?=
 =?us-ascii?Q?A3AhDhI2OdlNtj4yaZFIrkYMGYeexT7K6w0fxZYZL6n9TvOc6rgNG9Im8NKz?=
 =?us-ascii?Q?HUi+z7qocf9IrjtPJmhxFYBKhve0xeBcBS4125/IopdHV2KDJ4QlVipOUM24?=
 =?us-ascii?Q?Ow+lS5SwYaOhpMUzz/Yb0lQYwgMPZL4KgimY9CoPOcxblrnYP0nk/2JwpHCx?=
 =?us-ascii?Q?SuChah+8R56siNchEE+yE43YF+2+i3tP/HXPhbSQjm2Xi0iKumLrdec7AXR0?=
 =?us-ascii?Q?FMoQfZFfvPCp+GskGbAIOHgfwus0CjqBB3cWr5ca/p7389jmn8nWIxSfCwUx?=
 =?us-ascii?Q?vGQc/sxnguXlF66ch6LjApfWi2EthMH5DPbYDeJJGS33NvTzwU8BwZ2GUd2y?=
 =?us-ascii?Q?ATDoOOV+bbCirZcVhYzqGCS+u5fCdcverJB8i2bWUzwfeoQmQs/epu12hqPA?=
 =?us-ascii?Q?s0gtzML7I3fJVvy0XtvszePrsjonplKChfMewpe5hwlupj9Td+7doSb1+FjR?=
 =?us-ascii?Q?oZ/UsNcGlCCEgY5dPn5x8m0hlkDo1fiRWj0ask7uqR0kzNCa+Wk49+lxDDW+?=
 =?us-ascii?Q?nntNTWIe9J5ECLU8pnt4kQNe8mbYR7Y0O4Wvdw4vNv1U/TGs83Qa2CT/Z0j9?=
 =?us-ascii?Q?bIXpyUiKV0kXK+kvVB2jw1+8ZikdLfRsreHwzR0EZEBdDJga14gZsPHcqB+S?=
 =?us-ascii?Q?luVX2QNKrANlG1hq42NYDJ3ONaZVK02o6//nT5RFGoLl/S03C/1AarPf+t0m?=
 =?us-ascii?Q?Fk+ZlTO9ZOvANJH08QRNOqftv0dVzMsjCwu/otPZQdYSFioVlC2lLTzsxA+q?=
 =?us-ascii?Q?rJ0M3p999K3F2wW404AYVSAbNl6hhAofeOPEErrJicVQw9ElHjsoIM1h28no?=
 =?us-ascii?Q?cc1NNw41i7ZlXGBFigB/nrGwtI10ittwiJgpWWLCy0uVI5sQgWws3Y3fF7NV?=
 =?us-ascii?Q?mIJDO5rSSl3ZfAEPL5Svmli2ROpjb/WShgTT7LydFfehNYPNZDV5l2la+dd4?=
 =?us-ascii?Q?9ngVV7Ojxg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbe73ac-5030-44b7-9410-08de97750c52
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:10.8287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0L5Sy49ZdgWDZr8VdTB8R4opFA9d5640Wip6BLNTy4fSazDMF0UVtxX1JsMZhqXCRTmT99FK4PwpMC5MZbpjHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

Add the FSP boot path for Hopper and Blackwell GPUs. These architectures
use FSP with FMC firmware for Chain of Trust boot, rather than SEC2.

boot() now dispatches to boot_via_sec2() or boot_via_fsp() based on
architecture. The SEC2 path keeps its original command ordering. The
FSP path sends SetSystemInfo/SetRegistry after GSP becomes active.
The GSP sequencer only runs for SEC2-based architectures.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 137 ++++++++++++++++++++++--------
 1 file changed, 102 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index bb4f0757e084..88c7d2106052 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -31,9 +31,13 @@
         gsp::GspFirmware,
         FIRMWARE_VERSION, //
     },
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
     gsp::{
         commands,
+        fw::LibosMemoryRegionInitArgument,
         sequencer::{
             GspSequencer,
             GspSequencerParams, //
@@ -150,6 +154,58 @@ fn run_booter(
         booter.run(dev, bar, sec2_falcon, wpr_meta)
     }
 
+    /// Boot GSP via SEC2 booter firmware (Turing/Ampere/Ada path).
+    ///
+    /// This path uses FWSEC-FRTS to set up WPR2, then boots GSP directly,
+    /// then uses SEC2 to run the booter firmware.
+    #[allow(clippy::too_many_arguments)]
+    fn boot_via_sec2(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        sec2_falcon: &Falcon<Sec2>,
+        fb_layout: &FbLayout,
+        libos: &Coherent<[LibosMemoryRegionInitArgument]>,
+        wpr_meta: &Coherent<GspFwWprMeta>,
+    ) -> Result {
+        // Run FWSEC-FRTS to set up the WPR2 region
+        let bios = Vbios::new(dev, bar)?;
+        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, fb_layout)?;
+
+        // Reset and boot GSP before SEC2
+        gsp_falcon.reset(bar)?;
+        let libos_handle = libos.dma_handle();
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+        dev_dbg!(
+            dev,
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        // Run booter via SEC2
+        Self::run_booter(dev, bar, chipset, sec2_falcon, wpr_meta)
+    }
+
+    /// Boot GSP via FSP Chain of Trust (Hopper/Blackwell+ path).
+    ///
+    /// This path uses FSP to establish a chain of trust and boot GSP-FMC. FSP handles
+    /// the GSP boot internally - no manual GSP reset/boot is needed.
+    fn boot_via_fsp(
+        _dev: &device::Device<device::Bound>,
+        _bar: &Bar0,
+        _chipset: Chipset,
+        _gsp_falcon: &Falcon<Gsp>,
+        _wpr_meta: &Coherent<GspFwWprMeta>,
+        _libos: &Coherent<[LibosMemoryRegionInitArgument]>,
+    ) -> Result {
+        Err(ENOTSUPP)
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
@@ -166,39 +222,41 @@ pub(crate) fn boot(
         sec2_falcon: &Falcon<Sec2>,
     ) -> Result {
         let dev = pdev.as_ref();
-
-        let bios = Vbios::new(dev, bar)?;
+        let uses_sec2 = matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        );
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
-
         let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        self.cmdq
-            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
-        self.cmdq
-            .send_command_no_wait(bar, commands::SetRegistry::new())?;
+        // Architecture-specific boot path
+        if uses_sec2 {
+            // SEC2 path: send commands before GSP reset/boot (original order).
+            self.cmdq
+                .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+            self.cmdq
+                .send_command_no_wait(bar, commands::SetRegistry::new())?;
 
-        gsp_falcon.reset(bar)?;
-        let libos_handle = self.libos.dma_handle();
-        let (mbox0, mbox1) = gsp_falcon.boot(
-            bar,
-            Some(libos_handle as u32),
-            Some((libos_handle >> 32) as u32),
-        )?;
-        dev_dbg!(pdev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
-
-        dev_dbg!(
-            pdev,
-            "Using SEC2 to load and run the booter_load firmware...\n"
-        );
-
-        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
+            Self::boot_via_sec2(
+                dev,
+                bar,
+                chipset,
+                gsp_falcon,
+                sec2_falcon,
+                &fb_layout,
+                &self.libos,
+                &wpr_meta,
+            )?;
+        } else {
+            Self::boot_via_fsp(dev, bar, chipset, gsp_falcon, &wpr_meta, &self.libos)?;
+        }
 
+        // Common post-boot initialization
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
         // Poll for RISC-V to become active before running sequencer
@@ -209,18 +267,27 @@ pub(crate) fn boot(
             Delta::from_secs(5),
         )?;
 
-        dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
+        dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar));
 
-        // Create and run the GSP sequencer.
-        let seq_params = GspSequencerParams {
-            bootloader_app_version: gsp_fw.bootloader.app_version,
-            libos_dma_handle: libos_handle,
-            gsp_falcon,
-            sec2_falcon,
-            dev: pdev.as_ref().into(),
-            bar,
-        };
-        GspSequencer::run(&self.cmdq, seq_params)?;
+        // For FSP path, send commands after GSP becomes active.
+        if !uses_sec2 {
+            self.cmdq
+                .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+            self.cmdq
+                .send_command_no_wait(bar, commands::SetRegistry::new())?;
+        } else {
+            // SEC2-based architectures need to run the GSP sequencer
+            let libos_handle = self.libos.dma_handle();
+            let seq_params = GspSequencerParams {
+                bootloader_app_version: gsp_fw.bootloader.app_version,
+                libos_dma_handle: libos_handle,
+                gsp_falcon,
+                sec2_falcon,
+                dev: dev.into(),
+                bar,
+            };
+            GspSequencer::run(&self.cmdq, seq_params)?;
+        }
 
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&self.cmdq)?;
-- 
2.53.0

