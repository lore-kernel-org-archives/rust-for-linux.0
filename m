Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687383;
	b=CnLowwU9ctqd7t5l/YzIgZVIf3RxT8LbedMjGJJ+DFbv0OKRMyJdPZeb3OsFWGQb5SCx
	 w6TlSDRweAUmUDkZzBmwd8CjKnl5HH4VQHhwOvncOEgOL7bB8yT7K1G9qc+pt3WLTd6nc
	 +W/8GOkJX76H3i8Msaik+pUDTNXgpELk66+xbCtnpMVaieGrjn0vAe9BhZKYRkRNaJjZt
	 f0iWxHoVKGbM5/YuXdHucX6L1qzh1HwFVQ6qk2udl8ABBqebR3UQ7BzyTZbMsL4HATR+w
	 5svTyVIm6AIaC4DKUJxtnEGJEEasFwY1Ws4FCwmcwK9kP6Nu1EaRQqxKDM9KZfb/nIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Z+D36NsUsNKkqF7ketqLvXXyv+j/mhnbTnZNBUdnCJ8=;
	b=DIsEp5YnBWHTaK+90Y8L4A/UFvyepiztnuNNz3MMGWqrmqQwcokPpwxjc3snVd/i/8sr
	 YuadO4jdBmVsgvuDJJFqKOoNcqdTla6nBm7qNSqi8M6ZriYWUm3FeCitcjlXHWV/Gd8kv
	 /p9awjNdds0Mj57FEQdhEFr/zDrA/k1MjIYWx0InNEd8syk9oMHR8i6hWTXCAiyWmKrNF
	 xPbHvbZwW4aj4E+Vw291VXdBnrqv67wp2KzVXqLNFkn/HV6qY89BslX2RJwMbguieuA1p
	 JmCT6RhyADUI3Wd3RjGCb/V2OWduLj9IWq0QeUYn9kx2V8OmLoFo+wdPgvURIEpWB+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i4yAY4i7;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370D6606A31C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 10:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 370D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i4yAY4i7
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c505f26e9e1so521725066b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 02:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795687381; x=1796292181; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+D36NsUsNKkqF7ketqLvXXyv+j/mhnbTnZNBUdnCJ8=;
        b=i4yAY4i7955QWTPQBaP7DeCola2jI0Noob9/7/ZLURMl2XarpROZ0xN3n61UYp44JH
         9OrnhGORsSFX6ggaJcNtjZuztDk4M6J1MuqlL68o3TxjFPme2+zfmv2UGBsHQT4Fd1Cc
         VqtrjDq1qbdj75JTOa5SavrZ4YD1ZhY5JEQ9I+jLwWUxDPjmmqjdVBCqJrNtlQ6a05/8
         Mb2FWjCGXbRDoZVckKW+Je1ckPu9UUx7rm7/afVU0WpzwI6tCHtJ4LJoYn/uUtI9LObr
         EcyPDhMW82RViKt5OF73cE5kn9C4aTlel1/vIX40xRihURF3pdmQAztZqv2ODLKN948+
         ivrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687381; x=1796292181;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+D36NsUsNKkqF7ketqLvXXyv+j/mhnbTnZNBUdnCJ8=;
        b=1fMZwU34E7nhTpyjJD+9Tkd0WTolucjFCWeq/1ZO3rxjc/LEwbQkXo451HSA2E/ggZ
         HJvuFGF0tYjqMK2bHt12shU1n7ITRhQv28G01iZHDRDIJYPSi/Pf+f7zHITEH1E2PXqB
         0nlJG8mXa3b+cFonhiP1Xl7e/Xq1HK4ZRTO+2AmnKvMEcyHBWySsnL4MYbjNz3HPkAMw
         QVHyh5kWp9mjb3OXYizyptu+mLeyR/7MEPY225ID2pxhg5Up3TU5UG1ZuPgX+lFVNJ/V
         rP0s0k6Tl+S8Bkn1cbLbBmbg1THV05+sBBDJorCFHQx14Dp43aIR1wjeMrbaNJXe2vQj
         0DEg==
X-Forwarded-Encrypted: i=1; AL+hErEJbmf9+X0rtL85NzH7X4cBVy3nsrtch0RAxLch/FmTWa0G5AgZ94HFMZLP/Sm1JsdRvnSaGo7n43kKQJsZHQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9UPmjmP3AaCtrsVXg8ejZwBeUNZ6JXkozfxC8lO7zXfH/JLnC6
	OeOZ9k9hGe7LXTX/v3kvD5mP7ZegVwy7ewW12GKlYGo4fi0tx0a7XMtOxuhtf4uCfQwvaj5psXB
	hHprYK14aF7Se+YIZyg==
X-Received: from wrmd16.prod.google.com ([2002:adf:e890:0:b0:4a4:8b97:27fa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:b0c8:b0:c51:5384:eb0a with SMTP id a640c23a62f3a-c515384ecf4mr1127711666b.3.1795687381470;
 Thu, 26 Nov 2026 02:03:01 -0800 (PST)
Date: Thu, 26 Nov 2026 10:03:00 +0000
In-Reply-To: <20261125-rust-drm-gem-shmem-unused-unsafe-v1-1-d6c5cb0b391f@jannau.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125-rust-drm-gem-shmem-unused-unsafe-v1-1-d6c5cb0b391f@jannau.net>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126100300.3642738-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: gem: shmem: Drop unused unsafe for vm_ops assignment
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2026 at 01:24:28PM +0100, Janne Grunau wrote:
> The assignment uses a raw const pointer referencing the static const
> drm_gem_shmem_vm_ops from C side. This is safe since Rust 1.82.0 as
> stated by the #[allow(unused_unsafe)]` attribute.
> This was added in parallel with commit f32fb9c58a5b ("rust: bump Rust
> minimum supported version to 1.85.0 (Debian Trixie)") for Linux v7.1.
> Drop the unsafe, the SAFETY comment and the attribute as they are always
> unused with Rust 1.85.0 and later.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
