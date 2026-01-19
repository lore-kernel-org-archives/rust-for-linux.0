Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C027E07E
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823904; cv=none; b=UqW84/djzUVnQIxOrOoNwPVC6ytWtOBbReu0gHdrd5ZpF+D1prMwJpfFeKa5pMOiiXYqRp9vjSewvVYnCcRtb/MFATCftoRRQV0rowyaIf8nILXQIQFiQBn889gIVN0fZJyFt3kcoGBP83A4+seIvARAygfEeKMJmgu7OyxLtCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823904; c=relaxed/simple;
	bh=jQvxSW0SiBKXbCOXWix0eR8evNL9UchZ1fLLDAXr3OM=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=S8PLyb6GmeLWdiVulifPh0vp4qT5K/8X4dpF7e8NtCxu1IN/I43MUxEysAWJBvHH3b20f/uKpPe5l/NBFUAO7LnZcxItUsHXVoHStsYbKsL7KFFJ7Hb6Fv7YR+bAd0NxEHuP5GHTnWfaBtWYowcQb1NIINtC9aIJvEsVFxnnSWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVW6g//h; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVW6g//h"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a09d981507so31954815ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 03:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768823902; x=1769428702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZhTgLfi+v6VJMGHRkz4UShj6I3zr9XMF0TcaWer6Hw=;
        b=CVW6g//hc3DGuM/y9xfgdiOepvBoxIbQlkFYCIR/JWiOmc2RyDx13pp3OJ3qKbIPW/
         QcgRJR+YS3/CUs4U3z9KPPAJm/8ayDnjf8SqJBPRS/7w9HSCvFmNM0D6KFUiwXglJvwv
         PskxaNNgWabPZKvSvb4TsSz3b8yOWDQ4wLRy18aybEozxbDh3D8VJX5/FtmuPyiLv0S6
         s2qcaMP3OaLwjHf56CfGhtPE6CRp2TdljAUHlcaYI2mcbof7ZbyKmQdGB+0/ugEqqMJs
         oD9wJyWp7n7VRqQ65DOagq/YzgrQZkyE8mT2olBJIhCsGq8hmFXBG98N00wWDrX4MrjK
         eWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768823902; x=1769428702;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZhTgLfi+v6VJMGHRkz4UShj6I3zr9XMF0TcaWer6Hw=;
        b=bagZxBXalGTQx1XhCjRr99G5cnveiFuelWMw4C3pIHKF7iPF6+b3FIR5Kbek8fC89i
         pGNi75J262THceP5Y6il9oEmRoayrrRL/I6nO6V+gnTmyl9U4oca0T+6JLwKxVLc7Ijf
         0GJ1uMgvM21h2fP2QQIpTj4v1JEXZz4EpdqfLTBW+uwz0KMn1PcXDoTkpBQDJHpW9rus
         OYB5ECd1pIKfN09nstsloOI4puvsJHmAzl5LQbkhfj9ch0udP6B1AiKwLamVnnrUKW1N
         KdONla6EWiQ/X/zGq17eN0OJGBV45FkWM2P2tzSIAli8gmeUNvh8PeD3jtz80R03Ja6j
         NYRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/c57gRcb24bPqep3yn/Z0TLGTEaIBdtISK+6E0EkgrQXujjEEYjGRDH0jZNJHcKQSimcJ70zHHfCFUoLoOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBf2Y+IREOLZcN3GlAyec8w+RWTOmwhRIQlsF7lweG8sI+9kC0
	yH17QEuCDA7IfF8YgkZKOtwih/R99Ju8tBIIE7lati8hM2ZBJIw9qgWj
X-Gm-Gg: AZuq6aJw2NDRXoXPIE9jthof6UNXF5V6HHWs04f3iAWavWHcRSKcBwrJ68S8ync2daD
	ZSp3of0CPN8x+JK9YDXHx0CFU7UnxcEdlg2b/pn6RSS9NA0FFHj279ry5LD4dBGAk8JF2ekiI4C
	U1/RILpYOUwwPx5hAyAW0nIiskQJEBmNdEmd3Hh8H8YHmdS7/m15DfMO2D7N3JuUzk/A0CHbncF
	FmUJPKmbCe7nfHqHpzqsC1+apxdfLUJ1DaPJesqVHe7ZA7VC9ZE1s134WrFv1G2Vca4Y6jyR0U5
	vnh9D7n6GHSzsgA9WI7j3arKjomH3Gu8sOg75MRxgfHAJsE2gK9qiOpyCYPlYG3kExrzqScjya+
	LEnEfZYTE4KF7gkJLOKf+pkFIjJ21nE2I3u0X/IvYMu+VgqqfWoeDD49s2ZJxPeLGSu5RhS7HVJ
	GW2zCdCepj7ZjNRiG9qVmfQw1KcG1fNlKLzWtRm7LmqZ4cNmdLtyTRXQrdAsIIW51GpN81svKfn
	jDFpg==
X-Received: by 2002:a17:903:8c7:b0:298:45e5:54a4 with SMTP id d9443c01a7336-2a7175460acmr107232565ad.1.1768823902358;
        Mon, 19 Jan 2026 03:58:22 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fc503sm92983975ad.75.2026.01.19.03.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:58:21 -0800 (PST)
Date: Mon, 19 Jan 2026 20:58:16 +0900 (JST)
Message-Id: <20260119.205816.296364426219257330.fujita.tomonori@gmail.com>
To: dirk.behme@de.bosch.com, a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, lyude@redhat.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, lossin@kernel.org, sboyd@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] rust: hrtimer: Restrict expires() to safe contexts
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <d817b1db-7f49-4220-ba82-1c8a750c84f1@de.bosch.com>
References: <20260110115838.3109895-1-fujita.tomonori@gmail.com>
	<d817b1db-7f49-4220-ba82-1c8a750c84f1@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 16 Jan 2026 07:20:44 +0100
