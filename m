Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D687480DC3
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 21:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461113; cv=none; b=pG75BA3Ejs0Dv57LYEVxeoRFAEuBvTBhbqLtvuogapQz2QbQpzMrsE/yeF+60+h82nOn4Jaoh7xSpDriKB23PZglZSRT3A6IYrju8yqi1BIwWQBcBvWXzOGddoaG5ZAryj5b9NEMkRmJ3HPM9+B5Aii3JWXjBHpIoP2tbyxWHnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461113; c=relaxed/simple;
	bh=jl+YAP8tpQr4+e/VlJSTpnAqWxdzEyvzpYLsNlFWKbg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7xeYG9Gt7SASXF1MfgZPX27OhWKh0mYVTytgx2JwnuXSOfbnRK25Is4EbEXkR9YNtvUXr4W2KSByHNpZwz8BXNgEWV+ttSIckuPwscDUAoCEPglF+e3Sn4vq148tGeJxfN6HPmfDWPVisQSFc2LfdTnULqvITyyBQ+1GossS7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JI+LX1Co; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JI+LX1Co"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783461110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jl+YAP8tpQr4+e/VlJSTpnAqWxdzEyvzpYLsNlFWKbg=;
	b=JI+LX1Co+KlmmVyD57vXwM0gootWZI/U9/QLZ2s95T646l7CDyBs5ZL/20fqc6NI3t4LpH
	3t9JNCII0eQbyFi1rjZH7MiRSVIvdXCe+wWuEPbOsCvEKo+hKsKebmZ/dVeXnrnUeOpcZp
	lgbVwPtxIbIv2IA5KDrR6pTr0KU/Qcg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-XmbG383hNTWYJjsHubnSOQ-1; Tue, 07 Jul 2026 17:51:47 -0400
X-MC-Unique: XmbG383hNTWYJjsHubnSOQ-1
X-Mimecast-MFC-AGG-ID: XmbG383hNTWYJjsHubnSOQ_1783461107
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f45dde7595so694436d6.3
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 14:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783461107; x=1784065907;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jl+YAP8tpQr4+e/VlJSTpnAqWxdzEyvzpYLsNlFWKbg=;
        b=K41i/3kphe5AYYurEq27JRb+mLFcZwzYJAwfbSsKcX+GTe/b3SF46qSqcDvDnxm1lz
         Tp9yL5DXeN3w1TEzYVM4yldy6+VWUoVYikWN9byMBMLg10p6eYsYOqMBEag7oDOuxEW5
         OahBUc/qb/eBjttUZwubZiCV3uY1jcvX5BbVYRIf5GNXvvdd5alDhp/VgvqpprNThFHW
         YJRkkJoSh1MHA/U52lMSl0+U5JqYbkw3E7rmYKritJpDt8eezsZz2RJ9KsROTnjdAWVs
         B+wViz2AWlb4fQ0E9SM9jBsHwORo+u+UMHUIi14gpJmamRojv4EjsXy/oKzhabJTZbZ7
         05Nw==
X-Forwarded-Encrypted: i=1; AHgh+RprLcyvSrcnWqw1UmSjYj99PBKpCe1R+OYUBUQ1l/3wXkEX8p9a8L9HIXT1H5ITeZkFjIzs6kP42BjdxnismA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw2DuxpcrtcP1aadszO1y39YNP795X1NMSR5pQ/N+rMKlNgOdR
	r/Hgn6EgMTt6qjQtKNzY8mJcewZ5n5BduLt72sQMbrF0n5JFi/WbDAKFh2gG14REcF5afx8tpQE
	NNVhksFit88xGwv6Hvi3a4WFVqEOM6NzfTqDGcP9HAL6RC+cyKmVHyI5qEzBpBlzIV2Dn
X-Gm-Gg: AfdE7cmQknRP3Nrkn61DWSBmkxY/ZEg/w3yuwJJ/k89DVETxUGGYREmBRQQ/aEFlmWC
	7JpNJbaAlpNAqbvktS5PO0tEiNoMqybmO1ZCzS9CNzgOP6dR2H3bwJGm6nIDrgJTFSIIJPMTDFk
	JreuOtJkgEJjJyQVK5yFXcOPDOm3HUBqMzLcvtmvEafrhK2aXyv7k4PjgpzN8BWLMynlBLD4Rpv
	5kna869oOuhkb0YVSNWkzW0LHcNP9qtW8uDg5FkYfa6JGtwSZhwu7h6PYAqf0pN/EAiDqNEedwY
	fjhgnPbd0pYWr8bQAcF24L04e+aev72L8nRUFDP0rS0oh/iUPciUT3sOyVo6sjAF6NN17QnLK7n
	cQsoLAEs=
