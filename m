Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491D6258EE9
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757448369; cv=none; b=QUK8OaARfXnJw1F805bnk0Ev7R2jjVpLenJKUdAcYCvV8O+9mtylLiLH5IGtN8muf+O25X5uJ3np8A0b5sdyOCyTl8WST/2yc7XROddx9da9Bg7E3+OY19SLl8iy0OERSQGFMIb2FVAdXHhigxEQrtkKGkHJMUbWPycY9hMXKQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757448369; c=relaxed/simple;
	bh=Sy7PANXEcnJRzO+JUjUbY/ki/kQU2URyHERMut01QRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K54NGAk2gPmgjMDi/BJzbgIgXCAsjDgj7Q5C7iVeIwP2dmCD88rqbYXmmLTg0zirJg4r7xUlvk4k3VrQpvbC1xIiWTIl9CUVFlQ7GCkuFrC+kRAGf9ftjxzAzQebOqtxDBrfOEGgs0vJQWTctJsmMpxvli1wYRBLgtoei1uL+zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmGcvBCO; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmGcvBCO"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b5235737aedso181304a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757448367; x=1758053167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sy7PANXEcnJRzO+JUjUbY/ki/kQU2URyHERMut01QRE=;
        b=FmGcvBCOxFkWep6HRG5jMMfhTobihr+xyTGb9QrJAQNQ+aZKz9l+BrXGgok578RC+A
         0/kGMS+cJLKK7Va9whLMKkgcPdqY8bwHAlO5s/xH3d5Odn7doG6ExSKdACcWdUJ4BmuQ
         /sCcarMTShcdL8HjCqsNJF48BNcWCvKFk85J0W+yVW5z0cdepeyJ1jQyKgGNVF/+NSpb
         u6JOBBXGDxGWS6qyIQvEwhzElYmFmhyqm+V8Tygp8ydcVwFHomFP2sdw1jWsr3iasFMI
         UVsJSCygNV8Vitu2+b2zI7zqMFfiRT359Fa6VAdPUD0pYe1DWk4o0ndHwjPflv4aTbrI
         y9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757448367; x=1758053167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sy7PANXEcnJRzO+JUjUbY/ki/kQU2URyHERMut01QRE=;
        b=ttiC/xTU3bxXO2IhTey56+oC0c7cHWl+2SPBWbYv55Rs7Xl0TCauXsIwvo27AO4+9P
         mq3IVQAPJlKqYvCPtqYf+xtCCk2vXJZqAWbWRXTjVEfRYC00Ptnv0FDKexvD8H8Jnav5
         Urf+QFcPqGcBsJBAD3aZilOKt7hU46T2AhLxfaVVcC2vf/4xie+xrDONXdORA3Ws3mZB
         9DXTguDB8AhrQD5XGHtoK1vUPrS2CPBzgiFDBSsr+GiDWz/Vu02+HfodWroPu92BdlUF
         I3HtN8vQ7Bja5z0YNv3GYSrNo0DPcX4/SruaFzeygmgKyXjZ7ZeDLzpcA3o1pvnAgxiJ
         LKrw==
X-Gm-Message-State: AOJu0YzoNlaRfuBKwixwlSZCoTuYRMlzdFgIdTKq6a1OnooAb7k7lbD4
	pKRQPhzF7NbBYRxdv5/rM1o9mFN2AJMWyLsJ4qiBmrh8/2xGbAgbeTVnUOa94/TeIVL2LKBssMd
	XNk3IZAhYmy1X4LEl51fZvPrYk4v0Nig=
X-Gm-Gg: ASbGncv3W7DtEY3axenTigA2W+MwTi9tJ27jpaWgbWHB/eA0P4Ei/06gQjIfIeor0PK
	u5GHKxSufE6DZX5lONXmmeVGRhT/nHPo6n8O6fv0T3WlE6XhnCk7zty5xl3A21vEJBFr2/W9dcy
	OOM5vUHbngXMSlHZxOrm+qyL9/xo2Tt76FpD35lRCLHiU07HSgWHW34JsCV41IWZ7oelm3mDdCn
	9HGla1QB2VE79m2Dn1pgd0+n1iwW7sluWzcmCJWnhybCpcgqVhz3e5+KRTwGU2bwBnK2sSd4WD3
	bP/HfJDOvZWLA1OiUthh4x2ZwQ==
X-Google-Smtp-Source: AGHT+IEP4KYqs1xKje1fi1736xf7IOzQ0zTuER/dvSVCGv+BSykA10hu16Op3hlA+dmkfWVP/lYeitao4BB7JdM+XHs=
X-Received: by 2002:a17:903:184:b0:253:a668:b638 with SMTP id
 d9443c01a7336-253a668b76fmr85847785ad.2.1757448367489; Tue, 09 Sep 2025
 13:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909170013.16025-1-work@onurozkan.dev> <20250909170013.16025-2-work@onurozkan.dev>
 <CANiq72=kWpxpo23JUYTqxwpsY=E0uUvCHgotRuepZpL-qUqXqw@mail.gmail.com> <20250909204308.74ccedf4@nimda.home>
In-Reply-To: <20250909204308.74ccedf4@nimda.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 22:05:53 +0200
X-Gm-Features: AS18NWAQRmJ5WxK5ELCNrAW5yN6YV6IFiCPcnvtVOypshoCFMZlLMyJBUIE9lPY
Message-ID: <CANiq72=NrS1cFJec6sm7ZY-UPqrzxHKVvPu67Rze02Fg_xeWpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] rust: refactor to_result to return the original value
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	daniel@sedlak.dev, dirk.behme@de.bosch.com, felipe_life@live.com, 
	tamird@gmail.com, dakr@kernel.org, tmgross@umich.edu, aliceryhl@google.com, 
	a.hindborg@kernel.org, lossin@kernel.org, bjorn3_gh@protonmail.com, 
	gary@garyguo.net, boqun.feng@gmail.com, alex.gaynor@gmail.com, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 7:43=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev>=
 wrote:
>
> That change was incompatible with v1 (due to the different signature of
> to_result), which fails to build with my patch. This version (v2)
> fixes the issue introduced in v1.

In that case, please try to avoid mentioning "broken" or "fix" or
similar, i.e. there is nothing broken in the tree itself (the commit
message should mention what is done in the patch). If you want to give
extra clarifications, then you can always add them outside the commit
message, below the `---` line.

In addition, if the changes here are required to be done all at once,
then please do not rebase on top of regulator -- this would need to go
into the global Rust tree. Otherwise, any changes that does not need
to go at the same time should go separately so that it is easier to
land.

Finally, I am not sure I follow the `unwrap_or(0)` here. If one passes
a negative enough `i64`, wouldn't that mean `Ok` starts to be
returned? Currently all negatives that are not codes are supposed to
be bugs.

Either way, I think this should probably go on top of
https://lore.kernel.org/rust-for-linux/20250829192243.678079-3-ojeda@kernel=
.org/,
since that adds documentation, and thus it would be nice to adjust
that one to whatever the generic one should do now, especially if the
semantics are changing.

Thanks!

Cheers,
Miguel
