Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021082.outbound.protection.outlook.com [52.101.100.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF302E1EE5
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 19:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772392486; cv=fail; b=JkWeaKm5J45btbgbl+Xjaqdk1wpatLa3LPOQsNAPUp7yftE/8pu5YL62lxEoLNw/wsVKeGNl7g+JQ2uQTYy4XvVgahCIlQNzvRUorqWIK3oBavq5Fu0rSktzvNllBzqjLd1Gs7GyDJ4xpulMbMj9m5ZJy7QewOR5QXs8GEkc5aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772392486; c=relaxed/simple;
	bh=LbqVzuL53K4vBHezFDG3xDJH/gWr/0EYTWZc6w++vOc=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=bZAS3roWT5PcmqRfMSm2iqnIYWRwpnkVVIVRLzy8lChhFtcweWf8ExIwjS/ST4vB18g+CT/k5Wp4BNsupFz8M784mkbHRKYdorzEtt3HKNsxgeKhJEyP+78iRzW0ZbsbRN003Int9Jn0o8ysCGWePvWhy/jmi5+r6FvHdsEoa0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zyMZGMs7; arc=fail smtp.client-ip=52.101.100.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zyMZGMs7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIsnAadRcPWuQkpxZg1ZzPhOJhQ4ehS/pulu8Dl795Q2I5Onepwoh2mPrD6Wx8J5ET5r7i8hg+AFoFTRM4yrOk2cpII/P9f3jLl0IJc1XEf5zLQJTNqMpAnhGn51rY35HTbj9PdcxxIrPeiitn0OmfCTDFsAkrunq0FMrF2aJnwjNIg0zh0DxOlzprn9yXt8aQOlgRZuS9c1WULjRcA5wiWqI51tHDL307AABRUuYtNFacX46to7sH2f5WV7M40hgg+qh0C5gmMaJlYBSqGSCzm051qdf/tJik1yPoPmoNIq2jZBQxKfkgd/3QKWTZ15ksE/hXiuOocFRaquOBkyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzCzAHdmpwlbGOZRSbbhm04NnfWv7/K3gjWeAdeCSAU=;
 b=Qm031HnYvxcW1pByotHexwXUaLkr6tThYkKWoOsY79hQOQNOTdSxpatxkQNwVEETDRA74pxL3BfulZlT6sDsRofKqNeSp6voqD8cgSiS2onl1P+bjbS/bZEnSDwmgfnDZc6DTT2owSev3rt6T7DpuTQ+ASekvo0GajhB7u1o7pagTTJxJv/yHvWyVOfVIjF2Mhb7mLwdCBMhDZGqZyDL0nFwjBHf7GcRWV4js8Lrx8rbwm16SiZtu1200DmMqKvZcgdBWvLjO9gMfjwSL1oatVS36b+ezaizOD/hKM0KgP97UvCnfk4+9+OMpyJwAA6nOa/DjdYNxlFiT7eA3S7NCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzCzAHdmpwlbGOZRSbbhm04NnfWv7/K3gjWeAdeCSAU=;
 b=zyMZGMs7/igQHxtcysXWDNd6viw9gkP8+lDZhExj1RRGnbRjSG2B0iH6vHfltejTo+RNaMA6NH5gSm1pUyVZLpIndU9Hqulw2iT59454PtM6cprrYXjirrU1COjwZTJH4F0HpO85l8c7Q2P9yDNKxx8w10ptndcOu0z7Q14t2hY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5697.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Sun, 1 Mar
 2026 19:14:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 19:14:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 19:14:41 +0000
Message-Id: <DGROP5CHU1QZ.1OKJRAUZXE9WC@garyguo.net>
Subject: Re: pin-init Clippy nightly trivial warning in 6.18.y
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "rust-for-linux" <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <CANiq72nWYJna_hdFxjQCQZK6yJBrr1Mb86iKavivV0U0BgufeA@mail.gmail.com>
In-Reply-To: <CANiq72nWYJna_hdFxjQCQZK6yJBrr1Mb86iKavivV0U0BgufeA@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0500.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5697:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f75f4fc-45c4-4637-262b-08de77c6ca66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	Bbf8aDE6oSCp9rwp1kkjD4FcWVQFqV3POHeZC/ECIFGsY7DEB1LMSxzF6IfpVAtv6ezV9Ka5wpeJ6fxd0dKADjHpda4n8a359i8Kp+rsgUx/a87aEl64W8hSYMwktVCMkBaXOjszkCHbSwcby2/LtpC5XfVqLyrkSJgJ4sgcpVSNfShcLNsXsLrmHsKCIBSSdVqY439htGBWiQVgfa8Dsj8BoQFGLq892MHULnIbXLnMYbq0h9+oSWYkkFlaaFHjLj0EH70lLaDKWjVL4jQrSC84+jAVXHYzlOgOh4T/FYCFR2ayZvDDGbIw5GcACrfrD8Oddw3bjpJjOWY5T1f+fhj0ecOnP0Wtacr+nPDL9clVSMV2XaB9EX2hINUGlIs0E+MU3Hr+ZU9r/FiAx/7psNrpgJ8Ff/QxsjeYLTMEpOPvZ6MCrw5h1l4UsA8TWiFQJaXPyu8FXUOA0ALGlbz+QGppB15xpOrYV2Ls4ApttbwseITHZwX9xQGMAmANFSrfpKx3hQywQ2tuSlmtrw2uuVNGdSbZSB3Y55kkc7H/V/5m/4t3cIUGhKVGpbMeWU7SOxJY99gCWX+usKJ1BUUK4qEl62vUM84e7/hGwbUzwRmGAF4eDb43Ivzodyq7SnRQ63KFBBQrfWdwpwfEHZHFrkVR/ggrIXRDPy/gXhLZB+6ckb2WAi8W2yodNTtZI7MQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWlXVnIvNzg3UElOZFFtWlcyV0tPQ3Q0N0pXcjJRamNkRjhjRjhudVlDbHBU?=
 =?utf-8?B?N1k1bHUwVlZxaTNnQ2JDWG5JZXh5aFZkeUlxSG1RclNITm1iWFRrVkx6a0k1?=
 =?utf-8?B?K1VSVUo1WEJhNUtEVXdmMnN2V2UrZ0NXc2V1ZU1CR0FqdlRCbUFDTGF3T3dx?=
 =?utf-8?B?SkJaQlZjenZBYXErTGJOUTBWekYya3pPK3g5aTVSRnZ1dTdvZnVaaURGemJ3?=
 =?utf-8?B?L3hMeVRjT2hkbzVyL0JjNHhoSGg3UkRReDRRZWlvMGdlb3FZK3FqMldmYWxY?=
 =?utf-8?B?RHNmalJVUTVxaUxwTWVPWE5NRSsxd1JScm55Wm5KWGJ3dVpJT3F1ek9uQ1Fo?=
 =?utf-8?B?aFlZODkzME0yNi9tbHBrVkorMWZDK1RnVysrNGprS1I4cnlnZWRUSm56aWQw?=
 =?utf-8?B?TytqT2x0UC9STCtEMW9aN0cvbFUrNGlVUkVndmJpSmRMT1hsOTBvY3lMUEFu?=
 =?utf-8?B?L3lNNlNiNU1FM1UwNUdvaTA5S2xFNmFnYXlNQTJPbkU5Nm1KalRPQktSQ2Jy?=
 =?utf-8?B?OGxHYnFOQVVHU25MOHB4M1BKQS84K1Q4UzczL2tNWW5sRDRwcTdSQWFZT1hX?=
 =?utf-8?B?eS9HZnZCZG9YKzB4dzdIRHhsTmdybWhLL0JaZ21XTVNnKzBSNlJyQkRwdWUz?=
 =?utf-8?B?TjMyREo4MEtjbERsb3IrWjFzQW5VazJTTmphdDhSckRxYkJvbkUwLzhVamJ0?=
 =?utf-8?B?OGp3ZFg4R0gzUUttWnFSVFFUckxLWlVxYWlpaTF2RjExb3IyWXA3Q3hRaS8w?=
 =?utf-8?B?VFlDVWlKd1Z2WmJzTnBJdUhLSkRCN3I1WDcraGYvcXR2cXNkZzFHRGRxNThD?=
 =?utf-8?B?a2owSzRYZEo3blBHci9RVnhwMWdHQktDTnNjYmFKNzN4aGowUlFwayt3bkxz?=
 =?utf-8?B?czg0RmYwN3N3WlF2dU5TVnE5TUkvbVhZdXd5RFVPRWsyRXRHZEFXbm5sK3ky?=
 =?utf-8?B?bCtnc0NHRVk5aURkMU5XN3RUWGFnSjIxdWxGaFFWQ0FjOXpOV3JybGQvQ1U5?=
 =?utf-8?B?UjcreEZoZTNMNzZCR3gvWmNUaGxQbjllREdaaExHNmJabHpIcDBjUmVrWDFi?=
 =?utf-8?B?dXpDRW5QZHRIVWpyM2d1c2FEUWtTU1N6WkdodDhiM2Y2WVUwZFlOVmxFV01z?=
 =?utf-8?B?clM5NkJXdGZxdUR1ZmcvVVovUjRqZFA4K2xTNzhZVTFVZ3BJZ1dOUVZEczZ3?=
 =?utf-8?B?RzNpK0J1VW1CVDY0cGVmY29YUVVGM0dWL2Z0Y2NWN05oaUNRWG5Kd2ZaNVR6?=
 =?utf-8?B?L3BmamNZdXlpRjY1Q294RHprUm9UUjhCZEE5RDRaMDd5WVJPZjY4eFdWejRN?=
 =?utf-8?B?UlNjSnUrbFl6Q2FGOGd0YTh0RW5DbHQ0TkU5VmlVV1hGMHhKeG9ZdTBsRk4x?=
 =?utf-8?B?T05pbWVLMXRvS1V0cjVyYnNQT1lWYktUcU9TWjVRQUk2UjlRVExDR3c3KzJ5?=
 =?utf-8?B?ZjQ0OG9lZ2NjZGxTTjJqUlhnNmthVWM1ZUZZOE5EL0dZRlpXbXBiQzdXRkxq?=
 =?utf-8?B?amtjeTZHeENiRHI5TzE5TWtSamVySnhxVGIrN3dhRjhqNncrcVV0dE5OaE5p?=
 =?utf-8?B?cVJjc2g4ZnlRQlRUUHdrOW9vdCtYaVVRTFpQMVM5R0Z6ZERvZm85NDByelRa?=
 =?utf-8?B?SFJNTmM2cm9xNkxTY29XWS9PeG4rT1pZVnIvVzc3a083bkZFUFFPc1l0RUlD?=
 =?utf-8?B?K2RhTjB0ZFhTekRFNnhLMHpWUlJHMHJrZjFvcjZLZmMwTndyVlRXM3l2ZlRr?=
 =?utf-8?B?bnBvMHJqdFNCWjZuamM1aUJNOVMxbThEdE80Wi9iUm1SKzZLdUZHSjBVRFZl?=
 =?utf-8?B?ajhxdVhhMmJsSlJaZFpOTDV0NWp4YmUzaEZYUm5RNElnMkRJeU9rQXMxMWFz?=
 =?utf-8?B?M3hCaTZmSnZTK21sNzVLa2xjOEcwOUJhakRDM3gvUjY5Z2orSHQvempQQVhy?=
 =?utf-8?B?cHorMHg1NXNmWG1hUWkwYmpBZ0ZpWTNISGRmNmJsR2xnc09TMVZSOEVjNlFs?=
 =?utf-8?B?S2lBUjFkRTdpUVd3NlJ6N0dkdnhzVEpvbm9rd0pJMUVPWndYclk4a3RjU2cv?=
 =?utf-8?B?QVpnVm4zY1hvamxnR2hFcWoydjdWRkdqd1VTWGZNWkVFQksxVzlCWkk5UTc1?=
 =?utf-8?B?dEh5RTV2K1dzM09XY1dROXFndVNQSFBreWVLVHIvMVNjeTJ5S3ZNdWdPVjhq?=
 =?utf-8?B?V1J6MjRZbm5wZ2ZSdnZyVUsrcjZoSy9oU1cvcStVYlErMm8vOENWMU8vK3Q5?=
 =?utf-8?B?by9RcUZNWFpBWS9WK2ZRd1BZTGZJNVozczBveUE5dUdzRStscUw4dkZBZEwy?=
 =?utf-8?B?WDZmdG1TN2JwUTVGb3pLNnJYZ0ZlSGNiUk1SK0FIYTVLMlBpdjZpdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f75f4fc-45c4-4637-262b-08de77c6ca66
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 19:14:41.6819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btDdLbAQplWqIVMmtA848Ra4yMmYxTujicktFJ+ZO8pAf411AmGM63p1rjr7uhgRx+BWBtNcwPExdGPdUYSwzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5697

On Sun Mar 1, 2026 at 6:30 PM GMT, Miguel Ojeda wrote:
> Hi Benno, Gary,
>
> With nightly Clippy in 6.18.y, I am seeing a trivial warning, which I
> am wondering if we would want to keep enabled or not, i.e. I can see
> you may want to keep the `nesting` value check inside like you do in
> the nested `match nesting` below that one:
>
>       CLIPPY P rust/libmacros.so - due to command line change
>     warning: this `if` can be collapsed into the outer `match`
>       --> rust/pin-init/internal/src/helpers.rs:91:17
>        |
>     91 | /                 if nesting =3D=3D 1 {
>     92 | |                     impl_generics.push(tt.clone());
>     93 | |                     impl_generics.push(tt);
>     94 | |                     skip_until_comma =3D false;
>     95 | |                 }
>        | |_________________^
>        |
>        =3D help: for further information visit
> https://rust-lang.github.io/rust-clippy/master/index.html#collapsible_mat=
ch
>        =3D note: `-W clippy::collapsible-match` implied by `-W clippy::al=
l`
>        =3D help: to override `-W clippy::all` add
> `#[allow(clippy::collapsible_match)]`
>     help: collapse nested if block
>        |
>     90 ~             TokenTree::Punct(p) if skip_until_comma &&
> p.as_char() =3D=3D ','
>     91 ~                 && nesting =3D=3D 1 =3D> {
>     92 |                     impl_generics.push(tt.clone());
>     93 |                     impl_generics.push(tt);
>     94 |                     skip_until_comma =3D false;
>     95 ~                 }
>        |
>
> Anyway, it is just in 6.18.y given the `syn` rewrite and not urgent
> since it is nightly.
>
> Please let me know what you think about the warning overall and for
> 6.18.y we can backport a targeted clean up.

I think it reads better without folding the if into the match arm.
`collapsible_if` is a lint that I dislike in general, as nested ifs in many
cases read better. In fact, we already have a `expect(collapsible_if)` in t=
he
codebase.

Best,
Gary

>
> Thanks!
>
> Cheers,
> Miguel

