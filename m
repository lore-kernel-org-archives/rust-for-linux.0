Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021086.outbound.protection.outlook.com [52.101.100.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF2A40A926;
	Fri, 25 Sep 2026 20:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368919; cv=fail; b=RyB50iNylejzKLzI8img5AUvUu3jTJ4Ky2eL6L+mxdZ7aMJe6pnfs+3pji/eUv8qEgDP0YGK6P7+nZahXtSb0uabqkLg7go6At8FciD6uKYItEgIyztzcEGDXY3qPs7eqWTNCVpicP4COdsGfjTE0ljIrvbvmd3NZxNG9MZcAN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368919; c=relaxed/simple;
	bh=6GTsilTF0BgRGmnDX4NLfPb2crUR0IwNMnV89+FIDIk=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=H2rHioVC+3hw6rWbomycbfy0amwukW8c/po3LPwxQcqekwJUA4M/IKkP2mDveBIo+uuubaCM9BO4+sBWV4qYbKC03k0uQ2cLuUDVe0Ma1ywQFsQyFBjydkEiZh1VuNWHufgZVjUGC0VIfVEEnceG6s+dvd8W2rYo0qOGWTXDXE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DTJrgM4D; arc=fail smtp.client-ip=52.101.100.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DTJrgM4D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxf8Nmn66A+YE9GmwJI+36dZ1sDTMVwkZXM5dEs8Phi0/BgxTMldYuIV7zCoaS3MlGHk241UtxqmSrBj5g+VdFab/AY+8Y/7um5h/gIXK9Hm2pbvlIlB/QnTr0PumpGxt/TmFAXDx87TGaW7j+uaXoiS4u3AtiVes1fVH3e6KbsTlN1kYegJyDabEgx1FiB00/hpGT4NymoV3TMSD/MZ3ZlFcWZQjyYxWZKJSt69lBtaOIlZH5RUZrHVOM1Gm2W712dadwU8BJf3GKU6pFvpxdNd3Uaqjr1fsxco+DXAap76aNrrndjtBHgZaAe5QCzuhT1xgFKY6hs0GHwObHI/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XP5+j4Mc10yUKuQzoT7jNLZGO+GrnoTFnPxiB6t1LLE=;
 b=JA4MVKzkiJV0QF2GkoUwVnlOd14r5R4fjWpbkD40S+QDTKsgEZsKvJ6uOk1UMGGb4g7r8LcKE3aEsEixiSJXF2w2xEzoj1y6MJ3vnsxeBWEsE+tebk1Ic0ZGOkXNvi8Smhzob3ub3ubBJAXpS+kzB5lJ7nF6aBhgY3E6f7uNTypgjkGsGhAccwkL1QF1Yg2Ln2YEEvxBq76m/6b11WYtPEsdzuWkUVY3HjqO03GElRsPHn+c54fOnzn5lvbaZR8iL6q6cdXPrEKADvubvd0RTZTkdzyvzCJbSNIOq4moIaZFT818rzCmRNe4BTwu0w3rVCCjeLuRVxfLaLTdObcwyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XP5+j4Mc10yUKuQzoT7jNLZGO+GrnoTFnPxiB6t1LLE=;
 b=DTJrgM4DFZtOdXpDlOyByhwKg9lAXUAjiwMH2VCd18B753UdEyNJ8JevSmGHks4fj65StUU4mKtg/oI/Tlr6+NhTUy3i6Mzzx1Ry83HCmzeHIoT0KXemo+gs/PhZzf3i2BjazljqJ6SkM3yhulJVuW6UUxrvm5484xE4LgCyq2A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO8P265MB7506.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 20:41:54 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 20:41:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 21:41:54 +0100
Message-Id: <DLOOT8LDHDKA.3853XGXDK1GFI@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/5] rust: pin-init: improve diagnostics of missing
 `#[pin_data]` and `#[pin]`
