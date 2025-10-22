Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7488734DB50
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138040; cv=none; b=rQMSBZWQvsY0hbQUflMxEyseghav/GGDr5wUVV4Nv+NnucLooKgtRFlRebxnRsTNgWn4eFM3K0PnFttaBHbwflqAl6Z+L0cdTll7ww1QoD0OAfsoxdyQykesGTo2Hz8pm5xPA4ksTyELqr1wkj5hL0965YpALQLh8E7roJcwFGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138040; c=relaxed/simple;
	bh=TyUdp3RKbz5Kg94cDD1PrB2d/w12mo8fBNwPI5bQ0Xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9rnebw3DFEm7AviONPKhM0jr12pSpX+1KH29cSwdi0bLZtkvAqhm6s3HQFYCzPrIK1il9615R4Pq1OuzDS8/QRLhkZ0a56N8K+wlQ815tuq42fL4GTgejoVTwpp8Sod4PFJhvC4Kp1zqpwp9y3bAZBHub2BXQFlamlPAUippJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONlZ/Qgz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONlZ/Qgz"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-79b03c2d4f5so413011b3a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761138038; x=1761742838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoF4vWA8IthhyUnUTjs/PGL6K8WN8n4pIp2wJXCFPEI=;
        b=ONlZ/QgzcOw5JA3p23KDwgkikAj6lrV2B+SOV9K7jqyWG6TbctP7+LKg93sniGTrTh
         0MO200Ifc1Z0IpfppMCzjIy7+YUxQe08W/oRu26KEq1ZyfdAtGD9BwCzLvxatqRo21yl
         lAiWxn07MF2+367R1a5yTxX9a+HUEExD8unVkQZeU0X7aSBpRb+JTQpH7MQtMmPM0PKM
         c6rS9kEnILf2loWQHQMI5tl/XKkpGbb+6DNv8o+U3jkhlm2siASsMljCa6uVf4yXrPkd
         tImxWFxga4R7la5IN76RsTevWkKrqwL7EUX48xTwgdhyQJgApu9b9wmKNkkONJfXQ3Kf
         4T/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138038; x=1761742838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoF4vWA8IthhyUnUTjs/PGL6K8WN8n4pIp2wJXCFPEI=;
        b=iz41F1G/95PsY4hiA+m1CXTmzN4PGloMaSiKoK73Gz6fSaqxPztRTBhkcMWBPRSxqu
         j06rtEdemS26d2CPUCKFHpxHQk7ZMSV46spMJYK+RyzfySit8uRvWWtRzLmsJ+5DIetz
         n/cVKMhOf+jNRhxZwS37MJ4upSIG+TQ6xemdykrt8XMbs7of7ALOf1yUB6hXcSZph+bz
         uEZIpEDR6Y5+b2pgjpB7WsIHtV9XFEJED97L8VUk+Z82R/2qhrPaokughPNvGb6BozLm
         gSJxiFJv5FbUnht4MMpuDtUyf82o1yFUDMOzap/OPISZGiFAOBwc+9au1EJx2AM1hLE3
         YXtA==
X-Gm-Message-State: AOJu0YzDsL3zLe3xcU9DbHXaIE8upf8Lc74+XCA0MTXspmNMv7lDuSJ0
	jaR0fGta10PfE4o4ITK7JkLzJkeJpNeNJJ04zifJs3wjDktWHKxglnabzrYiDigA4jcStFMd11r
	7KpZVq4XsgKhWCpTm3A7fwiZFbUikcZfVXVQLCWM=
X-Gm-Gg: ASbGncuaj5rMLMH1ZvQC3GTcN2VNFE2fXX/tNNfG9aX8a/p+UJbvXJIRuFTtq9TejAm
	7JjgZZpsDHPvZL8KAhRIM7c08T/b1s7O0PA5sWPdgEdgWtfdsTr4CW10BsYRVnldlsCU1T1vrid
	MJJYQWYJuviH1iKLAnKanIJRHcKqfQK6fiKVGhtu5KAdyJQp9HFfAVsmY/+TOCMWHjX98eYGu1b
	PuWVp5tc+nWY/DLHw7eSlQdyoWMF26vjo11LZaXfVo/JqbqLwwDDoJExcv8WkxHLGl7pkGuS6bD
	h7+r7QXbpKkTL4+B1jILn195hWbdh1QxZqG/mP8Ma6iOfW4aulRb/RJ73R59BYtciQzHBwn4kRn
	SmhBUrgqJ3aKxCw==
