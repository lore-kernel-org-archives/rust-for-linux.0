Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F303A785A
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781652841; cv=pass; b=mIuRFGSPYnCc0UKDoAN54X0551Elth+BDGdwWnza5KEJJaT52DM1ojC2WxjwhztsHiVP2xOa9KHtLi8VX4oIq977RgSZaASVyM/4BgxBCFFLUDDeLwXi8L/pfUmIFwtpTjUcR2Ch7aJmUyYHVMqY5If1NsfOD8AOzA+SAlEsyo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781652841; c=relaxed/simple;
	bh=DKyvv7X/1O6yRPGIXxYIhYBpUwPyJTAh5/xcF5c7gS8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ejcZjG2bYQOnWs+XacpeETg1XoX1IZEqesXQSVYvEuhBg6I4lqD5QTWwMa5UAK7ZOrmqWOJ32i1KJMDJDcx3VamPDXVs1DAzPXLZd5hVbyghXsgtoYh+Mw0YehEMixTgnAUjCUPp5RGrrVJSzGb7CWiwGT+OsO+RQXJkCZWhn0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FxhpyPWE; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FxhpyPWE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef29c5561so2764816f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 16:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781652839; cv=none;
        d=google.com; s=arc-20240605;
        b=OJ/SmrRQkXI19X++jhn2VtGEUR0XBR0/yV+32zHyHKgZSVrPmXTm2ibGEew7/acEor
         hY8+zhHi852i+PqQBMlpQeq/RPyAkXere1iE2aAZ1eB1IHEJSFWjP0A2wcmH0FtnyO9z
         HBxoaJsg3nz7r4biGmDcEnuUtwkekBi5phcLPokj4p0RgJRwJ1/ZZPeTvsoZXWZiooZB
         rzj1kRK2YcLbC25XmpXlv4fFcSpZgOFO/hAcDOuB21jqJD7QoRZTHcEnAB4NJSg1sQeI
         MEeS6MdcHLFSPXMLWLQ1icJ2hSrg7jvAx7CMCYQ9w1xnCz/FzqKiKWsloX5bWH4f0b+6
         rECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=KsK+QKnuC5Vq0SpReeobu7Qpix4EALGeyH0amQRwOPQ=;
        fh=Lf7WVOZPzQL+Tj92LBHigN84tyqJ1XdCf5D3X4R1FFw=;
        b=Vt/wYclpmKi2Lyrfx2DTGsmuyHW9QBsGIOW0Af1z4FtESF8e5nH3FYTm7ZRX1by9kk
         7h2KQXrckVpLJXICumqQKONXcSTznEupx+9pB+f+8VVUnC12K1Nwt6TomoLHXHn2iVxn
         fcyZx2UwZgAS82RWwChafHM5QCW/Dn3JprE+rkCiM1WWBjkSHkBMthPnO4aGs1urJB6n
         sWxenI9e9UR7Sym5PHyj1ABjO/D62wYIQEMvrvxNg3gLg28q8Yiz6RBaqAjvNQ6kuF+G
         u4liQFKIV5Veti6QVYZJu4N6oZK3kU9jSf35bKF0+MwJCB+2JSZxBw0Dt0+qubid9A7R
         0U8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781652839; x=1782257639; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KsK+QKnuC5Vq0SpReeobu7Qpix4EALGeyH0amQRwOPQ=;
        b=FxhpyPWEP3v/C0PcC03D3rOzB3zhDBfQTiYnJO5kDqaSGWNnefN35FtRsrbm5z8NxQ
         pFY4LcG6hpwjwPpM45dnUdNHR/WAW/G2AOnSyIr9e3wFyRaFQe3ZZDTcLrcdsDM5csvR
         jAQLq1T4yDVXCRIMPxTQeg0/CvTrz8iPaUtw8siVUyWX0Ak+mD60cKrlQNMXIrh/6zPp
         6Ne0xeX5Gjxr6F76PYdcYujd4QZy7zXMEjRnFplT66vDHWtBLCdNnKvZvya6iiGcduyq
         cGrVGjj4dd3MrZlWRmZwVgJ8QxV0xzTtbrXlAZNSAnPCTBqIiKa7FKN2gjBM60y8pyxD
         3HGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781652839; x=1782257639;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsK+QKnuC5Vq0SpReeobu7Qpix4EALGeyH0amQRwOPQ=;
        b=Ij0CXDJnw2ZbYCuvsD3yXzgrmoW4vxgSWDiKujNuaEdv50MQ+WrHDbFeo2SaUbMDAI
         U309lDRikepIVIBesv/IHA0JC65GYa0gAsmYa2CdWmKftXRfgZidFJJODuLb5ixnF2ib
         1DhipWIUZgjHiukBAnvikecLYZ5OY9Gp2/K50wgvhQtuKu2efaR2aPDsThYDkpYcC9XF
         a1VRdPH8buSMrGkGv9JCdVnrVaUdans9BJ+EGXY7Wl3LNmISxTu4qwQy3+UWNvbwjE2E
         2ROrpF0MA8cD0uMRn5LB62MJPu8SDFqsI86DZ86g609j9Hg7MRS6RBFZRUt8KXQCISAt
         OStg==
