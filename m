Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1207F14B95A
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Oct 2024 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728129600; cv=none; b=GfKeo6ADX8FxBDZIvmn8W3VoDqWxK2SAvcANGgFrgRI7XqQjmNog5cTRurrK8A0lw7yFnrpmuyTLgZS25y7aQOg1xEdNH7pVEpv5FO/KxH8AWRQD20D/u+QCOp8FdQUKaIbHgJC6nHIlQsQAM5sCC++g+Y+1X1rFM0Smvfhrd0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728129600; c=relaxed/simple;
	bh=B9ie2ibbvUeA8qv7/cm4Mu4ucpj9+ZbfFtIGNqzy5lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUyML+xULs3jRzNvbrs6nmMuOhCdBre95QYSIguAcukf0+d+6pqNpuoPrCEWfMx/R8GKRdc4XSRB1mSu+UczeDunjghx0IsDvO7H26QC5nPyXupSexo+8g7gx1PlSzbBlL1OjyPUCQmzIMtiboMeygufHVTOIPMnVN052SfyEoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZQoRkPvG; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZQoRkPvG"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37ccc597b96so1886788f8f.3
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Oct 2024 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728129597; x=1728734397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT4JN1wYGFSh5zRwCmPA1K5txyLYW2kiaQGQVe7qZpc=;
        b=ZQoRkPvG8JYddDJBRt1qZ38fVwhdKC5m//WrmJu5ZOWPtAtLyjs4sxFS5kXawJ97q/
         nzz/AWRjq5M0z39UXuMmMoRg7wAbxjkZJtsrcw5/TKhObIT2rRWrBAhBQCfhC6HpsqFb
         id0afgsOdwJUt7IoUVYPRLy5DdvfZzpOVVWRQQqnKD9Hyzcixe5iOl/bQ42nWCSV8qA/
         g4Z6RgF/M5XVuI+blhveRscLNBWMY7pcviPsZkKJqfmGofxQeq2tG39NeiFHnKjwtw9f
         Fk8C7GnHKt+bp5haZo0+sRirrhzi4WgQzTOZu/Hz5MS+dLhdxC3ksz4LE0nRiYNzjY14
         VzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728129597; x=1728734397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VT4JN1wYGFSh5zRwCmPA1K5txyLYW2kiaQGQVe7qZpc=;
        b=t0UPQGSsuxH+RU1QzjAFbudQwWZ3Y7ItGegPEEBVTalzS0PzC/k55oF590uFxE8B0f
         4wFPGLF0AB0gVYKygS/xQtkpMZ+rYxwYi9aTtbuNkL72tb049u3xZQhnbCE4HRMXHzVo
         eGFTQWuVIZI6XO01H1NjvUIdkW1IzGTU6nbjjj+SawnEwxU5do8wLpx87IDaHS23TQnE
         ewvdNGCqxJpnRqfe+irzU9c6dALCeDU5DlAsSX1ageATFQHqQ821zrttPkdXTV+RQve1
         PUTLS+qx8W5l8iL3ibI9ZQtlaTfEC6EZqHlGLCacDWRzxZeHQkHyr2rW7eA6tu4KeX+f
         mDlw==
X-Forwarded-Encrypted: i=1; AJvYcCUrjVHjh4SjFrSEumGDStQM0I13G2VzIA7bN5vxk9xv6F57t4//fkvr6gtvAdoVwIVBZq9PCi3du2WCAD7eDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpk9Mg6jw6/pEXHQUZRBgmQCMkLb0lACgAQEMyTkvtPKvSF/MK
	4tdxKuFUPF65ae9hXAFvYKp4CTPUIGPCby3WEoa2CUWcy4wc8uDQhVgpucBMtRMmAIVWX6lqJ2k
	aqmpseXAYuJmHzYqQxqoScxrM8vavRQmME17g
X-Google-Smtp-Source: AGHT+IG31cBDoRhFPWScbaQzOpQcmmZdOGEaWuSuXkGk1VAZd2FBlgLkb0o49Dh412K3nfiMQSovCDPdJDa1N7PAv9c=
X-Received: by 2002:adf:fdd2:0:b0:37c:c5da:eaf7 with SMTP id
 ffacd0b85a97d-37d0e7a18dcmr4568091f8f.31.1728129597120; Sat, 05 Oct 2024
 04:59:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004155247.2210469-1-gary@garyguo.net> <20241004155247.2210469-4-gary@garyguo.net>
 <OKHi9uP1uJD59N2oYRk1OfsxsrGlqiupMsgcvrva9_IPnEI9wpoxmabHQo1EYen96ClDBRQyrJWxb7WJxiMiAA==@protonmail.internalid>
 <2024100507-percolate-kinship-fc9a@gregkh> <87zfniop6i.fsf@kernel.org>
