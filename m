Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9351BB6A0
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729066941; cv=none; b=XjJoY8CYJDwedNZLBwu1OvVX5omAR4SE1fR9XaHPUiO/KLWKvcP7Bo3WmWYh/2l1vz/2Re/pDcV3jxJE7ZAfXBazB7z3XhyqnFGyvxBt5caSbNMm/97jW8pgpWB4Q8rAqdr5BSR6rM5bc4uiowWC6pD65WSb+9fn3kV4UbJHUXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729066941; c=relaxed/simple;
	bh=K0d18THzbfUB6LwAU1/WojMFGE73LSJivrI3N2f3R8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j12IDov5NoUmnqfzkYuK6MpaVmxSoWViUPuBGlnU/P5UB27cpVg4sCCxQcCZUlhMEx45fHyC17fcml43965r4syyPJZ8SKGmsgYE/mstHTnef7brhD7szJGtpM3mDT/TOocZ8vSjd+6frQcEIHB6JFxoaM90ITUHeGemo1y/qAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gA6Io4dD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gA6Io4dD"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d6756659eso2180785f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 01:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729066938; x=1729671738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0d18THzbfUB6LwAU1/WojMFGE73LSJivrI3N2f3R8Y=;
        b=gA6Io4dDXIGUWESIL+pPZJM9oFaXSBXdm8/QhkTbkaCwt5+xc9zsPcEx8Lifk3+B2g
         SFomvBdmlvN6O/3KCKiH3W/lhWnKlaQyZd0optgGWenOXDPDPWrMab8322yYoHac/2+J
         xsdM3vZQfliWGnW8V3WI3zE3gQq9hT2dxPtbDDDgDcoWJ971Hb+97vND+v1ULIlF0fJt
         8AzDfUG0OP7zv8OhQVZVKoA28Ji3rBCdTETYhShkcTna6vA9TrBEgcJtOQ54ZbCeW5KS
         s7HjJe3Ofxyw896YqbkJVrIeKQR7/kT+YLSY+O1aouJDVnSpnKSre7JnhtjIXQsMqasV
         tZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729066938; x=1729671738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0d18THzbfUB6LwAU1/WojMFGE73LSJivrI3N2f3R8Y=;
        b=hQsqW4It3W0tayFCd12rUE31r6n/6YGJ5Uy6q0w0hr268hWRctKFdRB3SOIopnMZge
         n+Y+4qBFeRhglzpIeZl7rXbPj1GTjFthEGHWHVuwGFTZGZZ8lcOVmelxDGhbxPkfrTmw
         7E/PReUs8O9ZsdZd9p10IQKA1m7NkZ4DxP2Dn3N0Z7qagF5Sl/m5h7fdpnnzhD2Mt4RR
         SJFI0Qxkd11VpmfmTpGhfx59elAvUfY31qh3B5nTqVMZsQB6PmOqn1g42UsIc+/aD7fA
         qySRNuLAEK6+1pLJ08VjEigr/CjPZYP6AP0rFD6nIRHcaxzoYSIkZWJipCO+OFOYkS1q
         Di+g==
X-Forwarded-Encrypted: i=1; AJvYcCVBtx7RkTbZ4hAj3ZroUxR1dCCbf6e1iTucDut7aurQQ5V5dYCp3vFvGCWU3F7nEl3y2Mxte0p+nPEhjipVUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtvCVBuidciJoPoir6b9Sr7R0H2lMahcHHiOzPMeFPn1tLvvQ0
	Bgxu6G+4tcXJCEKnLEVReyfAbhwZdr+o4c0t87ljvcNLVLB1O5s6V80lvtj2jdSpPB9scAcjhsZ
	rNjnJ+AN2rOuG0z/XcMaCm6wV4SKs9Hddu3P8
X-Google-Smtp-Source: AGHT+IE7/jkWnCvaXDH4bpwieZj+PapXKebg3i0C/PdKAq14Yf4znUUh+mfI0Es0gbzWdaKd9zJxMPPQltY4iL4gTLY=
X-Received: by 2002:adf:e64b:0:b0:37d:5274:7878 with SMTP id
 ffacd0b85a97d-37d5ff6ce4amr9292585f8f.38.1729066937877; Wed, 16 Oct 2024
 01:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016035214.2229-1-fujita.tomonori@gmail.com> <20241016035214.2229-2-fujita.tomonori@gmail.com>
In-Reply-To: <20241016035214.2229-2-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Oct 2024 10:22:06 +0200
Message-ID: <CAH5fLgiz51z-9oqSM9vOAKUDTireJnRsvQkqh=1hOuBi4M9wxA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/8] rust: time: Add PartialEq/Eq/PartialOrd/Ord
 trait to Ktime
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, anna-maria@linutronix.de, 
	frederic@kernel.org, tglx@linutronix.de, arnd@arndb.de, jstultz@google.com, 
	sboyd@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 5:53=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add PartialEq/Eq/PartialOrd/Ord trait to Ktime so two Ktime instances
> can be compared to determine whether a timeout is met or not.
>
> Use the derive implements; we directly touch C's ktime_t rather than
> using the C's accessors because more efficient and we already do in
> the existing code (Ktime::sub).
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
