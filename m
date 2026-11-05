Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793897348;
	b=cm4nBEkBWSyG39jj56Q9lduVjM1Xbx1+C+h1IDmaoPFmhNfYtcnBDbcwqoZfauK/eMpB
	 mjDR/fpPy7M5/SeS/6Ot343yYyvVQtFE8BQIhAarhCfBz5fV0RY3/vXcbtmEqNrZJezw/
	 6kADgdUS4X7LUrwyvfSc6ajzSMMIqh68JZdqq5uqz2lEK7uoxFxAMa/2whb3Zys++SRu2
	 UXxoGKmlOyUxRLcH6dxsOA5qQvkkU7OtMAQd8RtfOaYuXwOpa2dmy7QCjhyALJTevJAhP
	 9lnW1IBcrT6yk+vdgfLhcBiHataBmGS/LReVIAvsO5b5bZjmoEOEjvmxouW/KCjHwCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IofCeiQ6JCwrlt7o+A0pBeIgYyuiwZInCjl1yfHCeTU=;
	b=G9ifjsuioj5UcH8VxxmNsoF3ZhdLyulzmxTj7U+SY1OL12zzTj1BtCLQaF4IqCxF936h
	 5YCGy1My0z9l6K8XJhI1fYgR6Ns4IVaZq2J8e92KLAuU9HbG+smb0hby1ePvXtVay+yIU
	 hAvHngDpZzpT+VCGnm7o4lkPCzTR/SnhT9cwa5r6sfXg/iryR5n48J6lft+qWqXtshebB
	 9G4Lc2M/u0Ivs29xK0vwg8bndP2UnWwNkY8Y5u4rRhSCkU9rIwsDQTNKCx/ObekSt5JqH
	 kIzNX9vtYS+DR2y+4eY1/EPFhEJElWPxKJ6OGIKCjjdyciBcOiyTL4gLjIgAvPzR6HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=alanderk.com;
	spf=pass smtp.mailfrom=alanderk.com;
	dkim=pass header.d=alanderk.com header.i=@alanderk.com header.a=rsa-sha256 header.s=googol header.b=qSOwI09+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0BD606A328
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 16:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D0BD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alanderk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alanderk.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alanderk.com header.i=@alanderk.com header.a=rsa-sha256 header.s=googol header.b=qSOwI09+
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490f38e9688so829469f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 08:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793897346; cv=none;
        d=google.com; s=arc-20260327;
        b=He7izuDrdQfPGOYaoIitdhYvfIKvWaYNB/1y9JST8shf/oyJEtAPB2C/AjsDAflPDv
         Jc5I/HqwGY/9lIuAl9/IWQcWqiHU0C4o12OJ8QhcFtiZqioQEaLEXxKdkvXXiQW0P5Vf
         kO+RBiLVYmYr8n1GO6fFTQlmhZcW8sOcJgATvkOfuTPfdN2B0hPgM0XNrmgJO2/u3CAb
         7nKBD51hOJKk6CGDhdVml5l6dVP3QdjUr5iD9iDHlJ8eX0f5jkEhE2MqgaGUswT+LiV5
         +y/NQRO/hnRwuX8F+iZET6u8UnPoYMKzRZi3uWmnKkSAHKt0ycEbNwTrFXHPlmVl/+96
         PTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IofCeiQ6JCwrlt7o+A0pBeIgYyuiwZInCjl1yfHCeTU=;
        fh=Noczy9bAgJwwkMCwRx8adrDH9mVIkDm6TAN59MD0hU4=;
        b=YUlJiSypk+f8sXMTQfIJb0g11n4UIKgTBl4Fa7cqU5ruOoaxxgl++3DnnG1QdBUORT
         Oewjt49OOOS+Fww2bfziKBi88Dp24PRPgO/k1KRzO8KQodZLxvUisJ0xsfJcY+kFlgfo
         QYAxbWJK38mRUjphtFdFG4wdS/R45OlDsUPtNAIQi5NTQQOxpnZX5eU6FX1mBOAxUY1y
         Ep9cwHxY4aM+WlquK9/jpsQPH8uJixHRXmnndMuGy90CvcPfjTz5t1yjbKHtrSQTYBZJ
         CrHq9PoLDGjMpwEAPQGSTGwyukej/jF5hOLI9Q2A40OUFDl0FCLmXtMrwdl/KcyqzplH
         0tkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=alanderk.com; s=googol; t=1793897346; x=1794502146; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IofCeiQ6JCwrlt7o+A0pBeIgYyuiwZInCjl1yfHCeTU=;
        b=qSOwI09+JE7d7rKoZkTU3eUrTNzAE9STFkM9DkSP5Ze3kh3+lGIldrds9BDVDerlYw
         pp//qNE7JkxJL9n7SS97rNb+FPrL+U++gh0zccNBXcjvS0ZIgjvaT0ub4l2dWeyo+RWZ
         Cqv1YScQhGQYy0+XyJcz2v7G0Zkt2vrkzNBiCVOyBg2nsT/fVxGjNEyZFPYcuPic8MAY
         FQ8EAZlWN935gPO0mt5Mcp7TvdPRi+uJgXfyH2E1b7WcwlhUh9x6ZOWSwrghwqktlIUJ
         /4/1d/HG1aNeX9bfvGugyY8VJ6bAAwVbhSD7dZ+72aWlA7HmPb1BZjCm0DCbrrPRMO7l
         t2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897346; x=1794502146;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IofCeiQ6JCwrlt7o+A0pBeIgYyuiwZInCjl1yfHCeTU=;
        b=OcJC8Fc0qpKURy0AEmoH4S59a7GstO3EtsJ6UHLcK9wcePGTPiY39/3GefJluS7KRQ
         x13N18+qvVr/npnx5XF6B8y5mHDckA3HuDW86e79sV5VKL83eHmyHjJkP9UeSgDxMSsq
         jOKjMKMDYxKBZcJkROqR8yhNXmy8SJJevgupXqJFLxjICbLqScoUM4ulpL1q10NhoySr
         a7XLec5vPS+K6iOnFEY2yV9YyGlh9k06JDCCKWo+5/IJgB18P9PAmdFVrgpQeAIYM4rQ
         CwcEycQqJylXd2jeXstHvQFSWBQwDoZm489Oo+/udHK52AKRsbIh169Flq1OFXlAbq17
         DLsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUH/JvJETLTZK8yNToDHhld5xunEfWH0jXYX8DmUKenIHeGxav6O0D2C3vIlvdNDfqoivM8cj7hrwPP9gDoQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wvtGmxnW6+piGuAJ9pNqUyVE8QZUdXt1XKxCvM+pgtvdUnO91
	1QeCjBJoUOZBEBLAdEkUc1YqfKEmNyuuzwyhw4+WKvRColfdpc67hzL+C3aZoDO49cSY2pCP2J4
	pHK7BRlFb/REq290mbtPJfNBtfOxjNfAvOO9MxFSxLA==
