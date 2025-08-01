Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473DA22422F
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754039600; cv=none; b=TFS1cfhMc2rwSXE6F4fv5lOgvm2dIKelTmpFLjljhFO+TveQ7KmnJV8KCXcnwJf3Bq40cj8TSdbUD1rn/N9Fkb6qBMu9Kga2w43wywsGWjasR17v/1wgofVdPq2d9zxoKp67cJq43GP+d5rXvAY9dGlxWTJ4ZHmO2EpKctHn/4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754039600; c=relaxed/simple;
	bh=RAVOj1CN1olTFTs/6YN/V5UIdXx0XK20fGL2Q/tlNDM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KAHFBILXOemrMDCLU37XxJ6EjCzKdehWzRPACM3hfW9CxS4XvIhM18/xfsuBUDvZm4E8Bk4/8PWFwm5NZjPeIJENBynZRb/fG6DrDsoLuthbcMg8TDt+/K96NlUCUkGCzm/aEHXqf1nEKAF7sirKk5JPEsXbMNuQ5zxJhdZhl9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lz6o7mMc; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lz6o7mMc"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-458a533c069so4684655e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Aug 2025 02:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754039598; x=1754644398; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qIrCn5ChfjSuaaWKanoGK+49bYqdvqeTL1wiMqtLeRI=;
        b=lz6o7mMcabiabUjZDTi6FbygkCl9xRHjwhiW/lg0RcGrT+KV3yrCy3YOxP8icZlaHb
         IdhCipThTuD3TwWsBxmxOu9DwvFrJD2RyOkp5x0owct0UcBLgQYBq2M22QqwCPwUmPtF
         xTQBFzXtf4M8AQuC8EePqmQDZMv2NTu2K0naAU3OxI1EyHi66aWacMWie1KZRDHn/GFK
         lf3xHhqxJluWrK/iyw0qbaOiXOnu7z32R/qXgHZ85a14z6z6BjIBLCEIxohel3Pu2qEP
         yyWV1M+ptZ7WcdvpI/avxep6mU+lIvvtRPrgG23BRnHdM19n+8YQ/7j6/Q3lbgNcFDia
         r2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754039598; x=1754644398;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qIrCn5ChfjSuaaWKanoGK+49bYqdvqeTL1wiMqtLeRI=;
        b=UduZ62F14kYbv9yCGKYv+oPXhjb8cgGwP6jc4jOhKHg0svORvJVbKqatDDDBKw0MEm
         SNPltX9QGo9LekIw17qLGS0/9C75s4RV4/L3+5EqNA9tuL/K3FGO+H/iObMeVSfXa5la
         pA5pVyhlmOaEYs/59YxY0u7cMQBkFbPPQSOdnrcblzSQaMm3x8c06KxrEi9gpRYu6XHB
         5Vl83FXVs0W08xTJX2ltY5egd8g2SgToLo1yvGFiUs3NN/Mj21GzkbooSD5nbiZuN89n
         fVpYC1DN1+WllRYTqoEllbXH5GbgGBpK74qWsWSEdaigQ1WnQnXo6IDuz5wzpyOgPkvs
         HdSA==
X-Forwarded-Encrypted: i=1; AJvYcCX35+/WmsDqoCw9dK+CqIZ/Sx4T6oWrDbW322wAY7aLA3tbbv0ZqvxGeAiEVtdmD5XcFpIAM3H6S8Ox+fFs3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+LwYyp3NCaf2DTX3DRgfdm0Jlu6fSceq/rKiPGMEQHWc9uql
	6hSQdTpnSWS5O0ut55Ev8udYgdjghbP4VoFyEhfCHjLqZld2So1S3LOMdZGoVHne+3S527lZRun
	CKWvn9LMKyNyPyHNM3w==
X-Google-Smtp-Source: AGHT+IGjjOW9Oot2bFj3PWG3PB/y8G0bJgwiY7qUCIY2PFZOfhA37fiaHW8yWyvMMhKKK1+HLzZXKQmndCci3yU=
X-Received: from wmbgw8.prod.google.com ([2002:a05:600c:8508:b0:451:d768:b11d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46d0:b0:456:28d4:ef1 with SMTP id 5b1f17b1804b1-45892bdff7bmr94283905e9.29.1754039597687;
 Fri, 01 Aug 2025 02:13:17 -0700 (PDT)
Date: Fri, 1 Aug 2025 09:13:16 +0000
In-Reply-To: <20250731154919.4132-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org> <20250731154919.4132-5-dakr@kernel.org>
Message-ID: <aIyFLDvb2kGoiWW9@google.com>
Subject: Re: [PATCH 4/4] rust: drm: don't pass the address of drm::Device to drm_dev_put()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 31, 2025 at 05:48:09PM +0200, Danilo Krummrich wrote:
> In drm_dev_put() call in AlwaysRefCounted::dec_ref() we rely on struct
> drm_device to be the first field in drm::Device, whereas everywhere
> else we correctly obtain the address of the actual struct drm_device.
> 
> Analogous to the from_drm_device() helper, provide the
> into_drm_device() helper in order to address this.
> 
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> +    /// # Safety
> +    ///
> +    /// `ptr` must be a valid pointer to `Self`.
> +    unsafe fn into_drm_device(ptr: NonNull<Self>) -> *mut bindings::drm_device {
> +        // SAFETY: By the safety requirements of this function, `ptr` is a valid pointer to `Self`.
> +        unsafe { &raw mut (*ptr.as_ptr()).dev }.cast()
> +    }

I think it would somewhat more consistent to use the naming raw_get() or
cast_into(), but I am ok with this naming too.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
