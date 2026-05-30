Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFC6395ACD
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780140860; cv=pass; b=DYmnM4+pdUvXXImBrba2mjHZWWrAxfpxnd3UbXAmYxFvHLTCaV2v0MicBg2zQaFfjUGitMoPWo0/kct5Qp8SnoL98H5JoaRTckDkcf0KZCLGKRxR4Xcnw6APtpKUCCivB1oDmU6GGk3ilb/BUalELOecwtMc5IMIZPTvJ49ojwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780140860; c=relaxed/simple;
	bh=7juR9p8Xv5arQajgMs8TzRWY4io96iOYQct7TEDteFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TJbRiZ47NCIXLOHTgQNWHK9iQ/42MC93PlXX5GlH51rBsbguNC1VHtGrjNqtrkZcjx18gmb61WspSrjnGiWDwWCTYJrPomAr4WF7T/culAT4Qp4wXcrCppdGQd3V7kb0NUefre301z8IiVL5Wv1b+tx2Jqn50wCT1VbxWqKt6RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C12T/7qQ; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C12T/7qQ"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-305056ac6cbso37067eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 04:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780140857; cv=none;
        d=google.com; s=arc-20240605;
        b=NhcjSukMqdyxLHLLJ5TBd2LF6aPUPimi1xEjyKvnJks+wOguWBdlUjibMUS4/Vv9Vq
         bb9+2vtReVFXKO6iTlweeVXSgHeO4ZItSH7OU9bpmYkjrp8XimLT3r7XzrMcpLEYOmq1
         25nDNyXxY0PD+uh9OKAPl5mB0P2hjfc9h1NkmY9JK9AVgZRrysBuCXDBO//7zypLFGAj
         5hdnG5HgKG3urbOtuTQwkh6KQUXoB6Z/aQtVD++L/X/Art8OfrFIOwd2si3PnCND83iD
         Ug6Vzt56gojk5ODcMI1YxwMm5Lf5SXF0iLTVA3gUc0eew8gmqaFI2vBhIDaOvXEK7GV/
         t++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yoaIvqz3mqLE/33YsmI2LMsK8ApZkxaDEDAycdVwp0U=;
        fh=E6rKE0lXrjXJTExCJgGb8sTErrAHBinDpXFeLPqVOjQ=;
        b=PSNWFP8qBkfRA75/TE6zFL0oCd0cKhL6ILpZALNAoZ097tb31qjwrw2T1cgfk/CC6u
         uRgxXIKrzrZrBBtTpZZfo3btrq7hyd1b7kg0yXc3PZ8Dsk83T6xHw7MfpnsgftVsxdcp
         63m9EFOl8lEhpQfoNl9o9AVjVRXqyDudCW+9J7ZMp0sauvV2V0mLo8ftJpaMTJFPY+Lz
         eLUhBa2Y5EeRLRBFzgLXb/3tDoRZh9NMvecCodaQNjiQyW/zKIyZigLz9fw7z1ZwW0C8
         Zwqif0wR81OBoau0OadWCBEC5tTQlN04NUeOkbSwnuS2bKuwAaZ91BSU5Xrs7MNPnzRM
         aB1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780140857; x=1780745657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoaIvqz3mqLE/33YsmI2LMsK8ApZkxaDEDAycdVwp0U=;
        b=C12T/7qQExF7M+xAh4jbzmbwcYR6l6S6usG+T5rrx4k8SNonk1+upZzrj86aSZteiQ
         KWLQt8H25JQ4/Odg1wmQMDlA+ryvfMq72Y8Ia4xin2cSEo3rlNGWLPVCxXRP9jBK+Xyi
         XrDs5QiXpDubHQLDBCH/IHVJd3/rpnsD9jmgTPPryB9V2xg1Y4I1UzQfxrF40YmFphJg
         M2EVkWFgQ2ErM0PGpCAfIECLY4eYiPTqV5HRSrH0/G67cWRSoPR1hF1M3DwMFgiy6jjQ
         uiEelKH9suYP8mDLs4A7h6XS8vGMGL8Rv+/xcdilq4uMhHNdB/HhNMvugDyYvZep4TNf
         Awdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780140857; x=1780745657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yoaIvqz3mqLE/33YsmI2LMsK8ApZkxaDEDAycdVwp0U=;
        b=M7W187fanK27HYcHh0JJIMSp0o5OVkB2Newk1+TOiW0y4skAs58Cpe4JJtHFl9U7vj
         Fk9498+exY4oUEKUyVx9v++boseVFFAdzh8uWq6t93ifXgSmxiCwx2V29Jj3Y9eKp4fg
         EDcvMO4mpeBmI2YLdsC6nhKjvZooE1B/UthfVBKF5/ylXmpfPXyMGgEgYsD0oCy29v49
         Zwo485qqVFlNdAYDKN6ie6JuB0Z0HrLW+xKSP7BwjOoI5qUlO2QKjbbIRX7o88ewPQYh
         Jd1pLC8h3InYq7FGbtbHy2WNnQpsiCHsP46osTnVDDAELpfVfxJejFAUca0lN2Kcchhg
         8D3A==
