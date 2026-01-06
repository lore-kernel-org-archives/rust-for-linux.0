Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D083359FA3
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767725002; cv=none; b=TPBnEGRNJup9wI3Ly6G81IlOCoLVcmwj3maiqpjM4K5X4nzE5tG86cmruYnb/3EgAFLAc1lF8wFkl/wWwJrl6KwH3tcFwRSt4SQWY13kr3YV5QRiSV/2jT+F8sx1v91wBnI1xfBD4YyTO4xccuDUntmjcXNRbJG+jptSUjCxYFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767725002; c=relaxed/simple;
	bh=+hgXtvwaG0Luhj+7jS4/1WIg+U754WDTLyVGK0ofmHI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n+naF6tBF6T99mh4Hlewx0o8Ab7SnfY02xQrfmRXzp+1xUSUOEctjx22h2oJf3Yubux8lCtxazBgJRGQUolT0ExYN0cRgFt7f3AWniKR9sIQnjqTerHWkvV/UvEI4p+j4px/Y2ayMSp0WKtpasscqyRA1dLRNiJMzZYV9x/8k+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DTAW00IT; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DTAW00IT"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-430fcb6b2ebso700798f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 10:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767724999; x=1768329799; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q9kRQb6TCp9mLA5G8uSGQS65VbTtuKHR0kMxDo1y8mc=;
        b=DTAW00ITyLnbQBDYcYCXFcRZynF4aeOlu+aqSYI1ZlSN8pbLHPgWhxDG8x8+EsDmMa
         tPLgi8Dr32r6zqGhu9e2reA9E15x3hoIPZ+36dqdkLW0qqhFRN9tN8fbA9/hImJHN/lB
         CcUsBxWb9LGttwhgctmyJojNxCOnh9cbmriPxOU/r1SXEAxgtftYweLor07za++DCiLE
         h6H/sOICzWwklw2vJlipcY6oq2OgW+SYWpogwTrM4yC2D4sNxP5QTmOl85PyC4u0yEQ4
         AuU8fwSYYv9FpGa5CHSPGZ1uJRw8UmeButZnD31CP9XmwUuR3+41a+B8pmneGY0flVhi
         vKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724999; x=1768329799;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q9kRQb6TCp9mLA5G8uSGQS65VbTtuKHR0kMxDo1y8mc=;
        b=TXM/BIcJH4q6eOFZR5OxQ2vGqyZGw47vTFIC6hyXsP4sDeI/p121mQLwgiEr3aceu4
         U1l93t06549sqGzmzZeD+Y02ta5ZTuP/ZBOdD+Cvz5/RW+euNu72oH8cZjfoEo1oyMBX
         bamRXlWbvn7QFpIgL4nymPmlW4uooN1x07Q0u0Lz4ipIu/a6juhWGfhlN31PyotlJXjv
         OQjSl3PPE5a1Eh9Sf1LXhAUwcZVXUMvVx0YT/zldvltdE69UdHEmoxcwEU6hFIRoZSpE
         0bMMeLSUWx9h3r1SBJVaBW1V+MokpVpuNOhxn0uMyQYhfM4mHeLROubse7uqHQbpO9z4
         FNlw==
X-Forwarded-Encrypted: i=1; AJvYcCXrgj6Tf3lZHRNX7WY5itgMydXDfmtzdd6c3i83wDMyD7P4zbJXX4wslP6uzg7l9CjTzVax390ASpavypR5sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHKQfDUfAfhE5f3/CflZewmoqlvndaTlGAW0jRicJjfVX7/N89
	xue1QFX4AZhZ+bAUJO56Y9N2fN0lzO27XVh3iL5qGi3ga5hlz0g5lIE+uGxxbpCTr5hgR5h4JIU
	Hmueuvc9olQtICYjTNg==
X-Google-Smtp-Source: AGHT+IGVcCDObMivGZ6ItRLBNbRjswIjQ3SNYuJmmzi0+OqW9p2tg/ybCzvxMsorncSHo3wGn72koB3zTO666Zo=
X-Received: from wrbgv17.prod.google.com ([2002:a05:6000:4611:b0:430:f5d7:f015])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c0e:b0:431:752:671e with SMTP id ffacd0b85a97d-432c363280fmr199767f8f.15.1767724998951;
 Tue, 06 Jan 2026 10:43:18 -0800 (PST)
Date: Tue, 6 Jan 2026 18:43:17 +0000
In-Reply-To: <20260106152300.7fec3847.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com> <20251231-rwonce-v1-4-702a10b85278@google.com>
 <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
 <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
 <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
 <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set> <20260106152300.7fec3847.gary@garyguo.net>
Message-ID: <aV1XxWbXwkdM_AdA@google.com>
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of read_volatile
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, lyude@redhat.com, 
	boqun.feng@gmail.com, will@kernel.org, peterz@infradead.org, 
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com, 
	catalin.marinas@arm.com, ojeda@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, tmgross@umich.edu, dakr@kernel.org, mark.rutland@arm.com, 
	frederic@kernel.org, tglx@linutronix.de, anna-maria@linutronix.de, 
	jstultz@google.com, sboyd@kernel.org, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jan 06, 2026 at 03:23:00PM +0000, Gary Guo wrote:
> On Tue, 06 Jan 2026 13:37:34 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
> 
> > "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> > >
> > > Sorry, of course this should be:
> > >
> > > +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
> > > +{
> > > +	return hrtimer_get_expires(timer);
> > > +}
> > >  
> > 
> > This is a potentially racy read. As far as I recall, we determined that
> > using read_once is the proper way to handle the situation.
> > 
> > I do not think it makes a difference that the read is done by C code.
> 
> If that's the case I think the C code should be fixed by inserting the
> READ_ONCE?

I maintain my position that if this is what you recommend C code does,
it's confusing to not make the same recommendation for Rust abstractions
to the same thing.

After all, nothing is stopping you from calling atomic_read() in C too.

Alice
