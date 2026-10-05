Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE8444C4FB;
	Mon,  5 Oct 2026 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207623; cv=none; b=diwxJv3YRnBHOz59leJzT+JucD5Z9yXdf3gVLuNavIs5Vl12Wi3KEpR/NeZTajBVbwyOCszMfNsvYGh0hY4/WSMTJ2xmMwRp14WZ1gltmI7g3TLfismy2152b7MXknv7BZ2qkAuWSZ1sVkOrUgfDrRzgsb5dtEeHGMrpttjQKVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207623; c=relaxed/simple;
	bh=BG+AGe3HbcJzo1XgYNzVU45Y855PJwWue8krha5BHmk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N5ahph2eLsnPB7mruf78jVZm829KYpvSYxMy5MYW2VLzLYRnyXQpAnP0148Ghq8fhinK/QSGMT7zMmR3zn+CD23DIJ9vyRXPSrMUsrRmCqGKHaWN3cWGa0PiB7/ka7KTUIAwaGbiI0IAQxmeh11OqrNTLEKkIZBsQ3OcPTjMFX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Rm0kgOai; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Rm0kgOai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791207620;
	bh=BG+AGe3HbcJzo1XgYNzVU45Y855PJwWue8krha5BHmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rm0kgOaiucJ+NLn8DKkuu5aW/hK5LCRMG1lDmniB7ZUDxSeZnAaPTQq7b1G7KcqTw
	 I4Sin7ZI3/tzJYR3iktwPgbAqUABXVTA6mW7HUG1zXxDli7WrjwF3B2HmaEvfQeIN/
	 gUaZJsqNDWzKmvd8iB1vSP5wxWRRF9Glbqt3WeL3UvGGuADZqBybnUbvuaZ4V/oADp
	 uFdgmA2X2O/w8WywLG/UAeNR57nc1tfQ8fQO6PAF4nt7lNdh32owtMfcAC7sjrisPH
	 GINamOJhIAjq3uTCWMrmkASTviYoUOThfLiUGrHIJWYQnHl+cJ+6KfSKaB2INLiCUL
	 w2AKrjgGsgwpQ==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C07C617E0243;
	Mon, 05 Oct 2026 15:40:19 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	airlied@gmail.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	deborah.brouwer@collabora.com,
	dri-devel@lists.freedesktop.org,
	gary@garyguo.net,
	kernel@collabora.com,
	laura.nao@collabora.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	simona@ffwll.ch,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev
Subject: Re: [PATCH v6 2/2] drm/tyr: add Job IRQ handling
Date: Mon,  5 Oct 2026 15:40:10 +0200
Message-Id: <20261005134010.302208-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <arOP5iuLuj1aTiLl@google.com>
References: <arOP5iuLuj1aTiLl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alice,

On 9/23/26 10:37, Alice Ryhl wrote:
> I agree with sashiko's review here.
>
> This needs to happen after the free_irq() call in the destructor of
> TyrIrq.

Thanks for the feedback.

In v5, I was masking the interrupts in TyrIrq's PinnedDrop impl which
resulted in clear_mask() being called after free_irq(). However, sashiko
warned the device could then assert irqs after free_irq() completes
but before clear_mask() runs, potentially leading to an IRQ storm that
could result in the shared line being permanently disabled. 

So calling clear_mask() before free_irq() should avoid this, but we
still have to deal with threaded handlers potentially re-enabling the
mask after clear_mask() has run (as per sashiko's review on this current
revision). Adding the atomic state should help with that though, as you
suggested:

> And most likely, we need an atomic along the lines of ACTIVE /
> PROCESSING / SUSPENDING in panthor_irq.
>

So I'm thinking something like this for the state:

#[derive(Clone, Copy, PartialEq, Eq)]
#[repr(i32)]
enum IrqState {
    Active = 0,
    Processing,
    Unregistering,
}

unsafe impl AtomicType for IrqState {
    type Repr = i32;
}

This could then be stored in TyrIrq:

#[pin_data]
pub(crate) struct TyrIrq<T: TyrIrqTrait> {
    irq: T,
    state: Arc<Atomic<IrqState>>,
    #[pin]
    _pin: PhantomPinned,
}

Then TyrIrq::handle() proceeds only when the state is active and
TyrIrq::handle_threaded() re-enables the mask only if the state is not
`Unregistering`.

Does this make sense to you?

As for masking before free_irq() runs, I'm thinking of possible
alternatives to JobIrqMaskGuard and its ordering convention (i.e. must
be stored in a field declared before the corresponding
`ThreadedRegistration` in the struct that owns both). Would it make
sense to define a TyrIrqRegistration struct that wraps
ThreadedRegistration instead? and then clear the mask in
TyrIrqRegistration's drop impl.

Something like:

#[pin_data(PinnedDrop)]
pub(crate) struct TyrIrqRegistration<'a, T: TyrIrqTrait> {
    #[pin]
    registration: ThreadedRegistration<'a, TyrIrq<T>>,
}

#[pinned_drop]
impl<T: TyrIrqTrait> PinnedDrop for TyrIrqRegistration<'_, T> {
    fn drop(self: Pin<&mut Self>) {
        let handler = self.registration.handler();
        handler.state.store(IrqState::Unregistering, Release);
        handler.irq.clear_mask();
    }
}

This should make sure teardown order is still respected without relying
on the user correctly putting the guard before `ThreadedRegistration`.

Any thoughts on this approach? In case it helps as a reference, I've
drafted both IrqState and TyrIrqRegistration in [1].

[1] https://gitlab.freedesktop.org/laura.nao/linux/-/commit/c78e296690e643b790fb3195660f1229e3cdb5ca

Best,

Laura

