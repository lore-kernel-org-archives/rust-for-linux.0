Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447719;
	b=CufbvuHEFFTlIeuVRXi9MbvoyQFIIsAPnIXD65YMK/mnhbTxg2DXwMmR6z5qoe0K6qkd
	 ScORUnX9+DcxmTXGPhfPbcVmtGRi7KtA220PrBHpPzeVXR/s1/O38uYHBh96pIOIYqSfK
	 i0K6zPdn+mb56zDO2Shy/wbRwqFQQpj+36u7QoGEd+k35bTjmWLLlix9EAhG7awZZyuNE
	 8zdGHd64xaH3orXYb5G+YgrPezxHfR17tzPcwzd9X+n5LomaCYzbUjdNJWQJBvaHsSOt9
	 g4WUp9INPgxY0/23mY+baefIE7LYDLClMg5GW48v6UKjHrM2OJ13xmYLLUQxGXXyf9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3DPcsrrlKcBIHFVOp6oadvhLVxLBnBkXH0jtrDtGcjo=;
	b=a4idECn6xt8b2z4TM1vv8osx6g1sG8G5GBm+JDvbb/Da/brU1rBnG7c5hvtJcy1a1v4o
	 2AML6lVOcWekPmOJtdn6/ns0QGuK7/osRyICcFkHC2lLj+2tOgSC80Ia89QroJqpnBJ3k
	 f5ATEDEqxEwcokEuRY4CVaZY8zUbl6IWZWatTjS3sc4f8hM1jhXtnQZ+qIAHN1kHh36Gw
	 bpwkv5GHxPNYaFiFDjFxVIq5TkauZUBeRLKWDQc0DbPdmvfTAvjMEJhYq9G1FAbEha4D2
	 rWK8KzMlgbE3pX8e2YQm21SsjvT6jsAOX6QacwaZTA/a+tiyZbcO937FaXnMtawVkIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=gfxstrand.net;
	spf=fail smtp.mailfrom=gfxstrand.net;
	dkim=pass header.d=gfxstrand-net.20251104.gappssmtp.com header.i=@gfxstrand-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=puXpIIaF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B4C606A319
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 22:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B4C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gfxstrand.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gfxstrand.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gfxstrand-net.20251104.gappssmtp.com header.i=@gfxstrand-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=puXpIIaF
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35f036b17easo1260829eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 15:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792447716; cv=none;
        d=google.com; s=arc-20260327;
        b=lhwzCMFW42Muopq5r3wlrPM087NCFx8/OkSIODzsnqqnuV81s6T0wkaGIc5ha5mMiA
         dP66GWyna1rmOyGT2c+pVeTLc4gXZSvAjhRuDk6MSHeOx5n1zaGuwf2MMXhUjNI4+Mnv
         zua9LUqhrmxmrQa+v2HavDRtcZ4UexQERAs4iubBpFJFegvmlPvaOTt8MpgRQifh4Zjs
         ftLrNKBuhwH3IV1dBXUOqv9b7lWDzPvAT6oGbugezuk31CHB9JxEhTttdGBQdHR+wV6o
         tiiaC+B9U9Bjc14ELxKAxnaszU5c3Hc/Zy2eRlFl/ulu1TXTkedKml2/VHk1gF92x3Kh
         8XRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3DPcsrrlKcBIHFVOp6oadvhLVxLBnBkXH0jtrDtGcjo=;
        fh=uLAkVuLMFfh4qNblnvnX+3lsv/hdPXjsKrgkS7MaBuI=;
        b=h2eOxQzR7KPky1JUSMHCNZvWnL5ciz34FUKqlK8vvOCCjaax4QZzs+mI/JhZOSFvMC
         D+7Q5y5zXR/TAYdMdXUhea2bC6gNwGB7no9xSEVD8EpTdXCfmq7AZ1lmnyZs4UI5UyBr
         MPtFWKgTee0S9Y2/z9yFsCs+oxXfEVNlaDo49+3fFv9VEyasIxlQ4HheKKU78118Hs9p
         +Vs9c65FujsWdevtmRMSk7bLtZrsruhCHqCUAtgQMW6Y4AQUiKCMqhEfzVBXxsLw48Be
         heYZ040OOOrhyrkd8sa2EVvAEEeA4YiBCi4Oj+RtV9Y5KFCe7LsAYJOBfsXuTLhza+jy
         8jfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gfxstrand-net.20251104.gappssmtp.com; s=20251104; t=1792447716; x=1793052516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3DPcsrrlKcBIHFVOp6oadvhLVxLBnBkXH0jtrDtGcjo=;
        b=puXpIIaFddOR3wfP1rDZYT2UzxZkNA6qG0O9xLrJXEpN0mSWkOvRb/zfAugwhi7x1Q
         C6cGVaJEYhBpWOuEFDzFINS9cKDjgQhW2zkgz/HVvMu2v9JAxfNOf4qNDze2WCfapDyz
         EduWUAxn/2m7n5eDiVS6b44ytEYQtK9vue9VaQx4nBaJfaChQpr15SiqC7xieeqqsZjL
         Q5yl3eTzhGP959UuWlrL0Y9rNxVpXwZfP7GtLH50xZDjp4Slmtrx4AyoeCBSbjXrSYhI
         vPidB+77GyzS/RBF6kNnF1gXWeb3ZQh/w+sJgbvSrqr7XLg5uGxkgwg+JWu5DellBUtx
         qZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447716; x=1793052516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DPcsrrlKcBIHFVOp6oadvhLVxLBnBkXH0jtrDtGcjo=;
        b=CAwxQ5hS0a/+PuEo3rDga5I+KG+KV21VHWCmSoJVJUXfpOCk33avCkPITjFteRN99T
         zRJYFd/Jg6mDjvVRSrM7PQ0HVwG9WbRvlpOcmrvPZ/q58AA0sHmVcLyzwMbfEMYiwA1D
         pF49H3qPPEJGO5VOnzmKT6uUB2nZLjhm8OCiIAQLDCHzducgtZQDsuNZoHkIipcd42QC
         Cuuscvl4/6qHvseZSYy8lpBEYl0ROTUmsI+XTFSaYox8P75K9Epr2wQhR+w8l1hbGI35
         NAWId9eV/gur32QC/VMGcRljvAerAQLtWVlEPq9B8PEydwftz3NuXYtJSwYZDvr4m2Hg
         6a8w==
