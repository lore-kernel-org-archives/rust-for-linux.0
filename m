Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7A249E5
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Mar 2024 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711730902; cv=none; b=SXxz3FybHLqgUzBVC/XwLufdHvFrjFlBUK0vBkLo45M/sTnJzC3bhMpbm7aFt9G0ABaCbwqr9UIdCx6LPIoKoxxCIUnZq7SOeTicu/ARcHwwSkjh7zpgsaC938zg5voyihVn5sKBbOawx5moJGBvOkIqg1HkeHwUszXnW0lHk/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711730902; c=relaxed/simple;
	bh=5Kh2fVTvI46lAYAIIeeBsbLounCx1r76uaBHAeJWAVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WwsHSu1booz2X2AxiWxxyS50pHt9FrjxKhLDQbYOk+dAz6qWStG3lorfPvQyeufCARSDw0KjOMIfIhvXuXz8SLXIC/wz7Hp+xvjqAYD8ebbZ1Ix8D6Lx/kfashfF28hjYEjxEKyrhXy8m3BPoaObanWsD4PSJUuRtgrVE/mfqJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbeIRW5Z; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbeIRW5Z"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5dbd519bde6so1542213a12.1;
        Fri, 29 Mar 2024 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711730900; x=1712335700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Kh2fVTvI46lAYAIIeeBsbLounCx1r76uaBHAeJWAVU=;
        b=LbeIRW5ZkJXvbDpaCa2JqCzw9EzLpbaJo2QQhlVkvr7JDDa4vcm8wmdlePrgFLlA/M
         sQIq1n2wzrHC5UYbTG1YTyPA3G+g1DPQcya6x0Vmc0mX0akg6kOoB/ocL2p6qdVCadZC
         hTmDsqi0+LytUrQWhvoawCLMRjMzo5ArFezUvfF9hDwDJWGstz6SprkFloJuwIDGKxgh
         RrAvodO89xvowqBxxcsOl3QEApYr8+3v9SLr6yThPX9rWt1lij8ZwrfVSU0Eam/s1V8B
         9U5f7Kd2JtrbEpxoDDmWSLePHMPFDISw4FbwSSGA2fYtQQL9mXBkIyIMWmxqs2r96Kwp
         Bq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711730900; x=1712335700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Kh2fVTvI46lAYAIIeeBsbLounCx1r76uaBHAeJWAVU=;
        b=dNT+HarAeZ80hQZFLi+S3O5mIu3RvWTKAcxpuanYhT27Se8zQEAnv1wLfXJFFQ+0z/
         hbqhgo/nIpzleK3Ys9SDVbFHnyLmri1BotEKhf54Ac49P2aOM6S+EPw5ajHnvvVed3j/
         EK2tX9k7D2THVwd769oVLelSDcUmPfnrc+6bcMMtZWlr3D1U/GovYpB6EGZbgYXmadVU
         6JxGKLqNAuuXk1INiTIdlLTfgC+wTEbOX7qvE/KFE1EGtSrV5eURdxOcCB1YtckdA6Y0
         0nNqajTctG11gYCkaFD0+ABdv7HDRV4FMYW7C22d/bMEo2PhNTcw2QisEDzqDTx5ZJrX
         YZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCUDOuryI/zp6IEiTKrZqVKo8lQKv1p8MsBXGnP7aOoW5qxfmC0QvV9IirNqiq2r6Oya0w9KLVF7RdC7aj01Kyt5z+S7XjaP13WnANYtIN3fbrMKLl+D4Q5AsGOWX3+yeJeQVEAFiM0NuKRgYMc=
X-Gm-Message-State: AOJu0YxIZoW3XVzMM8m8dGDhCrJasVv7jQimmxfkXco5AzZAPIZebyok
	6vDKSR0gqExOW3jlXeUK09J0wG1Bx2gJ3e7AF8jU7OsxnGHmIwsLfh5jAcabY61Ah0D7gJzf4RP
	kVlQX71Dotncb7KYZiFoDa5zSpbA=
X-Google-Smtp-Source: AGHT+IGTTFdw7YVunOq0ITZvv2yzmlL089zsWbP4X/GR4h6HULnTAmtPYG1G8caOtFgpqazOJQlQRvvj7CuC50L7N6I=
X-Received: by 2002:a17:90b:8d5:b0:29b:f8b4:28bd with SMTP id
 ds21-20020a17090b08d500b0029bf8b428bdmr2650893pjb.12.1711730900286; Fri, 29
 Mar 2024 09:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240329153025.150112-1-laura.nao@collabora.com>
In-Reply-To: <20240329153025.150112-1-laura.nao@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Mar 2024 17:47:45 +0100
Message-ID: <CANiq72mXTONTaHDDg9=qO+T+=VoG7Huj1qdoTxAERa5C-pbUyw@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: Add instructions for the Rust kselftest
To: Laura Nao <laura.nao@collabora.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org, kernel-linux@vger.kernel.org, 
	dirk.behme@de.bosch.com, kernel@valentinobst.de, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 4:30=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> +A Kselftest is also available, which verifies that the Rust sample modul=
es
> +can be added and removed correctly.

Do we want to use the singular? i.e. I guess eventually we may have
several selftests there, thus using the singular, or explaining the
details of a particular test like here, seems a bit too specific,
compared to the other sections.

The patch looks fine otherwise.

Thanks Laura!

Cheers,
Miguel
