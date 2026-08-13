Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021140.outbound.protection.outlook.com [52.101.100.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AA2331A6E
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 14:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630607; cv=fail; b=dJNVFQKY1TD5c1eVlWFzgs1k3o2L3pWxKWJEBxWd97AL/bk3xOsgk/3S4dFIWcHFjkcVhKewze6ZR+6FIZwOekQgjbSNPXP15JW8f6oktuv3TpihWXQjUIXq22q3KZrlouZGPdhLM1QWU9dDqsleSgtyQwXMqsBPjHGwoLrRme8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630607; c=relaxed/simple;
	bh=efWClM6Yp+lAbD7NFqC1k5LBzLod1Prja255HSX8zXM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=U8Uz6yYRgdCHRSIo38Q6/w3hl6GT3OPeElHNngWOCKo3mT/Akgqnn2Q/9ugB1IwQQMSqh8xktDTNsvPtHMw9iGYOx5zpz30hV3ZTOkHdKDGWSxUC5GUyiepUuWlUaAF/+UF0JMrBAexp1pX0xTdak8fJCHE5+VQFtIra4p2pIR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=BZBCcKFu; arc=fail smtp.client-ip=52.101.100.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="BZBCcKFu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgEGZk3bBgfoFf7eyUY2R53fB8fcdTsnM27xIeP8VSsIhbNcOg0wviH1xIf9JVVczQYxBuc56wDo6Pwo/EyWZXPYd/0rpvdwKPozGJQpQ3N5YanAV51Ikbo+V+myDx0sRhNMTbSRjXav1oMccRoM5SjqBmZmiSN2CL2jZMOkk03LPpnrex4btZYTW6G3E/s8RBvMCRDAP/QxFUvWMvdiCmSxLtx8EWXfCsPApl5OZTswAl62Rjf/OhF74LOAkfWFF9eqiGHkV2ZUF97aCGgy0JOCeN4oBGqcKRI365ZucUZoJw+XcEHLCjRQrRaThycqH9pjGi3QejP8/zN3710EHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojlzTzsHo5xlF6oxV58BsV0YA5OGF/L5rX/0J+mAfvI=;
 b=tdRp6JZLo6Ii/Vcf80l2jztmZU46YCSOXtwnH2sH9SBx+EQGpu5AJD1VsY1r83akC22+11RgMf7ZK0CcjUh1TvV6zOTtspBTpQyJ59X014xNWf7TkBNOt59/E4h/eknngonUSR8awyUAvhF7CPjL6MAV5e67HADvqz+2mU4gm16jGT2FBXM7oBM4+3j8gOtsKl/NB4Y6P2ZHyj8LThNZ9WfFFDNW3UJXZUPTFBlJQgSuC/I2Asg+Ywu+QmJQUNd9T0Ytr89IutB5HvL+o9JK7nzr4kgvZI2qNW17PRTmgq8JLN2mW/FZw6SLngbByB5P2ovr005VYQIhjZ1732uWoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojlzTzsHo5xlF6oxV58BsV0YA5OGF/L5rX/0J+mAfvI=;
 b=BZBCcKFuDBH+shfvz3JENMwmejrx8vY6SVN/4MGO4XJj7MqfjAOT+pcCQlca2U/pcxOkhIXdjCRhUmzSMTYZQkZRu33WKnFMXW0GvUxilvlM+fwLUNqE2if5s0vfBW++x8WfJsmJRaAVFaOgTJB7MVozB0fZct/A4n7MOzczZqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB6221.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 14:16:40 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 14:16:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 15:16:38 +0100
Message-Id: <DKNVOU9JC15P.3DEBNZ56QK20E@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <a.hindborg@kernel.org>,
 <ojeda@kernel.org>
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <anna-maria@linutronix.de>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <gary@garyguo.net>, <jstultz@google.com>, <lossin@kernel.org>,
 <lyude@redhat.com>, <sboyd@kernel.org>, <tamird@kernel.org>,
 <tglx@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent
 arming
X-Mailer: aerc 0.21.0
References: <20260813134834.1562995-1-tomo@flapping.org>
In-Reply-To: <20260813134834.1562995-1-tomo@flapping.org>
X-ClientProxiedBy: LO3P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::10) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO6P265MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 3575b3ff-96fd-4fc2-d5fe-08def9457e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|10070799003|366016|1800799024|6133799003|10067099003|5023799004|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	L/ckMc8ddheErmtfDF2J9g7KSlsXSTG7PirphtZ4L3Ygs3KXSiL2uYUqwSMuakIFh6vpmAQXV93CeoZIUPEjhStBX9I/JZUPFGlJgbjwSForaxu453CNrcqMMRBLFwA/+dLcQkdoK5k0frnAs5YQCyDVZPVT8JowkGi0qVeq2TUvH18O+AbgN2FMBvjig3KBEgcM0ueecD+540RKkbZfVaBL92FcLaHNqCq4PKznfha8LSYTHRvmZoncmX5/9FvoMhl1z8VX1A2QdGY0dfqbsbY70r0M4pZXYCiCs/6vT1a8uP2K0o+hCb5sr2KaEGxQYsJ2cOwbXyB5tsmTeiqX98mN958R4PjQpFA4iy7+fKFA9wPjaPaKE+2nqa7MrXn1U09byfkr/5jf44uEsWZQgSQi3d+fLUsZPHJlV2kN0WR1ocxsu9KtVy8FfcmS31T1+NVYlzdJI0Y42AFp7XML63HK+6AkOMCG4/TOwGVJpr6ktDI5+UHCRwPvjFlL6OSz8B4Vbb/o5I4kghTDClKGVsfSlyNG6THKPe/3xzVX1c1CQej9Cg/3H0+ym4xFE1UNPFq9nAwyPPaO6DgY9UjbG4e2rBHSRH5Qg6fPD9hkYxQJY8aPgVzN508sxiR4u9oOSbC3BORHVgh3Wmgat1KbzABHOa33DKaXgWLKCbaK5o0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(10070799003)(366016)(1800799024)(6133799003)(10067099003)(5023799004)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mmt6VDgvdERoaFBlRnBUenJhODBiK1J3bXU4akZudG1EUnA5ZStWdHNmcEoz?=
 =?utf-8?B?TTVqZ2dKYlNaNVlUSHJ3cXlKU3AyKzEyQ01HMkRwYkluUmZIaE9sZmdaRE5L?=
 =?utf-8?B?UVFHNDZoUnpBSDU5WVJ2MVcwakg0NmY3MmRIblBLeW9DYllzVG01cE5ESHpr?=
 =?utf-8?B?UGlXVjJIWEdIYjY3Nk9lYWdJUEZ1YTdmUXZYSk1YRjhRbk13R3NEaUhwV2hM?=
 =?utf-8?B?OFNXOGVxd1c4NXhWYld5QStqNnd5OGpDQ0MvUG9WdncwSXBnR3UyQnhhb2lD?=
 =?utf-8?B?RHYzRVNoU0pxVFNHQlVSeTZTdGQzbmV2RHRMZlZQRTA3ckxnakdlYnkrMVBC?=
 =?utf-8?B?S1hZMElsUGVDUjF1Vm9ZTW0xVUhYNGtaTmxjYTdRN3VhMUFlcGJCTW5JaTZC?=
 =?utf-8?B?NDF2czVDV2d5RStCS2tMeXc4NTVQOTRENCtjNzlYbGIyUGJENld6OFEvMVBq?=
 =?utf-8?B?dTd2Zktxb3ZaeHlpVm0zTG1mcVFtcHl4My9LMTU3enExdDRPNzlNT3dzRFFy?=
 =?utf-8?B?KzA4WUtBZzdjWklRcXdrOEJxMFpOZ0RmU0FyNnFTeDF1cktTOHRVQ2xPVzk3?=
 =?utf-8?B?ejZ0ejRjdG4yZUwrQ2N3OTRHL2FWOXdsYmk3MTkvYXpvQW5KRmpDbjhQeFZv?=
 =?utf-8?B?cjU4QWY2RVFOS0lZYjNKZXFKQTFYYStza1pBcXhOeEVQaE44Z0RPUzl3NW9I?=
 =?utf-8?B?S1NGanQwNHNvVU5tTG5xMTVtU3JEMSthNXlhcWE1WGZPRTVZZ25UWmUvb3NR?=
 =?utf-8?B?Y1lUREFYTXZlR1g5dGVDZTV0NGppOTZqdFBERGpxdHNzaHR3ZllBbGYxdWlv?=
 =?utf-8?B?TFE5U3RKR2ZnQm00WVgxOGhlei9BYUpQTkNOaWdxbXFoMzdoOWdQU3lHZ2tr?=
 =?utf-8?B?Sm9pdlNrcW0vMXlyM2RaczZ3RVFLMTdhdkFqcElQRlB6dWRnSVUrTVZUa2h0?=
 =?utf-8?B?UGVydFF5U0ZtMGtHQmFxYjJrQ21mdHUxbWxNNG5CNWZkblc1dmQxSFVWcmQv?=
 =?utf-8?B?QWpsaXZiWTViRW9pdnMrbW9NdE9rTXZUajVoSk4reklMZUJBcld5VDhOcjR4?=
 =?utf-8?B?enZBMTRYUEpGQmNEbHd6M2NEaFBIbEptd05sYkJXK0o5TkdmY25TdUVDZWV0?=
 =?utf-8?B?QlJYaDNLU09EWUkyWVo4YWs3V3RPS3hsZ2NSbkpTOE02dEhVV2VTbVZUQkpD?=
 =?utf-8?B?UmRDTEJMdG5QQ2xyRG0rZGRFZUZuOVdXR3dINFM5b0FFT3dIV2xuQ2R1aEw3?=
 =?utf-8?B?TjdSZWZGSCtkWjhlZlNGSUo0M21GRWNFaXZmVXRjNk8rWTBDWk9DR3VQbHA5?=
 =?utf-8?B?Rk1ET3dsSlVRK1p6ZThkd3JCRTNhQzNiSFVQdTVWVS9FYmh4VDFsdEM1TFlQ?=
 =?utf-8?B?M2NjMjZ1bVJ2UTNUd0RtUUs1U0RCUGU4UFVDZHg4Z2tpbTY3a2YyaWl1ZmJZ?=
 =?utf-8?B?QlU3bFBjazN6SG1yMFNyRTBET0RpS3FYN2gwV3FGTnV2QkdlL2h6bXR5TVJp?=
 =?utf-8?B?RERDRWxvWk9tSDZQSE1reElLMituUXU5YUl0cGNqcUUwcVVFRXVDbzJGNWlz?=
 =?utf-8?B?SVZFOU1SUGFFZlUvaldrV3hQR05MZStjTEFrekc5RnZXczlDZEYrZXIyL2tm?=
 =?utf-8?B?aU1lcE1Wd2hMbVV2bHY4RUxQN0tvS29lZElRcmxtc1QyNUduT0FUK0ZsRFQx?=
 =?utf-8?B?ODVBN0Q4TU9zbnlROU1vaEN6TnVNRWtQb3IxSE92aVlPSXZRZ1I1cVRpdWJV?=
 =?utf-8?B?ZE9rK0lKeDlXWmFtakF0SjhrdGE2RWkvL1UxcmIyZytZNkZIUTMrVVFqMmZR?=
 =?utf-8?B?Uk1udnduWXNLOE1WMUxqOS9LcFFpNEZncFBqWWZFME94S2RWeGdRTGNZaGJi?=
 =?utf-8?B?U2xrSk1lOEJsL1VWZm1wVlBSQVg3bFdvTnN5TjRvbE8wTVAwYS9MZUpwU21T?=
 =?utf-8?B?Njg4ejEySERwSklQZFpNVWJ5dytDZ2hnMndTbDRwNjlpVVVTenBJUkFWT2RB?=
 =?utf-8?B?d1FRTXZLdUZZeHNKd01TbjJDOW1RWGgzZzREc01La0w5dExtZSs5Vnl2dHRu?=
 =?utf-8?B?alkvVjJBOCs2NnRra3dUVWRjNlZWdGU3SjUrK3dVSXUrUHlnTFhNa0VMcnYr?=
 =?utf-8?B?WlRKSy9YOSsyMjhRZWNrREpScDdMb0Z4NkxsUXFPSDJUNCtxa3EvTjZLeTFt?=
 =?utf-8?B?RUl4MEtpWis5dVZpbzEybDZqS2ZDWkQ2bEpxSVlFVkFtaDlvQUhpZHU0Tlpt?=
 =?utf-8?B?bS82ME93WEtndnM4c2ZqRWNVVTJPTTNtOUUrZGRkR1NkbE5iSW1udlJjVm91?=
 =?utf-8?B?NWF0bE1PclhsL2hmRU9HRVF2VlJNbjB0SGUzL3hFN0Zwak5kUnBYZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3575b3ff-96fd-4fc2-d5fe-08def9457e09
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 14:16:39.7485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lh9y+5u6BXawnuSH39qT6UyMB5dvlviIEDCTACF6VZCrICHi8ID4MRIpOrE1nM0xW1e8koftay96zlWVMea37w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6221

