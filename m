Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1F3301486;
	Wed, 25 Mar 2026 03:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410808; cv=fail; b=HkzBbBwgjm03buI+KqCglHwZAT1bGj+c1D8UwZvXKqFor2gFtm4JaRkUN8IVP+qLLMGaQqN/yzg2bi8gh6Hfhv+ke84GQo2zRvrQVRFNBxBeZlK3TOsyd/5Bq21Z2eeGtd6zqzeYHAof1SBFZP8Q9EuzhzcMCTSc6D1TMnHl0Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410808; c=relaxed/simple;
	bh=uGn5A7z0rWXQHRKfOP+6pFty2L4PYAg69WEhEYRsj84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ORsZnXiHFkz3vMlkMoniBce7Xa6N69cdnQR7UeDFFlmzlYMeF3I3f8zzhmmncLEWefFDzy+AjIwquIgcHHMM76Qdwn7VSrG/6a2x1rGoJKeglPSsqQs82cHRvoeVomvc/jYitC+FpbAj6iyZLGY+oqQ0ghU9jMkJWOAW4v42+c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FaKe5jJX; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FaKe5jJX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjRoXoPpOpgOfKZo6/uS9YGaKiqKUoM69P6SsfuZZITc4/EAalyIIDIc9ybhmid9RTUACRdmO70pWrMIt+jovvJwTmHjzf3TQbVyUBV31fvbTkeNeykO6/gRGiSNUpJ37OogKhtjFPA7McnCNRJ2fbn2defZg+MwYPqu2bGHUWuYS6Inpms8UZjgqDIPrFNosVMkGoaD9GHkUj+huBc2zETBs48uL/l7gsxrDM95HWbEiVE1C2chgGqGu1kH/yUs2ct1T5+kGEq4G+gd8v2+FnjqeYe51SgrkXOpHeS4Z7Hb+DjNSlIdGxsgEl8rAcEAC8jD/8VC1EYz4UIxkYOgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzRIcj/dHKJPD5291IatMInCMnE3FtOQ5oP+XuLOArs=;
 b=p9tCMbZVY76jzInkguENtaBz2GKCaZq/CGgm3B6K/lJkCfiDZyqaF51hR5aug3lgB2CaSKzldmiYJLjQ4sr59mZonmq1ueQKi56TLP/MY+czjQ2ZQHFuVkXYqXhLPHezPtqKvgHeHF0aRYYlcIUt/k0UTryTKiDi1r6ED1P21vzXzifANr3i6TzCfBrD98OtlfBB6CgUvfLHs/fT1mvn4ep45XFeGnX33+x4jMXJovqt0LhodgPmYOy4aHH9saU1IF3wYrsj/wCKHHl0u1LxzhuhvsH3m1hhTZyBGvaWRYwYmaB4Fbx0S8oyB7AxR2ASucmgNzEULfLNO3JObaO3+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzRIcj/dHKJPD5291IatMInCMnE3FtOQ5oP+XuLOArs=;
 b=FaKe5jJXOp05YZhRvWSdPTbNzD1Vgg9qf1UwXnuMp3WyGhCoo2iY9CSwAqzU0LutmkQ4Y3/3YbV8B+FGJU6Ll1DKkdxGaRJTVnRIwiLUYc+lUtns8wosiImG4yLfxcQ8Ix4NBf/i53nphAv8FV6pNeUgqypzvq451XbzlgLt6e3NbKvoIJQLY9o5ncA2vr+8locBCUUwQTBw8aaIfPDu2he/loInE9EvnhRcve4/S0r519BtfwolqImdDXFFhcpO/B9nSuTCwGr740qH+vLSsWu+ChNNZTsVZ+VLwABCI2rIKWx6fcUjL1Waec/OQ1rxDNVHy55WtIgSyyRKGR3TSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:07 +0000
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
Subject: [PATCH v8 18/31] gpu: nova-core: add MCTP/NVDM protocol types for firmware communication
Date: Tue, 24 Mar 2026 20:52:29 -0700
Message-ID: <20260325035242.368661-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d56c4c-2164-40c7-7bb4-08de8a22068f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vPFnAFCUVoM1vu8cI7t3kW9TwkcNbOrAagr2sz8tIfRdGC9s5D2+l9UXOj80Nu0fU5eTXWvDhN58KnhDOB3aKCeGTnqZBsNlLbU5va90CNVRBChgngy9ySONXViSKdrrWdcEq7jv1782lZCL/gqdmkJJbqD/f2EzXdPMbxsbXgPHSRsLA4VrHs+GjH3f5T9EzVAo2fb7VBHqoZQNBmg37AealvC1dmH8SR1+1FM1U4iRu+mfL5kg57eXKzUkeey6dNQl2V601ntnvPd/HgrUtV+JiBCmliZHbJhbLAjYCZMsos8+jhQcQiGdlaR5H1Xgc95TLetGpJOgXMei+H8urro8FL+hEQo9yxRj6lPFrjX/TNmcxPhQvmCy0B2jLmFkUtxT6cZ/U1cud2NI5f/8LbwdhFBUm4rCwOOv7Pi16Xhil+cRFf9pY6YFk8kv4ubYEHD6D7/aRl3u2z4nte12k7TmZIMTMEvKKUbqt1Zs3KqqHH168NpTPcr05iR6C7uhwA4JEadFZartqroDTwYyptDD5E6m0WgFsBEFz8Av7cRKbUE+8Ncw2Z1fabM9PKLfcnwGkW0cF72Hw/KX7D5Bl3CqIq7FYUWvcxHixZTRIqNzUmo1Gz8AHLjtJ/vr/MZcD9Hp0TtPl+ddVvvnTWG3LKCGJsfaKSaAjviTtygo3X5+Dczl2S3kCTQUhJ7ZBuJ3V40fHPovN+kef4VV+ejR8CTCB0kmsB3udin98CmPvrM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?If+dkMlHMyizkaO2Txq8V/0yLSMM9NJammYjQtzNeScMbQvgeOOTaNbpwrt5?=
 =?us-ascii?Q?5S6CMKWhQzEZRUpGNAlUyByNSuE1DeEdADIZw3BQBTtbDuf6H1lkAZ0m4H+v?=
 =?us-ascii?Q?9H0IzuH4IIX0NeS6VFpdxV1xBw1YvFbqFf//MHsCTY81rVqKq9ejorVuiKxF?=
 =?us-ascii?Q?Ee1cYBueIXMDYmsMuLmGKIZ1IOfsT3ZlkrCTvwaO69f/poVPLCac1B4sCUrr?=
 =?us-ascii?Q?I+eP/DILKh/fivEhahIgBQznkDPkDC8bCaABuXWnQlmfxAwP+rVtYxecLumJ?=
 =?us-ascii?Q?LE8JNcpDfgPwUpnqvi6I7uDlo9QPD8+97TdIR9130d/AzrslYq9QdyJ0JR7u?=
 =?us-ascii?Q?UpHjar1Jtve/y4oBPZbMABosUhNZj67i3o8KkvuemukFgUKoIeVjr+HV/Vh0?=
 =?us-ascii?Q?KMTIM/cdbByHlwxfz3WRuAs32id0mgDO51TOZKhFv8m41OIjQm53mgjGY30P?=
 =?us-ascii?Q?OggNIaGkjd7o2T4ae5B+TN1BpmBUYEO3itJzUoqx9Itk7Pd6fHx3wf9ncWsD?=
 =?us-ascii?Q?VxpEtA5p03GeZ73RnswY8SG9Idj4KzEtfc74k5d2+HwqkYx1deHYjm2XvXvz?=
 =?us-ascii?Q?AQu0r60rnJZCDcfVeR+VBvCvRTNm8GABUIIewyOUsSeveChkIJ/dIxUQOzI6?=
 =?us-ascii?Q?Kd2e7daXommwJgwaR6YsQBPDmZ1Oepq5muIqhZJaJZ8RxYRK6ayBOZD4yjHN?=
 =?us-ascii?Q?Om9QvUxxFZt8j0Wezrd4w2mgdpSL6jpE/CORQRf5mqdDkA0zOZknbDEC/nIH?=
 =?us-ascii?Q?25CZkG3If4PRKp//JJg2ruJHScRfPOJM6lscaP5v+lofYZE7v/DfJ+56qhWs?=
 =?us-ascii?Q?YaX2Tm6GGguMszfCC26nNfL02mVtRD2Exo36MTVzlUzWhXakPdOh9lPierkq?=
 =?us-ascii?Q?Y7QADGp63UvQII860SpSLk/FR8/4iHXHBXz2kVjXmWnDJtSN50fDS0vEMu/V?=
 =?us-ascii?Q?EZOFss835q+JIJJmq/grmumi5ZlwE2oZ1JWjFJKDMrwKLwVSrcpZ+qDW6PWL?=
 =?us-ascii?Q?2+ac3lEJKI9d4fvJpvOybYRvE0Ali4BP/rjEtBBWvLtjjy/620qzEGEyF6XI?=
 =?us-ascii?Q?MeTLXAt+436HToHgU+umCdOLxFF8qR3jI3qpnCLaNa5BKbuQNoEFaIYDWrKC?=
 =?us-ascii?Q?wmNw0aVjcXoEp6pR/d59jUdLEvsa6fARnVr+VgOPKJ8LwpM6t448QaVoErxp?=
 =?us-ascii?Q?KpGNewutGmhMsXwpdRXeLUIHQvvcxqufggNl2tyE2ly8Ovv4AKupH4Y+L9pc?=
 =?us-ascii?Q?z+0wRJak+HSqy9hwSThNqp4vF3E/FB6Bk729vyKFTP82/cLek8omNKTgVycN?=
 =?us-ascii?Q?BJsIw3TtK4BHOrqKk9iz70yjrZIdXEeVyRKMLRbQh4SfTM9ropp8ZqVOpIOO?=
 =?us-ascii?Q?OHSyOrnRBs8Dx0cgubDampfiiiq4t60NDlJlXLcxZIcFD6oxRs4kMejTWlPi?=
 =?us-ascii?Q?YUNfftVE6AVrDRgCKTkg+CjtBH3tsUo5EahExwfBquJ+gRsnOMsz15SWgB6G?=
 =?us-ascii?Q?mZCkBlhtd0YKpTbHQGSc9dlQuAggC+dPuFsREGaiIyPbGzwhY5aW4ojNq9wB?=
 =?us-ascii?Q?WWYEWd01DUwxcLXY23iItCUEMuVetjq9DFIecT2u2Loud64aDH4ofRmuCRNC?=
 =?us-ascii?Q?9kThFk7Yd4+kCgNRlXT4ICjFVstaq+/+PDpoPhLeGF0pUL0O4kU4KEz/Snbv?=
 =?us-ascii?Q?Pdh+muzj71j8kDSoFZEXKZDcMSz9jgDJcq6gZILUR6a6ioteqWwPNUikfuxy?=
 =?us-ascii?Q?d8+iABkJAA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d56c4c-2164-40c7-7bb4-08de8a22068f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:07.8336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mvUgBw+q7XAYyo7Ga9RZXr+Id/w5CQ3/VhrDPPKFtGCTr1nRu7+/CJq9N1SDTneSAJfCED4hYN4Try+EPQEjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