X-Forwarded-Encrypted: i=1; AKwUvBxjlkjU3i0OMWP+Yc1Nys0LJFF1PQTA7+TUPjhjmLG5t981R1jvq1T9tm3U7gos60YQh/2oAVCBdQcDrNvuDw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJtM4uaHrREYiWeiJbWl33Eyuc/wUPYwac0TXO7dEJm5PRjz7Zd
	2UujuNjnyevlQ9JzF+8/a+uU+CvI5aU8t1/ywbVcpFRVPZWu9SrRSZpMRopVXZQR4pZa9TDazhg
	N79X7NiK0DT9ucYrtwQHSynw0VIzSAF/v3E6AhjCvNQ==
X-Gm-Gg: AYBFou3KRrIoKKH1milzXmgoyJWR+qnyq4Nba+t78iicMwg8x55FI5hyEQLT8WKKK3j
	8bwbpMO9X5h8T7naZ55XtnxEFVgFpZjjggdxlFRaxK+apQEgD1EtRzXlLPOUEo+VJZtA/MWGIxy
	sbP9f0xyZV4dCTU2sCNbMMXzpMBB7NHZq5l3Jgcnc9ri+5J9xZqGgUoW7v8qVP8v0X3JdAUGb9+
	C1N/7bIOQ6YSctFCwfhp1EoFs/qPOiRzvOAgETKa4JDe+peZq7sUCjIRwRQTOE1GYQJaaNZUFNW
	JGgF4RW3pYl9lFVc5KJHH8Asc7wgwStjqUVMXEspbR1VCblFjYLS
