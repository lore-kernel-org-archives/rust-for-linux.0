Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954603C6A45;
	Tue, 10 Mar 2026 02:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108752; cv=fail; b=baSxKfPDrmBAxgxMtLdl9Hi/T7peYllTmGCyq5YK9lqV1hJMWruWOA/PTqya1mAC9FD6y8/LS/ouMm9u2thFyR/DaSD7tFoaKqvLNVhcArGa7wFMZ12g7xfP+B3m7n9dpPWHLfpmw+kqhPZbegy/VQG6r1hdX4+/U5odEMSoSKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108752; c=relaxed/simple;
	bh=6G2JUHHlX2OAB4dsYdr7lpsiNYssExTzB4pEL8QlDx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VX2KPeODnUy+7LoOivzeihInUAk6edhZNfPIR3CSNWK/c9qjt5s+Ijve8gTz61N9FVhU5MxmcMrI68wN2bMGhOHiExVtZBwgA71YUlSlnqVW7LV48ctmHwVwIg9AbFSz7xIamTAvuKqFSiTc25eYD5isK0YU8oi8R3glVGw0WWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jiO0v44N; arc=fail smtp.client-ip=52.101.52.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jiO0v44N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZfcaT51RZhBm8J8hsfLvRxaqwXden31731SvZgcU3WbRQTj4Hb/3iX+zsbI6r1wu7WZiP1P/3VE960by9eFgxiWK0f4Wh7/LK/pFDzXOTuih+sQp9pNn/AUaTYi/mh6ygoAGNMLBz6cR9rF6BxCPKw5RyoTBKG7if+rq0Z1RHUKJcoLdJEUd8N3/kixMZddCk1IswsDaDG/PTW6X6OOLEqXWSeZGHlE2E1NIs+7jZv6Km4MRYoK5kA3YS3MOhcDAxBz/5xO8SbLbzP4mvxVorpB/Db5d3eUedjO6iQ+zOTBbZLnj/+UVq4sROVphmp38VYiUjTLm/lAKSiKgx65Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9W0jxM9/z1rkpSb1Rd846MIn7g+icpbx9HD7snfh32E=;
 b=anCORlXUGq+jyvGzbfIMbAu+NxeGnMPxJRjcHMDsY9picx+RvdyMab0JGvk6NarjuhCRTpEmgl1AtM9BRUpEJHGHD34eG4g49dIDqaXOrzq58lxi2ucOqwDeicXAZlQqxIMC/V7mX5D8Crb/5UWiX8s2aRJHwfAtb/GA7sGjReYLzEqv20HeJzqtsk8l5WNLZQPqMbzRfT35IiLvfOb0uq4g3jAZ9FgqyZmcEyn1qTkcUXnnXZF4z7a/4FVtzYhRmoFGnxJILdG8AOyZgsB/MyeUUFialhxdizSslHYzaiqRjcof0wNI5yIsVDeAe+r1ACFNDrMTi7Iyn3Z/Id6HLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9W0jxM9/z1rkpSb1Rd846MIn7g+icpbx9HD7snfh32E=;
 b=jiO0v44NBDOqz9F2SDLAq0gR4Db9+LHfmNuRqJRimlCVWJ5+Ns0hdp8RTjGqQgKIv1Exz/8sSg+Hv2RfBsXomJpXUMFslmvF3JZZMKzagfxv9KUgHsElwTiyaHf26aNDNra/XXEHIiAipzEF01Pw9Twz44oXsCiDnTovn3DZ/uvb6sC2Oefr+8HsDy6+S7cP7C9PC6FaH7ZpAq5bQrWMi73txp7BmjnAhV2qP9VlE1y3++oxrWGk4fG5Sm6uPDaar1Pvnnuk2H0tVFhtVcbn4C/zGBOri3m/wZ13gaHhrKN95G+/jL5wF4O68FHkPusbJQH8S+5mv+3DEYrUtvP/eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:12:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:12:14 +0000
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
Subject: [PATCH v6 34/34] gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()
Date: Mon,  9 Mar 2026 19:11:24 -0700
Message-ID: <20260310021125.117855-35-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b0f386-3d17-4a40-3289-08de7e4a723d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	EIb2Twmth/8eahCGBgTTPFBeDPIfUIBWyHXY+HEAbAV+k4siDp8hmPMWwdUFW3Hb6PAtBuNz/y/KSLUGARWjzavcAN5+drkQcXzGgMqplj+zWqUFTXxEaX3FUo/NZ0HrsM5a8uSMtsVUW5ne37megJmiFYTvy0sUUVNPsidYiTEItqecCUV2EvDSMoEL/IVvriZEpIaMn1N+YWq3LPlAsj9L0tVqGa21vaR75cew3gKRVvXwyAdD0j6Q5E0adZzj+xfKUcSoqF5vFaDFcxSLqwKzOU4phOimcSt6Dwm/z7EA5dia6kBIn501IO3hQaeaND46OctZQV1vToc+UAhEKgQxN3A97wBJeJwGe6EwEE7tKc1r6R1N1bRti7w4ebQx+0nqctS7WB7DycGXhSGXWAV4gjIY6BFb906DWCeZlLW0Z8epM4zbKDWRocoE/AND2Ig33gwq77StTvlzVusYqG9hVCYC+rlykXuaMy+dN8ekDN5ph85swyflwCHjFfvOR2B+qMKQWYPqmhy6TowQ9n7Q1t/9RSueqmaW3N3hT7h3O844gT5LxAcxwCmP88IQQRP0vEW1LU/OQ63wCm5Ki419E6TZD02WF5CWlIPpG0ee+pX4qA6GsUsziswgBY5jZ46PtFTHjbYFeZjIAMARnArKIvGEOWkc5fsxmCKjnydWLuLBOL6t0ZtcxoodUmtwpv289HAeLNrux8vbQkq1eal1vPCSppBwy9xpa+ubeHo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+dBD/GdiHY4sbXJz1PiTO6QU/DzDIEipvCrtHTr3HBY3U7WfZyWWfDLtha5+?=
 =?us-ascii?Q?/jxMVU++glQqJ5RAeSoWohY2I6Qsi1g4vIK/+hiSauEO3sJboBlwGoKJMdDS?=
 =?us-ascii?Q?XZrqJI2C5hSMpBlGJk/FX6/7it3KbxkdFX9ahIWMMN4EABuWBxkbbjG5k2n3?=
 =?us-ascii?Q?xbepw53pkoBSnV1Wam5wJLzrO50qZCwb9W2eCBJotYmu2zvZVuSjy4VEi1pj?=
 =?us-ascii?Q?yUPjBMFaaVgR7dycTQfvQ/KeweWDnUCj7m678Mi00/oNWIut1Rrt89TmT2P/?=
 =?us-ascii?Q?tNyrldeWxAPqT0ObU/RXRYpK3qeVDXAogiEoTwvMfPFXvyVyVqjVwrD/NlLO?=
 =?us-ascii?Q?n6mmMaA25IvKs6ZvRlRBk7JIVOG39Dc0Vnb1gjLtQKmdA1NQGV/BB3DDQRsQ?=
 =?us-ascii?Q?3YQXX5vQSr5hA5pQWJgWKsCjAHzB9HBcS0ymHoKHmHR4m9gVAVdxV4NISjgL?=
 =?us-ascii?Q?fpo5dVa/pcs2iH5Ku4Dpmy38mYjMWQYqfI6cbUYBx4SmkALjv0BtNbkOyg1u?=
 =?us-ascii?Q?mdNIZ2gW4xTCzn/nIB4qryDk/eaD4Yck31jD9/83OkDum0JjHeITY0lGClP3?=
 =?us-ascii?Q?6WrkkYT8gDD1jNlz+wc1L/ecy8cRhv+qCzjWrmbjOorDia7UVT9yz2RAyUQP?=
 =?us-ascii?Q?bUehxDykMiMKXGIWC5aiw1yuExSTp5OlLdyXR0SzoM22LlAr0FNW4V1qv6Iz?=
 =?us-ascii?Q?/XQrIhN4h2gKzWkmLtHx+j9/IsAk91YjUEj1K4q+VsaTD9KEqsF32LAJAX9M?=
 =?us-ascii?Q?CvveZw8KwGNsErzh5tp2smNiEVPTYG4OCIe9u9MaColUvzYNa9iR0ktRkv0X?=
 =?us-ascii?Q?w9pMDBxvQU9TJRwgFdvjH+/Q4wNH6PHME1Ngd8m2M/KrXMBtVdOQPegVhp8P?=
 =?us-ascii?Q?bEGYZn9zKYj12u1OrJhaJyIE7FRICM32b4l1AGVdipj4QR1kBxbkt8tuDB3U?=
 =?us-ascii?Q?MWIUiRcOm979IclHETdjp+zGCn6SvmPoOLPDgs0+UKEv9SZU7wpPZqW1UDHk?=
 =?us-ascii?Q?IgpjJruhePOc3wDkv+lzaUp+mkwzN2fA7KR6PUiMq+UwSfc//eBuNvm3G/9S?=
 =?us-ascii?Q?Mr9IMnow8YXQh9FmiR8gqeIGRFKMevLmqEgPowAY9PJC0QRNArC4U3W66cA4?=
 =?us-ascii?Q?/wNDidbzenWLFRS9l0TBiATSZ/UV0CAp35Li5F74KK1M/R2XkhW9hXWiJoxX?=
 =?us-ascii?Q?a+Q7OGb4ApavbeCjIZ/mYpOJ5go92JFiCCC/vgKvOXLLRVf/FRe5jupDc6NL?=
 =?us-ascii?Q?Qup83yycsvJZYri+Smu+9yvqR2KXzPuTERNfUTzkeyDKzO8X+FCortIarQZK?=
 =?us-ascii?Q?f5rO2hEpFgkj4ywbPpkQiX5QfseGEMIL4m0PBcqBQuqLqiOgE90sWciT/58U?=
 =?us-ascii?Q?VCPSL9Jqy1UhPdthyAlCYuQlLRFeHCI27/dBu54UazBN5MAPSKftppXTqqJe?=
 =?us-ascii?Q?A4O6iv/9VlO5dClCH5GIfOFuace7D/9+TJdjNSoegNY8Q2+pPVAuEDfv2bwG?=
 =?us-ascii?Q?ZCY2s3CU8DCGxBTjoT5XHxaicSO06NhYo0DsT9VuOyOLWn/CXoi3Z2W3rrRV?=
 =?us-ascii?Q?3YrBBFwNIW/MYpLucTLW58REs+DrjkdeQb+uJ1WgrZBOxT87urF3rRCucvuU?=
 =?us-ascii?Q?ZV0NphWibbtzUiQi681LnAVXuiOT03ns3v+Pymb+rU8eXxBeIIEUhYGH/t3X?=
 =?us-ascii?Q?e1T2Kw6/+ysbzgQTUxQvUX0VYtsmFzvvxfqgj7oB5XQIaQG8OdjLomLIq0u+?=
 =?us-ascii?Q?Y55DCPJadA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b0f386-3d17-4a40-3289-08de7e4a723d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:12:14.5206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6SwRcWPt9K0ChxC0D7KBJRY1MW+ficaBwdAquJe8EZtMvzLvXiVH/JLIz0B3LHhPaHDeghzWH2ghnNwnaH7Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

