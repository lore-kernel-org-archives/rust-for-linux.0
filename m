Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3801383326
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 05:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339152; cv=pass; b=ctSD8znE5UGgNafJgnX354u/BLdGulQBVD4RbKkADxJEU+b95lgexjRB8QKjGfnEG3uM7qgfjh2k97tmA/8XX0Unsry5uVJ3RtC8u7lXjUF/YNo5As5wh85t8is+aEkfruKM5JGDi4Yr8Zy9fDRc8faxaW9xspgAM+DiSmR45bE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339152; c=relaxed/simple;
	bh=paN+CskJ6HmYhK9cyRuEmojkBqkHIl9A5qEXVpudXlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYGNsAqodxDPtohpMy1yiAfsUORYUKY3CEY7+HZ1KvZewuXJGmesPql0X/HHUSN4Cz8YJ+wmmrtwW5etqGILUaJ0DByj6NJjI9OqQuS20Q732OQnm1nvL+hZR2l7YYO+nOKjHGj2k4vimyqcC37jwuJwXz8iXOm6hPum8Q5GIwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JN9WcO3G; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JN9WcO3G"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so913105ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 22:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786339150; cv=none;
        d=google.com; s=arc-20260327;
        b=f/uH597D6uC3La97Vfb+CDUTDrbOS2EguoCtPzDtOnBXzEbMQAhcd4DZ5yAWaTdxHx
         WwUllTJnHPY78ucefBfbwtyB7nMlKQdl92t/isplivcP0eaJqnN9G6opD4xX+MCniwiV
         OyUhfOPB3Ehc5zTFwqlcNbbpBii1ScHFoi2J/8Fmj+uPcGvYC2xgKuUsbP5gCc8hXUud
         5QgFyE4O71YXwyc7TgiGMnBueYs2wYZ2+S1RaGP9bmG4mVB/Roci8TUrCzEAU/iUS8jf
         XoUZRMR9NQfRju9fJkdG/EMz3IKIpNoKoHhbKIoADlLh/89pQKtQSrXDxzBKOggIFZ1z
         Pmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qWk2FuWk4q/O46B/Y2FQPrbxUvv12urfYVx2Q+9MJsU=;
        fh=RZY/SQucdMN3B1LfRMDdmU2PBXIburoR5+HUI+bOMcM=;
        b=GsnwHrCNpVOndGy/tvZ9LPsS6dpVfmo0oCU3FK8DthgHHfaGg4mfhuseMm5v1idkak
         rWeqCaha12830PSdz/q0eQdAsz4o2N7cm6Szr1KsnSubyUBw1c42y6xT3Bck4xl7tVvv
         G9qyZUs+1rRsPmi+Q3G+YHmGJJokx2O3gAgAUuCl5CEZutQziZI9Hmp5vGabfegjrPAv
         UuR5gzHQws/IK0xcSjAPI2eJdhW7/SN/wS1hN94PnkxNt4XsOOpGGKI56t2Wu8kEjHLa
         ZjG/Bn9oL59z+SV1B1yyF9ifUhwp2xp23LjqWlGnhNH47XRtmUwWzc8rGRikk/D7Xos6
         xjwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339150; x=1786943950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qWk2FuWk4q/O46B/Y2FQPrbxUvv12urfYVx2Q+9MJsU=;
        b=JN9WcO3GdX9ROddhAPAOZmvokd/lJg1uPmPRb3CDuQpDjz1zRsYQkXNhS/c6lIy3G8
         a71CotM5t/LL4NTiaC32AIYxuZmt6v5Lhin30pQF6t7KROCf4vXg6y/9VatVdg6kJZeS
         RSB9B0NGiuYZ+MXLWMWhLHa/or1opweNk9HVHfVEFDJxwjklELVy1v9rSUkJuWUIMscJ
         dIBlx8y6MnpWBcCYVBZmb8/fNCxiQZWiP7XErcDUUdL+pnv8T5sJH/QpuNPwfqx7dou3
         P8CRaun8t1epKp+zPlestIMlngpkB48moA4ocbUra9scOkaiFuCQyr1U6F0gfwOcfS74
         BJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339150; x=1786943950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWk2FuWk4q/O46B/Y2FQPrbxUvv12urfYVx2Q+9MJsU=;
        b=op34ZSjAAuuRnCp226frshD5voETY466u3eX3BOnlG10N0UhbBdpE7yGZFjna/4zn8
         myO98N2Y2AukOUgbLCeBzAbA3uCUKXg5BoPK+p+/ycHXjIZr4PpTseqiB/yFpGdtC4Aj
         gMPy3lV+tNHI24TAbYsLwnaKhyjnEK4bG+TzQjqyXQ6zpe2+10ivgjDt6o+MuXZD9rGz
         Bl3EFd+c8shpytorAsLK40PHvOu/mfv9NuUFhoZ6+1yb45Y0KDN/GYBMruapDs9CMFMI
         3eFuZpCjmLlAbxe31QQUn8QqOJayA+i7EDzltApdjEwikWkFSe+ZJI1CcQtnq+HKTnlo
         7M5g==
