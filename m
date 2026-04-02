Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D95D3E0241
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 12:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134611; cv=pass; b=KAZ5tulQNxTWkCNV8A2q6wwE7Vs1D9HU3MigknP/98fGHSmhVv75heGNLK2fEObMgrbx19P46RYWnXyiRa6rbShHT2v0vkHqRjiCLKWYhFrfG7Um7NANPyhPjVpqAxtjGRYQcnKS8MLI+llAxUJvIq50tdhIaokCre7b02YLSY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134611; c=relaxed/simple;
	bh=Jg6nIajFfRH9vSJFLJsRzwFQUpKa295zG/zt5GLlZXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtmMSPJiBvLAp8Gww7u6mLGhKGIhBDEuvRIibyMtCF47dXtd/tJgm5IYHNzAecMWl20pCWTv2vdSaTFu+l7Ep2hfIDBqIxZzaL8pFOTMDHbVT1U1qvJe/lHclURq6pWgDTsO0utr9Rn6NObr67q87UgXxgL0zU16r9XZLNW8LRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/G00nu5; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/G00nu5"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d4be94eeacso792004a34.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Apr 2026 05:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775134604; cv=none;
        d=google.com; s=arc-20240605;
        b=R13FByFmbpTyB9IVyiRv1q8PqEscR7klh6iR5VXW8Qrx5ARpa0NOsimUqqpqcj1Bad
         3C7zejdGhxFJQR2aZH+zMcLlXlbLChFRWdO2PHkESeT1VkjO961n1h9qWd0Ic61Wx7Uc
         nP4Dv8kcxEifWDlC4wb9Z0aD3Of/7G6nzxzpkrfIkXh65PNUTrXxHzAlwlyV+alR0EF4
         IHti3k9j1ttVNz7och2XNTGRTFpYMp9qdis2egA86vTTWHIlJ+HACP60EtVRaJoPbtzP
         njTF0CClIOL0rqX7p7ECAa1IDu/tOBVJ/bPFQ+wXq4diQG+pziy1+8k9XloizNbd8YeI
         Dkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/OydiP/AOYU5IADePHXxe+ZlFCsiBEsu0HT8Da/mHMA=;
        fh=DOsBH+e4aoAT6lwzM4y2VubNO6A68ra8SD0NOA+N7qM=;
        b=FGliVoLjPuoTE++IyQggHjxsjlr+dIWtXtytyV562Yun6/GTNRN9Wcfh29NMsgVWzs
         gMnm3ogYnaXYXyX41RvVKK+dxJwKXnXjPrE8p5BTpKpdeqDGGfg/JZtZfZ9vvMawPO8Q
         GLd98mdXkY9gOA5L7sQKGmH1bXgNKPSbufiI92tbhsTDnHqKdNykMwYMANuwdtC2gTQb
         vaFVTAdYl+dcWJ7918Lt224hjRmS590jLf+Q3qEx0pIIXPREFF7+EkxFhO3zXoMjctuj
         fVXLOollttjM0FEdvOhCNk2TezgCzMUXePsh4LlcA1+ON9+jOoKUMDqjTcsbn2beNTug
         SM0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775134604; x=1775739404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OydiP/AOYU5IADePHXxe+ZlFCsiBEsu0HT8Da/mHMA=;
        b=U/G00nu5QEVCRxbM5ooBGWGROXS6k69z9kD6pght6f0Zxa+i+xgpdMH5BZBdCGCH36
         sj12HmsTHmUHehFu3M7XvEWSd9lXen8cSR2uTqE4hYmAdCfczZ/9KCfT8MsFePhdYcgB
         DDMz+lnePGKN+/esMiU6Op3AWR3Of3xuo55UkxEsKgERX+SOvmtU1ooy7ssoudLYClkd
         rlR7tLh4UThFla7PrqBhr4hOGNSSBRmb6PSMjZv8y0iuC2/mATjpBHz0FzJ+5C+4NEA+
         STKvHtRRUjcuDJ8LuM+KXeXaLlA1ycvs/YuiOo+FPpkB8CWlITi/jYndb+/Xz3GQ5bAo
         6zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134604; x=1775739404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/OydiP/AOYU5IADePHXxe+ZlFCsiBEsu0HT8Da/mHMA=;
        b=ptvi7gC6FOdqrBR89qMsJddZzeK9fV9n9uNh3rELSF2MBrU0eyUhzz+Nh5CdRkTte+
         SsoVNgAju5LTd/K6lZ1Gcb2HIQNWZEGxSph7xAzYvQqYQCx+U2d7oWninqUtxfKcXbdf
         03wIP5q+jm5mqhoQf2WTD1Q/rB8zbLFH43M5+JgqXqnuLwf/MlMQ9WGAL+ZBIb+31XUf
         9AWJv/u6dXye3uWCqZVOzsqlDdJ5yx3wqwSQZHmxr78/XQRx7+YC0xM3Mgmxr98s6BNA
         Hzsw1juvoynRk4TIJnE+5QCfyeexkaQ1+k9EpJaDpA1zJ7NvApPMzDHd4BD8UjOskiFf
         HKUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR69k41iUvQazRwPepy2kX6jH8NERDbTlFHInR23MMIiCeEuwjFxuKLzwMwtGApkg4GXzurhOeJHrb21fKvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHyZ2EO3TKK3m6OzUIEqogR+rnsCRrWCAnLvJ6c95JwpLu+AZJ
	4eXIsFXwheJ+l8TaTB7zNCI9zhK0VOGTVXKsEK5gLl5FyngpjaPcVB0x0ljjuBVnbYjfZNe+SdY
	jp16Aw9XT+K9OtDDu6ucSK0ab0Dp2GG8=
