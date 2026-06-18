Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CA1231832
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 02:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781748309; cv=pass; b=OPpVk3MmhWnUF0qHTQ9v7ABWKY+Oi1Ntm/kk5BPrK/GMLTzzx3qZan6AoYRhkf3J6iVOFM28JhF9gUbpkuVwNjARlNVudOMB45eB6Yh/acXklLGt7vAyu/pCnvtsbUDhoLOA5fg6IiWCnZVTvS9Gn0VT0fOSmncue7oy5TXKNM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781748309; c=relaxed/simple;
	bh=Uh7eZP8JDYxXDuPFo9zlO/GeRgtPSOu/j7Z8w6X4Mzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvnR9cnZ98ORD0oXFc7s3X4q7FWSQRNGgDrlyV4BEWk8eu9OC8QR7ghi8/s+1EzatXCkTDNHKmpUNPcGtkCUQt7N1sSiJIHwHTkLs13QyjhwiX5tJ1AboIWjBy71/MD2xqEjxrXXRrNNuM0Ec4OLigmQxdlHdpC1RFzu0BhozOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KySmqt2x; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KySmqt2x"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso954278a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 19:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781748307; cv=none;
        d=google.com; s=arc-20240605;
        b=CSg62NqCd+hXBSsuUY0ReH76YakFk9wsf1oNvvJk01wCkP2o4Ll4u/2BKtgtq+mc81
         SwwJZoBNVvjbAqpXtRqSkCLj6D6VgDcCecy6uQCvSOHpYP5OnjJyHrNb/nM1az2ZiE+m
         e/ygW7p4WjlLBZdCx5XcRZHnlniXwxkGsPTohN/bLSN07r0/aWwK4RK7LAjtJFzKrWIa
         nqAJgTNiqiHXVBfYIblZYoZxpu5PbrhzeTdw7hN6Cx2X0Mg0pRv3YHC+IVmn+gzYXnYZ
         LmGhPytt4IfgazFxKo7vDjE6U46z1IVeAWNyHSSmQ+hq+LzAtI17zA4Th9fAkMRswtXa
         a5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uh7eZP8JDYxXDuPFo9zlO/GeRgtPSOu/j7Z8w6X4Mzg=;
        fh=tdyS/G/ypp3u4s01tNCEVeGRpeHnh6fTh+Z3L5Te5ZQ=;
        b=WQrhwjOZ+WOog94zQGtACdwkyRgyE3/QGeHhtn7JRdJfmW6ztUaCD8uGETpRXonRe+
         5aMJ/AIE+EE4OFSt+Zvid/cDOu4uFOyO10k3S84/AWZvq5hl8gmrZK6eMoLSu7Tcbqcy
         Tm2JXbVJwWI7Q4cZ/KXxXM73LWX0MZvmjk1oJN8K8x+/KpNXgBAv69L5SJdLl76oy2j3
         lgwTKZb+M/Cnckma8MgI15jnqf1hLl3+8TuB8CIA5ra266wilstmJxJwK2a8SfIRrpjX
         oEYxQIaKSdFtShsUWTtHDh+gvEs7MU23sChAOAQsxhsQkKJQKPHhZzEi4lqfgSn0MHPz
         2Arw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781748307; x=1782353107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh7eZP8JDYxXDuPFo9zlO/GeRgtPSOu/j7Z8w6X4Mzg=;
        b=KySmqt2xehvM2eUoj4Pp1KPKSt1XxIo+WP3pl27yRzCdpQiEtAQwlrJyjOLwzUoeCs
         rqMHgEFe4AcAFXnsgQ+DNzKB9fLnUNeebpN2WFIKrGWgVnsYm9feRz9qGpLU0ZOXngil
         LWnJSOD686K/qVeJ1ps2gcM5efCQsdRE4iKo4C290llAjD/zxhGD4fKL8doWXmOQOw5h
         n36kOE9n5qmGYbQ6OW032sCU4aprf61X9QNCnCk/wiLuqfznpXUeQpX5gw0vxZuV0Cex
         L7oXOWW2COqKY2wyiv/9uR52RGZeadMz7SxeNupOO6ovf1L4LewwNzavOkFFmxdd+dfo
         9xeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781748307; x=1782353107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uh7eZP8JDYxXDuPFo9zlO/GeRgtPSOu/j7Z8w6X4Mzg=;
        b=nXl/aLwcf9dpJCvUvxlB1HFCclN0S+xyNYxCqnkCZXqoY4LxW9REnly+r2/YOkYYby
         +5+lF0YQZlej1o0BT8ZsmKb9xGB3GS9NPSCJUKAVJXwmjy4ZbGQrjXgE7HB2LnyFcaNu
         9ATIkm5GkrdulNlWpYpBeDi7C1chNTgzBcQxoOF4Z6J0xSC90NoXut+eMAma7NfwmGks
         jmWxJC15yM7ZjAWoM82Jr+I4Efc0qVZzUp2Cksc5ybj6dxkjMPl4uWUFBqoFXr9qSFFX
         V0379msaS23Tk8TVN7m3iKZRdoSML9TO+DwnPPR6H+9yQQV7YVEAdPt27PCehlRYgjeN
         BycA==
