Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813B1FF7B3
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984834; cv=none; b=AzsBMP37oJWTLkhQtkYgvGTfwqbVKX7mwZY1OZ3luRjFwwdcmETbyS7hil6OME1CVT9/IY+RHGwQGHdeDE0kB/hc9+GqvfIi44faZxjp7vdPz8L1LUWGslze2z5O3zT2MyY1v1W8z/TOPoTXZ2LoZ0Y0trWtSYItc09/Z1SE4oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984834; c=relaxed/simple;
	bh=FZ+4+WsZjWDq8qcbDgAcyJWukMOtWM7ayTLSqNQ9x5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6gcIEl9yq3+LrJyvIX6UZOwksl6EArpx6JWwhlQJcE99aMt6oCsp0CkJAjLsXcxVxtZtPuKAW5Qt349rejVCIPxbJxChWsmGwTWIBkKU88pUNvSkz2pmZVBIknVNKieIWtuMK5Bpc+SXJ8xVuGP+sG5P0BQycF0pevhZpTgDKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jof0j3Xz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jof0j3Xz"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso3938915f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 05:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737984831; x=1738589631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+Hvfjk2X74NoTEoMJryXh4xz+L7vAQcKRm0ylMuZ/I=;
        b=Jof0j3XzpRLgiD47wtq9+K3HQZHAy8SBjG21wFFbImaUTKW5u85dD1a2/iolPBT0uw
         S4GAacZQrupNeB+ovUWav0yV9xWb4gziWQv9LztSLCg+CvZESqDXbFLR/41xA5s37Aq4
         e3i96RzrJ7xjqVMdsRSZRtMv9GUwAahw1h0pCFfXH0xu4ZTE15H4ztJC7iAKRbmNbmyN
         VyNOGx91mASFDGk6q68UNj3/rFG1pf9xzf5A0UuhMH6Jr4crGY2+sSTO8APpRQ6LhjRQ
         0JDaMDnPcWQYxKYIhl326iLBmtm5SQFAP7yWmryM/OgELPDC3AvV96paB2JHTk23B7Tb
         BAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984831; x=1738589631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+Hvfjk2X74NoTEoMJryXh4xz+L7vAQcKRm0ylMuZ/I=;
        b=mxAI4AgW5MOC064SHRlX/o9flGI50PRoY6iFsKiHPilwrF02IULc1MJ+t0GNQ0mcAq
         KY7vusBRy211ovzSjImo3p+qNNp+Jm9lm/8hxuvk21maOJEHTow3Vgfm6f8zaMbJv45G
         zxWVsh1gniCI/wNurZPTM+mwDSJlDcBZBcxk7NCVRzUic+eFuaEmQPN2l1G5rVRMFjd0
         oe3knXjHdlFmbrOmWS50JCNaBjTknLRGhdr7c/XAnJjUnRIzzPcY0mCi7W56/UnObvZA
         wQ5o2RTGz++lQunu9Cfu3nfv11RBEWf4XFckglEHd9h+aCvLIMPu++HbYYnFuDPn89rR
         aHRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpqRoV+PhGhjJpE3k5i3pJAzPYq/QvIuRdCzGfMG+yhN6Y+uFDpItdQIj+tQY8EFyr1WR40sCsDf0UhVYRBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOHpSQdTZeK+bY8ufIzvJhTI1HRzfDQ8iFvnW63E8EUhC0+siE
	b2r/DHy4KUk206Me6gNpKW02vCky4E3KrihSHnOy+h5GiaqNoIyFtEbA9dEz04aYZDZ+SAtrv8c
	cLwBsy6hV5CN4iL5tD/KIvpcbn0H2Q4EIwPc2
X-Gm-Gg: ASbGncva+xc8Lt8LNS/0lshIJyrya4p5609Kdf9ad5NNar5hxEgnCX6LnzSBdgxJuwp
	54ozuVk4C7leATwc/5E7HxQHqVagm3MVijy5dwFGrba1QaLlBmZiEPLhqoPm0aZT1wfpiYjcwD2
	0x5Cmt7MRhzeIIRC69
