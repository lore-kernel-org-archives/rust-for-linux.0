Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1277341044
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Feb 2026 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770477760; cv=pass; b=bwKnwONPpMlrWkB0p3/EDjrvxVyfRB8UWMJ3PVc8g69H9ryKYYvN9t/WUZtuL7Mbx8V86qlDvmMU+X2hrr97zrcAoQgaGbEHXvSD7nwIw5rBLnk99Ht5uNYc2aLiWjlF9AJ/W6zoC4crRKXT5TP3keBRo2WPpkIfeVKgkpGb3r8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770477760; c=relaxed/simple;
	bh=WDZJqIG3WSFtF9/bJ5L1DSjSTILWykbHAEJcNCsu2+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiXYldOErmd6azB0cjgimdOVrk7lVGM96xmTN1TaiByLOyDBsRnNFjyHlyALzk7j1Z/mtQ7ymV05N1YSKdnHGpTeDvLyW7VsW2LHrTe+oHSKSWpx1ZfC4tS+t2ncp/NwaHcgcPX36tcLDtrhLyUwSo+rrfGeTij34jeBZmFCpRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvmOTq18; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvmOTq18"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-124b07e5fe4so212951c88.3
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 07:22:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770477759; cv=none;
        d=google.com; s=arc-20240605;
        b=Frtp5SeXJknETSzBMkEXfplRqVkugFkomT7sKcallmAlBisN/GAgU0nvW2ZUX37+e4
         i1qLgPg8fmjxVIhkKjmre1hzhdTi+Jk2NF4R5Y+cUcQ7ssFsdntPBzlOCti36RpZjvES
         T8hDJoQnYpq2SeRi7tSeEd3lPoZpNqLnUIwWsUcB2PhFPPqGAO8uorfe31NamG1SMM7D
         CRIu3hX/LRH86he038f8jIPtPkDVDuPtcKFaXsABdWkusAiH/69/AYLgXX5uRN+zKYjd
         IyPoREPNNRT9CVYHulgu4fxnKPdag1AH+PgId5/gm2XvxVrd727CgOIub0/2qaE1yKBk
         EYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=clWv6MMAerLjp6KJnFnGBnvJGSBom/0zmYqwMTULdjU=;
        fh=JvwWZ65VZ6C6zsEcS0jDyVpPlbNbl0ACAcH8nH2WiAs=;
        b=Ng55svqXx13bTkMLuBRCFL/11KTS7UyMklT5FzKu/X/nkxnBMYxQsQAD1uKxIxncsF
         8sEPvFyOazQ67s32TM/6e/ycmACSFLjTGR1uc//Iq767czpFVlwRdyulxmuc8q7mEPmb
         +ORyUQ7/LLfTmRgJnp9DsF0VT8iU9syXa5M6ioy/pA67Mgjv5UHueI8Z6bh17FPqAp5b
         U/5H97+5BD8F+nEUAMdkZ4ovmFpbON4NVbSkVX5a+HX2by65qLXOa6ZCFQbb73QDvtTI
         wCZlDV9SYeBuIevHTvnhDKC6Tn98BIm3YjY54vo0/H11z61HYSupYAxEudHceydG44o5
         bfSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770477759; x=1771082559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clWv6MMAerLjp6KJnFnGBnvJGSBom/0zmYqwMTULdjU=;
        b=cvmOTq18h95t0oaXfV6DtRcnpk58Rbh7ApjoLPDxjbQtql9hVMRE5TIpQKZ7a7IDAK
         GpBKr4Zr3myotadw3ci8rC1ZTUZuINn6uYXKLFqZ28LIedORMDzcfaa2+YiNSLhcUzkP
         yHMx1h5hMpIMqzzeC+5gX1AK98Jhh1OBpHP1C+1xGMWPlCAVBM3cE+IKbf6DPiLX4ZOB
         vEnDQWIPYR/KjnIvqKM8fVkHFhVGY180TWuaI0YDkjfOnqgyAypptFoJ1qW3HLUbAuy9
         pgpuMC5//lQV7XgMB6m9ZCUbuhEidlkE6ECY1JZNbYvCRnxebuRUYaT38VWvrSzOSVWO
         R32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770477759; x=1771082559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=clWv6MMAerLjp6KJnFnGBnvJGSBom/0zmYqwMTULdjU=;
        b=I44+b1LRMicoHl6jCAEnHNu9bXp6E2Gaohrw5UwXZXsvzeri5wlZ4M53tK1yULB+GW
         2yhN0QBbkcQKah5Cb+q02/eeFBG45uk0sZO//Q9EuTG2kTWXC5ySN0fplhE+0E27o3KE
         z6pB3x60d6WXw3oYGQoTkU2o4dguMesVG0+6nrX48yvj3IWeP02vB3RMgsfEgjvV+FHG
         XbcftPpFyYHZK402RnKMuxW8vogpPIR6V9G232WBjNxDUWX9bT41tVXaaPylwnXwa2iR
         e2PkF4L8FyyXuhikRv9fA53VUa2s/QYj4rz0wDydoyXP6//Fys8TRy0EhaMBNwrPKUGJ
         eRQA==
