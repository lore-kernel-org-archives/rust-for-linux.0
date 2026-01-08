Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F87280317
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 05:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767849474; cv=none; b=k7t1LhreP7/zA84PdfgyMLzhWjlpTHEZtSXfyHiv5gcTVa8mhYQBouSm7BQJ6fL3dfMVs+DsWIFpHcmQoL1yTX1G2f4DNCJlvJH7vqxTw/iQGzyG4lm+rbxwmO+oKIQURfd5IGQoswOa3D3Rd4Cu0Yu1PSwQ8LaL1QX2inYkkE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767849474; c=relaxed/simple;
	bh=zfaWPieax6RU5tc9kXenF3uSle8+R4n2eeM43ti+8dc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kUjDnA9ybJK7VZiVpcsiofPtSReMihqKdo41NL3u4/XiDnGHM1QT60e4DGlfICYY4TSXmZX7NCQK/KYifVEYY/huD2dr+l9twjuZdrR0L9AsqqbJuY4PGAvvlqhdgSf1EkafuSRJ7mEymhUBG+i6GhETDoVxaac3QQXPFDZjG2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOJdckbg; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOJdckbg"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34ab8e0df53so2355303a91.3
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 21:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767849473; x=1768454273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfaWPieax6RU5tc9kXenF3uSle8+R4n2eeM43ti+8dc=;
        b=GOJdckbgrwovKu7QZNYc45CZO4h6dYiJi114Kprv+6KXmPvzH120ej0WhvDOcpqRjh
         0CCoaJat85cMi2kv18bCY/QRGmuPQkslQvCJ9lhrU2sXaribDk1uaKw5z6nr6q0sE6Pm
         YpVZcjiBnEVOt8BDMGgmZm9S44YUuMUoW2UyT8DQj2u19QgQrLHAGa6N4Wv7c05P7maN
         XZwqOp+hIVAmbxx78q9G/UaG1um8dhbBPVYeU2LHwoaM3Z5EG5hjtadgNzRy3NHNm+2T
         JrwDgcF7hzMkzXpKGYsMS8tigBz/I/wRolHo5oZZvcXJL1lPmu1QbTucVlOa1hl9A9yC
         qnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767849473; x=1768454273;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfaWPieax6RU5tc9kXenF3uSle8+R4n2eeM43ti+8dc=;
        b=Z/DDNLJuRWo98pj0Syexnof+c381QSMscixWl8fNUZULovNrqJI2OzAhFfJFdU8PjO
         +i/FPTgUgb4MdzzOXigvmuNAVsWOprculvTKMJVaFmVqEfPxfRIAa1XgZbOiY6KkcZNe
         hiwLVDpAvzXLaiMQb3efABBazlWTRoBncOSpsrgw44rZE+OTwOrhaczpvP7nRgE5oIIQ
         ywhK0bBWiflyc5GkrIRXQUTKMD6xMrqFFplKwu2aPUpXdZe135IuIbfx5VkARdtUmqf1
         O+/XK/bVL5gbtvAGkvCQm4z0NazwEoJKENkAIa3Y3fzAz4AArgdO5KZ7gNe+D7HKVjpw
         h51w==
X-Forwarded-Encrypted: i=1; AJvYcCWGUOt232FwnyuwoiTmwYl7aYd+hEscViAAyaQVKgoeM7+LNmuanRYp9H4pV3Ia2lwhlFyw0oxTP+7fCCILeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvZF4743LjZJ+ZZlWi5s4O+S7hOBkNbRyOT3SIGyGFMX/tsifc
	KbdvqGhANLurl+lzWi5PmIKnzmzeGuZSqMwOOsef1fBO8rxx5s9LPyeB
