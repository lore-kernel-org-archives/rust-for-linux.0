Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3C43F4DFC
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421745; cv=pass; b=AAXU43PT8rdVVStJIiYMdoGNzTH6dUHZDBtJylQm/j+CdIk3Xg1oT0NlH7Yi97VDHtgPUZ62vBHGvdhIfSrvZoFhm2w9/SCloCcSI3BtazayqWopL1aeg0DEesXY8LB1zSuWrqUW6ipFJRaACJC8ORIpfR7BaQx696NtDVNvceY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421745; c=relaxed/simple;
	bh=sy8Vtb9aRVtEoGFrmpT8g6o2EfIr4b6IYQ0R9FDVQbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/57c2YRZOQL3BpmkFGlqUU0NuY1Em8ONTByyQpeex7xi6125a1keMdcal0PbWK1fOQrRkAQw9fsIiXIvsj7cZGXU5hfcJCBjVqP5MSbOgURxCxSlgdBVJQaSW21dZVpdYvl7x3aNH+sojeSvQT5UmrW0uAmInz6DnzlufkslDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZwYpsYL; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZwYpsYL"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1363f6f7535so538288c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Jun 2026 10:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780421744; cv=none;
        d=google.com; s=arc-20240605;
        b=X21GYn1Q9k20vWcl8qtIUSCu3jcXwf2Uiipcj2eDvL4zKQ1gxcTb7kMqPuE5E8XQgy
         SyAJChe7s2tlNYjJmm9VOyE6AMz9AfveICsxMaad20PL3PKKbhWB5lQh+sVyh886lnsH
         jdHplOOqpcAnst5KMLgH2KUS33LoTHl+rQr6n3ORy2uqhSPC24s1PFIavc2a8AslpZUf
         AF7dqIUV7cYjbp8rxyk8S7FARwH7wCU4yiXE4iLZM5FQ5TB5woA8H1e6VyhvYHUK0OVe
         CXyXfGqFzplG1DmPbvMLbEf1UVwCHnmxutXPY6CnjawN4lQiEFuslZRDw70TMXbKF+7y
         adWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sy8Vtb9aRVtEoGFrmpT8g6o2EfIr4b6IYQ0R9FDVQbI=;
        fh=L06JKwduUSQzKicpFm23FE7xKT8fp0GIoW0fIPVNhNQ=;
        b=ZS7ZeM/bPWqvJwy/D9hnJultuc125fK7EOhDH+tzJgEftFnzBMkrxsbWLoQvP6N38X
         8Q4etQEUZceWycWGWvUlZrjIJU47EaerwSG1OUDz1F2G3JALAlJgv7AEv/3lKjM96Iso
         dolTVrt66fEericboMOsJ+WDhtp3bYfE0aQJYp5gic3wsL9haV8Rb3yvWUHM2m7r1RAg
         HzB2z6BOJ/VYZYj9Z1qgU0KbhMbPhn56oDlwDt2h80UDbL2/oum9tYleEVBuE9v6//cY
         qFKPF1pzKVIiG4CCvh+qmb0GED6cLc/wPonrpHSR7OKYgX3j0Sdstgl83nPA1Sfc5X92
         IEMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780421744; x=1781026544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy8Vtb9aRVtEoGFrmpT8g6o2EfIr4b6IYQ0R9FDVQbI=;
        b=FZwYpsYL7iVbPnmJJBP3q6eazDg+j9/2vLbMg9frXVTJ9DPwGOz4gzHxOjNuMlNh3d
         xav4EGXetlpKQsxH5ktUuc1uAECfgPKd0IbFoOmsaDAuM11tOnS7Pt6GnvrFOlMQnGiu
         8gPfCnZb1Y1Xa+DXp0S2kI66DE8V7jYfs3/LD35oZEZ5EqH1KpsFEnRENrgtUTQwPOcB
         NxPgnPtbyfN4RJejISuKyDc9OEl4WLDI1N3haFHisrI59bcmgoobkOB5QKx/wojNngj/
         M/cEc/SivDdFi+FXxRryHFy3zPcfmOj5OykZirV/mlWLXShuFvV5H78p0iYYCIgKmTNB
         XKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780421744; x=1781026544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sy8Vtb9aRVtEoGFrmpT8g6o2EfIr4b6IYQ0R9FDVQbI=;
        b=CdCAqzzl0JXDxwbmalKfP4Rw1cKPM/CkNdyWC0yaCQI2EoqE2Yhq4QDLXTH2BZ51ni
         MPAFOIihX8+95KHld5kEG09dzqQkmE2xi9QelZttB31pSCxNqkss0d+/uUwJLlq9XW5E
         gYzI9X5R4hYetbGVaWsmB+FcBsE62a7cL9o0LbSuwRrLRRnZlm3Gvn4uZJVUDd9sZs98
         afFxyF01G+oVDpaCwuDx0Zb9YJHWoOeK7eNshz7KrqS7Jl38e1xXmZZGxRB0iYeZEKlv
         50MspAC9BBf+qi5qqm2TKzZPfIfAn2X/La763IUkhI9aAe3B+3tq38cxjqeHjbTcpVqi
         Q9MQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+GTkpmNiwwIRzbsRxuPz2o2BDlB55bVUtM0p5X3WC5P/Wj4v6gYSGSHC+qryCsQWl6DoVnQq4r80otvQCNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdj4TD4yxCWGEKgJsoaHzEYm2dDiqAMqYvdjcjqK/mjqcKMXYE
	M4q9IUpAJDlFNS74as25eZYNGlM+4zZYW/Y7rc1t46ttLh2dmnRqW9bLcXeeCehPb9NLOw6WWJt
	XwUnQJZHh0lFK0DbQotS8zm9OOqbPXt4=
