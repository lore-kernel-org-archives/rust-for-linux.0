Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011051.outbound.protection.outlook.com [40.93.194.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E07F175A6C;
	Tue, 18 Aug 2026 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062989; cv=fail; b=LkJf7FU4eG2f9KQA/JxyRm1B9/rRuWe9US8l6E/zvESemE04w1kQBMDxq96bRYzHZn+SrD279q9Gb5w1LhnGOVdDcA+8/UToWoDtrbw3R7xqmHFs5zmyva3IlgXLj+kbz/E88fMS6kX3lh7wbA5s1gK3bMzUMMjzZkF/Bw0qJTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062989; c=relaxed/simple;
	bh=W1QNRIMSLZTm1B9B+RWKCBEIztGL8mwo7s5gbqpLbEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qrEFPki4YHFgiq/OM6fbr0SQgz3u6BtmqdV3bd5JC4eshjKnCpp4XmDzSIKvBe8S5uUGJlCYvAF/EYHcUJ/CNZGYwVPtSODTXAUy/7RtwUuOlXCIk3BWZJadZaGLS3ZjZhN//8pC5mGDnbEPsisBTbHHcsW70pMitVimZoHszJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OLKV5HEB; arc=fail smtp.client-ip=40.93.194.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OLKV5HEB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhgDYW/7t1PxvVrjv2vge2fBS1eS1cUgwNe8/HwNCe4K6sYhjc+TSjxT6XblABnDw994NVfAmlKxJjkHeb5sryOiCRg8OeEyaJLYPkSSVnBFnJo5L7s98eUVcx699DKBZ2mQYJjp5Ay4MF0pNwVGE10hjsU5I7V28O9BlYIqwVq34F5l38QdXLvqb8QML5iMJI7XnzpjF4l4DbFJmyOSI55DnEKTZpKP3UZOWYXHngxj1zWrRbvZ3kMPM8xH9S3DSh/7puermq4EsX0hXOCfSey+DLx+ePR1hfRhbS1V1K3hiQ7QX8CAaA36DVrdoSgtjyrGwwk8rw1cXgmmKFAFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1QNRIMSLZTm1B9B+RWKCBEIztGL8mwo7s5gbqpLbEA=;
 b=gX5v877/7IO0/NiyWqIVaCwDUtwQJkJikAgz2OVhqGGIe3q2OZJqIL/5bbYqkipV9gXm7DspG5Ds7i8oewOcG75QdflhDZocVdN/bEoslSSiySFy6c2Rd/A3FN8kCdLLE+5oqTEYUCAvacktbRqB363eq6PVvtlAgKuU7f2OKQTsKNTxPo6BYKKRtwCkEW4ELbOiYFbbA3kTcKu8JlhOw51yzZh4hcW4oROkN1iwK5UFskthyICcY+was0lI4gddttVOk30zf4J4lB7uQqQ1SGSFPlgMt0CP3P/IqLsY0bRF2lMnzpcuQxfnKfrStwC60KVgCCZIUri8GLxm3dEjog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1QNRIMSLZTm1B9B+RWKCBEIztGL8mwo7s5gbqpLbEA=;
 b=OLKV5HEBEdpEfRQ6TQ0e5fmmfAlEXtXb2+SB/Q+VX5nI4SBUS7CZK3QoQqJ9NrTdp7WyRvRv7hWDwIfMx2bJwd1PYzCbe+/CMZYD/0+wX8q5734BpeqQZlr0nl42EMCiC1L6SA84A75gg1TTMirG3SJ1XIKEGaWq3M/TtvUl0JSI2cezzG/dtR1JHk+V53RPrSdDe/vVYmE0V5TgBwPjujPiDqSTLqCXrxcxipMDm8v4UixoyxjvinChkXL2leOOEbVp64Id32RF0Jp2Rbi4bNa6uqIJoVfcaVLb/ktJmu0Vd6LYVFTphBRxXxopEwFtSovGQ2xJs0hYx47wFOcWGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB6066.namprd12.prod.outlook.com (2603:10b6:208:3ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:23:01 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 14:23:01 +0000
Date: Tue, 18 Aug 2026 11:23:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mark Brown <broonie@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Benno Lossin <lossin@kernel.org>, linux-next@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Subject: Re: [PATCH -next] rust: fwctl: replace `__pinned_init` with
 `raw_try_init`
Message-ID: <20260818142300.GE5432@nvidia.com>
References: <20260818105350.361218-1-ojeda@kernel.org>
 <20260818125558.GB5432@nvidia.com>
 <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net>
 <20260818132022.GC5432@nvidia.com>
 <0e0c9ee9-ce44-49cf-b5c5-3764f260f1b5@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e0c9ee9-ce44-49cf-b5c5-3764f260f1b5@sirena.org.uk>
X-ClientProxiedBy: BLAPR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:208:32a::10) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: 678c1db2-af7b-448f-62b7-08defd3435d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Y2KXIP1PbNq0Nv3ysUJv8tzA+ZNH8ng5VSik3RsgKOxKACSoAX/W0vvov4HEEkCVLoeiSlVr/HCoTzauA4GOZN2d+gYTDU6UX26sLAWuuMt2nNXr0GaOeM4YbN6b3d7OQlJeUKEYYxd4eawWQ0nakfh9Jk0IuCHsVY5OkMmPfxCkbZcqDbdw3/wAYA26FDiSAY/VP16fUoO8iaNekEs3irt86VQwJb1/T5tTlYtHula46uaoPcY5BkoEVxJqaM1xcsN4+YueHWeggt7wLQ08R+ARLiq7n6sHbRmmLjRdOFbK00ndSeiRaRXdSLy+ZZyRWZoksDqvU9BsFl6T2afnzq76uip1kcochDEIx/zyZAJ6aX15FsniX2pnPBe//rbLbcJnqGB4bL4bSm8PYezbjrMVP5RGKQtv4mpWS6xdzk1PKXu43fgviQ4metctsssLX0y5eV9OLsA1u1D56Zz1+kDxysV36AWgRqPrpwXjzZrqUcWeRktWNYFQL5CnBuSx8HIuj2LFDT55W7Z7Un/pAib1/55Z/oc83wrp8zii0Bi/fCQGiLOwyYsMjidDQnKQLk4Cdi7tA1xcAfQl2cxl/8Y4Z5mPGopd/7r1kccqv6CXp0l8CHznSdY1iJ5ec9ARfx9psQWYG1e1LVFQmEK8HA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K7ISZUBiLrig3qekNFyVdnOC4YNV0nSnKj+Ti6I0UqsRWNwGOVC0Q+0OYuqL?=
 =?us-ascii?Q?g2whSJWdUYMZ98D3SxsYhf7MvgwQVrwq6VR7HpwMSC1etX8X8e8JrwffI+Dq?=
 =?us-ascii?Q?fkSl0cnJEY99RAMGvQFtnwlqgNRY9gaQcDNAGsm/bsSmM9b+VOlUSQo73p4v?=
 =?us-ascii?Q?JjVdu/rAuLlE0UED2DU/ilyhfUMk4qREGMoFKvnsVaPacx2G7kYnSW5iTywe?=
 =?us-ascii?Q?WFKFXelwPLVml8NB3/I96x+fh3aX7jcxJwW8HpWhBUwajKuE1golaiKeZcX7?=
 =?us-ascii?Q?Zb5iy/uTWZZURHKwN6tw/sQSvT0e6Gg+MvgjqCeybCN71UZY21v4ig7QNlZq?=
 =?us-ascii?Q?Sw4n46iSjuTWWBlDRC0XUCxeq4ASNzrXqsakKeQT79u/7Z57lBsNj4LjTRio?=
 =?us-ascii?Q?H3yHsea9yjkB/zTJdELrEzVk84O4UBc8afD5BVFiC1VzEHrFCM8MZn0GxFRN?=
 =?us-ascii?Q?aymh0kOwLNpptk8XPVaNH6jBxfsKS7X8lJzmjW/ZDt/zIJcwrXV4r9ptETqy?=
 =?us-ascii?Q?0nRalODC2YGFQflhPKYJlqQmfIxY4R5OEPv/Sftxq9Owi0Ey/RJCBME2tQWF?=
 =?us-ascii?Q?nIAAq7WaJzDZA/5DL/v6jZ4UgPcz+Wfy4+Nvf8NSZqVyjN1NYoEYuLM/AiAd?=
 =?us-ascii?Q?5ZxYHNDrvdKVQKn74beCEWDcBJe04vVTuGe0sxlruHJldXvYFY4GALZzSZui?=
 =?us-ascii?Q?zqe/nv9m/vnWFQxpYMMre73F9m37nM892hb0XyXhj9ljyQG+oDl21yfPfUgW?=
 =?us-ascii?Q?J9U/1+YTWXN/kFMFryLWpe7fGMjk+CV+C0b/D03ESMgobZCUJRVvzp/aITSC?=
 =?us-ascii?Q?IElGNG49GeKSJPjQ+f4vxhq+mlIHCv6yqiB+Qi1sZPzCjuhENZtPZz2wxNFa?=
 =?us-ascii?Q?Lj7yyGPupQ0g24qDYZRAXgx1PI3AEuJjwpiDqpfydhuV6QDEFRNvTfhsHBD3?=
 =?us-ascii?Q?sMq/z/RYBLdlUMj4cMTma/D9TZ6p5Ad+hJUYq/XAVaTzYiA4/CTYwgjTcwH6?=
 =?us-ascii?Q?vojISrvL/gBF8VWAOfqFivm8SNSSvC9QfbjDQ1a3LWCruFaDp19pKQSm22W/?=
 =?us-ascii?Q?U/eYWkdbleMafBABzUurkmfN5Dzfyp5tSE97OOEYhL/x0kzRnFzQa9LOy8UZ?=
 =?us-ascii?Q?Ar6x9JHbxBI87jdtsL8ZirJDpLg+2PktNS1ewFFs8iiOQdtSSknRiC/nhORx?=
 =?us-ascii?Q?nIoirKXeS5CzX/ZtAK2TSVMIe3l58cVGxQyiFl5iYLyP+ytKOgVWhriVTz1B?=
 =?us-ascii?Q?p0chYGkw5I5rdCVcYrYNiEdIP+SExr9gXMk2uvAxp9V69nuL3shevOofnx5P?=
 =?us-ascii?Q?76dstvfLTvSCrng731AEWtPt0zj6GcWaoPG6zFGI+/j6KPUXm5HZqRd/JzO6?=
 =?us-ascii?Q?WBbZoX8XXy75Ap/EPr5UKQxPBCjvsMAJfFf7jACSb54xV4qWxvgvlUj1JP5h?=
 =?us-ascii?Q?XXjYKQvuvaTx9lUDVwjq5+6QPcTlIvPmboBme4thxts1WJb/tS664rsgx2ED?=
 =?us-ascii?Q?p+SZWpUr5cwG9L4uQIaNqcDHWgAaMSJijWfycA3EF12G4C1e+eQsPkqsijj6?=
 =?us-ascii?Q?xFyzHUZerkYU02mucSqtxPRp0RpX/iO1LENHQC/C/4/v2e0vhnukle8swDYx?=
 =?us-ascii?Q?ONEUUMBy3MosKeAnWBosizx0E1J3f6vYdE6BbrlQbb37Gt2xZeGou8+UJKOE?=
 =?us-ascii?Q?29ioyNKciwHYPoJ7OpM7SsQQ+nN8+izYC1kkF0cYg9+TRCcn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678c1db2-af7b-448f-62b7-08defd3435d3
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:23:01.7640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gstp38winnemn5RQ8zDM2O/uoY0YNbb8gkh/6qLA+Tj3b1D5fJWOMNKfWQYitoBm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6066

On Tue, Aug 18, 2026 at 03:16:21PM +0100, Mark Brown wrote:

> I'd been under the impression that the reason this was happening a lot
> with Rust was something to do with how the language works.

My impression is the rust team is still learning how best to apply
rust to linux. So things land and get changed around with a healthy
does of compile breaking changes. In a certain sense they are building
a unique kernel specific dialect of rust as they go.

It's fine, and this particular case is managable, but my main point is
as rust increases in scope a more accommodating process is needed to
maintain the general kernel work flow.

Jason
