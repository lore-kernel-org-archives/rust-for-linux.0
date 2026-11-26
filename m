Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795714756;
	b=1wfeMy84Z5ouo8XYtHJ3cQ91/iapKhvaFm9s6ZtezFk9GsGSX/jSQ+xhzO7GslkCgMuL
	 l8CdKIo1VBV46q7B71aQMFuLeYbwZMcUUztOcHPEDx3KY+i1kbSGCwbKkrutnuOuLlMnA
	 qp3Fj0WRLFpGQ0ypAajx634La16IaKBUEcuyghRUKa+SX99VA335cs6VyLxCjbIoy/ufO
	 PBHpd3rziOz5sPypbXbIjAbVRao4iNh5zKoWeDWegSwcB6InSWAKLwZk6woYDiESu8/Hs
	 TMvWnKK1UO1ymfBnkTR6bTv1xvor4EHpr/8rtSWSn7IZyBI9Pj35KIuHG2Kjfokcr5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i6Byx0vgKHEW7YL0wzB4/fobaPVqWn2TsKZAJnLVE6U=;
	b=21S9p504PF6O62wtmvcmKOr6Zd3EUmCXEMmEcOC/oSjnFQ1RNk89J4yMFcdRaoeoadMI
	 /xI8iAk4DaddsgrCAOTj42BTN7Y1vmhrzkxwQBkxcg1LT5q9m0UNBkvBhMHCR58KX7cNs
	 sdzJRVJJb8qDc73msmL9LTuFckE5EOc9RgKz1nL++MmUPV2QxI8GZIv0t5zRddxed0lGR
	 5N7qP9eQM72U9z8GYLQiE6cagV0hlQD839wuIO40RoturTDzxBwAZbset8rb8plVtGNKD
	 MBhErn38fMTqeA/wiQPanJv/4oh4qAvT7shIB5Rc/4LGzkxST84EEwXqf+8W4B7ZY1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C638606A31E
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 17:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C638606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-92157f2e8c1so55801596d6.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 09:39:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714750; cv=none;
        d=google.com; s=arc-20260327;
        b=SoUTZSggdg11riCIgiKxzLl6RJY0aKXSX8du/15RUsLT4otUtOfchdyQdYHxFEb1za
         Uy9x3NzjesmxU7kfxZlv1emQipxTtoN5ovyxMybJiGtS50XP1EJ6qm8wg+9E+sGJl+fX
         Qh8p0A+d9xfMoPfW0UsMpbs0gcopDCWKYg0OaC6CfWKpZQu4SUzQ0eub50ErKPwBljv4
         DmxoV0byToCuQX3P6UhyJA50VX9yc3pEmCUPQV6Xp+8a4RTeQZOo+fpF3FzpOIgoB8Xq
         /+qsjD5lPO/gDIvB40j81CJSYZ0cCS3XubsrkNEfiAkHJ1FSK1lZOKN3rF317uqKkJic
         Ow3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6Byx0vgKHEW7YL0wzB4/fobaPVqWn2TsKZAJnLVE6U=;
        fh=sDkcjpC9OPOrQiEcA88Xy48mCsuwPx/tbstdvuxn25s=;
        b=GOzu+hnwKXzMsNmMJwRXpo+42re4t6WvBV/ZTRbCgD3vvusv5ble6U+utRSUyCFzqM
         vrnGF+YvE8kOKCij2EleaOGg/isbTtjSldpmSvQ1XlbI/szVohgpW6EhqyOFoZ4hxHpA
         fLkNXy8mHZR6Rij+i2mgHxTZ7N+HAp9Po1NLhhnMMiBYvvoCtT6P/0kcOsMWyo4mt142
         1pFq7H8MwObaH27HdpTuQlMMNvZPZVlr+4X7mJ21KGPo5CnqeiKZAlmsVItSgcgzzaGK
         8jgxBfkH4EHmO9jFr67KiY0Ufe00hXrVz+Qr/wVutstjpkhaNxS0yLRhj1tTpf9ncMar
         5JlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1795714750; x=1796319550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6Byx0vgKHEW7YL0wzB4/fobaPVqWn2TsKZAJnLVE6U=;
        b=WAGRHCmHlEAu0arQWfqXzN06Ck0+vGe4GirOTzGET2xld0xirUELoptRM0pH8b3BUq
         CuaEwO9oxSfWw5uIf33fw5sIi7ZSZ+/Nzz3zsJt2PA9HUmXkE1DQBOFrOEuocx0ya9ZV
         W2nisvRHVsgjoYMp42NqYA4GDEVm99qMIqPlm4ssgpQYc3fWN9nom8mBm6cBTGYEdKxa
         bCs4x91XpmKDHQ5V2zxvW2vqYazIBpPVOQxrY4I2fV8YUneSXwurZ7rs5qTPxsPXf5E+
         +QmZEBop57q0QpB50Eg6ptV0qC2TjjxuKDNM5jZbEbnBM1ScCc8gFw65jA5bbHg8GnNg
         v5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714750; x=1796319550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6Byx0vgKHEW7YL0wzB4/fobaPVqWn2TsKZAJnLVE6U=;
        b=heXjMwFA7ksxMNYiznGzMj9+fiXsRfO3fQRCsB3jOy8+4Nor2cfojpvfgBfbflislc
         tWEZhI8QSEqF3proqA0CynQgWQqEG8X9l1j0jGkvpdM9HUiCKBPpwlIOE6olXT7UQWS6
         OUf3azPWuOnJy+EMK8geRud1SgA1HVt+u+hbEZlquUfZRnBnEH3HziVb1Kk1AM+WwGI4
         GkmCpAIyNbeyFG5LncGZd2Azj/55pJXCq0j5dvZWItZ5SpilLwu7T+5/HWIVSR5r5tsS
         QpuoOBnhVrdMQHG85uFuj9NiasYI0I0afm+dJRUrxr4g18BEzxeFTHpL/OwYy5KZtDCP
         Q5tA==
