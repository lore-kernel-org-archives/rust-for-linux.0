Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAB534EEEF
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771838106; cv=none; b=pTSRU5+f6v0u1bZGK/2Nj9KhKArdF4J81k+E/aA1CSwVn3FIH8phY0RId4JhSrJ/N4vp7HqAJcMoxXPykWs3WzOeUO5DspRGLRZM92JPtCPfe3cv4iVRFu/PjbySNQvyqViGmCA0C0ogRt8s7LhWH/1hrj9iQuWQxkXDGUl8hzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771838106; c=relaxed/simple;
	bh=WnCVSVyP0du3aW6xgB13h3WYPrZY9fXisXZmNJUw1fc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZdAfGQI0MtJUkkV1U24dryrnUU9rLeD/yzqn6//U0HvOKRSnd9ZgYVwDEe0sRMNQK92V540ev8mgMYA0hoMB1luzwkZe1gTpWwqNi+2633K6sg5QNgqCRkp9nUSZDANgISHVUImUUJ90RuUjMw3LLvKTz3zlbmvBe7iJU4Kjzl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fxbpdLDS; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fxbpdLDS"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837b9913c9so42257695e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 01:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771838104; x=1772442904; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vOcHT801aqXoK3tA38lkJBGJrXjsRTU5HQwu+hWqDEo=;
        b=fxbpdLDSpCuDHWiWq8iYRBDFnd+gHO90u9lHycAEX81v74Gya9raCGBEG8FMmNV5WQ
         9EfDJ3vKMJV22mSMX8HtDEUd5RlzxmpxhTrOMo/M+/VjG/MhaBd967ikEPabtadjP8T/
         QnK7mbqahRoROqAYLmdpsJo4zsDsa1SjCDCEGTxwb4FRuGV9MpBCJbZlYDn0MLnmzfBV
         JUh/Fcncs1QGG6XQG6JPsHsRuwQUqCNMudzo0Qf6eO3DP+Ya/lI04x3r2VlyczlETDay
         AtV3s1sSuwrk7Uv0Ttb5VzfqoBgY1pOY5grmf2KqB7GlBCRpBDGinl/AxzeikCJ7YJ1N
         23Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771838104; x=1772442904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOcHT801aqXoK3tA38lkJBGJrXjsRTU5HQwu+hWqDEo=;
        b=u2FkEIQQ812l0vCGf5nFlrwV6p7Z93y/I4BxqE9uSB5BHQrm7hFrriSs5iYsKOR3uN
         mbkU5ChEE+Uf3G+Xpy9s08oKL3u06Zi7K3i3UXHOItj3CNN/3vZMN+v026jj7TgkKmYr
         Ljeo4hzrsQ9mN9l039cQqUdTsEeXT5zizpgfOyUar8mUHH5nNIDv9hTiNxjuJu3PHsYW
         3SWrdCm+R+QYF5MGJFUe40ZYTiwPNsxVvO/HmvHkb2yhu9Gvf90mdj+R+4K9kM874Bb+
         G3Qee9SGPWwrzes81WiNwknP4pT4SR5lZQ7o+FdRsPG/g7XYnOVRF4uLOSjUun4d6VgR
         2TyA==
X-Forwarded-Encrypted: i=1; AJvYcCXOyEi/7KkqRcLLB/tekgO0qepjlJpYlKXaqIXbrvrcrKewnJX+ruZuPxKsO9dADjJ+qt1sQYbAqtjrHMy2cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIxPksyVN4wdB+ERPdNWdMGm8yMTKLsz2WbTcMxnf+YPGonY6K
	dOBeQLR0W3YyGtfIG4MDXGvUHxUJf384Bk+tJlSRmWtHiyqi2/eMhDJWF1n/nMKCZCQXKgpFiHh
	GNm+poKej13dkXXAL4w==
X-Received: from wmqa20.prod.google.com ([2002:a05:600c:3494:b0:483:1069:2eb4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8206:b0:483:75f1:54f with SMTP id 5b1f17b1804b1-483a95f8a84mr142893835e9.31.1771838103699;
 Mon, 23 Feb 2026 01:15:03 -0800 (PST)
Date: Mon, 23 Feb 2026 09:15:02 +0000
In-Reply-To: <DGKQH7Q9QONY.4GLSDMQ8DOY1@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com> <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org>
 <aZgYY_fetgz_GDR8@google.com> <DGJX3FI97W1G.371MAMC60FX24@kernel.org>
 <aZlw3SGmLetHwaTM@google.com> <DGKQH7Q9QONY.4GLSDMQ8DOY1@kernel.org>
Message-ID: <aZwalt_6KlOIDzkN@google.com>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Feb 21, 2026 at 04:09:41PM +0100, Danilo Krummrich wrote:
> On Sat Feb 21, 2026 at 9:46 AM CET, Alice Ryhl wrote:
> > So, should we get rid of GpuVmBoRegistered in favor of ARef<GpuVm<T>>?
> 
> I wanted to avoid exposing the reference count, as I suspect drivers might not
> need it in Rust, but I don't know for sure.
> 
> We could also define it as GpuVmBo<T>(ARef<GpuVmBoInner<T>>), where
> GpuVmBoInner<T> is private, but I also don't want you to go back and forth with
> this in case it turns out we do need drivers to be able to take a reference
> count and I also don't think it hurts too much exposing the reference count,
> even if not needed.
> 
> So, either is fine with me, ARef<GpuVmBo<T>> or
> GpuVmBo<T>(ARef<GpuVmBoInner<T>>).

I don't think GpuVmBo<T>(ARef<GpuVmBoInner<T>>) works because we need to
be able to talk about both ARef<GpuVmBoInner<T>> and &GpuVmBoInner<T>.
The reference type is returned by several different APIs, so the Inner
type can't be private.

Alice
