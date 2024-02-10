Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F312D184
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Feb 2024 00:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707524118; cv=none; b=IEKChdx0zEIywLIBEBSnpx/HB6bSZNX1zSt0+6d76u5r0ANK9Jn7IioG2xdIlgDqimfUpdEauE6DWSYthhttj/wdZ7bVS1+MtV8hPIYyINYiPNgHTnhrle9S4MMRu+1AhofZ7Blr8UAUjmBxbkPF0qhRkHWn5hOwM1b/yPYqXRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707524118; c=relaxed/simple;
	bh=LTW6g9ZRCOglVOUQlauFuhYvDqEy/Z2uN0TkWjjCMsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lX3zn+qT4FDDHuf9H43PsfrLRqZfmvGu9Z5sVBIRk0hz0bssM6fnynmEXAw2Q63w17Bwp17VZsFbA1v4v21NgsgKeEajUqQQjGXTNr0OcShNDZ2EX0EAcH1Hu+7MLmOUnUVkH3a4nX+H1EaH82TlMpBeuwxhwTnYHxCGcEs4828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DKEBXRKe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DKEBXRKe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d51ba18e1bso14707215ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 16:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707524116; x=1708128916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2FiyysorK6znIgI+2wuJOTLlFRPw5jaKibjcyR06HcE=;
        b=DKEBXRKeLr/mc0lc5Du4rzurvICuOPU1810IRMtN0bRM7scw4Fn7uJzHLVPr1HWKQm
         0PQ5xE/Umq3QBmgowqbAZ3RRfJzfun8aAkxI2VDGjA690GKYexTIVbk0V0WzjkSiD3fg
         DT5j8pVFNhsrg1aPDkHZrZFTR8Fcw11OtIkIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707524116; x=1708128916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FiyysorK6znIgI+2wuJOTLlFRPw5jaKibjcyR06HcE=;
        b=WveS13dWP4hHkq9clHK1srOcepYQCQPf4v/mZTNAm5TCoatlQivUfXjSao4OMqULEW
         Nky3RUkmHg607vor/t47FfeKPIi6tCbiW56xY+OTPq50HsyqizocqaMVDlDk1ysU77fN
         GQ+ycTggtOxNzeEOvA8u1keOTEbEspe/GL/MwG5Ow8kli1Asbk7frLYkZl+o1t0Es8S1
         LvB4zi8JQuUyZBlkKkX6NEFtXOnbjA+rTnkEO8dByANxqarJ9g5Sed7fLXbh6XltEDfm
         KVmxVNQEZmW1MtmkuBgyHn5Lq/ICKcHknpjja7u3AgqTXvLVktL2hhYeTw/UxEa5Qtjc
         TCzg==
X-Forwarded-Encrypted: i=1; AJvYcCVjkC/BOIKk60iJcAOLm5dduANaNPZDJ6CSX1ze0c1dPoPVbWaUQwf4/oH5G7AkcZ9CNNbOou7HzzqqRyAwdaGGg2hMkZqXidaFTqVT8s4=
X-Gm-Message-State: AOJu0Yz5Y8Lr77mkQB6FcGUvefunNyLSxjd4X8VmFLWLr7+sYvTXwQou
	pCjLdfaVeTlEE0fG2uHgiFaURpJ480zLcLv2Zrki+kSaYxc8FqGwoAyfQQJ6Yw==
