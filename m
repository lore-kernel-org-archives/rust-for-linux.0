Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.215
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409109;
	b=37zL0cnlVOc9fBujuoBBMz1Y3yo2Z8L/wczEm66TrP5ydvuJIISrPK5vZgAbIyocQhDe
	 tfwcTFCItFBs5smN8S6GHuiMuDrPJOlV2fNbR9MeCVsm61dF89mHISXem0xZ5IYW2f/Op
	 EBxwhsSKtP5Y87KQtP5JB9fsr0Yu6z+YVg1sWJotKGfN2D6AGkEPctsZVN13+uGo2bK7H
	 OeLxMEkrEHNbqYifUDN5gHsRfVSK+aMQ+KZuDqG8/p3VrMsxoN0O9kkpIxx93z3DEnTZf
	 HX6wVRcfKLjHt58itUDXGMWvB6d74+WZMNNckHFOtVW7Qa3cZTkyxG0z17neICKvnUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409109;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=byL/9IM6xgjdPi5Ss/cz8AdXkgWexIzqBw9kg9a3atE=;
	b=XY+qcAHJisTU8OLTj8rz9MAedsVs1wZut8eDKUw3TdaOKcJBNdLVar/5dirh8ZHaQWIB
	 IiuDE8mzCzUHfhAEktzFj0s3mfp3RkSC2fdQBGtN3JNiDREsIZ70sF/E+kkrlFcE/SKjT
	 MCsvTF7a8jRllhW3BbF+WpmYi37FpcTt2VadCmTn/r/tUYSkQ4IiGnJbXNjkM26naRTm0
	 dne0lxSNVN//g2nSfjtVncnl29x76mQAcQ1mWae+paQow9JdgSddPsLdHsNS+Y0UMvU1j
	 apHFGA5Vxfx+L3Yko2YjButTQSSQFzKzNylm3gYWTbqoPusiGuJZVlueWXHrRD8cUtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D5OLBuUX;
	arc=none smtp.remote-ip=91.218.175.215
Received: from mta0.migadu.com (out-215.mta0.migadu.com [91.218.175.215])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6546F606A331
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 14:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6546F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D5OLBuUX
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=byL/9IM6xgjdPi5Ss/cz8AdXkgWexIzqBw9kg9a3atE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794409106; v=1; x=1795013906;
 b=D5OLBuUXixcJNA3wq+w6klYYPciWED0PbZqilIweuf3CMBINVxZbzuZCFmQKIv+tXdVt8YXM
 Dffrd8zOxjF3fZtb7QNusP9iX5ZLEksSYQcvx6FsryJiZz2vU0QggwIoE1TGCn0QXgfi5uilw8g
 ZB9KDMBgF797dexgX8cnITp8=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 36196609946a065f;
	Wed, 11 Nov 2026 14:58:08 +0000
X-Mizu-Trace-ID: 36196609946a065f
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>,
 Brandon StJohn <branstj@gmail.com>, linux-iio@vger.kernel.org,
 linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
Date: Wed, 11 Nov 2026 14:58:08 +0000
Message-ID: <179440908805.1963.3189482737225975976@linux.dev>
In-Reply-To:
 <CAO26r3RofEz-YCnaUfTTb+7phdEzUqG5iwVObuho_EgW5Ep44Q@mail.gmail.com>
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
 <CAO26r3RofEz-YCnaUfTTb+7phdEzUqG5iwVObuho_EgW5Ep44Q@mail.gmail.com>
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

Hi Coirul,

Sorry for the slow reply. Co-developed-by/Signed-off-by is fine with me
-- your call either way, I don't mind.

Cheers
Igor
