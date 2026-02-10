Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D79319877;
	Tue, 10 Feb 2026 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723280; cv=none; b=C7TZwf9HfAMRR9lrsCmaRWrvWhHdc5oLlAOG/xuO5CuthhO6GE2myHmTdwLS634JfTlgzRJ0yr3WTWGIKtDSOFHpVBQ5YQ2kGnWUDK9Sz/PiSiOPqvFncDXDO+icNE0aQKX77NITRtoKixh/QZ2Dm0nc4K1Xc/hs+qnfd8/KnA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723280; c=relaxed/simple;
	bh=xRiDU2FphF6eQQf2Bu/buKjJo8JUYjnl/i33A2i6Tyg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i2iCneyyO6Dr8BqMj3dk6MJAaRpCzyAiW4sp+/a6PgeORuD2CDsAIips0o7UDctfWdrKwaUfq6L9sHmoOpZkX5P/R9D2flB+vBjf07Lu3nBNvqyR1ga+2M2XMU2e9s0FVGBAQfwoHfP6Zy7gZ0OotIxAiQzo3F0fMXj7inEwHR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Lf/0cR6C; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Lf/0cR6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770723277;
	bh=xRiDU2FphF6eQQf2Bu/buKjJo8JUYjnl/i33A2i6Tyg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Lf/0cR6CAjusvnmZni1ZlRW4eH1NDJ4m0A4D1Xj6cKCMQKN6QtIABZn63iR9885yn
	 FcGBT0gG1SP256YMYHjyZunsuH1Hwt5u6t7IhxNaTkoughEkxdnNMmK2Iwa6hpjhdZ
	 nLZcWoDBgmTEbYfxA/egVqZPGldHNFm7/YoPAONjoRwLZsj7qFvwzHtY/NSNQ0qtPU
	 wKujLJh36EhYFInDb0Ervyb/JOzoSwlSVl4RiuuVM19Rtcva5p/Dj/2VZYzuOhgDPI
	 CiF4jXNeeRsBoKmmdNG/t3VU1qbCz6IfoXYXteB33/gnjDd1VRng80TGmguX997Pvj
	 FBhbB0BPZ/T8A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4483717E012E;
	Tue, 10 Feb 2026 12:34:37 +0100 (CET)
Date: Tue, 10 Feb 2026 12:34:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Christian =?UTF-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Philipp
 Stanner <phasta@mailbox.org>, phasta@kernel.org, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260210123432.588a20f5@fedora>
In-Reply-To: <aYsFKOVrsMQeAHoi@google.com>
References: <20260203081403.68733-2-phasta@kernel.org>
	<20260203081403.68733-4-phasta@kernel.org>
	<20260205095727.4c3e2941@fedora>
	<DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
	<bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
	<20260209155843.725dcfe1@fedora>
	<c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
	<aYruaIxn8sMXVI0r@google.com>
	<20260210101525.7fb85f25@fedora>
	<aYsFKOVrsMQeAHoi@google.com>
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

On Tue, 10 Feb 2026 10:15:04 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> impl MustBeSignalled<'_> {
>     /// Drivers generally should not use this one.
>     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }
> 
>     /// One way to ensure the fence has been signalled is to signal it.
>     fn signal_fence(self) -> WillBeSignalled {
>         self.fence.signal();
>         self.i_promise_it_will_be_signalled()
>     }
> 
>     /// Another way to ensure the fence will be signalled is to spawn a
>     /// workqueue item that promises to signal it.
>     fn transfer_to_wq(
>         self,
>         wq: &Workqueue,
>         item: impl DmaFenceWorkItem,
>     ) -> WillBeSignalled {
>         // briefly obtain the lock class of the wq to indicate to
>         // lockdep that the signalling path "blocks" on arbitrary jobs
>         // from this wq completing
>         bindings::lock_acquire(&wq->key);
>         bindings::lock_release(&wq->key);

Sorry, I'm still trying to connect the dots here. I get that the intent
is to ensure the pseudo-lock ordering is always:

   -> dma_fence_lockdep_map
      -> wq->lockdep_map

but how can this order be the same in the WorkItem execution path? My
interpretation of process_one_work() makes me think we'll end up with

  -> wq->lockdep_map
    -> work->run()
       -> WorkItem::run()
          -> dma_fence_lockdep_map
             -> DmaFenceSignalingWorkItem::run()
                ...

Am I missing something? Is there a way you can insert the
dma_fence_lockdep_map acquisition before the wq->lockdep_map one in the
execution path?

> 
>         // enqueue the job
>         wq.enqueue(item, wq);
> 
>         // The signature of DmaFenceWorkItem::run() promises to arrange
>         // for it to be signalled.
>         self.i_promise_it_will_be_signalled()
>     }
> }
