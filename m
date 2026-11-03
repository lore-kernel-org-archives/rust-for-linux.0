Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793706428;
	b=q+4Hhejo9kC2U/LeRBcKldrRvkikIPuMNkW/yge5cFwZnYdG/wxF0DGiA/X939UdZ5YJ
	 mwyAHo/b58TZPDDiWSMuw66Qy3eKYrNXdQcbwrBmT+b1/kjlKPqTNpxKrHFb/gH+FVSRA
	 D6cfIbPoTJIGZdrk4s5MgaweOg+wX4RXb6UYARckwO4J0JzeNaQsSOmqu0L44wO1FixVv
	 5LELlHDtoFtnsdDG0pAmjxyO66Qdq2Fc9y2B5mQ8ija2BgjCfBF+T7EuXZm6hAonavjfw
	 jmP8G5ceE95Aa+IXhBk39GH0LeLPjj2Te7Qzj4qdzBCROjwU2oeSsF1f3sy0I0nlHAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=63+Sr6N15Tem/PaC69dUwWhb1EfP7tKH84k+JQqk90c=;
	b=JMhJrhf49VKlR1xx9hJ5QFwFYYHeezgN1RS9jJQrAXSV188RGbZ5VO54f4TUjuOUQ+Ns
	 VwqPX5ugGEtfIojyoPKBTmgyJXRWPPhE5Cje4+zPgtO3A8OT7Vq9gpQdMN//VLLdyNnfu
	 1vkO8zsdwqYMdYMxuEu4MU8IRg/IsygZ/DJ/Bu/m0G11pG1iR7rxNLgD9U/3wJyL2FHIx
	 UAB2TtVHkcG3cWUwoUC+U8lsxIsCBHujNGYeylXupyCySSU8I+WuFktUk+hw18hu/0ix5
	 WQ4VcVQwrvNIzoix7HK8XS+WhX0Ss893U5qFAwYKnj/W4Fu1Y+P+4twZaJ5s3crgTIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j8ZwgK5e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B0A606A339
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 11:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B0A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j8ZwgK5e
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3550dd02c9cso343388eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 03:47:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793706427; cv=none;
        d=google.com; s=arc-20260327;
        b=YldBLYybItoguC/wDGviZPWzSDPaTkRwDPqJTrR/3ivQVnHrFZbnMKT+lVI60OA7hN
         kfsr4CNMkmeJ/UTjjJFBjMs/ObB5ZOZZidUzQAlV8PZbLR1sMXWeQDWtUdhrWfVqG2rU
         AfQc3BZtzP4xwQUeRiXLKK7WTHmBLjiHOChbesVd7xMGE6deMcmCJsJnofTeKvyDbSvr
         d2ItXW70za30C84GlHWtkf+UslsLSPP98ROheIGgGceFD1dDUbhYwY2F8whh3iR4turk
         KAmbVqA6wlzOPlG6dT0gGbKSRewJKiQPeIv0LhLDEj4sxQz3t9/26rdQdkp0uw2ZxgD/
         wZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=63+Sr6N15Tem/PaC69dUwWhb1EfP7tKH84k+JQqk90c=;
        fh=HLa/RaSiUf6HiKLYch69XGGuVtlnxJ3P5OfgVpH466Y=;
        b=LS/dvnkl8vkRP7qGMq0X4spyJKAdquaI1HOyH7yBhvMiqPbP1rpNiz50bWRGF4t4SI
         KBd78+D7NdyLGqCKkExSt5PImhv4MysI5qI8qhD0aS0P2m11Sq42Y9zg7slrcN/v9MKO
         GOns18ibg1C71XKCdzbqV/IDBApGweCGNuhmpX78e1vKJZzC0Yi3hGIxzxsRAze4oEX7
         d9K+bsyF5jOMzIZ9+/ErfUxub1j4o3O2VtmCfDWEyw2ogEkJ5LnbJ3Bht1E1HjXcRTlH
         9Wy3l8f8Pd2yDJsdGYmoxBvTYCgD4hRQS/Aog6NZfPF5KalUBLTEHlLFK4vEo85AdfDN
         fFVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793706427; x=1794311227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63+Sr6N15Tem/PaC69dUwWhb1EfP7tKH84k+JQqk90c=;
        b=j8ZwgK5e+Ep8//cGU13Dkjva8YN4XYwT0Apjx7nC2RLmVsnctKBz4oiBwJb2FU30B0
         4/w9wIMneMh/hdKyE8mKeSmYEhdyLBPT+acCHcH/JM6eHpvx+uUfCpucxatJI3JtHyW4
         tU4L12H3ua5/BRkOnfXW6k2WQKvhxc1yQQeFNuqhy4CtWyU2aQBtOTifEpX8X0mnX7vv
         4M88GpusUCUv/3uvBBUm99RO2cAf9gqaQol2o1Tt/CEh5HoVpkNrdFK6210gJHrMphbd
         XsYlFVlBQwM5Z6l1P/t5YAHiGV/Tq7JwG40AlmU6JVIL8+9s0Sd5uUBgaURKgrglNcQE
         fJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706427; x=1794311227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63+Sr6N15Tem/PaC69dUwWhb1EfP7tKH84k+JQqk90c=;
        b=em0tGbg1beK3P+jM0JuT54StTPEWWYdJmF2nE3eSgYpicULpXLYhLK9SQMiuA4keXS
         FDlcFl1zBn2FUoT5zMUkqQkjUekRfJvoLNPoTvcoQ+CTmKm2FZdBy2m5nWwJgxntlh2N
         GaKZ/ORc50iNi4qGpL+PySQc3qg0OmjWhZwcpVM/1KjlnkWAdh1DUaGah7f9iXyViZ7N
         LRrRVA0lX05hm564XUz2DvBsh0sFYWE6R+L/9+0EFCYlLWnayQv5g7e7l6f2ScyuvuWh
         IHq79Goenbyx17yzr0eefwalBSkosCkjmZCvEvdVceQKHXZPfo1ewP4mr06Rt1P+QKGt
         mtVA==
