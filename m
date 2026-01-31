Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCED318B8D;
	Sat, 31 Jan 2026 00:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820979; cv=fail; b=NYIOYjtw73xyrHRQDRmYoIdreHW2q6G8tY05f2SvtNq884+GKN4pkIADacv5F25yXiXCFZRYXpJpvlxWlP+WcQkJJQJAMmVgOHRq2dowvCAOelasQeKv2bgWjXNWVKlD8OiZjbDV8uoM9c2ZbYmsYQIeJopKDsBRhJk+xnyYk6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820979; c=relaxed/simple;
	bh=Q62rljmSAldBV3x1s4P2zffKefBw+RvkZfJ8XUu7y4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R+eu3wxDFHOJy9PR/gPaiFc0FV0ZLkYogihTcfQ3nLvA83PftZk33kI0XQjziXkhJJImhkFUl5Jk+7Ry2G1Xin52Or+Bbk7WEaDfsI0nao99t5aWZflgvZ19Zs6At4aU64DURmOtWiSwrM1eqZYfyswKy89SeFOfW0VSQbW3jeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mr2QUrIs; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mr2QUrIs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhoIQIn2YwKrGwd5AN6EYkc6svTQVcxaxpXIwgi+iH299Ybxn4BWsProwwHfjA/lq2I2FjvrrzbUdSDDPl2UdMdHvMdpJa5ttQLKK5Cj4JZTm3Z2JpD5YBgTy/9cJigGPsAP0JRs5Rurc45tjTROOzr4FdJmW2xRru3FrOlcHCegSUF4t4jiOboL7JmxRr/V3icSwnK4Xxey7yWp8N8zQlxEipjYS97J90EyY96zxbTruTlRwg8nlcMH9vFbxjs7neY6i2QJmW/5Y48YxCKX5FDttjcbW+LGx2S7eB6+WTamdA+0MeQckmP1lGRBv/yxGGQJndi0qNvqy5+SIkXqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34QGMplQaBpN3TexAVcoU4hCCxy39soCjQJoRCA0OvQ=;
 b=Zx/dh29OnC8C6t0sANokqlj9yfDSH45SXdOD5cJRMud1o8o0+7B1zuM7pnm2ZO1XJ/RvItUHf8Sc9B81GNAIdqoQBF+UCicwf+DwFuIp/HI7tjd7d3P59S52MGMZzNWVl9ctUUKIgVtfHXsNXTohi8EgdRyIg3eKMTRUgoHyaw3VPd08PpMCnz/83fP0Y/Nh55wlxrIvzu3PTH7zN9g4/ZBGqHk/LFfVVPMmDWDMmpEwiou8XhY5NqcKvq40Y32Hj4DwUhMhGM7YFWy/UruqBtDrqoxNzl/r256ctHyeXf2pcv0URygUPDsWMp37CT2S4ZRablDAdv55jCzhG/s+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34QGMplQaBpN3TexAVcoU4hCCxy39soCjQJoRCA0OvQ=;
 b=mr2QUrIsO+qwaF8vkgEskMxMADT4uRibpDEYAHYDMxLJBxGJy8dCiqTjc6mMWVLb9shX0a1/hpOYCmVBeujsZyboLBQpAusNpohFkM2ZZDidAoS6saln8LMf6oFeSuJiG36lp/CbPl9i3TeNSzu6URoK4JzO47rlSbsn8GIuzLwvi3lgb5EzI7oZ54VI+QRej9x8+vueSVm1dD2JGYRLpnqLkXL/bNqoSbdnUzzotiPHcsdZaFXZMTb3LMfBgtKQKRYT5sNmK1QmFnDU3LghT8AiM6aNaJQlOULZ3aQ6ORPgxtfpgAORH0xCbb0wPrTDDdRL0i8jO89tictAH8nIoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:10 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
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
Subject: [PATCH v2 01/30] gpu: nova-core: print FB sizes, along with ranges
Date: Fri, 30 Jan 2026 16:55:35 -0800
Message-ID: <20260131005604.454172-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 88170e00-2b39-4398-c17f-08de6063865b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mxRFb5Xi9GrTLCBT7yXYT++M1+mhI1ozM3bK5rOaNdGSkZkF7kIIlZfP6PTb?=
 =?us-ascii?Q?hp5wqNv+XI8qESF0s4jJiL69KQXx77iy9aMFzRClTISZJ7fPeswFM71Ko5ok?=
 =?us-ascii?Q?OFQYZO3+Gqw4HE7kvwtTtdXsvoIYOyU+lfhxw3ndpVBp68W1EuyN8BGA7ydh?=
 =?us-ascii?Q?1SBZSAh/GNnz0MXddxo+0dmdUtNe5v7S4YoNORW7waLYD8Pxiz09ZWfiwgWS?=
 =?us-ascii?Q?lpbx8INfZ+ApPuCiOojvQGEJWa0AmytGpXyk78VqqOr8kFHs+YE5lpa42srb?=
 =?us-ascii?Q?AZCXCkypC/NdoUFe/yZxS1eXam9YmA9sofm/H6uJmj2TDE+z2RHvhGj05ABY?=
 =?us-ascii?Q?8sol26uXxMX8COYrMhm6Ly0ZHo1t0EH3t9bYN9pD8pVphGfgxQtxxchRaDac?=
 =?us-ascii?Q?ne8l0SZt0jDDhEtQyNa1hLAErk674YQWxgBiDonShuHLK0s4uK9ZxIm06glW?=
 =?us-ascii?Q?loEsUyhE+PllrSyMymfpnQGd3LjKnNv+ff8NCAMqr10pdC6fSbJQU9eT3+Mg?=
 =?us-ascii?Q?ytlPdIWQIVnlvxvLXvul+hCPHyJRGZK1NrsvhhLjoFr7Q+ldBA3VDZpDee+y?=
 =?us-ascii?Q?i/gdm2rnIx8m7f+9/ayHO1g2BTTv4uMxn30YEDe1d/rPwSdXW1cUtk4O4ha4?=
 =?us-ascii?Q?nDWCxt31agI6W15X5sIZqp6hPSF+adAltSdxiEipi7/HoiZUcZNzx5eJ5R8e?=
 =?us-ascii?Q?KNdXJ7KC0UKX3AfUAv9e7v4vMWGy2gAUnyPPfguxX7tpolIx+jPIZmGkV+E8?=
 =?us-ascii?Q?UNnYnUZpiHuefUsWVm4h2/n1jHbBcdIV/5qPomZY3OcZWcbDlVpfaIwxhYe6?=
 =?us-ascii?Q?QxzZX1zbWvmXMAffQbM9OjDcitpfAqptBXe1DjLREwCjsq7B69RttkjAE8GJ?=
 =?us-ascii?Q?/wVIHm+dv03JvHtRotYPhJMr9v8VqxENYNwZfyvv9dW9IDtXkjS+271L+G8E?=
 =?us-ascii?Q?MaVM4cKE82HmQplK9h0Q5GhgNuv+lUj//GD3H/Zrq33d3XGX6gRF6MU/IKIs?=
 =?us-ascii?Q?d6sqirGVyRG4LsHMLNB4da0f3+I6Jioo/LueObKNcnNoklp6q6LqMI3i/cjY?=
 =?us-ascii?Q?h9IpYnqpUDnA3kI8SZARr7H8JKU3Y9eYitIODgXSIyr7rSPuLMBNKIPCKuMP?=
 =?us-ascii?Q?LlEUqroT1V2w6MaDYy6c8acw6h6pHpecPeyJWhCPBZOzR3IfjydOpOE2yz2/?=
 =?us-ascii?Q?xyplUwjE/LArewGrjxcuyoREVIcxm3ElGzSjeegGmX9MmvnGJ86FRIUF6CKL?=
 =?us-ascii?Q?7Kr4k46Q9sH/ytVbpPQRPqpgvmhY7lWjdGaBd4U4d8ttl91ZggGHgH07AWcP?=
 =?us-ascii?Q?BlbLQd/X8zM6+5kmpyKDspSwj+esg0bE04JGH8ewb5E/jn5u2/zcYtGArb1Q?=
 =?us-ascii?Q?eh+JDfhTQ2vFFxzOPfMIdCK6TT9blYfRx2TznvsZoo7Wdl+vlm2Uw96oALal?=
 =?us-ascii?Q?it2kGqB8J37INjd3v8W7nz6l5luyeZONebrL1/HvrPRqF6q3nhsxIW3xUERr?=
 =?us-ascii?Q?li/+przrzdVd6XV7Y7dBf9Y0kSPBro0OrBWCM0PDJfNh3N78Cbj+cxi+KYOI?=
 =?us-ascii?Q?cqZPCFvlQXJrq8Lmxug=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wlw/EDEIF6W5fgWV2w/QsQrFCPvIMmytcECOWW6eaGIuhYPHmMt2aQXTf/cw?=
 =?us-ascii?Q?ggfGaiTNtXWTW3BGyrDE1xitwgP/hSej8hCgb8P1f8oMVL8Pd47XZM9VIAOV?=
 =?us-ascii?Q?8cgtD0/HSxYFoFhAXOgZTtR9sDPAXtm6nPsDPtTdhiRBlIf86wdg/fVnWQKM?=
 =?us-ascii?Q?ZDPSqVDzzD+gEwlOyhTnj5nxcgZXW924Ka8iAWL5I/yomhzpMlJloEfXX9GP?=
 =?us-ascii?Q?3IgHq7b6g5EjcvAQErzQH2zhslyXWqGeGFsMrRhirDnVX7NEBXJB2NjMcp5S?=
 =?us-ascii?Q?C7fXpZSfCRszXkoSwesVISGfoMalV/a11G9UxBrZVNxhg3R1FOx3xkudTZXF?=
 =?us-ascii?Q?cYGEYDD249hwVR12HKwwaUhHX5dzkz/U3w4Lbx2ziG3cuPI/C+l2XIKvQWhe?=
 =?us-ascii?Q?Qkbmr6NdmSNITGP4ct2I5TEwHFby2GfXKqHfOfaiEAnRmksKLfr/bKjmz22B?=
 =?us-ascii?Q?Puq26TWnrT6SRGbvo2ltz+ByKXZLpVzcCWROwKUtT+xll5+PewxyE0iFYvwI?=
 =?us-ascii?Q?T5M6/JBW0WvkCw3OiJTK4vcFR/6Z+Xfo6tEq8J9YmINmEWoAYSq1IfkA63PI?=
 =?us-ascii?Q?h1ZrRheuoodAVAtoVbXPs9YnnWEnG4AgK7bcpaWfbhm0BtK289KPrhVCKrHF?=
 =?us-ascii?Q?cqr+2ijCMvKwRBGK/U0AhXCECeMoBr1SGcr0cM5eP1kgh+DIIXLQnYparsCR?=
 =?us-ascii?Q?TDx89ExtnYsgPvXAggw/8rGBGGIi35i/NLjUXtIHh5O3WvCZ8QNJ1wE4dJ7v?=
 =?us-ascii?Q?Em7G3N/xxHjhaNZv2yXA/HvUmB0o8cBrGstHVvvO8XzV51yaAzjSjlad6IDJ?=
 =?us-ascii?Q?Xes4oYz8uEHrfp+yuZPgXilV8MvBeyTxKrx8sYxCCjyQm7p2euYsdnKNV5x+?=
 =?us-ascii?Q?xNWd+N2+Pk/5FzEhXRyMK6ED3vCX+PR48erdWkMKF8ZRai0TcYfpTsrHTwad?=
 =?us-ascii?Q?g6jtqWyQPq6ZaKMrcOWMJispFwzWPjVtRvdZR03Vky2iMAXpaK2KV/iNONlo?=
 =?us-ascii?Q?+niCaFEv7h8WyLx1vN0m7T5TFCjUFbyMxqKGjQdggGWCplKYeilBA3qowu9A?=
 =?us-ascii?Q?rF9Hd9GhI7iOIbbBgrB/VU8PEdLdw6RRSUrHyMT9CQVKokWBIGFdFgmN87nH?=
 =?us-ascii?Q?QNNBBinLL/y4K1ntBFqZ7TU8aSNR7LSWGZSCXja0hYed35Xq4SVoOXppoXs4?=
 =?us-ascii?Q?MHIIWnabD0C8vZm7qoNVAnIvsKSBCS3MiPBel99RMB3rDb/8CaU4JARenDOn?=
 =?us-ascii?Q?WKdz4scUtZyfgIxNcjmbHx868l6SdPXYnLVH3kDL8AxxB9ibc6HTMPOYU3bO?=
 =?us-ascii?Q?Ntc007teiMpsKgc7jNn5iuQpn16ZiFM6yMxtjf1lktuAuh0tpoFTpFrpFlhF?=
 =?us-ascii?Q?UnXs9cLCDXOqMtZUfKWeLnLHm4fcgV6R6hPM8smuvyCgzo2ZEFf9txcqxAac?=
 =?us-ascii?Q?Ni9iNXxKfUSr9OCKDRCHdXdS+VyFfq+IaFfn1ZGItG1QzEbY28ofz1bhvxtO?=
 =?us-ascii?Q?IglfGvjWsqDkbvdQNORh2KaZbUHwiHr2UgiPAu3/uD3gCyxmxqyNiVadKpWJ?=
 =?us-ascii?Q?ynan/fZpKKJogDpbGJn1zaPib1+T5DALHnAP2TIbG0KkMj0WWea+hrv5r2gc?=
 =?us-ascii?Q?dRtvg4OK0T8pVonmpKoTRuq7zI5pJxqo2kT8i4dM9KM76DZGO+IQZqC1+Xfl?=
 =?us-ascii?Q?PgUocckwdgnKJ4PPGfjjjPnIFBYEbmuDH30ZDCSkEuXlIgbB97NrDayQkLFJ?=
 =?us-ascii?Q?880I6/k1GQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88170e00-2b39-4398-c17f-08de6063865b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:10.6862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8o27NVEhySxaLMBFAVxKsIC6Yf1CM8ziCdlK5zpQQNhnqlhVwM5YfTNqw9cqDsPXFqA87wpw6qKeVyPWQQleg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

