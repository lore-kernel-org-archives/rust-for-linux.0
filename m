Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CD717D341
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Sep 2024 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726846944; cv=none; b=J0oiOLWORolLzcEHb3n8lhr/wh1FkQD1lAXk9MKbdpNFlATdmEcykz8A4ASUOFrdlAiDtxXBMUQ6lcgGL5N95TQfn/+We4e2REeMas2pa3RUcOZRCsNmTy1o+3H8KlsHRv+f09f7w4w6VxzHj92P9e0o1vnPZnKN3JDI5hDOnEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726846944; c=relaxed/simple;
	bh=BrUo1hGDmT+C2vYyXamkgyXJdqsOC9wxPtpo35WpM5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJ8IQ9n+qFej4YJf1Rr5lhja/PbeqeL7VYsk8pNiwdFkqgJJ45/IYBQ1gu7ib+gbupo2IuoPkweunjoqMD1lijcLZ1isY4f5AJMZ0ib9chkP+sGXLbc+qmgUXGt2woytEsO/bm8pGlJezWF3PIE+4BN80qtH0/U47mKIQp+wp5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=iYS2Xm/c; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="iYS2Xm/c"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ddd138e0d0so19872727b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Sep 2024 08:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1726846941; x=1727451741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBms5AmCW+8qvkUXiLJP3/Ll31btWSgF/+xX88EatPY=;
        b=iYS2Xm/cSwnpG97rgHEhzdH/TSBHB3egT8gIf9JoeJsxapw8dgtu9U5hyj6Gv6MC1D
         lb8qAFkg4rzHt3xVK/5EUHzNi4pxZTCXFZ8h98+KHS+vdbUDqVzTDL/NeT0gIdXNj7Vt
         4P8Vtr/45Qo8pCIxUNUpTBBZ9I0D7g9R+7LY1Dt8nOzYQ9oXODJmxksOYPkhwzYW1NaW
         VHz+6IvP6e58X7o/jd0Zv5rGdAECvDp3OHOzsrLNDpEwBRWBte9L2QxszTm7GnMtpSl5
         7ZKuibH1XKpl11EFp05wqeE8/hJgz2Qhu1rN25b9Ycf6t3mB8yOYn5lAGmmGj/x4Wf04
         xrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726846941; x=1727451741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBms5AmCW+8qvkUXiLJP3/Ll31btWSgF/+xX88EatPY=;
        b=rMgSYuYmPRiYld5UGtNESwCaeJyB8R/xMiSIEE5ZoP9ezYE6BHkKOPHdU4F4qhqg9Y
         6jZgxW7mX06gFDBL14cJ2iHmWdQnV3Fb9xlvjNG9J7SAKXmCH2/E+fnZ15MKtPg5nj/A
         j3VaKdAZc+aUGnK85gytXeoP2EdUaPG3EQxl8qdnHsJuuroWdsXJ7tF3hKZbMOYtp5gY
         UKEWh+hV2bSavJXlFaUVwRxO8c8g+ESsTRKgUHRCXaioQl/SxuPHgsAMA7lfI7Y4HfCo
         Rir3n1HkJKu0lpWE3rwFeGBN3+SS8L0mQF1xtO/jgFSob0A3KYihv6SekQVB376mItsH
         vaJw==
X-Forwarded-Encrypted: i=1; AJvYcCXbflx1VgbfpKl8kuyVxwzDbb2M5/QSjY5Z8SdItr5HC2wrvYUlHSxytOO3Yxvm4Bild4p1r3dWghq4JSEVVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDcFiHJXJLkJPLx0gf0C0USgNwaYAqjw5jbe7F0kJUmi1c3PbP
	98Fr+zePsKFNJ5sWSF+7/gYDhmaEPiWy+RQRQiiuBpIbk6ch2mooMzJ49stGEFvsOn0UYKumUaX
	PYlKizxifY8EpAPlkCnAaPJUyJXMCr5Vf7pu1Rw==
X-Google-Smtp-Source: AGHT+IHjpN1OzhYyrYcjXoFBaTIHRbGE/VC20HB74/35tSY15/jE8Kh9NHydI0O+wbbYlPssxU2bQEq7gS+S11oLPdE=
X-Received: by 2002:a05:690c:6f8e:b0:6db:de99:28ae with SMTP id
 00721157ae682-6dfeed31fcfmr37362647b3.17.1726846941569; Fri, 20 Sep 2024
 08:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919043707.206400-1-fujita.tomonori@gmail.com>
In-Reply-To: <20240919043707.206400-1-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 20 Sep 2024 17:42:10 +0200
Message-ID: <CALNs47sKXVrMdC-vraJG3gt-b6yDWvFTOvfrL6+G=j6-1Y-BYQ@mail.gmail.com>
Subject: Re: [PATCH net] net: phy: qt2025: Fix warning: unused import DeviceId
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 6:39=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Fix the following warning when the driver is compiled as built-in:
>
> >> warning: unused import: `DeviceId`
>    --> drivers/net/phy/qt2025.rs:18:5
>    |
>    18 |     DeviceId, Driver,
>    |     ^^^^^^^^
>    |
>    =3D note: `#[warn(unused_imports)]` on by default

The >> shows up as a quote on lore. Should this entire block be indented?

> device_table in module_phy_driver macro is defined only when the
> driver is built as module. Use an absolute module path in the macro

nit: "as module" -> "as a module"

> instead of importing `DeviceId`.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409190717.i135rfVo-lkp@i=
ntel.com/
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---

Easy enough fix, thanks for being on top of it.

Reviewed-by: Trevor Gross <tmgross@umich.edu>
