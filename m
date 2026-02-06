Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890033858A;
	Fri,  6 Feb 2026 04:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351698; cv=fail; b=E6LQqMJ3WLrtHmFCsvicuLVUEyRCS2s70dtyzlsVSfgxPmmRF7yUtYWRp26mcaTWLknFEonpZM1j49fRvoOb/skOOfJlYkxHTUO3P/C8cFWDob/KKZHOneuHAvIV+dE1kMOJcz20kX5dPoYZs3bw7sZ9mX5qD1fZIKTN9WcFero=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351698; c=relaxed/simple;
	bh=aapzhsbZC1IXA+5MOa42AKcuMFwmqW/Fsr6wuDnyonA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HKpbXd6074LXJOOzmiErKosD1enDUMUnMYhpc1Y2XyaqdJo5IKKXkcSd3D4PeRiRa3A79oYunGn7Pw+p/B8dI2Gxbp0I2gNJ/mfi8UgnBE1k5TPMh9PFAIO5vpsDvcOyKB5hQIZpUhGkxzxSafzhJzVG6clPAJUBRL67OXsm77E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DO6gG4dW; arc=fail smtp.client-ip=52.101.61.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DO6gG4dW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SX+O1LKnIH1CJchczEiWg+MNzF0EZITp4iuYF1OkGAtHkC57zxuS7zNw+dsbqFg8zyM5ojoOs8FPMX1WwRE84M55TAOq8W0FiVD2STKePNrx8JEwZzIW80S3EKHxlJb6p1tiUdtnQiDBZKuIArz+NG0r/2C2cZU6SwoLgMJUTI4R+0lHslrIsMJglOZm35TRDxJ0wbzxsE4f5gFz/Qwx+iKWEIM8yG5/f9TmONyamASYhZFXFu4RYF8tJmBvRih/BhWl0tQtanfRhyi01QN5s90CFZtd0NDKuDcFiVdSXX9HlrunQf9pgXwDuBBEh2awTMNZkTpYbz/DJ7Xn9smLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcDBKQ0DeM6Z8BsfCW4cH5KdWADfJDFN/n7GVOaRSAM=;
 b=bwISWB1Bvo38MIKBS3H21dPFTDAH9MJ6cBAdvRMifW1ZoSSrFe5Wk/P47DZ1YpSBsBaHTWEP6YZTh6VAYLT6L5rbWfhw6w2J01PKxISTcE8epiGI1F4rH/Mp7hoMzrUcAX7SZ6IuoSei2cduk8bwiYxCCddsqWe5zui+ab/99jmhM0EuDEcseUBPuFgfWhvejYXu2eZcANmPUnKFUDt+fdYdm9vAFNqRVmAy/bzNhYpKhEEv6NV8stBbPBplkcnVw46DuuEFEf1cT1LCf4ETrfxjhQJYksULgEDY/PP/+J7DyYhNU0UgZfkx0yZzp4MS14TgCG0NA6/Iq1uckYSwSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcDBKQ0DeM6Z8BsfCW4cH5KdWADfJDFN/n7GVOaRSAM=;
 b=DO6gG4dW1BuSLjZMxTD0Y+zV1mkdoV/MXzCvKiMMMfFEWrHJm/48JhhRXylBfNHsywrKXXBfsz1cR0REl2kx+e+avY2yMPDLbRY/qjeseG8pjEficyXcwpBKQXX9LhieNaZAhKyfcHuw2AyPaMMFfsUHeS3NJFi16xCa95rEw03wcM56k3ir698gcT9Is9TcmOzIKCGez2m9ktm/Z3NktNaEEAZAkRV1ewzUckGlbkWN7OGcw/DMdwFXL2E8JEjkrpCRurPSkQCJKJ1RTg7SKSsH2in9u2VqmEivjtt9NTK9RtkDOs4P52fK6zQDxBpxHJ1+aRhJLbkzOwZQl1Gsrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:34 +0000
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
Subject: [PATCH v3 06/30] gpu: nova-core: apply the one "use" item per line policy to commands.rs
Date: Thu,  5 Feb 2026 20:20:59 -0800
Message-ID: <20260206042123.303281-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: e19be70f-76b5-4561-3889-08de6537366e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EryMSt6pj/xRyKOVXfx961uDkwt6v78fJbMqjjBCkARoBIThgDXcwTIrHLrg?=
 =?us-ascii?Q?a1Yqmpf579Wet1s5K4FXi0WAKt+ufdFKac0uqbdV+S3T+quWCODKrkKsfuSY?=
 =?us-ascii?Q?rXmcyuUq2Eqdpp5wgAYAFr2M3X+QBVLIzr9MC9/WfaUAlhGX0g180vNiNCvM?=
 =?us-ascii?Q?fQi5DtpObaDVedqsEogWl4i+1MZ6l5RVntTArEDS0CkKMb73dCVL23QiWC/n?=
 =?us-ascii?Q?QiQaC/qmQYksad3rvb/Lycde+dxqFVJfbSmRolMJfi/99IiXKaebXGsGDMC0?=
 =?us-ascii?Q?qpUjCJOFNlYsxObfMsmP0n5PbQ3vZNoN0he+DoqTUO/OZFzANbIprZ4lYk7w?=
 =?us-ascii?Q?BcEtHJ+EP83ptUoqsv8Vtdcn2E118Edunb9vM8hJB5+sWbm7pMHe4o4auqPt?=
 =?us-ascii?Q?JgsqscA00LyQQam/MMILRAe65b/58D2GD3rltAMcx2IrcAz/sOAJVqZjUhF4?=
 =?us-ascii?Q?TycFwQihdgZGnlWwWDv4Py9sr2oz0SCGJ3khCaa7PZyR6TyDBbhBB+3oFGYj?=
 =?us-ascii?Q?qcZr3aPAWPv76KpT2vye2lFIauZvSzITiblx+HWVDKd4d6oNmraz8pj0nw2b?=
 =?us-ascii?Q?cyWEiqezKKSLL4ARS2vvC6waO+Lw0SRnSAbrWp/wyNaMMQSQ1FVHhm7qwh6j?=
 =?us-ascii?Q?OWhTzbAeWqGv24uvHolFinBwqR5AL1HyBcMVeMyKoKBMrU9Zh59yEc07sA3s?=
 =?us-ascii?Q?TfgnxlDezeBEgRUjf/TlCPFDyfr1TC2nEwtPb99KpswTkcfIQH88ns/97a90?=
 =?us-ascii?Q?5rf1v3ROYsW3d0U5TtLOEkw48FIHSeBI7SVOrFkCW54U1JgsTTuFARv7w8cK?=
 =?us-ascii?Q?pYg6VgvSBSnHlAFJY8WDb4qmxhlpXDdTgtI1k/9ewdGj3d7opc3dG66GDNlA?=
 =?us-ascii?Q?N126WvRN0JMFRA9xCMVsYte7xJo7+n7ZDGPz3nOT2o0JEte51rr1iPo5D5Kv?=
 =?us-ascii?Q?ZLfWDWBoEFHi5J5XJSa/GXaCvS7GO/Uam6RND4tXc88vHoXVkks9dCBkqrYG?=
 =?us-ascii?Q?QJLC5RvsfiWc2eT9kRYZ8Ivuc5rDXa7ATyY94zu4W4eTtVowN9EvANyDX/lS?=
 =?us-ascii?Q?sdUY09LgVZ7Gim+uYzMmmgtHyFpbSvYZnkZQ+lCZN4n0YAZZdb0Pkxo3bS6M?=
 =?us-ascii?Q?dxcW/DheeuNs7hJnafv0DDgucdAadvqJONLUEyjb7UiYs6vLYF4qDUAfeEx0?=
 =?us-ascii?Q?vdUwJNwiVtOTHQHgeELABOge1fW0tLbC3Yx9RMO1x66pvwAQgZBPZnVEjiIO?=
 =?us-ascii?Q?B4tKT6BE3ar1DFYDLlhMG6yHMMQaO4A0ImvSlugP83JJA9cpRw8C/u6lpUMr?=
 =?us-ascii?Q?yswAeFAtNurCZGDtHT/ZU1+Rw9BSPt2MdXuvROTWVn680fhuoa7u5nR+qBcg?=
 =?us-ascii?Q?yIU9/4EARwooPbQvp85BdDxSqS1Ky0x6FrPNcV38/RWM8kdHFa5MQgkcE8t5?=
 =?us-ascii?Q?9qtWTcv0iAuJwOin7Hmr8K5QcblEHYg7Q+OnE1vDkCJuRcdCr8UiYP25cq/8?=
 =?us-ascii?Q?tXc4aBjSnbwAKtvC0Rr/1BH6M/DSFtSkc4dHne0BFcrigbOdQAkkCjIsb4BO?=
 =?us-ascii?Q?G4LuqV5xNswnlsy1gNs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?19CNBVgHi1o3QNNVJ7ifODk8fJcwgtvY0X9AgoOViFGbPqP3AAQQ3P5R4Kny?=
 =?us-ascii?Q?cgjqZ0xeKY5wgfdoQsyoiRWB9DitaCRwpdorSq9mCC2qhxyySi/Rxwo54PHa?=
 =?us-ascii?Q?zUgXenaddESF4v3ZhgbP6LAXe4pB3u7HJECYI693P5rhprVPm9pWfLwJi96L?=
 =?us-ascii?Q?2oEKnvFNmVIl9D6uwpcYlWbG/DSs+Q8UCMLRrkEn2qS2XueJCucbR0sRL1mW?=
 =?us-ascii?Q?CI8FoZnAcHnc4JdNPQh3EQelxEt6a7qjW3bV5laeiWHPIfg/j3ni0tOJmWlU?=
 =?us-ascii?Q?NEd/SaDwLwF4ErtglzC58Ko7NSVoHBmWo7k59B1xTDjK8ZsboI6/uq1cnclu?=
 =?us-ascii?Q?j2pALq7tJs3uqA+VPL9pw+CQ3eOoZxMo4txoJUnCQLSRwBHCPN7JYwQCJgyZ?=
 =?us-ascii?Q?FhxvP136Jcj4E4px9yCBigfuegB94G58wbvV7b0/P0XjUiOCCCV0WLKiDv5L?=
 =?us-ascii?Q?jmDQEh0MrA7Euo28UGVioYIbStJqwk9PRl7ndfJujWY2Wsljcxxtl64ErEX2?=
 =?us-ascii?Q?pwUz7ZwLwydTAsjx+LM1IwqLYiefAlVVOcjsK+hAebvhrGPILWoPL5hd8lfY?=
 =?us-ascii?Q?zq49OBsusm4ofi++ia1tPRyt3QpNgoXsJ/NFLU+N95G2GdkSs9kzhiVWv3Kp?=
 =?us-ascii?Q?8BYpXnFoAjUqZsTh40NQ4DyYvGYiMt7HlDSYN4V1Ig+/0iZN7v0+C+D79uyL?=
 =?us-ascii?Q?IM6cSZTHGexw8g3nToM61SIu/DpB2LvAM2MT345xjiS1V5XaXLCB5KTWM3tW?=
 =?us-ascii?Q?MYCXqxULp1jnd6xnN5XnBA2hrmy7dtnIczljosS92y4WTIxCsP29EXsAdpTt?=
 =?us-ascii?Q?Wn7YZKMqrG1wPK6wd7/6m9OX2oOYskxEbSn8zc/ZDPvUzLvs4p8Pfiab8z1X?=
 =?us-ascii?Q?K7XdRkxyS0wMUk1s/QkRxUGNmiAeLNyKcx1kJI+GL+bpSsdXh8R7CJeq06Lp?=
 =?us-ascii?Q?4M5uSE3haFUtdOccfb8J2S+Gw5euBoVcpXKOUDPFl51lFW+s4IgqPNO/Skcx?=
 =?us-ascii?Q?4tjPkfExp629Cv06/jNkCeFRmdeR8yQK9phuRh/bj4s36rIH8cB0XRxYVPel?=
 =?us-ascii?Q?zOikccj0EutgFrEdY8X7StT06m4TYzn76h2eEZOuJG/CBWjZvhwhJuVcd+T+?=
 =?us-ascii?Q?uLQjd57S1JHh/meWGCAeAxbkMNx14MWBYLoOFRg9Ke4nTLIrbf8ikk5FRjp2?=
 =?us-ascii?Q?lOVJvh6WRRsP0/QIo7JQ7A8Hda0xGk1HD6cneclHHW9On/KRCSBiiEqg5VBd?=
 =?us-ascii?Q?Bz85SUv+jsZnsEeWBrI+aUBqPFhV0x/KhS7FddQNP9qRPwGYwl5ruKy7eygP?=
 =?us-ascii?Q?+2rIitlHCBjZfz2SIjUmXz+ksfMreAq31ZgFVzmR1NVEjkA4uH0dp9C5cS/z?=
 =?us-ascii?Q?pIdWlpL/fp+UM55KTq5+/97qiadTa8QhRF3odKGskNgI3cP1XCKm+TX5edQ1?=
 =?us-ascii?Q?i43aU6H4ya5C3P0dspBemQAX4zDdniuclwYwsSkhCB1Wl2j8g3OyR9EVeoNP?=
 =?us-ascii?Q?LuO2vazoWAleP5gEaRblUbQ3xBBALFyPsctumRdExjvluUrvm2VCH3RpJCCC?=
 =?us-ascii?Q?LafOvo/e+twWs/u5eLoHIjc1muIWinXRWaBdN3Ltw+v8e5z5/auU2aUIUTGr?=
 =?us-ascii?Q?iU/M1pUlDEOBGJuBmsTr0AYryMFDV9wCfQ5CfrDC1iWiGBFZX67O3UdLxKBy?=
 =?us-ascii?Q?dtwnH9vs80ZZBndI6MUnHpJ/Kwn3rsk0K9OmExHhWvUilBdfPcTs2P4enSbH?=
 =?us-ascii?Q?c0RIg9lNrA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19be70f-76b5-4561-3889-08de6537366e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:34.5636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81BSA36b22BpLzoaBBhHgz3qy/aHB2UvvkBoUfcb9f5/CPs6xLYHFEBKAyKC+g0pxh+Ikb80uoDrh+HoXrHL3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

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
index 21be44199693..470d8edb62ff 100644
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