On Thu Aug 13, 2026 at 2:48 PM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> This series started from the review of patches 3 and 4 [1]: a hrtimer
> can be armed from any CPU at any time, including while its callback
> runs, so restricting HrTimer::expires() to the callback context is not
> by itself enough to remove the race.
>
> It turned out that expires() is not the only problem. A callback may
> also change its expiry time with hrtimer_forward(), which is sound
> only because __run_hrtimer() dequeues the timer for the duration of
> the callback. Arming the same timer from another CPU puts it back into
> the rbtree while the callback runs, so hrtimer_forward() then changes
> the expiry of a timer that is queued, without the base lock and
> without re-checking the ordering, which leaves the tree unsorted.
>
> Two of the four pointer types cannot construct that
> situation. Starting a Pin<Box<T, A>> moves the box into the handle,
> and starting a Pin<&mut T> consumes the exclusive borrow, so in both
> cases nothing is left to arm the timer with. Arc<T> is Clone and
> Pin<&T> is Copy, and both of their start functions are reachable from
> safe code, so safe Rust could arm a timer whose callback was running.
>
> "No arming while the callback runs" cannot be expressed in the type
> system, because the callback begins when the timer expires rather than
> at any point in the Rust program, so patches 1 and 2 use the stronger
> "no arming while armed" instead. hrtimer_cancel() waits for the
> handler to return, which makes that the point where the right to arm
> can be handed back. The right to arm is split out of Arc<T> into
> HrTimerArc<T> and out of Pin<&T> into HrTimerPin<'a, T>, both
> non-clonable and consumed by start, modelled on ListArc; the object
> itself stays shareable through plain Arc references and shared pinned
> references respectively.
>
> Patches 3 and 4 are the previously posted expires() and
> repr(transparent) patches, unchanged. With patches 1 and 2 in place,
> the callback context has no concurrent writer of node.expires. So
> HrTimerCallbackContext::expires() is sound.

