Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B2A221FCD
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723940; cv=none; b=cv7HZ7+r91LE9oq8LopB7u1piMVgdgMIDvTY/qaB4nl4A+GLZhg+mUPv1JJ6Lf389Y5sG36kUFCvEFFrMq6g+6HBb02fczquPZjoJo6vThj5bJ/T9xlbJBI9Ad7oDI1serNm/+41wlgiRVzt+u2BgGUGy04CEF0O5a/KCOn4Y48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723940; c=relaxed/simple;
	bh=1YHfEISyI01oKqDZI2FOVhFvWdo5staEpXPJ7XEMX8w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RpbxYOVSDp+Jo+WIFQr46IU7S7l+Iv2Lc/NF7UdN12yFwek/0oRv2A775MuKaOdJe1YQB/OzvUdaF5VYZM2R9E2edO6VTZONbIOxfKTp2+YVvBumok8fgpjchde/OLcS9uCDaISgkgMrYWkc8ALw5F1c+raEjixTdCRFPr170IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OzMBkhzb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OzMBkhzb"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4802bb29400so51329745e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 03:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770723937; x=1771328737; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FhyqHwDydhtKGY3YKE2q4rmdMYVlIl0zSjuX94GgR8w=;
        b=OzMBkhzbHl8UZXB4vfloaB/5v6ZyREvPmslPG/jlgbNOPuJ0D91aWP4lwi/93ej29u
         S3BGAPqHxVBFpzb5v5RD6mkNOdTL5z/dy/z0g/26gLNrhwuK+tO093g7D8NkUkHPdrJJ
         UHLLUP0MXvgJiGMOYYkv/29QEDoHi0CrOVd5D/FCqaR1p3ooKGgW2n8o4KUov98A8+cR
         l0QLxcwwrPp2054OEDkqOy53ZyVmDDluHa+gIqqUJ5SnJpsBnDlt/vX8fqbiP17ZCEuF
         Kb6+FwCoPRzeWsg0rNsAE+GTimx5C2GJtkrmrBfgPxrZ4Mb5UtvwCdO0U62ye2wXBtLp
         sNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723937; x=1771328737;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FhyqHwDydhtKGY3YKE2q4rmdMYVlIl0zSjuX94GgR8w=;
        b=ZC8bbC4AJekBIQ5CIyNZOfrFV3Ey6GMf+HYl20QPNSoGd3gsy/+nH5tOo8XfT+QHxi
         odrAReld/CtF9nodToZ2HKanJeNDZ+vwyH8vsN9VSaT6qbxNbI6qoZmLbFRkye7gJ4qr
         LburzTjKICJaMktNxgIQWeppLPhnTddXBQjc9dPx3zWSSbvzEB0u5dE770Zk4e91+BtS
         2zDC+3IAAKq6K0mvjUXSD/89em033wewlVZ1vbDwEqqvgLEK66slyHlJX7vRAKVYjM6F
         tkxKQVzeU/aw623bmVcL2lzAUAdRRtLb1kLSN9VqiQolIktgXR88YX8hUqxi7UlCE8+F
         FGQw==
X-Forwarded-Encrypted: i=1; AJvYcCW1k0bmlyQuQMSM50d5PkmrFyX3RfRS2Vn/yDkW3W+bkutT/PWveympIejivKrkKKobdIPDwxgWzY5qXSfXcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJOXc+BP/vO0XCaSHJstPcetev5yBHpBvB2qPIfrio8NanUrmN
	bJJt4xC7vrEDXgEbfvtQzK3C8A9lbkzaJEszFiH5wGyFvTx9OR8sGk2KSwVCLz4fx+oyXtvroEG
	oWiS8Itmaeg+xRiglzQ==
X-Received: from wmqo9.prod.google.com ([2002:a05:600c:4fc9:b0:480:4a03:7b78])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b09:b0:480:6999:27ec with SMTP id 5b1f17b1804b1-483507e1accmr28102895e9.13.1770723937377;
 Tue, 10 Feb 2026 03:45:37 -0800 (PST)
Date: Tue, 10 Feb 2026 11:45:36 +0000
In-Reply-To: <20260210123432.588a20f5@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-4-phasta@kernel.org> <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org> <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora> <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210123432.588a20f5@fedora>
Message-ID: <aYsaYBimKUaRA1Gb@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 10, 2026 at 12:34:32PM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 10:15:04 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > impl MustBeSignalled<'_> {
> >     /// Drivers generally should not use this one.
> >     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }
> > 
> >     /// One way to ensure the fence has been signalled is to signal it.
> >     fn signal_fence(self) -> WillBeSignalled {
> >         self.fence.signal();
> >         self.i_promise_it_will_be_signalled()
> >     }
> > 
> >     /// Another way to ensure the fence will be signalled is to spawn a
> >     /// workqueue item that promises to signal it.
> >     fn transfer_to_wq(
> >         self,
> >         wq: &Workqueue,
> >         item: impl DmaFenceWorkItem,
> >     ) -> WillBeSignalled {
> >         // briefly obtain the lock class of the wq to indicate to
> >         // lockdep that the signalling path "blocks" on arbitrary jobs
> >         // from this wq completing
> >         bindings::lock_acquire(&wq->key);
> >         bindings::lock_release(&wq->key);
> 
> Sorry, I'm still trying to connect the dots here. I get that the intent
> is to ensure the pseudo-lock ordering is always:
> 
>    -> dma_fence_lockdep_map
>       -> wq->lockdep_map
> 
> but how can this order be the same in the WorkItem execution path? My
> interpretation of process_one_work() makes me think we'll end up with
> 
>   -> wq->lockdep_map
>     -> work->run()
>        -> WorkItem::run()
>           -> dma_fence_lockdep_map
>              -> DmaFenceSignalingWorkItem::run()
>                 ...
> 
> Am I missing something? Is there a way you can insert the
> dma_fence_lockdep_map acquisition before the wq->lockdep_map one in the
> execution path?

Conceptually, the dma_fence_lockdep_map is already taken by the time you
get to WorkItem::run() because it was taken all the way back in the
ioctl, so WorkItem::run() does not need to reacquire it.

Now, of course that does not translate cleanly to how lockdep does
things, so in lockdep we do have to re-acquire it in WorkItem::run().
You can do that by setting the trylock bit when calling lock_acquire()
on dma_fence_lockdep_map. This has the correct semantics because trylock
does not create an edge from wq->lockdep_map to dma_fence_lockdep_map.

Alice
