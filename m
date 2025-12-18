Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA05B37833B;
	Thu, 18 Dec 2025 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073668; cv=pass; b=bHlm1WPFoyFUVvWJtZpzmM0jkI/2rK+W+qimGjaQWZWsPmmlpfoShCtqDShKl7vIdOSpedoUl6nsp+OR0jZddvIiYE300nrZE6I2mi8fnhzQzviU/lQiOG1t22+ruPxGjxsSOm3VbOwW0EBeN8iXdUC7rV41Bdl/Y4VNanuK6kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073668; c=relaxed/simple;
	bh=+qVcecAXx0w6SLxPmbrYRIiGJ3jIsHUtRPkD7eoEXWc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=c/DioT6ztrxRt0dPHrYRC9LKg/hf6m7/OmcWIjdIfoHFzQ3H5cJ+DGTOciw4GnUY1KE1YLNfDRNgAYqzG4zYwASINV1ZuVMdA7+i6GU4orvF7Ly4XGH6wO/E18veFlOUjMSXdx9RGfo6Mzs5reEGz4JqRxEWwNrbdckaSdk3Iuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Kr5owB93; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Kr5owB93"
ARC-Seal: i=1; a=rsa-sha256; t=1766073631; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PdXSqXPssuqq/dgJ9V6BNjwRucYzLrpQDBqXu7BQPGQwZghwpRl1/NrlP4omPfcVXFn6wFLgoxAcW7AXZbLvGFe5/nNDwba6PjRm9axz2IYqglh/4KJySbaWXtv1qAQLlQ3tIy6KjFPcWmiO1DcRxmwJaXo+o3aoykMn4prdTXg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766073631; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eW6NFxH5dsCVeKAv5p2LIlvlQlslDHFCh223gZKJyvE=; 
	b=YSqNx7ebqyTA68a99evi5N8kilHPUMncm4jbAZv08ZVviYPIY+nE9SJjdUF17XLhCX4J/ZMgiZjzLiunWCK4MOYgmQXYwpBtbTJNDoWpK5pJh0dYHHNnoWLnr0ibHN/W2AQqUGnaS7M2i8bsMFcXSzJIDOXVP7USmWxmq5cyODc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766073631;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=eW6NFxH5dsCVeKAv5p2LIlvlQlslDHFCh223gZKJyvE=;
	b=Kr5owB93IKoE77vji50Gb34zNJJN3L/g9Vjwg6c2Z9Dl8N38FWW0Fn6kv9gj1P1S
	azk2TXULFPqivFp7+wpUB7iYUCQ9llHJ25l4ZRuX9jzAZchyTQ/te5qBhaXCsV5NHNL
	5TOaYiy1Ukg1RJKh+FHPm6K6pY8kZBTJdoTxs7JA=
