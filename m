Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95243364EBE
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073839; cv=none; b=ok58h81455Sym0PFQooNgVZjNHetp/fmKPl3zqWLGo0WhR85movhsu61UNwXcFKxh7f0pHTpvfUg0+QirQyIfv0G2Rphw9+C9udg9B26qIA54ZdK965hrzW4KIVFneRuBRKiQFYLr0SJJxhK554Se2rRHuwbzWTmZ1s2sEriN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073839; c=relaxed/simple;
	bh=3FXpgVv+E3HY9bZvS4MaytEOHIZxTZ1RLjCqSroub2E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q4uwUs03iZy++ijmx0Effz96wNUteyLRicroTlKQM/McZ60L7FTrJMHTre4sDZ00kLCqD0YuG7/Xe7fzp1Z2LmuLRjYotT6xJ6ukN5RF4/LMsT7FW5Ct5aTBpYxMIH4WAny4/JszntdGCQ25UtrUy/LSyb/jYHIng1M4EC4AiX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GxwKdliq; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GxwKdliq"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477cf25ceccso6735195e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 01:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769073834; x=1769678634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+tqp471u8S2ObvMZsCZi1wCcRe0pFsBheU96MjEess=;
        b=GxwKdliqYZGWdEK81/9CbbaLNxJe5PyxC5UCs8zukJVK46eAqm9xHjh5TWn115U+t+
         VLtE3DS5NM+bIww09OGJA9D4a3LnqrD836n+DQICB6F9ocGwvkLM3lmiCqtlltpxFmfg
         qAxbsFtkLOI3m7ANQ19hlS0FRRexYHbAx+Cqd2cNlqiSIBXRBOfjaJ9TnXfPh/xUNYUB
         uIAtRqXB60hkHd65YRemkw2gK5RJ4yn3fjGtHb172zSf/5dnjxlB81dCMi6eWlTnBhfz
         o4cI43Jno2gUO4q78VY9s63P8lhKAPphULOOQ9tSmjxgG1X7ysrCRQsCkAk3JttI5RNC
         PqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769073834; x=1769678634;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f+tqp471u8S2ObvMZsCZi1wCcRe0pFsBheU96MjEess=;
        b=vcIMwSdQQFK2iAY0YL+mxxQshcmGRxG/laT/hfCq/TduOG5q84i4HbsXT940REChvX
         aB4BneL4aqnpREd5dC7Z0pVrUG2Xsu51M47NvpXeh3+ATOWKMdju69hfAm424wl/bWXZ
         24USEoru5Lv6Of6Mcwyu1JskCG4rLPaIytwfdJqyu11Gipdl3rTua4XwHsOvBr4LnjLD
         21bk7ZCrPUaJiobRxZHpMQSgjUjX7KtvE5mrrGnfdnW+jbTBc0clV/FnlGph9yfQ+Dam
         N2R5deuUyyQDSZn4e1sHS631gDzWzfDIa0B4UGgbQcTOgClOajWu4WBgOkx1u4kij/2p
         ZdtA==
X-Forwarded-Encrypted: i=1; AJvYcCVSuHfChDtYjgoFK61l2yhHC6Qp+setBHvn1wAWry9rAJ4qUOhWuW6iPBqxhcPJPsvL9yClx0D2HuBgeg3AkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw53FrBQLtC/lm9eiLqmEnahOzsamvfvhrwULRv5Val51yVjSJf
	BBzo0ovTIot1z4EQOrHgo4VphAoVh7d5WksQxtRW/+PZyQVrDO25erRyzKGI8w4L8r8IE6Ew5vA
	BmM3HuuslmYJpkJBGtw==
X-Received: from wmbh2.prod.google.com ([2002:a05:600c:a102:b0:47a:7874:d5d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6814:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4803e78fdd9mr135016735e9.5.1769073834677;
 Thu, 22 Jan 2026 01:23:54 -0800 (PST)
Date: Thu, 22 Jan 2026 09:23:53 +0000
In-Reply-To: <52A861BB-9CA1-4F16-AFF5-E3AA96B5833D@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-1-dd95c04aec35@google.com> <52A861BB-9CA1-4F16-AFF5-E3AA96B5833D@collabora.com>
Message-ID: <aXHsqXC-dZhrD2VA@google.com>
Subject: Re: [PATCH v3 1/6] rust: drm: add base GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 02:04:33PM -0300, Daniel Almeida wrote:
> Hi Alice,
>=20
> > On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
> > +/// The manager for a GPUVM.
> > +pub trait DriverGpuVm: Sized {
> > +    /// Parent `Driver` for this object.
> > +    type Driver: drm::Driver;
> > +
> > +    /// The kind of GEM object stored in this GPUVM.
> > +    type Object: IntoGEMObject;
>=20
> Hmm, can=E2=80=99t we derive that from Driver::AllocOps? More specificall=
y, shouldn=E2=80=99t we enforce it?

Hrm, we may wish to require that Self::Object =3D=3D Self::Driver::Object.

Not sure what you mean by AllocOps.

Alice
