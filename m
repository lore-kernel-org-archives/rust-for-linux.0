Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBD53EBF01;
	Fri, 23 Jan 2026 22:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769208951; cv=none; b=i6sLlmrB68wsJIlcGeWyfsC5yZEsD3WqhupASXipDNt8OnHSXlGGAJ4QFpVlxmc2EsurJ8YX8Y+DEIgNdt/lWNZ0weUgebuZju2Z5CZnuguLSWTFLqhlKywBU+DT9X7rXFe3IflxqiiIJiMvf7YXESWvPtoyfZQoqtDdbR6t9FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769208951; c=relaxed/simple;
	bh=orbHjJYBqWQNED6p5ZZsi3FnChgcew+IhUh43kGyjxQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=UaCviN77Zmp4twXLpHBC91xVWy6T0ZumxlKfOcK2sBeFTdpx4fD6WgDNkrFwC8TM8krxmhwiF174Z1BCEmu7WC1ThhW6MjYyimbh91v/YKa3WMbM+1LxnCfKvlWc6iMGjPVD6Wl7DoUVBiVIJoJzxssjI+XgwC+uXgrVrV8y2HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qD6MpUi+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qD6MpUi+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3392CC4CEF1;
	Fri, 23 Jan 2026 22:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769208950;
	bh=orbHjJYBqWQNED6p5ZZsi3FnChgcew+IhUh43kGyjxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qD6MpUi+6IBwur9iUPjN6nRVKQYqGqejZFCzV3tmnYjCEA1WISV3eAXLjYMm8h9vf
	 V6/xt9v9KNHq0uyo+ylmgJ8yQckwmjHGTGI9XPhI9+3sIE1TGjoX2jFMrY2VFwZ2aA
	 Lv7JTckbJVfH49FV3PKJJ+dn3YrS1qYfw3D1k+GalhsusVMwOoDkXF5oryiMxx7Q9n
	 REeSnKfj3DUSfGRCc+oyna30KGbotCIP7pYCa9nrXRNjihBJkILc4JZMx2pBnEyb+a
	 1y6Y+ZfT5IymJmBLSIg8u2yweZCNliojZBzU5THzMmvFsJZDd4DVsRDN3d7wHR+KPd
	 j+Ixjtrx2GqjQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 23:55:45 +0100
Message-Id: <DFWC8962IIE1.2KMJBBAP0CC8N@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v17 10/16] rust: sync: Introduce lock::Lock::lock_with()
 and friends
X-Mailer: aerc 0.21.0
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-11-lyude@redhat.com>
In-Reply-To: <20260121223933.1568682-11-lyude@redhat.com>

