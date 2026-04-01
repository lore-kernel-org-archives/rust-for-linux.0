Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B054F382F07
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034106; cv=pass; b=FtL/a+Zf39Wu2rRworiABudhbVskCOams5clIxudHKuSY2jHjB3NmRHinLJzNZhu5v0Ff1MmeuFZ6I3VPJZHrtCWh46msnifagGc08N1YeHa+KRop0BNKBIIHcAIPU16txzShJsvwSuYdsXHlgwGMFzAy7dEHfivrohneIPk/Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034106; c=relaxed/simple;
	bh=foseWUt8hxjWjSexR2fMfUjyxdat0a/Kts6s+7+r3m8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pj0BZlo3SceV93s+ttlcQ/qmI1bHdlm0nc3wdgIPdlzQUPUtFEE8JOmDL36LH2Widl11L6dEY9ARSUnI4MCyPTOzXsvwqgHgScmOoEH0nDpzETx5G12dPducCxbwFfESQvRSJnlsxaERqz8SoU09xBKSUrMJ1aTrPW/+zkKbt9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCYK5sCy; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCYK5sCy"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c98928e4bfso39116eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 02:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775034102; cv=none;
        d=google.com; s=arc-20240605;
        b=fPhjzPmz5FpFOqfvnUJrAWw7c8oqgJCTePaWwWTdoCdH+/26Rymc/k6YQZgGMd8IKq
         zpEjlj7LJB1DO2N23cGqfl+zdA9+3157FqLGYzvgqsj+M6bNh48dpi9UdyoONiBF0Vcu
         dHhEJdedc2Pa5IaTcpFtCTUQAHQILAAJkRg63aqpwWY/d+tp2zDqlyOvTium5esA0YJM
         ctbmkFUX9uqZ59MPI5BLtmjNZBF9ASmwMBI82kJwFgm7oZfPLjhyZB5lepEzJOTlw3Is
         cfjPpsgQq3ZpRkmoQi0Bo6DVIaZBE3tBes5wu6T0L50k/XHQ/nOegQGuNqQoxkp0U7MC
         n6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLGkWVQqFkiy0eSwyR8wbmxMzGUFSmJLfVCv3lrA0UQ=;
        fh=txiH/UrnB4Oi2N+LW6m0QXXAs7ldfndbAsZBV62b8DY=;
        b=DZAgfUMUcaZEX4bumMJF35wLfFzhMAEO0IlSWcQ0ewqEIUimEtQpkD6rG0Yb6bm9eb
         LxI2fjkEUqyARMglUX6paMXXi5onEAt5m9mIEy96glH4ahttrFFQYd1UdZNJsKL8WfXI
         bn1tEeKrmDW9cbpK/tzLimEstIM0s1V8/r/lQcHk951VrdeWvfAleNWOJEe3xTzkbEGn
         Dt5A5m/KGbQcEIorsifQcZTbQrZTtcW2l969/hi1/ALcchbV3IOBZXgyJ1gPdkwYSV82
         SEmtKGb4VrQFIDOYs46RHYepqIl5nbE71vQj0ja+BA3tvTygbOPsabAf7MUE7aEDkVRo
         aU8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775034102; x=1775638902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLGkWVQqFkiy0eSwyR8wbmxMzGUFSmJLfVCv3lrA0UQ=;
        b=GCYK5sCyKtmpaz8tOKSGmCnK5tKCTSh44oJy58QP0+3bA+tpB2ezWRebFwZTgDL004
         04GG9RcVLeL6PDSSAEONo0dYWQad9x0ixf2H62VnIVeGJdzZbFlP/mvSnZDkbJeim4LL
         H0qYNc+Gm+WlirxmB3c0W1WpujXVH6tSzbBXfBEd+tw1kYPMYgFIMxokonPIc1tuJQSc
         jXmGkUXmUISx7CIbi7ICeBWOwVNQ6xfaS891mIcPbhhyx/FngpW79lRqErgU/tnvguM0
         gzTISvGUo2FT9qIdx2/ls1QEozEHxVxmteXucQqejrsjAhf3cpTChNTk6mpYdwVy6pbc
         pzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034102; x=1775638902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TLGkWVQqFkiy0eSwyR8wbmxMzGUFSmJLfVCv3lrA0UQ=;
        b=Ojiki4FM2tKM85WwYwAeYbnnzgJZyiV44tBez81ActSNRVYyhCfOZOsoJkhTNfESbN
         ORRjiiEg64cLIzlHaKTpu6BtaYNOncczOjhL7caKtuUDHGyMA3OVvrv7HYW2HF32IHEs
         IjfSydQqnAwCB+wgv+DgQfO5iKKUAQCvaUMEusAZQaNhORXN5JvqPR0wBwEjUp3NMSMI
         ychywUYOCDPTThOu0hdjX82wfSE1guUZREocELTZojLk+IKcNjX1yx90dUuQpAHnQtLY
         4F7UgNwoeJpHQ/A5sND9OSyPMx54lpuIJgHAEh54N/JKC7Ws1dRT3R7xkuMoziWiN/EA
         9OdQ==
