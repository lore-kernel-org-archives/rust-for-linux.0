Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4447B29AAEA
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775471967; cv=pass; b=q+mWWMnZLbghRA69D0mYF2oN0lompGLmu8/8moNqdsHLIdgEZR8dDv8bRSV6kvOzOpNcKYPffhBCWA4WkCzll+cQI48jfZy5q/inYUm8t6TA7cc/BcnCPuPJxbwvqxMQsYKUILtOJqm7dxFL7PtRQ2rkHf/3+qeXcHtXT1QM3dU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775471967; c=relaxed/simple;
	bh=//urbz8SWkzbFcZueNZv321gPT7oS06uVdmY8hrnllY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CV2WdWSMo89GSBzF4YFwNkWUX1vkgcBRqKXaagLy4Mnv+zDT1nBJnokliVSJKwJkLgV1patGHd6z1nSMIDiN74urujA70Nq++bmIM3cWdvJv1REqxyjqCBDa8puxzZ87Q+fOd1dyV/xWXcx9dgK6Ulh0bufKeGc54BiRUOls9Ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/a5XmT1; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/a5XmT1"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so178206eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Apr 2026 03:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775471965; cv=none;
        d=google.com; s=arc-20240605;
        b=MpwVuwX5LXIuk/Kmv4fi97hHxtLZnY51yEpX0SsAT/h4cshh8csVdzHg3KMtywdEUk
         oDQbSaytmkPufwQLk9i9LiN+g3CtqgJRMhHIl2OgAzcLlKVicgU4uab3p58+8QbAGkw2
         ZDl4aPTn+opuhVg/jS19HogzWcRXfJpzAiIyaPgNRgupsZJv1fJT/LU7LsNCJbeGNCUB
         DOb3JUfysCycBk4Mh1nOzvTRk11Vi+a2URS6Pmu/r4pS4KRua5iUJjByYyKv6XHXF2F2
         7NIvXNYuO+1bMPuB4kIfPYzLkzqaZUo2Yk2GXZi6ydIz5qfnH7fJfwjkqhpSa/eCWnpP
         nzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9S7h4Fs8y7D1nLDNhFYSpgbzxr0wx9Sz1L+wAsOFB/A=;
        fh=OkzOdroobmVA/hPc/AuD2jpu9MmmJV4NPHMlKsaMBWI=;
        b=NIUwN8lux56fr4I9oMVAY1/ul70hicy9PsyrU/m8vZFXetAx3x+nLta85WEgkKZFIA
         trCJkrwEQIlAl136PLKGKsP0PMw2FMjrrQwFsUzmvLfOpxgmZtMP1i0viLVmAlwaHCWK
         LiXxW5Y2rC7JTszicGVDXyhI/bUM7DIWs/eRMy4WExPPBtOTAtohzTTC/lvGqmfL9xCD
         CA8TPbKGA8T4S30Ub4nAinFEk1KmemZKD42lOZgVWG9VtCaWQ+0h7QyH4NhBHT6j0YPr
         XM7jN1gfd27Nl6wZ/XzkEOGqJVCU0a6fYm288VFGrkxf5BgzpPFrS77DAktyGck+iyXT
         8ONQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775471965; x=1776076765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9S7h4Fs8y7D1nLDNhFYSpgbzxr0wx9Sz1L+wAsOFB/A=;
        b=s/a5XmT16YPc8hE8xAkVTkJOsBGf3tuZcb4tlPpkfYaM89cpOocalsskjzOP/5yZgm
         i86lZa4LusD84XkZF63+vhAY4lQBtVmu2xyl4J+z4xeRn8nP5XM4pi4keHtgh3Jsu8j4
         WhXp5IygIqJ6dWy6n1Hn4bdkhaOpT2eVc6efrCWzKRnj6FsK2GjVpX52mQ8/xRi70zK7
         xQCxqIOSnY0LceWIyq+N5KfGJBvaaHZDWkQortyyyrcYSeDpHgGDSwvY9binNhJNpJ5r
         wWBwU+bnet7DNCudG3PxPVF9gkvMktwLLaZnNAV+DFbpE4mxfYwE5aG+jyMNkt8TgYq3
         KKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775471965; x=1776076765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9S7h4Fs8y7D1nLDNhFYSpgbzxr0wx9Sz1L+wAsOFB/A=;
        b=RQU5DH6uuXk6NKtvMC3zdNhsMkrBYVe1e9LwAL1Oal+zvac3DW5cotazMokIrNC/ZZ
         HN2T49rWdyhTOeijfxygGBjQwEO2mNiXzlxQbThPQb8Y44IYhcXaO95c5mrjX+J/d/li
         w42MhmrxGB8TO5Ki8YgYg++wYezwgg0rDrrg/TPIxd5B8/778rRPMY4+SFuGM1s1iwJw
         vsTeBo/f4T2gnnTMUUxtShQU5stphz3oRoF5XzVrUXX++YMwzTDNFrWPQHTrsnzqOIIU
         n26zLbsy4eDuYjIfciUp3uYT5GdkUIHJY1nwTg24C0CRcLiBGnTehoftXMKyidcwMnEL
         548g==
