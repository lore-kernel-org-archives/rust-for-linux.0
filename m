Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022098.outbound.protection.outlook.com [52.101.101.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822E3442B06;
	Tue, 13 Oct 2026 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899686; cv=fail; b=cSb/BnXi0AvaHzhvSYv9Zt+iC4bVoB0XoTyR6lFJqmNWBRF3N6AJSsE0bmAzl3xd06ll7ubtlrnsbyCgXUeUUOxWXfrs1zYr1kZlkpzDO4oK5MQNMbqjyRVJeME9K9svod1YjfXN8tQ6h3vZSiHVABKs5/JRllxoXtSnQei+zgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899686; c=relaxed/simple;
	bh=Y+L35DGsp/Be3P8HJJ0GTcFnHcQiG1zArq67MOJwbzM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=anTsgM7kOMuh8T0V0pyiz4jRDNF1Z3L5Sm87ALOIy/YrpJ/iYeo569F7+9FMuaEbM2/3MyMs/5lQAfIaOypEywUkc1ZUyZ2My5wL2ifm+Jeuf7QuseTb/N3f8b1lZExKbN8KJJBejQc7k6EAJPzgtu8qvtyz3O0/5nW2hlw0de4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=sf5Te0/1; arc=fail smtp.client-ip=52.101.101.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="sf5Te0/1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oF3pI3Gg7ohVjOXGSqt/fSfE3FxwX1kb6RIzvFUh+R1cfxOZ2Qhg98S0EQZWE8UdLqKswzFpq+g57L0Tdtpr+OPA94TDW7Ja6jK/yTNzCeifhj/4NUM+tR/BALDwpkY/JPUGt9VxFn7x5URw37Vk18eb3ADU2QyFuhsPnLY6/qawsXfddqRenSRL2j+ZgY3mfTvezH4fbhThAcLWdsWnMuhLPQMb54xa0QMflZ08ek52OUsDJ13SIAt7zZuCcrq4WeTHgb/zOrIqlKhie30p/ViW/CSPGJLXBOLTCvoWBy5UfWgNZ3sAYA0BA1ryfnvDSvcaNuevPlO/jtC1Z01FIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHB4Se3H8Dnz88jujxbqkl6SGSeejQ2hRsABy2jP7Uc=;
 b=oBtlHCc61rc18NMeQMfahVfM6bmpmS8wK3TF+ERbocDnBInk4NU/pI3t2LWvgiTEhl2bTSYG3yW28Cxj6sDFkipDfIaSKa2/DyzUzoYLL7n7Apcydm6E59h5D5BT6Nu//81+RhIBhqqWSF+kxDkt+79LLImzyUyOEsAHLs1sEbMMvs2DIAh1IVeYnZ9+PbmBj1O5YBjIXD1Fu7BjjCkhjzbMCzTixxsnxAe2hbjvERpBjnkAfNO3YZAeZuRNT5P+BPPNHI6BL6Oj3SyB3SX1WbSEy1mqU48DKrq5S2VR91azpMDDxldnbdaYbbjodSwjTg7sRZs/Hu1a0wViigj5AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHB4Se3H8Dnz88jujxbqkl6SGSeejQ2hRsABy2jP7Uc=;
 b=sf5Te0/1iIXpxibDAPhuyWZdgJUGFuwKAD48/JA0Va+hTWpM8w81IXrRIENtPo5JU/W1KBAphefTy+lNcbb0bcW0MAm2l+lLSD5migr/E5TeknBlkC+q63g7PEO0dGfUtdAEsXApq4tY2/2IWi9y15lBhx9eWd0N+6Nw2FhABmg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB2692.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 13:54:40 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 13:54:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 14:54:39 +0100
Message-Id: <DM3RF8H2M4WU.1CB0H9Z2A6WQY@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "Thorsten Blum" <blum@kernel.org>, "Francis Laniel"
 <laniel_francis@npnm.eu>
Subject: Re: [PATCH v2 1/2] rust: non_empty: add NonEmpty
From: "Gary Guo" <gary@garyguo.net>
To: "Lorenzo Delgado" <lnsdev@proton.me>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20261012-nonempty-slice-v2-0-0f2b67d9463e@proton.me>
 <20261012-nonempty-slice-v2-1-0f2b67d9463e@proton.me>
In-Reply-To: <20261012-nonempty-slice-v2-1-0f2b67d9463e@proton.me>
X-ClientProxiedBy: LO4P123CA0311.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::10) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB2692:EE_
X-MS-Office365-Filtering-Correlation-Id: f323c890-92f3-4f56-618a-08df29318694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|6133799003|10067099003|18002099003|22082099003|921020|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	wIs9xUVuhqZ6DIlU1Tn9p4JjXotBZftfzxMO5CjaUiYO4S4vaL80RcJKwTr1l/eDLU5B4MpKvg9q7p+LpQDNhtk5AgphYmaKjGGOBoiTI3bjLVRVqd4x8j5XO44BfOSyLqUfmi2wUYIsK4SR0zeaLK9v9RiiKhTgp0VAI4wnOwAMQjByHV65I6Paort4fSqZjKzUWJIHDSGMR38e7WE+9MbvNDUMuU+vWki9XhgmsX2CfGc1Aq3fFWHtzyQyRNM8g6zpf87DoLefG3a7H+qYq245msZhJE/lTtlYrjLVIDd4Ek57w3fKM1qous66RcaIV10Ais2IzFD8OsqludsF2FCyo4CjOMBCBXDS4cU0w3PWcjjgnb4hsV8sRo/qLE40YUJXWSVQod8panCkK2jCIbuTES7hN1HICZeAskQgDyePJInz8qmuhHGDd+yFnDXVKWweZhuWoE6oy/b93weLZDwab9E81W2kuPKQQ/0PXn0zRvutUmzaZty3d4d4nk/TSU0NdOnoGDKiB632r1EeXx22297jd8Ll6YhYz3zFZwhti78GnuCLucCIJejl/2dxg1GjrhsownWxg3oWwoBQMujl9pLpB91Bf0xCiCE9l27BVBJ2u3oh9saxcNGrtUimvBjeJ36OVh67LSJQuKMNpfzA0Fpsh+1J+vZvFGLf1G4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(921020)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWJISUFTSlhUeEtGZkxyYys5WlFNSzAyUlM3SkNKOUNOV0xXK09oeTZUcDRJ?=
 =?utf-8?B?WFFvSlJWSWxmVlVabUdKdERYUHBBT1RVYjdYZi9aUFEzeVN3ak1aekQwa1Ew?=
 =?utf-8?B?dzFyTUhPYVU2WHlhTGRZdXN1K1RqRm1QeHIxaUs1bmtNK0JQcVJhcmtQbUtz?=
 =?utf-8?B?RHJ2K3BNczlQTWJ1NDZlL0NTTklJOVNQMHkxTVFRQy9lVGh6TmxqS0hGREpV?=
 =?utf-8?B?TlBjVEdEeXJZNXFzODZBS3dpVmVPRTcvUUFacEVDQTRXcFkrMU9TeFZwNGxO?=
 =?utf-8?B?R3c2MlVRTDY4U2JQVjJobThIMDJ2cEh0cWxmaG4xTW1QWW94NVJPRDJTRFFB?=
 =?utf-8?B?TG9LSTg4ZDE3bGdqMlR5YmZyK2g4ckk0L21UVmo4aVRQelliZFpGeHZuWmhy?=
 =?utf-8?B?SWx6UllGWFgwT0lmdm5xTmxmR2svVUVaVDkyV1lVWGErcXVpektoRXhKWlN0?=
 =?utf-8?B?emt2TFNObGk0VXZZKzNyWVdUalc4d1VGbWtvdTF1dEViMnVNbDBGaFJoWm52?=
 =?utf-8?B?SFc4ZFVmMUl3anlTOEpqRFFNMlI0cmV0elpGNmorY0ZmODllSWlmVmczbVU0?=
 =?utf-8?B?SndReUhMYW8wc3FPQ2NwcXhXeDFoMnVBOUxXeWFJQ1hSZjZaK1RmeUI2QTdD?=
 =?utf-8?B?Z1MvdHpHNnkvdExxaklYYlZKYmpObXk3WkloRXhsdXFmZUJPTXk5THBqdk9i?=
 =?utf-8?B?U1pYS0kxLzZSamRlS0Vuc3RYTFZQK3hyQUlhQ0MzUlNReXYvVVhBU0R1OGxt?=
 =?utf-8?B?UThxUnVQZW5JVjZpOHR1YlM4eU5WSDl3blhCelRpcGozYyt4YVdSdkhKeWxK?=
 =?utf-8?B?S3YrVFZvTHhibCt1dzNQT21pRzd0WVNVeElsTW44NHpGZmpVU2hkaGxHbEpB?=
 =?utf-8?B?eEtSWGhBRFB5OUJGV0JRSzFNb3pSaUxGWEg4cFRGOEhyUnlmenFZN2NFTjU3?=
 =?utf-8?B?TWwza255ZjZxSkkrMTl2ZnNtZlFtTjRWNFJVUzB1NGRFb0h5aERtMjR1V1Nu?=
 =?utf-8?B?UE1YNExyZFJZZnhQa2ZHMXJjRnpRMFZXRXRseXlybGNwblZRWllFaVBaSnQ2?=
 =?utf-8?B?U3VvMEtrOHVieHVmMEQrV0NTekJONmRFcWIvOXpQOS9KNWg3Y21IbStTbW9M?=
 =?utf-8?B?T3R3STF2V2lEY1FCK25PajV1L0tPVHRXSHVSNjlwby9jTHZqVlNObzJ5S0Mv?=
 =?utf-8?B?WFB2amhpNkZLU2w3TTRvRFV6NFczbUVCQ1ZkaHc4cWd3d0lRNFlPbTFJbkkw?=
 =?utf-8?B?MzIrV0RPM21EL0lSV3FLQ280ZjZyYUw2cjk4S1RaRWhCRHk4RFQ5TlgvV2Zn?=
 =?utf-8?B?Z3lEOEpDekR1SUYyRmVOZndBSjBDK2QrdjlmZi8yMFVDS2p2Y1VZbjEvUkt6?=
 =?utf-8?B?M1lJZGd2eFE3dXc0OVJHSm43VS93NU0ydmh6cWFzbXdKdGdCVlRnY0pCSDZl?=
 =?utf-8?B?VzF0bE9yL05uUXNQRS91Z29ULzZvd0pCZUFZUzVOK3NOZ1FrN0xFVGN5TThT?=
 =?utf-8?B?QW5XUjA0a1dBOUFRTmd1Sklqc1lTQldHU1g2dndyMTRlSnpBb0lBT1BxWmc0?=
 =?utf-8?B?dTlpWkZFSFJsdFJwUFA3aUh5U1JEQ1IvbXFBd1dBSFZ5N2Y1NHQ2eDdIRlE0?=
 =?utf-8?B?Yml0cVlqL1JQV1VyWDRqQjF3ckdoN1ZZVFBqYlJ3VXMraEpGQndXcVBRNnQ3?=
 =?utf-8?B?RTFKZjQxeVhjVjFGVjZBbDVsMjJiWGhHVlk0b3RqcGZrQklNdVF6OE9uOXBn?=
 =?utf-8?B?RlBJZEdONFN0bnhHZG5yOGVaRnFxOVlJN0tjeTdzYUV5ZUQ3eVpSU2J4SUE5?=
 =?utf-8?B?MzE0aXJ5emExZXAvdGdOL21BYytSZmlYemp2NGlHd1g3MDIzS2JPMWhXZUpQ?=
 =?utf-8?B?OFlZWkhGNmNWeXVBZUNIdndGSngyVm4yc2ZQbVpvcUFjVVZnTS9FcDhKdjBD?=
 =?utf-8?B?Ri8xWXRmeE1ESGw3YVVOc0VFYmRLanhVcEdoMk1GcUJrcUhWVVFyZHQ5VlBM?=
 =?utf-8?B?RnlaL0hDU09FVE5KcUVzZjdYQUltN1cvRWRMdnNQVzVuek52eVlKWVJNNG1n?=
 =?utf-8?B?QVR0QW0rTXJxTG45Q2tyc3pCb21iVVhaVkx2NGRwZ0diRDA2dFIwUFUwdEV1?=
 =?utf-8?B?ZHFlSEZkNmx0RGpkTkdNK1Fxc2lub3lwbzJYUGdkeHBuejhrM1N1S3FUeTJS?=
 =?utf-8?B?ZldJSndqN3lUdGFRZVBqOHRUSmczOUNCZlJEOEpKUWtFQ0tua3lJZDY2dEpD?=
 =?utf-8?B?NnM1VnRBdFczNzk5YWZ6aE9zRWd3cUJjVUw2UDllLzdzQVRQZnpOMjhNNmx1?=
 =?utf-8?B?aU1Ha3JFVzR0TytpNDdOR3I5T0M5YWE1VG1naFBmTUw0cVQrOHhudz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f323c890-92f3-4f56-618a-08df29318694
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 13:54:39.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7qIHYxl0yjTrSetHWpL6gw8ZSmZUbx3hu1os213sEevNMGJCsIyZb7kMrAF8uqZk4RxG7QHTFn1MOdvKWokkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2692

