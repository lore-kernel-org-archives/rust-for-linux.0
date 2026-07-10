Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5278495E5
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681628; cv=pass; b=pSZ/17gD3K3ZJeYAz3viSOwBf39JBFZkuhnGc3g8dH4dgS2vCSsRE7utgvXJGatUJvfkuqlrBa6MkM9299UPjmmM4OF+cwztuDONkwMzaBXQnu0htlM1k98+zBsT2tI4yFb7ANmLUi30go5uMk6gLVrcHwO7RvK5BrCseJuVkB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681628; c=relaxed/simple;
	bh=XAY584fmWFVZcWg4HE7GBG5c7FzWPNMbpHCY4PB+JkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJMAiuTYh26K0Pep6W/M4t867z4zlcO+WgOAKas5GeBj+4fWj6twRrgwVUfTVF//BN9Xp2KtMfEjJUAL2wzmxXIhtSArYSTanaym8rn5eutvNNlDyzjleFvB3IjcEReJVsqYEu89tRjTfkP0QdzQNM1AxvIHnUYz1/3lNDga380=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s+SDif58; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s+SDif58"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca132e9c54aso61920a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 04:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783681626; cv=none;
        d=google.com; s=arc-20260327;
        b=nID3tU1NRNsuGUth2XUkQVx7ApF/9Cze7JhXXF4i8DfPZFavd27RJQPa5ioALtDWe5
         yWbLdDMc7cO5g1ZQ2lzCQOazofwRuojYMhr5KgkXGZ00wbAK1JbqsQrfgd5DrAVq2Rvt
         HsphHWW0ixlauB4tB0LiGtQc4/CoR406nX9ezGMEPh5wkZctkDH3DTmvl/WUJ8HS7tYp
         TuUgvI1UOsIBADuzsBv8l2yMzvVKizmpEudCmAgRO4XuV0qcIberFKSFz4+6DFux2VJ6
         nC35ovwUQoxqXy/N3GM7jtV/LaCbW0vdFaR3v9g8p5JBa0X8ft1vA8gcM7apHTHPLYtJ
         +omQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TVZpUjCDGJOuOty3pUnYrcg5wKgffKemZsynPuXgpX4=;
        fh=+m9+vxvTrBc9DNVu6cGdeoPxeEBoOIPciB/nnJNPA/Q=;
        b=mQdyXvMC8cD+aUrOhPmdr4sde8XtUg8slaSwTKMXU8tv71UE9q/b4p9yRv5AOeXRtO
         Uwzp+rkQNn9ex2ihszRogj/y7P62TWv8VYcXDMJ4eq/zFEqigUG1dPUERtduVoIeLJRy
         D0bnS8SFqH44uXzz1YKD9i7qToPYfZAxg+/Mlziz7sTeVpLq8PTx0k/kzsGebN77d6ql
         +OID7/O7jqvp3lGQfi7Gkp9npbfseqsC4XoaVYk8T0PNsBNjrxaxLoxPctV4dT+p84wJ
         uEJvlIsLjUNpOcYIVsr5ktYI4uY5PK+FfqhOx8T4ndCTKSpac4n5igPdFmJTeIXr9F9s
         6kvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783681626; x=1784286426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TVZpUjCDGJOuOty3pUnYrcg5wKgffKemZsynPuXgpX4=;
        b=s+SDif58LQMXPwcheTyAbPFRMdSiyCba/tC12npUfy/i5nFYGprqkGLwFOq6nGww0m
         lV4zZPinYetEcMuGbvFakRcad5Spd0+wEHX686Xw0C7yvvR8S2alWpUvGcJwpjEwqSqQ
         gVLRKWXSD6HoYT40lNc2eGv/xjzF0EwkPfEZ45X4oukeeQxkNnbgt3LRb+eTpHcVQxb6
         1My2dnEW3I2vU+4ycRE9/h+KzRo076HrX+I8BgKPpbV3NASPEOSZuLftce1crLH36ICV
         LK02KcgfXG7EXG0zOVtMOGcE+RScdiXqIyipDjjFL8QHDkqq4M/og0XGqjGZfE1xJzHK
         3kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681626; x=1784286426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVZpUjCDGJOuOty3pUnYrcg5wKgffKemZsynPuXgpX4=;
        b=jT9M5h87MgJttDowPklvwIdu65F5Xto31b25LBRjuQobA2hpZZGXpPy3KvvgltKk6L
         OVajosxvWV6u928aXSvnJnsG/JKhXojq1igCVJXO28F5r3VVhdxVxe3R6EPR1vmX8kKp
         u+7F7jQZXVpX7Aj9MCMEbjbcccYxyp0fHMhwpkpfQdcxO4Yen7Ji9v7ctbo5Rn/pePTx
         1xbYeXbpYsY19eElgg4/D/POiOOSZTh6N4QWD23q3jnTfxcsb37rpv1a3c8kSD5NbWVS
         afpSvxlNczXc/6KHr2dh+YXFVxTqxAZeiMgzSaLOEuF9HDDtLWGFxEJ3+gyAjT8m1LvB
         ApHA==
