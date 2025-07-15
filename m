Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A334D2D0C7A
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569063; cv=none; b=jmB002J9KopRvHU6psL41gU6q94exU+CbV41UiI+9KhIcPuhnTqR83UHVSo3Kh4vXLUoJl51FKxHDutYlUByvEOw3pcNaYvOHUzh/B4Io+KXVSdJg5qmwt+Y0NKaSXcxHSe0nqNMoMLykzP5PwjZ92FfETIpzXhnHRBJrp01xsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569063; c=relaxed/simple;
	bh=WksxcT0vew5gQIK21EEwb9zJ+2MlPcoIhesf2cYfLvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCw9gtQlXbQZMjS6lhCAsBWke6ZOhihOjAw+hsFpIzAyXXLIAfmvWXqpFiE1oACM20w6NBpyAexmpYFjtPOEp9tM34BGADgCoQQh1eU9B4iLqomVsjg82ldUigrOZQgGacQBtm7JFgpNTBCj8wsSw6iIA5ppTrTaQM85jkcnUN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WpnWAQhX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WpnWAQhX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4f379662cso3912994f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 01:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752569060; x=1753173860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WksxcT0vew5gQIK21EEwb9zJ+2MlPcoIhesf2cYfLvI=;
        b=WpnWAQhX4WczwZ6JBHRq5/q7LDmSLPeckR+fI49nX3zUNwS/9W/r4YCITNj1uRoTlL
         IW0iP/kmv3yo6azGojFJRSOMZZ4d9VCtDPzLpuERk9Rogg9mdLSpAZykm0YJ5IKf7EOi
         WjERKP5BNHP6ijfgozXgqxJu15CTV6K8TbXjTFix8A/1C7rCbd1Cjvx53JPgs1j9dhKI
         tP2MixiNiQl/AR1amWaP8HhULESz2tMKxB+sw/kgQwmafJP8CzUYfBqz0rfPm1w613P9
         uxGfY15wE+C2JPQieG0QA8B2Yra3Mdhc0nkRWPyod5MFX5Fb49G2lYWAEvnf9n2qiTmR
         SBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752569060; x=1753173860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WksxcT0vew5gQIK21EEwb9zJ+2MlPcoIhesf2cYfLvI=;
        b=pb86CEQC/y0zaX9fuD/+1C1bdxNfJcpcvbVwwdiU1HwJOblbe9+jAOnGMeFBNGoq6w
         CVJvJIXSERopelcCFoCVvP63V42zyoSIb9yarE2PV4BedC1r4LNOSawtMjnUJFlvFZq2
         SYyeXtObeXXo05wDkowTVk3smlzebkTINpeSHvv2B83rj3pLJwRrLwsLB9suqdr3KuoS
         oyZADoY6NLEGJemOt4JJnyfmx8dRLGzPq+zFtbalY4hmJWbrs9nbb/wiFTB2X5xhY+TO
         iXREy9z2Kz6fZ/+OLs6BnAaurlkGii2ci/NDQCMtIlLfHIdLv+Hv/0RFXACOCCq42849
         ZsMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+hFjDGekqBveUHXt/A9dNbK4/YQUBuLlfyFUJAqZNOVyM0VXbu6xzD9MX+nkbNMosUT77EvOOtvWOVB9r2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNwUYXufx3u5FkTAcaclTfxJBXISYnDE1/JkbaoedgQR1ucqYH
	Trj8GEpn3N6ZCjXhVZ8LX/rWk01iR1LBiaP6yEB/6LW7ZgZdNL8X0QTE9lv1UuVwvbBzfbuRDd/
	3JbQa7dJUWrH74Q88y4tIH/01WQvwLSEY4kXYk7IF
X-Gm-Gg: ASbGncvmSDCxfgApS0kuEJ5etXHaoACOoAWbozH5mwelahQ6JG9iKj6GO4H/PWxNzdU
	ncLK0SBJqPc5OcHpp4cDol1YVh5oH60LTKXbGh/JQ0S5y4AzN8RPHAwEReCqXg1es6P5iUL/HBz
	LVP/2BrNVBQVOeGb1An1C35qIl8PbRJk4Ww9pOp15rhJJxy/cYPmJc41LyMaLpAC/S64OiDRPLC
	Ghv5uvHAVTquqzMx28=
X-Google-Smtp-Source: AGHT+IHzMFyvUx98+ytThz9kGyW5N9noGp3DlfBh9jRa1JcqVzpneWTBVnQXWg7nciIv953hMjQK9Rnq07N/ncoJOsM=
X-Received: by 2002:a5d:5f88:0:b0:3b5:e077:af24 with SMTP id
 ffacd0b85a97d-3b5f2dc21famr13129817f8f.14.1752569059746; Tue, 15 Jul 2025
 01:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714113712.22158-1-dakr@kernel.org> <aHYCOFZZYbgP39nR@google.com>
 <DBCHFBDWRHZ1.96R3AMCDUX9S@kernel.org>
In-Reply-To: <DBCHFBDWRHZ1.96R3AMCDUX9S@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 15 Jul 2025 10:44:07 +0200
X-Gm-Features: Ac12FXwoj1Dq7KKw4Qu02ROnGWXG9HPYTeSOfU04fr5zzoADs9AgIW4IUuzD4Po
Message-ID: <CAH5fLgjG9YpyNQMO9mJhCvS1r9MNKt9Upnr8B-LPSkwXr1A41g@mail.gmail.com>
Subject: Re: [PATCH] rust: devres: initialize Devres::inner::data last
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, m.wilczynski@samsung.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 10:22=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Tue Jul 15, 2025 at 9:24 AM CEST, Alice Ryhl wrote:
> > On Mon, Jul 14, 2025 at 01:32:35PM +0200, Danilo Krummrich wrote:
> >> Users may want to access the Devres object from callbacks registered
> >> through the initialization of Devres::inner::data.
> >>
> >> For those accesses to be valid, Devres::inner::data must be initialize=
d
> >> last [1].
> >>
> >> Credit to Boqun for spotting this [2].
> >>
> >> Link: https://lore.kernel.org/lkml/DBBPHO26CPBS.2OVI1OERCB2J5@kernel.o=
rg/ [1]
> >> Link: https://lore.kernel.org/lkml/aHSmxWeIy3L-AKIV@Mac.home/ [2]
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >> ---
> >> base-commit: 3964d07dd821efe9680e90c51c86661a98e60a0f
> >
> > I couldn't find this commit. Where does this apply?
>
> The commit is in driver-core-next.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
