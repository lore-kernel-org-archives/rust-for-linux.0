Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13541F418F
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 00:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777423150; cv=pass; b=T2xuojuq+sRcfYNnMIC1CXqnaXkROP3H9uybndvzQNtY0yVnz59g3KHLetE+/VOuumLB0X8/rzXr8g63C9x+s5iqZSA5IfcUijReg6WkEAx9dDod1toGGH+DLoHgOocDQd+ng9XfbSHtsQQmMrGgnianwdHwI92GOkLkdw9riIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777423150; c=relaxed/simple;
	bh=lnq+RzcTqQApY6vrzuon4NmVdC+fOyrYiS6n6xe3zDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ho6oRF+aCpuGwJ2imoo8lQa4GUgHZrh9iAzxbU2kPBdl499O7E+limi3H+o/XCdBsLpStBOTX+mUEo2osvO7XnoPgfok+M6kYccRLdeMtF4Jhm+7MKOzgXhHqCV5TNI/uWvqiBnGN3t5mdxLoBa6ifYofJil0+kPArNCXf7mA2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ligiHFGm; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ligiHFGm"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bda3b4318dso1356802eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 17:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777423149; cv=none;
        d=google.com; s=arc-20240605;
        b=TYo+q8ZSlA0dEKvyveJjSJzCMS63ozRkr1lVud8iWfkjZxdui2hhDMJqEZtAaiGamB
         84lLYkbkfw4HDKNV5MSlyPBOC+bEOKbLAOeQmn+rHRI+GxaycEZebgXKHri58LXVJ2pB
         JvacXkbV1CfhMyKB+r/k1xQdLuh1/QOT9oOjj88U9+3dg1GFg7HqXdmN6RX/g5i8uiOV
         mk/M50iOzNBw+rr+Z0HxAkFdgGyfDVoEZi0NsSc1NXFm34XvtEYoa9B0c4qKr6xcp4AD
         cIJS/0SlmsW2jytZPdG4Ttyot0mlMk1dkxR6p0xl9j7zDpiyGv6jzKjjFh6oEP564KYW
         eb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lnq+RzcTqQApY6vrzuon4NmVdC+fOyrYiS6n6xe3zDE=;
        fh=wqEnQN7SL8iYG39rdDPsQ8TvRJfGMjLe/QKY0UeA2TI=;
        b=VJDc5+RQcHbNvkhBjS3bHvYdYfRKw1OzXvXj6Fh3m8hW752lFaaMzaod/31DcLYrVD
         Fumd18dx75nCtb2MEoUw+IcHOT7L3ru27SrVzo9cS/1MQwGvYGBjMIFZFZHRBk4BE09G
         BZAldHz6InzYLed7VSQCQvuv5s6c5/K/CItakuSR7JJxixzuAPnm2LaszRDH58LgqYa1
         gOi0I8qnYq83br5xiBzSXgjvepQox2qlUDF60WPpfmAECXiC2wzOuVMhJzL5ee793d3q
         1ynxFe2IjvZsXOxe7RY9JHP1TGAu+EdZpXOckx8/Ekh8C2nOZCApuVUMyhlhJuHDEzfJ
         cQ8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777423149; x=1778027949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnq+RzcTqQApY6vrzuon4NmVdC+fOyrYiS6n6xe3zDE=;
        b=ligiHFGmoEzy02s+aQEWyPs8/vVgGjhf+LWOxkCgUvFlz8wHcDJQJI/jPWqJgTlg7Q
         Qzo7GkcBSJjFK1ScFqM8GxGMlaYfGeIzywTunlJUgFErhjGkfzuGFrwxjzXVQcmoRcAj
         o6WU0tJU+2C4zb+cxC/NTzvXvCDQ2qGesvZPeV4g2JQcb6nRBTGV8E+zksy/y9kq8jgY
         oNLgPrsKYgwJD4EPedYqyP/7Ssd+DRcFRTo3l4l8+35LzQC25zeb6tq1XwXF4pCUFkDW
         0JqvW3aL2WmFPW75E4IU157ILtX+ZZsm16rCgo/XywiM/wi9hEWfItgE7fY+EsP8y1VR
         C/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777423149; x=1778027949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lnq+RzcTqQApY6vrzuon4NmVdC+fOyrYiS6n6xe3zDE=;
        b=apN1wPbAFrHVK2ffuyAHjML0pZzYKv/hlRPgVkAKe92d0brJc4N9VoVf41Tm4oERX8
         6cLayglGlXVCeqbghH/KWo1pMt0nwxVayG4m1w8DEcMPWB4fHWalSsTyb871CLCweh7v
         bJIihHkbtDpWXvsV/rsAfYWj/GgI3FLmNKCLG5x7nkRjBCsXtUIKu91Tn1kJHce4+zW+
         lMJo9bEG6AKHy+QUF6E0SSbzgfDWQN2EMJ1FGaxIwAOM3fpeXmmCWkqAlDAhw4SFDFMx
         jhqzaYiecuUQYvzu0PAmXwIZ3HHfpp/yg22LDYSC5hTdTkigqqcW3MkngZ0OiqWOpgJf
         xBDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9J8gDuhQu6rplcmBc493f5RH6L+O+t9hji4HZKWu3CuQcQDd4Zbsy77Uo4/r6wg9bnCUB101WnfZofRvsKuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwbS/qe7oPWEWw9haKYXjlPDQEMOt1l2cNFiA96yXw7srzLCnX
	DOacaPK5BXJkYWlp6xXpq+++Sm6A6lUTI6ujKoT9D9nByyMN2iWnyc5zz2Bika+S/3YqzbZFy46
	5WMjjn8QZwtYNTG5FjBU//e+OfVlDZ4Y=
