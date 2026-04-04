Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021132.outbound.protection.outlook.com [52.101.100.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FF670818;
	Sat,  4 Apr 2026 22:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775340580; cv=fail; b=VqBYLo58OB6GWapejjqng9sRCN0LRArGtbGOfr/hUWW1xuoPPtvUQ1iNuyXNNYJ0oUMMmgWLKZ5Yt/wpB8/Xw5SSv1HXHIeWOKYpU+sYStF8qn5DUCgr6x0FURFPwHvXi/EPwkWFFUj87/yNxyUhESl/RR6L4+oWp6wqci/JBJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775340580; c=relaxed/simple;
	bh=kFnr+Y6MlkblvtxCQy6YBdoK1NYmXGDNlriw971S5pI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=et9eB4dUqQdtiYEksW2GFCwfyZm3l9tbcPz/HL6XXKDH5RhjjJn5Wi88zvaA2oV+2s3Mv8opgn63zoCOM+Sg9A495DVISKzBh5SdHWG8fjqjQ2rxPrJgx/SyIXzceLXfeY/yz4NJyoOyXMGEgp9l8JL51LKXc2B9w4tvkZPt5wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=eKGEbOmp; arc=fail smtp.client-ip=52.101.100.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eKGEbOmp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCd/H3u/LpeKdrdhb6jd6gsiT9Ep9Ib+lcT3zxadDBBtpyjblklSxH8y72Zp+XaK5WDNGLJchAEI+y1ZxqFRAqNSHFniik2i310zFMgDKQcqOjOT7547FR68jN2BpAFM6r4nujvBqHMT2B3netPP2g5Nkc5mXXe6zolgON6LCHy8/n3umFvvgPDRRrMQPzUyX/06ck6bsEWRnrB5Z9kX7BcHUnpBZx53IGgRYp2+eZgDEjuI0vCv7w9ibu0/Y5+V6wHzkmCjMUyW7htDu85dE42pNIuVETlbB0pQSlUn/c2m+HRaEER+XRNVDEHqcpQ97ETHeIVvIxpFVqlNMn781w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxelKW3hihOIWE3yiMl+KIrBxFvLKYAnRyLvmP9wzeE=;
 b=YPG6yq52+AllWVNnJNbZa7EyNU30BkPIhd4AdNrOOL91p/yzUYvJoBL8Xk55exdOAUXifiqcxvYNQxTM9B5U6k43/hXAnUS0bsGgBDMJhx2NI7Z6pBpDADahTqW1QCL52iuFrO+OFNMLvpVGlX9tbgkmAq+G9wfXeUgsRXg4cKt5ryXOjuPtcIPvIKpWRQOOSXQMkAjGXed3VDk9Tqzz33sxRqpCvupNH8s+uaDrYGMw9NGgkNmWAPV8pFTYqVb7o8h2utr5EkzXi+PLrTb5Q400fyTGT1uh3EYMt7kCxL3kCz2NS1dqoEpVCkH/bvgVbbZ7kxm8mCYZTif4U72rXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxelKW3hihOIWE3yiMl+KIrBxFvLKYAnRyLvmP9wzeE=;
 b=eKGEbOmpjyanCIxMEgHiPcu41LZM9AzHVnJ4Wfw30PwwHwCHxPMrmeiMRxAnFr55A9WUkak2Y4WRBcjGLCNa7FRIp9CdWoiZiqhGxVJvanfCJx5uBuDWpfVcSEBvjVkDOOZIO4Qv1i10uKs5TbVYDA5ZshN2eUEUasrl2XsS+kA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB7175.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:335::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Sat, 4 Apr
 2026 22:09:36 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Sat, 4 Apr 2026
 22:09:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 23:09:36 +0100
Message-Id: <DHKPPLI3TUBA.396C00D1NDPUQ@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] rust: ptr: allow clippy::incompatible_msrv for
 slice_ptr_len
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260404212831.78971-1-jhubbard@nvidia.com>
 <20260404212831.78971-4-jhubbard@nvidia.com>
 <CANiq72nToewesUCDJS=WBKRvCO-obzixW9+D1vH6s9mJXUeO1Q@mail.gmail.com>
