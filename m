Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998725;
	b=xL+VLaKxr4nuyJxaVdkWsNhuqCyrVvHoWevLu0amB72ktfuWuVzglaFShj9Iife3ae7q
	 Ed0FEiMxv1C7Ja/X3VWKum1s3L7nNlvNT+nQDnH23tpxV9s3pG/U9l8Xf71TETmTOCwHq
	 f2slJL5f/wqxDBVYttnfxnyTGtKdaPcpkhTdQL2fCsBkCbtcOmBSFlUHusbrGjNNQCxfw
	 x5C5lu7TB1vrUVDqiXO48NEIS0LvLiIpMzA5JKATF5OLfnmMk0nOD0iTMYwv85+tKMkkG
	 DkUvyW0tYwLrVIlD33kLguhL9DbExq3s67qLKw7G81I0AJ2tpEpPgMTdzGReq1itXIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998725;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2wG/eFXnYFnSclfIIhlto94aVO+10kOpmFIvVMnX0Cs=;
	b=3aBh6ZEnsI+CIcf5jNAWCXpyaaNtS/+AkIB0DjUxukPZ+oaIU4AybVJo/UcaVtyXrP0A
	 IsgaqQkWQiAbOog+3JcvoYt5dNWPT9m42Gxv5snMbWt1AESx9VxwckM17R7b6SfvSmlRf
	 yjvomGfpDcIuiTJfgrkY+mTikpJtoncWQaVcUhrS3W7uvUnpBxYPBjglLf39GcJA8gKDj
	 U3D0WTu/jbYKAwYgzI3bqSO5B3N0LyzIX+KhN/H8AIOEt/xwrnqf44OlNMb74r/Dr/aG6
	 WohYyJuo1qkkYYHB+eMwLqWTDvQH3DiAdWhAhK/mZdPndYqGyAld5M7eynKSMELCz/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=cPkL4Itw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.72
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021072.outbound.protection.outlook.com [52.101.100.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA34F606A32C;
	Wed, 18 Nov 2026 10:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA34F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=cPkL4Itw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlrAmE9oAoX67ie+74/5HsiC7OYWPVX5bH22PMPq8xi64ypZeTbhSg1a6TZ/tqvodeD+piY4/5tdbI1cNP23L8XKUuKg6PaGuk2D6XIpCUX47TiFEM0xzCYtlK0+RDQi4zDo/lkul/5i6c0B0nbMPnVxaZxAzQMjylcfOOXihzKUxwwqj+uJk+LLudVakHzDzFQA93gFCFdnBbcP7cSHJRGv66/DOY6wv3h+aYfSF8dYFLw64SFzu5mw9vPPaAbZT+A+NJk9BVMAtQu0rnUmLLPn9d2iKWJlTmEXN9G/tUQ3xdtiE7B0WuhB6s5fZZ1Yn1jsDsfXRloSSrbZ41NkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wG/eFXnYFnSclfIIhlto94aVO+10kOpmFIvVMnX0Cs=;
 b=dDfNcV95fQTELCPhJlpwHjUlnstT06qBnoUMnkLiNvSAaDsJCJTsxzcuoV+xpkuiyNnR++mvB+bhEVq9Y3K1JDViUxe5CdIzoB4zMo+g9WbVHORIa1PO9xPCyRggDo7YNUW2nwzwxtYEF4G+iNybKScKvO/f8NhdmNXI3ecFO2zB+IE5OU9zlpUuUXN7JaA8an72h15uuJH552Mx87a+7l/2s/79SXOHOeM9O6Kkxpc4hREn4PDRklsnltWoXsUcatzSf58j2XhlR2GkP1YJYVy7IGyPZpjPajLzeOMhmTXT5E5HVWyuhkQ9rBhvylS4e+63MI6ymTBYUx55LlKYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wG/eFXnYFnSclfIIhlto94aVO+10kOpmFIvVMnX0Cs=;
 b=cPkL4ItwDqGbNsOEQjHC7ultglMDnYU5UH/FvSrSx0O/JVlHkCUZDT0T9nH2zwo5rjDDnQpd2/n+ggoZRHQg9oONOn/Z2Qv8q3BmDpIugzj1lUYcWQKLvzCh5gJGa95pbf41RpSYiSLlhNfokWusqSez2fdH7AQrHzFubDSR8sU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LO0P265MB9132.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:49f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:45:19 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 10:45:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 10:45:17 +0000
Message-Id: <DMY9XV1M1YKE.1FXRA27UM619K@garyguo.net>
Subject: Re: [PATCH] rust: xarray: capture the iterator lifetime explicitly
From: "Gary Guo" <gary@garyguo.net>
To: <peder.bergan@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jesung
 Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261118-cleanup-xarray-precise-capture-v1-1-43e148eadea4@gmail.com>
In-Reply-To: <20261118-cleanup-xarray-precise-capture-v1-1-43e148eadea4@gmail.com>
X-ClientProxiedBy: LO4P123CA0251.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::22) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LO0P265MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2a5e45-d03c-45b2-73c1-08df456109f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10070799003|6133799003|261009223027099003|18002099003|22082099003|3023799007|261022075727099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261028144727099003|261102123227099003|56012099006|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Xbz20wdmvGSslJfxo6jiFGuCq+Dt8tD3v488rx0w+lwfOHcZRZ9gVARpz8jXw0n3eCH+Ddc6J6wUOk2ANHxv8ws4ICRGl7ZhIEBGgoFOLbIZbRp7RxY2vpOWLKhFi4jTOUfmsZn+2Gfi3maLIrAA+4AcY7QBpaAvJ2Mhm6w2I4qlnvQ1DBiyinT9CY07p7QDiuPn4tXHTeSlTce0P7gOmHAiN5Ex9EaLy3cqRvfNoj6VS5hWi/tC7OklfggpzQJqE/wQMWNnAODxWXTehEQ2R6pmpV4ZDqL9YxfDXt2mXg/tA21WdGEKXnWw2PQDW97Kae4Ec743Nzd5FG+gG5SPh99VuiERY8//xGkuLxRzTwVVf87jJ4+OkDG2zChi7/M3xyJ5EKF1arhKp+uuTA9YZHn9hBIgvrmivhmDMjCgMJcsIoRdYchvbvJDTerG+2/swjzo+rtRt2TKSccHx60O6rb5AWhm6Q/O3kPSlQpYlDPwn82hfM8PmIJl5N5gA1IkVrKwRvA640yAK5TaM+gMkd8m0sbU7tKKoWPV6hHJFtN1zN0LeJoYm3lxzIWAggL30/2hKdol9Hzf8RbQsUn/XLFAE4e4c/mVtegNIVTDbA7asiTbyD5ZrQEoQt8MQd0MmBDuvoPGvAedobYbWn1cY7TFMY7QFk1YvsCV6+/yUZE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10070799003)(6133799003)(261009223027099003)(18002099003)(22082099003)(3023799007)(261022075727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261028144727099003)(261102123227099003)(56012099006)(261026140227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGV5ZHlxclNYZzhDSTNOQWsvRFFxaU1yb2c4ek5XV0hHQUdBQUtvUXNPWnZj?=
 =?utf-8?B?QW5yM2pJQ3dEWE9SMzhRYmFXRGV6RGczZGtGMkRncDhWdm00K2daNzVmSGlV?=
 =?utf-8?B?YmRBRmFOelVvbk1OVjNtVnJrVnRwQzdJb2hkK0NjejNmcElkQzdVVFJ0WkZQ?=
 =?utf-8?B?RG5qQ2JKR3lVRkl2bkFLRHdZcGZqNGRYU2xmZnY2THFjK1duV0FlRjM0eXVl?=
 =?utf-8?B?WjlOaXc0eGkwTE04dDhrOWRIOVJUbmJ6Q1NFRENuazZZSlQwTzQyNlpRMkNl?=
 =?utf-8?B?LzljMHg5R1RvUWhmUXFZVWwzM3F1NGtLZm42bmJidGpLbjRtUVBmUzFDckl6?=
 =?utf-8?B?TGl5SlhYS2Q4aGxWS3NBZEoyNFdocXByVnh2dnphRVdsTGZyMXRRalJzNTUr?=
 =?utf-8?B?eW1Jd2xWYzVtcGREZUNMRURUbWZuQVJjaVNFS0t6WCs4WElJTVZZU2V4THBs?=
 =?utf-8?B?Z0JGazhLVFR0YXBVR3BQQjR0Y2tuQmVSU2pWcEVyRnEzdExrdlpEM3lzU1M1?=
 =?utf-8?B?TUJHNWRONDNuRGZyTEVaZ0tvYkI1TWEvOHpFUzFMcEx6U25NUDkwVVBncWU0?=
 =?utf-8?B?dUs2ZU9KRlFiVUlhUURMNVE4bUhWSkFZaXJBZCtDMWE3WVc2a1cyOEZ0Y24y?=
 =?utf-8?B?SmV4NmZad3grdHoxQWRMYnlkWmtkVldhSHorTnVWcFRnY2V4dXc2dlpDei9Z?=
 =?utf-8?B?bWp6NVJuaEdIUHlyM1RpUjFkeVNlUTR2Y3phV1hrRmtBenpXYjZlNmJBL0lv?=
 =?utf-8?B?SGZ0eldJaHUzeE4zdjVZNEZwUmVRNzliOFFENitOQlZEVXRSemx2aVZMMGR5?=
 =?utf-8?B?bVAyU2JheVpubDdQdG5yZndVdzhIVnYraUdKVUFXRURVSlIvNFlIbXhKTFk4?=
 =?utf-8?B?N25sYVdHY0hnVVNBNmY0M09oYkc5SFFCSEFodHY1YUd6b0lYQithd3pxWkFr?=
 =?utf-8?B?YzZSRXhRTXRFNllPQURLd0FORFl1MWxpRE1weFd1UExLQk1xSHYyc0dKOWZu?=
 =?utf-8?B?aTNteW9rRCtWbDNJcUhzYk9JeGgwTmR0MmFyQkgrdkh3TWU5MTFtb2lPWFp3?=
 =?utf-8?B?TUJYR092QW12SGc2U1JycXNKa0hZWHMvKytqTlhmeUtHdTZSRUUvSUxiRS9s?=
 =?utf-8?B?by9ZbDNsRHQvSVpjTm9VTmV5TmFHRmlKZHlZNTVZNkZwWERoTXhSUkN1VG42?=
 =?utf-8?B?WlY1amgxTG5rRURQb2JxWEJXRVlNWG1SV3ZZcFk0WnBSTjh1Y3dNZGRrc3hk?=
 =?utf-8?B?eXorVElsSTEzYzBaU3N6SHZnSXNBZXhsNFo3WEFSbU56OEp0NVFGdG5UVHhz?=
 =?utf-8?B?eEZISGY2KzZyTXc4dVZaWXFubzloSlh0MURYa0ZsSVVWNnlVYnYxUmsvazYx?=
 =?utf-8?B?K2duMnFKSE1OOW1LbU0ybGFvcmxqaDBnR2h0ZkJJMXdKNnNWZlVQdWFsalR2?=
 =?utf-8?B?dlU0VjliVVhuVGs1bkE5MXNYSVhJbG05UUZJTm1zK0Q0cWllMGlJMWdRalRF?=
 =?utf-8?B?Q3VnN2ltUkZtZHFoMmtNSDR4am9KRno5QXR4RVQyOFlXdFBhcTV4bTk2STJL?=
 =?utf-8?B?aSt6UTlGRWgrUVVtbjM4U2txcWtIY0RsOVYyYlQrajd2blZ0TzJTRkZibkZm?=
 =?utf-8?B?N0cyUEo5V3RFbk5lV2xyUHdWN2R4QngybXphcStHM2VnUURlT3NWMlJ2Wml6?=
 =?utf-8?B?Y1hKcjhwVHN1azVyclppdUxNcEZEZnZJcndqV2tvWkJ2WFVkcDFqV1owOFZF?=
 =?utf-8?B?TllxallZNE1ta3owZHlxR29RMlM1a0t2Wnhlb3dxVVk0eXNSWm45RWVBa1N2?=
 =?utf-8?B?Z3dncWc5U3o4Z1lUczc1R25uak04ZzVTRSsrZ0F3cWpWL1FnaG5UdnF3cnho?=
 =?utf-8?B?anpNVGxKU3Q5aWRRanJZMTVzNzV2ZEJzQmgwQjFpR3YyNEFxS3RKT05mZGlk?=
 =?utf-8?B?Zll6NU0zRHVMN0ozMEk1RDcvbWYxZjhXd1JLMnNXUnpyR0FFSm1OVGRNNklY?=
 =?utf-8?B?NGwzOS9RaWZZOVRsNHhsYThvcTg1dEhHdkpaSkhDcXBPRzQyelU0bVNWTFE5?=
 =?utf-8?B?SEoydm9oWC9IejZ3aUN0TmpWd0FmV25kSW5EUWUvSWdFNHNEbGZWSExoNHNa?=
 =?utf-8?B?czFIWlR4Skt4eHk0UCtoU0RPVjhmNUJXY1ZLVFBvM0hKNmJjQzZtekdNOWJD?=
 =?utf-8?B?R0lZaGlRd2sydGR4S3JaVkltcHRUZjZqY1M2YVptU29WYlljeFFUeDJYeXZl?=
 =?utf-8?B?SzFNR0ZFVlJVeWZQRmxGTjIxVGZmYnpMN3RhYUVQZk85NFliS1lMdEdYVnFZ?=
 =?utf-8?B?TUo1OW9vNE84NWhUakhNMUZ1ekEzU2YzdDlnbWRJZFcyQXRVU3NJUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2a5e45-d03c-45b2-73c1-08df456109f1
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:45:19.2314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VO9xAGlA+fC1ph6TO+CbR5BvWp6bvp8ldx5c9A6WeCGTaa378pHc5kRIKApJN0lXWr6VswtgPzEAeS9/shSKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB9132

