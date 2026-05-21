Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6602A41754
	for <rust-for-linux@vger.kernel.org>; Thu, 21 May 2026 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358490; cv=none; b=D77TsL0HWDN52Bo33JGIcZVo4GcI5xky7F7Pgs8oUURS/cUk+WwyRMlPPisRu4o674lcHOfF1f4m1Wwyv22yDA0cuGCSNoWageDArK0EKiwtPt6/WlaYXVcBwf6dPguLJcEjVkIm1pHRVga2V3duMaQpC4glAhuapbNhBvFFVSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358490; c=relaxed/simple;
	bh=qQMwPn7/lfIvsYleutoUSdCGdr5YbpqsWWM385H7f00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLPou+x/D8cVtYeCv1p29SWi+nV1OsfyyQEm0cng1VmFjev4G9MtwZ3yvefE+kKtsBUSlSYsZkpj+K4OiCg6DG/1HG9JbXwh2O/luEWoO6ymNJST0BEIv5PTrDK20R0m9TAl7GfP/zXBqk1gXo0WJ1ycwowXUte6GQ4ycfeU/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-484d3c0855aso2268831b6e.3
        for <rust-for-linux@vger.kernel.org>; Thu, 21 May 2026 03:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358488; x=1779963288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sd7k3LYNnD6K4NFyQw1AVAVbnXODVWOuybVQwPcxYzs=;
        b=pIIR1OfQMapPE1Et3wZ6MSWRduV+lYcvVhZOCqYYcxcX23IBnIm4hfUg9cJWApSwGT
         5otrRv3dDghPlNaFmi+AEKJ4hWjcYWMb6eTS/SuQ9eaoYRQWWU+2V4z8qznfWlCazwUI
         kTK2lwdK9bX/PkgteKZcxkSLwTikOQxi9lo9XMc0cwOsI7K9UnMWHVK5/JB4h2Hhm9ie
         v62BUk0yx1BKHi4xMEwVL33/2WNlIpUNV/CVtvOPx4w8SEQanEPMJWlmIhFKSW9cH0OH
         GZo3M/rds/Zq0/cDSbUOB/VIuDXDlC5LTsHg2vOrXAjsG4rrCq0Po8f1n+l6b3++dmjb
         lhpg==
X-Forwarded-Encrypted: i=1; AFNElJ+wkOZYjhCtr3kCgA8TfuR9NWRe3zkXtUobB7rwRhoBJaB6C/l3zvQpCSw7nVZYmhJQJfnbPYg3rWdapdmrRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyorDz0kpLAGtdCg8M8xtwFSRilVQ6p6P/XEAeq6ARfVL9Zq7r3
	cb4lTKXjb28sG2qC1mOiLf1tfeEZaIqtg6yvVDwgCUwOkJyP4VZDNaD1z1H1HWvt
X-Gm-Gg: Acq92OHE3c19kwfm+jm0W02u1wt9XIIrvCT0OHLIu4BLkvk+O7LWv7E+6hHWSeADhX3
	YBqf6M1c/wjjWz99z/71P/bFLS8B9SWNZOP2HCUfURzuxNe9sMcGC7zHOrkRGPWjFCWM0aWiKLy
	OvUw0HcgTluPjb6+CQn9HVY6aiijjon9gl85e1jYRqUfmB5asjN+yjQkeXO2g8SkM05xq7FphPL
	c+zapTYI/LVMRWI1gZFVjpU5UUfz6lDsor+g71HUxTkgXaw44m5+MLXJpts59wTNCu8ais/7/lW
	kC+aICv9eOMS5pS89f+Dznal3UdDmj/ltC/A/NizcqL9eQEoJkPl7iAO602IIG6leLKdTkpy/sK
	0yNEgP0j8pumAcdDwO2UvUX/LVhjKeFc+Jd1h3O1EQhF1NUF1ala95sbEJ7Da1SfW9gD2ajfWns
	RH3d4xOX9lYVd8o+6WUUrlXg5fKQ7Dc1AlzpTbQM8PnjSv6iKRjhatfd95Xbs9SZ1NCw5/N7byZ
	mAoSTu0b+Iik5dhbaw6BF9xVYKG/+0zoUEj8L0TcN/+MwPLBLzPt5ZKsO4BDDSD68t4ohSTpw==
X-Received: by 2002:a54:4e84:0:b0:482:aebb:e7cf with SMTP id 5614622812f47-4852ed4378amr818436b6e.41.1779358487831;
        Thu, 21 May 2026 03:14:47 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482ee38a5ecsm9686684b6e.7.2026.05.21.03.14.46
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:14:47 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e4de538f83so3461650a34.1
        for <rust-for-linux@vger.kernel.org>; Thu, 21 May 2026 03:14:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8/hkpCjMy4/ZqrJjm+4dJ19wuVSZ3TrLP+KYYbChie2p44ueNgIVAFMjadgys2QcdNRyeSNRkHlLdMqICKDQ==@vger.kernel.org
X-Received: by 2002:a05:6830:3141:b0:7dc:dd91:b5b1 with SMTP id
 46e09a7af769-7e5ec03344cmr1089299a34.5.1779358486210; Thu, 21 May 2026
 03:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-evolve-to-crab-v2-1-c18e0e98fc54@chaosmail.tech>
In-Reply-To: <20260521-evolve-to-crab-v2-1-c18e0e98fc54@chaosmail.tech>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 21 May 2026 06:14:09 -0400
X-Gmail-Original-Message-ID: <CAEg-Je96T9hQ7GrwWo5pzfesBdumEhmNtnnpFM+7jdKDPe+RZQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ku0c_K-_Ko4PGfdu84e-M2GHJhf2RMMyNarSTSj4XW-x2EBje0JdkBkmc
Message-ID: <CAEg-Je96T9hQ7GrwWo5pzfesBdumEhmNtnnpFM+7jdKDPe+RZQ@mail.gmail.com>
Subject: Re: [PATCH v2] Fail the build on RUST=y and RUST_IS_AVAILABLE=n
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Trevor Gross <tmgross@umich.edu>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 4:32=E2=80=AFAM Sasha Finkelstein <k@chaosmail.tech=
> wrote:
>
> The current approach of silently disabling all rust drivers if the
> toolchain is missing results in users that try to compile their own
> kernels getting a "successful" build and then being confused about where
> did their drivers go. In comparison, missing openssl results in a build
> failure, not a disappearance of everything that depends on it.
>
> This also means that allyesconfig will depend on rust, but since the
> rust experiment concluded with "rust is here to stay", i believe that
> allyesconfig should be building rust drivers too.
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v2:
> - No longer a RFC, let's make it happen.
> - Update the docs.
> - Link to v1: https://patch.msgid.link/20260510-evolve-to-crab-v1-1-208df=
84e67be@chaosmail.tech
> ---
>  Documentation/rust/quick-start.rst | 6 +++---
>  init/Kconfig                       | 1 -
>  2 files changed, 3 insertions(+), 4 deletions(-)
>

At this point, yes, we should just go ahead and do this.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
