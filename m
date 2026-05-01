Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4C212554
	for <rust-for-linux@vger.kernel.org>; Fri,  1 May 2026 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777644357; cv=pass; b=ca09Af/NYqeAkdjZPrBDaVvqETK/DFHT99el7TAHGdcldEq0r+Oc8AxjwYj7uNZtUOLQRVTjfBibPlJ8z4AOFiPbdlyp2ivQug4jWT0jLoP5GAI5e3RCDGMPKy1w9ithlqfh6ZbHAFu34Qq80geXXG/cz52kiB8Q0EDTX7dFHXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777644357; c=relaxed/simple;
	bh=NP4+SywKrS+AL+u+d9g+gGa1xGNuBC/F08SK3PJVlls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKmf7i8TPKv1AdIFxMRgHPdjof8f0mBAXTwOq0DIqEEJPbMLBb2HlnzSD6HYNt/Cv9p77RvqzsErSxgn6j1xXzGVdE8oiH7TB2yEKgsth7vI+qGBv5YYj+CtKuPfWH+qnF43SL5Ofv7L3HkNp0ma+86iWGlBzpiDEC1MEALS+3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p8Y76WBc; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p8Y76WBc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44a14580111so778620f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 01 May 2026 07:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777644354; cv=none;
        d=google.com; s=arc-20240605;
        b=kOhIQ5z8cAhPQOIZMLg9Oj7RXREuikezzH96l29ucIdXQuU1UX5VP3PIyKenwp8Ldm
         XfQchaf5wBEV+zIi461F3mefUk5AIUgTHPelm4niHlXj2y2iV2dAK+8by2GtjRzT49nd
         n/K1LGXh9U5I8WeJdJHyNRAySY0ui5PFVJwux3lh2c/KFUHh2DpXdKf1HDI/aEOB8oWP
         t0Tudn2Z342ALWjCddYMjcJDH+/Hpxj5Lo2ryzIs+xebVs6wm8VjAlfFYVp+tjP6N8dU
         J91PhnDRsR0KzBUdz9ivJC6zc5wBauPiOGRFQSokRSoxcI4AtCnMFvf5wWzdeDjyWOoC
         f7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NP4+SywKrS+AL+u+d9g+gGa1xGNuBC/F08SK3PJVlls=;
        fh=L3Rwq6MbJw1884IpFvl2nRJ2xtwdRoFWT+OPWVIOeRU=;
        b=MVkTKrYxuT2VCHV7D4DF1WOKh0FjcNO6kfOxVPJJFebqTB5L3YFwLd4nv1ew5ey2UY
         RN8RqvfRyydGFQcldOLrf8DLv28PvmzzliJOq9WO8eo+ZH8rBzNZeMfcFGf1uvSMA2aG
         lNzR3cj3IiZKDeoXT2YtdZkAto+xgK8gyDg09wBWnxZu94c7e5bO3sR9yvOgyvkKJMnS
         18Py1/ORM+KWFT/pH8uBm88divHEkbwxK7GU4obpHf4NcnlCXLp0IJZy9CDxYqhZ9700
         EyPOwyiVZ57NGIy6CimFGuG4D3oO2yCJrn4aZ7kZmOZLbcNpTmp5p4loK+zgwOtM6HGY
         C2Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777644354; x=1778249154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NP4+SywKrS+AL+u+d9g+gGa1xGNuBC/F08SK3PJVlls=;
        b=p8Y76WBc55U+8+dZ05+zWm0DyzSJw6Rve8UIAQMNVbrgXMFyaBGtCVVGL755Em2zf8
         H6OAYWh9xrCUglTtj+yyg4NzTDjvhhg8J9r2Uhi/HZIaboMsKehKwEvu1Yreg7rcGuRp
         2mTCs7R2FuOdmBoXDy+QNFE0FdiKTmpMabOxISgRGMdi+8ONZaibFZ6Y/ZLZnUCwEq4K
         l5alRjbw7YIhXgba05QDHDYAruye5NG5MDWzBBIO3tGQiFqZ24NxeeS/zs+2vUXAMaZj
         wdnsqMeva5TJ7YvJF+9x6YQb11fmA5RRrjYg+16dJjhdj/Tdy5GEC1hq9qXgIg3B3uZO
         bjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777644354; x=1778249154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NP4+SywKrS+AL+u+d9g+gGa1xGNuBC/F08SK3PJVlls=;
        b=CM+aK2Jt6hMdfI95Dd3UHFPvkPLmb8MNIaWSgl9+zllBedhifY4IX8NoLzeIljx7bz
         8yY9eTk1vewTGRxBUKjQzF+Pz/VG0uPH6CTewmoF6/7QYy/isgSeoV9y3n/QNOsQHp54
         Q+W8kx1b1iH6IuMztDkwRohXk/sWYG5z6pO8MqAtr35sGDXAX2hlsmO9/LCddKK4usrK
         IoW3nxSO4KJWJXuKbI+khdPzBRE4pyEw437LiGsmt4Up76dSAqJcPpLLFLVrl2mtWy85
         zVSTwKvTQYAXvMtwvOr0haGUU88At6/YlPv9egClHEB3JIdoT4/OfH8aVqBDotAKCEBu
         A/sA==
