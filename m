Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934AE3271FD
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601418; cv=pass; b=abCTjwne1rXCv5lZOoRrz1B+zlIegY7V8zWayLJNRUcq6yIleInUBOoKJ/0NwuJuy+pJHvu2lJgjspTMRFd+4IeKJqe/+Z2k44OpyhG4ySsJIRGzPeVj2vNfeXMdWMLo5ORVXnMSyzajWc1Mw/n2tkFAZtOwrjr7iUfHvZp5zsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601418; c=relaxed/simple;
	bh=Pjc1T6RecD59BlPH0z1LErGIe3fd70/6VwwDPFjFoUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Va757qVZGASyM0AFu1GeMhlqPFPMLw13B6XvzQjjlHlWNH/YPSpmkPh+H7C2ABfxmw4KL6xcJB2mj2ZBVuppB9j8/JH3sLz2bRB4I9TYKqmTO35Pe+BzbTGDq8+pONRpnuUntN28hpilWWdxRqFdXtN1afpdZZzwgg7xQid1NZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRdTg5aG; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRdTg5aG"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3042a99f0ceso538418eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 02:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781601417; cv=none;
        d=google.com; s=arc-20240605;
        b=EgG3IgpCcGMXB7uylRaRlucP5D2xeLhX/EJOLOPf7rDbVRbrG5sHy/x74mSuCbUuuI
         H+dpR+aDGge/kbOxb0f4Xvd0z2xu0MbLtKpIernv3v0g9QOx4nN+gpSapX8sYUyDNHKk
         MLRPli3L7Q2yIEvahXE+PvXF5mmCMFteyNkdNEAh+N1T78BJarS9XzBc+QupnUnB/cJI
         x739e759OgyDJKBgo7RQHdfMTZWUFiKuAvhd9Ki7CHIUBz+5IpmLWXVldoytnTCLP+P0
         JYEmFGvj3gVhzyKZ/ESGb0bIRto3duLOM/+Pvo8b2wcBhRCRYdIeco3iP+t5BkD/WBAz
         zn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pjc1T6RecD59BlPH0z1LErGIe3fd70/6VwwDPFjFoUo=;
        fh=aYr0eAAzSYcDVXX2DSnPv66fLzRJmf0TmJfggo38MuQ=;
        b=ZcJe7PzrRUpYvnIh+0cb2S0HI6kHTEcwr4sBa+pQ/daAagbjoql7Rkb5yKbn10CIcE
         R8tm9Xe6H2WBixoflm38nW4hVwpXC0QGjCIGr/3puIDjMXkh7aK/dYYlXk+dzajxb++S
         /f2StsDJiSqaPLqDrLCLogrmTexmxq9wWn01TuCJkLX8GgKmmdAU/9cxECaA94nv1Tdi
         aUxDFZKtOh+UL6u+rslV0+Z5smzDiEEJplWJ2WVcOxGtW4jYT8vA/CI5IyDK7nfetIP4
         Bo8DAz/i1fCPqFuDakczYyG/odQBqL1Umbm45CevbcIopOnOdHagw/QFzvqXLjqStYMU
         FXIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781601417; x=1782206217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pjc1T6RecD59BlPH0z1LErGIe3fd70/6VwwDPFjFoUo=;
        b=JRdTg5aGosmH7YhyfWMTgD4NliW9NaTAwBbytA9SauG7JAcgPEn2oCIkqgB97goXYD
         +wXCPmzUia75KRQrwsdt2GVe/JYqI6/27c5Bc2tF2QqVgt/WWNWx91s6ZpnpISvJUD7W
         kUSfqolTZVSnIsqTXbC+gwfZQ8SifpSnkd5IymBkhVL8wuBht2dljrJ7axH2Q6+U5O8d
         fR6/nKKKhYhDCw8p2qlaquMgddWxJdULBvPXzN1p3/Tz9yDFXEGpt3TZakVcTaBZxNLK
         83lAYvjy/tKOeOSg1vIRhbKKL0DTbNm/Qgsrm3WVaW9CWRi9SunML2VpClg8XOdYng10
         Laaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601417; x=1782206217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pjc1T6RecD59BlPH0z1LErGIe3fd70/6VwwDPFjFoUo=;
        b=oFAhPcHmkN/jdZtXFVCVoEnZPHarUu4LqLVQIa9P6w2o3TU+v2are8wg7enc4Upnj5
         Xg5wPzbxRVgY2EWcufLAe9LFGCqO5gXtTv5ZGgZXMlkNHs7rzkc2dj9md54mKQ4ghKz6
         Q1QS0NC5VQR927DTZGCxkFEjRcFL9JX+4ps+qHOayNKHSd6PQ4wpnUl7Ra5p4x4Fgh08
         hh3Zi8n2MhX+YB5UsCelQmbAjMUPpk5zbDN4xP2ljC70leMSLOkhbndNppOpmQA/x1IP
         k0t2jgisb+reowuGghlzdVPLCOjUSQgTkpfRDaSq3eGEq4KV2+EEFip2w2f6W+NqdQjb
         d+ww==
