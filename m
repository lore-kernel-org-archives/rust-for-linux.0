Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E7219E981
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Sep 2024 14:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725286626; cv=none; b=nRT4+GibuPGAQyOhoQKx4B5KGCNYPNrFiP9xcTyGMk6eUbSFEwJHoFcs4a95eQnbwsG5eqhzcYg26P2Mgmc4Tc690mk06kSoicVzZj9AAK2r0/n5kCG3zH2VjNPaQBr0Ehj007nDdGgRb0IrGzJtzpAA0bgd933MQZAe0ytAcE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725286626; c=relaxed/simple;
	bh=vh2QgxSX2L75UOqalaQcbV73L5PLbsUphxMNDQ2BtJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVkmg2wxXkw0qbr3lgu7FjIE1Buz8usUkV2JC9STeu5PkJgP8aq7S9u6J170PUzS/8iYC85hh9ZdBef2J5mCyJlYTmkEHSS5HRgPOJV0wLGWk44OeTHpnOpDuFDrC7x6tYMd6N+Qzwcj4smIAOGaGyAIAPOEqTR4UcSYNYsi9Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=miNkKwNd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="miNkKwNd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42bac9469e8so35843185e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Sep 2024 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725286622; x=1725891422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nZ+9fn7BwVDUG445G81+75wyZkpZMEfiuxhieME3PM=;
        b=miNkKwNdeWS4tpogmKrBjbky7evnbuusOAVqBFv5H0ON4npDnYvHnvTLNxlePMq+bl
         zQ3XwfiJ4QNcoVYKR+FtuicLJM8qCRdEtViJHzTFo17JvfXQ5VcfLQnCF8yh9LVZv4xm
         EvY7UkSTaMbTUmC2k1Ynlas9dWiYgWt0HnFuX2KfdSTvFbxJwA/X4j6Zhmr5NCQvj8zH
         eo8AAQIFys7OF0m1rYkVBMW71E+RZqOq1ZooFgdotdjtCch4wWlmWkZreRAVYOQeViSx
         FD206ABBeYdg7TMllW41z7ocWEIBR+CyNYJb2esN+tspWJikjNYdksJc01pEuBWZ9nzI
         4Qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725286622; x=1725891422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nZ+9fn7BwVDUG445G81+75wyZkpZMEfiuxhieME3PM=;
        b=kO/IYyJG10Tq6EmPyJX4kdT8ph69a94nonnbavylbmjo5dLin8zBwuIlyq+jiFRtKc
         vwIA1qjYeD6PXFMwZk6I3p3yp+SwuZQ8F4j7VQBj1tc4cx/jZdgJuXVM0UvrQooYiYKX
         12PkVDD9J5yGE5ARjJUs2j+zMZ/xnArMNQZfYHOGqIQ0LeMAguhMZS+yaQlqWU12hk13
         idjsY8/X1pQiM7EDnlslcaMvX4b0WnYzt2bg+LrF+ZT0r+fLobioN+SznNyr+W8uotL7
         gJTfCmV5DAxIuMrXuomOD3Dc2XpBXn7oYdLzrX43txuKY7r3ZmN19BT/pq6S8rs55VOv
         ZRPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNiPmT81XQe7PfWSgtWLjixyKGLby414EOqbMDZv266Dj97TAewtzjgrP9h9j/TYPRAyWlj9q1Lz56ITGzlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt0xzmP1a/B2H6OoiSSW+sGCnc5ToBc/LDZlz0ZJlL1LGoOJsU
	ZRnF6qWgihifX/kzNB+ybuAbG77h1mRuL6MFMXe3fC6dnK4QQkmuJe+avJAp07uE91BkszGMC4T
	Ki9o0POpQKXxl7YPColE4Bi3/7n3K17wr4g0w
