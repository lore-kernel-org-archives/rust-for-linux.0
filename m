Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFDB58038F
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969473; cv=pass; b=FB+lqYzSVTjpCh3HiblDl+4IcVeRzaXujgWrAONOU0GSJjNhCmq0At59UYLJmMZy/IqmA8ThFAf0q/uLhoJfjgAlyyRqzkWPwndoidl9BMZPZPYUku3+ouk4fS+5ORI75Vbc23tALYzLo2hJcRVoyWQpjnoojpgXOFfjICXLJao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969473; c=relaxed/simple;
	bh=n8ymrHajDVUDFp8O7i8jBrbc2qOh74Mf7H3d2702CV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AASNY7GMn1RIj2xK9eA3HHa0VwbIm1i8oQZzcqc/SE5upNkpysTyyziiPSSi+7zu4V5FYIsQ3vdIg46AHmwK5VFVIaKid5YEyVefO3EzD+46isWJrBXP58oYsMIPBxN96exv+JKCAeqWwWfNq4Tc9wRwLEUYUo+tRhCURQuc2mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAajVIpe; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAajVIpe"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9edso609987a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 08:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788969471; cv=none;
        d=google.com; s=arc-20260327;
        b=F/mVKeGaJ3Jo59sWwah9YEKxqtS+P3Msdrnh1+IBRMSy0W7/lNtU4bAEZpwGrfmyum
         PWn5OXAvHfTXTpmAUkn2FbqNcqF3HPzeObK94Jv0XpfqSOBVMtxIvHXn1MzDpCQU9fKR
         oiKQHh2yCWi8A9LxHF0e0B/TZum8qosxeJCbLFcKkMB6DvhI2OXNeKTATAmBAvGQC1Xl
         z2nF7szZsCR5W1Fx1g27mMDy8QaTVslZDKjGahRkmtxZLh6Je65Z5B1rWVOiFQWIahtd
         WZ0RG2F1P88rnWxNcZDTRLe3L2pSs0ZhWTPpgxxzaeCAtqyoujzlaPUHX/t59oA0L+tw
         p8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0v9v/l61LJDXvYLeJKA3EU6R7TFlt+aBLu3xlyi9va8=;
        fh=+LlGQXBzS41JXTv5jQrgbjUSEjhHE4phpOvfdRTjPpE=;
        b=UTgUsvrq4jMosWSbf86Q55mxlTT0A4tjAXhGIcM2pCHqVPI/R+RIbodWvkEhMT0xCK
         pXU+rqLU7WMtaMxRmBnGnEgkrz+GX0rciF8MBDv3j6/F82b3J0tSIFY/1BV+iF4Ggi1w
         Xj6+4wss7gD4V+OYpv3rCOrrRB3Z9uO64iG+3RFYBINwLA5B7CROhRN93Kuu3BedarX+
         olv1xMVaZatJVhnSIICSIxmya1Y5+80cgrvdpVwHDA9z3H75ZEufNtm2JtajM5kQ7y4u
         bVQLfL2SpaYV5NZOYHx7ACCP9ztAsNqlNhRK1sMkXuwcBEKsEjam1fISZI7X4/9tZ0mH
         7KUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788969471; x=1789574271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0v9v/l61LJDXvYLeJKA3EU6R7TFlt+aBLu3xlyi9va8=;
        b=UAajVIpeHay7Xi2zDnHI5utjc/BPDyqV+MiiU74JzlmhmMg5DOac4vagEW/b61yIYt
         hKMhJnRRNMj6AiMUOZ0X7UBoYFmoIeH/UiYcSn55dsGr1+XVn+LUup2hxNsKiL2NvB8O
         QQdg0bFB3y+psKdlKgIYKQYtC/Ey1xVaavUhQCl2l050uBdOMIl8bUdxuO2Pn3HO1R4A
         XtSQW4WlbVMLlvo419o7+ipXL8pAqpO2WbF13Iz1eVP6fCiJ+JoxqFSRXasqKZivY0if
         MYFtAqzgikUKWkKbI9qKILqcRcA7l8FcAhtmhJrQJeaPP7Qgrhjc3D0ScmZVThoLe+hR
         vLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969471; x=1789574271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0v9v/l61LJDXvYLeJKA3EU6R7TFlt+aBLu3xlyi9va8=;
        b=hc1UmrSUz6teWNqA3cW8qh20JL14JKVOAS2vQgtZmDvaS2ublzbnEKjwJyhy3NBxb0
         MMRCKYN44WvSYgWqiR4P2UCDDlHamP6RkvbgaHyPGASnVq4FZIK4oVJa+tZryES40ObH
         lbTdFQW+nbL4/p1t5/74HKzRhmi7EAdt8vqHck/hIfKpx6VPGWzS10p/HcBrhN8BA9hX
         hnUTLel9qG80LTKw9ZKWcrheuyFRb0K+xyV1zhvqJEP0QUjdWHaz8pXnAzX4fe6KPMis
         d0bmnJPVXAYVi5uG/UFAtk9YRU6o/385Toxwb/ZCu/It24RBUunAjcu98FCdaAuE8lAg
         x8IA==