Dirk Behme <dirk.behme@de.bosch.com> wrote:

> On 10/01/2026 12:58, FUJITA Tomonori wrote:
>> HrTimer::expires() previously read node.expires via a volatile load,
>> which
>> can race with C-side updates. Rework the API so it is only callable
>> with
>> exclusive access or from the callback context.
>> Introduce raw_expires() with an explicit safety contract, switch
>> HrTimer::expires() to Pin<&mut Self>, add
>> HrTimerCallbackContext::expires(), and route the read through
>> hrtimer_get_expires() via a Rust helper.
> 
> 
> Do we want some tags here? E.g.:
> 
> Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
> Closes:
> https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail-host-address-is-not-set/

Make sense.

> Some quite minor nits below (which might be fixed while applying?):
> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>   rust/helpers/time.c         |  6 +++++
>>   rust/kernel/time/hrtimer.rs | 49 +++++++++++++++++++++++++++----------
>>   2 files changed, 42 insertions(+), 13 deletions(-)
>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>> index 67a36ccc3ec4..5be4170dc429 100644
>> --- a/rust/helpers/time.c
>> +++ b/rust/helpers/time.c
>> @@ -2,6 +2,7 @@
>>     #include <linux/delay.h>
>>   #include <linux/ktime.h>
>> +#include <linux/hrtimer.h>
>>   #include <linux/timekeeping.h>
>>     void rust_helper_fsleep(unsigned long usecs)
>> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>>   {
>>   	udelay(usec);
>>   }
>> +
>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct
>> hrtimer *timer)
>> +{
>> +	return hrtimer_get_expires(timer);
>> +}
>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> index 856d2d929a00..2c6340db1a09 100644
>> --- a/rust/kernel/time/hrtimer.rs
>> +++ b/rust/kernel/time/hrtimer.rs
>> @@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>,
>> interval: Delta) -> u64
>>           self.forward(HrTimerInstant::<T>::now(), interval)
>>       }
>>   +    /// Return the time expiry for this [`HrTimer`].
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `self_ptr` must point to a valid `Self`.
>> + /// - The caller must either have exclusive access to the data
>> pointed at by `self_ptr`, or be
> 
> Would "... pointed to ..." be better than "... pointed at ..."?

I think that both are understandable, but I agree that 'pointed to'
reads more natural here. I'll change.

>> +    ///   within the context of the timer callback.
>> +    #[inline]
>> +    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant<T>
>> +    where
>> +        T: HasHrTimer<T>,
>> +    {
>> +        // SAFETY:
>> + // - The C API requirements for this function are fulfilled by our
>> safety contract.
>> + // - `self_ptr` is guaranteed to point to a valid `Self` via our
>> safety contract.
>> + // - Timers cannot have negative ktime_t values as their expiration
>> time.
> 
> ktime_t -> `ktime_t` ?

Of course, I'll fix.

>> + unsafe {
>> Instant::from_ktime(bindings::hrtimer_get_expires(Self::raw_get(self_ptr)))
>> }
>> +    }
>> +
>>       /// Return the time expiry for this [`HrTimer`].
>>       ///
>>       /// This value should only be used as a snapshot, as the actual expiry
>>       time could change after
>>       /// this function is called.
>> -    pub fn expires(&self) -> HrTimerInstant<T>
>> +    pub fn expires(self: Pin<&mut Self>) -> HrTimerInstant<T>
>>       where
>>           T: HasHrTimer<T>,
>>       {
>> -        // SAFETY: `self` is an immutable reference and thus always points to
>> -        a valid `HrTimer`.
>> -        let c_timer_ptr = unsafe { HrTimer::raw_get(self) };
>> +        // SAFETY: `raw_expires` does not move `Self`
> 
> Missing period at the end

I'll fix.

>> +        let this = unsafe { self.get_unchecked_mut() };
>>   -        // SAFETY:
>> -        // - Timers cannot have negative ktime_t values as their expiration
>> -        time.
>> -        // - There's no actual locking here, a racy read is fine and expected
>> -        unsafe {
>> -            Instant::from_ktime(
>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>> -                // FIXME(read_once): Replace with `read_once` when available on the
>> -                Rust side.
>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>> -            )
>> -        }
>> + // SAFETY: By existence of `Pin<&mut Self>`, the pointer passed to
>> `raw_expires` points to a
>> +        // valid `Self` that we have exclusive access to.
>> +        unsafe { Self::raw_expires(this) }
>>       }
>>   }
>>   @@ -729,6 +741,17 @@ pub fn forward(&mut self, now: HrTimerInstant<T>,
>>   interval: Delta) -> u64 {
>>       pub fn forward_now(&mut self, duration: Delta) -> u64 {
>>           self.forward(HrTimerInstant::<T>::now(), duration)
>>       }
>> +
>> +    /// Return the time expiry for this [`HrTimer`].
>> +    ///
>> + /// This function is identical to [`HrTimer::expires()`] except that
>> it may only be used from
>> +    /// within the context of a [`HrTimer`] callback.
>> +    pub fn expires(&self) -> HrTimerInstant<T> {
>> +        // SAFETY:
>> + // - We are guaranteed to be within the context of a timer callback
>> by our type invariants.
>> + // - By our type invariants, `self.0` always points to a valid
>> `HrTimer<T>`.
>> +        unsafe { HrTimer::<T>::raw_expires(self.0.as_ptr()) }
>> +    }
>>   }
>>     /// Use to implement the [`HasHrTimer<T>`] trait.

Thanks for the review!


Andreas, do you like me to send v2?
