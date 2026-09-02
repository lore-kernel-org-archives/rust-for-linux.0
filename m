Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A292D5C7A
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Sep 2026 05:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325546; cv=pass; b=R1Pwb66ACXWoGeeXvVCmi43z9NebA3cDpwS9Q5hpRrthoYSE2eSPLz2D9WW+voa7GdXJuxNlnMz8J/4iGBS27Vo8oKmUbxMha3o1/kDHLO+jRtSYGnhrxZD4x0GP2JvO8K4VNZ2wd6ZO7J/YjsK/95m4yq0bVIGsN0v/U0ICh4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325546; c=relaxed/simple;
	bh=NLHqvXto+f3RYXsUmTwIi3mwg7y/IwmK5K15JRyNzIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxkznuxY5whRykH9xgJLwWP/+oMrDJgv7eXX6a7spL6dnvwSQ/ou6t6giSWb89Wui2X4rhr9Ds38PSuXmXqkF5WElx+njtliWkANBd0t4nYaTupOF2GgDbypok+pMpTR9tG/bzQgDUSz9rkCq3Fzk32YUX98Er1Dyil4iTdSX8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+3L2msJ; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+3L2msJ"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso4093321fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 22:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788325543; cv=none;
        d=google.com; s=arc-20260327;
        b=if/AW/nZ3NC4VhrRH+RbAKxs1B+xVPkWI6nrrwK59hk+OBDt9vbQXQyBy9a2MKtro5
         CjLf7gH/cCuDXbAoOd3TmVo1EUGZwgrNWvOtsslS9AhzvsemoI0I4/VTEoTzknwK872e
         oLQLH5nk+9bwaS4NmcDw0ONC4VZ3UTFuGvh4I+Py9vbNzfXAPz5wnarvHxfg4yaYnlqr
         ZofCsjS5uHXXfg/mchNz90U5n181p/rkaDDrz3iys7yJnjvExoQ2FJ5k6KjtefOYocKJ
         gba2Wo/FVTwLMGXcdis/Jz/ionJwz2WoVk2ephy07Jvs6++KF1KWikw6YgfOsMVUFqgF
         f9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7nkXBkEBfR4l2iwoI8t7QwAJBhpGhm5orDlZN2BZ1Zc=;
        fh=L2gDnyFYnVMfsu5+T9YPHNVzHK2LoB8dkgkiSVMQXLI=;
        b=LZ7f8Jj7+6Q3BhkQQaPECciVKZBanmAnXtzhh8PkL6d+vBfIE+Z4uyldASqIRKvkbc
         WRyB+gVj3RnbgyrYewCQWl4QqfKDA1xgcfCBbKGI7bLrv1p+p1jEL0rsWUCG5nM2HIco
         CWSClxSClNR6Wr5yWLJYRhtKaRhbYl6s8U6IENBQe1ZlxJBKIGIzlS0266aCPz29W5Zn
         q5FgOA0mNAU9Ct+m4a8LtYlNH+OFNPhkUWEwQ+bgl8RPSLzoVNM56mWjnz2M8JcRjVK3
         h8GVY5doWVduXSKqluk04ENh/UHpx7430XwXG0fhJx7nkf6h4EgutTeXxpUG2Kmv5eb1
         WXEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788325543; x=1788930343; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nkXBkEBfR4l2iwoI8t7QwAJBhpGhm5orDlZN2BZ1Zc=;
        b=l+3L2msJAclDMylMVngKESVYDuDdURyx2Mz0xwSZRwUENOISs+SVYaKdmAj6a0vj/Q
         U3LuYg6FXLS0q95etYUfeekJlW+VYIllaTiWRFZU0Cpiu1b5dJi/yvoKH6nGD1+tAMIZ
         uUN4w4fU0n9u/PBHoTpvdwqOdpEk7AWyrNdc2KnjejONHMRwaWgwNG3TpHE7KRFYNZuW
         Fw7BZoaB1Ft7Qrn2Nw185WB4mIKLu5oab5NzaskwOlreLKesmeOz+JNWD3fZ7dHv/cfN
         /+Ux+ats7H3/JrMgzHuwqbilYa9m7LjF9qdjWB25m3q12RwFHmWwLWxvuskoxe/BUuaA
         T0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325543; x=1788930343;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7nkXBkEBfR4l2iwoI8t7QwAJBhpGhm5orDlZN2BZ1Zc=;
        b=OUv/RmDyIukZkVEOR0cgXU2mVPZUtdgJr6F1EeZ9ndo1rvoJ3De1jDbeTBRVK29Q6K
         3pE3dgbY5Io6/TtSJEAFIZ9h1oTK8ju1LK6SG+mKwAXGlC55chEh//eiIfvNAtQ0+iu+
         LvqrwZ78NVx9HCYd+07i/cQa7wUilxUjpCqcF37DxrqkDVS5383/H/fJA6o0h1U155uj
         4YeQYGMUFeocvgkECHup2YvO0boRInqrBWApuYnvOeCqiakbaZ/RBQBrfupf1Rig+VI0
         wFpduwE2oRgt7eIV2YZt+Zp39EdYNx/Ec+cb4ZbzOYRHYDcPJOdOL6AXhH4QbuibzdM3
         4piA==