On Wed Nov 18, 2026 at 10:39 AM GMT, Peder Bergan via B4 Relay wrote:
> From: Peder Bergan <peder.bergan@gmail.com>
>
> XArray::iter uses an outlives bound to capture the lifetime of the
> borrow of self in the returned iterator. Its caller consumes the
> iterator during pinned drop and does not need an outlives guarantee.
>
> Use a precise capturing bound to name the borrowed lifetime. Also
> include T, since the bound must list all in-scope type parameters.
>
> Suggested-by: Jesung Yang <y.j3ms.n@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1175
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
> ---
> The XArray KUnit doctest passed on x86-64 QEMU. The Rust kernel
> crate built with CLIPPY=3D1.
>
> OpenAI Codex assisted with the signature changes, testing and
> drafting this commit message.


None of this is relevant when we upgrade to Rust 2024, I'd avoid the additi=
onal
churn and only do this where needed.

Best,
Gary

> ---
>  rust/kernel/xarray.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index 987c9c0c2198..4a67e7f24335 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -108,7 +108,7 @@ pub fn new(kind: AllocKind) -> impl PinInit<Self> {
>          })
>      }
> =20
> -    fn iter(&self) -> impl Iterator<Item =3D NonNull<c_void>> + '_ {
> +    fn iter(&self) -> impl Iterator<Item =3D NonNull<c_void>> + use<'_, =
T> {
>          let mut index =3D 0;
> =20
>          // SAFETY: `self.xa` is always valid by the type invariant.
>
> ---
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> change-id: 20261118-cleanup-xarray-precise-capture-1bf06165c6cf
>
> Best regards,
> -- =20
> Peder Bergan <peder.bergan@gmail.com>