Add the FSP boot path for Hopper and Blackwell GPUs. These architectures
use FSP with FMC firmware for Chain of Trust boot, rather than SEC2.

boot() now dispatches to boot_via_sec2() or boot_via_fsp() based on
architecture. The SEC2 path keeps its original command ordering. The
FSP path sends SetSystemInfo/SetRegistry after GSP becomes active.
The GSP sequencer only runs for SEC2-based architectures.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs |   2 -
 drivers/gpu/nova-core/fsp.rs          |   5 -
 drivers/gpu/nova-core/gsp/boot.rs     | 181 ++++++++++++++++++++------
 3 files changed, 144 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index bb35f363b998..0e72f1378ef0 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -13,7 +13,6 @@
     gpu::Chipset, //
 };
 
-#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
     pub(crate) fmc_image: DmaObject,
@@ -22,7 +21,6 @@ pub(crate) struct FspFirmware {
 }
 
 impl FspFirmware {
-    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index c66ad0a102a6..3749b5e3a677 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -238,7 +238,6 @@ pub(crate) struct FmcBootArgs<'a> {
 impl<'a> FmcBootArgs<'a> {
     /// Build FMC boot arguments, allocating the DMA-coherent boot parameter
     /// structure that FSP will read.
-    #[expect(dead_code)]
     #[allow(clippy::too_many_arguments)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
@@ -287,7 +286,6 @@ pub(crate) fn new(
 
     /// DMA address of the FMC boot parameters, needed after boot for lockdown
     /// release polling.
-    #[expect(dead_code)]
     pub(crate) fn boot_params_dma_handle(&self) -> u64 {
         self.fmc_boot_params.dma_handle()
     }
@@ -301,7 +299,6 @@ impl Fsp {
     ///
     /// Polls the thermal scratch register until FSP signals boot completion
     /// or timeout occurs.
-    #[expect(dead_code)]
     pub(crate) fn wait_secure_boot(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
@@ -331,7 +328,6 @@ pub(crate) fn wait_secure_boot(
     ///
     /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
     /// Returns signatures in a heap-allocated structure to prevent stack overflow.
-    #[expect(dead_code)]
     pub(crate) fn extract_fmc_signatures(
         dev: &device::Device<device::Bound>,
         fmc_fw_data: &[u8],
@@ -391,7 +387,6 @@ pub(crate) fn extract_fmc_signatures(
     ///
     /// Builds the COT message from the pre-configured [`FmcBootArgs`], sends it
     /// to FSP, and waits for the response.
-    #[expect(dead_code)]
     pub(crate) fn boot_fmc(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 7b49ca6e7a41..11fc469c42ee 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -13,6 +13,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        fsp::Fsp as FspEngine,
         gsp::Gsp,
         sec2::Sec2,
         Falcon,
@@ -24,6 +25,7 @@
             BooterFirmware,
             BooterKind, //
         },
+        fsp::FspFirmware,
         fwsec::{
             bootloader::FwsecFirmwareWithBl,
             FwsecCommand,
@@ -32,9 +34,17 @@
         gsp::GspFirmware,
         FIRMWARE_VERSION, //
     },
-    gpu::Chipset,
+    fsp::{
+        FmcBootArgs,
+        Fsp, //
+    },
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
@@ -197,8 +207,83 @@ fn run_booter(
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
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
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
+        dev_dbg!(dev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
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
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+    ) -> Result {
+        let fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+
+        Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
+
+        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+
+        let signatures = Fsp::extract_fmc_signatures(dev, &fsp_fw.fmc_full)?;
+
+        let args = FmcBootArgs::new(
+            dev,
+            chipset,
+            &fsp_fw.fmc_image,
+            wpr_meta.dma_handle(),
+            core::mem::size_of::<GspFwWprMeta>() as u32,
+            libos.dma_handle(),
+            false,
+            &signatures,
+        )?;
+
+        Fsp::boot_fmc(dev, bar, &fsp_falcon, &args)?;
+
+        let fmc_boot_params_addr = args.boot_params_dma_handle();
+        Self::wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_params_addr)?;
+
+        Ok(())
+    }
+
     /// Wait for GSP lockdown to be released after FSP Chain of Trust.
-    #[expect(dead_code)]
     fn wait_for_gsp_lockdown_release(
         dev: &device::Device<device::Bound>,
         bar: &Bar0,
@@ -242,40 +327,49 @@ pub(crate) fn boot(
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
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        // Architecture-specific boot path
+        if uses_sec2 {
+            // SEC2 path: send commands before GSP reset/boot (original order).
+            self.cmdq
+                .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+            self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
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
+            Self::boot_via_fsp(
+                dev,
+                bar,
+                chipset,
+                gsp_falcon,
+                &wpr_meta,
+                &self.libos,
+            )?;
+        }
 
+        // Common post-boot initialization
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
         // Poll for RISC-V to become active before running sequencer
@@ -286,18 +380,31 @@ pub(crate) fn boot(
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
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        // For FSP path, send commands after GSP becomes active.
+        if matches!(
+            chipset.arch(),
+            Architecture::Hopper | Architecture::Blackwell
+        ) {
+            self.cmdq
+                .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+            self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        }
+
+        // SEC2-based architectures need to run the GSP sequencer
+        if uses_sec2 {
+            let libos_handle = self.libos.dma_handle();
+            let seq_params = GspSequencerParams {
+                bootloader_app_version: gsp_fw.bootloader.app_version,
+                libos_dma_handle: libos_handle,
+                gsp_falcon,
+                sec2_falcon,
+                dev: dev.into(),
+                bar,
+            };
+            GspSequencer::run(&mut self.cmdq, seq_params)?;
+        }
 
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&mut self.cmdq)?;
@@ -305,8 +412,8 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         match info.gpu_name() {
-            Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(())
-- 
2.53.0