X-Google-Smtp-Source: AGHT+IHcnc105ISBZpzkBts+vHKpOpd1JvTEF2MNZlIyBvOFYyyUrypuF9c50ZmYIR+2+QGKjRoQBQ==
X-Received: by 2002:a17:902:eb44:b0:1d8:f06a:9d68 with SMTP id i4-20020a170902eb4400b001d8f06a9d68mr809271pli.33.1707524116214;
        Fri, 09 Feb 2024 16:15:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3McYWgQ7cZ20ud+Cn7jcEJF/7usPcipggpCZVnWBKtd32PGB2zZqRgUIyt4ITla55fDqo8UHKan55fBAXEKFg1ROfB8uRTRzLwa1sNU4tJxBo0VjG+9sBKtH0PJYVSXe9ozJ/AtutXRyL+Xivg/6nwMkqJHA9y/r1rKAfyuhLjBcTYQujC92CbVNoGt+I5yCMzAJJdEId8QLBXQ3eF7Qhqg8hpQMMFFe7V4MfN9OSTTIgk1m/tfu+myOJSZ8tVjO+mhzMCTaUFD8nSSfzqHuoXbnf6uWouHYVsU/EB7fjSg88ocDUUAqkJmnZ40JHOPrOkNvg/TblR1oOZKGHCP5VyT6FKB4CHB+gE8SgnRy1WtVVEDYmFXVeAXLbC86hrH31Km/GYpmr1lNpZX34SoEMJ9m+ORKCvAIoSVETp8+2VAIuVcXetdq1qIeyteAujaZ04s9bPLcN6x/17445pCgYs17+Z48cqO+9+6zCFZhX4sfI4WVzjzUgzGHNg8eSBvttQnF3DNrYzd6xChoiU9jRG62R53fxLlXXJheu/703VriKzLz30fI1tTaQ4vM0//nf88lrQZ5ViE4P6LfUIYtgCTeuCCXWhiNTxj8OX7U1MiJSUftkkIu2sm6YTlLbQ/lexrG/VYS6Vra0YXaoPcBUObjuGr84Csc+tPqKXu5NQTfHpScpjrQ=
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id lo12-20020a170903434c00b001d9ed86a298sm2058495plb.137.2024.02.09.16.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 16:15:15 -0800 (PST)
Date: Fri, 9 Feb 2024 16:15:14 -0800
From: Kees Cook <keescook@chromium.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v2 2/4] uaccess: always export _copy_[from|to]_user with
 CONFIG_RUST
Message-ID: <202402091606.A181673F0A@keescook>
References: <20240208-alice-mm-v2-0-d821250204a6@google.com>
 <20240208-alice-mm-v2-2-d821250204a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208-alice-mm-v2-2-d821250204a6@google.com>

