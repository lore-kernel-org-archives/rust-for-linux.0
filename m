Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB7B37C0F6
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Jul 2026 10:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784455343; cv=pass; b=rlTDKbwkMqgjwjeOZtHCUKEqp1hFhwfHd+HNnuvdLKrlkYzJk+A+RoytWUsoHHetnPD0OMu9rOmWT9FsRELXwMDPrfSC+zvnm0uPbNK/e7SYSrihoonXoyN4Yix9XFV6mHL7g0bThy/zml+3WxqCqKOkBMfR1nc3prWVIi9YuiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784455343; c=relaxed/simple;
	bh=qRSbfD9djHMxioMbfjbjGNyCIP+sb1ZAZgfGDMmTHM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtXf6U+CdQAJFJMRxi+SSDP4aLLNRCQdII0uuAh6GB+IpkSDTr07aTKIY66a900iMIfnKtXv0N3mj4ttb6QkAo52vA3pFVMSAMCF+OX2XYs/H6B7vX7B1ZlcgdBld45bpcs7EcBsSPBgT7cS986aH8brXJ7mNsroLB8jUqriT40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDGNGd/D; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDGNGd/D"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38cfcb507a3so1004759a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Jul 2026 03:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784455342; cv=none;
        d=google.com; s=arc-20260327;
        b=DHa2z6DPqmEa6BGsqRmNLpwj8qkGVpZfMtuRAdDtKbbUeHoX6dqlw7+gPoENidIJNT
         dyZtZf1ZoLUT1I/kLg0jdiU1HyE6zMiw9m8DpKqRScH56WIxgoYQWeBVsr0Z7lVLSH0u
         YTzW36S2qTYA3yaNec34ym2sp40BkOf82EVadoTIQDRpbikN8L6vm6/IxZEO3Ko+yhb0
         zJyubNPGaFR7ji3c/knXmr16rZ5gm+F7EWHWpn8LuC1f5ri9wpBMc/PTY6p80C6LKMef
         BinKIs0n5v0gmAZQvzPWlI4qVfKqgFCKJbl4CBaQAiS02MAyxjzo/tVMlDF7IHW8w69I
         4h7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zBqYrvfkMcaBzJerbGplo0e2p2R5NDakkgbrJKmzy4g=;
        fh=+ihge4b7/CZD1PNeDEGlxUrsZObkwvwuTJC9yoY4vDM=;
        b=sE14+nHKW7a7aC0f0EszuhSGKrAfVmWCeD3by5Ptvtv/LkWICSj3CwCS/fnYQNzf4u
         FmY+xJ0oxUSOsD2OHWpaZuqNkHYHFTA6lihy1XBebxQRj0Drst8k2UwOgKjhts3yHLN6
         M/0kXVDy4gHSiGAkzeFT7NmUUA6cS8FfuFX9rWvsktAWoHbY9ek6Jlz0RwceEd1b9wFz
         StF66zJTNbHd0fXiYSPyJsiSHHFJ+d7pzFo92Db/LcEJjA1n+LBSnqacpWYvIBSz3uvW
         aQGuX09Wks512p0TOIUM5eNh9944hLUSi+AOvw5XG2cTxdO9jk4QgzWfSZKVrt3IH5i7
         r4Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784455342; x=1785060142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zBqYrvfkMcaBzJerbGplo0e2p2R5NDakkgbrJKmzy4g=;
        b=NDGNGd/DQGIHkBuL8NYHkGwMAQ7UKh7gHqfmEfY7buPglFboe6NYeb9uLB+wqjp4rR
         sVN7SQE1OOPCK0eoxIis2WGfhOG1fzdJq63T089EsZQGFF8set7dPLyURhiCpAfU2NB+
         HFazekc5rfd8cK26C6uruM38TkpE0HIAFmA0GG+U1SVY57d0oegM9Maq6DTffb1aDl/l
         2UzcpciFbkwHvHWI7oA3cAIFiICoHIdIaZ0xOpGoc64IX4SvI9z9Gzt0k7hk/mFXIrO0
         emNiH3AumTYSzdxHht9RmqiajsKvTNsCwwioUZPlyGgbhhOiB0UJ+J27ROAdUYeGzZKV
         fkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784455342; x=1785060142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBqYrvfkMcaBzJerbGplo0e2p2R5NDakkgbrJKmzy4g=;
        b=f7mklsK9Z4PD12bNgmVe+CnZdZhnsLX/MgdwN55gcNpx0ePltw7IY3Tcz7SNuag0bn
         ZlR//gF/x4TSnthFya1tCK9aU4CyW8rYgpQR9/vTjGUy+H5+gbwXXCo9bBREcTgHFm6b
         RsRJPQ/YSmOpcZumhW7pXXXxw8kvyIO4EED2WgryyNH/GlKCyBhqR5ZsLyzj52aTMVXA
         SyWXgB9qPmisHI8m2OawPida7ckIA5A3GJI7/mqwNC9WkUf5aXiDkiyXwc+vi9R6+nkL
         oUHq/YvsFzBnAbVGU0E/J+k0q78lSlmyxFVqIVcNPw+Qy7rPC1dg7KaGHrYlsOQq8suq
         DD8g==
