Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6405631E834;
	Sat, 11 Apr 2026 02:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875834; cv=fail; b=W0Edqho+uPhBHAO2el/I+0llvjzHACK8hf3AsiMMd7JHMzYGVBlamWgm1ZoNtHHOMI5RW74vJ1nlYZDBONIKbTKpparlmBCGTqtPknOZCuEXN9GW0cI/YXQDza9983xB9TKfu+rqY0o9VoMXnA0n0yFaiorPuJnk6GjyOq6QF/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875834; c=relaxed/simple;
	bh=onvRXUxwOHR4imKlrq52U5CpyCsfocRJIx0aD0+HwH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nqW0C0K+WVTBmrC3yhnIKIHy9sGmOEkIQteQ+PH7mOgidSAoyQXPLw1jn0rqK+og1xQ/n37uUm8/fr8fQku4XudPJ0LgCsb6GzzMWynOfpw7PIGzu5yi7T+nYq+bfGsK5drll6/YxnFfREZfZIT3qtArp6bUSmqaSgQ/3TrLSMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U9C/j1xH; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U9C/j1xH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gon48OLsGWQbnT+mvOazQ4KpIqj4FKl6/f+pf6LC46hRxGo9DVv44SMCOzDZdf00pRIoEWOgV03JGCYIG4OEKQITecJYxCFYAnQQNMaCKsnuQ/5EJFiZ8dxXN3rXJGIU6Q+00qTh+SJpmoSfxHySXI8zMQLTKiYJ6BoM5szYIS3qjm3ouPNQ/YATwXvUJwVDSZFgF6RtvJiueF5MhuIARGJAVAyM7eQvr9Eqay+LKuvm1K14CJqi+b4uOrimQWma1NFOiw56wujVrR3F3fXNQJ2aOtYjsrd4tq8lX0D8kVkHm01HM8xCHFuHjzG52WQRBJaVqCCX7L/5Buk6RiuOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jTB5452YdLW+mGfHQcsiuVtQOBERazk7eNR2fB3A3I=;
 b=w2cL3EnxlJ4x/SQiy1UZLYaGFx5woFgIhDEGdO05isV0NOXXbNBLr7kkPcoVCIdqrk/Z9x72coMshvPc9gefVL3VlHN4oHmyoaQuWg7SbJv8CNrKfWeM/j0CjkayAFrpliOcvp9SVtWkLpMLExz7OBpN3520YW2tLuZ/HiCRH6+pauqhlsw3QcmiWKQS2jeZalpIkTufdf8zbqHHw7NKQvLsfKEZYaLbCd69rKfb49SxA6p1knh9ENqrFezx1iwpRbuZhlTr0s4E/a8ce1PIUFwshz62UoSc94Xc2yiUMRuF4+fLVlGfK8MjqLxXvk/Oqpl1Upxl30HfvwrlY/xvew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jTB5452YdLW+mGfHQcsiuVtQOBERazk7eNR2fB3A3I=;
 b=U9C/j1xHhA11/dCK3GUASFYN3ndXJWsT8NHUCAg6lmfUmZqlYqMHtlo2kRPa5Erg+L7awsJmAYN7BnU4U8guCwNZ8jsCskpO5BtEEALiE6dAAHgHGPWgit0Fy7C9jZh4gG3JI/qhPBH/ohWliDB4ipozLhSEat2iuEtAPUfyOuzSPqfh1g6aq27Ksm6rzzYKB3oftvlSVzRhOtTk7FNUP/GJGAv/4dE+FMjwUS1DFXnOLhO9CUbW0aWev6H8FgNl0LrAZMVX+x1h+tK8EXF4BNxnwhHqI5DjgTbkYYi1HiQz4rPjMcYt1mgveVHwaxnmbHaXKnyd8OOaHrQ/fHAPWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:23 +0000
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
Subject: [PATCH v10 21/28] gpu: nova-core: add MCTP/NVDM protocol types for firmware communication
Date: Fri, 10 Apr 2026 19:49:46 -0700
Message-ID: <20260411024953.473149-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0032.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::45) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d684de-70e1-4dd5-c272-08de977513b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	TMi1FTJ/acmDMqPr5lfl2qUIz/po6zibVw8dFgCvEfFUosOTmij5qZs+VeOMVnsYjfXqDnMC5vDBdE2VcpYxu3wRlgC10sVFj4trzk1JMVELeUWOXljBrx83uQJXJDiqUCqk9dgeZhsmF64xGs0cckjXrQp8lOsH0XriuqHykxfk3pkAfWdsU3GtXx9WanHHrQ1Ct9WtHe7U9v2dwZlS1a9yLcYBNUlJB31+EfKID89ty7G9ZcJwPgsQtZuaUbiazOuUb4X9cbWMy1C4H/DNy9ZAmacSqJF0vmnGpVaNo5xXRyNQR8TjrCIhX39Ogd4665kMJiK0nG4w8SGv9mMJRQaOBCiGxKKEwDDDq1n5R7El5+EOAESNwVxzGphALPPfFrBsrdt301GECXkhfb7LsjC5r9WQTMAp10ogeyQwGBlW5jWAdtE5jTVEyUIhj/rwQ9goIVr5io/2x4on8bshju8aApT9LUWPhN4vVloEjfQWdu2f2xMQ9Tk0v/T0mDJOFO4h84NcNYegvZF7Bzntq6psmfSL7CQrFOqruGXqiMm2BQKP+nC/A9RohnBRd7KJX7bX6yKgIL/hwazKEu0M64DOeLbBwJhXcsiz/Z2qi+rZfcZX1LeHm+g2zo9WMjSfd47K2OfF5M1G5rOfIFSNlQkit9GiqD+TXQoUF+fyjjhOFIcet6JHsMLRyTLI1Zc2qSW0f8sisjGq+dUMwSgSgYz6igQidX+uEiDYe37QWiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jCaAr/Uaj4ESjeE4cDJPkpH0ilG4vbdIgsbD+4a0idiHmLGJ849KVtxLqwTw?=
 =?us-ascii?Q?BJnyMndpXOlAhucZhBa7NSb5aUFUYoDB5RGAbC+rKIT6ZXa1taDxqKAev6V0?=
 =?us-ascii?Q?aIvROXpjYL5ytsvTJmZMYJnJ641snE3ZvHUKVNQ3u/qDnaB4gIf6kbvind2X?=
 =?us-ascii?Q?nI9ZEpW0gxS0ZAJe1vp1XKNoS1CAhNJG9RxTN3ZprmFT5czYFvibKemOTiWy?=
 =?us-ascii?Q?GtexLnR49ziNzf+8mek2L3F0MNcAY2mFjRaIyjFalqBTC1UhXW8+AXFgUGCG?=
 =?us-ascii?Q?9jLF8hTKdCdESysc4Q1PtgXwlVhkW0q49Yfs38vvXjUSKWc37gzZzhY7Y2he?=
 =?us-ascii?Q?VOrpHNhTghMcVKXm0r1/eMnzE66LPTQH61VorFZxmVwUOH1cQpMTeYsVgMCV?=
 =?us-ascii?Q?u/qKpeLi9pAjtxt7KT8RsKnsQ9o7rrXe+MnflMULM0Hk9P4TY3nuA7uHlmP/?=
 =?us-ascii?Q?dDnSXJmHgiI5L+CCrc4keNTqWpZEItbnaNwrvf1hQCfemNDxX5GaXiz42lrp?=
 =?us-ascii?Q?kEXUJNsuLszotckggL9EAMPgeIWkU1Y8qp8F5cGvalTmSHKrqUEHNJF6kbMV?=
 =?us-ascii?Q?LS1SOsbxdhUCZKtYURFCYudbZdZ/kSqMKZzHBoGZNx2wldOL5oyvOWSCgndu?=
 =?us-ascii?Q?gD08Tq9GMWqoMfQyCQsjMSbwWqkjajOSOzW9vFS5/WUZq3cm7DqPVmI2NPSj?=
 =?us-ascii?Q?8fx4eLVG4ZSs0DAM07g99pQYPi1mbMprAUzgFRIxZ/U3+FC6CGMu72CzmKCD?=
 =?us-ascii?Q?7hG0OtgjXTo1rWVBYymkyNUGHfQIJ90yslackYqWcYKigCRX2eHokzki3MYf?=
 =?us-ascii?Q?Gb9XFIn10/uuni19dJ/UQPZJ+IjoR8rCUzIINjCAc2Vv/L064db5bHToppAp?=
 =?us-ascii?Q?20kmTE87pw1VCZpfFR0rcCvXZfeozV+o+4HH6KpzQm43ia+oeMiWBXGWSPsV?=
 =?us-ascii?Q?7/L+tX7f9AWJ1AjkJHyNQRHddSP0cI1MSGon7v8LwfKUBKq3J/KMhWSnG/J2?=
 =?us-ascii?Q?pj/b4m2Ohs+6CFxDCkGirGRZKV+fXznxofXM1QQGT4UCz7c0nb0Z8vtHP9c3?=
 =?us-ascii?Q?T8i37wg7TQ/A0Q4gv6k0A6H9EY4iOC9tBo5R2VTq/YjVwOgCxsIY8peQqIkM?=
 =?us-ascii?Q?obOvcwQ63angRoBfZoqXfvLEbOBHyZQfQ5L+/smZEVk0fpA/R9V0tgutd2jO?=
 =?us-ascii?Q?S5ZRrDwWv2YdXck8wyVJlmBy69O3WN/0/Kw7FFl72l2IRnMjiLY/W3+MaB2G?=
 =?us-ascii?Q?X0mS0oX26imo3O/olSw9bMJF/INmVdrK2QAQVspPqaWefSBzturxPvViR0M3?=
 =?us-ascii?Q?Veek06YE/CadsYVYV67zNr+JnCFI5uclOVNYav6x3f+fgrmEDQBdPlODhUEk?=
 =?us-ascii?Q?AvERT96fjpLY2xIIRuQBp5Xc2aeUROLDCLtmaO9myn0hReowhzGlpJDoQpUn?=
 =?us-ascii?Q?R/1GEGXf/Bteold3CqAnps5gtN3U6K9P+pbNaXjHEWfYCZ1giGvzAqytxMHo?=
 =?us-ascii?Q?K2DetqQfb6KZ5JKZmH0YRUXmDpqyHq0GLSEW+IZJ7q5VUraHqrsd4I3TgrPw?=
 =?us-ascii?Q?pUg1aNxHIXGo6Jt7Q++55CdeUQZzUW9H4NdX+6XN+vi+bJ1KMju3ueI5PNXL?=
 =?us-ascii?Q?jno+XfZUvuryIyWaJeInYacmSxeoYg2p70u8tfBxZbbe4z5GmzNHXwGAgGBb?=
 =?us-ascii?Q?C3yAa//D94oiV+sAs18IywQJQEJLbNn2cjdy/K19VEJVsgqs1NDnvBkmNcPZ?=
 =?us-ascii?Q?EDpH0a2uIw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d684de-70e1-4dd5-c272-08de977513b6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:23.2346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lc0h+mDcMhdWWnjI3DddNDm6j4s4iUJeGobLxVjyi6lg0CW3UYsRwZ2HnF+4+XHKI2CyrNcCfnsEOrwPuzpvCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

Add the MCTP (Management Component Transport Protocol) and NVDM (NVIDIA
Device Management) wire-format types used for communication between the
kernel driver and GPU firmware processors.

This includes typed MCTP transport headers, NVDM message headers, and
NVDM message type identifiers. Both the FSP boot path and the upcoming
GSP RPC message queue share this protocol layer.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/mctp.rs      | 121 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mctp.rs

diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
new file mode 100644
index 000000000000..680ed19d196e
--- /dev/null
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -0,0 +1,121 @@
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
index 53558ac0f619..bfa0430b07b9 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -20,6 +20,7 @@
 mod fsp;
 mod gpu;
 mod gsp;
+mod mctp;
 #[macro_use]
 mod num;
 mod regs;
-- 
2.53.0

