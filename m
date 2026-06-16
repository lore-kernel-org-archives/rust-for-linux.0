Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27957364E88;
	Tue, 16 Jun 2026 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781609514; cv=none; b=L93v7fFncXAirG7ilQZAdVbvJsTpkbTH3rgVyJW8/SnMqZUFqK2ZgvSWXKVIH2b1vleMKnCxblkMmt4p0xjzs2eS2rJ0hYOZQtYVU1hnJTbXOA1w2lxsZ4vQiedDIdwHum9MMlGvgAKQrgZcIkLvLJRQ+x99LV944Y5tBiWEkAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781609514; c=relaxed/simple;
	bh=cfqfMTnSfDovE7lkutllnYG1AkU8ziVCoR4YiwOc/y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Fp7p8WkI+5SZOYuyoBYEQgQ5Pp4yW15AWutsfr2SCVVHJ/cZ+LXXY9N1GNE2UBYWzWensrVCbOjP9KKfBzteb72GGfPOXc92KCmKwsMmWGRhbp45lfLAn8WutzLr6CWJi2H60pw+u8SmlheMtqSxQO593Mr+RwSHCIPia2MpZDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a3132cb-97ff-7f0000032729-7f000001e158-1
	for <multiple-recipients>; Tue, 16 Jun 2026 13:26:03 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 16 Jun 2026 13:26:03 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Date: Tue, 16 Jun 2026 13:25:55 +0200
Subject: [PATCH] rust: kbuild: Replace and dissolve procmacro-extension
 variable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-rust-kbuild-replace-procmacro-extension-v1-1-cad72998faee@fritz.com>
X-B4-Tracking: v=1; b=H4sIAMMyMWoC/y2OQQ6CMBBFr0Jm7RhaEZWrGBZlGLUqFKctISHc3
 SIuX/Ly/p/Bs1j2UGUzCI/WW9cnULsM6GH6O6NtE4POdZmXSqFEH/DVRPtuUXh4G2IcxFFnSBz
 yFLhfG6g1FceL0cXhrCHVBuGbnX5L13pjH5snU1jzf0P4E9OFsGnQGM9IrutsqLLxtFdQL8sXp
 b8mCbMAAAA=
X-Change-ID: 20260611-rust-kbuild-replace-procmacro-extension-22c459a24382
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>, Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=cfqfMTnSfDovE7lkutllnYG1AkU8ziVCoR4YiwOc/y4=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqMTLLqkOB0pXFx/3wejYD3k+IdFfiNqupXFpQ7
 nVz+xVQ0h+JAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCajEyywAKCRCIxryciJpt
 uC/2D/4zi+kmcu2z/pQ/01oU46TmsLW+Ujgy+l5N5P+icKkPZsMS9YRO2iRprXmtI0bj8AtGExM
 YHOrlg7WRGftxBp7JrBTMuEcC81WJOwVXKLTYikLfm5eavZuL+yD1Zc6FuE6jW27tAmr5cj/Uct
 3UrqzwI4vjuEPUEDYUG0dHzS6gPjlWrk91QCU9st39IwdUavJKbBcg2AHTRYiR4UtC5dWhOkbvH
 zlMJOnFaYANBpM9GdWRtzMApFJM/MrZT7sYO/Oxs6n1Y99mtSn9XlnDEEVCht9I5am8wmX8Y1Gd
 9JfzZrSurFw1U3Ysg7Mec1nW2IgSbG1KVkT2iwYWmICNYFn7MzBezwzH7cUhZPEmsExtUjd3U/C
 4ZT50XN/pW7xTP+Erb3LbgiU5M+325HUuO7MK9cudEdWYK32MUNH19GgLPSW634MB1+GD6a2IF8
 5fPhQXTIeEQrZrWkOENTDabJI6e398RYs/nfo7Wiz+nOjx5fR+j+iH1xq3e5LPHf7hJN54t5wZ9
 kcuq8JrSbtpLf2MkRToMJ4NlKWVJQGzAsNmQt/LVeitFaOLbW8sI649V/mtJMkdNwCwjAcJCImK
 IMB8W3BcrpY+J+2FfGLKJhsIwapGPVk65EekkbFrtqfPZehd6VbLKHZNhtD8bRtkT427gfK+inf
 yN7uqVo0CW0tcUQ==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1781609163-474E5AE2-01778F5D/0/0
X-purgate-type: clean
X-purgate-size: 2295
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

Use make's $(suffix) function [1] and substitution reference [2] instead
of $(patsubst) to extract crate names for rust procmacro targets.  As
there is only one user of the procmacro-extension variable, do the crate
name extraction in-place and remove procmacro-extension.

The procmacro-extension variable is used to record the binary file
suffix of dynamically loadable rust libraries -- which is 'so' on Linux
and others and 'dylib' in MacOS -- to remove that very suffix from a
target file name for reconstructing the corresponding crate name in
cmd_rustc_procmacro.  Extracting the crate name from the target name
in-place is shorter and reduces complexity.

Link: https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html # [1]
Link: https://www.gnu.org/software/make/manual/html_node/Substitution-Refs.html # [2]
Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---
Link: https://lore.kernel.org/linux-kbuild/CANiq72nmPPF=6AUp5mcDJVni80ORQr0AQ-4uCZaE+CzB5kV=eg@mail.gmail.com/
---
 rust/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 63b1e355321d..30f882ba7620 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -50,7 +50,6 @@ endif
 ifdef CONFIG_RUST
 
 procmacro-name = $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name $(1) --crate-type proc-macro - </dev/null)
-procmacro-extension := $(patsubst libname.%,%,$(call procmacro-name,name))
 
 libzerocopy_derive_name := $(call procmacro-name,zerocopy_derive)
 libmacros_name := $(call procmacro-name,macros)
@@ -598,7 +597,7 @@ quiet_cmd_rustc_procmacro = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET))
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro -L$(objtree)/$(obj) \
-		--crate-name $(patsubst lib%.$(procmacro-extension),%,$(notdir $@)) \
+		--crate-name $(basename $(@F:lib%=%)) \
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.

---
base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
change-id: 20260611-rust-kbuild-replace-procmacro-extension-22c459a24382

Best regards,
--  
Nicolas Schier

