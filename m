Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280F1D5CFE
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Oct 2026 00:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791593554; cv=none; b=Bn2SW49TWpHLPLU1RwJ2LdQHyqiuim60hHdBnKjDN2jVgXSqW7CzWUyc/+FFcnTY1nIg+18G05/05hOLpaW229QkYSsKvBH4jga2oxBk7WxLaniGKB2hrCGm0AIemn5gNQj0B515yZ13dQ7xQgGngTPB+T7hIBECSg2YsUthod4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791593554; c=relaxed/simple;
	bh=D+QBlXfaJAUuhqc0hqAKzFkFktZSCD48uzIGapZcrPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CjvrjObph2rehEIgtatvsm0Upv+M/HK46a2dSaL0R/Ad/Umn2iAG0GdHlr6hDcYdINx+pI4fjJ/VG31P36miMOmEyVFp+IjGv05uQFrrTLXhBJIPSngUgrHbtXPOZ0jrvI+L5DgL7MoWo6OLYGy3kn36BDT4VoWbSwJdyN63A6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alanderk.com; spf=pass smtp.mailfrom=alanderk.com; dkim=pass (2048-bit key) header.d=alanderk.com header.i=@alanderk.com header.b=yoVF+14X; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alanderk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alanderk.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alanderk.com header.i=@alanderk.com header.b="yoVF+14X"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso182523a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Oct 2026 17:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=alanderk.com; s=googol; t=1791593551; x=1792198351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+nv/ahniPVLz5y7JEZBuVoxLuh0JYLRNflwWsXXIGk=;
        b=yoVF+14XteZRFdXLE7G1aOL0rU6FjbWpcvH+rp/ofbc0zbTQzDbYqfWBJz2bX4NfHx
         oKh+mRolm4Nn+fvL/M5CuZLBwH+lZiSKNGEYJwFIDX9E9Tnr2DHElEKI7mUFdKJJl0IX
         n+zTVOBP4P/LCg/sE+43RlTIqZgHGzT5LX9Tzck/eEt6qZ5JLMfBACq9hU1hacvZYRk2
         8wMHzqvNw6QNEy7grVR1UG1zji2BH7mYEC14TvGXqIVnZ5cVAMZ8poguzx7Mc9/iR4aK
         9REhRFCrGu5AlwGP3e5TdBUQD9VyWtYH9fwsZykA/eklVaorzaHqaPMa7WQKBmqeKOcf
         x5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791593551; x=1792198351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+nv/ahniPVLz5y7JEZBuVoxLuh0JYLRNflwWsXXIGk=;
        b=boIhx49izcdXi1+EmRlevidAilI2ZcDIyGHqgpBHcZdVrsIEH5IRWo053DTz/Nng3X
         VcDECjkbKf5eQNDtWiiLo8LJH1MJKOBlOWF/eSYMwTSSE3XNMyr6qo/j/1JIOsyeeaSP
         bxzNTl5k9jJhYKjLB8yfJxRk1XvaxLFTHNCAtwt7HCyuI2yTKcOBLdVIfRcJOMwFatqX
         gK2Y5WydyiUYsF//SBNK67390+jHLciTRGfVlgAx1pswz8nsjrLZRVicxBfNfVWkueE8
         BJQO1Ashx2+iK0fPqH9Iw5xJ4g/NjBlhUkklMXZ17QSoTsDFSB07qAaAwJpTARyK5OGo
         U/7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxL6kZVECFl819yVm1n59eNYLQQxu0lvZbtJLPSooqlkYQRTLr9yjRYCIlFgaf2jYNXgKixOgr6sEY6SUM/Xg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK8cBXf2hxX1yEDi/r1nxtIJhTtoueLUvffXyy/W/Yjv7LZWoWx
	iSjnN3NRne47G0VbG1km26k3J3YQ5fzoGjavfvbFoQ2SQoRNM630c31JDz9FH5VB5qFxKrf+FF8
	QUxvFb82xx7+vSXA=
