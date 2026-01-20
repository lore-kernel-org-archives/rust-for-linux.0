Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982B843D51E
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917921; cv=none; b=a7L1Fg0s/6J2A2RRatG7yP1kieSDTJ0RSjOXECxWdWVDGww8oIS931wKg9pluFeSpNUe6bqqxmOFZ8lbu1AHQkAwlsvHiiG143JgNUO8uUadoV1Aca7+6miQs/IlauLsEb481FJ6Qmq+k/VZbrcj7TyKE0acxK18PlNXl4zbjnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917921; c=relaxed/simple;
	bh=YYayMGV6ngRY7nmSsJrP2TzrNdW5dR5oIdqIjfBi5QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EWWV2FevmcUZFeHNFTOF0BYFvUx3dtX8HdOp5GeOlf9A93Ycf6TunSlqaC+KXdhfrGnmR7IvTllbBKUyy+5n0jos4jrCEahE1Cof962vgdi+oK0Um0SO9+Yh97YqAtWLI58j8m6kwOtCfl/GxQBZFOMw807uU42VMVF25T9m6vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNQovWsf; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNQovWsf"
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-8907fb0188fso55682606d6.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 06:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768917918; x=1769522718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ndl0X5WSxnCKWziNf/kLjxjZJLIqLpW4gsz4OqMKe04=;
        b=BNQovWsfeXA+HXOfpFAxQO6BLNf/v7Nbo5XRgXSf6RGHWSS4ElCdaPscrhAPyou1Dl
         Gg1xhxxpwfwxm3ttBdoyKV7G5UJ36CpCypZlhV7fh1Lcvh+79/QAU5ywdu7IsmZ3BwKe
         KPITOKn9dcsxkdrcpeJiYKg42iGzBuPsbuEzfHVTrIochu2KPtaV8P5Ta+BEV+AnBgUF
         /Bvsy9R93rf0K4DqBOTiWH7pb90uZgI0OfgeJiuahUHaFevL5hymEKXGx0C8kmrT7M3z
         n2HXpa4+y+Q+DBa/7Cd1Nnnom4DDi8JaKAGOT1WdbdOKDv3tA1JFijQOd2F3u4uqawfS
         oL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768917918; x=1769522718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ndl0X5WSxnCKWziNf/kLjxjZJLIqLpW4gsz4OqMKe04=;
        b=kBE49qliACZvyOeEAwY+oUVRg9YU7h7Gd/jr6xU4c2f3GQILpeZ58BuiEJyEKMVlP+
         rkge97M87rxm6VRAvEmlxw+4efMc9PT8RvZhQpswQ9Gr5licOp5LGC2UGR8GvtC9ibHe
         8/mS1cfO498M4EIYOARpKxu4ESd5N/EOZmBppgVr5HKAM0QaxHZboHxtTrfuUJJk9tRp
         92nj1vCGft4hMe/m6pcDv5ZxtQ8HIwXJjMQ7LLTzF2Dz8atq5+mZfCk900FLM1YIsbUq
         /Xm8E3Cv8nd4Y4F6J4SDu5a5Xw6xcmy3SU6E+QV+5fKiX6oYCOKZ7gkIkGv2JGuPOCJ7
         VQkQ==
X-Gm-Message-State: AOJu0Yx88ZeXmyD/ctrcmf9xLgohLNmM0Dzcd13jfT2SHcwt7ZN5EBd3
	y/VHVPNYWvA4RwjEymIzArPL3gIWbd7DzhK2SlLszYMFci/VxjFicU+8
