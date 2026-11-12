Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794520776;
	b=IIcM0fz/P7pqeXeNfBOXPLjD0FgElUOns8HZaUHZwCGqzAqlXzdFHrUXXPfoQX0+xEsC
	 kVmJzCA2xLs37rPXuHzp06qr87gv3bpI316+gerz7576vQXZAjAK8T7K2SQa1StsMwbg7
	 8mXd268QYGJTkCsZsuiaP5Zak4f0pmsgtSu98Fzk9dQooHtyAuyFUXXXitXvD2q+RPgXL
	 karErP0B4jygVcNWE7/ojqhESpRygzvDM8BcgOwSJ+e0y92UQnjD1lkry0B0XADM47iUT
	 Hz3bAZTWwWsgw26SDfvlcrXdY8zzK3DCP3tAcWgd6rnTtE2ohcbw/cffrdCzDSUgUQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fOBjKw/47ZpSYasxOW9rbBD6ghc/N8eUBSz5y2GcMbg=;
	b=gRTLNN1JlhXCI1znNJl4KMynOwSBsU1wdlz0XkMnkIeKQ9ZYhE9fzYPpCkFSuc14Q14F
	 8EhmO801E6aQ3jTH9yD5AsbQHWSzJVb8ceie5bHOnEyYaMjDrNxDenIOechGitxjcrLmv
	 XO13PHtUqv4bm7exiDEnrq+joO2rKTOnuJVgNhLzcJSSNgKKNG5iUdj42UQoqkUkLObby
	 yWPLUlln2np2q54x4XWG/VvlKtxpDDUAIE+TIr35G/zMNp/StLZ6qSBPjWro7OH3TIkaH
	 gp8IVJQa67ET74Ats8dcaHdK1oyDTdcf6TCps9poga7IO8V4vLM7ss7VOHKD3IEXTEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCTjNrNO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432E1606A323
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 21:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 432E1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCTjNrNO
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37605faade6so48833eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 13:59:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794520775; cv=none;
        d=google.com; s=arc-20260327;
        b=oMmAnJCribghcN5/pnF9EfKU84BO/EbT9tsi6Sh0/aCNqGOcTnhaaNJdqtj4yeDQKL
         jJ2a620qh9QFL9RTo48Mv/474DE0Dp9UbKfkRQMdyVqRj7Sa1Dwz8A32p7nLCjYC4yfv
         Zkp69z5FmvH1tZ0BRXhjDqHbxE4EShn0qwPKqRD5xkC7SgWtq6guEfrB9BMGX7Tg6qAL
         m/tGuy13i9+jNGwtx10jJdItQlN/454Kg2Tdu1SH+mDvyWie3xOg2ztJ/sBhcXpiYWgr
         exKeaY9cIQcyOkWPNyAaNivoDXMwF2uJmTfeiUWif0FuCQxugnoie68qYyAoVgmofHlm
         Nb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fOBjKw/47ZpSYasxOW9rbBD6ghc/N8eUBSz5y2GcMbg=;
        fh=exacKKeP60IsfdGu19M2fM9oFKOFe4U1TnfQCrXVm2Q=;
        b=Y/gg2av1JbAYofmlawk7Z7mpQIghUEr8bcREE8vtocEqNZh36nw/gXGnUQCVRVokUn
         DbW7Ea6UvxGLGUpWNshsDVleLSE8GWJdQwPrJuMRhz1Aa6rQID0wPaRl562eFpcQ2Y2b
         D6LKLDcqFjy19Y1Bce/IzoQixDqMd0nvDd154zijGGj9Wbh/44tlOsctsJil3TVoYPwT
         lZqzJ0sKkS34a+Ar5dqqeNnRwaZbneEQmj6SyqGEc4e4u9mSmaa21MfbFBdTIoMgPZRt
         rhEOvFJWqMLtBJugdkXAKylmzr2N2kSA3YOrac97SPfFQdQadbrtltVl/9G7ToxMMJcp
         3OIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794520775; x=1795125575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fOBjKw/47ZpSYasxOW9rbBD6ghc/N8eUBSz5y2GcMbg=;
        b=VCTjNrNOIpHe59YOSqbnDT4z+nO8aCbXYM6QLyB70nWSt3Raf8wDrU+uskkLZ2S95t
         ZtsdE4VWpAQ7O9G+uX1ELMTU1wrtC4VbTUbzX2e8XTEuBfeA9gArNRlp0XReTMHxycP8
         jwb4bi93RQ2GggUWE1kOQviADAV9GmmdrjnGzbi09G2whPsvCCO653LhDc4i4tT/xxNu
         mPc8tXiGTHOUgMRzddCm3a+qSm6KMS8kr4lFiNiWNUoCh6tqmrJbrKeh1N7NOVvI3bMB
         ZFV1rrTpwvEt6cqv6r1fpRgm6j8PWBSu03OUz3cLFWM2GX2z6R+HwOa2F5EVP8jhDXvm
         Qjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520775; x=1795125575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOBjKw/47ZpSYasxOW9rbBD6ghc/N8eUBSz5y2GcMbg=;
        b=SQqzy8dqdzAi6o+GwVX3WbrFWmSJzq0Apxs6AvUPRQT72zeADIzHjNxA69JiuTOSJ+
         GXwMDcJBp7oONHom7C3N93jFkJOmXE9IY5TnSV5knY1Py/k6am4T9VOYPRdSLJweD9Cz
         j6arbOOlckqasw8EPXFe/cz0ltSVJjBDyfnsmJOzgLCOA9bThvZvdqGjoSTNYeXK+aSg
         xVlLfy+fzCGfuhTmwcb+sCE8CsZm6vDe7IUmpQFyjL4JFAKq1IXG01lpZuE09o6ui1Vj
         76fQl4Sc0zJVQDDNTQK0654Y5Cp3iri40zv+VgrmtPE+Ju0aiI7LWbKQbXbvT5XJM9RQ
         Pjlw==
