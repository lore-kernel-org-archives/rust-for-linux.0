Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793770829;
	b=3+QiNm1+M1Z68BJA/JyUWoF30XCU24Q51qSWOuKp2Bt+6luJPnvgUUpS/1uIFJvHnnQl
	 WglYYMzXGyyEhG7pgQF2lnngm6ei8ga7Dl30MoAcc8HmQDbWFStV465Mmgu7cLRUwFC+V
	 BXCq7843g5bUkf8hck+RmO4tVDoq8AaFEl5+vindHyzwySUXiJ/uB5jyQMaF9lcjfk02Q
	 ROlG0M1uL0oX946WxduCWYLRnmtI2jbSTmj7HamYCjKJTaZotByEhECyV6zuU3xDaKbF8
	 Vu/skRos9WS4oo2QKDd0P/cYb9X8rT/0lhNvt1KmRLQuIQsgWoPXKJgDwOyRi9NAtrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793770829;
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
	bh=SNBnXxj9iUXIAk8FOW+hQF/yy44iqt9zb7n0OKXzyic=;
	b=D++2ekBH3GBbNMUs8u8ZKo1QPnG5EsblPAq1KsofgbdKHBN7jUOktnJGlBgHJXX9UmJn
	 esl+ceLKRzkSqvwtJgup3GRA6Wb6g7xAQMcHhwmCTUYmVK6G2efOLyXhAYWDLLfUwNRUX
	 c21A4dz6FR1BUWlIfT7rh1ovDXLt2nG9Q/6q8HxQ31RZNTdooWQitn7GCn2sP1EJU5rtn
	 UQ8jvxdmk83PhSga3cS/+1QYBMwglaBF6lq6xwU7qaxriPcDvcN1LTrBIhXZa2ZoUcdK/
	 YDRywZxRv7zy4D6iyD5W5Aep/2s6TLOEYeiwvv0GRR+ENxNVTnDT1FqWP7ozFLLlcDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=Ro8ur+qA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.75
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021075.outbound.protection.outlook.com [52.101.95.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F41D606A31B
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 05:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F41D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=Ro8ur+qA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ff63S7l0lJks5DmhOxs5cNPO+6glis4iHlmJVh5xO3yzRBRHZftd6KBCVQ28yEd5O4elhSCpOqglP/wHhXFpdYffdo4nLiVK31AGzhwvdOPfpfB7V/QSojArDGD5W/B+USrLWSRZvOZYVA2gvr9d4KopSM7vg92Wl9l6af2WCxMFRwZJiIvCl37FJuiDfFG+QXKpUsswgHoeI7q2GEzZe9jlXXrosxKY5GC1ZhW5HfuLfw6YXfLTRlL7LwUrb+iGlv38+OqvYh0xVzLCh8xrmEdlUl2vs8c/G21iQBXxmlFdzxXl3oVa+M8Nq6HKa84Jv9gH8dX6bIFxkwWezMHHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNBnXxj9iUXIAk8FOW+hQF/yy44iqt9zb7n0OKXzyic=;
 b=BLbQshUuGNMZ5P8KGiod3c+JgGTvHT4rKHqMeOjO5a3qUkt1iuvHWfLGmgGEB2Q3tK3QC63MkvJ5/hS+BRI+Wa2iN6P5uYXv4MGiNpTwTUEPnHOaFv0+Uw9mcMyszw9ZIPs3Ozhh9kRINKeF08r6Qhmc2pSm6DJFo81PWn8mKE0Yv2Lta5Yj2zIu20R8eKztRRf+W5ZEMg9LBk2pMg+yp5YD9aG/uiQLoWvAx5fgfzSSq/E8DPvEAI7Ikec9m9rzaA8nT/sRgLulvovyq6mbufNIj3unME2/ljWYk27IbJbmkbIghguH64KKsDQ/aqLlDD3ZKiuBvlhMaUdfMBYepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNBnXxj9iUXIAk8FOW+hQF/yy44iqt9zb7n0OKXzyic=;
 b=Ro8ur+qAu9DdD0wkJFBdrMfgj/5U+sOY8leYuiGy1zUdmu6BN7qbfpSRpXe0/jZ1bDf4H8WEOXmxYritFHyM41wEv4B7+ugs7Cs+oZOh0e8WQrzmnaDH13p9o3ddDgyBj1UdgVL9rK+E3k6enykSbxgY4kxXdDUSKDzQ4+qgou4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CWLP265MB2692.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 05:40:25 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 05:40:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 13:40:11 +0800
Message-Id: <DMM6OMQRS6UY.17O4X89AIPCS7@garyguo.net>
Subject: Re: [PATCH v4] rust: compiler_builtins: Fix silent trap in
 prohibited intrinsics
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "FUJITA Tomonori"
 <tomo@flapping.org>, <gary@garyguo.net>
Cc: <ojeda@kernel.org>, <a.hindborg@kernel.org>, <acourbot@nvidia.com>,
 <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <daniel.almeida@collabora.com>, <lossin@kernel.org>,
 <tamird@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261009224626.1331914-1-tomo@flapping.org>
 <CANiq72nxjrWpBjwzgdWncKECKwzj6zfjS3XC=da62xr8wiSxEQ@mail.gmail.com>
In-Reply-To: <CANiq72nxjrWpBjwzgdWncKECKwzj6zfjS3XC=da62xr8wiSxEQ@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0134.apcprd02.prod.outlook.com
 (2603:1096:4:188::14) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CWLP265MB2692:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b21da8b-b7f0-4f39-d9b7-08df3a361feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|10070799003|1800799024|10067099003|22082099003|18002099003|56012099006|4143699003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	tJSA+YFJ3llrsUgihlSIfw7V1svRnhXT1idEm3ervSWmpiLgWQnrGktetZWlujIOfafMrJI7sO6p3w6oLyw/3GqVCwl7FOZEKQ73UNEeEzNSUUUs56hlr01QtWGzgp+lHwW3bHPwkkP8eI33w6AK8TIHruADH43Y6qy+DscxKVLOHMu/mF6Oj6zMoU7fNhuz51iz19Af6iNXsiP4yjOoP8RtJjOptz/P40M1RNRYPwk8erBfJ6ouivZro2xwe+MZez42900K+avaZ/88WBg5WiHxVJzgGz2Mc4yCTjtlhOK8AibVTy3KaEmeV7/C62KbWucGMHAAm2f3pnFXdXoke1WYXx2zI0G93jIOn80PpTItP6CMmWm6ixwFPoqm7JiRXIhI2w5vmSHIudTG/yAZ+9V1aiDpMF6hwa5vh2yByawLwNkTQOhNtI0O5N7EJY+ogf7kUkQiJG1EgKlaH0ipYIEgq9llLKZMrd49Lhi3CZoYNDdtbostiJd4I8AKWE41RB9kbPZa0YGyx49V19ahQorpTjnPUWT5v37oajPOMoDJ2ClQK5sBpo0epvVi+Aeqa41JxcMZ55yqlwogj2QvD+bgpiQF36adUL/xynYR3oxlY3+VwqRa8jhzHSMoARTqc+7Nu4JUrCtgL8C4qNC/kFAJK9zSkWITj74ZzJBtWXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(10070799003)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFZlbVdpSW5SbzAwS2kwUnl5OEZrVWRoR0pvcFRSbis5MFptSXdENTJtTnlm?=
 =?utf-8?B?UkR0bGhjWG1EaURQejVwa2cyZ2VHUU0wQ0xSMGFkd25weTBiaUNOVUZwWHpY?=
 =?utf-8?B?QmU2YnF5cDZvYVNka2VucUZkdjU2UjF0OFByTlhUNTJWNEFvTmNVTmFPQ0NU?=
 =?utf-8?B?Y083R1Z2dktLY3VXbmEyYVN3MCtqNzdzbkZWREFiM1ZVSVdFWkRFVktmbWVV?=
 =?utf-8?B?VkdtTjEvbHhVSkhKa0d1bERZdTdnZHdhSm43QTcvOW1QWkpVQjYzQ0pxVXJN?=
 =?utf-8?B?dTM4V1VXekEyOTBMTzl1RTgrbUtsdjNiMW11NVErSndRV0FYVDJHb3pacEpy?=
 =?utf-8?B?YjgxQ3QxVjJFREZoQkgvRGFlTllpTzZVV2tEVit5RzNsbUZ0V2d3SmdvbHRl?=
 =?utf-8?B?WVV0blVFbUdncVdRZVdlcTFhNU1KeVlVLzNVd0REUzg2cytGVGoxOEN5ZmVG?=
 =?utf-8?B?bHdZMDFnVXc1clR4eE9NUWxqdkFFMXF5cUlKZnB3NjRtdEdqdGgvUXNrd0Jn?=
 =?utf-8?B?Q3p6NXo1TVVNeHd5UjVQVHpaZWcxUDEvZmFEVUdoZFVHQVZ4RU81SXZtV0hv?=
 =?utf-8?B?UEE3VlQ2cjduWENuSDc3RGQ1V2tteU1HaTRYT2Jlek1wQnQ4Zm1lWS9FeDJT?=
 =?utf-8?B?Nm41Skd1a1hBczNaUk16SDh3Ti96SzJHRXB2eHlnNDZOamx1UmtrTyt4ZUly?=
 =?utf-8?B?TU5WUHd6VGwySFpKK2FnMGpvZzk5dHRCNldWblZBM1RkdjBaUkJ1cEt1VjRC?=
 =?utf-8?B?OTM0azFUbW4yNjJRVk9NQkdLRkxvWGRZWWdMRDVRcmhtQTJRZ2NQZ1VqSHdL?=
 =?utf-8?B?TUxmcDgzMENDaGVNZ2pENTFhWkRHbGRIRmhLZGRUL1JCZ3U0KzdGTjhYcnZ2?=
 =?utf-8?B?RlQxaTdZWDRaZVU3S1VyN0V4RGpNU05Oa3d1eUhqYW9WbE96UUYzVVZWRjdW?=
 =?utf-8?B?cURYaHNxRWxxT0xYUldNeXlOVDdHelZXeEZWVzloaWxreWJkTTVYa0JDYkZF?=
 =?utf-8?B?bkM2dkg4R2MrSzlEK3Nnd3VYZ050TXFicjV0T0VlN0NZWk54SjBxbnZTVkRS?=
 =?utf-8?B?bDFud1Z2MFhRUHhVeW5BN2FUZHdISkZjQ0JLZFFwYXdBY3J0UWFPYW1uL0E5?=
 =?utf-8?B?azhibWtwTm1SMnE3UWpBNzVDYUJZLzR4L1MxbHpPZnYrVXpvNEJUeTdRVjli?=
 =?utf-8?B?RUF3VmhoQkNXNHFOUWJVdW9RdFNLUUw3alJMcUdnYXY3VkF3YktDdnhqa0xX?=
 =?utf-8?B?b2IxT3NiYklYU2JkK0JBb3J2Rm5COUcwM0dQeUVYWXE1WG8yOXdVR0hoaC9W?=
 =?utf-8?B?YjNhK0F6c3dxUXhGa3ZPTk0wS1gzVkZUc0VWQmF5aVp3dTA5MmtacFdVc2ZD?=
 =?utf-8?B?Rzg0UXJnNWJ4dzR4MUttMjdpTytYdDF1eDk2WlBhaXVnemg2SVNwelBXSFJX?=
 =?utf-8?B?MGZrSzgxMW9jVE9oRm5Mam9QVFBqM3JsUHpuNUdsd21nWGJoWTFKbjVCeGNI?=
 =?utf-8?B?Uzhpa2FJSkFpWFRIOThDOUQxUjVjeUdOU1RoV0x3YlBmcW1sNGlDL05UcWJH?=
 =?utf-8?B?TC9pQXRESmpTVlVaSkYzM2w3T283UkhOMHJqWnVJaWdIcjBzQ2w5K1pUY2Q4?=
 =?utf-8?B?TUJJUEV6V013TC9Jd1dNWVJWL2VjdWFsU1pnVFg5U3B2RGhGdTUvRHh2YlBv?=
 =?utf-8?B?K0Z6TUN0SE1sM2owY3JqakN4YW5RZUdYdnF0cTY2SmZ6cEJOWU4wR3RGb0ZO?=
 =?utf-8?B?UGhkSXZrWlIwT25yRFJtWXd6S3ZQb0FjZThjb0RuNEdxbWJETkJJTXEvZHlH?=
 =?utf-8?B?bGkwdXV6eTdBR0F3U29uNk5yam9GaitSK041NG40RVZWWjJEK3hlS1Jxa1Fj?=
 =?utf-8?B?TXFDblQ3MUY3WVUwRTZoZUNKS2hFbzJRUzh1YUpVZ3d2aHhKZWtqNWVIanpy?=
 =?utf-8?B?VHZWZE44dUhGZm14Y0xxZ0djeDNrQ0F2azdIQ1VUSGxqWjBTb2cxaWFGQmhp?=
 =?utf-8?B?YjYxS2VHQnMvc1NPYmZPZk16WDRzamZ0ZGRLRXdFRUtVVDZwWUI4czVFemhE?=
 =?utf-8?B?dUpFS24wb2U5YUFUUFhkOXV4RDVXN0huNXZjNm9GbXZnNkV3Mjc3TXYvQnIv?=
 =?utf-8?B?bFAremFaUlcvR1BvQ3RoSGU0NExzbkZITlowdG1WRkM5OGhtTm03ZVJNQTZm?=
 =?utf-8?B?QStYeEdaQ0hua01QT1BOS1F6aDE0eGhOQ0ZIZW4zTU54S0l2NU1hTzNSRjI4?=
 =?utf-8?B?WmhTVmlBQ3FMcTJpZUtFeVlCYllYSkpqT1J3Qi9ndGtCYUlKcFhQV1dVWDFT?=
 =?utf-8?B?Uk9vMzRZR2MxeTVUekV4SnlSVWI1Skd5dXA4WEd5ajd6QlNhbVB1Q0VFWTYr?=
 =?utf-8?Q?IMppyS2TJ+TN9yMya/VHG3M+wzF1+//VUjruS?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b21da8b-b7f0-4f39-d9b7-08df3a361feb
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 05:40:24.9621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8m4LDZG+wxUDLqm6UMko1Qc9AMHVHy2maunWqvXD1MqiDMveXTGB6p0yQausMlVVNqW9LAR0RvdwdUKvq1THQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2692

On Tue Nov 3, 2026 at 6:54 PM CST, Miguel Ojeda wrote:
> On Sat, Oct 10, 2026 at 12:46=E2=80=AFAM FUJITA Tomonori <tomo@flapping.o=
rg> wrote:
>>
>> +$(obj)/kernel.o: private rustc_objcopy =3D -w -W '__rust__*'
>
> Hmm... I am a bit worried about doing this here, in `kernel`, because
> it is a big crate with many other things around. The pattern shouldn't
> match something else, though.
>
> By the way, since this is here (in `kernel`), do we need then the
> original one in `compiler_builtins`?
>
> Actually, taking a look at that, I don't think we needed it (for the
> original reason, at least) after commit
>
>   cb7d9defdafb ("rust: compiler_builtins: make stubs non-global")
>
> Gary: did you keep it for another reason? I asked an LLM, and
> apparently the only reason it can think of is about an unrelated
> side-effect: `objtool` assumes weak symbols return, so if we were to
> remove it, we would get warnings in IBT/LTO builds because then it can
> see how `core` uses them doesn't make sense if they are `noreturn`.

It took me a while to understand what "it" means here, I assume you mean

    $(obj)/compiler_builtins.o: private rustc_objcopy =3D -w -W '__*'

I don't think that's needed anymore. I probably just didn't think of removi=
ng
that line when making the change.

Best,
Gary

