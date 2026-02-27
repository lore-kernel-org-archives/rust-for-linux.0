Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021129.outbound.protection.outlook.com [52.101.100.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F0B3644D1;
	Fri, 27 Feb 2026 18:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215374; cv=fail; b=j4NU0Ut6jRWh2JdJg4VgdqSMr4iIeVKvPzkL0jBuYXsCISPbBxanGPK3hgZSI6MGD6rD8Q6V/LGiN02m3ZEiZEmPLyrt2ImAu4nmieAWKMddk0cnu6LWk6lCcUsNia6ErHJgyi/f77fZ5Lio26hczsLMVg2llwIJWi2FQ6xF8r8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215374; c=relaxed/simple;
	bh=sdnhk31drsELTrWaO2xYmv49VwA+HPZRKythwUPGJqw=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Aulzi5a1VCa/Cw9ag+3rPOTI8o5EWkQnkROSYsku0A1okPHk943lwvxlpwU5XKpSL2I4f44ixMKvBErP+XhxUAXXMRsqTQUGiKWP/vn5RFRkz9zcChttQjFMMiaxaxb5Eh/YKv8fwr6yOdVF5NcYxTLv+DYTKeibNYWOZHdZo9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=bsc5F34c; arc=fail smtp.client-ip=52.101.100.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="bsc5F34c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4mRrYyAwGaS211sS1DlVzzJkz475+SpyWlCpJClbI3ezESrwKpbTybtKIh1juS2KALUkbvdu30jUAr4+80IaSu8bI2dP9bhiREVgPRTTLEYYvdprvXEw9kMXvMQSuUogoz6MQH3FUR78+46VOEqf3Jc/br5DCbZea6M4oTT19rBZaSBuGG/0uuIfrAxFFS9M+4RU8GuLN+2Sx19V0IY2Lp6zF3uiC9dKd7WtDqvhk8Cysm6P4iAlfOCNECzRjFZ9sw0h/CcWrO1x6fYis7Fy1xwrIxW/z2bKwkC22R1naCb0fsIP1vQzPW0Ev7nqAxZNX3njVkThrZEwVdHAOVjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuYxV29miTTSLTTZMFS/UWUr5Hd8dgg1nrYMxy9qi88=;
 b=S2/jFwShTVwWzR+4zvUTw+OxUTsMZj+5cXcxD3Ercd/DBkr0VXHtVW5zG1U+XdYywyMMovLPimkE34vq8dyE29wg5MrUDEkpan/tjkxbxFwSGhbX7GeJRJGXJUQ5yu5ErYoXQDhTy991KBwx1Jxgy1R5gW/K3b96yPPfUGyPpmAa6R2jJukBuStyQQlJLsIItTSJFG1ymPkriJQLnDZXIaB64alZw9IjqNE3dJ1Jnk9p/xUFiv6tjcNSgkruiCQXcYQXv7gC5yCvOnCVYMd24LwJwcXEdpSwagbKSL3GBGS41oMAPMimaK0KdpcxLzI6FwQaurXhP8a/YdNKht4aUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuYxV29miTTSLTTZMFS/UWUr5Hd8dgg1nrYMxy9qi88=;
 b=bsc5F34cKS/LA2MZYe4ZOAv4asPAluqieypxjccSHRyg4X7QC+3ahK2M4eGKd4pDdl/w9xzz4Ns9wRBUWID/TtSXCoWQDK3Ab9Ak5e3LyL48MQMQcrw6GIPdlJ8gBrCzUkRpRW/jwEvpPoS5dqLF+bxGTmT+yS+UPFUQ7irHuKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6094.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 18:02:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 18:02:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 18:02:47 +0000
Message-Id: <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
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
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
In-Reply-To: <20260224-register-v7-5-aad44f760f33@nvidia.com>
X-ClientProxiedBy: LO4P265CA0171.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 4efd993e-2b54-43b5-3311-08de762a6ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	I6Dv4LCJj6ShXe3dCTmO40EGx3utD+icl9p96RnbzrYpVybcG9Gh/kXM7kqIFhzE312PuDqut9sCGMZHBKo9Pia8wTeFg1biM3sOjhLR1NR+tPlGhyVaLn11JeuNMLWftNgR8bX0BnPz7Q8+DUzMIWE/9epoVBReGahE3JAw38bs55raSbLQIDmHei7Oi8gpTNqh6kReMKogAro95MWVQwW5WCTa+W0mbiZvDt5i/+OwCqlXUKCN/MdfnhwV1QWmj+RNsuldxMTagAXamaSDkUzdz1pl0W4z/2s87ChnOzwLBT1p3b+g9hq0opGkAyHGpcbfBEErw+2n4mavqBflN9V9rZWv4o5tws7uEQZGicSPF0zZEJT4cuwzQ/jNWu7DzA62+wb7NC3eaOYTHlRrJna+q0xxb6WvoICYFSkC9Pmu8qeuoS3js7eIZwGI93O9kjRlUYGnwxe0CGA5ON79LlUoLojKD51tW2b27GGcDxhocRFx9r+AELgpq/lKKxy0GyrECmksiiF2cxQ0HC6p30ioHQKzGhZOW13SE8QCQDa1xON3TCzL70H5xNr8cSttBSO95Ds+Vak0K+nzRMVBk8fDxcJzBhK+faIFf85wEKpawflThfmBy3opUjUUUGwumgba/v6pTeMeUyYnrq8SEhmrU0xXWrViP86GJa8RKkeRHBR6YoqPRsDygZ3Qht0QJ1vOknBervyEYz4KWVeJVaEATfqxaAUnzcelGXfUKFclSh6eKnRmsuK6mvh1dKxHoorYNO2v2lvjEkI1oaWLPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGRSVWtZOVBCanZsQ1ArU1UrWDRvcW5EMGYxTEJiWDFpdG5adjQ2bUVsTlM3?=
 =?utf-8?B?YzEvWHZxbkRTbXBGd2FQWWVXL3pDdFFtVUJEL1lYRmNYSHZMam1UWFdBRHVk?=
 =?utf-8?B?U1ZpNGtQYjhMVDhrWkRUNzJpNk9jV3JKdTVJM2FFSHBEeXM0TW00dUxkWW5n?=
 =?utf-8?B?UjU1K3FBaDVsNXlUeTBKL3kyYi9vTzU3Qk1XSkhLV2JuMGxUc3ZNTVdOTHls?=
 =?utf-8?B?OUZnejAxVkduVzhiTHdzWVJlVDhIMVBlL1BNbkQxeFZlNXFDZUVabUtmSGQ1?=
 =?utf-8?B?N2I1R0hQbnV0WkpaZndXT2p0ZE5sUWFJYUVwVjZpclEwNmk2bklleUFlUzAy?=
 =?utf-8?B?aFlzQnhpcW9nQkc2NTZWa1hKbjVWUjNxT3djRmM2ZFBaUGdyMVNuWGloaldh?=
 =?utf-8?B?K2NvQXJDSFdDRzFrWDZLN1czcHUzaG1adWVFY1JXdE00R2VGZ3lMTCtUUWJK?=
 =?utf-8?B?Uy93dTJYY3FzaC93Zk53b2dxQ1Y3SlY0WnRKb2Q3RU9Wc3oxdWFLOElEaFZk?=
 =?utf-8?B?eC9SQ1FzQTlLaW5LWjNUWWd6ZHIxdnJIeG1MQWtIZCt2T1ZEL2gwdEVDRGtw?=
 =?utf-8?B?Q3V5bVdWZTZ1dEpBR01ETGI5Q1Q3TjZlL0dPQVZJam1NWTAyQnZad3VRY2Fs?=
 =?utf-8?B?RlVUbzQyNmJ0OTNTaGtRYlIwd3MvOWlJT1VOOVJJZTRZR0hKaW5xS0NQbERD?=
 =?utf-8?B?ck5ZZXEwcFNUT1ZKOGZaQmJLcjhOWk13MkU0MTNxRnNnUVdJZ2NMbGRTTjNF?=
 =?utf-8?B?ZW9WTHk5Mlg5SmRFWEVJcngyZ0MzTTdzTWtIa0EveEZ1c0hBOWlGdTU1VlRP?=
 =?utf-8?B?b25lZ1o3dExTSnFmREYxTStzNTlpdVZKQzlERDZYbVJRN1o0cXRSWndGRllD?=
 =?utf-8?B?SjlPQ291aWFJM1RkL0VsSDJpaEN5dzZxQXp4MFlqd2l6eGwwY2hpejVPNGtY?=
 =?utf-8?B?VGdMNVh2eGhwaWMzWUVNeFVncms0NW1yb2xzbTQ3TzdBZ0pjODdGaGJueHVP?=
 =?utf-8?B?Ymd3ZlFKN2lmbEY2bHlvczYzcXd1VEJHMUd6Q0plY3E0V0F6QTdwQ2xUVWhr?=
 =?utf-8?B?Zk1lMEVMbWxMdGRlZWRvWjlTWjFRMFNtQlpVTkNwSERJWXRFejRZY29BSjdB?=
 =?utf-8?B?K0syK2FmU2REdW1xTWsraThWWmV1amFNaWdOR2luUzlqRHp2T2RIbWNkbzF0?=
 =?utf-8?B?Z3lTV1dMYTdWcFowQmVDc25DMG9EanpTL3VqY1lqU0pJV1dSSmFTbE8vWjlr?=
 =?utf-8?B?M3MvZFhlVDZ3d3JKMnR5VkNsQjRPUFVVUHJ2QjJoTUR0UDdRcGRqejltcWdK?=
 =?utf-8?B?RDB1bThjajJsNE1Xd1dxZWEwNnduNVRCWGFlMm5aanNmcnZQNHIwK2ViUkdP?=
 =?utf-8?B?RlgwZEpSYmNJWStvd1REOHZBUUNTNkhCZ3dVcG52VmdwbDBYQXkrRkRmcTU4?=
 =?utf-8?B?SjhUOVBHanI0eVdtdzNDMVU0YzhZNW9YY0F4Q3NjVjZvSzBZczBCUXdYdkVj?=
 =?utf-8?B?NW8vbWNBa0JLalpydkZnOEwrT0pVU09QSHczVE9lRjVML3gvMW12UlFOZUV5?=
 =?utf-8?B?WW1SWmQxdlZBV2JXc2ROOXNnRUx0aUhJdmJjRW45VjV4TlNLekhQTVNDYmdu?=
 =?utf-8?B?OGYzTXJtZmcxTysrY2c3dCtmVFpHS0hNOXRjUXpSVWpNdERtbUxEOWczUU1Q?=
 =?utf-8?B?bWJsM29mS3ZtQlhHcENZTEp2WmljenJsZFc3NW5PZEFsNm82Rjk0K1E1V1c2?=
 =?utf-8?B?OVJrVkRTTyt3ckFYZlZSeHVPTjMrazVualJTSnd2QktkK1FsbTF3RnZ0bnQv?=
 =?utf-8?B?UWgrRytoWnRTWVQ3Y2VETEZZVUJiQ1RjWWlCQTFBY09ua0VyeVAwY0s2ZEh4?=
 =?utf-8?B?R1BHZzBkOXluR2pUaHBIb0k2eklWS0tQRVVmNkM0TmJCZUhjNnlESDJjWDNn?=
 =?utf-8?B?NG5JUFN5S3ozc2xxYnBBM0pRelUvc0ZrVlRJSXA3cURzeE9TNU9TeVkvenVj?=
 =?utf-8?B?aHl4NFh2OFg1R2ZDZGlJNDZrdEhIaU94ZkRvYU9qSG9QVno1RHhMYytLVkts?=
 =?utf-8?B?SUR2STFWMDRDSGkrVUlrY1ZPMzZWRzV3elBsZE95bGtMY2c3SFJVY3FIZG5y?=
 =?utf-8?B?QWFiMUtmb1dJV0tGSXpzd3JPU1JTQVFacVcxSlFwWkpVaWdEenlGRDhlQUxo?=
 =?utf-8?B?U1MyZnROaFVJY0hrNDg4WVplTkRHNE44YUNDbUMyeGF5cmgxdkI5emNLK2ZK?=
 =?utf-8?B?c3FOTU0xaUtCbVZoV2dUU1dMUVNvNzdGVjdPYTlxYjZOVmloOWNpMXA0US9m?=
 =?utf-8?B?MVZ6N2Y1c0JvMms5bmJIZzd6a3NTOTAyWDdOZ1JIdUJHMVJwYnRwUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efd993e-2b54-43b5-3311-08de762a6ade
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 18:02:48.8737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSUsB/dPM7hS2IyN1epoj9suwnyXLQ8kUj2rjFxpzWCywbgpfpp3Ch4WtWNoBw+N+p1UUOVnlAh/iNrKno0T7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6094

On Tue Feb 24, 2026 at 2:21 PM GMT, Alexandre Courbot wrote:
> I/O accesses are defined by the following properties:
>
> - For reads, a start address, a width, and a type to interpret the read
>   value as,
> - For writes, the same as above, and a value to write.
>
> Introduce the `IoLoc` trait, which allows implementing types to specify
> the address a type expects to be accessed at, as well as the width of
> the access, and the user-facing type used to perform the access.
>
> This allows read operations to be made generic with the `read` method
> over an `IoLoc` argument.
>
> Write operations need a value to write on top of the `IoLoc`: fulfill
> that purpose with the `IoWrite` type, which is the combination of an
> `IoLoc` and a value of the type it expects. This allows write operations
> to be made generic with the `write` method over a single `IoWrite`
> argument.
>
> The main purpose of these new entities is to allow register types to be
> written using these generic `read` and `write` methods of `Io`.
>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/io.rs | 241 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 241 insertions(+)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index b150743ffa4f..fdd2549d8e13 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -173,6 +173,158 @@ pub trait IoCapable<T> {
>      unsafe fn io_write(&self, value: T, address: usize);
>  }
> =20
> +/// Describes a given I/O location: its offset, width, and return type.
> +///
> +/// This trait is the key abstraction allowing [`Io::read`], [`Io::write=
`], and [`Io::update`]
> +/// to work uniformly with both raw `usize` offsets (for primitive types=
 like `u32`) and typed
> +/// ones.
> +///
> +/// An `IoLoc<T>` carries three pieces of information:
> +///
> +/// - The offset to access (returned by [`IoLoc::offset`]),
> +/// - The width of the access (determined by [`IoLoc::IoType`]),
> +/// - The type `T` in which data is returned or provided.
> +///
> +/// `T` and `IoType` may differ: for instance, a typed register has `T` =
=3D the register type with
> +/// its bitfields, and `IoType` =3D its backing primitive (e.g. `u32`), =
with `Into` conversions
> +/// between them.
> +///
> +/// An `IoLoc` can be passed directly to [`Io::read`] or [`Io::try_read`=
] to obtain a value, or
> +/// turned into an [`IoWrite`] via [`IoLoc::set`] to be passed to [`Io::=
write`] or
> +/// [`Io::try_write`].
> +pub trait IoLoc<T>: Copy
> +where
> +    T: Into<Self::IoType>,
> +    Self::IoType: Into<T>,
> +{
> +    /// Size (`u8`, `u16`, etc) of the I/O performed on the returned [`o=
ffset`](IoLoc::offset).
> +    type IoType;
> +
> +    /// Returns the offset of this location.
> +    fn offset(self) -> usize;
> +
> +    /// Turns this location into an [`IoWrite`] with the initial `value`=
.
> +    fn set(self, value: T) -> IoWrite<T, Self> {
> +        IoWrite { value, loc: self }
> +    }
> +
> +    /// Turns this location into an [`IoWrite`] with the initial value `=
0`.
> +    fn zeroed(self) -> IoWrite<T, Self>
> +    where
> +        T: Zeroable,
> +    {
> +        self.set(pin_init::zeroed())
> +    }
> +
> +    /// Turns this location into an [`IoWrite`] with the initial [`Defau=
lt`] value of `T`.
> +    fn default(self) -> IoWrite<T, Self>
> +    where
> +        T: Default,
> +    {
> +        self.set(Default::default())
> +    }
> +
> +    /// Turns this location into an [`IoWrite`] initialized from `0` and=
 transformed by `f`.
> +    ///
> +    /// This is a shortcut for `self.zeroed().update(f)`.
> +    fn init<F>(self, f: F) -> IoWrite<T, Self>
> +    where
> +        T: Zeroable,
> +        F: FnOnce(T) -> T,
> +    {
> +        self.zeroed().update(f)
> +    }
> +
> +    /// Turns this location into an [`IoWrite`] initialized from `0` and=
 transformed by `f`.
> +    ///
> +    /// `f` is expected to return a [`Result<T>`].
> +    ///
> +    /// This is a shortcut for `self.zeroed().try_update(f)`.
> +    fn try_init<F, E>(self, f: F) -> Result<IoWrite<T, Self>, E>
> +    where
> +        T: Zeroable,
> +        F: FnOnce(T) -> Result<T, E>,
> +    {
> +        self.zeroed().try_update(f)
> +    }
> +
> +    /// Turns this location into an [`IoWrite`] initialized from [`Defau=
lt`] and transformed
> +    /// by `f`.
> +    ///
> +    /// This is a shortcut for `self.default().update(f)`.
> +    fn init_default<F>(self, f: F) -> IoWrite<T, Self>
> +    where
> +        T: Default,
> +        F: FnOnce(T) -> T,
> +    {
> +        self.default().update(f)
> +    }
> +
> +    /// Turns this location into an [`IoWrite`] initialized from [`Defau=
lt`] and transformed by
> +    /// `f`.
> +    ///
> +    /// `f` is expected to return a [`Result<T>`].
> +    ///
> +    /// This is a shortcut for `self.default().try_update(f)`.
> +    fn try_init_default<F, E>(self, f: F) -> Result<IoWrite<T, Self>, E>
> +    where
> +        T: Default,
> +        F: FnOnce(T) -> Result<T, E>,
> +    {
> +        self.default().try_update(f)
> +    }
> +}
> +
> +/// A pending I/O write operation, bundling a value with the [`IoLoc`] i=
t should be written to.
> +///
> +/// Created by [`IoLoc::set`], [`IoLoc::zeroed`], [`IoLoc::default`], [`=
IoLoc::init`], or
> +/// [`IoLoc::init_default`], and consumed by [`Io::write`] or [`Io::try_=
write`] to perform the
> +/// actual write.
> +///
> +/// The value can be modified before writing using [`IoWrite::update`] o=
r [`IoWrite::try_update`],
> +/// enabling a builder pattern:
> +///
> +/// ```ignore
> +/// io.write(REGISTER.init(|v| v.with_field(x)));
> +/// ```

Thinking about this again, I think we might still want to write

    io.write(REGISTER, value)

Granted, this does mean that we will write `REGISTER` twice in some cases:

    io.write(REGISTER, REGISTER::default().with_field(foo));

But, we have no redundancy for the update case:

    io.update(REGISTER, |v| v.with_field(foo));

The reason for this thought is that conceptually, the type of a register is=
 not
necessarily coupled with the register itself. This is the case currently fo=
r
register arrays, but also the case when we think in the long term where
bitfields become decoupled from `register!`. People also might just want to
define a register of u32 without any bitfields at all, and in this case wri=
ting

    io.write(REGISTER, u32_value)

looks nicer than

    io.write(REGISTER.set(u32_value))

Spelling out the "offset" explictly, arguably, is also more natural for a C
programmer, and also simpler on the implementation side (all the helper met=
hods
on `IoLoc` would go away).

Best,
Gary

> +pub struct IoWrite<T, R>
> +where
> +    R: IoLoc<T>,
> +    T: Into<R::IoType>,
> +{
> +    value: T,
> +    loc: R,
> +}
> +
> +impl<R, T> IoWrite<T, R>
> +where
> +    R: IoLoc<T>,
> +    T: Into<R::IoType>,
> +{
> +    /// Transforms the value to be written by applying `f`, returning th=
e modified [`IoWrite`].
> +    #[inline(always)]
> +    pub fn update<F>(mut self, f: F) -> Self
> +    where
> +        F: FnOnce(T) -> T,
> +    {
> +        self.value =3D f(self.value);
> +
> +        self
> +    }
> +
> +    /// Transforms the value to be written by applying `f`, returning th=
e modified [`IoWrite`] on
> +    /// success.
> +    #[inline(always)]
> +    pub fn try_update<F, E>(mut self, f: F) -> Result<Self, E>
> +    where
> +        F: FnOnce(T) -> Result<T, E>,
> +    {
> +        self.value =3D f(self.value)?;
> +
> +        Ok(self)
> +    }
> +}
> +
>  /// Types implementing this trait (e.g. MMIO BARs or PCI config regions)
>  /// can perform I/O operations on regions of memory.
>  ///
> @@ -406,6 +558,95 @@ fn write64(&self, value: u64, offset: usize)
>          // SAFETY: `address` has been validated by `io_addr_assert`.
>          unsafe { self.io_write(value, address) }
>      }
> +
> +    /// Generic fallible read with runtime bounds check.
> +    #[inline(always)]
> +    fn try_read<T, R>(&self, r: R) -> Result<T>
> +    where
> +        R: IoLoc<T>,
> +        T: Into<R::IoType>,
> +        Self: IoCapable<R::IoType>,
> +    {
> +        let address =3D self.io_addr::<R::IoType>(r.offset())?;
> +
> +        // SAFETY: `address` has been validated by `io_addr`.
> +        Ok(unsafe { self.io_read(address) }.into())
> +    }
> +
> +    /// Generic fallible write with runtime bounds check.
> +    #[inline(always)]
> +    fn try_write<T, R>(&self, op: IoWrite<T, R>) -> Result
> +    where
> +        R: IoLoc<T>,
> +        T: Into<R::IoType>,
> +        Self: IoCapable<R::IoType>,
> +    {
> +        let address =3D self.io_addr::<R::IoType>(op.loc.offset())?;
> +
> +        // SAFETY: `address` has been validated by `io_addr`.
> +        unsafe { self.io_write(op.value.into(), address) };
> +        Ok(())
> +    }
> +
> +    /// Generic fallible update with runtime bounds check.
> +    ///
> +    /// Caution: this does not perform any synchronization. Race conditi=
ons can occur in case of
> +    /// concurrent access.
> +    #[inline(always)]
> +    fn try_update<T, R, F>(&self, r: R, f: F) -> Result
> +    where
> +        R: IoLoc<T>,
> +        T: Into<R::IoType>,
> +        Self: IoCapable<R::IoType>,
> +        F: FnOnce(T) -> T,
> +    {
> +        let v =3D self.try_read(r)?;
> +        self.try_write(r.set(f(v)))
> +    }
> +
> +    /// Generic infallible read with compile-time bounds check.
> +    #[inline(always)]
> +    fn read<T, R>(&self, r: R) -> T
> +    where
> +        R: IoLoc<T>,
> +        T: Into<R::IoType>,
> +        Self: IoKnownSize + IoCapable<R::IoType>,
> +    {
> +        let address =3D self.io_addr_assert::<R::IoType>(r.offset());
> +
> +        // SAFETY: `address` has been validated by `io_addr_assert`.
> +        unsafe { self.io_read(address) }.into()
> +    }
> +
> +    /// Generic infallible write with compile-time bounds check.
> +    #[inline(always)]
> +    fn write<T, R>(&self, op: IoWrite<T, R>)
> +    where
> +        R: IoLoc<T>,
> +        T: Into<R::IoType>,
> +        Self: IoKnownSize + IoCapable<R::IoType>,
> +    {
> +        let address =3D self.io_addr_assert::<R::IoType>(op.loc.offset()=
);
> +
> +        // SAFETY: `address` has been validated by `io_addr_assert`.
> +        unsafe { self.io_write(op.value.into(), address) }
> +    }
> +
> +    /// Generic infallible update with compile-time bounds check.
> +    ///
> +    /// Caution: this does not perform any synchronization. Race conditi=
ons can occur in case of
> +    /// concurrent access.
> +    #[inline(always)]
> +    fn update<T, R, F>(&self, r: R, f: F)
> +    where
> +        R: IoLoc<T>,
> +        T: Into<R::IoType>,
> +        Self: IoKnownSize + IoCapable<R::IoType> + Sized,
> +        F: FnOnce(T) -> T,
> +    {
> +        let v =3D self.read(r);
> +        self.write(r.set(f(v)));
> +    }
>  }
> =20
>  /// Trait for types with a known size at compile time.

