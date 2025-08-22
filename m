Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5582FC029
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755867168; cv=none; b=S8XFQZTlGtgdDfHe4VNPrV1PiLj3p7qsdlhqFC3ooMjP4qmaxWbMW6WgdfJ8nq/2iuXeA5AiU13zqtAGpvb/1v8slwgmwoRaKkLR5K/BDgSDu844HSawFGsvxcKby872ylLax7FNMVSmE1dgTq0NdSVXjyqTzMbBMrcZtbFM9F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755867168; c=relaxed/simple;
	bh=wYwYIuP54yw3qHwhEcASvJX1kT5O33c4GcjtRzjHV6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msrd5L2fBSFR/bSITN0zsVAnpzQOM7A30nsJbqYf5im59NmVE7KiHeCAz61ux0b0gFTT4wcoIK2fknjbHHt8/ua5pjnm9vN0zeQqVoee1+u2wK9oj1bFoZei5M68wXk3tW8rpF0y4IwvrSc4Pq5B4hAf7ee0kicEfXk7i+qYQxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i9GkepGr; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i9GkepGr"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b05a49cso15845775e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755867164; x=1756471964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQxzrle3VKFwpadizhrA++PgP4oF1J7QwIr8TLUlKCQ=;
        b=i9GkepGrqHjaaw2hdpBjfyI2TowX4icWOOgTcF+9/EcqQ7kTDQbGoebftK/xW1AhJF
         WrRIcqVZofcbEBv86kzh2gSVl9/i6E/HtGAETcoEkJE/DPvKSrYJHWb16tpMrF0ax/vD
         SdGFrzyKffVQOsKxOVBb+WuUdor8Si8d2fe+Ijfb8W+PmWzlPChtlCOkGcVTPtWB9Rim
         ktw4nnIyUQCQTpKkmQNesu7Eq2Q7HtWuvoHo0mediBLUjMWvSVifk2pSbNbl1Tz7eTCU
         fii9xd3SFI7jvWRYH7cqCoDjMQ6zQK28R4XFDaZJAlZscxRnbQ3RHRYXtpPwDoRllY44
         ukIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755867164; x=1756471964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQxzrle3VKFwpadizhrA++PgP4oF1J7QwIr8TLUlKCQ=;
        b=CdkYGvNPxcmNjr7ZMEz4xcefptrsfilwxwcpxxWRZwy34sd0DhBBux4ihxFZrP3sjR
         jvJNsHIB4OaRXHWiiobd1NxQ99Kw+FaNWNiqz1oFv0VP2HgeCT6e3AAVRlO4/dmFBOUF
         25+mNCPWN8oZc5Ch+zQi4e5S76WQAVJQlJfASnOMFOjHymao3Rt0G/Yy7H5xTNxA+KmS
         5Jp9ebet60WhEIsejiAUVOH46InZr8D2k68V2QbyaIBh9JB8f69okFplantZtBa6OUjN
         Dl7bIQxVv6D7WeE2vzeC8H5F2+UCa6SORqQLZlnnH2zw3uKQbeYUeq1159JZc3E58ROi
         omjw==
X-Forwarded-Encrypted: i=1; AJvYcCXMwpnLN0tvJmgCCt0jIVTPd4PKftFZF9V38IL2npfsOzUV42txxzBbPWSyeHmdB76IfYO9hPU5/U9CKM3Bog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwROfK8UICXJN5y5KXFpN3xlVhyhYI7PBZua5biPEQja16pLAYf
	rIkJjnsGD+cjcKVG3cp4xsz5awEOjlQsWoWcL9oOecGkF2jFWH3P8M3+1jw+X2mhNpDETZwYiHH
	8QLlI3NIsNas5wze0hrHAHs/8gj8ioWCpUKnHtQCW
X-Gm-Gg: ASbGncuuAJbwzodb61Bw+K2GyjjGN7y+a41C76BOI2eiVfBaVsBIm9S8kyW0zxOarBl
	XUs9KPvHH7jVTKajTJ6qUf4QKiXHEgAt6QqPkC33pi2l/X0KgYW5uJioiAqYOa6Ypu0MWy/ggXa
	tMKMSJhfO1LVGMxzpdubvTmTAmpkwLVBaO7HNoqiqmAn6qmztIlVuuzQF3G0WStOUKKWOwOA0cj
	wmu6ZIWfs6HhSiPpYXKrvfwO859KzU+nXFISrYAnFIW9ba9g4kIPwLof1sBmXOUYkx+awFonQ==
X-Google-Smtp-Source: AGHT+IE7Y0lQvf5r/Ym72waDaFduU5pis90P/Y8BoW2WQ2ZgXRN4nLW4iRYkwU9mYPjzWGowKlbiftsAubogUD/WtkY=
X-Received: by 2002:a05:6000:230a:b0:3a4:f72a:b18a with SMTP id
 ffacd0b85a97d-3c5db6bb8d0mr2118466f8f.26.1755867164304; Fri, 22 Aug 2025
 05:52:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com> <20250822-nova_firmware-v1-1-ff5633679460@nvidia.com>
In-Reply-To: <20250822-nova_firmware-v1-1-ff5633679460@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 22 Aug 2025 14:52:32 +0200
X-Gm-Features: Ac12FXxHtvKHWX7r4WBjHUgk1Fpgkh30TWxJenE5FBjdNdkXpbTtw7CFj3EHlec
Message-ID: <CAH5fLgiXYj0f0UEPCTjDgykjX3mFo4hf9SUswRYwHzh6Vznwtg@mail.gmail.com>
Subject: Re: [PATCH 1/5] rust: transmute: add `from_bytes_copy` method to
 `FromBytes` trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 2:47=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> `FromBytes::from_bytes` comes with a few practical limitations:
>
> - It requires the bytes slice to have the same alignment as the returned
>   type, which might not be guaranteed in the case of a byte stream,
> - It returns a reference, requiring the returned type to implement
>   `Clone` if one wants to keep the value for longer than the lifetime of
>   the slice.
>
> To overcome these when needed, add a `from_bytes_copy` with a default
> implementation in the trait. `from_bytes_copy` returns an owned value
> that is populated using an unaligned read, removing the lifetime
> constraint and making it usable even on non-aligned byte slices.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
