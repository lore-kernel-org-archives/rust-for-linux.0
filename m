Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2572EF657
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 11:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862731; cv=none; b=JIFKRHZuuQYAYpSL/NQOmUIvskong7gEwlscoQQMd/EgdPz8VoDuTnsy3wGLJU+pO/leIolZVsCybOaJKi1u3DMySg0gJUJsxq+oGosipqd5BERxF2SIuhvWuurhOhFe7yab2HWNYOZkUORxU+C0MnkT2o4e6eEXfvXJpVMrptQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862731; c=relaxed/simple;
	bh=m+A9WcXi5zkO3a4udqaXufGb0jNFoo6PlkvfjpuydaQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LjPxJqgHcztDQn+o3Er/jXxJeOylHpDxt97KlkVgbNy7CEKm4eKxTT8nJtFC0rX5p7Dwke23mDx+1ka6NPmQJKPgsT+kRbVek6H43K8HVthCHHTzLEsFR7Mw5QWlcPk4zm4hNzhZhpR0qg9qyOc+Fl3BgMbu3Zxl9L6embXkcE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=leIePJR/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="leIePJR/"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45a1b0514a5so9823805e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 04:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755862727; x=1756467527; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CFcr6uz0jG9ffYUWcqfQzbDevoZ3JeHXkrQo4S5TjdQ=;
        b=leIePJR/ntGiXCVjY7d5+6+xISvElRqLJnMhnW6QCJtaL5jUqYdyKeJ0SmLt3usA3U
         2+ydUXOsCSLoLZFNclBiOTzPfF0hR53s6StWKeAXaUb7T7aAdBsxrNjRwryLtFhKx1b4
         IEWzIy5bCi9hMU5KiDhB+kWQxvHvUl96yrA8bZT7PIjKpDjarX3ct6tIsELrOz8g7Qof
         MQUUxCKzMVJN0KOOWJBvS7D0BrgHpjFP1jQ6eDnfp0193USwEFcn39k9aThoEuj7ChSa
         VR+/oQ6iOZEu2AQAfNipAzPMUJHCltis7opfJnN9A9rLhoak7FKQV1Aak9DgoKxC4NGB
         D4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862727; x=1756467527;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFcr6uz0jG9ffYUWcqfQzbDevoZ3JeHXkrQo4S5TjdQ=;
        b=P7TRwL55xGMiCMcxOMRNDfuaAq5QwMATkvhOo14L3bGp8a53q3Grj5VOYpaklNBzgP
         zAVbbZXAtF23HwfnaRFRrOG3d81ErFSpGAKNVceNDc2SlhXrkHuqHQcp+fQE6B7An5Db
         Y191D0EsNtDQhDD7jImY/Q95WlxGnJJdR0cvlBtNbHGc4dfqvfwQR44uucAywPf8lVVr
         tPfjLoFWD/lcw953SI+05FO3deeFkHmoWqzOwYdyqYvpjg6sLhirAoIkg46ESSL9XLHs
         PcgQfGm8elKfu88mWKEsWJANneN3m1XceudJcnysE+s/sEbSCF+6B4h9+s5Byn3is7A9
         2JVg==
X-Forwarded-Encrypted: i=1; AJvYcCWuSFkNQYrF74SRN6JBXXL4I7bMHrwr5Z/98V9OHML6buED7eK0pg1D/Atp92pKEpQ2yp14r1a25H7ay472xA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySWZ7fCEO4ROJ8zL3X/vtdugSfaa9juh6CcQZuDb8ScjK8hHfp
	lm77WDAgUGBbAy/MwVo9gwtezmzYFID1ZNtdzPzlWtsmsI1PQUEtwB+GOrVsNIB/MoW2jUz9s1y
	b4jFfifiSNLh9F4wvLA==
X-Google-Smtp-Source: AGHT+IFj165R5y0xOFN9mQjeC9un8ZkWRh+o/LKKA4frRy8x/8931NLrOa9vNTnnCurNnFmGJfO6w53TOHPIGVg=
X-Received: from wmsr18.prod.google.com ([2002:a05:600c:8b12:b0:458:be4f:f5e5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c5:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-45b517e95a3mr20199435e9.29.1755862727525;
 Fri, 22 Aug 2025 04:38:47 -0700 (PDT)
Date: Fri, 22 Aug 2025 11:38:46 +0000
In-Reply-To: <20250820165431.170195-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250820165431.170195-1-dakr@kernel.org> <20250820165431.170195-3-dakr@kernel.org>
Message-ID: <aKhWxpyqpneA1AiG@google.com>
Subject: Re: [PATCH v2 2/5] rust: dma: add type alias for bindings::dma_addr_t
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, jgg@ziepe.ca, 
	lyude@redhat.com, robin.murphy@arm.com, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 20, 2025 at 06:52:56PM +0200, Danilo Krummrich wrote:
> Add a type alias for bindings::dma_addr_t (DmaAddress), such that we do
> not have to access bindings directly.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
