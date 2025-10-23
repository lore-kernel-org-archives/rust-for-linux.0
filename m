Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62362245020
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 05:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761196768; cv=none; b=sPB/KkxXavcSYK6rFxhwLZkiCV9CZ1DsIGLEspdH2fpqQBgB+aHNJktXTPaajO40GDzhl9X+T4AjuO8nsfPdEqzhnkGQGjeaAdLFXoV7ZVPiVmWuyqZ0ePEfOMwFHv0/+v3HHtukZsRr0uGcAlT6GzsZsrvcQK2P1UGdy/ZNhCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761196768; c=relaxed/simple;
	bh=51aXDOGdj/po8jhlXOkKS2wP8VODlnd8UT+bbLyMaxI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=N0WVOnz7IY/7BKo/Gm5OstVmM1D5wpMb/Tp4CnF7uU05Ps/vAHHf7/L6C3c9J78By8trPF/NW3evOp+yi8v6MNjacwCU4g3PugaF014tAvlBeXYjE6VsU3F3uP1oLvLg98JmUZbZ/OsWnVSckhmA6qQP4qJOZfl+ElXAsrpVNEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oop3YDUz; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oop3YDUz"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso417410b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 22:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761196766; x=1761801566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51aXDOGdj/po8jhlXOkKS2wP8VODlnd8UT+bbLyMaxI=;
        b=Oop3YDUzuvt3scIYktdyCOldzd7hqCX6dAXZMov9L+h0uooaVHMfuA1NMNTywnQTRS
         w7pYmIz/ECnGLCrf/neD1V+iC44kWITZc+2r/FhsqPDDXwpm3nXnfJ+YMNHl8NvMIvve
         cbG2jVKqo30rks06wP4HuDl04jbPC0g4ZvnE2s4AV6VvDnY9lDfD0N4l5e51+vY51R59
         IWRgQnVlyREJlpRDTnU9HkGdBehTl/daexjoolg3Epl8lncGmntHOh7XDjagUHog3BWf
         iDqmJL2gCD73JAvGijrKmyLBNxqwHisvLK/fnxp9LEcMTSsMqTN/0L7TOEK3L2RpEoFy
         a3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761196766; x=1761801566;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=51aXDOGdj/po8jhlXOkKS2wP8VODlnd8UT+bbLyMaxI=;
        b=reUGURYH2ZGVLX+a2hWAvnEbN6PEse2YOZ73SL+XXvD2c5Z8cmViLwSbP9Ox08NGX3
         P+lIrynv3iWOLfWO9S3zOiAqZj9PZsAGgbTBcDOLoNYjInbpGYFX6Em0nR2cMTjkqpGA
         10C5tv97WNskC5zAfgRjAKJJ0IoROADCT3/u7tm7XEaBJ4MsTfnaCZPyNHvmDPgmmz3o
         F79PTo2qa0Wu6KiHX37Lm8r6C2gOjJZX6c16bQNO+Tufoz+CcEhVBqiwzxcNm28wM8X6
         bQn2zdZsHsKHhSOHxBwo0gXS0UpAgt1NalueKlTzlqnaqlQGzV0ODgBHIJbLrqtR2BeT
         e0JA==
X-Forwarded-Encrypted: i=1; AJvYcCUmUSGGEVjHrRbbH4p0CNmhY4l176QbZQYScl49hdgcqD7gfwFtNqxQ6x4b818Nb7FPcq/gnzrn0wIEqbcYtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRJcMfc6aDZFFqcQKtjLqe4euV+WniQg4vVwO+pzTBDr88Akn9
	y+R+vefKfclocL4br1bhJzJrdtZFWrh23Q53dDcauvBEiTfElEXsdTzf
