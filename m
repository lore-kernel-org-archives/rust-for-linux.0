Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD731C6BE
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 07:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753601187; cv=none; b=nCmH6hW6/9WirWciu24zYMoUOaUFm62mUPmR49mTtxcdl/43sb+oOzkpJGyRzBmIEdSnfffFd2WkhHmk6Deic+W+5A0ySY4FbrmJZbKxBW/7CIW3Smv1NwIHNy0s0eIRbQFZf7FFG77vrFvSAytjZqqTN55gDH7ApfsYCtqDD0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753601187; c=relaxed/simple;
	bh=v4EvxtM0FlPFPooOxZDpq23OAktK0/hYmSISabSOzfw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tianDCFbon1EtRrwjVBweFqQWhgHVZd9U2q4nyD1gcTVxhMKGDJsEWwfaAkZN8vDpn2MIKr2ScJ10UtC1EjQEc6ocVw8+5VPmPbLKmZrwFDlIX1llu35Yw33nkfzvu2Lv9Ip3t/ZjY8Fdv98sdqnThuZGqZTlT/uurCCRcV9Ljw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v9KM0xjO; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v9KM0xjO"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-455e9e09afeso12894705e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 00:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753601184; x=1754205984; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYA/mlpFhoAgLlyJyI/zaVuKxTjKNQCnG5bY4qRayaw=;
        b=v9KM0xjOdGQKotiWzt1VI09E/ObN88Zv42BCzv1zKOWeGaaTD6QKX6W+81uFF65flT
         jkBUxXA4zMcD++He8lZT98wsvCh6ao/aC91yExfqEgyUvYhIhVA7hs2vNDH9Dvkyb+8w
         EGtO5VREit268K1xE60UdpE5zq3+yP31uwza6jJ1I5pmUaM9T9CY6Pm2/PHZ2XDzhfes
         sav7GtgyD9Uoq2l2YBspat1m2VbgT+VuBY0kXjYixW8cIAoEJS9ukqJiOtp/14upflZX
         nEmgF93gSKlrLxA11EV4dogI4zMGaQI600qcjIwQTM8UH2/MPJM5riW0yzyJH1rnI9HH
         TTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753601184; x=1754205984;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fYA/mlpFhoAgLlyJyI/zaVuKxTjKNQCnG5bY4qRayaw=;
        b=dDTjc8B5wCt2NyaMNheDkS9NUDC6B9xuaQBjcRbuaRuLTi4uT0tkzC2tagLo2utMrR
         u+mLZw+65zkDQx6n7IC+4rN1SRZR+93rV/G4lmgLit5qx2IezJhMXNac3TUt0wPmM64Q
         HQDgZippdwR7FmIV6cV3Cxj6NoQ8iuYJUkGM6XqVSO7CsXqS53zyIPcwlUnkb/eHlMtH
         vTIOyHX4+VTgOCy+M+llFauHPPFaa8Q17DAP4L5kTgo6souU6aPOgoGr5biIXPFUSk3k
         iqFXeDYoCs4s0X6yFgKG481tCe1qTEytyvTjenA/OCBzvsliC3s24oCPx+uxnNhSF/6m
         Nk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVK5UN+w5VZCzcz/2V71x9EWNYwxwy244OHFrijT9nXQWfv5tY6UREJxVLJRI5baxnwSJnCR+1k9Gb86tB83Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuZG7I3kPrhpkyIU6yX3eGZvNkmhS0l2270b3Ny3XiZRa38DTa
	G7rDoBBgkVZX+1T+NoPM0JzLb5BTWfvXKG9s9qfRVah/tIcWokIzV9NxdgdRg5tk+T/tY4XDKy9
	mlxypCnomKqJB4HabUA==
X-Google-Smtp-Source: AGHT+IGkYbuVyCL9njlWBZBiIImJLuzgaag2wlEsUvwO2eSkQ2Id7Xy+y9MUoDW0BCgjl1nDrU7dNyNFqFVxZWw=
X-Received: from wmop12.prod.google.com ([2002:a05:600c:468c:b0:456:eb9:5220])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3510:b0:456:2698:d4d9 with SMTP id 5b1f17b1804b1-458762fd2acmr64164575e9.3.1753601183814;
 Sun, 27 Jul 2025 00:26:23 -0700 (PDT)
Date: Sun, 27 Jul 2025 07:26:22 +0000
In-Reply-To: <DBKQP426YEFZ.3EBGU020XKF3M@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250724185700.557505-1-lyude@redhat.com> <20250724185700.557505-3-lyude@redhat.com>
 <DBKQP426YEFZ.3EBGU020XKF3M@nvidia.com>
Message-ID: <aIXUnsZao-7Xs5XM@google.com>
Subject: Re: [PATCH 2/2] rust: time: Implement basic arithmetic operations for Delta
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 25, 2025 at 10:20:08AM +0900, Alexandre Courbot wrote:
> On Fri Jul 25, 2025 at 3:54 AM JST, Lyude Paul wrote:
> > While rvkms is only going to be using a few of these, since Deltas are
> > basically the same as i64 it's easy enough to just implement all of the
> > basic arithmetic operations for Delta types.
> >
> > Note that for division and remainders, we currently limit these operations
> > to CONFIG_64BIT as u64 / u64 and u64 % u64 is not supported on all 32 bit
> > platforms natively. The correct solution we want to aim for here in the
> > future is to use the kernel's math library for performing these operations
> > so they're emulated on 32 bit platforms.
> >
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  rust/kernel/time.rs | 86 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >
> > diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> > index ac5cab62070c6..8ece5a5d5a11b 100644
> > --- a/rust/kernel/time.rs
> > +++ b/rust/kernel/time.rs
> > @@ -251,6 +251,92 @@ pub struct Delta {
> >      nanos: i64,
> >  }
> >  
> > +impl ops::Add for Delta {
> > +    type Output = Self;
> > +
> > +    fn add(self, rhs: Self) -> Self {
> > +        Self {
> > +            nanos: self.nanos + rhs.nanos,
> 
> Should we use saturating ops here as well?

I'm not so sure ... I think it is useful for + to have the same meaning
always, and that meaning is "addition where overflow is a bug".

Alice
