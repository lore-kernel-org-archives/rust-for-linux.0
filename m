Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3FA29A1
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 21:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759440924; cv=none; b=VLhCJTwb1jvp03/wcS/9wBeDx7kN74KLhmjeeX6UXZ83YYu74IBzQGF4kfM5SCFSHE03AIIJ3xyMAZ0yItUSat+XGcL21TSXKGMIyLVJlY7QE6rpdlm/pYTTila00bSCaj7b+WdpIATxE63hKWGwHiQ5JYZOJGHgqKbm1iUaBLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759440924; c=relaxed/simple;
	bh=AVVFwwOZs/J59otbhwfw4JT56nx06ai60RPEpmvIzvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQ+lWvt95OnE8/hML69m7Yq+6SddcNJWmOJ9NBzHOJdQ/C/b5wd0GbdIwz/k5QEQpvTN+acOpn19ePCWbLv9kp9cMYE+cY5x9ZlxrEBiFY71WxOZ4x3g8Wx9FSj/3wrA2ZV63jRTEsKhuUocywp033yOn2w2ZzVrOQpm0wVG2RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HShZiSmn; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HShZiSmn"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26808b24a00so2223495ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759440923; x=1760045723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4oFCmF2MJYP82Tx26J9+m0tH7yujIZ19Q3AuUhH2Vw=;
        b=HShZiSmngGwwkbMzDFmKm2X5l/FxURwI4DMKGUulJc0vXxtlAbtP88DTeGYbRiClE8
         CBol9/OirXLiqYuRDqjvjDpL+K2pFKcsYVqPqo5z2w17XveWdwRDp87SemhbUj8h/B8L
         b5IsA/9wmmrfQqLq/SQdcnp6rTNlsoZj51rgYKwwLcpZGk06rveeYHExfvrjN2tVv83x
         +SRkjvL3kBGE8LCVAnn2+s+8PPHTwKkMlEAtsL2vC3oh/Eu9erT38SHaPDOIq2EWvEyt
         vhRmWxseE+vuwiyxgyWRf7laXDUk5N8BS0teY3E8nkQakW4NQOif5IaTk+30sUWFAVqe
         x1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759440923; x=1760045723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4oFCmF2MJYP82Tx26J9+m0tH7yujIZ19Q3AuUhH2Vw=;
        b=UDosRPNtEWufrGwu80MOXw4tNt/iTpbh/5XPHsp9651xJ/whHOvmJJ+HeAJPneDzo+
         6J2hIajE6kPPqPS8+qOmvTMNErl5Q4JiFz0Q6p0gyxe3eS9pLB1Ykas/cUxL41f4yFnf
         SJiHOE68goA7MlE/VqAvzLRaOpXH5lk+XqxSpv5Otb1y5y9OODhAHgGbEgOhfxZT/IYD
         r1qeEXXpjjXVQUPfnMc5/pG/sb9y8lUB1nAfQb/1uB6jPwZ9S+8efgj7pb8nHTx8SB00
         C0Bcf7XT1zgXPbp0YdlFK8WRlNVhaDOD3bkQxfRod/bscjXlXI2aoa/n2/L2k+woG3N8
         VCGA==
X-Gm-Message-State: AOJu0YzLM3M0+RobNt7rKlA6GRC1FlcnsU3HAK3y12SSc/7uiaXMkr6/
	lOaVcKNi5d3zwlJFjgrmEL44beDIphDTiRCu8lxY1rXfEFmUQ8AsowtH7HKgrRXpx4MVD9FDBiE
	2ef216WKnlhfPXSJ9IPRRYQeynPct3EoSanm2
X-Gm-Gg: ASbGncu8V6e20Xk3IxQRCWA4xEm/ERHd51eCRfmWh3Fp0xWGKI6e2aViRlsrVjrQ3Ek
	tVwyWJss7PranNpbBf6CV+gRaheGynZJPTMRRGM8jQYedxsJb87N+XImt+Ksb/IYa0lrx4/7Mbf
	xhm2DPOqXTlFjmq9FaooemP9p2w8tZ5DTXA1gdfsHQsJ1WChO2C6ANuaxGM96YE2mYDX6nrZDB1
	H2s9SIXZwRvTGIJS+bk181onqVYBo+rv/Yuh1CngwJEdewtoT/sfKrhjgzmZCHYrfhPSFmflLUe
	tH+Se/KvRLMGHIs81aWvkqPR3bTLH71UzcthUJZvYL4cDdwdwA==
X-Google-Smtp-Source: AGHT+IG/xHpb8vODrMK0iW2dO7jnh1RpIn7FOgY3FtTrp6iPO2ruZi3ef2cbGbqIJ/HrnJZyknLRRFb1B6+7lSVn0Sc=
X-Received: by 2002:a17:902:e802:b0:269:85aa:3776 with SMTP id
 d9443c01a7336-28e9a6e3c9fmr4516935ad.11.1759440922764; Thu, 02 Oct 2025
 14:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aN6qWFc6hIcbRU1o@sirena.org.uk> <aN7cRUOxq-zwCoZN@stanley.mountain>
In-Reply-To: <aN7cRUOxq-zwCoZN@stanley.mountain>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Oct 2025 23:35:10 +0200
X-Gm-Features: AS18NWBdoHHZzscWUqRPxLm5RbUpvjG-fyzvyu5Mm6idZH8fsQtFe8T5gS5qDp4
Message-ID: <CANiq72mDsU3W5Qfyf=sKhbad4tAHJYF8WnY+4VPz2J0paA2gTw@mail.gmail.com>
Subject: Re: linux-next: Tree for Oct 2
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: rust-for-linux@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 10:10=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
>   RUSTC L rust/core.o
> error: cannot find a built-in macro with name `define_opaque`
>     --> /usr/lib/rustlib/src/rust/library/core/src/macros/mod.rs:1757:5
>      |
> 1757 | /     pub macro define_opaque($($tt:tt)*) {
> 1758 | |         /* compiler built-in */
> 1759 | |     }
>      | |_____^
>

Thanks Dan.

Hmm... Strange, it is the `core` library, which comes with the
compiler and thus should always work.

So it sounds like a mismatch between the binary used and the sources
of the standard library (or perhaps other kind of mismatch, like the
wrong edition being passed, but from a quick look it doesn't seem like
it).

I will try to reproduce it. Did you happen to recently upgrade the
toolchain(s) or something like that, by chance? Are you using the
Debian packages?

Thanks!

Cheers,
Miguel