X-Gm-Gg: Acq92OEkDlNuJBhPEU1A8IAVMwQ9zVrZyEBA6UAoEk0k+ndVmIh0ZsZPkAAZid2azU6
	eT0m2Dzlb30jMmbuTznGy9zDtr6Cn3eF1mQgfOaPZTqTmkBi2oEuwfup8XCsxBSrgneRRz8dkCX
	WPJNk3R/AurmTmsTz96m2W+qBZSbdpy36yo/s4nhUrZ+xiWjNUz9NQb15oVltDfkQEOQSF5AJ7w
	l1abhACu7bJGuak4b18918uz/A8bz4OsBTONg2+FTa38WscunMeYxoeLxtltdpBUcSDHu9GdY7F
	aLjSU0NSan9I97ksUQ94fctwYvikSOQ6nvg6s10G/RTtmczxKgvsp53pkiyBdPMqPCc3MdfBTgF
	tzGmHzEXSuM5UX5oCuPDnghw8SZHsjLGyyw==
X-Received: by 2002:a05:7022:eaca:b0:135:1b3a:bffb with SMTP id
 a92af1059eb24-137d35880b0mr2802180c88.0.1780421743901; Tue, 02 Jun 2026
 10:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602172920.30342-1-ojeda@kernel.org> <20260602172920.30342-2-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-2-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Jun 2026 19:35:29 +0200
X-Gm-Features: AVHnY4IH4fYj0xoH_2uVdXFMuizdXwsolNcx2uY1XAgI4kGMR3kZOlpHrAuFbw0
Message-ID: <CANiq72koYvKaUjdh6zXOfJk_=4vOQK7Y4qh17ChWPGvir9hmnQ@mail.gmail.com>
Subject: Re: [PATCH 01/18] scripts: generate_rust_analyzer: support passing
 env vars
To: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Jesung Yang <y.j3ms.n@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 7:29=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> A future commit adding `zerocopy` support will need to pass an environmen=
t
> variable during its build.
>
> Thus add support for an `--envs` parameter, similar to `--cfgs`, that
> allows to pass a map of variables to set for a given crate.
>
> This allows us to keep a single source of truth for those values.
>
> No change intended in the generated `rust-project.json`.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Cc'ing Tamir and Jesung for this one.

Cheers,
Miguel
