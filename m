Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546470;
	b=z2+aC+GXc9vZ9cCWp64d8pBi1ENUXz/hLQjN6qiJkJim9LdSfZax74nK5rf2cZDFmCJc
	 qoxsE9TSdmtZQ0ZEOcz23lAoIcTHxuiyWrkUcc1nlGIaMGz10fLpu8YDCwJ0T9KmkOVWI
	 I3/O50mWqypocygW7nckaevG50+2nW/alyp1jRn+2FygBj5bT4agky/70VYs5NNmUFsu3
	 ygvZ3Xr6njKHHynyI3QY2CUmUb5f46dBk5qoNaINPrTD578aY2Me3dXusX3N1NIpqmyDW
	 ESKzIdDePDSc9Q4SXoPxShxzCPDZc+QZbVYDD6pkcKbEuydYYV3KcmvxlnFraGfK5zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=JlXoPCsikAIAHDol8QyOvxuGmdfr1LiWSUW7tFYnhrg=;
	b=wrtxZJWIq7ZiIedCNWAji7kNsxWwx2gjbeI1pxnGhzfZzhvXsQU/v8oHIqXqWkcvyewR
	 uaxrB3O/o/2in2CCPpIgEwGuzr3OgymVR/65TZxfMF+/i3instbf3KlFI3N2CFS7O2Zyk
	 cEXxWbi5/g+oYnRA3uOq/9CrifjJ186dHqqboNkuXsdWzRMQXqZ4wqCg+V2MsC6rRSbCP
	 +89kf08LVUyKwnWreOGuMFguxDEVyjKWmCg2S5kJetCtJ3UcCW7m47aveebKhm8e66d8w
	 NcvIhFPJMwRBNdW599iWI21r1NeBKFchIyA+pQ/dIuIJ5GQYy/o42ir6opeKFSuw3oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cs25wCsA;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0228606A337
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 18:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0228606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cs25wCsA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso34923915e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 10:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795546468; x=1796151268; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JlXoPCsikAIAHDol8QyOvxuGmdfr1LiWSUW7tFYnhrg=;
        b=cs25wCsAxCYY1cJ6Eg6HcinqoZc4Ui95SsWD9SLhzVgU9u/mUxznVWamPkE2XUy9im
         X/HlL+u7UcI3aNc3FzmSU76n3MgItgzvA6DYEWvBqbHJ89HkiI/ifBOIPcmQsbvm5d4L
         25i7cMtrd5kDP3pE06QF6T/9Zwhqyv55lSL8mQHH/Pcn6HKj3j/D8ReXSupuP0dBhD8n
         jSEJ3wxGu3hy9nNNnai4mTjQzEn5MZceDId9G2WpRaDBJMdBQFG97YOhdsxgPoBif4m6
         Bod4+sfeFwg1WgTpD12YLxcsBTgou/BIqJ74NmyXFx1KPGFl09D/8ejYplf7reCdI7F/
         +5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546468; x=1796151268;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlXoPCsikAIAHDol8QyOvxuGmdfr1LiWSUW7tFYnhrg=;
        b=I8nrF/IC09gb0YPzMvVv9MM3PEo5bhFzSCX6xFDFlk8m9+9rf/sNtDymj89S2/cRlF
         0eULJ+/k6/+LKr3pfrTLDLu+JATZFOZsSIyY/9mdQMheogpEyVtxUjuG/0Z9yg1hv/lY
         fjz1rqruKUvwTnc+HyKG2W5hzTJ3MbfQOIOERQuQu1vaERozqszm5r6h360HaIsVE3jK
         F2TDPB8WomXnesGocM1FCOGXMn2NBaqdmXOfBpZGVmj1UhvxVdviQvZqihKLBJGPmx9a
         ok8Yl9KZNmcLG66tKNCRaTkC6kTV13u/cBVJAn63abz0wVjfuTH5RkDUP0VmrjgMfBga
         q+Cg==
X-Forwarded-Encrypted: i=1; AL+hErHbbi5A6VRP/BW86BrYtk1xjY9bzaOz1YxpX8zL78f0pPHT3gp7qTH9B1R46jF9d7VsPBvfzuShPLnhkY+B/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uv6ReKmolIGh2pjE98JmTwuCmheqfEOsguExpoAI9/q878OCk
	J+Ym1S+JZyLs9NpL+w6yw7WFUBY75NtTn+1hi2XxQPIkqU96jAcz8cISRB780q2vHFjtf72AVB7
	nCmJYuRoXAyH0LP7bJg==
X-Received: from wmbje17.prod.google.com ([2002:a05:600c:1f91:b0:4bb:5e69:8177])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr377886255e9.23.1795546468273;
 Tue, 24 Nov 2026 10:54:28 -0800 (PST)
Date: Tue, 24 Nov 2026 18:54:27 +0000
In-Reply-To: <20261119-fix-drm-rust-fdinfo-v1-1-c10f4134488d@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119-fix-drm-rust-fdinfo-v1-1-c10f4134488d@gmail.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124185427.3821700-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: enable standard fdinfo for Rust drivers
From: Alice Ryhl <aliceryhl@google.com>
To: Peder Bergan <peder.bergan@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	Asahi Lina <lina+kernel@asahilina.net>, Lyude Paul <lyude@redhat.com>, 
	Janne Grunau <j@jannau.net>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 10:48:47AM +0100, Peder Bergan wrote:
> DRM monitoring tools use drm-driver and drm-client-id in procfs fdinfo
> to identify DRM clients. The common Rust DRM file operations leave
> show_fdinfo unset, so these entries are missing for those clients.
>
> Set show_fdinfo to drm_show_fdinfo. The DRM core helper emits the
> standard client information and calls the separate driver statistics
> hook if the driver provides one.
>
> Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")
> Closes: https://github.com/Rust-for-Linux/linux/issues/1266
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
