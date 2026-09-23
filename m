Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEAE23D2A1
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 05:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141666; cv=none; b=nL+wIgjbKFnbBLdbrnlt1DMNFMgWAA9NB8252IMvrmEU1MYYbE6Izp+FUQm+2BHPj7pZCif0CKxu+zm3lpnkeQPyrnpBhJv4pN71dKkQYeCVz7xuwNlv3mNcskk6FAsjnLFU0oS4bLYakvnxaD9AN5GyVTsstuhXIGufAFUEyaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141666; c=relaxed/simple;
	bh=+Zd3h5u6N+N5Ms7Szim1Fw+hrsr+ojwPPp/37WoWfI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZjmMZYaOKkggV8Lrx8D3WH+6tTEiDZnH/7EgxlWq4oYBhBB8uOAZFNAz/WqvMOrQugOJGbkEaUn08ZlXh6XB5FXqMUlM/HHjFew1/OkkPyaUlu/MNq49yAbdQDzj/cdok6SXXugNf/DDtTyJeJLsC+HVaqSxb/PRRWE1k8IvCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyXnMelp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyXnMelp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA171F000FF;
	Wed, 23 Sep 2026 05:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790141665;
	bh=M5qIhAjSX1NSy0AvzqnkHxwmMfSEPWJSFmMa4qL9iMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lyXnMelpZE4F+nsVgQfh/GTjWZmdRslDUy8XYJArOKQZWANFHWz7mcJ5tMFZ88++F
	 44H5gGMvDxsMm9emejvSJpNX3P1p7JolIhdSbRlkqf7PFFsk1JvLSrsTzAdCXUvPuf
	 6mJQSuOccKZ1NjbY0+kOVdSF0AqPGtwc7lREXwzixEuyujd/yHBfKtGDVHNr8wJmd4
	 Ah+KN1xUP6tiNyJqg9O+oQN6ClxHWuX3CkMz93LsvQr7EDGBndzwZFHAM9NLqbTAXc
	 jhTT5vxyHDpUq2aNdMMtfsQ0VZwfvtqNjqVIzFNUhq0A52/JrqLTPKVGQeAX/8f4It
	 WhwPoXHt+vg+Q==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id A532FF40066;
	Wed, 23 Sep 2026 01:34:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 23 Sep 2026 01:34:23 -0400
X-ME-Sender: <xms:32Szah1fupPskjX3LDhVX9Hnf6yCViFa7lB0c2tJH0pDefQsgrKhzg>
    <xme:32Szaik1Rtd02He-6QnJaoqHdd2-osFNVDxLQGl47K7J7m07dMBVzyrHi-IDTDG9A
    9-eIyNMF_JRHlPVApBV0891HkQsu6DY-W8Li8M9Uyx_n0c8CEoKwAU>
X-ME-Received: <xmr:32Szau0VmZLV5pMAz4ewWzcyEnL54rwBaqAE1rriyUnEFy_-9gJWcnnM5bOAR8vRgEzMlfLlHRlGkIhLvF7-0XKeHIOy6UerYdbBaC7nkb7WmHX-2G503HPo>
X-ME-Proxy-Cause: dmFkZTEQDudFIUlzSD9LylPJ3BOxVkG7BdYtkVRlhef6vQpZn2CP8M+xdcB0Xnip6noRBy
    6lkEKhqtF8BIcGjfAFbMve/DITNFQE3eyIbaxUZLQSOZwIS70IrYT/WHozBsKooDflAwhE
    39VY8OEqjEWPf3nIcoDXom0nFUJSd7OS3yag1Y4E/vVTLvTw74PGAA6UPkKZaMshEKcEXh
    HuzAIUUNlSFtKRk4dnJSg7lX/fbAF4hlEmW5xRAkVjqbXNJjVL+pOe0BYRmIMV3bv0wiS5
    YQruk/eft1kOzXyBCyjrUFjHzv4rseGHMxIZBkPYJtSCOkRSsFT5hXMgh1+qUsGhJXbhUw
    3v5796LwlNf0sgol29iSA+DG2C4znad2xCKB/enaQcF2/dLfEOHLAz4lwMYJfTLULRUH3t
    A9zFaHDqoCrXfuy3PSjvFcgd6FkhZCb0rifxPwgXEX9uDOdSPemPKF5/tGHW+WgIcGaz8I
    pvBYo7mxu7LLKDWV+AwwoIQ88kMtadoO9j0MAQR+sZtJ8UsPmJNxq5z950wBE+WvlQMF1f
    FuxPCByTwLWvfZ0h0SXXGdW72mIHgFao4yh0BdKcsw635Y9oa+aU2rPe9VUaYmLimhcAlY
    YjeZu6+ggNzD/WaOBjT58cE+gV3Ji4PnJha4IWMRsfPVF0coBerL2dsajM/w