X-Forwarded-Encrypted: i=1; AKwUvBwKYiPoGG25lh0C7r1QMvtH9XEAznO1tTx4pGVr4bJWqrpMh8fRRmBOkdgnPftmbCncU3XakB4K34w6nmi2Nw==@vger.kernel.org
X-Gm-Message-State: AFuF++nEEwt+SQY52tr9ugoNSUFw81J1WYIPV8JQ035+bYAM/b/5m1dG
	X3DM9+3yom8+An278C1rU6zefcnFdagKODRfXA0zwXi77kEw3WpV6+bMKGmFZ39wOOkPYioEslG
	ow2jYCgpGmQQ2547XhiQsDjKjxWAQj9Q=
X-Gm-Gg: AYBFou3P+Jq2uD9NLe2FX2K+PEp0C/SrynZudhT/GTwZ7UCZ7Z72yzQx67RpAUBVxVJ
	4UtR/XPtbN3ATX6o7ui/lmFBePR3G+dG28fh7u/19kUo1oXljPtINiEFNsqQEQj9qA83f72FoBg
	cllbFzcwZV3H/ifz3K5q0d/iItgqlQ70x1XmyFQQDTxZgzTrazzfA86x9WnNRgvKoU9cJoytxnb
	ADZ9vev8NvCQlK2f+bsJbFUQrZjXdKOvJM1a745k7OSA/FNkk80rRV5ry8dsjGk8kxURmVbRqyn
	hISasjcuR1zV0L7RP/ypT5YcD+RJIt+Gr9qXQzKkwdvkU0Y=
X-Received: by 2002:a05:651c:a211:20b0:3a3:2a41:c0c4 with SMTP id
 38308e7fff4ca-3a34ffdf928mr3036391fa.14.1788325542808; Tue, 01 Sep 2026
 22:05:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822062725.60519-1-muchamadcoirulanwar@gmail.com>
 <20260822062725.60519-3-muchamadcoirulanwar@gmail.com> <20260824010726.2849f3d8@jic23-huawei>
 <CAO26r3RLnX4HXrKDF6akmG722Q2CvDU-uJ40Yfuu_wwJdGgA9g@mail.gmail.com> <20260901021420.144a64d3@jic23-huawei>
In-Reply-To: <20260901021420.144a64d3@jic23-huawei>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 2 Sep 2026 12:05:31 +0700
X-Gm-Features: AcwNN1VwSx9iXjAYtJBmAc-tUFlWH0dfDFzrjPh6nAYPikoQ80HU5nlzzOFlAv0
Message-ID: <CAO26r3S4t0GCAep7J1suedPZZA85=vCzrWXA4wR=Lox7wceVDw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 2/3] rust: add minimal IIO subsystem abstractions
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, ojeda@kernel.org, 
	dakr@kernel.org, igor.korotin@linux.dev, branstj@gmail.com, 
	brucer42@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 08:14, Jonathan Cameron <jic23@kernel.org> wrote:

> > > > +        Ok(IioVal::Fractional(v, v2)) => {
> > > > +            // SAFETY: both `val` and `val2` are valid per the Safety contract.
> > > > +            unsafe {
> > > > +                *val = v;
> > > > +                *val2 = v2.get();
> > >
> > > Why get in some places and not others?  May well be a gap in my really limited
> > > rust knowledge.
> >
> > This came up in v3 and I answered it then but forgot to add the comment
> > as I said I would. IioVal::Fractional holds a NonZeroI32 denominator to
> > prevent division-by-zero in iio_format_value(). NonZeroI32 is a newtype
> > wrapper over i32, so .get() is needed to extract the inner i32. The
> > other variants hold plain i32 and don't need it. I'll add an inline
> > comment in v6.
>
> Ah.  This is my lack of rust knowledge (and forgetfulness).  I'd avoid
> putting too many comments in for the benefit of folk like me who are
> still failing to find the time to learn rust :(

Fair enough, I won't add the extra comment in v6 then, I'll leave it as is.

Thanks
Coirul
