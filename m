Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438090;
	b=fg9kQSHbikM7DZgcMFXi/Lmu/1on6kO2Iz5kV+/fcggJht0y7ROGjrgE2uO2VkLGeihE
	 uWSN5lnl1FnOq+zrUDCLSC5DXkGDySrf4nT/CNOyDEEInemkPamOryvYbTfiKG7QJx1Xj
	 1GSVdv/1qm+jMvkfyAUa0s2XmtE5OXgW8aHE3CdZb7zfAZ6Eo6TF2cw+8Igjq4pcia32x
	 UZswkQwEVtCHRGYJYVF5MuI8ZS0Q3O/uZ2CSasJxVjPyjZlc5bHHOoemHk/2p6BPE+xlo
	 MHuy9ULEniY0bjFJnIborpmqtrj75U5cTqaWmrYFKVO61aiJBChvbHoMbeTEszRJNMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438090;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=STt62GhrjtlAglE8Fpdd7yc+6Z9UwSuWNn6eYMG1ouk=;
	b=DScyE5TfZ3GgawL5SEe7nx1cRZyKS5ztDO5EeadVEnJsfXnqdJ3RnxuqNv6+fUUMeNTb
	 8T2A1bE5Cy0immtX/nfJ1d/ATZr5yZoYYnJCNVtgpyXGzV0MdY6LwowrdtC/8+/GNUo98
	 KP9OKjDMzxvZUTrWiMq9ySUHruQUfpEgj/bVh4/I8nSmBaovHjFIWLcGpUCVKoglUpFwM
	 gvJfXFjeMEGAVk235wTeAE1HqTd4FOKTz5xgojiJor/gyd4q+gH8v8Uf16rei4bbLTn9W
	 bpA52C8Xdw25dLYklGMxCYMk3RAmwAOPRocAyME9XTKldbvyIVeQmgkZ/f/dI38LWPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Fxg6xaVk;
	arc=none smtp.remote-ip=91.218.175.228
Received: from mta0.migadu.com (out-228.mta0.migadu.com [91.218.175.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFF6606A323
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 19:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BFF6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Fxg6xaVk
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=STt62GhrjtlAglE8Fpdd7yc+6Z9UwSuWNn6eYMG1ouk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792438087; v=1; x=1793042887;
 b=Fxg6xaVkCLd31VL2ACSczgLAU10H/yiRjT9CLYtgrY3Vwyrp1XN6RreeKwKU1DE25UVEMOOK
 4mjjmR8YztXS08uX/r9C8xnBzon07y3wnSdQgkdQIt4WGi7hOB3sbBksWW+btIWgypIB2Vzl2+M
 T5zH8450C9GCZzQQWdyJq2FM=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5e3ea1f02a9fd8ff;
	Mon, 19 Oct 2026 19:28:06 +0000
X-Mizu-Trace-ID: 5e3ea1f02a9fd8ff
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: =?utf-8?q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 Jori Koolstra <jkoolstra@xs4all.nl>, Miguel Ojeda <ojeda@kernel.org>,
 Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>,
 Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject:
 Re: [PATCH v2] i2c: rust: avoid locking when performing I2cAdapter::inc_ref
Date: Mon, 19 Oct 2026 20:28:02 +0100
Message-ID: <179243808241.1915.11587324230389063446@linux.dev>
In-Reply-To: <DM3QKTJYPA8I.13TW7H9HIV3YB@gmail.com>
References: <20260904134600.340991-1-nico.antinori.7@gmail.com>
 <DM3QKTJYPA8I.13TW7H9HIV3YB@gmail.com>
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

Hi Nicolás,

Sorry for the silence, this fell through the cracks on my end.

rust/kernel/i2c.rs side looks correct -- this is exactly what I had in
mind in the v1 thread. No change needed there.

Reviewed-by: Igor Korotin <igor.korotin@linux.dev>

Andi -- the i2c-core-base.c/i2c.h hunks are yours, not mine. Could you
take a look and Ack if they're fine? I'd like to merge this once you have.

Cheers
Igor