X-Forwarded-Encrypted: i=1; AHgh+RqZtxNxUcdbcx0EuayBdnKtvgltX+lLTOd4/xqVFJxRSVcCMHJ9P8EK8DTA2VstCs0uElTcKOsOd8UZUEZK4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzv3GBc+tIGajvMcv+low4Q0VfP1DXTVzE/T02OwN6OVwY2Gir
	amiA9LN49P67QpGdy1uXH2OM80GjbCCYNOacFKEs035mbd+NaptR2533WeBSb7qpiw0Kqw1RcAF
	IqXM0/bE8KDR6+yLNQQzBAFbZsTxhNkegJDjlTek=
X-Gm-Gg: AfdE7cm9ryapdLcuXgaXNHRikMmQggSWIuwfm/RMkofMuYO/4U49bnxuFnvKfGvYiX7
	F5FYL4GpsvL159hS/aHv6akh9HR8uY9ajVNwy7LTqYgKGwpv48dA2XjtSpuc12loawgOZQkipUN
	8Pm31wgiMuEcwlgfNXUfvZvSdzGCRQmkBbP8ECquQ+EePBnz7jbpwJ2UULB6k5I4kt3Tki9kgxZ
	Wh2Bj8ohUdMHaiPtI3uwv4BBq4EcVE4IgyJ1FfjfPEkIVjd4DyEhyTvEVopBzp6V2euWHKprBNe
	hEvsPalIMeZu/gqj8xsD2JTMtmr4oiTFeMcBIzqxemEk8Cefp/RfQ+VfgkZ2EtvXdoyFlBGQMPH
	0Tg==
X-Received: by 2002:a17:90b:3f85:b0:38e:480b:99a5 with SMTP id
 98e67ed59e1d1-38e4b3e228emr7432819a91.2.1784455341567; Sun, 19 Jul 2026
 03:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com>
In-Reply-To: <CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Jul 2026 12:02:09 +0200
X-Gm-Features: AUfX_mxhtL5_Aw7I2kRdaJ9STjyilcJN2dCOttmTXbvjWKpSbgyvfC5P4jjm1Q4
Message-ID: <CANiq72krLhYi_vQJjKcEhiQP9CHwc-+d=iMZocW19+MqfW3qwA@mail.gmail.com>
Subject: Re: LLVM 22 needs bindgen 0.72.1
To: Burak Emir <burak.emir@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 9:18=E2=80=AFPM Burak Emir <burak.emir@gmail.com> w=
rote:
>
> It would be great if the slim LLVM toolchains could be updated to
> bindgen 0.72.1

Yeah, this is the "Missing fields in nested class with LLVM 22." entry
I have in:

  https://github.com/Rust-for-Linux/linux/issues/353

Updating the toolchains would be nice. I think we can easily add a
check on `rust_is_available.sh` like e.g. the one I had before commit:

  ae64324ad5c1 ("rust: rust_is_available: remove warning for `bindgen`
< 0.69.5 && libclang >=3D 19.1")

I will do that.

Cheers,
Miguel
