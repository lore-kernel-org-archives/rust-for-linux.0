Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7A43C7B9
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 12:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450070; cv=pass; b=Ng25VlmhDGfbOfZ2d0wH1UKIGJdfuxSXbjGt55cggOat6z8l7EU4bOqAwSYF4nykHlKxZGFZjZr8cXd88qHNfnTdeG+gtP+n2VAv9p9OTDoSf45c6WKDIU9MQvAohPtlnRES/OEwPNqqAWkeatcWHBE6AFxsgtq3DZ1+jUlaU5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450070; c=relaxed/simple;
	bh=Z4I++brGGhpPsKm/ybfCLsUFSbl5RIBEMfXGFx7C+4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drMCr3M9V1faAgK8JFwaPZIhu8ar/xoxX+ic3rOZRHORRIyEMLhMHzLq5hTJEPVAj+TLcnloeoM4e7OoATAineJjeD6E8DRRV1V+wQ4Tx2SBHv3VLvFntvrqXLKO9OK1AXaBfIi65QOm4/04llHxsA9jFbL30xeYCwPuxxK729c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IK4CdEzm; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IK4CdEzm"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38eca09faa2so300433a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 05:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786450068; cv=none;
        d=google.com; s=arc-20260327;
        b=lHlRMcW0c1jl2oj/f5X36Yxe/QYxr647Mk94NO5pfafiS0Pn+4IaGh9JqHS6SZwTi7
         1Lj1o7rkOraU3rqBkx1aJnoODjPwUw1Cz/iz1qwMkGxc/SvzS/nwC9sMk2Eg9LSeSnKy
         nMzKzqJ64KmBKNbvzy6VVroCJo0jTMQ35Fz5RFe5tEx6WX1AZ7v07IAQuEd1+1JedJ8T
         e68ErOZuCSO9UjR1RW3WPtapJd+8veUND8Jw3RW/3MbgVdkAbDwa8z4tVOWZA3sMFu6O
         KnWxWDayaqGY9MzkkmQ0kiKLmmu2ONTLetfbvLSlvwEWUPTtSf5D8eFCojSwtaT7hq2J
         6rnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2uxnc1EdqUgtiUdYVhZoUrLsyc1jRYKe08Y0C/C3JRc=;
        fh=evv9wTidTv6ibclTYhTxNND1+L5tDzRGyi2GO97JBO8=;
        b=Y6Qy4zNhdSOUFD+iU6wYUxkvrS32hM1mp4IdIKm9FeNVT6cGoasdmriNlbJE/rWOFH
         lGgKkh98T49JF+G67wa8KvH0vQPQcwLUo2cNd3Pj6s2A41N4ZYONgdglFLmr1U8nvjTK
         oX+M54HW3OFxC6V/68I4xvUbxmmnujuXe3unfD7lFOra0hYnUAkdn/TfVuHvq+QaousV
         gXfJ13JGNwj9AZLPry5yfqpKXfjDudpp3WWburmFXvD9KUIsZiB6iHqCTLPL39n2fWOh
         +12QQTtTuSR4z5OkuaN6llnZiWQEgPG0XHJrXVEbLlUwAE4+kaXW2kNeHE5CBuE2oLtU
         cfvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786450068; x=1787054868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2uxnc1EdqUgtiUdYVhZoUrLsyc1jRYKe08Y0C/C3JRc=;
        b=IK4CdEzm7xFPI78tg9h3EXjBSy4R3WjyF1PAOJfq3AcftDCnS4ynmyLfJVSZV9ragX
         UHl5aH4EMQPfYTy1Ly2ChY1fRmkci5K2IomRlQn8nW8RU+K38nLcdZt0d6l8OYUvOs/7
         nEjEBZHGHRD9nGp0p98XYYJ2N3eg51Tern5vGqUMxLePtstwdgcADEVKtEXpFOoGt7EH
         XUgaky1jPss8/CjGFjtMnQ1nT4MkiRPxwO02cavq8oLo20AHZPheLfWwomtPzqAp2tNg
         f5g389lY+Gq8y3/ZdWMXpeOUItJ/SrQvvayfirQ2LTk9WyqVASSuUyKoO6d/oJTeoK/1
         /KDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450068; x=1787054868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2uxnc1EdqUgtiUdYVhZoUrLsyc1jRYKe08Y0C/C3JRc=;
        b=ekn+nc1xAD5KGFS+VBf5o1l3yc+ly5jwIm6gpb2qsKPpw+nxl5xLZxBEGhQp1tIWnS
         fe/0ma9BXfFYHSDEaEIX0flwsuL2oJI62DeQJKggaVGECloSbjcpw6p7S7or6/SFZiRq
         5Sip4EfWwdSFaHEwxNem2nLWLv3nwoKEfBKuy3NmpAPY0Ip2OCZ5HHwN0Afbh0wo3RNA
         FpzJibOyXinq1UijhY01l5ivaCfykGSIgQ6zNyn6fcjFmmu3Oq7Khe2ZPVHF1tG9Mpxj
         NFFKfcop58odXv9D0OS1p93g0aET1o6obh28j8b4QfN/rw3Zinx2hS6FGEKoJp8YMMWc
         qqRA==
