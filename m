Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0051519B4
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 00:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755274; cv=pass; b=pCtkl7ALWwwCxZhgPgvU9ib3JU9nzVJNBrXk9qo/zJHE1lCVdO0I2i685bSxtHXEw9EFLa6V6Ex0pHOOBenC4L5+y42Lh596cBHi2ida74tRwaSEgwq8UC/CzfCTGMSlJBuAMu1hoewqXt7fnqvG3zHca5wXNL/atrWPfY17ZFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755274; c=relaxed/simple;
	bh=3qEbBm1jbPyvcyzPvbQ27b0RLrReUvTwWMgymBGu5P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1GpJp7Jj4nglFezeVN1VK4X2YDe+YjLcO9rfAOzvW9FDf+MhKSwuc/BylWdz+JU2+fpu+DeibyMESktwzlu0M1UTRnb6vp0yxg48FwLaXiyR5zlan+g06W9Zg9reo4U8tIQJOXJxPDH7kqx0Q0DmV/uatBQSLaEsi1XoZvfI10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mv53he1W; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mv53he1W"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124b07e5fe4so386714c88.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Mar 2026 16:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772755272; cv=none;
        d=google.com; s=arc-20240605;
        b=XNy8cOPic2iSqUnAQ/LSCQ/QwVhrPDflggk7j4zOw++nKXFA8gEwQa35t2hKrxO7+o
         5uyzz7W+WT+t64iylMGe11IZLw5ZCLgOysKkLeTrNCWf72kLxX8URjNOGbEHa/OPdNIT
         Apyht967KN5w7X8Q6rkpDr/I3Rkq1hJ7Iw2s3UrZpHv7C6Ry4gK0lvi86og+X9BxiEPR
         yVEudvaEHn0feT0FAKM2w0ZD0FOOF0IuJLiU0LVFCFks/tRZcSRGRALjqxOTSLVdcLZ9
         xyvLyogAxQgUgp7B3Mho9T8uEtfg4VWwj6g7N0K4YQMcuY1UlflMTPMoLTikSgcZl3zp
         UB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3qEbBm1jbPyvcyzPvbQ27b0RLrReUvTwWMgymBGu5P4=;
        fh=bQrLEe+42JEla2/aDSqV2E1rx8nZKzFznanWkrv/MYQ=;
        b=ZI9t3ys5OmV1aZ+m+59M7XrBKadBIcX/l90sShQP48AVsc7u49QwUTFJwkaKNK87XH
         PSSOWGENd6Mr8yuNEeitq61vZmoepalw6bVGz5+XcBZ5fc2cIi3ho/Z9unFP/94tQWeG
         KjPUg8W8XWxwehmW7r0LNkrbDUboMs32AYWK5PLeFPEENpjnBl7WuCbln16jlRB8C0AT
         olpkXsLTT2gzmKzI7yFshyD7zXrMHIHVHTd5Jq9E5/QVUyKAokN0CzqOd5ktV1Qynyoh
         7DIVmiF5twuPWE3yylzdFdBVM1jUffFJfbtdt4f47MjMphTOsTZ7lpxceZhixx9S+tyB
         yQ1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772755272; x=1773360072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qEbBm1jbPyvcyzPvbQ27b0RLrReUvTwWMgymBGu5P4=;
        b=mv53he1WEnDGV0lX+GuahMPhSpG6WxgyBCZnb/0g60YXYN6Ws0r/dNfHVwtDW1C5UP
         U2uTEh/PHvUvvisVjWf8ezIMqFJo4TTwr5dlheSoDaB4BmVVhIGBAbRFJIM7QORlAXMI
         ecAf0D96ULVsbSWvqja/T37jbRDldhcw8yiRsQ3TiH69TTJOqCMqwK6hl7XPC2NNXx6v
         iePE38nnC3Mf5ws0N8uowtH4qk1wpZdJZuTug1mRkoEqOtvSjuvjWKnjWdN5spEIvfkH
         O0Xg/2yN3NZ0QHTXD0+7kJl8chTpTfoCcpsHKsNEyuwQtgpb0YNxafHDSo0ezcAEDpQX
         A0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772755272; x=1773360072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3qEbBm1jbPyvcyzPvbQ27b0RLrReUvTwWMgymBGu5P4=;
        b=epWYLhV5CT+jY7i2IYbP1MANm1sQwMOGpejfpeEMESmNS2RIS6jvKhBLC3FNrsNpOC
         bodqFAJ7+KS73kZ63H+OrU75s0meLo6jqGvt46xTa0vqdaDUAwdN/xwk/7u0nAgOdfK3
         /CSzJB0B615xS1LNTuT2VFQF1rSWc0G44hq6Hsmw7MbqmXQsmuBnRY+0REfCiFlRlySB
         pIe73NoKqyIeQp48uEMsNmzb7e2Siznk/ToJgoSao8n9DQt2qdPFhUKzjwyRVIiyNLQB
         ZK5bE3Ghk5vPdOnNhUzyMVtUjrafBtKf4VcPdt7YGBNZvYgLt5s9bPCXqXHPIitT6g8P
         gOSw==