X-Gm-Gg: AY/fxX405DLHTNFKBo4wR48Ty0SXCkJeP8yGNWtGtvwEF4154UV5SJVelUAxShGTZk2
	WtYyTatx3ayfHVQllRCljlpzW+fgAyPWzbj+KBPiROgzs99GmwXV9SFV2KGeyjXjoTG2ODO+zdf
	vkHn4bXfhApUUKy9baS6mZwHt6BWiMKRnXxqPH/h3/Y6Y+sLOHyL1PihuYT5ZyvrMDWvI7YMqi8
	GkUXNiU3Yh/eC/Px7y8ZAv9shc3qmLb+unMNRt2TXElXzenrSkU2Qe9a0+edhJR1nXAC6pld0C0
	GFtRgrCA1dp9I+9G3s7nUgObkJIHjjEu44Eb2UmzWEV68vv4YRKdBdDzWMjrhWZp1A9j8IKexTV
	+Mkx1mZwy12DfXJtYrP9Rsj3O2LjP4cqU7j0+hhq3yV4q8P1Zz0gda06tfeHPRaSgMeamOLRONn
	hh7BIJ8IBcuT4ZNL8A74WkUzDcLHI3xpdQO5jAJubhVfBb4UPiMzvP5NX0dTcq5JiynMA=
X-Google-Smtp-Source: AGHT+IFqdc9Sd7yWqiw47jt+H/HlOGVUHh9gcMNodk0QnAMZEsYFII0+WLMvRHm2kVCJFhGfJZZobw==
X-Received: by 2002:a17:90b:3905:b0:340:776d:f4ca with SMTP id 98e67ed59e1d1-34f68c621c8mr5149473a91.26.1767849472591;
        Wed, 07 Jan 2026 21:17:52 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfd27953sm6624573a12.11.2026.01.07.21.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 21:17:51 -0800 (PST)
Date: Thu, 08 Jan 2026 14:17:40 +0900 (JST)
Message-Id: <20260108.141740.733187589346821469.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, boqun.feng@gmail.com, ojeda@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, tmgross@umich.edu,
 acourbot@nvidia.com, rust-for-linux@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: Re: [PATCH v1] rust: sync: atomic: Add i32-backed Flag for atomic
 booleans
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72kRipkW-djNqUy3hSb9Dy5LJOr1QgFAaY8vT6KjrMcDEg@mail.gmail.com>
References: <20260101102718.2073674-1-fujita.tomonori@gmail.com>
	<CANiq72kRipkW-djNqUy3hSb9Dy5LJOr1QgFAaY8vT6KjrMcDEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gU3VuLCA0IEphbiAyMDI2IDEzOjA3OjI2ICswMTAwDQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+IE9uIFRodSwgSmFuIDEsIDIwMjYg
YXQgMTE6MjfigK9BTSBGVUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5j
b20+IHdyb3RlOg0KPj4NCj4+ICsvLy8gQW4gYXRvbWljIGZsYWcgdHlwZSBiYWNrZWQgYnkgYGkz
MmAuDQo+IA0KPiBBIGZldyBuaXRzIEkgbm90aWNlZCB3aGlsZSByZWFkaW5nIHRoZSB0aHJlYWQ6
IGludHJhLWRvYyBsaW5rcyB3aGVyZQ0KPiBwb3NzaWJsZS9zaW1wbGUsIGkuZS4gaWYgc29tZSBv
ZiB0aGVtIHJlcXVpcmUgc29tZXRoaW5nIGludm9sdmVkIHRvDQo+IG1ha2UgdGhlbSB3b3JrLCBw
bGVhc2UgaWdub3JlIGl0IQ0KDQpBaCwgZ29vZCBjYXRjaC4gSSBvdmVybG9va2VkIHRoYXQuIEkn
bGwgZml4Lg0KDQoNCj4+ICsvLy8gIyMgRXhhbXBsZXMNCj4gDQo+IEZpcnN0IGxldmVsIGhlYWRl
ciwgaS5lLiBgI2AuDQoNClNvcnJ5LCB3aWxsIGZpeC4NCg0KPj4gKy8vLyB1c2Uga2VybmVsOjpz
eW5jOjphdG9taWM6OntBdG9taWMsIEZsYWcsIFJlbGF4ZWR9Ow0KPj4gKy8vLyBsZXQgZmxhZyA9
IEF0b21pYzo6bmV3KEZsYWc6OkNsZWFyKTsNCj4gDQo+IEdlbmVyYWxseSB3ZSBsZWF2ZSBhIG5l
d2xpbmUgYWZ0ZXIgdGhlIGB1c2VgcyBibG9jayBpbiBleGFtcGxlcy4NCg0KVW5kZXJzdG9vZCwg
d2lsbCBhZGQgYSBibGFuayBsaW5lLg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXchDQo=
