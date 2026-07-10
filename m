Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5F4395D98
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 20:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783714827; cv=none; b=HinkLzgksf2AJJHJ8lYax79zIkuTDEsgUisDqVIRqWf7dnf5GIVKQ+3kiw1DcoMtvicphhUcDcUpjRNyNgA2l2veivgEk3mfz2DAGW/QKDjqXLTWPV0SbctYLe00xlMSR++GaxPIBT7o39lPZqXMnzGHmlYs4vCFnvOq8Qq079Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783714827; c=relaxed/simple;
	bh=0L3CgSaaV4AqYWGrk+AifvuWog9PM7WpgzTws3Tw+0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbKh9gqbaYsGEIetSmTX+UbsbI0O9eTIytnQjoz/jjvtQD+ATGMPS4RcRy91SyvWkh2M1Sv0MZA1vRwJn4YYRfcseOCxmF/M2119j5qkc60depU+Hjmxfvf5rdM+36IQeh/+2B+8rUqKN0MKXiq7Y5lceyHUJyAnMbte3Y5Ta/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ccg0I0/E; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ccg0I0/E"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccdf36f63dso27675ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 13:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783714825; x=1784319625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x9YWllSiFnqyyOXcztx3W/l6vJH/SvX7uih5uhirMHs=;
        b=Ccg0I0/EZZvDZfx5FoPOtvQdV4AF5x4XVEQH6acZaoShe+UjSVGJvaXc7VaV68EIox
         ZXGs0rZVXhHqpu9OvaXHkrHomwcu413HmazvJYOpekJBK7jVlBTnpLtqEttkglFDN8sF
         yAIAMxv3kejKfPHokd8eIvGBUwUaGt3H8lA6MHft1LF8EOl3lj7ISZWKrCVFRPfSZdmS
         6nNm4tpRmY0xWtDxCszti6H7///MXY9Z54JfUcmHBcB6pFPB+Pr63ISlw7PD4p0YF9y5
         y5f0/VzKXurDC5ksKTKUHYlf/Av+UeL2EfvjW3uXkQ/ogNCYHrIZUN3FwL1LoTwa+ZbY
         kyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783714825; x=1784319625;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9YWllSiFnqyyOXcztx3W/l6vJH/SvX7uih5uhirMHs=;
        b=NQqguVwSKLJN/kMKUJK2TneKoYue3c6QpIyfwmzA1s7lSoTCmwwZAUiYReMunoyDcZ
         moE0yMGaP94V9ty3ASjkhqLn//dYGsfcHayE9Z9ChGye6eFtQZjmkeE+6UuD7XZV36Hj
         R984TlIQg+TtK7jwl5u0xo9kqqI3iDstU3lvQQdvkJBDZQfUutKaoYRfwtchav0OXw8b
         LHnRjhyoHN6LqxgKNfvv8SaxZ99mWcNS6KgfAsoBVPpts+tSJ5vsdBMlyzgL1KrF9Xap
         CkpV/uujK9fCzAf99DxJAza9GJhYFVrFY/lNO+5+I1raDfX5OMJ2nRxejawBnjKqkw3B
         x+xw==
X-Forwarded-Encrypted: i=1; AHgh+RpUOJVZTrooa+3K9u7irReZyLodqXcg7HpTOn/FyjwG5ljyDF1yVH5bgIzkez1BSQsCjEYRT5dHxGV2S1A+0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq2NB4udizRqgT/jvQjCwjRa8uEHblcQwLgh54U8Pud4/yPy3l
	gGmxwS7RYu6wnp0XEOf8S5+nHymCGlFlvYyI+d4ZqKLYnKvAMhHMGCxmjpIg0Mus5A==
X-Gm-Gg: AfdE7cl9iZLR+5HYgYhW50dpI3PwET7iOTVRNf5CeHiZQCEzg/D7IN8DZ4ezeeEqMAo
	eREqMZmQTHsNaJIzz9+3cScRG3ovd8DdBaXpnfnLk2mmwro3A7QSiFe8V8xdivNqsQofP4czb82
	rj8/AG9ch1gJvNkusiswTaKr3GpDUUlWIWQwd9P1tlY35ZaVYeMbl6+lliXDLFjb/NZmPOvNvGg
	USSISyFuvNvCMXJ42GVepFaSvAYjHxks084RHnH7etROtrKTQmaFmR7rUnvbCnyGrJSax4MlA5G
	uyvrvvhhnVc8WJyNrOGtL6ECphjFCGqX9iKz7TIxAfvNrA8jGgvvc2g6Q+FqjJGKIshS3d9wvqd
	IM83HONnMtnmNfIoTHi5vUMdZZIZyUkGkvm96wa7PFH7nMFQ2xaIfVMLX6t2mjACwHXMHLzlvxz
	Wy7mKh7yr5U2yyOWiCrA/yESj+PlSIJcixqeN7K9lPgf55xGuWRzFqeCLM4TPyj2ZdyfEfTTTzY
	u+fq4xkMhF8oUkNFQk724nZve43uyIc0ho3
X-Received: by 2002:a17:903:3846:b0:2c7:7c7d:fb8f with SMTP id d9443c01a7336-2cea1e4448dmr134115ad.17.1783714824895;
        Fri, 10 Jul 2026 13:20:24 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84831643b9csm6209048b3a.6.2026.07.10.13.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 13:20:22 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:20:18 +0000
From: Carlos Llamas <cmllamas@google.com>
To: jahnavimn@google.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
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
Subject: Re: [PATCH v2 6/7] rust_binder: Implement
 BINDER_DEBUG_DEATH_NOTIFICATION
Message-ID: <alFUAuT_kJ5z0MpE@google.com>
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <20260710-rust_binder_debug_mask-v2-6-2846410e3ae6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-rust_binder_debug_mask-v2-6-2846410e3ae6@google.com>

On Fri, Jul 10, 2026 at 02:32:57PM +0000, Jahnavi MN via B4 Relay wrote:
> From: Jahnavi MN <jahnavimn@google.com>
> 
> This adds dynamic debug logs for:
> - Memory allocation (OOM) failures when requesting
>   death notifications
> - Registration and cancellation lifecycle events
>   (BC_REQUEST / BC_CLEAR)
> - Delivery of death notification events to userspace
>   (BR_DEAD_BINDER)
> 
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> ---

LGTM, thanks!

Reviewed-by: Carlos Llamas <cmllamas@google.com>
