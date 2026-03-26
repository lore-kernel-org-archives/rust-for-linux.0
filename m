Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4AD3932E9;
	Thu, 26 Mar 2026 01:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489185; cv=fail; b=Fkn2pWdGtDuEbmHpzQiyfvN96ueJo0AGdG3D5JxgOUtZ+LbEUAn50SVmQ86mxnUwC9myPDuhy3Jbnlu1KnZKG8/SkLNtOQUli73ejy9/WXAgwXzVycL0EwsKHXPZPdCcTqKjz+Ft8xNnf9IZ3D1OI6TOojcqH91rcA9mVhzlRuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489185; c=relaxed/simple;
	bh=TqD7ugkDBNIOYIr/Eav3I6qCa4gHkRJ/8RF4JKyS3JE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QHtsq0iuLUsUfV3e2BIQ++6pwMAlk9Stp35Lxb+ls4mzA6/SvAjVIk4qgh3xcVJtimyuYTptPdALuG2pZblwu/5XsA4ryxc/07d6kj6g7NoUWohHoi5JNwp8F6UgtGpfCsgIc25flvLp7LlGWUsrfXLRkUUAPplOmA4Z4ko8w6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qZ632SOE; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qZ632SOE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRSIiTI5ON3OmWTsBvpFjuVU5r5I44yIcB6P8N73m5DKqlwwvWoajnSBllP6pNPWXAcoFHaKoU/Bz702G+p5415xcYFP7fpCc0IFXzJlzDmEFT1j30nly4ff2u7hgAk+/SQQEZZSIjlsPIp4vOLO/zNduU7gXVaO7y6isdQHc+bPMGGjw4FB47Qkbms70Kk9L4CZIqWXmLvSU0HZMl4aF+1PQ6lFfUq5vEI06GQZ6c+frXqFQZxMqddF8fMYvBEOzGEHru3gXxBWNMCAO7qxMuPrpQ3pYFuN5o1gKNfq1L7qnBmwXz08FmJ7dsWHZHtOOEPN7LjcoxCs1aIPRTI6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5I+aCHOl+RGquHUHSfsPkB9rbA9KarxpNpaHFvDPKI=;
 b=LyekIvFuQZ6UKfEZvnGMmGvrUTuSxpzuVZvxGnAX/Xnytr/IKn+grSo221jAEGfGMTyQifMGl9kwdnHJCiOKa3MjmunHv4RbqW2G/ZI2x4sbxrnFp5S+CPcTwxmbSCFAURxLuiZcbKFbpU61aa8l9SSVUXjKBdmb2WYlosWS6elewDs8+XWbBtRGTY+WVDoaDzNhtNqjaa1rj9I+ohclS5nqxXnVw1Iq4SRZZOVZqPMGGRh2OtbK6ZgKjFVadN0OjnfoRtrGxmZf8qM87M1SMBeij2XJTXddu7Qrxw/AUOSEr/tDnGV0f/4g0QbNKXGC+rMdsHojcepge33cgAi1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5I+aCHOl+RGquHUHSfsPkB9rbA9KarxpNpaHFvDPKI=;
 b=qZ632SOEN/H7cKuBc2VqfZ1KyaRNwCDWYsZAjUR4MOV1ehyNcFZSHc28A5UKog+sUiaZzuVvbUKtx6DguJZ+HMGke29UCHyQY9Z/V0rx0woNMDvdDlSDWpoaMi741bPv5gJAZyq4+s3+w5Gg76vEb+1QMKrrfuWLZSCqfUXxxp6MWkfIkY0b/L9KsLwNTjthSdZ5VZH6EssEPLKADkhqI0zl3T/D6IBl2dRVCrg69P97T+nHkyeWS41U5eoi/bc99e/+orSZjDvEnf7PFh/Diaib6snhpv4fDXaimVr9rc9cv2/dC0mRSKIib7z8nKs5lDhPWzfjyQJHBCyMJBTKPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:33 +0000
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
Subject: [PATCH v9 19/31] gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion waiting
Date: Wed, 25 Mar 2026 18:38:50 -0700
Message-ID: <20260326013902.588242-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: a1412072-8032-49a7-fd30-08de8ad887de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZUIkx568Ef3vIgkpmugJLhueu4p334L7X8p5Hy2ZBNqZRXAVrrCO6doEIuAYIPnZLI+RFNii9ms4Ex9JM4I9flscqqxmktZu5bM/H5BHtifUQTVKrdhuXEUOoYsKsQVJXpWZGrJXmPKXFPNfQ4OIGkA5eEClySzbYxhGINoc0WDGDQSE4TKsRSzdt8TnyhVndCsSpDzEWbjy1OoIs5BkoNs1XVmvcb52yF/+ApPkTJV3fT3K9RLIDPNeXnuhom0AUS14Bai0l/clo0aLj+e+R8+6+x14sTFpb4UFosLhZp7p+SdQXaYe0Tuv0t9Y6bvfRigny/kKVpF1K/KSMjkYP/g2QW0TXtJer1/wcUKiRccL0uqKV6lnytqaR4kFwAi4lTccPzp3SVxLN0tp0vAc0QlLzGTBTDxA6xEwUJ9zTDCPpl/Y/cyQt6PF7Ww9lBHj2/ghJzHEWhQczER8JO6f0Fa1/yI9gzQWykT6wd005jKxQmsMgfI5AvtocceT2FGMTvhZeYkGjACLhAiHngupinu+Z5fxESFteyl3dWoi4pBnwjg/gXF8hz+aP3fxDnKYWvDFltNjD9ioV67+hHYMA3SZvguGPo0Q3GBAqn4v4UB36P0UCw0KJtNZ93HuSrTQd3TCl1ikdnYSV/FfHtQ9ILKYuOkhgot7GTuAb+0Zg31R2RJ8evOsvgL7T6lGyo5hKPYx1adi+A0Loyji6K4cyuM1IUIvu7DQO5Na5tK/KAA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C93qE1/2MdbXkdbQ9/vEy4IcXFe3OXwD5B9ueu6KTuZjJqOkBNyGfhQH53SQ?=
 =?us-ascii?Q?Hth/R+nIUoLlRkbaQv8nF8Io98l+XNBflBhMWNeGUBX0rEpcQX/noauoLbsK?=
 =?us-ascii?Q?7hWr4Yt3zBNd1YyoWoDbGLACgg7Y6jr1GJA/YMD+TjwjlfnJgLr1rbD6D7gk?=
 =?us-ascii?Q?Riix36g2eJrvbLROhM0Yyfam8qFwm+Zren+VGhJDNy1qZFzy3ts8uR6RnIDJ?=
 =?us-ascii?Q?ks4znsV28tmibMA5onSVOgH9Ioq2pRdoa7FHSEF14coQBuQg0STRlFMG00vu?=
 =?us-ascii?Q?IjbxFopmw1LIkfj9Y0ryBetHzdmHU5yLRhV3fL7vQIOM8PB7w8GE31G+yoz+?=
 =?us-ascii?Q?jk8lR9IAmiTrCyTFsd6FMQCJXLqDKGDEMcNIuoBAplpIlkVMyI3U70aRIOK7?=
 =?us-ascii?Q?6NJAOgnp+3NMWBh6Wc+QFnIH3CL+N1tcdmlpi3WUTTCI4jEsBpcP5W3XZkn8?=
 =?us-ascii?Q?Vs5zCDOFx3+SnJbPsqrQ2Tvgs+IqT792JvSnp2lraqFrnl4PASM/87C+qOKF?=
 =?us-ascii?Q?d6LfI82aQf5B4fpmKnbH6ehWtSQoCCpW0NDt5YAoj+ZKT8+6HU9bryMEx4xo?=
 =?us-ascii?Q?aNsYISeJckBh1P1uM1KBZo0Jv6chLZxzdUngRJbXtOBzoPnt5VvWqOyMwBBr?=
 =?us-ascii?Q?iDhkkFkqxK0KSwgD4niortidIXsCrLbaDDo2pF/SJSyjMJVRY2Czq4ttmXmB?=
 =?us-ascii?Q?uw/KEZSSZEJHN3rMOOehi6zbRL5JXDhf756Ga+9M3/OTXT4pZ54r+LFfvDPj?=
 =?us-ascii?Q?Q+abLVT5gkOlPS8z19bu0oc4mw4s5YqBkLLCJ2uBLU2fphcIzwtvcdLf8t61?=
 =?us-ascii?Q?7ABGmn+M9Gtcs+be8DiXASScv/jhQ7U2/OynKpvoBj9EtIhoR5/ZOCvyA41c?=
 =?us-ascii?Q?KuBv3GlW42G9BBbozTJI2HyT5j+j18DfJJjESdCfvGA0ORU6ew4C8jZLiz0X?=
 =?us-ascii?Q?HBZgcbs3JUnGPStN6jYKrsy0HOGZSQPRqGwygulSw5oqM2xsDJ+jAEsfC+rG?=
 =?us-ascii?Q?UDOrjHwsGY8zO5ekGsNjFu+PZAXp8nesKIJgVhGOUGVi2DCcvAZt670bb5U+?=
 =?us-ascii?Q?lQMB1OU9GFubJaDFDPYp6bPUZZRK20xD/Td+jfI/06y5LRhE0519HzP/BNZE?=
 =?us-ascii?Q?kNUkzNRCSO3kkTQbdBrqNtI1DzXXbBMBfxyHQ5g25R6ootP7AIc2ZnwvjZih?=
 =?us-ascii?Q?z6tU9q58IOQkf8Npp46BQfmZYS3H0DQGYmD8Hc2bbdER9BRbvjBtxzsNtWXp?=
 =?us-ascii?Q?ZbKpKM6gN5OcKjZr9/s1lij9B06JEwuwXxunNSpjZ/CAlgnIvvp7fAKkAmRh?=
 =?us-ascii?Q?07fSDTjm+MoSXjwPua+wqAsbR/n2UFuR9RGhRYcj7+g9Xu4oOTxQkFw5+Kfx?=
 =?us-ascii?Q?PA5jO91/mohsdStO9i6c1iOZu5Tsz32t3IwO2TivXBwpMjk/FRqWtppGoUmg?=
 =?us-ascii?Q?N4vhF1ZsybZVpdGhJtdI6GWae4xQqCul+HbOSJLU8NB02bSSzDYbWjoSDhrf?=
 =?us-ascii?Q?k3n4sSkJTOQJ5PF+Mw3+ko8KD7BVe3NCmUjuaBxFkXT6Z+OgiS9t11tW1IRg?=
 =?us-ascii?Q?u9HLGXkw+IXXmM2ERqvA/dDRx48yfyISvRjBgIaBgtfsZglNQ9CtF4/QJQmD?=
 =?us-ascii?Q?/saW3Z3YyzjyzBZWECwQyYpW0ScwlXwHE2LJEfp+8atjVm3BpC9HyRWfH6gq?=
 =?us-ascii?Q?LH1S2U9S8KTBdK8EfU6IpDvZe+xKDaqhNjQP8k/QpxxdpCqCVrVgGf9IYebf?=
 =?us-ascii?Q?U+Bm/IyhHg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1412072-8032-49a7-fd30-08de8ad887de
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:33.1715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSGf4ggaMP/rK5K8AXpx90MhyPa3S7Gu/4cG2RHXiWgG2qQ4vMwtsMe2SBVol4+ADbyrZYKsFcAe6mmteo/S9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

