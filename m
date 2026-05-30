Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95481345751;
	Sat, 30 May 2026 03:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110643; cv=fail; b=GUq4YRpNRPFfKol5Jw2RcYWd/3BG2jUCS2e9ts0fH8e1aBkHuskNUjLWrB/HWybqOmKP2VaYq2xYvSzb74LDovvKl4BHYpy4CFGLbSpfMaY8CU68BFqyoimERCZBmzO1CidbJ/bWc3fwB6+dn0pfpgFKce2A91MxIdIK/So+E80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110643; c=relaxed/simple;
	bh=xRD2J0c8kADKC9v/KuDZjt+7pwVLKpPgqy36/5CACK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KbAioWR+/gf6g5XG84pa+ExpM6RP/3HkYsfZUD91ljrwn/X/HkM8lYxJErrihCIOmEetAnzcZTSc8Mgxy2QrAxkM/C/FNrFqR/AclwcCYuwWyaqT5kR/iF06PCBvtpaGRG7OysVhhOgH17wmONRqXSG+HwwTOctxjl25re/jdEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tZGYJkFs; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tZGYJkFs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7CDyLVHJu6nXK9b5mFdGiocex8c4SGdyg2fG5kpW5YI00y6mq2oFe3GEq85Xzv02s8+zwpIDggdtdxajjFVjiTDAx2mFdfFfNuvVR1PjDxN0y035aFHCZhjPD+H5hF6EFB7GIYpssSHUYRUrZZOOv4cpC79hQpzicrbTVW5npfD3i1GuVLjNbvF1UHzmweMcvUy7i0CgwDY/SOTAO3xewYdjZFLDGBRwgS6q+DgYCQLno1kV9CMI5CYzWNKYm5AhknBesndnjLPScAP9nwk054m/KZbzJNmaOthvC7hRosYE2jDVDTHr1y7vqV99yQHsyYD0KPzB+AoivdAJohEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6geEGkg3mU+VRlgAUnd08iiw3J0mJ/E6FBEpzFZUt0=;
 b=FzEH3oGxuaz139nMqHOb59Ca17SOQaiEzWZWUt8wM2OCpdZxDTPmvoKBTiSIOfU6R0aHtFoLc8l/PYgwgZVi3YYEJHXYmE1PzsPSFNMeJrmzhb6DNb/SonS6f8Gn5mdtdFfmTYRiBiYDRynVN8MkPpdyNDiswpL5oMoDcVPv1ymbhMHZ/USiV3eUOXUWID1Sz+n1sHp/J1ih5rnl+EF0acb3fTRYf/9T4RE0iSTOFnv7DDPjr7trfXN2zRjXyJUM+L7Ax5JQZ5RwonNuZdPnIg+l5QcvU5DSvPN7zDGiKtcvHmWA2AvCTyQGaSnD3cP8oR9n1icLyql2WFOaW2ITNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6geEGkg3mU+VRlgAUnd08iiw3J0mJ/E6FBEpzFZUt0=;
 b=tZGYJkFsuZMDb7v4Ip+SZEIkRUKlkGhanjGp3NxASXWOGuOV45edE+v7+q86lIYY+26LdDzk0AY2kudW8tmf8htJ0GMkc0o+5gbiAPdjPTAhugmXYa8tB+/HJrsR+ozLZilc9xZrTiEOJDYPBNkiTZtDCTaz0k+RHme0anrh6jFuYcqmUmQ2ogBO04jJ34j1ibrjys4n6miaOL1xy21YRDADBgM8vC6qktdVk6hdCc0KIVnl6kDMSvaphpZB+raqOuePqTF7ufPBFGqFEITZN46d6MQD2wUsIpmPF3tEC3ZKRaHr2mu6XHMn3iKyhBxJJ6YRdlgZfYmrA/KYqC1z9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:20 +0000
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
Subject: [PATCH v11 19/22] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
Date: Fri, 29 May 2026 20:09:50 -0700
Message-ID: <20260530030953.740561-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f146464-7ea4-4e6f-774f-08debdf8fbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|3023799007|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SIgv+iqfE0oyABGJcOo0EhFEPIRoVvPIgOmEUd9xt9UgBDrzlfSS7NDE7sdJLLBPvT8ZBu1txAFEhRObzFB/4zAedOb7/M8ezQki4urOKygg9KBQ1Qj5W2d6sfDW5lIR1ijFP4ntHmUI5jHdLNz4cl/bnsM4ttxOjPLzzkqesVo3aAV2UltDRbMkPN2BW3Sjg4kVwPEV9gBgP5qs69xRuMYA9FHjY8Soyf6WMFP6V6BezvgR2WQFy+v/iUprG28QzAOmfB/+MgbZ/ffAwzKAhYrRmuFVFlsJRn8Oswu2gkSQ00sM3mmqRPv+jwl4zTCnydDUq2BIZXVF1XLDZagQknNVyEZHnbtDsTnEkk8vkQ2lY8oyd/0/qKcuokbjKNiYeJgiedhhVMCw46lU3LWPwibpoMMUH3oXmQG+uYLfap4Iwr6jnAffE7V4eaYBm/O6pVxMExPCAK/bVUqBtMMTHRwrStgMjQMui2pnPnWZ9KPYLXYq0urOt4oxS0Xb/e5r8ViBnsQcGnkjJdFKdCWpLaFY+xL1Chc3qvewZM9w9S+0tk6uze2Q4xV0GFGbk0vbM4chF7yMfW5C0Zp2HqHZ20AeqtNVLc1k2gqmrzagu5vNrUtiedJCn+jgzjVqMyM1l2Pp5drNJWWrIYZOriVJXcOZWSYzu1QBQ2TiiKz1dDoVQvp/9qjqJRcV9JJPYOIX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(3023799007)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+X/446HkOBpePF0QwDj97q/RdH8S+M35fpQvfhRUMbSzfoBiiGU+jGHqCqwO?=
 =?us-ascii?Q?1BiBkzeRoFMnI1MqoyYgsdhsa1La8o2qt1jeP7JmzAx3s7asShI4QXeOJTgA?=
 =?us-ascii?Q?ae+QL2quCuvPPyn8CL8Eju5DbdZNehlnfsOvm/8CSaE74PtJ6BRfPNI/tqbz?=
 =?us-ascii?Q?EhWCb/kZpay4LUUEGPvsGyRAWDC0y6t/KZPBBGRGQsfGVSRIG5v+pIxfWBKi?=
 =?us-ascii?Q?UF/H2YSLKXNERdC+D4FbmrTpJYAgLF7pdaEUeRKNqaCcR97I0/ZM6eAYV5J+?=
 =?us-ascii?Q?ItJXY+ZGnlipgq1eSxjo7oJhGUQ4o0UIgpxUQRcvYbtYlg+6JLLly+9meFme?=
 =?us-ascii?Q?Jv0iz+SQktbbzZaHsRVEY0R0a9CpqVOJxJ04icHVEdxwhV8COhmRzGa/Wuz5?=
 =?us-ascii?Q?y4MV3h2aRqDZEDbf6NwpFl09GElmen/337ZCA+9/kgNfEJiYjpThufQe5P3c?=
 =?us-ascii?Q?uh8VyN0HDkJXXKj+zpJj499ARCIAajrlG/UjnX6CrMKhoJKRVslL9ZFgHHp3?=
 =?us-ascii?Q?OidXVdQBCXFWWz6g7UcYBZMO0BALPg/n+n82YE/bljtTyzOvasrknXFuLpCz?=
 =?us-ascii?Q?LASHK+3GdcV8xe3+/QmnB4CFjtGpPh0jmOsvYjvGeCTIx//0ozO5Twze1iah?=
 =?us-ascii?Q?AkvbJR2s0sl7J6uYY4ksCsbIHxLOZ2xn/KeKXC+9CDpzB6Y/hGf9HPfS/54/?=
 =?us-ascii?Q?mkUU3nJMXTGSxVDXK/ZTvKVDhDwgInaeGlgaPSvfY2LPLCtvM9NsIss4V9Dm?=
 =?us-ascii?Q?mP2kPHQy9HZVEyDVe9J0zimCQXJAyJroBco+fxYu07gQWe63V7PqpzHP8f+a?=
 =?us-ascii?Q?mPqohwomDl85N9qAtp1agYfs6+dxvhmJHEv3/yfOBA/V8cg/jnlrcg/6v8qx?=
 =?us-ascii?Q?xumzXAd5x+gAFplo4elXv+jjiviTHIROP7ZWFx3Mx9azxV5sCwWCSSCQOg2X?=
 =?us-ascii?Q?fsKN1h4RDK+WpYgyZAMlbjzM376NwmY9+cL8njojReFXT3z4+Vsmj1YIs7nY?=
 =?us-ascii?Q?tzKojt42JIS0epmAM2JumykbsCAyO/tueuNQnix7SfExFiccNhQEvG9s4ncP?=
 =?us-ascii?Q?My4h00KTPg5sB2CcR5moK5Uws7P96e0kgCrlkyhnVJsEcmOs9+GfN1iakA/h?=
 =?us-ascii?Q?RkFkypGixcw1PKvANNoaXfjSJe8T4kDMkw3ToARDWYrR2kPVlOOLSbwmiedO?=
 =?us-ascii?Q?hTHjgBeSLJqX6Cal8qSOLSW9CI4GUMxcVwzguLlukyCxByt6isRJFmRiFmWE?=
 =?us-ascii?Q?syK4Ju2H1FVSwI0f2mT44QcNKSU2et2m0ypZ4AVzkJFji88aCHJbXIIJK2AH?=
 =?us-ascii?Q?iYDYHkOT9FvjH7B2zR512Lv48MxQwoxbhuNpPQX6addgS6oCgN9umLDIgElK?=
 =?us-ascii?Q?P6iO081N9hvDp50nfVmt6aw2s/+szGErxq3hm8Pr31Eo1YFzSi5fWvFemxKI?=
 =?us-ascii?Q?PnzgG6CQqvm6O0pr1NB+7T/d/1o6qirvTlnCP+y8JTsVkjyI9L+jt5oRqKlO?=
 =?us-ascii?Q?IlezFIhtifE5LKmc5cqsFxMwSKU3lIgEfi1J8ahKEjYb7oCwWm7K99WcTqU7?=
 =?us-ascii?Q?MUVvBJs3rbfreoNMFyAKUVQ6qIxK9ohcpMZItXKxKOKjbHPErjHHFZQ7dyJT?=
 =?us-ascii?Q?GyhKSxTCYgObqBn/NGeX5WbO6D/orvzAwgYCHBuHuFJW2t4MHfrrPWOo49zg?=
 =?us-ascii?Q?8PaKwUY4ei3OuYxq7fGokYPW3WITIs7LOn78POfXNPaYxj15IlOufDA2MWDu?=
 =?us-ascii?Q?yX6t4s0FNg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f146464-7ea4-4e6f-774f-08debdf8fbb4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:20.7400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdVDhKglKZGaN7eN9946/NfJKnMhqGPMyz+cCe/iLcCUr+gFT0oiqSb//5dEoGmK68Uzoqvv+QV3lcH8ExOmew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

