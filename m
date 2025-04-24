Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896411DEFC8
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745498555; cv=none; b=rlX1rblxWZFfCwMd6vQiX3H7FQzttgpBXf/0EGOenhVg6x8jy7xil7sNeO5cuuFP1kdrc4oWZ+s3Cqch8pphfxZyBWfdzc8UKqOfTxINR8PfXU2l2za0Wp2rI9mjQlVk3e3aehGtm9LgBOPZMF8vfr0RjteKKm3pbnimdJixdPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745498555; c=relaxed/simple;
	bh=bMUPawVVEjbF79zo+i8e/G9oQm/E1z7PfhxO6IAIp3Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FdGL8LgsHZ5N8Qa3Kr+9TRjMEIhWixD8pAqNeN2QSPBFmSwqHsLrdjW7Bemf40GbmuLaUU2x4D65w6lfodq8Tija75+ZdzFLgFo+Aae0hV15F17Gsk1Zy2s6KGcC4xd9fTpxcvSiQvo+QIunVC4Jp8oZbEJhe4tbcN8RVa8zbhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aAQEiS4/; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aAQEiS4/"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so4060375e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745498552; x=1746103352; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pkiVBLuG8XqT3hphgZF0hV/7DodmP7PFwnCD2xq7o9k=;
        b=aAQEiS4/66WQ/Gk8iEyEn6+lOn87aapjBmnCoDnkd2DsrknR/ULvUHEukMWnVorbbf
         gZtYJCDaf756HlFqVspMYAhyUYS5ICedzQvB7EZLBSEp/bFaT4i4jCG5fn7fydR8EVZj
         3p9DRxSBScf9DKmVokyPyOj/amkcI1c1NLvDCF268vgKo31r6rz/Bs5G7u/+WI/yRHHZ
         zavXdP595tkdB4vF3qSyOsE1MSEqUQqdVFYhZocjbgwX4QSJs406Yg74cmAbHoQFoLsP
         c4gcYqoWwqaLRzC9GaI6HYF2IfQ+q0fvkNrkgxrSloqWnQHs+7kDUKE81njrRH9ef2+H
         /tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745498552; x=1746103352;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pkiVBLuG8XqT3hphgZF0hV/7DodmP7PFwnCD2xq7o9k=;
        b=cPBcPukIGcJfvpB4qZ4APS5NnNHy5k+XP/JBDywGyUm//+3dn+LsDWdjwjOLixXxFD
         rs05KfvjkzAWbbh0jncZU44siDUHep/5V4Vx/GQURPg69RLlAtaW8bp7w1MP/IgJcni7
         aBG1X+U5rJ5H4zG1+fr48dUljwtG/ghSersuzMVoVxvcOd68C2bw5SrDfybPVxzElnci
         boBBQV1imG+BAwL7t9f1zyP/4M6bPi302R4xv22R2c3E1yhPbm3a1Xg6bDI5ewVtVE3a
         wZMjLp9mWv/zWsZBbvdbGqXUsfa/abrHgea99av2FUPFDfNK6j9kFqzTtzpF/IIRGrom
         TlSg==
X-Forwarded-Encrypted: i=1; AJvYcCV9q3b6igM79OO8bj4tK4vXOMvMasVRTmxkJF9AXjdFQnl468PMTBN7pKM+REf2V5ZuuEgN5STuGJSb9IoUEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo5Gw/Y/H/jC3BdHRqU4GAbeQvy0SR/uJQo3WEPwP1aXaLBcsH
	+YKuxnldbToT/wilFblCuj0do4nB2OIwAqNxZLgwaUoau3tbuXd0hB2shIKg/epFfde81cUtVVI
	1+9NcAMIeM3D6MA==
X-Google-Smtp-Source: AGHT+IHUeUoQ0ejG3/JHvwn7Rj1k7fCZD7HnZJ6v+sIjXJoqZ3Sw032FWqzu554ZEj2HUTDpr+mjqYHNg+k+EDY=
X-Received: from wmbdz10.prod.google.com ([2002:a05:600c:670a:b0:43c:f60a:4c59])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b09:b0:43c:eea9:f438 with SMTP id 5b1f17b1804b1-4409bd2f657mr21512285e9.15.1745498551878;
 Thu, 24 Apr 2025 05:42:31 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:42:29 +0000
In-Reply-To: <20250423134344.3888205-6-bqe@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com> <20250423134344.3888205-6-bqe@google.com>
Message-ID: <aAoxtUXWq4fdnt8F@google.com>
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
From: Alice Ryhl <aliceryhl@google.com>
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 23, 2025 at 01:43:36PM +0000, Burak Emir wrote:
> +    loop {
> +        cnt += 1;
> +        if let Some(index) = bitmap.next_bit(i) {

You can use a while let loop here ;)

Alice
