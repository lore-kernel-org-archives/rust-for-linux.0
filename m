Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020134.outbound.protection.outlook.com [52.101.196.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D8A41F365;
	Mon,  3 Aug 2026 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765478; cv=fail; b=AdDk2Tys84wuH1gCtrcF4366Lfptm+g1v1onFpbgKAKe4YsfPRbYGrPotLz4au/X7aCIjcaX4X7A2PpB3tnRf40i2TraKtajP7Oyk7BIxq8mZun8bkO63ngd0zYmdQJIe3opvCHua0aSO++tTZrlejRkDSoRaXEOT+z+kfkLGyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765478; c=relaxed/simple;
	bh=rs+ZNuH+09bOZdlx/t7zaRoVoz8vI026G+Ch5h5B4jE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jqdU4Uzp9eN4eDWXz9KoHks4STVLmXnNo89qwcFFLygc6qPinLYAWdUu5zu+ql8CT6+jvF9kKwO0El0JEyfbKmvKFQ5WGI/Zf/02c6DpfqPtwV9cPCyp1J2W9P2yDZH/u+uS6xtsZr7aFt6zCbNShiB0/vsgOgWyc8DBPh8tKWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YCi1rjX1; arc=fail smtp.client-ip=52.101.196.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YCi1rjX1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vczSoavC6/+DnbyNOKdKse35Mg/L04zlrqwdg0d2egcAA/w6Xxo8Yr3FtZ/Vy3caCaWy0yMXZZvy1OLhnbAZ+BSmvMcX0LwQGRA7JisSgGdIua3DX1aAXLaQeOl39WN1Z9oRPvjRNuniOnMxiQx6vBMGZFflCqkRISK5eAnxLNT0cRjDHJVF1GeC6et8mITxn52f4W28lLyJ5Efk04FDdvnXQrEVcD5kMM53MdXIblk9fTSRYpZ+oCu5QlbMwlH3DERRLBI+JzlTRjmsVQePkFtQJzbFISjTxMUcSRtA8wmPUZPNQOu1m3+doRfz6WbVuLh3EvJZeffFHwBzvh1eOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcbZJYWAfF4eUgEtoqL0ZYgGVuFZipTOY/1R+A+8zHU=;
 b=gu31Se89xntA+3Lv2F5qsUNxUE9imUkaZG2tfx9C5FGgzMO/m2DdhxN9qH7O1wGcuXS1SeCd4iNfwBtj6IUQqMjE3zbYQBFjLBa0bZGCEz1Mlu0MDa7ak8cCliCg36ZIl0d3pl+BKLYDF6SSREHW4X7qQB9w+cfNHIm/VbCT/b25ApYsy1p2mUePmhTFM9EsCMxZP2lMmfJV9B5FmEIHd/eLY4w3x95A5Z3mpwohtgqVbnanhUzr+mxdTndiud81z0satLed6XYqZXhZoH3dnXfZNIlPVn0VPySqI80ROG1oTsIByRnvQ4pwSPsZSNIOFUc8IbkIAL3Ikg27sSUWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcbZJYWAfF4eUgEtoqL0ZYgGVuFZipTOY/1R+A+8zHU=;
 b=YCi1rjX1GrRcXgvvgOdqGr+rJUga935/1cjkAkWVDJdlQdMcC8y9carpL18HvGgPoZtq9zVGql4PiMDH7ALeBVgAaKRbN5EffWHqnS0AebMFQfOp4IvRPSDy7m5QLDiws5IJDoe9Mijpn5kb3PUC2kzzrpWcLZBDenVYPh0l3UI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6555.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 13:57:52 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 13:57:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 14:57:49 +0100
Message-Id: <DKFD0ZKHC2I8.19PUYUR6N6KFN@garyguo.net>
Cc: "Harry Yoo" <harry@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-next@vger.kernel.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Boqun Feng" <boqun@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: rust compile failure in next-20260730
From: "Gary Guo" <gary@garyguo.net>
To: "Nathan Chancellor" <nathan@kernel.org>, "Bert Karwatzki"
 <spasswolf@web.de>
X-Mailer: aerc 0.21.0
References: <20260731122826.737703-1-spasswolf@web.de>
 <20260731192522.GA1014697@ax162>
In-Reply-To: <20260731192522.GA1014697@ax162>
X-ClientProxiedBy: LO4P123CA0305.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::22) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d374c9c-472f-429d-77fd-08def16734dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|23010399003|366016|4143699003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	AIcI0Rb4e8QEpWFTJKYN7Ahk+Rf+lvGB5W5kgATROz0QTSbhddAKNCj1Bzait3w7ULFHdnwCUhjU8eDwlodcVEtJRVa/G//zSwElPMTiDLBkYq0FuNHpmm8M/nHimOSaV5qKGTQqeOnVtlNVVDeuVHZEKd7yPLzQp2J//YIFpIpUtl/Lfp9tdDRIoq6TCwISfPeDejC2239ieBYrMQ4PrDyVk8rXmYsE4LQBHCK1VBrWFYBL+FJe4SPxxfq2g+DKabZMIjU4Hk9V5oDPTPbCKp1g9iEMgbI42NNQgpafGItlZMzXD56GpX6CqVcKNH4IwLPpzVlBEmC56yl5Lbo8Qi1MH5wCIBcTiS0myu4KuK+yIzRio2FpPJyrSeGwpQV7Z5jVGk2xyRQO1R7Ln1dwO6iv2fh58TbOZoeM9fiSJlhf+AguzTE7iQc1amgldI8caiZD+EmkrdTQY4UYcHS8b/R0p0uOoG/USKRiO+EoBS+ViyJBjfwSvXbz8Enw3fK7iQ5bJp5awWXnOGeXBHmIYHKjDL5ck1QMUGBxY9G1aogn5VZsAY6FYMUevy5NA9UhSeFcJZAy/P4u2d2SAbTQOuqXTmE4u66nDpGjkuXMDHNbQK+LVfMYEZsbCbeN7ej8jL3OixBqZ4Gw79eK/A5DPnKzpsSzP1zWI6r655MTXrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(23010399003)(366016)(4143699003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1dYcE5qQmFWWk92ejVEWUlPd1orS2FnT042TDFtbE15VUR2WG54SFFTMC9Z?=
 =?utf-8?B?UzFuSzBPSENUcHhacFFYeDY3eVBsQllieEVFWG15QlZjeGFsWURBdWhkWXkz?=
 =?utf-8?B?bVFBMzBNdngybUNHbDczdk5aVG01eTIzREh6V3BUUmFydHNvUW9vQnNzaUdm?=
 =?utf-8?B?NGNiczFMOXhVdHlnNE45c0ZTeUtKN01hRmw0UE5Ed3pkN0JGdFBqdSs4UjFR?=
 =?utf-8?B?dTJCSldLcXltUkhEclZHMFNDWVpucWJia0N2dDJPWEhBc2NFVWdIbmZWYTZF?=
 =?utf-8?B?Z1BjcFJVdE5xWm92UWVBRSs1NHJKUk1EM0hmZHJGam9mZnZiZmdsc2tKMHFE?=
 =?utf-8?B?TTNIT1B1K2VpQ1pCRXppemlTZE0yNjNaZkp4Yi8yb0kwWHNHejZFbDhSWFhk?=
 =?utf-8?B?Q0M5SVJBRVVXZzFsRzdISi94YzdJTEtwMFQvakoyQ255TGM5c1lpUTUrRVBh?=
 =?utf-8?B?T2FJb3ZCcG9LU0tyakN0OGJNbmFsS0lyTU9nbHBVdE9ZWFd1dTFwVVRmZVVT?=
 =?utf-8?B?Qm4zRWlqUEdTZ2JFTmJDZHorbkl5dnR1WVZWVFc1ckZONlZsZlFBNzZCUGJy?=
 =?utf-8?B?S0RlRXd0UEd3ZUZzY2dHT1IyOWdXMG1XQ3ZmclNOekYwdkx5REFDNVlVN29M?=
 =?utf-8?B?cDNvNjRnL2tPYzhUNlNiZThiU290UHl6TVNvVG1xOWdqUWUrTE90YmM3emtU?=
 =?utf-8?B?SHgxOVlGNHc1WGNpUlhHODEvcE9KV0NSK2pkNkNHRUZLWTc1S1BTa1RTRzc1?=
 =?utf-8?B?NUJ6UXNvUkYwNGl0K2VnbWNOS2VlTnl5UlJHL1ljNzhvNkhiVm1IaTVmU0lj?=
 =?utf-8?B?bHNteDY5Y1M4YWxidCtqdXhPVkR6MlppK2ZvWjlWRjdzVEtQQkF0Ny80eUI0?=
 =?utf-8?B?ZVRCUVdnVFJ4M3VjUjBiMjFqNy9YeXhwS0tyWjhzZis2d2oyZmthMWFMZFp1?=
 =?utf-8?B?RThPMzU0WEloOVJIR282WG5KMGxacFlNaWxFdjdISEdmbVl0c24rM0F5bUI4?=
 =?utf-8?B?R01JRE5xdGFNbkRoVGtFa0REVDBSd3FuRnNHaVFJNjBXNWtSN2NmWC9zK2Yx?=
 =?utf-8?B?ajZ3bUROL3dWaGJnelF0c3NFbGY0d2ZHTzhJbTFuUHVFM25BbVhFZlJxNjcr?=
 =?utf-8?B?VWhxY2Qxc0ltUUlQZmJ2QWF6L1FLRUYzYk1UTU9hWGJHRXp4dUZyK1o0bXpG?=
 =?utf-8?B?a0ZEU1kxdEttOXRadFFPNlhja1BTT1NxeFpGaFNobVg0N2lPYjd4K0N6WVVo?=
 =?utf-8?B?ajM1WTZ6ZXVnMFNCTWtBMDJtK2hIcE9MdEZyK3NNY21EZUswNGlJNEJmVXVV?=
 =?utf-8?B?TDBRWWMydEEzK3hXeHpUTFoyRm04V29ydXJVL0pkV3ZSS3F2OU44NERLc2J2?=
 =?utf-8?B?RVJVL0J5bC9HQm1SUks3d3pkc1haRC9vQ0dRaWxVZmtQSXdYQ0lIOXdCd0xN?=
 =?utf-8?B?REZ4OUI1eU53aXhvNVc2VUlqc0NHOFVLVWRKL3crYTllR3FsdFdkOEwzOFZ1?=
 =?utf-8?B?YVN2WGd0aUxKVUZwZ1dJYTN4ZUdpcTc3SzR2YzA5ZUN0eE9ScDhRS0s3eDZm?=
 =?utf-8?B?UDYrRDBnek1ieTJvZmxjVmg2QkJZMi9XOFU1QlYxbjBhOE5EczdNNS9UTmhs?=
 =?utf-8?B?WUl4bHZzczNTTXV4YWdQK1ZINVFXWTJjeVlmeHllc0tpSU1oYWVBWGc5RkJw?=
 =?utf-8?B?dzdjZml5YkJBQlJadUp5dHA5RzVOWmlPUDZPYXp4YTZCcElhQWZ6b2dkZHdM?=
 =?utf-8?B?TjluU2RLMndrQmdmbm5CTXI4UzBtUlpxRDZBRVoxR3Z0dm9qWDZZRkoxc1E5?=
 =?utf-8?B?amI1S1d2S0N6R2ZQQnNmYTZZdmhTWjJXczA5S0VwZ0RQQk5yWFNDdGpSNldt?=
 =?utf-8?B?OTlJZlg1Zk9MQkxrUVhQOXZmREU5OGlzYUI4R3htd0o2SmhpV2xiRnBSelBs?=
 =?utf-8?B?T0k1K2ZaUXlqQ0E1Z203TVhHOUM5TG1KalBrYmljYTJyeGpxd0xVQWp5L1Q1?=
 =?utf-8?B?RmhjQmc4bVZxSnBqNEY4ZmRFdDBJbFplRTBTRFpJcGgzcFZWd3FUb1hPRXNz?=
 =?utf-8?B?UWg3eDhiaWF6WjF4Z1YzSjk4MWVBSWN4K2JaUDlOb1dCZHBPTUNGZXhlK0xV?=
 =?utf-8?B?dTB5WnhrbEsrUUxmc05lQnNwQUVtQXIwMzRhZFo5YUo4RE5jSGM4V2hSZnZB?=
 =?utf-8?B?UURtWTdwSFNiK29YMmwzV3l3QktxbUc5ZFBDeDRHUlJQdE0zQkVWQ3ZIQXZm?=
 =?utf-8?B?NkNDc2FsYXpKUnkwaHFVODhBdGJ4OVdPRis2b2F6bzBjUkxBYTdHcjQzVUEx?=
 =?utf-8?B?Vi96bW1PQW95bnZRWTUwUy9WT1ljUEFidXE4cWFZTVR2NStnOUo2Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d374c9c-472f-429d-77fd-08def16734dd
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 13:57:50.4947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXMc/UsKwRuKKr0ilPLdInf3kuGJJoMPa3IpnS/Cm/Oqk2xrP58txfgqDsAK4lKe4mf4sd8hT59HbQ+G+EfFDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6555

