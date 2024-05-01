Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0ED7710B
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714563433; cv=none; b=jHxqmv6zGSS41GfvvD1EzSentXHWwYJWBJDlT/LM2EePUt1vLYBlegGL2vmxVUvJQKmfcjiqaNqQeXWQF0tjWhygXOPN9F7yCTmEw4V6kHsnF+0z0dKMM9jXVCMQxQT0HmdULEG2/lpJz0Tab/rg/SDH9p3ebmk2i03VhbquDpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714563433; c=relaxed/simple;
	bh=I8ZOvKDmnHpoDeeCfIBcoHBvCL0HKsayrdpo6OGfZ2Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fAR/5YcJgWj3owGdf6fGomTpS6QaooI5zEr4qL3I4cPkPxCL95SvxtqQU2bGUxIx+zspbGkea7S6ga0vrQURnCEXP6gN7qvXyAP5L9dPDZghpJmzHMTMBzGVuNdsvLqjS3H64J3Jjrmbjf7bXj2o/IMxDFN7knLW9CRopCebjzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=biLkbaCq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="biLkbaCq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-347e635b1fcso5090421f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 01 May 2024 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1714563429; x=1715168229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IG5/quJWFmfDCJiDcJk+VNFQbi8uBoxA9kjLvqd6ZU0=;
        b=biLkbaCq4da1+LjE0ZsWEoM0MPkElxuKHzsdT4kfyu+UDZK7BAgd4ojtzqkSLYE+Xm
         4/W506L4pXHVa83bojO7nap2IrbONeKNRXQSu1kj6di7rtafXka5U0Em7syvVCN8xtye
         tJ8gUOVXJbdeNUuYpqWpiGwQpxHcDcnkvngXyZL7KBwHRdbWqh8qaFB/Hnypi0gbgG/N
         Ct6Mu+X5Y4Em72B32LI/HMiMDSJEmpHBAc06fbaEqC+/sQ4qnkqxjEFXw1W2FE8/I/i/
         1hkTY/DRW/cqeJK0CGMRBBpZeG1VDd8XE7JlYP91v5wMN59FwMsikMdlRsB5DWdoYmB2
         sNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714563429; x=1715168229;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IG5/quJWFmfDCJiDcJk+VNFQbi8uBoxA9kjLvqd6ZU0=;
        b=vArFhDdtWJowXWAtn12pHdfYAagw3VsjSdwFDrD06lDWMWoOKVZ+M7AJ7Ih5B4aw9q
         CE4N1vu9ZrdP/17SmoMUx093AcoYiTsg7/6O4XVXN9pym47sDNxDTYCcFr5VS16t8LfW
         9/BAQ1CHPFUhhVS2XkDCrFqHxnJBmKuEP76KEvj4KASconRc0SaPnCMj9RYv003tzyTe
         hECMvVzvIFLP94KnIhStqS2KvtWi7+ixcjXtMH8tBb3zQ1yDP1Wv6YT5KIdXa1E9WztP
         +JQje9QpRH/2H95Hx9FTdvHpMbgjfjbMtyT4Tgm3tzMQR2nuZuwNxSeP6HhPWNAFtQSa
         089w==
X-Forwarded-Encrypted: i=1; AJvYcCXi2X1dCx+hrWue9Bx7caQyGcVesL7TbyUkGztaKFYax2BP/IjI8YzbAyNqBzlqv9XftrsAg5pfD+WuEaVfk1Un9DlNFqgTMj0/4tTcMgA=
X-Gm-Message-State: AOJu0YxGbaF4mHm+7S9CFahaDHb5oolYdwnUtvXVPY9+1rSQ7JXGdO6A
	xzMC6N7ripMeO8L3amJLXNu+KimZh7PTsEQssT23hGvI/hxsGIX2xuzTPU3WRUU=
X-Google-Smtp-Source: AGHT+IE9vHAXQZXMDFbK6G1UR1ZR/zumQD8aczVM+x+syL/lx6iNkEFAFccxE/7dWhl41rvM6vgemQ==
X-Received: by 2002:adf:f302:0:b0:348:b435:273b with SMTP id i2-20020adff302000000b00348b435273bmr1455887wro.54.1714563428531;
        Wed, 01 May 2024 04:37:08 -0700 (PDT)
Received: from localhost ([147.161.155.113])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d4d90000000b0034c59c41f45sm13341917wru.7.2024.05.01.04.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 04:37:08 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Wedson Almeida Filho <wedsonaf@gmail.com>,  Anna-Maria Behnsen
 <anna-maria@linutronix.de>,  Frederic Weisbecker <frederic@kernel.org>,
  Andreas Hindborg <a.hindborg@samsung.com>,  Boqun Feng
 <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6?=
 =?utf-8?Q?rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Benno Lossin <benno.lossin@proton.me>,  Alice
 Ryhl <aliceryhl@google.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: hrtimer: introduce hrtimer support
