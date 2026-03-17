Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B203FB050;
	Tue, 17 Mar 2026 22:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788074; cv=fail; b=nNWVAkjh4ZumVpN73A95Fh3gGK2780fvFadHv/9nAGLui8QHKmTIu/XkFbOqqTLOPI15gNOcyigSofgwj9aNoFbyokOx/NLGKkqfFEac8QLGxuOi1u8drWV3gQG6e8tQOycuKTgoTTVmIvo58ByhRaLoS5tj5kiWIZ9e4LJagdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788074; c=relaxed/simple;
	bh=tZRZXPzK09hUuMKljfrFU6NkOLw9n7A5rnyQDFgd6ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fVF7G4kRJ1AV7uhYYKqkv+pIQjexUg6/HABwAjG4G8ARNvNeriR/LyyMlqRTPjQi18Apnk3KEbNymsQQSD2Ffy5jmANPo82R87lwQ7bNoGzaO8rAOnIkoEA46uoB5iI2NQNupcZarVEDRwBur2hVyYtOzX0blNfuIY94hksyvPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mfi1TzIx; arc=fail smtp.client-ip=52.101.43.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mfi1TzIx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fndXKBYBNrWp4k4IYep9zfAGRKz3UlMp2QopdF48GSXmDGZsy4UrjNhQ6JwcdpwcYZ7AkcdAtQNj0BJvJ4oXFqEJ8TTpfdjDGPOYc6fTXrO0HALHNUZR51viNiAf5shAWBTrD/lRW5uVTlIVkdhxpGacUInGvhkT+niUEtj+FysWDtVJLhLQj/x+a4ReRKnQP/gY0+B/7EnpENvnRGOi/uxf/S4MZgd9C7OjbF2dQQTrZDJlP36nrqmZhAq+6K0VNFvJ6ohfahc26pYrUPJJbQzCVhv/GGqUO7Ck6tl/ecV1jcEQV2Yz2YbXL7C0ol4aZGS1RBq44A4y9hucwycgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nEoOdd8HVZSqOMuMkQGsMKUm77Wr5CSTcWJO/q+f0Y=;
 b=XClXVB/nhu4fwvVlasneoSXin8Vx96Ubr8/XI2MAj9L68PbHt/Fvs806Jhcw3J4R0i5nV9wE+qs5R52x0N6BpEpJpMABZEcw07QNN9s7Sx7sBndSQaE79ODAb20BPiOSt+X0XuoiCFIngy1tYPOwPRO0VymlHQxzpEsBem9+FTap/7GwCcNo9PfThA1q+IX+eE9mPKj8OfTDDYhb/3LicEiM1fQF5mrE8eMwNyk3fw/2S1nSXxjHzRRXBGEmKqYF6UHLjWH/keVLg0rHoBFUpVoSfvsASRrSNiA7GjvlIYJxwjssPDQhwBaXQ+Nbg3Vz8CGGhFg7bpAjHrSR21Buwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nEoOdd8HVZSqOMuMkQGsMKUm77Wr5CSTcWJO/q+f0Y=;
 b=mfi1TzIxrENja5cCWVNHLiRBhTw51U1ycJYUGcn48UVjoylj/6htpHoNx3hpDPQMYEEpp3wnLbKntdZx7g5aALRkVPSIb83yN9697iBnc3kojCbfAelYqWSmqRjbY0KZ2TWWVg+jsXJWYt/W/SpdM2b3ftLgIqZFn7vhiOx42O/HzrEdYjpspCBi073b3CWWBAyzacXghhVQ3GxPV2oSczfFOJ1iI8ni1aAxqPta/OJKxUB5Bihq90axzbWHomaIUjh/ecyvSoGGboNioibR5ORaujlcYiiOY49iFfz+DHf4MEB0TlJrEvvuD5HM+MO3H8ykil8AzBs4ZZd6SBTROg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:23 +0000
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
Subject: [PATCH v7 19/31] gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion waiting
Date: Tue, 17 Mar 2026 15:53:43 -0700
Message-ID: <20260317225355.549853-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ef009f-cd85-4d29-1b30-08de847821ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	yIRPGnOsLPXKMkyMFAmt9QJZRvTsojgKGv6G8IHGpscSk8cKorMBQS0Dqthn2bXl5T697TfnblTDKnFLUIlFCZJvhS618MvwNovUR3/GyNqeVjTBxoqhxwGRMqmRnB6BLrGO926aDaW2ANG8pUkGhHYepvdQ/El5D45824B4SFy30kGQxJOnbC6uuothbtm9nHTUbFd4t/g/wNDm8C7HEq/DOheGIkqjhPHZsj4ZVxI2gMRNI3BdevrgfeKyrfAY6Lx6QEOHSRjWCWxHSkaMPWaXh25g2LDxlHdmmKXqVX0Q0McFTutaQ9VNYre2PsaF3WA5mZxLgpJYKERSz9MEwdYZLhbB35AyTwMNc7Z39DcTEPIQ+WbAMxDIyYoquyIoF0aeA3jZtySKpSxBw1CNiALJlqxxiAmg+ov8mFQtn0TNWU4mO1BQtnD9t9V0/EFTJY51YoJcB/+A0r46X6ZITMme3+dS2TM41AtrIim+V2yHev9sBec9lu5WAgTiqW6cKEkJXFfQr/3nbZVvhfu6YR/0qkfWHbbXIfFrFFaKlAw0JsbJHtNKYJUbtHOicGwVYPRlyBSaF5UJNoDDCunYZlFMAO25r3eeT7H3daIAJzG1I5RBcADl1rNvJCojjXf6NBoMwkLeeMznJ4eVrhLYHc7kMdQ9602WOk6UM/3OvPy7WRX9WkUHwwuN66xebSn33QBrh7Cmpz2CThrSX6B6eB077KSjj0as+7CmHfiORAg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xIPDBTd7d3PrPIa+KpsJ23Tl0c1qNRXSi0+JRkZAkIEwCPTe2CHO+7qkUwFT?=
 =?us-ascii?Q?hLZ7C7upx6aeq4kz8JhNOHYyrkB/F/tF3nxhot7hnaH69oSTC3NPQd0kHyfR?=
 =?us-ascii?Q?ocpvHynbcHh946dBfmCUek0AgDwmfvajJDLFfilCi3oUffw0lcwc45/1HTzW?=
 =?us-ascii?Q?K4SiOITVeeXfpcfGTwF0ifjcFQPd4Kq0ZR7N3HLCCxkYoVmPxc7B8AB8FNAF?=
 =?us-ascii?Q?9X3UtEY0v+4xwHVUWkS8k6UBntpuGXdzksTIXrHz619Nfs2wtET4f7oqakr7?=
 =?us-ascii?Q?IQw6YWyrDb9npndYrVNDzXza7qJA7frMIXqULEue6Ex2yjApj0/Ohr4KbK6o?=
 =?us-ascii?Q?dU7+RWWV1IS2NVt/VNEdnimhmhY7ygadaMdWt8Zlx9U+mOl3hwGEh1PCgw8C?=
 =?us-ascii?Q?XXfZlEeTCtvH1xNwTh23iTDi58MvRGiLnEtF1i1wf8iKkGxYNh/9luy8rUFQ?=
 =?us-ascii?Q?fghmQ3SZgRhPR53kPdou6f3uDHWTiLf1n8Naml8/menSkjj73/oG5e/OL1BH?=
 =?us-ascii?Q?wdTBUffdm1v9ufQfTeQjkVbit8dSQlmXlQanvq8ZNkBQymeL/HuTue2lFnaQ?=
 =?us-ascii?Q?nSkWFdiT9sZVGOFGIbzSR1bxbman83kFQ7oC2ceFS1YwEyo6ar0V5pAdzvjZ?=
 =?us-ascii?Q?4Z91RZbmpyfA0h2xCkA9FvPgOCVIBMR4RZG0xV4htCunTP+XdkNvDmLUVJb2?=
 =?us-ascii?Q?740QPRNXbLKWpOh/1BbvoL8CfwcklFLRds78FoNAJPFuF5ezTGaurv4q4YED?=
 =?us-ascii?Q?Jqh7mEYNNkl+i57nG3XMD5NWSU6e+xBBFID9kRpUDP/Nr/OmxHeBqoTQ1Z43?=
 =?us-ascii?Q?KmTCfChe4518dA9Qj0ZGGP9wJzBgiODc2TSnD5yk7W8ZM29mst9DKBMrUTx7?=
 =?us-ascii?Q?BIaKcvSEvx7mu7v80jt9/6nt/ceFfMAzV1VpEZdFcQa6QKJqzZYhXmDw8Kvg?=
 =?us-ascii?Q?Is8ABcGzgtv8BnvFJDDRyCR7w+bqZiVyPTcO6v/IVcdSphl/BW4HLnfUCSQS?=
 =?us-ascii?Q?446gKY7ugALU70w9f6r3jXJs9lra30QeSyeCb1KZbfHX1oz4CCVNNOQbvTs3?=
 =?us-ascii?Q?Cev9IT+hGV7fltbxNsqCtj2H0VXG66q80jCD0j9de4yVfiRk3DXCaCLzSqj2?=
 =?us-ascii?Q?1m6E2kXnWfsJHm38kPtAxVelB6VCDtywLqf+fH80u1sYKAfgtTt28FMLbxgB?=
 =?us-ascii?Q?ZBEMXnJUSEo1Xsl1KSAtl8GrDHbTc8q+4yNjAv8G+x19Z2NU2vcaOAgoC/KM?=
 =?us-ascii?Q?lJG5S1FZiSXTUV2hbKNj5rl2FtIrtHn8eIKLHK2kB0fLpe5+SjhMY2wUsEFR?=
 =?us-ascii?Q?WVbVJm/34S2LNPqjyH+klcLJp3zFRVfgwLyLuK/66nHoq9ek814o9UV1y24Q?=
 =?us-ascii?Q?C9fd4tS4OcYP1/qZzhIKxgf8CIfM9zu8wCVrbSlH1LGOw3Uahpa4EInbYnr8?=
 =?us-ascii?Q?ARi0isgTKile1L9OQKqGk5bgenLCNaOEogsWmGNijeTLfkkdoVzUDZcObRy6?=
 =?us-ascii?Q?IjUPKHrspsLcMWoL2SnHutNCNRi8C11VUIQfLqevaLhZ7uIEszNIZzmPvLrI?=
 =?us-ascii?Q?OF1VRwgE8XK7OsgaJeKbFjx/JAPXo2cSJtTBcroF5wREZxHwTERrkx1Kocmw?=
 =?us-ascii?Q?qUX6XqD++q1RDoU58wg1ueVMICqnOa79SFENoHEGiYFgX39QMYQaPOVISJbn?=
 =?us-ascii?Q?2HQlT+S92QAVE2/bXret1SCaZ3GfcS157La7MN/pwietno3Egc9gfZnnCf+M?=
 =?us-ascii?Q?Sc0gjE4hzw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ef009f-cd85-4d29-1b30-08de847821ae
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:23.0869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDAE6ZNRHkGrLHkbnbZluSRrS/L8yiHoUtl3cJDJ/bZj4iysbUUqsrB1cEmR1lr1p0lhbajmQLssoX9Fgt02+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

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

