Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF014B08A
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765918424; cv=pass; b=mOjzFN6TnH1wS7TNUa7QCogiUB5/X8S/6KQGpDRBX1JYrj5cQfislKWIukPtZKiUHSd0xN8NqBz1JEvjuJAn6Uy/T4qWW/vsIacQsbfgjhmddBH7GDhM9fkY7yEEym/SRxbdFyE0wCG6FZ3ds+HnSUgGmAfhrRp3iJHN/FCsREw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765918424; c=relaxed/simple;
	bh=NuuxPtGKuNA4nBoRIDfUkRbP6YtfhfrvEuFwuu2H+Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ox+cfxYzGYmXtD3XRGn4ydE1djJE7XBiR69HewZpfnmHZMSHR1stfeqikAz/y/6pymvHTItlWkziS8f+yX3rsCxZHmFJEpNcylITGrdaJcq0ploAdb9oFoN3UDa++0Jk1SgqEjqFGrF8hdGWVARj2wjPIgN3ex6jpOi4LbB03GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zH2ikxtX; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zH2ikxtX"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-645ed666eceso566a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 12:53:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765918421; cv=none;
        d=google.com; s=arc-20240605;
        b=E/xCgQUH6+dqzfysz0ULJCAEF3SEq68xvfwAlh58ZLaUgE2DBKOUCr2RY4ouzF5TG4
         IOJApNmZtUiUdcCt4l66qyTB2/asi6BGXU0wxMNlXr9rIBg5KP3wWJfK9P1f3THoYPSu
         4VmhyWxWmotdZm+/TVQSOACAN4tq6jWtGCEwyw7DSaPilI4fAxjK7g6ZT9jLOFQPD8ce
         uhiFCuNMBkQctc0pGKusLazPJ6DSftM2nSpOzvQ2rC5nPeDcN8kYg4Xpqqd4T/StbZLx
         39cjCn6rLjrEov4gbfdg4vnjouj/LVHHmiHDpFr2CbvWxkC7+p+KZ4Hbbalkqf6uHr/t
         cu7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NuuxPtGKuNA4nBoRIDfUkRbP6YtfhfrvEuFwuu2H+Zo=;
        fh=0Xiykx8t5HK2xoRVX+maCYv3Zs7/3hzYY9G64PKmxsE=;
        b=Shx2GUH0wQO4yLTl351QzIIWjrrbebhCKKuBZE9Xs8P4F4i4lA5N+B2yGIN+fIPmKY
         eCSC7Oyn7YK+WjuJKookDacewsDMSyiX1DtZ/bF6gNI8hKcGO3mR9iy61ExuSNh/Xkvk
         sqBiO4/0DlhWRiEAb3+F9xzTlwfzHndFhGYt2aPXDx+bxvgbW+tlYRoh3Ogwgbo4XBOD
         MYsWSG4bjt/PoD0iyiEH8nMRscf/i9BMeJ8swVJPWSAPeiDQDLG5pnQH/z1pLCP0oVDt
         hsw/0TP5QVmgQxjsD3TeZqR7RkNzL7qSZ4m7sj9KJa4xEF9Ab2RhGzvfCwadWdunHW1r
         AUVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765918421; x=1766523221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuuxPtGKuNA4nBoRIDfUkRbP6YtfhfrvEuFwuu2H+Zo=;
        b=zH2ikxtXSyw/nSVwduoZbM29JF+gm1IupaPUtajDTZJyWip6LOTurKDsH84RwFS6SU
         EMwWZknr6XN3wXyhHbOhwPHzEDqT2MUq2FekW91FIvhux1w6fATYtBbdLkOjjcYbV06n
         lrl33W7JF8QFjUJ7mOqNPQqxZgVrk9IoeKVVJ0x/PqtHyvgbbBUStJNANaZEXIpo3oZP
         nn2DzhLV2z657wsaZHeNkwf9SfX+HsmZ2sfwDa7uiwQlaoCMJoWNWI2Uw541LFYOvkEx
         o/U34T3Joq0nxdRFRYWeSZoIMd1mWzi4jBmqJZqn0tcMrj8g0MYPuwql98GtPurp32bM
         T1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765918421; x=1766523221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NuuxPtGKuNA4nBoRIDfUkRbP6YtfhfrvEuFwuu2H+Zo=;
        b=c5xMwKMwes46TE/mc5e9is4eIynl49Jzm29ze+y5uDxx43K1J6UpmYYbU8/CElVW/3
         bzlMf2+kwMBq/ShjxPiBSvqR+uTR7MTv0T+2sTpIhzj1+5osuS+g6qOuCDcqOWe4oY0L
         nyQxRmGTMVJmwROVoKMysVTpv2/fW0POKY6/5R2NJNeOo7/+/D33YR86NKmsTmw7lvJN
         AonO5AUtOqcrQjRlv3AAYO4I71S0VeCYYT1z5IFfHxk+65+wwa3QSfwBCJ6Tg0VKrEJS
         fpD0qDUbXkEdLx6pHhkZ2m9P3Oe8DfWj8Se6snATqyFSrwF4pO2mRlCi/tIvzuKaQx9v
         CMSg==