In-Reply-To: <87zfniop6i.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 5 Oct 2024 13:59:44 +0200
Message-ID: <CAH5fLghK1dtkF5bRpcRcu2SXZ6vgPoHGLRqW2=r0J3-2T3ALwQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: block: convert `block::mq` to use `Refcount`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Gary Guo <gary@garyguo.net>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, Jens Axboe <axboe@kernel.dk>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 5, 2024 at 11:49=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Hi Greg,
>
> "Greg KH" <gregkh@linuxfoundation.org> writes:
>
> > On Fri, Oct 04, 2024 at 04:52:24PM +0100, Gary Guo wrote:
> >> There is an operation needed by `block::mq`, atomically decreasing
> >> refcount from 2 to 0, which is not available through refcount.h, so
> >> I exposed `Refcount::as_atomic` which allows accessing the refcount
> >> directly.
> >
> > That's scary, and of course feels wrong on many levels, but:
> >
> >
> >> @@ -91,13 +95,17 @@ pub(crate) unsafe fn start_unchecked(this: &ARef<S=
elf>) {
> >>      /// C `struct request`. If the operation fails, `this` is returne=
d in the
> >>      /// `Err` variant.
> >>      fn try_set_end(this: ARef<Self>) -> Result<*mut bindings::request=
, ARef<Self>> {
> >> -        // We can race with `TagSet::tag_to_rq`
> >> -        if let Err(_old) =3D this.wrapper_ref().refcount().compare_ex=
change(
> >> -            2,
> >> -            0,
> >> -            Ordering::Relaxed,
> >> -            Ordering::Relaxed,
> >> -        ) {
> >> +        // To hand back the ownership, we need the current refcount t=
o be 2.
> >> +        // Since we can race with `TagSet::tag_to_rq`, this needs to =
atomically reduce
> >> +        // refcount to 0. `Refcount` does not provide a way to do thi=
s, so use the underlying
> >> +        // atomics directly.
> >> +        if this
> >> +            .wrapper_ref()
> >> +            .refcount()
> >> +            .as_atomic()
> >> +            .compare_exchange(2, 0, Ordering::Relaxed, Ordering::Rela=
xed)
> >> +            .is_err()
> >
> > Why not just call rust_helper_refcount_set()?  Or is the issue that you
> > think you might not be 2 here?  And if you HAVE to be 2, why that magic
> > value (i.e. why not just always be 1 and rely on normal
> > increment/decrement?)
> >
> > I know some refcounts are odd in the kernel, but I don't see where the
> > block layer is caring about 2 as a refcount anywhere, what am I missing=
?
>
> It is in the documentation, rendered version available here [1]. Let me
> know if it is still unclear, then I guess we need to update the docs.
>
> Also, my session from Recipes has a little bit of discussion regarding
> this refcount and it's use [2].
>
> Best regards,
> Andreas
>
>
> [1] https://rust.docs.kernel.org/kernel/block/mq/struct.Request.html#impl=
ementation-details
> [2] https://youtu.be/1LEvgkhU-t4?si=3DB1XnJhzCCNnUtRsI&t=3D1685

So it sounds like there is one refcount from the C side, and some
number of references from the Rust side. The function checks whether
there's only one Rust reference left, and if so, takes ownership of
the value, correct?

In that case, the CAS should have an acquire ordering to synchronize
with dropping the refcount 3->2 on another thread. Otherwise, you
might have a data race with the operations that happened just before
the 3->2 refcount drop.

Alice

On Sat, Oct 5, 2024 at 11:49=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Hi Greg,
>
> "Greg KH" <gregkh@linuxfoundation.org> writes:
>
> > On Fri, Oct 04, 2024 at 04:52:24PM +0100, Gary Guo wrote:
> >> There is an operation needed by `block::mq`, atomically decreasing
> >> refcount from 2 to 0, which is not available through refcount.h, so
> >> I exposed `Refcount::as_atomic` which allows accessing the refcount
> >> directly.
> >
> > That's scary, and of course feels wrong on many levels, but:
> >
> >
> >> @@ -91,13 +95,17 @@ pub(crate) unsafe fn start_unchecked(this: &ARef<S=
elf>) {
> >>      /// C `struct request`. If the operation fails, `this` is returne=
d in the
> >>      /// `Err` variant.
> >>      fn try_set_end(this: ARef<Self>) -> Result<*mut bindings::request=
, ARef<Self>> {
> >> -        // We can race with `TagSet::tag_to_rq`
> >> -        if let Err(_old) =3D this.wrapper_ref().refcount().compare_ex=
change(
> >> -            2,
> >> -            0,
> >> -            Ordering::Relaxed,
> >> -            Ordering::Relaxed,
> >> -        ) {
> >> +        // To hand back the ownership, we need the current refcount t=
o be 2.
> >> +        // Since we can race with `TagSet::tag_to_rq`, this needs to =
atomically reduce
> >> +        // refcount to 0. `Refcount` does not provide a way to do thi=
s, so use the underlying
> >> +        // atomics directly.
> >> +        if this
> >> +            .wrapper_ref()
> >> +            .refcount()
> >> +            .as_atomic()
> >> +            .compare_exchange(2, 0, Ordering::Relaxed, Ordering::Rela=
xed)
> >> +            .is_err()
> >
> > Why not just call rust_helper_refcount_set()?  Or is the issue that you
> > think you might not be 2 here?  And if you HAVE to be 2, why that magic
> > value (i.e. why not just always be 1 and rely on normal
> > increment/decrement?)
> >
> > I know some refcounts are odd in the kernel, but I don't see where the
> > block layer is caring about 2 as a refcount anywhere, what am I missing=
?
>
> It is in the documentation, rendered version available here [1]. Let me
> know if it is still unclear, then I guess we need to update the docs.
>
> Also, my session from Recipes has a little bit of discussion regarding
> this refcount and it's use [2].
>
> Best regards,
> Andreas
>
>
> [1] https://rust.docs.kernel.org/kernel/block/mq/struct.Request.html#impl=
ementation-details
> [2] https://youtu.be/1LEvgkhU-t4?si=3DB1XnJhzCCNnUtRsI&t=3D1685
>
