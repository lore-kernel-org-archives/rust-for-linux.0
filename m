Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021088.outbound.protection.outlook.com [52.101.95.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2ED41D4EE;
	Tue,  7 Jul 2026 13:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431215; cv=fail; b=nl0EE6NgPIMlc2xeeP7PtyiR3yHXUDT0+XCKwE3eG2iZLMYQR2hPkalReA2xvRRea10k1HeRvKcRHChqzn1Zen4M4+EnxkRnYJ2qPCb9Y74JW3LyGvHOhQdZO64VVDV0QVbcXJXUrxQs1n3jI6h3V1HJ/bIA4G2vtA7OWPbKm5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431215; c=relaxed/simple;
	bh=NMNpvAoucb1eWmKq1egYGoW04VshS5rn45UWVI+tQS8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fEOQ6M2qmzGWogm5BBnLqafsMwmU0AOJhnPAZrwWYVgi8yKcZyli+g/6G41mKL5BgUzLGCXgl2JLQvnNqontVbf565Iuj2A27pF4RpxS/r0YW41a2xI3U6mb3J2AaN5gg1tCTLBn/X4VGtvDAky9xeQvWipeolpmNr/7FdIL7qE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ikZrZCH1; arc=fail smtp.client-ip=52.101.95.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ikZrZCH1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXxv/VUjBLDqoHtgP70vJdIVtqlt7GHupGM30qWquH27frSWXyccKcAkCBvL7u+Xz9NbIshN9Ky1UGkD6Gjwb1eDPqVdErjSMdZahbtrhU7VD4wMGYQHcDS2E9b0GqnhfyO8cEIRg/O/pE6fJAWuff4/vYfqSiVZM4Cf2e2uGu9Zk0//7ag6iAwCMrwEK2AjJZSi7yu+HUJeilQEJgA+ZOEglqj2D8Pk8wzI8Z7xSdYOlPJto8PJHJYk5cRLKv/w0++X3ticno1TjaXFAbxrQ3zAFHiy2SBodeqCtMpGh0MQnw6yzYKruoBp0N/zYFEVFZSSbyvpLnOgkqaAuhVwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMNpvAoucb1eWmKq1egYGoW04VshS5rn45UWVI+tQS8=;
 b=GzYhBEwYGb5bqXZa9mPZzr+Mm9nGu/ba60RKSzL7amgnCS+aP4Cg0p+oj7DyA4xUSpuGHUWRgEXM39tf5IcH31Kf3cDMEIsZsj2VxbhSehpdA8c407NKCcf13cemjkVVcUxeIjX7h97WlpsMeoU380ToszsBKIy182EwwvEzb9zh0k4yKmy/P4GIHSgqkx7rCfKvu0K+FNk9/Y+SBBkrr44zf7Zqu9LD7+e/MZs6oDpzk5L4zRr1xeVhRw7fBUGXmMQ7G5p8w8TCbSNs7NfzP6vVRHRBfojBHkwGqKky9+kqQuK8MM/Y6MhWnKlGZida77F7+6KseLMkBc/DVsaGFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMNpvAoucb1eWmKq1egYGoW04VshS5rn45UWVI+tQS8=;
 b=ikZrZCH10ZUupRjgjxyvtLnl5IhBl4arDedXHXYMmHU0Fp34NUSJaEfBUP2cT83fGt+ZywrOmHBHqqr2Qq9s4F0WzoePBaGSDI+pppUj0Liys+Kc4raXDvB19mHd+DUxxRwE+6f9ix5hQdEDIvcRA7Ra0nyFhM2w+ktwt6WdVAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6680.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 13:33:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 13:33:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 14:33:26 +0100
Message-Id: <DJSDLLJAHFQC.3S56X1Q9MU2T2@garyguo.net>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Carlos Llamas"
 <cmllamas@google.com>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Lyude Paul"
 <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Trevor Gross" <tmgross@umich.edu>, "Waiman Long"
 <longman@redhat.com>, "Will Deacon" <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/5] rust: sync: add const constructor for
 raw_spinlock_t
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-2-cc922f544dc0@google.com>
 <DJNDAQX71WG8.3UILF89WQD532@garyguo.net> <akz8g-zAeNuvBiF3@google.com>
