Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021121.outbound.protection.outlook.com [52.101.95.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0AA3090D5
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 17:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543389; cv=fail; b=CBSktFLHJMbPV+49nYqNYcrOG3f80RbuVnWlkRDO5QaK1Ojh7ke5w51uYYxlakjemNGh4Ny3r79ai5Qc3qA46RjK3FpA84tRtJNlyTkFqfAuEHgKzA569zb0V/RtZEiQ4cim/1GnUavgjFfZEfS8Yg07JZyxk2pNKavl7eKz0iE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543389; c=relaxed/simple;
	bh=kYAUFewyZLG2tc0wnl//gA4VDYjJpoD8HcWI7Siey9M=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GwQTihajHHZerd/ADHDz6VLMWhg/IYDXLY/yXdnfDWvVeb8bLc07Xk5ChhBjapYSbOQ/A+dGid/HIpmd2ukO5A6yNeGrjfEpeZpYwyjwx0y396S1HfoH+xDb2+g+aISSMg6aj9ya80PtpsAIaJQYk2b78qOYptpuIAe320SRi7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=OROKjIhM; arc=fail smtp.client-ip=52.101.95.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="OROKjIhM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLSjgduNrSebTwWhQcjrVV04R9r9++K1y+uY1Q725FLBSjP/yqyur8A1AJMXjXCdIw2hz5NxyxnC131DWycLUx7kYfDh8laMpjuWaXtFXcqPNXN7Bb3LL7Ng/o3KWjT9fKo06bsV9LINLMVLwO6K6P5AyYoi4MwKGRXyNB/qvY1z8sXupY2LFUv+C+fPPV4scPwLVPfxLp7YOyvbdqY5FyaL02nEcbMVlZA3mzQ2iz0QxbSufMbUKAfFG6jvKQGXLRP28vVq7vJaMKedmcOgfreydCMleEv5OPaejVOcG4WaKMNm50GXTsataCQDiy+OHoNixbQocI/ZLEA1uhZO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1AMqln2l1CJTLUFhdxu5kkhCQ8ZaLq3xTGBFYl58E4=;
 b=nDgJYcZrAqGtXwZaHRWteXwThHdrCqRewVCqfnKYNbMptc2wwmJ64XkerPTQ4TWHuIVx4ms4ibGYdCxjhyDWOG7P2XUgvcQ6uv90DEVHa3QdPJwYgb1dMH2tJwN49Q/H1zH/M7KuAg8TEsHmyjVSIaZUDf1uG32FrCBov4bY6BgMo1s9BE6Lj+3+ThgMLTw5UQgW/WIWdGT+9jSWWGhMe/f4y3n1sF/3kQFKoJRk2YZPrnCpMcq0IdcUhFn6inF1CsKZdf9pRpQdXWlN64XBLMswbaqjg+Y9wCF7gmzHlIagNnbwhunEpadGbZ8s5J6varA7jz8sw5U3xXB1SLvqEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1AMqln2l1CJTLUFhdxu5kkhCQ8ZaLq3xTGBFYl58E4=;
 b=OROKjIhMFHQRgepjXcg79eDs4W+HFkH6wJXYXx0Q4SxyGKNBDLkbsZ/GGrweM6bmr6ppVqWBq/DA9wt1F5m531u+AuzxRzODatmfQBqclwooXGqUUQChs4b+cFssG+9L6Km2PlbCiGLiByaHuz/glX8kp9IEqiSPFVwfhJ8vcAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2735.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:142::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 17:09:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 17:09:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 18:09:42 +0100
Message-Id: <DJ9SF78YADPV.3ECKCC88GFR64@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>, "Urgau"
 <urgau@numericable.fr>
Subject: Re: [PATCH] rust: allow `suspicious_runtime_symbol_definitions`
 lint for Rust >= 1.98
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260615143225.471756-1-ojeda@kernel.org>
In-Reply-To: <20260615143225.471756-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0131.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2735:EE_
X-MS-Office365-Filtering-Correlation-Id: c24170bb-9bc5-468a-f3e1-08decb00e46d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|10070799003|366016|1800799024|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bD1AAqX3Cb2RZ68QY8/xEbQAtHoHFK+BaUViU4VcvVLvAfk/HXvF/d0byWi6fXCpWtZ1tELXXfsam0qfrFiGQUxbw/JNcuOJZum7qwZdZMVnV3YvUezH/oW7HbmmWFtLHlDRox8Jt6b5QWxbo3RWIBo9df69D1sKLrH5su+UYQAWftCJCVZ0OI9DYBJDu/3fC2VeTwHmJat0WuoFmtia02h3X767piej+/rmuXHuQi/LEyHLNEuOPKuLEqHJ33+hoNdXviglgKNWEydnpaYuwqDBP8y1/Lkic0V9eBhOS1X1CF0uAUHtHXqZunJrOv0sLNC2gnSj4hBRA+vwdpuh7/kU73cQxl7ilDJCrU5OcY4bdcrmdfztpfVuvdjf/BcZ6YXZ0jSX+wWnPUtS6TiTRYqkzN1AB0fpho8eFQSK6CHJf0xOLBYZH/EmuxkmCKym06NIJblyJ5oo1mYtPmP+DfJlXIl/6L5lkNKIDTDvRIg/zVL7o8bWJWD7WzopsYRnk83h+4VaBqJKizGTKC95QlabCUMQ4xiJ/ZFMEsuIEZlPh8FyGYSfKhzOAd4gug2q7oQ61/eJYOOvSZrsm42HM+JSK3eV78o/+dSjIXtWycCCvfIY2wdrOHw0Oa7JRfTts82WMGXPVeUlLBRYM8rn9UI6m8Dq+Pq5nUECLAmbRm2qcszTGrAkMsz36u0QKn+Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(10070799003)(366016)(1800799024)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVRGMFJKYU51WW9rYkl1L2orcU0wbk1XQ2x3eHVmT0h4T3o2em1GdUlvcE4y?=
 =?utf-8?B?emYwZWRiYVE1ekFIUXNpR2hrUEZMZ3hKMk1FR2JsZ2VXdjU2UHNiSzZuTHk3?=
 =?utf-8?B?YkhlRktGL005Z1dkQ0lDcFhzTjc5T2FnR0RUc3RDR0pLZnhGYVE0VVRnNXJI?=
 =?utf-8?B?dGxTVDZFMGNNVlI5ejRxRFk3cWZiakJCN3pHZFRwWXowVzVyQjdqT2t4OHQy?=
 =?utf-8?B?TkViTXNTRklFRVBtajg2Y29qZGNySmNjTjB6YVlwd01SOWtkc0ZTWG9OOGYz?=
 =?utf-8?B?cmF3TWJjM1FUY1p6dGFjNHh0UHlrYUZMY1lYNUZzYmRFcGRQUXN0N2ttVzBY?=
 =?utf-8?B?U2dFbnR6c0wxYW9UckdNK3BwRWltZm9JZ0paVC9pQ2ZIblBaZjJ5SS8vQXlF?=
 =?utf-8?B?aWl6dzZWVEhKdy82WEZ1QkRCY0ozcTk2dlFlVzFFejhzRzNWSmk2akxteUtF?=
 =?utf-8?B?VU15QlhEM0xRZm1GdTA5ZWdNM2VMdDJaT0RCaW9jY1ZVRUdOazR6bmNISHpo?=
 =?utf-8?B?OVFPWmJhWTRkZVM1YVJqcWt1TklSNWJqbU5DMjZIa2podHRNNkptUFlCc2J0?=
 =?utf-8?B?S3NVUWNaQVp0MnhOSWllakxwU2VSeUFDWEZNaGhyQmhEeU9nVnZIT3VyOVpV?=
 =?utf-8?B?Ym1taENjV0FnMHRONnY4eVVzeDZpV2w4K3IycENBNXplQklPUXc3S2R3T1Qz?=
 =?utf-8?B?aW5TTHBMOVgwWTB4cU1jUFQ5QlNrbDZObHJ2SzhDc2JvWFJKZjBhVmRtWVd4?=
 =?utf-8?B?OHJEK3JBNWxWWEtiYmxxalhsZ2dUam96MTlMazRxUTlROHVSOEp0WTcrOGNH?=
 =?utf-8?B?UlcvZmEzam9md0hxSGg0QXRJbHlPV1JacGtINnNHVWllYlBCUXBPOUNha2Fm?=
 =?utf-8?B?QjhCb1VIZ0RDVUV6OW5aNk9Ob3E3SUZOM3pYSmkvUWwxQzFjQWx3Mk8vQlRt?=
 =?utf-8?B?WitHaG9qOGVvRm9JTTRNbURVY2U3bHRzVTBIQngxa3dwWk1WRjBoUE83K0wr?=
 =?utf-8?B?MG93dkRJT1U0MnExWmVndVh6U3haYzJoRFBpMzIrdnRSTnphV0tmNkVzeG9V?=
 =?utf-8?B?UnVSVjI0LzErcDlnK0YxQ1RWaGMzR2ZDN3dZaWZzQlNRMTBveW1PNDMzMDBD?=
 =?utf-8?B?aU96S1hkQ0tES0dvRUl0MUx3N3I3ZzFMWDQ2ZDZWME1SKythczZJdkUzaHRU?=
 =?utf-8?B?dWo3SFFtS0N2c3V3Ky9QOCtmQlh2bEJBcHNPRUVackljZ1JJb3gyWDF0SkNo?=
 =?utf-8?B?bXhSNGJobU5oVEJJVkFVbzB6M1RYQzYwaFJIZmF3YVZ5c2hMVmlBV0J3eE9m?=
 =?utf-8?B?c2lJVnR0N3FOeStJL2k3b1BpbDRYZ2RPaEVCWUlnSFBTa2doOWNod21YR3Nt?=
 =?utf-8?B?eDJkWUgraU5YMlM0alRWUExlTjRBbHdyd2tadytZaWc0dFdUT1hsV0VuUEJF?=
 =?utf-8?B?RS8vM2YrZm56OVlncXliNTlpd0VMV25VT0hGdlJ3TnpXSzdLbjg1Y2p3bk96?=
 =?utf-8?B?ZGhySVVKRTF6QVJCb3VFSDUvd3QreEJYbGtOT3d6RE9vZzl4QWRwZjJGa3o5?=
 =?utf-8?B?NUVVVHdSOUdFZG02ckR0WDhIZzRpb3JlUXRSTUlXaERsSUZ4Mm1KdnJYOUgy?=
 =?utf-8?B?cEhVWDZvREk1cUZXVEZyaERHajBSbGNyUWxIZ1A1Nks1ZStnTEtmaStwaUIv?=
 =?utf-8?B?TzZLK2M1WUdueXQ4VWxLdkJNUFJ6a1ZIZGlXU1ZqOU5WZnJjQ3BuN09uSWZM?=
 =?utf-8?B?VnYycnJJOFh3MlU5R0tzdjAyczhlSzdQbDk5RWJWeDRKV0RkVURGVWkzZXVJ?=
 =?utf-8?B?SVZGemdYVUN0WktqdlY4Mzg4bWQxYmQ1STl1MFZPczZncjdSRzI1cDZvSVZF?=
 =?utf-8?B?RjE3R052N1hDZUxaZk5sYmI5TTZMbGswNWRHc1JyU2t1ZDE1cDJaWGEvVjVV?=
 =?utf-8?B?SFNmN3o5aHF2TzBsTE53cW9XR0FCWHNOdEZUQTJRZFhaR1ZDam4rUlkwblJa?=
 =?utf-8?B?WXdKSjR6UjB1QjBobXpzZnIyWG9jamZ0WUptUUdWaXRoRVVjV1ZWUmkyUG5y?=
 =?utf-8?B?SEViSVFjQ251MXFDVHg0U0lSNUYzTlh6aWZQcUg3WXpLTEx5MVdDMG1SZ1pH?=
 =?utf-8?B?bDZEejhQSW1UbnJyYlBwYjQrWXFTY0pZT3psYnZ4VWxLMEFqRGhoK0JvUnEv?=
 =?utf-8?B?dytlTkNJNlRackdkbDdvVW05ZVpnZUZycXBWR3NEbTFrWHVZTmJiZTJCTTgy?=
 =?utf-8?B?VGlwQXl6M002aTF0Z1lmd29NSHJIb1I1MVBsQVZVZ2pHM3pKR0Y2aEt5VEF0?=
 =?utf-8?B?MjBnL052ZmFwVTh5Y3d6dGNJbTVKbnB2UmhrN1NwUmxDWk9QVWRPZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c24170bb-9bc5-468a-f3e1-08decb00e46d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 17:09:42.6743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSPeViVgmfy8QHK5eT0eW+UVgAeGqKFvLPhi2JU8GeLskXrvHC/QcIxkazNHeYDprXSITLYeNPqwgURga7ep2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2735

On Mon Jun 15, 2026 at 3:32 PM BST, Miguel Ojeda wrote:
> Starting with Rust 1.98.0 (expected 2026-08-20), Rust is introducing a
> couple new lints, `invalid_runtime_symbol_definitions` (deny-by-default)
> and `suspicious_runtime_symbol_definitions` (warn-by-default), which chec=
k
> the signature of items whose symbol name is a runtime symbol expected by
> `core`.
>=20
> Our build hits the second one, i.e. the warning:
>=20
>     error: suspicious definition of the runtime `strlen` symbol used by t=
he standard library
>          --> rust/bindings/bindings_generated.rs:20018:5
>           |
>     20018 |     pub fn strlen(s: *const ffi::c_char) -> usize;
>           |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>           |
>           =3D note: expected `unsafe extern "C" fn(*const i8) -> usize`
>                   found    `unsafe extern "C" fn(*const u8) -> usize`
>           =3D help: either fix the signature or remove any attributes lik=
e `#[unsafe(no_mangle)]`, `#[unsafe(export_name =3D "strlen")]`, or `#[link=
_name =3D "strlen"]`
>           =3D help: allow this lint if the signature is compatible
>           =3D note: `-D suspicious-runtime-symbol-definitions` implied by=
 `-D warnings`
>           =3D help: to override `-D warnings` add `#[allow(suspicious_run=
time_symbol_definitions)]`
>=20
>     error: suspicious definition of the runtime `strlen` symbol used by t=
he standard library
>          --> rust/uapi/uapi_generated.rs:14236:5
>           |
>     14236 |     pub fn strlen(s: *const ffi::c_char) -> usize;
>           |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>           |
>           =3D note: expected `unsafe extern "C" fn(*const i8) -> usize`
>                   found    `unsafe extern "C" fn(*const u8) -> usize`
>           =3D help: either fix the signature or remove any attributes lik=
e `#[unsafe(no_mangle)]`, `#[unsafe(export_name =3D "strlen")]`, or `#[link=
_name =3D "strlen"]`
>           =3D help: allow this lint if the signature is compatible
>           =3D note: `-D suspicious-runtime-symbol-definitions` implied by=
 `-D warnings`
>           =3D help: to override `-D warnings` add `#[allow(suspicious_run=
time_symbol_definitions)]`
>=20
> Thus `allow` the lint in `bindings` and `uapi`.
>=20
> A more targeted alternative to avoid `allow`ing it would be to pass
> `--blocklist-function strlen` to `bindgen`, but we would perhaps need
> to adjust if other C headers end up adding more (or Rust checking more).
> Since it is just the less critical one that we hit, and since eventually
> this should be properly fixed by getting upstream Rust to provide a flag
> like GCC/Clang's `-funsigned-char` [2][3], just `allow` it for now.
>=20
> Cc: Urgau <urgau@numericable.fr>
> Link: https://github.com/rust-lang/rust/pull/155521 [1]
> Link: https://github.com/rust-lang/rust/issues/138446 [2]
> Link: https://github.com/Rust-for-Linux/linux/issues/355 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  init/Kconfig         | 3 +++
>  rust/bindings/lib.rs | 4 ++++
>  rust/uapi/lib.rs     | 4 ++++
>  3 files changed, 11 insertions(+)

