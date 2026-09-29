Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210AE5187DD
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682861; cv=pass; b=eBKIE5OZF/4ky2IRZ2YpP9k52yeujiX66lvtYNmZWDxcuobx4AKhhKboSUQomu+Poc6DhSTBji+0a90mbh5EDG+j4mMs8D2/q/Rcti1uMD/h8SR2uSPL+yDWY0wUpDZtVsC+vlmhywQuLXkR1irqgcRWhDLRQinoURTmptyorvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682861; c=relaxed/simple;
	bh=SmGw5cwf8FkwhSK428tv2i7rM92jCATM9asrQ/AXIpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ogAhQg+BbxnlFZjEXZ2ae+F51LAkfXfVljkEEhSz44OT/AEkMKKOwGtt3+L4LaUV/q0fItPSY0kjaeAEFN36EcWJXT86N3ZvdcexlT/Xonk0OelHiSGeL6Ha6TgkY694UTs9IXrlB2qYHvwwF3y9iGe+oZOJmebp6WwonN5Nxrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX4NUvAg; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX4NUvAg"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34ba85727b6so49078eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 04:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790682859; cv=none;
        d=google.com; s=arc-20260327;
        b=pQA246k53RgO4R2FgfJ3XMplOJmtGQDwODORYP8XJVenzypafXEWF14cXA+UxYkFFr
         1ZgSix8BzRiGf6gkSeKnNa7VikGGrmP/964MAY020hcc+dsswhnjRdFYUh+cmIkGW38H
         sv/IWMj+DxDk+yCt0bQUvdRQ0rVH4B3IQDSxohjW2NyxsgcJpfQowPN7TZF2S+2JvhR0
         dbIOkjDReflXohN0a/Qv1CQPr6AnjbyVxFxurdeqPqBJKg2U5/3akj9OLb/e7WDsiqH2
         kShwb90C+/pzNNXb6C+7x5X233HPr7F5r3yuzG81OqMf2z6kSzOUioYKpqV1oBAEs/m0
         L4tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SmGw5cwf8FkwhSK428tv2i7rM92jCATM9asrQ/AXIpA=;
        fh=rbN+TLEOmlFgH+TtBSdKExE5sypbYQJ7BKcAOrz9CPM=;
        b=NzJUgaz7nB0hBIPPb3h7Q2kKDSUShQsz71g8gbeunZ/11ZiYmMQ2uoimh/+xjQUJgb
         QAypivaocMj26kojfNOUkrHOgfTbnpLDfWQ6DTt3gQnFBmkXJsHQpWjfnHh+Tpyr3Y51
         0I4f5Ru8rub6mMq/8wKYDAj3H4TIhgtHdvPWswzOrOaNg4OxIKTSIMsisyEUz/+gV+hT
         hK6NsvQIVPIlIrOMOmZA87dHtRV8JdR2XW5LUlcqlIUJkOy7EERps/7WKDTbhT+aIuir
         14ynXdYq0X8omJfc5kWTT97l38FwHetI9jbMCpunal5iqBywBERx2TOUxwQx9K2gUQ6w
         Zdbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790682859; x=1791287659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmGw5cwf8FkwhSK428tv2i7rM92jCATM9asrQ/AXIpA=;
        b=kX4NUvAgIMerQzumwlvID4BSJPiNXrU73xRri9EjO5jnI98gmM5hkXzViXiSEFbNmA
         rtCiuvyvGr+QcIL7SjXMiQ99YW+ZaafALeWd9eR1T59nij9wrRDwW1pRziYZzROYTDc4
         hOkRkMYBvgA0UwnHL4mwCLeb0vR2BMMF4s3XLorWYg4De350WLoYleqErUI7PkJ0JZrY
         +v1cT2GyUjJaRNEi7aEptTe+hW+jgqcYNmxm0RZIUr8p1p2zOj9T0S0/rCnK67PQRk76
         R0BnFQdqmyjv17O0f7+XP3jl24N9ThzSxpB+sZ4zid+7eYcXXAI6WjXMM5KANQsFBUxS
         GIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790682859; x=1791287659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmGw5cwf8FkwhSK428tv2i7rM92jCATM9asrQ/AXIpA=;
        b=GTIpuBH2TAuXj2dY1gvpbd+MMWtdSWokteO1atjUD4ANVW3IleMUY+hHkW0rdgXcM9
         YLaTVTXdCDGhTq2MjDjkX5GS6hXt6OLUP8CGWhzUIhEEDoHDREiXauVRRuSQ76Rvb3l/
         rkRzK8QTT5Lkdv/CHEvPM7PWoy4OseEaZITZCITAQMDxklMK7oDVi9/2JdRfwglEj6/r
         SYwag7vU5jzm0YQQb/8xAV72p6pxJmeDQIzPPi0wd9sWvFmmcGGIyNAhKXL99rKk9EDv
         Z5BuECO7apiWcbF/Op2jId5nIYoS4TANwhtzE5vmptYdE+H5G8NME1bYzpfSAOqZpwsp
         gdcA==
