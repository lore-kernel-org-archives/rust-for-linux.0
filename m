Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20547389460
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958589; cv=pass; b=uNQMB/YVo772yxmlU/gPy4LPJmAve3VlGsQznJIMQ9fnpe5uY1cYm1t8RqyGBYNru8jMVg3IuzEoKgU5tprJncbuh8+TXlP0B/QF28/xnVeaxGQJnGlY9ot4Q71/X2v0JAf4MD9m26e0Rf5TO2O9oRXD4tZrtcGYksKV/Q8Kr6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958589; c=relaxed/simple;
	bh=n1fDnNleKBrs0gtz7rwKG/FuFD+q8E+8cLS2M1eyGXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1OttodvUaImWWl/5FwaREuNzCpV6Qpd00yyav86yruSD6ZLMHM0KmHAkK+M/6aNirlohdSziIR8RDq7jUTrHgC3VNyy7TcH0jA9GtSIWCOS4+un7WrguC3Sy0YWyEEZHRc7YZ/AouICQAMAUPNTm1ZyR5atul6+mh77MXlWQK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkM09dbd; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkM09dbd"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304dc707c7eso13619eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 01:56:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779958587; cv=none;
        d=google.com; s=arc-20240605;
        b=B93/5ToVR+JKhc3l1CqseDi3ZFW8sHZmc8aCD82SXMGtFWqakOUirG7M9JvJ5qaDSY
         AUoq3MgxDoZ7t24kpgnI44nStJ20xcqogfbcv8vyZ7GxJN/m0icbpNhd9PDdOng/8CnM
         0PEu+0Nh2xO4+AeWqwdV6oAlOf4vKdmBEoPNSrAh6YsRA2v5V0i1UmSNVTd2Tx7e4NHa
         Tjwzxy/dZsiJc3UigqWEj7pCm1YjukoAk6W1/EBLUcsoIHF2cUiCRlvX81MOD9vunUUI
         JhV04pMPtL+D6DrxoUrkIuNblP1+x26HbgIL5PeXKxe+Ix6WeQcDTbHN+bC838h58jwy
         zoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n1fDnNleKBrs0gtz7rwKG/FuFD+q8E+8cLS2M1eyGXg=;
        fh=PuWlYwV0wXu6qxHGqZtQDsOVwMlYse810d8pFcMkLZI=;
        b=MSeHY0lpGHuR/AT0Yeo+y0XR2KSXTp10gepFbOe1xBHfqLEDhrTchSlQk/UqhGDS6A
         sWU1oKhx4ayEq4QIYPCfa8WGEBFPU8vLI7vxazReFVJgEeeYIAUIcWmICMQaCuJxFEde
         7MRBKrThwXMM96mN5f9Ja0S5y8mPOKgEMkJ5Ih3wk7CEK2hMhDbOlbT/3vWxo2PUBbaM
         Q/Tx4SQMhUS7TNgQLk70t4bOZgoWZ8B1yQb/Sh7KFzN4+I6F6rT2LfrayUZwZ+EKdGEC
         YhBkZVMv9QGt52JTy3yWfnTsE6U99fY8mFYJfEb+r413v18S4LcvM+34DIdKOTj9tw/u
         Gsow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779958587; x=1780563387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1fDnNleKBrs0gtz7rwKG/FuFD+q8E+8cLS2M1eyGXg=;
        b=LkM09dbdGD4df4xBtxk+um8WGgilhwsjWeKMd+7aq+DlEFgT2ycAbqWtwVVTFoMrBm
         IvWgsCOpAj2F8PY6nX3yobrlBxelVWdr9fkWbPgwrOUQMh8DVVCphRzWmYq9pOPqblL0
         3aE2ZooMZkYZQY8v01kRtgUKLNpyqYxbjttN4XVNKC2IyUBT4+7ksaEvY8PdiuR50eJ9
         WFGiqbJlAobeRrI4H00Mrke1ithgmsHqvuICq9+npawh2FyYDDRHFghNe+dBXLascuFk
         eUrQpWw6w0/wBUjl10++kDc09uMpG1gDaHrQNEyXjN7v8cRybTYfssJY9e27yOG8Rd/T
         h/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958587; x=1780563387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n1fDnNleKBrs0gtz7rwKG/FuFD+q8E+8cLS2M1eyGXg=;
        b=JQ4HOasbRP4GpPvGIDRKrW9V7hcBS+t3bIwWDdti+xqFhHhTT+DJYtZR9eP0gVnAIj
         5pObtth41/PYayUSFzEf/zvxxOK5wWfvzQvmcEUN1iuGXJqpo11Al8vxwGOe652ooFkE
         k2PVznfaCNdw8rZYMZ37qt7l5zjSMaWiH1TLlwb+q6tfKNHSu7Sofxrq4h+Q9in6pYwJ
         sCHTpN2nOQ1okvD2d5803fU6uUyVzm40Q1DnH5r8PbTlLxhy7nNrDUW56hGzLPR6/U5C
         ft1nR0c8IQ1Ux2iOSwPjubmG8aCVdg3ZbYY9CEfYkoNlBMs4V+RtnFn/mGmAUuk/36i3
         w+7A==
