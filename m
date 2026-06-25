Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC417332EC1
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 20:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420774; cv=none; b=Bc5wVlbc96VBz9W+cyfcwxo6zwcJW8/CHXxyxe/UTho3RatJo2beK3at0RM3Z+0cB9z6DKN3nhTKH8oyjkYBR5YfRLEDxaIA7eEAdof5zavcBTw0/4e/5F4SMizaOITS9aPdSshnfMLzfiqovXW0fr8XkNALJ12v+ZsZ45Y4xDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420774; c=relaxed/simple;
	bh=D32koSWvgoGvKS8jYYXh314Q9RalPXe3O5ZeUWipDO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BOXeva4X5LTXvJvBhAdFhdqw7f2zpWbh7t0IKacBQbSLnMS1yIwrZ8b8KqfQfZ7D7VHtgNIveoTb/P4Vm+vwy4B5E9dZ2J0zh4nnZwmySvWqe6k619lsPyigwSFUhGsgEpn8smL8ZcbcyC9qZqAfoq/OkgcLL5lkpTqTy8fYSCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=UjCASfa9; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="UjCASfa9"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30bc806fcf8so403269eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 13:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420772; x=1783025572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90Bh++27PWYhH7a1Hqb3PFYlIq7kRvjS/VwtSAfZ+kU=;
        b=UjCASfa9jGEedxFtTLnYj5nBa0QgMj/rQdka3gyOLWL4ab4pJlBZ4GXppEGb9z/Cyv
         7GUHsAQtnRh4e0+RRKcR6r9YX4PrPizJYBi9smaHteCVVlW9bFmOEib3UTrUTPi6lcgh
         TZAz55pVr8ViURctV3SISiN6F+R02NDaJbx2b3XGNyFJbb4+p1olgEdy3e8CuaCms5iK
         Ne/cPc3HPo29ATsmMixX5plIwPqbcXB6d4HTGU+LWmLuD/rxgPXmy3Pukqt3/TOChM+d
         QT9GBXgyIQBPNGHA3SaHMaMntQ7hxOYfrXQcYygzVjzSUCl+fdlxefmOD7JVICQY7lL6
         Hz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420772; x=1783025572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=90Bh++27PWYhH7a1Hqb3PFYlIq7kRvjS/VwtSAfZ+kU=;
        b=BHztTnz30/1J0DW3K6fMD4uwdcARkXq+kQVDFZ/bZkOfyCc3uBZahse01uOdNPbJvL
         xfu0acfqk4OjHSThs/KuDmspNISxx7HszGpMoDWuSd+mcf0fgnNl5l4KwtsGuC/b4NrC
         +2G56P7STaWUBXhZ1rRpKwpfSG31anTJm4kdC6+erDEM/pIbtSto6xphF+nJlX/dnzmo
         CjsnPb3dGg/zpjq8rKhpCrw2riTX6WBEfYxHYY3NFq5RXEJRvQwDNMfgXuNwCx3StApR
         EFFOeyY/B0xLI09maXSquQKhp/AokF6AvdCF30Iq854uvOuhUb+9nIfNn+/Iv/CMyKUG
         GRuA==
X-Forwarded-Encrypted: i=1; AHgh+Rrcvcf6Csqogxp9QLACy+Vf08oln1EGIq8uhPhH+UxSantiOLbfKGP8ZfWMw5Xqta/Ixqn75byi9OZNbHINpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBqA2371M4lHuNgtGBoZBSmXWLcBqzwfyQQfFg0jNjbhAfrhU1
	lHq2Iqps20EtYau+7VdpMKRtzazHP3LIz7l5Te7qY9gXO8KrXgW+Zlk2sFe6GX72sic=
X-Gm-Gg: AfdE7ckSpVvvif+vdgTYuhJxgUkmhYSF3X0OyEsv7o7+qDsl8YNCSclMMtdgPkgtLNP
	lIPlDgb+FZDrZ/dfwOaqKdKj8uIhVP9+cznwrfzWByZREb6dzeLke0D5PkRpPUxqFw6bjEWJuQG
	nbZ560J/DhklT2sNYqIVlttqkE9gtUrT53fAyWN/rcvFFlZDMHE7gjNLFlhh9UmxOVRwbgl6SOo
	mYMlyfCIgNLzDUOoYoC4X3GE0H7SNBGRwNr6yt/LxteeOIT/ecB9VKu4f7psd+g9iOjL6lG4S7p
	wobRt37xxLk3hgjo/7dC9Z3/DGY3tQwDGSl84xRtAC9x9FDwmzj1aXPbly++joBFACrxNXiMQt6
	G6Wc/Kn2Jqcj2IKJZ3kizeWUxRI5WGJpC7cCrNiLN4RcnfHRKHqmp6CnU1j/+SwFhT80YWG3K0N
	x2roUYZZiLc+HzLfwxteXuQfUHVA==
X-Received: by 2002:a05:7301:9c95:b0:304:e587:5063 with SMTP id 5a478bee46e88-30c84b6f548mr4769384eec.12.1782420771923;
        Thu, 25 Jun 2026 13:52:51 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:51 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	nova-gpu@lists.linux.dev
Cc: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH 7/7] drm/nova: remove unused trait in commands.rs
Date: Thu, 25 Jun 2026 17:51:46 -0300
Message-Id: <20260625205146.5047-8-niyudi.honda@usp.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625205146.5047-1-niyudi.honda@usp.br>
References: <20260625205146.5047-1-niyudi.honda@usp.br>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>

In gsp/commands.rs, remove unused `transmute::FromBytes` implementation.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/gsp/commands.rs | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index f84de9f4f045..a3c0b7fa3b9e 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -12,10 +12,7 @@
     device,
     pci,
     prelude::*,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    }, //
+    transmute::AsBytes//
 };
 
 use crate::{
@@ -149,10 +146,6 @@ fn init_variable_payload(
 /// Message type for GSP initialization done notification.
 struct GspInitDone;
 
-// SAFETY: `GspInitDone` is a zero-sized type with no bytes, therefore it
-// trivially has no uninitialized bytes.
-unsafe impl FromBytes for GspInitDone {}
-
 impl MessageFromGsp for GspInitDone {
     const FUNCTION: MsgFunction = MsgFunction::GspInitDone;
     type InitError = Infallible;
-- 
2.34.1

