Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0713C38
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766644193; cv=none; b=sxMBd9QPqdFoL8bP7yFAC+NcyH5fKxvpklhSxxiCH7CPkuof2Hm1zYMvi/OaeS2TmoFIfI5KtdJDbe7raqKJtFNGHBiundw42S5lei4LIaCQoTmMI7Y3c/gsblVLoKqeuzESPdC8ZttYA4FQhAC5vdRhxrlYEl+OLJw/55sTFh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766644193; c=relaxed/simple;
	bh=mnOLriefCX47ZPRUkhg5A/LhwgrnQ1H7MA9feVDkTZI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=emZKsrvx5sajvZ2p+StRBJSv2XYp5V7wGRZ/3T5cXUqwTAkBTWQXffxxsnwjWLODo1OcZcx2vURJcOinC6b40Pmt7PO0O2v6ijFAKrXJWUdVkryG6ZFkFb8C4khtmhSQN9pNHlFG7w6bPPv0H2qKi1tMM8fO2SZqACg32Wj+WNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAZ0D2ul; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAZ0D2ul"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c1d84781bso7337896a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 22:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766644192; x=1767248992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnOLriefCX47ZPRUkhg5A/LhwgrnQ1H7MA9feVDkTZI=;
        b=ZAZ0D2ulDzDEzi2XlQNh7kAbu8DC2ChAwQ3lMLsdwWIVrFyy55fdgY6aHBFTOxWenT
         x9aJ2LJXBUazkuBQudRL9vleqvop4L+3jIb4XdsqxOly6Ok6YJgqP62ySHo2t887j6SG
         QmnnpbXAn5OkdYUZQKOVujLSZTNSMh8bQtAeCqMR8bt1RASaBgs7X1hYoMn04x0LNygt
         qWAAeO2TAHNkRUB9Lfii4KquyOLjFX7stZ3vpUTUSq4hhBCaN3PdGk6tNCDFBkjBBUze
         ehdXD2peM8TS6u+YQea1OGNBlQ4DMKUH0kTBCB3hW+5z/eOIJEmtQAPPnjtb86u+ReUo
         un2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766644192; x=1767248992;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnOLriefCX47ZPRUkhg5A/LhwgrnQ1H7MA9feVDkTZI=;
        b=GOY61ETzAp75UXwZ3K60kKntwTI0DOu7rLRu/4W5P1aaiPReDZ9DHq2Hq5yFHMnsa2
         leUE2zA+KCME9MoJKdnycYkiJav1CL55bpPNc08PND7+mENwYmnydtGZRJ45QY4C9Nn2
         WRHzWhHcBnIhmQfrADnUa8R1Y14i/Boqj0xqdYPjyU3DlU/pRcsWwqV85Gonz255Xqep
         /yWo+5gQvVBUkSWKMN0bFnPbUKzluPaZoODKS1ABcdN9UTQQdAjxnG3UJIsDMaX3+pUm
         3SHMSnWo5enoWVA/l2yV00s6mcsvz0+Q9Uc0Hq+9sMr/I1ID14MW1vFncm2fB/YhVhgJ
         FNsA==
X-Forwarded-Encrypted: i=1; AJvYcCV8DdP+QOCnY9DmjqkMDg3jd5XB9oTafWY0npb05i8Zop0JaO634LiAfqqRgCdgujHueptUAAZWZ12BwGK56g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeRZdZ4KrQAPHjx03bEw2UoeKNFabuAmoVEap+w/R/UHw7DTDs
	CVSVBBZ35z00s46niXeSR6reLtsLina2F/JmabFYskjKsdRqGOUOTIBW
X-Gm-Gg: AY/fxX7u/wHoB9PhRxb6Srk803PmBS8LAOtvUoSFLZqOnHUu3TT3/odjopGZuKJ7R1B
	oUVn3ipaUa5bOmVXndaWGcie0qazI7FGXJt6VV+yZZ8XLL4i3LFJZ9AiX1pnCp1N+rRBLpLS5Dw
	W0VG5fYsSzWXf9f+xDHioPHkKiCS/treTv2dYUlGc8qsb+FKhVC0yfsGwcW1q6U2CaZuQi3j8Hw
	ldHASUKZF2YLn+AJBhtqIlOVPApqs4TTV7QjCla2lmO6KPGyrX7iAb9zKGpRN4CrrOu7pv4HxVo
	vCGVMIOT4ceIscRfqhpnNVumtFeKo+nV/T1+jY5HKTY29hsfvbUdrfbbMQuIIY+o/+eB6LQKGYg
	/eSvOlsuT548LNBlnm5xjWkUn0ae7GoosHr6rY2nBRm9a0ncg+SQjkRLxOtcnES1btQawHcA9ZP
	oMdopz3+ofQFAj9PhLa+ZECwoRca1RlvKtyzIJOAVBsN5nOfkn1UGJWoQXIWo7r8fXSLU=
