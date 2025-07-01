Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B916D26F477
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Jul 2025 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365477; cv=none; b=puIWnsV4k2BHzX7GGg6Gw+EL5jg51ip226cR2OBt780VM7KveLHTzN2fvDFJJ7aiY2iaTnRqH2PCjLQ2x9fIuHirG+ZTlJyAPLG71jmEkv+PSNZ3jbITQZpKSqO3ER1ka2mOJ5lq7AB+1mcKATtlSNT6rMQXdkv3yU7TF5Oyllw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365477; c=relaxed/simple;
	bh=ZFXU2/Ibp4ecCRuQYjkbKYOpoIIpT4Zpp7sdJw8JlfE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K6ObVenHqKkGDcO5MoIopwROHF9QTmKKtJUhRaZBEUBg90Z1pIKViAuWosTOLKnTJuPMoRcoi9X75OZptNVkW8wj3GEemczoVIQgc/H8r0sbYh4a7m7ThzysycV3HgRpo/fIE5PsduyPi68rJ/KH/dzuqXno5541d3YUpjo8Hiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eC7kedE1; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eC7kedE1"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-607206f0d57so2584775a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Jul 2025 03:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751365474; x=1751970274; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GUhtn5RG9Qyt3qmH9EZcO8PZo3a4nOb2nOYzpePWtbY=;
        b=eC7kedE1+HlcSQnWD7pGFepZd3WGhFxlZz3FvLs/k1eIfHYp5c5daETiJNhGdqbd0P
         /dZH8fWN6IC89/+wbB4H8esq2G+EZ0Z8Cy/JxWmiBlx8zKe5EaC0oSMJSIVHH9HajixL
         GRIbV1CmCz/NfXXgwO6ck0r1nVdUltPghXePaY0ig8opygrnPQYLQgzf9QMnkTU+27Mt
         sprCGjAKgFZZpetNiTS36A6G6D9/iyg2gt34QtyefCaWrbQkzWHNNiNhydZJZUtUPmKo
         e3f1IUTxRTeTXssE2na5+KKo+Ql30ixDqPRsyqdJIsajvACoMGhAdGf6qy8edZECx0IT
         XN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365474; x=1751970274;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUhtn5RG9Qyt3qmH9EZcO8PZo3a4nOb2nOYzpePWtbY=;
        b=Kl00NMry1tHbot9jhIh6nwZeN3qDWjTWNoLZdFgPfihCz1ZmJksAPQ5H2Gt8/PrvWE
         g6BX8dkqUy1FvrX/hTl4MBtc0KT8MbPJ5sX3BVo6tir9k5mAjzRhmTScnKzz6f27AdJk
         GZnMwWus2mHWYqV6vJmhqUlV9bf5X24y0w0PKQCOJRukICS1QFsLh8scneWZEFZZjpCf
         y8ao+t8LkH02mLn+v0cO68kbxr+bKwK3uiwKY+Bs/mil2/IrCywRYERXb8+yD6JhPmZt
         aSIxL0pXrRt04rcJV8U7tTg4X9LQGng1bUryfXzvqXr5KG19tulm/I6WVldte52NdEQu
         /6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+JOswLc6iME5/yDWdnQPs+3BhvIT90r0rWj3nvdPw08VVl7X50ysa5J44js8YT0jG1Xl6Y7UKjA2H8w3glQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLTQt6aTbXCHDVFK5gRtYa6bAAuxPWxZbzQQv+P3yH7n3F3YH3
	O0j8AqgGjJhzF8mfRXb4ArHt6YW+bp/SwibjdcopqE0Hwbjrs2unueHi7Gnqv4UgXTeflDxGzvd
	MW29IRi3KWXvajucnSA==
X-Google-Smtp-Source: AGHT+IFeLVmEdincwRIecInghJ8Lwip41MVfmuoZTlfQBus5dMVBnFrpiXqzg//PJ+GcGjLhtKgP2XEhLbDGfdk=
X-Received: from edau21.prod.google.com ([2002:a50:9515:0:b0:609:5b37:161])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5209:b0:60c:3ecd:5163 with SMTP id 4fb4d7f45d1cf-60c88e9b3femr15675912a12.26.1751365474174;
 Tue, 01 Jul 2025 03:24:34 -0700 (PDT)
Date: Tue, 1 Jul 2025 10:24:33 +0000
In-Reply-To: <20250628165120.90149-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250628165120.90149-1-dakr@kernel.org>
Message-ID: <aGO3QgrGSgN5X2hz@google.com>
Subject: Re: [PATCH] rust: dma: require mutable reference for as_slice_mut()
 and write()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, a.hindborg@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	acourbot@nvidia.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Jun 28, 2025 at 06:49:54PM +0200, Danilo Krummrich wrote:
> Given the safety requirements of as_slice_mut() and write() taking an
> immutable reference is technically not incorrect.
> 
> However, let's leverage the compiler's capabilities and require a
> mutable reference to ensure exclusive access.
> 
> This also fixes a clippy warning introduced with 1.88:
> 
>   warning: mutable borrow from immutable input(s)
>      --> rust/kernel/dma.rs:297:78
>       |
>   297 |     pub unsafe fn as_slice_mut(&self, offset: usize, count: usize) -> Result<&mut [T]> {
>       |                                                                              ^^^^^^^^
> 
> Fixes: d37a39f607c4 ("rust: dma: add as_slice/write functions for CoherentAllocation")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I'm not sure if `as_slice_mut()` is exactly the right API we want
long-term, but this is a step in the right direction.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
