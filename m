Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5601D7E5C
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Aug 2026 03:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786244485; cv=pass; b=eJP5RTaIMIqI/akSYH9huCVECk0fwW5WpYckKYYYYvg0HdwxXXPJiXhCoMv/X6HxenCHVqip7kkadD/tIS3Nk+L0rWCTIJm0JKDqvXD2C8mZMDvdQ5QjxoECBmdjuaIADWohot7x1hsZIUYNmJAz9SEzwyDGO6GLL1iO5+W6yJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786244485; c=relaxed/simple;
	bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aOVktUa0yoTx8pLEi/H+CQxOEuVRsiM+2bJUEa0o0lj83EyMNEY3PA6G/9/StbLttQrjol8KgARI+MM+T5EGZ7VOquCqBIcAbdvykF4ES3Tpez+KI1zcaPn0j/qoHQu0rB1Rm54TeAFKpyRKf4vK+UkYwOLb3/vOyPdtlkTiC2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHe1k+A+; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHe1k+A+"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbe4c537ad6so56992a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 08 Aug 2026 20:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786244483; cv=none;
        d=google.com; s=arc-20260327;
        b=a7f/8Q2z44RL9Zz4exkBxs6SNr/QkMdaGHeb3IH6Aq9vCqSWNCkHc1Thf7aSA9blrH
         rq9Xc2nYM9rhFjJNiAlt6AXWQOzjv/sPXKYBIki6VWmuebIn/BPaRw7LJlgGudCgFRe6
         AwEQFhOqdXzFanIhHkxC3E25f5SUeH5om5d2ot+Wr3mhHktktcypJBecu5z6IR361zIO
         LOxXtr4CJn8Gy+xzunCH/wLi90uFcmA0xFVxU+FiwjlJXBb8+I+3gubNsVSJo3ED7t6/
         2SZcnTQuWjoLa/CqV+TiAC5Hqdyi9f3m3EMRaLGebPNa5m2dSUth4as2As2CEX1NKute
         rfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
        fh=m1y1febYU6kVWDN7/YKHC1j28ZcJp3+bbjJ6YNmn32M=;
        b=GeE8PHamdw+d5u+PfeIFzfQlG4Yg8Pp5Sp6oD5RY3Ka46ZQl+oNMBVkuyeu00slkxu
         hlHfKp3ZiAaAzuh6j3NMPpfeoFtxGPKBail/sFpPO88PQkQf2Otn17bD1ew6NqcugCYF
         IjB/c2CsqEtW3i5Zirn3hsXWwINwVphvVQZvAlHQAw/YZF/83tgtGiV2G49RI5kuR4w3
         xvBjfS8kbb4u8bH4sw059dUcE0Z0g9Tdc6TVNro/3up/vC5/6hW0xjmRq6Xd9h0L34HF
         iCtfBXL/HVR1Uctw3dOYldkBTQfXvtt1DWQbl5BsLiBzy94vdq6I/inYZKoN0a9TKkhK
         g1Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786244483; x=1786849283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
        b=XHe1k+A+ofr/m2xBkHUba1sSOt/SKTDPyye8l0XWCLJwKhfcMjUoaWhc22TZNZQW5F
         qmroRaJQ5Sjdcp6TaB1xyRtJqhtUEvkD1u18mcseqsCPlL36fosipukEf1n/JoHnZqLN
         xsIZqpGO1pNqAAN92ET6ybqD8rBAqGivBtEBRe5refWahrYWAZQik0ItgmpqQzMGV6Bc
         jv8+L2BII6w1NMAjBYEVfs6ZamojnVPgzai76p3cSO415Bm++05fhFjivTITm76qjC/y
         iyNieZdEE3mwwsvUNX/7O3jEg+5w+rFPCfYsULrbqLOuvsifYTborhMmG/nTU0eOdEhK
         aZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786244483; x=1786849283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
        b=bhrnWT8M17EiFbraMTBAlbuxzhV+4mY1lTXVsGjBCQ+d3a5z1eEFtc/nnwReOjihu9
         bpPkoWdGkx2oLS8gOcIi2V89bk8N9z2pLpB8ZuAR/RDkZVKj+VUBUYY8D9viGo2MbID1
         xpaUqSGlvW8C6tl1J/SEhjGMi8TGQTZ73yqpEjlbT2AYOMevElsxfh1BzAqioj26nxx+
         7T5GFfa+OQLhpfGLqjXyy/VepyqLDUOvi3jOZyvy5I7tPkEzXKxPyfXGT0ljg5WgIZhF
         FVbbbtJXanAx3nzyDEAWgqp5QFnpBvuiPWfMC0zuR6ijhhOrqh5ruk3WKHxkCiz17naH
         b0mg==