X-Gm-Gg: AYBFou2faZ6ZSJnXCMmoWdhqIlRLL6izwlq6Q79G93DuxfN+z4jwd1roQudEoZX1ZUL
	eKsFDo5mqxFW8fs8R6lRpj1OBwtDAWvv874M3Pfa8yGiIhM5c/bZ8NVVxYcafb8WMflmk0fpYCM
	gED+Oo9tGo20DI6TgLU3/wo0ojyhxT7xqMrO0NyIX6r2kS/C1KhjxhNALxnR6BBDfFqnWMRn7df
	oC3HiRWNHdZ5bCzq80kz0VDgBt7axhwfO52KExv8dZcGoiUXY+IJzQNCUNLceYm8Xc20+HuK+zY
	NfwI25NdVbGyQaQBKhTCW3bFsFaJxM85IO+k53ALrP99cWrqBqLyb/x+hIQ5wbL/kesCxRuBDyQ
	fjD2GN6GOpOi/0l2uAei0SOYMLBUdUu+l59pSB3JgvQuuy/sL
X-Received: by 2002:a05:6000:4a1c:b0:490:1395:9b00 with SMTP id
 ffacd0b85a97d-4911906d26fmr6264775f8f.10.1793897346089; Thu, 05 Nov 2026
 08:49:06 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261010005227.976-1-linux@alanderk.com> <87dfc1f8-6ef4-424c-a48d-62e935eeeb28@kernel.org>
In-Reply-To: <87dfc1f8-6ef4-424c-a48d-62e935eeeb28@kernel.org>
From: Alan Derk <linux@alanderk.com>
Date: Thu, 5 Nov 2026 07:48:54 -0900
X-Gm-Features: AclHuK8vKOu24Bc8kFqanAhzIarNQKxJATur1LwcU5SeZGjflO0j-bEqaeTReYM
Message-ID: <CAPLSpGbV5RTSuMZPX=UgzniPtoT7jup7pCGw_Rt2tqiejKXmng@mail.gmail.com>
Subject: Re: [PATCH dwarves v2 0/2] dwarf_loader: Fix --lang_exclude on merged CUs
To: Alan Maguire <almagui@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Alan Maguire <alan.maguire@oracle.com>, bpf@vger.kernel.org, 
	dwarves@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 4, 2026 at 7:38 AM Alan Maguire wrote:
> Thanks for doing this work! Sorry for the delay in getting to it, I'm
> looking at the patches now.

Of course. Please take your time on the review. And thanks for the
background on the Rust BTF work.

> We've been working on a solution; essentially, the idea is to detect
> such cases and fix up the type graph in pahole using a new
> "rust_bindgen_replace" feature so that the final BTF does not have to
> carry such duplicates. It will only run for Rust CUs, [...]

Patches 1-2 are general --lang_exclude fixes (both reproducers are
C++/C). The Kconfig follow-up keeps --lang_exclude=rust, so it is a
stopgap: Rust stays out of BTF, as it does without LTO, until
rust_bindgen_replace brings Rust types in. I realize it may not be
worth it, though it would -- if I understand correctly -- unblock RUST with
LTO and BTF in the meantime.

To check how this series of patches fits with your branch, I applied it on
top of pahole-next-btf-rust (b5e46f8; it applies cleanly) and tried both on
the 7.2.9 kernels I tested the series on (x86_64 ThinLTO, full LTO
and distributed ThinLTO, arm64 ThinLTO) and a non-LTO x86_64 build,
booting each in qemu and loading rust_minimal, rust_print and
kobject-example:

- With kbuild's flags (--lang_exclude=rust), the branch alone fails to
  build the Rust sample modules on the LTO kernels, as patch 1
  describes. With the series on top, all five kernels build, boot and
  load the three modules with BTF.
- With rust_bindgen_replace and nothing excluded, the series changes
  nothing: vmlinux and module BTF are byte-identical with and without
  it.

One thing I noticed along the way, since it's the merged-CU language
that patch 1 deals with: under LTO the merged CU has one language,
taken from its first CU (a C or asm file for vmlinux), so
cu__is_rust() is false and rust_bindgen_replace doesn't run on
vmlinux. Without LTO it replaced 564 types as expected.

Cheers,
Alan
