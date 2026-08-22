Received: from mta0.migadu.com (out-223.mta0.migadu.com [91.218.175.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00083A6B70
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Aug 2026 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787398745; cv=none; b=ZNoXEVtao97S+MdjSqUiXNoe2KDDhTfJ9976SWhk8JjuXWUH8X31461C1hIxuqjHqzViznaUjJeKv7lzL8qSHejXSSdX9zUkUr2WcjccYOjq55BU+VH8GQ1eBvdvG5UcJoLfWjxO8t/qvHm/1+CO5Ur5XXfsMGeYfw2hAeED82o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787398745; c=relaxed/simple;
	bh=6vraq3QEPbFs95hq4rBaV2iqWPM/Nu7KXs4yvsug4GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gbMIuuOODoRlMB0VxgBR0BYbgiJXf2vNaXGcpQQFfT5d9FOAE7XRCaKN0uLztibBJP3sJYxpjq1S1M7ge7Ev7TAOeGYT4XIcgG64MPyaHqFskMOo8I306vO/r2fIl+B+rnD7AlzPVM0QiOf/6DQ9niAYunZf3rc5b3rOSjbPS7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=coxwwFmC; arc=none smtp.client-ip=91.218.175.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="coxwwFmC"
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6vraq3QEPbFs95hq4rBaV2iqWPM/Nu7KXs4yvsug4GY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787398741; v=1; x=1788003541;
 b=coxwwFmCri+epUmOttu2Xv+ux0HLNQx+xmK+ajANuMXEwsb8E3k+W9zMZqEXEbJw0gwTx5Xl
 b0c8z5k4iWwDmHBbKtIC+G8LrMiXD49f7ah7vIRsJxXExUoJyV2lJj6CghoCGoZ1XhfAJiCu++h
 ixx8dKM/+ObscDpP+73I99hs=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: from Vasilio. (90.193.199.60)
	by smtp.migadu.com with ESMTPS id cbf5556634461e63;
	Sat, 22 Aug 2026 11:38:51 +0000
X-Mizu-Trace-ID: cbf5556634461e63
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [GIT PULL] rust-i2c-next for 7.3
Date: Sat, 22 Aug 2026 12:38:47 +0100
Message-ID: <178739872719.9834.5401695033021882071@linux.dev>
In-Reply-To: <aodUPU8RGR1ZJlQm@zenone.zhora.eu>
References: <178717488339.2840.16053648973983973210@linux.dev>
 <aodUPU8RGR1ZJlQm@zenone.zhora.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Andi,

No problem, rebased on i2c/i2c. Updated pull below.

Thanks
Igor

The following changes since commit 7a79b02dd1b09c235c3cf6075bccca2160d1b826:

  i2c: rcar: fix reset handling for Gen5 (2026-08-19 22:07:13 +0200)

are available in the Git repository at:

  https://github.com/ikrtn/linux.git tags/rust-i2c-for-7.3

for you to fetch changes up to b5fa55ad007059547c9139d4c4872e158ae255f2:

  i2c: rust: mark I2cAdapter methods as inline (2026-08-22 12:22:27 +0100)

----------------------------------------------------------------
i2c: rust: mark I2cAdapter methods as inline

A single cleanup for the Rust I2C abstractions, targeting 7.3.

`I2cAdapter::get`, `inc_ref`, and `dec_ref` are trivial wrappers around
`i2c_get_adapter`/`i2c_put_adapter` and were showing up as their own
symbols in the build. Mark them `#[inline]` so they get folded into
their callers instead.

Signed-off-by: Igor Korotin <igor.korotin@linux.dev>

----------------------------------------------------------------
Nicolás Antinori (1):
      i2c: rust: mark I2cAdapter methods as inline

 rust/kernel/i2c.rs | 3 +++
 1 file changed, 3 insertions(+)
