Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6843C4B83
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774533; cv=pass; b=sq5hFa/wohUe575bN3wEg60LUOwnFCBcoDN3Gh5WiYeLeKOZTLob4S2I1ISOXgnFMx+yDGff8sKrG59aya7fOySMomgSapEP18AQg3lGv6dhe1NFQCsLQB4d+dD8Jfqi9ZKtpWGueOz+AaO8KNnEQnnDcnpdMy0mPw2Dqr8ca14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774533; c=relaxed/simple;
	bh=Sl+rcNFS4n6sfV7RASsazrAsQq0F5cbeZGTcafT17Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsH3Z8Xp9JD3Imvkn86/ki66j5bg7pqiY79wLAd2gVvlQcpbV6GHmRHV2BmsO0JlUrsJkUn/WnWYL4QVoIzlr1ZOWmbkQ7mXWDRtQCpsHAFwwifIYvVPSWdeqE+6vT2mBDdKxZmrY9E5uiYUamyX/8E6SJQOHJdiWqgGgSfEqu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfM/kmN/; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfM/kmN/"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38115bbb83dso154671a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 05:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783774532; cv=none;
        d=google.com; s=arc-20260327;
        b=i1gtq83Fig6AKYGtQKnEASUekuUF6uOH0XkA9S9yzyceUhuLyd1PTK/PgXx/6Y0dll
         a//OyR0VQzg/7IiCHwBzI1Wz1kvQp583ochqbtUtSfm4OFbhzxQqmofJBs4gER/dXTdE
         limSfypv1cuIApFeqIAXZxGKuIf9Torf+7uva19FmuLBRlRmnBkVL+kAE9Bo8nFQOFDB
         VKHMZ0H4rLVaaStu5kq6kZk38jCInWh7HGN+zkvJmG1DUiW00bAOC4MDI2owZzKwPzT9
         dmIwb33JT7GX47uZH0ILJ/qoD9D3TGntM/VD6pn3I0OPpNHVo/3uxoKyF9izoLGaM6jE
         IHFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1zUvgb/Vijkk139Zbj5Mh0/O0qV2LR06s+/nZ2EMR/8=;
        fh=JHoqrz2qMdFCwhFB9V7KjvdhxeRPNHZ3681R++3oGqY=;
        b=bM8bo4/xd3hzZLst4Ii2t/nSDiZ+Kbb3+froa6up1QgvoLB/Rdm8j0LAyTDZ6O4rPB
         kU6GbshAHX8OyzRspvgXOhjFzhwc6zrgXgq6WAjkLLiXHG0Zyu7kvz2F0kFu7qbzgZA5
         YTkB7bPvsxDIxaj1Q+piVW0DVGbBbFFx06Rix5t3i/Uocs225sXLrWLjvmays3OIoPqZ
         RTrk/KNpSdUmZX1d7ehvDpBULAagzFAMR5sqhg2vbZO1H4mXlKgRbdt5nhkroJ+YSXm6
         84zPmllxoUcWxvAHSZeDQKaIedsibtRsMZIvrrM8rIY1+4PCmAe7zhWasAzIgaqjRXyE
         PG7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783774532; x=1784379332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zUvgb/Vijkk139Zbj5Mh0/O0qV2LR06s+/nZ2EMR/8=;
        b=FfM/kmN/tO2vNXlVEHoYYU4Gng3x9pt3bFUHeB17lQNTYT1U7ODfEBW9B6LtFleKVP
         i3NLMWRmDSpf57VeosLE4ZmuaEXgWlH1kAUgg5tbB/WynOpkGfXDLIeEck+RjYlXuNu/
         EXgFjtxaV/jI2ocYua3lwDDL9wR5K7nAGbVLIeZtv3BWy/ABg234I2cX+T7e+O3rnN3v
         2aCo2GB3J+YdiYlnCnv2wA1jqNH/+IwrerF8N72wSXv/cT3G+y/AlYDNO/CCayiLz5ue
         djvgoWIg1BckyiY2RsCczktQUUbvGHYqjr0H1jftRXzswFo15Fw7bVafkSLU2CFq081g
         w5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783774532; x=1784379332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zUvgb/Vijkk139Zbj5Mh0/O0qV2LR06s+/nZ2EMR/8=;
        b=U0FupuS4qV8WDkk2LZMsS92/0uYpTyfWzY87dC1FRLqpaNwddra6ij5DBz8tuxURqt
         nUDEq5j842JE26SYBiS7pLBiViNTu9gts1CJUFH6fvK0H1D9x/A/vYL8lib6qa8sA01K
         +vxresjQvZCw0Is57mlDWFvpPae8nzRNVEXid9I0GW7I+Ql52nbx0NpEiw1g/B8ynUSx
         yfy7k3jFL8wFkol7VUWcspGUgMreE2n5zaJ0B21gbGDx1H9LakfZRm0o/kNl5pqnNV+3
         a1TxSXIUS12bAXml1s/GI5HlWd/475tZaL6x2nR+HHbNZRk4biXGpNCtxWiW9jZ9LoLW
         OWhw==
