Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C1620458E
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736764220; cv=none; b=s8y/IDPmlS8czD5IkX0sFjV21xCPqvIJcyI85M76Txf7bDkFHv+k/qw6e80QK6Nri96uP83H1XaCNBUHGFxM1Ji3+R9ETCD01R5hQewdZxykBB6cww0XtDzx9gu9WZgUuUwPiogV8WMSAOpJwZf7ELeOslO1l8rw0LfHvzqVejI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736764220; c=relaxed/simple;
	bh=T++9RCk7h6Aejc1grLPm48vQosvQYj3ZgQ3DZJ4peLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbS19VlQZb5/21zLgdBOC+iQjEWZlN1XUiY1FLeu0PLfl9wEStuwT/bhASZxNO2om8HB5WBarP9dSXbFq27Q5Ml3yFRUw5Lty1hMSkQwHQ1OXrbig7X6oClQNnnQ1dMNF8LqVU1ybGPGcMZItNvIsl+5UWlQrPJ2d32yOD1p5so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=00fLjRYt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="00fLjRYt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436249df846so28056005e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 02:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736764217; x=1737369017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6BcFT4T+We0MNxDCiiTwafBoXlHK/RucDnwCAebGy8=;
        b=00fLjRYt2ciCgfeaeziFuhmBR7jdkD3yrL61KPtvsll2qCtKfd0uuvnd8qX6TscAaZ
         zOjxOdzqfOg8NtiF0pk2Sc+2n3VgrZ1NDvI2GvshOXIF6rFdJwddwLYaE064qKaw6e9j
         pgHbiZAhLrBcf2AAYkQGu3rIyA0IcTCCV7bhWfgSyH6oa8wGCxxuQ56egDloa7k6Uu70
         KQGCQKOXkcq8xRDLqUh8/V0fRGP0IBFmVGgsRe6tYEQayGMUSuXfIkQLTsVtZAEWWcQg
         ILQtyIo4pn0LqaAo/jKkGglPWMZK+WXVjd66qC6XSvtMI0DBBaINWAuIdRTUc3vTRhex
         2DVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736764217; x=1737369017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6BcFT4T+We0MNxDCiiTwafBoXlHK/RucDnwCAebGy8=;
        b=E95ofFLVfb8mG21LPKvPR2S97+7fQfunKUSL1OTHzXfrBJbClkfybz742HpAGFgYri
         CT5uOOYTi7wiZjCTBL3UCIAJYe7X2u6sDozp9IjqVZDviLxrkR2Jqn7dIN06vLNT/fm3
         w7yU5gfA3/vbeJYOnC/uX3MaUFkQJb9co2HdyiD9YmkP6AwMpm6icR2IoZtEMmbdKOql
         KLwezaF5npsc6C2/vHpePjsX2VhMEn3AhiBS3P5c/fgvosn+QpsZj13Ws8ct0PCF6dao
         fpwU7ZZl/wx/dADf0cALvDD31VELEhjt5LUMywP6+E6FjzPzkiPwaDGi3szLA5eH5uMM
         waDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF9pYofyuuD+dLfqIqT9bgXw3icYPx3GW+PPNOKnMjE3lKl3FtIYUdBPa0OYE8CBH6ZT1WR+2iO0ZvXblcbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YycoSP4m3A98bEv02DUIIIdZCHSNcXwFKpz+SDwFqFcaRbUXQ6q
	7gqSLMnN+/XBSMObBF7SaSJCVs+EXEENGO1KNvLopuBXUQ0JvAdN3dMPLMeEMgDGmeoV1fOX7Qz
	K04Psu1CeX/ZbS5IOL9G33wxObkYX6vwGWFzx
X-Gm-Gg: ASbGncuHlaFreXO+WspmKf73kgv4oltaonMJ3MBQ2HhZt8yXh5dF7xRtSvyuqJO6Ss4
	b4Wydh7awLq4xPs+T2gdS0AXctteelIuSLChhQIh0t2vRn21Qewf+GLgMVXPOZ9IFeoQD
X-Google-Smtp-Source: AGHT+IFWb2oyTOjJX/o3HSNnXeHPflZbUYxMxvifF7/xMk5dQsb+1KcZXFEGg1ps+RkKlLpxr9haE/A/djl1U0bHtYo=
X-Received: by 2002:a05:600c:354e:b0:431:5aea:95f with SMTP id
 5b1f17b1804b1-436e26a175cmr218244085e9.16.1736764217229; Mon, 13 Jan 2025
 02:30:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <20241211-vma-v11-8-466640428fc3@google.com>
 <Z2C6eAMnniTnxTX3@tardis.local>
