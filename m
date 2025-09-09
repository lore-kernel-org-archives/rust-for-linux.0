Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721BF25A323
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 21:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757453805; cv=none; b=mDjmKm+ghenS3NpvkAGBT18iy2juTU7kPVBxtK/n23TTjZmIdJsETMhi/W7moM93MhGnJVPol3g79L9eLyn13sboU00mpopy1WHxWvw3sHVoa5bEcLoyfvUYTkNWMDPL8fg1WUFCO82Th4kYXH4SzOSVwEiH0jjvaHJOTEKsasU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757453805; c=relaxed/simple;
	bh=Tri659oiLVCd6VfYpPQXtF9OQ4WThWRJ/JELvDiFurY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoBioQkxo20T11R3YCFmfKWAJmU/qg+1zN8pulN9Z5ccMqiZhl0VczLKFdr4Ooz+O9xX2tkTzwg0Zba/OYgxadhThgO8qhoa6axD+YVDkdwAhzpxA+vGgiyltFyo/z/PQ7CqqNPjYdLZ5p2o0kFylL9Q8VrmSH/Lhv7MsYXNicc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWKG5jW7; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWKG5jW7"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32be3e6a0fbso393151a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 14:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757453804; x=1758058604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tri659oiLVCd6VfYpPQXtF9OQ4WThWRJ/JELvDiFurY=;
        b=gWKG5jW7cqM3QeJrnd0PNEW6HtxAIeScA6Km2tXIoKBZ7iQiW30GmK4Ob4XJKjE1H1
         fdOdktI+wQJ73DFJv6Ddqysn1ClRfwRCTigR8jnlIN+m4JF156e4JpPDxamgJFN8g7od
         Yc17Rgr6YDW/6//W1VzylR4xsfqAUpoCWSE2VPyI5J/lX04cdXkmtvZ5FR2UPHPKPGAU
         X6gHCHpr/Nf+b1Fvrm+B1WaUzKx90jHdTCoSBiXCNSGU5vesVgWAVp0owZkdWxOvYn6Z
         HkeweyzsF+yniu0QA1tEa2Sm5T28nTA9WQiWiTrq2gYOD5rsO3BToNFuUGh2NXh1V//c
         TyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757453804; x=1758058604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tri659oiLVCd6VfYpPQXtF9OQ4WThWRJ/JELvDiFurY=;
        b=l9u+HieuehkV0t34Pqrl8G1ZfqdCO/F+jH3gkBIjLFdk5r1/0o1IRJQ9OxbhTNE7iJ
         dn/M3jPytxDFyq9ZKPRc6FFTWXjLhZ8bpMI/9gkTVb5IdVMt9N9vvY+bcdd8iusz5KaT
         l/Ihp0tTiWmpv9PYCSLlugJnkhx/k/I7FFSXmw4LGPuBmVFdYZrroe4WEZt7MqcOkMMG
         nGUow+O5wScyyi9Hs26O3mhR49G+MeFNuw2WfOP8CCb4eRhIEvCRfPwb2LEYNVoIOI8w
         G8zUrYUIlr2pezXF05CoLN0jycR4Hv75gcscJC7aIsiDNZds+VLZ8v2qGXVhidrdxlwp
         ETgw==
X-Forwarded-Encrypted: i=1; AJvYcCWSsLNWTUe8VSNlEfyGDCSob0BwVrMYkbqou9rp8oEqwkXH7hlHfbERPoogqd0k3gbOIKF0gFFrHBDF6JAh/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+HK/XREO9D6KES9d5ircNgn3E5uzbes1mbZs94YQiqMKOxdtg
	oThHagz08dwL1Kg7INXSg+6dyGAFaQbn27WV9/JOgUnCGUSroY+/XwgInRQPZ2rM1K5pi6q0kSm
	OoZVdeqx06+Nv4iVKAHrklvWwAdzYrZ4=
X-Gm-Gg: ASbGncuBizR+GmHYLwdXbFhY7BMAgi46QdkUfEff0zwqQPFRicSgLC1PufKGNQ8M7oM
	SHR4fvodCpTe775DKa0wntvPaNLxOChYOLLs4XZQOUXss6GJg3LALfb+sXCfc5dbuSvdfLVWNI2
	WSyQN7dnNsha40BsbDlF/hv0e1f/0rrIYfujhM4WgU4yLB9y6ZVmCn7Eyh5ptuskZFV90rnjYdV
	oMLd+vpeCKo0oVYMYIvcvwbkUdzZWLCAYU7qic0jD8ehdsDOsC3tBHiE+rDL8LQ+efmy+QHLBkK
	Z9oQtiZnKymjJ1Xh3ShnRZ0m9M95iEkZPaXC74UKJgvMElM=
X-Google-Smtp-Source: AGHT+IGfWuRbBLApbA1biIsSRGuFYUHQhWq6XH4sIOFxuFSe8wgAAY/n3W+S5dtyGYo44L8oScz+D23Y+e9Y2jG9A1c=
X-Received: by 2002:a17:90a:c10d:b0:32d:a2c5:902a with SMTP id
 98e67ed59e1d1-32da2c5994bmr2271358a91.5.1757453798983; Tue, 09 Sep 2025
 14:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909212039.227221-1-joelagnelf@nvidia.com> <20250909212039.227221-5-joelagnelf@nvidia.com>
In-Reply-To: <20250909212039.227221-5-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 23:36:25 +0200
X-Gm-Features: AS18NWBWIRvK8uXY04bEb1NxF81YxjlANyREK55xtT2E0vJdhqdmuYSI_9VSyBo
Message-ID: <CANiq72nPQps8ow00AmUe3shArHyhCUSSJX4=6QPHfHQZ_QeqcA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] rust: Move register and bitfield macros out of Nova
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Yury Norov <yury.norov@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	nouveau@lists.freedesktop.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 11:21=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Out of broad need for these macros in Rust, move them out. Several folks
> have shown interest (Nova, Tyr GPU drivers).

Please Cc the rust-for-Linux mailing list, especially so for patches
that add things to the core infrastructure.

I notice easily because I tag the ones that are in my client :)

> [Added F: record to MAINTAINERS file entry as suggested by Yury.]

Please don't use [ ... ] nor the past tense -- for normal changes,
please use the imperative instead.

(I guess you picked this up from other [ ... ] notation, but that is
normally only done for modifications of a patch by someone else, e.g.
by maintainers.)

Thanks!

Cheers,
Miguel
