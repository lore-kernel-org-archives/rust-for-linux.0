Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C65F3376A0
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 10:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696137; cv=none; b=OCF8t27x4e4Uvqqu7SuQOLKXZhBWKpFxgw6/fLtMF/pCAJV6281UhDBS5Qp9frXN89bOINTN0eb/TcIGwJAetdJx5hyrF7K6jJ2AZ6ohghJh4oP3nzY/SC4TCGoFNvW7Uab4zvg+K/L1I1vfc3cVZuLNqHhjCTgfclqjTlbXSlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696137; c=relaxed/simple;
	bh=FpmjOprTssmeOm50z49S2q34jiZXmJLBLMFlxmzqyfk=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=SzBxOL0JzRKvQqw9x2TkTGdcvnA2vGq5hn5GyOx/Uxuz1jDrSYeBbkvEVvCKkX4uvlpzEUbl1Boei5egnbBmxVSA+HVkjx2yGmMiQc+wRclVTnKPPZTywiVKgsMNBCyjc5ItE05c3OANtVOZplyy2+XbsZU8np9Y8+ls2k3PjSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=dHmEj7wT; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="dHmEj7wT"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c1cf2f0523eso614462a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 02:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1767696135; x=1768300935; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4DHnNlD64p5h6wOoVrrAqDFywUoVYTzLxl5WN2rbRU=;
        b=dHmEj7wTriXidmayV33VEgFwoUvqe4NpA0TwecNdFh4hNJT2cmkGj66SvCQ3N9izvR
         bDgUax64qypkJ1btLIHSp2jpz2lNDbXMOsdEww3dvPCIDvl3OJ4x42Y5Aysr5V0mvX4H
         FR4FV94iYltgNRyUm+aJkTaXYUiZXYmpiPeFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696135; x=1768300935;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4DHnNlD64p5h6wOoVrrAqDFywUoVYTzLxl5WN2rbRU=;
        b=YZUiRHK5VLCi0oMpGdQJONx3S4f4DVxeRPjDyktsppe11FXkk5M1Cq8bW+yza0YU19
         7JP7rgbju1OqvR7c5xSKv5s0fbK8D75yqDiwuY5Fhb5lsKPWA2EVVeNe7MAsUvqTb+OY
         O0+vY2wB1zkZPznIv7w++YVK9rFYrA38daoJF85rvo/9bwaiEfX0COW0Nlilg7webgF7
         53z2u60MlZxJhwEyhfSdxb3Cwm2JrLqQiPu3Cy72G2UOMtxDJeeb2UjNGKs+xwK1vx4u
         FroYfnmN/z7OpIQ42/Aw3Cs/X6DQLsLIxG1yw/HIdHtPl6Tc/5twNCzJsmjxjcymgUUp
         KnAg==
X-Forwarded-Encrypted: i=1; AJvYcCW4I3zc7qDIyArz1A7ArDQ5gub+Mrp9Mzc9OneFNmBT2wtg8JXdK83rXz2UwHSp/m0AuSrQLf9XALgSByuWng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpJpOPJ3smorMgC5ET4/OvOuaVMltjJguAbeDxNI0XkkB0Uo7c
	n1e4rGwk7JMV2vJdmeYs9b6tW7VvyD1T4j0ajp/b5VZ+jFuxjDzET+5mLPaCoBpms4M=
X-Gm-Gg: AY/fxX5IQTFCaGPD2mJjwJBNs8lXa5Itfo0xvvrRGAbVUheOGEkTJm7AZmOLN2eli+9
	Zg+qFJ75+pO9/IhhlBDvDrKRLeH/lH6TpV+c6s2Jqf0ik4ICL8V+NboZobQ/M/Be63N9KWmkRkr
	i9BYDsXPpfy6s9INIEDY1ENK6hsIkDxK6GeilURyEg6fXoOVbAERUb/gcG8Ju+ZDarMgpWCfexi
	1xnWwG0KTvnAb12ALnT/wzLkiLEh+ceaJo4Ftiv2ykpU4bS1F+JXn7WgKC2meuFo8/JjYTuN5zM
	AfiCfcZVzOYSqEyDLAkP82trFk7gIwZvID0pTKTNIOeDscQiLxFHMK9PKVc50PMVvqLt9iLM6N0
	eyqJU837qyYPRrrDSdyIJIqnA6oam9OG2DgUJ72t7Ex+gepHm18UjLM88qIOAmmMlon/Ts3J8Hz
	0DYzKg9DzDILiU+8G54PVrYVXv6fN0iqLyNg==
