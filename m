Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505D5382397
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 08:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142507; cv=pass; b=DpuC8SPU6xAUWoVsTX03UEo9rgBBVn2Cq8MkYbs74DM2nYd+CWfXdV1pZoCm+TtixgXwjwgFUVT/Q8ND6i7clo7pKVGeyTy3G+lM+mvaH+NMtiV38diXRkgo4pqPz1/6c3zSHPlGhGVInLkECJXPLDfnuMYFfMyYMs/Yj8AyQjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142507; c=relaxed/simple;
	bh=+Rlew96MW33vEuHa2s2u6zkGjfL8lJ/5SiWMjy0D22Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0X9u8N6t8oKg4N41U2T4yL6iP2W0+HnhJiaNubK1VrLMF/Qn1GQb/A7G1TpmKJpSYP88U2RP8eft1i+A8JCflvbbovSP+oDlsTG1I/Fwkty2BohNuz5RIN94tENOM/WAq2KgMo9nPTbRsMHchrebEiYVBgifWBP50iEcGzr3jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wNSnpjpE; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wNSnpjpE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so471684f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 01:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778142502; cv=none;
        d=google.com; s=arc-20240605;
        b=OcvlrlstSllIGRXVXYafT0bynRaDwKub69lUJnlaUJWfebOGE66hY6/5lIXOE8lKCO
         LTwUK+Tbmi4jmHuV3ivBjpVMsXFaa5amN4TsV6IMIcoHK9ViJ/v9tNR1MVrbT3RzFc4S
         XT1GfylITbeACXEwuD5y5pKr4NddtH8znNNJBXnSaDLhySbmOc68gc07unV3pNMLUvD5
         fxDzrBCzDF1ILPUiOUF2TOp7VJCWef4zh3dNU8CgaXWzFPlGS9dzJ646gY4oPFUg1VD/
         lagHR7Qw6wEOI4ZN1Hf5aGKxHdsZsrUxi4+qytMBVyFUnoroyhF8evZB7TDF84fo2mK3
         fJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OrM1357dsMNrMu+hd2Ti8ohmpi73tk3SEixYBQv37JQ=;
        fh=bVp6RtW8WRkc4WFzR26G2W7o51AtWp5g75Ur26NanGk=;
        b=Y+Jtrz2iI+uVQSDA1eC2gGM+5eICd45hYsIEsaKG1EniCTm+TFcQ1D6WwNRhB1wgsh
         1tZwtfH7UXW8XvVMcKbCei9RmYG9Dsi1yuXCFB262fX3lFggez0FglClWB6O2AQIq7En
         Sgl0ikax0EGUhEj97tB/t+kNYitSFcTXF5sVb6oJ43I0Kk3yqX0+HlM74Hd5RC8SBJZd
         saUIB7xLrhEUzGTLz3nqk3O11x30se3U0Pe9BSEUP4XJOf/mQ5Qry4obecVWNCidYm2M
         Y7uWdxcm1S1v9nORa/N1sNXt3oUGBGyYf8kKrjvXsa31lfAozIlKPxHdNbEBchnTeUVy
         351g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778142502; x=1778747302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrM1357dsMNrMu+hd2Ti8ohmpi73tk3SEixYBQv37JQ=;
        b=wNSnpjpETysd37hfhL67N2AKm8vm42SxekHnueIcbAMeoOnlGu/Wempl76B1xxmuDs
         nVcfrGZI1MytGgBn6YKLTsI6SSC+sJ+DCeXZ6b3f/HnxRWIiFmn+nl+SH4u9ZVNwoftw
         ZJltaWSZTgzUgF10Rkyt/5fiVCwUIjb41+8XiWVgVzbjB46b4B0Hk7bStswRTAuhLv7n
         4oPTVBDKCmFjYd5W/Q0HxClai1Z3wAScce46y0Iesaq4GXSIVwrhuKCJvvKrVEs5+bPQ
         ztmShVtMhsCtfkBPr56ow/ofLs6NF11p8duOcx+MmoApqybYWO/5y5VcuOfbixfXJndS
         MRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142502; x=1778747302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OrM1357dsMNrMu+hd2Ti8ohmpi73tk3SEixYBQv37JQ=;
        b=ImzsjnFkSOH35ecWr0yWebvB6UhDWPKjVT9WhZ1ORBkVuh7xijvRXOKUO84WUJBqEn
         6icUibfi4CmWpqINVlt0dY2RnJjaV1JAOKx7NtKLKqV7XPE7AxRh6etWASL8+HiVfg5U
         hhr8ktpdywgOp9stwt3B5plyf+V0Ay/PHibE0OUv+fSQFIeTCYWQSksXm4bhH7qZk9OG
         cEDEDc7ZadiTqb72/nURtFhIYoYHcYaH+xyBgNcFxIcAOwgGTHc1PfiPbsyRYIsFFgZe
         pljNqg/ULYeoV4DxIEx3FjZaa6tiEtPMYpSLdMH1nDNSygvi2PxnZEhOuMTl1kWbYyN3
         Aejw==