X-Forwarded-Encrypted: i=1; AHgh+RrB0TpBjaQ5KwAGvg+PrlbP0RJcxtk8YaXBzRjpZXgXMaoeX+AeiwoAhc+ucncJHNGUAVj9lDo5jap8BJhYSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhWKB5lMSPJyObC9JaTUJh/sId/4tVhKhiWxpAnW8VsNeGp0U/
	RiId/ZWhAo1arJvFTj9xpu9u07Zam03+bPnbbXcEFWMt4/n0q0bSjysfYSEG/8bzEcZzNoDbbc+
	VuRe740vjSl9bKunmk0I7X3hfR9iiTIg=
X-Gm-Gg: AR+sD10oVJCC5H5x6opn6vKMi/36mLaWGVl0VZoh/tkc6rnqammtrtGlYYyNKt2GUd/
	U9WzHohxpXTsXB/mGqV720uUiZnuBUy//hq3lq1lqVnJ1o6zCacYzu8+DzfqxbAXImBSrTmkYVt
	NaqD/VdCt+hh2pEUVaKbHefGVdZ0j2aqYVdWcR4I1dSuRw2V/ntRETi062BYCxd01NJWCMsjuuR
	yedgQGBQgyH+glZO09HTd1M6gUq9NEsXnfpQYqoWXBUDjB7Ju/0j8fACHSwAZ+dtnP3fG0c9jfT
	qSzeqy/X1dEtR9qS13QWveZPngaAtEos3G7oilt61EmBT0H7VyxAPZmIPVYLoP6mns8S8mVdhd6
	E8ZsO1A1/+3LOIPIIEeGVEPrU0ECPWcq/DWRF1jUFHXfDrkTNEGLQ6JJeJDc2Q8/ZBjUzkJQ=
X-Received: by 2002:a17:903:468b:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d0ca761dffmr335455395ad.1.1786339149815; Sun, 09 Aug 2026
 22:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801024841.786664-1-tomo@flapping.org>
In-Reply-To: <20260801024841.786664-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 07:18:56 +0200
X-Gm-Features: AUfX_mz9bvODvJEse0mzOjjRNbX7iKAB8y9t-43DmGknL8kUfgbL9ivbgiKxs8o
Message-ID: <CANiq72=fw3+sTEemBaJmgObEr5q548QLr23yMqVheYjqyk0pSQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: bug: prevent dead_code warning from warn_on!'s
 flags constant
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, gary@garyguo.net, a.hindborg@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 6:04=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Fix the following dead_code warning on some configurations in an
> atomic development branch:
>
> warning: constant `WARN_ON_FLAGS` is never used
>    --> linux/rust/kernel/bug.rs:126:19
>     |
> 126 |               const WARN_ON_FLAGS: u32 =3D $crate::bug::bugflag_tai=
nt($crate::bindings::TAINT_WARN);
>     |                     ^^^^^^^^^^^^^
>     |
>    ::: linux/rust/kernel/sync/srcu.rs:106:12
>     |
> 106 |           if crate::warn_on!(
>     |  ____________-
> 107 | |             // SAFETY: By the type invariants, `self` contains a =
valid and pinned `struct srcu_struct`
> 108 | |             // and `srcu_readers_active()` only checks the active=
 reader count.
> 109 | |             unsafe { bindings::srcu_readers_active(ptr) }
> 110 | |         ) {
>     | |_________- in this macro invocation
>     |
>     =3D note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by defa=
ult
>     =3D note: this warning originates in the macro `crate::warn_on` (in N=
ightly builds, run with -Z macro-backtrace for more info)
>
> The warn_on! macro always defines a WARN_ON_FLAGS constant and hands it
> to warn_flags!. On configurations where warn_flags! does not reference
> its flags argument (the LOONGARCH/ARM variant, which only calls
> WARN_ON(), and the !CONFIG_BUG no-op variant), the constant is left
> unused and triggers a dead_code warning.
>
> warn_flags! is the macro that accepts (and here discards) the flags
> argument, so make it responsible for the argument it drops.
>
> Also rename `_COND_STR` to `COND_STR` and consume `$file` for consistency=
.
>
> Fixes: dff64b072708 ("rust: Add warn_on macro")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-next` -- thanks everyone!

    Cc: stable@vger.kernel.org

    [ Added newlines. - Miguel ]

Cheers,
Miguel
