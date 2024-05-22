Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696998004F
	for <rust-for-linux@vger.kernel.org>; Wed, 22 May 2024 23:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716419722; cv=none; b=SbFBAOBvcJjNU7UwP8Anx7X1GyxxA9cdaOdcXpuBGiB1G+TLnNGjiuzEAd2wLFAe5D4Rv7pWYEgfxkVcCOJVebQwdjftFCjWyVLUf3WCxVt/w520nyrSCAqRP2T0dCSprY/wUcywlS3hYGBSwSBSEe/YiuSWeiTLHRH+ISYHWSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716419722; c=relaxed/simple;
	bh=Ir2XqinlUrPpaQlopq6pGICD8nECQfQb9VlUJ47Cml4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UdkcHfTDZwWaM2VkKCno9vr2UEji7B+1k6eznNv5ZQq09BaDF6SuGXoOwvRpJ0tExba5NOXZ5KTsfckcPJ77ThrwbaSZANo+1thUC1oWsPFe4xnQW4/tj1SUCfCMexR2a/IcrTSxThNVENRRz4T6rKfb4JbbaIehwVhUYnWPP5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku1757oY; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku1757oY"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6f0fa5eb6b2so327329a34.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 May 2024 16:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716419720; x=1717024520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ir2XqinlUrPpaQlopq6pGICD8nECQfQb9VlUJ47Cml4=;
        b=ku1757oYdRJYY6VbZ9xoVhqjtoPz1448vVkz43lRXsfAu6GwtQhxhEVsE2Rvza2lX7
         Vybg6d+S394njPj7kdOmw7LbUHTu/qrrZMhmpvV8wsM16aX8VfPDQ++Ti3Q8Hw/z4wwV
         z0RPnanRabZAz2Mz5fE54/S43+a+WodXYFxuJbfU7sBuKXpEog1RyrStmmICcFoYXIJI
         JdQcYvrrT42fXomq0wbLbmxF0wWhmfMT4+kF2Sygw/o7HzvyMbPVGly29tdixIPrRGsJ
         cNvHK8cHSsnuuPjDQ2uTfpOzLN6iwrXAUTD5yxI/miNfMPdEenkz+LrbM0LYuiRnV2I2
         uzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716419720; x=1717024520;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ir2XqinlUrPpaQlopq6pGICD8nECQfQb9VlUJ47Cml4=;
        b=Dmk/pd5I21YKkO+JOe1jCY9mDsZadMxXQTY5CJlFffJ+ifajT9AXd3P0hcV0H6NXZB
         hg2y7Sc2UcWxgR6Z59da8LcswkpogCpp2pXPsUHXxW1kEnJ6WyG9MM4w6e6eCAT40TP9
         e4f2taAEbC9kCadRp+1Pi+LswmYX02gVzVp2gJeWg/SApsK4eFrZfm4Z8Y4DtF4T+7xu
         V+Q/GM09Le0zGRY78CFq3Bj7sQz/GQjsJxt5pTd+rDXK9CEUm66EZVBrj4kYCO6BDf+T
         VOz+Q09Rqpxcrt+gtKv8rHhxBu7HJ6E/ZrLdM1KZbK88rRgrjgQYVsQ1f5+Zfedz9jMy
         pE0w==
X-Forwarded-Encrypted: i=1; AJvYcCW6MfKaNdacDjlwqJrtq0qw762Zc/O7Ut98dDFdqR17JU9KNT7JYo4Q9S2gc8Edd7OxmN3Ucw/vay8ZboDGMTdOERUdjKZQzhArnn3ZxSU=
X-Gm-Message-State: AOJu0Yy2G+5gIowy0bMmPL7Mhc4vbxNRLc4Cb2TDrOZmPIjc9LxW9ClL
	DB3dJwuRthgcb/aAcqIxHs38uquveeTbOgdBSJ76uA6xtqaoEQGL
X-Google-Smtp-Source: AGHT+IEg0tD1wihn+c8EcE3GfwFZJ9P0oCxBgIaw/cJq+yGvGb5ZmoLis9eA4mwP5hlUp53Vcp3WSg==
X-Received: by 2002:a05:6358:2921:b0:192:82da:43df with SMTP id e5c5f4694b2df-19791b7d6d6mr377565255d.1.1716419720266;
        Wed, 22 May 2024 16:15:20 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66557sm22855335b3a.44.2024.05.22.16.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 16:15:19 -0700 (PDT)
Date: Thu, 23 May 2024 08:15:13 +0900 (JST)
Message-Id: <20240523.081513.81513679981916366.fujita.tomonori@gmail.com>
To: pstanner@redhat.com
Cc: fujita.tomonori@gmail.com, dakr@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <35fef820ed6e67f2203e78735fc9e15248436221.camel@redhat.com>
References: <20240520172422.181763-4-dakr@redhat.com>
	<20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
	<35fef820ed6e67f2203e78735fc9e15248436221.camel@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

