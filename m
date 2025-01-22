Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10EE212B2B;
	Wed, 22 Jan 2025 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737555754; cv=none; b=LdyWavdIt3/uRmbVEsf+hRPgXbmwMrzLWHpCsI3szvZY/3eTmuE6djDo1uH4eVe2wizbwKgzhYUeBg/4hZ85oAtddwHAaXudDN53wr338fLbk3E0RVBY8A37xOCKOMdsDnRDWFCOjqq6sILyBtJek77EzlZ0mKtY4mMYCZbWlCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737555754; c=relaxed/simple;
	bh=BjIj5KioeIuIMtWhyzheySRuzT7cujN/Tx/UsNcHXeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbzK8fX+m12xKBM8FWO1FAHBB2f8fLSp5mWki/4qyaUJ2QSoHQbiO69R2HtueUn0FEoCKi6xv1E2g8sGqD6zWx10af1NNdbsFC726Dbw4H3NVyXv9Pk7kFkxH3vkGaJ0Ao2rj9Cqp7QACNVm/QsE0+gR+2nzKkYlo92qorf9dKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWAn05yg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWAn05yg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E8DC4CED2;
	Wed, 22 Jan 2025 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737555753;
	bh=BjIj5KioeIuIMtWhyzheySRuzT7cujN/Tx/UsNcHXeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWAn05ygxWJ9gyXwJZS7EBwNiWb04f8PdA5PvniBmINQaTO7dENJFQCp5oced2rLW
	 IunFygDSmRI1sYRCmgy+1i2MZPG9NU+SC4SieXQgE6pK/B8AXxfA/AJE6vRhpzj32t
	 mAoeCgiW4yR4bQwz815d+Y7Ag3wCUASn1/kCvCCbZYPECesB6DOlWNjPQ9vjeB+I2L
	 +ICiJcvX6SEPI05w0pPm4GG75MPFk5yxRh/c29BQMlnAIfVzWEkNpPeB0/J5L8uR9O
	 ekvcJLmQBrxno3f85N4agIdNAlvWPszIekZHPLmwcWuqsqlyaW5krjIJw8KFqzHdmN
	 9c4qIRENrH7og==
Date: Wed, 22 Jan 2025 15:22:27 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Fiona Behrens <me@kloenk.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: io: move offset_valid and io_addr(_assert) to IoRaw
Message-ID: <Z5D_IxCZvcZ_jKd8@pollux>
References: <20250122-rust-io-offset-v1-1-914725ab55ed@kloenk.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122-rust-io-offset-v1-1-914725ab55ed@kloenk.dev>

On Wed, Jan 22, 2025 at 01:38:09PM +0100, Fiona Behrens wrote:
> Move the helper functions `offset_valid`, `io_addr` and
> `io_addr_asset` from `Io` to `IoRaw`. This allows `IoRaw` to be reused
> if other abstractions with different write/read functions are
> needed (e.g. `writeb` vs `iowrite` vs `outb`).
> 
> Make this functions public as well so they can be used from other
> modules if you aquire a `IoRaw`.

I don't think they should be public. Instead the abstraction for I/O ports
should be in this file, just like `Io` is.

Another option could also be to just extend the existing `Io` abstraction for
I/O ports.

> 
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> ---
>  rust/kernel/io.rs | 98 +++++++++++++++++++++++++++++++++++--------------------
>  1 file changed, 63 insertions(+), 35 deletions(-)
> 
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index d4a73e52e3ee68f7b558749ed0108acde92ae5fe..a6d026f458608626113fd194ee5a8616b4ef76fe 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -15,6 +15,11 @@
>  /// Instead, the bus specific MMIO implementation must convert this raw representation into an `Io`
>  /// instance providing the actual memory accessors. Only by the conversion into an `Io` structure
>  /// any guarantees are given.
> +///
> +/// # Invariant

You phrased this invariant as if it would be a requirement, but it's more like a
something that's always uphold. I'd phrase it as a fact that can be relied on.

> +///
> +/// `addr` plus `maxsize` has to fit in memory (smaller than [`usize::MAX`])

"fit in memory" sounds a bit misleading. I think you want to say they have to be
in the range of some address space (e.g. PIO).

Besides that, why do we need this at all in this patch? I think it's fine to
add, but then it should be separate patch I think.

> +/// and `maxsize` has to be smaller or equal to `SIZE`.

That's wrong, it's the other way around.

