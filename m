Received: from forward500a.mail.yandex.net (forward500a.mail.yandex.net [178.154.239.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AFC271443
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 12:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359717; cv=none; b=QmWfhDIF13+0okm4DHsIxt8Xya3fadNyjGR+sPHSdhB1tptK9EtsmuFMhKjEOe6YGl5gQT9bOTKGKyn4AQUMtkQopLfE8GaPIMEgiWCJDP+l1mIoW0XXw0jVPZrTlXyJWalbbF6vRZa01jz3Fh4BprR1YkbrtaBcGxs8UV2j6b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359717; c=relaxed/simple;
	bh=jlknN1rHDAA7ZfneRXlNjh84BcO94YXqw/QVEgEOTno=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qHGgE2y9eENrCVD4OF+BKZrElbse/44Q1E30at4NlIDDhLV4DxEQUXDkBVcLaVVLFykQWzpPJmejavCrIV1vfSRe5d0eSZ8hEiE/KPMlyUwBAgaWGVMNM507o4btvyd20JaxFGlhzHh3fGuY9XvrR1hu+UP2PfPy2B6pa8pCpoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=IRkO1shE; arc=none smtp.client-ip=178.154.239.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="IRkO1shE"
Received: from mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2804:0:640:a3ea:0])
	by forward500a.mail.yandex.net (Yandex) with ESMTPS id 7440781918;
	Mon, 13 Oct 2025 15:48:25 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id LmNjLnWLwuQ0-s9X5hxep;
	Mon, 13 Oct 2025 15:48:24 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1760359704;
	bh=XdelM1XlmxTJxl+iKGxK1VsU99Qlk+BXMBcfXEngBgo=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=IRkO1shEecfWmjfRhyMGYHg/5cWvk+Ub0QAldwyBs85wuL54W8IHTVOjFXTsrNRcQ
	 AjX1j1MyqqhoD9fqBKSbGDgdd7RxwLg98EtQixBABe7F+P+SdIIrOv/MSuxN20KjxE
	 gWVFguYQKOGC9Ytl2Hna+X4UzPEtJ59SXVPMsPnQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Mon, 13 Oct 2025 15:48:19 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, tamird@gmail.com
Subject: Re: [PATCH v3 1/2] rust: add `ToResult` trait
Message-ID: <20251013154819.15149262@nimda.home>
In-Reply-To: <20251013124139.18809-2-work@onurozkan.dev>
References: <20251013124139.18809-1-work@onurozkan.dev>
	<20251013124139.18809-2-work@onurozkan.dev>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Oct 2025 15:41:38 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> Adds `ToResult` trait to handle integer return values from C
> kernel functions.
>=20
> Example:
>     let _value =3D unsafe { bindings::foo() }.to_result()?;
>=20
> This will replace the existing `error::to_result` function,
> but it will be handled in the next commit to keep the diff
> more readable.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/error.rs | 74
> ++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 74
> insertions(+)
>=20
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 1c0e0e241daa..dc566b0cef13 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -392,6 +392,80 @@ fn from(e: core::convert::Infallible) -> Error {
>  /// [Rust documentation]:
> https://doc.rust-lang.org/book/ch09-02-recoverable-errors-with-result.html
> pub type Result<T =3D (), E =3D Error> =3D core::result::Result<T, E>;=20
> +/// Trait for handling integer return values from C kernel functions
> by converting +/// them into idiomatic Rust [`Result`]s.
> +pub trait ToResult {
> +    /// The unsigned version of the integer type used for successful
> return values.
> +    type Unsigned;
> +
> +    /// Converts an integer as returned by a C kernel function to a
> [`Result`].
> +    ///
> +    /// If the integer is negative, an [`Err`] with an [`Error`] as
> given by [`Error::from_errno`]
> +    /// is returned. This means the integer must be `>=3D -MAX_ERRNO`.
> +    ///
> +    /// Otherwise, it returns the original value as an unsigned
> integer.
> +    ///
> +    /// It is a bug to pass an out-of-range negative integer.
> `Err(EINVAL)` is returned
> +    /// in such a case.
> +    ///
> +    /// # Examples
> +    ///
> +    /// This function may be used to easily perform early returns
> with the [`?`] operator
> +    /// when working with C APIs within Rust abstractions:
> +    ///
> +    /// ```
> +    /// # use kernel::error::ToResult;
> +    /// # mod bindings {
> +    /// #     #![expect(clippy::missing_safety_doc)]
> +    /// #     use kernel::prelude::*;
> +    /// #     pub(super) unsafe fn f1() -> c_int { 0 }
> +    /// #     pub(super) unsafe fn f2() -> c_int { EINVAL.to_errno()
> }
> +    /// # }
> +    /// fn f() -> Result {
> +    ///     // SAFETY: ...
> +    ///     let _value =3D unsafe { bindings::f1() }.to_result()?;
> +    ///
> +    ///     // SAFETY: ...
> +    ///     let _value =3D unsafe { bindings::f2() }.to_result()?;
> +    ///
> +    ///     // ...
> +    ///
> +    ///     Ok(())
> +    /// }
> +    /// # assert_eq!(f(), Err(EINVAL));
> +    /// ```
> +    ///
> +    /// [`?`]:
> https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-qu=
estion-mark-operator
> +    fn to_result(self) -> Result<Self::Unsigned>;
> +}
> +
> +impl ToResult for i32 {
> +    type Unsigned =3D u32;
> +
> +    fn to_result(self) -> Result<Self::Unsigned> {
> +        if self < 0 {
> +            Err(Error::from_errno(self))
> +        } else {
> +            Ok(self as u32)
> +        }
> +    }
> +}
> +
> +impl ToResult for isize {
> +    type Unsigned =3D usize;
> +
> +    fn to_result(self) -> Result<Self::Unsigned> {
> +        // Try casting into `i32`.
> +        let casted: crate::ffi::c_int =3D self.try_into().map_err(|_|
> code::EINVAL)?; +

I should do this casting only when `self < 0`, will fix it later in the
next version.

> +        if casted < 0 {
> +            Err(Error::from_errno(casted))
> +        } else {
> +            Ok(self as usize)
> +        }
> +    }
> +}
> +
>  /// Converts an integer as returned by a C kernel function to a
> [`Result`]. ///
>  /// If the integer is negative, an [`Err`] with an [`Error`] as
> given by [`Error::from_errno`] is

