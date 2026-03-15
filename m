Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1514A37756B
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595678; cv=none; b=UiXDlgLXQ8TkXAJj3uCWgtx791pikNGcxcnrgemZ/JPtWLvLg9qSeUjD9eikOqwEaNslr4Iosgl4AaeocovYnNnMMswB2wX0CmBTTIV5MOrYJTCBvEalSf7/CI04f0TRhmZAr3YXvN1pON5V+aRFMNjXlLXe2F5Ws11JlQidbMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595678; c=relaxed/simple;
	bh=3xFqNDbANLuxYwJZCL+0J4Zy2U0siwNrORG2I8A78Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lr6QGrLagv8TEeRu+HjVwFjuznnne0pItrXRA+ZOaVv4WOP5u/nHn74B4GwpsY4aQFhJ1ZcmcCAGT32OqVUBsbsE2TvN4bRv04F9nKY+rhO4tR+oL1bELC6W303WkPclUfxeGVgqJB4wp3lGK8MyzJi2d9U4FLg7SYUtr00uTJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARu4y2Gm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARu4y2Gm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so29704445e9.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 10:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595675; x=1774200475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBtR9VKnPKJgjfwnbtGvinYVj4EmpVw+ixE7+VzQpDU=;
        b=ARu4y2GmG8QpEa86w6wV6HozJ+IePGtzrgO8f2Cyo5k5GRcYQNuJPtlF+s3R/QjVs9
         qq0h8HIz8Hl+kKZG8q+UVAOAiggVhGAA56fT5Lxcvg8RTWszZcEBVFYEawgyy3bAtCCW
         kLVh0XwZ+N6z7U7yhUF/UQ0qzDiUl5QUnmeWgqdTtjIgppV9nxyVZUpb5T//OR2mUFvG
         xQJvpDXPsIyJCejURnU2cAiDA7Sddfh40zilghcy4OZJ1GovOXbu7NHo6l9Q4P3XIAGD
         ZGfmG/xfhA0hde6hAXbQq8wlI2kWPxDudCEaO5Up1Ahfc9QgsgUHjsLmCjC4sfg/LnhG
         JFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595675; x=1774200475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBtR9VKnPKJgjfwnbtGvinYVj4EmpVw+ixE7+VzQpDU=;
        b=G+0FM5q1OTBMfWx0Hx1tbFxaw89qAU8qUPxk1seu9GMEYmdms9w/17KntlCSh0euY/
         m82hrLUin6x2ue+7lnkIRpamjA5rTFaY/ZkB4VVPwsKAefb6fKlwWFPU/DOv6sZzDp1Q
         uBYp7aDNe39uthOvZscSziuu2nH9VHzrgw7h0/OXAc3y7uCEZzSK59hI36AIkwUPB/MX
         k/nECXFrX2t4SxWHITb1l5xjHmo2SJqo8hI7ABOlR6JaWO/6uu4KqWfWGVTk4Pet00Iu
         d7cHbEFJDkhZIffwCcBko2ahFTeV4DSPav6Uni8WzE1ojZZsM6Rn//m2plA6WcnipIYt
         froA==
X-Forwarded-Encrypted: i=1; AJvYcCUiqMIYf+53Ni63q7IJfRlem7BLJCEcv73M3mj2+4w+7u7PQzBdFwskhvWIrB7Pttu80MjCyxciY0HcuRce1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCD5W1mOQ+/6egEwgl19EwgOZvZcYOwtTdpuk7XQDHe50LCwOR
	w8hYdgMBppCrYtCzXgm2K/n3/X+H//VobK4N3JhK5v8a+Dp5htEedj52
X-Gm-Gg: ATEYQzzPxkFj0N5hHM7rkim5uQY62WjiS80NJhF2YlqushpItbw/IV6BPQ2CuLDZAiU
	FU82ZrUOv1h7b4Lnw/ZIlnBDhIyGxuLwqAOOToyeJ63+aZdfa7M6w5cX5sLUWH3Sb7c/TGRlo1L
	LHKhKQvVR0po7EgMNATuPS64RZajnwDaOzD6MwNYSoLnFV5eDLfPQfqY+8ZJcjZTFsdJs0KRV96
	bTTDatb7Jd8Ktxv5PGq53XGG6EcoxhdHwbBFSmGXEn32AkIGDqcAT++sWeZCP15t1vqP04zkav/
	dm1vPggIFmh2vO6iNSveBp8++ACc7DLiDjOKTaariKQZdWJDy+cYQ1UXx5CNxrTTEKWJFwhVrAR
	Uo/Se/UKSHCx6z7anQsBrFC51TwCIRXESkXl34fGWQMxQN+ypYmULZcA5I0lMmqi2RUINgeFgLg
	lWfT3svonjHZEjcc7YNlsXjOBoA2qcysrI540=
X-Received: by 2002:a05:600c:1395:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-4855670b72fmr170714095e9.27.1773595675367;
        Sun, 15 Mar 2026 10:27:55 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6586csm73644905e9.20.2026.03.15.10.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:27:54 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 1/3] wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity
Date: Sun, 15 Mar 2026 18:26:38 +0100
Message-ID: <20260315172746.270734-2-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
References: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement a balanced RSS queue distribution by skipping CPU0 for
high-rate MSI-X interrupts when multiple CPUs are online. This reduces
contention with system housekeeping tasks on the boot core and improves
overall throughput.

Signed-off-by: Adrián García Casado <adriangarciacicuelo@gmail.com>
---
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
index 4560d92d7..87149f29e 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
@@ -1683,7 +1683,17 @@ static void iwl_pcie_irq_set_affinity(struct iwl_trans *trans,
 		 * Get the cpu prior to the place to search
 		 * (i.e. return will be > i - 1).
 		 */
+		/*
+		 * Balanced distribution: skip CPU0 for high-rate RSS queues
+		 * to avoid contention with system housekeeping.
+		 */
 		cpu = cpumask_next(i - offset, cpu_online_mask);
+		if (cpu >= nr_cpu_ids)
+			cpu = cpumask_first(cpu_online_mask);
+
+		if (cpu == 0 && num_online_cpus() > 1)
+			cpu = cpumask_next(0, cpu_online_mask);
+
 		cpumask_set_cpu(cpu, &trans_pcie->affinity_mask[i]);
 		ret = irq_set_affinity_hint(trans_pcie->msix_entries[i].vector,
 					    &trans_pcie->affinity_mask[i]);
-- 
2.47.3

