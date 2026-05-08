Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22AD361DBA
	for <rust-for-linux@vger.kernel.org>; Fri,  8 May 2026 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233564; cv=pass; b=tFsVeHMKmvVb34ZHvOQkbku/JzN2Fwww3FxRqd6mArroOYIn+MNUZQI2JspxZLrHk3wjcSnaCwfu1p2uz/UCsIJREPsJ6D102ZmOsl9pBpimKesVtNxWMXg/Bvxdp9it4YQa2CT1jLoHDdT0dEebQDY/ilwPteVCoGG/jj41hM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233564; c=relaxed/simple;
	bh=Do+CokqU7oVirDwvR3ktQHdmO25HJGaXZRspoXy+32Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/8zAm9u+fHD6nRiFfh+kUb9uA/wbdSLuVJN/AJd324uy2QP80c/8qFIk6wMVJDOjqyZJ5RYLVWTH1dmBoBI8jywTZaMVdt9biflfdTbelCjzOUWK71N2i/oBTMwpFzIjZS2p574U/Nv2y9xB63EPqXi1QB32PmpHIo3Keo7PwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+eMUg4W; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+eMUg4W"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1324053d600so150030c88.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 May 2026 02:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778233562; cv=none;
        d=google.com; s=arc-20240605;
        b=fKoM0SdDI5wmdhIwIuUs7cu2z8A63fVXBcieLchYmw8sAp912ZLhdr0jBD6abLN74N
         NzKi+0GwStYQEbJkW8gpXAoyQJp+p6B/7DVquVyvlhfos2wzxLXlwktU08+W4XmXqCVo
         y2yiM2WxGf3UvGUxOTFfsf3yPWhB+hWdZI9jPwPn82nN0RAS6MG0pwWikW/esH6Zm9aj
         Hbx0+2j2msx7hRvCj/Wn2aVy9DOBz3UNyi5Z8wpUA6xjZL8kKuKqTeGKuko6yRUv7pK6
         4rUkP+spWE9FLw3/NE9sV6bL2D3EFmuzs8/4hAoKCp7B5UZzMy55r355/hm7TKoVNxK4
         jI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iqeb3B6vsv0M4PL/Tp8/XaVQQLocfXwNH2ocP2BNO3M=;
        fh=zGsB4BJbyoYh5M3u1r/IQltkpx26rHRniD6Zj5uE3DE=;
        b=bNKIKM+A7ytfR+EvCOfUD4O5bxQWtCuIyLMgESsAyzy1qE/gXOt3tHlGvzdH74JQNa
         /FKyq2pIVxoZyBgnYvJVqDTTagU9gaWhXtAtUdREoAmL1bWzAX+gFpbj3cau8UW9jr0n
         rYQrwD+u6lDcQUuf4+UryNis3zvkiYaKX/MlP2r+IzUdpeMqWeM1gsSKo+zBWRWWD++h
         sJquxKz8Jlo4V7uQn4wB6ayyyw6Tlfkc8B+pvFo/SLZIzxr0z+lZu4/ar+9AGKN90c1v
         y5ogapt/bdefUUVVsSckWxbo/J9tvANg4pJ+HkcPPsZS/ZWVkrrq/BknBBKrp5+L+LS+
         zgEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778233562; x=1778838362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iqeb3B6vsv0M4PL/Tp8/XaVQQLocfXwNH2ocP2BNO3M=;
        b=Y+eMUg4WvFddo4yZ6B0C9bdD3GZe0l31BmMtYZTrwUT0U0ZwUZyDiajPcInDuk0r9D
         yV+owDx0qrp84WJpEteus/z0aTr2870Es3DYPR6OfXQCec3cU7e4uKr1Koaj93WX7D1D
         jOJPBsvkM5Z8zi6pXhFweFRb8/FOPX1OEdwRP4XSlwx1M9DLTh1+1ZvjAzRKsXKJ5oiR
         qt1hNLvUwFSAf4LZCSEtTclGqefX6iPiv4GIrT48zhhKGszvNHzd1tCod561w6khEbcr
         m3xZU83wf3xfhnjL3IsONBACBeIG3kRRmfxVZ5j7pIdVO2c8WmC6URfNz05gYkQRTQml
         ipEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233562; x=1778838362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iqeb3B6vsv0M4PL/Tp8/XaVQQLocfXwNH2ocP2BNO3M=;
        b=A3FuHFcG59Vn7fLFFB7BsK6ESyf4m4E5ReJn2QP1eUZVraHoimo3LrW+IIhJbAFSov
         L6zJHgfjGcx2ts/tgE14h6HHdrYQJHF4mquIECr9btzvzCZ2AIvtTQVAlf8l7i4cfU6p
         r8pDRKhrTJUIJ0+Fhat/iqaUl9z3/9gGCbwyR/kS0nBZ+W3L8ZFhctbFlhkXsgZykTB0
         M2tg6xmo1wcTjgzyxLD11sE969t/EMaOlhmyqf85znYlK24NfsEeT34iztJmXveq1dvt
         RCOdS1qfrSiiJkoBzqPMo4SVWL1gIHRS2Cbo3Tg7m8ikTT31lZs9JY/FUNCGJiAZFqFg
         AVPg==
