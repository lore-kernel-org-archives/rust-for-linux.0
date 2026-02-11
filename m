Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F3E274669;
	Wed, 11 Feb 2026 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770822068; cv=none; b=TEAgQR6D4Wy8ZOZh/FpwZzZk4SjgFvOy+E0DKIenfdP8tI9n/ULFD6g7t+4qJxYN5KljeZL5M/o902AH4jL/6uqaEjdr2Ove4gmMMYiW/mue2vdnfqV6x/o7CEZlSquyG66+L4dTMgN6zX5JGNeQKyz+eNhlAEvdQLZgW9o128Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770822068; c=relaxed/simple;
	bh=Qr0hJirRUXJ4nG3UbsCtaYyZU92hcAVog4Xnym16/6s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLMEEBNK9bRBU1pOHxlkQ5GIMy08/v9Yg4aoAbLMhyut96lXWmv0VQKUO45qxXBf2Fgl+0Bwh6+29LbMOSTXYq2E5lesE+ioVAY8nkTvvDyY/Mr98nK5eVkmkA3VeC7v2frKuWLPZh+D3qAeSEs+UKxJ/GF5EHzi59iQ5pHvV5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pmQd1pHQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pmQd1pHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770822065;
	bh=Qr0hJirRUXJ4nG3UbsCtaYyZU92hcAVog4Xnym16/6s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pmQd1pHQWhgNtYeepX6hL1Xqy860u0dyf+8VR4Up6pGkAMVk30nZc8/TE0p7kVvqw
	 M0y3ptl4pqvvHu5U82ICHVgaarPdANjFocvcNx5zxhUXx7c9vvN5779SRHzQsKg7gC
	 DDZvsVAWVw13sZEynSh7YSTqngYt4cUmC4ZA0wPKyFTqaFR5HxdHqYIIBIZN36/Bjg
	 4iCea5Ib3B4Y3sYYGEkqOuf0hHLQHwUxm2kGuuPYBL0qpVmomQUEpPwVkvVx/U3wEC
	 z3y0Qspf9g3lsOyI8FGG7xJuJ/x0mM9+MpsHF+iftKgQGNyo3A36OeVDk84xrR0ZfS
	 J3J5ORkq+XoiQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6ED6F17E012E;
	Wed, 11 Feb 2026 16:01:04 +0100 (CET)
Date: Wed, 11 Feb 2026 16:00:59 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Philipp Stanner" <phasta@mailbox.org>,
 <phasta@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260211160059.6e0d3b60@fedora>
In-Reply-To: <DGC7JWOL70HH.2AMUEI3M10I9J@kernel.org>
References: <20260205095727.4c3e2941@fedora>
	<DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
	<bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
	<20260209155843.725dcfe1@fedora>
	<c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
	<aYruaIxn8sMXVI0r@google.com>
	<20260210101525.7fb85f25@fedora>
	<aYsFKOVrsMQeAHoi@google.com>
	<DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
	<4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
	<aYsZHhX2IVO2kOSm@google.com>
	<DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
	<20260211112049.089b2656@fedora>
	<DGC2WYUT80B4.3D4QKYP8FVVQJ@kernel.org>
	<20260211121223.78674f22@fedora>
	<DGC7JWOL70HH.2AMUEI3M10I9J@kernel.org>
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

On Wed, 11 Feb 2026 15:38:32 +0100
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Wed Feb 11, 2026 at 12:12 PM CET, Boris Brezillon wrote:
> > On Wed, 11 Feb 2026 12:00:30 +0100
> > "Danilo Krummrich" <dakr@kernel.org> wrote:  
> >> I.e. sharing a workqueue between JobQs is fine, but we have to ensure they can't
> >> be used for anything else.  
> >
> > Totally agree with that, and that's where I was going with this special
> > DmaFenceWorkqueue wrapper/abstract, that would only accept
> > scheduling MaySignalDmaFencesWorkItem objects.  
> 
> Not sure if it has to be that complicated (for a first shot). At least for the
> JobQ it would probably be enough to have a helper to create a new, let's say,
> struct JobQueueWorker that encapsulates a (reference counted) workqueue, but
> does not give access to it outside of jobq.rs.

Except we need to schedule some work items that are in the
DMA-signaling path but not directly controlled by the jobq.rs
implementation (see [1] for the post-execution work we schedule in
panthor).

The two options I can think of are:

1. Add a an unsafe interface to schedule work items on the wq attached
   to JobQ. Safety requirements in that case being compliance with the
   DMA-fence signalling rules.
2. The thing I was describing before, where we add the concept of
   DmaFenceWorkqueue that can only take MaySignalDmaFencesWorkItem. We
   can then have a DmaFenceWorkqueue that's global, and pass it to the
   JobQueue so it can use it for its own work item.

We could start with option 1, sure, but since we're going to need to
schedule post-execution work items that have to be considered part of
the DMA-signalling path, I'd rather have these concepts clearly defined
from the start.

Mind if I give this DmaFenceWorkqueue/MaySignalDmaFencesWorkItem a try
to see what it looks like a get the discussion going from there
(hopefully it's just a thin wrapper around a regular
Workqueue/WorkItem, with an extra dma_fence_signalling annotation in
the WorkItem::run() path), or are you completely against the idea?

[1]https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/gpu/drm/panthor/panthor_sched.c#L1913
