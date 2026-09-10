Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA89048A8B9
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046165; cv=pass; b=r+XDvB0GE+X7NDRevqnsQgEqpEOcYSL7tT8Svp9BCgn7r7L7DOkxueP1KeOaQqbxw2ny1kJBAPzMcD8jB9e7/79+jmbE6s0gEzcNqTHBFfGoZ7/mZTZhnFqY3z5udosW6LvMy+7foi7UfO+1BWWIp95zan7o2v0xHphZaWcv3nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046165; c=relaxed/simple;
	bh=r9p+KqcSZBzwlNv4UIOkluYxZzxF3C9CkP39r42NlUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9oUWaU7a3Mb0vfFxlPRy3AJ9J10qAmFAx14Tx3zZ4ZZilep/YSDjXmVAOzYa/wg2vH5bz/PnhJ2rJqz8bbYLN96QeRdDtiQhjrpjo1K3tGqSQkMX+oy2xnFMSRwBG6Gsa7iM8DyWUbJTec404Ae37eWOjh0wOmPLFyg+djQqnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b66tnTQ8; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b66tnTQ8"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-781d581d9bdso249133137.3
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 06:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789046162; cv=none;
        d=google.com; s=arc-20260327;
        b=NV/dlx7/oGQbCHMpfEkPjnReCzcpB2MXqWsaSgKxojOkRrZ0pdsz64fI0Sq40rygdy
         7j5ozYQRljDwcPDEG8dtT2kmP4cJ4OQdNVBb6BjcGfkyHvkw2RW020FskFjy6rQfpk+W
         K91kdMZMt431eZQ8k4muqbXSEhVNoPeNyyrYgwcu5s74jgIycPCF73r247+pyjjqVJoO
         UB/v2che3CKMMpQdTdIw07g2MJVGKBvaFAzHZEnRXR8zC/UWhcIlLwI+aIoHuX+N4zSm
         g01Bcdf986cXuFtMKAqOHzjRd/4Z1wSWxev1jVJDf4glrTZEeRVcrzK4YKquv+t/Xw21
         /Qhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=moA5jUO3uVa6D/ugtSObUrS5bANjOYs5c5g0mj7H5a0=;
        fh=d6Pf215jK/SP7pyEOWD+u55anMyRYbkPNbwR/YNwOOU=;
        b=VKGnxQQGhChD2y8+ThqQrD3+i6JCAC2xXqYAc87S2eQZtChKTX5yt0aDxhRpi0phKR
         /r8pBLLwySpNBDHc4HR49Bw7hfjfH7ABJC3S5QtlPY52lba2b2qjN7hozSeg6cABZikE
         WOQrNPELdg4zPhNCTkfixCGesVma6RHQlqgciYLTZpQ/fbOdzQHGEhgzKsTppghninT3
         7Zo/vvMRZtdhge2anUDPgMoLn/A62e62KM6cZfM/nRDXQPHe3JvvYLtlCARPbKg0jrGM
         H4sC4CB3cesR8zGOoGrGtP91obx45ut3kLibHVwqU4iFh/L03rnB6y2R0oTQdr3rktMF
         274Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789046162; x=1789650962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=moA5jUO3uVa6D/ugtSObUrS5bANjOYs5c5g0mj7H5a0=;
        b=b66tnTQ84Smqti3gL2sPo+HpSbXYjnKsqMTwwxQtewG+Os+PQYomsDy8Ia41zmBATc
         B0HM3lXvJ9bi08YezVh7B8GUrU8LJn7d4q4SWeeCGDtdAZxuT5Hb8oJk8kWFnFa2G7zD
         Brq9uDxXnFVz9j6pHt/EL8txXU/OS1xRIBgzV5NzpR7fHpfF2v1zPM0H2RKXi9z31Lsa
         iF4xlIdM6AflRERNgUpnrnuTkOgFi2abagtSvyJkf4EKxFyJ5fCQUmMKEI9LpMAhHoYQ
         DJGnwQkOXSuGZDvSMAwLYKvpL0Y0PJQNAjhHua748I0UZ3i21RIIxeOHlMrlKCU/4vKB
         NiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046162; x=1789650962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=moA5jUO3uVa6D/ugtSObUrS5bANjOYs5c5g0mj7H5a0=;
        b=MOgeknz9hqiSPh+bVzTVsv7BQYlevnQq3ryLyfxwNcan6pO3ycom5LM2X+CnFphhe8
         HwX812RpUx9d705PtTICA3p7xFz6Z/oycwDzwoxKJoN3q6JvARWNRxsO9kBHcnmpqst0
         n41c9ncP2MwhGgGmK/a3FEJ6hmCj5yszZYvTcVUcAuNaSLaoxc5J2C9oLJr9iCAxFkM+
         KYVx0y6ScG4kIiykBUJHipbb+GhV319yWK/EFRCw1QE2p7geXpy3ALc7d46WaRaMU2xt
         fBdQ7AwovVfhFC2V856BFD8JJHzZGdEF3KRyPUKqWXhsRbnR046Vm14EIiKSlJH/gnDR
         eldA==
X-Forwarded-Encrypted: i=1; AKwUvBx9gcfuKGlBtGm44rExeFvxAJCcoSy1l6d4ly4ZJii3ARZQr/I1rbLdRCihZ+gMo43vdf3KClcEYb7aiHvhqA==@vger.kernel.org
X-Gm-Message-State: AFuF++mffB8nfT8Rd+z0cDx49O/zV/oXFWzBVEYfa79zXQ5w761nGGkJ
	2taULcQgKBcblgnKZqr1b0FgG9h0OTR2/LYBm8pT6mtqVOUiq1NoUPy83pwM4WePC2os7Ys4iX/
	/WHrjzRNu6UktM3aXnbaVNZezhQIUfIQ=
