Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0BF156F45
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 09:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719079; cv=none; b=s1CcI1uCaY6C49KZBv+CP84iZDwnbPGBBMEwuEgaxpswqezJ/J3pTggArZV+Oz0klJggaNhcyh0yF/oFToKfaOC/OanHV4xqy4/4H7jYWS/4OoPhQzBR7DuKffHrsHuZq2BVM8zfbSRVfjPwNT9OBKI3/zUYUPrdWfICZoU+Rps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719079; c=relaxed/simple;
	bh=vu8AGyM1c2C0L9TrY3Zs5vCdz8kAyVr+7JA7Jt5/tOs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:
	 References:In-Reply-To; b=BV6DpRvtV2bGsmHKiVnq8JztcFIeu4hRq6g+3vsKxLFq/uC9B/df200TN2xgeQQy+3xX+gHHHmD4W/4SBoWXIIdxLJ999jzQOyC+6itV0m0uS98mXAc68+PpxEJAv3ZL8x3p7+kH4/Ww0hEOQ4tFkBU3u9UjJoT38IhzcoL1VZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOAnSGe3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOAnSGe3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C72C4CEEA;
	Thu, 12 Jun 2025 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749719078;
	bh=vu8AGyM1c2C0L9TrY3Zs5vCdz8kAyVr+7JA7Jt5/tOs=;
	h=Date:To:Subject:From:References:In-Reply-To:From;
	b=NOAnSGe3dLIwas87EoULiSsy1VbN2BW3HF9sxoDXwZeycu0B0KH/gzpEnh9Rv+nix
	 vK3dvn3eMcsyXAZ/iNL1Jnq0rdtT2NTZybFUAG5idbZHWwzu8cUkpJNVE0JpejFexR
	 B59PukLDhnhZ1rShyOtWLf87xFjZfwYiVFF2ucrXYtNxDBHOA4KgOp+rDjHkDnNIcO
	 ZX3sUrusKrBpvOJyoGyuvNA7nYARa0FdPxIurtursTLyF1wG1RES+wTVF90goP1WJ1
	 cVixbrHFqcEbGY4AF0eeQAivP3OANh5vi/+2wa2h49VN9ol4f3jjB9LeNRJ96lmpoi
	 LIa8RX0+sXawg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 11:04:35 +0200
Message-Id: <DAKFNAO5O1OJ.20022X2NIFRE2@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>, <dakr@kernel.org>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for
 internal safety
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-3-marcelomoreira1905@gmail.com>
In-Reply-To: <20250602232842.144304-3-marcelomoreira1905@gmail.com>

On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
> This commit refactors `RevocableGuard` to hold a direct reference
> (`&'a T`) instead of a raw pointer (`*const T`). This makes the guard
> internally safe, reducing the need for `unsafe` blocks in its usage
> and simplifying its implementation.
>
> The `try_access` function is updated to leverage `try_access_with_guard`
> and `map` to construct the `RevocableGuard` in a more idiomatic and safe
> Rust way, avoiding manual pointer operations. The associated invariants
> and `SAFETY` comments for `RevocableGuard` itself are removed as its
> safety is now guaranteed by its type definition.
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---
>  rust/kernel/revocable.rs | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
>
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index d14f9052f1ac..43cc9bdc94f4 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -105,13 +105,7 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Se=
lf> {
>      /// because another CPU may be waiting to complete the revocation of=
 this object.
>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>          let guard =3D rcu::read_lock();
> -        if self.is_available.load(Ordering::Relaxed) {
> -            // Since `self.is_available` is true, data is initialised an=
d has to remain valid
> -            // because the RCU read side lock prevents it from being dro=
pped.
> -            Some(RevocableGuard::new(self.data.get(), guard))
> -        } else {
> -            None
> -        }
> +        self.try_access_with_guard(&guard).map(|data| RevocableGuard::ne=
w(data, guard))

My intuition tells me that the borrow checker will complain here, have
you tested it?

---
Cheers,
Benno

>      }
> =20
>      /// Tries to access the revocable wrapped object.
