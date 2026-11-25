Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618996;
	b=ALCvo1YCrfM8QZkTv9QnphIOnSYKG4Z4KMU/+qYIOXfhtEBnLQUk4+s1FOqdjy9WOTqr
	 JtSfQF6TyZ96Mbu6Y1wGCPmtxBx3lxBtKtVlvx+9XFJHAjuw7vyYwBEaB3xqmIH2gDE7t
	 HuQ0RExPV7ghQsvf3aCqEG0E1mGxoxOZyNSEamqXHWxifqRUv0a2dtOedGr4krXiXk9fL
	 Q5nNBoENHJbAxVHTU4ScDsK1BWkkQc3lFedkXLq9Se4+A7gvHNHzPajZsz6YN19vIo3Un
	 6UwyZE5OwIVto7Kq4Y8Per3N8jrRTXEC216mWpohPoSeeUYksvPFzDve+pGf/a1LdPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8aj9nTYzj6cuyNzNLusXOllcp3z+nABWrRwzBA+BFgQ=;
	b=nLo2aWg0910anqmTFs4Qk3qSxmxmUdK/qp9/wXgVw1v0D4mQulPXWnNBq2MvNXVQZ92k
	 eU3TMBKwB5kB9iExDPk45imBTIYMTAadxtsPOi9PZiVuzzu0LR9Ut6I1+7d70QOtvKhae
	 Iy8PnETqUX5ijqtC7atb1vs5ztKFoAvFVxJ6Efa9KDl9le7hnPx7JXXc89v7kLDNRLjlj
	 cX8FbKWg3VbKCd7v5Abdu3M3B2EXT25P39qjGmH3/20OICSG3U78X52LFG33euPcc4QsW
	 VN5vgyijYWMTwsBpBd6WMGd/HeJ4pCSa7YA02anrIk0UOK+v8bCsScnYwxbYYPznE6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MIP09PUu;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D516F606A32A
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 15:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D516F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MIP09PUu
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0461e040so4645530f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 07:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795618994; x=1796223794; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aj9nTYzj6cuyNzNLusXOllcp3z+nABWrRwzBA+BFgQ=;
        b=MIP09PUurF3S2YFaERK70bZXWItvXb0OK8Pfro4q5FbsG1amrlshUUx9v8OwgO4rbX
         eSwxp1NlAm1zLkNy8GG9aqDWIAePnxgGDszaIpQLFYj3O1icITGUKzi/mhKeaMU8tBE/
         XujLy5HHIcOUveXn7Yw6zVBf2I4fRZ+XDuBZ5bORKtkShkBRra9+kAeZg1PLimF7X3jS
         ibLYnD5ChkgXJ1KO+R90XRzXhemCmUstZL2okgFLs8x4q2pJovHKGHGTK7mgGLNaz+Qa
         /8nmk8ZKA0YXaWx3YTEIuHer2ctFdZZXcXWrF0XMf0ssNdyvS3LVKdHaPuP3xv7+covE
         OfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618994; x=1796223794;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aj9nTYzj6cuyNzNLusXOllcp3z+nABWrRwzBA+BFgQ=;
        b=aM1Xcn0jKYNAp7Pe/JaC4iX7Um2fsrssph19p4VAqN6qoN1ZR733gESMHsAJohnsum
         E+0FGJNsSs3c4/0GFtjngJZ04wT+1sFhMrv7raQjPKFevx3dDPjFrlplLeVh7X41OBam
         CY6Dh40dpQDrgHCqvzvhzrt8J8pSy2E78dJ7yWDlz2ZVYFzGhsLJLCHzrxPa7aKEvcAX
         1BcmhL1wBUy4KoetHX1cJ9kkxe/bxYc+Ti2WI2eqg3oCo4pKpyXq2DDIci8tUEyuSBWl
         IxSts1IooU21ivJ9rRv/3acBFFNuGmuuG00AVZVIM4YhJSVs5hGeVK5AqagdSHS4ihfZ
         oMng==
X-Forwarded-Encrypted: i=1; AL+hErF9bj72T6nOMWO4ZMHPuZzyQwaWAGflUykQWUb/zhXJS8o913ogolbWdcygLAgriHsn/03XnuLM0QmMeDZWAQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+d5emD51SCUokO5Ce9FBcWyHtrgIJy3zJqnkSyTh3q+qTSsSYi
	2/noBhlx3UlL5GhTFS5q4LMlrsQhiniAuQo0sYeAsHrfVEdRHMV/3dXfziYrF5i8+r1Auxeyt5y
	S45HReNkx5tdeeIYxiA==
X-Received: from wrzt4.prod.google.com ([2002:adf:e104:0:b0:4ac:99cf:5a0e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:29d3:b0:4a2:6542:989a with SMTP id ffacd0b85a97d-4abb4b85a5cmr21029290f8f.52.1795618993824;
 Wed, 25 Nov 2026 07:03:13 -0800 (PST)
Date: Wed, 25 Nov 2026 15:03:12 +0000
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-1-000f7a9ccb8d@jannau.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-1-000f7a9ccb8d@jannau.net>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125150312.1587642-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 1/5] rust: drm: gem: shmem: Do not use drm_gem_shmem_dumb_create()
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 12:37:43PM +0100, Janne Grunau wrote:
> The existing gem::shmem using Rust GPU drivers (Ashi and Tyr) are render
> only devices which should not set the dumb_create callback. When a
> driver with KMS functionality is added it probably will not be able to use
> drm_gem_shmem_dumb_create().
> The Rust gem::shmem::Object<T> wrapper should be allocated and destroyed
> from Rust code. DRM drivers have a `gem_create_object` callback which
> could be used to allocate objects from Rust. The C code will "destroy"
> objects with `kfree(object)` on error paths which is unsound if the Rust
> object's DriverObject contains fields with a non-trivial `Drop`
> implementation.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Fixes: 80df573af9ef ("rust: drm: gem: shmem: Add DRM shmem helper abstraction")
> Cc: stable@vger.kernel.org
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