X-Received: by 2002:a05:7022:f512:b0:16b:fa6d:b11f with SMTP id
 a92af1059eb24-1850ce9b5a2mr12535516c88.6.1792447716400; Mon, 19 Oct 2026
 15:08:36 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019212535.88390-1-dakr@kernel.org> <20261019212535.88390-2-dakr@kernel.org>
In-Reply-To: <20261019212535.88390-2-dakr@kernel.org>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Mon, 19 Oct 2026 18:08:24 -0400
X-Gm-Features: AclHuK-qE8LmEGdwibwHGL6oFYAXR5b0DqizYeAXVyUgVX--Coo1a8MpQKVbO6Q
Message-ID: <CAOFGe95z69uc802-DWwhBqED9VB9ZSts2GL3UZ93frgOHc0akQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/nova: mark the uAPI header as unstable
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, airlied@gmail.com, simona@ffwll.ch, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, jhubbard@nvidia.com, apopple@nvidia.com, 
	ecourtney@nvidia.com, lyude@redhat.com, kherbst@redhat.com, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> The header already documents that its uAPI is unstable and intended for
> development. It may change incompatibly as it is developed upstream.
> Rename it to nova_drm_unstable.h and move it out of include/uapi/ to
> make this more explicit.
>
> As individual interfaces become stable, move them to
> include/uapi/drm/nova_drm.h.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Faith Ekstrand <faith.ekstrand@collabora.com>

