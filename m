Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701464;
	b=uaZwczqUzq7t9gO3JhZNmjWj1zkXzNGZu17TKzvHNDJykxoA4tGQshGA6Y4p5QuG8hkT
	 8D1KEytDSp51BVPSiXZ1k7RJQ3c1nFDHXGszsl4IboWVZddDQbwp+mJOb6qTXKU9e2vm3
	 TaGMfYUqLUFRU0WZRdpMLBb6f4pMoKfdcU9p8+7TQWND8f3jkv3v1fc+yD2Esk/EnvRFj
	 p4+XttoqaSrte0kK5cWrT+tWvgF7v4RbzZXNmKDEQHrB1tAUxRWeU6bF9ojHiFUUnUzAx
	 ddUaC87pOR0lIE+91aXTQuOWgRJeBiaGyYN7bvlpaW8UyKUS46mMU9LwDmRXbQUSOYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:User-Agent;
	bh=gBovmTrABiLokh2i4ArfvqDEnoWzprwQsU/xF7x18sE=;
	b=bbjc/F8nXL6e15t9y+k3ltL7Y4OgH4ExLlfjTY37qAjaUEbYx2Mm/yk11yJvxgrvooYu
	 SRqXfu/pQu9JIBN05K8cdM2ZIDiupcnERVzw+pknH3EpGmnoaZdmlKCjWUEzNSIXStBAW
	 l+jR5pAhVpypPaFX9ISN+UYzzk+ycWlJS2OLAaXAjiWNZnQfQb+2KLZ6XCx2txIteieGS
	 AHhlNbjGuB+SFsL7YNbBqqQp6mA10P4r0i65dtljRCzBG40AookQy+A5eumLNrTk+Rnpq
	 C4W07XaVHx5tepfUt7rRamReZRW58RBEqFNeBn7VocpK8HQYL9Z0tkzXj9xNL7Q9hXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="H/4z7pl9";
	arc=none smtp.remote-ip=209.85.214.194
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FB1606A31E
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 13:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2FB1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H/4z7pl9
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2e9ae391a05so49151725ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 05:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795701463; x=1796306263; darn=vger.kernel.org;
        h=user-agent:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gBovmTrABiLokh2i4ArfvqDEnoWzprwQsU/xF7x18sE=;
        b=H/4z7pl9RA20KbF8J3Si8jSrphXhiQksVCnaUzj7RRdinRy5AhjsP/mxYDQOfaR/cm
         SxLVg6LJuISuIcBdotF63WPCnCihYNebupidg2D1HoAOQD4PLBeLLmk6adfCZx8grbxv
         8U8d51mmC+rbuESRPwnNqPrhgb2B+igO+toLUA1MkT/XYD/YUoOgCvrCXh8RwlEP1nzY
         4Ld7nypQXPWDxo64Abt5Yp6izMk0BtNPXkJ6NS/gX8EOlA1HnnGzZZiqC0y7EnMP3Nh4
         byVjw9IWa2Pth8IaSGYZOtxP8T/nyA80fPLntrVRG2OWE9+gxJAvIn3pKtYURCan2boW
         km9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795701463; x=1796306263;
        h=user-agent:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gBovmTrABiLokh2i4ArfvqDEnoWzprwQsU/xF7x18sE=;
        b=q5WlLVYsyNSmhmbCfFGGUZDVOA+ITouiFYRgMlnSjSn+UmDSp/lRH6gwC5hkwz5eO2
         9yU5fwDBUMVWVw8jY1tXxyTYJSwwrSGQ+40kL/5T/oltrM5FWrM84ceIF1CPCjtKlCmn
         S8FzZr/HAAl9pdKzcCXpqlzTo3w3mM29fpftZoWJ85zPyyXnTlH9+PWl6hA04/l0knHv
         r7YOrCklskEIzF3LEkAfdObL5AhSBffVAf2vuTlOuKTUGs8Jjc7W3C5LwVvOKhhjVwTb
         H5dxgPZSD2bDIFahFeXcRIey2DohiD+JpeNYz0FQQW1Waikl8OaO+ddnv6pWxzOGElzi
         zs1w==
