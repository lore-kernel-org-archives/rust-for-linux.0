Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92B01BC4E
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Jul 2025 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752346206; cv=none; b=Y1d73ocw8fYDOibVWYmiJhEuVW3huUEeQ/l+GKnrygA+ztTJnLAOm651swWy5EuT6NExGTmPeuEfn6UOjexxkKHb5TAijZ9qDReTVqhHuXeplKhyb+qq00D0U6Pb8Kk/nfvjRyKde0FtrxeunyhkPlSKgwDCxt691HDkq28ao0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752346206; c=relaxed/simple;
	bh=DB6Ga8bM7aygL1kZpLGO9sfqmiDJCBOeNWjASjzmSLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWAw2lBdXNb2We3ruZKbgRHQCYTMz+12S0SFCuHr8dlQ2tk/jDw+Tvt+nLyqK/9hF+aRVepIcn8ueca+FKKRtGkw6eI/kMK1K4YTYXvV+Z8GupGdjVgitmxALd4to/amkQl+XszhyyUReZlEXbyrm/Z2+hmBWLUAVZoUvGT34Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjvEJnuN; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjvEJnuN"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-40b1f402deaso1744184b6e.3
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Jul 2025 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752346204; x=1752951004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmITCC/KfIDuOyy8MkPRa7zW/SdFzcGJZzQ3YXREI8w=;
        b=fjvEJnuNL1iOTR1RUq9oqJlCawIJIefkTkrsPYnPQReLw5/pYHgwv8QiaKDhRg+2F8
         K1F9YFSK3QbNSqrKlNmN71O8/RYl1ZpgsbuUhgk2YL5vT79LlatM4xZcdbWXmw9GUTxR
         RuTNHLrWGPOL85mIMjsRwkb6pdidEdlMRgOBEfQsK40Cip3ekQZtRNX0BWbqWDKRMEPL
         AafwLC99Z4M3VweMpbyEUQsrMK9Qqa9LN3Rt3H/AfSrMRX6jnboc6zdxd3UVKmxGP0wa
         oGPOP/ckO6/bKYOWk4rUfx4Hs9zSoDEPden0wtuoY3aJVKXxu9OojsxfN1Agbdy1QPHV
         NKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752346204; x=1752951004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmITCC/KfIDuOyy8MkPRa7zW/SdFzcGJZzQ3YXREI8w=;
        b=cd5Xi6NyA6BaDK8msxtE9mmtJ9EEkbtj50XrSrOmVCQ+AUZZFWq3s30tX5vcIN3cHG
         sB51Dcb4ai3zKxVyUvl4g2QkTb35z7icaWF/vW6lzLW5skYlkgFKbp/QXtYRxbnfCphx
         BLMoa4glZg4ZOX8lpbiDuUPmvXY1/Ups3DbDmk4XpbWgWz1NZuhfZqbj9df6LHkZvTsn
         xF5phQnXJYqUoZmVm6n9gGKaeMBkgBmB1JSK9uAwWQtfE34bHK8QNniu1HEkCVNwcSLz
         q6GuyQgli89I7kMt8yGTI6dDdsr9W5NsAlwyE3uRr+WH4kyToVRAfmwQgTtg5cJctzx4
         QZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCU6Leo5UOSlLwXsoa1u+Lz1+WHUSOG4TJ4DHEuRBMjcSzTEWx+pbzteZ4r12l1hjAAA3dOW+BLuwUy6N77/cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMz2mrEGmJUG5hU4bC9hN7P2ccylkGVg3XHgdUMcmj8XRUpzws
	7GHcoj0EvYN91FSDt5pFViTMkRqhUfV7idVbcH6OgeIwvxV3qUtX1djAeE5VcD1V/f2s9aQQSd3
	jNGoWKNl7pD2bmIom/V8MdjkvAdpwlZY=
X-Gm-Gg: ASbGncvdkhdhKSatzN3TPrtL9d7OmuzbgAfWaWzlCKadCjPXBP2FreeUvjQDjeI4krz
	oLat0nBU57w2f0dzS5i0ZZ6mPI0JcMGaovafvZQ3Avm+LeMiyTXmfSzu7g2zJrdmocaXh5YYR6n
	lfwBpXEYPlUKcI3WRcuYAVGp8j9KQspCLJR67aE8DMX0mhEbyrX0+/wU8AeNpMIJQSwKtIGJkzg
	Fls12rKXD4lufZkJSw=
X-Google-Smtp-Source: AGHT+IHrnGtltH6d/LHRfVMeejHGN49UH18y373XYXucdgMGhTHtMXV2dUQV7GZp/6Uns+6AEbERNSDwNpcuNgUXiN8=
X-Received: by 2002:a05:6808:1307:b0:406:6d79:49d2 with SMTP id
 5614622812f47-41567b4d886mr4828348b6e.26.1752346203776; Sat, 12 Jul 2025
 11:50:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
 <20250708003428.76783-4-marcelomoreira1905@gmail.com> <DB6RKSNTHUZ8.DW0EBFDU6L1I@kernel.org>
 <CAPZ3m_h37mCRO7oZX3qLnc+iFNwUu_wgYqEu_r0g-gtOB0661w@mail.gmail.com> <DB9XM595UG4V.3N51HST2TFVW@kernel.org>
