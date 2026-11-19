Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087071;
	b=ibyZztEmp1hrp4Ni901ZnhA82Y4A9QylJDRMT6c7zyXsDaUpw8BVsaCfu/2dHAI5WMoy
	 FAUnfleK4FCLAaaDiU/3H37dzLuTIJUt6gvEuCsocQ4+OdLwC8vtZZbfZZYHXyijVkpjr
	 hn5E5j17Nj6dAEO1RoJFNISjv8iHOHRaNjykDGF1L6K4raIVo15fEKltizVSHQ5kLbYL5
	 DbCNLXvKITVqJEWGVLYDqFcwOMRUxWVoC5xopibgbq9UMExNAzisnU1hDO/peB763wvLy
	 UPDoBYK5KkSiW2tinNhi7zGrBa/zyYKCyZL7NHDHpPm9tGOUJcVUABmqdAJpShufIPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RlZOdD7i7xCpjMBuRImGfpZl+cJFA2YqI8GZO6zioDo=;
	b=k1pt4x/K/g+IWq/tTY9BlWkwaTojnHu2I4Npp7xTlyfPdJIzf5BuEekoX8ew6nkFGVBA
	 rkzfup+owBwXVeBbEEkr7kCET//iQ/BzLXqV2003b5YDq9n1PlB5p9lDW+uExSvGjUYeQ
	 QL3n04wu3fF9kcEwWXjN+5ZAdr6zIiaPzT8dt0kKDjr1Kakzn1Fx7jX6wqcab48KTo52E
	 ZuuARGFZoVoUpHNCZsu+kWlWBvmXAXEAvM1qnxCAdg+VtwLrfRKooSlAJNYRDnZev1e8x
	 TiHGFWkBgPExE6EpP+szlvFPeVgwRTjRY2TImF5YZJf2bB8FKOx0S6se0R/0n0s6kMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d+xkWfJo;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E67606A320
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 11:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7E67606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d+xkWfJo
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a9be7586ccso334337f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795087069; x=1795691869; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlZOdD7i7xCpjMBuRImGfpZl+cJFA2YqI8GZO6zioDo=;
        b=d+xkWfJo1ROIAbdDs75wxkKtPvqofQgoDfLrHOBkYZTBnp+ldFwQkG56hhvfW335ML
         0QLWRZNUir1ZDNRYKdTlMxpPsfW2w6lm+UvyrYKTGbcnLfC7J5G//3mSTg/tDJAnR921
         oat6OKIoK/llJKHs2mnebkkzLx0Ackxj8IdjOGUUd3vEd2uWvhtGwrt/MsQ4zbCZIrui
         4Mtxt/nRlOD2mk5/LC1Dtq9hFXKn7ts768IE9OSOqe7uJlvCsBq/2bdHXq0Nq8fGddkp
         d2bZUCz7WflLfBS/8ULCtaOo21GQ37H5TbqysYXDNdZFOXsBWqvbZBNK5010QjTJjpuw
         NAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087069; x=1795691869;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlZOdD7i7xCpjMBuRImGfpZl+cJFA2YqI8GZO6zioDo=;
        b=brkRm1iaotDZYaDMUZ7z0p2KO3fE+lqZ6yaEA7xfSXarpbClyk8d2UIumF1RCzPz8m
         mYgXGHJLwcsDL27+8xAZj8lhEiBAFiTbqJDSe8NYA1oRun9346SgfLgATfyY2/1wV8an
         t5LdVE17vK/D7GdCTJvvzVpdmhvcVWTELx2iTtHqUHNETJqR5vbKDNPBM87SZOxShVFV
         h58L+SKgnvEAdMlKuXvhxlOD7Y9s7gFy0YNACcRmFkLwhrYSK2FWy5z74DqUVF5DIawp
         P7ZOVOH8Erm6KPOd1vEJ0rHDJDtFzVffXVExxwEcei/hkDcsislJhZa1hpSg2XwHfKyh
         Ho1Q==
X-Forwarded-Encrypted: i=1; AL+hErFbV/i7vQ/VLN+XOpdnsUlAXA2dqyKk9grmTG9s4qGz0uUgTPKmUgb2GdV2u+ZLO2XwkkbUfacDdAxMnX3YKQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8AZHxDgwLc3Nf9L5TkiOc5MTxWoGOOcNPCvDbDVOb9iQBkOEPh
	LNXWyxgPQspHaDjAsZDALqZZoEfev/FFybVg78AyPGUL5B3NvZcZkUTyZXVyxy++DBCeCkt8G+v
	9kWYToQAuJZHCAMJbuA==
X-Received: from wrwi10.prod.google.com ([2002:a5d:55ca:0:b0:4a7:4b90:c045])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c0d:b0:49b:b94c:e8e8 with SMTP id ffacd0b85a97d-4aa544edba7mr2116016f8f.8.1795087068558;
 Thu, 19 Nov 2026 03:17:48 -0800 (PST)
Date: Thu, 19 Nov 2026 11:17:46 +0000
In-Reply-To: <20261118181245.2583303-1-dakr@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118181245.2583303-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119111746.3049044-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: remove DRM device private data
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, airlied@gmail.com, simona@ffwll.ch, 
	daniel.almeida@collabora.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 07:07:35PM +0100, Danilo Krummrich wrote:
> Driver::Data is owned by the reference-counted drm::Device and can
> outlive device unregistration and driver unbind. Driver state belongs in
> RegistrationData, whose lifetime ends with registration teardown.
> 
> The intended model is that, after drm_dev_unplug(), surviving DRM
> objects (e.g. through remaining userspace handles) no longer require
> access to the driver state. Thus Driver::RegistrationData is available
> (and sufficient) for all DRM callbacks into the driver.
> 
> Remove Driver::Data, its storage and Deref implementation, and the
> unused workqueue implementations that depend on it. Drop the data
> initializer argument from UnregisteredDevice::new() and update its
> callers.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Makes sense to me. Both in-tree users had `type Data = ()` anyway, and
nothing uses the `WorkItem`/`HasWork` impls on `drm::Device`, so this is
a pure simplification.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

One small suggestion below.

> -        release: Some(Device::<T>::release),
> +        release: None,

[...]

>  #[repr(C)]
>  pub struct Device<T: drm::Driver, C: DeviceContext = Normal> {
>      dev: Opaque<bindings::drm_device>,
> -    data: T::Data,
>      pub(super) registration_data: UnsafeCell<NonNull<T::RegistrationData<'static>>>,
>      _ctx: PhantomData<C>,
>  }

With `release` gone, nothing ever runs `drop_in_place()` on the Rust
side of `Device` anymore. That's fine today since all remaining fields
are trivially droppable, but it is now an implicit requirement on the
struct: anyone adding a field with a `Drop` impl (or a pinned field
that needs a destructor) would silently leak it.

Could you add a short comment on the struct along the lines of "no
`release` callback is installed, so no field of this struct may require
dropping"? That way the next person adding a field knows they have to
bring back the `release` callback.

(For what it's worth, I checked the lifetime-parameterized `File`
series [1] against this: `open_count`/`open_count_wq` are both
droppable without a destructor, and the two merge cleanly, so no
ordering constraint there as far as I can tell.)

[1] https://lore.kernel.org/r/20261118163203.2483856-1-dakr@kernel.org

Alice
