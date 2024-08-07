Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4321EA0A3
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 13:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723038940; cv=none; b=LffH8qwCZj1mW6jji1vboDMMdhX61B7vrAt2m1IVFKuzHlW9hmF7RNLX4SZXswKBqDW5L/Ebr5rMVu5XHbtVKoMd2Dg0l7agAU/dK++2TWChDugo87gkP9v5l687klp9gvBhovtkoMv/aIwW16qeWyW9m2OFyAg0jbGbINKJ0sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723038940; c=relaxed/simple;
	bh=OOkW0C3TWxiXh0KWW6Kt/17VMC+Wv37GHf6UcFqo9FI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIjnJ4GHAUhkKDQwGNLIHLMBaff9qhiZE3d6HYWFzpgbKoTOBFDutVA0UlH5etalIE2rIVlXlFI1stmazHgj8lWI4uwMOuaAd2P5gNr4T92adb9Yy4UA6ZBa2ExAvt9KbNVWU13FaVM1tKfGqfnQx8shOX1W0YzpmmIezxMsXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DibU0r1A; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DibU0r1A"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-369cb9f086aso1147865f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Aug 2024 06:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723038936; x=1723643736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOkW0C3TWxiXh0KWW6Kt/17VMC+Wv37GHf6UcFqo9FI=;
        b=DibU0r1Aid5jmzN9EGXaSk8OlU2iz+cllOA/xmGNfIlnYm4s9lj6NpnHkS8+2Ib1As
         ZsV08QGVZpn0/MgS1gGyuH80bEao5lbFrcwT2XQbLbfpB8RnyhAcW7E1FrNOD4nx8F0o
         oO48sWqzy/mqVm217x1V7C1ioIaCmVcESSf/7VHglfnmqhEkcSJZKZ1CpIaO9BwoZ1py
         ErxTLvo+ixDHuHhmKpDCviRPqHL2bdqEoSTSYcXVRyt5jdcJCy6kceSvoyCtscB20Ujb
         Ojgt/4QnNyWshsFXUyH/j/tSeK+32foazF0LybIhACYYPR1GOGNNHcDXpNlfD/qS0nRw
         sNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038936; x=1723643736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOkW0C3TWxiXh0KWW6Kt/17VMC+Wv37GHf6UcFqo9FI=;
        b=hDxIaiZC3GgCDY/qaNl4PaeohtfcPIkJ2n3qL/I9DS0csAusJ02rTn2pXe0zVwSN6T
         o5aJbHSvm7V8XvI9BNaEturFgzjwStJ3T5a+fjL1Ea8ziG1Hx1S642Qg32S8SCb5n9dn
         OkED3uuyz2jHQ7iE4a2LmvWWRvJ2YpqIj9yOJyn1EQK9fxzLRpMPVJl6iBVUYTHcvnG8
         ItqnJ2F+dBO4/xQGgoTv8TfjpFL0HaOhLcNbbIDOGd3G/xcTLfSCIW/H2i0MkDPFGfp6
         xphW0/pPV7JOwJ9uXHmWj4TUYAqudmOMUG8/4HGoH0dKo+iF5skP/6fi3hjtTBZc4ntM
         oKGw==
X-Forwarded-Encrypted: i=1; AJvYcCWA9kcmTxZ/SEo51RuBZ4o6EDX68WK5KqOQbKIlbN9+k4wgqlyztPs8i8c43OWhnrFeLk8ckf8t6Go7sWV2Il6peZ1McynJzQaJoxuxQ5w=
X-Gm-Message-State: AOJu0YxSoi2LGDho2ql8Ew5HLoJFcdSxoI4xlFlrLY8Hrm8O5oBBgxr8
	3d/txJsyKgJcdYZjZb+PIbudCgviebnW97RbM2/reIbN4BZnBCvpF1KSdeawuS3qLSWNiTd573L
	+dizQD7Ggf/+LHHxO+kfn5pwCogdNgsVbMALm
X-Google-Smtp-Source: AGHT+IGPQgzETpzG41seLRcbtcsEFnCBPNR2P66mPBNMHEJ61nNcZOcNkbvgkcOQKESvuTz9aFPu8cM8JjruPJkyN/s=
X-Received: by 2002:a5d:6d87:0:b0:366:e7b5:3b49 with SMTP id
 ffacd0b85a97d-36bbc1c246dmr15612543f8f.54.1723038935713; Wed, 07 Aug 2024
 06:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-23-dakr@kernel.org>
In-Reply-To: <20240805152004.5039-23-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Aug 2024 15:55:23 +0200
Message-ID: <CAH5fLgi3C3imTjwx697zCuDnipmX_KZpsQaGYUzz+3=MW_Cf_w@mail.gmail.com>
Subject: Re: [PATCH v4 22/28] rust: error: use `core::alloc::LayoutError`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Use `core::alloc::LayoutError` instead of `alloc::alloc::LayoutError` in
> preparation to get rid of Rust's alloc crate.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

It could make sense to squash some of these super small changes that
prepare for deleting alloc. E.g., patch 27.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