Received: by mx.zohomail.com with SMTPS id 1766073629423683.447107511521;
	Thu, 18 Dec 2025 08:00:29 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2] rust: sync: inline various lock related methods
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251218-inline-lock-unlock-v2-1-fbadac8bd61b@google.com>
Date: Thu, 18 Dec 2025 13:00:11 -0300
Cc: Boqun Feng <boqun.feng@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A12E32E0-9460-48D3-83FE-23C5915179A5@collabora.com>
References: <20251218-inline-lock-unlock-v2-1-fbadac8bd61b@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 18 Dec 2025, at 09:10, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> While debugging a different issue [1], I inspected a rust_binder.ko =
file
> and noticed the following relocation:
>=20
> R_AARCH64_CALL26 =
_RNvXNtNtNtCsdfZWD8DztAw_6kernel4sync4lock8spinlockNtB2_15SpinLockBackendN=
tB4_7Backend6unlock
>=20
> This relocation (and a similar one for lock) occurred many times
> throughout the module. That is not really useful because all this
> function does is call spin_unlock(), so what we actually want here is
> that a call to spin_unlock() dirctly is generated in favor of this
> wrapper method.
>=20
> Thus, mark these methods inline.
>=20
> Link: =
https://lore.kernel.org/p/20251111-binder-fix-list-remove-v1-0-8ed14a0da63=
d@google.com
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Rebased on v6.19-rc1.
> - Link to v1: =
https://lore.kernel.org/r/20251113-inline-lock-unlock-v1-1-1b6e8c323bcf@go=
ogle.com
> ---
> rust/kernel/sync/lock.rs          | 7 +++++++
> rust/kernel/sync/lock/global.rs   | 2 ++
> rust/kernel/sync/lock/mutex.rs    | 5 +++++
> rust/kernel/sync/lock/spinlock.rs | 5 +++++
> 4 files changed, 19 insertions(+)
>=20
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index =
46a57d1fc309d330a4c82fe1ecce18297205faed..10b6b5e9b024f2d3ee7458fc2f64190b=
d38f4391 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -156,6 +156,7 @@ impl<B: Backend> Lock<(), B> {
>     /// the whole lifetime of `'a`.
>     ///
>     /// [`State`]: Backend::State
> +    #[inline]
>     pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'a Self {
>         // SAFETY:
>         // - By the safety contract `ptr` must point to a valid =
initialised instance of `B::State`
> @@ -169,6 +170,7 @@ pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> =
&'a Self {
>=20
> impl<T: ?Sized, B: Backend> Lock<T, B> {
>     /// Acquires the lock and gives the caller access to the data =
protected by it.
> +    #[inline]
>     pub fn lock(&self) -> Guard<'_, T, B> {
>         // SAFETY: The constructor of the type calls `init`, so the =
existence of the object proves
>         // that `init` was called.
> @@ -182,6 +184,7 @@ pub fn lock(&self) -> Guard<'_, T, B> {
>     /// Returns a guard that can be used to access the data protected =
by the lock if successful.
>     // `Option<T>` is not `#[must_use]` even if `T` is, thus the =
attribute is needed here.
>     #[must_use =3D "if unused, the lock will be immediately unlocked"]
> +    #[inline]
>     pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
>         // SAFETY: The constructor of the type calls `init`, so the =
existence of the object proves
>         // that `init` was called.
> @@ -275,6 +278,7 @@ pub fn as_mut(&mut self) -> Pin<&mut T> {
> impl<T: ?Sized, B: Backend> core::ops::Deref for Guard<'_, T, B> {
>     type Target =3D T;
>=20
> +    #[inline]
>     fn deref(&self) -> &Self::Target {
>         // SAFETY: The caller owns the lock, so it is safe to deref =
the protected data.
>         unsafe { &*self.lock.data.get() }
> @@ -285,6 +289,7 @@ impl<T: ?Sized, B: Backend> core::ops::DerefMut =
for Guard<'_, T, B>
> where
>     T: Unpin,
> {
> +    #[inline]
>     fn deref_mut(&mut self) -> &mut Self::Target {
>         // SAFETY: The caller owns the lock, so it is safe to deref =
the protected data.
>         unsafe { &mut *self.lock.data.get() }
> @@ -292,6 +297,7 @@ fn deref_mut(&mut self) -> &mut Self::Target {
> }
>=20
> impl<T: ?Sized, B: Backend> Drop for Guard<'_, T, B> {
> +    #[inline]
>     fn drop(&mut self) {
>         // SAFETY: The caller owns the lock, so it is safe to unlock =
it.
>         unsafe { B::unlock(self.lock.state.get(), &self.state) };
> @@ -304,6 +310,7 @@ impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
>     /// # Safety
>     ///
>     /// The caller must ensure that it owns the lock.
> +    #[inline]
>     pub unsafe fn new(lock: &'a Lock<T, B>, state: B::GuardState) -> =
Self {
>         // SAFETY: The caller can only hold the lock if =
`Backend::init` has already been called.
>         unsafe { B::assert_is_held(lock.state.get()) };
> diff --git a/rust/kernel/sync/lock/global.rs =
b/rust/kernel/sync/lock/global.rs
> index =
eab48108a4aebeb72b2026d6c21d5748b0e62f0a..aecbdc34738fbd746de79eb0f1abe995=
478ad785 100644
> --- a/rust/kernel/sync/lock/global.rs
> +++ b/rust/kernel/sync/lock/global.rs
> @@ -77,6 +77,7 @@ pub unsafe fn init(&'static self) {
>     }
>=20
>     /// Lock this global lock.
> +    #[inline]
>     pub fn lock(&'static self) -> GlobalGuard<B> {
>         GlobalGuard {
>             inner: self.inner.lock(),
> @@ -84,6 +85,7 @@ pub fn lock(&'static self) -> GlobalGuard<B> {
>     }
>=20
>     /// Try to lock this global lock.
> +    #[inline]
>     pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
>         Some(GlobalGuard {
>             inner: self.inner.try_lock()?,
> diff --git a/rust/kernel/sync/lock/mutex.rs =
b/rust/kernel/sync/lock/mutex.rs
> index =
581cee7ab842ad62ec144e67138676c000a3f5e4..cda0203efefb9fcb32c7eab28721e867=
8ccec575 100644
> --- a/rust/kernel/sync/lock/mutex.rs
> +++ b/rust/kernel/sync/lock/mutex.rs
> @@ -102,6 +102,7 @@ unsafe impl super::Backend for MutexBackend {
>     type State =3D bindings::mutex;
>     type GuardState =3D ();
>=20
> +    #[inline]
>     unsafe fn init(
>         ptr: *mut Self::State,
>         name: *const crate::ffi::c_char,
> @@ -112,18 +113,21 @@ unsafe fn init(
>         unsafe { bindings::__mutex_init(ptr, name, key) }
>     }
>=20
> +    #[inline]
>     unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState {
>         // SAFETY: The safety requirements of this function ensure =
that `ptr` points to valid
>         // memory, and that it has been initialised before.
>         unsafe { bindings::mutex_lock(ptr) };
>     }
>=20
> +    #[inline]
>     unsafe fn unlock(ptr: *mut Self::State, _guard_state: =
&Self::GuardState) {
>         // SAFETY: The safety requirements of this function ensure =
that `ptr` is valid and that the
>         // caller is the owner of the mutex.
>         unsafe { bindings::mutex_unlock(ptr) };
>     }
>=20
> +    #[inline]
>     unsafe fn try_lock(ptr: *mut Self::State) -> =
Option<Self::GuardState> {
>         // SAFETY: The `ptr` pointer is guaranteed to be valid and =
initialized before use.
>         let result =3D unsafe { bindings::mutex_trylock(ptr) };
> @@ -135,6 +139,7 @@ unsafe fn try_lock(ptr: *mut Self::State) -> =
Option<Self::GuardState> {
>         }
>     }
>=20
> +    #[inline]
>     unsafe fn assert_is_held(ptr: *mut Self::State) {
>         // SAFETY: The `ptr` pointer is guaranteed to be valid and =
initialized before use.
>         unsafe { bindings::mutex_assert_is_held(ptr) }
> diff --git a/rust/kernel/sync/lock/spinlock.rs =
b/rust/kernel/sync/lock/spinlock.rs
> index =
d7be38ccbdc7dc4d70caaed0e7088f59f65fc6d1..ef76fa07ca3a2b5e32e956e828be5b29=
5da0bc28 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -101,6 +101,7 @@ unsafe impl super::Backend for SpinLockBackend {
>     type State =3D bindings::spinlock_t;
>     type GuardState =3D ();
>=20
> +    #[inline]
>     unsafe fn init(
>         ptr: *mut Self::State,
>         name: *const crate::ffi::c_char,
> @@ -111,18 +112,21 @@ unsafe fn init(
>         unsafe { bindings::__spin_lock_init(ptr, name, key) }
>     }
>=20
> +    #[inline]
>     unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState {
>         // SAFETY: The safety requirements of this function ensure =
that `ptr` points to valid
>         // memory, and that it has been initialised before.
>         unsafe { bindings::spin_lock(ptr) }
>     }
>=20
> +    #[inline]
>     unsafe fn unlock(ptr: *mut Self::State, _guard_state: =
&Self::GuardState) {
>         // SAFETY: The safety requirements of this function ensure =
that `ptr` is valid and that the
>         // caller is the owner of the spinlock.
>         unsafe { bindings::spin_unlock(ptr) }
>     }
>=20
> +    #[inline]
>     unsafe fn try_lock(ptr: *mut Self::State) -> =
Option<Self::GuardState> {
>         // SAFETY: The `ptr` pointer is guaranteed to be valid and =
initialized before use.
>         let result =3D unsafe { bindings::spin_trylock(ptr) };
> @@ -134,6 +138,7 @@ unsafe fn try_lock(ptr: *mut Self::State) -> =
Option<Self::GuardState> {
>         }
>     }
>=20
> +    #[inline]
>     unsafe fn assert_is_held(ptr: *mut Self::State) {
>         // SAFETY: The `ptr` pointer is guaranteed to be valid and =
initialized before use.
>         unsafe { bindings::spin_assert_is_held(ptr) }
>=20
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251113-inline-lock-unlock-b1726632a99d
>=20
> Best regards,
> --=20
> Alice Ryhl <aliceryhl@google.com>
>=20
>=20

I wonder if _everything_ has to be inlined, i.e.: even things like =
assert_is_held(), init() and etc.

In any case,

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