X-Gm-Message-State: AOJu0YwzU3vy65Mq9nKYg/3OasanfbIxZ5bLuiYIUlZNyoToSU6qGh34
	YJ9AiNcDNb4yx0qxOI+SdhOWJfgMDHz8iX0imLIhAL3+Owj/DKJN+iKRuQe0NFao8n7KzDFMidP
	nW5hxVPj67/o85DZMnaEXF1dY2Ue5dVI=
X-Gm-Gg: ATEYQzwRxEDS8+OxOXhvlh24oyFHAx9stXjZkxKBNpogJtCGnxxW0Gzf371dVQhnbXY
	XrHd9HcCgG7gkTsbQI/fpZ2Q57z1RMdOUCvv0eozTiI5zql5ItQZHVrldtxv0zcMaYUgIFExoFl
	uqFlvsjHYZEFjU/PssycYkWSFSoNLAIVyddQS3KfOJ1ZPE69RtZT+OasmDC/2J2BPZTC2kDY4d5
	ldPa1vtg+Vps05v+kOQ2MSeRRC5ifUgPImVx7bSZfVfGNw0CA8VxIzQN/xd0hDjiKsyxn/+QdJt
	JzQy8ojXFH2PUoL9lXecpcY/XOKbtjEDiMTJJvdrTsp8aOB2a2YopKiBEQIBJY9OALNajW2bEcp
	AK2Fp2LIQ6oezxLPR4ol1/XvwXqunUn8zOA==
X-Received: by 2002:a05:7301:1015:b0:2c8:d228:3df5 with SMTP id
 5a478bee46e88-2c9336a40e4mr601973eec.8.1775034102349; Wed, 01 Apr 2026
 02:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANBuOYq6d1AQRgzT-6mcQRVVcAdEFwkR5HFc+v4PVBYEEH7q4A@mail.gmail.com>
In-Reply-To: <CANBuOYq6d1AQRgzT-6mcQRVVcAdEFwkR5HFc+v4PVBYEEH7q4A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 11:01:30 +0200
X-Gm-Features: AQROBzB6G5wXS_kaZvheilLGaVFSnOAooKKglrAn9hjh84CNwPxPx9U1HxH1i_M
Message-ID: <CANiq72nsemAEakyVsVxxp5qa7WcxGJQLehqsnfU8xkNqD9=abA@mail.gmail.com>
Subject: Re: Interest in contributing - Rust abstractions for the sound subsystem
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: rust-for-linux@vger.kernel.org, SeongJae Park <sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 11:47=E2=80=AFPM Jihed Chaibi
<jihed.chaibi.dev@gmail.com> wrote:
>
> - Is there any existing work or RFC around Rust bindings for ASoC or
> the broader sound subsystem?
> - Are there specific areas where help would be most useful right now?
> - Any recommended starting points for someone familiar with kernel C
> (obviously) but still building Rust proficiency?
>
> Happy to start small, even reviews or testing would be a useful way to
> get oriented.

Welcome!

If you are asking for starting points in general (i.e. not just for
ASoC etc.) and/or if you haven't seen it, then please take a look at:

  https://rust-for-linux.com/contributing

I have there a bunch of suggestions and links, e.g. in the "Finding
tasks and issues to work on" subsection.

In particular, I usually highlight that reviewing or testing other
patches in the list is indeed a great way to get started, since you
get to know other people, what work is going on, etc.; so it was great
to see you mentioned it in your message. :) Please do review and test
if you have the time, you would be welcome to do so!

(Actually, I should perhaps add one more way of helping to the website
that applies nowadays, at least until the mailing list functionality
is implemented: looking at Sashiko reviews at
https://sashiko.dev/#/?list=3Dorg.kernel.vger.rust-for-linux and
forwarding any to the list that look correct -- I have seen e.g. SJ do
that.)

Regarding ASoC/sound/... and in general particular subsystems, I would
suggest contacting the maintainers early ("Submitting new abstractions
and modules" in the link above), searching in lore.kernel.org (I may
be wrong, but I don't recall work in that area) and asking in our
Zulip as well (someone may be interested or may have done something
outside the list -- please see https://rust-for-linux.com/contact).

I hope that helps!

Cheers,
Miguel
