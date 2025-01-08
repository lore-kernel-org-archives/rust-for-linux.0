Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF3E1EE013
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 09:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736326885; cv=none; b=SNxRaFCMZSXfQCtMYzqJydFaqTceZGKD438cZWxpL7f8aI+2jKSy2kytQrp8MYxEq7mjYq1mOPAMIXfJhGsu3g3EnQe80mFlksoc70Z7NO0FbeEXcoTZYhJz/Pny3xvs4gAB9XIxJVYVoQJPsrpeSORENVVVFxm21UTgvbPuWE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736326885; c=relaxed/simple;
	bh=/vL7iOIP5CVRNTaQX1gActeOvlJFEqVZF7QA7AIFavQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdV7V4NlxPjMQnJ+dXZTAYQMXMhDPQ2xSqBxIYprNMFtR4VChbixusobbO7xYTTf/zJmbYNS9FTIhqMFvacS6GmtV9o6O3jDzJBNqIj/KjguRpCa0cxVpCWm/cbKe6kdHHNKxtGolpFWedhvyMGl4+D29gnV8Rtb3VlTKYoAPfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GuPKEPH9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GuPKEPH9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436281c8a38so117751105e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 01:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736326882; x=1736931682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvEe0i3PRcA98OMwb3r0yMpOXq6eH0O++nSvcEmzG1g=;
        b=GuPKEPH9Umv8qbYQg/MaWzvMnu5semZwEm4N2iTwXZ4oa8iEv3GIyr9KtgbQCrmzz/
         UoM4V6nPe9oKmrmBOM4jrRAd4KRYnE0EcADJtlRqr3W1AF1FKXKGGNktd3XMRfy0ZSUn
         PmLcqQBSwio/qAFSR0Y8GUqAxaygw5kO0FmLT+k8navaaYS35D3p9I2MGXCQjhw9vHkW
         RWgodNBHVLozQKW+LMGYXZHVoT8FD/81Vz7KAh4/4R0lackD3xqac9Zb0ECXUKh+ryhJ
         zQAgApPDdIoDAM3SEgv53bWEnbAElX/x9qKoNQZ0wcmN0YLPVxerLeyX/i1UsQSl+uMH
         x02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736326882; x=1736931682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvEe0i3PRcA98OMwb3r0yMpOXq6eH0O++nSvcEmzG1g=;
        b=TnEUjUBj79h+JU52aywZ/R5/zc0Kqwz8UE1QBKGhR1Ri+4m56pZU/Q96JcYidEsBoW
         +uLM2+51Iwo4IOVOyKfzPs1bopND+sigUX9zLeeLXx6Kb1i680gKjCGz8sspH8cY7f1K
         ZkKUnunj8w6KdiPKOQdJzlB8oH/yTXUdd2iaS23bpHlltFLuPsNVWppFkEHZVaKal3Ke
         LC6aZNnjeltQ10u/FrmbSEEV2nk1/IlPyOGX7gkIx0FLNXCozy7zZGUYRX+xWL142xZ+
         iG7OIWhIndzgLPeCyjyecFnpYRi7M4Akt4DXnvdhgrFcx7HbGtc4crsM0R0XsCxycll6
         CkAg==
X-Forwarded-Encrypted: i=1; AJvYcCWk40P7g+suV+efWeK4IpLdR0iHm7Qn+YnZokWKVHdaaNtwnRwWQDepjiDNcMlBb+at+eQTKg+mxKFEAdca5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaDJ6pWKYYrAqZWHvToDPxDgW5ZIjNwoEdgTWjpVDaQUH8YSRI
	R/KCHtzdeXK7QDHXBZlwFD0sdM5he0Po4jIqIbFd1FEbNG3XGM+9YtAhv/R5SkhcTL4+vATV4Me
	UCZHxOaEcDubBf7gIIz/lP0P4IhavkfVW9WtT
X-Gm-Gg: ASbGnctmY+BSZO+lP4ClXdMwn+Dy9WKrRB6m+sp09C7wr9dMAWVeWqIQdfEIJOSLvCk
	LFfhg0ArivPPPu6pMVy59aVmkHLz0NbxSpMdaNb1cug5gC4njYV4KJjxT9Ni6zaZmGNLn
X-Google-Smtp-Source: AGHT+IENrtagmcoy/1njfzjScQiOgdp91GxQ+wHST8c0TsKpF4yxylE3BE82ytftjDDVhz6hmk5OBpx0O8I0xMwHRqk=
X-Received: by 2002:a05:6000:4714:b0:374:c4e2:3ca7 with SMTP id
 ffacd0b85a97d-38a872f673cmr1320575f8f.5.1736326881826; Wed, 08 Jan 2025
 01:01:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1736248242.git.viresh.kumar@linaro.org> <9719ba8b3a921bd9f2cb7ebf902c54c708b5409d.1736248242.git.viresh.kumar@linaro.org>
 <2025010752-vagrantly-juiciness-cd81@gregkh> <37DAF91C-2A1B-4848-A66F-3B50285AFEBA@collabora.com>
 <20250108065347.k67aqosuefcjdiqi@vireshk-i7>
In-Reply-To: <20250108065347.k67aqosuefcjdiqi@vireshk-i7>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Jan 2025 10:01:09 +0100
X-Gm-Features: AbW1kvax6GqKztlF03CCgBWB50yPqW6iEoa9XrkTHM6Vd4Q4f3ZISL60GlbBGxw
Message-ID: <CAH5fLghLxZU5e+7DOXPKordBL_TMXW-_4Bc2E8fkdt_5LSykAQ@mail.gmail.com>
Subject: Re: [PATCH V6 03/15] cpufreq: Rust implementation doesn't parse BIT() macro
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Greg KH <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Erik Schilling <erik.schilling@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 7:53=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:
>
> On 07-01-25, 10:29, Daniel Almeida wrote:
> > Viresh, FYI, there=E2=80=99s already a patch for this floating around [=
0].
> >
> > I can send a new version today. From Alice=E2=80=99s last comments, it =
only
> > needs a minor fix anyways.
>
> Thanks for the pointer Daniel. I was expecting that I would be able to us=
e the
> definition from bindings generated with bindgen somehow.
>
> The C header contains:
>
> #define BIT(nr)                 (1 << (nr))
> #define CPUFREQ_NEED_UPDATE_LIMITS              BIT(0)
>
> Bindgen doesn't get me a definition to CPUFREQ_NEED_UPDATE_LIMITS now. Is=
 there
> a way to make that work with nested macros ? I wanted to avoid defining t=
hem
> again in the Rust side.

Change the #define to an enum instead. See commit 3634783be125
("binder: use enum for binder ioctls") for an example of this
strategy.

Alice
