Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709B71CEAD8
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Nov 2024 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731679261; cv=none; b=tYzEQN8S3pwft7HLvrdC+9Pg+Gup9ikekhcnxx9w5NoA9SL3tiV9V9Mr7QvZHfBMNgZBu402TYkHF+glq34EKbGLH2DZIgI3lG1MocHW3WC4pFA1WJkvRuh24kUhXk9MhIg1h6Jd90nrqWZknfPsh2APXNO5qmpCPCNl72fC72A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731679261; c=relaxed/simple;
	bh=VfVHZrGd4tsTjMi2xv8h9FRmG7Ah4ZiFj6Wn70prO8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmYPUzeDlqd+XHLh9C1zCOIRYyyFGN0oEZ+V5aHcZOwLy/cyUzD5gogTHUaTSrl5YjfNRupY8us5SIBPsX37MJUhxaXOO+PKPYTzQwZtx9HJR97nJFqM+6x7hlN+rDG3vnnlQ+NdA78L+zHByVqoi8Er+NOFs+A+7u1FbyzGiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YZwXXHdU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YZwXXHdU"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-432d9b8558aso11535475e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Nov 2024 06:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731679258; x=1732284058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfVHZrGd4tsTjMi2xv8h9FRmG7Ah4ZiFj6Wn70prO8I=;
        b=YZwXXHdUBDYsijL/FblRRNt0rQLifvWexFEKtb5m+BVYyAy+gtG9c1rw6J1hsXnsmg
         KCAdCMS+yuX1/Igm7FT9+s05Z5roKqIO0zPD/ZzNZNhTC0iw//NOINmEpcd39lLDI3Qg
         gS0a0Os/rlKHZTmnHSjvcuGPvDOqTXhxRSBAyLef9biaKBSaz49C1OzdTa4SnlT5krW4
         5Dq3umj5qVIgOND44Wjkm+wZ9lFzFSp2HnUZPcFnFQF6MC5gdH4RTnSgEvKeY+HV8kcj
         8kFciltEWiuY5N2fVsZ1j7FSegiGT36h3/hxLmAUbQjGZkZ3/MBKjJVXnJWcZL01Zt+V
         BjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731679258; x=1732284058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfVHZrGd4tsTjMi2xv8h9FRmG7Ah4ZiFj6Wn70prO8I=;
        b=w6ZChnjfqiLbEyQnaFB2qkkaMY4tFL6kLwYXUxlM9HxC/5oNi0Tr0pGVkKs5zG1apB
         pMKaVOg9ibhMV6CgE0NvS0k7CGW4D7xFGmnYk+nZwwkZKOXcS/hobmmpMhqWU/O1hpIc
         KupLbvwitOLLAInKdUB19b8u/Iz1hztOEaWN/lEftKkYPoUeoYx9P2FFkip+C1y82kR7
         U78ERUOteRXxTMjBd6NKTFW90b52N8rB4/G4aB5yvsVvlO8IzP2bQ5ZVX5PnJrMv1iK7
         249VGyedEsWg6HQh4Ez90KaFfktUDsVNKtdfoTLKWPUL2HjEA06ARHZtgNm7PKnqXBhQ
         tnNg==
X-Forwarded-Encrypted: i=1; AJvYcCXYaOxE9TxbnlqBWiZjGnZ7xxr1VYmg98265pbPyW81QdPMTFW4K3GwMZajLIjIQ9cQYRdvK/oWuZ+HTo3Czw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhAy9q+9VlkUqxJXLLmTfzin2KymoN1IG1eOUCJ3xB5wAq24Xs
	dOYh18hRF+cFgqhrsNzvITDwcoxRvtLSTCGT/8oM995O4GXoqgmFrToWz+2qPTJrKv+5/UukJ0v
	nKA8Nz8MsxVvLND/P2nyI5zUr6eU3XvjZE8YC
X-Google-Smtp-Source: AGHT+IFk8/GvWJwG6tNDd12MbN9MckIetCAQntsvm7RXN/fJBQRSRREZVjA31lahN/uOpJgQiKXbK33daKacZwaEsSw=
X-Received: by 2002:a5d:5982:0:b0:37d:460d:2d07 with SMTP id
 ffacd0b85a97d-38213ffe4c1mr6588655f8f.10.1731679255711; Fri, 15 Nov 2024
 06:00:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004154149.93856-1-dakr@kernel.org> <3b843e34-48f3-41ca-bd83-9bc137ca6c76@asahilina.net>
In-Reply-To: <3b843e34-48f3-41ca-bd83-9bc137ca6c76@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 15 Nov 2024 15:00:43 +0100
Message-ID: <CAH5fLgg68b-pfGhDubJMzGA8w4dywviMv+ghw0KV1emFvNKe9Q@mail.gmail.com>
Subject: Re: [PATCH v9 00/29] Generic `Allocator` support for Rust
To: Asahi Lina <lina@asahilina.net>
Cc: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	akpm@linux-foundation.org, daniel.almeida@collabora.com, 
	faith.ekstrand@collabora.com, boris.brezillon@collabora.com, 
	mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 12:33=E2=80=AFPM Asahi Lina <lina@asahilina.net> wr=
ote:
>
> We (Asahi Linux) noticed that this doesn't support unsized types, which
> is a regression from the alloc Box. drm/asahi uses boxed trait objects
> to generalize across certain object types like render commands, so this
> breaks the driver.
>
> Is there a plan to add this back in? AIUI this would need the
> coerce_unsized unstable feature, but is there any other blocker?

We're already using coerce_unsized for Arc, so I see no reason we
can't just add that for KBox too. Soon, we should be able to use the
derive macro [1] I proposed to do this without unstable language
features. The limitation that the RFC mentions for custom allocators
does not apply to KBox because it uses PhantomData<A> instead of A for
the allocator field.

Alice

[1]: https://rust-lang.github.io/rfcs/3621-derive-smart-pointer.html
