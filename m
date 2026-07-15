Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD8B28C009
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 15:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128177; cv=pass; b=W33QLhYSkGlcofpDTyFeriYPBjA25gExV5oydv5gtkZL/sZH/5H11NNymHr4WWQvbyzsEEEiJekt14sumVfBpK3PJFackfXweXBj8GWMpCMMRCZ0PWTV1CTGqXWGp71Gf4QK81fTcNhRyg0Wd78R2/Z/Erb0A9brkczuMlsUGbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128177; c=relaxed/simple;
	bh=CAbMyDinjfrVG2ATQLRjV7wwiCf6iRNa21dBZ1UUJ+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZSlvrJfQptrnengjGO1U+e8PykrYvNlpI1DmA5a5UXwlnKFtPnfQAbnM3oxtcl6cQsm/iWZL9VxKVHEqQzEAtvELCyEYWHLXjz+Jf4Roc5iCu6F0yPcu5FyJow89Ke1uYfMeEqnlTyKvDVZ5J89CbXxp+pvTC/34XSbKaHbDSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+RrWCD3; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+RrWCD3"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca6d9c91206so483226a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 08:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784128176; cv=none;
        d=google.com; s=arc-20260327;
        b=YfDa6RwhQ6jDZxALmWciWWMwiLJJMZT4Y9rgH3fjCrG6cXkR1qFbrGDcsELzNIFb8Y
         ZbBfSP9pxwhf5NFaHwwBypUGMv7/snNG3+rU2ziSflNFF0hTcPwUbH7ppS0H4r1lcaJO
         if4ngkd/LcIFJQKBMprjPK/GvKirrXoPjSoAMzUW7GaqqAFbEy5/IvEidzzazU8E5dva
         /aWG3t3Tb8g9NGiqhVDA9baiK7u+x0HrjRwQO6fO/GrMgGsdrN2wVkgeOcVd+HGej4/7
         nXowDqktjBCR2dEW5jeLDmCkj07ILK6bC2tgFgDvr1wmwPtcE5D4i+RdZ8JBIqLhBmQ4
         MmMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CAbMyDinjfrVG2ATQLRjV7wwiCf6iRNa21dBZ1UUJ+g=;
        fh=7iH33E6UDZsAI26nZZrJK7SWXczjY1Is0KCB0iX3Wbk=;
        b=MVYEkhYsPBF8YPNjom9zpWSZ6FJS3cMVXjUh827ZH8PiQtD9FtSeYPaOPRl/JNj3Gh
         p/kbzi8rRp6yWpZZzMprUkxAhghIMdf6pV2/XJSvA1EehnCC7srgDtYUFwHYkkQvlVHf
         LZ0SEcrlOayNnQOpvfbs2kXwx28c+VtP48xJwTMvViSkKmp4OCRf2gSpXpKlmmkU+FUP
         BFNboDfNf2CFnk2HbTxK8ZUy4KsflxA3WGVyzvmVMqDey55PtiOAZi9PNDGRv7B73HcO
         MP9YooECabQq5g+uAxxxiZf1pmouXodJ/6gup9mWrm9w9ZsN25UK2y1i9DF4wlvMIoW1
         jQGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784128176; x=1784732976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CAbMyDinjfrVG2ATQLRjV7wwiCf6iRNa21dBZ1UUJ+g=;
        b=d+RrWCD3DYliqatD8/TEkCW0T7tUOlMZuwnyeytj6c8re2XtCpxlCSYHoQx1WOGG9R
         2JHm8hUKA0IA2k+/UU6MK7cVdPO5rwOvwd03lp/K9hmTzDQwD05Q6Uv2uq5Hd6f6O3lG
         LrfdWiCetR9bTuLZlaijAcceShHok2YlsWefHVeUbn+wKKOVHpayMF+B4HhlpLUAskto
         oMOP75V9+T5jGv6gi390My+Uyn0EbfbuybjgzcMp6oik1YAaflymc/C/uoBsE0eVbep7
         PklibnBY70Fna4P0kSlGQeMreDbbzHH1qoxAGrIyxLl+b0Jr3wmW3VC2rBAfd7/JNd7X
         qORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784128176; x=1784732976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAbMyDinjfrVG2ATQLRjV7wwiCf6iRNa21dBZ1UUJ+g=;
        b=B5IW0PLkN5Kl08dQU9NOJXt4W6bZmmV7fcb+E+oOHGASBdHhiBIRHdnOfDvIKQlCGO
         p8ld0wv8im77HYqx1MuZCTI1Pw3Ygallravjs7tr8tDmqv5wl0ujz7V+Q/DsRVqnKjF2
         CxaZJezC6I0Kv4bCbPmkGpC7GonOa3d257/VujuK6xR23PK1yvMI8LpTFKeSEsgJ1z3g
         evzV5vTx95nKHIlzhocDbkP+UhwRTK1zKL5DgUb890Spj+vUmKiZOC2GkjwwUX8O/HX/
         kqgcOaQxvQVPQmGgMYgqXPvoBiMzt2hjILWevaB/7FdhcAgmg01ZtJZOtuk6RCgGsYVl
         dLcw==
