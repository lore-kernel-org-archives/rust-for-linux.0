Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C365B672
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777395767; cv=pass; b=stvGguJwEIsJBrcvDi5eKGqwk1lN1C5JG961wq4eZOGdArEczQPnfSNu6eT3ZZew4E9ul8A4oz2hb+EXpojxg+JSKH3jZX/aux+Vo71eI2HKoKA2xr1iyDG8NOsjTlnALZ2aJAi7OpqmQMxdOo0isE1CBgEMrvlaXA4Vx8iHMiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777395767; c=relaxed/simple;
	bh=t7ibiGkoD5x4MX/r3hhjb2uQxB4lgc8XwZWOoVaO9Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSrIxg9+KEIZ6en5ScuVyFOhKq7eafyB+kLN+INQQQSarwAO3iQp+v+KZWpmVxZEsC6/t0ulkBilzprbCOsSud3kRboiFfIcqGg3Bj1ZIwKBr1Jz1crS1hB3nA7CPBxtsMPqbuNUn7sZs9mb54NTbkKME0w57hDKcm6JekkXD0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SHv8IRnO; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SHv8IRnO"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d74086e5bso11021168f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 10:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777395764; cv=none;
        d=google.com; s=arc-20240605;
        b=d+byUCG7zztkL3sLsgEgutUalEJ/DRuDOKHr8T+I+KdDO+XrG/NnsmGj68knz5o3Ae
         pvU93BRkDJHqyN5Vvr/E9fpelp9PCqNKTPtRiWV9wEGp3cgSrJF5tGFNjxN2c+krHHac
         mqfvJHwciSM/UJhozcPSOqhNcedyMV40Ufu6s5nQmzxuiPomHZXkEu9/YOx2M5wJJ1+y
         Yx0RR8ongOc3YrcMJb5h/rVTRCpDtTh2YvjKPipCt6vq+Ub7cjYmpSupU6/wU4IN6hqG
         3bJskBApsI6pejYX2n1ZWp3BDOffug38rlwNhmG006x8ueNzU49t6gc8UH19m4sPCKNU
         6hiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HwVvM09PKVWHntGCwz8WwRzxhlVbD+GpBKDPzitmL5s=;
        fh=tGEnBwSgiPihkdR6O1J4mHKPMN7st2PHBnaIK3ei5Eg=;
        b=TuKOPlZt1mkMmN3uxRhiVmwkWvVLU4ia439dkuwUw161LjrUd3hkeUk6CX4KwUML7p
         BPhXVx+0kWdZk2SBHHEwDHwaa3La284IrBTV+33MEb2vJzwIo1mKeJVrKbO+NzZ5SIJr
         4ar1Cu9dKTcvh/Iqi7HMSSd59mdm3h/+26IWWndhoHCu6kKINweaZ47jXOU4ios3x/eJ
         qLnm+cK/Cmv/IN5cMOlYb8+eeiFx4K0qtK4ybqoNJLJjzGyzYqNOkG+dbkmIVf1AL+4U
         3J9mWJk0BaltakgacI5ZqiSRYHV0NzqlImYEBshqGffUKrliKcVguyitILwLwx650GzJ
         XLsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777395764; x=1778000564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwVvM09PKVWHntGCwz8WwRzxhlVbD+GpBKDPzitmL5s=;
        b=SHv8IRnOktZR1tnab6qHX/K1uTQ9t5SsGlCE+ZblSEs5WiJ+0gvy8ozkufSSCdf0Jq
         6Z0El8qsqfI4VEXbw4WhMNuIHnhDhli90GbinEknQX/ooK6dQenGbAo38qN1LSo8Bokd
         qUHPFJS1R8QcWRhRtDw9PnpHN6XqZ7slyoJ6PA4F2qqEhiHVc7d8HSkgVLIuG++dX5KS
         gbzOYNsy8emrB7ulF/Pj5TtXY6mFj889EtE9vEKmDaS8Pd5c/pOGF0a4RnVaqH85NKbv
         HiGKmXh1QXZV+hxoqOGGMZ7M+zsQxTfvvorjC3SwfwDfGRh5PEy0M6UQxWXiYB0ak5yL
         XP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395764; x=1778000564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HwVvM09PKVWHntGCwz8WwRzxhlVbD+GpBKDPzitmL5s=;
        b=lDXs/rdwiJkn722qyVO5d8gutZLr/o7w9pKXTvH46Uuu4CVhkh9qKuxG7hiNJfX+0N
         SKHnlng85U6sE/plMKSQroMSetSL8a27/4jAo5+WIjIbOWs1KvC8xtReoHDPlAuZSsU1
         bDRJARUJ8EmUfLIXz8a/dW8x2Nsl9GZeGIUzuFIYck4VK4bMLG3trrSzG0xsXidUU8rF
         AjDN3r3NJTjJh6OJ9Eqi/E1SGm+YfTtlseCJvqPcr590DHtOOfOQJ8ypTPztwtBVh2DH
         6zoh9/inGP149iLr2hgXOVz5pt/zl3XjeuT9KSfYG4WQ3qB399k8WLFf/m7Qhs3lpRFu
         bFbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vAbKc3Y082gVfd4zs/CXJFkMLk+zV5eUZhvYFUcCyZaNStxkAVRNLJvvXwHSic8JzRni15Jf2xHQ2n1v/vA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/8G4TGBwhdJSRHC9fvVKpqGjd6x3RO4Mm5Jiq818DegUcYaFy
	MWuEIiGeDyLZlfHObeFbaRQMZUv2YCxJAulPqd7lHkY2ykiDdlDsyPb2Fz5PNw6/AVIuoP2Oc/L
	vefp9BR/SJyp22KvAJS/KeKIxjrAf3dFR62GMfrWt
