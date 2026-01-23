Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD4730BB80
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160217; cv=none; b=E7aiftvACVi7AFBuTFeph/zHwVkZ9PgFv25cWeH+RLJ8MUDSlBlli+WvgZaVxdwP6hygz3SIxqBkpdF1R2HQ30gE8geCApKAyAxTRARABCNbNopOTeQ/E4bIrHgniW9xB1uFhTXCuHbTNztR6FLjrOhq1o5CfTPEVqlPgrLhoYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160217; c=relaxed/simple;
	bh=Yp5JC+o9XfhjXZIR9DSkxgJ9QPtnq0F7Bb2nhqBIVM4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MsxAGZimLbU56c9ATj/rlUbNr2Bzw88QQ7nbIduf3v0Mz/Tvj0chyNjD1WMsdTiiot2kh7HhhWeZvJzTW//zMzRRjnllLqql49l0kHkdjoYZp7FvN4rzMXUJpssOX9l4ohrwbtLaRrk8g0asYaEjKXbpKwhX7TJRhwsThg+C/cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s9+kzCeb; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s9+kzCeb"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-64db7bc9921so18289a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 01:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769160214; x=1769765014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+T0dti8ZBhNnJy4fxtj+vryGifAMmqjwXPe5o6PeaE=;
        b=s9+kzCebjKSUNbNfRG1gMardqJ0Zy7Mq59yFSgLenxmO1ATBEIs1GV7bHBrcTLkcpH
         JS3Mgl46qAU+BCa5L5mxNIbzZGGtg/SC5Jjfw2lfNTrsL4P88W4IGjcnofphSOjeW4DJ
         tnmRCzl2mVL/0wolAPVpbUP0Vp4dALFPZsZ9ZpcJdmzDt4NSvshDqd2Oo+vQS5jW9XQW
         eIzIpzMA5BQB+ivOJqCT/9xKEqp00OsRYz0BaoV+kB4Ntr/41KqiuCkLzaOW562HeP83
         0WkdAkOfSQ8GhFoisMLLeIp8yK6Xt57jZ4u8tcM9ifUaHSQ5qvqZTzYUoCos/calmADO
         /PUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769160214; x=1769765014;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C+T0dti8ZBhNnJy4fxtj+vryGifAMmqjwXPe5o6PeaE=;
        b=GSA9wX/+1pDLq1CONdn/EoWRDMP/wiBDeT9ggWUXIkWH+84oKWOFe4PLY2Vr/MnHeL
         qiHjk4laEGbBHITfAuUmAa8UJN2uJhkCUtUv0ID7gTBhfwCSBqYRWP3tVwTI2bXZpj38
         mPJQkHhLshKwdnlQLe30mfyN1adFhsGZrVTJRC+SH6117rMIrWqLWIGakq8NToYTcKJq
         SK8CIyMmQRB1WVAbFv6WCq1FAaUgmRkLqAXt8YGs76y7S9YhMKqRsSGVGrKwTEsaeGSA
         8EHjZol5zaLkKx49IlA/+nEr3x3aEsXl984I4tVRRtNAOvkU4H2XXjBHzS5DsnASVDN4
         aKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4HRd7AISnrGE0JmHkveSpKpc4XA5zL0Jfoe0rfCkc2+iA7cW88+6LsG7v/JVFUpecujeqO3XxnZhQbs2nsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9pWgpi44gTrBFSiEA0fPJTvfUhes0d/fR611IcAVQzF03iIIA
	Adx5/+nVN7tTPeGLYY6lrDnTlCmbdNED/51WLmC9mJkpyiWQgadccn0ISPKvGstwBeIchs2BHfb
	VsofrcJJhSTZvYqLAmg==
