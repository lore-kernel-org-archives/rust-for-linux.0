Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021703033D2;
	Tue, 10 Feb 2026 02:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691599; cv=fail; b=daMyxuKiRvNBB0h8ZeYJUNqod1uSCDYnDjzvGxqrX6N3a2wweN+ga6FbsdMv09h245Xzs2yGMt01v7vmRCrBD/e7h0RCPhh0P2FidK8reUeIQjZEDfw93kku+CQrIS4Kg60GC3D3yosE5NYuAbomjFsr8bIKQw30NzLuOAJpsY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691599; c=relaxed/simple;
	bh=Njh9lay5dlRS6HGyNjy4wI2cEcQCn73v0RmX0of3NGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZcDOllx0eoiHGxx4No2whhABUmJBjhNpXp9YSXTDE0+V0g4DK0eKjGzq3qWUmt4pxbcqB1sEy/aNpFjY1dD3qRZ7nO7dBssvi07+eVtJeNZjFKH/j6Jy7tmSOupoxe9RtidQEo3Pxj7Y0TAuMxwJcmpqicMhsjCKe2eHUmnqSqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cgO9WBkV; arc=fail smtp.client-ip=52.101.85.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cgO9WBkV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehzxlA+YybOJ4tugGXXI8nFxgx5fHA+K8ZyLg3VzUOaRptzv42ik+WCL5smH2et3D2C7XHKfF6lqb5boBVPU0DQI6MmzFWzJRO4r3JSw8zFT28AC8dbQoLOLkneD3AmtV/lcQMwfrqYmxoll4QOfEnWWJcnVwbPHYONxfUlV1Xk5i8bLc9gZRdKxVpi5llWqI1Zx09jz6HRn3bykn6QXtPydbUyUoawiYuFimrYtlWBVEtYMR02x7OGovoXrNePflDl4xd02/Fm3c0pvNuk5BBJeJkkACpMNK1iB5aMLVtU0oano+qpFRsKGPccHh5nks/OhKC/irn3sNyNo4pAsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAndklGJsZHVwLvALvBM3npq1jW7283gIK+d7Kv6r2c=;
 b=jpRdiwkSrn2Vr3+waUMd57OdYIc0XuWoCiCkwMmXwcd09lrWuUSd/Ph9uPvH1vAFKBGrkhBW7sO3BQ9o9YgQ7hptU71l8arNAxIafbvrvWF0w1hjquNAWrhxV2VKFnPKOq68gc9IA0+/s/zuu9vB57gus57VAUJ6XRxCR+WQ5jfZDuaRhhEUGPcP0bABXhZgXbsXLE77c+Wb2H7guGW4QWErTu0L6dh7/dvPN8dSbNOpO9nY4MIogQcuoN48nBQNY6eSOvanfqIHSK3gKmZecxzMSGZ60X3IHQvBQnnGdUbTaTnYwOWdLU8VHfpbTzQxxR6pdO/PSI4vumHGBPuvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAndklGJsZHVwLvALvBM3npq1jW7283gIK+d7Kv6r2c=;
 b=cgO9WBkVlW20JJ113E0/C0Z52R3BXXjodnbv+Ft9V8OUs88ByEvxqCeORFu3/H6uFdNIgDyRbN+TmG5EmF3g7DASlU2Qvrc1bATpJUmE9Z05l137CaU8UjmlAIgHM4Yi91GNTR40HPBtdj8LpudSd4hs31FWk4OXEDm9CRRMPfLS/xPpJnvfL+5AI7edBpJP1gVYOFjqZ2X5mq+T+q+KY+nuqAAVnSpEofx5vjnCFVp1JImDC134MYK8pbq32t7NMW6fgzNDlgZ0/C4wYD34Pg4Rd1Rpfx2BNuYoI+xWqdQXBlSCVUB4XiCR5Gf7M/jCVP3LHxou/sd4ESQfujnl/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:21 +0000
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
Subject: [PATCH v4 15/33] gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support of FSP
Date: Mon,  9 Feb 2026 18:45:42 -0800
Message-ID: <20260210024601.593248-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::44) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1585d7-d3c6-426e-fa52-08de684e92ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?At+x2A6Gm59tto4J0btjlLhsUQFrljuz4il9lpVHWO3LNvzjqEdw4/HF5Zn6?=
 =?us-ascii?Q?DsKZdmjBFaHYvGUO1puRo2rny0bDA1GmhAQQ78gfpucDGFm+vnnpLU1fKH0F?=
 =?us-ascii?Q?Wesx0BMOjGiQq+NZZsOhACW49muV1cJ/BGK+cLMrPVaAbkOponvpQXE65IAU?=
 =?us-ascii?Q?+5esxVcQxTN1WLp4GHgXVj92oTl2qlBHhgp+cFHt3nbgZ9wXt8QnQ4cIb4RM?=
 =?us-ascii?Q?Kvb6dnZ6hwc9s5lbJ84wuvUqqEg1dHkpL9vr7LYch+S6OGRoPNBYBj2kO84P?=
 =?us-ascii?Q?5hDOfInrUINy0E9XExzdgHTV2DrlXsqaoNXA+HAKQxkRJwfsQ7vpfFLxKNzJ?=
 =?us-ascii?Q?cER75j0f9WlmWWmJC0lvtN+fYViSemHf3s7NsfpqFppo8TYPTGTgM2g48TAv?=
 =?us-ascii?Q?rJtw4U+Pw6C4YihO4ZMdUL9XlJGaxtRV9giRcegXO7UrGidgXTWBmqIX5QSU?=
 =?us-ascii?Q?Cp2ltqluMmdprdMvjiQpAgv3k3VrwR7iwzivGKa0tKK/j2Tv/oMN2ZgpNhus?=
 =?us-ascii?Q?/6HxS22j1ZMOA3BYF0128+AoMvAnFU0vVWlQZDvlC0ONX4FMyMn91HyhspDf?=
 =?us-ascii?Q?1Md3P37EWxjZh6zjNiCob+9OwGpgfkHY2PFB1uNuuHA/xxOv/mvKUEp1Bhqw?=
 =?us-ascii?Q?18UyL2mffnPuqaEYGh9RH3x/EfMkGoR0L4c9hd70qSyzVZWMpezs5FdjrvKU?=
 =?us-ascii?Q?4LtrXBZ3bP3Jcpod9xW4him68mtt6TG+djNVfXnTyJlYal2hWaq0zwoCLQEK?=
 =?us-ascii?Q?g89fEeyucU5Mnx2wJXY1QToBNNAc/psvZ8hWNJhPKte0cVkSZbkfxyuPQ764?=
 =?us-ascii?Q?id9vgsQIIf/5UQJBxLMisYbr65UBRsIN6oo7+PbNxJ8/jvrYVhzeTfMJV84N?=
 =?us-ascii?Q?71Y2vW1+D2YPPnffzFkoRYfyh8UfFpDEK78WNoZWIyfm5l/xRHAb82fie0yn?=
 =?us-ascii?Q?hdmCJY2Xc1KTAm3hLXsHtoCt9TLTpohz6t71DS0vOKAwWVZz2610xo5o8ba6?=
 =?us-ascii?Q?PeH/BQ9DvM2PTOGlW0nTHsiDmW5W8aLw0823a9ebhuosRzUUUuTnNDJ9NgQ+?=
 =?us-ascii?Q?RcL/G0exFKCZwmsaSuJdgHNFMKYltzCyQECv3y7DUosshnXz2KDrwP79ZWFy?=
 =?us-ascii?Q?JwJ292az0QSNg93HEwlgPxSpkSrpJ+LKOKqnpBFVHqTaTaGVTECLSLPLqC14?=
 =?us-ascii?Q?a8I7+gmKwY04oxSIzmQdufb6db+UV3n+yt3ICMlbHvbXjmiHK8Wvls3FAqxu?=
 =?us-ascii?Q?zNxjtEJxDSkFaNRiWeTt/WP532V4kj8qIqNaZYyPBtnXhQzmpdY5bb4f8LVi?=
 =?us-ascii?Q?889XbdOoI/EmLgCjnY84f1gHimRcwIjGy5/niudJapVayNcR9TTaT6RS6U2P?=
 =?us-ascii?Q?jzR1tTPUIvur1saE3vMLqfP40P3smlj9g9mrFXal2SF62NZRpclTJECXi52n?=
 =?us-ascii?Q?6SnNFvApTSiBsykHH1E7+285FSYzlbRiSfuLGe3C5nWmYwi7Ez+WVXZiVr6U?=
 =?us-ascii?Q?erzdEYOa8XAOTGe7J22SsDrS6U3uCo+1HUwUjujmYPLEEDTqn1CzYBPKVGj3?=
 =?us-ascii?Q?NWmUIYTrKOOk3oUbAxk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+8NncUk3AAhJVEWl8/O+nfax6y+ndvIYzfFtn26xqlf7likUWS8eMlenF1ox?=
 =?us-ascii?Q?fF8peHP8cX7f2pHJoxp1Cw0zI3MEBn/WVy3VK8A+GjePmU/Kqx0QVNVJv/tl?=
 =?us-ascii?Q?4CLR9saGvKW13W4f4Q4Leb+0ZhW6u+7oNIeufozx2I5llbJCDev+IotVDd3c?=
 =?us-ascii?Q?OgPMJxO7sQCCCyTBjjRZ5rHXdy0kv6Ssg2NeBuce7HhYURiB8a4wqKHSF4iX?=
 =?us-ascii?Q?+5/bHOdXyPTIAOK6GUFwDESEH1PLyk/tGcxPAFfbt1gn31WyQAD8H1Pbute9?=
 =?us-ascii?Q?FkBquhw80O1aGc+6uAq4VVrdRRZG5zLDnRhzNs84c6qs6vjg5CtqL/CyJMM5?=
 =?us-ascii?Q?V5k1PxpuHz+rsH3NrzXnoiH5tHBzmtXfpQePAszJskHTEvU8ZyDddIZ2gqNb?=
 =?us-ascii?Q?9LZop5TpCTRgmWMjqbR6n0jAXdgtKmY9ywHdX6dIz7DSZsn4WVo65z2RYpUn?=
 =?us-ascii?Q?wtGBYWzuel7dK8cmk3TS56eKovnahcrD482S6n0IzUXCemFYPIx4XjA5qTQl?=
 =?us-ascii?Q?baeZwmO9n8mVIGo3vbpUYIwGjcTP6pD168EOXxBERqEtkEnsym6VbywPzBzh?=
 =?us-ascii?Q?YDtYU4Iwh/xR5zrPxwaBlccQUzhXc02lVSKOJFYChUtZ6f6YdrYLglAwrLxN?=
 =?us-ascii?Q?6u/0kDWFyYDfw0+1H9M92ZhiimEgMZiVheRwn82A/aLA+SbyB0qF47Wv/DyY?=
 =?us-ascii?Q?8XGOkDubcDYO0q9GJ+j/XobODJR04m69442Vc1f8uqO085wv+LaQpEdBd7dN?=
 =?us-ascii?Q?hLWw6/2yd0LD/ADDxcHFZwfR5ihH7SG5XdKIuq12Nq+e8RV8hTN17d6lnHNp?=
 =?us-ascii?Q?WLhCXQz4VTApqehWbd+KCDwcl9z/ZEW/ExhKxsY5IRcHeqsDSzZpTOCN85VY?=
 =?us-ascii?Q?JtHorPH+TQckB554NhA8fKcDferkRRpj7F4gNOh+9FQx3WenKJBiKFk/zY7p?=
 =?us-ascii?Q?cOlD146Wb7DfhxciSskPLq69PWbjnKVp1HQAGAaDowQacI3eqyoaELCln47B?=
 =?us-ascii?Q?X5UqLyI7S/xEYHa6aeLmkTLrE2VcQW4peRIQoHzR6q+fMesGNe9mc/NOv3NR?=
 =?us-ascii?Q?ZW9JSK9R4HaJW6EV998gFRdMTkvWqRwq/7bk37kOlfzSEa1Mme/m0MtHAsmY?=
 =?us-ascii?Q?z3I1O6UGJuRHTdw0s6IsUkL+1vCK/miNpRWAJdEvU2xwfUtjDleJiqcKubNh?=
 =?us-ascii?Q?eoqKXTYrInUgTQUuJM0iQJw+BZTMyM7PaevVYSHDJyh4R08xonRm7cJyn549?=
 =?us-ascii?Q?ZtNYrHfmg/0sPjYxIeKiebZK9w50gZELyNiMuAuRSP4YdaY7NeGXEGA9x4rH?=
 =?us-ascii?Q?BGhg5vL8rXscuEOPKzNXxuM4btrKA5qkjqB/UOJEa1WpZE1zOhZ3R4YrCpKm?=
 =?us-ascii?Q?b9ei5zNxrkij37Vvy7Z/GjFKWj4JvB6Uair5AccTM2rF3+K3XZpeOgrWICr4?=
 =?us-ascii?Q?Ck5ou1iHiJi9H7RIvM6HzVc3BCthZ1t18ZiHjM62lvEDgaLKAPNHziVy3K8f?=
 =?us-ascii?Q?NM1K9K6YdWM+qPakW0DUAA0dZ6yren7RYcrKf7yKXc6JS21fFCSQTKGbptAv?=
 =?us-ascii?Q?hpM5nVyDNxi7QV5t7SdE0Or0Nns85Z6O49NO8+RVkmdKmol0qab1X8TC56tA?=
 =?us-ascii?Q?R4FlfPHPHZT+q2teTEMWNptVvpT1fUbxf4xVF0l1uFCCArYNUZQ9pZ+NR33B?=
 =?us-ascii?Q?wKtL7WkQZnh6h4gwQgpynQ1BmPwaDXwh1bJGGf8uowCZUfphdkapptBq95K4?=
 =?us-ascii?Q?vqlO2S8u4Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1585d7-d3c6-426e-fa52-08de684e92ee
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:21.6389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qV/akNI9Ecf3U8VU8k+o6yNz3RzHje3IJCaLAyLFuegHW2JTSe+qAMIGguLHt5w2I+eH/8UsRpswmBv/ZqBB/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

