Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C826736C0A3
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770041831; cv=none; b=fvQUcx1AmT+aczvUWZaWu3VHeUmJWRkLZPW6ykTHZ3IfwiLj7soif5XeWlcMFlbsA60XPcpDGWD3/zr3fTl0qEkzvp3ELUU7n3URI7/R6BGIhgxkm4z4iXsGGbPxiOePTaYQFF692dy3AaQlRl7mKQqCruHWCi5sGU/5F9qOpKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770041831; c=relaxed/simple;
	bh=Q8t9qlNSghrrpgFR+bC+AL7WLL7jthCr3Alce0Q3qmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dk1dej19senZA3OMtjeZqWAE3AXmdPJtEfMwmE/5FrKGWS1ktSpdq89kgqMqWepa1vmw4AsDbeZ0KSDjek4AYuwlAS6esqUQfmt6eNJZ7M7xjRDi89BvjHvtlwuL18Z8L5zwyelRQkunP8LVZW9htc6SXUV0l+Fz7T0sd7Jcivo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5UCi5zk; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5UCi5zk"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c6788f3db37so913363a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Feb 2026 06:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770041830; x=1770646630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAqxoiiN0DBBlR+2RR4CAlpIxWLzIp+vXa8vBZExk48=;
        b=O5UCi5zkVX0cif06AhF855t7KfOprdX4nyteqPG8f7xqEdDA/73K7p8lU+XTGTDX7Z
         1JvBPeWGImYKv8GbOc0d/dMjZ4e+LSvFx0Ak5ZDE1ph568sj7do/0Knjsm5b7xYqprn8
         GFWSeOcS197634nNCftUSxmSUnKg0NXBa+srdA33KpHAtzLWMIXlOA16Q/RkqYEzOrNk
         NRawY/7qLDbEFtQ0VP7oOQvDk9U0cSdyccSGQCqE9UjMKGNsCBB11DEdKB13c6Iwqnar
         89j9r2DNbXT8tC8TY0CM+yuT2w1n5CQpsEtpN0X1FR7tXLD8U/dDBJzQoAJqo09SY9q7
         V/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770041830; x=1770646630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pAqxoiiN0DBBlR+2RR4CAlpIxWLzIp+vXa8vBZExk48=;
        b=dLj2vswQMaxs52EKJB+sdJQX6e6OXlk9JFEw5wbI7mGOzMsxChTfA6aiq8FqM77Ffr
         aW5tDrYlBYe9OqX48wCoGHqbTgm0zJVaM0osgw7+aaxTqJjniJWJiwkjQs53J8tVaOmQ
         4NgdbFcxeaqXBoXk20HgUF5J87geaj3uONrcvVvV9K6hfhmE2s/+uaqrF6t1WaRRVw/e
         Q+WwIVUdaLFhiEiGzKCnrG6BIufhLW38eZcuiMWEeePAyWewgXRUZlKKzSWgSdUr+AXy
         OIJKzL+kQO2YL4ognin8sWxQLWmZo1qVy96Shqf+ysUGgJV/hZb/eUmNNYM3Jw1JXW90
         bW0A==
X-Forwarded-Encrypted: i=1; AJvYcCW2Qv2tLVd6smL4tgbZXNf4sZpH9K2CWbqSxZS9o/IN9XnvzpKdYqgy4BtpWvx4kOqhmxrW80QqPHFW+EdxJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+abFaWyY9IiX0jQ+PybRvq/ZtO2EeGM0GTmao+QSCOpVl8Plg
	CpoAL/6rKJyAb97bkcSrBR/XvWr9Dv8Ka3SubD4Gra/6HM+kmfYFcJfL
X-Gm-Gg: AZuq6aJ4iVTbsb+NaWBSauzDHpGR4Hp8TrhD91ndz/y6JTTuzZvF8dGgHiWCTOW+ok3
	r8Vwq4fZgmYyuTjCiD+kw48cYaKLp8DryyiODNIWMylhc6cVJJiR6utQxeYIKcQEeauWQ/f79n/
	a3nmRpl8ZiozLDOHoM3gRRr0ui9DB/NxlKZb+ebchCri+StVd7/v8+G+o8d0PbF/u2WWbDWfUp7
	OWJ3poZ3nEFm5alkSB0dGoQHZ07Fn5bMw7bomk1Z1ffBzEvBwJYRN5bvpPbPKNQSTdI++6eOzVL
	d5J48+A4hqMcKz23i0MIoD1dBi2151I262UF4xj04amUmt/IkaoOatGo4lcHKc2UcKd1/v3xWNz
	fq3ALmmIR7wSpKw+v5o5wiv+bguS5dJjiWdnHwUdPZ4RkqDNGoYOOPtxe8+RNWSNRXt3TARl9a9
	sFAQg=
X-Received: by 2002:a17:90b:56ce:b0:341:3ea2:b625 with SMTP id 98e67ed59e1d1-3543b3168bamr11600907a91.12.1770041830120;
        Mon, 02 Feb 2026 06:17:10 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfd729sm15343190b3a.44.2026.02.02.06.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 06:17:09 -0800 (PST)
From: HeeSu Kim <mlksvender@gmail.com>
To: charmitro@posteo.net
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@google.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH] rust: Makefile: apply fixed-x18 workaround only on arm64
Date: Tue,  3 Feb 2026 08:17:05 +0900
Message-ID: <20260202231705.2693686-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <87h5rz8cvb.fsf@posteo.net>
References: <87h5rz8cvb.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Feb 03, 2026, C. Mitrodimas wrote:
> > The `-Cunsafe-allow-abi-mismatch=fixed-x18` option is a workaround for
> > a rustdoc issue (rust-lang/rust#144521) where target modifiers were not
> > properly saved. This affects both rustdoc and doctests builds.
> >
> > However, `fixed-x18` is an ARM64-specific ABI modifier related to the
> > x18 register reservation (used for Shadow Call Stack). Currently, this
> > workaround is applied unconditionally on all architectures, which is
> > incorrect and may cause issues on non-ARM64 builds.
> >
> > Restrict the workaround to only apply when building for arm64
> > (SRCARCH=arm64).
> >
> > Fixes: 68e8e79e1bdc ("rust: fix `rustdoc` target modifiers")
>
> Are we sure this is in the correct commit hash? It is not present on
> mainline.
>
> Maybe it should be this one?
>
>       Fixes: abbf9a449441 ("rust: workaround `rustdoc` target modifiers bug")
>
> Cheers,
> C. Mitrodimas

You're right. I mistakenly used a commit hash from my local branch.
I'll send a v2 with the correct Fixes tag.
