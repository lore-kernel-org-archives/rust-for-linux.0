Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013066.outbound.protection.outlook.com [40.107.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC932DB7B4;
	Wed, 28 Jan 2026 03:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769572037; cv=fail; b=IaP5M4sQif01M/hEUetRyVu56KKSgmpYuf7MWF9rs8+pZ0BRVRC+X9n57HZkUE1n6KQwvZJD2VYLytUAgZzDO8/WyG2lGcFB+8/tXK4XjhfhfMRnVJ/PQMqEWlAxXEmmajZfwY32WildDRdur3EsV2Sq9OR16I+Hz8CW1hlJM9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769572037; c=relaxed/simple;
	bh=hp6oLwanS97yVWvHkBiSrjVTo31ooa1Bdn/JdasmBpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j29y1AzjI1ARvbVp/xSTnt9pmD0Zi4Onl2qO9CY6NBGgXrOThe87v/rj0u2KPhCiohtAdj0vrxPz7P6Xn9qx2nWHApg+NeyXIdm8m3S2gBbulTS5Jz3gz2WuVDxhfJBYMNtTxXhXwfcQgcjtXA6isTNjGYUIt+zm34doOYPE0Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X2jRhhek; arc=fail smtp.client-ip=40.107.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X2jRhhek"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jg7OR157+0RsPGk/pdzMosMXPukSqpeKrX4S4w72h/op0nFbMLF/U39Zezuh65Zr6EZUZNYY4Xh4OHOsnrKI58r0ZlzgybR3ahvxiVIOaDmukdLlPx9o3/aM09AsmZXOrD083S4KzyfV7r2kYdrfo3j/xpJRQvv8QtOpKeZxyQ4MtFeQJjGglxRsaguyOCjqsYmG9UCikDMAHl+Eds0Tt4RlB3Kc3aif9BX0O11fV58yrgCd/Ty549VNXQRJW5RIFHsvq8KnbsZKGf0H4W1mrYJn0vprhOPFS8pCi2F7gITpBLoL4ejTsY12HY04GA+zT7j3hzqwHWpa642pCdL/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLvvLJz5mZLLwVLZ/5jReQPZtuipT3oQZwvCLc+uPH8=;
 b=HnXffZfl5zULHw28h00opRFUVCPeEsTm2ZHweoErH0tMQ43bx2LNZE1fhIJwEycJOueh706aiwI69U0IJaNJqSE92Pc9O+5yN0a5bhJcySSppVnlPn2ok30njdgCaxeITHRkCdJkCLYzDvMdircfvpQLSa5Y6d/NHvjp0Hr3h1nwYzBY5ZA5eNkFcK5NwKrqCaZGgAxPAcYOPVQ144h3sVX7vJkOK8MkuR7OKD+F9ugGKYc9rFdD2l8B5BobBf/7wqH9YOqu1Xwk5bLOD+2GuGi7ccevFWOpZatjDXw0A/4QcY/ypvFc2BsIx1XxsCXlat8l+y5Zgdn12ywISzw2KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLvvLJz5mZLLwVLZ/5jReQPZtuipT3oQZwvCLc+uPH8=;
 b=X2jRhhekOQzTEIcNGX1OzEXJhR747J99W/Vded1h9Yj3GLRjspbip8/33Di6Vk32YIFIMGH74Xr0sKINiB+ExnUdTSa5F7fxuABN8Ab3az4mxC6tYWqKFinzQYYMqrrEdFpxt1EXSGbEJwWx4aHpjMgxeyruHLZgemglJWPTqGRLWnnDM7Whji5E0VLe+CDr2WI7P2ipjnAt1AwPGgSh9a7VHIJYgDw0mbYR6mmSndBhw2rKR0CXSI7QWnnhginMMwKVkW48w9Q9IOV/VZX/beS4Y728W4IJAHAkUr0OuXW2pAbW1hevbZvIfxMUfjJMyels95OI7Dh6sFdhZ+iW1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA1PR12MB8885.namprd12.prod.outlook.com (2603:10b6:806:376::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 03:47:12 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 03:47:11 +0000
Date: Tue, 27 Jan 2026 22:47:09 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
Message-ID: <77AAED55-B8AE-428D-AD3D-D52333DB8D8A@nvidia.com>
References: <df2772b7-0313-4767-a370-4a4821425f60@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df2772b7-0313-4767-a370-4a4821425f60@nvidia.com>
X-ClientProxiedBy: MN0PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:208:52d::26) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA1PR12MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: d301c81b-516a-48f6-0e1b-08de5e1feb18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6fHCzXRKdQ9jf2Tb+Kb9P/HZqe7orYFbU49aFOgH/L+gRX8pz8EkOYalSSrn?=
 =?us-ascii?Q?ewlOKfJB7olDV9MqYntGG50uYWTWP84Np5GcMfBK2GA6jQvdya1Lfjvg6Gnc?=
 =?us-ascii?Q?SAajI5C8k1S+GOZ8dAF55EpmJbbiOwYAY12HBcDPR3zvkI4fT+Sk6PgcNUJq?=
 =?us-ascii?Q?ZlazcCTqZ/9v7l79n1vcZnLf893k7qgytyZzf+3kTh/l4Rsk/1ouVmgWwpFc?=
 =?us-ascii?Q?/iUsyLT2WMAEKJl08Pb4jC5CVMfBLQlv6cBCKDd/j0SfIB12p8RdU3xmI9J1?=
 =?us-ascii?Q?hYcZ+BlD65/04LxXDsAY2PmYfNLqkHNk8xmv7bAOGnyrSRdzEULhribDT4sb?=
 =?us-ascii?Q?XkXmIlnQDXYfTEJZOBOie2tG4ZaMhOWb0ScH9LyM4Ta8LQ/qYAEAR/HMHBQ8?=
 =?us-ascii?Q?y3ONLoOMIvbk2ET0Pg26qGFLqEootPtiulLQb1/Tya80ipGCJ95TPhsAETF4?=
 =?us-ascii?Q?S96GlwaSc2Aa0HsK80aT+6WDD4xuH3RYLVtwPWW7++klzXYsKpNxhopf2Fej?=
 =?us-ascii?Q?wIOUH9bmAN4zxBH40AqVfl9n+qPBjZxIkRajpuDf8YJnx+6W1SkSUZecr5cf?=
 =?us-ascii?Q?ud33CMFcoBiFYFxDmoskXp0SXnO0Ct7430qyx7Y3yeTFprgOZHIYoyip/V9X?=
 =?us-ascii?Q?3z7y7vKb67DdKg0igMg8VWE5iyoYhBFtoKkJoihHi0LznM2EcCkpeQ8o/IVH?=
 =?us-ascii?Q?FWcrwhOx86Sov/TyBYHg4s0waiLtdN1vmTecbIkmEJRrxJZlOe3yjG93xbg6?=
 =?us-ascii?Q?xSFKbh77AG0rsGbnj3UUI07iIf8yf9MdBbFKDFwrfC7w8PFZl+OZMsPFSUeH?=
 =?us-ascii?Q?HQ97fYRCw8G6034FvKDf3TmZI1i0sZ2ePEmzEq+e5ZT18qSdBi3W/YdUXikU?=
 =?us-ascii?Q?qKc/so04DKAWdiMlyHeEU/2En+jeYgnCcq+s7eXGFCJnqi+D2xQuhhFj//I1?=
 =?us-ascii?Q?+GalDSwQK/KfgjD9A8qekslLokQQkSGBGnuwd4urTDeElU3ACTj0sdH993ZX?=
 =?us-ascii?Q?vuUXbS1PkrRPv93THfyXHKID8qnj88YRxARSBmH8qbaN8OoVVEOT5Mh6+MN4?=
 =?us-ascii?Q?5t3DsP+84s9DiCDrG4jIFwjqZ8dnUKlCYJMd4fGC5nTwjEUn3sy6wQZAaBJd?=
 =?us-ascii?Q?Gb8lxXbKyb+0Yw9FC1AvgHZwkTu/UiuHNST63GFuMKE7a4F3R+mNp0Xnvmx7?=
 =?us-ascii?Q?ZeFHcEwS9pSel1t5Dv5psBgqhdEs2knzkCXb0n4ATB+q+oxl5bc5I0oRR8sN?=
 =?us-ascii?Q?IgUG3rIwc3beHl8yA1JVmq8dUX3Zq3YmgQG9wsRrN5XhKa9gTyoTpmmt5g81?=
 =?us-ascii?Q?Q6Vo5SVjVQENGJiMDyq8EOWIWIapn2iJirbzH1U0zgf5pNkrDHIC/aZKGS4b?=
 =?us-ascii?Q?Gn0hlRYjGEOuYRJu8RE+HBm1q+aACmXN1aaNIbKIW2nkNHnwgA8TsmnHPvbi?=
 =?us-ascii?Q?+OXGoIlIxPfqWX+eUJ4FoNcO/vhqCblIb04xzLuMeSk6U4Ntk0MwjyJQ0S5G?=
 =?us-ascii?Q?7u96ZVP42ROfODeUPaVJbj59nYrTbpIcHYEDbJwVATORx2msyLNyoJZNNbMs?=
 =?us-ascii?Q?d65YHKLn8VsxJuCbRxw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mIBItDPvXI/JMWW6EGZbc38KkRMFVPS8eeXWzLlUF8gd6L3dhjkn/ICeoyGh?=
 =?us-ascii?Q?eeFMr0TeB9m4CAuv88YfonDXKcB/bDHh1waXD1XER04w+UAhDW7pglZ65zgc?=
 =?us-ascii?Q?vnYg8hfWKGEz+VvSMG3p+IRRCxlA2NCGf4SGt02jQXIGq5UWAGu54m8Ldma0?=
 =?us-ascii?Q?DIzvhAy6Z4O+2LsyxRoMk07rQdAqqUt+hkhihVRMPM2oGvUZfxba40Wu7tRu?=
 =?us-ascii?Q?uiOBQgsclK8wbUt4jp7gFAObGQzswbCuoloG0iZ515SiZiXG3/XMF9T3ckkv?=
 =?us-ascii?Q?qayVTOW+xLpl/DBBIQNUVB4gpPAtUDuprtcvUy6L6ry8cNItOjnw8k+IfD2a?=
 =?us-ascii?Q?bhqCKnuPMBF5jyTC8B+bQiwvtuNTF9Jdz6K4H/+Ar4YmI21/nSIehQjmZRuG?=
 =?us-ascii?Q?F2RfNIZlCcIhmwo6iSfvuEJljl9T5oKcyfUkwHpbNayG6hiQnBJpOtIbN5aX?=
 =?us-ascii?Q?fUZE57v5j2VVL5WwZHtAvNQ9MYCZNaWLAdwRaoQ2XxUfpoITjOt7VS8uRIvG?=
 =?us-ascii?Q?vwW2z6L6G2xkcqjTY1baMhPIqKF92BO12xz7IpkY6OnGxo8bDNRIU+9xppJj?=
 =?us-ascii?Q?xJYGDDSoZaopZUtADqucApzohT55fZhaylIbsmUm38k6CAUNBSh4NEp8PbLI?=
 =?us-ascii?Q?qDPWLI2SgTRA4wFGsERSLS/wNNja0oN2xwQFtfK0pH7v8uzj4tWZHVnG5YLI?=
 =?us-ascii?Q?JSdc2IbgpAlELfE/HvIbUKHOO7wfSftgU7KE9R/IjnAT0y2T9f/qQNgwjcYH?=
 =?us-ascii?Q?4pjQbrjvvvepGbgkghVhl9+wyo406Az0jZL4KmLzyfUXTPTk+m74aA/omyaB?=
 =?us-ascii?Q?2MWHWo/XuWNjKmx6e56Y1Lvg3D+9EZ6vgC7zFZRAC/qaTqt/b0NPvfJ8THwX?=
 =?us-ascii?Q?2oth+/FXmlrnsE228NfRCai7b7GCEPHQIUrHGUIBmfadhL9ULmmOVx4FAHz+?=
 =?us-ascii?Q?mdlMhzaEmQuqcSgpFcf/V8CBOcCa+UZH5IlsRkwrXKYD2Qods8aZj/hSkiz4?=
 =?us-ascii?Q?EpqNJdHlEqYiyjb1EXbAu40uLx446offgXhPd07L/srjLRgP2eaxjR1NviBe?=
 =?us-ascii?Q?Hii45ECDSUw2KQnyimGuIhL8aeRYEkjtsoTys9GIdPp34D3YRN2InOeoBXbM?=
 =?us-ascii?Q?eMBPad5gSgMWZu3s/RIULVnjrtcIZgUX5YU00Je27YwihCyTNEfBtnsAQqhk?=
 =?us-ascii?Q?y+whj9HgzIHl2yb0IwOma9t3FIo/YDHAJJNLTzlHssStrLfxrDrew9Bif4Z5?=
 =?us-ascii?Q?lmg+HXTQw8l95VzNRLSHNPG1xMMmBf3TIpIjO+SdE4Nvguk06eweRDTSARgQ?=
 =?us-ascii?Q?NDJz6MGCwRDko51rx0i+2ZB8MG6StWK2dQKg9m+aMJOO+UknHTLkjYsNRFoj?=
 =?us-ascii?Q?QtSHW3ayns5cJGg2tuth2myppkuJvl8t0cTZ2651X7uU1jTjx/2jOdNhDk+W?=
 =?us-ascii?Q?DFuS358TL8WTNEoHYb60LOFAS3f7ZCxsmxrQSGxom4HBNzS/t4KkZCvuu0ke?=
 =?us-ascii?Q?S6bsCbY9sbtjmzWpW+x2WtnxFSTdyCXUd8XlGR7MPecuFQXOMHT+QFnU4RKt?=
 =?us-ascii?Q?5oqGRsUMlsk21m1sG11VgQFXmGoZENMUE4xiRMVNdGBnuJHh8Yg6lR8pmwIx?=
 =?us-ascii?Q?HJLpm9AvhU/x+DyV/UsgzW2V4Pp44TnxSP/FxNYEaBF6/Rz9t+2RRvn5XuSE?=
 =?us-ascii?Q?3F07AqND0YQBEIUKWhljSqnVAFnFfHSJArFmVWUntPb4LZaXzymfWD+D/1De?=
 =?us-ascii?Q?UedWkzMl/g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d301c81b-516a-48f6-0e1b-08de5e1feb18
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 03:47:11.6500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgK68oK8MhovzCielNAYO0SJPT5YzLSlfNDAqtF+sjLhGjz2BdkCImOXsrztLTsYdiBU5//TC9UJaxOJh9i/1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8885

On Jan 27, 2026, at 10:02 PM, John Hubbard <jhubbard@nvidia.com> wrote:
> On 1/27/26 6:37 PM, Alexandre Courbot wrote:
>> Add a macro for defining hardware register types with I/O accessors.
> ...
>> +/// Fields are instances of [`Bounded`](kernel::num::Bounded) and can be read by calling their
>> +/// getter method, which is named after them. They also have setter methods prefixed with `set_`
>> +/// for runtime values and `with_` for constant values. All setters return the updated register
> OK, this still looks like a naming problem that we don't need to create.
> Let's just pick either "set_" or "with_" as a prefix (it seems that
> "with_" has won out, in the v3 discussion thread), and then add "const",
> so that the name doesn't require explanation.
>
> ...
>> +/// // Update some fields and write the new value back.
>> +/// boot0
>> +///     // Constant values.
>> +///     .with_major_revision::<3>()
>> +///     .with_minor_revision::<10>()
>> +///     // Run-time value.
>> +///     .set_vendor_id(obtain_vendor_id())
>
> See, that is just not obvious at all, why it's different. That's why
> you had to write a couple of comments.
>
> .with_const_major_revision(), on the other hand, keeps the pattern
> clear and obvious. No comments necessary.
>
> nova-core doesn't even use the const_ settors yet at all, according
> to my quick read of the (very helpful) [PATCH FOR REFERENCE v4 7/7].
> So clearly it is a bit rare, and the extra characters won't come into
> play in daily life.

I completely agree with John here, let us please not create a confusing API.
I would much rather use a bounded! macro to create bounded values and pass
those to a single unified setter, making it a unified API for both constants
and runtime values. Let us not use const generics just for the sake of it or
create special const APIs that no one but examples use!!!

For example, instead of having separate set_/with_ prefixes, we could have:

    boot0
        .with_major_revision(bounded!(u8, 3))
        .with_minor_revision(bounded!(u8, 10))
        .with_vendor_id(obtain_vendor_id())

This keeps the syntax clean while still providing compile-time bounds
checking for constants. A single unified setter API is way cleaner and less
confusing than having set_ for runtime and with_<N>() for compile-time
values.

Is there some reason why this will not work?

-- 
Joel Fernandes