X-Forwarded-Encrypted: i=1; AL+hErEGkFVXAKVqRP2FL+0DVSR+POSwXg0EF2H1A9o+ozUY/2l2C2PrZh/+iuz8vhxQXxamoVI+j5icpbagtxvJTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8gcOXDkfjDfnrPRm0BZKCPCoV61sNL+wvzeYJFUgFHAAG8VV6H
	5GMHDjwGoGdXgvB5LxQ8pFGy4kxz3yP+jjKt/rT8tj+pchSAFwi1sa2uQKETUvtUr5uhF3OvUjs
	+AYmgnFL66PMh6kfJ5BLYMsLAhM4yTOdApgMUCs0Mfw==
X-Gm-Gg: AZFdTZeYLc3II5lkXj2CFHa30+Pa8rOP+vgTv67yDdAn4iZUzRKkoXxOxX15AAw2kcs
	+xVWquaEwGTOHfpPTzlOOafyDSZvHUiwR/ohbAv5NpGf3VpwZGmM0xOzrLtkngcksBP3KwFNs2I
	f2xvmY18oJVSNMjJYHEbOsHGB/VnNcUb7bmTaUB7ux6iQENcKBhCpOwav9ajdqAQKp5DdFaSCSU
	B1ZVE1mxn3zQVoGjs+S29t90/pywSG3pM/9Dbl0AKOzrfVDreueNgoeDAeMkU5cOj2WBcwXOT9D
	k7VcaArSQq3Qb3xySm2QbrXk/LM7lcud/Fmai2lw3n86jGNz4QWHwpvSFIEG2RkUs4/ZBI6Qis1
	WVDSQxUZNN67hDRTHaHqzOf9EGQEQ1SBlG0k3p3o/lBsHfUkn6YFCl9Kq8KdA09tf/bWrPA==
X-Received: by 2002:a05:6214:248d:b0:920:ee20:af2f with SMTP id
 6a1803df08f44-921349db00cmr432813936d6.6.1795714749912; Thu, 26 Nov 2026
 09:39:09 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794600927.git.pgovind2@uci.edu> <CGME20261113202542eucas1p27ba92593376041c476afa9c5286205cf@eucas1p2.samsung.com>
 <caddec5478a0d39a73152247a60bc21b3c609cc7.1794600927.git.pgovind2@uci.edu> <9ee41556-4a24-47b2-9db3-9665048658eb@samsung.com>
In-Reply-To: <9ee41556-4a24-47b2-9db3-9665048658eb@samsung.com>
From: Priya Bala Govindasamy <pgovind2@uci.edu>
Date: Thu, 26 Nov 2026 09:38:59 -0800
X-Gm-Features: Aa3M54pu9Qa4ZZ6_EIlNbo-KxPT-Rg77lhi2tuQOtAvg_t6FJtZeW7oVBArQtVU
Message-ID: <CAPPBnEbnBPsYxE5ZXPkhGfueMoYD6DAH7dDrR=wRcq_mD686fg@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: pwm: reject over-aligned driver data in `Chip::new()`
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: ojeda@kernel.org, ukleinek@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, elle@weathered-steel.dev, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, ardalan@uci.edu, zhiyunq@cs.ucr.edu, 
	dzueck@uci.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 7:42=E2=80=AFAM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
> The C layout uses PWMCHIP_ALIGN, which is private to core.c. If Uwe
> agrees it might be a good idea to move it to include/linux/pwm.h and
> assert against that, so the two can't drift apart.

Thanks for your comments. As per Gary and Uwe's feedback, I will
shorten the commit message in the v2 patch. Just to confirm, for v2
should I only update the commit message, or also move PWMCHIP_ALIGN
into include/linux/pwm.h?

Best regards,
Priya
