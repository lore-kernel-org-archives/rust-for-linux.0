Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267312AEFE
	for <rust-for-linux@vger.kernel.org>; Mon, 26 May 2025 08:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748249790; cv=none; b=g0GVlSrIg0OJLmpZ6ZZQBhzek2mxPveNRRMuPHXB6ifcx2DOKmaFRcVKH4PfkX4RGGvmPMFBrrFeHSW59oINfwkbl+GtK0T1uFSBSVe8oh3SuVs9hDfMXX2R11kq4qqYHM/kKnTIJJXkmoP3bIUf8jeJtvJe9xzXpQ7v1PITbfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748249790; c=relaxed/simple;
	bh=2AnH+fxGCsytbjp1vBKeCXaL1g4/52to9EijNF4zjjs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=TZi3n0Y3pyDWbwQKV7Qz6fbM383dmmhwl7IE4oX7ZeIEgukmIT6+YUur+J4Xb5PovRj1CDOhCTcDWkfMFkMSANSVjQ7K+WtSfUpLWKL4kSjaOCHjRdiKQM4n6XObqyjvm4BU1jw65cP5qh/BPg6vbkwGrADsKaJERKj7BuG2cac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rfysd2h3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rfysd2h3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD37C4CEF2;
	Mon, 26 May 2025 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748249789;
	bh=2AnH+fxGCsytbjp1vBKeCXaL1g4/52to9EijNF4zjjs=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Rfysd2h3aFx97HMClU3aFmmUShXXbitnteKcj3VdLRJJ6ouVzfcDWSLnmWm2FhDID
	 1jdh40YcV1OLjkK/GDd6J+zHB+iYlvkETrDXSKH0ztO91/ANkOhSPpl6f053dbsiLS
	 S1PFyWNGDHvFj/DZ6+KmyM76NmXUJCpXD4sRTT9O0ofOVjE43IlLyZ2r5oMBmomyu5
	 gP6t+D8IR8bi4RIUX/dCyEYc8H4Xw1gDOSvKFGZkv4BUldLfmZ1uJ6hQ0SkXig9SiD
	 cmeJZ5jzk5J35RsjAlgaA/IpeRZ4j3x1hrSyV787GGXSgPLAc1mc3kcaRFCZoVGE/J
	 +INf0qjjT4Cew==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 10:56:26 +0200
Message-Id: <DA5YTSGIN9DK.3HQ7DNKTVQRP4@kernel.org>
Subject: Re: [PATCH v3] rust: revocable: Correct safety comments and add
 invariants
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>, <dakr@kernel.org>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
X-Mailer: aerc 0.20.1
References: <20250526020125.382976-1-marcelomoreira1905@gmail.com>
In-Reply-To: <20250526020125.382976-1-marcelomoreira1905@gmail.com>

On Mon May 26, 2025 at 4:01 AM CEST, Marcelo Moreira wrote:
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index 1e5a9d25c21b..fed860ad2e60 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -61,6 +61,14 @@
>  /// v.revoke();
>  /// assert_eq!(add_two(&v), None);
>  /// ```
> +/// # Invariants
> +///
> +/// - `data` is valid for reads in two cases:
> +///   - while `is_available` is true, or
> +///   - while the RCU read-side lock is taken and it was acquired while =
`is_available` was `true`.

This looks good now :)

> +/// - `data` is valid for writes when `is_available` was atomically chan=
ged from `true` to `false`
> +///   and no thread is holding an RCU read-side lock that was acquired p=
rior to the change in
> +///   `is_available`.

This doesn't cover the case needed in `drop`, since there might be a
thread holding the RCU read-side lock when `drop` is run. But that
doesn't matter, because that thread isn't going to access `data` (since
it can't have a reference to the value anymore, after all we're dropping
it).

