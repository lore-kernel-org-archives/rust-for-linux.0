Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B1513B5A3;
	Tue, 23 Apr 2024 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713881425; cv=none; b=e/67t3xiO6nCHjA33S9AS+2aM0CTBn18tgO2UGfeBemfLHSRfVcdDaQfl9XOvfNUOeUVsu3eXGRQAPReRK7ghwLWu+6p/00vOGaP86g34Zs2oLU0nNrG5QrQaSsE95PgSDvdSRSc/ByBMfM8MJRQmauusT3k2O7mJot0C70f0RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713881425; c=relaxed/simple;
	bh=SUDvN++NmdizH2l11Q8BfFQRYOX/5XojmqJbmioQ0Q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mnbk7cuajnzb/8Q4yfbiwB4yUXrMP79NZ6R0qXdu74zOGniNq9CysQh70xYLyqErdTAjztFtFNyPCx7U1jMrK+gcYWANjvl6JUfY6JCr3gW1I19dg3TZFr+D9wMOc2in0KPsIdcBQbaJ3/de0k8BMnBZLndA9zLIweN8US5EnxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3/CD0Su; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3/CD0Su"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c6fc350ccaso1078786b6e.1;
        Tue, 23 Apr 2024 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713881422; x=1714486222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUDvN++NmdizH2l11Q8BfFQRYOX/5XojmqJbmioQ0Q4=;
        b=O3/CD0SuPhsdv5ouwCPGQ32ZEtUoltnL3vxwBKEl937UdwEaj+3eHVvKA34DiU2cZb
         NX7uGhdcKtZR/xH7W1NbU8+USMgmRHYgQjYSh8QFHmJwsIDN2C7hPtbiX1poHCh6VW0W
         oUUyljou/WjKLCXzIO930kKjXNdTsfIyI/U8SuOQi/WUNvEG4zsmhIk83lcvAEaewV8T
         mlwTXAwX6hXjgx9/+F+jWTWcxz97eqQV+U57tk9XK7yrhg/qFilg7fJaOhg1PFH+1aCR
         W15mH+qPopE7wGDihd1tlBp7Y2g2l6a7W7o+k2ZmSEmzR/HvAHU89kUDKZjVdJjMuw56
         l7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713881422; x=1714486222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUDvN++NmdizH2l11Q8BfFQRYOX/5XojmqJbmioQ0Q4=;
        b=He5/L1m+CXSBB8OJ7JBRa3561R0RsD6Effk8zUrUcqJqzyqihBRUmi+gna9HArtNY8
         VDiHSMwFya6Hbz6UtA1ZWaZwd1rjcvoVPHyAh+mJ63+XscG6JBXUw/KbSwaPL7+2yJU3
         dQpL/IuKAOLBggfDQPkwRXJCRdZljQ6jMgw4NW/QDKzupHtM4Tr3sUWTUJcSZgrC3J5F
         cS9r2k7ZM0o6RaLaHA2VBxAgXY8b+MdGNW8F1eWGtHQfUyxa5lzJdJDx6pFrEUlnHbt6
         VeURAZ0dvIpsFozR5FGOmS5tngBJsW/dKbMb0YgDYPG9Hk9wkLKUZFywD4cyE2ySEXco
         FIPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI7BcPlEh7g3isnWiGWvCdaQjNroXe6YydYW6zndVvtDA7OqaCrfsYoz4crFEF36g5Cec9lSWXeNfX3g3Nax0lYp9qj+dqLgtMkrUTacHJZ1+x6SR9FEAIwGmQa9fSX5fg9eJpexSq2g8=
X-Gm-Message-State: AOJu0Yz5XjwTSmLiuIzxnXFqKeweEGSk2DxyBwoNWI3RI31P+xy6+8nR
	tmB2V1Zv1YuUjHOInEdUJKoUX9HoIHgXNRj3eSHJ4b0ttY8nTvBCnPEEDWKsjh6zRJu/D132KKw
	PNpN9WiaBsIsvO97v3lNq0IpDkn0=
