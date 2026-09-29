Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893F2559C82
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707686; cv=pass; b=ImO8DSDA8Yj2Lx8PDGDNPufyo+cZ5ibt/A2eQTUgECBIarhW1dNIqBP0nFbXjNSkMrKwf1ObSU8iJGK++cvrc1ld127OhTFcXEojccCh6QMn8mDlyYjJLy5rfyGU2gUxejXMC8cTObXIYMO+hPbh+NQbN7LonPa1kS2E+QVLJSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707686; c=relaxed/simple;
	bh=4mXsG2n0x6/G8L81DtdCpyrZDoIOY4779O+uiKUC11g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lii2yyOygcld80LlbXbBqE6uP/2EELJb9yH8FNMjwfBS/bM4+UxK2DjNafRO9QCsNo/wp9vtWfSJZVyuu/vp4SZoWVih9Z9P6xrROP1BRbV31jJOC3goCCFLqdj3CcqjjQeQauAJSgtoz0ZLW1IVMn3EUwGMN7Wsa8Nn6/pyavY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sc2acfu8; arc=pass smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc2acfu8"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1431a73fa1eso270537c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 11:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790707683; cv=none;
        d=google.com; s=arc-20260327;
        b=rTfZJIJEOsxX+aIAgZgn4PoU9i2B9wOCooqL5FzmloGM/ZZhbLL4Wvgisdzc7dhgh2
         VJnAr5FPKoMHR8D3JBjiyPq4T956AAk9jUoqxMESwedvVkBVjVIBsNJYoWagKH3Kx7dw
         ljC4ZtwSTVE4MnNeNOkEXOh0KpMHPDxCGmj0powfGc+1hrgLArohhpyIviVc1cS7Qs15
         u1do5N9E3T4tMcxZ+56Oy0NAmI6fhntHvFassmG76znZTSUS8B7dHFAZLM04ttmyqDmu
         ohyu6jejQbUvps9kWUq2lpRWcyt418dqpTcoGGfi9raW5mxzw6bBqTSisKryIp/my9Pq
         FEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mXsG2n0x6/G8L81DtdCpyrZDoIOY4779O+uiKUC11g=;
        fh=zJHfX2r1T7sSMQembJyYXCr1vjXNrKnd0jP9KV+2I/4=;
        b=ItxB1fMYn5bvFlEjHYFx5p/jGIzYIA0/hWMH2Qc7hAUAJwYb+g9CmEYqzVCGytKapT
         Sbx3/DHyu5LKwEHlrlJMqi188wF3/n9CeEayoerLEE64tgYHV1Iv2bXWW2ST14tbJOjb
         3i/8+vZF3qiyycnPEovnKAtDoQRhtohPs0FX68KP7F2Uf8lpufVw1f/puNK13sFZTs3d
         sygWvNDSoh+nMOxnFHm80EJNKolAKjQMxhHErQMPje4jjOIXJLVhAIpAgZwah+ebuyiK
         NbO704OZpA7DrdruNMpn5o+Azdix3AqgJ8UP/I94ktFPz3R46eeY92dXE7RBLGOxojat
         NT9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790707683; x=1791312483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mXsG2n0x6/G8L81DtdCpyrZDoIOY4779O+uiKUC11g=;
        b=Sc2acfu8tFHnx7pa57ocImkdMp4errudOJVfi3LXzTYIvah8gO1s+XrvXFvKsVIfds
         SBjOvXD9X/WBum4P4AxJFkzWGz7thy7WwY5rERcnvYk0ocIXox2zTCC91yEsOHhiBC++
         xXIcDPkDB/EsZQtOBUjLGMfLjMbsrllTp5w3mHtgcbGJlIoZvsGpNhklTMVlu5PqHMIs
         TzKLqM7F5HA5WTB7NeVVEQunDLsoY7pltvkyswTzvkZcy41pj8jsDo5Jmt2CEbVaKHJx
         WrRTglZIjPqXd7dJBC0G3ASXkH6bZjAWZvJiaG99EPxkhalv70VGS6C85ymNM3oiGEUi
         g7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707683; x=1791312483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mXsG2n0x6/G8L81DtdCpyrZDoIOY4779O+uiKUC11g=;
        b=V8EPfeRtmBbYY+M8hzY8YfuoW/1aeLW/OWDyEYXiHDJ67yJrXP3sqqhLedVmxiUyvJ
         5AHaLYWqc88Y7YLRRqjbR4dF+Gq3K+2sqmv0qTL9pV/t0je1oiw1JWFAKNNq894LnUjK
         I+d+6hyfJHZOB93gesfxBTMfy3Km0seiYYlrPqdaDWA3/IiZEl1amaD4nWjV2+amJsen
         IuW3dJj/UYNMGLIXgBwLm66eCHEDuPZex2UZdRTsVGqFg1YLQacgrHA+ue4Fxs4EsdK3
         5rGJmTzgmaIiW7q1V3bYS6P0rJddOJ13j+O2Z7zqNvOzGc9L9/oqhmUantRRUu5CUrEu
         vlAA==
