Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB031F708D;
	Tue, 21 Jan 2025 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737482418; cv=none; b=D/tU+wmkdu3ayjrD4PQwAnwGmmhqUMCRCsgRShujJLJxabrM5JMNk1sg+OEbZyBU38gfnZGNZRNfSOAu0IhJz2K2SgaxR26bdSpwwUnOhniq6O32cL3SoAIExafcgLRI+NZLKW+TUgsON7h2ZpvG6/1kVv9Oyq2FpN8ePapI0BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737482418; c=relaxed/simple;
	bh=37cjjl1TG3Xq09dUkvYHVZCFYXP38UCs+GqlH+FjHtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Thkw2+vuXl9c9OQLHOmryRQMjjGc9WL8ZqPn9ZcjqNOUjB+ZO35FhfY9u4K8/dCB2EQTuxJwgJZcKhw3aIOkd+uedvpWRt59UkDsXReAFhVr39dh8PKtrXHbKAv304AgxsXaFD29OuAgzRtRcu9P9XUItb+OihN739EPZ24lKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=e2i7Esf6; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="e2i7Esf6"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1737482405; bh=rUo4iaiLaJXcZ336nFRGhecV1ufvOB7f3TDPeqQYe8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e2i7Esf6T6ikfKU91N9JGs6ahuDf/Jav/EZHFNK5fDQN6erBXxIddQSEw+CFRdc9/
	 w1hUHBAsQGsiPwmoRYWlC6yER6M8XE1pskQOvoUYXLmBXLdQ/pFFAa8g96KD33RlZe
	 kJCrOomxJMndSghTS3U28gUvbycgJqf898oFiaSA=
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: kernel: add support for bits/genmask macros
Date: Tue, 21 Jan 2025 19:00:04 +0100
Message-ID: <D5E5D05F-96B1-446A-8070-2E7561F2886A@kloenk.dev>
In-Reply-To: <20250121-topic-panthor-rs-genmask-v3-1-5c3bdf21ce05@collabora.com>
References: <20250121-topic-panthor-rs-genmask-v3-1-5c3bdf21ce05@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



On 21 Jan 2025, at 16:29, Daniel Almeida wrote:

> In light of bindgen being unable to generate bindings for macros,
> manually define the bit and genmask C macros in Rust.
>
> Bit and genmask are frequently used in drivers, and are simple enough t=
o
> just be redefined. Their implementation is also unlikely to ever change=
=2E
>
> These macros are converted from their kernel equivalent. Since
> genmask_u32 and genmask_u64 are thought to suffice, these two versions
> are implemented as const fns instead of declarative macros.
>
> ---
> Changes in v3:
> - Changed from declarative macro to const fn
> - Added separate versions for u32 and u64
> - Link to v2: https://lore.kernel.org/r/20241024-topic-panthor-rs-genma=
sk-v2-1-85237c1f0cea@collabora.com
>
> Changes in v2:
>
> - Added ticks around `BIT`, and `h >=3Dl` (Thanks, Benno).
> - Decided to keep the arguments as `expr`, as I see no issues with that=

> - Added a proper example, with an assert_eq!() (Thanks, Benno)
> - Fixed the condition h <=3D l, which should be h >=3D l.
> - Checked that the assert for the condition above is described in the
>   docs.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

> ---
>  rust/kernel/bits.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs  |  1 +
>  2 files changed, 43 insertions(+)
>
> diff --git a/rust/kernel/bits.rs b/rust/kernel/bits.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..32049abd2078525be25b57b=
8e6b5948d1eecbf9f
> --- /dev/null
> +++ b/rust/kernel/bits.rs
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Bit manipulation macros.
> +//!
> +//! C header: [`include/linux/bits.h`](srctree/include/linux/bits.h)
> +
> +/// Produces a literal where bit `n` is set.
> +///
> +/// Equivalent to the kernel's `BIT` macro.
> +pub const fn bit(n: u32) -> u64 {
> +    1 << n
> +}
> +
> +/// Create a contiguous bitmask starting at bit position `l` and endin=
g at
> +/// position `h`, where `h >=3D l`.
> +///
> +/// # Examples
> +/// ```
> +///     use kernel::bits::genmask_u64;
> +///     let mask =3D genmask_u64(39, 21);
> +///     assert_eq!(mask, 0x000000ffffe00000);
> +/// ```
> +///
> +pub const fn genmask_u64(h: u32, l: u32) -> u64 {
> +    assert!(h >=3D l);
> +    (!0u64 - (1u64 << l) + 1) & (!0u64 >> (64 - 1 - h))
> +}
> +
> +/// Create a contiguous bitmask starting at bit position `l` and endin=
g at
> +/// position `h`, where `h >=3D l`.
> +///
> +/// # Examples
> +/// ```
> +///     use kernel::bits::genmask_u32;
> +///     let mask =3D genmask_u32(9, 0);
> +///     assert_eq!(mask, 0x000003ff);
> +/// ```
> +///
> +pub const fn genmask_u32(h: u32, l: u32) -> u32 {
> +    assert!(h >=3D l);
> +    (!0u32 - (1u32 << l) + 1) & (!0u32 >> (32 - 1 - h))
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index b5f4b3ce6b48203507f89bcc4b0bf7b076be6247..4f256941ac8fbd1263d5c01=
4a0ce2f5ffb9d1849 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -27,6 +27,7 @@
>  extern crate self as kernel;
>
>  pub mod alloc;
> +pub mod bits;
>  #[cfg(CONFIG_BLOCK)]
>  pub mod block;
>  mod build_assert;
>
> ---
> base-commit: 91e21479c81dd4e9e22a78d7446f92f6b96a7284
> change-id: 20241023-topic-panthor-rs-genmask-fabc573fef43
>
> Best regards,
> -- =

> Daniel Almeida <daniel.almeida@collabora.com>
