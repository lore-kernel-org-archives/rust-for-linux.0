Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE00427A124
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 07:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564284; cv=none; b=j4Ex4Ve98V68m85NEWRQMIGbQghWRNYMKW7Qw2RF+GlNT7GpXq7ihZRW4kiNEd3GS0W5LiJzxawNVw6J7rDLnq9HfyltN68HiKjR7OwRgnTsf0yRVKDjzy4GiZeB7iNOS+uiOGsoujuL4G9OJo2rpHt72cfS+qmY0iYmnfzHcDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564284; c=relaxed/simple;
	bh=BXyko810aRn/59qN8Dbms+0M26EAE50MrFLbT1Q7m3o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j7irbSJZfNBD8y4EdX9FxA3zctUk3qtdI3NOfRDqfgEdsFMVEvpUcQ1RvslxjJMWUfmDEl5q3JrxWcMHCKmP+fr8l9DjGbNTbP0gkoQT+XRP5V3NWpmbHq7Kiktn0yFQK2rV4sBJuOmjVrx8fM2c9QVqHxj4gy7V6oulJQ2Lg/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3ZAJDKp5; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3ZAJDKp5"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45597cc95d5so19668165e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 00:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752564281; x=1753169081; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2hdGlrGBQEUJXzp/eQUuBesk+Ba02ubRYc7z27fwLas=;
        b=3ZAJDKp5gMkvtQFoz9oCLqY/4zptncbFCX2N+UDO2JZDuXyfPVs70sVlBKDWdGesFf
         n9Zcpeo0YQzmA2uBVYvXBwLW2anRUrXzOOOTs0U53r5Mqwa+hZBovyZ60wumWuZZOOpB
         PMi4lxfIMOa3yIKmRWpf4u+PTc58wnDJjvEguW/oK4EiP2EXRm+V/t1QprT5dUKr5kSo
         qzzBNFpxHBBti7DTZ1CJC0NeqRRGoyBqhRyRF217TKQpXM64gXg1r4y/QR2G1qXxQec8
         kRa2QETo/vuaC4sNOXth63ZB545gmjI4rIQyJuS4pVktZVuTmhS3GtAG8VDJREYeaJj9
         f0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564281; x=1753169081;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2hdGlrGBQEUJXzp/eQUuBesk+Ba02ubRYc7z27fwLas=;
        b=rIQY3MIknMoBwiU2gZak91y64t0qsdyk6u7GS+iwYfbE9U0wlIxNoTCucQHcAfxMMu
         lPXrOFNlHdAno2mbohzdc2q0y5ROowZOcy8rRECvO2YHYQcQOFGxgwMwoL+RaJWpyd5c
         tQPggCFSS/EUI8J2hed6OTVLBWkRYVNVphB5eWbZj3XU3NdV0nCqMzH9pUNssFNLgokC
         BHlj2UveKfe+ibsreE1trfCQ1sObgQtZPebxv1BgdlQ8EsvEj1hRDWttOBMYphXoQDhn
         Bp00+ft/GMhZ+6cOp3UagsY69YsbfK6s0lSpziMB+kHE97RTAe4xens0rMNWqGsVjy51
         w+/w==
X-Forwarded-Encrypted: i=1; AJvYcCXy+DXmQx5swjXvt+ncxJLojcm3NEtgip0r6pjJYa99vTxy038ILHfK6fRStqzyHlJLgCh2PkfwlJmHy7w8rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsuYnkt7gBGwAyBNXSR7xlixFmK1rcxF4cOj299lR/OH8JTNuC
	RDzPW0lnLuAftX+Zx1yUVkdOsKQA6Z6AbX5TpM8AMvTUvlb24BkXk6rUmWUOuWLnI9D4I2uHqyE
	Uunx8A0kKK3mEitQ55A==
X-Google-Smtp-Source: AGHT+IGiTh9nWGxvf+BwXvOy41jNPCHQyebs+bv6UB1TIYkjqU2al/w8X2e+nEmDmdxBxEESnLif+UC8q+e1VRo=
X-Received: from wmbbi17.prod.google.com ([2002:a05:600c:3d91:b0:456:506:259c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d93:b0:456:19eb:2e09 with SMTP id 5b1f17b1804b1-45619eb3240mr60493535e9.8.1752564281284;
 Tue, 15 Jul 2025 00:24:41 -0700 (PDT)
Date: Tue, 15 Jul 2025 07:24:40 +0000
In-Reply-To: <20250714113712.22158-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714113712.22158-1-dakr@kernel.org>
Message-ID: <aHYCOFZZYbgP39nR@google.com>
Subject: Re: [PATCH] rust: devres: initialize Devres::inner::data last
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, m.wilczynski@samsung.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 14, 2025 at 01:32:35PM +0200, Danilo Krummrich wrote:
> Users may want to access the Devres object from callbacks registered
> through the initialization of Devres::inner::data.
> 
> For those accesses to be valid, Devres::inner::data must be initialized
> last [1].
> 
> Credit to Boqun for spotting this [2].
> 
> Link: https://lore.kernel.org/lkml/DBBPHO26CPBS.2OVI1OERCB2J5@kernel.org/ [1]
> Link: https://lore.kernel.org/lkml/aHSmxWeIy3L-AKIV@Mac.home/ [2]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> base-commit: 3964d07dd821efe9680e90c51c86661a98e60a0f

I couldn't find this commit. Where does this apply?

Alice
