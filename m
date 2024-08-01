Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A9316F909
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722501840; cv=none; b=LS2TGxnfcST7mbg2lSbyKX4gYakDgQQq39k8an4+vPrRe1ZUFPjm1dZDvACFKChHZ2GO67VXego8i4FBzVWpYzztXFjyyUMUuxpv5WeK+0XBF5HYT334/zGxREd8sirc43B0heWEI1GdNZJvcS68KdkjmG7MTLZjhRrA2qcfuGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722501840; c=relaxed/simple;
	bh=iP+wXHnrUpcj585wjD/GGe/CFFp7MnVySfl/FL8dnoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+fx8iFsXqSXP/r9uqWfYgsZ07zo4eqht8267+0OEz2wPA6Nl+XP6sSbYdQ/PFrmE676Hxe1cU3DZxJQMDbtxiu9trFQ9srtky5bsn01HZlWaC+53CVXjhz89IXx8gd0h8+MRRsxN3kvlfF9ZywMonPBJ3gAhY5Mgv1CGPeWYFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NJoQeVFq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NJoQeVFq"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f0277daa5so10467479e87.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 01:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722501836; x=1723106636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP+wXHnrUpcj585wjD/GGe/CFFp7MnVySfl/FL8dnoQ=;
        b=NJoQeVFqQU1ZFfu1azNimdeY6Hei7p6s0HUG7nqsQHsha3virRGljJXAvYPJD4sRiF
         TegEfiyoGqzfZQGhooQ9M+5z0G4pSjsSKcXT8DOGgOZvWT9FnBRZiaHaYIki7VTo2hK5
         qQ4QWG0RoB7Lq0W3S5UGk0UfBSi14lphvtEqgn78fqbsxcE67nIde4eY3UIYXod8hpBN
         BVhm+WTq/rZ/cIjW5gQOhodFEJSp+Vav2b+40goZ7/KvNFXKZgKx4ksJyHaMFlPx0aQJ
         S93K5BhzXZnchN/hGGav4icOqiX2JHTRQ2CdOab2j6BX/QGu3k+yyhacjVaAhPpnIljr
         XIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722501836; x=1723106636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iP+wXHnrUpcj585wjD/GGe/CFFp7MnVySfl/FL8dnoQ=;
        b=JB76wWOJEwE/A+phJOFRWRxXZDzY/+SHsfvR3e5uZzmCA+KpeRE5G6sFJnzxpWWG64
         sO5f9h3qObh+5pjixLDtHfBYVdbEvsJQcPEBtktqsWMCcxhrIFj8mMaJDQBeTjVG0WYd
         65aZge/IceX7ec9deCBAhcg/bbqT1s3kEhVmyM7uBaOLF+QVxk8sL8Psuxc6WvM6lhjO
         0AwUxxcUxN2+OH+KDDZMZb+oqpq1laI2r1isP9bwaaHjPUThNOuvgyX1Nio69g58EiJP
         6LlLB33F4B5Sj3ayVDyCo+svoOSBL/OKq9vM0OVVqmhdSfxObfcqXnyHTwRtqi5fpkSm
         4VKw==
X-Forwarded-Encrypted: i=1; AJvYcCWQDTXSrh+DMGw8/qXljc5G3+w2oHWKInb0XjuexW6XHKtPgPcrHGm4fEj+ALkUgJFmsJ5HBxhTQQfJPL+nHV3cJZzJexR2pTbEjDDMQgg=
X-Gm-Message-State: AOJu0YwDWAW07bMWYe3PZYBT70YvtTs5TqiFf/jJY0H/TXnzd1nKEzyU
	NN/1pZbn+Pi1fbBKs7G99zPWFURbuFi6N+n/iWa2p2NCfrSgnpKXLBcIgwHps6R576EvMgu8TjE
	mOyZngMIYv1u5VHOIj5a1h458QGRligcNca7Q
X-Google-Smtp-Source: AGHT+IGdDsuI1EafN+ofyqULjxuCJRqqfXvKATrAaEwxr7DoXVNIozm//LiG1UZg7xqVBwAwG8F1llz4J7Ksp/P1ric=
X-Received: by 2002:ac2:4309:0:b0:52f:cd03:a850 with SMTP id
 2adb3069b0e04-530b61b8418mr887803e87.32.1722501836401; Thu, 01 Aug 2024
 01:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-8-dakr@kernel.org>
In-Reply-To: <20240801000641.1882-8-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 10:43:44 +0200
Message-ID: <CAH5fLggy5ngdaEFe1oqO4wgZHTNsx=2A9a+5HNeA6GiUKrHPOw@mail.gmail.com>
Subject: Re: [PATCH v3 07/25] rust: alloc: implement `KVmalloc` allocator
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Implement `Allocator` for `KVmalloc`, an `Allocator` that tries to
> allocate memory wth `kmalloc` first and, on failure, falls back to
> `vmalloc`.
>
> All memory allocations made with `KVmalloc` end up in
> `kvrealloc_noprof()`; all frees in `kvfree()`.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

The nit from vrealloc also applies here, but:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
