Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C36348C46;
	Sat, 30 May 2026 03:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110638; cv=fail; b=P3LNu8YJcjXgMt6J1QD7c185U+CK1p5/t7fiYvhC4fVecGCwdxFajEPnbDMhSlekezCMIb9tiNTP7pGK+bT9ZepG/e5SQpZXpPL1dGGOdSPdSpaPymf/1zWg/52955V09pCjUffHL9E4o9BSGfSmTNPQFtErd01u9bSfSU5CDio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110638; c=relaxed/simple;
	bh=gX3ZRKDRhjJTf/yqeZ7bu7JPPLQIMJuYH+OrwwZQV8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VDYNLr2GVcPt44WqNHM2xhWCF53DiX0vunlBK8yZn2UIuXx+omXZ/5HwtQg2KTo2CJass1GPDPH+6/hwsCqwfn8KajBhVf71G1UvpL6/YQ8U2CcKosI+fub7uErS8vjcrPKwof0q3d+bvnW8To4Z77xXDKvm5x/j1yLGNyPbAzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eynYdpsY; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eynYdpsY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XH8B4TLruR1WcdMTae0NpwjVhcwOws/D/G5XIQKRHcQdx5GrgUeBSfhSrU3sW82LC+yMMgKoTJNM2kHnpjLAoBXlsXRbHWunvpKzmba95GLf3QBP16U1E+psK4OjwN5CEMEP6JJOe5EMd7R0mAmcQJYJ0RIJU9Hxe8SbYv4jEN37G2ie/YbQrF8r0cou0PhUsjhtBvpNYQLfILLPAi+Q6+NLhEuWFxCHZO0BeKYj6qVr9Lz/nxBbza42MAEfWIJLRB9sDZ8FEAhMfws7nYIaZ7s5jmp5bXFtev3vC0+XedJoTuHt+a7ciL99JYYGIU0CJ1e8WlRh9K0e7G31GhPsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8veI0sn7nGvSVaL820Au6SL2rMDeFEkkNwJUUX5MbEo=;
 b=ExUP+Kv/NDJmkAmDC8o+g5l5npkoQbf66RkyZQZelxFV40YDle84oK3RSl6pTROaGTElN3As8o++efeOlDrAF0KERCnzyeBIS+1/t86Yv5jvDqsAGAKBCpxdt++86vy3ZLJ68iEVQoCSCDTAc5G/gTQc3oI3X7MQ3bN9mQciQ8GFffzBR9TqYxHhdrbjeTSP0oOsHE5AySXXY+KNDEYfhujjUeDjmcQKPFrQXwsDclnIafTBDg848h22iXZWt5Ll8UR2A8d/mG9NRgwR7IdOwnK4Ig3fwkFt3J0oENiMZxXv6OBuTNAWxDdO+GmBFiGsQ5U5h87SlWBWZFrgraxtEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8veI0sn7nGvSVaL820Au6SL2rMDeFEkkNwJUUX5MbEo=;
 b=eynYdpsYVgex9PSMBqJXB2vj5191KR3otqNu0HIcblXON7YEzNCVfU3R9EjVPFvzNyRwN5Hr+o4ut4ZrhDOqibrh10wGz30MglLvVj/CcYf7AIXxdeuCzhDFCrbhyQvLonQNpIBWPpfAcVxrdAWL3jYabYWaUR2bnZlnLfIZvDuaSsN8XpR1Us5sbJOxjLrG/IHl8gTLRyUP4VjNFLfq1TQx+/B2GTTR/InyMP9I077Wv0nMOo5AZTe+/WVOPb+aNzGfHmqVTthL4x8Kpt70Llxmhew9tuv7MOR1YD2+zHEzeHCxHc5MKzye9hlCir2f5Hit5xWPFndZatu96PdwrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:15 +0000
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
Subject: [PATCH v11 16/22] gpu: nova-core: add MCTP/NVDM protocol types for firmware communication
Date: Fri, 29 May 2026 20:09:47 -0700
Message-ID: <20260530030953.740561-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0112.namprd05.prod.outlook.com
 (2603:10b6:a03:334::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 2265d0bb-66a2-4f96-25c6-08debdf8f859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|3023799007|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3hiT6up3FrHmDPJkR4zge1riJKogXd7Fyl/Rwq7xwbj1NSMLsARKB54NvsSSe8PkRfEtc6WJGrY5SVgafW5y0nEzeUxAOLGf3CDwvb8Ka81ymj72x7+r+NeJfiA+PwLT1tEzI62NsSaDmZ8QFr+NS7m1LrpTnNJH48pMaURuANcyArbQm0ZGGhWV44rchcnX281PxVi/sqWgTcHuPK8hi2P+uIQSM6wzTuUi42sDKx7+oOfSyeHLFK4PcbrNzWQs1fitnY55Qm0RvdHtuAXQD8Q7B4DC3fia/R9hErIlwzfwvtIRp94Gw5gHSmqmy6xdpUYuRE0GhJ1YZhGrh8H3osvqDPXiyKqq6P2laRXcP0HoqWUYweOWYCp/Vz99wiyv69yMJ28YScMdDPhjNXd0F5rMcDVKu/SecV7wj0LIOJIpTHLR+bCY56eKfNvbomGCju8rgcQanePnLh9yI2ViWy1TC7L5VwbhOss9GeeEoYNCOFzEahIjwH1i2Z+qGSv15CSmecvPulqXWxxncOIM8JDAYwCQd5ULA5U71ZRyyWRu7+HpGElFtuG5N21qf1KgyABeOTNdxif2peVtGY2o/l5IkKDLyGMTrdToJvHNMu2d/nQ1QLIHrp+OEfOBjobFlIxYZ4KJ4vOvlGPJW7jJK6mXLUAbfn4SpcF9B2gig74+YYeNcX49oxdjiXQYcxhn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3BNZ87xAIbzpSYXGPLcMLcykNGdBqUXfPTHSGV1dZAKCapabv+ELklodeZyW?=
 =?us-ascii?Q?HQGo6eCuRz75x0hshW5DucVGu0vdg4novM9ztUhsHHEP0UqQRPsnuG0dno6y?=
 =?us-ascii?Q?TYmGh4R2A6Wp2IayQbdV6H7+/ArzdDvi6/a1a9rbYPFsh4z+7Wia9cp0RozL?=
 =?us-ascii?Q?pF5tdR4lhLuV8P/IAxoFnpMCtbEs7nstkTUW9TaE12AFsrbqWXKRhRqCXGXH?=
 =?us-ascii?Q?oSw43vA88xbx6LlXIJunLSkB3xKDBtfOjDF0rQxv9ILa/UpQDyjZZ7Tzc9pv?=
 =?us-ascii?Q?yn8l4jrgIWtFNMWhL/5s3Z4+nDIEyqjoJ+xHE8GHCqv7N8XoO89XH3Tag5zj?=
 =?us-ascii?Q?rCPO03jRuhtcOP2NeTX3CqZ4Dg4UreNNR0VGnHJieRuAIeA0+AdkIJl0lCQq?=
 =?us-ascii?Q?aGbgMgaZ93KfA1AkTOg/9LEk6k0yM8QV09FGduG8g8NKaJIb+7z5S8ZLRPLL?=
 =?us-ascii?Q?0z4yr509evCXZvOW03j/nR3ErHV1gLEj9lxTD1BeqkFskZ1X7BSANJtd2qLm?=
 =?us-ascii?Q?fc1SSd3dMLrwy07nqQtgdYBSEroCqPKT3SZrFPED967mLEQ15NQcylY//ZiH?=
 =?us-ascii?Q?dwvgRdBJv8yCuTUnABQhKFPLN4RQ/4yqxOI8lwZesM01z5RJpajwQ1ZRlI8g?=
 =?us-ascii?Q?Z2r1B9IpayA90aTag1mpBEnudZFmf+3rq89fSnEGJj42ZOIuWytJGHrKIxoX?=
 =?us-ascii?Q?CUJUCLcdX9sH+7PqvzekeuJm1GlYY0kCk4yUnJieEaTbCXjjERgQHbWra3Dd?=
 =?us-ascii?Q?M6jTDsUb6efvxEESmp1vQoFCDLfUmZXMsPVHtmGuDLTdguPdhfIsUpKv0opN?=
 =?us-ascii?Q?hnvP2zNxjXlZuABb/yGWCuC+1/yM2+WUkRYpZlbEJcXsPGTK8HyLLEJzxLEb?=
 =?us-ascii?Q?VkCsBc4PBOmERB32kqWMPCC83Wok4JS+3dHd2/tCt07QePjv0hrm1QMIxMN1?=
 =?us-ascii?Q?gRxK2wyqa1QE9dqwRSXmxPs496NmSAHQ5hDtc6X1zRmnBb1ycSlOunl9LNkc?=
 =?us-ascii?Q?di52N+bFVyYy1g7vmc0OwyViNcWCD4Dvo3tg1Qb5DF8VkX1Grh5IFEi4yjYs?=
 =?us-ascii?Q?PlMtND6oFq1OXJm7qAoSM/3vwgYtWbpAgkl+jdb2EU74UGklf7Jz3EsOBPY8?=
 =?us-ascii?Q?j6FO8toJyHKMRuNHDbvPQtkr95MnOGoqiTZnS3dg8DffjhvPQPLnx6b9Rp8g?=
 =?us-ascii?Q?yb8F7YWFP7EZj7Yv0zhe/s/Gk0OOKAR1gx5C8OfAiZiftSuTINSuwcXxNyjb?=
 =?us-ascii?Q?ELwJ/xBO0ZKrEr6WeZlmwTYUWREN/v42nhtsTq862s6NqpoNpXe122vrumlo?=
 =?us-ascii?Q?QYhdVhG1oHybt/i0rednAHBzt0VkssCSpdtS8QGC2t57W1l6a9JGvcX4jse+?=
 =?us-ascii?Q?YFZvPCZQlRxn95pkbCnuyI128kbdDaLwH48qnOWnI/EPyJ/7C6CsGWmINeMk?=
 =?us-ascii?Q?bX/fzqs9PIbsjOXATgV/oHaD2F69ioQ12bP4+gUXXiF5FX7h0h5fc93+L0Ic?=
 =?us-ascii?Q?zzRz4bhQnfyLfykaklAuSVly0bhDfvV15SKtPY3MaSobjFitJwDx36PHrNSg?=
 =?us-ascii?Q?KIJbB5jurdysrpp06Q8KuBXYAeb/VnbqLwiY+IFROmzz1mm1MS6ugF5U20iH?=
 =?us-ascii?Q?9aGA7se4d0ZZHuPMxVZGYaTUdWGt4em4Wd+b7hGOXtVUeeJ8gYxd4Co/aCMU?=
 =?us-ascii?Q?cU4+G2JUybAQFAPB3aac5k4cJxNQcmaISpbFMK0pFZfo2ldf6/oWeLn/ywvB?=
 =?us-ascii?Q?Qz5AJUtCMA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2265d0bb-66a2-4f96-25c6-08debdf8f859
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:15.1996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyeGuW9kMp8KIp0N/2WpxSDNP+iDMIEKbmS16yV4cjhZ+wYJf0MD2J7Gd28tTINUwYDdMGgc8MSUZF4Nz/W5KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

Add the MCTP (Management Component Transport Protocol) and NVDM (NVIDIA
Device Management) wire-format types used for communication between the
kernel driver and GPU firmware processors.

This includes typed MCTP transport headers, NVDM message headers, and
NVDM message type identifiers. Both the FSP boot path and the upcoming
GSP RPC message queue share this protocol layer.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/mctp.rs      | 102 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mctp.rs

diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
new file mode 100644
index 000000000000..a13146dc0cca
--- /dev/null
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! MCTP/NVDM protocol types for NVIDIA GPU firmware communication.
+//!
+//! MCTP (Management Component Transport Protocol) carries NVDM (NVIDIA
+//! Device Management) messages between the kernel driver and GPU firmware
+//! processors such as FSP and GSP.
+
+#![expect(dead_code)]
+
+use kernel::pci::Vendor;
+
+/// NVDM message type identifiers carried over MCTP.
+#[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
+#[repr(u8)]
+pub(crate) enum NvdmType {
+    #[default]
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
+            x if x == u8::from(Self::Cot) => Ok(Self::Cot),
+            x if x == u8::from(Self::FspResponse) => Ok(Self::FspResponse),
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
+    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`, `SEQ=0`, `SEID=0`).
+    pub(crate) fn single_packet() -> Self {
+        Self::default().set_som(true).set_eom(true)
+    }
+
+    /// Returns whether this is a complete single-packet message (`SOM=1` and `EOM=1`).
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
+bitfield! {
+    pub(crate) struct NvdmHeader(u32), "NVIDIA Vendor-Defined Message header over MCTP." {
+        31:24 nvdm_type as u8 ?=> NvdmType, "NVDM message type.";
+        23:8 vendor_id as u16, "PCI vendor ID.";
+        6:0 msg_type as u8, "MCTP vendor-defined message type.";
+    }
+}
+
+impl NvdmHeader {
+    /// Builds an NVDM header for the given message type.
+    pub(crate) fn new(nvdm_type: NvdmType) -> Self {
+        Self::default()
+            .set_msg_type(MSG_TYPE_VENDOR_PCI)
+            .set_vendor_id(Vendor::NVIDIA.as_raw())
+            .set_nvdm_type(nvdm_type)
+    }
+
+    /// Validates this header against the expected NVIDIA NVDM format and type.
+    pub(crate) fn validate(self, expected_type: NvdmType) -> bool {
+        self.msg_type() == MSG_TYPE_VENDOR_PCI
+            && self.vendor_id() == Vendor::NVIDIA.as_raw()
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
index 7b6c331da10e..9f0199f7b38c 100644
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
2.54.0

