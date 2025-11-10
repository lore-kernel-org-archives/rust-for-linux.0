Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C617A3064AA
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773444; cv=none; b=RRpnhS9r3aStfo2qrJEjxyfIt8TfTRt5ZheMY7ttAjxN+tFvLt8dVwN1j1AcM43O5J0QaYoHJvVR0bSCQxjlmwWcu8ZnZK6xMJ3BpMlX5l3APsl4AqTnivd1jKT69CuSmUEe0cwKRvCxaJkg9h59NYembHubJA60eCN6Xl9nW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773444; c=relaxed/simple;
	bh=Qe3d2RAqo7YTKqv4jYgqUMxYnjMyEHYM/6ALuA5VeDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZg5XYjkU5gXUBQmeTv8gdANPJ1mPCVVnp8RdY8f+K4Fvcj6Pq9qdr5neOe3UmB2ALZQD2gJF75Jj8MjAM+uLfYZO8hovP4fTkH6SJ9jFH8bj4tuzC1tqg/2LB3Qom5JoNv4yr7bGJE7jzR3BcP3zUnKyL2hQ0ZU82KP+sZPHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H90T5VYd; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H90T5VYd"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a33bd356fso4123761fa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 03:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762773441; x=1763378241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe3d2RAqo7YTKqv4jYgqUMxYnjMyEHYM/6ALuA5VeDc=;
        b=H90T5VYdjMAn2DU/l789CThU9ybdM9HDtaPfv4+VVYTlb5o1bXOucbWJ9NrMvKo+mv
         bWERo6YD2uNoGA1ghAwukLx47fz041VPjx534b6BOsRz/viioJ5uVKX8OAwKB5FXPvCZ
         NOOl0OtYdqgLxAiS3OmMo9Q3b+1X33fNgkC6jD4yHjpu/yPidtSna3HWvZDSCbHpIR1l
         Zc+xp5wvElJTsnzUGpwZVGruYHlI4t8QDBta/d7u0kk9MRKR8/XN1w11ybT1ynANJ4g7
         Zp8s/YTkxShi9cZWSy1yB1YZ8RLV7njLLokQT07txxHd3EbKuB4rEH+omRwO3eODimBE
         lpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762773441; x=1763378241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qe3d2RAqo7YTKqv4jYgqUMxYnjMyEHYM/6ALuA5VeDc=;
        b=vrz3bDCdbMk0fq+rv3JHB3m9HDe2E/80qQ3QCcTQMyt02sqNL4Nz7NOVl+FQwueTJo
         gNHG9O+hVhR8aRc3a28ZBCUCMTVEtjJHxQ02se4Vkm8Vca6ECiiwnDVKyILlIyRL56hf
         GTHwJgYrydSdGP1rd5kE2r36DikdL4S7pzcW82Z+quCC146t9N7nUHcliMd9Jq74dopR
         ctfdTzLFwn+CixDxoQ3cxqOvexlp9AnePwJZtT+8uJxph9mywX2wqHFxQ6euWu4w3ytZ
         nh5pXgL6FT6mf9nVXNyED8lUgqmc3AgGwSyo517uxvISEozvu+2mzfyYCukVbVxhX7jd
         dp0g==
X-Forwarded-Encrypted: i=1; AJvYcCV9uuuIrbKPj7kn/7hfPV5e004zeyuhd4pj4VjHrRc862dZRK/Q2KlzO8yAbpxbVoNUbIQ6rK/WhTVQMrhvOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw88HRM/LUK93xralTMN70zxWbce+ZnS/46BgwVMlyMXavKfbE+
	/kE7lftKgVPpRJIpzJ3Wm4ME+Op3aGaCD8L6HF3mlIi7oFlrZE+AXKs36XUhlbjRxKXzr8zUddn
	4dkIP+VT/Iv1pGUu70P6Ssalfu7c+QvQ=
X-Gm-Gg: ASbGnctn9A2s3eyZLRuSJ8Yt0r2tMldkosFZjd0yqBn+sOezVHUBxkMcSHYtFJZWhVP
	7vzyWsNSDng3veS4/w3Ylset/I1sYOFvN6IPhwcDoEPemOxzADXxNI2+eR/9IC8owfm9nGo+QWL
	o2RSJ8qvUg4MJ5AafQDbfMzgPRSYfow6dwX6QkgTv6cHGWCCtEIHDEQcyVSneHtXJ+CXPCzXtnX
	IP2S89aZarMn2dK5OhFMhIJSznMqDQqlS3VMA/8PoINdH1tMvWr6MsFU5xxdm7BxlhfQoPPGL+h
	Jp+gw0sAmlgVh4AX5+JTMxvbju30DkF4TkFr4otHLH0kwiSt/S9An8NV85Ii+tRMYjuOmjH84fR
	dAJw=
X-Google-Smtp-Source: AGHT+IFBdQ/Kf/pBba056RwUp0V08lYe+9haO2B8HlujtJik6R+WJ/BwK9jrSO5+6zHV9sZYoG2V1Cx82A2l5RDsRZI=
X-Received: by 2002:a05:6512:104a:b0:594:253c:20ad with SMTP id
 2adb3069b0e04-5945f1e1fa8mr1168234e87.5.1762773440599; Mon, 10 Nov 2025
 03:17:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-5-ojeda@kernel.org>
 <aRHBu3RoOLTrMA8n@google.com>
In-Reply-To: <aRHBu3RoOLTrMA8n@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 12:17:02 +0100
X-Gm-Features: AWmQ_bkXotkhTxYYTuTPjRF1aS8uhIalsBfLfpXM8Q6vG63LofMfHcNy_ClSXmQ
Message-ID: <CANiq72kdkTif=HHL9ypoztDc8JiQUFCEuKyigQ_6ujXjR=cTyg@mail.gmail.com>
Subject: Re: [PATCH 04/18] rust: kbuild: add host library support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 11:43=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This is a library for the second case, not the first case, so it may
> make more sense to name this rule procmacrolibrary?

Making it more concrete sounds good to me. We can always rename later
if we find some other use.

Cheers,
Miguel