Build and send the Chain of Trust message to FSP, bundling the
DMA-coherent boot parameters that FSP reads at boot time.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs         |   2 -
 drivers/gpu/nova-core/fsp.rs                  | 142 +++++++++++++++++-
 drivers/gpu/nova-core/gpu.rs                  |   1 -
 drivers/gpu/nova-core/gsp.rs                  |   1 +
 drivers/gpu/nova-core/gsp/fw.rs               |  64 ++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  82 ++++++++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs        |  26 +++-
 drivers/gpu/nova-core/mctp.rs                 |   2 -
 8 files changed, 307 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index dc28d0cc2d03..13e6a5b5aeae 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -39,10 +39,8 @@ pub(crate) struct FmcSignatures {
 
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
-    #[expect(dead_code)]
     pub(crate) fmc_image: Coherent<[u8]>,
     /// FMC firmware signatures.
-    #[expect(dead_code)]
     pub(crate) fmc_sigs: KBox<FmcSignatures>,
 }
 
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 5aae8282f2f0..5878d86323b9 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -9,8 +9,14 @@
 
 use kernel::{
     device,
+    dma::Coherent,
     io::poll::read_poll_timeout,
     prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::SZ_2M,
     time::Delta,
     transmute::{
         AsBytes,
@@ -24,7 +30,13 @@
         self,
         Falcon, //
     },
+    fb::FbLayout,
+    firmware::fsp::{
+        FmcSignatures,
+        FspFirmware, //
+    },
     gpu::Chipset,
+    gsp::GspFmcBootParams,
     mctp::{
         MctpHeader,
         NvdmHeader,
@@ -49,7 +61,6 @@ pub(crate) const fn new(version: u16) -> Self {
     }
 
     /// Returns the raw protocol version number for the wire format.
-    #[expect(dead_code)]
     pub(crate) const fn raw(self) -> u16 {
         self.0
     }
@@ -67,6 +78,35 @@ struct NvdmPayloadCommandResponse {
     error_code: u32,
 }
 
+/// NVDM (NVIDIA Device Management) CoT (Chain of Trust) payload, the main
+/// message body sent to FSP for Chain of Trust boot.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCot {
+    version: u16,
+    size: u16,
+    gsp_fmc_sysmem_offset: u64,
+    frts_sysmem_offset: u64,
+    frts_sysmem_size: u32,
+    frts_vidmem_offset: u64,
+    frts_vidmem_size: u32,
+    sigs: FmcSignatures,
+    gsp_boot_args_sysmem_offset: u64,
+}
+
+/// Complete FSP message structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspMessage {
+    mctp_header: MctpHeader,
+    nvdm_header: NvdmHeader,
+    cot: NvdmPayloadCot,
+}
+
+// SAFETY: `FspMessage` is `#[repr(C, packed)]` with no padding, so all of its
+// bytes are initialized.
+unsafe impl AsBytes for FspMessage {}
+
 /// Complete FSP response structure with MCTP and NVDM headers.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
