Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8C91FFC7B
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761298053; cv=none; b=Ws+GmXun6UkQClU1KLX4FLhOPBiLkyWfz+FydITC31QbLOQJNxd/lKXDdSSnQ3M+6B8JujWBdVSGmrU/m8GJzSA/t4mTeMt0F9cY9hKXN5hFAl5IS4ZZBvCPHx6YTlljBkvUwyuPbS/Rh+vt4PPZ9Efj5drr56hIjwmIZPFosFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761298053; c=relaxed/simple;
	bh=jz3r6IG//8UpNyt5YK3+fvQAu9iJEiCU7Jg/ynlHlE4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FP/+0WlXXJ/k+dj20aq4e6BTczvFZNWyfv+kSDtibtHUnMde4hAMFxf4YdnO9i/B43KZXn0U7vVl45efQyuTn3UUyToX5PNR09bpnvcFSHzILw8NR4QvVlQin92VhMl+LzH7zDxYLcK2XyHeQVzRYDR/GGYNgpUZUN4d8HTZCFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KOx5z8x8; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KOx5z8x8"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b6d3fd5b2b8so141675066b.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 02:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761298050; x=1761902850; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JkKniSG37xTx1eVGmGkTV5Ir1JTVe3QhsEKcXT38Iss=;
        b=KOx5z8x8cAkXV44T0yNxAZlxB7iTtqw1eiNZ612Fl9igMi9zjKEdyclYw05F4AGM9Q
         iIMszdAX4Fq2G9G0cCYz628rzrpUcUAMNvUNjFQrfyPM6nwtAT+c2y1RbJVb1owDAEeQ
         vkUfCjuf4qY00sR6CIVv447mbUXK/paYc3qgG2a5zIhi7zEEbW/0SFD0yXIkan7D7Hgq
         N2wVTIP3rU9M5ttW15U5+h2nGRWs+HT3QctGHV+q0U1p5zahEeNaQI0icSbaOUEzAX1y
         j6paiUXU2kjGw6K8yysmbaI2L9pVV68fXogsxGUWqdCKzJZlm7XZVw+LOLYMcVc5/UuY
         czBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761298050; x=1761902850;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkKniSG37xTx1eVGmGkTV5Ir1JTVe3QhsEKcXT38Iss=;
        b=RZPA9qZS77krmILuyCJ+uuzvqWuzGJRNLhkSb1L6hKlOX4dL7BlD0PCWpKsDZ7Rwcg
         5AJq6Od7Lw+z3sP4sVYTxRiw8OHsaZggHn9rKKOCsIcIwwIKzdi2U75MJPrvdl4d68LL
         IEu6jR7sN3MtWozG15+UWHXLju8nfcudu5cZpIR+BU3SGjUxhnBIUk92B28uJKKhZ3mK
         6UxnEQhECk2Z/FZC+T6dyOxpGqoNGAsBsbCWuUEB2zI3/15+EdPnc34YsrjfAAJo04cM
         /XQ5QcSiCTxl+buI8hH2jPCFHjo/uW9qMkBXinpyQKC+kCf2BTQubNzsVGyyD0yzZw9X
         Jq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWY2BRFRgUBS0keXNSxA4zb5sxIa9ZpTcY+juw/k//jaYFIfshPm4ig6Qq6g3ZPfy7h/P7niKG47U7HrY/PSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz75Uv3MmvIm+u2v2F/e+tZLJnAhsOefUDGTgabILVGegnz37n/
	PM7bAhqQ/aW8c/b097LErgxefD3fOjksbXd+fOwPaG8hVnm1epiHWIxc6AYsCu2/WmS3+huHnyU
	8e1ix0ZAXKHippb+xwg==
X-Google-Smtp-Source: AGHT+IGfllOsRSovrXNjZ4P8vLQLDZn7m27advgrGNGOThiOpA4iYZmKtTm5wFMwSkiRyWwhbQxA8qGpfZt0JVE=
X-Received: from edp28.prod.google.com ([2002:a05:6402:439c:b0:63b:54ec:172e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:5c9:b0:b04:25ae:6c76 with SMTP id a640c23a62f3a-b6473f3feeamr3050584666b.47.1761298049771;
 Fri, 24 Oct 2025 02:27:29 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:27:28 +0000
In-Reply-To: <877bwkhfrr.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <DDO3G26SIZTK.1KV7Q0PQXHWTA@kernel.org> <CANiq72nUiizxo3YFgxUZ1jiczRNbY2ATao2YUBiCEC7k5hbv6Q@mail.gmail.com>
 <DDO3OMBHS8TB.2LDODR1AFRCU3@kernel.org> <20251022.193230.585171330619599845.fujita.tomonori@gmail.com>
 <vTqqW7yepc41IJ7rUH2GAcWAJ1HHAUQ2_NeQ_os6L5MKNZ-acMHFwH9u3m0oRDumL2YQPnZ6Qu58-iLlAv0Tew==@protonmail.internalid>
 <aPjmKSrETqrchW_e@google.com> <877bwkhfrr.fsf@t14s.mail-host-address-is-not-set>
Message-ID: <aPtGgNajcXKWpji0@google.com>
Subject: Re: [PATCH v2 1/2] rust: add udelay() function
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, dakr@kernel.org, 
	miguel.ojeda.sandonis@gmail.com, daniel.almeida@collabora.com, 
	alex.gaynor@gmail.com, ojeda@kernel.org, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, frederic@kernel.org, 
	gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org, 
	sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="utf-8"

On Fri, Oct 24, 2025 at 10:20:56AM +0200, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
> 
> > On Wed, Oct 22, 2025 at 07:32:30PM +0900, FUJITA Tomonori wrote:
> >> On Tue, 21 Oct 2025 17:20:41 +0200
> >> "Danilo Krummrich" <dakr@kernel.org> wrote:
> >>
> >> > On Tue Oct 21, 2025 at 5:13 PM CEST, Miguel Ojeda wrote:
> >> >> i.e. if they aren't sure what the value is, then I would prefer they
> >> >> clamp it explicitly on the callee side (or we provide an explicitly
> >> >> clamped version if it is a common case, but it seems to me runtime
> >> >> values are already the minority).
> >> >
> >> > Absolutely! Especially given the context udelay() is introduced
> >> > (read_poll_timeout_atomic()), the compile time checked version is what we really
> >> > want.
> >> >
> >> > Maybe we should even defer a runtime checked / clamped version until it is
> >> > actually needed.
> >>
> >> Then perhaps something like this?
> >>
> >> #[inline(always)]
> >> pub fn udelay(delta: Delta) {
> >>     build_assert!(
> >>         delta.as_nanos() >= 0 && delta.as_nanos() <= i64::from(bindings::MAX_UDELAY_MS) * 1_000_000
> >>     );
> >
> > This is a bad idea. Using build_assert! assert for range checks works
> > poorly, as we found for register index bounds checks.
> 
> What was the issue you encountered here?

Basically, the problem is that it's too unreliable. The code does not
build unless the compiler can optimize out the build_error() call.
For range checks, seemingly unrelated code changes turn out to affect
these optimizations and break the code.

To make matters worse, the error message when a build_assert!() fails is
terrible. But even if it wasn't, the optimization issue is enough for me
to say we should not use it for range checks.

There have already been at least two instances where someone wasted a
lot of time and had to ask for help trying to debug a failing
build_assert!() used for bounds checks.

Alice
