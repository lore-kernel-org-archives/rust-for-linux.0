Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1F61B0F19
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 02:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767493936; cv=none; b=fPfrwfLLU8MK6fUNMwA1At8LNyYTuUJm+fJIesEJXkeUJnyBgke6yl8318hsHBl1E5R6YVm5rOVF2q5gSBxe6DnjRyontVIXQHvDwUFcOm8pE3QYPRxvKpBqQkurwUoUeRs6byFAaFn90/0tZ6TsXd/QxAnVBeKZOby38UI3TkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767493936; c=relaxed/simple;
	bh=xcM+YLFUx8G0Il6VzzTwhnM5NDW1r4MG6MfiLKv4KeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O9XURa/wNq1A/f/0AydKRUROVtZcYkg6y2tNoNRk98nfLvEjfwaOrqpp04r184HNp9wDKPp7ZSDZoD2tmWJZ3lhbGEpArvPDd9dK4OXgCJe6UMbFchvmVf+gatqtKavNSwcSpYZrgsNK0OIrNQcm2X3O0kFdyIPcis26qLr/Sm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMWx9q+c; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMWx9q+c"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-594285c6509so14360507e87.0
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 18:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767493932; x=1768098732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRRDR0RGwV8zJoNlbb9Ju5idJudLKXD8B1yec8aLX60=;
        b=PMWx9q+c4PbvEKQ5VWVDCLHvYgLkNHjZBlbhSWqtQkizNJltEt20do1ViNwkbeLsmP
         8bARF5RJVQ1p82s/UbUxw0bdRnia37uLd3ukV/plomZWv//AM7PGmLKzSnKZc/HXM04i
         kEpN6XALqcQ2NZD8Jr6ThYiRQKc41J7YO6uaNqaiTGtltFQbtYD9no2iuj6nxbXsnlnM
         wWjcVjRjbIEg+yewXB4xJmOxfxNPVH88to18/1QJ9B6FpHuKxIVaQEblUE4sMcRtS7mn
         S9rkrbjl8dC8Bu3RQBmHtDra7FjP6ii5ENAoVKwMD0L6tk70zROe/WgxqwKUrtr3oWZ7
         Uq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767493932; x=1768098732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PRRDR0RGwV8zJoNlbb9Ju5idJudLKXD8B1yec8aLX60=;
        b=NgHIMsui3KzFk/UnJnYfeJAfEzIencEDK+mpJDLJ1V1L/Cl0wMRsV4wbcCAluwTMOI
         L2VfKnzq+Bg2Iz2zF2v29QZ7yDe987QOb1htEdlT56GqSiEhLqaxYKL8Hl3qdKS1t/2y
         SRRtuvrvAfMmk0zJXwBmt7Y9ay5YiXAIdIESCTps2LSLha3VaRLKvyKpvSV7QoJQu3DC
         IKrqsOfLSSowpzqgfSPqgwYNDrsGRW15zLJUhmfP7TcHOtz6UMB2Gg4tDRIdIiPgEAa7
         kXn1OeEopb1vojsjAhbItFhOrkhdnIGL4fRul9m650XwkjF6JGmN7CgrCHREEKj3WaKC
         R3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUheCeJ2pMYrdtTYaeQEN0JnA1xxd/L70E3QbOcVW1ZOSPX1KlmDqoDI7o6RWJXozHE6NtuUuOqnveLqaK/hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDPMXdbFa7yF1JImlR6k7lz2xVJna73Bn9K0EyGtOmebtWCNLJ
	Nx35UGCIEq2AFnNYQSIZ8EVbT1r6PZ003iLaju8sdhQgoG+ZT9RL9nHzkCCuS8DDzg760G+tqiX
	qLEUPCQPblhYwde2f5Ponvro0zZ/gs1U=
