Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1255D3A9D9E;
	Wed,  1 Apr 2026 11:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042004; cv=none; b=bj2zBYwR42Z+cYaHIOjwnQaQbA74n0IpMJJZ7XHYgZqLSMQGg4+RabA6hHz3f2VVrjXMJgvDaa6RoNPs0kkzNOvHD2qMOPz8jStYK8urLPxtWuRtuJD105bScDNXxoP4vW58zoZ/tiCcepFpG0p4COyx99TVOzuSgWqpgpQrfMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042004; c=relaxed/simple;
	bh=MwMjh5g5kRE5h9nYYaKk8iYP5ks6EikFjOfbhEh6HtU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=HAoqJITWWXoPtuiE6OXKb8MAb5VILZya0tzP4/R1IVPwZtP2SZ1FnT7EMqYUcSfmXNrlpg01E7y0Rj3rdrOTConafHMz8WuvHWUYTt0G3gh8LCU6fhSsMZCE7fHhQEJHEXCgfSmp+Q33oeGK39VCHrRLGYnhtwb7YJY96Hn5Yzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmLJOkBI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmLJOkBI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3ADEC2BC9E;
	Wed,  1 Apr 2026 11:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775042003;
	bh=MwMjh5g5kRE5h9nYYaKk8iYP5ks6EikFjOfbhEh6HtU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=FmLJOkBIPS82Ee6pnuPAQG9H+sQnB2tXm/DstaowB4PcVoRloLXB7iS9QFc+j51r/
	 Ai/DkXVc1/9pVmeF0OBGJFYuBAHcdacPZmrZF1LWfSBkoKWE+Wb6w7msjXbaKVtzMT
	 Gf6SUtBHGwUH4D/74BmkI3yyctdzmBAHFTIIIbxZVl2nZrB5725sLq0zlMwjB/YwEX
	 A0tkhHiVBjOkQOmGF+3RF5Ex6X41a3zVMNJRFbbD6IxC/r9QHSFaqop1vahb9dni7R
	 eDBLU+Qf6sLxsHSHThK7QZPnCC9dsgpvGBQWOfXC8aIrcXrcRWHfknjN6SoIlPR6/2
	 /4l8xxJRmxpMA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 13:13:18 +0200
Message-Id: <DHHRVGXG8QVL.3N16SQU7K682P@kernel.org>
Subject: Re: [PATCH] rust/alloc: mention layout in Box::from_raw()
Cc: <rust-for-linux@vger.kernel.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@kernel.org>, "Liam
 R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki"
 <urezki@gmail.com>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>
To: "David Rheinsberg" <david@readahead.eu>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260401105829.173742-1-david@readahead.eu>
In-Reply-To: <20260401105829.173742-1-david@readahead.eu>

On Wed Apr 1, 2026 at 12:58 PM CEST, David Rheinsberg wrote:
> Extend the safety requirements of `Box::from_raw()` to mention that the
> layout of the allocation must match exactly. Even though the underlying
> allocators maintain allocation layout information to some degree, the
> Rust abstraction strictly requires the layout to match exactly.

One additional general note on this. I've always been more against this
additional requirement of Allocator::free() compared to our existing kernel
allocators, but eventually agreed as there may also be advantages.

This is the first time it gets a little bit in our way, since technically
Vec::into_boxed_slice() only needs to call realloc() to fulfill the safety
requirement that comes from Allocator::free().

I will keep monitoring this, and if it turns out to have more disadvantages=
 we
might want to change it.

> Suggested-by: Danilo Krummrich <dakr@kernel.org>

This should be:

Reported-by: Danilo Krummrich <dakr@kernel.org>
Closes: https://lore.kernel.org/all/DHCNOY4GFV7B.3VGGZNT3382L0@kernel.org/

Please also add a corresponding Fixes: tag.

> Signed-off-by: David Rheinsberg <david@readahead.eu>
> ---
>  rust/kernel/alloc/kbox.rs | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index 622b3529edfc..1b30c51f87ab 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -170,15 +170,16 @@ impl<T, A> Box<T, A>
>      ///
>      /// # Safety
>      ///
> -    /// For non-ZSTs, `raw` must point at an allocation allocated with `=
A` that is sufficiently
> -    /// aligned for and holds a valid `T`. The caller passes ownership o=
f the allocation to the
> -    /// `Box`.
> +    /// For non-ZSTs, `raw` must point at an allocation allocated with `=
A` with a layout
> +    /// of `Layout::for_value::<T>()`. The caller passes ownership of th=
e allocation
> +    /// to the `Box`.
>      ///
>      /// For ZSTs, `raw` must be a dangling, well aligned pointer.
>      #[inline]
>      pub const unsafe fn from_raw(raw: *mut T) -> Self {
>          // INVARIANT: Validity of `raw` is guaranteed by the safety prec=
onditions of this function.
> -        // SAFETY: By the safety preconditions of this function, `raw` i=
s not a NULL pointer.
> +        // SAFETY: By the safety preconditions of this function, `raw` i=
s not a NULL pointer and
> +        // was allocated via `A` for `Layout::for_value::<T>()`.
>          Self(unsafe { NonNull::new_unchecked(raw) }, PhantomData)
>      }

This looks good, but I think we also need this as a type invariant, can you
please add one?
