Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2082EA48F;
	Wed, 25 Mar 2026 03:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410814; cv=fail; b=DFf58I8Ma7BoRXcipqwWSQc22Q94VldhJtgL+NFBXXREnh13Pom+w+2qsCn7Io3RzIwExzdII1h8FEQ1jTo16CLsY6L4pU97DynJ50rvFON/3gdvXUEPmh/QlSbvuLBJ8YvcC70ttvqbkTEJqMErMDHk3xt5Sh+yb7ohgVSz5OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410814; c=relaxed/simple;
	bh=KC/j1FO07sslgQ4M7bJz6a9s54ybhGBa25E/JPGu0Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kjL0JDK4YtxDAvQuVKAGATfJIE6J1O6W+ytBBdElaU2lyfnnpWF8fiVJqNiYHigLFhintJRbN4QUPr/Sqii7UvZM7Pyd33LIbtShxoQLLXcgSL/h8Ud3CGVw6qPK6+uhmJWETEYD2xFWHUXM5xnthx/+gK+y6Xatv0C9e08Kfb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mFE2BGwZ; arc=fail smtp.client-ip=40.107.208.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mFE2BGwZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frbY0Zgt1GLQUxsnvANyghYH2fT+N1G5ZguIpGYSG5BV0jbnURPmGYDtaJN1ewETZRZlWMy7lv4Z/JhX7X2XtCGTsTERVOjQswlGAidSwMBiWQAC0YxkW3pjSX1vdGuuoC2vLZTis1JOdQ0lHd1uP0+wUcKmRYtEcN0HRNCbmrwjrJLYVrMetoLUETb/wVM29uJeykJKzcLjfNMBDXousHPqChYknBPyuF2cHZfZEbt6LvF9YyHLz/f1Lyp2w1aKIkgRxPBjq8hnYi871qPnzg1AhsynQ7DvLq7Zi1vDwa10RunILacxyZ84ZyRC+GLPtf4kMFtVVsxc83HXgsApKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBXkjFwo763JBBF2x61W13CnpsZSV0cl33JTvKagIYA=;
 b=i8cKSKRpYocfMRqUqu3ZFvrttz0W3KJiGGJN6QlYHSngWfE1xxXCODZz9nQxNIKqGkAnbQD5GsoYUfJ8igo3xrSm+O8YT4v+h4fbmpuduOYjnb/Q1051E9s6/d38HvDUGcCcmpozYZLzx6trsrdLm8dr2DDicyoihQZuiW5lDvpvdHqMA1LwESO28XI29MlZqWACor0uIeHCCReHcLkQNQPNThodMkaJgZnHPHvFWMCuBZIPrhuJakLTBip/3lz/uG7sYKW3lP7nXAOWsrrTFvzURGrxlGhZUYhYs3ka33NsOa8Qj27lVzzON0lbtmo5xkKH02r9z4dWrl5VbdiqxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBXkjFwo763JBBF2x61W13CnpsZSV0cl33JTvKagIYA=;
 b=mFE2BGwZZCEN0R0dWPMORSpEnkhaRUe6lBPJWHqbSe8lyRIWM2/5J+yJD+UdbvKbtnKxKggGY6zd7KR2xlNvu8tPEEcz6W7B4oCUYQK7do04cqP/STkUjAmG56khSS7NOCjuBKIghR4yb6Ui+B+DgMQexkl2iOFsBSmsWSLkRJ4c4YoWa5U+eXtd66SRJTPZ1Uur/2zdODmjaNpYjfmfHqAi2eha1m+hAhpw7ID6G3AaK53sZjGP11qFaoy8nXRTOz0kTbILQ7/hnqZZ5b/uZ55fMW7FYhsnf2qpnDV6tsXs+zl+Few66nBfHF+reh+U945ahNrycFRdlvo3/U+BSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:15 +0000
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
Subject: [PATCH v8 24/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
Date: Tue, 24 Mar 2026 20:52:35 -0700
Message-ID: <20260325035242.368661-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd97298-9b81-40af-00eb-08de8a220b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZimULAsFepG7SEHPqCr9GmPFvR5KCn61Ee7jVK0bZs+ExwS+4DC59nHhwBVOmUDdhHbLp0LzcXG7Dm1cg/YQxn4KtJcsuQoDNcCSmjWN3A7L35l60qdj2MXbCYz59ZfXENaLg5vV0eGRiEs9K1DvBOs0qrYTWtinWVkZNhSvCuVD/2qvtcg51x6yX0ZVXFmRD6l3W3LdxZ3ztpnF949F7WsIxz//k9O1qlISV6sBcPHclm2WXbag4UNcupy7wMfKSl8S/B1jvX+SdgF9EZPyaLvShKnrc0Bb97K00yirYIwzeFN2YW5SOongs1CGNE37JXqJOfDZsL64JTAkS3tnD01hzWxTaaytUeMIfsLp5ojQvTCZErSDJ1CyfTNRmEw3GK4kqIOO5vwesXxRlxI30TJ399Qxh43q1pampOuLP96KpuNJ+504vnrrkJon+YM6rCw71jNnWwcdDv2tI09s047nkTjsZJZwBy2kI3K2AvX4T3iXHe8JoYf0fPycT7IEeIGozwXTytz5vNQZEOHpL4vlEUsm+J/VwcTVBZCPoh+1RrBBdMb7rKCiMmYyQ8PEUdiSTF+RDYdQV6y0CjzWbqqBTCdlCaINp9qdSw9VlXqjOHx3eT+Led4IMk/HdMAgKjf6Ewxsfy5xalqO1Pkk7rMvkALK3dU7JlXZuXznAj/kDeg4h+Ju/A3D6d5GjeWMngAet/74sTy9nBgmKwpxAUmu+5J2aiYcClcsC16xxCw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nOqAYpKu5RlMxnTvgyb93F8apbp7BHnHlSsV3AeV5JelucEd518qjXoA3fk4?=
 =?us-ascii?Q?DzWF9EC7k9Ux4pTGx+4/AEu8dcOQVRI4BL+0jiNAVA+sOrSQdbHkrQK5LfrG?=
 =?us-ascii?Q?ZkCGfH8lsTCsFwj87OkLGiSAcCPipTugqGxgZb5kibe03Kyk4gPO+nGnYVIA?=
 =?us-ascii?Q?KvebitroGPbYKTZE5rL+pduO8RtBflrvTku6sXICK+nCyKdoYF4+Pa39UFzs?=
 =?us-ascii?Q?2q8+PbiJ6EnsJVxrr1uc+YjE2R+adWRUO6NLwZ+ISb5UA29shBNkCEtKqR+K?=
 =?us-ascii?Q?xiGKW8pEq6XtFdlHIIrp6fQLHyr60l1zpmHHYXcU0fNI7pYgmNt3+OsRuJgZ?=
 =?us-ascii?Q?NrewS4Rjx7Ahi5HAkUmrFCfaxv2KcxRDuAzUuiEqImO4NTDQK9yIc59GIlIY?=
 =?us-ascii?Q?h82xgVNu5Zcr8Wp/f0nDbHlz4nrA9pPFy/DacQvOw+zmZMyItZO0l2A7e6N/?=
 =?us-ascii?Q?JRhcAgLtXO+YMakd5Pi27oszgt5U9gv8iZrKVhZnTvMgJpLXJcLz2MnDqb5h?=
 =?us-ascii?Q?j4FPp53vDJKVJjJbS17ZEeJR356xKwM9/SU0CqofGBOxs9HRtPF09GXaQ/la?=
 =?us-ascii?Q?PjburJXwRceuTdFa2kVUb+Jk2djIC7LG9W+4ngsrUdbBXNZ6qUnw+wrZc4Dh?=
 =?us-ascii?Q?JZ0KiLllFm0gC99QAxdGdmERLJC6RPSW/frjh9WtmJlqdG5rFrLpH2sJg44g?=
 =?us-ascii?Q?D9/KoTux24Bks2u9Miti9nuM5LgM9KP9w9uSbT/DVJnmnR5KXys2Gi4vWIOz?=
 =?us-ascii?Q?k3wW/V53G2UcVwuYR1mnzHVqDBf4LJamEZcFYxlVEMBuj2/FzyBSbRdIOiL8?=
 =?us-ascii?Q?ni/r5aU6W83tBASjh+rE2J+u8OnByH+hlBC0EcoqpEondpWXrt7vy+809235?=
 =?us-ascii?Q?D+tlkYTUQlj0C42wdSZyx7v2abs6MQpi6/FB4cKZeO7LHnoJEWaBZ109KeKs?=
 =?us-ascii?Q?IkCw6wB4QdHL1aAokfCA3Qb4216DBJyuJV2pjYcdAhNGBHgROFkUkTIr5HFn?=
 =?us-ascii?Q?VdlAWWEevGb2awoaGN9ITJ7DJpkR5EX6kEg/Mww7Rpepdn3BpzpHzzc+nFZN?=
 =?us-ascii?Q?QCgKv3KKyoGBTy6H6PjL2AyT1L8TYDURf9nafant+1HsCuqKYMr5Np5XpgKP?=
 =?us-ascii?Q?UdfTky4PtuYkOmQ+RME+eMnfqte5PEQJWHgMwWSQ8kEMrWoTCDLBaFnOR9a4?=
 =?us-ascii?Q?HvsgBHlWt0sQg8F7G+/g0M+iSINGB4tU4Tofljze1jGyVDmLVeCygFGffjUF?=
 =?us-ascii?Q?5VL5lYoz1jjIwBwzUciSeG3dw+Mx70IAPJIlyT9nUT55RZxztgt2RGqb+XLn?=
 =?us-ascii?Q?czm5qCncwUDz/f+YwrU6u3XFbdbB1YXSNVSRPo9Z+kjiOgpkZnBAgbTua0yd?=
 =?us-ascii?Q?H1gXLteilErRQeO99LLeS/vbgxFbX7iVUVUTbZ7Md8AW6xd1V6Ds/Uyx5lc+?=
 =?us-ascii?Q?iFAFFWDSCFQ0zyILBGYwtV3Yb2lbKQfWH0sv+IwcDj5OpD3PQw7IaCUF3hNY?=
 =?us-ascii?Q?5ka9lTMwIP6XmtaWtJQPdLnwYtWb16WF2b9EQlEWHPuLGMHfYGD49mVoenc2?=
 =?us-ascii?Q?aP742ghdp01Xl5nHsokp7Ajrczs5QVEKyiePLzdb/ldWCFBOlC1G3D0sonl7?=
 =?us-ascii?Q?GtNhSaHfG/cbBxXIgGT5/a7XCTVm950D2hOGYAwdcKjKYKwDXFiAFHOk2TRL?=
 =?us-ascii?Q?BHXmodlOhnIUPSZzD/5ZwnuNT4XMeX6thBwDH84ax1yAG3dj89brznNbmbbq?=
 =?us-ascii?Q?7Ap8WL+NaQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd97298-9b81-40af-00eb-08de8a220b36
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:15.6992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1m/pLK2IEcCD5chHY0d09u/v28T8wv3qTxh9A/bc1DUMm5qXff1w+dKoPQ0/w9WIv26wrfAFmUwF0nv+t+7kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

Add boot_fmc() which builds and sends the Chain of Trust message to FSP,
and FmcBootArgs which bundles the DMA-coherent boot parameters that FSP
reads at boot time. The FspFirmware struct fields become pub(crate) and
fmc_full changes from DmaObject to KVec<u8> for CPU-side signature
extraction.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs |  12 +-
 drivers/gpu/nova-core/fsp.rs          | 177 +++++++++++++++++++++++++-
 drivers/gpu/nova-core/gpu.rs          |   1 -
 drivers/gpu/nova-core/mctp.rs         |   7 -
 4 files changed, 182 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 5aedee8e6d41..e5059d59a4b7 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -14,24 +14,22 @@
     gpu::Chipset, //
 };
 
