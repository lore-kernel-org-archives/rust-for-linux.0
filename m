Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0618C30F531
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 11:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774177639; cv=pass; b=ZV0mR51HoEOBbZS6mUENgmh8PdJVj8/DarbL1fmJNlaWA58/u/EAHX6UK3ZdkdIkxO2u7Lig3+Vl7gnNBg/QASLRZnSfRGpRxE4zZODzn16KS9RtKop1hdI3IPi2z828LQop8FpibtIPHrgq41nFIQGGgP14nfmZ68/ouOEwd+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774177639; c=relaxed/simple;
	bh=gvtTpkQne7LV/j8cKiXI+qrmKSSfF7shyrzLqW2IuWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lCFXuOvFKNoXSujtJw5rIzDx0ix2rWklJ3k1OCmOV/qvtFlaht6uVreYKSP7NPMbrr53Rd28plakKycEd57kN/mGriVBLcLNUMMeH71jZCOjbvNq3AWQhakEmNLKU5ZOC+EvexVfY+MzCJUbqnpbXkw/lOr7iKJsrVdjappTdgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fFVRr+bj; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fFVRr+bj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso3326057f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 04:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774177636; cv=none;
        d=google.com; s=arc-20240605;
        b=HanJf2PJtRcuyNf8ug3HrUqLqVuVh4vmT+nZRgXZxCIrLAo0eMpB2L1w6LND/zPyFC
         gpaAT0M2B7k1RlyN3QI3GE8evyqOUR9B/ZEfpypq9YUPLjqbSwhgdP0gY5dzRlTlTVeO
         SF+M5M/xxMLv2LwsFLzNZun72vaoGUqQ10Q5MgSB/gomn8GTW/b1rr2O0r5qmHIh9Tsw
         SH/TB9AYDKCpfuJmdj3eL9qs4ATRkhzfOYpEJ9+Q5K2Vb/+vEFP5z2hIMQkrynAC0Riu
         JzweXV9ubx0s1MXLGecE5n3RlRnWybb6xtt5Blw1F2vPa3wiU75hK/qQpfOPgmxIKFzx
         LnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gvtTpkQne7LV/j8cKiXI+qrmKSSfF7shyrzLqW2IuWI=;
        fh=YmIdPmnOZD4e9csmQ3GIFypq2fXKu/4CWc0wB8yPjMQ=;
        b=G61z+dHR2gh01pXt36i7fqBP+LsdOeqZVWFaUw12LoJiOJrYWF1aFwvfY7fuVcd2x0
         eYgvAAllDzgU0HvD6kH44BZlOaKCOToN5PyXVEpG9ellSHIpy1axJw+DBef2jOzdk2Ae
         khfIcDufSB1DCvSfajTzxuMpcBDKIEZiCNbthIOAujUynU0tUGMFxEgJ6gsG6cNpbIPo
         eEIiyfp5MSUGFl7o23uCoX4yE5bvTHHcXUtYJAAFLDPLFOWiO5Gt+Io8K09KIMrkCVKH
         6DLYVV6i+vNhURo8RIA8zuYb4vp6vWY6np056Lql9TGsMKGCiSobf/Aoot6J1MQvrELL
         Mh1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774177636; x=1774782436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvtTpkQne7LV/j8cKiXI+qrmKSSfF7shyrzLqW2IuWI=;
        b=fFVRr+bjUjwjFv6Pee7sHlmI7jO6DLjc3xDpaU5X9zKKU5TRicFOkVLdC5MqMk3EeN
         3nftd3NwDPV80eNNaQu7M7j+25A3HOnRLVqFxaAz3UDcWFvPj6ZW+4+8m3h1SsANEKhr
         XIbDGJE2jZXrdD1mveoi8hQqYZcLjvlPlxSi602UXQxIy7uSe6WBTQGm6Uu7KzLziKRS
         QijBy3qm2IFDKwoeGRoPoRHfM3V8a5jsPTay2YP6LpKqTmS+3ftYvrCAqmM8rzPvrhhh
         2NkgA/WlY82ilN0N2FCJ741XWr60tCRacAG+MwiFxd04Us5OqfsIdNO0+P7ngwOUplqS
         S22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774177636; x=1774782436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gvtTpkQne7LV/j8cKiXI+qrmKSSfF7shyrzLqW2IuWI=;
        b=bdgCtQmpvIaXkjgH9PJJhh2a8EUjVYZDIw4Oukitm1+NkOqlgW/Squikhkggl9UXWB
         WxLvkerJhmuJxJF6DblvfWmPzpNx35sTX+GlZmuXQp20p5Pd6+cOaRczJybBvf79jYO/
         Vuswk0B+EqkjbBvPyZCZabm+dDmedk+zuPOYqzxgxFnGsmVvAlJUooe0PgQGSY55OQLq
         V1xKJlXsGlnQLZXLC9RrohM+WahtElsznx4idGnwGJqOmYPj61zd23THfqeQ+gv+SVDS
         Zqyv6qx20jXwh6qEhcdyPcLb0v/5FLgmE8jfmABv+cL+AuF0d77sKx9nZzkVJT6VQZry
         4oVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwzSzJB5FnhbIh4NMWHh63UW+BNKtr7rMPFxrJYLBNikFsUBU7voiZInJplIvebYRKuvAjUkVVZ1OVZDiVlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2oJJTcKxPCPaTPvY++umhwp/pczciMuMQTbPeCT8gdLCf+ycD
	/mJoW743pYxPE755c/8I6/zg6QkBVCWpHYX+s/g79umwLrqecNJVFHHwhQqxXyyfoQo3Ggs7j/Z
	G3dt/MYX8eAHTFF7wcSzTJF3Z1t3eRdn78VcO7taZ
