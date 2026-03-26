Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDFD3F7E8F
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549090; cv=pass; b=mogAXgJs7QQr9NBu/kXceeevl0kPclU9AIQjpd5FUXl/M4hnRlpwRkjzp4nWgdwRdoUh7kiRsyGsxlyPPSkYxd8f2tg4jpcsxL76XJbMOFDcfqnc0owkDFQFfW/vwekS2uNIEqgDS1c2Y1k0YzmCANI9Chin1QLxG7NgOInfB3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549090; c=relaxed/simple;
	bh=B7sccmkGDehtyJvcq1YZcs4by1igPiabHUGseQHtgqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvysTRfnk1PBmgc/oKxkH4lSvtgyOjsmwMsAYSp3S2CX/D+n0vFy83k6eGjLVZdblKlpYAbaTlXQH9tgP/1LpvoeqNWAEDC47mFktAKrzjPsP60NI6yLYv7K2U0nwPhX6z/9PLVF1ziQxJ+5CIHpk6ojWLFhcktvQMoDK+KdCoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIs07yxa; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIs07yxa"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12711867ca1so87982c88.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 11:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774549083; cv=none;
        d=google.com; s=arc-20240605;
        b=GgBOOmneZf7rbKzCFMZtpOG2uaTb2ISbHxhEn2YdAKAhM0y6Wga61DhKf1X/nDFSEw
         MRIrxSG6n46g/Eh/N732sUOBe1yKR6UeRz98LgJexfaaEurXsq1ThKGDqFPvOdPpGIQU
         YYnDXx6fr1hqTSEyxNgOcKyGQFK38pbGDzwPFXeY1Can2fVvSFgfQiHJnKlJ4CfPUZZL
         X8pGKI/Knv3ZpkcPGJEoEOijMP3zfUGPwkG0gj3mHAEOdqB/aIZZ6EAMtoGMUoRPfWmg
         UvO6QZdHOXCB3G3O3G5PRgEd8I0J7W6D1VHBWmW+1ID0vTN4D/F+O03Co5UpcSsiGWVv
         xdPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B7sccmkGDehtyJvcq1YZcs4by1igPiabHUGseQHtgqo=;
        fh=k2nyd4znyzP9L/IANcoRuSlr/zv3HAH2nCG5Wq84h/A=;
        b=lw6NpGiLhQGh3tAnN/SLMd+FNfBhvoykb70wrSE46VR8q9I8yWi+6Icigtf+ZVBJEX
         M849fs4bp/AWUjKPWg26E6wPvcz5LuSklsBns58dv/Sg7yWZGhY+RJEV85PbTYotZzOQ
         JnoxVqdl9vTzxHY//MAIyknKW0GpptcySRMeXPU/7tYqa5I3ekvkdkLq7x8UNt72l5Lo
         Ka3F158VqXwNj104eEp/J0NcZYCziQOsG2XNrt+1qjMX/UhfMrc+VOwDPYTMhJLKHrDi
         kB5c7I64cZGcQ0MYw3aZ/i9WTNPpITLkUakwallLkvT5DvOLHkjQbXiIjZALX/t1QYxO
         z1iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774549083; x=1775153883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7sccmkGDehtyJvcq1YZcs4by1igPiabHUGseQHtgqo=;
        b=SIs07yxaAnI6cqOhg3rfn5HKOfTZzbfY6JHlecc1R+ddMo8lj4DObMAyvsyxdXrqQi
         WCMvUY3XBUrzAOd1YJG32EK/IOggit2F+lB4NzPYFNpEoXVxr17FKc41mI6a9Em3GtoQ
         2N8Ip1bsOW9MvQ7P4vzF2s+B0qqu725SonQaTIgMVfkFtfKRdC9VsqYAdrQUTYGhHVhJ
         +Zd2JADNIJQA3KlYxcloOD4fMC+aVG1t/nM3+Xu6WwfCmipD1dCE8BoBXbp9exnQVMny
         1WL/IUQLxZxyKy9zpPqhr4wTeQBCXWRIOSL6gKGI1Ds4nMU5gBvOhnNWlbDrLQGjtA9r
         nn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549083; x=1775153883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7sccmkGDehtyJvcq1YZcs4by1igPiabHUGseQHtgqo=;
        b=cZqqk1bVjuTkVNtjO99djV3fR9006q3VRQApRTsLMWTq/og2G55QVqtW2vFFb1/AzO
         Sustbb7tejiOt3/LoqkfURSE77BhsOTFG6GPlZiy3tDM6KY47XX3+zEHiwE9/PACjkrf
         Nes7yhJmK8pWlDGbjZ0mp1wni86mM50W8qp7itdb9SMRMwc7Dq3BhJW5UyAANno/fAQN
         b7ewEA/fveWcfyG1rdVl2RHR1eyuBdoVI/GfvUDxTgYKd8/X/vqstbtNSS1v9ZBrxsrR
         vV9wKcy7NMiOXHSWiwIeMKzKrSoyN3C9LOs+VvdOdUG17DhbermwtavqEvYB+Rx8Rl2t
         VBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHM+M9mK+PSEnpKFSpAc1S5JONCWDVPRcnLYYXRBMonlVr8bXsWWMUgEoiSHooUOQpEWAsP6kYFT3GvtfpbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuatSo/Fi85PaxRnU/JjYWp6M6tSm09erfyFuSDTUyJIBnhFyk
	onzHc9u5LvBn48UwYyvVA+/esMTM+7swr6t5z0WtA+OmIpqBjqWUzS3hFqU4nUAxehTwpppd6vq
	vWZI5Bkrs+tQT4g/l2D0eywLPcoAv5AE=
