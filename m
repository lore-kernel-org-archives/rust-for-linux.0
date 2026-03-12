Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010028.outbound.protection.outlook.com [40.93.198.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F3B1A681C;
	Thu, 12 Mar 2026 04:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773289181; cv=fail; b=Fk5HWM4L5xxoJLlM3X2WtLX5yrNzTiM72zTM9QA+oVbPbJzvx6HuNp6X9HtU0GzzqZ0yKdXMXQMncY6DJfX5LFwu1wiQdl1Ph2JTIpaevaajVeM0nMKLUmgHqhJXeLamA6/E5h//klUC7Cz8P1RTUehbXtUnZX3g/a2PdjYisGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773289181; c=relaxed/simple;
	bh=65Hmx1mDu2sVZEVui6civpSwRUJPCKNhK+fMwnA9nAw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ethJThfgBFDfQyC6VV40ql5DOng5VraRJTN8zXvZpK/1QwxK7uR8QE4yJHTjx53oX0DPRfSAc5nKP7C6U6kJ8ySZEIm0iePTzWkwRB8R/9c+L+HtxxotJBp7gNSlFksVVOSVede7xKWNzdB3IRVj7Do+vbz/f3CpLO0fdurAQ3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OegGbU6g; arc=fail smtp.client-ip=40.93.198.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OegGbU6g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXyIlUjPKnLSe6ZeIG293YuxmvJcU1NTPR0B+7fWUWzbzf72PbODuY2m/YVfOc2CYPvVJ4kWTunh+DhH65EycupPgbGCvURYn5t1+1sKg8WIYUk/qN99PXAr54yStv6u56qn+QFoW5UUU4vQ93NWsHpoieMTtJ/bOv983O6k5MFiXKKWbmqupGV6PbEdlOGNkeAc+lsfLNYNdrzoTxk5AhW0DchqzTjWpt93WQFGxTUovsk42cuakGKMus7Woa4U5pvwUVecsZw0iQyAhX31UkDQ8NQ6OmSBiUmbnSNOZfPqDt7rYZVpwUdhAz7ySeMggcA31D06o8Rzv8w70tPReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL/PGYjY6KtHNLN3xRrLvYKnV5xvMZ12WwN3fTjfsVc=;
 b=Ds58H5fHS41Z8uB9NloXUYFfMHmiie0/uyA3iUw69TH59vyqdQx7GZYt5v49Mp9CpxCVAvk46bJG2JYxEH0CFC7nILHBbvz2n+hxbgK/N7/CZpqF/NsXG+yw/5b6FXm4rAdNTpkKrybZGefgqbrDP17bLG85QcROesi2tH7q83QjvKcmGozZYcgNuEqrufnTpp+by6tlWVpr4Lm3ILS7+m59mRWzNVPqIfnJMNR3UwUudaoHGP5nD3jcAngsVKhdh5NuugSOJ8QBKpF4G4rvcuEp3aY/ajDkOkGj+9ZjwG0RGTYoC0kQDs7kYRb0Ul1CyBGUSeS3WOXXUZXsbi3SqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QL/PGYjY6KtHNLN3xRrLvYKnV5xvMZ12WwN3fTjfsVc=;
 b=OegGbU6gpPIkbm68vGY4NR2EIcJlIFrbJLPHP8bAnPw+8IYyrtKkbsU+qVihBYwEvRjm9/Wb05hn+F47/3CvwqEBZNw512YCKbbxF6hBaX5kd2LkWhJ7SJpy39d7PdLkAIbIAv7MjqjelKGG6xU63YiuRrCM+NQdgY3nbs+RatqaJNvXZYeHDsRVkx71KopQgUBo3pPJQz2N7CZQxhJwTba/oiuJzQ3FXAdSV5SqE/qpV7rJx7sv5sTN3D12266+a0SSoqayn+CYO8VnBuJqlP9XL3ik21UEKCHZ3levLAuqMpRiVKDAXiSDNTMfaISZIDfRPsqmrVZC8UrlpErMFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7409.namprd12.prod.outlook.com (2603:10b6:806:29c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 04:19:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 04:19:36 +0000
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
Subject: [PATCH v2 0/1] rust: cpufreq: suppress clippy::double_parens in Policy doctest
Date: Wed, 11 Mar 2026 21:19:33 -0700
Message-ID: <20260312041934.362840-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb579f0-5020-44b6-f21b-08de7fee91f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Hv9iQHp5FNBBidsOLeIC9WDFreJVz6hDODXZjE88CSBzjGfREGMlRUSgRK6YlclAhDzphR5arktDDqg6g+a/AAf3M4t5HqmIL4I/WNxAM0EWwZqv+eQHhQ73vn7QfpJmuznpnc9bOB17hFRlUrQk1dr+BIeB1ZB7NTiBORggbQhGf/yrjuIT/PNsiJo8ydpqe/G5rk6GZLYc0AD8MQp5F4Tpie7phDIatvxbUgDCJny2DclooQgtDKH6dIEeXOozN7HqFXrj8dWDsAvSCTVCdV0x4PUbaVYa2DV4ArUueXJlXlHPermj91ojFhTmOiS6QC6vxbM4109gjS8Vsqrq5MUDIH6k2NWWQnNNRmbfKzSPk4+GP+MqBZkU+Pk+gGkGT58QvM73uJoQzjrDmRRXFQH6JqkuCnxXEHYlBuBEPIqIBMhSek20LDZDzofhMkgItuf0oJETCzcT7zmGDEpG10OgLVhFNnf996fqzI4A/UMJ6kT6mZWKaD7gzPG5FmHYQkDvziwpEzMJYhTkkX4A4N/BLKQxuApVgaKgWSVosmBtGGHoSt8opYcI5ES4M4tNF6yrYcQEngrbfiNomhLu94nQizRBRCy0KI/XLBDxOwxDTw0ubZ1aR/x/uqI85SVgyNGhLkuulLslN2VsEy+zGZuX7Y/tOARV4iymbYoQutSvQyqQLSGiOeaYMgg9lRh2Kf17xKH8U2hfFFljmhFJdLRmK+L7Ktn4SwBalvs2aCslBp7PYYutRUOzSKicXXe3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pVRX+UCvWMb6rBKrKQOR2Ap5kgHBYLR0rPMsr5KIq2nCxKiDZpCW7cA/0Mf6?=
 =?us-ascii?Q?xzt0Rr0MkqH+gWUhFJKzsXhDhOzNKKb86V7JWdYPfP/25CO7sL+uTiIPwfmq?=
 =?us-ascii?Q?U9x2nuNyhIkcdMp3PW3kzWEoKUVH3DbqcjLvHaECJxGNL6+ZvW+cLQq4VF6l?=
 =?us-ascii?Q?9E8Cq7j6zH5s+5Ojrza8V+6/E3K+4pgElo6FLvGcVzjs2w7rA9lRvextFHR4?=
 =?us-ascii?Q?YW8Dangt5yx8xZ2lcgolrZv+ab5Wl3PdeEO4GNSssuTZb9BwODhz3s7n3ZWm?=
 =?us-ascii?Q?VkRxlNqZK+ckZAgZherLJkXRnDkASVyV9lQ2vSJx1v7UJjFM3HsrRWuJl0t9?=
 =?us-ascii?Q?6yoG2p1PMBy6ZS4toM82w26aBuBvOSMEUaVX/xYsPdeg3xL8FBw7J9PSszS4?=
 =?us-ascii?Q?g5l0V8qt+KeS9NKY++g4tnY26FWqgqkCwfyHhfGJMmmBCnAZAXGpeGrIsHPh?=
 =?us-ascii?Q?llfgifWu7UkUya9mwxTwpS9B91plvvJQHtmPHR+CSKzBAnSjHoMPTh//nTwH?=
 =?us-ascii?Q?1qTLb4+cubIh1iHs8R3fIXHzlyZXr/oK0Ms8EhtPEN+2RAUNrdJEb71JiPU3?=
 =?us-ascii?Q?OgWOAHC2lWWC8MfovqcqKFF/VfvIG2Q38XSjtSb+MJXUBiUtHuCraih7v6ov?=
 =?us-ascii?Q?qpfrpAHWpvRbnQcJGh4igyR+0veTUivzj0my13qv8X4jPjB/y1oPdlpR0Mp/?=
 =?us-ascii?Q?hJoumiptZTfCSDQKO2R1qu0Wr5ORcBpfoeNEsyh/VMSzS0YTlh/ujNFOo2Co?=
 =?us-ascii?Q?dSR3Cv8JJgIAh6aUXSnlH0iz1IZpKzdy/AFFAu5F8f0cVUHCJtcJQ3IRqg13?=
 =?us-ascii?Q?p35avrpmdg/swxMwuzXjZJ3AnfxiHYJoeraUDYtX08bwre+3zocXHTnNJ1VC?=
 =?us-ascii?Q?uh+OXgBCR86sMq0ZvPg5Dp3fJbvLnv/GCgguuXxUyedHjdMg0ISu+KYZSM+8?=
 =?us-ascii?Q?+LOn5LXWARzWtUScBPoTXX1zYp4mIbKfjp8inM0s5Vf6q3pXhIFW9tlQOiOZ?=
 =?us-ascii?Q?89/D4g0TjFT7aJ6mkVqMJt+NrTzs9/5ca6htKV7qNlmmHB9JhaOtVMGkgMRP?=
 =?us-ascii?Q?0jbIDoJEYHEpN/loV3fyCuq2iqwxPeZWQXBKO/vZLZBz9MbikiDZuakNv89T?=
 =?us-ascii?Q?kmD+xahjJqZMIut+2H+A3VHhKzr9MmgsQSNy15eJA9surGP4uBNS/QgrVPvs?=
 =?us-ascii?Q?NRaaucW8XqLmOrP6ZjTVL7pcdmW0LzfnjBPu5zBrNN49Vw7F6eZRGqcZSogR?=
 =?us-ascii?Q?wfDbmmJUv2GcZnWMJkM8L/HWMcq5O7uoo379krYJkLiRH8uafTBRKFuvoDU8?=
 =?us-ascii?Q?fZekA/Sx2uQukEnJB75oszhRTa5oUqCid1TTtZjF6isWeffw72ErEjaUFklf?=
 =?us-ascii?Q?DpNErvck63MVmO0D8e5HJ6UIS6LDHTdwOxAelN8Jald1iEMW8GTn+8u6o3bC?=
 =?us-ascii?Q?4cJGq1qK5yn6FMx+qTSZYjf9RlwXxNaAqrd0eXagMGs7erp5660RopuDXxHu?=
 =?us-ascii?Q?SsZm8vgY/TnZ/daFZygF+x2F2kxGnrNkY5XiDFPorSij51nDvg1iVutCODzk?=
 =?us-ascii?Q?DYaHRdp3o3/FNA1MlBNoguQc/xLLuwrKe/9IeUamgas88WmmB/Wg1GERg/as?=
 =?us-ascii?Q?TiGZ83KJcCu1/dURBo4Bz74ZzavB+UzlBxDLUaHw0IaLKLFgBTOvygFU59Sn?=
 =?us-ascii?Q?bPXRKyoV1+OWYcQu1JmM1+50rPP3/4CXO8pDbhm+Z+tFFX2Vh709g8tDveB2?=
 =?us-ascii?Q?mX0N54l9nQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb579f0-5020-44b6-f21b-08de7fee91f7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 04:19:36.2386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FPX82BsQQTANwlh5urw0zJid+jHNxEQHVl+7W/1Cy+a8HmeqQMgtMlL83KB4HF0MgRMz8AVzbVLIc6ujcKdFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7409

The kernel fmt! proc macro wraps each format argument as &(arg).
Passing a tuple like (a, b) produces &((a, b)) after expansion,
which Clippy flags as double_parens. This is a false positive,
fixed in Clippy 1.92 (rust-lang/rust-clippy#15939), but the
minimum toolchain (1.78) still triggers it.

Add a local #[allow] with a reason attribute on the affected
doctest function so it can be removed once the minimum toolchain
moves past 1.92.

Changes in v2:
* Drop the v1 approach of splitting format arguments.

* Drop the rustdoc_test_gen.rs blanket suppress (was posted
  inline during discussion, never sent as a formal patch).

* Instead, add a local #[allow(clippy::double_parens)] with a
  reason attribute on the specific doctest, per Gary and Miguel's
  suggestions.

v1 is here:
    https://lore.kernel.org/20260304195330.185829-1-jhubbard@nvidia.com

John Hubbard (1):
  rust: cpufreq: suppress clippy::double_parens in Policy doctest

 rust/kernel/cpufreq.rs | 1 +
 1 file changed, 1 insertion(+)


base-commit: 80234b5ab240f52fa45d201e899e207b9265ef91
-- 
2.53.0

