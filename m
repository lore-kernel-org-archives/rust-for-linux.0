Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E41531AAA3
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791390; cv=none; b=PeCWMeVv/JpAekAjUVmeAMpyL45GR612A5fQLc0RjtlVUsL2Zjw0PVt9ZtPOnZq+PgClsScnfrLmmk7dBNq51GjrEi/dXohytOgjKRDaC8D870Bxs0mbk9UR+2VfGKiDOSYc5pwSm6MolmkVIZlkyTFWwZf+qsh+vvDF0bSEtpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791390; c=relaxed/simple;
	bh=bWSVV22jZh9coEv3ULigZXfiCNuesnPGhW14yA08Rbs=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OCO2adW8P5o56mzgUfkibxlS6GzemNQCOqxiHYwgPHLxZh6Bsr5GD5kg3PkGaHP9dJZOyn+INXSsXyzVINn9bqEZgOhsoIbRTcx7MMS3nF5b42kwvwP7rHsxNxzYqN3upPF+O9NRL+SbSvBR88yEOQtDFnGn5PwmaPd1OM6CFdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anH/eRbT; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anH/eRbT"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88a3bba9fd4so18459586d6.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 05:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767791387; x=1768396187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVyX/saFSHkwOAT/HfR9J/XxoKvZtdkuCzZLxL4WCSA=;
        b=anH/eRbTufaaRHh7w+wPR378L4l3zVvLh0dVpjKf6ZE4H5y/6UPReNqIp98TymVYCD
         apvWiq4nLPk0pHEFajPlm7q1LP0ykWblbSH8LERcgu4f4wN+8JmdzUZPjXOpFJ68Hy7B
         NDheaegJa5sTt1BtvRwmrc3UIKtNpwAc0Xk26360X0bmEOU/1Dv6OU05MMOZyJNkoqb/
         Rkx0G8nCi5NmoHjIj+T1D05gkYJrxBuXbyB2fBAaa6KJm0HK2F83QLuB5m1TEAzu46rP
         R+posSIMLpevijGmEwGMd9tuoHfCJ/bk7dVms5keQbJM4n7Hd5L20vqPmx/xGAZDyQ/y
         mn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767791387; x=1768396187;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVyX/saFSHkwOAT/HfR9J/XxoKvZtdkuCzZLxL4WCSA=;
        b=PcSwxfYuAzsAqvcXPDQBxQJLeNrFzwK7+dlBGNGIH1r0UFxForHjwcTMW7dEKM2Gcf
         qdGMu8y4enrjohwykDGXao1BEqGSapk+pubhevzQblaMVTIRPzGnffcHC4iylOL2oAUt
         OC1Zx5RZmR25GDoDzW2vdiowIyXFrf/pcFkf+N+OLYUeZKcGaZFD+nUGe/CLPaPBtgQG
         Isa9HD/UnhFdDKLkK+ltvJRmvvpw0d9jMSvxPAyiqfdwikPCFp5XHGIz/1+P5jH5BUmM
         dvOBjcLnlqvpYOJp4dYH7zX3hjuE4qSpZA2PBofHAEhlXD9aHPcOgqSxVCKxG2dnYxLz
         i/8w==
X-Forwarded-Encrypted: i=1; AJvYcCV+KLXFr7QY7qDeYgARH/N4tr/WIvSlaYuKL6KFnBZ3AbNipDyW+kILF/IVdhNkutbI11pd7fDHnmGYMyckpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjCISyKHISTVBrBaWz44puuUebw97gUD7FYi/9p1X2jqQkxTaQ
	EwzGRN5cLhKytpTLofr7DzUYhd19BHAo810uatT0+gqwYqO+XSXiS+VQ4csGlQ==
X-Gm-Gg: AY/fxX7oa0noEiz5CNiZxjt/qIMyU/iDPqM7bh4rCXA5PH2wQJGMY9m/lqBZDB9nTKg
	fj6egOubmCKO9tez/4ZTGqjwLG1wMHcSyT4Thwdtv1mRLM+at299epV0mSZOgDhzT86TU4SZ+W5
	gAk5gJpQYTBtFfSs6QktrWxqEZX8Le6kaW3TZEulHrZNb2CW3h+k31lwyVMr08YWkuWJEZhTOXt
	KmygbXGysSj/1uRzKZWG63ERh5qv2qXL2xSiCid5YEEhwECG5OVFNdbsN/faGyKG6pXFM95KDfH
	S2yjK6qOayDf8gChN0mY1gMOPsClCBLp9bFLyg+kLieiKdyI4AvoI1D806qnhQ/Ac23RFDu/wxB
	U/QLnfKWoIUJ5SvA0fJTwosHCM8sVnaXmTOayp450VsPrhkRuclmEDp/asPy87oSQmCqW/hycRq
	tazU0Ek9CtvIt4aobRX6nKALXOsTjSEpIo9LqYRpBgYYl0erqkmxGLVeAwSNQS/oWqML0=
