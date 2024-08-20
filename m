Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A34518E347
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 08:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724141743; cv=none; b=rX0ojp1H2GjYgR609MALC1aedvysTsv8ChY49tYhYiqX6i53iFuU5u8KVpQV1eztXsheurakcyK2XHPY2J50kyefFMdO6GROYbw/SD3bQSMCSJelUpOry9h6GKjh6QGtHSaNaty5AtiyZTtl037uxS4Kqxtq3HFvm/d0o+opiI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724141743; c=relaxed/simple;
	bh=aYbhsZHDijGUSAvGc1cKIPqaxwwQ11OanMHJcyLTAJ0=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n0LtArO7o2A7TyGv8eRkUIARDvBacUigFS/HXR36fUNlET4RLq3H4gVSC6xiMfwe7WrXCi9SgyZ4qRMIEbDqdJXvwIOfonVBuR9Iwb1j3ZfbA1b10cpL8TFVnEe9KmXNxv6V4ejTjqMNSO6Y2kyJ1euPz9+XvAY38HVaX8+d3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=IdRGPwU9; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="IdRGPwU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724141739; x=1724400939;
	bh=02fTdXRZp4X3IYuyQd7hOYI4T11ORhSTP1JZNw/tgGc=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IdRGPwU9lUdhPSGESgSvS9LdY9E/foANEeHOfT+rAQ7ZN6j2mA3s6cf9mKwv5lo+r
	 Fsp/ykxj5oNjQemW/WOJ8uWCOhKyMdy/p2mb4mtAd969USly7q0TzDPcxGzNAbgaEs
	 BE9Y5eJohD/aDe7KoTkKxvCF+r2oM7jFW79bFBvEGRq0ysWE0R0pJDu+FuFPv9zjXx
	 oLL9MdfcBJ1e6XJ//Woc2JhvnRZD7sF8HoJVNmiP4LBd47rErRXsmdrUnCDei4u/aI
	 KCFAvAtH+jpgEHVla+DGlFg3HSgBosW2yexAbZZg+vrmSaLl8jKGFp1aKmc+5BU/Q/
	 QZCo+cI7vqiHQ==
Date: Tue, 20 Aug 2024 08:15:34 +0000
To: Michael Vetter <jubalh@iodoru.org>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH] rust: fix typos in documentation
Message-ID: <545c627c-4a91-483c-8613-8cf48656a9f3@proton.me>
In-Reply-To: <20240819205731.2163-1-jubalh@iodoru.org>
References: <20240819205731.2163-1-jubalh@iodoru.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 998d87f4753156cd5732266d9d1e5387ada34947
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19.08.24 22:57, Michael Vetter wrote:
> Fix spelling mistakes in code comments.
>=20
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/kernel/init/macros.rs | 4 ++--
>  rust/kernel/net/phy.rs     | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/rust/kernel/init/macros.rs b/rust/kernel/init/macros.rs
> index 02ecedc4a..9a0c4650e 100644
> --- a/rust/kernel/init/macros.rs
> +++ b/rust/kernel/init/macros.rs
> @@ -145,7 +145,7 @@
>  //!         }
>  //!     }
>  //!     // Implement the internal `PinData` trait that marks the pin-dat=
a struct as a pin-data
> -//!     // struct. This is important to ensure that no user can implemen=
t a rouge `__pin_data`
> +//!     // struct. This is important to ensure that no user can implemen=
t a rogue `__pin_data`
>  //!     // function without using `unsafe`.
>  //!     unsafe impl<T> ::kernel::init::__internal::PinData for __ThePinD=
ata<T> {
>  //!         type Datee =3D Bar<T>;
> @@ -156,7 +156,7 @@
>  //!     // case no such fields exist, hence this is almost empty. The tw=
o phantomdata fields exist
>  //!     // for two reasons:
>  //!     // - `__phantom`: every generic must be used, since we cannot re=
ally know which generics
> -//!     //   are used, we declere all and then use everything here once.
> +//!     //   are used, we declare all and then use everything here once.
>  //!     // - `__phantom_pin`: uses the `'__pin` lifetime and ensures tha=
t this struct is invariant
>  //!     //   over it. The lifetime is needed to work around the limitati=
on that trait bounds must
>  //!     //   not be trivial, e.g. the user has a `#[pin] PhantomPinned` =
field -- this is
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index fd40b703d..91dac63ff 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -491,7 +491,7 @@ impl<T: Driver> Adapter<T> {
>  pub struct DriverVTable(Opaque<bindings::phy_driver>);
>=20
>  // SAFETY: `DriverVTable` doesn't expose any &self method to access inte=
rnal data, so it's safe to
> -// share `&DriverVTable` across execution context boundries.
> +// share `&DriverVTable` across execution context boundaries.
>  unsafe impl Sync for DriverVTable {}
>=20
>  /// Creates a [`DriverVTable`] instance from [`Driver`].
> --
> 2.35.3
>=20
>=20