-#[expect(unused)]
+#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
-    fmc_image: DmaObject,
+    pub(crate) fmc_image: DmaObject,
     /// Full FMC ELF data (for signature extraction).
     pub(crate) fmc_full: KVec<u8>,
 }
 
 impl FspFirmware {
-    #[expect(unused)]
+    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
         ver: &str,
     ) -> Result<Self> {
         let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
-        let mut fmc_full = KVec::with_capacity(fw.data().len(), GFP_KERNEL)?;
-        fmc_full.extend_from_slice(fw.data(), GFP_KERNEL)?;
 
         // FSP expects only the "image" section, not the entire ELF file.
         let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
@@ -39,6 +37,10 @@ pub(crate) fn new(
             EINVAL
         })?;
 
+        // Copy the full ELF into a kernel vector for CPU-side signature extraction.
+        let mut fmc_full = KVec::with_capacity(fw.data().len(), GFP_KERNEL)?;
+        fmc_full.extend_from_slice(fw.data(), GFP_KERNEL)?;
+
         Ok(Self {
             fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
             fmc_full,
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 18edf7a1a8e4..faa0b3ae88ba 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -8,8 +8,17 @@
 
 use kernel::{
     device,
+    dma::CoherentAllocation,
     io::poll::read_poll_timeout,
     prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::{
+        SZ_1M,
+        SZ_2M, //
+    },
     time::Delta,
     transmute::{
         AsBytes,
@@ -38,7 +47,6 @@ pub(crate) const fn new(version: u16) -> Self {
     }
 
     /// Return the raw protocol version number for the wire format.
-    #[expect(dead_code)]
     pub(crate) const fn raw(self) -> u16 {
         self.0
     }
@@ -156,6 +164,35 @@ struct NvdmPayloadCommandResponse {
     error_code: u32,
 }
 
+/// NVDM (NVIDIA Device Management) COT (Chain of Trust) payload structure.
+/// This is the main message payload sent to FSP for Chain of Trust.
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
+    hash384: [u8; FSP_HASH_SIZE],
+    public_key: [u8; FSP_PKEY_SIZE],
+    signature: [u8; FSP_SIG_SIZE],
+    gsp_boot_args_sysmem_offset: u64,
+}
+
+/// Complete FSP message structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspMessage {
+    mctp_header: u32,
+    nvdm_header: u32,
+    cot: NvdmPayloadCot,
+}
+
+// SAFETY: FspMessage is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspMessage {}
 /// Complete FSP response structure with MCTP and NVDM headers.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
@@ -176,6 +213,84 @@ pub(crate) trait MessageToFsp: AsBytes {
     /// NVDM type identifying this message to FSP.
     const NVDM_TYPE: u32;
 }
+
+impl MessageToFsp for FspMessage {
+    const NVDM_TYPE: u32 = NvdmType::Cot as u32;
+}
+
+/// Bundled arguments for FMC boot via FSP Chain of Trust.
+pub(crate) struct FmcBootArgs<'a> {
+    chipset: crate::gpu::Chipset,
+    fmc_image_fw: &'a crate::dma::DmaObject,
+    fmc_boot_params: CoherentAllocation<GspFmcBootParams>,
+    resume: bool,
+    signatures: &'a FmcSignatures,
+}
+
+impl<'a> FmcBootArgs<'a> {
+    /// Build FMC boot arguments, allocating the DMA-coherent boot parameter
+    /// structure that FSP will read.
+    #[expect(dead_code)]
+    #[allow(clippy::too_many_arguments)]
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: crate::gpu::Chipset,
+        fmc_image_fw: &'a crate::dma::DmaObject,
+        wpr_meta_addr: u64,
+        wpr_meta_size: u32,
+        libos_addr: u64,
+        resume: bool,
+        signatures: &'a FmcSignatures,
+    ) -> Result<Self> {
+        // `GSP_DMA_TARGET_*` is not in the current Rust bindings yet.
+        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
+        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
+
+        let fmc_boot_params = CoherentAllocation::<GspFmcBootParams>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
+        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_size to be zero;
+        // it obtains WPR info from other sources.
+        kernel::dma_write!(
+            fmc_boot_params,
+            [0]?.boot_gsp_rm_params,
+            GspAcrBootGspRmParams {
+                target: GSP_DMA_TARGET_COHERENT_SYSTEM,
+                gsp_rm_desc_size: wpr_meta_size,
+                gsp_rm_desc_offset: wpr_meta_addr,
+                b_is_gsp_rm_boot: 1,
+                ..Default::default()
+            }
+        );
+
+        kernel::dma_write!(
+            fmc_boot_params,
+            [0]?.gsp_rm_params,
+            GspRmParams {
+                target: GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
+                boot_args_offset: libos_addr,
+            }
+        );
+
+        Ok(Self {
+            chipset,
+            fmc_image_fw,
+            fmc_boot_params,
+            resume,
+            signatures,
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
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -277,8 +392,66 @@ pub(crate) fn extract_fmc_signatures(
         Ok(signatures)
     }
 
-    /// Send message to FSP and wait for response.
+    /// Boot GSP FMC via FSP Chain of Trust.
+    ///
+    /// Builds the COT message from the pre-configured [`FmcBootArgs`], sends it
+    /// to FSP, and waits for the response.
     #[expect(dead_code)]
+    pub(crate) fn boot_fmc(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        args: &FmcBootArgs<'_>,
+    ) -> Result {
+        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipset);
+
+        let fmc_addr = args.fmc_image_fw.dma_handle();
+        let fmc_boot_params_addr = args.fmc_boot_params.dma_handle();
+
+        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
+        let frts_offset = if !args.resume {
+            let frts_reserved_size = crate::fb::calc_non_wpr_heap_size(args.chipset)
+                .checked_add(u64::from(crate::fb::PMU_RESERVED_SIZE))
+                .ok_or(EINVAL)?;
+
+            frts_reserved_size
+                .align_up(Alignment::new::<SZ_2M>())
+                .ok_or(EINVAL)?
+        } else {
+            0
+        };
+        let frts_size: u32 = if !args.resume { SZ_1M as u32 } else { 0 };
+
+        let msg = KBox::new(
+            FspMessage {
+                mctp_header: MctpHeader::single_packet().raw(),
+                nvdm_header: NvdmHeader::new(NvdmType::Cot).raw(),
+
+                cot: NvdmPayloadCot {
+                    version: args.chipset.fsp_cot_version().ok_or(ENOTSUPP)?.raw(),
+                    size: u16::try_from(core::mem::size_of::<NvdmPayloadCot>())
+                        .map_err(|_| EINVAL)?,
+                    gsp_fmc_sysmem_offset: fmc_addr,
+                    frts_sysmem_offset: 0,
+                    frts_sysmem_size: 0,
+                    frts_vidmem_offset: frts_offset,
+                    frts_vidmem_size: frts_size,
+                    hash384: args.signatures.hash384,
+                    public_key: args.signatures.public_key,
+                    signature: args.signatures.signature,
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
+    /// Send message to FSP and wait for response.
     fn send_sync_fsp<M>(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index eb7f8be893b0..424ded73de2a 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -138,7 +138,6 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
     ///
     /// Hopper (GH100) uses version 1, Blackwell uses version 2.
     /// Returns `None` for architectures that do not use FSP.
-    #[expect(dead_code)]
     pub(crate) const fn fsp_cot_version(&self) -> Option<FspCotVersion> {
         match self.arch() {
             Architecture::Hopper => Some(FspCotVersion::new(1)),
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 9e052d916e79..c23e8ec69636 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -6,8 +6,6 @@
 //! Device Management) messages between the kernel driver and GPU firmware
 //! processors such as FSP and GSP.
 
-#![expect(dead_code)]
-
 /// NVDM message type identifiers carried over MCTP.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 #[repr(u8)]
@@ -101,11 +99,6 @@ pub(crate) fn nvdm_type(self) -> core::result::Result<NvdmType, u8> {
         NvdmType::try_from(self.raw_nvdm_type())
     }
 
-    /// Extract the NVDM type field as a raw value.
-    pub(crate) fn nvdm_type_raw(self) -> u32 {
-        u32::from(self.raw_nvdm_type())
-    }
-
     /// Set the NVDM type field from a typed value.
     pub(crate) fn set_nvdm_type(self, nvdm_type: NvdmType) -> Self {
         self.set_raw_nvdm_type(u8::from(nvdm_type))
-- 
2.53.0

