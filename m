Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCBE375F86;
	Tue, 10 Mar 2026 02:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108744; cv=fail; b=cPoPW6+0fJGjj/dQqkTXDrZjj3PVPh0hlwxUWm/9tr3/S542nZw2UIYYC7fMCl9NsCkVEGhq1tut3gDhiowkBGFFnRNkwepgQGIvGv8Gd8/Cg2kHNXts8M3tpKC9O+MoUj/xuh3LDdiWhh86YKwGI/h91b1NXiO+RkaJtT7sJsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108744; c=relaxed/simple;
	bh=ScdckF9p77aBqIPikzX/3HZO7PX3N4yGAf+iTtwbOY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ucVAE8PJ9/azSpTQ2KdGsCuPXfVkqALtN3hkpv7b5RGGUJceNl8a3Mxiw2V00qsdA1CSdJJ4+8gRl0e7g7Hs///hWxD8t/lwEHvC0VEzJmoMJoF9LofJZW+nJQRQgejRMkYcc0Ya7G+IvXM1kCHlNP29GeZ5YInNrd/SSX8U9Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=THjTxY1u; arc=fail smtp.client-ip=52.101.52.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="THjTxY1u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzc1Ev5IdhBYjfFjjycthh2xvCGHnDrGpTCDkVWNcz4cHRAE2yFtxjLNJqj31ZFie3vnjMmzSvcuKFWXmneN9I6g/oS8waJgHlv/2wqxRdk5vzf4uz2eQsgONq7Qi1ZUPeAO1r2z2WwB+alGTOzHRgvL+o0DbNstcc/NiWcuH9C+hGzI+rpe4fwfgnnogJwE7OQU9Qr+TNickfLg4Vk70PFqON7Jn0uBUTa9mI/d2HyhrrK/J5cHmsDstHTu1ketL2+m7t7jaXG80lKUOLYkr6/R9x7Wi7h72sLBsanNS9U+lE9PaxtwFNEhotmPGH8Hb982/MBhi3AjkMkm6Wv0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1MvgnZDGIEcdf0QVrRS73taAzzUD+swwxRiPi5YKKY=;
 b=vThCszu4wqCF2tm/HGqO8+bvcycTxGLtBh8/d5CPf1Ww8MDEclJAX7m0lFJIJiUyjnf6Ihs09Gx3tOJQITB/zsho51muWzgzjJFAfntFH4iJS44cGH3wpM4G07xNOjQPHy1yY3hLOaOIGP+6a5bgDnGo8EZwTyqKUYwsgwOd9ZWfV/bu7jSGhF5QU7MwwUs6Z5M/b65Q0m/rH/2WoJn03D30mXILynBxmHVyOTq60du8eiv2eoRFhxXquWI0jfW6SNdXzEB3meCaeN1XYr71rSBpL7p8rKRzDVmrKeMC2Q1w9JEVddKgWdIBUDOJgvOcsHq2HIg/VPlhqasv8IEqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1MvgnZDGIEcdf0QVrRS73taAzzUD+swwxRiPi5YKKY=;
 b=THjTxY1un0qr7FkWVnwsLhqDGjfLBYsz28ZkSovfq2Hw+AZ13XZsrZtb8utTPnAe2/NbZYrRI8J4BqA/6OZuhqCZ4M02RheUbX6FrxXuGCzRGQARNnP20x/Wipt9k8bwNCqKrQNlplrM72SRvcbmxz0oDmS1HVZsip1Q/uesI+pJ6qYFdlBp0uIzuB3EO155lPqgxih9WyXV2gkkLUrvK33YfjJuFXxBccq0shbo7h2wpGJ71Eqc82J8oJvglUHipg4C/EDionmK7zGC9a6PZsvtU7NIzZAqlCSNTPHkZLmvFtiqDixZxM/QThUFMxVKNRfS/Ji8523iEoAnLwgiig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:12:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:12:06 +0000
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
Subject: [PATCH v6 28/34] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
Date: Mon,  9 Mar 2026 19:11:18 -0700
Message-ID: <20260310021125.117855-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 979e420f-1ceb-41c4-3918-08de7e4a6d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	XG4V4Y5AiGEXFh/q8wk4T49TCZW0seQ2YtiX/W9HH1DuLK7CUuFsAZ8f3Q1VuZOV2CqYPvljzgInzEG8/d1MHL5azX7HpQaV60rxi3h6xfhYUgkSiItLfIP7oLqJbRyvp6BlI5nrRbz+5LIUZGofk+dPK1Y6BKWNFTbRu2977M+Pv7KQ1n2FUFfnydGOWG0r8oRb/H6Q39/RsZYMVrDdxA1GEdK5fCg0o7roVSmWbcDzAfaIa2AE+sqUvFXzlXuMN0hqJgyCn7iFzNVpDIh5hl0sg4lu6nk9LqOsDiHvtayiKkKHCE/C7ZjH6S7dKziTxUeK81m41GVfTIRInmvz3M2j11vlz4UFd9YsAXyaTf1pMh/OoFy2mtOCGKZl8g3st3hXmX/UawcrohIO+jIA87dgenuKoQJPXTB3MQDuuQCJf4ewTXXlTY9PCgDvfuYp5812Z+WmNHyi1Cw4EqwY6mrGtgp+5JbKH35QnJr2UHyGyHHIO39BZGYZEaEWG8tmgrJmMqEeS/JSUroeVc7NPfipZpT1F9yoI8bgztgBpB/snA3wYB79ZmMozA3GxElF+1YvR0PzkCUIz/MOfGgIMTji463+esKcKbe7jk5BJZLXNwYRU57oQI7/eiHMn8HcFJAhScdsoTuGQxxfn/cPInaJNVhdJuf+zBnGxIIgdTCaxIcWIonQ7ji344ujk3OiL4VUpv7dKO+huDIBoQPTlQ3cVJzgwjnfcnj0bbeekMk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G+x77AB7c57WbRnytFGRDSVvtferQxG2IXrqI3cXlpMlCGQWg0Zu+V5MRV0P?=
 =?us-ascii?Q?2jWlFlZcTN61akhUx76BzEFkSPSU9/ZCOy0AXzkyVXfAxEtvaslfpAGZD80S?=
 =?us-ascii?Q?eDwwDoZvHRcSrX+OzxmBFYBxGSktfseOsoZ70KWxEpVkitlXPrL6Y0wZsRVw?=
 =?us-ascii?Q?7AI22XYIcoGT5/P5Lusfi9rs6ZEseG3iz1gizaM882KccGmoaIcf0qfmQAzb?=
 =?us-ascii?Q?XUUidOA5ow5ozE2nf112XU+tlFxGAtziN+HkI/w4sr34An3wo0VJBVPPIkAh?=
 =?us-ascii?Q?udiOdGpU+0oIhdp+m3L6SwL0Yn5ZCYHiJLCHAyz7wqOwXtDZPDncwvKBgHKl?=
 =?us-ascii?Q?C95vHFAKAWemtXypPZxDZ+KYDoBrSSlE4gn1ZNX+9KwN9Sr/JbOu0N6uxaNK?=
 =?us-ascii?Q?/QUVePG4dbNQQvk1ohSfjpTfLXQ89NHIrUrec1yqleZUqQAm7WadrjvJIv1s?=
 =?us-ascii?Q?x+8+8sILe8YcUt2MNojERju9+jDDfovqCedFFl+Pt8uHhxdHnYuMFeWf+A28?=
 =?us-ascii?Q?P5JddJ7gS2u6ZTraF8bWmLLQegIsipl5dJUP4np1j76AksS4eclAxcoJMjhT?=
 =?us-ascii?Q?U0OUQ9n9X3zCAs/owDIIrcT1bkTbd5PmtgzTLzhnfCJ+H0Q+0HDgF7NUKihB?=
 =?us-ascii?Q?FwZrrwZWaL/lfXpSTV0PNbYX9B4RF/92QsitR1InfU9xykppOqV6VdNxqqot?=
 =?us-ascii?Q?PMa2hcKKVo9LyGz4nSXsDOu1Eq3gh4jEueD2pKO3Yaq8s5TGd0CHemCxWlEQ?=
 =?us-ascii?Q?ZgNTnYcB8AzPxXbArkblS3ORVs0DOH9usGdJ9gq8RxuT1NJCZyFPfMJBrnQU?=
 =?us-ascii?Q?D4NZK6Q6RZMUAydPAqZn4DUgy+LTevvDiU1di8HXGArHxhmlXF/RZRmelTFz?=
 =?us-ascii?Q?XBtJN7NRKW8pgJyXNk9tR4UVGoAcs9tqXZI0D7i79sdxJcStCYwXc16+vM7G?=
 =?us-ascii?Q?cQTXjupWrW9ldo0GyyVZr4Srm1oV75hEk9L2E7ztl2QWI0/03ZEp+L1Qsw9t?=
 =?us-ascii?Q?+C2dpihivNUJl30yoX9Lje8Opr0mwCgbn3/wNv0XR/KnB3Uok/R23daNNt4H?=
 =?us-ascii?Q?KpgMEbM0yEL2jMMTD2ePZBn+4k0A8c9WV9X4+vyd/AkzUR84hisetuuqyHNP?=
 =?us-ascii?Q?PQbHjiDCp7KyEzt5fT2CN1p1i6G7OvNfHwWTMghqd2/Oztmmg4/qbnWWm3JI?=
 =?us-ascii?Q?C3Qu3GhfQs9oYSDTJ7DgGgaBYkp+eUciNL4bnK7aorFcXQtWECUGIjqLWf7p?=
 =?us-ascii?Q?LWqRscYa00IZxR3cFyz0O5xUQvCkK71W6DemDIyfl6Qv8X/C//R3hQOqq2Zt?=
 =?us-ascii?Q?Y8orKgxc6Z27GKoTSt/ONep//a9WZxqvpGPgMkiCcqlEQfyrlJx2jUF0jc6Y?=
 =?us-ascii?Q?qdXs2cZJojFAq8tLC49eNWlGgPdSFuE/wywPp2raqCcf/TGZNDhiNnWsLMct?=
 =?us-ascii?Q?ir/JJh2TIo3cpU4GiYqb0VEMytPH8vAVw6A7d9JN7kmT+EHvEg0L+WHAuImV?=
 =?us-ascii?Q?F2NIaui6LnxcBLk9AKP93GWdusEWcNox4b2SzBNF1Y5PtH4mki2o2mF8eoc8?=
 =?us-ascii?Q?RwZ0iGh4ZBiBaME/hJm+4wbhC5oUMQ2V97Mgt7ZfUExlTfCYFoUOPmD09j1A?=
 =?us-ascii?Q?puY+Gvje+22gQI5FHlB/5Kqs0lGZy2mzxeuFMo3mLUZq/TgYqkC6+ZZeV8VW?=
 =?us-ascii?Q?YafVaihAz68aB/qt/+WrzZ37K8CA2YizyeCEesXKpNi3tNOzhu1Kwx5JwRFs?=
 =?us-ascii?Q?FCs573dIuA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979e420f-1ceb-41c4-3918-08de7e4a6d96
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:12:06.5942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61Rnck114ZcniaaaJStFwHrrUKO/c9P0mImz2lZLjM2VDniIHaVgQncHRI9Zxx+HUt6Sl2T3CpC9xskQbkm4GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

