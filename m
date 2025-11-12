Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60732C33C
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762952127; cv=none; b=Z4nN0eHXxqpo7D3CaDz2q+0PFfz7jdFFihMFPEVLzz6NAZOdGrG7rdUPwQyweu+yJkJlA2uu2ytB+KWqLfBIRjTcoFE2+cSHhToyyLMv90OTbFMdYW/qE5qQRbDT6sgyn3veu82Y+YHCXptO6Ru3hqQ7vinRPDEyWc2uVWzwn5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762952127; c=relaxed/simple;
	bh=BcFq00OssKkzSwCl00nvO477fZa7fF9ZX+fCk9k/p84=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hVxy08JYv6kANAeeKQk1gJ1nsChto5Uuf5LPosxzgK9m46B6+oIXKamJGDtoudwDOm0qWs3hD3FLMkMY0bZZ+GjliqdCu4+xLOrqHLDx/pyPzNhX9LQZKuRn0jQDN/q1vuj4YmGyLfhDXWePXKJ/sUSb3spz1Jv1xFyOi+/9gw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TEnfpW0V; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TEnfpW0V"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47754c0796cso6370665e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 04:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762952123; x=1763556923; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj+EtZLPIR5LWGpVopW/lewxMd1J8lyNQVeLz8/n/RM=;
        b=TEnfpW0V7Tzj8plcvhV4cyNYT+L90mYo873AjML3xRTN9E6jgA+2VvrusayAmGJkTG
         5NbJSGKVSXeIrvxo5UbSnBxBuk4rJZFoCPdziNSBomhXvA79J72BnWDt2MzYEyj+Uhcq
         WrfZOTVfBwOvOj+EdFa9uVoqDp9KAR8YSTvm61l+QWvH64narKeZ6se4JLY+5R0sXVVy
         uxJGi8QDIed3MWC/Uielz6aNiEpSZV2BvbZUfrHjTF+1uxfRq84bgxrhFuTUW4CmXzoJ
         mNK5JhUjHTk3aqQfbAHbE4o/rIaS8jZHq6Our+9WDeT6ooXVxXTW56Gfalvv9B6G3mg4
         YJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762952123; x=1763556923;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj+EtZLPIR5LWGpVopW/lewxMd1J8lyNQVeLz8/n/RM=;
        b=aaIKMa/VmJEVIm+o7X2QmxBGhWEVCoYHxnDGJWwnpOBHyRvd4bFM99E/hQbc0JvY3p
         v+GZCPbFgl0WXSIphlMdSX36ife/CEgpQM3Xc66ZEtz+Z3JD47vPZi8WxMEvp6yY7SQR
         +nXoLRs/GPCBpM6O4zrZwAFswTy6FC4sEJJzBsDXgSGqzNsr/IUMJnT65s1MEazdgdbL
         jAJ90sxPr3t4egERUiMiIVWgSCuuRv5rhalxOxZVAJ41oQvfjjKA0GnJCGceRyd0kIzD
         qGKK2KpeUWLBVCtl3WWSyTvKfIOjr5B1PmMdB670G7E2rpH3xziaunM1D1URDvasGUVT
         1d0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVwLBsPKAKSubwAeOsIvlZqccsQnZW2mQZu5whCmkKeI7znQ6NDFk27zzGPFrUNDavrRxZA7jTC2nmNJlefw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziYHWImzkhCWAFhuaATCfG4FRt7fXQVCDdwJxSejTIKHUKblX1
	91UAfXm6heC/WFimCb/mpvNcG7Be+xpl/b2VwTO1j5juRhcf7YGW0xuz2RTC5t5OT3taDmr+YrX
	LQPOF4KHYz7ttLnV/fw==
X-Google-Smtp-Source: AGHT+IHVDVGyl0BDosGU/0tn/jTzVg4KaJQqt5oPgiqlVAOf23dQtEUbhxTfxX/esrh2Br2eeteSfLKiW/Ew1YA=
X-Received: from wmbdx18.prod.google.com ([2002:a05:600c:63d2:b0:477:632b:1238])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c26:b0:477:55ce:f3bc with SMTP id 5b1f17b1804b1-477870c52bamr32419995e9.19.1762952122738;
 Wed, 12 Nov 2025 04:55:22 -0800 (PST)
Date: Wed, 12 Nov 2025 12:55:21 +0000
In-Reply-To: <20251112-binder-bitmap-v5-3-8b9d7c7eca82@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251112-binder-bitmap-v5-0-8b9d7c7eca82@google.com> <20251112-binder-bitmap-v5-3-8b9d7c7eca82@google.com>
Message-ID: <aRSDuUquGfg-BFxl@google.com>
Subject: Re: [PATCH v5 3/6] rust: bitmap: rename IdPool::new() to with_capacity()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>
Cc: "Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 12, 2025 at 12:47:21PM +0000, Alice Ryhl wrote:
> We want to change ::new() to take no parameters and produce a pool that
> is as large as possible while also being inline because that is the
> constructor that Rust Binder actually needs.
> 
> However, to avoid complications in examples, we still need the current
> constructor. So rename it to with_capacity(), which is the idiomatic
> Rust name for this kind constructor.
> 
> Reviewed-by: Burak Emir <bqe@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

> -        let num_ids = usize::max(num_ids, BitmapVec::MAX_INLINE_LEN);
> +        let num_ids = usize::max(num_ids, BITS_PER_LONG);

Ah ... I messed up the rebase here.

Alice
