Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087DF3FFAB9
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 23:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779839198; cv=pass; b=kdS96Lq1rZMm7Z1nFScwl2ojRb1Gd+zRK+OCpCc9pLutiUNqLFIQRiqxArkYCM4v1Pq0bD7QMPBhNsdS5tyFXYt8YxCNWNuKT7NEl6ANVGJVG96kgDKBCklmjGB4LQ8wrR7fA36T7u0lsbHSky6ml7A8EtS5Ltw+v7vd9rllEpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779839198; c=relaxed/simple;
	bh=OE40IPjMQsoQs3WEM7wwQ8V7e3xT0VCxjaueFZcZ2XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3NI1WmoptgS9u1SQzu4FTxi5cQXpRTMZaQ952r5s/uhwQ/or8b0PI/8EleW/tsI7eWV65Zg6j9dXcAaee9roFdGi9OGdydsZ3F4rPbfB1GNeuE36LPj0vX03K3m7NW4ha6qXIht92nIflV7i4oKDJ0Yu7v53kTKm5WnYVu0hWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=runIZYG0; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="runIZYG0"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2f114d129c0so930476eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 16:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779839194; cv=none;
        d=google.com; s=arc-20240605;
        b=WQGXEakWQqGHjxEn7+BAK52JydVfmPSjN9QmpVsKzgl7O+R0BNHmO3mMSH68qjVQfr
         KLa2o+f08XuNbHJL3le0PIWjhUDxz6bOn+I7yDncbbVEC3K8tsuXeU1EYlNGptjLN4dj
         QY9gug1dbzndnQ2lHuxVoKygsaRIP3A2MPggjZdGrZuBEJTIFhex723NblrM64f8nuCV
         rX2XKT6GwxK7CWKfz3+voKBCLL0yfPhZPNPdE2zR+YRIuMsLhS5U30zu3qILtf3SYNha
         H0hWbGqDCgbtqAFtYLrosATNtDy9gwtFpeOP0eLucZZBMVJfpuZ+lZ0Fmh3IAaj0YUDy
         9B+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ac/Zo2oVKowYsP9ZWEDyaxuGIJH7vNJtlE5hWTeaZm0=;
        fh=DqQlNA919UdPsfXqcDm8o05Tio00KE4uro2xzyPxd5g=;
        b=For9WvJNyC4MP/Gg4RbLd7a7NrR07Wt/rFdlAsFt1EQcLUJScJ4kMvzSy8F7NRMktD
         KNWImupqh/5BjcqoXbmpYwdtVs8S+yaCMvKiDT9qcXaBkBbncrkkSHuK6CaR6pF7Z9Hb
         LgWWtwk3I36aQpgdY6q3s6OVUPYLOfr9nOdvByPZTee+3IO+Ti56dPyCkRE7lZKpnQ8A
         UlpR2IlCJ8k+bn/WhZDMMIv8WWf9u2jLVaKX5LMKpzZM8Cwtd9PH1zU3LL5ZtLdfWPcD
         HNqR/ZOewwilTOayIq/WEFcQdhCCT7ChUOteBVHPR24jG5ic8NqMz5kLPJ3smau8xGPO
         zwHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779839194; x=1780443994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac/Zo2oVKowYsP9ZWEDyaxuGIJH7vNJtlE5hWTeaZm0=;
        b=runIZYG0YV4KKPD6szLxQ/Ia0lfYAhBqP+vrbtL5lffQ2Nqhb5jNohEnLOxpGyCs9x
         91U8XXM2UeqIwGy1+/KEX/iDdJEo9KK5IkB/Hj4ZNA0PBMJxNt/4p2MscPJiZMBQo5hp
         3td4x6PCHr9RbRUzFQTA5yVQBMgbCvWVeJx60EjmRZ6ydMaKUoxp8nS2ZOFq6jaVzSzS
         m/DCNMQELaINER02NnjjdGgboKIaZiurNImfgxkZsetAAYbIry0z/4+Q0l9IjbTgihQx
         fcAMbYuAzuFzh3JxgcVgLQ+fQeXFblTycDdFE3325j/kOi+T4A+8IWOCT2BPrYbBhtBp
         WvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779839194; x=1780443994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ac/Zo2oVKowYsP9ZWEDyaxuGIJH7vNJtlE5hWTeaZm0=;
        b=nXtrHuFot2mrvm8ZsErgDGvdyLWbeRHuckyPkCUKA8xNh3HFt+gf9sGaDQXsC1PAJs
         na32Rzm1UtirAmbqa3vLssc0koXyZzpdsnzCqLaX/kyryGwe1sG+vJ+AX9+z97HvPlCr
         3GD1egeapgb36ka7MmCTsydtN0Sw1cK3AhI95LqwSZ1ZaLdOhKUURNQ7hrGjRIhdPm9s
         56Z03r6BR6brYoUDRVQxENPwLcvhegoWThoWMLt/6hwLxRL886JscwAjuedqX/qS70nP
         tgFqUdcKhxX20WfIXO7d6SyeYTZATd+2k2tASa6f/YbBpFAg+s6ZbvdY6EYGxgOX7IFx
         f5hg==