SGksDQoNCk9uIFdlZCwgMjIgTWF5IDIwMjQgMDk6Mzc6MzAgKzAyMDANClBoaWxpcHAgU3Rhbm5l
ciA8cHN0YW5uZXJAcmVkaGF0LmNvbT4gd3JvdGU6DQoNCj4+ID4gKy8vLyBBYnN0cmFjdGlvbiBh
cm91bmQgYSBDIGZpcm13YXJlIHN0cnVjdC4NCj4+ID4gKy8vLw0KPj4gPiArLy8vIFRoaXMgaXMg
YSBzaW1wbGUgYWJzdHJhY3Rpb24gYXJvdW5kIHRoZSBDIGZpcm13YXJlIEFQSS4gSnVzdA0KPj4g
PiBsaWtlIHdpdGggdGhlIEMgQVBJLCBmaXJtd2FyZSBjYW4NCj4+ID4gKy8vLyBiZSByZXF1ZXN0
ZWQuIE9uY2UgcmVxdWVzdGVkIHRoZSBhYnN0cmFjdGlvbiBwcm92aWRlcyBkaXJlY3QNCj4+ID4g
YWNjZXNzIHRvIHRoZSBmaXJtd2FyZSBidWZmZXIgYXMNCj4+ID4gKy8vLyBgJlt1OF1gLiBBbHRl
cm5hdGl2ZWx5LCB0aGUgZmlybXdhcmUgY2FuIGJlIGNvcGllZCB0byBhIG5ldw0KPj4gPiBidWZm
ZXIgdXNpbmcgYEZpcm13YXJlOjpjb3B5YC4gVGhlDQo+PiA+ICsvLy8gZmlybXdhcmUgaXMgcmVs
ZWFzZWQgb25jZSBbYEZpcm13YXJlYF0gaXMgZHJvcHBlZC4NCj4+ID4gKy8vLw0KPj4gPiArLy8v
ICMgRXhhbXBsZXMNCj4+ID4gKy8vLw0KPj4gPiArLy8vIGBgYA0KPj4gPiArLy8vIGxldCBmdyA9
IEZpcm13YXJlOjpyZXF1ZXN0KCJwYXRoL3RvL2Zpcm13YXJlLmJpbiIsDQo+PiA+IGRldi5hc19y
ZWYoKSk/Ow0KPj4gPiArLy8vIGRyaXZlcl9sb2FkX2Zpcm13YXJlKGZ3LmRhdGEoKSk7DQo+PiA+
ICsvLy8gYGBgDQo+PiA+ICtwdWIgc3RydWN0IEZpcm13YXJlKE9wYXF1ZTwqY29uc3QgYmluZGlu
Z3M6OmZpcm13YXJlPik7DQo+PiANCj4+IFdyYXBwaW5nIGEgcmF3IHBvaW50ZXIgaXMgbm90IHRo
ZSBpbnRlbmRlZCB1c2Ugb2YgUXBhcXVlIHR5cGU/DQo+PiANCj4gDQo+IFdoYXQgaXMgdGhlIGlu
dGVuZGVkIHVzZT8NCj4gQXMgSSBzZWUgaXQsIGFsbCB1c2VzIHdyYXBwIHNvbWUgYmluZGluZzo6
KiDigJMgYnV0IGEgcmF3cG9pbnRlciB0byBhDQo+IGJpbmRpbmcgc2hvdWxkbid0IGJlIHdyYXBw
ZWQgYnkgaXQ/DQoNCklmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIGl0J3MgZm9yIGVtYmVkZGlu
ZyBDJ3Mgc3RydWN0IGluIFJ1c3Qncw0Kc3RydWN0IChhcyBhbGwgdGhlIHVzYWdlIGluIHRoZSB0
cmVlIGRvKS4gSXQgZ2l2ZXMgdGhlIHRyaWNrcyBmb3INCmluaXRpYWxpemF0aW9uIGFuZCBhIHBv
aW50ZXIgdG8gdGhlIGVtYmVkZGVkIG9iamVjdC4NCg0KVGhlIEMncyBmaXJtd2FyZSBBUEkgZ2l2
ZXMgYSBwb2ludGVyIHRvIGFuIGluaXRpYWxpemVkIG9iamVjdCBzbyBubw0KcmVhc29uIHRvIHVz
ZSBPcGFxdWUuDQoNCldpdGggc3VjaCBDIEFQSSwgUnVzdCdzIHN0cnVjdCBzaW1wbHkgdXNlcyBy
YXcgcG9pbnRlcnMgaW4gb2xkIHJ1c3QNCmJyYW5jaC4gRm9yIGV4YW1wbGUsDQoNCmh0dHBzOi8v
Z2l0aHViLmNvbS9SdXN0LWZvci1MaW51eC9saW51eC9ibG9iL3J1c3QvcnVzdC9rZXJuZWwvY2hy
ZGV2LnJzI0wyOA0KDQpzdHJ1Y3QgQ2RldigqbXV0IGJpbmRpbmdzOjpjZGV2KTsNCg0KDQpBbm90
aGVyIGNob2ljZSB0aGF0IEkga25vdyBpcyBOb25OdWxsOg0KDQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjQwNDE1LWFsaWNlLW1tLXY1LTQtNmY1NWU0ZDhlZjUxQGdvb2dsZS5jb20v
DQoNCnB1YiBzdHJ1Y3QgUGFnZSB7DQogICAgcGFnZTogTm9uTnVsbDxiaW5kaW5nczo6cGFnZT4s
DQp9DQo=
