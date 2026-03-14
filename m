Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020118.outbound.protection.outlook.com [52.101.195.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A2214A4F0;
	Sat, 14 Mar 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773496397; cv=fail; b=k2h7YGdhjwolGdlexj0Mq5EsEKgGaZfybOebpdv+l2Mke8Vhlc728S8zj1xF3eKwyM1Axv0+X7r/MTnIgYUWQP4YUpTGJFEeAqXVbp+jpFomHB1SxNCCXbXdfRYsn8Ez4x2TuloCPYhG+HIRZnmF3KdZqZyZFtPc7xY/D83hDus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773496397; c=relaxed/simple;
	bh=YruuRPskSw2iCHUGTG6s5OQmojx6iCq/447h9J7xmMU=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=vBk++nlIrDDC1ZrCf9TyOcooSFa3rPd454SdW1LOQnjBqQwtSn2+RYYW0oC3I2DgarnI8R7l+cZje9OFQ3VVMQazfFgNgAjQeE0AONCelLoNqCJ2bwBdv0AKproq0w0WvojAm9ZS1M/CKO8KvO26UoMxzlaGaO24LXH5XF4mIYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Cv+GAuq3; arc=fail smtp.client-ip=52.101.195.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Cv+GAuq3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJe/wPGgRP+p5gjZmuk0suA44qN1H7SjD8XbLw1O/dW4ajqphfpMBEde2K7y8Q1M0NAknEwlQnWUu/wlcdlnz3zhP94k5a3um4MvC15UzltVJZMw9pDrKm56Q+0dCerXnhp1U2gNIm6gB1MSS63/cVYZownRxFPqRpE0iykdTKqhxsILe9c8nULnAoYRlFDm3AWDJR+j2HMcj97bzUOEwMg6ik3QIvBUnJtzawsOHvOGeJDY9mbP68T+mqJr6Hf+Ikg7E32N1GALyBX1rJdiQaihrbjLhBev+w8QI4o1xRWfc2I1ThtsQcR0BP6AFVxl77Oy4i/X5EpdmiDd9wZrMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmN+d7V5VLSgUkYP8SYTIZr639pwhzisY0XWe1ebLH4=;
 b=akVETq4aeAHs4JLYyXp5ZtMsxmWVZBtOhyAtzpcSN0DlQQbbyX5uIy/bLKgGlJJ/xYVO2BHUTb95LkjUWHzg+mL5+IfusmPzGxDFfmHCt1LNY7mlIi92B2OFbvUXFm0gT7y2lKTSt0cIiQvlIt6KJ43TkHw/tzYPewsWH51hVlIN4E7bgVTtg7NWLB4LJ6wlZg3+H+L0x3fuGRI0zovm17OMAhX6ZgSd2U2gIpYUvhwepLpuyzmVo7l6b5H989WLTqCmdY3uB0OEpuDzUXr5ybQvECJf8lxU+ZoJMHNywuKJgQvHALadibXC1mTzeJQ7Pef32Vcci8W6tegrWV0ExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmN+d7V5VLSgUkYP8SYTIZr639pwhzisY0XWe1ebLH4=;
 b=Cv+GAuq3SAtWxtyQBXzz0J8VIjMpQIvNiwzDMwtjjvr81h/tCunRHojng2F3sH47rGI6NusdTtOuk3Z7+bEBDG8TuOsX++bZNDESawuFPAhVgYKXow1I9tFmzTX0YF0D5aeYI2B5vhu6EJRzU7CH9v6WFJERlMtNam/6wcqW+9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB1801.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:fc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 13:53:11 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.018; Sat, 14 Mar 2026
 13:53:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 13:53:10 +0000
Message-Id: <DH2K02DY7LE6.37KHEUWEOZMRR@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 07/10] rust: io: add `register!` macro
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
 <20260314-register-v9-7-86805b2f7e9d@nvidia.com>
