Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768CC38F623;
	Thu, 26 Mar 2026 01:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489184; cv=fail; b=mVI3iyxs4bSLvarwIIbW3CjkrrC6ZZSR/NSI/ODcoJXzi0dNXlFH4gDQmiBGkZKE0OOs0PzqfiWoEuEvtqW8r6/FHTUoxUdQk6BUFnKHHunBMUXPAQG38VkjVL0qwYRzOPgB7JfUQYOVh8JDvj1iyKKn6XG6Xk71/XEMuYl5G4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489184; c=relaxed/simple;
	bh=uGn5A7z0rWXQHRKfOP+6pFty2L4PYAg69WEhEYRsj84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=igvgpDhqxvNmYXnGIEcIHstjUvwjzWt3qXHOOzuhGOIHB4Bfv4SrGZMDNsP+wG23MSbrcIPoS4lTE2ar7WduJ/VkU0x0ZWlFUK49dxlwpvoNy//y/9JE9IJEZJBedlQp5qxW1c0wYFJpH/Lu5xLDLiR2hCR3iZKyrHNbT3UvfBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ksWYj0up; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ksWYj0up"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdzPXig78NxrRumAGR5w5ijx8WjH5ycB6Fu85dVW6oXRAT3d5wUif5hoflU/1nR/lecd6b6X8ERqgMge1Zt8sEsWd4p/lBbeYY16pIN+ilIu2lGFBjsBkRYwk3VcaM6ef3862eX6UPC+Bbjfy1w1PKBcI0Ic8VpgVBZOusCYyvL0jxXWDmaj2qL/0qkZvLY0rkjPJQ4+sGGnxMkGU0sYhZBGDNz4lZ4VYezuJ++xLBShPM4QrjJA+iS/oQmM7r1aOq5s2u2Z3HQvYHgIdXkNXlCz4RyQzWA7JeGH24ZAhSEU+/f3juTgFHCLw9ITM7HroJd5x6f9bVIa5irWh6AMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzRIcj/dHKJPD5291IatMInCMnE3FtOQ5oP+XuLOArs=;
 b=DuXtlKUXbvMOz8htRQXmIJQtlVJ9Q3WWbcckwblq13W6+vQTguzWE3urF9+vSTo964oEYTQ7K/jyrzyZIaebSwQeZAtriiOXJMSEvJB47OxASvuWV3dO7zjN4jKdKCPzbREuSr25By7TiYstJtKqnCrdkQXJgAdF8m9dKBHlaXjo9X+w7iWxOyRzBDXmprZRElQUstsPEMpwxkdrjux9aemMCjTtKH5G88hTHszaSLQOvuV5qGsDD3SiAPFVkm6eX04sIlEBaC657n8P9hrmA4CvYN9IlEZkDc8W5scWQEVk7hqBqjCep39vWS3mkwCYsdItACYG/9IZ9wvo7ZZfaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzRIcj/dHKJPD5291IatMInCMnE3FtOQ5oP+XuLOArs=;
 b=ksWYj0upnYbA/N0gFCuaD0qji9xzTXHFxpr3gk/Mwh25BBfV0qzwO94vUrPlmLS6baU8zULWKHFMJLIJCD4hDsVcupnEbGZTn7cUom557/pAHEd8KMJQ1oXiymf2QQmLY4dvcyMskdaR7TbG0bCYVd3O6qREJlXj9h8Rum1G3j83nbuXyuSjrriJB9I1gQeQMJMsl2k7Yd8nDDJMls8bG6RbmP/uaDwKCOCCS6HHfIN0DDCtSyu51nbtgM3gvU4lcohWWZYUODVqWdpY3wP+1F5qnxY2zCCaDFmKL17UE/8RLjz6k03MYSLNTg2OS87kWWy3w/kpaIzQWzLBbCHckQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:32 +0000
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
Subject: [PATCH v9 18/31] gpu: nova-core: add MCTP/NVDM protocol types for firmware communication
Date: Wed, 25 Mar 2026 18:38:49 -0700
Message-ID: <20260326013902.588242-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f36e69b-2df5-4c8d-20b0-08de8ad88729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iwr8szg2ARMg07+CdQi6dpLtUjqqOach+wSR9XB63qS2l4o1DNsh7kD3ZQ+Nlr4l8AXK+3z+U3CEc43PTCmL3F27uE/tmxuuri3QhRZmKx8EGQ8NDg6EoNgnvvmZq0rotXWc7kIFlse8CMus9nMy48boitw46kiDjLRaq5012UmL925jqZrKP0rvtn+RwTibifgHNv9zNdcmlopj5kcXqysb73QgzEVnQPZX6ORXezRQUP75bvszZvkP2/X9n6WBYn8o+MnguuM2lkihjW+90WOSXgZR1I1I1VganMju0T+XSV465LWxrOB4ExxVP/BJKunhM/1aQ2ns55jPnFeVQzZQ27KD1kbKhHkW8t3VLX0zBWe4LTP7D2Jz2/A5BRIH1Rm8cityaHHxAbG1BRbWTXlObm4nW3dqInsY/Rg5UA7Rtg0vDl7GmHQbjy9bK0ADZUb6gsJfecIrPlRiviAWlHa7UswWD16xyED33aHnlZNQvrgvGrjjydia28r99+nVslPh5/WxdztupIfUm3e6+P8cm04atlBL52BRWPaCm75AMy5fxyQvNww6K3xLT1/Ujd9WKEHEL3DdzpU4EJ9pGW0OvnKpvlTzxpkfwvwPLRZ3RZasklL8FrPeeWYoCHVYuPWQ6BFMud/LihQe9YfJUEbCXUn96ejUt4RfHUrKxQTGKYwnBerhLpLSnrbKEXYYLCP7TuOY62H21pzk5n5+g642POcttgzbtsvORogvlQw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UvOEEhe+4iPM6TdbffjB+bj19vBfQ5ZgRxj2Sl8txrxlVi7+kW+BJUjxSnKk?=
 =?us-ascii?Q?H1aO7drhjH118agtfc2UPC1z5/lDbze4hRgAHizfs2tafY/ZQVTdYk2XKNAn?=
 =?us-ascii?Q?NSoKtzY6St2M2cU+tIpeYhRTcuwmIinrSxdToJPEujmIWONhvb9p+zyxhetm?=
 =?us-ascii?Q?FEVXQkdgvjznfXCIHoJ4UBjeYcPsF0nVYa2NHjvT+xkSHvcFBaL/VbwMQWAf?=
 =?us-ascii?Q?H6MH/CnsqD7fjHZQoddeLNGmPlAZKdeGqWudw4emvdWWi/PSboj3OWmCOnNv?=
 =?us-ascii?Q?G9/SBiVshqfHVlY1syHLcUFhwndEkunw2s/Kxjw/LyHm6IJ+MGox/vtmoAME?=
 =?us-ascii?Q?sSF6zl6CXSy9b34+kn7Rhx+ZkrIDMqVgL/pOrYIv3SUZnnPwqOqKSNbv52ac?=
 =?us-ascii?Q?quVezYgXfT7aXA/74Pjzo8IdB1XOb2EZ8hKumqhiXMynNmwU9uzNXfCIRfID?=
 =?us-ascii?Q?igS+ue7quIG3lyqF+FFX/omr40imx2mdLBZDfvaCojDVYzwGuJO8IhGOgTfJ?=
 =?us-ascii?Q?8ulRF7HIxysoBocRuPonog5sH+uMgGZCQ6Khs7rLJ77sFJ/Zm/almqlbcEBX?=
 =?us-ascii?Q?PyL4Ftqj0jkmbIrd9d79y9NCIoWjQZPqc4cqU2OJqdzQlDF9372yqZliQbpt?=
 =?us-ascii?Q?V84qjNmE2B/Qqqa7NhVPIDJQzHWq+tm7OGKuvFgMGCS/3lpzVtOMA9Jiw6qe?=
 =?us-ascii?Q?GoFEH7d8oolGJq1JxGC1m9KljbpkNz5QuByHD16kIkbyd4Dh9J+7WxFH+NZn?=
 =?us-ascii?Q?fnyUkcTlCoKHUqAeFRgVr60HAb0BRsIlSKNDV7P+cXMch8LoXaC7JJOOTfn2?=
 =?us-ascii?Q?d0IA8p9+OMO2fMXuux9wQ4qQAUVHAzLgrGYU1W0W1w6mGuYqhFhMZCXs3uRW?=
 =?us-ascii?Q?S3m+kGiIoteAnn2kHzrT9dtbln392nojC/86oGZ2fcwb6p/PNd30ue/PeXwy?=
 =?us-ascii?Q?l7Xqd7W0SsCERh0dsi4S+q1EtCgPn7OEj5+Cbsvrz3w225aaVRnI+kUUZUMW?=
 =?us-ascii?Q?VIV7FzsT470ezg4Oinn6hNdcxP/O96AtnUWsOZ1nZF/aE4kct7YsBsSg1jKs?=
 =?us-ascii?Q?jXEj2pSV5elbYX+d6ajuIOEqw2VKJU5wXcqiaoOdpdIGL3e+dMuRS1GXS8iO?=
 =?us-ascii?Q?mjBwGXE7DaM0pJP/bzZKPKblGf9fj8XpL5upS00ZfcuHzWL6fqqwY9M+0Zv/?=
 =?us-ascii?Q?8k44cloZ69AxuDQufiqpeXyfDKbRsRLEhZZkD1NBuJZrmPSY1CWpVfdJzNzL?=
 =?us-ascii?Q?k69eGvcukiJm+ooCpoHNZ8BiPpBcV0gE9X+wfLn+1JelLrhAd2C3H/fXbbH3?=
 =?us-ascii?Q?BmYgCEmfvJezadKGWNvuz4Eu1knAq0cKl3v1Iuh8TwV7YsWq58HhJzRcTbnf?=
 =?us-ascii?Q?8ZAkqfGLJJ1j2z/Mz2z1SUogOAFgb6DQjIdF5ySGJDuE1bb5tPmnWCSYcAOY?=
 =?us-ascii?Q?NQZCkNuGt+jhWChqXNAWRfTMh8IKo2QCgyM62x3+IFgVksFx2dnXaV24RTwt?=
 =?us-ascii?Q?+2e2q9ivUUgqjecS6bi+F0+42kpoa6YvH19+1oF+sYbb1G7/XCjjGpDuumxw?=
 =?us-ascii?Q?f66H60Uj4s+YbrabS4dMUeJE1vNay4K3ZSvYldCpFz4y5q5BCNDO9luyDifW?=
 =?us-ascii?Q?j0IFSXfb9UusYT22L7UT2qRd8lfQ9TZHdRe6D3s01gx7TXJeuygc9PEvA6BO?=
 =?us-ascii?Q?JxP2rcREa8TdAxRzuC6EXu1dVXL5NlDdaMF/6QFUYqVLGi6IXYmFOrS5h0tN?=
 =?us-ascii?Q?C7ho/MJNsQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f36e69b-2df5-4c8d-20b0-08de8ad88729
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:31.9630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7w3admKF83CfgfQTYlRj96y0yHhpMXYXUrCsUvODRnC7HkrSgkKl8gCJU/gYe593jNxx1xkaAH6fNBliBMi7Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

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

