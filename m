Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F0E2AE78
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 04:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773636559; cv=pass; b=puDpbBAS0FgdXwrFVFpysktC81J2Ao6TvHZs14TECDnnBLL4RLzXhmugMhURWdsri2ImCr+Dsy0A5VYndU7OPLMdjPVkNGVWQfeqM/AjQP+6G0yJ4XVONCT/PaYPQX73BeUUdXjFTAIfRZ+ofXQP9nSrYjj7rcrjYcdqMoNvG/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773636559; c=relaxed/simple;
	bh=2EGPGYJeFqAsw8j4F6t9zjYLmgzKpIJWNtykYTrdbss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cweT0ZkW9GsVZ8/7LOIZQ2fO7Um0n3omLfdSVzAe6Giv14OD5vhbyuO4sgkNqKoQ25FIhQN3HpfMUkaG4YuOWZi8Ruzc+hdQ8uvJA0JaQcXJkpYaekwTTB+tRaEBIJKM64+Be/EyUn5Gl5vmwA+zlFsG9+B7Qr50WkaOSErGp6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1I9mCRz; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1I9mCRz"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c0c9994199so13602eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 21:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773636557; cv=none;
        d=google.com; s=arc-20240605;
        b=LfFQA7xCn6eaDGczmersGPRuxMes312G2GChA6kWgbA9jpF8yLR9Dp2/Z7GDgCerdn
         MweS+BBaUZzVesxefzth8YTCvhwU4JiElVDS+zTG1x76zUQgVFJIf6p5SLbf8cM6aoCE
         nsTTCtMzPlVaiwFcZRFghTRP2qzbi6ooknG4w/9MS7hKOvjUyY1b8Faug2k9vXDb0LPU
         l4dFJ+w0Ipm1UFzZXBlUJLXcwgegMuRx8RRi2P+rEt2a/0MJhx3Mn1Xs3AiLXfc+hJFj
         J/jcpn7YI12UbU2bN0groumxpeoc2B4A681lASvJa2MtjGTf7ykkjv5kunFbHQWh5rIO
         tiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ItM5s3kACGOPjpgdmLv+DofJwL0CaMeYOqjFvsZD1Lc=;
        fh=Kwo45Sr2OD1FqAe7hq9G8rWRpsE/IYm5tHRLJN/8BI0=;
        b=VYyDbi3HNIDJBY8ORkC2PeQeQygY9S3N8WzMWUmzr4dBqyKmvyik5gI7ijabgdUjRz
         s42nM1XGK0LugeMiH6p6P0xKEYqjuC3EZiXmwHSoeXIVsREYHjzE8ldHxgAOFbCikpZf
         J4508IrW2r0W/yu3bKCdrhMP3rvqAMnJV6WNTlBseLqrgL2S/VzjdznGpVJm4jD/VmNA
         gXAgivPj5tGexS1fzU+U3L1pCizrfuNlGzRE55G3QN8K+TRzFy9rURdlh5wA4bEOGNK4
         FO7dbw3jDj8yyBpiFB+PfgMYwGg7fT3GRoMG2rPXV2Uvzkrkn28+sNqa9YeBpT68YHFj
         b2yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773636557; x=1774241357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItM5s3kACGOPjpgdmLv+DofJwL0CaMeYOqjFvsZD1Lc=;
        b=G1I9mCRzAnWp1jFVkO5PjBpZnEjxI2RBviRlTqEQLX4GCtxWNjN39q5Ql1jqukIgvn
         4GJsgx7bD4Hhm2qx5ks9z3f/huzl6RnkL6ezHxQQDpw6pf4YuVacUAtmKsGkmqAHYenr
         1eIC5JELM4jaZr3H5xREiXePIHYssRrdZ7kawnjVq+M1dLIYccmrRPgap4ZzgBaAVF0f
         j4Rx3CGd/NjZV1k9pptJ3Ev9Kuba5GoebstRGVTd3/1l/mG/Oydf+Fv77SEA82fU1Wud
         Auwr70oVbvSPmjBX88BiOC0z8Nncq1HMd0TS74q9jpww7HTXT+asW3gz9rtaFLRxYEKZ
         BuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773636557; x=1774241357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ItM5s3kACGOPjpgdmLv+DofJwL0CaMeYOqjFvsZD1Lc=;
        b=LbxsDujoyFyo7XaGIhflfQdp2yFodmcdiHq83FqjCfurF9AGfzHbuxsTgXQDx+vmON
         xikF3c9V11NbRHWexUIcFhtpBfGAgegFot45AyGEXUj69ZXGkZH+P9/Luv5cagVCw5AD
         d55jUaFPHDJg19VymiBDwxdxoeSPnNJV9wj6JgGtdbVyWTGdUIFYTi5viWpA8fSjdjdU
         n/dGfYumrTfnPv/xQEdHz+w65B8S4qWg9GvaUHInggAasJLxLhus4wb9dATP+lhC0ZWy
         icPq94VxBfklap/yS6ca38ograpGxeGGhlFn7nSqoXpOmE5BmlmP0LMAY/dpsLB9giN7
         +bLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT+bBxlOaAts1+q8NjrwYY+YN9wRhQx6IX0sV37tIJx+Ho2h4xJ3Kj9px1otl4qG7OSOrnHozfrmrPgsafWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXMmYd2hL2EJq+traVEI9HzvFQVWS8A0j7GQKDE7n0OqKVbl1a
	0TBR6QLSoMiOz78KB45WgP9dnTQM9eR7bnGAIn32PlmlF6SDX/rxfLx7LMlrafTMa193i48QxE4
	CxXPJtakWpXKCqLPs82qLOSh+9VCPfok=
