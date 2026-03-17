Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7ED33F38B
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 06:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730039; cv=none; b=rPyFX1CdCSHyPvhcylQEQJHQHxrZGexLnOd03c2aILhZF8JawdCrW5Mqsb83beWQ14QFXR8GtbExmx3v0wA2I0TTAtY7HACry9aBKCI3FoQWWjdHfFoJxCrPC2E9Ko9WpYbi6Y62tfv/ZW+HT78t3BfzCWvu8qe1DgjX0kUeWLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730039; c=relaxed/simple;
	bh=xgF1LFYaYos4BSjAvKO5sCMhdKO6UYeNzPHvYUAYG5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aWEQXtIrFo9wfqR6Sku4IBvq5R9KxJt+N4mVe8R94sqo9fsxnpyxnmhMJOh2jcr1EbpyKy1HOMFch0JgPM0Jdu8sb+4o+o6hiAPJ/20hh5ham0tNTKrmvhvGlHrjuOH0TiRzyZ2+6tde76AgFOk6/BOIkRFy3dVSehqxN4AA9/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oIN4WpYL; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oIN4WpYL"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-485c45885e6so2049165e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 23:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773730035; x=1774334835; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+LfXYyK2K5YV7GwOcQbmsbmYUjdllavbSwogkW6CuYU=;
        b=oIN4WpYL1BbaNIHUN0PRMo22pHpPGTc8BU+DzSNMmVPDCtoYkUARNcuwcWDYcM+Joo
         tWIXJyiQ5jolgz2Osaq4l6QRp2ICGmMABJT/EoIoR/3xGWB6P4TNBC3A0lqQJiCG7Rp/
         M/4lOQys3hOonhD2Mw53daShBUIA6TLWiVpTbybY6Szufns8N+J4lXiIT8T5yHlxlKNm
         ZjQHbXdAEOB6EIRGt1ZsDi0Ou9wI0k4CN6/24lwXKQ+b5PB5Ly+8C71fKMljJxLO7kj8
         wXypy9POyLULSoNNjNU/NWDZx4CqjsMp3QdsX/4AsmgB2kV7zKo7RxWslxhCvMDJbzgs
         oEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730035; x=1774334835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LfXYyK2K5YV7GwOcQbmsbmYUjdllavbSwogkW6CuYU=;
        b=r+YOqoC7GoX6mUrthSAS+AxVJK+89WO20NTPS/vd0IJeJfMMPPQ1Xzwn8aZl/iR1mY
         MzrKFWozCEPKV0+fyZFqqwsIEJrBbUZv9ygs73bwa7VviF7h1etGwkDN2iK83Q6RDChF
         DNRL20SiNkPbPv1s18gmf0TrYqS9u8WGASC0IwzVWHHy5cNZ89CP8cSDkWwjxB4jfa6c
         1nhMSdNyElPPe7fAvU+bAJ9oqxW4jGguxknugWd6KnLRXQBM32ykJakRKWFaO5BJZONr
         i3/a2jlSU1TeU9JPXDkzLhs/TkPxcX8JHVqIWwE3Ia/clC0UChloWvwDTNN+RlZKBu8L
         Xdtw==
X-Forwarded-Encrypted: i=1; AJvYcCWXxWeeLBXKtzSKQev3Md/sM/Nz2UJNNLtcWnqV91062uRnGPDe8YTaAVX9Y6ALgJ2hwhk/u4QGi8YDQX/dSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ8CwdRsAGDeaX0B4KT70TGY6TdF0VwmRgiJTHiOXCq3Vw13m9
	G5KfQUaC4aFetL6OZLPOGgWy7EtoFbjBsVzwc/NaGagC1TEHWeecj006E5xttuWAzIkY+88n73Z
	i9TjvXAHNqjlFuW7XXA==
X-Received: from wmpj3.prod.google.com ([2002:a05:600c:4883:b0:483:509d:729b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8a0c:20b0:485:54cd:6e4e with SMTP id 5b1f17b1804b1-485566facebmr200570335e9.18.1773730035474;
 Mon, 16 Mar 2026 23:47:15 -0700 (PDT)
Date: Tue, 17 Mar 2026 06:47:14 +0000
In-Reply-To: <20260303162314.94363-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260303162314.94363-1-dakr@kernel.org> <20260303162314.94363-4-dakr@kernel.org>
Message-ID: <abj48uggZonBXPsf@google.com>
Subject: Re: [PATCH 3/8] rust: dma: add zeroed constructor to `Coherent`
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, driver-core@lists.linux.dev, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 03, 2026 at 05:22:54PM +0100, Danilo Krummrich wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> These constructors create a coherent container of a single object
> instead of slice. They are named `zeroed` and `zeroed_with_attrs` to
> emphasis that they are created initialized zeroed. It is intended that
> there'll be new constructors that take `PinInit` instead of zeroing.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
