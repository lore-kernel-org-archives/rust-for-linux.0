Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8263DCD81;
	Fri, 29 May 2026 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055112; cv=none; b=I9katHnPYnhB/3k4U8HGHdDeCRDsdWXKoo6wMaA9PeIqhaijdn8SY/pVoxJtQkyJ5VLpQn4Ct7i+iZvfkeQ110VKKAxDXgUrgBTwb2Hvb6uqJkBhjuPTa8bh/xLp0BaWBVknE33csYaKNOsmjrahqvJ+3x7PVwJ5b5trQAIR32I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055112; c=relaxed/simple;
	bh=iNIea3X1u5UlLSCKpcd9EjyAvSlc5TEnDXzmsvHUUBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nWJz5OzximLZZzHi9xXjk9M9YSmeWsfkNL8vN8SeKRy3exkj/92ZK7u8LZdK9jrSR5VSnhi86T7+mdHdUOLwdBZQfA/oByrD4bTUL5BqdPvwf4dPwTKJsLO+FdmUQ6o+BbV+/aTVViicTt9VV3T5oBY5hJ/gQOWbp3PIOn8628g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=sZ/L03Rj; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="sZ/L03Rj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1780055106; x=1780314306;
	bh=JkD+A35aA68GLUHdDWX6WjTBKf+CG0Z+zqkNuKRO2O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=sZ/L03RjvjSuLyveXTi4CPx0U2OlozEyvMKG2Z+rv2/6qsu9RcqxSDJU1tRAl1C0u
	 AQc1Cxe1zE37lbVVr973jByHMO92Q8kdvYn3T3pVY4xYI1pLSMk2IsgpK0OWXN1gKH
	 tXwJOdTDgR4UNv6K7rdvM2jXu+/hr6iP10KWRVGcG2EELg4ShQxbp05INMJFopDCaB
	 tUCQ4+8sfPRV/geL59rCvr1zEYzOXTIJdkZo8NqJKrC26m1YTD5RiHEUIVyFsU956b
	 Q6CIcvxJcwZp0bLWRS+Tz7tTaHTZ0CxlgZUsffRPi2uzWqGt/DhbFOPH/thx9hm4lp
	 +jLi7xKiab3QA==
X-Pm-Submission-Id: 4gRhNt6tsYz1DF70
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
Subject: [PATCH v8 4/4] MAINTAINERS: add Rust SRCU files to SRCU entry
Date: Fri, 29 May 2026 14:43:53 +0300
Message-ID: <20260529114449.112066-5-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260529114449.112066-1-work@onurozkan.dev>
References: <20260529114449.112066-1-work@onurozkan.dev>
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

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
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

