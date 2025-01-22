Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D67213E86;
	Wed, 22 Jan 2025 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737558491; cv=none; b=mMf8XnznkS63VNAz2CE/RVdZhNNidFvjlUOQAKyaXU2TDVm/4+08JxXmrGQxVP6Jjs6bqH79N1qUbx0SfQKw7Xx6KWd6KZeXxsjRza/QUzvbQIfwBbaRflaJ5RRwRJpcyyz+1MA8XoOGN3L8LcJg6onUMbwAmzGV9vU3TIj1uEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737558491; c=relaxed/simple;
	bh=B7JdbG9FVbjuBUoY9BY+ObUinkVxNf1+0mnCp9W/dIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtppEOqAo2kx8nGPh8wHJEfDBucZAzwkWhIvEWkSzokKYXZ7nB5OnGwRpr98t46IP6DNkSF6rQMMqLUrdRx87k5R4p461BYVxCRVUKCSMEUPumjR8NWk8G2k+7qYlprv7yixGK/xoLRqfKqMKzEbE9mWKj2E0nlU+aOO5847QG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcF1DlrZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcF1DlrZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EBCC4CED2;
	Wed, 22 Jan 2025 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737558490;
	bh=B7JdbG9FVbjuBUoY9BY+ObUinkVxNf1+0mnCp9W/dIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcF1DlrZeopZauyslA1/VHU+4oW+QJNvnWBgLvmSwcYqaW/TThBqtBkz7/oEkE3u6
	 sJgyefvlQ9fYJQI2xhHHj5+5xxhzcssTkMH2vkIhBhRu1UhI1frkDgp9wzqQS4c5Ac
	 IjtHP72qM3DWY0fPzvz3n+p7rWfI19wTDmLPJktdRbesNOXthm8cMiJVPOF7/9/Ua7
	 okA/6mi0tRKF/lFQuAk3M3ix3j2ATgcQKCO1l9mJ2PNz7Prgl9WuvH4bDQLrzAPNF0
	 XB6dpDLgcsdaGcGnO2Kmr9FOx6D8N390dDXfkC/eP0rEQMSor6yo4XagR0BnMuEDrN
	 45y6zQKeteKOw==
Date: Wed, 22 Jan 2025 16:08:05 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Fiona Behrens <me@kloenk.dev>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: io: move offset_valid and io_addr(_assert) to IoRaw
Message-ID: <Z5EJ1Z4hbgQefuxX@pollux>
References: <20250122-rust-io-offset-v1-1-914725ab55ed@kloenk.dev>
 <Z5D_IxCZvcZ_jKd8@pollux>
 <20250122145653.4ce76a01.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122145653.4ce76a01.gary@garyguo.net>

On Wed, Jan 22, 2025 at 02:56:53PM +0000, Gary Guo wrote:
> On Wed, 22 Jan 2025 15:22:27 +0100
> Danilo Krummrich <dakr@kernel.org> wrote:
> 
> > On Wed, Jan 22, 2025 at 01:38:09PM +0100, Fiona Behrens wrote:
> > > Move the helper functions `offset_valid`, `io_addr` and
> > > `io_addr_asset` from `Io` to `IoRaw`. This allows `IoRaw` to be reused
> > > if other abstractions with different write/read functions are
> > > needed (e.g. `writeb` vs `iowrite` vs `outb`).
> > > 
> > > Make this functions public as well so they can be used from other
> > > modules if you aquire a `IoRaw`.  
> > 
> > I don't think they should be public. Instead the abstraction for I/O ports
> > should be in this file, just like `Io` is.
> > 
> > Another option could also be to just extend the existing `Io` abstraction for
> > I/O ports.
> > 
> > > 
> > > Signed-off-by: Fiona Behrens <me@kloenk.dev>
> > > ---
> > >  rust/kernel/io.rs | 98 +++++++++++++++++++++++++++++++++++--------------------
> > >  1 file changed, 63 insertions(+), 35 deletions(-)
> > > 
> > > diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> > > index d4a73e52e3ee68f7b558749ed0108acde92ae5fe..a6d026f458608626113fd194ee5a8616b4ef76fe 100644
> > > --- a/rust/kernel/io.rs
> > > +++ b/rust/kernel/io.rs
> > > @@ -15,6 +15,11 @@
> > >  /// Instead, the bus specific MMIO implementation must convert this raw representation into an `Io`
> > >  /// instance providing the actual memory accessors. Only by the conversion into an `Io` structure
> > >  /// any guarantees are given.
> > > +///
> > > +/// # Invariant  
> > 
> > You phrased this invariant as if it would be a requirement, but it's more like a
> > something that's always uphold. I'd phrase it as a fact that can be relied on.
> 
> I thinkt the use of `Invariant` here is correct, as this needs to be

I think so too -- `Invariant` is the correct thing to use here.

But everywhere else in the kernel we phrase it differently. For instace, in
`Box` we say:

"`self.0` is always properly aligned and either points to memory allocated with
`A` or, for zero-sized types, is a dangling, well aligned pointer."

because this is ensured by the (safety requirements of the) constructor.

We don't say:

"`self.0` must be always properly aligned and either point to memory allocated
with `A` or, for zero-sized types, must be a dangling, well aligned pointer."

> uphold by the constructors (and only then it can be relied on). However
> the patch doesn't clearly indicate that.
