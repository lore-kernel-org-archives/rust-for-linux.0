Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9673D3358C9;
	Mon, 26 Jan 2026 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439646; cv=none; b=Gi9/mnIh/jCcl9rOurSUv4I5jP9mi5i4SDsSK2UpRJF5ZT4z+H4WQMGKnZz+jwfFcb2BkcXXzbsHnOgibdHlXAn4ETaB2nJAPTutf2X96amlXAYO32e7O4RYB9/Zc+UyKt9M2cJUt2xIitFO5j+PTYFdMrFL88t8+/wgYSLYOYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439646; c=relaxed/simple;
	bh=vw6z8ZGo6PgeHs5Ehjr4OdzYvmwTaU+5mdR6XfWOOkE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h1iB+ZQJtkX293nWR5PyLweRdByaSp3K9fXOAGVAW0l6QWEleY46VxbaE87E3n5B/MPsuW+8M8degTMwpiMIC5aPeaLm8ReMBNwqTMRx7QzkHGcBgXCDwb0uSXVS8O9Kl7Dto6i32KydpmtpB3tOPa0vxl2zQO4PZpn3VOpHzUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aY1KVLeN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aY1KVLeN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769439642;
	bh=vw6z8ZGo6PgeHs5Ehjr4OdzYvmwTaU+5mdR6XfWOOkE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aY1KVLeNR/TDZRb5voHD+pg0P5OcXsDAy+sLEx+stAEjihoxKSMIGRCmWzv3ZueyM
	 KMBsji9ak9z0FwEWmgy50bZeh58PnpSznWq3KRWYOhAEdsgiF+Jtv6ULJsP9htCfpq
	 OXrDHYmlKWdKfB+CMXmTSxqG8kgrbv8uIC8C96yE7OPtVt+kCy3oh1MpR2HvGyLo/g
	 n/kj+BDqzMzvh08jhaPy/0LY1xcwDB7gV28DSglamilOPqmMsBYXoHhBlkE2xN/T0L
	 zs5m1F3hmR0jx8e0lydvoHaan99m2c0sDLbXr4OmkqMWny4Alg/mCN6IU4CqkF4Cvv
	 CRjS6NWPuCTyQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DAD517E0342;
	Mon, 26 Jan 2026 16:00:42 +0100 (CET)
Date: Mon, 26 Jan 2026 16:00:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Janne Grunau <j@jannau.net>, Matthew Brost
 <matthew.brost@intel.com>, "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?="
 <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, Asahi
 Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 3/6] rust: gpuvm: add GpuVm::obtain()
Message-ID: <20260126160036.2b2c66a7@fedora>
In-Reply-To: <20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com>
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
	<20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com>
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

On Wed, 21 Jan 2026 11:31:19 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> +/// A [`GpuVmBo`] object in the GEM list.
> +///
> +/// # Invariants
> +///
> +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and is present in the gem list.
> +pub struct GpuVmBoResident<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);

I find the name a bit confusing: BO residency is often used to refer to
memory backing the buffer object, and in this case, you can end up with
a GpuVmBoResident being returned for a BO that has been evicted (one
that's no longer resident).

> +
> +impl<T: DriverGpuVm> GpuVmBoResident<T> {
> +    /// Returns a raw pointer to underlying C value.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
> +        // SAFETY: The pointer references a valid `drm_gpuvm_bo`.
> +        unsafe { (*self.0.as_ptr()).inner.get() }
> +    }
> +}
