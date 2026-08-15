Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4351031A56D
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Aug 2026 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786787259; cv=pass; b=HbFntgF6pf+zOWLivCy4T1USEhpNBMsLqNi8CN4qPH8oqsvYqRpau2+u5VoTf67uaR1nhllVq1xA/cy85FOReiFQ6kAGi64BhrGA0qWgJzJOJHfpbH66SBjDB4DzRXgd8z/quWMI4xGOw2/WaPR7b6eDZeHESadtOpco1nI/74A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786787259; c=relaxed/simple;
	bh=A10tEUAy0J/eJt/6NCDSD2pQewscaevQo9UVF21SsrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i80TAFs9kmn2WiM3g9LonmreGnp+/pE2luEYEH01ZYO39Q5OTRbB9FpRBCo4hLceW0RdgrzbFslB9GL1P8AexlAMLQixMK3uKga4Qo42gtigh3zH2eqxfUvPHWwktwvIZ2rae7sqiqBJfpcoJQQdXBFdp+YoQJMPoFhNGuAEpyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTtyWapz; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTtyWapz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceeee8c46bso3993495ad.2
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Aug 2026 02:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786787257; cv=none;
        d=google.com; s=arc-20260327;
        b=D2phVTWfZWRuUFXo9IWS8Inx8oo4dWcCjfe95FUbRGhOJ0sIbjohcSEC5yebEP4+pg
         A2nf+dwZCQUOudRMFanthcOjDFuvuqAIFZttWNpv/zBaXYaI7tOgbKyrtceDCMf00jvE
         dvugZ6PdEmVZtlEitLMAJ25RYYbMo8LxbX5O7dXLEQqCplNiPCsVoeC6lpEcKlHDM52P
         96R6jk9jr+41CY70pCr55Gd9cPvNqcigPO2dtVuiwZW+Ke6uRczMdR6QK5q5PqiHkXzu
         3G2huy0SuxTA3m/QHxwIvgVxnlF9T2nnS0tfMcVO55I2BGaDWBHes0i0kHhytvlCkW3k
         2utg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cSzW5v6LopkgVYsyHDzCvEaqWdekzkzFKvdIf0+cXAE=;
        fh=sdzw0owK7BFjwVfeQ5Ab0GQhQNY5/o+7CamakFlu7S4=;
        b=DH/mSVWEWBVqa1Y8+C3CrkfgMUCMqtlt0692ZCnAT8f9sFHBuqQgEi8TXTTllLFOnK
         qoZoUfgrhwM8Gf4nXZEv7uw6zc0KqiQVBya3XcTRSKZqbB98ZaI0w1LWnY0HiUIWKjRN
         JFAmoFcw/zjAPDBLA0l8aXK7Vt+XRFp5C8nrgpDZWkLeGDPBuSX46MtGFVhswUf9LOn6
         IdafY8sXxO4aRT3XzK5oDKNhiG4zPSN3MxZaN5/PxHpxC1/GXKbB7xGftS0rGC9iIen5
         kcKOrBPetjYNtOY3lw30bhF02kY22o1PtczdoEEVrYgUJb92FOVRrSW0UfirCPQ6nByA
         qQRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786787257; x=1787392057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cSzW5v6LopkgVYsyHDzCvEaqWdekzkzFKvdIf0+cXAE=;
        b=GTtyWapz826r+DOw1Xkb8SZ7EUXxgLMju5P6MQNvubBW+gYQOYQtpzXbbDy6LYQzyE
         U9DiUYypGgG0Pv/afJVmzY44DNCoBQ1IhjljYAmWNOhd/9A1xxQ5wcwDXomrm9y0/bTm
         I+YZTNvlxPUdNfpWf+D0Fa2Pu+WMF1imEcvdaGgi3yzo9U1cneVf43KoSo2wVYsqjc87
         xRUnsGFShhLbIs2lGBF0pBnT1IyYqil+hrnBb67Wf86iEo0X5+rGKDiHhnNLy4S+pv3o
         YOHcdmKSO/vi1im7qI+FCTww2UDG66N5VLmymXimvlV4gLc0bqqgdy/JoIDankeBOaoD
         gF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786787257; x=1787392057;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSzW5v6LopkgVYsyHDzCvEaqWdekzkzFKvdIf0+cXAE=;
        b=CU9BYgm+6WjJ4HpFCtXl7Idf9ZFUXCHLBaHw+4yuULFmK1nR0u3bnqpStwygZWJ2or
         PFeVv2lOaJ8U6XpIGbYXIAVTOhiJE5qXyKnDVgVC0O4QIMp3x6atKXGZ9fPRGW9s2DfX
         fyUoaQV4LpFCBJa45itrv91+GJ1vuzaPABEl58lTp9Tor7AI279T3+TMIcoQ2de2KvDk
         6DKhIlj+NXZE6lAn8u+scsOIcO3JEpHUlxDHO1wFrX053wdpeHcVL8Oi6xq7YhAEuFMA
         rUCp7gLidGv+stkThsSO6VTR05oO3plU+0q95VzBcoEVnHPXiL6tMCY8vN2Wwm2H6xF9
         bTLA==
