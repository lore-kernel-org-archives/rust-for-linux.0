Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EF4323416
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 01:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881962; cv=none; b=Y/40C95Zoa0LW5G84YSXZN5ROXSQNw/KkHSSlFhugmYAnQLAjRWN9SK4ZANl0Z1crnRWKGhQMUl7e7cUlhPeca/FESsy/0mQ/pKxWdTD0h/1AOdKlsfzJcL4sKftitEPsxVSEv4IX5h0lWE/FB8LavoRDmbzJ1IfCcTi5b1DH9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881962; c=relaxed/simple;
	bh=q30dBEXeI8fNqG2Fhm0SNCEmhwHt3HVvGwgctzlo228=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7vvKFhI7evl3XV0xKDoDQp56fG9MUrlYviKJqwQMmw8Giu6GR0AWMsyz6fn3j0zrfTy23g/NLq2PkjMruWNk2o9qq+rrt+CqbF9uRxub4bHXvtqhVU2kxLdcoO0K/ozO75Hn6+yQAOUcXNPezLAqLVz8zi7HXKfVg7kWjoi59I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtDQKBQw; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtDQKBQw"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-396b3d0df94so631571a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 18:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787881952; x=1788486752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zu+RxARiDBgW38W1dKFU7cEtIABJ2qMEIV7Sy1U5J70=;
        b=CtDQKBQway7O8JDGegWRU+z3RNVcIOCv3ZIqI1tnxPRH5BvzUfVoKE9slMLB5kFhXi
         oBIybkX4/cMH8z1gHQhoqeSwWta5kR+fraPfq1HTaHiEjQsfuJO4Xq71N6MD/LM1LVob
         RFeU3x/DoAv3bsM2qMkEagZmblTn+UokZobmqFtX1OB7HI/LK1zXvEtt834q9NQoVsal
         naPRc/RcBDKNSq8CYyiL6pHNIf15SzFxoRxc8UKz6/w/dLPsrdiP+j4+ckiH3u7P4qYp
         g/KSvQiOBkHFGc7qveGOQ5VTZQZ/XxosakU/I8x6yTAInFKD8D47cg4IMFuqsKFZPrr1
         uRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881952; x=1788486752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zu+RxARiDBgW38W1dKFU7cEtIABJ2qMEIV7Sy1U5J70=;
        b=nEd3DxaDh/dNdDHCveDTwaw0U6zAlhbrd5daEwyiTQ8G55EbxfOPU3EQZySvSok1Ju
         4peEbmDYie7OoGYLEbALoizx25UNb137O2z6e/5WXYbrdFIcmbZ+MEJJ5Ceh2N4y0eI+
         dTTeNEm+D2L98MvxQo85nfJn1tCflbLcQLqzGWnDDakR7rAUnEkUBeSg0DJhrEus8lbe
         jgaZsKdd/FkzKVBX438OJyj8zXNDTEYXAQxZYjTDYgVjt81np+xy0jZPRBGObgVjMHk/
         3boNvZU+LowjHOgaE1LAnIgc5FnncoQPAc27sne3dNZSPHJfBrwOQCONkAQPPHU3BEGU
         Yftw==
X-Gm-Message-State: AFuF++nQ0+eoxpJkEoeRkU6QNQmYxsuw5PZrfyiB+qyKVrwfCUXfimcA
	zNLzZFz4SVHHDlwq01uRGfXdd2YppGhMk2AAE8mni0cdwI4Edb5Iiybc
X-Gm-Gg: AR+sD12h53IiNbDnol9IkJm39F/pz1flwMTEV9cU9UYg8Y3GjA/5iMC7pb/tX1//ul4
	SNlRTXXqBcFOjCnXeL975KlrvGB+CB/l3VeBbSsdQPnASERWVDwA8pFJKZZidjqLI79CnYQIzgA
	FOt2MYqWuVF8NaIBtOJ7z1W87KyBT2ZqVOyJkcLDsWILh2AMu+5OdtOTAwDDwOdXEKz0j1ACveB
	2vFdTCLjsz2FZbVr4ShzY5hy2DQPNW5NVCJNLRyuoSKPH5ajwqxGkY1ujunYg58TqEVETtzwtHS
	dT+QEqrb27Sf0FyqIs3oMj2oMtZg8FTrCqOzcXoS5m8vngkPjpmdFOdfxlSCdgFQPd96iDPh8Rd
	6I0y0wg6IO2k31e7XCsk6HSXhK4E7+Aw32mkP8KFrbyhJZWpm+eFX38FmUXaXeMGjtO08QNy9qL
	IH4/nEHHCdLMwC8Blad8Mcc0//9k1D73PvG4y4fpmQxTFLLXJHDzqbLrqFA7VuxhmhNIWqkEbH/
	Ifidg==
X-Received: by 2002:a17:90b:1a8c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-396d0c0ffb5mr6224769a91.0.1787881952077;
        Thu, 27 Aug 2026 18:52:32 -0700 (PDT)
Received: from main ([176.237.234.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2316e21sm603674a91.2.2026.08.27.18.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:52:31 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v1 3/3] rust: io: register: add missing newline in doc example
Date: Fri, 28 Aug 2026 04:50:22 +0300
Message-ID: <20260828015148.221737-4-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `pr_info!` call in the register module documentation code example
is missing a trailing newline.

Add the missing `\n` to the format string.

Fixes: 20ba6a1dbcb9 ("rust: io: add `register!` macro")
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
 rust/kernel/io/register.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
index 03dfd2ff48c7..31e084a4aa9f 100644
--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -71,7 +71,7 @@
 //!
 //! // Read from the register's defined offset (0x100).
 //! let boot0 = io.read(BOOT_0);
-//! pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0.minor_revision().get());
+//! pr_info!("chip revision: {}.{}\n", boot0.major_revision().get(), boot0.minor_revision().get());
 //!
 //! // Update some fields and write the new value back.
 //! let new_boot0 = boot0
-- 
2.55.0

