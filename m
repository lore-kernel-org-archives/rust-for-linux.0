Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3090724A076
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888968; cv=none; b=XXZcRrRD9RFHoB333zM3f3718EpJYHYwOV/p+aqWWH5gKzC0Q/NiaOkhx8+hJ/BipG7N6w4odzrAIViFAMAmVv1oyRC4JqpocpJGrcnfKhuL6ZjoD88usctlE7kY+zHzuZbHgW2HwdRumgCrvbylayu/ebkbKHYE7+EYKQqdxfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888968; c=relaxed/simple;
	bh=TA+QLflUns7II5KQbvYtt2HJkyxBZXngDopxGt1IPPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUHAt+Y+cjHt2m3+A3MGDELn5cwPb4FpsD5wn/XX20NS8LsezK6Dpj6b+wuEFd0uMxWuQg2qwqhbzNuo522R7k9MNTF3shmM3PG4VvQSb8oYlhW2gNPqRNuY4LIT71BCYoKvHS2xWHwVaZ7+/E+ppr4VPkCEsobrNIJZ2W4OPzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4vqhKXAq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4vqhKXAq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so1726493f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 08:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767888965; x=1768493765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vW3/P/N4+paGKM071bgG2imOi6n7IKDgUKqaIxzm8s=;
        b=4vqhKXAq3EMrUj1uoQR4GzhsQY0GFFjWdxgwjToVHhfYoKVzSHtgCGPvOWBBQwSfQI
         Yi9wPUDSi724Uy+uDLyN7BUPgWNtOahpIZvsHbocLsSNobI9sO8uhBFj+4RrLgrBC/57
         s748nldU6vRMqqRn8Map/kjU8AVTl6whAuRs+2/YdM7Sk8E3edS0AOhy4cpGCcDOw4Ev
         DMojL5cuNV6EEJFgtxgffMrTtGLJSQfZSLMn6xOzdWeIyPLjQ4fHMl1o3AzsTkH20edY
         D9DS1hGPdeGrvcaaU/ZPnWBI9Cuw2T1SG6cxGpFRrTJ2ylYWXqWHUSszU1V3CrSeG89H
         LpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888965; x=1768493765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6vW3/P/N4+paGKM071bgG2imOi6n7IKDgUKqaIxzm8s=;
        b=aEREPlijmERYP7gtt2uGdIFuzHJ4KHTFCJZ9hMDwe4NaLElQ6UX8hMqga2wb4b6lGa
         mbCPttCvAz6r90YWLoRS1lanIAaQukuWy9Mgy2JQCt88qhB47zN5cglm+zT3DLMz5XNa
         7lvnEmyKsk3f6vNoZTUAcjE4IXwymm0fTVD/U5NJqqcuUHN2Hv12p7l9hfC8NkNugNdr
         QRAfRV1o5AV4UMxn+Li9yYfxtvbWscPZS3LkF3mA7pKBsjPEFEV5BzVKL2vi49kjbgDC
         4YPZDHhZgE05J3qOZpvaO85iu6vF3XCbmIcS/JczJsPC9EAXYJu7IDTOcqoydFcR8DIy
         QjsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0UnOyU1RRKufntd1EF+K9tK+GPcV1WtKNdrX0nWXCesfBPXgWfRUf9OnnUuMJQHQo0HhJjnu1HvuiUtNzYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyvezlTba98JCoB4wbcBuRTFNeajs95gDfu7Q9LVwpgc4DoEpP
	jiU9SvP0e5H1siqwTYI50m4fHI8P1PFoIRBwAeVh7hgWyfTFWlmCeYQbZUmKFaW2NpGcdqfCr1M
	vAIS3mnr+hSzvs3r9fpO/SXDT9rbgBgLGv/THFXvc
X-Gm-Gg: AY/fxX6wljpWsC6f5rHYLTNLcPgXHks6bS3x2dPBSQmyJeO0wNckY72u7fzCXKI3eL0
	LUhJZCuiq+IHpuJjPg/Zz2bXZBD3XTk8m99OVaWndSi5BjeHnCeHagZzYV6HJWZ+sFWWQ4kKMGy
	5ChPFCAa4PJv3Jdx4wWzTkd/w78dbiaJApLndxCzYqGKurd98nzVGqyxpSBu42WTVuMJ1AQYdrT
	YHad0V5+bOrZxG0Y6cKqO3SbDwQdJO+8K4z/VJnalR3xzd3qjNydQIvsyXaCsohhvjRAq5g8ife
	rBHFEg/D/siy5DfUiAI6PS9c3WplCys2cA8qqr+pInjoYlAoDv5N49BPtw==
X-Google-Smtp-Source: AGHT+IFlwj7HPJoXMHh8QpN1Ab7H/UDknjidGuhXb0xbkpRQOk6X4xFeRXquaMOfNkP2YrRvaqkzOLHouDmVZwg+94c=
X-Received: by 2002:a05:6000:2311:b0:432:aa61:a06e with SMTP id
 ffacd0b85a97d-432c374fc59mr8831012f8f.32.1767888965176; Thu, 08 Jan 2026
 08:16:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
In-Reply-To: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 Jan 2026 17:15:52 +0100
X-Gm-Features: AQt7F2pLnnImtkMgl2KE50d4CB3AXYote1UE4JeFi6pzxph4V_uj8MRfBo1vVss
Message-ID: <CAH5fLgg36qSD7jCarKwipxTSUz4W2uiDDmL_Thqv-+8jBe5DTw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Rust GPUVM prerequisites
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 5:07=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> See v1 for the Rust code that uses these C changes.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - For this version, only the C prerequisites are included. Rust will be
>   sent as follow-up.

I forgot to fill out the changelog. Here it is:

Changes in v2:
- For this version, only the C prerequisites are included. Rust will be
  sent as follow-up.
- Add comment to drm_gpuvm_bo_destroy_not_in_lists()
- Add Fixes: tag.
- Pick up Reviewed-by tags.

> - Link to v1: https://lore.kernel.org/r/20251128-gpuvm-rust-v1-0-ebf66bf2=
34e0@google.com
>
> ---
> Alice Ryhl (3):
>       drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()
>       drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
>       drm/gpuvm: use const for drm_gpuva_op_* ptrs
>
>  drivers/gpu/drm/drm_gpuvm.c            | 91 ++++++++++++++++++++++++----=
------
>  drivers/gpu/drm/imagination/pvr_vm.c   |  2 +-
>  drivers/gpu/drm/msm/msm_gem.h          |  2 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c      |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c  | 10 ----
>  drivers/gpu/drm/xe/xe_vm.c             |  4 +-
>  include/drm/drm_gpuvm.h                | 12 ++---
>  8 files changed, 76 insertions(+), 49 deletions(-)
> ---
> base-commit: 44e4c88951fa9c73bfbde8269e443ea5343dd2af
> change-id: 20251128-gpuvm-rust-b719cac27ad6
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