X-ME-Proxy: <xmx:32SzahgLysx8EtUavA66p5ABOnZZ-tl9PZ8UKvfbWPbv594dOE7Anw>
    <xmx:32SzasWM3JZMY_HvcAAlFB-JQQVCDgj0NL_fvh_ETBUkJmq606Ktqw>
    <xmx:32SzatxENRSJts3gCimw7__mY4T7u3zYRwxMeK_JxL7SqA8fZ-kwCQ>
    <xmx:32Szak5yE7EroL7S-aANY4c8k9KBB_L1EYSvha9kmp_pZwVSP8khOg>
    <xmx:32SzanjGqvdBvg2vWLvAn753Uk1I73M2FzeRQJl4E5AzZJ9V65D4Yj5Z>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Sep 2026 01:34:23 -0400 (EDT)
Date: Wed, 23 Sep 2026 07:34:22 +0200
From: Boqun Feng <boqun@kernel.org>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, longman@redhat.com,
	felipe_life@live.com, daniel@sedlak.dev,
	daniel.almeida@collabora.com, thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/7] ww_mutex: add ww_class field unconditionally
Message-ID: <arNk3mN8Uq9cU5bz@MacBook-0RXW5>
References: <20260102175302.194435-1-work@onurozkan.dev>
 <20260102175302.194435-3-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260102175302.194435-3-work@onurozkan.dev>

On Fri, Jan 02, 2026 at 08:52:57PM +0300, Onur Özkan wrote:
> Removes DEBUG_WW_MUTEXES guard around the ww_class field
> in struct ww_mutex and struct ww_acquire_ctx to always
> initialize it.
> 
> Keeping the class pointer available unconditionally allows
> Rust abstractions to keep from_raw() simple on Mutex and
> AcquireCtx, simplify AcquireCtx reinitialization logic and
> validate Mutex and AcquireCtx class pairing in much simpler way.
> 

@Peter and @Waiman, any dispute on this patch? I would like to make some
progress on this since it'll be needed for GPUVM and KMS if I understand
correctly.

Regards,
Boqun

> Link: https://lore.kernel.org/all/ECC0425A-8B18-4626-8EA8-2F843C45E0A1@collabora.com/
> Signed-off-by: Onur Özkan <work@onurozkan.dev>
> ---
>  include/linux/ww_mutex.h | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
> index 45ff6f7a872b..c9835035b6d6 100644
> --- a/include/linux/ww_mutex.h
> +++ b/include/linux/ww_mutex.h
> @@ -47,9 +47,7 @@ struct ww_class {
>  struct ww_mutex {
>  	struct WW_MUTEX_BASE base;
>  	struct ww_acquire_ctx *ctx;
> -#ifdef DEBUG_WW_MUTEXES
>  	struct ww_class *ww_class;
> -#endif
>  };
>  
>  struct ww_acquire_ctx {
> @@ -58,9 +56,9 @@ struct ww_acquire_ctx {
>  	unsigned int acquired;
>  	unsigned short wounded;
>  	unsigned short is_wait_die;
> +	struct ww_class *ww_class;
>  #ifdef DEBUG_WW_MUTEXES
>  	unsigned int done_acquire;
> -	struct ww_class *ww_class;
>  	void *contending_lock;
>  #endif
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
> @@ -110,9 +108,7 @@ static inline void ww_mutex_init(struct ww_mutex *lock,
>  {
>  	ww_mutex_base_init(&lock->base, ww_class->mutex_name, &ww_class->mutex_key);
>  	lock->ctx = NULL;
> -#ifdef DEBUG_WW_MUTEXES
>  	lock->ww_class = ww_class;
> -#endif
>  }
>  
>  /**
> @@ -147,8 +143,8 @@ static inline void ww_acquire_init(struct ww_acquire_ctx *ctx,
>  	ctx->acquired = 0;
>  	ctx->wounded = false;
>  	ctx->is_wait_die = ww_class->is_wait_die;
> -#ifdef DEBUG_WW_MUTEXES
>  	ctx->ww_class = ww_class;
> +#ifdef DEBUG_WW_MUTEXES
>  	ctx->done_acquire = 0;
>  	ctx->contending_lock = NULL;
>  #endif
> -- 
> 2.51.2
> 
