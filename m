Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021084.outbound.protection.outlook.com [52.101.100.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AAB3EDADA;
	Mon, 18 May 2026 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103614; cv=fail; b=hUXtRpwVpYeDh3m6+m7L9U+oMz2RKj8wBIo+L4nzPyjIbsqXHNBLZy4+SbJISplMdP8cPRAs1ZjCrVxnBRfuQ7Dcx4Z9sRZ2aJiPDqq4xBBMp5Wyd6X5p67G8T3pBzzn4Rlp7Yw+NfLjZ5PZuJYRpc34oHepoPpQbOYgq1EpOa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103614; c=relaxed/simple;
	bh=dVHGSFFvLetUcr9uDeJGu0L2aVfsuUr9o3pkKw7HIUs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=asEtXpey1wmYvIsxSVcrmGKdqPGP/hbCMSsx+KesrkztJBlalksffAAoOTLAxP0ty6Djs+CYrB1QPSmI7A64b4BUSlITpZSDyobRVCDo/KcXdDZY66XaZxi82fYbvTDY25mh6vtAs1CMKFTDPmqQ24zW6LBS8UUCM2uTPB8gZR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=vdWZVdLj; arc=fail smtp.client-ip=52.101.100.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="vdWZVdLj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3kQKoj3o7eX2CSE3ZTn75rcvYA883/ZyMSBi7kEMo14Ztd6bmVCQT5WyG06f6/Tf/6N1GsvjrLKT/pzQ0wLBAXhiP//7epgjhmETd0NvQU855h4gHBqKhsfjrOic7ougESTR0/zNb3EP4+U+1uMVXB4nhn9QxuxM4sti4EO6F9YB3+OkUeWLy9fzB53YzMU2sHUroWsNTm09Qwy+GH8OtctuDjOxfocboGn5XDxxXGRdEE8lBW97Dr4nzuXgY2QBf5pH+gMBfXLI62fvYOVELRZ0gSTyM8tsCJtAsvL+BYObT2Wn71GM5pG24ZFhY6meOYdXltHXIlYR3g4ZECiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIHwdA7XdJDjIRT/mKJUFQGY86qjHEEEn2En8W/i9Rk=;
 b=RXQF3hbtwKzownOYuSYlaDXi/YJwbEw5MCoHWEdgUiK8CuUKhYCoD+8w+sPHaP6MZHegYV/PG++UVc+eJKLWIxZbAMYjuuD+g4cJ3+AqRnpZK5AbKEnQa4eCyMfDInnW7JoPYNHiO57Q2uH1sG+SuP4JeS8bFNleB9FiPv+UIjvgaK2gGh3r8tQv/3in9NcLyCTo+qzdwGBbpRTdB7BWQMd0kXNP2PJutQ/Js3XQQoxOyFaJbA14JUMYNzUSQnggrGQWL8nQg6elONi6ZCEVIc+yuolwSIxZgtXaHTSH1cbmJd4GAnekCH4kj73iNf4YQ/AwVg5cN1A6jqN/siSlZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIHwdA7XdJDjIRT/mKJUFQGY86qjHEEEn2En8W/i9Rk=;
 b=vdWZVdLjHo23e+9YHq3JU15Sa2U0oiD7wdR7Yv70t0es68QX1g8gzr1UKGXmojzofOW4NvnFmu7GCjzyEyWem2XJMHSOtTlnoLRQyXjl+LStaJhLEW5A4V1B9J6bLfEQl8Wfk16gZQf8EKHRWFMp2/bKhHIM0d7ayoKNGvFgWEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2895.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:172::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:26:46 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 11:26:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 12:26:45 +0100
Message-Id: <DILRLDHSGBOS.3QIF8U801UG1T@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Mohamad Alsadhan" <mo@sdhn.cc>
Subject: Re: [PATCH 0/8] rust: pin-init: internal refactors
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260512-pin-init-sync-v1-0-81963130dfbd@garyguo.net>
In-Reply-To: <20260512-pin-init-sync-v1-0-81963130dfbd@garyguo.net>
X-ClientProxiedBy: LO4P265CA0124.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2895:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b5abe0-9b6e-4182-c350-08deb4d05871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|1800799024|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SCBccOgEujhGp48cJsGUZbAJ+NCplQnBmV7IBYt+YEqjsF/iUgI7yqvWZ2bV07FH1/EYwfdQ+TyQnBm1fPnF9VISv/1CVbXvAwVgx3hYihDNMOCg2mILKSHywri7BSp/seYkbkc7/Sx9+T2UQCENjUi+W23HITgizP/c2W2fNeV5ZND+hRF23eiGJ6J/LOfNMiAJ2ZwwLialt5oprNyKPR9jbkc8neNr9nEXOzq+vqunFhAp4prPMb5MrJI+hzp2LsqP0RRCSFx7kfHDJIPEeqxZP0C79wsAGfS62iTUYEsuCewDEav42AOJIGhtDXxMCdxBruKkA8w3BMdKNeYihJfmhCR9VoiNrkKFoJb5GjmpHM96rDUiPyDed+l939IM8WlWNk/a34VBvWNclTcPemoGZG5JcUtAfuUv5SkR6iitjMXhpDnis4LLgBTWQBIITi7yEhw9+H3kxWTmtbDtiSwhJ5HUXSNobNP0RAMr2ShHWat7z59KSJj4zLCmwitsOy68M1/hCfrdw/uK4D9zbhGh2XSRJd5TjKOx/qRGh1GVROe+pRerwtL2mR9/vYyuzUtlJRFXwm+64HNIf+ahc414gHf+Z/uv4xtdIYrQ5SCTKOR3Wu1JznTnyzFClRcfzlWrOcBcShHeWqazWhCmPglpMgDDQt1MfXdeHzHn/Nc1zDVcGjal7ltfphgzkUrv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm04dzFBK1h0V2Q0TEN6blc4QzAvYmltK0NUM2pWL1dLd0NLVXhkeWVKb3Qx?=
 =?utf-8?B?bkJrVmpQZVBVNXBlb0tTVWQwTWd2bnczbVFVSUJUSEI2RjJob25idzd3Uzdr?=
 =?utf-8?B?dE1qeHRhZ2NTZjF1UDhqMmxjTFNCMlZVdW5MUDRBYW5INnp6Mjg0cGVZSEdJ?=
 =?utf-8?B?cEVLamdiSG5iY0pFMEo4QUQrdjNFQ3FuVGFFS3RlajZFUWN6V21tRW9WUXdi?=
 =?utf-8?B?L2ovOHgwV3F2REtHaFJ4TWFEMXNiOWxOUFNzSkZyQ3dVdE5iNFNHbU5RZTlu?=
 =?utf-8?B?a000aTMyZGRTK2YvTVN6MU1EMnRCRFc5aDJycE9vT2pDM2pZUDVva1IycVkx?=
 =?utf-8?B?Q2FEakx4K1RqQ3RnSERza2tCNUgzSUtEbXByM1hYVmttN3Zra3NFOUpIZkZp?=
 =?utf-8?B?WHlaRzhiblZXUjJRT2VoeHBLd3pkWXVvKy9wdi8xNlFNZTVFOE5aN2NGVHR5?=
 =?utf-8?B?akRCek91Vzh6cWw4QXduY0w1Vzk3akZ4YlJzd1U2UnlVcytsdEJieHY4Q3o0?=
 =?utf-8?B?U041alo4b3NNRWUxMGVjZG1MWWZONGtBdERteTNEeFI0NElieVVGcjJVZjZ2?=
 =?utf-8?B?bEIwZ29UQkhXbGNueEZBSjc1MGpCZlZxNHhDYnRmSkxVbm1IVXZYTXZTRks0?=
 =?utf-8?B?eEhuR1cyMDU3U1ErVVBVM1ZPcGZGdlpMYUR2T0tPNk9WK0xoZWY3b204T3hR?=
 =?utf-8?B?MU5QQ0ZqVEVybkNuQnY5WXk1QXZDU2FKT0lmaVdxVkVjamU1aEErdmhwTHFN?=
 =?utf-8?B?UXN6TWxHWEdVM1oxdTV1SFNhbEJKejNIQlNIRjlWdkFtemtWbzhQZGVJenJV?=
 =?utf-8?B?dExOekFjODlKMWZjM2F2WmNFVDZXdllkQngvWEhLZ2hwUmkyaUh6cmxmYUtB?=
 =?utf-8?B?OTFnZzRDbTk0THk5T0JBODFuNnZJOWpCOHZTNXR5UUhJcjk4QUtwOXF5aXY0?=
 =?utf-8?B?WTkrMnIyQ0tabXAyOHpnZlpzOUF0VGwzL2ROVW95RWR4YU92YzJCQ2F6cTdW?=
 =?utf-8?B?REd6ZU5GdlRLT3hsSTk4Vzd4NkxGVHN3VEE5RjhGSmdGSmNNL3Y0d0QvMFlK?=
 =?utf-8?B?R2Y2VFhuZDVVT3dFNVB6K2VjUXZrUi9DU2JaMkxvM0h5aWwzRWFEZGxoTzZl?=
 =?utf-8?B?aStzS0hhVmcrS0NwSlJPWUdiZVJKMWVlU3FkL3VRSXBPZjM2Kzk3OGNKMHZO?=
 =?utf-8?B?TkVFTG9qUmNNdUVHYThUYkIyRHQ4cjY1M1Z4c1FldGNiRUtxY2JqM2hCY3pC?=
 =?utf-8?B?Q0dOY2djWVFZNFpjakZ2SXoyK21NeWR1V2xiR2pGY2psRlR4N2xibXQ5ZXZG?=
 =?utf-8?B?SmszRFZGQzkvK2lNNXFRdU1mYlBoOGtXWk1UUy94eVlTMThZT2d6Rit3bXZH?=
 =?utf-8?B?L3NVVGsxOHdFRVovUU4xbUlWR1ZYckJBYUFWbG1OUjhvMkt4T3pML2F4a3Vs?=
 =?utf-8?B?RXAvR2RaUUtyN09iQjh3Y1ZzTTdQTDhFaUxuUkFKbDE3cDEyYTdXTDZnWld0?=
 =?utf-8?B?bkRxanVGL2lQYjFuNTI2WFo3UGtWVkdlOHIyMXZHMWFORnpwQXh0YlpOVlNV?=
 =?utf-8?B?OVFhUGlrRTNhZWtnVmRnQUI3V04yMlpxWGZFSnA4WnZHRWlaaHhSKzJCWGJ2?=
 =?utf-8?B?cmMrODAzdjZhQUpRa1M0cy9LMTZQbVd6c0pqUWw5Nml4RjhJb3U2dnBuRThP?=
 =?utf-8?B?TXlzMTNvWi9pZGM1MkpabHFGK3BzbjVlNk43UEgwWG9oVHovSmJlU0FxdjVW?=
 =?utf-8?B?TTRTVnZsU1RwdnNnb0FONk94czVuRjUwTTRqRUh4TEk1WU5sZk5McHFhNEtD?=
 =?utf-8?B?NkFQa0pTZ1VEaXlydkhodmlaSTBjS3AyWU43b3diZFc5OWNxODRDZkVRSXJH?=
 =?utf-8?B?OE9jbGx5ZjBFaWhYaFZWNkRCemhuNTB5ZDA3RXBuc3lmYkVQUE9VTlJXMjZX?=
 =?utf-8?B?YnFKQmc4U2pUM0IyN1VIaVpIOWttajlIWVdBZnBFdGRDV0g1aUlmZUE2NE1k?=
 =?utf-8?B?OVFoaWI5emZUWDlLa1ZKTjBRY0pjdEtEOWhkUDZiWUZJVDlkNW9JdEtES29O?=
 =?utf-8?B?M2FWcGxCUzFwWmdjMS83ZUJLZ0tqY3V3bW10TS80emFnYkhzWXF4c1Qyc2RL?=
 =?utf-8?B?ZTlqVXNSQ1RrcGU3cjArQS9ISkhzd0Uxb0FHanZBUk8vMHBrL2w2OEF3Z082?=
 =?utf-8?B?bEg1SnVNSnVjNTU0dmYyT3I1cEI2MHFXWklmZkkyQ0NIR01MVmpjTGNjNklR?=
 =?utf-8?B?RXZTakp4VlNWR3ZOM0dHREZVWjJsZ1czdVdlVXEwbGNiRFNibkRHZ2ZCM3pV?=
 =?utf-8?B?dUdyY1pyWHBEYnJqaVJGbkxpeldNQUU5V212bXBNak9hczZoaGM4dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b5abe0-9b6e-4182-c350-08deb4d05871
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:26:46.4108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiZQOIOKEOoz0YYQCwv7Es9YiG3R+jzZHidBFJWVRhwHQDnkjP7/h3Q9+ePQXdeBFFnnfv0MMXFBTEIlnFXuWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2895

On Tue May 12, 2026 at 1:09 PM BST, Gary Guo wrote:
> This series include some internal refactors to pin-init macros that
> simplifies the codebase and allows new features to be built more easily o=
n
> top.
>
> This includes the following upstream PRs:
>
> - internal: pin_data: add struct to record field info
>   https://github.com/Rust-for-Linux/pin-init/pull/152
>
> - internal: add `PhantomInvariant` and `PhantomInvariantLifetime`
>   https://github.com/Rust-for-Linux/pin-init/pull/150
>
> - Rework initialization and accessor generation
>   https://github.com/Rust-for-Linux/pin-init/pull/143
>
> There're more improvements/fixes/features upcoming that would benefit fro=
m
> this refactor, so I would want to land this relatively soon. Benno has
> looked at them and is OK with the approach, but didn't have time to do a
> full review; if someone else would like to take look at them it'll be
> hugely appreciated.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> Gary Guo (7):
>       rust: pin-init: internal: init: handle code blocks early
>       rust: pin-init: internal: use marker on drop guard type for pinned =
fields
>       rust: pin-init: internal: make `make_closure` inherent methods
>       rust: pin-init: internal: project slots instead of references
>       rust: pin-init: internal: project using full slot

Applied these as well.

Best,
Gary
