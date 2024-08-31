Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5975168488
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Aug 2024 20:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725137299; cv=none; b=f2/MiOQYWP1LLierDokIc8g8Y21WR0vm0/E8dd9s8M3P6VVpk85gFF3PrdfQMTXesRwCUxy71ZkGU7l83kfC1L291WegVkgl6rL6rs/ikbG3g/8a1ETgEC849oIcDjyXR0MX2E/lONjPsSp1k3+DE8FYQpnGHEa+QI672PuBfZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725137299; c=relaxed/simple;
	bh=q6JwDve5dpO3jSDZ97oFuOpo/UQZcbbRvp2RMOUwvxk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YqXibr89vK+MFf5DVLCUf61k6cDZTYE0ZLpvOkEPOQdFhsVhFKAk15PG4aaq69v1FViM75aS9b7yVv81/MwkwWgU8/ZwfgTdNXPVcfHHQHKdwYw0THvVrcXO7+Xpc4r/hhw44qk+drJQ9RvRXLnNayK+hC3Q2QYVvmyQC0SZiIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=DOAYOJU2; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="DOAYOJU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1725137295; x=1725396495;
	bh=ebRAKkZuf6ZT9J7pMWomz6AC19CcOPDVcG3khEKxHxI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DOAYOJU21xIA9lXHU2mAqiSy75rdNzFY9HsTJ8V1guS1U6lIwOX+vr0SwGlr4mmhW
	 A8pgwx0PvFkFUWtgtpeVQ65uIlLATuCqbbu47fHu3EVWqbSxkfPeEtzilC6Jldm3WL
	 P2uBurAc3ejbxmHcs8L8o8DHqXJhZNY+CeVb+rMsrCsEQU7BMj/+xlFcnEQdVLYylc
	 Ku7N4mDO7z4Xpgaeb7pzw4z5thvhJToRr9rcFuEscjmrtMTx8RhikIfcC1rKzFY0MM
	 tFsuLmYzSrjVlipSYpahQ3QHIUVDNuV/pAhPCROSaKFQIsZsT15D6aw8XW4CLjnxKf
	 ONAJWbAjHqSKg==
Date: Sat, 31 Aug 2024 20:48:10 +0000
To: Boqun Feng <boqun.feng@gmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [RFC PATCH] rust: Provide correct provenance when constructing THIS_MODULE
Message-ID: <8df8ce27-b3b2-4cf2-926d-424456b0c7d2@proton.me>
In-Reply-To: <20240828180129.4046355-1-boqun.feng@gmail.com>
References: <20240828180129.4046355-1-boqun.feng@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: c5d3738a7104647d7b873e9e84f820256fdef060
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28.08.24 20:01, Boqun Feng wrote:
> Currently while defining `THIS_MODULE` symbol in `module!()`, the
> pointer used to contruct `ThisModule` is derived from an immutable
> reference of `__this_module`, which means the pointer doesn't have
> the provenance for writting, and that means any write to that pointer
> is UB regardless of data races or not. However, the usage of
> `THIS_MODULE` includes passing this pointer to functions that may write
> to it (probably in unsafe code), and this will create soundness issues.
>=20
> One way to fix this is using `addr_of_mut!()` but that requires the
> unstable feature "const_mut_refs". So instead of `addr_of_mut()!`,
> an extern static `Opaque` is used here: since `Opaque<T>` is transparent
> to `T`, an extern static `Opaque` will just wrap the C symbol (defined
> in a C compile unit) in an `Opaque`, which provides a pointer with
> writable provenance via `Opaque::get()`. This fix the potential UBs
> because of pointer provenance unmatched.
>=20
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/macros/module.rs | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 571ffa2e189c..aef3b132f32b 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -217,7 +217,11 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream=
 {
>              // freed until the module is unloaded.
>              #[cfg(MODULE)]
>              static THIS_MODULE: kernel::ThisModule =3D unsafe {{
> -                kernel::ThisModule::from_ptr(&kernel::bindings::__this_m=
odule as *const _ as *mut _)
> +                extern \"C\" {{
> +                    static __this_module: kernel::types::Opaque<kernel::=
bindings::module>;
> +                }}
> +
> +                kernel::ThisModule::from_ptr(__this_module.get())
>              }};
>              #[cfg(not(MODULE))]
>              static THIS_MODULE: kernel::ThisModule =3D unsafe {{
> --
> 2.45.2
>=20

