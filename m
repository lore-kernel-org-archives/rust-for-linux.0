Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012065.outbound.protection.outlook.com [52.101.53.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900053D649C;
	Wed, 21 Jan 2026 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768983430; cv=fail; b=YjT1JJUF4nJcBU3GJ//ZMjtR/KFrQc1vJAWhluWb8t30bv1gnlpwtrQYj6jaQg4DQdDvfjk+0Xfgksl3yFDOOjyzoS4PhjB9wD/FZeQhxfBMuMktvaTGXSKjWSTLM3PnV928tq7Az+vevg2OwaPYiOGT/UNRTY/fitMBuCexs/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768983430; c=relaxed/simple;
	bh=SkYeaYFwxn/6tQN2s57l3TaxFVp/X1DTzy5ywzt5p4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CDtqAMbXVVraFuIm2teCV6dzxuJDjJ53B4870inW4dcbG3YjkkBcbOd7BTKaSnk5QLFRua0yRDQfTrXgQ7RFTAbEznsxiLiM4Dyfiy5oeyIRzjOo16i2siMqWwDZqYXB8QWChNqCh5ZNGcX6eKHnoA+nkV+744YIu5tFQ3HbqkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IXnYyM5L; arc=fail smtp.client-ip=52.101.53.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IXnYyM5L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SI3sGPrG+paMLTJ0cF4QjgvWbLDHk1qSGdeaHkQ02R4ciPedKA3KU6QeRmQkJ+nN4erMyzF2LN5uj8hb/MUHgZcrgvgiMKzWv+F9BvxAdLwbB0EvPABR86pT6BuY5zpbQrVHWxSthpxImo9SUlBOSuTZnYQLv8PhLc0W96DuJgeEJmbp30vYQnmAjscV0tjX2Vm9wflew3cWM4Jxi+fdmDr38wHxRLXooe3TVKFExhiAZSsUn/NilMnnvxsSwm3VikZBiHM2eYFcxxefx3OLKNzwMKujyAorDuSMdWp52Tk3yKVpOIgIscuMTnm22nZypiJdPQfElXeKs9hFY1BkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBADCnhaYizNS39TwohjvL+FanbNOG+KxZbzevy7Olg=;
 b=FoG83MwvJgls0kLepScO/6r59wExmgn2t6t1OfHmwVqiUq30eydXMC9lYtecISgXyEzuex8ypBQDBoBHodSEdqHf97urIO7w871zkLo2oXNb0Wondusgai8lKf6oznKqsNGDPGNuW6ClbKa4veFNLyAJnFKH/cf9EmutMjDCptOwDByOm+x8Ro7ywfCCDGBnfA5GRJ9T0okieK5p8fgFzXyBneHCmfXcU2jFHf1f8cfDkXOWvw477flvO/qeR2WK0T2Edd92fC4a/f3+UBnx1DPhfYUErqLO2pPOHE8juJ1C2kFmsaYCwUM5yiob15ET5jmaxPDJZWm3ytwJ6WHAAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBADCnhaYizNS39TwohjvL+FanbNOG+KxZbzevy7Olg=;
 b=IXnYyM5Lkvz6EMo5abb18htdiHmjlf5lcTwfqQ8YDRpzVVlBXiVGdIvVTJiT0f0HfWvn/dJACRuPYbWA3RppzsQtnyPbsGD0euGMoSwWJxQIfWqPpTVgVlG3+mMz6gMqcNh2DEVwJ1fSUTR0y2xap30CUWXurk2O8Jn7YGTE1l7inJnId2YgDtxo+ehLSJ/n+ZVJ7AXYjkLiUKbrEMSleGCy5ESWTL8/BM7m2d2dSEKCrT4draYwqJtdVGArCAPdB2vN0rfkOUyaHkCmR6J/DJ9l3f1iz0GOBWLURKH3/zwFcKJK5PK+KU3yRk0RPU8y2HThiOyWNUWH8+27mCMo/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by MW4PR12MB5602.namprd12.prod.outlook.com (2603:10b6:303:169::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 08:15:52 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 08:15:51 +0000
Date: Wed, 21 Jan 2026 03:15:49 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] rust: num: add `shr` and `shl` methods to `Bounded`
Message-ID: <aXCLNRVGGqsYeiBM@yury>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-1-723a1743b557@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-register-v1-1-723a1743b557@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0689.namprd03.prod.outlook.com
 (2603:10b6:408:10e::34) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|MW4PR12MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8fe6bb-9841-4c60-63b0-08de58c54a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y48IRmXptjyDDfCxnr7058fzGO3Ug0PFhxECzfv3hQf+9yQ6/fc9SoezLWXg?=
 =?us-ascii?Q?G+fwG4hqTqKUqpmx0OO/jPTpWw6dSUlJvlYFK+8srwUACczq0Q3SWJ1uCFHl?=
 =?us-ascii?Q?p02RTAH1aMxPiAD7xU+PXyaW4HuWHqtU70/3eiFm8fFWfr5N2ZbNQe20NKA5?=
 =?us-ascii?Q?n0AD6InUS39UdmvModRGrWTQVJdzTImZ0ch8RlEuXGW76UhBSBfPfthl9Jcj?=
 =?us-ascii?Q?ayHZ5KjwvpPTJiVNmZ9HACmgwnSIvFTOwKX24Go2M7a/y9I0GXsXjZXqw3lX?=
 =?us-ascii?Q?sT6n/JBBT579JVbbJcWhOFhZnMYR8JG6c35tYYih/aErcW/WWmMPkmDI+6LL?=
 =?us-ascii?Q?Srdo1PaWrVkqAP3emILlJ+tHEgxbNbhCvTG3yVi9qa+BWxLRYw2uamm1YB7a?=
 =?us-ascii?Q?UjkuewbES6Erxp1n5y/B+mPGrHLy9MnMxJyP8MrGxRQQXQEgY88pEz1FmczZ?=
 =?us-ascii?Q?/RmsHW4vUswgk8l2MP1wy2RfaJxA3EVSaALAac4AQykXStlLLBMMTUsh1RxQ?=
 =?us-ascii?Q?PaJOqO+Tgu5KCZpzpjs0bpI4qqjt+QS2u7iK0VeOw8o4ohKtwke4JN5/KP2r?=
 =?us-ascii?Q?uNS2QRpyBg3gH+7QRHxYOPGVHk90h8xlSq0v1xOnM+/ZGDQt0sCDf1I4O+r9?=
 =?us-ascii?Q?lZoXdiofmRChYSJYFOyflBRFgm26MznDqvcgxw03tsrYRzmg9xejwpgcbceq?=
 =?us-ascii?Q?d5vAT3nDYoHVlaUNgzxYVdUvHYsIjJQxN/Pd2wQx/IKv63QVcc7/VTxBtII6?=
 =?us-ascii?Q?Yf2eOU5B9RkF5tjJPAg/7f86vP5P0+vGeO2VvANOXP8bvr5pimeMlfeUW5+F?=
 =?us-ascii?Q?cHT/cLc+SbekOw0UdjmkD/6qvVxBQXgf5vg2oSCzKsMk64mwMsLa+2+O4WLs?=
 =?us-ascii?Q?mbguYuokBlFmfQPozof7phXAeo3PwaMbRHHwZlWz6YoZqsr+cHNf33fuRbJK?=
 =?us-ascii?Q?LZ6EBvz4pSlblpB9QKYI3H63Aw1Eh5OvMh/cJGC3N7kGSjy7yU2xnt1zEFLW?=
 =?us-ascii?Q?yeIQODKazNWUYoX/rs55YXf3KtZf7MrFeFd4M2ui4tbdh/wo7dPgjEmuS33f?=
 =?us-ascii?Q?ZG+7fnlWixt3+bd88kVwtiGh+iywW68x9LAO8EjS9vAl/FhFAd1x+aTUKeM2?=
 =?us-ascii?Q?IgLs/lfeI3XXBByafxIvpPHQJw8591fkdOOKpdw1+fwTlek5EXV12og8PN6K?=
 =?us-ascii?Q?efiJrCT7ZpmIEDBtsLFXeJsLxEEiJFWAAMpoG9YS+MKT6tm3dBuUUE4RUESr?=
 =?us-ascii?Q?j1Ycw/F0OMFBT9fB1RwdAAfm1K2TEvI+t1zEJ0GEr5H3dEk/8XIz9z3fv2yn?=
 =?us-ascii?Q?/1wZpwS2695amqhH8yJbFMKuDUv3Sbsu7K+KNyb9dxa9oPU6ELX00xXnQJY2?=
 =?us-ascii?Q?ioQKmXj7baDLGEFu4XFyAYMMy4EMLYT/V4PAcGQf47TQFZdvClibiU0riiHU?=
 =?us-ascii?Q?CCoPBZ0/a2kFHkZcjZB1D4Qj1PMkO2JZSnyn+rDLm2ZDfqM3RMHbvd8QBQ++?=
 =?us-ascii?Q?yAtb0L5wBy0tRL6qoCK9cI25ndbkUFquVEz8+12RlYKQ4Kbs0jFu8o2JTSjs?=
 =?us-ascii?Q?9j9XSw2QiKuDb8kRkBk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y/6wOaQ1Gg4wz4E9kyVmtOW2Svtsk4H5yGy72id8E14npGXke5hijbEgIfjn?=
 =?us-ascii?Q?p7QymXK/gEkBPAfDW4W5MhaHbKzVL0DFSCVe7zqkoNp5i968/qlLTEaBXnkb?=
 =?us-ascii?Q?k12P8BW3cD20eDhwiZYnomVHBc+CsNApF9jPxm+3PditX9f+RpcFewzPB/6c?=
 =?us-ascii?Q?RujLOVYzMfepT2iLzkFX8UkcbMoy9sXheiNjk2ZRBGbVNNxJL8ziAwJLEfvz?=
 =?us-ascii?Q?u0DMWzMs5bnYeS3Brav2944ChYjc/SND2s24PPbFsQPO4gMHMUoGd3GRGsIM?=
 =?us-ascii?Q?/TBocHxMt6fBUOo/0Sx8H3thi+1hMYGd8GFr8FazYGtDjMca2Y6dz+uuksw7?=
 =?us-ascii?Q?ktSm4gmoRcyxSuvJqd2jKITGKOtNTP7Ccua6LzQMeYT+6NS4QYGly6O+cXmx?=
 =?us-ascii?Q?hNgo1sycg67+3LQTJB+vS/S3G5UNZt0nPozH7NElXAFB+HdvSNH/Dg8PiMsg?=
 =?us-ascii?Q?YQZe+ErDtc0HACD+6NTxL0JfSmEb4/GUGcH/BkMeKT/NbryFck1+yxl11NNd?=
 =?us-ascii?Q?5fwx6E5UyOOMmwWclFt4vFkjTKt9pLP9h62Zg7Ra1Ycx1VjyfKZzY8d7jayR?=
 =?us-ascii?Q?A0GehgO8SeBEL4j/Y974SZD9LycfM/+x3t+tE3rpmSHyoi7bIT5OlxFLDXgR?=
 =?us-ascii?Q?p9YaKehvbtT7C+BnLeOkVIJnlv7NiVcccbbjgEMYVVhnU3tuWyK3NBL59Evw?=
 =?us-ascii?Q?8IKz6Em8ua6MlhBX9rGBvaIJWSYBKjYhhzyZsaQJG7iS5TSMDjEESBW6qZbA?=
 =?us-ascii?Q?vnoT3zSYTIP+xZcXkvABkZVjhRbNMX1UWPEtAJMXQWHfTX/jMsuzUVCVTDOH?=
 =?us-ascii?Q?a0mf+Y7q1sAWlKy+amrhtSq25M0OavBXu7ueJqO5FI/WN6oxJDi8bHevOZIG?=
 =?us-ascii?Q?3mEiV4w6kmgRL/5XpqFBEi7dMM1TA16G8L7P0cxHrDnayRRaCOGRqpei5I8B?=
 =?us-ascii?Q?cd9uJe+WsSKIhQVaupP0RI5I9EL6VdvXpR9WV0QQX8AaWTT86NPIknvgMwAg?=
 =?us-ascii?Q?pr+FhaeHJduACKnFyrORndOXWbHQ2VT+LjtTJw4AXurQlb0zslR6avQjQXhh?=
 =?us-ascii?Q?HVGvcr8eFpemdyoJRVF0tg1iF7EDJxaI7c3Wm6bQ/vUBAE2QAqDmwMeODjMg?=
 =?us-ascii?Q?U+Yst/T9djIRcpaUNvbOr0x5pkifDSrCgR77we8G5yfuAy2p2Ds95jRkSfs5?=
 =?us-ascii?Q?N70g9PI0fgzTUIoDUZiLy5fCRb7vpaAnW3tVa4qmjdhWW6iUPomLyYSRPTnO?=
 =?us-ascii?Q?WY+l6+G+UIhxIzzvqSNCgATI+6Np9Et98NrdKWya6k5LDIhyYcrQ2Eu0RExT?=
 =?us-ascii?Q?3zTcXKfup8cuuI/a2Nr+8skxjWA1Z4YFPRT1tQDb63PqCV18XEyGIaRu4NQ5?=
 =?us-ascii?Q?Kwh3Fyq1FU2xOWa0RlQFx/17U6PrqjJhrdVRAr6m7PuxPOltR56javotENBv?=
 =?us-ascii?Q?6DGYiytYLCzc7bb9RU0Re16lD1lQexbb0neh0xZYfp2ryLm6HRUYAKHvHKNJ?=
 =?us-ascii?Q?hNYC1n2NNCSbEG495QR+MfkGvoEo3dwLoPrSZk0+WhBQytNAsF/P7/91RDfP?=
 =?us-ascii?Q?U8K4Myo1zBXbg4tamyVybc6y4cYKlZPjortICDFhpICsyizTNQ+AAjlQkRPe?=
 =?us-ascii?Q?5gOLm5zpVilGlcLumavTxgGqWlx7y8RqSwZTD0kJwjhp2E/ugZ6p3USKrsQy?=
 =?us-ascii?Q?HpfpeBmeNIjO8XxbUw1hocruZtB+3G6UUyE+PAejkpX0mkswxNntTX9xAYPI?=
 =?us-ascii?Q?55V/adwogQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8fe6bb-9841-4c60-63b0-08de58c54a88
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:15:51.8704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJco++5IdLP5YhCr60c2zchWTUBMH7gs5h3sjM0ecOwWYQhn25FsVk3e0IyzCA+WeZQaFfgfmJVpTR7XAucCrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5602

On Tue, Jan 20, 2026 at 03:17:54PM +0900, Alexandre Courbot wrote:
> Shifting a `Bounded` left or right changes the number of bits required
> to represent the value. Add methods that perform the shift and return a
> `Bounded` with the appropriately adjusted bit width.
> 
> These methods are particularly useful for bitfield extraction.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/num/bounded.rs | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index 5ef8361cf5d5..6e3f4a7a5262 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -475,6 +475,46 @@ pub fn cast<U>(self) -> Bounded<U, N>
>          // `N` bits, and with the same signedness.
>          unsafe { Bounded::__new(value) }
>      }
> +
> +    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, { N - SHIFT }>`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// let v = Bounded::<u32, 16>::new::<0xff00>();
> +    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();

This syntax is really confusing. Does it work for runtime shifts?
Is there any chance to make it just v.shr(8)?

> +    ///
> +    /// assert_eq!(v_shifted.get(), 0xff);
> +    /// ```
> +    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
> +        const { assert!(RES == N - SHIFT) }
> +
> +        // SAFETY: we shift the value right by `SHIFT`, reducing the number of bits needed to
> +        // represent the shifted value by as much, and just asserted that `RES == N - SHIFT`.
> +        unsafe { Bounded::__new(self.0 >> SHIFT) }

