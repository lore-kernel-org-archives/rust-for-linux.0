Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65603EBF18
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 07:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361108; cv=none; b=khBzaUZweaUMkE61hvUsgE8FgG4pHrhDj3DbEEtaPsGEoEY4TSjUBAu8wB/zFOXT2ftBDGF1XVmJX1A86hP70tJarkrFDwnwJTuiurYp5Au4xz9l7Ri2mMDdW0CQlcqSIKVE/pAeZEJ8+hU2RQadZQH0C9Lh5pTSr+fWsU7RSxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361108; c=relaxed/simple;
	bh=O01XH8PH7Qd3MMdXjEgJXTtOf8fl/1BmXGJXr4I4IZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hWkd6V6/YBnmBKuGQlfPdYgflDxd5Nfa7FDpuhCvqS4ziF2+csQ7I3w5+aCMrEP7oj+HnsTjDcfMTjtrz1xH9WK4awAqYuobIlpjUg1zhacA4UB4cWgzGsSqEQMz35J4kZNGp/7Cryu0y7eyTM2IZV7FPb3d9TXXe1J5NF7rK+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPrgz2rY; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPrgz2rY"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c7ec83fff7fso715942a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 00:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777361106; x=1777965906; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffPK3HGlamwsJhIWk/SXFE+By7GLberSOHXTBlAKTH4=;
        b=KPrgz2rY94svGBtjG9Bu9iqlocdU3ICKkTusacRaDTc7rlTFBrumCpgVJmEn8/qUx2
         SXbjPbpTZ5zHirp+i7oeQhGdcwfa93Dpgy1gNyta1BCUeBcPiXQ2eMZsSisJhzl0cxFn
         HvP793xCRoyrZ1/HK3I7U5YnXhII25zcT4xZrUqmO28X3gITb1BsXJnR5e4k6Bpmnk33
         LM4pYS/rjrSgDb5fgVux1blleqnln/LTUiij8PuU3Fx5Fa7TDdI+B0dSZp8YqvzgPUUW
         mo7HlVWQ/U3glvU/x6YKb/Z+cX8YIsxKbUb1uG70kjUe3sXy026A4sCslDyVJEtPSwPZ
         hblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777361106; x=1777965906;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffPK3HGlamwsJhIWk/SXFE+By7GLberSOHXTBlAKTH4=;
        b=og6alWUfair7KbKevxOgRxpuD2O3WGbTtPsFg6iVjBOdgsOe8kJj6W8mVMGOTubqNj
         02R71LyreiqTfIWwF/3OjFD9+HJQ4PAf4+cSPyFnpF3spiwcdCCLxLirnnTo4RTbqF+b
         w9LKj55eeneV11ZYYvOVbm421agNMa5iL0cFOcuE/uXLXe4pzMGeWvDJt6AfPeGowyPh
         y8HJz75YG6jmxvJEJauaqTrWAacid0r63Wn8/7fTlzfo/aZa/TkQlfXWilpQAK8VeJtS
         TZg6JSj7BwHD0G6MHLI9gIUTgyV7sYqQom0JQzE6yl3VFmTIrXncaqcZ9pEwwdix4OCO
         sOew==
X-Forwarded-Encrypted: i=1; AFNElJ8Su/nKd4GEF85NbUtCMcLv3/QMS9Kznmm5hMfNijiw50MhLoQ/GwloOYRZcCuEFFIay9O/Xp1WuSmPRox3tA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7a6nnZ6sgpcbWyXbEsJQjPCYKLK+Yt7+qYcbkcquUbmMtGvaa
	XmjOJm64N420QqRjFKN7U9ayyx+Tyesjc/UAIiDYZuYSs+xM9wzV7Phu
X-Gm-Gg: AeBDieuGejQn5pO3fsA0Q6BMKH6AD/5m3p60Qit/iMYLfVTFpUZVeJ2f6YAUtUB7uQD
	SfpaSMmONLi95n/48k7pHsTqkJrq2p4VWN2lhs8c2AQUW8zCUXJeNVvGevgBadLpx0czUR1DCfN
	SZAgVynKYkkwWzQ8XvzvTFYhJxpq+6A9a5y7c3g3TtCMOv1qS7TZH704EvUPFmAgCy1SbMdswh+
	89XP6lEx1/31xgax7H7MpUgxeqGoEFB0xFa80L3wAnyE+M5cMe5Ar7mdOahNVIBS8o8tgyNoBE+
	h3vAaBctLO2IlundKhymDTpOU3ZY2ZYymt4h+liATyPMN+O7K3AnB50rpXNO1UUCjJZhU1mlh9/
	P9JvweF41Vss6Z8B3GMhnGYjycCc3PcKeBp6txoFKtGl3GosAkkVyDTLGwTd+IVLHsSokAcZGZY
	mueBGY80jX5VR3hCDCLRyYuLHzT+aOlLZA1cHuM9tzobEs+VA=
X-Received: by 2002:a05:6a20:1591:b0:3a2:ed4a:5d81 with SMTP id adf61e73a8af0-3a39c530e28mr2000291637.11.1777361106265;
        Tue, 28 Apr 2026 00:25:06 -0700 (PDT)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae2249esm1714461b3a.21.2026.04.28.00.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:25:05 -0700 (PDT)
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Date: Tue, 28 Apr 2026 15:24:54 +0800
Subject: [PATCH] rust: block: fix comment referring to states by wrong
 labels
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-fix-docs-mq-req-v1-1-260079853836@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMVg8GkC/yXM3QpAQBCG4VvRHJva3YTcihywOxjlbwcpuXeLw
 6e+771AyDMJFNEFng4WnqcAHUdg+3rqCNkFg1EmVYnJseUT3WwFxxU9rehMrVrSTZpkGsJr8RQ
 mX7GsfsveDGS3NwP3/QCzhM3TcwAAAA==
X-Change-ID: 20260428-fix-docs-mq-req-d2a0fe1b6471
To: Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hsiu Che Yu <yu.whisper.personal@gmail.com>
X-Mailer: b4 0.15.2

The comment in `Request` describing the four ownership states referred
to states 2 and 3 as "B" and "C", which are inconsistent with the
numbering scheme used throughout the same comment block.

Update the labels to use "2" and "3" to match the existing numbered list.

Fixes: a307bf1db5448 ("rust: block: convert `block::mq` to use `Refcount`")
Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
---
 rust/kernel/block/mq/request.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
index ce3e30c81cb5..75d3fdf896e0 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -39,7 +39,7 @@
 /// back ownership to the block layer.
 ///
 /// Note that the driver can still obtain new `ARef` even if there is no `ARef`s in existence by
-/// using `tag_to_rq`, hence the need to distinguish B and C.
+/// using `tag_to_rq`, hence the need to distinguish 2 and 3.
 ///
 /// The states are tracked through the private `refcount` field of
 /// `RequestDataWrapper`. This structure lives in the private data area of the C

---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260428-fix-docs-mq-req-d2a0fe1b6471

Best regards,
--  
Hsiu Che Yu <yu.whisper.personal@gmail.com>

