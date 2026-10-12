Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11DF446847
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 22:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844863; cv=none; b=IygHvwGcaUXs7G0tXcDFE5gKixiEex5PB5DKEDRYxub9Wmx5g/r9C9sk6RQeKLseL5xmTD3yPTn7kxM47WjbXqrcKEGivnSk45LXOlnDwxetZufEPPvks0GyE/nqayL4/F7/LpGgoDto6RP9k6zAHq98YMnI85B+k+kG+J6MOTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844863; c=relaxed/simple;
	bh=qxontQZzrTk9qBhbXlFgxD/XPImDShMGjHOsGhmy3JY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=fDAQVNT/zPL2RzKxOj2FeudWrojJs4hu7INds2+NHYNLvDi8z7Va0rq5YcO/OTltWdrpP4Pz78ACv4xIFwNwxw8n39iq44TX9f8U52v7ZbKFF3C9F07Km51hFffetDo6VmMqyP0VXOllh4Co3Wi2NzQlYRhipiuGI+WrJ1bz93s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hm7vf0dX; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hm7vf0dX"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso978687eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 15:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791844862; x=1792449662; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qxontQZzrTk9qBhbXlFgxD/XPImDShMGjHOsGhmy3JY=;
        b=Hm7vf0dX4HPXPZHB6Nc6LF5UuGYxfKNsgySktc/F21KDSqrDXGBDCxs8wPDiIrFNgQ
         RRUDmmj5cXyrCC5oSHgJ2tuxL+4mcgmyWp40tibRZa88Rk9B7c3iT4yEnzkGMgQx1Ni2
         mMGbTbaneKi3OQOslAuaelqP4CUUPwH9FRfjlT13EcfbQSmkyTBGEoxYvpJ6hEvY67x3
         ShpoBd/Q3qLZcVD7n36sNeuvi17PZBV0vyM02ofz9sdhxAaVDLbQtcgHyD/cjN419Xyi
         sm6UPYTrlQ4R17Ci/FJfPcKkkaVrKK351cwqJiOwBe0JqTaiHNMMWD16iZ4pWKJutzGD
         Nj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791844862; x=1792449662;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxontQZzrTk9qBhbXlFgxD/XPImDShMGjHOsGhmy3JY=;
        b=HGQ2apQ0x8F5K7mVDUyMsTs3ffOwtKxkNWIgA/JK3NwHmIZzxoen5Z8w1XGini6VBF
         78GWKujQIcUmfo0zHeLm8C/aJ5Y4Sm0QxC1X3YOt6kf4rMBCWRu6hRu/tWwQzOWxDTqt
         SwHOeUm3I4ZFFXsGbS2amYN+eZ6G8QGWfneitg6ArVBxIJ7JzDSczYyCo+zdliLROe4X
         E7sFkLuZ/jXmel8jKE3ptH3VHpqm+Hgfw6i1X0lkr/gETtqdlaxnjUf16WMKSV+v+J8v
         8tbOR71Tz/ssN9pAR+ITj2h16OzuzSi+9ggRt8PS5tte8EMv3xriMa01zYdy1OxJ5PV9
         7scA==
X-Forwarded-Encrypted: i=1; AKwUvBySwvQXYzDKM3s2CTNQWVI/FIDXQaFow5wbSDP+n1c/OalTj4q90dtpqvOwh8foxpkx0Z1wLjRuNNVwKXS5wg==@vger.kernel.org
X-Gm-Message-State: AFq9FYITK1dMnAhAk7vs+KbOC9t0DW5BZPnR3xUBkuSq+XCQXWbzQZ21
	T8argmdwsM87/ZVeqVSPnaul1jj+k15lcy8cQ+tuXhfAc247umZwPKo=
X-Gm-Gg: AYBFou3Z94o2kMxKyKEJX1nEDNC9BPBS5NzJG6kX4SbthRqRHOo6tL/PTL7zMKkkqZz
	Vp8DXm/7tVmOLdKQeVsLjYO2TqAw5JzzJyUngZmQGhYQEbQqHVU3xqDz3b91AL9+C0iTl25CS2K
	1wFh80WKZR5LDquSFmWWFt6ztJIIdleh1A1aNpoC7mZM315qRImd8gQPXAojUkUeEgfE2JZ2bJG
	oS1xceqYrLH4A8/9SKq4Hm1b3sMtrBJop0FT888V1VEXd6Lf2Kgyv7CHIt9YV9vB7DbuKd9yazA
	a2n+oUMFBApa9gSDWpkktdDcfg0ovzRR/GnH1rCIOknf+BUA20kZOGgn/TBiN1m0SsNIugyUgwo
	0pe28x5o01gP1TDCcBrjxZv7SgAn5a1/AO1Y+yh0AgUkqGAnqB/9Chw5Blz0gvlrMCS5Vxkx7RL
	4uMTEXEiJkcX46iXyQMEBBKX+0zdWu7N/JkmNtoPFa3A/qTI7X7oUmzqnm1kDbcYdOUx4xAwwEV
	xtg5/xDyfVNJEFQJMpS6Clw/GxjeLe9KQ==
X-Received: by 2002:a05:7300:7aa2:b0:351:a9b1:73c with SMTP id 5a478bee46e88-3537deccaffmr15649614eec.2.1791844861473;
        Mon, 12 Oct 2026 15:41:01 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm44925838eec.14.2026.10.12.15.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 15:41:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 19:40:56 -0300
Message-Id: <DM37ZN988OJH.3URFWJTSYD4SN@gmail.com>
To: "spidermana" <xuyiwen14@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: drm: ioctl: wrap `Device::from_raw` in an
 `unsafe` block
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261007211751.2428111-1-xuyiwen14@gmail.com>
In-Reply-To: <20261007211751.2428111-1-xuyiwen14@gmail.com>

Hello! some nits about the patch body

On Wed Oct 7, 2026 at 6:17 PM -03, spidermana wrote:
> `declare_drm_ioctls!` generates an `unsafe extern "C" fn` per ioctl. Insi=
de
> it, four unsafe operations are performed, while the call to `Device::from=
_raw()` relies on the enclosing
> `unsafe fn` body instead.
>
> Both forms are legal, but the kernel builds all Rust code with `-Dunsafe_=
op_in_unsafe_fn`, which asks for the explicit block.
> The lint does not fire here because the macro is defined in the `kernel` =
crate and expanded in the
> driver crates, and rustc suppresses lints for code coming from another cr=
ate's macro.
>
> The patch is to wrap the call in an unsafe block, keeping the existing SA=
FETY comment. No functional change.

The lines in the message are usually wrapped at column 75 [1]. One thing
I do is writing it in vim and if I see that the paragraph exceeds the
limit, I put the cursor over it and type in normal mode gqip. This
auto-wrapps it.

>
> Signed-off-by: spidermana <xuyiwen14@gmail.com>

Normally, a full legal name is used for signing patches [2].

If you are going to re-send the patch and nothing changes, you can use
[PATCH RESEND] tag.

Hope that helps!

Regards,
Nicol=C3=A1s

[1] https://docs.kernel.org/process/submitting-patches.html#the-canonical-p=
atch-format
[2] https://docs.kernel.org/process/submitting-patches.html#sign-your-work-=
the-developer-s-certificate-of-origin
