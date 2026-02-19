Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265BE30BB8C;
	Thu, 19 Feb 2026 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771512907; cv=none; b=fQhfkbtjS1JYNHkAUmXTG1U1BDcUJqnbc/0v4kgDvKaFm8yeAHOYTbOjNdWtkHl6hnQetpQOwvs35twkfVY0rulfQXPK0aPjsrL0drUDIcbSaj8UVz5/fa7TNc0U9z51W88DV6NdJE0F/GIpkRW4ax+BbBWYJF8SK/vRWAigXXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771512907; c=relaxed/simple;
	bh=raLPxlV9F8FTfo74PhysGAOWkotY/LlTueqi38TjxSQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=aek9+FBOTIRFK9epouJX6Ta15NijOgLvHf+QljmST7dJoxnbNG2qZndvRGVEtAQNqG9ZioHs9gJ1lTb8T1qQTq5GUflNlLAjQybybSodGY2a3C6Bp2Xk2ZqbBQAkpRAKahxRZj56jwnnpv91E6+EhETuN87CJmgOtdUtHJvdyvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wd6Ifn/u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wd6Ifn/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C87C4CEF7;
	Thu, 19 Feb 2026 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771512906;
	bh=raLPxlV9F8FTfo74PhysGAOWkotY/LlTueqi38TjxSQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Wd6Ifn/u2GUjn0JKXOwsCLJ58WFAa17fnraBVt1f57Sv6HtnP5eZquqx9Nb4qevRY
	 W1mDSY7vSgJtyeTiH33wPNBCI2Hp72VNuGYn9uHKpKwWBv4K+CbDonR0mOikH/Mk8o
	 3MyDvl0FkhpaTzZ0/p+wYqf0aopMb3FrcuahEXcHYYnuZcfbYtEPVluIg8iuO1+LLn
	 zvVtQw1IlldnMFpYnrHHXWlb2I5rJ3kjsrR0FWmNAmqcT+7XUowzRJhQd2RAftdudp
	 16JihmfEgPmmpTDtGLpUIsgv3l3MA9dfcFGT4oCnhXa0RowlBSTqePxU5KUDu7wsSC
	 +16n0dxF7B33g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 15:55:02 +0100
Message-Id: <DGJ0WWM0F1ZR.OJ1VWJUDC6E8@kernel.org>
Subject: Re: [PATCH v4 1/6] rust: drm: add base GPUVM immediate mode
 abstraction
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-1-8364d104ff40@google.com>
 <DGJ0IL3LLZRW.3JC9RY1GDIJA6@kernel.org> <aZchECrW8mPbZMq8@google.com>
In-Reply-To: <aZchECrW8mPbZMq8@google.com>

On Thu Feb 19, 2026 at 3:41 PM CET, Alice Ryhl wrote:
> On Thu, Feb 19, 2026 at 03:36:20PM +0100, Danilo Krummrich wrote:
>> On Fri Jan 30, 2026 at 3:24 PM CET, Alice Ryhl wrote:
>> > +/// A DRM GPU VA manager.
>> > +///
>> > +/// This object is refcounted, but the "core" is only accessible usin=
g a special unique handle. The
>> > +/// core consists of the `core` field and the GPUVM's interval tree.
>>=20
>> I think this is still a bit confusing, I think we should just rename Gpu=
VmCore
>> to UniqueGpuVm and rewrite this to something like:
>>=20
>> "The driver specific data of of `GpuVm` is only accessible through a
>> [`UniqueGpuVm`], which guarantees exclusive access."
>
> But it's not really the same as e.g. UniqueArc<_>, which implies that
> there are no normal Arc<_>s whatsoever. This one is just a special ref,
> but there may also be normal refs at the same time.

Fair enough, what about UniqueRefGpuVm then? I think that's more descriptiv=
e
than GpuVmCore.

>> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm) -> &'a =
Self {
>> > +        // SAFETY: Caller passes a pointer to the `drm_gpuvm` in a `G=
puVm<T>`. Caller ensures the
>> > +        // pointer is valid for 'a.
>> > +        unsafe { &*kernel::container_of!(Opaque::cast_from(ptr), Self=
, vm) }
>>=20
>> I'd pull the Opaque::cast_from() call out of the unsafe block.
>
> I think that's a bit verbose, and all existing uses do it inside the
> `container_of!`.
>
>> > +/// The manager for a GPUVM.
>>=20
>> This description seems a bit odd. In the end, the trait makes GPUVM awar=
e of
>> other driver specific types. So, maybe a better name would be
>> gpuvm::DriverAttributes, gpuvm::DriverTypes, gpuvm::DriverInfo or just
>> gpuvm::Driver. My favorite is gpuvm::DriverInfo.
>>=20
>> We should also change the doc-comment accordingly. Maybe somthing like: =
"This
>> trait make the [`GpuVm`] aware of the other driver specific DRM types."
>
> I mean, it doesn't just do that. The type implementing this is the type
> stored in the `core` field, so you really do get more than just some
> type relationships from it.

The only types subsequently added to this trait are VaData and VmBoData, i.=
e.
type relationships.

The trait is not related to the private data type T, i.e. it is theoretical=
ly
possible to have T for the private data and I: gpuvm::DriverInfo for the ty=
pe
relationships, right?.

>> > +pub trait DriverGpuVm: Sized {
>> > +    /// Parent `Driver` for this object.
>> > +    type Driver: drm::Driver<Object =3D Self::Object>;
>> > +
>> > +    /// The kind of GEM object stored in this GPUVM.
>> > +    type Object: IntoGEMObject;
>> > +}

