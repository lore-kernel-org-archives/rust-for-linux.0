Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA18815B971
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774623632; cv=pass; b=NIPtFz3E8os6/uOLW6tuOLxjnRx1nqAg5SwC2CSbRNLSBQS2I9lsmUSRcwe0MIk0ojl4FlRgIMOs7yywOLVtHu10nKikPZoq2ZADTnfLVLLfNnjWBL10kwes0pjJT469sOzSqzEPqYs2KsZZGp7LY3j/Fj/d178vXLqG48tcjME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774623632; c=relaxed/simple;
	bh=D9xCXX4qh7yDgqFtjupRac54WTmWuupUUXzjqiuoTv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFahCuQ6MH6jnV6z3Apz68bdSykoGm2zVJynOMPQgDHn3aSwQbSQW6qyc+lNtxx5loeS5ppfg0qj8W36Otthd8oI9pbB+SN4KCadCwIVEa5b8Ck7d4RkkL4qpgLFMdESgrmZcrJa5yi0nslTjt5nAu0d2BcQB9jOlTR6XI3kcDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/AIeTGJ; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/AIeTGJ"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1277863a912so294211c88.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 08:00:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774623631; cv=none;
        d=google.com; s=arc-20240605;
        b=KqcY97xXuAbDxPc7i5zcEq5jEXFX5VJEQGohdfMqVnZk9M2MkAWfYLa60lB3XS1Ww0
         8WKg+D9sou9KJg9yws9Y7xRrMk+DFA1tqGaYJjeMoHsXOYzZZEZlp8KuJAPf/4WzMPjz
         Ce1xyS7mo4QiPZaBG0D7JIB54MUQX7WeKND91s34xvuuv4Qmk1Q7lAwXqRqT12OkjN/y
         tZJAP1xp8xXp4K9OevO3rfDVrKWFOiJL6y2nz4c8EuCWbw9ANQplgRM1i5kArWTyrS4N
         MwcfL+4TMOULblcrHm2f2kMgKtqBaerx86+5V6eGE45xunMCwNKPhsPE9S3UsH9juz6G
         kXww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D9xCXX4qh7yDgqFtjupRac54WTmWuupUUXzjqiuoTv0=;
        fh=tAtE0Cdhlc6bzDZEgwNPHOd3f1EAX5LRlBXnooU5s28=;
        b=RfNfJhfGwY2xmGBOUt4gReCCWsA8EdDYBSD0/3ODXFjKhUfOZPxy670MawiE21MZ6n
         FYtgpxR/Y/+J/ZWxHgvYlJaJhNN9loqGBrQdH+1H+kXVl20zouL1zZl4aF3tpFpzXtyv
         IdV4M/5H8HmJ5D6PCZQl7vlGQAolMzHrZLSBsDP1gFd3XkIL9Wm7c7YTMSZEGTn7GyM4
         5ruxyUsmGYbmHc0gv0KRRnWOR3GhJBIfTt2nGG65aboPwXaFW9YUqynmQYfNN5wk/6JI
         CukydFp1xCLsuEKve+Gd+TG414W7yJQlhTzIXK1uM3UAcHLtU0XallnmDXJtHDt8OklL
         T3jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774623631; x=1775228431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9xCXX4qh7yDgqFtjupRac54WTmWuupUUXzjqiuoTv0=;
        b=V/AIeTGJtPpwVUdsxrEOZw9ZJI4hUZZQ4n6eL+dQ7Hs7SZSN+IqHQYZvBddYnfShbH
         KCb+bttTBwWh0wjcz9wQ2bSwdtSqu1AhhIhvCcroEHSuiRUNMI08xwLal/Et9ndp59CZ
         foaAHr+cmB51VcgaJni5jyrOSyk26PDNW6VZwQHVUBBXdod862bmiXHQMq5CRFzAI30e
         812YtBpWJ/9bjWqPAeEOWIUoh8PigQ8NgygTznymAnahh2+r4iGi0pIJNrM/5PZ6E/h/
         1BX9GrEDOm2rDM9X+PzQCowF0wT0uHXRpAE8bPfy/bkULcdkmmSgxyZ0Um7JfUD3KW0Z
         DxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774623631; x=1775228431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D9xCXX4qh7yDgqFtjupRac54WTmWuupUUXzjqiuoTv0=;
        b=E20Ar7ZRCOWVFsz1BEWEXP9hCbhnR+nCJ7zzeNrcw2NLjzYlkHpqyVVGc8rdRs3auM
         V7eLIF9rCIVpUDbTzJ9P2VEThdYR9zm3+TXkqK6dLgduGzQxdW2HF7M/N4ADpmbRUd7W
         OIHg6T3T+kulDZEW6fax7Ge1wP/MACyKNxnSo4CbosOaplJ1obHS/CJCVMhPqfx6Na09
         fNol9FjG97cykX4kmYVgcVt6PhhLyzP/NzGgkwCZuaqufuA0pkSfqZw1FLkfytzJ+uu5
         0M4eA6zD5UpR+PNb4XFIcwTvKOCD2d8onFWoQLkWOJkWJolFPhWbh1gXg/WB91onvtFY
         yWVg==
