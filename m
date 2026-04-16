Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704A632D438;
	Thu, 16 Apr 2026 17:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776361414; cv=none; b=GaKP8rCEQXYe8RjVwYn7r6UMTaYee1h8UBRiT9QFW/ZNiuSEG22S5s6aPstt5tTiQDfkQ844F9ko8oIUKik9EmaAKvA8k6er+huVboQyIPKPtmdrIOl8RnEXlRnjpV2NOzVsq6cJuCM4U3bY9jCBIAw2kzDV7sMZxy8uan/m0CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776361414; c=relaxed/simple;
	bh=/iZASqoy6UEm+k2cFHq8bYAOjambQ+9XxIJNZ/qIywA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PIf+FcaagMXEbxs127CUSqNy+7jPhNX5lTE90swl3V0RcQoDYlO5CyHY5HPZFDk7kdR/7IKFFymUekmfVBXkI/YHIItiKy8ab6XTkbn/rIOHazfTlb30lhKieXsPjGkA72RBL7TIy3SRQPuEf857eKQbXfZLeVGTWDVCBBBNC/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=uCO1XPNb; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="uCO1XPNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1776361408; x=1776620608;
	bh=ZlV3uOyvSUBIo/AvhkZNKVYS6qwS9w3cABtHVctN/Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=uCO1XPNbcDwSQTCn7AtMDcnYRqGtETCmvTkucGiVLQ2kTaFIc/9MesbGtXsZuY6PI
	 JN/NUVqiMZVvFHvwSBK4bJxW2dfTBO9xj8Ga5TrYidsUU7hpOc5fMejj/VULPldS5c
	 uBhBwk8azs2tIJKdhjEoi9pHitlqNVmGVSKNotMAuoFDGdD8VZRd6nVhsFYP1t19PA
	 QiylW48ysVW990IadETEdGutdUk+3GGQXUdgcyPvnGoi6gxSb8sXwOuCEmEkgDrG8Z
	 vAcIBFgZ2ccwLlfUpdDLbN6TRDrdhHO/mqtjtja+x1ZXgDEzZhn149kMokvE4Y0dGr
	 XraJfbvilYSgQ==
X-Pm-Submission-Id: 4fxQNF41gzz2ScCq
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
Subject: [PATCH v2 RESEND 2/4] MAINTAINERS: add Rust SRCU files to SRCU entry
Date: Thu, 16 Apr 2026 20:43:08 +0300
Message-ID: <20260416174308.221235-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260416174308.221235-1-work@onurozkan.dev>
References: <20260416171728.205141-1-work@onurozkan.dev>
 <20260416174308.221235-1-work@onurozkan.dev>
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