X-Gm-Message-State: AFq9FYL8Nzg/niBfTevHLwonsPYi6mtqR/stnd1lAUelVr5dM7cdA7NJ
	ZCFHlcLcPituYk8tAfy8b4HgLrLKWiXU7P5SIGTQb6Q0cP4pRRyZAXOG7XrARzj67KIzuDZH2k/
	+Uxe10jzgE+60mIZHWhKhzTLUBdHo7OI=
X-Gm-Gg: AYBFou0bE7ZFf+WXMy2AaUVAw5JlI8a60Cl1Agx0DAvKsdZKc1OzzmMlUTNOwV2MhDo
	BhueQEzzlYwvUesjZl5m4u+GtslMgytS0Sq2YB4bUUq4mSuV7qmaA7LwwNxuyH4JXJfUMwpiP+q
	8V671Nwupm+g2FCw1btJd4R+zwFHEv1dAbfMtzjkMUnFQSNS5xmcScV7n3PYJiIV9Fh89zMhXp3
	zHWg6nng2N8RsrzPjGfGa/7GgudkqJfLw8otGp3lr15aAmHEYBnL/T2rrL5ZmBMqrFrDsIuKl3H
	fL4p1LnXrfg5uWGdxqrxXCaK/zZKtoVp1OaxWviwCVbRSjhfgaEQOMeIOuTbsDoJ/VpRvTVy4ym
	iLjurLHv4cMGvZPvMBRFxHwx82Ii8FYpNXdWswqPZvOZ6fvymv2IwUeEmucSWVyKpnXy6B1JU1z
	MC98mtpQnT5GL3t9bTFpoCtceLoU5uNUdxOE/+nhVM1X1pFuTWk+c=
X-Received: by 2002:a05:7300:d0ae:b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34c65a6e7f8mr375267eec.1.1790707683419; Tue, 29 Sep 2026
 11:48:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929135855.36775-1-chaoji_xinren@163.com> <20260929135855.36775-7-chaoji_xinren@163.com>
In-Reply-To: <20260929135855.36775-7-chaoji_xinren@163.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 20:47:51 +0200
X-Gm-Features: AclHuK863ebGI2IXnXKyI5Z8WG1aeHKK_SaCRYSny_74NDfJ3eAdiAl5z7WrHIE
Message-ID: <CANiq72=ciUBTJJ=SvdrGBpNp3GvzA_m5NGeWmuCgypkFA1i-LA@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] rust: macros: exercise the intended conversion
 doctest failures
To: Kaiqi Guo <chaoji_xinren@163.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Jesung Yang <y.j3ms.n@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Charalampos Mitrodimas <charmitro@posteo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:59=E2=80=AFPM Kaiqi Guo <chaoji_xinren@163.com> w=
rote:
>
> Suggested-by: Charalampos Mitrodimas <charmitro@posteo.net>
>
> Link: https://lore.kernel.org/rust-for-linux/m2qzr81jrd.fsf@ip-192-168-1-=
196.ap-southeast-1.compute.internal/

I have been seeing more and more lately these newlines between tags --
is there perhaps a tutorial out there mentioning to do this or a
script that ends up splitting them or similar?

It is especially strange in cases like this one, because the Link is
for the Suggested-by, no? So logically they should be tied together
(if the kernel allowed newlines to group tags to begin with).

By the way, since I am here: it sounds like this could be split into
different patches, although it is not a big deal.

Thanks!

Cheers,
Miguel
