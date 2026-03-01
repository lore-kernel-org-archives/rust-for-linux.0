Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E006923A561
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772360569; cv=pass; b=SrfoFGaVYKWmnkTIYrD3a0xjrNX2MehfgjC1LkOTOZwJYR8S+qLbMWDeu4gnlyvzteyS46AUUQ81Hc1rAm8SlB24xguYraO/JIzxy5z4mF4972S0gm8qoPxmxDZXpF8ND+ad11HlAT7elHkGeg8D4eTNCvuc/akqTlrCIf5VL7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772360569; c=relaxed/simple;
	bh=WW/Bcz/vZ+9s+u7SK7RKM7h92kQtr5RPEQ42Aeeif5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9UVGEGra5Ve1y8na2H/JxtzwM2e2QwjsUvh60Oxp4FUd6/pqFY5GQWM3FKd/OGIIyyUFGi8ly7Cc6LJGNOJtyAHqpN8VNMoB2N0obrFOlRxNASfUzRAn4QVOw5mWQG94TP3EY1lErhgOsAEHF6PzQEp9At1Aix4wLPi/uqWrks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKCyh2Ka; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKCyh2Ka"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12714f01940so114453c88.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 02:22:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772360567; cv=none;
        d=google.com; s=arc-20240605;
        b=ccoDICGHHjqrIJu32GyhKOzJsoLtSI3KyQDdWMUEs17+HXsjLDQhgMSOpeS0eyO0Kg
         QxzgYZwhJfQURk4t80LYcYOJxEb2MOvJlcMCVrAwcws3HRJkae2LpCP91vPT1mi9Itx2
         PhtR1AJbqR4jXu+hYsrclaxbTpr2loa+EFxsw+3uDhpocg7rBzzmvYRMM+T5LQ5cBXsR
         d3bUuH+7TGX+XVrZwfAFnAGjvS6svitBMg+j/C1Ydp5Sfw0Yrbf7DWSY1KQEAylHD8ud
         2Q0f+9G5Xf8fN+I6RBhW0Khnf5MSfNDOx51EArL8mgaOs33tGCqxcs2Rn0M3BXv84mwW
         N5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WW/Bcz/vZ+9s+u7SK7RKM7h92kQtr5RPEQ42Aeeif5c=;
        fh=3zMRPAn+5uMeG2whf50YyeE85ofpIJHFgOk2dnQisy8=;
        b=ZQLb7dM8ys+HHKo7f6RBkcsM0VIoeSnq5gzrVJ6wQbSRMJqgBizlfPJg7PQZAj9Wrq
         xKvZjKobIrhffR+fZZlq1agCRuTcxhJf6xrrqtETZhVmpot+jKnAQ0cyRV+S1iJALoEk
         QFDs332yXATIiIkS/i2UFf66N4VzT6Ba+D7sCkJmAyRPBKQh3zdAOE9QYGiigQMxULSc
         CknEJPk9+1nwmNDewzG8gqgkakRd3yiVUUTCu59cBdj22msULCMVocBIi1WltN7GI2Pd
         YaAK0ud9qH+W9wRXE/B37gbsU+1qOACLUrfaoFDyLOkp9ArHeSdsGL1cnD2wEpu3JDus
         Na+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772360567; x=1772965367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WW/Bcz/vZ+9s+u7SK7RKM7h92kQtr5RPEQ42Aeeif5c=;
        b=CKCyh2KaOOb7Tw9dEqXyFbgm6pExuwzXUI5b0dx+JlAWik/qFgsSlM1kg3FRcj7Db3
         ZpGLqob8w1QdtJQ+DOQ4Lmu/cccBTJw1xsvVt+WUASWmuRAn00pkiqtog8hQykphyEbt
         GEgcTCcng7o4vLe76vFhf3rQExsG7ms8VwNHpFarq1W/3AbDCFQkJhnZMhs5BJmlScDH
         R/NGcmpKaZjTmoJjP/xlbX2McFAGwlGi77xtUKAVRbospVrrBZlPX1ep+isX2sY3YkSW
         ur0zfEUJyPIM1AOR+rLUJ6Xmxuecs/XvtTunGdWov719q5dNBGAbT1UXyXFBu8E5GP2g
         Qd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360567; x=1772965367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WW/Bcz/vZ+9s+u7SK7RKM7h92kQtr5RPEQ42Aeeif5c=;
        b=lhW/5obg6ZyfUK4KeiJJ4vSBD+cIbgxEEZOVd8hFApXMAfgqS1MAcJb6heEkgnaVCo
         9PD0OgAQ8w6KF8YZsWSYEJ46sT0IN63MBNVbj1GYt92Rnf2f1d9astuvaSFZNfmrwoOa
         Nwpq3nTU+BUWVjcB4Y+YCty8LU3MUDXkLxM9jXthyzQQPdHmtNzRH2X4Psw0R/i9jhR6
         Zo/DhUIqHzzc1l+HIL15smkhB01xHJ1CVsRwmMTeW7YRFJDNvrwLYNWnc+gk0Jjg3XgZ
         SSQ2WObSkmXux38F0qr0y1QPEa+or4l+uV1ABiKSXrA463gYg5Bhd7IciIQ60KTAYDcD
         DtrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr9nMrqUg6RI+MrvMAHMzNE/htD7XAfZSyCG4MKNjguP6WYVJMv+WP2+xnJHYrkrS2cOxntU5NwfC+WHTvBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR7dJd0MurkKvjK/MKHBGVLaYCFVd/UKxQenlTeoUydAZO++M2
	ec1zuBzT42IoBS8H1opr3QRlv1O+VdVBgQdLkKnDB7zbpzMmguWqJFnlg6SfqAM//4stX9Cxm7P
	TKTt31RxwYXbz9e7jlrRoiub1d9gAPBY=
