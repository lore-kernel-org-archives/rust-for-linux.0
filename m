Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793172657;
	b=QGRo/jf2VekLqCBaQqEZRF6euNsZHk35k33NUMx5E+I9LEDR6Dzl9j8iAfGvAW49AVKJ
	 KkQe3QZ5xQf7klHTmuRblsStSJPoAMNXiPVjbTuSdfzefdHWCPwtJcK0i9pPhinVulmrt
	 8U4yzNNNxQr4o0iF8jB1YqSTWnMHXdNasienrCnMLRV8MyTLvCJmK5kbClpGTgkx5fMg6
	 KyGCa91UHgGxGyzFPLQHttuWgP/riGHZbZGeawGdIaRnJlhtyAdLb6tmkip6nmmsXynLe
	 y4a7X3pndwaSYXacygRta9U0CZQC1pp+zequjBqVJMW9z2PPYK44G6xZ5rXWwAOpY8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4gvBxf1fqNFjM1GSlcwJUneHyiK6lU7SdqO+7rEXKHc=;
	b=Yn5Es3JWSo2LEXmL6IzPHuAKQTcVnE0eP7GKcesElUPXltH5nAxUZ+L/LItkwdo1DC0G
	 9gPOv7HI38/7zMKMKwUPR9skY2v1nNsx2f9M/OA9dz6aCcbSnMmhD5oIFKBY5t6omlTc8
	 cRH3fcMyjsy0Hy3LcFvaXQ9U8XNGiokJyqwEjp3dDaUKWVIgG/Aa9DG3NJ9iV4pROniEc
	 gqjCq27XspjCpMTZujjK8yQUdnpCVduEGXbOOgPmLILhyljnBnr3vYGIQiU1ljiMtlTc+
	 hThZaxA5HpJA0kbWSQvHjGlW9E0WbpmBUr21otCq3LxpFdTs8uUyznDc/nWXXGbyzKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJneuDjS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0561606A331
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 07:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0561606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJneuDjS
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3646e6de3e8so54938eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 00:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793172656; cv=none;
        d=google.com; s=arc-20260327;
        b=NRkrYqLwJU0IdpZuIAj+1OCLeKrqw4tT0wU4a0C3Yd6Uf4CYTTZGXmDkJwVRTN4dzx
         QVbnO+5+y/iKAuy6NZkWHS4xpae768OJBOVHQxWCiy8XG7Vam/DzQapsQyZbh41aE/Lw
         dhsHy0y9JmBEEReJ6j8Htg2xPA3QNngBp8p/KYnciRtMhSfzsuW2/Om2360X+hvG4bAK
         V61mMgj2pmnPpJo6fHsnV0i36FmIX8pBOG3EQ5WKlIUFJpiGstRhcS2cH/pOLTm2uAAj
         /oOv6BN5w4uqs1GYhfPKpVOzWFvHBdbbEynT1JNJY2cldjKI/NjzEzDo7iSf2A2LAqMZ
         Gg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4gvBxf1fqNFjM1GSlcwJUneHyiK6lU7SdqO+7rEXKHc=;
        fh=Pl3t5AyEvSumttBf5tC4BNbX1clnkFD9Lmt8oCc+yTI=;
        b=Xe2Eg2IxhGhSxcS+O/V+3qvXvVp2JtawUA6i2ySpKM39Q95W9aZH1aB2heCEWX8sn1
         9b6sCCFc2xhU9AQTmDqhBOchZ+wi4gU1Y7TtVam2v7kzoq4GXlfdPwfxwQ+08+L3NJam
         Kb2JNT/TV5ZRK9DGPcr6/EYZt1wHm+oCBx6v7DMsViY9eMq4fHwIo5jjt9YotHIH2INX
         7kpRZX9IDg6+8Fn96TNIIxVyf6PoPRebfW2366HbnZZZ+uNaO3tQhaBvx5QsrSwreMRq
         MpFk2NqsCAtfRXdnBvwcclhDz/o1xzS8JWugGnIwsuT/QfzJgojc2h77oBzPuXsHnXGo
         VIrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793172656; x=1793777456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4gvBxf1fqNFjM1GSlcwJUneHyiK6lU7SdqO+7rEXKHc=;
        b=bJneuDjSTeRtWYs9gLUzq94HuHAoFwhslEwQvNPXvw2Kkf8nTMJss5fQjjqL7AIBYP
         +OLGCb5rb4t0f94npzyFIsA8YRFRRJS3NojxyKYSJTYGqAzzTiwFflm66sPuzX630Esq
         U3/+A+SZl/zdO6wdtAg06Qbmn6YgjeW2B6plLyI6ziP7QOs+2JwIjoD1srOxCaS71ena
         TKSUL9xnCv0poX1LRcRkjNt+bemTiXtpAY0bB9PdvqM4zrtzXJpw/6xakmmH+zxEYgF2
         WcH453cXL0XYU6lfAeJTOF3hdMG5zjiZiLe9LTDgWXEcq5DT8WaKE6FbUYWhu1/eoXtr
         FKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172656; x=1793777456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4gvBxf1fqNFjM1GSlcwJUneHyiK6lU7SdqO+7rEXKHc=;
        b=QmBKc5T8IwdOOxJCATzkBnZe1B7BtWteKyWGrQ1YqhGJw4utkFeSHpu/l6cj+BelZJ
         AMYYKGqTcPCKWmxPl2aoKwsIrqSjNgdGdP91rJcQ+/1kleVqFrdQHvAQuqgl9Psazku9
         d+Q3RkHwLSmnb0uEXgcBYSgvT85DqCGxILMOq2el0SVlwWNsoQm5p0vFqsTA5+ZSl5sN
         yYhkiqDx+e5S6sTjO0hskyyGV29F3fM9B6GISXrGVK69H1uNKlWoIVxQ7epJKFq6hrfC
         XKMh1biyEwDaOhTco0dzDcE6tuLcfw5Mcs6e980RHC9iwj0Z+xO6+wbRloi2uJKB/KmD
         VMIw==
