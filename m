Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43491AAD0
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Feb 2024 20:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708892907; cv=none; b=Myyc9lIdU4gzVdeMmb9LhlU7A1TyBNCkVneVZEa3mAIEf+gT4Dxp+d5bxr1S6G2Fv7UNBjCf50cS7OLJv54hfLcPCVKt4kkdmf0KZCUbpT7rnX/syRN2mmECyPUC+9fOysrvSv9ZnsrpiCSK0nbwX+YzReINIr1ovuMkWbNbfho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708892907; c=relaxed/simple;
	bh=PlTZ7Sn5wTYnABKxVRvJAJxDQONZMbFqdJOne9IP4LQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMwoFjXMro47NW5LjXpXAbz6V41jiXY5HdVaqcYvNFzDN1Pq/+4iUFc5jMSsPhoHWstoOeUMFCpiCMkTGbWAhAwoLI0/kip8upC2AohTBL6ZeYHiNmxnIq86qfXvLIFKYDf4lnUbLkb5+AhaEylXa0liFA9Zb5nJPsXsK5U3BSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lR00VPkO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lR00VPkO"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dba177c596so14793965ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Feb 2024 12:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708892905; x=1709497705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvhbmTWMAtyaqFxQhT8jwka2G+HehRsJ3xeHFO3dHiQ=;
        b=lR00VPkOsvzgi2GnDUoJYkHPsralY+YVTOjrUBM5I+Ut0i8h1FbUpqIm4of4IPCcmf
         5/k1Le4i/zIrgRL86L+X/qapZtGp8uWb6ufe0fz91UZpbdxicOQ0hZLQ9+SWHLBeLOLN
         0Nn9B4BQYBv16ykgUFaGfiRzzMWd1MqzaK8R9LBObaLQTKAMihSiMTkJJKeRCv9V0nSM
         JV7PQI3S2lfY8q7MZpFuAyhHGVq2BWigabkIOGMv5/yENq3tAtfMHankQaZ1UlYZR8Cx
         myHhrbPnfg72w+FW9hUkDzySoqKcHT3gpgOXOaHpH92dEZCTikYERYLVOTpIX+/G9F7n
         cHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708892905; x=1709497705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvhbmTWMAtyaqFxQhT8jwka2G+HehRsJ3xeHFO3dHiQ=;
        b=py7Ck1xClAQ9KtN8jlJAaepFSdEMB1rO1NxuS+vy8BFz8ff2Yg/D0DKpfb+Tq4pZkK
         bR60tWJPD/dQyszBKCZeSFfJCUzQf99t8zVd7yYJ2Cc3lpkDmpc5D+vu/OzTsGOumJIp
         n0rlKSaJ0RzOh/fdK2TYqyEYFiug5ctVCQV56afHo1Tiq0gSJB7ZbGioRmfzrfLxf4O6
         rCv1YbbdP4iDMYQIdnduHP6jLVWEZlm2ZCgU0QuzLb34lFTCmi5nsvSIBzkzKu8MD5Kz
         0aW8uMPPTI5A4iromvG0BF9ZQ9I6GHNxuW5ILSThIb5w2xUu22ZBN25ckfRFJ/P+QP2y
         vvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJb2ZWU8A1vy7ri+5z4J0xyOCrRqKZcUlXtxhZaeGrsDAwr9UpowISTtn8GHhT1DKMcUqTfq4Zu9REMLagu5xPlrYz26+MpWqOisp2Wus=
X-Gm-Message-State: AOJu0Yz8147rC/9LGMF4BolwRS6yaB5mzwj7YW3a3Wc5K4J37jZol4Md
	j4FhjzNAN8qizGAgfnGd6KP2y3BrQk0HvUEn69doSf+DFYqilO0jiQp/IPQQWACddyqERlnN5bt
	8kbM6kv+gth2s3cR0kO44sZkSQec=
X-Google-Smtp-Source: AGHT+IF1AI4Xf1co60oiG4jZJtrEUHef8J64D4iH7kLd/G9zgrKZlYP3vhuQv4HyY5cVmI3sqboK5Zv4CuCGFoMMxdI=
X-Received: by 2002:a17:903:41cb:b0:1dc:8b82:7f72 with SMTP id
 u11-20020a17090341cb00b001dc8b827f72mr3423945ple.16.1708892905068; Sun, 25
 Feb 2024 12:28:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240204075827.10747-1-linux@obei.io> <0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com>
 <0100018d73205a53-b7739657-2731-4164-b940-c633200a221c-000000@email.amazonses.com>
In-Reply-To: <0100018d73205a53-b7739657-2731-4164-b940-c633200a221c-000000@email.amazonses.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Feb 2024 21:28:12 +0100
Message-ID: <CANiq72kTNd=CehhvfFWUJFZP-J9KcfTi95+=_3KLLyk7xpX_Tg@mail.gmail.com>
Subject: Re: [PATCH v6] rust: types: Add `try_from_foreign()` method
To: Obei Sideg <linux@obei.io>
Cc: "a.hindborg@samsung.com" <a.hindborg@samsung.com>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, "benno.lossin@proton.me" <benno.lossin@proton.me>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"gary@garyguo.net" <gary@garyguo.net>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "wedsonaf@gmail.com" <wedsonaf@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 4, 2024 at 8:58=E2=80=AFAM Obei Sideg <linux@obei.io> wrote:
>
> Currently `ForeignOwnable::from_foreign()` only works for non-null
> pointers for the existing impls (e.g. Box, Arc). It may create a few
> duplicate code like:
>
> ```rust
> // `p` is a maybe null pointer
> if p.is_null() {
>   None
> } else {
>   unsafe { Some(Self::from_foreign(ptr)) }
> }
> ```
>
> Add a `try_from_foreign()` method that will return `None` if `ptr`
> is null, otherwise return `Some(from_foreign(ptr))`.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1057
> Signed-off-by: Obei Sideg <linux@obei.io>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>

Applied to `rust-next` -- thanks everyone!

[ Fixed intra-doc links, improved `SAFETY` comment and reworded commit. ]

Cheers,
Miguel
