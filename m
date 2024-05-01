Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877B11D6A8
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714552336; cv=none; b=BSyF+T6fwTQeQcghJjs3CYrjBvnCZXqpx/PqDv/jiK8GXAtcIoNby5jE9ftp5egnMtfQ6Vsf51DqnCcx5k4N+F0nAt+T/WUguByeLquHuPbOQ/Mim802FKXuptgvxphEvnF02heMN9p5g0T2vNSulPgc+I/A72ZU88WX7ThTG4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714552336; c=relaxed/simple;
	bh=hqDv4Da7B+6hVQruW0+XdS8A133UBdDEbpDv8hyrM9c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q0WqbxehZOquWqp/ca+DeVtJgYshnmkwza3wKlkI8lA6E9LmCHKBEHjwJcOYVr4s2IgB+6lTdaqaS6cFkqaI6G7UcGL7GFn5j2ZKgAPcf9YjSKWxfU1DK0X9o9C0pS7ajpZz41HnvnZoNoFeu2VOjU6LfPpkTE/kKul/ZZM+K2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=VhkPEBv8; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="VhkPEBv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=fd74w4dzyfcgzee6sxxfhfr4ye.protonmail; t=1714552326; x=1714811526;
	bh=I+qGUhxZ4OEzxJnPL6XtM+PzGBnBBlE/1u/2f1TrXpw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VhkPEBv89ItlpA2mE6/2Sm0b1L3s8EYkpBsUKlWk3633yqOVHK7lDXRg5PpzqOpsK
	 QTIGZ4ywTrqgZeJ1MgcA2R88mj1diI9WSFVYjwSW3vnWMut39o/I0lhsw44sItIkOv
	 nOxGmyg7s5ykUHOA2N7nhqjXuupCPjtVydiFKM7gQScpLv7iC5gyDAzuTxHXt5SgbR
	 SMVRRsTINVD5SDOTgWGvX49T++eiKL9Qf/YU0x+3tx1UplLJz6DrmDoAZpU2+7DS+Y
	 kntqvmmOh/iHJwImZjYlZqZpXR1AnCX6nFwoZeUGIpzoyw812R47Fgfc8547W+qpQB
	 fvgJOzvaxeLdA==
Date: Wed, 01 May 2024 08:32:01 +0000
To: Danilo Krummrich <dakr@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, ajanulgu@redhat.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH WIP 3/8] rust: alloc: implement AllocatorWithFlags trait
Message-ID: <b098c9ee-a9b5-4bef-8703-ef56e6b1dcb7@proton.me>
In-Reply-To: <20240429201202.3490-4-dakr@redhat.com>
References: <20240429201202.3490-1-dakr@redhat.com> <20240429201202.3490-4-dakr@redhat.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 7ba61e4bd304b1b24843aa7c2912490e4d86676c
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
>  rust/kernel/alloc.rs | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index 9bc1b48b5641..ec45ba8f77ce 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -8,6 +8,14 @@
>  pub mod box_ext;
>  pub mod vec_ext;
>=20
> +use core::{
> +    alloc::{Allocator, AllocError, Layout},
> +    ptr,
> +    ptr::NonNull,
> +};
> +
> +use flags::*;
> +
>  /// Flags to be used when allocating memory.
>  ///
>  /// They can be combined with the operators `|`, `&`, and `!`.
> @@ -68,3 +76,16 @@ pub mod flags {
>      /// small allocations.
>      pub const GFP_NOWAIT: Flags =3D Flags(bindings::GFP_NOWAIT);
>  }
> +
> +pub unsafe trait AllocatorWithFlags: Allocator {
> +    unsafe fn alloc_flags(&self, layout: Layout, flags: Flags) -> Result=
<NonNull<[u8]>, AllocError>;
> +    unsafe fn realloc_flags(&self, ptr: *mut u8, old_size: usize, layout=
: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>;

Please use `rustfmt`, there exists a make target that does it for you.

Also why are these functions `unsafe`? You haven't specified a `Safety`
section, which means nobody knows what the requirements are.

> +
> +    fn default_allocate(&self, layout: Layout) -> Result<NonNull<[u8]>, =
AllocError> {
> +        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, GFP_KERN=
EL) }
> +    }

Why do we want to have these functions? I think that it would make sense
to forbid all other ways of allocating memory. So only allow allocation
where the flags are explicitly passed.

--=20
Cheers,
Benno

> +
> +    fn default_allocate_zeroed(&self, layout: Layout) -> Result<NonNull<=
[u8]>, AllocError> {
> +        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, GFP_KERN=
EL | __GFP_ZERO) }
> +    }
> +}
> --
> 2.44.0
>=20