X-Gm-Gg: ATEYQzxTpMjckHbwk5ho/j8X881QYXMDZCLtk3d0QuVporvB8DmADhUZhX3WYhAd7km
	4PiZiLK9im4KRxUI2Q6Ep11LgXmpEJRapS2voqI0n542waWrQBRI/moezSfFPyqbpITzeigfKSI
	UUaTix4QuWhm8VeDcWtHJKG2akcsB/NKOaVRNjUDsBWvMsU8QkADeqooWcHYKpBp5wGwxJwYrTH
	xIPKgLajinSWxeOpSZKbJMCFaPERadhxKGScsF8/olQftTRv3M3ySr/VW48JyBM+wOmDyI6siah
	3RnIguVji314GfcLV9UpTL96SwB3EQ5fvk5w7D3Yes2VRqdUMrRpZ6WnK7HJPM4fPSruD7XXoNh
	buM/JOSa0mLBWDoMgx56oHB8=
X-Received: by 2002:a05:7301:7214:b0:2be:1f56:ed0d with SMTP id
 5a478bee46e88-2c15d3e42cbmr2323302eec.6.1774549083220; Thu, 26 Mar 2026
 11:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325003921.3420-1-dakr@kernel.org>
In-Reply-To: <20260325003921.3420-1-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 19:17:51 +0100
X-Gm-Features: AQROBzDHC8l4cxhgXpM9E7qHhcmsh6Eh0VloN_3mY91VrE0Eq-6JGd81wVQv04g
Message-ID: <CANiq72kqKGA7sqB6WnJxMiTLcRx5t=0xDJhzyq0LmSQVT+9WLw@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: uaccess: generalize write_dma() to accept any Coherent<T>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, aliceryhl@google.com, abdiel.janulgue@gmail.com, 
	daniel.almeida@collabora.com, robin.murphy@arm.com, a.hindborg@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	ttabi@nvidia.com, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 1:39=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Generalize write_dma() from &Coherent<[u8]> to &Coherent<T> where
> T: KnownSize + AsBytes + ?Sized. The function body only uses as_ptr()
> and size(), which work for any such T, so there is no reason to
> restrict it to byte slices.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
