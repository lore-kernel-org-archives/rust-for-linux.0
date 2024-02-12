Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA7279FD
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Feb 2024 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707730238; cv=none; b=FqDGxCNU9frD1NY+5rbNqqnth3Ug8N2fOJg43cO10ALmtz6JEFXEpf20JIt0yHFG3DCad3q6cJyhqQ8bzNljyC4WwS9mzyQOyujCs9RDkSuLv+feEeKK6kKHfqrePn5dSG4Ot+jR0GY24EWfIFI4mWO6KIGrENu3K+aHEqLrjZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707730238; c=relaxed/simple;
	bh=fJCVsH6s+Zxu49DLLCaFI4lLD0w0UXKMyNeLa/ZMEC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pIqt+/75FdB7gOT1vu4bsK551jJSdcoyi2+SA3/v/DtsVNQyX+PS+tglE0PZ0gTZEi4u+jp0T2FEUY8eD2z7QKon+xlh9zknsSTLLu6FIUs/RdAqnSIczmfcfEs2hF2ExvVfVFGoCGZDmF9A4d9RQ8/6rYVzUqvuppaDtvidWIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o8Y11mry; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o8Y11mry"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4c0245cba99so505365e0c.0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Feb 2024 01:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707730235; x=1708335035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVJXg04dDq3HdGdQbSODm4X+NrUwFF5O5k1QDLQ/4FQ=;
        b=o8Y11mryL+1tO7qvJhQ7fZJX4WaBM581uvW7l1spOOQ0EuC7IDP2pPEI+8ZkRxVYa+
         Mp2F0UZE6XjEkgwhTJgeBeo+K1fyo3QXd3829M3DDWRas3ydR+zINRpOkwJwWcZRqSKn
         Rvp9pBhZUuk9GlD2ZPH8bg/WtRdluyrlKHnVfaJPmYxeFctNxYA9B8Pitno5xHdZCwJD
         fzWPl4gGMu/hNYbwvIoEWTgDkExs++xsihc3joXAOWL3iYWf5ZATvItUBe2v2anHJWQP
         0EqBdPKjICQgb6wIiFpoQo/6Jf88hS0XINgKnU4ALcICC6loObx1fOSAGq1cANPeoCc7
         PXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707730235; x=1708335035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVJXg04dDq3HdGdQbSODm4X+NrUwFF5O5k1QDLQ/4FQ=;
        b=lh+IZiHVuIpM4+VOt7NCLpZzWoZ508c7uiHejs3FnFF762L2f/xsbt4bfMS5qc+T4L
         KZiS8YqeiQACP6Ly2k2VA+xFURSQy/dCthbiGWlp4GCHA08rotbDivifZUZJE2+njBeb
         mQ6dwWzD8B+GKg9RgOZ4fnK80dglYcphTqaK+2SF1DMFgYSWHVmnxccrEVmhTRRqwYLD
         VTVbSDCrd79rw5aNf4tGgzzuv/WxvRnCszmkF/15RYH2sknddqxqct1x6jtmYHPDpjuL
         jXmYqT/lO/8o2RIAXgd+r5Fs5adyWhhh0OKqETWitAndSpl+xuo4H/uNDN0EpFMdaKGb
         GPUw==
X-Forwarded-Encrypted: i=1; AJvYcCXHl/SJRkM2AVGV1av9RdTg8N8LbcGjrSYauIeNpW3QSSNsclT1zrVntE1H44M+z2PlEkhQa+0ICg8ZT8hWM1i8bXSaHw+t/O0rbkuSiBk=
X-Gm-Message-State: AOJu0YzyG2l+EeyppgTEv2+7yBCMHDoYojxQFGm6FnSguBZe77i3IaZM
	xPElmZtNnmUagms9jaxNz8nC4fGKim8u2cAotuZoNv9xIwYspqkIRK+SgV1UOqzNGDd1Wmv18jK
	9OS+MAfOUyCHlAXLvV4uUVQ6e2tN3WI8UZ0rF