In-Reply-To: <akz8g-zAeNuvBiF3@google.com>
X-ClientProxiedBy: LO4P123CA0095.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: caa51b2c-4dc4-433d-6e99-08dedc2c5338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|10070799003|376014|366016|22082099003|18002099003|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	90WTwOzA3ZtdxbOQ6JeqLYq/MWQLTBqaEfFvwihXVQIy3jPAWx+njj8AMEnIfucbGUS0+MifXIRe9YDrloOcGhAs4UaEs+9P/EElEkZK1PCGHgYx1xSWVIpw9TjG7l8gaJ2/Sh0mXmLvNhx/irBhW3BaqfE37/oGxxANWV+OK18Yk5LWVdpXNJhLaee9JrDRe5YllVYoI3MF+dNdCQsR/USDZN9jwjpWO6XpS/XsFHwHYpCjGdYIS5CZyXlIr3hHUpbkWFRRXhl98hO2KMaxizk/NpXDOkMHtN9D9YnuYYrbC5ClQdUYPR6dDchm1VBKfBsEFP5hD0krGaZTT3ZoFf0cnshAcbDVhL2Z4/JSW+Bs7u0R7e1rIBPlBfskTB+9Ov2ZMTpE1/KxdbJatt05cmBBKmIQJJPFH1rHiz2Z35/Eyi+PpmywB9m7fRh/SPi5iAJ4FuGzy4Nc5t08TrycRS69P0FlIkmxpHJp6DSvWimsMSSZrDWElqq0v6bsDIqQ4Et0jUeheYHaIBoWALXFTD/wHzt5S3DlZNG5MygDQ4gtzrywUg/YZEiSjo+3b9EMTL1DHGdkogiBGf5p/lW3iJ3EgWzaGrQW+TezD6hAFEXuwrOD4p5cPCLvZ4BgKQe5lFbYGKZfqDEQOmRMgM6dYa/9PS5X3+rA4BGYLQXE2YM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(10070799003)(376014)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0Y2YlNVMjF0RS9FM1J4QWswMXUvdUFuOXNsTEdSQVE3clN1MERLK3ZQbFJU?=
 =?utf-8?B?N0FCbi9pQzBqMXA5eG5EWCt1YXlmd2xpS3dWeVRSVHFpSTVYdS9Kb3QyUG9D?=
 =?utf-8?B?TFc1eXhoSEZadCszOWlVdlNUcjNlRDFzWWFBMXNtaXBQRjVQNVQyc3pMK3Bx?=
 =?utf-8?B?cVliY0pPSmtqS29OeVUxYWx5Sm9IbmZZQjdmYTVNVUxDNGRTUXNLSHExOEVr?=
 =?utf-8?B?NTY3aEVQc0krL2NiYUtpM1hKSitWdzQvZzE0aHhOWnkvdlowM3RHenViSVpt?=
 =?utf-8?B?RnQxMlQvUEJOZldxUFBnVHFZN3BKaENXVHBycHJ2dmhwYXFUTXBlWkFMenRH?=
 =?utf-8?B?YTZkUWlScWxab3NvSW5JN1g0OUVLOHJKcVFPYXdKcklVRWd6Wk1lb0d1L3Nx?=
 =?utf-8?B?L2FMVVBaWHpVQ0ttRkFOVi9PRkdOdXBuc24xbkZqa0hRWTltTUpGd0srZzlU?=
 =?utf-8?B?SzQ3VGQyQVd1MHQyS21NeFVMZWtpZ1d2U3BlUUx1OUIxWGdqREJjdGdJSU1t?=
 =?utf-8?B?eWFtMGpCWTJXTndPampWdzAxMGQwS2xRODhrVzlobjVUMzJTQ25ic3lvM2pZ?=
 =?utf-8?B?QXBieTNhK0M3NFhXN1hwVjRYS2laMWRESGFnWlJPUGZkRTdrQlJLTVd0N2Jl?=
 =?utf-8?B?VngxMEoycVQwcFMvT09GS2RpY2tWTEo2bnZsc09VQmVwWE1QcGhZZCtuMlVo?=
 =?utf-8?B?NER4TFMyVnljZ2pwU1cxRnN5a0ZEa3VmbkV3T0dBS0IwYUVLZkxiRXBpdVhp?=
 =?utf-8?B?S0ZrRHpSVGdxWDFMOEVSRjdQbTRIRjFyYlIwN2ZNeEhRcUp4enJ6RXFZMmpZ?=
 =?utf-8?B?aStLWXluYVFCbEk0K3p3ajliTURWb09IY0d2R3l6RXE2SXhycVZvcnFRdlkx?=
 =?utf-8?B?a2RPOUphbzVpOFVQQ1phRnh6NzducDkrSXlXZXV1NHhwUTlMSU0wRVJPd3Fu?=
 =?utf-8?B?NXdkTHNTeW1LT1Jja0R4L2cyUmpYZDdzak1VQjdtdWxQRUhyYkJxVVEyN3ZQ?=
 =?utf-8?B?ZjdLUGQ5eUE2eERuSGxQNDFPL3k2MEE1OFJla0Fra2QzMkN0TmZPZG1abTBL?=
 =?utf-8?B?N2RXM0UyaC96cHdGNlBaMVh5TXJraWFOcURnbnpPU05YbjVMTkpaZXdjVlVL?=
 =?utf-8?B?dFFaYXdpdWE1RjdPQ1RBb0hkckd0cHQ3aHZJNjRyeUU0VkFSWUpHRU5RZ2RP?=
 =?utf-8?B?U3FtbHlYdjlzVGdTWTBvNjVJdUl3aWo5dGVPMjBxaGU1cXZ1Vm1OYUQyUDU1?=
 =?utf-8?B?R29BMHBCMEwxUEkyZ3krdnpEVUdZcEE5b05MMjY2MG15UHhadG0rNTl2WFRZ?=
 =?utf-8?B?dE1xUzk5Mm9maG8zelVxTmpzOEh2clVVWXNHYmYvaWhvcmRwZ1RubkNBK2F3?=
 =?utf-8?B?aGUvTXZ1RHhpWFA4S0VIWnZDbGU1SFREamxNZUV2NFZpMmR3WE5Bd3hDelN1?=
 =?utf-8?B?Qk42MWlzNnZNaHIrRWNjVXB1dURxYnVQVVdlTjV3SG1sODhKMFpmbEZ6ZmdL?=
 =?utf-8?B?UzBJbDRxWFgyNlpUTFhiVng4bnZsQkQyN0JjcFhST0NZQUxYVE9HQi9lcHBx?=
 =?utf-8?B?bUdaeVB1QktwMEs4eEl4a1BuR2NXSmFJMnB3cS9CKzNqeEZRdEFRRHZiakhX?=
 =?utf-8?B?emxjOU85K3dkMy9qWVlGTm5CSjlEQ3FZOVpNTGxpb3I5c1RPTUdLUUdOelNC?=
 =?utf-8?B?aWJQRTZUMk9EQ2JFdDdNUFc4N2t4ZkNORlAxcWdKdTlOWDhSV29tdHpuVjhW?=
 =?utf-8?B?NWtkZGVNRE01R2llY21PcVJmZVN6blZlKzNsV0NkeG1vYlVleFRwNTdPUE5a?=
 =?utf-8?B?dDBqcTZtdzVRL0pFWHJ4emZqaDdWa1pWNTUxR3N4and6Uk1iZWZiWmF0enRY?=
 =?utf-8?B?WUJOeGp0bGRlaXFWdExmTTB4dFc0c1VKWEV2YUVEWE9mYU9wOUtXYU9POFVJ?=
 =?utf-8?B?dFpJMCtnSkVHNkZNZkNPL0FVcndiLzVuV0V1dWQvWERVWWRUQmFGSGRia0cz?=
 =?utf-8?B?UjVqRnh4RnQ0M3R3Nmh6dmthRnYrWkd0b3NIbjBaU2VPNVQ5aTFSTWVsL0Ew?=
 =?utf-8?B?RUc3Vjk0V3RoMHFWRGVPOXgxRXFRZWFvU3owWWJNNHBabmpNTXpUS1JYSFNn?=
 =?utf-8?B?MldtZkhYUE9zdGNaMjVFaVQ3WlJML0llUkhsZWpVQ2dBazNrYTY5Y2tzVHgw?=
 =?utf-8?B?UWEzUmZPQnFuY0IveFhxWkgvOXkzSXJEbFI4L1FUNjU0Zjl4THFYT1BKaGxz?=
 =?utf-8?B?MXhNVVdnZUQ3aG5vWXB1UWk3d1FOMmhqampVMmFsQWVXaVNXNXBvekEvRXNn?=
 =?utf-8?B?c0VTdnd2cnhtYW82VHlYbytZb3UxKzFwaUFyTEVCYm5BajRHVnNiZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: caa51b2c-4dc4-433d-6e99-08dedc2c5338
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 13:33:26.6743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6M5KeebItu/FEBlO7Lg6S1149VWsV+C/Sl/tam5hh0ftrQxVwgjJ21tjYsYpvWT2X8oBgz9q9a+SnLApkwgbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6680

