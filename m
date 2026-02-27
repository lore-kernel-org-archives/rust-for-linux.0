Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020137.outbound.protection.outlook.com [52.101.195.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF662D780A;
	Fri, 27 Feb 2026 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204192; cv=fail; b=q5nIjQYZ8qTKTyENRNk7/4KmuuRHjRdyb1ZjlCk7vBULzQgEsuZEyHcRVd2Wzy6SYiApK0ELuxQbpJQW5kDqbQsmjIxnpAhDE6A5o3HqxarUQDRXIUHvqGDvfiUkUkFghx0ojulZijeOWRXFF6wCZi7AJSeiyVqyUyn0CWam468=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204192; c=relaxed/simple;
	bh=cKfS7UwhdaGUdr5AmhLI8tBPW/yXJP05Rj4joAFj9MQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bMmsz16Wqmp9YvAyyzh4paJS/hobXcO3DYpzepFR1pXinOi5ZPLG7dlYVVH/aPzYY4bj/0UCI9HmGgQrec1TPFK6jlVqDG0rmVCK34XdT+NkTNKiMp6vsDaNrFATZNS59iPbXanpqwIpwmR30hz8c2KQ7JMJF/rLzcBlIZFzznw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=max9P0ZL; arc=fail smtp.client-ip=52.101.195.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="max9P0ZL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X11sOjKM1PjtjaExqorEffVjhG12Cr+KwxGRvynYiwrPpwQ25K1ENfNriJbvVDJlaRyShFrDwvkKxkMKsogg3KBmCKoAqy5Z8EAoGUugmPgg4wvP+Xz3Gl94bcavYFd0bY19UAo/vVh+tSShWdb7d0MmQKACZKJkTJWBs8NBxPqXYMC10Etpb2QOC21vtAMGBleqiEQX2S9x5M1ovgzJFK4bkheBFI2e3QV6ZZ4c+jzcbXlpld3IJw5quHPZD3JUfwbX2W2kxZ+bRdZwPeOVleYEoMdyzVHXMVTQiYrGr7/mq7ma1QHrWzN+f/Y/Oy9l0LC1j/wNMDd3JmSZM3HtHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuxCP33ekVCTkDOkdQzZY3OunkTDqOdTzQj203+zo18=;
 b=hVWyfbCZ0WTbOohnyM2XRfyfX0r6HuVCxwE9eV85b5H/mohErk5SNu6mj4zK4zQwNB/9qSryt/ZBiJchlgpkBpFeZnNJhGpJrY2a/WN6OmxGaXAdyG4W88BmlSWzGM99s9fjeEI+nb72kHvchkdKETxsFVoKM3OXyVEbjK9J04oYYI4l+itZEV7BLfay1d4PuHwT6qf3Or/AR4+e/oplPZKBoeO8kXPfUwFobp3+FxyTMTmQrq2x12GASHEEp2AkCPawI8FQ3UBhjpUbOcJZV33ubIR/H0CSEso4Th1EoENuotfDxC6AkaaL69k5VXw9tiTCdXUFNnuX4CpNjDLfBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuxCP33ekVCTkDOkdQzZY3OunkTDqOdTzQj203+zo18=;
 b=max9P0ZLwn0GJzKnqGenH+hrD/LiWOh4TsgohrG+CroQSc1gbC9Y/mGwbGZXDSMdMpjBI7VivO7dBpFZQh1Z0KQE2tI00z8gP5z4ezic2pXmJ7QlfrKoy2kYTvF/kqOZHWxsnUgQ6WPYlFzNiFjK+dpgMlvCqXl86QDIxe5TrlM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7619.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:412::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 14:56:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 14:56:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 14:56:25 +0000
Message-Id: <DGPTYBO26YBT.3S14I9F5YT1PW@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
In-Reply-To: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 15de8271-c698-4137-f350-08de761061b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	GwYIvr1VUwJoEJL/GSlI9gfdwHtdF1Q3BAFfVonDaAlS+Xz3bEDihbDLzPntOc4GlViME6UGZohFT/g3smGk16u7z0MpCGmDjKSVAcBbYS1tDQiA75+b19Up2WtnIaf6hVvTG5SL6/jqro2S9S0Oud5Hi0V14qc/D3NerrIS2xfQdcuhx8uvJQMLzGbl7j58Mu1TZaubjmeAKaMbMRn+/OC48cptyaIPaCyXODlIjOWxnFXcDX+0ePxAubThbbRKWvW9BLuDxf2wP9k6D9eQpAKeZBeqktD9dIw380xvnuxFrDKm6LuLT+U13pll2ilxt+92z0eEZqmrchW/BYZ8TjwtJL0Nzo/YMFyt4u7Tw0rafIkoXyBoe+VSPGh3SdoFmLsfufjxuUOV6Yh2WGHTCLNlfQmh+uzfiJu/aYxEqTmC21Ccp8yfJ9vNxnTuJi2I2uQ4MboSChPH5lQZfxyiV9cLrZ+XmqNlGN8ontnYrFFC9j6MqluN7YWFnvKiXfq9kzIxjGLT6xK5qni0OYBUhf3jdskP51jnBP2jYOibbUjCk1b1DvUNWk5UIRRH1zKWRyvkncGFnCwrHafQJtzEJu8D4qPPk+sMZsWMABmzSb8FCbZhteYinkXcHpQhqUUnoxQEd3Cmik4d1p3hBz0fpyUQjnTdznkS7iLfqTmcoXiT1BxUnXGEAIQRbDPDKHT1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmxlVENPbTlvMEdNRHAxSTRqaXFRaXlXRHladjU0eVFPQ0o0WTBxZkg4aEtz?=
 =?utf-8?B?SmRuaThWMnRNM0dGUWZCRGxBWTFMR09VZ0sxcWJMMVhvejVuR2c3UjJjVjlP?=
 =?utf-8?B?bThYdllaU1QxbUNvTEtRZGZKbysyNEFQWjQyYXBGU3FnckhjanJjM2RySGdr?=
 =?utf-8?B?UVpQNTdWdzlpS0pSUzlkS0dXdzliU2RQQ1pZbnFUMW5qQTdQNVBtRVR2K2oy?=
 =?utf-8?B?U0pzcE1zQ0FrNzBkRE5BYVZxU2FZNGU5SFdkNS9UbkJRYnJjSjhvRDdybjJh?=
 =?utf-8?B?WUZTWXdTTHBJNkl6TEFYcXg4M2RwSmJrS2U2U004enJYTys5NklwYXBnM3gr?=
 =?utf-8?B?ZXVtYVR4eU11V1hDS3lGazNBb2d5Um56Qml2RWh3MWVkaTRhMTNDT2Z0T0k2?=
 =?utf-8?B?YittZVNFcVR1Y016bUJSbVVabUIxSWNSbWF4aVlEdk1sNG51VjJYejFXVXVK?=
 =?utf-8?B?R0h5NTYzeDJzRmZGSWlaaXZFeFROVVhKTzAyWmxmZGFRNS9KZTNUQURGMk5Z?=
 =?utf-8?B?QWp5aDhQYVFXZHhuMDVQRDh1Sm1nTmdQN3kzL3BmR1hFR0VUQnJhZlhxNDNN?=
 =?utf-8?B?UkpOTFZzMXdPdm9XMW9VL2I2a2xmK3M3V3ZSbzY3LzNWMmpMRWZWVzJESWNF?=
 =?utf-8?B?dzhmQ0MzNk1odE15d2pIL1Nqc2xmSFlXRnhJUXJPck8xMnBmTmkzMUE5VGZy?=
 =?utf-8?B?TExib1pDZ0lpTnRWbXBXSXVhYko5dlB1RWNBZjYwUWRKZ1N6NzBQcmF5UUds?=
 =?utf-8?B?K2FVSWd3VkQ1NzlEV2g3VVMxZmlTNnpsNy9vYXdPa3FXU1dmNXZCNldhbDhD?=
 =?utf-8?B?d3ppVnU3R0JKeCtCYmxwQVo4WDRqZzQ0TVlCYmlnTXQrbnhCeUFvNmQvYXRm?=
 =?utf-8?B?Y2R6SGN4ZE5MQU1RbW5PODQxQ1pwVU1yc054aHV2S1hvOVRBTDRhZUZGRExC?=
 =?utf-8?B?aUVxamt5T2R6eHVMMVhtTGZHNU5FWXVyVCtFbUVoc2RNMmp5OCswejM1NW56?=
 =?utf-8?B?UnhudWx1TTdQL3pRM0hKQWYrQi9kMXVPK2dMZnJaeW4zdDUrVFVHMUNDUUo4?=
 =?utf-8?B?dEdpWFVxditDRmJxUk1UVy9vckVpQXA1T1ZKMm9YWjg0WDVML0hiOHVzWUJl?=
 =?utf-8?B?ZnFscGVaSVlBdm1HTHJLK091bGNOREw1dEFIRTR2aWtSRnNVNStoZ3NrTGJG?=
 =?utf-8?B?TmVOa01OZVRMTHZiVUJWQUp0akFOUUxQa3ZKM29yenRxR1hWRmhyK0lSbFlV?=
 =?utf-8?B?U0RYRWVsbEtOU0Ezb0x0SWhNSUhVOUREc2p5VWxwYmZxSEVreXU5dHI1MG95?=
 =?utf-8?B?c1pYamM3UWxYSEdhTFVPczhvZ0VMY0VlUEdhQ1RLdlp6Vm0ycUxWakh0eFEy?=
 =?utf-8?B?dGxrUWJoejM2bTk5bDBFY0wzNzE5QjduMndlMDBjYWVyeWJTV0VEQ05HNUlU?=
 =?utf-8?B?Y0UzVUpwUXZrRndMM1R1aGVKSHRkZk1wQ3dzTDlzTVRCUE5pcHk2WWE2NnIx?=
 =?utf-8?B?Y2VsQWJrS3lqR0djOFZZVHFJelFTTjVSQkp0ZWZZYkE0OEFsN1M5aVRXM1FM?=
 =?utf-8?B?bHhtd0wwK1V5cFo2VE42N1kzdnB4ME5GM21Wa1loU1Z4aldiM1BnN2pwWlky?=
 =?utf-8?B?L3ZXRW95YnFiamwrRjdDZWFSYlE5Yk5vQnFtSzhLUkVIUHNoSWRZN09yTDRu?=
 =?utf-8?B?d010NkMvaUtRTE1zTW1HSUEvVWFFeEdLSmxVSVVRd3lQZk9iRFFjWGUvaG1l?=
 =?utf-8?B?eThpVDRseU9qdVRmMkdidFRRZ3JQazNRWkpOYnp5TUZqd1dTWVNvanpYeE5Y?=
 =?utf-8?B?WTcvS3IzUXI1Y3M2Qjd0c2pjR0ZsamVtT2V3Sml5cGIxdUk2SzZJU0lPVHZw?=
 =?utf-8?B?VmJwSTZYMHdYUDVNa2Y2L1lCRXhHMlFrNkhvbHByUnBCWmVjbitpaHQvbjFk?=
 =?utf-8?B?WmVwWW1xaFZmcmd4NkJ6T0VoK1NNRGxaRGFaVkVCUDM5SFN1bnNXYXQ0RXBh?=
 =?utf-8?B?UUl1dWFJaVBibjhHUzNkL3FQb3B5d29aT0VsZ0RRRE1Qc0N2ZXdTdmNuaGxC?=
 =?utf-8?B?WUpBQkZGSHhuR3paTW56RFh3MHVzTFFxN2d5YzBDK2ovbXFTcys5ajhCeUhJ?=
 =?utf-8?B?RG9heER5Y1lvR1FSTWNSMk1LdTNRSUptZ2N0TTlRRmlJdzA4b1NmckI4Tm41?=
 =?utf-8?B?SnRPT2lhRWJsUW15Tm4zMG13TDRQY29QMk5HSmxYZitKK2YyQTByakI1ZEgy?=
 =?utf-8?B?Rm54NmZ0M2YvSVJ4bWFkc3lzWmliN3RGYmJKc21KSlFtcElCSkVCUUFwbTdT?=
 =?utf-8?B?VUg4Wk9Vc2RLdElFVjcwVmhGUFNJV015VGcxT1J2RnNwUTVmV0NxUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 15de8271-c698-4137-f350-08de761061b3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 14:56:26.5092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtmS5HKCyWZOa35VylByHTinJccefV9L3kcSY4+8XZzIPa7uLRTZag8goRZQ1v5ofh45HlDQ1URskoWrT0XYPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7619

On Sun Feb 15, 2026 at 8:27 PM GMT, Andreas Hindborg wrote:
> Add methods to get a reference to the contained value or populate the
> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
> directly, while `as_ref_or_populate_with` accepts a fallible closure,
> allowing for lazy initialization that may fail. Both methods spin-wait
> if another thread is concurrently initializing the container.
>
> Also add `populate_with` which takes a fallible closure and serves as
> the implementation basis for the other populate methods.

Hi Andreas, in an earlier call I mentioned that I'm working on getting SetO=
nce
to work with pin-init, the capability of which I think is a superset of you=
 have
here.

The API I have is

impl<T> SetOnce<T> {
    pub fn init<E>(&self, init: impl Init<T, E>) -> Result<&T, InitError<E>=
>;
    pub fn pin_init<E>(self, Pin<&Self>, init: impl PinInit<T, E>) -> Resul=
t<&T, InitError<E>>;
}

To achieve what you need with a function, you can simply write:

    set_once.init(pin_init::init_scope(your_fn))

The patch that implement the API is here:
https://github.com/nbdd0121/linux/commit/4aabdbcf20b11626c253f203745b1d55c3=
7ab2ee
in tree
https://github.com/nbdd0121/linux/tree/lazy_revocable_nova_wip/

which I haven't submitted to the list as the user side of this API isn't re=
ady.

Best,
Gary

>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/sync/set_once.rs | 53 ++++++++++++++++++++++++++++++++++++++=
------
>  1 file changed, 46 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
> index bdba601807d8b..9e3c4be4047f8 100644
> --- a/rust/kernel/sync/set_once.rs
> +++ b/rust/kernel/sync/set_once.rs
> @@ -2,11 +2,14 @@
> =20
>  //! A container that can be initialized at most once.
> =20
> -use super::atomic::{
> -    ordering::{Acquire, Relaxed, Release},
> -    Atomic,
> -};
>  use core::{cell::UnsafeCell, mem::MaybeUninit};
> +use kernel::{
> +    error::Result,
> +    sync::atomic::{
> +        ordering::{Acquire, Relaxed, Release},
> +        Atomic,
> +    },
> +};
> =20
>  /// A container that can be populated at most once. Thread safe.
>  ///
> @@ -76,10 +79,46 @@ pub fn as_ref(&self) -> Option<&T> {
>          }
>      }
> =20
> +    /// Get a reference to the contained object, or populate the [`SetOn=
ce`]
> +    /// with the value returned by `callable` and return a reference to =
that
> +    /// object.
> +    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Res=
ult<T>) -> Result<&T> {
> +        if !self.populate_with(callable)? {
> +            while self.init.load(Acquire) !=3D 2 {
> +                core::hint::spin_loop();
> +            }
> +        }
> +
> +        // SAFETY: By the type invariants of `Self`, `self.init =3D=3D 2=
` means that `self.value`
> +        // is initialized and valid for shared access.
> +        Ok(unsafe { &*self.value.get().cast() })
> +    }
> +
> +    /// Get a reference to the contained object, or populate the [`SetOn=
ce`]
> +    /// with `value` and return a reference to that object.
> +    pub fn as_ref_or_populate(&self, value: T) -> &T {
> +        if !self.populate(value) {
> +            while self.init.load(Acquire) !=3D 2 {
> +                core::hint::spin_loop();
> +            }
> +        }
> +
> +        // SAFETY: By the type invariants of `Self`, `self.init =3D=3D 2=
` means that `self.value`
> +        // is initialized and valid for shared access.
> +        unsafe { &*self.value.get().cast() }
> +    }
> +
>      /// Populate the [`SetOnce`].
>      ///
>      /// Returns `true` if the [`SetOnce`] was successfully populated.
>      pub fn populate(&self, value: T) -> bool {
> +        self.populate_with(|| Ok(value)).expect("Cannot error")
> +    }
> +
> +    /// Populate the [`SetOnce`] with the value returned by `callable`.
> +    ///
> +    /// Returns `true` if the [`SetOnce`] was successfully populated.
> +    pub fn populate_with(&self, callable: impl FnOnce() -> Result<T>) ->=
 Result<bool> {
>          // INVARIANT: If the swap succeeds:
>          //  - We increase `init`.
>          //  - We write the valid value `1` to `init`.
> @@ -88,16 +127,16 @@ pub fn populate(&self, value: T) -> bool {
>          if let Ok(0) =3D self.init.cmpxchg(0, 1, Relaxed) {
>              // SAFETY: By the type invariants of `Self`, the fact that w=
e succeeded in writing `1`
>              // to `self.init` means we obtained exclusive access to `sel=
f.value`.
> -            unsafe { core::ptr::write(self.value.get().cast(), value) };
> +            unsafe { core::ptr::write(self.value.get().cast(), callable(=
)?) };
>              // INVARIANT:
>              //  - We increase `init`.
>              //  - We write the valid value `2` to `init`.
>              //  - We release our exclusive access to `self.value` and it=
 is now valid for shared
>              //    access.
>              self.init.store(2, Release);
> -            true
> +            Ok(true)
>          } else {
> -            false
> +            Ok(false)
>          }
>      }
> =20
>
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260215-set-once-lazy-c73fc34a55d9
>
> Best regards,

