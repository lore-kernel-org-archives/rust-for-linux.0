Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622C9284B26;
	Sun, 15 Feb 2026 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771187010; cv=none; b=TP9x2rDdT2jMjmV47bkp9G5tFoSEyjOAX94//2HWrONymiVg6aO1o+X2Ie4YM2ugf1fsWSgF40HCjSi4S28IBp0fKeHG3fiMoNBRqBF0v+UeEAqRPiPqT7hMSO3G8d2QGrzHBAbqf7dh4u0Q96r+msxN4D6RkOVc81+Ji/1eejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771187010; c=relaxed/simple;
	bh=t0+bXJEAqBEx/dzBpuCrurNmsEgiboaKqEVhJt7mDRc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FlpYgRMYz67/ufmyf3tPHpRRsLtOq47TVy+cmViEXW3HzbdO1l4pIAN/XqZe6ho1xCvfg0Ti1OFKUwAd2oCEwpU3m0c6AhFI07nrOSN6jbVhXcD7qxNpIrll/cGALKlORZHqOmTrCRwZMudZ9VGkFktGb1wAFrmU6IUWkgogCLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpIGURtt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpIGURtt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49CEC2BC86;
	Sun, 15 Feb 2026 20:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771187010;
	bh=t0+bXJEAqBEx/dzBpuCrurNmsEgiboaKqEVhJt7mDRc=;
	h=From:Subject:Date:To:Cc:From;
	b=jpIGURttX2SHY1j41c+aAArdGuIe7FQxMN2lMT9ytS6n0BqI9WjemGOIG/mn/gbAc
	 T6pj85mBNZnYy4btnRt9C6nGkvMlhDjyspWQOfNmuLkyVQyXAq1O/dWqelaa1xTSAz
	 WA5S8eiJQGjCbTvsUjTXDQAqZM5QxRAgfsW2S5+jhl+pq8D37eqs18ZMRotIWlkIBU
	 Yz0ZX93eQZ3gfDRkEM1N9AVisxJruyPuwEWPErtKSQxKvVu2WPobHGlqix+Lk/mA20
	 sjYNqumWy2X34yQgvQ+7WSGbmY17AGqLb9ckV2aDvraE2o0zHMLoo9pNXCLOudEnGI
	 5/fxFsoL59Wig==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH 0/2] rust: impl_flags: add convenience functions
Date: Sun, 15 Feb 2026 21:22:56 +0100
Message-Id: <20260215-impl-flags-additions-v1-0-6538c8fb841c@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACArkmkC/2WOQQ7CIBBFr9KwdgxQ2ipXMS6ADjpR2grYmJjeX
 aqJMXH5J/P++0+WMBImpqsnizhTonEoQWwq5s5mOCFQXzKTXLZcigYoTFfwV3NKYPqecvlPwGv
 FvXfWNHbPCjpF9PR41x6Onxzxdi/t+XNk1iQEN4ZAWVdzuxVv7qvUVRE2vOYKPJq8qsBSDiZdI
 BgXR2iVVFa4WnQo9bz7p9e58ncuDQNGcK3Yd8rKzoqdngU7LssLBINuPwUBAAA=
X-Change-ID: 20260215-impl-flags-additions-0340ffcba5b9
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=t0+bXJEAqBEx/dzBpuCrurNmsEgiboaKqEVhJt7mDRc=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkiswR2qoQ6BbWoS9PxDe0vtw2CDTxqdziDgwI
 See/InkJpyJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIrMAAKCRDhuBo+eShj
 d/1CEACxAXxmsEw7aqhf4gHpQLReqV4BE20UBcUNLGrNyRkJlN5hLXm99Tpil8g8IlCKYUVUEJI
 NK/YJjf8bfQWUQsZCd9MhgL998js2ZPj28ZQO+ux7vERIcr92AlHBdqHGCfut8hb1KY+HaQVI+W
 bF9vm5xHVFv2fL0kWgCqnv9aZK8DC05W6bAElS1IjKNehzYwOWQz1uc+Csl0jt7YJxo1P6ref0j
 ujwpHy9cSLx/L2rUeBEzgV3hrIchgGPUXx4e8mEmFCIa49ohf605DfrgBr/PcwNAj4tFKJLIKjX
 uyX4kzaJkZzF8yblnHJWYf5Z+NdmhaGS8VTv0K559iU7oeahOZy23i+LfkKB98WYcFuWWXDk0k+
 x7ViaRu5BLGxMfMXDt6KvXY27/TeUR9EgILNuKKArWzCcAZ33ZWiK86fZSlkeP9xUSIn4/OpWmr
 dfr3gVOUm8vxxPtLY5l+3zODY4ZFNqgdpkj+jdk52qZmGVihdcL7uTOMvbzX2WiOcHGMQeQ/SHe
 8bXzjI9OnKydaynLK2UswkqgYeUOwpsxFLGzGCwUwLDkFnPLG1jhRUMIpq1wwz8QUhQyV48xOP5
 9MCIqTZehNRFIbFLuDOubFU/pPqsnN4k+MAbUwK+1x5fCwUwV+R1ybJu6oVrUO63LKz8hUJMWpe
 VWRBKjBg47KzryQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a few convenience functions that makes it easier to work with the
`impl_flags` module and C APIs.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Andreas Hindborg (2):
      rust: impl_flags: add conversion functions
      rust: impl_flags: add bitwise operations with the underlying type

 rust/kernel/impl_flags.rs | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
---
base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
change-id: 20260215-impl-flags-additions-0340ffcba5b9
prerequisite-change-id: 20250304-feat-add-bitmask-macro-6424b1c317e2:v8
prerequisite-patch-id: 05dfcf648017dee65c356604e4f99959e76ff64d
prerequisite-change-id: 20260212-impl-flags-inner-c61974b27b18:v1
prerequisite-patch-id: edebc37750dccd8d19db0b8fbd5f69f9877675a2

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