On Tue Jul 7, 2026 at 2:17 PM BST, Alice Ryhl wrote:
> On Wed, Jul 01, 2026 at 05:15:55PM +0100, Gary Guo wrote:
>> On Tue Jun 23, 2026 at 4:38 PM BST, Alice Ryhl wrote:
>> > The abstractions for pr_*_ratelimited! need to construct a global
>> > `struct ratelimit_state`, which contains a `raw_spinlock_t` field. Thu=
s,
>> > add a const constructor for the `raw_spinlock_t` type.
>> >
>> > The SPINLOCK_OWNER_INIT constant isn't mirrored via a const helper
>> > because bindgen generates a 'static mut' instead of a constant from th=
e
>> > pointer constant.,
>> >
>> > The __ARCH_SPIN_LOCK_UNLOCKED constant cannot be translated by bindgen
>> > because it's a define for a struct without type annotations, so it's
>> > explicitly declared in Rust.
>> >
>> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
>> > +/// Helper for creating a raw unlocked `bindings::raw_spinlock_t`.
>> > +///
>> > +/// For use in statics containing raw spinlocks.
>> > +pub const fn raw_spin_lock_unlocked(name: &'static CStr) -> bindings:=
:raw_spinlock_t {
>>=20
>> These functions (incl. raw_lockdep_map) should really be private functio=
ns.
>
> Hmm, I think there could be cases where a driver needs to interact with
> C code directly where this is useful. Even if use from drivers is
> discouraged, I don't think we need to go out of our way to prevent it.
> It's like the bindings crate.

I think a theoretical use case is not a justification for exporting such
low-level functions. If such need arises, we can export them by then.

Best,
Gary

