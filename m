Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011036.outbound.protection.outlook.com [40.93.194.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FD438F245;
	Thu, 26 Mar 2026 01:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489227; cv=fail; b=XZsxr+rzhlAPPA/228Vkcmt4MrrnJD5FFy+hVt5f4cYtKP0sgGTkM4ZCJO5ieYfNQHYC1G+bCQNnimuyZSYpsc8GtipTY9kfD+0SME5TsvesOR5Fw+rdo/Qz6I4qe2V4UoKzwGFK5RMpxLbEdVnawcZ+wlI8rd0M9B1PB99sD+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489227; c=relaxed/simple;
	bh=1HLvgzjzdX70TGbX8fPteHHpXfx2Yx83gKoSWM9VO98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VWReD5R4/DZrkvZc6vT1DxIiZS1PHGkrMHxYQti3s0Djb65EYxSWNIvf+GnDWGXvusjs3KQnUl8XAeRqyyAcB6KSOrQCKhbjnNeEjFJLElffHnRBGK4pr8uLlz+XY+EGzEgSt7osZRQ8WFo6K9jXtlJpukL0Je/di+7y6BaPsR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OSv2dhLx; arc=fail smtp.client-ip=40.93.194.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OSv2dhLx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDdOHgTl1DA2Iv5lZYFQjnHR6K6zjofx4rEaa/D8OOc5HSrNU4HuYnQfpC9OghOKzSGoyg86Uzy0CU5A67DqhiU/VY7vEeFUN+zKvj1Bj3Vopgmpcm+rWB3ZV95GXK0bSj8cCZyxv6h82siNbR43I7ksxf5wMf8KkhMDZq0Ju30dvmQjxdLYejFgEkKcmsYmB8iDHNvPrQ/37G8FVvYRspZgkYmdUrYhdyfNvFvOIpMr9mcEQdZdRhsGTNXB5qRhY9IHQe9/ck8Zf1JaxaD113ecWdFGpVeG5fzG9aa0qVLelZxicnmKeZtqJfj/JyWstwBTvnjcs7u0/xWRSj+hjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YiTdmxNxsDJ4YLGMzVDOhG29SGTZM0qk39nW/f6I1U=;
 b=iiWxKaoy3dY4fNguBgX2UoOYe1TC6zXMSmW9kar6nfzrzT7wKrPxfSV5Ri/WSon3mcVzvc3g24No2Fpx5HNHTHGIZxVKAPgcC87y2f+4/UDw7XvKhG4U5x3Eo9LI6zg5RRt4gaPSrrm2G97Ly1ogs+rz+T6uSNaejtqubbmBMxHzfLNK9INJMSDcMwbJ9vApzPPb7XoxdHcB4MRmcNSBzifUkdlhlUIxs28fmNWJ4oViUfEc4e08YTfPubMj7x6x93XqoGZ7CQQO1G4/sqFGjy4YcTKg7G7K5W7qdWpoky6rk0XM0FdR4CCWgc9OGLgmhgy3HUBIQqds6smdHFCDsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YiTdmxNxsDJ4YLGMzVDOhG29SGTZM0qk39nW/f6I1U=;
 b=OSv2dhLxjwPF4uvvZyhXgZx9PegXautX2PBNLzYSM+5Ac0EryZhZ6J/JogeNL2lSFNQApbDoNXzS06AvOsFB7BjxBKiP/xZNLBelriJbizhzZVkSzBNfvcZG6Sx1y79VJTFuV9EKJRmSg/PRSoV2844Fhe3rE3ElosmymklrzlYg+yjxjaM9rE2SjEX5OkhpUPymOE4I0pRqUg4drureNfqbooYa8h+bqzN4u1hVL9fVyCy8zk7c5tBJWpb25lYVoiWMo3OAiakpIpJxaroYfsgzi5Nu1Hx546WLLzOlKawQXrxrYNO4gsxHofkiesTZJN1jLVrRmrXlOiWvfQ2/RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:40:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:40:19 +0000
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
Subject: [PATCH v9 31/31] gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()
Date: Wed, 25 Mar 2026 18:39:02 -0700
Message-ID: <20260326013902.588242-32-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 939dd770-c29e-49fb-ce6c-08de8ad891d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p8bQPw5sWtLek+HosJBBPtjDslVyjZ6EPOPdKJe/2jHPLo9Fi0Lc70aHLXq1Pi2XY1hhHdWy/2g4thc5IY+7cIkudLuyzmFvByGNMNPzAQVFlugTy/cigfW2vEJU9V65vOxs8VqZpDo61GpFZgNWN2rK7ZXo++RZ1j5YXBWJY+Cp8H3HK51SriIXlVGLNQG/a0bHpbAtLs/PFKa8+uvG2dfuItGtra1Nwb1rPqXtXW2eBsFg2E31iNLoF38ZxqUW+jGqnV9m6kbwtHKks7x69QObxe3kt+7nECYsj+vbOfDp7bHpVyqCWsI62LJnXlRfAP94iqLK/ymLJzahKlqlgBg2toGb8JmTWhCeTfvRc424M3cJJzTFBD+KVNIT2ATGRPcCcV0qYvJqK/8lI1qlxvPcer8+jlaqLybXAYp52S6Kbf4ht5IOboLXwVgdZxbP2vTvcGoJ41LjbBK+7Pjd5iK+ml7cqrTsk7ICCPEmMPOr+BXxAb7S1/2WDhghYOWQAmyVKP0hjETYNNiz/PB03DsctcvRpxvi3M5fBG1atK+q8waK4nSFrRXXesHTfwwzaYXlXB7aHAziWFRdJQyI/UPW7xvMsnGYSkix9Pf3A7XAM0W4Bhi2+ehzi9CYlMJrRraUjPC6JbF/ZdzKM56T1qnPXLFf9iWfxWGrvuyuRLg9Z4i2pTEqkZ8Fm1PQiBkTH1kEHxlHpjg1omvtpq9LNMf8rXa/WSbhvyu3E59pZ6Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rbRFxUOuk5CpzXyVQjeQQ9sZthiIol3sU2hYWm+D34Yk3HoiOXWabeLkaX3f?=
 =?us-ascii?Q?ok7+UXh6VWd4HOMJrnicsdrh0iElX8+rsYX5bsNaNhOhqKRP4oBs5yxOC9ti?=
 =?us-ascii?Q?kRufIR9OZGZ1hO/kLrFsV7x5dtNV62z7qMZiWZAH2qP87VJcFxR5adJYi//f?=
 =?us-ascii?Q?46onAaOPGjm2hrHzCgbnmiaHa8j1lzqGZYuNmdCiDwZzRiDMgkGMXKVNSxVF?=
 =?us-ascii?Q?0riotEKa7jUw5rwnucL3X3pMpAlxC/kAaCZbb5iZLWCtCMj/fh5EYOnONNcU?=
 =?us-ascii?Q?oP02AExISWKLLoQcZOmGaiA8ulXB3iCzd9nkef6mCjkezNCbXSc4qxy1RLsD?=
 =?us-ascii?Q?a6gWYNv5aK9pcCp/t6pt8LMVzHVgGaBKDOTw7npdgBdEwDIW5I+pKvUptxBy?=
 =?us-ascii?Q?vSU5s54jqGf0FKsqTKkfNO/+ua3ywhy6597ztGPo0Iqd35OoiURQPj7To6f1?=
 =?us-ascii?Q?3HvdHATqpVv+l/UJHrIlCRSxz28hT6WF31VWSCQ7rWCtP8g2Hkbz70Jh2TG/?=
 =?us-ascii?Q?lgNke5yRC56mqKweQPKb9KqrpUz6iSNljk0o+kJ1Mwr5mMjSMX2V3SWX/dly?=
 =?us-ascii?Q?VGDO3JnjlugcsQD3kRPH8kyNaKYZoxBgkdOHBCn9p2EMvPdPPuA2AwcjHoiW?=
 =?us-ascii?Q?NbW9heBDAoJcgHVBRiGnqOEDby063bcInh5qS2AK9viANUjV4wBocmg6RuWp?=
 =?us-ascii?Q?xC4U8uM6iyVmCNE3d35W6ei96Jr+ZMnfIvVa21KjVcRlyZg5Y9GdvgATnlk9?=
 =?us-ascii?Q?AMF+d9kEv3aNl50M2UKExJrVvBWA8jEnLMtQ6TM9pR8LYOAsSizBfW5gOJ/8?=
 =?us-ascii?Q?NE3PpURvZ/6dp6zs/0uXr/M7YOnG2K9r+H151umGyiE9TnqfcmZLtmCg7/90?=
 =?us-ascii?Q?ClYu1GcwbxJFXYzclPj/xbCt+bSDyLwYDh+PcvZgHvsTyExqmo2ZY8smjkAk?=
 =?us-ascii?Q?QSSTR+mNUvom7u5O6KQnYeZdwEKWxnxWjuqYe7t2naotPnchTbFvu6iCrXpz?=
 =?us-ascii?Q?b/87o2kxOC8ETCWW8SvjK3Gu+6iP0eHvv58V64xSAnmppNEbfCsiUAJrzzzP?=
 =?us-ascii?Q?+HjBEbQQBvALwGdiYpeJ4ITheS+xO3yYdwvpzAzIcUBPOOMjVyln0VeYdrSy?=
 =?us-ascii?Q?SSbrloj+c6XXoa1gbY6N8veQGiBLriN5HwBw7xIzk40C/38waDt9gqdIbbI1?=
 =?us-ascii?Q?TT4q39m8oyZOUkPlJT/lKB63dtad3/JkaESwdzehr1BvUYTi28TrTo7yS0mz?=
 =?us-ascii?Q?czIj7PUs433PBNzWpJhBaQzGUqCjP4WYNFLIf34vn/FbJKdQfuli2UHxBQgV?=
 =?us-ascii?Q?NfA9yV5MJxCHLfGeRMAmOESvuCXsPhoq6YWAbX6m2mcnZM+B01Ae1yvr4tXg?=
 =?us-ascii?Q?AHr49dfA+VnyJlIE/0IgZSs3or0SbeIetP8NPwWZ6JMXNXS79sQDIz/pYba9?=
 =?us-ascii?Q?AHC9zg8iqIWDwHo3/ooS5D2fXvd1Q/J0FRdXM8Y6o9n1q8l5lquLJ11LCnqZ?=
 =?us-ascii?Q?F8Nq0NNboIqSinSmXgl4zkz8FkTAtU0vTXGQxIzmA3mNv2w1bHguDBVcGUjt?=
 =?us-ascii?Q?YNmX6FBeuFSk2OkZ3zCH1RYKxr69Er0qac0M3DTXf1eExvzTH8NAI67y0KRu?=
 =?us-ascii?Q?cd+caPwN/vsImkdp96kPwAQmTg2QhJOVTkFyRWpc3CF+uC7SxHXJM/DVAc25?=
 =?us-ascii?Q?ySSlwlGnllGfbG5cf05ydIpF4++jCRIXoSYX4MHK9zF3HydEq+cADSK6Y8k1?=
 =?us-ascii?Q?DAVXTFP0/Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939dd770-c29e-49fb-ce6c-08de8ad891d8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:49.9129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+fBtXdeZThyRfpWYoJ5kwMi7S593iPqpWZxTio3Dgt1b0gUrKkhfb0afVilTo51zNP8PTxxVdz/V0sl7FuXkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

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
 drivers/gpu/nova-core/gsp/boot.rs     | 177 ++++++++++++++++++++------
 3 files changed, 139 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 5bd15b644825..fb51b1d69c0a 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -14,7 +14,6 @@
     gpu::Chipset, //
 };
 