X-Forwarded-Encrypted: i=1; AJvYcCX1AlYRtGGmrzUlMi6TkUu6pYa60AmMAEZ7FLBvVJnCq77jol4c883C5vM5zfxZiLBDQHo2G3C26J8x0EvJzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe/4txGrFjyzsTxw5id407OPnAgK9DdVWo69ATV1p3hc9MZVNA
	QSGLnLrjx98ljRRBR1mnXxdzWPYAqPkzYYvdADM2b+HqtK6YlpBpcthFsFE/E7bVzviPeWL/Sse
	Xr8xJhw98tNwipRH+lHyUd9WGWvgCWljgPFVIEFE=
X-Gm-Gg: ATEYQzzMphrAmfT/sODezJgLsBReAIF9ekPkyqMDrEw3awkQtr8q730e42+vwlO2NnW
	3SauVR+Sz12IRUkvz04SSGVlgghgHJdWKXBMbAxSIlZD3lXBQIIkBz6t8UItPQ/eIS2175uEA8u
	SAsudGK2jWuAMxS3XxGhX610NteKAbAdD8ehf6W+ujlyi0PjC2hSoEXwFGsZcWUUWcz8bkZ96+W
	ll00twG750r5OF5pIJYJlcgLtDnZovVyVgZ8HnYR/Znl+i6cwMjIEwh/IBCz+UtAiIon9qZuiMx
	nxPSU104OggRaaei4RgO9QBv/SxZhHs3Of4QVLwk/e1LChYQm7p+EZHMTMcjBNSIfrDGsNRgalw
	PP8iFDKSvLQi+t/3JnYLRL+A4JVGyNdU72To=
X-Received: by 2002:a05:7300:724b:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2be4de7afc2mr72164eec.2.1772755272189; Thu, 05 Mar 2026
 16:01:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218154800.367720-1-9erthalion6@gmail.com>
 <CAP-5=fXLNybYv08dDfAqAsDBzbOPzQY4EZQvdY0WZsfrMu9Yyg@mail.gmail.com> <aahEEkHP5g-T_tFg@x1>
In-Reply-To: <aahEEkHP5g-T_tFg@x1>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Mar 2026 01:01:00 +0100
X-Gm-Features: AaiRm51qiqId7CqvK_sID90lFjp0_dfbyZ9p1mZ9wtbLjp2EwVVDFdfBNYEombc
Message-ID: <CANiq72mdo3TFS=t=t05Qc4RZ7a6DNayaDkXMUHBhBFixRjCVYQ@mail.gmail.com>
Subject: Re: [PATCH v4] tools build: Fix rust cross compilation
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Dmitrii Dolgov <9erthalion6@gmail.com>, 
	linux-perf-users@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Levi Zim <i@kxxt.dev>, 
	Namhyung Kim <namhyung@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 3:39=E2=80=AFPM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> Thanks, applied to perf-tools, for v7.0.

I think v5 (the latest one) was applied (to tmp.perf-tools -- not sure
if that is the right place), but this reply was to v4 -- I mentioned
it just in case.

I hope that helps!

Cheers,
Miguel