X-Forwarded-Encrypted: i=1; AJvYcCW4PVJBhwWaTVN3oyceveYpO86RjF12Fw/r80sIYfteiR5g2wVtKzb7NUL8t6IfG04linfbofFp5v7v5SXr9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvchvIXH4CBDdQAvB7gKq+cYorA5jtk9swWv3ilHAM9AqjCARV
	TEtm5YAixDki3IzrtMZef8KJzeSFF94cIbPAdVyNTPIYb/ofWeKhG6PqMVIeqz8Q7t0V9nlctFt
	3KgDpls3MFujzt7OmNrK3eWk9pq7oeKg=
X-Gm-Gg: AZuq6aJDYOIHXasS39HM0cdf+AEydoGezD5dryuna2BkEPynQ3mLSIRIAB0l2aHs0DB
	RXLtXTXm0+z7wGZx5zc5mpDf4piFa4Qarpa8/DKlHYZrhpcou0/IXZaObyrsUA3rdxEXoBG6Uyb
	I1kaeOnGIr0/qrDrWzIkUyx8vr7JLPL/3F4Vr+04z1ALgEKDmAWUJAIS1XiYaXJUfc+mOmqocaq
	P2Pio3Gur2Sr610ZxJJCnTfU9L1RyU8P70ePMsrmZe0OcxixVkG0+Xi00pJ3426yg8GvgLxRngX
	k0lY9W5AOUlA802kVimjf25maAjcCRdh99DeQBPrGSdSGcvfO90D26P76M4QD/Q7L8+NDPHRgdr
	GtC9KyrH87DWtdVWceptt6Vw3GVcC1Ua9/fY=
X-Received: by 2002:a05:7301:2b87:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2b856c577d4mr1666254eec.7.1770477758946; Sat, 07 Feb 2026
 07:22:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207144356.3063613-1-gary@kernel.org>
In-Reply-To: <20260207144356.3063613-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Feb 2026 16:22:25 +0100
X-Gm-Features: AZwV_Qh-JsCh-9gqmkPwE8cNcW2MhjKv6BPVBI2JdNpRu_vDXQpIgbQ4c7F3rAI
Message-ID: <CANiq72mhhSKV=CecnZnqhKrt9tpGdMu1hePJtGDgRiD4JG902A@mail.gmail.com>
Subject: Re: [PATCH] rust: build: remap path to avoid absolute path
To: Gary Guo <gary@garyguo.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, Asahi Lina <lina+kernel@asahilina.net>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 7, 2026 at 3:44=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> So, fix this by remap all absolute paths to srctree to relative path
> instead.

In case it matters to Kbuild, we had a relatively recent revert
related to this flag:

  dbdffaf50ff9 ("kbuild, rust: use -fremap-path-prefix to make paths relati=
ve")
  8cf5b3f83614 ("Revert "kbuild, rust: use -fremap-path-prefix to make
paths relative"")

  https://lore.kernel.org/rust-for-linux/20250511-kbuild-revert-file-prefix=
-map-v1-0-9ba640c8411e@weissschuh.net/

From what I see in the thread (but I didn't get a confirmation back
then), the issue was some developers relying on invoking the debugger
in a different working directory than the `srctree`.

Thanks Gary!

Cheers,
Miguel
