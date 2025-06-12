Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA14433A0
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 18:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754391; cv=none; b=ts0RhBacWDJprQBpQyH/4gFV3gMI5DbVun1DXC9GyLni2Xr8FqI0PpWwO7TsXb20tdA7JE7iq6wmXZsGmcDcbrmbceTHhu+7YpvTTl4USNWe0xEQiDekNLkzTwHp+CDyknsC8KqZZ1yj+aR8YWCpfbGuAs840a3blkDG9+LmQOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754391; c=relaxed/simple;
	bh=d5+WGhhcp+MGZ1C5HzDAZA9VI4291qm8GsADLhFOFSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Si5ZiI/1LjmDqrYdWsa/XbnIh80hF8+/P9Yv/3Ki+OclzuQUsIsbCubqYzME9ncEZwp+gXplpMDoW3y97cjDZ4/TEMS50htsYbU1euCIjvI4WuyUGJJa51WWfMSsvuw6EULFdm1xUB2tr4He3UJmMhvTJkK5MpsU94Fz5QLN0bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+sCx5M6; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+sCx5M6"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-73044329768so998930a34.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 11:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749754389; x=1750359189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE06FTK8AiT7gXuZ0kOSJnrEGriFz7fdd2d9uJYxUaM=;
        b=J+sCx5M6p3U+/BgmgTiZCpTCqnKdxsiRzt8iyER7o1F+T8YFO1utrhL3WAbG1brYHM
         a4uHg15o+6CRh16e+eMhiB0AuR3cvYexsWQT2cnryRvzQugR+8bAUlS5GY2tjNj+e55s
         kfYiR52W8z8L4I5XjXUShkrdYq3uzRMC1uuQKv4dCvDYYMWNZAWEaEfhC2SMOuz1LE7z
         jqJsMHhEvxuL2ir6zWK4TwyS+FZAjXxN95nj1DPhY/38B7LcVDPmDBfuX94lK4e74dM3
         HGaM5QKqB6OmPZaZqzkdXuMWmo9fXleUY0TjPxBBTp1bJsseISMMEZ+7Nsh1TpQksEKg
         F6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754389; x=1750359189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cE06FTK8AiT7gXuZ0kOSJnrEGriFz7fdd2d9uJYxUaM=;
        b=TLtXVe1FMhWHaVwy2t8b/e4wdkf/IIRLxtnaTbxKwr/XINYyQLaw7ajNohLligDg1l
         fgSXSL3is3+gCLF9jNo8uS6P9kQwW1YXQjqwXbuRrw9jFqWddA3gR/2BjQQZgef0UgxA
         6t2B2acFq5N4hgOEvW7DV+9v7WuoCLX9/AoA5dVZnvbV97U5kury2UJmYAfiZ8AANPM4
         8ODzxHQ6N9FSlocmeFZPvBEpyWGoET7nr1+jFjYwIdZZb5ZUwpX/s2KGp228pPH2KmRy
         tiQGLo3Kjhf0HQ+RviY71Esv93sr7T3mSPy7hGVQSE4ZTKKaffUTR3+IoNAqS4gKa284
         Ly9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKP8zHY0kR+woubjUmEVs5ysgWNuhtKqzadivMWmLB2W6UsFWhwRcqly9Pdz6/1nFmm8J4fPh6Lyr3YsHS7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA3lKkgip8+dWaCtYJo5jNyf8w3eU0DyoQFxqQ7EbZ74JzNGCc
	qlGKavs0eesRU9/Ri62EqGq6e13WXyUXpXkFPfL3WwcNsK7HRxGtEPTDHP/KKyn4N90D1Pr10dr
	kn5B+IrAop/yzc0SceVlzOBj6MmX7ssk=
X-Gm-Gg: ASbGnctzsmA/J1H70ddO6HGogg5HVgEMdYhR4ns144fGaqZFx+sCeLU2DjxfdH1cyIw
	EkfmecjllVeIZnx6AHkYheDtWXXRPcYp3rOgGrFrjlQywrhP+hp8X77jN1g7GckCiF4GjWVc6Re
	LeXwNQdv15OOiDqpTaXzxxJf7RQYoVAEm2Z9ARfItnZ2bjQsCG1Kx5Y8k=
X-Google-Smtp-Source: AGHT+IHGevGfBO1YY2lZjLZ+gxJQ8GCyuh4zpLb9vCEgZt4Hg3TYCMjuMdnSTo7+0aYyGADjkbLq7ZS33umBA54x7mY=
X-Received: by 2002:a05:6808:2188:b0:406:769e:e7a9 with SMTP id
 5614622812f47-40a71e7cb9dmr401622b6e.35.1749754389077; Thu, 12 Jun 2025
 11:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-3-marcelomoreira1905@gmail.com> <aEqdur4JTFa1V20U@google.com>
 <DAKGNYQ6M24H.1KVXZASA4V00C@kernel.org>