X-Forwarded-Encrypted: i=1; AFNElJ+3pYNJthEcN47rBWpC/DbjrMjv203lmW+RAxTr6g9cOD5WADWDOICoiPa1qStGyTwgQ/pAKPyK1cBVrFn2Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzubEHX3A0QakobEU3tgF7NN5B+8g3vDRdYZONbwKNfB0x+qlFx
	Fd0l1e5+L5z15ZVLlDZDnen66qgDip8ctBhHnCUJS/Tp4h+D0GYY2OnN04oQVjM1cR7O4MKkm6s
	6Awl5Ye4W+B3mOXKK5V3oLEiGGhD0O6I=
X-Gm-Gg: AfdE7clZEJhbC7J/WnPUdBjj3y+fPiqy4fG2pZFQUnI9dtNqck2L+AeDdYDrf7yoJqZ
	S+LW5nfym26PFYtNUwmmslGlncpTpavs5RABpJT/o1wTYz2gmBOC5dbjjNuNhxRE2leLebqiNPl
	S+IzQOkN+KyOnAhVuBWpTTpapT6JUiGZgRAYudjOLH//V9hsQUg/Bo8R8eiEmzEVitFm6QVe8ev
	MSoEuru+/nqVeLLZ+fu9ZaeLTNkth9oXF+FwFkhLPaz5q9aV9zQYmChbgK2pdWfqyjm77UyDUms
	X8ypDjweAZssbdGB6VTk61cweWk=
X-Received: by 2002:a05:6402:528a:b0:689:b30c:421a with SMTP id
 4fb4d7f45d1cf-695ba1b22cbmr1043888a12.0.1781748306691; Wed, 17 Jun 2026
 19:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508031710.514574-1-alistair.francis@wdc.com>
 <20260508031710.514574-9-alistair.francis@wdc.com> <CAKmqyKO1L+sCHWMDJ-tH1WVc+=oMVidnVSMttr6ft0-ewSjMVA@mail.gmail.com>
In-Reply-To: <CAKmqyKO1L+sCHWMDJ-tH1WVc+=oMVidnVSMttr6ft0-ewSjMVA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Jun 2026 12:04:40 +1000
X-Gm-Features: AVVi8CcEcPCPlTkWNTLD3VXO0gTKy5uNbpMM9S8kJ68bCzeLwWNcsIIDADOjRnk
Message-ID: <CAKmqyKPc4hMYg5ARw3RH8KJwWfk-1CMT5zqnVrbhtdT1X3Z0aA@mail.gmail.com>
Subject: Re: [PATCH 08/18] PCI/TSM: Support connecting to PCIe CMA devices
To: alistair@alistair23.me, linux-kernel@vger.kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, rust-for-linux@vger.kernel.org, 
	akpm@linux-foundation.org, linux-cxl@vger.kernel.org, djbw@kernel.org, 
	linux-pci@vger.kernel.org, jic23@kernel.org
Cc: alex.gaynor@gmail.com, wilfred.mallawa@wdc.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, aliceryhl@google.com, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, tmgross@umich.edu, 
	ojeda@kernel.org, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 3:56=E2=80=AFPM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Fri, May 8, 2026 at 1:18=E2=80=AFPM <alistair23@gmail.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > In the next patch we are going to add a PCIe CMA TSM driver, as such we
> > need to ensure that is_pci_tsm_pf0() will allow us to connect to CMA
> > capable devices. These devices don't necessarily has DEVCAP_TEE or IDE
> > support.
> >
> > As such for Root Complex Integrated Endpoint (PCI_EXP_TYPE_RC_END) we
> > also check for the CMA DOE feature.
>
> @Dan Williams this is the patch I really need your thoughts on.
>
> The current upstream pci_tsm code only works if IDE or TDISP is
> supported, which isn't true for CMA support.
>
> This patch works around that, but the more I think about it the
> hackier it is. I have a local change that reverts this and
> updates`tsm.c` to work with a DSM (`->dsm_dev` is NULL), but that
> doesn't feel right either. Do you have a better idea or how to enable
> a CMA TSM driver?

Gentle ping on this. Any thoughts here?

Alistair

>
> Alistair
