Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE9C2236FC
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 23:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752275197; cv=none; b=pqKxDULglW/KZhPg3W3oCqvfmt32cLRN9n1D5WX1XB4cQwfyxch5DhdGKXUeI2PmMDJG7gsDpikRkuIl/zQ2Ta9tDP8QwdursfKnt75Rsq5LCvdmWtmgFxq9DTL3N51RG+Ck8jGF1P+d/SiZ9o/zTeTqiWy0stxe5kn8005Ewjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752275197; c=relaxed/simple;
	bh=J/++C16moqzoVlTP/lf6R7gUE8NX9kZrPP/iXEkky6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kII9nKNgM76Imb2J77VJNYWCs3ZEsSfz6BYKpXLuvRHI84m73VaIjrCKGCwgrsOqFt2z+PmC3k+nA+LCucEldOlk8gvpK+vTm48jmQF3mwRIq1rw1jTXDkzfLsLTL9F6gxSYBcwsaQi8lnWptFW5g6xh/NnkmOVWu+iMiohdy0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4O0/Ucb; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4O0/Ucb"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6114114daddso1205870eaf.2
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752275195; x=1752879995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWlqIYZwfGa8IZ2J2RwapF8HBfqgCMjaYm1MCof6FIQ=;
        b=Y4O0/UcbDzyW3Ye8TFKo+n3vLuLyHJMs1VMAs2TNOfhOcz2lZylo3aTKXBl+jYjuyr
         dwepmnVMiIv5ck62CVbUPxTk8YCDdPlL/SPwN7K+69NFWB/5uAFf/zOYNf9E6fjVFXBB
         9b37C/iszR8E1GDidQfmFUO1yJRDirg+63u7Hgsfn3k+/PKT71UmeKRh49+dsE7zkEL2
         HGREGEFOVgWNY1opIyxcPKdQkETHZolczqqBAVEuqBV8Y/RmL3bYGnvFtF/XHmRxfwhU
         i34WBZ8tjYZTObkS11MJiWb3cc62zdBDyFlCVrROr8FXaJRc76LCZFmBgc5/sBGQb0SZ
         FS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752275195; x=1752879995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWlqIYZwfGa8IZ2J2RwapF8HBfqgCMjaYm1MCof6FIQ=;
        b=sJQ1ew9EQ+2LtCh0JpB4G96VV1eYU935IqrUqdEBSnO6we0Qr2aRbcwpWJ120sJWxa
         1Ztb30TJa2uMhDYaxEHOsAVG7iuz1qiMasJo2SsTwzEDU0chOvjnt3tUmjUVsku/bMtW
         Xb7jeled+XPf70Zlb7dyirzAg2JZGLqKT/xL2xZ6SDr3fRHYTOdfOl/36zVytshrVGoH
         kJNdFGFjQRbeDNRbzof4KArTnp8bdHrpSZOdMFFxKL9fXGEGJ915c4oaIP8R39RVbOHZ
         DH28cgiAT0SIjfSN4siplVg5jZr4CWGSSKXUJGbnt7s6C8DL9Tth3AizlGmRNa/e7Xm9
         hF5A==
X-Forwarded-Encrypted: i=1; AJvYcCUCxjqwrHPzsQzIdZQhho9pECeQeVU3p/wqIMj9H4xD0iaZzpwkkIgtl66AOvc2X4yTxI01wiYkkqf7fh9pBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBfRpa3oEfz7xVlQ1531i6Zj0dwcOydLzH3sUaxwcXjdXQTQ1o
	YkkyD6vdobtNPx8hUXnjdkNHnACaKgaGJ41Xvropm56qhpCgsMf3UDESypFfGx60KYCHcS2OMN8
	wglADjv82TPdmJdG6uKtMkhX+DzXTh9eS2gVs6Ys=
X-Gm-Gg: ASbGnctLy2o4Z2X916+0Ye3ZIHe0t9tbUZ5rtdb+v+ISKjtYcs9Arub7elwluZdWmk2
	+25pBZxrAAyPVSE10A2FJg7EAHtr/6f8IvEQimnovYkmNdzlVNtoGdBcQ97mKJ9RxAkQQEvXFPn
	ATkpIwHO7RD0TGZUQPMJXj7klCDsIfzrpF7PgZiwmFD54jCjujhjlKpzYtqYs1FhWQFAzsgrUUk
	/BevgnkbLIWz7wGDZE=
