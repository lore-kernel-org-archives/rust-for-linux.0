Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0033BADA2
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 20:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667199; cv=pass; b=VAhUjE9Ts4AJLQZ+AjZF1bDGLBTZpsW0aW4sBcIYCmcQlnq7lKM7+uWoNDJxiW6itiIYOcuYpR3Gbr5DTCqJ38BjP2j9Cthgz/JmUwt8Txcda02Wzj4nI8pQckeA/dJq9gl8qgkxLFJfyDgiOLx6J05bbBXWzvExy2Dk0k3iXUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667199; c=relaxed/simple;
	bh=Aj6TYx/Cyc9Dv0Qz7DIdrt1RM8bDeJ1mWJK0SGqsMpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izw9arTiZoxTMugM+OVMEriBEDpGqogbhFgmPC9CJckjUfRPrM6whnbKjWgchKfElxJutqQ5VugYBw2yFt95vaBQZEhXlUWja7eEzZywQUnYzmfc3jYEsVIzYac/hJ28QD3Lb+8/xECzK7PfFKJ31owvsr2kc2cYxHVr0AI3z2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=is1/3gos; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="is1/3gos"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso7763253a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 13:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784667198; cv=none;
        d=google.com; s=arc-20260327;
        b=WQrYqSOEXC6xZ8EMEC8tJzARLRh6Fhfs3rY0PhITkkctqM37+81yHBDM1ju+rKPKcr
         G0dNmnb00pQtPNA70CIcOAQDCp6SVKJ0rQQAWtPpXvjdpZaxPZIhYp4AiLlVobrF0851
         Ri8SYb7gmt4Cg4W8msQqy97AGf3rzr3YacvGxClMyBG/4OO/Xjh1Ys7MGqOsP5Qiwf9H
         g8slb9A84MpBusx0xDFEB4psamu/y+3C2WTqv1yZdFfJXAuHGkTPHzYKOisAKRH7CPov
         3zuAZ8y/sEvdqG61VQ1fl23wpngA6OWFofB34RtIe8mQ+13GTJusD0qmZFfG3LMIoTEk
         5bpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0A5uhlvnx13ugb8HkKfIltQI6gavYIC2X4ticlk8EKg=;
        fh=GijvnvAbXvjYOElGmKi1y0HzX2ybfBgP2WbUSxZ8eig=;
        b=qLudHHiVzKDWQDbWJqnfKd2W6zHUYXHv6RW2YqjMEC+DSjWfrzchbnTROzxwsuysW6
         RICFmSnLXKdY56Uz1A/D1dq9dGl4IErDYWXwmqcSK00iOYVAxvGsmpFWRnn2Z3ovn4jM
         pmISJiuDaC89LsILRuyyQVMHKIJ1a3kHvy1L6ZL/tmCCIPzIhq7ANyhBDeVFSJdX0Qbu
         onFqUuLhsQlu5OU2QWYCakfmxiAJJgZvtZWso1l5vKjW/17EOwzL8WAaVoFHIj0nUqVg
         98nubBXXOUp57qWU2YWd2G7B6Q7/2t6nq7KY0ZCgGXbnUWtgGkVGIfb6zoGw0pCQd5qf
         qOHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784667198; x=1785271998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0A5uhlvnx13ugb8HkKfIltQI6gavYIC2X4ticlk8EKg=;
        b=is1/3gos3nSYdsJ68y4PZln0yw3hCFYTCIUe793YdhXrAewXgvybSgSyAuOOMxcnKf
         XkTD8CcvOiVODBmJanpS8AiTPjrGpiiK5Nz8agdTYXjD4egLP/Kfy/pJbY7FQsLVJwpx
         WEYpzuhgwhrfXBpivoXoc4c2qoZnFjz4nNZA9CGgjZg/dtoXppm+fBgDJSwdQIRm0P66
         U2Ggz7/9QlaEiYZ+717ofRndon7GxfQRNgy4B4RLAAVbPO7DZcf9px1wI1WCPyMyl3Mm
         5dpKC+/QX3qdAIwHpukbRu8ZvPCk+8Hf7QKEBTY+xlD5Kha8dKXiJFoy0GWLVln5ytkW
         PCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667198; x=1785271998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0A5uhlvnx13ugb8HkKfIltQI6gavYIC2X4ticlk8EKg=;
        b=On6ninM+/QAToMg8O2B9vRPUyDaLSIMt31XfsKib+jDs9z815wI1xMDQ4HSsj9Izqz
         M4+3UlTrlwXqhr7+aU+7N4tDxnSw/Fh5lM3vmdjRa1YqLMjHhFcX6h2T6pcsDj13QXSG
         D9DI5mLztejyceG0buQrvQVbiUc3r7Yg7oQ0hC18sEiQwVaw1qKEfl6ayLYMEahBM7pj
         eizFKWhEzyio/oktdNcUD0GQFzSubnpHZqFDY9WU9lgYLlAeG1L+7zuC7QggJyxrTXGu
         otB5yYUfnzpWsI+Jzwq++zbuOzfYSjox2How86bwh5rIMURXqp7WW9cbOxBGVuJXoy5o
         kVpg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6DYFL01O2bH2pT2MNAU7qCS2WR1psKAUFMrOlrk2MpcyqupqTyUy6xG33v9SSeXMPLpFzxL/yf3ZEa0GEJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBELkk8j1UHDu0OXTQK1IwBBHDg0Z3yzyEkwrprRwVvatTaO2W
	IoOCML3CkMWYzqpLZ5kxw8s4mWEsbAk34/iJb+2LcaoEE8q+Y12biUBt7faajSnXXnjmRGMTPeW
	ll5z2ODBHJDPUyRsS3ZQcQyFPXwy4lgsbioyFQSw=
