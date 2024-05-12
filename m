Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E0ADDD7
	for <rust-for-linux@vger.kernel.org>; Sun, 12 May 2024 16:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715532930; cv=none; b=tcTMfbQHP9IQKGhmul8GOqs47v7F/LQlEMABSoJ30/2OQ+IyD8FMMS8sFKK8LhZDSLSotH46ivF8IoWnpWcjxOp+PWsbKkpKAENEtA9DvHgpjobci4XoW709ZGktDn2bMJVnW0W4Mmwfskyuf6/TFxC9oiAei0ASzfAEQ3vcHxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715532930; c=relaxed/simple;
	bh=IgA3bYU4lLHrG3W23bHLbXx/xg6DVPmI7MgaJkYmRsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rc6Jh6ZTxhoC1p4GG6vCfGLycKeKfWV80X/xxnM6/xGPZaw63L0nLlaBcoi4upJEx3wyAEgLapvcnIPYjSEAxAauljiNbDhhIP/IbhpnidhtKy60c020wf+m+jPi1a1qPwl+17AtJQlGft5IlD7Z04OS1Dl748FaGlLenVBR3ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwRf11C1; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwRf11C1"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5b279e04391so1940787eaf.3
        for <rust-for-linux@vger.kernel.org>; Sun, 12 May 2024 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715532928; x=1716137728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgA3bYU4lLHrG3W23bHLbXx/xg6DVPmI7MgaJkYmRsc=;
        b=hwRf11C14cyajkjMtBwycXasjnncebY2YnKLoGdTX+uxFMxitWqrcS93k2W1usiyZh
         DnZURdDA+EV0bDzwbBvA6kjznqbqQc3DaFrCGaly6u9FtqsFzZaMXO1NbjOSZOkR8GqD
         +CXuQvxtUR6mtSffD0skHNAL+x5zGZR2Dp7PBlN0gUbAMVe+fsYjjsfEAZ7SJ/a21H94
         MmEUu0czzUXHMQrDJcWk2mJhJWUbTUaXK6+lM060EL2EOQsSgPAZf6vXGz0i348RAa/O
         YIr8vfIb0mEFo4Z2O18N9OVDT2mWxnpTQ8f8/zHcEOmnR0BG+K9V2hW0ecDIj6Lal+U5
         wj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715532928; x=1716137728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgA3bYU4lLHrG3W23bHLbXx/xg6DVPmI7MgaJkYmRsc=;
        b=LJ1h0YD5j45yBmt9f5r2Cn+rujhQyKECWc/Uqo9LOY88WVZPqb6UieS4RoldCwICWy
         yKXwx13LPif4DSxzP5gwqi3EI4zjNMsyvXUQS5KkFlDfVPBeugouHgmEVb9lfhuB6L2/
         554PW3I6vPUM0wGFGLq8v8c5Gh97hSSup9fTNTBhCigaF09sWZtw+racWMt1GSSAASDi
         67kjroz4Bq1NldkxmqFUvggiZu+2OcjxyS7mo1Nk2Md4D6N5arapaoMx1lC23e1ZOO2N
         9gGN2Rq1KmLEpnof5/Zv53VtfgA5qbp7PgOJhduOvNBN87dU3zofeGNZdoY/PDD3WjAc
         pWQA==
X-Gm-Message-State: AOJu0YxqtNCt2x5qyL41456Y3couNbTaaD7lL1xZ9yxk5jDpwr/hnjRt
	VnXKChPUy63xLJwPjp684W3E9HH8oHnSsX0qsBJJfoylbDlKclJvNX5Xo5SbDWNdcIlSUbJJz99
	Yved2ke/5tI9VVrSrWH+H+vcgAdk=
X-Google-Smtp-Source: AGHT+IHHY1QLWrDp5Cn+OrNBnG5pvy9ZOJEBlVV8ogPJK+MbT+M8xTz2S3ddC5DL+htA+KMi94pIHot8P8cZ+sgE9/4=
X-Received: by 2002:a05:6358:280c:b0:183:f634:104 with SMTP id
 e5c5f4694b2df-193bb50c50emr785670855d.7.1715532927789; Sun, 12 May 2024
 09:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501123548.51769-1-fujita.tomonori@gmail.com>
 <20240508.081144.1308480380091479358.fujita.tomonori@gmail.com>
 <CANiq72nHkadpMt9wMTm+BJ5Up-EG6ymay68qi+56nv9uLXXcgg@mail.gmail.com> <20240509.085826.1793889118157877475.fujita.tomonori@gmail.com>
In-Reply-To: <20240509.085826.1793889118157877475.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 12 May 2024 18:53:56 +0200
Message-ID: <CANiq72kJQp_GHnr2cD7e8s5CJ=Sawz9ad_QVFrUxqDUppe4FNw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add 'firmware' field support to module! macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 1:58=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> I'll try to push QT2025 for 6.11 via netdev tree. So I hope features
> which QT2025 needs to be merged for 6.10, especially a feature that
> would be conflicted in rust and netdev trees.
>
> That's exactly why I hope that this patch is merged for 6.10, as I
> wrote above. The cleanup will be merged via rust tree. It makes
> complicated to put this patch into QT2025 patchset for netdev tree.
>
> But I don't think that this patch is an exception to the -rc5 rule. So
> please push this patch for 6.11. I'll think about a way to push
> QT2025.

Thanks for confirming. If netdev wants to apply QT2025 for 6.11, they
could perhaps carry this patch with our Acked-by -- it seems simple
enough. Another option is creating a branch and merge it in both trees
if needed.

Cheers,
Miguel
