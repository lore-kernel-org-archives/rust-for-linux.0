Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006B52F6928
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704303; cv=none; b=NEJ+cDI3Y5/O4JSnc8ypuJuPO9B+Kc0Q0llpHIGtJPiomy3TJJF1t/GuZ4vjLxfGxvXwbxnKyWpSVg5BX8KFYnzdSVdvvm96UC3r5ZLOtlKWtnQ53s79NQ4WTtFrwC69Mgadrh2SIMeIe1pVhTX6g1svLf149jhKFWyzGX4cMW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704303; c=relaxed/simple;
	bh=Lu5/2dkCBekMOnFjfAtPefEM4sDqyp5zFvk+JuEa/DA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dunQfenZtyPo63OwG+FPlYECN9Scf6Ja8gGCow6xb9oGrdY199d8QHBLgHSe8BhnxKPIvfaZMV0y4GWudVpcEmTPw1DjultcBPXYVrA05UsAUP7EpMEXweQxXOMWi3LzEnl5WXO5oaea+UXmn3Vy3h4sOfyLINWDWAN5ZDf68Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T/n4pfrn; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T/n4pfrn"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47775585257so41063375e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704300; x=1765309100; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X7h6JfaQinSsVoRNGKp5y99NtfYL+hb5SKedwfR4azw=;
        b=T/n4pfrnZUjkDAzlKpPvmKqSgLkW0EJDXbBAUg7h4plzkmQbjtaR2kMKdj82JUSIRc
         5YczFSRkOlRzeQsrdH4V7i11ahvv6tP1w7saILahe0ytyIXopSt3FSnaMUsI3pXlIGE3
         1AYFHaD6UlPrIbqLZa6CckrUwKRQawCh4lB6MV14r0ZUZ6TSBGPVSeFU6ZhG0pPmdhl6
         kshGFw/nLl02rM4g4nQFDLqEe8rnRlffwXKH32AUd00mn8XX27DutCVycBB64lLokyGK
         5L/4AnW9U52AqFm1s3KS6eevTvPLmrIiTJ/1CZqfHXW69R8WbFM54M3nGo1jGbc8FKMN
         aNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704300; x=1765309100;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7h6JfaQinSsVoRNGKp5y99NtfYL+hb5SKedwfR4azw=;
        b=isvp+TKYHN3qq6MwtafVXpK4bmLalonM7rSYmUhfS21YMleDpIeJXUQ3sGP2hsuvTz
         oHXsBXDW8cz6euNitTvlcf31MVoANXbXyg74MMVn3iD+zqF2aho2Oi8VflK3J5G1R5Q8
         lrKTpy1nW7LqiN+vh/2jLNkAG86P2LFH2aDCLHtL0JCfd9mbqmVSNwA5HICZ9KUM4slR
         tlsG9tFSoDIwv2rhJRKwxqUoGxRBIUTdCo6BuuXj60GdrFFepXA4wXxS+q4TBDA69Eb4
         X+cl9/QHpxWbFtOgCgsJtcARbp2dUej/F2ttC6OtsA1ud898SPB9/m6czXBFUkFHHgRU
         BODw==
X-Gm-Message-State: AOJu0Yxfw1PvOfgvjNnX4yqQgXhNsd+Ok3APNJaKE8nd7tUJN34XIUL+
	2X1ZjGCWOzchS1TfXNRfMHvktm5QiPdh46MpF300cYH+jDIwYeS+OmtOrr3v7WPMhzC42Bj3L5d
	NeFhQgtATehDh4qA0LpX/QwHIbj70nmUBBz8+GG+kY6xFMPeemUFXE8ZzJf9AQdKI8o8D9//SML
	FbbBDr80ZHy+L+sABc9WdOlWc55Si4wwPqhF9ZFpMSyAfeLoUUOYA6+7Jg3eGCQSA=
X-Google-Smtp-Source: AGHT+IF470EvqzkQvtaq+IbBhM9Cb35wltaRH3yorsMqKH5J+qIBD8RPwyfg8j+Z+GJGoe0mjXwPUH/cER1xfmY=
X-Received: from wmpv21.prod.google.com ([2002:a05:600c:4d95:b0:477:a480:b38])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:444b:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-4792a4b8c51mr8092885e9.0.1764704300016;
 Tue, 02 Dec 2025 11:38:20 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:49 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=772; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Lu5/2dkCBekMOnFjfAtPefEM4sDqyp5zFvk+JuEa/DA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AJDW4Ic6TkaUrfsfwk62CHeR8GDaGxtm2eE
 OevQCMXARaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACQAKCRAEWL7uWMY5
 RtRVEACnD2Qh/Xn2QyWvQqpvzNqrjwA6t40ohXHM8XqIOyHQTAU0PgW34zFFG3mx8tUrjNUvkhc
 Au4QjJM1QQ+EMpEj53c2oVbbGTwNgxSXh9kzOLx1knFy4NjIjmasB2f6/2b2a00OeARRSrTJHqV
 u4DzmRscHMR3frRZ6L5+JJUH6QWBBxKf2UpBKune7BA+HNRp4IH+JULFPtfZrWAV+in+iaxmE0l
 QRR0P5+MkmTUGrbInO2vW+HWDrVNnCAi15P1IeJTVOWBm72VxE4FCQObXoT5YbaUpADvGu5bRBs
 Q3LEgIsdyPXO1upffHJyaIkgQ9omam29AzMDE385vDn78TXsGXv1O3bb8rfTXw0FuFHf1/VdLq8
 Cq/gsF/qis7pTpyDB49YDHGFpe08ZOXu9iu+lsQKxFkqy4hlo5U7u2OGCk6sA4glW2+bT2yVjrB
 rSO3mlNTvqyelmW9Oo1HKy3sR1+LPHoG0lvzabTrRxD2ghycnOW85yn9320lQtUWmb8nQPCIEtV
 ymP4VezENQ3q9x69QfChIO5Yeux0pnNGW+VvFnEKLKnRkTRasdcA1UWhvaydZi8+lRNFC4MlRak
 fon1vNXPjX49oniZqbiNvia2ilfLtoKqtA2jWMHJbuKLcHQV6rGqlgoFGJDNohCiOsX0sWeKGw1 HjjLIcMtAz/jrqg==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-25-a2e13cbc17a6@google.com>
Subject: [PATCH 25/46] rust: of: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: devicetree@vger.kernel.org
---
 rust/helpers/of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/of.c b/rust/helpers/of.c
index 86b51167c913f96b626e55adb51bdac2a9f04f56..8f62ca69e8ba54098343dcef77f5e82e5a3bf497 100644
--- a/rust/helpers/of.c
+++ b/rust/helpers/of.c
@@ -2,7 +2,7 @@
 
 #include <linux/of.h>
 
-bool rust_helper_is_of_node(const struct fwnode_handle *fwnode)
+__rust_helper bool rust_helper_is_of_node(const struct fwnode_handle *fwnode)
 {
 	return is_of_node(fwnode);
 }

-- 
2.52.0.158.g65b55ccf14-goog