X-Forwarded-Encrypted: i=1; AJvYcCX5FXz2EKUE1AOGYbKX2TT/3hNK2L1DzL4kBkewAUXyW0dfF0tMhP5fpd6XA78Eh5dhl/kLU5uErpJkxbHfeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm5MspFC6dxqJqCa1K04vYABt3NFaOHtFgc8y0tBoMzE4hgz5F
	J3mt7qIGxtLusy4SwAlO9IziGtY9bzgCaOh7xFoklib4pEX0j5KvTwuJ4+G3hXQbbMySrRBWgsm
	IU0uaGHs/eru16gwTj6FZk0HTK6uRccU=
X-Gm-Gg: AeBDieuifsc/Po0JWSjmhZ8/14cVsxdAYzbA0QZyVZQdAhaekkVYO8od9mQz7ylGo9Y
	kCdivJPgAOiz7Odu2mlsF0RKoSLldMfEpYf4sF1rBRGikqSmLWHVmeFb6vC1Bpg56gs2gxmf3bI
	a9nrgZhWSY9HdOVfvvlsm1Ugi3dFao2a/BPms1/xAQFYIvxx20rPwSuImeOOPu9u3+FIBBmWnpE
	9MLflPGhgCbr7NoyYiBQYOm3p/CBy7GHG1kzDGCPrXMz7/F6dO2UuEEfUq8PH3j7nUE2byOv7sz
	rrmQwf2K2C1byuF8xRRB8ntt5+SVxNoCbXmlhVejMg5ByuuJR8ketIchgM9Z2aiBSkt2Cthi2zu
	WU4mfAKVbSk+HSZ7Z8puqNl8=
X-Received: by 2002:a05:693c:3005:b0:2c4:ec89:bdb with SMTP id
 5a478bee46e88-2cbf96f8978mr2611916eec.2.1775471965151; Mon, 06 Apr 2026
 03:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226120848.82891-1-adarshdas950@gmail.com>
 <20260226120848.82891-5-adarshdas950@gmail.com> <20260226.215923.1020202093931415612.fujita@bee>
 <2026022602-audition-utopia-f7b9@gregkh>
In-Reply-To: <2026022602-audition-utopia-f7b9@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 12:39:12 +0200
X-Gm-Features: AQROBzCi-9t-YT1kKMlUQOzJ4_SUuxGYHzStYXxrLpgu0NoTYM5JhiFciu3WX3g
Message-ID: <CANiq72=tKVD13GD2Bzmt_LnC4SiOX1nkHQPcz2BS=P=b23e0Yw@mail.gmail.com>
Subject: Re: [PATCH 4/4] rust: time: add `pr_warn_once!` for clamped delta in `fsleep`
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <tomo@aliasing.net>, adarshdas950@gmail.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 3:36=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> WARN_ONCE() also will panic the machine if panic_on_warn is enabled.  As
> it is done in a few billion Linux systems right now :(
>
> So be very careful about that.

Coming back to this...

I think we should settle for cases like this (i.e. "Erroneous
Behavior") to use `debug_assert!` plus `pr_warn_once!`.

That way in normal builds, we just print a warning once, no risk of
`WARN_ONCE()`. And in truly debug builds, we assert.

This should make it easier to add such EB in most cases where needed,
and if someone really wants `WARN_ONCE()` or similar, then they can do
it explicitly.

In fact, `debug_assert!` could perhaps do the `pr_warn_once!` when
debug is not enabled, but it may be too big of a hammer. Instead, a
macro for EB to combine `debug_assert!` and `pr_warn_once!` may be
easier, i.e. leaving `debug_assert!` to be the normal `core` one.

Cheers,
Miguel
