Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021078.outbound.protection.outlook.com [52.101.100.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACAF3191BD;
	Sat,  9 May 2026 12:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328702; cv=fail; b=XtQ0YtfxeUjoFqO70hWHdYD9b75Q6XY27RG1mp19vw0SfbKXHEikIdoyNQRqb5kqSBndWI4nVqn+hhwbAnYldOvJV3AJVDAvUXBUUv2TjubAUK6wztba8KUDg1SNz+b08WsQVTh6IdRk8YPM3plz0e39HNjO46iGi+wRaKjKBfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328702; c=relaxed/simple;
	bh=+M9h+WFwpjmFPa8qJi19FX83XSMlEV12NduB2YWlChI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=A3+FH3om6hrMP03h8wW7S8vvFsca348OhXOn6H+1BAYJzAr47YL9ZoagZY7uztXq2AnXbHCCPckeSuEYlnRtmt+qJpGzglYqJbsekCtgZxgYFsb0shZAS+A0iQ+PofnVldW5XUQNW0MZFcfN7fNjZHQmgoXfGAFIDkqU3Lf8gzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=QiPz6eiz; arc=fail smtp.client-ip=52.101.100.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="QiPz6eiz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNVsyaVWAmCGzrZC2buDPGQidQxsqypwOk2Mv6vBsVJvsjG2ZaNnHsSpWVzn/ekIFsLNHRgDg2R46A8fMMUSj6fOGKPl12RnfhVb/EdI0QWG+zAA9mcv8QqBkU5EOp+DdP826Av0cjTuPZfLCr/5RxTkhKqZEUdiXLmE8HXXIRqZTJ2jHYDDbJ1cDIJdwsMA38HUwJcaKXd93oV4C3aPXdz5325Xb+ltzPkHArLoaRhHnEPKB0mwtMj16o0Tlv3QTaG2CJgwADYebX7oT5hqsNlZbPLi/M37OVo0eg7QGniWe3PiYnvZ5Ssev7lt6XSxljj24jl2FLAB37J/pVaSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktjPkMUCvrAArMWJZefLdmIk6a+RrLPh7nPmksgFLO8=;
 b=Js21LsEkuWe+d14jmSZ/X4/nUi2HtmITFDHwxwGXt+CMv7yLlMjFHknE52aJbjblthozEi+2wtcdJIXbZo5ML46gdm5DEQXjn0EfP31NBo2qz64dwa7Rg0uWHuNR6AvGV0g15dyxKgiq3qGZrAide97eP8Nm0SRnfIgsfH9g2j3kbR4eVD3FsiRdccWv+/uXiBlQcpVUFvflJcJhxFJmPsU8nvKq0wrT3mDy/OHeR5lPM0WVmXVS3JWG1dNR9hpJ6xUh3EsVhSC8wWpFNeGO6klfvT9M64gPyucnKLPI4vgYyOnqJ4YZcBeSAfpmQjlr7HoRphDSpCWVtm431IR9hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktjPkMUCvrAArMWJZefLdmIk6a+RrLPh7nPmksgFLO8=;
 b=QiPz6eizBR0aiDttpOcEwovaYnSxBlJJTSEZeYYrcHx2aytX4Kbig5MeQRxe9yhvXYDoVDGAKJ1838gEFkFpxvhZAn+oRT/AO5iEg60un6k4NZe+pPoj4AgRjBPSq6YrcpmNmchggBDzT64fbFr3xE7FXsf0WC0gGfBZjbJENRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO0P265MB6696.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Sat, 9 May
 2026 12:11:38 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9891.020; Sat, 9 May 2026
 12:11:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 09 May 2026 13:11:38 +0100
Message-Id: <DIE4WTSC6NIM.38X32UBL0ROHW@garyguo.net>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH v3 13/13] MAINTAINERS: use a URL for pin-init
 maintainer's profile entry
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <cover.1778309595.git.mchehab+huawei@kernel.org>
 <59144e7323b95166e61a7c7f84096a0b9bb5d26e.1778309595.git.mchehab+huawei@kernel.org>
