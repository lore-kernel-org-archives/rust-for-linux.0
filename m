Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AAF3128B8
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786038838; cv=pass; b=dA0M3Qi18IZUxqFQI/+Gyny+6XH+NjtxG3q6Rd1QZmGIgwlHkHJEcx3VBME5Vlv9Y+dBQxZjQUnQFdz7paFIb4gTA8QWh/ravHrQQxL+ozuj066Eit7qs7KdfRdp5kXTcYgLojqrxeo/DM8mva9HYE3+JbRHnlkLkOnY8I/M23M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786038838; c=relaxed/simple;
	bh=Jc1jh0ttXWG3ZdxZkpe0Uwx+K8bHo/xKpsBu0RnOWoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oDzBqVOmr9FufV7P8oemI7I82fp+8NIjCr8VM+Vvai/B5AIouZ6BFo6QnNz1IHjE5qqkrJqKxpb1wT6oBsigE0AbffnRtsjZOYHT5V5Z1/7K648dWGCAFRunNPugwLoUFx9431uiej9oVdK1+quLdLxCxqqSExST/JjVLg6ICqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oo+j6KEe; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oo+j6KEe"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbe41618110so231671a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Aug 2026 10:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786038836; cv=none;
        d=google.com; s=arc-20260327;
        b=By57g8KvieFPHB9Hg5ps4txYW0OZfg0r5WaT750ZWohy/9Ge/WPGzCWA+kFBgJWoPc
         JBLGQP3BWifcr5mXyxiTkogaA1OGkDBizaeZN/W4ICbAZh9nfpElFOvSi4YacXjB5BIG
         Zp4ZOkcrC03aAj5fHhoDshDFGZ7kmPa+5ME5fM0al3hXMo8hAO1YPEBWYbbkWPDHKo89
         Xqs3zc2gD4u99MAbWYWC8BQswX6Xl2pEFJWX/xCdFuvtEWpE5NoROVCgENfC4B+SNwup
         TgSsVi2/gPgzZgqyfxfiHMxw8kh/nwFs4V7WFXgw8joSe/la2Q1jNmMKCPAuEv9XvHJI
         FcbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jc1jh0ttXWG3ZdxZkpe0Uwx+K8bHo/xKpsBu0RnOWoU=;
        fh=BdEnqQqd9D1KMGuHSyC3lt78fvL+MU7hdDm0YzUYuXY=;
        b=ip8iUt7KbWkKbumhrQ7bOERCcQi8Vbg0Y2/vBZNDHrxQMXH6fCBnijpFHpSdirZGPh
         1ozzllQATusi+rZwQBj7p+YZwwmxlIyYQgjRdjyOe8RU/Dgm4l3KysB7eNNZWeVSrqdJ
         ej6Vb3+mGmGD6Ygv96UGMmQoyAV7VUZaPeCXnO8quKPJgHPM6CYEV0Ajcez+T9+pR9Dv
         HUatPyDWX6dmaoC9vulO3Ex9DfbUf468Fc/AUwsJWClO2TCh1MG38fg/K52ISUzkdUZQ
         mEvVARW7pORL1sQsH1ELMIiXhFabaIrRBkNNPHGV22mZQFjbbXbm0k5WSiRg4rnxerRn
         1a9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786038836; x=1786643636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jc1jh0ttXWG3ZdxZkpe0Uwx+K8bHo/xKpsBu0RnOWoU=;
        b=oo+j6KEeFbR9o3HjUJmzLjJtVse+ageMUPIzirvwVisIR5nTWdF67S3z3e1VI7UBxM
         wMMvChHvbOafjTCOn2AYozEolxEKAKxcn9WWc+rdT4B1YlgcGroAzSBBOS0iQhomOfWQ
         z1RkbuOAD9dYuubMMM9gEZJkSkylub4v+6z/Tm8nZ7r8MAor3eNBpL5lOdljtOq4eA20
         Qx4bXJlWJYL7jLjoWVYzk/BArc/K37jlrJvqqBNUn6KYtCShAI446+ZCTB8rQHdDBzlE
         BACFMRY1QDqiK1Zj06a5/D3+ejpePaAyduRq353APp37Se/xjKJA9svWJP8HF4TgQTEY
         BzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786038836; x=1786643636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jc1jh0ttXWG3ZdxZkpe0Uwx+K8bHo/xKpsBu0RnOWoU=;
        b=OS2PLuOMoj0U0cPJTBiWFaKvgpYXadxlrYIcCC8YxhM9nEr1JVJlG6ia6BL031Veff
         dREK5KnnSUxjmqGqaCaOqZl9cuUBXfYvKkj1ZPJqKreodTcdzdE/yUnCWKi8zqpPUJi1
         61Ym4r1/sEx4ybld/XebFJuXJYu631Tvtq3XGvIuAYM+hUiPX7EHI3fLBXAjmxul7L3+
         JygK1oQX6G3JIiK/zd8xxE3CxqzUljWk12MRMr4vXe8Dkp0EdnYk7L8pghZc/G4NOxHt
         HAt3uM3F2pn3mtlXpYAhA5I8LDjzaGXxK1BGDNb43fNDX6iEgDUkhcQcqHBaLJQnMsil
         6Smg==
