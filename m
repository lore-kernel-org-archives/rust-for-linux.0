Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4495F45BD60
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925516; cv=pass; b=HZ61F1nCOy7ur+lBLMawF7XkoFGCKOJbBHIFwjzBsGqoLeyNT2R6LsU/n7ICc3O4oThcS7Mydu6aB2ZcH5+ED4DGQUVSY/tB7fE5sD3WrLLcAPD9zng82tHE4HLLyZ0bl/1rGkiTaf+kh1p6/UUC1qbUvRv/TSTT4hHgVr5rDlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925516; c=relaxed/simple;
	bh=O1jzOusIB3PPgFNUk1IyhqGT9JHdCnGfwYziQOVYaHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVbFfPyPPHl6yv3fls7rbsre5RoK7P3oYz/HYsNZeCACRILKqgNogju7dbLM+ecFH8xMAPoX+0RwUJYkz59gcabEF3pYlBYrwXeeGwTz4T/+drtnx2MPbzVJO34xtSIEC+u6l1bzn6Q1y9K/LJUi/9udJP7ZzjtFqPstPzCG4BA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6zSmUBv; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6zSmUBv"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b6a868ad45so445764eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:11:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768925514; cv=none;
        d=google.com; s=arc-20240605;
        b=lc282yCGZh+JJ5Jr6ISy0HdHKWFpj+8PNoHUicqnGcwqEgaOQlsWa1KyVQLhlnZaYk
         mGVPXNz2VhC5yoDPqlZVyolN799iUG90jhHE6Tj/s5jwIYQRyqeCtH0M0nkFl2xhYxw8
         vw/TB9GCaTwZbhISabFP1w2C3Ev5FwJZwFTLqmcxy+H7h7wB19C5CD0t8aU43QGDjcXv
         jQM9EvV8hknT1d4xRWwOp6s1rx6cEoCnaUMq1ssmrIZ3dWhaWxg4+ubqLsYZnq1Maxmh
         u73X400ZhBlkL9o82Jyw2GeHfHSSx2VFF9d/tpOXNAWG/b7VHC+0qpWHS78etnLy4ecY
         nRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O1jzOusIB3PPgFNUk1IyhqGT9JHdCnGfwYziQOVYaHU=;
        fh=AuGPu99wCMOe80kpuwdXTdR8ZTWzBFJmTRqeRqmT1Yk=;
        b=LD52iMh1QL80Dz3zPW1DzZl/0JSQAq4+XCaaq/ogaguWAd2eQMOYHTksOhjkKFVp9j
         MVBDrWkOkdiQUwJTwx9s7K4t/pBN5biWYeoOAdyq98GGAiNopzN8pDu1PIRhHWxWCOnt
         vxOKdGDKo/i676m8+Vwf1EC4NF9ITKUfhiqdkhV5SK1CnQ+uEChVIB28C8hcbgFShLtH
         VZS4sfzOW/Tc20Gm9MA1AV2JJI9MsjmJDUDmNfG8r7B4mxPT2FDmSFHCkpz1kmtBvc82
         vC8EbUERcPWtHtNfI69nPB50C0G8msK6YUS+S2oY62EXFwyVPQtj/0/ehyEmy+U0rAoK
         JXwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768925514; x=1769530314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1jzOusIB3PPgFNUk1IyhqGT9JHdCnGfwYziQOVYaHU=;
        b=L6zSmUBvw9C0t656TBuaQjgqlxpLRYBUYY3MyMbTAbp1sU5eriK2FBnJubqEK2MPrJ
         N4R/NWEKp2XxQSOCtAhW1U1fHNquhcwcSLq0Hr8WKmmtLBlZ8bzpm4BAI2LLElY318+8
         iZaxyFaV6238K4+iZkNumy25GRO/iTq9KVXn3p2t3llOX2iRGtb+aIyYLC/pf7fkBrw5
         6wG6oIyQzJnru8jlMClLKjL++tAGzeGNg9e840I0zMzlvgCCIR/GFBDT7XvjcBqwW1I0
         cRkszYpjU+omTc7NHPQYDmkLm5IbtnY5C2XMcGsdefHipBYWiQJZWbi0clDRM/G6xRbZ
         DOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768925514; x=1769530314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O1jzOusIB3PPgFNUk1IyhqGT9JHdCnGfwYziQOVYaHU=;
        b=HZ9GlDxScA7Cdcd4P2dWH23PPXpjra6VCOKG6ZpTuOnZj80k8b5Vjtam8L1U6fovEP
         HXk1wmT8YNuEgK46xeHBu/0kQRWHbOzdYEqtxIN82bKzjmtXR546ExgoGhS5MJjeOkXT
         jH2Dy2KYTOxSBxi6Q+tQMNDjRppJkKjo+hy410VDfDgO/gsYs9wZKRM2gJ49sEosnqI/
         POtQQWNyWwJOncdkYEO7V5h/uAQHrIjUXh8sPSonKQuGHohZ3CmOvFRrGDqW5j3JKEVh
         e0qyo9HBrBriQ8Z5cs6EK+py+VzNiuafaRxjoPQPu8vIeTyTsTeqvZe4orhYShVTkWXD
         l4og==