In-Reply-To: <59144e7323b95166e61a7c7f84096a0b9bb5d26e.1778309595.git.mchehab+huawei@kernel.org>
X-ClientProxiedBy: LO4P123CA0266.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::19) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO0P265MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: 525791c5-a185-45fc-c4e9-08deadc41f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|7416014|1800799024|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	taoz4c/uU6DcX7K3hekF7oopxk9kJS/rfLtrnzu/jXOSX/EAof0ROj0So6ST2XckGG+czfO6/ZzbTYo9bZg5DE1hntVQ9iStlXwyu1951p5UN9hB0BVsBtnX6JrWy/2ITOcUOMvBqYdU9swND9+5oh7YbNWrjlkb2XjIcDA0mq3n9JhyoBzcFs3NGrOfTIDt/E8nztLmzvSK0m3ynibYL2t7GfvBlZg77p9rDGykRCqqA0OFMsOaxyRJjfjboZwKmINoIt/aYmORWwF4tB+x0prP4AomHF0bJhDV8T58qdsMxoWpWhUrkxY7nBECIcoQ70yqFhXxAqIeaTyKAEElp+CBmneieAKo6WYdEhbiRxHGjpuoB4UcODyqFCMjiePexdmuY5a5aMge1xOPde3fR25iEgC6Tol30nHx1Ow2XYei8Ex0LJCpnb5EJ6XFJLzhTGAyAUlrirYYCfeUIlUk0QRw37rOuSDOrhB1x0VXr/HG6TqSXagdemRxuL745NS+oMkXYlGaV24qJBMRzzUbTtxZrHhhcqi9+7UjdarzeTXKdCq796F4S2GXfBDw6u3bmDQ+TQst4o64nuwOa7eM9/damVdPv5GZdhKlQODdGVaL46dqT0iqZHxPW8XNRafBBt56fq6xF4GmtCSPuUdKdclvl0lJQAjc2ZMSh2vReug+x+Quz4wr5mAUoWnXYqCH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(22082099003)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHBOOGVyUjA2Z1lVVWJSK1BBeHV5TjE2MmpOR2pVUFNTZmpqNzFvNXVJSk4x?=
 =?utf-8?B?MjFOOCtqRC9sRjdGR2JGRjdzczFBMjJOUituckdIN3R0enZSdkhNeHNVS3dS?=
 =?utf-8?B?M2dnVS9wUHlOZkNXbXh5T1R3cVdMZUtmck5xdDBRb2w5c25mT0J5Ly9Gakt5?=
 =?utf-8?B?azNXZUw2NTllemdrOXhWQTEzbWE0NjVGY0ZpM2NUNlo0dStJRzk2ZmNUSjAy?=
 =?utf-8?B?SHVGZHNlR1BpT2I5dEcrVFlXN0RiQmdVZVFUeVRSMTdhZlFMNzBaeWFMQXRY?=
 =?utf-8?B?aVJqU01LV0tiTm9Jb2JHR0pxQUgwRjliQTdvNWpjQkhoRmplanF0VzUyR0xz?=
 =?utf-8?B?TmFDalBxNkhtTzlOdE50T3lzMHNvUkticldBcDl4UnU3NXpJYU1IUUdmblhl?=
 =?utf-8?B?Z28yQmppL1kwTVVzTDFvdnNUNCs0T1lURFhpVXZoY3hWY3VTMFlET3FtR091?=
 =?utf-8?B?QU1SVmhNNG9sRVE3b0VzMTJoVVZpVThCYWVFSXlwbGhySDlMUTRRbHk3aUsr?=
 =?utf-8?B?c0UveGQ0empoNDN0Mm1McjFQMTdJQjV1OU4rS1h4WUlqSU5JQlBuU3ZuSE5U?=
 =?utf-8?B?S0lab0ZKYm92eGxoY3dPTzdQNWxncytoRENqQVIwK3RRTk8yOTNhVXF5NWR6?=
 =?utf-8?B?eFU1cm1aWFNHa3dKLzJGbnRpczErWDFpUnJuMi85Vk9sQzdLTXJtZitvbkVT?=
 =?utf-8?B?YmFnVUFLcGZ1WkY3R3FyTzNJNDNrWExzSXpZZ1l0T2VBdGF6YkhDY3NQdGh5?=
 =?utf-8?B?NVI2bm5tYTN1SnVnQ3ZQZWNHdnRnOHhIc0ROdEowZVNidzlEYkdwQjd6MHJu?=
 =?utf-8?B?WWRSdzFNWUpwRXRtdjRHeGNZblhKa0REN0NaVkdzSTBxTW9XaitsaTZBMFRs?=
 =?utf-8?B?ODFhYWs2Z1NERDNLRURPWlN5RDhNcWZycjJqMXZxUWpuM0pCSW5SMEMzWDda?=
 =?utf-8?B?UFBydm50RlpyMmxPbkJmTFpnVWJZVEdaT0krTEExMUw3VGFvL2x2N0p3eVpV?=
 =?utf-8?B?d3E1VGFCc0dCeVJFYkVGQjBUZHVCSFRjc0JubmJXS09KRlBPN0krSEFyeFlm?=
 =?utf-8?B?N1ozbDBNc1hIb05BNXE0MkgvYkVzeGxUWkJGZFNLcFZ4bnhseUtvdFY1MVA5?=
 =?utf-8?B?anZDWHBVWlBvY0dOTWM4YzdRbjEzYmhwYlVOVDZpUC9sNndYWnZjTEw3bU9G?=
 =?utf-8?B?b1ZLcG9rVzFrUkp1QTcrc1p5Y2FERXFRaC9rRmhaUVhBNEM4THpCaGtJcklh?=
 =?utf-8?B?Y3RXdmhqZCt2NzY4UlZ5ck9iZ1pBWDlIUG8xYU5YSlhleGsxRE1xbkttd1Nk?=
 =?utf-8?B?TjFIZGpxUkxSVW94NXBsdmF5L0ZVOUxxNEd1bnpXMXdqUWVCVVN5enhoQW5j?=
 =?utf-8?B?Z0xzbTdsMDRZMW42L21OT0FsSkJZbzJ4VHhoSWpadG1NcCs1M3hxVldmV0ZX?=
 =?utf-8?B?TVZKRWdVOUdFOWpBU1Z1SmFkZVQ3SVB1dE5QeUYvTlNVTjlBdkNJaU4xZDNJ?=
 =?utf-8?B?ZFVnenhESTNlRHpaMldPblJMblVFM1F1cEowQ1dCdUcwUk1uQmZyNjJhck5S?=
 =?utf-8?B?VW1tZDFzVVhwN1JSTGFIRjBTZkNNTW8xTnZ5bDJkdVBEZDg2N0QvSVJYcW1Q?=
 =?utf-8?B?bExoWGhwMkxrOVZaR0g0Vmd2a0VNWUtleFZBbU5Rbjl3eDV1SGpYdTAzMkNH?=
 =?utf-8?B?VW01TmYrL1FVbWh6SkFlMGR0OFZJQnRrQjE5dHhXMHJMMzdYTVRTbTVqb3B1?=
 =?utf-8?B?OXdSTURpV2dETUtMcU1jUXVjZjRrVi9CdUo1OHRqNlJtbWwxcHlyTk5KSkRF?=
 =?utf-8?B?NEhLUVNzVmFWTDZLNXVhbFlQTE5IaExyeGJCMTJ5QkJ5SVJpVEQzM2w3dHlK?=
 =?utf-8?B?SE55NHczb2RQRHVCblNFdDBGQ2JjUHpmbVVwOGp0TllHS2VBSU5mMmtLcHBN?=
 =?utf-8?B?bXRuRVhXMCtKeGs3U2pUSVljYk1RSkdLWXNWamZoWU95OWlIMXdQVlgxRTVo?=
 =?utf-8?B?VzZTd0NseitOV2hMZkNzZERaaWRGVHRQM3MrMkhTbWRoQmNEbFdZS3o0UDV1?=
 =?utf-8?B?Um96bG5TWmJic3hGLzJTSnF4bW8za09WOTNUNVNPOFhjdnRKalVlV21hTmpS?=
 =?utf-8?B?MHc0dVVoSTlkVnNLcjQ1ekVaejA3MXVlRTMybEVoK1dydG8yR1UwdWVrV2dU?=
 =?utf-8?B?bGd5VVE1YytPeUFwNTgxcWNLbEZ4L2NnVEhyK2YzVGdYTENhYzNkMzdaWUJK?=
 =?utf-8?B?TjhoOE15V29TNG9HVWJVQjQvVks2RE9OMWtFNzMzSHRXT0k1Rmd6aEprQVkr?=
 =?utf-8?B?WmU3YWhQZmU1eFhGaG55QmJiR2dPN25uVStXTXppYmpESVVoYmhBZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 525791c5-a185-45fc-c4e9-08deadc41f85
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 12:11:38.8120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ii0qCjdhbX9HWcBvxKUDG7xCnlnIoyKeVgnhY0YyaYe9P3yILd5Haso+A9bDaRvz1GJWvJ9OrFcZGw0qLZ8V1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6696

On Sat May 9, 2026 at 7:56 AM BST, Mauro Carvalho Chehab wrote:
> This maintainer's entry is not inside documentation nor is
> ReST, preventing Sphinx to create a hyperlink to it.
>=20
> Change it to point to the already-formatted URL.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Message-ID: <1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mche=
hab+huawei@kernel.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Gary Guo <gary@garyguo.net>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

