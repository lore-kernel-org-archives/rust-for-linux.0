Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7083321576E
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Oct 2025 11:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750276; cv=none; b=UMIyA4M1Iunn2CHslNExv+FPrOsqhF2Mz5RFIQuOGmhD1AA6wzP74If9IMG4SroYtnpfjZKwyVPTvXh7t+NdVt+30uEDrbmAn2IKk/FcabXcZxEQj48PizZCYCU8gJnQOd5w1n6Mx/T26xz6Y2Yof1Naw8w4Kwt77NaCa4OZp5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750276; c=relaxed/simple;
	bh=KBB8bLmnKxiKJBgmqu9qRxSybSoobmjy5KqsgBWgLSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3sHybkn8pfJDbr0VeBypH7S6OFMwko2NdROLjtqkOqrnaUJJTgQ0LEdzhBKAXjm75/hZUPnTyAzhseweib4XFNJny0Zg4+ep2TNiCiBf1/BrDrl+59S1nA+mZ1q1ZNuNpTlhvsKX8HZDUSN5cn0dD6yMGg6cN6mFHIiR0otPRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XHi2K8pb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XHi2K8pb"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso3685982f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Oct 2025 04:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759750273; x=1760355073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hynuoczeLJTVBLZvXLTFWBQJF44SryF2C9fl7xOgImY=;
        b=XHi2K8pbu77Tj39tSC6V4GuIDOHXqZCLVi7qVWTMpcU8NIBDN0hFvnWlIi5koXLoP8
         pLmy6/9mPfysCmCIu1Xea1v/EKaKmRfCAXspcNW0YjEYN7Uyt4TjWPh9OKdbFTdlXNwX
         RWGV9hNz/B4Q5DU9Vui2eOIgOKGQeBS9zHEAl5ul537Zl8xbgHSq6ePOCrufNlhxBB/q
         2VQ4VhzkbCVSFcKF30wbKh8pmkB++jxMNcm+dJLoUhJpnvihsSTEYQ3DaGcCTC70SEJs
         W40TCgQyTU8Hu1bcs8pRItp5Yahc22K3TvjeQ1FPkBIVrpjovY2wvgB1WGxXC5S/O7N5
         VKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750273; x=1760355073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hynuoczeLJTVBLZvXLTFWBQJF44SryF2C9fl7xOgImY=;
        b=FXws1gNfmZPScRFKf7xL4iJKPUlni9xZTWk4zAAgp0QOhBpri8mZcl7t61EUFzBBmN
         vNMj+SA38xbvlE8hvhuaK1L23T1EA7DxoUm+ZCzhZzzQdDBwYax6OxGs9qr6WibRZhdN
         w1aT+Dzf8pR/CZOA0qpsCJXXFOf36BJ1KykYcRiNdOaP1QJ5Y+x9mfcZq3PslzQ9jl4q
         WCGwcuDkSQ7lHKybyWO1agMCwE2MnlE10oz8fG2c7Dv5ge1IglIxFRiXD74+sAAUThyx
         k+4q/t+yJiWgSGyAoDjnCeYC7D4/RbjAXqmcAaMA3adwYoETmNrh07DEoGWPORGmmzv7
         uN0A==
X-Forwarded-Encrypted: i=1; AJvYcCW7bKd59m3kNpPD/52m1VXLVxYsullEfx4qjmlh8p7SUspKUQclN3nUsR3cEv3lybK23qZeliXcjdbMhwStJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFdmfE/+cuZ2jpByogIsiNliVAnIJy4fH9JZSK48MAezLI7ErD
	ja17dp3lCZwDZYRzoQirwUrz9pdyCuNfKe5Vta4x+P0St+F0T9HispXSeClDKt5rmK6joRj4N5Y
	tXkbVc6qFNfXJ2FJj5LB6niggE3GTmuaXqhftaVkj
X-Gm-Gg: ASbGnctXv47pgZaFSrrIwehEZtWSSSEvMEwTZq0K3Lcz9KsVk5nsFahB+JK+3mp6xGb
	zmx26XkqGBMfoL/ljYxl1pvQ+AQ4Em9oWo08qmCLTuqCMDB9PHIPa5gAxxrM5FDKvMbaYDqK7Hv
	LttF+bXZaJjCBhxAaa3HKTfQIfCzEeBpWRA6s9ykdOwPzOowI0W9KP6zSWbap46yTbqi12cDDNt
	szh4yMIJTQHB485p0QTKsodfj4KTkXEFy3GMm1SlWCVCcXBbR1FmoI00ix+HxybjLp0bTjFsglm
	vL4=
X-Google-Smtp-Source: AGHT+IHvyJbvN6G9/V2BAekCb/eczdhEbJ4N40IyXAkqljeVImgzHiqmjBf+48NckaYcxwY7yRHMElzQvdgz8RRqA3o=
X-Received: by 2002:a05:6000:43c5:10b0:425:70cb:9ba8 with SMTP id
 ffacd0b85a97d-42570cb9bd8mr4248192f8f.1.1759750272637; Mon, 06 Oct 2025
 04:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com> <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
In-Reply-To: <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Oct 2025 13:30:59 +0200
X-Gm-Features: AS18NWDt63QT61YPNpzRLuOD6qlBzTV_WQ7rT6iD_6SVfpk6AHE4bvqw1ogfIKI
Message-ID: <CAH5fLgipghDp3W+Gr0YfHT0HOp3vcF+mfBAbtiAiLOKRYt43Sw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 12:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> When using GPUVM in immediate mode, it is necessary to call
> drm_gpuvm_unlink() from the fence signalling critical path. However,
> unlink may call drm_gpuvm_bo_put(), which causes some challenges:
>
> 1. drm_gpuvm_bo_put() often requires you to take resv locks, which you
>    can't do from the fence signalling critical path.
> 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often going
>    to be unsafe to call from the fence signalling critical path.
>
> To solve these issues, add a deferred version of drm_gpuvm_unlink() that
> adds the vm_bo to a deferred cleanup list, and then clean it up later.
>
> The new methods take the GEMs GPUVA lock internally rather than letting
> the caller do it because it also needs to perform an operation after
> releasing the mutex again. This is to prevent freeing the GEM while
> holding the mutex (more info as comments in the patch). This means that
> the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

In this version, I got rid of the kref_put_mutex() usage, but I
realized that maybe we should bring it back. With the current code,
it's actually possible to observe a zombie vm_bo in the GEM's list
because we don't drop the refcount while holding the mutex.

Alice
