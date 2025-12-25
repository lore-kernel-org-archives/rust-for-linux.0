Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C252314A7D
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766655409; cv=none; b=tjFOlphfN2R2lzP4jEJM0UqxUYdCCNpLyek0NxkoG2+Ef+n692K4m9sDjQ1/Z2i6W3mEV+PbkcFM0qpoDVsVT18UDZXZOWi9r/V/1BwCQHYXCwOKBKGL/7sydouJpS4tokpGmD+KnOJtDJ4ThYKmYqh5zDdYxYEvSl6I6z7prXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766655409; c=relaxed/simple;
	bh=uAqWBvtqYrUOEvrIoGLy123BqDhwwHvWEJDvP6NrMgw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=u3808k0cky58ps9FuH6DkqtswANP9CnXyx6FnnS6NLn6qyd5cihI33PZgSwEocqldGJRGWJ/8PyiULHyDLwBgRb/TcxR0McFg9VCS2dRjsno5AB5uQelzcHgaYLZkVoPlAJt9t0bO+6HMEYe7jCaVBBvOfAPQAZfTIvviLXMHmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TN0FRnJ1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TN0FRnJ1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29efd139227so87272765ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 01:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766655406; x=1767260206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAqWBvtqYrUOEvrIoGLy123BqDhwwHvWEJDvP6NrMgw=;
        b=TN0FRnJ1wJ34ySzN3gCPDEjEgWx1OqWEspxslGlNSUAcMFXu7vyC7dHPs4Dt1kIhYE
         lCIbqriYzDQPp5Cyb8z+C+S/BpR/ZFgmwi711ijaGS/wLJ/XSR/oSe6nOlcRO1wacmDO
         7QPT1jF91sJz0HunQC1+FxNZCm+08loq+Kxc9PHUPQxPSoKkmQuAWVX2pe6SFpISaC2n
         8RaOnzrd4cFvSFdOQKpOWVGaFfu6nlsBDyFmwKmyFN8I0SPJ/QvU1qVxkWuun3w5nVBF
         SIyxu4NIqqA7ZVxZIioUUuZs1168WJTc/G1ZkS98cEchHLaGxP9XucdMHpLwzP7spFR2
         NZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766655406; x=1767260206;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAqWBvtqYrUOEvrIoGLy123BqDhwwHvWEJDvP6NrMgw=;
        b=V/kg9LettiQCjEPEad3ixZUpo/ta/72/5f9D+eeytaQ4/KvF2WkZAxrBoNKcX+hRud
         yQ8CO0oJcfGZLIsAQuv+VJ6AThx3VVkGCdWjtYKBagXPNa2Q78zzQkHFRjKEAAK240MW
         l4ks3BtSqEmRxa8/y+U4SjIFIMy9cxNGZg38XBiwlTghYbMLCPQ+mRDcnkoIMsZdGNtS
         XAAfqHkTQc+zhy7luixdfZ6bKlqFtqEP7kSI1XAu+3S22vTu2kP5936IWbO1AihjKt4x
         Ye4WtVLzCJ/EAGu29HafiuWkpnyjo6PwMfOBLZExSHYK7lg3V6od42ay/WiL+RMc8CSc
         hSEw==
X-Forwarded-Encrypted: i=1; AJvYcCUWFyQdotzcAgYGTEKTnE8JLnfbi0ml/9IUWAW7fbPiYap57xTR6sXsQjExO7nbktki0JZMzaW8JPnyW1Pj+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDJ7NFBSBdU+3ti20NegwALLXsyQh9mwIOmsusrRcc3OYgjEQY
	9jYHAf9Fh3fqf96evRfAuaJQWsGQZyGdDX6bCZmZWOO7CYKYuXdsnzS3
X-Gm-Gg: AY/fxX4gWLKT+sdCuwiPHixHajLLpNU6JZ+Ny2BcpgQxEEna8U+S3+WvW2rWBctHqri
	XL0C1vPbQfNRZCF05jQJEFyFwRRyRpyfHcLmp6n/j601upqEW/1XonMBq9sJZnB3W7salXMus+L
	6XzlVHM2J1Sj5TcBxuOcgaB1Ar5eOKl8w6K8LMuXvIbhUXGpJkOg3+JULNZDcudw8bIo4FVAaqd
	8zZ4ZesRlVz5t8/laPWsfMdGj+jbKKN2VZBYPPkkkUn1oC6bmtBysMBky07kBFkyKJfLV82X6bK
	Xqb9xOmXraVEfcENcP9ynfC4DV2XayVp9rxMyJzkfAjhOXD7Ck1TtU+WWN4W9bshhZlVor7NKPD
	UWdvOvZD9G6c8FOxbpnFtEag+kiyrGj5f9zZYQujE6guPZkQXbH3rNkYWZht/bLXMyFnFSiYn20
	ZM+moLzVOqlPUTNWlY7QKXqHC47pEVbQurVbhOGDjvst1xdu49cW3N6Vusev+WKX6J/Mk=
X-Google-Smtp-Source: AGHT+IHjmNG4MfdccBKOLM8cTooFJdSGyIfWKc2YzwQ8Af7ABOVLv++MLgoaH3SFNOWwcg2YlY2n5g==
X-Received: by 2002:a17:902:f685:b0:29e:97a1:76bc with SMTP id d9443c01a7336-2a2f222993amr229055415ad.21.1766655405854;
        Thu, 25 Dec 2025 01:36:45 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d2bbsm178571295ad.55.2025.12.25.01.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 01:36:45 -0800 (PST)