In-Reply-To: <20260314-register-v9-7-86805b2f7e9d@nvidia.com>
X-ClientProxiedBy: LO4P123CA0607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB1801:EE_
X-MS-Office365-Filtering-Correlation-Id: c98497e1-2d04-4b2a-e986-08de81d107d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|18002099003|56012099003|22082099003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	95l++u1bHv7LHrmkfUPD4s7yKcYhQWN2VcWGrfrlo8kMk6s+aSNRBtNHAxD+PR4Pp8rJ4/ftNgm9m49pvcOor7Q+I2U2uKR9wNYIbptp3quYJVtkQZWtCWyR7ZlVIns1g7AtIgq43dIqucrbechTxWm5efeMUTY7yRpTmtHzJYB2xYCUbd2go+ymXiIdR75lTaXudzFWKoZ0GbNwtWrq7E25HxTQ3xDdzdlmvFAf/K38r9b2hwYl7FQByY+PX3xsQKiOEAubsHuPhC3fpqPueIpQVFTgLQpNzv1HkJeZrw0+k/oHlMR820f6WS+zzn8riZcotJP5/WukFMIvzV9/i+rzDRpoq3A5WK2wef986A3B79FdEfN9ipoEHGrrNh5ph1tUWvGJt21veaZqIfmieuFT3yoyk/Xh70SEXr3m7Ww8A4Cc3h5btEyg7tMFnkJdEHWpAmhQVoHLYD7gEcbe5zcs7gytNSRl1aU4BO1qfYMOvFktP8U1h1Vkf5bbpm7ekeirXyllQ2QK445RWxljUg6rB6WUnLnLo+rwwugs3gBqlezTer96wNx8v+g0gNVPBKWiAnV5NYuxFFqHNVBIMbvFqXFv/VgG+YBHLF4yZkDdmUzzrgIIczMJTnVlQrYVFt16ADD1TNn8pXY3K4cF9wiQu4Wj4Tjfbvn4u54bn24sDW8ZAV+olE/SwPBGs3qcrRaC9UuzfWMNRhM4wtDDcZFdWMn/ikyE1eS4pMavgS6vMIY9hBfJ4Cfc/RZn4pXniAIBx4/k14zXSGG63zMrhW3NaoXVlvKT9ts0YYSgxws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGZXZEErQ0xqKytuaFp6VGdoLzF0NE45YmJyWVVqZU5RekJXKzVCUytwMUdt?=
 =?utf-8?B?R1M0RHlDQTBocElXNUZjSFBoUnFaWUJCVTZkNFhmYWZvamswaFd0YmNKbUpw?=
 =?utf-8?B?bURSN0dmZTJpYnMxZnVuY1hjZkZqN0lNaC85TTBOdTRwOFdoNzRvS0llRjBj?=
 =?utf-8?B?VWJZbFByVU1CQktzMy9PL1BCa2dxQlI4Z3dqQ2dCUkswaXBDK2dsUTZ3N292?=
 =?utf-8?B?VzVOUkdtT3JVaDNseitVQ29JYy9CQWV6S1huNktCcEdZUzdqTklidEc3WW5X?=
 =?utf-8?B?UnRPNldMaFVsOTB2UllqcnYwOVZzUHBnYklacmphN2JORmRIMHpVSm40Mmx0?=
 =?utf-8?B?THlzL3ozZ2lScVh4Y1hrbk9ha3FnN0dvblIzN0kxeG5uK3JLZGJPNXJZRTRZ?=
 =?utf-8?B?OEV0a3orVldwMDZUK0VjdmdzRS9EMlIxMEQ3dEd0Ukh4SFQzVTFUQ1hDZzAx?=
 =?utf-8?B?eTYxVlhBdUpuTGtuNTJ2VVRkeVNDOG4yV1BDQk9QV0VQQ3l1aEIxNXpwRVNt?=
 =?utf-8?B?KzJLcjViYU83KzBoaDFJald4dnpSTWRzcGFUM0lBM2xWR3VOUUxkTWxUbkVT?=
 =?utf-8?B?bkxueHJZRVh6ZGd6ZFN5NmFoUlhJUU1WU2cyck5uSkRTdE9OQ01SUzNnYnJ4?=
 =?utf-8?B?amZqeW03QytHa3NFa3A3dFJsTUY1MDltS2U2RlBFNDhQa3M2ajJvOUZkKzBx?=
 =?utf-8?B?NGY5b0NuRm9ybVdUS01xV2pJR1NOa0Z4MlNmQzR3K2x2Y0hLVTVoTlIzdnk3?=
 =?utf-8?B?YVJjd0FZNDY1dktpUng4RFhqTjlNTGprVVpaSWE1NHdzWk5UYW5KclIyTmpZ?=
 =?utf-8?B?ZTZzamJLNDdXWW42dVR6cFlzSDhkbExsWGJ2alhyNkVxU29kVEpOM1JuM0Vl?=
 =?utf-8?B?S2dWTzBra0w3ZTg3VkZKRU5kZUtxQmZ6N0hIalAvcjV0MVBVMXJNcU5GYy9C?=
 =?utf-8?B?WW1mN0RGMzVXcy9aT2V2OUgvSC8vVFMxTjc5bEoxSlpmTGVKeVJEOEE0Y2Zu?=
 =?utf-8?B?T0Z1N0ZWUmRUYXpoR2VVRzZhdVdSaUJLTmhwRlE1UXhhcXJ0V1FwVzlRQmZy?=
 =?utf-8?B?MThRTWlNd29VODNUeGFJcVU5MzU3MDE5SGEyUjREQlcyUWtnN1doK0pySG8x?=
 =?utf-8?B?N3BJQVJFSHlTdjVCdXNiS2JIWG1HVFpzTnM4WEhUTkJYWitEQlNYMmdQV0Zh?=
 =?utf-8?B?T3VtQ3pIRXZjZVNrQTNiRGprTlgzTWg3b0dyNmZCSjZjK0pkVWI2c1pCSmhW?=
 =?utf-8?B?bjQvS2ZidW9laE1lbm9pYW8rVk8wc2plWDRYc3puMXFRT1o1Z0lTbkFsYVls?=
 =?utf-8?B?eUVvQ3VjVEVCc0c1bG5rbFI1bk9yVWt5d3dxSUJuTUJiVGNxRlFYdnl6NDNB?=
 =?utf-8?B?TC83VFhWdkdTS25POWFoYXJVYXEwUTdwbDZHVTZoaDBTaFNzUW9WUm4wZ2Nn?=
 =?utf-8?B?NTM0aE1RWWpuNis5bHlzM1diYW41Z0M2elVjdkhFZkZoUGNWcDhMc29SNlND?=
 =?utf-8?B?Qk9pV3AwWGJnTnhWRGdsK2Y2R0F6dzhxOTNaSDgrNFV0RU8zWnFiQnlyaGRn?=
 =?utf-8?B?V09Cd00xRjh5TzlNQnlIbG13Ni9HM0h4VmU4NkxuOXZlaDlXR2Q2NEQvek9j?=
 =?utf-8?B?VmlvcjlEYlQvWno2WGhLek5ZMi9PR0FXRVFaNzU3emM2YWlnOXl5c2ROS2dl?=
 =?utf-8?B?RGNnMVltTmlYdFlFMW9mcnUzRjlyMUN6aHJCMDNqdnAwWUFRRkRMRmp5V3NI?=
 =?utf-8?B?MFd1bXN5b0RpT3NJOW44bkJJRzV6OTVoVmpMb0NBdVYyWkdTd2UwZ2dOeVVz?=
 =?utf-8?B?U1dZVHVxZmt2Y2NGMVB1THY5QmZOSTMvZjN6V2dKWnpSMFE4blpsTE1zVno4?=
 =?utf-8?B?Z0ZpbUx3VGdJcUd4eTJnVTVMQWpMRmQ1dXE1Z0cvTFErY0hSYVpjazNXajg5?=
 =?utf-8?B?RktmUkZ3alFnRVhqOCtielNwOVUxRzFPMW1JajVUQVptT25SZkcyQyttWFlV?=
 =?utf-8?B?cGVLSDN0d0Z6d0dXRldoUnBtM0JLa0gzamZBbFM1T21LbkMvQnFJenUyZjZB?=
 =?utf-8?B?RzRxek81YXo1MUNZbklSM093T0Z2TDNzbXhRQkRZNGRDUE9jczh6b1hmRGNy?=
 =?utf-8?B?a21NTGhqOGliYnNhZjFtWW1PNzY1RE9RTk91TlFac3d2V3R2UHVsMkpNNWdJ?=
 =?utf-8?B?am1PdnNYR1h4VUhqbDZHZjlUbjQ3alltV0FlWkxlVUxQMkpudnZudGNDM3lQ?=
 =?utf-8?B?UWtoenFxb0l5WnpXK1lHUnFoYTVCQVZZZ1N2WXM4NEdmL0htdytnTVhLL043?=
 =?utf-8?B?Z3NUZFN5aW4vTHpnblFISHNEa083TFNCNnQrckp5MFFxY1l1SDFFdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c98497e1-2d04-4b2a-e986-08de81d107d6
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 13:53:11.4046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HeWE3Gk7gT1g1cd1/e9SKC8COOOrat7o3OEGYNRmT1QqABtqtAJSFuGMYwdmH6GkVon/coYkA89DKNS1ne+tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1801

On Sat Mar 14, 2026 at 1:06 AM GMT, Alexandre Courbot wrote:
> Add a macro for defining hardware register types with I/O accessors.
>
> Each register field is represented as a `Bounded` of the appropriate bit
> width, ensuring field values are never silently truncated.
>
> Fields can optionally be converted to/from custom types, either fallibly
> or infallibly.
>
> The address of registers can be direct, relative, or indexed, supporting
> most of the patterns in which registers are arranged.
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://lore.kernel.org/all/20250306222336.23482-6-dakr@kernel.org/
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Mostly looks okay, a few nits below which should be fixable during apply ti=
me.