X-Google-Smtp-Source: AGHT+IGTiHL3dLiYbM7/qkPUXctMrWRqR8rS7ipP+OnuURlbIUWlRU6s9EcTEKznODPu2Frc6lmN7cFFpOek3NTUuYc=
X-Received: by 2002:a05:600c:46c6:b0:426:4978:65f0 with SMTP id
 5b1f17b1804b1-42c82f56727mr29036395e9.18.1725286622239; Mon, 02 Sep 2024
 07:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808-alice-file-v9-0-2cb7b934e0e1@google.com> <20240902-dickdarm-zumeist-3858e57fb425@brauner>
In-Reply-To: <20240902-dickdarm-zumeist-3858e57fb425@brauner>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 2 Sep 2024 16:16:49 +0200
Message-ID: <CAH5fLgjho1p7EHkqpot4pXvrKLFkXLsw9MWcriNCOHXZ0NJ5bw@mail.gmail.com>
Subject: Re: [PATCH v9 0/8] File abstractions needed by Rust Binder
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 10:02=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Thu, Aug 08, 2024 at 04:15:43PM GMT, Alice Ryhl wrote:
> > This patchset contains the file abstractions needed by the Rust
> > implementation of the Binder driver.
> >
> > Please see the Rust Binder RFC for usage examples:
> > https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-0-08ba91=
97f637@google.com/
> >
> > Users of "rust: types: add `NotThreadSafe`":
> >       [PATCH 5/9] rust: file: add `FileDescriptorReservation`
> >
> > Users of "rust: task: add `Task::current_raw`":
> >       [PATCH 7/9] rust: file: add `Kuid` wrapper
> >       [PATCH 8/9] rust: file: add `DeferredFdCloser`
> >
> > Users of "rust: file: add Rust abstraction for `struct file`":
> >       [PATCH RFC 02/20] rust_binder: add binderfs support to Rust binde=
r
> >       [PATCH RFC 03/20] rust_binder: add threading support
> >
> > Users of "rust: cred: add Rust abstraction for `struct cred`":
> >       [PATCH RFC 05/20] rust_binder: add nodes and context managers
> >       [PATCH RFC 06/20] rust_binder: add oneway transactions
> >       [PATCH RFC 11/20] rust_binder: send nodes in transaction
> >       [PATCH RFC 13/20] rust_binder: add BINDER_TYPE_FD support
> >
> > Users of "rust: security: add abstraction for secctx":
> >       [PATCH RFC 06/20] rust_binder: add oneway transactions
> >
> > Users of "rust: file: add `FileDescriptorReservation`":
> >       [PATCH RFC 13/20] rust_binder: add BINDER_TYPE_FD support
> >       [PATCH RFC 14/20] rust_binder: add BINDER_TYPE_FDA support
> >
> > Users of "rust: file: add `Kuid` wrapper":
> >       [PATCH RFC 05/20] rust_binder: add nodes and context managers
> >       [PATCH RFC 06/20] rust_binder: add oneway transactions
> >
> > Users of "rust: file: add abstraction for `poll_table`":
> >       [PATCH RFC 07/20] rust_binder: add epoll support
> >
> > This patchset has some uses of read_volatile in place of READ_ONCE.
> > Please see the following rfc for context on this:
> > https://lore.kernel.org/all/20231025195339.1431894-1-boqun.feng@gmail.c=
om/
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
>
> So, this won't make v6.12 anymore. There already were pretty big changes
> around files for the coming cycle so I did not also want to throw this
> into the mix as well. (Sorry that this had to miss it's birthday, Alice.)

This has also gained a conflict with the helpers split [1] in
rust-next, so maybe that is for the best.

I will look into whether any other changes are needed given what is
going in for 6.12 and send a new version. It looks like you already
added it to an vfs.rust.file branch, and it doesn't look like anything
in vfs.file required changes in this series.

[1]: https://lore.kernel.org/r/20240815103016.2771842-1-nmi@metaspace.dk

> However, I do intend to merge a version for this for v6.13. There's some
> wrapping of struct cred and specifically of struct secctx that I can
> only handwave at. Ideally you get a nod from the LSM maintainers as well
> but if that doesn't come in I don't see much point in making this sit in
> limbo indefinitely.

Okay thanks! I can look into that.

Alice
