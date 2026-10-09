Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021143.outbound.protection.outlook.com [52.101.95.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206F335C68E
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 22:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584144; cv=fail; b=pHijG7g/ab1PhrL+/xBLfFJ/5Q9VO+fENfSIaXi+p1B3p06SQn1yveE4hElfOyKxhdV3Da6As/WXi9qkqgd2yKJ8h3cdChpH5w8FTc3oRW5NuEsD+Q+X160kVOnl3Ou898yl5hXcwiV1/YBHRrDLgEKOv8Svp2eCFdEE+RWQS50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584144; c=relaxed/simple;
	bh=BvSzTwbvKIjaIYd7wGxQR5++GwCTyZtA0Lb8F1Vj8us=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=icohqGxTAbjlsyDPdUcFblini3GEGJUYxExXkR14GD19n8nc9oEqHLxH7AVKHxBrefR71W982mrItKiQGkHwsz1RX38k7hqF3FOVR4/UNa2uyxpn3qs+Fqwu3sy+ixJkRrYKWKRHPIGw1jwA4zdysQ0HpWOxGk5zRPzvFk/WoOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Yy2k2h/7; arc=fail smtp.client-ip=52.101.95.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Yy2k2h/7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SY33HBku4stXedodFIdQcqdyUr00TnY4hKqSJKkGyUG7Ck33vxnxwFq3RWDGTbRqUGPa/zb7xrdHHP5enV85lstxs+IWLeqDu3+ynaXq+zoDP/cqsnWFsGgtWGpVORGCqicyLZxOkhsYezv/6G2FFx51/us0BiBJxhd+GfUeg8yyv/CCuuJdNQujaPB3GYiSFad/HMFOIU1Y2FRuXOdPPjLMikiiLVGcFsGCGcJ23xb+bkgINqD0x3ZVWw9bvn1uj36zPbT+XmWHdSARapcLv3YKnS3+0urkHoM3osupspYkQj2IO1FiyTzJ3LcEuUNo9qj7jNwQQA9BfldBYy4n7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlaPNqOFiY/SV/fQJa8Td8L7S+3Vm7RUWUQ5hLsE/JI=;
 b=CmXSnoOOjrWNobdZ0HXho9HFWJ1gyvyej8k/OXPTP8kc+EgIUUGHk9T4x+EDlqh8eD4QPa/Sj53Qtcw8uONePQyDyAobQA5WONzDX6mLJqBiTPJO1gt9LBs9r+7abXW3Jb2RmpsPIyPbjVrNGP3k2fDKbNuznjrjAqWtAenq0pu+hvwhkCJrvTtUbz50CgY5A3ao6O9JjLSvsWjXZIWC2flbEr9bgcsGwqTkhz0ja0AKo7yWCDKOZg4gGInWPAbhTkAe3SWJ+lan3CTv3OiXjYTF5UvqdJjoh8I7WsCMTH/UiIjdRreUoOeQNFgXk+Iwd3P9wOI66AeZqgTMPfz1iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlaPNqOFiY/SV/fQJa8Td8L7S+3Vm7RUWUQ5hLsE/JI=;
 b=Yy2k2h/70W2PQ4NIR0QKQ+F7W3moDUzsH3IN+Dp7ARWmfYqnPIHSKEr1q62OZppNr//E+xrsmR+lN6ockQVfuG6NzYVu8ZqkTtd06kuR2tC51glGzwkxa+FEIPd7F9aQRcZcErbjupzYgn1J0JtsJjmIkUYdX+A9k5dIDexB9qs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB3115.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Fri, 9 Oct
 2026 22:15:39 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 22:15:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 23:15:37 +0100
Message-Id: <DM0NKMDE2IVW.18JVM92P0V6D7@garyguo.net>
Cc: <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <tamird@kernel.org>, <acourbot@nvidia.com>,
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>, <ardalan@uci.edu>,
 <zhiyunq@cs.ucr.edu>, <dzueck@uci.edu>, <ojeda@kernel.org>
Subject: Re: [PATCH 0/1] rust: configfs: Fix reference creation from
 uninitialized data in `Attribute::show`
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Priya Bala Govindasamy" <pgovind2@uci.edu>, "Breno
 Leitao" <leitao@debian.org>
X-Mailer: aerc 0.22.0
References: <cUqSvTsTaMYu_TRrAABCYTNz0HZf5JeFdIq_Vv4e_-GFMgI5NwVfZJDcy8CTgc4fH_1OoiiMg2I2LIzQX1y3Rg==@protonmail.internalid> <cover.1790981219.git.pgovind2@uci.edu> <87v77bcg0m.fsf@kernel.org> <87se2fca48.fsf@kernel.org> <3RuaIprV4H3e3FnKKFRDbFLoX28Pw2JicqOEgLLCMKEKZgl1LnWvQ6lYh-fgzYC2fgCEnRLhsmFWgq9opqQNEg==@protonmail.internalid> <DM0BMX11TPKW.3SXBKY2XRLHQJ@garyguo.net> <87mrsmd37t.fsf@kernel.org>
In-Reply-To: <87mrsmd37t.fsf@kernel.org>
X-ClientProxiedBy: LO4P123CA0268.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::21) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB3115:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c76e0e7-4aec-4991-413a-08df2652d9d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|56012099006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	tVPA1N770lixLax4OQ68TVfQ6WNkg3Wic4m3a6x4tFirfN5sR2USOvK5zgqixT1aF/7UfLRYr8Crqt3WtGlGksSjIQM+9HnpPBxLMRFdOXMl8Uah2ydxAfmpBzLbUHPlOCLZfegiiFZ4hljvmDTNNCYJmZ1qoD4vjVJuFsHA8wPSOTaHpyUJKbU1VysYic/fZGpLCPyuoXqYy/6AfUydnISioleKQCo3lc28ovyC780mvHzmtqsLFK2i+5AOppei18Bfanl7ULQXSF3oc6BRHuZtfC1xY721PZ/RSKbwDl5x1D/apYX9+wmN2qrwfG3hDBkdL2cP80Vm47OSOz6aW8elWWHLANg5pFgV95Fb4BY3qz5MvFceKLIh393bffvDvEMD/kP210VXsydtCcE9p9/OQcB90P65dRhbfO4fKZ07JcXb7x+UFa5XLFEroAy81UdgQTlsCXOdLbUfmBLZ5FqxVS79cv1rSYQZV938T+5Gqlphp0nvmBIPx63G0abFDQn08llLsXUuj5zvMHRSShGYooUUMCPnP1b/q8VkykRqRdebJ+Etqp3lthTgbo5kW96UPzU9ekhE86FOiSDFpgjAr63d9gOZpnnntppsRDtfoNfj23kgUG3loC9Yk7H4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1NZdmhWNW1MNFgwc20yOEM4UzUrUGNiOTd0TEo5eGgzYVNzblY4dVBXSHpG?=
 =?utf-8?B?Vi94emw2SkZsdUtCRGhBMWRlVjY5eXhSL2J0L3p0cVJ6RkF1by9GTjlrc2xM?=
 =?utf-8?B?TUtsTFJQbjlmUXptMkZEcGdsbXBQMWdQMjNETnJ1QzlIU0UyMHI2K2U0VG1h?=
 =?utf-8?B?RVhjak9xaENTaWdIYW92MjVOdEpsVFp4cElEc1FoR3ZZdnhOdksrMHg1R2h0?=
 =?utf-8?B?N3RzdWN1VFMzSjZrSXVBNXVOUVA4d21rcWZoSXZxTitIT2h6SU1wTWcvMjBY?=
 =?utf-8?B?cjl2MzV3bzh6T21RcElKYXVqOVRxcDFGSHZIVHZwc2hHY212SXdieWNqU0lj?=
 =?utf-8?B?QXJpVENrUCs1QkNKUUc4ZUJJTU1FNWgxRDhJbXpxQTBMT1RKdE5pazdTbldF?=
 =?utf-8?B?Ly9SY21CV05DSHpKS1hadlp1ZjBNVzhlRTQzZTdCTDlGSFhQZnpDeDBuWGk4?=
 =?utf-8?B?ajgyNFkrKy9WS1gxRGU3NHEyYTNqVnhTNkJ1N3Zwa1ZBSExSekF3OEJlMGZ2?=
 =?utf-8?B?SDVIMHVKTSthMVhYN2t5ZHlLT2pTaVllRW1SR3ZMWEZJSjRpQ01TNXF3SVdY?=
 =?utf-8?B?STJyUWxmVHRMS2lWbkJNR3NIMUxHNXAwU1BBUDhiUlJydHgyMy8rWDlUbFdD?=
 =?utf-8?B?R2hySzdOWDNaRWt1QzF0ajJVaThoRGRCMXo5bjlsb3JhMlJRbnV6Sk5nNVRE?=
 =?utf-8?B?WmlyVXl2QTBhWXhwdENFdFB3ZENyUHh0Q0M0ZW4yZGlJZDkyRkc0QlA5aDQ5?=
 =?utf-8?B?UkQvczgwbFlhYXp0allmdjlHUHVtbFJodkVzQlBkdThBUFVJUFJuZ3hkUDAz?=
 =?utf-8?B?ZTlKU3YydGVvK3kraEpRSmMxYU1Hc1BXNlNEcHVnTFRhS2hEaUdVK3dsbm1z?=
 =?utf-8?B?RG9IaE5aS2FUeks4NGRSdk1oNFc4T2FHeWJ5N245d0RWdFAySXVjcDlFTTB6?=
 =?utf-8?B?YkwyMUoyNS9GTmt2aExSVmZmalQxM3JITEo2ZHFxV25OZkp1bWpCRUhvak12?=
 =?utf-8?B?eXlQWVk4K3lsTlFkaHN4RjNkc2FWMWd0WjkxZ0JGNDYwVEtrZmVFbkY5ck03?=
 =?utf-8?B?M3lsRjBOSXh6czFLMHR0Qis4K25xZmJScHZzc1gvK2pnRmRqOU5NVlNqMmRP?=
 =?utf-8?B?ZjV2ajFVaGJPZUxieGZ4S2ZsZGEycHMxMzlXbTd0VWEvSkRvdGNMZ1FFUnVa?=
 =?utf-8?B?Y0RlSVlqc0hHVmZ4cmNkK1d1TzlvangxbnI5TjRLZ21lcm1aNGJmQUkzY2Fy?=
 =?utf-8?B?U3lHL3JuWEVqOGZkMzNvNFRhSEUrbUxKb3lBN012WUptSE1DbmlIMGxWWjNr?=
 =?utf-8?B?SWxrbHF0RWp1NEgwZ1J3eHFjaDJyY3FzMXExZDg1UGxXbStGNHIyNWlKWWo3?=
 =?utf-8?B?RGV3YXNwVkRybWM0VkdsTWx6SkQ3dEhxRldYUEFXM1Zta2J2Witsc2U0Q1BW?=
 =?utf-8?B?SDlNdllvVzFWa3JwSitYZFpRTkdIcXJuZ1hzdEVBYVFVZzNaRnM0TlF6N2Vk?=
 =?utf-8?B?a3phcXpyUkVSWG5JaE1wbEU4Z2JoQWw1OEEySVFqTFdyYzdCLzU0Ny8xNExK?=
 =?utf-8?B?V25EUzVNZ2FycmdkZExWZW9kVWpMMUpOMjVUbmJwbVlzb0ZGZGl0aTN1dUly?=
 =?utf-8?B?NnY1U2FQS0M5OFBRY2lsQXVkc3BXZTY5L2g4SDQ2Z3FnM1ZJcDV1Vjd6Umtr?=
 =?utf-8?B?bEZJYXNOK2d4WTR3Q21oRDRzUi9BOFlEVFd4a1R4K0YxMHYxWVFWd0ViMFBJ?=
 =?utf-8?B?cWdVSGMzV1hMVGJWbUMrUnFRUjhKRUlyOHBobXhURUZKUmZETnhGOHU4N1Js?=
 =?utf-8?B?Y1NrN1I0NGRqd0lGSUdOdnVEVGd0cTI5RjhaME1majA4NXBiOFdoa010SEZu?=
 =?utf-8?B?b2d6MkxtbzZaR3c5d2lFT3hNMjF0R1pUcmJTZTJZWld4NjJQa3YrZHkwNVJx?=
 =?utf-8?B?cno4TEFsZXBZbENLQ3pFd1pENEtrS3drYUZ5cnNsOUdjQU1DVit2Ny9aUUR4?=
 =?utf-8?B?bHMySTV6cXlpQldobGlwL2dGYzZFZ0RJZ1JwYktjdTFIZCtDM1lSbDcwQ2Fa?=
 =?utf-8?B?RW10MFBsVncwcTdTcE85U00yR1BpR0dBN1pnZEtKZWZQUEt4c01oeWdhT3RY?=
 =?utf-8?B?Y1dqRVJmTkM1MlVQb0JLQlFZOUYvY0ZrMjdYWjFjYzN0RFRHOUNJWllKVldE?=
 =?utf-8?B?U1ljZDFEYXJjNDA0bFo2dzBQZHJMRW9SSVJOT20wcEk2MSt6OGdxNFBObXNt?=
 =?utf-8?B?ZWRSYmJVNzd2MDZCdzA4b2hBV2Zaakx5bHppQVlNaUxVTWI4R245eGw3RXc1?=
 =?utf-8?Q?9Uk/eUwxHk284iZ8fE?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c76e0e7-4aec-4991-413a-08df2652d9d5
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 22:15:39.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjJkJuNPYFFZJTbKi3D9SJqIsNDBB08WFJ3lPnlucSvdCFCdSIqo9neKfDXIax0qTLbaLv6MIeGjTZvN1CsAJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3115

