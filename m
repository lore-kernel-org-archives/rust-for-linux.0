Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C248A269CE6
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 20:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766780864; cv=pass; b=KpBzNigPS/au7ZiNwhID/TMD75n7UGB4ZYArzswDWNbMjLjzzSBwH9wca5xwd1VmiNsR5nsn7VllEa9x6mHrcwDO4JYFe4IrE0F7YytcXFaPn8E8H4KqVuJepFIgKnv/CGGidhetOPv2+SAlFzZgIqMnm0w5wE7BtBiEYDOu5Pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766780864; c=relaxed/simple;
	bh=/+Y3ElW5XXaT1PF2PMJQNhr472JR1WcnkWfQGF1F2HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lw2eLaRGQOfviKSFILzHHERCrH5rhFKD8BODdjv0iGopq63ImatGJG8BWc0usBDQROFJAiwGAl+BQ7byHxSjjzLT0woPtWvUt8Em9ONNcgOa5f+XFDhJdVm+wJntsmTPWzTEICupjo7sJp2xUfiHlX2UTLNzYsVlPpSAMogvkKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rubg6pO/; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rubg6pO/"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b66d427e9so64817a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 12:27:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766780861; cv=none;
        d=google.com; s=arc-20240605;
        b=UCBrc0cIbXGZqE4UY/1As2DUlNzFLH6vHe9phtF5O5blu31Yss15Z9M4WJsmNYfNKx
         H1x84CFsCP0mBx1/5SVCy1QPSYhisxy55w3plgLK/G1a5bhUD9fZE1iynLfWMq5btT4S
         VvRgcUQDEgtSCI36qoRpOuG2ypHhBb+6ErF2X4bDrfWmnrQ5bIOgqHfJ/cRy/s1YkCOP
         y3eF9pv5kd+ObwcpwNZEvIHQqJ0XeHtT+HyF1qq2JLiwfGo0m0R6+LI0cmvq2k/IGXMj
         3w+CldKhILKaxBN/1TLMcpSjg5GLOPjLNoVv1gS4h6YmBQFv1ogTxLiEeyJ87pLvfHqv
         0YgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xqftiKs3cGrlYanfCXHX3QSMLcBsN2OyPt20ZqDPunY=;
        fh=+ybK/qA+v1D4SwPpY8qf/DYNpcZXbpImk+pRht/yW7w=;
        b=M2MWaW6Zq7XV17jd9QuAW3cSltFvFF4+Gluit/xmoavpv8toLstJAPR6lT6nJB3xFg
         KosGGf8NWzdrwS8q+5ewspr1Nn/TicKMlUoNTPihTuz/DFt4FVagepWT+R2QRvup4YBQ
         lt3cyBoiIzvB1h+38PhNXCwwPgH6EK8UxJSe/CqMiYAOSj62JRqbZgXZFCBOtfpKn0W6
         HplbGSfN5F/ODW9Icb1O5s58/sgXCIURA+RwhmmslAH84si5LsvX9rXIl0GMkHqjzauM
         yHrlyQi8SZgbk5CU6KH34fPPx8xaW1Lp3u8r35JiwVFJj/v/gGXh2d93ShJGxFxOxpkp
         Gakw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766780861; x=1767385661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqftiKs3cGrlYanfCXHX3QSMLcBsN2OyPt20ZqDPunY=;
        b=Rubg6pO/NZ+xQA7wBPf6ghUWhQw/2DPhzjfrIjbdgmyDWsCDSByVWrOqvv0VQ1xRqf
         h7CZaPHbv2cBqJ4iZgCQyxSz0ZF2Av8Xim7nlVOK4jzbmfstrg8jrR/2zMauDj0nk6ah
         zqItl2fs8Uj3dxVRU+EqjvE2g+wxYjtuBbxQ/GZiVB4RjC90LCp+6MZrKQMB0BHiK4Cd
         zrmxh5aAyHgSAofTiom0SvL2+jWbE2tvJtYzheQqmUU4x57eT3GPjlJnO5oaRtxZcb5O
         d2bfunJN2rDX7f0YyOiTOrB438ibWAE74BgxadmK8LUoX6Mi4+UTKffYmdo4i9R2FUaN
         /9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766780861; x=1767385661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xqftiKs3cGrlYanfCXHX3QSMLcBsN2OyPt20ZqDPunY=;
        b=vKoFJjcNpZkYKnp0ijNfthMmvucbRhKv7qM/2NnoDBXcD7uSbbE/dFaSLgSP18NFby
         MJsTvaSE/m7sMVIxyFNypIhxSFFcjZqh6Y1Dmo4QxzNZawOgKFjIML51jSvWTV7fcGhC
         Y9xbQd5lw57ae1WB0LrACGSHRjLDOlsmMk6HA1kdNqIedZKl14g4M5tSx5AaPny+myqR
         dSqeRyUATZe/yXKdgPvMQYTVNEihtZ/5k6vppFuieFewG2k3dAd3qHsXkU+ldgIh1SyS
         Au1e+RlNCACZk+qXoPXK0mWM45M/FJpGvdsww5wAbl/Pow88sV55doe+c3PuzvMX2t2j
         jy9g==