X-Forwarded-Encrypted: i=1; AJvYcCV9PX+fwY6u5NuL/FrSPUDPsRipvLh8/5iXZC9HC5sqhbJDx75NovZsbFD1V8CJ4fVD/1fpDJg1RHQGvVRt6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJMX4IIuaR2+V81Y8bchfFYMDoQue3p5t/k1lbbLMypCMKCwH
	tYL8zjY/rHKp+reMHefkZl0h4nNCG2a69rr1XIvH/QUgFILrjlGR1pf7VngvhfxoXn9qYfBznct
	NecJgaLhcltMwvritYPLBTry24SEoWH4=
X-Gm-Gg: ATEYQzxJgN4aO9k0c2uGfjLf23CbaCE1F74BqlWPhKMEKm3tzUcMqO6RoCbBGSk786n
	BoyVjfZUsIrDKmYnfpKK69pJ4jHIDE9LO5k4UobO1NBy/+xPxn7KstfqToUDNnB0KPQYX990mvR
	V7TXGDm3yRHQ/haZtcF95xuJlra+VBXwEa140ZxLO8R0Msm0UdcSAHbD5v4L5y2EwHHFrxHrTOu
	L1mJ2vTdbevkdexTQfhjS9Smf257+J+7GIrpKdoJKzUA6jCG+vM7nLcOT09qbCSVXf4PmGQwhWN
	KvEm50vW2NVS/HAbftyhW7LcrnYFtaQAzSPtHN1nnr1zef4toPRy5wZ4k/motvBG2tVzIlN6PDo
	ZS77JMtCAwa+9FnG/dsGa3lw=
X-Received: by 2002:a05:7300:3254:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2c185e6b478mr676695eec.3.1774623630624; Fri, 27 Mar 2026
 08:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com> <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
In-Reply-To: <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 16:00:17 +0100
X-Gm-Features: AQROBzCg8z5hsjJLNQncsQnLe5Jv3qMm0sXMulY5sLScvTl8_VvaOlFJW_RT3vc
Message-ID: <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Brian Masney <bmasney@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 2:19=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Stephen came on the list and started to merge this things this week. I
> was going to collect up more patches for him if he wasn't around, and
> intended to include this. However, since he's starting to collect
> things, I'm not going to send him a clk pull today.
>
> It's up to you if you want to send this in via drm-rust or wait for Steph=
en.

I guess it depends if he plans to pick it up this cycle or not.

If he doesn't, then it may be best to just go forward with your
Acked-bys -- Danilo can pick it up if DRM needs it in their branch,
otherwise I can pick it up.

Thanks!

Cheers,
Miguel
