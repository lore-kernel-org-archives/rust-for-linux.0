Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B9B1D9346
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764322237; cv=none; b=kr8p3WWqXRgmSv6jW3G3lYb5F1QKXOlcqmcYMNVvWFA5vVEvoFkpk8bSduNDgvPRCfoBowb+Eb7Q8O7GsnZ9KlDllLBgKHV50inzXVEggWr7AYbaM7eUk6NM8iyj+dG58rZtumcSgFCJWIBkrPyWvTxCEzfiSxwSFOiCaYG7jcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764322237; c=relaxed/simple;
	bh=pAMrBYxNmrnMV98dzPQqgoD/IlNSmr/b6Kg/ue8CGis=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PyW7vhD17CbeptOz6MTPUr5gZKU9rJ7hZCtZiR7ziIGbQD4wBPqDIJj22fEtAmSKpJqTcGsRIY8nbNPFSNKV0yB5B3RmIj55L/unGZFhdmMGQQFJ5J39IpF5fXQJeSqIu1c+Whxm+gdUsfJAi2E+IO7uxUOzxGRgS7zf7x850r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dd2RD8lo; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dd2RD8lo"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47788165c97so11955635e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 01:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764322234; x=1764927034; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w0sEyeS2wsRbXXsmS9a3/+EZd+2aP5K9jDzOEbDWnKY=;
        b=dd2RD8loGNDnE9aLpcjqQfT7njU0KWsdSNhX9+x6f+qOn38/qFM9HftdvwR/Mn6jdq
         KRQhjgqrjmI3qXFKJW3NmnmC/anLZxWodDQGklfuIvZeVrbvb2uQZAhBTMOmUeZVG57+
         iP/KbqkPYgFNMOvMNH6BxfKIqQcfw7s6V8AkVNkOaxTEdKk23zIwzpvq4uT49tBGTDpy
         YpkOrUQkwNXBi583U+fN1b9L5+orxvo2FSikYKAJTg7CMy991EWtrZlNvzGKoT0PakEv
         08uivvEGGlsvBgru93gdISOwRDaqZ7p7A6tcJdEFo1WSCbHYnbQrK8JyAFNKmsTgKq/4
         iZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764322234; x=1764927034;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w0sEyeS2wsRbXXsmS9a3/+EZd+2aP5K9jDzOEbDWnKY=;
        b=hfMKwjEqSPgyaz7e09VK3grDkgNgJK1f6MNSka6VPRFoqZmHf7DbuiGJ9/A0MWRGg8
         qeY0BQnDbHhZ2wxcs2PrRs3+VDZLyGsssqJlmktZjzQCtyfu8VlCIgmT6u0IJLM93Ppu
         4/MZYi1CY7XPFzODXzgs2Nm6gWPqF7/uq9oWm1LgAkWqh2tZNsGIu8Fo6ejLFLo1dLvH
         FPEfesPe4n1b0okJF9JORQzlv0rwuIosIjDnf44VwjEZtrQwCsD6sF/WDpxtE+2EW7g7
         8UO+jRCLz3Gk9wK+dwAKtFpKiAbN7rJ23m+QoMmzkpLI4bWczoD2q32oNi98/s9S6eqv
         YKAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSkMzJWHg/w85rwfRMDRezbe4ubGiDk67WNAVqpDdUQv4SG6FRvO/NIHhq8skl+BhxflGDS/wTimI2XNdtNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoDvJmwIjMTLxJfOdck1Uzgl6tcGmerDqZ+nWPQvD+wuf2ycR+
	fpKoPsCXVTtcg7dg4eQc4YYfcVpTw4U4flvhIBprdXPv7pfDESo0GVhjCZHk+1WGoloHETbhHDC
	sS5VVlZgoLwWkGTyr6g==
X-Google-Smtp-Source: AGHT+IGfhLSTnEFnCpRI/99DlfZCgPSs9n/gklXmDBNxjOIzEo2RBOo/FCdKr4hcgOlG2K2eX/wvEjRfRqywvDk=
X-Received: from wmlu12.prod.google.com ([2002:a05:600c:210c:b0:477:165e:7e2a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3146:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-477c01b2211mr273239085e9.18.1764322233436;
 Fri, 28 Nov 2025 01:30:33 -0800 (PST)
Date: Fri, 28 Nov 2025 09:30:32 +0000
In-Reply-To: <20251127213340.180090-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251127213340.180090-1-ojeda@kernel.org>
Message-ID: <aSlruDTopYyy3yeR@google.com>
Subject: Re: [PATCH] rust: id_pool: fix broken intra-doc link
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Burak Emir <bqe@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 27, 2025 at 10:33:40PM +0100, Miguel Ojeda wrote:
> `rustdoc` detects a broken intra-doc link:
> 
>     error: unresolved link to `BitmapVec::NO_ALLOC_MAX_LEN`
>        --> rust/kernel/id_pool.rs:100:31
>         |
>     100 |     /// [`NO_ALLOC_MAX_LEN`]: BitmapVec::NO_ALLOC_MAX_LEN
>         |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^ the struct `BitmapVec` has no field or associated item named `NO_ALLOC_MAX_LEN`
>         |
>         = note: `-D rustdoc::broken-intra-doc-links` implied by `-D warnings`
>         = help: to override `-D warnings` add `#[allow(rustdoc::broken_intra_doc_links)]`
> 
> Thus fix it.
> 
> It was a missed rename in v5 of the patch series adding this [1].
> 
> Fixes: feb3fdf1239a ("rust: id_pool: do not supply starting capacity")
> Link: https://lore.kernel.org/all/20251112-binder-bitmap-v5-0-8b9d7c7eca82@google.com/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