X-Mailer: aerc 0.22.0
References: <20260923-dev-pin-data-diag-v1-0-e4d7193569e5@garyguo.net>
In-Reply-To: <20260923-dev-pin-data-diag-v1-0-e4d7193569e5@garyguo.net>
X-ClientProxiedBy: LO4P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::9) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO8P265MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: ad49e9eb-a9e8-4d89-c7d3-08df1b456f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|10070799003|23010399003|366016|10067099003|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	93d+TRD8cElPdSHI7L/B927R//iu96EeKxEl/biheBQSJ/Yer2303YJlTccl3o4fS5Y5WCP6/XqCIeatOfMIbNIy/Oocx+Joa3VfC/mhXJSNT35pUrBvD4UCTljCLgmLUgroHOM09LRRoU0GR032msJc11O1WGGs0dSIMKTnHYGJ7QZf/e7j5ry00erXCXPHQ1hts826kBgPvW7ws3W9dD5d0ZkvW6QXx4eCKzPzHocwFRcfrDWEkBwLRowgz1pf8l+ad2l5txvwqRxi+rvze1Wne2IntEPG3gon2aNXMtNz4/NmJRwZudSrt+5n7GRMGuM/Qblbni3GpTXbJZlBXFATd2S1wzXSInUKnT4N8bFBaC+wOCdYExJhZ6sT5kXlClaThIAM7IdE6zjC9MFhclpvvEJrKnOepGUsIfgkxxWZ2AbTPPgiZpPtUcZFq+anwQvvjNKPpge9rmLaEiXXe1s80y4CTFRkk8hkBmho0FoQ8Juzhk6twWE3agMQer9Iy3BL3gnBD7u/ZGYKWwnKH3T2GV+UWMTGxh3ZB9oFB+S2GSWxpqwc14fuWQlwDDtbUgvkxDplSiBplTB3lMpUACaTurAZq0mxSDUdl8J3eHvX3eV9gsWFgp4eo3X0veGX61uHHhu8h6XtKnLEwt1Xb4TBALRnwwGut8xcfcmn+ctY4l9YlotjlmGzrYxnOPXe9CNixXVTj6F8Ka8MjgHu6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(10070799003)(23010399003)(366016)(10067099003)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE1vL0YwQUJPZCtGalV0OGVuM0hOWCtkUE5FYkR2aEk4cjE2TEt4QXBpNmU3?=
 =?utf-8?B?SVhyWk5hdUdDelByMWhKSElGVkJXK3BSZHVRMXRPVkd5RDlzWVpwbUMvNUw5?=
 =?utf-8?B?bXEraElhd2JPSXY1bWk4TGdPVmRsM3d1SWNQbmRIV3I3MXRMLzV1WlVvUyt1?=
 =?utf-8?B?TmRxWWlDa1JaTkVSSEFwNkRRUmxWSno3RWd0cXVGK3dOYkhNUjZQbnJyZ0Rj?=
 =?utf-8?B?QzRTcDZjMHp6TGZBMkQ3TmNDTytwdWRWRG9qNnFKUTYyYnJPNVBZeDNldSt2?=
 =?utf-8?B?SGpvaEZIL1R3Y3ZhTVJFbEljTGk5YzNtL0Rya2dJeFlOQWtrMDBCUGJ5OEhN?=
 =?utf-8?B?cU56OUpOanJHTUJQZUVpMjBweDN5amIvTld4ODAvT1RseFlVc0VVOEhUdU9K?=
 =?utf-8?B?dzRxamJLdThkQXVuNXd6VFN3VUlBSWF2cXduN3RHcVAxUDQzTnFOdGM2OGRs?=
 =?utf-8?B?VHMrYjcxUXVRL1JKUHlETWhpMC9pU3NsNVM1bHR1dlJIVng5OTI2emVNb25B?=
 =?utf-8?B?MXRieENKM1hERnhIdE1zbVkrR1QxTVl6QmtRNE9iSEVGYjQydjNhSXMyRU5Q?=
 =?utf-8?B?THNDQW4yVjVmeFZEMGd4b2g4KzdlcDVxQWlYeEhOelJtSEZyQ1lXU09zZkZl?=
 =?utf-8?B?RlFFWDhwdzhRd1R0YUhOWjdrRGVNZHdkcm05RVRpaUNUNURxaEcrbW1sRHZP?=
 =?utf-8?B?TXlrb0V0bWdIOXJ4S3R0VUJ1Tm5XQmVYaTNzUkZpSFpPQ3VGUzQrSGhSL0lm?=
 =?utf-8?B?V0paRlIxTE5ld1NiQUFWQmVHZlJ3WXZQMzJYYkdXMXVuYTNFNTlHL3Brc09M?=
 =?utf-8?B?K2l0dVZCSmlHdzN5RlRDdWFGaURKSm5YV2RMK0RKaStUZVk5U2ljZkZkK0pk?=
 =?utf-8?B?bHBNalR0SWUxVnQwMW5lb2dQd3JHWEVGTWwyNE9hTEp5b0h1bVltelVDcmNs?=
 =?utf-8?B?ZnB6cU9rYlVzL2I0QUpJSStRcldSVlpsM1lVY3dRRzc0akJCM05oWS9yR0J3?=
 =?utf-8?B?RXBUaks3WDRqNFhEUCtQZTVPZUVYbWVrUG1lQ1AwMVg0MXNwdWNUUnpyTXQ3?=
 =?utf-8?B?M3B1UkdJVmNkcm9qRjNaT2F1ZzRMakVYeHdtZWZQOTNKUUNuZXZpMUNFWkQ0?=
 =?utf-8?B?Y0NvREgvS0RmeU1oL0JwYXdwemtSK3dTNExGMERLSWVkZXg3Vkt0YzB6WjJ5?=
 =?utf-8?B?N0pRNS9ibG1pWXpmU0Q3OE92TTNPSXBTVzNnZURrdEdDSlFCeGFJLytlRUtN?=
 =?utf-8?B?a01YZzJOMlJFUzFVRXFwOFAra29rWE94aXpiV1k4WGVoZHd3YVFVcnNxeFpT?=
 =?utf-8?B?MVhpRVNkMUcweXJxUWd3QjBUOS9LVjJORkhGbUw4eXJPZmJ1K01HOEJNOExa?=
 =?utf-8?B?OURsdlFXNzJKMGJIMDRzakd2K0MxTHlKSWtpVWZLWHFOUkh6Y1l3NStnOUxw?=
 =?utf-8?B?QW10QkFVZWtZQ0E0UmNWV1l6OWpnWkZscHYxakRjNmJEQWx5ZEliNDJJZlhE?=
 =?utf-8?B?QkQ5TC9VVkxRNlI4alQxREZPbVpMZTZkbXJpUXB4MW9RNFFHbDgvait5ajh2?=
 =?utf-8?B?M1pRMUM1NVVEWGJIekRRZjRWa0FDUWxpLzk1MjdJaG9ieFZCcmZLVnVZWXd5?=
 =?utf-8?B?QTN3NWs3ZDg2LzdJNFczNHdHUS9tbGYvK2ZpM0ZhaXN0UFNTSktTRDF0aGp6?=
 =?utf-8?B?MUl6MnFPRzVsbkU1aG5GbDJPS3NTWTZHWkQ1K3FqVXFsS2Ria2J3dFJCSFNG?=
 =?utf-8?B?bGhqMEdPcXRVb0poNVJrUkFvVVJIL1dldGdERmRSS2VRRVBIaUNnQnpEQkVE?=
 =?utf-8?B?bVZ6dm5YR1hJYjUrN2tkSElPcS91aGVmbWNka2Q0SktxZUNzektGenBPQ2F0?=
 =?utf-8?B?ODJ0RmtmOXQ3VHg4cFJvMWRYVkYwWThBZXBvRG8xOGZnYkZLbTloVnIzUUV2?=
 =?utf-8?B?NWJXMGdsRjluTndzRWxDWWorZi9LV0Z4dW5oM0xEbDJTYlhTMjdSK2k3WldP?=
 =?utf-8?B?TUhpR0pOdnh2NzBSL0tnQUN2OWFGZnBRVlFycU5kSUhsZm9mUld6eDVYdXVt?=
 =?utf-8?B?dlFiNkJhSE9zMzZCY0MyZUFyTVV4YXRFeGpUalE3RjhGazhyVjZQSS95MXUr?=
 =?utf-8?B?czE3RmpNem9wUitYTCtZS2oxTjUrcGxPR3dUamF3b1IvdGpsUWEyNlowZyts?=
 =?utf-8?B?aDZRMmpHbDB6Q0R0WUl2bDBlTVVlZlM5R2pvNlhNc3pzT3RacUZPbU02bXVB?=
 =?utf-8?B?eXNGYVVPUExhSXQ5c3Q3VE9XS29sWmpyTG9GOTZHTHZHMXorRm5HVk5hN0lY?=
 =?utf-8?B?TU85K2k0TWdzOVhxamdnb0lTYVkrNkpTN3hidFl6SkR3LzIwTjlHQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ad49e9eb-a9e8-4d89-c7d3-08df1b456f6a
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 20:41:54.6610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VsSKMv6IPwQqnmoig7X2S4m6VjqHGzcfH0kdvynNgqzUE4VgkT83kL0athvm1GAPvCvcuqHAWsBLxOk06P+XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7506

