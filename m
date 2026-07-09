Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021106.outbound.protection.outlook.com [52.101.100.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E9B301708
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634282; cv=fail; b=DixGvheZY4z2Vsf1JsKmitCIVXXTohmgdQMPLvSvyMdCRmkbxS79p5zCfJBxgemIOJwWxhD44AwAU7ldSGTbGnFAn0o5gbJF1YALa82T3WAopcwp5RC8EJE2hc8GiwK5H/g+9YZahBF6Sxxz/qcqlXmRvyJKrZPeIezyYqd3tMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634282; c=relaxed/simple;
	bh=hZXEkZ11EbSXh0e75SGCFd78V6+g+zspLZUa+Y53gNI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iEDJuT1oqotnvctUfKK6WL327j9mMaBWmJDBvtAyaJgfkzUuiNI+fjONo6GayjgNgFRtNfHIMmvRtGgq9rq6gbpTzs9JJQagaSkj+aHqlK/6xNPuV1GutAvNJlnZX8QIHG7785tpfiigPFGXzdh251Ip5TAl4cxkCyaw/jyNWMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=XhEiIpjp; arc=fail smtp.client-ip=52.101.100.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XhEiIpjp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNYHmTm8dABailVGkDrRzIm9hQmc+RPqBacti8qSmTKe3fVJ9T79XV7bE7qzwmLEYSx2S+/izwZ8uQ6UrnE2GJMYJPdn231axNrtWAAt9qLtHgGTBEnFdWohj255+JCcezMZkEvTt+Bi6Ss+3Tge/P2uFZiNr/fpyc8USpOFLXXYB5C6CFXrrC9adeAVa07ITsrkcNSJJwnQ6TPmCwfqyAokcBV8163Xgv+fw+7VkaHDol+KrG7Cvsv45frhQDXLmMgVCoTe1RtPxnxFya2wdSz5Uf1i+bVY6YSFBPaOhmAe/B5QcwcmvQ/5H1k7lkaWL3+SF6ja6n9NDDTS0qBIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpASxkXmTQaE5u9ChmrjxF5ujMBm+vgOHVQ1V0R9lXU=;
 b=DcN4uNmYb6rSx1vlmw0x5EFosKp9GdD52wdJx4CYiZWREUH5dw9cBgEEUQdGyRFWFWZTykvFw76icIY/ZX97YmSP9FbhbwQrFxJzLs4dP4GajjFbCjZvnZpUdwwuHFMrkwGv3eTtbLm9+cvy2ZQvJjWto3+yEVaauCXezGeE6O49Ar3k2bMF6rjF1jCDy7p1xfHTOa/FbYwka7UxW5DYVLD8gt+2C5yShZ6KLYlz3FGui5tTTFhFZFkEx/rJEJSDmL/TMZ8Fx1SGuOMqshb7YcHEpLArXmjhHaEyzqO+TJi1XDwFH2x5CdyWmnaO/PE5BtWDuIRwdjNDd7Rfj8N4Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpASxkXmTQaE5u9ChmrjxF5ujMBm+vgOHVQ1V0R9lXU=;
 b=XhEiIpjpUfqQlh0PTPagO4Wh3qPK28ILcuNOV/gW8OQu/PuOekq5s76LcZWh0m9JmHLdkH3UTL8x92iGb3LIFqMmBmGEtgncYJDuc7su6iXE2LQDmII6adNpwbfFspXOLP4vNU/QoVaqDJIrKo9y/mApQ05Xsxasl7Dz4S1maVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB3145.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:15b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 21:57:54 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 21:57:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 22:57:53 +0100
Message-Id: <DJUDKXHSNK85.2T0SPPQ2NSG2I@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] docs: rust: quick-start: remove Ubuntu 25.10
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260709204926.139252-1-ojeda@kernel.org>
In-Reply-To: <20260709204926.139252-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB3145:EE_
X-MS-Office365-Filtering-Correlation-Id: e93c4bba-55be-4b54-9ffb-08dede0520dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|10070799003|366016|1800799024|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/NqdxtUWzsYuXs6C1IyeZlwALpIPcYD6J+VwAIdawf4/uOzcDgPQT0+QDlw7vcbk0LeJ018DtoLxC57O5yKKmTLrplypu4PP9DsjeXmbNIW/cjHbQ0x9ZjOeM8UnjZAFA3QzaX1syIf6GNgSDNhdsVIPha603yB7bfWwy8AwCnlPAAw4YyJZm81fTycACWE41YOIic+QaFia+3qKnzIJ1IeMlVRK5qRhr3cAQbucqG8XhRDBF9gWwgj/wpiKlrIS1RFBDHOlsMGa6puC6YTv59pTXc0lfXa8lykiOjjfV/M3skxIZwlNkRrWg7QUxtXShrn+8JWX3hnDzaDiGWblaeg6HVnzxt2PsI5EGJMyU3qxmUq7Y0DBuSNhFY5uQnRsVEJUToOlbYuPBIV06dEoxEZ7idebUfQveZAUU7FEnts+vmxbGcY6aoC2dUzCI23CPtOKLTF8AMw/gmVBzEpUbkjwheA7DoRORdsL2gZNKqJlpH58x3cqkkb7ooi9RQYvBW+zZ0WUzMJZuux0TV7JuKYfTt5mktJzU9Y8gTUdYMHMhy/7qO5CUXGKHcj6P5jSnpAbGlEZl4Pfp12l4uj2CxkGALklYAAQ0X3Z32Uv1JNrmffe8vC7hhJFw1t0/lwMq4NYUrOf5B9dZwy7J7zXygc02lqjXHqqNsbbO79nWF8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(10070799003)(366016)(1800799024)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkw5RGdOQm5VMm1yQ3I4TXgrcm5OdVJWb3d6Y0pNazBaSDYrMXArOUNCZ2pP?=
 =?utf-8?B?SUptV3BwTVk3SlZSQXMvaWhKNC9TTWN5eFF5Sm9sVTlTRjJEaERWcHdVWDJq?=
 =?utf-8?B?RVpFZVB2UWFqRDRJMTZ4dVJpTmQ3ZU9PWktDbmMyT1dzUTF3SXE3YWtUK3pr?=
 =?utf-8?B?QXVxQ2pxdTF0VnEvRGlSUUdVdnlpbEpxSHdTdmgzZ1llbk1VR3hVSG5IVDd4?=
 =?utf-8?B?OGsvY1prN1NqenJtOXlhRFBCTERZTmRXK25QNlNUeVozQXRiS1E0QmhwZU9m?=
 =?utf-8?B?bk5meHY0MlF6Qnh6aVhrVUk1c3pTRDZ2SXpobVdHQVMxTFJ5TERRZlphWnFQ?=
 =?utf-8?B?SGVZdGw0UElEVGV2c3R2dXU1RDFqK3F4ZENSZUtCNWQrR25JcFFJMkNPdm5I?=
 =?utf-8?B?YVVtaklMRlhhMXlGVEhRTEVtSklGcG83WUpJTmswZjZvV0U3ZHFCdC9LclVX?=
 =?utf-8?B?UjRXcXB3ZzJKRno5K1BibGlHeU5mUkNrS3pDZTdGOW9OdjVxMHoyWnZoeCtV?=
 =?utf-8?B?NDNmQzVQM3FKakthRVlpNi9Fbk96L2hzeitQVktuREhQMTRVZCs4SFV3b0V0?=
 =?utf-8?B?WENxUi9KWGJ0Y2hBWWR6OGpFa3A1MDJNdHFzUStCb1lqeHRWYUhNaUxjR1FZ?=
 =?utf-8?B?Z3FUZVYxR2dkR0lVS3ZCTVNIOENwRFRpcUM4Wm92VEsrTmhEeWg2WjNXUE83?=
 =?utf-8?B?OVRsb0RVRjFlQ2h5VjFDYUxoQVBTQUdBUDFOVFo4T1hBTzBzMzIxbVdqOU1t?=
 =?utf-8?B?WWJQdGd2dkxGSDk1UHhHZk9vem9YdFJYYkh0WE03L0g3akY0QTgrVnBYMWl5?=
 =?utf-8?B?bzBWRHlPUjBmcXRLYzNjSHk0WGc4dUIzUWh5NTIwZWdhbCsxLytBNzJxOFdv?=
 =?utf-8?B?TGtVNUlndDN3Qi9leXZxZVBqYUtScm5rRVVsOGlpZ3dscVI4bS9wRjF4eW13?=
 =?utf-8?B?QS9pVDNpbUhlTVY3QW9ZajhFbkh6QzV5bGlEVTlpN0R2aVZVMWZrNjBnMElG?=
 =?utf-8?B?UDJ5NzFaalc5SlZaVW1GbEV1WE5xTWEraGtxTTgwWnY1cVcyMWNRVWdoMlF2?=
 =?utf-8?B?OTBsNU5LUU9yR05vc3ZldmVhcGJkdnV4QUpaU3FVYmVYcWRqR2g5cGUwQ2ky?=
 =?utf-8?B?d3ZHRDNRdXdyZHZHSnNLT29qYUpReFRYL1h0bTU1Q1V4cnpVQ2Z0OHNPQklS?=
 =?utf-8?B?bThEZVZ4dFBlWmMrTWd0a2Y3NFlKQm90K3hFbU5rUUdyZk1Mdmh2VVVrVEtM?=
 =?utf-8?B?bnZLZ2ZCamhyQjNuS1diVDR4ZXZuMjk0Mlg5R3ByYkQyOE5Hak1FVjVYTDl4?=
 =?utf-8?B?UEthdUlXVUJZK0d6Slh1UmwvZEpvUnEwZWJ6OWswMTF2ckhaMDQra3lKb2Y1?=
 =?utf-8?B?UGpWRHpld2tjN0hHZ3lFZyt2Z0hwMlVGYjFTc1l4Z0syK3RUS0dyMS9ubTYv?=
 =?utf-8?B?dW9VWXRnNS9ndUNrN1BWWVBSSUdKMTZiUkdDNTZWTzZKaFd4RVFVYndOWFhM?=
 =?utf-8?B?MUdwTG9DejJidnovZmw3ZDdIbjg5Y2YybmRJTU8wRjNwZGsxM3RLNFM4TTZG?=
 =?utf-8?B?WGYxRHBmaUlNdyt1VGhSZ3dwT3J3VWpJUmdDbFZRb28wWE5yWTd6eGc4KzZJ?=
 =?utf-8?B?SHgySGhoUzVvcjFSWHB0Z01wMWFKSXJxSk5HMzJLaml4bklRUk9nemNCVlRV?=
 =?utf-8?B?cGZVajEyMzErQ3M5aEtSc1g1SjJ4SWhVUlp3U1F4MG1QVDRGUEtPUXJtUHlo?=
 =?utf-8?B?aWxIQ3kya2hERUEwK1greThFWVlqL1NZUHhUTytoRllBSUVQWDZ0eTRpNkdV?=
 =?utf-8?B?UnVXakVjbEpraGIzbjRqRkVqMDF3ZEp5dWtYK1dxbFRralltNlZ0SHo4a3Av?=
 =?utf-8?B?QThrbTRmVjJzM2xUcEZWcnRkNllDSUY0Rm40aHBwMUxvT2RYVzlqQ244WWZs?=
 =?utf-8?B?emhVeWJuYnd4d0xTeENkZkRPRktmckNOUXZnTWszem1hWnlkMmRtcEJqZDlH?=
 =?utf-8?B?Smlmbkw0V3hQNUU3L1hORVdQSzRaNmlrODA0blM1SENwQUFkRXdwK1FDYTND?=
 =?utf-8?B?b29pcVNkb1ZON01iOFp4c2tLY2MzdTRjaEdta3U1S3MrTGQybGR2Z3JjbGw5?=
 =?utf-8?B?SEFTU2VmRkt4eld3QkgydnR0VS9tbWdRdThJd3Fsam1uV1B6c1kxUnZIdXhI?=
 =?utf-8?B?NWtUN3RyYjlyQStLcjU4RFpCZnZXcnlkQlMyMmFJYmE1Q3hCbEQ1NnJTMDds?=
 =?utf-8?B?USs4WDdnNlJDWVlKeDcwTDdBTHN0OVdwSno4cTkvZERjTEJ1QnVRUEsyRUhK?=
 =?utf-8?B?MHdXTDhxRlhhMHk5TWthdFhPSVZDelhkNFAwenZja1dNMzYvb3Zzdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e93c4bba-55be-4b54-9ffb-08dede0520dd
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:57:54.1487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57KPD720PGfjeTpg3nmedfs2ahQKYwPui2+457+l3/aRZ24sIO42HuicURGGx4ceX3DhXHlZrGInU3P30XPgHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3145

On Thu Jul 9, 2026 at 9:49 PM BST, Miguel Ojeda wrote:
> Ubuntu 25.10 is not supported anymore [1].
>=20
> Thus remove it.
>=20
> Link: https://ubuntu.com/about/release-cycle [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  Documentation/rust/quick-start.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

