Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494DC150980;
	Wed, 18 Dec 2024 12:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734526130; cv=none; b=PHuROVkm8gRuYyS6YHDshS8VxmjxrXlBXWkqWEmwDW0tFYJhwkhrozdJ3tA6T2fj/IuvTv36Mab30j0yIqddzSy+2Kml2EtNfH+FhHcHywrQ2NiV2fJTP+FvETXPyVffhpFhkt2uqw3ey/49uS7hyilHI2cUPG/pSH5rB5zsQFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734526130; c=relaxed/simple;
	bh=n6yFccAHwNfpCkLoJEcdsxlok9C4rHzofc/QyPqniEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBzoSiYuGZh23k75CikKsEnV0TUj10zRC19MfAjKGIJncnpESEMK5E0q3XngHzsqemm8lNSmRfo87rOLbMSGAl+oj05sYxMg/t1k+iKfqfZOUbTC5D/TN6aKAneGG1FwcguN1bOIxox5W+VYvz9D4Adt13S3xRh1GlCH/RpnGQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtyBxp8w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtyBxp8w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A764C4CECE;
	Wed, 18 Dec 2024 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734526129;
	bh=n6yFccAHwNfpCkLoJEcdsxlok9C4rHzofc/QyPqniEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtyBxp8wvqegBA+pJr+rwCHqwe0ldfjDsQLyjewLsWj7B88y/LB+D5fuxCOHX8A+0
	 iWOWRrokKIxoEgGSKkGh2w6NvB8WQcwWcOmsmMszuZ27ZkiR6NLzX9B7ooQHmb7npp
	 cijvZCfAyeJ28bWZ6hHX6/rvwt3q+vhtSqJ6vHbIHqBNQf6CnuSKetBGlHzamZK6dk
	 DO3w63dDjhf9cbHonu3nM9WFdxYKs5n5z36MiWyf/dVNWW55F1S2xL4k9fYUq/Kw8/
	 Cf5r/Ejt5RP/CZMWCq+X109vSaGA6CwfExB1NNMAeiqZYQzk1Wec28vxH0roGhNjGY
	 tr/CPlztrEFBA==
Date: Wed, 18 Dec 2024 13:48:43 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Jimmy Ostler <jtostler1@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Filipe Xavier <felipe_life@live.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Daniel Sedlak <daniel@sedlak.dev>,
	Alex Mantel <alexmantel93@mailbox.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] rust: alloc: Add doctest for `ArrayLayout`
Message-ID: <Z2LEqxaRxqJbl9KL@pollux>
References: <cover.1734477232.git.jtostler1@gmail.com>
 <e683a5df7d66cca81d762803d602fba62bdd5905.1734477232.git.jtostler1@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e683a5df7d66cca81d762803d602fba62bdd5905.1734477232.git.jtostler1@gmail.com>

On Tue, Dec 17, 2024 at 04:23:12PM -0800, Jimmy Ostler wrote:
> Add a rustdoc example and Kunit test to the `ArrayLayout` struct's
> `ArrayLayout::new()` function.
> 
> This patch depends on the first patch in this series in order for the
> kunit test to compile.
> 
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1131
> Signed-off-by: Jimmy Ostler <jtostler1@gmail.com>


Reviewed-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  rust/kernel/alloc/layout.rs | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/rust/kernel/alloc/layout.rs b/rust/kernel/alloc/layout.rs
> index 4b3cd7fdc816..0e053dcc7941 100644
> --- a/rust/kernel/alloc/layout.rs
> +++ b/rust/kernel/alloc/layout.rs
> @@ -43,6 +43,25 @@ pub const fn empty() -> Self {
>      /// # Errors
>      ///
>      /// When `len * size_of::<T>()` overflows or when `len * size_of::<T>() > isize::MAX`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::alloc::layout::{ArrayLayout, LayoutError};
> +    /// let layout = ArrayLayout::<i32>::new(15)?;
> +    /// assert_eq!(layout.len(), 15);
> +    ///
> +    /// // Errors because `len * size_of::<T>()` overflows
> +    /// let layout = ArrayLayout::<i32>::new(isize::MAX as usize);
> +    /// assert!(layout.is_err());
> +    ///
> +    /// // Errors because `len * size_of::<i32>() > isize::MAX`,
> +    /// // even though `len < isize::MAX`
> +    /// let layout = ArrayLayout::<i32>::new(isize::MAX as usize / 2);
> +    /// assert!(layout.is_err());
> +    ///
> +    /// # Ok::<(), Error>(())
> +    /// ```
>      pub const fn new(len: usize) -> Result<Self, LayoutError> {
>          match len.checked_mul(core::mem::size_of::<T>()) {
>              Some(size) if size <= ISIZE_MAX => {
> -- 
> 2.47.1
> 