X-Forwarded-Encrypted: i=1; AFNElJ8+vsyR9CLx6ahPtykpU1CeMq0jQ+lzylg6hwKNYtN2ZVHK9M0lvO2PdtyHiyIzQIdNC3MVZYO75C1J5PcQLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6uTzjstnbY5BASZKbOIntdqtK29Uqjyb4rYDfkDOtD3RqKpFG
	+V9ZMnr3prJhyCU4bqVN7bBeCZrrudBUOrh9CjLnMZD63LSDKvuul8aXv9JGtJa/fKFGb8rYNHj
	Y8/CaRiQfYp+SviFQKi+cG/6kjf9gFasjXzYk9QOV
X-Gm-Gg: AeBDiesBs1Ry6fewQ/2zJTb+y8feyaEsulmlA4FGTz2aH9Z1ukwdpQeX6DSCsDNoH1m
	/QozcD2dFdaheeppJFUTs9B1DX9qnOMEqSWv0a9hJEl7hclXXbiwsBW5JCu75quRkW/b4xG6+VL
	sReE6+/kvJtAMkQV5d2aiXPgRPyPB1zXBZmO9kQrXAr/awgXIIEXK0KEakVPU4DglG1mfjr9yOX
	UcpY8nqeZptUcBNVI6D3NYe8nduyGgv2Ne6Am2SIuGjkFHcBrD4ZENlGGiem0+G2h5KcQ9uvKs5
	iGa9sIQPUDIo+hP3ZU/0RbVLYsx/t/vpov2vmvPmmsXrNvLIwfzOrEwl+gnXUxXB+XElm2KtmUL
	DhKMOX03tmnnaQA==
X-Received: by 2002:a05:6000:1acb:b0:44a:525b:2851 with SMTP id
 ffacd0b85a97d-4515b42e07bmr11837967f8f.10.1778142501522; Thu, 07 May 2026
 01:28:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-rust-virtio-v1-0-9563383909e4@pitsidianak.is> <20260505-rust-virtio-v1-2-9563383909e4@pitsidianak.is>
In-Reply-To: <20260505-rust-virtio-v1-2-9563383909e4@pitsidianak.is>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 7 May 2026 10:28:08 +0200
X-Gm-Features: AVHnY4JXn8H5cehqowudQQF9hOA-CPXO5Vy7y8WXmH3YzNXBrAofW1cKQmAA598
Message-ID: <CAH5fLgjFLBx3DDE7yGNSHmaW9w5GyzSOi4o=avGrMni1a0yS3A@mail.gmail.com>
Subject: Re: [PATCH RFC 2/6] rust/helpers: add virtio.c
To: Manos Pitsidianakis <manos@pitsidianak.is>
Cc: Miguel Ojeda <ojeda@kernel.org>, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	Peter Hilber <peter.hilber@oss.qualcomm.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 10:14=E2=80=AFAM Manos Pitsidianakis
<manos@pitsidianak.is> wrote:
>
> Some internal kernel virtio API functions are inline macros, so define
> their symbols in a helper file.
>
> Signed-off-by: Manos Pitsidianakis <manos@pitsidianak.is>
> ---
>  MAINTAINERS            |  6 ++++++
>  rust/helpers/helpers.c |  3 +++
>  rust/helpers/virtio.c  | 35 +++++++++++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1cc0e12fe1f004da89b1aa339116908f642e894..48c9c666d90b5a256ab6fae1f=
42508b789a0ce50 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27930,6 +27930,12 @@ F:     include/uapi/linux/virtio_*.h
>  F:     net/vmw_vsock/virtio*
>  F:     tools/virtio/
>
> +VIRTIO CORE API BINDINGS [RUST]
> +M:     Manos Pitsidianakis <manos@pitsidianak.is>
> +L:     virtualization@lists.linux.dev
> +S:     Maintained
> +F:     rust/helpers/virtio.c
> +
>  VIRTIO CRYPTO DRIVER
>  M:     Gonglei <arei.gonglei@huawei.com>
>  L:     virtualization@lists.linux.dev
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index a3c42e51f00a0990bea81ebce6e99bb397ce7533..84b54690d95be37699ef9a9c4=
d7cedec0bbae6d3 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -62,6 +62,9 @@
>  #include "uaccess.c"
>  #include "usb.c"
>  #include "vmalloc.c"
> +#if defined(CONFIG_VIRTIO)
> +#include "virtio.c"
> +#endif /* defined(CONFIG_VIRTIO) */

Please move this ifdef inside the file instead, to match all other
files with similar ifdefs.

Alice