X-Gm-Gg: ATEYQzxCQR24unTuHrHQjVMYqQCgcZlcSeuZDbPbe0o2ra2yA3WtgEm+LI0fJJNVdqp
	8SGOWQM8jA/F+AIxt6NDQGLLp5MQxQl4TGlJfpLmZK6MsNBbCPTl8V/vs2+NQpgq8eu2DqesQsT
	DWt90aq6bCOU1ig2grweo+sfE3B+jlmY/MQn/FqJlwRwCXdcBaLwW9n5lDJ31IWHcijsD54nfhe
	9MGrlyKVpOcEvqGcOzKMkjNSCe9WDmeHpXSIkcgfjJM6VuU+DYZP2aSzRIeJJj+1sfASOARmrAa
	BNp+w+w=
X-Received: by 2002:a05:6820:6aca:b0:67e:d8c:9f88 with SMTP id
 006d021491bc7-67fabbd3504mr3869605eaf.14.1775134603941; Thu, 02 Apr 2026
 05:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
 <20260402-binder-crate-name-v4-1-ec3919b87909@google.com> <CA+tqQ4+gzV0vA+u-05b3gQfcFAdNchjZjC4Y+D1pBWhHGVuZqg@mail.gmail.com>
 <CAH5fLggZd4+zZxVeDUjfTUDbBFwrt8ZzK4pQV7KGrMZezYSpJQ@mail.gmail.com>
In-Reply-To: <CAH5fLggZd4+zZxVeDUjfTUDbBFwrt8ZzK4pQV7KGrMZezYSpJQ@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Thu, 2 Apr 2026 12:56:32 +0000
X-Gm-Features: AQROBzAPTlf7kltJfBPgGEkGGYBpTdo7e8jWVC60MWTQKD6NskR_jWXC9nL3suY
Message-ID: <CA+tqQ4JAqVOhrXXr8+ed17dRcv0A+zPmesm4F2KmsLn=-1rM_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: support overriding crate_name
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 12:34=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> On Thu, Apr 2, 2026 at 2:23=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
> > On Thu, Apr 2, 2026 at 10:55=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > [...]
> > > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rus=
t_analyzer.py
> > > index b4a55344688d..de6ebf14e2b8 100755
> > > --- a/scripts/generate_rust_analyzer.py
> > > +++ b/scripts/generate_rust_analyzer.py
> > > @@ -12,6 +12,12 @@ import subprocess
> > >  import sys
> > >  from typing import Dict, Iterable, List, Literal, Optional, TypedDic=
t
> > >
> > > +def invoke_rustc(args):
> > > +    return subprocess.check_output(
> > > +        [os.environ["RUSTC"]] + args,
> > > +        stdin=3Dsubprocess.DEVNULL,
> > > +    ).decode('utf-8').strip()
> > > +
> > >  def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
> > >      crates_cfgs =3D {}
> > >      for cfg in cfgs:
> > > @@ -69,6 +75,9 @@ def generate_crates(
> > >      crates: List[Crate] =3D []
> > >      crates_cfgs =3D args_crates_cfgs(cfgs)
> > >
> > > +    def get_crate_name(path):
> > > +        return invoke_rustc(["--print", "crate-name", path])
> > > +
> >
> > Could you add type hints to `invoke_rustc` and `get_crate_name`? You ca=
n
> > run the following command to verify if it's all good:
> >
> > mypy --strict scripts/generate_rust_analyzer.py --python-version 3.9
>
> This seems to work.
>
> def invoke_rustc(args: List[str]) -> str:
>     return subprocess.check_output(
>         [os.environ["RUSTC"]] + args,
>         stdin=3Dsubprocess.DEVNULL,
>     ).decode('utf-8').strip()
>
> and
>
> def get_crate_name(path: pathlib.Path) -> str:
>     return invoke_rustc(["--print", "crate-name", str(path)])
>
> Does that look ok to you? If so, perhaps Miguel can use these on apply?

Looks good to me!

> > Once that's done, for the script part:
> >
> > Reviewed-by: Jesung Yang <y.jems.n@gmail.com>
>
> Thanks!

You're welcome :)

Best regards,
Jesung
