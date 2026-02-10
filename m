Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509E631B825;
	Tue, 10 Feb 2026 02:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691603; cv=fail; b=H1mIPMJoUhIxNc9r39whKfb0asrCjtcD54OYjfW6LeLJvu2rhnYxJF3DXmtZa6qQs6eJGpHbou307+5cOch2cyXB0Drx5GU7/6lJ+SxRJU/IZ0MTJ1JbPT0umqbZCCHucBbkbP8mPp1HNduLYSynFgFB6xyMG8eRtZd9Td/PeO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691603; c=relaxed/simple;
	bh=PIUFMdMQryEDDr/05X0vuJpDuzGhCBQCzurEHmEp5lE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YlUg0ayAHkF57vD9VBR84RfeOqmIV5pH/ZrI+DJMr+rmii3KrClIMdVjUsFqueMypGXe8/VuzfGjw06e4pi3E+P08XScmXS+DkiN1e5FCDDCVSe+9+oj6lHj34gNJyjMPmIK5pxYtgbudV5ogwBvuoeMw3ktEAY0Oryj+H2p/EI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DYn0O8WH; arc=fail smtp.client-ip=52.101.85.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DYn0O8WH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUTtuZCCRFu0LKsuqYYfzpZZ2EVrVOCFwAKrJrnMIBuMU/NMv/mlmMp7blxx6i9sLFpu9BoZfPUFCzO5Z+d7WYs7ezSaBIewFBV2TeDKXdWiuV727VcOraBfcjkXm8vnLGM8FOwbMQIl6wzIn+39rmFCHR6c3ORmHfPI8/YQv6QLuvBHA4kB7iq3yzZZfxD3zTB1wf5bJQ6Bq0ozdUkhNVtBMGjkgQRJLDOFseRe5edMJ1Tevh++vkgZxyEy7FhR81ReO6/S64gKxCsyyz2F3bvjBB2D4EavfzNJou8ncvIsDLwNH3RDSVYl/gWuw+bh0WeJYVFH9P+OMNT0Mzjsww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuHpO6QDsyMfII5GP/ziKw0EuIrb2xjo3mjxXiZC3MI=;
 b=Vvu1IXc3MoFtHB0O3eNSorkPcPpJ7RstgxMAwpUwd4O7usXsAvj2BuFx5TzM6urKWy1+HFxNjepGLEULek9wqBy3/6KSrj/4Q+M5/eW3RCGt6gMRIbnXqQcKWxxcAdRN+zkJ7L6ojmtH1UuB9RyN4ZDbAIDviMwJzu0EXlcDSt8a7hhD0/rFz6GJA8VdPe+V6rJavvTemhGv+jfZsqQJU3xdPKCxqvBk1v61VyKuLkGbwiiVK0jLOA0CUt7rzyYOiwOt1fIl8/8F/TsquDagmQRtwanQFbk6cPXRJeY4Dz8l8i3TxsHzQwqQASm92XCkSgC6gU285lYm7jOumFPzQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuHpO6QDsyMfII5GP/ziKw0EuIrb2xjo3mjxXiZC3MI=;
 b=DYn0O8WHQplKrI1Bhan5ujO8IB3DcY0ShpeZ8uSv0b99swJpZYoUL7sNC3JdI1ixlbeeDs/w2oMkPHQ1nz9ORJ1b3SjUJtdcM4Vzko3QNGrwsQQGHvWJqdRs1HD6awy0DzEt4JdkWqWQ5BuJdvpRARyza2+ep2kbMpc9RoCk+O5jb3jjo0FtdmITkIBMjLjNpUOle/RBnnDM0xmL51IbVlkGxSaoV6epwXcUkgelMzBxlzqXvN27Zxz0S4alPYFae88Qs8O37l8q797+tPupn/prubURFleu6ICw/1X/4K69DZTGPCH8YqkY2hBwbpIg0EmSCt4g76FnV0Kyq7i6VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:27 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v4 20/33] gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion waiting
