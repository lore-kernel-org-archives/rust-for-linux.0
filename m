Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C816413A258
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 20:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791576643; cv=none; b=TffgRs0elylkpQp0AUoRxGfpUAqHJa3/Q3nTssHVVqiBVQ9i5Dg9Kyi+uYmWE6q8N9TxyvqQjH82hlo8snbJutA7BFO8f63ScE/wDVXFhssnlwahSDgKD86rWpjeolNg0wcFolOLutEEcVcW4eLo5SHiWYB8jwlkWrXe+cxPwXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791576643; c=relaxed/simple;
	bh=6uwUDgUGBBegNNw8gBHz6CI975iD/iZ8aoY/QjONSyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WEaBYhhjOfbMB+yDNd1dd/lWTik7LtV3yl3I5Hix613yGTLfK7wF/hkr143zWd5W39SKf+93sd+17322tvh7mu6yrP27maHHoF++ogMc07uIq/A8t+ZU9zCQajON7nkxSJ6udtQGIeuy+GEW5gcn1U4NtXdBCMuhRwFa8vGmAmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alanderk.com; spf=pass smtp.mailfrom=alanderk.com; dkim=pass (2048-bit key) header.d=alanderk.com header.i=@alanderk.com header.b=rNxZqfA8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alanderk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alanderk.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alanderk.com header.i=@alanderk.com header.b="rNxZqfA8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so1762835e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Oct 2026 13:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=alanderk.com; s=googol; t=1791576638; x=1792181438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJ+o+4jIxwTH4R8juVBWrHTXbo8gUGBaH8eDaOzMlw0=;
        b=rNxZqfA81EEg4Gxy5IQxSzbbRfKrRQXu3QhgfJwNtm9vC8KHcwxUz9XHxh6J9Vilmp
         i/giZgW05avEKe6q1X+imoohYI5gj+lIXMW0TPjnoluMXqMl8KpZBZ8IS3NuG6EuAozT
         C++sb/Mi9R5FEMZJda07Vi6C1gMF7HyJICpKLFYJywxmANUhd/hA/Kr3Ra2Pz5QNODIa
         jXnntJ09Gx8+iHyhBbx/ZjDBbHo+0J7AyCutp0XYx8IfCkPF/Tp7RTY9RZMkdfYB52vw
         zrNsIaUmduwFWICwVjJc+mbb1GmO5d95C2NY7hs93hD/8dzu9Rb7yukOXUHwCDt75Uzm
         Zd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791576638; x=1792181438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJ+o+4jIxwTH4R8juVBWrHTXbo8gUGBaH8eDaOzMlw0=;
        b=afEUbttQO6V5NjM1aL8maulaZ1T2eEgQZe1HLw4y4tRHRAob84bIG/T7QIO7VbyrOe
         WwHpOATgqJOl0dmJWLbDNcUYI8KpMal90WUl3HO9PiGO3cbt9exZ4ppw0DGQT4bs39an
         If4MrmCXlD5LrWeuIyKSNQqSVSIsju93NDwkVR/y7wcjV9twVf9FpSqFk9dDwTnZlc1i
         TbokKf/sVmOYlbZVWk+cG8mgKoMnsVJu5eGkNOgwyeLVFjtiif4P+tSfnA44DVx4EKf6
         sZV3/DrNEm1eU+6xFVHAQmc0NEK+XagpDyQEhcoorBeDN/jBapWL9zn7lTc47CRlb64y
         4nMA==
X-Forwarded-Encrypted: i=1; AKwUvBwT3KWlevCMe5BxEv5PIvlYIslnUzDh2VG0mZik+05mMor29NI0/6Xf/CL6Iet635gku4CiBnDcMwKmE16+Gg==@vger.kernel.org
X-Gm-Message-State: AFuF++krKJSFKJkP2/JmRXR/aAONy2pxZgh1hkHXSNhx904s8dG2rTy9
	bdIAKL57u6hNS1GmGSYJRozIwu4+lo/i4X3uKTEwn/WdkAFxxw0Y4Z3/J+aJMhbNdWiPHV5bW8r
	8KXTE8miiyBrO
X-Gm-Gg: AYBFou1p6eI3bmu6BHdj/aWKR+tY+qptV09/D94jUahoFJ9SHMs0OYdkz6DI9h59fww
	J6gJwL96fSpGfhX9C/VTrAm6VXYPjnumH1KEZk6p0k8j6QDXr1AGac33OvWScMUGnq/cPDELWOK
	efS2XWIAklj8iMvxWsAI9RHaJ1ocO6cAGhZ/2oV/IeAWkW3bh+daYP2vOY/Zwlz+qNZxiKjQnYl
	I5qRGbTbenxqjySDXFnnmav1CBgP/3vux6MIn7jl1WMOQ857xGJqFixfmmuqPcMfriYDJvac2Zj
	I8JiLNuQ90xYI9iFhMOcObum3x2ucTp3Z4zAv85/lf9I1ZV7xs0zs/0Co27PmaW+r52qx9Dmj4M
	1KoqifvHMCUDp4QrvoEgKCfOMjp9xl0h5poq3Hv3YVuJKB5MyL8jh6HCVtv/PGHnud8xEmUzBgq
	hWmZx5VeEGDBc51/trl2ZTVDBkEUTGfFdNrARH3s3hHHozObG7aM3wHHx8V45KApNqog9Q1ea6y
	WDfa1RwOwj/GVuxSAkCTEU4N30iiXpPEw==
