Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632082;
	b=BtLYRKk3P6IqGOzzPwTXQmxJfJS/OQO3ekiaBVMfaRQoXovfrOqT2MH3oCw6fpEkAtM9
	 3EuzrbprSoW63a7m6PYJJHwZA2qgbcc3zIFMM1cfhjjXt4aMsEsW+O5hOFJQ5TpbZy8rR
	 wj0XpX9R0jyH3iHrdkXqd3e8LgbbZUK4mfjZMIAZACR7KfRQHyKHRkAcoEF3xtTHsqqb5
	 KGqom9zsC8uPxb/xHtsCGfVT6qnWhM0NCikn/FR9X/39zs12MWjZ2IIjdK3QuMKbvyXk/
	 1nMMyQtLwS4YmnDWCZ17WMhrjpLjJuq3lvfm2I2HQWp6zMH8mqT78NZQYB/wopu0z8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632082;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x9Hqqsl9MJqk2+H/AcnqKEgvlj98SIvK5idOHtd0XmU=;
	b=0izy+xhzzdNUZ0FPljh1NF5cwbXdjylEb4j/yMqGQxnycUqCLWfDTa3RUvxs7oTvvYg0
	 2KmU/N+ReqJ5/Fi/XJNEns0z0CX8B5i6RApWLdY+jF77Xdzp77irbuStlCFZfsLkOTVxS
	 X5yGO5AoZJWoQcg3AGUgi8rYveuln+dp0lbQQ1HFj3/hvru4Zdu1UBgEryEbu0RFH85sc
	 yI4eopsobSpxZS5es+dHhiCoaDfcu5CVK4cU8k6CFZDiW1JY9sX9jWLl+PEHBCxly21y8
	 Ohoae9OBTSDMqVZBmG7F1SPQC7GJz320sHuoRMo1qYj31H0Nm/B0p6t+oyEy91JoTqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kYEp1CcF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C74F606B0E7;
	Mon,  2 Nov 2026 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kYEp1CcF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8636D1F00A18;
	Mon,  2 Nov 2026 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632082;
	bh=x9Hqqsl9MJqk2+H/AcnqKEgvlj98SIvK5idOHtd0XmU=;
	h=From:To:Cc:Subject:Date;
	b=kYEp1CcFjkvMSgj09SKJcdpImoLX9XUhUobPf60D4GoJpnT98QSJjfg+vekciPWiV
	 rgW9ws4KeSCMJkBaEZqRh2YrrawQzdGlhp1j4Y6CWP+8CmudCiCOMe/5VeVyXrcU90
	 aOdwd+2jH0jUO3mkuAnfPjLwQpBfukf5SzGRba0Bmb54x3SAa5WvO6tjOlNafNfyCA
	 WfqGJrvZfQS2jQ8NWjxTMWutFVlaiDGef8rDgKJVO+02Ui1LAiJ8mjRA1fIocI0cyF
	 CWfScizMrADBLO8piHcZsL7UY1PWx4JyB+7czTeYGh2C9GwkicYfGJNmNHX37rjVAE
	 NLRJ/IcOLGoWA==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] rust: Adjust dma_buf::DriverFence::drop()
Date: Mon,  2 Nov 2026 16:06:16 +0100
Message-ID: <20261102150617.527772-2-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While moving our collaborative drm::JobQueue draft forward, we
discovered that some changes to DmaFence are necessary so that the
design fits into various requirements regarding atomic context.

This mini-series is a requirement for upstreaming drm::JobQueue:

https://lore.kernel.org/rust-for-linux/20261016085724.1031766-2-phasta@kernel.org/

This is tested with current JobQueue and a dummy driver.

Philipp Stanner (2):
  rust: DmaFence: Don't drop on signal
  rust: DmaFence: Replace call_rcu() with synchronize_rcu()

 rust/kernel/dma_buf/dma_fence.rs | 100 ++++++++++---------------------
 1 file changed, 32 insertions(+), 68 deletions(-)


base-commit: 9fe580fd90e20c8432832c5f9a7e92b049ae9af6
-- 
2.56.0

