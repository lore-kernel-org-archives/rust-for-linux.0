Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021124.outbound.protection.outlook.com [52.101.95.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CBB3A1A5B;
	Mon, 16 Mar 2026 15:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674216; cv=fail; b=Gyzzg5PkgsU3HrET6erSlxvxkzmkHI30yb0cx0rcikEuyBMwc9QgKUhX0a0NqeSqaFf4lg8zTrf/6C8MQJowNYoyjLIIWgkRrrGvu5twGaY7HbQu/9msS98T9Dl2/oOhWvFQroQZIiFM+NRjLCIW/JWB0voWl57rC72tVZZEEbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674216; c=relaxed/simple;
	bh=I4ffjSX5aehXrYFZ+MY1C/jhJwk59ViNcS3jBAkwGqI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=sdcHFXCkHxQW2Fl9O9+DucDlqxJMX/0cNcMnb5jZyVT3BZWzJBKeDjc9mOYv1gsD5x+oL+6umn0SrTw6598ogQieD8PPP7177DLa8QIvaTaWgZi90roZKWBq04fyc71UxafLX6Gr3YeRY/xOD4IJjQU1DzJwIZxwwv8qM4ku30M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=0jiAktfC; arc=fail smtp.client-ip=52.101.95.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="0jiAktfC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+VDLUNm43lRiuRfpO/5rFhGvMtUIi85y23rHuj2SD+BLR/uE6zTFv65ezXuwnriUsDRPqNlKvO2kXVckr4P9OsghtxNh6qWIvujzVX+3FDy1R0t/WFUPKegyGWuFW+8amJK/OHswQxcCXmoa/9Ek4eyh7n6r7ejTO5MK/hJEkK3VvDybf+gmN1Vpvbg3zXrLXNoaKWjI+j7vLwkISRCmCLARG9mh6CwrQ1m7lqee6nJBzROs2ZohZ2DwJV0RB7Hiec1fefrzFl9NGSdDkz3TkyuqN44wKD4V4xg+vEA7dkKpOPKtMP8G1mfW2QtXUzCOP+a6e+VuabGu8Qpb9091w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyuKjfiskW5TdwvMPMOcigOp9oyIrmYs9lBMZfkGNMA=;
 b=kIrPZgIoyGrnZw5fbfrWeB3Ld2jhlEdGW6fVqXNEPBvtTBkyzzU0kf+BxYhgLpGyhSQXAx38UroqYXzILIvTWB9xLxrZYCd/CEU/SUy3dTxXe1jnD8WImUH4WP9ZmrTOFMXkgwTbMVs69crO/SC2hMC3ehfKlU6nOUGHGE/JpWAY8r4mK6+Ei8x0qvU2pWusrqrRvC1xA6qU2wFlQDpNKA2LDb605JtSvrDems72XJB0unbAlNjL2vq9uMnRRKRZT9/ngc89FhnsS7KPb+px6YAMpSNRSU58ITorp4FYe03lWD/nlZ0Bh8p6mcN1puNj4eO0+Yzk01koIQ2hq8s5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyuKjfiskW5TdwvMPMOcigOp9oyIrmYs9lBMZfkGNMA=;
 b=0jiAktfCG9hSPcqc5ccmAf7w7Fz5YUPLENs17cB39ZkjN5xUWx08cXA3ZwMyWoNS/PyG20oei6jX6I1HgTRHYJdE5VGRJTEZ/zr5nugOTgPk+0ev2dZFiLcyT0IQ5NtMht0vBlePgPMRT1jpZygAVwXe/E4YkgNw+nI8aK7Rq9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7543.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:41b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 15:16:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 15:16:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 15:16:50 +0000
Message-Id: <DH4B17PQCNI6.9D1TIDB6ALGS@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: sync: completion: mark inline complete_all and
 wait_for_completion
From: "Gary Guo" <gary@garyguo.net>
To: "Fabricio Parra" <a@alice0.com>, "Gary Guo" <gary@garyguo.net>, "Miguel
 Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <DH45DQFO909K.1JK6IKMX51ZAV@garyguo.net>
 <20260316151056.287-1-a@alice0.com>
In-Reply-To: <20260316151056.287-1-a@alice0.com>
X-ClientProxiedBy: LNXP265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 83203d3f-f22d-4285-ea19-08de836f0cb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RfPAq3nEgVxiwIt2n9z8sonjJ9tts2+bcOzR6kksoTALvPU0f+QgzgwnXmkA9B7FPRJkbJGnNZBAUf2+YFv+huz+xqRw1/KyE3ulPzY7lir/qlaQ8V1+Xv3FTqi3xl6LhCnOMarDMOsfd8qteuMdjZR/dRveGJP/fhnVWBjNABG7N8bKegBLK/X+PHkaD6LEF95M9f2gYn7IOVMLa3Tkk2SYnbZ3I+cNtr0g/GvHYmJ70atTnkZ+CFaf9/ZLo5oike8SJn1ONKhO3O6NHszNWmYOt4F7JJfh4HKbEHdTXfhuAMYYsudyzAEuu41BBM4XhcXPPC7V5P8LMH6WBWQQMBi+p+SK5eBHpAlzaXBJtO/jPuACmzm0J0nVEIvCbE4NegudnOl3MeeMnOIn8VG+0us0qrRYkA6vhvQZofqF6flJ0csZKEfk3cUhwSsSbW6GRGZTGBIZZ4Sx/MtcYskDBbNaHtZ6J758tWr54kNmsoF+6MZK5BLeN35JeGM0B3sRjWjyIiO7TUAOgCQJJdUJs+e6VOKNt/1sXIdeOtYsqxcblFWcUKe7NydeygKjmkOzaMq3t9TbN+EKgXz55y8GXckEALVFWwce8ZRSIaAOP6zSpigRHdi6J6FijLN5RtK937Ttb5RoK5s91LqVLFqTmzktvIDpQT5xUHPV0UdgZ0FLjSOKBeQKXRkcXjp7BmTNbLd4xqamMFHUuTMxuORm8+3cfIqfPTqqV21A2ffpzWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnRkSm9RMWlia3BGY0ZWNDRhMW1qbXZPeWxVV0ZtWjNZdzFVUTJpdHNhY0lH?=
 =?utf-8?B?YW9qSWh3TU1BQlBLT2U2Z1JFeW11TGdCY1huYTJqTHRreGsxangveXN3UFR4?=
 =?utf-8?B?cE9venFMSFovREVSQW43RjJEUEllL2pGcmpNUEk0RUpjQW5xWXRSa09wVmMx?=
 =?utf-8?B?RkNTVHBjS25mYkRBRXIvWUFBa2RTaGdjdkErVjE5WE1vR3JGYU1sOE5ZRTlP?=
 =?utf-8?B?WkpGbTFXSWE3NHd0Wm1Fbmk5Mm5Wb3BMdXg2RkN6THJSN3BmbzFtSFAvd2NL?=
 =?utf-8?B?V2ExZkJKZFA2djB4cndMc3I2QnIrNGtTYUIzYVE1SEEyUzhLYzhoSFNJMVBN?=
 =?utf-8?B?NkRlOGhoVWw5MGlzdXRBVU5GQ0pXanBuUWdLOVpVMEhUeG94UURQaVgvTVh5?=
 =?utf-8?B?V3I5b0xiS1dBL21RWTdhNnFlNkZRdzlKMGhuakdIWTJRTjQ1NjErWXB0L2pZ?=
 =?utf-8?B?bTdtTEZaYktJaDNHNlhVeTNJMjhPVXB1SGl3am1oQ0VrV1ptbzVKZWhTd01K?=
 =?utf-8?B?cG4xYjFEWGdhS01TNXVSVjZvNU5KdlZwQWc3K3ZqZkhpbEdKdWZoWnh6TlJu?=
 =?utf-8?B?UFBBbWhYMzlVT0hXOGZTbkNiU2M4bjhDS3pNY1FIK1pwREhVV0RybzdUYjgy?=
 =?utf-8?B?aVBUQUp1dEM2ZFpRa2JNOXlBOC84U0dtUGtJeFJUblpORFl5U2d4cmRLZVZD?=
 =?utf-8?B?aGpnZit0eUhRYi9HVlN0TEtpYmNjUC9hSlduaEtValk0TVJrd2wzTHNPY3d1?=
 =?utf-8?B?UFNWa0poYnc2dC93eU1oM3JoU2YvbzUrMGRhR1pUcDJEMjIrR0c3R0IzMEpO?=
 =?utf-8?B?cit1MDhSOG9QdE8zKzVPWUlYeXBzeTJNRWV3c3B1NThLTTZ5RUhSeThVRGVJ?=
 =?utf-8?B?N1grdmptN0M1b1ZLV1pmUUtVd0hjZWdDWGlWTHJjYjBDYmFwcnExQkd1NHh4?=
 =?utf-8?B?YXpnczI0WDlUUG1xb2gwNEJncDBHazlTKzgzRVdUcFdhRVdwSGd6QitJVVdD?=
 =?utf-8?B?b1NXTGswTkpySUZER3lUMENhVVptZGVWenZML0ZlRWZ3UStCdFJ2bW5uazBJ?=
 =?utf-8?B?QUp2S0dWcnAxL3J1NGJoVm9CWDlWTVdOaXVwT2c0OGkvM1BZZGNiQjBNWWJ6?=
 =?utf-8?B?WHhTd0k2M2lwUXlIeC9KNVhLemRSV1doK0FobW02SXRpYWNCVVNWZFJ4N0Vm?=
 =?utf-8?B?bTR0ckZYblNSaGVsd216WjhNdDlrNnhLckxlUXBBbUI0M081MUJ2TnZTY1ZY?=
 =?utf-8?B?ZHNUMUtkSCt1WktvWDZQQy9iNW5PTlB4dTRORVBURnpIL000bVZtZGxVTXo0?=
 =?utf-8?B?U3Vja3ZBdHhJNEFKZVErU0pTV3h5WDc2VUhuZitlYlVJczdML3huM1lxU05N?=
 =?utf-8?B?Z3pwZ1pLbnhsdld0VXc3SmtiOE1PZFRLelQ0R0t3dXVzNmdSYjhkdDVLa0xa?=
 =?utf-8?B?Y2VvcmV0aStiU05vSnA2L3NpUW9LMThlV1ZQUjJxaUFWREtzaW1OcEhiTDht?=
 =?utf-8?B?NlBLcHltVmpZcVEyZHl1N3dPUjZiSDN0R3Z5aHFQQmdXSjYxa2hNUXhCeWM3?=
 =?utf-8?B?S3hNNzg1WWlhNlU1ekIxaDNCcGpTZ2RyNUY5NmgrUExIY0cyc1VwVTZsZVZR?=
 =?utf-8?B?R2ZKNm5XVThRZkFaUWFpV1VNNzVwdDNRWEZGOXNzMlB6YlZ1a0dEdXdhQUhr?=
 =?utf-8?B?QlcyUk9VQ2hJbHc1ZS9sMlM5dkxHdmJkTUxuZUw5b21HazROeSt5V2hmdDh3?=
 =?utf-8?B?a0l3SXBSbXpweE1zSVd6WEszQk5tNWo4NHk2MkwwbTBWU1lLNDFQYVpUYXg1?=
 =?utf-8?B?d0dadTF5RXFhcHFRUmxDM0c2RUc5VjFrclh0U3hMekdRdnRnYU5ORmdYQkt1?=
 =?utf-8?B?bVpjSk4vSFVsRjVaV2RzZGwwTXFlNUk1VmdGR2dPUWtqUHYrTEMweC83eFg0?=
 =?utf-8?B?NUtreEwzUjVrdktNVXlML0drVXNpWmdsQXVHdHhvdkhOLzNjcFlMNXlRVnhC?=
 =?utf-8?B?d0g3c2lYeHR3ZmZCQkxjTTJ6eTROSXVTdEk1b0FqMDJ0SWowY0FJVTBZNlM3?=
 =?utf-8?B?QlBjVVJIV24yRXBXNlZ0MytYTGZwWkdGVUExL1hvbG9sUnBFcjZkSUtHNCtB?=
 =?utf-8?B?OGRpakpSWWpnZERhMmxNK2R2T25Sc1dTYzVkNFVXbjFYZi93eXhzUFkyTDJK?=
 =?utf-8?B?ZCttN1QrNEhPUk9vaEpPRHY2bVRyUGpLQjh1TEFZSmthendINjR6ZVJWdDU5?=
 =?utf-8?B?TWw4S2ZiNWRBRThMNXFueDNWcWpWc1BOWXpBaFExcEJ0OGUzYUdXdy9UMVBu?=
 =?utf-8?B?ODZEMjNxblBNY0dwdm9Sb1pxb0VvV1F0ZTZEM3NsNElCQ0VlbEVCQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 83203d3f-f22d-4285-ea19-08de836f0cb5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 15:16:51.1885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBOQ6BjCAwZ7EgSyyYB0z6ZqHRvkJM7gIGfY1UQ05Lxjdqa5AXnnAF8FukNTH0VlHmIbgBJ75NPpMMp9xWYbrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7543

On Mon Mar 16, 2026 at 3:10 PM GMT, Fabricio Parra wrote:
> When building the kernel using the llvm-22.1.0-rust-1.93.1-x86_64
> toolchain provided by kernel.org with ARCH=3Dx86_64, the following symbol=
s
> are generated:
>=20
> $ nm vmlinux | grep ' _R'.*Completion | rustfilt
> ffffffff81827930 T <kernel::sync::completion::Completion>::complete_all
> ffffffff81827950 T <kernel::sync::completion::Completion>::wait_for_compl=
etion
>=20
> These Rust methods are thin wrappers around the C completion helpers
> `complete_all` and `wait_for_completion`. Mark them `#[inline]` to keep
> the wrapper pattern consistent with other small Rust helper methods.
>=20
> After applying this patch, the above command will produce no output.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Fabricio Parra <a@alice0.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> v2:
>   - Fixed malformed email header (RFC 5322) in the From line.
>=20
>  rust/kernel/sync/completion.rs | 2 ++
>  1 file changed, 2 insertions(+)