X-Received: by 2002:a05:600c:4e01:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a18e4afc3amr55785525e9.24.1791576637412;
        Fri, 09 Oct 2026 13:10:37 -0700 (PDT)
Received: from macmini4.tapir-palermo.ts.net ([138.199.43.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm110980415e9.4.2026.10.09.13.10.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Oct 2026 13:10:37 -0700 (PDT)
From: Alan Derk <linux@alanderk.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Alan Maguire <alan.maguire@oracle.com>
Cc: dwarves@vger.kernel.org,
	bpf@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH dwarves] dwarf_loader: Take the merged CU language from a CU that is kept
Date: Fri,  9 Oct 2026 20:10:32 +0000
Message-ID: <20261009201032.40105-1-linux@alanderk.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the CUs of an object are merged, as for clang LTO objects, the
merged CU takes the language of the first CU. Since commit
b98565e7b17ec24d ("dwarf_loader: Honour --lang_exclude when merging LTO
built CUs") the DIEs of excluded CUs are skipped while merging, but
pahole_stealer() then applies the same filter to the merged CU. If the
first CU is in an excluded language, the whole merged CU is dropped,
including the CUs that were kept, and with -J pahole writes no BTF and
still exits 0.

Kernel modules mixing Rust and C hit this in clang LTO builds with
CONFIG_DEBUG_INFO_BTF_MODULES: kbuild passes --lang_exclude=rust, and
the Rust CU comes first in the linked module even when the Rust object
is listed last, as the C objects are bitcode compiled at link time.
scripts/gen-btf.sh then fails, here for a Rust sample module:

  FAILED: load BTF from samples/rust/rust_minimal.ko.BTF.1: No such file or directory

This is what is left of the problem behind kernel commit 5daa0c35a1f0
("rust: Disallow BTF generation with Rust + LTO"), which keeps RUST off
when LTO and BTF are both on. With pahole 1.32 a ThinLTO vmlinux with
Rust built in gets clean BTF, but its Rust modules fail as above, so
that restriction can't be relaxed yet. Distributions with LTO kernels,
such as CachyOS's default kernel, keep BTF for sched_ext and BPF tools
and go without Rust; out-of-tree modules that build their own Rust
objects there hit this today.

Take the merged CU's language from the first CU the filter keeps, and
its producer too, as producer_clang also steers how the merged DIEs are
processed. Run the filter before checking for DIEs, as the unmerged
path does, so that a first CU without DIEs, such as an assembler CU,
still counts and the output without --lang_exclude does not change. If
every CU is filtered out, the merged CU keeps the first CU's language
and is dropped as before.

Before, with a C++ object linked before a C one:

  $ pahole -V --btf_features=force_cu_merging --lang_exclude=c++14 merged.o
  Filtering CU first.cpp written in c++14.
  Filtering CU  written in c++14.

After:

  $ pahole -V --btf_features=force_cu_merging --lang_exclude=c++14 merged.o
  Filtering CU first.cpp written in c++14.
  struct c_only {
  	int                        b;                    /*     0     4 */
  ...

Add tests/lang_exclude_merged_cu.sh for this.

Tested with clang 21 builds of 7.2.9 with RUST enabled: x86_64 with
ThinLTO (DWARF 4 and 5), full LTO and distributed ThinLTO, and arm64
and riscv64 with ThinLTO. The Rust sample modules get BTF and load with
MODULE_ALLOW_BTF_MISMATCH=n, and the BTF of vmlinux and of the C
modules does not change.

Fixes: b98565e7b17ec24d ("dwarf_loader: Honour --lang_exclude when merging LTO built CUs")
Assisted-by: LLM
Signed-off-by: Alan Derk <linux@alanderk.com>
---
As far as I know this is the last thing keeping RUST off when LTO and
BTF are both on. Once it is in a pahole release, I'd like to propose
relaxing the kernel's dependency to something like:

  depends on !DEBUG_INFO_BTF || (PAHOLE_HAS_LANG_EXCLUDE && (!LTO || PAHOLE_VERSION >= 133))

assuming the fix lands in 1.33. The tests above ran with "&& !LTO"
dropped from that line, hence the Cc to rust-for-linux.

Part of the dwarf_loader.c diff is re-indentation; git show -w is easier
to read.

 dwarf_loader.c                  | 34 +++++++++++------
 tests/lang_exclude_merged_cu.sh | 67 +++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+), 12 deletions(-)
 create mode 100755 tests/lang_exclude_merged_cu.sh

diff --git a/dwarf_loader.c b/dwarf_loader.c
index 01049e9..fbed36e 100644
--- a/dwarf_loader.c
+++ b/dwarf_loader.c
@@ -5329,6 +5329,7 @@ static int cus__merge_and_process_cu(struct cus *cus, struct conf_load *conf,
 	struct dwarf_cu *dcu = NULL;
 	Dwarf_Off off = 0, noff;
 	struct cu *cu = NULL;
+	bool kept_cu = false;
 	size_t cuhl;
 
 	while (dwarf_nextcu(dw, off, &noff, &cuhl, NULL, &pointer_size,
@@ -5441,23 +5442,32 @@ static int cus__merge_and_process_cu(struct cus *cus, struct conf_load *conf,
 			cus__add(cus, cu);
 		}
 
-		Dwarf_Die child;
-		if (dwarf_child(cu_die, &child) == 0) {
-			bool filtered = false;
+		bool filtered = false;
 
-			if (conf->early_cu_filter) {
-				struct cu unmerged_cu = {
-					.name	  = attr_string(cu_die, DW_AT_name, conf),
-					.language = attr_numeric(cu_die, DW_AT_language),
-				};
+		if (conf->early_cu_filter) {
+			struct cu unmerged_cu = {
+				.name	  = attr_string(cu_die, DW_AT_name, conf),
+				.language = attr_numeric(cu_die, DW_AT_language),
+			};
 
-				filtered = conf->early_cu_filter(&unmerged_cu) == NULL;
-			}
+			filtered = conf->early_cu_filter(&unmerged_cu) == NULL;
+		}
 
-			if (!filtered && die__process_unit(&child, cu, conf, 0) != 0)
-				goto out_abort;
+		/*
+		 * pahole filters the merged CU by language again, so it must
+		 * not keep the language of a CU filtered out here.
+		 */
+		if (!filtered && !kept_cu) {
+			cu->language = attr_numeric(cu_die, DW_AT_language);
+			cu->producer_clang = attr_producer_clang(cu_die);
+			kept_cu = true;
 		}
 
+		Dwarf_Die child;
+		if (!filtered && dwarf_child(cu_die, &child) == 0 &&
+		    die__process_unit(&child, cu, conf, 0) != 0)
+			goto out_abort;
+
 		off = noff;
 	}
 
diff --git a/tests/lang_exclude_merged_cu.sh b/tests/lang_exclude_merged_cu.sh
new file mode 100755
index 0000000..507c6ac
--- /dev/null
+++ b/tests/lang_exclude_merged_cu.sh
@@ -0,0 +1,67 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Test --lang_exclude when CUs are merged, as for LTO objects: excluding the
+# language of the first CU must not drop the CUs that follow it.
+
+. "$(dirname "$0")/test_lib.sh"
+outdir=$(make_tmpdir)
+
+trap cleanup EXIT
+
+title_log "Language filtering of merged CUs."
+
+CC=${CC:-gcc}
+CXX=${CXX:-g++}
+LD=${LD:-ld}
+for tool in "$CC" "$CXX" "$LD"; do
+	if ! command -v "${tool%% *}" > /dev/null 2>&1; then
+		info_log "skip: $tool not available"
+		test_skip
+	fi
+done
+
+cat > "$outdir/first.cpp" << 'EOF'
+struct cpp_only {
+	int	a;
+};
+
+struct cpp_only cpp_var;
+EOF
+
+cat > "$outdir/second.c" << 'EOF'
+struct c_only {
+	int	b;
+};
+
+struct c_only c_var;
+EOF
+
+obj="$outdir/merged.o"
+
+if ! $CXX -g -c -o "$outdir/first.o" "$outdir/first.cpp" 2>/dev/null ||
+   ! $CC -g -c -o "$outdir/second.o" "$outdir/second.c" 2>/dev/null ||
+   ! $LD -r -o "$obj" "$outdir/first.o" "$outdir/second.o" 2>/dev/null; then
+	error_log "FAIL: compilation failed"
+	test_fail
+fi
+
+output=$(pahole --btf_features=force_cu_merging -F dwarf "$obj" 2>/dev/null)
+if ! echo "$output" | grep -q "struct cpp_only" ||
+   ! echo "$output" | grep -q "struct c_only"; then
+	error_log "FAIL: merged CU lacks types without --lang_exclude"
+	test_fail
+fi
+
+output=$(pahole --btf_features=force_cu_merging -F dwarf \
+	--lang_exclude=c++,c++03,c++11,c++14 "$obj" 2>/dev/null)
+if echo "$output" | grep -q "struct cpp_only"; then
+	error_log "FAIL: --lang_exclude=c++ kept the C++ CU"
+	test_fail
+fi
+if ! echo "$output" | grep -q "struct c_only"; then
+	error_log "FAIL: --lang_exclude=c++ dropped the C CU merged after it"
+	test_fail
+fi
+
+test_pass

base-commit: 1e342ac44979748bcf5bb37f84ea055e7f4d7184
-- 
2.55.0

