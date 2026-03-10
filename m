Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9960F3ACF0B;
	Tue, 10 Mar 2026 02:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108730; cv=fail; b=cH/jnAcExlpJadPnYuZCWgGby9SebsLeVD5hzRktx0gadYCU/yVIWk00bs0QJnR75Rcj5nZgOzYIEFpnVLCsBnYMOJOgOhu5ioYW6H759pmdteVBp6fgav4JxJkz6N23SDzjhlvPt/75UEsS+GDiclYaVLmfx5f+zmlFSqxYGIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108730; c=relaxed/simple;
	bh=xpXQdzXy/AbJ0AqIvDl+nFaxquJYNbDLu+TKFWpmy2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nA8USiXVtRa8rVftwykwwi6EUzbwsHqN4xtvhJj1NeAIkel2WFQrr2j69RgYyP9XhmIkOqGpke0rNprWfuWlTXL2TwgwxjMDk8bUL9szWKZpkMqBo9HqVLOLoHf4hcfkwhmXT8OOPrEfreI/TsBAY0zt143NnF04tBavH7IFUZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rykNmF6j; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rykNmF6j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWYnNYGMS7j+3+EinkXEm+4hS//z/g62xTYxJo0b6QFeo6bcW/VTNxryMUvhzl52reKuopQBZHXBdCwZgx/LsHSZTEvy4RQ8ue04lkkrEeCF+rSQwDMH4lLo69+en6I60GY/Wbh1hv/C10sV3qF90pTaIIV80Vfo59xKRrY+dZqXIqJgyA1y74XOvVwjmCVP6pXbok7BABGDJTzqUHpL/4uxHm1Z6cwnEFMSV5CeJjRZCVYVHx9xgJoadFEdPU5lQRPftcTNgiPUIWyv0wlciwDVzrhzrDCBVTWYhubcM2rG477m6Uiuokjfzk+2NOsjqZRG+nUJWrlAYQKrxMhWow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXj/+ZdX7PbpOwiJbLOIJWGnMB6Gk4wtlx+B84cjpAo=;
 b=JBC/Ixd76ECoOkRV+nuaI/xR8CGJhVK5e4Q+eLundTycobWUQaN0zAmWq0iUexjy3M0surfyxFe8SIoUAcsAfB2RYbnnLo6Sb3oeuU8giWqEUib5YhXOKCiatsLTltf6avbqBe2PctJ8pY1NVonXU7BwfNL3TLWI4zwnVT/FUBoAbGL29oHvuiOSFxqKxIRp2tYRB9DKCZ0wOjPKCK6r6nBHHc7xK617eTqOztubRCNuLSS6aJ8WMTwcQN+KpIw7souZC/dOrQdcbgiF6NlfcKV0sGx2I/MWF1qRrGF7QqOagY4k01Vg7aT1p7aBNBdtMJUBFRXPEeb3qS0Hp0qIMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXj/+ZdX7PbpOwiJbLOIJWGnMB6Gk4wtlx+B84cjpAo=;
 b=rykNmF6jL3hoX0uwS0YICZR/KcONV8RkGWvPuNmZLyXiLZg2l5myyqCY7vuwVOSPA1vfj5ymbo7G0H0vUm8pfcCI37WmMpNq49zg4zmpt5ddtTI3zsXup8GX82cjmXzIukQhKVcHtU457kcC1JSnrZYBM1WBGlHcA8xyuCD14/AiybQ8y6p6H2GlmOSPqHtJTYtLoYtiHiC1BManLlPsfoa2W90oaCiTaNuFCdL8w+WgOznFZA3ISy1cptv6tGAntMN2h+Xn258H6WRqgWlu53mK6BYlxiWiARmsfKTohgtHUxrwAxvNGXNYE1DQTjYeDQznL5RQzOGb0hewh59ljg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:57 +0000
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
Subject: [PATCH v6 22/34] gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion waiting
Date: Mon,  9 Mar 2026 19:11:12 -0700
Message-ID: <20260310021125.117855-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0003.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca17a98-827e-4656-0e9d-08de7e4a6837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	NE1mXqtphFEK7wyJWkUjIn8QPxXoaK91a86PVEIaq9Tw/8Qe6tHRDwqcyeWIZQT3uG/+j9AF+XLN1zRUWVImiVZ0yG01cPOm1YDcAPdnbAOZXWEBFCT+jwXOWvIa6OQvND9kEQzobqdUYppjaMMPhb5h2U53VHLNXm9J9q0C/R1bhwSIusNRNu0tJf31efU7J5/L4QWCPxsLItgxN9TSWnVNAZsVMdEJr8iz/2SRromWZtpzChKnNoi/Icyxw7sh3CjRHEmYHhPHX005iquL3HK9HzVY1D49JwldeINbbhruVbPoYNF80BAxxEO75wfUg98ddhqgioReb3nYHFwOSPVwDp7rDeVnRSgwL8hYdoygmIYFnak4QnWJplEAMJtIogBhAi55E2beTtfIP96HGHt+j0l6BmNosMFg/1V1kbjnVlswyb0wpG5xCSFKmSFVu0nLoEeTYAssytocvy5TrbJXgLK/HGD5Lwuyh59JNvW+Ft20NVTk/5UH9OtFvPTJ851UL9316gLfKMPO3ayhLX+MUKyj0+lYdnMmAKPdDtrGGZnHF/RLqZmV5gyZesjGGU0R0qKHVVKzmekqRTfAkoG303fLUB1GHTyFJxbiFpsFO95E+GqpofixU7tJI61RceWnKLmfAY/awdgKXXZOwsRRUqs493yUfibrKC/A8ZQ30FOotTU1u/VqjGASPGvQX5HVR3kZU1XLrgpYomElo6ICE4u10TriPHmSYWhvXrA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jb91eHn3k45mJjJnEIpG2MK8Y1bZM770stmd36ROX7fdt6J9bHi6hUpyYnm+?=
 =?us-ascii?Q?UJdEBfmcAnD9hcpvRWlvOyDs/xLK3SGLaINUoSfd53EJlLMKck7QchLABB5Y?=
 =?us-ascii?Q?eQwVS2/tyaTU3bxNg/KtA1txILK1vBDY6l8R7MpNIITn18IdgeC/g3eluxTs?=
 =?us-ascii?Q?grJGaxiKUrMOMPHCIV/xjIzvjQm6XHWoE8H/ZgkjSrYbxQWTxm2LAKkGUcq/?=
 =?us-ascii?Q?Y1ocb2B3phafOGPDIlrmRMenS27QqPKCf59cIxJ0oVHodVJC0f0yDt89wkmw?=
 =?us-ascii?Q?RpWG0Ikulp5mGxLD7b7Fzs7VHtW7ZvPBN1p2iqQ6G1Lu1o0N6Tb0cWPayYh0?=
 =?us-ascii?Q?rw8uRZbyOY8pab0sJSmPGNp7pTv6abmIdmqs1QQJ2hJWvr12twNK1SxEHZWv?=
 =?us-ascii?Q?/3h5AsNpkd7lF0RrrV1H4QSzdFBrj6EkJThCslYX7i/UOqpusZTjIZ12gosD?=
 =?us-ascii?Q?Gean7FsIPmYHfj3cjq6YWHIi+IWfosc/4AR0uS8goi+C4aNoudBeeSNKYnYt?=
 =?us-ascii?Q?/jsgnzpBC8eAC/worP+UCW/D+WN4ELNIdHLWG+duuvJGb/Lq/iopDK1SzkwH?=
 =?us-ascii?Q?oFmcYROy6DJ7TECKNmBzi7di8fzTmvBxH3+lN3fswCWRcKOcOCj/YE5tNEY4?=
 =?us-ascii?Q?S0peVJADAMtXGI5bJpGSrnkG7Lf5Rs8cxV8lVYUY+xUIl8ADRHVIb0LdKfTF?=
 =?us-ascii?Q?8Fy0cPfSXa/pqZ8Vfyugspf9WZMP3Bj2jVEmJUuHkEYgN3fMBbqB1Ob60oSj?=
 =?us-ascii?Q?R3/X/T8wElponnK/GqJbRp7Sh07vt8rJuee7agOSwnjcrxAPCvAeDXDO7KHb?=
 =?us-ascii?Q?ASWrckLNNXr4sau9GlKS0B4BcAEO5fkNZgGXSvfNEK0ffzRzaH3yN6b1jbIc?=
 =?us-ascii?Q?NaqU9XdjVA1GOhUloLvGp7RUEJSzdynpM+3jEExJZutVlwugqPIBAjmLC+Lc?=
 =?us-ascii?Q?DZ1YlAt0kOQbHzIE9pcz/hAfX6XFpoNqXad3lnI9TljtrhhVByp9YCZHYPYL?=
 =?us-ascii?Q?9yGNlbDqh8VStr5JQrT8/rzeXZVte+6fb8YB57RcE5V+lSSFoLLyECVi/Gc7?=
 =?us-ascii?Q?upUkLFz1DT8P2BwI3PgrBwYww1RMzmdhh6RgkCoAZn5gNDOXh5ibV/JbFQDz?=
 =?us-ascii?Q?gRivd5ylMbXI/d2Y5xatf1Pwl+jvMH/p7BzS37hiV5pFBH6M7IOLMmjpmJGP?=
 =?us-ascii?Q?FJOCZkbtUpN5a1RTsD1vydKKKgZ1brVaQXwAEccbNszC5DXEBQI3xrmmV95W?=
 =?us-ascii?Q?/7qPfjtt5LpxhEp2U+aFbshhdrj5Z0IjzIRbUe4oMwf0TuEAVHxXuoNmF5su?=
 =?us-ascii?Q?Sd965MjTnIK1HH12NP0kgvx9ynsJnK6Rv8Oi5PyMssVgRPuQgHvKajtBzJ2S?=
 =?us-ascii?Q?hZjgs/PvRaNHs32Rzc26XgvW/aczLscYPbGQMnPvyQo2vlJoOBYAWJhGQmLZ?=
 =?us-ascii?Q?+J/OCSGTJuK31TkozK3pmbegP99jgkxWXT2mhEAXdYwbEdgDFU35hTryNiMr?=
 =?us-ascii?Q?wwM74Cf2Fn3lNZLXFBZFBZ5yrVR8zNTDjN6k43rEReHAGdaIlcOyYBJ63Qlm?=
 =?us-ascii?Q?0gYV5bAfw4T89Sxl0+3MfXry6zIRWzgJbBQMoyLtQnFOzVds2x9X3C9HVWtj?=
 =?us-ascii?Q?VyQPbG3MIwR23U7Ig76MoPS6k8/0y1abZsdaGGGZd2ab7hHEwYaMfAczuZsD?=
 =?us-ascii?Q?m/N26OcSj0YsW/kM/Gc7NZTSR7i/ZOadwaTf0cxg7459wmUnHoX5OP/ZhIAU?=
 =?us-ascii?Q?JaohJ3ugbw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca17a98-827e-4656-0e9d-08de7e4a6837
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:57.6289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o44Q1LDL0hXt0reW7wC1Wkp/AuvO5oQbSIXmQpguqS7v1un3fGOwSyr3myiMk3dAxf0Vugnor3QCcSi8xSGucg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