-#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
     pub(crate) fmc_image: DmaObject,
@@ -23,7 +22,6 @@ pub(crate) struct FspFirmware {
 }
 
 impl FspFirmware {
-    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 6edbc4fe7066..ef1f06ea7a0d 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -240,7 +240,6 @@ pub(crate) struct FmcBootArgs<'a> {
 impl<'a> FmcBootArgs<'a> {
     /// Build FMC boot arguments, allocating the DMA-coherent boot parameter
     /// structure that FSP will read.
-    #[expect(dead_code)]
     #[allow(clippy::too_many_arguments)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
@@ -286,7 +285,6 @@ pub(crate) fn new(
 
     /// DMA address of the FMC boot parameters, needed after boot for lockdown
     /// release polling.
-    #[expect(dead_code)]
     pub(crate) fn boot_params_dma_handle(&self) -> u64 {
         self.fmc_boot_params.dma_handle()
     }
@@ -299,7 +297,6 @@ impl Fsp {
     ///
     /// Polls the thermal scratch register until FSP signals boot completion
     /// or timeout occurs.
-    #[expect(dead_code)]
     pub(crate) fn wait_secure_boot(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
@@ -329,7 +326,6 @@ pub(crate) fn wait_secure_boot(
     ///
     /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
     /// Returns signatures in a heap-allocated structure to prevent stack overflow.
-    #[expect(dead_code)]
     pub(crate) fn extract_fmc_signatures(
         dev: &device::Device<device::Bound>,
         fmc_fw_data: &[u8],
@@ -396,7 +392,6 @@ pub(crate) fn extract_fmc_signatures(
     ///
     /// Builds the COT message from the pre-configured [`FmcBootArgs`], sends it
     /// to FSP, and waits for the response.
-    #[expect(dead_code)]
     pub(crate) fn boot_fmc(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 3afee0ffc3d9..c1e27c911494 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -12,6 +12,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        fsp::Fsp as FspEngine,
         gsp::Gsp,
         sec2::Sec2,
         Falcon,
@@ -23,6 +24,7 @@
             BooterFirmware,
             BooterKind, //
         },
+        fsp::FspFirmware,
         fwsec::{
             bootloader::FwsecFirmwareWithBl,
             FwsecCommand,
@@ -31,9 +33,17 @@
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
@@ -196,8 +206,83 @@ fn run_booter(
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
+        wpr_meta: &Coherent<GspFwWprMeta>,
+        libos: &Coherent<[LibosMemoryRegionInitArgument]>,
+    ) -> Result {
+        let fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+
+        Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
+
+        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+
+        let signatures = Fsp::extract_fmc_signatures(dev, fsp_fw.fmc_elf.data())?;
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
@@ -241,39 +326,41 @@ pub(crate) fn boot(
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
-
-        gsp_falcon.reset(bar)?;
-        let libos_handle = self.libos.dma_handle();
-        let (mbox0, mbox1) = gsp_falcon.boot(
-            bar,
-            Some(libos_handle as u32),
-            Some((libos_handle >> 32) as u32),
-        )?;
-        dev_dbg!(pdev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+        // Architecture-specific boot path
+        if uses_sec2 {
+            // SEC2 path: send commands before GSP reset/boot (original order).
+            self.cmdq
+                .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+            self.cmdq
+                .send_command_no_wait(bar, commands::SetRegistry::new())?;
 
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
@@ -284,18 +371,32 @@ pub(crate) fn boot(
             Delta::from_secs(5),
         )?;
 
-        dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
+        dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar));
+
+        // For FSP path, send commands after GSP becomes active.
+        if matches!(
+            chipset.arch(),
+            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x
+        ) {
+            self.cmdq
+                .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+            self.cmdq
+                .send_command_no_wait(bar, commands::SetRegistry::new())?;
+        }
 
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
+            GspSequencer::run(&self.cmdq, seq_params)?;
+        }
 
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&self.cmdq)?;
@@ -303,8 +404,8 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&self.cmdq, bar)?;
         match info.gpu_name() {
-            Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(())
-- 
2.53.0