X-Forwarded-Encrypted: i=1; AFNElJ9EhEQapmR+RJVmHPVIw1TGvQmBlIJbvIt77G++/9LQGHRv8gjr+nl9GigOFfFvND/KdHqJMA1sWNWNyzG7VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvvEApxX2bKyhFDqLFiG+Fshy+Wrpta28ZDNHSI7FgvHQw3tGZ
	HpLE12q1ZZvPw8zc3Ri1svvCwvNKH1FlWYh9GjfpyHb7Zilxh7AlKdskHZRgVPeZxVoc+jnq6Pj
	W+FRc3tR9hcT33GHbmndCkObM58wsiYc=
X-Gm-Gg: Acq92OHwUAgPvGNT8GJYjFpxjUTV7SgykVhJr4+5IAXCC0PoOw9kaTIPmPtVzoBCucg
	bbTSIGpSxPPIKff/XVTV+ZIr0q8V+GCHdcre9Lr2UF65I2UoMo6hwoVhGdqluDLvHVLNjkOqiJJ
	+1Qg0lZqdCwDQBTxrKM6Ge6W9ZeEjAyNxIQDqPYcB7MZ61tivn60878blM4a19PgTJywBbczfey
	Byxyob1tVu4GJzhbQ+B3OZBwnwwnmXPczXxt1yp/hHmv8xgQ43Qqwb6tp1A9ioWJQsSL5LPWW+H
	HNvhyWMg+KG6tFHYo7pB/Wn4kBS3D5t0Mgrsg3PCf1FZzWdECXrgQmwNf1nIqV5dEolafHq9q95
	Fil9pZQBBhqTa0t7dR4kOiXrQaYa9UY/t/w==
X-Received: by 2002:a05:7300:7fa1:b0:2ff:b29b:87b with SMTP id
 5a478bee46e88-304d2eeeb17mr399285eec.5.1779958587122; Thu, 28 May 2026
 01:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521161405.64042-1-SisyphusCode0311@gmail.com>
In-Reply-To: <20260521161405.64042-1-SisyphusCode0311@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 10:56:14 +0200
X-Gm-Features: AVHnY4Jbw8eIVF4umMpWmAnu-SI8-OZd7X-hafIk8ezroHFvi7Ygb5a2BmJMgxA
Message-ID: <CANiq72m5GZp_p2HCgotBaevLmt1NrvzwrzJJK5sLUEwxeVLBdw@mail.gmail.com>
Subject: Re: [PATCH] rust: module_param: add missing newline to pr_warn
To: Kenny Glowner <sisyphuscode0311@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 6:14=E2=80=AFPM Kenny Glowner
<sisyphuscode0311@gmail.com> wrote:
>
> Add a trailing newline ('\n') to the pr_warn! call in set_param to
> ensure the kernel ring buffer flushes the message correctly and
> prevents log line smearing.

Did you see log smearing? IIRC this changed with the buffer rework --
it is still the convention we expect, though, so the diff contents are
good.

> Link: https://github.com/Rust-for-Linux/linux/issues/1139
>
> Signed-off-by: Kenny Glowner <SisyphusCode0311@gmail.com>

Andreas, Sami, Daniel, Luis, Petr: will this one go through modules
too? Otherwise, please let me know and I can take it.

(Trivial conflict with the `pr_warn_once!` one applied yesterday.)

Thanks!

Cheers,
Miguel