X-Forwarded-Encrypted: i=1; AKwUvBzq7H2q/UuKXaTkvVcwNC9ZMSpYHcKJTIFiN9z9xLut1191bM0aTz2uYrCi4LGOXHA7+xMylVNKtdl3ibaI/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8GQdUu0uxAb5equVjH/MaLnQGcj2V+zDyA2NmcgAJeL7QlZLva
	TR8eMMoBFl5v9oMOFbxKo68lT3mJWD33u40BxaP8S8CPrS9gZXKvYnlQidekxcR0cd/jcJ1/jCJ
	7/5mgED9xJ+VSxlwyOhBXGvRZZz1rY4o=
X-Gm-Gg: AYBFou124GWMWkA26XbR0TJlwBPnBAbX7lXigmrVAQp1nzc4GTiizdTrwbnYtVAFWb2
	clhbjtqKFNuhjGsTRBGu/1AT7CZd6KRrHYU30V/4Ug3CQFpejCjOaa3YOdBWibkXZdkThkSyQt9
	1NLRLFUoe+bqee3zD+Ik8mjWgnHGxN5XFXWglnWOIMArIIbBOIc8ZfSmkKy9hbBBUMtgVaZPaYH
	Ftt15ZIFnvn8oOlCTx4t02X4KavZoBQN/iIiPY7YT+bOb/4B1tnVgMRgSL/89ePXWObutQcBbby
	pdLxb3RnQ/TBjxKilyFeDUDSF1GFPMm8OTx+90lijTGq3WrcsZMLBlaCZS87IPiIM+s6FT9MXzJ
	v5mCGg++amkVNkKQTBKRUPC7vGG6xlxlXlzo8/YW/XytLs/cab5fF2pUJCy3fynOuzGq5+wAMZg
	KFkxgVjQWa/xBNuY4HsXmyxIWHO0AjVLuBZfL5CNViD0Wvb3BXQMDBtOiDO5cLS2ERWPaUDqwgR
	w7IpSeCtipSl4+4SoTLp9WuTKN4CewvmRXN
X-Received: by 2002:a05:7022:c46:b0:1a1:9106:cfff with SMTP id
 a92af1059eb24-1ac5c45fd28mr27168655c88.2.1793706427433; Tue, 03 Nov 2026
 03:47:07 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <8yvpSoQ7ihtTj508nQU_nAlk2eMmGH5zK6H5pow6z5cTYGO3yL_DvqwbFMwqzhtbL-52eMYXpT5Cyg0g7fUN7w==@protonmail.internalid>
 <20261031003334.4161188-1-tomo@flapping.org> <87h5hzmfui.fsf@t14s.mail-host-address-is-not-set>
 <20261103.083342.865260022622203055.tomo@flapping.org> <CANiq72ka+YS+O31zm7sm7-at1TyPky+7W_5cNMLvqTK3=mHEgw@mail.gmail.com>
 <878q3amfd7.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <878q3amfd7.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 12:46:54 +0100
X-Gm-Features: AclHuK83vbBpXLFhNime5MS1HVJ1Vb5imDYJL5PHXd0R75LF_EmvGw_Q-XbMv7E
Message-ID: <CANiq72mMOQBcuUuxaArY_c5wxNG_O9D26roi9XQyODy87CHPxg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] rust: time: seconds based Instant
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org, boqun@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, lossin@kernel.org, 
	lyude@redhat.com, mike@fireburn.co.uk, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:35=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Yes, these will go through the rust timekeeping tree. I plan to apply
> them around rc2, does that work?

For me, of course, but I guess you are asking DRM.

Thanks!

Cheers,
Miguel