X-Gm-Gg: ATEYQzyy5uny+f6+9ee2jQgjL8BUgo9M97O8TR5UecR51NA6gDlhSIW46r6vePxmeV+
	pQsG/dNY8OcunhXTTtdxZ2p74T8BZpHEUh2HMnpPcyc9fGlfTpI+3TSwmbvKy7RHdaf9yWCI0iH
	+ShyU3y8Bjhh76+s4xmZQhORMX9Y1ibyiliz/tof2iTXtaP3juAaFkNVljqaIK/9na3R7BWyrKb
	6U2Wq4x7CxUPXw5bbBjf8qtwqm4L7cfNtOnUTwwPZNAIXpAjJNo0yslPbU/1WvJzU9aVe7ZEYSu
	zrONOsZtSQhhS0QZN7IiKqfwEH22YhR0+NTxmAGcP4WpndLgLT9gZ2Lj9RmA5Z/0nj5WMn+MQrL
	3unS2DcicHwWAoNpKTZ938jPTA8SR
X-Received: by 2002:a05:7022:688b:b0:127:332d:62d with SMTP id
 a92af1059eb24-1278fd1158bmr1721541c88.6.1772360566797; Sun, 01 Mar 2026
 02:22:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301012928.1687248-1-sashal@kernel.org>
In-Reply-To: <20260301012928.1687248-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 11:22:34 +0100
X-Gm-Features: AaiRm50czIpPXXdgvyv-aou8JdT19ghdT2Vl7WOGNnj5TsVeNNgdJIxmsC9j6h4
Message-ID: <CANiq72=P_A+O3KYU5HXtubBP0qmUNvk8WpoN_LWaEsa6LuH1gg@mail.gmail.com>
Subject: Re: FAILED: Patch "rust: pin-init: replace clippy `expect` with
 `allow`" failed to apply to 6.12-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, lossin@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 2:29=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.12-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

These functions were added later than 6.12.y, so this is fine:

> Cc: stable@vger.kernel.org # Needed in 6.18.y and later.

Cheers,
Miguel
