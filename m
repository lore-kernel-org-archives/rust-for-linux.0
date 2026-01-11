Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6272734B682
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 18:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768156604; cv=none; b=rp5Nk0RHio4A49srI0PHZO1k5jtg9fr9Kx2Z5Dw1MGQ44yd3iSIXOFtzKVXQ2crn/XIYhFO+rgesku2OB/EF82HJK5VvQGGVF5ivHSoHgfqQcD5oXl6GL43RRErSwqiful3m36lXDIltZmsFL+t1Nx8pQOwNKcbzTWLuHJU5qNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768156604; c=relaxed/simple;
	bh=s/2mrktI9Ze/2SxG4pvtO+MzDmST8OXEJGxy5Z2VVIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUlugBeqRjjtB+nRzwcca7ayKe4gffht0E80Tj1RnfY7ziYZUGIsIU+/tfypigcaUPdXiZ0RN+TbCkhAH8EvLlnFzniRTPDXOH4JWPqqnx1ykV4eoxpU4WySsdABS++Kbv2PxlXuUMnHZnV9oTmYlKki7NiGo/XtpOSHUfLlB6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWfSZSG1; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWfSZSG1"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b1161400afso238182eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 10:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768156601; x=1768761401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/2mrktI9Ze/2SxG4pvtO+MzDmST8OXEJGxy5Z2VVIo=;
        b=HWfSZSG1DwyI9KgyARQXYfnU/eDoVYzZ2+lJv6slS3YX7/MEg1Y3agCltHqi1Fhykz
         9s8S4q6QUaemnKzxMEwvcyF2Yh0dUZwPOQlS6CbI74Q1Gzi5VHuGlbxh9p1/8rwuOeCz
         t0uZKU5Zc1+VtzyCieUAp81OOukusrDCN4hgozLjMrdV5fSDRkQT3LTbGyEYrFHih8rN
         eXSNqXoyclpPZeNzNY99/w5aljydAW/+Q7OmLetUC8TQ2GKQauIzGd678p6kPkIEF/N1
         b8mbqyex1+W6Y0fS9tL9gGnEwlIAVKyjJy7QvdASWcSVoGKF5/WRz1xBL4WA3/cXHG13
         4tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768156601; x=1768761401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/2mrktI9Ze/2SxG4pvtO+MzDmST8OXEJGxy5Z2VVIo=;
        b=WKi+9H0wzvdmDgG53XmYUAaHT+Akncgtgxc7IKAoP313ZzOMyc/gKKFK9+L/37USV5
         IRLMy3a8w7UNiKQxOXgYwbdu2TLvlfTPdedQ0ph4jLSpMU0tSYHz1NsvBIr9i+IvSbqf
         VJG8px06BRwfAB2nCRYxx++ZXsCkn/E/rWEyvMvbdbY3CF5qIn7BVdi81odxdPAXSp/1
         PX7POM6FNneXCy+k+CvcQ/dxRkUn5vkGevuDc0tv1w8T28n/pUnPQGtQSVrFx6tMcGcs
         dHSL0KQ7IOvRhTmr7jbwvVgTnjrl7QaPou0GQoP+bqSlsjySXAScWzu8UNz3TZKz/hZ/
         OIpw==
X-Forwarded-Encrypted: i=1; AJvYcCVlEwleKOm42StGfHi1zL+jxiLp7HJp8x2dNyTc2ylKbb7RhOZ/1PGavEMUeD/FCAC8GCl4W9+sxW1MYEKEJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymo0c1XgtZdJbXiE9LZT9m3EmmrQfBhpWPcJx8IKOp04X/1HRl
	ZiIcTerSUF2CSkCcYF0D9m3UyGlodQAcuSbwqB7ew3KryBFAyKDGrL7nL6hNTHmBeLsHghMdIA0
	pMJCGtA6evb0OzmrHYpq8U1mDQmRMpfQ=
X-Gm-Gg: AY/fxX41UO55FT20JMLN7TvRo0Jd2sZ6hh2SrUoSRjfJBv4QZKKlVgOOHXZsETHfE3t
	Ux4Kv55IOr/TbihDzpylQPUqK6zlQ1X375m0gNqyuVwJbxpJdemrQr4IYA2tO3bwaXLDjGmQ+KK
	6Ag+MQJU3qdrQsOQCou97csU27WEdUn6z6WjkZX1S53jZ2784WduiXLRODl8P2ET3hEVt9njps2
	7lR4yZ7FaGJFpWc7/Uqh2SigDUSu+7HET7wFoNGpoJhYlANISw29t2UpTO62p1pVbaTCqm5lBYs
	yQrYH+yhXwvknGyujIgQYx5nOhw5BSmVQO4hW89nb2ppljDn+wmTpucR5DkRp/2NGwE+XXhxZ/D
	pPqq9nHRkZ3zk
X-Google-Smtp-Source: AGHT+IE4EwaPa9ooRjyX4oxDU8VuHQuoSPv4fj7pnzy1JGMxtuVoPjp77WRf4mi8/tlp22EgG9bSonPh3MCxbrBEs3I=
X-Received: by 2002:a05:7300:e58b:b0:2ae:5bd5:c241 with SMTP id
 5a478bee46e88-2b17d33c615mr7255089eec.7.1768156601499; Sun, 11 Jan 2026
 10:36:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-jump-label-rust-maintainers-v1-1-702b03482f2e@google.com>
In-Reply-To: <20260107-jump-label-rust-maintainers-v1-1-702b03482f2e@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Jan 2026 19:36:29 +0100
X-Gm-Features: AZwV_QjoMCnwZkgR_IdVUEJ9xXA_WXm00K5QWe9g-cTbHjbniGvfAm82AqWYloI
Message-ID: <CANiq72nV0Z_UjdAwT=41TjjfmKnT6WL4hVNcxg_QCe7TAEYK_Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Rust files to STATIC BRANCH/CALL and TRACING
To: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 1:32=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> I'm proposing to include them under the existing entries, as that seems
> like the most obvious place to include them. However, there are multiple
> ways to do this. If you prefer to have them elsewhere, I would also be
> happy to create a new entry with me as maintaining them, or I'm also
> willing to be listed as R: under the entry. Regardless of how we list
> them in MAINTAINERS, I will be around if anything comes up. Let me know
> what you all prefer.

I think this was meant to go after the `---`?

Whatever Steven et al. are happy with, this looks fine, thanks!

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
