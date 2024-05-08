Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DAF133414
	for <rust-for-linux@vger.kernel.org>; Wed,  8 May 2024 23:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715212715; cv=none; b=OHTDiftqxYQF/MkGVz1JI811H0oxeEzZwJqRBrX19tXz1INOOKbHWUCWE/KiZIVeyPFJOTyBybc/cRvFzeUJflKHNtDI0NhyqQTURrxWtudA2lJAgsvD+NiXWbyajjDGDaiCC62tvL3XZWqla7PtEGNFSsnHffnbCyyFMiNh3QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715212715; c=relaxed/simple;
	bh=vSWgJ2aek8aUoUzIn2YBCivh/P/2bE6M7d0OipEKRcA=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jpAWvYrS5ne/Ad+S6eQ4CsdsY2JA+CNCq3Dc7if+7GrmoxR1fyIDa+Yai5vdCr+Dkd2+8IQLmzQ6+oWhvuTceU6iD2+mpj8mKwY45pzaUtbeHI2YqzyxLYM0fkU8ykvPgSP089WY4vCbV6nphCOtgsg1hEYRheeqIgI1N3gz29c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nP/aScor; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nP/aScor"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2abae23d682so80463a91.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 May 2024 16:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715212711; x=1715817511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSWgJ2aek8aUoUzIn2YBCivh/P/2bE6M7d0OipEKRcA=;
        b=nP/aScorSXq5GP95IrGwDarI8T5/fHpNuwK0LRajT03W/M3WmjJra4V0qP6Sirtd4v
         Le218eaSuQWvB/PQSJGbJocoYtTXmRiBjkEWd8GofQtG+LhWOO3Ge+fkidOCQ7OnRyng
         pc+UccB1QTd7ddqYYHNzPLAj/Wd1Mp90DILI8bYFJgQFwEMjDj4TGM7bYNnZRBHh3VJS
         DYZiBPmFuTtS2zoOLLC7Bx0u7SlN4RZXPayCx5pxoSBUtQx6XLkiJtXpl1Ki2h5LBBKD
         +TPNNCr2oHtSJ3XtUvzeHgfyx7yDaaaQro559Ase2cNLbUiI+vC27H7fXrWlfo9/hkYy
         /sUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715212711; x=1715817511;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vSWgJ2aek8aUoUzIn2YBCivh/P/2bE6M7d0OipEKRcA=;
        b=ZPtTnO7ixWHy6nD5MUtZpaAur8UBPN82CBEk3s+DU3VeGqPdY1mleaTcMMLQ2cZB18
         PUSkMn2W9v26dEXypeTmdcER0+2aVKpKuyR+4kmjQKq9/tvtOwJBeCA3UDH+xFZDmJK9
         mggz6/ZUGLcZ179JNtnu7vC0DyyuUCaoXUchnsqqp7I4tyC/g7KnyHTnfKAX0H58mstp
         mWeQrq4E3OvOtX8CuimMB8n3nXNx8PK2MS3+hKAke4Nyn9MmCs9x6B42GsrkBD15sFDx
         DiB87JTNgJRGMxdf6QkZkXPhHCdp02qSS624gj5cOUCs5flG7UhelVaW/r4Og+Q7eIuA
         B27w==
X-Forwarded-Encrypted: i=1; AJvYcCXGrY2I7rXNpuqJREsRqDRUo0paz+U4g7B1R+eBQowt0rpQg3py2PgBWr2e/eo9QfMRhAvsKkAzsr0NBSRYwqzUzMKHjKAmI3Wk9/lmuMM=
X-Gm-Message-State: AOJu0YzR0KYh+QPb3/q8yulYk1clEyNiRvZlDntd04qE7u8Rk6abQxPf
	uEmzikRSy2+T11JjypLvTSDraeej2vMPZs53VnrhU6+i1IGtzj7GqgVKR61Z
X-Google-Smtp-Source: AGHT+IFDqb+JMXgEWCOpNbP+smAdOLaUNb9rQ8Bj/byaVQsYeGfeOtsYwWyVm7G9VTmbrXbbzKbdyg==
X-Received: by 2002:a17:903:32ca:b0:1ea:95f4:579c with SMTP id d9443c01a7336-1eeb01821cfmr45540005ad.1.1715212711103;
        Wed, 08 May 2024 16:58:31 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad63bcsm1165195ad.75.2024.05.08.16.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 16:58:30 -0700 (PDT)