X-Received: by 2002:a05:6214:21c3:b0:8f3:6c2:222 with SMTP id 6a1803df08f44-8fcb2e7e9f6mr97091096d6.14.1783461107093;
        Tue, 07 Jul 2026 14:51:47 -0700 (PDT)
X-Received: by 2002:a05:6214:21c3:b0:8f3:6c2:222 with SMTP id 6a1803df08f44-8fcb2e7e9f6mr97090676d6.14.1783461106543;
        Tue, 07 Jul 2026 14:51:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f4724b9ff8sm167215646d6.40.2026.07.07.14.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 14:51:45 -0700 (PDT)
Message-ID: <742ce0da3608a8cf467db9b7a6f0ada8b7d61a93.camel@redhat.com>
Subject: Re: [RFC PATCH v2 06/18] rust: drm: kms: add a Framebuffer::vmap()
 guard
From: lyude@redhat.com
To: Mike Lothian <mike@fireburn.co.uk>, rust-for-linux@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, linux-kernel@vger.kernel.org
Date: Tue, 07 Jul 2026 17:51:45 -0400
In-Reply-To: <20260703030123.2814-7-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
	 <20260703030123.2814-1-mike@fireburn.co.uk>
	 <20260703030123.2814-7-mike@fireburn.co.uk>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q2aU0nB0tFG40VOtLiAnjBmwX68fPIXd15IKo_7o39M_1783461107
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We have VMap at home already, please (with your eyes) search the rest
of the kernel for it. The work for this was pushed to drm-rust-next
recently.

