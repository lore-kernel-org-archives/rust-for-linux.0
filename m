Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022079.outbound.protection.outlook.com [52.101.101.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2847528446;
	Thu, 15 Oct 2026 14:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073434; cv=fail; b=k7LgAIqd+Yk0Jdr2PgkiUTj2QISp8VM6BuFcz961MLBw3FDLqYgK66TKOSDYQvIbDbKw++lrxrIiUmBPmDjkZe90BAQiWHTyFo5HmqYCWWIxHdzlq7TFBy1aoN4lbvKEqM2KNQpTW43tvtSw+cEFGrenG+E1vTkqIMLf7W6je0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073434; c=relaxed/simple;
	bh=tUgt7GFyXM1NfQG9WrghusKJC3pvJ/6ifkX+TVFFaEY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=VcpKhErec6/c67myxEipnjYmy09kxLRrCWq3wdnlWH/gvXHgGu+ftX0fE/yloX/a6SCOWYO8Ux5IjzQSjwMv8dHGQmPCiIf8fkQ62bWU2dVob8r3vELtxE703rn3y/A2KA6EYsFragxrVXmVqXocX7oyQwLOONxOP91ogSPrSiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iBYVup9j; arc=fail smtp.client-ip=52.101.101.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iBYVup9j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBcibxHy7v9vUcZ6YLCTy3W+VEIBZLyrYQ8b+DJnuqSq+svLka4wp0+pFaDlZCpGbkBlUpruW3WRr5PaqyyeltIjMQLXDpn8RGpJ1S8JMriS77rSjXs0KgZSw9BFnkHQM0aOnu+F6MsjU9l7GSpraH9/AddbQKKm+YxDY/HcQKzwSuJE0Mrc4rIWqh555V3D4Q7DwdalJE2+f3ly6Bhv5WOWr6jj47KtMHEJJaYPhNBLBoa16flWVfSrJAy7i3aMO5CZR4htzGKli7c8U80MTQJmOYNJC859izyQSDb7fdx5BAXTGSZOUTyvMJlt+3qEck92g1kMpCFtCPKcJ0bV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6t55T9+imPKoD83wGMiI5//sBJPii+ggW2LhHQwT/2A=;
 b=a0T+VYLt67Rjf9zbAq1OF1XcwwQvIAT2rkfDAy27sbWnbkDgNCjMC8nMUZP76iE32X2g9VONSXv3q831DmcfIEr784F34OaVyO65XO7vXq/KgvlshjO2BP5jmMH2Ehbvo1xruKYpJaqgtdPbK6acbRtLXsb+72j0KXRwElA+EBSWwNcca9O58y9DU1qmF1Kp+bWc8EBbkWKls4JSP61hP+ehtNjmPmr5t89dDIaBFQMXRWaYDb8w3oPbBFwk1LoUcwqYQ0uMU9n93sK3MWZR7Uh+kNEuLAhSj/QocW+MKKR7jfmPthW2+wRxiJvNxQbrx2nSb7ZNscE2JS3YlshknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6t55T9+imPKoD83wGMiI5//sBJPii+ggW2LhHQwT/2A=;
 b=iBYVup9j9MyQaH8uLV7BcPmjWwqNaB+njXqrGaxthD9v1CCT2wPGz6/OvmcedkARtRIjcZZHhdBKL/5kOdp19KdYnpFR+BpfdGqjQV8Pav8LzNgLvTUTbIr+l/eHp+lg80y5IPQbAqscKtvexJmzUdN6dMVcxhg43SWJeRc9A38=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB1780.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:53::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 14:10:28 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 14:10:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 15:10:27 +0100
Message-Id: <DM5H0FD92X8A.1FVNQST4ZTW0R@garyguo.net>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Gary Guo"
 <gary@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <lossin@kernel.org>,
 <lyude@redhat.com>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <dakr@kernel.org>, <peterz@infradead.org>,
 <mingo@redhat.com>, <will@kernel.org>, <longman@redhat.com>,
 <felipe_life@live.com>, <daniel@sedlak.dev>,
 <daniel.almeida@collabora.com>, <thomas.hellstrom@linux.intel.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 4/6] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <cover.1791799751.git.work@onurozkan.dev>
 <36bddd73ca29658a7d01c5a3f3a19ab13477235a.1791799752.git.work@onurozkan.dev> <DM2TYBTREPLQ.XJ06PWPOXG4H@garyguo.net> <20261015121356.127765-1-work@onurozkan.dev>
