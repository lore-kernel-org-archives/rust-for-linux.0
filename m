Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E15335959;
	Fri,  6 Feb 2026 20:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770409080; cv=pass; b=tsPGIMpMITo92SqZNco7qE0MKekco+N0mHcBrAjATRi1BHyuau1lA6QBoYzc0chL4YMQZOBdEGpydMa3mRr22mml+E2cNZI6taFS5SLGnSuER/9vI9G2dagljxbZFgLTfZdKSQvrrvU8hVrzdvrG7kSegnJHbMGiMqcrhK4DW9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770409080; c=relaxed/simple;
	bh=aBLsIyXnhmwtqEGPFfECgI8A636zMZv0i6UHjT1kLmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFo0l/b4pThyhcGMw1n+Aoy7GfKnXYiY1JmMlJ9IMeZEWkQR41aFZ2qbmfn2hx0ipe4P0RutXTZQswdQsU3chnj3b8J5F+4SnQnssRP5rwkQ0vlIP6k75b2kthCwXCutN0tVhXwcnH6hsH89LP4EvvyyIiUXaglQ9uh8I9FwU1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=PGAerKwN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="PGAerKwN"
ARC-Seal: i=1; a=rsa-sha256; t=1770409058; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JaxAksM5QlKxOAunQgtlV3fBBvzeWi2SGi6tix+OZoOwE7smiMsBugFiVrRaQfNIfOwF8PV5Mz5uplZ39dA7u6jOUmbwwIgTqhJW39yk8Hh5GBKHbgpeb5jSu2f/IPPvI9sR2wLgYZi7nvrv2U32HQYXcp/CgZTOPOTOwx/KJZ4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770409058; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KpnCgsohyPIIa4ZRNhXrjq+kv0xG6+JAdk3vWA+4KRk=; 
	b=O+dZFC67dDLF2bpeK2/HLomI7SryIK90KryOOxjxHuuOpK81N2N+dGEdcoYZcBsIuyI4NC4ySDEJlbbriSU/DiY+N14zijXsHfhs43RT0jalmXcrcBhe0WcY1G4LlDn9eLkbD6cocXH+eDWYNuN+gDx9WT5TT8h2u/aXntLZq2A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770409057;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=KpnCgsohyPIIa4ZRNhXrjq+kv0xG6+JAdk3vWA+4KRk=;
	b=PGAerKwNPGJPG54KHjdPNl6ZGhiazCYPnI8hMRNoTedpy2vqQ89Fnsx+cVzT3XFc
	rPiJHpeSHCwzZUJZDF+BKj6cmhfEElLLZ2IrytPa/RDhFyCwSSmYl+7NOC22FMVqnR5
	ux1L/JMxrX/H9nrEUbOFTYq/Z9gOGYVKgIhzvl3s=
Received: by mx.zohomail.com with SMTPS id 17704090553493.1968830592744553;
	Fri, 6 Feb 2026 12:17:35 -0800 (PST)
Date: Fri, 6 Feb 2026 12:17:34 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Janne Grunau <j@jannau.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 6/6] rust: gpuvm: add GpuVmCore::sm_map()
Message-ID: <aYZMXiv4GvyjPxoa@um790>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-6-8364d104ff40@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-gpuvm-rust-v4-6-8364d104ff40@google.com>
X-ZohoMail-Sender: Deborah Brouwer
X-ZM-MESSAGEID: 1770408352599127500

Hi Alice, I got a build error testing gpuvm v4 with Tyr.

On Fri, Jan 30, 2026 at 02:24:15PM +0000, Alice Ryhl wrote:
> Finally also add the operation for creating new mappings. Mapping
> operations need extra data in the context since they involve a vm_bo
> coming from the outside.
> 
> Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> +}
> +
> +impl<'op, T: DriverGpuVm> OpMap<'op, T> {
> +    /// The base address of the new mapping.
> +    pub fn addr(&self) -> u64 {
> +        self.op.va.addr
> +    }
> +
> +    /// The length of the new mapping.
> +    pub fn length(&self) -> u64 {
> +        self.op.va.range
> +    }
> +
> +    /// The offset within the [`drm_gem_object`](crate::gem::Object).
> +    pub fn gem_offset(&self) -> u64 {
> +        self.op.gem.offset
> +    }
> +
> +    /// The [`drm_gem_object`](crate::gem::Object) to map.
> +    pub fn obj(&self) -> &T::Object {
> +        // SAFETY: The `obj` pointer is guaranteed to be valid.
> +        unsafe { <T::Object as IntoGEMObject>::from_raw(self.op.gem.obj) }
> +    }
> +
> +    /// The [`GpuVmBo`] that the new VA will be associated with.
> +    pub fn vm_bo(&self) -> &GpuVmBo<T> {
> +        self.vm_bo
> +    }
> +
> +    /// Use the pre-allocated VA to carry out this map operation.
> +    pub fn insert(self, va: GpuVaAlloc<T>, va_data: impl PinInit<T::VaData>) -> OpMapped<'op, T> {
> +        let va = va.prepare(va_data);
> +        // SAFETY: By the type invariants we may access the interval tree.
> +        unsafe { bindings::drm_gpuva_map(self.vm_bo.gpuvm().as_raw(), va, self.op) };
> +
> +        let _gpuva_guard = self.vm_bo().lock_gpuva();
> +        // SAFETY: The va is prepared for insertion, and we hold the GEM lock.
> +        unsafe { bindings::drm_gpuva_link(va, self.vm_bo.as_raw()) };
> +
> +        OpMapped {
> +            _invariant: self._invariant,
> +        }

error[E0308]: mismatched types
  --> rust/kernel/drm/gpuvm/sm_ops.rs:98:25
   |
98 |             _invariant: self._invariant,
   |                         ^^^^^^^^^^^^^^^ expected `PhantomData<*mut &mut T>`, found `PhantomData<fn(&mut T) -> fn(&mut T)>`
   |
   = note: expected struct `core::marker::PhantomData<*mut &mut T>`
              found struct `core::marker::PhantomData<fn(&'op mut T) -> fn(&'op mut T)>`

Updating the PhantomData type for OpMapped to match OpMap
seems to fix it.

Deborah