X-Forwarded-Encrypted: i=1; AFNElJ8ngvvLrHg7YcRfUgf2FAW5uOOsptc4oG47n7tads8Pf8kXiji6btI3JkcoByV/DEkcxW9YlNxJYTsPCI8+jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOut0rymItAmw75urQn/6zvmht+LnPe4hXeO5H/vghgaICqsWr
	SVff+DBi+69mTHsJW3Wb2/FpY83VjGanCGkjuy9EXCHvolHrazAS1eeS32/QbWeesLX81P4nhA4
	eynMe+nKd94sh885BPQaPr9UwlYqUN3k=
X-Gm-Gg: Acq92OE859mP3Rjo890N0FNvbZP5+wseDx3MX5cY3m5KSy83WGBQ8k99csJjCZcbqSb
	s1rjuDxOXrw5fDqLpPxpZ0OCoK5bPFYKVSOGVR+KR2ZN31hV/2AnxY1+6lySDG9Zt8Q5ce+DBSt
	7GlkVwObA4gWurJwusTWK42gdaeDV04pm7pwwPD8MNLmD7Z8i65X5m0P3KsbDA/7+S9jw92zR2+
	/flMInnA9GDXDMwVRBkO5WeYa+srzAWNLaep6htBnmjNRp211nYarv68d7D2jYbulI4QgYHR7WZ
	Dy8CTf3sbYWLhFYHP0ZV++iPOxLqQTzpvRGw8DaFBEasBKwbiJd6e4OGo8xAe/g0dwaqbYjOake
	EFZZP6Qzg3er9fveykAWf+Bo=
X-Received: by 2002:a05:7301:3902:b0:304:5074:83b1 with SMTP id
 5a478bee46e88-3045074b479mr2887048eec.6.1779839194265; Tue, 26 May 2026
 16:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-params-pr-once-v1-1-3a8c64704cc4@kernel.org> <177983883957.35274.15506019019254966722.b4-ty@google.com>
In-Reply-To: <177983883957.35274.15506019019254966722.b4-ty@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 01:46:20 +0200
X-Gm-Features: AVHnY4JyDe6kZxonjTblq-aMjW2hkQeVHUhlOSNGuJ6949P6uWExcCT8k_RSFI4
Message-ID: <CANiq72nq45d+kvyR8jp-hdJhFHv-zw2i51mPCduBeUdgSwMKsA@mail.gmail.com>
Subject: Re: [PATCH] rust: module_param: use `pr_warn_once!` for null pointer warning
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 1:40=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Applied to modules-next, thanks!
>
> [1/1] rust: module_param: use `pr_warn_once!` for null pointer warning
>       commit: 8d2a562b7efe98fdea57d10caaced911fca46a3f

Even if we pick this one, should we credit Adarsh Das?

  https://lore.kernel.org/rust-for-linux/20260226120848.82891-3-adarshdas95=
0@gmail.com/

Or did Andreas send it earlier than that?

Cheers,
Miguel
