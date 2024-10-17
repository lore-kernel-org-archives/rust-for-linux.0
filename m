Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514E41D8DF6
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157606; cv=none; b=jJu1NA54KeQX15PrlwiPh43srQS8aweodyGwFRCN26JzWHhYqAwQyOdrzfx8JOwMsZkgifCF1L/4awyWvJyvCqfuR8B4i0Wd3Yp2cSaad4CfCuRX8Wk4bed2Q9e3gPrWp4xY3vztY/GXtuE3h0YuqP0qQqvDbSRYv4RRsctPQj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157606; c=relaxed/simple;
	bh=eAO4OpzJK+ZqOZ8YhgV52/JYGCtHP8kWPtUgBTS6oeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/qnOthfv7p5y71JDVw3PKRXucq2G38uPdipuWPeRKR/gHaKylfh1KFLdTifY7Enw6jKfs9nyE0jgZWUvDR1dWWfSGAUIEJwFzcm+LdzAxClgXNhepsS9Bbami82uelHJUV77lesC+wlemUhMgsoi4ArB4zmp0nb17IxPVINgl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e/m8G4ny; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e/m8G4ny"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso7197825e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729157601; x=1729762401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aCF8qbJBg1Dps0D/CUhTqVXgsROfsWWZhphpElZXnQ=;
        b=e/m8G4nyU4TsNR1qulWewsFaJGWpMoB7aH5atbHjthLH6OlnpVqp3NmhvMeJXMEJGQ
         plPTfTX70h6xxcla4GqpiVZ4A8vI6xwHyON3ilDPSvDdqs0V8DeV+7v+nkExsJKFkfyc
         e9t91EXQM0ksoEof04C0IVXmAEwLXbO9fVDNP1CTvAxdTrTwbCkM/cSUgLZkyBFcrm8/
         hh6kT9kpeW5VMgi/c1E1bxz32yi4nVhaHfAbGlI2cPHMuq76vPjggBRfxnyjV+pL1z7e
         84kI1NKpxmle4e/m9FmjjcqYqxQsoH+Y040iM7v7SI4sFcvoy1jaOieU0NaK298H9tus
         kN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729157601; x=1729762401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3aCF8qbJBg1Dps0D/CUhTqVXgsROfsWWZhphpElZXnQ=;
        b=BklT0XZ8UCx01vPaS4S2d9c9wNpKAqIGzFD/tg5rdPN7knVB8qa2HLh70GfJzo12SG
         q36Eb1sgc0Yp3++CM8pBXqG6xYBoII54pTne+YkZ/ShZbIfFNQJ3DO6mkXHv15SFFXQJ
         X35YrdEjEFX4lTbXsE6HOhRqdOhypymStqpSOgv3K8udakGMg5qMvOZ7jp6VQPzBVA/s
         wxWZU1tKt0m0yKkYfg5QdmDH0jHwMWhj8bsfmR1OBEACntNbsbVo9WN45+EPssdA/skB
         4ACALjmKCSbQRFSZf3osGUosBX8ZjZ0Y3ta+DC9w7c5boxNXQfmvKCjgJJ608ijWRcVV
         7pZA==
X-Forwarded-Encrypted: i=1; AJvYcCUw7GLOneGFDQEbcJtcCsHCfT4ZIX9RQcr8h0uxxw/Qxoz6eWAboLjKKpEgsDMvM0DkhRFy/T/8h5O8uMr15w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt2U0FzvmsBTtrbWVrnRCPZ4fFhIHhmdFAoWWIhamnoOZQlA0C
	GtuRbpX3FuBBYS7njO0FPBJB3VRhk01tWlxhYObEvIdoiHsJ9BbDL3ADFnWzwrKCzLF/jzf5HQB
	CXvOmriLxDqh4wgNtpTGQPJMa2D7w7/XHlqjf
X-Google-Smtp-Source: AGHT+IGrjgb4tg9+baFKcG84sjc0/H/bT6AHZ0SjBlystoLYnCAsWx0ASGEVpLgSEq/buwud93hxrF4rLN4G3ObBMe4=
X-Received: by 2002:adf:f9c8:0:b0:37d:415c:f27c with SMTP id
 ffacd0b85a97d-37d5ffb9969mr11235445f8f.38.1729157601306; Thu, 17 Oct 2024
 02:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016035214.2229-1-fujita.tomonori@gmail.com>
 <20241016035214.2229-5-fujita.tomonori@gmail.com> <ZxAZ36EUKapnp-Fk@Boquns-Mac-mini.local>
 <20241017.183141.1257175603297746364.fujita.tomonori@gmail.com>
In-Reply-To: <20241017.183141.1257175603297746364.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 17 Oct 2024 11:33:09 +0200
Message-ID: <CAH5fLgjHf3Z5HHOLnzZkk-Q5MOwz_57LQc6scr9yDy1j89HSCw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/8] rust: time: Implement addition of Ktime
 and Delta
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com, 
	tmgross@umich.edu, ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	anna-maria@linutronix.de, frederic@kernel.org, tglx@linutronix.de, 
	arnd@arndb.de, jstultz@google.com, sboyd@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 11:31=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Wed, 16 Oct 2024 12:54:07 -0700
> Boqun Feng <boqun.feng@gmail.com> wrote:
>
> >> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> >> index 8c00854db58c..9b0537b63cf7 100644
> >> --- a/rust/kernel/time.rs
> >> +++ b/rust/kernel/time.rs
> >> @@ -155,3 +155,14 @@ pub fn as_secs(self) -> i64 {
> >>          self.nanos / NSEC_PER_SEC
> >>      }
> >>  }
> >> +
> >> +impl core::ops::Add<Delta> for Ktime {
> >> +    type Output =3D Ktime;
> >> +
> >> +    #[inline]
> >> +    fn add(self, delta: Delta) -> Ktime {
> >> +        Ktime {
> >> +            inner: self.inner + delta.as_nanos(),
> >
> > What if overflow happens in this addition? Is the expectation that user
> > should avoid overflows?
>
> Yes, I'll add a comment.
>
> > I asked because we have ktime_add_safe() which saturate at
> > KTIME_SEC_MAX.
>
> We could add the Rust version of add_safe method. But looks like
> ktime_add_safe() is used by only some core systems so we don't need to
> add it now?

I think it makes sense to follow the standard Rust addition
conventions here. Rust normally treats + as addition that BUGs on
overflow (with the appropriate configs set), and then there's a
saturating_add function for when you want it to saturate.

Alice
