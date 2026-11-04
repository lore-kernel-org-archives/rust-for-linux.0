Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793770965;
	b=NisTzcIsdEYzElbM8Oox74vqt9JewTtnNAKGgZ6MyeqWdLT94/voVXA7VS5nAW/VHZPA
	 APOvyAAIKvdILTDL/8++fiqG/8m5BxHt2QEx7NjG6pwE0KK8Z0PPqnLkkv18Zb0tqAAle
	 x5MKnS4OUTocFda5qXmMnCsCuGMaNWySegLxUYVMXU3d2ZRuNQfA1wY07Roc2fGahidtA
	 bdWRHdVGJmp7SFvyBBETmvX6C94xnY2q5qiic3H5h1HFnLnX45yI0sRIhu5kQ1zuXB+3x
	 q10/ZY0f674kB27apcVMufpLJVzVrjbeyzxWt8YTViFR1YwNlJl4rpeL7llrYq1E7Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793770965;
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
	bh=EtOxh92NSSincPhXFuP8cm+u3A+aFpwCKJ+SGInFouY=;
	b=mjnBAwL0YqiwHpJG7uC7G/tOPGIKqlx1S6pndgrFkAumtGJZ0BHJyNXusl5kcihfcbxP
	 mgNAESEZUGei6XWBj23Mg/UYq+c5jrtUtx2hL6wZoSuTrZuB7Ixy+S43GMd02AskCJ4cB
	 Xv8JUGAQjcW5yWaVP79sGcvfM60s7OFKw40i/gVZVyyXdXjC2tv/bukKFrPveZKD1JJF5
	 dJN1X1T++aWi99luD+Zg1xJIScJa0c5WcYZ8xwWsE31FAkhg6NZjhWxR47xSLrzOFlsjj
	 BVuj2hOaAI1J4zwd0B2ENZk31X/tB7z0mo2DLHIJB2JO3uWnkvmOWJpyG3Y71JFnLZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=DGF+twVu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.129
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020129.outbound.protection.outlook.com [52.101.195.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DAF606A31B
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 05:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96DAF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=DGF+twVu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwZTkVbBG3Y3vHqFmkO6UpxxUYh96ZNK47wP+woYgNbCaZCx/uVq8X/8A8ufZyYV9Mb1YL12sX0xk2sbG9keZzcKIg4gSZmtLxTsbn+aLMe3QeAWfVhj0RPvCRs3Q3s9uruy3C20vByILMOeL4nthvcGqChz4TMbYem7o6yEKn3ZLhRxgolGl/coJ1wXaSbqcP5zaoekaRUrM2BqwxejRu/YT4YbGZTpa4WO0m+KHlW90GJhOMR3QNmFcdWwJ+5Lw/DwDXdEQ7okzgnce0F7nq9oTeGq8CfBhsBmFvO3vgudd14YafqxV0mu5BwMq91juPv+7rsl0AlLW+DBj0hTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtOxh92NSSincPhXFuP8cm+u3A+aFpwCKJ+SGInFouY=;
 b=KQsMLQBOzKTJo69X7gskll3bO+76s3IEuD4n84vr+xET/4JNS8RSmjgfYU7iYq2orRPU7lRw8pg0y83soxr1uwsVgQ7eywoGxHhv9sFmXvI25FcRQJGOdHcPJxlKQgdr1q/8tWw4j5fPzcIGaEEh7bt45pHdHAjhb0Y7b+MKbmoIXQHznogxmFwMscM+nWYCthxVtOm+zOA4jvQACWJOVGU7Gylb3jMy2Gr5jTMifYGLsGD2X3GCzjE2h7Eb+ZWMDDCciAPNYJWCBIX7e891he8pPIQDtSxAKVZVjlESOIVWNuJF/k0CPngQt0xitYzzVeiHCbNy0rHpBZZMRbF57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtOxh92NSSincPhXFuP8cm+u3A+aFpwCKJ+SGInFouY=;
 b=DGF+twVuzBHKWEOnYo4gHrhy8t023mQlXPIf1mVOmomoFpPnef8IPmjb1McXK9vlcRZtFox+kQ37rZkqaDeFNqfnK3iHtwDhhD9FWBnI7X38P/Wz876ZNk0nh+n77wgsyirgA6z/PbicKuZ2Q2hhkeSWUSs+OsuZPWKPED8LGqQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CWLP265MB2692.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 05:42:42 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 05:42:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 13:42:27 +0800
Message-Id: <DMM6QD2BUR9V.37KO0N2MXG64L@garyguo.net>
Cc: <gary@garyguo.net>, <ojeda@kernel.org>, <a.hindborg@kernel.org>,
 <acourbot@nvidia.com>, <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>,
 <boqun@kernel.org>, <dakr@kernel.org>, <daniel.almeida@collabora.com>,
 <lossin@kernel.org>, <tamird@kernel.org>, <tmgross@umich.edu>,
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>,
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v4] rust: compiler_builtins: Fix silent trap in
 prohibited intrinsics
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261009224626.1331914-1-tomo@flapping.org>
 <CANiq72nxjrWpBjwzgdWncKECKwzj6zfjS3XC=da62xr8wiSxEQ@mail.gmail.com>
 <20261104.075702.612319673416199209.tomo@flapping.org>
