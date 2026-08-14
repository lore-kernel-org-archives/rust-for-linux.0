Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021115.outbound.protection.outlook.com [52.101.95.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FD91448E0
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 00:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786668872; cv=fail; b=BGAIrQnIAHN7GPVTP9SA2IgUTF8uUZQ5hgpU+Jl79eDGnR8hhQzl0SSKaJ8p0LxDwRSRsw0i0MpQn9Y+GtZpLmidhO6LKwePd1n5cocH+nHHIphHW6fga4afp+0FlK5Ze0abhFwndlYZMpYlrNbPv2K19JjhA3otY8VJgtEFiS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786668872; c=relaxed/simple;
	bh=W/2196kDoQqIXT7whyefpvDu8qWAoj/piQhGZ/mb3hE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=eur5kquovhb7inaZIu834Vhkwh8Vq88N1tM2KRos8Fu8qAHlp33oaP9bVYAW0g8c+/DI1+CQbLIHwYHt7YpkJlZmS0L4LkngiHCJsbigS5y1uzWI4yP3OHmJ3KYn46f05a07M2tlUbbBHwGFIyL+UiMC8ORVsaJ0dDNyqehuRKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Bzhbs9rb; arc=fail smtp.client-ip=52.101.95.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Bzhbs9rb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7IFB8X4zzOzRUdatFNI7LSjyWOBiYMhzwAGmZmGhLjo3mXyIMAUECZu/+bqFw8qTuAVNGfFJEE/EahimeB238gucsEe6LU2u7WHE1Z+WFv9avpySSV3GyYOUCUaCZE04M5OvJ5ENW40HWDKGHrjG2kY2dbMlebNLcKKz1xhiysGoa8WT1xduXEjX0Ccqcpp5O8Pgq9juW85ZbrfbqtolWdsp5p4kDkZfpjVKjyCaYpPLzvfUwz8jgxIC91rI7AJ5KqgX7flX9Acp17+34YRH+QKmpn3zNTEa0V0LY2GUEnUNxNXUZyMscXtpCkvdPBSBaATbjsOaoF69Qc7djgA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xx8ZSPmFixLSkrugHQeYRDvWhrIs0MLb8XFuumuVfJw=;
 b=Kjo3SsbNq9zWdXT3g7XtDQZktvbjP1JQKa1kKYnnRbwtFFEFtkf0WphTgqKC1RDOEPUfiMpdfZOZUraUuUA4kgSRC5rq7KKHX5W0pTst7YvL+GOczN7jzsnxlhfHfneFMWDz2yJy3JZEJ+bknTbZo7840hQw8kIMsjBTnmcNSoAUtpTgcl87n64y/vB1JY4shZNHNW9q4vDUCn2p+0Odp6fY0yX+Ftd7/GJtFRroZIGyKgorTHZ3TenzF/E7+qt3miJWHakE0aelLLs9V8Ybes8EhqimcfGXoKV/sg+lNRCjxgLaoEpWcKarp0QZm3AkJQlEBP+8Hr5F2Nqz97KlUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xx8ZSPmFixLSkrugHQeYRDvWhrIs0MLb8XFuumuVfJw=;
 b=Bzhbs9rbtGkPtJY19NMs7rZp55RAIfxsz3ZTFl2H9ZEfnEkogSwWyVwu+CsC2YB/n3SZKw3i4JimTqjogoGFWtHYbB+ktq/37ah5G3ROTMwGIZhotvmDJ5SrsIzTZiIS+FXp1T2xQe464wbJwENJWJp+t6MwxCzskpjw3G62fcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOYP265MB2272.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:111::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 00:54:26 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 00:54:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 01:54:25 +0100
Message-Id: <DKO995UPAESG.UQNZ5G92HCPQ@garyguo.net>
Cc: <a.hindborg@kernel.org>, <ojeda@kernel.org>, <acourbot@nvidia.com>,
 <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <daniel.almeida@collabora.com>, <jstultz@google.com>,
 <lossin@kernel.org>, <lyude@redhat.com>, <sboyd@kernel.org>,
 <tamird@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent
 arming
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <gary@garyguo.net>,
 <anna-maria@linutronix.de>, <frederic@kernel.org>, <tglx@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260813134834.1562995-1-tomo@flapping.org>
 <DKNVOU9JC15P.3DEBNZ56QK20E@garyguo.net>
 <20260814.084700.1697518597717457311.tomo@flapping.org>
In-Reply-To: <20260814.084700.1697518597717457311.tomo@flapping.org>
X-ClientProxiedBy: LO4P265CA0227.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::13) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOYP265MB2272:EE_
X-MS-Office365-Filtering-Correlation-Id: e28be83f-52e1-41d8-e5d1-08def99e96d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|23010399003|7416014|1800799024|5023799004|56012099006|10067099003|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	7Mw10TEjdQRYhO38dxk7JliQAdt9o6WIoZn4ylDtJ/G4PUiYZChS/ctn4ypYD/c0F9iO/ifJvGeUJczyOqw0RqIVgpis2PgWnfUq8mellUW3G731sUbZwC+q4EjB2e4f4WyLXLqYZYjXxWQmpHQLKhwH3czP5heFQ0E3uhaqa4w17G1lGXpCYW2Kv924YpfI5gjOft2MCVlARe412J/14Y9ECa8jxxVj7zm9u9ZbIj4A4CBKqZZrHgciMS7nayJh2gdjGgPb/ARS7FSu2GtDfKMf96ZfrMbdkU3gH8XEY2Am+PC4PzDA6pJVbu207dkQiE7HZz1pkAubqgWyilBqNhgx2GD5jvl8ky6m0szEGdl2+MDqtcB/7HjMtbynFVHYkeWipUfRHKsBhaIpKPei4WxSByYrHNd1pEWOlIxpYixl2J0+wrsXCNAcNLp2HMiLpb/ArhB8qWXrjnq5M6dWyH0uVRUKOZFluX0XAh3Pjr0k+qJjwYLrMWvJnO6ZRkPLNYSs4S0bW0tQVC5RL8bYfiliEha5VAEa0wwmIvHHY0Ev1ShieGmqaMUEFPhnoKI1jtZmn2Uru/0tQlJpo11TlZdMywmMngi8u6yYT1ABnoamjDLPaaNiU+1ploJJgOzuzozErYloEKhbhmhMD3/v1YdakJsWf21f12T4iUBXnjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(23010399003)(7416014)(1800799024)(5023799004)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmI2d3dyUFBSVHFFQlZ0SmpSZ0xMTE5WQ1JyVnhWeHZzWmJGcHY4Y3ZaNDFF?=
 =?utf-8?B?MURmc1ViRXNaS2t4eGpCbVdwZThBT3pIN0w5VGIyR1hIbHFBNnlZdVVhWTcy?=
 =?utf-8?B?OEZkUmRGdVZHTlpNb1BnOFgwSEx5VE93dHI2S0xvRHRCYktyRHpiMDhGeEJz?=
 =?utf-8?B?ZTlpQjBtMzc3eXpEekloS3Zyc3pybXF1WnBzazdFazRYdXhTQ0NuRHdoZjJj?=
 =?utf-8?B?TlJWdVBUWUhQa0hBeHV1RVpLUDN0WDVTQmdNNVJZemxVOEtQbm9mMW9jRnda?=
 =?utf-8?B?Wktqcm9DblVlL3lUQktnemttVEtwMVgvY29qeUVuVGo3TWNndmltZUtJY0dP?=
 =?utf-8?B?RzgxZWZiMnpXYk9udzliaGFjV2Q3dEUzbjVvcWZpNW5jell3NHY4dzRCbm9t?=
 =?utf-8?B?Q1BOa3dLTTUrc2RWdUd6NHUvRXJGSEVudXRZOTBYL05icExKdmZWQ1l4MFFC?=
 =?utf-8?B?b3hNM0QyUTZoVnNkSmRzSHNLMGtqSlAyQnFvUDQ4dzJ3SUNOSFdnQ3gyKzlR?=
 =?utf-8?B?WDhHZnRjTlRvYm0zcTRNa0doZ1BaSXZ1T0JKcFRxbFhhWGVpUVZ6QklELysy?=
 =?utf-8?B?d2xjK2k4bVRQbDdHNlc4c2s5eVNZeTBnYXZPbEZmNHpnNmxyOUJ3dy9Ob0dT?=
 =?utf-8?B?RzhMTWlLMUN1L3Vvb3ZWaTJwZ2xyT216cDRQR0I0Ylk4clQzYUtHRTd2RW0y?=
 =?utf-8?B?RmxnRTRIMWZDWHA5ZVZpc2RMMER4ckdScUZLdW5yUjNjMTZaR1JpTEpvMXEw?=
 =?utf-8?B?bExFMGVDYWZZdEZITG1mc2RlZ2poRWJScnlQdmVLWllpcnY0Qm5XMy9GNHdE?=
 =?utf-8?B?THVORkFpUDR2L05wYnBvVUo0aFpMRXcxaVliWldwODkvWkdKaDU0NHpZb2tu?=
 =?utf-8?B?SEp6WTR3azdXaWJtZmtKbDNVbmRBdkh1VjBpYkR2RU1Wd2dSU2c5Tmk2TXBZ?=
 =?utf-8?B?VldRbkUxTDJISVdqVDY1aEZLU09UR0dXaWs0bFd1aHdmWHhiVmdwVjNuOTR3?=
 =?utf-8?B?TVRZcHMyM3dNeFBwQ0xwSjZhY1FlRU41dWZveWdiZFNqUGhxZjFsNzBlVGZi?=
 =?utf-8?B?RnVacGVUZTIxZ2x3OWx2b3R2ODhPNkNXdVh2ZWpzeWtaN3RKN1NBMS9xQkhP?=
 =?utf-8?B?VWErUXBrUHE3bVlsTys0WThnVCtxeWdlTVFPNzZJaVVrNEF0dGo1cS9tbHE4?=
 =?utf-8?B?QWUyMEZSM1lwa0M0LzlNSkRvQk51UkJ2OVEyeVVuREpGT3JGdTJGSDc2U2Y2?=
 =?utf-8?B?QVMvbXpVL3JEUjVIcmNCVzhzeEFudWhPTXI5L3lNQWJIb2Z6bFZ3Ulp4QUhX?=
 =?utf-8?B?SGliSW5WS25tWkxmSWorUmNnMTN0bTF6NW96cDJEQ0ZWVGZ4bUkvYXJ6Y1hV?=
 =?utf-8?B?RjVvQmJ2bGpmVUQzQ2p5cXExRytEQjg1ckRVbmN6eCtMUmxZUy9rdk15U0Fv?=
 =?utf-8?B?TWwyTjFZcWZOZUY4UGJ5Wng1bDdpZ2FoT1lZaEtKeTdrYTUrOUpMSW8vekk5?=
 =?utf-8?B?SEVNOVl2OXo4MDhaOFg0QzNmTEtiK1hlUXVseVhzSFJWejNad0ZNdXhlM1FT?=
 =?utf-8?B?Zm5id1BCUnBHc0NIT0FtQUZabmxKa0t5RE1KcnVMMFdQRThWRGdtYnQ2aVln?=
 =?utf-8?B?RUdCV0VLUHFaY1ZvaGdsRmVWNXFFTFVQdElqemllSEVMQmxlSGFUUFh1M1Zu?=
 =?utf-8?B?MHRoZkxlT1h3Z2FTZUorY0t6bEt2T3NucytjWjNBTVJlT0tQRW9IVnkrMEs1?=
 =?utf-8?B?VFQzY2hoeEZONThUTTZhQ2tvQzZ2Zkt1SkhDTUJ1VmMyYWVKUVdOY0hZSzJC?=
 =?utf-8?B?MG9Kcmc5a1VNZmcxZWJnTlZwQS9RNVA1RjQ5dTNIMkZJRjkzM1pkSnNxT0tX?=
 =?utf-8?B?QXlmWUs1QzIyemlua1lMOVJvOGpIOXBNK2c3TnpIb01LYXRvb1laT3ZadExP?=
 =?utf-8?B?RTFuTnVsb0lmL2VZZ0ZKQ1NxalBFaUVyWmIyS1YrbDR6MCtLNUdwazhDUkUw?=
 =?utf-8?B?dXpVcWU2eUNlK3NZWk1JbE0xNE04NmNhSmdCUUVsSytsSlBFUHhsZ091V0FH?=
 =?utf-8?B?M29lTU9Sdkc2eEtNYTNzL1RPSHNqUjRObUd3K2FLVXFtSzBZa2JUUFl2V1Fy?=
 =?utf-8?B?MHRLelJrbmNsck1makFDUjU0WDhiTm5RUlRXOHpneVAzdFlWVnRVdGlQalRZ?=
 =?utf-8?B?RkppaDZ2UENhYzMxQUhpVnZPNnIzTm9nK3Zaa1FRaVM2NzFEaWNRemQvZkFS?=
 =?utf-8?B?blJOcVBEaGdEWG9kZzNlZmE2YVk2T0JTeEtEU0VJOXBZS2x6c3FRSlUzbERy?=
 =?utf-8?B?RE1pSWJRMGlUMmU2NGxTK1kwWkprdnJLL2hTV2wwTkc1Y0w3b1FUUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e28be83f-52e1-41d8-e5d1-08def99e96d0
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 00:54:26.4799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdYZwop57j4hZxltAUeIIBgaqlD+oBvg+2mZw8RIUQiEjZkyAGtynf2vESmzyd2pUVS4RiAoS+YjHvxb7NFz3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2272