X-Gm-Gg: AY/fxX600veH0oo4mN1TcJMYiuiVGhzWm5LGiuuEW/ePWbOE+jl57vBM4bTg1T6b2X6
	VoJvrS2Q7xQOUWY2/gJ085rpXiz7WE+gmR9QnM56tyEPX2MAFvnmyzU1Wy4EIVTG/8T2J0ZrQ2u
	AtFpZucV9MUuRzFxEXBi6CQH68g2I7wQAOiPK3yzGim7WaKBFnrEeec8e0+Ye5agMW+OT2el0wJ
	spiB0rQ9MVgP89ds1PXwsW7aN/8sajrrsD1gFpbOexNBcaAzcoj3AevnzastMJsLivhrEJIaMEC
	5/3ZuvUoPI/97KJJZFn8GTaQ2RDeYVGa3I7UEmTymR0n7Md6EFudIGCdLYBsW0n0cslIgQqi+Wk
	L5ofMQBHK1p99PdUBG74BR1PF3nFfsO0Mt/4TvlxLzQ==
X-Google-Smtp-Source: AGHT+IELCR4Bl92Ks7kkheBZ9OTIGG+ewGhSD3ldOmcO++J6QAm8jenR0KGpzbz8OcrdZJ8zxSNacE2uInicHqw18Cs=
X-Received: by 2002:a05:6512:3088:b0:594:2e7b:6f9 with SMTP id
 2adb3069b0e04-59a17d3df9dmr17434108e87.27.1767493931905; Sat, 03 Jan 2026
 18:32:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-cpufreq-v1-1-2d99dfc88cbb@gmail.com>
In-Reply-To: <20251222-cstr-cpufreq-v1-1-2d99dfc88cbb@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 3 Jan 2026 21:31:35 -0500
X-Gm-Features: AQt7F2qDqrCh6YZBHksL2dCmEjW9ezDLpdifIRWg3bBC_CeEcK74u_6KV4PSzvI
Message-ID: <CAJ-ks9mgxBhiOo=zoV3+gQeqndiJ1giQNp+a6vzCGHJRncEAHA@mail.gmail.com>
Subject: Re: [PATCH] rust: cpufreq: replace `kernel::c_str!` with C-Strings
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 7:29=E2=80=AFAM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs | 5 ++---
>  rust/kernel/cpufreq.rs         | 3 +--
>  2 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt=
.rs
> index 31e07f0279db..f17bf64c22e2 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -3,7 +3,6 @@
>  //! Rust based implementation of the cpufreq-dt driver.
>
>  use kernel::{
> -    c_str,
>      clk::Clk,
>      cpu, cpufreq,
>      cpumask::CpumaskVar,
> @@ -52,7 +51,7 @@ impl opp::ConfigOps for CPUFreqDTDriver {}
>
>  #[vtable]
>  impl cpufreq::Driver for CPUFreqDTDriver {
> -    const NAME: &'static CStr =3D c_str!("cpufreq-dt");
> +    const NAME: &'static CStr =3D c"cpufreq-dt";
>      const FLAGS: u16 =3D cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufr=
eq::flags::IS_COOLING_DEV;
>      const BOOST_ENABLED: bool =3D true;
>
> @@ -197,7 +196,7 @@ fn register_em(policy: &mut cpufreq::Policy) {
>      OF_TABLE,
>      MODULE_OF_TABLE,
>      <CPUFreqDTDriver as platform::Driver>::IdInfo,
> -    [(of::DeviceId::new(c_str!("operating-points-v2")), ())]
> +    [(of::DeviceId::new(c"operating-points-v2"), ())]
>  );
>
>  impl platform::Driver for CPUFreqDTDriver {
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index f968fbd22890..8be634eaabe9 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -840,7 +840,6 @@ fn register_em(_policy: &mut Policy) {
>  /// ```
>  /// use kernel::{
>  ///     cpufreq,
> -///     c_str,
>  ///     device::{Core, Device},
>  ///     macros::vtable,
>  ///     of, platform,
> @@ -853,7 +852,7 @@ fn register_em(_policy: &mut Policy) {
>  ///
>  /// #[vtable]
>  /// impl cpufreq::Driver for SampleDriver {
> -///     const NAME: &'static CStr =3D c_str!("cpufreq-sample");
> +///     const NAME: &'static CStr =3D c"cpufreq-sample";
>  ///     const FLAGS: u16 =3D cpufreq::flags::NEED_INITIAL_FREQ_CHECK | c=
pufreq::flags::IS_COOLING_DEV;
>  ///     const BOOST_ENABLED: bool =3D true;
>  ///
>
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-cpufreq-725cd36ca0f1
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>

@Rafael could you please have a look?

Cheers.
Tamir