@@ -88,6 +128,47 @@ pub(crate) trait MessageToFsp: AsBytes {
     const NVDM_TYPE: u32;
 }
 
+impl MessageToFsp for FspMessage {
+    const NVDM_TYPE: u32 = NvdmType::Cot as u32;
+}
+
+/// Bundled arguments for FMC boot via FSP Chain of Trust.
+pub(crate) struct FmcBootArgs<'a> {
+    chipset: Chipset,
+    fsp_fw: &'a FspFirmware,
+    fmc_boot_params: Coherent<GspFmcBootParams>,
+    resume: bool,
+}
+
+impl<'a> FmcBootArgs<'a> {
+    /// Builds FMC boot arguments, allocating the DMA-coherent boot parameter
+    /// structure that FSP will read.
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        fsp_fw: &'a FspFirmware,
+        wpr_meta_addr: u64,
+        libos_addr: u64,
+        resume: bool,
+    ) -> Result<Self> {
+        let init = GspFmcBootParams::new(wpr_meta_addr, libos_addr);
+
+        Ok(Self {
+            chipset,
+            fsp_fw,
+            fmc_boot_params: Coherent::<GspFmcBootParams>::init(dev, GFP_KERNEL, init)?,
+            resume,
+        })
+    }
+
+    /// DMA address of the FMC boot parameters, needed after boot for lockdown
+    /// release polling.
+    #[expect(dead_code)]
+    pub(crate) fn boot_params_dma_handle(&self) -> u64 {
+        self.fmc_boot_params.dma_handle()
+    }
+}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -115,8 +196,65 @@ pub(crate) fn wait_secure_boot(dev: &device::Device, bar: &Bar0, chipset: Chipse
         .map(|_| ())
     }
 
