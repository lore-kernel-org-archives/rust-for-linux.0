Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152011B375C
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Aug 2024 18:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724956972; cv=none; b=UJFitr5TtHYS+0+4LgVuky0TU5eEg1ALj/4RTWV/1e2W1sf0pEM5Gc5kUwZFkMF63tH8UjUQoj6tABiH193smmMGjw3zWPSA8ntdENMgRhyjM3bTRUhAhIrB2QDCb3ObP6x7MTJdyz3S1QiZsjSGgPQOlaIE3rHzJMi7uV9PXQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724956972; c=relaxed/simple;
	bh=FKzuZ92hgjikr1TymWCa05Fjh2jFE3ZTr+nuO70Y0/Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZurOjAr/B74vdIlfCKxCtyDaqc7706Pxk8/pDYgIWZoZ6bZ1/kHJ56MXaOGuuyWTJdsCjavVQwv72FMEBrlno9+5Dmrbm6Vkul8qVsN0qHBkCsD1/5dfxwIIgLHP1JcIux7LwLiyMziE6gh5C3a1Qo0EuES4rQis/WqFbQm9/G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=joWaMbs/; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="joWaMbs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724956969; x=1725216169;
	bh=IghPTrqsf0PYbIybSIdWfKQ4wloUFIsbW+NfxCoVioY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=joWaMbs/SnRJug/1Efl3lukJJ7Kh3g+2jYETUe5Uxw5upCvhOMO5R7ydgtTnvK3i2
	 usFPCfBccdLzAKFosfM2p7KxYJYFR8na5xZNJAYDVij+KQWLIHmKwHDeuGdU61wIeo
	 Z7uAE8wI/zM5AOB2+LFHfyhxpUKAwt61AIKoyn3FLurrONRfoc8IgGyhkToQPUg9Z5
	 jFoKsZUYcRFlrv4ZfA61jt69pXnXcp4nKYbZ2ztX9+J2TUw4vrJwQ2fylFdCzLmjtD
	 hwdgpbi4xbb7snqigyvsJ+c4auhQtpGmFwhoYV4wDdiZb1iHY2UzthYDUkDZuYA4PZ
	 2H9Hi7lXjhdcw==
Date: Thu, 29 Aug 2024 18:42:43 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v6 21/26] rust: alloc: implement `contains` for `Flags`
Message-ID: <9dee325e-6610-4628-8afb-d53895f7a9f1@proton.me>
In-Reply-To: <20240816001216.26575-22-dakr@kernel.org>
References: <20240816001216.26575-1-dakr@kernel.org> <20240816001216.26575-22-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 23c120e56b61df2530a0e7ade62cef2f46c6a9dc
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 16.08.24 02:11, Danilo Krummrich wrote:
> Provide a simple helper function to check whether given flags do
> contain one or multiple other flags.
>=20
> This is used by a subsequent patch implementing the Cmalloc `Allocator`
> to check for __GFP_ZERO.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/kernel/alloc.rs | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index 1feabc817d00..5c66229a7542 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -34,7 +34,7 @@
>  /// They can be combined with the operators `|`, `&`, and `!`.
>  ///
>  /// Values can be used from the [`flags`] module.
> -#[derive(Clone, Copy)]
> +#[derive(Clone, Copy, PartialEq)]
>  pub struct Flags(u32);
>=20
>  impl Flags {
> @@ -42,6 +42,11 @@ impl Flags {
>      pub(crate) fn as_raw(self) -> u32 {
>          self.0
>      }
> +
> +    /// Check whether `flags` is contained in `self`.
> +    pub fn contains(self, flags: Flags) -> bool {
> +        (self & flags) =3D=3D flags
> +    }
>  }
>=20
>  impl core::ops::BitOr for Flags {
> --
> 2.46.0
>=20

