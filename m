Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405A7377EDC
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772626087; cv=pass; b=Y1wOvCkbmhHCqya1q8ZlZNT+tjbQuySoajj58hQzAzAA7Aaf/SwgSP9xbtoOLBcmUcX9tRGhPYndMHJo/sm1nuGc2sZVr/vVSPtCmlEhFznRp4qdqY9/dKvEFX2mi35KpdwEP7ZU52eR2/IhNLkKH05E5ZDTL/wPLaOY7vW3Z5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772626087; c=relaxed/simple;
	bh=1ACMBpYZr1Ks6QsmvL+/OL5ndfIMEKJBZNSsy8bTZcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPhNFHu4iwLNcOhxsjmcIbFkQsT4Yy8grTUj4JH932beLwNYLtZG0JeECIlKxkeT3TC2qUHU3GC6dNQlYkVOTq+6cXiDLMDb7YVuJEbr5CMQZmmA1zjcHUogimyJKA/BG5koTClUNX26yY48qx/aytBB6gH7DxxFXgI7psNQxiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miB9U5oJ; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miB9U5oJ"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2be2ce5b538so103377eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Mar 2026 04:08:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772626084; cv=none;
        d=google.com; s=arc-20240605;
        b=dAD0I6CNMlS1tRoEgHzDehP9yMACWxbk+BGQFzd//1vEkwl6os3z+HEIiJE84mqVfu
         fZi+76UuzCNDj7HD5/fr31y57K/PfLTmJGaN079mS+VwkAJh6fBX5pOd7d6fmXoR55Hw
         kgswv5eHXnAV6U3R39NevYpZqEmM8B8+9+vHLHG15biBgm2b1YX6vzbidyLz51Vcvlyy
         X+X73PuyxKmq0z1Lkc2mg7KiJf7PGTGBar6FjAs1kFt6y5Oy140dNfK2oktn5Ip7HdB3
         I6UKHTdkvSn4TQC6lIM+6C8e/136V+rGWtPHvQ0KyyvRBn9Z6a1l7XS4mo58DHGMmB1a
         XrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ACMBpYZr1Ks6QsmvL+/OL5ndfIMEKJBZNSsy8bTZcY=;
        fh=ujXGhqoA5pWr8f64lg5BKT4ZrCcMRYAGTDfSKzgoqng=;
        b=KP95K62KOpA+eSWJmxU38bP9Hgp2z5qLarOxjUb8wLRaFq/mVwHAG6QkjSxNxRoZA0
         SSkSmRsGWqwfOkBrqKvjScZSno/X2tuEot+xeBb+waf/XHE+Cb+yxxeHPiu1S+BONrxJ
         P+SNUP9lRpPp/UjyQvuaidjjdJ6C5/xSx/fcY6wl3w4+jXku+YceLCsCZ2Dt+6JJoaS9
         Lf1t4uBIS8UlzLvB5HwFrRXCuNwda+/JC+EI9aFPveXMVvWkRhUcTR8VAgAxB9HXZmPi
         OPZthhUnmOkRav80S14N1bsijqA1MesbT5nSsjvLYbKK/s5Xf5k+UvO6H0G9j3f7SAdB
         vCAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772626084; x=1773230884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ACMBpYZr1Ks6QsmvL+/OL5ndfIMEKJBZNSsy8bTZcY=;
        b=miB9U5oJOXpo9M1x58aisA0VpdIuubvg+6D/8NMcy9q7uShv30ZijQcfOhFXksLISz
         aC27NvIfmLKaKNS/isHLzXq++K6MKq5k9WomeLWq9wS9u/AQMZRCJFJey7G8jT+akrcT
         Oofopi8G3COo1+NwTjiGDRmauSwaFkSv/AxNnrVrsZV05LNeV3lcKbPTuRGrMYdFflTZ
         oeXIE40wrnL7wxSqcN1mNewBf2CJx+EC89ZGMTgmBL4CZTu4Aqe6jh7YxKTy6crrj8++
         3B9+jTLHPv40UWYAvXNnaFSvZLecAC878EkNnQgC3vZyr8RFSBpepoH+2aE5RW0ahIij
         JvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772626084; x=1773230884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ACMBpYZr1Ks6QsmvL+/OL5ndfIMEKJBZNSsy8bTZcY=;
        b=TA4tJKLw7q8R2JpXVMRrDCeb7sY5SRFn8Fnv0v0sgb1nYzO9lDQFeChc3gty8L5I+S
         WCNKWdZmfv/gXJazP7zC2ozYHZYFvFIn/ygEXSezJR2aA8XJR1EAwCMqvvtXmqhkci1g
         SUrVWplqimmO/R5405wEN/M17uhleFqhVnA+rbqO7XqxHO4VgPab0X4zvAgVoj5x1VDI
         n69c9yD4lSMeh/0eSouXzowHcKYAooDbIc2dRF+Nrw48gE7+VthITriQqmFBeZpMr8Iw
         jCyngvzb2oMjawLAUPpPmMbiFTSZihmnvAJs4hGotaOJinY787BSsfBKzmbnnLkcXi6R
         wLog==
