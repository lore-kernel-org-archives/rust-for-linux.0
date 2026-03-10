Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1698533506D;
	Tue, 10 Mar 2026 02:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108711; cv=fail; b=bda69pQ5HQvx8eYqB1uN/rTW31FzgmGmUoy+KQ/yl0N5OaebEGMCckfLb0BhLANZ/PsHsO+aGqbAZsQzX9axwNHAkY+VKL4KhJDaiAzsKWh4rssk84fiBdxRJKWK4tQpvKsx1UZCYfGbd9knyT7HqXN6Q4gdeeiVvvZU/y4Znxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108711; c=relaxed/simple;
	bh=1/6PNZIElFJjgeZ2YL8013YCsbWgLuGRbyqeK4dEXg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MrVbi6lvCoQHJNVJ8BdgBINIEdnryFIY3n7miCL4HXoB3FFJQEJ5i18zs028d5nbNsi/1HxEqhm4PnL1PJr4R+NcjPnGF2qnsL1n1YkSWvAXrcqlWIAD8NKGJtU/NGiUknvhtDh/BQNRppceTwXbbRR4WWXu/5B3hMx/iq3qZQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o/vGtGGI; arc=fail smtp.client-ip=40.107.209.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o/vGtGGI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXVKR0VFkywpmHEmM6cXwS8yjBCcUsaW199/34UAi8suQhIrKZYEUTVdbmk1As9pzY07jA2iNNbarUnsaF3EBukGP3LDvwEcuvodh24wTpE7OOpYeB8k/cQDYq3YMZPaHRebbYfTCWoK0ixYPMUnclAFPhNy46rIQSeLfVYPr+ADtf8FDNOkI2Da7fjQnXVPnfJ9J1g/0Gijk07yv7rz3TllBhRBoI+tqZPngnmlCw7VL8jM7U+EuUJg5b3mcehRO2Qkw1J1kHBfmocKAPpAVFjMKoBvfq7jmAYzDG53jUqrgIDr3U9bd/7rDUiVoIP8YklQjnDCqqCTQd0NSOO12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALA0H6lU50xsRGnS6NkCCfIWlXs5aQ21IivVJdgWOnM=;
 b=NidkB0NN91k7IxVxncjGpQJSy/9JNNBtscrk3uMsr6xoE6xoee70bPM9ZNxQLm+2VRc/dmbbfJA4RAJsPyhh5CiHNcN2MH4Pi5A/nZNB6gzFcEzgMP4Qm5qACpGqnxrnQEd66MuviKCxq5Hx5svI80W/zibS2DcoPL52hFHZd+r8zRDS0YE20thEkU8UQlQ/Gxo9Zwxzm2vq0yx6QG3t7mFsyd3/5yIG4QnPPsRER1eeKchaP3UrvYv51amm01/YGzCH4StqggpnAsp3U5HMJyDP5ItyNj9sGYyPnhGkVvt5H8ya/W407lVIOT/LueNhqqjL9EbrDm8mXvoFzKhK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALA0H6lU50xsRGnS6NkCCfIWlXs5aQ21IivVJdgWOnM=;
 b=o/vGtGGIsuvohnH3nAsVBS0xj3GfBTjYpXPa+5zRMQDxBxeA9g0OQCmNWPryEJ5M8WgIxFH0ra5xnoNz+ktMDXmOwv3BrLO3caC+8lqKRsQFlFDDvG3sSBgHQlpf4QsF4SUFhgYGMrHWTT8b3MwE7yRKhpNR8qrlv5nzGBn8GjH8EMPztfKfGAYOn6N+TVH3JhHckBwbbnphxaV+38ZE4SsLGdS8oII/4jTO4r1y8seSwfLA/1Ue5pFklqB36PDrPindC9Mu1ooMKLd66Le/sVK6g2oA5J7TpM8ErR6743ILj7g+HoKsMWJTQzc7Ca4YhIHWA3BSPXzMqJ7aCcJXOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:36 +0000
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
Subject: [PATCH v6 06/34] gpu: nova-core: apply the one "use" item per line policy to commands.rs
Date: Mon,  9 Mar 2026 19:10:56 -0700
Message-ID: <20260310021125.117855-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:180::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 2542d8f0-ca1e-40a0-ee81-08de7e4a5bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	tx0ynDaaDDAwwq2HRy1/Ui78DYV44G06CqzX6VxY1hLYG33q98lg0+Pvcul93tURWXumz55gMHEZnV5ZFeuFPeqVyhOcvhvaIvQqDhnE9N7QZFpmKkbVCOnR8xpOJvRzzI1Hz/XaVwnfPeORdPE2FCaYl+M3eVsS6wYT4XPJKnA75iWcpvwp9yzt4J2xDnaThyPoLNL8DoFcQmzD12QC9g3XJUStMO1TDiuMKdp0WgNgJlHM88ZIXl6sNPj33iIqdlZZ+deHMA6G9N69cvhAlZfuKvTQaHiX2mMTwRlgVG1NK7l97jdlIrMmuB5Xq993Kr5wx3ichYLt8neS18lQsET0lJoo915MJSJzWz7iOoQQQAfYrwB6MqD6VGp0v0vlWoXA0zofJG9kpj97aj5GqBnBRWr1dy0fay3bp9+yAYhPuRktnK9MOJYWUCkOqruURhGjo1hZTny5+1smRt0vS95bMgsQgbdVhenCD8veOpgubKPDXVUv0cJEevCU/vFfJNSIg89gHYL/+mpB/Ktf0AaLQrL/YTZK1aLHcD7RKTQn5nItGtf4WSsztDEto4lEfYH95GHJ+mVUPVnWgIQd2V43TLa037OQk9febcNA190MoAMocUSmIBhqL3hkz0jxW9KV5ekBMCCp5mHrBYBZF4RHE7oh77Of/CIS9rVAuxydP1jmycnON4zHMjHpTC4BIs6hppI25RkRhkfEDlT1TMzNni2eEJOq/7BIXLt/ZBo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ou4gUaVaPMAwvttuv75Md/OSfhLJyEMdSRYMJFkbUyskdo8N1wXHdLpIAC/I?=
 =?us-ascii?Q?QjkWEt/ZbV0z+bBzpnqMp0G8itqpq74LINxdwp9WUojO80Kcw4m9eELJmaXh?=
 =?us-ascii?Q?PSr1amMyaGw6TnlyuXok/iNc63oyJPYThZrB5q8P9lq9Me9Jnd8EGm1cLxWV?=
 =?us-ascii?Q?5lQBV9g30KWOKiFKZRMJGNcBmfEOw4ajo/iiI9MVCQGhutLNSZyOHppgTC6J?=
 =?us-ascii?Q?ViTRUr3N3SyxAjs4e0OPXtwtzhq5dgLDfc8nrYKsiGtVl3eoJgPsP6P8wti7?=
 =?us-ascii?Q?fhBt9wkcjbxeKmdT9XJ3/8VPcU+MeunqPKbDuniSU3QkaxbFvcHsCuuvjApp?=
 =?us-ascii?Q?ZnRiKwf+XcYPEfNBnzQ/3h4Knimp7RnOZWMmsxZf9bskkcQqU1sT5KezhE/3?=
 =?us-ascii?Q?ZZs31/jKdtNJ06wfd3XRI+e/AWML1X4Ddj7U+A5NKR07UmEwCfTOrYi5UWqJ?=
 =?us-ascii?Q?2IHB33auFoL0/+JxGaLDepDUz4j4bxVvMWuJ4mGybJwtKCK6sqeslllNotnJ?=
 =?us-ascii?Q?6DgcLFXpbR7/6YG+1f5mXShcSoJRHq/wcmkw3gpT0MyHaFeYG07htDjDHsMp?=
 =?us-ascii?Q?0apZ8t/Vkl7HfD+M39tGp6wzjj2DV8KW2bPSiWTj1SNxlcm5qGAAmhsEgByu?=
 =?us-ascii?Q?fY2hDynp1OZfGDj7TuVyVUKK+EKMyRiYEUJPD9wthJ0unWvkTK8vz2Q3Re+D?=
 =?us-ascii?Q?ytjnafKcdRxATu5tE7hSoL1kyVs0Qgg6Y15FrkWqS5XfpJAnLIMZmUwbRFKE?=
 =?us-ascii?Q?s5mPAPN71IL4PU5zwe1nu9p2mcoNjmh3FFkW4ZRZ1pwVt0rRhC8PqIrmY/sk?=
 =?us-ascii?Q?FgQWQr0uoM3GUclrHQpV/zXv8jafnQZRmO8aUphvOcdz75Q7ZM8BsnTuJ3OI?=
 =?us-ascii?Q?ARKn68exPmRFJjBSF6ltXaC3tIkwdeCX0yC/NREVr/1P02ycWFAA1Q3ldCbk?=
 =?us-ascii?Q?ktZ1euCOWWq9VyyTQWmLtr+hAwbJTPUWeLSfQzk5Wlrl1Bit1ZBBamVsWlk/?=
 =?us-ascii?Q?rUmPvvbetHccCDFFQ44aNY/QhIdQ/PCDgqjIko94saMSCfYjJt1KpqfTFfp8?=
 =?us-ascii?Q?MmAhi+zlHtBvTXDc5eCwT/XlF1Bos7WA6d2k/d/KeTD+6SlqJ5EEX7BSdY+C?=
 =?us-ascii?Q?Dyjeab5wMW+T5YKcSU1pFDO8DeUTJU9V8+e7RryQktfeIRhJHpxYLl5eTn4/?=
 =?us-ascii?Q?1R+wA6ylTedC2bunYQt8pZ+vSBCjBNFbIJvP42BLcHvwwmlCkYjiVlQh9XHG?=
 =?us-ascii?Q?7a/nfFo0SSoOiQWGcri9cdW9rCZLGjmKecT8Y594jYe+D48TawVEerqBNo3B?=
 =?us-ascii?Q?pGAcvpTOsEpn73GfCB6Ld4a9s1SCaR+saNHQiUtz+IrlpoiZHqC5J5RKLq/Q?=
 =?us-ascii?Q?VHH3psZo7iwPa3r82Z397zOoTgpNc+olZ04Q4+Xp4RD39hpW1NbGPI2lFje1?=
 =?us-ascii?Q?sneNt16rF/S517wsYSElrw6JD81uxuv7M0uyOn5vF4ImoqPcGkgmHD4zfQuj?=
 =?us-ascii?Q?5wJgZVNcvKlsM96xpgANrJhaGaO6i4t/DasFfZ7XX5st4ptmncoxByLQhBw0?=
 =?us-ascii?Q?NxG2wISW1zy3vI68JN5riHzXFvKBmIZsOMoBjdRleAfAOKx2grGTq99L9MFN?=
 =?us-ascii?Q?ISAEzqFlUTEuSwVcOwNrgcn429eTDaYYiccblG0YPNBRlO20wh3hpqPBfRNs?=
 =?us-ascii?Q?KR/fL0Wyfntlceg1YuEQpr5G2Ol7hYiM2oaGB1a24jr1cUW9qTf0HTvnhILp?=
 =?us-ascii?Q?MmNjIigOzw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2542d8f0-ca1e-40a0-ee81-08de7e4a5bbd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:36.7067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibTdCm7o37rONhEzbzsuSfuMrqJKb4P+l55gGPg3e/bWdjAfirQDmMlfhJiqZ6NF14zgO3KdqiGdk9Eoged4tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

As per [1], we need one "use" item per line, in order to reduce merge
conflicts. Furthermore, we need a trailing ", //" in order to tell
rustfmt(1) to leave it alone.

This does that for commands.rs, which is the only file in nova-core that
has any remaining instances of the old style.

[1] https://docs.kernel.org/rust/coding-guidelines.html#imports

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 67f44421fcc3..db46276430be 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -1,8 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
-use kernel::transmute::{AsBytes, FromBytes};
-use kernel::{device, pci};
+use kernel::{
+    device,
+    pci,
+    prelude::*,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    }, //
+};
 
 use crate::gsp::GSP_PAGE_SIZE;
 
-- 
2.53.0