X-Forwarded-Encrypted: i=1; AKwUvBwlVuX4U2v78BYchkeAImJLUa09Zp8NckSNpAPD9pYm7Eu9fwWlecrix6YZjAmICxPIrsvzgM7GNhm7LVKvuQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKNreWOIhaSxC+FfqjGDAZXkJRwR0jSaXhGerv3aaTuV6Vh+531
	aGm4WZkA93rDAA1qxd9KbKRbpH/aSBUVbTzVX8DNlhBQz10Yo4cDvZcYmvatORTw6/a8b7CixJ0
	bGO99WYg6yk+Pvj0fK2+5uS4F+wajS7s=
X-Gm-Gg: AYBFou1WQaPzsdmD5thY9gE/HJOWMlJuF05/tJbMATCRT/geX8/IcIEAPgpDRNRpTGM
	1RvaDkkK0jF1ayt2jonFJVFJOHzeQYz0yXpGxeWLqLuqpveJemZMuKbEnqMflkHXdvRvcqDA3PR
	NW/GEPdHExJyLLSoktk2ITHD41pjiOpmgY99SrLalFe4pl1DO1IhwP1cFWxz7fxn6nijTXsE7y3
	t+aiKvPL+koJw/t24VA0ic4dADe5DabN8PiV+lx1NjG4IIlTi6lonIMlTrgo0rVN736IN3q4oWp
	x/eiWiSWTENTSj2sd+6GWuUOIkYuV9Iq9GTb+pGci3dIhS4o0hgumI4K0w9ZYxJ9TXO0svNg/hx
	o5ZtXdZDd62YmkyGT7kHYSoF9sJRPwG4LMqAFtQCk27iASQsOu8kmtwRQ19SOSzGOIEaatv8A8d
	ArAvQuteNsn0/OGdu+4x514As8NxF9shMy93U4ckmDKUhLALxo2C8=
X-Received: by 2002:a05:7301:1f15:b0:33e:6714:3945 with SMTP id
 5a478bee46e88-34271c88f71mr27262504eec.2.1790682859021; Tue, 29 Sep 2026
 04:54:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929095612.1072417-1-tomo@flapping.org>
In-Reply-To: <20260929095612.1072417-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 13:54:05 +0200
X-Gm-Features: AclHuK-K2YexCYLcXJ4KxzZzKWIv2PzV5wQE8Dzyu3hoI7PHx3IWsNWfTmQEZ1E
Message-ID: <CANiq72mRRajbvJzwZZzaMiG8UQT1yeHn3Cm1+MSg0VqLT22dVg@mail.gmail.com>
Subject: Re: [PATCH v1] pwm: th1520: Fix 32-bit build with COMPILE_TEST
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, fustini@kernel.org, guoren@kernel.org, wefu@redhat.com, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 11:56=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org=
> wrote:
>
> he TH1520 is a 64-bit RISC-V SoC, so the driver is only used on

Cut word at the beginning.

> Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")

Should this have Cc: stable@vger.kernel.org?

Thanks!

Cheers,
Miguel
