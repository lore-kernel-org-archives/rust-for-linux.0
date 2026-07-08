Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209AC2F8E90
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506997; cv=pass; b=i5csqw+CvSMRJQcTkS8Z3KBOtOTA1swwBbIzrsqs4eLhQ6Qxi0M3m3e+FtwKv3PffhPb0hfZeTHK/3Ks3IZNUtlwMieCJh49OMfEglrcawOrYHadQ2ZCZawW8PdyuFN8vzoec30MYqcSxodAPiGjV03XQw0StJR2FlBUrN6/VoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506997; c=relaxed/simple;
	bh=QzqSzBmO2/LNWpe9fGm4KLVQueTZtd5Ku7sSD56PRhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pk2Ai61nc37YoNTENSX2mt5cx1zA6nUF/kR9fYNClS/x6kMSjuhZOvyHlgRmShFnGhzhHCXzUWK0fswJ4DSHlKcbHqYYJJlRMMdk/0koFfGWxXmpiQBuy1CbEJDjD6u6cUoqS7g8xZicnMbniSHfXEpPAI/nrL2ZFf7bZPCVuGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0TRToUq; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0TRToUq"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37f9e2642deso63173a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 03:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783506985; cv=none;
        d=google.com; s=arc-20260327;
        b=m0GKF8vl2Tw4JlEV4USe1Cpee6pi1BKHrscmC1NYhTKJQAmuXe1KnMCcgHRK6kbYJE
         Nz9fq84s2X+o1AEHCxp7AanUxljXHAujCwhqPGiOyfEWiQvj/W5CBj5mlvYan5JhsRiw
         3m5LfMxYvru8f2pJDYmNZVvHNG+v1QpGjQrpVfavVhFc40D53uFHFVdXDvGdtK8rLJ5s
         bzgQ2OMHSPb5BJL5ZYjac47VDEUOdrgFbbKOLw0+kytYUH+R2/VTZ3GdEDaB3mfoiXh3
         ahrXzqVpGA7U9rP1CpG0D9NSFScn09jbVTffqr1UP9G2AKMkVVMLgAbOgrgXrVqP9dVc
         /CKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QzqSzBmO2/LNWpe9fGm4KLVQueTZtd5Ku7sSD56PRhc=;
        fh=32c5OaRukZw/GoDWjexHrVAN7/9Mt5AMOZe+VV9ziZU=;
        b=klkXGY8RXWxEaxOSYsko1KNZJwB+VPYVSmaOtblQezm6agbPItT2eZMLikLffVksDr
         EoqWqfjiHC+v7ounhmVrBrFzEvNtd4BDb6FkwF0Va4FEZ1+J5CVNV9prfUPOB3ioB/J7
         Cpnf/lZ73+IEvMorY4dc3sFogTpYf6z1eBQr5iaV19MOe/ls46bbwE14qp63x/oghGIB
         a8tdU+4cZQCc+no5fgkyqjaxa/2G79TLI4KRYbAhoyMv5XEtlu0qxDJT77nWwucOLZ7J
         2QzKApAvIssoGt6BrSkvtov6+vy4Y0Rx8wk7FIO3OVQPoVu//90sDVF5PkXqODtstEKa
         rXHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506985; x=1784111785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QzqSzBmO2/LNWpe9fGm4KLVQueTZtd5Ku7sSD56PRhc=;
        b=D0TRToUqYN3Rdph001VmDw3gvRgj4X6J3yFtQ2Oldbtl3B7Y/MtUitwTij3J3KAEzu
         Pu5nb4rvkARj9WfzxX38LoWFQd/1rhiXARKq9+hIQw8kraeuSljD2QLKJ7sfzFDrOQbv
         bH1ZVkZRIqj1Ql7A7wGyUFVVXCDZ4dLAr8RLW2T1UCirRY/G3zY5KqM3d9xhYJXmoeon
         Nd44xV55fO7l/kdu7Edq3EGoaq/lcH6VOe4IRyF0y7ujHpWErTwTB+oejnQZiAmiMjn7
         Cg8G/luw0IaJg1EFDC2EYuFTo/NNd2CT7nbVkiCncvBPB/j+VhJUz5V7OBouMjLaaJ1O
         TuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506985; x=1784111785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzqSzBmO2/LNWpe9fGm4KLVQueTZtd5Ku7sSD56PRhc=;
        b=K5MZbDKJ435ZlOt55wuGPQGFLpG+l1fB9KUSjBtV/PuYgTWESuzGtgXieRYr9m+9cw
         KEe1wq2jaMEDCt42mJ2UJyAgcPbrai1PLhAFo+RBNd//GMyJu+9MN98jnGy4RyPD5cBw
         qasTs0ZZR/BRTHkpB1sQTeIlBgYxbCcytUXQWCSM9MWrZ7iSf78YvW8SZGZUuF1auGwN
         Z8XLHoUN1Z0opEbYiOl2tAgWXtO0pAvDLoH0AaceerWjoTJM70V7wv/sDbRFR7f4NFew
         QyGt91WYmRON5iR5fVIkcqqOm7x2+TUa3Zo0WHJqzUBA7FYfmhjOKanrYs7PwpadHLDe
         u5bw==
