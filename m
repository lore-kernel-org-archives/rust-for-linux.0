Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D7C2EEE76
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 12:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919395; cv=pass; b=Nr5z/UrTaeS1tOwkVWUXO5ySEBsOw1Nye3uxhGGCStAI+oc+gIAeKTx2mmx4ZQydRcz9XQ/NyxMuDDA+FveIwdu196L6r7AotFK4IHCGVpaXODpCCoXNh0YvY2+Xq3bzVwdoCw7x3LywkreCZNwkbVVOXOLEBnJwrW1OTpUWMak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919395; c=relaxed/simple;
	bh=YJeEPyBPzLxDNEZ0JnLBB6831Z29vJZEqt0XxGqWMq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9Mze+wIuvqIGknBRPs1FGlWJa/k4DZYY9YMYaGBCJWZG5hwTlw+64cRIjobZDoeDmar58iT4hSEGsD9xv9J6yqHFloznF3bDLYqfcJd8PGaeMJOeHojI8zcXbh7SAzU3NYTugDiF4ZWLXtjcNH50W5ZEYMkKX+THxXQ2xwPYds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2FTdRX0; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2FTdRX0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d319b84213so925485ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 05:16:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787919382; cv=none;
        d=google.com; s=arc-20260327;
        b=M5+H0gAs74KZIzc5wFUBU1Sfpmpv2ZCyYqI+QxZPxpScbiAP0CWeZ/tRo7+9SNmIUx
         VeKWA/hVmYmGeswY0I2HkuE2BVlsx4vXGsXqxymH5GXXG6BAe85jNDggPTWi3bFMf5xj
         depnzEpe6EU1jsdRIkwopj/KEZYTBqZxRjPRAdYhJr2UKyg5NncjvMzUJfM/2Yy4aYMb
         /NN1nRrpOPmcLCHd3yhYe+7GfoqoJI/tWD7T+nca9CYwbHLmwWVAf51hSd1l6RYKcoio
         tmSaOdFKTqY30Niky0CWTMYWQv8ttw+26lktioUBW0gXlDBQQq79w14s7xAvxwZh6TzC
         ocVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YJeEPyBPzLxDNEZ0JnLBB6831Z29vJZEqt0XxGqWMq4=;
        fh=i7LOMBL1lWVG4c9ns32CqoOJrVZpTOxKm3Yyou8lsP8=;
        b=ks8A03T2qEzkduXjhuay0UMqScgNlpl+FUVxAt6nrqyLTXM8Bl9uQmv+E1M7pNnh7Y
         YHFBb8CoPr3BGbfSFNwMxiFBnPcdJDImAYG4NS1evRJ+JLVc2OEkWV9aIytj2HC+kE1c
         EwCY+kI5XQy0Nq/TcJhGHlWu16NojrXZenJDrb5kRiE/UQ2dkX7gQCAeF3M+lwtLL4Zp
         H+wLf3dMo/+k5Xh40LOok+444pJjPlDGC2E3tvwJQ6Yz2TbUa/GW+54ShAM5bnDsoGqh
         XlF2zen1cX/4SeNIw4xI8Z7+CBH/QJ7wgu0ZBZwkXBxdsMrPGXp5WcBzaCsU4qbU6YVd
         v9TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787919382; x=1788524182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJeEPyBPzLxDNEZ0JnLBB6831Z29vJZEqt0XxGqWMq4=;
        b=l2FTdRX0pJ1Zck0LH5A2ibgpLNqckDvw1X2Qg548zc5grBUZtoWWbQTJLQ8V0Rs/6/
         yRrw0VlqynoBKIgKY3Jk3BFdHRoQXQq8iU6JvaamWjTfiz1n9YrZFirmcBPyuaqpmzPk
         7q2zq1gRD0/hbV4lhjzK8BR8L5nXvoA0KcMYxbygXXpCaF4PS254p+2WF4u8D2z7HfgB
         nZMXj3vQMB27xT9DXBy7dBV0ebnqYlA1bvLxWhi2VXbvRPvMLIL2Sbe+5MzkMr8ec+2E
         wpNbgoKm2y5/i4Nzs/kxBfnHPINcumKgVsBzIOFmJRPrETxHweuSpq9cgU4Re4tuM4tn
         c0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919382; x=1788524182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJeEPyBPzLxDNEZ0JnLBB6831Z29vJZEqt0XxGqWMq4=;
        b=pqz8hsaQ7z9OP1SihRIw/lo5ilNPa2D53G3QaPcVaQ41m8dxvoaY7IwUiedoZ7U+NR
         lu3ZRhxRYVFJaBgIriLrfCC3FdLdo0tbQEjg+LV0ePZcIZJACqDArUPUUhsGtSmA4kVd
         C5h049425puJd2yhNDCCUDyFrtpo7xYd5u2NorxUBqBoyAHFhts4achgCOadxAdlTvfi
         o0kbY+JoGuQCoIu2Xx5eyFuDITTH5mFKiTg7/VIB88gc5Lmq/54dFMj8Y7jggw6K7qNd
         g/F/bhta0uka4lI4OXcj4YgY9RpifOoPaKyi8TbFJH2JUREKL6qD6mIo+J9b+ykJNtwc
         oa6g==
