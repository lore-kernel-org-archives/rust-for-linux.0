Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B56330319
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760705943; cv=none; b=DT3CmukSHmLWMwT76kWZOywmSAQUnPfw2q06o+wSmIGR2WdGPQtFETQwCqCysAdtuZMl1nB6Qi63s0mcR8czDdunEz5IsOipN8ovD0bVyepEi2+NqoKU56/LhPETXRmhn+ZS2q3l1xlXaII12NAWRD4C1Oqtr6VTC/InSb5oOtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760705943; c=relaxed/simple;
	bh=wdaJhDzF6IgB9mm5dFvdvIAv0KyueRmfgU2WdqlbxQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZhu/uIBfbxkAOD/lEBamg9NecEXTjR+8c930feCf8hTBApSu5uvECK/0sN51hx5ZS7iAhsXfyTwE7XW84gQIcdWYL7y1v2jv9f9wQysE33uNuC7f3vBVGEy8Rx6LwHEMXApBkoNs9w2M86JyOVL6FUA2+A5Biuet40PD/k/8yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFJbO20H; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFJbO20H"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-290bcb326deso2943185ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 05:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760705942; x=1761310742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+GDXTh9IMAF6qAKXPQhRIMU73VsMP3gkKTvitOd0vY=;
        b=BFJbO20HQ7l6DSTTITwtnAtzI3mOtExQvfwwekOsjrMBxCmQ7YcD0SPQZ5ihBj2hRg
         SzEU3aEcmJ7bGUGhPgW4586JDvQzaf57bzUHtGMzM88aYa5mHzA47qOKwoYnuY42REAH
         JrxIfWT/r+TlpPr3+uM/CijeDcXxVHf/v7k1LFF3OpEPbzhHiicMJbNWa8l2nwv5F8DJ
         ckUKcSYSBfiw4axRRABb8dokP/QjXRzK+ogbuwri/IK+xVBAT7QLHKowepVM2Mrs6LOG
         N8D4AFBrfzPKlvX/APrgeh5DPPfESwQx5HpuUnE3Ii6Cco+I5+jLhLpWMxYHaiy1cWN5
         KdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705942; x=1761310742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+GDXTh9IMAF6qAKXPQhRIMU73VsMP3gkKTvitOd0vY=;
        b=fJUfBxkWPtzW9xSkro0s3he8WcJoEDnwqI08QpbMJFmCgOnE4t2jWmjMR+iTvxlrgY
         IXC9xLWWlqF3a3ByyDQ9KwRmJCFu8BSQxYvTpH0Ac6FoWBMOl6vfmn7o5Iz+hYZbrXB3
         n1BB7QugPvdcIXFu3rLzEaLoHLNeo3fmuhdhU0l3KYSjw7MaepgnGN6rRm26gHfYkPlF
         p89otOOqjPFK+egv1CJrVOdF1HpveRbuKOv0qZMyGCCEPB4vhBrstZuAwcfJrMVyK96j
         nVSlK8DSYbxpzUkB61oXK9MkgGPWMJ0gl/pggGHpyXgmXM/q7Smpi1pJr6zE6HG6Axmq
         qBbA==
X-Forwarded-Encrypted: i=1; AJvYcCVnDHdvW8mMXGgW9CBs2UGY8NDKPxRT+uFyAXL87MLL21vQkJZs9PXeNy1ch5n9oAOZW5l9GXXiQOIejE0zGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRjlqtOMm9m/XSs9xwjxSqbcAu1qRgU7UYRgYbCBH9FxRHz3Zk
	MVU5L+YMEaHkMCiDHVhs4EcrlgXguDAfUnWQV2xtr6wM2YjPMceZYu2yz3YLhIVzFUQGCL+P9dt
	6SLH9v2kJ95i2s7i5xflNUlp7m2oBwjE=
X-Gm-Gg: ASbGnct+Pg1o3jQ1YTuJZAMJUoNxQZuWusFQ/WcDsoBOSP0gNiuBxICNTBtjKEL4TS+
	Z3tXsdrswkcyLLlvWSaXEzqo8V+Qfz1Wp/2g9NAOfv2CCK7VcHqysrX5arMU0AepRTRtnX3eIm5
	cslDhfy5xTc2keHQM3tZESQPjEZRtbFBPRF68bLafVbA/KvNvFIlrygO6jCcZlD97CYfbDJ79lP
	lv7ShF8n/exH311ra02BnwitXzdYyW64+alku2fyTI5eUkTsl9o6f61dhxjncvbGsEnax7WrDWu
	mis7HWNAEIItYrWNgaLPHkn0+w4tAfM/lQU4MdSqL8nCsxqOWiH9NnsYSZi/JCJWa10JOElLKeD
	hQAeaQtoWdTmioQ==
X-Google-Smtp-Source: AGHT+IG0yVbVz6PU15YPk58/aiGkrTO/zzRW/ADndnvIRt9TdYJL8oeNwG1bAj3uxBZfIAJqiq89SaYPkqDhXWV/OQ8=
X-Received: by 2002:a17:903:2f87:b0:290:af0d:9381 with SMTP id
 d9443c01a7336-290cba4effcmr23294985ad.7.1760705941669; Fri, 17 Oct 2025
 05:59:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016211740.653599-1-lossin@kernel.org> <CANiq72k8KmpFyKAFZ293GDUWx5=HJtksR02hTU8-H9PX7xsT+g@mail.gmail.com>
 <DDK2SA1D77HM.38KOTOTF8FJXI@kernel.org>
In-Reply-To: <DDK2SA1D77HM.38KOTOTF8FJXI@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Oct 2025 14:58:49 +0200
X-Gm-Features: AS18NWBRgxavDUIsOONY5KxXV3HbEeszryCEDttHSa4OIqY71guXK1X9kJ5nosA
Message-ID: <CANiq72=Qh9sJLKwACr_McnbGdu8JfzqDuv1AgCjSdwKtt-9Gdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pin-init: fix broken rust doc link
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guillaume Gomez <guillaume1.gomez@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 11:47=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>
> Thanks a lot for the added context! I will add it when applying. The
> `__pinned_drop!` macro will be gone with the syn patches this cycle, so
> in this case, we don't care what the resolution will be.

In the end, it wasn't intentional, so Guillaume created this PR:

    https://github.com/rust-lang/rust/pull/147809

Thus 1.92 may end up without this change in behavior.

Guillaume and I also discussed the possibility of checking these
things nevertheless (i.e. without needing a second pass) as well as
the related topic of having a runtime solution for toggling
private/hidden items (and thus getting them checked too). We could
perhaps try a custom thing in rust.docs.kernel.org to see how it looks
and if people like it.

Cheers,
Miguel