For convenience of the reader: now you can directly see the sizes of
each range. It is surprising just how much this helps.

Sample output (using an Ampere GA104):

NovaCore 0000:e1:00.0: FbLayout {
    fb: 0x0..0x3ff800000 (16376 MiB),
    vga_workspace: 0x3ff700000..0x3ff800000 (1 MiB),
    frts: 0x3ff600000..0x3ff700000 (1 MiB),
    boot: 0x3ff5fa000..0x3ff600000 (24 KiB),
    elf: 0x3fb960000..0x3ff5f9000 (60 MiB),
    wpr2_heap: 0x3f3900000..0x3fb900000 (128 MiB),
    wpr2: 0x3f3800000..0x3ff700000 (191 MiB),
    heap: 0x3f3700000..0x3f3800000 (1 MiB),
    vf_partition_count: 0x0,
    total_reserved_size: 0x1a00000,
}

Cc: Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs | 83 +++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index c62abcaed547..6fb804c118c6 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -1,9 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::ops::Range;
+use core::ops::{
+    Deref,
+    Range, //
+};
 
 use kernel::{
     device,
+    fmt,
     prelude::*,
     ptr::{
         Alignable,
@@ -94,26 +98,71 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+pub(crate) struct FbRange(Range<u64>);
+
+impl From<Range<u64>> for FbRange {
+    fn from(range: Range<u64>) -> Self {
+        Self(range)
+    }
+}
+
+impl Deref for FbRange {
+    type Target = Range<u64>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl fmt::Debug for FbRange {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // Use alternate format ({:#?}) to include size, compact format ({:?}) for just the range.
+        if f.alternate() {
+            let size = self.0.end - self.0.start;
+
+            if size < usize_as_u64(SZ_1M) {
+                let size_kib = size / usize_as_u64(SZ_1K);
+                f.write_fmt(fmt!(
+                    "{:#x}..{:#x} ({} KiB)",
+                    self.0.start,
+                    self.0.end,
+                    size_kib
+                ))
+            } else {
+                let size_mib = size / usize_as_u64(SZ_1M);
+                f.write_fmt(fmt!(
+                    "{:#x}..{:#x} ({} MiB)",
+                    self.0.start,
+                    self.0.end,
+                    size_mib
+                ))
+            }
+        } else {
+            f.write_fmt(fmt!("{:#x}..{:#x}", self.0.start, self.0.end))
+        }
+    }
+}
+
 /// Layout of the GPU framebuffer memory.
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
-    pub(crate) fb: Range<u64>,
+    pub(crate) fb: FbRange,
     /// VGA workspace, small area of reserved memory at the end of the framebuffer.
-    pub(crate) vga_workspace: Range<u64>,
+    pub(crate) vga_workspace: FbRange,
     /// FRTS range.
-    pub(crate) frts: Range<u64>,
+    pub(crate) frts: FbRange,
     /// Memory area containing the GSP bootloader image.
-    pub(crate) boot: Range<u64>,
+    pub(crate) boot: FbRange,
     /// Memory area containing the GSP firmware image.
-    pub(crate) elf: Range<u64>,
+    pub(crate) elf: FbRange,
     /// WPR2 heap.
-    pub(crate) wpr2_heap: Range<u64>,
+    pub(crate) wpr2_heap: FbRange,
     /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
-    pub(crate) wpr2: Range<u64>,
-    pub(crate) heap: Range<u64>,
+    pub(crate) wpr2: FbRange,
+    pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
 }
 
@@ -125,7 +174,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         let fb = {
             let fb_size = hal.vidmem_size(bar);
 
-            0..fb_size
+            FbRange(0..fb_size)
         };
 
         let vga_workspace = {
@@ -152,7 +201,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 }
             };
 
