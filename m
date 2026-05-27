Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1E737C113
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 17:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779903703; cv=none; b=CMCe/FaVXx82nZHeNMdFIiUl2EEXxAvQZ1yGcxjrnzN5mKu3U61DD9t6jCTAUWVd5tXBsqNH2TJhegc2Im0H14ck8KW9Tl9LZZ4vIRzf25s2osE0fbmKriss4e8+TQros82g4heMqSJy5jQBTHmC+0j2fEI3faQKy9zCBtpcaBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779903703; c=relaxed/simple;
	bh=OXKg7IoJRXxJABbEWtm/U0WbRH/zsPKFQvYu+ZBgzKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQCLoGOmcziaVLoUX1TnL4L/TXtnBe4JS5kfsgVtji+INLqhy2trSZ7nBorSPdsz097AvMrzUwk4bE9deIj3YEIxaoPUay8DHE9hVuGB3UidqgJkBZ8ocKKMED1psJVy+I2bCQPaqDG87BHLUWgr7bUj28rhIo5pYnXb2AODYMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=JgD9QnH+; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="JgD9QnH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1779903696; x=1780162896;
	bh=/JxKK4le+0Qf2c0FvyVzReRLUsasiZAYNwA0SE2Vp0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JgD9QnH+7VD1y4WizJTPjezZz86u6jfiZcdT4wGPgjbeEF1BPEkuaNawRAWIbrQ2z
	 uVwuXLZ+fFa0tUBcTiS5BlundMfkh6VowvIlUjZL0BpDrlEgIhmfNX8SjUn62eZcHi
	 zP0YLvwIpnSO/5pQPAT1LcdAlxHNhWINyEQIznUrbHvMF/vzUm6jdqYhptSEVCeqJd
	 DHS6XqRmehYmVhsatSySZU4/MCbYAFTKRWkx9Ueq9OPos9CyZhoSHi9V0SCuPyh3z5
	 HSuQYmNeGLw+pW6RyFJICqPLTJ7Td6yqKVMVYQerSVEN5VkUooXTdwfnQ9bC6xlyo4
	 7K1GEMBPqgzZg==
X-Pm-Submission-Id: 4gQcP91Q70z1DF70
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rcu@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	fujita.tomonori@gmail.com,
	tamird@kernel.org,
	jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v5 4/4] MAINTAINERS: add Rust SRCU files to SRCU entry
Date: Wed, 27 May 2026 20:40:45 +0300
Message-ID: <20260527174120.510447-5-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260527174120.510447-1-work@onurozkan.dev>
References: <20260527174120.510447-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Include Rust side implementation files to the SRCU maintainer
entry.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0b307b2108c..7739a435f258 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24624,6 +24624,7 @@ SLEEPABLE READ-COPY UPDATE (SRCU)
 M:	Lai Jiangshan <jiangshanlai@gmail.com>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
 M:	Josh Triplett <josh@joshtriplett.org>
+M:	Onur Özkan <work@onurozkan.dev> (RUST)
 R:	Steven Rostedt <rostedt@goodmis.org>
 R:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
 L:	rcu@vger.kernel.org
@@ -24632,6 +24633,8 @@ W:	http://www.rdrop.com/users/paulmck/RCU/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/dev
 F:	include/linux/srcu*.h
 F:	kernel/rcu/srcu*.c
+F:	rust/helpers/srcu.c
+F:	rust/kernel/sync/srcu.rs
 
 SMACK SECURITY MODULE
 M:	Casey Schaufler <casey@schaufler-ca.com>
-- 
2.51.2

