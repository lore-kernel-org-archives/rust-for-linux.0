Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409617;
	b=LVa+CYNUObObQ+qnalzoLjTi3fmZogXUQIpy3cxB2tqdhgRVkDXWilLRA4qR4RvDRDY5
	 aJFv+S7RwYa9Qzw2JFXFOPVLvoTmIVYT+NIdwRvzGJ0KS+35rgsMOSF/x1iY/ra5Xv0MI
	 yHDzrXpVjk25qwsgwX39HNHOW2h2n8FZe90iyoibKfjCJcvbN0ehM82gnccg9Fo5CWORB
	 gFehpfjf63VzEa4dsqXhvK8A/JXmCKf23nPtmDk0wB4SxJfBObFd6lRncbUjuLExw7b4I
	 nkOcjT7ERgLCcMGLBFVB8XJqFJoXeuz0jEjXUd/26jXEpyMtw13y0o9qAtjLb6vheUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409617;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=l3H+Tgo7F19IDuaOl3DouddpI6/zm47K4w8GMfuob/8=;
	b=rzI1j4WuT69+huCzOHiTRtx55DFPKQLMap1uvllvDdfcM1+uRnoNoGNrDpwa4frIvQMD
	 8XlZIfpJ4GILy6i7sCv/X/upLqHdWOyX1qMHEss4ZJ3/m9Ox1mpdo2mq8pPqoh7MdJpCS
	 wRJu+jz9J+Rp6QBUSjtW/S+TeIhavHPfyootaJ/SKRIPyrBYBFy+FkO2KV/KlitstWiEa
	 Vk4qcKG7je1VUMCW5XFIlb63wS7gGIM/1LCcLFT49fHWpSKVZOffKjdOq6m1dHNlXku74
	 +XcESblUXVSb7neu9nblTV7wdq4GO4E121xe2UbdNxZ5wuTWwpDGgKB0isMHSu9QD5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ue6AYPeS;
	arc=none smtp.remote-ip=91.218.175.93
Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67501606A32A
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 15:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67501606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ue6AYPeS
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=l3H+Tgo7F19IDuaOl3DouddpI6/zm47K4w8GMfuob/8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794409614; v=1; x=1795014414;
 b=Ue6AYPeS3EC2Yf9yogex+zRy7adJYCztF1WwhOlwQtd+YoMz4NKkupL1sHlDQ54Mp7rs/slI
 FCw6xVKITwmIQogD184Jg1Y6DXrgmsJMgigLBK0j790ruMVsBjolqi4KDBJlszS752G1l4bDGEo
 qTYlEEkQe3txIwblyE+mgNfo=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cd1204d177ff55ad;
	Wed, 11 Nov 2026 15:06:53 +0000
X-Mizu-Trace-ID: cd1204d177ff55ad
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Priya Bala Govindasamy <pgovind2@uci.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: =?utf-8?q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 rust-for-linux@vger.kernel.org, Ardalan Amiri Sani <ardalan@uci.edu>,
 Zhiyun Qian <zhiyunq@cs.ucr.edu>, Dylan Zueck <dzueck@uci.edu>
Subject:
 Re: [PATCH 1/1] rust: i2c: fix adapter refcounting during unregistration
Date: Wed, 11 Nov 2026 15:06:48 +0000
Message-ID: <179440960895.2149.15642463251380257016@linux.dev>
In-Reply-To:
 <8ee79da8af6557be8ea9cc2ecc74bdb6e4013513.1793488795.git.pgovind2@uci.edu>
References:
 <8ee79da8af6557be8ea9cc2ecc74bdb6e4013513.1793488795.git.pgovind2@uci.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Priya, Nicolás,

Priya, nice catch, and a solid PoC.

Nicolás -- this steps on your inc_ref patch from September (still
waiting on Andi). Same function, same root problem really.

I prefer Priya's version. No new C export, no Ack needed from anyone,
just __module_get()/get_device() directly on the pointer we already
know is valid -- and it kills your locking concern too as a side
effect.

Didn't want this to land without you seeing it first. Shout if you
disagree.

Priya -- Reviewed-by: Igor Korotin <igor.korotin@linux.dev>

Cheers
Igor
