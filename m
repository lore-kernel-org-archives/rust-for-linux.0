Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88031917F4
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Sep 2025 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756982428; cv=none; b=ESdTNAGxPVJ7az2S/CVo2Rcj0m4A7fY5vaNblx+jM0UB9JE29nTTH9ac9xRU1GQQgU0KL4ShqscrjBKkRxZJQUxpUr4wRxTJJgokFdPIyoWdHGGybCxF9QbpmcWxdTHSkkHzzeMtnmjp15HSspz1vJfd5jHg41nbbWA4p7/RDeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756982428; c=relaxed/simple;
	bh=K35TYVQdmCqeD7Q3E8OIUOVLCEHOxk1ZzvVD9CcXM0g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eYQE2uV500KkrcmfhKdS8xqU3VpwzW8sOolXhMe4d4p1L8vijSaYI+9ixcDlqWoRBTvK6wzuzjzux+DXOFZ9wZU3M14Pj4fOJKBgKAfkH9s7G3+bQCKOJjRvv35pCdQLVOOmZ4t5maztJIDYnUMfClv36sHnUtl79EnBrCrCvfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IX0C3vNk; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IX0C3vNk"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3dbf3054ac4so437872f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Sep 2025 03:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756982425; x=1757587225; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o6y2QOBZu14x36SZiIQblNfOse9Z30SqsU6mw32en+A=;
        b=IX0C3vNkyF7wS+NVZHzQZdQsK/4MIrU68d9uFFm0UA3rjBeAORNyPm0dDYEUNJeWIA
         yVizZij6kvIZvan6Ssjd/jRhNB0agwwW4l7utVO4UoRYQM+QPSRJjCMW5OcTy0hmIlay
         okZTyTI/169C3jTozGkwFVVYMzzVYPN8A1NrqDt4ajeMgYBDXFMeBfR9E6/MYCN5+uaZ
         IJycZ+N9Kcucf94GWXelN0NU6hNAaMoXJOGGmOnK50SVlHY+gVD8FT+jqRYV2eDAgKf+
         n1WNPLVTPyo5XgIhCeOLuumdbxgQ9OqM9S/vAlAvk+kpVH8ziWlGYHgaYvq8ZjUIvK94
         qxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756982425; x=1757587225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6y2QOBZu14x36SZiIQblNfOse9Z30SqsU6mw32en+A=;
        b=PbyajvOgJDfZQJUBZwhadvbKXQ4IkedgCZY0BJeuzoiMFSOM12YevnGUApUODIp3sk
         SEQWR6urj6hznJLPh5aLXZYrKAVpu+9VxYWjUYu1/Zj5oXkiGPWlE4RzkeVH17NOUmaE
         LgazuTcTmnZ+8i9C83mJW0clvBW4XfwMYmyzzeJQ8trHe72IYfauFx3nqvJN5vLgZ2AV
         dwI0UgipqU9u9KXLPu8XH+1vzflOva9zx3nRt8qtguIxInVe+legh6VSgFVeNyCK5P4+
         Z+u/5sjnG4zdjBo/JnRN5whjiCQK/83tz/kICtBUy8sq4f0YPbRDy+WSQ+Dn+Krv1R8G
         DEQA==
X-Forwarded-Encrypted: i=1; AJvYcCU3StzVNLliHXlkmiP8FKqRdONnMHMdpk4Zoe+R0mr5W+vRfhHE/SM/MjsQ4leUpLaz0hD2mqODsPk8VVfQOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWm31DHTgy3d3bW9LoXvIPD6tSAJcc9FESw+Q6un6o0eDZ/wPG
	ktvhT405Msa2A6v44pNoB86yJL97UE/Sx6Hd+I0zRrOYgNCzPulu4bpaCUiPgcsQ/gLtI3K6+aq
	eNYo3sgvzGQEYjJ+P/Q==
X-Google-Smtp-Source: AGHT+IF9yvAHvKVOXXpEFHka86WFsWc+ojWObCx+xIgC+kdLnrHsvwSPcYjH86gfddOM2J9YtQ9wDriAn1Gd+jI=
X-Received: from wrbfu17.prod.google.com ([2002:a05:6000:25f1:b0:3e1:aeb6:bd24])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:420c:b0:3d6:212b:9ae2 with SMTP id ffacd0b85a97d-3d6212b9f09mr13611267f8f.63.1756982425153;
 Thu, 04 Sep 2025 03:40:25 -0700 (PDT)
Date: Thu, 4 Sep 2025 10:40:24 +0000
In-Reply-To: <20250901202850.208116-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250901202850.208116-1-dakr@kernel.org>
Message-ID: <aLlsmNzp_KardLUt@google.com>
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
> ---
>  MAINTAINERS | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..1cd6597c7f1d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8079,7 +8079,6 @@ F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
>  F:	drivers/gpu/drm/
>  F:	drivers/gpu/vga/
> -F:	rust/kernel/drm/
>  F:	include/drm/drm
>  F:	include/linux/vga*
>  F:	include/uapi/drm/
> @@ -8096,6 +8095,16 @@ X:	drivers/gpu/drm/radeon/
>  X:	drivers/gpu/drm/tegra/
>  X:	drivers/gpu/drm/xe/
>  
> +DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
> +M:	Danilo Krummrich <dakr@kernel.org>
> +M:	Alice Ryhl <aliceryhl@google.com>
> +S:	Supported
> +W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html

It looks like the right path is:
https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-rust.html

Alice
