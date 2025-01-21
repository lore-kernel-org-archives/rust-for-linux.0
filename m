Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D402513D297
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 07:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737446160; cv=none; b=HpwsjKefSzBlydUoYmidGZIFjMhVlaAXBhSBkaABMXZer4fb3s4soFkd/ilX9HuAYej2i1llWpUGR7LzGry0a4ZmnRWlZMebbDnozgK2slBDpsROdocJrErnA+sJ7zipnkxGMDDV1yuR0Ycuh5NpGy64RH0oORqnpAOmmWI049M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737446160; c=relaxed/simple;
	bh=YXMw6XntrwfANhB8bR2U3FGcSkC6cMVeehDAN56HB7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ps7YwlOOrW1slJIvC2c+KGB0h8R6OuUJCici/yphA6xPIGL5ovglOL2wVR0dcEUhYDLsfhXH9owwfFM09jhNxRZ+d3vPTZpfmISgQyuqQODbC6RFFnwUD6oLIWWdD4mz44XWOC8QnUBJgsQ1R4CXioo5r0xUoE3ByeeF18gVeLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EeywZs7N; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EeywZs7N"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385e06af753so2607844f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Jan 2025 23:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737446157; x=1738050957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FvwGp7ybmLF71H/oqD3WMnGCzdSWresHxQW1rrL5nQ=;
        b=EeywZs7NryOlsesUDLyEITvmQAFcp4NmPtu5f22ip6V7hLl8OF1Zqt6RMerxGfCMBN
         z+jeJskuQUsdk0eVjdrJYMqc3gfUa5XvOanF0eRvrSGHwc5amSKN8zIGZMEhvLmtEzfD
         KBXqQkDSUDzJnXAVisCNPmP4SDPuzzfhVqESKjfk4ww5pEfQybFbxzwUg3AHnpAT9i2G
         eD33Fnx60Fa7a+9c/4w2MKy17vLyd2gJD4KZ/O8drBXAy89iJJ3T4jll2HGm4sv2mWSl
         tc+ulB3SsLc4tEzVCYdX/eTKaV2djtU6BZPorXkEMxn/FOAiV09eOH2Ca8DUEj8RCOR6
         ygoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737446157; x=1738050957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FvwGp7ybmLF71H/oqD3WMnGCzdSWresHxQW1rrL5nQ=;
        b=arxp7t9vBjphRs8LlzcaUdhHDK4ktGKo6/eJogoYuIHVbkwOuhoVDWq6VyJcXLUPSm
         fRrEnTI4geEfcBLi0ffRlpbSh2dCH1ytHUfqRCs4TMi3C7Qps3jdwCsLrqBPg4fVeTyR
         aWibum+DDa1Bj9HJiN/GkSYiKygi8or7KlUq8whmLWQ4iFffj2DA/Rt7L9kvRN+CFSxc
         /Tp9tnKVTnONyZ2xdJmE7nxbn1B6Q6av6WN5FtW2+6UzL6xlgZXokkATkuarOxzlr7mG
         pERdf2XeyRshAdN3PIaGwNBAJW1oKqvFPHtmRrwU3cwfC/XrU/9deZ1ZpNVykLU2lLS2
         T4kA==
X-Forwarded-Encrypted: i=1; AJvYcCWtJBm+J34BGoXIDnzHY8ndfxECSgtorZBVXLwkxmUmIdIuS/AA03Vv0B6072eKC0mhD4ApN4sMJdSpBbKjDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPRIDXbG7PLuzXvlT4NMLtooD4YVZ/tuLMq/tC/n0xuWMSchtm
	qdW56YEJ86L+/dvPNWm1ygFKaJ1dzAouD7pbQqWCpcgs+DZeRf5B6UiB/YmZ7m7iZlu7qGr4Dsn
	MLc84vxOFBIlHA/g4lSUvSXQuel9oNCUTQR8a
X-Gm-Gg: ASbGncvUj7lEz4k/FVH8E3dY3+qCQRhAxVTAlm3xZzLXzRfy4XEwJhD3sh1orN3idHR
	rerKFA0Fg1Qf0F5usIbWyd8Ctfq6QudhzbVzzZ5Yx6WFm8kcW9BEzXwMAq9/yOyEeF0oi8GtQPo
	h9pPrx2w==
X-Google-Smtp-Source: AGHT+IHyZdmlnYAn2o9avn8aa/RCUoNXMKFliPy32r8ijzXbn1KpWTBt8HbteeI0I0wBrW0/l0di8qCXUE6h+aQ9HGc=
X-Received: by 2002:a05:6000:156c:b0:386:1cd3:8a05 with SMTP id
 ffacd0b85a97d-38bf57ce963mr14788700f8f.54.1737446157104; Mon, 20 Jan 2025
 23:55:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <RDzzJkrT7QOUu_FAcJyNOJx3ZW9gzDG7vi-z94_5G6YiTgp8yKUu_U4QYVyTXrzTi9eK4BIiANZ4LboxAchm-w==@protonmail.internalid>
 <20241025-cursor-between-v1-1-08913714aae5@google.com> <87h65tem30.fsf@kernel.org>
 <5HvNJ52WD0CL3uj4M1EHoKipDiKw0B-3tbEAGI_KFSmgvt5hyLWPPDTKHoKWYGk4y_BYjEyppWUpJW6AfSyVPA==@protonmail.internalid>
 <CAH5fLginoFU38HbRjtOY8wAOo9uu5LJD7AKzduRkL0RcT6BUvw@mail.gmail.com> <877c6pchqi.fsf@kernel.org>