X-Forwarded-Encrypted: i=1; AHgh+RrBEZmeJ2NbhTlzhSJ1o6+lXGivL28z8S3byDSifyMA3cfVrDCYj4u+aRhz7MFXkln3IyXWuKsgHJQNSShMcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRF/Hr0mbEkGC8xp9RSPsCvUsoTQVCnliK3hM1smtbEexWVCDj
	LXyeET8Fwb8IwvrgexfDxq9T5A3HlUGdrZNN3bY61XOOsjD9VuOpwXvfcw8ivNL9i7I3TSFCcHc
	cwD9rxEwzaWqMR+EMkNleNZ1wjiktBryGvUcVvjk=
X-Gm-Gg: AfdE7cke1LsojAtZnGI5cUJJC4LasTI0fF73IlIXq5cRIA3i4UY3IRKrZPIFvxOwQyq
	wxcmMDPwwimqve5cKvDV7/1lo3mkNn8/g0nl62F0YkaQx0dxM30/6xNnFc3s0JsnJE78a3k0O+r
	w3KSugTiMEAcZN7zs6akPo17R4uyoG+Sebu8vsXfyq6eYOtpaX6M+mbmSNe8XV239CkwY2bHgeO
	P2nv/AG428lFPg5FgCI+WFrZv9toKwK2YCi4ih3ZpZchm96xTNF+Ni6Zer6vFGAxJCLeeXQhDEz
	DRJVxxPsdcGLp2sq3OAkCJhK7J090vWFTeuUZzRY56j/aiRfqENRhXXjj6L1e6qnHu2eJeRj/NV
	kBXDugS+B07Ou
X-Received: by 2002:a17:90b:58e6:b0:381:fa5:5217 with SMTP id
 98e67ed59e1d1-38a2170a4acmr6732379a91.7.1783681625969; Fri, 10 Jul 2026
 04:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708175119.18051-1-harish.cs.ss24@gmail.com>
In-Reply-To: <20260708175119.18051-1-harish.cs.ss24@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jul 2026 13:06:51 +0200
X-Gm-Features: AUfX_myKm8_n1QKOu-bD2EygAtwp2A6a0gw5219PzaKOG_R9PNEazC4lIwwlwGs
Message-ID: <CANiq72=aTZitympw7_LKW4PoD71JfLTVt8EiLcjM5F48pCUjWw@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: improve `Arc` documentation links
To: Harish-CS <harish.cs.ss24@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 7:51=E2=80=AFPM Harish-CS <harish.cs.ss24@gmail.com>=
 wrote:
>
> The `Arc` documentation has a few mentions that do not follow the
> surrounding style: a plain `Arc` without an intra-doc link and a
> lower-case "arc".
>
> Use intra-doc links for rustdoc references to `Arc` and spell internal
> comments consistently as `Arc`, matching nearby docs.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1240
> Signed-off-by: Harish-CS <harish.cs.ss24@gmail.com>

Thanks for the patch! It looks good to me.

One question that I am supposed to ask: is Harish-CS a "known identity"?

  https://docs.kernel.org/process/submitting-patches.html#sign-your-work-th=
e-developer-s-certificate-of-origin

Normally, the full legal name is used (which may be what you wrote, in
which case it is fine).

Cheers,
Miguel
