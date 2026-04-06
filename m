Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905793358D3
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 12:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775477711; cv=pass; b=uaRK8mp9YiQEetONFbmeTE8/OO+sBwlCJHWg3NP3QbFVLL2LFJi89AEMS8m5iKwZ1FisLYRSK1JkUmCUa9NWFa0PGCKLg+Un3uE5F9sPJ39QegzvrSmCLCILhcgtu/NB6UkBTCtzpDAJaKS5fZKtXdJWvp4bBJmGzidRYUsjXEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775477711; c=relaxed/simple;
	bh=qJ2Ij/rmwDhNzOnqwVs9ZSygzlDoI7uvHjvjXeA7kbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4YhG0rl+8shz39fMEn24DUuTMgQWHaZOZSGQmRwXW7wnGsq553G2yZhse+SCg6vCN5puUBeai0xJfeGDLuH9FLih5mzYWq/F0IADID2rtzyPXHXwJhhedKgK0k27Wi7IQFQlGuWton99ztYhu/8yuAO69pJFhiJMGzvARfBOc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbT0Rpx7; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbT0Rpx7"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bda3b4318dso242439eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Apr 2026 05:15:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775477710; cv=none;
        d=google.com; s=arc-20240605;
        b=ZJscOcPusktHP39RAkdMGKWU3TBJAaeXhRNZiifZHPL+BThJWGm0yU/qul0K1gsDSb
         rkAYM3MDKu/sNy1VOi3iqGwnK8DXJuRPWztLJ255/9oazy+3LSPA7ls+qIYjtoE9h/HA
         86GmnFXdd5IPaXZUeB73q21Z1EcFmGOzU2tzqSzGes3RwgxFn2gCfUeuqs5q6evU6CWe
         mH8Qv6fODBDiupPTZz26Z97DqxQBvVQaoiYjn9OLHpODUAw0/f/NY3RRgdqyAVPzSCp1
         pcrf7aAAelcc/RH5F7P9+CzT/6Z/3tVbjRzVEfD2O6ca+I5umhbooPcAzemsvYry8K9K
         TDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yVujOBFENNXc4iksgVxJQep5YjA6CAEaHXJGbsWmT24=;
        fh=hZgt9/NVJPPGaLn7PPYixzKV///mDjBlkCcLNmp/PME=;
        b=OTGydPp6Y9KT6YYV7zxcQrbfRYyly7KwVDS7CZrXPFxmo/WhNV/4DCSBuTyvx9p/aA
         clPsmZEVnILGGvUGdI7Qps4MlVpnvujYqrm0iSJh8XeYYbhBvHBIxZMXzh/S1Y2PVMPm
         Xes0SiakYWVv4HjsMtYnPDOZE09qR9zFVqXtTg+4MSDKDJ1VTw+DFdG5JkR62fKFitTt
         0avBYgG1Y3HEp+oDeF/u44AcJLBM879bHknB0MGtm6Q7/BZwVLOPz0lF7Uemfq2Ybm6l
         5X31BDWcqVLzWRyLH2QljmnuoOhpOVDPy4eJULLxdjS32mOAigpYxZ1GAvT4yJ8Qdhfg
         rinA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775477710; x=1776082510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVujOBFENNXc4iksgVxJQep5YjA6CAEaHXJGbsWmT24=;
        b=gbT0Rpx7bxIsTbkoqQf1PxNZBuiOgKii4SXxUIgxUOmty4yFErBwBlDOgej/sYswSd
         WzB3Nm7a0Bfp4H6WNi+we8Puk/ibX1O52yn4jw7JPpOm36nd38ek1F48XePJhCme45S/
         05Xy/fdbzKvmqO5vxz5vEiP/X5f6qwPF1nLHAeOtApia+C9W7k1DNsNY7DUMfjbzc1G3
         wpnXDIZklWIzROIL4Lq/DyjsCDf66PVcS/H2OgfmN5FQbGiTbun+H7BjurspuY+BN/o/
         1aj0u3AHlxgup7TlIak4nnH2iTTt8gtPdL+V7iRXu5yTMoJke12giSzCaJ2NP24fh0Ua
         6u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775477710; x=1776082510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yVujOBFENNXc4iksgVxJQep5YjA6CAEaHXJGbsWmT24=;
        b=nrEovOGeNS1B/XFl0Wg2/cG349MnhPp2evZdfL07IVHFN6gWIObg58Ghjz3DtsdFx2
         nn/vtmF/1mkSLzqZoqv35BT9Q/yNCJzhoF5yOztb5OEEFDFLGsW3GfVKN/3nxsRMQWlu
         vdRR/dfGFZ0UYnvZ7UwNtd3Q9ENFWJO1BNlZFBzTlLGCa99ckwdUO1x5AWbigBx8rCDC
         wasPp2cZiSkMZwWizk9gBO0oXY5MWNifeGiPDqtf+NOc+k6SEBtnP8MW3q07c/IA4n7l
         ex2+dB1IwK4/9jd2/dQzRa3tN/CAIjDUOcTTnw/oiAv95iUXTxXRAehqrT5Ak1jtzEyV
         1RNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9AdzxoUyZoIOmOW7wgPPpdTXKyIxfO0qkUkT7ATQd6JzzbeQLV18OCJtw8suQIPIQwk7OBdkwFM/LxciPdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk7d2A5KThAKikhlNoUbUAC1xpurRsjJRgCU2xypYAwDyIkLPR
	xn7wJhBauqe0NelcNSNnDFsLvnbLo6sS6eXpNgpSnCBY433Zj/sNUqCRExu95ZAM7n63O+BsEGD
	IvT1nceY7/3WqqbPYRfWqcXn8ekhkvlQ=
