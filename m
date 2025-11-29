Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CB0262FC1
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764426669; cv=none; b=VRAguTJPSqnvXunsOr1irjXtBt9O1DqH9/OW4n4UQyGd4Zme6CJLizbYuYDvlnUQhYJ1nmhBZYHNaKZKHKTeiGbU23wg8DkxNslsyEKoGmEO08h/pph1G3rfNtUCo2LhCgdv38wAEFjhfRAIaVTdwrOCmzqKqHEm0Eku88l3yj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764426669; c=relaxed/simple;
	bh=yMsbazQINn+Ap/ydJGs+KwKtfgjlcNUADEg2wwTJeFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDsnUPZSJJFwPXK/Ycn04Xt2c/1gbA+jrkaSj2JyASEDWel+Js1P4NiJzxA0bWPTFHRg6LhC8vagxzyoPNFdkbpLZUXGRnGKc1SB4SdN7LVwnstMbjZJReLh+oo8qsitKVgCBnPA4bWWwZ9c6H/l5q6gdIW2LLdqGH7b45/PP2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rpm29hHm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rpm29hHm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-297f6ccc890so3587455ad.2
        for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 06:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764426666; x=1765031466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMsbazQINn+Ap/ydJGs+KwKtfgjlcNUADEg2wwTJeFI=;
        b=Rpm29hHm2bd7afCT+++ebk5sF3Je+SB7EmZNFzObqXUYOIbtE80+pSFbpndafybN5x
         3lknfIhynyi+TWMiNYVsC1xmd2s/bei1lvXQ28g97encbv7Ise24v0aDdBaZpCc5SAoe
         qnCBfUoWCxNkqe8fs+Es9iHLdBEwEm8LEIvJWE17Gf7RASvkYRm/7Vnwlhx2whcE0n5z
         qtO2eNUOeR2JQ6ioyW7q3iUbBbaoa8eKh6i3/b/qpC5GHNAUozQnLEw3TAu8Vcjo+d/5
         /DsHXHpSpVd3q0lsS7YInhODImzWVI1S061zYyRabn72dY0eozRCLCPZNm2l1lXsa5Pm
         UKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764426666; x=1765031466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yMsbazQINn+Ap/ydJGs+KwKtfgjlcNUADEg2wwTJeFI=;
        b=NWPWLV8gj5i5ewwjO/UQrxZ2/bnohE8UyAaLNEO0PfmrEJ9wde9WTkBp7jkQ8iWGVN
         A7LKmTBwTnMRaVwzzZaW0w2QyVlBNUr8h8W8/MqJ9OOpEAQLgKbw0ZA1Yz5Ry0kFQGhk
         PEqm1HOzunIgollFxtMJ+4RB60UgA/4TcGjzOUr71uPQiMaQFMS6TnYFSdqlLGuT3M6F
         UIfsnIzawX/KXGndaWqouELeAcxhuQq8tHvGS1dE7cJ0zPxIdL96UMm11oyVMzyXQM2F
         YW6i7ERAHH0wPZUS9NFVlrsnLL/rw8R8bwXB1pZ7UL3NqP+JBcqW36yv9ecm0s6Ee/iI
         Ha5w==
X-Forwarded-Encrypted: i=1; AJvYcCWY1hI6QqEtvwrMixKRXZrGJ2p9LmHLgLzEIAbFQK8LHxNgYwq79m2pYO6/prL0nMHyHgYsSTRnUnaS/puepA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCEqnJ76Chf+1O0I+5KLreFRRNx9B9B2xduRIo2u9S9xpqdIMK
	xzw1OfOkP054ems9vR7KKqzuNFmcIL2hml4MCQDubOhAptiyPxhsD8qSOz7MvRKL4ug3q62ov+d
	ikz9T73lK+LgyyJMnha0w0lsGVhVNJ6I=
X-Gm-Gg: ASbGnct41Rsf5DmOOD0iZSRZqa/7rdxVltyHfarvzuGrS1UxPxqO3LkK3VWm5xiO0Oc
	VdFoTZPa/2GCnkcGfJgJ8SEv/d3FfjcrSeoFQ9xrXcBx+iRrpBvt6cU79Gou0VsNxR7qBiBYZvK
	ASbryTHHRqWB4qxiZtnutd9nSoGEAwBre8GDJvOG/HoFdSP8KND8WDC/Wvvo6oenxMn30Gw9h9q
	GtTKeh/xEWssDANLdoJCOMcBiDQQrXgwtMaTBIgH7gYWWYW6KntKKSZRQPM5rN4+k2stzn9N/6v
	qJk/SGnbltY8G7R2fTzvzC1Q2eP1C+kk4nqw8rJ6usEHs3UTLE8Llo0MtXGr3ZOi0WqxJiLBQoF
	F+MYF+Gi10li45A==
X-Google-Smtp-Source: AGHT+IHcOsjVFY9XJX2BiFAdmsHJ/f20IbX6P9+zd7PQm2nCPKxCB5i/K/WGxRB0xol4Ze03XmNGaR0r/rbYJIpjsVo=
X-Received: by 2002:a05:7301:4084:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a724bbea18mr18350746eec.2.1764426665752; Sat, 29 Nov 2025
 06:31:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129134834.34559-1-atharvd440@gmail.com>
In-Reply-To: <20251129134834.34559-1-atharvd440@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Nov 2025 15:30:53 +0100
X-Gm-Features: AWmQ_bnPoDsTRNk5YATBKX1OFgMn8zdQLMedx-ZaZ6SNnvYibRdyQixueZZy5wk
Message-ID: <CANiq72mSStPR2Htq3aRS9FLbiHALJP21tTSgiwDfQJBR1zHr4g@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: use `pin_init::zeroed()` for file operations initialization
To: Atharv Dubey <atharvd440@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, dakr@kernel.org, aliceryhl@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	lyude@redhat.com, shankari.ak0208@gmail.com, lina+kernel@asahilina.net, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29, 2025 at 2:48=E2=80=AFPM Atharv Dubey <atharvd440@gmail.com>=
 wrote:
>
> +

Spurious newline?

Cheers,
Miguel
