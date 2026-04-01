Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3983D39A046
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065000; cv=pass; b=aOgSwO3CzvppXiJhJBDBAjWR85/3h4WI1Q+01vNlZX44HU+WhjFGQYcdLcOsY9hisogjUHxOjO5wLdX0Nw8t1126xqJCjSpKfKjyf8ySzzJWOFN3+DubNLSBYiJnrx0rqgx28ETFBPbx+ZMBaKNsxHyz95TRtWZUdAqf589LIlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065000; c=relaxed/simple;
	bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWZC0YERdfOJ13u4gPXlFLbijEK7ujvnCzxGV4/aJRrRLUqUeagUYVeDzdcq93mAUmc/pAvcqX7Bv1PPdvCTfbiWr4deHc01m7XrBgIcTRh+rWNprkYjvUzhwCI/hdFkhrN4lUdB6MyrtUWx42KZMiKBPWZg2C3BN5dluTRtdeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m47/sJ8V; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m47/sJ8V"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-127337e3870so2888c88.2
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 10:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775064998; cv=none;
        d=google.com; s=arc-20240605;
        b=EqggCtigJ9qYH9mqnnqWryXW8c6VTXfO6I7Y8ndgF8ZQR8bd/gBsR3FiLdCM/V982Y
         V3v3hld/2UvUQF7C7Qg6w7vxJ9qL42j7LuGQ9OXErjPuKJuPFlcJMOb3mq5fLQsWUEcA
         IDC5dE/QTeVCNMNUt1Q99/MOA/ZG0nKyE56y/0V5f8XjiTMzs7hsPY7RsqQ7tlaCvxjz
         y56eledkHUkx4ECn8Nk160zWO8gA5BxaZh4v7hbQLYrj3arFR2x43/rjD3Hr+tf8Suse
         I0ahbgLBVerv4kj68jNE03Uo170vTpT4XSGZVgzP6RaGYBF9BY+dfznP7rhOrvUUhKu0
         3cmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        fh=rMstfXqhYB9c/iCn0BRlzQxJDeuKVE5SVz5U4CxWSlA=;
        b=DXuvcFcewk35wGbbTcAahw3b5ZCY8X4P0EFfMvB0Lee6Pn7Zjs+8+/pa3ROeR4pUoy
         +G+yU4CW9j+8Vzl9pFEjz/ifppT2QYLhJE5IVy/6VHbLFFhieFvBQ5iyz3WijXwyIzPg
         6V/VW0qoYEkJ/kslsgxhzUkU/rRK1VRkTLk9X41BzM2m9hP/pl0lx1hXGollLwPK92uq
         Fb6F00UXgnF1697jYQpIVwluCKaA1QwpxoYzNtkmG+2uE95LQO1J6IusT1dWuI6axYrH
         IPEfeqgBEiQhDQXPqZkM1CEwYNc6jQ63Cny0cOZETSgMyWzs6gISiCxYyBKPeHcj9x1C
         G0ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775064998; x=1775669798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=m47/sJ8VF5zmkEbgvymxRwXRqMU1Z/SMQ1njp0gn1sBAbbZeHHcDZwn9Ov5QCfkASU
         IYCyXdshryWiChJCSKlCTLKnWq+cjV+SueJ0RS1kudCFliXnb1YcC/VNmS/glt0Ym+18
         i/hh7HaxM41rZ4fLKiMBtU+DCN5UMWtHllNzl0Lq2ZOhVCOgWKY9f3iMAc/ckyFgm2bC
         phA0/vIEnZ/8ZF/59f6s1sC6QR0J1Nfm78sLyH4nFLXJ5D/XhZh3PjfHWL6vp/vFlaYb
         FqY/DKSgpkqYWCMJ9Pt96U66Bk6BJy9seltRXj/JzBJfl/oFXs38w7bGYUrJGgoyxxWP
         wbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775064998; x=1775669798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=kbccLNn/tz3hQ7Aj0mFQoZ/xRj8Nyx4Z0LSH9fdaflJjtoWtbHB1lvhVTlxI2xAcS0
         J2fsQfcoWVB+s0FrlmXbTGBz2vS1OJMt4VKcAI9r9gUeU7/a/n5seXqMXfMAZq+K1og/
         tniOApkLIOONWLi2OcWy5ATYcAx6i3lK8bd8LXYib+GcBFxZxxa+VFn6vek57bxjGtcx
         N8e6iR8u2xfQy3BTyAx+cn5DCzMsfZQurhN4LsO0VInqBhj+tSkBxDg1MLw+xkvEKWLa
         vgy0CcLZ3wolK+bCacjBnEqjp/6S7dE/n7ZOqFVBbHFNZ4ZC0LW4c8NBTYOcC/d7uabg
         uuww==
