Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E767433B3
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754039002; cv=none; b=J62qbRLvgk04BXua7A3nyeF6/nEN1xgBlvulBpL+n2lpg6zZKFkC6RfiG+TPQgyxKnMMqrRKSI0zjaEDWv8hYpVO/lwVXdI1YzQSkBDBk9eCxXGQNB4s9i9YIrHat4EX2MjR/rAAr5s0NxCeAzhoDoOFfuDOp6ENM847jMKhZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754039002; c=relaxed/simple;
	bh=k1MpC9I2fZknqduLW8tuQbi3x1f6SYHPg+1ZudQ4SlE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JkpJ2HgGQTYne7+dx6m8tntSIhU+GJdlzkxaqQX8sjFHigopX+EU6kitTT/Tj6tVIhrZBne+EqfJsthEYHmiw58wk8hNcgviF3VxJ4eyGbjk0bSC0FvMcDA5qONdFykoeZWEB8AZvSfiOMlVAFTY7Y/Aflr0eL/+zs9XHa2EpHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j53qMFus; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j53qMFus"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b79ad7b8a5so1178311f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Aug 2025 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754038996; x=1754643796; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PBmsuUJbeLL0NXrNXi6pfMqYL0XBVnx5Sg0vt6dYzDQ=;
        b=j53qMFusvzqQPnx4MtHXB29Z2GyYijBy98hZnC8R4aQ3MdyYgSu6X9xfxKFPKSrrsv
         GgRwb488SNFxJKMDmtrRrLr+5rs8rIRLzLyhrIS2OxDbp9NRFzGU/lDRo6HW3UemCWeS
         fCPIShV1BVDRXJpIzIDt4McsA9nCqSzoU2ogAScyueRtcSY5MK2cdDEp8oUG7Un6eBRl
         ldCjvrxoP5lKY1dkA5ZxxDRyyuro+23+4/TairYgfZyJdgBTAqgvh5LdRbuksdnKvuFL
         w/R8CEqQqfB/X99Qvw7d3l/5ilQrNTLSqDu88ylgnI6zZebRcY/K4cEI1NpjtbIz8SxU
         CrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754038996; x=1754643796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBmsuUJbeLL0NXrNXi6pfMqYL0XBVnx5Sg0vt6dYzDQ=;
        b=WzcwxzhW0fU11BXR9qHY1bnYMJA6ZUIv13DNnv5UdPbomvwd/fsrJLJbb71wHgYtj3
         0Y5rYOMZWgnL1ERRJEk6eQGeERrd3eSbMqZ4m9osqM5cnsuUE6bCzZUel90BY4IuFAs6
         lsOKQx1RnkCRD6HHtPt1Xi3ivUFXZyCGJZmLARHEdlsA7wXDoEyfKLaVIymiTCObcy5a
         UiZpEJFUz6EYGSqGOPaYG2J6X0AgZ0WcTrrI0unhZELjK1clz0raOpUCF5H1JbwJLHxU
         SYr1J9d/px+fp3XkqAP/6iP5sCwYDDaUWhzroYE8TwD2Vted2E4HIQp0upTNWYMhd4Wy
         7SrA==
X-Forwarded-Encrypted: i=1; AJvYcCULEnj1gW9uJYudPPmakYpEI2M0bFDJe3Wc8Mvo8zJ06dVaOIYkM4rORjrGh9MaIZ6PAbOnipAiO8hwSUp01Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGSX4fQGZsmZhbD56Ne+1KGRFpVn3+SZ/XlrpFumPFH83ryjwj
	T1IkgEd8p2sAApUlEaw9YcTeY7Pp5Lt72GSxtUsfZ/y5wgf4M2a+WrOgFLf2nXqGk+0DUtC7WSV
	9sc8pUw5JGUaKrMMGWQ==
X-Google-Smtp-Source: AGHT+IHE6ul98uLxU8+rgJ4DluypxUwUeH4rzGBJSdDhyXEUwohSo0THQ+GTzCr9BnM77dXh9jBEpBbHuNaVFFU=
X-Received: from wrbeh10.prod.google.com ([2002:a05:6000:410a:b0:3b7:96ff:de4a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:24c6:b0:3b7:6828:5f78 with SMTP id ffacd0b85a97d-3b8d343afadmr1672233f8f.4.1754038996632;
 Fri, 01 Aug 2025 02:03:16 -0700 (PDT)
Date: Fri, 1 Aug 2025 09:03:15 +0000
In-Reply-To: <20250627123854.921704-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627123854.921704-1-jfalempe@redhat.com>
Message-ID: <aIyC0_Wxm-s6Yo1E@google.com>
Subject: Re: [PATCH v2] drm/panic: Add a u64 divide by 10 for arm32
From: Alice Ryhl <aliceryhl@google.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 27, 2025 at 02:38:19PM +0200, Jocelyn Falempe wrote:
> On 32bits ARM, u64 divided by a constant is not optimized to a
> multiply by inverse by the compiler [1].
> So do the multiply by inverse explicitly for this architecture.
> 
> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
