Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1DD3F65EA
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383319; cv=pass; b=FiyKEU6gKtCR1VCccbwRas+F/e6YZPqu6fTjZ4b/4nnOpultJ/sGBBXq/bcDU5QGAs0zxvhDW59kXpjJ0AIDyC41q9AqEubAcbGMFW7y4PxRblG47dE956enY/KvZ4Kp9JUg5g+F+cAZik75m3PljTSolc/QJRwHSwzTSp+YAXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383319; c=relaxed/simple;
	bh=L6jfwlvDhUpZr+hZHLki/Jzu4aeXi7OwVmL9vBdpQNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWP6oNEpeN8Aeikrc0BIqKBCsvC1OVtFiNHIn7n/ssUaElJ/Tblek9DCUlOcjGkCJxvcf/Pm/4WAJ2tbgZcElqO0f1lDyZkZEzspOFkpxm0kAx8ixs+73Jc0OBR0hXNceORFWDrN1PZAldCG9huYR5udqrrujLiqTf8m3FqQHX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naqRj1Dh; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naqRj1Dh"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7de44ed7a11so5411203a34.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 06:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777383317; cv=none;
        d=google.com; s=arc-20240605;
        b=RCVzAQ+ho8y97inIzcDisMr3LsFi8u8uphbJ3+10i+oBkxDxNXLq1nVo1RNPLFSXQc
         Ch79fI0xAVuAzJwWNQw6Bf6BKjrgUXmVNg2nXu+Fdte/FtlCzyzeRsMQtzp4qB+SP5su
         /F2Np48WptbyjYjTgDxHzQ3ZPQUmXDJZ1fXuXQd5n1abDreR52rQgUNj+Hg6ZevLEEbS
         DIXeCSq8QUaM1gqJvX3zC6nXim7yPsErWaMkHZihhJIQWx/b/JpJ2uCiE9+fmL8tmhWj
         CyKFulOTL7d5/uvdRko+fMqzESlwHWDx2L6Zv2dq6fFVL1AkJASlbkbqPYU8axyzW5LK
         n/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ir1rcCk6LDCfwZLRlW9vVZRsaGJIJhXrE5Sclfd9QM8=;
        fh=am58UbZlqWlX98TBlIoHChk4bZlBoArt981zJRzQooY=;
        b=HpxFaguIB6tvgApzkrS+GMzNxzBCO7QMurC0SSi2KXDVZzf9bkCpsHzwiteQA9zjDf
         Dq5nKB2Xem1BtNhcVApXVrRfYUvUJbx6JLJsuKClEXHDuDYH5jnMvfbhXPz3FtgtQKR0
         g8zSz3TZSn7dG0VISTChO+NxA1zPYB4x+AVhJcbAQKEJsny1El0RKqieG8lcjt8qONb6
         qumnxPwSrMOP+maLbWKUYDwViCVxYhujLp0J/nwGZjUZ3RMPGv83j+NTBdE1K3XixjyL
         RmPyeJXnvkycljy2Cg+QWy4BykVZYhpAu4dMjALEU5+KzBRVScP90FcgQ2pGqoukuhjd
         zlqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777383317; x=1777988117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir1rcCk6LDCfwZLRlW9vVZRsaGJIJhXrE5Sclfd9QM8=;
        b=naqRj1Dh7jFxhtINP2FXl7co7v7swdsZNNpGrnwnFxrG+G3aSI6rLetdmTifjV6boR
         Qbb/xINAQ6LUYq2Wqnh0oRZtHi1beMd+4OqYQnF8hBOYXKHI1+QIWvO21sjXRuOELzSk
         1ZAY15i8Nns1ds+KFNMhjfPUzO66SUToDuRMDTNCC5NB0FSYtnIhiHlpRwl9IVREOCqW
         dg4jGnC1dxnvaAce0U2LQTWg3YohIqxKr6fIbFLPfdjnXoq5J+lNz92FZlCubfrcwy1J
         IBWOAz4yXJquy9DBNafX3fnu+uAZB2YK1kJKgFOeqP0i9Zk9+XMcR+0KfT6qeL9ScuYS
         t2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383317; x=1777988117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ir1rcCk6LDCfwZLRlW9vVZRsaGJIJhXrE5Sclfd9QM8=;
        b=Xx90hBLYszFc6p1gHifro87IUT+1Egcb5kHeWnoIrTezJbuydFbhtdJe+sWWx2NTsP
         v2LutRqdvRVzMNk9IEllUXKuJX2mzLQv4jd/pXiJxP0cMVYRLdgTSrQ3oTZualxzPM4J
         H/fAnagdSncntcdQZU07YznPOwRt0U+gkxICqis6AEVJ+9aVSJ/xXwbCzInxPygoBJtT
         vr6zIiQ3wumcXTUdOe3fPO2i4yJJl0aJWHWKpCDetZGZbFHPzberuRTRsZ3Vlg7GIr3a
         HBKFDEVwHjs0VVMEhRbu6aR4pN0obVPt+Ztza/n7CJiouScJetPe1TuGOfBu+JN2z6GK
         q9ng==
