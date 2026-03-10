Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1B4399005;
	Tue, 10 Mar 2026 02:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108720; cv=fail; b=NyMarwJlJbEi+PhDwdaQqJSwgTa1E90TJ01TSVudvMdt2vwN8XJHokdLhgHr96Se2Hnrbq9B0nKcmxhOZWhx8GdYm69R8CMRPy4LjN8qECW/wdkCvJWvlcGzEzZMSxgGJTtUtje+cPB5d4MnnHbUlZAFjALN2fVDjgwoqPaUcw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108720; c=relaxed/simple;
	bh=9HVIv2Ob9jqkZQHCFAQKrSMNLt3aIvtUxN3u69tr2Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AY/GNoFX0BW8leiv6NihcHh0xIho9Z+Qx2Xxlcn/iBBFidWA0T74KheuIMT/4CKTB00k7cL02IDDX6IcmPhI/p9LcBcH/A8uEsnWQKKYBrfFdKB2efdTV91RTavqg27J8POBHhxbyVEUcVAp7q/fpCPpSdYHyAAMnq8j/m9ua9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LgxzRCMi; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LgxzRCMi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0HnhUBw5sbrhe6PcSnp3pZOXcnB/Cc7R5VfX9l4KAO/tnKkK4bsRnoMrOCPSd017xRDkju1TxPwZLL97rf0Ud8h0Biw2mpBMVPl4hxJHtLlFiQDbMmswgHT5wYfHysCx0nwjVHu8wI6L9F4VsC2tYkwC1xt/3GrJMVyd2gRHZg21n3MEztQsuInYltXdp6X0bmKI+7zMoa+0p5sxnKoXzEZyUmOkERhBktdVSH3ckCMr2Clc6y8JlXEP0fQMnnZXft6TgADlDxUC4aYMAIMNK4STHZP83RlFzIMkeUf0oOxrnz8k+K+5TeXnmw2iqVlC6ahfEs1guUlC7npAq6/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGT+JL+3eoZTa5OC0izGMCigslcKHghTNFlTCRuBHc4=;
 b=v3Gp9dzfZW8lfQ3Ja8ThIrnoL9N2rVI6r/zA0foyZBjs6aiX56xTxtYvASsm2ycki8Ve1HJZsudss4e/V9UeUAIXw7/ued1WNklTP8kjWoHNDddLhUvoBisABKjaRgkPcqioSZ1mALtmGAiUmWmQ9xNZyziHwNhlqtIk0ZqKZ/Dw0+elrbihDsOOVHsFYlo2Jnep5mHOtN+vaFRR1GZD24xhzspB2fPdGfck/4vOy4fnl1H3rVzpZiBIGJhqTyR9OAnDuurf8mjfyYlGEW0rFtxhg7IXWHfoI8nEjnzL1wCuDR4t8f//X1R4EJ2BnI2pkoRq6RYi6kt0+s0b7Ro1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGT+JL+3eoZTa5OC0izGMCigslcKHghTNFlTCRuBHc4=;
 b=LgxzRCMisw4Rk6bxaZ9iWtDc9Dnp2HVeHxgTsD+d7h0X1h2f74bjFi5EesY+6YS6lgHz1OlmVCMZrTmJkcm0MuGBOGp3eI7rH9k+1EzLmdi0Y485nAYS8pH0YluZ3cQvNSmKxuFwV2Z3QVJ7c3Y8dZMDu8pwa+RRH85SJ5pvcWrHRVeiSjQvyW24M7gvYTvSRgTPhPf1ZN+f2KEGwxaL1jdrl/f4KZOIrx5sL+f7P4drIrn1WS0nR0Rhcg2wK+Vk/jvDJyRENXpGnwGaSGvbN1IDugdcMQKqi0SUFSXHEQB1SiegX+N3xMKlG3+ye8A5/xafpkYVRjqc+8o24ZrC9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:49 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:49 +0000
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
Subject: [PATCH v6 16/34] gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
Date: Mon,  9 Mar 2026 19:11:06 -0700
Message-ID: <20260310021125.117855-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0166.namprd05.prod.outlook.com
 (2603:10b6:a03:339::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f2881c-f098-4eae-1802-08de7e4a6371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	nM3QEVzlZDALQVE1JwaGh3Dd8hSi3Kvp3p9Drvlj4fU4OThkxIQgwoPAgIpHfjvA4SYdYK8cOuY9eu62B1WJcJ2HVI3xcPeRh5JdNvMfLUIRAdWxKHZKCykKgdsjgRermlJWqeCybEBNAjekfMREQqfyeUtVlhBuA7UHxeqO4aY0+uoghluAmCXudTXBKUQ0F0cVy997pWxf8OJ1JRw3E8VF8Ab3DzcFxbUjHjq3qycx4zCuJZr/1OdlNc47OW0AtfYY0U3f6mtx04SGQpf28o5+SFKjjunjUarERU1ZtuUkjpXtowOgwbopFeU3xFtCREitSEnQfxigZz7DcKdqIpOzVSF6bHyu3iDQk8Xhspov1T25Tk31GZVo8nfphI/VnP+ILQdJ6ZWFs6cCFMRRI13Jf4OeDYSDnfnbq99b+NS0D+KA83EpKotGEcgF8qM7HCYfWhaJKteY2Gwe2e2yMBZWIUfaWq/JIBRGB5GBx4MtLnMreLCerscK38V1pw1qaa1LeFWSnmEVjWfvqhlSauvhGyVr8OYWh0TtbNMFDAJG1TAuX6q1IYzZb0JhUQ+n0kMcTzRvD7v09ZkHVMBg6T3zWuEOxlFzeG3zTFsPTxiwCWq/8BIeoWSY9O1CT/oGfccD1c/OvXnSTBdoGFxLK/uCi/qAkc48kyXzHe4p4RI9D10I9PWLkkD+YjMUhFSNBtHwjNEjoxkIvOpkhgqa9ZQFAN9URW5lZDwNbOpJAlI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tp6DWfUA7pGW1wfVlSliBl8yBphGh3kYK81FkuTSQo5K4qKM0oJ7PNBRBPeF?=
 =?us-ascii?Q?ufmO0cdCBbICcrjsL/SEFDnk7Gv7qtUfAHNTBabDlO+jKWoNWfXgNvrPi4wm?=
 =?us-ascii?Q?vvKOQjdchYYcGKPxqcR/99Q62R5gjc15SX3t0MUmdR4GUR523fo6qwVuOz5Q?=
 =?us-ascii?Q?lHgYr6tPfhriIbFbAp1coWFztFMVwFoT7RYBT5RQrw/HWJCt8OtVTs68dMLN?=
 =?us-ascii?Q?AKbrTP5EQsmrJuLxOvsXQ4fp9H31HDtKyF57MsIiwo/XKTvi4UR0ATd/Az8H?=
 =?us-ascii?Q?gLVhf3srz3sjp78r0OqgS5cRQN7/Fsm9pdTO+K5kv/6eQm/ZGIUMHKuHR0tZ?=
 =?us-ascii?Q?zh2kh7/AOXEqCCtQoOGcms5IwL9HTl3HicFcHXSuy+N0+B9/CVDVSVRLxIJb?=
 =?us-ascii?Q?5VdRKSF3l5L4WX7YX+WLEkDZgZorXocdcKutBIoOvmM6BFo+HQ6KAyNcqPdS?=
 =?us-ascii?Q?dgkQhJy6L20jemVfBBDEhq5/SOLRkWasY3tC3/1QLM0KWKuyNRnHTk29WFkk?=
 =?us-ascii?Q?8OI23VTTk4IDA7xIem2dUp+gZBIalXj3ruTBEzs21AdZcOxm9JUSdBj4N96F?=
 =?us-ascii?Q?kNtanpygf4ElUWYVCAKlUY1g8OJmf1UvlxZlpenzs1ctKokYaXAG1dA1E/dS?=
 =?us-ascii?Q?GBXi0SgKgd3AQkvvNkRBdN1oFqyrkl+5swRuZdUC97nGVuTQJni8h8bIQorx?=
 =?us-ascii?Q?RakpLuTlYXuY3y8htxds84HwTJdacDJDmt6mcrbCsozXUEV7zO9N0auSE71c?=
 =?us-ascii?Q?xtBr0lMq1MZBha+4IFh9x4HI0m3NZbGqvxPiFqXC1/a+ag7pBRfk605rMSLQ?=
 =?us-ascii?Q?+jhInNs4pD8MYA/rHR4HyoGRfKEBvVuT3FNrmpipDOomsU1sPE7yGfmFUrMe?=
 =?us-ascii?Q?GaNMTDMEWjLMRQfQyrX1Fyhy8YEr1yaYcdl4/1DiX1VFmMLzknZKcRSxD6Ej?=
 =?us-ascii?Q?wveDc0C8lcBJtNRX5s5hnVYdCOgPwnvKe2vPhOTRGYXUsQj4PRCkkMyop0Mb?=
 =?us-ascii?Q?+t/zggJnI7ToSlCmsFb66OhSuLzc1MTH8SQLhPw24hZ1hiA77XnaiN+yNZGQ?=
 =?us-ascii?Q?3BGNVIP7lk/sv5pSXiUz2VIUeSc/tCyQGh/4vlCK1ACpDzcouf9nYQvIjIZq?=
 =?us-ascii?Q?hGNST7OTaM8vGIDEeOHUohuKmDr6G2CvjL4TABm4TfMQVnLsE94ljxML/86S?=
 =?us-ascii?Q?//M644ydo7+rcMt/bZjiU4JIm4Vg9t3HQXH65VvYTsvbWG34jXzAtlEID/ez?=
 =?us-ascii?Q?XScKr/KOdmOTi+sWkL0e3vaqU84p4K94Ur/ZhJmaO4uIlfAXamE2LwrI7shk?=
 =?us-ascii?Q?ksNXDy+Y1Hsv1XUs9dXVw7h/UTIQNY+9VgLcoRa2GZLX2iuWjT0p1jRJEkXr?=
 =?us-ascii?Q?pZgxzLfyT+f8gRRpsgpRYUjwsh4/8i4/t0iPM1g/vCq6fibsmN2YcxmqnX4N?=
 =?us-ascii?Q?DlG9ysh/lKyK9ftp7o54SOZSaoD669WRZH6xSdfknVuYfD5azclGuwz8JoD2?=
 =?us-ascii?Q?ZLq9Md4AfxNpl6j1BWEk35Yz5PE+pl/j1AxB5H2YD/sFLiYE/SbiQQLG+ra3?=
 =?us-ascii?Q?seC1nVEUKGtOhL938elE9DiWJnnOYHalDITRL2kS7Ee6p93NSPpUFZ8AgQYs?=
 =?us-ascii?Q?th958cX+wfACDbBXjZm9cWU9jPK62/aDY1H9grEPlloWmLUTWlHt7umUK636?=
 =?us-ascii?Q?5AlhNBK4edIBoY/nSPoxgIyFI4xX1IIhbjdp//5MgyducqP58lPA/A/REFeA?=
 =?us-ascii?Q?sXy4qGYh8A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f2881c-f098-4eae-1802-08de7e4a6371
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:49.5992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lqeCm5D8aNdkar0DBmHz2iQlMBX78hB+gv/vS4eJ/fR/jexhi8WjAv+DNg7cDu13iGuhkB6VGlaqgw2cxnciw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

Add the FSP (Firmware System Processor) falcon engine type that will
handle secure boot and Chain of Trust operations on Hopper and Blackwell
architectures.

The FSP falcon replaces SEC2's role in the boot sequence for these newer
architectures. This initial stub just defines the falcon type and its
base address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     |  1 +
 drivers/gpu/nova-core/falcon/fsp.rs | 30 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 7097a206ec3c..f515a4ff2f5f 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -33,6 +33,7 @@
     regs::macros::RegisterBase, //
 };
 
+pub(crate) mod fsp;
 pub(crate) mod gsp;
 mod hal;
 pub(crate) mod sec2;
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
new file mode 100644
index 000000000000..c5ba1c2412cd
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP (Firmware System Processor) falcon engine for Hopper/Blackwell GPUs.
+//!
+//! The FSP falcon handles secure boot and Chain of Trust operations
+//! on Hopper and Blackwell architectures, replacing SEC2's role.
+
+use crate::{
+    falcon::{
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs::macros::RegisterBase,
+};
+
+/// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
+pub(crate) struct Fsp(());
+
+impl RegisterBase<PFalconBase> for Fsp {
+    const BASE: usize = 0x8f2000;
+}
+
+impl RegisterBase<PFalcon2Base> for Fsp {
+    const BASE: usize = 0x8f3000;
+}
+
+impl FalconEngine for Fsp {
+    const ID: Self = Fsp(());
+}
-- 
2.53.0