X-Forwarded-Encrypted: i=1; AJvYcCUSq+RpumZ7VDVmWDlgG61yOWHsijEx4pC9c43pdVhVkHdt9YyjFgHN9vb8Ffjhn2edTVm/wSbz3Md1ZXFXhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1F3yzFfcRrqJAymjUveodphoykghenJMyg87sKwyHqh+DSRQU
	nwlPgIYnaFKLWNeSghPYJWAs42lbCMEYOX79AHzoC92YyKXtxJJBX6CYGbgnN9O47YwnAwulrf7
	t/3+Qf2n8fMaKeYAQEqRWt1RLs8iiqlEZeVNB/n2Q
X-Gm-Gg: AY/fxX49oxnwfCmro/pEeWBImwNX+SEffHcnOcQFX1uskTLaRmNsLcxr7H/BOsFvE75
	QkajczXPbgmcMxm1yNMI4r3wphhY/B8jLFTyAVGRDLrCAr5581jFNcmbS/xfv12FqLydpWYGfjX
	yDxKkUD8UaGuxnMYy3IiVpmqkeKLLydPVC8hAUvdGORGUg8z46V1Bi2J/48jGhul6k3Ov/X76Es
	+mL9fTLqh8lzadM66J+JL8AJKeJ68NUa+GVC4N1Qmy1We0tf40vtRwCePecGOFtXtVV8epF6rk4
	iiXWHG7xs84kif5cATSP6+EeweW5AdDlXwCs
X-Google-Smtp-Source: AGHT+IHmPvz/aAx6qUCnCKjCxP1fu1/EPAI0m5sJqeFQ+lTeLXBFJffVU3ggQXpr6p/OUNlJEAEhXHKRGElA1tWRkqI=
X-Received: by 2002:a05:6402:5348:10b0:643:bfa:62ce with SMTP id
 4fb4d7f45d1cf-64ddb92b85amr51963a12.8.1766780860906; Fri, 26 Dec 2025
 12:27:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-1-b23e5277ad02@google.com> <0448F279-3759-423C-86B9-7A92137A28E7@collabora.com>
In-Reply-To: <0448F279-3759-423C-86B9-7A92137A28E7@collabora.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 26 Dec 2025 12:27:29 -0800
X-Gm-Features: AQt7F2oWQFV9xQGdo3Bu6LvM7EKoooHkQF-BDvOGEY8XX85fQ6ILNYIAd6-6aPU
Message-ID: <CAGSQo01LXCY2zf6vP5r1yP+FWT9ZKbOARJC=HpHCq=5HY3jajA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: transmute: Support transmuting slices of
 AsBytes/FromBytes types
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 8:52=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Matthew,
>
> > On 15 Dec 2025, at 21:44, Matthew Maurer <mmaurer@google.com> wrote:
> >
> > Currently, we support either transmuting a byte slice of the exact size
> > of the target type or a single element from a prefix of a byte slice.
> >
> > This adds support for transmuting from a byte slice to a slice of
> > elements, assuming appropriate traits are implemented.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> > rust/kernel/transmute.rs | 72 +++++++++++++++++++++++++++++++++++++++++=
+++++++
> > 1 file changed, 72 insertions(+)
> >
> > diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> > index be5dbf3829e25c92f85083cc0f4940f35bb7baec..5cc5f4fde4c31cea3c51ab0=
78b4d68f3a0a2caa1 100644
> > --- a/rust/kernel/transmute.rs
> > +++ b/rust/kernel/transmute.rs
> > @@ -122,6 +122,78 @@ fn from_bytes_mut_prefix(bytes: &mut [u8]) -> Opti=
on<(&mut Self, &mut [u8])>
> >         }
> >     }
> >
> > +    /// Converts a slice of bytes to a slice of `Self`.
> > +    ///
> > +    /// Succeeds if the reference is properly aligned, and the size of=
 `bytes` is a multiple of that