On Wed Jan 21, 2026 at 11:39 PM CET, Lyude Paul wrote:
> `SpinLockIrq` and `SpinLock` use the exact same underlying C structure,
> with the only real difference being that the former uses the irq_disable(=
)
> and irq_enable() variants for locking/unlocking. These variants can
> introduce some minor overhead in contexts where we already know that
> local processor interrupts are disabled, and as such we want a way to be
> able to skip modifying processor interrupt state in said contexts in orde=
r
> to avoid some overhead - just like the current C API allows us to do. So,
> `ContextualBackend` allows us to cast a lock into it's contextless versio=
n
> for situations where we already have whatever guarantees would be provide=
d
> by `BackendWithContext::ContextualBackend` in place.
>
> In some hacked-together benchmarks we ran, most of the time this did
> actually seem to lead to a noticeable difference in overhead:
>
>   From an aarch64 VM running on a MacBook M4:
>     lock() when irq is disabled, 100 times cost Delta { nanos: 500 }
>     lock_with() when irq is disabled, 100 times cost Delta { nanos: 292 }
>     lock() when irq is enabled, 100 times cost Delta { nanos: 834 }
>
>     lock() when irq is disabled, 100 times cost Delta { nanos: 459 }
>     lock_with() when irq is disabled, 100 times cost Delta { nanos: 291 }
>     lock() when irq is enabled, 100 times cost Delta { nanos: 709 }
>
>   From an x86_64 VM (qemu/kvm) running on a i7-13700H
>     lock() when irq is disabled, 100 times cost Delta { nanos: 1002 }
>     lock_with() when irq is disabled, 100 times cost Delta { nanos: 729 }
>     lock() when irq is enabled, 100 times cost Delta { nanos: 1516 }
>
>     lock() when irq is disabled, 100 times cost Delta { nanos: 754 }
>     lock_with() when irq is disabled, 100 times cost Delta { nanos: 966 }
>     lock() when irq is enabled, 100 times cost Delta { nanos: 1227 }
>
>     (note that there were some runs on x86_64 where lock() on irq disable=
d
>     vs. lock_with() on irq disabled had equivalent benchmarks, but it ver=
y
>     much appeared to be a minority of test runs.
>
> While it's not clear how this affects real-world workloads yet, let's add
> this for the time being so we can find out. Implement
> lock::Lock::lock_with() and lock::BackendWithContext::ContextualBackend.
> This makes it so that a `SpinLockIrq` will work like a `SpinLock` if
> interrupts are disabled. So a function:
>
>         (&'a SpinLockIrq, &'a InterruptDisabled) -> Guard<'a, .., SpinLoc=
kBackend>
>
> makes sense. Note that due to `Guard` and `InterruptDisabled` having the
> same lifetime, interrupts cannot be enabled while the Guard exists.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

My overall opinion of the design is that we should no longer use the generi=
c
approach with the `Backend` traits. I think I mentioned this on Zulip
already at multiple points. I'm okay with having this extension, but it
would be ideal if we could move to not having a single `Lock` struct,
but one for each locking primitive.

>
> ---
> This was originally two patches, but keeping them split didn't make sense
> after going from BackendInContext to BackendWithContext.
>
> V10:
> * Fix typos - Dirk/Lyude
> * Since we're adding support for context locks to GlobalLock as well, let=
's
>   also make sure to cover try_lock while we're at it and add try_lock_wit=
h
> * Add a private function as_lock_in_context() for handling casting from a
>   Lock<T, B> to Lock<T, B::ContextualBackend> so we don't have to duplica=
te
>   safety comments
> V11:
> * Fix clippy::ref_as_ptr error in Lock::as_lock_in_context()
> V14:
> * Add benchmark results, rewrite commit message
> V17:
> * Introduce `BackendWithContext`, move context-related bits into there an=
d
>   out of `Backend`.
> * Add missing #[must_use =3D =E2=80=A6] for try_lock_with()
> * Remove all unsafe code from lock_with() and try_lock_with():
>   Somehow I never noticed that literally none of the unsafe code in these
>   two functions is needed with as_lock_in_context()...
>
>  rust/kernel/sync/lock.rs          | 71 ++++++++++++++++++++++++++++++-
>  rust/kernel/sync/lock/spinlock.rs | 48 ++++++++++++++++++++-
>  2 files changed, 117 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 46a57d1fc309d..9f6d7b381bd15 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -30,10 +30,15 @@
>  ///   is owned, that is, between calls to [`lock`] and [`unlock`].
>  /// - Implementers must also ensure that [`relock`] uses the same lockin=
g method as the original
>  ///   lock operation.
> +/// - Implementers must ensure if [`BackendInContext`] is a [`Backend`],=
 it's safe to acquire the
> +///   lock under the [`Context`], the [`State`] of two backends must be =
the same.

This isn't needed, since we don't have `Backend::Context` any longer.

>  ///
>  /// [`lock`]: Backend::lock
>  /// [`unlock`]: Backend::unlock
>  /// [`relock`]: Backend::relock
> +/// [`BackendInContext`]: Backend::BackendInContext
> +/// [`Context`]: Backend::Context
> +/// [`State`]: Backend::State

Same for these.

>  pub unsafe trait Backend {
>      /// The state required by the lock.
>      type State;
> @@ -97,6 +102,34 @@ unsafe fn relock(ptr: *mut Self::State, guard_state: =
&mut Self::GuardState) {
>      unsafe fn assert_is_held(ptr: *mut Self::State);
>  }
> =20
> +/// A lock [`Backend`] with a [`ContextualBackend`] that can make lock a=
cquisition cheaper.
> +///
> +/// Some locks, such as [`SpinLockIrq`](super::SpinLockIrq), can only be=
 acquired in specific
> +/// hardware contexts (e.g. local processor interrupts disabled). Enteri=
ng and exiting these
> +/// contexts incurs additional overhead. But this overhead may be avoide=
d if we know ahead of time
> +/// that we are already within the correct context for a given lock as w=
e can then skip any costly
> +/// operations required for entering/exiting said context.
> +///
> +/// Any lock implementing this trait requires such a interrupt context, =
and can provide cheaper
> +/// lock-acquisition functions through [`Lock::lock_with`] and [`Lock::t=
ry_lock_with`] as long as a
> +/// context token of type [`Context`] is available.
> +///
> +/// # Safety
> +///
> +/// - Implementors must ensure that it is safe to acquire the lock under=
 [`Context`].

This safety comment needs some improvements. We probably should just put
the entire cast into this.

> +///
> +/// [`ContextualBackend`]: BackendWithContext::ContextualBackend
> +/// [`Context`]: BackendWithContext::Context
> +pub unsafe trait BackendWithContext: Backend {
> +    /// The context which must be provided in order to acquire the lock =
with the
> +    /// [`ContextualBackend`](BackendWithContext::ContextualBackend).
> +    type Context<'a>;
> +
> +    /// The alternative cheaper backend we can use if a [`Context`](Back=
endWithContext::Context) is
> +    /// provided.
> +    type ContextualBackend: Backend<State =3D Self::State>;
> +}
> +
>  /// A mutual exclusion primitive.
>  ///
>  /// Exposes one of the kernel locking primitives. Which one is exposed d=
epends on the lock
> @@ -169,7 +202,8 @@ pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'a=
 Self {
> =20
>  impl<T: ?Sized, B: Backend> Lock<T, B> {
>      /// Acquires the lock and gives the caller access to the data protec=
ted by it.
> -    pub fn lock(&self) -> Guard<'_, T, B> {
> +    #[inline]
> +    pub fn lock<'a>(&'a self) -> Guard<'a, T, B> {

Why this change?

>          // SAFETY: The constructor of the type calls `init`, so the exis=
tence of the object proves
>          // that `init` was called.
>          let state =3D unsafe { B::lock(self.state.get()) };
> @@ -189,6 +223,41 @@ pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
>      }
>  }
> =20
> +impl<T: ?Sized, B: BackendWithContext> Lock<T, B> {
> +    /// Casts the lock as a `Lock<T, B::ContextualBackend>`.
> +    fn as_lock_in_context<'a>(
> +        &'a self,
> +        _context: B::Context<'a>,
> +    ) -> &'a Lock<T, B::ContextualBackend>
> +    where
> +        B::ContextualBackend: Backend,
> +    {
> +        // SAFETY:
> +        // - Per the safety guarantee of `Backend`, if `B::ContextualBac=
kend` and `B` should
> +        //   have the same state, the layout of the lock is the same so =
it's safe to convert one to
> +        //   another.

This also relies on `Lock` being `repr(C)`. `repr(Rust)` types are
allowed to change layout in cases where their generics are substituted
for others (even if those other ones have the same layout!).

Cheers,
Benno
