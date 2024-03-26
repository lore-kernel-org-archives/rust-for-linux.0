Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308B912BE93
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711462104; cv=none; b=O2VvOddanP4l6CVKwXN/py5KUCkVRqvXeMWmtBwtu8lE9OyZx++bQXQDvdNr2FtwuWp0VWANFb45g/aY/49FtrgV4cqfrtU0EyH0spNXVCEYgQL0+eF8JrYSxjEaXHCJLMg/SGZKRiAPAdTmYLqR/Cd1vCIzqMeYEmzh39FNXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711462104; c=relaxed/simple;
	bh=nXoAUhc7XKG3E9m4AJ3lF49JqT9r8jaxsr9VCcXGEiU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rpGUSTYbXemYDkFhTePKwvZ0CB7JddwAEGmnofdP7doUcy0w7+SMyVEBoX7mdCm8T1Yq3fmi4V3GesnNUdR1P7G7pAV125XdrGtzqDj3lntBNKzO0XUtsBVsbsFcrLucpd4KsHzwS4aTRvVNOwdTHw0TP12R/ggbQD0LtLcyX/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=N6Adbbgg; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="N6Adbbgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1711462099; x=1711721299;
	bh=ygtCkVMY1u+TmO6tCQeJusdDZZEhvhbXgk+XZTvcwDA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=N6AdbbggLgumVhxke7MmXSZKAMa/y/7nIj0WqHxG8PAgIXF3s87P7fTpf9rPcpZR+
	 2frHZ22MGhZOaMcGxm1/v0y9HD+sWktcOrUYvjtQ+YCk1K2O0JOe1HlL9mx0QXRr3w
	 Vly60E1DZQQbaEsBqKCjmDm2A1f65aEEV4Yjp4om6bv5kXBFVpAAKYoY2s/ntPeNjQ
	 mp9u8J4Ln5sOz9aynHG5xjq80/ii4JfnW5LIeBO8G5sRRFncZpbIU886ezAhqGtcpS
	 kxxOiuin9cRSZZDjEA9LiLn2vxlBDh+B+//hQZkPCp5NzUh+zKAtgLLKlaXLcWTaot
	 Gt0oHf1SW7o0w==
Date: Tue, 26 Mar 2024 14:08:10 +0000
To: Wedson Almeida Filho <wedsonaf@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [PATCH 09/10] rust: init: update `init` module to take allocation flags
Message-ID: <kiqpEglPExNZBB0TsooPwQsQTwFfYadAnVfztU9sFzYJ5CU_Rg0PC_KYEQF4duxv7qOo6gOBUFVnR-GfuEsIEYqgBSWnOGEZAcl3t06cB2s=@proton.me>
In-Reply-To: <20240325195418.166013-10-wedsonaf@gmail.com>
References: <20240325195418.166013-1-wedsonaf@gmail.com> <20240325195418.166013-10-wedsonaf@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 25.03.24 20:54, Wedson Almeida Filho wrote:
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>=20
> This is the last component in the conversion for allocators to take
> allocation flags as parameters.
>=20
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> ---
>   rust/kernel/init.rs               | 49 ++++++++++++++++---------------
>   rust/kernel/sync/arc.rs           | 17 ++++++-----
>   rust/kernel/sync/condvar.rs       |  2 +-
>   rust/kernel/sync/lock/mutex.rs    |  2 +-
>   rust/kernel/sync/lock/spinlock.rs |  2 +-
>   rust/kernel/workqueue.rs          | 13 +++++---
>   6 files changed, 47 insertions(+), 38 deletions(-)

One formatting issue below, with that fixed:

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 077200f5350b..af539c5eb4bc 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -565,13 +565,16 @@ pub fn new(value: T, flags: Flags) -> Result<Self, =
AllocError> {
>       }
>=20
>       /// Tries to allocate a new [`UniqueArc`] instance whose contents a=
re not initialised yet.
> -    pub fn new_uninit(_flags: Flags) -> Result<UniqueArc<MaybeUninit<T>>=
, AllocError> {
> +    pub fn new_uninit(flags: Flags) -> Result<UniqueArc<MaybeUninit<T>>,=
 AllocError> {
>           // INVARIANT: The refcount is initialised to a non-zero value.
> -        let inner =3D Box::try_init::<AllocError>(try_init!(ArcInner {
> +        let inner =3D Box::try_init::<AllocError>(
> +            try_init!(ArcInner {
>               // SAFETY: There are no safety requirements for this FFI ca=
ll.
>               refcount: Opaque::new(unsafe { bindings::REFCOUNT_INIT(1) }=
),
>               data <- init::uninit::<T, AllocError>(),
> -        }? AllocError))?;
> +        }? AllocError),
> +            flags,
> +        )?;

The indentation looks wrong, rustfmt sadly cannot handle the pin-init
macros. This looks better to me:

        let inner =3D Box::try_init::<AllocError>(
            try_init!(ArcInner {
                // SAFETY: There are no safety requirements for this FFI ca=
ll.
                refcount: Opaque::new(unsafe { bindings::REFCOUNT_INIT(1) }=
),
                data <- init::uninit::<T, AllocError>(),
            }? AllocError),
            flags,
        )?;

--=20
Cheers,
Benno

>           Ok(UniqueArc {
>               // INVARIANT: The newly-created object has a refcount of 1.
>               // SAFETY: The pointer from the `Box` is valid.
