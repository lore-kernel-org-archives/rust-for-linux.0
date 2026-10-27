Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099003;
	b=ROHBeKq5n6kx8YilXO9xGlgyObkiFBajIUcjDhRYtbNkJpP0jCqk9DxGZd+Ay09ShAIy
	 VFBgnyxlk8oyShgT45rk4Ko/D0XrBZ5m/GHaT1C/Nadrf/wyybY52Df4uJa8Ke+dG58SR
	 mH76KNBzMfm6V8HHW06qNP7wJZA9zQZ2eK/t24vvMoxeqAuy8oMIA2ox3qtTbk8xcfdAR
	 FgMBcdv8QowtDTmoGjQUIZ1pnT4dX/XsusuzL/cM9msy9D9NwLY8qJsFTI72Fkv+TA6WT
	 pgKF6Klwbi02xqT6BCxKx/7dV/YxO+ZXbXhBHtJrf7x4qGHyqnNLDJR+I6mw8pB4Kfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099003;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Debian-User;
	bh=nHKLSnMheiDS31UsYegs6BbwSkSWlAIzLYimnH7hx8Q=;
	b=N0U8hM4ywZnFcMO6AOzX8cjM2L5mnyKiKyzYADaX+x9IBU58G4nPCUwsUfIaI0mjYT+l
	 PtI+sFUaXIym0jUYD2RV+RlYA9gAC23fLETnp9Hn6B8RF2Xvb+sZYaRoT/H4Kn4zBL834
	 dIZaqNM3lIR/iMfVL4SE9oWN6raA9ojwhdbPXGDNnH8j970fyavt1jqGBq96o+2H7AUo6
	 5LonYKCoKejGpGjNyMApo9vhktD6CWnPzPAtLSu+4d0miaiG8end6jfX5Ps4JlggwVg8Z
	 k6F7khEWEPQ6oIv7SD4FDbEo7KDnGem8Jy7YRuArq/JYzWnJ7h12mNXaqKjQay/7YMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=CDGqGFrQ;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B832A606A31A;
	Tue, 27 Oct 2026 11:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B832A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=CDGqGFrQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=nHKLSnMheiDS31UsYegs6BbwSkSWlAIzLYimnH7hx8Q=; b=CDGqGFrQj13sJzTvPFh8hxKOI4
	tWPrzRcLGwpip55Rbobm6xmCZ/uxw1yl62klWic/qdlMub8verqkijomwN1NCMQUIa6lj9iw5bQf9
	m+WbIGPuqA9P/UjDcnk7FNCc8c06wGta4CIzVMVgMqrrCh9uufQl5/69gnDx7VDyRaiq4JyaXuQPM
	JyLZyTAm5x7dZWsuhaHXvywQNueEMi3Qqpvw7yC8SmBvb1GeRQPj4fDxuGHPDQFBviyXaOPv3pyb5
	btSILkzLCg00e1I+q/SEnoy4P/BFRjm4+2hD3Z0zguJPD8wgqaoZybeVC4KXypp0GntDhiD4GBnWL
	mVoh+fVw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xLexV-001PYe-0m;
	Tue, 27 Oct 2026 11:03:13 +0000
From: Breno Leitao <leitao@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: Gary Guo <gary@garyguo.net>,
	Priya Bala Govindasamy <pgovind2@uci.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH] configfs: zero the write buffer on allocation
Date: Tue, 27 Oct 2026 04:02:59 -0700
Message-ID: <179309887602.2591736.10699614115751352307.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015-b4-configfs_kzalloc-v1-1-17c1ba6db062@debian.org>
References: <20261015-b4-configfs_kzalloc-v1-1-17c1ba6db062@debian.org>
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
Content-Transfer-Encoding: 8bit
X-Debian-User: leitao


On Thu, 15 Oct 2026 06:20:38 -0700, Breno Leitao wrote:
> fill_write_buffer() allocates the per-open buffer page with kmalloc()
> and initializes only the bytes copied from userspace plus the
> terminating NUL. fill_read_buffer() reuses that page if it is already
> allocated.
> 
> After a write, a read on the same file descriptor therefore passes
> ->show() a page that still holds stale heap data. A ->show() that
> returns only what it wrote never notices, but one that returns a length
> covering bytes it did not write leaks that data to userspace.
> 
> [...]

Applied, thanks!

[1/1] configfs: zero the write buffer on allocation
      https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git/commit/?id=ea00693fd86e

Best regards,
-- 
Breno Leitao <leitao@debian.org>
