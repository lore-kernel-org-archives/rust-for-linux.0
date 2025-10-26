Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269202046BA
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761495077; cv=none; b=EUFOIWFnbCidLpPs2VY4rHe9CmbePCZscK4FnizO3ZCLdJTFxurK/BHZiI9lqqwCQNpwPQl4HUCACAXWwQl6JoOQcNa49UOcdkiy9WC9JDG+9IQBVRJDyzZ5ZYmrMawn5JlwNMBPkPhKt6YSqiulz+4kVb5MaPxpK0NEp5s7Gfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761495077; c=relaxed/simple;
	bh=b/cnNI5DLYSQ1LNmhLxai52Jbx0+rBEUqUBkQ49bPvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBoEUQG3wlq2HlHsNPfnv3Wp0LjvhC0+JVIkaiSnBtaMK38PH74AP6UqxD9eqi1iA++h/pS5+MNVRZNtuhhj5oVW+y25AsXpdPfGjbnIF0QO/Bq6tD54AZEUx1EfdA4fBmOtC2w0o1CbHBTMJISmda0jafDaz7jjKGvMGKyQ36o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0o1OXDJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0o1OXDJ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27eca7297a7so4207825ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 09:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761495075; x=1762099875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQau2nuAPBGeqn7nXR606yrFTjooTnZ5gmJ89ZW511o=;
        b=G0o1OXDJR4Ov9pbnT2bujSglqNdu5axd2DEowrwhS11c5CT2QbPH350ozcsznhu04m
         Myu5+hMer9YNLsGvLtBQsv9jVlCeFmk2xU7Z1hiV7Es8SlxRQ3N3wSh/S637xXuxr09/
         C9bF1mFkWuWpfnksn1nZ5azTDWZzvViPl+6b/py9Z93tWOD6NqMZlZnShMcHZt4tRqui
         MfC9pJfnGFpC2ri06gggGe28yGOXGhkTQXCvAu9GveMjx5EQW0oUA0A2tn7AZTVBxhVz
         PszKd8Z2qdb9sE6wVXuBBf/PR2DxYacQLxv21qGASzErsvJPHHpPLU6Joc2CY6YTYIYB
         J2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761495075; x=1762099875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQau2nuAPBGeqn7nXR606yrFTjooTnZ5gmJ89ZW511o=;
        b=hCh6OuB9LcWi2u30gIzFhYGHxpt81FkhVfroz8kz8bb4jNWsvsXusPuuMQGNHc2aGO
         AXo7ZnG128/45QLHcfepJETa54HZ1cWs4Oc+rghU4FpCtidFZPTCe7rhmuJzsLhzZg1Z
         cf4gt1LF1UI6eGzbgby43pVgn/QgGlQSnyf0uay4STNYx/Icm0IIRo3nbVQaQ03fS047
         S3ggPkmBhSR3NUs4whoBJEPIFuBozJ2gwtVmRbYd4ZNUONllCWMdNIkPStg7cKk99o35
         zDyBlShwxf6T1Qpqe4oDtflUemKwWJp7IgRan1s0TY2KnswW+AGxo/ZQ9QMtpMx/lWEA
         TSuA==
X-Forwarded-Encrypted: i=1; AJvYcCX6pO5mrxaM2tP203K1pA7BrzOEynAh27cbZyvU78zEqS1811nc2AuGmTS+xk6boovvHWjwqzHNPjgi3hELvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0zAceqejNGOtIOGTJrIeoFtzx3YfnBEZk2kZwkTN3rkzMXe0V
	OQF2BKxXW0LAwrGUMc4pwak765hFYGZg6X9bVZLkgobAiinMUWqQudIv+6C1BZn34up4DtIFGJK
	gs1Ozk/yldfxDx9pH8OaX5tY0+8b/OVs=
X-Gm-Gg: ASbGnctjc7qfw5ZZqNfOZePmiJfqJq7zqtCNepuGAQ3sLrHndVN39HH7tgib7ei+A1X
	yMeknsEul2DDz/UF7PIK2c6Kn8Cc0FjOGyZevNO6nyQo3WFtF0uRihv6Lw6kQdxSGHgHYdpuEQb
	pvIlDOfGKLPJUG8Ft8R7nJGYW2UjhRYnaYByJRL16faIj44hhI3oWFPvNVDbOyZQWhrE0jQxNzm
	TnejLYP9mDwfCjQ4l2+ZrRJoDGRXoHB8KYv5Yq8nR/8azTlj5lt+O8vwMBIPonvUl2DjeLaHaoT
	5eL4+c6dAFu6l5169dRSNy/1Yv3ujoS9EWTpOE5hu98b55Nao4rrb1MuLPcha3j0aaORmfgT5oV
	uPIQ=
X-Google-Smtp-Source: AGHT+IFI6sg3xeU/Y+7ewS/quTbjQS82OqC83SGue3QsM3IMT+1H7kuNPGEtqVWO3pz2NXoXOmWS4q2L435vkLC65I8=
X-Received: by 2002:a17:903:1a0b:b0:27e:eb9b:b80f with SMTP id
 d9443c01a7336-292d3e50f14mr137740975ad.2.1761495075335; Sun, 26 Oct 2025
 09:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com> <20251026-nova-as-v1-7-60c78726462d@nvidia.com>
In-Reply-To: <20251026-nova-as-v1-7-60c78726462d@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Oct 2025 17:11:03 +0100
X-Gm-Features: AWmQ_blYJsh-bUnlNpdDu-je1LAAZ23ehLx8sNiiMWM4JI3qmhDsJ4Jmtvqb2i4
Message-ID: <CANiq72m9ms-OznWQ5+4_JvAs4yruwgBRcm1u0gCAnasqO8uJOA@mail.gmail.com>
Subject: Re: [PATCH 7/7] gpu: nova-core: justify remaining uses of `as`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 26, 2025 at 3:40=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +            // `as u32` is used on purpose since we do want to strip the=
 upper bits, which will be
> +            // written to `NV_PFALCON_FALCON_DMATRFBASE1`.
>              .set_base((dma_start >> 8) as u32)
>              .write(bar, &E::ID);

We are not very consistent on this yet, but I would suggest using `//
CAST:`. We are working on getting `// PANIC:` in Clippy, and we could
get others like this one eventually.

Cheers,
Miguel
