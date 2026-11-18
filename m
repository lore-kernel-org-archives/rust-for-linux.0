Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011726;
	b=NfSOryWdPd6l7AZdONUUQRSKM5F03slfEtlomrTEkdBeA4PS5X9p6XumlD0Dv/O3ZMRd
	 P5rkVsU6GXSL5H0vdb62P4YsBrzUgJ5VYtNjHUwnvywh+mmS3ee78vbdHrD+V5PEEvjop
	 HdNkrYPSBEAS8VZMkizm5m6f+2+CAhtUaAWRB4WFlUV/SpnAsx43QcyFnj8cu5iorWdFz
	 +/tIJywCtyM8VSH1uQd87kJKA9OgHPC9lhmAtZHMrQRr2x6warDJCRyVS0CWnwu6igIxt
	 DWkRw+WIgY/3WaE/ppVKVBPEvqabiHgKzl/rj1EcnEDy2eKJWR4h2UfoglfqGg/PO5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2X2NffGsec/PeOgMoOFFc2QFkD6CeBxkedqmF186r8s=;
	b=lRt8mVV4GYucu3xOUggxnNzzpPSGfz4DAQjh4b6uogGIk+40PDLdNQ/Y4+RtJN7Bd3IX
	 DLER9LCOWkxd5i6I+/dJgOLKs6pfhhMa2kZHhfYwPa9my2d/PcCjS1PXIvt4E/c5Jp7pO
	 cqBPjRqMQxRmEOZF/s1s06yD4co8JhODRb6OXxQq8+oTDDIKU3mh5eP9f7HwlS/18OvHq
	 rIJwC6Eoomt2HjSW1t+x8Cc+n/ssmButUXb28kdd7PGhZhMGrIOqk97yTlH35dGXUYyKh
	 tjkmF+HSxlvKJPV0DAwaz2vvTa8jYfWOax5mVwqwIhU/m/PUL3UA/SSvIfLacbeA5nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="i4/obGMU";
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692CE606A31C
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 14:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i4/obGMU
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48df02b91f9so1230369f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 06:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795011725; x=1795616525; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2X2NffGsec/PeOgMoOFFc2QFkD6CeBxkedqmF186r8s=;
        b=i4/obGMUduCfgnSMu8WY+Vr6YRUaAUb1ZMdoGa2hdIZG9KcEoXPIRWcRTd6tCIbpKA
         ZXMbQxd9sUWAN1G7QRw1Lb1WHNiql9zhHxs/gO61gU4oIUaTNACP+fKGvdCwcKAaRSjK
         lpUkpKUbw7RPubisZzPdo1XOnFHRwe/MNzEr1YGFY0GEzJWd9VlxLmmgEeWANWkRPefo
         WNgK0c+5nCA5TrhcJXpHU4oAg/Os0SqV5XhtRloiDNjdIErJtB/MBgjYUGS2Yd3WH6LJ
         98C9i5M9ZVb4cw6wQhscgaaWdfbdIOAKZpmqWshTmmFU3l6EXufjKUVCe/JNxbWyzwKq
         EVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011725; x=1795616525;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2X2NffGsec/PeOgMoOFFc2QFkD6CeBxkedqmF186r8s=;
        b=hzt15TlH91mr9aTuShohYgQcaef8DlDNnAb4roD4qiaMswaV09QN65l0Mf+6W9zqUc
         eS/f8vXrs3ePn9Y0PbJVzXJ726FlJfMntTtv9BnuayKJpt8ARVaoJgulARt0Dik6tVbq
         2q3pH3c5mJRNUZyXoTE91UoxBKrUHRpb3O4ePkJbVU+pTAyBLqLenL2YTzD0A4WMgDK+
         SCNwZ7NVxz2XbjG9hCLk+otbVmN7C53MozAXIByiRWMWW3wU5avvv9sHMmZpBXZkVoxc
         uy9djoLQESBiqdCSNm0uA2xdxcz/kwAjZVUsPJDwGdimFRxgBBv2HnltLmCQTyaRdRzQ
         6lnQ==
X-Forwarded-Encrypted: i=1; AL+hErHJkle4c6i3Uqfxe3RHFcgMC27CUeyto1q3oPehvo3H37b4b3jlKda4W7vqQa4h41uj75iDHRCjRvKo44JE9Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8rnVWZ2wDTxrnfQC6o80ac2RKXnhuH6fFUYORmTBH0Kz24dmc9
	5EceNzYktthkuFWGdNDY4tLWAKnv5qxErk/Lh23xt5r70YkiA3YmrqjMnA86rBnTF9ltQ+4yJI7
	cYCz67TvrR0kj/k96Ww==
X-Received: from wmfu2.prod.google.com ([2002:a05:600c:1382:b0:4bb:6a03:8800])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:37c3:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4bb7d6cd4ffmr49219565e9.2.1795011724035;
 Wed, 18 Nov 2026 06:22:04 -0800 (PST)
Date: Wed, 18 Nov 2026 14:22:03 +0000
In-Reply-To: <20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118142203.711097-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: gem: shmem: do not leak pages when sg_table() fails
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Lyude Paul <lyude@redhat.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 08:21:52PM +0000, Sami Tolvanen wrote:
> `SGTableMap::new()` takes a pages reference and maps the table before
> `Devres::new()` allocates. If the allocation fails, dropping the map
> frees the table but keeps the reference, and the next `sg_table()`
> takes another one. `drm_gem_shmem_release()` puts only one, so the
> pages leak.
> 
> Take the pages in the initializer, after the allocation.
> 
> Fixes: 616c229ab010 ("rust: drm: gem: Introduce shmem::Object::sg_table()")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Applied to drm-rust-next. Thanks!
