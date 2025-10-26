Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34379285C8D
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761484309; cv=none; b=M8qLLCYljieaUtG8F6W2FNCRDf1bsbcC8WgDDMD7oXHMovBnlSbOiJ7smJoc2TCYcCUx0DeNGh8Th7IR+TahkhOS+fKOKnWrP0lgzYl1TNWTZzL4cgyjiZ9wWtsB7BR+uZHXuGENoAwyGb3OP5N09osry/ehG/uqbW/2XPZ1Idw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761484309; c=relaxed/simple;
	bh=zNEh2QgQOyDhe3fLUYy5K7qIvYz3YVSHJafBQqTawfc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NrDTSApl7wQbLDGWN83ItSC1F/fBqrte3VVxT63ldjrufpQIlHon8nNVgx3fxfk4eN/qxT+R5gieIeK4c1+dlQBjMyJCJ3Pems33beO47yusuhtEZKKg2DTvwVvteLVtt26x8/KFQqmOyC9R/Q0KQfOQH5MC97SCKVQ+rzD932k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqdwn9vD; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqdwn9vD"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6ce806af3eso3369375a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 06:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761484307; x=1762089107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNEh2QgQOyDhe3fLUYy5K7qIvYz3YVSHJafBQqTawfc=;
        b=eqdwn9vD/tJITLJixMVlPzgLQUovVbUzm7tDeTqwst2v69kTt8VukFUK3CEDwgt5Rw
         q0pCMncumNeKp0m3viQcDDdG1hSAuP2QuYFjpkRWgezYqMRYQKFfED1F7yj+WhKw8iT+
         7g1ke3ftnW0aM8OpdvNa9n46wMYJ7FNFHIaDGONugOZe/KLW5QmP6Hq01GPmtLPqSM5m
         XZu+m9ThfwgOBR1XfduVYgUgQQ3cPIoOafWEs75lkU61TbSth0JM2pbc6tDHogEKMEkW
         ZULJqBSnj5OlN9p5N5YC4T7/l2i1VCuBgd/juT8lzooUWz4SSYz+FW6kJT9KMNDfXkuD
         HqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761484307; x=1762089107;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zNEh2QgQOyDhe3fLUYy5K7qIvYz3YVSHJafBQqTawfc=;
        b=n0yjrGi1jT7Xov2k7ouVU5oQJY3lzlM4+vQx9tsCtvROS1Jxh5lT0evoInE/yjfLoJ
         aUnJvD2sZAgRIxmw5cX8f/URnGuY8ingATsjCUNFTjUeEhjQrrUyZl+IOXJat2wUGkTq
         kBHEmoducV/yqVE+neKo5w+EZI+ZGu6AbO5GqSK9pbRbj7EXdblnbuJPXqx6xvJCA8dH
         QwjBV+vrGVsKAvHZr9bkPOj6yLqqlavqxpXUce0R2koUTudtlMPJlWEZUp6EKJ3DLe3q
         8ISZQZ8o2sjR6ipzr64VuAJ3i3z+AEcKRmPS+Zqcx9QqIQBhOXUTx8TvUDxwJGqq8+AV
         LPEw==
X-Forwarded-Encrypted: i=1; AJvYcCVx2mgD0XCXadJNkqUceThzPcLEh/OHsORAj09yXlRN7qPD+E8jDoPdgY7XZvLr9LTMY3DWkLyOoG3wgxf5Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEYXQy5K6Q4jI0wUPdPIjKolAoFOb8JicfU7uPHa42/N+n7vbl
	2Wva8QaYDAyCXFOiZ822ijYe0lGjj4R6jthdAdi3ya2c+P9Zo0FNJORN
X-Gm-Gg: ASbGncuiLjCHTJkj4y8KwO7dvz3avX2ZifgcHmULYNvxy0rOtAKpX2Y9+HTx0PJJ/Eb
	ta6OK6qPT+CGfJwGAXONj6/ynIC6pbm+1mlKGcIVp6PWWDBu48MB+QlqiCfh6G4yIUZTXmFzJ6c
	EirxeSMa8GYMmRfpj4b25EEVwxMpPw/ODrrKxjgi+DSjDdZM6QxFtvOAdYDmTuHIcRuepWbdr6k
	VbslQXoV6DNdr00KyqLExaENX5hlMkWf+ly3vXuhHEg5caA01lEUyIp6S6cUmP6npjlPwcUN7xt
	ZnGZeW81QWqJ1FLmNAXtXINgAXjp4zLGEIVBPE8VacMC3F+Pu/JUMDArey+BRNyu9C9E/rNWpT4
	E55jqy8kYVG06YJ5pfKEMZQAxTqQCoqAWZinw40eIv1bPinj5pMlgB4binjsM+441aEV8KLmkVS
	+Lt7pc2r/USEukUiB+zZBeRakOsH6if3iudqrmEP0pkEkqDvz62+ooVA==
X-Google-Smtp-Source: AGHT+IGo3QqKMTDkXQEYwxKRUQGFN/hMTlVYYS+CA7Pbc0SLy6IfmkQ6bOhpwKVZfOooKp6CYecMzQ==
X-Received: by 2002:a05:6a20:6a23:b0:341:6d44:dfd7 with SMTP id adf61e73a8af0-3416d44e1d7mr4995395637.51.1761484307417;
        Sun, 26 Oct 2025 06:11:47 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140978dfsm4937275b3a.69.2025.10.26.06.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 06:11:46 -0700 (PDT)
