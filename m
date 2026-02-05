Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84193921DA;
	Thu,  5 Feb 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281854; cv=none; b=MtL7onSRbj2whT5ffibj4kmHQ84MAkIUJU2XjC7OQgwCOf+FVdOBZJDgijKnyJhIHyTPI/UobX3NhWZVj9mfh2NbZ8f1oitI0idoEhBSO1+ErrUSlyBase8ISDQuNW1iJEpLCPSENUtubC0bAA7TVgsDqjqwr8DyQEK22nTYPPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281854; c=relaxed/simple;
	bh=ievRL1UrAqDbcV4FouDDI6LBWuW8kiFgJWc5S1huqZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u8r3k/koM5CzXY6+FaxACXdOSVT4vQ6fYyUmFWW4fW48lKHtimB5y2msOeGJL8FGRAQj+4LvS/ldHg1cNf3lihBkIs832F/bXqDIva3wu4XjQNQqKh56ROvAnWep9GTaIFVjaU9q3kTbjAkP6WOXA3ROgwN17xbgwUTsQNCSSL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JftojCoU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JftojCoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770281852;
	bh=ievRL1UrAqDbcV4FouDDI6LBWuW8kiFgJWc5S1huqZQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JftojCoUDqcMhG7mjifhPlZ4N8LGER57VVo2KZZfCV+WpKua0hxWhjPTf7lARbKMl
	 6j+8pzOsBi4FpiFWdChry3SjCPXKNVbVDN5YANsHL1wF4I5BfXPo1EQRJlqNpEHxc5
	 xj9tUTZSpebz2PgoVy1oVk3G+syoWwNMjeBaRvf0QINw7+hOucCxT8US6aR/zjd89F
	 VydDglp1+uUBayx/78rHKrW0MEUWGWVDHS3eysFvgotPSWYHGmdPlZ2/A4RXkaSPZP
	 txj6zWGoEMeHE3ctPuWr3YUCRT8tB+llc71kNYa+X3Zff23xgdniGC83vubilCwmQz
	 0OMa6occpwDjQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7131017E1299;
	Thu,  5 Feb 2026 09:57:31 +0100 (CET)
Date: Thu, 5 Feb 2026 09:57:27 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary
 Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260205095727.4c3e2941@fedora>
In-Reply-To: <20260203081403.68733-4-phasta@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
	<20260203081403.68733-4-phasta@kernel.org>
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

Hi Philipp,

On Tue,  3 Feb 2026 09:14:01 +0100
Philipp Stanner <phasta@kernel.org> wrote:


> +
> +    /// Mark the beginning of a DmaFence signalling critical section. Should be called once a fence
> +    /// gets published.
> +    ///
> +    /// The signalling critical section is marked as finished automatically once the fence signals.
> +    pub fn begin_signalling(&mut self) {
> +        // FIXME: this needs to be mutable, obviously, but we can't borrow mutably. *sigh*
> +        self.signalling = true;
> +        // TODO: Should we warn if a user tries to do this several times for the same
> +        // fence? And should we ignore the request if the fence is already signalled?
> +
> +        // SAFETY: `dma_fence_begin_signalling()` works on global lockdep data and calling it is
> +        // always safe.
> +        self.signalling_cookie = unsafe { bindings::dma_fence_begin_signalling() };

Maybe it's me misunderstanding what's happening here, but I don't think
you can tie the signalling section to the fence [published -> signalled]
timeframe. DmaFence signalling critical section is a section of code, in
a thread, that's needed for any previously published fence to be signalled,
and as such, has constraints on memory allocation types and locks it can
acquire (any lock taken while a blocking allocation happens can't be taken
in the DmaFence signalling path for instance).

But here, you're going to flag the thread doing the submission as
being in the signalling path, and this will likely be dropped in a
different thread (because the signalling will happen asynchronously,
when the job is done or cancelled). Think about this sequence for
instance:

	thread A				thread B (workqueue thread)
	
	iocl(SUBMIT_xxx) {
		create(job)
		arm(job->fence)							<- fence signalling section starts here
		queue(job)
	}

	ioctl(xxxx) {
		kmalloc(GFP_KERNEL)						<- BOOM, can't do blocking alloc in a
										   fence signalling path
	}

						job_done_work() {
							...
							signal(job->fence)	<- fence signalling section supposedly ends here in
										   a completely different thread it was started
						}

Unfortunately, I don't know how to translate that in rust, but we
need a way to check if any path code path does a DmaFence.signal(),
go back to the entry point (for a WorkItem, that would be
WorkItem::run() for instance), and make it a DmaFenceSignallingPath.
Not only that, but we need to know all the deps that make it so
this path can be called (if I take the WorkItem example, that would
be the path that leads to the WorkItem being scheduled).

Hopefully Alice and other rust experts can come up with some ideas
to handle that.

Regards,

Boris