X-Google-Smtp-Source: AGHT+IFJW4CNOJIr7R4b/bnmKJzlSe/8G7kLjgFbHM6LcEoZA2rwemd08UYr0qBm7b6KD/uCu1Ld5IFttmtDdwNIyVg=
X-Received: by 2002:a05:6820:1e8b:b0:611:bdaa:5b01 with SMTP id
 006d021491bc7-613e5fe0d17mr3699787eaf.6.1752275194951; Fri, 11 Jul 2025
 16:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
 <20250708003428.76783-4-marcelomoreira1905@gmail.com> <DB6RKSNTHUZ8.DW0EBFDU6L1I@kernel.org>
In-Reply-To: <DB6RKSNTHUZ8.DW0EBFDU6L1I@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Fri, 11 Jul 2025 20:06:23 -0300
X-Gm-Features: Ac12FXxXlwtkZCWJ5lCeCujefFf1sbVg1hNtETD5qV_PoYfkB3WUhZoxbNybb74
Message-ID: <CAPZ3m_h37mCRO7oZX3qLnc+iFNwUu_wgYqEu_r0g-gtOB0661w@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] rust: revocable: Document RevocableGuard
 invariants and refine Deref safety
To: Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 8 de jul. de 2025 =C3=A0s 12:04, Benno Lossin <lossin@kernel.org> =
escreveu:
>
> On Tue Jul 8, 2025 at 2:33 AM CEST, Marcelo Moreira wrote:
> > Improves the `RevocableGuard` documentation by explicitly stating that
> > its `data_ref` member is a valid pointer as an invariant. Additionally,
> > the `Deref` implementation's `SAFETY` comment is refined to justify
> > the `unsafe` dereference based on this new invariant and the
> > `_rcu_guard` ensuring data accessibility.
> >
> > These changes address feedback regarding the clarity and completeness
> > of `RevocableGuard`'s safety guarantees.
> >
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> > ---
> >  rust/kernel/revocable.rs | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 6d8e9237dbdf..64fe44b4f5a3 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -233,7 +233,8 @@ fn drop(self: Pin<&mut Self>) {
> >  ///
> >  /// # Invariants
> >  ///
> > -/// The RCU read-side lock is held while the guard is alive.
> > +/// - `data_ref` is a valid pointer to a `T` object for the entire lif=
etime of this guard.
>
> This should be:
>
>     /// - `data_ref` is a valid pointer for as long as the RCU read-side =
lock is held.
>
> > +/// - The RCU read-side lock is held while the guard is alive.
>
> And this invariant is unnecessary.
>
> >  pub struct RevocableGuard<'a, T> {
> >      // This can't use the `&'a T` type because references that appear =
in function arguments must
> >      // not become dangling during the execution of the function, which=
 can happen if the
> > @@ -258,8 +259,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
> >      type Target =3D T;
> >
> >      fn deref(&self) -> &Self::Target {
> > -        // SAFETY: By the type invariants, we hold the rcu read-side l=
ock, so the object is
> > -        // guaranteed to remain valid.
> > +        // SAFETY: `self.data_ref` is valid for writes because of `Sel=
f`'s type invariants,
> > +        // and `_rcu_guard` ensures the data's accessibility for the l=
ifetime of this guard.
>
> This also needs to be adjusted.
>
> Also this patch should fix any invariant comments needed to construct
> `RevocableGuard`.

Regarding this point, "...fix any invariant comments needed to
construct `RevocableGuard`."

I looked at the function that constructs `RevocableGuard`
(try_access->RevocableGuard::new) and I think it's correct.

In `try_access`, the comment justifies the validity of self.data.get()
by mentioning that `self.is_available` is true and that the RCU read
lock prevents data from being dropped. This aligns well with what we
already have in try_access_with_guard, for example (from patch 1/3).

Since there are no other code snippets that construct
`RevocableGuard`, I thought I'd submit the patch with just the
adjustments I made previously.

--
Cheers,
Marcelo Moreira
