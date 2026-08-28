Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE2B30C156
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 01:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881936; cv=none; b=WHH3kRGOjRvdlB+NYopyikwQ4tupUIlQRq8R5EpdkP9NIsVvs9AozejOoioEF5g+la0lclumjMmzOu4+6dr8qzh6DdeoCFPgBiBZtZwhPR9vfZwXk+vhLCP+MH1ua9QwwKm95orP1Isx9y6MpHBYQPSaVvsXgqxawdC/K2nK3Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881936; c=relaxed/simple;
	bh=+5iO4dSAhEo3AZGC+XWiPNe2+jcuNGNmwtd8kiws88k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ea5EUztolfUo//T4UquIvCWk2ZZf9qONgJHs+g1qN3lm8Z27Bsznyp5lxGYEnIzRDT9GnyEB1CYS3SRoeBdkIPtulqGdEQ5Qf/6r0qF46ra+3bsOvSAU9B2X5pjR8YQ0+lKar3uyGblhgv6th+coE+YELtL0mUZZza0aPVfJ7jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTjRlxES; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTjRlxES"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso623620a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 18:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787881933; x=1788486733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNpC7rHp3pQpvORIwlLifm+Jt9USo4idXGhd8GPdBcU=;
        b=XTjRlxESul+sotZ4yxRUiUEQy1tz/rBqOmvHRlxKfpAE889cqwEM1cOv/5XOG9y3vK
         I0AYTxiFF3PIremn2BvZ+8SCfkogd4KW8OtuQXv8inuDdC/kVEaf7BVc7B3lwKuU6oC2
         v27/wd+UZWL9B7/crdVi1/aFFcTDBQRIj1CQEcQx8PtExZZnj7mbn2oXgjmZpizsEHcu
         8nNeWIYBrcd3xgWwWF0UCqdNfeS+gPvohjb3JbS989UnuNbcSLhrkOldUpOVLzoy6P+i
         52N+lOjw/ETaRRZ1KDTRLnW4vWOrc/dOD2uDxDLAG6puRUigNBRjz+FSiUtv9MPD6jea
         eGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881933; x=1788486733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNpC7rHp3pQpvORIwlLifm+Jt9USo4idXGhd8GPdBcU=;
        b=mmOC9r7Fi7Y48CH5Ms83+41vg/jZsPtOPXNzudo6W+CInSJmXWYTuM5P1DPyZg2KaL
         hHjWQbswR0M1lkFkqG0xeB4oDFdKlPkkCZ/MfsXkg1uiC12PGQ+pQN+9NZotDCOluz4j
         zFXhpcvudtrKEP/NYE3hbaMQgRW7IZ6RdJRxYfOd2S5VX037SecMqznt82dJNiXaIvD8
         KQcwV2v6iFA2BWVRfhvh9Vl0lgB1hDoyT2cBcqe/sJu8NHHZE5dekFV4vTP7Nugzr4xI
         5+v+ZXhg6qveH9Za5kVMVvSPfoM7inX+Z0+uE8FwK1JZY0qXlL5Ld/TsIbHSTa3F7BwB
         9QLA==
X-Gm-Message-State: AFuF++mBx7yN27lWVXXMaXnUFkH57lDYBo2HVbBuLObOf2LNFKaBbx0O
	JwYq8U9lxde09WTWbAgbqFBZ9boPoHjNJ8Zj5X8gOrlMAbtj5RtcEUe2
X-Gm-Gg: AR+sD10GHI++80HyAygPCLPVNknLWUCD0ikjXnzMzfm88BzqHQFyNG+ElqZ7uzzXFkG
	kCnnhrpUPBP0SkfdxBDEvrfwQl9IGXuSFP7V4EFQR4G2uhlQ9cs1JIpt09+mS2Z77+dUmftv/WP
	rqPUmmYfHEEATDyTyA3NVBuaol6QV8scLrIWD73l6QaKUUW0yDWQ/qvrBgqv3sxj6BEKK8RTsJZ
	sVgaJWNUxIuer5juBvMBJJGi6/TuCBs1jDr6qj7icb4OpKFmXYc6M75aJW1fB5OfU15NCXTZF4T
	OJeEjaifHXJf3ppS9zWdPdvzwL6revZdmYU66vbRGqEKWONDQPyPkq8agOGnwwL19YrGEzQOox4
	3FMjj4EcurcuCjwBm2ZbPEqh9gfL5W3ZWqZtdSKdj1mv92qyAXn88tOtJX6mFwYwAxENkB5N9qE
	ECpLVsQ1Zmdl+HLPDjWdJoXchkO7c+Y+36NUbAP8FYFcSqQ3hhnlcidzb48Fyxd7WsOqg=
X-Received: by 2002:a17:90b:1d83:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-396d1023217mr5133053a91.14.1787881933040;
        Thu, 27 Aug 2026 18:52:13 -0700 (PDT)
Received: from main ([176.237.234.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2316e21sm603674a91.2.2026.08.27.18.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:52:12 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v1 0/3] rust: add missing newlines in printing calls
Date: Fri, 28 Aug 2026 04:50:19 +0300
Message-ID: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds missing trailing newlines (`\n`) in Rust `pr_*!`
and `dev_*!` calls across sample drivers and documentation examples.

Missing newlines cause kernel log lines to not be properly terminated,
leading to unexpected concatenation of consecutive log messages.

Mehmet Koseoglu (3):
  rust: samples: add missing newlines in rust_print_main
  dma-mapping: rust: samples: add missing newline in rust_dma
  rust: io: register: add missing newline in doc example

 rust/kernel/io/register.rs      | 2 +-
 samples/rust/rust_dma.rs        | 2 +-
 samples/rust/rust_print_main.rs | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.55.0

