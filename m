Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D681B4F02
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jan 2025 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737388386; cv=none; b=SwKENDRsShzwyJzpY+PM6RAEA9lB2mzZkh69H3Zqq7UwwNWu7995Vfe3SJbmAXDI3QFxNRV0/5cefZKgYW1X+Ep19JP30k+y05kBNYVCTvIsVxEnobesSLRKoLDDqLIl2SoR73TY2f8Y1b4/8Xu+wIKLTJK1+nq+KAlrZjHlzRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737388386; c=relaxed/simple;
	bh=YZLRxl6myrC7WISQqY2jZeRMEB16CnRP1zVhTe+t5Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8KvDkXNh05MRgQe70WKdrmybunVEl4mQenzC1URSoWUajWF7clKZBWa/22+zQzkPSrT6puZei6jfnDTIwEWA4F+i8uDhTTaHYo4C3SLeSzAsR5i88rxCBZBWp+N9M3EOlbbpj/teABEmEVDtsL6H+zvnYozKyvRTAezbKXRZQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wQoVoXT4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wQoVoXT4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38632b8ae71so3725706f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Jan 2025 07:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737388383; x=1737993183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9In2eqKYI/uki5bp1j8PuNsRkX//inAbzw84feDwzE=;
        b=wQoVoXT4tJ1Si0qWusBmMY3W1W2NQLFMywIIk2woDNsGVJwboiINs8Gmio2xOStQHf
         YDoSytdFCA+61O8MpCapWlhtcBr8SE/vezGsyU9g0/mdbg0f0A1l/MBmXTWAySl3uwQc
         MVjGB+EIiraiIuwP+7/EwM8NC9MSRz//KoSBfsyKVl3UdfkdI9lBwmYMLSdk46sReVoI
         xBxtKTo7AoUhSKlK7GZVTYOWgNT2DhP0UIm0/m5Nv6GvxHba1RRcwo169jgqAlRk1c2q
         6Ttdvc6qXpjrCZuFH+jKDRjPeCqKxaEO5utpiipn6dOBBojKCxDhK/xbSq7MbFHHRcfz
         0CHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388383; x=1737993183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9In2eqKYI/uki5bp1j8PuNsRkX//inAbzw84feDwzE=;
        b=Yl9N91XDdfhmUBUCAbyOXY8JDOJ/5A5roGCtV11bW1EU128TE1vFtbC3ySxkq5N2gB
         JJ54KpjDZH7+vb9aWfcuvd1aJ2qGRXXA11nJaALPg58jbKCKYuC4LThuyYc7czdYQg2V
         wLz+A9FhvQ+MHHSOgz9ywHGVkZ+PlS1heOz73eo0yAKrJVJjY1EGLWLB5+C0fzYj0FIY
         jaUpLFnVl3g+wAMRfXOGbE3qaKTXJOCktZWYtsnnTVUuMTn+yrfWra8KAnl8N5zHwCma
         8LORBJmtcAQYXMNhNo2QDLTpwknPrDXwR8aVW+j3YwhIPyBTJdoKNJFMDxH7kOKlD2PP
         DYUw==
X-Forwarded-Encrypted: i=1; AJvYcCWrrJlQbLSmrSUKbKuXNXcJea7+yhqvI72dbDlJ+OzS+Gq6R6NjjTE8Kx0WtJk/rt2DipMsIda8iWTdsJmsvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoKZBNJguerAMiCXit9LqC+mqcmZkOwlJgH0gwacQSfNz2GsvN
	am8hd/y6ux7BpLOIk0/RtpxZhc6EmKphvR/f044xOlghq9xtIb5ZtJghDkK+1kkoLEIrXQr476q
	TafFHedZW2y8ox6sh9g8x910wZrSUohZbOb1A
X-Gm-Gg: ASbGncvuovQc04MrAY1gO2i4cZnoAAQlml9XZss237xnK4f6Skd4btSMI4vhMy5ezrm
	gheFkJSoyfF6taU1uPEDjrhxWjvZ04+EYr9b2RCn9+uj1la72W+ADgv8Bb+kOcPuMgHYpMRxO07
	XvDdhwfA==
