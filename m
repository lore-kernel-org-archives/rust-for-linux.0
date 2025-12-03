Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164362AD00
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 03:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764733315; cv=none; b=YWAg1wh8idDRDrO5jSb15sfrL1g3rjk8+tJZK59UyLnjY5Br2KTrjYM94pWLWyTGDABl8rOw6UVdEjWNwVyD/eUbbuzfLFyNdQ25CR4eP5IKeH2qCMlJpH27B9+GFy5VcnxL+RLQdvoT6fC1Wo4WV5vGJIZ1A6bbVVUMSDlJ/bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764733315; c=relaxed/simple;
	bh=qpHlJrkmXCFrIYRutnKvpdKSby1/2u5Q47t03Pc1uw8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pZaVmswAMcVEVsY4IEJsFGr5yo56cjo4XmHOk7c2iDaXnmYSS9liyz6BRZvhBFIq1MXXgvGklMmGrBsUEcD8dDbmoGwojkUsmmZ4ZIAhtfSEfw9chXNcQLyErphjigQmZkpvW2evslsijJGHSTir6aI908QO1z0Sxbx9b7tzDZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljof0oSk; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljof0oSk"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b9387df58cso9962349b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 19:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764733313; x=1765338113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8/lq5xRtpYJF4qR31y5rQVAq9B6zCACvnP4aQl9qyY=;
        b=ljof0oSkCy4dTndkoXxgRfosn6NRenpAE+EadG8nMhXXtmw8FUPBJoFeB30TvtOvrp
         reE2nPP/vwcuzNimg1QsDo2SqvrifpmeteHzgWowvuKI51W0jRQiCVAI+oiTnHwT0hQA
         tIpsx7myoU22uh047QH1+j2EWeOgakwm5kpmEjN8Mbhrvo7IYrWTFld4spU6l7Pff4uj
         aXZVWXIW3hBwUCJfeHU90E3G/wWAc11ZsXzkjVjz6Y4BbSg6VHYwnCaV1a9A0wvJG95L
         vOfWjSFnvpoGPvbr1sFGbaQwbBiBNEd44Usba6dVuUNVCBGrVZD7b79UjBUVoRH3YYBV
         J9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764733313; x=1765338113;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8/lq5xRtpYJF4qR31y5rQVAq9B6zCACvnP4aQl9qyY=;
        b=X6Yxcm4rAMpJk2fbwxjmvHiSLtUhDJ+82f42Kabqu56SghSTf7K/0LNfJzS6dDaItU
         wyJdzdAHG1ngCg0aLAerUTHM1MfmouS8id8oKrYirCSWaQljuM+YzTT6HDmXHYdrrPES
         Y8tFNi9BPWH6fj6xgQcZc8oWl6nZmsSfQUfpWDzGwuw2YrYHQYB/sQQdhZgo1ikALX6h
         b62vL68tP3lx1DQcYW+JbAlewM+DP/XlPMmvlSiM5x1D0sC1blx+H/QlSk9LyEx5ToPf
         DYh2UIfOupmiurK2IEzHysy9gJEF5MyOA1CnKAbn9qg0yL8GtJT+lzNgyjwzEFDEulHd
         pNZg==
X-Forwarded-Encrypted: i=1; AJvYcCXgFfJxmqc/bwh8PEsroZZ0/dRYR+Z+2b5l5vu0n6NQlGrAoMuzZWO+AP02KqBnl7HpwomlaX6nR6QKgm8Y+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiGVF3IGN5WNjekAZuwhoEQcHkRXFzM4h9bb/GxO/rMWwts+Lv
	D8iPGhnzSIccCukK28uFI8jxLWaaVupk2Fe5s3bA3EXqgRlTjoF388Lx
X-Gm-Gg: ASbGncvG5MlNOiey50bDFU/L82wP2H8hFnAM3s/e8nN1n7sRvQdF7cbfHudijrvR19Y
	O91/MlpLKT/7HzVD9gKqhK67xxb1QZm9flwNjJJLUx532DXVVnPQgdd/DuuWC8sKjLNncbjEOvY
	AgYjD1R9BaILKXtR3rBZAvUh8jzDC9KjO+AzHZwjGK0060tvvSa9HdL++fa6V+of8NnZsWqZ8a9
	aop/FOcA7i2UoRTvsH11ruMKbhGPvZVyeTzQ+8hW4wAWOHkzdyBnwNpTs3ThqwRvs4SKAYjApBw
	eGPQTDOKIw2nL3axlKPKOq+0smuccXi2GNk7XBuvorkeb7WFc9V+inB12FECCUKM1VST6zbokeN
	itAzXN50Y0y2x4acfXNaI2iVNa/cJk2pKksqQ97wLUDiFQiGJyGNeamJEEVUjwCUgML1ebjbQLU
	g4UpliHjjOijCGHc9IW/M2vKToJDcbrzT4iQbIfOlugctK9AcVL6u9+VIjkbt/qJ2k
X-Google-Smtp-Source: AGHT+IEtucW1zKqurnHQJxbxiB3Zsgo3EUdz/e5p3lukWgLKxVQJGL6Vqp3FoNs2gGCdCaAiTofv0w==
X-Received: by 2002:a05:6a00:807:b0:7aa:5c32:17a6 with SMTP id d2e1a72fcca58-7e00a3c4fb5mr978762b3a.3.1764733313220;
        Tue, 02 Dec 2025 19:41:53 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e6e5e2dsm18281030b3a.35.2025.12.02.19.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 19:41:52 -0800 (PST)
Date: Wed, 03 Dec 2025 12:41:48 +0900 (JST)
Message-Id: <20251203.124148.1859835796360203240.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 mark.rutland@arm.com, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v2 0/4] rust: Add i8 and i16 atomic support
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 17 Nov 2025 09:10:31 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> This adds Atomic<i8> and Atomic<i16> support; including
> load/store(Relaxed) and load(Acquire)/store(Release) operations.
> 
> Relaxed operations are implemented in C's READ_ONCE() and
> WRITE_ONCE() macros.
> 
> load(Acquire)/store(Release) use C's smp_load_acquire() and
> smp_store_release() macros. They internally use the appropriate
> architecture-specific instructions.
> 
> v2:
> - Implement relaxed operations by using C's READ_ONCE/WRITE_ONCE
> - Rename smp_load_acquire() and smp_store_release() helpers
> - Simplify the macro to generate atomic methods
> v1: https://lore.kernel.org/rust-for-linux/20251115050305.3872412-1-fujita.tomonori@gmail.com/
> 
> FUJITA Tomonori (4):
>   rust: sync: Add i8/i16 atomic_load_acquire/atomic_store_release
>     helpers
>   rust: helpers: Add i8/i16 relaxed atomic helpers
>   rust: sync: atomic: Add i8/i16 load and store support
>   rust: sync: atomic: Add store_release/load_acquire tests
> 
>  rust/helpers/atomic_ext.c            | 44 +++++++++++++++++++++++++
>  rust/helpers/helpers.c               |  1 +
>  rust/kernel/sync/atomic/internal.rs  | 48 ++++++++++++++++++++++++++++
>  rust/kernel/sync/atomic/predefine.rs | 24 +++++++++++++-
>  4 files changed, 116 insertions(+), 1 deletion(-)
>  create mode 100644 rust/helpers/atomic_ext.c

Boqun, any thoughts on this?

If we build Atomic<bool> on top of this patch's Atomic<u8> support, it
seems we could replace all of the Rust native atomic types currently
in use.