Add the MCTP (Management Component Transport Protocol) and NVDM (NVIDIA
Device Management) wire-format types used for communication between the
kernel driver and GPU firmware processors.

This includes typed MCTP transport headers, NVDM message headers, and
NVDM message type identifiers. Both the FSP boot path and the upcoming
GSP RPC message queue share this protocol layer.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/mctp.rs      | 126 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mctp.rs

diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
new file mode 100644
index 000000000000..9e052d916e79
--- /dev/null
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -0,0 +1,126 @@
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
+#[repr(u8)]
+pub(crate) enum NvdmType {
+    /// Chain of Trust boot message.
+    Cot = 0x14,
+    /// FSP command response.
+    FspResponse = 0x15,
+}
+
+impl TryFrom<u8> for NvdmType {
+    type Error = u8;
+
+    fn try_from(value: u8) -> Result<Self, Self::Error> {
+        match value {
+            x if x == Self::Cot as u8 => Ok(Self::Cot),
+            x if x == Self::FspResponse as u8 => Ok(Self::FspResponse),
+            _ => Err(value),
+        }
+    }
+}
+
+impl From<NvdmType> for u8 {
+    fn from(value: NvdmType) -> Self {
+        value as u8
+    }
+}
+
+bitfield! {
+    pub(crate) struct MctpHeader(u32), "MCTP transport header for NVIDIA firmware messages." {
+        31:31 som as bool, "Start-of-message bit.";
+        30:30 eom as bool, "End-of-message bit.";
+        29:28 seq as u8, "Packet sequence number.";
+        23:16 seid as u8, "Source endpoint ID.";
+    }
+}
+
+impl MctpHeader {
+    /// Build a single-packet MCTP header (SOM=1, EOM=1, SEQ=0, SEID=0).
+    pub(crate) fn single_packet() -> Self {
+        Self::default().set_som(true).set_eom(true)
+    }
+
+    /// Return the raw packed u32.
+    pub(crate) const fn raw(self) -> u32 {
+        self.0
+    }
+
+    /// Check if this is a complete single-packet message (SOM=1 and EOM=1).
+    pub(crate) fn is_single_packet(self) -> bool {
+        self.som() && self.eom()
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
+const MSG_TYPE_VENDOR_PCI: u8 = 0x7e;
+
+/// NVIDIA PCI vendor ID.
+const VENDOR_ID_NV: u16 = 0x10de;
+
+bitfield! {
+    pub(crate) struct NvdmHeader(u32), "NVIDIA Vendor-Defined Message header over MCTP." {
+        31:24 raw_nvdm_type as u8, "Raw NVDM message type.";
+        23:8 vendor_id as u16, "PCI vendor ID.";
+        6:0 msg_type as u8, "MCTP vendor-defined message type.";
+    }
+}
+
+impl NvdmHeader {
+    /// Build an NVDM header for the given message type.
+    pub(crate) fn new(nvdm_type: NvdmType) -> Self {
+        Self::default()
+            .set_msg_type(MSG_TYPE_VENDOR_PCI)
+            .set_vendor_id(VENDOR_ID_NV)
+            .set_nvdm_type(nvdm_type)
+    }
+
+    /// Return the raw packed u32.
+    pub(crate) const fn raw(self) -> u32 {
+        self.0
+    }
+
+    /// Extract the NVDM type field as a typed value.
+    pub(crate) fn nvdm_type(self) -> core::result::Result<NvdmType, u8> {
+        NvdmType::try_from(self.raw_nvdm_type())
+    }
+
+    /// Extract the NVDM type field as a raw value.
+    pub(crate) fn nvdm_type_raw(self) -> u32 {
+        u32::from(self.raw_nvdm_type())
+    }
+
+    /// Set the NVDM type field from a typed value.
+    pub(crate) fn set_nvdm_type(self, nvdm_type: NvdmType) -> Self {
+        self.set_raw_nvdm_type(u8::from(nvdm_type))
+    }
+
+    /// Validate this header against the expected NVIDIA NVDM format and type.
+    pub(crate) fn validate(self, expected_type: NvdmType) -> bool {
+        self.msg_type() == MSG_TYPE_VENDOR_PCI
+            && self.vendor_id() == VENDOR_ID_NV
+            && matches!(self.nvdm_type(), Ok(nvdm_type) if nvdm_type == expected_type)
+    }
+}
+
+impl From<u32> for NvdmHeader {
+    fn from(raw: u32) -> Self {
+        Self(raw)
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index ccd14b757b49..595173543d9d 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -21,6 +21,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod mctp;
 mod num;
 mod regs;
 mod sbuffer;
-- 
2.53.0

