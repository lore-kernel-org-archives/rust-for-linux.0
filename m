Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8586D221DB3
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 08:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768467581; cv=none; b=A4CVO5+Foj9eaBCmNMI5Sojm3+Rqq0BqgB9cklAn2m3XFijlWJNieVPqVyiet27M6YN3owsaDZO+mI4Bgbsk/kkLx73qn0FPbC7dzqh0tn3882PLg4XGYY6kQFDKSC0G4RVODzkKxSVsIdnq3MKQxVhwwAT3i7Oce7ZEG8kRaIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768467581; c=relaxed/simple;
	bh=MhF0yfnMCZiNjFSwUZnTclLW/As/r/w3gUxqCwjxEAM=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jrj4GaR7Tw7nqbPuMwl26WymJDASL6IBYU786SuhcjEUfHPRL3h00SyCkur8JumtY/rTcE8d8xU3I4BsewEUJEgbtXzJWGUwkxzOOytEq+UJDJgIox4tE3dih1z0FTKzD55NUEOrGVYg8gYqjFtLE/qbV5iznxTw8m1VqBLEiXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrFQiYg4; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrFQiYg4"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b75e366866so178534b3a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 00:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768467580; x=1769072380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhF0yfnMCZiNjFSwUZnTclLW/As/r/w3gUxqCwjxEAM=;
        b=KrFQiYg42nRdBGvYaPdctGD/VUU66LlxboMG27CI0a1erTBVrWRAotx54caVx9BqK+
         715kV+qnep4gePhvVI5BnaR9eFjnKmQRakNr8PMhQjpgpMAqyiJMs+oji4z/usj0JzUo
         /JSn6C/MCT+bL1heUs19tkT5t2/ldOQBr7zy9wEfkCnG9ulwM+Rhqb9g+5xfHVEm/BxR
         gQcQvjAcpHoNJgRFzDZ7f3aDthC4Rrz4U18LhjwqT77Y5Abd0ZJWbGOJp0SmaMK3GfTp
         FUwlPcxahSndlHgTSQULttkgED+yUq3dXTN/IO+O5BuKeIF9oqNrknvS1UbwB8AkmRHQ
         FwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768467580; x=1769072380;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhF0yfnMCZiNjFSwUZnTclLW/As/r/w3gUxqCwjxEAM=;
        b=fuShmGRQNsEj7g9EnmiC38++XZuDxiB362yHS8GlQOV3ato4oWmDNxPQ715IGEFonB
         gvpNMR8wXPmLbAJ82TrWeQPi5fQ8IS3fLCsNT0PBZZDWLBTt6BW3Vo2bF8D7my0cevno
         JNi9nbHw4RUbUh13S7X9oYesbAZ1Dx8a/Zj/YUkc0PMMx4sVn6n0JckAFIVEsvZn6BFk
         fV41Ym0H4YoUyqUhuHtovnzfVLWbzzp/5neMwzoYFSCM6c18y9vUsV959tJIvbOUwvHa
         la1gGEq57iFtVOOSozm5GHkeTZV34B6BTEHpAmEB7UZqrpB7iNbxc01lSDCwYMPlyXie
         ev2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOLuPNDW92xebwj0YMIlHgUPR4hCW9P0DT7mbJ4q6h3gOawJwXv+3imttVbe81jJMtKaZueJNXs5K/0FUwCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4/gewH9a9RQ0fXFCJI3T85apCG9KRp7rUrTcNQB3fF0Kbv1WC
	jPx1DeFVcljiL1GxLHTSt2x7ZVckA4ZnSOPHrftnQxrETJxneFah5TcB
X-Gm-Gg: AY/fxX6jt4t9LQskGkcHiesLFWqWW5qEbotuN/xDDTRlTMTlwf8YXFWIv+kAPf9Nl4/
	6ERp8YzGRpP0m9u7DICqp8zKxp2P2sZtNSc4YrltGhlnLWva99Lp24jJK/v4t8QNlNFke5Uqi4m
	MGb12n1zlvFaNerSNkMbb5JAIiEubnKm+twYUpGEg7jpsGXiIxtw9FEG5HDbHxpt+Z7lwuY9Pm/
	JGLUiGetkUeTnoJa/+E1Dh/BRKeT7wPpDt8zqjK5OBgH2ZMfn0d76/qlAMLbBW5pZnWsAiLWz4W
	KdIRU+jGKaauOYpv64t3Caq4mQLQLwZUfa+MWtE/9x+LXgwH5ezR5nJcr7U4nQg92a0yC1nM8QB
	0JFkJqh6T9RFa4wf7ooT1m5AxpaVRI6UztzCwtts+M3jaaoKdpwxzFA2KNN0Mhu1/c+wq5pr/R6
	/3+HuISg29peK5yIqfwmmG4I3WWFb/Z9wlMiztD9o+TMSjkfU7dsDybdRbEUxsc8Dn/b7QLrPMo
	fX4nQ==
