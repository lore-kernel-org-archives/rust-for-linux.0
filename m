Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1DC1D556
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Jun 2024 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718120811; cv=none; b=hKLaFfN080ufH/vy82cW3dBs0Qi62aLjGRe9WVYvXfWqDUEIsA9ovrhOOV+5vSFbtEq/yXWiMaQuNPKj/9gwhs45SGjcAGRaJmrDP0mI6yn7cOfZcey2/OM9wEan0phuNBFZK0V2UMvDEs2A8S+QFYdpJyySNTAYZbfT8Vulum8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718120811; c=relaxed/simple;
	bh=7Q8EYfT2yYWno5JvwY7yHxi7BODOc8t+N4Cv0BJ3y1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpKzZ+ZONVYEE8NCQGn0S7OfAEek+qEEdlz+tUmdNbk+ql/51nkZK8xrkaeKm45+hlPtpl5K7/UH3pM4W8Ve/O/OwEApAr/WCI93Wo+P/F81OfZo2Fv8I4QYoJJYYI3G4O+pk47pHaflHeVUdxu9qopyZaKI0CBdsGPAFqmW35c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VibAaU87; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VibAaU87"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44B3C2BD10
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Jun 2024 15:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718120810;
	bh=7Q8EYfT2yYWno5JvwY7yHxi7BODOc8t+N4Cv0BJ3y1A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VibAaU877OJhw/xWEQarGFauNAaLoPTRm7kiONSpmK7Vwz81evoQ49TbMAcoVYWtm
	 k93F2BSHQPO+kfOGitb6sWUHlwRryanMq229pYZycRSwAt6ImbbhNF3R56qotaBu5R
	 JFQ9+74k7X7Wl4HoBJLsp/HE/iCfIyW6uLWZCgMxCH0wfe6GyJOMcKZm0sZr9Ilkgm
	 juPzhGQTu6X4XGaiREouJveo/Ue0YZ+JiVx79ptJwlBWaNrNaxNKo5Xzms0HpbGx7w
	 i/Yvbk5DqEt6bjvO08/BAzW235cjKD+JtRDQsoBht2eItJ7buvmF3kSk5ACYYfJJZU
	 PWQtcbIpMRfZA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bc274f438so1800472e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Jun 2024 08:46:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6nett90Wnvh4Oc5VqqngvcSGGX7hl9FvDggC6xyQ79M6+XM1tyx2iEXPVkbhs0zM+V9XtaGKHGxKoUzNGh6PetwqIWKruORzowc/H9KI=
X-Gm-Message-State: AOJu0Ywenvk8vU+OCSZRJs2p0gcaaAwGt3qiRaDdiIwBlDEfkrRuchQE
	OxjHaKNX4BRR2u82UKCC5+dsYM1QGy2XGza8PXf9OSxA9wf0io/As7KRf15ZkndiNsF0pEmxQY6
	aH/pFsPcDuYk3NVPhPZtXOIzImQ==
X-Google-Smtp-Source: AGHT+IFx3kwL+4lnpKgK+dz83tXodIju037np6QGjras/ITiUXQ5EcTtwkbuGjNnLsANd4GB8aIL9jlXqg1ID9iFlKE=
X-Received: by 2002:ac2:4bcd:0:b0:52c:78fa:453 with SMTP id
 2adb3069b0e04-52c78fa05a5mr7404319e87.19.1718120809006; Tue, 11 Jun 2024
 08:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240520172059.181256-1-dakr@redhat.com> <20240520172059.181256-4-dakr@redhat.com>
 <20240521212333.GA731457-robh@kernel.org> <641bda93-35f3-429e-b627-a9485505b6bf@asahilina.net>
