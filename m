Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE50322A1F;
	Thu, 16 Apr 2026 17:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776359937; cv=none; b=BlCoYvLwlkesyCm5AgGmgyPzCEuqG8VoyKnYM03O3I0OGR8vQaN3XePZlHrYm0dNaraUTOa8iMbH093Ra6qHkZgAePfCZ2RlhOfcW1GQ4TIbZOmjLxp9wnZlU7dvlKk00Tmc2LCj9916kXhe2usxaElsEnpEe0YllC8vUavBYwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776359937; c=relaxed/simple;
	bh=/iZASqoy6UEm+k2cFHq8bYAOjambQ+9XxIJNZ/qIywA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BeuIxI3W2JMrPJMRx+zGsXr9FPVpE9YdhV+EAMD4gnyIprk4kwIQLg6NKdWOXpI4iRcikUWgRUqVEiU1j9Tluj2AqeHfZH0jB7ZJBK5L0VTVNR6VSii+3rL/Zohq4hTjSNvPdF2vhCRwWrV3VIQUNcB4YV9QtsAHa8zIDTa6UGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=vAMM70gC; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="vAMM70gC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1776359933; x=1776619133;
	bh=ZlV3uOyvSUBIo/AvhkZNKVYS6qwS9w3cABtHVctN/Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=vAMM70gClZUqppkJUxzVZPWpx+LpMlAXux9LbhisJ+f/OrzMUOjFjjZzMdM8cE1MP
	 o7YZazitqBOjLDs2qah7H0ez9lv7Co2YoAFpyzpOpO43GXqebrkjLzo2lQUvh5PdI5
	 STPAsuKabCauQDppXbQlNnLlVcPL6V2wNPuIrCip66aBM9BxfCyN8vWOHCF3cNOmHs
	 RSyVA2nZPsxtDCxlfs4pBUt7ujLv/B3wCE0IG8rcEDaP1uVokA+MpD7WpWwq6gzpYE
	 LWBuXlDXFzwdc75pjrCLSRlXkyPeq52Rlc26fSxHW2DM6mca70hVgf4rU5eHCEcOkn
	 0fzytqpdp+7xA==
X-Pm-Submission-Id: 4fxPqv0tJRz1DDns
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	rostedt@goodmis.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 2/4] MAINTAINERS: add Rust SRCU files to SRCU entry
Date: Thu, 16 Apr 2026 20:18:38 +0300
Message-ID: <20260416171838.206128-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260416171838.206128-1-work@onurozkan.dev>
References: <20260416171838.206128-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the Rust SRCU helper and abstraction files to the SRCU
entry and add Onur Özkan as a maintainer for the Rust SRCU
pieces.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 353f221c12e1..f38ef80c5e69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24403,6 +24403,7 @@ F:	drivers/net/can/slcan/
 
 SLEEPABLE READ-COPY UPDATE (SRCU)
 M:	Lai Jiangshan <jiangshanlai@gmail.com>
+M:	Onur Özkan <work@onurozkan.dev> (RUST)
 M:	"Paul E. McKenney" <paulmck@kernel.org>
 M:	Josh Triplett <josh@joshtriplett.org>
 R:	Steven Rostedt <rostedt@goodmis.org>
@@ -24413,6 +24414,8 @@ W:	http://www.rdrop.com/users/paulmck/RCU/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/dev
 F:	include/linux/srcu*.h
 F:	kernel/rcu/srcu*.c
+F:	rust/helpers/srcu.c
+F:	rust/kernel/sync/srcu.rs
 
 SMACK SECURITY MODULE
 M:	Casey Schaufler <casey@schaufler-ca.com>
-- 
2.51.2

