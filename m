Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012035.outbound.protection.outlook.com [40.93.195.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E3D39A7E6;
	Tue, 10 Mar 2026 02:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773109914; cv=fail; b=ENkHPqfAx/k0SlV+yDrZ8GHo8fEI7eEMCDECvTRB0fGZaqJ4pahzyWum68fB3rP0gJfnRDQJqt4Y2cd12ZVkkSUhkhsQTDobas/sWGlk/t/XXv0MUYUVEnigtwcOsSoqhm74RrB+7x3pHBHiYa4JqUZl1B3rxGUZrllOJIG13+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773109914; c=relaxed/simple;
	bh=X8FDbgUB/DE/li9pRqU3WL+8q9N0/BklxGMH/y1D0NA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tp/IeROGQfCZl62jADPtQWzheHk7toSZPDuNo86uBeq1dPyDYAnZ6jBjbBNDy26dJOWQzzw2uUeI/7T9Ni2/QWQc+QhCH5qO7XKos76Cs9+WT0qxGiX7kmSpRjrPaAmGXp6GeXTZfK3rJO3WxYyL4CoPlv5jrDqJYaGvJpfWOTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N2H3Lgji; arc=fail smtp.client-ip=40.93.195.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N2H3Lgji"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4rpI7uhPIiYW3i52bZs5RMZk+FvhJZVOAdEl6B/vMhdsl+n0rTP6H4QRCrjCqB+BWIiD8pMlLC2hKPUEWsBfsAxDAhmSBKFHX8dSQ4wtI8iShu+01je4unaOm6qPVAvL4hRvsNBcaIgoO/g2irWdF8r2LMmDO1utSp+Mj2KI7w4VC0lYlGbpu+IHBJ0e5sVxysnY3EV56PJl9kfrMMBraZIqeynWyCsxhjHRAnWbThcSzotdFTcKyngSSD4EopVe3O6VDMLybQtmnRNgm8vwwwzsEfxKqD+kTcfA1oq7Ac2FFXvaMQi4PniK+EmOgCr4C44veDD3EYJcFMFlgD36A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGrbTVD4hWmXFMy0ksrTgIQyTrjH2c3pELJht/hKJg4=;
 b=AjVtmx7i7fkYT6ZpraHPOEqK9jMLT50ulFGtAAKJoGvLCk9exwP3m9YmzsW+XCcpQkc0GgkMDqMjgBnBOfy5xbz7Z5j7iPwyFLJS5HdRu8bZwQK3ScODBy4FAivbGZguBJfSLbnNncxkgLwP59zAKUyeO4AUHX61BZw0jQiHAw6LVnq/UBovP2E3P0ojJmsaWmn0spU764SZF4ndcuDiWvab6E51FuNp4FaD+msr6MocEdgliT82Xnijm9L9SrxNJHTGBK6kh2xebniXki9V+KDYcFoOBjzb1HgvD+cTigtoDLNuRXlwMsgewZKqB3c2Xl/IBdWplYJ2GY9WOoikKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGrbTVD4hWmXFMy0ksrTgIQyTrjH2c3pELJht/hKJg4=;
 b=N2H3Lgji+xkpNpba5PisZkqJ6V+KrWXNp2MYZXumkc+pgs63Lir8++Mv2LLB4fFqmjo6AFWB30xSx0MSvKSHpgWHrjRTd4TXYE0vYWOOZFFTSPS8rZIX2RO9wtjFhcEKzbJmjVCMi0nu5Hkg/sRxIyHcm6m13wtnS4gMKhw0syBiV3EJmJ9344xKGlij9tJA65eegiUVwMGV5iegWetxN53BiGH1chrgTmYV+AJLicHsS5ame3yuCnnTilTI9pWxQ7HjnDzA3tDHduizRJZsXtdXXgVm1He4IMnm/BZeB6m80wUCayqYKr82ccd5NnZADQ7oAYftH9guKqpFy7eu2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB8142.namprd12.prod.outlook.com (2603:10b6:806:334::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:31:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:31:48 +0000
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
Subject: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
Date: Mon,  9 Mar 2026 19:31:44 -0700
Message-ID: <20260310023145.120037-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310023145.120037-1-jhubbard@nvidia.com>
References: <20260310023145.120037-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 1937fd50-c2e0-4b13-5959-08de7e4d2e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	jgs5O5POGMtUJNzwCAkssr2pGb4v4QiRMnI2ZEuvL47qPBOQNok6kAo7HfLEIukGnrXI1tqsD0xBUzGz8jbr9lxm6laHvHetgQsB/g/ZntJXS4X13XzYJU5G/sJrhQRU08PWaoOPqvFIe34XcNuA0lvsnp3LjWIS16OIP3XONJt/anoijuXqKnr7iwyVdxii0jwC+ENTToOr15XZBlsTnKRJSuamL3TgSUVBs5VDvUDGrT2JdhoZEBgKQZLZYAxXOgpfDyg/1mACkY3EaM/wDfolLTiK8GousjZ+5jCzhuBgAg/0ieS/1daaGXeo9Ghbnx8QnYB4EGgT9jUH/U6kmUj/VQr3P6S5dIM6Gc60cvZSSc29V0UrCm25R3M14IbV2d5RUFKs1RIWeDEBeAop24RRmzJLuNx7evYXokLZFcRBqcxsY6Mcb6ITuys1TA/uJlWKDgO81mLRbHF1TmFCFQ++acoOYduaIeKaYV4YqyQGmD3uxVcdsIuUCbmWQMHgWcW32g7ER+o9TXRWB1ckfYJ8mKPdmnXp4oUj0zHXHWOVt+81BsqRD3uNSel+4UgPYymKo3ZZynyCEDVUMHRY8XMpVSy6DYUcN7r3rq8vxTN0/0/q4RNVrGU7Jo3wkLGoGwRZWypUvfRXgJywr/7YM9vD+yGJ+8d4vcXEE+l4/E8lP/z7Q29eHCYkvgItEZdwIzPeFxhhhB/WtRs5A5WYsYt9xiW1pbFML+YYHWGbrrA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FlE6Kq7uWt2pkqKWEcja8YP03rg3oNdSyQj421aCCYFiel4EibnnJidqmNde?=
 =?us-ascii?Q?iriOD75C1o8pXrpW0BnixRDKQBmomtt/8h7dPgxfA0irgZhfXkOQj6g0FWVe?=
 =?us-ascii?Q?GKI0T8yHCTz1urkzs7twX6Tx9g2Olo8W4i6n3eQUzGEr5z4uwMhCYN9VriKK?=
 =?us-ascii?Q?rXzz0qXrnBT6/CjGj4EJyY/XjAEpNelvxE2S+jf0IuCK0LiOGOjN0WsSDoIY?=
 =?us-ascii?Q?aPVsRf9T+hECk4alFYrbKEvuc6uCLOqtH+ooBn4pq1284KnAgL/BMLnRoUEv?=
 =?us-ascii?Q?knVorywMx+WkATibDBJ5SyxTXU2ym451V+HJGcqoi1tGqTKyXlMku/NbCXxH?=
 =?us-ascii?Q?prP20HAFxkqDR/bGnF5onzRA+fdgOFdKZGdqIJV9O8+AZ0SMwH11760UBKzL?=
 =?us-ascii?Q?XWIrhuDwdkL5iq91BiJqdKHi4ZaK8o0gECWVfTnFPPVgVx1Zx+V9y0/z0Y3t?=
 =?us-ascii?Q?23cVmPZ9gJBqAc8jqB8jMtokU0/0TVWZ5x9W52ALt0EXy/3+txmlBcs7DUB/?=
 =?us-ascii?Q?bY2KuMNJNVkGWCc1a6AhexrvmFv/9LlKiBP+2JwGkw7f7mCXv0mf+lktFXq2?=
 =?us-ascii?Q?iZnV5B0Oa5jfBH1cFXzxx4YneO2wG1drkH7/XV7fNtV/iEwV3F0LRcZp4D1w?=
 =?us-ascii?Q?V+CSGCZwnrccbVN8Rq2zvgSpL1ooHp2H5T5n9SYNpZBDcpmxCEk0w5F0+hPu?=
 =?us-ascii?Q?agFlKGUxRiTMqPjzDjxQYgm1TILEKLaxEK3CO7EpXCkLcTz1ZTH38EFfo2yD?=
 =?us-ascii?Q?XD/Dgz7eI29xEXRin7yc/gS6tNlNN/WyqYwlXDXjpqwswud9K8bjSKtEl+WI?=
 =?us-ascii?Q?Wksku14sWcKl23g2Bj6kW8zDiUHNZIVGi+jEB+7HVor2xgrkUqdmzWAnVkjY?=
 =?us-ascii?Q?xbWDh0AOcVhBslN9DnwtV4InSFvSX3kVHBSSM1+a3gzR8PKFyHGDB9Bxhw+b?=
 =?us-ascii?Q?Z390cSjAqKZv30qMTuEhVuzcQ2TR05r+MVX6+JxFgarpmX2ctW+YUC/jFK4B?=
 =?us-ascii?Q?Hy7ryommYeuHBwHemQlc1Pal+S3dVutJcWn1V2VHk6sqOkyKJ21Mv92VEa6J?=
 =?us-ascii?Q?/TjHStPBVakHWIpz0Nt50GEjVcdVlUKB7NL7TYN4GFZBaPQlbgHLJ1RZfG3k?=
 =?us-ascii?Q?ERYQAf1DWl1Qxl8s5twCiGCNBXnt3d9AWdSXZDfaM1saDLh/WDM5ju9oGtRI?=
 =?us-ascii?Q?4EgOdfeRo/j9AwPYw4D71TO8ZSvyy1ZNkMYdGkQHVkZvu6fGXPGikgGgg58p?=
 =?us-ascii?Q?cP3xeFuO7cauvoyNRxSjCD/1IApV+S7jgPZa35dz0NgGPlo5zhMEwNCtyxrg?=
 =?us-ascii?Q?VrlhwK0zHdN3XvM9GPQiO4Gh6qfQVBy/aPCHTwBffBy9JDQuroT5/t7nnDUg?=
 =?us-ascii?Q?OgPAeB0nB3ZyGdLDERRn4hQpUh+oWJ+RvE+thrRX8DnQ6R3LrLTyqNHkHGgw?=
 =?us-ascii?Q?yygIXMrQ9JJF79DfNFYilVZt/a4PjhE61bMhR7tHIQ/eeE6FXt4k7I2gKwHM?=
 =?us-ascii?Q?/170nxfPwm/UxfFRUO63v/VK6634/ozLD+7yIPbzpZY6mCIynk4bQpZcytUY?=
 =?us-ascii?Q?33XjclOnigDBLKi2wR/hVTqFyLPpOKVqE1sVN9Dj0QzDe9j/724aQubyn+Hw?=
 =?us-ascii?Q?oyiqfSjSh7apaCu6YSRFUvy7DdyP54UPeby7H4bN13rVP78ut+RAjkXwGI4t?=
 =?us-ascii?Q?LLlaXxFnYIWZZs9cv9Lq5zijd75CQKE/ubcOWS2aTjXD/joM3nq4SMOKDJCa?=
 =?us-ascii?Q?jBjZj48Nkg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1937fd50-c2e0-4b13-5959-08de7e4d2e0a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:31:48.5122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqilz4TBcSawEZueoEvEAgxGCIfxVSlWuN0GcRWfrnn2unz/P1E6KrIf45ul85xmSgjbBmzJoMj9xSsXpW7JKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8142

Drivers that operate on 64-bit address spaces (GPU framebuffer layouts,
DMA regions, etc.) frequently need these size constants as a u64 type.
Today this requires repeated usize-to-u64 conversion calls like
usize_as_u64(SZ_1M) or u64::from_safe_cast(SZ_1M), which adds
boilerplate without any safety benefit.

Add u64-typed constants (SZ_1K_U64 through SZ_2G_U64) alongside the
existing usize constants. Every value fits in u64 (actually, within a
u32 for that matter), so the as-cast is always lossless.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/sizes.rs | 51 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
index 661e680d9330..a11c134be64e 100644
--- a/rust/kernel/sizes.rs
+++ b/rust/kernel/sizes.rs
@@ -48,3 +48,54 @@
 pub const SZ_1G: usize = bindings::SZ_1G as usize;
 /// 0x80000000
 pub const SZ_2G: usize = bindings::SZ_2G as usize;
+
+// `u64` variants of the size constants. These are the same values as the
+// `usize` constants above, but typed as `u64` to avoid repeated conversion
+// boilerplate in code that operates on 64-bit address spaces.
+//
+// CAST: every SZ_* value below fits in u64, so `as u64` is always lossless.
+
+/// [`SZ_1K`] as a [`u64`].
+pub const SZ_1K_U64: u64 = SZ_1K as u64;
+/// [`SZ_2K`] as a [`u64`].
+pub const SZ_2K_U64: u64 = SZ_2K as u64;
+/// [`SZ_4K`] as a [`u64`].
+pub const SZ_4K_U64: u64 = SZ_4K as u64;
+/// [`SZ_8K`] as a [`u64`].
+pub const SZ_8K_U64: u64 = SZ_8K as u64;
+/// [`SZ_16K`] as a [`u64`].
+pub const SZ_16K_U64: u64 = SZ_16K as u64;
+/// [`SZ_32K`] as a [`u64`].
+pub const SZ_32K_U64: u64 = SZ_32K as u64;
+/// [`SZ_64K`] as a [`u64`].
+pub const SZ_64K_U64: u64 = SZ_64K as u64;
+/// [`SZ_128K`] as a [`u64`].
+pub const SZ_128K_U64: u64 = SZ_128K as u64;
+/// [`SZ_256K`] as a [`u64`].
+pub const SZ_256K_U64: u64 = SZ_256K as u64;
+/// [`SZ_512K`] as a [`u64`].
+pub const SZ_512K_U64: u64 = SZ_512K as u64;
+/// [`SZ_1M`] as a [`u64`].
+pub const SZ_1M_U64: u64 = SZ_1M as u64;
+/// [`SZ_2M`] as a [`u64`].
+pub const SZ_2M_U64: u64 = SZ_2M as u64;
+/// [`SZ_4M`] as a [`u64`].
+pub const SZ_4M_U64: u64 = SZ_4M as u64;
+/// [`SZ_8M`] as a [`u64`].
+pub const SZ_8M_U64: u64 = SZ_8M as u64;
+/// [`SZ_16M`] as a [`u64`].
+pub const SZ_16M_U64: u64 = SZ_16M as u64;
+/// [`SZ_32M`] as a [`u64`].
+pub const SZ_32M_U64: u64 = SZ_32M as u64;
+/// [`SZ_64M`] as a [`u64`].
+pub const SZ_64M_U64: u64 = SZ_64M as u64;
+/// [`SZ_128M`] as a [`u64`].
+pub const SZ_128M_U64: u64 = SZ_128M as u64;
+/// [`SZ_256M`] as a [`u64`].
+pub const SZ_256M_U64: u64 = SZ_256M as u64;
+/// [`SZ_512M`] as a [`u64`].
+pub const SZ_512M_U64: u64 = SZ_512M as u64;
+/// [`SZ_1G`] as a [`u64`].
+pub const SZ_1G_U64: u64 = SZ_1G as u64;
+/// [`SZ_2G`] as a [`u64`].
+pub const SZ_2G_U64: u64 = SZ_2G as u64;
-- 
2.53.0