Date: Mon,  9 Feb 2026 18:45:47 -0800
Message-ID: <20260210024601.593248-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:a03:333::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a07b618-42e2-44ae-626f-08de684e968b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FybA2du4Yjz65QjX97XU+H7q7FZAgwLseJYWW8jaF8Ag1pDogyt8P/ucreoR?=
 =?us-ascii?Q?m/5CNgZ1RRFtaO+U2r6k2cULMgxDmIfENNQsiOmrJKXnjrafRepcpSXFXgiB?=
 =?us-ascii?Q?0Pbaa0ue1dxCkKGM7oy6UGKktlqW2I/7wjFgYvCeJ0odXeyw/RTCbLddGBmz?=
 =?us-ascii?Q?AILSOf+d7I0Fb0OqwAoZn4kwtIUkXuzv4hxNv1kQW5AUnFigvXzISu3dokhp?=
 =?us-ascii?Q?F9eoTeoToO1GReafgALqTuxTLp9m2mxOapAiXxRFu0yf1X65045gHL0mzSNR?=
 =?us-ascii?Q?9W8t/xLAEMJ8z+xJV99qoNSCqsWCVcNyrI4SKdvXrkseO8FI39hvKzxcHRHu?=
 =?us-ascii?Q?6LiIYLBfPXHPrs68GDWbHutR6J4t16hsUbh5hfyjQ/pg7mI4S4lHYcnHNq0C?=
 =?us-ascii?Q?bWOHrhUORCgIQJvWl/DPoexNSYwbKROlDFvyHxPAGRAQSt+QdTcmxn5G3D4i?=
 =?us-ascii?Q?cXmWJIq8H650Y7zJ1q29XEVQ0cWrwo7RMJaGyXRr+GFTHK13BB8xDxxAfRVl?=
 =?us-ascii?Q?XXIITpAXG85db8vZyNx48K+uRO8Xl9q9eA/cGyVv7pp/3sCFimpAu9mYEzZz?=
 =?us-ascii?Q?n4Vn4wczxF9PXU98Xu4xiUIP5v5/ee1A1n2FH/JnIoGblJj7NCTrxR0VUL9R?=
 =?us-ascii?Q?HTEuRjwf6UZGZoE8mrQY6PHa/FFZNNOdciG1d11cTnHEbNjuvkmYaK5fEIwi?=
 =?us-ascii?Q?Y041DSQWct7n6oGZ+KDVFdVbsklYebJmjCCfBsrYKnmhBR06rbEuHfKnyGDz?=
 =?us-ascii?Q?KCAKl4jIsVv5fS2P58xB18ELGlel8Tw12yvYjzJWOPdrPBBZKLFLWXN0l4Kl?=
 =?us-ascii?Q?do+zDB9o3bahiJdvJZX0FUopFZWD/19Rh+ekWrefXzO0J2yw/lNqXptfxQAK?=
 =?us-ascii?Q?hqfQkPLCKx8tbGQMZ97OnxBih4z6NYamCoDrN1FtzyfiEg/wWE8n1akp+40S?=
 =?us-ascii?Q?NC1uB3gdVZ51Zt2K/0eOhiD4BegE16jwRiAtmCAmZDmivpEJDlGsg+O8s3Ne?=
 =?us-ascii?Q?5W3edrCfUuoVLGwnTBPS0GruKmHm7ZRGJ1CeYtSqTTN9jsMrlXEzgKeqS43w?=
 =?us-ascii?Q?xf4y0q9tNejITSCB+uCsDyK4PEnX9N4K26LygMpZfvpEZEdYXIlGjCSbx3W9?=
 =?us-ascii?Q?5UqHV8xuqKL+dz6OIhrz5PDZuZZplH3GoYJssA5EPyJJ7QCSW9XTV2ofNF+0?=
 =?us-ascii?Q?m78SsF7Du9AzfzXREV4QY0ddKRz26bD2kNx4nrXQJsTebBAsuEeGacz3lbo6?=
 =?us-ascii?Q?kJDYtQejaoWIp1U+gGP3QZCfLogLcNTYBBHJu9H8EF46hmGEyifn5mkrqVIq?=
 =?us-ascii?Q?0F6BhY//gGcY/Q+YSsYAobBGoiTinP/L95duSzWRx+ZItsZ4fGmQ53/CdZC9?=
 =?us-ascii?Q?axWNtLpZ/zhGjtfntydeh5wOaj54k9dg0edI2l11+gM05/7RP/MNQ1n8e9Rp?=
 =?us-ascii?Q?znzMVOFUlkDLQTZcDiwWuHWvJe/e2eNWsry6hs2g/WRsfAApL6X8/3PX3r+G?=
 =?us-ascii?Q?AcM9QGd732gKZTk+lUShDxVkG9LfbGp9NktUzOoyVqdq7eW2e4Wzb1h0EDYi?=
 =?us-ascii?Q?AUPeIcaayT2ZQp5EsVs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OQ+2lTIS1+EFavd8CLZ8XPjeYbcnfQqraAMJXigW9/8IuBw+aeslpVg+z6gL?=
 =?us-ascii?Q?sY5VwV1/4W3Xpq3UOcJy2nij7/YysVDPHsoXplCk5Gof+wLkNmTq8r/riCZa?=
 =?us-ascii?Q?wQTUteY1+DWHHGskxvC5zkklnutr7qGZp6a6otNb8Oi/fT5ABrkYS20CWi3B?=
 =?us-ascii?Q?7lBSwwirxieaYALyuV+nadgSJxxeBwy/qQXfITB3cCUDoHNC6GeNcW+B7xbs?=
 =?us-ascii?Q?NtgfTZsyvHlAVoWL861c70YNTPxl4dQDTi67kBZu75ic4xotj3PJ/Zydqw3k?=
 =?us-ascii?Q?VdtMQT0VLGPoUYCnH33lno9MK+bPOjYj9yy/TjTatue6Z55oIh0ZyTbxRHAK?=
 =?us-ascii?Q?oSz9XJlf+qhcWoqvp64HJQBE3GfrcjI3vi9rUv2ptKKcE+ZlFmYfRgRVAs2l?=
 =?us-ascii?Q?tzLKt9TKWkOWmhSAu0Ij9W4+uBvPY9bzni/IUY/NkjAhVkCGkTYBSudFFtvA?=
 =?us-ascii?Q?fDQX6sboPVOl7JN682H1uqXMsD4kF87CAnuC/qCoGjjOZV7gow0lCYw7FxyC?=
 =?us-ascii?Q?Lx43qixRC+007exC1eZXyufSOlCwVuxyTT3+4bzUSsR/KR/ixsqJFErTpELS?=
 =?us-ascii?Q?IVTsUNCvc0xXZtPUFhGQ2gUIsmRfohM76xFwoLPbO+xwJiNoP/DVVSB0l2EV?=
 =?us-ascii?Q?HFYLDrSl9vd8VzigGIjHFjo/a8Vxv5TOAJmbM+LMWaLbvMI2iS8DtGJCnSTW?=
 =?us-ascii?Q?ulBvZYh1TTjw7DZVJrT9X1DVWea6VsBWZkOcSHvuqSzfXbnQuUyIRAzDqzgH?=
 =?us-ascii?Q?FEsjWdczK4SVCEjqsTnLwiRQ5qN6x1QomTaJDRwtnuZTHTo+tYyRKr/lTLtM?=
 =?us-ascii?Q?txiVM4d5ftFZFxWb+Oy6gfswoBHA8OCZfEQiLYICwnq1+HFwLJ6sg3eoUZ9B?=
 =?us-ascii?Q?wUko3kdEGIRI/JzLh6AFtnz8YaniudUyILyZYxLcju2oIgVh2PfJI7g7srH3?=
 =?us-ascii?Q?7+gYoDU2tQ9Mcc64u8ZLrnEv97Ib7IUx4qTNKAB1gdEc1ZnGmQkU/U3kvYM4?=
 =?us-ascii?Q?GcqgWw68VQG1vkA2D+7xoiaxDLpxtVC+hT54WeccbEKfUg1O4b/A/oTDfv29?=
 =?us-ascii?Q?QKXGs15tqd5gNPEQoRsnBKn7b/CqBO2gT8cvAP4iH8wzlYQPvdistBy9bps+?=
 =?us-ascii?Q?coI5/2Y7oKA5O06Mq+nXh9slOpKnnvR0uq0a/wUpiIJVw7GC9k7ozY1kOMLD?=
 =?us-ascii?Q?2KIen2F+E//WKqztw0b2KR5ieGtB3bjepke1MS93IqRYovI7TVR0w0okeroC?=
 =?us-ascii?Q?h4sfWG8wP1paiwq3gjTmjALRvicl5mzfW9te663JRlkkjWIqMy3v4wRmau93?=
 =?us-ascii?Q?qI9qoGAnJS8MNPzQvj6ldorvtBBuS8XZ07T6GVw8rHU2S7YXfWUWQL36jrMd?=
 =?us-ascii?Q?OAYSQEThPf9CWSW60epEv2OgckavOVrqcxEDDBJul7I6yQpqsgMxnd8tfFbm?=
 =?us-ascii?Q?ez9GWFkoIkUMngmTsY6qeQyCNexF2SsAXCLvhBVznasrhqh0pzKZSlzBcHOX?=
 =?us-ascii?Q?DVCxzR2MIcUwV52knUSfw9m4E5WpwT7k0+C2MRVT9/0U7QoJ2DZ5xnwnJd09?=
 =?us-ascii?Q?ys6d64LHNiAQ4mvRdfslBvi982SGmRbsvZ9bDPfZD9A95lhVOJkNAREibXti?=
 =?us-ascii?Q?qR9ZDqLm9FfbW9Ob1ZEHpBGkj7N01SekF7hjNq5eSNCoRXgGAmAbhHnluAXV?=
 =?us-ascii?Q?Z2HkQb9vplgb7QAF4uyPfrp5z2TRIDY0Zm3gWCo8C//Uf0FAdWlWk6xJxR+k?=
 =?us-ascii?Q?94XRUorYyQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a07b618-42e2-44ae-626f-08de684e968b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:27.7428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/Qg8osnfhBMzRtW/mn5RUfHlVgzAKesJOM/ivqzWbCDilLlHJZGAuT8FCa0QnF69bjxRp8GpXIz0P6OJnUb3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Add the FSP (Firmware System Processor) module for Hopper/Blackwell GPUs.