X-Received: by 2002:a05:6a20:7489:b0:38b:d9b0:e943 with SMTP id adf61e73a8af0-38bed1c9fbcmr5472442637.38.1768467579855;
        Thu, 15 Jan 2026 00:59:39 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28ebe4sm24582727a12.4.2026.01.15.00.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:59:39 -0800 (PST)
Date: Thu, 15 Jan 2026 17:59:34 +0900 (JST)
Message-Id: <20260115.175934.1159878968513623992.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, boqun.feng@gmail.com, ojeda@kernel.org,
 peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
 bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
 lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 0/2] rust: sync: atomic flag helpers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgi+kvMUyJPMtGr6e7t5UzaV7Gcc1okEQoDfRUqAKCK0tA@mail.gmail.com>
References: <20260115021230.3297420-1-fujita.tomonori@gmail.com>
	<CAH5fLgi+kvMUyJPMtGr6e7t5UzaV7Gcc1okEQoDfRUqAKCK0tA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCAxNSBKYW4gMjAyNiAwNzo0MTowNCArMDEwMA0KQWxpY2UgUnlobCA8YWxpY2VyeWhs
QGdvb2dsZS5jb20+IHdyb3RlOg0KDQo+IE9uIFRodSwgSmFuIDE1LCAyMDI2IGF0IDM6MTPigK9B
TSBGVUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+IHdyb3RlOg0K
Pj4NCj4+IFRoaXMgc2VyaWVzIGltcHJvdmVzIHRoZSBSdXN0IGF0b21pYy1ib29sZWFuIHN1cHBv
cnQuDQo+Pg0KPj4gVGhlIGZpcnN0IHBhdGNoIGFkZHMgYSBGbGFnIGVudW0gKENsZWFyL1NldCkg
YW5kIGltcGxlbWVudHMgQXRvbWljVHlwZQ0KPj4gZm9yIGl0LCBzbyBBdG9taWM8RmxhZz4gY2Fu
IGJlIHVzZWQgd2hlbiBSTVcgb3BlcmF0aW9ucyAoeGNoZy9jbXB4Y2hnKQ0KPj4gYXJlIG5lZWRl
ZCBhbmQgYnl0ZS1zaXplZCBSTVdzIG1heSBiZSBpbmVmZmljaWVudC4NCj4+DQo+PiBUaGUgc2Vj
b25kIHBhdGNoIGFkZHMgQXRvbWljRmxhZyBhcyBhIHRoaW4gd3JhcHBlciBhcm91bmQgQXRvbWlj
PEZsYWc+DQo+PiB0byBwcm92aWRlIGEgc2ltcGxlIGJvb2wtYmFzZWQgbG9hZC9zdG9yZS94Y2hn
IEFQSS4NCj4gDQo+IFlvdSBkb24ndCBoYXZlIHRvIGRvIGl0LCBidXQgYSBuaWNlIGZvbGxvdy11
cCB3b3VsZCBiZSB0byB1c2UgdGhpcyBmb3INCj4gdGhlIEF0b21pY1RyYWNrZXIgaW4gcnVzdC9r
ZXJuZWwvbGlzdC4NCg0KU3VyZS4gT25jZSB0aGlzIHNlcmllcyBpcyBtZXJnZWQgaW50byBCb3F1
buKAmXMgdHJlZSwgSeKAmWxsIHNlbmQgYQ0KZm9sbG93LXVwIHBhdGNoIHRvIHN3aXRjaCBBdG9t
aWNUcmFja2VyIG92ZXIgdG8gQXRvbWljRmxhZy4NCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3IQ0K
DQoNCg==
