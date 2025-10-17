Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB6A21B9D2
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707829; cv=none; b=hTUJyiMFgm6C8zeJZzgv/VYyaSwi53GMfYaj7o8dg2G6ouuzTRWjW+y/beCr47cRhgaxce+LF/kG9jmSyyg4yM8kcELyrr7JavJPA+6lZQW3NFuy1al3l/oU34iYgnZzJ+aCtWGgKCdvRypljwCDv4P53lSNODMGzlcBinHlTTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707829; c=relaxed/simple;
	bh=oYMU2S4GJJGC7aRx1cjLxEruylUZZplVDTmADd/KpGc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lzXtZgGRbzSeuxsHEJFiHDN9ozkIPPPHILn77X4FrRRiA5nVZNba1Jo0Totlnuo9WJd69aL3FF6VkbUfq2792EBEEBZzGInYvuLnHlU9tl8400sMoTzeUxaJ0yBSa2AcJmCfZ4yb66dAp+FqJoMyU7f9fEC868KuX4XDhNPc35E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dtMHYOTf; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dtMHYOTf"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3ece0fd841cso1061021f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 06:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760707826; x=1761312626; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ss1QlA7acXACZyHR7wiT2Nqcn1nIjx/VSZWA+hhjA4=;
        b=dtMHYOTfb/1aKFH9AJQ2wo5Ii/2zLRA5Xw4HV4ThvbLnopFpUwHOMzoUSUZ+ggGGvL
         KS9gZr/4GC6tKcF79kQl0P2NlhcH6MLctH+y4gPqh6hQd5uB8Eh383NngzlarkaPkKNA
         nAoMLg3K8qUN38eolWRLGvKr7ovsu5Vo2RVJDw8UEpBzGP75VfNpE32c6K9qbi7CK0FZ
         YcdSNnuTcyw80t62HgiwWCzqpigzcSZ79Ho4DmUx9jEQzS6a8JR0ge6Niu3YXSg9vnKG
         BdPWzr52q+JoNTEYLjlfjOkBH3S8eUxedQ7lJk4go/QBbaY+6Gh5gz1XYfqN3rwMCues
         z+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760707826; x=1761312626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ss1QlA7acXACZyHR7wiT2Nqcn1nIjx/VSZWA+hhjA4=;
        b=FwXmq8YEC0caDNu05jWdkqhh+Q3f5oP1dEb6KtxhcJisVw18NRhvaRWfGKpLtm9/qN
         IQDKyI8530FmqO+irP0wwaTBJITJFtAgub941oZtRSKqqoFVCwQMyKnCEAPhIYiH61I6
         egIEmy4ntf46VC92vRwFf3MsrCRq8D1UvzwNcTefugVrLwv9RjgUAGZOMdQBlxSLsRCk
         w146XUqaK6MqLwfT0Y+pbx9aDISyFBBZ20BTJ25LmcPXZNyBQH6KwOhn6rrueYAl5y6l
         jeLjuHPe9fzuQwyaG1P9CFONN9dXZaXj6ZLNoydNFqmfNrALqqWJgduLERJYqB9NnJEu
         cShQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC1xpXKFpUCcdmYpNqwBPFgOvTsN3ncRvXxUbZuZEFL/htGAY9+ejqgJlFmtKifbCseovNHiO6q+AwSrnwCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMq0f6ettwfOvWVnOxzEEVOJPX+1IfkmHYIwxtqBNy5WLibFB0
	5HnGX7WkRJvrwfSRJ/a3Wfa5zzeOuEX2B0FN/1I1SWxGJV+jcPnEePqnlYkO5skWawD0gCWS6ci
	CsLEjzjQt2vXmrpkA7Q==
X-Google-Smtp-Source: AGHT+IElTbDFCunvl+Q6VKcSJIGvmBa3dVuDKgt0GL3PK5Tj4PCBAZb9dyem+MFrgb18Jr5MVI9nNpg0yqNiOdc=
X-Received: from wmcn16.prod.google.com ([2002:a05:600c:c0d0:b0:46f:aa50:d700])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:400d:b0:3ee:1461:1659 with SMTP id ffacd0b85a97d-42704d98980mr2657038f8f.31.1760707825710;
 Fri, 17 Oct 2025 06:30:25 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:30:24 +0000
In-Reply-To: <20251016210955.2813186-7-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251016210955.2813186-1-lyude@redhat.com> <20251016210955.2813186-7-lyude@redhat.com>
Message-ID: <aPJE8EC5OmlmSrYt@google.com>
Subject: Re: [PATCH v4 6/9] rust: drm: gem: shmem: Add DRM shmem helper abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Asahi Lina <lina@asahilina.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Asahi Lina <lina+kernel@asahilina.net>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Shankari Anand <shankari.ak0208@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 16, 2025 at 05:08:19PM -0400, Lyude Paul wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> The DRM shmem helper includes common code useful for drivers which
> allocate GEM objects as anonymous shmem. Add a Rust abstraction for
> this. Drivers can choose the raw GEM implementation or the shmem layer,
> depending on their needs.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> +impl<T: DriverObject> gem::IntoGEMObject for Object<T> {
> +    fn as_raw(&self) -> *mut bindings::drm_gem_object {
> +        // SAFETY: Our immutable reference is proof that this is are to dereference
> +        unsafe { &raw mut (*self.obj.get()).base }

Typo.

Also, in principle, this should refer to a type invariant saying that
`obj` is a valid shmem object.

> +    }
> +
> +    unsafe fn from_raw<'a>(obj: *mut bindings::drm_gem_object) -> &'a Object<T> {
> +        // SAFETY: The safety contract of from_gem_obj() guarantees that `obj` is contained within
> +        // `Self`
> +        unsafe {
> +            let obj: *mut Opaque<_> =
> +                container_of!(obj, bindings::drm_gem_shmem_object, base).cast();

Please use Opaque::cast_from() instead of the unrestricted cast()
operation.

There are several instances of this throughout the file.

Alice