X-Gm-Gg: AZuq6aJ6TCQZ/v07CHHneQ6grIs31O0fWM7478noIJo9+yYU6FJ5cr/dViqscTKioRr
	v9p1pYmH1IidpZz2S79tpeVaC3S/fS6n9rhOE9roliyCLLqqztanZBJY6NG4E58+e95B0truGZ7
	cBHsvHMIuwFQQc5RK6fKyM1Y1gpyaTtSlM2MVh+OZIGgn+l3jjpHnHGKfQ7VA3EnGSxBVzEj7dX
	8XvMxwx/DWyx/99I3GkqTUfSZVe3XpEaLWOTOMdIqdcA3Pi9YNjBTu51VoLyAPx5yPkJBQrEQJs
	KVLOwLAm8TfhB84woBtEIcVvNn514cRKCH/m752Ao16CMINaNbSw6uzLHMYny1LnHGtjL/RIxKu
	YE96tWMAZM/dAGSj58220pdTQE4uKqukH1w+BcuGFxPg3hgbdV1hfflXOcbb2ctyuSD1C/2PBlg
	NCAHjuoZX7S0rhTD7nLwYYpXHBvSNuCI5mBF+HZQK+RkuPO+usJAww/BdOUfz8QXSHpWI1XIp1A
	suHCUDut/G8lUM=
X-Received: by 2002:a05:6214:5009:b0:879:d0eb:fe95 with SMTP id 6a1803df08f44-8942e421a04mr188044366d6.11.1768917916142;
        Tue, 20 Jan 2026 06:05:16 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e5e45a7sm109499356d6.1.2026.01.20.06.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:05:15 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 519B7F40068;
	Tue, 20 Jan 2026 09:05:14 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 20 Jan 2026 09:05:14 -0500
X-ME-Sender: <xms:motvaQzVICAww-oRCZoxVPm3iA58WW75ffbAuD3VGZ-JeNrA3KPcgA>
    <xme:motvacoWuGYUsItD2OfYg1vxbq97rmJd1GfhzTjz3f7dylWWy6A-NgQs2E4HEeaeJ
    2kBNq3Mco9zWjhV79cVCNIHMMTQBTTXSS4jUCoOAluCqXGtgf3_XE0>
X-ME-Received: <xmr:motvaUiI13lDsGCj2zVEJA7AUXebB_vyVN4JLyX1vbrn27zoukhi6-gM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedtiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeeggeeukeeghfevudektdevjeehhfekffevueefudeivdelteeltdekheejgfeiveen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedv
    jedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuh
    igsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhope
    hgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehp
    rhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:motvaWXo84i66k7k7re2ABUJLMs92aVAV6KLWpTYIgCv3EdhsF9PIQ>
    <xmx:motvaUEako88WxNGtqMi3dyxsy2VeKv-NLP6CFlGYuNJ6C8Ql1YJBg>
    <xmx:motvae_yxjoVrhwrKv-I9W0VhQC5swLt1G-04a5u2jo9DVCy2txsZA>
    <xmx:motvac3TPZ9UCBaSbJT_Md0VGHmPlgSkwyzLEKzdC2JdcNfwNUd-7g>
    <xmx:motvaemzkBjRSvvUqNg4nrP8Go_bXL5NmU3eGAoG54W8uEA4oBCl-9KS>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 09:05:13 -0500 (EST)
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
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH v2 0/2] rust: sync: Atomic pointer
Date: Tue, 20 Jan 2026 22:05:01 +0800
Message-ID: <20260120140503.62804-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've already queued the first 3 patches in v1, but comments on them are
welcome as well. The RCU pointer patch is not included in this v2 since
there is not much update and I'm still hoping to get some reviews on
that for another respin.

Changes since v1:

* Add a clarification patch of CONFIG_ARCH_SUPPORTS_ATOMIC_RMW as
  suggested by Dirk and Benno.

* Add support for Atomic<*const T>.

v1: https://lore.kernel.org/rust-for-linux/20260117122243.24404-1-boqun.feng@gmail.com/

Regards,
Boqun


Boqun Feng (2):
  rust: sync: atomic: Clarify the need of
    CONFIG_ARCH_SUPPORTS_ATOMIC_RMW
  rust: sync: atomic: Add Atomic<*{mut,const} T> support

 rust/helpers/atomic_ext.c            |  3 ++
 rust/kernel/sync/atomic.rs           | 12 +++++++-
 rust/kernel/sync/atomic/internal.rs  | 37 ++++++++++++++--------
 rust/kernel/sync/atomic/predefine.rs | 46 ++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+), 13 deletions(-)

-- 
2.51.0