Assuming you relax it to RES >= N - SHIFT, as suggested by Alice,
you'd also check for SHIFT < N.

> +    }
> +
> +    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, { N + SHIFT }>`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// let v = Bounded::<u32, 8>::new::<0xff>();
> +    /// let v_shifted: Bounded::<u32, 16> = v.shl::<8, _>();
> +    ///
> +    /// assert_eq!(v_shifted.get(), 0xff00);
> +    /// ```
> +    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
> +        const { assert!(RES == N + SHIFT) }
> +
> +        // SAFETY: we shift the value left by `SHIFT`, augmenting the number of bits needed to
> +        // represent the shifted value by as much, and just asserted that `RES == N + SHIFT`.
> +        unsafe { Bounded::__new(self.0 << SHIFT) }
> +    }

So, it protects most significant bits when shifting left, but doesn't
protect least significant bits when shifting right.

It also makes impossible to left-shift Bounded::<u32, 32> at all, or
shift Bounded::<u32, 31> for 2 or more bits. This doesn't look nice.

At this layer, there's seemingly nothing wrong to loose bits during
regular shift, just like non-bounded integers do. (Lets consider them
naturally bounded.) At higher layers, people may add any extra checks
as desired.

Even more, you mention you're going to use .shl and .shr for bitfield
extraction, which means you want to loose some bits intentionally.

Let's design shifts like this. Plain .shl() and .shr() will operate on
bounded integers just like '<<' and '>>' operate on non-bounded ones,
i.e. they may loose bits and the result has the same bit capacity. (But
shifting over the capacity should be be forbidden as undef).

If I want to adjust the capacity, I just do it explicitly:

    let x = Bounded::<u32, 12>::new::<0x123>();
    let a = x.shl(4); // 12-bit 0x230
    let b = x.extend::<12+4>().shl(4) // 16-bit 0x1230
    let c = x.shr(4); // 12-bit 0x012
    let d = if x & 0xf { None } else { x.shr(4).try_shrink::<12-4>() }

For b and d you can invent handy helpers, of course, and for a and c
you can add 'safe' versions that will check shifted-out parts for
emptiness at runtime, in case you need it. 
