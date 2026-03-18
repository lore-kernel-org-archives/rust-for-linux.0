Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDCA2D738E
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 18:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860244; cv=pass; b=CqLF+p0dTsHQ454bpexuVJCGTDVSnr4w8j3pzAw1x54BjLh+MHfwDwgV5kePo+lKzJR1B1fazVEhdZC8+Mm7Gw2OmnY7LFZDUDLiZjv33HfyqEllT5lPW+NbSzU3eSPk3pZ6UMaRBx045Icl2m5gmormt4wBMp35y59qSu6wQxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860244; c=relaxed/simple;
	bh=VupaCI1OwER3l7ohvi40E+Y56v6gbAu+x5/VVVtmeFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpIItQwo+NBU501GAgyVIpzAx2Ix2z60DJBvDCvE2YIWLv0A6pcLRJPxtVXKZsIOXnEso5RjMGJpGqb2qiC14Ay1eltxC/PAv/aMX+o7hlYGoasNhB6ywYeWyXN/6PAP8SbQyZCtoyH0xtNTFA+ntWFjcJKWAmhIYg7oC/MHjl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2A17xX8; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2A17xX8"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12714f01940so25273c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 11:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773860243; cv=none;
        d=google.com; s=arc-20240605;
        b=KEjHeRL9QDOIINONjVsBDhvdj+zCEl8iteMMj0Xp3UH4FTzTh4mrZBwBMdByeJp6/2
         fIm+URwpVQwj5h6AnxfF7XiIJkGUTXpLTPI2EbhpD9U8Yq0Kwk+FAFtl5+mjUnwWuL6B
         fA2IVXoriaob9TrqMUcBgdbM0UQFOlxG97Y1Tu1qpXt47UJnM2tWWY5qVgM2A6cX1LQU
         5hnZ73BIuqiGiZFKctynamvxcAR+YdcKsEkBBe9wC2/hjvmEe1fBcc0S+AeoE41qlKzT
         ddAYLbHEwu6xBPbn3APvUeSd3CCSy0zn9enk6MjQtkqm5AhzoUkFrgSoTtI6QOz9xGPz
         0t+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VupaCI1OwER3l7ohvi40E+Y56v6gbAu+x5/VVVtmeFc=;
        fh=RffO9P8e2714KcaCHEIoD5CjTQLzpizuhvxVOwBAcjg=;
        b=QFs7t9V4r/l/XuHGuJizqc5PIX8zn5S80yLEdDf+hXfSPdShP01wq7gRJnhP5lJkNX
         ebGsx5l7szN/eUEHO6SVtQu9n15ShAdeSEDe9F1y7PygtsBaub1+cQZI2ZeeMOky34IY
         TqTv68U4cFMKs4mwyo54KD7CNU42s732zKmn6MlCGHiWW2um5U2kUBsSCf5xLqXEYUMk
         /v3ubABC0dXcyO3pWjbpSPL/MJLOrLPhy2moG3N1cRWIB7zryP9SuHrMCuHNPIWn3W1E
         dDbqUWAGkTNQ8JTyWiUj1pQ1goTb4IcvYoVsIL2rrc63tOLWLY0OrHc44ZOhpi4IABwA
         vO4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773860243; x=1774465043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VupaCI1OwER3l7ohvi40E+Y56v6gbAu+x5/VVVtmeFc=;
        b=G2A17xX87xyMH1dzp54YJNtLJNegkpLBUxOAo72HevAParB3VTcSAk17TM7ahF/sQQ
         RlASRGT5/tLdBDwlHuKdv0RDc0YEbMaHnY+iCyjIAt1bxctLJkwznYUD06ySntITHGej
         MXTGYpVqcbz0OTnhiJtE7JycWw277IP/39FR8t33hlDa6DPWvONh2l2vPM2QwLE20bvW
         V4R01ZRc2O3VL5rBJ6jKLo+BsUOz8zrOacH969U7mZGu9vafScCwEwm+E/AODHvzD9ZL
         goCnsb8gWjW/jWA1uguNdvs+j0/11pGX1rjdOlamsxZo1D0fGnP5r9vWYEHn3qCew8KE
         UhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860243; x=1774465043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VupaCI1OwER3l7ohvi40E+Y56v6gbAu+x5/VVVtmeFc=;
        b=kV2l1y0GKHE//ce5IQQf2wDS7EPW0xTjS3PCgFJEUJBBZW3wtz6z9U3EavmGljo5it
         fZXMVS1YJFuloCBDFOo0r+FuzzsKhAJH8G2jNcXZTnxSt6TzZDYX1qRZO9Y3Oq99Rmy6
         hf/YQGa7czHfQ3nIJA0r+5zrisNTMA6ifc7LHVoTeKusLoDlse7/E+vdNct0cEcfLUdJ
         lCDHQYVu+b1kQeSuFkh+5aFErwxe43Vs5UvVPcjpcwe73A74qGdfi5lyB3aEPywKmgba
         OVPYhGv0a94CNpPhCsfezFgxfrlfKBa2ENWxsx3BINn+0auqVQ4X2t3qQRl6HPp77eka
         hOLA==