X-Google-Smtp-Source: AGHT+IFka4564yGsxxmwys4Mn7+GTaVT5Y+gqGfi+/kEB3nv8HFKvSn2ve0Sd55L7DEx3kGPj6korQ==
X-Received: by 2002:a17:903:2291:b0:2a2:d2e8:9f25 with SMTP id d9443c01a7336-2a3ee47f0a8mr18571915ad.33.1767784973602;
        Wed, 07 Jan 2026 03:22:53 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm48170855ad.75.2026.01.07.03.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:22:53 -0800 (PST)
Date: Wed, 07 Jan 2026 20:22:45 +0900 (JST)
Message-Id: <20260107.202245.559061117523678561.fujita.tomonori@gmail.com>
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
In-Reply-To: <87cy3livfk.fsf@t14s.mail-host-address-is-not-set>
References: <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
	<20260106.222826.2155269977755242640.fujita.tomonori@gmail.com>
	<87cy3livfk.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 07 Jan 2026 11:11:43 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
> 
>> On Tue, 06 Jan 2026 13:37:34 +0100
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>> 
>>>> On Thu, 01 Jan 2026 11:11:23 +0900 (JST)
>>>> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>>>>
>>>>> On Wed, 31 Dec 2025 12:22:28 +0000
>>>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>>>
>>>>>> Using `READ_ONCE` is the correct way to read the `node.expires` field.
>>>>>>
>>>>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>>>>> ---
>>>>>>  rust/kernel/time/hrtimer.rs | 8 +++-----
>>>>>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>>>> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
>>>>>> --- a/rust/kernel/time/hrtimer.rs
>>>>>> +++ b/rust/kernel/time/hrtimer.rs
>>>>>> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>>>>>>          // - Timers cannot have negative ktime_t values as their expiration time.
>>>>>>          // - There's no actual locking here, a racy read is fine and expected
>>>>>>          unsafe {
>>>>>> -            Instant::from_ktime(
>>>>>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>>>>>> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
>>>>>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>>>>>> -            )
>>>>>> +            Instant::from_ktime(kernel::sync::READ_ONCE(
>>>>>> +                &raw const (*c_timer_ptr).node.expires,
>>>>>> +            ))
>>>>>>          }
>>>>>
>>>>> Do we actually need READ_ONCE() here? I'm not sure but would it be
>>>>> better to call the C-side API?
>>>>>
>>>>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>>>>> index 67a36ccc3ec4..73162dea2a29 100644
>>>>> --- a/rust/helpers/time.c
>>>>> +++ b/rust/helpers/time.c
>>>>> @@ -2,6 +2,7 @@
>>>>>
>>>>>  #include <linux/delay.h>
>>>>>  #include <linux/ktime.h>
>>>>> +#include <linux/hrtimer.h>
>>>>>  #include <linux/timekeeping.h>
>>>>>
>>>>>  void rust_helper_fsleep(unsigned long usecs)
>>>>> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>>>>>  {
>>>>>  	udelay(usec);
>>>>>  }
>>>>> +
>>>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>>>> +{
>>>>> +	return timer->node.expires;
>>>>> +}
>>>>
>>>> Sorry, of course this should be:
>>>>
>>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>>> +{
>>>> +	return hrtimer_get_expires(timer);
>>>> +}
>>>>
>>> 
>>> This is a potentially racy read. As far as I recall, we determined that
>>> using read_once is the proper way to handle the situation.
>>> 
>>> I do not think it makes a difference that the read is done by C code.
>>
>> What does "racy read" mean here?
>>
>> The C side doesn't use WRITE_ONCE() or READ_ONCE for node.expires. How
>> would using READ_ONCE() on the Rust side make a difference?
> 
> Data races like this are UB in Rust. As far as I understand, using this
> READ_ONCE implementation or a relaxed atomic read would make the read
> well defined. I am not aware if this is only the case if all writes to
> the location from C also use atomic operations or WRITE_ONCE. @Boqun?

The C side updates node.expires without WRITE_ONCE()/atomics so a
Rust-side READ_ONCE() can still observe a torn value; I think that
this is still a data race / UB from Rust's perspective.

And since expires is 64-bit, WRITE_ONCE() on 32-bit architectures does
not inherently guarantee tear-free stores either.

I think that the expires() method should follow the same safety
requirements as raw_forward(): it should only be considered safe when
holding exclusive access to hrtimer or within the context of the timer
callback. Under those conditions, it would be fine to call C's
hrtimer_get_expires().

