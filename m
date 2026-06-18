Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4446C3ED5AD
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779230; cv=pass; b=CAfSS1CDcrSX+MWuZGhAxDU++cFIZEBA4m1/CmOl5140M1HpEWz1qnX1v16B2sWrYDs2hrWht2Fkq1MGMyu/gOxsgTyzaCZ1u84F+Y0Krxt3zHwJlYn7j5FgIGltHu+dKT8L7rw3wMyJFd5XrUlDsAaGtZ1hTVqlVeDvnRfiv20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779230; c=relaxed/simple;
	bh=yhUtjbZV53eJ33+I5WWMx1PK7EZ98q+cI9GUW0pweEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNFLKNs1NDJr0F7/cbmCqliBqG/HWYCd844HjxtNg9KDLPz7a2Qqa9qGy5G4/DQLny0qvZ74niWp3PXTVJ2HWoe6fRMYjElgCfRmqDIAlcCGVDYTwwwuEFYnpcb68MxZQj4U4eErHCYP1ycgNJTARoBBApWWgejn3ZlxHuj+S3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDW4jrkf; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDW4jrkf"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bf5a207a6so20273eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 03:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781779227; cv=none;
        d=google.com; s=arc-20240605;
        b=Nm/n2NvGanW/DkgXDdPCeM4ubXk5sQN4ymGZD9qND7ChY+EADcxf2O7iEI2Hl3gUL7
         u5M+GE/ZVbLoW58ff/ujNQy5cLUwSepwCk8RqIsRy+ipqKJvrTZ0OlnA8ACXb7rJO8/J
         7cdWhwlLzc0MJnBGRXOqBprCuxMFQEEPhLKhuLiMtLxUwoLlmBoU9ctG62YFHUpY+v6l
         f44rd4NVOe08JsoKaybDOEvMuLFJviXkQHYt/3pNNren9fB0gqpYajj/t3vjRcQBFVDB
         M30VPim5A8y8dhCykSooSQfFrN/N5dIAycgZT8ZbhVMvrRAWGzGkA/b15NWh0IUtY9kL
         QGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7DUQbCb92xOvO01pv+r7iCHPQp0UAu27WllptLJOlB8=;
        fh=TQunaVyWraBhVvatIO2dxdPlvtmHVuFbdPgwfLwCmT0=;
        b=ALgtzmXvLQrSynfUU+fjhXadQ56lThhCtSSOqqB9R5OPPxm9bJ8gjwbnlzIIRmtum6
         KmSPumB+1Sx0a9zc+JHHQotMHhbooUpBLxLljLYzDIkCJmyXi9jRPt1N+sqKIyqkUQVF
         yh5tCABIZPQJvCpoy06Wura0AhoV5lg4whgZ26n7z4gNx1YZg0pAwYWKRysLjULpQuRb
         +wCVhVqBEo3QRkch5qVZySRGgTw4dXN58EoyQyM/+Q4+eULa4NBexSAhYHWRh9xMara+
         mD4pkpbLqSwEZZtcJ4yLCgNZoktAhNTXPggqWtFYKc8RO1SsgdlTjfHtKnZHkBrYDZcD
         EHDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779227; x=1782384027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DUQbCb92xOvO01pv+r7iCHPQp0UAu27WllptLJOlB8=;
        b=ZDW4jrkfk3387CIo4fAM4NOExN7ZA+JSUepXfBLmjVA+9FSYPSR+jjJ6jViBSqlURM
         S9V6LCLaqgcwgr9YDdt1Mgl6rSrPgLi8WYmsdwGZtGJJHr8fYYLDPOoydPJz4Ej2woKa
         VGi8nER7rddQjktBGGDNpeu/TaA3SWCVmWzCouZBHU0fSB6Sdk7+0DOLfMz5Xd9t+1tq
         4PPNM8eij0R9Mi9C35+amzk2T60DWvpon7MBlHRKPr54i4XVSTz2ulaIiuYX181sHbxm
         yTzCEmnhvbEtgMB/vBKfM7I3+8rtXvucGfl2SYuH7oSYFK02IzPvqvDmqj2hgddxeFNX
         K+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779227; x=1782384027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7DUQbCb92xOvO01pv+r7iCHPQp0UAu27WllptLJOlB8=;
        b=nYUCgl65p9GyeiFroRZp3qexnOw439JTRmVNXQ/I8Jz4Du26y/ut8wLsgHeFqwvUmR
         XLSX9uVrDawZLL7dMLDZl5kP5B5sGIqLRlVt2hfn7oqX7j5ZeFkMkWuMmsywrNJajsVr
         A7hsHVHOThqJFE6zJhom6qSldHS9ETYDbWa+oLnEaGk9FazrxVY4mEjOSk0slThw7Nh2
         TkGM8p97SZJ74rWQcYNLczz96nIrSTQzq91c/3GSQe3H49u6Af/q3C2/HXHDZaI0vajF
         KSZFiZX4dlPp+FW2YvCjJV55l1Au7Mn/AxpF1TXZX80G6qDCVc4Ila+ucXoyUBTBbW1R
         txBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LNFSTXKwhoKc4liAUyxEh8DEiftZyywgqWeUp2sjaPLhwDy+TdKKBLsZfvJmnGFClubFsi+prfInUMcIDcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwugm8YctaqHmHzQ6qAh3osF/mDnjxWMKoPizgoGsYwSY1TLLA
	hlwNHoltCa9BAVOGdy1Kx8sKSm4xp3q/rBOh+mLbOvo3tcaMa1GEp7EFChRRWJdXTfoeEvJFFV5
	+OLnjpeVG/ODNAorhUYF8kAUyvCFdBTA=
