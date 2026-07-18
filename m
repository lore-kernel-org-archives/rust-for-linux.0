Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AF12701C4
	for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 03:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784343714; cv=none; b=eu13VlIX7Fl84cQnjXlPLZUyXBywYK/LBgOu7eRRiua8Myi70gQ8992BFmFzBlK3AJdr+RVAL3VIiro4q3ucXFqMuNeEz0rjUSxbJwP4NFNFOyfM4Pfsqg5M3649cZFu4JLPVPV1fh+AUmMF8QA525pw3UYRNGi65aIyd9cE6G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784343714; c=relaxed/simple;
	bh=72VpdzycToFx5jYXpTxGZ7WwbQARvNnQ0l5lLRfOF/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JibWfbbY+hiQQksttjgBw03BVtaBq1dUiQiM+OHF9yKSB4RPqZ+pTHcK07zR3LUtf4UIp7VizaE1dG8igtb+XlCDdVZQM48P40T5dhdVudbfbAu2bRV2yeD7+lpRWerq1m6ZuFUEXuygMH0La2H/COatNz4U/QhSFEPGfq1IzTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5mWB3i4; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5mWB3i4"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caed617615so95683775ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 20:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784343712; x=1784948512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=72VpdzycToFx5jYXpTxGZ7WwbQARvNnQ0l5lLRfOF/s=;
        b=L5mWB3i4qi4xkobO7fZowrtwOMgXzsK3LE0E5vnqPFBD0H8dGWAYfZQC9+L4Jk6J3a
         Ra3ZTMBO12W9loiu7OIkSoVGwY6p41OJHOYkWSx2NEvIgW+2azJABGPfjS+vreHebJaN
         owL9eYmBbJwiHlicyWVx15tgoA6EYQ9NNNoVLlmgSz60aU+m8FlBq9SYvrIIN5niluDV
         uJgEaqohd2NY8Od9QWYxyIfnriFFt89HTtWmdIbSXLAqHqOC5aB5nnUX7XdBlypr9yJh
         9oEbCy5gW/KsVohLSUJLXcbda/brHRMz4qOOHt30elP/nHESzqvpzgZH5ja0Hq3xY+OX
         /Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784343712; x=1784948512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=72VpdzycToFx5jYXpTxGZ7WwbQARvNnQ0l5lLRfOF/s=;
        b=fTnhavylvMxSs5uuARpwcXblBUvL4Yb48vZ8Alfz0uNiJt8RaZ1lRSXF2sWbZw4tfB
         jmYhh5kDGzFQj2u2vUwUKX7pLvAPu8HRbmUfGwW9FkjDhYhqUs3r5YEfOFNoEfMyzCX8
         8a/bk/2JVY2acHoPuSON8D9oWmpPQCvQ24p45A46hn1HaFvI9K8oXXWlaGknSMMkhiAS
         /DEiHWD8cQ00kvxrQE1iKzMIkU+xrcbnirCL9MouVhVTpYbg1QCb+KZExVObNYn13OE2
         2yr0/GprEXYjEJEz79/bvPV9p3qPMUrAc5rSwzfEVJdtWH3MyPn1RaLpQNotpCTtBC2c
         dXuA==
X-Gm-Message-State: AOJu0YxNGN+0RdMCv7IhjugO4zAJWigK8lUoBgueaih1YhA4RinfOEpF
	x5fT6rghMAWfAIGX8V63nrt2+xfYenzRLcBSwg3NcKP5FsBVbNG8EZJPkrKnhD485io=
X-Gm-Gg: AfdE7cmawJw8UhTSE81WkNbMABgITf5laTYIfjYemfWLo/mOaM6n4JtzqSlcJskLisc
	ElyZXP4Yj7izia3Xet+NFdZ+lIdHJgDfvb6wBRkMGhl/yRJ56X4NfdZjSo3mQFiD3Vcttb0CbOE
	ZxbyyTqt7Pq4hwrN+D9zgUrnSDhYKZPm8nLFpi3f4rD43X0631ooV1VtEAEXR0v7ZgnXnogruHO
	lM9pT1kzmxkCKb7SLVhKiIFdy+q4Vu2e4038tAJVYV9leBn5XieGm35tVRODqRGn1mVLHdjDBe9
	6FKvrqOTCnL7GFD6alokiWjZOC/apqUFD8BuwHziMcB5Bd8+wIo3vRL+Ht8poEx1687rCsqQOWI
	ec7ew0NyLvsiNPSBrdeudDd7WRcY82Hga4mRQFt1NaRa2y35IUAeJIKuJuq77oa21kBNeGmH6az
	WU7fgHS09Kf2JW2axrZ4lHJyKA0hsxJKotBs6fhBwI4TvBvmQEP0vbqZVGwV3pi5G5/wvbS2z+e
	boXFWSU42bB1QhdZrvacrAT0oaACweSyGcJHC9Eg6MhHUP0VV9Bb/PfDWSzY2BtfjXiidQCd7YZ
	qEPjs0iGf3mizEzCyMlKBF97H63G1mA3djQVLdd4OrR8WEq6Lh5DrJYF6R3QnAFS2xeaJnpRRVD
	ugw==
X-Received: by 2002:a17:902:c950:b0:2c9:d8c6:1dc3 with SMTP id d9443c01a7336-2cf3463299dmr56325425ad.0.1784343712078;
        Fri, 17 Jul 2026 20:01:52 -0700 (PDT)
Received: from ip-172-31-21-198.us-west-2.compute.internal (ec2-54-213-160-35.us-west-2.compute.amazonaws.com. [54.213.160.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3474100fsm20456615ad.66.2026.07.17.20.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 20:01:51 -0700 (PDT)
From: Bruce Robertson <brucer42@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sre@kernel.org,
	ojeda@kernel.org,
	igor.korotin@linux.dev,
	gary@garyguo.net,
	tamird@kernel.org,
	boqun@kernel.org
Subject: Re: [RFC PATCH 2/3] rust: power_supply: add power supply class abstraction
Date: Sat, 18 Jul 2026 03:00:58 +0000
Message-ID: <20260718030058.1677-1-brucer42@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ak9kAP1SZF8AchQT@google.com>
References: <ak9kAP1SZF8AchQT@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Jul 09, 2026 at 09:04:00 +0000, Alice Ryhl wrote:
> > +/// Register a power supply backed by driver `T` against `dev`.
> > +pub fn register<T: Driver + 'static>(dev: &Device) -> Result<Registration> {
>
> Should this be &Device<Bound>?

Yes, it should. That also lines up with Danilo's comment on the i2c
side of this series that I/O-capable operations need at least the
Bound device context. Will fix in v2.

Taking &Device<Bound> also helps with a lifetime problem the cover
letter flagged: the trampoline currently recovers the driver's private
data via device drvdata, which the i2c core only sets after probe()
returns, while power_supply_register() exposes sysfs before that. For
v2 I plan to pass the driver data through power_supply_config::drv_data
at registration time instead, so the callback never depends on drvdata
ordering, and to add a Sync bound on Driver since get_property() can be
called concurrently.

> This looks like it should be a ::new() method on Registration instead?
>
> I would compare with existing Registration abstractions and mirror how
> they do it.

Agreed. I'll rework it as Registration::new(dev: &Device<Bound>, ...)
in v2, following the existing Registration patterns in the tree, and
look at tying the descriptor lifetime to devres while I'm there rather
than relying on Drop ordering alone.

Thanks for the review.

Apologies for slow response. Was wilderness camping.

Bruce
