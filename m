Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8216280A5A
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Jun 2025 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411224; cv=none; b=pJ6ow7FbQnS3YHKnaZ9HyOz4VZ21VRgO5U/80srdUKZAKHi2HqflkIHG+JpBIyrGLywsq+U83oxqjRdoOTtA4tY+xuMht4Quw5BQMzJgXKAW1kSahaRi3OJ/YDmG0TOnZn9B0X8Uhy+O2G3pQ1sW9BEgbbTvi07iGwU3eBK0chk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411224; c=relaxed/simple;
	bh=mZ5vhEEnS31cSdEN8193qbJmhpsPbTggj6HeS32WJVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGlrUdLHBhmQnW29ijl7UjjzOeiPWvemp43wiTieL0cyWU6oLjgCLfircSE6O7u59sMBhuMC+ViDPUPWMznJjMjgt5V8DRMyUSOb2ybU2UsW6D5G9tnclJtvDiA8XTpP2JjOt2mIOIW3u2hCdBbPMDRvOgFV0qT7IAotOBUfoSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X7M/J3Um; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X7M/J3Um"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so10058315e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Jun 2025 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750411221; x=1751016021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZ5vhEEnS31cSdEN8193qbJmhpsPbTggj6HeS32WJVU=;
        b=X7M/J3UmmjlvgncqVfIVgg/xzZ6W0Q8RvB+kCtrzmk9UEe3z9PSc9svd/7JTsMq3K1
         tDrc17g8bKSOw1WC1xHKOhGYSthMwAG+OcN1YN4Hq2BIm6simLJY8+8okc3joacD2p2X
         BOy0ilKtiPcxQHW73dNKdOQfIt1MJPEDcpsbiTEfJXm6F8t3f7WgrswFNiGpK9mWEPv2
         jMXlV54WBfqGV6yPV1/lszdm+QNOQ24AG2m9XHRfoZsTS7e8PlbG4PSRiqpn3iLcfCKk
         DYO2KvKNa9y3BGHBp9Zw20YsuRAb0FlvfKpHhNbY1kzKltc8dzR9LjTlPF9z7VjzSs0X
         OtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750411221; x=1751016021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZ5vhEEnS31cSdEN8193qbJmhpsPbTggj6HeS32WJVU=;
        b=Tzgf0UdCk4w3AbFQ0xTAP20mRhZOF+skx7alfbxqRi6X35v0cCjyR2jXgRNouSbdGy
         MikYik4h6RlwZjSiL04j7ccE2NIAlmtlgv8YHwuJysVTOdwtlXGhKA2CEbpD6qZB/swB
         glngcv5sJAvUQfnuk8HKVIB1GYpbydrjD5dx/ekZmiiyQfIQarfOG++mAyzLDZVdfx8X
         9qPnlYbILmlAs92TZznYSA9P74/toQd+U814kqlV+6YnK+ldkn2utBHH0HYEcn4/nqd6
         DfBNUZ32uVTU+0PYfKgf7ZNfLiXy8M0mIPJMrasMsASyNSsnoF+RpKD40EN0GPFwUfx5
         Nsiw==
X-Forwarded-Encrypted: i=1; AJvYcCUzrIq9wcrHYgRvQHK1R+VM1HMdW6uAeWps2M/MtkTaCC6zPiJT/BkrTlxTzUrxGZSfjknGhOdOokrnJ4mvfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9itjpvxkb4neOlUni4zTnyOeOMcCf1yo1lfYbzRfQlSdW6i3T
	c5b+2dUf0u5Ea7uM/XISpFkkhnqoHdflB3xDZeoCbrYwnHz6dgBJO/5CbKyTiXvR+pfGpO8izl7
	HSnOdiduAVtUs/7rC7Mz1T33VZH63VviW6FlQiOjm
X-Gm-Gg: ASbGnctd8g/sh4Ov5k3We5F3K3NA6kp2Il6Dwcswr3h294urgLsnTz314m+SDsUm22t
	t/TVSsofCB3XOD0RcRtEXHWFJDsnEbTup5EdCvfxzZMsi46x68g5O60k2PijZdjY7KJwY7TmmXl
	qW8VuC8nTY/A+3V/TRN1C4FzUcO77kD7o7liovD30jgS25uaRg2pSN/xi0n/v2nf03PCh0PwrIp
	Q==
X-Google-Smtp-Source: AGHT+IGOxu/JyT8LKL4rOBc+Bsq5zNd0RaoYbcY7WBLcAPcbTS+9Tu0MnTso5BqDG5xDYUQ4UIo3GUoxMrDuhykIYPE=
X-Received: by 2002:a5d:5f8c:0:b0:3a4:eda1:6c39 with SMTP id
 ffacd0b85a97d-3a6d12db6dbmr1837913f8f.13.1750411221085; Fri, 20 Jun 2025
 02:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620085229.18250-1-abhinav.ogl@gmail.com>
In-Reply-To: <20250620085229.18250-1-abhinav.ogl@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Jun 2025 11:20:08 +0200
X-Gm-Features: Ac12FXy-s6NWQAaZ_bmMiAF99B9M2tvOKWO1ll0w8OfTgwH-nexB-TDc0pyPKqU
Message-ID: <CAH5fLgi-QG2KRt6mAiU3P-tyVG_xevPzB6VK_W=is2B+7=63kQ@mail.gmail.com>
Subject: Re: [PATCH] rust: cpufreq: use c_ types from kernel prelude
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, linux-pm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 10:55=E2=80=AFAM Abhinav Ananthu <abhinav.ogl@gmail=
.com> wrote:
>
> Update cpufreq FFI callback signatures to use `c_int` from the `kernel::p=
relude`,
> rather than accessing it explicitly through `kernel::ffi::c_int`.
>
> Although these types are defined in the `ffi` crate, they are re-exported
> via `kernel::prelude`. This aligns with the Rust-for-Linux coding
> guidelines and ensures proper C ABI compatibility across platforms.
>
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
> Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
