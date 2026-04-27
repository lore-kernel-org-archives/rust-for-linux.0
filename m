Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871923B9D97
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 17:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311895; cv=none; b=UbZ/795YOSl6y0sM9OFWPlczBbsc0zeSYI4ON8kXZWmkc3wAHKJE9LfwpOU8A2NH2ERxdZ2dtWeElLHtYunBxMyjJEX2kXoxpn/1RN85JWKKD+aETjrtCRnUvHEESIowsZnzBAqOkrniCD2DWA6uxo4koZyVVhxiAV4RKM7Ttz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311895; c=relaxed/simple;
	bh=aG2/pIddFBYwHDjRtPjqjVuxTTwpcBTrMMTxoCM0eGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4Z8/sg5xzh7/+ne9ojKrgnDlTwVD2DL4R8WfMpcNX/0HjU+x4EiyBdGJf2mwCA5uPXeGlnGPMkALt1hiFBE1CH3Y+wiyekmDO+Ige4xv5MMWrtp0lbLftWqBs2oNTRAor5rpRzrnecuZEn8MdyT9xxhswzYfORedOuzu+4AC30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0HsdFrS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0HsdFrS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso146662365e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311887; x=1777916687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIyqmWrjFxeDbps0CNbpJmCmgB+UMGp2ijYl3BYcDRw=;
        b=n0HsdFrSigDTC2LXgqIPdlD+od8Cm4vKPz5Grk/D22b3febRJK6VzhrXhXLVQMnEOW
         yFcCGeB2UHHSZ5Z5l51n/Cr+Cx/vWcIkPpP9w7wR23bfOyFvR83V3OSPp9uu1JlgPQc/
         /5nT86rVA68kGKptijVAfexSqqWcoZ7xgJLAtFh5ohdIdS8+1ZtTSoyAyS+9wpplOlpQ
         CVVwhWubN8pkfhKI96ClsvYe9yV0TE1ALJRRR6cn/x1dVNvPrxkY/nTjk5XcmBznicH9
         anoXSGByHAGZJdoRDTHe8xlpL4xJt+wBrfRmqjQfVMYWAYGJAXVRmO+2GqvDGzzhCo5Y
         dU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311887; x=1777916687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TIyqmWrjFxeDbps0CNbpJmCmgB+UMGp2ijYl3BYcDRw=;
        b=hGHuZOCILmczwTzoOyfG8SATsEwCPEkiRCK3Oo9ziGYN3Qu4Uce26uR40F6Yrp4BW+
         1lPUN6+2ZaxqjT6uCZeOg2Xrn/AWlmGYqU2U+6mLq7haSsP6ipUp31KBlZEdCmBCIMwJ
         vCZSgqPmTtSgs0r8WQvGxP2qOvPRHDmO1DESYhPzgSRqrMd4cdZIlq8ZXb26+rDJhRpX
         qGFItSXnrD9W1+sVVT7h0MWkhAqWjiDzN1ULj13rvsLdU5NFSRxlbSk8GqdkBMCEG2zA
         UqScsx1A2RZ3IuOGc+DmNDnhJDWcLkZrWfLRADn1j1vbmVeACoqWd/A/ENZoMxXqlHDR
         tlbA==
X-Forwarded-Encrypted: i=1; AFNElJ+0bZkg2xwhR9zXPx/Kl2K72ewnW97JO9GBH+D7CvtZhg4V2WYovergGbHbYgGBw/s+a+s/62UULcs3sVbHuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ATj1mdx2Z8JYjj4SMvETkP3+sF2HYeoMNUlngw/KP3k3pJtd
	F2lvhhf2YOQahQkzGmQLFt0O20Ymq6C8pWj+Fdk+dKn9qC0kmxnROfwI
X-Gm-Gg: AeBDieuP8n7gJBMoh8NRx1kXZmmVCXVA/Ag/Bi7J+/Mh0mPQwkoyRByJuY0ztLMS2NP
	vm1YXVgcOxrUmPTplWIgZmVsuWOy43QVuq9Yph+Ic6g2irAu9r4ouwOhlh3eSEqKARyWvCyMrRM
	HfKwwk3I1ltWlo/4HT4c8MQSWrClsRJaflmvyI9zwpeWOAE+QBQrtNrRCCr/Rc0xIVRf5hzdciI
	5OXpuFhE1gw04ItZ51CJ+tx17sNK4RHAu5TF/+hRWx+LJQ5g6sDKOuhmCQcMCmCD5QqQNTK4p8J
	R4mzT5QT606Hs4SO1cbk/CEp86wkmAYPqxH1TU8VDLgqe0ZfVG3aPlPFngb49v0JwLZz5CgF13T
	cXnbsxgF4NcIL1NkkXsXtxuDjB5XIgSfxfqjtbvqiLX/jXE/DV35DOWCYvuPOBLKSVk1CiBxo5C
	SLilVHSlhWgawhk49Yhfpg1OtInjhYVjZbDfWpflezgvx5Hdf/SpWMlB4oGizREyJgxw==
X-Received: by 2002:a05:600c:8b42:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-48a76f74fe7mr4833345e9.15.1777311887430;
        Mon, 27 Apr 2026 10:44:47 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a774b6300sm478485e9.16.2026.04.27.10.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:44:47 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: akpm@linux-foundation.org,
	ljs@kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
