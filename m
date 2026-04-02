Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B8A3CB2C5
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775133247; cv=pass; b=n1wFTJMlXLv6WTt3h3h/U0elteoCAc8m5mfmsdwSJvfn27cIEdbt++OWhxbkE3igToeWxKfv8KEbg96vzP+4/ZtW3Vh8D4UuXfKmyw8sSuZey7QiHp6RiA8t6QvRpqZVxycUOBrCOXHBPj01wLsVBm4nQqOI9K8P+ubB/bxbTyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775133247; c=relaxed/simple;
	bh=AiMIWPP9qpfp57E0slTWmjFd84uAske7ne/VU7eIGiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orTJBSvBisEDcK1wpoXwQz3lmmWuKfe9zCLVZg3MBJ3OdNTWgzcM6WGnIqasrHIx1mVOoUx2iNO66riJvV9ee9nqf6maQ8wlgImLeN9b8Brs7fjHAH9N2W2bYkxTBuYLbz2ga/ZAl/QKWbXyPOV5SLfeGbP2QW3aEVStUgN/Gjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SIY+ZsOn; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SIY+ZsOn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486507134e4so10611705e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Apr 2026 05:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775133242; cv=none;
        d=google.com; s=arc-20240605;
        b=iVu940u8SgircW5LMUIHos+4QxFUVVz0Uyi7Q/aREDbq9NwI5eFm2cHenSfEW3hkgt
         YBSEbpgo4Gv5+kjXb+ljYUD3r3HxWN9MNyyoWVZ4ZnE17d1+eFiMunSh7aUR+omFaI4Y
         L3/f4i6lN/aDPku7WFxPFi0ZjcdOqdgYj9Umi1MkLdhZPP4jMNimRooE5C0sawXB6eaS
         MIAANHd9YcdJj2S15xY8Flx8rG9ux+I4YiytF7L/E6RMgnY24MRCW5RwXjSH/clg2AST
         c8gidhBQPdDbP/3AbdJ/ybsj0iU2ei8zcxTlfAC6rDGEDmJ8aYcTykoR8+ei20WDl0LN
         ppdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H1DwJvkkLXh8IqTYYYFVMuXwsutUIrPuQJIHMRxgnTw=;
        fh=RbSmnqsa5vkYjnVucOdUi7tMdcQMm9/DR9dT59JgPIM=;
        b=QGiACje5qQsPmBhg4tBmQ9wGvYpBh/aUS0frTWs1DjZ//coY553nSX1MdF1OcI2k5a
         n4RC7nsgEQgCShzD89DcAUTNvSv6z2uHGVkEAwX5CIJpJjANRbT5Lgxrl7lU5OAdKdey
         kfcg0/TqoCSRGOwsk2smfnBP5GzvMV7VdIw0sIe+yMhVwd+PfpjoOUsDairIyv+Stal5
         hqcl/LD2OgLQ1qyTBKVQarXm/18HLCGuujjd+BhYMFaexJSnb51hCTAeKC5hJnkY6Nhp
         qNiz3YoyCSCIWR/nHt94VTiujNKjiWHzmJhmUBHi7LaHeGng/JOm4OVdIEPksU1c/cnc
         hV4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775133242; x=1775738042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1DwJvkkLXh8IqTYYYFVMuXwsutUIrPuQJIHMRxgnTw=;
        b=SIY+ZsOnXa7HWPBizbwyCj9Aj+wWDVDfdUpt7GIYvKYfg256yA7L46UJa6Mwl8Plma
         0aB4WSuG7Q6Y066y05d+HDk4dozz+Td4opPXbdmhC7zzl55XkC2Ny3mgv1ZC3m5t5TGO
         6W0nnNssYgM0cwPlDjfzCQdDRAzhkXa3ttW5XrSDVdIWGjGL6+0qltAY20NfdaW2e/8N
         FHHQRz7F5ljfobUHWpyuIfM+X1vKgBUN7qCahVOQElgSyQScjL8cokUwddbp3EA+uU68
         aFWG4wOoR3L2OcW3FQtX4Y4V9iaJtx+Ve2AGCNSwmNG4scN+HIybbtttGIzEza2nsPR3
         I/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775133242; x=1775738042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H1DwJvkkLXh8IqTYYYFVMuXwsutUIrPuQJIHMRxgnTw=;
        b=AbMaRpxEYr4vhWgT1CzJaV9b16KCmA4H5/j8ulNlEfeYiMNvCIKc+c2eohtrmkV9Ws
         tIg6f05e7ZkYV3w9p5L5eZ2Wrmi1/TB8c3hrnAe4c56KG3q2Wjq/XUvAhm4Utehi9X/9
         kjS+XaFiXUw0Mig21K7Fln929jHmr/aWhvg4pWUNDbNBitfvUoNYgvIOhDJ59gub8F3D
         z9gzSA9Ylcv1NMS8zmp4BnUVMOYQ1tA3MHQcXAMQFoh/4x/4lc3RllmSbgOw4OCOtEMV
         D2eP4ib1AJGyLyNOm+EphCIL+Vbl36r/P5j7FLKy+0PJc8m4C/ptGskJ9t2vktdNRnnS
         FErQ==