X-Gm-Message-State: AOJu0YytWc9DEZqBBg2h5/lbnYFb1C1jGDj7gEKgBqjhgFzJRHydOSpe
	FoNxGl1G6LiSug7olf/nyGA2e0ky8wT6ooeOEfO/fNAAEVJ2HvHr3aNAHojP2lk4J1F33qt7W/u
	usYYcgYZR3Ctz8j9glOBXk6n3PZJTnFs=
X-Gm-Gg: AZuq6aLw+joDNVw0Uy1KI4pxaZvFTdcsmqK9cQYcS/a6/KFxXwioI3hjqtaaURsQOHZ
	Pgo+ObVdCOgZyrOe0yQ0sOuQ1LuVnGi2zHoQRZ4c7o5jyyOHzTQselsnjrO4issvH630EV1jorh
	YrD3XDY6jID46fF+bqNhbv51KLa166AFqu65ud+DVeF7ZTT3fGuSZBr/kgoscT9snr8FNNmo/uI
	98QLwPwvec8NjDU5Or4/d4jgITd4kK2imNqcK+IkrbA2xplLn2vkOgavnKag/Ib6BCIqy08fwRw
	QAFEY9/HgnnKwyFW+ZEg4oPZ2uTBxW78InDslYpOJ7PAm5Ri4NKwMNTqmc9GhItEdpa7ASjoC9s
	kmRr2mY48lY9kkz+s0t9wKNs=
X-Received: by 2002:a05:7301:3f19:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2b6b380ec55mr6080484eec.0.1768925512626; Tue, 20 Jan 2026
 08:11:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119202250.870588-1-zhiw@nvidia.com> <20260119202250.870588-2-zhiw@nvidia.com>
In-Reply-To: <20260119202250.870588-2-zhiw@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 17:11:38 +0100
X-Gm-Features: AZwV_QggfPIWsDWcZumvkaBtyp05_PTGQ6lAyDvY0iGxNwqiMAiNarRoaWfcXUQ
Message-ID: <CANiq72kL9xwT-wdyGNpekmnXioUhwLjcayE_pkmKEEw+RDCyrg@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] rust: devres: style for imports
To: Zhi Wang <zhiw@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dakr@kernel.org, aliceryhl@google.com, 
	bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, markus.probst@posteo.de, helgaas@kernel.org, 
	cjia@nvidia.com, smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, acourbot@nvidia.com, 
	joelagnelf@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 9:23=E2=80=AFPM Zhi Wang <zhiw@nvidia.com> wrote:
>
> Convert all imports in the devres to use "kernel vertical" style.
>
> Cc: Gary Guo <gary@garyguo.net>
> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

This looks fine, thanks!

(Not sure why the Cc:s are explicit here but, by the way, perhaps you
may want to use the `.mailmap` if you have some automation so that you
use e.g. my ojeda@kernel.org one instead).

Cheers,
Miguel
