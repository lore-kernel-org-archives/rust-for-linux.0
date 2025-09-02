Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4933C2E7F2C
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Sep 2025 08:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756802374; cv=none; b=dHGMQfhTWezGYCWKWuewztzJxNAqMDbfV2BBvvH3nc5AaYaKSTpxTTHolR7VwdtwcafeQUtpZxmgraeoO2hWhLXNjnrtqJ84g4qGhT2zvnphHpZSuyEzu2GZDj5hzPhb/CuJGqW0dhQDfRzEFQZrzGkAdV3SIHaRAILCNK2rw9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756802374; c=relaxed/simple;
	bh=koiejtjJlpqtXarBrORI6mw99ruaARcVA9rvYu437aA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UlzZJej/Dei8fBFWFxBQybo4lsy6/NDK1ezt5sqSZMMdaD3wrDCKOcI2TBkivrZUHdFHMQ+SrkS5lbgk72HiqYAxPyhDKtS279dCWmYRbExoMfkGPUg017mjwg5ZiGH4QkIKPtbcAQCZydzlBvVYfdnBD1xeIhYa8kxY4qnGWuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h6oC9Khp; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h6oC9Khp"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45b85c93afdso8238275e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Sep 2025 01:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756802371; x=1757407171; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JP1QA+RZ7uMNnI6suXZ0G9wwt/IV21LJWjZMZ+MqgQ0=;
        b=h6oC9KhpiwUUKYCOzmbv56LayJz0NqSQ6IwUPLc7kAcxc/HFDWeuM5B7neAtzmFAT1
         dXY3QambcGqKShVt+hEy0TQ3tZHnefmj5QXRbBj7nrtWe82mBJv7+G9GBc5/WQvUj95A
         pEMg078/8EpQCu8HzkC/lEu7Mj4piAl0JWeMjih6kdnlbHv/XqroJLAElYG93UkDrHld
         q8ByyP819w6JW6ziguS4SOo6wi2dYD8KG3kT+51B9zBozUABgwn0UNR3KMamwqspdlpz
         XEgUGy9sVL5PCrgbMpY+VzJWtKRpWY+k/XQzlJcciVxAvCSbXDcWTNtRJEdwV675ltms
         asqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756802371; x=1757407171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JP1QA+RZ7uMNnI6suXZ0G9wwt/IV21LJWjZMZ+MqgQ0=;
        b=CuOb06KUPC726tBHH61aaaLxehGFhSMEMLRzKt3uAXUNTh0ysEHqYymlG2WRR8GEie
         VcZg5UXBrXs3eSJcP2Nq8vmOEJphI3FgWl4P39OQKa6bZWQgkg1M7Aq31jFbcIuevhLk
         9Xw0Cf3X6p0fUhM63Ao5qek9V+jH+IZFCOIm7Z6kMlH3MwymvWo/4u1Rma9OIRWEzD4V
         SiMmnEHXf3iV175VaJjHPisVs/ZddJ2wbOnmQ9QThf5xLJRSoikr58EVRIgekM/NcFQv
         k8aKsDIxweKU0s+oHFE+/+fhOEM4oveQwfuh43jwRSpihf5oki8eHR5BPkvvP1YE/OVo
         u1dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGOes8d54Z1tlxcKXwoq88RLQU6yo1yWozheWORB+b+U8d1XUVzogTnbRT3nI+ZtpuxV5kApSqVP3jDpBPXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJSF9/7q8AFxT4FJ7/iuh1uEqowLKwynmvw0M144QGyoQGWa9T
	q5+vsD8NVJNAMYryh93K74O3yJF0nSgA5LYq2h5uJUB7gEYEZ7KmGPKMOCh/vJiRfQQAmuYJgvG
	wBWijfoF/qxD8F47Xaw==
X-Google-Smtp-Source: AGHT+IEJiBZvawIN2RgaGyQWpOpWEL1rOV3VDXt/kFR5FQk24WrYF7J15eKsT4qagQtBygvpi7Ak/mP13MhKKiw=
X-Received: from wmti8.prod.google.com ([2002:a05:600c:8b88:b0:45b:732e:5a16])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f94:b0:45b:772b:12b9 with SMTP id 5b1f17b1804b1-45b855336dcmr90049625e9.15.1756802370679;
 Tue, 02 Sep 2025 01:39:30 -0700 (PDT)
Date: Tue, 2 Sep 2025 08:39:29 +0000
In-Reply-To: <20250901202850.208116-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250901202850.208116-1-dakr@kernel.org>
Message-ID: <aLatQY1ea3on4n8I@google.com>
Subject: Re: [PATCH] MAINTAINERS: Add drm-rust tree for Rust DRM drivers and infrastructure
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, acourbot@nvidia.com, 
	daniel.almeida@collabora.com, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Sep 01, 2025 at 10:26:39PM +0200, Danilo Krummrich wrote:
> Multiple DRM Rust drivers (e.g. nova-core, nova-drm, Tyr, rvkms) are in
> development, with at least Nova and (soon) Tyr already upstream. Having a
> shared tree will ease and accelerate development, since all drivers can
> consume new infrastructure in the same release cycle.
> 
> This includes infrastructure shared with other subsystem trees (e.g. Rust
> or driver-core). By consolidating in drm-rust, we avoid adding extra
> burden to drm-misc maintainers, e.g. dealing with cross-tree topic
> branches.
> 
> The drm-misc tree is not a good fit for this stage of development, since
> its documented scope is small drivers with occasional large series.
> 
> Rust drivers in development upstream, however, regularly involve large
> patch series, new infrastructure, and shared topic branches, which may
> not align well with drm-misc at this stage.
> 
> The drm-rust tree may not be a permanent solution. Once the core Rust,
> DRM, and KMS infrastructure have stabilized, drivers and infrastructure
> changes are expected to transition into drm-misc or standalone driver
> trees respectively. Until then, drm-rust provides a dedicated place to
> coordinate development without disrupting existing workflows too much.
> 
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>
