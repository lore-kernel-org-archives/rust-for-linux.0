Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022136.outbound.protection.outlook.com [52.101.96.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2DD4A2A56;
	Mon, 19 Oct 2026 11:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408152; cv=fail; b=EIiUeliDCI0cPWaNnF/yCUyF/McoXBIrlgn0Yj4S1EhAbcjq7zWdCI+DNUhWVGvU+JvmfR1grPQL5k1YKKPHed5BgOM3+s6akLhnnssdu0axvriF0dPuLx439qhUiPClFVsUbMbBW8boKId5PPhwkl5EOERnDxGHmc7nyiVFpmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408152; c=relaxed/simple;
	bh=Y2ZVvuEIiaDJwmZTLO0D0ZzX0GXo29JVWfBEv4VRoxk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=kzBwbvQUv4a1V70Wvxhoxuly5w+Uqrbx48ZpdfPEd5sag42glEhvy3dqgcRq8p9VlRzJOm4P/T4BjW1HhlVmTqu+YIxBgvUn86Z99l5BTnOpeVDtFxwFTbuEOwG5y9SteNXJjXEfILhR2OEV3wpQeLNVOEOwyAmhoD4SWpzxKaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=TX/TAwY1; arc=fail smtp.client-ip=52.101.96.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="TX/TAwY1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWLCHsQLP8sYXokjou5CBnZVD3SfmWYci4KujnmtyXs6GFew4/+M/Z+GHE5j3bcYtLZz2uaeBonjsRsr3iuATvkCZgS9crFcq6tytZz7rcDKXjI20/dvkGfx7LwFrtf9LqtBZbOuX5l2Aqq7JJ+J9QJJyBr0jSiiZpdzLPPGua5qNL8Jhtgb1roWjcP99c48eH3+KUFIgX+QlKLZU1H7RGvaVR+nLz05ROE0kRIjhh7q7bQ2mEb9AZtY6QIjP3zCUwI+BnkuNXYRX1cmy51LN4YjabTTzfaNokMl2woxjDiiXXG+qLP1RPZ5/yuDLaDi/Tc7nbvR4gbCl67PXxXBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3ngGOeMj1tvRxCNqntnyBFh/99aUHmc6KAji8Np2v4=;
 b=W0RtG/vwLA7EUf8sYYfRLgk6RwV3qkt1k6Bw+YqHxmcPbJE66lH6ORugLZBT+kXObm9UePjBRtpDiWsjXNFntlFS0WHQKWdGsdY1GUndiycDAyjyiztQ7FLC8No5qPg65GJRj7mNBvqb6YSMF/UokjmLjsXlQC15BlPFsjdNr7CQz41NS3nozoljraI9UnpwzNlPPFtZvlLrxFOtT3vTrybROOZhXP1Wl+n2IlQaDI94AQ443W/oZjgSi0teopSlt2lbZpCGcCRXCtSIbtJNM2HJOh/KDmcdChCtvyJJp4I/26MdUSnflnEEOY2fxun41oCjk1lmWTtWCohyNj40hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3ngGOeMj1tvRxCNqntnyBFh/99aUHmc6KAji8Np2v4=;
 b=TX/TAwY1yQ3Oppp+hyrCXlvT924qXHf92nCVQUdjm4IFfUNp9q1U6S9GV4DSpGJgx6JK4P4oLjYmw4yIBjB7UVBUJDlebGeAQ0cltQY2dfMVpz9Eeo81fGNU+shwkONePDqV45IGNfmVkE5Y8V24/NqwNWu+1bnkn1ADu1ek/00=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB5979.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:29c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:09:07 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 11:09:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 12:09:06 +0100
Message-Id: <DM8RNR7GWJ9J.3UBAJZ0CDNWPL@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: num: Add inline annotation to Bounded methods
From: "Gary Guo" <gary@garyguo.net>
To: "Link Mauve" <linkmauve@linkmauve.fr>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Yury Norov" <yury.norov@gmail.com>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20261019105744.2943249-1-linkmauve@linkmauve.fr>
In-Reply-To: <20261019105744.2943249-1-linkmauve@linkmauve.fr>
X-ClientProxiedBy: LO4P265CA0172.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::15) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b44865-66c0-4b75-4b1a-08df2dd164dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|10070799003|6133799003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	wi0Ht2mrC0HKP/tmWJJQnn12mKe3cHkUTeZ7a7tOhOR3GtPOGjtl76cpJmA2X5nlKk/59ePDzB6DInPGIydUv9zdacHkZZ/gbHjYq8g0lky/eiWcByOFQ/S2trkyQJ+8TTQkCyObaK7CKtWWB1RO2v0A8o0FrOHKuoRAnoW+ZTomVljk2QkGnsxjy+DsAfCkplEIQqEvVwxf1iLeYdNoKI2idv157P2qHWSIH5iy9JwZIs1uPJZDXJSqHs9VePZh8z1Kt27pnWayqZf2ge245b3ABeK7utZ7wQTXkByfRODt+5yfdsQ2mKznSHQgFaUcsr/kWqlMNpB1pgeR8glJeacR8Na1F24es5gdmUAKVc9/mkkhlhYbsPLQNl98RTWE5Zui5qrMw10Kw9f+tjzUqZEymVnv50pcZYwQpCkS1wT/icUZYVnfvbXdjkKQ02YR8Hmg4v4Om2iEbyQ1eceCZHF1Yclc1gCZWQG0ahQpZwDn6e64DrzAnRr9WlwNuIC0K3jRDoWU0YyeGsRdwdmZA5Hs0JSU6VKuBN64GQkl57ifh2Cfy4yKzMUakK8j5fgkoLzJMriWk2T7hWzIDniZZnqT4g97KONoEbywIAMOAyXc0c+y+JI/46Pc99VXxZiF+P8fYXeiR2D571ZIze+LUWKVB0pTNGA8MbgAaDISISE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(10070799003)(6133799003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXFDb1lJTG14cEE3ZCtKNXhHeXAzeGRZRTZjMkorUVBWMXpQZnNZZ0czL3Rt?=
 =?utf-8?B?Z2FnMEFIbnhoNHEvNkVlT0htcWxqV29MMDBuWFRJNEZ6UFlPVjFqbFEwRzJG?=
 =?utf-8?B?QTV5bDJBZ3JScTIyWUQ3cmlES2o2SW82L1BaZEZWRUVFWDBYK3JSdUhtVjVQ?=
 =?utf-8?B?ZUwwaVI5b2FuN3lIUStXVE1HU3E3ckJ6RVlWTXNkTE5aTTkwbmpyVjkyUTRG?=
 =?utf-8?B?L0FYUmhCS3hkTWlxQ2hJenlaRmNjaXI0VkZpMWs5UTdtWS9nYkxMekR1c3RT?=
 =?utf-8?B?VHJEWENzU1UrUzU3OUpWMTdwRmMzVSsyLy9qSW1yeVhobFBPVzFMcm5JTngz?=
 =?utf-8?B?NXRwVVEzV0VYNGdhVWdRUG9zbHdMQ2EremJQMTFtRWprU1dERzlGb0JXakcz?=
 =?utf-8?B?MHpmZmFpUlVlME5lN3lOSUFGTTlCRnhZUm9hckhZYW1CWkhXaDFlNDlCNDVr?=
 =?utf-8?B?UGRqcUZYTnI5MGI5MkVteDNUSlJ5UFJYM2oyZTk2eTFxbXMycEpUejd1YmYw?=
 =?utf-8?B?eUZvQkNML0loZ1MrR3RuVlpWU0N1V1h5QkttT2FzelhDdkJMTXJZL3ZOVGR2?=
 =?utf-8?B?djJINm8xS3Y2T1NyK1NlOTBSZk42YTRGTHM2RmRzdHhhc1FBMGJWUy9vOFl6?=
 =?utf-8?B?a2JwaDBoK2hUOUE0YVExUHptUFRzb2Zjc2dDNmZsY1FMM2lxZGF1QldiNnk0?=
 =?utf-8?B?TndSNWxBbnFTVVhSVVFzYkZMY2tYbFVGSEloR25hc1VXaEYzZHhEMjFhRnUv?=
 =?utf-8?B?WnNJSS9JVG51cGtzSWtsbW5CVjJzbTFOdllWMUd2RDN0Njh2TjB6Z2EyTk1z?=
 =?utf-8?B?ZW9Cek1IYWR4ZUtrMmVOaTg1QStRc09WODFMMDZkY3BoMHdKSVV3aFI2OGsv?=
 =?utf-8?B?UlhpUGt3bnlsZHF4eUtkRjNMNUpkbjk1UncvZUtJSTNEL0FYK05SQlZnSU84?=
 =?utf-8?B?QWptc3lFaFFqQjJxQit5czVGZXdhRDg3WVdiKy84V3ZZalVXeDJMWEN3M29n?=
 =?utf-8?B?VDVIWFJ3UWlKWVh3SS9IYmRWL1h2WnNwSlJpZHB1MzYrSENVNHBJNnZBZVht?=
 =?utf-8?B?a01FYlJyVjk0c01iVXM1N2tsQjBlSTBoNEl4NThsN0FETGhpMHRCMTJ5Njdv?=
 =?utf-8?B?aDUxT0JZZGUwQ3ZzOHF3TWtFaHZvUlpsdUlpY2JTZDl0RVZzNysrUTFGejV1?=
 =?utf-8?B?aFdTMXQ3d3pqZGlqZFcxcDlVdXpIR1Z6bDBwL3RBZklxR2lSKzlRMThXYXJ0?=
 =?utf-8?B?NzQ5QWN5Tzh6d3hjWnlHZStLMHpKNVFBV3NQNTJVZEN5aHh0VGxnOVh3U2hU?=
 =?utf-8?B?TmRWb1Q3MW9IRHoyMHhOSExFVERHYnM5bkVaalFRcDdGSmNsVVFIVjN6TWRF?=
 =?utf-8?B?dGFXMFNQRWNMQkU5cFQvMElNZnRKN1FuZnZSUjV3MzBmWXM2MllKcGs0T1Bw?=
 =?utf-8?B?NDNXNDM4MTRkL0Y3TURxS09QVG1qVFpBUHlNRElhSmZTWTB2SlNxL3JCbmM3?=
 =?utf-8?B?Wk5zbGovanZpRWNRMUJjY2NLN0U3QnhWWmZOdktON09NR0padndtOE9ZdEEr?=
 =?utf-8?B?M3p5Uy9yRVQrcjJrU0pieURLQ29BTUFRNUtKNUFJUHBIWGJKK3F5WGlPNU1m?=
 =?utf-8?B?K1ZUZXE0M1BHMTJBK2hUOXVXK090cTI0MFJyMnZieU1pR3podmNaTkJPSG1R?=
 =?utf-8?B?ZWloenlzUXRHNWdMNUI4WjhWREFuR1BwenVTL01XYnpqWThNbUdWaGhNa0tR?=
 =?utf-8?B?d1hTeTFWN1Y0a2FrZXozZzBybUpxamU1dFpjT1dJL3FZdElHTllKaVkwQlBz?=
 =?utf-8?B?dEcxMEJaeHhPL2RGcktUUm1SemZmOStZYjh1cnJxd28rZitkL2tIZG9ieGxR?=
 =?utf-8?B?aWl0eXVwQkRmb1dQZnM2NVJVaFV0eno1TTFCOEVjZ2lvVCtXa2FJLzc4aWN6?=
 =?utf-8?B?cXNlNWRDZFI1TFM3aFdwa1JUOUZWNDdmbUlRL3N1a3FoZUxTV2hLYlRQTTF0?=
 =?utf-8?B?T1BHZjZCeXRlZUlaUmNlc2RIZHI3RUt0UVNtMytHRXZ3QTVaTGNqNmhxRkZ0?=
 =?utf-8?B?NXMzTjBLOEw2TjBrZDhWS3NTMWRhL3l6RmhyS1R0M3ZjYVlGR09ROHc2N2RV?=
 =?utf-8?B?SzBKekxxQVZSWFFrSldIRkxZZ1VGbmdDQ3psWEJpRlorbzN4TU1HSUtuUHlS?=
 =?utf-8?B?LyswUlBINkV6RWdBTk1GRU1Xd1MvTFZvUGUvenAvbnhpdkR1RHNEakpWT3lX?=
 =?utf-8?B?TFZvS2FQKzU1b3U5K0p4czc5R01rdjgrR2Y2VjN0ZWpNL0xrZnRhalBqOTZO?=
 =?utf-8?B?QlRIeHVnSjhkL2VIcU81SG9jbWk2bzZ5Sm9tV3QrZGZ3clVkbG5IQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b44865-66c0-4b75-4b1a-08df2dd164dc
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:09:07.4707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdrWDSuRYogM0bm81fZK6RocJ7XYsE3yJHij5winrV82tQxZ9oEAm4ai1hX9hxlfHFKOwiVAg/111+O6QtviQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB5979

On Mon Oct 19, 2026 at 11:57 AM BST, Link Mauve wrote:
> It was previously generating a ton of very short functions, such as
> <<kernel::num::bounded::Bounded<u32, 32>>::shr::<17, 15>> or
> <<kernel::num::bounded::Bounded<u16, 16>>::new::<16384>> on use.
>=20
> These are obviously better inlined, although I wasn=E2=80=99t completely =
sure
> between #[inline] and #[inline(always)], but the former worked fine in
> my setup so I went for it, we can always adjust it later.
>=20
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/num/bounded.rs | 9 +++++++++
>  1 file changed, 9 insertions(+)