On Fri Aug 14, 2026 at 12:47 AM BST, FUJITA Tomonori wrote:
> On Thu, 13 Aug 2026 15:16:38 +0100
> "Gary Guo" <gary@garyguo.net> wrote:
>
>> I am thinking about this and I wonder about a different approach: the on=
ly
>> reason that we're having this issue, is that `expires()` call and
>> `forward`/`forward_now` is executed outside the protection of the base l=
ock.
>>=20
>> The fix is easy -- to ensure that they are executed with the base lock h=
eld.
>> The callback wants either:
>> * Do not restart the timer
>> * Call hrtimer_forward[_now] and restart the timer
>>=20
>> So, if we change the order from
>>=20
>>     unlock base
>>     restart =3D fn(timer)
>>     lock base
>>     if restart {
>>         queue
>>     }
>>=20
>> to
>>=20
>>     get expires
>>     unlock base
>>     restart =3D fn(timer, expires)
>>     lock base
>>     match restart {
>>         Restart(now, interval) =3D> {
>>             hrtimer_forward(timer, now, interval);
>>             queue
>>         }
>>         NoRestart =3D> (),
>>     }
>>=20
>> then we completely eradicate this issue.
>
> If I understood the proposal correctly: hrtimer_forward[_now]() would no
> longer be called by drivers at all. It becomes internal to the core and
> runs with the base lock held, and every hrtimer callback in the tree is
> updated to take the expiry as an argument and return the interval, with
> the ones that use the overrun computing it from what they were passed.

