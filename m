Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022078.outbound.protection.outlook.com [52.101.96.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AF32C3251
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089137; cv=fail; b=OySbwFu0sXyzDqXIfFmygEuf3zEnMSbtUI3sv91zrTyonixBqEp1IrKco00IC8fLh/3AAcAGGWsBFqWft3oRNli9asGY2L12TiJz7ReVNp2FTO5RwrI2NdXrVmJof58fDQa3+zWKiuHYTJkrzw3J40VvbzRpHxRPkBRUUCWCI14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089137; c=relaxed/simple;
	bh=lITQYwo9ZQ04oewruoUlOFoe/z83bUE/VgdHSO706wo=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=B2QUkv9oW1gNESNObRP2rVifmehm3Br5c48FwKR5STWdUx5mATXHJLDaZ9Hv6QM5Z2UIKD/RgwtJZ11noKjFz2Jg89ZRSo9YlgrrT4ci4ZPDK2jeKZFBo/VjIT2jgQhLizwXHYUIxam0MiSmPk/wT4IcgliLMqIzBNnpR3ccR6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mpj0kH8A; arc=fail smtp.client-ip=52.101.96.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mpj0kH8A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q99V3AV3Ifvm0cgGyuc3OCArYgTbbnUeAiVRrmv3xADasN3UOtbgwPaI091RbcxUi6O3T4v1lrao8wdsUbYYkhyGkLGi8dI0m2YTgsVkDC9VQO2srE48WcqI7Ci0hTWK6rqtdmojsUFwgm1T0GJY1tlO9dtTrOiAmtPVHW6+GXWY6tVPWQo1pJKHMDtZujVyznC/aIYarwl6t7B9VSpaNKJTb4UlDwXN76jOzqZPjHySTTE/AniEnwebccgaq9CcUCWBgMvITmhECtL4HVJmwsMgsQ+B9cY1jdpV5XEQJyUJLw/ObZNRYCnMKTxzZRiIhL0OrU8pMmEtTHoqhE85DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJrZ3225ljtsX20XPMmmpqLQOatnmsVES2/6/us2OiQ=;
 b=yKaPvDf9fc5uBG/OQVGJpJhjUOvXvBw247lxVtGPWahdB5hQx0w48eCSASSwWLX4xFz1QihMYJHdrVd8L9I1PUZy69qyekLsZnDKa3DTjh+YloWPBT7GF8YP9wCOSJUT7CY7Q1WtLKaSDTDTqRpLfrsnu2S4RpArcucrzWNM+BPD9kREAcO1fQHPxWxfb/mMMwtJkoX2deZOOmGanKKuHxIBh+Ur+pLtwGVRZFL51H6olyJ8A6MEZ0D885YuFTYB5M0zJNlxUhnSAw1gK1CgDBXarSxeoYKt/efsCf/zyhH6RvtdKX4uwsHno6+pD9fO2u9kJCfRiSv8f7Ec+yZH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJrZ3225ljtsX20XPMmmpqLQOatnmsVES2/6/us2OiQ=;
 b=mpj0kH8A1nbfCPxuDAHoYhKFfQgIPUK2MpyUUetXwkhGAwp9+TyDI9AHAIP+J3QO/4x2GT/pUZIvMMJv7Ra5ROhMfqQk3emZ+Bjj3UU3wmlS3aMY0xlwx35dvPV1Kf57y6qVWNOEzJLM/IhuSucUuGMkCpx/wAd7d18pYVa4yhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8945.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:490::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 14:32:09 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 14:32:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 15:32:09 +0100
Message-Id: <DJP0CDOR98N5.29BK8PUFRWRUK@garyguo.net>
Subject: Re: [PATCH RFC 1/2] rust: sync: introduce a way to create lock
 class from caller
From: "Gary Guo" <gary@garyguo.net>
To: <sashiko-reviews@lists.linux.dev>, "Gary Guo" <gary@garyguo.net>
Cc: <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
 <20260703-rust_lockdep-v1-1-1c21c62d0341@garyguo.net>
 <20260703140125.0E9F71F000E9@smtp.kernel.org>
In-Reply-To: <20260703140125.0E9F71F000E9@smtp.kernel.org>
X-ClientProxiedBy: LO4P265CA0313.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8945:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c9a45d-ced6-439d-c169-08ded90fdd7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|6133799003|4143699003|18002099003|56012099006|5023799004|22082099003;
X-Microsoft-Antispam-Message-Info:
	c2L966BVegK5SiiB1cWMQ6PTM9SnLjzGoMxSfOZ8or0C4Y3fwuaj6nSBl6s/PMzT4X5K3cx7LB/UNd5el11l7cgMG/rAzOKoEnnz+08E6MRVWkBwZhBp+RIVj0O9hR3lrDjD+LMXbgF/NrLMsx6A5p0eNZq1vRro0gB4ZkCr9FAzJTVmoqVo1KCnmvTFDuKWs1VIPSlKwFwTPeBn7VwxwtpeF/FG3hZ1zGIlTxCJoxUzh6vc4nlHh6K8izho6d7lKTjngaxaDVoxOPMH3pv8emEVfKX8c3MqRXmTFYjkD6NjRxaZu2lvfAitplJoJrsdVKNtf1kqmPzPe6GRto1hHvTd36+GE+/ccEgX8lg6eUyKT/5gX7mak3DHFkkQDsGkivybIj2TtpofG22C8KSMX/hU+fLTYgJOHxXN1NxN/ctaAjmfcnsTP9Y7TRdKi0xZaIkYq4+cQG35VUuHOKZ2NLe0k76WnJ69JcuoC2o8Q5FlVVMmZmH1FgenxSsqasU+cf3+AsBmNjSqN7FDZWGkWFBDJVHkY9yImW/rBz3vZcEnOoiIpIa5odyva7V2E5jEKXRWqS0zRVzdrYHU9PDxfP769avEwTiP5r4oiJQJ/fRhuqajfBqFdMjjZ621VeXA6CNT0OeZz2P4W37Rpx0Gh/ANKiHIXTXSMUjktfffMBs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(6133799003)(4143699003)(18002099003)(56012099006)(5023799004)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amYxclFwZTlFMUVCN2MyTCszYXR0ZDlFdlRRZGNHT1AwbFU5UEVtTXJxQXVB?=
 =?utf-8?B?NkFGMEd5ZkNBNTA2clBleEpoaDBxeEdoZkpQU21QdU0zdjluY3d3M0haQ0p1?=
 =?utf-8?B?RkJZb0tLNDNseFFvd0hXSE43emVIRHFZOU11V0dybUFUOFhEMzFiMzRnNGZu?=
 =?utf-8?B?VzlYcTFJMWdXLzhxeERzbk44dmthdHBmK1pRZWQyMlR1SlFtU3VnWS9jV3RM?=
 =?utf-8?B?Z200OGFqS2hlZVhWN2dzYk4ySXJpd3d0c3UxK0JpRzU0RHVGTFBwU3NQMjFU?=
 =?utf-8?B?dlpoRWFuREhZaC9lRHphWmNKakU0dXpxNDJHV05NelRqVGJRWVZzdko1RHJm?=
 =?utf-8?B?VzVBNGlncFpzbmNZWmxqbXBjazhxZ1BVZ21SMk5JL21vVURsUWlIUmQ4c2hw?=
 =?utf-8?B?RlBvWG01SjR3a0o0Qm1udU1YUDA4amNaRFdZUmJRRkVIVnJYSDZDYkhGaStt?=
 =?utf-8?B?NUlLQnNZd0g0U0xsa0RyWVlKcit2cHY1VUZ0cndwQXF6cFNnQnplVlZTeWU1?=
 =?utf-8?B?eE13RW5DaVB4VWJRTnB5UndQWHMrMUJoMGl5SS8zaWk4dkVLRk1XVE4rMnNk?=
 =?utf-8?B?blh0MlZ0WTBmTUo5NTJGN05HUnl6OG5xM3c5TXFwdFFMaU40MGxjbHdIckRM?=
 =?utf-8?B?Wk5pdnBCQkJFWDlLMThoUUNPNGVMejhBK2czdE03ekQyZ0RsQ3Y5TUhhNGZi?=
 =?utf-8?B?b1gwUEkzWEpzR1l4KzRqK3dkc0ZMcFIvdTltWUVTL3AxVklnL0VOQ3ljWmR1?=
 =?utf-8?B?UXdvbDQ1RlZWMUtuVjR5QlBHUllUeDQ5YmhVUW9RRVkzK054MVlyaHd4WmZZ?=
 =?utf-8?B?LzlQWnE1YWZsSlNqOGtEQ2VZd0RxNGZqVEI3NjkwME9kQS9tbDZGaUdvWDNv?=
 =?utf-8?B?QjdTTnEyRzFNZHJzVlZNaGxzejlucVBRK29MdFVzK3hxNkMyTnZnc1dqaXZQ?=
 =?utf-8?B?M3M4OFZQUW1OYnRFUExhWGc5bVNnemN3dHZXRWRvMzBVUXZCLzc5eFp3RERn?=
 =?utf-8?B?a0JnbnFyZU8rbEtnMVRRcmxIeXdDWkZGMW50bmU4dzRFbFB2NWZJeGY1ZUVy?=
 =?utf-8?B?M0Y0YmVWTTFWVFd0eWI4c2xBdHlnamRjSXYrc1FDT1VlcWVPOWpkSjZWdEhw?=
 =?utf-8?B?WXpiM2tvSDZKQzVHWmNkQ2hEd1lYVWNqNjJCcnBOYlB0ZHpYYU9sazNZd2V4?=
 =?utf-8?B?MnAvN210c25OOUhoR1NFY09tcjR3MEFCa2liWGpvaFNPd2hESTI3bm1vMUlp?=
 =?utf-8?B?TEZsZjZmQWU2MWtUd1RYT2V6YXhvZEE4MmpoYkZqQVhiSkNDNGI0M0pLc3Fs?=
 =?utf-8?B?VEgxRWZibW1Qa2dCbCtnWjZ5YktoTnNvMHduVVBSSzRsN3BHcjY1MGhIOHpD?=
 =?utf-8?B?ZkF6bGlENUVLVXJ1ZVdFWTFlTTR2a2pjajN1TUtCTXR5Zk10TEVKTmdhYTcr?=
 =?utf-8?B?UHRlczRFV051VHozMFc4dzZnajhRN0FwRnI3N2huVHdYL1l6Szk4Z2ZSQmJ1?=
 =?utf-8?B?NjRmT216RkhuMFc1LzNpUU1uWmo2UDJqZk5vbHVNOGQwSGNmbE5sZEZSTlRG?=
 =?utf-8?B?czJrbVpSMHM0QzllQ1hvZnNqZ1JQZEo5QWNOSDhveHNPZnE2VGRZTkFHOWVu?=
 =?utf-8?B?TE9nUS9aRms3OEMyK1pWa2hvQXBvK3VWcGVzVkYxUlB0bjJOc0xPZXNpYjVM?=
 =?utf-8?B?QlBQWHZkRVFSd25sU0doWk10K25ocmNnNjVONnFGUU9reDhjQWhsaCtzSHpJ?=
 =?utf-8?B?QzJlOTR6WTRhbldyT3V5dXBpd20vMzhVdlFrZ0w0THYvTHF3TkRLQWx6Z25k?=
 =?utf-8?B?TzlHZ0RUY0E1SEhOamtqOU5HekpkYlpkSlcrU29qcWRFT05oSmltaGVaTXkw?=
 =?utf-8?B?TC9xTUxhdjhUQTN4c0t3ZDlGanRLM3VyNWNMeFM5bnFZcjVJRlZzRGVGVlNH?=
 =?utf-8?B?R3gwYXFOcDFIcUlIc1VUN1VRb0NQYmVVYnl5VWVHNDl3QUZlUXQ5bkRtK0FY?=
 =?utf-8?B?aEsxMkRKMGVFcy9UK1R2MFFaNWZMQlZsdmtPVXM5ajZoSEIxNThpaGExUm9I?=
 =?utf-8?B?SW56UnJ4T3hiT2liUDVBYUVBeXJMMXVQNGh2MU8yU1BrN2VaWDNJN0pQRTlB?=
 =?utf-8?B?ZVIwUTA4SGh4aFlJZnZhN1EzaTVaZVF6YmhVTVNUQktQSkFvUXJEVDBiWldz?=
 =?utf-8?B?YkNEWmdTZTBTckIyR0F3RnV4NnJsVzd4UTFzSFdlSlpvZCtHdEdTWW1wRzE3?=
 =?utf-8?B?TisrV2o1cFBxRDkzQ1pmS2Z2amlJdkY4M3FwWkFxdi9POFQwN0RXeEVlekp4?=
 =?utf-8?B?RGwzSTFIMUc4OVQ4Si9lR0x3bjNMUUtNZDVDTEdKWWVIZ0FDbHljQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c9a45d-ced6-439d-c169-08ded90fdd7f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:32:09.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGpuQ7IOfg17KBOyma8OZo6rTThLTy7TDpqsr6MAVffDDclpbB4oGj/7P5gJDdtdYzs7U05094RMmsWtq8TGAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8945

On Fri Jul 3, 2026 at 3:01 PM BST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Creating a reference with interior mutability (`UnsafeCell`) fro=
m a read-only reference without interior mutability is Undefined Behavior.
> - [High] Distinct locks initialized within the same macro expansion will =
incorrectly share the same lock class, causing false positive deadlock repo=
rts.
> - [Medium] The `#[track_caller]` attribute unconditionally generates `Loc=
ation` statics even when `CONFIG_LOCKDEP` is disabled, defeating the stated=
 intent.
> --
>
> commit dd5e5262e2385533a2fc8caffa1b94a916bed484
> Author: Gary Guo <gary@garyguo.net>
>
> rust: sync: introduce a way to create lock class from caller
>
> This patch introduces a mechanism to implicitly create lock classes using
> Rust's track_caller feature. It adds LockClassKey::from_caller to generat=
e a
> unique lock class key from the caller's location, simplifying lock
> initialization by removing the need for macros.
>
>> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
>> --- a/rust/kernel/sync.rs
>> +++ b/rust/kernel/sync.rs
>
> [ ... ]
>
>> @@ -66,6 +70,31 @@ impl LockClassKey {
>> +    #[inline]
>> +    #[track_caller]
>> +    pub const fn from_caller() -> Pin<&'static Self> {
>
> [Severity: Medium]
> Since the track_caller attribute unconditionally forces the caller to gen=
erate
> and pass a Location static, does this defeat the intent of the branch bel=
ow
> that avoids generating Location when CONFIG_LOCKDEP is disabled?

Not true.

>
> Could this use cfg_attr(CONFIG_LOCKDEP, track_caller) to prevent the
> generation at the language level when lockdep is off?
>
>> +        static_assert!(size_of::<Location<'_>>() >=3D size_of::<LockCla=
ssKey>());
>> +
>> +        #[cfg(CONFIG_LOCKDEP)]
>> +        {
>> +            let caller =3D Location::caller();
>
> [Severity: High]
> If multiple locks are initialized within the same macro expansion, will t=
hey
> incorrectly share the same lock class?
>
> Because track_caller assigns the macro invocation's span to all tokens
> generated by it, Location::caller() will return the exact same memory add=
ress
> for all locks instantiated by that macro. Could this cause lockdep to fal=
sely
> report recursive deadlocks when acquiring distinct locks from the same ma=
cro?

The only macro that needs this is DelayedWork. Two lock classes can be crea=
ted
per `Location`, which should be sufficient (see cover letter).

>
>> +            // SAFETY: For static objects, lockdep does not touch the u=
nderlying memory, and only
>> +            // the address matters. `Location::caller()` is in rodata s=
o it meets the requirement.
>> +            // The size check above makes sure that it does not overlap=
 with other lock class keys.
>> +            unsafe { Pin::new_unchecked(&*core::ptr::from_ref(caller).c=
ast::<Self>()) }
>
> [Severity: High]
> Can this cast trigger undefined behavior under Rust's aliasing rules?
>
> Location is a read-only struct in .rodata with no interior mutability, wh=
ile
> LockClassKey contains an Opaque that wraps UnsafeCell. Upgrading a read-o=
nly
> provenance to a shared read-write provenance (which UnsafeCell implies) i=
s
> immediate undefined behavior, even if the memory is never mutated.

This is https://github.com/rust-lang/unsafe-code-guidelines/issues/303 and =
it's
allowed by tree borrow.

>
>> +        }
>> +
>> +        // A separate version if lockdep is disabled to avoid unnecessa=
ry `Location` being
>> +        // generated.
>> +        #[cfg(not(CONFIG_LOCKDEP))]
>> +        static_lock_class!()
>> +    }
>
> [ ... ]
>
>> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
>> --- a/rust/kernel/sync/lock.rs
>> +++ b/rust/kernel/sync/lock.rs
>
> [ ... ]
>
>> @@ -127,8 +127,17 @@ unsafe impl<T: ?Sized + Send, B: Backend> Send for =
Lock<T, B> {}
>>  unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
>> =20
>>  impl<T, B: Backend> Lock<T, B> {
>> -    /// Constructs a new lock initialiser.
>> -    pub fn new(
>> +    /// Constructs a new lock initialiser with a custom name.
>> +    #[inline]
>> +    #[track_caller]
>> +    pub fn new_with_name(t: impl PinInit<T>, name: &'static CStr) -> im=
pl PinInit<Self> {
>
> [Severity: Medium]
> Similar to the issue in from_caller(), does this unconditionally propagat=
e
> Location generation up to the user even when CONFIG_LOCKDEP is disabled?
>
> Could this also be conditionally compiled with cfg_attr?

False positive.

Best,
Gary

>
>> +        let key =3D LockClassKey::from_caller();
>> +        Self::new_with_lock_class(t, name, key)
>> +    }