X-Forwarded-Encrypted: i=1; AJvYcCX1SEFx4TNhHQQac0Tb/4VjteicWIeHtiaSq6/a/KULR0z+RBfX4+GA7uzNVbYQklGqIuAHCDk7AHEi36CUmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFCEYxUgUEc5HoxlIaDFwCQYwWqGg/yDMk3SYrwITi2XaCpPU5
	HvLLgIgBQhtqLfia4RHr60BRLmOMrP6Rbbhr7Gvr/vpmbeAI8u0ExEyI6IcKIm0AbljhtUws0tQ
	YnYgge4DVoRbmNj0JEkV7zhFrAHI8AFs=
X-Gm-Gg: ATEYQzzI0URnKjUMKjnQKceTzQt3kmJ38+u61+m13f4MVVAwqpjBttxNc5X3dMqGWCn
	vG73KQWXRtgJ7JcEyUZGUC6vKuyVsNrIZyX1LKXVDH1Y3FSc1u+bwRSrpHQuVgIzsVK8JUlhdfL
	kuLUES6MWw+KlfvTE7fcLb+4q849OpbRCD0uIXu2d8atPs/3YD/i5nwynmNNQwmEzynPMnGFnLp
	2rJWix1JTPX7ccm2sY9c9oTexFdrbSxkUUkFQuoa7nQ0/6WRp+i79e+UAa3aPj1CyfUZjqesWNX
	9Qgkd2b9oIFAd9TbE6QXNBlzg4A+mZAy5ED/r24QzgweCtM3Gkw2ofXLlEPvxAjMAmFKboQKhQB
	yVkESbsOa9T8mNvfvm0V22ztW8l+fAz9I/g==
X-Received: by 2002:a05:7301:658a:b0:2bd:a3fa:9bdc with SMTP id
 5a478bee46e88-2c0e51afa4fmr1076751eec.5.1773860242532; Wed, 18 Mar 2026
 11:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
 <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
 <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
 <CANiq72nad-60tOJeAfkvHTFrWXQS_wbG4JUGQNnkjm_NvhhaYw@mail.gmail.com> <DH5ZP3IUEWMD.TOOZSEUTLV85@kernel.org>
In-Reply-To: <DH5ZP3IUEWMD.TOOZSEUTLV85@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 19:57:08 +0100
X-Gm-Features: AaiRm53Z-cAG5mIpOPhPdv8BAXPHEZ1FbMlHxMtUEupEIZpM9NVL3ZvZ5w4-nno
Message-ID: <CANiq72ndoX123PKYr4DbJpvQaM=1YjYoYhoTq7wMoY51X7PuNw@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 3:49=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> What do you mean with extra file?

Right, sorry -- I was probably overfocused on the `mod.rs` symlink for
some reason. We may have talked about generating them on the fly in
the past too, I don't recall anymore.

Let's assume "s/an extra file/extra lines" on my message... If folks
are OK writing manually them, or that we generate them on the fly,
then I am happy I can get the option I always liked! :P

We can chat about it in one of the calls.

Cheers,
Miguel
