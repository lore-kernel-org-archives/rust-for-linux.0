Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FBD3F87F6
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 18:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068379; cv=pass; b=aMRl/hjxv/wwTBzRzgJErV3LrAzLRzUau7A0amGTXRmb2tlChMv7yQ8DYXiWzmrxGQ2odOsHWxtGF/y1iBl+LiXHe93DjadbrPJVxhwrWfe/23hZx4+rHUcF1PCI/8WR3JGUXGJFrdRBKtAI+DZnPKGf1pFg6Gw6IMowVRsmA/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068379; c=relaxed/simple;
	bh=37TKtgRFaAhhsxyBvFjIAwzmx72jYJcpBh2V34uoODc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpkkhr6P+4O0M7xoQC/Mh80aNIpLBr1NO/pAGYAC8gvruvlQWn/nXM8b2IDicWabIwLlsPoTqv/ZdABdiR+gfVDD0P2RYGxU8owp31sY8szemLPCwJD687dgbUvufjUyvhdYc2ObRAypchkZi+ldw4F8wQn2JGrOTYi92DoULeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X20BWxA1; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X20BWxA1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b2503753efso228975ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 11:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775068377; cv=none;
        d=google.com; s=arc-20240605;
        b=V5UvikoETYoPEXufSNSucuI5jOKvvjYJzcRo9Ir7HQ6HxJVRRwgVIDgi2iq6E6CRh1
         RCAjP3sxooaAb4KmQBQ1peVXRvuTWgmDDe0iEF1XYoq92/Bnf4tPHJvVjput9WlAQ/cx
         UUM+7+JlS7TWrT9hA5l8E5H3+NxWmBczOS3NwDIfjzU+8iIpRjc8I1GH6xUA+janCpOf
         fGR/FB52MWKtUIR9r+jFF67eqPTjOIWE03ii/UJ4kc4g4O8da3AX1va31AFWXAEhaJGv
         S0Bfv40lBZyQw/byWjzDM54IUlk2mPSzaPA+VkJJAXpWTHkGzK9nEofAbllAax8uHpXj
         CpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WisBKDZLSam7pHi91lLdwdUdW16iMK0JtWJ0FNqOVD4=;
        fh=O+M5WU261cELGD4SmmdUSshs1iXRn4tYkU5usj3q++I=;
        b=Ngr9lQqaM9nH9OTKuxzCiA7LPQpucY1an54lnNYdW4/4KZkcPBElKt8ibEcR5mjYqm
         t0N5tJrO/iJa73qcDepqdTKrYSmXmYVs62TtC0XGvBRdNfPnRQ4TMpYyRdXCwvPIp8Rf
         cUH472qbENH8dPHRRvgtwOHv00Q/TlVlhqf9vCuMZQHpu9MIzCPiZTchbscfQxqZCaUS
         bZXh9bfnOyySjDRx8s2h9YtMFz0jbfC/+Xhr47AYLsAZwxgvM1RK+8cMycIjK+xQqf2Y
         lyX86rIObBf72PQf+g5ZLrBz23KXsMG1ifQ7qcRtZB3ZBF9f1FYfFpSeSs8bpXTZVVne
         GBCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775068377; x=1775673177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WisBKDZLSam7pHi91lLdwdUdW16iMK0JtWJ0FNqOVD4=;
        b=X20BWxA1uKWgcij4HZvaPhzckikkr8bC5d8a+XPLVAqMsmtDMJ6rOIJIZ5NtpEktVF
         LRobCldTEQugeHHmOFOkzzhdhRmKgrrwxfRtMH28K0tS0PMEv0xktXXGDXXekfA4r07Y
         wHvmhhtookaButLXCDZ2zJCFFaa8uKA6nkmaOF37h7b9YGcczCxv+smei6skNOp4syyC
         d0aAMXD57Pv1jQRy01ZD0DOM+fQZ/t5TKbcwY7YvY8I4bY2nbiMDY/oQJfZpgi+r067J
         W9/qR9qcDzONRnkWt6FoKBvv8qUIAZyPq4rAkdDK+q2857tiY7HjvIqqLbvOhDOTsn8Q
         1FxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775068377; x=1775673177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WisBKDZLSam7pHi91lLdwdUdW16iMK0JtWJ0FNqOVD4=;
        b=UJ/qln1kvipadYoGpol1hmEo9ooyhhB2mQdxgGiqRNoE+tnLHZ+/3r2xId0iFZmrYv
         LumXLD9OEDmGlMxSEXTvYVk2KUyUQ/gYth4jl9FHU9sECWcqug03+izMn1xR6BH0k3zF
         IWUf5ZKiNl3nLx8xRt81Zuo3IhAwZMt7JYiqYrzBHjZ5LeIdt45ZSWB080ypOr+D3hCD
         A4zS/xH1dTLX6yITaM/W8QSn19pxFl+szFplCBJsXoAWOUTTnlcPYsaVMXszBGTG9Kfo
         o+ep9rZATIxveW4RoNOPzrDz5/UDK//IQdppRJYtqHKF0ZNsXEzHFHu2TYTZxByPmLb9
         Lc7g==
