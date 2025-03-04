Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D09E2046BF
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741097383; cv=none; b=b/UQe/AaMHJQZZAQeyPlXgVdnEwBEC7+B1Qx6PAfP4h6T9Q9LM9PUJe52OKbl4DMaO8MdKNDkVOpHmCqrnV7ttvuQhA2yiczrQwuBCojgWab590ooC4JkMbTeOqJE7Q9kfU+ekbjwwjAYPxT88B4YUCcy6vI+FdSoZr/T9ne8eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741097383; c=relaxed/simple;
	bh=dnHPUjq8eduqn8KgAEX7Ky6SrO3HDzkX+wcyjSl5xcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKVjhy5A0t/HSHkPxKPbp0bgapa9p0uRsIjukra68y/tfw7pCFIbW8Hwlxcr1qF+iIU7HcfKXH+tJ5s7bQj7TPPr2Yf8HJJS2OYXMNwWZFRYq9A21UwaEqm7v4MZRdmrNTgTPEUZMaVX6Il2DOPjyv9edyGSt7CzHkkBaqkFG2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ykC26axd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ykC26axd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7587C4CEE5;
	Tue,  4 Mar 2025 14:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741097383;
	bh=dnHPUjq8eduqn8KgAEX7Ky6SrO3HDzkX+wcyjSl5xcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ykC26axdEL+5vSBdfSpvJB9m7x9XhyBKQ79RJNiRuQlZ50OZLLGJcp4dlq+zw9xU4
	 1UWicdwdh7MX4L/jjyvF/lDUE4D3L0D3zfic++FkX88q0rbzUI4EuqOMLHi1gJ5apC
	 iMEtuLl3RqRQ1DSfh63KcRVCermfokk3jPnaInh0=
Date: Tue, 4 Mar 2025 15:09:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, daniel.almeida@collabora.com,
	rust-for-linux@vger.kernel.org, felipe_life@live.com
Subject: Re: [PATCH] rust: add new macro for common bitwise operations
Message-ID: <2025030439-sharpener-overkill-ada2@gregkh>
References: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>

On Tue, Mar 04, 2025 at 09:55:11AM -0300, Filipe Xavier wrote:
> We have seen a proliferation of mod_whatever::foo::Flags
> being defined with essentially the same implementation
> for bitAnd, bitOr, contains and etc.
> 
> This macro aims to bring a solution for this,
> allowing to generate these methods for user-defined structs.
> With some use cases in KMS and VideoCodecs.
> 
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
> ---
>  rust/kernel/bitmask.rs | 171 +++++++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs     |   2 +
>  rust/kernel/prelude.rs |   1 +
>  3 files changed, 174 insertions(+)
> 
> diff --git a/rust/kernel/bitmask.rs b/rust/kernel/bitmask.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..8d26a541c693a2cb60096059ecb708d895bb3ad1
> --- /dev/null
> +++ b/rust/kernel/bitmask.rs
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Bitmask utilities for working with flags in Rust.
> +
> +/// Declares a bitmask type with its corresponding flag type.
> +///
> +/// This macro generates:
> +/// - Implementations of common bitwise operations (`BitOr`, `BitAnd`, etc.).
> +/// - Utility methods such as `.contains()` to check flags.
> +///
> +/// # Examples
> +///
> +/// Defining and using a bitmask:
> +/// ```
> +/// bitmask!(Permissions, Permission, u32);

Nice, but why not use the same api/names that are already in the kernel
for this type of functionality in the C .h files?  That way we have
consistent names everywhere?

thanks,

greg k-h