X-Gm-Gg: AeBDiesRrmD8auomOhVyeHE6QhsUqbIT3GNqus3LSzN+jjF0PXs8A3PAYMB5fmippVT
	UcPIlGSfJolPg+RvR6AuN0PdQ2+1c3P+atnvlE4LhqRBiHr/9WHXW9LmHuIk0sebBY/BNacLtis
	4rs+OwldpzfiVk/EGOYwwEt7I0pZOY7mah6zIIy7XwYkag93sqJNgarEDdo0cvGujrFFnUUXQ4R
	GiN/LRNY8QDmVVcWnkcWQ6DQnoxGcW1QCnZ7HU12YGGD13RY6nyH5fNlsvUTshlM0BE8+hoTMb/
	NNTA3GDUJT/mWYJuWkW/VHBCYNWrQNLbcamLusyvJxc0R9sOPqiGGnbnVCM=
X-Received: by 2002:a05:6000:1843:b0:439:b8b2:fad0 with SMTP id
 ffacd0b85a97d-4478e6b3b9cmr219739f8f.5.1777395763425; Tue, 28 Apr 2026
 10:02:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
 <20260427100704.02190859@fedora> <afCSUYIbV2ibZuOM@google.com> <afDjQMYam_XjGC5q@um790>
In-Reply-To: <afDjQMYam_XjGC5q@um790>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 28 Apr 2026 19:02:30 +0200
X-Gm-Features: AVHnY4Ik_8fb4oFZwvMoHcSuNjcM1UmouWDgkGJ5PuCkY4HsiWijf6VGxqB9mys
Message-ID: <CAH5fLgg73yex+UxpQeayrW_m9P1_u8gTSFzJSyz1a3vxZfZbuw@mail.gmail.com>
Subject: Re: [PATCH v4 00/20] drm/tyr: firmware loading and MCU boot support
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	beata.michalska@arm.com, lyude@redhat.com, acourbot@nvidia.com, 
	work@onurozkan.dev, alvin.sun@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 6:42=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> On Tue, Apr 28, 2026 at 10:56:17AM +0000, Alice Ryhl wrote:
> > On Mon, Apr 27, 2026 at 10:07:04AM +0200, Boris Brezillon wrote:
> > > On Fri, 24 Apr 2026 16:38:54 -0700
> > > Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> > > > Alvin Sun (1):
> > > >       drm/tyr: use shmem GEM object type in TyrDrmDriver
> > > >
> > > > Beata Michalska (1):
> > > >       drm/tyr: set DMA mask using GPU physical address
> > > >
> > > > Boris Brezillon (5):
> > > >       drm/tyr: select required dependencies in Kconfig
> > > >       drm/tyr: rename TyrObject to BoData
> > > >       drm/tyr: Add generic slot manager
> > > >       drm/tyr: add MMU module
> > > >       drm/tyr: add GPU virtual memory module
> > > >
> > > > Daniel Almeida (1):
> > > >       drm/tyr: add parser for firmware binary
> > > >
> > > > Deborah Brouwer (12):
> > > >       drm/tyr: remove unused device from platform data
> > > >       drm/tyr: move clock cleanup into Clocks Drop impl
> > > >       drm/tyr: add shmem backing for GEM objects
> > > >       drm/tyr: add a kernel buffer object
> > > >       drm/tyr: add firmware loading and MCU boot support
> > > >       drm/tyr: add Wait type for GPU events
> > > >       drm/tyr: add Job IRQ handling
> > > >       drm/tyr: wait for global interface readiness
> > > >       drm/tyr: validate presence of CSF shared section
> > > >       drm/tyr: add CSF firmware interface support
> > > >       rust: time: add arch_timer_get_rate wrapper
> > > >       drm/tyr: program CSF global interface
> > >
> > > This series starts to be quite big, and it seems new features have be=
en
> > > added to v4 (interactions with the FW). I'd recommend that we extract
> > > the uncontroversial bits (I'd say patch 1-2, 4-7) or have them applie=
d
> > > to drm-rust-next right away. I know it's tempting to add features
> > > between revisions, but the more you do that the longer it will take t=
o
> > > get the foundation merged.
> >
> > How about I pick up patches 1, 3, 4, 5, 6, 7 for drm-rust-next now?
>
> Don't pick patch 1 because it depends on the Device Context series.
> The DRM device only because redundant once it's Registered, so we can't
> remove it yet.
>
> Patch 3: "drm/tyr: move clock cleanup into Clocks Drop impl" applies
> cleanly to drm-rust-next so that could go.
>
> Patches 4-7 need conflict resolution.
>
> How about I prepare a new series of stuff that could go in
> immediately and that will at least make this fw-boot series shorter?

That sounds good to me.

Alice
