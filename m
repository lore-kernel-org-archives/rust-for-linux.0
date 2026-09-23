Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021132.outbound.protection.outlook.com [52.101.95.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E344248C6;
	Wed, 23 Sep 2026 18:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188910; cv=fail; b=Nraq3oU7714yslF7cA5JikK49ILW7/RY7/7T8fD7O0cicjUJyFPKlZqYQFqaLqQPta713tvrI+NgabX/IBDeO+0j1K26482XFdDjaVF1zX/aIN0cUxDNc4TCCdsc2f2cy8mRZPRrgotOMquUiCB/wmBl0uCdw8Uyhq2W5l2FLu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188910; c=relaxed/simple;
	bh=z2jKquVciKjj3tVrvsUDDatAi7t2z+CJ+ibEPg/uFYo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ktao5ARW9uAomd3/ysHLgm8rEvKmT2ycwPHHntcswGI0wFccv30QAaH9QjixXsOMl5opZoShlcqgjNZAntLwU8QqG3Lhutbi3bCYBkCyXLRbSLNBMCYvIU7BP6BVvNW5Lq6nswpORHGVrQQ1DzKUC0rZAlqBETwdA/rFKhndKyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=STzw6BSh; arc=fail smtp.client-ip=52.101.95.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="STzw6BSh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOaI0P7eTu+GKUtv/6U4tXwVc5via0dmX2TkeXhy3ib/seShwHUI7hgh5ugRfn94cvC4cvug53ES76hO4Y+INGE6o6758PbdxQrXAn71LQT8mAfZmnEX10E2r/qP0Nr+0n7Nxkxu6HW1I93cIsXDyJQZws+dd3bEPSxDCU+b5qzI1ZQ2JvSe50zpLXLKVRp2ZuPf3ZFHhtT8So9FCUbdyxVOtISboBns0q2tiIg8WimtvbYI6zUCdB20GDx0SQzFAGiBouj4Crsn5SqC7sl+0X0kPYarG9GXOmTe6Wub3fpXzcX32Mg8RzdVOjWIOIfqfukOsR+fft0cDaDVk8Sfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGLAysBPU0lMX4JrmqbVwSkWCjZ1Bcymiz05jpKaaBc=;
 b=XHdUMxxyNs1M3aR7/SLPvgQ3xFhrPYkqE/iW4sFVHceUyhRwSknKYZgRxFYoSaA/I/eBG8jaLcVm5K07QJ/AwtSWAGmkSpFPoHLSai+gioVCRDEpOw+qJE3+RdrFYVmmf/UYfapVSFu4RJ6PYQfqpeJVvefGAbQsEUS9L+qxFlrhT7K3Pj3JYjnl4x4MiCC/jV2gBvbvMxLResmfoVSFYAALw4eSmU1OCPs23e73ud+Dm+EAHDu7TAFshU7kVFAuE81WDuGzZMmEBwOPwq/5sHP7GHFZ7WJsNP+5In0dKJCBLjtpnMQRmgM9VXOjIq/7eMcAgeVGqtdH0JksOscAKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGLAysBPU0lMX4JrmqbVwSkWCjZ1Bcymiz05jpKaaBc=;
 b=STzw6BSh9f1MRcj9Ni7D4y1hqKnrM2JYp85pngyNL9zk1MXJy2bCp+E5NSJq75lsNcBQJb/f8GMa0piYsloB0RJk4QD/AbOJnFnb0glUNAqqyR8pHnr78WGV8+5gfUJVQNMheOSatkyQE0wPrMTcMHtJDHAiQHSDtgMqRqpLCLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO9P265MB7724.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 18:41:46 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:41:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 19:41:45 +0100
Message-Id: <DLMX05RAZD0S.1EZ4L85L0T2HS@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: sync: fix safety comment for `Arc::from_raw`
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Alice Ryhl"
 <aliceryhl@google.com>, "Lyude Paul" <lyude@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich"
 <dakr@kernel.org>, "Tamir Duberstein" <tamird@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260923-aref-from-raw-safety-v1-1-e34f0da04145@kernel.org>
In-Reply-To: <20260923-aref-from-raw-safety-v1-1-e34f0da04145@kernel.org>
X-ClientProxiedBy: LO4P123CA0306.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::23) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO9P265MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: d36c78e8-0176-478a-2d33-08df19a251e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10070799003|7416014|921020|3023799007|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	shFG8DUisR2DJ69i9T+gimgCG4lT9LUqRLyvbTio373Qkcs0gpgv609WHrOP3oj4Hxf3eMMOWaP4x30KJNuu0G2NnfrbgbgZ+LKI/73UdZbKfQS9/wVTbS9yAeqAb54WxsDgYlQ5bkmiqXBgUxPJQs6V4KkXSlgJ3saVash/wfLeXnIx82915yeRrxZ1i5GHgo/YgDRmqNj8F63pzzMsh2yjxGDJdmg64Gs4/an6UFRBPiKxF86cDFZep8L/j5QIYJwaTbrjfp1yCQQBz6nY0JNlZLSvf2wnTA0OkiRdyi6i8eQKOspCtHkprZUUAAyLmFqzBScrNuHtXcaKxsWzbqH3xhloB4kv6L27eTJJ0PkzZk7PqMePjeHdkQMp3G2BsVYh0zv8A6U8gk77ISQ1oHymSAwcFwAJoAbA/AKO0ODpNhApkN93sBC5EqyYe6OPx8ixqTYKAthQrpDeSKwEU/YD1oJ++NdAPg52KjXAyLNk/W72cZamVy5vXtwKjA5QGf8+EzRKJq5jxBP+vIr/sdkwXzBk3U/PIgHpqwKS1xwG79kfGzhBf25fjCAKIvwG0Y9kQ+FK00yhWqlEPldGa2EvutdfAhX35dHvCYSqwskkviLOgewJo0F5AdGAYkjy6sErv3DNWQctP2AbxSAFQMG+HPZKorzJxvZnHimUMr9cQhJlZLWV8SnPNgaif7g6wM1qmiTx8UB697NUqG1vJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10070799003)(7416014)(921020)(3023799007)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWVGTjEvekhBTElzRktnV3JDZXMxUnpjNmpjOC9ibUIyOUJUTHNEK05mKzV3?=
 =?utf-8?B?TDVuVnNQVmw5bnpYVU5WTGN2ZUx0YUthdmVNbVNHNE1qSHNsSWlWeGFOMTdF?=
 =?utf-8?B?cHpITk1aTFNIYVdkazl1N3lhdHpScEM5eXRqbm5iY2FHMXdnbExDWHNwTCtl?=
 =?utf-8?B?N21oR3BkRGphdHJ6d3p2TnpuZmtLUlB2TFlEUjh4ZTY3WFZVekl4RlBTSXgw?=
 =?utf-8?B?bnlGbGZtNG8rajdsVlpMZGYwdjhreFdKWnBVODFtZEVoVDFPSFNmY1VVazVh?=
 =?utf-8?B?NE1VTUlGQVNCTnArd1lCN2kvcEg0SGpYYTBaaUwzcU9mZThqclRxTzlaNmhv?=
 =?utf-8?B?eVRKOTlDcmhqT1RUSE1jME0zcXpnQzAzS0pya2JjU0ZjbklWV0pvcGloeStC?=
 =?utf-8?B?anBrQkpJVU1aaTM4MkU5UnV6d1NqQ0ZNWDI1Z1BFQjZ2SFIvRkdoKzR2ZUFM?=
 =?utf-8?B?aWtSOUV5YUhaNFNuU1k5dzlDV3JweXg5TGRkZW9oTnJnTVlYQk4xK01EZDZV?=
 =?utf-8?B?aVQvZDE0UGp4bExtQkNVMGQxeU5DU2VjSVBpcjBoZHNBUnNhWmQ3SjFlcElm?=
 =?utf-8?B?R2Q1WjVXeTlBKytjN2lCdTEzWTRNeGlBL3JLYzE2ZCtsQysvckxQMTlzOGN6?=
 =?utf-8?B?ZU85WEkyQ0pycUFka1hnR1dUN0RuUkR2NmIwOEdhaCtkTVFrTE9tK0NtZjRp?=
 =?utf-8?B?eWtzdTZuQWdpMFkxT1ZkUGlPall1VFM1QlA0T2lhaUZUYVI5ck02WFQ4dVBB?=
 =?utf-8?B?R0JQOGphU25FMTdDVkcxcDkwYjNSSlMwNHBiRHFUZHZjVXEvQXVCREcxS3R5?=
 =?utf-8?B?Nyt0VFZLanVvTGNXVCtlNXlVZFloYVJIQkZ3RkFOR1ZqZEJRRXBWUm9hcVdN?=
 =?utf-8?B?QnR4TzRxKzZGTjgxa3Q0S3l3clZGWW5lU0RNcG9XUU04UGM0WGdhblJZcG5C?=
 =?utf-8?B?RjVQYXlkT2RHU3VyczRtc0FRT01ncnUwY2dhRklOWGJCTnJCNVkyQ0RKMWsw?=
 =?utf-8?B?WndXY0dHc1JjMVdWazA4b1ZEa1VPMWxrRjRBRWJ0aVp0Q1AzcitWVEZ0bXEv?=
 =?utf-8?B?ZnhPbjQraGc4SXRheDJsb3hZUmF6RzJxaXZHam9RZ0IzNFFQL3FPdWJzdFln?=
 =?utf-8?B?OVZKcGMxQ01qR1lMZTNheGV3VW5pSnVaajh0ZkhUN09hYWFaNkNzZ0FKOHdn?=
 =?utf-8?B?c2wwRWRxT242bUxQblVyWWEwbWZkeG5ZK3RZMzBvM0NFazBpcnVDcVk0d3Rz?=
 =?utf-8?B?VktBRTJKL3NkTTNFd2dhbFVHVWh3NkNFa01NKzhJd1EvTUsxejJZQU9WNXVY?=
 =?utf-8?B?cFJUMWZwNDBIbmI3c1ZKd3N3ZE93eExVRXRRYUFFSjRLRFV3L0MwdWZmVW52?=
 =?utf-8?B?Zjk2VzFIMmZCNUhpWjJxajJuMjdnWFBGSTQ4QlorT2JCa0JZZFhqY0ZBRkU0?=
 =?utf-8?B?bTBRYTN0UlBzM1VQNzd0bTcxUDh4NXN5Z0VSdGRpKy9wV1RrSnViT0JnTzZX?=
 =?utf-8?B?MitDTmJhS0MzdWtnY2U1VHZnRnZjQkNMWGxXdUtIdnd1cThPaHRLbG40cHFi?=
 =?utf-8?B?RnY5MEg3TWhqS2R6Qm9CNm1Ccjd0S0gxdnhMcUVmNnYvNDUvSWVGRFJJeWRl?=
 =?utf-8?B?dU81Mzg1L1ZIWUFMN3J2bm5uVXlTZno1RnphQm1lWFdiR2xxdWpMNHpuTGx5?=
 =?utf-8?B?RXU5TTArUXBWeHFCWndMekU3L0lSRHl6dWpNK2RmWXltb2k5L3RJN0pWWVo4?=
 =?utf-8?B?UjZRYVloUHhSQkhVUnRqMU5mei9OWXV0NnN4bnozMXF5OFhtbVlya1JIQkE4?=
 =?utf-8?B?MlZFS0lQQUZrWHYyZEkwajhFNW1VRWpQR0laalFXVWxFbXgvQnl4UmhFV3Vm?=
 =?utf-8?B?N05iZThUSE5jUzk2T2pZMlN0VTZVMjYyQTdxVXRIMDNjQi93Sk5HQmFOL1k5?=
 =?utf-8?B?MkhadGpqdEx5VStmdlFKQXBnNVVJKzFPVHQ0MGhqRDFTMmZxZ0NrU0g2MnRn?=
 =?utf-8?B?L0xSUU56ZTExUGEwQ0JsUXF4N1IrV3liTGUrVnZGM0tBYm1FczIvS3lBS0Q0?=
 =?utf-8?B?SHlJKzM5eUZreWlyL2FDZUQvdHAzbkZ4Tmtuek9Pa29JVXdZRDdzSlEvRXUv?=
 =?utf-8?B?QkVmVFFRbjRKZVgwWVlWOVpoZDhRL3ZSTFJuM1lRVXBqZU9HTSs1d3NDNDVl?=
 =?utf-8?B?ZnFFTS9FaWNwUXNvcUR0UHpwM3djNlJobEcrK2w4eXZGNEIvUjQ3UzNxalNQ?=
 =?utf-8?B?UGlEL0xXQjFoeEk5SnZXNk1wRnRtWmpVZVRTZXJXRHdJK0xkajM5ZDZlWXdp?=
 =?utf-8?B?RUtSSGJUL09VTVY3L2cxM285dnl0UzVKVlV5cnpmSGZWT25QTzUvQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d36c78e8-0176-478a-2d33-08df19a251e9
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:41:46.0148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +25ZClS0kntTpieRNTxL9nDjFB+pysUdGLZygBNFEPT8Kg5MH2FMBEdpCJ2E99a8ovGOmZwC0zrYOL81RD/MqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7724

