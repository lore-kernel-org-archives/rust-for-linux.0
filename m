Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4009630AACD;
	Wed, 25 Mar 2026 03:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410810; cv=fail; b=lZQL/7VjHPV4t++p2RwHCfdQfUj8FFqTBt4FSre4DSfQ4zxtfft9FpFKBqE7JZdo0Na9iqH7mCw7SNEZ02mGDa1IZSLYNwnliUpPHCouvXiO/u9WBgqmiBZlssd8tK8ae3PvTFCW0mjziHjjS6ow+WxCnKIWD1ttpeILHb29gW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410810; c=relaxed/simple;
	bh=X1Xgsq0Iy19+cPpB6x96lqar/0oC7ucQzCBKPP4tg1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ry4iuv4gCKKFaftaMrnv+70cWkQsdYvyJqmHf2o9Sx1xiae1vq81kB62sz7n75eYt3E8+JYspd//+rwJiCpQdbnKPZ15xBK15UBOg/4qUdGdMY0SfGPQ9RVptlT6qc69ZYOdHsbwtXgye3wcLreHp6bDxqSeK1wOlK27BChsWJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EBM29+iJ; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EBM29+iJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQeAGuamFVC5Yz0AiT4NkERrxm8Iy46yJDrihn3ACTeGzZv+vG7cXrr2GjnlTfgF/sgmPnbNy1+3zhLauqmEsj4AOSgrnhPGRntQIFqj5cgV1/C3h1dOj9hsoiBsszwbytQxdQm6WiU/qYqvsFfQ2X30f3pemYLVSkPH8kbMTR5PfUy2CD7YfreU5Q94IlYPnvBfDsViSSTYrJmF0xtPALO5eZL/Kdiob83sCiuQ/szM0X7wW961CtlNJjE2IsPBzMsCWnQ9V7Ap2/+of7qvj3X27dHdbgcOk7SEfuDXusOj69WWPcSmwofX+jvHj6E4IDruV7vZWtk/UxPoMXa6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Om2sCzGNQIGhssPe20StniuyHqW0+SCdshBxK/KyO2Q=;
 b=dEfVYhTNLHOtmNQnbETWx3SsfckSEphwICDEh19ZvgdCba5aQ3ldyHwiZvM5VpfqyfXCPURWGg2In87iRIsuO0rky/HzXdTJK77g50Lt4lznJEmZWDwrVUzfvuY+HXGvb5X/TFO17rs9E6IiKZkxpM2ThO9iHotBIAyla5KLtbIml2eEm5kt0cCEeIMuHYJJj7OCZmOn2HTiw3tyuH6Zc8PW7hQBb7lWGf+DtR9Dtz1vre7crEuFhgab/TEWL4px98IvtnaaMl+vfBaWw62lwkRTncrJEaH0VanaAC3n34FYjlPv92+bAQmUXeJCT3Vdmny9Jevdr7BFLcbQHAEZNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Om2sCzGNQIGhssPe20StniuyHqW0+SCdshBxK/KyO2Q=;
 b=EBM29+iJ3ZUAEIuGNYcbZWVGV3ZsVogpK49p1+C44e9nRJkR278EjcalVgycSy22PwVfFYC0jTiJo2jMMq66V0FRZoi/4qWGZeh52nn9PPDmQhf0tdt6YZ7zE1cRtqNM0srY1mJV+YTyNSzT/3xT52RxoB3xWANP1/53bNTwaiSQyzVR7ekKPtyG7EyfPmhXoJ91FXnSyRN/99VrpoXiWmuMBPWHYTcSnKZJhX4TELfA5ybJVmv0CZNwZuM8e/tv1WJj9ApViCa9wiLVG3x7EYaL2oFoJn09XYFmuAofb9Koj/R6zifu70LEI8e5m+9gk1STVnGP/AZ+svq3yUzczg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:09 +0000
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
Subject: [PATCH v8 19/31] gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion waiting
Date: Tue, 24 Mar 2026 20:52:30 -0700
Message-ID: <20260325035242.368661-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:a03:255::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 87935e24-2557-4a23-b4c3-08de8a22073e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jMV4QUZHLok2F6NU2Z8qDP5Zp+BeTwUn3Fa7sOu+4I5U80XfB1h6eaKzuYbFxUcu2Hw5LgOvtZnwIExvpACAaJbDPZeuEWHCeq8iJmAYPxFBJlre6KwbGSl/DCGdZmq3bqZnzxDUDVB0zg6d1CB/996mugYdFNooMYbsYpM/K8a7wybw7RmCQqk+DMLFm+Cxt6eT3xCNde5eyYQ8jmnR3EAqMxymg8h0vTnAMwW1QdWRzW2Igt1cjHR3AFsJTx/Afb/McNfNdFQ7a1pVoWtoGl0tFd9IDfVXUN07WWh3A5CzSfkiWHrgCo6On5UQVYS93S4+IA08Cp7rJ7AzaMnDJmtCP+Lghs3IJ50QRirUi9/yg9oLFnBKwIIDLApj1OjPw2xza4pIHv+6RY0g0vTmoWm2S9PIBlJ4VmIBH1yQIaxQu2Q9Rc0zZxK8yvlT+J3Q74JWQ4p7nHtEWGs/roW26DNw8p5SLLozeRteDUCu+Scb6OCxlqsmZBgsnBlVl39wtvRoBwwdHcU2xuyKgyxcmiBKgzmJMrIydvkJnORI1t++03FW6d30V/LCWyEU8XGVMi3gVUcqVc/AlWbYkM7uEpiVceov4LqZc3UaKdnZuXZzF5YyN61j2l2sO0QqIxRAAcUp2WoCyyhQrEyOtRDDri/4MJ/OWRWO8v5TL6L9PamJSfbGJXx9CC3V29+hZNIXY609SFperyj91bq8seEj4yDE/rneucCBU5GbgPkKOC8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?23uK5R8K7RCUirrea1KjXBPuuBCudRtYJYzt8pZCQ2VQXfYnQDqwWV/sIb3/?=
 =?us-ascii?Q?BAOuiNxhpD3nuovIRCYylrpfJny4GbQt6bgHCRJKGyukf7YqiGNUlsr1JGn9?=
 =?us-ascii?Q?D+03Ry8aFfAWQ8pWYnkhiR3axuicquDpEFJ+hGlOmVS3rohCvz4e/Fz7qcIW?=
 =?us-ascii?Q?HTJKg0EPrdzvGD9CqXiUwUidOtHEM7rLJ7On2/jSakRBLvneX260f7+/TCRm?=
 =?us-ascii?Q?EYPqEP83i+Tjh1oq4Zfz5a8r0+ZevFvLrV7uXIXkbtsD8gaFVKdNNfjVt4eU?=
 =?us-ascii?Q?hlbGRhbQC4Xbuq9orx/oGN78Uag428AjwB5b09tQQC+gKJg3//rCousd8ax8?=
 =?us-ascii?Q?5J19L9/hcGAltnFZNnTBd/Wpc3JUw8eDhG52MQ3loJpiTlJyIT77rZGu7alZ?=
 =?us-ascii?Q?p1MpGwMXjzVajpA5w51KpF6deiOIoQIt16aozie+PA9QP/31pFsFqFvHhbtU?=
 =?us-ascii?Q?RiAwqM6a4bsR9fixEtdsVO0dy6y/q3CcoGRg+pSmhWgVTsqBlRH8aMwPCnSg?=
 =?us-ascii?Q?M6QOAhsiAOuiNxSftepUmzD2St+DL2uGiDnwS71P2R9ve5OZ06q5xgjN7cZB?=
 =?us-ascii?Q?l+PsfumclinJrFKN5QwgkcCTIqf8TKbX3/BtXWYBgbcme9Zv3wFGCol0gbd2?=
 =?us-ascii?Q?GLn7GLDbPa90fJveo2iRC6+5yEpppTUfKjMMAiYR/duTMkTFrZBgCc1bMQ2l?=
 =?us-ascii?Q?3zyeLzTuoMZx9HBJRXG87Jeu6TTvRCk1QjF8CE2LL/aqgx+Tw7C1cEah0yhT?=
 =?us-ascii?Q?OjuhHLWdPXAZDSEbMwVB3eMNvWj2pR6feBxYqqgcfbDHFWalX0oybJh3v13O?=
 =?us-ascii?Q?fTPYW3ajCFeXhRtjUFT3fxx5i1w8t+gSZ8Xn+FZpHcqOWPN8tQHIpE8AMevP?=
 =?us-ascii?Q?/pf5/tPvRUlvTnPe+JXOcd4Zo9iALGaXpq1jIGNB61LvRgxuEdHXFodarbe3?=
 =?us-ascii?Q?BtezGeJhUlNygczqpZKE+8l6RvO+LKv9LHb+9bYD62mqad+G6DdMQ8gdvLMO?=
 =?us-ascii?Q?dK0Dzl7XQoNbbx1PCKBN5KaPm7jsyr3F6pJlI2OAobMSJvREvNx7MUIcAl3X?=
 =?us-ascii?Q?7PhWiraVUXBEj/Wxveva10NmP4ktyXB8DFQNsiD2ZPVO0KSnDq/sXI6cHtzQ?=
 =?us-ascii?Q?CWjPRmLBto2CUJjkszu4LjqPP4Cyj2W6Y3sV+gSz3HEduUDZq0v38BHx7iLA?=
 =?us-ascii?Q?t6WNNuK4A6xXnwxdLv3erd1Jh4lZ2dhERJRp3QKdqaK7hDzCYmmQ6XURYi+l?=
 =?us-ascii?Q?xZOH0gdMV2hfaDjKKzIIfPHMFQYvJkxR01pZvWvkysD+H6LklJ6cTfY88G8N?=
 =?us-ascii?Q?wgP0gyuF84eyYAqSHXw0g6F6qO2lGQu/ClI8eOkqnJVEisRBgBdN173DeRro?=
 =?us-ascii?Q?nbRt5M7qJ8nJkEQg4xPSgQDQ0TRk1CTq23TRjOTqCufGDdrWYZkl2j5SjxRi?=
 =?us-ascii?Q?f70qn54fgBGQU9VzCtL5TQ3+70AN+Fyaom9dgY3HU8frspfuK8AaPQoUgA6b?=
 =?us-ascii?Q?wdODzocb4JRPPn2Js+YuEWju8F2qbHm6nk2/osueWUDvs98GTEVcgjDPr2dr?=
 =?us-ascii?Q?nVmtwDjQZ1MBWZ+JthIhInbTYGMm77lJmtW8ULG7KWqIOfiqD88N4jIesgkH?=
 =?us-ascii?Q?I453bOpzuPsQyR1y/9zH/6cA93Wb9N6JeSqLd7MyQA7h8F0aygwR8jjL94L4?=
 =?us-ascii?Q?Qlm4sofyMF9tQZW0A1226Z6MNc8z7AW25L/8vsUC8zWcijptFwu6pM/5/zPk?=
 =?us-ascii?Q?pkkmDG0KIg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87935e24-2557-4a23-b4c3-08de8a22073e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:08.9558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEw1+9YX09IXtVlUEG3IT225Y5nTFFwhTUht4jHDqU3Vzx7L/1WQY5TIMLnwQ6hJBqhtF1MqxZ0Sx+uXkRUZvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

Add the FSP (Firmware System Processor) module for Hopper/Blackwell GPUs.
These architectures use a simplified firmware boot sequence:

    FMC --> FSP --> GSP, with no SEC2 involvement.

This commit adds the ability to wait for FSP secure boot completion by
polling the I2CS thermal scratch register until FSP signals success.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs       | 141 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |  29 ++++++
 3 files changed, 171 insertions(+)
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
index 686556bb9f38..183915a3bb31 100644
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
+// - Hopper (GH100): 0x000200bc
+// - Blackwell (GB202): 0x00ad00bc
+pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result<usize> {
+    match arch {
+        Architecture::Hopper => Ok(0x000200bc),
+        Architecture::Blackwell => Ok(0x00ad00bc),
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

