Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A6D37E2E4
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529856; cv=none; b=I5YikANseT5RH+qsGSeaRLNhOhE1DkP+uWQTNMCtnwaW84f83iuEpdO/N63v4BZ6CGP9o67b2b4fBtjWItsHbOFdR5Vw6a5UbynpVY/eJVckydx8PFaniYgBwV43VrEmZ41UY5PLvn3/evoahjDMZaJccAub7elZw1OKPL8J82o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529856; c=relaxed/simple;
	bh=FgYJuF5UfyUoA8c8MpgDHb5r92lhVu0ntxZrOdq6QEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzjeSGQheBBod+dDaJmsBrBe8oAam7qsNHfsdWfybuEsTgvNDutaY5eaze7p1szLdsURXj0f5F3l9S0QRAmbTyktiW/viE5QrNg5PvuVNtgEvCgyBa1iUl/4ip9E8eYc3VWOdEqPqUicjNTc0PZ5i6KJX5JpuuksWlO5khPPGx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaQ1EgoO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaQ1EgoO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0E31F00ADF;
	Fri, 31 Jul 2026 20:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529851;
	bh=uhAZ4b5JiVFMWBV6D1eFcbA6MpCp1fwtNKBgvlUsvfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SaQ1EgoO6FQhYP552B3rYgJv+HT2nutzKj5j5OsX2A+fDgScuRF7VnoxK4UdTltmV
	 ZmdLZottVvy7sbDpi5WEPKVAh5/wZ5By/H2eF1vum6jX1o4jozWAjQf7yrXx6a1IQN
	 UqG0jrWz7v63o+f4yY7WhZ5bEaa9olsuz5HaETssCTRrTK9f5Rsg7GF3iOBR3xzQiR
	 ulV3S4dq0nHbUwCmjKMvgWHyeQfyPJkOqiOblsPQC9bHc7Pz1vITXnMDWrkDkF0aSB
	 qGkraG5H9gBDxbAS+vxGVkBQ3jPgHSy3mnxl2aZpTHnGxG6LtTb6MnEK3gLQhrtj8g
	 WpF3SNUCAe3+g==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id DD43CF40077;
	Fri, 31 Jul 2026 16:30:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 31 Jul 2026 16:30:49 -0400
X-ME-Sender: <xms:-QVtamfy6avwBArmhwjEhplPmqpFqZpsd7fK8_tHaz89V8WlqIX7Lg>
    <xme:-QVtaqnUjbJtJD8Mx1yWZyB3B7mQ2De9Bs7UboxRqYbpicnjcVCdG03_0yLOEaasM
    uJdKxWoALrUZDR56XU56kYUW0MUPgWYbqLIQZcoP8vgMk9FA7-JSnk>
X-ME-Received: <xmr:-QVtatoBBron4xIvsSyXF5tesAz6ND9c-zReyuXlRK6wzXh61T_vk3qzMCLWQf_t9JQvuOUC9mPaVdTqHmYuVxbEkgMj4ep4>
X-ME-Proxy-Cause: dmFkZTFdRdBIF8ZH/aPs2g1lRw7GATpB3kPZdHQ9SRq3TCfYELIaqSZraFLrXlLQvfZ+Zw
    L2FnPfSJd952oWr+y28mIfAsYcvh2g32U0J8iwTV49f0k9Q8hXOe/2BgVhInUEnjhmC2lX
    03vYTAlN0bq9NjF03uLbRgPGL4766SVn/XbgM9h+YDdXpmZY+TYoTPsYcygLFMbtetKCiX
    MKKxau189OoX/tBJGac9kkLntk5lYAb6ORV5iOKO0UE2KpFdBfn5cZVhjAZINCJF+DQAjd
    IJX9TqJvKbTOKjLKBWundtWMSfFqKbkgkDYizysOgKGZkbbhOs1gMmPcuy0Gf54a13j8O7
    Pk0CaWNF4G2R5ZoK4bk8SME6AmzzoXAliTUBn962QTJljkRfeH42W/7Y8fccbcnR66n6HF
    y8A5vD9zerb9AXB/Q929RxYZHvVVSM2335g+gQCj665Cv/WLYIg6MsWj6qtRLeZjifW+Pv
    wfdFbJOXH2qYz1tJuFJm5RAmacbjKM1Xrf1fFSvkf+I5NoGuRSQc8mXDo7W9Xjw2bvUhOG
    2wlo9TX659fnzPoabF4MfwGUGNskrgd8FVpxQK194AoCtKBnFLkeiyGpWbwSuC3x/kTF1Z
    4pWS7Rvf6NiFH7OlcMvbzcIYfucI8mpyG+kYMRZT1zkTt9iMa+WhDsXoyURQ
