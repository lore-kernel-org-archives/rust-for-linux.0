Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E241BA61
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023094; cv=pass; b=CIDxX8PTeqzQGIEx8BT6FD8IL0Q+IWofh11MWprJoztVmdnnhZwrqUxD1ouPazdJlCLsxiWNcMaDIYFq/f9ZE5kTeQOOEynBKTcwQzTXTeYzOIsMfxeTBHfRl8xDS3VqLOPhjt4e2gvWVoEV7SdJFNzSiQCzYpMwWNfmq1/XMAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023094; c=relaxed/simple;
	bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Benu3bXrdkelFqfBNvuTJTFbxJnco9hVAGB6+tH1e75pzHGSYiKGDA5BDwDxP/5uBqfNwP2M3Fa8HUKkNHKdxaXLahaHppaTWtRO9x8CHryYMzgtj34CmtkRpGilQ5thtjKal+wUR2LtGixy+JeRz0wbZy+Y/efQX08HUup06SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE86Z1l1; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE86Z1l1"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c28125492so26511eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Oct 2026 03:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791023089; cv=none;
        d=google.com; s=arc-20260327;
        b=FQUTDkgNKasiBBVI4tZxprFGzjSHE6uxigeREfRM8jbzQIpFxPef4SQCuzOdM1GGAC
         WQ6DapVfSiM6T/SaMTjDwE5L4fonmzpa0R35MMsbI0RrMmvAztefjjExD3sAbeTOBtsa
         68mgU45PsyH1fAWPCudo/W21YsRj1vG8DtwSTcAdHVng3loC22qVL85Y+tHMfGLTzLy4
         RHymA36p0XQqEd4GX9Z3gxX8bz35/YqDDrWu6jXKldKqh4H6ND2mWh5djIQvhDEr6lWW
         T1ZxUPal0NoMjJuU3Ngpido2YO1S0yhrbKH0E4+Yl+YhiHh445gceD6KZ8WBsvNJlcN8
         wFhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        fh=iEDV3HEHfE7LCur7Rmjt5KC29KaUKqcPQ7aSdvE7qJQ=;
        b=fLBCdDX0zs71ypePp0Ag5/Oo8MS9zdyd+xzU7JQegYopERAV/cLHtkaJkatYdre3/P
         ieTVUI2K1TQXUyumbmUHuTitbmc3FEmUK0NAAUShm+iIa9s3Vgh5dB2Y2B3lM58Ssqnc
         acvNZT8UAH6Z8OiHjCzavsYD+ckReHFH8zoAF+PHPVZkaXxMeZMTkCEtmItT31Da7b0q
         B/ViqUwok3yZAx17IHRP+/F6amOWnDnfu+mdOKeHJpQWVIK4pZxjir58SbBnqgQjKAbU
         sbWEd/6iriGdBN9nv/cjIte+vpv55L/GJKMYNJwnIeFOWn1rnwxoLRPlyMpEpi0+g89c
         jciQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023089; x=1791627889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        b=mE86Z1l1vdqQUIiYkieSEOBn9IBYP94La4QemnvpX3dnYKhpExdwYWce98bJS0Sy5l
         VVaxeAMtF4F65CqLlrjdrA3xPnedrITkfbsR1qSChG1vmRwhhAn0WJPKOPI6Sg5LIGs/
         DOwGLDB4x3igy7c9jLiyROyZL1kHC5oVQ5ZK1YdJaoFzwOjl16EGmPU6hCTLfGcNzL+S
         izjHeNgmCki7qRVMCj7lOntvx/OKpldpmvxHb6UOLbEFHmeNOVK7RLNt3WxKr+0r564p
         hP3Ll64Tmuu0w8MWdTl45zaOmwc1WkksQGlu45Nm7DWvu0fLZ0xnXhIhB0Gg74AfW18V
         ldMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023089; x=1791627889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        b=kCVkQC+CyJDKRcvnc4yKR552DVXXd1VYO0DXJGhU7W1DekVs+46cAix3gOMYLxl2nH
         i5lI2CW2nR1PAOQLfSpQr7Q0o2oZZcHxkFnPDHs/PcqynyOEtAWOf4tzg5flnHile68L
         XOoHWAOBTQMtdMZIVuvIJx4w697ASvbD+9zF2KMYmWvQdUnGEuRUqCl9fQ3ml44GsXAi
         EO3odCune1tFcjvK5gU9tHqDdcjjPBcn5C4gvC1pQBL5WKHxKF5EuNg2JnBFjd44S62C
         +9do98wQt0HpklWysUPOEru23F8k6RdbfJZxa9KdDtgiyYRn66MzRm8ia1Wmuo75Qspu
         9SzA==
X-Forwarded-Encrypted: i=1; AKwUvBx6JyEC2cjDG9Vx4NE3iDhMdzmEdBJLcR0HLW/TzTXuuxn1h6mVhSzUZHtWTxClWqu87WWaQIPJR7Q+rRgyqg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKrSH6ywET78pQ9BpLcCQTZTK7syZKHJ6HYEpuIZ9rroumgtzi0
	a3+KdKaIiNXGUh/Sd2KyBUd7uw3lTMLSKPZw+urAMoqPHvcGbKMKzsba54A8oeY6NvlXt5lgJiQ
	N8/5ipZ3Hvkcof75l3+GgdkV8u1tOb0U=
X-Gm-Gg: AYBFou390c2yw0hk2wbLtrfdaQGjDT2x4lNri3SVpPHZrJPiEl8kc8HuuHlzRCs9xUq
	22Z1AqCdFa30LR0arw5nILwPcGDu1V1lDTZ9Kw4YPo3aaswJp3hlOK7RClGBDGmyf5zO6GkLwYp
	u5KEFmlHWtpqsL9/XgCj0lznbQKM0dFyIsScWW/dR9V0D9vdcuuVG+sFYmZQML3+sXStwoB5IDC
	8jVFEzX+iVip8u+9aaFDyu8SRfrVyY5ADvg9L7b5Z7q53i92O4TBVYVYDeJDu100KKaoUdClK5e
	TTB/4Zc+AGEup2a+CiB8oqCfRXs0FlEvgZTYNS/aDNy/E3BsOT6Rqne4Ygou0YKG3pMBdtTV+6Q
	gx/V8bhFJ541vIQvKP0lSRdqSb/65+7MAXi1AwJnwfkt0HPyiZSFwBUDJkrzzNVTX1w2PswyioE
	olueaZx/l2DXGpADnWZHLC4TkLHrxXY2m64XBZynDe2LYLNQh+HJLpk+IwbH5Dlg==
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr10351658eec.1.1791023089391; Sat, 03 Oct 2026
 03:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003093827.77857-1-kmehltretter@gmail.com> <20261003093827.77857-3-kmehltretter@gmail.com>
In-Reply-To: <20261003093827.77857-3-kmehltretter@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Oct 2026 12:24:35 +0200
X-Gm-Features: AclHuK-MLIrX0vJiZQYXgDSKkkdNcg8lXBGZYj63LJj9lWkFu6OJmgqYprkqXmo
Message-ID: <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 11:38=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2

Great to see more arch support! Just to confirm, are there any
toolchain requirements to be aware of?

If yes, then we should add them to Kconfig, `scripts/min-tool-version.sh` e=
tc.

If not, then please test with the minimum versions too! :)

Thanks!

Cheers,
Miguel
