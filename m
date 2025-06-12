Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62DF1C3039
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718944; cv=none; b=UDZjvxytweHuyoMhP85zDc6EDEZjjjceVzmxYV47eq2kVtkuIXwZ1vnQN36ahp29oCfkUniaf7sZjEpj3V8keMr1THwjjiJ+z6CD7Xg70fIBn2ZBKH5YmsgXA/vPJEW561NB8e46XCfDjzr5XB+kNWw13q4ZPsvGztHfugVPQro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718944; c=relaxed/simple;
	bh=nKxS74oUG6fCAAPYA3x069XaPvrvlgU55YBXgNSCqAQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=eHHNS8oV/SHG7xzQoddl7thjMHjXzm993LSxdsZLQtMMtykEOYVtRoZdA4g7GPL9YfoR5scWOvVTvon+NSMTqqzqEJVnW/t+GWIdi7xGcrCKiIS81Zu5qMEhOy+lcsuRxHiSbJ89/rLHgRuYqO0TkXhSptoDWJj+9/A+tnml3AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0dHCdcW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0dHCdcW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086F2C4CEEA;
	Thu, 12 Jun 2025 09:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749718944;
	bh=nKxS74oUG6fCAAPYA3x069XaPvrvlgU55YBXgNSCqAQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=X0dHCdcWMCkYLRdBDndRWoG5KHlHePbzLJ3sJitDdcX+oomeU/3858lyjpcUzbmcl
	 Fz7ODRwV1qXiTuvw7jndHEWIIWSz6ODHXa0vzoa/W6RhkM6vh0oEgrpI9X5QdGu2a5
	 fAgdE23fNL6oZdvkNqUp4STWL54ENJfqfsAuVOUxF1R3vS2Q/+SX63OYRCPNmQbdKB
	 NpSNmoxvfcrYdpqeKOMBbN20p7j3G6x3ttAVC1AoJ3fDKkVVCxa2ueN2jfI64vOg3T
	 8uZ4/CDX2t3wUxkF0xakvk7a9F27agdflO/MmIdTTEGmI3nPf5ntM9ShVD6ghGd37L
	 PbXqFHjd8Ao+Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 11:02:21 +0200
Message-Id: <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>, <dakr@kernel.org>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
X-Mailer: aerc 0.20.1
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com>
In-Reply-To: <20250602232842.144304-2-marcelomoreira1905@gmail.com>

On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
> This commit clarifies the write invariant of the `Revocable` type and
> updates associated `SAFETY` comments. The write invariant now precisely
> states that `data` is valid for writes after `is_available` transitions
> from true to false, provided no thread holding an RCU read-side lock
> (acquired before the change) still has access to `data`.
>
> The `SAFETY` comment in `try_access_with_guard` is updated to reflect
> this invariant, and the `PinnedDrop` `drop` implementation's `SAFETY`
> comment is refined to clearly state the guarantees provided by the `&mut =
Self`
> context regarding exclusive access and `data`'s validity for dropping.
>
> Reported-by: Benno Lossin <lossin@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1160
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

I would have done this change after the other two, since then you can
change all the safety comments here, but if Danilo is fine with doing it
this way, then you can leave it this way.

The changes are almost perfect now, just some small formatting changes
below. With those fixed, you may add:

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/kernel/revocable.rs | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index 1e5a9d25c21b..d14f9052f1ac 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -61,6 +61,15 @@
>  /// v.revoke();
>  /// assert_eq!(add_two(&v), None);
>  /// ```
> +///
> +/// # Invariants
> +///
> +/// - `data` is valid for reads in two cases:
> +///   - while `is_available` is true, or
> +///   - while the RCU read-side lock is taken and it was acquired while =
`is_available` was `true`.
> +/// - `data` is valid for writes when `is_available` was atomically chan=
ged from `true` to `false`
> +///   and no thread that has access to `data` is holding an RCU read-sid=
e lock that was acquired prior to
> +///   the change in `is_available`.
>  #[pin_data(PinnedDrop)]
>  pub struct Revocable<T> {
>      is_available: AtomicBool,
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
> +            // SAFETY: `Self::data` is valid for reads because of `Self`=
's type invariants,

s/Self::data/self.data/

> +            // as `Self::is_available` is true and `_guard` holds the RC=
U read-side lock

s/Self::is_available/self.is_available/

Missing `.` at the end.

>              Some(unsafe { &*self.data.get() })
>          } else {
>              None
> @@ -176,9 +185,10 @@ fn drop(self: Pin<&mut Self>) {
>          // SAFETY: We are not moving out of `p`, only dropping in place
>          let p =3D unsafe { self.get_unchecked_mut() };
>          if *p.is_available.get_mut() {
> -            // SAFETY: We know `self.data` is valid because no other CPU=
 has changed
> -            // `is_available` to `false` yet, and no other CPU can do it=
 anymore because this CPU
> -            // holds the only reference (mutable) to `self` now.
> +            // SAFETY: `Self::data` is valid for writes because of `Self=
`'s type invariants,

s/Self::data/self.data/

> +            // and because this `PinnedDrop` context (having `&mut Self`=
) guarantees exclusive access,
> +            // ensuring no other thread can concurrently access or revok=
e `data`.
> +            // This ensures `data` is valid for `drop_in_place`.

This last sentence is not needed. Instead, we should mention that since
this is a `drop` function, we're only called once, so it's fine to call
drop (since that also is only allowed to be called once).

---
Cheers,
Benno

>              unsafe { drop_in_place(p.data.get()) };
>          }
>      }

