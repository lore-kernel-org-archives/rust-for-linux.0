Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E53374E60
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975917; cv=none; b=nk0nB9ziLce8+GtvGL3CBB2xN/j67OWz0V4SXeYYEJOejY4vToD8DQjWJkBWjuqOS8MXlzF3KuQXs8AEMlbeYow4bPJ926x4Oc11YonTR0ErBKl/TqjeWDw+0dGuvbh/tEzvk/1fhgdRIW3fQWcfkIrI/p46ppiBOmeBJHa0RiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975917; c=relaxed/simple;
	bh=/knlwceH/jM+jAdW0zO7ydq3ITxwRcvlpc55nWxJ3Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjgeL53gKlAEbKYofZYZVWuADbTbBL3mQ252dw7hXg9fSADBWU9bwDT9fDmZBhUXKe9dU5eysKhsSvjmZasrDtSBjOAZN193kxwsFCVwqM/GrKy8KssMjoRUv1kGxn9TlEQnPAdY4NsNZERgptaNJf0F2bjRZGIvUf5PrylYMfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4fRlc2Z; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4fRlc2Z"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76668f4ddso420412e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 10:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975914; x=1789580714; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZFJ8LJvBoSFpLXLWJCrf1H0OwBPOca5szWV2v59OKPs=;
        b=U4fRlc2Z3oBOO4DGVgfqk1g22nrxBBBxQdx9hvSgHYZqBKx66EMK05a4OWTxt4MCg+
         OxVae+Hs6MO9fG5GTw96FPHq4k6UNYFcthmARh8iqGhI2r+UpzMeCG+GRILW8nGtIXwD
         WhNA3gcI8ZciyN2ge0IAJamdNSSn1gJjjN1AM4nYmFfhrwb3Pqbh4xMLXu62rBkyne/y
         ob3+L7Pj3cKe3DKCWIblC637w9poqnt6yS9ANBb169cRazrCn0/dfunC7Uyja/wkt0E8
         482JpsIK4Ja/WlX2vTk+gyv8VG0wVgz+ZJGTKK3G3MmWe5SYxyg3QeobiYfXBYebfrbz
         cYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975914; x=1789580714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZFJ8LJvBoSFpLXLWJCrf1H0OwBPOca5szWV2v59OKPs=;
        b=Coc77fm2u58MaZq2Id6gjw0vu+eBHM0336ZGtRVtXZb1sr7HGKyLQ63SdOqb3WeMh/
         8B35EBgBOa+FGdm+dO/NBsdRjUBaVUl2JzJ+BMkqbjOHujSthznhptD2CscGGg4ID3of
         mOqXGJmkaRYkWtXg706BKrzuG+rMiJ9LtEFitgOrgzz1qOBZWo54dTH+rfIhHuivAGsc
         Fmbo8wG52z+xEEvfsuHAXwa2gHZ5WI00TGKlmwfS22Dx+ModDvP1wpmwPb3jgEwqZ3hO
         Cq2zm6ztFaBo8ctnvB1AP5M70vc9NDswQZ9Rf9aUyns+goaCygLH3zO5ITzPRDaSzlCp
         i9Ag==
X-Forwarded-Encrypted: i=1; AKwUvByKe4mK9X0vvRhH6Pbv8jPdP3Rarsn4xl/1Vq6N7RA9+ckFCzAXGVeaSGFR2a5p/7d+fmNibLMazEVXPviF7w==@vger.kernel.org
X-Gm-Message-State: AFuF++k7sf/Ed85OfOFDkZric2Q4puzkuGeLIBi0bBS/NShJUda43Gsk
	Z5ybRGNUt+dpkVJImVkZ+7yA4rudL0mU2C5Wer++tG7HR9FaOu+/fm/j
X-Gm-Gg: AYBFou1qOw0JZlDQ2rr333I/bTxAt3Q92RUEAEFLbMizVm8lhk6lLzCpfYIj+kxxEgZ
	G3WEaKie6mERFw8orbUQXmFDDACjAsDA7IfKQZ3ylBqP+QA3FCm6XX0Hz4I8i2T/ecxY98NxAMB
	RcUf2DuK75kQlSTSnObuf64ea6QgLGb+4BkepXIArX+A8Hb8s7Xi/WuFkzzgrGmPk407uR5aVmJ
	1fTpZ6Z/kpeBjamMg6q83V+14Pj0rixdz0gUjxhsiH0lQksIA4V33GouRM+I0WWL9elvB4jBHei
	nHcuVxRp2eGXyZSGxh3PP4Df+fJ4TE0nWC3HbFIMKvOfqcib4+qiKUY6/nsFnyPyBwfXpP49cv6
	Uzx3Ce4eHNCyyyAAwdItkXBoWYpcjkQpiPNIBrOYdyLSagFqy+Akba2iExrg3nsI/b/v2xrAwRa
	v1xzU5CMhLTrs00YC4d5icX9mARR+7MjcENEs7TTUvyfgzghdCaeMqN3/S0w76jN+xkT8OwxaUG
	vOMJM2LQxaWyg==