On Tue Oct 13, 2026 at 2:49 PM BST, Lorenzo Delgado wrote:
> Some functions reject an empty container up front and later rely on it
> having at least one element. The type system does not see that check,
> so the later access ends up as an `unwrap_unchecked()` with a SAFETY
> comment pointing back at it, or as an `unwrap()` or an error path that
> can never be taken. `strcpy_into_buf()` in uaccess is one such case.
>
> Add `NonEmpty<C>`, a transparent wrapper that can only be created from
> a container its `IsEmpty` implementation reports as non-empty. It
> dereferences to the container, and a method whose `Option` only exists
> for the empty case can be shadowed by a version that returns the value
> directly.
>
> `DerefMut` is implemented per container, only where a mutable reference
> cannot change the length. For a growable container it would let
> `clear()` break the invariant.
>
> For now only slices are supported. A slice of unknown length goes
> through `try_from_mut()`, which returns `None` if it is empty. An array
> goes through `from_array_mut()`, which checks the length at compile
> time instead of returning an `Option`, so a caller with a fixed-size
> buffer needs no runtime check. The only accessor is `last_mut()`,
> which uaccess needs. Other containers and accessors can follow with
> their users.
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://lore.kernel.org/rust-for-linux/DM0D9TERQAM3.2Y3HV6P68E2N8@g=
aryguo.net/
> Link: https://github.com/Rust-for-Linux/linux/issues/1262
> Signed-off-by: Lorenzo Delgado <lnsdev@proton.me>
> ---
>  rust/kernel/lib.rs       |   1 +
>  rust/kernel/non_empty.rs | 122 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 123 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 7225abc64084..8e1928deac35 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
>
> +impl<T> NonEmpty<[T]> {
> +    /// Creates a [`NonEmpty`] slice from a mutable reference to an arra=
y.
> +    ///
> +    /// Unlike [`NonEmpty::try_from_mut`], this does not return an [`Opt=
ion`]: the array length is
> +    /// checked at compile time, and using it with an empty array is a b=
uild error.
> +    #[inline]
> +    pub fn from_array_mut<const N: usize>(array: &mut [T; N]) -> &mut Se=
lf {

Construction of array should be of form

    &&mut [T; N] --construct--> &mut NonEmpty<[T; N]> --unsize coercion--> =
&mut NonEmpty<[T]>

Best,
Gary

> +        const_assert!(N > 0);
> +
> +        let slice: &mut [T] =3D array;
> +        // INVARIANT: `slice` has `N` elements, and `N > 0` was checked =
at compile time.
> +        // SAFETY: `NonEmpty<[T]>` is transparent to `[T]`, so the cast =
keeps both the layout and
> +        // the pointer metadata, and the pointer comes from a valid `&mu=
t [T]` with the same
> +        // lifetime.
> +        unsafe { &mut *(core::ptr::from_mut(slice) as *mut Self) }
> +    }