On Wed Sep 23, 2026 at 7:32 PM BST, Andreas Hindborg wrote:
> `Arc::from_raw` does not require `T: Send`. But if `Arc::from_raw` was
> executed on a different thread than `Arc::into_raw`, `T` must implement
> `Send` for the API to be sound. If this is not the case, ownership of `T`
> may be sent across a thread boundary even if `T: !Send`.
>
> Augment safety comment for `Arc::from_raw` to close this gap.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/sync/arc.rs | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 8ae0fe6f19ec..06838ecf633c 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -276,6 +276,9 @@ pub fn as_ptr(this: &Self) -> *const T {
>      ///
>      /// `ptr` must have been returned by a previous call to [`Arc::into_=
raw`]. Additionally, it
>      /// must not be called more than once for each previous call to [`Ar=
c::into_raw`].
> +    ///
> +    /// If [`Arc::into_raw`] was executed on a different thread than the=
 one executing
> +    /// [`Arc::from_raw`], `T` must implement [`Send`].

This needs to be `Send + Sync`?

That said, I am not sure if we want to enumerate all cases where things can=
 go
wrong. For example, would `Box::from_raw` need to mention that the type is
`Send` too? `ARef::from_raw`? `ForeignOwnable::from_foreign/borrow/borrow_m=
ut`
all have to mention about this, too?

Best,
Gary

>      pub unsafe fn from_raw(ptr: *const T) -> Self {
>          // SAFETY: The caller promises that this pointer originates from=
 a call to `into_raw` on an
>          // `Arc` that is still valid.
>
> ---
> base-commit: df2908090cda368b01ff43709f51890076c56157
> change-id: 20260923-aref-from-raw-safety-78a7283627fa
>
> Best regards,
> -- =20
> Andreas Hindborg <a.hindborg@kernel.org>


