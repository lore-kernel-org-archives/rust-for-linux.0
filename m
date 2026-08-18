Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2FA33BBCC
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 23:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096963; cv=pass; b=SH5ZWg1LzJwTo2cpsTu7Gd8dhcCDcMXoFIJiaKWdUHveMX8G7udFSy+ymLLnDaEGzdNKWBeGEo0M8MdByQZQ+6SPOp3Dza2PNVCYwOfGa+wG1FOhgEQN6Tginmw+X2CsiSYLFytBNMtTu2fX+3u3lB2l799jBgBz8mu6ZXjHRjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096963; c=relaxed/simple;
	bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ennh2u8ikEIYZzWY+DLIiWRzlMUY6jvT+Io8ZfW32ZjVRl0Qqen3Vf8yRO0aQF8g7AK92dFntL3tovMg1AC6ad3JtLJUEg+jNVIlvbKiJ/Pe2Bw4mMHFVIpsxWeRulmK5UR7j+tte4Dj517CnNwyhDKlpoAm/OoOvFjP0yy0q2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZT2x83FR; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZT2x83FR"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aebd7da975so44057e87.2
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 16:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787096960; cv=none;
        d=google.com; s=arc-20260327;
        b=Pd4/mcq7jBAJoK9nZzKg6kMnlZswi0i1uKLyXX0EVwVYuy89dJmvX0d+eEuSjvs+VM
         19Oq5hDYA/v2cCI/r8Hvci/lgGpoOhUyxf8l7Mz2ehzx7c2WfRn0JimHFtgiFfG+6lOE
         kKjwveZSjUprWMGbCZHG3nqj1XwnQ3eitFN5CoO/kdKRz4m6toBg3xfo3Kqj9iMYu6hV
         COOBOGJdJwOOTzKXkznEZnxgbGceuNJP3yfhvOrxvoCNScyvzfBGTbOhFJJulZi3nGQ7
         iVHke6bjguu+IFggGte6XRaxxqQawINFejzuCUpUxxSvpti5OOyjCuKNEr3Q6MMwQlCb
         nbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
        fh=Z56QkH0w1hH6ymiLkdBTSf7Qe6kL249N6pNPjBAkuV4=;
        b=DGh7kaQiC+APqdWbXqP54Ap7eLPJmnASyic7dKDfgTtfnHdx+twjM/LIxF+UBZeyKt
         F+3Vcm7LjkF6urbE3c0kuH2bUHANdPsz2D0EfksJqGwKWTcBmiUVZmNcfnsewbLGzSS3
         ZFUJ6GhEySMOryswIn9a0AFSDoD9NMOALFQ9Z1Jm8KIsQKhBpP4ude1A1y8Oc/eSobuR
         dcNZlp1DHo/MmaJwdoysEOSY0zdCHlciQCtqgVzPlDPoR/kwqY2SLWpQ3SRaGAFewzUv
         Ol5k8vBbsVVyHEJ19Y8C47tK1BhbRXNgeU+VfeDLCMgM6x2KlWzAS77OE/g9jv0c3XWT
         h+Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096960; x=1787701760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
        b=ZT2x83FRp8XeVgI/X9EmOA1Ew8JjyaYhox8S4lnvW6U7RqeGQCJlGyS5tMhzR3bHm8
         96Hv3bnZ7EnUfT21OJMQ9lneNWUXnbLIWYF5ncH5K1+rkCKHIe3c6yQSionqqXcdlSs3
         DCLwFz/+UaKDYAeuJ3pRxt9vLhy/AQBzXTa1Pi3IfWsu8kdATYyzOrrsPIw0MUY75bzs
         fzRIq3ZX7RI1tw4HOox3pMnxUqf5AWac/f6g1BvTpXXaMOxKevtE4syKA3sd84iPNDyX
         TsW1bjzb6Kx1a42W+EqKbswE0uusvAYfnEh8d07MVNvW7fGuv20VLXAqDdTSBiL/w1pz
         hk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096960; x=1787701760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
        b=KPmb3GhvVWCc+8BTOjYAz9wBzg+U21Sp+G7sI7qsig63PMa5uRXMu+kghS3RVcb9Oe
         nsUEIF9+/mEknoPnQ5KduVGgzrPZOmsX/lNJF9lopJw5/JhEL3Jqck3BZ5b7W8QdURF8
         WXST5cggt+W5EIO/fEfqkKXzM+0D6LdwsIyg5UINXNfdmKydGXw63APPjFeUMsxhSgVK
         HrsAgUT8ujPqNOpVAh8OpBXfcArpAVKuodC7mYQnWV3Q8KmM85FhpN1vCbDoDhKmtR+L
         LvuJkApUqrbA9SJnTevIosJrG/4XxWg74BIBEFNBj5TwystBhYobV05qRDXSHMSq9ltl
         FfMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZdEdm+MeYID5JKIlLNTosiTotmAJRSIerkpHYZ5jzo3/bPpVtmuvA3dQYGEtLMP8lw3v9hiwtNtTMop8M/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEFa/yU2tvksszzVqxOziCujbPMMsgqBav1PfWskV2g/xnrtls
	ke27P0rAjmueYDE+HYy+FAp4pYRT2D1n6uawZfW3ydDwh/2Y2siNHCNDHJKflIPra0COPQFtalt
	hfWtuRTgJvP0PJqYYsclRf3esy3x1nAo=
