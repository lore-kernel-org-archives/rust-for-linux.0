Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD9E2D9ECB
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 17:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765645901; cv=pass; b=jKRhbMjkBCJZ7nQtMHgjDtsgV/dm8Hz2+stVc8RPtJwnvVSb8ICnRVLqMvGfvah29VFVipw5MVLAMTd/JmbhaXQkha0ucv9nDv9jNiJ4DuR180FwG9WB4bLvUi4dLCoo8ZBp7TMvWfY8FLZSbWm3zj7J24VtMT+YtRTDcbiG7yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765645901; c=relaxed/simple;
	bh=l70D1g+ajJ7BQH3hfBcc87/a1PidVWYQ+64HL14qUqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hur30nHyxlhe4eO2DyJLiFgMvtbSZ04YWb61hlpqvArqXf5/8pmw6Z6CkT60jkjLvlBPBFRLySk6aM8wDbrC1YRYkDq7el0khpRS808OUjrI3bhe/rNwda4HNLIIX1xTiwCedlKQLspKzBB95wuOoZnUkSLKVHRerdQHj2PmSaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oF8d/ors; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oF8d/ors"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-645ed666eceso29007a12.1
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 09:11:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765645898; cv=none;
        d=google.com; s=arc-20240605;
        b=Cf0NFwa0IZhS+HN1Q+/AYPeRun6xQgCOyj+vKdLk6gS8QB9JD0fEtCQ0HwhoYxGFLt
         qqDPKqE2mSu2deZMfCtemI+DBUWDgbDfGWzS7hACt1+RioLUv7rQLSd3SOOVD278LMid
         y3rVVlgw/6EHTdNK79y3n1r1obSh5xMNRPXCN4dYt4XByKHeoZUIifgIE+lnuL+Iwemt
         uVf5EIZIp5TkiMPxvaVE1gU6ts1q3oItzQhzr3qbyT4o/HImnQZ0KrpPxQ4EBiCkysb3
         BuTI9rpaGGHersuJt0sZGPf71P7yP9LRHDakQEKRZjCgNCaTPWeESVxXQ4+K8C/yixVf
         8fPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RS1rXN50F1MsY4XFmhQu0sJfrizevZ8kN5v2491uLmQ=;
        fh=+3kQkjC1GFUoAQ6SXpGwENAAV+d3y2KKXlnrirLS3ug=;
        b=CXDtqVAoaSEB6Hcrb5oimW5mP1eXCbifOPwHEjqQcb+mRyrJGVo5WjirgScDD6dLch
         rw+GDoU+r4GUwK9e2wSqN0xvUjVhG9stIV9fcSZqf8RFPij5O5b+3faRWono09sg8moH
         FBK7tpVXdvKsf8jFpoy1Bq07Tqh/WnSgCjM8JOugab2Erdzx5P6iOgqvOtOjgGzx4axe
         GHIXOa/JLSfRTiywRwqU8PXR1jpwdHeik3WlCSeS4Dt8TLndhVmHrHf3KazjQP5dx8aJ
         0VpALFUEB6AqscF0GgVavFDU0f25FyrL4I9NGxZeWqfBja/kAge4LugXMKoS6qZ7Z4BK
         7Bbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765645898; x=1766250698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS1rXN50F1MsY4XFmhQu0sJfrizevZ8kN5v2491uLmQ=;
        b=oF8d/orsiUfS3ysoz7/eB4QMkFQIf4ArZfSUJaouAOkb9qMFbT62U76UspywkpLEGm
         8ds2dPRktVC9HWPbuhMVi9VB+HAEYlwUTS7tIG3Ps3DxSJNZaA8ufphv9BsYwTUPEOAQ
         tlDVHm4YEemzj+ngnyDwQ7N+w4aDHjqo/aHRtcSsgnRVp3DbOAzE8JBYPlV4xgsCPOKU
         xkuUTQTHHeCJDMbokP6/I3Vd2RaJS4GapfmfCvtGLca1Qro0qeEMd7pbJVfL+CqB8PlJ
         vbg6CHEQhW+4qrRE8wOgjfUGgMD0bCKeu5TlMEXdqd66tX42GVFw3qFE5XIS03r6uEEm
         yfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765645898; x=1766250698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RS1rXN50F1MsY4XFmhQu0sJfrizevZ8kN5v2491uLmQ=;
        b=t6QVd7eXRctlRA914uzOkA75jF/6rFfIJdjBdzNLmgfGnY3ZOTvQL97NtQXgM4v46R
         gBMga4c0m1CU6vob3bfJkQ8fxkbAGYMBDv5Bhai8GvwD0ZsKykNF6rSftEQ1nxQb6HqH
         rCueMXr/BSh/9+KhfMkYkV2W9WVks3ohfhykEkVzApKrMliMlIwVyyXi+Zad0ikXeVvG
         B88iqLoHX4KnWl03MOeJVDGGoJeAwZSgkagQKy4w+u6407hVQjBNciq48AhPdspoj2dq
         FCQ+gdM5tGBRLQUF/IM65QOyctNniFKk/RkdCERTpqvUqkGwilrdt3t4NqXLP7T6ETwA
         dLJw==
