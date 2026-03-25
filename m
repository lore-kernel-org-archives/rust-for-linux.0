Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A0F33B6C2;
	Wed, 25 Mar 2026 03:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410842; cv=fail; b=Huc3DtOa4Vr9EH5jMUTo0lWdGibxQRvKGgajent/UnN+CXn0av3EabUW19/vs7qW/C94JtKR3cPBCRP01uJZvNCjz54RcJlR40qpRSixwnI5pZKH5l9ZGse/cSAikEUkoIsC55kxnxHTU2HbGQvCCf2o9ITVoSUjNP8s0xB7jF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410842; c=relaxed/simple;
	bh=PwOpq2y7krVxEL2SqGyuwSNZhqrnSDx7vhP2R9v1jCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B3hRcsxVmdmTOD6tuK1Eam5YmAani5S1B7NKY4lGRLAeWPCBFCLotsVeYQz6C0092nJ4GClTAqpx9Rb75OwmPRhYRPe0D6MAtqD5d3r2o+t2r/JNpjg5ekMbzkCcAbu33syeOWgD8jOJKnSCOIxKwoi/Ql/nQFjhNxxotzEwut4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MxXoqY9F; arc=fail smtp.client-ip=40.93.194.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MxXoqY9F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmI0gJGaPiG4HfrIS5agg45qTtqxLCO0XbGZOUVYPjX7A/Hw0+IX/7hba6rvBdiAmsodarAkGNEyN8PyETeLkUK3ilr7M9AFG4cujwW0oxgUUfkiMFFAwAsg9+R0Z7VUhLAvOLtjBFpy/Gg9p5SUD/PSt5vm9qDqX0AW/xFcbJUr5a5sMJxx1eF7dm849X8F3D2QB1ddvw8YCwZ0InUd84OJOx7Aq2elVk2WpkQQ19VGw7BpDxS2HQocU0JV9mHz79HdPDjz1PjznXlrwGnb5tw1YjRGA1nI52E3UKr3mQ5dVQWFXCR9NgPPUG7+IGzKqjJ3unwiKX2lMsVb+UCx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GogVokCWqFp1+y4hvgNnhwlAFcHzNZtDVVuD04TZXOI=;
 b=KNYUKqk642E+N+RKNSG5ECGX7drwBb4FBi+psNrORM+b9/NTIlAJmVirnVvIMRVxZfXDq9tGL1WQWMqE+ohDO2V/IQGbI8wlZ+7gieIb9HaKH5M8heTqtrj2mNWjg2JTT3u/I4LOjuZ/vXTFV2VIXF0sjWp9l9GyZa+SNtlkTJb0WJmUCjPIys+aa/4Bkns0UA4Qu2zQs6vxvnd1sJZGoEUKoc6u1tjx8q8rDjfPJrPkbsaDkTc4o5aX9VIAl3ec6xPZIWq6iheyMDBnT4rj2RGb0YR1mwxBMz1ZD3FvNqG48iliWhj+V0Gx0n3LoV/eSnoPTZstjk2qea8+epruqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GogVokCWqFp1+y4hvgNnhwlAFcHzNZtDVVuD04TZXOI=;
 b=MxXoqY9F2O2MykTKbJN10432to6TWn8DhjLSPqoNxSkJmpERtGdyHupxNFcjcsRzcRl6qO6vudirvtPpt+CHZz32T1wZSCbnHzDAsrkcY6d6ax1fGeHH9hCvMH1PHPrM1zijYNUopX4XxhNr+gWDa+J4ofQZANtGYaqzCOtaYfyGHyIPj08+tSF2iLuTprkQbW1laotN28x28kfOFkAf9DDgdNkWRM5/cTROJ+gy1DKQd+rYwDpJ9fP5VQmUB3/61+3q/PIGNC0o3rEBIbGLue0nad7FYd6nJHqFEkiNbZ38EsPHIJc20CJYGLb7orEjZ0z/AtB2d5ohpGcq7lIBdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:54 +0000
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
Subject: [PATCH v8 31/31] gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()
Date: Tue, 24 Mar 2026 20:52:42 -0700
Message-ID: <20260325035242.368661-32-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:40::39) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: a58c8e73-007e-4f83-3521-08de8a221115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	JaZJaVU51GNx+2fZZnDGI/N+Kn2r6LpmQzXUyP9E1jMArhx56BWIK4quC9ixy0vnl+vmLPjHQuCCjXc5RVJEp2ZF/p6QNl6OjdaU3t5U+XWxVeauIdgTuviZjrAojxoVs728EA/n4Pdwe9kcHhPV8U7W5bmgSyC86b4C5Ihuz3AOVY1tSA2JqNzyHMUHbujFKG8Pa197aWM1B3WQDfqcbx6qoWzWXUbIoONUEOBNxewcM8DDe8VIRz1AmTZVpd8TdVik8I+PX0xhhchxw4c+JiOcrKy5imA4aW9+R6WZIp7QyWWQETCFy6jCaFci3UHkxNBHBZWJTQlzfZk0dMCIRsij1+PNm6dRkVy9z6+/bQXTHwBksryROyXYlyOESjkcH6xmPr4RCewxLf+agOis1wWit/YQMb0pufuHas2DqIGqUOwPMjqkqR5JM8Q4tECgzeMoJjSrugi5xW+TeZGqgpD/+otVPxmsVLtxyS4DFUCGBEivDqoVOIi248MrJxhTHKzgoYV4DKOVBqBnT7IXPj4DDOakWdbNXdXoOwkIfwQwv/FW9ZXahjqeYTcCs8gDzNDNnCHidAYTa4vqy9jH6ZgvZHbMqeGAmpkWTgryOvRVWslZP5TozcdepCTUK5vdDDPnaltoG0CjFrZVCk9UHx/OsELgFjTawRRccT0+Ufhq3VQwygX2w1fv5Eq+OZ6et9Sm+FM+jUO2/RQfUblolnKq3ZRlsrwq96Tx1ra/i2M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qnVKnqwhJjvTKlGSS3lFQ6YpJIEBxmwB9GQellji0ZyBxoiZaIMJC8YDyprw?=
 =?us-ascii?Q?wybtvxIIqgmnma4G+7SYqQOvNHY1NEj+kYa+xNzNa+cB4Jk+u77qIT/kfc87?=
 =?us-ascii?Q?AXHzbV8HF++wVb8bSs0E1wn+2Ca32w67YM+kSU+iz0BhcjmvBAq5wO+GZrvt?=
 =?us-ascii?Q?1TWUmhkt8wSCTcmKgW8uXZUSzRwdjv7z06bpYI0e7mq/DlP2tE69SbVqgKyN?=
 =?us-ascii?Q?m4DqyhB95sdRZ+Tn88DJ7e6G5jteItZ2oZ0TNvVXz7p67B8ga77e5NwcUtZh?=
 =?us-ascii?Q?ala8+uuYTctgGciij25Lke823BVlC+L4ME2E1MKZ0304JhvtcbUoDxaWWWps?=
 =?us-ascii?Q?BuV64HbiXZWFCmExpEQbXTws/5sgjKzJ0U6hkEymSoVvH+nzGnnBh7G4rVIr?=
 =?us-ascii?Q?M4U5paG+ZJYlGfrrvEtUjerdi5uzN65eJnjTabV1IDh8e7sDhpPXvZnoZgYS?=
 =?us-ascii?Q?na/SHTvJE0HqJrCUkrSBRxM7neBJd4/5NP4C/U4yt0X2MTp4/nc2AuFfwwFn?=
 =?us-ascii?Q?y+0sRoD2gqXHGOXGwYC5DR5yr2i2AvbFVmSQwWkR2NLwKYJbtycNmyyh1l2u?=
 =?us-ascii?Q?6nRpOnq3lspAZDS2je82kYEvccA/ZYw3kqdU1BtK6/ZCRWuDNMxbbtC4f0/8?=
 =?us-ascii?Q?1ESbofufpyMfd42n9RqFU4vuKdE4Y8zG1KVZv0jwLHqimCTZQD5/BGfVU0L0?=
 =?us-ascii?Q?UvXo+TdOtVDQjyA11Rsvu06cBEY8bRJB27o3n1C8RJzT3YJM/EvP495AvUrw?=
 =?us-ascii?Q?73aeRKw2htv4b3hf/wLLoM1+teVpyZXNAKs1f+XCu7/QNEuhKQR7P3r0R5JA?=
 =?us-ascii?Q?HWozniKZLGwUbo3+NuxhvNPRUxJXGCAM+5KxSbo9OTXU1nesJ+/ekY9s24Bv?=
 =?us-ascii?Q?sxRanIcyfPzdR4p8GQRpWU/X6rucx/lY/qjwfvmxbm2AZGrGjw9lptwd8dGD?=
 =?us-ascii?Q?iZkqi5m1IkqRGqlh43De/qLs5Egf6UH/7HZodu5tACbrnswxNecHdFvZdMfs?=
 =?us-ascii?Q?QplDAigYbbBFrzUxMT1pFoR6ZHeKF6R6EGZAsZ/olJOcIS67dsI7OlmYeqfl?=
 =?us-ascii?Q?gFpPiwnAKCAbVtFxFhxtFYJ8f1IIscDstdjxcu/jBRPL9yD8g3ttYgllgqNX?=
 =?us-ascii?Q?hzyhhppgpyNJ8nZlBAc+C8PeTfXdgq/l0ex61RdG9CIenj3PHgL4pynzu/DU?=
 =?us-ascii?Q?KfOcuYvVUUdUchgDi5zWyUW2Dppo6vS3e9YAEwhcFOjd0LaSTLLtJqewMTmq?=
 =?us-ascii?Q?D9NovvH6zjnOaYfxz+MVErxYjiy0oG4kzcFDH8+1Zgdqt/WUM5R3LvfTCZ/d?=
 =?us-ascii?Q?Q3sGa5nY5mQ6zZ4NM69rr239fR/c1k0HYazWYylGx2K0GIhQmiUONaT6ibLR?=
 =?us-ascii?Q?Y0qZANGWDN2PZ8kn9slevOP4Y4Tl5cdqcDAqBlHPVtC7lErZgkSyVc/qMjGx?=
 =?us-ascii?Q?nLB/iTWgpY+Cs9GVkY7KJs5JQyv4cWIWNWrMWjxsTh76sMVWqm5K5L6q4Cbj?=
 =?us-ascii?Q?2++ntckcla6kKTmSl84YwC5zlWZP2h+zEaJTzhLI2wvgbEin+SJ8lvS4n2Gy?=
 =?us-ascii?Q?rWqo0YDEBAudjMKAaocKMzw0tORUlWT7pfIgW48pzSvIoczEjM/DY0Pn6n3X?=
 =?us-ascii?Q?W4+KizsHEKgQO4MWhlMm/9OmRjC8uCTRHfkao2dLhpFm1rVD/TMsZFsu9DXV?=
 =?us-ascii?Q?jD3EC3aGGptN23NZXiav1AIDxKQ44XW2LraXhZRSAvo/ZHRQp9sWV1QcNzQI?=
 =?us-ascii?Q?JYifvjEUrg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a58c8e73-007e-4f83-3521-08de8a221115
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:25.4902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /r6GqFe3HFoQ+HZ/9Ol7ixsWbKi6l+8XwHIqbgBC/eLaK5kXn3W3AqXpSoJbydpkjcM9PgG0h+iKBlYN7s9exA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121

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
index e5059d59a4b7..e981f2316d01 100644
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
index 1d3092e6b14f..20b84ca92188 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -233,7 +233,6 @@ pub(crate) struct FmcBootArgs<'a> {
 impl<'a> FmcBootArgs<'a> {
     /// Build FMC boot arguments, allocating the DMA-coherent boot parameter
     /// structure that FSP will read.
-    #[expect(dead_code)]
     #[allow(clippy::too_many_arguments)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
@@ -279,7 +278,6 @@ pub(crate) fn new(
 
     /// DMA address of the FMC boot parameters, needed after boot for lockdown
     /// release polling.
-    #[expect(dead_code)]
     pub(crate) fn boot_params_dma_handle(&self) -> u64 {
         self.fmc_boot_params.dma_handle()
     }
@@ -292,7 +290,6 @@ impl Fsp {
     ///
     /// Polls the thermal scratch register until FSP signals boot completion
     /// or timeout occurs.
-    #[expect(dead_code)]
     pub(crate) fn wait_secure_boot(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
@@ -322,7 +319,6 @@ pub(crate) fn wait_secure_boot(
     ///
     /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
     /// Returns signatures in a heap-allocated structure to prevent stack overflow.
-    #[expect(dead_code)]
     pub(crate) fn extract_fmc_signatures(
         dev: &device::Device<device::Bound>,
         fmc_fw_data: &[u8],
@@ -389,7 +385,6 @@ pub(crate) fn extract_fmc_signatures(
     ///
     /// Builds the COT message from the pre-configured [`FmcBootArgs`], sends it
     /// to FSP, and waits for the response.
-    #[expect(dead_code)]
     pub(crate) fn boot_fmc(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 3afee0ffc3d9..d10271dc2bf6 100644
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
+            Architecture::Hopper | Architecture::Blackwell
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