In-Reply-To: <877c6pchqi.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 21 Jan 2025 08:55:44 +0100
X-Gm-Features: AbW1kva8JbeOmdZjhFMWBcfvy7gfJ1SQujPo-BNWmKVIsLKalcC2wvp2Ie2d4Ow
Message-ID: <CAH5fLgjmM8fMH6ibfGAeqRMf3LMm3uoq+x3jtk73MoUChYB9wg@mail.gmail.com>
Subject: Re: [PATCH] rust: list: make the cursor point between elements
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 10:12=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Mon, Jan 20, 2025 at 12:55=E2=80=AFPM Andreas Hindborg <a.hindborg@k=
ernel.org> wrote:
> >>
> >> Hi Alice,
> >>
> >> This looks like a nice improvement!
> >
> > Thanks!
> >
> >> This looks like a refactor of `push_front`, `push_back`. It looks like
> >> it is unrelated to the cursor change. Can you split this out into a
> >> separate patch?
> >
> > I don't think it's unrelated. It extracts out common code that
> > previously only push_front/push_back have, but that the cursor now
> > also needs. Of course, it could still make sense to extract
> > insert_inner out in a separate patch.
>
> I think that would make sense.
>
> >
> >> > @@ -489,17 +480,21 @@ pub fn push_all_back(&mut self, other: &mut Li=
st<T, ID>) {
> >> >          other.first =3D ptr::null_mut();
> >> >      }
> >> >
> >> > -    /// Returns a cursor to the first element of the list.
> >> > -    ///
> >> > -    /// If the list is empty, this returns `None`.
> >> > -    pub fn cursor_front(&mut self) -> Option<Cursor<'_, T, ID>> {
> >> > -        if self.first.is_null() {
> >> > -            None
> >> > -        } else {
> >> > -            Some(Cursor {
> >> > -                current: self.first,
> >> > -                list: self,
> >> > -            })
> >> > -        }
> >> > -    }
> >> > +    /// Returns a cursor that points before the first element of th=
e list.
> >> > +    pub fn cursor_front(&mut self) -> Cursor<'_, T, ID> {
> >> > +        // INVARIANT: `self.first` is in this list.
> >> > +        Cursor {
> >> > +            next: self.first,
> >> > +            list: self,
> >> > +        }
> >> > +    }
> >> > +
> >> > +    /// Returns a cursor that points after the last element in the =
list.
> >> > +    pub fn cursor_back(&mut self) -> Cursor<'_, T, ID> {
> >> > +        // INVARIANT: `next` is allowed to be null.
> >> > +        Cursor {
> >> > +            next: core::ptr::null_mut(),
> >>
> >> I am slightly confused about why you need to track the beginning and e=
nd
> >> of the list. The cursor movement operations circle have wrapping
> >> semantics and the lists are circular. Could you remove some code by
> >> using this property?
> >
> > I think the current API is much more intuitive. Yes, the list is
> > implemented in a circular manner, but you're not intended to think of
> > it that way. The linked list is a list of elements. With elements ABC
> > and cursors pointing between them, it makes sense that the cursor can
> > be |ABC, A|BC, AB|C, ABC|. In each case, you can add an element before
> > or after the cursor. To iterate the list, you keep calling `move_next`
> > until `next` returns `None`. That also makes sense. If the cursor
> > becomes circular, then you iterate by calling `next` until the next
> > element is the first element? Seems confusing to me.
>
> You might be right. But then again, in your patch the cursor _does_ wrap =
to the front
> when it is at the end. If we did not treat beginning and end as two
> separate states, we could remove a lot of edge case checks, see below.
>
> In your experience using the API, did you use the feature that
> `move_next` will wrap to the front? If the cursor is circular, maybe
> `move_next` and `move_prev` should should be no-ops when the cursor is
> in edge positions?

That's fair. I will update move_next/move_prev to be no-ops at the edge.

> With a circular cursor, you would need to compare to first or last as to
> break an iteration loop. I think that is how the C API works.
>
> With a circular cursor it would be something like this
>
> let mut c =3D list.cursor_front();
> let last =3D c.peek_prev();
> loop {
>   let el =3D c.peek_next();
>   // Do stuff
>   if el =3D=3D last {
>     break;
>   }
> }
>
> For a non-circular cursor
>
> let mut c =3D list.cursor_front();
> loop {
>   let el =3D c.peek_next();
>   if el.is_none() {
>     break
>   }
>   // Do stuff
>   c.move_next();
> }
>
> Not too much difference?

It can be nicer than either of those if you use a while let loop. See
the examples in my next version.

I don't want to make the API circular because I think it's a worse
user-experience.

Alice
