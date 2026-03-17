Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548773FAE0C;
	Tue, 17 Mar 2026 22:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788072; cv=fail; b=FZqUwlLNGmv0VNMg23KLCaNvKOlgZ6mZXI3+l9b3W/88vXeBgH9H+ebav8UA689u5Re3e+XnBHWDKanvX3kLaZ60ezyRJdT5w26MPMZ35l1Em4LNIQmcOC/u+nEOaMzg3Spz0KNfTKl1IFbfQPVbdE8SgZG1rXRJZg4zusVocTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788072; c=relaxed/simple;
	bh=Pn6SR0jN3mAxFJgBBxyv5jD0/twOcH94gh0hP/gaLRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HvDPyp0QQXkmLKXL01GWh/A6olRrVpLmPF+imCpmC00eN+LxLyrAQNukQe/c0NkBRDRMRgtixeGXVn2UFZae5tYKlJquMlgIQQlqDQl5iImOPjjjc2AdXVSMt1uADgmtfYz5UvUPBPf8hq0iuJhHDQjfepXEOrb2weKKZwxq+gU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gvi2vbGq; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gvi2vbGq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=El07C/2LGUImSUoZ9x2kQU2tJlRWBKRmGmL778DXk4LWnrf06ikej0NyItDmEmkGp2R6XIF+zMD4MWj9wgTL2rFW+7C0xAutxeRCBpF5zYtPxP3NjoVRIzb8optBArcIIVHLy6ZCwrLHK1HY9Kn5t5xFDQYWIMNpel/JvBxe6M2KCYJ/PJ8nyp2xCzXEb84CE3OAD0Bgo93/ZZhRD/yi/Cp5i3g8q6eyWQ7rEblfYnb2PqWORnVp5U6hYPxtE9fBsM0kkU/80b4AxVYUvWjrwsBRpXXrFH1UsfxmFKPv3OpbhUJyRyMDTH3MumZLmAcatERd/7pSmfnNMMgdHbLi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTR7KifvWWq0naxwp1/whdR4T+68lY3H98BeBhsCQmY=;
 b=VD4asaqOSNz2NiU9/4RaJwGvJo6aqU0rxBCCH52TK2MgsgUmc037tb1bmyvBm0dSdamVwsRBzdQzlK3Y8A5+Nk1mW9URNOMobQzFmslNSmpgWsE3TBJCapkBxOTMCopkzV3AMrncpLVUanVPik+OuWToucJjn20PqtLdRd5L+AQU98efa9rBhAP1+Zh92X2ihPtdRWyV0gVtX44rTA7PVScdvCtKUE/36wTP3NHGGp7Kjsv24T7r2Xv98z5FW9hXiyL7wUpyToDSyx7MN9elSrwpgQOOu6bl0UMXFnTPRq973cihxD0+VIYziUv1tdT4FwrjjQMPCAHGrnZPrtk5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTR7KifvWWq0naxwp1/whdR4T+68lY3H98BeBhsCQmY=;
 b=gvi2vbGqxvUVxwpFGUI5fgTjtcxqhN4cJuTAuH/auAMOZ86h2C46TwTthS0hgh4AWpMLT26O34yacf+aQW8taEt1TK1BX9fVVw3IaX3ACa0OcZR107diSAjvdoucY7oAz+kSR+dBvE6yyXY4H7OE9x0lyu0Ow+oSorTCB/zg6MD5TLmEbuUT55oKE7NTuPyQ0Pmr2AMftsDABszdJ7/cDnyaUjHspvWZrQsP7R/ar2BpJdJ5Lcr4ddU759qV76T47COZo+DHePBjcTtBupm3GhrIjo3Grbo3exVGxyTREab5TSVMC+f7sVZIP/hhPY5gCs3LJoa/x+B8eV2JMkyL3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:21 +0000
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
Subject: [PATCH v7 18/31] gpu: nova-core: add MCTP/NVDM protocol types for firmware communication
Date: Tue, 17 Mar 2026 15:53:42 -0700
Message-ID: <20260317225355.549853-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 7edafd4c-44b6-4a31-dc44-08de847820e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	awcnd0Jkhl+QNrAHzlDY2A7kqLCFr7ihGA2auUtl8ycODIxJCCO41fiFX33FRWbIxs7cU8exDz679hDrVEb0O7k57v/Gmmt+ouoks0bFW9TtBZavedB8VwiISTisoDzqo4tehnD7N7MFNiDqUHd7AgS/b8STT3XZuBkU03Ca5oqBYAALtf6QCnsAW3bCsRJOwWjlle0PwFUVKtzMubbiz/FyG4b4YSUs3ZumS1cMYlgnijle0hZcc/TIUIrgWFmSUb1KX9Pu8+vDD2hllLOhkOWrl9LcmY7EMwA+2PHaUO0uObXgWmxvqexiILQ0q5iYI24P8loQ8i+xnDlWFWJwevvsVPpZ0gj/dU3HNNmCpf1rkYor5DhrwwxnA7iLsmnM4OhHirq9NxgjJVvVGcTnnzOI1v0HrNPRaF6RFutBrv2put+P9FALRLw1C3QeP0PI2xk+nIhXAcxhIFW+RQRSOgm5gEk9iwMjr7m9OC2i910j93HMHcwbxlxK4uidnvZt6vGFsSmiDcmG2HdwmZ7iDFsfud8CIdo+UYs/NnghoxR/iRZAd6RgEu7bha/wp/5pW0YBMFibRXZqOFicHE303UjptNWjlIGtDGEUN6M1urMDgk71DzV9hpsxqIVQ1ccH6X70YPSTHRz9DDF1Qv8FaUf1/16dp2plTciu03zGjA1WEEzElS5g32arTZEorvMBe9VgthNCVaGod0KxD+lLvD+LIEaEAlBujtKPtlLbuEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tnNPHk893MfgVhGUSKUAAATCgC/iv4LCmwjA136PJawFbAKW0AmnV5yn1IUV?=
 =?us-ascii?Q?QkHzGe5ZzBg48xTNLB+gCl7irbj0d5gikkovqklx910UbBSui86UcJuCbwx5?=
 =?us-ascii?Q?E+0Bc9Lq/7gqmveVs9NX60t0S19pirjfepBSU0ZzihVyrQVaNd2r7niM5qC9?=
 =?us-ascii?Q?0lnd3e6kYHeVblkJ2d7D8doROWSLvXmzQc9Qbnnpha/nwcluQ3aqaYqGZrUN?=
 =?us-ascii?Q?FCDA/GkSyY3n0/eByL9G5sKIc+mvf3LP9CGauKG9e33d0obN4V84mjgerNPc?=
 =?us-ascii?Q?9sUsx45QrEHoSN+1WJIrOfm9+VKrJN/yX1tvNWscHGxP2IZMlDedq7sRFwWC?=
 =?us-ascii?Q?gA0x3ut/1Lv13Mxzy/IfzhfoY5Rc20eh/uv4J8PRBZfv+QF6tgjkN6CovMKL?=
 =?us-ascii?Q?/PPNYqpqoePodLenh/jmYLLCKLB46gszGNiPk2pwRQ5uzfKFRbbhj9fzOsbd?=
 =?us-ascii?Q?CTEQ5ZXwFh3me1w/XaskJoSgRXhqN9tkwOKFmwvzXrBf0YFtv7HMc4ZOvMdH?=
 =?us-ascii?Q?dbpURDks4XPjqM8WlWtQG7KDSLkSZjI5i0CkmJ68qkPgAsOl74MpsRDwtAGX?=
 =?us-ascii?Q?knslz8GKyVx1TvutHzlSPRFqZDWATiJLDRaJbUb3d9FyIdsXV6R8AaO9wmYP?=
 =?us-ascii?Q?i6VG5UmwUHUDZoSZdHsSFZk3NpwAfjJwlFpvRf8z+RLW7yLDjAUUDrmuu6tb?=
 =?us-ascii?Q?ycwJeN+ioY+L1QuMIOI7WJP2CsaAf/oiGyQt/PrhSpUko0IesPFfv4XOC7zb?=
 =?us-ascii?Q?ifawZThzuuvfVjPk5vrhN8Mekq4PZ7qBVVCzY/pJxyC5br4oUfDbXBhKcZ2M?=
 =?us-ascii?Q?MVAOO4ZRnsbx8EPQUXAZGSBbAoXttCVVq0dLh183iDz/1F51hwbdd9iLrbdh?=
 =?us-ascii?Q?Qt6cty5RjcOP6oIEOLbTDdLijC4c+8roFjwA2grUWPNn3FF0vHuYjKKMXFet?=
 =?us-ascii?Q?NILgFTpNuQFJXqzJMbZjK42xr+89Ew8qRjZVVrUzwePxU+mtNRLouFMBOexx?=
 =?us-ascii?Q?LYwEx6nzFsPfZ27yasX0GHqqDy0BaXGq4xXdDMafLGTu4/n2Eskj8RqOj/Dg?=
 =?us-ascii?Q?FNF5s+i8TsTXiQM4iBXEoYcvNKjFcW21A87bdxUl+KzTz2wTvIL+0S05uFrC?=
 =?us-ascii?Q?0ZYSW4IDiFJ7N8M/k2V2coOsttorGYky0dFKoZaUz5RRQyyQmTlvckI5F3ij?=
 =?us-ascii?Q?XntI7/V1Rt+/dgcEU2Rvx9bBRAGBQYfruwQNzjt43pDmzqxcTKdfpUO+MjRX?=
 =?us-ascii?Q?C0zhisLmBKSytccCFR6uMvT9m5BflpMHcq67C5sAoEEP9iSEhFiCfciiOS7W?=
 =?us-ascii?Q?7QXdBncySOTtnhawQoeHIHLqC+g3JYVwWZVnB7pt9BCXeXFpIK4/fsbR5+Hn?=
 =?us-ascii?Q?Wwqjt1ljNIYX1IKwCaxA94b5ZbyuQlS1IsmolkAkOozt5rbxz2c3xaxU5d0l?=
 =?us-ascii?Q?bxQGLd8FOkYPutjNZdyuvEbh1is0p071u/qX9Ah160ZNPfX0kzpr1toPKxEF?=
 =?us-ascii?Q?gBSBAVJ6rSOhGCMWy7eLC+DFGjP/I7lsxUjSCNGV8HyFRBD/OvQdZqSnYL+p?=
 =?us-ascii?Q?PFv9PbU8loV3oI4o//N0TEpsQUorgSQaXoTfGl96xdfP/zw0Uy1cIQvxtS9t?=
 =?us-ascii?Q?zXbu2c8sBMM1a1YhluFznQS76qap1xF/fajAY68xyih9wMwGVi94vwpF6p4A?=
 =?us-ascii?Q?B7jDEvWNpqd4GLIR0iXtCzMVjhf8kdGW6yUjINbdLyUfOzjFHyQy2QsW0LLg?=
 =?us-ascii?Q?qve5QOI+1w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7edafd4c-44b6-4a31-dc44-08de847820e9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:21.7921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63o21Q+mfMqbwOp7X6TTeifAuICfcXJCEoP7bi2apZ+qln8v9ctx+yuZfhVBWShgivSFPGWxa/SrTsVE4BBrRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Add the MCTP (Management Component Transport Protocol) and NVDM (NVIDIA
Device Management) wire-format types used for communication between the
kernel driver and GPU firmware processors.

This includes typed MCTP transport headers, NVDM message headers, and
NVDM message type identifiers. Both the FSP boot path and the upcoming
GSP RPC message queue share this protocol layer.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
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