In-Reply-To: <DAKGNYQ6M24H.1KVXZASA4V00C@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Thu, 12 Jun 2025 15:52:57 -0300
X-Gm-Features: AX0GCFvFvx-bpFhsDzC1pZXcGeQRbogJBVN7FSsBfkcA8FnXBfy6qWSbWzhpO_w
Message-ID: <CAPZ3m_gmeaQYu2oA5uz=zhnXUV+pyrnQvjootxKGos-_hWEATQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for
 internal safety
To: Benno Lossin <lossin@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 12 de jun. de 2025 =C3=A0s 06:52, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Thu Jun 12, 2025 at 11:28 AM CEST, Alice Ryhl wrote:
> > On Mon, Jun 02, 2025 at 08:26:23PM -0300, Marcelo Moreira wrote:
> >> This commit refactors `RevocableGuard` to hold a direct reference
> >> (`&'a T`) instead of a raw pointer (`*const T`). This makes the guard
> >> internally safe, reducing the need for `unsafe` blocks in its usage
> >> and simplifying its implementation.
> >>
> >> The `try_access` function is updated to leverage `try_access_with_guar=
d`
> >> and `map` to construct the `RevocableGuard` in a more idiomatic and sa=
fe
> >> Rust way, avoiding manual pointer operations. The associated invariant=
s
> >> and `SAFETY` comments for `RevocableGuard` itself are removed as its
> >> safety is now guaranteed by its type definition.
> >>
> >> Suggested-by: Benno Lossin <lossin@kernel.org>
> >> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> >> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> >> ---
> >>  rust/kernel/revocable.rs | 26 ++++++--------------------
> >>  1 file changed, 6 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> >> index d14f9052f1ac..43cc9bdc94f4 100644
> >> --- a/rust/kernel/revocable.rs
> >> +++ b/rust/kernel/revocable.rs
> >> @@ -105,13 +105,7 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit=
<Self> {
> >>      /// because another CPU may be waiting to complete the revocation=
 of this object.
> >>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >>          let guard =3D rcu::read_lock();
> >> -        if self.is_available.load(Ordering::Relaxed) {
> >> -            // Since `self.is_available` is true, data is initialised=
 and has to remain valid
> >> -            // because the RCU read side lock prevents it from being =
dropped.
> >> -            Some(RevocableGuard::new(self.data.get(), guard))
> >> -        } else {
> >> -            None
> >> -        }
> >> +        self.try_access_with_guard(&guard).map(|data| RevocableGuard:=
:new(data, guard))
> >>      }
> >>
> >>      /// Tries to access the revocable wrapped object.
> >> @@ -198,22 +192,16 @@ fn drop(self: Pin<&mut Self>) {
> >>  ///
> >>  /// CPUs may not sleep while holding on to [`RevocableGuard`] because=
 it's in atomic context
> >>  /// holding the RCU read-side lock.
> >> -///
> >> -/// # Invariants
> >> -///
> >> -/// The RCU read-side lock is held while the guard is alive.
> >>  pub struct RevocableGuard<'a, T> {
> >> -    data_ref: *const T,
> >> +    data: &'a T,
> >>      _rcu_guard: rcu::Guard,
> >> -    _p: PhantomData<&'a ()>,
> >>  }
> >
> > I don't think this change is valid. Consider this code:
> >
> > fn takes_guard(arg: RevocableGuard<'_, i32>) {
> >     drop(arg);
> >     // rcu guard is dropped, so `arg.data` may become dangling now
> > }
> >
> > This violates the requirement that references that appear in function
> > arguments are valid for the entire function call, see:
> > https://perso.crans.org/vanille/treebor/protectors.html
>
> That's a good point. I don't see a way to make this work then... That's
> a bit sad :(

Thanks for the feedback. I didn't see this in my testing. Sorry.

I'm going to revert `RevocableGuard` back to the original design. Thanks! :=
)

>
> @Marcelo: sorry for the extra work.

don't worry! I'm learning =3DD

Just one thing, I wanted to ask for your opinion on another change in
the patch, specifically in the `try_access` function. I refactored the
logic of an `if/else` block to use
`self.try_access_with_guard(&guard).map(|data|
RevocableGuard::new(data, guard))`.

This change uses `Option::map`, the logic is: "if
`try_access_with_guard` succeeds, transform its result into a
`RevocableGuard` using the given `rcu::Guard`; otherwise, propagate
`None`." As I understand it, this transformation maintains the
original semantics and security.

Do you think keeping this specific change (using `.map()`) is a good
decision for clarity and style, or should I revert it to the explicit
`if/else` block as well?

Thanks Alice :)
Thanks Benno :)

Cheers,
Marcelo Moreira