X-Forwarded-Encrypted: i=1; AJvYcCVFZ/DKAF43am6m62UuAblU4ORIWVoHljNF0R8TatoWl8M56mfBkPBSrYjvs6qldr61wHKcu8ySBWju6wPp+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOQriHpl0J+tBJ4luzDw4xWLLe9jm7umpb6roWgVN+X0ZPWXG2
	gyN/OnT5DpcE3gxoDTFem2K4jDeGAwG6NGW+8iUjiPBkPfxxMovsa/nuuKQBcLRAt48zqlqlEEX
	jwvv9d7+hMF+J4kzOd7M9iTUPwtI6YUbnzv2cEkxB
X-Gm-Gg: AY/fxX4/JJFH0LLp+ZYcCAILwAVU33r21sTwMPYFgxIEuD6GzCnHcfuMrKDWEfMdLFI
	qhiMfjZKAoU4G6hWngagGESBBJi9hO8XCyr/RIgTMgOZ76aQUhJdaCt9lLc+EHBQpEfF5Ao1LBY
	txTVjlsS6ZVFluf07yPgHGjqkyvLhps5+cY7kYpSg/TrKYepPUuNpu5UMwix8176L1Jk7OKM/5q
	A0euELp/a32eiwLGmN5iG1tYwuz0RpWcoLRaVkGQw0i+Rl1Wi7e5jH5QGzNpi4kIJdaXHtgHUIJ
	BW15i6/ASDjqf8OLjy2N09abWb+2
X-Google-Smtp-Source: AGHT+IER387+iwTYlhSsOPbUejaitfS6ZZh7+wI1vPrLm1/OniZ+ZuV9xmhUqhxlTtaqjxIwiQ5j+Dvbq+WAu/crm5w=
X-Received: by 2002:a05:6402:4546:b0:643:6975:537f with SMTP id
 4fb4d7f45d1cf-649b08ea5c1mr44839a12.13.1765645897944; Sat, 13 Dec 2025
 09:11:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <2025121339-giggle-throat-3ef5@gregkh> <CAGSQo03JTd3g7RYsqQcGNwWR708JMg3wOnnBxxii_SuxN=49oQ@mail.gmail.com>
In-Reply-To: <CAGSQo03JTd3g7RYsqQcGNwWR708JMg3wOnnBxxii_SuxN=49oQ@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Sat, 13 Dec 2025 09:11:25 -0800
X-Gm-Features: AQt7F2rppisxkQn7oi6YmIZWcvygbmDMhQRouBAclteGu9My9s10ys8i3RoDf3w
Message-ID: <CAGSQo01p2h53h35y_1z6+D=EGnT2TvvcYSwgfgK-hAOULEkUag@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Greg KH <greg@kroah.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 8:26=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> On Sat, Dec 13, 2025 at 5:28=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
> >
> > On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based Debug=
FS
> > > bindings.
> > >
> > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > ---
> > > This patch converts the QC socinfo driver to Rust, intended to be the
> > > first Rust driver in Android that is owned by a vendor rather than th=
e
> > > platform.
> >
> > Um, shouldn't you have a signed-off-by from the maintainers of the .c
> > file here?  You are deleting it, and then not adding anything to the
> > MAINTAINERS file to take ownership of this new file, which I thought
> > checkpatch would have warned about.
>
> Checkpatch did not warn me about this, but I did add the maintainers
> of that file on this RFC, so we can see how they feel about it on this
> thread.
>

Further clarification - checkpatch *did* warn me that perhaps
MAINTAINERS needed updating because files were added or removed, but I
saw that the maintainers were by `drivers/soc/qcom` which should
include all the new files. It did not warn me that I needed any
additional Signed-off-by lines.

> >
> > thanks,
> >
> > greg k-h
