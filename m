Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4D74D6C4C
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 13:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158888; cv=none; b=fk0oHbaUNTjRvRc3pHnbdJVY/kT+TmpcN26xmhhbSreOpctkn3wSbeA+6yR4pqEqCgyyziApa+zO1dzo1UKPSUkv54ooFhRgvWh1DaD8QSVu29/iklahSU/ZtHypO+FgbVR7DDHAsusjrneYxDObTowRmiep8S4Y5BxDD/3Qz0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158888; c=relaxed/simple;
	bh=VwOW9LuuRP4zm4xzSacphrIEqTeIFqxhd0KQcV0jQFA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iuQPaQGvmQfXDQju4OVv2XbeGd77eESliDrl57BSbfKzVqqIHOAha6SUaAteB+B8MqksEfRJAkb5zZMSLTZGI+ZgyytV6dPsPnpBJF/zjeGTi4x5L0Y1JRPnXcDunS5luKDEMEHtp+xy7DDREU2KJ5k5YnPn0G9tVrt1bhrnLE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OEJDx9VL; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OEJDx9VL"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a615ab0c06so6443243a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158884; x=1792763684; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4RB0qRPK5JwVr0FFzsYrhcGUqlQtMIIbndksgD1L2mI=;
        b=OEJDx9VL+zdtQqHEW07IdYEMoJJMl7SaOmmjVqXeTVKZxjPJNWimQvqI1PmHdZ9wSX
         yxKR40JbI8kI/M7SGT34/Os+pEFFm8xAEfzBpW32rY8G+c8Q/UetE4qls/LlSa2N5IyP
         iGvoK6NKj1I5G9fL0CXlcpdge52U1Kbhf3BMYrEoRtPPGYsuEpR/Eivb9j//OXR+FjAy
         OBzJ9jhcZ+OR0yYC8NmVdFnB36Mr8JGkJKEp1E9i0PzDHEiUMgcsYjHCXPyfEQwgP2xV
         D3Gtcn5jHMvaO4yxKtUSx8VMBfWnzTsf1wz4U14eqyQaeKnGxMkZ4Z76aB6Snw0Hf30M
         jwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158884; x=1792763684;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RB0qRPK5JwVr0FFzsYrhcGUqlQtMIIbndksgD1L2mI=;
        b=mvv6x94ywdDvFQuw9alahO5Y54ux3AyuJHjdAmZ/dIMiA4D7Jgp+OeKp6vYDMqIj02
         3D3YKIbAcDOmkTz5Aeq14lIro5i7ziCeb6WRlVcmkMoszcUVZriYNgVn+B0VNU7v8NOy
         JS8QNPcjqNxYCi3lbzWJuaEUpOZ5ye/Vov978ao872Rx0qRypYnmzIMcdLcbXV6E/eCF
         16obFBTlvuBwwsRtbIlW0meIkXspSx02wo52En48W9nX823tLYgrr1YSiupt+LySVH++
         yBQPjiYpU+sI2cwPxQFGQ1CyFOZ9vX2O+4wv+Qx04gxpbgOBmg7ApBgX1C0K+FUoa4jL
         uQtA==
X-Forwarded-Encrypted: i=1; AKwUvBxX6msuzA8U7cbas9ZRQhxLo5cCVfc/degxYxyPV6xUoZtqI4Km5io9OkgnSEClE0dOFu24B2jYv0vjrDdt0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYL4mAyEL5FPt9Q25xAMZO5PWgD57v9o1pMl5NhKt9KvlxmdnT6T
	XNI0PxzPEItLQ6uAlTvfzuf15/BF6pno2sNVKetS/EZozHsrA8kWHs40R8c/iJHVDDKStfS+J4H
	geqS2PENnJc7t8bIt3A==
X-Received: from wrwc4.prod.google.com ([2002:a5d:63c4:0:b0:48c:44a2:fe52])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5285:b0:6b1:497d:1c64 with SMTP id 4fb4d7f45d1cf-6b17c293eccmr19329170a12.45.1792158884099;
 Fri, 16 Oct 2026 06:54:44 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:36 +0000
In-Reply-To: <20260814230923.1292966-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-5-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-4-aliceryhl@google.com>
Subject: Re: [PATCH 4/7] rust: fs: add iminor() helper
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, 
	deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2026 at 01:09:02AM +0200, Danilo Krummrich wrote:
> Add a Rust helper for iminor(), which extracts the minor number from a
> struct inode. This is a static inline function in the C headers, so
> bindgen does not generate a binding for it.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
