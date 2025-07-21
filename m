Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9916828FFD0
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 11:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095983; cv=none; b=YDe+kCtxfRwMpOslnq2V3cQV49qdpz+uPMdYCGX3XlV3iDunl+1Cn2wW7/SlsvdcH4uK4aFezSI3svcYlIobuxn2rOHHhVj6fBmByZTrHWuEQ/YCkTvh3Tbzm4U/uIw7apnXENYhIA3oIvg0NsUemyoR5aQKNsDusBWXzJAnwh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095983; c=relaxed/simple;
	bh=s8DwLMaxGVgo8hNq/g2EUh6Icsw4FGGLvVorXWdS1CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O71DKlQp3lxOOgMWWm3WgyUpvvo/WUxXKYqU4EqwXAAOR5Wf54OJzAub7+viwtabuRPDah0ZSqiPVDaffdFGqMsztRCN6lMWhx2e8ttmkDyFsfcUEBxgVOL2W8RtXZVgmtQmnOPtsYe8kvIPqdlZ6UacAAF90Zq/CEfdGE1p+h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ou/Qu9ev; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ou/Qu9ev"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1893988f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 04:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753095980; x=1753700780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8DwLMaxGVgo8hNq/g2EUh6Icsw4FGGLvVorXWdS1CQ=;
        b=Ou/Qu9evJZNnwRhAhGKg/O6dbr43J+SqZRtoFn9zA+ialI5TUyFi7RERzuP9HjLxI/
         HdtoFOMKCGsN87UU7dYCLjG3s/yUHx6VdFWmB3+qXf/yTeXvhRAhodBR+C+CzYzrnwjc
         PB/lwjFjl7uqXlQunuQ/32/Fa3XpZfJeL83jBs1u6rGMbgeBg4Q8BIJmOa62HipNRMqe
         tvp0E82CPYtKH24bKrERG5vKwpDPw01ikFlar8htBOuihInJXSMNvZMG2/T+WsOiGPR3
         uxJj58ssZvbOD7e6cx9+6LJqEFDME6PZE1y2xVRKb2yCD4YZVgUUx/rVFgBIghd4B5Ew
         e09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753095980; x=1753700780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8DwLMaxGVgo8hNq/g2EUh6Icsw4FGGLvVorXWdS1CQ=;
        b=W8JUZjeNVSbrRwEAdlxl2HVfaIvdXCVblWDykXXj2xTLDtOGSm0DO90CjBG7Vv5PEg
         9rNsHMPI5uywFa5xAwhVElRNaWiYYxHrtpaelO53nJfzpAeJScI2QSboLfPVnOByqH1R
         biWvRfV2DeUFzEUMjai4O8tHP23NFVnO4arJoa7f4Vt2A9VoWs4nplMHuYQwIsH+lfu0
         fJOT/YVhcHeW8gr9jI5zayF+Fyb8EqTlazHNQxXMJaJwM2v5VhS8IskcPxk3FUUMXQYy
         Tb+440nQlVYG2LMVecLeXGd1Z7HVsdsfHMC4nmqeehY5IVHzEtNZUa3Tc55T5q3s0EZU
         swEw==
X-Gm-Message-State: AOJu0YxGycOoaXt5AxdS8fDSqv6kOwyEMdt9fSvCxkezyxv5j8GFYYjL
	zxo6DTUKGvZV+hrS3lfIu7hhg9ht1LPlnlvycW0qF5U8sWRs83INboUABPsI+cZbrkZbeYlNoUf
	NDbJWb2MKJEJ9hkkzHfcbxpvLbh8oCg/6JTmSX669
X-Gm-Gg: ASbGncuokuAntCXkP+xDrwsTcNuj805R/X9Qt/7CH/Y70oD91Bs1htuipNT7FZNsmgS
	4dPersnyVNqOyB/Xh1wo6QeYsEux4d1NwNDyNLwUnbkENsoUOuKIQks8A+FcBuvH6lzT3V/lkU4
	YEIcKvMEeYDdOkE3JN3j8QRE+RQ6x4hLQKc7paA4ggiPIcuudwDKQKdujB4K4jDP3sYlzO7a7Ha
	i4pzq4z2X0i+lMrHywSnpy7nqaW3n1zvhtA
X-Google-Smtp-Source: AGHT+IF1riY517jNsBWworq6HoIm32GAqoCMfQTdA2WL/azNRCOSh84I+OHSTSXC9ydWwvuBVz7iqeGv1Yh0IPi/6P4=
X-Received: by 2002:a05:6000:41ed:b0:3a3:6e62:d8e8 with SMTP id
 ffacd0b85a97d-3b613eab461mr12459180f8f.55.1753095979751; Mon, 21 Jul 2025
 04:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250718142026.2232366-1-i@truongsinh.pro>
In-Reply-To: <20250718142026.2232366-1-i@truongsinh.pro>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 21 Jul 2025 13:06:06 +0200
X-Gm-Features: Ac12FXxH7sEDkUsQd6yCfdYvbgFR5hMpNbPBuNFYbo0S4ZhPZjZIN2YZsKV5KbM
Message-ID: <CAH5fLghFCSS7HB7JqucpAPrExdttvcOSNJwuZMFNXspu0=4G4w@mail.gmail.com>
Subject: Re: [PATCH] rust: Add #[must_use] to Lock::try_lock,
 GlobalLock::try_lock, and XArray::try_lock
To: TruongSinh Tran-Nguyen <i@truongsinh.pro>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2025 at 4:20=E2=80=AFPM TruongSinh Tran-Nguyen <i@truongsin=
h.pro> wrote:
>
> These methods return an RAII guard that unlocks the lock when dropped.
> If the return value is ignored, the lock is released immediately,
> which is likely not the intended behavior.
>
> This addresses issue #1133 in the rust-for-linux project.
>
> Signed-off-by: TruongSinh Tran-Nguyen <i@truongsinh.pro>

I like the reason string that the previous patch used:
if unused, the lock will be immediately unlocked

Perhaps we could update this to use that wording for the remaining
try_lock methods?

Alice