Add the FSP (Firmware System Processor) module for Hopper/Blackwell GPUs.
These architectures use a simplified firmware boot sequence:

    FMC --> FSP --> GSP, with no SEC2 involvement.

This commit adds the ability to wait for FSP secure boot completion by
polling the I2CS thermal scratch register until FSP signals success.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs       | 141 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |  12 +--
 3 files changed, 148 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fsp.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
new file mode 100644
index 000000000000..d464ad325881
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
+//!
+//! Hopper/Blackwell use a simplified firmware boot sequence: FMC --> FSP --> GSP.
+//! Unlike Turing/Ampere/Ada, there is NO SEC2 (Security Engine 2) usage.
+//! FSP handles secure boot directly using FMC firmware + Chain of Trust.
+
+use kernel::{
+    device,
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::Delta,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
+};
+
+use crate::regs;
+
+/// FSP secure boot completion timeout in milliseconds.
+const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 4000;
+
+/// GSP FMC initialization parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspFmcInitParams {
+    /// CC initialization "registry keys".
+    regkeys: u32,
+}
+
+// SAFETY: GspFmcInitParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspFmcInitParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspFmcInitParams {}
+
+/// GSP ACR (Authenticated Code RAM) boot parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspAcrBootGspRmParams {
+    /// Physical memory aperture through which gspRmDescPa is accessed.
+    target: u32,
+    /// Size in bytes of the GSP-RM descriptor structure.
+    gsp_rm_desc_size: u32,
+    /// Physical offset in the target aperture of the GSP-RM descriptor structure.
+    gsp_rm_desc_offset: u64,
+    /// Physical offset in FB to set the start of the WPR containing GSP-RM.
+    wpr_carveout_offset: u64,
+    /// Size in bytes of the WPR containing GSP-RM.
+    wpr_carveout_size: u32,
+    /// Whether to boot GSP-RM or GSP-Proxy through ACR.
+    b_is_gsp_rm_boot: u32,
+}
+
+// SAFETY: GspAcrBootGspRmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspAcrBootGspRmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspAcrBootGspRmParams {}
+
+/// GSP RM boot parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspRmParams {
+    /// Physical memory aperture through which bootArgsOffset is accessed.
+    target: u32,
+    /// Physical offset in the memory aperture that will be passed to GSP-RM.
+    boot_args_offset: u64,
+}
+
+// SAFETY: GspRmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspRmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspRmParams {}
+
+/// GSP SPDM (Security Protocol and Data Model) parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspSpdmParams {
+    /// Physical memory aperture through which all addresses are accessed.
+    target: u32,
+    /// Physical offset in the memory aperture where SPDM payload buffer is stored.
+    payload_buffer_offset: u64,
+    /// Size of the above payload buffer.
+    payload_buffer_size: u32,
+}
+
+// SAFETY: GspSpdmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspSpdmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspSpdmParams {}
+
+/// Complete GSP FMC boot parameters passed to FSP.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+pub(crate) struct GspFmcBootParams {
+    init_params: GspFmcInitParams,
+    boot_gsp_rm_params: GspAcrBootGspRmParams,
+    gsp_rm_params: GspRmParams,
+    gsp_spdm_params: GspSpdmParams,
+}
+
+// SAFETY: GspFmcBootParams is composed of C structs with only primitive types.
+unsafe impl AsBytes for GspFmcBootParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspFmcBootParams {}
+
+/// FSP interface for Hopper/Blackwell GPUs.
+pub(crate) struct Fsp;
+
+impl Fsp {
+    /// Wait for FSP secure boot completion.
+    ///
+    /// Polls the thermal scratch register until FSP signals boot completion
+    /// or timeout occurs.
+    #[expect(dead_code)]
+    pub(crate) fn wait_secure_boot(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        arch: crate::gpu::Architecture,
+    ) -> Result {
+        debug_assert!(
+            regs::read_fsp_boot_complete_status(bar, arch).is_some(),
+            "wait_secure_boot called on non-FSP architecture"
+        );
+
+        let timeout = Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS);
+
+        read_poll_timeout(
+            || regs::read_fsp_boot_complete_status(bar, arch).ok_or(ENOTSUPP),
+            |&status| status == regs::FSP_BOOT_COMPLETE_SUCCESS,
+            Delta::from_millis(10),
+            timeout,
+        )
+        .map_err(|_| {
+            dev_err!(dev, "FSP secure boot completion timeout\n");
+            ETIMEDOUT
+        })
+        .map(|_| ())
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 3bd9b1dd0264..bdbe7136f873 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -10,6 +10,7 @@
 mod falcon;
 mod fb;
 mod firmware;
+mod fsp;
 mod gfw;
 mod gpu;
 mod gsp;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 7c6311cd37bb..e2ad70d32ff9 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -508,17 +508,17 @@ pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result<usize>
 }
 
 /// FSP writes this value to indicate successful boot completion.
-#[expect(unused)]
 pub(crate) const FSP_BOOT_COMPLETE_SUCCESS: u32 = 0xff;
 
-// Helper function to read FSP boot completion status from the correct register
-#[expect(unused)]
+/// Read FSP boot completion status from the architecture-specific thermal scratch register.
+///
+/// Returns `None` if the architecture does not have an FSP.
 pub(crate) fn read_fsp_boot_complete_status(
     bar: &crate::driver::Bar0,
     arch: Architecture,
-) -> Result<u32> {
-    let addr = fsp_thermal_scratch_reg_addr(arch)?;
-    Ok(bar.read32(addr))
+) -> Option<u32> {
+    let addr = fsp_thermal_scratch_reg_addr(arch).ok()?;
+    Some(bar.read32(addr))
 }
 
 // The modules below provide registers that are not identical on all supported chips. They should
-- 
2.53.0

