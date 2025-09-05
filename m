Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B8F26F2AB
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Sep 2025 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757096297; cv=none; b=cqtqmBdNGavLZ6MNJcylYrorGp2dQZPrNd9rvcde++XdD0xkWHBQSl7gFJbxiFR/LCZlINpgF/SxjW0JyDUxKL/AN1KMs9N0zpfC67lpM3NR+cPdqQUl0l0G5hMa0Ag6kF2VJvhPIxXEBvpunggU9qr812bLCmDtR+ayKZ6yx74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757096297; c=relaxed/simple;
	bh=kfh9Tls71Sbv6ikFPTwH56l633KM95jBXY4vKsbQjnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/Uh1Nh2wIIC3wPrjTy/wULXoDGX3rDwBF32dYsVqIKAUuPY2yjFbyk/i1gwqLg2pQkJLv9LCHk09LtIX1Xp9lBXeyWfTZYaZ6jel8hiv0XITmoiznGYtA3rYzOLkhLDFnf31+Eku9Nd1ZxGIs21GW5hjEUaa/WIJwCxP5B1uRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W8PTKlzC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W8PTKlzC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e3aafe06a7so752653f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Sep 2025 11:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757096294; x=1757701094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKjPZ6JkdfP71MZhHGFNz5JoCmbYAum19kr8H2dtmZc=;
        b=W8PTKlzChHgOivPJmKRIiQPJC560Aa16ygx1EcYxD31cDVGCRcaRtBNrMENHi4q4pC
         nM9+o0iIFNaRcsw8Yu0sXnzhBktPBL0neU/ynJXsE0apjc0jDjanzKB0lpMkGs91Ru/c
         El3NW/pfk3Xp4cMrtZSKWWBlTrVLUSrvROoAw9eJBWs5trEt/LZQqQxO+3UsmbrfYLsp
         L+gTXslrGmkDwaFTzvSt7gNpKopf04d1ViHmbCUhmiqm4IgU+Us8eD7KL/A+YE70jrJ2
         9TUC+Hd5BiR1FBsGhF4rc2Qs3okIisRPZQxruAcCj2oxUFJ+ldJ0fLtVxh8jJTxPnFmA
         G/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757096294; x=1757701094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKjPZ6JkdfP71MZhHGFNz5JoCmbYAum19kr8H2dtmZc=;
        b=uByg6Qth2DBpzRhnTuuqCQFZHdGAGE2NdwsiddUvbmJCuLoixJSxVBfe3eDj7SVZsv
         gJktIYl9Ti6lzpDTeKfm72ZOWIOMVJGJQBHgXtVl6f11Ajm3i098zrgBFW0WoHiuXfOF
         FYW8Y+JA5JDxPsNURX85QaVVE1yGvGm50jcLuMQzVGgJHiaWPoNghLJ6UtCgAVl+hd80
         r3UANf6NwYsmBHC6/h/ybpU8TGZQEABQ9TpdgF1uUiFeoeC+OYqIIEImOlQH9s9vxpdB
         HwNq9FwI/U1JkcRuTrti8aHiDur6qQaII4zhHJYiwcfmsKQ3OUQE4OdQO+k49Ga7ct8i
         f8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCX351IFsq644FIb55sBq0kW/f5PjY9rz9MagNu+Olu6Bx0bjfdtXaz6+l0N4LGU35V/1nV3PHI5Paxa3J5dRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YznoXmy1GiZYyWWkwlQpJjy+G20I9OLSbaJ0NCHY49CmSM4TZBm
	aw8R7wyhdmSkbnMlrWSg0Yd/bQjTf+s241uylZlObKB2+nxi2wyUspw93Q7U0c8RkbSgngYDt49
	nQcCpO5Xd1CFmQxljtmt6BEPalVU5ifQrge4xXVeU