X-Forwarded-Encrypted: i=1; AHgh+Rrwnf6oJqh2he7yBQ/74GvUv3vzrfUoRjMo5wmRMFMJ+1mqBefbH7uou2hVySs5ubBzQ51LiU3yJnhmlVAT5Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nKBWuO6nYEtQFsOy64wcGbbt3OpWKuu4KQE56urYvzO9sahFGq
	5mj7wnnJEAPG7wOcSYzSYRkB8u0BDKvGgbHKIRT0Xof3+79qkwrR2JoOrzGy6SjZ4ZSTA/Kwdnk
	3TkRjZdGRbs1861KgRRJE49Sl14QUw7I=
X-Gm-Gg: AR+sD13h59bQEQ9sg4oTYN8wl+MKYjUj7A7WAf8Gy5QlJTmyXcfNDEORvI6VSOwaRHX
	LahmRxoMamvgH2JyPWILgjVLxR4LsTIW4M8CEBXRgVapY3L2BSyLj81R7qg6FKFXIsM/PHD4/Zh
	Wifx/+tblUlMgnnD+9u7gkkivlF3EOZVEdeE+kggiS8tqkfh6UL+tWOPy7ImySPpFZZZFXDZuBq
	5ovA/nouGIqPUuQv8CmLBUlQ7YTuOtO3b9o41pJcJuToyr0slTzzdI6gHZFtuaiPAlKa5rIt1pE
	00aqh4cQ0LnR4U7CQzeFBT+IUGF7q++2HCQ8OMARH+O/CWy/he2sW4bfd3GdRZd20U8v6lPNYyd
	rWH+kYtPP3WD41iz/dfztQfF1liR/+/BUQfZC+hAnBcafdGWn+gI70coGmaqZ
X-Received: by 2002:a17:902:e742:b0:2d7:d12:552f with SMTP id
 d9443c01a7336-2d74ce2e25dmr61601145ad.0.1787919381589; Fri, 28 Aug 2026
 05:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-nova_num-v1-0-e21f17ba4127@nvidia.com>
 <20260828-nova_num-v1-1-e21f17ba4127@nvidia.com> <DL0KDAXUZOXD.I8FBZZ51EIIF@kernel.org>
In-Reply-To: <DL0KDAXUZOXD.I8FBZZ51EIIF@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 14:16:07 +0200
X-Gm-Features: AcwNN1XLnWNk0tl21KUKDNYvB86AzsWOBloGy7JyyvYK182UvGVrdB50k0AdYw4
Message-ID: <CANiq72kBF4xyKpB2oSvq+MgRuT2xk-VYSbtXW8HQaT0wmc3ehg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpu: nova-core: use kernel lossless integer
 conversion module
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, ojeda@kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:09=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> But honestly, the former would just be unnecessary noise. If we don't do =
the
> latter, let's just keep the nova-core num module until the dust has been
> settled.

Yeah, keeping the nova `num` for a bit sounds fine.

Cheers,
Miguel