X-Forwarded-Encrypted: i=1; AL+hErG0hhV6WbN9nJ7vBsSqKuMH7IsJyakZKpf8JJrCeGalx2+DO8QO5XbFd5RJBfu8hQq1l+dkIK8UFQiFYrqbDw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+M484G0vzamOgc3mU5ECqjL0eZsy7kjCYoKyLPiEzDiZ936+rU
	0gt1xKQHEq3R8bR8VO4L+WcdVE/1znPdRvac15SZrRcEmRdhP8pqmvYjZgnBYdhhLlHws/lUnyM
	LCun2k5cGOebk9KTTmC6JKlH0NLlh370=
X-Gm-Gg: AYBFou3Z2k1SYkusWJmr2mTfIgMpqtHgaDwC+zZZaUKfstVxLmR57lAN0kLdOhGpKhC
	0IhIBEwCo0tXMae929gWkPf0HthaMB6KjprhesHdxxPDXx/clY5YXqaHy2sFaebo25KJaO3WfK3
	PChff1YQrkitatShR5xy2LdehrdT/I2O8dk8TnOEengRHlcxfZVYhByJWvPXTJasa+wfLeRJjEU
	Df3yRsXAMxWEHcTdpH2Lk5dk2yeBYULfrluIOrzy/atw0KpQHP+1tjPrsiPuEWHSQvhI9HkB0+g
	stBn0CGcy30sz+/wBwxIbWHbxzbAPyNP3NHL0QRaKPPMjjmnMRLDzLXtPF5qmdzrebzSCLgh4TK
	kI/7MOieT2aS1VeRhwsrA4vOdG85kG5+aSEnPkGRhalKF//2n3Q1vQ1qT2pC9QTiW+QhiiLPcct
	uYu2qC1yOXMvRP+4NJkVrg3V8RS2eLVq/In0OESdg8h3IkwAR0VMWZFRj5rqxDTN/u+CdJulBko
	xkWKMv4EmmBSkYB3ewmVIDjSEDxyFhWxlBiRkzEOm6FIFezfkEKbfTueBUkBUBcWrmVcEPmKQ4=
X-Received: by 2002:a05:693c:8204:b0:372:c0ee:875b with SMTP id
 5a478bee46e88-3796057b529mr715902eec.0.1794520775246; Thu, 12 Nov 2026
 13:59:35 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avXdJyqNNqopuH2_@ashevche-desk.local>
In-Reply-To: <avXdJyqNNqopuH2_@ashevche-desk.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Nov 2026 22:59:21 +0100
X-Gm-Features: AclHuK8HEc77klTAoc_1mHlFie78HYNB9k1hvUrY_KkXsL5VCHPiiiSVNXJnFLM
Message-ID: <CANiq72nw+g=RTvR-zZh29D0=MOwNYboNSeKkNr_Z4v74Q4hn1w@mail.gmail.com>
Subject: Re: rant on Rust in kernel
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, ". Boqun Feng" <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:37=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> First of all, it broke the old and nice kernel feature to build a subset =
with
> allmodconfig or allyesconfig. For instance,

> error[E0609]: no field `disconnect` on type `usb_driver`
>   --> .../rust/kernel/usb.rs:57:27

This doesn't sound related to building a subset, but rather a known
toolchain bug -- our `rustavailable` script checks for that. Are you
seeing this warning in the log when you build?

  ***
  *** Rust bindings generator 'bindgen' < 0.72.1 together with libclang >=
=3D 22
  *** may not work due to a bug
(https://github.com/rust-lang/rust-bindgen/pull/3278).
  ***   Your bindgen version:  0.71.1
  ***   Your libclang version: 22.1.8
  ***
  ***
  *** Please see Documentation/rust/quick-start.rst for details
  *** on how to set up the Rust support.
  ***

In particular, you mention Debian unstable packages: I cannot
reproduce the issue in pure Debian unstable, nor with `LLVM=3D-22`,
unless I also pick `bindgen` from Debian stable (rather than Debian
unstable) which is older (and then I get the warning above).

Can you confirm which toolchains are you using exactly? Ideally
checking the `CONFIG_*` values in your `.config`, e.g.
`CONFIG_BINDGEN_VERSION_TEXT`.

> Second one, is that now with the above feature the build is finished like
> a minute (sic!) later than it was before on a good server with 24 modern
> CPU cores. It started happening somewhat a release ago.

This is a bit vague, and there were some changes to the build system
recently, but I agree with Nathan: it may simply be that you got
`CONFIG_RUST` enabled.

It could still be something else, of course -- if what Nathan suggests
doesn't work, then could you please compare the kernel config file
between the "good" and the "bad" points in time you have, and/or the
build log?

If that still doesn't explain it, then could you please do a quick
bisect if it is reproducible on your side?

Cheers,
Miguel
