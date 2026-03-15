Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B1837646A
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 17:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595519; cv=none; b=mhV+G260vyfo/LmSAi62PSmJPB//Q1DTfU8WEHR16WUDmtPIGvH4Mo4Qkf6H/4Q64W7rA4NybKi4E5uFDjcpc5LdtMpIxDTOiZkdZI1xgCwv2ZdZ+3y0RJT/URkldzH+/jcc0rCW/yYVwLzBg73JfepLWVTeYSueSLo8dfaoohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595519; c=relaxed/simple;
	bh=xR1aQtJyjOGsb3F8bKi8GxD9ZWQvMlCBKAMwTQealv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNdakRhuLtcEAeEbARP7xP5kscXDle2mqT1AZClif6SGt1sEs32fbO0eNh7iw+shLPQwLjNcwP5XMauWQO10AuLNkaDb+DnXHAe+3tTS3PYceBPwihBBsdsPUutVJFHmLDGRrk6X+W1+g/t47aNUT1ksqlbOCRQfxBpan+PS+24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrTq3SzD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrTq3SzD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b790af67so3617313f8f.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 10:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595516; x=1774200316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eNrBLnJJHbmPI7WkNJ6vq9A1HMj64DfR2iaRW7E89k=;
        b=DrTq3SzDwgDX0a37RPo6o/lql3oPGAHO2S+yv8kxsp3a6YtYN75Qt4fbVaKpwslDg7
         XGsRTLLBEDbauK8VtRwI19GKKIXr7AEqg0rH0xGIrvLQlgeoH9An9p4PPWi/+1E+NW2w
         NEeBbitW+XIQYxmMZXuZVaJHfZpqwlGf5ug5hWJ205vFrXLIj/SzNOTwIbvYE3z7jccj
         6X45KrVmz9wR1it9QgWo0tzDreXyPaiTcxwYwyUVNbZvs5VhRLcbXLk22emHCdCv4QeB
         s96r9tNhj9S0pMTsijrsq6ZvkTAukUjV5L5R6PLDOSCek9THJr/L2hRqJdyhg8CPwrGB
         80ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595516; x=1774200316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2eNrBLnJJHbmPI7WkNJ6vq9A1HMj64DfR2iaRW7E89k=;
        b=r9W6DWDzAn4+XcU6Y+gQ72y/JwIZNXgynCIGsi7SeaRVZw+jo7FsVSV0uBQ4uKBMuR
         0xcgT8GNPgvWSFl6NE8F3OJ/f0s4m8NmnLfH+tAn/5qMMwGDj7vl5obiIKP+PmeVkV2f
         zPeoKn3+vf83zUPlg/C6DYeUgMEA6asS72Cakwn2kH8tV4PATtV5f+9oSCZz2fpF2Gf0
         lR9A3wFRiyqpXBI30JB4WIakU8N9q3ws1Znkwl4AVq35v9AFv0CXyTt/1FifnaGbQ3nQ
         N2UOsZC2/Ch7DQgncB6ilQnUFXwXqSLRaWcZiWU7gZIHYd6vJPWUKmQ2Czh4VfWEZhb4
         IfwA==
X-Forwarded-Encrypted: i=1; AJvYcCUeLiB3p56++tVx8I6xLTdQmfnRLusRY3qhB1DGiqRNJhZ+ADS96OraWEWJOA1eNu/XXLOQcUKhC3i6nowrtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl9BRre1irLCboFILA3u0bnZdktz7TvV9mKx1yO+tkQa7o/EOL
	2cHHZygL0VgwkLy+hQJJE2QmEt+K8O7MmuJLxFkwJBba6ooMmfK98Ma1
X-Gm-Gg: ATEYQzxBENmx598FC9PYO2l3BANFEg1F9ayG5TMukcfaZ9fb7EozLpwNZAtlAJBtsSk
	J/fywzd/YevZhXLXbtFB3vou+wQ+DLasIYw+jk76sKVAepJG4llOuQHGRuRw8q/jiUDH4wvALrh
	0Pg09jJlMxkOtvYYdHjotlBHMsqDSRucovoUsFwrbI6fGgDvEZ/WRZw2ANGRzz354Q/nBDcwA5r
	i3voX79KG9D0zBFka3CmqnkeXr3LAN672Hq9wZUqGrVn8KY2lg4o7WUdizGDt3kHUmdGb922tRI
	PfVS8N+jUmVQfZy8RCo28dB4+5fk5pE43qTMstBuhMSuVQ9oXg4T4gP3QGcX8/b14sUMcYeXDOJ
	5eA94PqT7+Rdsv1OwSFe2NThefwEy7m11WWAJcFG91Iugvtrwx1kawd1AiK6Csrv7wqolbnGd10
	ZCqd2PXJeeVR56h1PPCJ775cI33ZwQsD0oaXM=
X-Received: by 2002:a05:600c:8b28:b0:485:3c11:de84 with SMTP id 5b1f17b1804b1-48555b47ac7mr165571005e9.14.1773595515543;
        Sun, 15 Mar 2026 10:25:15 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm457168325e9.3.2026.03.15.10.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:25:15 -0700 (PDT)
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
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 1/3] wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity
Date: Sun, 15 Mar 2026 18:25:05 +0100
Message-ID: <20260315172507.270480-2-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
References: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement a balanced RSS queue distribution by skipping CPU0 for
high-rate MSI-X interrupts when multiple CPUs are online. This reduces
contention with system housekeeping tasks on the boot core and improves
overall throughput.

Signed-off-by: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
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

