Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747E33AFAE0
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jun 2026 07:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558093; cv=pass; b=NuRQ9Ko4ioZom7tVDX2hIf5H7Y33/BeXgESxnQaGcFjKQqIvZAW2ofIk6d5D75ZOLWnujAJJAGjxLbHndbzPqYJGdj5/k/1fcxX08XmZFgOmuuua1WsdSPEpJULw6QAemn18TNlmsr2+2xLDZ+ikciundhtC99XL4Dtf7oeHnr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558093; c=relaxed/simple;
	bh=9BRFQxXjY1k2RdP+jwj/2G9funm2lNm/ZgWUqjbg4d0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJG5oLWdJC63mjHiAbLcW23+219vacWlvUQldvQwVCHYTNfBCKzPlvCq4eYlOJRLB8/WWyTOe/9rsXKH5G4KMTwP6StMSwHgey13oyhjp3cwKs/DIxundnkVGsTeaNR3vUz5EO2BOL7/5IxEtYp33SAwCDD0lgo4HzruihQ7rZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnF9PgvR; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnF9PgvR"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304e5d3cdfeso21573eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 00:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780558092; cv=none;
        d=google.com; s=arc-20240605;
        b=d6xqJgTJDk78dXd7gqjDEx9wLfGZ5F1+y2tKH2tY5GMBc1HoSGBHtcMuLvRguMxXkZ
         q6xJrgL5JzKAd78v6QvjBnHVLwh8BZPnoTYT3tvbNhAzVT28ceX2Gj+auiQUE80BuGDM
         +i6hKTjzYBIRuHqGP5oGeoqqcK/nYg5olyPuoAanlrrKoMVmCMjttMaF8BEtWrnMYE8A
         ytZUxFXGfFpgvPzPaV+2IP3WKvftqAGdC82lbQmlMne0XC6t7Od4lQ1FHbfnM5Js0tJF
         z95IisyuvHDv7fsXTm4RqQ2wR62tKBrcw0ileE6lgQMjJupT5K5cEpkBEvYq6cDmfUkL
         siPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ni83wS7JKDvHsibcin5DOIqjeZAyCeU2HWUB3Y7TJ/g=;
        fh=OzaMUSWeLVkiaeKe9RzovLlKL/lqM0Dtyh6UK+agqpk=;
        b=L9L0Lj0RAscbdu1W5kaIcH4WHG1yn+RUDoDLoWd2HAtVlRUpcTts8hy3xDWloTrt01
         VUpTqmwVXE6PW+UavlnvRhddz3IaH0QlzQ2FVyxAJ+yIpfJFtPLSjEqZdzQxmAN4Jkc5
         85NF1GrrAsiPhS6F1ZumodUthay9uagGiywemYYGz9rsHC1Qaxf4uRhpj85CisJhwbs4
         oCHeV5sGq5j6smZjIAQlpuqtuTg/x/TnWM6h0xMOEayyHKfvDt5VXy5KQIXttw8kwNfV
         yCvrk9E9QgY2AhvKlZu4wbsfJvFghav1HJElIipzz+MTDhNs4pvZZLOw6M+sDINjsAtp
         FYmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780558092; x=1781162892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ni83wS7JKDvHsibcin5DOIqjeZAyCeU2HWUB3Y7TJ/g=;
        b=GnF9PgvR9onQIrx7jWHRz4opmVmZrlPARkgcnBYwJAPbzhWe+E0W7Q7ztJwnVdV6Rl
         thAU+sWnDNsjvaZjC4ctZSMlE43VSwtC2xpfDdZsUvTTfxK0D2zaSJ5VHRAxo2NYkXqX
         F4dVcFp8gU3DPTv8D7o4ZweS65Txa8xEpF2NzW572o4gTxpzsgfuUuwrVbkAwaYFs5XF
         RmLSTZXotQ+b4DhOBvHtM/AujxQoYByW/Vgr8vhBYc6Ypz4khU+oVxsKG5y7Ka857Peg
         D4jHWEYqgsG9iwndwJMgsT+iuRzXV/NYulMCxP45qc+ouBYtbJl4Ctf1jNX3kLbDQBDF
         PBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780558092; x=1781162892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ni83wS7JKDvHsibcin5DOIqjeZAyCeU2HWUB3Y7TJ/g=;
        b=exdJmI/UBRv2g31LY6ylNT+fB5Zsqb0pJl3yCDqqgWO+Ckzo204evKpabE5aahmM3P
         aigMltbypeM+Zh+qj4lLAxSjXzyGj0JI2XDUH3fYvGq15UqZekQv7vqWOlzPLvUScnaB
         UKqE3qGFDWG/WF6ehuPCC7+oSOrnWNV/n8U4yxiCwuGgySLmP+HXZ0c133QMvm+B77+Z
         8lFSAfClP7mQC0qBSfb/mtmhWD2WwJr8IfwujaXME8VWxvsBmtBm4yiJECmyXgVISTIl
         fVE9ropwRvDbw9iraQVZ6mOuhYkGkbM6iElBOHRQ/xdwFF0GfuWwxJpmXSW2NIGjyYD/
         35zQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vUDh87lGqduUnStItJRzxaqCkO13cmHsgI4KuM3Zdf774HXGgUoLLmLCTo+gNn3XOts7z47PuLR8vvuSOGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsoy4he4cngt8Xd/h2H7q+SbJeVGdodKkZSet+iNtrN8hdWeQP
	A0QMTMMCKMRYanb/kyGUuAFqi7SaoKEGtA6W4lBeRGp3J+wTfdPNYid5xqUDKCe2JUgsi7pMpw2
	1sS0UoJBywbdULTboPaMR8M+uFGa+oMw=