X-Forwarded-Encrypted: i=1; AFNElJ9e/Cf6A0XKqO8fi9khWCvdRCywCCN4dvRNIb0iTug30eBP2hRllqSRlt5xfr0C+Ce+Yu73qPy+i2fPUzRcgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI+lQIGFyB/FuhBE8S6YWfI1eiBFSswsKwMChWowEkYNGfPC9V
	gv51lEBXNBTMhWMIFV605yiVzRB2k5Khro+mA9TRgrcrefyEx/WAKy4TUQoPXPxmYmCrwpTPYBG
	Cg6yPfA7oCv5ypRgYq+ehen9pcq8S/8g=
X-Gm-Gg: Acq92OF+khMahhHFXZtoB4/nolqn1k+MrXRv9gPSvzH5SRoVyvPDnrghMTlhYBSpEe7
	bF/CzF4w5EeIQB6IUR9lbdwcj19xcFYEWvZ2OShN2A2opaCcVsEV4QA17B+hqehXdXZQiYAQnPM
	Xy5eINk893hltX5Sd8Z5Yg5k/uIou7vhn0OIDSwOLQPEems1SUd3WpwNxS3kb8BWDaKb1+CmMwK
	QJQ2URNqjjQvnINCG2zksm5QFpT5mO2vKKqxyl+Kwq3TAjrjfoUKFDv9C9m1maoQ0VmiwZK7xtC
	eYlPIhsTUaxFE6+TcHt+frKFzN/GeloXmEOK+kcO62mEO/QiFxnjhzD0T8v/ZOjx8HIXtIn184h
	O4/el6ALcPcj/36+UySWFil8=
X-Received: by 2002:a05:7300:3b08:b0:2f3:3835:2010 with SMTP id
 5a478bee46e88-2f54c37e2eamr2604840eec.6.1778233561754; Fri, 08 May 2026
 02:46:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
 <1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mchehab+huawei@kernel.org>
 <DIASHBBEIHQW.3EQSDUML6G3SB@garyguo.net> <20260506084935.1cd4b794@foz.lan>
 <CANiq72kN=2RsE0Wm_489Sc-VKO40A0uYinCj1McT=YMu=cM4aQ@mail.gmail.com> <20260508091644.420bd440@foz.lan>
In-Reply-To: <20260508091644.420bd440@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 8 May 2026 11:45:48 +0200
X-Gm-Features: AVHnY4KKhh7Pt3-mdebtWjweKJ1bQNmrwJr8n8fkbKGyuacXpWR9XWERelNi_jc
Message-ID: <CANiq72=8nuD_OL5d8JF3zP-jRgnBORgHMNrGhQtxy6Jg8JVNRw@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] MAINTAINERS: use a URL for pin-init maintainer's
 profile entry
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 9:16=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Just my two cents, but all license files that are applies to the Kernel
> are already under LICENSES/ directory, and there is a document defining
> how SPDX and LICENSES should be used:
>
>         Documentation/process/license-rules.rst.

Yeah, we are aware, thank you; the files were annotated back then with
SPDX identifiers for that reason, and the links were intended to point
to the original files to show that they were indeed licensed that way.

> With regards to patch 11/11, I'll send a new version just changing
> the "P" tag without dropping the .md file.

Thanks!

Cheers,
Miguel
