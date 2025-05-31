Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B428F610D
	for <rust-for-linux@vger.kernel.org>; Sat, 31 May 2025 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748725798; cv=none; b=hwbU6Q/lMoSH67a9sycGycE7xGJubGe1Do/BfpZ447Z1rhTpNRrWHVZ8df3dyX81IB+UD9mpo2wbirc19U14nSpwI0nPlACGv4/aUCb1Qevl4f48Nn3Stp2fE9o7cztnjE+2kYGwfzgcPw+NEkF91NJR3eaxCz3PROCtlrYNlRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748725798; c=relaxed/simple;
	bh=u8a2NkNNd1pqKtbAGadHEEcUwqWQAaGjVUfFSf3L4H4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwoaOJygrW6IZQ+HPNOrBDwLZ4JHg67iTLN77Hoo2MfFNCM5B2ELmEcuYRqNmcqGI9pGB0LtZD+mgI7Zy588wZF9SD8ojQP1NvXsQklhxMST5xQZ2+X+kP28bB/c0n9oYKRvKsrgtrwdv1RxDKCHs76h+DzEzMX1xCDT4olYbjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pPAlIMwK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pPAlIMwK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so33552655e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 31 May 2025 14:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748725795; x=1749330595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4MAljZb6VaLb+JJfW2inrM+R4knjNKG7SImE66ez2c=;
        b=pPAlIMwKtLLJ1jQqdS46p/pu9Kwv9MiT6B8CGQZ2zxLmMYV3Dz9jC61p4P35XtNjpK
         c5vQTGgpQFINKftPp/htW9hmc3QRUe5W9pdqnFk+KeejKofWRSlPArR4RKge1w8r0ldT
         nFvd35YRV9YwiSri/CxM9yu9X4JLExhg38aFKtti7xa3Fa6LgIr4pbWWyDMEXQ/F9SpI
         /v8yLSOIyr7RRKvXzozGI3q5dV+H7jHRIVCUBoCcVZyXBWGjQnqELH1dbKC20L7COJN9
         zYpLyBRdBrpG66Vxb+8jWILBFJborx3JUMcz46ZuUpj2pwSsKbz+iMLl6OKc2gfjZin0
         8TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748725795; x=1749330595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4MAljZb6VaLb+JJfW2inrM+R4knjNKG7SImE66ez2c=;
        b=erogIIlUpOdOwJc9j3fGafe7cxYSdoT7Gai6/RoT0Xq0jqwFGk1jvwx74b0zuYdOwu
         vP9eqhLxSMjaUOBjkclFh5xDkIUFTg2mJoW8lGCkVqxUZ9tGpquVuLeDH3O+JsdGRUX5
         s/u4bgHgq8V7f7D5V/kpr3tl/iCIh5KxMQ2X7G3N1ImrNX8N4DG1tp4K9JBqHnpxMTyE
         aaelk6mBuPsqn4PpM6sNhsXxKujwByR6VmQWAJv0sJwKlYAS4neiHq2UYvtx56EW0Jlh
         z/bDqWPZ45lN+OQ4kSJEIlReBL1p2Gn9j0/FD3W0wz0BxrzyGwd4o4q9nTL++orZPZTd
         Iueg==
X-Forwarded-Encrypted: i=1; AJvYcCVJOStP3Qqxyrgr9vPsrhMjqIf0F+BSJX0BO0uEwVUsn8VprgnykvzUUbMQse2+oEQEZVCYQJyQNmbaD9KWHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrj9uztHZYxZf9hySeOzxCuNpX1zHkKmmqkfY0VjJK6a8Z1fpc
	LR3B7ONYZTHLLwNaEYUiXWyXqCi5k7ceHeU0ecfP0+GQVPZjVliprb2nxV18FHzgX8pcnIiRxje
	e+DYw9KiemHV7ewmqIbr1561mDTN5lut5f6CZOZK4