> ---
>  drivers/gpu/drm/nova/nova_drm_unstable.h | 212 +++++++++++++++++++++++
>  include/uapi/drm/nova_drm.h              | 204 +---------------------
>  rust/uapi/uapi_helper.h                  |   2 +
>  3 files changed, 217 insertions(+), 201 deletions(-)
>  create mode 100644 drivers/gpu/drm/nova/nova_drm_unstable.h
>
> diff --git a/drivers/gpu/drm/nova/nova_drm_unstable.h b/drivers/gpu/drm/n=
ova/nova_drm_unstable.h
> new file mode 100644
> index 000000000000..3577dede15a6
> --- /dev/null
> +++ b/drivers/gpu/drm/nova/nova_drm_unstable.h
> @@ -0,0 +1,212 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __NOVA_DRM_UNSTABLE_H__
> +#define __NOVA_DRM_UNSTABLE_H__
> +
> +#include <drm/drm.h>
> +
> +/* DISCLAIMER: Do not use, this is not a stable uAPI.
> + *
> + * This uAPI serves only testing purposes as long as this driver is stil=
l in
> + * development. It is required to implement and test infrastructure whic=
h is
> + * upstreamed in the context of this driver. See also [1].
> + *
> + * The uAPI in this file may change incompatibly. Stable interfaces shou=
ld
> + * be moved to include/uapi/drm/nova_drm.h.
> + *
> + * [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/
> + */
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * enum drm_nova_architecture - GPU architecture identifier
> + */
> +enum drm_nova_architecture {
> +       NOVA_DRM_ARCHITECTURE_TURING            =3D 0x16,
> +       NOVA_DRM_ARCHITECTURE_AMPERE            =3D 0x17,
> +       NOVA_DRM_ARCHITECTURE_HOPPER            =3D 0x18,
> +       NOVA_DRM_ARCHITECTURE_ADA               =3D 0x19,
> +       NOVA_DRM_ARCHITECTURE_BLACKWELL_GB10X   =3D 0x1a,
> +       NOVA_DRM_ARCHITECTURE_BLACKWELL_GB20X   =3D 0x1b,
> +};
> +
> +/**
> + * enum drm_nova_chipid - opaque GPU chip identifier
> + *
> + * These values identify the chip a GPU is based on. They are otherwise
> + * opaque: userspace must not assume the values carry any particular mea=
ning
> + * or encoding, only that they may be compared against this enum.
> + */
> +enum drm_nova_chipid {
> +       /* Turing */
> +       NOVA_DRM_CHIPID_TU102                   =3D 0x162,
> +       NOVA_DRM_CHIPID_TU104                   =3D 0x164,
> +       NOVA_DRM_CHIPID_TU106                   =3D 0x166,
> +       NOVA_DRM_CHIPID_TU117                   =3D 0x167,
> +       NOVA_DRM_CHIPID_TU116                   =3D 0x168,
> +       /* Ampere */
> +       NOVA_DRM_CHIPID_GA100                   =3D 0x170,
> +       NOVA_DRM_CHIPID_GA102                   =3D 0x172,
> +       NOVA_DRM_CHIPID_GA103                   =3D 0x173,
> +       NOVA_DRM_CHIPID_GA104                   =3D 0x174,
> +       NOVA_DRM_CHIPID_GA106                   =3D 0x176,
> +       NOVA_DRM_CHIPID_GA107                   =3D 0x177,
> +       /* Hopper */
> +       NOVA_DRM_CHIPID_GH100                   =3D 0x180,
> +       /* Ada */
> +       NOVA_DRM_CHIPID_AD102                   =3D 0x192,
> +       NOVA_DRM_CHIPID_AD103                   =3D 0x193,
> +       NOVA_DRM_CHIPID_AD104                   =3D 0x194,
> +       NOVA_DRM_CHIPID_AD106                   =3D 0x196,
> +       NOVA_DRM_CHIPID_AD107                   =3D 0x197,
> +       /* Blackwell GB10x */
> +       NOVA_DRM_CHIPID_GB100                   =3D 0x1a0,
> +       NOVA_DRM_CHIPID_GB102                   =3D 0x1a2,
> +       /* Blackwell GB20x */
> +       NOVA_DRM_CHIPID_GB202                   =3D 0x1b2,
> +       NOVA_DRM_CHIPID_GB203                   =3D 0x1b3,
> +       NOVA_DRM_CHIPID_GB205                   =3D 0x1b5,
> +       NOVA_DRM_CHIPID_GB206                   =3D 0x1b6,
> +       NOVA_DRM_CHIPID_GB207                   =3D 0x1b7,
> +};
> +
> +/**
> + * struct drm_nova_gem_create - create a new DRM GEM object
> + */
> +struct drm_nova_gem_create {
> +       /**
> +        * @handle: The handle of the new DRM GEM object.
> +        */
> +       __u32 handle;
> +
> +       /**
> +        * @pad: 32 bit padding, should be 0.
> +        */
> +       __u32 pad;
> +
> +       /**
> +        * @size: The size of the new DRM GEM object.
> +        */
> +       __u64 size;
> +};
> +
> +/**
> + * struct drm_nova_gem_info - query DRM GEM object metadata
> + */
> +struct drm_nova_gem_info {
> +       /**
> +        * @handle: The handle of the DRM GEM object to query.
> +        */
> +       __u32 handle;
> +
> +       /**
> +        * @pad: 32 bit padding, should be 0.
> +        */
> +       __u32 pad;
> +
> +       /**
> +        * @size: The size of the DRM GEM object.
> +        */
> +       __u64 size;
> +};
> +
> +/**
> + * struct drm_nova_info - query device information
> + */
> +struct drm_nova_info {
> +       /**
> +        * @id: The identifier of the information to query.
> +        */
> +       __u32 id;
> +
> +       /**
> +        * @size: The amount of space allocated by userspace at @data. Th=
e kernel
> +        * will return the number of bytes it wrote, or the size of the q=
ueried
> +        * information structure if @data is NULL.
> +        */
> +       __u32 size;
> +
> +       /**
> +        * @data: Pointer to the userspace buffer into which the queried
> +        * information will be written. May be NULL, in which case nothin=
g is
> +        * written and @size is set to the size of the information struct=
ure so
> +        * userspace can allocate a suitably sized buffer.
> +        */
> +       __u64 data;
> +};
> +
> +/**
> + * DRM_NOVA_INFO_GPU
> + *
> + * Query GPU information. The result is returned in a
> + * &struct drm_nova_info_gpu.
> + */
> +#define DRM_NOVA_INFO_GPU              0x00
> +
> +/**
> + * struct drm_nova_info_gpu - GPU information
> + */
> +struct drm_nova_info_gpu {
> +       /**
> +        * @architecture: GPU architecture identifier.
> +        *
> +        * See &enum drm_nova_architecture for currently known architectu=
res.
> +        */
> +       __u32 architecture;
> +
> +       /**
> +        * @chipid: Opaque GPU chip identifier.
> +        *
> +        * See &enum drm_nova_chipid for currently known chips.
> +        */
> +       __u32 chipid;
> +
> +       /**
> +        * @vram_size: Amount of usable FB, excluding GSP carveouts and p=
rotected
> +        * regions.
> +        */
> +       __u64 vram_size;
> +
> +       /**
> +        * @vram_bar_size: Size of the PCI BAR aperture used to access VR=
AM, in bytes.
> +        */
> +       __u64 vram_bar_size;
> +
> +       /**
> +        * @gpu_name: NUL-terminated full GPU name.
> +        */
> +       __u8 gpu_name[64];
> +
> +       /**
> +        * @gpu_short_name: NUL-terminated short GPU name.
> +        */
> +       __u8 gpu_short_name[64];
> +
> +       /**
> +        * @gpu_gid: 16-byte SHA-1 GPU identifier supplied by GSP-RM.
> +        */
> +       __u8 gpu_gid[16];
> +};
> +
> +#define DRM_NOVA_INFO                  0x00
> +#define DRM_NOVA_GEM_CREATE            0x01
> +#define DRM_NOVA_GEM_INFO              0x02
> +
> +/* Note: this is an enum so that it can be resolved by Rust bindgen. */
> +enum {
> +       DRM_IOCTL_NOVA_INFO             =3D DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOVA_INFO,
> +                                                  struct drm_nova_info),
> +       DRM_IOCTL_NOVA_GEM_CREATE       =3D DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOVA_GEM_CREATE,
> +                                                  struct drm_nova_gem_cr=
eate),
> +       DRM_IOCTL_NOVA_GEM_INFO         =3D DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOVA_GEM_INFO,
> +                                                  struct drm_nova_gem_in=
fo),
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* __NOVA_DRM_UNSTABLE_H__ */
> diff --git a/include/uapi/drm/nova_drm.h b/include/uapi/drm/nova_drm.h
> index d7017ed17143..ad362301e3b1 100644
> --- a/include/uapi/drm/nova_drm.h
> +++ b/include/uapi/drm/nova_drm.h
> @@ -3,207 +3,9 @@
>  #ifndef __NOVA_DRM_H__
>  #define __NOVA_DRM_H__
>
> -#include "drm.h"
> -
> -/* DISCLAIMER: Do not use, this is not a stable uAPI.
> - *
> - * This uAPI serves only testing purposes as long as this driver is stil=
l in
> - * development. It is required to implement and test infrastructure whic=
h is
> - * upstreamed in the context of this driver. See also [1].
> - *
> - * [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/=
#u
> - */
> -
> -#if defined(__cplusplus)
> -extern "C" {
> -#endif
> -
> -/**
> - * enum drm_nova_architecture - GPU architecture identifier
> - */
> -enum drm_nova_architecture {
> -       NOVA_DRM_ARCHITECTURE_TURING            =3D 0x16,
> -       NOVA_DRM_ARCHITECTURE_AMPERE            =3D 0x17,
> -       NOVA_DRM_ARCHITECTURE_HOPPER            =3D 0x18,
> -       NOVA_DRM_ARCHITECTURE_ADA               =3D 0x19,
> -       NOVA_DRM_ARCHITECTURE_BLACKWELL_GB10X   =3D 0x1a,
> -       NOVA_DRM_ARCHITECTURE_BLACKWELL_GB20X   =3D 0x1b,
> -};
> -
> -/**
> - * enum drm_nova_chipid - opaque GPU chip identifier
> - *
> - * These values identify the chip a GPU is based on. They are otherwise
> - * opaque: userspace must not assume the values carry any particular mea=
ning
> - * or encoding, only that they may be compared against this enum.
> - */
> -enum drm_nova_chipid {
> -       /* Turing */
> -       NOVA_DRM_CHIPID_TU102                   =3D 0x162,
> -       NOVA_DRM_CHIPID_TU104                   =3D 0x164,
> -       NOVA_DRM_CHIPID_TU106                   =3D 0x166,
> -       NOVA_DRM_CHIPID_TU117                   =3D 0x167,
> -       NOVA_DRM_CHIPID_TU116                   =3D 0x168,
> -       /* Ampere */
> -       NOVA_DRM_CHIPID_GA100                   =3D 0x170,
> -       NOVA_DRM_CHIPID_GA102                   =3D 0x172,
> -       NOVA_DRM_CHIPID_GA103                   =3D 0x173,
> -       NOVA_DRM_CHIPID_GA104                   =3D 0x174,
> -       NOVA_DRM_CHIPID_GA106                   =3D 0x176,
> -       NOVA_DRM_CHIPID_GA107                   =3D 0x177,
> -       /* Hopper */
> -       NOVA_DRM_CHIPID_GH100                   =3D 0x180,
> -       /* Ada */
> -       NOVA_DRM_CHIPID_AD102                   =3D 0x192,
> -       NOVA_DRM_CHIPID_AD103                   =3D 0x193,
> -       NOVA_DRM_CHIPID_AD104                   =3D 0x194,
> -       NOVA_DRM_CHIPID_AD106                   =3D 0x196,
> -       NOVA_DRM_CHIPID_AD107                   =3D 0x197,
> -       /* Blackwell GB10x */
> -       NOVA_DRM_CHIPID_GB100                   =3D 0x1a0,
> -       NOVA_DRM_CHIPID_GB102                   =3D 0x1a2,
> -       /* Blackwell GB20x */
> -       NOVA_DRM_CHIPID_GB202                   =3D 0x1b2,
> -       NOVA_DRM_CHIPID_GB203                   =3D 0x1b3,
> -       NOVA_DRM_CHIPID_GB205                   =3D 0x1b5,
> -       NOVA_DRM_CHIPID_GB206                   =3D 0x1b6,
> -       NOVA_DRM_CHIPID_GB207                   =3D 0x1b7,
> -};
> -
> -/**
> - * struct drm_nova_gem_create - create a new DRM GEM object
> - */
> -struct drm_nova_gem_create {
> -       /**
> -        * @handle: The handle of the new DRM GEM object.
> -        */
> -       __u32 handle;
> -
> -       /**
> -        * @pad: 32 bit padding, should be 0.
> -        */
> -       __u32 pad;
> -
> -       /**
> -        * @size: The size of the new DRM GEM object.
> -        */
> -       __u64 size;
> -};
> -
> -/**
> - * struct drm_nova_gem_info - query DRM GEM object metadata
> - */
> -struct drm_nova_gem_info {
> -       /**
> -        * @handle: The handle of the DRM GEM object to query.
> -        */
> -       __u32 handle;
> -
> -       /**
> -        * @pad: 32 bit padding, should be 0.
> -        */
> -       __u32 pad;
> -
> -       /**
> -        * @size: The size of the DRM GEM obejct.
> -        */
> -       __u64 size;
> -};
> -
> -/**
> - * struct drm_nova_info - query device information
> +/*
> + * Stable Nova uAPI. Interfaces should be moved here from
> + * drivers/gpu/drm/nova/nova_drm_unstable.h as they become stable.
>   */
> -struct drm_nova_info {
> -       /**
> -        * @id: The identifier of the information to query.
> -        */
> -       __u32 id;
> -
> -       /**
> -        * @size: The amount of space allocated by userspace at @data. Th=
e kernel
> -        * will return the number of bytes it wrote, or the size of the q=
ueried
> -        * information structure if @data is NULL.
> -        */
> -       __u32 size;
> -
> -       /**
> -        * @data: Pointer to the userspace buffer into which the queried
> -        * information will be written. May be NULL, in which case nothin=
g is
> -        * written and @size is set to the size of the information struct=
ure so
> -        * userspace can allocate a suitably sized buffer.
> -        */
> -       __u64 data;
> -};
> -
> -/**
> - * DRM_NOVA_INFO_GPU
> - *
> - * Query GPU information. The result is returned in a
> - * &struct drm_nova_info_gpu.
> - */
> -#define DRM_NOVA_INFO_GPU              0x00
> -
> -/**
> - * struct drm_nova_info_gpu - GPU information
> - */
> -struct drm_nova_info_gpu {
> -       /**
> -        * @architecture: GPU architecture identifier.
> -        *
> -        * See &enum drm_nova_architecture for currently known architectu=
res.
> -        */
> -       __u32 architecture;
> -
> -       /**
> -        * @chipid: Opaque GPU chip identifier.
> -        *
> -        * See &enum drm_nova_chipid for currently known chips.
> -        */
> -       __u32 chipid;
> -
> -       /**
> -        * @vram_size: Amount of usable FB, excluding GSP carveouts and p=
rotected
> -        * regions.
> -        */
> -       __u64 vram_size;
> -
> -       /**
> -        * @vram_bar_size: Size of the PCI BAR aperture used to access VR=
AM, in bytes.
> -        */
> -       __u64 vram_bar_size;
> -
> -       /**
> -        * @gpu_name: NUL-terminated full GPU name.
> -        */
> -       __u8 gpu_name[64];
> -
> -       /**
> -        * @gpu_short_name: NUL-terminated short GPU name.
> -        */
> -       __u8 gpu_short_name[64];
> -
> -       /**
> -        * @gpu_gid: 16-byte SHA-1 GPU identifier supplied by GSP-RM.
> -        */
> -       __u8 gpu_gid[16];
> -};
> -
> -#define DRM_NOVA_INFO                  0x00
> -#define DRM_NOVA_GEM_CREATE            0x01
> -#define DRM_NOVA_GEM_INFO              0x02
> -
> -/* Note: this is an enum so that it can be resolved by Rust bindgen. */
> -enum {
> -       DRM_IOCTL_NOVA_INFO             =3D DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOVA_INFO,
> -                                                  struct drm_nova_info),
> -       DRM_IOCTL_NOVA_GEM_CREATE       =3D DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOVA_GEM_CREATE,
> -                                                  struct drm_nova_gem_cr=
eate),
> -       DRM_IOCTL_NOVA_GEM_INFO         =3D DRM_IOWR(DRM_COMMAND_BASE + D=
RM_NOVA_GEM_INFO,
> -                                                  struct drm_nova_gem_in=
fo),
> -};
> -
> -#if defined(__cplusplus)
> -}
> -#endif
>
>  #endif /* __NOVA_DRM_H__ */
> diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
> index 489748ef642c..44fb6203c0ad 100644
> --- a/rust/uapi/uapi_helper.h
> +++ b/rust/uapi/uapi_helper.h
> @@ -6,6 +6,8 @@
>   * Sorted alphabetically.
>   */
>
> +#include "../../drivers/gpu/drm/nova/nova_drm_unstable.h"
> +
>  #include <uapi/drm/drm.h>
>  #include <uapi/drm/nova_drm.h>
>  #include <uapi/drm/panthor_drm.h>
> --
> 2.56.0
>