Date: Mon, 27 Apr 2026 18:44:29 +0100
Message-ID: <20260427174429.779474-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427174429.779474-1-julianbraha@gmail.com>
References: <20260427174429.779474-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add usage documentation and a brief description for kconfirm to
Documentation/dev-tools/

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Documentation/dev-tools/index.rst    |   1 +
 Documentation/dev-tools/kconfirm.rst | 147 +++++++++++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 Documentation/dev-tools/kconfirm.rst

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 59cbb77b33ff..130ebc0d7282 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -40,3 +40,4 @@ Documentation/process/debugging/index.rst
    autofdo
    propeller
    container
+   kconfirm
diff --git a/Documentation/dev-tools/kconfirm.rst b/Documentation/dev-tools/kconfirm.rst
new file mode 100644
index 000000000000..6ad02de15031
--- /dev/null
+++ b/Documentation/dev-tools/kconfirm.rst
@@ -0,0 +1,147 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+.. Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+========
+kconfirm
+========
+
+kconfirm is a static analysis tool for the kernel's Kconfig system.  It
+checks the entire tree-wide Kconfig, and reports misusage like
+dead code.  In the case of dead default statements, these can be a
+significant code smell.
+
+kconfirm has an optional check for dead links in the Kconfig help texts.
+Since this has a high potential for false positives (due to websites
+blocking bots) and slows down runtime signficantly, it is disabled by
+default.  However, an example of how to enable it is included below.
+
+kconfirm is written in Rust and lives in ``scripts/kconfirm``.  Other
+than the dead link checks, kconfirm aims for zero false positives.
+
+**NOTE**: kconfirm does not modify or compile the source tree; it is
+strictly a static checker.
+
+
+Getting Started
+===============
+
+
+kconfirm's Minimum Supported Rust Version (MSRV) is v1.85.0, because
+it uses Rust edition 2024, and this is the earliest supported version.
+
+kconfirm also requires the Cargo package manager and an internet
+connection for compilation of its dependencies.
+
+If Cargo is available, kconfirm can be built and run from the top of the
+kernel source tree::
+
+    make kconfirm
+
+The compiled ``kconfirm-linux`` binary will be available in
+``scripts/kconfirm/target/release/``.
+
+The default checks currently cover dead code analysis.  ``dead_links``
+must be turned on explicitly with ``--enable``; conversely, any default
+check can be turned off with ``--disable``.  Both options accept
+either a comma-separated list or repeated flags, so the following
+two invocations are equivalent::
+
+  kconfirm-linux --linux-path . --enable dead_defaults,dead_links
+  kconfirm-linux --linux-path . --enable dead_defaults --enable dead_links
+
+
+
+Options
+=======
+
+**NOTE**: kconfirm's arguments must be provided in the ``KCONFIRM_ARGS``
+environment variable if running with ``make``. See `Examples`_.
+
+Available options:
+
+``--linux-path PATH``
+    The path to the linux source tree to analyze. ``make`` uses this
+    option to pass the current linux tree, but this option can be used
+    when running the tool directly with another source tree.
+    See `Examples`_.
+
+``--enable CHECK[,CHECK...]``
+
+    Enable one or more checks in addition to the default set.  May be
+    given multiple times, or as a single comma-separated list.  See
+    `Available checks`_ below for valid names.
+
+``--disable CHECK[,CHECK...]``
+
+    Disable one or more checks from the default set.  May be given
+    multiple times, or as a single comma-separated list.
+
+``-h, --help``
+
+    Show the help message and exit.
+
+``-V, --version``
+
+    Show version information and exit.
+
+
+Available checks
+================
+
+Each check has a string name that is accepted by ``--enable`` and
+``--disable``.  Checks marked *(default)* are enabled unless turned off
+explicitly.
+
+``duplicate_dependency`` *(default)*
+
+    Reports duplicated ``depends on`` entries on a single Kconfig symbol.
+
+``duplicate_range`` *(default)*
+
+    Reports duplicated ``range`` entries on a single Kconfig symbol.
+
+``duplicate_select`` *(default)*
+
+    Reports duplicated ``select`` entries on a single Kconfig symbol.
+
+``duplicate_default`` *(default)*
+
+    Reports duplicated ``default`` entries on a single Kconfig symbol.
+
+``dead_default`` *(default)*
+
+    Reports ``default`` entries that can never be selected, for example
+    because their condition is unsatisfiable.
+
+``dead_links``
+
+    Reports broken URLs found in Kconfig help text.  Because this
+    performs network requests it can be quite slow, and is disabled by
+    default. May also have false positives.
+
+``style``
+
+    Reports opinionated style issues in Kconfig files.  Disabled by
+    default.
+
+
+Examples
+========
+
+Compile (as needed) and run on the current tree::
+
+    make kconfirm
+
+To additionally enable dead-link checking::
+
+    make kconfirm KCONFIRM_ARGS="--enable dead_links"
+
+To disable a check (here, ``duplicate_dependency``) while keeping the
+rest of the default set::
+
+    make kconfirm KCONFIRM_ARGS="--disable duplicate_dependency"
+
+To run the default checks against a kernel tree separate from the
+current directory, such as ``~/repos/linux``::
+
+    scripts/kconfirm/target/release/kconfirm-linux --linux-path ~/repos/linux
-- 
2.53.0