X-Gm-Gg: ATEYQzwUZVQj58/hks5Vkxq5Ftby5S3HmG5ZeqfhBhwRqTGb18Bw7h2U777mna0ReHt
	NCvrfNO2IayJNUtU1pvXEjdO8ZzRhL+SJ3olCDZumz5ST3q+EWJaRJiHtW7QE77s1hS3C9TtktW
	eZplg7pQJ6Et9barULHaWrPhA4fAbi6ju4YYUlGbt9bfwawim/hh2c/zCw7VPrmaLfUKxScpMXk
	ZDdz0wrbUNbRfc4rxm5uDa523Czj5yDLZgR2CUc6OuVSRRYkifjQ/EmE53Ne8+VjV42HbFG0wqs
	YpuuArJe3vyFkk7X0w6QxTIv3eouk/VyolBdSyW/A5q65MrND6YfY+OlDJgyj7mmRoErRrsZOtu
	6o2abvNmfF5BNhXTHo244YII=
X-Received: by 2002:a05:7301:9bcb:b0:2ba:7d5a:a816 with SMTP id
 5a478bee46e88-2bea553847emr2790472eec.4.1773636557208; Sun, 15 Mar 2026
 21:49:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mWdFU11GcCZRchzhy0Gi1QZShvZtyRkHV2O+WA2uTdVQ@mail.gmail.com>
 <20260307170929.153892-1-ojeda@kernel.org> <CANiq72=drAtf3y_DZ-2o4jb6Az9J3Yj4QYwWnbRui4sm4AJD3Q@mail.gmail.com>
 <abdJE4BsrzGDTVZT@sirena.co.uk>
In-Reply-To: <abdJE4BsrzGDTVZT@sirena.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Mar 2026 05:49:02 +0100
X-Gm-Features: AaiRm53tL8XU6UHYFssRJKAAu-83HnX_0LD9DK3qSvFTjE4_i0y7A7lmu4Wc588
Message-ID: <CANiq72nXMbP2ZbyNE6voWXrEXg85s99pXLj5LeybZry4eAyzEQ@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: kbuild: support global per-version flags
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, gary@garyguo.net, 
	jhubbard@nvidia.com, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	lossin@kernel.org, rafael@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, viresh.kumar@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 1:04=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> At the minute whatever linux-next runs is whatever Debian stable has!

Great, that would mean we are effectively keeping the minimum one
clean, which is in a way the best we can do (apart from the maximum)
if we don't try to keep every single version clean between them.

It is also what we have asked patch submitters to do so far, i.e. to
keep things clean for both the minimum and the maximum:

  https://rust-for-linux.com/contributing#submit-checklist-addendum

Thanks for confirming!

Cheers,
Miguel