X-Gm-Gg: AR+sD11/cjWSPT2ihS8NwcHeMY+51NLjWSwafzX0tOvQZ9p5gdqW7XboLj/z+9xNCFd
	9DD/hXZ1d9Kb0KYwLu0YUp3QrH9SbWJxnOMftYSiP8ieHWSXKusWiosuU6+qf35YCQpEF6AoF3i
	GdPSQ2r1t+SMRiC/rSpcRtPnwkD8DuyVKXWT5jmvPkfIIWKeH017Wv7f1+BG2WJk3LL9MLbeRvz
	/uAZLlKJoyEJ2HDGnS+NgUxT2fJLU+CzmLreC0ZE5ybkLlj+0Wc/BRf5PDZOr/t2oJ5yIq4ndGX
	EXmF129SG+5X+CCKjQ1iOciwzOwB871/1KpDqVuNkHlpHI55C2fvhgQKu9Wk0+s4/WT6zN0bm4u
	ZpxgyMQd2Nu0kog==
X-Received: by 2002:a05:6a21:6b83:b0:3c3:8222:b8c9 with SMTP id
 adf61e73a8af0-3c3ada39a49mr22140955637.67.1784667197151; Tue, 21 Jul 2026
 13:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DK1SRBA3315M.32N4T8QQBUOER@garyguo.net> <20260720.184751.938933263969124163.tomo@flapping.org>
 <CANDhNCrKMdHCmL76LWCROVF2Ly-9NxmfmQ2T+P=iv34aVkO2uQ@mail.gmail.com> <20260721.185716.538446175000843628.tomo@flapping.org>
In-Reply-To: <20260721.185716.538446175000843628.tomo@flapping.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 21 Jul 2026 13:53:05 -0700
X-Gm-Features: AUfX_mw9cZ8KeAiQXxGgbTBjAq_XlAQVOVEPg1ENvgNy3bYljEdKujnhAmNfrGk
Message-ID: <CANDhNCp=RFgt9o4bw368R4dR3z3fPBAzwdofxpbsGi5ji2WmKg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: use Delta and a Jiffies newtype for timeouts
 and delays
To: FUJITA Tomonori <tomo@flapping.org>
Cc: gary@garyguo.net, a.hindborg@kernel.org, aliceryhl@google.com, 
	arve@android.com, boqun@kernel.org, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 2:57=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
> On Mon, 20 Jul 2026 11:16:06 -0700
> John Stultz <jstultz@google.com> wrote:
>
> > On Mon, Jul 20, 2026 at 2:48=E2=80=AFAM FUJITA Tomonori <tomo@flapping.=
org> wrote:
> >> On Sat, 18 Jul 2026 16:20:10 +0100
> >> "Gary Guo" <gary@garyguo.net> wrote:
> >> > I wonder if we should have time types being generic over units. So y=
ou can have
> >> > `Delta<Nsec>` and `Delta<Jiffy>` and `Instant<Nsec>`, `Instant<Jiffy=
>`, with the
> >> > generic default being set to `Nsec`.
> >> >
> >> >     Delta::new(42) // Delta<Nsec>
> >> >     Delta::new_jiffies(42) // Delta<Jiffy>
> >> >
> >> > Thoughts?
> >>
> >> I think making Delta generic over the time unit makes sense; Delta
> >> <Nsec> and Delta<Jiffy>.
> >>
> >> However, I don't think making Instant generic over the time unit is a
> >> good idea, even though it clearly is for Delta.
> >>
> >> Instant is already generic over ClockSource, and jiffies is not a
> >> clock source: it has no clockid_t, it is read via get_jiffies_64()
> >> rather than ktime_get(), and it cannot be armed through hrtimer. That
> >> leaves two ways to force a jiffies Instant, both looks wrong:
> >
> > I read the above and thought, "but jiffies is a clocksource":
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/kernel/time/jiffies.c#n21
> >
> > And then I realized there has been some unfortunate naming overlap,
> > where it seems the rust ClockSource seems to map to the clockid_t, not
> > to the clocksource concept that Linux uses to abstract the hardware
> > counter used as a source of time (for the majority of the clockids).
> >
> > Very much a bikeshed request, but is it too late to rename this to
> > ClockID or something? So there is maybe less confusion when reading
> > across C and Rust code?
>
> Ah, I misunderstood. Thanks for the pointer!
>
> You're right; the trait carries the clockid_t, not the hardware
> clocksource. It's not too late at all; I'll rename ClockSource to
> ClockId.

Sounds good. Thank you for the consideration!
-john