Add boot_fmc() which builds and sends the Chain of Trust message to FSP,
and FmcBootArgs which bundles the DMA-coherent boot parameters that FSP
reads at boot time. The FspFirmware struct fields become pub(crate) and
fmc_full changes from DmaObject to KVec<u8> for CPU-side signature
extraction.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs |  14 ++-
 drivers/gpu/nova-core/fsp.rs          | 134 +++++++++++++++++++++++++-
 drivers/gpu/nova-core/gpu.rs          |   1 -
 drivers/gpu/nova-core/mctp.rs         |   2 -
 4 files changed, 141 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index cea9532ba5ff..bb35f363b998 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -13,16 +13,16 @@
     gpu::Chipset, //
 };
 
-#[expect(unused)]
+#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
-    fmc_image: DmaObject,
+    pub(crate) fmc_image: DmaObject,
     /// Full FMC ELF data (for signature extraction).
-    fmc_full: DmaObject,
+    pub(crate) fmc_full: KVec<u8>,
 }
 
 impl FspFirmware {
-    #[expect(unused)]
+    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
@@ -36,9 +36,13 @@ pub(crate) fn new(
             EINVAL
         })?;
 
+        // Copy the full ELF into a kernel vector for CPU-side signature extraction
+        let mut fmc_full = KVec::with_capacity(fw.data().len(), GFP_KERNEL)?;
+        fmc_full.extend_from_slice(fw.data(), GFP_KERNEL)?;
+
         Ok(Self {
             fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
-            fmc_full: DmaObject::from_data(dev, fw.data())?,
+            fmc_full,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 8926dd814a83..c66ad0a102a6 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -8,8 +8,14 @@
 
 use kernel::{
     device,
+    dma::CoherentAllocation,
     io::poll::read_poll_timeout,
     prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::{SZ_1M, SZ_2M},
     time::Delta,
     transmute::{
         AsBytes,
@@ -38,7 +44,6 @@ pub(crate) const fn new(version: u16) -> Self {
     }
 
     /// Return the raw protocol version number for the wire format.
-    #[expect(dead_code)]
     pub(crate) const fn raw(self) -> u16 {
         self.0
     }
@@ -221,6 +226,73 @@ impl MessageToFsp for FspMessage {
     const NVDM_TYPE: u32 = NvdmType::Cot as u32;
 }
 
+/// Bundled arguments for FMC boot via FSP Chain of Trust.
+pub(crate) struct FmcBootArgs<'a> {
+    chipset: crate::gpu::Chipset,
+    fmc_image_fw: &'a crate::dma::DmaObject,
+    fmc_boot_params: kernel::dma::CoherentAllocation<GspFmcBootParams>,
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
+        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
+        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
+
+        let fmc_boot_params = CoherentAllocation::<GspFmcBootParams>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
+        kernel::dma_write!(
+            fmc_boot_params[0].boot_gsp_rm_params.target = GSP_DMA_TARGET_COHERENT_SYSTEM
+        )?;
+        kernel::dma_write!(
+            fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_offset = wpr_meta_addr
+        )?;
+        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_size = wpr_meta_size)?;
+
+        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_size to be zero;
+        // it obtains WPR info from other sources.
+        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.b_is_gsp_rm_boot = 1)?;
+
+        kernel::dma_write!(
+            fmc_boot_params[0].gsp_rm_params.target = GSP_DMA_TARGET_NONCOHERENT_SYSTEM
+        )?;
+        kernel::dma_write!(fmc_boot_params[0].gsp_rm_params.boot_args_offset = libos_addr)?;
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
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -315,8 +387,66 @@ pub(crate) fn extract_fmc_signatures(
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
+            let mut frts_reserved_size = crate::fb::calc_non_wpr_heap_size(args.chipset);
+
+            frts_reserved_size += u64::from(crate::fb::PMU_RESERVED_SIZE);
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
index 02f69c5975d3..e9d07750fafe 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -140,7 +140,6 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
     ///
     /// Hopper (GH100) uses version 1, Blackwell uses version 2.
     /// Returns `None` for architectures that do not use FSP.
-    #[expect(dead_code)]
     pub(crate) const fn fsp_cot_version(self) -> Option<FspCotVersion> {
         match self.arch() {
             Architecture::Hopper => Some(FspCotVersion::new(1)),
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 0dafc31b230c..c4e36a46fd69 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -6,8 +6,6 @@
 //! Device Management) messages between the kernel driver and GPU firmware
 //! processors such as FSP and GSP.
 
-#![expect(dead_code)]
-
 /// NVDM message type identifiers carried over MCTP.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 #[repr(u32)]
-- 
2.53.0

