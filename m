Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773791E505
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 21:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768770157; cv=pass; b=ZUsQsnN9Q8teI5sZ3ftTbh3xvXzXx2SvONeJJMrl4l8FaMq+5576JKhA722C93A0T3oWCJifnWYy+HNyR6wb3Kj5FCbRr3wqrdk5eD5VxexvCVyFXtYLT3Tn543KuTZ7S+Q51AwhPyyGNdmrT2Dms+uk1Cd6U04MSWkLiCETkfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768770157; c=relaxed/simple;
	bh=tw3NQpS9Gj2vZaiD4/k5v/fu6HS02ZOnQKBEHQg4W1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0LC6nWFaeKfOxIqnS05TPNd5LIcrSG0obZxIVYge5qtCwOHn3oXHfCYbZ3Qff6npiJkHHEb0VtPsrN/v/3fpS32xR7vH/v+SngCtb+rM1k2qqgQ/EIfw8oFntsAjXlIXrDXt+T2Atw2n0blYJiocZyi2ra+9J9EFOqX1At3rOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB7CTLqX; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB7CTLqX"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1233e05c77bso124291c88.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 13:02:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768770155; cv=none;
        d=google.com; s=arc-20240605;
        b=ECQQlS0uAmkuXvecp6JRY652BNy9OsgK9laytD+LdkeUUQ10J5/+q1cBWSJ5uC3eoc
         xLje/P5Cs9GddE5ESmvzyq9D47v9mhSXjX95xULa2v7k0d7/Wd2BtzKeAlYF+F1u0fgM
         S6nRbgMJ+K/uu+AT3wpb+IU5/PSYDfx3CRNPB/6Zkm8njVutXCq8OAIRLrt7DCbqAcj/
         ex9KJp1sEB+vrJDScSv3ulMWwjPfYv97oZ2j687XtXT2WU55BMUNyAba1C4NDfXWT24V
         rbN72F+6prR7sjSOkzwo9jJ1tOEV31lmb+xzVAHOtG0ktesRmwO35Vg76eUH9y+6yXUc
         nERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tw3NQpS9Gj2vZaiD4/k5v/fu6HS02ZOnQKBEHQg4W1Q=;
        fh=YpyrWcxKY6M84G7aFoHXawVogUykpnvnKrsLMH+KnFY=;
        b=lxJ0bgfsUPP8rbyBjGItljlHm9f9m25J03Am3fHhDkJYR15wn5yVkR8D8ASD/eE/sA
         8uIOJTA5IiILdrLkKY8MqazhHmSpsFielp8cxoOMHIQ2/dOzx9XGGhFYfLnMUTGNE8sC
         ricwAohBeDLoSPNPMLV/R9j9maSDeECif8W8W7+9uRxlzUzk7rHEWTu+iTwxHn/qBhgI
         Vt4j5wDaZf1P4GXfjiSI1UhgN6bC+xoPxVdXpyQbwULunopZkE/oKwqi90w3cNEYV+MF
         N0gs5pozIzvOwWE23+9skmPXt/TYf0Zu9e9PVp54dMvqbCxGELQQhJCf46+Vn3iNDSVQ
         4zGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768770155; x=1769374955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tw3NQpS9Gj2vZaiD4/k5v/fu6HS02ZOnQKBEHQg4W1Q=;
        b=OB7CTLqXdSSjCfSPxlBROGqprWtDiY/huYS5eX86k6hViqCOrNAAYbuYmtcffT46fC
         M4fhpVgWdfYA23LqqjfZtfun0q01L+cEN106y6EnzIkdYPI+4xfJ7KPXxlhMnUiPJzLn
         YF2rWc7X4i5bQuKdHDqtkYJ4bK03GMW4XM5GGlihnJWCRSSv9+y+93CJk+E3ocs0VN16
         ypjkJQkoUjtIl/ulhgxk8nnsm3vm+QZMfbrOIkCidYZ/dHMpUMjafWmaR1rGXUUUAcrB
         uRNrjrEanTVMYbxXdGShp/spLlfQjbHQHTtuCjnPlSdZ5ho8qZQ/ofIpuuIZ3T3qNGd1
         biOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768770155; x=1769374955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tw3NQpS9Gj2vZaiD4/k5v/fu6HS02ZOnQKBEHQg4W1Q=;
        b=Bc/BUBvt1X2I6SB2Or/z8fMa9i8nLrsb8QS6ZOoaP4HzYrdsrz33GS9/QGHbHeRPyW
         +IK1cYgDoHJJqbhx1xxgYpVJtve78uuV7lyUi/1gcao6QFURqI9G15qV2rOX/oF0aHB2
         rnU3laDAp78PjARzPTamr+tyA9KIUWcPchHfF5PzRW3vu6dBjYdXL85h3jFUc5s6Grj7
         IzlLhyPVAXc2Kzi8s4M7V+Rm2I3miRwhROOOAlrB7T/0ClOpyUNX4Q4JJIie7ce5Rkdb
         9PJ7vnsrhj1MHQjgBx1/aQk0sGBx4EdRCgoaEA7gJAaJmDgqn7YBOQ5JHWIssptVP6Iz
         kgNQ==