X-Google-Smtp-Source: AGHT+IHjV73mgJjltlbGotOak1PzxKLwy9aSO2nJ7D7f32xXmGKQCv9rUvPaFsRmWhNsUhe7k0oa8HywUsDXuUQEtS8=
X-Received: by 2002:a1f:e403:0:b0:4c0:3552:bd07 with SMTP id
 b3-20020a1fe403000000b004c03552bd07mr2504043vkh.9.1707730235423; Mon, 12 Feb
 2024 01:30:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124-alice-mm-v1-0-d1abcec83c44@google.com>
 <20240124-alice-mm-v1-1-d1abcec83c44@google.com> <CALNs47uDaD05oD8TtZoSqUBc4SaRig80u2_1P0qMCXtE3H9_Vw@mail.gmail.com>
 <CAH5fLggdwWoq4wKv7VxZ-_VbWMV_Ui03rGOCMPbWn8=ewznmvA@mail.gmail.com> <405e8b56cd0c48d0ba640e8d9c60179e@AcuMS.aculab.com>
In-Reply-To: <405e8b56cd0c48d0ba640e8d9c60179e@AcuMS.aculab.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 12 Feb 2024 10:30:24 +0100
Message-ID: <CAH5fLgiRgg2zD3tJ9Xrvk+bvH3srDGw9ud_gjRa97cd7a+jROA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add userspace pointers
To: David Laight <David.Laight@aculab.com>
Cc: Trevor Gross <tmgross@umich.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Kees Cook <keescook@chromium.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 3:15=E2=80=AFPM David Laight <David.Laight@aculab.c=
om> wrote:
>
> ...
> > > Maybe something like
> > >
> > >     Every time a memory location is read, the reader's position is ad=
vanced by
> > >     the read length and the next read will start from there. This hel=
ps prevent
> > >     accidentally reading the same location twice and causing a TOCTOU=
 bug.
>
> WTF TOCTOU? I'm guessing it is reading things twice and getting
> different answers.

Yes. In v2 of this patchset [1], I expanded TOCTOU to "time-of-check
to time-of-use" at the first use to reduce this confusion.

> That really doesn't match how copying from userspace is used is many plac=
es.
> Sometimes you really do want to be using offsets and lengths.
> For instance the user buffer might contain offsets of items further
> down the buffer.

For this use-case, you can call UserSlice::new multiple times, or use
clone_reader. This use-case does appear sometimes in Rust Binder and
is supported, but I didn't find it to be the most common use-case.

> There is also the code (eg ioctl) that does a read-modify-write
> on a buffer.

The read-modify-write use-case is quite common in Rust Binder and is
supported by the API provided by this patchset. When you call
reader_writer, you get a separate reader and writer. Then, you first
use the reader to read the data. Then you modify it. Then you use the
writer to write it back.

> > > +    /// Reads the entirety of the user slice.
> > > +    ///
> > > +    /// Returns `EFAULT` if the address does not currently point to
> > > +    /// mapped, readable memory.
> > > +    pub fn read_all(self) -> Result<Vec<u8>> {
> > > +        self.reader().read_all()
> > > +    }
> >
> > If I understand it correctly, the function will return `EFAULT` if _any=
_
> > address in the interval `[self.0, self.0 + self.1)` does not point to
> > mapped, readable memory. Maybe the docs could be more explicit.
>
> That isn't (and can't be) how it works.
> access_ok() checks that the buffer isn't in kernel space.
> The copy is then done until it actually faults on an invalid address.
> In that case the destination buffer has been updated to the point
> of failure.
>
> You can't do a check before the copy because another thread can
> change the mapping (it would also be horribly expensive).

This was reworded in v2 [1]:

/// Fails with `EFAULT` if the read encounters a page fault.

But ultimately, the real condition here is just that it returns EFAULT
if copy_from_user fails. I'm happy to reword further.

Alice

[1]: https://lore.kernel.org/all/20240208-alice-mm-v2-1-d821250204a6@google=
.com/