X-Google-Smtp-Source: AGHT+IGkB94y3y/AJJdRw33wGmEYHVoXOY+Q5XfJ2zAvmOz9jgEgqMTt7LIpnFjz21I6VYs5Hc39mRfBplPd7ks/MIw=
X-Received: by 2002:a17:903:19e6:b0:27a:186f:53ec with SMTP id
 d9443c01a7336-290cc2023d8mr152856965ad.9.1761138037337; Wed, 22 Oct 2025
 06:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b929896b09325ffcad073edec86c3ce2048bd363.aca6009b.af09.4398.882e.a39af511d7bb@feishu.cn>
In-Reply-To: <b929896b09325ffcad073edec86c3ce2048bd363.aca6009b.af09.4398.882e.a39af511d7bb@feishu.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Oct 2025 15:00:24 +0200
X-Gm-Features: AS18NWCCdpxvuanEb0gOSIv1MPSOxQH8Hf3yN8Er-G5zVIR919-9RbKt3n7nBas
Message-ID: <CANiq72nAdYX2Ja7D7QrsSeLyzgBKrSaTzSyJahXS4HAT5tNVEg@mail.gmail.com>
Subject: Re: Inquiry about Contribution Opportunities for Rust for Linux
To: =?UTF-8?B?5pu55ZCb5rO9?= <caojunze424@openatom.club>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, 
	"wedsonaf@gmail.com" <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 2:45=E2=80=AFPM =E6=9B=B9=E5=90=9B=E6=B3=BD <caojun=
ze424@openatom.club> wrote:
>
> Dear Rust for Linux Developers,
> Greetings from the OpenAtom Open Source Club[1] at Huazhong University of=
 Science and Technology (HUST)!
> We are an active community dedicated to promoting open-source culture and=
 have been involved in various open-source initiatives. Our club has experi=
ence in Rust-based projects, such as leading the development of RustSBI[2](=
an open-source firmware written in Rust, which has been adopted as a refere=
nce implementation for the RISC-V SBI specification). We also organize open=
-source learning programs, including a QEMU training camp[3] that has attra=
cted nearly 1,000 participants, where we incorporate content related to Rus=
t in QEMU and share updates about upstream developments.
> We have been following the progress of Rust for Linux with great interest=
 and are excited about its potential. As a group with Rust expertise and en=
thusiasm for low-level systems programming, we would like to contribute to =
the Rust for Linux project.
> Could you please advise on what areas might be suitable for our team to s=
tart with? We are particularly interested in understanding:
> Current priorities or tasks where additional help would be welcomed.
> Whether there are beginner-friendly issues or documentation tasks we coul=
d tackle.
> Any specific subsystems or features where Rust implementation is being ac=
tively developed.
> We are eager to align our efforts with the project=E2=80=99s goals and co=
ntribute meaningfully. Thank you for your time and guidance. We look forwar=
d to your suggestions and hope to collaborate with the Rust for Linux commu=
nity.

Thanks for the interest in Rust for Linux!

I would recommend starting at:

    https://rust-for-linux.com/contributing

In that page it is where I put our usual recommendations and ideas for
contributing. The website also contains information about related
projects we use as well as actual users, including users being
developed within the mainline kernel tree. Contributions can take many
forms, not just code or documentation, but also e.g. reviewing and
testing, which are credited in the commit log. We also have many open
tasks related to the toolchain (upstream Rust) as well as other
projects, of course.

I also recommend joining our Zulip, since that is where this sort of
informal discussion happens:

    https://rust-for-linux.com/contact

I hope that helps!

Cheers,
Miguel
