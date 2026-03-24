Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C52E1DFDA1
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 10:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349931; cv=pass; b=Ggm81zI7JHqG/xF9zAPcfJa2lzFmzI8UKt8GfktWnABOqcJheWRiNRDd2DhScsoMtUIX6CMOeaj8Xon9bsm+cyr2Ev1MU+QCO1Iidm0A6Qib2GRlGIZrsBdpNPOXmTyB2+7VApBhg5PjBKKm/l0R7RlaUOacQh8vEvh6Gz9GWWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349931; c=relaxed/simple;
	bh=KHpvLLQnm+0s2ip7c/TcjqSG8s4Eycqur8euWeGF39k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLGH2wFKBWGZGPjfABHUURhpUubZGpYmJiACt1iJiMaqtK7tIppMj1Jpjm8/AB04HnY74yFIzd5i7kRg7QR5icaMUuhMrg0e0drmvY+EyT7n+wwryq6nVUhDHUa38+4btjw2Q+mKTCNMpLzUeYOOSU7x4l/oPTMji/mw2g6axew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k1/y+ody; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k1/y+ody"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso43848125e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 03:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774349929; cv=none;
        d=google.com; s=arc-20240605;
        b=iWb39l6b2DDD5aXPKMWg9phOFVJs5fxH8r5UGK5f8+mVbFsj0DpkPbO58v9MJQc32z
         TJzzdXlEyHVfTULpP/LNuB2b4ChhMeRvVBxyjAtZPrx+69YuTNPa8p5kM1d6vu9sBBl6
         rPEtmNsfR5EgszDrv0t3SpUhw/7ccCQRbwS6Dy7bWKtGxkKSZuVxLQRkNh5EkqTbhVE2
         YbkUdTruGVEaLT825kD8nyYN42TtVU8PFdWuW1e89DwJhPihdhLKEgCqthtR2YVpTpQZ
         and9ca9dSknpGWTExGWvm3nSMvkdgpWhmP/+l0hEiuHeUQ4XoDMSrJRy1J9uENaXzWGj
         85vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KHpvLLQnm+0s2ip7c/TcjqSG8s4Eycqur8euWeGF39k=;
        fh=Vk8x/nbDv7iGKQit5os3CoaA9oEekgGq3krurmSANXU=;
        b=aWPV2Q59ARA9+4gLusNJ6Fk8FsAxH2F1V21ZTX45/GZ2xEo3jwvbtQFPp99swNY5rC
         ojADSmVwGslbcnCthCsZ/dy5CpRsBDSEXVV+HyVIRK990Fmj5PBedZTSPfVp92T5Piiz
         4cHRYekIMUMtpEnq2hDE2oGtZqUInnwzO7Fu0m9vK2CygiXckTYANU7DblYvMsbsCkDe
         04AHpSd1VpGH8FmSfL1N39iAIpuJUVnD+w01Hws1g5qnMF4f7DRD6xgB0JWdy5lRKdnM
         xP0NEUTEbOkDpVVcWX6yXoUxZIfS8/Mam/9bg/jebUPOgm2OD+amjjr699HFmGa24748
         qDCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774349929; x=1774954729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHpvLLQnm+0s2ip7c/TcjqSG8s4Eycqur8euWeGF39k=;
        b=k1/y+odyFjpPECkb/3HK78VvLWKCObe2nIw/OBead3q/eBSuvKWmZFXM0ZCgMiShml
         09FIsypVeloj7cJAPTed8t+a0EKTfTOU3kSH9/kTCt5mYb6f/oUJI54eKx10wGnJmJwz
         f7zk0dFkhwxSAd9FLmCH9+giwlAd91maNfTQRhTd9914LXMzuln9hUT4q0Zdv5jfEHjo
         fWhuq92xoRT+vncc+nmSSoxwMnV6ZMavwamFXXq88sUXwrHs52b2oVX03ptxVowsTynj
         NBvgRZ8+n5zEzibdtzx8uXt7J0MBUoMHs+e0Imin3od11WMigZgAPU/OXYyNCOTYlMLh
         zqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349929; x=1774954729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KHpvLLQnm+0s2ip7c/TcjqSG8s4Eycqur8euWeGF39k=;
        b=IzgY0dNt3jq1k+SWhRVwBTkXLyCmbWroUOHlQzqO9/OvlzzpK/WZwb++T1wUto3CGh
         f19Ea4NKbim/XCsx3PaGMVa6cYDX3dRmM8PsB9qJ9BfeZoTmg/VnyDxHH3qtEF+CCLvy
         IJyIQFw0bj7IIP6kUBu9tbETukxC+L1dxX7IcT5jymeDBKY5MIQM3XaAaVVWkyLYD7DA
         BnVEYi0L3ic3gt91sLunCt2QQGWIvIxjvqxr1/lie157dldIbnQN6+NJNzlk9YNhB6/x
         dGA3OrEb9ow+nzXKMSBoYIhm7Uym1neimvgV7x0S9tOyRyA3RKt+r4SGlw8AQLkUT57f
         1DoA==
