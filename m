Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8F916F288
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918946; cv=none; b=uBSOyJS4DcIVfpj2c+Vr72t7rXD3i9h15HRif6dNOztFPWAE52OdQq6/0uIDZ2mtYBpgZyUBch9dFXi9zn9fYkL8Z/wiIYoM5mRBuxJ3M7veqqhJBRtZkcIHx6yYejOFzF47RSd5Y7HMz6hZergZnJbtLNYhqtE9DiwFZUrfsTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918946; c=relaxed/simple;
	bh=j3cyaOuts4hKH8uax2B80RhLhKA4XEL4WLl9c3/znBY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=koa/vIy0/8pzcD54bD8fiQ9Zld2zc5qeX6doe8DXMVsCYnlIkz/uQM4nSX7lE5cTKINiZdBry0j95Z8PrzGOkMU1sQ6uJaLDNtgyVtA8clNvLwVHQbtPII9GyptnM2hDFHsexcMZeWGyViegZ71bymjzujBN5FGJ2Enol52PEmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iJL3g5hJ; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iJL3g5hJ"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8fa71b83a0so560976566b.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 23:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771918942; x=1772523742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frFYhvxWM9eIw5h2wgGi0BhhHCnVyyp+eDzoN2U5eXo=;
        b=iJL3g5hJFoyFLV78yXzdHqbI5Ya+A1H3z4djbEA56b1bY7othoof0eJChaIcdC0z29
         U+Im8GmchDgSbGSZY3UYpTrLUqBg/iaR/ZQBCL9j1GYqAknro3UOxTa6tLtJ/F/jcZkf
         edgXj8r2c//fgZU9OxQ+/squLO9K14loyxaUgj0u8l1Dsy5OaC9UxyNlv6GV2azF3pa9
         Hb4jqK/Y8nzsACO5CKTzd8zOMi7EmR/FXCVamfMyZVWfFb5icmKCaopowubLQHDRYpbU
         utfPXYDklrCGtvdnOoqQeBDGDboslmjOO9llttT+hrLkHJCGO4zwyQBttvneVdXvYuvK
         /DMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771918942; x=1772523742;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=frFYhvxWM9eIw5h2wgGi0BhhHCnVyyp+eDzoN2U5eXo=;
        b=q2MerfCysRyEJX7U87GTyGx/03UomcTZSwEWe9WVnXnibOMKoRTKP2ZXB1kIdznk0H
         6diSbsHhRhpB/mWUB765JxTqb02O92+xRzpuYkIdCpBOC8QglkpZAx+4dMLzrG36uN3a
         B7Q/zk6Kig1qiRiFbrntbNCqGHG1Y+xJToiSrXUxNO5l9P3SFitFFVA0m2YOPK/N/tCh
         U+8siJXnfCdw0Rdf1ma+c6JFhJZoCMmE7n8y/2dDseCvquhFbKQYdmmfg+Uq69mXfVdX
         3L+YNeZ4UOtldYkxT8gKLFwNZfmmRtEIT6D1YZ3UPvxuP17ljE0Og5eqt8/OTk7XB7Nz
         krzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdQcaQpwHJqh0vA4Skq+pKEmqbNWQMQ9dlPGGTXZuxOBqBVERqISlzoYAH4zcfPPvB4s5wcLurvHqwehLT5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwa351yaTCov1Jnz0wlp7dwT4PS+NrSe7ETilpxw+u/7gwHEQs
	Xfvov3KFx5b/z9emZdFD3PcDuM+HBesZWRUFaRImL1R18HwjaESbiI+/R+HUT20fesCclIfyh2h
	bfGet/J8mj9v9jLVEjQ==
X-Received: from ejrv26.prod.google.com ([2002:a17:906:565a:b0:b8e:a7a6:78a1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1c18:b0:b8f:6699:a036 with SMTP id a640c23a62f3a-b9081a2bfa6mr666119866b.19.1771918942287;
 Mon, 23 Feb 2026 23:42:22 -0800 (PST)
Date: Tue, 24 Feb 2026 07:42:21 +0000
In-Reply-To: <20260210183812.261142-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260210183812.261142-1-work@onurozkan.dev>
Message-ID: <aZ1WXYhM8meuCZkM@google.com>
Subject: Re: [PATCH v1] drm/tyr: gpu: fix GpuInfo::log model/version decoding
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: daniel.almeida@collabora.com, dakr@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 09:38:12PM +0300, Onur =C3=96zkan wrote:
> GpuInfo::log() was decoding GPU_ID like this:
>=20
>   major =3D (self.gpu_id >> 16) & 0xff;
>   minor =3D (self.gpu_id >> 8) & 0xff;
>   status =3D self.gpu_id & 0xff;
>=20
> That does not match the Mali GPU_ID layout and mixes unrelated
> fields. Due to that, model detection becomes `mali-unknown` on
> rk3588s which is wrong.
>=20
> We can already get all the version information with a single
> GpuId::from call (less code and cleaner), so this patch uses it.
>=20
> Also renamed `GpuModels` fields from `major/minor` to
> `arch_major/prod_major` to reflect their real meaning.
>=20
> This change was tested on Orange Pi 5 (rk3588s) board and the
> results are as follows:
>=20
> Before this change:
>=20
> $ dmesg | grep 'tyr'
> [   19.698338] tyr fb000000.gpu: mali-unknown id 0xa867 major 0x67 minor =
0x0 status 0x5
> [   19.699050] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0=
x301 MMU:0x2830 AS:0xff
> [   19.699817] tyr fb000000.gpu: shader_present=3D0x0000000000050005 l2_p=
resent=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [   19.702493] tyr fb000000.gpu: Tyr initialized correctly.
>=20
> After this change:
>=20
> $ dmesg | grep 'tyr'
> [   19.591692] tyr fb000000.gpu: mali-g610 id 0xa867 major 0x0 minor 0x0 =
status 0x5
> [   19.592374] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0=
x301 MMU:0x2830 AS:0xff
> [   19.593141] tyr fb000000.gpu: shader_present=3D0x0000000000050005 l2_p=
resent=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [   19.595831] tyr fb000000.gpu: Tyr initialized correctly.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Applied to drm-rust-next. Thanks!
