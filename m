Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6361F2222CA
	for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 17:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764524920; cv=none; b=cm9a1Fb49VgIvJGfSxnZMQ1wm6paZcE+h7Iidnt89lxGSKDbt5dK9PGX9roR2Jsv9RRHvqmIy3zTVNifC1ghBRpDpSx6Pj4xfJChXPgmgQTIuPLeb14zJDQEPe3zS3QiSyYWfB3nOZFHSk5HUyGSBrqwe4FUT5ajdBOMyP/ZWhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764524920; c=relaxed/simple;
	bh=ENHKHLuSnYs2YkjTDKE83XnIxIkg6P6Da60IQZLgvgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGHZ6EoXLxWy9706IYEmykOvvrTAWpUbCe8vb5fSUhEnlxkkDV3iIs7xNUAX+mZz9aSB3LrSO1wBHMpaT2iYdGNxj+8dPG7BTRiN1r3kh8YbWB82LTPoYiTkhckvZFV9KZLO2Qs5nchXmIqW7dC3f7x/VUUYNGlu+zeT9NSq+LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuhpQOOO; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuhpQOOO"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-295351ad2f5so7259905ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 09:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764524919; x=1765129719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENHKHLuSnYs2YkjTDKE83XnIxIkg6P6Da60IQZLgvgM=;
        b=MuhpQOOOp9bCV6FT+SOX2eNgG1GmKiCvj3O2Y1irOcb+ubbCvSROEppMtusXev0CAr
         91s+1NFctLP/8oRHEph5EQizsDQPT/8oHpB81CxvLIXIaV2fm70SUenmakniDQ/8mM2e
         e8joLg/yRsRp8z2hvRwcU76K1kGQCrjiI8JdZEtjrCSqCDoeYCrOz/llMY235+CYDxzc
         ODsocW8Qe58PcrSx4WXmHJMILBv7bDHehnWPHwwlj03Cr7Saerg3h34pOLwqnqfalCxJ
         lNWbhTan67BUQVy7KRNLSm+mMJ/GBg29Z1rJOjeqvurF8SCIh5s8JMB3f+DzPOZ2bQ+7
         s7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764524919; x=1765129719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ENHKHLuSnYs2YkjTDKE83XnIxIkg6P6Da60IQZLgvgM=;
        b=S9KIrW92DJ2/UoByzFF3hNJ5iiiyIjvNnGbZHPVFusz/H3rdbFsLNyrVAPnRZByN0R
         OQAETOhhryTiwKN801wh97TDr9oqbY29Sv2Cm/Dp33ILnzcksVYIhd8FhdRhiLN9E4H4
         4RxQEdh1oBkKOrUELzZs9qT2VS+OacjYWjvdnKra058MLuGIkldkHlDFmDN1ggDaDjVk
         1naR6lSQGnz9wYYkBBUcZvWlqPIu10HJ0eRJXjlruJhiWNtcchrb/V+TGTiF9O8iqMu/
         Xu4SxdYGvfpA58JYlQdUd5+0vEdN7l6iE1eDAOuBp+CYRHh+BqqGJczMeYrJWnny2M5I
         RBiA==
X-Forwarded-Encrypted: i=1; AJvYcCXUVHab+8BgzpLmEihEsTdVxYJXt2YJcIT0QBvEizmeYG0BefxFIibea1mj8brRkLIfPNLd9fbwWgRvvknGpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6lSpQ4az5lqXLsUfGiimMULa/b4YHS2M0rEK1YiiS4cYZ3Vk
	SW84WFdN4W/lc5vJQG2rzg30wRYsYkPeaocncO+6ijtAGpIZjvuueRvgONpAIebVWMP3GVZGsAW
	GMGKY1eZY7Dh668tbTV2XQ4zOTTlfW7s=
X-Gm-Gg: ASbGncvUf8DkGk4Qs42ZcZBRyHHSwN38cZlDc9HBLT7Bvi8GKbidxGJzrRhYnCmpdxm
	yMlDg/MdNhXHOpmFyRXjIlETRbDCSwCMZH2BBRtqtKjCyIQLP6v9JW8C0jUr4tWAE/kwg0LMsCh
	N1x5LoUdx+KlAbTN8IUGTW89CqR/zEm46fzKJ4jLy6u1NCKklS+aNLIk5t7nJmCtjXFtx7ozkpu
	+gf0bF1yhMMQwacxrYF89NQxKpfstlvCy4CNIzmbgsM9x+paaXYqwKJFLwTQicfaBuGg4uOrya+
	0e95+DDlbWxD/LAZJV3JIjIXl75mEl5MtNNvb+hfZ00VqdnUDw8odab/X7eEtGxDi+Si+MR4o/2
	XNS1TNGjS43AXVW4gUToW3u4V
X-Google-Smtp-Source: AGHT+IHaQbljRW3JXf4Me6UvkChwwjqlnlN4qWO8cOba3pFcBQeaqqHkhKuGpQIRmmBre+7aP8vHjxb9nEu324zXvPM=
X-Received: by 2002:a05:7022:68a1:b0:11b:862d:8031 with SMTP id
 a92af1059eb24-11c9f216eccmr22574928c88.0.1764524918626; Sun, 30 Nov 2025
 09:48:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-io-build-assert-v2-0-a9ea9ce7d45d@nvidia.com> <0A952509-8A00-48A0-B975-C23608A6048E@collabora.com>
In-Reply-To: <0A952509-8A00-48A0-B975-C23608A6048E@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 30 Nov 2025 18:48:26 +0100
X-Gm-Features: AWmQ_bnG_6Xr4-eWihxCptboZrSfawc8mOHoTttjB1v-YXZ-LMcla2ImwpX_8a0
Message-ID: <CANiq72nSo4vuXc+XW6yynbNvpZi2vJEshXw2zA1RPgSUWwAZ_Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] rust: build_assert: document and fix use with
 function arguments
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 5:09=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Ah, should this have a Fixes: tag?

Yes for those that trigger an error, e.g. the `Bounded` one with -Os
in mainline soon. We probably want Cc: stable@ too -- it is not too
risky to add these anyway.

However, the tag should be different for each commit depending on
where each method was introduced. #1 and #7 are not really fixes, so
they don't need it.

Cheers,
Miguel
