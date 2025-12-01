Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878053019C2
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764583616; cv=none; b=VM4LpbLa/H3gFHxPrnyjjQuvtyJ8Y2ile6aRFWxungVDPyueRjG3DWIEbo3tn/LwG3gcTc4whE7ejho6p/E0LtG+L8LsqFKz0A0Rs64lBfUyd4W2wRjVkgXgxhRpoCGWIHtdyfsenYvHl9L0Y9mBmvOm/jisGLW3vh8Omk18FpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764583616; c=relaxed/simple;
	bh=T0j/6LpvHvUebE4XAvVPnvvlthDXCAZHa3fzvfB/hZU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ErWpwEb9/VL5XXfE9lzofHSe18UCjhsvQuCo93FvVg+CgxjXAtWpKcyCTWHkBk8Yz2WTk8/B4AIfWhm4uOx3tGAbSGKosyGCgWqAoJJZNuV9K2KZ5d8yZsv2LpDJw9syjmKzEts7h+3gWt0lzynxbMwgmXf+CBanU7XqSnCX4qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q0B4DtN5; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q0B4DtN5"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-640b06fa998so3620131a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 02:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764583613; x=1765188413; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y78SsuGizE+1e9Q4bskrWLC1Ufu93jXaYzNMiAyIc9M=;
        b=Q0B4DtN5WMBVn3JHDQePFN5s5nNuq5svRpqeWDVidEgVi4peH+lsaebmhpoYt6Cxh3
         vie+dMnXsWZRBLl/EJRD5DgMX7kY9A6Zyx8QCoWbddzvlNElQQHT8FqAwKcfg3CaID8W
         66gJOPR1eyODz47LgdiXM1MDVeu3eO3pWzIXeUEBG7SIN37IMKdH4QNVY+mh1G5sm4FL
         cNu3jQW5qH67pplH6B6R04kSdU6W7jKJ0bZvTri+vMBbew712gU593GDQy3LkTc6MyG/
         zHaSLYpJeFmMa+b6hbIlQ5xwxeIvhmfvPtLUKPBHBws4mahWgkOCOkYbPaYOWAY0XSq8
         k+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764583613; x=1765188413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y78SsuGizE+1e9Q4bskrWLC1Ufu93jXaYzNMiAyIc9M=;
        b=iZLGrdsqSLgw1vn+M02og5wIDqf10jiT2VkRl27Ms3d/t1D2azyZ8X1k1NOiqM9M/J
         Y3c3MDcd6LrpnZywRt07WQIMRO5zJtzFo2yfykoNvuh/6BiZupmKPoZmAwTpoIAZ8Zyq
         P/jer06HhsI1/aRlUyC0bAiNBPOTdlsdHI2Elv/VI3S8/Rf8djMTPXhX0dOmLeutXE2g
         R1xsDzREG3QzPlV/Lv1E7c733xVZyuqDiSH2Zt/tSzOZNdDb4jlb2yf1C1citUAkeUWG
         ETG45ps79jPzmAy9Ub4y1iqPoF7GEL8x0DSk3sAemIw9ci7QObeb6H93md/SuCuw5xjl
         Y6aA==
X-Forwarded-Encrypted: i=1; AJvYcCVOnk4TZXOGfVb+H+Q9TF3oR0rY6ui9UadPCbbmbT/ROKBR/Oz5ZJxOqjGeBvBDgVgjmqQhZtxSb7rPZuUiUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0E8h5pKuoFDsZ0DaE7hWrjhN6Kjqzu1oA/tWXW5APXVYo+oBS
	PRgkmQK85Ra5oJczEjLpoSpGfPzvduCls4CGWVXgwRgdMAlbSWTPQOiiPuqfy0elZIhhooxLCfT
	kRTVCM4xExyP0X2X2fQ==
