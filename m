Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C56323741;
	Tue, 10 Feb 2026 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726985; cv=none; b=oYMciWXYmBQNsjV3tcQHvPCfNP5jMssuQ0cRfK8UXMBqBO/zBPYgmjUQaLGIAYcw7WLY23RxCMnLusfgQctChScDWUrC/1yu+DvNkZGdGWGukuaFFxbgRXHqhHV9g4ITfaGf6ac5N58PShlPHlrktT+wdRbARHbSeGPzUXEdzNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726985; c=relaxed/simple;
	bh=aD5YfdoGnM1IsIgPF1W3A3erOeJ+dRagPzid2UY35Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sa3/U7OL/kyXoDbY6mDTL9c/AOk06SIo7+deoIcEfYv5Qs57ZnxMTMWP0I9Y2p4A6Qv513KYesuDsj4OJKlQOI6VzFyrAC/wTj6piWXG6JLTDng3JElH3xU0Y9xX41zlLCF3/rVH7xTlOqejNq5zN1XzIJwJrfRfEaFO2rNRa2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DH3xO2wf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DH3xO2wf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770726982;
	bh=aD5YfdoGnM1IsIgPF1W3A3erOeJ+dRagPzid2UY35Wo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DH3xO2wf3cNzftL3ZKXIuhNF6lAHW9JQlH+rnQ/84zo1m5gDs+teqYgUsCo19xVar
	 TwI5wTeFusbJ1XjAyy8PO5W3iJRTf9MsIxbKtB6kbUh12rMyHhW1kwUZjVDA/QkMgw
	 i+oZWRkI9+87HXWd154TjQJqjotK5QG7ad17tYMJvH0dhW/etVYGRdB4qW9DOBsgGT
	 kBeqHNr7rvgpA4UfupZ6+N8cEq9rjTk0hMCoNhtpzXRvboupkLC+Ehh+d204ZeFRUS
	 nwCMR1noMKpk5LhkKQddA36kk8B5lcC21Bu4gkktTCxo9LnlyMkcuHDz6/qZYBWk8t
	 7BISZeplElNSw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF22A17E126B;
	Tue, 10 Feb 2026 13:36:21 +0100 (CET)
Date: Tue, 10 Feb 2026 13:36:17 +0100
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
Message-ID: <20260210133617.0a4be958@fedora>
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
> 
>         // enqueue the job
>         wq.enqueue(item, wq);
> 
>         // The signature of DmaFenceWorkItem::run() promises to arrange
>         // for it to be signalled.
>         self.i_promise_it_will_be_signalled()
>     }

I guess what's still missing is some sort of `transfer_to_hw()`
function and way to flag the IRQ handler taking over the fence
signaling token.

> }
