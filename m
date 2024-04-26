Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542F322338;
	Fri, 26 Apr 2024 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714117141; cv=none; b=pv0F/01aLcNxbQ1M3H/E/rQkxR4uIP9c13Pnupa8lu/lKwAH/nPYiNLyQ/50UvCpmFnkk0MhiBz3mscTTPfJwB5n2GpkBPfk0RUcrHcllL5AAFkG1MKr1Pm6DoHTPe/qFj3d2gnn8cpURan5DJoQp+duTGMhee36af+n/xYf2uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714117141; c=relaxed/simple;
	bh=0fY+v8jAh6tWCLz33v0P4ja0L1VLAobur3GCDQhmp5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lycCjTt2zGMhc8lbJdIkTuac/9f9I/xU/Zw1HNDkRlrnndWMN9/omdOyWmNFMz80o3UvQL6/guYqyrVn4x3GxYfA935uGGStATvYjHa/E3ajf4bZrDnhXhdBQjnFdWVbGPtYFPzXBgGh9HI+cflihii6+26Ctnrky/BnpQJfjPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmVJnuev; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmVJnuev"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c75139645aso1150397b6e.1;
        Fri, 26 Apr 2024 00:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714117139; x=1714721939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGBuvvToC0OqPUpGTpLM7JYQ+5mkS2lL6n9tHklK4Is=;
        b=hmVJnuevBerPy4VdnpbrjuwNnHRFMZuBQaYVgqzWVr/ra/rU8eLrgDJrRQ6trXIiQm
         quC7VQbsvi61pBad8fthLlfNZiqJm7VZtd8C52jmGt28EcJ7BchpPf2ohl/BDeByyppG
         qfRjq3yILeEkZC4AkC3XwzV9qWHCTAp7Ce5VL17p6xOUASBwiewDQ9gVOGHPx30gUsIc
         TEAyE/Nzf4N8oEcXJHUHRD5r/vmVKR/20ibqFoTIv6U0KrP5ptQrbOFTOsytbms4gWDq
         KsBSRi0Pe1gFaFmJKbpWfE3lDUbCjJO6zMiBLHhaj5k7+YtRy6ur3UCiE6NQbLdZSHpd
         WbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714117139; x=1714721939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGBuvvToC0OqPUpGTpLM7JYQ+5mkS2lL6n9tHklK4Is=;
        b=jtCWOWTkp9D+mIi9gNHFC2NY7gytMux8kd9uaPNk/vyueafAsx9h1yjagFkIooWWgm
         w3dQYG7qhfyIuZBtCrTA4kMepQYJoxAT8hn4WPMHYvTWg5GqoSH/phPt7ORsWyHZC1D5
         Nwl/NLjyDuXJds9n6ucJ3OEb5jlbqBeWf3UIWjLMDFdmzP+YetQZxT7b9JvmQYyt5g1K
         G9Wfl1atwBriYIjlEAph1gMnDbz2dzpDLRFdvvavbes9MTy9n+HoMh9QmRLscfZTm/E7
         gPFCJOnXhQFsMxiSLnd5f3aWRYKsqnkz7upyROjBXmxRB88KznFwOjnZKRMAAs5ieKA8
         BwRA==
X-Forwarded-Encrypted: i=1; AJvYcCXy3JIEy0ej0HHoGeaacD00Z71lKov7BSrYYaI2lm2+3CvOcoeTCjomMvCG+kVeG0qvBXSUYEQ+APzcC85o0RTc3Wu1sWoGqxT2fwDq1WGuAlr1AwsclM3/0Gq15KQtEmicbcoU2+BosLo=
X-Gm-Message-State: AOJu0YwfE7j9ZwaK0nWewIazSjDqOpNAHRpArf36R3hO22+RBBg/Vnm6
	pKCt5c7Cwf1h4x5yIRSdSzpPGZKQIwKJWhu1nzRfi1EEOZKFtshvNG930S2q23uE5EsVR9TkP8c
	1IsxwcbmtCRJ9B6ck0Mf3xJ64Hog=
X-Google-Smtp-Source: AGHT+IGIDbfoLyF/vcAyw4u9+mdZJ407ybr2DB4NCliEQjhEnWJKZ1nn71+acLQ5mnPt5EZKBCvLyLs+Ddg52AXhG7k=
X-Received: by 2002:a05:6870:200d:b0:22a:8e5:940 with SMTP id
 o13-20020a056870200d00b0022a08e50940mr1651801oab.37.1714117139323; Fri, 26
 Apr 2024 00:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1714113680.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1714113680.git.siyanteng@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Apr 2024 09:37:52 +0200
Message-ID: <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 9:00=E2=80=AFAM Yanteng Si <siyanteng@loongson.cn> =
wrote:
>
> v2:
> * As Miguel's comments, translate commit 01848eee20c6
>   into Chinese, as well as commit 81889e8523e6. By the way,
>   these two patches haven't appeared in the doc development
>   tree yet, maybe we could consider merging them into the
>   rust tree?

The former is in `rust-fixes`, which will be sent to Linus for this
cycle. So the English docs will be updated sooner than these updates,
if that is what you are asking.

For the other one, it is in the RISC-V tree and I assume it will be
sent into the next merge window. I don't know how you normally handle
that (i.e. translations being updated at the same time or after a
cycle), but either way, I am not sure why you would want them to be
merged into the Rust tree?

Thanks!

Cheers,
Miguel
