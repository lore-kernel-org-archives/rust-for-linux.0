Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795611070;
	b=0lHyw2chD5GKq2O8A/FEvXjwmOmN6LDvsWJ00w6YrVl2usEAGiYfGbeY2RE+4720pEUq
	 9HBsWg2xrMVf0xysEFisNKfk5Kjs00NrG5Szs+h9p18AhsUjZ3JppadibI+cskJ4sWXnk
	 9tAjwbS539nW9NT4j5XHhD1oFek9P+kIwYrPHYtqn7KoiK2Cjge9Gm6omXWhSSSzg27IJ
	 Gvk6xiZBEqELwsDCrUDUT6WIiFPUCAVIkiErlB6ImdsAya04pc9z0WQG9AYVNrbl9yLGF
	 YFb8GMICz0FJPTmiGf8DOItmS75irmPbvXl0qJoY0/yMkfRsQVnDsHp24yQSwTQ4WSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w1Kojfj7Q9gvNmTYWw/MvDMPTddHWSKKmJ+bm3+dIPI=;
	b=xERPOOJrWgUOWfCX9e1RthXpNqcLs324A3L88UMThgxUZxyUjj/8Uh+wdhXgv/Hnq3dO
	 45X2LbqONqCEQlshS3BGSTOyy3pQciUplnlSslTVV1Vmz/t4mZqOu80r/sgmwcMt4+yNa
	 6ZHZn87A3O6la3J/lPQ7XIlMsYbUpN+l+2zKpkaB9fa+8XldFP7RjPkkRm+qNEo9HpgMX
	 TpcTKRXhcu8NO9N1ereEC8AL5QZHWKIM+sXsJHwPT+c51LRN9Z5QdZAGMuLlby6Fx+Dew
	 cYKHoyaiCyJ/aDxzgB0hElZb2KjKXC6DIHXfnv4yHA2OyqM+6bdrJ7d8rNBVAQ7qAIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KoPfpnRb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEC3606A33A
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 12:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BEC3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KoPfpnRb
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c00c727a26so469302e87.2
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 04:51:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795611068; cv=none;
        d=google.com; s=arc-20260327;
        b=mJKrrLlKjT9UlNXy3iOtirAWWKV4jz8GIXWHxu7Knp/G+znIn45zHbLnS3gPC2IPE8
         0qfwpoxVJotj/mKi9PbsvRIgPnoTDWE6Sj3xgqr7TlwngmKYsFS6UNcABwcIc5llK0V7
         rBJB1/Y86Ii+hvnydj8vNMyDZXGA7T1fN40Ylsjae6hyH2GkcG+N2Xjusa4mTj321jX8
         XWQ7lBH/dJdzJ4UbOC6gtvL0RSEM0jnQddzda5AivBUgOS9wh4H/n9Np0BbA5NRFg6Yf
         O1/hoye64WICZgsg75eW5hsH1Nbqw4Fa871gaRUXk35ds6SZgS2To8jAPeEp/4lxXQrt
         HctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w1Kojfj7Q9gvNmTYWw/MvDMPTddHWSKKmJ+bm3+dIPI=;
        fh=zB5+g2fGIQjXAya5RgMpR0GlbZj3g1iVcwfDBMkp2Ns=;
        b=Bf8nNa4lonIxobZ0r18qCZirBRGtvC6jgoEH4TFlRvVAgLk82IyuMQRzhxooxDtPiS
         Wfrd1oe88iSfarq5040iGVZbvwkDOtX+I5srHslzhtcXh979Ue5qg8LwP+WbZOZkBJ/b
         mA03ih+6J0JcVPQsK6CITY/NcKHCzzQeIS4fQtOwwhSpWIIYemapEKWHw4qsSBEnE9Zt
         3BjoZxHDedCHmAMDmbO87Q6sXIiKeLH7vu+W9Jnn6npEFKotqYNSsXjjQeLig+MFuo8m
         2fBAWx0Vjx1ofW90oCNNr+K/pcsp2KC7Cg7q0pk1yLiikOk/QSumVdtQRCs2GZyBeuto
         b6MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795611068; x=1796215868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1Kojfj7Q9gvNmTYWw/MvDMPTddHWSKKmJ+bm3+dIPI=;
        b=KoPfpnRbvjzgBDVttjkR70gQZPzQyY6JhN5qkrXE9AV/ZA3bt01kdUAuJoGV/BNJI/
         x2RBAXUsA6Q61qzJx+A+Ssd6EC9vjoecSh483b5ta+8s5wW6J63WzutblAAQwhn1Hxab
         jgrCGRez+R7SVSnjHAF3DUHty78dPGHkxtSYaxTGBRstT8WdKUxDT/IgHICb7JJQ0D41
         tI7GlcvdgzymwBYo+Mjddkk0BNVL+L/ISH9JV8oo90apkEYzTgAaGkxLaK0EPpC25EUq
         qS2zviUnK9Cou1GEbXtqu7qIAIixAvin/fQaPSs7uQopp92y7X3JZtLZu5w6O2/MZ4mp
         W9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611068; x=1796215868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1Kojfj7Q9gvNmTYWw/MvDMPTddHWSKKmJ+bm3+dIPI=;
        b=m1jCm3JJetc+TNI7MUBRjskn5Jy9DLTq2fRjORYvn3sHLOz+JLKAKGXTwahV5boUlD
         yQqzZahi5APxIuoeiX0T4wLKT2o4QSTZkXbWjeiBupWBDSMUTuPqLwIfwsjI2ekpOn1o
         8wNn9Ze2nnx5fn+9/R2vGPrbqBDuKboICeqU/4cv30gNPqUrjEi7omwA3B8tH2ZPh+w1
         51JMR5LKf5+i9Wx/GmkO/iVrct5t0dTR754I0jJxjF2NRimB0EsN1HLN1ZiZWljOGBfC
         YCtrdmMKcL3BIjXQNAY8TuQ1joPl4F8gatC/lrcpwHrfY7fo/F5I1y1RAO4j1Nu9LH7v
         J2aQ==