X-Forwarded-Encrypted: i=1; AFNElJ/H1uypkdLs6vXsKAdpPcuFcjNmOBEy/s4D/sZ6iRIcS+dMoqqmjaDqT6j5VztVVOApOOjvNz9oYW9+lwX7iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxznSnI2aIYNQmR/Pf3iVXlpriMDThGpBuagGQoF8GcITMfe0I8
	1TcnqjzwATK3CU7GCiphhv7gicPRdreFbgMB6BcMMxll4VFNygsSG4UM8hoizHtqsYDrS5do+EG
	o/6XCZaw83f5L7VMV1hvoNIVWesibG4Dq+b5w72iK
X-Gm-Gg: AfdE7cld/qFKyMs5EVrP5dcx/+oI2vqEHGQCe9QE3YcObK7idAxtwpou/b7AymNE4jy
	1cPN09+3J0rg+mBx/CqwV/7gmseO5RBygiyTvWiOIBQPI8IEeTknp97o7SWD59OllH7aqryBreX
	p1vyvB68tJW/4tptf748qD3NuYsUuS6OnVAnmEg1ofuYHWd6UlbeVMKMaPJQz/cwO2GTnSdrPO2
	xN/+EjFWXh8uhSampG6aWkSXRYR+tq0b85GKvels2ZHYZzpElXOWlWNDYOD6l/bmtL9UlN3vLuI
	Et6LF2gNAzQ9cFtD5U5fiJ4i5ih3OITxByr4Kw==
X-Received: by 2002:a05:6000:4023:b0:43c:fc5c:a9fe with SMTP id
 ffacd0b85a97d-46238ac9fc7mr2706693f8f.20.1781652838343; Tue, 16 Jun 2026
 16:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 16 Jun 2026 16:33:46 -0700
X-Gm-Features: AVVi8Cd1Pv0u-agErODGGz4n0VeOE5HBOiwCTfSeg8OAKyD6UT5oVpWjALN_F0s
Message-ID: <CAKwvOdm3w0TbDHL3JwBH3YUAQrc6gVr9Vp1fDAQj1xcCu1gaqQ@mail.gmail.com>
Subject: CFP: Toolchains Track at Linux Plumbers Conf '26
To: clang-built-linux <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>
Content-Type: text/plain; charset="UTF-8"

My colleague Jose Marchesi and I would like to announce that the Call
For Papers (CFP) is now open for the Toolchains Track at Linux
Plumbers Conference 2026.

This year, Plumbers will take place in Prague, Czechia from Monday
October 5th to Wednesday October 7th.  Please see
https://lpc.events/event/20/ for more info
about the event.

The aim of the Toolchains track is to fix particular toolchain issues
which are of the interest of the kernel and, ideally, find solutions
in situ, making the best use of the opportunity of live discussion
with kernel developers and maintainers. In particular, this is not
about presenting research nor abstract/miscellaneous toolchain work.

The track will be composed of activities, of variable length depending
on the topic being discussed. Each activity is intended to cover a
particular topic or issue involving both the Linux kernel and one or
more of its associated toolchains and development tools. This includes
compiling, linking, assemblers, debuggers and debugging formats, ABI
analysis tools, object manipulation, applied machine learning, etc.
Few slides shall be necessary, and most of the time shall be devoted to
actual discussion, brainstorming and seeking agreement.

To submit a proposal, please visit the below.  Click "Submit new
abstract" then make sure to select "Toolchains Track" under the
"Track" dropdown.

https://lpc.events/event/20/abstracts/

Submissions close: 24 July 2026 - Speakers notified: from 31 July 2026

We look forward to submissions, and hope to see you there!

-- 
Thanks,
~Nick Desaulniers
