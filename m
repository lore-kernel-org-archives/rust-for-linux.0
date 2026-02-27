Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4707430DEDD;
	Fri, 27 Feb 2026 23:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772234095; cv=none; b=tH+ZRaro0ghMbypWKEta9APigbizoGm0KqaoytYmwaMuyJT53G7wJIfy9/DbfjD0BN2uM+/RNbAd3llOGbpsRIobeKo0VE0/RESVay4M0ppAzfxyoJ3x/Y7twuJEVZTma0hQqxy06diZHHdl/tYqio5ag5g57OmFL9YsxDS8ghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772234095; c=relaxed/simple;
	bh=D130JPFJnEF0JHKxXW9sgh9ZIyECb/qVEm/jGQihWOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7rji5GgLiarVZihUXarsbK6T8l/iKlPjlH8a65AY5H/D5OjDxpRRRYuT8MwjwOByU18UctVvsRvknJZUeMssEHbYWQ84HDZBfO63SlEAZxtx6ahZqBBhXppxlW2cN480pcu6TXuljTL+phU1eO0fR2S2LkfpClGS/XIaQCfMW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BGmbmVoT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BGmbmVoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2912EC19422;
	Fri, 27 Feb 2026 23:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772234094;
	bh=D130JPFJnEF0JHKxXW9sgh9ZIyECb/qVEm/jGQihWOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGmbmVoTwQCW7SgTp24n4sAHXY7S3HfmuSFKYBP+KtyXWOXF/ezGMId2Of8a97TPZ
	 whld2+uxlBLV5VlbiEIF4LQX2Rjvb5TBIq2IjXTcCZKE18MX0vzGwqtIWa4gRzdyCR
	 JHzSZWluRBmyfihlaZibB69RL87PsPzOd5o2M2XA=
Date: Fri, 27 Feb 2026 18:14:43 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Wood <thepacketgeek@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Breno Leito <leitao@debian.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rust: console: add abstraction for kernel console
 drivers
Message-ID: <2026022704-xbox-comfort-2493@gregkh>
References: <20260227215357.667257-1-thepacketgeek@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227215357.667257-1-thepacketgeek@gmail.com>

On Fri, Feb 27, 2026 at 01:53:56PM -0800, Matthew Wood wrote:
> Add a safe Rust abstraction for the kernel's `struct console`,
> enabling console drivers to be implemented in Rust that provides:
> 
>   - `ConsoleOps` trait with a required `write` callback and an
>     optional `setup` callback, mirroring the C console_operations
>     interface. The trait requires `Send + Sync` to reflect that
>     console write may be called from any context including IRQ.
> 
>   - `Console<T>` struct that wraps `struct console` using pin-init
>     and `Opaque<T>`, with automatic unregistration via `PinnedDrop`.
>     Registration is performed through a pin-initializer returned by
>     `Console::register()`, which uses `pin_chain` to set the data
>     pointer and call `register_console()` after the struct is pinned.
> 
>   - `ConsoleOpsAdapter<T>` that provides the extern "C" callbacks
>     bridging from the kernel's function pointers to the Rust trait
>     methods. The `#[vtable]` attribute on `ConsoleOps` enables
>     compile-time detection of whether `setup` is implemented via
>     `T::HAS_SETUP`.
> 
>   - Console flag constants re-exported from the C `enum cons_flags`.
> 
> C helper functions are added for `register_console()`,
> `unregister_console()`, and `console_is_registered()` as these are
> either inlines or macros that cannot be called directly from Rust
> through bindgen.
> 
> This abstraction is a dependency for a Rust netconsole implementation
> I am working on.

I'd prefer to see it then, with the user, before even reviewing this
one, sorry.  That way we "know" it at least works for you.

thanks,

greg k-h