X-Google-Smtp-Source: AGHT+IEWgbCXB1KnFRVZnvd6ZM6ti/BfjBpAft+kg/c+l9uHynEzf5W3sqmJKuEjsKVCcT/MMXNJfwXNq6jhQHbURjI=
X-Received: by 2002:a05:6808:1448:b0:3c8:2bb9:1516 with SMTP id
 x8-20020a056808144800b003c82bb91516mr9746163oiv.26.1713881422330; Tue, 23 Apr
 2024 07:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1713875158.git.siyanteng@loongson.cn> <c1d41290e80fc1e6364682c258445132c42442e4.1713875158.git.siyanteng@loongson.cn>
In-Reply-To: <c1d41290e80fc1e6364682c258445132c42442e4.1713875158.git.siyanteng@loongson.cn>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 23 Apr 2024 22:09:56 +0800
Message-ID: <CAD-N9QU7uyJN7g1D1y0jZt9x64uDwvL3ynyXir6othOm=NpH9A@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] docs/zh_CN/rust: Update the translation of
 coding-guidelines to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBBcHIgMjMsIDIwMjQgYXQgOTowOOKAr1BNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bs
b29uZ3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFVwZGF0ZSB0byBjb21taXQgYmMyZTdkNWMyOThhICgi
cnVzdDogc3VwcG9ydCBgc3JjdHJlZWAtcmVsYXRpdmUgbGlua3MiKQ0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+IC0tLQ0KPiAgLi4uL3Ry
YW5zbGF0aW9ucy96aF9DTi9ydXN0L2NvZGluZy1ndWlkZWxpbmVzLnJzdCAgICB8IDEyICsrKysr
KysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3QvY29kaW5nLWd1aWRl
bGluZXMucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcnVzdC9jb2Rpbmct
Z3VpZGVsaW5lcy5yc3QNCj4gaW5kZXggNmMwYmRiYmM1YTJhLi5kMDJlMmRiZmY1MDkgMTAwNjQ0
DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1c3QvY29kaW5nLWd1
aWRlbGluZXMucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3J1
c3QvY29kaW5nLWd1aWRlbGluZXMucnN0DQo+IEBAIC0xNTcsNiArMTU3LDE4IEBAIGh0dHBzOi8v
Y29tbW9ubWFyay5vcmcvaGVscC8NCj4NCj4gICAgICAgICBodHRwczovL2RvYy5ydXN0LWxhbmcu
b3JnL3J1c3Rkb2MvaG93LXRvLXdyaXRlLWRvY3VtZW50YXRpb24uaHRtbA0KPg0KPiAr5q2k5aSW
77yM5YaF5qC45pSv5oyB6YCa6L+H5Zyo6ZO+5o6l55uu5qCH5YmN57yAIGBgc3JjdHJlZS9gYCDm
naXliJvlu7rnm7jlr7nkuo7mupDku6PnoIHmoJHnmoTpk77mjqXjgILkvovlpoI6DQoNCuWJjee8
gOmAmuW4uOiiq+eUqOS9nOWQjeivjeOAguW7uuiuruWPr+S7peaUueaIkO+8mg0KDQrmraTlpJbv
vIzlhoXmoLjmlK/mjIHpgJrov4flnKjpk77mjqXnm67moIfliY3mt7vliqAgYGBzcmN0cmVlL2Bg
IOadpeWIm+W7uuebuOWvueS6jua6kOS7o+eggeagkeeahOmTvuaOpeOAguS+i+WmgjoNCg0KPiAr
DQo+ICsuLiBjb2RlLWJsb2NrOjogcnVzdA0KPiArDQo+ICsgICAgICAgLy8hIEMgaGVhZGVyOiBb
YGluY2x1ZGUvbGludXgvcHJpbnRrLmhgXShzcmN0cmVlL2luY2x1ZGUvbGludXgvcHJpbnRrLmgp
DQo+ICsNCj4gK+aIluiAhToNCj4gKw0KPiArLi4gY29kZS1ibG9jazo6IHJ1c3QNCj4gKw0KPiAr
ICAgICAgIC8vLyBbYHN0cnVjdCBtdXRleGBdOiBzcmN0cmVlL2luY2x1ZGUvbGludXgvbXV0ZXgu
aA0KPiArDQo+DQo+ICDlkb3lkI0NCj4gIC0tLS0NCj4gLS0NCj4gMi4zMS40DQo+DQo+DQo=