X-Forwarded-Encrypted: i=1; AHgh+RoCfAz/r2Y6AiF6kiCJSaOrslF+hhNSQZ7xGpz+ERmrhYC5LervTBFl/JrK3ONDyi83GOHTbd5MK/a8V8XQLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl/SaVUq1YdlGZwmZegD31XmYM/lPw9+DkvmY8BAg3oseh9/Pr
	6ogKlVsZkDxUIlGH2o5M4vW29I/ccsNmkXdlgDWamgoc89plGce/Ng+12OLlfjkKJ8p2rl6GHaV
	ZelbSoVIwJvaFcs+SqQ082RdoZYNXcUbh+6u6
X-Gm-Gg: AfdE7clqJyy2dgKgqJ2vHxy0advfZnVgOcfNGVm3pLHQQ1ThYcsc8nhAUSNaM9njwDW
	b2bT5JgMj9J2EYdwTPx9fjhVtQkeC7o6ycjmYLgr+sv8wPG/YAl8OBDYQAJMhHI80bEQwBq6/uC
	5CyMj7o8e4G0d7zoLOsg3fWgwwj0zm+uWgL30AmU5Y8n3CLFSJpxZUrpkTXXLfIgR+GrqNzrQVZ
	fmJBXVNW5O9MlIproNteg5uOqalu1cxIiljy6nGqbZ368b2duk6Ta5eYNEkDjAO2dgdwPSc52Ck
	GEOE76cSek7ml8rHoiUL+51We1+Z4o42P0ua0GkjWztpZTgxQFRgVIfYXiwMf4MjpOLz5R+gR0B
	5U6Mf7M0edkh7cowlUkk3OZI=
X-Received: by 2002:a17:90b:588f:b0:38d:90c1:2485 with SMTP id
 98e67ed59e1d1-38dc7b7040amr12410224a91.5.1784128175661; Wed, 15 Jul 2026
 08:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <hGNrgHLZgzaLAav_TQCJaAHYX3aWSPyoHeXEf7u3ioJunfoFTIPF9Q8PnCvfRKXq2SS-fNdOn35uMiTaF90nKA==@protonmail.internalid>
 <20260303061000.73970-1-tomo@aliasing.net> <87y0gcf9xw.fsf@t14s.mail-host-address-is-not-set>
 <20260715.202254.38223441240127219.tomo@flapping.org> <87a4rsgyqy.fsf@kernel.org>
In-Reply-To: <87a4rsgyqy.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Jul 2026 17:09:21 +0200
X-Gm-Features: AUfX_mzLNzLtlKssgf-eFUTUjDKkXP-4I6fvOzwBiVcyeviMz4X57rQ-Tmp3Bus
Message-ID: <CANiq72=XvdJhGcbfTF3yv_S9Ls7GbFL_fnwpoAUXmwFc6ND9Bg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: hrtimer: Restrict expires() to safe contexts
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <tomo@flapping.org>, tomo@aliasing.net, ojeda@kernel.org, 
	gary@garyguo.net, dirk.behme@de.bosch.com, aliceryhl@google.com, 
	anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, frederic@kernel.org, jstultz@google.com, lossin@kernel.org, 
	lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 3:37=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Either way is fine for me, but Gary seems to gravitate towards the
> current solution, so maybe keep that? We can add a "// NOTE:" on the
> struct definition saying that soundness depends on all fields being OK
> with this caveat.

If something actually breaks, then apart from the note, what about
`repr(transparent)` to enforce it?

Cheers,
Miguel
