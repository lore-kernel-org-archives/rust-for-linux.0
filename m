Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010040.outbound.protection.outlook.com [52.101.193.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ECF265620;
	Tue, 18 Aug 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787059231; cv=fail; b=YkZc91U/qVlD2VKARohzsHuGJHXSyESmZpmE2y0XATBBcUnlgeq4hazh0+cqpHBV5YmWANcCY8ryXnLLkb/vcOV44rxAFne/M9SrgvXajWYu534XejXMJQRbyJIlDHJw04AhhGt3pcLS9gJDvduSUCcy94msIIqQfW7oAH5BrDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787059231; c=relaxed/simple;
	bh=a4s4Yw308cSzZ3nitvzo7wYCnxYE4xgmaTSdVtqQKMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bTssgba8HYiz0u8D1Hq6kjMR+/AOw/TLJ3ZWHo9RMNRBAS4ZJNOxp/LEPtrLFg6CMdMaEyhWyYi4EMuzACbY58iPvOJ4JQWAxW5J4/wcDFgXOfsK6r1qQFfCn7qVkLuEGQLrX69+OjCDq9G7MNCOMcbp085N048HV+0J5kGa6ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JpBL936H; arc=fail smtp.client-ip=52.101.193.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JpBL936H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsnkybDm7xk/7O8x1/kFy/aP8yN7Asu0HjHDk8W628ci0iPMBsFNiyQYEvdLrwlkbU/QHePkng9KBxW/1lpo3coTeDohb+IrneikHpOAFdeUNc5wx9ZlCoxKKqlilr+Tg0FsXYkUMqRV8nQt1XsjS0SXyoxy9ESkxA7S0+FQHotMwNxWzudwOR8kT+JvMyn2k7nRAqBWG+Kn5i6UIAIR42XLJSw/+AcH5Fe7ayYH8AQ1QW7iHwvqYQk6ITKwGGlBxpnuqXaXktQZFJNHKz2Fx3uPDH2+jbR0cpOd7QwZQukmdOrvBsJJBTMe4RFipoTEMTjQensKcgqoL8t3+NzpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXymGpRmhWoNogY9UZ9lFzt6jsTkNqj7tce2Rh4S8+M=;
 b=KRA5cJe0hrA+0jDkqshpdX5d6ITFDI4/vppT2CMTbdcFUGk8VDW9NIS/Jugm0xAmkOAffGxL372y9uxMuBXgL/LT+aiwMkQYipLDkqyzeAiCl1195YjGKIOWbELthvxcFdtEeE3MOZzmNiKOsGF8sW0d8+enWlRbsv2i2suITcY+AyMCJxXKJPZmqVd4XxLzny6vcSRtK3swbwCXV4+9W4Rx+rElM91IZlPxt5pvxBsQCnbZc23++bnMzKI1Gwrq24JJXMsbTxY+rmN+LBXl1IEraS+NDe/NdzZjJpZuk3C1832gIQ9/w9CSWZxqIspSnMDnLJO1lwv+Jd4TstuRPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXymGpRmhWoNogY9UZ9lFzt6jsTkNqj7tce2Rh4S8+M=;
 b=JpBL936Hhnz5mmRrlFfvq7ZH7ypXjXsdFFWviNZRS03Lt3fW+VRWncigBfRX8R++ANaf0s9rG0ZF0u1wGRLYTnodCSo8MNbIjIrnGPQjKvXiaYsDIe/4t+0+tU0GyCGhSM+YuAzRBkUy1T3B3T2es/xSO4yOWc3EUD9hFkNFAn8jRTcHfnZghDI0jRVCGKdD97U4OIK/GnXNkUrmwtSFDvM1Ic+jjJcHJCIvkRFZIeNncPWT02PC8TsWjdRcGw9Av/tPrO3RxNfAKOLDaRmjQvP6yrfTmKp1C0enBQVfbmvsqr39FiTVftaiR7KK7NsXq8HEaNhv39Ichw00r1tsKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 13:20:25 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 13:20:25 +0000
Date: Tue, 18 Aug 2026 10:20:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Mark Brown <broonie@kernel.org>,
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
Message-ID: <20260818132022.GC5432@nvidia.com>
References: <20260818105350.361218-1-ojeda@kernel.org>
 <20260818125558.GB5432@nvidia.com>
 <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net>
X-ClientProxiedBy: BL1PR13CA0398.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a41b99-54a8-4d58-6d59-08defd2b7649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|56012099006|6133799003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fm890Y3JsQ37+4wzUyqv2Sc85kaar23EUABGRejvsPsn7wYsCO+Ri8Eu11NJL5ZII2aYbxdgYFxDHVn/LI4G/LIVaqZ1YdZ6coFVKILd0DYEA+UAKsFEYxWnIEoUWNNY+y0I8Eg/+mtNT2c79mxLSWo/0780d1h2Y0p/9tOZRQambwfr/2c61B4K+yqTdXMZ2h0nOCJWIdtleKFMpfi2MwkZivikl/kbmyFV/lXSPBnGrZkfCRapQjSq9VVp2WdBXlDEaepOvlKDI81Gx4kLhEgt9Kp5I3uZTADYKHScDhyQjD6YQ4w2EobGNhy8r38J4OsoehQM7O/AwaBUTfhUc0z/GtA+2XNvwr8fcTEz7sc2DXrCmidvjS87yTvJcCJQ7sIp4WRCtDru/H5WpEWArfyr1LkVgQRdOz+NXAgb6D53brZaEOEkgn8VH0rcqi1Hlra66h2NirplLfOhebVlZeCr9jpULvsHFIngE7KI2A4iV3VYtmAh3UwWSydIPp+1H7Vnupbjp7gL2+4uTg29t1zp/6oxmuHerajmvOfRgqUM2vfer1mrDTl8ROuZJyl8VRoRdicDhaFhQX6s04qRcJD79z0WvCHPQatvLJ0pGp5dsJVBa/2dPvfLIB6EBUGxvl4l4ZKZKJZAtK+ER0RgPFRPh1DFXcqapWE4xYsL6lQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(56012099006)(6133799003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?llSueVzwOGuXaGhsclt9QGPJvYVu3e673MOK2FhE81n2g/+4Tw7TsBjxmsjW?=
 =?us-ascii?Q?+QMMS5K6u+KN7GrqaWx2zxDPWKVLXvdsGzhDMyvTlYG/ln1Cn/oN2ionnfu+?=
 =?us-ascii?Q?qin+BmeWEMDWXHen+V/8jUD6Lc5RCTtR/7Ein1pYqs6PLzbwW1a+Pmi9POS1?=
 =?us-ascii?Q?QSNG0Jirr39IxtxB6X2sT9dUkjfdv2FBPVchFjciDp7BBAO4Cdis05i4Giwd?=
 =?us-ascii?Q?Eus4JLEOEN+hkh9VhdnRP4vJD2zpv7Sh8mAozyEmd3Z9RzoNy0hno0/hUZF5?=
 =?us-ascii?Q?8Objv7tx6Wqa/mZkD8NmmX03ZZdbAo1HiZdYQ3MSt2aDuGkM8AWlFOaSn07+?=
 =?us-ascii?Q?b3j0goB4D8MFSaSnLL5Kq4ma4bQsEvtbeY4Z6KkZhjmQYIvBcfo08tiywDhV?=
 =?us-ascii?Q?ijChmSDVC6QuOlZWlH7QrSuFSnW5d1q63mSbaraWH0V5XEF0wTN3z1NPQuqi?=
 =?us-ascii?Q?Ga6g2ZF562PA9Ty7HAmgiI3/v6fxDPEOic4spjh57LUORQQ/oF2wLuKpWMKr?=
 =?us-ascii?Q?Nku2rBh99Np1+YXweDydN4nqsoriQ8ChOQY41Tkj7HnNEFWmGJCux1RmOyn6?=
 =?us-ascii?Q?Wx/vJA165XCW9nC1jaBKSQaHGVW6SCuoWR3ygIvUPDNSAsAdw1yBXt6zbN3V?=
 =?us-ascii?Q?gAsSn15nnTuDpt/ZOHQWOPWmQzAhdbOKoviOLMO0XuZNpwPfP6hDsJnJTQPv?=
 =?us-ascii?Q?63ljYvfk8zxmr00zI1y/Z337AMeuu7jr+BePAqIw5EaHTQ0CN4X3eeW9iB2x?=
 =?us-ascii?Q?4XrnxN0lwNuDZd2uL1tGwuk5ij2einVVjAzgBmQcMGMF9holsvHRtOrM4tsB?=
 =?us-ascii?Q?lCVFp0zXGGcREm5+0EmnJxbAXAFv4wXm/ed8VtXmeXk2oeuugG9msBzMqiz6?=
 =?us-ascii?Q?AuOYY2Ekp2TDbF+XbK+dXGkSMNG4EFyiMUIKLQ94O8QLUbTOoQ4/zxL3IzeC?=
 =?us-ascii?Q?53DNbCUSl2t7hacE13lR0yZDIYUv7YSniv+Wit+SMAS/TrM9UdJulr0yhu/5?=
 =?us-ascii?Q?nMaIEo/M63xrCzC6epmxhI62vnqXs+/9hXeLBrcxHKSGLxP2E4OXmTYHMpi3?=
 =?us-ascii?Q?jdjfuK1zWdBGFHHRS9h41/JbuRlEbpaOVIFwQ/RwwqXQXiE9B7DtjIPbziRF?=
 =?us-ascii?Q?Hc1D6SoyO0UKf3tZiD1Tpr0ZDxfHMwevMHuG/SsiknC1n8/HmbWmNgbjVIlN?=
 =?us-ascii?Q?6Jv0fSdYx8hN7zWvmyQSwv+kNKA7lo/nPW261IQLR5sB0e9V9MymZUs1R7Oi?=
 =?us-ascii?Q?BTMbhMQwsNiU3shUQMiwSpAeN7GkEz64DTKA+pbq9XOi1NjiY5R7wVNFAYuw?=
 =?us-ascii?Q?/WFAsA/Uj+HcvgUUu+7eTiKINPlv39O8rTs7tPf3GsxRKDwgXAw4h8rgDJww?=
 =?us-ascii?Q?GRw03crkTqASbeVmx7I3kepcOnCSmRUOdCDa6iiX5vBnTyA25jd/55MLB1R5?=
 =?us-ascii?Q?xJqjSaOveyWyJJ7132onK2KALZlBiPOZr/tsomZR0ER9zI4MqWFplmhysMi/?=
 =?us-ascii?Q?/mY/tl3bWf0taLjgfFQ5M+xolUgxm/mCJD1UPizU910rziE649yXECCQlVak?=
 =?us-ascii?Q?fSgl4sM8lU+7mazRsouxhtdAInMaOmBznSilnUiHQZSwsGKNpTHSgHqhWSMB?=
 =?us-ascii?Q?hdbaxiM9cYF4+VKQDhybrgEFs8eG2lx8/IYzw6QPPioDh3hJ1//FvSAmwreQ?=
 =?us-ascii?Q?uY/2BSfB9pJba9T8eQ8XVy2ubXihhy1u3Bt8tQwYMAPLpsaa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a41b99-54a8-4d58-6d59-08defd2b7649
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 13:20:25.0868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/br7461o1KaozuqCYYZ1Ae5Cq/6miX/Ws8oHWZN8PiKBMpOaFOfGbMYoNr+oM+7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342

On Tue, Aug 18, 2026 at 02:11:57PM +0100, Gary Guo wrote:
> On Tue Aug 18, 2026 at 1:55 PM BST, Jason Gunthorpe wrote:
> > On Tue, Aug 18, 2026 at 12:53:50PM +0200, Miguel Ojeda wrote:
> >> Commit
> >> 
> >>   ea7da3116015 ("rust: treewide: replace `__pinned_init` with `raw_[try_]init`")
> >> 
> >> from the pin-init tree replaced the method before removing it, but commit
> >> 
> >>   e052daab94ee ("rust: introduce abstractions for fwctl")
> >> 
> >> from the fwctl tree added a new use.
> >> 
> >> Thus replace that one as well to fix this error in next-20260817:
[E0599]: no method named `__pinned_init` found for associated type `impl pin_init::PinInit<T, error::Error>` in the current scope
> >>        --> rust/kernel/fwctl.rs:465:49
> >>         |
> >>     465 |                 match T::open(device, reg_data).__pinned_init(uctx_ptr) {
> >>         |                                                 ^^^^^^^^^^^^^ method not found in `impl pin_init::PinInit<T, error::Error>`
> >
> > If you delete functions like this then you break everyone elses branches :|
> 
> I'm not sure how this break everyone elses' branches? It only breaks linux-next
> but that's why it exists in the first place, to catch tree
> conflicts.

linux-next is to catch missed things, you shouldn't use it to
purposefully cause conflicts during the merge window..

So for example introduce your new API and do some conversions, then
remove the old API down the road after the merge window is a more
expected work flow.

> > I can't use this patch:
> >
> > 465 |              match pin_init::raw_try_init(uctx_ptr, T::open(device, reg_data)) {
> >     |                              ^^^^^^^^^^^^ not found in `pin_init`
> >
> >
> > Linus will have to fix this as a merge conflict.
> 
> This patch is sent as a semantic conflict resolution so yes it should be applied
> by Linus.

That's not really how things work. Now Miguel and I both have to send
Linus a pointer to this hunk because we don't know what order he will
merge the branches in, and last one to get merged needs him to put
this in the merge commit.

> If we want to do a cycle's grace period then reverting commit 1f7fa1374d3b
> ("rust: pin-init: remove `__pinned_init` method for `cfg(kernel)`") should be
> sufficient. That said, I am not sure it's worth doing.

Probably not, but it doesn't hurt to understand the expected work flow
as rust grows bigger.

Jason