+    /// Boots GSP FMC via FSP Chain of Trust.
+    ///
+    /// Builds the CoT message from the pre-configured [`FmcBootArgs`], sends it
+    /// to FSP, and waits for the response.
+    pub(crate) fn boot_fmc(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        fb_layout: &FbLayout,
+        fsp_falcon: &mut Falcon<falcon::fsp::Fsp>,
+        args: &FmcBootArgs<'_>,
+    ) -> Result {
+        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipset);
+
+        let fmc_addr = args.fsp_fw.fmc_image.dma_handle();
+        let fmc_boot_params_addr = args.fmc_boot_params.dma_handle();
+
+        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
+        let frts_offset = if !args.resume {
+            let frts_reserved_size = fb_layout.heap.len() + u64::from(fb_layout.pmu_reserved_size);
+
+            frts_reserved_size
+                .align_up(Alignment::new::<SZ_2M>())
+                .ok_or(EINVAL)?
+        } else {
+            0
+        };
+        let frts_size: u32 = if !args.resume {
+            fb_layout.frts.len().try_into()?
+        } else {
+            0
+        };
+
+        let msg = KBox::new(
+            FspMessage {
+                mctp_header: MctpHeader::single_packet(),
+                nvdm_header: NvdmHeader::new(NvdmType::Cot),
+                cot: NvdmPayloadCot {
+                    version: args.chipset.fsp_cot_version().ok_or(ENOTSUPP)?.raw(),
+                    size: u16::try_from(core::mem::size_of::<NvdmPayloadCot>())
+                        .map_err(|_| EINVAL)?,
+                    gsp_fmc_sysmem_offset: fmc_addr,
+                    frts_sysmem_offset: 0,
+                    frts_sysmem_size: 0,
+                    frts_vidmem_offset: frts_offset,
+                    frts_vidmem_size: frts_size,
+                    sigs: *args.fsp_fw.fmc_sigs,
+                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
+                },
+            },
+            GFP_KERNEL,
+        )?;
+
+        Self::send_sync_fsp(dev, bar, fsp_falcon, &*msg)?;
+
+        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
+        Ok(())
+    }
+
     /// Sends a message to FSP and waits for the response.
