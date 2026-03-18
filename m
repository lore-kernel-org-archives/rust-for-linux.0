Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38003DC4C5
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844922; cv=pass; b=pAgfODk3BcxS3BKU2MJ66+8scDz4iePJY0m9DTFAac8e6rHueR+42AFl5MmScvshXeFPU2pUKpwakqi61Nn0UF5HFvc3U/EN+HQA2uzJdA5eWdo4SiBkB6TqQrA9pdUwOi4Jkoq3jdBftezrDWx48t6NAvAxrCIbnernaH3wT8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844922; c=relaxed/simple;
	bh=RTOE29KKEh2RCMQf09/Yf7/7d6oQT0Su+sy1NG6/ao4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c772cVEzENz2OPGS40/gqpafQLtQdPwgpExx/sTzPtUh10liuJgNRcz61Mmrnf/nnFquLf0XtrGV4G80/jgucwgNA914GtJvRYG1O0XMO6QrcRx1823Bk+OKogIU/x+HtMvRYsU8Sa7zbdJMaG2mlW3UHxal2zn+MArs5clsL7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHhatJNJ; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHhatJNJ"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0c9994199so147919eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 07:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773844920; cv=none;
        d=google.com; s=arc-20240605;
        b=PzLH3ONr4KEJxxgo7OUV78WBZ9/lIogwmfLBCjgSKemZ6YEzPfM6c0DZ8KQiDMBPbT
         hALJ+IPFGJGqVDLDieHIEmj4+BUrgumisbK1ZY4trVG+vzqT4hTrt9tdbzfNnLSaUKW5
         0XfgKeEk+rHrQGGGXyn3eXoxBRlHZ6D0DL0YiHT2HjEzliZlIVnMnQWN7xTItaNljt2O
         pPrec6sIv9B6//xOHpTNb0CIU+EOUrWgG/vUB6elD1RLTGlF+AgY4PhpFY3EPdCLAEzN
         0BLFWtB/1t0GKwWa+l9jdHcbnI+1Z0/RH3HHjfUT7ZC9R5FfVPjhyi7BzYMhp0qqTSjH
         XbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RTOE29KKEh2RCMQf09/Yf7/7d6oQT0Su+sy1NG6/ao4=;
        fh=v32rtseu5/lyPoGBHx00+w043zhYaTdiiv2aer3XBTM=;
        b=AXD0965G5HGrIASuWV6/hfP6Jaa8MxNGBlsCD9shFLKRAE9tQ0I2Y3dYLS7UXwFwMY
         iGPIoxCOmF7ojyVObSzCbF3+WD7Cd7dkToS3uFovISktdzCFaJXmdfiJisHDTZb3VY4C
         xj4r/dMrYK3s1uByZ14PgniNnka4/o7qENgKahWwJRViG6AiNKIym3Td5paJEBHiqsLw
         GabjnlNDzb1EVh/bfg4S+SSfEE0XMEZSpO2Gd3CWN5Yh+ZoOwWEg3nHYfNW1UHaJOoSO
         msC3Bq/bGrVmCSHg7YR0ffD6ierp6ssUyd40Ii3P1RfxSv+lU451Vbbn8jPPAwNC8x7I
         A8Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773844920; x=1774449720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTOE29KKEh2RCMQf09/Yf7/7d6oQT0Su+sy1NG6/ao4=;
        b=CHhatJNJyvt21ikHjuZPr6+qHwBpJA4tTy0E6e/NlXO4QN/irSUV2UPrRjNdg570P4
         4W4wEsFDisbsvfQ8kUgqLFQKL202dFrUPS218bvfOPzm1IL+YEVD+XuvpaDbzpwEsJ3Q
         DuNUwHjvAr75ST5ptv0+jN/YZqVZ4m9ZT/7jisicTx2ZTQeP+ZmYEucYjHV+DUilrgOg
         j6ZoYOIxYwTAbOfhC4CyHLXGglQmrYdoA0Bwq57Tt+f7dhSzZSGFzUsmrxWi7ZQGx5Jj
         t+uXI+jWUTWy7a15bIOXNCM+0fIhuCvE2UOJfvRQkH0GESU1QFZt69FxpS8e0eUlJROc
         M2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844920; x=1774449720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTOE29KKEh2RCMQf09/Yf7/7d6oQT0Su+sy1NG6/ao4=;
        b=Lcma6APwtn68PQbijSHkLKbOglDIr3tsvEVe/+NMoEZQEJNXhPxNcYuzDMDvaxSMLG
         NzonYefiaggssr+BQxyVD09sgadtIWJQttFomcgj3Hni+3wY2WXdQ2k8XS/MAqXPAy55
         rERE+w3mkIyuLDhTr1m+A/0E+uOVqvUc3t91Li1LM1Q+6hqJdC/gSO+yNLjqFo27yqVT
         1l9cT61SS54T18Q0WYNGaktBzaDq2zf/jv/EfTHAZ85JNCvYZb69r1Q8yLLTNNxn6s05
         q3Ax5NN3HGh3I4M2Mkngj4NycQfVOdFUp+wATtrsn8KpAe8yJoIO+BK04AMpK9f6rA+r
         TNZg==
