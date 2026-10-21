Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579098;
	b=ReTfftMwTSYCvowsTRTRvrN5/NxGNrcPKQ/c7w4wejg3imV/E8qZ1J3/wjpkSjOwlNVs
	 kaJZmxsiyokFbG8IE3BCj0gqy8d91pvOnyYnE9OESm5VRobG/vPvETleVuScmsHHrqhIe
	 JBcMSUesXRckR+TikyO+tNLcfb5eb4/tyl862MV/rQzLKp7PUxKwY9Ll3o3h4YyTY/Kg4
	 dT1i217K+/8MIAE2sJ+55N5xUUdsOEmmxqR4Fp5LBgHnLOninZRc/E5t4x22MNi+AwEzA
	 MM/iyQtGBeZ+xQWRVSyx1kjDsqDZ9R56Laaium6DBs6r8MR5nCcEsXu7BLFBMbEwlwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579098;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=YwmUvHkGTa//vS4IwVUPfkvfm6qtdCHeRkio5ziEENg=;
	b=0ZS4GqY5gTwmtexjnyKHn4GAuWvmk42MGxwRi/v+129qMP/8kLvtrXVZVxfBBpZrIfAz
	 bFxClWgRoXU1qRQD2y+LlWAg0mm+haCPj6jS0+sj4zZRm6VMJtjQ6FhTPHrpjX78RumMp
	 Lus0i4mhTr5N0JuMZdz6p4Fw+wUH70yd5y84IF8n0b4qEXjRPi9VMZbAncTJCJrHADe5w
	 BNoS2iSvaRu6uh7DCTCHeP0sOqMO3kxcWauih/STlZlh3HpaxXmBvv+bsbMfyTE5PNWmO
	 m4BeKaUAlicjBTlEqCjdeJUZ84F32BvYNq34sbLI+GzT4mCykl71vMfq2nVs50RKZFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qxKhbAYE;
	arc=none smtp.remote-ip=95.215.58.38
Received: from mta1.migadu.com (out-38.mta1.migadu.com [95.215.58.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346D8606A31E
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 10:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 346D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qxKhbAYE
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YwmUvHkGTa//vS4IwVUPfkvfm6qtdCHeRkio5ziEENg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792579090; v=1; x=1793183890;
 b=qxKhbAYExvvO/VDn0+h10+AgjZklvfrMFIrLy2113+ersaIn6pOVqXbG/o8ntBEKfnKy/4Il
 w6ghk+UBWzPwGSG6rMKxW1qgR0+HPpNOmb1VHmOVtESus4Cown6RetuxACVT6n3BPGdpv9UfN+3
 lBuzoPv8SdSTTdqqeRwfI/PY=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c9ca0b03b8d94fa6;
	Wed, 21 Oct 2026 10:38:09 +0000
X-Mizu-Trace-ID: c9ca0b03b8d94fa6
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: =?utf-8?q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>,
 Jori Koolstra <jkoolstra@xs4all.nl>, Miguel Ojeda <ojeda@kernel.org>,
 Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>,
 Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject:
 Re: [PATCH] rust: i2c: remove TryFrom<&Device> implementation for &I2cClient
Date: Wed, 21 Oct 2026 11:38:07 +0100
Message-ID: <179257908750.11105.893364071829221111@linux.dev>
In-Reply-To: <20261019152329.620610-1-nico.antinori.7@gmail.com>
References: <20261019152329.620610-1-nico.antinori.7@gmail.com>
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

Checked -- confirmed no other users in the tree, and the Fixes tag is
correct. Agreed removal is the right call here over a lifetime fix,
given the new driver model has no use for this upcast anyway.

Acked-by: Igor Korotin <igor.korotin@linux.dev>

I'll take this through rust-i2c-next.

Cheers
Igor
