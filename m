Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED46500960
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 04:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767931237; cv=none; b=DvCwPCshX7e02gE9dz0H4t9Nj8AvArJhflMa28rX38hWgQidOnTqwGtjfXlhJZIJKQZRHr8/kNDNKGTUIhTYf/T+5K3fse1MaFgVDVUO0NIdzRMLP0edBKdgnPqjfj7Vt+DeXxxa0vZk0xQcK3T6L0cXxBijCJ1fdkvoQG5GWDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767931237; c=relaxed/simple;
	bh=4c8s/kx+oV/K2IKZou1YM6lkPttwcBvPrkfVDikA/4U=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dfJiHdiXeWwiDZXkM+6Wt9CuvO2cqfQrwjwPJNqW59CWzuJS7vSMnb8ubQVPOODRlBb0MKegI2b5UdqDK9M3HmX6Y5QS17DSx2yThSH/egb17+ZxETBtuUyiAvxA6KoiOMAGrDPhEHM3L+v7ocpiNUO426l1TFDrwhGrqX6Grlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBVmR8tH; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBVmR8tH"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5634feea416so1626711e0c.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 20:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767931234; x=1768536034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9T2BPf5beEn8hyeDIg1uadDWypr2H9Q3xF9+zmP6OE=;
        b=EBVmR8tHU5xtDz03vCb2DkiELtBYqZoYOKnvCQFJORtrvWnkAOUoFXiFw2WgVrLTY5
         meK2umysp0nZ7ofUfdfsq8bVXZK7RUX9zC3zkNsE4zfS6Z+pB8+4Elnyb8LCQ8q0GiSp
         ClYMbaQ8KJUondU+LtWX8GOX9rNR21b6ARqqltqFjfGC/FMgLnSH1nJYFnBeq6PlFCvv
         o2wLxaaqmkwDmtst+BUX2Tga76V2eLaQxthTMvApGZPjzHgFQRPrLQ54poJqat/z/eFK
         lUfCHcKHRwVL2gC0xgg8Ks5mtQEct41aEMJFI/U/O/XpI8Hnxl9GzMhul4Zn7PI+4/5a
         MT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767931234; x=1768536034;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9T2BPf5beEn8hyeDIg1uadDWypr2H9Q3xF9+zmP6OE=;
        b=K0zDi4CdAh0965c53aWlEbjgmF16DAUQ7T+xXLT/9h9Qqm9Nzz1EHkQKHwZwXWWpzR
         TeviR9St8VZwkxm2Lr8B+VBTc0ZRH+Ec/cTfdAwEnd9zoWaEJIdwH0GOed76llkHxDVh
         lgSNstj+UOsNkCScOqU/j/mFWR3l/F280024vnHEzakjiPp9q9OpT9MsUjVI4njzGcHv
         cEkuIb3q+cNi22BfY36xTvxnP4XVwrPQJvx81aGXfZzeO7kwFRX0AVZ4p8uDccIwZc+C
         A448tV7PhFkYdbRJfOFgD0dppZI55dGNFUDO4p3mFZrWSxgz12e/y+4HzTcAfaMB143r
         Ny9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX00X1cYLWq1qP/KO2CHmf2oc96oyMXIS2cnCurw4XFAyVUfzbwdTWz6zSQsUPUjJyNOxkWRYL/ndBBz1jxoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzWDHWlGHSdD6+MArJO7MksTlDq8aDlBRjf0qZqTs5icLP8LwJ
	gK/N9ODvRk4qt8QH8cjRT8lOpSlcklhS0iAISVd0hcHkBMEH50fFj9wTt2Kjog==
X-Gm-Gg: AY/fxX7Lk984VtkinUES6Q69DPHdvXavTRrgau5diOt1waxEHSrX0R3pH5B84agn3Fp
	ZpBNs9JpmoCGBCgvVFo9GfinY+0Ld1FEEnFnq8T3o8nOFc8kLvsHknPnx4MV1A2N2ynNzaifuE3
	MPXe5Ku4S9YVYIQi5PGimFvukStbHkW3cniU23nCcGciF/y2PICxZk3tdjjtOvbKoKel480GrT6
	Wmj+lAgspGC1FYrUhYfGc9FnWBSl1PACi99kcaUfQgwoBMXsrUuUKP0nzZ4i5RiUGMKx+2Xg8oR
	mYZR3F36cFnSHRM5v5nNrvs7fVlb3tBNEz9glp3DKzyuyF/kCgoTKXIUGLzHtDv4N/xG/mLHx4r
	yi27p+v9Sjon+hq+kUtKJa2eSefSAdxEllFMP6OYyXhoAgK6e//8rXMAYkrZtrbjy22NotGP2rO
	cj9m6Q9wEHg/XF/XnkaGBQ4yQ/sSlFMJ7s5ZV0HAk1z7I0IdO8ScUro18vxTOxDE55nYM=
X-Google-Smtp-Source: AGHT+IHt+NS7u00xGrZ+95pdtQ5VgNDPq0qsP5mcbgbJ7rn8y9GOzh3GzuRv2Bv72b17iorfv7DOuQ==
X-Received: by 2002:a17:902:c406:b0:2a0:9923:6954 with SMTP id d9443c01a7336-2a3ee48fbf3mr72625155ad.27.1767924633614;
        Thu, 08 Jan 2026 18:10:33 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a4f1sm87799265ad.8.2026.01.08.18.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:10:33 -0800 (PST)