X-Gm-Gg: AeBDievldm/xDHlvt8KjGqMhbsZjHZvIaN8q6iBwLwy9wQWuUGQUdQxiDa6QSiVUA3I
	OkfhZMNVTbr+8lQ/5IQrFTstEsXazWSCo5wOBWsO7PuBAK1CXHAK3g1bYRJGi5pighWmQjDyTTx
	ZKlK3pTHS9TBzIBBNySjWeI8yB74eXL4V2XTokz3xTYrPFMIhVL/QCiRTHX9KtZ3jdHrdaMuSpT
	vFkuzhm3ulLqvAijhRwx3nymWApUwbQ8a9UHTN/JAN5tMPJ8QU/ny6KMLfSQkejGqxvNbAk1RKa
	U3TDi4SvOEgNNWPtMtTvZaPvoDDxqEcnuPeBwG8Umojhz400oMrwC24ldkB5zo9KwXHskE+KR0/
	cIZlnCttgGqurX+jBA55drIpNpGxNWayOTQ==
X-Received: by 2002:a05:7301:fa0a:b0:2e5:5bf4:886c with SMTP id
 5a478bee46e88-2ed09bc6856mr1151978eec.5.1777423148670; Tue, 28 Apr 2026
 17:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com> <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
 <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com> <CANiq72mEgpe-UGMQ_YWb8SKsY96Oc0b4sQ_MKvhMDVkNC9WvQA@mail.gmail.com>
 <20260428184511.GB3304253@ax162>
In-Reply-To: <20260428184511.GB3304253@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Apr 2026 02:38:55 +0200
X-Gm-Features: AVHnY4Jhkf1YJCEOdRRUOwzbTzh7X94i3-EvhUl39GdPP65emmpf3WcLQ5yzpF4
Message-ID: <CANiq72mToO-jvEqE7VyqU6u1GK=bO-U+FD4Ei0c9HOgyzM+53Q@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Julian Braha <julianbraha@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ljs@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 8:45=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I agree with the sentiment that more host tools may want to be written
> in Rust. The Rust build in the kernel does not use cargo altogether, do
> we want the same restriction for host programs? Would these tools be
> able to share the Rust build rules so that we could have a simple
> hostprogs syntax for tools integrating with Kbuild to use? Obviously, it
> might be harder for some programs not to use some of the nice third
> party libraries available but it seems like it would eliminate the build
> system considerations from the discussion at that point.

Yeah, we have already 3 hostprogs in the tree, which just call the
compiler, but it would be nice to have a way to use ecosystem crates
for those and userprogs etc., even if just a particular vetted set.

Otherwise, it is quite painful sometimes to use Rust, and one may
prefer something like Python instead (like we did for
`scripts/generate_rust_analyzer.py`). Python works great for many
tasks thanks to its standard library, but we lose the advantages of
something like Rust. On the other hand, Rust without a few crates to
support certain common things isn't great.

I wouldn't say it is a rush, but it would be nice to agree on an
initial vetted set and try to set something up so that eventually it
is easy to write scripts/tools/hostprogs in Rust going forward.

We could also consider an earlier MSRV for those, i.e. lower than the
kernel image one, if that would allow us to use it in more places,
like for hostprogs without assuming `CONFIG_RUST=3Dy`. Say, Debian
Oldstable instead of Stable.

Cheers,
Miguel