FSP is a hardware unit that runs FMC firmware.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  1 +
 drivers/gpu/nova-core/firmware/fsp.rs | 44 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 43a4e70aeedc..9a9b969aaf79 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -28,6 +28,7 @@
 };
 
 pub(crate) mod booter;
+pub(crate) mod fsp;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
 pub(crate) mod riscv;
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
new file mode 100644
index 000000000000..80401b964488
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP is a hardware unit that runs FMC firmware.
+
+use kernel::{
+    device,
+    prelude::*, //
+};
+
+use crate::{
+    dma::DmaObject,
+    firmware::elf,
+    gpu::Chipset, //
+};
+
+#[expect(unused)]
+pub(crate) struct FspFirmware {
+    /// FMC firmware image data (only the .image section)
+    fmc_image: DmaObject,
+    /// Full FMC ELF data (for signature extraction)
+    fmc_full: DmaObject,
+}
+
+impl FspFirmware {
+    #[expect(unused)]
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Self> {
+        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
+
+        // FSP expects only the .image section, not the entire ELF file
+        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
+            dev_err!(dev, "FMC ELF file missing 'image' section\n");
+            EINVAL
+        })?;
+
+        Ok(Self {
+            fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
+            fmc_full: DmaObject::from_data(dev, fw.data())?,
+        })
+    }
+}
-- 
2.53.0