X-Gm-Gg: Acq92OGsMhJJegLjyWWUK7WfmaOCLH00MGMrBm9aw91GOHOVKraz/0ratqvkXLaEwNU
	M9IjEHbE2LSkQAP8QJ+fJeNYoNk0N8c+Xn/xhLZ1nrLtBtDZ6Es/LmG8adkdH5w1QHF8hu1k/90
	PoxM02kzA8mAkj+r82zvtUbbDle2sVGDfh2tUg5sZVRndA95LmKbKVvV8/m4zToL7rsVVBFwa6G
	4BiISdVwtar3sdGuYMZo1MAf8gCKGzH/T65qmxSSD3XZlxk8U3RtPBBgPwtz8ydMIMBzhYRdzat
	75cvulqcubY6nyy7IkwU/h3VxreeWp7oo+D+B0niwhnoXgDH5+/ra4hnPOveDHu2FnXUaTSDA8L
	Tt7I2q38lDGloeXW9qr0gEYHgU/S/0dxt1Q==
X-Received: by 2002:a05:7301:1f15:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-3076a4fe74fmr322506eec.3.1780558091555; Thu, 04 Jun 2026
 00:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602151638.14358-1-ojeda@kernel.org>
In-Reply-To: <20260602151638.14358-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Jun 2026 09:27:58 +0200
X-Gm-Features: AVHnY4Lm65x6LZu6zOIIfGuVu-Hof_j5ErOVEWYGfSDESff_BqZowlbGgAsyimg
Message-ID: <CANiq72no3MBBFdV5ZVK-wJrzixwnEkrb6j5QnXMYuZ_=Qjp+bw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: rename flag to `-Zdebuginfo-for-profiling`
 for Rust >= 1.98
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 5:17=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Starting with Rust 1.98.0 (expected 2026-08-20), the
> `-Zdebug-info-for-profiling` flag has been renamed to
> `-Zdebuginfo-for-profiling` (i.e. one less dash, to match `debuginfo`s
> in other flags) [1].
>
> Without this change, one gets in the latest nightlies:
>
>     error: unknown unstable option: `debug-info-for-profiling`
>
> Thus pass the right name.
>
> Link: https://github.com/rust-lang/rust/pull/156887 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
