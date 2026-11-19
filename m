Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.101
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795055179;
	b=w6vKSuKGqC9lRZekvqEVhxcZY1fWa9ihxoHGLx+W6tybAEbAn/aZ8kAkhMYvtBA+N6vy
	 hhWnv9SPrJhmQFANvWpt8dem5f/MWyi0gKrigLE5fPb4jDDyxk/ZZz9z/jw2Y3NPYmJd8
	 waYSft8MmCsr2ZUpkE1SNvuZc/vuyERmUf8UzhOaLTTUkMRYrzu93dgHd89yEtv8Ko00W
	 wRXqlluGLlUPs7KOA0Vb2GJC2rYtdyUoYVdoPuP9g4kKtrMorpuDPfXkNvMTiftY25L/k
	 bQln1rZb2OqJzmxG9067KIeGxq4OjxHEV5/DBHTtgMs8wQawgGqK129x+/HclRzQVAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055179;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=+y1sryJ4zE0m4LV3NoJF+n1XCJQE6nbEJaxRmHqQpGQ=;
	b=tPAZ8LhLI/0ftIPbyUUg66kIJ01bqX4K3/IH0GqNsFLwFkbPUtZU9afYVmAAoeewDFgu
	 mPhEszlozhbdrBq7C+AlqhWf7ro/s7AuIabr7gvgYtdlpcGZrNy70Ygq7ZUIpx7DXD2Kz
	 CDgN/SG+Ihi2XlDOBlZSfBWZPxG+GaJyKLNB+C0AKhQcWfzEnZV7t0WmksCRLbNmB9mZC
	 Odf5HGi0R71MiGdw4XuSR4o1RVvtHasw6vy5KqOok8j6h8LmQlshezrWihvl5AMdYE2E6
	 f7Na2Pp3/Afl7OOiA8/94GEZytHwnzK/F6yrcuQg5ATEEZXWoDO9kW9yfkEEs8T8Lig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=MDZhGIk5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.101
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022101.outbound.protection.outlook.com [52.101.96.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F5D606A31C;
	Thu, 19 Nov 2026 02:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=MDZhGIk5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVYJTYG0psewFpdGgVstu2F8v4ec0u4nFMQxFAv0choAGeyw98GutVhYqOQXogvid8YYWLPU6KDSmntv6xHW1tRVFKdIqdUrP/5mUcCnBYXeVHervwBR1HPhx3Yhp+X4398orTITS68MRf1d0tm8fbKQt5Z2WQKusarihF3ESPnCaPiSDZf76U6F4ATr+qc6PUyHPQXWNLWPRfbFpBTlMPvfoRiAJ6OUETmB4kOSiN7YUhSQp5LJJKJ6MrVyhYYTeF+S69ZS12NP8KdZ9RmhIn/oXaDJUjgwIuDTUJbji3uIAgejj5TfyxFqye9W9RdGHqG9I+d5aTbiWqUQo0wyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+y1sryJ4zE0m4LV3NoJF+n1XCJQE6nbEJaxRmHqQpGQ=;
 b=DOkpoW5SkMc7WdGr9laEuSglktnX62Ea8X84HJqQWwckUO6Q2nkREQiCYa1iVXBH96EcK4aHUFS+Bh62q520mcKfWoK0/jaV1RwTgQF8owoDKIFphmH1nrbguYJ7c2zybx/TwugxpYFXRaRM92hHwUf2yXn7NAQIBkafFqqVEdfIdVIjmQNmtSbRwA1XctK6nz7ZmjL0BjNtLdocz+fBSwsKPvcl/QSVwCRn4h7txNC6Eg6UuvQXUNKVejG5GVwJNtOJ7YnW9G1+iILWRd4pMWxwo15AFoLHBqGHfOr8kG6ILaDHdDz/5naJ+wBtWbYfMz+Oco5X5Y7H/YUXDB3pmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+y1sryJ4zE0m4LV3NoJF+n1XCJQE6nbEJaxRmHqQpGQ=;
 b=MDZhGIk5VRjFoBwNmqXdwgbmaOk0y654BFFZMx/FLLtTjcxWscUqpcr5IRxseVNGcDa5WC7XfF4m6pnu37Qbbh3nkLIEaUDxAHjCiq+tBP+cr0AVjwLdere79uM0GhbkM6Ei/OqJGQ8a8uLedqPgzKxJl85/pXPP8KDTCF5d8wo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LO6P265MB6751.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:302::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:26:13 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 02:26:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 02:26:12 +0000
Message-Id: <DMYTYA2G4WEM.3U76EBDBUEPN9@garyguo.net>
Cc: <a.hindborg@kernel.org>, <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <gary@garyguo.net>, <lossin@kernel.org>,
 <rdunlap@infradead.org>, <skhan@linuxfoundation.org>, <tamird@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>, <linux-doc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] docs: rust: mention #[track_caller] for functions
 that panic
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <corbet@lwn.net>,
 <ojeda@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261118234452.2621985-1-tomo@flapping.org>
