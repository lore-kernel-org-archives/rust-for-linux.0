Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41AF1F949
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Dec 2024 09:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733133252; cv=none; b=PHTPA7WQSZhcFsIFWyyWRIB+Xe7Q9HdckEXjaeiZguNLOZyGz+3W9r7o3uG0HXiRXYOlvXu2agOgYOaPvzIGT8XEVSVR6i8c751mWe6GiIHtaa1omUi3j42X3Wkti3k9MtopHmyeaSuAGLyTkRI1JSJT+3GIPHsTVAxEV3ONJfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733133252; c=relaxed/simple;
	bh=5HDKhhsmjveu5eN+/Q/k5ogCVKiFuD960p7ueZETwpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W89ha7lgGT/FTWcrfnDM6ZTt51SrPE7OQjaj71EH1jvBKdE82XN2ruDLpdMt/zZI0cEbP1Wj4RMpbx6uJsXfJlEFIeSgfzxrPJAlHBGUEtVmeEvT2D+9LeK7WA+42HSX5R3OMxoF7XW1Lr7DMxoazB1EyWCjnGXO2uu7MJlLmco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdoUnDf6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdoUnDf6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E3EC4CED2;
	Mon,  2 Dec 2024 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733133252;
	bh=5HDKhhsmjveu5eN+/Q/k5ogCVKiFuD960p7ueZETwpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DdoUnDf6zVVvZZanOTKEn9TrHLEONWnNOqxoK3mLbFCKKJahLOCgibo7mAg7ueEoH
	 fpYctUL/wIKo6b+8CtTs6t+LlZKNIUgDVCqY6UfhWJk45UEDdghZ7M7glMWAMFgNJf
	 gP1NFVUUKJW99GxhoBv+nds4qxh9SW5KlAdAv7wc9flmF9Ocar25fhdoxzDlSnS8Yk
	 AJaCg5lwdLObxD5g/cbSIfm0gbSgh2RMOhcWZuSnDB49nmF/4rk8Cc6Wjlcc0CKP2q
	 FNX+0ra02bxcmHNg4l+qXMBDf4+8JPemw2FKqJrUXn/kYhMtDXSv561nhDar/yCILr
	 JZKxSzzsJ89AA==
Date: Mon, 2 Dec 2024 10:54:08 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Bernhard Kauer <bk@alpico.io>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: introduce KVec::pop()
Message-ID: <Z02DwAhVx6k7NRXr@pollux>
References: <20241202085758.67319-1-bk@alpico.io>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202085758.67319-1-bk@alpico.io>

On Mon, Dec 02, 2024 at 09:57:58AM +0100, Bernhard Kauer wrote:
> Provides a simple stack together with push().

Your commit message should also explain the motivation of the patch, i.e. what
do you need this new function for.

> 
> Signed-off-by: Bernhard Kauer <bk@alpico.io>
> ---
>  rust/kernel/alloc/kvec.rs | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ae9d072741ce..ba6c265ad5c5 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -302,6 +302,34 @@ pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
>          Ok(())
>      }
>  
> +    /// Removes the last element from the [`Vec`] instance.

It not only removes it, but also returns the corresponding element (or `None` if
the vector is empty). Please add this to the documentation.

It would also be worth noting that users may want to shrink the vector after
removing elements, however, we don't implement the `shrink_*` functions yet.

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v = KVec::new();
> +    /// v.push(1, GFP_KERNEL)?;
> +    /// v.push(2, GFP_KERNEL)?;
> +    /// assert_eq!(Some(2), v.pop());
> +    /// assert_eq!(Some(1), v.pop());
> +    /// assert_eq!(None, v.pop());
> +    /// assert!(v.is_empty());
> +    /// ```
> +    pub fn pop(&mut self) -> Option<T> {
> +        if self.len() == 0 {
> +            return None;
> +        }
> +        self.len -= 1;
> +
> +        // SAFETY:
> +        // - `ptr` is valid because there is at least one entry stored.
> +        let ptr = unsafe { self.as_mut_ptr().add(self.len) };
> +
> +        // SAFETY:
> +        // - `ptr` is properly aligned and valid for reads.
> +        Some(unsafe { core::ptr::read(ptr) })
> +    }
> +
>      /// Creates a new [`Vec`] instance with at least the given capacity.
>      ///
>      /// # Examples
> -- 
> 2.45.2
> 
