Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BFF3FC5B7
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782495705; cv=pass; b=s7UfRfTKZY092d2Li5IZX6zgbvArY8kR8Z/2wT1yG60OKvu7uqKV4iePNEeV2g0A4IxCnIKcPO5Z78w/fnwkty7fjlIr7w+fkIkr2Qa1BVJw/qJvKD9xjz2gBkKe+Ek9lkB797181W43uhoXejXRQPmimfQUZs0psjqMYpqq1oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782495705; c=relaxed/simple;
	bh=+DzHSnD7L/2m4CSZY2dtwDB/ltwkTOioXrGGOZwG6BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C72WwQVusRsm8rvTpFD+WGoX8bpZgoCuJCRL2hpMaEjcvlv6mZ8MXpif1o7BCnxF1c7yCXY+ed87gQDNCt76BDgofFV7bQQ6mFE8bsyKyr3SuP1MYYoioP2qd7l8w1OmATruuFSpDRhCmuOvPWXG03l5+v/w3HaVTg4s5cZMY8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i57gKkNT; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i57gKkNT"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e6d2f297f4so682803a34.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 10:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782495703; cv=none;
        d=google.com; s=arc-20260327;
        b=Co3PvcfotVc+z7IdeN1TLaEZQQFMd6GqH3moTQkWB/4kqissmeWmGKHx1oar3/eVru
         Lk46qw9bzxIhlUOsYZeuDPbO/iIRBNylIXlDGoMr6dsBMY3j9j4Zvtdgn4qBEiT6zH8/
         7Ekqe+aEHkQ2YNdQGbAjUT67/B94t26B+JSYGV/B/40jOc3q5/h6/XDoz4WRuZZUIYqr
         Gn1GvLCM2ikrrQ7P6eiC5ols5qR1pSA8VB6f+LS48t/CNtPx9D47q2OaUMSu0aN7nLst
         +32JajdegrMp9I1sWGcS24f2gLBU72Gh1ZIW9aWDmgSnOQsuZ155LpQLhGpJDqMubvXt
         Vckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jLP12Tvnhxz7EW5GQyhj6jTfDrZDZZGaLiZTc/gpe80=;
        fh=QfNUb08Dk92rNTZvby1ZuYdgPZEpeZC4N5idZI0d6QI=;
        b=KImupyjwHnlH+xOAHsZgAjSQifbVMmMhdOA/oK7JTL7AvA6WI7EGLsVYrBob6GL2v+
         WETtG0tB+FlvLI7/mkLRGA2mAB4/x6JwGKZT2SCdASpKDNGESW64w83Bod4kp59j0cnj
         Cy/s15Hg8/Mg1k8kn2ceUtzMUYcDu1oGZUAIWjnKJzk8DtziIpBUcCWcwGW53SM9zblb
         7YqPWPqbemPGzwckVuayiJytxW4t8F4M8r63Z9EWL8zhH5jAW7+VYP97D2IH5U/tz6Ha
         AZnA8GYNGi1oWfYXtLkwB/RMQco1SEewUFi72oFIfeb2YsVZwx+LilViFwNI/xSTzUKf
         NkNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782495703; x=1783100503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jLP12Tvnhxz7EW5GQyhj6jTfDrZDZZGaLiZTc/gpe80=;
        b=i57gKkNT89d/h+0LuC1KM2iKcNwqve++3cOqCTY2hxWkTsF/l+7lObCn+8xtmFANKu
         8n+HwL0kU9/AoEL/2ii/ho6eQQlL16cIhmdSUt6IcBfA3bC1EeQ42ujOyG6L1C5I7z/k
         sg9TX03rRjfiHCU6Q83kOOIuo4uVTA7QSErAIG+R3B7LtnhXlRqdNlLXMiwNmMpPzX7k
         hNJPP9xFdzGU4ZUxVamFuioZMfCr7CmrbqLNGhuYvgB/g+wGs7tgcdiVLR/6c9ZqxWBO
         GLO6BCxqIz2/IfKl7MtrfFmdsD3lSK/XlXsSRZ8apuBmifHPeUSerZatt2jcrgnDL9mS
         nV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782495703; x=1783100503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLP12Tvnhxz7EW5GQyhj6jTfDrZDZZGaLiZTc/gpe80=;
        b=iYrkQW9oEde7a1n0w5RgHQjEQSkqmydBG7TxsArabXTU7t1or8vtor+bqC0UzYGwdU
         IJJj8eTLJRsnjqRSg8Jr1zkgNYj+Lso2HunVwEb1nptJ6AEcSUNXgpyr4ZoxyXaITo5R
         Do8BS6XjP5zRrAmh2medhpfYy7nPFWze9qnqDXwrlOwVuk5L5mbftjKfBWHNFwFDQ9X7
         /YZSG5Rb0xQuSs2+kCkmjxbyP/qxgH4AY/TeN2HYWlu6zpnobM7QylOIwjKJ92Xkf/Y7
         JlywTWEOOwoGUSO9vCi7NKI9rAvMIDfepYAscdFx7FoFTJAyzrWGjZsVXz3nnKf+WT/r
         kIZg==
