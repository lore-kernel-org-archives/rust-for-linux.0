Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E37259C92
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Jul 2025 22:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752013486; cv=none; b=O9dF/yEzlwzdUIBF4MBb04prEpIG4QvnIzLOoEnF//u49Ra9JqA7Mv1nK5dRPR/pjcyiASelApHVa/u8xKx21iM6s3qy5PdmHwXmYIlIkcXXMnJjs1vKTS3J0HnZ5PX90uULIHQA+YxH6MwqipsFPS6zQzOBxY1prYaIoYSa6ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752013486; c=relaxed/simple;
	bh=1IG7fym2wnRXLJOMKB00X7u5L7eu38piDlH6pEzjL/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFqFgnb/21dzIJrlyT8W62iQEViw/o8xjFByW/6XpQ/BRPzGVKCHVGj02CoJa7vl+RlJgtP5pMVqwPXegqSI6PunGkVUKX982Dm3s2Se/J/k7lDS8R8gKWKBW88nFM9TdidFI2ygnWetqxJ4JGi3HsDmnZflLqTkmGB5CKJgyRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6JwFLuY; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6JwFLuY"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6118c1775dbso1450974eaf.1
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Jul 2025 15:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752013484; x=1752618284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwCnPHpixWh2MxDiEiUT8nt+4FfPoK+sTsuqRzuBJhI=;
        b=V6JwFLuYI9kKH+kyMlSZeXt+jyK1XJzNe0KpnOcyuwHJ8HAfSK3+ZuNVbEXf/Xz0r+
         2vHZXf4j6ryX9OquHm0n2jArTvb/5g6+cNz5TPqent8ZSBoFBtNhOsjW+eJO3K4SOKuz
         DWeS88JNXHXHUopOyJtS20Xppz8WAoHCmZnROFdgcpA63cAPVduaI2xCXNW2uHlP+N1Y
         29dZdxWcytrjJGiqj3TGojPLbN+PjJybbb6MWC5yPZXTo1GpFx1ldrHzsqgYHfENuJtk
         S1wHx5/fWFY2ejwfXq7Hitw0u8frWtbxb2YrTwfNad4uXKoAvVFrldaGSo5oyKPqqDBC
         c6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752013484; x=1752618284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwCnPHpixWh2MxDiEiUT8nt+4FfPoK+sTsuqRzuBJhI=;
        b=qSLs1XdXw1Kn6pQKEGU6rQlSpy2ZM00IGYUPZB44lFQy87405YDyfq+r39Ajet5kO5
         7frrhXfoXu0cLYsaeYnNaqt34TVa/Ckm+4qIhXlNYD2wnh1EzVG6vHmQk5Zst8lCOdl5
         ol64xGrcdTgnQSTUDBfOx/Fq6JlMbZMJ+EJywl7u9MiEyN0shdQ2Sdfl9LDaTw8RymfI
         YlmVKCp05r23bnrnGEtamVeFh51YMbEkWSS8LT+QwCrIWlmye1jxtS1lZ0vhRCR3y/DX
         hXtdk9d9QyjLI5XcoJqihLihjV92e7yy2HAYPgpTdElstvw8f1+W2yPIQOQfJNlJy/P8
         O4uw==
X-Forwarded-Encrypted: i=1; AJvYcCU+JlsjxmCLRHxw0rHYYqleBRAB85Huo1e4nH0YMGbaTjxrWZJEXqGZEV6ARUAKKAf8Crh5HYIrUspR/K2Rww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmNA/QTyMsOIuRvvjhq5VW7nhc0U8sJy76Hx6f3HREpzT40ykA
	ecnXJ2BeM8InovQqBk4tyEJ9//JI8OQ9T3iunyyupKMPSiIOduNnyOVM/TOwi6R+QvK9DSzY3I8
	6aH/XMcZ53sJMFbekFwmDeXJC0zORw7Y=
X-Gm-Gg: ASbGncvnNb7uKDTIgPxWnwFCnMq9jbaEl69uZY80wSojCUSCyy5PpDqSGaLxirKojWt
	tZTqzORtTaoeejZB/clhItDzl7cQRqBr6yKajF0bhb9gEkhV9RkURA22yvpLgGxLMozv8khiIvL
	kZKUUBH95ukw5Aeaakilqgo2QAdEf/aBhbAd04PcgxBsW4N3hje0JOkhk=
X-Google-Smtp-Source: AGHT+IHXuecyrSKj57EyW4OksWUY/S1xTwgoQX541RUX9ZLBb2rY2uaGobqt+FiwxgvLteid6oifLoyEpnXA2/UEq9E=
X-Received: by 2002:a05:6820:138a:b0:605:f34d:7e00 with SMTP id
 006d021491bc7-613cceda6e7mr88768eaf.7.1752013483820; Tue, 08 Jul 2025
 15:24:43 -0700 (PDT)
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
Date: Tue, 8 Jul 2025 19:24:32 -0300
X-Gm-Features: Ac12FXx-fqgCn77oYJv9TW6Ruc92PZPIwM2ZiFegyDapKQeHs_V0sX1d4fV5QuE
Message-ID: <CAPZ3m_hArv5MA7H4RYRj1FHUaaFF9+2QAuo03xhUKGQ-YZ8uFg@mail.gmail.com>
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

Ok, I will keep only this comment. Thanks!


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

oh, of course, &T is an immutable reference, mb.

What about:
// SAFETY: `self.data_ref` is valid because of `Self`'s type invariants
// and the active RCU read-side lock held via `_rcu_guard`, ensuring
the data's accessibility.

--=20
Cheers,
Marcelo Moreira
