Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021089.outbound.protection.outlook.com [52.101.95.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9435840963A
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549086; cv=fail; b=h3NglKejSqCAyh5ZP9I0msKP76q5m58fv+iy6SYvz21ajee9kPn1Mp5fH7DyGaqFjUcUioUjB38Yv5vvHPgzf4LA6QAJvPqyHTvnpJAkbKHXKH9rwCqC5C7o1MlXzdoIFRZ90s85m2YFLWWw+y/GuYof5UGEOFMCImc76KgC+cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549086; c=relaxed/simple;
	bh=yi1BS80yDWpAM6INvmjR05j8rQ1T0xYOdwyI9H2Np50=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dJ6w6mazRayIKWibEYxAznFQZjHvOHwq7iPT9TLE6DpoC2UlM2DGaVyrE8Knea37CqT/H8VUCdx4iBuZ/lucLbNS8o2DMk7Bjw6ltzc0yd09j6CtrXRJK+vtSsLJvmS1FJ3mn7b5ifEacdH42OgXV3FJiOhVygpnL125PbafxWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=uanq6KIo; arc=fail smtp.client-ip=52.101.95.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="uanq6KIo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h05wwiDRIr5ushF7puWavQIUDn7sVk2wi2dHL5LvWHMkgLPUI5/Ojm+ulXy1r8bLtCT9PX5/rY8fELDAxGCXFcYIliBDHRY6UXYQHesee/jVdTuMia0HXViqR83G3VxuzP1ETTd6JPnswjGYXjrj8m+DLMUCL9jKhIfBLR3ixaqsh7omzohV1jLlbXq6Kbid03ZLVTPyVSUKt0sLzxppufaFiO51Qas1W85zQp2t6mAQ7lSKh/joAsegBfmgA38uk7Pa/eu8O0FnDURpy3bvbSsYrSzRpecoaDjs5hDcN/znP1GYXwVU9aoYKIr8vjixI5uXdl3NUTboBhn8NFvBRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpzWJZDSmQsANCVX8qwXuirXpc3nOhf0IJ6As4XxjOU=;
 b=O7GrNBFXfgueil3F4PpXCxh5LkFXCIW4s/Lhi6h7VLG7Bf5i5DHwIEQfospp0pnWl58YWAh42dF1Z0ky3qfpeJi9K6M6DHFH+GlhL0Lis++TgJx6qvqL9/s1L5hdO9R8H4hFRO/zg4hXa1NHVopN+w4mQKYXoOFcI2Vi1OXr2wZ4wSSHl9vbaWio3LlXjA7YJpWsXRWCf4DTgmXwAS9yoOkbBHCo55xYBdBDUg5pK7iTkM7tnRoMbWS8OuK2tU10hfQSBk5wv+Zcp2b8KiNrrpYiOSz54FJJNyXc4Dm+Clw2/jnZi+Arl6CTt9P07SJRrD4QPu3kqr64qBcJr4omdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpzWJZDSmQsANCVX8qwXuirXpc3nOhf0IJ6As4XxjOU=;
 b=uanq6KIoRlV/n5crj/fGiU96rgZ1qA1I2rekSxZS6GaJxyWrMvObMRFhuZvBj6U7w8sgz/mH9RlS9pFwpS0pL0NCxkpiBCk3yH1duY5nzG10bUfoIj53cjCR5Y9zyzsfKYHdWQck9tfRdNzJ5Tw2LA1PDXXAtA1sI2r9TBbvweA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2703.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:146::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 12:04:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 12:04:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 13:04:40 +0100
Message-Id: <DK3DUPV7BIQD.2OCUGHIA583HB@garyguo.net>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>, <arve@android.com>,
 <boqun@kernel.org>, <brauner@kernel.org>, <cmllamas@google.com>,
 <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <tkjos@android.com>,
 <acourbot@nvidia.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3 2/2] rust: use Delta and a Jiffies newtype for
 timeouts and delays
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260717042247.3634961-1-tomo@flapping.org>
 <20260717042247.3634961-3-tomo@flapping.org>
 <DK1SRBA3315M.32N4T8QQBUOER@garyguo.net>
 <20260720.184751.938933263969124163.tomo@flapping.org>