X-Gm-Gg: ASbGnctA2QQWW7JttbnZV6GbmU+euCOIPGq3qhpw6/APjbqLCkTahL8qMMce1djid2D
	hfTOkSVa8Kczktr2L4wDE5j3luF4fbRB5AC+cMokV0ZsTxAVNMvCz4+9I+wJGVrJ4qT3DZ3Qo8d
	CZI11FfnB4C6H39UrD1WXi7vaAjfxqDYA0oe5fsRGnrcYe
X-Google-Smtp-Source: AGHT+IFIRaZbn8gKcVwGvsqHeJaCCSovLLe9GrV5ROw/dR94c7J1c/uOa2ltNvjq+/U/6CRBtT2Ujn5IoXb9e8TneFU=
X-Received: by 2002:a05:6000:402a:b0:3a4:ebc2:d6ec with SMTP id
 ffacd0b85a97d-3a4f7a4d257mr5846489f8f.14.1748725794909; Sat, 31 May 2025
 14:09:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-2-82168470d472@google.com> <DA9P904SL0KL.1QNQAI240QLH6@kernel.org>
 <CAH5fLgjZrJ66VnW0J_CHc-3yUFOt+DRWgTCNxoftACga+Lw+fA@mail.gmail.com>
 <DAAG8AUG7GE2.EVO9Y6PZTHDI@kernel.org> <CAH5fLgjNCQV8zsfdeq21iXiu_VOpt=WGnm9nMp-B0bOEMEBctw@mail.gmail.com>
 <DAAMVOZJDNNT.1JR5YY3ICI0Q5@kernel.org>
In-Reply-To: <DAAMVOZJDNNT.1JR5YY3ICI0Q5@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 31 May 2025 23:09:43 +0200
X-Gm-Features: AX0GCFvR4yJBxRf9_0uyJroI03dydMcK82Y-sUNhb1wu-pGif1hyrxWf-JFooEs
Message-ID: <CAH5fLgj8WkjDs6qCmzxYsYTH=_knWyZDrwqLopvGZEBk931aXQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 10:38=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Sat May 31, 2025 at 7:38 PM CEST, Alice Ryhl wrote:
> > On Sat, May 31, 2025 at 5:25=E2=80=AFPM Benno Lossin <lossin@kernel.org=
> wrote:
> >> On Sat May 31, 2025 at 3:25 PM CEST, Alice Ryhl wrote:
> >> > On Fri, May 30, 2025 at 8:16=E2=80=AFPM Benno Lossin <lossin@kernel.=
org> wrote:
> >> >> On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
> >> >> > This patch adds a more convenient method for reading C strings fr=
om
> >> >> > userspace. Logic is added to NUL-terminate the buffer when necess=
ary so
> >> >> > that a &CStr can be returned.
> >> >> >
> >> >> > Note that we treat attempts to read past `self.length` as a fault=
, so
> >> >> > this returns EFAULT if that limit is exceeded before `buf.len()` =
is
> >> >> > reached.
> >> >> >
> >> >> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> >> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >> >> > ---
> >> >> >  rust/kernel/uaccess.rs | 56 ++++++++++++++++++++++++++++++++++++=
+++++++++++++-
> >> >> >  1 file changed, 55 insertions(+), 1 deletion(-)
> >> >> >
> >> >> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> >> >> > index 9b1e4016fca2c25a44a8417c7e35e0fcf08aa959..e6534b52a1920254d=
61f8349426d4cdb38286089 100644
> >> >> > --- a/rust/kernel/uaccess.rs
> >> >> > +++ b/rust/kernel/uaccess.rs
> >> >> > @@ -293,6 +293,61 @@ pub fn read_all<A: Allocator>(mut self, buf:=
 &mut Vec<u8, A>, flags: Flags) -> R