> ---
>  rust/kernel/io.rs          |    5 +-
>  rust/kernel/io/register.rs | 1227 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 1231 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index c9d43b1372ab..bfea30a9acdf 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -11,8 +11,10 @@
> =20
>  pub mod mem;
>  pub mod poll;
> +pub mod register;
>  pub mod resource;
> =20
> +pub use crate::register;
>  pub use resource::Resource;
> =20
>  /// Physical address type.
> @@ -179,7 +181,8 @@ pub trait IoCapable<T> {
>  /// This trait is the key abstraction allowing [`Io::read`], [`Io::write=
`], and [`Io::update`] (and
>  /// their fallible [`try_read`](Io::try_read), [`try_write`](Io::try_wri=
te) and
>  /// [`try_update`](Io::try_update) counterparts) to work uniformly with =
both raw [`usize`] offsets
> -/// (for primitive types like [`u32`]) and typed ones.
> +/// (for primitive types like [`u32`]) and typed ones (like those genera=
ted by the [`register!`]
> +/// macro).
>  ///
>  /// An `IoLoc<T>` carries three pieces of information:
>  ///
> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
> new file mode 100644
> index 000000000000..40085953c831
> --- /dev/null
> +++ b/rust/kernel/io/register.rs
> @@ -0,0 +1,1227 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Macro to define register layout and accessors.
> +//!
> +//! The [`register!`](kernel::io::register!) macro provides an intuitive=
 and readable syntax for
> +//! defining a dedicated type for each register and accessing it using [=
`Io`](super::Io). Each such
> +//! type comes with its own field accessors that can return an error if =
a field's value is invalid.
> +//!
> +//! Note: most of the items in this module are public so they can be ref=
erenced by the macro, but
> +//! most are not to be used directly by users. Outside of the `register!=
` macro itself, the only
> +//! items you might want to import from this module are [`WithBase`] and=
 [`Array`].
> +//!
> +//! # Simple example
> +//!
> +//! ```no_run
> +//! use kernel::io::register;
> +//!
> +//! register! {
> +//!     /// Basic information about the chip.
> +//!     pub BOOT_0(u32) @ 0x00000100 {
> +//!         /// Vendor ID.
> +//!         15:8 vendor_id;
> +//!         /// Major revision of the chip.
> +//!         7:4 major_revision;
> +//!         /// Minor revision of the chip.
> +//!         3:0 minor_revision;
> +//!     }
> +//! }
> +//! ```
> +//!
> +//! This defines a 32-bit `BOOT_0` type which can be read from or writte=
n to offset `0x100` of an
> +//! `Io` region, with the described bitfields. For instance, `minor_revi=
sion` consists of the 4
> +//! least significant bits of the type.
> +//!
> +//! Fields are instances of [`Bounded`](kernel::num::Bounded) and can be=
 read by calling their
> +//! getter method, which is named after them. They also have setter meth=
ods prefixed with `with_`
> +//! for runtime values and `with_const_` for constant values. All setter=
s return the updated
> +//! register value.
> +//!
> +//! Fields can also be transparently converted from/to an arbitrary type=
 by using the `=3D>` and
> +//! `?=3D>` syntaxes.
> +//!
> +//! If present, doc comments above register or fields definitions are ad=
ded to the relevant item
> +//! they document (the register type itself, or the field's setter and g=
etter methods).
> +//!
> +//! Note that multiple registers can be defined in a single `register!` =
invocation. This can be
> +//! useful to group related registers together.
> +//!
> +//! Here is how the register defined above can be used in code:
> +//!
> +//!
> +//! ```no_run
> +//! use kernel::{
> +//!     io::{
> +//!         register,
> +//!         Io,
> +//!         IoLoc,
> +//!     },
> +//!     num::Bounded,
> +//! };
> +//! # use kernel::io::Mmio;
> +//! # register! {
> +//! #     pub BOOT_0(u32) @ 0x00000100 {
> +//! #         15:8 vendor_id;
> +//! #         7:4 major_revision;
> +//! #         3:0 minor_revision;
> +//! #     }
> +//! # }
> +//! # fn test(io: &Mmio<0x1000>) {
> +//! # fn obtain_vendor_id() -> u8 { 0xff }
> +//!
> +//! // Read from the register's defined offset (0x100).
> +//! let boot0 =3D io.read(BOOT_0);
> +//! pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0=
.minor_revision().get());
> +//!
> +//! // Update some fields and write the new value back.
> +//! let new_boot0 =3D boot0
> +//!     // Constant values.
> +//!     .with_const_major_revision::<3>()
> +//!     .with_const_minor_revision::<10>()
> +//!     // Run-time value.
> +//!     .with_vendor_id(obtain_vendor_id());
> +//! io.write((), new_boot0);
> +//!
> +//! // Or, build a new value from zero and write it:
> +//! io.write((), BOOT_0::zeroed()
> +//!     .with_const_major_revision::<3>()
> +//!     .with_const_minor_revision::<10>()
> +//!     .with_vendor_id(obtain_vendor_id())
> +//! );
> +//!
> +//! // Or, read and update the register in a single step.
> +//! io.update(BOOT_0, |r| r
> +//!     .with_const_major_revision::<3>()
> +//!     .with_const_minor_revision::<10>()
> +//!     .with_vendor_id(obtain_vendor_id())
> +//! );
> +//!
> +//! // Constant values can also be built using the const setters.
> +//! const V: BOOT_0 =3D pin_init::zeroed::<BOOT_0>()
> +//!     .with_const_major_revision::<3>()
> +//!     .with_const_minor_revision::<10>();
> +//! # }
> +//! ```
> +//!
> +//! For more extensive documentation about how to define registers, see =
the
> +//! [`register!`](kernel::io::register!) macro.
> +
> +use core::marker::PhantomData;
> +
> +use crate::io::IoLoc;
> +
> +/// Trait implemented by all registers.
> +pub trait Register: Sized {
> +    /// Backing primitive type of the register.
> +    type Storage: Into<Self> + From<Self>;
> +
> +    /// Start offset of the register.
> +    ///
> +    /// The interpretation of this offset depends on the type of the reg=
ister.
> +    const OFFSET: usize;
> +}
> +
> +/// Trait implemented by registers with a fixed offset.
> +pub trait FixedRegister: Register {}
> +
> +/// Allows `()` to be used as the `location` parameter of [`Io::write`](=
super::Io::write) when
> +/// passing a [`FixedRegister`] value.
> +impl<T> IoLoc<T> for ()
> +where
> +    T: FixedRegister,
> +{
> +    type IoType =3D T::Storage;
> +
> +    #[inline(always)]
> +    fn offset(self) -> usize {
> +        T::OFFSET
> +    }
> +}
> +
> +/// A [`FixedRegister`] carries its location in its type. Thus `FixedReg=
ister` values can be used
> +/// as an [`IoLoc`].
> +impl<T> IoLoc<T> for T
> +where
> +    T: FixedRegister,
> +{
> +    type IoType =3D T::Storage;
> +
> +    #[inline(always)]
> +    fn offset(self) -> usize {
> +        T::OFFSET
> +    }
> +}
> +
> +/// Location of a fixed register.
> +pub struct FixedRegisterLoc<T: FixedRegister>(PhantomData<T>);
> +
> +impl<T: FixedRegister> FixedRegisterLoc<T> {
> +    /// Returns the location of `T`.
> +    #[inline(always)]
> +    // We do not implement `Default` so we can be const.
> +    #[allow(clippy::new_without_default)]
> +    pub const fn new() -> Self {
> +        Self(PhantomData)
> +    }
> +}
> +
> +impl<T> IoLoc<T> for FixedRegisterLoc<T>
> +where
> +    T: FixedRegister,
> +{
> +    type IoType =3D T::Storage;
> +
> +    #[inline(always)]
> +    fn offset(self) -> usize {
> +        T::OFFSET
> +    }
> +}
> +
> +/// Trait providing a base address to be added to the offset of a relati=
ve register to obtain
> +/// its actual offset.
> +///
> +/// The `T` generic argument is used to distinguish which base to use, i=
n case a type provides
> +/// several bases. It is given to the `register!` macro to restrict the =
use of the register to
> +/// implementors of this particular variant.
> +pub trait RegisterBase<T> {
> +    /// Base address to which register offsets are added.
> +    const BASE: usize;
> +}
> +
> +/// Trait implemented by all registers that are relative to a base.
> +pub trait WithBase {
> +    /// Family of bases applicable to this register.
> +    type BaseFamily;
> +
> +    /// Returns the absolute location of this type when using `B` as its=
 base.
> +    #[inline(always)]
> +    fn of<B: RegisterBase<Self::BaseFamily>>() -> RelativeRegisterLoc<Se=
lf, B>
> +    where
> +        Self: Register,
> +    {
> +        RelativeRegisterLoc::new()
> +    }
> +}
> +
> +/// Trait implemented by relative registers.
> +pub trait RelativeRegister: Register + WithBase {}
> +
> +/// Location of a relative register.
> +///
> +/// This can either be an immediately accessible regular [`RelativeRegis=
ter`], or a
> +/// [`RelativeRegisterArray`] that needs one additional resolution throu=
gh
> +/// [`RelativeRegisterLoc::at`].
> +pub struct RelativeRegisterLoc<T: WithBase, B: ?Sized>(PhantomData<T>, P=
hantomData<B>);
> +
> +impl<T, B> RelativeRegisterLoc<T, B>
> +where
> +    T: Register + WithBase,
> +    B: RegisterBase<T::BaseFamily> + ?Sized,
> +{
> +    /// Returns the location of a relative register or register array.
> +    #[inline(always)]
> +    // We do not implement `Default` so we can be const.
> +    #[allow(clippy::new_without_default)]

This can be #[expect]?

> +    pub const fn new() -> Self {
> +        Self(PhantomData, PhantomData)
> +    }
> +
> +    // Returns the absolute offset of the relative register using base `=
B`.
> +    //
> +    // This is implemented as a private const method so it can be reused=
 by the [`IoLoc`]
> +    // implementations of both [`RelativeRegisterLoc`] and [`RelativeReg=
isterArrayLoc`].

Missing inline here.

> +    const fn offset(self) -> usize {
> +        B::BASE + T::OFFSET
> +    }
> +}
> +
> +impl<T, B> IoLoc<T> for RelativeRegisterLoc<T, B>
> +where
> +    T: RelativeRegister,
> +    B: RegisterBase<T::BaseFamily> + ?Sized,
> +{
> +    type IoType =3D T::Storage;
> +
> +    #[inline(always)]
> +    fn offset(self) -> usize {
> +        RelativeRegisterLoc::offset(self)
> +    }
> +}
> +
> +/// Trait implemented by arrays of registers.
> +pub trait RegisterArray: Register {
> +    /// Number of elements in the registers array.
> +    const SIZE: usize;
> +    /// Number of bytes between the start of elements in the registers a=
rray.
> +    const STRIDE: usize;
> +}
> +
> +/// Location of an array register.
> +pub struct RegisterArrayLoc<T: RegisterArray>(usize, PhantomData<T>);
> +
> +impl<T: RegisterArray> RegisterArrayLoc<T> {
> +    /// Returns the location of register `T` at position `idx`, with bui=
ld-time validation.
> +    #[inline(always)]
> +    pub fn new(idx: usize) -> Self {
> +        ::kernel::build_assert!(idx < T::SIZE);
> +
> +        Self(idx, PhantomData)
> +    }
> +
> +    /// Attempts to return the location of register `T` at position `idx=
`, with runtime validation.
> +    #[inline(always)]
> +    pub fn try_new(idx: usize) -> Option<Self> {
> +        if idx < T::SIZE {
> +            Some(Self(idx, PhantomData))
> +        } else {
> +            None
> +        }
> +    }
> +}
> +
> +impl<T> IoLoc<T> for RegisterArrayLoc<T>
> +where
> +    T: RegisterArray,
> +{
> +    type IoType =3D T::Storage;
> +
> +    #[inline(always)]
> +    fn offset(self) -> usize {
> +        T::OFFSET + self.0 * T::STRIDE
> +    }
> +}
> +
> +/// Trait providing location builders for [`RegisterArray`]s.
> +pub trait Array {
> +    /// Returns the location of the register at position `idx`, with bui=
ld-time validation.
> +    #[inline(always)]
> +    fn at(idx: usize) -> RegisterArrayLoc<Self>
> +    where
> +        Self: RegisterArray,
> +    {
> +        RegisterArrayLoc::new(idx)
> +    }
> +
> +    /// Returns the location of the register at position `idx`, with run=
time validation.
> +    #[inline(always)]
> +    fn try_at(idx: usize) -> Option<RegisterArrayLoc<Self>>
> +    where
> +        Self: RegisterArray,
> +    {
> +        RegisterArrayLoc::try_new(idx)
> +    }
> +}
> +
> +/// Trait implemented by arrays of relative registers.
> +pub trait RelativeRegisterArray: RegisterArray + WithBase {}
> +
> +/// Location to a relative array register.
> +pub struct RelativeRegisterArrayLoc<
> +    T: RelativeRegisterArray,
> +    B: RegisterBase<T::BaseFamily> + ?Sized,
> +>(RelativeRegisterLoc<T, B>, usize);
> +
> +impl<T, B> RelativeRegisterArrayLoc<T, B>
> +where
> +    T: RelativeRegisterArray,
> +    B: RegisterBase<T::BaseFamily> + ?Sized,
> +{
> +    /// Returns the location of register `T` from the base `B` at index =
`idx`, with build-time
> +    /// validation.
> +    #[inline(always)]
> +    pub fn new(idx: usize) -> Self {
> +        ::kernel::build_assert!(idx < T::SIZE);

This can be just an import? This isn't from macro.

> +
> +        Self(RelativeRegisterLoc::new(), idx)
> +    }
> +
> +    /// Attempts to return the location of register `T` from the base `B=
` at index `idx`, with
> +    /// runtime validation.
> +    #[inline(always)]
> +    pub fn try_new(idx: usize) -> Option<Self> {
> +        if idx < T::SIZE {
> +            Some(Self(RelativeRegisterLoc::new(), idx))
> +        } else {
> +            None
> +        }
> +    }
> +}
> +
> +/// Methods exclusive to [`RelativeRegisterLoc`]s created with a [`Relat=
iveRegisterArray`].
> +impl<T, B> RelativeRegisterLoc<T, B>
> +where
> +    T: RelativeRegisterArray,
> +    B: RegisterBase<T::BaseFamily> + ?Sized,
> +{
> +    /// Returns the location of the register at position `idx`, with bui=
ld-time validation.
> +    #[inline(always)]
> +    pub fn at(self, idx: usize) -> RelativeRegisterArrayLoc<T, B> {
> +        RelativeRegisterArrayLoc::new(idx)
> +    }
> +
> +    /// Returns the location of the register at position `idx`, with run=
time validation.
> +    #[inline(always)]
> +    pub fn try_at(self, idx: usize) -> Option<RelativeRegisterArrayLoc<T=
, B>> {
> +        RelativeRegisterArrayLoc::try_new(idx)
> +    }
> +}
> +
> +impl<T, B> IoLoc<T> for RelativeRegisterArrayLoc<T, B>
> +where
> +    T: RelativeRegisterArray,
> +    B: RegisterBase<T::BaseFamily> + ?Sized,
> +{
> +    type IoType =3D T::Storage;
> +
> +    #[inline(always)]
> +    fn offset(self) -> usize {
> +        self.0.offset() + self.1 * T::STRIDE
> +    }
> +}
> +
> +/// Defines a dedicated type for a register, including getter and setter=
 methods for its fields and
> +/// methods to read and write it from an [`Io`](kernel::io::Io) region.
> +///
> +/// This documentation focuses on how to declare registers. See the [mod=
ule-level
> +/// documentation](mod@kernel::io::register) for examples of how to acce=
ss them.
> +///
> +/// There are 4 possible kinds of registers: fixed offset registers, rel=
ative registers, arrays of
> +/// registers, and relative arrays of registers.
> +///
> +/// ## Fixed offset registers
> +///
> +/// These are the simplest kind of registers. Their location is simply a=
n offset inside the I/O
> +/// region. For instance:
> +///
> +/// ```ignore
> +/// register! {
> +///     pub FIXED_REG(u16) @ 0x80 {
> +///         ...
> +///     }
> +/// }
> +/// ```
> +///
> +/// This creates a 16-bit register named `FIXED_REG` located at offset `=
0x80` of an I/O region.
> +///
> +/// These registers' location can be built simply by referencing their n=
ame:
> +///
> +/// ```no_run
> +/// use kernel::{
> +///     io::{
> +///         register,
> +///         Io,
> +///     },
> +/// };
> +/// # use kernel::io::Mmio;
> +///
> +/// register! {
> +///     FIXED_REG(u32) @ 0x100 {
> +///         16:8 high_byte;
> +///         7:0  low_byte;
> +///     }
> +/// }
> +///
> +/// # fn test(io: &Mmio<0x1000>) {
> +/// let val =3D io.read(FIXED_REG);
> +///
> +/// // Write from an already-existing value.
> +/// io.write(FIXED_REG, val.with_low_byte(0xff));
> +///
> +/// // Create a register value from scratch.
> +/// let val2 =3D FIXED_REG::zeroed().with_high_byte(0x80);
> +///
> +/// // The location of fixed offset registers is already contained in th=
eir type. Thus, the
> +/// // `location` argument of `Io::write` is technically redundant and c=
an be replaced by `()`.
> +/// io.write((), val2);
> +/// # }
> +///
> +/// ```
> +///
> +/// It is possible to create an alias of an existing register with new f=
ield definitions by using
> +/// the `=3D> ALIAS` syntax. This is useful for cases where a register's=
 interpretation depends on
