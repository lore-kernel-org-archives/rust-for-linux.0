Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEED34EF18
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523283; cv=pass; b=iWbOkD9Zh04wSbRbTIIsf36TxJXkndDgE8o0cnU9QhSJeKKAUULaC/TnNX6Bcbqiokf8f4fWCmorI8aa8L8qjQVEmVjBCXFupogjqvdyXHmNmNyK38PmjkTmyKRKrCCv+Pdmn/NN7CNGCWAV4wBvIBcqvafvsFlwpEBKJVxeLNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523283; c=relaxed/simple;
	bh=KUBW9RZ6XUkvKx3qs7FVOF9Kte5loY/oG1ToIEJFoEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUIr8RO7TPCFYAlRsBzcOAWqC2pVUgQAOsCIOss5kfcbV7+ly5FO7EQD15BQZ6tAEWLZZO7Fx35YoxQ+pPQmMeBhFOpwFybhIqt08DQ+/MOvJTfD+YdRmeaOMIbJirFif6eGgyXrLQtXkk8vCe6AfbfDH9m3w1LAJ1JSVCPicck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xkkz4ZmB; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xkkz4ZmB"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-385b6a15affso61626441fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 06:14:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769523279; cv=none;
        d=google.com; s=arc-20240605;
        b=FsYllO8cxdbQ5ub4crlgtP4P1aR2vw8lBuZtsBFy77aV/Huo63q67fs6dV5HWTmWkv
         JuDg+iOTi075qvaa9eetbwNmnRJKwqivVPtWIzx3ealHMthbOF92SWkN78IuilXWjEEz
         dGV/C1FANpuGYg1MMzR5879ySiNaWaB9OooxHMjKC7BIjYDlnfLTR5u612Xclft+oTZ5
         8WWuhUEf/WeZTbZzrqSMvmJNIfaDem6RLQaadjsAGgg8qoy81HHEEpKVXNJ4gaQBrQMn
         mjZ9ShJU88PQYT7O2cPK2wH5Ws3QH+WTUNrCl5j/WVbqyFnCy2cPvPoAOLFvhH7A23Fz
         6o4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=94DdoxzibB+TbibiDMK+NQAtSkvBwbDxE5T+cBWz8o0=;
        fh=Hr1H+zHBsJhU1BvxuUGLntg7H5kUlvfi0pTmtW0VXrw=;
        b=D17cjWj8ZyEFLTUzzNX9fMVh7oMBdMzMzhov7Iba8Rq+CM1dt3ZCaCc4BmfgOlcrb/
         6piMVhjCKseNTRDXa3nEkJEuDmm4nYWKGjZMxJjhAUIJ3t0QRnke/YSOgk5fV+ioaU5g
         vT7lKcxqVoZMup3rYq0o/vqAmkvG5oQG0FrfnRO9EqKdYiHxsrDLD7yuYes3Z5T3BAgl
         ikxf1LMtlee5IeF78ThvYiWTj9hFefZkBHsKC+h1SnE6LJaFcKg4/a6fyj84FdL6oSUb
         4iSdwgUqj3czm81W7sFrg4e4/bWXlkEpqqTt7+IYZk8UIyC6i/8eP1CWy7FfIL+Hc8iY
         451Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769523279; x=1770128079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94DdoxzibB+TbibiDMK+NQAtSkvBwbDxE5T+cBWz8o0=;
        b=Xkkz4ZmBFsO0cI7kgEekbXLzy50aCkkhU+71B1ELWrWBe4CCN0B1sRSktXrWTuxgji
         HbwvTeHUQTrfV5tSBD8se3cceUJlOhENYL5Uzb3qQr9Si/2dozRLeXNsOxv2aWACVkXX
         A7vPgyjYTI2Bq7mWovZLCdAmk9da5sx1F7AehKvY293a4NEwFP8plZ35GBJZSrnWEY2d
         LvqkXY1CXVye5aMVEUE/VC20nw3ELzcO8mRZGg41HB+zhojIC3eHzLfTUbOtfXP3oFEl
         HXu4stz3myyuPQ+4CqtiEC5zrLQbee35MbbVJthsP86DFRxA0Yaq/XyNgh9NgLLkYr2o
         UYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769523279; x=1770128079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=94DdoxzibB+TbibiDMK+NQAtSkvBwbDxE5T+cBWz8o0=;
        b=MS6BBVWXtbEbVaQQY2i4LEpC1bHDMn1paCKzI1Q4jKBhXuE312z4+Gp5MzgSVxTUgh
         Bv8f2QolxYEgJZRYjpXE8FtMVnC0QjPKv1i4SkGC1hovDR7/N1oLfI5eEtdNQQoQawym
         3wSlyuH4VQUgsOzInlTZS0tsZ9PQPJJ+vm84CXJpWQuPyZXYTf6CYihomP/ZYUB+7hp7
         +5PZhjPNk7IOszeQ71B5Z03DWnFpANvN22pXsEHGDbnkrK23gtwvHI0APtVNcpYmOhyg
         t+YwZocRTFne4KyOEFmlzWTpKKwvssra2b6x/QYz64dIruZEUgdfn/7tbltoEjGoiGDx
         yCXw==
