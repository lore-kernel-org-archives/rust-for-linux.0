Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68EF19AD5C
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768652576; cv=none; b=mtIwW8O990vNPjatFxOOpyzGxcxwkINTgJ3Ep27SPexY7duQ0etLmEndp7WWS1YwRakLxVLVALgcvJBsn/orFlGmyHq4OY5qjP4HQdiprfgulfolOscZVk9SbKrTrCFj6c2c2xsnOCPJVSufeoCcGAdKbO6c+L8M98+wJ4kQJXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768652576; c=relaxed/simple;
	bh=HHdfMtrK+bmGVYj7ahqR9WU8B1Kz4HjTRa7EEgx6X3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zo1ceHCJ9T3M3/a9yNopctP+HpNHOL+R/T5tLf2iJ3D2xKGVrJq2dTJ7anLLTQNXBbszXF8c1VGo+/mWvtsDmrMVYkLeUEGv0MyP1Hg524M7ixbajhiMDri2O4tjPlFHLd98SM42Rd3UDLF9ki9m5vtFdwh9Oc60l+gGRTxvJPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nu45kaKO; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nu45kaKO"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88888d80590so43409136d6.3
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 04:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768652574; x=1769257374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=12jZWVyIBthP0eK9MRhtgrjqCiALPkPet5YpqzILAWA=;
        b=Nu45kaKOUcSanpEbRhBikMlJZcAUJwGkErvJHv24q+lrjfIQVnilQ/+Mw6r8/xSV3F
         vgyJnNWwCNxtvTIE44LV0QABtJwQO6yiTvqGaKs4Mk/UOetYkS1YFA+uohmIeBYG0K/I
         i0kKGjbkgnvgjlGP8XiBmuwll5RwsMVi2TSZPPjdQa9JODYk+w24wDEmb329myY36vCF
         BUkEPF1h85kgx3Iw0qGOsBKS1bMoLJhQIkErZCbgVEZMTSE56NbXoevO5AZqKTX3VRMb
         vzICeeyPi/bgSY+/il1tupZkUXPa2cL7NmzPsf5dFGQh+lX2WZIerG8kmztAJpuIOF07
         kp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768652574; x=1769257374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=12jZWVyIBthP0eK9MRhtgrjqCiALPkPet5YpqzILAWA=;
        b=TaJMe3bPibNg3saEL715wItBa+JAI+uE45JGwpglmLoZR/E21M3vyLYnEQ95sv2M2o
         DEacqFsS0FUq6+0nwQ7yWhK1tPDSswThWMNve3w67hE50h1MnQP5JUC0klPiPIht2/vh
         v6DiefmNoNjSBmso9/3A4XAxBMmKN4hlHQoj4m3VAvOaGZGq/zaJqr3lTgWxaRKA/ro9
         RQMfzc86cpAWAFdS88kdjzsemvn87GuZRbjJdLRl3whAVVC5Fay53Ufk0wrdga7OGIkR
         vrtvShsDehPwr7cpXxTSRDRES9f0RqBSvQO+BtoJH6xN9ObGz4deoUXnn+Syoub0pKSP
         KKhg==
X-Gm-Message-State: AOJu0Yzp1F8ulb5V2lBgwT8XqtCTl39uEVq68WQG/UIuFks129AL3Z8N
	zd4gxAteWYM2dQhmXecd5LYtjQ7sSx0jQUq+wJnm5OKb0OKA3wFtXuH8
X-Gm-Gg: AY/fxX5tYN+E+gbYaqjgGrKeAbocwIohuYPQN+bpxV3oThMZiddsNkpAu7+YE43Zwqf
	Pu2ftQrtLhDLgdtys7DK7wHuItZoNa47G5khk/pnO/qYmWXXR1V4FimZn9vwNcF3u1U9GFaahE+
	3Yhz3SNh3+goNACj57pkCsqnkmnANEfo2beqwA7o9vRISPvZgnapbcK2aZB02H/S9AtTG6boucm
	xpmpUveSXo8UYgCAo3CsVNVlzWNACglLgPvscd6IF4bxej/kksxq2ZdyOncL2uadQD1Ev4nzvBf
	OBOiejRJhv3IsYjvKKk0+CCB5M8JNQpP5GuE0KcWjVhwlu91crpTmrxT7X8nJ1Z5KFTvPhpFn+N
	RkQAoTVCaX/1f2IwZtbjY5mefZjt2ZHpbbd/g9WK5QpMIBo9X2nnvDDi1+m4LW2ybnYzjmIxLcc
	omB6O+11afx6Da6TVb1CGYDZLOxdSiUlDcnRQVnESFa1o9aqwxCfsFlxjeMFQsdVD/SmBfcHvYh
	6YgG2CJlKqpGX8=
