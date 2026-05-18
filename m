Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9F2283FD4
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 17:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125835; cv=pass; b=mCsqxRPOFPpYhPDR7EsjRWx6P61AzoEIpCjcd014Lmxq8xFuDHJzHC0y1CUkeuNVGn9Ql1ovK6vWPKsKh3FMSFqDWYs9lWGgL1MqYoipNxMVYwkxRAL3P5bGO2OQDz33isAq6udTEDKnm0uFVmsN5tlbP7gS7CTZOD11VD8fAC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125835; c=relaxed/simple;
	bh=jrvS32sEevys8TZH3O55MR1p10eVSCxD3OnQbjCZDD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2EqhOu+H3exdV+9ErvDfTAwz0Q83ExwV5NhbYY1FCcJZI7wHwmYGXfHu7q0mc32yYQGePu90pFU4vlCUuHuwtov/41GEd43g+mdQvF3tJEH7J/GIWptdcmkeXm/uXncVBRuQ309RjKEGJ+n4uR/rgGXLMTpQvBFw9UEu/0rPME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHQ+EcpW; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHQ+EcpW"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f5ae07e2b5so149813eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 10:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779125833; cv=none;
        d=google.com; s=arc-20240605;
        b=cd5C6f5Me8lrB6nb5fw+ZMRPmiUo+L7phlEJKOZmkPeNztgYeCwTG3PAuHsVXWZ5RV
         H6lLZMb7Ayzsgi78ulQXEM6gdofWUJHhYd99XQTXjKIf0yQMNx5mqtAoZ+5eQlx8r2kE
         xEjs7QhjxIvQV46gvk8om8S2podrlpaff6Q3AznAviuhbTJ5E3LXLkMlpG87gTZyH3nK
         xhacxiUmc8PcMtLB0j1zHsrdl+gGtVFc0MFlIGT8U+zwjZR8kihl3zWpKZhSJkE8HwCW
         7AjsSf9tPyEEyBJ76PMEBA/QVC31gjjqv1KCaUjpLoKchRrYhZr7oe0YRZl2DhZN20jr
         d03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0HX17qVGSDXSzZemTKi2JBGH3uqyvO3ppEnIs5HIR9k=;
        fh=80f3uSI+qsA5hMelLLETT+BaYcpqw+4mNFEdmMJatz4=;
        b=aHEuhhHiLgOoZDc5BLSl8uQWeWbKOprJy4Jl+XIlssConH7kLOQOgKsrlSxVXP0EPu
         i9IfO2u4m2XZiePUla3BzwGCSG1WMBm9Gzd6e+26k+b3rBYZH/Qh7Z0vQ7VOsPO6IPuI
         yk3DKGncZc+vSbcHc9eEk5Qc/oA1Fsiku9S7CKZnMiq/RdWRRV48WxKT0W4jRLGmEWud
         hVrshCsN8xi6FzCIcB6dLgjLzoDlSldbJOPMYTLm/Q1eBvYcG1vNHCeXSquyX3KkmY2p
         nt0aKz97nptwnLxJu7bSOxG2xRghEOa9sk2zSIknbPeuCSLc8eHgdULUxptgsKnzmwo5
         6dUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779125833; x=1779730633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HX17qVGSDXSzZemTKi2JBGH3uqyvO3ppEnIs5HIR9k=;
        b=NHQ+EcpWGNxiHmV9+2TWO8suq1XSW+ehIxJ163fs2OzSZ8zdlHGjLruVBN/60iDZpd
         r7AwoisPfEzj5ePtUZAliNxEeEYkqlkTJBp+WunoByA4bgkmHma7EXGB2YIRU/Bicn2M
         TxORW1baGxevNuryYmdmN+vgzbp076coYe9FxyLhctlRTjxxDRi+LwWBuFR6luEzk2ZF
         ova3qthuxMqhRkdU3taz+CPN9VqU3Xt7WntLSNDem6rzwC1JUuoh6ftExDIg1d0+nF7i
         WmMHqQ4D/ii/QYSIvlDmI+mVGDjFfg1s6DqgIQ5mym3mO/UxDo29jcHFi8HqO9b2Fhzp
         w2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779125833; x=1779730633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0HX17qVGSDXSzZemTKi2JBGH3uqyvO3ppEnIs5HIR9k=;
        b=SXxkRTcktDpJtwJhFBcXmzPuTOl6DBCYEs8XjcYEb2XK1DtE3ejnCkolBGk52o2pvk
         tVrqhCrdpJmdiRNFEi/DimLlwV1dXzcre/pJzN9bizrRWjhCLgjllgSvMYY2tEEE17sC
         gO3q0xRAQMG6cjn6CaRB5+B23rncOYQdWLiDFViI6m/oUB26L2+hVAeWIbFH3+Hq7UZP
         PdZPyKHuRig3wLpiIkbjk99H8XFtOsUI6KSMDUIoP3Vrbn58dIQ8dQFyd3tCTsocruVI
         SJ1lHL7k03oLUWLwy6Rfz3F8uODUXxNILWVjPgYusoNmP9XDeb1KCxC/Va2ZRMHBog/q
         /r3w==