These architectures use a simplified firmware boot sequence:

    FMC --> FSP --> GSP, with no SEC2 involvement.

This commit adds the ability to wait for FSP secure boot completion by
polling the I2CS thermal scratch register until FSP signals success.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs       | 168 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |   2 -
 3 files changed, 169 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fsp.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
new file mode 100644
index 000000000000..5476259d224c
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// TODO: remove this once the code is fully functional
+#![expect(dead_code)]
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
+use crate::regs::FSP_BOOT_COMPLETE_SUCCESS;
+
+/// FSP secure boot completion timeout in milliseconds.
+const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 4000;
+
+/// MCTP (Management Component Transport Protocol) header values for FSP communication.
+pub(crate) mod mctp {
+    pub(super) const HEADER_SOM: u32 = 1; // Start of Message
+    pub(super) const HEADER_EOM: u32 = 1; // End of Message
+    pub(super) const HEADER_SEID: u32 = 0; // Source Endpoint ID
+    pub(super) const HEADER_SEQ: u32 = 0; // Sequence number
+
+    pub(super) const MSG_TYPE_VENDOR_PCI: u32 = 0x7e;
+    pub(super) const VENDOR_ID_NV: u32 = 0x10de;
+    pub(super) const NVDM_TYPE_COT: u32 = 0x14;
+    pub(super) const NVDM_TYPE_FSP_RESPONSE: u32 = 0x15;
+}
+
+/// GSP FMC boot parameters structure.
+/// This is what FSP expects to receive for booting GSP-RM.
+/// GSP FMC initialization parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspFmcInitParams {
+    /// CC initialization "registry keys"
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
+    /// Physical memory aperture through which gspRmDescPa is accessed
+    target: u32,
+    /// Size in bytes of the GSP-RM descriptor structure
+    gsp_rm_desc_size: u32,
+    /// Physical offset in the target aperture of the GSP-RM descriptor structure
+    gsp_rm_desc_offset: u64,
+    /// Physical offset in FB to set the start of the WPR containing GSP-RM
+    wpr_carveout_offset: u64,
+    /// Size in bytes of the WPR containing GSP-RM
+    wpr_carveout_size: u32,
+    /// Whether to boot GSP-RM or GSP-Proxy through ACR
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
+    /// Physical memory aperture through which bootArgsOffset is accessed
+    target: u32,
+    /// Physical offset in the memory aperture that will be passed to GSP-RM
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
+    /// Physical Memory Aperture through which all addresses are accessed
+    target: u32,
+    /// Physical offset in the memory aperture where SPDM payload buffer is stored
+    payload_buffer_offset: u64,
+    /// Size of the above payload buffer
+    payload_buffer_size: u32,
+}
+
+// SAFETY: GspSpdmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspSpdmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspSpdmParams {}
+
+/// Complete GSP FMC boot parameters structure.
+/// This is what FSP expects to receive - NOT a raw libos address!
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
+    pub(crate) fn wait_secure_boot(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        arch: crate::gpu::Architecture,
+    ) -> Result<()> {
+        let timeout = Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS);
+
+        read_poll_timeout(
+            || crate::regs::read_fsp_boot_complete_status(bar, arch),
+            |&status| {
+                dev_dbg!(
+                    dev,
+                    "FSP I2CS scratch register status: {:#x} (expected: {:#x})\n",
+                    status,
+                    FSP_BOOT_COMPLETE_SUCCESS
+                );
+                status == FSP_BOOT_COMPLETE_SUCCESS
+            },
+            Delta::ZERO,
+            timeout,
+        )
+        .map_err(|_| {
+            let final_status =
+                crate::regs::read_fsp_boot_complete_status(bar, arch).unwrap_or(0xDEADBEEF);
+            dev_err!(
+                dev,
+                "FSP secure boot completion timeout - final status: {:#x}\n",
+                final_status
+            );
+            ETIMEDOUT
+        })
+        .map(|_| ())
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..af6f562779d6 100644
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
index f63a61324960..0d3ad4755a81 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -478,11 +478,9 @@ pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result<usize>
 }
 
 /// FSP writes this value to indicate successful boot completion.
-#[expect(unused)]
 pub(crate) const FSP_BOOT_COMPLETE_SUCCESS: u32 = 0xff;
 
 // Helper function to read FSP boot completion status from the correct register
-#[expect(unused)]
 pub(crate) fn read_fsp_boot_complete_status(
     bar: &crate::driver::Bar0,
     arch: Architecture,
-- 
2.53.0

