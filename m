Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B956E2DBF40;
	Fri, 20 Feb 2026 16:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603693; cv=none; b=guo/uiznmWduNGlFvujFQE5AjIp+QR54PEc26y3qnR2xB31pvez3fpVpLUsl6P/BdYmutKll/orinNtIl+dfQMMs41BtNRj9VttPd5e0ycQ//BX82Rnpuk9GZP4F2ChzGVEKi/yleyPPr9wzeX5s0BasGra0xNcF0wK90wRwlqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603693; c=relaxed/simple;
	bh=UuWmFuz2m0mN4cMlxdeJvkzkx5VgTQVuM6TTLhpowr8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=HlC5O3e3Xb0W3ARG91MrZ66ILkYl2zuNUWKHhPhIfEeMXe7zetSiotgGgiJ01Lz55Q6cbZHHRDhX7lCuOkL3ffNp6L/ad3XmAsqu2P5kUQ0V02L1Ddouzz+aCLVfcKbjJglOAW8xMs25T9ln5jifEHtT6PCtYGHIOMmvCoTnm3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDQJbxeo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDQJbxeo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550F5C19421;
	Fri, 20 Feb 2026 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771603693;
	bh=UuWmFuz2m0mN4cMlxdeJvkzkx5VgTQVuM6TTLhpowr8=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=BDQJbxeob9xDYgpdgCGDiBLLFhNY8g1cPoZS2tcPBj9mGd/aXJbKOPvaB/eGlpJ4x
	 vAj2XePUs3AhJxwNGcF/lghrwWDftMuP0OjobiYfXHW2IIQ4RXF7cP+h37ynZKvS/i
	 /5lNb/lgeVuBR0MoVcpIDYgr9JSU/U30hlnR3/2B+DKQTO913m2cfHi8PndKHPm1IE
	 +t669Gg/X0hjisK6olYM2a2X2TeVbb1j+emMEV/0Yz3p4Cjx4SiwAIgfWBgAoUKLj/
	 I5uX0RlFnrv6c84I+p+COEtJ7lpGv8I3bTt6n3sLEHs4+BQEmXr29X6ykXeTXd3gsy
	 rmjoIi6bfruew==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 17:08:09 +0100
Message-Id: <DGJX3FI97W1G.371MAMC60FX24@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com>
 <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org> <aZgYY_fetgz_GDR8@google.com>
In-Reply-To: <aZgYY_fetgz_GDR8@google.com>

On Fri Feb 20, 2026 at 9:16 AM CET, Alice Ryhl wrote:
>> > +    /// Access this [`GpuVmBo`] from a raw pointer.
>> > +    ///
>> > +    /// # Safety
>> > +    ///
>> > +    /// For the duration of `'a`, the pointer must reference a valid =
`drm_gpuvm_bo` associated with
>> > +    /// a [`GpuVm<T>`].
>> > +    #[inline]
>> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm_bo) -> &=
'a Self {
>>=20
>> I think this a good candidate for crate private, as we don't want driver=
s to use
>> this, but still use it in other DRM core modules.
>>=20
>> > +        // SAFETY: `drm_gpuvm_bo` is first field and `repr(C)`.
>> > +        unsafe { &*ptr.cast() }
>> > +    }
>> > +
>> > +    /// Returns a raw pointer to underlying C value.
>> > +    #[inline]
>> > +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
>>=20
>> Less important, but probably also only needed in core DRM code.
>
> For cases like these two, I do think one can run into cases where you
> want them to be public. E.g. the vma confusion bugfix uses a raw pointer
> for now:
> https://lore.kernel.org/all/20260218-binder-vma-check-v2-1-60f9d695a990@g=
oogle.com/

I think we should make them public once actually needed.

> I'm generally not so worried about methods like these being public
> because they can't be used without unsafe.

Yeah, but my experience is that drivers can get very creative in figuring o=
ut
how to abuse APIs. I think it's best to keep the surface for this as small =
as
possible.

>> > +/// A [`GpuVmBo`] object in the GEM list.
>> > +///
>> > +/// # Invariants
>> > +///
>> > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` an=
d is present in the gem list.
>> > +pub struct GpuVmBoRegistered<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
>>=20
>> I know that I proposed to rename this from GpuVmBoResident to GpuVmBoReg=
istered
>> in a drive-by comment on v3.
>>=20
>> But now that I have a closer look, I think it would be nice to just have=
 GpuVmBo
>> being the registered one and GpuVmBoAlloc being the pre-allocated one.
>>=20
>> As it is currently, I think it is bad to ever present a &GpuVmBo to a dr=
iver
>> because it implies that we don't know whether it is a pre-allocated one =
or a
>> "normal", registered one. But we do always know.
>
> Actually, I think GpuVmBo is already the registered one.
> GpuVmBoRegistered is just ARef<GpuVmBo<T>>.

GpuVmBoAlloc<T> dereferences to GpuVmBo<T>, so currently it is not.

>> For instance, in patch 6 we give out &'op GpuVmBo<T>, but it actually ca=
rries
>> the invariant of being registered.
>>=20
>> Of course, we could fix this by giving out a &'op GpuVmBoRegistered<T> i=
nstead,
>> but it would be nice to not have drivers be in touch with a type that ca=
n be one
>> or the other.
>>=20
>> I know that the current GpuVmBo<T> also serves the purpose of storing co=
mmon
>> code. Maybe we can make it private, call it GpuVmBoInner<T> and have inl=
ine
>> forwarding methods for GpuVmBo<T> and GpuVmBoAlloc<T>. This is slightly =
more
>> overhead in this implementation due to the forwarding methods, but less
>> ambiguity for drivers, which I think is more important.
>
> I think we should keep the current state that GpuVmBo is registered, and
> only GpuVmBoAlloc is not. That is most useful.

We seem to agree then: What I want is that from a driver perspective there =
is
only GpuVmBo<T> (which is the registered thing) and GpuVmBoAlloc<T> which i=
s the
pre-allocated thing, i.e.  no separate GpuVmBoRegistered<T> type.