X-Forwarded-Encrypted: i=1; AJvYcCVdFfyL2jQO1n0ptpWUCM1qXJoT0vZnjXQuHJXdhiv39ccd3iS0N/YT9rla9ZYZQFa4GJpGJtyLZ6I+fx52TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysJYmReatFiBl+SC3CMQDX4AQg2+mgk9UI5ccQbfdauQXrOf3k
	I3Rn+LTe4ucNxCLuQ2yOX3+WuC4EmwcRqZr3DtoVYKxlL7tRMMCR8mfI0VNxleZjzwDUlvdYpGd
	7npj3ojulxBhh7bpe7Y5/ORiCaPT9/8s=
X-Gm-Gg: ATEYQzx9FYDhZC8uIQFw4tEIGcjeL6T3veLOk3/zRZT63ohflxaktbVPp0oM6G39pgO
	IT42WaEmuT/FnxpPwF8nMpMkIjlGFnI8Pk3YfF3QjLDRrydC8S2uYUqTq2UAO3XpL4tFkxlb3Bn
	SXqwhx1i3He+Bz/4iKofAfwcFL7YngEdsFdzUML2zJWGpoj8fycPJobck8JLxGfCmhrIMpqXU55
	EX6DOs4kDTD0N9q5FdxNFceb394bmRyKyo8MFt/rcQO2yupZaEY5CiXhnMuVAQ9eRz1irOx/jsn
	5RIVNwH04TwZl7LpR5t2lSrYP/OO9dgjnUgLnsm/zy4N+LU2SOJTo/3g9WbV70i89Tih7ECSOtI
	CIRkx9gayW1lptsFKKrW9aK8=
X-Received: by 2002:a05:7300:3724:b0:2be:1f56:ed32 with SMTP id
 5a478bee46e88-2c0e4f79e7amr877942eec.1.1773844919477; Wed, 18 Mar 2026
 07:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
 <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com> <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
In-Reply-To: <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 15:41:44 +0100
X-Gm-Features: AaiRm52glbQ5k03i38HLvFJrknMe1XNNnKvvWBogM8moiNwsNZDgYGGN20TDKPc
Message-ID: <CANiq72nad-60tOJeAfkvHTFrWXQS_wbG4JUGQNnkjm_NvhhaYw@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
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

On Wed, Mar 18, 2026 at 3:31=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> In principle this is possible using
>
> #[path =3D "pci/pci.rs"]
> pub mod pci;

No, I meant supported natively, i.e. without having to write an extra
file everywhere (which could perhaps be simpler as just a symlink
instead).

We could also generate the `mod.rs` on the fly, but that means a clean
tree isn't great for tooling etc.

Cheers,
Miguel
