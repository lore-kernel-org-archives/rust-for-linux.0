Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002083;
	b=H7OaCLdoTJqEVtbg/cGnpthj2dUTaHveGUQq90kM3WV85pB8a0+unn/FMOsdjQAgzc2j
	 YqHwBBFwIs+fDtyalMP+1bNm3Fr65IMWhzkV/NueN8N/nx2mcWrQcSxclEI3sk6hVhq8R
	 ZA0iy6z7/pM+Dy39/PtVvSKvd52x2sMDKYOLb9hkPgUKagzrGKDzKIDF7srdHQNXeEhAR
	 ikpfWDY119hfPtMVrN1BPpK+eYSvJNK6bIzh6tlKwXHh3poUjVjFZ+/Mr/g1zwpjFr57D
	 6nNgG54IIQ5f8nlaieRxqKUICFv41g1xm7yegUNlkWyEysz4jgp5gtES6taqp6MEr0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6D6rhu+SkVFybLm4YEOF9t8UdzNLA6IBCbMCQMMTO+E=;
	b=aRgA5pJ5gN47g4jPSQhbfE5/XfklPTq998gZhXhduGTiNODKkUpEs/vaIdglWBzPKSMX
	 eTRyvU7W96hmlRGfyW04fqC2v9RgYViMLLt0hSjravgYFskhhz0xGpw8puqLuTLHI8PQE
	 EDwgdsrn1AX5ZfFFcBHOxw3k+wVrl2pHTp4j/2c6hkfRh9M8uBGJDOV51EYyRoxB8G5s0
	 8q/KqV7deptctIAONLmSM8XPE4Djk27sxHsvE5PzlCNoNgBz+6M6Gs6xJRGqL6c0+s3o8
	 viyCA7H+bCNUwzZWtRYv1Wn3AEmL9Oy8oEfmvzS6H2sVQJ3A2JusVqCR4UexjOhS6BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="m6/T030g";
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E29C606A31C
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 11:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E29C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m6/T030g
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a35db2d6b3so6569285e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 03:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795002081; x=1795606881; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6D6rhu+SkVFybLm4YEOF9t8UdzNLA6IBCbMCQMMTO+E=;
        b=m6/T030gc+MXZ4H+tw8vZuC7jo17VLQWAbyOmkSbMt2A1lmpQW2Yw+9lLj0cwrw1Xn
         ewYcUFiKQ/YsmAUm8R7z1X5AHWb4v4MWMFxS92+or68kmf2SQ3MZ8BeXHcZNuZdfitJT
         MElmAWV/1IsQiIqgghc/j+EeaHYeUeEaB8rDY4kV3hNldKHIL88ua53BEyyx+USLMVnH
         iMTIglR+qTa9eNV6FCUchxk8qEquRgE5AK4LmOjJrk+eNXYnA15LnxsA26E1anDj3AVl
         ec4ZUD6BcIzHzQqB6gD/AANFEoRZGYGQ7artuGMO60XwA54abant3G8Uerhb3uo3ly47
         2Spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002081; x=1795606881;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6D6rhu+SkVFybLm4YEOF9t8UdzNLA6IBCbMCQMMTO+E=;
        b=RiQbd8O22TG7lOaqyGOJu11jC1Vhfv5kcBx0pxUrzPEcrEjE6Q73Gx8AYvROlXTQ5o
         acII1W+3UdW1XnKbkEBoBWqrrb4p19zY8d2ip8lD8uxhwt/jDxJhUorklm+UFg1TpnXS
         53V+131pUNtx6zIO9h368BHvSHxM/EAVPTu+aAv95RJfk0HeRPfiXjqOVWBl/2WpHOkl
         q39LUrylsu2mwRk7sotdV7SyEK+wt7dCYGApVePZFnWZot7JwPjifVEF7BWX6xRto0O3
         jgQy5Z7MQmZcygbLnlTPzVh4sX1tEt1k6i8i0Ii001jqpHfjJy1MAwJg8X/ByG37MWOV
         k5gg==
X-Forwarded-Encrypted: i=1; AL+hErEqGxTyYMT5N9nfdScjT7n+7hKX+2MsiH3k0vVVMv16A/PhgCZ+yJ05XZ7JwVYU1QkYFgbdh03qIeF89d6CrA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cj1calYT2LodMKnAJdoa804DjtlutjTBKfenmO6Y1f9cwgTUt
	wDxlH5gkjt/CRS4SoFEvbW97A7Nq4wXXsxJIjtPvsFQzngVQn3Fd6Dv585wehf8OK0yc3Nskzyb
	mZ+Y8GGf5OVzkGRCk7A==
X-Received: from wmix22-n1.prod.google.com ([2002:a05:600c:e556:10b0:4a2:11fa:1981])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e56:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb7da1b40amr42014765e9.13.1795002081244;
 Wed, 18 Nov 2026 03:41:21 -0800 (PST)
Date: Wed, 18 Nov 2026 11:41:20 +0000
In-Reply-To: <20261026-rust-drm-gem-shmem-imported-sgt-v1-2-36f15ace04b1@jannau.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
 <20261026-rust-drm-gem-shmem-imported-sgt-v1-2-36f15ace04b1@jannau.net>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118114120.490722-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/3] rust: drm: gem: add an is_imported() accessor
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>, Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026 at 12:14:09PM +0100, Janne Grunau wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Drivers need to check whether a GEM object is PRIME-imported.
> 
> Add BaseObject::is_imported(), wrapping drm_gem_is_imported() through a
> C helper shim.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
