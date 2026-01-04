Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDA3299AAA
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 12:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767528888; cv=none; b=W88w6a5GqUdQQCnsmJ+li0v+fSez1y4J8/E+5grvZkNP6Gp0Swq29C3e/mBtWHEXAXNg71Zyn/bycPy6YK4D+i4nlfmIu+c+d/AGp8SkpJsCHmrQngSlRrheoPyS6IsK/dkjCb7BWYnBf3iDAlrZYRI5pvwbr/gteS+0MHG/sKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767528888; c=relaxed/simple;
	bh=EfWjvBvMbD7spHmyhUr2e/VZGcwAkWz6GvaM6wUmsLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4YN0Mq/256QKIA2nF5Q2rdpvhjByzVKyLcTH5hl4uboQnP826Y0MlCYjl/WBNYrIT81rQVxc6PpzIJg4U1XTSXssG7hi8d+ytNio/xIX1cRAP+jaMHzvIeJmMtPJ2ivg4IxfmGabER5prJ4HTae4LkIomEYg8h+JVZqUOJFMhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmITXlfS; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmITXlfS"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bc144564e07so376174a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 04:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767528886; x=1768133686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfWjvBvMbD7spHmyhUr2e/VZGcwAkWz6GvaM6wUmsLA=;
        b=dmITXlfSfOmR2lpejyqedKmU+DtT/VANOrNBAPMaYNrW4VbYniwOhCpcwDWnw/PDm/
         mgSTYyi8LCHKeYsnvSrNpWGgtgjSWKLoFR4d1U3LHJ2Eg01rBk73W9hAchdewCFwDkqc
         GFvj+hzBr+UgkLLC0iYKqXK5xccEubyvGg2sn189Iqijp26jN0UVCU6lfP1nC9EZBrny
         JXaECsB6jxN4WdMoFO7p3kdNRsIXCzA4Vryc/d4v3EjmA0a8EE4Elp1Y6ZnGfwMU3plY
         OUX9qbJ45EgBOTKXXPVLyI2eLldc2AZslPf3GU1vwVOI/n1FCxQ5hg7cWZckdYlQ2jOI
         MNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767528886; x=1768133686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EfWjvBvMbD7spHmyhUr2e/VZGcwAkWz6GvaM6wUmsLA=;
        b=UpwfLsaJ8k/PH4ieXH8qFp7VotHPx8JzBaOycZDspVeaXn6tV+PzFKXny2mXWZV0IL
         Om3yKHzYOEzpYUQF6TjEwrdq3G4lrbvjS94A/u7c6LWv5ERexIAP+FQu2Ckumqc8qVUN
         K6s/PYJs1XiW7h0xYjkDrdP2ZumU9LNQ1d5zbC0cZSDE+wSaea7Z1iZJ9dmlvz+g35t3
         E7Zgfpg70BNRyNfQMk3HBdWPqmu4N4ROSrOG8wRlbDP/7dwpNtXcIIIi05coh5tEXUcB
         m9QAYTInfcIxMnPg4eKNSvKvQdb1H1tolLdaSXMwttu/n2tbDLuDLFSv1dmQGIhDHdh9
         +Rgw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ4E305iWK72qk3ErsPoecuBzNS0YvHN6eVAuQoLCwoq+szXvNR3MPVAeS4+UU8Pq5Xlv8mLG1N9RBIuymAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7vWDbbUMwrNH22D0POHGMvoEgMFauI/z5AKQM+cQHiHgQCO3D
	fIUQmH/wgJLbCZ8fOp6B3BDtfeU6SS0C6KHrJPWnllvPMPUC2Drpwby8VFiTtJQq50HkkExlfgd
	ED3xXt+Vi8+/kPWk4fXt9/rDdNIlATJI=
X-Gm-Gg: AY/fxX7GnHIjtw+jAs1zt9eGEJUxLLySXg65dsw05UQSKKoEGbST6bmP/Bkaw+3hUev
	sNERd/5JAO2rshP5RtafbkgnldyCicCs6sHtttAnmtyjGQQRzvwQ2UC7ht/l8TYvNNRl6cryLjb
	os4sM9lNeCXpi2FrwlJBJGse5IZDpbo/pJMGIzrsjPQxL70Fl4s1QBcXXo7BdbbxCBCrSd18D83
	0fGausRoa79P3xMkAw/qw+qEi1SBEucOfwmLZEPWSeSkdp9eO+Z5v3pNdByqcw7jGhBv+qVhnZi
	6BJ0qFZADo52pdza9O8AMqe8Y4qGIDQGO+r/oFL/R2pAkDnNIHr0qnemUhTw7BvFpF5cIUgewfv
	Y6bqWxGi2s6GIDxWRf965BPA=
X-Google-Smtp-Source: AGHT+IEfpjPQmdOM/AGvNqQQ17wFJbQA5uPcFrDHayhi7zO0nSwPrnYaXh9fzqZ/DF0dHxbiMFrpq7GYhQNwrcxtnr8=
X-Received: by 2002:a05:7300:cf84:b0:2ae:5a24:249 with SMTP id
 5a478bee46e88-2b05ea0b213mr15853320eec.0.1767528886135; Sun, 04 Jan 2026
 04:14:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
 <20260102202714.184223-3-shankari.ak0208@gmail.com> <c7be9f2b-003b-4dca-8296-5cb7a06ded8c@gmail.com>
 <DFF8D5VJ7RMG.VRLZJ24NT2T3@kernel.org> <41d26500-d425-4359-91b4-b738725c0b8b@gmail.com>
 <CANiq72=YKO3fvX=CP1VeXoKfROtdJWF3rysNdz+k_nOWw1jv2A@mail.gmail.com> <DFFSKWSC1SHC.32YAJT1GI79IY@kernel.org>
In-Reply-To: <DFFSKWSC1SHC.32YAJT1GI79IY@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 13:14:33 +0100
X-Gm-Features: AQt7F2pAksb2TLGYHiapJTju2a1m7ylvjyd71P4eW-xe0NiBRCRnr31BCgp9XX0
Message-ID: <CANiq72mR=kpKCoPJaTpRfDUZ+cv2GMXgviMhbeca9dJMQsA8yg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rust: i2c: Update ARef and AlwaysRefCounted
 imports to use sync::aref
To: Danilo Krummrich <dakr@kernel.org>
Cc: Igor Korotin <igor.korotin.linux@gmail.com>, wsa+renesas@sang-engineering.com, 
	Shankari Anand <shankari.ak0208@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 1:09=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Yes, that was the intention. I think it is a good thing if the C and Rust=
 parts
> of subsystems are handled closely. I think making even trivial patches fl=
ow
> through the corresponding trees can help with that. :)

Indeed!

It makes things easier and is meant to be the default modulo
exceptional cases (most subsystems already handle patches like this,
which is great).

Cheers,
Miguel
