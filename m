Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AB32749C4
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761297444; cv=none; b=ecfeRs4XZt3zBQKT0F+YqKx6lvN58SqDOrcj1h/Ixjr5fMNPgXzUXrJ0Rwdo7MsFBqIieJ6ZGH3RxZOvAIA8oF9NkzlSlB60RFnGHmpEVlE0zwpCPTwBhtxL9f96yrUYuPnHqJyNMVy7xpVDsZX0V6pe5eL9YvQ9nR73JkHh5x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761297444; c=relaxed/simple;
	bh=gNJPqjV6kK3WGFQQq/V0cc7zowpWRzML42SoOyIQPtU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Se3Xukdt8CP5ZRHLiAGbh2WYE6JqqoIVpTOnrI4vOz8k0bq5oaeP66zhk/ehdYbUYyIy2sTf+9lCPDDp7PlOwLJOvaUmkwf5p18rmEBLEoDQ75pWiBfi9WGIpZ+0eBXWY4IkHwBzHWW3EjyG81zv4V6p/KlYGFUUhsi8/QPnhvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PPwmNaia; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PPwmNaia"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-470fd92ad57so18470495e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 02:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761297441; x=1761902241; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6wYhnWOu4HUC294Om1L0/GzEXAdBMUsewR7Iu4+cdI=;
        b=PPwmNaiaSWoSoOiYX/4nH7e9DVzxvpTkDn8KkHXJi8hJn9aU9zN+Q478eVOJyKK6Qr
         9o+ckNchu3hfSVV0jy5G61jgNV5eUGGYVz7oU2tA+u6VcRngQPxdCkOJI64ND1zwrZCR
         fjADAYSPKxqrWR2nbj0KjSTxs8kWidkBOmgBsJha6plxRaBbJZxWFRgLa3fN3yyORdN3
         fJSKl60xS/pwkiZ7Nk25LtlSFxO4z2RFLzHVVkOQJDHJoK2gzYDXbEWK7SooWJh0uDXC
         uFpQ/yW4wUsIiljFPM76WBN1T6BORHxgZHwYslgf4TuPdsV5gh6mudkDN6+CsvtT0Cjh
         DhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761297441; x=1761902241;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6wYhnWOu4HUC294Om1L0/GzEXAdBMUsewR7Iu4+cdI=;
        b=Egew3pEr6Ips7a/tvxT9mm6e3Kn55X1As9slkM6u2f+ihKkAtwYHPlUMVyjLHwt9w8
         37u4Z/RMLgu+U1HlEDnnlzysc3G3sbD8tDzByUsZp8PUwmp1aooaxrxbMD0BvxogCa8p
         F6qYIp2unagvjZKezl7U4KJiwiTlMckiQJFoEgCtL6DTfG+UK3fCqENlmeGy2n50Ue5V
         GYlaOy6Xo2vKRTfC2+pzw3JJzLrvGHoXyWL5TdIsDmcAmSOPdOesJTmOqMMk0PVKA6qV
         Jaar8DgRPP/v5mjnEnn+pzYADhWvdjT58ya6jwHu3eQqrziRIR38305Sszf8yS4dH/g0
         YoEw==
X-Forwarded-Encrypted: i=1; AJvYcCWF8KU+RqAwzqfg6PwAtQ5D77GYNN2pU+LV1qTxm3bmvuz+peJJ18sNns5bMMiX10JorW6qDjtUytEzy3LKAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzddwaefxRS6vXz1DULLwp49c3qq40r/HOOCMNembguJCxa8kL5
	z3W233yDHMGemzMTwaIzOlACwffeDoKg6XxWppB+GygZRnKaT7HR1P8pO9opj3XXkAF+bm3IIjw
	NJglFcssD16RuzRZ8QA==
X-Google-Smtp-Source: AGHT+IH/WIt/1A98hPXg4ucUKKx+zX3VscsazPNOSByXZiXdNmxXU300WI/XmlWHMFCv9sa1dHLygnnmTe8hKsU=
X-Received: from wmco22.prod.google.com ([2002:a05:600c:a316:b0:45f:2b4d:3c2b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:420f:b0:471:131f:85b7 with SMTP id 5b1f17b1804b1-4711787dcbdmr192790485e9.15.1761297441253;
 Fri, 24 Oct 2025 02:17:21 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:17:20 +0000
In-Reply-To: <aPpnwXGo4P4-WI6v@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251021-binder-bitmap-v2-0-e652d172c62b@google.com>
 <20251021-binder-bitmap-v2-3-e652d172c62b@google.com> <aPpnwXGo4P4-WI6v@yury>
Message-ID: <aPtEIKvcOJJiE2yR@google.com>
Subject: Re: [PATCH v2 3/5] rust: id_pool: do not supply starting capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 23, 2025 at 01:37:05PM -0400, Yury Norov wrote:
> On Tue, Oct 21, 2025 at 01:32:45PM +0000, Alice Ryhl wrote:
> > When creating the initial IdPool, Rust Binder simply wants the largest
> > value that does not allocate. Having to handle allocating error failures
> 
> That "value that does not allocate" wording is pretty confusing.
> Maybe:
>         Rust binder is initially created with an arbitrary capacity
>         such that the underlying bitmap is held inplace.
> 
> Regardless:
> 
> Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

How about this?

Rust Binder wants to use inline bitmaps whenever possible to avoid
allocations, so introduce a constructor for an IdPool with arbitrary
capacity that stores the bitmap inline.

Alice