X-Gm-Gg: ASbGncuVYcFQNEf2vZpZNEacbqvID3rG2U7pEVpYzT+Ji6PVrWqAIjmIoQMBw5J3Yos
	stZJKebLpZem9D/INhZzmJ7Oz+eiEqtXW3KnI3aWw2zA5vRqdwffayH9Ppp9AFDINZ/Pp86BBdC
	tLjONC2qKmgzGnWR9HLQYoLdvs4KxDZvQhsR/RlKTzRSdSaZVL13SsSfd3k4Yd8OF4OTTJJuIPr
	PIZB2R4NRAOlFx3F9t3b7LjViSnKbM0ola+T0vaY6D675g=
X-Google-Smtp-Source: AGHT+IGlP6GVE/F3IvfvuFg3uqTuhZ7o1EtABAfnyD/mfTCM2CfW3Q+roVGtifPt0cXvnI1cRztA8nHmMv3mEeiacoo=
X-Received: by 2002:a5d:64e3:0:b0:3e0:c28a:abbb with SMTP id
 ffacd0b85a97d-3e0c28aaf62mr6872387f8f.13.1757096293550; Fri, 05 Sep 2025
 11:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com> <20250905152505.005a610d@fedora>
In-Reply-To: <20250905152505.005a610d@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 5 Sep 2025 20:18:01 +0200
X-Gm-Features: Ac12FXzdSoY4H14Jq3bYOy1msq82Tum3a_ciUTVq2KqVGeVzVChh5DdTZhsb_aI
Message-ID: <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Steven Price <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 3:25=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Fri, 05 Sep 2025 12:11:28 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > When using GPUVM in immediate mode, it is necessary to call
> > drm_gpuvm_unlink() from the fence signalling critical path. However,
> > unlink may call drm_gpuvm_bo_put(), which causes some challenges:
> >
> > 1. drm_gpuvm_bo_put() often requires you to take resv locks, which you
> >    can't do from the fence signalling critical path.
> > 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often going
> >    to be unsafe to call from the fence signalling critical path.
> >
> > To solve these issues, add a deferred version of drm_gpuvm_unlink() tha=
t
> > adds the vm_bo to a deferred cleanup list, and then clean it up later.
> >
> > The new methods take the GEMs GPUVA lock internally rather than letting
> > the caller do it because it also needs to perform an operation after
> > releasing the mutex again. This is to prevent freeing the GEM while
> > holding the mutex (more info as comments in the patch). This means that
> > the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 167 ++++++++++++++++++++++++++++++++++++=
++++++++
> >  include/drm/drm_gpuvm.h     |  26 +++++++
> >  2 files changed, 193 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index 78a1a4f095095e9379bdf604d583f6c8b9863ccb..849b6c08f83dcba832eda37=
2bd3ce62b540e144b 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -876,6 +876,25 @@ __drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm, s=
pinlock_t *lock,
> >       cond_spin_unlock(lock, !!lock);
> >  }
> >
> > +/**
> > + * drm_gpuvm_bo_is_dead() - check whether this vm_bo is scheduled for =
cleanup
> > + * @vm_bo: the &drm_gpuvm_bo
> > + *
> > + * When a vm_bo is scheduled for cleanup using the bo_defer list, it i=
s not
> > + * immediately removed from the evict and extobj lists.
>
> Maybe mention that it can't be, because those lists are protected with
> the resv lock and we can't take this lock when we're in immediate mode?

Ok.

> > Therefore, anyone
> > + * iterating these lists should skip entries that are being destroyed.
> > + *
> > + * Checking the refcount without incrementing it is okay as long as th=
e lock
> > + * protecting the evict/extobj list is held for as long as you are usi=
ng the
> > + * vm_bo, because even if the refcount hits zero while you are using i=
t, freeing
> > + * the vm_bo requires taking the list's lock.
> > + */
> > +static bool
> > +drm_gpuvm_bo_is_dead(struct drm_gpuvm_bo *vm_bo)
> > +{
> > +     return !kref_read(&vm_bo->kref);
>
> I'm not too sure I like the idea of [ab]using vm_bo::kref to defer the
> vm_bo release. I get why it's done like that, but I'm wondering why we
> don't defer the release of drm_gpuva objects instead (which is really
> what's being released in va_unlink()). I can imagine drivers wanting to
> attach resources to the gpuva that can't be released in the
> dma-signalling path in the future, and if we're doing that at the gpuva
> level, we also get rid of this kref dance, since the va will hold a
> vm_bo ref until it's destroyed.
>
> Any particular reason you went for vm_bo destruction deferral instead
> of gpuva?

All of the things that were unsafe to release in the signalling path
were tied to the vm_bo, so that is why I went for vm_bo cleanup.
Another advantage is that it lets us use the same deferred logic for
the vm_bo_put() call that drops the refcount from vm_bo_obtain().

Of course if gpuvas might have resources that need deferred cleanup,
that might change the situation somewhat.


> > +}
> > +
> >  /**
> >   * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
> >   * @__vm_bo: the &drm_gpuvm_bo
> > @@ -1081,6 +1100,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const cha=
r *name,
> >       INIT_LIST_HEAD(&gpuvm->evict.list);
> >       spin_lock_init(&gpuvm->evict.lock);
> >
> > +     INIT_LIST_HEAD(&gpuvm->bo_defer.list);
> > +     spin_lock_init(&gpuvm->bo_defer.lock);
> > +
> >       kref_init(&gpuvm->kref);
> >
> >       gpuvm->name =3D name ? name : "unknown";
> > @@ -1122,6 +1144,8 @@ drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
> >                "Extobj list should be empty.\n");
> >       drm_WARN(gpuvm->drm, !list_empty(&gpuvm->evict.list),
> >                "Evict list should be empty.\n");
> > +     drm_WARN(gpuvm->drm, !list_empty(&gpuvm->bo_defer.list),
> > +              "VM BO cleanup list should be empty.\n");
> >
> >       drm_gem_object_put(gpuvm->r_obj);
> >  }
> > @@ -1217,6 +1241,9 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm=
 *gpuvm,
> >
> >       drm_gpuvm_resv_assert_held(gpuvm);
> >       list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj=
) {
> > +             if (drm_gpuvm_bo_is_dead(vm_bo))
> > +                     continue;
> > +
> >               ret =3D exec_prepare_obj(exec, vm_bo->obj, num_fences);
> >               if (ret)
> >                       break;
> > @@ -1460,6 +1487,9 @@ drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm=
, struct drm_exec *exec)
> >
> >       list_for_each_entry_safe(vm_bo, next, &gpuvm->evict.list,
> >                                list.entry.evict) {
> > +             if (drm_gpuvm_bo_is_dead(vm_bo))
> > +                     continue;
> > +
> >               ret =3D ops->vm_bo_validate(vm_bo, exec);
> >               if (ret)
> >                       break;
> > @@ -1560,6 +1590,7 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
> >
> >       INIT_LIST_HEAD(&vm_bo->list.entry.extobj);
> >       INIT_LIST_HEAD(&vm_bo->list.entry.evict);
> > +     INIT_LIST_HEAD(&vm_bo->list.entry.bo_defer);
> >
> >       return vm_bo;
> >  }
> > @@ -1621,6 +1652,106 @@ drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
> >
> > +static void
> > +drm_gpuvm_bo_defer_locked(struct kref *kref)
> > +{
> > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_gpuv=
m_bo,
> > +                                               kref);
> > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > +
> > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
> > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
> > +     }
> > +
> > +     list_del(&vm_bo->list.entry.gem);
> > +     mutex_unlock(&vm_bo->obj->gpuva.lock);
>
> I got tricked by this implicit unlock, and the conditional unlocks it
> creates in drm_gpuva_unlink_defer(). Honestly, I'd rather see this
> unlocked moved to drm_gpuva_unlink_defer() and a conditional unlock
> added to drm_gpuvm_bo_put_deferred(), because it's easier to reason
> about when the lock/unlock calls are in the same function
> (kref_put_mutex() being the equivalent of a conditional lock).

Ok. I followed the docs of kref_put_mutex() that say to unlock it from
the function.

Alice