X-Forwarded-Encrypted: i=1; AKwUvBzePudH941HfTHGKoubGcUS3Om+jM6kVhtxekLPeJ3SwE16Vp1Di7SfovLJNCsQA/1J9ZgTyVBWylS0ztVpjw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLVvFSPGHlLu7nMQ/DA6yMYaCaoVi/4UxkbO54VvZCiF/Od0B6c
	QV2QeWc994Cn+rmGXWpE4ewG7InLAnpth9w357ZyIJndkKVuLDwfpPqRhiwRoTlw0yDP8dmwOas
	0Q4upOHt/socKpB/vno0O1Io2epQ+dEo=
X-Gm-Gg: AYBFou3THIYkFDWD+gcaKp0drARx9snxJDUS8AFTcZPEuzhs5DzjBAvNJuPVF6iUevF
	u3s4nNcsp8zAI1t9Dw8gEJFfOUehCLP663PusFHjppkpea5OTt5oIcLUzEE+7AwLg+PZcXVg4M6
	8o5cxPH+Zwd7g8rEpmlbsUS4eAfSIYaRMVmDliwnx52qN7+SHbHRdSBR+8okOL5pXnFAVhlxKkm
	XNqqYfLdnE3mBIP1ltV67BeXDOCuerqRLy6anENj5sFl+7XglDUV5fbXPZ9HxgZ1oX8/F5/KLXz
	+VmTjMT71eb6OQ89c66wRYcMIS2dzNO5uwS0YJF7Mtf9QJqHN3pCtJY4iQyHnCojJGAIeaE2UGM
	kxyEbQxxLGZewH5bTRE98+Byjczoj/g1fhzkbn0F64dP4FAQdBhnnWKR3ZDipcTMmPbq7ADCfr4
	G4ou5lBXZ4ZWs5rul5uqhVpr9ecPb9AiHC0K6aTctmU2usXucvYuJM5BBrXvq+KDgv1SKULYem1
	I/I3A3ndSdx4fDDiUK5jABVB29LgzviWtt8
X-Received: by 2002:a05:7300:f484:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-36a1fca875dmr3770812eec.0.1793172655949; Wed, 28 Oct 2026
 00:30:55 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io>
In-Reply-To: <20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Oct 2026 08:30:43 +0100
X-Gm-Features: AclHuK_uiWS-PXbCJG5cbGuuSSYIZS7YP8Echn-C46nxtbCkTjeTMaSgo2vlD0w
Message-ID: <CANiq72ntn6ThPz9Q6+BxU6w-x2jUQ50xpiy1_gCRi6o0peHi8w@mail.gmail.com>
Subject: Re: [PATCH] rust: doctest: fix line numbers after crate-level attributes
To: git@younes.io
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:32=E2=80=AFAM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> Twelve in-tree doctests start like this, e.g. in `bits.rs`, `devres.rs`,
> `init.rs` and `std_vendor.rs`.

This looks OK, and I think it fixes all the cases we have currently,
but it doesn't cover every case one may write (like a multi-line
attribute), i.e. I was wondering whether the complexity of this is
worth it or not (especially if later on we try to support every case).
But it may be that never happens, or happens way less often than even
this case that we may not even care.

By the way, why `saturating_sub` in particular? I guess because of
underflow, but can that happen? And if it can (perhaps in a future
compiler version), wouldn't we want to notice?

Thanks!

Cheers,
Miguel
