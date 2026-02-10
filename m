Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32C432C8B
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770735644; cv=pass; b=gSv5/Jk+BPBjVjyLWlHqFi3rTA9lnGfSP11p/9aqsZAAuCQKPVpM/NiK029mTMd+U+mEv2RfzqQRhIrf8epUJYmGw6Aa8sb0J3P+LtZol8v2b+NcqVvint2XOc61nGeWV1wH4wIPk1Axo2NA5Nw/XsQIsJdbaEpNTZ03ILiJoDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770735644; c=relaxed/simple;
	bh=mJlAZHZqeHUm6i/Vvid8oFBj86es6hYFE/YvOX3Kjso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnRtuV3RbvcXe9tCQtKTJxpmSdMAFBycEmwqdygtQFN38Qqs1jCbnpHLLb4vSjdcFnY4ke5pp2g0HuuPVWdtTedVOua7E6wZZLCqH3a96d4SudGjv/MXIzaxmSbXcLSVGEEae72mI+IpOplSQDYQIaDUICZp8NK4q4n/lz3MdaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9f4MAzD; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9f4MAzD"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba76e80509so100251eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 07:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770735643; cv=none;
        d=google.com; s=arc-20240605;
        b=ZDuNO1EEecQqmtXAjKWl5NYRP1WM7GUtb98kZpa3BDaBmuJQPYXXwXnZa4G5YDmy55
         4jo5fpcPSaIyf9t9//fMr+NZVvhBGSSYE1XLCg7AzprEzmS9VgYH+rsTOwGUhyh9m9Xp
         CyQfPIvjsXdGBBMQIofBSLuJVDfMm50TT4S1JzTw8nFAKcI5LyhSSUjs+bihviy9wiY1
         roF4Xp8NHY0Xpg/pmIjsn6m9lQu6eHDcGIcpna9lRD4ykb4NHYmGWhDkxli0XiashX5n
         RU9BvWYQ03Z/N/SxSkZOQ3mSW+BfgRATxbntVuKh8pKrMGpOErUDJiX35jJSLscXxpgN
         DH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ob2vuYXAEwTeMddR1X4hlCHzNeoCnHjF+ZipDH4fOG8=;
        fh=Yr5/mtGB4MSTdHGqP1s+a0FqGJHaSxgLsG26XrsTdMY=;
        b=LPe4xI83aHrwEUJ+i0/YwVZ7se2XQFsR3iABS+8+z2lrojqrNWDo3lX7I5a1DtUHqX
         ewB2YeTnd+A3Z4413zrPCceduIBAIqy8d5tE1cF0vmTFBOi816Z9nA5DghSi4xaCat7K
         YT9DnKswdMpaUQ3ca6/1CgzjzwfK+MJoIpwCqEvKnd8XDI7OQ0BHDD2VP7iuQUFDFX7U
         G+S4yv1oVnecWYS07sq2eREZCoZV8RrH7tVm29JztKbZ31Xqh+7tpOrRsrFA5AaKGquN
         daxf91AfDAikvERogMRPMAWMto1ve+8tLGyM76isMNWmyhUcH21zh6bbX5kqWZ+qEjnF
         udPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770735643; x=1771340443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ob2vuYXAEwTeMddR1X4hlCHzNeoCnHjF+ZipDH4fOG8=;
        b=R9f4MAzDl0kAEaXXqAgp8JrTKzGKmHM/WxRwLIzAsWI2AUsgRH49MIbDVttf+4Bvhl
         9qawdJjZ9Mr9Y5jD6TW8Z7kdF2+B04hc9WpUBjoNPPETMSCqg9BkHPbmta6UelG5PC8U
         l+khslQzDMbEvKIHW4NQ0eO58ZJE7zJQOzvq2xssDua4g/ZgU/ZD8Rxh7q2roxg00LR0
         M/q++QvJNR6Leo+mauOdwmkGZIFNtc96ei0bbGoYonVoDjBPly5foaimxfUhrv1wLxkg
         aqg5n0yUzaMX9+OLjHaD/tuacfTnCr9yOOWJb1HA9HsXse2eEN1L0hvHAigthGY1ySh5
         qDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770735643; x=1771340443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ob2vuYXAEwTeMddR1X4hlCHzNeoCnHjF+ZipDH4fOG8=;
        b=JfoVhrlQjU17nXaWSTKfnXRvz/Nsycf59+vGMeXzSiAyNBGCay9Kc7Ib5nfG96Vv+F
         nxB6NvnPrR1Cz3JF8oVyCK+VcGxB/oGX8P4KSO+C0m6vYhinfV7+lou8QWa/OWen1fxy
         wuI+HsOnUJEoz+HjTKtWCYVX78hzyw/5Yo3uEzionCCDO4MVv5GtXF6k5DNg6u+nDV1n
         ltqVkcYFjzctKBSMauIt4ZoinWjmrPclRntiJMl3Q3K0CcPc4fMS9OIQQdFofyJ9X4cC
         xDS7A17dvpSKof2Jgk1Hu1WfLcViDQryDmpvMTVBS6uufIfBhOmphuZNC21rdee6ycN+
         zBQw==
