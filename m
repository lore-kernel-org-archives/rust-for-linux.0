Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62CE1EF370
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 10:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740998328; cv=none; b=DgVcJQkRkHbGxdLybokRyLFYEG6r7OWGlwZwkM1JtBvKEL4GSfC85xvddqqCUSciyHJv6bV61BTWnwhAdD0F/E4GbLkSqer3OiyMJkaWvARdQKneDRoBL1QrUqm1wbPXFx5W0Mtd2uFUL+fw6s+Y1L3+rjca2T34cSakMqXn01U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740998328; c=relaxed/simple;
	bh=jHdrl2AR1Tf2Rsmb2TkZLXZLgSeFFi+xRq/lBgGKUus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHA9WoiLWIHh56iH4vaHtMOgqwNQggcGNXWf5zQcFwRIn749hd7ZGfpb6g1ZN5R8cKhXdBehskdh1MZbxRLV0wBuxFF57pnh2xCblL/z24k79uYG9+Z1+7bae+CbYvL9GFKpU73bh6WFkMHD4ZSSM6gQ256Jg6rLaVBaRyVArqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I0ojQ3dL; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I0ojQ3dL"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abf48293ad0so338337066b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 02:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740998325; x=1741603125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WWO2EgXbq+zvviCN6nQ8SuxKO9LcyLd8SMLZLc5FWnc=;
        b=I0ojQ3dLLFFfUNjcOCY83AcmQ1tAE/aC4jBRqXyaIwcFXvMRT/5zVgzRwAayYNtiGl
         tAyJ/7VA8K8oSnxUNEWFbI2Af6AE01N37LB1KJlV3j52gffMheFlLTOXSqqPDYrSDo7j
         4ihwsu1LWaKg8bxdk/w2i/Z9nRbFhrLD+TXacYPgu6bWs8AmaDc97oMQTgYymwKfWqCA
         PtaxrNB+tZDy9Wl+vkG2fgASbT1TAHlnNqMRTKzm+hCavyaedJ0DeS3u5o1S59IBROBf
         IIXrpiss1IWkZ8fJUgAlXPDt5bogTnvQ645MJXbazDNi9yhkvCzBQdECIoktFKdBj4bh
         mKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740998325; x=1741603125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWO2EgXbq+zvviCN6nQ8SuxKO9LcyLd8SMLZLc5FWnc=;
        b=QwSebqWsk3l+e3iywZH0C/EtgoOpl7B6tjOXZYW4V5dsTxDSeWCBU5LKlw9Ih5Tyi4
         8ujRH77aVMQZxshXoPkgp0fFvF3JBDCor0SYqjcsbKfDVJ07uSc8ikjUk1woPzS7s4es
         5oEteX6Y5fJJkqTeIobBReiRtRVOEkflU1Me38BD9Bec6UbA84lZ7u1TY2syPVIPQ2R2
         NMYKd9TxvmVJyQ41U8Np54k+7OYf+p8w0YyCuOYOba14OR02+35g25q6gtMmeKZqZisp
         jMJOZ85oW/kPUHTaHcmHuctpFcZBkCz+ssfxlGrf7GexGplq+lTdtaxXHOyGqlyDPMMi
         bI4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpypjBGE8LRb9dGoz1YOebRaXHFhei4ShIWBISfYxBvhzAWBboU5Lay0DzWeN+4SpOqZYDXcYIfB2po/RvcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykoaAXa5eC+Nb7BflgeXORQ6NmN7dqZ8TasOZ7bYObLW0QcILg
	lWI8ysxBl0Ivl+ENewEVhslSLyQprt/EzO9/KELyXXLKFUPp4KtC9mPBEsl3eAA=
X-Gm-Gg: ASbGncuXgajtinJdieUD3UokKTz+OTKZ74Z4Ag7siv55zc7tCmaU24sYn9NeBGeRi4G
	6d6i6gZrAweHUOxWi6dSM+O1ovCE0hjYednm9iLbZnBpY99PkZnUbSxQa71lQIPFymTHLRHtGgQ
	R6lE7cY0r0BunelLNwIfO/YmwYi6MW16oCn7gpTwfIHDkSoslU85l1DW6ObEVj294Prnd6vAIzW
	XkdbGmBlnN38S6rwv1tP4wCcYvAkyb42cW2bp0qzBAPSGcPy+V2iwcXFL82jPSfkQsvCWOT3WwC
	ezfJmmvlb+yJ/r9OLd6QmQec89fgR2jbEeBVdnwM26Zh/rg=
X-Google-Smtp-Source: AGHT+IEc717PDdGk4gN5GFyTbXEJWA7c/lYSctH5VoUkyx7imqa5/ZkaLkBrdFhlx2/vtXyNY8DZ4A==
X-Received: by 2002:a17:907:7288:b0:abf:5922:b7a8 with SMTP id a640c23a62f3a-abf5922dccamr1161597766b.41.1740998324968;
        Mon, 03 Mar 2025 02:38:44 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac052702e83sm131063866b.21.2025.03.03.02.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:38:44 -0800 (PST)
Date: Mon, 3 Mar 2025 11:38:42 +0100
From: Petr Mladek <pmladek@suse.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/5] rust: fix signature of rust_fmt_argument
Message-ID: <Z8WGslnV1i1l822H@pathway.suse.cz>
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
 <20250303-export-macro-v3-1-41fbad85a27f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-export-macro-v3-1-41fbad85a27f@google.com>

On Mon 2025-03-03 08:45:12, Alice Ryhl wrote:
> Without this change, the rest of this series will emit the following
> error message:
> 
> error[E0308]: `if` and `else` have incompatible types
>   --> <linux>/rust/kernel/print.rs:22:22
>    |
> 21 | #[export]
>    | --------- expected because of this
> 22 | unsafe extern "C" fn rust_fmt_argument(
>    |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
>    |
>    = note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
>               found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *const c_void) -> *mut i8 {print::rust_fmt_argument}`
> 
> The error may be different depending on the architecture.
> 
> To fix this, change the void pointer argument to use a const pointer,
> and change the imports to use crate::ffi instead of core::ffi for
> integer types.
> 
> Fixes: 787983da7718 ("vsprintf: add new `%pA` format specifier")
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