Add the FSP (Firmware System Processor) module for Hopper/Blackwell GPUs.
These architectures use a simplified firmware boot sequence:

    FMC --> FSP --> GSP, with no SEC2 involvement.

This commit adds the ability to wait for FSP secure boot completion by
polling the I2CS thermal scratch register until FSP signals success.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs       | 148 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |  29 ++++++
 3 files changed, 178 insertions(+)
 create mode 100644 drivers/gpu/nova-core/fsp.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
new file mode 100644
index 000000000000..6d32e03d89f9
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -0,0 +1,148 @@
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
+///
+/// GB20x requires a longer timeout than Hopper/GB10x.
+const fn fsp_secure_boot_timeout_ms(arch: crate::gpu::Architecture) -> i64 {
+    match arch {
+        crate::gpu::Architecture::BlackwellGB20x => 5000,
+        _ => 4000,
+    }
+}
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
+        let timeout = Delta::from_millis(fsp_secure_boot_timeout_ms(arch));
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
index 595173543d9d..2120d48f424f 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -18,6 +18,7 @@
 mod falcon;
 mod fb;
 mod firmware;
+mod fsp;
 mod gfw;
 mod gpu;
 mod gsp;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 686556bb9f38..e768a1429a2f 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -8,6 +8,7 @@
 pub(crate) mod macros;
 
 use kernel::{
+    io::Io,
     prelude::*,
     time, //
 };
