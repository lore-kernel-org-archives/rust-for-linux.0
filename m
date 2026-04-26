Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210852C0F6D
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777196866; cv=none; b=Zi9Wxw8L5FEhKoJUpMSiHxyp7UbtR5v5mcc/l53Tgbe5JiJ71bd5Q9fKpQykaFwQektD8dEc+mm97/puf8TUgEpD7gL3i+oovW5YEApQu6yJoA9li91Y8rhbR4lyBEjQZ/qLrwjkt5q+dH2BziEoJgqFeUH41uiaMIJlZjIpT54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777196866; c=relaxed/simple;
	bh=QFNebf5U4VbW1MpFFVFYXydsKehrXntq9zJnvMEFE/4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swLhq6UV0E7AqWZWglrwXis0Ycvy+YR3Qb2aBGwwVTkwdiPdev4Hp+Et8Xse+bXJm28Sj8c5bIvCpdCvnXc8May3bsCLSHBBtnsXSWmE4IYDwzK/ceRH3Okqo1EsiZF0wiIY47AIJqtMEwSGl71Ss4G4GtR/qKW6kmlVlNf3Kko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnKtFFTZ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnKtFFTZ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so6243164a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 02:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777196864; x=1777801664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHhSckLmj3+7rbDwz/6bR3hAFf764LgnIQFCwbFne0A=;
        b=DnKtFFTZKTtlF0lFbyPp0sK04DfmQBMFbHAzJNPukI7zANV3WSsGcBNNuoWSfvF9Y0
         gNxZF/m+PbCUIGndhE7fq1LvsO5i0Eh6DCQPDm2ALVJQM2mgvfo6lehr0dU4SRMGDFEf
         05f+H0osseaH9nEVgox1E7A7k/8ZTxyj+5xUBYnqNvT/E8qDdMVaciSPgiPrbOUZFuED
         Ym0tpjbyUWY0VAOS/UjAlhnzc0WkWTp1rneedEjwPBuGF+XIWopkKAdb9L0CN3PN6Atm
         mmhkFYVQ/rAd3eOFwnBuku371HbTmy179iG+GL3BQrX7mLUzQER/pTDXBjVRYuK8g1Uv
         9mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777196864; x=1777801664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZHhSckLmj3+7rbDwz/6bR3hAFf764LgnIQFCwbFne0A=;
        b=jza/sGEPaGKxVygSIOty30S0AaafYiz/LbvBuEgpvp/WpOLsgEJ6bfuAKfbxo0iyBv
         iOY+LFycMMD2ZDae1DKY3/YFyjbSahtKtsi1EhT7Q+zhwswly1Z3ev/gwlGKjUeUwbRn
         E2hjASGJmmkdJyadKz71HmbVpdrL4OXEBUiU/Sll1lt5XyxtlCd/odOpm3fPqr1uNrC8
         Z+dJuM423JoVPN4ChOYWs1+x/XVq8Dpw5qSQM62RU0ZMfORu9kSWBMnXumJD8lMYDnYM
         KE5rPZujJJ/RyVBYMIpe66kv1mob0KJub8b9/jqdu1TklL/0Wh2brZhv4sX4txc3PSgR
         660w==
X-Forwarded-Encrypted: i=1; AFNElJ8avKRKA7DEKNTeFq/P79DpsiwBBpDQfkKxobJDiNMOmWxDiMG5k0drxKXK1a277ANAZisjvGRi3XAi74hO1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYoubWLwesgoczISqNrfFVmx7NN5sISIFMsMHitkNQRR8bVa6
	FqJAPc8WJtJK6FUXgmBdDmwBWQkEELS5GF0yxR4JzG0xKgDSdeaRojMH
X-Gm-Gg: AeBDievt89yU5HIzL4zAnpIXugPRV4e59mfA75VG/OyxofQDO1V9d0uH5VVvveBdX5M
	GjYirafR5Qa0P/LI4U+8o2bZbF19QCQlBo1fR8zo8bj7ig91CSoBzJjIe1uGmX/CZ9+cG3nX0dD
	kpk38plU0Q6Tpo+Vt9EX+ParEp7x0Ju7a4k5NcaoMaTg/q0DZWKyr82tBcmqtkOGFL4Xv9ctd1K
	RNMLPkr1K0IJ1aTK0VAGq6f37Ox1+QbAWerl5IwqUhMwI7nB45NFa5J4EX5lJEeXQT3y1ngQ5iw
	tvNkRAkHXjprUvSD44d/LBgq0lMnekIDpL+R3yEkQP/fhCvlhJVsVrE1WrFFQ53SgPapkJwA0/6
	u7mXDN5qqQoccjWWUBPPFy0zC/wZuccQN6TqK31d8X2ZcVf65GrI3aUhfVyT4CqRgzL8v+cH/jb
	CjS2xo8pcw96JFK5gS+//Y7K/lkDtPIMsru3xtq/wOxvNR4kVb/6AXTzz93S21c5wW5euGSPEBo
	iVJIY0tHbKOpL4=
X-Received: by 2002:a17:90b:37cb:b0:35f:d56d:1c45 with SMTP id 98e67ed59e1d1-3614041bc7cmr35362717a91.12.1777196864370;
        Sun, 26 Apr 2026 02:47:44 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614371a7c8sm28450073a91.5.2026.04.26.02.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:47:44 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	lina+kernel@asahilina.net,
	lyude@redhat.com,
	j@jananu.net,
	mkchauras@gmail.com,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/1] rust/drm: import ARef from sync crate
Date: Sun, 26 Apr 2026 15:17:25 +0530
Message-ID: <20260426094725.2188668-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426094725.2188668-1-mkchauras@gmail.com>
References: <20260426094725.2188668-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARef is defined in sync and is getting used from types causing the
build to fail.

Fix this by using ARef from sync module.

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/kernel/drm/gem/shmem.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index d025fb035195..e1b648920d2f 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -19,10 +19,8 @@
     },
     error::to_result,
     prelude::*,
-    types::{
-        ARef,
-        Opaque, //
-    }, //
+    sync::aref::ARef,
+    types::Opaque, //
 };
 use core::{
     ops::{
-- 
2.53.0