Right, that the idea. I think patching all hrtimer callback is probably a b=
it
excessive, but one way would be add a mode where cpu_base->lock is not unlo=
cked,
and the Rust hrtimer abstraction would read the expiry, unlock it, run the
callback and re-lock the base lock.

>
> That could remove the need for the rule on the Rust side.
>
> Anna-Maria, Frederic, Thomas: does this direction look reasonable to you?
>
>
>> Alternatively, we can add another spinlock to protect `expires` from rac=
e
>> condition from within callback and concurrent restart -- that is what pe=
rf core
>> does: perf_mux_hrtimer_handler and perf_mux_hrtimer_restart uses the sam=
e
>> hrtimer_lock to prevent race.
>
> Right, with the lock and cpc->hrtimer_active flag together, perf
> implements the same "do not arm while armed" rule that these patches
> implement in the type system.
>
>
>> But further complicating the type system to prevent concurrent restart s=
ounds
>> like a bad approach to me.
>
> My intent is the opposite: I think this makes the design simpler.
>
> All four implementations of start() already take self by value. For
> Pin<Box<T, A>> and Pin<&mut T> that means what it says -- the box is move=
d
> into the handle, the exclusive borrow is consumed -- so "no arming while
> armed" is already the design there. For Arc<T> and Pin<&T> the same
> signature meant nothing, because Clone and Copy let you build another
> pointer and call start() again.
>
> So the contract depended on which pointer type you picked, and the module
> documentation had to spell that out: "When a type implements both
> HrTimerPointer and Clone, it is possible to issue the start operation
> while the timer is in the started state." After the series there is one
> rule for all four types, and that paragraph is gone together with the
> restart operation it described.

Let's ignore the implementation detail of all various Rust pointers. It is
something that I plan to overhaul and doesn't matter to the core issue here=
.

The change you're making is to remove the ability to concurrently start a t=
imer
in Rust. So if you have a timer might be running, you'd need to first cance=
l it
before you can arm it again.

I do think it is conceptually cleaner -- however given this is explicitly a=
dded
in
https://lore.kernel.org/all/tip-5de2755c8c8b3a6b8414870e2c284914a2b42e4d@gi=
t.kernel.org/
and the pattern is what perf core uses; so I wouldn't just dismiss the exis=
tence
of this pattern. Perhaps cancelling before restarting is considered too
expensive and has to be avoided?

Best,
Gary