X-Forwarded-Encrypted: i=1; AFNElJ/F+osHzH2TZ/HMYlocxxpVO2GApS/EeGYkfTe+SHDx4i/PHw323nIMYj0HkP7+GpODAPHhLxm5QxvTymiS+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzunO33yohpEDSamIDgzKGC8OapIlZemYj5if4wNd9j+ajYhphc
	sznSjAgdbolO+yZBYu7hUA5G5Xo7MEFNxBlqzpeEf0Q16mAiexoSvgF1juTuJShNsHQcklXNMtS
	2n7USclOj5eySKN+F8scbXoR76LYXCQU=
X-Gm-Gg: Acq92OH6LDc+CaGOeBzSyTDaVB/EHvqGXCFdO0Tw7Yaj4nuyYsZSKdCx1g2xCWE7iv8
	1j/hJadULmnyYU6jk/UHbXsr0o6IiHnn/CJab/sVEhu7n4tiZ2gWwXK1nUlloHB/pFhiPHPGzjn
	DrVQaEOVg1T7usMr938UAcUYAOJaY/WKyC8ft6fOieyqXSH9Gvlibe9YO6sUGdVjr3ZvyYS1pya
	MF+R2CzvNdNd3awCiGqAZi7tdgjdftqQWbdK06uTj3Qgk4Af6w687RPFCOCFAjrTsUcfb631Y8Y
	ZT2gRvIwARtKECQHVRDYEEbNvDkU9BR/Xizf27yrFwZQ8vtdkEfJKUeamMw0F+ybjTEdDiQSNV9
	pC0Yo/XQWAaRC/m6u2jJYQOcuVkw0fJ1ncg==
X-Received: by 2002:a05:7300:6ca1:b0:304:8860:74dd with SMTP id
 5a478bee46e88-304fa6c4509mr884143eec.8.1780140857291; Sat, 30 May 2026
 04:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530095809.213611-1-ojeda@kernel.org>
In-Reply-To: <20260530095809.213611-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 30 May 2026 13:34:04 +0200
X-Gm-Features: AVHnY4KQK2kRwQKYuYnJGv_YwzRpnyRzJ6oFPD1S0YuI_SIHE6subfsnC0txmV8
Message-ID: <CANiq72ncuqxjjx+1SMV977UC-TZL9aPrbFECmCPPdzSLi-Oc=Q@mail.gmail.com>
Subject: Re: [PATCH] rust: cpufreq: clean new `clippy::map_or_identity` lint
 for Rust 1.98.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 11:58=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Starting with Rust 1.98.0 (expected 2026-08-20), Clippy is likely
> introducing a new lint `clippy::map_or_identity` [1][2], which currently
> triggers in a single case:
>
>     warning: expression can be simplified using `Result::unwrap_or()`
>         --> rust/kernel/cpufreq.rs:1326:60
>          |
>     1326 |         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::=
get(&mut policy).map_or(0, |f| f))
>          |                                                            ^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>          |
>          =3D help: for further information visit https://rust-lang.github=
.io/rust-clippy/master/index.html#map_or_identity
>          =3D note: `-W clippy::map-or-identity` implied by `-W clippy::al=
l`
>          =3D help: to override `-W clippy::all` add `#[allow(clippy::map_=
or_identity)]`
>     help: consider using `unwrap_or`
>          |
>     1326 -         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::=
get(&mut policy).map_or(0, |f| f))
>     1326 +         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::=
get(&mut policy).unwrap_or(0))
>          |
>
> The suggestion is valid, thus clean it up.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust-clippy/issues/15801 [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/16052 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Viresh, Rafael: I can put this into `rust-next` if you prefer (I
considered `rust-fixes`, but it is not important enough at this
stage).

Cheers,
Miguel
