Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D0A2874FA
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 06:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459280; cv=none; b=kUtWYHmwgFjUcArxDa3hsDi2+F2HZmLeHrz+GxWzR9J2hvD2M8Xrdhz+XwMGlG2x+aZBFGf7ub8g9NtiCzwYNqhTg5Mt2DU+MKacoXcnwsLMqIefpEyGN0wdpEfYRmtZb4L+Hscp0SDxXYFcimSIGcR4gvHuEiOFfucsS3bQSWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459280; c=relaxed/simple;
	bh=bwsi1+IVSk9Ct1Bn387JTRchuwD/HUyKHMHzSG8RdH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUo+IKEf1iDLw77rym7BFkzM5wT7u0hqdDok1hX1denTFfaSTyU4GLMzxMq82OZT/rhPXQwAb71SC4cJcDCSr24s9ugpv13+I4NgGYfhqefYEAE8Z6eXtrs9Y2povbvn6KNjemvSOKFVJJzDQ3EI+VTlXrjImvFNlsNaSxpVf4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tS3/Rv2h; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tS3/Rv2h"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43284ed32a0so290469f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 22:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768459277; x=1769064077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwsi1+IVSk9Ct1Bn387JTRchuwD/HUyKHMHzSG8RdH4=;
        b=tS3/Rv2hR3Ka81XE95S3lGFgsnZJWCoGUbv9YScloRUy9dC0coRiuKJGNfNwkpMYgF
         s48zXThi2y/0RUEdoZ3BzMjLGdo2cgbm2uVTnZpsWBa6vpLO0CxN/P2f9y0HfbfLK5EO
         TDdgdBB+6ACRBuNxGq4QNCZzTOXuxpxW06LENoVYoZ0AYwjXriUltjHr4Gg61CZm+lHW
         f+fDx2MVeQq/yDahV1phV15wWSg7JTC78+fpZeqbmEGQP0Rgv96CjDIW56BB4BWIbXag
         qK9615T3rYtNyWzZzxr5aKsv8uFyxHSj5swgc+IPxiNqJuvpkxf/WD2mmNrXl6JQXRsA
         QjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459277; x=1769064077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bwsi1+IVSk9Ct1Bn387JTRchuwD/HUyKHMHzSG8RdH4=;
        b=ZlJnBrvl1ZaJ+vHeyeT+TMwroMEfLvprxxv7FrwpRAJ4cGZ0yv+Z523Z6mB2URaQo6
         JU2DsFOoR5edS6i7movpd7FUYu8HgU91qk4i30e/S2M4rPF6KT4U9VrKtR2VdugLxFx8
         o5QcsLgD5qk98v5zfb9ck6dNW2pn0OA3DCjyBxy9MOEnh+Ul6J+HJkTgx/MKBj8j9o/s
         LucUeHJiTs3ibyJHyDswY20r1AlRuoFZxFIu9zuK7zKGkW4IyzLWfYw22xHyfqM2bDQ/
         tNxO2pYPIDYjx/DCl3d33m9My7ik3H9PqGUD/X2zjOETU2DIpIIX9Fq1CJ1BIaxC0Elt
         uMYg==
X-Forwarded-Encrypted: i=1; AJvYcCXBHKvBtjdQdBi/x2jTyQnuGDPzm85P1tUkyhnMvnrpM38b3Oz5oqR9yWytrNgL5sCmL8qdobM2fa5PHLebhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2FOMo0zxwkk6gOdtyEOcIrjFiN+8UDcSx1OT25GSC9Kd5opO5
	lj2ZoOC6ktLoxTrhvgIyihHduqPzJ+43byOC7hPn5FivyBmFyum+6i+ukqwWPRiJcuM3Gnkht7S
	GTC1OpsD3WcnknGzml3gLHRZYYSCuBmRNM03qesQ4
X-Gm-Gg: AY/fxX67ev15B3O0BNkzLcOJzDrpr4Lrv0KbvEZC1QYdFSUmLADiK/kw4cyvb4RfXX3
	81Vw7PfXnGTTFltGA/JnB8RBR3jKs1kOIJNVT0vdkj8f9cjqlSwMIABzfr5k2N8lPLZbqs69IOl
	LTQtbkYoGQ98RIC92qhPy/FzohpF5C5MjWCJDZA2AVGOW+EPhmAAltypIKT6JWuEDFpuuPz4h6f
	WiMw0WW7xpQ+Mxvm8feR1koOZPqRkh/TCbKRosIvqJJelVzLjSbSAoMTcBHYTpjNQESPjsNMW6X
	4Qt/dI4ufLfERMdnex2IbyhCGw==
X-Received: by 2002:a05:6000:1867:b0:432:dfea:1fb8 with SMTP id
 ffacd0b85a97d-4342d5bea92mr5861031f8f.27.1768459277345; Wed, 14 Jan 2026
 22:41:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115021230.3297420-1-fujita.tomonori@gmail.com>
In-Reply-To: <20260115021230.3297420-1-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 15 Jan 2026 07:41:04 +0100
X-Gm-Features: AZwV_Qhz-3gDqDB7ejCRhiAEBErLd7381fzWzW7VpCYl0MYW7fi93w-7ejCQR5I
Message-ID: <CAH5fLgi+kvMUyJPMtGr6e7t5UzaV7Gcc1okEQoDfRUqAKCK0tA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] rust: sync: atomic flag helpers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, ojeda@kernel.org, peterz@infradead.org, 
	will@kernel.org, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 3:13=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This series improves the Rust atomic-boolean support.
>
> The first patch adds a Flag enum (Clear/Set) and implements AtomicType
> for it, so Atomic<Flag> can be used when RMW operations (xchg/cmpxchg)
> are needed and byte-sized RMWs may be inefficient.
>
> The second patch adds AtomicFlag as a thin wrapper around Atomic<Flag>
> to provide a simple bool-based load/store/xchg API.

You don't have to do it, but a nice follow-up would be to use this for
the AtomicTracker in rust/kernel/list.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