In-Reply-To: <641bda93-35f3-429e-b627-a9485505b6bf@asahilina.net>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Jun 2024 09:46:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLtGxyEymhuzb6HW85sunppYkKri9YsRpL31paVsB55zA@mail.gmail.com>
Message-ID: <CAL_JsqLtGxyEymhuzb6HW85sunppYkKri9YsRpL31paVsB55zA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/8] rust: drm: Add Device and Driver abstractions
To: Asahi Lina <lina@asahilina.net>
Cc: Danilo Krummrich <dakr@redhat.com>, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com, 
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 8, 2024 at 11:16=E2=80=AFPM Asahi Lina <lina@asahilina.net> wro=
te:
>
>
>
> On 5/22/24 6:23 AM, Rob Herring wrote:
> > On Mon, May 20, 2024 at 07:20:50PM +0200, Danilo Krummrich wrote:
> >> From: Asahi Lina <lina@asahilina.net>
> >>
> >> Add abstractions for DRM drivers and devices. These go together in one
> >> commit since both are fairly tightly coupled types.
> >>
> >> A few things have been stubbed out, to be implemented as further bits =
of
> >> the DRM subsystem are introduced.
> >>
> >> Signed-off-by: Asahi Lina <lina@asahilina.net>
> >> Co-developed-by: Danilo Krummrich <dakr@redhat.com>
> >> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> >> ---
> >>  rust/bindings/bindings_helper.h |   2 +
> >>  rust/kernel/drm/device.rs       |  87 +++++++++
> >>  rust/kernel/drm/drv.rs          | 318 +++++++++++++++++++++++++++++++=
+
> >>  rust/kernel/drm/mod.rs          |   2 +
> >>  4 files changed, 409 insertions(+)
> >>  create mode 100644 rust/kernel/drm/device.rs
> >>  create mode 100644 rust/kernel/drm/drv.rs
> >
> > [...]
> >
> >> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> >> new file mode 100644
> >> index 000000000000..5dd8f3f8df7c
> >> --- /dev/null
> >> +++ b/rust/kernel/drm/drv.rs
> >> @@ -0,0 +1,318 @@
> >> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> >> +
> >> +//! DRM driver core.
> >> +//!
> >> +//! C header: [`include/linux/drm/drm_drv.h`](../../../../include/lin=
ux/drm/drm_drv.h)
> >> +
> >> +use crate::{
> >> +    alloc::flags::*,
> >> +    bindings, device, drm,
> >> +    error::code::*,
> >> +    error::{Error, Result},
> >> +    prelude::*,
> >> +    private::Sealed,
> >> +    str::CStr,
> >> +    types::{ARef, ForeignOwnable},
> >> +    ThisModule,
> >> +};
> >> +use core::{
> >> +    marker::{PhantomData, PhantomPinned},
> >> +    pin::Pin,
> >> +};
> >> +use macros::vtable;
> >> +
> >> +/// Driver use the GEM memory manager. This should be set for all mod=
ern drivers.
> >> +pub const FEAT_GEM: u32 =3D bindings::drm_driver_feature_DRIVER_GEM;
> >> +/// Driver supports mode setting interfaces (KMS).
> >> +pub const FEAT_MODESET: u32 =3D bindings::drm_driver_feature_DRIVER_M=
ODESET;
> >> +/// Driver supports dedicated render nodes.
> >> +pub const FEAT_RENDER: u32 =3D bindings::drm_driver_feature_DRIVER_RE=
NDER;
> >> +/// Driver supports the full atomic modesetting userspace API.
> >> +///
> >> +/// Drivers which only use atomic internally, but do not support the =
full userspace API (e.g. not
> >> +/// all properties converted to atomic, or multi-plane updates are no=
t guaranteed to be tear-free)
> >> +/// should not set this flag.
> >> +pub const FEAT_ATOMIC: u32 =3D bindings::drm_driver_feature_DRIVER_AT=
OMIC;
> >> +/// Driver supports DRM sync objects for explicit synchronization of =
command submission.
> >> +pub const FEAT_SYNCOBJ: u32 =3D bindings::drm_driver_feature_DRIVER_S=
YNCOBJ;
> >> +/// Driver supports the timeline flavor of DRM sync objects for expli=
cit synchronization of command
> >> +/// submission.
> >> +pub const FEAT_SYNCOBJ_TIMELINE: u32 =3D bindings::drm_driver_feature=
_DRIVER_SYNCOBJ_TIMELINE;
> >
> > This is missing an entry for DRIVER_GEM_GPUVA. And some others perhaps.
> > I suppose some are legacy which won't be needed any time soon if ever.
> > Not sure if you intend for this to be complete, or you are just adding
> > what you are using? Only FEAT_GEM is used by nova ATM.
> >
>
> This was developed before DRIVER_GEM_GPUVA existed ^^
>
> I have this in my branch since I'm using the GPUVA manager now.

TBC, I'm using it as well, not just providing drive-by comments. I'm
starting to look at converting panthor to rust.

> Danilo,
> what tree are you using for this submission? It would be good to
> coordinate this and try to keep the WIP branches from diverging too much.=
..

Yes, please!

Besides asahi of course, there's several people[1][2][3] using the
platform and DT abstractions and we're all rebasing those. I'd
volunteer to maintain, but I don't know rust well enough yet to even
be dangerous... :)

Rob

[1] https://lore.kernel.org/all/cover.1717750631.git.viresh.kumar@linaro.or=
g/
[2] https://lore.kernel.org/all/20240322221305.1403600-1-lyude@redhat.com/
[3] https://lore.kernel.org/all/CAPFo5VLoYGq_OgC5dqcueTyymuSCsLpjasLZnKO1jp=
Y6gV7s2g@mail.gmail.com/
