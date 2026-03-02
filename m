Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7C2317155;
	Mon,  2 Mar 2026 18:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477770; cv=none; b=lBjxti0AcQ9Ahr7jNn1HExQsU4Y/0BRn3npPgaHE7vwDB3/Y1HYzHm6hRnaRtz5MyVw4KBG2hxDUa4g8faPfZ0FEBH/LXvv7wm77F56mT/sSgE4FHo01P3Y2vZQrE61sLIptZwzUWIpTn8nGxm5BHinbSQAX3AXAtI+9Nv/Nxvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477770; c=relaxed/simple;
	bh=v6FFhSD8dJyILCfeTNcqw1mFWE96MGcIFsHdhsBj1lY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ee9eQq9083tYxe952AagRSba+ZBcrRKlhWqixZeOTLzDnSX0XRo11tJnm0D7Yry34/yNspNEobbN4hSFBWfGVXVl5PH1JySxvFgsf/j+49w9Si3SNJziJ12gniH90vTY0GKLS+kPLfAF+eyfGgI5IJxISvVvlSAMlCNxhqVXXGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nb01fDBd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nb01fDBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5B6C19423;
	Mon,  2 Mar 2026 18:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772477769;
	bh=v6FFhSD8dJyILCfeTNcqw1mFWE96MGcIFsHdhsBj1lY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nb01fDBdSYSwpb21hjvFrG9YDrhrrTzK6Hu3fws2haYQi0XJn4VFPVi8XYGzePeqn
	 kmsKbURGNb6xJeU9c8hmkv8wLOeueNcJ5dEOItiZI43EQ8fz9YAnu4Zd0Asl9z8b/F
	 +cR9Kw8lGpMUA5cLmCcH1nZR7zt0n77l1VtWClu8r56BWTKW9yo/I6Bjmd0bmk26DT
	 wEaWXW7Cd1dJotjAVsev3x1O00qWxA6+97aUT6a9ivUj98X/DhX/t2zRHt36J3v3gz
	 9sO6CJKQaFHaNGPfkTwORxThPMGpzbW/JX/0viTTS9elC4NbGovfOoPQeeZ8KfmNF0
	 wpAQUDehPQTkg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 19:56:06 +0100
Message-Id: <DGSIXGQW5ALN.226YQUWPHZXVC@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] rust: ptr: add `KnownSize` trait to support DST
 size info extraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302164239.284084-1-gary@kernel.org>
 <20260302164239.284084-2-gary@kernel.org>
In-Reply-To: <20260302164239.284084-2-gary@kernel.org>

On Mon Mar 2, 2026 at 5:42 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Add a `KnownSize` trait which is used obtain a size from a raw pointer's
> metadata. This makes it possible to obtain size information on a raw slic=
e
> pointer. This is similar to Rust `core::mem::size_of_val_raw` which is no=
t
> yet stable.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Found a typo below.

> ---
>  rust/kernel/lib.rs |  1 +
>  rust/kernel/ptr.rs | 27 ++++++++++++++++++++++++++-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3da92f18f4ee..510cc7fe4961 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -20,6 +20,7 @@
>  #![feature(generic_nonzero)]
>  #![feature(inline_const)]
>  #![feature(pointer_is_aligned)]
> +#![feature(slice_ptr_len)]
>  //
>  // Stable since Rust 1.80.0.
>  #![feature(slice_flatten)]
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index 5b6a382637fe..cf980a103acf 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -2,7 +2,10 @@
> =20
>  //! Types and functions to work with pointers and addresses.
> =20
> -use core::mem::align_of;
> +use core::mem::{
> +    align_of,
> +    size_of, //
> +};
>  use core::num::NonZero;
> =20
>  /// Type representing an alignment, which is always a power of two.
> @@ -225,3 +228,25 @@ fn align_up(self, alignment: Alignment) -> Option<Se=
lf> {
>  }
> =20
>  impl_alignable_uint!(u8, u16, u32, u64, usize);
> +
> +/// Trait to represent compile-time known size information.
> +///
> +/// This is a generalization of what [`size_of`] which works for dynamic=
ally sized types.

s/what//

Cheers,
Benno

> +pub trait KnownSize {
> +    /// Get the size of an object of this type in bytes, with the metada=
ta of the given pointer.
> +    fn size(p: *const Self) -> usize;
> +}
> +
> +impl<T> KnownSize for T {
> +    #[inline(always)]
> +    fn size(_: *const Self) -> usize {
> +        size_of::<T>()
> +    }
> +}
> +
> +impl<T> KnownSize for [T] {
> +    #[inline(always)]
> +    fn size(p: *const Self) -> usize {
> +        p.len() * size_of::<T>()
> +    }
> +}