> > +    /// of `Self`.
> > +    ///
> > +    /// Otherwise, returns [`None`].
> > +    fn from_bytes_to_slice(bytes: &[u8]) -> Option<&[Self]>
> > +    where
> > +        Self: Sized,
> > +    {
> > +        let size =3D size_of::<Self>();
> > +        if size =3D=3D 0 {
> > +            return None;
> > +        }
> > +        if bytes.len() % size !=3D 0 {
> > +            return None;
> > +        }
> > +        let len =3D bytes.len() / size;
> > +        let ptr =3D bytes.as_ptr().cast::<Self>();
> > +
> > +        #[allow(clippy::incompatible_msrv)]
> > +        if ptr.is_aligned() {
> > +            // SAFETY:
> > +            // - `ptr` is valid for reads of `bytes.len()` bytes, whic=
h is
> > +            //   `len * size_of::<Self>()`.
> > +            // - `ptr` is aligned for `Self`.
> > +            // - `ptr` points to `len` consecutive properly initialize=
d values of type `Self`
> > +            //   because `Self` implements `FromBytes` (any bit patter=
n is valid).
> > +            // - The lifetime of the returned slice is bound to the in=
put `bytes`.
> > +            unsafe { Some(core::slice::from_raw_parts(ptr, len)) }
> > +        } else {
> > +            None
> > +        }
>
> Nit: I=E2=80=99d rewrite this as
>
> if !ptr.is_aligned() {
>  return None;
> }
>
> unsafe { Some(core::slice::from_raw_parts(ptr, len)) }
>
> This saves one indentation level.
>

If this code were sizable, or if there were no unsafe, I'd agree with
you. However:
1. It makes the path condition for the `unsafe` block clearer - the if
condition directly guards the unsafe block, which makes it locally
obvious why it can assume "`ptr` is aligned for `Self`." With the
"check error and early return" strategy, you need to reason less
locally about the reachability of the statement.
2. The guarded code is one line long. If it were significant, then I
can see the point of using an early-return style in order to avoid
indentation, especially if the block *itself* had indentation. This is
one line.
3. This is coherent with `from_bytes_mut` and `from_bytes` in this
file, which also use this style.

> > +    }
> > +
> > +    /// Converts a mutable slice of bytes to a mutable slice of `Self`=
.
> > +    ///
> > +    /// Succeeds if the reference is properly aligned, and the size of=
 `bytes` is a multiple of that
> > +    /// of `Self`.
> > +    ///
> > +    /// Otherwise, returns [`None`].
> > +    fn from_bytes_to_mut_slice(bytes: &mut [u8]) -> Option<&mut [Self]=
>
> > +    where
> > +        Self: AsBytes + Sized,
> > +    {
> > +        let size =3D size_of::<Self>();
> > +        if size =3D=3D 0 {
> > +            return None;
> > +        }
> > +        if bytes.len() % size !=3D 0 {
> > +            return None;
> > +        }
> > +        let len =3D bytes.len() / size;
> > +        let ptr =3D bytes.as_mut_ptr().cast::<Self>();
> > +
> > +        #[allow(clippy::incompatible_msrv)]
> > +        if ptr.is_aligned() {
> > +            // SAFETY:
> > +            // - `ptr` is valid for reads and writes of `bytes.len()` =
bytes, which is
> > +            //   `len * size_of::<Self>()`.
> > +            // - `ptr` is aligned for `Self`.
> > +            // - `ptr` points to `len` consecutive properly initialize=
d values of type `Self`
> > +            //   because `Self` implements `FromBytes`.
> > +            // - `AsBytes` guarantees that writing a new `Self` to the=
 resulting slice can safely
> > +            //   be reflected as bytes in the original slice.
> > +            // - The lifetime of the returned slice is bound to the in=
put `bytes`.
> > +            unsafe { Some(core::slice::from_raw_parts_mut(ptr, len)) }
> > +        } else {
> > +            None
> > +        }
>
> Same here.

Same here :)

>
> > +    }
> > +
> >     /// Creates an owned instance of `Self` by copying `bytes`.
> >     ///
> >     /// Unlike [`FromBytes::from_bytes`], which requires aligned input,=
 this method can be used on
> >
> > --
> > 2.52.0.305.g3fc767764a-goog
> >
> >
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>