> >> >> >          unsafe { buf.set_len(buf.len() + len) };
> >> >> >          Ok(())
> >> >> >      }
> >> >> > +
> >> >> > +    /// Read a NUL-terminated string from userspace and return i=
t.
> >> >> > +    ///
> >> >> > +    /// The string is read into `buf` and a NUL-terminator is ad=
ded if the end of `buf` is reached.
> >> >> > +    /// Since there must be space to add a NUL-terminator, the b=
uffer must not be empty. The
> >> >> > +    /// returned `&CStr` points into `buf`.
> >> >> > +    ///
> >> >> > +    /// Fails with [`EFAULT`] if the read happens on a bad addre=
ss (some data may have been
> >> >> > +    /// copied).
> >> >> > +    #[doc(alias =3D "strncpy_from_user")]
> >> >> > +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> R=
esult<&'buf CStr> {
> >> >> > +        if buf.is_empty() {
> >> >> > +            return Err(EINVAL);
> >> >> > +        }
> >> >> > +
> >> >> > +        // SAFETY: The types are compatible and `strncpy_from_us=
er` doesn't write uninitialized
> >> >> > +        // bytes to `buf`.
> >> >> > +        let mut dst =3D unsafe { &mut *(buf as *mut [u8] as *mut=
 [MaybeUninit<u8>]) };
> >> >> > +
> >> >> > +        // We never read more than `self.length` bytes.
> >> >> > +        if dst.len() > self.length {
> >> >> > +            dst =3D &mut dst[..self.length];
> >> >> > +        }
> >> >> > +
> >> >> > +        let mut len =3D raw_strncpy_from_user(dst, self.ptr)?;
> >> >> > +        if len < dst.len() {
> >> >> > +            // Add one to include the NUL-terminator.
> >> >> > +            //
> >> >> > +            // This means that we could not fill the entire buff=
er, but we had to stop reading
> >> >> > +            // because we hit the `self.length` limit of this `U=
serSliceReader`. Since we did not
> >> >> > +            // fill the buffer, we treat this case as if we trie=
d to read past the `self.length`
> >> >> > +            // limit and received a page fault, which is consist=
ent with other `UserSliceReader`
> >> >> > +            // methods that also return page faults when you exc=
eed `self.length`.
> >> >> > +            return Err(EFAULT);
> >> >> > +        } else {
> >> >> > +            // This implies that len =3D=3D buf.len().
> >> >> > +            //
> >> >> > +            // This means that we filled the buffer exactly. In =
this case, we add a NUL-terminator
> >> >> > +            // and return it. Unlike the `len < dst.len()` branc=
h, don't modify `len` because it
> >> >> > +            // already represents the length including the NUL-t=
erminator.
> >> >> > +            //
> >> >> > +            // SAFETY: Due to the check at the beginning, the bu=
ffer is not empty.
> >> >> > +            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
> >> >>
> >> >> In this case you're overwriting the last character read. Should we =
give
> >> >> `raw_strncpy_from_user` access to one less byte and then write NUL =
into
> >> >> that?
> >> >
> >> > Why? I'm not interested in changing the implementation just because.
> >> > It needs to be significantly simpler, and I do not think it is.
> >>
> >> Sure, but then I think we should document this behavior.
> >
> > Document what? I understood your suggestion as a change to the
> > implementation of strcpy_into_buf that would not change its behavior.
> > Did I misunderstand?
>
> Maybe I misunderstood the code, but if you do this:
>
>     let slice =3D UserSlice::new(ptr, 1024);
>     let mut buf =3D [0; 42];
>     let s =3D slice.strcpy_into_buf(&mut buf)?;
>
> Then it will read 42 characters from userspace and (if there was no nul
> byte) overwrite the last character with `\0`. If we now do
>
>     let mut buf2 =3D [0; 42];
>     let s2 =3D slice.strcpy_into_buf(&mut buf2)?;
>
> Then that will continue the read at index 42, but effectively one
> character will get skipped.
>
> (Now it's not possible to call `strcpy_into_buf` multiple times, but I
> see no real reason why it isn't a `&mut self` method. Also a user could
> call `clone_reader` and then manually `skip` 42 bytes. Although they
> might only skip 41 bytes, since that's the length of the CStr. But that
> runs into the problem that if there was a `\0` at index 41, then
> repeated uses of the pattern above will yield empty strings.)

I removed the ability to call it multiple times to avoid dealing with
this kind of question. You may submit a follow-up patch to change it
if you have a use-case.

Alice