X-Gm-Message-State: AOJu0Ywa8FOe1ZYkrTNDQbAcIQLHWYNYYa4cBWcpW90DtoJrfj2+80lg
	WMqzWZTtoNTwsWj/xC5mUkyDfNhnFY63lEhH66RCfjX0cOSARuJeIqkPlfJhB6VXuEai4R5LPVj
	J+tcuITnU7ztG8Xa9ewD8AHfICHFUojc=
X-Gm-Gg: AY/fxX6sVsb93tgllolaQHuPcDaNzv0KRMvI4xWLGBDJZGOlcZ7JjhgOA8DURJ4T5/3
	uy9/cEDRxfZEoYcfJx9i1GwGDRqEdZtibBOj1GI0jVx89uNXr1cVK5+i9WSvy581ABI3kmxcVmE
	oMD0bkq2j6Leq23/OaFxRsj4Q1zs8zufoLGKiQCYNopvwHbVrzSJ+AFZ3bkq7vblSbDhtXIwjDC
	Ou7CRaywoLXHJIzb29pMJjkh9jV+p0nsRn8HVQWqGxWjIJdT8gkF/eTR355W7ROzpjgr7q7QswW
	tvn0yGKR22YLsKgOXlXjM2UywR4y/ardblbOlGxTacCX6IzOH66p/M4/Dze9MpAi59Uob79+p1x
	LMSgxdvAmQXGt
X-Received: by 2002:a05:7301:4442:b0:2b0:4a1a:657 with SMTP id
 5a478bee46e88-2b6b4103a28mr3710162eec.8.1768770155529; Sun, 18 Jan 2026
 13:02:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113144547.502-1-work@onurozkan.dev>
In-Reply-To: <20251113144547.502-1-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 22:02:23 +0100
X-Gm-Features: AZwV_QiotaIfZv8SGwO_zqGp6Hnh7ImeBYpE2559L1datnkCA0ri4BEYTKiF0TY
Message-ID: <CANiq72m_72QAehQFfdUt7HeET5rpJsK0niiWRUtqnueuiooD3w@mail.gmail.com>
Subject: Re: [PATCH v1] rbtree: reduce unsafe blocks on pointer derefs
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, aliceryhl@google.com
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	yutaro.ono.418@gmail.com, charmitro@posteo.net, borys.tyran@protonmail.com, 
	daniel@sedlak.dev, tamird@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 3:46=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Refactors parts of the get() and cursor_lower_bound()

This is now `find_best_match()` given commit f56b13172382 ("rust:
rbtree: add immutable cursor").

Alice: I assume your analysis/review still applies even after Vitaly's
refactor -- if not, please shout!

Cheers,
Miguel