X-Forwarded-Encrypted: i=1; AL+hErFVpz0h99vlGcY3bDcoO9M6xXLBA2kaohF8hQa7QPU5SVjlF92UQlaHuwnRrL/t2xjWQUVz87CyJVpAst3lsA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/twQFmpA1zBcB6D19D8llsE1c/i5qDLq5PgV6ZcdG8hx4ejQXF
	5HWBsD7FFsWhNhwWsWg1d/YUeGi8ezwNPcc3kWlK57L3ecmhwWxa+FUegE3MgBXMjkk+Ejb4wH4
	ygpaOgNISBCSYAws648CZQrxtL5Wv7mA=
X-Gm-Gg: AZFdTZfB4hOdxqL/mEeFPV8hYpH3vLayoxphlbqm4soxtRa18AQ6Na+7op/Gal1PVqB
	VJjpJqhUjlOk45NQxZLZXl4b54VfWbSUy52cJm3gzWy7U6Eq1L2OHgt8FdVH2A17YUjKDRZgk63
	T8Zwe3dqW8fMrwj2fYtmYZFJILQobN4nyele2MruJyYZTQrbhdHEoukVrLnKPod2EFN9RL+4AGH
	ZMuTdxNOpSoSAQblccrsTjqyJ93Hdmww1RTr+UhIjX+S9a7nal4hdQk3x8WHxaqpl6OLP4oRzE/
	lufbDTRARi74BtasuJkUw5Uf1CL2VaKufg9M3gnmmPDeKNmIdS+2DVxHnHTIedAAw8KACjEbltY
	4lC15h8+bJH8XZgyFS6MvkLM5HSWbMom1qBaVSFuSAB1SqcFW0cR2MLtrLAj65UdWBgeb7uRvR8
	pJw8auUKopp49SEl4S+rsZUwZD1RvqigwcdfCcU+uKy0hqdDazZKsabBTgH5hQURRDwRQIrPJse
	bTBZCrsD5ZdN5itmOnZsNzKA39sw6WuEL2iMdEV/ajVAgOEq7dgfwJnc8XYfEJze3j6QAq8
X-Received: by 2002:a05:6512:6719:b0:5bf:ba43:fa67 with SMTP id
 2adb3069b0e04-5c1bc935c91mr4938024e87.6.1795611068220; Wed, 25 Nov 2026
 04:51:08 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125120959.244175-1-w1355457260@gmail.com>
In-Reply-To: <20261125120959.244175-1-w1355457260@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2026 13:50:56 +0100
X-Gm-Features: Aa3M54pc-P7fSd4N6CMDXiaucYA3gc4xfA4wwP5X9X5I405JD1F1OnxtF9NBH1A
Message-ID: <CANiq72k-30fquxsch0mtiLR30WxsOHGqQVxD1prkwS+VxNAs4w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: error: add KUnit tests for errno conversions
To: Zixin Wang <w1355457260@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:10=E2=80=AFPM Zixin Wang <w1355457260@gmail.com> =
wrote:
>
> - Gate `name_reports_errno_name` on `CONFIG_SYMBOLIC_ERRNAME`: when the
>   option is disabled, `errname()` is a stub returning `NULL`, so
>   `Error::name()` returns `None` and the test would fail (reported by
>   Sashiko).

We could keep the test adding the `!SYMBOLIC_ERRNAME` case instead, no?

i.e. gating with `cfg` two sets of asserts.

Cheers,
Miguel
