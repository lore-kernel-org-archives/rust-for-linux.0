Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F9830E846;
	Sat, 11 Apr 2026 02:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875827; cv=fail; b=ctOtEFwvJVcmxot5rEdOkAXP7zC9012/jO36NN4UhD1Pz1hpwzuMpanPeh+W50UklYbJu33y2c6mzVNljX0XB5VhxPeNQIQvNHTgAIs1DHLUwsJTQzP5zc2khj5nQUnqzq/RJI2sT3JbicJtuZRHZAqS3isPxN39pl6IBDzr9kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875827; c=relaxed/simple;
	bh=N+kqyb55lEIpxRphP9KoDiCJftdyc/WWQcLb8PCdtBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OOe1bNXul/gmmv9+ekH0t0NN+1MEwIWfMQARD1hOT6BoH7qDcPuao+AiiYidI0FEh3MMxueX/t7w1ZyfuJXLQPquua1NlMLsfV0PiOptQKXC1Pdz7fRjW+fPeX3k843VUeYbM5vucpiv53EUzt8qbkkEf3bcRuCW/a7Pt2OcRRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YlOSsG6q; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YlOSsG6q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLyV9D5eEJXXQSaA0z6D/so/M0smLxWN0fziVkjW0d9IfphKs5DbBprvRzNNF9zWAmgLyJtlyYxPhix7VunmL4A7IT+/U+410WE5pVKGIICxRFVEmI1f1EIA6SDizoDKE1SGaBy3Va9FFZ4Ol+vPSh7uHM+mbTvL2/VglDj5nuowRjsb04COiJ3fGe60Dxj3jglOeLQi8wbuE/8cp+yvChne1A0V2AlKV7tau9Jm3S5YOHQyAAUTCGSj8SLf8oUjN9n2CT/neHDqVajk6RzgYR/6Hi0dAtVOPmAtWEZ4Lg/nyRSietsH2V124kh+EaJEpA4vqNR4Abzyj6rymVonYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBsR2hWG2LcK2fJHe/7BEa32NHJJutWhO/hzos4Tnj4=;
 b=DTTQyMfY63v8PKon6Uy60yRi+3blTVIkjdb0gvaHdwiMXyTjRsAeG6Tki26bLWiVUEcRnA1dTOmizz6PoimOOFJOXP1YcjTWLWza1JtHPIgpqsF2c9twis1DtCq6NzhZRV2pzOvFkW/F3lT3kchyfXDwwbqR1knhZwpmfMIGZ2SEaJqkVSq9Hi5NFXPEXsqx8LGpz+Ho7xU7zG9cicBimQyYalDkDRVHJVGxq7kuPH/We59gkZe/Qzdyyt72e+GUf0xnYKnXm7gXxuAd9r6hSx1PW/AzSFrmYP8UM9kE3KzZl21JBef3km8Fwkzp/l9wrdYisXU5G+hOrKxpFHUTkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBsR2hWG2LcK2fJHe/7BEa32NHJJutWhO/hzos4Tnj4=;
 b=YlOSsG6qs4LNOvjuZEtv8SNEyOjAzhDSuOEBvHi3Z3IIVkXxsS3wFAKRm/3CLHlJPKKiPi2Ok4+AjHOSC5FIKClcqTHB3AcTfbATbcRop9z+og9Yh2OlXpEeAjDGVhI5eDcCwssiWPbBYhf9z++jPAW3DkCT0JQewD4U5WgODWSsq8PSaFMXR8580TqVMeVxOJN7BD35Hdh8MmEM5PoFbM75prhsqVCa8MzxDeVimIzNPeFqKx+UDAZSDQJLC2zTEonVzAE1HOkqa6pRmfPqztnAvqP6kKkS4BkVYY2hEJlnbILy5oZa2j+hGqpMubbtL7m0/jA7JnGnagw2maSVdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:17 +0000
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
Subject: [PATCH v10 16/28] gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support of FSP
Date: Fri, 10 Apr 2026 19:49:41 -0700
Message-ID: <20260411024953.473149-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d891de-c6c8-4bf6-b095-08de97751028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nbP6HKkCkFsWKXIvvzDhFuDwnvSgL8kIhckLiE9EXwTM3hpD5CupQn9crGhXiWV3UHhM16esnkBSHzyiyWEJ3bLQhDVGdcnD940u+YTfnD12pfrBGeAMOHlaL4eHgerH6SBbxTNsy+/gczFjMrM85v7ZzlnQ7Dyo88MvfMNai8Uu/mRI2QA4s2FKC2g30agPno/mOkwJ+bDKEyx0xDK8kzs8Vc4E25245G0oSFUIs/yklzACXND8maaQytbvlnvX+hlhIXGiI4HnFc+PEkMlMbslmRAlxpD13UyqFTJP2XyLtICNdk0xS+xCFrzDctIlBFhyxQlX4yYWM5FByHoMnMwq96EpHkzL2jmpb9OM0733guDw1LG8G5B00ir68ItSx4Kg3r6IVsW9HXWfC7QKen547eYWZfYI5g0ccUhoDWjgPyHxMVHNTW9nb02vW6wZUM87ZUiGEiwgEKOvQDY3TBPfq7X8du9GI7OjCQ9O8Naknyh/LkY7YFwDSOljiq9Qw/7c36aFpb+Fe99xbT+aqUXZuT4evgf49K9wAFRGPO5D2Z3Bj4FzHFA/JytnV86UepsAg0leyGY/Nis5RHMG+Ys9+VOhmrvJedlIzGUIwFKi2vWQVZGtRqkMnjgi2W87qiqzvIibJPF5Q1hQS0wf75POFbtaCea6rWa3FjqRAhoj0cYkKCdCsgsheVkdv51Aki3ZN/A3Ac05y2k8X76AdQSC1Ami4R/+IVhv7W52ZjU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NQvYPrPiH0M4oS89SDqZpvdg+qZcYxsYndczaFpIJHQuWEdhdKfB7B0z8HgR?=
 =?us-ascii?Q?Oi2EMwHaIzdOTa2KIH+Ihz/s4Mu6S5RztE190EZWh9xub+8XnrelC32E8Gnb?=
 =?us-ascii?Q?/A3KXYIiIUAGrPeOQnJmz8ULuZxKxnoL7eabvXM5ORK9z1hBKXJ9HPD0AwA3?=
 =?us-ascii?Q?u6J2BElY9LZjzfGUpAcNaSUmo1bf+h7C86uKhBI4mcYhrkMoSf+Snm+Dj5fN?=
 =?us-ascii?Q?YbBy5Wwx8OKWyMi7H99FfWxNZagdpEdGgYk69Hll0lWZ7dZId8ou2jFUYAPs?=
 =?us-ascii?Q?YGIK/KP/XrqRJJpu+t8W0n84bBcWMVewi3BhyPNLq4gcdebfqQZLoMVme2hu?=
 =?us-ascii?Q?VJN+bLWrTasOQRVmF33hh/Bv9WLl98WApdAx57vMj4DjOxKeTkg4pUILPv4/?=
 =?us-ascii?Q?X6ffqkuFT2LUhGL77NHl+PDq3QeE7a1TByeQu0G3AsVoQzroZmGH1zUJM6c2?=
 =?us-ascii?Q?XcdfJ2E5O9oleMnJbPZGEFa623SYmywXIzYuGsF6SGznJUfV2oL+1H9u+k6w?=
 =?us-ascii?Q?vOdm0OASBis1F0xQ/6c7TOiApSccuAPdlbosWa24zCksyKAeDk7rl67ao2ij?=
 =?us-ascii?Q?rwB8bW+WPI5xEjhJ9gljjP2nF/AxyK6J0MjghtYKpyWIwDoAUg4MmhX96Bfq?=
 =?us-ascii?Q?blPzpgZqK8vCISuhp75zQWktqJcI5JZFkFrpXLEwtnK5S099mV2JjpcKhIEy?=
 =?us-ascii?Q?TvzzpLVfOx49Xk4LdIinnlUHRtO47vKlAmdhMpUAVZyt46m6OJvb5zVY9NtG?=
 =?us-ascii?Q?5A6ZcuULi0Oc/KrWt/osMEobLCIICUT5dFXBsYoQIVmAyW6ucVFtDWgXeqlr?=
 =?us-ascii?Q?/3fXnJI+E87FVK6gewi2ZrNrGl6gs15xSAhT20UpolEZp4BgmpnwmAlsUnFB?=
 =?us-ascii?Q?oSMDpwu1JVMAe/YhDqrJX859yJgkyv4jBzS5BkGSPOHqBSs0AuJ64rKnvowp?=
 =?us-ascii?Q?htw1XEcyWbc92SOkYZSwXoMnoXt03dlACexWAiAjF7LRM5h13hzYMmyekUh0?=
 =?us-ascii?Q?IIDsf2Gfho6SQHoj6/y8NuUTsq2VafjxLbtKAp+mZAoh0+giLYYvaYVACaJZ?=
 =?us-ascii?Q?3K9N+YAzmCEwz+MurAQS4EylRZGHLa4x7fmG5Vsk+f/YHhERLWfoa4qB8uG+?=
 =?us-ascii?Q?hmKI7HBoELp6m3e9cGReN83DPu08V+I+QrIEflARAyA/ce63vCfnFBbEO3Ze?=
 =?us-ascii?Q?kT4rgg1sxiLJu56Otg0a3AyYddiSn2FNCcyuMZKYuODVUjPgAFjc1F08pfb7?=
 =?us-ascii?Q?mzxjWYkCeoHoDVVwGSFNb+024xPmh6rcy2gUCeoiWIUbXp+Re6SKNPijwf1E?=
 =?us-ascii?Q?nK3K36y9r70Wd4Id8FV15u86KmohRDeDGl9LicSNcf0/RIx0C4Itg0MzydW4?=
 =?us-ascii?Q?xTtI/Dheq8QHQMe9D8veKhGlZucmHM6Z419s5Iy2rTj3l/3eR56ND+M725fx?=
 =?us-ascii?Q?Z6HoGn5swdrpUt2hnZb42AIUj7XOF9cctPRrVBJ71f0FSSOyAjEX54hIAlJy?=
 =?us-ascii?Q?0zVXUxXN1FetXOX38U8miS7ouYMlHl95iDUAZc8RBKrZDn7yiGKSKILQPGj8?=
 =?us-ascii?Q?Pc0JsaKu1eK47uX8tZEFPipAlFExr8+PTvu6rW5sCzFzXNPihagS8HSaIWno?=
 =?us-ascii?Q?o+RQKF1d5UGVQqxQrMafG5clgBJCLhXdE6OMtGKAQBuJHDy+X9EuJbY5z+hL?=
 =?us-ascii?Q?jHFaMm8ucIRtKihsKUZjoHFDlTc7yTW+6rfDpBbnHe6eqHmQXSXZDKDtqG62?=
 =?us-ascii?Q?9fHDA8Xwjw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d891de-c6c8-4bf6-b095-08de97751028
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:17.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjWwfHlUEYLxh5G0GLT/00NA43b7nOkUbnzsM/0687zdk7/CkcdrkG+oJF0m0hRxYIYnOlA8peG17YEeJDhUlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

