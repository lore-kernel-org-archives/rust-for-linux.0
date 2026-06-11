Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE88355057
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164526; cv=none; b=WMQoeRouvL329odFuGsgLTionn0eddCB3yJkR/ark7Hcbvr8nAX5KJyGJO3iAwBuX6cQgLvoNIsPjVdJaETYsSCGHT8ZyVYacbwmf3yI8+y5RFDrb0ibq9T5XmpOFBxicuIr6HSTYDH5Po36dyVNh9RJ7MlyM0JVarTZ9a4DQjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164526; c=relaxed/simple;
	bh=IbG2xGxqhOXy6miCOKByX4i24T/br932Osm2dsZLfkk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LtfKdjJwCjn1SgYoDmtBm5Nt1swbuFzj49lpwYaBMKu1HN0oDyHAcLAnk5TUsdJ5UoRWuLrdA0ojcoI6i2h+6mm+k8vW8rsJRiZ3jYpNtPuvQ5P3OFOLXeIY+GrujRU5XcVP9UKfDxfD+2MQJ+h5TqtrvJmVXjHtWdrwWEvYp6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ggJDGlO+; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ggJDGlO+"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490bfd70b0fso76768465e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 00:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781164522; x=1781769322; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AXZxyRMFccdWt/MQKRyDlJE1FTaAohbihCXqfQGqWSs=;
        b=ggJDGlO+61VWTphRy7NyIUtTZKNMWR8P2Bwjos9be+SD+3H+9Xq+N+WbiI8UJtNW5z
         8qO4xYYuVGVKue28sNY9Fg3hdqOpRjVYyZiClMXJw+ky9FKi2zs1N5jky0DPEZe2PLMq
         1o/1jJONqk5ccMBtpn70YA7jTW1ZS6WKoLGc8Sb8RwlKDPR2ybNPuHmUSlJvQhH/yP/2
         ODAglTG//wSAeNqEB5OdIh0pFwb4RjWrHiW/t6X9G/gaNIu+k1O+wR4RhrsAYoRj53kC
         upR+X++c32QMzz+6UC4teZaWMBixgOswk1+xzvCjbhiUhg7raSds1hVUaKG9vcl9q3y9
         apkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164522; x=1781769322;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AXZxyRMFccdWt/MQKRyDlJE1FTaAohbihCXqfQGqWSs=;
        b=cnGT8elkqkkxhQcZlRNYovtwE+lBEIGn88KDG14jF76XtZ/im91C2pSvZvY/+w1wQR
         oG02xpaMce9lRDD0Cipz/vFIGGYkqzfwtG/azeVagN6Xl9MJRtWDbzlVs7eA6Ptgprp6
         U8DChXGlRggrlb3Pw0RInDRxVCzVAbx5ap8KvpHVZlbkg8wykm5gZM8VfAIYazCxeXxS
         I5qeWTHtAWKC9pSlOO6o+fJsb7616E9IKApHUyq0wfrLo9FC8F/0Ffm7IXfK6oPfXGZW
         c4P1PGH0yV0d9FQfxXTHLLwqgN3cod3KHfQqRml87LPsHY1axngoUKRKVyQ+EM/evaT3
         dcwg==
X-Forwarded-Encrypted: i=1; AFNElJ9rzgZLccKH8DPCVDno0C/VAGP1mo4bVSWAM9W2zCD5sBzx7kwgHpwN209ghbdCGXn+94z+olgG0wbBhgPoVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzhnwYfuGpNNLaOTzbbMO6VqqDlAUXwFLgTlZdpbOtsRmWGpe0
	tvaHg9SyQuEHSxaspBnzefvR83rex6rnNaJaNfTmgBBgY168MsvxnqXKER2s05S+nApFou7Iro9
	wZCVnqOXUGLh2iMPk2w==
X-Received: from wmbg11.prod.google.com ([2002:a05:600c:a40b:b0:490:b22d:da02])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4455:b0:490:c2a2:e91c with SMTP id 5b1f17b1804b1-490e5642822mr18384385e9.34.1781164522238;
 Thu, 11 Jun 2026 00:55:22 -0700 (PDT)
Date: Thu, 11 Jun 2026 07:55:21 +0000
In-Reply-To: <20260610-gpuvm_device_context_v1-v1-1-01a890b17448@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260610-gpuvm_device_context_v1-v1-1-01a890b17448@collabora.com>
Message-ID: <aipp6chnYAUQ8LOv@google.com>
Subject: Re: [PATCH] rust: drm: gpuvm: update DriverGpuVm for DeviceContext
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, samitolvanen@google.com, 
	laura.nao@collabora.com, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 10, 2026 at 05:01:26PM -0700, Deborah Brouwer wrote:
> Since the introduction of DeviceContext, there is no longer a single
> driver object type to equate with the GPUVM object type.
> 
> Instead of threading DeviceContext through GPUVM, remove the strict
> identity between DriverGpuVm::Object and drm::Driver::Object and
> instead tighten the requirement that the DriverGpuVm::Object be an
> allocatable GEM object associated with the same DRM driver.
> 
> Also, make GpuVm::new() generic over DeviceContext so it can accept a
> drm::Device<T::Driver, Ctx>.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
