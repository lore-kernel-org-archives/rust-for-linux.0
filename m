Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16823A9D94;
	Tue, 10 Mar 2026 02:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108728; cv=fail; b=LqW6lZo3jRKrejh6XGNjmCQqolNFBfIL31yoBo3Dc093e9xzilQ3ShsxwXtydaSYQ4WYKlqHSoxg+94gMqyH/zhRqhMIRJ8skgV0lX1jiUid69qo7x3KvKpL7LpnApazTPo3iBXWfgB3raF1CHl4SwDiLe9uAUmsSB3WNFkrhtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108728; c=relaxed/simple;
	bh=Sb0Y8CCW2iHjHVzSCaHMaAocV1vudJhribkNYECOZDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nl1b378Xm1S1U53oInYfbft2Am5RgMM3Ru4umxjeOm7NXk8eC5pGCgmbWd629s5MSMato2P2XdelvqjgG1g6oRgUasF+Ehw5PaLwyO+McKdNJ07+QVVEwY5Je2ZHGNQKsqNQg6GnNEyuVeOdEOPcNXHigGEBo2ZWA1j0Z9XAzek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GEW9WiDN; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GEW9WiDN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKRnKzDyIlEKoMvOtPZ9gWnXuoOoaUpu/4eihkZj6KfzIAh+GUljC0U3WH9LtFehy+koQgba2n88eljRoN96DDZvKAuvUSd9Pm7ifAjZBS481HMKgWYmMEGwiOlE9UFYWjc+RKdILjSOmDbH4pVrmLJ8tZfWnWrc8M6Yf2TQBEpO2MQTPBZSpc9u30ezCBSAImWmAEvJXroQnxdizI5KFJHL2B3jg3xE4l636Mk+IQ2er4IH1dY+exDobERyvymQwAQQed4zSM/CrPhTH6jI7MIn5Cq7RftTXfDklruSKJyH5ki/BL+rn2hqz5SvYaoC8jGfKMp9RK2I0oi/bfiLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQz1dqsZFgLfOBshn4wWKcniMSY59OFBrimelzdKAmo=;
 b=G7TGRIEN9L3QGRYps1JXEVxVDe2cQEflp8RlUCN7HMnCD3j9H4j8lKgyZWlmAdowKrQpGUh4MCDcYJEr383HeLUJhu07VYpkCMGyPSH5JbMrxMzeeAm1CtKhC/cdcXHt5b/La39iaRfeHkvbLnoDHHsWbfFJwH8PH0m19ZMzvae2qcDEKtONltxsEXl7YCkps2Rv/kpCk2RHQC35KiZ5/YrwSKYE9itwLP4X+MXiu7BbGuPUyg5ZfRwar6nVtgXYuXxCDOdzEqajhZoWfH5itdQX1Ygjwlp7tQLGsuL1ByNeexcLzCwZIlMQ4ffewz6TN6QcZGMQ1Dgqttlz8b7hBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQz1dqsZFgLfOBshn4wWKcniMSY59OFBrimelzdKAmo=;
 b=GEW9WiDNEusXyPayhNEYySU6PSPz2drRhFwvUzTKKAY9ovOdr8tMYp5FjSSbsZTfBNvOjMEKKHfDvPy4ecyv07ZkmcFERZ70Jb0HPn12tfGhDTxQHFUfpb5VoBb7zWpk/ObBjb630rI7EJCT/9FclJyOTAjIhA4wP9/2Zzdk87koZkocqMyXcWEd+dJ/qKxtF/ZQ4vyLMre97RaR2/jU4gdR4YfQcu+tGJ1Z7DxVretlcOk7LksJ+P51WXBS9qwMcbZ8zD1nnONlvMOti8FKk/bT4P4rESbom0FrnItM6hB8w60PVltGhB6byVVGlG/WAvNCLHGIVjOgLvhoQN//Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:56 +0000
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
Subject: [PATCH v6 21/34] gpu: nova-core: add MCTP/NVDM protocol types for firmware communication
Date: Mon,  9 Mar 2026 19:11:11 -0700
Message-ID: <20260310021125.117855-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0183.namprd05.prod.outlook.com
 (2603:10b6:a03:330::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9e4b33-aa97-42c5-3d0d-08de7e4a6758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	sqglPHd60RkWpDDkMPh8FRXAWs8T8PCsFpX6MxVmQAgQaU/ESFHaROWr5nZ1TOkKVJHvEI/Vo4k231PhEfdCHnGgWxVBcxtaq22ZYzyWrp6ZQjg68yQI5PgcSgfDkmusf6mu4OOGz0kSVHp1Il0EOk1Rkyb88dQrLL1D7Mq6IvFmPG99xA6N1wj/poxdG0SwBDUn0YXJtZ4rhQY7FSePzyf+Dg2E2Y8+yEmj/98lWt0g80A5Jyi74TR3d5eJmZiER9mwkQIyP+IzfpRop7J2VbhQSH5di/NRGWPy5WrGmXhkCRfZrVdH+8HPx3AiRYBZmp9W8zdq40yUGYhzXQg96JA/byvnKGVpqdV73Yw4ipZ/wjBq9P9JmePIgXsGhN4t52c603n7EXma052z+tsGybS5TGRWaTZ8MAIY/c5wtVx8UViIf4cPc1+BPkmAESwcFpCuhhPas/eQ2pYYN+hy3X5yRPFknzd/66MwtZx3QGrsoH9cpep2A7YaD8ru3Y07HkTagAndknXhZdrfDzi7MWFezwwghN8ey3WfNzMPOfqwHJ9K+WtV0jnqtwKTDuBqbOXYrKKxVHKJk9dljuha8Z40upfYKYWH4jkCWf+p/x4Rj0xOrSZ+/cuatgSELlbfrydlSRZ/Oe6/Ze9m8GUBCiO9LxPTK9hwPaDW6+gfV4lw0aoCWLXI+KtWH6MZ1QWlSHfEVU/epSFJFiNYcQT+1klL27fMg1XcTmBVISOIujI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ZDHtHgbDzhzpJWhioFLkuvl22u75XVM5RDq5WPaOmxTPxgJ6cIG1eV3siLv?=
 =?us-ascii?Q?sGXWPDQV+dENomZRYFuu0dYEYG3vAHDWX8f1/NLwiXJMdrPt92VV0ZIyP/R1?=
 =?us-ascii?Q?E4rs9m/RjXptYMleXRvQ9cMVt8ix+zZorqCWMnu+ZgE8/UKXjDOLIoDQ1l7Y?=
 =?us-ascii?Q?wafvMFBM7g60zyUFaSia1tZHPFbWuWGa2a/vNosMn+bVM6YmSpxr/VSFBg13?=
 =?us-ascii?Q?a03TdX3X8UDn2DFJCz9LEw2+mgMA6Jfi3awOCuWbREKl2+Slv3N0ZAYyPTEj?=
 =?us-ascii?Q?/SCN5fT3kWWxhadCz37zCk09O+UBRwzhyGpaYUkhTGRKnMFu1711Aew5iJ1G?=
 =?us-ascii?Q?dPXthN+W+Rve0gh1YqQ88DBD+r65inqGz2ti3r2h5hwERWWnZ/7mCMOoM2qy?=
 =?us-ascii?Q?QzQ8+lvVDjyP9Tgmh3dVSri9MM9rkvpm3u0Y+j4Okvr8D1U6yTokJuF0RqHJ?=
 =?us-ascii?Q?IaZ8odXaQHP99/xM1Irl7qd6vjZnbNrzsM2D+hVXwC4trhIIACUcL9CZRv3N?=
 =?us-ascii?Q?QaqJRsbR3axvTKRAx8AaaieA6f1GzxMzqX3UWqhCqQJ/E9fjNdEYYFSRanTn?=
 =?us-ascii?Q?3kUOcOdJciTqHKyZiDjJFseH5LOTe1YVG9iAkZoBluLmr1d26g20mANEB2Cf?=
 =?us-ascii?Q?ppo3ZrAtXTbu5862mcYs01baXxJlTv2Wd52ZSQyu3fdNxCGLxzO6beD4MFtn?=
 =?us-ascii?Q?Y5tbPr6NuTANgQvYFaiOW5yZc2npdQtWflNhR1bVZDv76VrGRj+8VKZsCFTT?=
 =?us-ascii?Q?5hjhouFtikLIDUaayRIBoNUyjayEbigcudCeo8IiR5z6/XW1fOI2omHZKAjl?=
 =?us-ascii?Q?kWEtp/lgSFHVSKlEPnftSmt0zgr1m7wkQMTG07sun8Lq35/05ZcU2QKfRjDa?=
 =?us-ascii?Q?RKoyRVt43S589UHZAeckSgOQycO95pMUjMs0RbEeyRcr1XTsFXCYVuiQFr/N?=
 =?us-ascii?Q?4Dxpcgg5kBZCd+ryHrXAikc5B185kN9IqlTfn852caUwNW+OF16gSIYdNGAE?=
 =?us-ascii?Q?dXt0ZTuG36xyyxaNNa3ZqMOF8HPQVUkR8z1rb+HvEYiJi0Nqf2txb2dqcgbP?=
 =?us-ascii?Q?J9MuWkRjpS1YNY/LBIo2N0qHxpUmLoW6VWqGqX3HTxu+6awv0vqkJpUaDWeq?=
 =?us-ascii?Q?8S2y4SWXtV7NubCTKrjePUxJnjHGuvtMv27+M2J2bYF/kvL4+8t6ZOI7zTu3?=
 =?us-ascii?Q?MIP5anqlaKRg/ieKUbTLmT1oqDfMVgvwv9noOmjv0SP2XnHfHGmGfqF1Z+oI?=
 =?us-ascii?Q?GbD9c3yRWfbx7qJHm5e3ugCIgJO1WO3EQSLpWNS31WQvgCEGSPcuWdzi880i?=
 =?us-ascii?Q?N8Si55ly43BXlyK808kDjDRNXYO3hPqob+zulmTGdlijAvat8b6ES84xYu9E?=
 =?us-ascii?Q?ZBNgDHAVOXaaWsrexi7TLOU6Gx5aLuJ8cMLcmPCBbiVl1u/8V9HG6bGuIdnQ?=
 =?us-ascii?Q?UoEv0s4XWUUn3YomeMi0XdhE3UECLJnATuzsT6AYwXeZ1aL8dQBsyz1wXuX3?=
 =?us-ascii?Q?bXloNMb1SN/u56ms5zWS1DLfjXqbYw76P/wHH7mHDCXlo26wAIIUrrni13y+?=
 =?us-ascii?Q?ZFsiXVIAGgGe0IfLCNj+9DwHhoo3jZ+igObDG/6bw9ABxG5FVB601dxxddQS?=
 =?us-ascii?Q?BBo5E+zcOmjYcU58lVxh2w/1HqUdCO9gg5tmHuGxE84YgX7XFCaVZUMISRtq?=
 =?us-ascii?Q?tnPZbzoIWDON8qQCrYDa5jCghZUbVB9FZBoxGU8ODggpNhR7RR2Gwi8RdWpb?=
 =?us-ascii?Q?9Ihz/cJgZQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9e4b33-aa97-42c5-3d0d-08de7e4a6758
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:56.1031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFYO+9YVKOu0JOajh1UCQEIopcQEIOrJvbWS+t+NmXGUiCIAVvC7gEKQMt1FPHCfQQjprm06XaBBOfhHs38iJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

Add the MCTP (Management Component Transport Protocol) and NVDM (NVIDIA
Device Management) wire-format types used for communication between the
kernel driver and GPU firmware processors.

This includes typed MCTP transport headers, NVDM message headers, and
NVDM message type identifiers. Both the FSP boot path and the upcoming
GSP RPC message queue share this protocol layer.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/mctp.rs      | 107 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mctp.rs

diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
new file mode 100644
index 000000000000..0dafc31b230c
--- /dev/null
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! MCTP/NVDM protocol types for NVIDIA GPU firmware communication.
+//!
+//! MCTP (Management Component Transport Protocol) carries NVDM (NVIDIA
+//! Device Management) messages between the kernel driver and GPU firmware
+//! processors such as FSP and GSP.
+
+#![expect(dead_code)]
+
+/// NVDM message type identifiers carried over MCTP.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(u32)]
+pub(crate) enum NvdmType {
+    /// Chain of Trust boot message.
+    Cot = 0x14,
+    /// FSP command response.
+    FspResponse = 0x15,
+}
+
+/// MCTP transport header for NVIDIA firmware messages.
+///
+/// Bit layout: `[31] SOM | [30] EOM | [29:28] SEQ | [23:16] SEID`.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct MctpHeader(u32);
+
+impl MctpHeader {
+    const SOM_SHIFT: u32 = 31;
+    const EOM_SHIFT: u32 = 30;
+
+    /// Build a single-packet MCTP header (SOM=1, EOM=1, SEQ=0, SEID=0).
+    pub(crate) const fn single_packet() -> Self {
+        Self((1 << Self::SOM_SHIFT) | (1 << Self::EOM_SHIFT))
+    }
+
+    /// Return the raw packed u32.
+    pub(crate) const fn raw(self) -> u32 {
+        self.0
+    }
+
+    /// Check if this is a complete single-packet message (SOM=1 and EOM=1).
+    pub(crate) const fn is_single_packet(self) -> bool {
+        let som = (self.0 >> Self::SOM_SHIFT) & 1;
+        let eom = (self.0 >> Self::EOM_SHIFT) & 1;
+        som == 1 && eom == 1
+    }
+}
+
+impl From<u32> for MctpHeader {
+    fn from(raw: u32) -> Self {
+        Self(raw)
+    }
+}
+
+/// MCTP message type for PCI vendor-defined messages.
+const MSG_TYPE_VENDOR_PCI: u32 = 0x7e;
+
+/// NVIDIA PCI vendor ID.
+const VENDOR_ID_NV: u32 = 0x10de;
+
+/// NVIDIA Vendor-Defined Message (NVDM) header over MCTP.
+///
+/// Bit layout: `[6:0] msg_type | [23:8] vendor_id | [31:24] nvdm_type`.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct NvdmHeader(u32);
+
+impl NvdmHeader {
+    const MSG_TYPE_MASK: u32 = 0x7f;
+    const VENDOR_ID_SHIFT: u32 = 8;
+    const VENDOR_ID_MASK: u32 = 0xffff;
+    const TYPE_SHIFT: u32 = 24;
+    const TYPE_MASK: u32 = 0xff;
+
+    /// Build an NVDM header for the given message type.
+    pub(crate) const fn new(nvdm_type: NvdmType) -> Self {
+        Self(
+            MSG_TYPE_VENDOR_PCI
+                | (VENDOR_ID_NV << Self::VENDOR_ID_SHIFT)
+                | ((nvdm_type as u32) << Self::TYPE_SHIFT),
+        )
+    }
+
+    /// Return the raw packed u32.
+    pub(crate) const fn raw(self) -> u32 {
+        self.0
+    }
+
+    /// Extract the NVDM type field as a raw value.
+    pub(crate) const fn nvdm_type_raw(self) -> u32 {
+        (self.0 >> Self::TYPE_SHIFT) & Self::TYPE_MASK
+    }
+
+    /// Validate this header against the expected NVIDIA NVDM format and type.
+    pub(crate) const fn validate(self, expected_type: NvdmType) -> bool {
+        let msg_type = self.0 & Self::MSG_TYPE_MASK;
+        let vendor_id = (self.0 >> Self::VENDOR_ID_SHIFT) & Self::VENDOR_ID_MASK;
+        msg_type == MSG_TYPE_VENDOR_PCI
+            && vendor_id == VENDOR_ID_NV
+            && self.nvdm_type_raw() == expected_type as u32
+    }
+}
+
+impl From<u32> for NvdmHeader {
+    fn from(raw: u32) -> Self {
+        Self(raw)
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b5caf1044697..3bd9b1dd0264 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,6 +13,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod mctp;
 mod num;
 mod regs;
 mod sbuffer;
-- 
2.53.0

