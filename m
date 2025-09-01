Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B22FB630
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Sep 2025 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756715669; cv=none; b=Z6EE3Pk7K8t2DG9s5advXoOuHHWuxojyb3ToaZK46WAwtacBVZK/pLPGGH4iRamMDLXN+H3xZfZZbHwmkZEXLDPXh3tlCriMWUVgXbxUqMpF5CIV/8EdUvAnWFuJWVDXi+W1OldWXChe65f0H3qc7vt4IyWj0+rkIrTyWb0m/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756715669; c=relaxed/simple;
	bh=vxf3frNnb2xUAvh4qiTlt/x1zHJJCkVQHi/Jb4XzkLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVRBSeL0hw5VYlyOW4cguD1vaYFW2w13C0ZjvzqGi25CEh/EPNmVQp9SSvhLZS3UVrBC7WhdM7mU6ClCVqJQdGUiCmQKVRcPl+W+IZmwlxZfXZb3x7Bgy6TdjrA+zgJE0Lt+HcAZ03SSNVfqAyjHS6rJkYf6CCFm6tqdJ2zWLik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1MM2tS+T; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1MM2tS+T"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3d48b45f9deso714855f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Sep 2025 01:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756715666; x=1757320466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJq1AsV0F4VVQPu0qkVK0I8t0NKOlj0yZgOhHKRTknE=;
        b=1MM2tS+Tl9lcIqjdUjaD/UMGFkL1wZRQSdH8k8psKyGvLLN0t3PcFCgr25htJKyGkx
         dkFmiGSzERO+Qpkv6lgSS0ChGJxo2GIM36CPaDmUEYDTCqtyy64Dbr182BDOr9ucIKus
         DAuYIdW7ht69ESIm3kI+NLwubmGbLBhOssEvARK5jId3mPyhPD++8OL96AL5OnYZW+ww
         W/gPKUXfL4fLn6lReGh0ZCrf0KiUD6HplKe03/GNNc+faiNzF5JHGVl/9EKRPr0M6pG2
         0fCKnP2by7rFpkvuwjVyew+3FyMikD6iAgUinORy40IlHB+CFDtOJKhvobxCjWU2Qlb0
         DxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715666; x=1757320466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJq1AsV0F4VVQPu0qkVK0I8t0NKOlj0yZgOhHKRTknE=;
        b=T+dPrHyy9hxIE4GvWW0KHscoIgGvSElprxrhI9Avh7sngQFp/3WPu+LTCJwTzQ7sAR
         LAmgbA/mToKvcVnDZs1nJS2gY5D1G4U3pFm907pxMK0GD6EWiyIW/Uv8xzjdkLiwuSw4
         Lw8ijLb7sFOvaFjECJquC/1cU1KYdyFsh18jEHT5aVK0Vp69SrptG/MEXe/iTytoiFrA
         yMtaK9XGXK6gALk7/hNX5l7Sjd1mlcE5keb/rZ5rTVAIyK/Lds4Lj6rVtK1IX+FGlKJM
         wpbfD5uieQdllX7CP/Uf+bEflZj7eoIIAzTpXTjtb+1+krUwYOloG+nZzk1MVO0E8Y5o
         8Arw==
X-Forwarded-Encrypted: i=1; AJvYcCWDHYaVlbhAcyJwOPUk1BNQ7/OF+XrRYzb4n9gqEMEE+IRiNgmjJKDTCssyMlEZa/6Sxrsh+SiNqkq3HMqT7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ+lu2073U0z37A3G3hzhuF+3Ty05wCdDvVCacOFXjEuImFzbA
	ttBEoAQ7GOnrt+dYZ9PBEU+/bXu3Ag0wLr/0tFlMsR0/Xi2jvCdcdIvKWq393QgceftxAGEnj4U
	iisn/JOBI1KNLT9EXPneH7MFGF2E9jefjU+7Q3Meg
X-Gm-Gg: ASbGnctefezjhFPptrTtvRn4BDhipmmNBu+gvyYHewVtqg2BIb6TW95lINSkp0CvJPX
	acmAixIOeYR1sDpvccp3wpxKcOidyxxKPzeV1vG10aXJmvPfVBIJoCJNZvwflmSslMDSd6Egmir
	9Yg/RZUG9PvZJ+8c5VpATfOwrifFOizXOOB9sw4v+10AP/9Y8GHPCqyl1gIRiJNxfA+bDnzs9zi
	kgS/aT+ZSNTJB+r8t9e//QSS9wEoJW+WkGBU1309h0fTqbwYbkVOJgaXw2iVEYh4soJORPgAJfA
	YlyMn+O6nIQ=
X-Google-Smtp-Source: AGHT+IEqychM0kd4Zsw2vuepz+apqlzQMNpjvyb9uiC43q/iOeK6qyzAvN4IB2lZ5WRji1lUoq2GIIj530u75dtTQ04=
X-Received: by 2002:a05:6000:2f87:b0:3d4:d572:b8e7 with SMTP id
 ffacd0b85a97d-3d4d5820341mr4043412f8f.13.1756715665708; Mon, 01 Sep 2025
 01:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822-rnull-up-v6-16-v6-0-ec65006e2f07@kernel.org> <20250822-rnull-up-v6-16-v6-6-ec65006e2f07@kernel.org>
In-Reply-To: <20250822-rnull-up-v6-16-v6-6-ec65006e2f07@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 1 Sep 2025 10:34:12 +0200
X-Gm-Features: Ac12FXxdTlByQ2-9hQCbGi5H1XEmMHIWRiWw8FW5DNBM2QeOGAEX-3c-DXqMpN8
Message-ID: <CAH5fLgiHVoOSMDwnXDZ5tH58iTPre_BAu0AE5=0a0_P6B4j_Kg@mail.gmail.com>
Subject: Re: [PATCH v6 06/18] rust: str: add `bytes_to_bool` helper function
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, Breno Leitao <leitao@debian.org>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 2:15=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Add a convenience function to convert byte slices to boolean values by
> wrapping them in a null-terminated C string and delegating to the
> existing `kstrtobool` function. Only considers the first two bytes of
> the input slice, following the kernel's boolean parsing semantics.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

One nit below, but generally looks good.
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +/// # Safety
> +///
> +/// - `string` must point to a null terminated string that is valid for =
read.
> +unsafe fn kstrtobool_raw(string: *const u8) -> Result<bool> {
> +    let mut result: bool =3D false;
> +
> +    // SAFETY:
> +    // - By function safety requirement, `string` is a valid null-termin=
ated string.
> +    // - `result` is a valid `bool` that we own.
> +    let ret =3D unsafe { bindings::kstrtobool(string, &mut result) };
> +
> +    kernel::error::to_result(ret).map(|()| result)

I think this is easier to read as:

to_result(unsafe { bindings::kstrtobool(string, &mut result) })?;
Ok(result)

Alice