I am thinking about this and I wonder about a different approach: the only
reason that we're having this issue, is that `expires()` call and
`forward`/`forward_now` is executed outside the protection of the base lock=
.

The fix is easy -- to ensure that they are executed with the base lock held=
.
The callback wants either:
* Do not restart the timer
* Call hrtimer_forward[_now] and restart the timer

So, if we change the order from

    unlock base
    restart =3D fn(timer)
    lock base
    if restart {
        queue
    }

to

    get expires
    unlock base
    restart =3D fn(timer, expires)
    lock base
    match restart {
        Restart(now, interval) =3D> {
            hrtimer_forward(timer, now, interval);
            queue
        }
        NoRestart =3D> (),
    }

then we completely eradicate this issue.

Alternatively, we can add another spinlock to protect `expires` from race
condition from within callback and concurrent restart -- that is what perf =
core
does: perf_mux_hrtimer_handler and perf_mux_hrtimer_restart uses the same
hrtimer_lock to prevent race.

But further complicating the type system to prevent concurrent restart soun=
ds
like a bad approach to me.

Best,
Gary

>
> [1]: https://lore.kernel.org/rust-for-linux/20260807233039.1091842-1-tomo=
@flapping.org/
>
> FUJITA Tomonori (4):
>   rust: hrtimer: Introduce HrTimerArc to make arming exclusive
>   rust: hrtimer: Introduce HrTimerPin to make arming exclusive
>   rust: hrtimer: Restrict expires() to safe contexts
>   rust: hrtimer: Make HrTimer repr(transparent)
>
>  rust/helpers/time.c                 |   6 ++
>  rust/kernel/time/hrtimer.rs         | 135 ++++++++++++++++------------
>  rust/kernel/time/hrtimer/arc.rs     | 113 +++++++++++++++++------
>  rust/kernel/time/hrtimer/pin.rs     | 107 +++++++++++++++-------
>  rust/kernel/time/hrtimer/pin_mut.rs |   2 +-
>  rust/kernel/time/hrtimer/tbox.rs    |   2 +-
>  6 files changed, 249 insertions(+), 116 deletions(-)
>
>
> base-commit: 643a7c306b8ce32743d4f94dd700c8588be37e66
