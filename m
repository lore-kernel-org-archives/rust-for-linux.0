Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5506C17ADE0;
	Tue, 10 Feb 2026 12:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770728199; cv=none; b=DgPKUtMF++RdqTmOB/mxyz9y28D1BxGJ8pqE3go/NBjCZQHODnYcqh0gz2MQKFbwOLJYac7LlL/cIP3reYPbWjoenz8uTilmaccmb4YI//ZVYNy1hl86hLi9ubZ1MoNrFgpkQhWrbkzzM20tDI5ReaokqHIm5Yyh/RgzMZRh5cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770728199; c=relaxed/simple;
	bh=3sVx9kzC9+Y0SUyoKk1lED+Isv1q31yWZzTbhf4FnVU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HjjVtoTj4KUiBruXrv+xZ+SZ6q+iydm7LzkD5DsHaRUeC1ehbo2JCDejtq2mvba8SJuZlEwynRHHxCCvFnG/RMv/uahkphm9axSIfT7SQwTgX82Xfj8924DxRluZW740I85bN+ug/mTInmib3BdcuDJ+gvDaE4w/T7Z5MbrQ5UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=J+WJQ+EZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J+WJQ+EZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770728196;
	bh=3sVx9kzC9+Y0SUyoKk1lED+Isv1q31yWZzTbhf4FnVU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J+WJQ+EZhWNtRq87NGKEdiCqZIe0Ga8pc6rXhTypqK8UapDD8I+mK4g6g5wwLHJUl
	 aNiElLlRGKxm5LS8q/vuCsmuwqNxPdSqPNcT3Vf4rYwPpPz5RTWNRDSmCGAlQ8H0pc
	 4Xy9EprW0HhNWbd7Be8fN0RWI5ae9mlo3d8MAy4l58vq2U+7oinEMg5Dl7g0BcBEh3
	 ekBqs0Wg8rloCtVj9EPHsfpb+Mv/JFNMljYUxOdmOR3x0OSTxyXmGV8EmQb6ZDIbsU
	 sleWwTeMG4ZG68G2B7KCQ3lRIsUyqkO4r/9piSmRQ6fyQRTe0Bb03VvXkt8Qoj+Ifj
	 V9ZRp7V4i4HDA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 17CA717E126B;
	Tue, 10 Feb 2026 13:56:36 +0100 (CET)
Date: Tue, 10 Feb 2026 13:56:26 +0100
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
Message-ID: <20260210135626.0fe9b590@fedora>
In-Reply-To: <20260210134913.33cb674f@fedora>
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
	<20260210134913.33cb674f@fedora>
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

On Tue, 10 Feb 2026 13:49:13 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Tue, 10 Feb 2026 10:15:04 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > /// The owner of this value must ensure that this fence is signalled.
> > struct MustBeSignalled<'fence> { ... }
> > /// Proof value indicating that the fence has either already been
> > /// signalled, or it will be. The lifetime ensures that you cannot mix
> > /// up the proof value.
> > struct WillBeSignalled<'fence> { ... }  
> 
> Sorry, I have more questions, unfortunately. Seems that
> {Must,Will}BeSignalled are targeting specific fences (at least that's
> what the doc and 'fence lifetime says), but in practice, the WorkItem
> backing the scheduler can queue 0-N jobs (0 if no jobs have their deps
> met, and N > 1 if more than one job is ready). Similarly, an IRQ
> handler can signal 0-N fences (can be that the IRQ has nothing to do we
> job completion, or, it can be that multiple jobs have completed). How
> is this MustBeSignalled object going to be instantiated in practice if
> it's done before the DmaFenceWorkItem::run() function is called?

For the scheduler WorkItem (assuming a JobQueue model), it's kinda
doable, because this is a FIFO, and we can get the first job in the
queue (and thus the fence attached to this job) quite easily, but as
soon as it's a post-execution WorkItem or IRQHandler, we never know
when entering WorkItem::run()/ThreadedHandler::handle_threaded()
which job will be completed (if any).