X-Forwarded-Encrypted: i=1; AFNElJ92IhJSkinFV6zLycm7zLuUVbYb6/oqHtXiCvEQBv58J1+lO51zunJ3xs1m7DFAEhOYyU2C5+WAJO56LN+ORg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVfQ3a4CiVpnMrjCnIqn4v5yC99bfgDzSX/8B+JVXH7Fuqfs7w
	BeCiflQs+GzcGmAoFwIWHn4EWo/daRLHooTn/jKG3NSyX0uQ/PUF2oJ3Y4WgtuVFlXxqKuyascJ
	0kJ4j6XWpLEGLuQk3IT6EyRLObcOvdKo=
X-Gm-Gg: Acq92OGaEJU6a5xrEwjP34XeX4rU9SoAxuk85FvZ13mdBghjlGAsRltogwPNZGVnOQp
	Mal5W5+kAirORKuWSJj1waWiVOr3zjmRzpEaiprIcPeqGmLxH3QHuaCpW3VEMIjBBrlyaTauL5G
	2WewLh44v7KAFBlw91svB6veVs/R9Fy+pPYBvpr7uooUkodWZL+KS4/Q8tXqedhmi3huNfEbG7i
	Gc0T2ETCf2lHI7yc4jB27tApWan90fDA4FdyoBIwSNb1fQvGi4356I0SrPL0crAk1aXJflj6TrO
	jte9Odm4HY7uTugnai900O5nnpk4iNpo7inNhV0IeeteE5Fuh0f74KX/e9cao0vTvEDc869EeHd
	UYM585qjm8q7vsldGQ0Kym4U=
X-Received: by 2002:a05:693c:3742:b0:2da:a813:a629 with SMTP id
 5a478bee46e88-3081ff4badamr4943147eec.2.1781601416560; Tue, 16 Jun 2026
 02:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522172558.137415-1-ekffu200098@gmail.com>
 <CABFDxMH8icJ2HAw0iTotg0ipYSGDX8ffiTv3e4SmXu1vQ798jg@mail.gmail.com>
 <CANiq72=-=eE4X1MWGvPPEY2wJs=h-f5rt8_j229ALWJ=y2meRw@mail.gmail.com> <CABFDxMGUBBVYe+H3QTfmYKozjHi-40brCTZaU6ETNdJyWQib2A@mail.gmail.com>
In-Reply-To: <CABFDxMGUBBVYe+H3QTfmYKozjHi-40brCTZaU6ETNdJyWQib2A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Jun 2026 11:16:43 +0200
X-Gm-Features: AVVi8Cf7jkDP7slNDs2x1pIg79ojhteokPogndQZW1T2271fpipMc_Z38PHEz1k
Message-ID: <CANiq72m20hpMMk3tAFmwGuGD1z7HMhJj7X9AsOekaH0=mE+0HQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: warn and assert out-of-range input in
 fsleep() and udelay()
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: a.hindborg@kernel.org, boqun@kernel.org, fujita.tomonori@gmail.com, 
	frederic@kernel.org, lyude@redhat.com, tglx@kernel.org, 
	anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 9:13=E2=80=AFPM Sang-Heon Jeon <ekffu200098@gmail.c=
om> wrote:
>
> You're right. Some subsystems have their own tree policies, but that's
> not my main point.
> It was just a friendly nudge to keep the clock ticking :)

What I meant is that it is a global thing, i.e. in general when the
merge window is open, it is usually already late to land patches that
are not "urgent" for some reason.

Therefore, sending a ping may have a bigger impact (and thus better
for your patch! :) if it is after the merge window closes, because
that is usually when maintainers will take a look at a patch like
this.

> IMHO, it's a bit too small to split, but I can do it if you'd prefer.

Yeah, in this particular case it is arguable whether they are truly
independent things, given this is essentially about handling the
Erroneous Behavior properly. Having said that, it is generally about
whether things are independent, not so much small.

Now, on the other hand, for instance, the "kernel vertical" style
cleanups are something we typically do in a preparatory commit. Here,
though, the import block is quite trivial in this case, so it doesn't
necessarily need a new commit, but it is a possibility that wouldn't
hurt either.

> Thanks for the kind review. It really helps a lot.

You're welcome!

Cheers,
Miguel
