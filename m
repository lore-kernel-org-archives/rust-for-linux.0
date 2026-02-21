Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848CD21771B
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771663585; cv=none; b=lkTRIwebBrVPD5x0EQJt/FvKo3QiMP1fiAbwo7QP7IXWu7/38UE/6PIxbOGVx1Qbk1hjg3r81bmaOKrafVGr2fBeDdoS9Jl4gymrWno1RsCP+BKn20h+Qwy569NR8shm3AnOyqOOmcbL1ezFkdCqeTqXb4vOZCj0txah6Rur/Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771663585; c=relaxed/simple;
	bh=FvVhxenxS7HM/csXHU/D92CvynmXQ2FD7DgNw3v4dXI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DvC3jkMrnc7DRVjToIjvsITn7tvpc7bL2cCnmvC1PfNKZ2WWY5x+zo4iURH1zKsJoVKAQDxq0KF18ZkZpEBNKO02Htk0kvl/EWR1KCEHf6GNx3gdrIw/oZMavpNqBqneLthG7DjEQg3//DzWb1jZPbQG1rZm3hVKLOvBDpAgxi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ktvJn78U; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ktvJn78U"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b90484c398cso262045866b.3
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 00:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771663583; x=1772268383; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3nulCMAkP+Qci36vgPqlTJu8Ho7ZO6tqS+wQkIh7yUM=;
        b=ktvJn78UnvVm0v6d+i1WtfORgnuXeg3GAI8jbby6EEZnN1JAe23AVF7azoDlRaXNYl
         JpLCHm8EC+Zx+MINs8GYLW+ZEFJunwn5rj/urTFggfj7+j8QjregS3j5p9ZgXE0SPrqI
         rOuVsFki7gKe9Iu7xfZxFb18E/Ho9sj2bTUcsgRXR+ws8/CpPDrufkmTrQSq7lzgqIKr
         S8/FiJCr84s/dilNwB2/Ph/lj9LG/lPSsbnig2Yj7yAMQ8meDUvS3Ltb8TW0TCO5earQ
         OJCghKuYxTAQFamZlgzDcVfu2BQkQtlWZnULbuWCTa4neFGtu6hrz60xX3MiPQPGMKYT
         Bztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771663583; x=1772268383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nulCMAkP+Qci36vgPqlTJu8Ho7ZO6tqS+wQkIh7yUM=;
        b=lAE+q/9KR9I3ntIQIKlGkJuRMKh4lU94aK1TBDrTO8ZmyZRNszWRqZjAcjgFi06/Y8
         wyqMS8vVJvp+a5mlvN69YjE5izkYn1+472Z6oWZymhA0fptIZqzsn9e2ETX/5e5ST3PQ
         8hIXIdNQgKk22U5gt3nmuWMYzE/ePuYLp0v988f+nJjpv6v+s96x6I41nHGPte1aIOG6
         QIHY9occGh+Uo/kIcN6SM2xfwi8Yp91AkdGuo3Tjqrn+l0Wt4u/akU7F1e+tgpS1Tfgs
         9SRkhFk0zMImUOepNShW1Ruu3prF4jYtfg1XPXYzSKmfnMg7VI6L8O+jxEdg/wE6OdRf
         0Chw==
X-Forwarded-Encrypted: i=1; AJvYcCWbFyEmVUDl0pLryI9Zqkj0laZUComAsdIgP7nC09w0l0oerlKRS+FSn7HVkWjzhUnGzCrCdwMRKlj9pQjXZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEwT1R+EgNKwjdiil6d54sbOqD/kRNmSNpSzVf8hFGsUKUESIr
	PoUcUR5Yi/m6TbUP+hvA1r2ZM7BsXQRqXApjWrC7nufec1bg1hBvvvqqzIC49ywDmXyoW5FWe9H
	I3v5rjWb5alhHnWubig==
X-Received: from ejdck25.prod.google.com ([2002:a17:907:f1d9:b0:b88:451e:42d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e83:b0:b7f:f862:df26 with SMTP id a640c23a62f3a-b9081a0251bmr130091966b.14.1771663582622;
 Sat, 21 Feb 2026 00:46:22 -0800 (PST)
Date: Sat, 21 Feb 2026 08:46:21 +0000
In-Reply-To: <DGJX3FI97W1G.371MAMC60FX24@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com> <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org>
 <aZgYY_fetgz_GDR8@google.com> <DGJX3FI97W1G.371MAMC60FX24@kernel.org>
Message-ID: <aZlw3SGmLetHwaTM@google.com>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 20, 2026 at 05:08:09PM +0100, Danilo Krummrich wrote:
> On Fri Feb 20, 2026 at 9:16 AM CET, Alice Ryhl wrote:
> >> > +/// A [`GpuVmBo`] object in the GEM list.
> >> > +///
> >> > +/// # Invariants
> >> > +///
> >> > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and is present in the gem list.
> >> > +pub struct GpuVmBoRegistered<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> >> 
> >> I know that I proposed to rename this from GpuVmBoResident to GpuVmBoRegistered
> >> in a drive-by comment on v3.
> >> 
> >> But now that I have a closer look, I think it would be nice to just have GpuVmBo
> >> being the registered one and GpuVmBoAlloc being the pre-allocated one.
> >> 
> >> As it is currently, I think it is bad to ever present a &GpuVmBo to a driver
> >> because it implies that we don't know whether it is a pre-allocated one or a
> >> "normal", registered one. But we do always know.
> >
> > Actually, I think GpuVmBo is already the registered one.
> > GpuVmBoRegistered is just ARef<GpuVmBo<T>>.
> 
> GpuVmBoAlloc<T> dereferences to GpuVmBo<T>, so currently it is not.

I will drop the Deref impl.

> >> For instance, in patch 6 we give out &'op GpuVmBo<T>, but it actually carries
> >> the invariant of being registered.
> >> 
> >> Of course, we could fix this by giving out a &'op GpuVmBoRegistered<T> instead,
> >> but it would be nice to not have drivers be in touch with a type that can be one
> >> or the other.
> >> 
> >> I know that the current GpuVmBo<T> also serves the purpose of storing common
> >> code. Maybe we can make it private, call it GpuVmBoInner<T> and have inline
> >> forwarding methods for GpuVmBo<T> and GpuVmBoAlloc<T>. This is slightly more
> >> overhead in this implementation due to the forwarding methods, but less
> >> ambiguity for drivers, which I think is more important.
> >
> > I think we should keep the current state that GpuVmBo is registered, and
> > only GpuVmBoAlloc is not. That is most useful.
> 
> We seem to agree then: What I want is that from a driver perspective there is
> only GpuVmBo<T> (which is the registered thing) and GpuVmBoAlloc<T> which is the
> pre-allocated thing, i.e.  no separate GpuVmBoRegistered<T> type.

So, should we get rid of GpuVmBoRegistered in favor of ARef<GpuVm<T>>?

Alice