> +/// the context:
> +///
> +/// ```no_run
> +/// use kernel::io::register;
> +///
> +/// register! {
> +///     /// Scratch register.
> +///     pub SCRATCH(u32) @ 0x00000200 {
> +///         31:0 value;
> +///     }
> +///
> +///     /// Boot status of the firmware.
> +///     pub SCRATCH_BOOT_STATUS(u32) =3D> SCRATCH {
> +///         0:0 completed;
> +///     }
> +/// }
> +/// ```
> +///
> +/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address as =
`SCRATCH`, while providing
> +/// its own `completed` field.
> +///
> +/// ## Relative registers
> +///
> +/// Relative registers can be instantiated several times at a relative o=
ffset of a group of bases.
> +/// For instance, imagine the following I/O space:
> +///
> +/// ```text
> +///           +-----------------------------+
> +///           |             ...             |
> +///           |                             |
> +///  0x100--->+------------CPU0-------------+
> +///           |                             |
> +///  0x110--->+-----------------------------+
> +///           |           CPU_CTL           |
> +///           +-----------------------------+
> +///           |             ...             |
> +///           |                             |
> +///           |                             |
> +///  0x200--->+------------CPU1-------------+
> +///           |                             |
> +///  0x210--->+-----------------------------+
> +///           |           CPU_CTL           |
> +///           +-----------------------------+
> +///           |             ...             |
> +///           +-----------------------------+
> +/// ```
> +///
> +/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offs=
et `0x10` of their I/O
> +/// space segment. Since both instances of `CPU_CTL` share the same layo=
ut, we don't want to define
> +/// them twice and would prefer a way to select which one to use from a =
single definition.
> +///
> +/// This can be done using the `Base + Offset` syntax when specifying th=
e register's address:
> +///
> +/// ```ignore
> +/// register! {
> +///     pub RELATIVE_REG(u32) @ Base + 0x80 {
> +///         ...
> +///     }
> +/// }
> +/// ```
> +///
> +/// This creates a register with an offset of `0x80` from a given base.
> +///
> +/// `Base` is an arbitrary type (typically a ZST) to be used as a generi=
c parameter of the
> +/// [`RegisterBase`] trait to provide the base as a constant, i.e. each =
type providing a base for
> +/// this register needs to implement `RegisterBase<Base>`.
> +///
> +/// The location of relative registers can be built using the [`WithBase=
::of`] method to specify
> +/// its base. All relative registers implement [`WithBase`].
> +///
> +/// Here is the above layout translated into code:
> +///
> +/// ```no_run
> +/// use kernel::{
> +///     io::{
> +///         register,
> +///         register::{
> +///             RegisterBase,
> +///             WithBase,
> +///         },
> +///         Io,
> +///     },
> +/// };
> +/// # use kernel::io::Mmio;
> +///
> +/// // Type used to identify the base.
> +/// pub struct CpuCtlBase;
> +///
> +/// // ZST describing `CPU0`.
> +/// struct Cpu0;
> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
> +///     const BASE: usize =3D 0x100;
> +/// }
> +///
> +/// // ZST describing `CPU1`.
> +/// struct Cpu1;
> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
> +///     const BASE: usize =3D 0x200;
> +/// }
> +///
> +/// // This makes `CPU_CTL` accessible from all implementors of `Registe=
rBase<CpuCtlBase>`.
> +/// register! {
> +///     /// CPU core control.
> +///     pub CPU_CTL(u32) @ CpuCtlBase + 0x10 {
> +///         0:0 start;
> +///     }
> +/// }
> +///
> +/// # fn test(io: Mmio<0x1000>) {
> +/// // Read the status of `Cpu0`.
> +/// let cpu0_started =3D io.read(CPU_CTL::of::<Cpu0>());
> +///
> +/// // Stop `Cpu0`.
> +/// io.write(WithBase::of::<Cpu0>(), CPU_CTL::zeroed());
> +/// # }
> +///
> +/// // Aliases can also be defined for relative register.
> +/// register! {
> +///     /// Alias to CPU core control.
> +///     pub CPU_CTL_ALIAS(u32) =3D> CpuCtlBase + CPU_CTL {
> +///         /// Start the aliased CPU core.
> +///         1:1 alias_start;
> +///     }
> +/// }
> +///
> +/// # fn test2(io: Mmio<0x1000>) {
> +/// // Start the aliased `CPU0`, leaving its other fields untouched.
> +/// io.update(CPU_CTL_ALIAS::of::<Cpu0>(), |r| r.with_alias_start(true))=
;
> +/// # }
> +/// ```
> +///
> +/// ## Arrays of registers
> +///
> +/// Some I/O areas contain consecutive registers that share the same fie=
ld layout. These areas can
> +/// be defined as an array of identical registers, allowing them to be a=
ccessed by index with
> +/// compile-time or runtime bound checking:
> +///
> +///
> +/// ```ignore
> +/// register! {
> +///     pub REGISTER_ARRAY(u8)[10, stride =3D 4] @ 0x100 {
> +///         ...
> +///     }
> +/// }
> +/// ```
> +///
> +/// This defines `REGISTER_ARRAY`, an array of 10 byte registers startin=
g at offset `0x100`. Each
> +/// register is separated from its neighbor by 4 bytes.
> +///
> +/// The `stride` parameter is optional; if unspecified, the registers ar=
e placed consecutively from
> +/// each other.
> +///
> +/// A location for a register in a register array is built using the [`A=
rray::at`] trait method.
> +/// All arrays of registers implement [`Array`].
> +///
> +/// ```no_run
> +/// use kernel::{
> +///     io::{
> +///         register,
> +///         register::Array,
> +///         Io,
> +///     },
> +/// };
> +/// # use kernel::io::Mmio;
> +/// # fn get_scratch_idx() -> usize {
> +/// #   0x15
> +/// # }
> +///
> +/// // Array of 64 consecutive registers with the same layout starting a=
t offset `0x80`.
> +/// register! {
> +///     /// Scratch registers.
> +///     pub SCRATCH(u32)[64] @ 0x00000080 {
> +///         31:0 value;
> +///     }
> +/// }
> +///
> +/// # fn test(io: &Mmio<0x1000>)
> +/// #     -> Result<(), Error>{
> +/// // Read scratch register 0, i.e. I/O address `0x80`.
> +/// let scratch_0 =3D io.read(SCRATCH::at(0)).value();
> +///
> +/// // Write scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
> +/// io.write(Array::at(15), SCRATCH::from(0xffeeaabb));
> +///
> +/// // This is out of bounds and won't build.
> +/// // let scratch_128 =3D io.read(SCRATCH::at(128)).value();
> +///
> +/// // Runtime-obtained array index.
> +/// let idx =3D get_scratch_idx();
> +/// // Access on a runtime index returns an error if it is out-of-bounds=
.
> +/// let some_scratch =3D io.read(SCRATCH::try_at(idx).ok_or(EINVAL)?).va=
lue();
> +///
> +/// // Alias to a specific register in an array.
> +/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
> +/// register! {
> +///     /// Firmware exit status code.
> +///     pub FIRMWARE_STATUS(u32) =3D> SCRATCH[8] {
> +///         7:0 status;
> +///     }
> +/// }
> +///
> +/// let status =3D io.read(FIRMWARE_STATUS).status();
> +///
> +/// // Non-contiguous register arrays can be defined by adding a stride =
parameter.
> +/// // Here, each of the 16 registers of the array are separated by 8 by=
tes, meaning that the
> +/// // registers of the two declarations below are interleaved.
> +/// register! {
> +///     /// Scratch registers bank 0.
> +///     pub SCRATCH_INTERLEAVED_0(u32)[16, stride =3D 8] @ 0x000000c0 {
> +///         31:0 value;
> +///     }
> +///
> +///     /// Scratch registers bank 1.
> +///     pub SCRATCH_INTERLEAVED_1(u32)[16, stride =3D 8] @ 0x000000c4 {
> +///         31:0 value;
> +///     }
> +/// }
> +/// # Ok(())
> +/// # }
> +/// ```
> +///
> +/// ## Relative arrays of registers
> +///
> +/// Combining the two features described in the sections above, arrays o=
f registers accessible from
> +/// a base can also be defined:
> +///
> +/// ```ignore
> +/// register! {
> +///     pub RELATIVE_REGISTER_ARRAY(u8)[10, stride =3D 4] @ Base + 0x100=
 {
> +///         ...
> +///     }
> +/// }
> +/// ```
> +///
> +/// Like relative registers, they implement the [`WithBase`] trait. Howe=
ver the return value of
> +/// [`WithBase::of`] cannot be used directly as a location and must be f=
urther specified using the
> +/// [`at`](RelativeRegisterLoc::at) method.
> +///
> +/// ```no_run
> +/// use kernel::{
> +///     io::{
> +///         register,
> +///         register::{
> +///             RegisterBase,
> +///             WithBase,
> +///         },
> +///         Io,
> +///     },
> +/// };
> +/// # use kernel::io::Mmio;
> +/// # fn get_scratch_idx() -> usize {
> +/// #   0x15
> +/// # }
> +///
> +/// // Type used as parameter of `RegisterBase` to specify the base.
> +/// pub struct CpuCtlBase;
> +///
> +/// // ZST describing `CPU0`.
> +/// struct Cpu0;
> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
> +///     const BASE: usize =3D 0x100;
> +/// }
> +///
> +/// // ZST describing `CPU1`.
> +/// struct Cpu1;
> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
> +///     const BASE: usize =3D 0x200;
> +/// }
> +///
> +/// // 64 per-cpu scratch registers, arranged as a contiguous array.
> +/// register! {
> +///     /// Per-CPU scratch registers.
> +///     pub CPU_SCRATCH(u32)[64] @ CpuCtlBase + 0x00000080 {
> +///         31:0 value;
> +///     }
> +/// }
> +///
> +/// # fn test(io: &Mmio<0x1000>) -> Result<(), Error> {
> +/// // Read scratch register 0 of CPU0.
> +/// let scratch =3D io.read(CPU_SCRATCH::of::<Cpu0>().at(0));
> +///
> +/// // Write the retrieved value into scratch register 15 of CPU1.
> +/// io.write(WithBase::of::<Cpu1>().at(15), scratch);
> +///
> +/// // This won't build.
> +/// // let cpu0_scratch_128 =3D io.read(CPU_SCRATCH::of::<Cpu0>().at(128=
)).value();
> +///
> +/// // Runtime-obtained array index.
> +/// let scratch_idx =3D get_scratch_idx();
> +/// // Access on a runtime index returns an error if it is out-of-bounds=
.
> +/// let cpu0_scratch =3D io.read(
> +///     CPU_SCRATCH::of::<Cpu0>().try_at(scratch_idx).ok_or(EINVAL)?
> +/// ).value();
> +/// # Ok(())
> +/// # }
> +///
> +/// // Alias to `SCRATCH[8]` used to convey the firmware exit code.
> +/// register! {
> +///     /// Per-CPU firmware exit status code.
> +///     pub CPU_FIRMWARE_STATUS(u32) =3D> CpuCtlBase + CPU_SCRATCH[8] {
> +///         7:0 status;
> +///     }
> +/// }
> +///
> +/// // Non-contiguous relative register arrays can be defined by adding =
a stride parameter.
> +/// // Here, each of the 16 registers of the array are separated by 8 by=
tes, meaning that the
> +/// // registers of the two declarations below are interleaved.
> +/// register! {
> +///     /// Scratch registers bank 0.
> +///     pub CPU_SCRATCH_INTERLEAVED_0(u32)[16, stride =3D 8] @ CpuCtlBas=
e + 0x00000d00 {
> +///         31:0 value;
> +///     }
> +///
> +///     /// Scratch registers bank 1.
> +///     pub CPU_SCRATCH_INTERLEAVED_1(u32)[16, stride =3D 8] @ CpuCtlBas=
e + 0x00000d04 {
> +///         31:0 value;
> +///     }
> +/// }
> +///
> +/// # fn test2(io: &Mmio<0x1000>) -> Result<(), Error> {
> +/// let cpu0_status =3D io.read(CPU_FIRMWARE_STATUS::of::<Cpu0>()).statu=
s();
> +/// # Ok(())
> +/// # }
> +/// ```
> +#[macro_export]
> +macro_rules! register {
> +    // Entry point for the macro, allowing multiple registers to be defi=
ned in one call.
> +    // It matches all possible register declaration patterns to dispatch=
 them to corresponding
> +    // `@reg` rule that defines a single register.
> +    (
> +        $(
> +            $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
> +                $([ $size:expr $(, stride =3D $stride:expr)? ])?
> +                $(@ $($base:ident +)? $offset:literal)?
> +                $(=3D> $alias:ident $(+ $alias_offset:ident)? $([$alias_=
idx:expr])? )?
> +            { $($fields:tt)* }
> +        )*
> +    ) =3D> {
> +        $(
> +        $crate::register!(
> +            @reg $(#[$attr])* $vis $name ($storage) $([$size $(, stride =
=3D $stride)?])?
> +                $(@ $($base +)? $offset)?
> +                $(=3D> $alias $(+ $alias_offset)? $([$alias_idx])? )?
> +            { $($fields)* }
> +        );
> +        )*
> +    };
> +
> +    // All the rules below are private helpers.
> +
> +    // Creates a register at a fixed offset of the MMIO space.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $off=
set:literal
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($stor=
age) { $($fields)* });
> +        $crate::register!(@io_base $name($storage) @ $offset);
> +        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage));
> +    };
> +
> +    // Creates an alias register of fixed offset register `alias` with i=
ts own fields.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D> $=
alias:ident
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($stor=
age) { $($fields)* });
> +        $crate::register!(
> +            @io_base $name($storage) @
> +            <$alias as $crate::io::register::Register>::OFFSET
> +        );
> +        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage));
> +    };
> +
> +    // Creates a register at a relative offset from a base address provi=
der.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $bas=
e:ident + $offset:literal
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($stor=
age) { $($fields)* });
> +        $crate::register!(@io_base $name($storage) @ $offset);
> +        $crate::register!(@io_relative $vis $name($storage) @ $base);
> +    };
> +
> +    // Creates an alias register of relative offset register `alias` wit=
h its own fields.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D> $=
base:ident + $alias:ident
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($stor=
age) { $($fields)* });
> +        $crate::register!(
> +            @io_base $name($storage) @ <$alias as $crate::io::register::=
Register>::OFFSET
> +        );
> +        $crate::register!(@io_relative $vis $name($storage) @ $base);
> +    };
> +
> +    // Creates an array of registers at a fixed offset of the MMIO space=
.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
> +            [ $size:expr, stride =3D $stride:expr ] @ $offset:literal { =
$($fields:tt)* }
> +    ) =3D> {
> +        static_assert!(::core::mem::size_of::<$storage>() <=3D $stride);

This needs to be `$crate::static_assert!`

> +
> +        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($stor=
age) { $($fields)* });
> +        $crate::register!(@io_base $name($storage) @ $offset);
> +        $crate::register!(@io_array $vis $name($storage) [ $size, stride=
 =3D $stride ]);