X-Forwarded-Encrypted: i=1; AJvYcCVvFfVimbAh4hGAVYxArhWAr+jv69/xFFEmt1bW/KBVArE6LADGxMaaPwrqKmfq2cmVq1O2NcssTSQnGSRZzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy/mOLIvScLol2RRQurCk4AwMJt5iIUSVoQOUs3WYYmO2/UP20
	kWw/QVinGQIrbeJebILPZKE9STMgs+JPDCm53NcOpUe2S4FSOUIBlR1Q9rjEqhzgwWDg23Kd2Vt
	SrCXYzKGKbJ7zTuDOpnNrwoGLheK5TPE=
X-Gm-Gg: AZuq6aIe3L830jxfumNl7sGwKQCtTDoYryj2NQ38a1lrvDiR6xHApN6raVYhH5YQJyD
	l9vW+J+LRaz+8dbxJto/8zUJsZyK0ReEtlMhavjh7LJ+LJblcdTUveUEuEJMgv7aGmvewv9ETdI
	rvV5bcMin4WqLMF/ODo2o6c43ssNwS8FLPMzhBFageMPILMttG51hTnv80EufU0Swhv62WNQF0n
	cyjSZaZdKfdunQ6tNGWnG9McHuuIDDTWfyLQ7asU3FjoY4+faTBHt4342DWLhvyVxxO7ZIIaeJu
	z9p7d2bpvqc6WEEIkI+4V1c02cqxA3TkPNZT6BwGuTQIKpDcdHLvKh2MKrnGzs7uBsMxTvVFhbq
	RAI3Fr8Rw
X-Received: by 2002:a05:651c:4392:20b0:383:86c:547b with SMTP id
 38308e7fff4ca-3861cf11ae1mr7238561fa.14.1769523279214; Tue, 27 Jan 2026
 06:14:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
 <CAJ-ks9mjBY7x1s_4wqMC8xqWsX2+aCM6NHn0j7yh_+daKiyS1Q@mail.gmail.com>
 <CAJ-ks9kn=0Sm2_1WV4xyzunzcGG1VZDKy8L=_SCCWyV2OkJTDA@mail.gmail.com> <CANiq72krt9De1+WgMh0y8XX5K9RrU-_1FuSp+sKO1Ya8EaVoUg@mail.gmail.com>
In-Reply-To: <CANiq72krt9De1+WgMh0y8XX5K9RrU-_1FuSp+sKO1Ya8EaVoUg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 27 Jan 2026 09:14:02 -0500
X-Gm-Features: AZwV_Qh_QLxn5ei1IIusA7bhY1TdtP-oqorpAeBjx6PIE0AdqLry5Qsp04FSMso
Message-ID: <CAJ-ks9m-0C=hOdYC_z9mNH54fXjnaWpYgZSPaWoJC8rnQ4Kgkw@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 1:00=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jan 19, 2026 at 1:52=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Michael or Stephen: could you take this through clk or would you be ok
> > with it going through rust-next?
>
> Either seems good to me, thanks!
>
> For context, this is part of a long migration:
>
>     https://github.com/Rust-for-Linux/linux/issues/1075
>     https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a91524037=
783@gmail.com/
>
> Cheers,
> Miguel

Another ping here, folks! Miguel, what can we do if we do not hear
from the clk maintainers?
