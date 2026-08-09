Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864463AAF57
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Aug 2026 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786276387; cv=pass; b=O65ivExUuTtNQfVTBraVxYCJIKugUJS/ffci4C+K4w9tTSWRKR4h6ciWAPMo9ibWa6KoLHCR3Pzx9kqr8v+zAfxkH0DrZlI8T6hH5xU2FmSzLXDGyiWw834APjtOVJOgyX8dVRyl1dTTQZkt0Rn/nIXRswIAY8QsfcidUq8/RjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786276387; c=relaxed/simple;
	bh=CC+w4v5x+lKfG03v7I9HBoqcRXi5E+1FHHtfkyyNmJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHOPEAdYP98jKpRU7uyqg1GNDi5TcMJKoBypa4rznry9S2XLPR+VS/aVqYOtvlfGm0x5+F4tZbb53jNjzt3CK+UydddgVxaPus6m1QPE7bCMXM/wgqYjGoW9edZ2A1pC6Y4RzQQP0mKks9+Ou2Uk7hIZ6FVvZEKb9YlQiCZbXRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0F5q8OJ; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0F5q8OJ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84eb072307dso219369b3a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 04:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786276386; cv=none;
        d=google.com; s=arc-20260327;
        b=XMjsAyTjMZzGFfVknq3MJ7cCbnlI0Kmpju1G/Tgun2sYRCfqdN3ve5GjzJtOUIlakL
         S2qCwHU0TxYDuEpJLrmDoS1LevQt4PK1OES9xeDXfxhnP5Etw04yczZu8nWfcdSe/AMM
         UzhAkJdZt3K9dJ7ihHFiu/OG9rYsBhXaVF5mW+BoEeF5AKyL9054J7nThSTK2i6EmTHR
         iQzXhD6RIvK+QoP2KeC6Bdo60ty3XaSgBwb4nC573tkLw+dwepSW6hJk18qD1/UtKDUS
         69YEKgXlgePuPZJLUYqNhtRbsnKwEeJq6qJTLbd7MobFQVcRg/26pUD7ooWuNvpzrMFX
         umPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CC+w4v5x+lKfG03v7I9HBoqcRXi5E+1FHHtfkyyNmJ0=;
        fh=qjtPLMcX5YHMYmIOxWG3+PbVRGeIoZ+UY7M87cMaexY=;
        b=rMQ1vfArnQjtyo1M53Ss/hanh3btonigaXuNbrYDFX6DDuaOTqO1WWAGLE38xaEL1h
         7x4OER1FLG/ygzuoHq2HnfPkb4JjcnyR75SNSzCRcKv1GWx7euHnOgP4XP1GuZEz5TCq
         vzr+KBryXY+ZCkNdz228Uzd+7SSSUti53p95xs9tTlb0K5C1wggPWvA8ZBpGCyDtzLdV
         1zt0P7hpeivUwq40EiH/ZwDDK1BvhOstNdm/K11T6I32whUWNaBz6p5kg3l0AlkKdTr0
         yf6muLRKCdA4/jUs+2UPA39sLS/e/w7deVvicDKtJNR5xSjNDEXrSoB424+pSJnH9BBE
         ykvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786276386; x=1786881186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CC+w4v5x+lKfG03v7I9HBoqcRXi5E+1FHHtfkyyNmJ0=;
        b=H0F5q8OJ5cRTTA0slD656ypfi0bIHVRoBLz+KtIVCG5rlsbk7o+6+NsB2w5St0s+lS
         nX7EAXdW5qwT9bXkswk510Fs0/E3Ih/RrlMM4h1a3bFlOBXkdji0qy/ICWywaxgBpoGL
         NjCpSQcaweCoYOFekiq4v0ofYvAV3gmwo2jpafFdj2Wxd7jcmOz3TO3dIYgaOoc3jwW3
         gImjmFOQntxabLqLpZqt6nYJdpYR4faRyrJYinfEm2iXso3jxbFpwe4pptzoiKNf9NXH
         1JyHQHObHaxIa1DEpK4yL8A0RBLY+srHy2zor0JRlvk+pnhGSM2cCuJsF31KmNfoe8tO
         QrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786276386; x=1786881186;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CC+w4v5x+lKfG03v7I9HBoqcRXi5E+1FHHtfkyyNmJ0=;
        b=GKJC2/rU20YVc6Hj8yXuOjvlK/3N7OXQNwumjmo7sZtVHShN7nd0qRNN8ButMGfLuh
         NJIJwXfKCS8FtyW9J21Cwew0v6UfGzcKlVHwC9pkl7tD8rqZFX1dQhRAVLKJckyIBi3B
         Nniei6GpHKDubjDv8KPTMaw7OtIH7bhctNhfYGAUyQwD+iFEtwslq4sEVVA25qppfP9M
         mqQSSiE1KdxjLFQf3g8nRYuZCIkQqtBnhq4IvlGdM2U6M1T/gPxzJhEQMgasaxKFNtZM
         +ZoPTU3RprbJTYhHUZ07F/jrH5F+vwf6CGZ/JdQhehFoNVQZUoikKvmpLlHc0bEdDqlY
         CuHg==