X-Gm-Gg: ASbGnctlUYaM8OiwzwvGAD+WwArnTwYg6AadRrFgiOkieRhoXtARmYmN0OUhghUrSjC
	8nBLQWSzPpZwtLpz56m3XQWN0rOHjbM3s/N5nyurv26/USP4+aOBRFey6bnQ1o5wZD6rexUzSkT
	L819eGCGgeA+qmv8pOZlZt0mPigTqE4vBH0r6xfd5GRBdWNnvFvNdNKFU9JyV54Zap8dQrq0pBf
	Z6lDF9Ld5pCsjabnqVIYqRUK4UvnvgvzgJL7B/W4NRYoFdsAOJRe9k6iy0wxIotIm10EgbV5q9N
	k9Isg/tFcJZpz0n5KDQNw5PDeqDS+6ie9gIYTXRGRu7g2sUKdDvFeZRLHGF1ADvs0l5wZpNrYLD
	c2iHjQAVuO776+hZ1dSaLlG7l1/veHHu1udF5Ci08WAxK47Hp3vLa4NzlL4d5KCnGZNO9X1kPO0
	1DML8i2Xsq1+qYGqqMXdn4kLTtSS+tEf+v3Syu4Hljm8Vqb+vRXqDeBA==
X-Google-Smtp-Source: AGHT+IGVsTk3QsyiPJrUe+IqfmTmdgg7c6o5S51y4i/ui4y4RNQVHgrAf90jQBXrDKdEcp6hkc4OOQ==
X-Received: by 2002:a05:6a20:5493:b0:334:99f9:ff45 with SMTP id adf61e73a8af0-334a863c4bemr32416022637.57.1761196766414;
        Wed, 22 Oct 2025 22:19:26 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb8eacsm882436a12.3.2025.10.22.22.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 22:19:25 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:19:09 +0900 (JST)
Message-Id: <20251023.141909.400243634709519102.fujita.tomonori@gmail.com>
To: aliceryhl@google.com, dakr@kernel.org, miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, daniel.almeida@collabora.com,
 a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de,
 tmgross@umich.edu, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 1/2] rust: add udelay() function
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aPjmKSrETqrchW_e@google.com>
References: <DDO3OMBHS8TB.2LDODR1AFRCU3@kernel.org>
	<20251022.193230.585171330619599845.fujita.tomonori@gmail.com>
	<aPjmKSrETqrchW_e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-7
Content-Transfer-Encoding: base64