X-Forwarded-Encrypted: i=1; AFNElJ8/3gktDaj1ykrnRA4KbjeoJkjz5+nRs2t2HJDHiVIB/XxzzvfSyDUeLaPD/+7mjAjUyFSKK0p6nxooEyv/Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4O73Yhfs7CnjzfrvTZKlKnp3V98WrHFB+9vncE0BlZiNimQff
	1rGj/scNo1ewfPNjUx5I4d0ebg5lWdww05TTEvOkXSjjKXnHKyXUBniRGDj7b1V62wfjpbDROTV
	AmIdLRkIF1SP4DdPJ/OyTtdpsNLLLFI0=
X-Gm-Gg: AeBDietjYYZNAvR7BulBnBdChldJOHyi0KhlYYaSjzinkwSIDwD/zmn5GjwRj5ysQmh
	Lo7kgc1PgxegBUDSRl/Rz0XLUJvCKLBHWLUHsy4sYjjzPVkwTsHJmWAI6CG93Lz46vY3eWo+5a7
	qtByleOXp/QmnBuHuzz9+M1Me+21peAoEwm1ZOP/Abdjoj8BD5jx0B/EqLtLCWShh1ps/FvOxx2
	cnN5iwuoYyQ6FlV0Tl458JDXZ2tehlnYEKMamL0MHB6upLzPFM12FCumS/Jst8A1+aKaeMzz8S2
	A0t4VmCdgB02gGovDw==
X-Received: by 2002:a05:6820:1c98:b0:696:1a85:5873 with SMTP id
 006d021491bc7-6965cb37286mr1583849eaf.31.1777383316770; Tue, 28 Apr 2026
 06:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-1-bc06709c8243@gmail.com> <177393252080.237.233380198774445367.b4-review@b4>
 <CA+tqQ4JcmO_E0xHJPX3HxgDiqv+KQk4q-xBvYk7DSEkifWhtWg@mail.gmail.com>
 <177712995819.98244.11409833540971152770.b4-reply@b4> <CA+tqQ4+dBGDToYESFedHmi2hjwZaQL4LK_HZaPqRw18Vt0mgQg@mail.gmail.com>
 <CAJ-ks9=GUgrn4paEXfcume2iUbyhfoM5=qp_SFfK0PLrS9HPAA@mail.gmail.com>
 <CA+tqQ4KzOUS49vn3SkKjA89=VaDECsLz+Q_XBs0PguK82zr5Vw@mail.gmail.com> <CAJ-ks9=p3i5xbnDojJ7QopmUanec0ZPZ_x3_zD0Csyad5L7FEA@mail.gmail.com>
In-Reply-To: <CAJ-ks9=p3i5xbnDojJ7QopmUanec0ZPZ_x3_zD0Csyad5L7FEA@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Tue, 28 Apr 2026 13:35:05 +0000
X-Gm-Features: AVHnY4II5kyxBTQXcovunaLmSIoV8v0kTEB3UcdjOojY5qJTBGjuc1NVRgH5gU8
Message-ID: <CA+tqQ4+GFw83fFz-ykqLqae-ao-3oU0G-mxm2wD+xB7bHQ2Y6A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 2:23=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Some options:
>
> ```
> T =3D t.TypeVar('T')
> if sys.version_info < (3, 10):
>     import typing_extensions as te
>
>     P =3D te.ParamSpec('P')
> else:
>     P =3D t.ParamSpec('P')
>
>
> def wrapper(func: t.Callable[P, T]) -> t.Callable[P, T]:
>     def wrapper(*args: P.args, **kwargs: P.kwargs) -> T:
>         return func(*args, **kwargs)
>     return wrapper
> ```
>
> This requires typing_extensions, so is not ideal, but mypy passes with
> both --python 3.9 and --python 3.10.
>
> ```
> T =3D t.TypeVar('T')
> if sys.version_info < (3, 10):
>     def wrapper(func: t.Callable[..., T]) -> t.Callable[..., T]:
>         def wrapper(*args: t.Any, **kwargs: t.Any) -> T:
>             return func(*args, **kwargs)
>         return wrapper
> else:
>     P =3D t.ParamSpec('P')
>
>     def wrapper(func: t.Callable[P, T]) -> t.Callable[P, T]:
>         def wrapper(*args: P.args, **kwargs: P.kwargs) -> T:
>             return func(*args, **kwargs)
>         return wrapper
> ```
>
> This also works and type checks in both versions. Of course, the type
> information is discarded on 3.9, but as long as we run mypy on 3.10 we
> are OK.

I'd go for the latter, since the former would require Python 3.9 users
to install an extra dependency to run `make LLVM=3D1 rust-analyzer`.
Thanks for the suggestions!

Best regards,
Jesung
