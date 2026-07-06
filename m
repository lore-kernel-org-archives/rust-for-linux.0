Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDF02E737D
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345556; cv=pass; b=W5IKOlV1857Lb6KtuapPYenr9xVMJrR0fdq/Pm177FT6hMQ8Wz8OlKl+/bsdS0GmEPW9CKqnxr17/hdkfjgdiYITptQR5yFcy0f84O0ljaJjHqlIwTD5Km/rzkLdJ9pUrnF5b/51yjkbxjs66hvUGe2xEfk16U8ulCZfrzl2350=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345556; c=relaxed/simple;
	bh=gnhdwSxs/2dEIXlbIYVInombO0ZsUEz3/h6snH5BdRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpykh1CmAnEv8lnXN3nYInp0F0DcpCKB//QeDeQSnau7gFYDVi/6f5LDN4ydudn5GPR8v0izTm48Uq90gI7xwLyfaLs50NMpYf36vkU1K6Y7b6NtEbI87RM4wI3f/h1sLeS48A7dm3a1jgwSMDWiS8jyz07ztfnL5Nym7klo4IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T5+BuZ2O; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T5+BuZ2O"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1880895f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 06:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783345553; cv=none;
        d=google.com; s=arc-20260327;
        b=Xzzur5Lwza+19MPuYqudTVbzOeruijGEZHgH1gGkm+CQXiqWeEfAqbyEej9v9xLOpI
         sSeJwSa8C8zKp9LhVJmFGWQ6bPY8ajmO4CfmAwYMhELVfoOOxMRTJ3/0UGqwBBxyUE+R
         9qzbm3LfNWpZHrtvZqYBw6Wbu+ghmfky+aJs+GADMCZCuCCvGUpZY7Ag5cD6f7UZWEPL
         lkqy24bo3HnR7TGY7pG23TwAqmsMarw3qdupM3txDZNzYEvC/1FEWi14cTS6+SIiXX2h
         w7yFsYBitcq4G/OP6S0Imw1o8HpQ3iMAgwSX2iCooCV7DjtVUPLZyBHA2c8oQGP/x93E
         7ZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kcEQsIAK9WaEKSN1vaaZZgykO19KS7IvBARm/eZyWas=;
        fh=mjTT0tNajRszTid+bXAqSz802Sf+pJLG75gdWYprYpg=;
        b=D37g2Q/hNL/nh+jdynKohqNWq9rpnVyTsZuIrfXcOIB3iR2AJRsI9HRxEUrvfGzPEi
         0T2BIKf5BmwTlBfWHBfzHNZ9ep1DOcfub4Tt8Kmvq3YERQm35/bEBEhgaUYTdKK5ExZn
         axATRhlvgRCzqN+srM8IKIDtZ3gAtke/dr5qYKOuFIP7sx9CqzSmIEKZc6nveHqtIuPh
         0DYTTDAl1n/fsJnFAAld+H4ZBFTiY/1RhOzJB+7E8Iywt/q/kWeY50Imrc7XAuIDdR5L
         nmHjhYgRoeW24aluDDljTMIngZX+3+pWykVhQEoon9E/rXhuJsZKIzUtuTL6HR//01+G
         1TAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783345553; x=1783950353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcEQsIAK9WaEKSN1vaaZZgykO19KS7IvBARm/eZyWas=;
        b=T5+BuZ2OUGykjQkrwU+MwdTf5WS65efsJVqdh4WEqcfBUEpFXR8HuHwZfBUpdwdIsc
         An/QMkj2N0BGJQ8e0hqL57aRAi2jRDYao6+LCZqdl5o3NW0EE1T0x8+tdGRTR4nYvwWt
         gfy+4V+tp57og7N/n2oDFCo4jEQhNR+y08brrsfCGFYwxnbO3nK8Sq/UZ23QZnxwcjY+
         hsuX184I3UyiFUlmszho7Onkbex7ZO71gqOPbS/KbECsQ1nYggw72EvBj0NC36VCkJLA
         h+AkaxQoFrtQ8+6u5pbgNgBNO/0p4LPe6W3OKz7L5Ez6T6VBcFq+90f7q/KtfHOtr6yc
         4B6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345553; x=1783950353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kcEQsIAK9WaEKSN1vaaZZgykO19KS7IvBARm/eZyWas=;
        b=aW7i0FiAVqavtymLtsR2Iu3I6S5AG8oLom6VChDI9y5OaRbtM8q8wDQfW5V6SRkMZu
         uUP4AIvh95/nCNoFk9J5sdN7a8I+W5MMcpXvEH9br6GqFpdEvkenlWmuhRSJ2qk+HkeC
         RpCwZ8ojfe+VlYmZZFBAIVQnURwdCiibHifYlO53XUqSfbJStXfCKXPTixAMF0QpB5Qi
         sn8d3TujCv1nBKk1/T7X2nFTFxQPWbIVOXVlohhNspIqORybneQAUnqSZRb5Wdf5KIJX
         RAUSMm18rx0BjqgcbyQ02QzVQYsRKFK/xx4wVr0HBFeihLPhcIOEZGZtDxfdp1xSfkGd
         S0EA==
