Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C509156C69
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 11:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724411417; cv=none; b=pZnEgBdsnJv4HmLApfw8j2Q6iWIIbsprQ31a9fBAHE/1GtYrxDpR6hnNC/srW3mTHZKcFYrXS2kP5lhkaK4pUs54s5U+YvkdE2UaGu24eSeuTD3vwM/B0YD64ay9PqbYBdTSTx1HinypPPh7xLaV60BQiZ0H7qhJy+9rcOtTKkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724411417; c=relaxed/simple;
	bh=ReeI4s6+qF5bV3tgr5n/AouGQXbJo28yIppO71OTYvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k273wuw9T8dhsIqNu5X+YcVilERqznedgqffbX8jDyCf3eaZQSiR9Yf6qdotlWNjUsuGucYMEQkITezke8pd0jEfdbPYRm2ULT3ex1DlkdSDoSZUOHZDk7seai2RzkeC6mCboBQ87/raYndRVGWjPYFe7+yG/dOcp7qsD3jq0Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BOaLEFRD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BOaLEFRD"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-371afae614aso906412f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 04:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724411414; x=1725016214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReeI4s6+qF5bV3tgr5n/AouGQXbJo28yIppO71OTYvU=;
        b=BOaLEFRD4JxBiydGebcxghO8AF+ejOT41fbJE2V9uBW1+Yg68t6RDoOuqlnRwkd0ZL
         uNGsy+wb9/1e/lYRjjveAVZn3j/1PKZjpKaFhLwPS7CGFCuH1IG4OFnOtNi1/nstkkjJ
         OgpEH8h3Z8AddVHZR2ZMx3G9Sna9Qx44n4JEL8gUhccpU7JfUn/YV2Cw9qdSWx5f6m7t
         cjWVt4Pc/Sev+2vaNyAN47PVZyTXNp2rnfo74EflqpQiQwdqD+1wZu0PxdQrJh3LGVS6
         6ORXGCeGwA0CegdPYwvzqRZAYl1NRv21phHavPilVwhUnqCDumiTmAU2b0hedFxylWI6
         EvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724411414; x=1725016214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReeI4s6+qF5bV3tgr5n/AouGQXbJo28yIppO71OTYvU=;
        b=SdpU5spWlH9Q78cOJox3FNTIGPHZGwTNPGgF0aYUT7xqnNk88YfW8i3kFIRKGAZQRL
         7W8GLANw/RLI834p3w/2MNcgEp0qVyCx58d57eddQsDTrRVcrHeWTJe3b1J7c6f5NCIw
         8q1MyKFDaTvVzw/A+d8GzsBBvKryO6j0SVT7x/QBDo2DcBSWD9+JJT7JcpnDYOy0H65a
         7Y2zSwEVAiPmJDAJoKDGuKkkAq8xtGBXBsqioOsjUFxcI+GYLf7UUxAP1lrqek7bRveP
         rDHm7/1L3iRBz8GSP9WK2ynp8tojOxX7Z7CySzKdT8tIEC2fQi4fERBmpsogWGsqt192
         dwXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuUmGGLhgBDZX7/BIol6IK/syE4cLpHRQuMSCOEpjFNM6vwxppygqQesQhZ4/xI5SR1Yl7ZM2kzoNS5TZgDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMZ23TVoYOJiL6UAI42rsxaMYEAJavy4rdF3Eg/cJ5CilzWtHC
	dSzD3jDHP8B+dQILXxSDdjst81krhq6MK66PUaU20xB476M/YL7N6p5JSuV8KOLNBLx2kRSlO0Q
	SRGStAn536wGDliYa+upLEJbeZZt9Y/YQhd3M
X-Google-Smtp-Source: AGHT+IFxnNI6hIRfLr8zjmmLCONdLPArCYnTTrpVH1QypHa6cWS+nkf7glv9CxcV+oX05jJ7qlfZCvYVo0OIXTNEuIY=
X-Received: by 2002:adf:fe09:0:b0:368:327c:372b with SMTP id
 ffacd0b85a97d-37311858570mr1093585f8f.19.1724411414133; Fri, 23 Aug 2024
 04:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823050359.1737893-1-workingjubilee@gmail.com>
In-Reply-To: <20240823050359.1737893-1-workingjubilee@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 23 Aug 2024 13:10:01 +0200
Message-ID: <CAH5fLgj8dVUrsin0PTBxFDd5QsRf_QGfPzTosTZk2iP9-hP_Hw@mail.gmail.com>
Subject: Re: [PATCH] rust: Eschew `Box<MaybeUninit<T>>::write`
To: Jubilee Young <workingjubilee@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 7:04=E2=80=AFAM Jubilee Young <workingjubilee@gmail=
.com> wrote:
>
> T-libs-api has consensus for stabilizing some of `feature(new_uninit)`,
> but not for `Box<MaybeUninit<T>>::write`. Instead, we can use
> `MaybeUninit<T>::write`, so Rust for Linux can drop the feature after
> stabilization. That will happen after merging, as the FCP has completed:
> https://github.com/rust-lang/rust/issues/63291#issuecomment-2183022955
>
> This is required before stabilization because remaining-unstable API
> will be divided into new features. This code doesn't know about those
> yet. It can't: they haven't landed, as the relevant PR is blocked on
> rustc's CI testing Rust-for-Linux without this patch.
>
> Signed-off-by: Jubilee Young <workingjubilee@gmail.com>

This looks good to me. It should work both before and after the change in r=
ustc.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

I'm not sure if this should have a Fixes tag? The original code is
from commit 08d3f5492879 ("rust: alloc: introduce the `BoxExt` trait")
which got merged in 6.10.

Alice
