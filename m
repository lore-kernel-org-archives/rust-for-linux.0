Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022103.outbound.protection.outlook.com [52.101.96.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D201E5B7A;
	Mon,  8 Dec 2025 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765200440; cv=fail; b=SG5EvpK8NPsNhLqYaZwqo1AD8Se+VJDl1AaH4XgaHYfAliP8cGmdeIHbUCYsROCZV4paoLPCwOGESt7iT2PFt6AMajmjzcSFehsxU+dC9YXRZsELlapz8FM4uyt3Btijh2nEYQCGHrGTy75h2w8XsVFbEIBDhUYKXef06hXSMLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765200440; c=relaxed/simple;
	bh=Ule5+PYTPhufVYPWtSWT5do5VvDTzJ/ZdDkte2dAHXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BfKY9DSKxXQu4YD+ErflHTt1gQJHV4Zh41dpmLAympqihiWH2gbTtF59L1iZFU0t67bkaQBREUCTPkrTmQbadR4pXMerr1eeXAS7HkLW4Mtr9u4e9EPw9F+CcStEuJgGMTrMH+ImVN8I9V1xxSGa1V3r/Dt9PBtypr+hTCPZjnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=EhP24hpn; arc=fail smtp.client-ip=52.101.96.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="EhP24hpn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzbg5N02YrAcs117t6IVyTlwD3K4CJunBr11CaHnIIUruczg+Uxq2SxOTEJJTpgapBo/rUF1wggWBbRFEyFgQyTt+v0WGtv1TgVHXhQgb/q+RY8hfS5MegRLIWeOgEGSaun1u/uRTz7P/O57l/ybMo5DTVRRW4e+Eko5wcpdPgnHN9G4Wg9z2Qx3rYXCiKZtElkjpBjBgg1Fn6CZH/p5RbeLBSVNNPSduMNJ9HEhPdn+/UaylRFF2WnnrUrtWn1KpUfOAaTRhpP/KlKeDUI1rDWCrEF4+tmb1Zr75dL8jkGwDzVUlB2jV2BiWLkytM6sNvkEjXijL8eF0MUkZ/OXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/sieeOpyZ6cUqKFLF/JUcO+/HbFeAb6FVuDl0Gcfxc=;
 b=r2llm5o7AfKxD1Nosu476K9/98jfhw1oGkwTPVzfOgMjo0Kcqsg5lIXFoI87X0Y61LUnRqrpOGJjEkZyUFa5Gx7XLijCJb4QgFKeLbNBDMU1EnFTOrqzB1I0XLhnLvPwQsOV1wbFsjM34xzHFfHal/iaN5SKgnJ/zHHvkxVwE9C8Z3DZ53eOO6ehAaGVzudhwzpj2I3NYg6TlFJCK32uSW0HK8ZT3tvRvIF/gc74IezUaw/ZxmC7uiBzBX+AzmPyR4j9sJD3MNx/oSVPIOoVdLZiygh7uj24w7w9V1vxOgPouuojxOHcYm21AY7TY3YPFZ4O/6lTRq8TScZJjskOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/sieeOpyZ6cUqKFLF/JUcO+/HbFeAb6FVuDl0Gcfxc=;
 b=EhP24hpnueU2Kh1bjvcjLG3f57YtSs9hDvQXBQaBIh+YU8TFQnU++FV1kO9j3avpcFh7qb+2FsDIh57UhjISkeWMILxQV/czdNgQYLfOhspkH/8VXrOe/SPNG7gEBC0UWY5CQhUm9kaE9aVMZeVkVWKARQFds0knOtgStFqZrXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LOYP265MB2384.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:121::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Mon, 8 Dec
 2025 13:27:10 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 13:27:10 +0000
Date: Mon, 8 Dec 2025 13:27:08 +0000
From: Gary Guo <gary@garyguo.net>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: transmute: implement FromBytes and AsBytes
 for ()
Message-ID: <20251208132708.4acbc440.gary@garyguo.net>
In-Reply-To: <20251208-transmute_unit-v2-1-aa17a6848afb@nvidia.com>
References: <20251208-transmute_unit-v2-0-aa17a6848afb@nvidia.com>
	<20251208-transmute_unit-v2-1-aa17a6848afb@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0138.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::9) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LOYP265MB2384:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f1c582-c6a0-40b1-c1a5-08de365d7d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kjYEJTm+S8m4cZScFgSWb0zTHPiRhATHGepqzMHOAsqwuz3t3LFn4uYzgQPt?=
 =?us-ascii?Q?ttACu2B2JzNK11ijc1jwjFyG/P5IeXfxbC1YgIqlGPcriDfErzP0kh9g73Rr?=
 =?us-ascii?Q?Yk44Tt66s6HU2ptdFjhyMhLUyIlMlVThOPWBqBiVMV1ta9/zX+Qj6F8R5HqR?=
 =?us-ascii?Q?vhXl3SBzvcbqcO6c356isGV7GWCPGGFqtZcQsixOblRUDBfjsAisfOpAzdCi?=
 =?us-ascii?Q?NtT66l9U68mGfGT70wnv/TgooPS04W3orfezPqAFGm85fThDT904xI3uP3jN?=
 =?us-ascii?Q?8TlOZk8CTen7ylvrh290CpVzPs6QwiioNhfNwm3a1aslm3huQ5YqWAx/4OZn?=
 =?us-ascii?Q?3VsjAHyVp3RCPPm/5o1g4TMBHNf3mP3Ox+/l2l5G+28ISyo39KbpB/tr3e0c?=
 =?us-ascii?Q?XoJ59nhsYkYF0sdqrGs6rEDM8YoaRPR4CpsHeSBXr/sB5PliWHm9fRHRrJgg?=
 =?us-ascii?Q?n0O9hyxqjsjT86NdsGfmIOILy652DcZf0MYHaJWmjdcBku9xqQQliXSGSXFR?=
 =?us-ascii?Q?R5uuGqtN9Kkh2WVfEtf09+KtAQ2OvW9WyFNNnWmdpBvaXdZYWZBfkCfejpBs?=
 =?us-ascii?Q?3xQo0MdYLcYn0lqimx0H/+QKWM7xFYPdCZmLI/yzD4syNxobbL8mBrKLbEPS?=
 =?us-ascii?Q?I7+aCneD5gHvHeGBQOeNJs3/v1NVN3GZcYo0I0C2umB/fk84iGcyN1SLwxua?=
 =?us-ascii?Q?VAOJZQ9RKxyS4t9uyanLzYCzee8ys+at2IDBVczhuOKXoHrReqNejwDjwBfE?=
 =?us-ascii?Q?VAYe7B8aBTLYheSsq3T3Y/hZWzK4GpAH5v7mdQoBpQQ2DTisofbWwX+hQbCP?=
 =?us-ascii?Q?fgjLGoyS4TA/DliCU+noCAEnz+DtAJeGd8+xAnwQ2LJH6yzal5FOL1IMXcxV?=
 =?us-ascii?Q?dJksKKheavdvZzf0bBr9Bq6woxuBtZlM0vg9KFlfR3+lPapUv4s6pgR3NSQo?=
 =?us-ascii?Q?iM7q1ZSZdt52G/q9UQErSV63IdVn/bQqU7Idon4N0zlPQA2riR1oga3Pr6Yx?=
 =?us-ascii?Q?dIH2jLbObUtiBtnJDu6LfpgOrG5U2ynhPnF/amTbGTLR3NFi2xWJRq4zJook?=
 =?us-ascii?Q?uHWJNbUj63Rn3Tzmh+MrXm2dLfbHW9TpIyS0NM5Alif2zm5BbK+d3ZkduBd+?=
 =?us-ascii?Q?ROIV6jQ5JGxMA+/v0sXPrOLBaDeAOitrbeHbmCz4EQhLDsYsd95HWSetdw+0?=
 =?us-ascii?Q?A28RrCUU5naNmO0H1Zb/hLMt7yvqiTT4ErwOQZQOU7OVIszyGxvl9X54/qU5?=
 =?us-ascii?Q?76s8CnXUKIDdnjX4XPkuHQ8wQ3ARtafDYh4AQAJBb82BLNYjtyG+DrrFBI5y?=
 =?us-ascii?Q?oE/gZ701TIjWNLBGWyHOeUPosO/lf+HYeV8iYw08oa7WWy8KZ2lWfdV6e5OH?=
 =?us-ascii?Q?dOH2x4rfCKjjFfuU3MkO87nB/ZkuZaXzTk96hml6nl+/LjW7dpMKrWccyNpo?=
 =?us-ascii?Q?1jc28/bFqg6V9RwxtO1pVLCawhs6VO8U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KJs+1adwlGqCqxU9YfNgznHukaECpU1uy7GNcROfTG+2KL4XCHfAefjiq9uB?=
 =?us-ascii?Q?6feks/PlAEvvKeBejyGJEcsTSwdsFjRMhBliYiUocESJyUfXWhSjoKIRn6xv?=
 =?us-ascii?Q?1j6nfTif2mQ7g2AauRFlv7/d5buypQMoVtGoDWsGlAcV+fqmLVaXgXA28Rjw?=
 =?us-ascii?Q?T7gIRRPkBNLkJ/ADZFHfmt6tXACwTOYc722Tc2WDd1W0lkOF1n3qEfgY7APO?=
 =?us-ascii?Q?dueRPQfvPKAcN/q7sT7WxIS/A+5XjXBg0b2CARJcupkcAlX1pJNfyaDdyJWf?=
 =?us-ascii?Q?10OJqAiqTeTB6cVcu3GBzraV0wXja8om8vk+ysSqpuZkc7tn6l1V6IJaGZS4?=
 =?us-ascii?Q?shURLCT7UW93/QiLPDsKqCMvt9cnXBLblN6ipvduobahCChdB1fJvpipgZZQ?=
 =?us-ascii?Q?ChbXusRuOf6hraTtVCfR1ZchSl+FptiAOkfV5KqPFz9B7/G68JYT/pqPqYgD?=
 =?us-ascii?Q?rLcCKSf08d3xiDNrdThc9sUMIFh5UnxkqMKM3uF6fv1R48R55gg6p/5LoyAh?=
 =?us-ascii?Q?iAJEMo3IcmWvzt8yBocEvXjPks4SKYDBJ0eJk4DYAEg3zMPLbF2OWiOJmpju?=
 =?us-ascii?Q?Knd/PVaQMc3+1sZ7aNMZ0e+0dJNMe6fgJVMPlr632w3avmXZHic9Ef9mMHEW?=
 =?us-ascii?Q?6q9viY2a/ZwBM5BDxIaNpMNNy+8I9Djeb0Dus4oXzxQYbh3BXL8E4sNoByL5?=
 =?us-ascii?Q?EwmIEcC9oUzDDVU4D3pIUaqGKF8N22PRlq16SnG6lyCPcntZZ6FujEwrxRmF?=
 =?us-ascii?Q?gF/bhmc0oqD86LkZXufAnhxtOjjKW/TlZmmw+L/l0cYtjPID39fg5m4d2FXE?=
 =?us-ascii?Q?2WfXsq+pdS72HPqGkrTv+WEw4fnDUFF6vTTytl21HnDJz0xqGQuvu/X0S0DM?=
 =?us-ascii?Q?RaY94KpVjI+zz1fkm9vTrQQOT+NKpDlt+Jo5v61jFNdKc/h7C1XCD2sR1P0N?=
 =?us-ascii?Q?9coo/9qEqhr6WYKQDmWwY+z9H/7cGjqpaiCq/1b27ouIN5uasAQUgJIybwvk?=
 =?us-ascii?Q?N00UOcLmRMvmjGQp6UFaP3a1wuTVCYJMuxwmjQS+I/5tv65G3voW2kRFc85u?=
 =?us-ascii?Q?b/zFsqvqh9MJJE4HdAAdz5cbUdKP7KIUuNiSYW5Fb/uzPgVrRMJY0uFz8qHL?=
 =?us-ascii?Q?8x5MpysjEVUwJPcxTSPCtYO/lg0R3JEWB5HP3bFUKmN42NAVRsVEGUi6q/zq?=
 =?us-ascii?Q?aa3YinqhSBLL/vHWrW4KzBkoEPq/0BkvKyCASVpou2Vb1JTDEWew77lps58j?=
 =?us-ascii?Q?CwhHGZlnFwHY6Idr6qRKTWVD5Qep/5irOoDmLHM8IUJ+jZL9iEjJ8lh1w6gq?=
 =?us-ascii?Q?991Pu+QVDj68EGobtbDRvPDmfn2jgf1EdLdnifNbSzvYBVJmLWnwwxSTcI1B?=
 =?us-ascii?Q?Fk4hbF++bA1nzfJ83vhGzyrONnvLbaIjdCrni0xDIgTpbnQLGGMSGQ4Zeu6K?=
 =?us-ascii?Q?r25qPgNlGSN4M8Cvy59yiRTPIoHLTlDTmfaBmbgCZgHYOXhqb19YwVxSi2LO?=
 =?us-ascii?Q?AGSZrSGlUYj0wpFhvB7FiYSuYYi0zKvP+zGzzfe98dXwQyO8xYeTVIzZAMBZ?=
 =?us-ascii?Q?u9USQmJZdvxQWKcfUFXsIw1sDyeo7Ii42+BwREk5?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f1c582-c6a0-40b1-c1a5-08de365d7d99
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 13:27:10.2652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Afg/LNYJ6PvBB8peVARst7JYQUM5dLfxSZc8l7sI8T+rCX2ms6PPGeC0PmW6s0LHktfskU/oSotANBvUVdAFlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2384