X-Forwarded-Encrypted: i=1; AJvYcCUXV6oxxdYcmL4JSPqJjB8NoLfGCaRrTBPeTa1T0EkPbAubjXzLvscnu4l9MgcI/ateg3JxKA7dtD5j3eeXxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoXqgqaVSM1z8zcXXH6Wycsxk6nQoe+8B9vum8f9ag0N7N6ChS
	G9HnwFqTWTy35CwGLZYjZZ3BIIXOavPAyyN9trgh3jaIPDeljW+DeG6h7KUbR9sLHelyQucuEw8
	dK64WYaqfaKs693P5XBj42djCaPeFXef9A5kjRoB6
X-Gm-Gg: AY/fxX5ayYF/Oi9zaxHkrLbA6UdkFqH3JkMri3nnDAZ12O1Bawapy1ZHLMuN8LhTW0N
	nmq+MV7hDWPHnkiN5O9laacq95hEjzK8ESvjB5Ldid0lP7m1BZqgqy9VYz8VVzzeciBmY6NGOH5
	R8U9fF/nz1d3KIDaXFv8dTjUacvSVdrz6C38iY7QdSHmDOmcwN9jCVEXGAvXctjP24nbQMDEn8r
	p/UUYvuUdNwtIxOfUobJ0Sa0c3J9i1HjK/GjOKBlemw+vMhVfgjLH+yee0xWmZ2KdFdDVyGBymd
	wHwfVyGJVfi307HoCf+YUfGXvA==
X-Google-Smtp-Source: AGHT+IFlOvKMhimG9TFoBpuVqH9GtXgyGZ2U02aYOYY30YWANnZ6aMhDL6EnJrDezEKB6RJNaeCQrFHpvip4H8DwYGI=
X-Received: by 2002:aa7:dacf:0:b0:63c:1167:3a96 with SMTP id
 4fb4d7f45d1cf-64b4011f599mr8097a12.5.1765918420655; Tue, 16 Dec 2025 12:53:40
 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com> <nddh2fawoofktjglouq5wrjubxhyqrlzftqz7lvx3xdfipncip@xgudpcfdo2bd>
In-Reply-To: <nddh2fawoofktjglouq5wrjubxhyqrlzftqz7lvx3xdfipncip@xgudpcfdo2bd>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 16 Dec 2025 12:53:28 -0800
X-Gm-Features: AQt7F2okKfu-bKqlTg4yU3QLph0ShB8kLBxero0Gp3Hpjnyyxgk-uDLozLNKpHQ
Message-ID: <CAGSQo0254uMNb52aJACpuEr6O1GiUng9nNut1eecM3AFaSy_8w@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 12:49=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:
>
> On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based DebugFS
> > bindings.
>
> Okay, but why?
>
> https://docs.kernel.org/process/submitting-patches.html#describe-your-cha=
nges
>
> [..]

I'll move more of the text from the cover letter into the commit
message, but the short version is that it's intended to be a low-risk
driver to pilot vendor drivers in Android.

>
> > ---
> > base-commit: 4b31c90f86768367c84cc6e99e1deee0ec55197b
> > change-id: 20251029-qcom-socinfo-d8387c7fdb1c
> > prerequisite-change-id: 20251029-soc-bindings-9b0731bcdbed:v1
> > prerequisite-patch-id: e4da423ddabec93bd9a64004691266f9b740e0c5
> > prerequisite-patch-id: 5097ff622f8cb1d38354674cf70c1c946ac87f6c
> > prerequisite-change-id: 20251029-add-entropy-f57e12ebe110:v1
> > prerequisite-patch-id: 657de204912d2c5efff9898d3f4c51e52684d8e6
> > prerequisite-change-id: 20251212-transmute-8ab6076700a8:v1
> > prerequisite-patch-id: 4f5f7cb002d02d232083ab5c3ce6b3cb90650bd6
> > prerequisite-patch-id: 01a1f3d727e549c173dd142180741f5b6a3c866e
> > prerequisite-patch-id: ff801a7ae439876b1554b4d1132d94c825bbe74f
>
> So, it doesn't work on a clean v6.19-rc1 tree?

Correct. Those other patchsets are patchsets I'm landing which add
bindings used in this one.

>
> Regards,
> Bjorn
>
> >
> > Best regards,
> > --
> > Matthew Maurer <mmaurer@google.com>
> >
