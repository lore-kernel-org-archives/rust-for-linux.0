Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022076.outbound.protection.outlook.com [52.101.96.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3832ABCD;
	Fri,  9 Jan 2026 13:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767967109; cv=fail; b=S+mEb9h8xfOw6H97NQVvCe/ha0XboFDEM/7QZNtC7QIwZWTIBxuk63tnugNi/b+hnzfdrrOpPFTqNjx1RGacUsEc+RFzDdrvcLRwAbYB8aeTja46RKHLbeJqZXAZDy7kZLT2xgLu0bjP4weFv651C0aYwQ2IvU3Hk+SwLcO8DS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767967109; c=relaxed/simple;
	bh=Dz34amOM1eo05+OUsQopQHpS/KahAFcI4f5Jlkq+rfM=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=qRquR4B2+5Z/nyUDECtYtCed4N6giZFtezFFilv/rccVljTmVay9djXs9b+gdKAJ6Ma4QaV19RkRUZe5Uop1FkyOQzAD9XVsckgaY7wK6Qr8Z0N4/NSdeUkNlKubbMdMEUlb0sxAjZ/y4N/kXKqVIcUt62lswej1ZCtw051527A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=XxEVQkbr; arc=fail smtp.client-ip=52.101.96.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XxEVQkbr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBjJ1n2BB9nsHtLfbfxXAH2k5//7dJXHE2Gy84jMemiqP1HCfwWBDdu9XjACbShs5INDcHAJkDzd7d/6ZBUsYXLRmk2Zh5JJPuDPAjB2zhbXdGhWpKG/XIXs4hlF/iUmpAD4LoI1gYT5qmGxwROwZhkL4cCRYWuwmFtqcb10lABob4avmImTuCgrC/7dXfZuC0U5C4KE72Wp/0U6MUpiaPyQ293kKd+SZF1cLxG3n/oseRBW3xSpFUaWFQHY+M9u3TqxGCtD+hHKFDV9EaBBAmm9ZGoQTpdV2LAB9X7CtVQ5aAFP82Ebunu124SaTqE9TkrjiPAu9PFplG9JIFqRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWwRPw/3sTKIZiRNwdV8bqenhia9lr6UvuaQdz7jqZ8=;
 b=v2b/auuKdZ09TDn+++cZek7q8hrFIDX5at+JHTwBQV0/P6Ss2XyGePlu0Ik9t9JxN+j6HjX62IgAUiR9Su31KJ815Ve+YYoKHkVXR0HQ6+fEErJ9V4OlNrw9wygqaUcglTkQfIX6pyaVe6zKDy9pri/TRfFez9frJZHzWJAYzsSlCAHxdFh/bPDVFjZC9mK4MrkQa8aJFqT49yLAtStDVczNET4yKYYROixACU7r96kXAa3hWHHQRn+KJfR9yALk3Zu03pJL3IcGr+R7X4C6FKpxQI2gZ2qGn+93tzm23zxEMaIQFawxObwrdS+JneVAkiyHhnbMShNYgvqQk71z6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWwRPw/3sTKIZiRNwdV8bqenhia9lr6UvuaQdz7jqZ8=;
 b=XxEVQkbrtW/IGO8Kll7I/0jQLGd6L/fhAGBV4glaRWpYT7ksocl0qL8hM8+fcLGUp9UkV59p+wGFoF/xk25LCxw1470bVO99A2+hzMIF2oou+addPVHarvoMiECyENbhOGaxkRiDLnUKtzQdvBHNcoYYnDgn47/D9bTCIuEe8Gc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOVP265MB8743.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:489::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 13:58:24 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 13:58:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 13:58:23 +0000
Message-Id: <DFK4173K583S.DFF6M0ZYY6RC@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 12/12] rust: pin-init: internal: init: add escape hatch
 for referencing initialized fields
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-13-lossin@kernel.org>
In-Reply-To: <20260108135127.3153925-13-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0451.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOVP265MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: bb66a88d-9865-4909-8879-08de4f87282c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDd5MG83ZG5WVEhIdlFicEh0UDVYQlNYckxnUTZ1YXQrRXk5R3p2eXRvTjBt?=
 =?utf-8?B?NHhJT3lxbEZxOFZPS2JEZU1pT1dQdXlkTERIYzNOdHQya3JZMUZtMzBzdGd3?=
 =?utf-8?B?VjlQbVpqUURtazczamd0QTNhajZrc2l6NU1WdlRVR3lzWTRpOTVTbWF1VUgx?=
 =?utf-8?B?RVlwZnNQU0orQzFLN1hpdjVrWHVOM3hrbTlJNXdlcjJsT1FTcVJ2MVpGK0c2?=
 =?utf-8?B?a09DdXRKNmZkc05iSnFqR2VPWE5YQUJMMnBMWFpVRU1rdlgwK2tBa0RFOHRq?=
 =?utf-8?B?QW9sVUVnd3A1QmxDT1RlaStvNk90N3JDSGVQRjRIa1ducFVSci9TRUc1NEQ4?=
 =?utf-8?B?Z0RPYnF5NzVDQTlHT0hkNENQR0NJdEJhbjZFNFQ0WHVqbFlvbG5mZ0RFeDNl?=
 =?utf-8?B?Z1RMVkFlSWY5WXc4YWxGV0JxOHZRTGxIbjkzTHAySTc4Y2Fwdmdwa1BlQ1pr?=
 =?utf-8?B?dHdLQThHY0tmY3M0UkhSNFB1SFM5TG5xZzdkWFBQNHMrdXFiWG56MmxiQWlC?=
 =?utf-8?B?T1lrWVFTUkJmdVJrcXNma1RDblcza2U5aU5PeXJNbHlzQUVaSDRTMmZqb1dI?=
 =?utf-8?B?cDdUTTZJWDNKSEdieG5hUkF5SnNvcUJ1Q0ZINmZmVlFxTmxIa3Ruc2gyTGhn?=
 =?utf-8?B?blk3TmZGaTNFc3VCc1hMK1JzWk9Qd0lzZURqL0syNVhRcVVaR3hoNVpOYkVy?=
 =?utf-8?B?REJlTHIzVnpsaTRnNVRUQ1dJaEdMY3pqSmp4S0Q4ZGd2S2FyODQ0a1huK3FZ?=
 =?utf-8?B?ZUZ2TDhTb0JnMkplUHd1WGM5b09HUUo1WDNSSEN4Z3lsbkl2cVljOENneXo4?=
 =?utf-8?B?bFhXT2hZTC9vRUF1V3B3djZWYzUxQ3pheHk0M3p4THgxeERSZXBrbW1NY09t?=
 =?utf-8?B?KzVMSUVoeEFsckp1emFJSWJXd2wwb3BPTm9OZ1VQcmZzRkRRZmlQbG1wM3pF?=
 =?utf-8?B?d204U29yZFdpaWtjdXB3Q0tmVDZvUFRHUmtkT2pucGFWU3pDckZhRE9qODdm?=
 =?utf-8?B?Sld6dzJyTzF2M3dhUC9Yc2t4MkpaK3RITEMrUGw2eUhrZDRTNDBLUlNydStB?=
 =?utf-8?B?MytKWnhkaGJ5bVVRb3Z4NFFMTzVxUGJvR2RZTWdWNGtsanl5aVdWWEJTQnpJ?=
 =?utf-8?B?VEh5MUM0NVRTOWE4ckRLRzZsOGZIMTNjSUsraE0xc2JTR1RYNGIwZ2U5TDR2?=
 =?utf-8?B?Z3I4WDhxaGd1a3o1VzFMVVBxTXY3eUtHMEFzdXJRWnhLbm9SSDFUQnpwQ21a?=
 =?utf-8?B?clpIQ2MvSTdZbDBwN2huVXZxMEoyMGEvb0hQbUd0Slk1ZUFobkh0RGV6cEZw?=
 =?utf-8?B?cVJSNUFWOUFRN0grNmhrWXZLRDBUeDAzQlppbG1pUzU4ZW4yODlOc3dxZlIx?=
 =?utf-8?B?M3hsRG11ZlpMZWtyM0lMdTdTOVFyOEFGMU82ei9yVGxQbEFld2RwMDhRZU5X?=
 =?utf-8?B?dlBORGMxNk5xQTFCa1lyM0hkSlVQR1FzQXN5d2cxekNGL0RKSC9qZEJ5cmZu?=
 =?utf-8?B?TVR0SUNWQzJrTnE1cDdFYWk0VzhjNm9xUjR6QkdJdXhub0hlVWxMNWJoV3lt?=
 =?utf-8?B?cjk0SXdmbU5hUVQ2R1RENWQ1eFNwVHZtRFdhUTNpWis1MUZjQ2NuTHBzb2ZP?=
 =?utf-8?B?VFhDNmo1Uk95UStNUjZMYnZmdncvQ3N0ZVNPTlNKY2NUei9iUTdWRWhkQ1Uv?=
 =?utf-8?B?VEc2M1VSMUp4K29SdER0Qkl2ZnJqbkhzWTFyazBFdXJDNStPdUd6Y3VvcGxj?=
 =?utf-8?B?QlRJTDlmenNsNG15bjVpcjJ3Z01YRG02cG9kTGgxVUlqcW1tK1pXNVVXdFRG?=
 =?utf-8?B?QnNvTWFRdEFwMUFacml5QVBXUmdpQmlHLzlYNkdFYVdCNG84emVGdjlZT0I4?=
 =?utf-8?B?TmF0QzhQTE9WdjRONTFGcFVtWmUrN0ZvVmxUZU5HNXpxQnJQTCtscU5WM1ht?=
 =?utf-8?B?RE96bzhXTFNhYVg2a2hNSVdHS2FQT1VlZHBJZlBkdDErWTBEV1daNFJtUWkr?=
 =?utf-8?B?SXR6QjVMdXlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmVHMVRvbzd3L2RYMWdST2svQXgxWm4zTk1EWHFXMzZVK1BLMVc0ZFcvb3pw?=
 =?utf-8?B?MFRqdVhVOFNBTStXNUxXVGVzWDJDbE8wQUZpeklBaHN1dFF1KzBzaTNtOE1G?=
 =?utf-8?B?OUR4ZUx1WDVkNTExNk96WUNUNFJ0Ump6QVV2V2NyMlBYSEZscDNWU3d3SE1X?=
 =?utf-8?B?MUEremlZcDZhbm1HRnBzVUJ5YmNGWkoxZjkxZFVnVU5DSXdyOGF2VDYrR2Zy?=
 =?utf-8?B?bG56enphRWF1N0NzT3hjNFEwczc2RFQ2YUhFcFoxSFdLNFRVK1YwT2N5dk51?=
 =?utf-8?B?cEdybmV2TEY0TFU1TlZsaG1NWVlrUnE1dzgvTGVBQ1RsRDI5eFk1U2tMVUV4?=
 =?utf-8?B?alVXcGNlNVlmdzVYMmI0NnluMHpCMCt5Qk1KNDJSbXZVeTUydnpqM2dSSDJU?=
 =?utf-8?B?TVFLQzFsZTJJT0FCdXpYYTBicE5GaHgzZ0pNSXdsbjR4eFgwUkZRellPd1Vo?=
 =?utf-8?B?YW02QlRtWkFCa2ZSWVRZK1NkeXpXY0txdWRuV2kxb1ltOTIzTkl0N1BHSnBN?=
 =?utf-8?B?V0lwNklVSEZyck9JQnhORDdwcHlNMjcrajlQdW9hdys4eGx4VVdOSGFVdU9J?=
 =?utf-8?B?dHd2YnI5NFpkS0JIaGpRRVBCS3ZxMFFObTRtOTVrUy85Y3lhcUlqUUxudyto?=
 =?utf-8?B?M2xIVDZleCsrZEh1eG1Pd2JMaklwT0tGTFBoZHZQSG05NG54WEFGZytwZitO?=
 =?utf-8?B?Y0lCQnVFdHZWcGM2cFZqNFRMZ3hNRG14VmhjRmxNMjlURTV2aXY3QTByMVJX?=
 =?utf-8?B?YWMybzRTR0pCMzBzclp5UG1hYnM5bVJMY2xGcnBhME1ibEwyUy85MkNlWHpE?=
 =?utf-8?B?cFprR2hZdW1qY3c0L1VKVFBDZUNJVU5OYUJmMEpzUWpTVjdIU3BadHZyT0th?=
 =?utf-8?B?MGRnWGoyUHNDbFR6RnNsUit3cGhMNDA2ZVJSSjVvTGlVcG42SmgybWdqRWkz?=
 =?utf-8?B?MmNjZU9Mek84OGlGVkM0N0dxTlUrRkMwOEFjK3A5NEJ6V2ZDQW5SVUxIbHc3?=
 =?utf-8?B?U2ZCMGw5MitWNmU4Z1I4MFFEQyttZDR3Z0hld0h6a3R1aERVOHliK0dyVnNN?=
 =?utf-8?B?NmdUSm0rbEhQL0FRTXNjQ3dHRkJPZHdNelB5cE9jM1hWc1RIbGdocmpIemtV?=
 =?utf-8?B?aTI4REtjdGxWanZiOUY2K0JUOXFSWDQvMnJSZXJCcjFna2pBOGgvUWhObXV2?=
 =?utf-8?B?d2hQZ0FQNkNEUkg2dlUyQy9IbEl6STEzVVprUG5uUjl4a0hhVER4Z29NSHRM?=
 =?utf-8?B?RDVjRU4wd2hMcXNGL0Yzc1hrY2txNWtXWHoxWjFSRW5KZHZhMGs5dFZ1M1JG?=
 =?utf-8?B?OHRHeS9wNnpaK0N2SUM2dy9ONGRVQnRTNFpTcklJVnlSVENNQW9jMmhLcHFR?=
 =?utf-8?B?RzZSekVzMjlHWWV5MzZyU21UR01tRnY4bXpOQWRteDNVS2YwcHg5RzNSN2ZJ?=
 =?utf-8?B?TU02UC9IT3AzTkhJNW1pQ0pkSjNwOHZHWStweU1OcnMzZ3p2OWhUemg3ZW56?=
 =?utf-8?B?aTI5azZCcXcvNS8zR3JPUFBhOGc3blFRRTNiNnYrem1ESVBUUVFIUUI3Zm1s?=
 =?utf-8?B?RDlNN0o3WEtZWWdTOCtLY2ZiUTlyakRzakFwK013Tjh5TTVNeTNOZUVLYU5M?=
 =?utf-8?B?aHFyUk9LZlR2SkE5R1VRdHJYKzY5cXdnVjBUcmFqREFKTG52d3ZjWklXRW5v?=
 =?utf-8?B?V01xdTJKcUl5MURLTHliRmlURGNPcVJZK3Y1U1BnN2NyTXd5ZkpZNENEVnRl?=
 =?utf-8?B?clNZVjBrdkNpRjYyeFJSdEV4MjVOclNyTGxLMy9FTGxhS1JVRkxuU0orMWl6?=
 =?utf-8?B?Vk5QcDE0bFA5MVIweTFBNmF0b0djU2YwVlM4M3p2SGRnMGE2L2lpU1hEY3Zx?=
 =?utf-8?B?TUhJZkdjaDZpS2dVS2ZLU3VJT3VYMWZVMWlRVnljYVM3Ry9GMWdJRnRta3R0?=
 =?utf-8?B?VlpFbUN3SXk2b2dwY3FWYzR0MjhpWndjemJQU2xKZG80RmRYMXpya2hGWk50?=
 =?utf-8?B?U1Rsd2psRnFmTnhRSWk5QlVtRVJRelh6dUJMR3ZERVRLYWpsR2FjZmpRL3Uy?=
 =?utf-8?B?SVlIajRmOFBZZzdSRGtLQWt6ZnM3K0pEM3h3aHFiNDJNMDVhUHVpRlVXK1M1?=
 =?utf-8?B?SnR1TmowY0Q5OVoxVkRTR1Q1MUd3WkJySHVSeitZUmN1R0M4aVAxTEpBWUl5?=
 =?utf-8?B?WTA2MzFzUm1YaUgyY1JhQ0lkQVBpNk96cXFpeTlKWDJVbXJRa1FuZDZHMWR2?=
 =?utf-8?B?QkZTZzRqT2tDWjA4cFhpY25ENmsxWE1zS2haeksrcGJ1UG5BUnRLMTFJOGJF?=
 =?utf-8?B?U1pkZnQwTkk2OEdCcW1DK3lJNy84YytPamEwajFmMVIwSzcwQzBhV3ZDWWhi?=
 =?utf-8?Q?Z9HLCS6UJot3jTj4=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bb66a88d-9865-4909-8879-08de4f87282c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 13:58:24.6982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7KoTWBhdrZTQpO6bwr18P9zelIaIoVoSscMqfMPItvUDjRz6bNKwPtSNHjHsAuwoSyAFT6mq7cekPWKAGPgyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8743

