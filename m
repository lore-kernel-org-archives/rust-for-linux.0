Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD73339A8
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Feb 2024 09:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709114336; cv=none; b=o5pGkFtT82aI9dCLtOR4TDBWCzY9OhtSgny6PiBTD2zu7uQd83Nqgw4qJ5Hvzjs5I0di/Riz20OwItxHCoJrnN5TQoMistLEQwdcvWwibG8W281qxOZNfT5feekklEQF+kOK0s+YxTgWXDcL1QvZRkeAnVr52u8gaCvBUI926go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709114336; c=relaxed/simple;
	bh=sleA26mV/tde50MP5rnI4lqz6QKoKHWgsEtYcy8hAeQ=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=lkdlU/we/7A4ffjDWmFcuiBXSE9mO05eZRBSqAhKnHKNcysVLIGwlDAGo3JS3IkKHkdMShbI4SLEkdRLoAHO8fMtBtJ1/HrUlG7NMywN7YuxwmclzXkJ09juIr7Z8N4cHYbT+BfzapFVuEKhPWb87CKKKZkcx2/wOOx3haxBtic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=icAGfAtG; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="icAGfAtG"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a293f2280c7so802937466b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Feb 2024 01:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1709114332; x=1709719132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tZSFA9TNC8Nuqr5EXNMkcxxuNUWYaw6b2s8R1XXBEs=;
        b=icAGfAtGBoyiuE+sXv/sfMoq5UqBO7EDQuP9lHWh3F4JAGfOaRcLrSeoOJqqKCpS9W
         mA/JiyD66pDLWyA0SQ53xr7TZChPtdp2HZFXQK0Oid37TgW/6bIufypipa/4T0u5Syb8
         4jbEUuwbtluIVPhDzICyNtUXbJRZ80KzmFPWY2upLHiKLt9ox7pawZQ2FZqXWOB/iH4g
         hoPKtfFPX8lt9RZhhf6eA9cpzQz5ZkzfDLs82QoymcmF7aOaT4UCHeWUBqC0L/Hwc9Wq
         sgPwsYt4VyWfHxaBK9tmIgfoC4Q2ay1FgRtf7IrhFyJBM0QjaKkhwo/YuCIWrQxOX+y1
         YYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709114332; x=1709719132;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9tZSFA9TNC8Nuqr5EXNMkcxxuNUWYaw6b2s8R1XXBEs=;
        b=Zs9FbtfROZ5dtvz1v/i1cx98GxhTwHTuo+W1ZyF1fRXclWJlxLX/HBWZLWAl3UfRW8
         BqQuPv2j/qSVCFFHzULOU0umUo1txDXG8L//SbX4ChpuFIw14hKRAjHgGh+ShZZKR7SS
         AQPvotIIWMaJMDkv9EIR4T2STskFbDwa8UJV70nRNQJDjcJZhnkQBu6bCpRPFhSzswNm
         XFxu3dAx6JaUN7LEz1JvPqG7h8e+fxYPEndTZ/IbNoZxrTUbeMHvBazAowIMVayOmTEc
         /XvCZ1WpzEFsBcaN8Av9mrpPj1GXqM2VBAVkmjqoLB9W71xFFlzibOSHaINUL1m0KAEg
         BY9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVa4L+bumQ8RmLgy2hVDsFhdxI5R0kJ5FGMwSHoD85A2OQ3qlNfBPt4R9FsCVkf9I8+XMPLHYodxRGr/fNxUDUkbenfrBzXZmfT94KUJdc=
X-Gm-Message-State: AOJu0YzmiwoNsU3qo+ddXpj24h7yIzaJR/FYkQIsQIgd3kkXSVx5iRSv
	7kjIWVrYs1GiZDjuGbvtNB5REm7Xb/Kj1jZIM8lvp0E8VpgQvKnEaAVFknp0CKw=
