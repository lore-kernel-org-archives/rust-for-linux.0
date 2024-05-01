Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93C31DFDE
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714553641; cv=none; b=hapsUZ6CFuR3ix8KySKPXa5hS7lteXg76GIwAEM2CB72cbbX0NPByU4f7khMs7EVzCfN3M0Y18OI236TkQfBE7CjdKG82nWHSyruvSNsFOD7kxT66sXlbn/B9Tuj9NYSGcq8QDfW1iQGo4I2Co4zEYDGqMH9iaV5+pH1O8xxhng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714553641; c=relaxed/simple;
	bh=idysozCAXfXj/SWF1ii3VsVzCTR39/RmCyHJenbV2gY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hTyEaSeENEdU99epoia1sO/9O2GYRIx0Yv2VRQOXzASeGVWLQCcsJR9SAGqTvdx8nVNfskrDoskTBNNWMskzhoNIw+TkUkMj1NJ9B63RHcqEdFfYmiTPrgZMxQH0wr5GHGmXOxxfjnWa+SvZDVO4OIoAPVhlWoNG5A/86tGaFf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=T90XUvzg; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="T90XUvzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1714553637; x=1714812837;
	bh=9VuajDc0OA6ZHpiTI6kYgWbJcseEob/tRk4dqYvZEwY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=T90XUvzgEEeoADcguMWZxoa+kSv1W1EXCZJVFxaXfkM+KT19i/68BztToGlHwKWuZ
	 IdaiTqogHAeBOJDlZjTq6Re9Lt9tgcVTLnk59BMnQB7auu2utxlSq63Rjqb2brZ0o9
	 ZAjirrLRq9BKYBy8JjgJuwCByfOyxRM1Po3N18Q3pPUHmzJsdIDTLUwOLCs4ZYcWms
	 l4YVGOMiaQfQ2+aFNFIE9cSjG3uYb1Ux3ztC0UW2rKoX4t9/cK/DifVC9l8iwQxaBE
	 IWMks88vIp1MPC9td9S9TmDzd3vlwevhSoj59EW5RUYMyspM7eRA0/KrKdSeBQn4jG
	 Z5A93Rf9Kow1w==
Date: Wed, 01 May 2024 08:53:51 +0000
To: Danilo Krummrich <dakr@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, ajanulgu@redhat.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH WIP 6/8] rust: alloc: implement BoxExtAlloc
Message-ID: <2324d22f-984d-4f92-8302-5c866f3387ac@proton.me>
In-Reply-To: <20240429201202.3490-7-dakr@redhat.com>
References: <20240429201202.3490-1-dakr@redhat.com> <20240429201202.3490-7-dakr@redhat.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 21151b10fcd9835b6f901e4e222d33165d4b04d3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 29.04.24 22:11, Danilo Krummrich wrote:
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/kernel/alloc/box_ext.rs | 40 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/alloc/box_ext.rs b/rust/kernel/alloc/box_ext.rs
> index 76653d6f4257..74d6bb24e965 100644
> --- a/rust/kernel/alloc/box_ext.rs
> +++ b/rust/kernel/alloc/box_ext.rs
> @@ -2,7 +2,7 @@
>=20
>  //! Extensions to [`Box`] for fallible allocations.
>=20
> -use super::Flags;
> +use super::{AllocatorWithFlags, Flags};
>  use alloc::boxed::Box;
>  use core::alloc::AllocError;
>  use core::mem::MaybeUninit;
> @@ -21,6 +21,19 @@ pub trait BoxExt<T>: Sized {
>      fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocErro=
r>;
>  }
>=20
> +/// Extensions to [`Box`].
> +pub trait BoxExtAlloc<T, A: AllocatorWithFlags>: Sized {

I think it would be better to put all of this stuff into the `BoxExt`
trait. Otherwise we will end up with even more extension traits...
Ditto for `VecExtAlloc`.

--=20
Cheers,
Benno

> +    /// Allocates a new box using a custom allocator.
> +    ///
> +    /// The allocation may fail, in which case an error is returned.
> +    fn new_in(x: T, alloc: A, flags: Flags) -> Result<Self, AllocError>;
> +
> +    /// Allocates a new uninitialised box using a custom allocator..
> +    ///
> +    /// The allocation may fail, in which case an error is returned.
> +    fn new_uninit_in(alloc: A, flags: Flags) -> Result<Box<MaybeUninit<T=
>>, AllocError>;
> +}
> +


