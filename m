Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257D03002DF
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 10:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769767440; cv=none; b=iwCOjiKyVuSfop4RNcKVyBtENwKVXdlSdpoYlZt1E1iqNI8PushPDT699CFmKe5AVp0EFeaEC3lDyEx/G5bYmWx1ixciRYLSbZjA4/CMMdQkPd+a6wNHKO89kqYlrBwXXgvZNTZHtH1s7FRJijJqRzQYDHmvBe3RQqiXwrz68SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769767440; c=relaxed/simple;
	bh=iG5EFLIToVmaX4Lo8n6rv9sq2nVvIASWkP9kw5fJngI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KbHCaauO7gkFHAE2TKosfct12ZlX5uXJy7w8SW4MqCDfYuwJpTQVh4RsgDosDTGjlsODGnT1ejfA0jLlbSo4soHRzaN0sLnT7/kJxkS0IVBH7pNdka3tZXu0GddNFsGCTv8KG2sHrOKZP6gcEx1ayN+ohSYN3qIt6DuazMdEu0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbA81l6q; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbA81l6q"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8230d228372so1025389b3a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 02:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769767438; x=1770372238; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj2UVr4AwkNfFQ24cDHGjp0w8M2eMkgYBCeN86uDgnY=;
        b=fbA81l6qHMH1otGRFfkKDSSvRN0XGL2qFDFO5VZC/1dxDpWUn85vNRnTPZsPMFhgu9
         Hbo2C7d5w0mpYJRTyYd9YLFst38RBn6UKrhwjwXE9eltEd5OHax6ccHjUiG1u5RUB4Cv
         +cZR17/NQTXSI2COjldxdug3szO/mRsiHneaiXNoT5uAsf53O3p7/adW+mprMZ3m7/xp
         eD7e9lZi4YcVltbMhwdC34l1zLZXkLhezJqOrT/SGwokbS2OB5/HbJDZAFaUCN/VUinQ
         eDMlyhGNu/jFwhDjdNmBdpSXxGWNKCzJ7QuqG+J9nWzEKoNdNx0Jf8Mxw8vbKk1X2RRV
         /Gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769767438; x=1770372238;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cj2UVr4AwkNfFQ24cDHGjp0w8M2eMkgYBCeN86uDgnY=;
        b=ia+6yNTOcR316KdWuKM5+45Gl+Xv1Ds+Onz6pEVr0B+y1WVXI30Du19O9XafDROw8V
         cxSmXR0kfON7nQEQCMg1vhbdPsYORnIHN9GWgfbFTb/mY2MRmtjGj7CS1r+rzO5kBICa
         dBlhGWbBT8m3WeB1hVqGaxAyzoki3r6HH9bjJfCocgUhVMdQJFVFo0+QQwinDWRSts//
         DRMCk0M5wANsasvYz4Kx3iGIvEF3FxRzycKxYvqU2iAix5f1VW05VWJ8w9fMoM0MPcKy
         49bd8m+JiFKgN2MNS9cXEJ/F4Il5oqGXPL4w2XOgSY/NLYC6A/FcNESqYLSiGkoEc/JB
         UrWw==
X-Forwarded-Encrypted: i=1; AJvYcCUPKPcOYciywOmPaWRFCBka2+Bfva7qfwqxDvcP8iAppVIIeq5OaRYrmYb5Q/2WGjDehD0XuvQsg0uzKrGaUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGzQM5ofgSIJWK5ImQ+qVNADQXeEFbqeMES3DZWOFvG0OzUbE+
	RMdmayN4MRvHzAjUAGt2C1buQQjQ1yK4So8i1bbvECgS9nJfh0xJlKPt
X-Gm-Gg: AZuq6aIQsTmpf0t/WRzn6B935NhHLiS01l+fwiAdiShGoip3ocHWn9rBZFGMCTWqLRY
	CWYQRKyrbEGLBK/xOz4Vyta/xyb4WM4y8I9SxpcXvp2OQlajlKEWuaEpVZOvO5X/VcSXArWnSj+
	0kbPobTITh/cw512M9i/V7XzxvV192AFtrVxSddqsrCVjn/8FwD5v5J3D7OUBqlUXUFaUI+a5a5
	FNuXada2BVTD0wLcNqOx+XJNNcWrccJ/lPzW2UZTmCOrWBUswslJJ0kbO3ppNfj6A90QWrnu+ws
	e1nTcEKPPidyyCGoRVVjGSkMwJ/KSqfc7Uvvp755it+R1C6kPLxW3+pKl7zYttQiJRSFsmG1pjC
	9xASLhp6Qxh9ymJJxCyFwTWnX8wzsjaoEgyRXuD4+FKt0/qpR4K6m/R2BR73VE28K3dWDxHag1M
	GBqXZkwg==
X-Received: by 2002:a05:6a00:1ca1:b0:823:167a:4790 with SMTP id d2e1a72fcca58-823ab6bb713mr2216855b3a.26.1769767438441;
        Fri, 30 Jan 2026 02:03:58 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b48531sm7602480b3a.16.2026.01.30.02.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:03:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 19:03:51 +0900
Message-Id: <DG1U72B6ZZF9.26V06STNHG5GC@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <y.j3ms.n@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/4] rust: macros: add derive macro for `Into`
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Charalampos Mitrodimas" <charmitro@posteo.net>, "Jesung Yang via B4
 Relay" <devnull+y.j3ms.n.gmail.com@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <20260129-try-from-into-macro-v5-1-dd011008118c@gmail.com>
 <m2qzr81jrd.fsf@ip-192-168-1-196.ap-southeast-1.compute.internal>
In-Reply-To: <m2qzr81jrd.fsf@ip-192-168-1-196.ap-southeast-1.compute.internal>

On Fri Jan 30, 2026 at 1:11 AM KST, Charalampos Mitrodimas wrote:
> Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org> writes:
>> +/// ```compile_fail
>> +/// # use kernel::macros::Into;
>> +/// // `repr(C)` enums are not allowed.
>> +/// #[derive(Into)]
>> +/// struct Foo(u8);
>
> Should this be something like this? Also on the TryFrom (patch 2/4).
>
>     /// // `repr(C)` enums are not allowed.
>     /// #[derive(Into)]
>     /// #[repr(C)]
>     /// enum Foo {
>     ///     A,
>     ///     B,
>     /// }

Nice catch, I'll buffer the fix until I get some more feedback.

Thanks for taking a look!

Best regards,
Jesung
