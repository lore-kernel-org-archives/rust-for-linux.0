Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4853D523B
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 17:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399705; cv=pass; b=M/RscSVQVMJmf4faaqIsdNehHUn9JSyevpt8Fo+XIT65Abkml3qK4Ovle9GKtp6APKFWzq2136jb/knVnrC15ziH4DKRcNdNiwwxpi8w//wCMaPJVSjXYrUqWtdKADd26cEQfR32lzivJ3lIViKpTbUmibvclBrkR0cdSImWIco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399705; c=relaxed/simple;
	bh=3hFk9tuwrkkOOs5SqqxrKl4UDT5JfXcKqblsr1N+udw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pGcSkoTjWHZGcdVTEtbNSS/qQS8HBpfPoC4gV71+WdIi1G76aQHvp07XjGGjq9J7KH2HZRvK38YLv9gHD0Sz3hVSucNLpzh47m3b6TpDAnkkJc79esMvlpB33Ob/hhLWNumvlVQ2WMH8wi2RdQ+Wf9gZdOzHBTqJieOmlADNXkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlqrFvMg; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlqrFvMg"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b9fee27ccso410531e87.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Feb 2026 09:41:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770399703; cv=none;
        d=google.com; s=arc-20240605;
        b=YdJIc74kXSXHsohliXbDD702+IWaiHyCu/Fk84XUlC7H3drEiOmiYjDF1fLJG/3jk4
         i3syu6PD7rgjlBZGIdLzk2BHmdBAa9ZMv+clge3V1jUkSKhRWVuOK7BSGebtAPB1os46
         f68ewH0nWW6sR1JAn070/ZsKW7MugbTxfU1FmVRvGe+TSZo/tLNUBBvUrDXWTwRwl8tL
         j1OsVqgXXa033JPB93PvTjTd3pHQC1nFgBcMmKlAuOXVZQn35S5lb0dwHVH+fODk3Mxz
         Ptcvn/BBjYZLfzsoI2nScIjPlyMvrGTmdS4G4OirjdJaUFYHuD9NRNl40BmVjiaGzyGn
         RLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3hFk9tuwrkkOOs5SqqxrKl4UDT5JfXcKqblsr1N+udw=;
        fh=HjZLMryQ/DBzyp7Tblovpa9thbLnA6Uicvi2k3TyWks=;
        b=fl/F5B1r8mkGNRgz9nDIe56wR3vdUhIDwlIqiDvWBdUfq78ocnSm6LPBBg9FAf9uF4
         BH17CmxyfjwaGECm49jMN81qcaOATH8WrmrqrPnlA1cZQJ5OdgX0MbPyn0W9NIWHQfhC
         Y3ILE4HACmxIaLYJ6/OjYCQG7maxMGjfuBaV2LH10d/CNWc2PCkX+dMKFlEiS1999CLv
         W+X2qjaZBkazf9X+ITSfLkQ1S5XJ7mOD5ZxA5AnYvMfLCOM7flV9GIePlWrX4ZxsJY0k
         Rg1wmc5bAFQWIHk3E2IhrCEusgQZXGh9HzrvnJv31Eq8t5AS89IhcMc1bFDgY/Yggtpm
         I04Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770399703; x=1771004503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hFk9tuwrkkOOs5SqqxrKl4UDT5JfXcKqblsr1N+udw=;
        b=jlqrFvMgaRtE0H30rnoeg+fvK0bjPeHO6ve4n0IsDFqBZdzE9co3Vv4qv0WIlSrzRo
         pNMtzEszxmMXZb5+1cRgnP2Va4OHOXzV+ZShpPAA4H1OzsvIbndjH1YkRPsGrNvsNBbJ
         +wuNNAQxQnXNpPv1qv8Zrs3KesQ7tQZeqET0qIGg3c4C+MiIsOoHqSM2sGDO5WVkNRBv
         Z0sVBs0Ez6yoTws29dEjl4SrMvVEgaS1DUrA7YaqYLadGGLHE9INc3NplD+79+5kPJqd
         VT8zg4j7bdvsF6TyYNW4LNmht93bxgZ3dMnrn8lJtYk2vQJLVDKygZ7jmO0U5z7IGvSV
         rHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399703; x=1771004503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3hFk9tuwrkkOOs5SqqxrKl4UDT5JfXcKqblsr1N+udw=;
        b=Vj97q3y0F+T8gGjqh1Bx2Wy/SfGvjo+aUCoDpwXEFT9H43clOSOkrp6Z0sePQMNUO9
         2zqApeAQ3m3YryWvIITQs4rjhk1nzqk+g8+trzgwRP99MXxvCPzTBkpKiKgKl/1ZbPYu
         bRLoFmQNipCHCs7228VcbYinredzgSDlasetbk9WdryE/BgXv+y7KVjwYI1dPd49OVSL
         56uYLhilmg+Or2b0QU/ve4rZ5JjGzB9ZYzoAXVgG5w12KnYoiUiXbj8XmvVnFOQooyu0
         F8eJxxejmfoYt8L2BUm+EMRK9UsSMDl+KH28ALpN2eO/PlPzBSEt/1KZtNXhMD4sHni6
         GpIg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Iw5SoXZX2+1W6dUbbNxp0U2T9i12CiTA3YZOISRCPwxSQCpGDW9B2il6b6M1emykyY661iiHOOXHq9HXEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5EsjAzePnc9g1Tig4eRcSjFWXhviQEiAEWk+q07e+BRAJ6UmK
	yEVu8J+eQgEM3eYdA9/XqY20M9MDe7hvqw6E31M06rjZ1Qj6aA+bO46c+GgNpEq+GkC0fMS3Avg
	0fLz3bJY8Qk53UuABwuUDzwlIJ8ZOWVQ=