X-Forwarded-Encrypted: i=1; AHgh+RoSBejFOqhu4PweztnnQE5axQQCn9sqG+OEJP0wXETXnGZzj+7CdZcLU4qtg7ByvL8D4NskpW/DT3ZtTObY8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye8atCe+0TtqMAhRNo79GAoHHAr4msk8IpBT9kkHiYvLf3pn0O
	1LLsVYYvMCVZ9fT3PDeJJP90u0tNSBgP5jC4XuF7ap+PztRVD1A63rVFNEWDYb1HNHzfOgFC/G1
	Pol6+nlZEzMK6gYE1AD/U8McWiCpSrQX8agRc
X-Gm-Gg: AR+sD1129OyRnsAgNtkHIL9NXJI5M/Opc8pzouIxt3y/GmIryHD1VYxOaBIBIFHRGBf
	6ZpSgD3iPNRM6HdH0zFG3M4Ah5F6/O3j1lEqeXSvBK1fdJxVdlQK3ihNCTisOyeQ/TQEjZMiFyW
	p5MJe0RuQycn9oEhj7xK2gxZgLkTxCbpUxUy8ZslZIDLcl60ln87JAM3NbtrrHzPbfj3nKnKFOv
	Af87YHTjUXrFz8wuKwKLVSUAFUgY4WOJMTKlWl2eMeJr/QdmQOt+Yzd1LysYjneFULNVt5RhTHm
	4oiuuZUbIKhkDoQzKMyOJlqh80VHdZQc1LOKl5l/aEIn1m6mkOP5YJYbGhmAU5iB311Dk5V5A2R
	hO43uevqJQtvQJ+31XiM/uj2BTWkn7s8kJDByHwmXOi2+Cs9oQEXwAnXsAknb
X-Received: by 2002:a17:903:2c0c:b0:2cc:d6de:d58e with SMTP id
 d9443c01a7336-2d0cab4cf8bmr279075165ad.4.1786276385756; Sun, 09 Aug 2026
 04:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805190012.2934907-1-gary@kernel.org> <20260806170101.67544-1-ojeda@kernel.org>
 <DKI2GNME8JEU.27LL7M7GZHZKQ@garyguo.net>
In-Reply-To: <DKI2GNME8JEU.27LL7M7GZHZKQ@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Aug 2026 13:52:52 +0200
X-Gm-Features: AUfX_mxWUmfsWvnlQdackIqF2MdVjCznd7IvgrTx1dNCzI5vB6E17kVrKjErbnw
Message-ID: <CANiq72k=xyeftXo7VLvxPQkaOQdXZP69rK4_GhcEc6khuaJqHQ@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, gary@kernel.org, Mark Brown <broonie@kernel.org>, 
	linux-next@vger.kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 12:45=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Thanks Miguel, the semantic conflict resolution looks correct to me.

Thanks for checking -- by the way, I think you forgot to push the tag?

Cheers,
Miguel
