Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020090.outbound.protection.outlook.com [52.101.196.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC2E23C8A0;
	Mon, 18 May 2026 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121382; cv=fail; b=KlPxkZBAbu7vUGrsRoMnjxo5CRibj85Eoc8K6+1JIX0p83zGWxNK1SrfA3f0IIE2UCQX7lFrcC+mk5OIJ8LGopnjGH/pOihosyvpxwHSvy0schw43sbD+ZqFy9lD8yl4Gh/JDnm5YMNYg53yFyNrrB5Tfgze/RfpiiEysJtGbB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121382; c=relaxed/simple;
	bh=cyX7SDOkPvvvjZMGhWXC2nQCT0sLCSgkSnH9iQT4BK4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=uhh7rGcOvQLeI/SdBFxijq+Kx3Nf73nhyXOVJsiVl+KLhVVyhnM0Eysm+4NctKugSRuo3Ss6x08TvGMPje7uhXJSSnY6s7xAt/1VgeX62yWzoBp8t/6JHgoQ5vqCgYdH4bPUCzB/kR/QjtLbcCAsWKerTzmVpDOyikrSIAwAJkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZpGMojFj; arc=fail smtp.client-ip=52.101.196.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZpGMojFj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrK7ytFYs8OEn6rUOWffZR/LigMH/EHTIl0H5rLYggrjyUU2d0tCGtffNXaZ/jA3u74m+O2bjn2Sx/3+a4zQIIXwqhl7PcW2T+p6/yOP+L7vIh9/Qk4udqQ0+EtpuLOHxi4wp5gUc+mlr0bWuGubLybYBzIwuPPd3Jaol0XH/z75YUEvJd5H2YjZCeF/fDNE1CL6sNp/dELQZwA2J/ERbNO4QbVVTo+KiVTcJAvkHtKIChpuuaAJckOwI6xcuByMK3YchIS0aVT40wIn0ts92E3um/8KdhTW4mD6T4E27fNphMGFvT04qwOD2d1CZsLgjNpvrURhNets4NaAAEmJyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOs9pHVIy9PQOIqUUpP8OnQSgBx3j9oC4dAh+hc27MI=;
 b=qbmzpFG2vZQcTDWLMhtcr+2AVpC5/cyenYXBOW0f+ntIhpSDO3vuBW/wYXLJhQAoV1a/iW/vm8kCd7MfbA3vY/E+s7KC/BtAd4u2VystZy7I9oh4ahlXqAOjB/ZFxgO42nbmLRWedF3w8vRSdRxkuDE5NanEg6xgeWiCysq+AKFJMzltMYKiuMrwRlrgYcKd8kfmq4/0eD/s6O4GazQjt14hEavSG57CLaYj7sNGBZArW20BHluOCjtvyOFoME/0V8YZntFv8cNhr7z+OibRbN3NDgKOdshB0qwqixT5MKnOl8fsUUEKfZeTY/dFwJn0phRXAJVmFYxoiOY/78iIVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOs9pHVIy9PQOIqUUpP8OnQSgBx3j9oC4dAh+hc27MI=;
 b=ZpGMojFj49g4NUhogfdUmiZniThkTIqs85sgv0c2+kEYY0OwISf8oj07reMwhaV9ZE0Jl+B9N5ZYWCn4vW69I0pt15IirD5bx3GwQRD8zcHQeTRh9T+VHthsOfmMoA2do+S1tMZ7y+jDiIAJKlYBbhre0ymyT0LC4hhbPU64BvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6617.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 16:22:57 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 16:22:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 17:22:56 +0100
Message-Id: <DILXW5AK9O8E.3TESJB45UPTZM@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment
 of values
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
 <DG0AIMJXPP65.1PTB9I0KQS4LI@nvidia.com>
 <DG0AU8J5K0SA.2SJVFWGAI98RZ@garyguo.net>
 <87bjec96nh.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87bjec96nh.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P265CA0139.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb9fe9f-a628-45a8-1f72-08deb4f9b8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|56012099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	Ek/mjgSDHdmK8zsBc92ZN1VnGUAyHEW5/dpStmyZFqG80IILEk7P3+/yuitWQbvHDzDk8cK89l5vaqKAgcvZICH3KHizaYKEV1rIPEO4OtdNRoEjkkauEn/GZ+O7nnr/DliV4VgDUIrRK3zhzdZE8mtrEvoGChaaUGvS53IzlvLaQ2bKe21hR3Iw8nk0Yymt9Q2BptEauYqRy5NA6hQjen/cZS51yyes7mmZx4IG/uX6XpApwJt0Mv0tb/t1e47tZJ09nhiLakbBKMaJEQ8VOBcKHaUGLLwK8PQul5/wI0ihiqeR14FTxWQbGvznBLhvJZ7sKA72/9ZdiAG0RCn5Ek4LPyzY3ITkYp7oM0VZ563xvpMClSgcnXoBmeI+AttiQrjfbbz51PD4heymnQSnpXBdGgcQDAzONVgXfBGFKHcD48kj/Urs/AQZnpJ/+TM9070y3k+ucxbNM88nfwi2DA75+UZhdhgbcYedLpvjsu9nRVf+U+Z6Vou6gW1lp1F6M11fdg0r1flBmGLKmJIBH3PdwtZVwCXqD1OMYnTGh//rJTiE5v06pzWJDwe6VsPVV4DE/AuWOOroNeHMCk5VUFOr07GL1AaD24/orHhcoF7W3oO+0jbrMsxkSRKmjKKgHxPXSvmW5gvsjW7r4J/fbAzy1aPeYMcJzsLMeU0VPRfaQWftbTlC4Z0rzd9mFyuD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(56012099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk1NWHM1S3pCVFQ0SVhRKzlramVtTC9QbENMTkdOYUdOb3ZUclFYNzVVdjRw?=
 =?utf-8?B?bSs0aVM0dUVSSVRXT1M2bkNxK05tNEJHWFFFNnB0K3ZPVG03OFVjVjNWL3dv?=
 =?utf-8?B?d2FnMjh1L0gxcDNJVkJVY2N6ZnlJZTlSQ05RUjl3S1hvNUZ6elRlL3V2NGEr?=
 =?utf-8?B?dTVwWXdhSnh4T3ROdW1lVnVvQWsvQmlPTWkrN2dBMXYyL1dSSFY2czg1Vktm?=
 =?utf-8?B?bUdyRGFLYUhwcWEyVFFOdkNCUmx1ZDdnS2pIaWFqNVI5b0VyZURPZ3ZvVmJi?=
 =?utf-8?B?TFlvNUR4TVh2WkVMUlpBNXZHcGxqcCs4aEVkcGtaL3RWN0hZbzgyMG9hd3g2?=
 =?utf-8?B?MnJITFE5blNmbkpBRkFCaWRKb2xJTmdwTER0cXYzOGFiTHk3RTE0aTBsTm5s?=
 =?utf-8?B?S0JCV2ZxT3cxZ2FaTk1wenBMNWN4VWM4NjN1ZGZWbW95MGRieDlTYTlqek4x?=
 =?utf-8?B?Zmwyb3M5UUhYNDZDMEltVmpXRGdod0gzRDM1bksxY09saWY2S3c4ekNzeVhM?=
 =?utf-8?B?QU9PdlVWckNQSGNvT2pPdjJnUEthbVRLT00wR3NlUUNmN3gzaHlvd2hFRWRO?=
 =?utf-8?B?alZlbmNtQUplblBBRG5QYllqbVdBRlY4QWhza3M3NFpMMHdCSEVzQ3VlbU9V?=
 =?utf-8?B?VkxNSjhFenlTYjdzdlZrUkZyRHlRZGt4SktzajhjcnhWSnArOGRhY0VvMHJW?=
 =?utf-8?B?ZXV3dUpJRit1QW9WZ3o1eDM0ZS95bE9SSFdEU3dLZkkzVm5kS1czemJ3SnpW?=
 =?utf-8?B?cUYweVI2U0htT0x3OVBKSmpNK0EySXN0NE1wVjV3RmpsU2JRUVd6RUdxVEhX?=
 =?utf-8?B?K1gzdmtNWml2RVEzVERGZkM0MXAzSW8xY1Z6YllhR0VjNHdPOFVtSVhBZGpu?=
 =?utf-8?B?UzYxMDdvYk9ISTJZNmVtYXdpTDRIS2d3TmtxcHZwNndqeVFlSHY3SGdjQ2Ja?=
 =?utf-8?B?ZVlNK1JlaTc5OUVzVjM5ZklXaTVWc0VwZTE2eHZURVFxVDl6VFRqZUVRVlpy?=
 =?utf-8?B?bHRMaFMrQm9BZlhvc1V5ZExXL0phYmxQWDdNbVN4SjQySDNxTW5OcUZ6bXlQ?=
 =?utf-8?B?MXhlK2dpQjJEUmlLQ2Z6SzZzMnRsMXora2ZZSkErencxeU12elhkMjlrT3JG?=
 =?utf-8?B?NitSVXhlamM2dmMrZDhGMktCbjlrQWVsd3BtbWlsM2dvYVlLQ2JqcDh4OWFW?=
 =?utf-8?B?eXlLN3JRMlRUN0xnc1FOS2hrK1cwT0Irbys0dy9XVjgzMlJ1ZWdlL01RYzhL?=
 =?utf-8?B?c0Fud2ZYeDYvWExWTHNpck5qd0pjdkNsRGdyVWVhTHNDbzVFWjB2cnJsTndm?=
 =?utf-8?B?c2MvM0dORFhWRTMwTmNodm5neVhhMm5IdDViR3c0U3pEZy9LQmxmSTJ5NTFx?=
 =?utf-8?B?RGJtek5PWk83ZWlZMUx1b3ZOZ3BmUVhHZ3FwRHZTV2pXaWU1VGUyQmhKMjcx?=
 =?utf-8?B?UEs5NnVFS2pXN2hNNW1MTGc0L2gxQTE2Tmx5WndOaXkwZjdQalNqUGtnZk1M?=
 =?utf-8?B?d1lVRjNaQldsNGdJMnlWalB5dWd2alFtNDlqMEF5ZmlPNXdLSVJaWmJLc1o1?=
 =?utf-8?B?UE9lOUpsdk1CL0N5emswOFVtZ01FcGdMb2pJMVdzNlY1ZWdua1YyaWhOSC9C?=
 =?utf-8?B?dkloZHAreXpaOU1WNUxnK3FiUDFhQVB2Z0pxL2ZCNHh1M3lCVmRyNDlyRkVO?=
 =?utf-8?B?QnRQTURNaDBWdjJoMzJhWVBTVW9EMCtzTk9JOUJvcDEzem1zS2JselJGa1U0?=
 =?utf-8?B?T1FlZmVDUHFLZXRBRXVzOTY3amhzZnNNRUxqSWcyYTN4enFwWTlzYm5CcStz?=
 =?utf-8?B?bHhJR1ZTczBPY29ZcmIzc0pybm80eXhDNU1CZ0x4WGF4d3dOaDZIc2FydmhF?=
 =?utf-8?B?VVZoVWZtMmJBRUxUU3NleFhJTzZ6aS9mTU1wWnJBbHpYSVRFU3AwSzNldGVr?=
 =?utf-8?B?Nk94akpXa21NNDVMUkQxU2VjZ0NxdkZNVXg3NXFxTmlvZnhKa0s3UFJSNk5w?=
 =?utf-8?B?U2RqcktmeDBnWTBTaUdmWWxxL0ZQbGU1SUxYd254SmFER1pkVlptN3MyOWVL?=
 =?utf-8?B?OUhFQ2pLbU50bEdLZVA3WHBwWHROc3plcUxhcitwbXNDN3JuZDhXVnJDRkZK?=
 =?utf-8?B?UHBsT1N5QUFXRGczdUwyU2pYa3k4YWxiZUluT3dOSGU4RUl6QVRjRi9rK0Fw?=
 =?utf-8?B?WEZqOEMyV0pnNnZ5dEovZUNuNWpQZ3dlcEpuWUxDb205KzNIeWhIaVhjTktO?=
 =?utf-8?B?eEphTFBHQVByNFJHWFh1dWprVXRhb3F0WkRTNmJRd1JkR0dMRDF4b0RJbk1l?=
 =?utf-8?B?cEpBN0ZlNE43b0hKQjFGdzdZUXBLQkRnQmVIOUlUMkhsZzZNcEJ5UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb9fe9f-a628-45a8-1f72-08deb4f9b8aa
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 16:22:57.1943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6X0oJFdE7V9ZxzoPUE0DX2pZbM0fpBIlF331cJ8H9h9vqn8mH8mikpXxgW4kj87LXgsTMrfFU7BwwLKh5pyHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6617

On Mon May 18, 2026 at 2:41 PM BST, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Wed Jan 28, 2026 at 2:25 PM GMT, Alexandre Courbot wrote:
>>> On Wed Jan 28, 2026 at 11:05 PM JST, Andreas Hindborg wrote:
>>>> `CacheAligned` allows to easily align values to a 64 byte boundary.
>>>>
>>>> An example use case is the kernel `struct spinlock`. This struct is 4 =
bytes
>>>> on x86 when lockdep is not enabled. The structure is not padded to fit=
 a
>>>> cache line. The effect of this for `SpinLock` is that the lock variabl=
e and
>>>> the value protected by the lock might share a cache line, depending on=
 the
>>>> alignment requirements of the protected value. Wrapping the value in
>>>> `CacheAligned` to get a `SpinLock<CacheAligned<T>>` solves this proble=
m.
>>>>
>>>> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
>>>> ---
>>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>> ---
>>>>  rust/kernel/cache_aligned.rs | 59 +++++++++++++++++++++++++++++++++++=
+++++++++
>>>>  rust/kernel/lib.rs           |  2 ++
>>>>  2 files changed, 61 insertions(+)
>>>>
>>>> diff --git a/rust/kernel/cache_aligned.rs b/rust/kernel/cache_aligned.=
rs
>>>> new file mode 100644
>>>> index 0000000000000..9c33b8613c077
>>>> --- /dev/null
>>>> +++ b/rust/kernel/cache_aligned.rs
>>>> @@ -0,0 +1,59 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +use kernel::try_pin_init;
>>>> +use pin_init::{
>>>> +    pin_data,
>>>> +    pin_init,
>>>> +    PinInit, //
>>>> +};
>>>> +
>>>> +/// Wrapper type that alings content to a 64 byte cache line.
>>>
>>> nit: s/alings/aligns
>>>
>>>> +#[repr(align(64))]
>>>
>>> While 64 bytes is the most common cache line size, AFAIK this is not
>>> a universal value? Can we expose and use `L1_CACHE_BYTES` here?
>>
>> Unfortunately `repr(align())` does not accept expression or macro invoca=
tions.
>> It's still possible with code-generation, but it'll be more tricky.
>>
>> On all archs that we do support today, I think the value is always 64. H=
owever
>> it'd worth putting a FIXME or TODO (or assertion, maybe?) in case new ar=
chs gets
>> addded where this isn't true.
>
> I was looking into how to implement this properly. Apparently, we don't
> have a config item that specifies the L1 cache line size for all
> architectures. Each architectures defines the cache line size as C
> define in a header. For x86 we have
>
>   #define L1_CACHE_SHIFT	(CONFIG_X86_L1_CACHE_SHIFT)
>
> and for arm64
>
>   #define L1_CACHE_SHIFT		(6)
>
> and so on.
>
> One thing we could do is run the C preprocessor on a small snippet to
> expand the `L1_CACHE_SHIFT` symbol at some point before invoking
> `rustc`. Then we can pass the value to `rustc` via environment variable
> when building the `macros` crate. This is similar to how we pass
> `RUST_MODFILE` to `rustc`, sans the cpp invocation.
>
> Otherwise we have to convince all architectures that support Rust to
> emit a config that we can rely on, like `CONFIG_L1_CACHE_SHIFT`.
>
> The latter options is probably the better one, what do you all think?
>
> Best regards,
> Andreas Hindborg

You can implement this with generics alone using associative types.

mod sealed {
    pub trait Sealed {
        type Repr;
    }
}

trait Alignment: sealed::Sealed {}

#[repr(transparent)]
struct Align<const N: usize>([<Self as sealed::Sealed>::Repr; 0])
where
    Self: Alignment;

impl<const N: usize> Align<N>
where
    Self: Alignment,
{
    #[inline]
    pub fn new() -> Self {
        Align([])
    }
}

macro_rules! impl_align {
    () =3D> {};
    ($a:literal $($rest:literal)*) =3D> {
        const _: () =3D {
            #[repr(align($a))]
            struct Repr;

            impl sealed::Sealed for Align<$a> {
                type Repr =3D Repr;
            }
           =20
            impl Alignment for Align<$a> {}
        };
       =20
        impl_align!($($rest)*);
    }
}

impl_align!(32 64 128 256);

Best,
Gary