On Thu, Feb 08, 2024 at 03:47:52PM +0000, Alice Ryhl wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Rust code needs to be able to access _copy_from_user and _copy_to_user
> so that it can skip the check_copy_size check in cases where the length
> is known at compile-time, mirroring the logic for when C code will skip
> check_copy_size. To do this, we ensure that exported versions of these
> methods are available when CONFIG_RUST is enabled.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  include/linux/uaccess.h | 37 +++++++++++++++++++++++--------------
>  lib/usercopy.c          | 30 ++++--------------------------
>  2 files changed, 27 insertions(+), 40 deletions(-)
> 
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index 3064314f4832..835aa175d0ee 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -138,13 +138,18 @@ __copy_to_user(void __user *to, const void *from, unsigned long n)
>  	return raw_copy_to_user(to, from, n);
>  }
>  
> -#ifdef INLINE_COPY_FROM_USER
>  static inline __must_check unsigned long
> -_copy_from_user(void *to, const void __user *from, unsigned long n)
> +_inline_copy_from_user(void *to, const void __user *from, unsigned long n)
>  {
>  	unsigned long res = n;
>  	might_fault();
>  	if (!should_fail_usercopy() && likely(access_ok(from, n))) {
> +		/*
> +		 * Ensure that bad access_ok() speculation will not
> +		 * lead to nasty side effects *after* the copy is
> +		 * finished:
> +		 */
> +		barrier_nospec();

This means all callers just gained this barrier. That's a behavioral
change -- is it intentional here? I don't see it mentioned in the commit
log.

Also did this get tested with the CONFIG_TEST_USER_COPY tests? I would
expect it to be fine, but better to check and mention it in the commit
log.

-Kees

>  		instrument_copy_from_user_before(to, from, n);
>  		res = raw_copy_from_user(to, from, n);
>  		instrument_copy_from_user_after(to, from, n, res);
> @@ -153,14 +158,11 @@ _copy_from_user(void *to, const void __user *from, unsigned long n)
>  		memset(to + (n - res), 0, res);
>  	return res;
>  }
> -#else
>  extern __must_check unsigned long
>  _copy_from_user(void *, const void __user *, unsigned long);
> -#endif
>  
> -#ifdef INLINE_COPY_TO_USER
>  static inline __must_check unsigned long
> -_copy_to_user(void __user *to, const void *from, unsigned long n)
> +_inline_copy_to_user(void __user *to, const void *from, unsigned long n)
>  {
>  	might_fault();
>  	if (should_fail_usercopy())
> @@ -171,25 +173,32 @@ _copy_to_user(void __user *to, const void *from, unsigned long n)
>  	}
>  	return n;
>  }
> -#else
>  extern __must_check unsigned long
>  _copy_to_user(void __user *, const void *, unsigned long);
> -#endif
>  
>  static __always_inline unsigned long __must_check
>  copy_from_user(void *to, const void __user *from, unsigned long n)
>  {
> -	if (check_copy_size(to, n, false))
> -		n = _copy_from_user(to, from, n);
> -	return n;
> +	if (!check_copy_size(to, n, false))
> +		return n;
> +#ifdef INLINE_COPY_FROM_USER
> +	return _inline_copy_from_user(to, from, n);
> +#else
> +	return _copy_from_user(to, from, n);
> +#endif
>  }
>  
>  static __always_inline unsigned long __must_check
>  copy_to_user(void __user *to, const void *from, unsigned long n)
>  {
> -	if (check_copy_size(from, n, true))
> -		n = _copy_to_user(to, from, n);
> -	return n;
> +	if (!check_copy_size(from, n, true))
> +		return n;
> +
> +#ifdef INLINE_COPY_TO_USER
> +	return _inline_copy_to_user(to, from, n);
> +#else
> +	return _copy_to_user(to, from, n);
> +#endif
>  }
>  
>  #ifndef copy_mc_to_kernel
> diff --git a/lib/usercopy.c b/lib/usercopy.c
> index d29fe29c6849..de7f30618293 100644
> --- a/lib/usercopy.c
> +++ b/lib/usercopy.c
> @@ -7,40 +7,18 @@
>  
>  /* out-of-line parts */
>  
> -#ifndef INLINE_COPY_FROM_USER
> +#if !defined(INLINE_COPY_FROM_USER) || defined(CONFIG_RUST)
>  unsigned long _copy_from_user(void *to, const void __user *from, unsigned long n)
>  {
> -	unsigned long res = n;
> -	might_fault();
> -	if (!should_fail_usercopy() && likely(access_ok(from, n))) {
> -		/*
> -		 * Ensure that bad access_ok() speculation will not
> -		 * lead to nasty side effects *after* the copy is
> -		 * finished:
> -		 */
> -		barrier_nospec();
> -		instrument_copy_from_user_before(to, from, n);
> -		res = raw_copy_from_user(to, from, n);
> -		instrument_copy_from_user_after(to, from, n, res);
> -	}
> -	if (unlikely(res))
> -		memset(to + (n - res), 0, res);
> -	return res;
> +	return _inline_copy_from_user(to, from, n);
>  }
>  EXPORT_SYMBOL(_copy_from_user);
>  #endif
>  
> -#ifndef INLINE_COPY_TO_USER
> +#if !defined(INLINE_COPY_TO_USER) || defined(CONFIG_RUST)
>  unsigned long _copy_to_user(void __user *to, const void *from, unsigned long n)
>  {
> -	might_fault();
> -	if (should_fail_usercopy())
> -		return n;
> -	if (likely(access_ok(to, n))) {
> -		instrument_copy_to_user(to, from, n);
> -		n = raw_copy_to_user(to, from, n);
> -	}
> -	return n;
> +	return _inline_copy_to_user(to, from, n);
>  }
>  EXPORT_SYMBOL(_copy_to_user);
>  #endif
> 
> -- 
> 2.43.0.594.gd9cf4e227d-goog
> 

-- 
Kees Cook
