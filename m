Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9977B318ECD;
	Tue, 10 Feb 2026 16:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741975; cv=none; b=h9ylAuX0YmaTQz5h+MXhPePDxTNjk27MpgNHF1CyCuRsUrSdSgkNWyGj2WiwUoG0FYIsC1IieSIc0nnlpFffznCn5AVHRLvLlW49uvY+uKOPS86UGrfD+kIUmJwsFomaufW8YXTjR2nhG1sJcaMwDjE4w48H8D5wDI2lQ7PTtgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741975; c=relaxed/simple;
	bh=okQlxFXHr0GfUR5XxlHMtgJeovD4r1bYBEfmdHEJlfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQDmCmto1UgRFLOBUYkf5VIAsyC852xzgvopCAnDSShcQbqFW/kAayf2ARJuGuSjNnb+DdGWkwm/VMkE1Q1WiIIQa9fEsfpTH95DIebExdEdPABHI5oQ3DFjfWAIxsioMR/wCwqV7jkG+tlNh/x4Uk6oq7nWVM1hgAkHS3rn1fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSbhl9ly; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSbhl9ly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50ECC4AF0E;
	Tue, 10 Feb 2026 16:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770741975;
	bh=okQlxFXHr0GfUR5XxlHMtgJeovD4r1bYBEfmdHEJlfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSbhl9ly8KVez1VkctsxefkJpbufNq4t6g9QBlIUUa8AYzca9bgSc8WbWFFQj2QaU
	 3uv11VUaQcGvMpAa3QM3XpgE0nCej6ypvl45zNfN2OOqSNU4M0cXFXqnZklv0dgMtZ
	 7vy2lz0Rnc/bNmD1o5ku35WIn1OHhgS8zjO7qeq41M690SRe03XaxUZ1PwoMQqh7OH
	 N9XZBRQ1MU0hXn61L7FoEdhGaBtdfhtSJl3IEBTMamz4IclH18uFExmxXI/GnlI+If
	 V+WLnW/4G1A8rcOd3Errr40Bp5O0RFvZ9/lMVP1lLwMcytrj3MEnsDfAMXDuOH/Az7
	 EAqzhhaSVr2lA==
Date: Tue, 10 Feb 2026 17:46:09 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
Message-ID: <aYtW-Hg-ItQI7v9-@macos>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>

On 2026-02-09 15:38, Andreas Hindborg wrote:
> Add a convenience method `contains_index` to check whether an element
> exists at a given index in the XArray. This method provides a more
> ergonomic API compared to calling `get` and checking for `Some`.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/xarray.rs | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index d9762c6bef19c..ede48b5e1dba3 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -218,6 +218,27 @@ fn load<F, U>(&self, index: usize, f: F) -> Option<U>
>          Some(f(ptr))
>      }
>  
> +    /// Checks if the XArray contains an element at the specified index.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{alloc::{flags::GFP_KERNEL, kbox::KBox}, xarray::{AllocKind, XArray}};
> +    /// let xa = KBox::pin_init(XArray::new(AllocKind::Alloc), GFP_KERNEL)?;

Side comment: I'd also update the examples to the new coding style. And it'd
probably be cleaner in the first commit.

> +    ///
> +    /// let mut guard = xa.lock();
> +    /// assert_eq!(guard.contains_index(42), false);
> +    ///
> +    /// guard.store(42, KBox::new(0u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    ///
> +    /// assert_eq!(guard.contains_index(42), true);
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn contains_index(&self, index: usize) -> bool {

Nit. The method name may imply there's a contains_*() variant. I'd rename it to
contains() so we are consistent with the rest of the API.

Reviewed-by: Daniel Gomez <da.gomez@samsung.com>