X-Forwarded-Encrypted: i=1; AHgh+RoUvnFPNRCa/lx/NHHlMND+mOYzj3R24PBQWzSs/UiVB15P2shaQ2wKlVpdP62JcPNFUnpy6XKbjG4e7Y7PXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsXv4zWsNP+AEsNXIfsjnbVlBneGKPZ8YvwD0Up0A0z8q5hiVu
	BZZUVopkLnExxhwFPtg6YRBx3hD86wWeE6vzLYtvFZnadEmIICO/Ykw8OOOx6PXuWAzoet6d7Zv
	F8yICVC07GnhVrcBzvnfBn5Qbq3DWHyg=
X-Gm-Gg: AfdE7cliS4T7U4akiO3W78cNRX3FToq2Zv5/pTJee/fOJWLDS65ngILMQ+DHYOejSB+
	wMI5yQ5egTimr3sufxQC6y1g/rRfwulvCEfBP1kfzU+o1ekgIxptumpDKt+5zgiw9lYU6Ln72l9
	CdKs2XrCZyYSgYHTzxWGBa3x/wVO4RdR/3ey9uD59aeirrwOMmSlp5Q2j3XgRCf5yACbxqbGZqq
	kL6lwWKS6yl3ysfJHmDxauvXRLENGPe/3yklaxrlaOkOAT3N3ZNxvzVwcKoZfY4/r0NrVpxJBT2
	BRdHa3Q1R5I+HT9SdE4uVvZpItzU2vzgnVBuNiY8f6V5n82dFzQS+ZlYI/wcP69m+dZlj3YFYqA
	RVzLXiW2tmFBq
X-Received: by 2002:a17:90b:3e48:b0:380:7688:fc06 with SMTP id
 98e67ed59e1d1-38dc7849860mr2139954a91.8.1783774532077; Sat, 11 Jul 2026
 05:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-dma-shared-buffer-config-v1-1-8c1571000855@kernel.org>
In-Reply-To: <20260708-dma-shared-buffer-config-v1-1-8c1571000855@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 11 Jul 2026 14:55:19 +0200
X-Gm-Features: AUfX_mxzrtwl0-qM1WcyDgdPW3fSN_iew-N8VZzUs1Dmg7dy-KYQxeN-HmNLFeM
Message-ID: <CANiq72m9t0y3pfZUw_KbJSjujjQcM=FHxTCLenPoC_-v2udibw@mail.gmail.com>
Subject: Re: [PATCH] rust: helpers: guard dma_resv helpers with CONFIG_DMA_SHARED_BUFFER
To: Andreas Hindborg <a.hindborg@kernel.org>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Asahi Lina <lina+kernel@asahilina.net>, David Airlie <airlied@gmail.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 1:53=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Commit 9b836641d3bf ("rust: helpers: Add bindings/wrappers for
> dma_resv_lock") added rust_helper_dma_resv_lock() and
> rust_helper_dma_resv_unlock() unconditionally. However, the dma-resv
> functionality is only available when CONFIG_DMA_SHARED_BUFFER is
> enabled, resulting in the following link error when it is not:
>
>       LD      .tmp_vmlinux1
>     ld.lld: error: undefined symbol: dma_resv_reset_max_fences
>     >>> referenced by dma-resv.h:463
>     >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock=
) in archive vmlinux.a
>
> The dma_resv_unlock() inline in <linux/dma-resv.h> calls
> dma_resv_reset_max_fences(), which is only compiled into
> drivers/dma-buf/dma-resv.c when CONFIG_DMA_SHARED_BUFFER is set. With
> the option disabled the symbol is never defined, so the helper fails
> to link.
>
> Fix this by guarding the helper definitions with `#ifdef
> CONFIG_DMA_SHARED_BUFFER`.
>
> The only user of this helper is the DRM shmem abstractions, which already
> depend on `CONFIG_DMA_SHARED_BUFFER`.
>
> Cc: stable@vger.kernel.org
> Fixes: 9b836641d3bf ("rust: helpers: Add bindings/wrappers for dma_resv_l=
ock")
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Please see:

  https://lore.kernel.org/rust-for-linux/20260708082454.1254320-3-mkchauras=
@gmail.com/

Cheers,
Miguel