FSP is the Falcon that runs FMC firmware on Hopper and Blackwell.
Load the FMC ELF in two forms: the image section that FSP boots from,
and the full Firmware object for later signature extraction during
Chain of Trust verification.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  1 +
 drivers/gpu/nova-core/firmware/fsp.rs | 45 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/boot.rs     |  3 ++
 3 files changed, 49 insertions(+)
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index bc217bfc225f..bc26807116e4 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -27,6 +27,7 @@
 };
 
 pub(crate) mod booter;
+pub(crate) mod fsp;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
 pub(crate) mod riscv;
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
new file mode 100644
index 000000000000..3968bacb7e61
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP is a hardware unit that runs FMC firmware.
+
+use kernel::{
+    device,
+    dma::Coherent,
+    firmware::Firmware,
+    prelude::*, //
+};
+
+use crate::{
+    firmware::elf,
+    gpu::Chipset, //
+};
+
+#[expect(dead_code)]
+pub(crate) struct FspFirmware {
+    /// FMC firmware image data (only the "image" ELF section).
+    pub(crate) fmc_image: Coherent<[u8]>,
+    /// Full FMC ELF for signature extraction.
+    pub(crate) fmc_elf: Firmware,
+}
+
+impl FspFirmware {
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Self> {
+        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
+
+        // FSP expects only the "image" section, not the entire ELF file.
+        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
+            dev_err!(dev, "FMC ELF file missing 'image' section\n");
+            EINVAL
+        })?;
+        let fmc_image = Coherent::from_slice(dev, fmc_image_data, GFP_KERNEL)?;
+
+        Ok(Self {
+            fmc_image,
+            fmc_elf: fw,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 84943beee9ca..1998bd230185 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -24,6 +24,7 @@
             BooterFirmware,
             BooterKind, //
         },
+        fsp::FspFirmware,
         fwsec::{
             bootloader::FwsecFirmwareWithBl,
             FwsecCommand,
@@ -206,6 +207,8 @@ fn boot_via_fsp(
     ) -> Result {
         let _fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
 
+        let _fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+
         Err(ENOTSUPP)
     }
 
-- 
2.53.0

