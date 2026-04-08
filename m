Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3493D3323
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656849; cv=none; b=fY2m3t20CLBbrYb99RRAusKL6CihX7hQegF4xS5IhdmW90L0e1330C4Svv+ytCbIYCt+cruCvK3u2uDcSXpV7KYIf9u9oEqb8AmlpnrlGJ0mDcIy+xYzXqbHRrcQuzVuNyX66I99nVLsJ+TH2nYcIdrGbRMuQ1TJKtYNqQNABic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656849; c=relaxed/simple;
	bh=9tIRZ7wtaK7vVXlVitnVin2aqh2a4oFAewRMzOPu3io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHzXUXNM6juY9TWb0vL4ilPIH308gqkqChJbH6Dd4UGi70RDGlh76xRjXvfgUUrLNmHVaa0bfGxHsh3+s25o2JsrBfVOnZOzjWhDADxf36CwqUGbxHhSD2nFlB6mV6EB2+hAV+8OmRfB+YZ4y8t6lPcv6ZSG39rVU3p5idal+h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=BLapcAMZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="BLapcAMZ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2adff872068so30175015ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 07:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1775656848; x=1776261648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z26SDW5ZIR+r/lzeAq39TL8dqU+dlFU+cqs8ZAl7ag4=;
        b=BLapcAMZd/6hlxtqClOfZnV9LMlU2G2gvv2UC8HuQWQ6BVk5aBVKpzHLaQ56+s/Xvs
         ERK8jN4PQhHc1GKcJHdRGeGma9D4Zesd0CVOwc2q69SSvIOA+PTSWdjOArd+5vW9dH5Y
         l/wQLO4R7ejwPWGO5HOqbycAX8wPMKKcJ5xjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656848; x=1776261648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z26SDW5ZIR+r/lzeAq39TL8dqU+dlFU+cqs8ZAl7ag4=;
        b=UQii7iRhfFHLDFUn9NpMSBbUR2e6Nu/ZNjA/ggyebv+ZiSTU0Y8AMmUWreREkexL1b
         9PtZy5LaD5iFnp+JfqVpX+qN0rOgTd9vXBGxqWduJE2gn1psIK+tRBkr4VpoOCAsRLaB
         z6YzMTmbBp7naPYHp6ZeYCSx8tx9thD6rGSoq9ohvel6lBYrB1MEDl5WlSb7OkTI74y7
         VWEc7y2PMFqbvJykH3oqTs0Rwx3/U7j1qGyowAnkRnhwMADtP2VIhwBcygySAaOhlcSR
         a6Gbni9qLBGVu75MBPA5+lZjWj10yajPElGapla5tRve1Mp19kYi69NOCMCxqJsYejcA
         ofDw==
X-Forwarded-Encrypted: i=1; AJvYcCXWQk0uxjnw+kVJnSr61DV67Rkrtwh523H3CJaY52eb68LuWHKnr5PyiOgBKE9qdK8yzWFVwcAAfdalvfdu7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjHZYqJS1nP+TxvK1dgwR3qqpKkfAwBumX3zFBb2jM4JkP9O7X
	f7ErAgzPC7ZCuVzgVYhmEvZ5/X++H8Kaf/drPF7YZrAcT68DbSpzHHm9msCsLM+irp0=
X-Gm-Gg: AeBDiev6Gl4vLaGS0cqKZq9uiZq8vTMz1ZWW4NsG0B2H7WXXoUAqbIp6p1o1dpqrfdF
	TsNpiYz9bZJ5hrzuXkNGcDY9muhN8VrQvlr1wj37pGFXF682j3X61l0v4u/nvyxEOpKoNK0KyJT
	kdtR5xCilUEJejmG0qR8RsfKbKI0kuExmSDxD3Rome8REPp2MZM+ODr7CWLYKuTFt5r7gm7Gnyl
	ieM41ANiRy8iN29L56uga4tf4EE0Kk8EdVRBOFF7HmirqAwS22/hHzfp5H2fn28aRMD9EKd9BIC
	xgaQT+64S3vvXgRj5FYPM53khJVctjmp3u8pFHJrcETn7fsCkq2zn/FoUJ8L5KE3Wk5zgnkD/KR
	2563YJwgaNDh4ZbCAgS+54aY1vA/NTSNm1rkXJA91ZNvXEildx/LIpTlE2P1pM1yLXPy7UjwSiV
	agmbTknOFb52fN/UHBWsLS3EKQ5wah5X2iZSA5IVOWFehrYPPTGkUGl2hxDhMnzvbiZF1FtA==
X-Received: by 2002:a17:903:2c0d:b0:2b2:6cab:313c with SMTP id d9443c01a7336-2b281831e94mr231509005ad.20.1775656847482;
        Wed, 08 Apr 2026 07:00:47 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747612b7sm204465145ad.23.2026.04.08.07.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:00:46 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v4 2/5] io_uring/cmd: zero-init pdu in io_uring_cmd_prep() to avoid UB
Date: Wed,  8 Apr 2026 13:59:59 +0000
Message-ID: <20260408140007.8401-3-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408140007.8401-1-sidong.yang@furiosa.ai>
References: <20260408140007.8401-1-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pdu field in io_uring_cmd may contain stale data when a request
object is recycled from the slab cache. Accessing uninitialized or
garbage memory can lead to undefined behavior in users of the pdu.

Ensure the pdu buffer is cleared during io_uring_cmd_prep() so that
each command starts from a well-defined state. This avoids exposing
uninitialized memory and prevents potential misinterpretation of data
from previous requests.

No functional change is intended other than guaranteeing that pdu is
always zero-initialized before use.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 io_uring/uring_cmd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index ee7b49f47cb5..fa3a6f832460 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -209,6 +209,7 @@ int io_uring_cmd_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (!ac)
 		return -ENOMEM;
 	ioucmd->sqe = sqe;
+	memset(&ioucmd->pdu, 0, sizeof(ioucmd->pdu));
 	return 0;
 }
 
-- 
2.43.0

