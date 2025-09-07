Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572041DF26A
	for <rust-for-linux@vger.kernel.org>; Sun,  7 Sep 2025 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757245186; cv=none; b=rGyGlL0CrZ2cav9gT5nb9SK5tFrjWc99SWnGzbQANpwCUEPVC0BYUAVtXPxPmM81AfyRRr9PmEOc5ffhhR/3jR66rwUtAvGduIajX1Inz7bhJGkRFm14xghqFxSK0nlUTq90PwaF5N25j39JJsMpTh+k3ru3+s9ymhTjmAxKxVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757245186; c=relaxed/simple;
	bh=S3RWK01MgwhoESmldbnD23H0uI3OPDF9ufSHLa89zK4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iCWmKkzxDHKABduX9fvreLBaWdAwvqm5CyIIgqYVG17VSEJweXD+h/XM6Cj1eSoyjJCAAM/V6VWQLdR+gBquvkG425GIKvn10QEE9akL/8XkrrVFIVp8Fp1vbumimA+Zt7Ks7Z3lP6ZTqmjqGKviUoxII6KcKz47CKAIp4WBWMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ax/MJz58; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ax/MJz58"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45b467f5173so24339195e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 07 Sep 2025 04:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757245183; x=1757849983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76k1w/hZUONsc9kXw+6H44ujJP9uLKMcBhBot9MBRw0=;
        b=ax/MJz58wNlpTCd69VxwWVtInqnN7pfKAZoy0HgwdzKimlpFf/5YJmX4MT+nk7sNbV
         XKIZtF6D8k86aGj4gPo8NxUcufp03nd7Npf9qr+kAiF3tNqIaKBdDwF78GeTDX2ZUPNX
         SFP84as727/Zy0SEuQkg/W21u/pdqqIPX2Wf4Hk5tXKwOf+pxfSp5GK0S3gLpMHZY3N3
         zZcVRfxgEyn7aoQCbXmGQZIZUiXbCxauTRzOuxJnA4GGV8dpkX/Uwpn5grJegvTsSYi7
         94rRIjRxz66gwR2c+hKzGIIaXe58yn68xeAenOtIutHo+iNvB2LL0a2ffxvrpHDqK53e
         JnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757245183; x=1757849983;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=76k1w/hZUONsc9kXw+6H44ujJP9uLKMcBhBot9MBRw0=;
        b=V4N3PTA47Vsep7xK+H+XqrNmgv8m+R4LtYP4ODqE2drC9AvYf8Vyt+eBJxaYb6FKZj
         SLC+9wb9WIcrv7MvYokZE7W2SU+kaizjK0mUn26Eq9zXZmF3phoGthSAqKm3vpCNON+f
         SEXmgGcKa0SWdVzo00wuoxWMKeYJ7im5LkcQjy/JMla72/J1RJsuTdc4jr48eQoH16+X
         AWUPZ1UExa/bqCVO5mMpxpUxoqhmSuPucMFF4S5TGeiN93dBeGSpeI4Wved+gkRlfOWR
         /kjsTk8k7UF1O3sAleWEhzwceNAequx4OsrP2brqIC5XxrsSpFccrUHdOHOWVK7x3ffL
         S2+A==
X-Forwarded-Encrypted: i=1; AJvYcCUB8igVzvnD+pk8tYuGsOHYKUfh8z8qQzXDG7k1wliWUs0oGx4MQ6kIkEan4BWYbdLdTpars8hpBaSdzZrDIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOC16GP/SfJttmZ/U/dS7Klo9aBaUYy9LwoFhw7RKU/mCdeB+j
	m0grwrV3PbVflcM5bDDCeAqAskV8QRbsPfXUDeoe+yQbKotfJ35grcnXfGvt5EvOtkdocT0yGI5
	L8HJ44UALa4SDpfUbLA==