In-Reply-To: <20260720.184751.938933263969124163.tomo@flapping.org>
X-ClientProxiedBy: LO4P302CA0024.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2703:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f065ff0-dd4b-48ca-fbbe-08dee657142c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|7416014|376014|1800799024|56012099006|4143699003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ql37IIJTTT6w18TT9ExKvbOfDRKJDtxMumq3jliGy+/Akof4N1nfAATYRvSRn35DMlGoMQCrl1XAIxmB0fGrnluu+ZspjpxjrjVGUysZOkbi7iJnOJ4Syk2loKrz+QGjKXIL74lyPthBj4G35CsCtI5xm+EB2Tulbjp3NC/gysc9vc4wjetDUzT28SG5lnbMb/Onjsoc7qDIb6BSzmNBPvJy60Fps6STYTJB0F3btWdPqph0kIK7baLhKukBcZeiQ9VYyEvlAwkE3vRp9FybiDTM5QBaBOdc7oWnWW98BTl5RllRsF6Cx/LJiN2wd2YKXLAWBqfmwsX9I1w9CRAjwMCBT897pRCebH4AsuyWQ0+MuRDfYDCXlYUfHlC2iNV+frMptxhvvqGSb8vKYjn9E/6HlIb8U9lT/bo0jlosTi6q34aDwKchfv9NRCpJMm1w6lzTTyzLbdSFAjdrWDv+H0DZg9luMCiUXTfpBTukv3cc79znYLjH9kOBJj7ZrKntCOmMru4byx2MPnlCTwnNTyMd5CmDFJjegnVptRW1jWRDO+1SCpsB0kF0XExo8/bXzKkOeSQgCSt+3lcr+6DB7ZweFHKc5bEyYk78QpbDvGKaDtybP4W7WLzvduTOM4kO5uqZCN+tkF27KxjWDm8z3j2KS0A9YJxWlQHO8OBmXq0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(7416014)(376014)(1800799024)(56012099006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU9wWE1xQ1I1YXh1VVBzV2Nqa09GWlUxc3FrajNSRm4yd2M4SURrRzFxejlz?=
 =?utf-8?B?SEZTbkgvY1dKS1E2eXFUUjExMUlKV0F2ZFM0bjE2VGxrYVpwVWppNS8vcWoy?=
 =?utf-8?B?SnB4MGJXUVFTZWxqb2pTZWxrNmhlMkJxd3ZEWEVydFV2UjJuTjg4WlN5V1c2?=
 =?utf-8?B?VEVqMmFqTzdGczc0V3NsakNZY3NaSWFHem4zV2lMMXlFVmp1MWU3ampkWWUw?=
 =?utf-8?B?U3A3MzVDdDBDRER4WVRXdis2WU9hVGVLSUJMRTNVOGptWnhZanpDWHozN3Fw?=
 =?utf-8?B?OVYxN3o0NnN2VitPUTNCOW9MM0dnei92YldZSnQvRGVwQnFCV0pxV0hSYXNQ?=
 =?utf-8?B?WC9vY21MQWh1VTJpTkhMdkY2OGxGWWVvOENBZ0U0WnVoNUVWWDdyTks5TmI3?=
 =?utf-8?B?ckI2a08weGZjcWxIUUFJRE5kaCtmWGtMN3BjKzZqU0Q2NzJYOHFQQjNWY0dv?=
 =?utf-8?B?d0RUS0RCQ3BQU2FOYlhDR2ZidVdLckFFcW1aOGcvS2lRcjBNRFhTNVJyemdu?=
 =?utf-8?B?dTJvamx4dWt2YXg3MFRUY0lyL01hUkd0UnVucUNFOTdZSERxcXMxcWFZaTlQ?=
 =?utf-8?B?Mmh1WUFiRVQ0RE1kTkpNbVY1Q0YwSDlMcW5uVEJTcndtaHRtTEVUZE1OR2RU?=
 =?utf-8?B?UktEMlRGWm1mak5DdXF2em15dnBtaWo3ajNuK0hMZnJuOUtFdWxQLy9ScGlM?=
 =?utf-8?B?RnNQc2QzbHhTTEhqMUVzZnRXaEtxbURpM2JEYThUQkxMVndVRGdJQzRFYVI2?=
 =?utf-8?B?MUZWdzJhWHZ1RzVoVWczRDREQ0dNL2ZGOVNybzlNZlFkSHJiRk0yZFF3dzRG?=
 =?utf-8?B?TFZBZDVXV3JQNkFKTnpnVXowam84YkkwbTJaNHM0ditCSlBkdUFhZXQ5S1Yy?=
 =?utf-8?B?R1RWcjh1RnY3Z09OMEtlWkhHRjMxd3hMTko2MnJNakJVcXJ6bUFqNVcwdE90?=
 =?utf-8?B?ZE1ZY0w2ZXB3bFp4RlEzSlZQNnE2bTJsaGZmNVpTY29UQmtVY2lmaERJZVhX?=
 =?utf-8?B?c3hoQSsyTGVtTW9jRjdTVGFCY1dmUjBweDNLaEh2TzI5Ti95WldiL1pWLyt4?=
 =?utf-8?B?emRNTXlDd2JxMHFkcjQxYmRscEJBNWxyVDRUaXF3UWxxVUdxVTVQZnZCWHRU?=
 =?utf-8?B?TlFrUitIVDBiRkdLazFsa2dCTi9KN3JWandyRUg0d0cvZ0NUSE5DQjBSRVFv?=
 =?utf-8?B?YzV5KzRQbzdFR0pLd0NSbTl2VlpDS0VySUtETkdtUDFUZHFyTlBjT1JmOVAw?=
 =?utf-8?B?bk5IUkV3bEVGd1pFQTB4N29IMUE1RE5zdENBRkd1aWNyV3crVEpQV0lhUlRj?=
 =?utf-8?B?MUhwWXVvd3N1UlE2YTFRMUZrbUtRMVdaSlFpOGN4MWN6d3p2VnJZcnNIMnVI?=
 =?utf-8?B?dUhSOHZXUlZHbStmMDZWTExrRzhUMzZpcFdJS2FxUVEySVlUUTlaeVRzZFNL?=
 =?utf-8?B?SnZjWHdiQUFCdWFjMFhYZUpkK05jUVROUTBjR0NpTnN0WGdqdE9SdTZUWkVG?=
 =?utf-8?B?bUhtOEVXOXlpUURxV0V4OUpQNWliaFlMN3NFT3RrQ0djMDJFVDJ5V21zSG4y?=
 =?utf-8?B?eHNtOHhJMnJzZnNGby9Bd2txYnBVZ1NaZVhVZFBhOUUrKy9TN1lTRVZvUXdr?=
 =?utf-8?B?WDNuWXFnLzJLNXR4MjRKcXlUU1o1WWtpVmpnOTNVVXh4Ynl0eXB0TytSczBa?=
 =?utf-8?B?ckJSNHNLZE5nM01RTVhpOWpRQWdpYzhBOCtOMW5HZ3p4bDZILzA4VVpaQ0Jj?=
 =?utf-8?B?ZkRHVlBvQ3I4RDdOeXhTRGVtYWhQZFJyYVpKdTRidXhxYWQ4VEl6aDIxOVho?=
 =?utf-8?B?cDMwZkdOOHVoT2MvdXJ5eW42ZGJBUTE0K3BVMVhvRXUyandqZ0ZXNjl6YXRn?=
 =?utf-8?B?ek1RdGo1SFBRZTJlc2lsaGNBcGI2M0NDM0dyS1hUMXhWSktDdy9jV2tKZ2VG?=
 =?utf-8?B?V1htdHJrR0IxQnArbm9QVEs0SDZvNU1TWXcwS2tsdTZaMWpjQWNGbDFIUDYy?=
 =?utf-8?B?Q09xV1pyaW4yNEY1L3kzL0hsR09NUFgyRUswK2NJMTkrYXBsQ2twdzZWTUVh?=
 =?utf-8?B?dmRjeEZMc0FvclVjeEl5ei8vUVAvdHg0am43aHhxczk1R3RNK0tMQXpUaDJa?=
 =?utf-8?B?MGdjQ0ZDQ2tXT0c0U2l0Q0UzY25xWkhnMHZFUnUzUW55SndteUxTdXlCN3F5?=
 =?utf-8?B?NEYvSmxqQWVMZVdvS2dUT0pWanEyTGphakF2Y2FpdUlicHNrNkR0RkdTY2Qv?=
 =?utf-8?B?Si9kbnVPeEpQMk9YWXZrVUo3V0E1S25oakpDNVhLZG9pM1NCTXNqNWdyRDBW?=
 =?utf-8?B?cHJKeEJqNzF3a0E5QTVZeFZNYzNhdEgybzNDVVRxZDdqT24rSExKdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f065ff0-dd4b-48ca-fbbe-08dee657142c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 12:04:40.9017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nimQMuM+oLY+LUaP2QUdjLubkJ+pwLpXmpb774YWRfct+SaGpEui7GlmeJOJ9QMhrZVrA0kNcsZqpXp2wApXkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2703

On Mon Jul 20, 2026 at 10:47 AM BST, FUJITA Tomonori wrote:
>>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>>> index 23ef5c77383f..206296b6b6ea 100644
>>> --- a/rust/kernel/time.rs
>>> +++ b/rust/kernel/time.rs
>>> @@ -40,17 +40,40 @@
>>>  pub const NSEC_PER_SEC: i64 =3D bindings::NSEC_PER_SEC as i64;
>>> =20
>>>  /// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
>>> -pub type Jiffies =3D crate::ffi::c_ulong;
>>> +#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord)]
>>> +pub struct Jiffies(crate::ffi::c_ulong);
>>=20
>> Hmm, I feel that we are again making the same mistake that we had for `k=
time_t`
>> abstraction, namely that we use the same type for instant and delta, alb=
eit this
>> time the measure unit is jiffies and not nanoseconds. The reason that si=
gned and
>> unsigned casts is needed in the above code basically is this.
>>=20
>> Arguably, your earlier version don't have this issue, but then we are
>> introducing costly divisions implicitly in many places which is bad for
>> different reason.
>
> Agreed.
>
>> I wonder if we should have time types being generic over units. So you c=
an have
>> `Delta<Nsec>` and `Delta<Jiffy>` and `Instant<Nsec>`, `Instant<Jiffy>`, =
with the
>> generic default being set to `Nsec`.
>>=20
>>     Delta::new(42) // Delta<Nsec>
>>     Delta::new_jiffies(42) // Delta<Jiffy>
>>=20
>> Thoughts?
>
> I think making Delta generic over the time unit makes sense; Delta
> <Nsec> and Delta<Jiffy>.
>
> However, I don't think making Instant generic over the time unit is a
> good idea, even though it clearly is for Delta.
>
> Instant is already generic over ClockSource, and jiffies is not a
> clock source: it has no clockid_t, it is read via get_jiffies_64()
> rather than ktime_get(), and it cannot be armed through hrtimer. That
> leaves two ways to force a jiffies Instant, both looks wrong:
>
> a) Add a second unit parameter, Instant<C, Unit>. But then the type
> admits meaningless combinations - there is no Instant<Monotonic,
> Jiffy> - and jiffies still has no ClockSource to put in the C slot, so
> (a) really collapses into (b).

