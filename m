Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010002.outbound.protection.outlook.com [40.93.198.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2095946985C;
	Tue, 18 Aug 2026 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787057767; cv=fail; b=gK/UORtIk8XQu2krGKtxu2qUqPqRIJt0qVRpHO56q7tHQBF+nkH3e3/2uM+lQrb09PjknB2xPpenWEBmW47Hpoi0GCSQb//LsIOF5ico2OXs+1gd+aDestzWYJ2BgFFVJ62Yrjj/9OGGoRqxFRGeWtucIB8jN8GMxzPCRGPwIA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787057767; c=relaxed/simple;
	bh=M22j5WNZveM1sE9njwomYkGpoVwN6rleP8RI+OVI40E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XsweaQ/RjX6doFxTxkyx5bhBm5I22uM6Aw6AvOHLKicSpfV6dWFNloglGSMFhhtLV+J7o9R8azQDwDo2vvfZ6HRs/YkrR94+Kp3or/3OSpEZZEmdT9skjrnMw3TV91xxvCv9/Dum02vC8RLod4nhzR1EnXbTdf3uftA/7bo8czY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ahMbx8J2; arc=fail smtp.client-ip=40.93.198.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ahMbx8J2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rg2CVVqTQyKbNlXHMUzPZ75kIgbquo6spx/qRJLTgwzjG/hYq/y4YJXUZNO27snpkdcnIbKZ1Ga0zP78wyzMVqJqAhvizLahUBTWgP+hOo6TaAZnAoaStf25mrB5sWz0VQzZ0ljhqdFev8N2aGamF5vbWBtR0TJtjlE4TzfwhyAjteHayNNz3zt62hICxvY/AF0O+otduIezaz1vwcBPu5WCyIPv41MVM7mTn1BoPNt76GY9KthqQqXeaIzDOzVMkc3k9toWGE63h+pPC2eDlR74kLkUqzy3qaKBZnEQ4J5AafHNCtQQrCvDqWJsmSBM9VsueDKquGaO7TsBrWUiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Yq1QKQX4uQ9z2oAIM6HqLH4WDdzAmrXDTFv6zMjyms=;
 b=Smyos/HFw/bVvaQA2w91gUMiz/aFbotC6IAAWaoquqQxijv8g7w3W/b0vCIrslRNyTqBBF16Q9SeUP6NFYtZjxsGbelJER3AzBG7FiBwI/s4D2eYU5g3TTCk8+c13kC/MmNBQjlYjhJD3ps3ofQuUikT0h2jsjIo2wSjkQgubcy6G+bg9reRUMlIVA80KuguwoJg0G1N/VXxcIvHuez44QfD/bZmb+dTpM83sNNiEc5Xj0CPC+wd+hDF6wLy/pk2thCOGvijHRjuLj1HbDzLcelayW8X49ldpRj3rbfawkLwWik+rIE51fRVAlTxPPS5g+yYdTY+MeaMg43e6tnfVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Yq1QKQX4uQ9z2oAIM6HqLH4WDdzAmrXDTFv6zMjyms=;
 b=ahMbx8J2D5bDEO2Wc9CpX70J2k+9R8VosiS6Xyq7ee9LGq4BTH5auJlLtikulNDqx3fCB61fyu51kK5QX2HxizHN4q4dG3w//Zj9IFuuYiT4pTfKzhAEpSvNNwnLQd0eRU0Pqqcu7MaOCPiUcnvOIXKDglje1fZuvX+w/xJxwB8SKxsNfKbsYYMJleFHh2srNzlG8Uit4qrtgPZAoeOgPNIfl+DUzoQGVZSiSWApPzdA3U82dfmK+CtleGG1GtYvz/dk5jjzhBuS1HpDbt3+llQ5iz/91aWiOfpLfWuLFkM6znzS0p/RMlwoJmDYDb/dfOfOtTjUc/ERTCGVRlnFRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL3PR12MB6522.namprd12.prod.outlook.com (2603:10b6:208:3be::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 12:56:00 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 12:55:59 +0000
Date: Tue, 18 Aug 2026 09:55:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
	linux-next@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun@kernel.org>,
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
Message-ID: <20260818125558.GB5432@nvidia.com>
References: <20260818105350.361218-1-ojeda@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818105350.361218-1-ojeda@kernel.org>
X-ClientProxiedBy: MN0PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:208:530::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL3PR12MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: e19a9525-4ac6-4715-4e0a-08defd280d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|56012099006|10067099003|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	buuilSnmOqHJtyGa1xL44vZsDo5KiQKrDqFvAp62vKg1kJHBTlnCyK28uRrg/yuY4F1f2JUsnzsn5JBVNqmT1pdQLBFj3yedFViZ6QCP3MTuhl7P21gDNNkkRe+i+lFGQG/67OD+8exq3WKw158DzBkuqm7zakeRVRtkzI0+SP131DzlTQEudSt4SBgceQqhEAQ3PNktoPD1c2nj2Fgs7XcDfUFT0JdOZOzKvR1/5VehZfJEQ7n7aHsTAeuzgmoyiD2V7pDJrx0Jy+3a25JX2Uy2lRHOCJHWpVehrY6d3OoVFvV3KgRt50Dv3OeK4fojJVCh+iIrXb1XQ1Tvh/Gawilzj8NRWX63DT7besYJuCKzkSvcLqwq9gszHewm7iH3nLqye4dz0QjqAPYXBwcrXkZlxvIK1VC2xS9JAp+c4VceKbJ1o+fBbexJSfV5fNvhSGqNotnU1axMktrQxQqD5f1Cr89vB4fDVb2PRu+c/H4DgfEPOhWQ1qKIDBcb0/nVCmOjcU0FZ5IozzowXl3i7D2S4D5MZWBK7brx8sQ9zp+TYi0l8VipOa/JDFyVeXYyig5gWXG+G7iBtaFuE7twQGiDjwDUCgF9xpRoxAPrEhOSzuFXRfuDjDSg3yWkgJjCgwitWtniRbibasnxucViZQYqg0cdhD5kf7Gn5EtNLy0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QGjEHLknGck57rwBW4wdhX23yQIY37UX/RRyomNX8vMg7/48epNXiO0+MZH/?=
 =?us-ascii?Q?7sYI0jq7GbkYVKR6Lu0pnJsvzzWyuaAj/NHtngOOhi7PDIbLTqcEAtdXtvm1?=
 =?us-ascii?Q?APuOV3m73oNaBCy4FXwy+5PUYvVUdg03fqMeVEBKvjb0sYnzz1Vr8JXfP/XP?=
 =?us-ascii?Q?fqPXspPnY3lSukKrTxqF/yu2v1OnnxpTwRxNlGSx4yGQfeO1oiwCTeugO6GM?=
 =?us-ascii?Q?alSS319kapdg0qy6H/Eo6LuD7pJG2rZVkUU0m6BuhEn7UqDmqHB/D02bkZQa?=
 =?us-ascii?Q?0PxAySfVu2+V3dtj1lyivl16bRcVV3S8PLcoxNnXsdt4LuHUoPjyWTuCCzkF?=
 =?us-ascii?Q?o8uoHv0X7dHmLkkK+WA7xnj69vNG/uSlWdVNcXBClJEbpYpLp73WVDNODTkG?=
 =?us-ascii?Q?Sbu5sxLNQDRF+SEDMqP2F/hsLdRmyAtu2Ki7j6G8xgAokww5BhXI+FbE+I3a?=
 =?us-ascii?Q?yegkhAtTLRr3GGsGR11vSpP+763iNQV9DWpMLECmN7mUbMqIBph2nzjgwXhc?=
 =?us-ascii?Q?bdIBmvK3z8i0uyvWCy1f/VQ/C3ObVOlD/WcjpaBbRuS1Kd0+o82p0tt+NUSN?=
 =?us-ascii?Q?00RHkRrKYKUeIGt2KslDUvvrJh3nmftxOQqq84EjJwl/hGPMJ9tBk0871LF/?=
 =?us-ascii?Q?O1/0qG9fBIzH6tHlsKe2BXuXG8Tze0y8sZb2PmlBmh0X/4LHF92jmnIi2vmN?=
 =?us-ascii?Q?yjzZhIkmMG++NyAKEAT16scIamp34LNtkSfXgG0nsI2jIdxPb1vPjLhGaRYV?=
 =?us-ascii?Q?QEcxuhOgPj5MLEpMwRWHbMsuY4MpxhiarmPfor7dnS+2VoVFAxgZwfKO3GH+?=
 =?us-ascii?Q?kA1n3Tag9EJ9PY7NVw/X7jl286Bf72ChaAEMgIb05DClr3ZNaS/lJB1jg90q?=
 =?us-ascii?Q?TNgqZpTMyfRvn4QZXcaD9voPadqt2kLIWgnonT3Q2bnrzZT2zQn+x6wH7Exb?=
 =?us-ascii?Q?v/GTohitePiMMVwdJbo5cPsVMKayIoOopyrp2HCimreCiMH8IM2N2bYRG/pb?=
 =?us-ascii?Q?mnP63ss1A1SQy9h6+x3cxuwespcsIsGhitc2i227zoWve4U/WjRWT8qSMIs+?=
 =?us-ascii?Q?HuIXyFa+nA1juaH8QFI5ljqjqmtDDsllNUhLEb/pp5YzGn245krB5ybKKTgm?=
 =?us-ascii?Q?ws2rE1yv+u29dGELM6yOQw2p3WZB0VBLr0a8T5wWqRr8lGaSn2nFbXB+dsC3?=
 =?us-ascii?Q?AvfMi/big0M3fRxwjs7fOvTLJ0Zc5o0izfNV06JerLieBu+ls/ezxBeljGk8?=
 =?us-ascii?Q?GFOcEfjdqlAXgYEg8Dzc10KlAqwtByksiN0ws1BFC6xl7WPH/PEJP9pa3y2A?=
 =?us-ascii?Q?OhndVVOw3cz1EUY5ATHu7xMtc9SQZfa1k6UwVwaLZ1xFUEwq81T2FP9HtJix?=
 =?us-ascii?Q?OOip3BEcEh/gc3l79lNz6tS35hNkPy7Bz3itsmuabRhqqAfF4fHZD2xoDoeC?=
 =?us-ascii?Q?Uh99S0RYUiMSK+0RAwWmHmQytywcmiH+vNab2Co0gD5moJo6gL0klQ06bXwP?=
 =?us-ascii?Q?IinqyofrN55FvaBkIREhGvdUjOmif9KYUzozRIrRFAhJE8IOq7eO+Vmdlb92?=
 =?us-ascii?Q?0GUZ52zq2GAB2JIlaq9259pq277kJVeUlBKt8QJyfF0Ogi52SzPcrS9/f4UC?=
 =?us-ascii?Q?KJUt7pETReyYuvKStaLSwc+911LqvyZ/iGLfZTZbmbH+JuPMY7hSOh9kSFgI?=
 =?us-ascii?Q?SdXNOyIkKUvuoh1452bxWkHsXWhMo/idJEOG3Z7CyF0lTuqr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19a9525-4ac6-4715-4e0a-08defd280d47
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 12:55:59.8453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EvPfT1bd4lqOEnFWPiDnSoF/Q6WgI4XwlG6RzQxANxj0q5JXUUh6d0zXvnLibz4B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6522

On Tue, Aug 18, 2026 at 12:53:50PM +0200, Miguel Ojeda wrote:
> Commit
> 
>   ea7da3116015 ("rust: treewide: replace `__pinned_init` with `raw_[try_]init`")
> 
> from the pin-init tree replaced the method before removing it, but commit
> 
>   e052daab94ee ("rust: introduce abstractions for fwctl")
> 
> from the fwctl tree added a new use.
> 
> Thus replace that one as well to fix this error in next-20260817:
> 
>     error[E0599]: no method named `__pinned_init` found for associated type `impl pin_init::PinInit<T, error::Error>` in the current scope
>        --> rust/kernel/fwctl.rs:465:49
>         |
>     465 |                 match T::open(device, reg_data).__pinned_init(uctx_ptr) {
>         |                                                 ^^^^^^^^^^^^^ method not found in `impl pin_init::PinInit<T, error::Error>`

If you delete functions like this then you break everyone elses branches :|

I can't use this patch:

465 |              match pin_init::raw_try_init(uctx_ptr, T::open(device, reg_data)) {
    |                              ^^^^^^^^^^^^ not found in `pin_init`


Linus will have to fix this as a merge conflict.

Jason