> +    };
> +
> +    // Shortcut for contiguous array of registers (stride =3D=3D size of=
 element).
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $siz=
e:expr ] @ $offset:literal
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(
> +            $(#[$attr])* $vis $name($storage) [ $size, stride =3D ::core=
::mem::size_of::<$storage>() ]
> +                @ $offset { $($fields)* }
> +        );
> +    };
> +
> +    // Creates an alias of register `idx` of array of registers `alias` =
with its own fields.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D> $=
alias:ident [ $idx:expr ]
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        static_assert!($idx < <$alias as $crate::io::register::RegisterA=
rray>::SIZE);
> +
> +        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($stor=
age) { $($fields)* });
> +        $crate::register!(
> +            @io_base $name($storage) @
> +            <$alias as $crate::io::register::Register>::OFFSET
> +                + $idx * <$alias as $crate::io::register::RegisterArray>=
::STRIDE
> +        );
> +        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage));
> +    };
> +
> +    // Creates an array of registers at a relative offset from a base ad=
dress provider.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
> +            [ $size:expr, stride =3D $stride:expr ]
> +            @ $base:ident + $offset:literal { $($fields:tt)* }
> +    ) =3D> {
> +        static_assert!(::core::mem::size_of::<$storage>() <=3D $stride);
> +
> +        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($stor=
age) { $($fields)* });
> +        $crate::register!(@io_base $name($storage) @ $offset);
> +        $crate::register!(
> +            @io_relative_array $vis $name($storage) [ $size, stride =3D =
$stride ] @ $base + $offset
> +        );
> +    };
> +
> +    // Shortcut for contiguous array of relative registers (stride =3D=
=3D size of element).
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $siz=
e:expr ]
> +            @ $base:ident + $offset:literal { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(
> +            $(#[$attr])* $vis $name($storage) [ $size, stride =3D ::core=
::mem::size_of::<$storage>() ]
> +                @ $base + $offset { $($fields)* }
> +        );
> +    };
> +
> +    // Creates an alias of register `idx` of relative array of registers=
 `alias` with its own
