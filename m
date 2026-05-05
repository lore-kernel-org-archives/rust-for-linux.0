Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A1915E5DC
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 18:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004293; cv=pass; b=fi81+EQCUR3EEtE/XwX+/bA9qbK0UaJVyRINuMuCd/zk/r9OSIESm+yN8vTwx54XCAWKxZoRjmX/sX7rDxOs2WXfjcWAk681Q9YRyBlPn0GpqBzy0JJC0Gj9fPewJbFUMdZfIX3aXtxQ20vakxW50apuhw3xOuJhq0P0j5Ql1uU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004293; c=relaxed/simple;
	bh=HPLcX7NBYLHglzd+wosAPjjdOESwQWmMd66407k9fuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hg29PxQwJv5V2k9U7RAXKZ7GA60sVdsT2aL/GCOzK0NjrOLdnCOrTY6mL6g6ogpeuQJdXSOS6n/pdpWTpH8NB8SZ5sB1qDVJmKyIUZPAgdLsO40cFe1uCg9z4b8JjDBSnM2TdfMt0MWVHLf9oT883Zz1knENFPpb+eW4SEHXenE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctUIpLKT; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctUIpLKT"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c7288cfb9so341353c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 11:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778004291; cv=none;
        d=google.com; s=arc-20240605;
        b=QpMthM6l+rSA1SB/YHHLHAO19wFneTxcrmWdPl/R3PBCaZwT+XU8lFXcjsOiyMOw3S
         Yf1jTqe2Tk5O3pBNSIRyN5B2i3Q+H5PL4f5poz5vAPollhoixtOSEyPyz/SBJIFILGFP
         T03ykrcuEDckwGPodbPhqrkOFYqZ840lgX/M0aph2lMNBtq9eEyrAoU/UZvUaE+QpwPg
         OOm/rrAkwcHlWk56ybux89qfrFBvGfIVW0iQhiA2f3Oi7j+aZFWL62MlubaOvLPlZ3Ix
         aZYG9Q3mhHRZQXZbdhLK1BeXRWEpU+L9DSKPJfy+ETA0nThdmFN7+BwMw6whXRnrN9gR
         ovzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HPLcX7NBYLHglzd+wosAPjjdOESwQWmMd66407k9fuU=;
        fh=Z/PscQyF1fEZtlhon2vYS7NGq4pOhXRmkIHZcOEiyU8=;
        b=kGeBv0LytRMbfXbKJHBIHIjQUZPhh7Szcn5N84vXc1HHCrneFcaGepy8OEtPpyJHzq
         eslEcED1HnfOsdquJZ44log8XY+FNyOMgWjgsIiR3NkUUOzMWfngcedEqcpD1Q/OJi7z
         SjFORU5b7c13lxV8AZr/eQBMpep6QXSWODyW8i088JlZ0A20FyPIdheI25dGoxuKYGlC
         tIX0vc9iO6WjPOB32XaKQJ9PfRv/KxHNAT3IswriZ8H9uaj26O2vda9fJd1Dm6idDHu9
         J+IfR2vHy/tV1FUWR/q2kEECev7xdHXthj2JRF2PiEiFGn41vCKqZt7ORN+RR1fe07xr
         SDCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778004291; x=1778609091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPLcX7NBYLHglzd+wosAPjjdOESwQWmMd66407k9fuU=;
        b=ctUIpLKTYCVhMe8BmZ/Ec5mdKADBJkhx4zKKnCoCvmizLNe+sGr28h955x0pERI9j9
         CFa4oTHv6rNUs2ZdGUXMlNREX+v7Q7Vv9JzjHAtSAG1A8RACkg5mRJApDVaeHfwGbfgE
         ouD+4oelymQ79kOef2iRIZAVBHOY+AhTvtTwkveqgS+x9HFPP1Uw0HNgmcbshvKDjgtK
         Nx0MeY97G8iPE4SqMXGOwetfkN1HCCzmkIoTUeQcpZp0YAKFOGsnajm96HZqZ9EgHE6q
         6v5ufdWkNa181unF36F95ihLQB9c+hEI//kFxj1JtlXv1erXPK+e2/Nnwm1iMjSba/zp
         KoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778004291; x=1778609091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HPLcX7NBYLHglzd+wosAPjjdOESwQWmMd66407k9fuU=;
        b=nYScqV2lP9yIQi0ZKKGu1bh2cqknQui5J2mx5kCvXiN5SaTk/c0Lv6zNqi0MIyY+pX
         id4fg73qrXjTvrF5muxIuJ5kioAKfYJ1al5Xvt9NDAK+r+PUomPs/eXCJa/+GNl37kml
         wVnVfGlK1QrpCElu081UrMzXvMdxFDHELL+uf4oOBAGdKpv8c4O13z3r96f5KRGslG6J
         JP1HgQ3iW+6xKt3rvpfeiS9zUjnW1dCLOCpNnGncJnkgim+qXweCXQkDjmgtyQZmcnQB
         ZeBSZBU7d8+PZRgDUl1mKW0v1Y2SY51pOmsuH8DzkT4iU15ow6wAzB6TZNDR4kdgSsv/
         Cftw==
