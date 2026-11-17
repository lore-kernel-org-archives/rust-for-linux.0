Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897629;
	b=NhHAzaZYihelJXwYG1ZWy4objgrm1wsrzhQC2gIUVOHEBFm6cds/mRtU8pOKYsObtvl0
	 PdNWkUsNa/fe2Cv79mdotUJbg9dT3TvpgOR7U9p5xrci9BSsRzjh+slIzZMNBga/kym+A
	 E2o7/e3t8MvK4XVq7Y+5XiHxHOI4aGat4TTXpwJpbuVaovYgfRq5JMJ7mQu1cv/qSP4Jy
	 BUx5BC1+OKUUXRWoEqVK1j/D5LWG0hrgWNlS1xWotGn1Gvfq/TS9fZaCBk1zojNye4h+u
	 FimR4Aerg0EhW+IQ99GJwzGFcgwBd51pnQCdvWknfipU+VYM60ukW7Cx2qv+00+oGlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v1qDtE1UkI1Z3ZIzAl9oangANFq3PebjU3wsoGmWws4=;
	b=lE9whOoU3bYwfQRD1IMV5hFtMr629QT/B5xxw4KLgNzNqDFX9x1IOLsINyMObcJnrXCk
	 wnUEEBQF50QEfXOtKlpyS4ylSNo7cVgPmDQOdNAMBOof0Qc+75aLQkKRt+SBIyHK8Dqn6
	 /YdCVzoiFTug2hwnzxxBSU0liB4XxwSIuGPLeHmkgQw1u9jXsqnMvXRewroJC8eUSGEas
	 mW9o8bjih8PhOCYGGaKsVk9e7/UM0XJ7Ap4iEGJJbio1HlUJjF42FCUHL1KevBm46a99o
	 mNrz08KJNe7VP4yMnajdtVAi+QFu0q6EaHamieuOAg/8hSFVtIOPN+jH0SLARWvomNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pIRFwOCY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D9D606A329
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 06:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80D9D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pIRFwOCY
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adfe7a31dfso5329401fa.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 22:40:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897627; cv=none;
        d=google.com; s=arc-20260327;
        b=j50fRhfgOvkNrD/8KemxBVDjL+Sed41e8U6+TuQvi4rDH2dh9gl5qrqF1lP6BvGiBI
         60O8V2OSYhN91K50aKNh/HZaV+VjZpd4/iq1dV2mexMb63HR+KuTcAYg6hVd4SGitqab
         ihwczQAOSWujsoCm5fGZszwX3Chbnxh2nRUvKV3Pi9Q2saCAqYL6dtltxGeWY0WgeunH
         PmjtAnceMWgnWC67v7XF8U3IN3JzqaiYVqKWO3wDaKsEErV2mffzh5nPZpjpLAszX1Jo
         KPMSd1Qko2nl9KJ5Dh0wj+LdgT2UK8noeHXP6oiZpVaQgC02P3k0JkL0XStAMlWgGcWe
         ZfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1qDtE1UkI1Z3ZIzAl9oangANFq3PebjU3wsoGmWws4=;
        fh=1bd73SW74JbTnHC3t2ldZNurfuqFQUuAvVfmssGDH4I=;
        b=EayIHkImlIqUzujJJcpKto0dcXw/4vwwYKsMn5ig41MH5QgaahNG0CDys6s6dkbUSS
         2iX5Oad+9Hvc1bRI6Q2s0lBwW5zo1GaFqS3cu0JHD5F2Ihde3R2Vh/swrY2+OZnp8tUS
         Q/jQaPfjJ/5WV2L4d/Ldlk/EazmZFJKGlK/e8YyD7GfTcOQKGJr7opJr6QdRTezx7i2B
         dUzVrzaYZs8A1f9uu/v+//Dvoyc2x8uAUFbkA7s1R1JIwk9JA2jF+8SkdvHEFoLVhbVl
         3yADgNx6A2qB0cwwcreZFIH2qc4USQVLylktlmup8lF2RE04mC9S2ZIwJnUzYwGV5sIc
         Jscg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897627; x=1795502427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1qDtE1UkI1Z3ZIzAl9oangANFq3PebjU3wsoGmWws4=;
        b=pIRFwOCYQRg6aJGJnOiyKnNG9c6YYSN6o85ZYYxXAIBG+nkneS57BTLS0ZMhGdx7gt
         73Pq8Jq1zMZq4BGnCGApMta46cRhvKL6hZ7GMCFL1ffulVvZGT6ZBw6pIE5aUhsdRlZL
         OEcXNdqV+A8SKlHD7NA+p4PqnharGSeqxPddVFJsiemwD+c01kHRki8Io/3Nujn4rPIk
         3N+tSkGGsatVDuNCgallXLT0T4kowy0ldDFrPVxbONr+LrPuZuo1p4IAubjb7JrpzLEc
         rlUWAI+7x0KhGGY6xxKjbvUTHCyYVjJST58F877wciel9dPplKwDTy85ZzsuvJJlA4y2
         61Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897627; x=1795502427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1qDtE1UkI1Z3ZIzAl9oangANFq3PebjU3wsoGmWws4=;
        b=fEpYtsI/B8rzkT/Yf6pjUMPElHwjzBcE+8GzMgVIq3WeKeEV9SgvZ87h8Pb+1kETeA
         Z9bLyQK8O+IzPzX9sHKeb8KbHiGWoBuus3Sjc50zZ0aEwdW682gwrtaaDgh6tpcycRmw
         FwSEboblIIONot94VKlq623s6RYdtlVDnZ4PpcaGAhA7C9V2Eq6Y9dJM4mic6TDLxFEN
         p1oK84W8unzzUSweLluVOa+ZBRXEWfEV5ZFO33523Kk+sm0fs5gCdzciX+NeA2Ry0sg7
         I0Xmh56Q17CJclbn7uJG3VcpvzUbJ49dnymQ/gBU47LUpGrEFM438FDcYu3wi2YQE+Yj
         7lOA==