On Mon, 08 Dec 2025 18:54:40 +0900
Alexandre Courbot <acourbot@nvidia.com> wrote:

> This is useful when using types that may or may not be empty in generic
> code relying on these traits. It is also safe because technically a
> no-op.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/transmute.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index be5dbf3829e2..8d78c81e3749 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -170,6 +170,9 @@ macro_rules! impl_frombytes {
>  }
>  
>  impl_frombytes! {
> +    // SAFETY: This type is empty and thus does not consume any data.
> +    (),

I'd avoid use the word "empty" as it has the meaning of uninhabited
types (never type) in type theory. ZSTs that are inhabited are unit
types (or singletons).


Perhaps better to have a justification that applies to all inhabited
ZSTs that don't have special semantics. Something like this?

	// SAFETY: Inhabited ZSTs only have one possible bit pattern.
	(),
	{<T>} PhantomData<T>,

Best,
Gary
	
> +
>      // SAFETY: All bit patterns are acceptable values of the types below.
>      u8, u16, u32, u64, usize,
>      i8, i16, i32, i64, isize,
> @@ -230,6 +233,9 @@ macro_rules! impl_asbytes {
>  }
>  
>  impl_asbytes! {
> +    // SAFETY: This type is empty and thus returns an empty slice.
> +    (),
> +
>      // SAFETY: Instances of the following types have no uninitialized portions.
>      u8, u16, u32, u64, usize,
>      i8, i16, i32, i64, isize,
> 