X-Gm-Gg: ATEYQzxE6ZpuESQOYuw9BNZcyr9/RMnObn5ks6lZSqU3HIjJxRcGwMrSGbfWq/yCCpO
	3dUw+Gxz9VxK8csLhaMWhs7KDwS85ap3DWm8swy0Jy4E+wISU3wZnYRmm3/xyfu1MjEZN6y+0gr
	tiU858abq/y/JSb+dL9hNrOnKpkxXqHCHqfApjFkYlxOkdJaG6DTQCyZvkEUR3J8teuYl3M1+v7
	nA0XLQHSIRUiroVTc9rlor2jyGZczZXYYpL/wsH4WiPxURJKCxyTg2ElGN8Mw+Z9G2EUIyKm7El
	fuGKFZU2XFr1GirVUc7nTZaezDpT2M57t8OA0sUN8cTBRCbe
X-Received: by 2002:a05:6000:420a:b0:43b:498f:dcec with SMTP id
 ffacd0b85a97d-43b6423287dmr13588528f8f.3.1774177636049; Sun, 22 Mar 2026
 04:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321172749.592387-1-dakr@kernel.org>
In-Reply-To: <20260321172749.592387-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 22 Mar 2026 12:07:03 +0100
X-Gm-Features: AQROBzBApyQfE-ScLGU2x2ibUvgga-dh4itt4h7qwXjWFehs-qG5x3_XOAmIH2U
Message-ID: <CAH5fLghK2q4Du+74ctWftbDXrS4E4uPsuOrsOwxbs=HGm5CX6g@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: dma: remove DMA_ATTR_NO_KERNEL_MAPPING from
 public attrs
To: Danilo Krummrich <dakr@kernel.org>
Cc: abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, a.hindborg@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, tmgross@umich.edu, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 6:27=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> When DMA_ATTR_NO_KERNEL_MAPPING is passed to dma_alloc_attrs(), the
> returned CPU address is not a pointer to the allocated memory but an
> opaque handle (e.g. struct page *).
>
> Coherent<T> (or CoherentAllocation<T> respectively) stores this value as
> NonNull<T> and exposes methods that dereference it and even modify its
> contents.
>
> Remove the flag from the public attrs module such that drivers cannot
> pass it to Coherent<T> (or CoherentAllocation<T> respectively) in the
> first place.
>
> Instead DMA_ATTR_NO_KERNEL_MAPPING can be supported with an additional
> opaque type (e.g. CoherentHandle) which does not provide access to the
> allocated memory.
>
> Cc: stable@vger.kernel.org
> Fixes: ad2907b4e308 ("rust: add dma coherent allocator abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