X-Forwarded-Encrypted: i=1; AKwUvBw//TeTRu699jsaT0ibUyGBN9wBsWMewnpSZCbUO0if5+C54nEICx1EkH2+3JaAkRamq6ETLsSWPCpEZuqUHA==@vger.kernel.org
X-Gm-Message-State: AFuF++nud+w5Wl4s5HoiXA7fK1q0hX3q16FuM/EOP27SoXLfn29ALdQn
	mmtFL+HF/pgO9zkcK3r6x5OOY6flLdxeHt3+lYyaLlapeBGUj+K4hMxAQGByOm/N7fh6wpOH8a9
	W1HtB0BNZcj9vYuGl7Wght6JSmaihu+A=
X-Gm-Gg: AYBFou39OJFOzzf2Sa9fEiL8w1o8Eq+nDA57O1LYnWBMvBhoEVx5DupxJMezxzWQSnS
	XOHL5FzsvHcoU2eUX2c30TpEHfSLFJHsunfqWIhaExc87ehRsKc16DMXcILRvXneBzAk6RD3kP5
	ds9FPUfsTw5PMt90do9QZCLwTNAilyKu6btZMoI3HFbEQwNxBTeVkppMwo1za53zJL003aARxeG
	GWacUpy8mtPZabVAbMPSW1oOEzWwDFXRNPyU7AcHZZiv7D16lQKQAktwfIOTIhPgJNWLX46zNHX
	eukoFoN92O40Oo6YqyYISxfsaylwnHXTOPI1DdHVEgxR6jpBaXkd9UHpeVE61Ab6cKY9ZIYfANo
	nKQanvLOQUssKDYu7qXzEj8ya/Z0qrEWPP0Qoz4lApomJFZjY6nSe
X-Received: by 2002:a17:90b:2251:b0:398:bac0:238d with SMTP id
 98e67ed59e1d1-39b3d7fc6a1mr28548919a91.5.1788969470558; Wed, 09 Sep 2026
 08:57:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909094729.1593-1-mike@fireburn.co.uk>
In-Reply-To: <20260909094729.1593-1-mike@fireburn.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Sep 2026 11:57:37 -0400
X-Gm-Features: AcwNN1V2tAyfr-GYaZ5JcK9f7LxBdPRCMCy96FW7mYbvwWHGJtRYNOXLOtAWttM
Message-ID: <CADnq5_Mf5mQ4CF=8UTnEjYPGVUS-Hf29sHmesvtwdfnNxtrQMA@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: gem: add missing handle_free to the object vtables
To: Mike Lothian <mike@fireburn.co.uk>, Klara Modin <klarasmodin@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Thorsten Leemhuis <linux@leemhuis.info>, Gary Guo <gary@garyguo.net>
Cc: dri-devel@lists.freedesktop.org, dakr@kernel.org, aliceryhl@google.com, 
	alexander.deucher@amd.com, mukul.joshi@amd.com, 
	rust-for-linux@vger.kernel.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding a few people.  Alternative patch at:
https://lists.freedesktop.org/archives/amd-gfx/2026-September/152673.html

Alex

On Wed, Sep 9, 2026 at 5:47=E2=80=AFAM Mike Lothian <mike@fireburn.co.uk> w=
rote:
>
> Both OBJECT_FUNCS and the shmem VTABLE initialise every member of
> drm_gem_object_funcs explicitly, so adding a field to the C struct
> breaks the Rust build:
>
>   error[E0063]: missing field `handle_free` in initializer of
>   `drm_gem_object_funcs`
>
> The callback is optional and the Rust abstraction has no equivalent
> DriverObject method, so leave it unset.
>
> The shmem copy is only built with CONFIG_RUST_DRM_GEM_SHMEM_HELPER,
> which DRM_TYR selects.
>
> Fixes: b67d2d039f64 ("drm/gem: Add callback for when handle count goes to=
 0")
> Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
> Assisted-by: Claude:Opus-5 [Claude Code]
> ---
>
> b67d2d039f64 is only in agd5f/drm-next, so this can be squashed into it
> instead if you would rather keep that branch bisectable.
>
> The shmem hunk is by inspection - CONFIG_RUST_DRM_GEM_SHMEM_HELPER is
> not set in my config, so only the mod.rs copy is compile-tested.
>
>  rust/kernel/drm/gem/mod.rs   | 1 +
>  rust/kernel/drm/gem/shmem.rs | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 80d8f524f9d5..ae61ca7e1246 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -278,6 +278,7 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, C=
tx> {
>          vm_ops: core::ptr::null_mut(),
>          evict: None,
>          rss: None,
> +        handle_free: None,
>      };
>
>      /// Returns the `Device` that owns this GEM object.
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index a687d46d170d..d08a03cb7a13 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -145,6 +145,7 @@ impl<T: DriverObject> Object<T> {
>          // SAFETY: `drm_gem_shmem_vm_ops` is a valid, static const on th=
e C side.
>          vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
>          evict: None,
> +        handle_free: None,
>      };
>
>      /// Return a raw pointer to the embedded drm_gem_shmem_object.
> --
> 2.55.0
>
