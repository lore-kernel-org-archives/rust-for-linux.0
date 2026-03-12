Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69246366810
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343224; cv=pass; b=i7FovDpaBF7Wg6ZCXD9TBRHNtPdfmVb+uGnbDx5tjOKwPtRE6oTi18QyDXW2U3fEjO0d00wLIVhlj/UCTVVJS5W4ev551MeVPFxgwJBiw13mifVLn6JDQZyLgAG68nMzpDt0CMI7igZd4enOn1EaNiStnDqdRjKPTL6X7DK4lO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343224; c=relaxed/simple;
	bh=v8TcVZMFN17vUsn7UZbDMvcZkQcIWr9N8al4ytTMSJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1184vUpHjOfP7/lrxFQWDWK6ooivlMDtL2UG2qcaOD6PSznpIZaFH22CvAOCPLYLDa5fPhEJnv+eYxQh56L1Hxjc7GNTHRdLXbpC3Rq3OavtdBEqFWOOdgInXSVADjc5dxYHFRh/nMTvRUzbIvNbdNOJS2JIoiMSrXlLSiB3N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meSJk7ey; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meSJk7ey"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-124713e4244so72918c88.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 12:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773343222; cv=none;
        d=google.com; s=arc-20240605;
        b=VUNv+kos4vBe33L6KumIwFXiWqDxLaHUO/dBdwhrz5uZU35jGzLTQzxscy0qNCOiQO
         edNmd+P4cnSua4hPI6XV2QYvMgf+Htf0Px54nQEOIJfBmBc6ZXIX+fQuQ2jlFPSmXJgU
         da35M0mihiuRC/oZ6w6KMwoFQAICHkiuksgA3kz/zncuWblxUZWk8cy2cIJdy3w1Efqq
         nWbBps4cCDNJBEh2AZgGhzDjatmKp2aK5c5ArVwyOlnXN13sKjO4235CBCM5jo7L/3LY
         0cX9ASbCq3QMtYcjVc3GBBs3wCWoGz+1ILn5aurax8EquNaH/wyKco924xOmcmaDISz9
         0rvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sqyBefgbThwlgKP9KCSuGlJgdIuR2RT0nMZ3gZqSKA8=;
        fh=yj5HlwZDBQg5KuXaOh0jsco6stbEOhWgBvhQWi5Zi6U=;
        b=Rzoynyc1L4MJW4DX4yxOgxvLIHcW2HwM2qZ4c81qxYKiBF4Lhiboc8qaEcLlztj+h0
         MGwK9nzruHdwNuxdDXiA2OAZC+uDsG6o5ladrwYM0wX8WqiburHw7wVz3jD726YOhIC2
         RqEYnh/OLazmt4lYeXJG7L2Vi93/e0ju7AUURxnhKmhxIM7Q47CRGdGagQ4IkfMLLsm5
         2yb+1UQUFLDpC1rpAYivdnJIUd/JJvlOrvK0uH+AM0QUcR0mPgEa4CP9pbydRi899guj
         IM9JgLpahuThZTREgCy/F904+c2CxwrKVkM3QCjS61IYLb1D4wlWxGkROMSpVEU8jLeZ
         Dadw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773343222; x=1773948022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqyBefgbThwlgKP9KCSuGlJgdIuR2RT0nMZ3gZqSKA8=;
        b=meSJk7eyWO3DuIJhtVEEEm4DMA2bOKynFla2cmUM74iuonzx1lknuD1txLnsq2dfEI
         eLr8/crV6sCY1naJAQeIVr4pU7vZ8cFJn2TCfC4RCD/sawh2sXZf9h3IfQF0y6e2cw6t
         Ex/4AAtHBss2KAW+CGaInczp3S/lUFkHnc+U44II41ZeHKO+ZFV1OwbKkaUopEU1TFDA
         qNLzaVlUYDLE5l0Ax7tHyui0TfJ2t7llybLd8JAeNXwsCCo8uKHvo3uUwhroPvxZTVKV
         z7/BfdbTlrlFCY7dKDhiiXfwn4ALdP3EW17B24g7j+yOh4lP0Y7UbkJJeB7kMvoYtIVS
         e2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343222; x=1773948022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqyBefgbThwlgKP9KCSuGlJgdIuR2RT0nMZ3gZqSKA8=;
        b=EI6T7OMWd80+33KjZIKgR1ozSB4d8JElGmhCtsWGD/gP6XX6xh1VzmWkjYc35iwBBX
         W0aQYoOhhXS7Zj0rCwXG5DjNEs9g2Sy6rfcidnQXA5WDiddFTZag/TmGrly9g4PB+5ot
         Rp87vbyNnenP4jRB+obo19+L0bijhRir3+f9GP79dPDvFNnTSVu1hIYn0vtOHJDGwjOY
         yrgTXwwy2OOR6Stdcldx30jp1HJM4gvAkAHEdbvS0YBeXeT04gCGvY3ntb3eo2KqVMpM
         JVNdSqJwpqV67jUamLDDBL55Nqmrf79Jlj+FDQntSahX/kSHWKi+dqwrIwZKTmqG944Z
         7Apw==
