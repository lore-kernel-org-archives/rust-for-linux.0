Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799737;
	b=CC2RQT/vjI7VOBwfydOILaD61NIBPftKMhg6Sj10F3ASF8vEFt6+4fOwJ3NearGYfLpN
	 hspdB9WwkPlOLt9hgaGJOy2SsQvlbdoDRGcnUVCjrRX2z2CJu3Z5gwT0oRUJrZkXzhW3A
	 MNXrIN7zr3k/241a4kWVFS2nZKepbakBxTcE3mrbOoUum6cni5JX/OojLwfgJzkdDOjF8
	 +4HOZWxanE/pGha9i2u3feACYxJdocKp4rA0iZE2LO2q5z01EcVfmlWD7Y7szcFOVp4n5
	 yJcD1X/HlPAE4lOgnKUYDxIR/6w3m6NTweoZpRDox2c60CIU7k2d8cUBkfoOAGfqevw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tm3D6IyKP15hbKabapmjY3c8WokqB5K6kpDdyd3I+wE=;
	b=cy1J9BPVRnQ9+vrRud969Gad30258PXgHPnqL/qal+XE4hMoL77H9XloPJfSo7CUzXvS
	 5X4EI9yq6iwVxHPCsE3MSSsoNpQA2o31gsBggIe8JqbQj6rLc8CBecjhxt+V1/5OWNzjg
	 OcrvAhhuFjsrUmgWdopSaxIG2kQz6tPV/YTjIpUJE7jgioEtmfqBtJ+v8EqdcJrIxNntR
	 kJhNJOm42jtz3ITWvEjPAx3ZhiglKUxdLLDWmrxU03b0/NnQG7NMWHhUHAlwSfk5Dvfjv
	 tUUa4NuOr/j3zcgk3TMnpmkO+vhwZOV+oJpLtSRfME0jOF4Wm8pPYekpc8IzSAIysnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z1rMekaR;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FA1606A32E
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 17:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75FA1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z1rMekaR
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49090fde23aso4948935f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 09:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795799736; x=1796404536; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tm3D6IyKP15hbKabapmjY3c8WokqB5K6kpDdyd3I+wE=;
        b=Z1rMekaRkUjtuAon3EPKf8WGMYKdYKLyCF9S3JqK+HrcBdiu2jpY9+T3ZPeDWNX/d9
         MZhvnqd3hT7ffzPZDeaUK77G0n4gzU2A6Kr2EOgW/9kLUNMtSYhHj8uEKhJCRB0vQ8Dw
         Zjwd6L+0JcMTM9vi+/xHH5BIjxJ07oIGnG9v73QtphO1RphyzN9RII2fupI3sw3IidD2
         l/+g7QqtVS3C2FiCxsJo0PUEYUSJpk5tP00BE9YrSv4cJf7cqoR+DgPmUXbWxAqnclXk
         dHUR5CaufkCj6QYk0a2B2cmDBuIgyqOdFft8Coo4ztFQBY7cWFUT5Uc9CZcMSQFID8pB
         c9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799736; x=1796404536;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tm3D6IyKP15hbKabapmjY3c8WokqB5K6kpDdyd3I+wE=;
        b=bBatIyV7mg/AYZYQI6KM9oisARgGdq9UsZysbPSXR9YjZGSoPNzbksC3dQHxcMPmNH
         Pi5ACPeBEAm5UsPZA6lQGeWzOSXxjzv+uiML9ZBAQVxJBo1OS6yUEQFfh6P00dtAOcLu
         tLkVlrXnE0PdbZ2f540HqJNq2eDfVdfegmkwt7MHO9DL6JMJnmQMsDB7MBMHPwF9I59v
         45jKSDHvOGIn3RfT1M032ePtLeoI/bnjxSFzZ3+T9/ooemPd0Ti79COGzgXPMr5wjOVv
         1e3IF2MXm1PcrLiJMCkt7fabIDGm2czPqGI/BGfo4tjQ8iCSzzbLkHkQ80SUw8hQL8F7
         Hntg==
X-Forwarded-Encrypted: i=1; AL+hErHtcRIXGRV6h+z9gpdMp95zOl9sdOHhAxYcampLmZihSVOrnmC+wSPx55KR6nlw9hNWIDIv6lhh8yzD+0Dlow==@vger.kernel.org
X-Gm-Message-State: APuU4Z8maTF1KCtaDzA9WOb7pMe+BLUsUdTSQlv4XOM1QB+z8iM3QFn4
	GObEIFGySMsNwH8KKm1WIQZfyylR7Fad8OBNNVyQn0rBUcZPSjfFggZT/cC2MulaQ7QpxPbgaYp
	X5o7P8xHeMjhlOLz+Kg==
X-Received: from wrrb2.prod.google.com ([2002:adf:f902:0:b0:4a4:ec0d:c449])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4705:b0:48f:cb37:3ec3 with SMTP id ffacd0b85a97d-4abb400c591mr50248173f8f.41.1795799735734;
 Fri, 27 Nov 2026 09:15:35 -0800 (PST)
Date: Fri, 27 Nov 2026 17:15:34 +0000
In-Reply-To: <20261127-bitfield-conversions-v1-1-2f0b127c0857@nvidia.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261127-bitfield-conversions-v1-1-2f0b127c0857@nvidia.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127171534.2097398-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: bitfield: add conversions to Bounded of matching width
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2026 at 09:05:40PM +0900, Alexandre Courbot wrote:
> Generate these conversions automatically through the `bitfield!` macro,
> as these tend to be useful.
>
> Tyr had such ad-hoc implementations, so remove them to avoid conflicts.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
