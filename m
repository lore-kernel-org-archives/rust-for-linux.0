Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744121;
	b=rI+ElR1pzDCp9wbD7fhNyRflyjhYk9X9M31h8iBzU3vNlynqQvlsotlW0CVkegHsGvsg
	 8eBO3IWXUU8pJlzLnRQ/ltKqAcdB9UFAOaksEfhP3mDPwu8uxQh7wMUq6Xy6xX3/gACLH
	 uDQuZzMsgtkftHOks6jk7bXis45QWgZt52pWvk5VlHVni+5gvpnBey6PMBVKvftgsqV9l
	 eCTQyg3elDleeuvVZjT3eCg9tJkagAGkstTk5FCF0K/fcYhCfpBRZyEhdY0hIHm0t0gMr
	 Sf+l+Vt/lYcYdBvnMx09qVM2cpOumfkUwgavrfpvwewsBa+hjC81TszEylc3DGQdK8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=JZl+HfrWAJtYCbAOILKeb7E857EVkTmoggdAs0Ji4mw=;
	b=TNcmpqPbyo1Xwbos8zcBnnuaVxsORbO92aeCIUFLmDjLqHJqflWZcDpxzbLixFb4hV99
	 o+YAcBPFx/BTgUylbuOFRRHWGsXFxtgloQJaSKnTB+EdQHLxJOi4teba/gi1T1yzTWXje
	 2OXkrk+2p/yeiMIGKnYB4cFLwQ/bZznktYZ0vKjefm3SAt7MMnsYN+NctjSRYO9X0uL7i
	 rlzfH7rRtoJ/4TfQYOCvRFAasjbTqKRxfOxDScKy+jJ4cG959+9OXUHqul9uqR9ClYSm2
	 KMZ5UG53rCiU0vLfrbkCX4RsAONW6rSJZPMuTy9fXM0534fq5unnf0fEMDnx7nvghVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=mNwxaodE;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0810B606A31B
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 08:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0810B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=mNwxaodE
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a16faefac0so4288785e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 01:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792744119; x=1793348919; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JZl+HfrWAJtYCbAOILKeb7E857EVkTmoggdAs0Ji4mw=;
        b=mNwxaodE9bZuAnhXe+WT9zRnXBtbmwacb2OJOqAkwdefSt8/FPlGrZ3K5na00KrD4U
         AbwBMxY6CiHA/ZtTI2lrjxMXGbBSpVT3fu4vMQ/OCT2S638fsdtcowjOvZ+D+X5nZsuX
         mxed/jjllXqKhGN/ebC0BOIvMANBngXH6W/+hB1ug5s0T/O4y76Gj/2CdgxEtvq8VtIy
         OzLpQb6yK/XM+uwvYXE0QOLkcqTJTRGGqBpN/yNTvrOZCiBX8qF4JUv+3dE3UD8ugYpe
         UJ9Vo1m0ifEK0mqvfNFNACEl8BmusbsTuBZyMs0PBS6K2qVlMi15Un9X9A4uvjwd8gOs
         3lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792744119; x=1793348919;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZl+HfrWAJtYCbAOILKeb7E857EVkTmoggdAs0Ji4mw=;
        b=IBy5ElkIjmFndb7Z4kfiwl7O21HyI0L7OSRH2iwv9pgVugazzaJilaaKRtX+8nISSG
         BIxOdzySmrZ+i1F9DMB0WUlngCdAuYwl33V+cOjYiD+YJ0+f7mAx4np+UUFv7PgxhinQ
         66VdWU6sDdttFCVP66ExKu5Vazbhxn9onaLwkR0x7t2IzwAOyhBiGaWVGyDDsu/0V8gH
         0eyGxk6k4fL9TckmjCXa69UJ2s0IIwja1Zj1Q9YGyM/pOMv7RPf9Oo0YdX99VDimDUqK
         PISoNcqwdvusUY7fGo77BlTIjJ89d2C51hbKh8Tml01YbfbD0oQe/pwXJFmBuad1IPkz
         KHsg==
X-Forwarded-Encrypted: i=1; AKwUvBxm7GvktZNpBMCVESv5dQU2w5m2ocahTM+e0V+vIUcSE7V8eKMgsXXKxub1zvVvFTOxo/P8I3mhudiHU12ZNg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKzqBnU6h290ekT92MWx8TwZl9e3xW1crqHSsmLDp/z4imN6Sh1
	FIeoNQQI2BGTUPaGQM0Z73dgLTwJBQq1f82oFnsHuzAE+6v8bI1ywY9HMZwPwgkTMMvb9nQGFeY
	p6MFx3TEEFhPAO8frcQ==
X-Received: from wmc9.prod.google.com ([2002:a05:600c:6009:b0:4a2:d3e:ee4a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8a:b0:4a1:e7ce:10a4 with SMTP id 5b1f17b1804b1-4a211eebdc3mr25679015e9.29.1792744119032;
 Fri, 23 Oct 2026 01:28:39 -0700 (PDT)
Date: Fri, 23 Oct 2026 08:28:37 +0000
In-Reply-To: <DM9O11JY63Q2.1U3PB5GL0JYOQ@garyguo.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com> <DM9O11JY63Q2.1U3PB5GL0JYOQ@garyguo.net>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023082837.1250172-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: gem: shmem: do not leak pages when sg_table() fails
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Lyude Paul <lyude@redhat.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 01:31:03PM +0100, Gary Guo wrote:
> On Mon Oct 19, 2026 at 9:21 PM BST, Sami Tolvanen via B4 Relay wrote:
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > `SGTableMap::new()` takes a pages reference and maps the table before
> > `Devres::new()` allocates. If the allocation fails, dropping the map
> > frees the table but keeps the reference, and the next `sg_table()`
> > takes another one. `drm_gem_shmem_release()` puts only one, so the
> > pages leak.
> 
> Sorry, could you explain it in more detail?
> 
> Creating a SGTableMap and dropping it doesn't restore the state? If so, it
> sounds like an API design issue.

Yes, there are really two bugs here:

1. `SGTableMap::new()` returns `Result<Self, Error>` instead of using
   `init_scope()`, so `drm_gem_shmem_get_pages_sgt()` runs eagerly before
   `Devres::new()` allocates.
2. `SGTableMap::drop()` (`__drm_gem_shmem_free_sgt_locked()`) unmaps and
   frees `shmem->sgt` without dropping the `pages_use_count` reference
   taken by `drm_gem_shmem_get_pages_sgt()`.

I'll go ahead and merge this patch since it fixes the first bug, unless
I hear any complaints.

Alice