X-Forwarded-Encrypted: i=1; AJvYcCWta7tmkH081QMEVnvpfDH5LtTBkQptNvhAJKUcXqrX0i3Q60NW991jatt0P+hT4wS0j6lnLRT2X+M+vuiGhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnyMZF0d6+4+q+0XWCxEVK185HNtok88AOZE0sPWHm6X3UvPY8
	OvkFdmaJqPMfjUdNNN7xP0wDxLGAafBWbxRRPsC70rOBNm1QZ4WPaCXYBiZiiSoNG+q9VNa+dUD
	w6ciUGhQ/XrVmqPtfY1c3CAuD/h9NxiGt6gsdnERl
X-Gm-Gg: AeBDieumZjrrHyxHnOENsUgMdRWfxqTACG2Y6hbmIioo1B8NX8hPoYYyfOLyL5LW5e6
	DV1flHsRrPHKCjFAprzE0qlW+314zPVCtnfqP6r2g09i8Gd5/1AnDw+keU8i2ppw2DwGlSaMwc0
	okfBj1GrdvalUFZOcZhvVUJWJZiFwlMBzOiWiUDftPNLAfqpvwsjtQvURYX+l7KT1202Joek3un
	6oi8+vi/20ikTD9fxS9x7WMsG2jAaeETj4KVuPH7SUaHgkLLLvxEsz6UCWFehH0jq3LPHHjQeG5
	D1WIl0/13mATjpRrSRohPWMOYIbE+Zp0UYWctQ==
X-Received: by 2002:a5d:5d0b:0:b0:43a:580:f60d with SMTP id
 ffacd0b85a97d-43d150d7683mr14401984f8f.35.1775133241855; Thu, 02 Apr 2026
 05:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
 <20260402-binder-crate-name-v4-1-ec3919b87909@google.com> <CA+tqQ4+gzV0vA+u-05b3gQfcFAdNchjZjC4Y+D1pBWhHGVuZqg@mail.gmail.com>
In-Reply-To: <CA+tqQ4+gzV0vA+u-05b3gQfcFAdNchjZjC4Y+D1pBWhHGVuZqg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 2 Apr 2026 14:33:49 +0200
X-Gm-Features: AQROBzDvlygfPuIEFIbAhZTYc87iMuBM9B3lPsJrznB3Xz7EgcczyN5M32UUE48
Message-ID: <CAH5fLggZd4+zZxVeDUjfTUDbBFwrt8ZzK4pQV7KGrMZezYSpJQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: support overriding crate_name
To: Jesung Yang <y.j3ms.n@gmail.com>
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

On Thu, Apr 2, 2026 at 2:23=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> wro=
te:
>
> On Thu, Apr 2, 2026 at 10:55=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> [...]
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index b4a55344688d..de6ebf14e2b8 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -12,6 +12,12 @@ import subprocess
> >  import sys
> >  from typing import Dict, Iterable, List, Literal, Optional, TypedDict
> >
> > +def invoke_rustc(args):
> > +    return subprocess.check_output(
> > +        [os.environ["RUSTC"]] + args,
> > +        stdin=3Dsubprocess.DEVNULL,
> > +    ).decode('utf-8').strip()
> > +
> >  def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
> >      crates_cfgs =3D {}
> >      for cfg in cfgs:
> > @@ -69,6 +75,9 @@ def generate_crates(
> >      crates: List[Crate] =3D []
> >      crates_cfgs =3D args_crates_cfgs(cfgs)
> >
> > +    def get_crate_name(path):
> > +        return invoke_rustc(["--print", "crate-name", path])
> > +
>
> Could you add type hints to `invoke_rustc` and `get_crate_name`? You can
> run the following command to verify if it's all good:
>
> mypy --strict scripts/generate_rust_analyzer.py --python-version 3.9

This seems to work.

def invoke_rustc(args: List[str]) -> str:
    return subprocess.check_output(
        [os.environ["RUSTC"]] + args,
        stdin=3Dsubprocess.DEVNULL,
    ).decode('utf-8').strip()

and

def get_crate_name(path: pathlib.Path) -> str:
    return invoke_rustc(["--print", "crate-name", str(path)])

Does that look ok to you? If so, perhaps Miguel can use these on apply?

> Once that's done, for the script part:
>
> Reviewed-by: Jesung Yang <y.jems.n@gmail.com>

Thanks!

Alice