In-Reply-To: <20261118234452.2621985-1-tomo@flapping.org>
X-ClientProxiedBy: LO3P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::23) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LO6P265MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: 59805567-ce4b-4a32-58f9-08df45e47b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|7416014|376014|18002099003|22082099003|6133799003|261009223027099003|5023799004|56012099006|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261021135927099003|261021123027099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	SlGCc2aePFhvYJfsuMXNmrCdZqcTyTxSkWho/oNWFtCsj7npmAr7MQNGJ0WhKrluKbCA7CiDD6eZn2q06ienDxOpS/nV9lxE9o6VJbytAEJS6MuCeBCWKa6JKwWlHhD2fcu+m6jRgyaE73CxQOcsJzDFeZaR92QM+TgT+ne79dScRDReSBI59cK1dJPHnNZ8X3XSXwJXDwBKYrFlUkLbeHeqi0EoT6Naw18/b0EK+TsFsz4eeXl9jo6KzI5QM8YAv/aMbAYb6XkhkD+Kwjd8TC9VAsaHPPuV05r7S9CChULzy3ZIwD4O45Fy4//auGd04Dq7Eo3R4CxQ1FJW+pkS0APHevK3W+A6LVMMjkxlkPNarbhwdrAKGvD4oSMXkPcqD6V5dNoWW0NKFtJYlHNsv3jeVz23Mu8N0T+kXoD2V1Q0p2gIX1YqH4T39vguTu56cFJwYwDqfIvd2p3Pe27iR9D8uj/fLztr6J2zoulJ013XiKW2gY75ZVlKxtKcMUe6ushQdiQQcdH2jTzPY8gtO6xa8J4y+bLiu289jJjerFrVhvP+ZYim1dQYr66SIWX+NtQ3hm0Hn4kptDcA8K66Zjo9g38C2ULoIKyVi8wy1y7PtPJiASVillWGzx2hbXeIztLGWXLhlDhn9vO4f2Hrn84MwIFTJzOciOlMoUi2PNM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(5023799004)(56012099006)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261021135927099003)(261021123027099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0JKaTdSWlIrNENIcy9YTFc0aFMyNGZzQm9OTk9uWjZmcUIyY1FmU1NpN2tu?=
 =?utf-8?B?TTBpdS9YUHdaRXlmdkpzQTdFTm5kdXQ4RVJIZW9LTExxS1NQeDVBaVUzb1Bm?=
 =?utf-8?B?R0lFSjk2T1B3eGN3WDgzNy9XZ1VqaVFJRFArOGdkR0htZis4c1RrRyt6dys3?=
 =?utf-8?B?NVI2dFFPL1FiK1dpbUlTZE9yTnFObUtxbis3TWFiYzhVcjFRcEppeTZHWXZu?=
 =?utf-8?B?TWJRSG16RUhOMlJUWVFzVkFEaVdMWTh2ZnR0YVhoOFdsSjdDeFZKMmFCQUxw?=
 =?utf-8?B?SXd0UnNpVmpVTG9PM3o5VnZPSHhzUXkweWErOVhrTzBXOEx4N3p6Rm5RbmdF?=
 =?utf-8?B?d0VobThLU0U2V1JJSlVwckFHVTZlUFFPNW8wL0dFb2QzU0FhQmdaK040R3Yy?=
 =?utf-8?B?ZXE3V1JhRERqUEhBZmlEM0xCdDF6NXJoTUV3cGg2R1ROS29vY1AyRkM1bXVH?=
 =?utf-8?B?czYvOVhQODdLQjV5SHNSbWg4dVhrTnM2Z2VKRk1qWDRreVphR21XVEkwaWgx?=
 =?utf-8?B?YzZVMjhxemt4TXhiM251bm9OUTBzSmxWU1Jma3VSak5ldWdyV2FHMjQ2OXUz?=
 =?utf-8?B?ZlVsMW5RaWI5dHBKd2pFVnJDQVVzaWtEa1BSN1piMkRYcU00T2cwZ1h4M3dF?=
 =?utf-8?B?VTNxL0NmZ085eWJGMmFvU0tRaE5CNFA3alc1RWxQNXdtR2kzZTZNeEFpQWtv?=
 =?utf-8?B?SWhFTUFiUW5Kd2NRVXlPMytiT1Y4TS9LbWVGT2NzWWtndXpZNkE2eVJLUSs2?=
 =?utf-8?B?RFozWHdGLzM4WmV2akJMYXFLOTZiQlRiSDN1RWFwY1hPNmlZMzNOTlIrL2pq?=
 =?utf-8?B?SEtQOFpvVW1NZHZkaDJjdVNwb1dBcklTTVYvTGVKeXNwaE5JcXR3NGtyY0Zi?=
 =?utf-8?B?eS9YR0JMK0ZpVEVFVlJDNFVBSzUrb0tnYytyYlNYZXBXQVdmMW1YQ0NuRlhD?=
 =?utf-8?B?K3F6d2pPM0h3bVJ0dU5ZQzhJcXc5RTdEaTFMQzJqdDRub2FQMmlxOWZWYWMw?=
 =?utf-8?B?dW5Mblg4dTY0SlpEdlZxUThaS3dhbkxqaFI3QjlpeS8rek1maHNmZC9vSG1S?=
 =?utf-8?B?QldLRHlFaDFTcWtWS2t1MklZdGdQUGdvZjBZVENlN0puTjFTWU1DRlo4TFdL?=
 =?utf-8?B?ZElPU1diQzY1QnpuTjZVZlZYck4zSHZPZkgwYkIxVjdQcWthSzkzNnZDdE0y?=
 =?utf-8?B?UkhwUm94aE9DSnlVV2FUZlpuM2tPNU5FMWJ2VVlKK3RLZU9JWnl4bWtuTWZI?=
 =?utf-8?B?RHZUMzVTSEVCYThRQUlTVkhCNkVvY0JTUlExT2tQYWNYRWhnTGczaHEvQmNk?=
 =?utf-8?B?Z3VYRlJMYWZHdVEzTUNQaFlocmxmR0lPRERpdjY2ZHF1bWVQOVRFWjI2MVlT?=
 =?utf-8?B?dTNjZHpHVFE0TFZUdVM0dTNteWlGSUhzb24wRjYydzBMRXMvZXFYM3NncFFi?=
 =?utf-8?B?N21sbU5yaE5HOTRGRkoycWorT0dGdVRtdnV2TVdWblI3T0YvTlpvcGRjdDht?=
 =?utf-8?B?dkdCZUJSSWdkQS8vLzhvVlZPeFJhWUV1OTVmb0t2bW8vcDVia3VBMFA2cHhj?=
 =?utf-8?B?VTZsMXptQmdjSDlmYXppVGZKRnZad0JXNzU3NUFpQWFZS244bWVrYkZxSFU0?=
 =?utf-8?B?ZkxqUFVrTlQ1Zmx1QU1hOUxSalpaZXcrSk01dHdJOTFjUTdPSERRZUtaM0Ft?=
 =?utf-8?B?UlNaYUlXZFBxTDNFM3JQRXZUVjUrMFJxMHVtSy9iSUZicm5FaVgrRDQ1N2gz?=
 =?utf-8?B?QWtPZWY1UGFNVG9YQVVJemRzQWwrWStxajJMSmpGTGdvNE5POHBrbnZBamk4?=
 =?utf-8?B?aGM3VDJLNkp3b0RlK3FSOFNIbkNEQW5Vb2l3c1pnM3Z0RVRkQjlBN2xyaExi?=
 =?utf-8?B?OTJnREdjTGNuQWlJbngzQ1BNYWkrMUVyeUZacUYyaG9SemZLUC9GR1RJRHpu?=
 =?utf-8?B?YmtDbXNubUs0VXo0Z3NibndYT0ZpQnN1L1ZocFJpOE9QN0ZhTUtQWVl0R1dB?=
 =?utf-8?B?Y2ZyTzlPZ2ZxNkxhTFVaV3cyT2NXQ2UxdEpqWFF3Z2Z6WXZ3MHJHOFZmbzZn?=
 =?utf-8?B?c2xsYlA4M1JCRTZCWEFoVWhRZVhzZldIQ0w3bGhaaFJjY1RRWis0OEI1d2Ux?=
 =?utf-8?B?WXM3b2ZEMVR1RloyYWR3Wk91aXVDUi9mVDBac29XbEtPb0ZLL2tmOUZMR0pR?=
 =?utf-8?B?aHdwbzNhVTk3cVhoRjdNTEZROS80Zjc5YXl3R0VTYy9LdzlueERNQk05bkZP?=
 =?utf-8?B?MWlFaUs2UUdjaHpwMnhQWXdjeDdRZzMwdFhWRmN5UEYyUWxsdFlUZVVDZDFU?=
 =?utf-8?B?NG1qQ1ZSVUlLWW5pdnYrQllWNEJLVDVsVjBFNms1NnNDc1Q4YkRxZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 59805567-ce4b-4a32-58f9-08df45e47b42
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:26:13.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oF0PFby6rWWznuftONq/0fzv/Io1aOPj857NigwqdCKr8PBICSileNOvUldoCS/LEJLAAKQcP7mhimAlFo/wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6751

