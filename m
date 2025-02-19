Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0856C1C461F
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952401; cv=none; b=qntqb8S0aRur7V1L8HwcvsJ82AK1A6sm1ESdKwM6pY34YJ9IY9Q4lZFNba85LP54F42dQHVdZ5VrnhvNJD82tSzXXYxPi7GVTggSGi2YZ5jtZthDlC3eO7Ay4FMfCgl+BF0zeUwmo3qUfx89Ym7qt2QnVXM8Ge0FujCW+mHMBxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952401; c=relaxed/simple;
	bh=ilB6+AZVQjW4QlhXgck5DQoMaIcE47j5ttP/tGFVamk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z/N3pBqBVu/egrghgUbz4DrrXaAPWrXCxsTw6GwSscTEzlDs1ru5+NpjBEZYM6sStEO25LmAp2SievGoByYI36FLUD6vpLDWwtGXTRD5iKEQ1QKZxFjgPgg3N0lQrKDAIQGg/wSMNNF9I5S8CQy/W8adDKYiJxl8SqdFZC8AYbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdKgNYZg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdKgNYZg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D7BC4CEE7;
	Wed, 19 Feb 2025 08:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952400;
	bh=ilB6+AZVQjW4QlhXgck5DQoMaIcE47j5ttP/tGFVamk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CdKgNYZg8E/hBU4iNwMswL2yi3v05TbV2ospUHXyPymspU25sLfmZYf8gCwf+sGoy
	 f0z3pOsBY7cv5AlSCGTiOhgv2SIBUfQzVEz+YkhAZ2n0cgYFQw4BwPSplM7rd9icas
	 3QHWZ7G99oDgdlAIlxbrGQpIthA8xZI9gXzxJ151byikQPbEIZ7z2GM1CVQEypoWqr
	 6Di3hW9+e4VFV1TMjnsGlqIFNugU/2wWsHA/BEQwfB2m0qGUx/SEe3BMPAx7RYMfpj
	 O0HEL3qLUw3Fb6kf0Ht6Rn/d2PVIhxgpQC7MnmwCvWCbsxK/wxYeZlWJhSuLEMwKBT
	 mYhJQi7+/emeg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Dirk Behme" <dirk.behme@de.bosch.com>
Cc: <rust-for-linux@vger.kernel.org>,  <ojeda@kernel.org>,
  <daniel.almeida@collabora.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  "Gary Guo" <gary@garyguo.net>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH v2 2/2] rust: types: `Opaque` doc: Add some destructor
 description
In-Reply-To: <20250219055516.359454-2-dirk.behme@de.bosch.com> (Dirk Behme's
	message of "Wed, 19 Feb 2025 06:55:16 +0100")
References: <20250219055516.359454-1-dirk.behme@de.bosch.com>
	<qR15TFA5w7m-em7Om-XpDqJvZbPA4T-_wgdtpb2lzfqhHWXVz6MT3cIurrB2_JbUbNqqlffrtGTN8cSUrtTL1A==@protonmail.internalid>
	<20250219055516.359454-2-dirk.behme@de.bosch.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 19 Feb 2025 09:06:26 +0100
Message-ID: <87seoae4u5.fsf@kernel.org>
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
> ---
> Changes in v2:
>  * Split patch into two (Miguel)
>  * Improve commit message and subject (Miguel)
>
>  rust/kernel/types.rs | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 8ed802444c594..08ff4949d2a61 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -274,14 +274,20 @@ fn drop(&mut self) {
>  /// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
>  ///
>  /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
> -/// It gets rid of all the usual assumptions that Rust has for a value of type `T`:
> -///
> -/// * The value is allowed to be uninitialized (for example have invalid bit patterns: `3` for a
> -///   [`bool`]).
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
> +/// * The destructor of [`Opaque<T>`] does *not* run the destructor of `T`, as `T` may
> +///   be uninitialized, as described above.

Thanks for clarifying the docs. What you write is correct, but I would
prefer a more terse and formal language, at least for the first
paragraph. Perhaps you can include the following in some form:

  > Opaque opts out of the following rust language invariants for the
  > contained `T`:
  > 
  > - Initialization invariant - the contained value is allowed to be
  >   uninitialized and contain invalid bit patterns.
  > - Immutability invariant - `Opaque` allows interior mutability.
  > - Uniqueness invariant - `Opaque` allows aliasing of shared references.
  > 
  > Further, `Opaque` is `!Unpin`.

And then after that paragraph, you could elaborate with examples and so forth?

Best regards,
Andreas Hindborg