X-Forwarded-Encrypted: i=1; AJvYcCXC39ecz9lcJ52I1EhNZZDD/u8FoAINyg9SDY0xafuapP8P/xE5AqD6sTyzfiuy0wFv9mQhCBvvs4d60pk+KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlDh4RfF+7/ob2uq4vlf5sVGPMPKVVUJrBcQJmUUYDkvZiPUGZ
	YSIR8Tr9ZswnNNwGadcR9JOCcpxt7nCGWh6jcsrJIUBgMRwiyc3L2TDwWJDReio5/RHZJq7xWIv
	zm1OW09gaOaUfHSs6714RUZgWyrfrDms=
X-Gm-Gg: ATEYQzwaGCHZ6jymPtChWpPCLOvN8sn1xGTPaC58pS/2hsjeeT83TFk03YjgFu8iXue
	gLwHnWCyibyezOlofXyxqXWEfWfmVUaNaMHsNgxeTEyDFiRJp6jEJoj2DJ4O3UvDCNijGw4NhUK
	5ihukuN2DLCmZNK6u6C4tXNZmnmtnj7yu0InbCRV3zFu8/LA5RPE/ToqQBRyMag7R2hyuHSPxUo
	vmb82zwgtDcm4QCJTKxrniQphhz4drGsvZP2wOyHSyMhGRZgo9sFl0d1/pJzhWvVQLXxuHl9pjj
	LwbciKzCm88rvY3J4OvRM+w2dvrjWBOkZxNj8vShnl86mFhzW1t9fcTNvaOSLW5CG/fXpkL9ZaL
	QRwvAJB55X0TZC5PK/lJhstc=
X-Received: by 2002:a05:693c:2c97:b0:2c7:2cac:8162 with SMTP id
 5a478bee46e88-2c9326aa500mr1010168eec.5.1775064998156; Wed, 01 Apr 2026
 10:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-9-ojeda@kernel.org>
 <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
In-Reply-To: <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:36:25 +0200
X-Gm-Features: AQROBzBeO_yfCUmMruxpBPrHPRt9Z-RBtWsQqT4MIRVUyc-eOkOj6bAx0WG8aNs
Message-ID: <CANiq72mnnro6UD3SYgTOG+kipwkTBvbEAGH+jXUa3kLTUNje2A@mail.gmail.com>
Subject: Re: [PATCH 08/33] rust: kbuild: simplify `--remap-path-prefix` workaround
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 3:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I'm not sure that I parse this. You do remove the filter-out completely b=
elow?

(I see you saw the other commit)

> Looks like this is going to conflict with rust-fixes (which adds the
> --remap-path-scope). Perhaps worth doing a back merge?

It would be only a couple lines conflicting, so it should be fine.

Having said that, when I was doing this, I wondered if we should even
consider keeping the workaround. In other words, locally for
`rust-next`, the "normal" commit would be to remove the workaround
entirely because there the flag doesn't exist to begin with (i.e. the
workaround should have been removed back when the revert landed).

Then, when conflict happens in linux-next, we can just keep the
addition of the flag from your commit -- the rest can say as-is, i.e.
no workaround needed, because you only enable both flags in a version
(1.95.0) where there is no need for the workaround (which was for <
1.87.0).

It is also why I added the second commit here, i.e. the "make it
conditional", because I was testing that indeed we didn't need the
workaround anymore.

So it may just simpler to do that. What I thought was that perhaps the
workaround is good even if we ourselves don't pass the flag, e.g.
someone else may be passing it. But the chances are very low,
restricted to a couple versions, and the error is obvious and at build
time anyway.

Cheers,
Miguel
