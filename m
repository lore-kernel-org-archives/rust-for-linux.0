Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020086.outbound.protection.outlook.com [52.101.195.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D33370AD2;
	Tue, 19 May 2026 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186922; cv=fail; b=IJog65+yTdhIqWnFfnEpugPcTeDz+rFkrV/tUN8PKolmTLqJZv9IoLwO9YyQ4qgO2WcT6RZcoxK4Z4Bx/zmwPQA4B9I5TBbEumKMpDsUXRtl9t5e69/2bQHktLL9WPZb1Z6ruGAvISkFSoUD6ZZ30VWYoYXxZCV8j+hd61qLDiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186922; c=relaxed/simple;
	bh=ICRaSZ1L7Jc8PS0cSVWgIAwBNkJ9EN6PV7TevznX9go=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=nIXvGx2NtiLbNzQoNiEZeRkeYdnWpgutmbx8QIPVFPqZEkHz4HUYRM8wekETGUSqTY6onsa/atE26JT65yv/iFJXd8VHDRKr5LDOhQzxHILzYqPtwfoZGC+igxhAjq0CQmQITOzVSwMy5yVO2YKCEV6K0V/VJp8Lgk8x9LjUTqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dWQW0Kyv; arc=fail smtp.client-ip=52.101.195.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dWQW0Kyv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgVx1RQYZ+Ji/WFmyiYAyJHzyCfnUpxc8s9lo848yDsxgn4sm3k+/fCurbN6ynyq6wztmz6prJlu/LK9ofxZzynNEB9QrHdHGEYRuWhL5X125CmYTzoH8n2Y4kcYiNvzcxOLFJNAdxNMcUghh65NjOU13/dkd6sF17Rwf+rMZd8lSlG/DrQMErSgZvYgwyTWKvxMT6uo//lQXUEVsFMCpNwALVw8Lboez2ixfi+0WHupvyeVrCMuWMWZAbxMSsteD3VrDvonoZs+IBvXdxuyBJH+NKIC/cIYqynYGAzUkDxbzSryCwHjCLGtl80a/UqjC1SijUes5Ei6O3YDZZtVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxZzTgD3Cbrg2ZYwVQ1bHx3ClL+pNEjxJAuw9/Kz6/4=;
 b=j1uczNj1jUmok7/ZqVozXrEBj2dxDfuR6d5qDcfcLNiB6TQrpTuPy4zaL1nkSkEQHPM3y6aTWxoeMrzPfiiH7n/8OAGfLweCPouKdOtdMX3x+g+D//Hayunj9HPvTupTqFZRrWFHB22pH4mqXD/Zjlnb0Ps9hFUA03J8RN8wmzQHHhk7rs4le2wCch7D8BGl01X4nqcg7izNL454KkZc4pEov+FWiK6fdpCw0zee+vNJ7uelj2rHcdDNcKyIed3m2XnTwS8ZHWLToPzoK6ZTgzJTWw/C389DHnL8Rq14byNQnS+R8WDWOn7NOTX0lDe35rxMrqofBo/pINu6l5nKIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxZzTgD3Cbrg2ZYwVQ1bHx3ClL+pNEjxJAuw9/Kz6/4=;
 b=dWQW0KyvsEkBQ+zkk46togR/qpbwpWJUrwvvkbyehgtZsd6Y80UHp0laAzAZ0/zTGLsA7PUX14P23uAWQPEreKe6bkNKsI2ZRrnujBlgtBYsYov5jS2ipPG6oHDufCvBwk4bknBzxngY6by07m9MqByzqBwnQinNVeGecoSsVkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 10:35:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 10:35:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 11:35:13 +0100
Message-Id: <DIML4GDC87AA.116PZJDMV23IC@garyguo.net>
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
 <DILXW5AK9O8E.3TESJB45UPTZM@garyguo.net>
 <878q9f95j0.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <878q9f95j0.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P265CA0105.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: ba40a845-85e6-4d76-a60e-08deb5924f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|22082099003|18002099003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	hcZvL03FIY7l336fXwGHWQRKIXuKW0siC99jcnvBVxYlZ21s5FVVnrjoVCxlM1wuMLpM3LBKCzkW8RPdpqk6TPPG3osDkpmiHSiIDVvc36+AWTRyjTIMx8Gy7zY/sSnsIAzTx+/vs2rVUOTtAhl/jBNo5qDQTdEVsuqlJmI4QFNhSb3w4hG8earsMLD0EMeFbnRGYwao5GGf08uVroB0IyDAihYsEl6skdEvXZRUCAB0guFaFxn1F43V/QgjbHl5mjWsEFG9WDAVdv3ks6A+i3R6K6cNc8R5CKl9ZhxFaIQYpqDhiua8S+OdXvl5PdjK0BrPpsGqzSTgsx9ppG16ca755RoeHI35yhEZyTfamlkFchlgfCVnuOWv+WKFjpcmIYpr3wbOCI5J3ncDqZFm6tmd9s8qRse1Uk7AtkUA6iki0hVmFsVAxs1AC3CoJnWb3N0CKWunE/+pA7Ea4/KPHsRFB3mB8leBpvM0VnNb+2iMWuLPONABFJAdZzNgSEvGWqnCTuTAMXeKfnqwlI8IisKBBuExYFSjdEPqCXSk+Jonf/R9KOHXYXMb9zxJZutxSZhQb6bxldG5IuwLCHJwYOCxlUTV8anMk62j5zN3swSPd0hjK1ClZWZNkHAVUMvl+C4+tHDMkVxUI3SI/W8IkQr6g2xles6iLE+9+9oS3zsbc7Swm8s9HU5gomH0JkaU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(22082099003)(18002099003)(56012099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHd1cXZJcnVpV1dxTHJZNGdRSmliSmhhZjJvQ1owUC9hYXhYNzRwVTY4MnNo?=
 =?utf-8?B?ZzZlenZlRmxkOERFWEk1Ty9GdWw4djY0SVdNVlI0K01uUG96V1JqZ1o2dk5K?=
 =?utf-8?B?dlBNZ0RXZHhvZFk4Ti8ybjhJN1RBbVNabHRPcy9KSVplaWMzSFhtWnF4dDZa?=
 =?utf-8?B?Z0dWYTJCZGcwcnN1VmhWOGtJY0w1aWx5NEdTbEQzU0t2SzQ1ekt1TWp0d2I4?=
 =?utf-8?B?bjE1UHBzenNGZzFWS0ZaZGlaMGNtNWNCb1o0VVNMRDltZTMyS2djaVQvb0pO?=
 =?utf-8?B?WWhxcjJNWGszbDlYcHBXZFYzcEpRT1hYVUtOeVBNQnAvSnZJM0J2N0srTDc4?=
 =?utf-8?B?U000MG0xZlBCSzQwMzM0emEvZVREdENiT2JlM0xWZzBORWtaM2ZVbG9FRVIx?=
 =?utf-8?B?akpTNTFhRW92b1ZxY0VhMnhJMEJxeENpTzFuOFkrSHJ4bzMvUU15cVd6L0pI?=
 =?utf-8?B?ZHpoZWRtNGNYMEp3eUpMaVVTYmZiU1V6VmtPMDhVK3dVM1NTWHV0b2NGekRO?=
 =?utf-8?B?VktkcHJPT2d4Rk9pbm9iWUtJU0tZQlNrYTZYbUxZRldpM0hqa0hvZkluWlBE?=
 =?utf-8?B?OFdaWWFobGVFTkZSWmRvN3ZtODlkT2RYeGh6c1ZadkFDdmxmSHpkNGhzcUZ4?=
 =?utf-8?B?V0Z0OFZIdHBFT3JoSHAzTisyS2JzQk92VUFIK1RDVVRiN3RwYnN4RXM0UjFz?=
 =?utf-8?B?eDZVYld3VTZPa3FNUlJCVkxiOG11eFQxTW1oRklZb1ZFcktlMU4yaEtxM2s2?=
 =?utf-8?B?M3RKb2lTa0pKazMzSEExcTBodEZrb1JITnNieWhRaXJuMTB6UWduVDl5c2RX?=
 =?utf-8?B?Mm0xRXpPeVRBVHYxK0M1TUtxaStUQ2JyclFNeGVRN2d1NTk4QVBySlpwQXBJ?=
 =?utf-8?B?WU0vUVQ1VVBXYVFnUUx6OC9oK2UxTzVYUC9IakhqSXc5V0kxeFRuREdROUpw?=
 =?utf-8?B?V0VYOE04UnZLUjJKTTQxajBablFHaGhycGZ0eWp2dXk3enNqTXZEQnNlOWFW?=
 =?utf-8?B?SXVxZUxrQ0s0MjhTakoranZIVnpVMXhOd3FJUlV0cUpqemdBb21xN2FkSEFP?=
 =?utf-8?B?d3R0anYrRllxaU1PSFZiOUxUeThIRXl5VmU4QWh1cGdrUkp5WGlPOVF1alhZ?=
 =?utf-8?B?a0JXM3Z2Q09VYkVMOFJEL3ZzaXp5cTA1ZkJiVldaYnVZNUFIK2ZQMERzcUl3?=
 =?utf-8?B?STRLN1IyRy90MlowalVWLzRaYWpyeGhUL2Q0eXprMUlJNlN2eTFoU1kwWmdl?=
 =?utf-8?B?M3FkeDhPRGtabVhvNWJhZUZtNlVZbEZXNTZ2a3ZiSDUvZndjWlU3WXFEUnFY?=
 =?utf-8?B?NUVCU2hEWGJydUtEdWV1Q2JMR2JNdkhUekl5b2pLYWo3ZnNIa3FlWldGM3Ju?=
 =?utf-8?B?VzV0R2V6bzMxMHRudmhKSFRIRjdiOWhTVW5oVmpoTU1TM1c1MVJ1cGJyb0Q0?=
 =?utf-8?B?Z2xhbVZmTEhVN0xRY2F1K3JiNmZ4VENsN1hWbVRnYWlEL3hkcmFlanJDdHAw?=
 =?utf-8?B?RE5rV05Ja245Zy9XTDhDL3RpTkRDMlM4ZEJmM3dkdi9KM1NWVGlRM2ptR0dk?=
 =?utf-8?B?REZTOVBQMWhsQXpSUzF0QklNSVJ1emJEQkdUY1dKRzZaNjNYeURXc1JIbStx?=
 =?utf-8?B?aEVvcVZIaFNvcll6cUpqSkVMUGIzOFo3UnBzaEt5RmJhRjUwVVZraDNGK3ZN?=
 =?utf-8?B?WEt3YUY3cGtKQ0xKTUlUOWMxaTZ5YUxPdWxyOEQ3dWthRUdzR21BaGMxKyt3?=
 =?utf-8?B?RTFQUDg1ME9NR3N4TzQxaUUzc1BoYnhFU0N6Zm01TG5KMkU3RmRYK1JaZHhT?=
 =?utf-8?B?WkxWazVMWG5teWc4WExIMmxoc3M2ak5QeDZ3Yk9ZWHlCNmR1OEJCRlFvVGgy?=
 =?utf-8?B?bkN6UGZ5cWZCV05rMms4eC92R3FaOWZONSsrRzZ0MFpLUDZJT29OZWZ1a2Nw?=
 =?utf-8?B?dlJ3ZmNCT0tQdUl1ajdCZVBPMm1vQ21EV3Jwbms2cjFCbXNtd04xbURJbDRu?=
 =?utf-8?B?RkdCb0FVZXNlV3BsOXpvemREd3I3ZVNnUmFPUVFocFV3MjZGS1FyTVI2Sjdn?=
 =?utf-8?B?ajFIblh1YWtIOWFYOWZQZmg5ZVJwT1l1OXdNS1REMVBSZld4NkxzczUzMlVI?=
 =?utf-8?B?aTBySnd4NFJDNmdGem83U0VIVWlhT1VqZWNrVG5pL2d6b3NHanA5WU9Oc2ps?=
 =?utf-8?B?U1dBU3hlQ2dlZzFWQTV2YjVaZVlkalBxZzA5U25Yaks2NHlPTnVXaU1iWkdT?=
 =?utf-8?B?VzdCbWtQQ0N0dFZ0bEF3ZEtsZHRCR1k1dFBpaHpzQVVBTkcxNTZiK1J4aFR3?=
 =?utf-8?B?ZUJmekUzU094YVZ3OVJ1cVowMEdib0xHbDhiL0xKc1Bzdys4cGlGQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ba40a845-85e6-4d76-a60e-08deb5924f80
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 10:35:13.8329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrrCne/AGfe3xTsHH6Scbr1qjoMyD8FK6bOqhiEePyhmFlOUraPV53Z24y0SA/z6ap0xS2IoXBXfBO2jzZPI2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6866

On Tue May 19, 2026 at 9:18 AM BST, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Mon May 18, 2026 at 2:41 PM BST, Andreas Hindborg wrote:
>>> "Gary Guo" <gary@garyguo.net> writes:
>>>
>>>> On Wed Jan 28, 2026 at 2:25 PM GMT, Alexandre Courbot wrote:
>>>>> On Wed Jan 28, 2026 at 11:05 PM JST, Andreas Hindborg wrote:
>>>>>> `CacheAligned` allows to easily align values to a 64 byte boundary.
>>>>>>
>>>>>> An example use case is the kernel `struct spinlock`. This struct is =
4 bytes
>>>>>> on x86 when lockdep is not enabled. The structure is not padded to f=
it a
>>>>>> cache line. The effect of this for `SpinLock` is that the lock varia=
ble and
>>>>>> the value protected by the lock might share a cache line, depending =
on the
>>>>>> alignment requirements of the protected value. Wrapping the value in
>>>>>> `CacheAligned` to get a `SpinLock<CacheAligned<T>>` solves this prob=
lem.
>>>>>>
>>>>>> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
>>>>>> ---
>>>>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>>>> ---
>>>>>>  rust/kernel/cache_aligned.rs | 59 +++++++++++++++++++++++++++++++++=
+++++++++++
>>>>>>  rust/kernel/lib.rs           |  2 ++
>>>>>>  2 files changed, 61 insertions(+)
>>>>>>
>>>>>> diff --git a/rust/kernel/cache_aligned.rs b/rust/kernel/cache_aligne=
d.rs
>>>>>> new file mode 100644
>>>>>> index 0000000000000..9c33b8613c077
>>>>>> --- /dev/null
>>>>>> +++ b/rust/kernel/cache_aligned.rs
>>>>>> @@ -0,0 +1,59 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>> +
>>>>>> +use kernel::try_pin_init;
>>>>>> +use pin_init::{
>>>>>> +    pin_data,
>>>>>> +    pin_init,
>>>>>> +    PinInit, //
>>>>>> +};
>>>>>> +
>>>>>> +/// Wrapper type that alings content to a 64 byte cache line.
>>>>>
>>>>> nit: s/alings/aligns
>>>>>
>>>>>> +#[repr(align(64))]
>>>>>
>>>>> While 64 bytes is the most common cache line size, AFAIK this is not
>>>>> a universal value? Can we expose and use `L1_CACHE_BYTES` here?
>>>>
>>>> Unfortunately `repr(align())` does not accept expression or macro invo=
cations.
>>>> It's still possible with code-generation, but it'll be more tricky.
>>>>
>>>> On all archs that we do support today, I think the value is always 64.=
 However
>>>> it'd worth putting a FIXME or TODO (or assertion, maybe?) in case new =
archs gets
>>>> addded where this isn't true.
>>>
>>> I was looking into how to implement this properly. Apparently, we don't
>>> have a config item that specifies the L1 cache line size for all
>>> architectures. Each architectures defines the cache line size as C
>>> define in a header. For x86 we have
>>>
>>>   #define L1_CACHE_SHIFT	(CONFIG_X86_L1_CACHE_SHIFT)
>>>
>>> and for arm64
>>>
>>>   #define L1_CACHE_SHIFT		(6)
>>>
>>> and so on.
>>>
>>> One thing we could do is run the C preprocessor on a small snippet to
>>> expand the `L1_CACHE_SHIFT` symbol at some point before invoking
>>> `rustc`. Then we can pass the value to `rustc` via environment variable
>>> when building the `macros` crate. This is similar to how we pass
>>> `RUST_MODFILE` to `rustc`, sans the cpp invocation.
>>>
>>> Otherwise we have to convince all architectures that support Rust to
>>> emit a config that we can rely on, like `CONFIG_L1_CACHE_SHIFT`.
>>>
>>> The latter options is probably the better one, what do you all think?
>>>
>>> Best regards,
>>> Andreas Hindborg
>>
>> You can implement this with generics alone using associative types.
>>
>> mod sealed {
>>     pub trait Sealed {
>>         type Repr;
>>     }
>> }
>>
>> trait Alignment: sealed::Sealed {}
>>
>> #[repr(transparent)]
>> struct Align<const N: usize>([<Self as sealed::Sealed>::Repr; 0])
>> where
>>     Self: Alignment;
>>
>> impl<const N: usize> Align<N>
>> where
>>     Self: Alignment,
>> {
>>     #[inline]
>>     pub fn new() -> Self {
>>         Align([])
>>     }
>> }
>>
>> macro_rules! impl_align {
>>     () =3D> {};
>>     ($a:literal $($rest:literal)*) =3D> {
>>         const _: () =3D {
>>             #[repr(align($a))]
>>             struct Repr;
>>
>>             impl sealed::Sealed for Align<$a> {
>>                 type Repr =3D Repr;
>>             }
>>            =20
>>             impl Alignment for Align<$a> {}
>>         };
>>        =20
>>         impl_align!($($rest)*);
>>     }
>> }
>>
>> impl_align!(32 64 128 256);
>
> Right, that is great for avoiding code duplication in case we want to
> have `Align<16>`, `Align<32>`, etc.
>
> My discussion was about having just `CacheAligned` and having the
> alignment of that type automatically be the `1 << L1_CACHE_SHIFT`.

#[repr(transparent)]
struct CacheAligned(Align<{ 1 << L1_CACHE_SHIFT }>);

Best,
Gary
