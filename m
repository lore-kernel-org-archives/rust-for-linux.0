Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C392FBE1D
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704311; cv=none; b=VPzAHEvyLEF0TXw8XSzDi9B8KVqxaNRlNN4eNl/CaAxueckLGG4xSVtgphHjtSRzzHlihjt0osErcatLz49nIS26tY/TC9axGDuZ5h+wmatVWlh07yiORGWycGVPhi+jy5quWwl2kZmqx6CfEDPqxdZ5BLJjlkaqQx7b2gdU8lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704311; c=relaxed/simple;
	bh=nvbW0QWOFExidYM4uyOd62M66wiG1d0ChmhDcn2ACYI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yi4kKnCaJZt+ESuiI0rLeZ5NpIIdydXTcIyhthTcDy/XkEYDugwgIfativ1uHd3x4NBchrrHnjgXIIy8bQHuwTpSDaT7zGCaICaulCDKKQBxmOuQ84Gg7RVu/x33+6rUlDC8MIoRwiRwKmdnkTb8zfww5LLoTWxkrhLH6a2bunE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4qcsjurW; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4qcsjurW"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477a1e2b372so53761695e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704308; x=1765309108; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iK7cooJExov2Az0ET9JrSCv5XSrP3ynKUu1nxAbf9pU=;
        b=4qcsjurWxtCJEwMf3NiRZpFgiflMAhxUF6Yh3tw6ipM06pp4gAK9roJWBAunQYmd/O
         w1szfu+qahdnpkXFvhow3nzGWFPkKH6oL4cKUTu53Q0Gv/VNre4j+sB0oHGXBnxM0Xon
         EZ1aKsf9LwD3CRizqW1BfkV3i8Oc3/gix0OxPOpR3rGPX6Mnr1ocTyF6725Yiz8RNQDm
         whaRucptIAI+2ocZNtigvQ9EEh6uCaTvJyGP6TYv9wE3U4i7XGg3tPOsfLBcOn6s+hZt
         SS7LQd3PjMXppc1JgK82qcRfme2KivXi12qz/ruCoI0xrQq0J4rbdxxnnnHSkFIIsmy8
         xHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704308; x=1765309108;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iK7cooJExov2Az0ET9JrSCv5XSrP3ynKUu1nxAbf9pU=;
        b=HvAgdgvxAa+JyA5Uhd9Rt0aZTle8qXU9pmGAyE7L1nGJnXn65yjxAKojLulgLRStia
         xAcQPQCCp2fzDCDdzIbhfv7M56IMaeYqt998WXukNUw/mFFqU/KQbqsIxzEuYeG5lMcl
         4xkDa8S+Y15dG0wYDkYD/Q69c25oJMaan+uVW+wj+xHw1Co+ymx5XmnX3mI4KIGKRByW
         Ouyp1/1cprEoRXrf72khtM4zjn14yJ2GcTh3V28dk+DxMnxD8v4bGXq6MA4/dnAFIVtc
         RGYEwaFSc7RhuBU+1xHHRZoSljvZdvfXhhXwf1IFsJRLDq/gMKaQU/rc4TR6d/7CVh9Z
         PtuQ==
X-Gm-Message-State: AOJu0YyHuNvKsUva1ZA9QRB4HetQ3grHvIZPRhz/oVcnrPCUTMVuhE2i
	JbgIagmBmm0IXq3dXrFs7VXpGTbmbcudNqLMjc6wxWCkh5CvUpFNux1ELOB2daqPQKmeGqUmVVo
	/0YZwBl1E5xPtAgjgi4YUvuKrzMf2yJUjt57ayhOzYnwUPRWygpu9hcS2vMbLYrI8kExHB7LJ7s
	XrJb5uqXQdr7srh5PSjDGkS2TmxPQldkR99NEf622Pexor8UrbHLkC2GbcSG+Hrow=
X-Google-Smtp-Source: AGHT+IEKca/QS3byD+XwtAWeEchgWZ+ng97qQ/iQwMflYGY9roKxMM+2AJ8845ksnMX8RnTVpyyXVSCFfPoD/DU=
X-Received: from wmlm20.prod.google.com ([2002:a7b:ca54:0:b0:477:9aa2:7d50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3553:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-477c0174840mr398619255e9.6.1764704307752;
 Tue, 02 Dec 2025 11:38:27 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:55 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=781; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=nvbW0QWOFExidYM4uyOd62M66wiG1d0ChmhDcn2ACYI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AKefbF0jpji5IQgI0uZCDEkYaQSFg1Ca0xj
 oJrfJexHDyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACgAKCRAEWL7uWMY5
 RrUlD/9sS/BIWMJk/cShbydrN4pnnCpz8LAtTrXvo8UF+2x1YSD2LKIm7n2EQ1BCIjnROTaYULo
 9bge96FWmhnbNfT8LAuq6RWbi0jLBb7JxR+TKAaWNQJF/YGezg61NwtvU9pDAeKx5lxQZX1PC4U
 OY6k7+FXoIXb7A+mIaD8UiFwuIBv5Z6keW8YTjJIqTLFYGklhkiUSspV54erX3soCHz+FHEbbWa
 O6016xu1ojsJoYIMQuy/FGNNj6D1llCnScse5YANAKjA1SX9zVQYHtngkmQ6l8+YPFAU4GEE6ko
 b64XtSGRuXnLPKDEJSjcffPdtrYLOMrPyz7ugm+tijzJf12TRmrtoSw2pSQkdpF1WzAxpWDVddv
 Vwu6fb7q+HpwTxHb89Ak6IrwhTOYXnB3Cn7jNQXP84wPfDloHrpbWFpBdXj7nvGYu+neDOLK4fg
 X63ofPfhAGxdU31fONNyJlxhNn+J3E9o+ODqRVN2rbpuMVy/fSMvDxT+ndDRPb7OTf/jL1qeJwD
 xJgbHXH1H+hzV3q2lNtj9SearDSC/PuxQy+wJS18CNFJ8+shkWTdWS0XcbF/+7flQTixyc9P66s
 uctlQhXeEyo3q/bcT8RDZgmr0WE7rhV2C0wTHv0/nNO9yKVqRPLjNBaCUGOo98knZMcR70HzG+9 iIwqejOFOYuqIQA==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-31-a2e13cbc17a6@google.com>
Subject: [PATCH 31/46] rust: property: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Remo Senekowitsch <remo@buenzli.dev>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/helpers/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/property.c b/rust/helpers/property.c
index 08f68e2dac4a983c06d84a72d56247f19333cae2..8fb9900533ef45e2ce2b21ac7b000ac3fe6291ab 100644
--- a/rust/helpers/property.c
+++ b/rust/helpers/property.c
@@ -2,7 +2,7 @@
 
 #include <linux/property.h>
 
-void rust_helper_fwnode_handle_put(struct fwnode_handle *fwnode)
+__rust_helper void rust_helper_fwnode_handle_put(struct fwnode_handle *fwnode)
 {
 	fwnode_handle_put(fwnode);
 }

-- 
2.52.0.158.g65b55ccf14-goog