T24gV2VkLCAyMiBPY3QgMjAyNSAxNDoxMTo1MyArMDAwMA0KQWxpY2UgUnlobCA8YWxpY2VyeWhs
QGdvb2dsZS5jb20+IHdyb3RlOg0KDQo+IE9uIFdlZCwgT2N0IDIyLCAyMDI1IGF0IDA3OjMyOjMw
UE0gKzA5MDAsIEZVSklUQSBUb21vbm9yaSB3cm90ZToNCj4+IE9uIFR1ZSwgMjEgT2N0IDIwMjUg
MTc6MjA6NDEgKzAyMDANCj4+ICJEYW5pbG8gS3J1bW1yaWNoIiA8ZGFrckBrZXJuZWwub3JnPiB3
cm90ZToNCj4+IA0KPj4gPiBPbiBUdWUgT2N0IDIxLCAyMDI1IGF0IDU6MTMgUE0gQ0VTVCwgTWln
dWVsIE9qZWRhIHdyb3RlOg0KPj4gPj4gaS5lLiBpZiB0aGV5IGFyZW4ndCBzdXJlIHdoYXQgdGhl
IHZhbHVlIGlzLCB0aGVuIEkgd291bGQgcHJlZmVyIHRoZXkNCj4+ID4+IGNsYW1wIGl0IGV4cGxp
Y2l0bHkgb24gdGhlIGNhbGxlZSBzaWRlIChvciB3ZSBwcm92aWRlIGFuIGV4cGxpY2l0bHkNCj4+
ID4+IGNsYW1wZWQgdmVyc2lvbiBpZiBpdCBpcyBhIGNvbW1vbiBjYXNlLCBidXQgaXQgc2VlbXMg
dG8gbWUgcnVudGltZQ0KPj4gPj4gdmFsdWVzIGFyZSBhbHJlYWR5IHRoZSBtaW5vcml0eSkuDQo+
PiA+IA0KPj4gPiBBYnNvbHV0ZWx5ISBFc3BlY2lhbGx5IGdpdmVuIHRoZSBjb250ZXh0IHVkZWxh
eSgpIGlzIGludHJvZHVjZWQNCj4+ID4gKHJlYWRfcG9sbF90aW1lb3V0X2F0b21pYygpKSwgdGhl
IGNvbXBpbGUgdGltZSBjaGVja2VkIHZlcnNpb24gaXMgd2hhdCB3ZSByZWFsbHkNCj4+ID4gd2Fu
dC4NCj4+ID4gDQo+PiA+IE1heWJlIHdlIHNob3VsZCBldmVuIGRlZmVyIGEgcnVudGltZSBjaGVj
a2VkIC8gY2xhbXBlZCB2ZXJzaW9uIHVudGlsIGl0IGlzDQo+PiA+IGFjdHVhbGx5IG5lZWRlZC4N
Cj4+IA0KPj4gVGhlbiBwZXJoYXBzIHNvbWV0aGluZyBsaWtlIHRoaXM/DQo+PiANCj4+ICNbaW5s
aW5lKGFsd2F5cyldDQo+PiBwdWIgZm4gdWRlbGF5KGRlbHRhOiBEZWx0YSkgew0KPj4gICAgIGJ1
aWxkX2Fzc2VydCEoDQo+PiAgICAgICAgIGRlbHRhLmFzX25hbm9zKCkgPj0gMCAmJiBkZWx0YS5h
c19uYW5vcygpIDw9IGk2NDo6ZnJvbShiaW5kaW5nczo6TUFYX1VERUxBWV9NUykgKiAxXzAwMF8w
MDANCj4+ICAgICApOw0KPiANCj4gVGhpcyBpcyBhIGJhZCBpZGVhLiBVc2luZyBidWlsZF9hc3Nl
cnQhIGFzc2VydCBmb3IgcmFuZ2UgY2hlY2tzIHdvcmtzDQo+IHBvb3JseSwgYXMgd2UgZm91bmQg
Zm9yIHJlZ2lzdGVyIGluZGV4IGJvdW5kcyBjaGVja3MuDQoNCk9oLCBJIGRpZG6idCBrbm93IGFi
b3V0IHRoYXQuIERvIHlvdSBoYXZlIGEgcG9pbnRlciBvciBzb21lIGRldGFpbHMgSQ0KY291bGQg
bG9vayBhdD8NCg0KDQo+IElmIHlvdSByZWFsbHkgd2FudCB0byBjaGVjayBpdCBhdCBjb21waWxl
LXRpbWUsIHlvdSdsbCBuZWVkIGEgd3JhcHBlcg0KPiB0eXBlIGFyb3VuZCBEZWx0YSB0aGF0IGNh
biBvbmx5IGJlIGNvbnN0cnVjdGVkIHdpdGggZGVsYXlzIGluIHRoZSByaWdodA0KPiByYW5nZS4N
Cg0KWW91IG1lYW50IHRoYXQgaW50cm9kdWNpbmcgYSBuZXcgdHlwZSBsaWtlIFVkZWxheURlbHRh
LCByaWdodD8NCg0KcmVhZF9wb2xsX3RpbWVvdXQoKSBhbmQgcmVhZF9wb2xsX3RpbWVvdXRfYXRv
bWljKCkgdXNlIGRpZmZlcmVudCBEZWx0YQ0KdHlwZXMuLi4gSSdtIG5vdCBzdXJlIGl0J3MgYSBn
b29kIGlkZWEuDQoNCkRhbmlsbyBhbmQgTWlndWVsLCBhbnkgaWRlYXMgZm9yIG90aGVyIHdheXMg
d2UgY291bGQgZG8gdGhlDQpjb21waWxlLXRpbWUgY2hlY2s/DQoNCg==