X-Forwarded-Encrypted: i=1; AHgh+Roy0+4ZNHOAscvG0jXBdIiYwQCuD7xti7C2MwOcZaFLF9/edx5J9y9aPwOw6SdvoBQGc7if0LbATCFneEsiAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9s9Rw1Nemh9Nf6MXhPlirN3twWGNnS1fR51lpa3jO8r3nDw3Q
	SQgeGyM/i8Z2+N5uLSwahnffWh19dd9b/0+iBtsLxHpL5C77YXJl4HXGx4T/aN0Nm5vpYVlk3+O
	aWxB7UcA70B33BzYRrIt3ZT1ThnXX/mjmwYCO
X-Gm-Gg: AfdE7cnVLO4H8ciRU4prmoGrUmAa/QXhePShiWJay8usyIUSLhCf60fr3cR8lObfyh7
	r5E6+BE9ojS6rpxXYP3XcKlEV5cldErFyqa2p/0cj8oDyfR9XQeZRKy/CbYN2gckVNN0x+ezb2J
	j1gOBr+tP/jb2B5AOcBQXUSB2FhitFm476ULb9pEhidvt18oOcXRoeRq0VDeBvaKajmqHIy5Ue9
	mF1syHKJSute5ck3/HtHma+rNjqwOW0sYV13JNmFjjZmg34vuMW/PlGBht0tfpRIEGFiPZvxFE3
	EhOZl6YrVnebjnKiZDUfh9iZlW2D/rkiNW2qFOcNBDp69mmvG2Q3tStSBBh1gihKqJM21Qnp8Fh
	BkJaZMG4JUgjS
X-Received: by 2002:a17:90b:3fcb:b0:37f:fc3a:382d with SMTP id
 98e67ed59e1d1-38941fb2d0amr1770186a91.6.1783506985239; Wed, 08 Jul 2026
 03:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707151542.91997-1-muchamadcoirulanwar@gmail.com>
In-Reply-To: <20260707151542.91997-1-muchamadcoirulanwar@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 12:36:12 +0200
X-Gm-Features: AVVi8CejjCB0cQnGD60nSceTy3aexNzKn6liFV-neeZ4M32IR5vUutS1Lqo1P0k
Message-ID: <CANiq72kQ0=MqAhrSSk3m5RNVrO+4Cv18xv1noTE1Y8TsPeRhDA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/3] iio: position: add Rust driver for ams AS5600
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, ojeda@kernel.org, 
	dakr@kernel.org, igor.korotin@linux.dev, branstj@gmail.com, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 5:17=E2=80=AFPM Muchamad Coirul Anwar
<muchamadcoirulanwar@gmail.com> wrote:
>
> This is v4 of the Rust driver for the ams AS5600 12-bit magnetic rotary
> position sensor. v3 hardened the IIO abstraction layer and introduced
> kernel synchronisation primitives. This revision simplifies the driver
> substantially based on review feedback, removes components that were
> over-engineered for a single-bus 12-bit sensor, and validates the result
> with comprehensive hardware testing.

Please Cc rust-for-linux as well for patch series that contain Rust -- than=
ks!

Cheers,
Miguel