On Fri, 2026-07-03 at 04:00 +0100, Mike Lothian wrote:
> Framebuffer::vmap() maps a framebuffer's plane-0 backing pages into
> the
> kernel address space via drm_gem_fb_vmap()/vunmap(), returning an
> RAII
> FramebufferVmap guard that unmaps on drop. Only single-CPU-visible-
> plane
> framebuffers are supported (packed formats backed by GEM-shmem/CMA;
> multi-plane YUV or an unmapped imported dma-buf return EINVAL). This
> is
> the driver-side FbVmap guard the v1 series carried, moved into the
> layer
> proper so every KMS driver gets it instead of hand-rolling the same
> map/use/unmap dance.
>=20
> Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
> Assisted-by: Claude:claude-sonnet-5 [Claude-Code]
> ---
> =C2=A0rust/kernel/drm/kms/framebuffer.rs | 67
> +++++++++++++++++++++++++++++-
> =C2=A01 file changed, 66 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/drm/kms/framebuffer.rs
> b/rust/kernel/drm/kms/framebuffer.rs
> index 54d0391388a9..1ec6779ba7de 100644
> --- a/rust/kernel/drm/kms/framebuffer.rs
> +++ b/rust/kernel/drm/kms/framebuffer.rs
> @@ -5,7 +5,12 @@
> =C2=A0//! C header:
> [`include/drm/drm_framebuffer.h`](srctree/include/drm/drm_framebuffer
> .h)
> =C2=A0
> =C2=A0use super::{KmsDriver, ModeObject, Sealed};
> -use crate::{drm::device::Device, types::*};
> +use crate::{
> +=C2=A0=C2=A0=C2=A0 drm::device::Device,
> +=C2=A0=C2=A0=C2=A0 error::{code::EINVAL, to_result},
> +=C2=A0=C2=A0=C2=A0 prelude::*,
> +=C2=A0=C2=A0=C2=A0 types::*,
> +};
> =C2=A0use bindings;
> =C2=A0use core::{marker::*, ptr};
> =C2=A0
> @@ -67,4 +72,64 @@ pub(super) unsafe fn from_raw<'a>(ptr: *const
> bindings::drm_framebuffer) -> &'a
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Our data layo=
ut is identical to drm_framebuffer
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { &*ptr.cast() }
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /// Return the raw `bindings::drm_framebuffer` for th=
is
> framebuffer.
> +=C2=A0=C2=A0=C2=A0 #[inline]
> +=C2=A0=C2=A0=C2=A0 pub(crate) fn as_raw(&self) -> *mut bindings::drm_fra=
mebuffer {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.0.get()
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /// Map this framebuffer's plane-0 backing pages into=
 the kernel
> address space for CPU
> +=C2=A0=C2=A0=C2=A0 /// access, for the duration of the returned guard.
> +=C2=A0=C2=A0=C2=A0 ///
> +=C2=A0=C2=A0=C2=A0 /// Only framebuffers with a single, CPU-visible plan=
e are
> supported (i.e. packed formats
> +=C2=A0=C2=A0=C2=A0 /// backed by GEM-shmem/CMA memory, not multi-plane Y=
UV or an
> IMPORTED dma-buf without a
> +=C2=A0=C2=A0=C2=A0 /// CPU mapping); other cases return `EINVAL`.
> +=C2=A0=C2=A0=C2=A0 pub fn vmap(&self) -> Result<FramebufferVmap<'_, T>> =
{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `iosys_map` is POD=
 (a pointer union plus a bool);
> all-zero is a valid
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // "not mapped" value that `d=
rm_gem_fb_vmap` overwrites for
> present planes.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut map: [bindings::iosys=
_map; 4] =3D unsafe {
> core::mem::zeroed() };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut data_map: [bindings::=
iosys_map; 4] =3D unsafe {
> core::mem::zeroed() };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.as_raw()` is=
 a valid, GEM-backed
> framebuffer for the lifetime of `self`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to_result(unsafe {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindi=
ngs::drm_gem_fb_vmap(self.as_raw(),
> map.as_mut_ptr(), data_map.as_mut_ptr())
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 })?;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `map[0]` was just =
filled in by `drm_gem_fb_vmap`
> above.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let vaddr =3D unsafe { map[0]=
.__bindgen_anon_1.vaddr };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if vaddr.is_null() {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SA=
FETY: balances the vmap just done, with the same
> `map`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsaf=
e { bindings::drm_gem_fb_vunmap(self.as_raw(),
> map.as_mut_ptr()) };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n Err(EINVAL);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(FramebufferVmap { fb: self=
, map, _p: PhantomData })
> +=C2=A0=C2=A0=C2=A0 }
> +}
> +
> +/// An RAII guard over a CPU mapping of a [`Framebuffer`]'s plane-0
> backing pages, created by
> +/// [`Framebuffer::vmap`].
> +///
> +/// The mapping is torn down when this guard is dropped, so an early
> return between mapping and
> +/// use can never leak it.
> +pub struct FramebufferVmap<'a, T: KmsDriver> {
> +=C2=A0=C2=A0=C2=A0 fb: &'a Framebuffer<T>,
> +=C2=A0=C2=A0=C2=A0 map: [bindings::iosys_map; 4],
> +=C2=A0=C2=A0=C2=A0 _p: PhantomData<T>,
> +}
> +
> +impl<'a, T: KmsDriver> FramebufferVmap<'a, T> {
> +=C2=A0=C2=A0=C2=A0 /// Plane 0's CPU virtual base address (guaranteed no=
n-null for
> the guard's lifetime).
> +=C2=A0=C2=A0=C2=A0 #[inline]
> +=C2=A0=C2=A0=C2=A0 pub fn as_ptr(&self) -> *const u8 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: set non-null in `F=
ramebuffer::vmap`; `vaddr` is
> the active union member.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsafe { self.map[0].__bindg=
en_anon_1.vaddr }) as *const u8
> +=C2=A0=C2=A0=C2=A0 }
> +}
> +
> +impl<'a, T: KmsDriver> Drop for FramebufferVmap<'a, T> {
> +=C2=A0=C2=A0=C2=A0 fn drop(&mut self) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.fb.as_raw()`=
/`self.map` are exactly the
> pair passed to
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // `drm_gem_fb_vmap` in `Fram=
ebuffer::vmap`, and the mapping
> has not been released
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // since.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::drm_gem_fb=
_vunmap(self.fb.as_raw(),
> self.map.as_mut_ptr()) };
> +=C2=A0=C2=A0=C2=A0 }
> =C2=A0}