Date: Thu, 25 Dec 2025 18:36:31 +0900 (JST)
Message-Id: <20251225.183631.866118259815088053.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: boqun.feng@gmail.com, fujita.tomonori@gmail.com, dakr@kernel.org,
 bhelgaas@google.com, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, joelagnelf@nvidia.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] PCI: Provide pci_free_irq_vectors() for CONFIG_PCI=n
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72n1SX4OGFR4wNzurNX2RQki_ZmD13bBfywxxOEmw6cGZg@mail.gmail.com>
References: <20251215025444.65544-1-boqun.feng@gmail.com>
	<CANiq72n1SX4OGFR4wNzurNX2RQki_ZmD13bBfywxxOEmw6cGZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCAyNSBEZWMgMjAyNSAxMDoxMDowNCArMDEwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBNb24sIERlYyAxNSwgMjAy
NSBhdCAzOjU04oCvQU0gQm9xdW4gRmVuZyA8Ym9xdW4uZmVuZ0BnbWFpbC5jb20+IHdyb3RlOg0K
Pj4NCj4+IENvbW1pdCA0NzNiOWYzMzE3MTggKCJydXN0OiBwY2k6IGZpeCBidWlsZCBmYWlsdXJl
IHdoZW4gQ09ORklHX1BDSV9NU0kNCj4+IGlzIGRpc2FibGVkIikgZml4ZWQgYSBidWlsZCBlcnJv
ciBieSBwcm92aWRpbmcgcnVzdCBoZWxwZXJzIHdoZW4NCj4+IENPTkZJR19QQ0lfTVNJPW4uIEhv
d2V2ZXIgdGhlIHJ1c3QgaGVscGVycyByZWx5IG9uIHRoZQ0KPj4gcGNpX2FsbG9jX2lycV92ZWN0
b3JzKCkgZnVuY3Rpb24gaXMgZGVmaW5lZCwgd2hpY2ggaXMgbm90IHRydWUgd2hlbg0KPj4gQ09O
RklHX1BDST1uLiBUaGVyZSBhcmUgbXVsdGlwbGUgd2F5cyB0byBmaXggdGhpcywgZS5nLiBhIHBv
c3NpYmxlIGZpeA0KPj4gY291bGQgYmUganVzdCByZW1vdmUgdGhlIGNhbGxpbmcgb2YgcGNpX2Fs
bG9jX2lycV92ZWN0b3JzKCkgc2luY2UgaXQncw0KPj4gZW1wdHkgd2hlbiBDT05GSUdfUENJX01T
ST1uIGFueXdheS4gSG93ZXZlciwgc2luY2UgUENJIGlycSBBUElzLCBzdWNoIGFzDQo+PiBwY2lf
YWxsb2NfaXJxX3ZlY3RvcnMoKSwgYXJlIGFscmVhZHkgZGVmaW5lZCBldmVuIHdoZW4gQ09ORklH
X1BDST1uLCB0aGUNCj4+IG1vcmUgcmVhc29uYWJsZSBmaXggaXMgdG8gZGVmaW5lIHBjaV9hbGxv
Y19pcnFfdmVjdG9ycygpIHdoZW4NCj4+IENPTkZJR19QQ0k9biBhbmQgdGhpcyBhbGlnbnMgd2l0
aCB0aGUgc2l0dWF0aW9ucyBvZiBvdGhlciBwcmltaXRpdmVzIGFzDQo+PiB3ZWxsLg0KPj4NCj4+
IEZpeGVzOiA0NzNiOWYzMzE3MTggKCJydXN0OiBwY2k6IGZpeCBidWlsZCBmYWlsdXJlIHdoZW4g
Q09ORklHX1BDSV9NU0kgaXMgZGlzYWJsZWQiKQ0KPj4gU2lnbmVkLW9mZi1ieTogQm9xdW4gRmVu
ZyA8Ym9xdW4uZmVuZ0BnbWFpbC5jb20+DQo+IA0KPiBSZWxhdGVkOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9ydXN0LWZvci1saW51eC8yMDI1MTIwOTAxNDMxMi41NzU5NDAtMS1mdWppdGEudG9t
b25vcmlAZ21haWwuY29tLw0KPiANCj4gSSBndWVzcyBpdCBjb3VudHMgYXMgYSByZXBvcnQsIHNv
IHdlIG1heSB3YW50IGEgUmVwb3J0ZWQtYnkgKENjJ2luZyBUb21vKS4NCg0KU2luY2UgcGNpLnJz
IGlzIG9ubHkgY29tcGlsZWQgd2hlbiBDT05GSUdfUENJIGlzIGVuYWJsZWQuIFNvIGl0IHNlZW1z
DQpjb25zaXN0ZW50IHRvIHRyZWF0IHRoZSBQQ0kgaGVscGVycyB0aGUgc2FtZSB3YXkuIFRoYXQg
c2FpZCwgdGhpcw0KYXBwcm9hY2ggaXMgYWxzbyBmaW5lIGJ5IG1lOiBpdCdzIGFscmVhZHkgaW5j
b25zaXN0ZW50IHRoYXQNCnBjaV9hbGxvY19pcnFfdmVjdG9ycygpIGhhcyBhIHN0dWYgZGVmaW5p
dGlvbiwgd2hpbGUNCnBjaV9mcmVlX2lycV92ZWN0b3JzIGRvZXMgbm90Lg0K
