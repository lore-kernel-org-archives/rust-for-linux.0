Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB95D1FC110
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762269044; cv=none; b=r4DmRUreu0dfWZdN5AT7ok8jJmnaHYim5+DCRqIxHs8n2qjI3ZgshM4xBoBa10srrfhVL+ti3sShauiAesx1F8lHD7ur7eaj1a7DHba9//vHnl2/YZDMyAjIc1vr1l7396LSfnwozchns2t9l6ydIN4m6lhX70q2T3yQDrZkf1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762269044; c=relaxed/simple;
	bh=Waq8pOwuzIsQ+bSM0plnVmxd/KOGP2LIg+O3WnWFZoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=coxeEU4hQ79JwwiQAk80HBw5impXXoexxd0T1CCnX8H5mkLhSJ9Oj3IUsRcAvcGaBl/yoxilkwLKmQCOYBGAoiEZ7X34NPGgo9tv4MC2l0ycgE/LZFsAEk04mNZzE7KfeuAWwJOC7I2kZKKrqPw/FCjLSjBp/P5f6swj+GTkC/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/VPJIc9; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/VPJIc9"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b9da0ae5763so199618a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 07:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762269042; x=1762873842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iu/Gu6PL0vAc91czS0MklQpsaf/73eGCK0x81cgylJE=;
        b=C/VPJIc9D/IXptyovmN5PNwAVRlzoDjnGR1Qweoka1hSIRhm2LD3g7cw3eiOAm2kw0
         NIN4uljKkBkHFeeIciX0KQmA+QYff56N13UCPZiYsCXHSi6Yd59HJffxb73Y7AabtRUF
         J7VV4+RPh7+6dAl0mGLzMPbItUTsVwXdTJylbiEPPOvrEW775CyHOfGLEvEb3lWrPTBi
         GAiE3X0BbHshpNcgT3QGb1m3Rg1ofdR8uVrQgQtnyYRpGN0ZrZ6XyryXdVaawPGRO+mr
         mLpcyPgeCsDnGTfWF8H+E15Wr2XPgyh6f3hRZXRZX0Ppu/sa/uRllYehBqGgf+5hm2lv
         sUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762269042; x=1762873842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iu/Gu6PL0vAc91czS0MklQpsaf/73eGCK0x81cgylJE=;
        b=Qqm3hRuJxqT7bSkiR7qWU1noi2IPNyQBqbCeUGr9Pj7wehk/3fqDnWi8d56Im57fIu
         a6wVFvA5Nv4Ht1JqBaxOdGvRIwwyhbD9gvNenQXg1NxmslVxVXkd1k5IlC25zX8DAMyB
         4izydPd1DqG/WfDZcArxPTIG/tsJaSthfxqOh3m5XzAQCutX7jdzRYyEYVKRN1o0d3dV
         SAAaOcvek68Kx78yutG/9rM+fsZVNIWJmnxOEYPqR5cOGV3MPeWWlPKVNOfNwyg7xk9X
         I4snWADZCYILSK9XD4EJ0KH40V/NPIQ1k+dnXc8rm26W/AUUXDK6CclezLu2GQmUx2Gt
         6UDA==
X-Forwarded-Encrypted: i=1; AJvYcCUMuNpL/tZICTt7wbDAei25uRnK3IQJSga/1qAhlcoCHCI0s+MKI3u7UoXwAXPfCVG8PFYRa+mPaMFUgbB7XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQIrsM+iX08f1Tl2zR5VmJ5N2GKviGgOwZE1tX9t18eU6s6NmZ
	rhyMR2uHsgbkERISZS6aaHtOmX4jO9SpGIwaSTJyQTySufR7ydW6ZbGktp6TpZaGWgHIAarHnRM
	cBVffDY11CvjcUPjgJ89Vv3HnMwDkDkA=
X-Gm-Gg: ASbGnctnGEcGJlX1SNk1O5HrZ+6oj8nVm+LIm43USC56FMarrupRv/mPjcFJ48phGSH
	BLBDoUeTTS5QMru9nrZknxEQFQAaxSUGEvI7LDjhIemHbQt30Y9MPPzG1HjjshjHPcNBwq7e/6I
	XzBNk5ipIAYrDa/b3l+zPGJgMd9sKs0USS4bm4U+68iHEf1s7+mUijyPDMgTXGAyF7vPidZodNL
	Z+GR7zgtHb8cs+qNY/JhyonZmscAuTX4gyoHriJ7p4IjMDxMJ7siFTTBGwzJEPLedVRxad7jbyl
	+CptOs7nFY07IRZ2DyKPple19vcJYLN5J5VWU0X49EkDxnJ6MU8IIaRkqV9eB2QmhBjvsDvkjon
	muZDhurtOKBOeXA==
X-Google-Smtp-Source: AGHT+IFbIRxqM1nhM3DIyKOdSyjrx12uTgaGTkoY0DopLoS275eO/KPjc/VuE28plxviUe1M+POShm0Go+BzlCjHs3M=
X-Received: by 2002:a05:6a20:3d8e:b0:341:10b:da0f with SMTP id
 adf61e73a8af0-348c9f614demr11527681637.2.1762269041917; Tue, 04 Nov 2025
 07:10:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025110452-diligence-share-98d3@gregkh> <20a1d4f3-1fa3-4789-aa7d-385d33ea9324@de.bosch.com>
 <2025110402-banister-speech-7228@gregkh> <CANiq72mENsw=uVUbMFzOor8ZmoeurX+0hiN49fhzBgqMWMM-KQ@mail.gmail.com>
 <2025110413-universe-aerosol-2e83@gregkh>
In-Reply-To: <2025110413-universe-aerosol-2e83@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 16:10:29 +0100
X-Gm-Features: AWmQ_bk8sGkiqKNruWks-su_GbBuftlVlvuxShoCUsxCMxyBn1qChFuNzzEOjPc
Message-ID: <CANiq72nXfq8EJ+-ib044+zGbr2N4hJ_Ygte-4a_dmx4A3S+dng@mail.gmail.com>
Subject: Re: ABI mismatch build error for 6.17.y and rustc 1.91.0
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 3:26=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> Hm, that's a mix of gcc and rustc, does that
> even work?

It "works" -- it is a best-effort hack as we always warn, but some
distributions do use it.

GCC being used is unrelated to this issue though.

> The full .config can be found here:
>         https://github.com/gregkh/gregkh-linux/blob/master/stable/configs=
/6.17.y

I picked this one and run it in v6.18-rc4, and I see the issue as expected:

    git clean -xdf
    git checkout v6.18-rc4
    curl -o .config
https://raw.githubusercontent.com/gregkh/gregkh-linux/refs/heads/master/sta=
ble/configs/6.17.y
    make olddefconfig
    make

What is the config where you do not see the issue (after it gets
sync'd, not before the build), i.e. the one for 6.18 that does not
fail your build?

> The issue only started showing up when I moved rustc from 1.90.0 to
> 1.91.0, nothing else changed on my system that I can determine.

Yes, the issue starts with Rust 1.91.0, so that is expected.

> Cool, what's the git id?  I'll be glad to try it.

It is the one from the rust-fixes branch:

    fad472efab0a805dd939f017c5b8669a786a4bcf

It is the top one in the rust-fixes branch at either:

    https://github.com/Rust-for-Linux/linux.git rust-fixes
    https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git rust-fi=
xes

(Dirk gave the parent commit of that one, but in your case you need
the top one too)

Cheers,
Miguel
