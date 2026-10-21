Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562084;
	b=uFiJF1abe1rKh3BQAuU8XXpS5g+x0muIJBNcBONkUJeWHEH36mYS/8Xj9TRNb5Y8y8Yv
	 UkPA7lSvzypdG6eL6qVdLyyWd4x4qvuYGqZ4OXMhaBqhIAmuckTlatgp39s/qBgJPA0P1
	 elC63HuntgMpThHiaMUgcqayQVgLskWad7Ww3o5uPWn1MKk/z756awFd8KexLZcCbXWN9
	 XnreMx2rkmwr/hTCQiBAHHXK99D4zaSKGEWu/ZlvfL5t99feSBH4BPgQMKcehioaD6Ps6
	 N4Liu+bws5g3b4HXF0FgfGIzI3hEL22r1LWzoXg8xY1fkwmAxCfDi8yw5AmC8T4O9tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=oPtFhbSnZ7731aXLuIJiHjV7KNwM+FeYkV7XoCnepXM=;
	b=vqPMozwxpcnghNL4EeVCQpDvGGTybAS02cPNvXL37l1dsGmUXtuaHt9vhyQfuqoLXaKM
	 jOKxrxwJMDA+Wj0FoY6vWJ/hpwyYwod4UFeFgs3gRl2SDRgWwUba7bXenovtIWEdKnhFg
	 zYmuO8eRyalCcVJSzLIaj5M17IM/3vXiCLP2iJjzM8KIA3jAeI59robNZjZTo/pHGd2PN
	 nhFoaBRDN47xaUJ1DwF3zzPJm9A+H/Gcx3okwAdxH3UIv3P7vu7+Rs9oA1lYw3BBnrRps
	 utnOuLLlhFQlQKZoWsTkj87IcW1jY50blu2uw7IKny/KN/D4JeuWdA3/v8zzxURRWqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SgTCXbJH;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBAC606A31A
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 05:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCBAC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SgTCXbJH
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c44903d6927so27309266b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 22:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792562082; x=1793166882; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPtFhbSnZ7731aXLuIJiHjV7KNwM+FeYkV7XoCnepXM=;
        b=SgTCXbJHpiyojRYx5mexvXL0tpmSW0v7NrZOFIPXTTkuE7LkAoguv4T6oERP9suhuQ
         gO/51tZF+zEQNLtgWWy+UVgvnzbxaQG5+ibB8fNkra7Mm0msme9fbmXdhHRdbAfn0ABV
         86Vey0bGa8cRyTUmFQMXlcXFFsc0BpBf6ObNlrr0n8Q/7JWbmwW8nu1QGcU1aHZTXTLX
         Ln/M174AHqZ4a3k5z6uuLupB2Ik4xGnUirytzb1w0gCe0dUFtD55Mg7Ku42HeePelC26
         UFYtpKI5P9N1gPbEIBQyF5Lm11VtbsXSScecHJvjnKdJhBFdJ2F1OxGd58IH4qyhCmFq
         +7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562082; x=1793166882;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPtFhbSnZ7731aXLuIJiHjV7KNwM+FeYkV7XoCnepXM=;
        b=BfSHGuaTYw/rziU0pCtEU27MQGTHQ+psiBFXCKUdj/iYEZC1QhaGnup9bQRBqxe+xQ
         NAR1mtm4iBE+5ZldbEAzXkqoQmTlzUppWTBcrI7Lrk/rMzb8iN+nim8TwXVbfFYzmZ94
         045wxehslzNv8IOdFifdwjacFOXr4JoKXFgNWfrJ16aMUaBQc4NjofVnEsj9lUwxvF4u
         7SuPLh9E6bwHFj89kgkE6DE2F5T4yEJj5p5u5pDmpNgua+q8IivkFf9X/XiFKU53M929
         Pn54St2FNka0TiFg7cxMeyBbXxA9ZuCpi9KSWg7G2Izguk+92SLDbgR2YWgt2SsWuVYD
         tmwA==
X-Forwarded-Encrypted: i=1; AKwUvByAO8pMbNozXd/HFdvWdC+KtmBUI/94mfjKQsT+TfhkIyXkRYCxm8CFldML8wtoAFZBt8lN8Ze4Ebb0fgjY5g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJr/kEDcUjDqbpWo/gUiPF8D0BskfihBv5zWI+pNe2yNiGcisQS
	vB8uPXGqO9oHreC7V38dGqOm7jMuT8+46Qp4M7G2XfDwRgCSqTE3AN3HerBEwxg0u0yLE/2EnfT
	6Iuc/j8HNW1GDmmhm8Q==
X-Received: from ejec2.prod.google.com ([2002:a17:906:1702:b0:c3b:9071:bf1e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c499:b0:c41:f29:72b1 with SMTP id a640c23a62f3a-c4679b52fb4mr81117566b.47.1792562082098;
 Tue, 20 Oct 2026 22:54:42 -0700 (PDT)
Date: Wed, 21 Oct 2026 05:54:40 +0000
In-Reply-To: <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com> <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com>
Message-ID: <athToIRyTjSB_jVg@google.com>
Subject: Re: [PATCH v5 1/2] rust: add zerocopy to bindings and uapi
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Jesung Yang <y.j3ms.n@gmail.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 20, 2026 at 04:47:48PM -0700, Deborah Brouwer wrote:
> Make the zerocopy and zerocopy_derive crates available to use when
> building the bindings and uapi crates and their tests. Also make the
> zerocopy and zerocopy_derive crates available to rust-analyzer when it
> runs on the bindings and uapi crates.
> 
> This will be used by the Tyr driver that needs the traits IntoBytes and
> Immutable to safely copy the struct byte-for-byte to userspace.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Miguel, is this something we can take through drm-rust-next? Or perhaps
you want to take both through rust-next? Let me know what you prefer.

Alice