X-Forwarded-Encrypted: i=1; AL+hErHZyX9rnqCE1U23k8a6jB3kbFc8gc+vKAanM1KhZPtOTYh8+V4IRu57lALP4W7QDycpIQZLWAxsK1hIY1ys3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8yDjwvRa2UX0ii8OYEa80wmeUonWergQdZ1fHxHuH/unvd6ROX
	ZL7JgF4hIYti0NKkqOOcQhGsyfdC1rZ6QYhSR0901DN80M+dQEOe6qu+
X-Gm-Gg: AZFdTZeg8NjXA/rw44ApjUVP/0NP8OjSLinOrl0LbV+peSXyaXoObSdpj7p1yYxHrTk
	qv60KlUnClmf/OcOYGyTDqxAywItG2Wvf6GesW8pcQ8yS65v2/XWWBa7iPviCA88OpIJ1wLHE89
	uqcjhrmSgRMjLlrfU/A7vBGaJr0d4ydE6cXLu+MpQwwmC21G5PkXfa7FLulJHNMGDBqLWNPf0HD
	l2NO6Ec1MNZaz5iN+QN3jIoztsQl3vHLMz6RfWTXuhBDuOnSvgGIC1lQJDoZ1l/SV79pN1EOpGM
	GoohcwkGNsqDxUpRMqCY9K1fkMdFEQ6aT5N0GmJAh6sE2swogIDoClYaF0pYwHXgj6hbVuaHNKR
	XwkFqidBpgPvJtErKfHiTzLm7PM8TZKE4Bs3F806sArSmKnm0LJoZch0Raj+ZxuX9vVVL8vBEor
	lSdM626/W72+1HQmSFaCeiHveybkpoACxJRIKfr2JsNQG3nQujK5lyo2NjMM3AypIYyyflw/QCA
	DpP5pM/3rqOBAF1VZXPIt5MWg2CynqDPh813XQ3Td8SsBSyiGSuZoLqJ8BpLJt6mBHIuQacqUlK
	ghifuXG8V5i8MI6QGpzxhUwHJ9zxTKkhQlU6MlA=
X-Received: by 2002:a17:902:da91:b0:2ef:f6dd:87f7 with SMTP id d9443c01a7336-2f031e1aec9mr168022165ad.7.1795701462897;
        Thu, 26 Nov 2026 05:57:42 -0800 (PST)
Received: from [100.88.6.56] ([1.55.160.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f142b8bsm102157175ad.70.2026.11.26.05.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:57:42 -0800 (PST)
From: Tran Van Tien <7enlab@gmail.com>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org, trev@trevrosa.dev, nico.antinori.7@gmail.com, boqun@kernel.org, gary@garyguo.net, lossin@kernel.org, aliceryhl@google.com, dakr@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: sync: make AlwaysRefCounted::inc_ref an associated function
Date: Thu, 26 Nov 2026 20:57:35 +0700
Message-ID: <1795701455.1cac907f@gmail.com>
In-Reply-To: <1795689815.75b422ec@gmail.com>
References: <1795684556.6d661f19@gmail.com> <1795688552.31c01b07@gmail.com> <1795689815.75b422ec@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64)

Hi all,

I am withdrawing this series. Sorry for the noise, and for the sending
rate in particular.

Andreas is right and I was wrong on the design. Making `inc_ref` unsafe
and taking `NonNull<Self>` adds a safety contract that is not needed:
leaking a reference is safe, so the function does not have to be unsafe,
and the argument should stay `&Self`. The only change that is actually
wanted is that `inc_ref` becomes an associated function.

That has already been done, and done better than I did it. Trevor's v7
does exactly that, is at v7 after review, and carries Reviewed-by from
Alice and Andreas:

  https://lore.kernel.org/rust-for-linux/20260628100731.64885-1-trev@trevrosa.dev/

So there is nothing for this series to add. I will follow Trevor's thread
rather than send another revision here.

Thanks to Andreas, Nicolas and the sashiko bot for the reviews.

Tran Van Tien

