Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CD7311C11
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777191776; cv=none; b=R1zrEuBAaFjX400KS3Ek7KFKcCdyaHMrOsJeeuY77vJC5Gj1P+5SlfgpAOjvuTwrUyJLMprG8dvsAoCSAaSWZFpNzxWqMMrQwsZSxOgC2ihkPcG/zdJYXSkmKEduQqP1YMzHgsOAXoxmiCiWavp9q4b7J5CCwHVP59jD+13pSr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777191776; c=relaxed/simple;
	bh=rOTzBu24ugh7xZX47H1dkWCj0ID4TRaefus2462S1I0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JwpgJPqtZarXD8aWqaEucod7EqqtrwTcdbda8hdO+svtx5EeLuSTFPCYFMiDlJc4bW7vbKXnH5rvH2XlJbOxMy8DwLJs+dlaI3SZ2Jre7vPgLDz9z9hD7czP04OxMAmux+UTNoBX1mWu/ML6XE/74wk2zF1qyWYNKSS81YVtefI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q0Mw/LWp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0Mw/LWp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ab46931cf1so70041805ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 01:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777191775; x=1777796575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5X1fF5hQULGKVZ4Sp8pVMxUoUy4e3HU84f9TuloiPvw=;
        b=q0Mw/LWpcr5uqlw/Us1yQ0i2uWr/PG0pEP69TLl9d7A9o76itrm7bhocngNrcSP93+
         He5dFFGhsqk9erHYt+bVEqTSMvx5A8YpEtcUFhGS0TddEfZSBZvfsFv8Gk+1emYS4uUL
         aUercWLDC8gWfvyjkQpnYql/fL/53oGWhazVU97FEp7CSG4Ux1hmDWjAXxbb7iXSubeU
         CtT74omAPZq4sMz06QBWRlBaiorRWWr2R7qOzKjmSj4GPQNJMrAldC6SvBCF93D0vtRA
         uYlLiUXp3h7Lz62WJuIuZaxsQPHF1hH1Gq3KDaRpBfXB8/nIuiKSqb7UOGhWsFh0KhD1
         0C0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777191775; x=1777796575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5X1fF5hQULGKVZ4Sp8pVMxUoUy4e3HU84f9TuloiPvw=;
        b=EFFPJEtnrhn1+hFefy8i/4K4RIRAWRSFA2FNCWAzBbDygkzpl2mMQLd4yJOHP9EXLw
         k/NwLXKxVX2X62MtLCeZrCp/OkzfrkY4KpTB0Covd9wbMg1wVfTh1eNJiIX/afH83+xi
         9CrXqCnPBvw9rbNUx+vdPTt3ipOffzMEvCAutJInKhCzc0qZjz/mg+98g0yCoIgOOHO6
         /9UZVJ9fmQR9i8+391ybmqXDfsGkPDLgmPBLQKtvEvZTK5KjWoX7ScoeAp0GF24YG2OK
         z6Wcdbk8HVJQudb+ynmV4AHIO0UesZ0AlT7A9hgMU2Z+MubehAlAKoohpKgLjHLZTqbe
         nD0w==
X-Forwarded-Encrypted: i=1; AFNElJ+mtsWNAvE3GVrAH/fFT0P4cB2CiBF67wLUm5h0XfB2dFwqRIvUOU6QajvGsu0ZHGXmMeTHLbkESOnmJ6pYmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7JbowhZs3QRJaWrtlrs/mjkMNBGv9EK5Qe3aYZemxTMPZ97RL
	zzb0Pwh81nPAKr+4uEqV4uQPcS/Ayl/NIXYIr75la1ufgxDgc45p9cH4
X-Gm-Gg: AeBDiescsoTskWFEOox69wkVSLRUMF1gULg6qyCP5T1BW5knqMLX6Du9jRP9a+fdZPD
	sJrrRit4KCMrrsQKgXmjSwhokjoKa7bKOw7j5GPVAaKR8ikBOqOQS794HmRsJgb0ihPtUnkp3b5
	Q7kDXptzlWRLz8w3SdxYYSCIQfHb7Vbw0aUPM9Zm47rR6x0kR83dYbwLxiLi1faPqIDx8MQtmlL
	Q5M/zrhYQ9IcfaM9XP8dlbkGntnp1qPwZ9FoaPfHj1YYHE5sWRrQjM7wP9RaQ5K838n1A32FKkF
	Js+dCBjUNXH6R0lgDWcE/Xm4ME3SCgmWO92H8SuDKHdQ5r11r5OZfH7g0hlD8wd6SFSGVXSgsS6
	lAvs0/KS+80bWciSIvNwPPn/hWdKxxknG3JrY1SZXKaZiP5rXnrnrGUTRqnsFvvMye/fQ0nPSko
	dUnnZa/9vLAJMElJOf8LS/i51c4h24578681XtVq4YpFwwcvibH+s10FT23wEqVQ9VorUF8/baR
	WNaF8wB5hC2hYI=
X-Received: by 2002:a17:903:bd0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b5f9e8d873mr243196255ad.16.1777191774559;
        Sun, 26 Apr 2026 01:22:54 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0dafcsm284770165ad.52.2026.04.26.01.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:22:54 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dakr@kernel.org,
	aliceryhl@google.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	lina+kernel@asahilina.net,
	j@jananu.net,
	mkchauras@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH V1 1/2] rust/drm: import ARef from sync crate
Date: Sun, 26 Apr 2026 13:52:33 +0530
Message-ID: <20260426082234.2026908-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426082234.2026908-1-mkchauras@gmail.com>
References: <20260426082234.2026908-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARef is defined in sync and is getting used from types causing the
build to fail.

Fix this by using ARef from sync crate.

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/kernel/drm/gem/shmem.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index d025fb035195..50aa57bf78ca 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -19,8 +19,8 @@
     },
     error::to_result,
     prelude::*,
+    sync::aref::ARef,
     types::{
-        ARef,
         Opaque, //
     }, //
 };
-- 
2.53.0