X-Forwarded-Encrypted: i=1; AHgh+RqojTcR9qT0wAcd0RiIUd/5cnkiK0a7mpWKFD25KauPKZTSqg3jV3xvKiI54qCMFRILsLXxB0fj1olNlD7DpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwvCla8lLx//iFp8sxqDKqYFWK8LOPyn2cRcj4GksO2aQzM6uN
	QY4aqfUWghW567XeaaeU4GxuR1VKF6wv0J8IXzSWLUxsLhjEjzqDZSu0K/I1z9eT3UMJD1QM7I1
	/6+WxsTLt+/t8S6H2J6q4tw8w+lrP3QM=
X-Gm-Gg: AR+sD11lPsu62tR94SNfHytHgISI+xcvZR5HM1QoSrgdMsJ2VuAI8TohcjxxVOei2Q7
	YJ/I1h+7mLJOHUfbeqbs+6KjpDbEUSBI9Hakou2XKDCgTISE7lOFnRrDfoztvE9elk9tUKUWYUO
	yZqwnJmTO3EPTTANznMrXVAFb0G/4hA8QuWAwvGWh72Vm22fuF62Fdy/l0Ol7DNqZOyhqzk3BCW
	gyGioGBNpqqExD9GJZmdG43O016xJJlbeSJ7qq+nn7eF2gRZpGS5XBDnExCOSimJur/B7LmPefH
	GoCu0NGglUP1ZETd099mzwusLCvTj8i2GLesiPnRgs2T/V4dgYtrR8Z+m/7vpmDWbIXIidBxqXg
	dYB48Jq9X7ToCtLD12fHHGfo1ra7giBWEjplU0dkuVs+Zbzuk0NhA+8n0+uA9fzKfnFSFF0PP
X-Received: by 2002:a17:903:1b2b:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d3b0739429mr95810945ad.0.1786787257496; Sat, 15 Aug 2026
 02:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815-fix-rust-bounded-from-bool-submit-v1-1-882227bf40ba@younes.io>
In-Reply-To: <20260815-fix-rust-bounded-from-bool-submit-v1-1-882227bf40ba@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Aug 2026 11:47:25 +0200
X-Gm-Features: AcwNN1Vyzam60v46TuT2IRWTGvdbWAku89D1Z-Sv9_ewh6l1xj9Ps99KHfoQpLc
Message-ID: <CANiq72kAkDeyqPKHHMT3gRNyC35R+934jNNQOKKytMpmwPwLCg@mail.gmail.com>
Subject: Re: [PATCH] rust: num: reject bool conversion to signed one-bit Bounded
To: git@younes.io
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 10:07=E2=80=AFAM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> +// `N >=3D 2` cannot be expressed as a trait bound without `generic_cons=
t_exprs`, so enumerate every
> +// width supported by the current `Integer` implementations.
> +impl_signed_bool_fits!(
> +    2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
> +    17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
> +    33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48
> +    49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64
> +    65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80
> +    81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96
> +    97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112
> +    113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128
> +);

Hmm... Did you see compile time suffer with this?

Cheers,
Miguel
