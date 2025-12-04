Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896372F7AD4
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839242; cv=none; b=UDAmuznI7tXWYg8LBFqAFF/uk7vDcVptqt8AY9KiRxFs372rY98p5wdPPt5awjNX4nXn4juFfFTkkiZAfc34caUikptiLjrXxUXM1oxTIq/d0TBl2B2O+1bD0EJNh7H9F6393sVlbK/MFyZnPAYmJf7/Z059ONIA9FLDH2ox27U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839242; c=relaxed/simple;
	bh=BsAIstq+CUngEFU7qZ7XNaeLu0o3BLktoMaG5egV2RQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PR/MLZiJfy4vFwEhmNFtGYE2pLYXyMihy0H+Z4BjJB6W8kGVuFUvcD2n3RWzp8iSA/HXUV7GcrrjPuXujqPIz128BooTC36s8owsDqlZJQvQfs21pdY60uLbeWgr+Rlef+WqrnXXcNBHWnuHvxKF9vbwcP/D3YjD/b2hcQNFDws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r+tQDkYM; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r+tQDkYM"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b79f6dcde96so38403366b.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 01:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764839239; x=1765444039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsAIstq+CUngEFU7qZ7XNaeLu0o3BLktoMaG5egV2RQ=;
        b=r+tQDkYMknZbUUTRFLgo/nn22fB4ZEb08kYrlDClUS5U4gmy/hUOGHzmVAWaKU82+A
         v5sD+40yBiOXL/tjcr2qILHG8jpoQyGaWX51Mx6is+kRWU3890g5ylUKdJ/m+eF1DEWc
         2+4R9G2CjVrC+RGmTkpCl05cwnjwNc7h2/aUwnCE6u/lXIbOXJN5Ky+ks1a+BZmgPi7v
         P9D3XqyIjFEIwdyryOxQfk2Al5yEH8Wwt31B8UtrnQ8Cky5v1Zm6wnjWwRkDyX6AAn5n
         WhvSYoJzdH74Xa/hvTRRfRIGjNM+3yFySAx41rXSNc08ZlYYseY0QKvvjBU93uNXJBWZ
         4XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839239; x=1765444039;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BsAIstq+CUngEFU7qZ7XNaeLu0o3BLktoMaG5egV2RQ=;
        b=w8Z3D0yJBD8N03PFO8QZAVv5lcvi1EFag/djWVoI3fmqcB/gYGmi7+S4w1bK2IE5JI
         IKhGLpYEGMzDwwmvoGimJqlZ59u/XNe5XIC86lVradCedq0E6IWVQ+bwyXaeoceh4NbL
         M7Y6R5Zv0axIPKMfW14wq3U0tmoyXVXWz+oJKCGUKd7VoVz0xrHFi+Uq87KhntuZpdll
         p0lf8d0aEdp0RRWONdmrgqQlmfpfUoRHYdvXp1NpcYs9Vzdmx/EE+UOLfn9jbvSFhflS
         N8Y3yPAZwAxf0g3QVZsFeGJ4/8Ksi5y05X0CvqL/rwoJZOPuWw6RNpjS6GWjDvEC3Odq
         tKpg==
X-Forwarded-Encrypted: i=1; AJvYcCUpmSYrDm5XfL2Qjm5416TqxGnuRg3Qvag/a5sohK255xxDLiCvaeVbf1q9SjKcssH8oj2FfZEn2uPf65EFiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw0xo9STENkzRde+COWXyR1X+5LbSME9afcThOeOOUa/gtL3Ko
	97ICVgXswv9zR6ChflZ2h9q2XiIzAVrTn+5OLUUm+3FSxLTUBvwr3MbVbKU94nCvoNPLCfPCIQU
	DMszv514WEk2fii7Oww==
X-Google-Smtp-Source: AGHT+IG3QIVv3Yyq7FDGPkxtSQO1eLE3TyAN6wiuseoGGHp3LSKJyanxNNjuV0YyqJ734MHBXycVjXJfiWL/EcE=
X-Received: from ejctr9.prod.google.com ([2002:a17:907:c589:b0:b79:f765:c382])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:1914:b0:b79:ecb0:db74 with SMTP id a640c23a62f3a-b79ecb0dc98mr172817766b.59.1764839238885;
 Thu, 04 Dec 2025 01:07:18 -0800 (PST)
Date: Thu, 4 Dec 2025 09:07:18 +0000
In-Reply-To: <86E0C8EE-393D-4C6A-9C28-BB036A1FFAD6@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251201102855.4413-1-work@onurozkan.dev> <20251201102855.4413-6-work@onurozkan.dev>
 <aTA6f8gK60h6qaHs@google.com> <86E0C8EE-393D-4C6A-9C28-BB036A1FFAD6@collabora.com>
Message-ID: <aTFPRv2ahM_KA3AB@google.com>
Subject: Re: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, 
	will@kernel.org, longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev, 
	thomas.hellstrom@linux.intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 02:23:14PM -0300, Daniel Almeida wrote:
>=20
>=20
> > On 3 Dec 2025, at 10:26, Alice Ryhl <aliceryhl@google.com> wrote:
> >=20
> > On Mon, Dec 01, 2025 at 01:28:54PM +0300, Onur =C3=96zkan wrote:
> >> Yeah :(. We could get rid of them easily by keeping the class that was
> >> passed to the constructor functions but that becomes a problem for the
> >> from_raw implementations.
> >>=20
> >> I think the best solution would be to expose ww_class type from
> >> ww_acquire_ctx and ww_mutex unconditionally (right now it depends on
> >> DEBUG_WW_MUTEXES). That way we can just access the class and verify
> >> that the mutex and acquire_ctx classes match.
> >>=20
> >> What do you think? I can submit a patch for the C-side implementation.
> >> It should be straightforward and shouldn't have any runtime impact.
> >=20
> > I think there is a better solution. We can create a different type for
> > every single class, like how rust/kernel/sync/lock/global.rs creates a
> > different type for every single mutex. Then, you know that the classes
> > are the same since the class is part of the type.
>=20
> I don=E2=80=99t think this would work with the from_raw() functions. What=
 class
> would you assign then? I think this is precisely what sparked the current
> solution.

There can be a way to create a type for a C-defined class, and
from_raw() can require that you don't use the same Rust type for
different C classes.

Alice