On Fri Oct 9, 2026 at 9:32 PM BST, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Fri Oct 9, 2026 at 1:49 PM BST, Andreas Hindborg wrote:
>>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>>>
>>> Actually there may be a problem, but I think it may be in C configfs. I=
f
>>> you take a look at the function that reads data from the iov_iter:
>>>
>>>   static int fill_write_buffer(struct configfs_buffer *buffer,
>>>             struct iov_iter *from)
>>>   {
>>>     int copied;
>>>
>>>     if (!buffer->page)
>>>       buffer->page =3D kmalloc(PAGE_SIZE, GFP_KERNEL); // <- HERE
>>>     if (!buffer->page)
>>>       return -ENOMEM;
>>>
>>>     copied =3D copy_from_iter(buffer->page, SIMPLE_ATTR_SIZE - 1, from)=
;
>>>     buffer->needs_read_fill =3D 1;
>>>     /* if buf is assumed to contain a string, terminate it by \0,
>>>     * so e.g. sscanf() can scan the string easily */
>>>     buffer->page[copied] =3D 0;
>>>     return copied ? : -EFAULT;
>>>   }
>>>
>>> This function does not zero the page that is written into. This,
>>> combined with the buffer being per file handle means that you can read
>>> the original data in the page. The `kmalloc` should be probably be
>>> replaced with a `kzalloc`. This should be a problem for C modules as
>>> well.
>>
>> Why is this an issue? The extra uninitialized bytes should not be used.
>
> I guess you are right. In C, a driver just promise to not read beyond
> the write count. At any rate, it is a cheap defensive mechanism to
> kzalloc this buffer. It would prevent leaking uninitialized data to user
> space under a wrong length returned by the `show` implementation after a
> `store` operation.
>
> In rust it is an issue because the *driver* _may_ read the uninitialized
> bytes.

Well, the driver shouldn't read the bytes at all. It is supposed to *write*=
 to
the slice. We probably want something like
https://docs.rs/tokio/latest/tokio/io/struct.ReadBuf.html=20
instead of a raw slice.

(Also, the name "page" for variable name is a bad one, it leaks the
implementation detail of configfs. This is just a buffer to avoid having dr=
ivers
dealing with iov itself.)

>
> So we can fix it on the Rust side with this patch from Priya. Or we can
> initialize the buffer on allocation in C.

Not really, we can just "declare" all bytes allocated by kmalloc is initial=
ized,
but to unpredictable values.

>
> For the record, I did not notice that the buffer is per file open, which
> is why the bug is here in the first place.
>
> @Breno, should we zero this buffer on initialization on the C side, or
> do we just zero the buffer before calling into Rust driver code?

Of course, leaking any bytes to userspace is bad because this is kernel mem=
ory.
So one can argue that zeroing it would be a good hardening measure.

Best,
Gary