X-Gm-Message-State: AOJu0YwWHy81L7axSwiYN7i/kyrnoM8Yo7KEtb3Gh6sUJLIqybQ+2EIp
	djm+bBiAMJn5RXMyNOwhEJCdiSloVrV4IAoHjmXsQatyf1MCcG9swRKz9A9mQPmb6MXZwZQtrk4
	198PavDwYfrKumv+EuPpHS65uLwB4N0Q2b/3bVSk=
X-Gm-Gg: Acq92OFaaT1M/N8BNbO4E3qkOJYFLiN+72q0phX9Om1/7zYmXcxUwUygy9iPweIYef0
	WSTxVAW6rO2xNh076KgO53mPCbI6oSFBWS7MQkc6IKzdw8jfFpQO3s+gRTSzv8/t9CIL3m6jUAT
	YlkIMhMj8gMug0vHlo5JIJQKYDnBytoVf00VuurKTMBizA4iaN/UaZunVs0Z9bFJUc4ze0D8rX3
	9pfI1s9Lj1fK3covWJJdpkwPXQ6viGYjHlIq32hydwz3rCtTwgutLfOkQG/NUxyJ/QbiROhTuU1
	tfXVoA5ZmWxonPjnV8NIS7n5JLpvquRSkxsAQpqHujtCgaQIuBhkLxYlsWmnVOXUADWXt6yZ0BU
	G4R4cRzfMpywKrrBfJg0+eHs=
X-Received: by 2002:a05:7300:2391:b0:2da:b05a:5a7d with SMTP id
 5a478bee46e88-30397c12731mr2821874eec.0.1779125833139; Mon, 18 May 2026
 10:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518134107.4114-1-cppcoffee@gmail.com>
In-Reply-To: <20260518134107.4114-1-cppcoffee@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 May 2026 19:37:01 +0200
X-Gm-Features: AVHnY4IEBcW_Q34oou59uRlgX_xaMFEhRhkXWKkbxl7ggzI2sZKcR1sOQptVmvE
Message-ID: <CANiq72kyRjidJ=s2CHgoP75cJ3yVZtmEFyraBocjkLUuU3+xPA@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: module_param: replace pr_warn with pr_warn_once
To: Xiaobo Liu <cppcoffee@gmail.com>, Adarsh Das <adarshdas950@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mcgrof@kernel.org, petr.pavlu@suse.com, 
	da.gomez@kernel.org, samitolvanen@google.com, atomlin@atomlin.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 3:41=E2=80=AFPM Xiaobo Liu <cppcoffee@gmail.com> wr=
ote:
>
> Replace pr_warn!() with pr_warn_once!() in module_param::set_param() to
> avoid flooding the kernel log when a null pointer is repeatedly passed.
>
> The original code had a TODO comment noting that pr_warn_once should be
> used once available. Since pr_warn_once!() is now available, switch to it
> and update the comment accordingly.
>
> Signed-off-by: Xiaobo Liu <cppcoffee@gmail.com>

Isn't this

  https://lore.kernel.org/rust-for-linux/20260226120848.82891-3-adarshdas95=
0@gmail.com/

and this:

  https://lore.kernel.org/rust-for-linux/20260427-params-pr-once-v1-1-3a8c6=
4704cc4@kernel.org/

? Cc'ing the authors of both. I will reply in the second one too.

(Also, your email seems to have been sent twice to the list)

In any case, Sashiko is correct, this "time-based comment" is not very usef=
ul:

> +        // `pr_warn_once` is already available, use it.

Cheers,
Miguel
