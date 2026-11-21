Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795293519;
	b=qAXl6C4wYOV3ZzVRwpEXVOgZFAbOHdTbSjE0wr1hchHoTwnvKQm1HswfmU16d1Ojqz1A
	 BfuZZOLYaVLMJJYkzjogdq4to7M3p2CGK7LVmYTaXJIZeDtl5utp5gZxjJCUe07rK05Wb
	 8fnSRtf+h/hJZ0o4l/S9eFkVaNpp2HX47MeTXhIruzhrZaa5iInK25E6ZDFJmePooidcs
	 CqcoqfnzD1FkzmvJSqNaOjVXIlTK2cO4I931GAlsebgX+On89ad4Qd6hYFm7l1Oe/5vVO
	 d9hVTws/IWYfrs7LOILx8sGpeABrWfDIDtuF03d4E90J6gcSV6vGod2F6eLUgtYmMwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795293519;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=6FHwlCAX/DDPQXG3Am6fTEBu0QJ9hiclqgt5QIPJaAQ=;
	b=TrmrCoMSZgYLe1bFSMsgVd31cxEDpfZYYZHSsSIfmcq4cXEtnEzdyVNR9aWGt4CImK88
	 HRCfRaUH9vE6mclgH1egeNFQSk78qLEdEe8TV+Bo0AWhbecag0xL8CGHyLEDltXfQuvyU
	 KpU3FjglD+jEOsvHlZtrEJrUHRYRpR6U9Exo2oiobJa92UlfETgkFcACqkQ1/m+AQxc4X
	 zZhwSMOfdwLnPApivfhN/vOMR85PxEXAkSqd05Nd93bs9tVKsCq/BP9F3R3lZ4OCvjtf+
	 GFXSFVu5UQJbMJKsifMvj+bkLohiGbHvoqXygz9cjE3v7xrfkZlLJZb38kMlkuqwyCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZJYHzlzJ;
	arc=none smtp.remote-ip=95.215.58.67
Received: from mta1.migadu.com (out-67.mta1.migadu.com [95.215.58.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373F1606A32A
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 20:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373F1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZJYHzlzJ
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6FHwlCAX/DDPQXG3Am6fTEBu0QJ9hiclqgt5QIPJaAQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795293516; v=1; x=1795898316;
 b=ZJYHzlzJE326rGitO+pCAayWjpW0CFYeQfMhFOFf7ajEwkvCk2A3YmNAviUJFMiMzq/ooanI
 1I0ud0kdvBsJ2S7z/TJjeb6tjXWtOPFbWD5bG3OQeHDezUShPjgPWqeWAS06rptcgj+lnq4zQ0B
 ZNQLqInD6/PXs3Dw3wvwslyI=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 45cd263349750bfa;
	Sat, 21 Nov 2026 20:38:35 +0000
X-Mizu-Trace-ID: 45cd263349750bfa
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Andrew Davis <afd@ti.com>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: i2c: Remove use of bindings::i2c_match_id
Date: Sat, 21 Nov 2026 20:38:35 +0000
Message-ID: <179529351558.12162.7808461205594973835@linux.dev>
In-Reply-To: <20261118164404.237865-1-afd@ti.com>
References: <20261118164404.237865-1-afd@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Andrew,

Acked-by: Igor Korotin <igor.korotin@linux.dev>

Taking this through rust-i2c-next.

Cheers
Igor
