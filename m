Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468AD30F934
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 05:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780031761; cv=pass; b=Zg9PtWU/zYH9PggW+gyKSwQdQYxMwZMQoNpF695m+llz14GoG1qz7nPZgW6yn9vNlKu9rw7lyC/pl34/VmIxZKWX0Yar1Pcc0dYkq2E0mOgD46++DauYKj/I2PJCEJ1peIHkCy3gDwv0WaTX07naaBjKaTWs9foOfmk7RLfNDRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780031761; c=relaxed/simple;
	bh=RZmlRufzWqXoxl9YMpr3zqfVc7Zbb6YFULZJWEcCPOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJbnzz7LPhv2uyx2zrKwUZqK5M9BcT4difctSgLWfFEJoqhuUWkecK+PS+PqEuswaJgXKZFeeEaZKxThU4ahdjrvEwzgaT+zcW9lrWDd/SjCrXzLL+XQ0xDxcSl2j/0cOK5k9XsRTrgKh8RzSs0N9FMd9XrjtLFNGjUisyT/dQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4SlhRPI; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4SlhRPI"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1351aa6418cso593770c88.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 22:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780031759; cv=none;
        d=google.com; s=arc-20240605;
        b=IuieJ0MV4ELhd02my53j0Pm5dcf7S6L3lTQ+zJbMxNWYqcVAt2EEgn874SQPUlSKas
         wXEBntqtGCH95Feo4QhbuHMiyAM+9Tc1E2ENc0Ppp4bOAnYJdWG/y2F5dqAVW4XADWcD
         ITTgoCp9shACnjJaVNfHDyfglMkNiQpUZgZToYTSkq6fdG6HbHfpIxjOAFwBYZFe2pQA
         NS5VQG94XSNOV+C7x/UsuoCMcdAfa9g2y7AiBO2+ivQxwbVJT+SSpuZUYUS/l5Rl6WQa
         M+et0+0soJESn65SsRCehyqCj7br/DjHYE7E6kPlZDhJhtCX1IcR5Eg7FhYdMrkde+GV
         92gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X+RniAYNsrfL09sn7xlO64xDYFduCytNvTWSC7DXHDQ=;
        fh=bXIW4PsdDhob8rdtB0w7S3QNYpNpNDPKqRwm39E4pns=;
        b=eL17ccq4DqwBXiZI/gW9W0XAlCL6IgOUl316CcAudALJtNLhUXILjd6KO4G4RBk/r9
         MO9/Ez+f8Ue51rCClHqu4fSgjXuf0k39dGVgZQwDUNeWx2ksa4Et38lEDufhGkc7zSLq
         TcOTQza+qStzjMjFU5yzD9nAlC9iGekrJ82iMkjRbXNqkA2IhG0MobEG+2ZX5dfW/tGl
         gcHGbVc0PUBTRl1UBN4GYhM172C8oRoI48LRwbDHJpkJfmIEyHuS5HO943v9C/ebGjCo
         PM5fjxVp8KwPdN6sNX1X7ALFT/argQmtdyCAGgQGRo0OfSi/VxtJxfknnrwsWRkgzsoo
         4PEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780031759; x=1780636559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+RniAYNsrfL09sn7xlO64xDYFduCytNvTWSC7DXHDQ=;
        b=U4SlhRPI8XTmVZXLHHfZIx6gIQ6mUh5jjD2P5woLQns6/eJmqPGzF960SXC39ggFJB
         22qnoU9aBityAY2tfJB8d4Eou7Y3n7PenJN4LHarWJ4Vbwryalll51NL1oFonzNEMnsZ
         usc7ti75wL/zMjZhO3XKOGXcv4iqwNGFfizPtP06AEDHhbp0COs8M1GNQ5abn5DJaaBb
         gEKJJvsCD+pcHob+Te3QLBL5ITLT6glIk2W/XtxLbDCrVTnHwsCA5uYhLLsTwUDIHu4W
         90iDppr3ZtwFuelgHnrvioYZbcpVsPd6QoFVijtnQdmfiZSqtEobLicB9C9MXkgIXJe3
         jC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780031759; x=1780636559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X+RniAYNsrfL09sn7xlO64xDYFduCytNvTWSC7DXHDQ=;
        b=TSY7Q0cEH3hYGcIv7B1uGMUzbcmTEznxfzDTEIdiQefmmQadcSzCYxFkfSSyr7lqyl
         pFuV/3r4TlGlybsPDYsN7v9ETapTDAMaqVJhLDAKJpCV+ForPntQr+j1NPa8+ZSLUJk0
         EeQcmvcQgR3BpcXTK4kgXnwHr45hcA4gt/xbLrxRnRaTrQIYIfZGXqj5YOO9zJF02/Vc
         dVe9N2mkJ9WEj3W26s/ep8Ff9CAywuonQlOQa81hM9B9WKq5IgD98LHtn4aYhcqGyH1b
         mcSgJ+09V6QoA0SokVdpnKr5Ej77YL8aN8M7BqPlomQ1eTdr3CEDaD7zuigZI5y6GzPV
         ddww==
