Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA031ADC9B
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Feb 2025 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739180476; cv=none; b=rjvCk4A99r74IyN+Ay13QE0BrvRAV6PWj3RoyBt4CHsj8XL6p0gBJdauJO4vVXN+BojwnIPTcpL1LDG58wfwXR76gMzvWp2UHT1FTwjVTb6cWf+Yfm509LD4af83wr3zCd2f7ZlvEkf88neIZPDEXcY0dx6V8+HECCqMwO0WEsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739180476; c=relaxed/simple;
	bh=p4bQSg87uFVkYpd3/MVrEp/e7zuLTdd+q0YZ9vhYMhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCfl92aDll79RrWH23Sg2MRYRy3lYUQGBBED3sr67S9g2QwBw/tVvewDqvv941RI0i0WG9PBBxPAwAVKxOZg8s42/wuV19wsE+zdNCEMJaZH9AQWbO668Iur+lFN+NbzPYoraKTyiwmrDOZV50uCMKyo6DKqJzyNKaCJ2HhR8C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1th6MVEY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1th6MVEY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43937cf2131so8440695e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Feb 2025 01:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739180473; x=1739785273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCBNOxznqCDPYuXB5E7wzbFvG2L1F3n8EQ/l45ckAzA=;
        b=1th6MVEYLzBYM05aJm6Z61Z0G6nvsQF126bXIm3v2+nQdQ3jcufz/wh0cflA2y9sCn
         w7KQAho2EgY7NeY+EblN+LkgJ+gvrNCWHp8SDE+b5F4LEbC6IFSGj6knPoJkGy8ZoKhq
         H9tXK79mU7H7UFk0uLOx/N8FNHtJ3Ohi0Pld+Artje0eilbG43ISmeulgfJ1EkcugrRB
         dnwY8vKb+DGDFS42KJnCPIoGiXKM5xgElJnJo9Kf8mzq69cBjnXdPDislBbb6+O2psxE
         a4FIv8law7fJuKdU0PGbZEUQc5zN6liXzGeVZaK1Oh0c5rN8Od7dRp3kfuhcax2R+wZ8
         qgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739180473; x=1739785273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCBNOxznqCDPYuXB5E7wzbFvG2L1F3n8EQ/l45ckAzA=;
        b=TFDLfUk2h0RLhAr50Pd8BPZq0xEUQo1me7G1r08b/hDC5S+L0CTnOX+tbxKMAyBE1r
         MHM2b/ySgxxDIr0htH8pcB3XwrWENrGqyusnhlvNEtwXfmNzxHlnnC/0ArdVBAeCTMmz
         kXEM5PrUKqa9ko7kE+SfnXP0ByGh/QnioGQlrSXUuIfiPvfZKEO+X/tYNaD2hr+m/2x3
         SKzT2q7mIc0mWOX3Xr4Ch6lKMM0mXHTufX3YXpn2BsCocAk6D8rkKxEPMxPDpDOZoCjE
         cbuGxmhP292xm/LCUEqqsy9L5Ygc98DSLNLmF9P9jsrq4GsO2o++ZDCn51MIvs9+75Dr
         Pn5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV38hBZiUO8epPArT1vdq2tn1qvhrR569T0l0jRFi6/s4Eqs1o+PSzH+gMtaZFS1YdCueSpDGU7WOAgu9vmBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzHv/EvQoWhj5KllBWqXKo2Li+s+OGT2ge2fp+mZdsQ5jCxLhO
	zh5g4O9Ar3mxuYE7kQicuAoTZx4QK1AAM4WSjIxxtHlvl2ijroeXgTimMOdxMzZSLFcRkw+Gpbd
	LB9tt+bQcG7Eeq6zKI0mPsdLRV47p9l8ekQeQ
X-Gm-Gg: ASbGncsgF7nJRa0KJj7+3B91EBW/6vAbjhS+LEtTOEwR0Y0tllKwWDdVVMkZmjAQMR6
	Qv08EODXd6hgr0OFZXm8n3iyvOucc0Kyifbr8yBk6Uvy6X2Fjma8qWTFp6m6Kqu7bt+dLdXXk9w
	==
X-Google-Smtp-Source: AGHT+IHEuf8P7J1DpuNuDhKVh1hrYoLIiGq+/hlGA9zolraaf3yrulKD6NlrzKrc8ZqwFjERJM8NaGnRUmNvl8upGCo=
X-Received: by 2002:a5d:64ae:0:b0:38d:d371:e010 with SMTP id
 ffacd0b85a97d-38dd371e1bdmr6514970f8f.35.1739180473091; Mon, 10 Feb 2025
 01:41:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207132623.168854-1-fujita.tomonori@gmail.com>
 <20250207132623.168854-2-fujita.tomonori@gmail.com> <20250207181258.233674df@pumpkin>
 <20250208.120103.2120997372702679311.fujita.tomonori@gmail.com>
In-Reply-To: <20250208.120103.2120997372702679311.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 10 Feb 2025 10:41:00 +0100
X-Gm-Features: AWEUYZk6EqTIZZGO1SVVqrV6LG5OFX5VZNOHhYpPhCPzQ0NZdqfyiNifhY4e36w
Message-ID: <CAH5fLgiDCNj3C313JHGDrBS=14K1COOLF5vpV287pT9TM6a4zQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/8] sched/core: Add __might_sleep_precision()
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: david.laight.linux@gmail.com, boqun.feng@gmail.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	netdev@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com, 
	tmgross@umich.edu, ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	anna-maria@linutronix.de, frederic@kernel.org, tglx@linutronix.de, 
	arnd@arndb.de, jstultz@google.com, sboyd@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, tgunders@redhat.com, me@kloenk.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 4:01=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Fri, 7 Feb 2025 18:12:58 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
>
> >>  static void print_preempt_disable_ip(int preempt_offset, unsigned lon=
g ip)
> >>  {
> >>      if (!IS_ENABLED(CONFIG_DEBUG_PREEMPT))
> >> @@ -8717,7 +8699,8 @@ static inline bool resched_offsets_ok(unsigned i=
nt offsets)
> >>      return nested =3D=3D offsets;
> >>  }
> >>
> >> -void __might_resched(const char *file, int line, unsigned int offsets=
)
> >> +static void __might_resched_precision(const char *file, int len, int =
line,
> >
> > For clarity that ought to be file_len.
>
> Yeah, I'll update.
>
> >> +                                  unsigned int offsets)
> >>  {
> >>      /* Ratelimiting timestamp: */
> >>      static unsigned long prev_jiffy;
> >> @@ -8740,8 +8723,10 @@ void __might_resched(const char *file, int line=
, unsigned int offsets)
> >>      /* Save this before calling printk(), since that will clobber it:=
 */
> >>      preempt_disable_ip =3D get_preempt_disable_ip(current);
> >>
> >> -    pr_err("BUG: sleeping function called from invalid context at %s:=
%d\n",
> >> -           file, line);
> >> +    if (len < 0)
> >> +            len =3D strlen(file);
> >
> > No need for strlen(), just use a big number instead of -1.
> > Anything bigger than a sane upper limit on the filename length will do.
>
> Ah, that's right. Just passing the maximum precision (1<<15-1) works.
>
> The precision specifies the maximum length. vsnprintf() always
> iterates through a string until it reaches the maximum length or
> encounters the null terminator. So strlen() here is useless.
>
> Alice and Boqun, the above change is fine? Can I keep the tags?

I'd probably like a comment explaining the meaning of this constant
somewhere, but sure ok with me.

Alice