In-Reply-To: <CANiq72nToewesUCDJS=WBKRvCO-obzixW9+D1vH6s9mJXUeO1Q@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0403.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: fecb0253-7011-4ed4-e40c-08de9296dc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XHSSWMyDWPMq0vyonL1lCxsmPOyVz2KnGV4ZHsBxUanRLrrrkbYCFVQn9d0X6u2C4qPFUq/n61BwX+tVXOB+PhoDm9E44xORlnyclfDwZJBdo9prDp5m3DZcjtUECyIrxoCR5JX8B/Ni/JSM2B59ZBzN/XUgWpLk79ziuB+ien5EECz+WD5khOEbepVCiRUGZQFMVLsZS1O6FhNAdtgA5bWx2ojkfKtcOjURWZVJkFsqZWxsbRhYeHZynEP3+X1Zzs1JL/wBXEl1XEp2e5xehiFdRSga/H3o+NClByVj3ANzMeFGDghT4LDPw+imQDTwPto0msNa1Eh258MomFrY3rUlW99/4WxOmo9b19PHqdezPEruEaUTVW3q14qqIfJRYgftH9MgRB4F+dVsp6tUmJzqKiuwEK5HCt2FlCuVQjMrhsyaMRFpIuNxQnxUzJAK5eOclY5NSMQdMMMXHm7MA+mpXxDjuwmc8SX1te7uKcurGH3DX7IN63KK1ZyH9ty1BsGZoQUfHJhD3hgDggLOsPHKXM/sdzfJxjTQLsaOEHLmz9/bJae93xp/fQVktyTQ7ykHNQ79AX0V9tB28n3ODr5pJnFd+xA1KouWKgA6hfkJOtikJoypnxWwiqthGmcBUyFW8wGW/fN6Nz43Qw8MwWOCi7cWjjVWFR062JaB7YxeD3BcnmrVT3jagzPl5o6Yv9Zx9qXKUXXPcaIdbpr36vR+PNzrTro9CUFSR2m3aLw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGdnUkZad21zK0d0THoyd0MwZ3cvMEo4bzhpbFF0MnYyTHorazlWWHNRUi9R?=
 =?utf-8?B?V3dVck55SWFrZUEybFlSR21TbENENTB0aThpQkVFUjVZb3JQVDMrV1psc05l?=
 =?utf-8?B?aG1jU01LcEpRSzluUEpzWTI0azM1clNHNVBrTytBc3lrL0ZrWSt2TjhrS3RD?=
 =?utf-8?B?UDcza3N6MVgxY2FodlcxTzc1NWNWZVh4QzVpc1BLYk1mbTArOVdSNkY5SFFS?=
 =?utf-8?B?SFpjbSs0NlFjR2hKamdydGZ5M1JWNkZTMS94U01TVWRVek9nZ1Frb0t3YnhE?=
 =?utf-8?B?WWVCSm9xYTFQSkw4NlR4VXRvOS9JTjgrMERDQTlabk9vVVlHWTh5T0ZjOWFs?=
 =?utf-8?B?QTJWUUV6RmNTanZ6OXQwWkdRcThDZ0ZyTmJwOVgwUk5XZTBtbTd5SFZpM3V5?=
 =?utf-8?B?akhvOWhwNzByNDFQVTI1Z01xd0prTWhnSkFGU2ZYWlQxSDdoMDBqUUNkUWg5?=
 =?utf-8?B?OXVnVlNvQmh4WXJYcmxYM3lMajhWS2ZzL2loQkRmcU1KM2dQRG9sa3ZvWVRt?=
 =?utf-8?B?RXI5TDRIN1NaRkxEZHBOWTBadU9UcFR6akJ2dXk0U0U5WUdQRmJMS0w3UVU2?=
 =?utf-8?B?MXdYMGw5TXlDQVFRR2NKYmlZQy9wcE9iSldsaDZWQS9jMWFLQnNUa0Fnd3NN?=
 =?utf-8?B?RFdNNDQxVUFvOUhJTUFTYmYxQUFmdi9nNHVUYUt6cUwzZktlMUxlL3o5UzFv?=
 =?utf-8?B?L2Y2TW52YWlMdFg1OUhOOFVCb1R0OEtMM2x2SDdRaW42NVpvQkxNVm82cHlX?=
 =?utf-8?B?MUFoNHl6YTk0YXE0SzV4NDcvSDZnRzFCVkdvem5FTmpoOHJOZkN2YVlXNWI5?=
 =?utf-8?B?c0dRM0ZPcEFiR2o5Z3M4U0VUblo2RDZhVis1ZXVDYlViTmV3TGlSQmRPb2x3?=
 =?utf-8?B?ZWRrazRQaS9rUEo1dElXNWlOZlBkMnNCa052UDZVRTdjVnpnTndiaHlvWnQz?=
 =?utf-8?B?T2dWZWQ0eEF1eDBSOTZFR2pWYlJuQTVUa2YvUDJtV2NpTFFjS2dLUkJtNVEr?=
 =?utf-8?B?djNQdXhOSWVrRW1rUGcvRWc0eEZXcHFuUmcyMDc1OFhKVGRHSXd4OGV3Y2Y2?=
 =?utf-8?B?ZWlqNk5WTTdZWVFiRDhaMXU4SGk0ZEV4d3FOYWc4aXZiYkNvVHcrdVhnSFhC?=
 =?utf-8?B?SFNFZkZzcENKK1p4cEczOTA1bW82RzJlQlovaHZSQVMvNkxLbFJGalRma05U?=
 =?utf-8?B?Q1dTMXBnTllkaFh3Rmhha1VCdDcwc3NlNE43b3NxaFoxZUJqNy9IMDNEQ2pM?=
 =?utf-8?B?RlVqM1NvUDU4S2Fmb3ozbStxMWgzTVFFWmNnWUF6QUNjdm1yaE9wY3F5OVVp?=
 =?utf-8?B?NVlpQWtGeE5Sc2JFb0lVUi9HR2ZPSmRkcXVON1NES3lGdTlEeXNKYUhmbzEv?=
 =?utf-8?B?d1doQnRBRktoZzJ2cTE2UVRnWS95dWkwYVBmSVNvMXpWTTB1b2V0Z2JCWFI2?=
 =?utf-8?B?Zzh2b01OVS8xRXdIL0xlcmU1aGxkLzdpQlpFSk9IMS9xRklQSEFubFZkTWt0?=
 =?utf-8?B?Q2FINy9FeGp0ZzZpQVZpWUt1SFZrenZiSGtLeWZaL29yS29ETTQ3SHh0ZS9o?=
 =?utf-8?B?aDRhYnJNN2IraGJZWi9kTE5EUTRqNVg3TG9XU1RnM1EyS0tXSDdkK2ZWdnhQ?=
 =?utf-8?B?ZkNVUmZPY01uYkZUY3JWVlcyekNLd1hRTU5FRTZjTDdjNzFIck5heEZlL3BE?=
 =?utf-8?B?ZUxqZDBiWEVkaTZmc2g0TCtpcGt0Q3BTelptR0x6ZlI5Tzc2aXdpQlZKMkxS?=
 =?utf-8?B?RmlmTjE0T0x0eHlMWHorVURjQWZoY1RkZ0JxNVpiRmNNSmhad1FQaEIyNkdz?=
 =?utf-8?B?aFo3TlY2cENwRFUrS2JteFpSZ1ZveW94RGQvcUJneXYxR0R6dE90alNqMWRs?=
 =?utf-8?B?UjlJaXRJaW1wd3hnL1ZsUUNQZFR6Y2RKVGpseldFaDI2KzNncWppcmd3T0tv?=
 =?utf-8?B?bTM1VWsyOEs3NGVlclVMdUt1U21nMGxzZDN1VEQ5VmQ1ZkUzWXBlWjhsTC8w?=
 =?utf-8?B?R2ZrTVZqUWpBWWJ3ZzMxbktQVStGd2lOaHBOZXcxTEFPTUlqbHlTeFZWNzZC?=
 =?utf-8?B?UjU5SWhTeDN0RGdDekxYeU9lRU5jSkRwNFA3Y01qSkpmbnZhNFNWZDFxRSt2?=
 =?utf-8?B?bE5ydGxHYVJLanlzQ3FPeThick9HbzB2ZWMwb0EzVlJrTHprMTNScDlCQVJz?=
 =?utf-8?B?cGhsb3pOVjR6UDYrUW9qQlVTazVTL2dDb0UxVGI3a1kzc1gvdEFHbTJtRjJE?=
 =?utf-8?B?Q2dDbjdqM1RhYUFaQ1gyeXY0OWJDK2xFVHFFcXVxMDRZOEZIM2VRQWFITUFj?=
 =?utf-8?B?VEFyV0w0aTRtWHMrN0JJV1lMeWgvS2VJUXc4ZGRjNU9VTDluSDJSUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fecb0253-7011-4ed4-e40c-08de9296dc0e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 22:09:36.8466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYEaN/33AnQxs5b/Y/wmnvgGYpYF7ca4/vhxew3zLnK1RuP6OOszPs0/h2JGkm9qodRNk6MB8yKYjOn/3gGZHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7175

On Sat Apr 4, 2026 at 10:46 PM BST, Miguel Ojeda wrote:
> On Sat, Apr 4, 2026 at 11:28=E2=80=AFPM John Hubbard <jhubbard@nvidia.com=
> wrote:
>>
>> Clippy reports four warnings when building with CLIPPY=3D1:
>>
>>   warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but=
 this item is stable since `1.79.0`
>>     --> rust/kernel/ptr/projection.rs:79:26
>>      |
>>   79 |         if self >=3D slice.len() {
>>      |                          ^^^^^
>
> This will also go away with the bump:
>
>   https://lore.kernel.org/rust-for-linux/20260401114540.30108-3-ojeda@ker=
nel.org/
>
> Cheers,
> Miguel

I feel like this lint is hurting us rather than helping. Perhaps it's worth
disabling it globally.

Best,
Gary
