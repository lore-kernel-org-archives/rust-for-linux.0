Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DBC26158C
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884189; cv=none; b=I36DmVBbjLfvwU/MW8ulej/QjId/Yznm7KTALB9LaiciTN8512OboKtdxSciMZXOKlvBsvOSt0boBZr9qXJBOqIc1nhu8Y56wTmAQ+Nqz1yK0F609ym2QH8+mw/6BI/CSbWeeA8zOGKVSVCwAx90vo0nryaDrC/oYYUiTPOo3Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884189; c=relaxed/simple;
	bh=hH4FUXAWRkoqD7RFxNxzVkWtnxsFjO12a4XWB+RyyEc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OIc2Kr84srQzRbr+4BVqWwu6WhyDavf2tstchGVPs6HUthwbKGBqDitI0C98L4AuHwsHbbbstkHi4UtM3x05R1HcgfEeJiaM7qtYJyNCls6wiK7UAhNUNLeaTfAqSvBr4g5y9jxRH6jWsKZew/X7OSDvjKE5wLi9qn69rm80iFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hleFI1uo; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hleFI1uo"
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-38e9589b7c7so5184221fa.0
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779884185; x=1780488985; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3GySeGqKvH9w0k+SKK+eNFV995XnhG9D+usTEWb/rPg=;
        b=hleFI1uoWKnT+CCO/W3dV3xFe8CG2SvpXYHj6iJ31/9sINokbQay3drB8Df1g/b2+W
         nc4WemJWZ95a9d0TrCoXl/iZ/Je5jj0iPwZNC8xWDXR5MBeomIxzOI7gJ1I+1rtE9qmv
         XyJnV5B1PVsjLu+86AGoGeCEYl2gzZqhx+HdIVWcB2NCxMKiZWseVSV4qu3qMSYbTEF1
         0o7RI5x5OLJYmy5VM/zVpTRz6DuZ85R+rzqhGEQ6KWbOg6G58jAk7r9W1u2elcUMQuXf
         o8q/NSusYIRcm8V5UhGk/N/0D66AqeMnS285NVcoikwEBQjWciOs8WcHuHf6uK2N/HTt
         esvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884185; x=1780488985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GySeGqKvH9w0k+SKK+eNFV995XnhG9D+usTEWb/rPg=;
        b=rF6G8LkC78MZDN+RrVLwQxgfKyYZwmo+fER32JJegTqBLPcsouULAGLokkN5DIwKUT
         34WISr44j6I4uAI3yQoQKQvUYS5NPIftfJUu3K90zsomTDijUVpV2eZDBcdBLkkwQVKs
         MDKP6ljadBSBaNJnwd/3JH7j9rbQKC8aUEkthi28x4HdM91d/JLBO0WuaqNMs2KJyG8w
         TG195qx7XwCKu1IwTgbf1/GcQ7qfslUqWoBmrAgLUaTwSh2ehq8NUN/Dvi7lvz3yOdev
         zuMcn2CjHM3Ac7dd+lMa/vHI590/iuhhAmL3h/RGZyi8mKXyKaQXhp5KjRz5gJ9C7pN8
         S/Tg==
X-Forwarded-Encrypted: i=1; AFNElJ9rTeGYMIIgd0vvlWwOWCK8i2NpikjkENwR/LzK8cNTRJyqB2I/NcjcrGlfL+BX96grP++gaLBaDuhVdCm+Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoq9c2Zj5WEi4RqeDOWKFPzo9fgOOE4UkQpEKc5gJ9wSQe9Qeq
	Vv2AjtYOtkkGFyw6E3BqfBglWDWVo3HxPu9RSNKQFkgwHLXngUtIGnl0PclhT7kX4UwjMbxyRhh
	ZY7XI4xbSCm1uCc0m1Q==
X-Received: from ljey13.prod.google.com ([2002:a2e:bb8d:0:b0:393:7fb2:6b5a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:651c:907:b0:396:c3c:d27e with SMTP id 38308e7fff4ca-3960c3cd3femr45362351fa.12.1779884184566;
 Wed, 27 May 2026 05:16:24 -0700 (PDT)
Date: Wed, 27 May 2026 12:16:23 +0000
In-Reply-To: <20260526212857.1158294-6-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260526212857.1158294-1-lyude@redhat.com> <20260526212857.1158294-6-lyude@redhat.com>
Message-ID: <ahbglxo5yePyjE81@google.com>
Subject: Re: [PATCH v14 5/6] rust: drm: gem/shmem: Add DmaResvGuard helper
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"

On Tue, May 26, 2026 at 05:28:56PM -0400, Lyude Paul wrote:
> Just a temporary holdover to make locking/unlocking the dma_resv lock much
> easier.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>

Missing SoB for Alexandre.

> ---
>  rust/kernel/drm/gem/shmem.rs | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 116ed0a13eac2..1b24cb1129a8b 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -27,7 +27,10 @@
>          Deref,
>          DerefMut, //
>      },
> -    ptr::NonNull,
> +    ptr::{
> +        self,
> +        NonNull, //
> +    },
>  };
>  use gem::{
>      BaseObjectPrivate,
> @@ -233,3 +236,29 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
>          dumb_map_offset: None,
>      };
>  }
> +
> +/// Private helper-type for holding the `dma_resv` object for a GEM shmem object.
> +///
> +/// When this is dropped, the `dma_resv` lock is dropped as well.
> +///
> +// TODO: This should be replace with a WwMutex equivalent once we have such bindings in the kernel.
> +struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>);

Is this missing a NotThreadSafe, or is it safe to unlock on a different
thread than where it was locked?

> +impl<'a, T: DriverObject> DmaResvGuard<'a, T> {
> +    #[inline(always)]
> +    #[expect(unused)]
> +    fn new(obj: &'a Object<T>) -> Self {
> +        // SAFETY: This lock is initialized throughout the lifetime of `object`.
> +        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
> +
> +        Self(obj)
> +    }
> +}
> +
> +impl<'a, T: DriverObject> Drop for DmaResvGuard<'a, T> {
> +    #[inline(always)]
> +    fn drop(&mut self) {
> +        // SAFETY: We are releasing the lock grabbed during the creation of this object.
> +        unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
> +    }
> +}
> -- 
> 2.54.0
> 