X-Forwarded-Encrypted: i=1; AFNElJ/q8eWgZ8T9tik3jvSWLS5ZB4FfsrKZSJVAM5s5RNZeByQQ82HcjSLeqS3u67D4c9wH90IkmGLW/+sSAriwCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1LMNhh3wEjK21iXlImeX4rycHL1qKkkURVSt/08T8JaVCbIjv
	9MgPCpF/uPl9rdv0kWHt5X0AkndioRZuxEfupxqf5GaN6bqdCn31g7f2rSd4JTPJGBsfhGtsQ7x
	sCTPoEYx/Q8kO4boqpjlsaq8ITUDcnLY=
X-Gm-Gg: AeBDiescy/04yLyE6kznvAfySKD1RpabMi5yjlmgiGmsJM0wMbEpLDAeGSlHapGCwg8
	C5vgdbFaI0mvDFHZGLRB2NkrPorfUrhIuQ2uCxWSiu6JjVgcND+maaA5HLVa7M42wfY6iJZfcsx
	NWHhF3EOM9o77mtWsObw0dXuOQR327s1FjXx3+/v670YTc4xiOGM8C5i64n4qlap8p+rX5v/T8p
	x0msp3ICR9f9nNRZhM8h7VtCCpRR6N+SPBC1wX0DWQTYczYWzJhy7ZlVru/ebTXBf2PlON5rkv2
	eSnCRspYuI2D4TFsqG2bYZ3v5Lp/eQgtu9r86dgQmlLh1J/Wm3+BgCdq8T6KDGjyXB/Tl91k9jd
	UtAhrE5hQsioQMZaCBQ3fvkSQo/WfedZfag==
X-Received: by 2002:a05:7300:3b08:b0:2f3:3835:2010 with SMTP id
 5a478bee46e88-2f54c37e2eamr60720eec.6.1778004290801; Tue, 05 May 2026
 11:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
 <1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mchehab+huawei@kernel.org>
 <DIASHBBEIHQW.3EQSDUML6G3SB@garyguo.net>
In-Reply-To: <DIASHBBEIHQW.3EQSDUML6G3SB@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 20:04:38 +0200
X-Gm-Features: AVHnY4IIS_qym11pAKvI_P0NhOVs4Km4RvGpgY89imy3B_jM1rRJ3u4fzshUmYs
Message-ID: <CANiq72nshUgJe=DRvSu_vRNoO6UW47fz+4xfqXCCgFkS6+hvXg@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] MAINTAINERS: use a URL for pin-init maintainer's
 profile entry
To: Gary Guo <gary@garyguo.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 3:49=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This file is part of the bidirectional source sync.
>
> I think this file is still meaningful in its present location even if not
> rendered, so people touching the code would be able to see it and be awar=
e. The
> presence of file is more visible than a P entry in the MAINTAINERS file.
>
> That said, if Miguel and/or Benno think it's fine to not have this file, =
I'm
> also okay with it being removed.

Yeah, I think it is fine to keep it, and it also has the advantage of
being always available.

(If we are keeping the parser change, then I am not sure we should
even change this, but it is not a big deal -- I wrote a comment in the
other patch about this).

Cheers,
Miguel