X-Forwarded-Encrypted: i=1; AJvYcCUJgI6sH4aqDnDpx1FX7Pbtp9a+qvOV+l4zDRqvxj+CdXRIjuOlu4Nsu9pA+C6jISLZtu5Q9GlBu1SSjGT4ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/KCFzfJlNf4KDtvGWRmwPJrvQY8kHybAE3rTQRPJTEGWic8cJ
	k7vGIZwOt7yZIHyp/W/KgYh7hB75W6lHmPGJYZdOLP6YzlTmC4cB48Qgl2QU8fiAdnRjV0IU/gY
	MHaI/M7iN+BKxfzhsLinfDKcW9a4o6vw=
X-Gm-Gg: AZuq6aJA3p8Jb/XkEIlOj04tNG1bgCQgdrXpYAEzTFADDbAXPaUkukjO6pimWDWpyeK
	C1j3jYMwm/cBBwMJyEmYOTv7GZj91APt7Ppo5zUvCF9vj8TDfszs0c7HniIWF/eRYxZPReAqtxQ
	AN+PPlpRF4l8nhafzscefRkjtSUBiq2OtRpfssUoLnLzV2QOsV6mZYr4yxZtpfJy6jva8FPtVWU
	03HcNv/Rz+wWuIJsTcnWTJEWVnA8blmN4RFwD58AUpuZP2ekkUb0qIg2qqvvdMu/gNM3/IHC2x0
	3nMdljj+etD2eOzVndzDsbp4a1/CohVxH2FwJOnvIbeS9GWfZFxKlRIpv5ZxcZ3jOctOwib269t
	gHcyG/ogUhTizaSDFNxLEz7TiP0OrD8kfj6w=
X-Received: by 2002:a05:7301:614:b0:2b8:2082:5bc5 with SMTP id
 5a478bee46e88-2ba8cd9e7f6mr339238eec.5.1770735642621; Tue, 10 Feb 2026
 07:00:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128202130.196419-1-shivendra02467@gmail.com>
In-Reply-To: <20260128202130.196419-1-shivendra02467@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 16:00:27 +0100
X-Gm-Features: AZwV_QiFg3nEo7ggarrAZ9RjxdIvOXqn5bgs0MiEW7b2mWCZ-OZTAYBI1ZFxyYs
Message-ID: <CANiq72k1=L-9p0CVG33T5V0nAzDUO_SDToyD4zfHKCOcG=XC0A@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: document safety for rust_fmt_argument
To: Shivendra Sharma <shivendra02467@gmail.com>, 
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Cc: ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 9:21=E2=80=AFPM Shivendra Sharma
<shivendra02467@gmail.com> wrote:
>
> Currently, `rust_fmt_argument` uses a TODO for its safety rationale and
> suppresses the `missing_safety_doc` clippy warning.
>
> Following feedback from a previous attempt [1], replace the
> suppression with a formal "# Safety" section and update the internal
> "// SAFETY" comments to reference these requirements. Additionally,
> add a comment to the C header file pointing to the Rust documentation
> for safety preconditions.
>
> [1] https://lore.kernel.org/rust-for-linux/CANiq72=3Db=3DZ+6dk4XWK6QWcKDJ=
x7SYXL0obAFFfWp8xpE1CFkkw@mail.gmail.com/
>
> Signed-off-by: Shivendra Sharma <shivendra02467@gmail.com>

Related:

  https://lore.kernel.org/rust-for-linux/20260205042132.40772-1-muchamadcoi=
rulanwar@gmail.com/

Cc'ing Muchamad.

Could you (i.e. both) please coordinate the patches, perhaps merging
them into a single series? You may want to use Co-developed-by and/or
have a different author per patch etc.

Thanks!

Cheers,
Miguel
