Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107FF2E338C
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 07:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160871; cv=none; b=Cj5BmT8In2b7YoqM1g1vdJhODbjAWrvM5CDqzGsums0eVd2IiYpdYPJ8Yf7xWOMllQPchnxefIwAohbEvyZ+9jzb0IDZkdfXetwhwHDm6o4glZNx2ICidtDJeiN24PKbjhfkwsa1YU9Dh9h4ziOWKC6QORzKCDO/QVmgAMLB0IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160871; c=relaxed/simple;
	bh=qIDcwwuYDMlZe5mKIKMv1DaCy2J3FxF0mcRBfqbt0pM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YjI4kYiKGrWifnnSQ7TA9D4Gn/ZMDboDQX1pWwy5oM62u+VST6ClHjdwtDNur8U+vYXM+qgszNkZ3jrTrloyjJOdYeMxXoFGQ+upI7935E1D9sE46PSPfS+VSumRC+xO7CdhUil70PCMj8ya80QO2ECk6tgZJdo9sglabnQ9gug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b59LybqI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b59LybqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8535C4CEE2;
	Wed,  5 Mar 2025 07:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741160870;
	bh=qIDcwwuYDMlZe5mKIKMv1DaCy2J3FxF0mcRBfqbt0pM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b59LybqIK0X28znRerLZ24iGQr7KaoqgO7aVJzvCgVx8B/Dj5hPdiTZUdQPJIBQtF
	 LtePJvqv44w97qKDEEQkjpHkZ6Froo/NIfmd9VjlGuy4oc+XwZOL/kCLEvi02acccU
	 57efkKK8j1huESNeZ7Ttpps7YJYMW7LM2dgOVDNSHFKTPdVAwy7seXEq7Lp2p+ynbi
	 8mvUSpxhz1EuM/R52rcir1Vj3s4H/Rq0Tbey4TJzc3S3uUGEK6Swp6fzzxKAEmySrK
	 20NBOjUVazFmYPlH0dc2/lu9BodFV42cgMP1ae8DRRloAprZRZuUM2wbWL8XaQ/6x4
	 Zhaod2NzZ/gFQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Dirk Behme" <dirk.behme@de.bosch.com>
Cc: <rust-for-linux@vger.kernel.org>,  <ojeda@kernel.org>,
  <daniel.almeida@collabora.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  "Gary Guo" <gary@garyguo.net>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor
 description
In-Reply-To: <20250305053438.1532397-2-dirk.behme@de.bosch.com> (Dirk Behme's
	message of "Wed, 05 Mar 2025 06:34:38 +0100")
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
	<hVvs4-cEyMjFMKMMqergIA4OCAIJUIfXQGi2a_uisGZaLJHUWiNtGPNASjjeprDQrtNtasMOfTrRIiYwXE2zgg==@protonmail.internalid>
	<20250305053438.1532397-2-dirk.behme@de.bosch.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 05 Mar 2025 08:47:42 +0100
Message-ID: <871pvbhqap.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Dirk Behme" <dirk.behme@de.bosch.com> writes:

> In the discussion [1] some `Opaque` documentation updates have
> been proposed. In that discussion it was clarified that `Opaque`
> is intended to be used for (partial) uninitialized or changing C
> structs. And which consequences this has for using raw pointers
> or the destruction. Improve the `Opaque` documentation by adding
> these conclusions from that discussion.
>
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Link: https://lore.kernel.org/rust-for-linux/F8AB1160-F8CF-412F-8B88-4C79D65B53A1@collabora.com/ [1]
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>
> ---
> Changes in v3:
>    * Add the "terse" proposals.
>    * Move the non-linkage artifact from patch 1/2 to here.
>
>  rust/kernel/types.rs | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index af30e9c0ebccb..f370cdb48a648 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -271,17 +271,33 @@ fn drop(&mut self) {
>
>  /// Stores an opaque value.
>  ///
> -/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
> +/// [`Opaque<T>`] opts out of the following Rust language invariants for the contained `T`
> +/// by using [`UnsafeCell`]:
>  ///
> -/// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
> -/// It gets rid of all the usual assumptions that Rust has for a value:
> +/// * Initialization invariant - the contained value is allowed to be uninitialized and
> +///   contain invalid bit patterns.
> +/// * Immutability invariant - [`Opaque<T>`] allows interior mutability.
> +/// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of shared references.

This last one is wrong (I know it's probably my fault, sorry). It should be:

  /// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusive** references.

> +///
> +/// Further, [`Opaque<T>`] is `!Unpin` and will not run the drop method of the contained `T`
> +/// when dropped.

Could you link `Unpin` here?

>  ///
> -/// * The value is allowed to be uninitialized (for example have invalid bit patterns: `3` for a
> -///   [`bool`]).
> +/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
> +/// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
> +/// This is useful for C structs that are not fully initialized (yet) or might change their
> +/// content from C side at runtime. [`Opaque<T>`] gets rid of all the usual assumptions that
> +/// Rust has for a value of type `T`:
> +///
> +/// * The value is allowed to be uninitialized or invalid (for example have invalid bit patterns:
> +///   `3` for a [`bool`]).
> +/// * By dereferencing a raw pointer to the value you are unsafely asserting that the value is
> +///   valid *right now*.
>  /// * The value is allowed to be mutated, when a `&Opaque<T>` exists on the Rust side.
>  /// * No uniqueness for mutable references: it is fine to have multiple `&mut Opaque<T>` point to
>  ///   the same value.
>  /// * The value is not allowed to be shared with other threads (i.e. it is `!Sync`).

Link `Sync` here. You might need a [`!Sync`]: `Sync` at the bottom for
it to work.

> +/// * The destructor of [`Opaque<T>`] does *not* run the destructor of `T`, as `T` may
> +///   be uninitialized, as described above.


Best regards,
Andreas Hindborg



