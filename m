Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913483126A3
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767711826; cv=none; b=ppd79GxuACVkYWUT8JTnWzFW5ANmh2wghCGGQaFk7wkbwDyEZ4cfp0RURwZGMNwm5O9VJe/Lp1J403vanCHT4MT8IC93owngFfoQI79me81UlNSAKS1bxLSB3O2Pyvx74rSAvgqGtZSS1TlBlfiBxp/2ZvMuRPUBtuFwgFB1Tjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767711826; c=relaxed/simple;
	bh=25iRmSFuwL+D8roq4uypOGpDklg8NTNbR1SXb2hshR4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=u7XJX3oF8HolZfHSaaGMdziz41z7hnU/ObWvBotSXXsRqJpRaBgOiIS9gOEAVmCU2hGFoCC9jN9/fFWOE+A7xs4QGZVVFbUWOV1WPIFUMik7ITfKthkB/VlYbqtUyD83ZpKM9AXManPOQ8K/UOhwV6zjvJCgoTsOkWKK5zGPy+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZPB3byg; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZPB3byg"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3ec46e3c65bso780568fac.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 07:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767711823; x=1768316623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKsffwDmTb+4r5jC/ROuThttSG8MjIGG/prpPNSIElc=;
        b=mZPB3bygIdMEDy3CWEkcnfZmUFMPEinB7Mjlq9Tgc/TjsFAThjgxLfoJs7ObAdf1eL
         bVHv4WoXoxh487GhlbhSIO+eRzMS5xJqYTg2vRuFzNHszoQDjPfYZO3iDXKKQFOE9APc
         0ulHuq3aZ09sln0db6E/I0vhEHWLVPh+ndrEfBYqemCDmWW6wGXGkt2n7ycUokNOJfo0
         guE7yZmcBRGHLLqXVQQOD9msfXOMRLmUgI+AR2PhvXZPxTynYdhBK+1rlwx7XblIrYrh
         JB0PHxYn7wJLDdWQUMbLt9VyR06H54zQgZIevNWqtmI5U4nH5xmQ/cBeSDdRef7LpmG1
         /1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767711823; x=1768316623;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKsffwDmTb+4r5jC/ROuThttSG8MjIGG/prpPNSIElc=;
        b=KIr+G+SnEeEwKjIeZVq8EU+Myi9/G+IfI3U1C9dmCzhTBxUwhpY9EDzkMl8TVixp2Q
         dCr3K9R26R35Tx1l99gzZub6iYhDXDcgl8LdH4Itk1MRoassKjJ5lP03LnsfivbYIXYB
         l9GKnG0J8nYcKqdPBXx20vkvWQzTAXhActL4WG/XQGQAkgmHWboriMOBXfVx45C5W0g6
         nKzWWCc4wrHnKRqTlrkrTJWKY1uwhszIftKz+yLwHa3H4JSbVDsrmIEKlv71FLDsbJ/P
         SqVGBcu1uYZMlr+xTM9fG9Cyph+BjAb+aqnaGlAnBzdvvUNMhLMZZZXigLubGnXxA2rK
         20LA==
X-Forwarded-Encrypted: i=1; AJvYcCWDhCAegfeOl4zBJOoq3lyog+hBXMi24D/bDFrxeaXJXnhP3tBFVA6pBCsW8IobeOp7aUL6/jFzLYxOtrPTRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkDcY6hJ7eeOTiAm2SKFqgI2Z4kiXAcqJMBJq06U/l2HWyNHo8
	qnBrRBbcjLP/zbk5BVdBouFosKfCdKgdQpjmtdG0cOH0UJCh1MxHUER6ah8o1w==
