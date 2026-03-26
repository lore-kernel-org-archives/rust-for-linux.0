Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815DA402438
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539443; cv=pass; b=XhZZcfNpzrI1EVGuRRFOwm3ABsFoNr4gWEOyHtncUoKYHmB3jA8bvlFmYyoExEX19sIqKeOVl+0mz3149gDEV0VsgsdpsR1y0+dNwf4idAdFcINDmt1MqPbqY2v23Ggk0bbO9Eaxk5DlzMKdgWmIvN0YLTkd7pV0mYClB43vDWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539443; c=relaxed/simple;
	bh=QDxg5XmNoFt4YUmz45JtwPcoB1FBAXUZ4Xr/Cp6D5Ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u13y/vqCvQL1vzrN+PD94CcEFYH9mO4tXJtZx7Zei30AYduZUnERRCMdtVOAi99LlooWRcvwqFobQwa/Iix3x0PDYw3tK7O86tQqD5/Un65UwfjAt2gTu0OP9O6Ja0fseEC8wRmQDmiGSfOVXsD+PyPxvPUT4DlxoJ8tZWbENlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LErCrZ6Z; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LErCrZ6Z"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so723250f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 08:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774539441; cv=none;
        d=google.com; s=arc-20240605;
        b=fMz9AdPaLA4t3cmqHVpqjx/95LYdMljZMHDcXFN2sM3LECFCQASEbi6GvavYAVQE8d
         pYwaAA30xbq9FgUDYUgWBFqfxnVmHqXzWdQJVW5AUvu2ECwQD2ksM4P0nsOu1/N2gopV
         R7gOIAHP8Arq05U2pCODxDXq9PROg/tcIDfsjCJxa0cTaviElqK83NlDMubQ/hHHaN0w
         N1Mun1lqBIfHD7xUvnwWwCYpCgVe0IqiW34ie/pwc4VPWY5zk3viyFGrmiA+LGCeLodV
         N8b1QxlcMG8x8IIsszSON76sfcco5Lp6MsizKxnTaWNxgfBzbBZG398dKz0vZ+Kze4Iw
         yHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NWeLPeCEOISYEMuHk4klgF1pcPKiVi4mEhvhikoMf4E=;
        fh=/iGfYos0SQKQwRo6kUvZE1Z0NTC3tiW7qNSeEBqYhYM=;
        b=g6yxPxCN5pb6RhRM/fVTTfwz8AsuXT0lAgaQ0zQsOacsjHwoOHeXHSHx7hnXkeTu1P
         N0aS97+Ynpklr9zQasZX62jHNvDW/ZdppFhmPHz+lHfsXm9ba61rZZTREHAej60j97bF
         nOYOriq5Fdw613vUNdkoymD9cbyyWJj9nI6jhuAjlbIvjQnfivjJJ5qE5zgKug550AjM
         GTO2pYyeEflyqprgIjO5m9j7iHafLXkBhNpWr80ry/zM95Ofgl+ttMHzZDkFq6KkqdIt
         epKcHS0fH10VVguNCk3cejDOyjz3H+wk3tSvOow8USyoXJ6CfCzbmWCfMDidyhwu/3SB
         P0mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774539441; x=1775144241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWeLPeCEOISYEMuHk4klgF1pcPKiVi4mEhvhikoMf4E=;
        b=LErCrZ6ZSY6nlfulO5fmVRILZbyHyHql3fRyfY6WmMzDYDiAYt4dap990599KgEhoD
         e1FbvQuKrgg3RrnxrEihgNDCZUklsU+iHAp2/mqQs0tC7ORdGP3BP3CRdiZnc/voCxqh
         x7zNcFdcElFqL8Mo59JVqAzmCS/8Cn6RLanqnM8ERWcVaYhHe8qM8Y/Lw3JbnjMNAndk
         oW9nH/3tfSZL3WWJQEWDdRVFb/ot1y23ZPkqCe485lM6eZUYLOm27AbmioWR875jlHsB
         7eQTusoABswM1NGm6r4J5WFLyqX0sVRLDToTqfB/ZFu1BlZbhT+dyylPekoaLqhh4JSr
         5tqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539441; x=1775144241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NWeLPeCEOISYEMuHk4klgF1pcPKiVi4mEhvhikoMf4E=;
        b=h88UchXIsDITuZzpZ3m3G/tnlYpQ8HXzabsR6JJiOkNUSujA2yM5bL4GPkiihbfIee
         WmCRt2TtY1tA2TOfeR7uZJvujWumQKZmqRbF+Mz0sOI0+5HJwHzR+8C5KTjcIbg96EUZ
         oYxB1FDnp/fo/B78hEpAdHKmk3FyDol7GS4v7ecRYLo+WIdyP10+76L3prY2nUu7sWeu
         Ausn6OWbkoNq9hjnTdLo2tWsxQjKrnihyjDcgzJzaCzR/3X0HOHwcuDMEIZBapsy9BzX
         BZEOO1uyieZNe/sM/2oh64EGXP2V8/clVHTS7yuOkuKfzeLyJjdp+bv79PA/BklOLCAC
         RJtw==