X-Gm-Gg: AZuq6aK4O/zoSZtQ+gtxBPs6dVItQGcdLIkZOc1UEp2LinqsGcbRK11jz2OGBTpNk3S
	3cMRcUkBaZZme9NAgtsN2601o4mPdFYTBXsxYOMIPE7aH1Txs1RwWk19152wucXUIEBy+H7YRzJ
	Wzh23vUyX/usMjI7n8F20iJ5rb1+pSEDJg/f5Lst34tUNongl1cxqas8vicip1ME5Z+N6wOiQ7z
	eWvjr+vmvG7ybDOAkMn1fvA7d+6UF3+bpAN2GaVa5Bys7SuyAUTLGggfTeX4taefw0A6ydliWy/
	+tZvqCQ0OB0qvAMQxrvWbyJ13Oaq6fTZZNGukng8oDKCnqquxlTiSgKKgZ0WYGPCgBy9T/Csx/9
	qtK3kkraXgJDd
X-Received: by 2002:ac2:5683:0:b0:59e:3ad9:f6b8 with SMTP id
 2adb3069b0e04-59e45161827mr614789e87.3.1770399703245; Fri, 06 Feb 2026
 09:41:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a798e6a368639f7a1ce633a6dfecd088d6ed4123.camel@perches.com>
 <20260205014218.2202385-1-jason.kei.hall@gmail.com> <CANiq72=38f0dcyt6f3XDf4cZ809cLYghWj+72p+j=w3mFLv=aA@mail.gmail.com>
 <4c278599-66ff-4b56-a66e-1c7c94eba469@de.bosch.com>
In-Reply-To: <4c278599-66ff-4b56-a66e-1c7c94eba469@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Feb 2026 18:41:27 +0100
X-Gm-Features: AZwV_QgAUmKz6gbrHABCZ2NEJot3YIZUU4Ncq8hTCw-2PWWUkTh56og8P6_PHP4
Message-ID: <CANiq72=68-daT3J_NVvp+7NkGFWFPGQmwoXn4m54VYeRKPUkbA@mail.gmail.com>
Subject: Re: [PATCH v5] scripts: checkpatch: move Rust-specific lints to
 separate file
To: Dirk Behme <dirk.behme@de.bosch.com>, Gary Guo <gary@garyguo.net>
Cc: Jason Hall <jason.kei.hall@gmail.com>, Joe Perches <joe@perches.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Dirk Behme <dirk.behme@gmail.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Whitcroft <apw@canonical.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 9:32=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> Gary had some concerns about `expect()` in

Yeah, for `expect()` in `checkpatch.pl`, the current message does not
make much sense, i.e. perhaps we want a slightly different one,
without the `// PANIC` bit.

Or perhaps, like Gary says, we don't warn for that one, at least for
now. I think we discussed pros/cons of using `expect()` to begin with
recently -- Gary?

> I'm totally fine with this. In consequence do we agree that this will
> result in some follow up patches annotating the existing "allowed"
> exceptional / intended cases (e.g. in doctests and tests) with `//
> PANIC:` comments?

Those are the ones that would not need annotations, i.e. they would be
false positives.

As far as I remember, the idea with the Clippy lint was to allow it in
certain places like e.g. `assert()`s inside doctests for sure (and
perhaps in doctests in general). Thus no `// PANIC:` needed for
certain cases.

And here for `checkpatch.pl`, if it were to trigger in a similar
situation, then it would be a false positive, and thus the developer
should not add it. But the patch here skips if it is inside a comment
(or doctest), no?

So the remaining concern if I understand correctly is too many false
positives inside `#[test]`s but outside an `assert()`s? Yeah, we may
need to track if we have seen `kunit_tests` (and reset if we go out of
the test module), to skip a bunch of warnings.

By the way, I would prefer we expand the comment on top of the line
explaining what it is supposed to cover, in order to evaluate whether
the regexes etc. are doing what we expect or not.

Thanks Dirk et al. for diving into this -- we do need to move forward
this topic, and there have been some disagreements on how much is too
much to warn about :)

Cheers,
Miguel