X-Received: by 2002:ad4:5cc1:0:b0:890:6f67:4127 with SMTP id 6a1803df08f44-8942e421af2mr74248266d6.4.1768652573750;
        Sat, 17 Jan 2026 04:22:53 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d886esm44612926d6.57.2026.01.17.04.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 04:22:53 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9F6B0F4007E;
	Sat, 17 Jan 2026 07:22:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 17 Jan 2026 07:22:52 -0500
X-ME-Sender: <xms:HH9raSJ_NAn3eaG_VMEya6B7ptt2CF1QvDLW61-Y0LPy_aQHYerUow>
    <xme:HH9raX8KV8ktsVnbT3GEa6M2r89RHCBpjC-C1HlnbTeAO4snZuS0KSZyfDy5Qc2Sr
    zAJuvp6EshuFk_u_zNyUkug4PJhAdNW1Ue2HyxHvwAhra6CuMsK>
X-ME-Received: <xmr:HH9raTkRdN01w2NCmyFsQQne38dpzJCQi6jC3heV0DfY1BvrKurqigD1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedukedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeeggeeukeeghfevudektdevjeehhfekffevueefudeivdelteeltdekheejgfeiveen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedv
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuh
    igsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhope
    hgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehp
    rhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:HH9raSWSSDf3wsU2e8IVoxRcHJSC0DF4dNylnQanLUxMgdCmmiSSRw>
    <xmx:HH9rafouAHV88UOJR4wgVlXQlNFr7gJ7yp2MwRlTVPHW1PKYpJ2edw>
    <xmx:HH9raZVxSEyiIf4nK3rQgBlrWdr2oKrCli7ZPiZDNusD1kOWuzr7qQ>
    <xmx:HH9raXCAGs-O8mBWW4n4X7RcPZqfdqYsrefQ5m3weou28n6NGPtvVA>
    <xmx:HH9raVULPqNB88DXtv6YpGvGd_SbracEI1ddJGHHg9Okqa0L-w-s1hCT>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 07:22:51 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 0/5] rust: sync: Atomic pointer and RCU
Date: Sat, 17 Jan 2026 20:22:38 +0800
Message-ID: <20260117122243.24404-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a respin of my previous RCU pointer patch [1]. RCU protected
pointers maps to a "struct foo __rcu *" on the C side, which although
RCU has its own API, but fundamentally it's a pointer that are operated
atomically, hence using Rust's atomic (pointer) API provides the
necessary atomic + ordering.

Although asynchronous reclaim is not in the current implementation, but
it should be easy to extend.

[1]: https://lore.kernel.org/rust-for-linux/20250421164221.1121805-13-boqun.feng@gmail.com/

Regards,
Boqun

Boqun Feng (5):
  rust: helpers: Generify the definitions of rust_helper_*_{read,set}*
  rust: helpers: Generify the definitions of rust_helper_*_xchg*
  rust: helpers: Generify the definitions of rust_helper_*_cmpxchg*
  rust: sync: atomic: Add Atomic<*mut T> support
  rust: sync: rcu: Add RCU protected pointer

 rust/helpers/atomic_ext.c            | 158 +++++--------
 rust/kernel/sync/atomic.rs           |  12 +-
 rust/kernel/sync/atomic/internal.rs  |  21 +-
 rust/kernel/sync/atomic/predefine.rs |  23 ++
 rust/kernel/sync/rcu.rs              | 326 ++++++++++++++++++++++++++-
 5 files changed, 427 insertions(+), 113 deletions(-)

-- 
2.51.0