X-Received: by 2002:a05:6512:1590:b0:5b4:ac27:8f76 with SMTP id 2adb3069b0e04-5b89a2fb651mr67482e87.7.1788975913434;
        Wed, 09 Sep 2026 10:45:13 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ecf24sm4071183e87.16.2026.09.09.10.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:45:13 -0700 (PDT)
Date: Wed, 9 Sep 2026 19:45:12 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Mike Lothian <mike@fireburn.co.uk>
Cc: Alex Deucher <alexdeucher@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	aliceryhl@google.com, alexander.deucher@amd.com, mukul.joshi@amd.com, 
	rust-for-linux@vger.kernel.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] rust: drm: gem: add missing handle_free to the object
 vtables
Message-ID: <aqGaa4sEAvIIOLjK@soda.int.kasm.eu>
References: <20260909094729.1593-1-mike@fireburn.co.uk>
 <CADnq5_Mf5mQ4CF=8UTnEjYPGVUS-Hf29sHmesvtwdfnNxtrQMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_Mf5mQ4CF=8UTnEjYPGVUS-Hf29sHmesvtwdfnNxtrQMA@mail.gmail.com>

On 2026-09-09 11:57:37 -0400, Alex Deucher wrote:
> Adding a few people.  Alternative patch at:
> https://lists.freedesktop.org/archives/amd-gfx/2026-September/152673.html
> 
> Alex
> 
> On Wed, Sep 9, 2026 at 5:47 AM Mike Lothian <mike@fireburn.co.uk> wrote:
> >
> > Both OBJECT_FUNCS and the shmem VTABLE initialise every member of
> > drm_gem_object_funcs explicitly, so adding a field to the C struct
> > breaks the Rust build:
> >
> >   error[E0063]: missing field `handle_free` in initializer of
> >   `drm_gem_object_funcs`
> >
> > The callback is optional and the Rust abstraction has no equivalent
> > DriverObject method, so leave it unset.
> >
> > The shmem copy is only built with CONFIG_RUST_DRM_GEM_SHMEM_HELPER,
> > which DRM_TYR selects.

Sorry, I missed you when sending my v2. It's at
https://lore.kernel.org/lkml/20260909173103.73656-1-klarasmodin@gmail.com/T/#u
if you want to have a look.

Regards,
Klara Modin

> >
> > Fixes: b67d2d039f64 ("drm/gem: Add callback for when handle count goes to 0")
> > Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
> > Assisted-by: Claude:Opus-5 [Claude Code]
> > ---
> >
> > b67d2d039f64 is only in agd5f/drm-next, so this can be squashed into it
> > instead if you would rather keep that branch bisectable.
> >
> > The shmem hunk is by inspection - CONFIG_RUST_DRM_GEM_SHMEM_HELPER is
> > not set in my config, so only the mod.rs copy is compile-tested.
> >
> >  rust/kernel/drm/gem/mod.rs   | 1 +
> >  rust/kernel/drm/gem/shmem.rs | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> > index 80d8f524f9d5..ae61ca7e1246 100644
> > --- a/rust/kernel/drm/gem/mod.rs
> > +++ b/rust/kernel/drm/gem/mod.rs
> > @@ -278,6 +278,7 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
> >          vm_ops: core::ptr::null_mut(),
> >          evict: None,
> >          rss: None,
> > +        handle_free: None,
> >      };
> >
> >      /// Returns the `Device` that owns this GEM object.
> > diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> > index a687d46d170d..d08a03cb7a13 100644
> > --- a/rust/kernel/drm/gem/shmem.rs
> > +++ b/rust/kernel/drm/gem/shmem.rs
> > @@ -145,6 +145,7 @@ impl<T: DriverObject> Object<T> {
> >          // SAFETY: `drm_gem_shmem_vm_ops` is a valid, static const on the C side.
> >          vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
> >          evict: None,
> > +        handle_free: None,
> >      };
> >
> >      /// Return a raw pointer to the embedded drm_gem_shmem_object.
> > --
> > 2.55.0
> >
