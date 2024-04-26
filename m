Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF3513BC18
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Apr 2024 07:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714116131; cv=none; b=B/IyrC7AItR4LMRm4okdClJhL56sJdUYqHf2xe0g3GqfQ4sPwLQam6uCT7/GwcGjLpml1GWl/EDkmwloLtS8nNhNBj3xC3a6O5C16ETjTCou3ZDJ/bmkiyaOz/FTUYS2NnY8IbXqAtlX+zBx+ooVDXZCkS32XY2+fNiL54p/Fw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714116131; c=relaxed/simple;
	bh=kCl2JMb3M0A0aSQlFudbVNasfVgwzhlsqYk7dIPUCiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ignc0kBLy2XKDa+XCoFC2ec/87zRyVM/pYyMujLVN8oqrv2P9cc3YJ9IuCkK3YtRALfyaazsjuwIp9tb/GxKDSsjCdsDlmQoMheuQoSnO5vxHF11zAPg77RADpdmohzgxVVpa5hR3QAzANM6nDZET6gWhNzZl7hCDs8euMHEhco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U33dZVds; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U33dZVds"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ac9e8e4e3dso1590295a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Apr 2024 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714116129; x=1714720929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCl2JMb3M0A0aSQlFudbVNasfVgwzhlsqYk7dIPUCiU=;
        b=U33dZVdsQ1QE2bDEMgketG9r0ycDwsVOXUvAdT1GcTbrFGfHkI54xue+UbaS6mc0l5
         XwiM36mffCM3G4FfeCxhZVfrHVzb08/xcDq1rUzYoUaaieKgValT4oSNxPrFOjT50xSj
         G2yDIXhfElnmZDZzgqLNRdPVpfIfTShjxOnaRHnlbmHaQge/HsCjmdyvqmMNdAXIJMpM
         MxGxO8eojvBvlr36tXPkGjrD2Na8F402lcCpcWeas3c5H4xIj8IhJ432bmPmI3Krs0rl
         ZTts/WNL+ro2mPbGZfLi2ZweicdqR0SJdJEOZBWqx19mSbW/bi9ufjXeWTKz5U8cfNMe
         8dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714116129; x=1714720929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCl2JMb3M0A0aSQlFudbVNasfVgwzhlsqYk7dIPUCiU=;
        b=U1cxhaA8OuaBv55zgRDBSJ3QwQSxgaeZAWyyNjJ30LiL297srwHnZ7VUuaRrBzcGD0
         quQB5Za8Q36GbTsCTAO1Rj6t7miy+MamVsLS+Wt2nee7UAka4zRbCDdeYmN1N16UddRJ
         Ptj54EfV4IaH2NPteQF63fadtfxi1cyN+XWFfAfwuUmxKe+LMCgdsSM4gBSB1+yeLN5U
         rmWUfWvf3IXbaFidvtZZMICQCK9T/EOXbPyc03VtmDcb9MHBHXs+Gl/iobZxvhNlKTZs
         m3abJofu6WF2zZQA2bJ6IyfdBqTKanrtSQBaiFbhZoSa5k7oDUL2w9Kw3YuvxunZnS0U
         JEWA==
X-Forwarded-Encrypted: i=1; AJvYcCViF6/QVz42eIi9HvUphZal8VAXnMkY13EqQ3duvZPqycsvxWgdHfBMrz5gfexecuMBtaAyw2mSBxpqb/uGsNadRAPmJiFV4ZNCWY5LTFc=
X-Gm-Message-State: AOJu0YzOvsU1quyaxbG6SCS/GIT1WSWABrPW4bEG0Vq0s5AAHRPAQDM7
	912Rbj5wr3RxLrVoNIAd4KCVOMa6DeXdA38q7BrnUBcSDbmTvBHtS7MCNDCBLy+d7RBo1NZ4y+A
	2HF91Yw/ovcRpVVcksIYXwfBdggE=
X-Google-Smtp-Source: AGHT+IEpJpFNuF0B76ESbyFAACGPheb1Vp55FoH7XuKPCxFWZ0YMdUIidOdbSEoFri6kHCXfv1yeCzpaqAX2NjKGqyk=
X-Received: by 2002:a17:90a:68cd:b0:2ad:1e60:502a with SMTP id
 q13-20020a17090a68cd00b002ad1e60502amr1886667pjj.38.1714116129271; Fri, 26
 Apr 2024 00:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b66e7e78-35bc-48df-9e3b-0a57996491ad@proton.me>
 <20240420.101421.329379978497339506.fujita.tomonori@gmail.com>
 <c613d60a-4136-4a4b-a2d3-9c849b245cab@proton.me> <20240426.101055.990464946230867124.fujita.tomonori@gmail.com>
In-Reply-To: <20240426.101055.990464946230867124.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Apr 2024 09:21:03 +0200
Message-ID: <CANiq72k+GG=4NOxyAuiY8ears8Fii7G_i3Wkaa9vU1ywrryQSw@mail.gmail.com>
Subject: Re: [PATCH RFC v1] rust: add 'firmware' tag support to module! macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: benno.lossin@proton.me, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 3:11=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> - `firmware`: array of firmware names required by the kernel

I would say "file names", not just "names".

Cheers,
Miguel