X-Received: from edqv18.prod.google.com ([2002:aa7:d812:0:b0:64b:9dfc:134d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:524a:b0:658:eca:df89 with SMTP id 4fb4d7f45d1cf-6584876375cmr1714402a12.13.1769160214158;
 Fri, 23 Jan 2026 01:23:34 -0800 (PST)
Date: Fri, 23 Jan 2026 09:23:33 +0000
In-Reply-To: <9C5177DB-CEBA-4DD5-8E93-DB39CB1F2079@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-6-dd95c04aec35@google.com> <9C5177DB-CEBA-4DD5-8E93-DB39CB1F2079@collabora.com>
Message-ID: <aXM-Fc0NeY6Acdqz@google.com>
Subject: Re: [PATCH v3 6/6] rust: gpuvm: add GpuVmCore::sm_map()
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 07:58:34PM -0300, Daniel Almeida wrote:
> Hi Alice,
>=20
> > On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
> >=20
> > Finally also add the operation for creating new mappings. Mapping
> > operations need extra data in the context since they involve a vm_bo
> > coming from the outside.
> >=20
> > Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
> > Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > rust/kernel/drm/gpuvm/mod.rs    |   9 ++-
> > rust/kernel/drm/gpuvm/sm_ops.rs | 154 +++++++++++++++++++++++++++++++++=
+++++--
> > 2 files changed, 157 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.r=
s
> > index 165a25666ccc3d62e59b73483d4eedff044423e9..557c0d629eec912a97fc4ef=
18495d5bf0807db0a 100644
> > --- a/rust/kernel/drm/gpuvm/mod.rs
> > +++ b/rust/kernel/drm/gpuvm/mod.rs
> > @@ -93,7 +93,7 @@ const fn vtable() -> &'static bindings::drm_gpuvm_ops=
 {
> >             vm_bo_alloc: GpuVmBo::<T>::ALLOC_FN,
> >             vm_bo_free: GpuVmBo::<T>::FREE_FN,
> >             vm_bo_validate: None,
> > -            sm_step_map: None,
> > +            sm_step_map: Some(Self::sm_step_map),
> >             sm_step_unmap: Some(Self::sm_step_unmap),
> >             sm_step_remap: Some(Self::sm_step_remap),
> >         }
> > @@ -248,6 +248,13 @@ pub trait DriverGpuVm: Sized {
> >     /// The private data passed to callbacks.
> >     type SmContext<'ctx>;
> >=20
> > +    /// Indicates that a new mapping should be created.
> > +    fn sm_step_map<'op, 'ctx>(
> > +        &mut self,
> > +        op: OpMap<'op, Self>,
> > +        context: &mut Self::SmContext<'ctx>,
> > +    ) -> Result<OpMapped<'op, Self>, Error>;
> > +
> >     /// Indicates that an existing mapping should be removed.
> >     fn sm_step_unmap<'op, 'ctx>(
> >         &mut self,
> > diff --git a/rust/kernel/drm/gpuvm/sm_ops.rs b/rust/kernel/drm/gpuvm/sm=
_ops.rs
> > index 3c29d10d63f0b0a1976c714a86d486948ba81a15..5f3c5d3918147a6962e5658=
443c343835baa10b8 100644
> > --- a/rust/kernel/drm/gpuvm/sm_ops.rs
> > +++ b/rust/kernel/drm/gpuvm/sm_ops.rs
> > @@ -8,6 +8,100 @@ struct SmData<'a, 'ctx, T: DriverGpuVm> {
> >     user_context: &'a mut T::SmContext<'ctx>,
> > }
> >=20
> > +#[repr(C)]
> > +struct SmMapData<'a, 'ctx, T: DriverGpuVm> {
> > +    sm_data: SmData<'a, 'ctx, T>,
> > +    vm_bo: GpuVmBoResident<T>,
> > +}
> > +
> > +/// The argument for [`GpuVmCore::sm_map`].
> > +pub struct OpMapRequest<'a, 'ctx, T: DriverGpuVm> {
> > +    /// Address in GPU virtual address space.
> > +    pub addr: u64,
> > +    /// Length of mapping to create.
> > +    pub range: u64,
> > +    /// Offset in GEM object.
> > +    pub offset: u64,
>=20
> I=E2=80=99d rename this gem_offset. A bit vague/confusing otherwise.

Sure. I'll rename.

Alice
