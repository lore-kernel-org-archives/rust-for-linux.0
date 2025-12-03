Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB23274FC1
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764767448; cv=none; b=TR/WTyQHURi6tTt0CEu9Utj1e9ABcZBZEAxYeEU1EA4B7RhozAOct//lut5329Nt2sbtYeA0gYecDKdgvT2K/ckTjOeM+1Jdf+CcNJ2RZ7RlTWnSQMfZf1V7MU6GRZtUTv+GKTHMfSASkuomoolAuTBs7rvZ+OWvVsa/W/ENOCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764767448; c=relaxed/simple;
	bh=MaPTCykuzwCtRW6aEo9eq3wt6q6ydTU9aeXp+EHUarY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rrsvKNr5MwTzwuQ1Ke2sE4LduYsDr0sffh5/4KaqjOwXryu0qFGbsTLhkAN4aPtqY+QIX1LfTz5xlL9JZtnMpOvqa1uV8/aistXq0Hhz4xSwnVShI3WYEeFWl0segPI75pXTHGARWvcIkvDQli1NbQqSiccje5FyztKCiizcJT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sqp0k3rz; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sqp0k3rz"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b70b974b818so719702566b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 05:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764767445; x=1765372245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eN8g+K0Q6itZJItemM0FbgIarXMQh/6XaXtTDY2DWCA=;
        b=sqp0k3rzVBix6uwU4PpU221mHwrrZXvTXYtzivS0UNc/4DKTZocNUfELr0Hv4gcQ6g
         +mTkIpd/hA79wI8vhdtB4He6c9eBHExAyJukCujVpel+T/VrMl91Qv+toIF1UzRBBNTB
         zxojB4vzftXB2PjK4AmJpmNUQD6OEMVHbN5FSbZJJJq1RGiHu1lJw5IbV8ctc7c5d11n
         A5PBks3MAUgDWueQ+6kNahTYpCfHiyFGe0Us99VI6NBJwjuKDEupPBXZX0N2gGmvyYwK
         CFsJ3UUFwvfEPYHyz1nv4gU4/fs+wcj7OXkDo7ud9fuQ6be/qWjRViKoKsbWY3HEX3rM
         x7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764767445; x=1765372245;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eN8g+K0Q6itZJItemM0FbgIarXMQh/6XaXtTDY2DWCA=;
        b=E6Ha0CxHjMikdqcqY9J87tz2IU4k6/1tNRiETpXU65Ld2wfURrTVPyjuEncFg05vbp
         C5fhMGwIbwJM270+t3QuIdKHiWVtBMq2bBgresyruuuP7sIPwSMMChPVlcVBMRz8DMf7
         it3JHuu2pqF9lIcGYKSvgjUq59lvQ3CaYPAH/xJupBJ0f+bKhQiNGSA0ADsY64+HaJWg
         N+Vq37o2TMjjeRRIU5r5aDnLb+GX0ScfjLZgNNrcEtGkqjlG++PJ4/KiNQlKvroiPnM4
         TTtnV7dIoE28zJY0sY6mShc5w4CF0HxRVNljY/IrbJXgNdJudanXc7y0cm9Oq5N8hJED
         +o/Q==
X-Gm-Message-State: AOJu0YwGUIUegj4RFgCz1eFOv0Ac3uN05GfZ+pCgPmSO34MPtlquOHyF
	h1Hh7l1CjOtzDTa5ulPlHfiS/u2IY+kSMbouSPYGP5KLT6VaxjtBej9qGkVUqNqkaOsIt3ac55t
	YNV90jhOAYwNWq0iaTQ==
X-Google-Smtp-Source: AGHT+IEtBa3nZZvDF2ylMnM8LhN7YdaclEwyxjh2ymAol0zFqTXGUEengCSEABAYdU7Z7DNAm7R+B/Mb5hja+No=
X-Received: from ejcrs7.prod.google.com ([2002:a17:907:8907:b0:b73:7068:f964])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3fa3:b0:b71:1164:6a8b with SMTP id a640c23a62f3a-b79dbe5ae86mr241909966b.7.1764767445402;
 Wed, 03 Dec 2025 05:10:45 -0800 (PST)
Date: Wed, 3 Dec 2025 13:10:44 +0000
In-Reply-To: <20251201102855.4413-5-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251201102855.4413-1-work@onurozkan.dev> <20251201102855.4413-5-work@onurozkan.dev>
Message-ID: <aTA21F_fXA-xS34P@google.com>
Subject: Re: [PATCH v8 4/6] rust: implement Class for ww_class support
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com, 
	felipe_life@live.com, daniel@sedlak.dev, daniel.almeida@collabora.com, 
	thomas.hellstrom@linux.intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 01, 2025 at 01:28:53PM +0300, Onur =C3=96zkan wrote:
> Adds the Class type, the first step in supporting
> ww_mutex in Rust. Class represents ww_class, used
> for deadlock avoidance for supporting both wait-die
> and wound-wait semantics.
>=20
> Also adds the define_class macro for safely declaring
> static instances.

> +impl Class {
> +    /// Creates an unpinned [`Class`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// Caller must guarantee that the returned value is not moved after=
 creation.

The value is moved when you return it. Perhaps you meant that it must be
pinned before first use?

> +                            // TODO: Replace with `bindings::lock_class_=
key::default()` once
> +                            // stabilized for `const`.
> +                            //
> +                            // SAFETY: This is always zero-initialized w=
hen defined with
> +                            // `DEFINE_WD_CLASS` globally on C side.
> +                            //
> +                            // For reference, see __WW_CLASS_INITIALIZER=
() in
> +                            // "include/linux/ww_mutex.h".
> +                            acquire_key: core::mem::zeroed(),
> +                            mutex_key: core::mem::zeroed(),

For global lock class keys, this is fine, but this constructor seems to
be for the non-global case. In that case, lockdep_register_key() must be
called.

Is a ww_class ever created as a non-global? I don't really think so. If
not, then let's not support it.

Alice