On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
> The initializer macro emits mutable references for already initialized
> fields, which allows modifying or accessing them later in code blocks or
> when initializing other fields. This behavior results in compiler errors
> when combining with packed structs, since those do not permit creating
> references to misaligned fields. For example:
>
>     #[repr(C, packed)]
>     struct Foo {
>         a: i8,
>         b: i32,
>     }
>
>     fn main() {
>         let _ =3D init!(Foo { a: -42, b: 42 });
>     }
>
> This will lead to an error like this:
>
>     error[E0793]: reference to field of packed struct is unaligned
>       --> tests/ui/compile-fail/init/packed_struct.rs:10:13
>        |
>     10 |     let _ =3D init!(Foo { a: -42, b: 42 });
>        |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>        |
>        =3D note: this struct is 1-byte aligned, but the type of this fiel=
d may require higher alignment
>        =3D note: creating a misaligned reference is undefined behavior (e=
ven if that reference is never dereferenced)
>        =3D help: copy the field contents to a local variable, or replace =
the reference with a raw pointer and use `read_unaligned`/`write_unaligned`=
 (loads and stores via `*p` must be properly aligned even when using raw po=
inters)
>        =3D note: this error originates in the macro `init` (in Nightly bu=
ilds, run with -Z macro-backtrace for more info)
>
> This was requested by Janne Grunau [1] and will most certainly be used
> by the kernel when we eventually end up with trying to initialize packed
> structs.
>
> Thus add an initializer attribute `#[disable_initialized_field_access]`
> that does what the name suggests: do not generate references to already
> initialized fields.
>
> There is space for future work: add yet another attribute which can be
> applied on fields of initializers that ask for said field to be made
> accessible. We can add that when the need arises.

An alternative might be checking if the specific field is actually used lat=
er
and only generate references if so. Although, that might be "too much magic=
"?

Best,
Gary

>
> Requested-by: Janne Grunau <j@jannau.net>
> Link: https://lore.kernel.org/all/20251206170214.GE1097212@robin.jannau.n=
et [1]
> Signed-off-by: Benno Lossin <lossin@kernel.org>