-    #[expect(dead_code)]
     fn send_sync_fsp<M>(
         dev: &device::Device,
         bar: &Bar0,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 6cdface3c618..43749a62f593 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -147,7 +147,6 @@ pub(crate) fn pci_config_mirror_range(self) -> Range<u32> {
     ///
     /// Hopper (GH100) uses version 1, Blackwell uses version 2.
     /// Returns `None` for architectures that do not use FSP.
-    #[expect(dead_code)]
     pub(crate) const fn fsp_cot_version(self) -> Option<FspCotVersion> {
         match self.arch() {
             Architecture::Hopper => Some(FspCotVersion::new(1)),
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 1885cfa5cb38..69175ca3315c 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -25,6 +25,7 @@
 mod sequencer;
 
 pub(crate) use fw::{
+    GspFmcBootParams,
     GspFwWprMeta,
     LibosParams, //
 };
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0c54e8bf4bb3..558b37863f00 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -934,3 +934,67 @@ fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
         })
     }
 }
+
+#[repr(u32)]
+pub(crate) enum GspDmaTarget {
+    #[expect(dead_code)]
+    LocalFb = bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_LOCAL_FB,
+    CoherentSystem = bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_COHERENT_SYSTEM,
+    NoncoherentSystem = bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
+}
+
+type GspAcrBootGspRmParams = bindings::GSP_ACR_BOOT_GSP_RM_PARAMS;
+
+impl GspAcrBootGspRmParams {
+    fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> impl Init<Self> {
+        #[allow(non_snake_case)]
+        let params = init!(Self {
+            target: target as u32,
+            gspRmDescSize: num::usize_into_u32::<{ size_of::<GspFwWprMeta>() }>(),
+            gspRmDescOffset: wpr_meta_addr,
+            bIsGspRmBoot: 1,
+            wprCarveoutOffset: 0,
+            wprCarveoutSize: 0,
+            __bindgen_padding_0: Default::default(),
+        });
+
+        params
+    }
+}
+
+type GspRmParams = bindings::GSP_RM_PARAMS;
+
+impl GspRmParams {
+    fn new(target: GspDmaTarget, libos_addr: u64) -> impl Init<Self> {
+        #[allow(non_snake_case)]
+        let params = init!(Self {
+            target: target as u32,
+            bootArgsOffset: libos_addr,
+            __bindgen_padding_0: Default::default(),
+        });
+
+        params
+    }
+}
+
+pub(crate) type GspFmcBootParams = bindings::GSP_FMC_BOOT_PARAMS;
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspFmcBootParams {}
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for GspFmcBootParams {}
+
+impl GspFmcBootParams {
+    pub(crate) fn new(wpr_meta_addr: u64, libos_addr: u64) -> impl Init<Self> {
+        #[allow(non_snake_case)]
+        let init = init!(Self {
+            // Blackwell FSP obtains WPR info from other sources, so
+            // wprCarveoutOffset and wprCarveoutSize are left zero.
+            bootGspRmParams <- GspAcrBootGspRmParams::new(GspDmaTarget::CoherentSystem, wpr_meta_addr),
+            gspRmParams <- GspRmParams::new(GspDmaTarget::NoncoherentSystem, libos_addr),
+            ..Zeroable::init_zeroed()
+        });
+
+        init
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 1d592bd3f9ed..ea350f9b2cc4 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -883,6 +883,88 @@ fn default() -> Self {
         }
     }
 }
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_LOCAL_FB: GSP_DMA_TARGET = 0;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_COHERENT_SYSTEM: GSP_DMA_TARGET = 1;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_NONCOHERENT_SYSTEM: GSP_DMA_TARGET = 2;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_COUNT: GSP_DMA_TARGET = 3;
+pub type GSP_DMA_TARGET = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_FMC_INIT_PARAMS {
+    pub regkeys: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_ACR_BOOT_GSP_RM_PARAMS {
+    pub target: GSP_DMA_TARGET,
+    pub gspRmDescSize: u32_,
+    pub gspRmDescOffset: u64_,
+    pub wprCarveoutOffset: u64_,
+    pub wprCarveoutSize: u32_,
+    pub bIsGspRmBoot: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+}
+impl Default for GSP_ACR_BOOT_GSP_RM_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_RM_PARAMS {
+    pub target: GSP_DMA_TARGET,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub bootArgsOffset: u64_,
+}
+impl Default for GSP_RM_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_SPDM_PARAMS {
+    pub target: GSP_DMA_TARGET,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub payloadBufferOffset: u64_,
+    pub payloadBufferSize: u32_,
+    pub __bindgen_padding_1: [u8; 4usize],
+}
+impl Default for GSP_SPDM_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_FMC_BOOT_PARAMS {
+    pub initParams: GSP_FMC_INIT_PARAMS,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub bootGspRmParams: GSP_ACR_BOOT_GSP_RM_PARAMS,
+    pub gspRmParams: GSP_RM_PARAMS,
+    pub gspSpdmParams: GSP_SPDM_PARAMS,
+}
+impl Default for GSP_FMC_BOOT_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct rpc_unloading_guest_driver_v1F_07 {
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 151df05e303b..946e88481d6f 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -21,7 +21,10 @@
         fsp::FspFirmware,
         FIRMWARE_VERSION, //
     },
-    fsp::Fsp,
+    fsp::{
+        FmcBootArgs,
+        Fsp, //
+    },
     gpu::Chipset,
     gsp::{
         boot::BootUnloadGuard,
@@ -40,20 +43,31 @@ impl GspHal for Gh100 {
     /// the GSP boot internally - no manual GSP reset/boot is needed.
     fn boot<'a>(
         &self,
-        _gsp: &'a Gsp,
+        gsp: &'a Gsp,
         dev: &'a device::Device<device::Bound>,
         bar: &'a Bar0,
         chipset: Chipset,
-        _fb_layout: &FbLayout,
-        _wpr_meta: &Coherent<GspFwWprMeta>,
+        fb_layout: &FbLayout,
+        wpr_meta: &Coherent<GspFwWprMeta>,
         _gsp_falcon: &'a Falcon<GspEngine>,
         _sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
-        let _fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
-        let _fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+        let mut fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
 
         Fsp::wait_secure_boot(dev, bar, chipset)?;
 
+        let args = FmcBootArgs::new(
+            dev,
+            chipset,
+            &fsp_fw,
+            wpr_meta.dma_handle(),
+            gsp.libos.dma_handle(),
+            false,
+        )?;
+
+        Fsp::boot_fmc(dev, bar, fb_layout, &mut fsp_falcon, &args)?;
+
         Err(ENOTSUPP)
     }
 }
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index a13146dc0cca..be3e757d05a0 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -7,8 +7,6 @@
 //! Device Management) messages between the kernel driver and GPU firmware
 //! processors such as FSP and GSP.
 
-#![expect(dead_code)]
-
 use kernel::pci::Vendor;
 
 /// NVDM message type identifiers carried over MCTP.
-- 
2.54.0