Date: Sun, 26 Oct 2025 22:11:26 +0900 (JST)
Message-Id: <20251026.221126.278291666422815679.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: aliceryhl@google.com, a.hindborg@kernel.org, fujita.tomonori@gmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, alex.gaynor@gmail.com,
 ojeda@kernel.org, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org,
 lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 1/2] rust: add udelay() function
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72=wkL_tfmStR1HYOBsyV5_o41YXTtUsCM5t+i80+urxxw@mail.gmail.com>
References: <877bwkhfrr.fsf@t14s.mail-host-address-is-not-set>
	<aPtGgNajcXKWpji0@google.com>
	<CANiq72=wkL_tfmStR1HYOBsyV5_o41YXTtUsCM5t+i80+urxxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gRnJpLCAyNCBPY3QgMjAyNSAyMTowNToxOSArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBGcmksIE9jdCAyNCwgMjAy
NSBhdCAxMToyN+KAr0FNIEFsaWNlIFJ5aGwgPGFsaWNlcnlobEBnb29nbGUuY29tPiB3cm90ZToN
Cj4+DQo+PiBGb3IgcmFuZ2UgY2hlY2tzLCBzZWVtaW5nbHkgdW5yZWxhdGVkIGNvZGUgY2hhbmdl
cyB0dXJuIG91dCB0byBhZmZlY3QNCj4+IHRoZXNlIG9wdGltaXphdGlvbnMgYW5kIGJyZWFrIHRo
ZSBjb2RlLg0KPiANCj4gTW9zdCBvZiB0aGVzZSBjYWxscyB1c2UgY29uc3RhbnRzLCBzbyBpbiB0
aG9zZSBjYXNlcyBpdCB3b3VsZCBiZSBmaW5lDQo+IChhbmQgb3RoZXJ3aXNlIGl0IGlzIHJlYWxs
eSBhbiBpc3N1ZSBvbiB0aGUgb3B0aW1pemVyKS4NCj4gDQo+IEJ1dCwgeWVzLCB1c2luZyBgYnVp
bGRfYXNzZXJ0IWAgb24gdGhlICJub3JtYWwiIHZlcnNpb24gb2YgYHVkZWxheSgpYA0KPiB3aWxs
IGV2ZW50dWFsbHkgc3VycHJpc2Ugc29tZW9uZSwgYmVjYXVzZSBzb21lb25lIG91dCB0aGVyZSB3
aWxsIHN0YXJ0DQo+IHVzaW5nIGl0IHdpdGggcnVudGltZSB2YWx1ZXMgdGhhdCBoYXBwZW4gdG8g
d29yayBhbmQgdGhhdCBsYXRlciBtYXkNCj4gbm90IHdoZW4gY29kZSBnZXRzIHNodWZmbGVkIGFy
b3VuZCwgZXNwZWNpYWxseSBnaXZlbiBpdCBzaGFyZXMgdGhlDQo+IG5hbWUgd2l0aCBDLg0KPiAN
Cj4gU28gZm9yIGZ1bmN0aW9ucyB0aGF0IGRvIGBidWlsZF9hc3NlcnQhYCBvbiBwYXJhbWV0ZXJz
IHdlIG1heSB3YW50IGF0DQo+IGxlYXN0IGEgc3VmZml4IHdpdGggYSBwYXJ0aWN1bGFyIHdvcmQg
KGUuZy4gYF9jb25zdGApIG9yIHNpbWlsYXIsIHNvDQo+IHRoYXQgaXQgaXMgY2xlYXIgY2FsbGlu
ZyB0aGVtIG1heSBoYXZlIGlzc3VlcyBpZiBub3QgIm9idmlvdXNseQ0KPiBjb25zdGFudCBmb3Ig
dGhlIG9wdGltaXplciIsIGxlYXZpbmcgdGhlICJub3JtYWwiIG5hbWUgZm9yIHRoZSBydW50aW1l
DQo+IG9uZSBvciB0aGUgY29uc3QgZ2VuZXJpY3Mgb25lIGV0Yy4NCj4gDQo+IEhlcmUsIEkgd291
bGQgc3VnZ2VzdCB3ZSBkbyB3aGF0IHdlIGRpZCBmb3IgYGZzbGVlcCgpYCBhbmQgbGlrZWx5IG1v
dmUNCj4gYm90aCB0byBgZGVidWdfYXNzZXJ0IWAgcGx1cyBgcHJfd2FybiFgIChhbmQgbGlrZWx5
IGBwcl93YXJuX29uY2UhYA0KPiB3aGVuIHN1cHBvcnRlZCkuDQoNCkkndmUgc2VudCB2MyB3aXRo
IGRlYnVnX2Fzc2VydCEgYWRkZWQuDQoNCklzIGFueW9uZSBjdXJyZW50bHkgd29ya2luZyBvbiBw
cl8qX29uY2U/IElmIEkgcmVtZW1iZXIgY29ycmVjdGx5LA0KdGhlcmUgd2VyZSBhIGZldyBwcm9w
b3NhbHMgaW4gdGhlIHBhc3QsIGJ1dCB0aGV5IGRpZG7igJl0IHJlYWNoIGENCmNvbmNsdXNpb24g
b24gaG93IHRvIGltcGxlbWVudCBpdCBhbmQgbmV2ZXIgZ290IG1lcmdlZC4NCg==