X-Gm-Gg: AYBFou3q1GLsxWhLdEKIShaSJvnybj8e28bzK2S/MjPa/iZndlRoLyHwFyQXDry9ETW
	6vyFRn+32XEaI4CxuuI/90cfdmEvfe2Ly4z1fBaPjyPhv2fh3o0RWoQXchEAM6B+SIUwu4/7nHH
	ga9OPxxd1NjvAlazixgM7r/nEr1MLRiM05YbvyBmJfSd2rqdr8+GpTQA9nn0yO+Rw179VQRz8hW
	OsykJBxMMoAtCDe+thXk61HDICySg8uHD83yC1xDbFPtYTcwuaeURWU11MNPNAvGsBeeDEMZVmy
	ytPFHsOq8/Z7Q+JRQIv1wTYKIwhsY5VAKup3VbhYcEvv/dwbK15PGkTPZ0hTxTaj4bG59vlqa49
	GXkiVzRbBeQny8fx6pE4Vsa4cNimutPyYfvsQpAnvAjqnBcGYLTdRxXNiYf5mBEiE5a3oCF59R4
	aqM4UhLcOC4rALkfOqFA1XTWmt+6LKvrHQnrLp5ih2LOlylNh53at8GCXOy39mlmEqng3raz6DL
	p1NocOA1/Zbcdy0vk4L+fdKFOyNXd/zMA==
X-Received: by 2002:a17:90b:48c7:b0:3ab:8b2:72bf with SMTP id 98e67ed59e1d1-3ab3a928525mr3305305a91.50.1791593551362;
        Fri, 09 Oct 2026 17:52:31 -0700 (PDT)
Received: from macmini4.tapir-palermo.ts.net ([138.199.43.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab50ce9d98sm4078226a91.9.2026.10.09.17.52.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Oct 2026 17:52:30 -0700 (PDT)
From: Alan Derk <linux@alanderk.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Alan Maguire <alan.maguire@oracle.com>
Cc: dwarves@vger.kernel.org,
	bpf@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH dwarves v2 0/2] dwarf_loader: Fix --lang_exclude on merged CUs
Date: Sat, 10 Oct 2026 00:52:25 +0000
Message-ID: <20261010005227.976-1-linux@alanderk.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for --lang_exclude when CUs are merged, as for LTO objects.

Patch 1 takes the merged CU's language from a CU that is kept, so that
excluding the language of the first CU no longer drops the whole
object. With LTO, this is what makes BTF generation fail for kernel
modules that mix Rust and C.

Patch 2 fixes a second bug from the same commit, which I found while
testing userspace LTO objects after sending v1. With clang LTO, a type
such as int is emitted once and shared through DW_FORM_ref_addr, so
skipping the excluded CUs left references into them dangling: pahole
crashed printing such members, and -J encoded them as void. Patch 2
loads the types that kept CUs use from the excluded CUs. Output without
--lang_exclude does not change, and neither does the BTF of the LTO
kernels I tested.

Patch 1 exposes this bug in one more link order. For a C++ object
linked before a C one, pahole used to drop the C types without any
error; with patch 1 alone it keeps them, and then crashes printing them,
or encodes them as void with -J. Please apply the two together.

As far as I know, patch 1 removes the last thing that keeps the kernel's
RUST option off when LTO and BTF are both on. Once these fixes are in a
release, I'd like to propose relaxing that dependency to something like:

  depends on !DEBUG_INFO_BTF || (PAHOLE_HAS_LANG_EXCLUDE && (!LTO || PAHOLE_VERSION >= 133))

assuming they land in 1.33. The kernel tests in patch 1 ran with
"&& !LTO" dropped from that line, hence the Cc to rust-for-linux.

Changes in v2:
- Add patch 2.
- Patch 1 is unchanged; its note about the Kconfig follow-up moved here.

v1: https://lore.kernel.org/all/20261009201032.40105-1-linux@alanderk.com/

Alan Derk (2):
  dwarf_loader: Take the merged CU language from a CU that is kept
  dwarf_loader: Load types that kept CUs use from excluded CUs

 dwarf_loader.c                  | 129 +++++++++++++++++++++++++++-----
 tests/lang_exclude_lto_refs.sh  |  76 +++++++++++++++++++
 tests/lang_exclude_merged_cu.sh |  67 +++++++++++++++++
 3 files changed, 253 insertions(+), 19 deletions(-)
 create mode 100755 tests/lang_exclude_lto_refs.sh
 create mode 100755 tests/lang_exclude_merged_cu.sh


base-commit: 1e342ac44979748bcf5bb37f84ea055e7f4d7184
-- 
2.55.0