On Fri Jul 31, 2026 at 8:25 PM BST, Nathan Chancellor wrote:
> + folks from e5e86df8b666
>
> On Fri, Jul 31, 2026 at 02:28:25PM +0200, Bert Karwatzki wrote:
>> With next-20260730 building a kernel with CONFIG_RUST=3Dy fails with
>> the following error:
>>=20
>>  RUSTC L rust/kernel.o
>> error[E0308]: mismatched types
>>      --> rust/kernel/sync/poll.rs:175:44
>>       |
>>   175 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr=
.cast::<ffi::c_void>()) };
>>       |                  ------------------------- ^^^^^^^^^^^^^^^^ expe=
cted `*mut kvfree_rcu_head`, found `*mut callback_head`
>>       |                  |
>>       |                  arguments to this function are incorrect
>>       |
>>       =3D note: expected raw pointer `*mut bindings::kvfree_rcu_head`
>>                  found raw pointer `*mut bindings::callback_head`
>> note: function defined here
>>      --> /mnt/data/linux-forest/linux-next/rust/bindings/bindings_genera=
ted.rs:73708:12
>>       |
>> 73708 |     pub fn kvfree_call_rcu(head: *mut kvfree_rcu_head, ptr: *mut=
 ffi::c_void);
>>       |            ^^^^^^^^^^^^^^^
>>=20
>> error: aborting due to 1 previous error
>>=20
>> For more information about this error, try `rustc --explain E0308`.
>> make[5]: *** [rust/Makefile:781: rust/kernel.o] Fehler 1
>> make[4]: *** [Makefile:1420: prepare] Fehler 2
>> make[3]: *** [debian/rules:80: build-arch] Fehler 2
>>=20
>> Reverting the following commits:
>> ef32a74f8f6a ("mm/slab: introduce kfree_rcu_nolock()")
>> bdd0cc9f0ffc ("mm/slab: introduce struct kvfree_rcu_head for kvfree_rcu =
batching")
>>    =20
>> make the compilation work again.  =20
>
> This is a collision between commit e5e86df8b666 ("rust: poll: use
> kfree_rcu() for PollCondVar") in the char-misc tree and the
> aforementioned commit bdd0cc9f0ffc ("mm/slab: introduce struct
> kvfree_rcu_head for kvfree_rcu batching") in the slab tree.
>
> Something like this avoids the error for me but I am not sure if it is
> a proper fix.
>
> diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
> index 684dfa242b1a..5b12d5d4e9af 100644
> --- a/rust/kernel/sync/poll.rs
> +++ b/rust/kernel/sync/poll.rs
> @@ -124,6 +124,9 @@ pub struct PollCondVarBox {
>  struct PollCondVarBoxInner {
>      #[pin]
>      inner: PollCondVar,
> +    #[cfg(CONFIG_KVFREE_RCU_BATCHED)]
> +    rcu: Opaque<bindings::kvfree_rcu_head>,
> +    #[cfg(not(CONFIG_KVFREE_RCU_BATCHED))]
>      rcu: Opaque<bindings::callback_head>,

We could also unconditionally use `kvfree_rcu_head` here, and
add

    #[cfg(not(CONFIG_KVFREE_RCU_BATCHED))]
    pub type kvfree_rcu_head =3D callback_head;

to bindings.rs?

(Or even better, changing `#define` to `typedef` so bindgen takes care of
everything).

Best,
Gary