X-Gm-Gg: AY/fxX5HMlrhcQwlDCpzYlysZkDXNKiFcKF+Q4R1Z2MBwdJY2+ChUfJ9+Whs32LZqdU
	jOU0FAPVXqWiq4Ktpe5mxW6DqWz3LIcy2MNKrndMSqygTjx7sWiyBh7Jy//x0CKfPS+w2aZvWJB
	8csLoddySPhc95W8fjYlQivbCJK3Imp/IgszuLE8NPeppKEef6CBb44gsrEfSnl1P/SrR8YuMU8
	CdnL3YanS3c383JVFbdXe/SHP/TE5lLSbG3e5siZK9QgnenozmBE+jJtzpXEPStiAhTzR6ENLCK
	fQ6HSxv1jcHJ8ED317qUF1OPDu9WbvlfH9AoLHM6FxU+cotzp1yRGeS4N8XSTcOtBumF9VXg2KJ
	SrL+N1Wb5kLC//GeXeD9YAn7RW9GJ2Z+ViG6fXFvNi1XNuI59dqOdmiOij/Rrz5pLcrQHAs850C
	1BQpwLroEOj4Xl0HwoEzLf9iuPlUSYEcTe2TnAmq/LdZ/2ZxQCni7T1ruHwrC8COjJGcg=
X-Google-Smtp-Source: AGHT+IH/kVjMXJLsPqWXcn8kSZ3ELVQYHHdFG6UtOJC68eA3mthYgJwMef8DW8mEX3Opv7mL8wv7Fw==
X-Received: by 2002:a17:90a:c888:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-34f5f35d5e2mr2098780a91.36.1767706121439;
        Tue, 06 Jan 2026 05:28:41 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b19ebsm2356135a91.3.2026.01.06.05.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:28:41 -0800 (PST)
Date: Tue, 06 Jan 2026 22:28:26 +0900 (JST)
Message-Id: <20260106.222826.2155269977755242640.fujita.tomonori@gmail.com>
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
In-Reply-To: <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
References: <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
	<20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
	<87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 06 Jan 2026 13:37:34 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> 
>> On Thu, 01 Jan 2026 11:11:23 +0900 (JST)
>> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>>
>>> On Wed, 31 Dec 2025 12:22:28 +0000
>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>
>>>> Using `READ_ONCE` is the correct way to read the `node.expires` field.
>>>>
>>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>>> ---
>>>>  rust/kernel/time/hrtimer.rs | 8 +++-----
>>>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
>>>> --- a/rust/kernel/time/hrtimer.rs
>>>> +++ b/rust/kernel/time/hrtimer.rs
>>>> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>>>>          // - Timers cannot have negative ktime_t values as their expiration time.
>>>>          // - There's no actual locking here, a racy read is fine and expected
>>>>          unsafe {
>>>> -            Instant::from_ktime(
>>>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>>>> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
>>>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>>>> -            )
>>>> +            Instant::from_ktime(kernel::sync::READ_ONCE(
>>>> +                &raw const (*c_timer_ptr).node.expires,
>>>> +            ))
>>>>          }
>>>
>>> Do we actually need READ_ONCE() here? I'm not sure but would it be
>>> better to call the C-side API?
>>>
>>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>>> index 67a36ccc3ec4..73162dea2a29 100644
>>> --- a/rust/helpers/time.c
>>> +++ b/rust/helpers/time.c
>>> @@ -2,6 +2,7 @@
>>>
>>>  #include <linux/delay.h>
>>>  #include <linux/ktime.h>
>>> +#include <linux/hrtimer.h>
>>>  #include <linux/timekeeping.h>
>>>
>>>  void rust_helper_fsleep(unsigned long usecs)
>>> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>>>  {
>>>  	udelay(usec);
>>>  }
>>> +
>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>> +{
>>> +	return timer->node.expires;
>>> +}
>>
>> Sorry, of course this should be:
>>
>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>> +{
>> +	return hrtimer_get_expires(timer);
>> +}
>>
> 
> This is a potentially racy read. As far as I recall, we determined that
> using read_once is the proper way to handle the situation.
> 
> I do not think it makes a difference that the read is done by C code.

What does "racy read" mean here?

The C side doesn't use WRITE_ONCE() or READ_ONCE for node.expires. How
would using READ_ONCE() on the Rust side make a difference?

