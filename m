Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E35176FB0
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731854737; cv=none; b=r/jVH7qCQo7FEWi/LxWYaMk53bPS0WfT0njelaHr5j5IzqSbD6MivTvQCAf5yYspX/VvywfLrvNppcxpoYY2CNKn+a77Lmiw9twQfy2SnyR5BHyOhvY7pTVKpzF7JoYSatD7mWPBEXMRpNRolHYNRfkm1ZREZboqwZKfn7oc53U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731854737; c=relaxed/simple;
	bh=us9oQw7E/wsjDX6uaZJ4VPtVHSSPuc56nqvcDjnbBzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9vhwykHGPfjmWfzWZA5J9BJnK2wwekG7GFxEFG76S4ZqkoPHJ4xKLb/9mJC+1n/BB+uAMRCx1xpA7Ufv0MShVSPTB1qtWX40KVgUUgiVb74VUQcUw7e+bIuYQ2gpidQ1+Dr5qm0SZFuszPfHY+AFhYbXWJJ3fECgUqYPsZn7mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QynzSJ9U; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QynzSJ9U"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ede26dc527so707391a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 06:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731854735; x=1732459535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us9oQw7E/wsjDX6uaZJ4VPtVHSSPuc56nqvcDjnbBzU=;
        b=QynzSJ9UoBPxnYnuthOivzS5NyTAmFKXh7t07YBKUsKz5jegs9EK6knqKyeGerJrBY
         lU3WmvkbuQrh3ruaqHwNt944Z45EbEWJyyWYRSVqPVXxfTbQC1rohOS+Nz96hA7sU54+
         MTWPnpyIoOotLjM5oT/7VwbKESv/EiW4YmVpP2ZWG+a4JX9aXFd3kjiW5OoYAEr4t5wQ
         SrqMYzN2G7HJn4NJ+e8bTzIzN0sgG2FIDcaO4qamINCuRaixRCqEcRxjq+u3epzudjwB
         5aOeXTUgpVv+tGkvqhANRFeDiTnkpvXmhvmnvtRiucBMWIDx0u5p+BfZwSrQIlqqOKOx
         EqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731854735; x=1732459535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=us9oQw7E/wsjDX6uaZJ4VPtVHSSPuc56nqvcDjnbBzU=;
        b=v7/AkK2wA1eJQxFJWrxcH4FJD4USWR6ctwAH6jbQTeP/BeZoZf60w8UeSzqaAKVCwN
         aqvAzUqv8AtEv7yDit1wtqmdVDc2jElAyWe+xVFZ80eOv5UDsUSxVZzIdIYGAkYAam8p
         amjtCaQwy9LkhvSOhn8XsGNwUWgqBtF9q2kaoRaq+JrhqxOv4m23TmOLG6GaAMWFLY6d
         n2rxMtJIsBSmWt3Bbad2lo9TWHtGyn4+Tqy8Ue0/14FDk3pR0mmMnc4uZHDdzwYP4arb
         vs6DnxPZrNQfE3Zjm+9m+Uly9CvCJvssTzvEAmKg8Bzs85hKEFwNr6MINYidqGIXjCyl
         rldg==
X-Gm-Message-State: AOJu0YxzNtsEpY81CgOiaByD+AOr+zwZZK+QuVMIV0cCKbe8mnO4/ZR3
	lUY+6EcXH2LQjQFPZKU9xXpxMd1piM4zHs53Pt7d1+0fD/henO1eFB3ltihu7IK5IHxmiVBMlqa
	KsFyxEZFPKhJAsXojTZns/a6jqyyjN7roWxk=
X-Google-Smtp-Source: AGHT+IGhRM2fIgF4TpmUi6q0QJqbBl9eWQWQEIHnJrnrWDolHSPI9lHAlvzuwPRdbEjtwD5aEGKvylt6S/38TvNm2hk=
X-Received: by 2002:a17:90b:3803:b0:2e2:a60f:289e with SMTP id
 98e67ed59e1d1-2ea151f4782mr4582418a91.0.1731854734958; Sun, 17 Nov 2024
 06:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115214907.191454-1-kernel@mandragore.io> <CANiq72keVxpkDzP_7wshRR=wPubdchbf3HFA132JYca8m+HnAw@mail.gmail.com>
 <wsskxUFiMp-P7-uPh7962QXxwSUviSMoGb9I8NIJo_O4t4ACDvEpDUQJjE1FzMaD__ZMJsoaKpPA3SHq7Re_ogxAa-3pDlHiWpuT6LLFzmM=@mandragore.io>
In-Reply-To: <wsskxUFiMp-P7-uPh7962QXxwSUviSMoGb9I8NIJo_O4t4ACDvEpDUQJjE1FzMaD__ZMJsoaKpPA3SHq7Re_ogxAa-3pDlHiWpuT6LLFzmM=@mandragore.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 Nov 2024 15:45:23 +0100
Message-ID: <CANiq72mGgvAT8BzFj3eKz_3xeQno9o5g6aPcKruPs4G4jxVCWQ@mail.gmail.com>
Subject: Re: [PATCH] rust: add safety comment in rust_fmt_argument
To: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 17, 2024 at 3:22=E2=80=AFPM Konstantin Andrikopoulos
<kernel@mandragore.io> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
>
> Thanks for the comments! It seems I missed some simple stuff but I am tak=
ing notes for future reference!

You're welcome!

By the way, applying your patch with `b4` keeps the PGP part -- I
would suggest `git send-email` or `b4` to send patches instead.

> Yes I was mainly trying to match the style of the existing comment since =
I wasn't sure how verbose I should get. And I agree that we can be more exp=
licit. I am not sure _where_ we should be explicit though. I am new to the =
project so this might have been discussed already. It might be best to docu=
ment the contract somewhere (possibly a module level docstring?). Then be e=
xplicit in each caller site on how the contract is upheld. And in rust_fmt_=
arguments we should simply be able to claim that %pA requires a pointer to =
a valid fmt::Arguments struct so it is ok to cast and deref.

Please feel free to remove the `#[expect(clippy::missing_safety_doc)]`
line to add safety preconditions (that `expect` is meant as a `TODO`
too). You may also want to clean up the `// SAFETY` comment in
`call_printk*` since they are related.

Thanks!

Cheers,
Miguel