In-Reply-To: <DB9XM595UG4V.3N51HST2TFVW@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sat, 12 Jul 2025 15:49:52 -0300
X-Gm-Features: Ac12FXyJ-xuhxJnQvJzFdVIc4nNkoqOGmBgB8Mc0t3TJ_NJLBm_WmDalyOBRRTo
Message-ID: <CAPZ3m_grA_T_ixfHs7Z44nf5je4ftBcqCx=vcyvJOsJb+LaMFg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] rust: revocable: Document RevocableGuard
 invariants and refine Deref safety
To: Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 12 de jul. de 2025 =C3=A0s 05:26, Benno Lossin <lossin@kernel=
.org> escreveu:
>
> On Sat Jul 12, 2025 at 1:06 AM CEST, Marcelo Moreira wrote:
> > Em ter., 8 de jul. de 2025 =C3=A0s 12:04, Benno Lossin <lossin@kernel.o=
rg> escreveu:
> >> On Tue Jul 8, 2025 at 2:33 AM CEST, Marcelo Moreira wrote:
> >> > Improves the `RevocableGuard` documentation by explicitly stating th=
at
> >> > its `data_ref` member is a valid pointer as an invariant. Additional=
ly,
> >> > the `Deref` implementation's `SAFETY` comment is refined to justify
> >> > the `unsafe` dereference based on this new invariant and the
> >> > `_rcu_guard` ensuring data accessibility.
> >> >
> >> > These changes address feedback regarding the clarity and completenes=
s
> >> > of `RevocableGuard`'s safety guarantees.
> >> >
> >> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> >> > ---
> >> >  rust/kernel/revocable.rs | 7 ++++---
> >> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> >> > index 6d8e9237dbdf..64fe44b4f5a3 100644
> >> > --- a/rust/kernel/revocable.rs
> >> > +++ b/rust/kernel/revocable.rs
> >> > @@ -233,7 +233,8 @@ fn drop(self: Pin<&mut Self>) {
> >> >  ///
> >> >  /// # Invariants
> >> >  ///
> >> > -/// The RCU read-side lock is held while the guard is alive.
> >> > +/// - `data_ref` is a valid pointer to a `T` object for the entire =
lifetime of this guard.
> >>
> >> This should be:
> >>
> >>     /// - `data_ref` is a valid pointer for as long as the RCU read-si=
de lock is held.
> >>
> >> > +/// - The RCU read-side lock is held while the guard is alive.
> >>
> >> And this invariant is unnecessary.
> >>
> >> >  pub struct RevocableGuard<'a, T> {
> >> >      // This can't use the `&'a T` type because references that appe=
ar in function arguments must
> >> >      // not become dangling during the execution of the function, wh=
ich can happen if the
> >> > @@ -258,8 +259,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
> >> >      type Target =3D T;
> >> >
> >> >      fn deref(&self) -> &Self::Target {
> >> > -        // SAFETY: By the type invariants, we hold the rcu read-sid=
e lock, so the object is
> >> > -        // guaranteed to remain valid.
> >> > +        // SAFETY: `self.data_ref` is valid for writes because of `=
Self`'s type invariants,
> >> > +        // and `_rcu_guard` ensures the data's accessibility for th=
e lifetime of this guard.
> >>
> >> This also needs to be adjusted.
> >>
> >> Also this patch should fix any invariant comments needed to construct
> >> `RevocableGuard`.
> >
> > Regarding this point, "...fix any invariant comments needed to
> > construct `RevocableGuard`."
> >
> > I looked at the function that constructs `RevocableGuard`
> > (try_access->RevocableGuard::new) and I think it's correct.
> >
> > In `try_access`, the comment justifies the validity of self.data.get()
> > by mentioning that `self.is_available` is true and that the RCU read
> > lock prevents data from being dropped. This aligns well with what we
> > already have in try_access_with_guard, for example (from patch 1/3).
>
> The comment seems wrong to me, it isn't even an `INVARIANT` comment. It
> also talks about RCU in the wrong way and doesn't mention the type
> invariants of `Self`...
>
> > Since there are no other code snippets that construct
> > `RevocableGuard`, I thought I'd submit the patch with just the
> > adjustments I made previously.
>
> There also is the `new` function of `RevocableGuard` that doesn't use an
> invariant comment. It also isn't unsafe despite taking a raw pointer...
> So either we make it unsafe, add the correct safety requirements which
> should just be the type invariants of the guard or we remove it, since
> we only use it once.

Even if it's only called once, I think it's better to make `new`
unsafe because it can be used in the future, and keeping it unsafe
gives us the advantage of maintainability.

Understood, Benno. I'll change `new` to be unsafe, change
`RevocableGuard::new` to an unsafe block, and adjust the `SAFEFY`
comment.
ok?

--=20
Cheers,
Marcelo Moreira
