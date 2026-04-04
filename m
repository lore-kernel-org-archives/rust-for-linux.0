Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5012EA168
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 17:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775323505; cv=none; b=dVUSEpAh7q1W8/XJGt2D+B2+qjWnIK8ZqYN1YK3I9YxgRWEqiw4isgBNS4iTbb/O+RpIlGrVb87QRPFrgHwfxop7N+cASiTOgBnq7upeQtUa+ntsIS7zSZVTKtsdF6/YFUzc+L74J+G0rgXTeHkYxFhy71/IUVuaoaLMTrSG3I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775323505; c=relaxed/simple;
	bh=jmB6NcLAsc1+UN+OCM3PMKOU1PmeCf5hHjP+ltB0FgA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NwIg453/vzh6a0iMM1RJsDu2H3a8/mT2kLOck/DvjsvFen0uv/a/ss5BHrmq+Xq8h+QHcNzxUc/57vl+apP1Bx56kbbFVASUq7xtyU34LCQ9puK2IkUgF8fT60WzR/+GLlmT4ugRC78wo/KliuIMoh7FgIYwYbN0LVh4aY0lGBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5sEU//x; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5sEU//x"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c7d8bbad06so6861777eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Apr 2026 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775323503; x=1775928303; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmB6NcLAsc1+UN+OCM3PMKOU1PmeCf5hHjP+ltB0FgA=;
        b=p5sEU//xRG1i6pjmxrx8wqLByK5yxZQZqRIkHC21yq4d7FP0IqLrRYcICWm1OAz7Gu
         rtnqvTD+FFx5U7BeaSzGUJJAtut9mPu84+1EpcZl2tEjVFtfyeKM/pzbd20BFQUuaE/g
         rOAwyPIOfgEj4G+UDAUa1RV6cMBfzPhPel6TQoIKE0WZQy3YWSUJFo2R2pqZP0B9Wn79
         3T2Xs+kp6BbptQX5dNzuN5cOy/sBPjdV4ZF+SRdl6Yw1C2Tim5lFEYtjkSkszQrJrLQo
         96LC/qaa1M0JubqGQNWQ7Y+oS7SYSV70SKuz0pB6gfRdQwjr2TXxDGbcEFx7UtxVYr3Y
         ZXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775323503; x=1775928303;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmB6NcLAsc1+UN+OCM3PMKOU1PmeCf5hHjP+ltB0FgA=;
        b=oA39mOhgPboNQtHcG4/mzl9Y4v1FyiSRxq6hRV+3ajEWPWOCl93nScdcnRyfJAR1zY
         NotxbZ5v/Z81LqYBZQCrhRs4M5F0OQIXF+PkTH/xvi0iAljKL3ShvFBYoI0Ia6+dOwVx
         zD4WXJh8vgih539SsPdE6lPrfCDUza3k5n3NuJN4T5L2y/ZWd1NABzIEwMcJCTmmQc9r
         KdT9lRmbPRJS16zYELkVtjChcwW+R6ePWydoEou5O++Op8FOeddHOVPSYnVgmo4qe+cE
         T2GHJ4/4qvyWNwXwg/UNvlwCxk27cPtz6fa2dGKkc7tOSYUKaP8PIr4TlZG+5RJdZRC8
         tRJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzHsXcXyirhRbeyaFuX32zPD0HQQwuL6Wh80ni8hIeXEx7ps/LbL4IVhkRsq/8Pn5LOpZNsZfkV5iD2vl0SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu/NUL4nUIus6KAeB/dTDYABC6XtwtxHFo1w6AQ9B7cJYHtaJk
	zG/uP6psuirQMCQ192bX+7ze5Hm9YFapEsUr1uEDPGLzh5Lj3GgwjqDF
