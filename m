Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A4E2DA76E
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 14:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753107667; cv=none; b=aEvL4qgh4DbXfuE1SpbL4dfR8byKyOCk48ZemomQyNTkHMLPnCv5hH0xac8wxDbRl1P96w6d7Ai/79vPburvcpCufiWVYu6jzXRme62hEIQxRYM7NDAcXTCtWprkRASO4P7i/zQfiRmX1vA4FP/cPFtf3GBmtSOYDtJxWOA81XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753107667; c=relaxed/simple;
	bh=JcKaZoeKmA9SRzBDl6ydTbkoimw1MEhKUioDycAt8sQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=TYuxoeIiRhqswcep3Fy4DZaPXgDAE/RAsqLebNV3UqJtGJZ6TIGxuia+2ZO7GEdLPtseo2OE4EikyZLmQ52wUKb2/Hx+aQmVUf9z5ZgkxkY+gH1P1EHlQajDJT+1mnWtPPMBTtB9YKvMDYRAC4SBgYuoAUPE4x+eiZyGgtSMO4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ob7vNlfi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ob7vNlfi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17229C4CEF6;
	Mon, 21 Jul 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753107666;
	bh=JcKaZoeKmA9SRzBDl6ydTbkoimw1MEhKUioDycAt8sQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=ob7vNlfi4oLjzH+erQ2Fcs4qmuGR6NaidSNJ4rZdyEaf+dM0jn3FKBdU8Dx2hKwjg
	 1v8VP3z3jdJVIQhSbqvXg+hJu9O1GjTDQssFzy6eeO/uqj0ygrOtK2HdOR0W7Wb4S4
	 QugC51TvZEufYKMUXfVQvI0VdXtyan/j9g/qzdHh0Xp8HtntHU37CJUPXGXPx93Wbb
	 0Zv44c+B6KRbz1JGDmjPNznMNbfU4hRs1qVwt+QIJnwL4Ywn67Mn6di+0mLCTCyzna
	 7woUtLLy7IC3c5RdX1HhKIsZxNNSFpPmIi9y24DkJIHaxV2cb2aMiY4bCFOuoBXFZ/
	 4vdLA93kQX6Lw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 16:20:55 +0200
Message-Id: <DBHSSQS2IALW.2OEWVKX6PY9LZ@kernel.org>
Subject: Re: [PATCH v7 3/3] rust: revocable: Document RevocableGuard
 invariants/safety and refine Deref safety
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <aliceryhl@google.com>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
X-Mailer: aerc 0.20.1
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
 <20250721010258.70567-4-marcelomoreira1905@gmail.com>
In-Reply-To: <20250721010258.70567-4-marcelomoreira1905@gmail.com>

On Mon Jul 21, 2025 at 3:01 AM CEST, Marcelo Moreira wrote:
> Refinements include:
> - `RevocableGuard`'s invariants are updated to precisely state that
>   `data_ref` is valid as long as the RCU read-side lock is held.
> - The `RevocableGuard::new` constructor is made `unsafe`, explicitly
>   requiring callers to guarantee the validity of the raw pointer and
>   RCU read-side lock lifetime.
> - A new `SAFETY` comment is added to `Revocable::try_access` to
>   justify the `unsafe` call to `RevocableGuard::new`, detailing how
>   `Self`'s type invariants and the active RCU read-side lock ensure data
>   validity for reads.
> - The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
>   is refined.
>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---
>  rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index 6d8e9237dbdf..0048de23ab44 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -106,9 +106,12 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Se=
lf> {
>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>          let guard =3D rcu::read_lock();
>          if self.is_available.load(Ordering::Relaxed) {
> -            // Since `self.is_available` is true, data is initialised an=
d has to remain valid
> -            // because the RCU read side lock prevents it from being dro=
pped.
> -            Some(RevocableGuard::new(self.data.get(), guard))
> +            // SAFETY:
> +            // - `self.data` is valid for reads because of `Self`'s type=
 invariants:
> +            //   `self.is_available` is true.
> +            // - The RCU read-side lock is active via `guard`, preventin=
g `self.data`
> +            //   from being dropped and ensuring its validity for the gu=
ard's lifetime.

This shouldn't be needed.

> +            Some(unsafe { RevocableGuard::new(self.data.get(), guard) })
>          } else {
>              None
>          }
> @@ -233,7 +236,7 @@ fn drop(self: Pin<&mut Self>) {
>  ///
>  /// # Invariants
>  ///
> -/// The RCU read-side lock is held while the guard is alive.
> +/// - `data_ref` is a valid pointer for as long as the RCU read-side loc=
k is held.
>  pub struct RevocableGuard<'a, T> {
>      // This can't use the `&'a T` type because references that appear in=
 function arguments must
>      // not become dangling during the execution of the function, which c=
an happen if the
> @@ -245,7 +248,15 @@ pub struct RevocableGuard<'a, T> {
>  }
> =20
>  impl<T> RevocableGuard<'_, T> {
> -    fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
> +    /// Creates a new `RevocableGuard`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that `data_ref` is a valid pointer to a `T` =
object,
> +    /// and that it remains valid for as long as the returned `Revocable=
Guard` is alive.
> +    /// The RCU read-side lock must be held for the duration of the guar=
d's lifetime,
> +    /// as indicated by `rcu_guard`.

This last part shouldn't be needed, as the `rcu::Guard` already
guarantees it.

---
Cheers,
Benno

> +    unsafe fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
>          Self {
>              data_ref,
>              _rcu_guard: rcu_guard,
> @@ -258,8 +269,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
>      type Target =3D T;
> =20
>      fn deref(&self) -> &Self::Target {
> -        // SAFETY: By the type invariants, we hold the rcu read-side loc=
k, so the object is
> -        // guaranteed to remain valid.
> +        // SAFETY: `self.data_ref` is valid because of `Self`'s type inv=
ariants,
> +        // and the active RCU read-side lock held via `_rcu_guard`, ensu=
ring the data's accessibility.
>          unsafe { &*self.data_ref }
>      }
>  }