X-Forwarded-Encrypted: i=1; AL+hErEhGC6+88befQkAXFAtDsSg0qBr6Kcit2puVVLQ1TWmiT0iATb4OqxNtNIz7OZh9+A5mbDhzhLtVv2dRRz6HA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8YtBnxG6ZBOVkFybM7zeCB8u6feAa1XXGoA6mLmUJ6e5EIso2L
	pXB9/hljxwXCyWJKdJvRI6e4FFjVIcJcDQJr5rSiIY3Sen3mC5/FXYUefSHZvrZmsbcBkVIcFhQ
	K8EbbB1hpNFSeWWvuCUmvw17ZwWTU1G8=
X-Gm-Gg: AYBFou0cJu0Ldu3fMvVz2uZQuCt7kPAm6j4z9k+oViapK4JISqRxJ0zKypZO/oGhxgX
	AkdKyyXH3y2y+cfFrHYn1SmMkBuTTfY9WgQJsZKIT0PzGNLFChVED3+j4LEvRDpk7KDbQKyCcwY
	AvG2d7mkHqz42AZWnsY9+YC4Hu2eX7ZLr623odpGqGHAyrWfo+XJ+Z/89YVm/bAXYx826zK7s8w
	x2CuJbEFRHzml7sE++XngNw1IZyzHcKkydoSYlvxEwWEbtxovGir5Az0+lPJJWiPbG+8A9eU/z4
	SdWSugTwLFhKyy3tw2vfWrLtA178ooYhhK9AN+PvGshxXOuGgUtU9cUcTJhPd8ieEiLDHsgCSLC
	7AfsGXve90nD4f6IpoD/TTMcI8VoVP2NvQgWP9vf9CbZbIcoAljAcg+0FLN6XfIUfy1xnwLbkR1
	qng+1YpN6pZ+hvrFoePleS+H3HHyzTt/uLkx9rdY+orwHGV4hVl1qKURpQY8hYd63vSwEVzXha7
	bgtYDr6+F35E1wOSUpFJJhMv6LTCjUPSdfRjzVOypaEO5EDJq9V3aKGM4UppYhXQxTR2pZKZg==
X-Received: by 2002:a05:6512:3d0f:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c170771fabmr5745484e87.2.1794897627214; Mon, 16 Nov 2026
 22:40:27 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CANiq72mnB8cMmaMWaC-7pJj29JqqumBOSygnM9zA+8eHikm1Kg@mail.gmail.com>
 <20261114132156.49243-1-marawanzein222@gmail.com>
In-Reply-To: <20261114132156.49243-1-marawanzein222@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Nov 2026 07:40:14 +0100
X-Gm-Features: Aa3M54oHxETgvJbOaBj3UfHn1YJEXV_kuITRJF35qSCPKbs92-uDgz2TS-kt2rE
Message-ID: <CANiq72knPfBVzEA3kiHOWXuDo0QAUh0mWQnWR6og0hqYwK2PNQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kernel: fix lifetime of copy_from_iter_raw
To: Marwan Mohamed Zein <marawanzein222@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamir@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, spidermana <xuyiwen14@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:22=E2=80=AFPM Marwan Mohamed Zein
<marawanzein222@gmail.com> wrote:
>
> The returned slice is derived from `out`, but lifetime elision
> ties it to `self` because this is a method. Explicitly bind the
> return lifetime to `out` so the returned slice cannot outlive
> its backing buffer.
>
> Fixes: 06cb58b310ea ("rust: iov: add iov_iter abstractions for ITER_SOURC=
E")
> Cc: stable@vger.kernel.org
> Reported-by: spidermana <xuyiwen14@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1265
> Signed-off-by: Marwan Mohamed Zein <marawanzein222@gmail.com>

Applied to `rust-fixes` -- tags still welcome for a day or so!

[ Reworded title. - Miguel ]

Cheers,
Miguel