@@ -491,6 +492,34 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
     31:0    address as u32;
 });
 
+// PTHERM registers
+
+// FSP secure boot completion status register used by FSP to signal boot completion.
+// This is the NV_THERM_I2CS_SCRATCH register.
+// Different architectures use different addresses:
+// - Hopper (GH100) and Blackwell GB10x: 0x000200bc
+// - Blackwell GB20x: 0x00ad00bc
+pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result<usize> {
+    match arch {
+        Architecture::Hopper | Architecture::BlackwellGB10x => Ok(0x000200bc),
+        Architecture::BlackwellGB20x => Ok(0x00ad00bc),
+        _ => Err(kernel::error::code::ENOTSUPP),
+    }
+}
+
+/// FSP writes this value to indicate successful boot completion.
+pub(crate) const FSP_BOOT_COMPLETE_SUCCESS: u32 = 0xff;
+
+/// Read FSP boot completion status from the architecture-specific thermal scratch register.
+///
+/// Returns `None` if the architecture does not have an FSP.
+pub(crate) fn read_fsp_boot_complete_status(
+    bar: &crate::driver::Bar0,
+    arch: Architecture,
+) -> Option<u32> {
+    let addr = fsp_thermal_scratch_reg_addr(arch).ok()?;
+    Some(bar.read32(addr))
+}
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.53.0

