Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BC9C8D2
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 06:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706076649; cv=none; b=loTvkn3VzfpQiHGx0gmCMAi9GA9LfMToHXKarnqQnCWqH7BsUEGPxStlGaavirG5zRenFRt6RG1wPkAwoFTM0Td/F5n1qaTPs705yxLUTnFdIT7RMFJOlxKFysbByfjRBy07TdhR3CjTz3FaQY0uRKo9vYnAxgxDPLCzJH+fXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706076649; c=relaxed/simple;
	bh=vajM2OVTOya+vobW9bkj1vHe99vPM7B2G5ZahYReiiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f35uJV+yVMuk0VH1n0xZIYXixZ5KxYWRg87++80Ztmr05AcSyp1t+oj4xhQCLvJ/QjJzjZNatVgf8NUdzm8G0UGv6kcyEkm7pRzpsZVSrOCOqJa6e3kfTwebPmRRCJ+dKw2mHelj9NUrhhJeLen7bUUVqiFXSuLuuXurAc2Oa7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=fvpB4voo; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="fvpB4voo"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so4685352276.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 22:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1706076645; x=1706681445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vajM2OVTOya+vobW9bkj1vHe99vPM7B2G5ZahYReiiU=;
        b=fvpB4voovaKQT1c1QSwcrgpSzG1/uZeBgU7EQXCLbhIVXugEfdarNbFvcHUEFAumbO
         fPpv8fvk2RrP1atY9k61zT5tISOgVqNnQlVKrGPISvNZy/y/7IB0uTg5qzurjlXGz7sE
         3qFKHocTwuxXACfOGix8G0y0TxKndpeuE0M3zdSFe76WOM3SuLC+HAZZTMGuDkwn9fT2
         IoZY0Kf0mefpdtRoTTk1piX/oAVFsHwk3uArm3xUj5ELN6q5OGe3tbG+UBMeLxr839J+
         vj9ysX2vex/fvmr+msNRhtVsCctySx7FqrFG52jVYBPWHznKmy4m6DDiD/TvjX/ZpSZ3
         zb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706076645; x=1706681445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vajM2OVTOya+vobW9bkj1vHe99vPM7B2G5ZahYReiiU=;
        b=Y9kRpiAzaa6EDvKDiwSJsOwQa5J3FnEFL55XEtiYqszPtuen1VECM8zcxGP58j3JiT
         IuINnLR9j1phYPXvkkdEEJ4QIvIC1Rx0V4AeKeZtdpZ5Td+c2B2ipdOzldpNOmKLf41L
         bgWDf/4oWPQaDGiSpQTlmKChQFVSuZ1aNT3LMCwBQO7d8Ki2fJq0ZsK/DacVUyYFuX5s
         ylPHMzO0U5kH6gUOAOM+yBMR7Jdmm/mqn7lsnbynalNU+YbObCPPw4e4gZTnjMhvcSH4
         6Ckt4DYGaYfD119W4qbddsQI+d5Qyd9vKrfFLFU5yx8MVNgPNSln3OfaBoHMCz0hm+1f
         Ec+A==
X-Gm-Message-State: AOJu0Yx8dkf/Ecpo2q+8dx9jfNr7oBrFB3qvK3Z/fwKt/q3b/ZBP2MP1
	RGSLiJ6PgGt3YiAz5/KBWVeQj/ZVdxOPohf/w+ncIYHIVxgk6UAQWJ+8j72s0NpW40Nwlw0C0Rr
	oYa7DHRM2spHGBhXPLItHvlDHhJrsQ85h5zfv2Gy35otcmfHRfd8=
X-Google-Smtp-Source: AGHT+IEifamxfhVU3pyFzkjl1xeGIFOosedSeQUaLnWSRC6ia7G27iTM+8JLA2R1j86zPrb5lPPCT4QzYV4gWmeRaIk=
X-Received: by 2002:a25:df96:0:b0:dc3:6d8c:c1ed with SMTP id
 w144-20020a25df96000000b00dc36d8cc1edmr222955ybg.106.1706076645136; Tue, 23
 Jan 2024 22:10:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALNs47v8x8RsV=EOKQnsL3RFycbY9asrq9bBV5z-sLjYYy+AVw@mail.gmail.com>
 <CAM0EoM=1C2xWi1HHoD9ihHD_c6AfQLFKYt4_Y=rnu+YeGX7qMA@mail.gmail.com>
In-Reply-To: <CAM0EoM=1C2xWi1HHoD9ihHD_c6AfQLFKYt4_Y=rnu+YeGX7qMA@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 24 Jan 2024 00:10:34 -0600
Message-ID: <CALNs47sqEzW831Sjh7WzgaVrLQJmM9b0=8bhkWLrR3592GU4vg@mail.gmail.com>
Subject: Re: Suggestions for TC Rust Projects
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 3:23=E2=80=AFPM Jamal Hadi Salim <jhs@mojatatu.com>=
 wrote:
> [...]
>
> I think a good starting point would be tc actions. You can write a
> simple hello world action.
> Actions will put to test your approach for implementing netlink and
> skbs which are widely used in the net stack for both control(by
> netlink) and the runtime datapath. If you can jump that hoop it will
> open a lot of doors for you into the network stack.
> Here's a simple action:
> https://elixir.bootlin.com/linux/v6.8-rc1/source/net/sched/act_simple.c
> Actually that one may be hiding a lot of abstractions - but if you
> look at it we can discuss what it is hiding.

That sounds great, getting an OOT equivalent should be a feasible
first step. I will pass the information along.

> Note: We have written user space netlink code using rust and it was
> fine but the kernel side is more complex.

Would that be the code at https://github.com/rust-netlink? Seems like
a good reference in any case.

Thanks for the information,
Trevor

> cheers,
> jamal
>
> > We are getting more contributors interested in doing Rust work that
> > are looking for projects, so just collecting some ideas we can point
> > them at.
> >
> > Thanks,
> > Trevor