X-Google-Smtp-Source: AGHT+IFXvcS3SdW+x9XVkAFE4CV7oMvqgtzV0IZUMaJ7OLxvJfmzwEJF8ZwFxnNeHHgrppTXGMcNyQ==
X-Received: by 2002:a17:906:882:b0:a43:5dbc:4c04 with SMTP id n2-20020a170906088200b00a435dbc4c04mr4818890eje.48.1709114331601;
        Wed, 28 Feb 2024 01:58:51 -0800 (PST)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id f8-20020a170906c08800b00a434b5fcab6sm1671082ejz.221.2024.02.28.01.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 01:58:51 -0800 (PST)
References: <20240209223201.2145570-2-mcanal@igalia.com>
 <20240209223201.2145570-4-mcanal@igalia.com> <87plwi9waq.fsf@metaspace.dk>
User-agent: mu4e 1.10.8; emacs 29.2
From: Andreas Hindborg <nmi@metaspace.dk>
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Asahi Lina
 <lina@asahilina.net>, Miguel
 Ojeda <ojeda@kernel.org>, Alex  Gaynor <alex.gaynor@gmail.com>, Wedson
 Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy  Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 Matthew Wilcox <willy@infradead.org>, rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v7 2/2] rust: xarray: Add an abstraction for XArray
Date: Wed, 28 Feb 2024 10:56:41 +0100
In-reply-to: <87plwi9waq.fsf@metaspace.dk>
Message-ID: <87cysgap0u.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Andreas Hindborg <nmi@metaspace.dk> writes:

> Ma=C3=ADra Canal <mcanal@igalia.com> writes:
>
>> From: Asahi Lina <lina@asahilina.net>
>>
>> The XArray is an abstract data type which behaves like a very large
>> array of pointers. Add a Rust abstraction for this data type.
>>
>> The initial implementation uses explicit locking on get operations and
>> returns a guard which blocks mutation, ensuring that the referenced
>> object remains alive. To avoid excessive serialization, users are
>> expected to use an inner type that can be efficiently cloned (such as
>> Arc<T>), and eagerly clone and drop the guard to unblock other users
>> after a lookup.
>>
>> Future variants may support using RCU instead to avoid mutex locking.
>>
>> This abstraction also introduces a reservation mechanism, which can be
>> used by alloc-capable XArrays to reserve a free slot without immediately
>> filling it, and then do so at a later time. If the reservation is
>> dropped without being filled, the slot is freed again for other users,
>> which eliminates the need for explicit cleanup code.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> Co-developed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>> ---
>
>
> Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

Actually clippy complains about use of the name `foo` for a variable in
the example. Fix:

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 849915ea633c..aba09cf28c4b 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -185,8 +185,8 @@ fn drop(&mut self) {
 /// let arr =3D Box::pin_init(XArray::<Arc<Foo>>::new(flags::ALLOC1))
 ///                        .expect("Unable to allocate XArray");
 ///
-/// let foo =3D Arc::try_new(Foo { a : 1, b: 2 }).expect("Unable to alloca=
te Foo");
-/// let index =3D arr.alloc(foo).expect("Error allocating Index");
+/// let item =3D Arc::try_new(Foo { a : 1, b: 2 }).expect("Unable to alloc=
ate Foo");
+/// let index =3D arr.alloc(item).expect("Error allocating Index");
 ///
 /// if let Some(guard) =3D arr.get_locked(index) {
 ///     assert_eq!(guard.borrow().a, 1);
@@ -195,8 +195,8 @@ fn drop(&mut self) {
 ///     pr_info!("No value found in index {}", index);
 /// }
 ///
-/// let foo =3D Arc::try_new(Foo { a : 3, b: 4 }).expect("Unable to alloca=
te Foo");
-/// let index =3D arr.alloc(foo).expect("Error allocating Index");
+/// let item =3D Arc::try_new(Foo { a : 3, b: 4 }).expect("Unable to alloc=
ate Foo");
+/// let index =3D arr.alloc(item).expect("Error allocating Index");
 ///
 /// if let Some(removed_data) =3D arr.remove(index) {
 ///     assert_eq!(removed_data.a, 3);


BR Andreas
