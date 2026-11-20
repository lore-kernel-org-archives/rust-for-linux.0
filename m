Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179127;
	b=Oq84RwOrWLGaFANU4o3MLIkaboFspPeZRy7cLu6/YSk1HVc6XMfz8e++0+RfHX4kq67N
	 q67IPrWZQQf76IqHEBRnkfskwMaJf3sjHTH5gKvG9+fH6Z1avny3UIV3fk1QfvO7b41Ur
	 mlzsZzPzQPdyi7iM0gxMV9LonKQFTuPzcPzwIFhntrU4oXFNBrju06lR8gquhsHab03XO
	 /Z9YLWS+7B/zYtwFHwggxJUxR3hgxDom4DURdTY0FtPhXlhq1m7Wp+P9e0AQ5PqaDqPSH
	 FhFRqs9umIbuObddsht9ZcSn4Q7ioMUtKlkoX4d5hH0e4vC897wk4WYRQFbbnJO8CqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179127;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=NQzwZFko7EZvY1T4HBbakHq5tX2GJ7Xaphr4V0sjXY8=;
	b=mBOTq5YNh7tLJg4qcOQzsXK0pbJ2zm2t+IjSgN7b4uW7d9H97usjUVdoBOfIPtmuDe05
	 MK5h/iiD9RNBCXFOCw8qQ0ODc1JIUoKNO3BpkEcYqi3S6zY57gMf4z3slN/8qISmsW0Q3
	 Fh831x2C/wPazaWrDxVT7KErZCrHtcbqtew9FTRx9Sjy4TCqAW4FKUp3+esEaydhGcPun
	 CgTkh6/N1Lz3wmg2gcqsgf4PCxI55aM3IrbWEf+/e+6k5uhdUbYC7IMqnm2v37RysvUlP
	 y5wnPFumvwDhpYC1Y8LaGTdnjk+QMZiH3d7YoFWZO2bIxzRvATztsNaqhJdiRFnBK0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TazxZelX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D208B606A325;
	Fri, 20 Nov 2026 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TazxZelX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1C41F00A00;
	Fri, 20 Nov 2026 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795179127;
	bh=NQzwZFko7EZvY1T4HBbakHq5tX2GJ7Xaphr4V0sjXY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TazxZelXWwqds1bwuHCWOT/vUfyLcnMzQJTHMxAVBi4xbH3jkiforRp696A5m/srP
	 PJsMzFQCTRCcoP8FIw7rj/hh2aFCV8F5OzETjuK/B3ypQkA8YuO0VOoiPLM2KIjSLV
	 SIuwCUEw33xJKjaLlCSxHj6EO7sTkaDZxjnNV7IeP6eg3I1MRmCL6AILN9ZzUs887/
	 2PHmKwdU2WrUsKebgZj6F0K60VOOloJLPLao+DYvfMcYbAeH8eLTPq7iOn/ydQx8a7
	 daBMUtWpjBCVtxEfxgWXjkpR/RLGV0SiuckS0m9f94XXnsxTL2KPf0N1OyKl7b4Fj/
	 YFpDL+ksDtHIQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Boqun Feng <boqun@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103-xarray-lockdep-fix-v3-1-e188bec82003@kernel.org>
References: <20261103-xarray-lockdep-fix-v3-1-e188bec82003@kernel.org>
Subject: Re: [PATCH v3] rust: xarray: fix false positive lockdep warnings
Message-Id: <179517911637.2089455.1616904150486555475.b4-ty@b4>
Date: Fri, 20 Nov 2026 13:51:56 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Tue, 03 Nov 2026 17:16:28 +0100, Andreas Hindborg wrote:
> `xa_init_flags()` is a static inline that expands `spin_lock_init()`,
> which generates a single static `lock_class_key` per compilation unit.
> When used through the Rust binding helper, every Rust `XArray`
> instance ends up sharing that single key. Lockdep then sees concurrent
> locking of distinct Rust `XArray`s as recursive locking on the same
> class and emits false-positive lock-ordering reports.
> 
> [...]

Applied, thanks!

[1/1] rust: xarray: fix false positive lockdep warnings
      commit: 144926fa55f49c39d8bdada30b2a8b91b7dad3c4

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