In-Reply-To: <20261104.075702.612319673416199209.tomo@flapping.org>
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
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
X-MS-Office365-Filtering-Correlation-Id: dbe42345-0451-4562-7b94-08df3a3671d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|10070799003|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|4143699003|261022105027099003|261102123227099003|261102130727099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	X2qbdTLtPOnJXAEFsebUOdlaHRUCko70IgPkb/jtdb/KV/yyrxFcBtDF52nhbh10bEQKp+KVcWow70V5RmxLLIgSyTI0DcqvZ/6rUj4h3cyumh2/xXETNl310y1o5SyPA4ul70jxvozka9bYrhK9sNoBCumJTjOTXwynSovOC+XVALhnWGts93pRFV3QrhMP+sHffgfj8ymHjT8ZrlTc/Er+4Qsilf9YONJT5SzzWS03/ULPu/CBsZZTdwIwEd33j8RUEUumWJ7YIKsjItoZwQ05pl2dGqO7NlYbMNkJMhHke4E3gc3ZZ6FWC5pasZ8DHm3FuDBOU8Kx3uL2uII+wICITPk0tf2Qz9Faq7ayhShdECpk3yXnIzwS9cNFteQz4nwuHlqpT7ENVjzloQZJgtcy0YF5tY7p0ez1k9/S/mXgNZ1Sl1Rg79WQ5HQHYMk0cKXZyZhMx/QaBMTDyF+S3zF8OPkP2MhtBrEJx94GaYv+8LJlWuWd3YvgLqj4BqUUjQta8ZY3pQIyQMUOgI4Xo6x9wq5WEpsRQbxQmGvpAECfKdldLKMX8DonbiE6o0GOPZGtOl6WH7R2ElafvmxqKwvcMd6EuEdURfbSdjVgdDXcU5rPXIXDbyd2UF8RxuSz6DUEqRN7BYDtUKqXssZ7BZ4s4MkZbq7+3PQjlCHBRBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(10070799003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(261022105027099003)(261102123227099003)(261102130727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTFUMVVhV1c1VVpvbE5keWxVN2s3U2tSVUZpTDJnaC9rS3Q2Q0gwcThkQ1ZB?=
 =?utf-8?B?L1cwQVNWc3EvWUpzYUs2WXRzUHNnczd5d1c4SHZmYXQvd01vVDdsQUx1TjN6?=
 =?utf-8?B?OWx0SnlYL2lyVDEwL1VXZFBwK2Vpa25DUjcvYlRFa2xkYnE4UFdNV0l5dm84?=
 =?utf-8?B?M1pBeGlYUVJ3MWxxeTEwSzhaSkczTzNBNVc0V21lSTYydnRPaU1lblVuWkRR?=
 =?utf-8?B?VlJjMlkzcW5ydzJJK0xTL1daUjVGcFl6YWgxQ3Y0bTVkalcxdE1tRldlalJW?=
 =?utf-8?B?VEYxa1dPSG03blJwZndoN0daQ0xIQXYvQ1VyRHFsTk1QK0ZoeE45Y2VZVFlE?=
 =?utf-8?B?eHFEd2lkL2JNZTdWN1hmSEwrM1RuQVFCdzcxK3R4VlhLd3hVckwvMkFtU2xm?=
 =?utf-8?B?N1JnTlZxbHVLREowWDZSSlJKNkJHMXlSeFlBYlRua2FIWVprd3ZwZXhRbmVZ?=
 =?utf-8?B?Z2M1blJvVXFGM1dIZ0UxQVg0bDdJSVdQR1VUL3NlV1Z4RlF1MmtFMFJtcWpC?=
 =?utf-8?B?WEY3WHBzNTZsZ05lK0h0T3M0TUFwcVVzTDBua0dHdkNMc2dzenFKWUxaOWFJ?=
 =?utf-8?B?WFhkQWNHZDhHYjBBZ2FFVzlLSnloVnMvcXVHcFVpdlRweWsvTGFrZDMzVnE4?=
 =?utf-8?B?dUUrNVQyUlJWKzBtU3k0TG50cEg0RnZrbTkxeVhxazIwNjErZktHZkRlc3RB?=
 =?utf-8?B?NVgycEM1RzQyTXFSS1oybG5OTmlHZldmS2RLZ2N2MWdsMFdPS2hiNTZKOWhQ?=
 =?utf-8?B?UFZRMGV6R0kyZ1R1SlJYTGltaGZpRzZjZUhVMk0wUkQ1NFZJbmh2VTNQMHVq?=
 =?utf-8?B?SEh5ZE9ld2w1ZXFmUjFuWStBbUVRR0Q2WDZzREMvc1B5djdXOHZuOEtmY3Fn?=
 =?utf-8?B?QTZQZFZDYkZ5bmc1U3J4WnI4cXNEV2I1OGFkdHdycWFKY0lKdU1CRkhta1g0?=
 =?utf-8?B?cHdwbGl0TC8yOFlscTE0M0dvU1hZdzYrcXVwajdoSTBJY1JIdHN0dlFRZFd5?=
 =?utf-8?B?dWxQb0VjdWdvYjVwR3U4aDNEZXNTTnI5K0NYYVI1YzlXdjBsYUd4VkRJZU4y?=
 =?utf-8?B?V3hMK0Q1Sk96cWdNemNqS2ZQQ1J1RXRjZDkyS0tZRmNNaDNxNm1wWG9PRzJE?=
 =?utf-8?B?MUJQNkZSTHBzTSsxRjlwcDhMVFU2VDBQcEQ4QTk3WndHOUhvMVFKdXJqaW8z?=
 =?utf-8?B?WEdWSDJUMW9zamVVVUJXajM4a2JMU1FXcE5ISDdzaHVEUUZqaytVMEE5b3Fm?=
 =?utf-8?B?S05WNmRNZ0NMVkwrVVJvSkZCSzBmWEMxWXhpaHFFWVNhbURIVWltZXZEbU1p?=
 =?utf-8?B?dTZyMDQ2RXA2OER2NkdDQk1abXhBUXo2WDRiYVBBcGJaZ1pESHpaUVJWd1RS?=
 =?utf-8?B?RXlCUEdFNS91cjlPamNLWm5wNlFkWU9jdVNlejd4K1JSN3BWUUIyMmtpbGR1?=
 =?utf-8?B?aUFvRTlFMnR5TU9sT0tBdG55c2N6cFczZHdhd2UvNE5rWTgxL3phZ2p3aWtM?=
 =?utf-8?B?TTJXTEtaclFLcWt6QnpuMUduU3Z2WjNoTEF0Q2VsRy9tQkpQNm42Rk90N2wy?=
 =?utf-8?B?bjE3NWpFSTRJSmVQOVNzcEY3dXNNRmwrV0pDUndKZ0p4R0x0S21SRzlDQkMv?=
 =?utf-8?B?TWRUdlBVOEh1QVJqNmF0VlhHWGJla2dPTjhiOHhOSTVWWXpQZnh4K2d2UW14?=
 =?utf-8?B?WVZZK0ZwdEVTUTQwRzFGL0g1cFlnRnU1bXJUaEp0SDlVTTdjNUZBWEVHNjBQ?=
 =?utf-8?B?NTVNbXNEYWFnNU5tdjBtbHpEMTJkT0twazhpb2V3M1djSVFtdVpXaFZONU8r?=
 =?utf-8?B?Ni9OeG12bUQ2NXdrRnpHSzRJTDZpZWJ2Z3IvdjkxU0pVOGlpODdkaUJiTzll?=
 =?utf-8?B?cFR5UUtZUjJpcmVlVzl3a2pDMTRwVU92eUtFVndKOGxmWmYzalNNblRseVdp?=
 =?utf-8?B?eDhCQnUwVFp3VzQxYUFlR0VTN0VXUk0rblRGVmduZmR0NjgrNEpnSlFIV1dp?=
 =?utf-8?B?YTNtMjhHWC9EeGRsN2pSRENaSnh0MUI4bjBydXVFRzNDWXhFSFdqSmg1N2lV?=
 =?utf-8?B?V253VkVubkcvNFJIclczQUE1TFprb1owbURmTjRLOFVoYzlwa0Q3cnJlZGVl?=
 =?utf-8?B?ZENiZVc0b09BWXlYaERzWGxOK0dDaVJSYjN5ak9rRUNrVWwrUUlwLzlnOTAz?=
 =?utf-8?B?aldDQnFNS00zZEszbUsvS0ozQ3pzMzQyWU9BRGQ3Sk10ZnJ6Vno1WWpyMWdn?=
 =?utf-8?B?bHNQRFBXckk0N0N5aVV1aGZLK1RqeHFZNkNwL0kvdG51RjZQYTU0anprbmFn?=
 =?utf-8?B?Zk8rcStvTDgxdUFQWnl5emtnWHlORGpEWHFjQXh3MElFem9pUGNUbVlvaFRo?=
 =?utf-8?Q?I5SZw9inVYPyszXeHcpzHSGEfgGtsgRwYGanG?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe42345-0451-4562-7b94-08df3a3671d6
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 05:42:42.3250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHE4gNoMBr7tzo942ofCdqO/rLyPgM+lbt1FHXF+oa4PRW9b2qaaWPs5NO91xKi629SfowmtP03J9o2kRh8+gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2692

On Wed Nov 4, 2026 at 6:57 AM CST, FUJITA Tomonori wrote:
> On Tue, 3 Nov 2026 11:54:26 +0100
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>
>> On Sat, Oct 10, 2026 at 12:46 AM FUJITA Tomonori <tomo@flapping.org> wro=
te:
>>>
>>> +$(obj)/kernel.o: private rustc_objcopy =3D -w -W '__rust__*'
>>=20
>> Hmm... I am a bit worried about doing this here, in `kernel`, because
>> it is a big crate with many other things around. The pattern shouldn't
>> match something else, though.
>
> Agreed. In v5, I will move the stubs to a separate, small crate, as
> you suggested below.
>
>> By the way, since this is here (in `kernel`), do we need then the
>> original one in `compiler_builtins`?
>
> No. With this patch, compiler_builtins.rs is empty, so I will drop it.

compiler_builtins as a crate must exist, so you cannot just drop it.

>
>> Actually, taking a look at that, I don't think we needed it (for the
>> original reason, at least) after commit
>>=20
>>   cb7d9defdafb ("rust: compiler_builtins: make stubs non-global")
>
> Right, the stubs have the __rust prefix, so that reason is gone.
>
>> And now, here, in `kernel`, we don't seem to need it either for the
>> original reason, except for the `objtool`, but also for yet another
>> reason: if they weren't weak, they would be exported
>> (`EXPORT_SYMBOL_RUST_GPL`). Which again points to the fact that we
>> should probably clarify all this with a good comment or that we should
>> do this sort of thing in another way, e.g. in a separate, small crate.
>
> Right. The new crate is not in exports.c, so the stubs are not
> exported. Then the weakening is needed only for objtool. I tried the
> new crate. Without the weakening, I got an objtool warning with
> CONFIG_X86_KERNEL_IBT=3Dy:
>
>   vmlinux.o: warning: objtool: _RNvNtNtCshy5ABSPeoCG_4core3fmt3num8exp_u1=
28+0x381: __rust__udivti3() missing __noreturn in .c/.h or NORETURN() in no=
returns.h

I think that can be fixed by adding out-of-band annotation for these functi=
ons
in objtool? That sounds more preferrable then weakening the symbol.

Best,
Gary