X-Gm-Gg: AeBDieuDY+dC885OqkjFkNqVouecdVDM1V1UfV7py1JnlCYh/mt+eogXD6neMrpdbQ2
	tcd+rp8AK41yqiuGu71a2wLoAxft1H3q72YzwE8itqXp4j5rqzOyH9VIEawx3EUd9aVlf2+xmr5
	0pPVln83nLGiG3xQCWawrQd/MpGtxyWdStboPHkpPr/5Cb3mMZt3tNow3fsopI7p3gSX4LwyTt1
	q1vA01NZbuGRFHdPi60UIpKk8d62LWQcHLvO2cZI21gNNoiOuPwxJ53E1NjN6lIypMWerOvOO7R
	Ge8QmSEGCyjDE0qwiEbWPJRfIpsxg8Nb7fEohFaIxkwA422+sGj7h2IQkEWicYC3pz/Q7h+lO9M
	rdzTtFCClcmEyr2KsGnFj0BVo2koNXQ4i9jHgjoC30oVuR+ABh0UVhgRqGrPrkuiI5JuKDovrL9
	e98LNz1K+bW23F1BmHjyySavpQFEXsh3DSiiap2Sas5X93rKIdXm5rK0p2XexLQw==
X-Received: by 2002:a05:7300:641a:b0:2be:8216:57db with SMTP id 5a478bee46e88-2cbf99ec1bdmr3767503eec.3.1775323502804;
        Sat, 04 Apr 2026 10:25:02 -0700 (PDT)
Received: from localhost ([2603:8000:bb00:9b3f:5094:4d4:5bc0:f9f9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca793eecd1sm8003832eec.10.2026.04.04.10.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 10:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 10:24:59 -0700
Message-Id: <DHKJNOFD1P03.15QMM3BFH0KLB@gmail.com>
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <boqun@kernel.org>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: dma: return EOVERFLOW instead of ENOMEM on size
 overflow
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, <dakr@kernel.org>, <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260403212822.294288-1-adi.dev.github@gmail.com>
 <DHKECN57N95Q.2DN7NG4GUA24F@garyguo.net>
In-Reply-To: <DHKECN57N95Q.2DN7NG4GUA24F@garyguo.net>

On Sat Apr 4, 2026 at 6:15 AM PDT, Gary Guo wrote:

> Thanks for the patch, but the behaviour here is intended.
>
> Neither our `KVec` implementation nor upstream Rust distinguishes between
> allocation error caused by array size exceeding address space or running =
out of
> memory to allocate (`AllocError` is returned and it converts to ENOMEM).
>
> `kmalloc_array` also just returns `NULL` when overflows, so arguably this
> behaviour also aligns us with C side.
>
> Abstractly, the system is indeed running out memory because it cannot all=
ocate
> something larger than its address space.

Hi Gary,

Thanks for the reply, I saw at some similar places where EOVERFLOW is used,=
 that is why i thought we should change this error code:

* In nouveau_drv.h, `u_memcpya()` does `check_mul_overflow(nmemb, size, &by=
tes)` and returns ERR_PTR(-EOVERFLOW), it is kind of same multiplication ov=
erflow on `nmemb*size` before an allocation. Similarly `mm/mmap.c` returns =
EOVERFLOW for arithmetic overflow in offset calculations, it also has a com=
ment `/* offset overflow? */`.

* Also I saw existing Rust kernel code already follows similar convention, =
see `rust/kernel/uaccess.rs` it uses `offset.checked_add(count).ok_or(EOVER=
FLOW)?` for the same kind of arithmetic overflow check.

* For `kmalloc_array` i think it conflates overflow with OOM because its re=
turn type (pointer) can't express distinct errors, maybe it should be impro=
ved as well ?. When the API can distinguish (like here, or in nouveau), the=
 kernel does use (or maybe should use?) `EOVERFLOW`.

IMO two failures have different semantics for callers, ENOMEM is transient =
(retry may succeed under less memory pressure), EOVERFLOW is deterministic =
(the input will never work). Using ENOMEM for overflow could mislead a call=
er into retrying a request that can never succeed.

Thanks, Aditya