X-Forwarded-Encrypted: i=1; AJvYcCVT8d0wOKeZ1eW/R+p4Z0/YHIWUJdaqftQFN11kwrbkrlSTZ/0Edjl+q90HwYwMBSm6WGj5s791m5berE+0fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWUw8I3j30kL/aRxlOQP8xmow0cHxQF96vOEMDhLsdNc+nmUH6
	OlJc/mNXC0E0Q6t3xUMA9G600U7xBCqCYWBC67Df0MVNjdbPC6AYrR1FrcYXcV9SW9X/lP+0qK6
	586VselhoMwtb9zHyUzEBL1sCR9CuPXs=
X-Gm-Gg: ATEYQzw8PfpCJgRUsUjGWMCuBDpE3OcSWKtVSr1zLfMIqIGvt0BDXWqN2Y0dfv4cc3G
	GW94n5JsIjD1I1UDK4WXW/tsSdGVWrXI5ZoJ3nkt3jkOdzrf19VHsfW70EOZaEpMZv3EoLfqmbZ
	cV2jGjSjmpMbHkYYMgPQD6jS2jiBjN2D35EC84QWlVhPMHqMurdRdVY4m9NnZCXNJsraIt9zH5f
	kdKfPzznKFR7Cw+RY7dkniljLT03Amo2CWqZjUMEEscROywZAbunyzBERZC2UXIfgBehoXqV+9n
	75aT4ybpqtRswBQX0grQLrH9qo+Qck9BpGEAPvStA2kn3HXvb6qssB76gVo7jwgSlW5C5a2lkeS
	8Yy+5SSuVe+M0tveRlZN8wT0=
X-Received: by 2002:a05:693c:3113:b0:2be:ca4:e136 with SMTP id
 5a478bee46e88-2bea539b6c2mr239955eec.2.1773343222351; Thu, 12 Mar 2026
 12:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306203648.1136554-1-joelagnelf@nvidia.com> <20260306203648.1136554-2-joelagnelf@nvidia.com>
In-Reply-To: <20260306203648.1136554-2-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 20:20:10 +0100
X-Gm-Features: AaiRm53FHItUdFEegxUW1-4wt0_otNvbfdbd3Uys6sYfgMCnCSAVDf6Yalvkc30
Message-ID: <CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid89LExw@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked list interface
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 9:37=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> +//! // Create typed [`CList`] from sentinel head.
> +//! // SAFETY: head is valid and initialized, items are `SampleItemC` wi=
th
> +//! // embedded `link` field, and `Item` is `#[repr(transparent)]` over =
`SampleItemC`.
> +//! let list =3D clist_create!(unsafe { head, Item, SampleItemC, link })=
;

Was the patch tested with Clippy? It has several issues.

The worst news is that it seems the "supposed to be `unsafe` block"
does not count as one for Clippy, i.e.:

    let list =3D clist_create!(unsafe { head, Item, SampleItemC, link });

So we get:

    error: statement has unnecessary safety comment
        --> rust/doctests_kernel_generated.rs:7416:1
         |
    7416 | let list =3D clist_create!(unsafe { head, Item, SampleItemC, lin=
k });
         | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
         |
    help: consider removing the safety comment
        --> rust/doctests_kernel_generated.rs:7414:4
         |
    7414 | // SAFETY: head is valid and initialized, items are
`SampleItemC` with
         |    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^
         =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/rust-1.94.0/index.html#unnecessary_=
safety_comment
         =3D note: `-D clippy::unnecessary-safety-comment` implied by
`-D warnings`
         =3D help: to override `-D warnings` add
`#[allow(clippy::unnecessary_safety_comment)]`

For this, we could write them as a `// SAFETY*: ` comment or similar,
to make progress for now, but it would best to request upstream Clippy
to detect this or to rework the macro to force the `unsafe` block
outside.

In addition:

    error: unsafe block missing a safety comment
       --> rust/kernel/interop/list.rs:357:17
        |
    112 |     let _list =3D clist_create!(unsafe { head, Item,
SampleItemC, link });
        |
--------------------------------------------------------- in this
macro invocation
    ...
    357 |             |p| unsafe { &raw const (*p).$($field).+ };
        |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        |
        =3D help: consider adding a safety comment on the preceding line
        =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/rust-1.94.0/index.html#undocumented=
_unsafe_blocks
        =3D note: `-D clippy::undocumented-unsafe-blocks` implied by `-D wa=
rnings`
        =3D help: to override `-D warnings` add
`#[allow(clippy::undocumented_unsafe_blocks)]`
        =3D note: this error originates in the macro `clist_create` (in
Nightly builds, run with -Z macro-backtrace for more info)

So this needs a `// SAFETY:` comment on top of the closure.

    error: this macro expands metavariables in an unsafe block
       --> rust/kernel/interop/list.rs:362:9
        |
    362 |         unsafe { $crate::interop::list::CList::<$rust_type,
OFFSET>::from_raw($head) }
        |
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
        |
        =3D note: this allows the user of the macro to write unsafe code
outside of an unsafe block
        =3D help: consider expanding any metavariables outside of this
block, e.g. by storing them in a variable
        =3D help: ... or also expand referenced metavariables in a safe
context to require an unsafe block at callsite
        =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/rust-1.94.0/index.html#macro_metava=
rs_in_unsafe
        =3D note: `-D clippy::macro-metavars-in-unsafe` implied by `-D warn=
ings`
        =3D help: to override `-D warnings` add
`#[allow(clippy::macro_metavars_in_unsafe)]`

For this one, to begin with, do we expect to have actual expressions
for `$head`, or could we constrain it for now to an identifier for
instance?

With an identifier there is no issue then -- the example currently has
just an identifier anyway.

I hope that helps.

Cheers,
Miguel