X-Forwarded-Encrypted: i=1; AFNElJ8O84YshcGohpd9VkdJbW47rjbx3o4te2uRMrt6hVN4+h+GmKHJfCE+DiBYDASQFzIyrzvVvnDkqUXxGEpMkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKuh3f+R4/3i3HZnlk2O4ivTW+F0jiBhyr9UwByPPVVxaK1P8K
	FcitbOSi1+jyZ3GovtlFoT592Bot7XDLMHp3+eQpXWLCEjf/4CVPzqH9d0cllxAXF5ybquLRCi9
	kYHxcSHMbUBrsqefUYB81z78e4SgR/TI=
X-Gm-Gg: AfdE7cnnNhaEcniZ3aX03fL0bRC5D6DO4xNF10ap+p/oTB5syEgwt8IxwLw85m264rd
	hUFsIhC5PKL1KkoEqhYM2glt/W0cjmez0djO0jxsaN3TEz4XoizrP6ECPHfpvZfVP0hZFaqhfIf
	K2ENJar1lfEOVVf89O+ipyBZ7bfwMg93ntQSzbDofXv2SARHYC43u2ym44pOuxFnfiPF5UoFg4Z
	3Lmax5E7u6sJPoqPUOnTLVGf/M6JzyB6raCrHA3qnkQE1qaTwec90pVieXiOi2bDHIA8V1W3FrX
	c8Wg3URVocxWeY5ZYxR3wrTRK2mf+GyQxM0OuhbKM4T1+nnoWe7DRFM56abIka2/F0W+KaWavxG
	7nk/2CBFykTNjClmpck/9oP2G
X-Received: by 2002:a05:6820:a0a:b0:6a1:50eb:d520 with SMTP id
 006d021491bc7-6a150ebe0e1mr877474eaf.65.1782495703089; Fri, 26 Jun 2026
 10:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-rnull-v6-19-rc5-send-v2-0-82c7404542e2@kernel.org> <20260609-rnull-v6-19-rc5-send-v2-10-82c7404542e2@kernel.org>
In-Reply-To: <20260609-rnull-v6-19-rc5-send-v2-10-82c7404542e2@kernel.org>
From: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Date: Sat, 27 Jun 2026 02:41:32 +0900
X-Gm-Features: AVVi8CdvARASe7Bopjeo_gHK1uUJA3mCPHieQrToP-jIjvw3vAaNLMrYIkVgFqI
Message-ID: <CAGAB667mVuECQDwYDij5PcZ-fvqr-6womuRCHibrwiR_wP=YDg@mail.gmail.com>
Subject: Re: [PATCH v2 10/83] block: rust: allow `hrtimer::Timer` in `RequestData`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Jens Axboe <axboe@kernel.dk>, John Stultz <jstultz@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 6=EC=9B=94 10=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 4:23, A=
ndreas Hindborg <a.hindborg@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:

> +    fn cancel(&mut self) -> bool {
> +        let request_data_ptr =3D &self.inner.wrapper_ref().data as *cons=
t T::RequestData;

I think this trips clippy::ref_as_ptr, which is enabled in the top-level
Makefile (-Wclippy::ref_as_ptr), so `make CLIPPY=3D1` fails here under
CONFIG_RUST_WERROR. IMO core::ptr::from_ref() would read better.

> +        let pdu_ptr =3D self.data_ref() as *const T::RequestData;

Same here, I'd go with:

    let pdu_ptr =3D core::ptr::from_ref(self.data_ref());

I applied both changes on top of rnull-v7.1-rc2 and `make CLIPPY=3D1` passe=
s
cleanly here (the two ref_as_ptr errors go away, no new warnings).

Best regards,
SeungJong Ha

---
I'm not a regular reviewer for this subsystem =E2=80=94 I just ran into thi=
s while
building your rnull tree with clippy. Let me know if drive-by notes like th=
is
aren't the right fit here.
