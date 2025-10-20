Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99C42E9EBA
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948334; cv=none; b=M9yi07W8+nSA0KgZE0Js3iHYV9Y4mUzJgVkuOsaKkpxWTgCHJDLeeIicNvZ4NAhrEnIIfqw3o2aOXEeXEJRSLmdkShAi25CE6UAK8aUmGGU8Uwg7xfzZ89rVsdbxL1NuD00JiCwboLhjpKoOVFzYpSeAdczFPSQLrL+hDh9c32Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948334; c=relaxed/simple;
	bh=imvN6OIlDvER3dnhuPZTK+cbR4jLuWrSlQXSWBmvKsw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pwj7hDWOIE/kx7Lhw7fg5wESV8ZHmoF6e7W/H8pHIjYsjXOUXeHQdk+HXTrrAemVW36luppdF5nkdO7Tx5d/IfGfpkyb7zq7V+m6X9hI0OR71cvfPI6jQNXGEeQQUuN8CbccWTbm+htD3IA+JARHbH0i9SWqvc8hdyZvULl2pII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PCEu12VJ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PCEu12VJ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46b303f6c9cso49240365e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760948330; x=1761553130; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+TidoBM6UYTxK1t76ZQ0iqUFS3cENqqtCJBnIaW78OY=;
        b=PCEu12VJ//CKm6HUi5w5ug0snNU2foDOcU2pU4awLYhtlviLxFreHMzPBZnfi/hPaP
         0jrvGJrc85AwjWNk73o6eA/2L/8yBMtl6ew4qo5gRpRbm4o09FUOVyzs8NbVIa3ZRTmM
         QWH1PcekX9a4lR4QRqik+qgc+FevA1O1lBPrr3+GWkG2K754c9rtnpLWjUSrRbCjMwwP
         bhE0j4yuOgOECLwpufI15oiZ2zZMOQCOwpUieoLht7/IH/mllKXDbVPPhpaOJo0SN1Y7
         wHWJznJ+aMYDJdHqjovbTAyBjaUBwOh5+jLk1fruv34MRIzGMjpHzJHWz6Gdz94R4HtQ
         f1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760948330; x=1761553130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TidoBM6UYTxK1t76ZQ0iqUFS3cENqqtCJBnIaW78OY=;
        b=Hn1D8u32dvBb89WaHgqRsjCsHqj4O7sM92/LHcAXgi0a9V+DjUAF3ClmLPslMYqQJd
         TviU2en8AtK18+DCqvWxNDfIYq+yXuOCDenEVFPpZAcMWRYkIYeLMj4yBowiex1OWYPS
         S10jzqVoZ8oAezJWaX6HYcj+B9gd3MX740QsAsqPOo8i09Av1I1nKCeKPbp407wKxzqu
         xzhs5QTmD2I/v4EgrLmh912EpVFaFaPxCJsXOCAawzcAv0hSntg5S8xztx8BZAY7ypxo
         2ctIog+Q0PQ6P8Ka0Wi3JfQOdPeHkvW16Ozh4CaoBJ/WT9kISLFpjbE9yNuO7bAbDhlR
         3zAg==
X-Forwarded-Encrypted: i=1; AJvYcCXoyCX5BIrE1GpncNclxD5pn/bLr3DOfTPiBO/KdQlwWM+IDDHXDDDe0ftX4sy7mMW25NUD6L1I4ZrxsOuEKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/iW7bVwma3cYKt17MpXn4wvFeiqWk6vvTFhDG5LEtG9hGpjxV
	YQDFLYBzKNkgB/AdhEOVo68yl6NSTT9LKkJavGpPPU3i4zOF3p0GAhuXhSVbR8IwkWmqbt2matS
	GzcH+rCt2Axtt2yrFug==
X-Google-Smtp-Source: AGHT+IH6cTvgvqBVmanxid/HP3GehfJar/GV5OoQ4tMxA1m0oJwddpwo/mBB/g6vXikA+BLp7VSPyKDcGfE3VEA=
X-Received: from wmwo28.prod.google.com ([2002:a05:600d:439c:b0:46e:6605:3ac2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e0a:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-4711791c522mr82363995e9.27.1760948329742;
 Mon, 20 Oct 2025 01:18:49 -0700 (PDT)
Date: Mon, 20 Oct 2025 08:18:48 +0000
In-Reply-To: <20251020031204.78917-1-huangsiyuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251020031204.78917-1-huangsiyuan@kylinos.cn>
Message-ID: <aPXwaDI8RUjMzMKI@google.com>
Subject: Re: [PATCH] rust: acpi: replace `core::mem::zeroed` with `pin_init::zeroed`
From: Alice Ryhl <aliceryhl@google.com>
To: Siyuan Huang <huangsiyuan@kylinos.cn>
Cc: rafael@kernel.org, lenb@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, linux-acpi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 20, 2025 at 11:12:04AM +0800, Siyuan Huang wrote:
> All types in `bindings` implement `Zeroable` if they can, so use
> `pin_init::zeroed` instead of relying on `unsafe` code.
> 
> If this ends up not compiling in the future, something in bindgen or on
> the C side changed and is most likely incorrect.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Siyuan Huang <huangsiyuan@kylinos.cn>

We should make this method accessible under kernel::ffi:: since that's
IMO a better path for it for cases like this. It doesn't really have
anything to do with pin_init in this use-case.

Regardless:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