X-Google-Smtp-Source: AGHT+IHSeUkIgdFCXHm7TNi3twPslfC+/DcRd/1qfd0vNHjAOrRIrk9bbCb13uWvKqM9nOpiH0ifyxC3NkBHL+iAebA=
X-Received: by 2002:a05:6000:1a8c:b0:38b:ec2d:c0cf with SMTP id
 ffacd0b85a97d-38bf57a7aafmr41280642f8f.44.1737984830003; Mon, 27 Jan 2025
 05:33:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
 <8953765e-d978-4a91-bc81-9ab154ac2255@gmail.com> <CAH5fLgi-CJCveLmc6hFdAYOhpRULovDh_Cix4FyV=kBeg9oiFA@mail.gmail.com>
 <912d9ba8-4cd1-434c-ba32-5c74ef4c12be@gmail.com>
In-Reply-To: <912d9ba8-4cd1-434c-ba32-5c74ef4c12be@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Jan 2025 14:33:38 +0100
X-Gm-Features: AWEUYZnIFfAezI3KYvXNbbjZg78KpdjI9GjFmS2YURrnLpatV1ah1N5GD0AJ5Ng
Message-ID: <CAH5fLghaE6fC0riAch7Wj94ZqNx86mi4ytBhCzcR7KCcw6ZqVQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: miscdevice: Add additional data to MiscDeviceRegistration
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 2:27=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Hi Alice
>
> On 27.01.25 11:27 AM, Alice Ryhl wrote:
> ><snip>
> >>
> >> to make sure that `misc_register` is called after data is initialized =
and to that
> >> `data` will be dropped correctly in case `misc_register` fails.
> >>
> >> But I'm not very familiar with `(try_)pin_init!` so this might be unne=
cessary?
> >
> > Using pin_chain is definitely incorrect because it will run the
> > destructor of MiscDeviceRegistration if the misc_register call fails,
> > but calling misc_deregister is incorrect in that case.
> >
> > You should be able to just move the `data <-
> > UnsafePinned::try_pin_init(data)` line to the top so that the field is
> > initialized first.
> >
>
> So if I understand correctly, the following should be correct:
>
> pub fn register(
>     opts: MiscDeviceOptions,
>     data: impl PinInit<T::RegistrationData, Error>,
> ) -> impl PinInit<Self, Error> {
>     try_pin_init!(Self {
>         data <- UnsafePinned::try_pin_init(data),
>         inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevi=
ce| {
>             // SAFETY: The initializer can write to the provided `slot`.
>             unsafe { slot.write(opts.into_raw::<T>()) };
>             // SAFETY: We just wrote the misc device options to the slot.=
 The miscdevice will
>             // get unregistered before `slot` is deallocated because the =
memory is pinned and
>             // the destructor of this type deallocates the memory.
>             // `data` is Initialized before `misc_register` so no race wi=
th `fops->open()`
>             // is possible.
>             // INVARIANT: If this returns `Ok(())`, then the `slot` will =
contain a registered
>             // misc device.
>             to_result(unsafe { bindings::misc_register(slot) })
>         }),
>         _t: PhantomData,
>     })
> }
>
> Sorry I don't know the details of `(try_)pin_init` and the docs only say:
> > The fields are initialized in the order that they appear in the initial=
izer. So it is possible
> > to read already initialized fields using raw pointers.
> >
> > IMPORTANT: You are not allowed to create references to fields of the st=
ruct inside of the
> > initializer.
>
> This says its invalid to create references, but as soon as `misc_register=
` its theoretically
> possible that a `open()` call happens and creates a reference to the Regi=
stration. I assume
> that is fine, because the Registration would be fully initialized at that=
 point, but that's
> technically against the Docs.

Creating a reference immediately after misc_register finishes should
be fine. I think that warning is more strict than necessary.

> Also does `try_pin_init!()` automatically drop `data` when `bindings::mis=
c_register` fails?

Yep. On failure, previous fields are cleaned up.

> I couldn't find anything in the Docs about when and what is dropped.
>
> Is there a equivalent to `cargo expand` for the kernel?
> It would be nice to be able to look at the code generated by the macros.

You can expand Rust macros by invoking make on the file with an .i
extension, in exactly the same way as you expand C macros.

Alice