X-Gm-Gg: AfdE7ckP+tSR9miE5C8JcdkdlgwbwYcoNkLWJZ3mVf5qfJrD0LJn/fosvkgo5+MIUag
	yU1aIR00xIst3vb2Ud/1k9K1HyW4zAcoOaMglUcEZHeuuJ13r0EzMTNOgPncljlsqUREEIn9eX5
	LLQrBku2cR2+VoSASbUaAZfTEG7if91TuwK5fEmtK3uMNdDOO5GRG6VoA5IsvznyCeWyNQxbebR
	jsA8ZWSKYwjzgYTTZSTo9tjQ6wEW3oUAWRK8wxhY/pQgFQIJW92ZIrnpWI8Pe14/pzNVAkYom5e
	Gm9pLoYQuQLrlk4QGB/WYSa69YreqMr8RLb2Bq1nZdjagjyd5uTprwTK6sWUSwWq4AxoNoYUypa
	xbIaodKyVewqQ
X-Received: by 2002:a05:7300:ed85:b0:30b:c021:5045 with SMTP id
 5a478bee46e88-30bf09c4416mr1020403eec.5.1781779227291; Thu, 18 Jun 2026
 03:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-clk-type-state-v4-0-8be082786080@collabora.com> <20260618-clk-type-state-v4-3-8be082786080@collabora.com>
In-Reply-To: <20260618-clk-type-state-v4-3-8be082786080@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Jun 2026 12:40:14 +0200
X-Gm-Features: AVVi8CcKkRQ8t8MfiUD4gXtI1Y4DMiQAI7JLxiiYKqJ_3SsG98lF2VyIrlJ2k1o
Message-ID: <CANiq72myoVT9npyaB0pVvbJ1v9ELzw68uAvSoAkdJJX2MJQ=kA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] rust: clk: use 'kernel vertical style' for imports
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Brian Masney <bmasney@redhat.com>, Boqun Feng <boqun@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 5:48=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> +            Result, //

Since you import the prelude, I think you can take the change to
remove e.g. this one.

>          /// use kernel::error::Result;

>      /// use kernel::error::Result;

>      /// use kernel::error::Result;

>          /// use kernel::error::Result;

Similarly, the prelude is imported in doctests by default.

Cheers,
Miguel
