Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C8551AEEC
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862868; cv=none; b=l0hIg7+ftFQswzMRhK6WdxhEudbVfRVamVOBSMNZge9fx2QjXMVV+O5aA4PdAH67AD+QZCh4iKD9q91DKjQCWgTea4LV+4AwxJh/xfskB40lml5qulVsG+4ipiMVwjGTt2HzfSlr3oR9hAmvc/D8Y3lUfO5wZ41ZCyupHKJMdIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862868; c=relaxed/simple;
	bh=qjW8hwIoElWxA0iUFDq4qI6cCoaWjoffu2xCTdl55CA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pS14FcRi+npfATkWjGBTlLmdOqNOJPjmF/Ub1VIwGlt5EpOkN8KrZU14gY8UP84EQxBUEXwmFLllySyUceQqs2FWTCRnbw5GlVImxHEj/JnOGK2ppmGknbyIz3bFF4ptWeFQEy9iGW7uOdqdPoHBOaqDcKbBBxKVT09OIZQAA08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=IUmV1ZsJ; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="IUmV1ZsJ"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c72bd8a02fso3554211eaf.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Oct 2026 06:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790862857; x=1791467657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1q33kSEPPj9vs/L5DXTf6JcpgngvKm5JTS+mJu9VGq8=;
        b=IUmV1ZsJN82AWuQ9LrabVy6OBSTm1XupN0yzyFSsxFC2L/jAFcKm75c8kbC+s+ZU5F
         F3joDewuGaTizkRbgxeXodeSmO5qxOzsf9agFHWmWEeZOSEkYPeI5GihQiPNdsmhefty
         DdseqsJVfDoT7Tt+oukh9vVhHiZjHXKe6k87Df0ogjviuGMkWRfzP7woPPx2cH0b7/hp
         BWCogj50ff1vY/OrHgmys100QQS2XBCillebAvpiYnrs4U8+cfT/0RqTxy7I4g8LDrU1
         QV0A7LUGUTNDe82WTmoorIEt/ZquzeFen00kwpTvi09uioXSPmNAO7FJvkwb5/sFs3kD
         61kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862857; x=1791467657;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1q33kSEPPj9vs/L5DXTf6JcpgngvKm5JTS+mJu9VGq8=;
        b=SmZLG29ijUfLBdVcbtSYk+TwjsBRR8Yh0w+M830wpwlm2IhELPtCFGYyWOWgbdM4UA
         EzgOVoAyimW7diagjz/P5xg3Xt19tha/3akgviX2EIe9Tal3xLSLcIPe5E4jlTTFfWYE
         4rFCwz0oF14ibMxz+JsmznYnVDnB3hKlcLYZW7zhuQ+0amEDKTWCSsy6xNUyllUfNHFE
         BNk3V+hYV/yeQi1OZ/bUruNgMuHrEcAb6x8Opa2vHPP0+2A2yDkBiEc4q2yQ7YkPe4Vn
         EWlIAGuOszgZCoje/IbBP4yDGc1SuQvMjtqArhyV49r1GH//7RoYKtgnfDz5P+IPxp+2
         A6Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzBIjxXNgECCBNs3wjehWIl6oxyv5EoGBK9N34TP9cqk0u3ylvX7TH8fEydF7ZWnFb1JrjHev3mG+5vsvClPg==@vger.kernel.org
X-Gm-Message-State: AFuF++n6k3oOmPvHQw3/JijRQ8mPmOXCcKjISvAjrnmjShPLV9+vLzzS
	/Erf9Qu5z1mFJhdxDtl7n5NcrbPibGt79u4ULh+d4581JaF4HETebEuVyGMxs1k1fRE=
X-Gm-Gg: AYBFou3qcpnRoy5U+7l95j2ZkOJrBFfiJs0bbE3m6DNo0h+RaQvYy11cMSJeTwGIJvG
	ySmDexwfFFa2iF+oldn87j0CptO8ophb2Hh/eXBuGYsDDRM2t3zARd4naTmI565yisFuznlf0EI
	k6PGV1M7FJA/DSwE/OgiWiAgbHU+LeBpX5LlSKMviIIPUWQhqPA2J+bAN3I7XMoEaT9N2GJO6Rt
	9bAJyQHUxS6+Tdaw1HTWQUG2CgXhXLtBY+lsyOMxnnFLwVa+8X3D9Ota0KmB4F7TFFFmgJf5k6v
	5vRxMEHFZdR9RONEgySHePWSxvi65zzE/TEOBwy4vku/QFbKL51/ur6oev1PLewliFJ706uK5a1
	A+UTdxEX2mw4/q1/uY9KLwPsnmdQGz8aSY5m0GlaeQc0imBOmXOmHOw5+X8asITPB21wBiXPBit
	niOBi7/Bk+UwxpaAUoJYV8HkSaH9rMDUqLz/AoDRGIXG94e0AbFmMmgzTgFU3W7nfCogTOa7ndd
	1cNOn6WrySZ6k+NUn+y5fDHiam4OlcUQFlnQHpR1mzrTGMgUFw1vkM=
X-Received: by 2002:a05:6820:4df3:b0:6ba:2927:3661 with SMTP id 006d021491bc7-6dcf514de6fmr4675732eaf.18.1790862857501;
        Thu, 01 Oct 2026 06:54:17 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6dd985dfee1sm2647663eaf.12.2026.10.01.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:54:15 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Boqun Feng <boqun@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930-tag-set-send-sync-v1-1-51acdb36f4bb@kernel.org>
References: <20260930-tag-set-send-sync-v1-1-51acdb36f4bb@kernel.org>
Subject: Re: [PATCH] rust: block: implement `Send` and `Sync` for `TagSet`
Message-Id: <179086285425.1662570.7711958272817795555.b4-ty@b4>
Date: Thu, 01 Oct 2026 07:54:14 -0600
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 30 Sep 2026 21:43:55 +0200, Andreas Hindborg wrote:
> `TagSet` never implemented `Send` or `Sync`. This did not matter until
> commit "rust: block: fix `Send` bound for `GenDisk`" made `GenDisk: Send`
> depend on `Arc<TagSet<T>>: Send`, which in turn requires `TagSet<T>: Send +
> Sync`. With that bound unsatisfiable, `GenDisk` is never `Send`, and the
> rnull driver fails to build once configfs requires `GroupOperations::Child:
> Send`.
> 
> [...]

Applied, thanks!

[1/1] rust: block: implement `Send` and `Sync` for `TagSet`
      commit: 06dad60393f20985cc5f24eeed63f965d366c4a0

Best regards,
-- 
Jens Axboe