>  #[pin_data(PinnedDrop)]
>  pub struct Revocable<T> {
>      is_available: AtomicBool,
> @@ -97,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self=
> {
>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>          let guard =3D rcu::read_lock();
>          if self.is_available.load(Ordering::Relaxed) {
> -            // Since `self.is_available` is true, data is initialised an=
d has to remain valid
> -            // because the RCU read side lock prevents it from being dro=
pped.
> +            // INVARIANT: `self.data` is valid for reads because `self.i=
s_available` is true,
> +            // and the RCU read-side lock held by `guard` ensures this c=
ondition is maintained
> +            // during access.

Two things here:
1. This comment should refer to the type invariants of `Self` ie
   "`self.data` is valid for reads because of the type invariants of
   `Self` and because ...".
2. `INVARIANT` comments report on changes in the type invariants of a
   type. For example when constructing a type with type invariants, one
   has to document that the invariants are fulfilled. In this case, the
   invariants of `RevocableGuard` are:

   /// The RCU read-side lock is held while the guard is alive.

   Which already is fulfilled by us having the `rcu::Guard` type around.
   So we should also change the invariants of the `RevocableGuard`.

I think I suggested on the previous version that we change `data_ref` to
a shared reference and thus simplify the `RevocableGuard` type, because
it won't need `unsafe` any more. Then we can also remove all invariants
on it. (And we also won't need the `new` function any more, since we
have direct access to the fields).

(This change should be its own patch)

Then we will gain a new `unsafe` block in the code here that we will
justify with the type invariant of `Self`.

On second thought, we can reuse the `try_access_with_guard` function and
then we won't need an `unsafe` block here.

>              Some(RevocableGuard::new(self.data.get(), guard))
>          } else {
>              None
> @@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_,=
 T>> {
>      /// object.
>      pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -=
> Option<&'a T> {
>          if self.is_available.load(Ordering::Relaxed) {
> -            // SAFETY: Since `self.is_available` is true, data is initia=
lised and has to remain
> -            // valid because the RCU read side lock prevents it from bei=
ng dropped.
> +            // SAFETY: `self.data` is valid for reads as `is_available` =
is true and `_guard`
> +            // holds the RCU read-side lock, adhering to `Revocable<T>`'=
s invariants.

This is the wrong way around, the safety comment *relies* on the type
invariants of `Self`. So it should be=20

    SAFETY: `self.data` is valid for reads because of the type
    invariants of `Self` and as `is_available` is true and `_guard`
    holds the RCU read-side lock.

>              Some(unsafe { &*self.data.get() })
>          } else {
>              None
> @@ -176,9 +185,11 @@ fn drop(self: Pin<&mut Self>) {
>          // SAFETY: We are not moving out of `p`, only dropping in place
>          let p =3D unsafe { self.get_unchecked_mut() };
>          if *p.is_available.get_mut() {
> -            // SAFETY: We know `self.data` is valid because no other CPU=
 has changed
> -            // `is_available` to `false` yet, and no other CPU can do it=
 anymore because this CPU
> -            // holds the only reference (mutable) to `self` now.
> +            // INVARIANT: `is_available` is true, so `data` is valid for=
 reads.

We're not only reading `data`, but also writing to it! (`drop_in_place`
takes a mutable raw pointer and will call `Drop::drop` with a mutable
reference)

> +            // SAFETY: `self.data` is valid for writes because `is_avail=
able` is true, and
> +            // this `PinnedDrop` context (having `&mut self`) guarantees=
 exclusive access,
> +            // ensuring no other thread can concurrently access or revok=
e `data`.
> +            // This ensures `data` is valid for `drop_in_place`.

We have to mention the type invariants of `Self` here too. And also we
have to satisfy all the conditions on the second invariant:

    /// - `data` is valid for writes when `is_available` was atomically cha=
nged from `true` to `false`
    ///   and no thread is holding an RCU read-side lock that was acquired =
prior to the change in
    ///   `is_available`.

This is the problem with that invariant that I outlined above. Nobody
can access `data`, since we're getting dropped.

>              unsafe { drop_in_place(p.data.get()) };

A function that also needs to be adjusted is the `revoke_internal`
function. That's where the second type invariant comes in. I suggested
that we remove that and split the behavior into `revoke()` and
`revoke_nosync()` and Danilo agreed, so could you add that in another
patch?

---
Cheers,
Benno

>          }
>      }

