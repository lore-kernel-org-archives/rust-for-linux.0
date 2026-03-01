Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C9F175A66
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772360948; cv=pass; b=kUuk93Wjt1KrvGiNNtIDOgYli4uex/yYRftSOs6K9Ld/tzrgSyAwzi55/aeV2zfy8h+xqpqftNTA0lnbqERqHgYqe6TBdgLB1bdHL0b7HhTEe5e6nzQowWA6AMF5BRmYvOknFsLdn1Xqfnhi+sqlxGP8RFwzH6NtOePbvySb5Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772360948; c=relaxed/simple;
	bh=1OeDkV5pr+tmMF8cYRnZhIOSiO9hTHhwtQyeqqlGicQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gk9XgsQBlu7HvL93mxzljk6aMFh5rJR3uJlIx+pwJO90TleETlaG6fDGGzBRbRMphqjbIVGEybS+vzi3IAA6etvKKGf/J6LWi26AZbd9uHmwFYz7oSf2DWY9xVa70UYkmHq0is26zwmuiQpEV/EeioV6o/xn7cm0zvfIwC7RcbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xyfr1PQ4; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xyfr1PQ4"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12736a0147cso198293c88.1
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 02:29:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772360946; cv=none;
        d=google.com; s=arc-20240605;
        b=Bp+vMYxh7kSqxKwG0sLT8sixgHFZHJJTEiLMLprSpQAKkEIqb57Zu4T27XepKImYq0
         Rk2iOMZEp5HtLhP0wX2KGgC6/8M5KxyO66Wsi8rqZ0DmRIqraRCdJkNNm9dqhRrDLRdd
         JUG+3tOiZW18uIFTBLDs7FQc5gJD/Zjq4Lc6S/5NSMwro12AcbQKUoM0/puJa4RN7ADD
         g+UCRDS+I3OlH/GM9EKjqrjlOPP3Dt8+3XeXhYKVlxrIcNU4CJXTyU4eLp2BJMXTb0Hs
         LeaBaOk5HH7pvVTRt7MvYD7iocSoWSRLY3DzFJqcYDUsxkQtBZaFhVsJgM3SPLgEI3tc
         0+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1OeDkV5pr+tmMF8cYRnZhIOSiO9hTHhwtQyeqqlGicQ=;
        fh=PTRXy3fJmAt1DE/idktSnoBsMjQSC03TAhauSMAuPQk=;
        b=M7qAzr4x4Ox2oaZ1o9jKNv/HxnahEWJcY2kLtIjMin/w6ARPCt0hiUYgSaTG9DbKr0
         L1P6rvR8OP/KKzhk2O7VpCGJnWL1LANkP3uhS0UP1TX5JEpmzgde+9sGjoQlI7Zm7D6g
         1DOmZ569f7kYpzt7n1S+e1Zy5c8/bjhV7qYIzGm30kfxyZixCmu8OiD5c3liea/JEKsr
         2VZwB83W2JXM76axF2D7KbDmWvwtMcpY2imwL9qQ7+ygUaUqzZ8K2HzdTa4J1EwyEHZC
         /udBM+KGQ5ZEcssAwPo0a96QSfU5XciRHJk/WMOf/br+0/Y3CaObSTCegl+2++X3hwog
         lR8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772360946; x=1772965746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OeDkV5pr+tmMF8cYRnZhIOSiO9hTHhwtQyeqqlGicQ=;
        b=Xyfr1PQ4gnAqc1OEz2Sgb8frYVwLblJDWKkoIi74GI4sYFfjOQVQYQ5CofGajrzVk2
         MvzU0FLuZm8zoOD8+LHiO8ex7gSN7yd8btKE+rhTTYlMSjY/s3DNCjZC6seeOw4ovj+L
         g42TtiZFkX8vOiXJFqISELoVU2fiLLo+Rc9ShdbHHgPWjcKJM63ro557ci7D3ZkySsJi
         UwmLcjSW8jaoyi4nx3zrYRotF+UZ56xO0KA3LvlXuWyDYu2XxeeoDS2z7O4kB+pL8lZc
         +U/m8WXhQU1WGLJva9GDT73KbkzZS82IAxA9/VyDdsIGMrPL7XO6UbhbloGeFQU6tJXm
         T8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360946; x=1772965746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1OeDkV5pr+tmMF8cYRnZhIOSiO9hTHhwtQyeqqlGicQ=;
        b=wDCRjOIMEj0m/0aiDAuMBm4rQ4IKS71A98uSG4RO3Zgvnepo5dHliYYv33u4f0nALT
         C35RCWN88srRu07JpWBSugnEtfCqbyBGJz2iY2l/FOuRdR2U3ri+Ml0Ka2+HRf9bzT2O
         +1rNTzI+KVK1uIWyW9ySrw7XwGjH9yK4mXV2shrGwepS6U3PDRtiRQL6nQykGuGulBA/
         AuVPFAcOhuaCPaZ/QGKxeKAnGkZja+0iNfFgmIaiKptu4CTJ1WJNcmw5Zyy9mE2vvbvx
         cGHYdIvBDywLFmJlge55pesjawBsZ3SQ28dGGJOww+d8vDXpSts1KWreIyCE1A1a/+en
         4Gfw==