Date: Thu, 09 May 2024 08:58:26 +0900 (JST)
Message-Id: <20240509.085826.1793889118157877475.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 benno.lossin@proton.me
Subject: Re: [PATCH v2] rust: add 'firmware' field support to module! macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72nHkadpMt9wMTm+BJ5Up-EG6ymay68qi+56nv9uLXXcgg@mail.gmail.com>
References: <20240501123548.51769-1-fujita.tomonori@gmail.com>
	<20240508.081144.1308480380091479358.fujita.tomonori@gmail.com>
	<CANiq72nHkadpMt9wMTm+BJ5Up-EG6ymay68qi+56nv9uLXXcgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

SGksDQoNCk9uIFdlZCwgOCBNYXkgMjAyNCAxNjo0Njo0OSArMDIwMA0KTWlndWVsIE9qZWRhIDxt
aWd1ZWwub2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBXZWQsIE1heSA4
LCAyMDI0IGF0IDE6MTHigK9BTSBGVUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBn
bWFpbC5jb20+IHdyb3RlOg0KPj4NCj4+IE1pZ3VlbCwgY2FuIHlvdSBhcHBseSB0aGlzIHRvIHJ1
c3QtbmV4dD8gT3IgeW91IHdhbnQgdG8gY2hhbmdlDQo+PiBzb21ldGhpbmc/DQo+IA0KPiBJIHR5
cGljYWxseSBhcHBseSB0aGluZ3MgdGhhdCB3ZXJlIHNlbnQgdXAgdG8gKHJvdWdobHkpIC1yYzUg
WzFdLCBidXQNCj4gZXhjZXB0aW9ucyBjYW4gaGFwcGVuIG9mIGNvdXJzZSAoZS5nLiBhIGZpeCku
DQoNClRoYW5rcywgSSBkaWRuJ3Qga25vdyB0aGlzLg0KDQo+IERvIHlvdSBuZWVkIHRoaXMgdG8g
Z28gaW4gdGhpcyBjeWNsZSBmb3Igc29tZSByZWFzb24/IElmIGl0IGlzIHNvIHRoYXQNCj4geW91
IGNhbiBzZW5kIFFUMjAyNSBuZXh0IGN5Y2xlLCB3ZSBjYW4gZmlndXJlIGl0IG91dCBzbyB0aGF0
IHlvdSBkb24ndA0KPiBuZWVkIHRvIHdhaXQgb25lIGV4dHJhIGN5Y2xlIGp1c3QgZm9yIHRoaXMu
DQoNCkknbGwgdHJ5IHRvIHB1c2ggUVQyMDI1IGZvciA2LjExIHZpYSBuZXRkZXYgdHJlZS4gU28g
SSBob3BlIGZlYXR1cmVzDQp3aGljaCBRVDIwMjUgbmVlZHMgdG8gYmUgbWVyZ2VkIGZvciA2LjEw
LCBlc3BlY2lhbGx5IGEgZmVhdHVyZSB0aGF0DQp3b3VsZCBiZSBjb25mbGljdGVkIGluIHJ1c3Qg
YW5kIG5ldGRldiB0cmVlcy4NCg0KPiBUaGlzIHdvdWxkIGFsc28gYWxsb3cgdXMgdG8gZ2V0IHRo
ZSBjbGVhbnVwIHRvIHRoZSBvdGhlciAiU3VwcG9ydGVkDQo+IGFyZ3VtZW50IHR5cGVzIiB0b2dl
dGhlciB3aXRoIHRoaXMgb25lLg0KDQpUaGF0J3MgZXhhY3RseSB3aHkgSSBob3BlIHRoYXQgdGhp
cyBwYXRjaCBpcyBtZXJnZWQgZm9yIDYuMTAsIGFzIEkNCndyb3RlIGFib3ZlLiBUaGUgY2xlYW51
cCB3aWxsIGJlIG1lcmdlZCB2aWEgcnVzdCB0cmVlLiBJdCBtYWtlcw0KY29tcGxpY2F0ZWQgdG8g
cHV0IHRoaXMgcGF0Y2ggaW50byBRVDIwMjUgcGF0Y2hzZXQgZm9yIG5ldGRldiB0cmVlLg0KDQpC
dXQgSSBkb24ndCB0aGluayB0aGF0IHRoaXMgcGF0Y2ggaXMgYW4gZXhjZXB0aW9uIHRvIHRoZSAt
cmM1IHJ1bGUuIFNvDQpwbGVhc2UgcHVzaCB0aGlzIHBhdGNoIGZvciA2LjExLiBJJ2xsIHRoaW5r
IGFib3V0IGEgd2F5IHRvIHB1c2gNClFUMjAyNS4NCg==
