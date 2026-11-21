Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270371;
	b=aCMJGUXrOYhINg/Cu4kXRUsR/wR4xY3pkMCJxRyAYpEpqTk9VN0z6mGuDvcZuu4TDpBY
	 OKrf0R8V3YRGolGd/WvieAXsCVJcSvhKL4lXtyZivdqcz9zqrieZLSIezj018dOTuE8vx
	 t6bdpA/9IDI4if9d595kx7oVdvvdv3sTjzwfojF6AxcVXxFZPFZCtYx0HYcV7xEquGTNP
	 MRP3m0Q67ZVVQYdh+wSKRCCxs0eZB8TtW8TfwhafSs+U369cGlQH0VuWzaQjRTeZ1FIsX
	 VXYKYolGdRjx54jVQjuT/ap97NIaQQ7e49UlSB/aIYVvZAJi5m+I7epwkGvb1D8qI5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Jy6Vcdhv2NcktCCVIrJ79GzBwKeJB8AKRYT9ZAytoZ0=;
	b=ioANLcFEjhN5DSEc6VLntFSQ0B3eJ5BVdBXM5fw878yNvZ35+/+8XBMyRMPJ3PrR3aqE
	 3ieGFF88PHYQRwWMcAaxHez3kQNPpNrQlS7kGigWAMf+sIzL7vQXjUI/jtBWXDbiGiBwc
	 /RJLxEUaYrK1Pws2bRHO4Nf8HgH2o68IiGAIHW/4dspT0658nOtrUKy2x73UXJFOm7jkZ
	 +Nl7ZNUF5yp41PZmQjxVPLv81qunuJH0+0wj9+VWA7SmQjQxiDTuX6msURLxdc2vSrA5Q
	 ZRomfAXPLwP9zTL919qOa4ZawRe3yKC1/rNOsQQ76C2rm+XGMCESwrt9tY1o4JHxZuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="H/zb4JNr";
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4E2606A32C
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 14:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA4E2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H/zb4JNr
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so14814705e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 06:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795270369; x=1795875169; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jy6Vcdhv2NcktCCVIrJ79GzBwKeJB8AKRYT9ZAytoZ0=;
        b=H/zb4JNr3JhpSSqDlS59uvRJAhO+co+VqIY9aORfduKliaaMsb81WAYsG/38OdCY9P
         zZZW8u9uVJIH9i/YHjnCcz6jGkCG/HXndpOtMLaiz/d525Lb8wKzkWsamKKYd/IBYiXm
         4864hWN7oSot814FsxJ5M5nhXZ0yn7guXaiUtXzfq36e1l8OQeR/n6kZFcTDwTsgfq6Y
         1RZnAK1LrewpPxCh87Lmz603d9a8Tg98FAEOAnzzbZK/2jLq/It65TJpzA+U3oNrRGA6
         XE0WzbKi69WY9XAIJRtuE+0wZI+g3h3ZBYN/5zdZBAYKWxOd7lIIhFxPxnMtZ2HqW5L2
         0BKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795270369; x=1795875169;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jy6Vcdhv2NcktCCVIrJ79GzBwKeJB8AKRYT9ZAytoZ0=;
        b=ZN53IQKGgxI6pYFLk2D4X6OI5yg/QQ9ZSJs7fXVz0qkbmoTPUeagshGzl407YK4Fex
         R6alsPPs6388xDXKtMtZF3z6h4iQqERjKyayEEMrymaNVNOf4t9tJD2etUF1zwu1mmdU
         O8j2/BTpmg9mbAJp5ZilBlKXsCYtQcxUAMeqJSmFxclTCpZrStujUT7Ff/nbilcjIUyu
         J9NXLu4P1yvTWaTuKZ6WJVmWL5WwuXLAKKNB+MA7DJKPDMDIJeJwvPKJkq7A3yDRx0re
         OduIhITT/IanQlHRVF0Zo5FsXDAljGM/k6EiLRY3ABwtZrURSzNqiDNfnsyiWbNLHkUb
         59Lw==
X-Forwarded-Encrypted: i=1; AL+hErG1T3yzdyycD06sB3Dx5OqrCSuxYTD9MiPk0yGAYWztYypjWr9uCMoTMKI5RwyqGysEGqf5bVt6VpqzVfscFA==@vger.kernel.org
X-Gm-Message-State: APuU4Z99XLVvWzNASFWqsShMUa0UInxBhJMYxTsWZBOgEd/NwHh9Pq9J
	Xzhuto/OZ156AdUvLg1U4MOH24XGCWABBlPLdTOc9xmBMhEoW2awHjmtmXHv0POtqyrLw0+sErQ
	A0AEs4jIbOXPIiY38JQ==
X-Received: from wmdn12.prod.google.com ([2002:a05:600c:294c:b0:4bb:5ea0:79c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:674b:b0:4bb:6847:791f with SMTP id 5b1f17b1804b1-4bb8880f267mr135552605e9.7.1795270368808;
 Sat, 21 Nov 2026 06:12:48 -0800 (PST)
Date: Sat, 21 Nov 2026 14:12:45 +0000
In-Reply-To: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121141247.142001-1-aliceryhl@google.com>
Subject: Re: [PATCH v5 0/2] drm/tyr: safely write GpuInfo to userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Jesung Yang <y.j3ms.n@gmail.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 04:47:47PM -0700, Deborah Brouwer wrote:
> This series makes zerocopy and zerocopy_derive available to both the UAPI
> and bindings crates.
> 
> It derives the zerocopy traits specifically for struct
> drm_panthor_gpu_info, allowing Tyr to safely copy this struct byte-for-
> byte into userspace memory.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Applied to drm-rust-next. Thanks!