In-Reply-To: <87ikzysd36.ffs@tglx> (Thomas Gleixner's message of "Wed, 01 May
	2024 00:25:01 +0200")
References: <20240425094634.262674-1-nmi@metaspace.dk> <87r0emss0j.ffs@tglx>
	<87le4uk936.fsf@metaspace.dk> <87ikzysd36.ffs@tglx>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Wed, 01 May 2024 13:37:00 +0200
Message-ID: <87cyq5kbkz.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Gleixner <tglx@linutronix.de> writes:

> Andreas!
>
> On Tue, Apr 30 2024 at 20:18, Andreas Hindborg wrote:
>> Thomas Gleixner <tglx@linutronix.de> writes:
>>> On Thu, Apr 25 2024 at 11:46, Andreas Hindborg wrote:
>>>> +// SAFETY: A `Timer` can be moved to other threads and used from ther=
e.
>>>> +unsafe impl<T> Send for Timer<T> {}
>>>> +
>>>> +// SAFETY: Timer operations are locked on C side, so it is safe to op=
erate on a
>>>> +// timer from multiple threads
>>>
>>> Kinda. Using an hrtimer from different threads needs some thought in the
>>> implementation as obviously ordering matters:
>>>
>>>      T1                              T2
>>>      hrtimer_start()                 hrtimer_cancel()
>>>
>>> So depending on whether T1 gets the internal lock first or T2 the
>>> outcome is different. If T1 gets it first the timer is canceled by
>>> T2. If T2 gets it first the timer ends up armed.
>>
>> That is all fine. What is meant here is that we will not get UB in the
>> `hrtimer` subsystem when racing these operations. As far as I can tell
>> from the C source, the operations are atomic, even though their
>> interleaving will not be deterministic.
>
> That's correct. All operations happen with the associated base lock held.
>
>>>> +unsafe impl<T> Sync for Timer<T> {}
>>>> +
>>>> +impl<T: TimerCallback> Timer<T> {
>>>> +    /// Return an initializer for a new timer instance.
>>>> +    pub fn new() -> impl PinInit<Self> {
>>>> +        crate::pin_init!( Self {
>>>> +            timer <- Opaque::ffi_init(move |place: *mut bindings::hrt=
imer| {
>>>> +                // SAFETY: By design of `pin_init!`, `place` is a poi=
nter live
>>>> +                // allocation. hrtimer_init will initialize `place` a=
nd does not
>>>> +                // require `place` to be initialized prior to the cal=
l.
>>>> +                unsafe {
>>>> +                    bindings::hrtimer_init(
>>>> +                        place,
>>>> +                        bindings::CLOCK_MONOTONIC as i32,
>>>> +                        bindings::hrtimer_mode_HRTIMER_MODE_REL,
>>>
>>> This is odd. The initializer really should take a clock ID and a mode
>>> argument. Otherwise you end up implementing a gazillion of different
>>> timers.
>>
>> I implemented the minimum set of features to satisfy the requirements
>> for the Rust null block driver. It is my understanding that most
>> maintainers of existing infrastructure prefers to have a user for the
>> implemented features, before wanting to merge them.
>>
>> I can try to extend the abstractions to cover a more complete `hrtimer`
>> API. Or we can work on this subset and try to get that ready to merge,
>> and then expand scope later.
>
> Wouldn't expanding scope later require to change already existing call si=
tes?

Yes, potentially. But I hear that Coccinelle is gaining Rust support =F0=9F=
=91=8D

>
>>>> +                    );
>>>> +                }
>>>> +
>>>> +                // SAFETY: `place` is pointing to a live allocation, =
so the deref
>>>> +                // is safe. The `function` field might not be initial=
ized, but
>>>> +                // `addr_of_mut` does not create a reference to the f=
ield.
>>>> +                let function: *mut Option<_> =3D unsafe { core::ptr::=
addr_of_mut!((*place).function) };
>>>> +
>>>> +                // SAFETY: `function` points to a valid allocation.
>>>> +                unsafe { core::ptr::write(function, Some(T::Receiver:=
:run)) };
>>>
>>> We probably should introduce hrtimer_setup(timer, clockid, mode, functi=
on)
>>> to avoid this construct. That would allow to cleanup existing C code to=
o.
>>
>> Do you want me to cook up a C patch for that, or would you prefer to do
>> that yourself?
>
> Please create that patch yourself and convert at least one C location to
> this new interface in a separate patch. THe remaining C cleanup can go
> from there and mostly be scripted with coccinelle.

Ok.

>
>>>> +/// [`Box<T>`]: Box
>>>> +/// [`Arc<T>`]: Arc
>>>> +/// [`ARef<T>`]: crate::types::ARef
>>>> +pub trait RawTimer: Sync {
>>>> +    /// Schedule the timer after `expires` time units
>>>> +    fn schedule(self, expires: u64);
>>>
>>> Don't we have some time related rust types in the kernel by now?
>>
>> There are patches on the list, but I think they are not applied to any
>> tree yet? I did not want to depend on those patches before they are
>> staged somewhere. Would you prefer this patch on top of the Rust `ktime`
>> patches?
>
> The initial set is queued in
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
>
> for 6.10. Boqun has some updates on top IIRC. Your stuff should go
> through that branch too.

Ok.

>
>>>> +        // SAFETY: This `Arc` comes from a call to `Arc::into_raw()`
>>>> +        let receiver =3D unsafe { Arc::from_raw(data_ptr) };
>>>> +
>>>> +        T::run(receiver);
>>>> +
>>>> +        bindings::hrtimer_restart_HRTIMER_NORESTART
>>>
>>> One of the common use cases of hrtimers is to create periodic schedules
>>> where the timer callback advances the expiry value and returns
>>> HRTIMER_RESTART. It might be not required for your initial use case at
>>> hand, but you'll need that in the long run IMO.
>>
>> If you are OK with taking that feature without a user, I will gladly add
>> it.
>
> I'm fine with taking a more complete API which does not require to
> change usage sites later on.

I will expand the API and send an updated patch when that is done =F0=9F=91=
=8D

BR Andreas
