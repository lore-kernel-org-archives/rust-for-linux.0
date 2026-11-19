Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089008;
	b=GsNcl3wmYNPo5Udfxt8bKJwLdmwA/WpzyvWFRUv1afKfFudHco8N7qxOfzhayGkJaN9c
	 n7lFlTmdc6Bk+Egw+lF3gMnKFSfOLz1OFtxW5li4s43PajMdwd3W2isDaiApNvkpVJtvz
	 TEvu4hfFjp4VWhXelyFJkyGkd0pWGTs/C6eehkO5QDTp0WujaCCo5+Zksn4BGOAs2QxJB
	 Ge/cxV9m0AgJY2bYqtrxmyyxTV1JlDSa/bVBM7Ex5uy4c8m8UPDw5S7Wj+XwQFBmrd+pq
	 zgUWzW0LAll83TElZ+QHFkBExsIb3KbFo8gToh5xwekWq7a193znueRRSlaXOKra5tA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zOO8IN3WTwfTWmmyHCF/uCzTotxA10dmHaLxKg4Nq4E=;
	b=cVxgXvfjOsw1KujOLC9+GkQDRFjMXZI4C63VlNPzNhLSI1I1wxpo81F4pgVp2tE6JZTb
	 abW/JYgKYlKdf9nKwk+eY0WY/MZCfpv3H5lvQ3T1/219DtIIMUGL0CGV/2BOkRgg72Ld5
	 b3G4+meU2psZOSw9CwNrg4XWaXR+RspQezNgqDmLKGfKp5aJMPGbbr0Q1Gar8EYo8bttT
	 Ye5C80vEKPeJkUOV92A+yUDAck8wQ9TpCHNavQKKsQkEfN3z8gVZYfJHq4UtoDzU/xkci
	 oFZQMZt9mj4OYOxcdO1obYzsEC2tni/G8gvHU4jdqiZz0ZH5SOCdCN6bc7lQurC2PCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QQId+XqJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87290606A32A
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 11:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87290606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QQId+XqJ
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1236231f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 03:50:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089007; cv=none;
        d=google.com; s=arc-20260327;
        b=g7yeU/7whwZuNH9Ry5ZhK59q+7nE7Q8ctwLmdXi+r+p+XzhsW9V3FkUDGTOF0xH+uS
         lHdgJmJFJEzWRF18q0oS8GjAQ72rjHDeIlowhYzX5fOkDIn4v7rXDmsYPWciVIJiOV5j
         4yc0HS67ayiXLgIc5qDlrOgmxryE8j7KEunpRg42MGhkcf/W0abqwW0JxzY26w4qV5Sk
         0qFEJMItMb6je49Ha9xGf/ADFneqpyXuq6eoD/R+7DgPkM58IMiDh4LlytoAAvioif/e
         foWimC1OfPPmPBila+67EvkLjElGaCdvWd0C0ff3AvNbVM7OFlMSPAbDnaCLS5WqC4ub
         urBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zOO8IN3WTwfTWmmyHCF/uCzTotxA10dmHaLxKg4Nq4E=;
        fh=+E6rA+mLCTNgAzl/p2d3IQI0psrq4JNg5GPznJNgQcc=;
        b=qTBcb/4Z+9jkKUDecKupCZ00+Y8KD7u9EL3wwmAPWheh7ETIpg9vMzUMnH6jIN0GdE
         tXmX2NQXbE0YzuljNzaVkju7NTnlRAa6uFvpeDmsPl2KVbbFOyfuETfpfv6AP5gHxY86
         maa4AMz6DcsU373DU5Q75GurrqOur1zYE6BEKxoZ/xu6LbMVjL8a1N7slaCdBCo6kPDz
         UjMVrqtyZ3qpY7ieYgjuSpriHTZQnYTCmOpGn4l+drYp0YYdZVyHdohFNlnfsYkzWw1i
         vjJa+rWMQXAFGV+g6jD7btCtUCh3mwC4JgiVjc3S9aZOkesgFtD9ZB4ewi0l7CYGO8Uq
         5/yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795089007; x=1795693807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zOO8IN3WTwfTWmmyHCF/uCzTotxA10dmHaLxKg4Nq4E=;
        b=QQId+XqJHc6/Vf9YxDoL4P2Tn4hvgiczGFrDlL7pq03qn8tlsBgLada/OoPp3FAScL
         0GmXYnijJ2aVhgc2IamhiK0JWHB0pqpXEZrDagZ8aS0bzMEB4/nBrkWqQOmF/J1UHJsU
         DV0WkOchAR5vtT8DRzUMZaDiT4MNN2o+kBX3Q98vad3roNBRiL5cBD32PMe6SCTvfeY6
         fZas5wrW1OBVLG4FJ/NjXfRLdiPsCnq07RS3gwWp7C9Gt3cABDbIk6xReHeNRM86pK68
         BRywyWUNuC2I3t/L6FegbyGHi87AyPauhXFb4jx1NXclspOdORSdXmP6Z7msFX3bhuEy
         YIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089007; x=1795693807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOO8IN3WTwfTWmmyHCF/uCzTotxA10dmHaLxKg4Nq4E=;
        b=GSbEERpc7ZQLlgHVa/D7O5GFaPtceVjRiAGNXJkXh2xY0x7Vs+gYmwW/f3bbVW4v4c
         4HBXRJJ9uY21xS+7sSbODiCnk/qD8jLNOQd4J8gMem6hypKHinJTKZ10UOT0v3ZH5N7W
         WN3Raibjw1BSbrzblK9GKT5B+HhrE/BZzAkBml4AtHcGGM8yJ8o3Lyat89EZA0nMrkff
         uFXVucSQZ6D9rz6gXrehzLNlA4QwkygE36aZ5Ggzge5cKUkHqfVtbH3bh/yJntVSwnJ0
         VQQp0dMFf2U4Lc4HJI5PH1rNlYf3Q83yhUo5u+nb8e51KolhaMoOSG9dEMyXEnk8YYn8
         5/lg==