X-Forwarded-Encrypted: i=1; AJvYcCVBl8miQf5DrdprE8XREGdi6MzCaPi2EIOZzQlMaKeaxLUMYOldu+7GEGs1y9X6FjWgQFGmq6FT+mKt4fyyHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPYgFv3Ol7h6PaQKM2JfpdjswlKwrZb8FQkItP04s7c5PzHadX
	u+qdXAf8d+YgMU0OQZ5pLR+28upE+vWIXKD4BgQCETuWmN2sjbEgeHzu1QKpFbaeesDJcmcfxOd
	o+LlRyCurEQrGRkttg9sfo1gL/igi+i0=
X-Gm-Gg: ATEYQzxfvALArkTvV2lJIZJNwtBEHP3Z+ndrlcpxohQRfmJw5XiiKC/4vsjprhNsrkm
	Y3Bz0Tc4Lu6Yt/RhUhH+OgyMY73mjZrZoHF6FG8BNTOt8J/BQyGKGOq3hzfSfF34LreDmLpT7u1
	txML0wqDBqAkLrSEVq56sSQOkIFTJkP0uAgMWG3NY5TugJl0MmOjXQQkprBY2CUJ58F0FBo1QGI
	vDK9FRTsTa56Zayy90dZr4GS7vocgttwP8u0YxTEAi6eYvWYcOyHTor5OgWzW4NyxqLiUowj1c7
	kB5xuyWEXIzkozDX0tWqmOSbtuEVjkHsdik7K8KDhIpCNBO/PKNN+qBdhDkeiuOm8LSyD5oetpD
	6VGroWVDaNLOrkr/rYlQstsGQWByD
X-Received: by 2002:a05:7301:678f:b0:2be:681:91b2 with SMTP id
 5a478bee46e88-2be0681950bmr249941eec.6.1772360946335; Sun, 01 Mar 2026
 02:29:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301012728.1684975-1-sashal@kernel.org>
In-Reply-To: <20260301012728.1684975-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 11:28:54 +0100
X-Gm-Features: AaiRm52ANv5lYwXxPMzNaqkIhoneKYCzv0imsMm76EF0bp1C8gpICqacpqUsZ9w
Message-ID: <CANiq72nHESphKjW7uXm2D7HCNWNxmZ3nv+CSgrzEGgSKZ4_taA@mail.gmail.com>
Subject: Re: FAILED: Patch "rust: kbuild: pass `-Zunstable-options` for Rust
 1.95.0" failed to apply to 6.12-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, ojeda@kernel.org, David Wood <david@davidtw.co>, 
	Wesley Wiser <wwiser@gmail.com>, Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 2:27=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.12-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

Hmm... It does apply for me on top of both v6.12.74 and 6.12.75-rc1.

Do you mean you need it to apply without auto-merging?

Cheers,
Miguel