-            vga_base..fb.end
+            FbRange(vga_base..fb.end)
         };
 
         let frts = {
@@ -160,7 +209,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
-            frts_base..frts_base + FRTS_SIZE
+            FbRange(frts_base..frts_base + FRTS_SIZE)
         };
 
         let boot = {
@@ -168,7 +217,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let bootloader_size = u64::from_safe_cast(gsp_fw.bootloader.ucode.size());
             let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
 
-            bootloader_base..bootloader_base + bootloader_size
+            FbRange(bootloader_base..bootloader_base + bootloader_size)
         };
 
         let elf = {
@@ -176,7 +225,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let elf_size = u64::from_safe_cast(gsp_fw.size);
             let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
 
-            elf_addr..elf_addr + elf_size
+            FbRange(elf_addr..elf_addr + elf_size)
         };
 
         let wpr2_heap = {
@@ -185,7 +234,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
 
-            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+            FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
         };
 
         let wpr2 = {
@@ -193,13 +242,13 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let wpr2_addr = (wpr2_heap.start - u64::from_safe_cast(size_of::<gsp::GspFwWprMeta>()))
                 .align_down(WPR2_DOWN_ALIGN);
 
-            wpr2_addr..frts.end
+            FbRange(wpr2_addr..frts.end)
         };
 
         let heap = {
             const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
 
-            wpr2.start - HEAP_SIZE..wpr2.start
+            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
 
         Ok(Self {
-- 
2.52.0