X-ME-Proxy: <xmx:-QVtavHJl3bFMcDay6j1ZjNVCz8tp3jZVlcEJAbZQYlnUrbDT7gktA>
    <xmx:-QVtarSGZppvfIiSx16tFA52st-6PYgubdx_JKVbfCR6c0wteu1j5A>
    <xmx:-QVtatOFR1QA0kPj51YL3Mjo_mjeOmGDy5WYDqycKvDykdX9OWKWrQ>
    <xmx:-QVtagn9Ft4uEovaGlhff2mTD8V8QNgmkVBFZYguumyDKDotOMH-tg>
    <xmx:-QVtanai_Z9ga6xCVbKW3CzYLQZmwCd0castR3GtGab3cWFcQU1UBWBv>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:49 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 07/24] locking: Switch to _irq_{disable,enable}() variants in cleanup guards
Date: Fri, 31 Jul 2026 13:30:08 -0700
Message-ID: <20260731203031.13679-8-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203031.13679-1-boqun@kernel.org>
References: <20260731203031.13679-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Boqun Feng <boqun.feng@gmail.com>

The semantics of various irq disabling guards match what
*_irq_{disable,enable}() provide, i.e. the interrupt disabling is
properly nested, therefore it's OK to switch to use
*_irq_{disable,enable}() primitives.

Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260121223933.1568682-17-lyude@redhat.com
---
 include/linux/spinlock.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index 3d405cc4c121..a9d169dad6d4 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -572,12 +572,12 @@ DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_nested, __acquires(_T), __releases(*(raw
 #define class_raw_spinlock_nested_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_nested, _T)
 
 DEFINE_LOCK_GUARD_1(raw_spinlock_irq, raw_spinlock_t,
-		    raw_spin_lock_irq(_T->lock),
-		    raw_spin_unlock_irq(_T->lock))
+		    raw_spin_lock_irq_disable(_T->lock),
+		    raw_spin_unlock_irq_enable(_T->lock))
 DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_irq, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
 #define class_raw_spinlock_irq_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_irq, _T)
 
-DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq(_T->lock))
+DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq_disable(_T->lock))
 DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_irq_try, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
 #define class_raw_spinlock_irq_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_irq_try, _T)
 
@@ -618,13 +618,13 @@ DECLARE_LOCK_GUARD_1_ATTRS(spinlock_try, __acquires(_T), __releases(*(spinlock_t
 #define class_spinlock_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_try, _T)
 
 DEFINE_LOCK_GUARD_1(spinlock_irq, spinlock_t,
-		    spin_lock_irq(_T->lock),
-		    spin_unlock_irq(_T->lock))
+		    spin_lock_irq_disable(_T->lock),
+		    spin_unlock_irq_enable(_T->lock))
 DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irq, __acquires(_T), __releases(*(spinlock_t **)_T))
 #define class_spinlock_irq_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irq, _T)
 
 DEFINE_LOCK_GUARD_1_COND(spinlock_irq, _try,
-			 spin_trylock_irq(_T->lock))
+			 spin_trylock_irq_disable(_T->lock))
 DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irq_try, __acquires(_T), __releases(*(spinlock_t **)_T))
 #define class_spinlock_irq_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irq_try, _T)
 
-- 
2.50.1 (Apple Git-155)