X-Google-Smtp-Source: AGHT+IFCCa9T/woBaJaeBhS3H84lOfOgx0hCbuVxrpx7W65G7e2utJBcO4xKv916rwCiZqAIhp6vITV2UMSCbBpn2h0=
X-Received: by 2002:a05:6000:1567:b0:385:fd07:8616 with SMTP id
 ffacd0b85a97d-38bf55c4d1emr12566206f8f.0.1737388382716; Mon, 20 Jan 2025
 07:53:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <RDzzJkrT7QOUu_FAcJyNOJx3ZW9gzDG7vi-z94_5G6YiTgp8yKUu_U4QYVyTXrzTi9eK4BIiANZ4LboxAchm-w==@protonmail.internalid>
 <20241025-cursor-between-v1-1-08913714aae5@google.com> <87h65tem30.fsf@kernel.org>
In-Reply-To: <87h65tem30.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 20 Jan 2025 16:52:50 +0100
X-Gm-Features: AbW1kvZz3gvLSkHkhPbsyH-Ndc2XODCmWz_Zc6n56dJ8siK2K8taDLe3nUHKs-M
Message-ID: <CAH5fLginoFU38HbRjtOY8wAOo9uu5LJD7AKzduRkL0RcT6BUvw@mail.gmail.com>
Subject: Re: [PATCH] rust: list: make the cursor point between elements
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 12:55=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Hi Alice,
>
> This looks like a nice improvement!

Thanks!

> This looks like a refactor of `push_front`, `push_back`. It looks like
> it is unrelated to the cursor change. Can you split this out into a
> separate patch?

I don't think it's unrelated. It extracts out common code that
previously only push_front/push_back have, but that the cursor now
also needs. Of course, it could still make sense to extract
insert_inner out in a separate patch.

> > @@ -489,17 +480,21 @@ pub fn push_all_back(&mut self, other: &mut List<=
T, ID>) {
> >          other.first =3D ptr::null_mut();
> >      }
> >
> > -    /// Returns a cursor to the first element of the list.
> > -    ///
> > -    /// If the list is empty, this returns `None`.
> > -    pub fn cursor_front(&mut self) -> Option<Cursor<'_, T, ID>> {
> > -        if self.first.is_null() {
> > -            None
> > -        } else {
> > -            Some(Cursor {
> > -                current: self.first,
> > -                list: self,
> > -            })
> > -        }
> > -    }
> > +    /// Returns a cursor that points before the first element of the l=
ist.
> > +    pub fn cursor_front(&mut self) -> Cursor<'_, T, ID> {
> > +        // INVARIANT: `self.first` is in this list.
> > +        Cursor {
> > +            next: self.first,
> > +            list: self,
> > +        }
> > +    }
> > +
> > +    /// Returns a cursor that points after the last element in the lis=
t.
> > +    pub fn cursor_back(&mut self) -> Cursor<'_, T, ID> {
> > +        // INVARIANT: `next` is allowed to be null.
> > +        Cursor {
> > +            next: core::ptr::null_mut(),
>
> I am slightly confused about why you need to track the beginning and end
> of the list. The cursor movement operations circle have wrapping
> semantics and the lists are circular. Could you remove some code by
> using this property?

I think the current API is much more intuitive. Yes, the list is
implemented in a circular manner, but you're not intended to think of
it that way. The linked list is a list of elements. With elements ABC
and cursors pointing between them, it makes sense that the cursor can
be |ABC, A|BC, AB|C, ABC|. In each case, you can add an element before
or after the cursor. To iterate the list, you keep calling `move_next`
until `next` returns `None`. That also makes sense. If the cursor
becomes circular, then you iterate by calling `next` until the next
element is the first element? Seems confusing to me.

I also don't think it's much less code. You still need to handle null
pointers because the list might be empty.

> > +            list: self,
> > +        }
> > +    }
> >
> > @@ -579,69 +574,211 @@ fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
> >
> >  /// A cursor into a [`List`].
> >  ///
> > +/// A cursor always rests between two elements in the list. This means=
 that a cursor has a previous
> > +/// and next element, but no current element. It also means that it's =
possible to have a cursor
> > +/// into an empty list.
> > +///
> >  /// # Invariants
> >  ///
> > -/// The `current` pointer points a value in `list`.
> > +/// The `next` pointer is null or points a value in `list`.
>
> Could you add an example of how to use this struct?
>
> Unrelated, but since you are at it, could you update the safety comment
> on first line in the `List::remove` function?

Okay, will look at this.

Alice