X-Forwarded-Encrypted: i=1; AJvYcCUIy3Um3ZP43qLejpWjdd82pnUYLItqd41XJv/cExyg3ubb3HofcJOXlIHfAYZPh/l/Gn+k4eo4RCuZ/0gX4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwieA1es8SD0Z5sSs4jWUyVyATQDGRf/meHVdL055pg8y+qd+Wq
	9frCCUJYuG91HbNFyqoPZOXFCQOFrl+y4XwVGygz6QYUSutlBDVtOMkIIqV/cgKFIhstuA5y5+K
	CXbYFG5oYzGUMwK17U5fUvg2dTZBgsJSnkFQmZcBHKlZAfReiOqwpFci1qUM=
X-Gm-Gg: ATEYQzzxR7nEQdbd9apRTq63xHw/ZNHEI4SK84DWlNFYu32NGgLhzhTANjv6G6sdR04
	3t/koI2UrpIRcPBOgrvyEvj6I057CY8Mteal1g7G1vN4C8ZZU5KmhTpytW30et9CA8RMVFy54nn
	Qmk0AIobnw9UL/W70ci6ZXyqo98FvIdKRKC7RrjFosOa4hYnY1rtMXAD0g6yuNa9Uz0hlbWUGeb
	GqmY7cdEeMO33XKr87p1kZ/kp5by4T0qWqPBcDuzJ3hKaAI5OXGikG/ae3AbE9/JmHHqX1eECfn
	4RD/lhJD8rCK5kvhX6C2+R+9qBPALc70yig5AA==
X-Received: by 2002:a05:600c:3b8c:b0:486:d76c:fa51 with SMTP id
 5b1f17b1804b1-486ff03ffa5mr209926245e9.27.1774349928185; Tue, 24 Mar 2026
 03:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
In-Reply-To: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Mar 2026 11:58:36 +0100
X-Gm-Features: AQROBzChC9No4ct04k5xNIFBXW8QZ-WT2wc3OVyceKvhXpdZyi6NGTcj_kNJ-Vo
Message-ID: <CAH5fLghWAQOkH0bDw3vC5UZaCJyXaXn16D_2K8wWOraBcktg3A@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] drm/tyr: Use register! macro
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Steven Price <steven.price@arm.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Dirk Behme <dirk.behme@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 1:18=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> This series changes the Tyr driver to use the kernel's register! macro
> for hardware register access, replacing manual bit manipulation and custo=
m
> register structures with a more type-safe and maintainable approach.

Please double check the AI review:
https://sashiko.dev/#/patchset/20260323-b4-tyr-use-register-macro-v3-v3-0-a=
87daf9e4701%40collabora.com

There are some concerns regarding clock cleanup on patch 3 that seem valid.

Alice