Date: Fri, 09 Jan 2026 11:10:25 +0900 (JST)
Message-Id: <20260109.111025.1944772328156797586.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, aliceryhl@google.com, lyude@redhat.com,
 boqun.feng@gmail.com, will@kernel.org, peterz@infradead.org,
 richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
 catalin.marinas@arm.com, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, mark.rutland@arm.com, frederic@kernel.org,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of
 read_volatile
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87ms2pgu7c.fsf@t14s.mail-host-address-is-not-set>
References: <WXFPsf9COQPV_obKoZg2bYwPL3k9TT0oBL3uxNppUFaIj5hxEX9UokzS_DJ5Kg5kXDzLrZ9ihALTZcf6ehljGw==@protonmail.internalid>
	<20260107.202245.559061117523678561.fujita.tomonori@gmail.com>
	<87ms2pgu7c.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 07 Jan 2026 19:21:11 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> 
>> On Wed, 07 Jan 2026 11:11:43 +0100
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>> FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
>>>
>>>> On Tue, 06 Jan 2026 13:37:34 +0100
>>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>>
>>>>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>>>>
>>>>>> On Thu, 01 Jan 2026 11:11:23 +0900 (JST)
>>>>>> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>>>>>>
>>>>>>> On Wed, 31 Dec 2025 12:22:28 +0000
>>>>>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>>>>>
>>>>>>>> Using `READ_ONCE` is the correct way to read the `node.expires` field.
>>>>>>>>
>>>>>>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>>>>>>> ---
>>>>>>>>  rust/kernel/time/hrtimer.rs | 8 +++-----
>>>>>>>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>>>>>> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
>>>>>>>> --- a/rust/kernel/time/hrtimer.rs
>>>>>>>> +++ b/rust/kernel/time/hrtimer.rs
>>>>>>>> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>>>>>>>>          // - Timers cannot have negative ktime_t values as their expiration time.
>>>>>>>>          // - There's no actual locking here, a racy read is fine and expected
>>>>>>>>          unsafe {
>>>>>>>> -            Instant::from_ktime(
>>>>>>>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>>>>>>>> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
>>>>>>>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>>>>>>>> -            )
>>>>>>>> +            Instant::from_ktime(kernel::sync::READ_ONCE(
>>>>>>>> +                &raw const (*c_timer_ptr).node.expires,
>>>>>>>> +            ))
>>>>>>>>          }
>>>>>>>
>>>>>>> Do we actually need READ_ONCE() here? I'm not sure but would it be
>>>>>>> better to call the C-side API?
>>>>>>>
>>>>>>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>>>>>>> index 67a36ccc3ec4..73162dea2a29 100644
>>>>>>> --- a/rust/helpers/time.c
>>>>>>> +++ b/rust/helpers/time.c
>>>>>>> @@ -2,6 +2,7 @@
>>>>>>>
>>>>>>>  #include <linux/delay.h>
>>>>>>>  #include <linux/ktime.h>
>>>>>>> +#include <linux/hrtimer.h>
>>>>>>>  #include <linux/timekeeping.h>
>>>>>>>
>>>>>>>  void rust_helper_fsleep(unsigned long usecs)
>>>>>>> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>>>>>>>  {
>>>>>>>  	udelay(usec);
>>>>>>>  }
>>>>>>> +
>>>>>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>>>>>> +{
>>>>>>> +	return timer->node.expires;
>>>>>>> +}
>>>>>>
>>>>>> Sorry, of course this should be:
>>>>>>
>>>>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>>>>> +{
>>>>>> +	return hrtimer_get_expires(timer);
>>>>>> +}
>>>>>>
>>>>>
>>>>> This is a potentially racy read. As far as I recall, we determined that
>>>>> using read_once is the proper way to handle the situation.
>>>>>
>>>>> I do not think it makes a difference that the read is done by C code.
>>>>
>>>> What does "racy read" mean here?
>>>>
>>>> The C side doesn't use WRITE_ONCE() or READ_ONCE for node.expires. How
>>>> would using READ_ONCE() on the Rust side make a difference?
>>>
>>> Data races like this are UB in Rust. As far as I understand, using this
>>> READ_ONCE implementation or a relaxed atomic read would make the read
>>> well defined. I am not aware if this is only the case if all writes to
>>> the location from C also use atomic operations or WRITE_ONCE. @Boqun?
>>
>> The C side updates node.expires without WRITE_ONCE()/atomics so a
>> Rust-side READ_ONCE() can still observe a torn value; I think that
>> this is still a data race / UB from Rust's perspective.
>>
>> And since expires is 64-bit, WRITE_ONCE() on 32-bit architectures does
>> not inherently guarantee tear-free stores either.
>>
>> I think that the expires() method should follow the same safety
>> requirements as raw_forward(): it should only be considered safe when
>> holding exclusive access to hrtimer or within the context of the timer
>> callback. Under those conditions, it would be fine to call C's
>> hrtimer_get_expires().
> 
> We can make it safe, please see my comment here [1].
> 
> Best regards,
> Andreas Hindborg
> 
> [1] https://lore.kernel.org/r/87v7hdh9m4.fsf@t14s.mail-host-address-is-not-set

I agree. My point was that expire() can be safe only under the same
constraints as forward()/forward_now() so the API should require
Pin<&mut Self> and expose it on HrTimerCallbackContext.

