Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C033112AB
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 19:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770753245; cv=none; b=kofnsor5xh4ATU95KABS4ZI+MZBPd9CGIttOVOLPIeXBToH3E+DV++BoxK4y0chOJb5+NIOJUvmb0iwuNRBMvaEZjml7r5ASfm+A7Zx/k8CiUM3vX0oAI7GnmT6Gb2gAPyPs935kraHs8xebgcRSzHEjepYNldFgQoxOl1i87Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770753245; c=relaxed/simple;
	bh=rfXEyqIrDHyrzS+eIZXLL/nqGWHyUSEscNUumSMxSv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Oid0ga8KgxKvHMV/PhqOaLmqqRqxUk6HItvtXOdbe+xxZFSb8dsFD4Y7yr3wCUpBnEl48i085AA3vWW5bACnMBSsuswBntaUrLpcaMehDWvmpwwqnQE0izfkMbTc1Cw9bNYG6jrFVYiaXiqHiIpORE4Xd5D/pwPQkIFHs/CHxdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1UTD7KT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1UTD7KT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7B4C2BCB5
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 19:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770753245;
	bh=rfXEyqIrDHyrzS+eIZXLL/nqGWHyUSEscNUumSMxSv4=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=d1UTD7KTB4CkcLdRb64+SSf9kxATKD+moA8hAtETPuRNM+LRDypx53hMVjz6XuCL6
	 vDb1gGq8bJLvZzKt1LQQjVe8qQOBhq0yqwSUkEqLWR7TdIBtfngaUrUHLy3myRfWqD
	 rN5WwL3a121uvf9I7UOFHVUi03ni6Pky/oa1EDBjCMjpyxQFXpxRaEgqs37vCtqKeR
	 QshC40FRR5CudQrq+bhdH8uxMYXoC85mVcrCz3dFnwj9uCPVlCq0+QdQuCD3/NmVKd
	 lr9uQfyXo9XDWxGbCMkJQknHjGqytIndCi1cecNcOFcAGJ0gqqDcQqc8mUAxDd5Eo7
	 9sehp2Meyj1BQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-385da75c6e6so43960501fa.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 11:54:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV640dTSEl8ZPcuD5fgqnSAykBWckvKc4vPE96Rlm7oFIVv81KMH28HNXqsc6W0F+rfvmkj5NgAQzbvAV75Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx05L5nbAx+watimZss4Grf/eMnz4Ir1aoZkSH+plMkjrvYMVZq
	EQSe1xCn+hYNGnp3m+r3OfTpZ31Ke2yH6+azSwj9FWlP1953pD9rmBSdCrINp7/qPEljjRwAhtW
	oSo2HxOskd/AX6ipF7akEeedZ13d1hWA=
X-Received: by 2002:a2e:bc10:0:b0:385:d78a:1f34 with SMTP id
 38308e7fff4ca-38703055079mr214791fa.17.1770753243639; Tue, 10 Feb 2026
 11:54:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-5-f777c65b8ae2@kernel.org> <zqo3qcdqlrxnqxl63kqeuvdacpbbywdrcir2kfwh7j6zvbfuq5@wspy4e75axfz>
In-Reply-To: <zqo3qcdqlrxnqxl63kqeuvdacpbbywdrcir2kfwh7j6zvbfuq5@wspy4e75axfz>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 10 Feb 2026 14:53:27 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9njGhT85pgUSahki989Y9vn3XOBNO5wxB8wE+KvbL00wA@mail.gmail.com>
X-Gm-Features: AZwV_Qhd-O5disfUdXHYeoc8tMIXKrEn06Ut5qaMpJq38pAn-iSAamGwNgY1AVU
Message-ID: <CAJ-ks9njGhT85pgUSahki989Y9vn3XOBNO5wxB8wE+KvbL00wA@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] rust: xarray: use `xas_load` instead of
 `xa_load` in `Guard::load`
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 10:16=E2=80=AFAM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
> * Andreas Hindborg <a.hindborg@kernel.org> [260209 14:39]:
> > Replace the call to `xa_load` with `xas_load` in `Guard::load`. The
> > `xa_load` function takes the RCU lock internally, which we do not need,
> > since the `Guard` already holds an exclusive lock on the `XArray`. The
> > `xas_load` function operates on `xa_state` and assumes the required loc=
ks
> > are already held.
> >
> > This change also removes the `#[expect(dead_code)]` annotation from
> > `XArrayState` and its constructor, as they are now in use.
>
> I don't understand the locking here.
>
> You are saying that, since you hold the xarray write lock, you won't be
> taking the rcu read lock, but then you change the api of load?  That
> seems wrong to me.

This patch doesn't change the API of load. Andreas is saying that the
type system already requires the caller to hold the xarray spin lock
when load is called, meaning acquiring the RCU lock isn't necessary.

>
> Any readers of the api that calls load will now need to hold the rcu
> read lock externally.  If you're doing this, then you should indicate
> that is necessary in the function name, like the C side does.  Otherwise
> you are limiting the users to the advanced API, aren't you?

The existing API already requires users to hold the xarray lock.

>
> Or are you saying that xarray can only be used if you hold the exclusive
> lock, which is now a read and write lock?

Yes - except for the word "now"; I'm not sure what you mean by it.

>
> >
> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Acked-by: Tamir Duberstein <tamird@kernel.org>

> > ---
> >  rust/kernel/xarray.rs | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> > index d1246ec114898..eadddafb180ec 100644
> > --- a/rust/kernel/xarray.rs
> > +++ b/rust/kernel/xarray.rs
> > @@ -215,10 +215,8 @@ fn load<F, U>(&self, index: usize, f: F) -> Option=
<U>
> >      where
> >          F: FnOnce(NonNull<c_void>) -> U,
> >      {
> > -        // SAFETY: `self.xa.xa` is always valid by the type invariant.
> > -        let ptr =3D unsafe { bindings::xa_load(self.xa.xa.get(), index=
) };
> > -        let ptr =3D NonNull::new(ptr.cast())?;
> > -        Some(f(ptr))
> > +        let mut state =3D XArrayState::new(self, index);
> > +        Some(f(state.load()?))

This can probably be written as `state.load().map(f)`.

> >      }
> >
> >      /// Checks if the XArray contains an element at the specified inde=
x.
> > @@ -327,7 +325,6 @@ pub fn store(
> >  /// # Invariants
> >  ///
> >  /// - `state` is always a valid `bindings::xa_state`.
> > -#[expect(dead_code)]
> >  pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
> >      /// Holds a reference to the lock guard to ensure the lock is not =
dropped
> >      /// while `Self` is live.
> > @@ -336,7 +333,6 @@ pub(crate) struct XArrayState<'a, 'b, T: ForeignOwn=
able> {
> >  }
> >
> >  impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
> > -    #[expect(dead_code)]
> >      fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
> >          let ptr =3D access.xa.xa.get();
> >          // INVARIANT: We initialize `self.state` to a valid value belo=
w.
> > @@ -356,6 +352,13 @@ fn new(access: &'b Guard<'a, T>, index: usize) -> =
Self {
> >              },
> >          }
> >      }
> > +
> > +    fn load(&mut self) -> Option<NonNull<c_void>> {
> > +        // SAFETY: `state.state` is always valid by the type invariant=
 of
> > +        // `XArrayState and we hold the xarray lock`.
> > +        let ptr =3D unsafe { bindings::xas_load(&raw mut self.state) }=
;
> > +        NonNull::new(ptr.cast())
> > +    }
> >  }
> >
> >  // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff=
 `T` is `Send`.
> >
> > --
> > 2.51.2
> >
> >
> >