X-Forwarded-Encrypted: i=1; AHgh+Rp22N8yRZuFNRRPa45HQBVo/wuxRicrUwEBeWO5akXPvjScEiWPW24n2r4UCFl7AK9ZFODJKUzK1ZoFVY7Lgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkYKcBZGlwA67hGhdo4ooiUoblNvBkaNoPJHcAE+4Om40eT+9a
	fqdVllxP7vzcJxJB5W6Ymy8PyvPjpO7O1VfnxsAQTYHGWeijv9vtugnkowDzwdc0w8sqd81qWvT
	WXLn6jMmNFJAfGhu58oGUUzFu/s8iebc=
X-Gm-Gg: AR+sD11PGUz5M3yhDOLhNgIJx+IVs2642dO10eJ3NwtJbev4mNYeQoLq16dhfl6qgk+
	l6yY6dVZXSLIJ37Kl3k3A1BH5UrQTBqKql8mq8eVRdwqgHRVHZIWKxyHqeoq+gEuGv9U0a7R1ye
	871ZJatQLpIiONBkwfVcyiw/qtJJUOrDiYp1exltfyrwvOuzkMGbF+bxsS6gcTsrHqP6xEXrnfS
	mLppyZraPoWuG7oa3Di+2Xhthyo3AXXHeR/HdtotMWr64fh7INi9yadrGyyBQlg/Am7DvF89kYn
	qT3wfMT2s7RE0Ia88S4Z12Yh4gx3zMxTENOmuQV5vuSgSNOdPN1a9gZfqHh/qlpvfmmPTAtIRZk
	yDlVp8RxU5Uuj3500aGQlGw2WwXAEIwfMLGX1A0l2sUXvRvK3CIEVw2uDxPgZ
X-Received: by 2002:a17:90b:2688:b0:38e:6a7c:abbc with SMTP id
 98e67ed59e1d1-392ecb863cemr1989478a91.3.1786450068067; Tue, 11 Aug 2026
 05:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807130531.1056209-1-tomo@flapping.org>
In-Reply-To: <20260807130531.1056209-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:07:35 +0200
X-Gm-Features: AUfX_mwmm_IcWvXtOe-pjJsRF33OwLloCQy9VMiHhu-1l855P46AYJCZDpE9E4Y
Message-ID: <CANiq72k5uVLXeUurGFE2-Mu=MzTpo0As5hMtMAAd-AjfvkRgXg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: fix as_micros_ceil() rounding near i64::MAX
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, lossin@kernel.org, 
	lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 3:05=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> The ceiling adjustment used saturating_add(NSEC_PER_USEC - 1) before
> dividing. Once the nanosecond value gets within NSEC_PER_USEC - 1 of
> i64::MAX the addition saturates to i64::MAX, which drops the ceiling
> bias and can yield a result one microsecond too small.
>
> Fixes: fae0cdc12340 ("rust: time: Introduce Delta type")
> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Closes: https://lore.kernel.org/rust-for-linux/CANiq72mtS0ABA2JnT5tpz6J9c=
_mnxY+vyPvghV_ukngWvN8F2w@mail.gmail.com/
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-next` -- thanks everyone!

    Cc: stable@vger.kernel.org

Cheers,
Miguel
