Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA94200110;
	Fri, 10 Jul 2026 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695699; cv=none; b=sS9xBeZshQ4ughQ0TpIawOsKgNoAEXvUKI2kH8gwywjStJOCm5kwzhfPFvmsQMHxO8mspSiafLZtGkql2IwsOsPEj07hW3Jg9/ZFIgsJSHUheWcImSABj83iRWO9bsO37DqPBQ/c3SXB0lRIF5MJtPyoTrOUO3wiS5KvnuJGZUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695699; c=relaxed/simple;
	bh=XEwZtwpYWwCzZeBA3ZlAX0xiYJJAT7t/AOuS6m+qNRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcGheOo+hFEuz/G7MLSYdNI2QcV03HScqXAwtSSyaqBaCM+ubgPZ8R9TuXORfbaT8Q4zET59krAstxlqTuNZCFDXDH3X5L7d+uwNAyCGqmGlkemHUaEU8yezHVsmJHm8CGaBj41Ka3FkLQoOzkcJcWC/iUNGBEog3iAstQI9Zm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=klzyfIH9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="klzyfIH9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC98E1F000E9;
	Fri, 10 Jul 2026 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783695697;
	bh=gGO5Rp8tKS1rBDjYqKHdVVJ5M/B3t7lpR15LxL8/hKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=klzyfIH91PHQvp8V5BXUFZMjzLp9cx6dkEY9ulH5Q8KxNhqcnnezrcFymnJWJA5Bl
	 Ein16CotdOTsRLDj8YtbaT+gh1r0UkhF5GxUS+QggAuNKwZSirYw3igHnERxZBA15u
	 6lMTBWtxBK9TrdqPT3Dp+MUxRbXoz3NmmZsU8jsI=
Date: Fri, 10 Jul 2026 17:01:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: jahnavimn@google.com
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/7] rust_binder : Implement dynamic debug logging mask
Message-ID: <2026071046-musty-subfloor-53ec@gregkh>
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>

On Fri, Jul 10, 2026 at 02:32:51PM +0000, Jahnavi MN via B4 Relay wrote:
> When a user-space application sends malformed data or makes a
> lifecycle mistake, the driver rejects it with a generic error code
> (like -EINVAL). Without internal logs, the driver acts as a
> "black box," forcing developers to guess which check failed.
> 
> In the legacy C Binder driver, this issue is solved using a dynamic
> debug_mask module parameter that toggles verbose logs for specific
> subsystems. This series brings the same critical capability to the
> Rust Binder driver to provide developers with clear, real-time
> feedback.
> 
> Instead of rebuilds, reboots, or guessing:
> - Developers can enable logs instantly on a running device by writing to 
>   `/sys/module/rust_binder/parameters/debug_mask`.
> - It prints the exact reason for failures (such as alignment errors, 
>   mismatched call stacks, or invalid handle references) directly into 
>   `dmesg`, reducing debugging time from hours to seconds.
> - It protects system logs by keeping logging off by default and only 
>   enabling it when developers are actively troubleshooting.
> 
> Based on top of:
> https://lore.kernel.org/rust-for-linux/20260707-upgrade-poll-v6-0-4b8fae7bf1d9@google.com/
> 
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>

Patches 5 and 7 did not apply to my tree, can you rebase against the
char-misc-testing branch and send just those?  Other ones are now all
queued up, nice work!

thanks,

greg k-h
