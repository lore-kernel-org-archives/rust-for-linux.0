Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281312F90CE
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755860251; cv=none; b=gGz031BdMLeZdhK409PmKAr4F4gztzbEz2knYjfDGS89xVCIWsq/Yfodl1/JuV3HForhR4VwYYT6goCqNJZ0//jRmnIMVnWgrD0M3ssPWeuRyqU7nZONCGOJpoIu48LoEUWfrdrasIadpl8ZCZKua6clgXcFghUmTsMcGOJSI5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755860251; c=relaxed/simple;
	bh=ZTz83K7Cswt9cjSybe5vv3tPcAP/updXzpEtv7fbREU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nmFk7Iqf4ZErS5vlL99HdpyRHgmr+/vnmlc1dl2TaI0oJ5AG9Gnl52TyeQjC8Wui4dbjjmWYgURe/1opWDBw3JWLLASIh4cS3I2OB8UgSJmD4Nt01Bn5n5Bu0z+1TRduDZY3LhZSXDWm4Sa5SDg5MnyIcfaReBgJVEkhRrf7wyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C+fVgKDh; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C+fVgKDh"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b9dc566cb4so1333391f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 03:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755860247; x=1756465047; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7HBMLCCpgWuee3qZa2JZqxXuB7kIiXGM9JL4gtORBiI=;
        b=C+fVgKDhDSugs7c2ksYUO8oJG5TC2MRgOaHXUqhq24oFgk0785FBQrN2LRyeDnYuu4
         7t0CdhwgNaSSS3IWK4Y62/p7Lg/CLApcA8y/j1QDsuNBI3GMCX0vb+69l7fKIpMJ8KUq
         pdtfz24XwBGXqzqqvUXNg6HEbfNcvcrkWk0HTGQzy2EhXpxGk4JRr2dN1AK3ZKW0nuBI
         /qFhWjWC/sxkv3XlWNmaZL9CYLEiGrkwCmugZ3YKQnqOq4O4FAINfNSj7jLuVuyhv1VA
         Oj05lJ4NQrcupmT6dTz60MEx1vC5XH6ejFwYdAj1nU1WA8QDjPuwuLHnkmUEbT3/y8Hz
         2RUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755860247; x=1756465047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7HBMLCCpgWuee3qZa2JZqxXuB7kIiXGM9JL4gtORBiI=;
        b=TjGOTpbuac2xqz+Fey0Lx14LFRIxPhMS3N6hIry/WCv8H4XwOuQu5PyyyvV1zl4+M+
         ZCvQ593kluZoFEn1v/1vKLWEg2LzyZoXd+0vAsI07LnF4ZYsIKuL4WIsayytCb1G65b0
         Gx2WBYgUwC9NRDHPSqFmLOPhiFxIo1Ovn0Eb+sXSIr/MD6v6RKwlp7GEQoW2HA53wPRe
         sIVxKalF6gHZmnTViJ+nLku3/cR2yM83nG288m6COLOSoqh01v8zANgSz62Z5MJefn+Q
         6Ju7QyqNYAuLBZCwhmvGp9t+qlQG0MGZMFi+gPLpaBcIIvRwf7jTJlF3b7rsytmczROD
         iwBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe68ZDRMhuw3X0WkEzYJRjqSPQ3zhY4+Ko7Iap3xAEyq4wLCPpRvPDIvJCOBAyAtK/rjnMpRN7mcIZ9TXmBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YziI/I2HT+wgDJ6eWa0ySNUnBpWo4r+Jz3HqPwWFEkZGk7XHeyt
	v2r71E/bpKPGtgxzkt3IAkL2UaZYiWGsrmugM+0dvwsy3cwpCu/c1T3dZKd6n49+SfNPFDiA3+M
	s9AdHA+oeAa7jQIy66A==
X-Google-Smtp-Source: AGHT+IFtLd078KoINMXpDW22Ic3sXy4RycWnf1VLTnYuQE76dQbTyWnKjFD4VpOZLK/xGSJAqubgJ4a1/kyy7Zk=
X-Received: from wrs7.prod.google.com ([2002:a05:6000:647:b0:3b8:dd13:ef41])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:3101:b0:3b5:f0aa:b1e5 with SMTP id ffacd0b85a97d-3c5dae060f2mr1770712f8f.19.1755860247490;
 Fri, 22 Aug 2025 03:57:27 -0700 (PDT)
Date: Fri, 22 Aug 2025 10:57:26 +0000
In-Reply-To: <20250822115221.24fffc2c@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
 <20250822-gpuva-mutex-in-gem-v2-1-c41a10d1d3b9@google.com> <20250822115221.24fffc2c@fedora>
Message-ID: <aKhNFn7hdsLapLWO@google.com>
Subject: Re: [PATCH v2 1/3] drm_gem: add mutex to drm_gem_object.gpuva
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 22, 2025 at 11:52:21AM +0200, Boris Brezillon wrote:
> On Fri, 22 Aug 2025 09:28:24 +0000
> 
> Maybe it's time we start moving some bits of the gpuva field docs next
> to the fields they describe:
> 
> 	/**
> 	 * @gpuva: Fields used by GPUVM to manage mappings pointing to this GEM object.
> 	 */
> 	struct {
> 		/**
> 		 * @gpuva.list: list of GPU VAs attached to this GEM object.
> 		 *
> 		 * Drivers should lock list accesses with the GEMs &dma_resv lock
> 		 * (&drm_gem_object.resv) or &drm_gem_object.gpuva.lock if the
> 		 * list is being updated in places where the resv lock can't be
> 		 * acquired (fence signalling path).
> 		 */
> 		struct list_head list;

This isn't a new issue, but it's somewhat confusing to call it a list of
VAs when it's a list of vm_bos.

> 		/**
> 		 * @gpuva.lock: lock protecting access to &drm_gem_object.gpuva.list
> 		 * when the resv lock can't be used.
> 		 *
> 		 * Should only be used when the VM is being modified in a fence
> 		 * signalling path, otherwise you should use &drm_gem_object.resv to
> 		 * protect accesses to &drm_gem_object.gpuva.list.
> 		 */
> 		struct mutex lock;
> 
> 		...
> 	};
> 

Alice
