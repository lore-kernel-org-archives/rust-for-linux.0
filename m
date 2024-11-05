Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C290C1D1F79
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 23:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730849490; cv=none; b=Zm89vUBM+aXeGS9fKYXocJ9Qgb9LZOLV414p/URXFaLs3gaOsHO2DpnFO3eGjt1Sw03wtXWq2Nj/npwg+gI7jT93ClvhT1e1U2J9rX5QMAmt/qtjYNShj/pm6XFGIs5BD7uYzDv+ng5cKwM3N8d9QgOQcq4STCyQa3bVtc7zU0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730849490; c=relaxed/simple;
	bh=ZA+FNtWzwRfwExhcQBugMjSe2OtqmXzvfShXg41mGrI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=u4HCS+GkRUBLpG7N/I4mqDxiv0olYZA5uCjmgdXyaz2LUYsnDJXQhbN8/iP1IRZF+h+8JE1cguZ4lNRPO7rbf0fzvha+83iVsRltmSNx/Zq/mBI3XTh7o8ZKSE+Er6osYFwdZ1CP23rJgAyLJEhOQ963zDGr0Acb8yd7ukBrbgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/0SVQv5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/0SVQv5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c9978a221so62038935ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 15:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730849488; x=1731454288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZA+FNtWzwRfwExhcQBugMjSe2OtqmXzvfShXg41mGrI=;
        b=f/0SVQv5//TL1b47skbeu4Exl6pmSm8TcUPBJRqstX3o0EQRn9uhe2QehTJwJguPny
         tTGeZ7b9Ze3d3AebUrFo9ycKPuwF3iIHvZSKDGsQA1pYfQ9VKZ8yBxKkRanWSzcxqosx
         osHgBYQMgitMiNqx17dsBvE1Dy9+iZdYUAccRIBPw2v6B5VCq3Vwf0QQNu+IRmSHnZ19
         p4LsTzma0cBTfQxB85aGDciy26qLvKJMrZkhkFJo4ZbffnH/9AwoE5ZrrhL8faDwzI5O
         ZbPJbL1Z6lmw5b7ohPdPXAnlJqy8DXt8p0npTxtuWeXmchWBJPg3U5u65h+d9jwRtQI7
         hWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730849488; x=1731454288;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZA+FNtWzwRfwExhcQBugMjSe2OtqmXzvfShXg41mGrI=;
        b=nIlB5QGhlWcewGCrz2fWB56+UyIg6wEhmEx3DzYAxgAmP/w9V/ZzHLvLZA3WrXS2+z
         y7UnGSuiBek8f9PbMm9opqfmP43dD9VlYCJqZX27wCcLh7cJrSfHr/idn2gNuwpoS+3K
         amJlXt/GbCCf6aW+A+DNr3Oi54b7/SS4x3ltG+SjTAfz3jSZ6BVhqXevQZgfkQuoina6
         ydXclHy7flnitVFrRe+qE+HbL0QfIu8I2sD+SKCwb7V2oj5qp3hqQFTmvPhXHAhq8bba
         +2tmOjbdNj5Z6jo/TWkP3D6culzo62P408BhNbO7aqGDdKuHgDYoo46X/tniOaNEjZJy
         BedQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjfvKzVuM6N4lYV4qXT7U9LU7YzYjw73gJc4mZm6PPIVnFKtVVkBXM2ClY0OYa9Lym4FaNV+O8wg5SnWcGFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ZES5k9x1boQzq5plVVK1FH2VanC7vkjs+d1SdkQVVOBiDafp
	/v+lGWZhSRTtS6YHlH9N5EGnbMT3ttHkLqlTv06w2zwcps2Vc0S8
X-Google-Smtp-Source: AGHT+IFIWApSW1x2mVZbS17IXab/NGe/tZ3MJb2/ZzE8FKKKMWEB19V8DvSbPK3hYKXAikXdjX1QlA==
X-Received: by 2002:a17:903:1c2:b0:20c:a175:1943 with SMTP id d9443c01a7336-210c6c6d9a5mr516694005ad.40.1730849487938;
        Tue, 05 Nov 2024 15:31:27 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d8141sm83532245ad.277.2024.11.05.15.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 15:31:27 -0800 (PST)
Date: Wed, 06 Nov 2024 08:31:13 +0900 (JST)
Message-Id: <20241106.083113.356536037967804464.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com, jens.korinth@tuta.io
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72kqnpt2RkEJi6zR4JppO_5mebgf5RrLvTi52syge9Ztbw@mail.gmail.com>
References: <CANiq72nNMM5hCMa=hDbvpX6AVR5L2pswdQJ3AN05ynHx2Z3Q0w@mail.gmail.com>
	<OAtDBYR--B-9@tuta.io>
	<CANiq72kqnpt2RkEJi6zR4JppO_5mebgf5RrLvTi52syge9Ztbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 5 Nov 2024 21:35:01 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> "Co-developed-by" sounds good to me, but since Tomonori is OK with the
> split in two patches, I think that is even better, since you would be
> the author and you would have your first commit in the kernel, which
> is deserved.

Jens, I'll leave submitting a patch to you. You can use my patch
however you like.


> Moreover, on the textbook bit that Tomonori mentioned: it would be
> amazing if Rust macros for the Linux kernel already appeared in
> textbooks that we can copy, but I think it may be way, way too early
> for that :)

I was taking more generally. Not limited to Linux kernel or Rust.

An apporach to use atomic bool type for "excute only once" like this
patch could be found in textbook about concurrent programming in a
programing language.
