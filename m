Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600F03C3F5B
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 17:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784912507; cv=none; b=Em0bYCg/xTbNjTi1CdbRPcDuUNFrvW2m2ZzkUWpI5uBK+UbSdm4yK1HHwOelDASBpCIu47jQZjG/MAR7cxXeMWpg9RULllhOJXfiRDTzCURDkLSU8VGVL825mG2eti+vzPyArJ3wbIj5gpLsrrJQP5MjuhOsm6MO/mfWX67BnCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784912507; c=relaxed/simple;
	bh=NYj+eTtxAqvadIcZfHt5XhMrogsytK7vyrzUZuzSgC4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:content-type; b=jNogibo0zpweAi9bmrjBbQXn4FQkyrIV7sbpGRtPCF6McxJccxRUrLrxv1A3F/kLIcZzkIwzu4+D0JFnf7r8OtAUxkQaVY2jwOoLZCjhHwgOLZO5HNwno2Dezett/ZOphNy4g4QmQ/5VKkFWociHtb5vXEhdX/eo6YCM3QOm98E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bGWSzqY+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bGWSzqY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784912505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BZktO/gi5TYKbrSSgcg4YA+R7zPX2u1qrVEEQZusSxE=;
	b=bGWSzqY+u+H8e8EbU6aa5lsNWptBLkowJ0fT45lQrTZwgzbaYmcJsE2SWxKV7itgif52Tb
	bQsNOyCib7Cqhs/sKvbXIMFAKXGo7FtHW68kWbG22m1y4NFZ/T/f3xtJAapUSdxJHtN3JI
	VnX56304I/HkQ1McAjAMP6sQOaZ0Z0c=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-576-HVDgtrHTNieVSNbwpi0UMA-1; Fri,
 24 Jul 2026 13:01:39 -0400
X-MC-Unique: HVDgtrHTNieVSNbwpi0UMA-1
X-Mimecast-MFC-AGG-ID: HVDgtrHTNieVSNbwpi0UMA_1784912497
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C5C7D1882804;
	Fri, 24 Jul 2026 17:01:36 +0000 (UTC)
Received: from paumurph-thinkpadp1gen7.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C95A630002E2;
	Fri, 24 Jul 2026 17:01:33 +0000 (UTC)
From: Paul Murphy <murp@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: enable fentry support
Date: Fri, 24 Jul 2026 12:01:26 -0500
Message-ID: <20260724170132.3783816-1-murp@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: GSpCkZqKCmUP2i0lVgLXS4w_fdKCgoo0M3kTi0DmpoI_1784912497
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Turn it on when available if CONFIG_HAVE_FENTRY=y.

Rust support was added in 1.98.0 with support for x86 and s390x targets.

Signed-off-by: Paul Murphy <murp@redhat.com>
---
 Makefile                        | 2 ++
 scripts/generate_rust_target.rs | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index bfb47ad8cb9a..bdfe93702a33 100644
--- a/Makefile
+++ b/Makefile
@@ -1053,10 +1053,12 @@ ifdef CONFIG_HAVE_FENTRY
     CC_FLAGS_FTRACE	+= -mfentry
     CC_FLAGS_USING	+= -DCC_USING_FENTRY
   endif
+  RUSTFLAGS_FTRACE := $(if $(call rustc-min-version,109800),-Zinstrument-mcount=fentry,)
 endif
 export CC_FLAGS_FTRACE
 KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
 KBUILD_AFLAGS	+= $(CC_FLAGS_USING)
+KBUILD_RUSTFLAGS += $(RUSTFLAGS_FTRACE)
 endif
 
 # We trigger additional mismatches with less inlining
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 3bf296581a88..eb80a06d50d3 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -198,6 +198,7 @@ fn main() {
         ts.push("arch", "x86_64");
         if cfg.rustc_version_atleast(1, 98, 0) {
             ts.push("rustc-abi", "softfloat");
+            ts.push("supports-fentry", true);
         } else if cfg.rustc_version_atleast(1, 86, 0) {
             ts.push("rustc-abi", "x86-softfloat");
         }
@@ -240,6 +241,7 @@ fn main() {
         ts.push("arch", "x86");
         if cfg.rustc_version_atleast(1, 98, 0) {
             ts.push("rustc-abi", "softfloat");
+            ts.push("supports-fentry", true);
         } else if cfg.rustc_version_atleast(1, 86, 0) {
             ts.push("rustc-abi", "x86-softfloat");
         }

base-commit: 7059bdf4f04a3e14f4fafb3ac35fdca913e3e21a
-- 
2.55.0

