Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009674;
	b=r8HaMxkGOTHRwUzbw9WM2rtWiPeuumn8LbskOgYOoEbhfBxsTgE24M9wkS40QPI73Iln
	 2DHieCwXuibICi4yoDalMv8AxZqU23eXy0Qb1nVDq9uda3h7cZrVEtu3AV2LvYJaeWblm
	 C7FiIOzwtNfW4BoIvweyTyoK/gtpjvsNelHdPT50EDeGSU3UKufCqlrj01/pDixW6vlOF
	 X2TsPCgY2dzJuY8BGg5COoaCFRt04rGwkuV7IernHE/dUD7yOZ53514E2bmsiy/q0f8PF
	 ywncUAKu2Op5yI/YN+jN4pldFygeONI6AAVymizD3oEfGe9TNpb94hK1W4Uhe7VirPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zquXBrMDSkgmhzVSBU9n1JfbEE6tjoTWMroKtZE+aJ8=;
	b=b5CNgKtkNYOtyVyuhoBWQupFSOe4cK6q88gMiJGcJS11smM2WVdFXka3OP5JFGh0BdKf
	 UoNK3TvwO6YqG58wexYBa9MiV2+vZd9qQ19epz50MT/RmnC1cjBPjT+tWPGjmgf2umYcC
	 aTCYjPeByouALevEP/qDXhDhQJ5gR2UEM0qyNlmDuqP8HTNHMmbCe2ASD1G5Z2xz40Y6+
	 0oGGQJgWep6xdQiXOVNKg7plWrbvJ4l/QD+V2KjpJ93c4clkc6hyvFtsZsxGTpTwd7+2o
	 P5amjI87mH2I/aefo8LCWWWenDjS76mdlybH+e2jrpyXTeJmxfn2cKBuKKVy2McKsDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VTi+CFM3;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8786606A33D
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 13:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8786606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VTi+CFM3
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e1d839ddaso642036f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 05:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795009672; x=1795614472; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zquXBrMDSkgmhzVSBU9n1JfbEE6tjoTWMroKtZE+aJ8=;
        b=VTi+CFM3r96ENufgUf1BqcL6oF6r8eAjhz50y8tV4dBbtCWsQYlSrWVc9xQKUvbKC5
         X0BcAjgiGtS3p4ezRH9yLP/L9XR75gtjGPDGBmtt3X2mgFIixhYAq1jItVf8T+1KTiU3
         l6yL5B0ruXP09ejvczDzmfWGsnLQaV4/PnsONB0m1ghoqerB4pMFY3Af41GgmVFXMXNS
         YyRkYnog584Oy8leIF/0nbwK6L42giCZD48stK7Q0sucf50uEfN2R33jDMvq6mo9oW7+
         d2lYNXLylRILKoJCz4dRzSTo4D1yJEIUE31B8I8sWZQsqixGdzViclQLFTF9cd+TwY0R
         ml4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009672; x=1795614472;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zquXBrMDSkgmhzVSBU9n1JfbEE6tjoTWMroKtZE+aJ8=;
        b=vjhXyc/RbgnqjyUKK2LnqjyVWgJlejNMCbgB3OA2Bqn5i7Ppp6RmWeYDrSnztVZlaM
         /4Mal1Orl5gt2OBtPEvipH36IVBRYnd+5He329QMQJ9JP8eR0VuIyO12lLdLYSX9ymcZ
         gRBn8KMYJFVFpac6TYbqq84xg+QHvEIqWBDxaASpjURDKCi3JqvIAEyaL0EGB+5+VWvt
         ha1Y9HYiotyJqzoP5pVR/nMssGRzqEIslGWdQqxfBh7MnMz20pJABg20QBI0uIm6juTt
         d6XcRDcHOGWdWNT+MrFarcTE+vaNOAUYqnKKIDQefefAmT//wMYfyJ+tv2jbZ/SdXQyw
         wDrw==
X-Forwarded-Encrypted: i=1; AL+hErGzve/0QEEz4+oSWmykaD/Mbj0TskxA4kQgrzrsj4OeqV7tQrKeI3uaqH/yvFyllFRmeRUTLcNVcnZSe6z3nw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xNIpwcVcZTuM6SwTI2KNI4PJC87Rn4jnj8RWnU8X9meuiS20/
	2n0s84P2kYUfcKLLbxsGDgNNze0Dyz/Ef4fs+7z2cApj8Q5emwgyq2Tz3Upmc5LCgGWENU6Lpvd
	jC0M7q5l4gQMa8jM4VQ==
X-Received: from wrqt12.prod.google.com ([2002:a5d:460c:0:b0:4a4:28a2:fcf9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d84:0:b0:4a7:150e:cfe5 with SMTP id ffacd0b85a97d-4a7150ef4dcmr3970052f8f.42.1795009671601;
 Wed, 18 Nov 2026 05:47:51 -0800 (PST)
Date: Wed, 18 Nov 2026 13:47:50 +0000
In-Reply-To: <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com> <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118134750.658250-1-aliceryhl@google.com>
Subject: Re: [PATCH v6 3/7] rust: clk: use the type-state pattern
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Maurice Hieronymus <mhi@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2026 at 02:07:42PM -0300, Daniel Almeida wrote:
> +    /// Drivers that need to change a clock's state at runtime (for example to
> +    /// enable it on resume and disable it on suspend) can keep it in an enum
> +    /// and move between the variants:
> +    ///
> +    /// ```
> +    /// use kernel::clk::{Clk, Enabled, Prepared};
> +    /// use kernel::error::Result;
> +    ///
> +    /// enum DeviceClk {
> +    ///     Suspended(Clk<Prepared>),
> +    ///     Resumed(Clk<Enabled>),
> +    /// }

Nit: looks like this doctest missed the vertical import style from patch 1
(and `Result` is already in the prelude).

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