X-Google-Smtp-Source: AGHT+IHoVcPYbe0iUJKGBmK7yYOxv27qbhfcAB9Hc59veTuVIOgoY0qC6MoiuHeagEO6EoOqKdzaexiDWmVsuiQ=
X-Received: from wmbes11.prod.google.com ([2002:a05:600c:810b:b0:459:7c15:15b9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e8c:b0:45c:b6fa:352e with SMTP id 5b1f17b1804b1-45dddecf506mr42361025e9.18.1757245182810;
 Sun, 07 Sep 2025 04:39:42 -0700 (PDT)
Date: Sun, 7 Sep 2025 11:39:41 +0000
In-Reply-To: <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com> <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
 <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org> <aL1pSFB9iBsfHFM_@google.com> <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org>
Message-ID: <aL1u_YxOkuj1kIq6@google.com>
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Steven Price <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 07, 2025 at 01:28:05PM +0200, Danilo Krummrich wrote:
> On Sun Sep 7, 2025 at 1:15 PM CEST, Alice Ryhl wrote:
> > On Sat, Sep 06, 2025 at 12:47:36AM +0200, Danilo Krummrich wrote:
> >> On Fri Sep 5, 2025 at 8:18 PM CEST, Alice Ryhl wrote:
> >> > On Fri, Sep 5, 2025 at 3:25=E2=80=AFPM Boris Brezillon
> >> > <boris.brezillon@collabora.com> wrote:
> >> >> On Fri, 05 Sep 2025 12:11:28 +0000
> >> >> Alice Ryhl <aliceryhl@google.com> wrote:
> >> >> > +static bool
> >> >> > +drm_gpuvm_bo_is_dead(struct drm_gpuvm_bo *vm_bo)
> >> >> > +{
> >> >> > +     return !kref_read(&vm_bo->kref);
> >> >>
> >> >> I'm not too sure I like the idea of [ab]using vm_bo::kref to defer =
the
> >> >> vm_bo release. I get why it's done like that, but I'm wondering why=
 we
> >> >> don't defer the release of drm_gpuva objects instead (which is real=
ly
> >> >> what's being released in va_unlink()). I can imagine drivers wantin=
g to
> >> >> attach resources to the gpuva that can't be released in the
> >> >> dma-signalling path in the future, and if we're doing that at the g=
puva
> >> >> level, we also get rid of this kref dance, since the va will hold a
> >> >> vm_bo ref until it's destroyed.
> >> >>
> >> >> Any particular reason you went for vm_bo destruction deferral inste=
ad
> >> >> of gpuva?
> >> >
> >> > All of the things that were unsafe to release in the signalling path
> >> > were tied to the vm_bo, so that is why I went for vm_bo cleanup.
> >> > Another advantage is that it lets us use the same deferred logic for
> >> > the vm_bo_put() call that drops the refcount from vm_bo_obtain().
> >> >
> >> > Of course if gpuvas might have resources that need deferred cleanup,
> >> > that might change the situation somewhat.
> >>=20
> >> I think we want to track PT(E) allocations, or rather reference counts=
 of page
> >> table structures carried by the drm_gpuva, but we don't need to releas=
e them on
> >> drm_gpuva_unlink(), which is where we drop the reference count of the =
vm_bo.
> >>=20
> >> Deferring drm_gpuva_unlink() isn't really an option I think, the GEMs =
list of
> >> VM_BOs and the VM_BOs list of VAs is usually used in ttm_device_funcs:=
:move to
> >> map or unmap all VAs associated with a GEM object.
> >>=20
> >> I think PT(E) reference counts etc. should be rather released when the=
 drm_gpuva
> >> is freed, i.e. page table allocations can be bound to the lifetime of =
a
> >> drm_gpuva. Given that, I think that eventually we'll need a cleanup li=
st for
> >> those as well, since once they're removed from the VM tree (in the fen=
ce
> >> signalling critical path), we loose access otherwise.
> >
> > Hmm. Another more conceptual issue with deferring gpuva is that
> > "immediate mode" is defined as having the GPUVM match the GPU's actual
> > address space at all times, which deferred gpuva cleanup would go
> > against.
>=20
> Depends on what "deferred gpuva cleanup" means.
>=20
> What needs to happen in the run_job() is drm_gpuva_unlink() and
> drm_gpuva_unmap(). Freeing the drm_gpuva, inluding releasing the assoicia=
ted
> driver specific resources, can be deferred.

Yeah I guess we could have unlink remove the gpuva, but then allow the
end-user to attach the gpuva to a list of gpuvas to kfree deferred. That
way, the drm_gpuva_unlink() is not deferred but any resources it has can
be.

Of course, this approach also makes deferred gpuva cleanup somewhat
orthogonal to this patch.

One annoying part is that we don't have an gpuvm ops operation for
freeing gpuva, and if we add one for this, it would *only* be used in
this case as most drivers explicitly kfree gpuvas, which could be
confusing for end-users.

Alice
