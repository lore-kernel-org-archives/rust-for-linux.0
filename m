Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60920212D7C
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 03:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755660873; cv=none; b=Vo381HjC3WGP/llanGtzUmxVPN1c9ZRQgoHT3UGD9lHWZIXLWa29eFbZJtBwX5Eu+cACDUDfDZ9z5sqk2/lfLZ0abOFIRPv6BXzaYFWZ5uXYdjlrnTJPkhrsTScEONxuy/Xhj7py18PHTtFyOMmAAtuDOwuNH6ZyywqxSYHuD9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755660873; c=relaxed/simple;
	bh=uVhm0RvIO2OzpquVTR5HsGomMVy3gjsdRKTHZttcAs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JB1u5rXZ2ZJBW8b3StC2IG12hCwLynfPsYBCx4hYx8M7Zp/onehL6Yceg+oGm2w/z9fgyT4Z6mLiXzLs7U1sWTwV0p6ixS9D91RPYrTtg2XNVgHBFpmzgL9KNbB0XpNbzm1buQrfUu8GgjPb16ySJmkD4S/FpkLY4QGHqlGgBUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev; spf=pass smtp.mailfrom=weathered-steel.dev; dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b=Vfp7iuEJ; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="Vfp7iuEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=protonmail3; t=1755660859; x=1755920059;
	bh=/YIFJFklxH+6ol1HZ2gE+lsHjt5zHKu7+jvozM/clDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Vfp7iuEJAtByNtdW8KHmQqlwVytaVwaQeLXH4BsDYzwiKMvFkVixll+mtxtC3lSSw
	 5T/D5jYyquE9g/+EnFOaSKqN6FLuqzikgW4jNnP1HwTIufbSOJi9rhL4zVzcYEbgWo
	 twn9TR8HVhpRlwvpwQcJmgddbiqOa6mjCuewhuGQmLYZcUmClHjSKakMtJS5zWrhRb
	 a1mZTNaeMrYN9nGpVbkXzX+E3nRcgyunz0seISvcPgtQ4UfvyeaR41UsEHVq3JadgP
	 RU+7h0RFLyDQOZ9MyZuMXUVYouOc4YsxHTnpAOousHAXjSXKAMPF+07s3HMuodgSSe
	 T5vYTmBtHWIPg==
X-Pm-Submission-Id: 4c6Brn6WS7z1DDWj
Date: Wed, 20 Aug 2025 03:33:52 +0000
From: Elle Rhumsaa <elle@weathered-steel.dev>
To: lingfuyi@126.com
Cc: rust-for-linux@vger.kernel.org, lingfuyi <lingfuyi@kylinos.cn>
Subject: Re: [PATCH] rust: xarray: optimize lock functions with inline
 attribute
Message-ID: <aKVBx2HWamyG0SeD@archiso>
References: <20250818011612.1839789-1-lingfuyi@126.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818011612.1839789-1-lingfuyi@126.com>

On Mon, Aug 18, 2025 at 01:16:12AM +0000, lingfuyi@126.com wrote:
> From: lingfuyi <lingfuyi@kylinos.cn>
> 
> The XArray lock and try_lock functions are simple wrappers around
> the C functions xa_lock and xa_trylock. These Rust functions don't
> add significant logic beyond the unsafe FFI calls and safety guarantees.
> 
> Mark them as inline to avoid unnecessary function call overhead in
> hot paths where XArray locking is frequent, such as in page cache
> operations and other kernel data structure management.
> 
> This follows the same optimization pattern as other Rust kernel
> modules where simple C function wrappers are marked inline to
> improve performance.
> 
> Signed-off-by: lingfuyi <lingfuyi@kylinos.cn>
> ---
>  rust/kernel/xarray.rs | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index a49d6db28845..c96589f92927 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -119,6 +119,7 @@ fn iter(&self) -> impl Iterator<Item = NonNull<c_void>> + '_ {
>      }
>  
>      /// Attempts to lock the [`XArray`] for exclusive access.
> +    #[inline]
>      pub fn try_lock(&self) -> Option<Guard<'_, T>> {
>          // SAFETY: `self.xa` is always valid by the type invariant.
>          if (unsafe { bindings::xa_trylock(self.xa.get()) } != 0) {
> @@ -132,6 +133,7 @@ pub fn try_lock(&self) -> Option<Guard<'_, T>> {
>      }
>  
>      /// Locks the [`XArray`] for exclusive access.
> +    #[inline]
>      pub fn lock(&self) -> Guard<'_, T> {
>          // SAFETY: `self.xa` is always valid by the type invariant.
>          unsafe { bindings::xa_lock(self.xa.get()) };
> -- 
> 2.34.1

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
