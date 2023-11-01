Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869F8134CD
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vb/Orkog"
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3504137
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 08:05:04 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5b31c5143a0so24239617b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Nov 2023 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698851104; x=1699455904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U5JMfft7VRMY1/SH83cz0n5I8SgamFYvIt7Euj5oTok=;
        b=vb/OrkogrFazXb8du6WiG8E0f05StPpyjqDevqHkl+dhnC/v6aI9MM4ptn6M1VnKAb
         ol0SrssmCWlsXvehDeI63AvfYVcf4QLzaRKlCO0IzJ7Zdh/dyOWrFsmWHUGoXOeEB/FV
         bnN2T/nWDWzfF6JobVqOAdlWcEyzqYT08iZoKvMpSMrc6DmAn7V5EaD7Z1/h0bmDWQnF
         IoP/1yPJ6rFtuG/HxvixktkQfGQAElU2G86HHBPKIi77nv2hzvsDV4IYfqvYRZcflFVa
         AzgrfN/6lkPCG4y6JB36rBRVjLwP6i5fqoR4KhBESu5h2rJa7rFDdr04K3mVFG3hWXVT
         AEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698851104; x=1699455904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5JMfft7VRMY1/SH83cz0n5I8SgamFYvIt7Euj5oTok=;
        b=rOOXm2zht2dfExc9FBh7UaDx53EAZyL7BfEKlXM35t1TOQJyJkrJW2VcY5iho7RNZM
         kCmZW7qSNSST/tfGhibYdoIMM7hFQa+AoWWqYoGTYGVs1q/JxV6v6FHMGpV32KIxqjeZ
         YTOu17XU/ectQqLwbs8ePMNsXMrLZxREsEjPIEWfGacA3zOuoLYQQMO0g36zRBkmHAbl
         StzAu5fdNB/liOn0ZmxSgSn36BJWRLWQAzCv7lleskxKset8NW1pKs4ANGVLBoPYkY+9
         vpkjykqkTcAbuD8pkXv1BcAHu85R8X+M3/LFv8f/el6rFgcwU896/ICt9DUP/ny2t1nw
         FBhg==
X-Gm-Message-State: AOJu0YyrgVzd7CZbix6YxR/1WmmfgHFuGsc+GDqB36onDGhJTzye0Cqe
	Y7eW/IAFir9HRTwwwZAeWglmQQvM7X4yuOQgI1cNNw==
X-Google-Smtp-Source: AGHT+IHrEbVxBY+XzSn2ZBZ3zONd/D9hLkWbWEz2PmPQjq4oRq/WXW32g+UGBWQxPQJJGRz72RQQCoxr/sfuP3nW6FA=
X-Received: by 2002:a81:a906:0:b0:5a8:e303:1db2 with SMTP id
 g6-20020a81a906000000b005a8e3031db2mr15856440ywh.23.1698851103748; Wed, 01
 Nov 2023 08:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com> <3cc3b66d-7190-477c-af04-a5d06a0d50fe@lunn.ch>
 <ZTLH5o0GlFBYsAHq@boqun-archlinux>
In-Reply-To: <ZTLH5o0GlFBYsAHq@boqun-archlinux>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Nov 2023 16:04:52 +0100
Message-ID: <CACRpkdaAsC6Uj0nKwGFANWrf5j68xZgKbaVaEB02iJ=XQoJt8g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[Andrew wrote]

> > Network developers have expressed an interesting in testing Rust code
> > on big endian systems, since the code should work on both endians. It
> > might be easier to get an ARM board running big endian than get access
> > to an S390x machine.

If you mean ARM32 BE I have that on the IXP4xx systems up and running
mainline kernels and mainline OpenWrt now, but I haven't
seen rust enablement for ARM32 yet (but it can't be that hard).

Yours,
Linus Walleij