> +    // fields.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
> +            =3D> $base:ident + $alias:ident [ $idx:expr ] { $($fields:tt=
)* }
> +    ) =3D> {
> +        static_assert!($idx < <$alias as $crate::io::register::RegisterA=
rray>::SIZE);
> +
> +        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($stor=
age) { $($fields)* });
> +        $crate::register!(
> +            @io_base $name($storage) @
> +                <$alias as $crate::io::register::Register>::OFFSET +
> +                $idx * <$alias as $crate::io::register::RegisterArray>::=
STRIDE
> +        );
> +        $crate::register!(@io_relative $vis $name($storage) @ $base);
> +    };
> +
> +    // Generates the bitfield for the register.
> +    //
> +    // `#[allow(non_camel_case_types)]` is added since register names ty=
pically use
> +    // `SCREAMING_CASE`.
> +    (
> +        @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storage=
:ty) { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(@bitfield_core
> +            #[allow(non_camel_case_types)]
> +            $(#[$attr])* $vis $name $storage
> +        );
> +        $crate::register!(@bitfield_fields $vis $name $storage { $($fiel=
ds)* });
> +    };
> +
> +    // Implementations shared by all registers types.
> +    (@io_base $name:ident($storage:ty) @ $offset:expr) =3D> {
> +        impl $crate::io::register::Register for $name {
> +            type Storage =3D $storage;
> +
> +            const OFFSET: usize =3D $offset;
> +        }
> +    };
> +
> +    // Implementations of fixed registers.
> +    (@io_fixed $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)) =3D=
> {
> +        impl $crate::io::register::FixedRegister for $name {}
> +
> +        $(#[$attr])*
> +        $vis const $name: $crate::io::register::FixedRegisterLoc<$name> =
=3D
> +            $crate::io::register::FixedRegisterLoc::<$name>::new();
> +    };
> +
> +    // Implementations of relative registers.
> +    (@io_relative $vis:vis $name:ident ($storage:ty) @ $base:ident) =3D>=
 {
> +        impl $crate::io::register::WithBase for $name {
> +            type BaseFamily =3D $base;
> +        }
> +
> +        impl $crate::io::register::RelativeRegister for $name {}
> +    };
> +
> +    // Implementations of register arrays.
> +    (@io_array $vis:vis $name:ident ($storage:ty) [ $size:expr, stride =
=3D $stride:expr ]) =3D> {
> +        impl $crate::io::register::Array for $name {}
> +
> +        impl $crate::io::register::RegisterArray for $name {
> +            const SIZE: usize =3D $size;
> +            const STRIDE: usize =3D $stride;
> +        }
> +    };
> +
> +    // Implementations of relative array registers.
> +    (
> +        @io_relative_array $vis:vis $name:ident ($storage:ty) [ $size:ex=
pr, stride =3D $stride:expr ]
> +            @ $base:ident + $offset:literal
> +    ) =3D> {
> +        impl $crate::io::register::WithBase for $name {
> +            type BaseFamily =3D $base;
> +        }
> +
> +        impl $crate::io::register::RegisterArray for $name {
> +            const SIZE: usize =3D $size;
> +            const STRIDE: usize =3D $stride;
> +        }
> +
> +        impl $crate::io::register::RelativeRegisterArray for $name {}
> +    };
> +
> +    // Defines the wrapper `$name` type and its conversions from/to the =
storage type.
> +    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty) =
=3D> {
> +        $(#[$attr])*
> +        #[repr(transparent)]
> +        #[derive(Clone, Copy, PartialEq, Eq)]
> +        $vis struct $name {
> +            inner: $storage,
> +        }
> +
> +        #[allow(dead_code)]
> +        impl $name {
> +            /// Creates a bitfield from a raw value.
> +            #[inline(always)]
> +            $vis const fn from_raw(value: $storage) -> Self {
> +                Self{ inner: value }
> +            }
> +
> +            /// Turns this bitfield into its raw value.
> +            ///
> +            /// This is similar to the [`From`] implementation, but is s=
horter to invoke in
> +            /// most cases.
> +            #[inline(always)]
> +            $vis const fn into_raw(self) -> $storage {
> +                self.inner
> +            }
> +        }
> +
> +        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
> +        unsafe impl ::pin_init::Zeroable for $name {}
> +
> +        impl ::core::convert::From<$name> for $storage {
> +            #[inline(always)]
> +            fn from(val: $name) -> $storage {
> +                val.into_raw()
> +            }
> +        }
> +
> +        impl ::core::convert::From<$storage> for $name {
> +            #[inline(always)]
> +            fn from(val: $storage) -> $name {
> +                Self::from_raw(val)
> +            }
> +        }
> +    };
> +
> +    // Definitions requiring knowledge of individual fields: private and=
 public field accessors,
> +    // and `Debug` implementation.
> +    (@bitfield_fields $vis:vis $name:ident $storage:ty {
> +        $($(#[doc =3D $doc:expr])* $hi:literal:$lo:literal $field:ident
> +            $(?=3D> $try_into_type:ty)?
> +            $(=3D> $into_type:ty)?
> +        ;
> +        )*
> +    }
> +    ) =3D> {
> +        #[allow(dead_code)]
> +        impl $name {
> +        $(
> +        $crate::register!(@private_field_accessors $vis $name $storage :=
 $hi:$lo $field);
> +        $crate::register!(
> +            @public_field_accessors $(#[doc =3D $doc])* $vis $name $stor=
age : $hi:$lo $field
> +            $(?=3D> $try_into_type)?
> +            $(=3D> $into_type)?
> +        );
> +        )*
> +        }
> +
> +        $crate::register!(@debug $name { $($field;)* });
> +    };
> +
> +    // Private field accessors working with the exact `Bounded` type for=
 the field.
> +    (
> +        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:=
tt:$lo:tt $field:ident
> +    ) =3D> {
> +        ::kernel::macros::paste!(

Could be `$crate::macros::paste!`.

Best,
Gary

> +        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<=
u8> =3D $lo..=3D$hi;
> +        $vis const [<$field:upper _MASK>]: $storage =3D
> +            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
> +        $vis const [<$field:upper _SHIFT>]: u32 =3D $lo;
> +        );
> +
> +        ::kernel::macros::paste!(
> +        fn [<__ $field>](self) ->
> +            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
> +            // Left shift to align the field's MSB with the storage MSB.
> +            const ALIGN_TOP: u32 =3D $storage::BITS - ($hi + 1);
> +            // Right shift to move the top-aligned field to bit 0 of the=
 storage.
> +            const ALIGN_BOTTOM: u32 =3D ALIGN_TOP + $lo;
> +
> +            // Extract the field using two shifts. `Bounded::shr` produc=
es the correctly-sized
> +            // output type.
> +            let val =3D ::kernel::num::Bounded::<$storage, { $storage::B=
ITS }>::from(
> +                self.inner << ALIGN_TOP
> +            );
> +            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
> +        }
> +
> +        const fn [<__with_ $field>](
> +            mut self,
> +            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
> +        ) -> Self
> +        {
> +            const MASK: $storage =3D <$name>::[<$field:upper _MASK>];
> +            const SHIFT: u32 =3D <$name>::[<$field:upper _SHIFT>];
> +
> +            let value =3D value.get() << SHIFT;
> +            self.inner =3D (self.inner & !MASK) | value;
> +
> +            self
> +        }
> +        );
> +    };