X-Forwarded-Encrypted: i=1; AFNElJ95GMrZp6/5zTFwNGfTis8OStsBh08nBK047yfTT0BKtba1SNQosCN+8+ZQ2C7D8qep2yF8HrXVsBBxuJ/RiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSeXAglcqf8Y7lVL33KmtDvHUNBjoxF+g9dX6sZa2VRyyGGuob
	nZU1ZLH6YHP0CJJU77C/mI8kTvPDTJ+YkZQD0/dz/mm9WB7CZSZ+G5FkZoTabHN0Wxp3dJ7vmYX
	E3lyR9YK8CMLPEBjOLNCgKObbED+Mxec=
X-Gm-Gg: Acq92OFSRkHuLlKLQzmeVPFSczYPknzFr1RAPuUIkPnRJJWUDfGPl8LH1NUxGylutt8
	jVFLCa4Go9dgZ5f3N6E+jxTPd178N4CiosF6xwlGETOeF6iBrZk6tI4u3kTULUSX4jZc5JwqvY+
	2atnOhg9egd4BY71871CA37xuV0BJI6oy6KNXxY7iNuxpg0Nyqtem6s+tgz5XBC2wX8MKer7mBG
	GHVF6ZY2eqrU+LCDM5sYPL32MxlCvZRrZqoacNQOVjBoveK2jmqmgK322veOvM+Hg9O9N1W1Llo
	yXThtgn4g1OtvaocHW+DwZIjfD7yodgOtNhrB7IYPUoqubMiGpVb6Yn7aVWKQlMsn/wdGLiI8IY
	cV0zdLwhX49UTGG/Mj6pVMEgLi3Ff1Pe4W2EYwuhuO5YJ
X-Received: by 2002:a05:7301:1288:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-304eb0faad8mr347356eec.3.1780031759297; Thu, 28 May 2026
 22:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521161405.64042-1-SisyphusCode0311@gmail.com>
 <CANiq72m5GZp_p2HCgotBaevLmt1NrvzwrzJJK5sLUEwxeVLBdw@mail.gmail.com>
 <CABCJKue2BvckpFK1yROmOcsrRpxRC9m0OiwCymxF=OW0JZkLUw@mail.gmail.com> <CANN+23v9vkzq_2o01z2VmkDnLaBTP8_Op5vvu=Ozg21T3o6m3w@mail.gmail.com>
In-Reply-To: <CANN+23v9vkzq_2o01z2VmkDnLaBTP8_Op5vvu=Ozg21T3o6m3w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 May 2026 07:15:45 +0200
X-Gm-Features: AVHnY4IXYRmYXeaL2akTBUG-TDhJkn4WVHbKolyP28qYFK0d8D_UpPqyVmWfGaU
Message-ID: <CANiq72kTEQJcxD2iAd97Ly-qh7uRzPn7=k=DUEvHJw=NMFVk8A@mail.gmail.com>
Subject: Re: [PATCH] rust: module_param: add missing newline to pr_warn
To: Kenny Glowner <sisyphuscode0311@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 2:55=E2=80=AFAM Kenny Glowner
<sisyphuscode0311@gmail.com> wrote:
>
> I hope I submitted everything correctly?  I am trying to get used to it s=
o I can provide better assistance on more mainstream issues. That's why I s=
tarted with the most minor issue I could find. I appreciate all of the feed=
back.

Yes, it looks fine, thanks! :)

However, in general, please try to reply to the feedback, e.g. I asked
a question about the commit message.

Cheers,
Miguel
