Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8681FF7C8;
	Fri, 23 Jan 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769174343; cv=none; b=sn5CMd8/sEb36cdNJZk+jbBVoOF/jEumPId95nrLZFv74HKHhjdkYWsqhge8QHajG640ucDONM02/D86BR7ntNMQHWIVikvdhhjqe8t5hX/G4wtEcm5wU27KetEfaab6Z6z9LbKSgvmhB10hV1Lnq1BEql3EIeseWjc+ogIPgvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769174343; c=relaxed/simple;
	bh=dsKzrETj83doPlDW0uwpA69ziOQsUO0yoyK9XIBLuVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m0PH3qVII3lUKCP8fe/v+peI8dDsqFC7wztd1qcbxNMP9ZOyxk24MpDoexi6NWcMfiomcn6q3mElfDb8fY3maLx7Mmg+cEosE55Fl5JqE1jlvus5Vu26JsK/HVpXeCtitj0lNwvKaxv85p/cHC1aE0ZOH3sGmPJP32eGYOJeGUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFfD9Mzj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFfD9Mzj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77582C4CEF1;
	Fri, 23 Jan 2026 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769174342;
	bh=dsKzrETj83doPlDW0uwpA69ziOQsUO0yoyK9XIBLuVA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=pFfD9MzjWOvLuYZuANCQ/BLUdLklIVYIjTOAht2IDnazNvrEQlIgTM/+SZbDgNobQ
	 9VjpCFP8kBAaLnMyXuzfEND3JxfD7gcuglJVKCVSqa6M0p7NQshsi5Y8sIbEtk8H7e
	 J5EJ3tpwMCFmGUhy+mz+oibV/4wTrjLYFaydIwUYwrdQvoPaQh+N0aP8XmQLfTYxCx
	 1kxf8tDojmnrz1AkJtij1NSHihwWv3T/bqT1YQz8IgjxQVEQtLxvL8P9txFHqDGbym
	 7SPM0JecmHjYlc2ISNo3S6O3ns6nz7pJ7RWmOL7MyZrQiMGjDijjjujqWYcpv9E7DU
	 evi5j5mTZKJOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD4AD74EC8;
	Fri, 23 Jan 2026 13:19:02 +0000 (UTC)
From: SeungJong Ha via B4 Relay <devnull+engineer.jjhama.gmail.com@kernel.org>
Date: Fri, 23 Jan 2026 13:18:44 +0000
Subject: [PATCH v2] scripts: generate_rust_analyzer: fix resolution of
 #[pin_data] macros
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-fix-pin-init-crate-dependecies-v2-1-bb1c2500e54c@gmail.com>
X-B4-Tracking: v=1; b=H4sIADN1c2kC/42NQQ6CQAxFr0K6tgaGEcWV9zAsainQRAYyQ4iGc
 HerJzB/9X7y398gSVRJcM02iLJq0ikYuEMGPFDoBbU1Bpe7Ki9ciZ2+cNaAGnRBjrQItjJLaIX
 Ng4/aE3vnz+QvYJI5ii1+B/fGeNC0TPH9+1uLb/u3ei3QwhV3UhOVJ3frR9LnkacRmn3fP64d9
 FjMAAAA
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jesung Yang <y.j3ms.n@gmail.com>, SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769174341; l=1902;
 i=engineer.jjhama@gmail.com; s=20260103; h=from:subject:message-id;
 bh=c7P9j4yaUBkVPSuFKvUbKfXZDCnr6ZWiWGUJURpt+5A=;
 b=iooMwfpk6BvhAz77cbYZxulg/1QPZPrvPxRDPgdolo3ZaYnWEN4irWRH6N1xKv7nanDuDhphy
 tXEShaG5pkKBI5EIeAfT99Gw3MpmP29W8ArojELHDr9ZRgUBjQO6CmD
X-Developer-Key: i=engineer.jjhama@gmail.com; a=ed25519;
 pk=G5nmjm+RTiWBpyCvc5xjR1b3li/2zipLSMyz+T4fj5E=
X-Endpoint-Received: by B4 Relay for engineer.jjhama@gmail.com/20260103
 with auth_id=590
X-Original-From: SeungJong Ha <engineer.jjhama@gmail.com>
Reply-To: engineer.jjhama@gmail.com

From: SeungJong Ha <engineer.jjhama@gmail.com>

Currently, rust-analyzer fails to properly resolve structs annotated with
`#[pin_data]`. This prevents IDE features like "Go to Definition" from
working correctly for those structs.

Add the missing configuration to `generate_rust_analyzer.py` to ensure
the `pin-init` crate macros are handled correctly.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
I encountered an issue where rust-analyzer fails to analyze
structs decorated with the #[pin_data] attribute while testing
Rust kernel modules.

It appears that the dependencies for pin-init and drivers were
missing from the analyzer's configuration. This patch adds
those missing dependencies.

I have verified that my rust-analyzer correctly processes
\#[pin_data] structs after applying this fix.

Best regards, SeungJong
---
Changes in v2:
- Fix typos
- Drop the quote module workaround (will be handled separately)
- Rebase onto `rust-fixes`
- Add `pin_init` dependency for Rust drivers
- Link to v1: https://lore.kernel.org/r/20260123-fix-pin-init-crate-dependecies-v1-1-1c6cfe9aa352@gmail.com
---
 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 3b645da90092..766c2d91cd81 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -214,7 +214,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
             append_crate(
                 name,
                 path,
-                ["core", "kernel"],
+                ["core", "kernel", "pin_init"],
                 cfg=cfg,
             )
 

---
base-commit: 6d7fef23043553336259211346b6b135d6c1f4c3
change-id: 20260123-fix-pin-init-crate-dependecies-b94ac4247a48

Best regards,
-- 
SeungJong Ha <engineer.jjhama@gmail.com>