On Wed Nov 18, 2026 at 11:44 PM GMT, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> When a function panics, the panic message shows a line inside the
> function, not the caller. Adding #[track_caller] makes the message show
> the caller's location.
>
> Add a sentence to the "# Panics" guideline: a function that may panic
> should also be marked with #[track_caller].

I don't think this is a universal rule. `#[track_caller]` has a code and it
shouldn't be used unless you really care about the caller (or have the pani=
cking
code being always inlined)

Best,
Gary


>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  Documentation/rust/coding-guidelines.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/rust/coding-guidelines.rst b/Documentation/rus=
t/coding-guidelines.rst
> index 3198be3a6d63..c7404ea7ba13 100644
> --- a/Documentation/rust/coding-guidelines.rst
> +++ b/Documentation/rust/coding-guidelines.rst
> @@ -241,6 +241,10 @@ in the kernel:
>  - While not shown here, if a function may panic, the conditions under wh=
ich
>    that happens must be described under a ``# Panics`` section.
> =20
> +  Such a function should also be marked with ``#[track_caller]``, so tha=
t
> +  the panic message shows the location of the caller instead of a line
> +  inside the function.
> +
>    Please note that panicking should be very rare and used only with a go=
od
>    reason. In almost all cases, a fallible approach should be used, typic=
ally
>    returning a ``Result``.
>
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3


