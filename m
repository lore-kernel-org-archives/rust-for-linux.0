Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161ED1D6DAA
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297466; cv=none; b=YI5GbHPbUhLjiDkG8pmA2PQfJfNsCi9ri/zKP3MV3sBUrVksQKK/6m79x+B5lRAmqFEUoAz6Z6CaHHuEOsqIDVPIeMgpuzaIUowSTtQUZp1im6MHgdpEEyEyjGkj5ADZPByVBhWxlJLRxfVDj94etSY+yJWtVhxpCRAiFK6ZCZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297466; c=relaxed/simple;
	bh=E8idAwS5ka05vFYRVoPPGjqaHrB01vGTJ0ZnmvLeqQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+MbU2bP+nU/uaU0FmLyIA+YFaWlP5fmdnuUVP8+f3KFwKu2LGTDlQ06KN5k6LeUv4X0dFS4geS4FXOiImYBbTLUHm+ZM1bkFW8sPK+BLK+VYTsGZsEyR26rX7+vbaw60FModYcHRLWVhS7gHcxwSynMmSvBXiRa/jQ878xm90g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ojDME/Kq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ojDME/Kq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43edb40f357so8449765e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744297463; x=1744902263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8idAwS5ka05vFYRVoPPGjqaHrB01vGTJ0ZnmvLeqQk=;
        b=ojDME/KqAXd8ILoH19b2TqSu9mKyJ3/cUKW+tTdEx0iXSAxfqumbOiVhJiTsaopTN5
         ddcPMoIpepKnv01uZe7dW/couDKwUMhQDI4wFjIwyL4oH82rAk4tIAgtrwWlr8gAS4aO
         ce7fbmipuL8/ZzZXlU3Ffr0DxCz5S8YqGFLTTsmFCq+jzK5hZeuWyTL3nEaTofkhIFrd
         k7GlPvG3fsE4Q7lsLkMNM+p9LGReRb99Bej4EkYcnc48CUVaPXhPEhdEG/mbPNHZQPyf
         /HhfRB7XBrckphWlTyWdzRcKlfpa5BnOS0S0AewR7wUTcQibX5cGpIBp+3vyVq48F2Rh
         Py2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297463; x=1744902263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8idAwS5ka05vFYRVoPPGjqaHrB01vGTJ0ZnmvLeqQk=;
        b=wFH7mF/Zo46t2buBEj17c7CbEA19quWi4Lm7Pq41BsFsuOG4r+5J6IszeL5I2SMupP
         9xDSdJph87oUe6oCCd08b4JSKclDk0AGRsyqHdkDnvnSSVcz6BbE2YtTRt1LtiehPGz1
         jT+/L1iCAM+BVooUtDCdNhGTSTzqaIAM0F5HfghkC4YkmzaIc/0Duc1x05r91HpAzs03
         ofw0OeBZbpy5j63MLaALjPrbEApmHCu57TCOLo4KktJAP2VpGzQAZKRRpTHpECxOauvY
         t4tni43zAtxlA8RR0dDBKsA4wXpBajrhyd4uKwT9+dOdw3eZ5BWupOPfK+3xLH2aoquU
         q5cg==
X-Forwarded-Encrypted: i=1; AJvYcCVZlxM8tJfO9qAJ/a40ubiePYHGqNAkKQxwmCECacwaBhfMRYyrQIfhxXBeH29joyge835UqUiNwm896gu3Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS95s295s4bNvq3y2PmLSp6Myt+s+K04M+Ue+Dfls7EliEu3Zt
	pm3a/Hk2qEnZuuPiltDhvPDOoBZ2KPiP7fUsNoLMOKXKt49aQ5bnPFcWgL+2F0r3YPy0I6cNSYy
	fnmaBOUxpDKIFMcg45/ijl75F2uFiZi7OYauL
X-Gm-Gg: ASbGncuAgju0Q1fxQ8ivGJ7owzpvQ4svvMViMBb0KZ/M2U9lI593lgkPToMPXXCdSE8
	fxrD/u7hXPIQTc7zLq9YOvh2d32Xccw3M3z6MBpN+82S/GcpjfNQYhGhojKkfFzXWtL1B59uvFQ
	IecCg7N6TjCEJdYq1GuT8nqBdE9oD+Y2JPfSEA767+2l//RR5jcG9j
X-Google-Smtp-Source: AGHT+IHvGrA6pL9xJC71Rglk+R8UnCNP8/PG6RbzhnJl4qgAtYC6oJwdw7O77fLIUePEg2xGL7SeJfKv96Td6xiTjfY=
X-Received: by 2002:a05:6000:40c9:b0:39c:1258:2dc8 with SMTP id
 ffacd0b85a97d-39d8f4fac26mr2743346f8f.57.1744297463073; Thu, 10 Apr 2025
 08:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net> <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CANiq72neZj+ESvkxwXAQFnznwYBiQAcpW4OqXg1ckhxZj3fd4Q@mail.gmail.com>
 <20250410135713.GG9833@noisy.programming.kicks-ass.net> <CANiq72=uj3G8ibnzpuYzhY=7T5xrBBPoeuAX7X-iBKdN+crQUg@mail.gmail.com>
 <20250410141534.GI9833@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410141534.GI9833@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Apr 2025 17:04:07 +0200
X-Gm-Features: ATxdqUEvyW1qop9m9a6mIi5Di6pLCP0HihCzqQQdekJ9tTTteZk6cuZ_FEbf5WA
Message-ID: <CAH5fLggm0Q_EGMHXG6Vu2_7mUPdHd46HC=5dPALRAAOXE8yHSA@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 4:15=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Apr 10, 2025 at 04:05:54PM +0200, Miguel Ojeda wrote:
> > On Thu, Apr 10, 2025 at 3:57=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > If you mean fixing it upstream, definitely, but we should still
> > prevent people from building an invalid kernel, i.e. when Alice's PR
> > or similar lands upstream, then we can relax the `depends on` based on
> > the Rust version (which is something we have done for other bits).
>
> So why wasn't any of this a problem when Rust enabled kCFI? Surely the
> testing back then included FineIBT. That has been in longer than rust's
> kcfi support (integer type confusion etc.).

I assume this has been a problem for a while. The testing we did with
FineIBT must not have triggered this codepath. But Rust drivers have
used the codepath for a long time.

Alice