We could split the `ClockSource` trait to be a generic `ClockSource` that
supports everything and a `HrClockSource` that provides ID.

>
> b) Make jiffies a fake ClockSource. But ClockSource::ID is passed
> straight to hrtimer_setup(), so a fabricated clockid_t would make
> HrTimer over jiffies type-check even though there is no corresponding
> C operation.
>
> This matches the C world: for deltas, jiffy and nsec interconvert
> (nsecs_to_jiffies() and friends), which is exactly what Delta<Unit>
> with conversions models. But the jiffies counter and ktime_get()
> values are never mixed - there isn't even an API to compare or convert
> between them - so there is no unit-generic notion of an instant to
> represent. A jiffies point in time, should be its own concrete type
> rather than a specialization of Instant.

Well, `Instant` never inter-converts with anything, so a `Instant<Jiffies>`
would be fine too. That said, we can delay making the change until we have =
a
user that needs to get jiffies count. So far it seems that people just use =
it as
a delta only.
>
>
>>> -/// The millisecond time unit.
>>> -pub type Msecs =3D crate::ffi::c_uint;
>>> +impl Jiffies {
>>> +    /// A jiffies value of zero.
>>> +    pub const ZERO: Self =3D Self(0);
>>> =20
>>> -/// Converts milliseconds to jiffies.
>>> -#[inline]
>>> -pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
>>> -    // SAFETY: The `__msecs_to_jiffies` function is always safe to cal=
l no
>>> -    // matter what the argument is.
>>> -    unsafe { bindings::__msecs_to_jiffies(msecs) }
>>> +    /// Create a new [`Jiffies`] from the C side's `jiffies` value.
>>> +    #[inline]
>>> +    pub const fn new(jiffies: crate::ffi::c_ulong) -> Self {
>>=20
>> Given that this is a public API not just for binding code, I think it's =
better
>> to use `usize`.
>
> Good point, I'll use usize.
>
>
>> This function can be `pub`.
>>=20
>>> +    #[inline]
>>> +    pub(crate) const fn as_raw(self) -> crate::ffi::c_ulong {
>>> +        self.0
>>> +    }
>>> +
>
> I'd prefer to keep this pub(crate) until there's an in-tree user,
> following the usual practice of not exposing public API without a
> user. Also, if we do make it pub, it should return usize rather than
> ffi::c_ulong, to stay consistent with the constructor change above. Do
> you have a specific use case in mind that needs it public?

I think knowing how many jiffies are there in a `Delta<Jiffy>` is a reasona=
ble
need while getting a raw pointer type from other abstractions are more
suspicious for drivers.

Best,
Gary