On Wed Sep 23, 2026 at 7:20 PM BST, Gary Guo wrote:
> Improve the diagnostics of missing `#[pin_data]` and `#[pin]`, by adding
> diagnostics attributes. For `#[pin_data]`, we have to change the expansio=
n
> to retrieve `PinData` in a two-step process, so we change the error messa=
ge
> from "method exists but trait bound not satisfied" to "trait not
> implemented".
>
> This is the new error message for missing `#[pin_data]`:
>
>     error[E0277]: `Foo` cannot be used with `pin_init!` macro
>      --> tests/ui/compile-fail/init/missing_pin_data.rs:9:19
>       |
>     9 |         pin_init!(Self { a: 42 })
>       |                   ^^^^ unsatisfied trait bound
>       |
>     help: the trait `pin_init::__internal::HasPinData` is not implemented=
 for `Foo`
>
> where it was previously
>
>     error[E0599]: no associated function or constant named `__pin_data` f=
ound for struct `Foo` in the current scope
>      --> tests/ui/compile-fail/init/missing_pin_data.rs:9:9
>       |
>     3 | struct Foo {
>       | ---------- associated function or constant `__pin_data` not found=
 for this struct
>     ...
>     9 |         pin_init!(Self { a: 42 })
>       |         ^^^^^^^^^^^^^^^^^^^^^^^^^ associated function or constant=
 not found in `Foo`
>       |
>       =3D help: items from traits can only be used if the trait is implem=
ented and in scope
>       =3D note: the following trait defines an item `__pin_data`, perhaps=
 you need to implement it:
>               candidate #1: `pin_init::__internal::HasPinData`
>
> and this is the new error message for missing `#[pin]`:
>
>     error[E0277]: `impl PinInit<usize>` cannot be used to movably initial=
ize `usize` with error `_`
>       --> tests/ui/compile-fail/pin_data/missing_pin.rs:12:18
>        |
>     12 |             a <- a,
>        |             -----^
>        |             |    |
>        |             |    the trait `Init<usize, _>` is not implemented f=
or `impl PinInit<usize>`
>        |             required by a bound introduced by this call
>        |
>        =3D note: if your type implements `PinInit` but not `Init`, you mi=
ght be forgetting a `#[pin]` annotation on fields
>
> where it was previously
>
>     error[E0277]: the trait bound `impl pin_init::PinInit<Bar>: Init<Bar,=
 _>` is not satisfied
>       --> tests/ui/compile-fail/init/invalid_init.rs:19:16
>        |
>     19 |         bar <- Bar::new(),
>        |         -------^^^^^^^^^^
>        |         |      |
>        |         |      the trait `Init<Bar, _>` is not implemented for `=
impl pin_init::PinInit<Bar>`
>        |         required by a bound introduced by this call
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> Gary Guo (5):
>       rust: pin-init: internal: make `__init_data` and `__pin_data` safe
>       rust: pin-init: internal: remove associated type of `HasInitData`
>       rust: pin-init: internal: use `HasInitData` to provide inference he=
lp only
>       rust: pin-init: internal: add custom diagnostic when `#[pin_data]` =
is not implemented
>       rust: pin-init: add diagnostic attribute for `PinInit` and `Init`

Applied to pin-init-next, with typo pointed out by Sashiko fixed.

Best,
Gary

>
>  rust/pin-init/internal/src/init.rs     | 25 +++++++++---------
>  rust/pin-init/internal/src/pin_data.rs |  2 +-
>  rust/pin-init/src/__internal.rs        | 48 +++++++++++++++-------------=
------
>  rust/pin-init/src/lib.rs               | 11 +++++++-
>  4 files changed, 45 insertions(+), 41 deletions(-)
> ---
> base-commit: dfb6a037fd586f1ffcba3b143dab58f5c88294d1
> change-id: 20260923-dev-pin-data-diag-65209ab751fc
>
> Best regards,
> -- =20
> Gary Guo <gary@garyguo.net>