X-Forwarded-Encrypted: i=1; AFNElJ+v/B9Y6PYtaxtFyifFxQtH22S5IUIMgBEFWXnzTGs8nGMKn+pmE79Lp2ppcfPlO/pindGRtloj3nPxxQEduA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPXV3vV6uo3VNNaAtrH4+CUeFl21nzO6FvnXKvQb7zR/J7pgpa
	CuifxWecBrwp4IP7GFWYDr+R8L3tLxW+uHMU/IJE7H0T2uaQfA4fa8LgoiL+W/snzczf3vhXCj4
	LeIjZm0byIFKU6emp92HNbWcG8M/1o65CF9bnltUD
X-Gm-Gg: AeBDieuCNfAmvZV6nng0p6nvnRj3ip+2y1RhME3rGHYHAU3rQhkTLt2HPEeM8Gshtwf
	AYXQ1dyiM16urdtHXwZ2wANAQTY0IvQ1Dwptzxzp8ZHAMeJlY67brqgPKqulZjJbhQi1ypxiaqX
	BRp9/hSInzndYiVuHUF4pqzabbvcL3VLJKCUpRYTANQhvW7XNm6U4yTek32B6xlcrjcwDqkjC/j
	rJf1VCC+v2s89q6zn8p3Nka8za1TC50ZAk4BhQnwhb4eiwz0+z/TmPVK5At2pjVbg+PY+LdRfeB
	kMtfESTydGT6eJAZPPhGQP4n4+1ym5E/Z4jYlkCFm5g8XfWIXAjAJ0FKoOUcZ+CK6Mfe/7FdHn1
	ayZ38bQUcSEmAZI0=
X-Received: by 2002:a05:6000:2f8a:b0:43c:cf25:f29a with SMTP id
 ffacd0b85a97d-4493cb4316dmr11164229f8f.8.1777644353800; Fri, 01 May 2026
 07:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-fix-gem-1-v1-1-e12e35f7bba9@nvidia.com>
In-Reply-To: <20260423-fix-gem-1-v1-1-e12e35f7bba9@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 1 May 2026 16:05:41 +0200
X-Gm-Features: AVHnY4JCKmfa5Xur08olcjHreQXWW8CULXPA3kzTIG6tPdAYfFIYgp2iWwOpqE4
Message-ID: <CAH5fLghpvU19Qdkdvf1WD1jXKwvMnogNkxhU8G5q3-OH5v6rGQ@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: gem: clean up GEM state in init failure case
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 2:37=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Currently, if `drm_gem_object_init` fails, the object is freed without
> any cleanup. Perform the cleanup in that case.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Tricky stuff. I also concluded that this is correct.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

This is a bugfix, so:

Cc: stable@vger.kernel.org
Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")

Alice