X-Forwarded-Encrypted: i=1; AHgh+RpKp6sFw7MNbh1LbJYUEM/DbZOrr4dFM0JvsUQRMiuG6V9dQxmFTfu3QlA2jiq+xETCWYXJfmmrzDC1wIFIAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhw88ZKfw6kPsICTEXBiAdOYWVFLG575GdeFI6llY08KPNidOz
	oqq998Zd/ZykxnibQwlBH65WpekoJzJ8ixhPOeAMq0zPt6e7gbJHT+/Xh9YN54rofydF554GIlI
	OL2Lolo+3GhrCX4CdUZMKvXr/67DO6n+mW8TD
X-Gm-Gg: AR+sD117piGCD/O1GelTll422cnyEK/cV2zYUdS3oNQ6YMbNHXdpSIk0Y/rXBnPTvVv
	3T88O5OJ94gPi5AkKBZegsiDtJxRqHwuloFJCaMJUefIr4LhZtpm+x6Ni6upIN7INxL8czhxxcU
	Lzd/YgcTD5m28XGLoHO/USdJ99eR/kVvgymYgb/B2vi0LpSQpjAi1lOVCX2v0ykmcGINUhdYX/F
	p8blIbMEj/deg7b3Jy2ZyjCC1SyymqngIm7kNe5rEY9WTGfmP29s4IGi0m6eWu60mMjMC5CyWYk
	t4fr6aVSB0uKrkeAsPrB9OnhRAXnhdCjE7JY6JrgGviYrYQmu/M105e7y+kL0ClE8Dz6cMt/7Du
	tNe8VshC/XqaMErirzPr+Ppf3xdjXXSBJhYgIFbqkR+5At3rdmR67mJEJJM6q
X-Received: by 2002:a17:903:17cd:b0:2cf:ca85:57e2 with SMTP id
 d9443c01a7336-2d0ca7b0285mr257513645ad.1.1786244483476; Sat, 08 Aug 2026
 20:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com>
 <20260808.143013.1251068388254615351.tomo@flapping.org> <CANiq72m70uWCRFnhs3axdymSTGCirBrYAvKh2BiT0xqW2j_3jg@mail.gmail.com>
 <20260809.095041.602618436881623934.tomo@flapping.org>
In-Reply-To: <20260809.095041.602618436881623934.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Aug 2026 05:01:09 +0200
X-Gm-Features: AUfX_mxOkJgVjfpd9Xjn2_lEgaaMyCa2CI5K0zvJDPjtb_T8ut0EX3_Stxulh1A
Message-ID: <CANiq72nxE05HEyNmxGj2gYHaYL95eQQVF9SAuhDdHX0RDW1i2w@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, arnd@arndb.de, krzk@kernel.org, 
	alexandre.belloni@bootlin.com, linusw@kernel.org, chenhuacai@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fustini@kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, kernel@xen0n.name, 
	loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 2:50=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> Then `jump_label.rs` needs the same treatment?
>
> `arch_static_branch!` embeds the generated arch asm too. It is not a
> problem today only because, like `warn_on!` until now, it has no user
> inside the `kernel` crate itself.

Yeah, I think we should do it to avoid surprises later.

Good eyes!

Cheers,
Miguel