X-Forwarded-Encrypted: i=1; AL+hErEAP4BxwH9OGi81d1slWKKkl7MzTW9NHMa0EtzoTq3hAvbGxl/709c3quDolYcGwIU3kXhP/s43chY195UEXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/YNK+6EtwqrIPUu93YrHNTm6HgWZZVc3/kxbyL1yeEjBpT5lo4
	iCKkKJZhy8kqBcXLFI+VYwrQlLmriLjqXzkFHeUHfZd0DrRxXoJpCjhfrHpSKsC4f1/XcviNMq+
	ey22a2Wz+dAWvZyakzgu65+OM5eNLM/vW8FUPSAOu
X-Gm-Gg: AZFdTZcd0U2boNg3EADuHax/Oyhc9maujG447gNmiKfIGG0BSmWynK9HXsrr42+1KXn
	RhgbyNstyGUoynOvVUUmE2CB7AF8FR0fNh3nE4B+Owl/jJL0lDLKLGKxVF98hgx9c5VX9+zrUsw
	Y/GEbsPyZXKPYJ1RHaQDTdN/MEReXkBlyfr1oZohffBiUj2QIFTjyTY1M9b680EAHNX0ls7OmXN
	sRQ62fMLe+H1gPZet+ZIA74r3j08cq+04at9iHU2y1zjr4ihvdhAnV4D2+bPz+AaTF46CR80QRu
	RYvJkEUbjL9wdSTKHzLnB/YV9VIlD3pKHpZCE6+YpO2yu/qMesg/pp5uswebf76BeR4QFxPO+6n
	GZtPrLOd+5dUXyJl2dJTc4HXPiq7Ddg2IL/27VvMveMbnrYR4mMIVBgTqDchzGnzdWE0SjKdRzF
	bR5tnMmH9gYBYzL1d4ZtmBB7lLTTqQtxVQEsqc6lZSiSlU
X-Received: by 2002:adf:e183:0:b0:4aa:8de6:6648 with SMTP id
 ffacd0b85a97d-4aa8de66db5mr1569581f8f.45.1795089006191; Thu, 19 Nov 2026
 03:50:06 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118181245.2583303-1-dakr@kernel.org> <20261119111746.3049044-1-aliceryhl@google.com>
 <DMZ5ER6XTNLG.2ZJOF7F4100XW@garyguo.net>
In-Reply-To: <DMZ5ER6XTNLG.2ZJOF7F4100XW@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Nov 2026 12:49:53 +0100
X-Gm-Features: Aa3M54oh8HJOrpuOfJ-i5QqnZtSXVPWrGr-cWZKRejJI37TjGzDfWl8zYFwePng
Message-ID: <CAH5fLghc63zD9c1F437pQiX+ohgSkYQe4nt3xP4gSTsqAVLzBA@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: remove DRM device private data
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch, 
	daniel.almeida@collabora.com, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:25=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Nov 19, 2026 at 11:17 AM GMT, Alice Ryhl wrote:
> > On Wed, Nov 18, 2026 at 07:07:35PM +0100, Danilo Krummrich wrote:
> >> Driver::Data is owned by the reference-counted drm::Device and can
> >> outlive device unregistration and driver unbind. Driver state belongs =
in
> >> RegistrationData, whose lifetime ends with registration teardown.
> >>
> >> The intended model is that, after drm_dev_unplug(), surviving DRM
> >> objects (e.g. through remaining userspace handles) no longer require
> >> access to the driver state. Thus Driver::RegistrationData is available
> >> (and sufficient) for all DRM callbacks into the driver.
> >>
> >> Remove Driver::Data, its storage and Deref implementation, and the
> >> unused workqueue implementations that depend on it. Drop the data
> >> initializer argument from UnregisteredDevice::new() and update its
> >> callers.
> >>
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >
> > Makes sense to me. Both in-tree users had `type Data =3D ()` anyway, an=
d
> > nothing uses the `WorkItem`/`HasWork` impls on `drm::Device`, so this i=
s
> > a pure simplification.
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> > One small suggestion below.
> >
> >> -        release: Some(Device::<T>::release),
> >> +        release: None,
> >
> > [...]
> >
> >>  #[repr(C)]
> >>  pub struct Device<T: drm::Driver, C: DeviceContext =3D Normal> {
> >>      dev: Opaque<bindings::drm_device>,
> >> -    data: T::Data,
> >>      pub(super) registration_data: UnsafeCell<NonNull<T::RegistrationD=
ata<'static>>>,
> >>      _ctx: PhantomData<C>,
> >>  }
> >
> > With `release` gone, nothing ever runs `drop_in_place()` on the Rust
> > side of `Device` anymore. That's fine today since all remaining fields
> > are trivially droppable, but it is now an implicit requirement on the
> > struct: anyone adding a field with a `Drop` impl (or a pinned field
> > that needs a destructor) would silently leak it.
> >
> > Could you add a short comment on the struct along the lines of "no
> > `release` callback is installed, so no field of this struct may require
> > dropping"? That way the next person adding a field knows they have to
> > bring back the `release` callback.
> >
> > (For what it's worth, I checked the lifetime-parameterized `File`
> > series [1] against this: `open_count`/`open_count_wq` are both
> > droppable without a destructor, and the two merge cleanly, so no
> > ordering constraint there as far as I can tell.)
>
> Instead of a comment, a const assertion of !needs_drop would be better.

Good idea

Alice