X-Gm-Gg: AR+sD118Zv7q+JtdZ3CI7yoX7KtRnn1tU5UTgzrgA0MnuH6RFVC79IlIvWCupYqxKDg
	Vsp0f7RQyp1UGfACrFv4d4tZoQM1GIZCVCG/AEjKJdLasirX8yNOUrR1CoMNeYLdeQNHXGF5+Fo
	GcmucaU2zmHvh6V3ueFKkEEB1mS/rQbGzy+6pF6U39FRs7xHdShEvAW6OieBTyWb7Tbcl11Z5Fd
	JvuyL0DxwR0KcjUSBWOALTA2fNVJCqxWCBzdLthMFeACvmT9VL2N3bv9iWui+679FEoab0/dshm
	QgEQHyfR1oyFQh91s9VG3bhUX7NtsIf7pPB8WXVbqDwbXU5vuviVOWBhZQ3y4s6+0OZblFaA4Mv
	YunlP1hftNTh8HxP8AUvj/DTl78XS1vbf6iMIe1gBFBZaDcVM6dGWJLdDaDEN
X-Received: by 2002:a05:6512:3409:b0:5b4:740d:6daa with SMTP id
 2adb3069b0e04-5b478b82ec3mr66034e87.1.1787096960202; Tue, 18 Aug 2026
 16:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818152324.587932-1-ynorov@nvidia.com> <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
 <DKSDWO1NQKF3.25QCXPPUM27J4@garyguo.net> <aoTjHtiSHJAuDQ7B@yury>
In-Reply-To: <aoTjHtiSHJAuDQ7B@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Aug 2026 01:49:05 +0200
X-Gm-Features: AcwNN1WRSakbfVQ8U0riTSPzb9OJF0aufUcbMY-OEMi-rmUv3-QMTzisl7KpfDU
Message-ID: <CANiq72=9X_WmkkRrrBKvLKBatgOnmAO2L=LbijzwzTv_Xoc5Hw@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kunit: enforce test configurability
To: Yury Norov <ynorov@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, David Gow <david@davidgow.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, John Hubbard <jhubbard@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 12:56=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wro=
te:
>
> If there's something more complicated... Let's wait for at least one
> real test like that, and not speculate on non-existing cases.

I asked because the issue is that this enforces a policy early on,
i.e. if a user happens to need it, then they will have to dive into
the implementation to change it or, likely, work around it or assume
they shouldn't do that.

In other words, there is a cost to enforce something too early on.

So it is a balance, depending on what we expect, which is why I asked
David about his experience here.

> This series begins with "enforce", so it's not about being nice. The
> generic kernel tries to save every single bit of memory and nanosecond
> of runtime. That's a secret of Linux success IMO.

It is great to save bits and nanoseconds, but KUnit is explicitly not
meant for production.

> pay for the functionality they don't need. In Rust, before e74b7a3f5a
> there was no way to throw the tests out. And even after that, we still
> have such tests.

False, you could disable KUnit (or make it `m`) -- which is what you
are supposed to do in production.

So, no, we were not bloating every Rust-enabled kernel out there with tests=
.

> This is not a coding style, it's a factual error. So it should be
> caught at compile time as an explicit error.

Klint and lints in general are not just for coding style.

And lints are also compile-time, and they can stop the build too.

Cheers,
Miguel