In-Reply-To: <20261015121356.127765-1-work@onurozkan.dev>
X-ClientProxiedBy: LO4P123CA0100.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::15) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB1780:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a7277b-cff9-4682-27e0-08df2ac610fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10070799003|56012099006|4143699003|10067099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FXla8ke1vc9OAbmK1uJzRTmU6wfu43TBCNX3jJ8B77LNmFq63r/VRYBBK3Y2rWTjhpy1P1TAHRrAhkDhonD1GgmECjJtrlYCocy+lBWIUktLDm5emwHLhYup+WhceTAS3mQUHUjFduwBBt0P+t2NUik3wXHoi21qEa0IAKkoSf+JCtmGXq6z/SjMfu9teqYm8Z8+lpjOx8Q4LQxDen/zHNe68hVdG/wQtmlR6aS9WpN+0SHQOSE6cCX2D6eBiPd6gLKwv6V4DqxNg9K4hUgGssRC9pAxXkwvTCHSghF0TSGLEflbSoIp8mApNd7MZ8ngSQNL0yJ6hEAeQN3qp4mFwwIiHZqjfzfB8Npe+Xv+XfX1ZUJdSyLUD6PI1C8iyhJdY/6dEEtsHLZCZs3m7PVqkdgsxYvzoVrRCytH4VNBWUX0tXYyZ2CsiJj+BvkaNiWYpLoJnkn2cretigJGAgEM7yYuAmAwuGVAKCckEi8Gm7xdrGrp8VKQVRYVy6fy3SrObjAhx2Kkqc49uq7F81ytzm2y7NAJYl6h2lLFdZbq+/3s+kqyOM8IqPVmH0yryb65w1I0UqehA9Rh0OkJbdJkAI151VOC2ByWojfe/trAUCSd9Bgp1T3/VbeCCHd4uBdw/Qw4mDk60TiTDgeuzfdYEKAUOoxRhI9iR1QZnOlJRmo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10070799003)(56012099006)(4143699003)(10067099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWJrUXFSYzFzQkQwenRSV1Fvc3NzcTlub0JTd1M1dU5CS0pHMnlMZEhldjZa?=
 =?utf-8?B?K1Awcng2UklubCtsSmZ2VXlJNGFVdkllbHBocERDMGZ4VGVQYzQvZVNJRDBz?=
 =?utf-8?B?Q2g1cHcwTkt5bURldzFUUXpWUjRpZDFvN0oxb0xweXpTQXdWVHNVakg2Q0tD?=
 =?utf-8?B?d2w2V1E4WE55OHpoRUtGM2JvNW1FZnZkeDBmT1RpendTRWRkNm42S0FYQ2dH?=
 =?utf-8?B?UmVCb0Z6bW9EVGlyZ1oxSGJ4YUQwam1lT2t5dHNObHFaKzBYODh5ODhVZ09C?=
 =?utf-8?B?c1BMS0UxYWNoT1BPMjlpUWRvYmg2MnBaUnNBWUxpZ2YyYm1ZQnFVWHdaZGNB?=
 =?utf-8?B?U2dPSW90SzAzWi80TGNNZ0pNWWdjeDB6TWIwbG1uWUVzdyt1ZGN6QlVlM0dj?=
 =?utf-8?B?WWx6ZXdMeDYxb3AzQVhYMXM5M3JwbE0ySFp0elhUVUtnaEo1S3E5TWNtU3Uy?=
 =?utf-8?B?ZTBudjhIZDgxRCt5eVBYK2tZRWwyUTBsRnV1UzVLVzJYWFdsaklFRkl5SWpB?=
 =?utf-8?B?TDMrc013TDBpNVNSb1plbGpXSnFXN3NjVVE0RWp6L2NQUlZRZTZJRmxYNG9Z?=
 =?utf-8?B?YlpHZzVWK1FGZDZPWTVCWGZWRHptVXhJQ3B1N3hOL3UwU1pLQlUwaEdoaU1I?=
 =?utf-8?B?ekZjQXJEVnZQOWxPN1ZHbWNnd05JbFp1M0VMS3VyaVFLN2ZCbU0vcWpMSCtk?=
 =?utf-8?B?UzJyRHVHZ0p6TTFTZ1lPaFZucmZRUTEyTUpLN3B1VWpIVWNld1ZVekhwaWlR?=
 =?utf-8?B?Und3NEZUTUpBejBaU1JLTEJraUIzQmpIMTFjZUxleFhaaGxWcFZsSnRHeUxh?=
 =?utf-8?B?QUFOb05ZcVVGNURDYkNqZHRCZWVkZDBzaUdLRFlKUnNpK0hoQW1aaGluODZq?=
 =?utf-8?B?dXFldEtoM0FjUjduWjJNS3R4c1pCaGo1UXU2aGpJazlMS0VGNVVIcTMwZGN4?=
 =?utf-8?B?Y1VaaTZrR3pVL29xemlQNFMxSGZrNkxPM2JKcXdSWDhrK2c0SEtoclg4ZjMr?=
 =?utf-8?B?cFNManZRb2dBSUdkRHpQN3V0OXJJQTVuRnpTdE80ejhXWTZkS2J1UzBpZTFh?=
 =?utf-8?B?dnNsWHRETXZtTTZhQjFydXArUnNDSDA4V3dSR3VsblFFQ3JKQlF0WlJRbFZE?=
 =?utf-8?B?eWdva0YzTnRseDFmbXE3MThOVTRuUHlhMzBsLzdocVllRXhjdjlMTmQ1ak0x?=
 =?utf-8?B?R1o4ekFxUXpFOVVFQVE3NEkvckF4MkhUaVZzalMrWkpSTGxGWWJpaUFkM2p2?=
 =?utf-8?B?NXV3MGRTbWt0bWRacXJFK0E1TCtFVVBuK1NzOVJSVVpSQVIyeDA2Zm9mOEQz?=
 =?utf-8?B?RjkxQ1IybDNaNGdoSWp2enZDMHV5UFJ4UzRDQWZTUGh3RTJxWnIrWEx0cnoz?=
 =?utf-8?B?blN0ZEdVSXNjcW9BMkpZQzBjYkZVVmNkUStzOEdtZE9TRXI3OWN2VmJqQ1do?=
 =?utf-8?B?d1RaTFJtU1NwWUtpVXJjZ2xjaytmcE9PQldMclRseVRCblpZYUU5SHBnNVZH?=
 =?utf-8?B?dUtLWDAzS2t0NCtPQWtMaTlKd25tUVlHazQwelJ6dEp4cjZkWEQ2Y2Q2bHly?=
 =?utf-8?B?VGlPNk1jZ2V5Qm5vbHJjTGFwSm0wV1ZYcHVqc0l2UU80K2xReGZkUVhKOWR0?=
 =?utf-8?B?amJ1UW5kWDJYRzBqblF1Tm1QMFo0WWwxUW9uUGd1K0hRUzZQYjZpcWdEUlpU?=
 =?utf-8?B?NjkvN1A0QUZNVXdmcHZoL01EWURucDNhSi84a2E3NFptQklnWWJHQkVDVkpt?=
 =?utf-8?B?Z28xZVRIS2hOZVVBbjduSHhQTXk2TzFPdjYxRFo2NDRCUUlKT3p5K21RaHhJ?=
 =?utf-8?B?YzZsUitYYjBMaDBDUWt6dnhoL1ZoYWdmVmo0ZlJKTlBvdmNrVmwyVmdnNFNs?=
 =?utf-8?B?R0VXRnVyZFlFT3pFaXlCVjF4WXRKbW02MUUxNHBHVmRKTHZpL01jMDNsS3Fq?=
 =?utf-8?B?akRmUElNWmkrR0tLQ3ZlLzNJakRWOG9sZTFaYXFHUUpUcVV1cGRhQnVYSHpp?=
 =?utf-8?B?d1VVLzVOYmpKcnZDREdHTGtUZWIrS2RVdzNDVFJGSyt6Yzh2eU5UaGhOYnVQ?=
 =?utf-8?B?OFZRZHY1QUg3ek5aRzZnMkRET2pydVI5eEFLdUdSOHBlMUhOTGFzeGlFZWEz?=
 =?utf-8?B?NVRGWFNNMDErZmY2d2E3QStRN294RTNyZFVlbXo1eTBaL0tsNytXZTdPR0Jq?=
 =?utf-8?B?SWlza1pzRlo4L1BjeW11ajluWkpVN0orS0NHRWdRUEd3K2xueWNxQjg2eEVD?=
 =?utf-8?B?anZoYkVvRW00MGViVTdTdTkyVmI4TFpqK1ZzUjY0ZGFXZUxoSjkwNnc4WWlH?=
 =?utf-8?B?eVIrZCtxdTFOTHpMbE5NaVFSdXVIMmxNRnd1VUhUdm15OWdFTi9VZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a7277b-cff9-4682-27e0-08df2ac610fd
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:10:28.7495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwdouaWXRmYXUkm6+7jC+PsPxVkBuoWgDuFl/T+J7WQR1P99865ObMy7B8XFMWkhpA1fkgfEjbyX2gCEB81asw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1780

On Thu Oct 15, 2026 at 1:13 PM BST, Onur =C3=96zkan wrote:
>> > +
>> > +    /// Similar to [`Self::lock`], but can be interrupted by signals.
>> > +    ///
>> > +    /// # Safety
>> > +    ///
>> > +    /// The same requirements as [`Self::lock`] apply.
>> > +    pub unsafe fn lock_interruptible<'a, T>(
>> > +        &'a self,
>> > +        mutex: &'a Mutex<'a, T>,
>> > +    ) -> Result<MutexGuard<'a, T>> {
>> > +        lock_common(mutex, Some(self), LockKind::Interruptible)
>> > +    }
>> > +
>> > +    /// Tries to lock the [`Mutex`] on this [`AcquireCtx`] without bl=
ocking.
>> > +    ///
>> > +    /// Unlike [`Self::lock`], no deadlock handling is performed.
>> > +    ///
>> > +    /// # Safety
>> > +    ///
>> > +    /// The same requirements as [`Self::lock`] apply.
>> > +    pub unsafe fn try_lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) =
-> Result<MutexGuard<'a, T>> {
>> > +        lock_common(mutex, Some(self), LockKind::Try)
>> > +    }
>> > +}
>> > +
>> > +#[pinned_drop]
>> > +impl PinnedDrop for AcquireCtx<'_> {
>> > +    fn drop(self: Pin<&mut Self>) {
>>=20
>> I wonder if we can just do
>>=20
>>     let acquired =3D unsafe { (*self.inner.get()).acquired };
>>     assert!(!acquired);
>>=20
>> to get rid of the `unsafe`. Somewhat similar to what we do with srcu. Of=
 course,
>> ultimately we want to use `!Leak` for this and can remove the check.
>
> I didn't understand this. You also wrote an unsafe code?

Sorry, I meant to get rid of "unsafe" for `lock`/`try_lock` APIs, because b=
y
adding the assertion we don't have to worry about leaked guards.

Best,
Gary