X-Gm-Gg: AeBDievUE0jfwSFablCi0Oks+iPDX2YyG2o28jrMlx9TZRZm7kL3EbpGeeyOxJm2UAb
	Rb4s1hi0umEDGQtlDeeNxAyUDsA8AOE8qoEEeHCiXzM7TkRfephxGLzYxXXUzxND0s2TelwzRul
	KvNBpdMTrJypN1wnfiVMm+DM93xdWyCpclFJRqepobCnYitnFWExJD9GTt0G1tmAlHc/yBJUAc6
	N8AcIR6KYBW2kyVjvpFMFoIPBsa9ePV59JPg//0xxkc80JIUuwL029DgNUkwHhFmJIzVbUYGXVb
	ma4q6kJAFgSuvUMbwuVxQBhEkPq7LNeyFvluwdyw6VlD3Ki1iADlDijbvN1bN1tsE1JDa56DGSd
	8tFZL+1nbdk/DiTnU8t/LHcc=
X-Received: by 2002:a05:7300:e8a7:b0:2cb:de38:c76f with SMTP id
 5a478bee46e88-2cbfc16ec47mr2741947eec.6.1775477709496; Mon, 06 Apr 2026
 05:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226120848.82891-1-adarshdas950@gmail.com>
 <20260226120848.82891-5-adarshdas950@gmail.com> <20260226.215923.1020202093931415612.fujita@bee>
 <2026022602-audition-utopia-f7b9@gregkh> <CANiq72=tKVD13GD2Bzmt_LnC4SiOX1nkHQPcz2BS=P=b23e0Yw@mail.gmail.com>
 <2026040601-unmasked-tattling-67a2@gregkh>
In-Reply-To: <2026040601-unmasked-tattling-67a2@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 14:14:56 +0200
X-Gm-Features: AQROBzCKgJ7gGP4hQlXhBOkTO5FmhsL7CMQXIA9uM6v_R1eGuB3JgTN2fchelNg
Message-ID: <CANiq72nT6gN4ftRigRrisYkrxpfpZ6p5g6KSUCfdsHVLRF1iug@mail.gmail.com>
Subject: Re: [PATCH 4/4] rust: time: add `pr_warn_once!` for clamped delta in `fsleep`
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <tomo@aliasing.net>, adarshdas950@gmail.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 1:20=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> Who would ever build a "truly debug build"?  That's the overall problem
> we have tried to fix up, no user will do a new build for things, so we
> have dynamic debugging now.  I think only the mm core still has an
> overly-strict debug mode that only the mm developers run, and even then,
> there have been arguments it should be removed.

This is primarily for developers, yeah. For instance, I boot-test in
QEMU with `CONFIG_RUST_DEBUG_ASSERTIONS=3Dy` (and a few others as well)
in CI, and I hope developers do so as well for Rust code, at least
from time to time.

It is not meant to debug a user's machine. Well, it can actually help
a lot there, but it would only work for the rare users that can
actually rebuild a kernel etc.

In my ideal world, we would have as many (reasonable) debug asserts as
possible, including for unsafe preconditions etc.

(Certain specialized users that really want to crash everything at the
first sight of trouble may actually want even the debug checks, and in
such a case it may be important to split very heavy debug checks that
make the machine unusable etc. But those are their own world, i.e. the
idea is not to assign CVEs for these.).

> Sure, that's fine, but note that this will crash and should NEVER happen
> if it can be user triggered.  And if you are warning, well, why not just
> handle the issue, print out a message, and continue on?  Why reboot
> anything?

Yeah, `WARN_ONCE()` and panics in general need to be still justified,
by whoever really needs to use it.

i.e. just like today, no changes there.

i.e. the idea is to avoid `WARN_ONCE()`, rather than using it, for the
places where we want to apply EB. For instance, for functions where
there are really wrong (unexpected, invalid) inputs on functions that
we don't want to make fallible nor panicking nor unsafe, but we don't
simply want to ignore the issue if we can easily catch it at
development/debug time.

For instance, udelay` in C has a range of invalid inputs, and to match
that in Rust, we applied EB there. So if someone passes an out of
range delay for the equivalent function in Rust, then if they are in a
debug build, they will notice immediately (most likely a development
error or a typo etc.). And if they are in a normal build, then we
saturate at the moment (in the implementation -- the docs do not
specify what will happen, on purpose!). And there we could also have
`pr_warn_once!`.

So no panics in sight, it is just an attempt to improve over the C
equivalent of some functions, by 1) being clear in the docs what is a
valid input or not, and 2) in development, catch mistakes very early
and 3) in production, have a "sane" default behavior (and possibly a
`pr_warn_once`).

In C, the equivalent functions may or may not say in the docs what the
invalid inputs are (if they have docs to begin with). And what happens
if the inputs are actually hit is in many cases just UB, or who knows.
And while sometimes they do have sane behavior, and sometimes there
may be warnings, it really depends (sometimes it even changes over
time as the code gets maintained).

So what I am trying to get is a way to consistently mark these spots
at least for Rust, avoid UB, document them and make them easier to
debug.

I hope that clarifies (and thanks for discussing this, I think it is import=
ant).

Cheers,
Miguel