>  pub struct IoRaw<const SIZE: usize = 0> {
>      addr: usize,
>      maxsize: usize,
> @@ -23,7 +28,7 @@ pub struct IoRaw<const SIZE: usize = 0> {
>  impl<const SIZE: usize> IoRaw<SIZE> {
>      /// Returns a new `IoRaw` instance on success, an error otherwise.
>      pub fn new(addr: usize, maxsize: usize) -> Result<Self> {
> -        if maxsize < SIZE {
> +        if maxsize < SIZE || addr.checked_add(maxsize).is_none() {
>              return Err(EINVAL);
>          }
>  
> @@ -32,15 +37,66 @@ pub fn new(addr: usize, maxsize: usize) -> Result<Self> {
>  
>      /// Returns the base address of the MMIO region.
>      #[inline]
> -    pub fn addr(&self) -> usize {
> +    pub const fn addr(&self) -> usize {
>          self.addr
>      }
>  
>      /// Returns the maximum size of the MMIO region.
>      #[inline]
> -    pub fn maxsize(&self) -> usize {
> +    pub const fn maxsize(&self) -> usize {
>          self.maxsize
>      }
> +
> +    /// Check if the offset plus the size of the type `U` fits in the bounds of `size`.
> +    /// Also checks if the offset is aligned with the type size.
> +    #[inline]
> +    pub const fn offset_valid<U>(offset: usize, size: usize) -> bool {
> +        let type_size = core::mem::size_of::<U>();
> +        if let Some(end) = offset.checked_add(type_size) {
> +            end <= size && offset % type_size == 0
> +        } else {
> +            false
> +        }
> +    }
> +
> +    /// Check if the offset (plus the type size) is out of bounds.
> +    ///
> +    /// Runtime checked version of [`io_addr_assert`].
> +    ///
> +    /// See [`offset_valid`] for the performed offset check.
> +    ///
> +    /// # Errors
> +    ///
> +    /// Returns [`EINVAL`] if the type does not fit into [`IoRaw`] at the given offset.
> +    ///
> +    /// [`offset_valid`]: Self::offset_valid
> +    /// [`io_addr_assert`]: Self::io_addr_assert
> +    #[inline]
> +    pub fn io_addr<U>(&self, offset: usize) -> Result<usize> {
> +        if !Self::offset_valid::<U>(offset, self.maxsize()) {
> +            return Err(EINVAL);
> +        }
> +
> +        // Probably no need to check, since the safety requirements of `Self::new` guarantee that
> +        // this can't overflow.
> +        self.addr().checked_add(offset).ok_or(EINVAL)
> +    }
> +
> +    /// Check at build time if the offset (plus the type size) is out of bounds.
> +    ///
> +    /// Compiletime checked version of [`io_addr`].
> +    ///
> +    /// See [`offset_valid`] for the performed offset check.
> +    ///
> +    ///
> +    /// [`offset_valid`]: Self::offset_valid
> +    /// [`io_addr`]: Self::io_addr
> +    #[inline]
> +    pub const fn io_addr_assert<U>(&self, offset: usize) -> usize {
> +        build_assert!(Self::offset_valid::<U>(offset, SIZE));
> +
> +        self.addr() + offset
> +    }
>  }
>  
>  /// IO-mapped memory, starting at the base address @addr and spanning @maxlen bytes.
> @@ -116,7 +172,7 @@ macro_rules! define_read {
>          $(#[$attr])*
>          #[inline]
>          pub fn $name(&self, offset: usize) -> $type_name {
> -            let addr = self.io_addr_assert::<$type_name>(offset);
> +            let addr = self.0.io_addr_assert::<$type_name>(offset);
>  
>              // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
>              unsafe { bindings::$name(addr as _) }
> @@ -128,7 +184,7 @@ pub fn $name(&self, offset: usize) -> $type_name {
>          /// out of bounds.
>          $(#[$attr])*
>          pub fn $try_name(&self, offset: usize) -> Result<$type_name> {
> -            let addr = self.io_addr::<$type_name>(offset)?;
> +            let addr = self.0.io_addr::<$type_name>(offset)?;
>  
>              // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
>              Ok(unsafe { bindings::$name(addr as _) })
> @@ -145,7 +201,7 @@ macro_rules! define_write {
>          $(#[$attr])*
>          #[inline]
>          pub fn $name(&self, value: $type_name, offset: usize) {
> -            let addr = self.io_addr_assert::<$type_name>(offset);
> +            let addr = self.0.io_addr_assert::<$type_name>(offset);
>  
>              // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
>              unsafe { bindings::$name(value, addr as _, ) }
> @@ -157,7 +213,7 @@ pub fn $name(&self, value: $type_name, offset: usize) {
>          /// out of bounds.
>          $(#[$attr])*
>          pub fn $try_name(&self, value: $type_name, offset: usize) -> Result {
> -            let addr = self.io_addr::<$type_name>(offset)?;
> +            let addr = self.0.io_addr::<$type_name>(offset)?;
>  
>              // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
>              unsafe { bindings::$name(value, addr as _) }
> @@ -190,34 +246,6 @@ pub fn maxsize(&self) -> usize {
>          self.0.maxsize()
>      }
>  
> -    #[inline]
> -    const fn offset_valid<U>(offset: usize, size: usize) -> bool {
> -        let type_size = core::mem::size_of::<U>();
> -        if let Some(end) = offset.checked_add(type_size) {
> -            end <= size && offset % type_size == 0
> -        } else {
> -            false
> -        }
> -    }
> -
> -    #[inline]
> -    fn io_addr<U>(&self, offset: usize) -> Result<usize> {
> -        if !Self::offset_valid::<U>(offset, self.maxsize()) {
> -            return Err(EINVAL);
> -        }
> -
> -        // Probably no need to check, since the safety requirements of `Self::new` guarantee that
> -        // this can't overflow.
> -        self.addr().checked_add(offset).ok_or(EINVAL)
> -    }
> -
> -    #[inline]
> -    fn io_addr_assert<U>(&self, offset: usize) -> usize {
> -        build_assert!(Self::offset_valid::<U>(offset, SIZE));
> -
> -        self.addr() + offset
> -    }
> -
>      define_read!(readb, try_readb, u8);
>      define_read!(readw, try_readw, u16);
>      define_read!(readl, try_readl, u32);
> 
> ---
> base-commit: 01b3cb620815fc3feb90ee117d9445a5b608a9f7
> change-id: 20250122-rust-io-offset-7b39b11e84ac
> 
> Best regards,
> -- 
> Fiona Behrens <me@kloenk.dev>
> 