X-Forwarded-Encrypted: i=1; AHgh+RrmtIVCF96MXe/huz3b5mo12E5IdeoFZaYfpAEr6nOpCqhhvLB/yvvvhX2Pes1qd80LG7+/L74jLXS5d4ASLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYDG3tQqgAt5fTdbFEmgDKBMuZhJRGulBgkawLbz7+b8AMSnh5
	lS/2bHrG/MBr1BRsvcFnmE4/fh/Ir7ggXiOtNWnPipVQrQ1m0qNwaLh5tsiyAMe9uMGMoqil3xd
	8Unmg7pDhGiab4BEjh6yKayFsdXMdz0w=
X-Gm-Gg: AR+sD119fA6YvUEXWUTKXsuEz3hO6ZWSzArAv6scXtvwXWTXK7oL1BGMXJoVGwy6hWN
	SM/rsA6UagTGp4zRqwohvS/YFK5d8x833DA6bA5srMg3vs1pKSBcbUcreE6rAdNOr2TzsSqNtX4
	7Ik30zxvtDKd0cKuwv1TU8G18auoN5d/L2dTJpri++gei+nZXCKdvknk1Jno5NzLrNgbFKK+PiT
	xEqgijnOccGXfRbpiiZOpccEgq1E4fe5LG4HjKe2QiBrwQSh1altai/sFpxKzeoz3mmNSX+WLG5
	5fCGGpqFsuX/Ji3Ch2YYCx/la3JRz4AAFWWoAeQT+jeLgMk9J4752o+Xn6KGdRm0cFsJGYMMpJI
	MOswldfANsUCWFS06KZTm8/IPYgCrgnzzV/F7VjyCuMk1tKKrwl6GBZluudVh
X-Received: by 2002:a17:903:19cf:b0:2cc:f4d4:29a0 with SMTP id
 d9443c01a7336-2d0cab0db0dmr153501185ad.3.1786038836158; Thu, 06 Aug 2026
 10:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805190012.2934907-1-gary@kernel.org> <20260806170101.67544-1-ojeda@kernel.org>
 <ace18b0e-bda1-417b-adb2-2ba7c36f1c1c@sirena.org.uk> <CANiq72k9hzdU8QF32HEdvpaz9K7JxE2vxfyRFVjaePciyzgnTg@mail.gmail.com>
 <d743e4e9-94ea-482b-984f-cfb1a3b60393@sirena.org.uk>
In-Reply-To: <d743e4e9-94ea-482b-984f-cfb1a3b60393@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Aug 2026 19:53:41 +0200
X-Gm-Features: AUfX_mxalOypU0rpE7BnWTwTbtLAHW7HGYNPe48IeVPHDHscmiN_P_36vZMyZtc
Message-ID: <CANiq72mzVuEfaf0xuDLMy1M25Xu+G2WvEVC-E8Xna52hPTn9Pg@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, gary@kernel.org, linux-next@vger.kernel.org, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 7:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Yes.

Thanks!

(Please let me know if you prefer a proper patch etc., of course)

Cheers,
Miguel