X-Google-Smtp-Source: AGHT+IHl6j3G8/C17LU4rGU704zoH+7CN62RcLkA5tc0jM+xOgocDTuOvFKHy7txJaZJLTysmcAPKQ==
X-Received: by 2002:a17:90b:1d83:b0:341:2b78:61b8 with SMTP id 98e67ed59e1d1-34e921a3cb5mr16727684a91.20.1766644191799;
        Wed, 24 Dec 2025 22:29:51 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b1666sm17162996a91.7.2025.12.24.22.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 22:29:51 -0800 (PST)
Date: Thu, 25 Dec 2025 15:29:37 +0900 (JST)
Message-Id: <20251225.152937.2022953666618468611.fujita.tomonori@gmail.com>
To: gary@garyguo.net
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, boqun.feng@gmail.com,
 bjorn3_gh@protonmail.com, dakr@kernel.org, lossin@kernel.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v3 2/2] rust: Add pr_*_once macros
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251223120600.6541cc8f.gary@garyguo.net>
References: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
	<20251117002452.4068692-3-fujita.tomonori@gmail.com>
	<20251223120600.6541cc8f.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-7
Content-Transfer-Encoding: base64

T24gVHVlLCAyMyBEZWMgMjAyNSAxMjowNjowMCArMDAwMA0KR2FyeSBHdW8gPGdhcnlAZ2FyeWd1
by5uZXQ+IHdyb3RlOg0KDQo+IE9uIE1vbiwgMTcgTm92IDIwMjUgMDk6MjQ6NTIgKzA5MDANCj4g
RlVKSVRBIFRvbW9ub3JpIDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+
PiBBZGQgUnVzdCB2ZXJzaW9uIG9mIHByX1tlbWVyZ3xhbGVydHxjcml0fGVycnx3YXJufG5vdGlj
fGluZm9dX29uY2UNCj4+IG1hY3Jvcywgd2hpY2ggcHJpbnQgYSBtZXNzYWdlIG9ubHkgb25jZS4N
Cj4+IA0KPj4gUmV2aWV3ZWQtYnk6IEFsaWNlIFJ5aGwgPGFsaWNlcnlobEBnb29nbGUuY29tPg0K
Pj4gU2lnbmVkLW9mZi1ieTogRlVKSVRBIFRvbW9ub3JpIDxmdWppdGEudG9tb25vcmlAZ21haWwu
Y29tPg0KPiANCj4gQSBtZXRhIHRvcGljIGFib3V0IHRoaXMgb25lLg0KPiANCj4gSSB0aGluayB3
ZSdyZSBhZGRpbmcgdG9vIG1hbnkgbWFjcm9zIHdpdGggdGhpcy4gSW4gQyB3ZSBoYWQgdG8gZG8g
dGhpcw0KPiB3YXkgYmVjYXVzZSBleHByZXNzaXZlIHBvd2VyIG9mIG1hc2Nyb3MgYXJlIG1vcmUg
bGltaXRlZCwgYnV0IEkgd29uZGVyDQo+IGlmIHdlIHNob3VsZCBqdXN0IGFkZCBkaWZmZXJlbnQg
Zmxhdm91cnMgd2l0aCBtYWNyb3MuDQo+IA0KPiBGb3IgZXhhbXBsZSwgaW5zdGVhZCBvZg0KPiAN
Cj4gCXByX3dhcm5fb25jZSEoImZvbyIpOw0KPiANCj4gd2UgY291bGQgZG8NCj4gDQo+IAlwcl93
YXJuIShvbmNlLCAiZm9vIik7DQo+IA0KPiBJZiB3ZSBhcmUgYWRkaW5nIGV4dHJhIHR1bmFibGVz
LCB3ZSBjb3VsZCBkbyBzb21ldGhpbmcgc2ltaWxhciB0b28uDQo+IEdpdmVuIGFsbCBwcmludCBt
YWNyb3Mgc3RhcnQgd2l0aCBhIGZvcm1hdCBzdHJpbmcsIGRvaW5nIHRoaXMgd29uJ3QgY3JlYXRl
DQo+IGFueSBhbWJpZ3VpdHkuDQo+IA0KPiBBbiBhZGRlZCBiZW5lZml0IGlzIHRoYXQgbm93IHlv
dSBvbmx5IG5lZWQgdG8gaW1wbGVtZW50IHRoZSBmdW5jdGlvbmFsaXR5DQo+IG9uY2UgaW4gYHBy
aW50X21hY3JvIWAgYW5kIGFsbCBvdGhlciBtYWNyb3MgZ2FpbiB0aGUgZmVhdHVyZSwgdG9vLg0K
DQpJIGRvbid0IGhhdmUgYSBzdHJvbmcgcHJlZmVyZW5jZSBlaXRoZXIgd2F5Lg0KDQpJZiB3ZaJy
ZSB3aWxsaW5nIHRvIGRpdmVyZ2UgZnJvbSB0aGUgQyBpbnRlcmZhY2UgdG8gcmVkdWNlIHRoZSBu
dW1iZXINCm9mIG1hY3JvcywNCg0KcHIhKHdhcm4sIG9uY2UsICJmb28iKTsNCg0KPw0K