X-Google-Smtp-Source: AGHT+IERN4NTuUg9631IoqFFmDFc+SSm8nsSJiPXRRuyNQlJRcMWfJpX1DUlLRv86z28+rD5rpiQ/Q==
X-Received: by 2002:a05:693c:839c:10b0:2a4:7cb9:b7da with SMTP id 5a478bee46e88-2b16f91adfamr1668838eec.25.1767696134508;
        Tue, 06 Jan 2026 02:42:14 -0800 (PST)
Received: from smtpclient.apple ([71.219.3.177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d57aasm2365350eec.30.2026.01.06.02.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:42:13 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joel Fernandes <joel@joelfernandes.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
Date: Tue, 6 Jan 2026 05:42:02 -0500
Message-Id: <8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org>
References: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 nouveau@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Paul E McKenney <paulmck@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Steven Rostedt <rostedt@goodmis.org>, rostedt@google.com,
 Yury Norov <yury.norov@gmail.com>
In-Reply-To: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
X-Mailer: iPhone Mail (23B85)



> On Jan 5, 2026, at 10:22=E2=80=AFPM, John Hubbard <jhubbard@nvidia.com> wr=
ote:
>=20
> =EF=BB=BFOn 1/4/26 4:30 PM, Joel Fernandes wrote:
>> From: Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
>>=20
>> Update my email address from joelagnelf@nvidia.com to joel@joelfernandes.=
org,
>> which I will be using for community email going forward.
>>=20
>> Signed-off-by: Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
>> ---
>> Boqun, could we take it through the RCU tree for 7.0? Thanks!
>>=20
>> .mailmap    | 1 +
>> MAINTAINERS | 4 ++--
>> 2 files changed, 3 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/.mailmap b/.mailmap
>> index 84309a39d329..279f8fb223e2 100644
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@ -389,6 +389,7 @@ Jiri Slaby <jirislaby@kernel.org> <xslaby@fi.muni.cz>=

>> Jisheng Zhang <jszhang@kernel.org> <jszhang@marvell.com>
>> Jisheng Zhang <jszhang@kernel.org> <Jisheng.Zhang@synaptics.com>
>> Jishnu Prakash <quic_jprakash@quicinc.com> <jprakash@codeaurora.org>
>> +Joel Fernandes <joel@joelfernandes.org> <joelagnelf@nvidia.com>
>> Joel Granados <joel.granados@kernel.org> <j.granados@samsung.com>
>> Johan Hovold <johan@kernel.org> <jhovold@gmail.com>
>> Johan Hovold <johan@kernel.org> <johan@hovoldconsulting.com>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 12f49de7fe03..43bbf12e2c80 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14558,7 +14558,7 @@ M:    Luc Maranget <luc.maranget@inria.fr>
>> M:    "Paul E. McKenney" <paulmck@kernel.org>
>> R:    Akira Yokosawa <akiyks@gmail.com>
>> R:    Daniel Lustig <dlustig@nvidia.com>
>> -R:    Joel Fernandes <joelagnelf@nvidia.com>
>> +R:    Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
>=20
> Hi Joel,
>=20
> Can you please hold off on doing this for a few more days? We have both
> NVIDIA and Microsoft involved in fixing the email issues, and it looks
> like they may already be solved, in fact.

John,
Ok, thanks. It is common for corporate contributors to use company name in b=
rackets though and I have been using this convention for a long time (as do O=
racle, MS, Google etc and even some at Nvidia). Is there a real benefit to u=
s? Tagging company in the name is in fact better for visibility IMO. Especia=
lly in screaming caps ;-). It is more important that mailing list traffic do=
es not have issues which unfortunately us and other company domains have exp=
erienced. I have been using my domain for a long time without incident. In f=
act I used it at Google for this exact reason (with proper attribution to Go=
ogle).

Boqun, Paul,
Let us hold off on this patch for now while we are trying to resolve long-st=
anding issues with the public mailing list software and policies related to o=
ur mailing list conventions. Sorry for the confusion. thanks!

thanks,

 - Joel



>=20
> thanks,
> --=20
> John Hubbard
>=20
>> L:    linux-kernel@vger.kernel.org
>> L:    linux-arch@vger.kernel.org
>> L:    lkmm@lists.linux.dev
>> @@ -21895,7 +21895,7 @@ READ-COPY UPDATE (RCU)
>> M:    "Paul E. McKenney" <paulmck@kernel.org>
>> M:    Frederic Weisbecker <frederic@kernel.org> (kernel/rcu/tree_nocb.h)
>> M:    Neeraj Upadhyay <neeraj.upadhyay@kernel.org> (kernel/rcu/tasks.h)
>> -M:    Joel Fernandes <joelagnelf@nvidia.com>
>> +M:    Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
>> M:    Josh Triplett <josh@joshtriplett.org>
>> M:    Boqun Feng <boqun.feng@gmail.com>
>> M:    Uladzislau Rezki <urezki@gmail.com>
>=20
>=20
