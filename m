Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CE32853FA
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 13:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291265; cv=none; b=Be8v7hzexpdsiOej/9Hu6vPLnB15RZg888JuKAZhcU6iazLqakG4c/2OEX9Twx/sWXtZDsWOVzY8TuPuPJOon3gNDdr92/pkX7eGgrFFp7hUj68vNzd+RpBr7Am5qzHcgbAcEL6miijM01SEoec3nQNunBoVr2PbEPCJ4lqo9tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291265; c=relaxed/simple;
	bh=FmFhlnhjy0ybwe7HPXrLM1v6xm2IB55H407HZ1JdXSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OX8S962OBNj+OAH6DPDT+oEqTV6e435d6Nr55LYelSABy/MgYJcFiF4srK30FGH4YYHknGpbGBBshD2WPp8nm0vB1FNYaEf5UutEC/5C5hJ8AvAiYsZBMODULQj+cmv8nRTcKk0H3fpALZaXLxWOm2v2u2q/8btMSgWfzckvZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X/N97gH8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X/N97gH8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so8891595e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744291262; x=1744896062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsD5P8r+lPMzFGkPu3i84ubxQLn+d2TlLf3MXEjgVbQ=;
        b=X/N97gH82wok/HHm5z+eub3goWM4NYMgO5uITWOnzijvMJQ14l6hTC1WFILyXt18wy
         1BSEdCk0hpTK60TcFjJBE4zGrvi2owKMKQF/E5kKSFA2OKElWjv1tdtNhJYBkqGTdG6/
         K47YpV/8ZMZXgJefivifDYbl+9TS0j/iVx9KgMTkEcRTnb0hoOV3r/XhvzUjAgROvo4f
         wEC0xe2BozzS3HYpa4z7QbFLDVqMgYJJkDZHEiCXYBATks5xTx+3ry9rjvCr4k0XeegF
         Aa4TH/5wEhRlP73MWay10hmvYvUT2mvh98X0GlnkkzjE2MkLCo+K+qTIpvPYqaXMeNoH
         9Cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744291262; x=1744896062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsD5P8r+lPMzFGkPu3i84ubxQLn+d2TlLf3MXEjgVbQ=;
        b=wTzCU/KSE1RtlIUeF902nYNqneUJ8qMF8vrq/XrHXj6Yb/ZNY1GytvhOaoY6IBxn/6
         7A+jGDsvhUi1Z2nRzPtyyoLS8NPDMei6VZGiIN4Z6oYRYBhobJWY2FfnXbJ8coVCqtfF
         t6lYbPftRTcvoEPdt1kkvePHsB1i1mKGao/IMbme6hCAMKhIqh7CEZSnfz5XxAVixH6x
         twnzlfg6ZimS1XDlZUtcoUCA00VR94UkaZgpuPKdVbqfXwnpZt51UblExicW3nyKCh1A
         PlSusGH1V6Lhj+4lru5M7WACrn9db8jOH2g56RJtWg2Q1XtKlaSKv2NhYmtM/vUfyS+f
         zomw==
X-Forwarded-Encrypted: i=1; AJvYcCVD7Yq789alsiCV91NmylPLH3jsqmjoXKjHl399PrFeN/Na5aMMMMeLkLoKD5c4mT0M3lwmHcRy2bJjTo4iMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7XkaEMhd7H+sv9eGeNcVeuSUa36f0zdlr6frMrzu9Ymc84jBU
	EmMBn2qAOAu9+/08dVdxi2CAF+UyB3X36YXD9Ps/8FUI3VgpaN8OFpCTxM/Bf9GtLEAGs86kxk+
	oukrVi3t4IXKEK0gB6OzfJbbl7zaanigInMot
X-Gm-Gg: ASbGnct6sJTpA+YpiEuHC2/1UICWOvYq+MrW9ukfvWwuqd38fokG7vMc/q0dUCTWHXj
	yzlFD9DZSFntcTKzCBb9N18vOqusKeQ9hxME5s3JnKkB3qIFWDd1yCccQ96+y3pUe2RdoETuq7l
	Wz7q/pn5HZ9em0B1Jrcb82B0MLZVruJ5TRlVBjJE/rGQaEJdP/uaCh
X-Google-Smtp-Source: AGHT+IEvwXGGoLrKfaD4cZUMR7FFCKgvIc80Fy0ZI9aj31BxGTCUM185T9xzoJ417PB1Ae+UpN3CMc53DtUrA4R9z/8=
X-Received: by 2002:a05:6000:2504:b0:39c:cc7:3db6 with SMTP id
 ffacd0b85a97d-39d8fd46a4bmr1920569f8f.19.1744291261665; Thu, 10 Apr 2025
 06:21:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410130944.GA9003@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Apr 2025 15:20:49 +0200
X-Gm-Features: ATxdqUGeyXh0K-mA8y1HlcR7KFZ7uqQhVhQFznaq0Z4ozbkUrNqiuMB3Kau5K7w
Message-ID: <CAH5fLggMoo8SNetgm1cC5u6ZabbhA5o8L3U2x5p4NP2n37F7xw@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 3:09=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Apr 10, 2025 at 02:45:26PM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 10, 2025 at 02:36:02PM +0200, Peter Zijlstra wrote:
> > > On Thu, Apr 10, 2025 at 11:54:20AM +0000, Pawe=C5=82 Anikiel wrote:
> > > > Calling core::fmt::write() from rust code while FineIBT is enabled
> > > > results in a kernel panic:
>
> > > > This happens because core::fmt::write() calls
> > > > core::fmt::rt::Argument::fmt(), which currently has CFI disabled:
> > > >
> > > > library/core/src/fmt/rt.rs:
> > > > 171     // FIXME: Transmuting formatter in new and indirectly branc=
hing to/calling
> > > > 172     // it here is an explicit CFI violation.
> > > > 173     #[allow(inline_no_sanitize)]
> > > > 174     #[no_sanitize(cfi, kcfi)]
> > > > 175     #[inline]
> > > > 176     pub(super) unsafe fn fmt(&self, f: &mut Formatter<'_>) -> R=
esult {
> > > >
>
> Miguel, I cannot find this code in the kernel tree. Is this again
> because Rust is not free-standing and relies on external code?
>
> Can you please fix that. Building against external code that is not
> under our control is a problem.

It's from the core standard library, which is shipped together with
the compiler.

Alice