X-Gm-Message-State: AOJu0YzQPmZD+zenLDCs480JhWtDNrj+ceZ2MPLwgN9h7r9Pq9LEYvAi
	oNPWMRDCDH64njqSBXumnQPhwUDig2LyP89Rf+U3DkeWp9N64vD5YktJUVrDYopZIyFxV4kACbi
	U6WcT0+VOk1yuFIzI02BjHCVf70++vssBneM=
X-Gm-Gg: ATEYQzxdz/k2QpuW0kD9cqP2e6MzAP4aqPJGvDb0BjpMh5Cmc8hibEuYHA4qdHH1ju/
	HXinJ8JbHOAEV93aRvEYRU3HQ/xmV3v9EBYKSGpNn+R3oU7brLC46Yh0O/23csROD/rbdNxVeBv
	PDBd77bv14mg6dKk/aTgNpoqZFUiE8q42ZM9lSfStOn4HzNFvWMRa9y0s64OWAM8WYauLU3Zn0L
	6FUQaA4gIfxoF/wX4D+mfbjtiW99VvoDLY75KhuYHH4rFS18bUZUAuV6lYo4KYBFCYXGmLhgcht
	OY3tzcotFsKT3MuK3A==
X-Received: by 2002:a17:903:22d1:b0:2b2:6b58:9317 with SMTP id
 d9443c01a7336-2b275d8d109mr3049005ad.39.1775068377408; Wed, 01 Apr 2026
 11:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANBuOYq6d1AQRgzT-6mcQRVVcAdEFwkR5HFc+v4PVBYEEH7q4A@mail.gmail.com>
 <CANiq72nsemAEakyVsVxxp5qa7WcxGJQLehqsnfU8xkNqD9=abA@mail.gmail.com>
In-Reply-To: <CANiq72nsemAEakyVsVxxp5qa7WcxGJQLehqsnfU8xkNqD9=abA@mail.gmail.com>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Wed, 1 Apr 2026 20:32:45 +0200
X-Gm-Features: AQROBzBOAFHisIReTG2iznP_J1gN1FM1xtzV2_Hr98ne7u2XXcZyHp21F9oSmaQ
Message-ID: <CANBuOYqjg8YD73biyEH=Qq3TXt9jRBGU3XvQWTD39YHW+SZQ3Q@mail.gmail.com>
Subject: Re: Interest in contributing - Rust abstractions for the sound subsystem
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, SeongJae Park <sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 11:01=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> Welcome!
>
> If you are asking for starting points in general (i.e. not just for
> ASoC etc.) and/or if you haven't seen it, then please take a look at:
>
>   https://rust-for-linux.com/contributing
>
> I have there a bunch of suggestions and links, e.g. in the "Finding
> tasks and issues to work on" subsection.
>

Thanks a lot Miguel, SeongJae, this is helpful. I'll start with
reviews and testing on the list, and explore the Sashiko workflow SJ
described. I'll also reach out to the ASoC maintainers about Rust
abstractions as you suggested. Looking forward to be part of the
journey.

Best regards,
