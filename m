Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201EB28D8D9
	for <rust-for-linux@vger.kernel.org>; Tue, 13 May 2025 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134936; cv=none; b=NMLHCak4pYY8fc5UsXdRZAYyQPwWTVZfUc/twrFRaynDvgQIUitrUW9Q3Xg8MNkMtnUVdx/cxkjHv18uX+qeTkORuwpNaMwvSV8SgRaLrEhwPIMk9sh3IwQKPZfoskFobFw4WpBWYUXPyG1hdQxKtp9GwoiopMcQzh6X854pADw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134936; c=relaxed/simple;
	bh=AhF8bIdnTy+Y/qxrf9w8y8UJ6QfJLOXbePlpFq4yrMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wzoa4h5Fe/FErqGCdTGABg+G+sOpcWvQlz2y3xBTV1ei9RNPF+WpKdm0OYBMpx3lSOST69+Y+GO/DJ/i3DDlKypWK0+jQGV5yO6KY+Xoncpy4BUjKe4iqIuW3dmJTVhXeBjsWNOvosFKvY7YZxlsmDc4fJmQbFnsWI7PvWUBtvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mlj81oyJ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mlj81oyJ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5fc5bc05f99so10534969a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 May 2025 04:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747134932; x=1747739732; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AhF8bIdnTy+Y/qxrf9w8y8UJ6QfJLOXbePlpFq4yrMI=;
        b=mlj81oyJoJ64ktqmeZOytjre33jrHXdGJmYvnda9+Wmj/Zpmlk05crvmS8y3EC8oVY
         /qzcS+cx8H2VTTuuwYu2legqJedbrvycN7e81f5uAU/cYfcQRBQ7Qk5bnoj8jOns/omn
         TixGPUgcCoAFoDm4ghAt8z90E/g7dB8Leycs/c0VEaIlqRk9lncegIe+vs7ZuCn+VTgL
         /qjENpd3vQtaLL12Ju3V5V6QbxAy4TH8qVaSFYF2RXD7vULXQH+0wLDY9dn0DHvITvwD
         HLNn+Rzq+qLgOjThI24sSP/5IwV/0zD9K4VyxWgVCDQStoPt9PkDSZzLBQhxzEEs8wtB
         GqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134932; x=1747739732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhF8bIdnTy+Y/qxrf9w8y8UJ6QfJLOXbePlpFq4yrMI=;
        b=HRq/rs8cErH3/jRGHbY+UB9bAbGNUwWpteHoYnhynTrgy8BBit9ruTyW0ZwD3IXr7g
         cp8bus4O0g0KMj9VsjOPYprL+eNgy7MB6wK5TESuIHDrSMKQjroV3RWdnWS4AKgEgWME
         NM2dMEpNIMmLCCd/opn5YKADS3Ov1xcCLrK1NDISVau2jBxD9/luN5pQsImVLbW14pyw
         7IkRgREwAEUMBhgoZX1MvC9WptcVjed7R/3bA63YUZApizdg+ebHqbYh/5MCSxki7Z47
         nvaCygAHSa1xoqt3Vbj+0+oghG7MtRf8kHtV/sayfb2vA81enOmYPwwLkvbv8Ba1iWL0
         rpOA==
X-Forwarded-Encrypted: i=1; AJvYcCU1wWB1ZzT9i9yGq4h538gZGrG6euGFI83upUj9Z7WbcSrzvfx2oGwro9mLd7cgYg9AnOO6hGIerwXBQ8iV7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ELNq/FBP3XCG5Ui8bdfNTpULoThPQJIZeAsgPZ1F8QCOCeHd
	ZydvxjZOJG0e8YnE9WDXSCkS8wgIqY6gm4axr1nw9ktNA6lXH/krZqn1yAtctjmndIUKE3fh6yS
	1QQkOsKpexe4QSllGndroxsNKdcGdcaO64liHTA==
X-Gm-Gg: ASbGncs8GDX7CO4SxvwU0JT0RU+VTLB1gowLd7GjyHgWbKkLxLuJtTizFbeeEWRg19j
	aRgdXQXN1/r+uxFfXjtUkC3DC/u3sxxHjtpEdiS5HqmNw8WjoAFla2Fp36Y2HdN33pvMRL0bxt6
	bcWXFVdJm1Foy95j8eA0njSVRMq276Yy0=
X-Google-Smtp-Source: AGHT+IGXf+iDKLrrQHjlB4FGrZFbBhRWOjCFwyUy3x8K2OYM0ZMXpOMeBMC/MhaRMSqpdupGiUbH5DeaQQlfucFHbjA=
X-Received: by 2002:a05:6402:354a:b0:5e5:bb58:d6bd with SMTP id
 4fb4d7f45d1cf-5fca0759a40mr14459799a12.10.1747134932219; Tue, 13 May 2025
 04:15:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502070109.inpes2ou3rxx2fxp@vireshk-i7> <20250506101311.142475-1-andrewjballance@gmail.com>
 <CANiq72k3ozKkLMinTLQwvkyg9K=BeRxs1oYZSKhJHY-veEyZdg@mail.gmail.com>
 <CAKohponbEEP4_weUuKkOGLRj5-1oOsoL_Zu_7W_SxB61hjsSCw@mail.gmail.com> <CANiq72mSDEwDQx6ePq20SRi40aCs95mwo6fShZ0WCK9rmiWVVQ@mail.gmail.com>
In-Reply-To: <CANiq72mSDEwDQx6ePq20SRi40aCs95mwo6fShZ0WCK9rmiWVVQ@mail.gmail.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 13 May 2025 12:15:20 +0100
X-Gm-Features: AX0GCFt2EYzacWRAlkaHJqajAcqqOrheeZjX9e1wO3lRfd_bCajvJq8aw75ONa8
Message-ID: <CAKohponPm5z0Rdy7FkYoo+YfhfQtfUUE65Oq9kYVNaCLRVPNUg@mail.gmail.com>
Subject: Re: [PATCH V11 00/15] Rust abstractions for clk, cpumask, cpufreq, OPP
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Philip Li <philip.li@intel.com>, kbuild test robot <lkp@intel.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, a.hindborg@kernel.org, alex.bennee@linaro.org, 
	alex.gaynor@gmail.com, aliceryhl@google.com, anisse@astier.eu, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	bqe@google.com, dakr@kernel.org, dakr@redhat.com, 
	daniel.almeida@collabora.com, gary@garyguo.net, joakim.bech@linaro.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux@armlinux.org.uk, linux@rasmusvillemoes.dk, 
	manos.pitsidianakis@linaro.org, mturquette@baylibre.com, nm@ti.com, 
	ojeda@kernel.org, peterz@infradead.org, rafael@kernel.org, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu, vincent.guittot@linaro.org, vireshk@kernel.org, 
	yury.norov@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 09:43, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> I can still reproduce it on next-20250508 with defconfig RUST=y
> KUNIT=y RUST_KERNEL_DOCTESTS=y and then running in QEMU with e.g.
> `-machine virt -cpu cortex-a53`.

Here is the full log from my side: https://pastebin.com/u7UK58rQ). It
doesn't report
any failures.

Also here is the code we are talking about:

/// let mut mask = CpumaskVar::new_zero(GFP_KERNEL).unwrap();
///
/// assert!(mask.empty());
/// mask.set(2);
/// assert!(mask.test(2));
/// mask.set(3);
/// assert!(mask.test(3));
/// assert_eq!(mask.weight(), 2);

I don't understand how this test can fail at your end after the
first three `assert!()` have passed.

--
Viresh