X-Forwarded-Encrypted: i=1; AJvYcCXiZblWogDAXk3N6YS+1+BjeSZ+WwRyHZODtcWt3WuGrHfzJdmvB6Rm22ZuPDIolOWq6f8rPPanWR2SbbAZIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI6TahPWwQjvpG1/zmzMdkq1OenX3yAFCXg6vSA115TsHNdr+U
	MnhJSIFBYTiZLrndBy4wRbFR6cSEo7elPXgZ96oKRnJmUPYYdBeFFuc46GN4FalU5vlcuzdasaT
	ieypVBqrhLXc+4xg3zGfpD2J9dHjrxpVtQs4AeASz
X-Gm-Gg: ATEYQzxrbZ16gazb3Qdzcol7TRUeS+bxqC4lhoJhAC+5L2DAC/8B/o+Eo/cS3C5FnCF
	sLpjzBBAcH4UII9mjhVZT3DoyrtBJF1hzmyzFFIG9ObaD3eIxGJQE38A/+W6ja2h0+kmYCV73zN
	1rorIMz8huw03WTa+TCmawf4LLQo/h5E4u1Z/DS6pWZGpmkzBhdLgafYaDsYi+dIsZ0zlfaXtfR
	ik8NHVhxsa5eLY7q3ligFM2+ldeoE88DfzN1mEMf88H/LXRaWli2XKsP125mm+hgBwgefUCTq5T
	JbMPRO/+JmyHE1AwTNw8S5LQDNWbBVFHJBlZlg==
X-Received: by 2002:a05:6000:220b:b0:43b:8023:8b2 with SMTP id
 ffacd0b85a97d-43b88a25a22mr12525617f8f.45.1774539440336; Thu, 26 Mar 2026
 08:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316211646.650074-1-lyude@redhat.com> <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
In-Reply-To: <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Mar 2026 16:37:08 +0100
X-Gm-Features: AQROBzAWo8AoJkaNLNO9mq7x8n-1T_o4Q7aKPSl79urjgisqLmie7CjKUZkc8tM
Message-ID: <CAH5fLgifLd5sYQMjXs-154KTJbDcEuy3VE1LY+9YvfNMBWzHbA@mail.gmail.com>
Subject: Re: (subset) [PATCH v9 0/7] Rust bindings for gem shmem
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, nouveau@lists.freedesktop.org, 
	Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	linux-media@vger.kernel.org, Shankari Anand <shankari.ak0208@gmail.com>, 
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org, 
	Asahi Lina <lina+kernel@asahilina.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	kernel@vger.kernel.org, Deborah Brouwer <deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 2:15=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Mar 16, 2026 at 10:16 PM CET, Lyude Paul wrote:
> > Lyude Paul (5):
> >   rust: drm: Add gem::impl_aref_for_gem_obj!
> >   rust: gem: Introduce DriverObject::Args
>
> Applied to drm-rust-next, thanks!
>
> > Asahi Lina (2):
> >   rust: drm: gem: shmem: Add DRM shmem helper abstraction
>
> I was about to pick this one up as well, but did run into quite some buil=
d
> errors and warnings. I fixed them all up, but I consider this too excessi=
ve to
> actually apply the patch. This is the changelog I came up with:
>
>     [ * DRM_GEM_SHMEM_HELPER is a tristate; when a module driver selects =
it,
>         it becomes =3Dm. The Rust kernel crate and its C helpers are alwa=
ys
>         built into vmlinux and can't reference symbols from a module,
>         causing link errors.
>
>         Thus, add RUST_DRM_GEM_SHMEM_HELPER bool Kconfig that selects
>         DRM_GEM_SHMEM_HELPER, forcing it built-in when Rust drivers need =
it;
>         use cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER) for the shmem module.
>
>       * Add cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), expect(unused=
))
>         on pub(crate) use impl_aref_for_gem_obj and BaseObjectPrivate, so
>         that unused warnings are suppressed when shmem is not enabled.
>
>       * Enable const_refs_to_static (stabilized in 1.83) to prevent build
>         errors with older compilers.
>
>       * Use &raw const for bindings::drm_gem_shmem_vm_ops and add
>         #[allow(unused_unsafe, reason =3D "Safe since Rust 1.82.0")].
>
>       * Fix incorrect C Header path and minor spelling and formatting
>         issues.
>
>       * Drop shmem::Object::sg_table() as the current implementation is
>         unsound.
>
>         - Danilo ]
>
> Please always consider [1] and [2].
>
> [1] https://drm.pages.freedesktop.org/maintainer-tools/committer/committe=
r-drm-rust.html#submit-checklist
> [2] https://rust-for-linux.com/contributing#submit-checklist-addendum
>
> (@Deborah: I assume you were testing this with Tyr built-in?)
>
> @Lyude, Alice, Miguel: Please have a look at what I came up with below.

It looks okay to me.

Alice