In-Reply-To: <Z2C6eAMnniTnxTX3@tardis.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Jan 2025 11:30:05 +0100
X-Gm-Features: AbW1kvZmBQ72-6O2pqLwyAyR2WjjcEyxesG4j5T1ajEwgzoqW67phRCjjvS6z7U
Message-ID: <CAH5fLgg=+Y=v=X50VdaCWwRRRUpKzGvBB-ND+4LHx9CNeThVDg@mail.gmail.com>
Subject: Re: [PATCH v11 8/8] task: rust: rework how current is accessed
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 12:40=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Wed, Dec 11, 2024 at 10:37:12AM +0000, Alice Ryhl wrote:
> > Introduce a new type called `CurrentTask` that lets you perform various
> > operations that are only safe on the `current` task. Use the new type t=
o
> > provide a way to access the current mm without incrementing its
> > refcount.
> >
> > With this change, you can write stuff such as
> >
> >       let vma =3D current!().mm().lock_vma_under_rcu(addr);
> >
> > without incrementing any refcounts.
> >
> > This replaces the existing abstractions for accessing the current pid
> > namespace. With the old approach, every field access to current involve=
s
> > both a macro and a unsafe helper function. The new approach simplifies
> > that to a single safe function on the `CurrentTask` type. This makes it
> > less heavy-weight to add additional current accessors in the future.
> >
> > That said, creating a `CurrentTask` type like the one in this patch
> > requires that we are careful to ensure that it cannot escape the curren=
t
> > task or otherwise access things after they are freed. To do this, I
> > declared that it cannot escape the current "task context" where I
> > defined a "task context" as essentially the region in which `current`
> > remains unchanged. So e.g., release_task() or begin_new_exec() would
> > leave the task context.
> >
> > If a userspace thread returns to userspace and later makes another
> > syscall, then I consider the two syscalls to be different task contexts=
.
> > This allows values stored in that task to be modified between syscalls,
> > even if they're guaranteed to be immutable during a syscall.
> >
> > Ensuring correctness of `CurrentTask` is slightly tricky if we also wan=
t
> > the ability to have a safe `kthread_use_mm()` implementation in Rust. T=
o
> > support that safely, there are two patterns we need to ensure are safe:
> >
> >       // Case 1: current!() called inside the scope.
> >       let mm;
> >       kthread_use_mm(some_mm, || {
> >           mm =3D current!().mm();
> >       });
> >       drop(some_mm);
> >       mm.do_something(); // UAF
> >
> > and:
> >
> >       // Case 2: current!() called before the scope.
> >       let mm;
> >       let task =3D current!();
> >       kthread_use_mm(some_mm, || {
> >           mm =3D task.mm();
> >       });
> >       drop(some_mm);
> >       mm.do_something(); // UAF
> >
> > The existing `current!()` abstraction already natively prevents the
> > first case: The `&CurrentTask` would be tied to the inner scope, so the
> > borrow-checker ensures that no reference derived from it can escape the
> > scope.
> >
> > Fixing the second case is a bit more tricky. The solution is to
> > essentially pretend that the contents of the scope execute on an
> > different thread, which means that only thread-safe types can cross the
> > boundary. Since `CurrentTask` is marked `NotThreadSafe`, attempts to
> > move it to another thread will fail, and this includes our fake pretend
> > thread boundary.
> >
> > This has the disadvantage that other types that aren't thread-safe for
> > reasons unrelated to `current` also cannot be moved across the
> > `kthread_use_mm()` boundary. I consider this an acceptable tradeoff.
> >
> > Cc: Christian Brauner <brauner@kernel.org>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/mm.rs   |  22 ----
> >  rust/kernel/task.rs | 284 ++++++++++++++++++++++++++++++--------------=
--------
> >  2 files changed, 167 insertions(+), 139 deletions(-)
> >
> > diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
> > index 50f4861ae4b9..f7d1079391ef 100644
> > --- a/rust/kernel/mm.rs
> > +++ b/rust/kernel/mm.rs
> > @@ -142,28 +142,6 @@ fn deref(&self) -> &MmWithUser {
> >
> >  // These methods are safe to call even if `mm_users` is zero.
> >  impl Mm {
> > -    /// Call `mmgrab` on `current.mm`.
> > -    #[inline]
> > -    pub fn mmgrab_current() -> Option<ARef<Mm>> {
> > -        // SAFETY: It's safe to get the `mm` field from current.
> > -        let mm =3D unsafe {
> > -            let current =3D bindings::get_current();
> > -            (*current).mm
> > -        };
> > -
> > -        if mm.is_null() {
> > -            return None;
> > -        }
> > -
> > -        // SAFETY: The value of `current->mm` is guaranteed to be null=
 or a valid `mm_struct`. We
> > -        // just checked that it's not null. Furthermore, the returned =
`&Mm` is valid only for the
> > -        // duration of this function, and `current->mm` will stay vali=
d for that long.
> > -        let mm =3D unsafe { Mm::from_raw(mm) };
> > -
> > -        // This increments the refcount using `mmgrab`.
> > -        Some(ARef::from(mm))
> > -    }
> > -
>
> This is removed because of no user? If so, maybe don't introduce this at
> all in the earlier patch of this series? The rest looks good to me.

I guess I can drop the temporary introduction of this. It's here due
to the history of this series where originally it only had
mmgrab_current, and Binder would use that. But with this patch, you
can use CurrentTask::mm() + ARef::from() to do the same thing. For
Binder, the difference doesn't matter, but the latter is more powerful
as you can access the current task's mm_struct without incrementing
refcounts.

Alice