X-Google-Smtp-Source: AGHT+IF7Nf4tyLidMi826QBnaIkv9+KTWKCNs4nqjEi7MZMGKXpqsVJ18dJbqgVsjR384JG+Wx64Hagz7SnILms=
X-Received: from edc24.prod.google.com ([2002:a05:6402:4618:b0:641:8d26:68db])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5247:b0:640:74f5:d9f6 with SMTP id 4fb4d7f45d1cf-64555ce8d37mr32130609a12.25.1764583612724;
 Mon, 01 Dec 2025 02:06:52 -0800 (PST)
Date: Mon, 1 Dec 2025 10:06:51 +0000
In-Reply-To: <8711d40496e0e12e3efcd7fd9e11bdea6de68c6d.camel@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251127-pwm_safe_register-v1-1-d22d0ed068ac@posteo.de>
 <aSlrVLT92kmazgyh@google.com> <8711d40496e0e12e3efcd7fd9e11bdea6de68c6d.camel@posteo.de>
Message-ID: <aS1ouzXP5U5kSNJu@google.com>
Subject: Re: [PATCH] Move pwm registration into pwm::Chip::new
From: Alice Ryhl <aliceryhl@google.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Nov 28, 2025 at 12:25:04PM +0000, Markus Probst wrote:
> On Fri, 2025-11-28 at 09:28 +0000, Alice Ryhl wrote:
> > On Thu, Nov 27, 2025 at 05:15:06PM +0000, Markus Probst wrote:
> > > The `pwm::Registration::register` function provides no guarantee that the
> > > function isn't called twice with the same pwm chip, which is considered
> > > unsafe.
> > > 
> > > Add the code responsible for the registration into `pwm::Chip::new`. The
> > > registration will happen before the driver gets access to the refcounted
> > > pwm chip and can therefore guarantee that the registration isn't called
> > > twice on the same pwm chip.
> > > 
> > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > ---
> > > This patch provides the additional guarantee that the pwm chip doesn't
> > > get registered twice.
> > > 
> > > The following changes were made:
> > > - change the visibility of `pwm::Registration` to private
> > > - remove the `pwm::Registration::register` function
> > > - add code for registering the pwm chip in `pwm::Chip::new`
> > > - add Send + Sync bounds to `PwmOps`
> > > 
> > > Note that I wasn't able to test this patch, due to the lack of hardware.
> > 
> > Overall looks reasonable, but I have one question:
> > 
> > > @@ -654,50 +668,23 @@ unsafe fn dec_ref(obj: NonNull<Chip<T>>) {
> > >  // structure's state is managed and synchronized by the kernel's device model
> > >  // and PWM core locking mechanisms. Therefore, it is safe to move the `Chip`
> > >  // wrapper (and the pointer it contains) across threads.
> > > -unsafe impl<T: PwmOps + Send> Send for Chip<T> {}
> > > +unsafe impl<T: PwmOps> Send for Chip<T> {}
> > >  
> > >  // SAFETY: It is safe for multiple threads to have shared access (`&Chip`) because
> > >  // the `Chip` data is immutable from the Rust side without holding the appropriate
> > >  // kernel locks, which the C core is responsible for. Any interior mutability is
> > >  // handled and synchronized by the C kernel code.
> > > -unsafe impl<T: PwmOps + Sync> Sync for Chip<T> {}
> > > +unsafe impl<T: PwmOps> Sync for Chip<T> {}
> > 
> > Why was this changed?
> 
> Registration::register required PwmOps to be Send + Sync.
> Prior to this change, Chip::new didn't require it for PwmOps. Meaning
> it was possible to allocate a new Chip with a PwmOps that is not Send +
> Sync. As there was no use for it and it isn't possible anymore to
> allocate a new Chip without registering it, I added Send + Sync as
> trait dependency (see 1. hunk of rust/kernel/pwm.rs in the patch).
> 
> Because PwmOps now implied Send + Sync, it wasn't necessary anymore to
> have the additional bounds there.

Ah ok, I missed that. That's fine then.

Alice
