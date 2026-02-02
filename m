Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A36C22FDFF;
	Mon,  2 Feb 2026 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045358; cv=none; b=CoNnzZhnJorgFtJzeVg65oDN2P38gg/FZT11Ga2cuSTbb6ijJYUdtipUv0zKAYQRx31AWqHKhWC0eawretPT41YAhNZAt9zCCB087WiXIcusaHD1NQE6q8rllWIlH5mla5kf+F2KlQ9U4O6N/LG5jxehBVw4RS3NExChv8VKgEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045358; c=relaxed/simple;
	bh=OcUwAr1ZYHUzqb6b+sz09l94GcZGokMFPDMAzk1vNVo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aghaG6hWDZ93aRcoSG9VNHZdgj4ZSjxNefRFXqIJ3WeXEfHBq68xKWVXsxABsGtcgGpOjWizUT3JLShb4PCTDmbGxHux01SxXYHTGXp/PccdQ7UiYjlVZcw3UYlNo2VI/Ae//kPqOVbQtYiLvn4Dr19kihjoXS6h1MlcuJQeBfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DwHMXKKh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DwHMXKKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770045355;
	bh=OcUwAr1ZYHUzqb6b+sz09l94GcZGokMFPDMAzk1vNVo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DwHMXKKh768WvfI2pcdWXjwAf5Xa6Ti9V1aLGL026dvELcbX16ELF6s7NZZ6eMIYK
	 mhHBMIOOYQp6sVtvOQw3lc/NYC8XoOrFvV5OHxACwM1HD8yBwS0LPQ7slxX0q47+Bk
	 FxR5La5SQaFEaaJq5jjRykEpruH78JeqArkttz8HxF/hdQMIGoCkggpJLATRefKrUB
	 azpL6jt9EvH1zXCl8nyuouO12CD4xyecDZKY5h5SJL0URIq/M9PhuzRK/nUzO0eM3Z
	 eWg0CEzhZzZgRb4WuRGV7tLE0/CX203cwKrhtBLPe7wuy/kbi41jDeQ0ACWmv424/z
	 S1+QAlV7kPC+g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 231EE17E14D8;
	Mon,  2 Feb 2026 16:15:55 +0100 (CET)
Date: Mon, 2 Feb 2026 16:15:51 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>, dri-devel@lists.freedesktop.org
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Janne Grunau <j@jannau.net>, Matthew Brost
 <matthew.brost@intel.com>, "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?="
 <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, Asahi
 Lina <lina+kernel@asahilina.net>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 1/6] rust: drm: add base GPUVM immediate mode
 abstraction
Message-ID: <20260202161551.0ee2f08a@fedora>
In-Reply-To: <20260130-gpuvm-rust-v4-1-8364d104ff40@google.com>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
	<20260130-gpuvm-rust-v4-1-8364d104ff40@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Alice,

On Fri, 30 Jan 2026 14:24:10 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> +/// A DRM GPU VA manager.
> +///
> +/// This object is refcounted, but the "core" is only accessible using a special unique handle. The
> +/// core consists of the `core` field and the GPUVM's interval tree.
> +///
> +/// # Invariants
> +///
> +/// * Stored in an allocation managed by the refcount in `self.vm`.
> +/// * Access to `data` and the gpuvm interval tree is controlled via the [`GpuVmCore`] type.
> +#[pin_data]
> +pub struct GpuVm<T: DriverGpuVm> {
> +    #[pin]
> +    vm: Opaque<bindings::drm_gpuvm>,
> +    /// Accessed only through the [`GpuVmCore`] reference.
> +    data: UnsafeCell<T>,
> +}
> +
> +// SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
> +unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVm<T> {
> +    fn inc_ref(&self) {
> +        // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
> +        unsafe { bindings::drm_gpuvm_get(self.vm.get()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
> +        unsafe { bindings::drm_gpuvm_put((*obj.as_ptr()).vm.get()) };
> +    }
> +}

As discussed on Zulip, in Tyr, we're gonna need Sync+Send on GpuVm<T> if
we want to be able to call some of the thread-safe functions
concurrently (thinking of obtain(), but other read-only info might be
needed to).

Regards,

Boris
