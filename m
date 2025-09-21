Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5C6175D53
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Sep 2025 19:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758482817; cv=none; b=NMVlEcComTLfMo0CDSQhhmm+nsbYgI1zG738F7Iw3zL9PaSUYyr/AH7aykQUUmzgKkOFOQrXXwmlpFDuWJZ6zql2EYxdx2LBEU54p+ubFjSWOlUiwBVDm3eSZoIzRPqOrnskNuupWr9yRp83kNH8Zk7x5//b0nzC/XuIC+k61Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758482817; c=relaxed/simple;
	bh=oH5UtNym9RpiwcSddvQjjKKx7tunzmcpuom/l4bSHRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FgQvXpUT4vfMmXPJIV/PwUBFGq18u9xuw8UvZdDBFJ3ZcVB2hfJnR4lk4eA/rlGrgaCIipgO6Vgf36+c0C68ElR6fZbs+JBDvwVufxH6LJvGDNvua95ZleHZTtepXOVXC53jQGmoWLPk0p+eMu+6hUH+qWuHCQWf9+NC2HBwQ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfcrcsS6; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfcrcsS6"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b54bb1f3790so318058a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Sep 2025 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758482815; x=1759087615; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18+vUYPq3Ci6ruuoUubn06oUbgRm/99jHqYSqmMqOO0=;
        b=gfcrcsS6JLiAc4nJx2hp4xcq1NbwroBz3y9jg1Y+T12Y7a87uco/yyHJXZlZpbDw02
         RLsGGuIhY9vXKNVP+ssAF5yJvGE3AIGdQfABbh1+xDqjaqFS0iYH8+AvkFIDMa8StDXo
         nBXIVHgNsDdlSaFEtYQDNt/3+pgYtel+pdZgf+Gy5aPfgk0cII+LRU5OIL9Kd+mg869x
         34ehU5M1UYdT2fy7RyUYwJAJoi1r594TXY9U3OiFVKKlYy8fSchyjwR5ktT77QIslKpr
         Hx4PbzMV+YYnojhTz98H4GPLTUaxJcglsrhxKgHFYmVVYjqbkG3K/84QXUqMDjaLY17Z
         g45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758482815; x=1759087615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18+vUYPq3Ci6ruuoUubn06oUbgRm/99jHqYSqmMqOO0=;
        b=G+4FZAbLNg7GQ2TY/bHaiWXWtX2in40oj1YczS96h+qz85I2fg4g8skg/HSn8J1//M
         npAeMGjmqhGkCYHCL1TsqZJP61M4vB7s1km9hFwJPRzwRtjgoKX5UQyvesVcffd5IgR3
         ur+4Wqn0289PuUEJwxWqbaPijV9oQgPepo/YNLWtbHIgkYqk/KDxqt23uDupMP6oYkpz
         ND+Li3MAtF4TdOkCMVZlsiCXsKXrtSB6gI2lev+ungGRxGxWNki5qZwCCxB+8Z5MFAST
         LnPiszj3PcQsIivoXABaggZKaPRDwJPXIJs402Iemw3fekyeIRzTPF+ZbLeiWigoRzaU
         gdvA==
X-Forwarded-Encrypted: i=1; AJvYcCVbCDdAp2ZWTKC8d3HNhcHM9n8a7TeJ+xqMY+UAnkAaPeNFr9Rt9VUppL4vKAOMioO3Zj1EKU2U6/1y4m/Bqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOkp/BMjdVy7xO5JrXI5sNcPyjbXJU8aeBh2e5mTDFB2eAqkWd
	3ZBK+ln7WubYf6tCVcqVxA6vcGF2GyV6Uzr/bMsdUmue6NTl5T7b4FfZOP7Bkwr/NXi1ouRFzAd
	Ydny9t83lEPkG8w/0sPf9COOewkwqGMo=
X-Gm-Gg: ASbGncshVjE2wg5xaPHZJV6Q8/0oq/jOsAGrHT4BctBR7t9OAXaHXYY81Uc5vMaN2kK
	qyW2A2YhXX2g12wMOeOXb6oGz1mL4D7QrYioDFcLydyFPtq6qECYkPT6l8hsEI3R7UnsPQjNzTM
	9QdYOvHfLQr1IEvb7xkGVsRQaLds8pBr77C6oXirO+z0CkPPQzDSaGIfHaM703pfwoQUQOQbIcf
	NLEK4j4voYko027HlM5v6GCRgwprHsHwnNySEkT/sWWpKWPu9avpIQKT+22VFqhDyrhJgYVN7L4
	wSrmM2abfiwHzdENwAQbkWxW4A==
X-Google-Smtp-Source: AGHT+IFcRwUH0vKa7bKh9qC7J99dZ9/zj756NiRlUNhp6FlSbXbleTzuHGeB8NeOPHbd/DT5etkzlT+NoAVL/B4ZcTI=
X-Received: by 2002:a17:903:60f:b0:269:af66:5e70 with SMTP id
 d9443c01a7336-269ba53ab71mr51288905ad.9.1758482815310; Sun, 21 Sep 2025
 12:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6r6wtq3.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87o6r6wtq3.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 21 Sep 2025 21:26:43 +0200
X-Gm-Features: AS18NWD3yc_uzGarVsZlenQrMkidJt8aH6p8E3sFnurs5GWTCdvAMuAp_MJ73Aw
Message-ID: <CANiq72=33y3L8oN7d1BaKpD6TxEzhVKUnyx7BGyX+z+HdQtUBg@mail.gmail.com>
Subject: Re: [GIT PULL] Rust timekeeping for v6.18
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 1:46=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
>  - Additional functionality for `HrTimer` that allows use of operations
>    that can only be executed in timer callback context, or with
>    exclusive access to a timer that is not armed.

Should I use this one or the bullet from the tag itself?

(For future PRs, please avoid duplicating the summary, i.e. the part
that goes outside the tag message should generally be about meta
comments that should not go into the repository, like the linux-next
note.)

By the way, I noticed a commit without a commit message apart from the
title and tags -- for future PRs, please try to always ensure there is
some context, especially explaining why something is added:

    ac0a7bd27f65 ("rust: hrtimer: Add forward_now() to HrTimer and
HrTimerCallbackContext")

Thanks!

Cheers,
Miguel