X-Forwarded-Encrypted: i=1; AJvYcCXb0Y/NuOQYpxsfKElan9kzynisKokoVav0uCO4TZlIpq3C3qXujSaorlODWRAMFPEzuBas1aID5b5/W/0+sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxCj1PWmpK6ZEAORDGYr7o+VSDB6AxUPkhiIhbdbkX7VlurSum
	5h+xqfORcDsl/luwta6Su4uQ4bWCvU3kkpVLCouMsHjqODwwB3LkCWlza8Y6NLYmjAmx2ntQSph
	cUvZ9Tqeaymj6TuYN0z1vKCYaIVioLsQ=
X-Gm-Gg: ATEYQzykIUqH+ZJUljgiRntzhUqJ6IQVuXL+ZtAwnq/GJYey8COhxwz51JdcLFiyNlE
	FpWEvWtrh59j/dksVptHgvp1J8oYNU3bvtMD8/icXbqtsA3mmhy9RN7zp/jU0y5joMUQFTj4/hC
	xmha/Qumk5CfWzX4L1Uzaq35tqC3MhVqEQWchCGh8ePwVe2dx/qiZ0EoZgKcHmwfboIPyfoXpCN
	rebh+XK7z5kxu3Hv4CtmS3i7xMT2GvFD02yChUdvqp94DNNMbv8Os1hfK685+mjLNLQUGBo69dy
	YJsQYgWcVqcMPJa1qMUlfFs2RtI6Ljx8Cc/bl/7mxPR5+IFhqkmQ4v6cyrknOZwUQiD2/GGqx+m
	bZl8s+KlL2HVHL6mGH9/krGV/
X-Received: by 2002:a05:7300:6422:b0:2be:687:5dbc with SMTP id
 5a478bee46e88-2be311fb70fmr280215eec.6.1772626084203; Wed, 04 Mar 2026
 04:08:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
 <CANiq72kROq3B=EPfihKM=bvtyqYrbDV-mkFgROdPNjbC6zaBpQ@mail.gmail.com> <cccf55e9-e744-4581-9c14-ffa54bc90faf@davidgow.net>
In-Reply-To: <cccf55e9-e744-4581-9c14-ffa54bc90faf@davidgow.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Mar 2026 13:07:51 +0100
X-Gm-Features: AaiRm50r77un-a0OluWfu1L_cwMILKtsTRe6GRTs7N5PK9FbFtUQcU2gyqx2S2w
Message-ID: <CANiq72kXjytTqpYGbNqKKPBZoGFYHT-3JMb08we9kEOqiK4dmQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
To: David Gow <david@davidgow.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 10:16=E2=80=AFAM David Gow <david@davidgow.net> wrot=
e:
>
> This is also sitting in kselftest/kunit-fixes:
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git=
/commit/?h=3Dkunit-fixes&id=3D7dd34dfc8dfa92a7244242098110388367996ac3
>
> I don't particularly mind if you'd rather it go through the Rust tree,
> though. Let me know if you want this removed.

Ah, good, thanks!

I saw your Reviewed-by and no notification of being queued so I
thought you expected me to pick it up.

Happy to remove it, but it would be nice to get the Cc: stable@ there
to avoid having to send it later.

Cheers,
Miguel
