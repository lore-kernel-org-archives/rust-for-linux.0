Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A6331238
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 21:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770758592; cv=none; b=YAh6nj0/9iDVrwvnR5WH3tZ7HO43dF9cVABG3PeZtTea+J2x/Zv3DxYOU/4RDk8yFxmRW3VhU1u11Ps34Jth/d09jUzdgrHwoZa4XnITeGyQeR44Q0ssGhNb5FEO6xj/1iv0NSpbdg5E1Hl6qas/UoVnymf/KND/VZZ3+J9vsvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770758592; c=relaxed/simple;
	bh=4AT+RXGXSCyro2xakJSwLzTq0XsfHO41wcMZUtz2SOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=IQSkmVoecrrZhG7VrzBSaK4tm3+Brq6t+aUd1/DFX6XMOhyVNl1x08BiCRZYZ/fhe0+FiVerHdCTh/qd8H/bkCw+8u/RlKyzie+pBVqISZ4lkFL1OFbl2rj6sn0q48TQXKoHzII2LvjBULyKtgmxVH4mMnpnzJks2PqB0E3kSCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0cDRD8m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0cDRD8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5601C2BCB0
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 21:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770758591;
	bh=4AT+RXGXSCyro2xakJSwLzTq0XsfHO41wcMZUtz2SOQ=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=q0cDRD8mtEGWivMSLFYqUgHyW9VQVCSGtBXgVyD0aW6HcIaXSxV9EGhF3Yhl3z7nS
	 +K8aT6MGliLiyKiRge3PyaMU5vLukQ7ED8BgrxaAupsAlgu2Nsp05FZMfg5Aa+Qf3g
	 8mvb1LRF0YUGmMnKExfL5QQ1X+erIzyIOvgkZenTyHzQvVkDO4PK+/SJHr91k5A8Ua
	 kVaWFLnuP+F+hvS62coIQI+ne1F6V4vfArdiFtpLKUa+C9n3vMf/3U+sVeFKXq+Ucx
	 dvt8IOYhgKXE7LOPcbfOBlJpS5lxGmIycV31LNIyIHaUNj80Km/Y+xaIIRPE+kTAs2
	 sCuPaYnIuB1ig==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-385da75c6e6so44704401fa.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 13:23:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/o3SGVSMazPedW76MLqzM3Vb6NkKjuVfY/KugrGCvwBDlHXaLdXugD9xKWjMwVRzik/NO77If+PpApUD5iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXCPQUczAkKhM78dSfhGx1t6GqRPaU9/5c/DZjGdkeK9gTffoc
	oDzu6hmKquzyFFrNcwos+IkWI9e+h4p2lFsXUrl5e3VPxMKbeFgVUxiJvCXnZHr2ImBHxmysgrv
	3vWkSkYzvdCoINcocNOOwTc6yCtfz9wk=
X-Received: by 2002:a2e:be8f:0:b0:383:26ac:4fd8 with SMTP id
 38308e7fff4ca-38702e9bf3dmr998591fa.0.1770758590169; Tue, 10 Feb 2026
 13:23:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-5-f777c65b8ae2@kernel.org> <zqo3qcdqlrxnqxl63kqeuvdacpbbywdrcir2kfwh7j6zvbfuq5@wspy4e75axfz>
 <CAJ-ks9njGhT85pgUSahki989Y9vn3XOBNO5wxB8wE+KvbL00wA@mail.gmail.com> <6sd4numrxigibwynr2lfmtdj5uabggrx2l57igtjbnq4uwddrm@wipmwcmqbkjn>
In-Reply-To: <6sd4numrxigibwynr2lfmtdj5uabggrx2l57igtjbnq4uwddrm@wipmwcmqbkjn>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 10 Feb 2026 16:22:33 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9knC3pKpiMaG6f3C1Kr6su9p26hM7YvVMzsVwYVHGtm2Q@mail.gmail.com>
X-Gm-Features: AZwV_QhdvZH0ulXOwC7qepwpvm2i9242YLhbIsO38rOa_1y-e9PY-uFALj98NOE
Message-ID: <CAJ-ks9knC3pKpiMaG6f3C1Kr6su9p26hM7YvVMzsVwYVHGtm2Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] rust: xarray: use `xas_load` instead of
 `xa_load` in `Guard::load`
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
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

On Tue, Feb 10, 2026 at 12:59=E2=80=AFPM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
> * Tamir Duberstein <tamird@kernel.org> [260210 19:54]:
> > On Tue, Feb 10, 2026 at 10:16=E2=80=AFAM Liam R. Howlett
> > <Liam.Howlett@oracle.com> wrote:
> > >
> > > * Andreas Hindborg <a.hindborg@kernel.org> [260209 14:39]:
> > > > Replace the call to `xa_load` with `xas_load` in `Guard::load`. The
> > > > `xa_load` function takes the RCU lock internally, which we do not n=
eed,
> > > > since the `Guard` already holds an exclusive lock on the `XArray`. =
The
> > > > `xas_load` function operates on `xa_state` and assumes the required=
 locks
> > > > are already held.
> > > >
> > > > This change also removes the `#[expect(dead_code)]` annotation from
> > > > `XArrayState` and its constructor, as they are now in use.
> > >
> > > I don't understand the locking here.
> > >
> > > You are saying that, since you hold the xarray write lock, you won't =
be
> > > taking the rcu read lock, but then you change the api of load?  That
> > > seems wrong to me.
> >
> > This patch doesn't change the API of load. Andreas is saying that the
> > type system already requires the caller to hold the xarray spin lock
> > when load is called, meaning acquiring the RCU lock isn't necessary.
>
> What I mean is that the API can no longer be called when holding the RCU
> read lock.  You seem to imply this is already the case though.
>
> >
> > >
> > > Any readers of the api that calls load will now need to hold the rcu
> > > read lock externally.  If you're doing this, then you should indicate
> > > that is necessary in the function name, like the C side does.  Otherw=
ise
> > > you are limiting the users to the advanced API, aren't you?
> >
> > The existing API already requires users to hold the xarray lock.
> >
> > >
> > > Or are you saying that xarray can only be used if you hold the exclus=
ive
> > > lock, which is now a read and write lock?
> >
> > Yes - except for the word "now"; I'm not sure what you mean by it.
>
> I'm trying to understand the locking on the rust side.
>
> I think you answered it by telling me that all readers and writers use
> the spinlock.

Indeed. The current API doesn't expose load on the xarray at all; load
is only available on the "guard" type. An instance of "guard" can
exist only when the lock is held. The lock is unlocked when the guard
is dropped.

>
> Is this a temporary limitation?

Maybe? I don't think RfL has good abstractions for RCU yet. For
example, exposing load directly on the xarray using xa_load would
require a way to guarantee that the returned pointer's target isn't
being concurrently mutated (e.g. under the xarray lock). I'm not aware
of anyone asking for this, though.


>
> Thanks,
> Liam