X-Forwarded-Encrypted: i=1; AHgh+RqrxgHKoLqXqxcU1p7MDYLcS4+ClsFJgONr154k+NFjVbmnYLrsSiY3T5aHFtwQ8aQ00wDBgZvojyYSWus1/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyidIRulney4zTUwv2Q/nGl/ywo+0MfS6yUTUjwo+V+t3uDJlOb
	KpjG66YYxjUzCcXdzoq/IsC3MiJ7i7V0uO7c9GcyGcxFXxJBp2dtH6e0oyDVqkNQK/EP6IXmR5i
	SMpLpACHkDCdJ8MsfGWiEa4KQJFBXhgi7Td9VGijD
X-Gm-Gg: AfdE7cm9BpaVIrdUkolF5qCzJj4sWuQbqkS8H0Ah1nY/ajWO0HIOsFcdpXsS4hfLjs8
	1tJIL2ORyZ+KYiy5UP1EIbru8kY2jUtSl6nk90YzE7Jy5NIDzzJ5b8Rt21FETKgmvWIpA2XTg70
	pHipcHhegni1gpa5iTsh423eQVH7t5wHIlxZdCRkv+OKYD6wEda9G+bv98I1icZ61iIcc5GWEpO
	rynfJlKmEZnb1sZjn5u5my0nmlWDVC3TRmQqApcPUAwQlI4yOep/kO7ysctrAPqPYGWYBaDibAj
	EJ+AiL85ayiAy9IGv49WaNM8PgZn17mBKLOUcfdG3Io9/tMeGZvuFCWEE0s=
X-Received: by 2002:adf:f590:0:b0:477:6874:542c with SMTP id
 ffacd0b85a97d-47de66a2fe0mr238935f8f.22.1783345552952; Mon, 06 Jul 2026
 06:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705-net-vert-imp-v1-0-95a35ddff411@gurudas.dev>
 <20260705-net-vert-imp-v1-1-95a35ddff411@gurudas.dev> <8376fc86-be9d-4e3a-a51e-4d9ecda1b648@lunn.ch>
In-Reply-To: <8376fc86-be9d-4e3a-a51e-4d9ecda1b648@lunn.ch>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Jul 2026 15:45:40 +0200
X-Gm-Features: AVVi8CcfJ5T4Eksw8-ONpuN0gs2vDftnttVKE4h_kMWH2y7YBxV5vjR4JqCNsAk
Message-ID: <CAH5fLggGdcMr-ARGpg150_ojhBUnNaV0weyfk_M0D3AP_Qhw1Q@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: phy: ax88796b: Use vertical import style
To: Andrew Lunn <andrew@lunn.ch>
Cc: Guru Das Srinagesh <linux@gurudas.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 3:17=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Jul 05, 2026 at 10:38:40PM -0700, Guru Das Srinagesh wrote:
> > Convert `use` imports to vertical layout for better readability and
> > maintainability.
> >
> > Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> > ---
> >  drivers/net/phy/ax88796b_rust.rs | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796=
b_rust.rs
> > index 2d24628a4e58..5a21fe09bd62 100644
> > --- a/drivers/net/phy/ax88796b_rust.rs
> > +++ b/drivers/net/phy/ax88796b_rust.rs
> > @@ -5,7 +5,12 @@
> >  //!
> >  //! C version of this driver: [`drivers/net/phy/ax88796b.c`](./ax88796=
b.c)
> >  use kernel::{
> > -    net::phy::{self, reg::C22, DeviceId, Driver},
> > +    net::phy::{
> > +        self,
> > +        reg::C22,
> > +        DeviceId,
> > +        Driver, //
> > +    },
>
> A question from somebody who does not know rust. Does the order of the
> elements in the list matter?
>
> Linux has a pattern of sorting multi line lists, because it reduces
> merge conflicts. Can this list be sorted?

No, the order does not matter. But rustfmt will complain if it's not
sorted. Note that rustfmt prefers ordering lower-case before
upper-case so it is currently sorted in the order preferred by the tool.


Alice
