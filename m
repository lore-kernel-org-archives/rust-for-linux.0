Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE8F228C86
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741612540; cv=none; b=TANbnWv+67adjbQbyiYreLOyUry090WN8E5qEhT25XJ35UawEWsmeiREpKGCIQHed5tSc7DIbifXBvu0Bt7Cvxs0qz3oo3S0YxJRa/DSzQ2kWHrLW4w4+UUNOWbzrgZga2xIai57nUoiHlotigikCw4Dy+gJ0e4kpSKSMsPqpcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741612540; c=relaxed/simple;
	bh=vK5tFz6cAoc3BRInBg6lxuhPY7r7H7slA5Y0fpKWcN0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lb9FYc9q67lbcLW6p/Fz07h1Dud6VXnv6pBCgPBvz0yZ3Bm43mmoZoUj4lqAmHxp61LVJWTJJCRnTGQFX5Vzl2V3mcVRYQlJ4sAcyNyt3p0fbhmzKnfDH5PrRMdfkGlWqFjg1nCRc8j0alCjjrQWiGqFaNtT5JS3U51JRLim0Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lKRdcmFw; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lKRdcmFw"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43bd0586a73so35014815e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 06:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741612537; x=1742217337; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+EEsvDIwxD+0/5fzD3wD3Tbua+FVDD1lHgd/aZ/hTzU=;
        b=lKRdcmFwicKo1lg+eRNQffLJ/glBtgE6erIPVd+x7cy4rEs8ycwgAuTb0xFV3D47OO
         MEG0IjQux0H91VdDAKZMaAfDT+PJ4DsQRv0vbFJT8ynUrbizvNjmiElro/zLtdd591IS
         Mxwus5HxkHRg2869UX9cafjR7XDklGlsJaFdTWbPphK0dgBTIy7rvdPgN3VAHXdT5bCZ
         U5mHM6lX1NDoGwJCfM+TAq8nWjBnklBwh9bCdutLKG6HA7dpNIaQIb25DSncb+N37WdM
         jHKGq+dlfljt9mD+de2OF+pwImjNamrKbqq34smRYCx32HeZsERVlw1u+W0m7arrGvvq
         p/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612537; x=1742217337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EEsvDIwxD+0/5fzD3wD3Tbua+FVDD1lHgd/aZ/hTzU=;
        b=cCpwJCId2A4ovwqK1DZqrhOTZhnUNKg/Y8c63nd6YSnkcXD4+6M4teKRmDhDS/y/r2
         DI3kecs6j1wyt5RfF2kGJvb0fkl7X9O9uPFado0ZyGa2Vo5CQRR1Mpf5FBvkbF1MKoRq
         BCjeGH+x2TCqfYZ9hbbhoqPiy6YsLFQ+3K4D4PowAp9LuWj0SzPm3bsNiqSm8iZarfJ6
         fxPC2CoBZLLeygiA2StbIcKk/nkM8Uh6OiuxQdE9hqQrU4FsUWRAe/O9eIwbixGol1ga
         5VXdpelIJa1QC+CTDf9Utsn29QWHgaKGwcW6fuiJddKJFCUdaU7r6B4U7Fw6KI5VEPDj
         iKnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXNtv2Ib53/osPbBBzw5qatAmRIdDnI7TO+D3pTALpZwWQrLlt8WGmtLLlssYbmVTwZSATZP9kq7m+7i3RDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl9+410Kw9s/4102vulPBuwwM+eLOZDsKPQiavksdnYWQXOUkG
	s0ZJlRuuBvcly/IbP0s7PyaCwCt7GNry5e5IvdNy4N1sPvHI0MyVURpZhNUtONS8yl6A71KS32i
	Nf4tizJnXyD3M3g==
X-Google-Smtp-Source: AGHT+IFAKBqCVDoWZNPtAoyGlnefO3AJox8H3Fg09QiDkuEe6afbmhhVGIrGRzga25ARaMG6blRd6xBWUg2R+xw=
X-Received: from wmbhc5.prod.google.com ([2002:a05:600c:8705:b0:43c:fab0:ce54])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc6:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-43cfb95cc79mr20397035e9.3.1741612536744;
 Mon, 10 Mar 2025 06:15:36 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:15:34 +0000
In-Reply-To: <20250309-faux-inline-v1-1-c1b692862433@ethancedwards.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250309-faux-inline-v1-1-c1b692862433@ethancedwards.com>
Message-ID: <Z87l9qENkwuea03Z@google.com>
Subject: Re: [PATCH] rust/kernel/faux: mark Registration methods inline
From: Alice Ryhl <aliceryhl@google.com>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Sun, Mar 09, 2025 at 10:14:36PM -0400, Ethan Carter Edwards wrote:
> When building the kernel on Arch Linux using on x86_64 with tools:
> $ rustc --version
> rustc 1.84.0 (9fc6b4312 2025-01-07)
> $ cargo --version
> cargo 1.84.0 (66221abde 2024-11-19)
> $ clang --version
> clang version 19.1.7
> Target: x86_64-pc-linux-gnu
> 
> The following symbols are generated:
> $ nm vmlinux | rg ' _R' | rustfilt | rg faux
> ffffffff81959ae0 T <kernel::faux::Registration>::new
> ffffffff81959b40 T <kernel::faux::Registration as core::ops::drop::Drop>::drop
> 
> However, these Rust symbols are wrappers around bindings in the C faux
> code. Inlining these functions removes the middle-man wrapper function
> After applying this patch, the above function signatures disappear.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>

LGTM to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