X-Gm-Gg: AYBFou38AU/yeIe4qQHBpCXekQAzQyDfAnQywphomSxhShRgGH87D8FtXt+qNJKKxNK
	l0DI/avT5G8apEGcvf4D4ifXYniMnJx0xySn9qfH9IeZi9iWG8T4a1zByJuQJ2C3CR1f1XiYqGg
	5UbrzgqMM+OlyoJhxuiK0RRNay97SUb0S5FQQWZXCXMTntnqnEkvhLk6yjuQVxI8zps9XKI0Y+Y
	NMdDLc4B2Ip8N+ahbmg+R3FdOLUG7dzEISL58Q+fD+jS9B6ees7gewODrYV1G53Wawt4FhzUKls
	6aKshuL7asJUOBVtemXpCq8XI8EDNOy2xlKXfbdZty7gVUblDNTcTlgExTomVcxOlzpS2bF6puU
	WeewBKBNRLcw9cHG00+1PEsUBGCurlvqQqXFrFDW5bw==
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id
 ada2fe7eead31-79005639f22mr1869415137.0.1789046161658; Thu, 10 Sep 2026
 06:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909173103.73656-1-klarasmodin@gmail.com>
In-Reply-To: <20260909173103.73656-1-klarasmodin@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Sep 2026 09:15:48 -0400
X-Gm-Features: AcwNN1XHoZUcFvWmvZ91jrJEiVXoE4O9xNxPdZc5AmfqfU3fK8LxM3IuZyCmVsY
Message-ID: <CADnq5_MCChZJ3vFmAeMPhq1xHLC5Ba+=g+v4+OUKZ8ciLbKY3A@mail.gmail.com>
Subject: Re: [PATCH v2] rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
To: Klara Modin <klarasmodin@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Deucher <alexander.deucher@amd.com>, Mukul Joshi <mukul.joshi@amd.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Manuel Ebner <manuelebner@mailbox.org>, 
	Gary Guo <gary@garyguo.net>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks.

Alex

On Thu, Sep 10, 2026 at 6:08=E2=80=AFAM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> When the commit b67d2d039f64 ("drm/gem: Add callback for when handle
> count goes to 0") added the handle_free callback, it did not update the
> rust abstraction, which will cause a build failure when that is enabled.
> Rather than just adding another None initializer, use
> ..pin_init::zeroed() to make all unlisted callbacks None, and remove the
> existing zero-initializations.
>
> Fixes: b67d2d039f64 ("drm/gem: Add callback for when handle count goes to=
 0")
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Closes: https://lore.kernel.org/all/aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@=
leemhuis.info
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Closes: https://lore.kernel.org/all/4da62a4b-c4ef-492a-9a27-b56bd4784acf@=
suse.de
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Klara Modin <klarasmodin@gmail.com>
> ---
> v2:
> - also remove initialization of vm_ops, which is also handled by
>   ..pin_init::zeroed() (thanks Gary)
> - fix the same issue in the shmem helper (thanks Thomas, also reported
>   by Sashiko)
> - v1: https://lore.kernel.org/lkml/20260908175427.47207-1-klarasmodin@gma=
il.com
> ---
>  rust/kernel/drm/gem/mod.rs   | 13 +------------
>  rust/kernel/drm/gem/shmem.rs |  5 +----
>  2 files changed, 2 insertions(+), 16 deletions(-)
>
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 80d8f524f9d5..9d4280002765 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -266,18 +266,7 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, =
Ctx> {
>          free: Some(Self::free_callback),
>          open: Some(open_callback::<T>),
>          close: Some(close_callback::<T>),
> -        print_info: None,
> -        export: None,
> -        pin: None,
> -        unpin: None,
> -        get_sg_table: None,
> -        vmap: None,
> -        vunmap: None,
> -        mmap: None,
> -        status: None,
> -        vm_ops: core::ptr::null_mut(),
> -        evict: None,
> -        rss: None,
> +        ..pin_init::zeroed()
>      };
>
>      /// Returns the `Device` that owns this GEM object.
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index a687d46d170d..24cb5343e0db 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -132,19 +132,16 @@ impl<T: DriverObject> Object<T> {
>          open: Some(super::open_callback::<T>),
>          close: Some(super::close_callback::<T>),
>          print_info: Some(bindings::drm_gem_shmem_object_print_info),
> -        export: None,
>          pin: Some(bindings::drm_gem_shmem_object_pin),
>          unpin: Some(bindings::drm_gem_shmem_object_unpin),
>          get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
>          vmap: Some(bindings::drm_gem_shmem_object_vmap),
>          vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
>          mmap: Some(bindings::drm_gem_shmem_object_mmap),
> -        status: None,
> -        rss: None,
>          #[allow(unused_unsafe, reason =3D "Safe since Rust 1.82.0")]
>          // SAFETY: `drm_gem_shmem_vm_ops` is a valid, static const on th=
e C side.
>          vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
> -        evict: None,
> +        ..pin_init::zeroed()
>      };
>
>      /// Return a raw pointer to the embedded drm_gem_shmem_object.
> --
> 2.55.0
>
