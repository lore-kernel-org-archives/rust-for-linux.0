Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004313EDACC
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587691; cv=none; b=b8rvy2GrVqPfmQhIaZnknDNU/aSLzbL9YVa6Ng+JhKP9DpI4I/HJl66sB6I02deyFyIGq85GYPU9eSF9LFqDeIyfF86wGpfITeM1f6ELkj5PKbvj29nbIVxwHFn6jdXt0oWVFT9pxyEiAVk/KguXHP8cW2isNwB5sHD5cYg9YfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587691; c=relaxed/simple;
	bh=zGyveR2WbexIXAL5cH6LAz1O8Yy1Bgi6o6rA6JtFqEc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ayrx7KCM2VGBX5xjx94jqK2QvzBPwSdI26Eqq9gH1F6t8aRnrEaiYoUp6q5YCyJ0i2+7sUJlAvEMXO805GaU7hroYKS7wtJNuhyHz2aWu2EVNwXfqMmyYO8+VGoFrXzy4DFOIezUVeCmwoLlfTirf7nozLxyPa2ur2yufZZE+LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gkSgL9ap; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gkSgL9ap"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-698af52daa4so2307922a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jul 2026 02:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783587688; x=1784192488; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKWh2FN+uopuAMuLcrvUAZLjx2pCwGenf//G8cQsjMQ=;
        b=gkSgL9apR7y+iMBXru722gl6bNjk0pDunLr8nm4cL9PIhBj35NSRXdpspNsxETxb2e
         77MiaIcnAFL1IrLI91bf9Visv92kW3n/AlXobUKJ8bz3NL4aUY8ARzveVjY+U7USEhhB
         FtPnrnq8OQTbdC25cOgmpdVP21LZUN5rSEXUORwqPdViyGBp+0C2NI82FDqOnXrx3FK5
         BmcU9XKewCo2HaieMIEq6VFahz1QUfDDNWQPhlV9ePF3v9jFjxG7htLv5B8U+gzqCMXG
         wt8zQFl6LtKiOAcGQMGCoPpfL86mGoIqY3SrTIFZLSX8SAmryHWqplVGpNnGpcFQdSW2
         Ttaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587688; x=1784192488;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKWh2FN+uopuAMuLcrvUAZLjx2pCwGenf//G8cQsjMQ=;
        b=CD4fPfnCr+yiZ7mW8gEXs1iq2WIsNBzuxNr+ktpP1IkNbDv6fb/egxDaQYXDpioLRt
         soIJu8NA7KVJXXyHItgjz7dimmiWnoCDjVOBkZ9PLgqLJWVWcDqNdr5HCEzbhwmXMqoH
         D1rF5WKxm3G3SVRTLdfVhQ16IHhObUFNP6/QLIm8Uc+4UDrooUP9IC1oC0B1Zg+G0hx2
         JL4T/WMzf0xNsbc1xBv8RXgAUZo/qfaUJGggknz8UoBYhGbAzudilWu/vCQIaczwTFeg
         xttDwuhdgnndwZtH/s6/yHKNuD+c8kDDa2I4rETzX9tH05e5tXl//7lDXbVFtV91UiIA
         lRxQ==
X-Forwarded-Encrypted: i=1; AHgh+RonqeTR+lJuaNbpWKpi/pFegqmO25g2qsSG9MJBDgVGs4OXRUbTimAVCh2jpVKrYrKkAQG/gHWVUYbBvxHfxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYMyR/HbCKVVO1bun1z8pUIx4OPjfDUk7l1uQYPBY9UlxA6S1K
	fEIgpr9Gmash19AYttnJ9nOk43pBdqWz/O58a7ApD+qTMHXPSZGfIEJbD3ksu9NhSVo5zo9M2mW
	nK/FHGr2ocYubaudj1Q==
X-Received: from edfg18-n1.prod.google.com ([2002:a05:6402:a252:10b0:69b:3a15:6755])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2b9b:b0:69a:57fb:4783 with SMTP id 4fb4d7f45d1cf-69ab445ed4cmr2326024a12.13.1783587687331;
 Thu, 09 Jul 2026 02:01:27 -0700 (PDT)
Date: Thu, 9 Jul 2026 09:01:25 +0000
In-Reply-To: <DJRP4CD15MC5.J47HDEUJS7V1@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <20260703-chid-v1-2-84fe8259e46e@nvidia.com>
 <akvXzPd169ahMuCi@yury> <akvkNuh2bHhFwmQM@google.com> <DJRP4CD15MC5.J47HDEUJS7V1@garyguo.net>
Message-ID: <ak9jZe11r-A4oVf0@google.com>
Subject: Re: [PATCH 2/4] rust: bitmap: add contiguous area operations
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Burak Emir <bqe@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 06, 2026 at 07:22:27PM +0100, Gary Guo wrote:
> On Mon Jul 6, 2026 at 6:21 PM BST, Alice Ryhl wrote:
> > On Mon, Jul 06, 2026 at 12:29:00PM -0400, Yury Norov wrote:
> >> All three are the wrappers around the regular outline functions:
> >> bitmap_find_next_zero_area_off(), __bitmap_set() and __bitmap_clear().
> >> 
> >> The inlined version in headers is optimized for small bitmaps. But the
> >> optimization is all based on inlining in the C code. It doesn't work
> >> if you wrap it with a rust helper.
> >> 
> >> There was a discussion about the similar find_next_bit(). The function
> >> itself is an inliner, but it's a wrapper around the true outlined
> >> _find_next_bit(). So we decided to minimize the binder size for that
> >> type of functions.
> >> 
> >> Please, keep the binder minimal unless necessary.
> >
> > If we can just call __bitmap_clear() without any downsides, then I agree
> > we should do that, but we actually do support inlining the helpers now.
> > See CONFIG_RUST_INLINE_HELPERS.
> 
> bitmap uses __builtin_constant_p which will only work with pure C inlining and
> not LLVM IR based inlining.

Ack in that case using __bitmap_clear() from Rust definitely makes sense. Thanks

Alice
