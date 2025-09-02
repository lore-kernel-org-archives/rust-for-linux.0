Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D23D26E6E4
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Sep 2025 08:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756802179; cv=none; b=D2ycR+02K0VPSUknng69x8VGIwQ+WSSw8xaAev6WPR+tCwAsCbmT/KuA1hNI7j3zunIenK6yehmlUnZTX5U6INDuiK2DWFf86Rg41hsh/4ulwT0ChfEHV6WggRLob394iVw2AEMha5cI5dxehZma/ZhLaHG8Rg1k/nR7fIQNaz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756802179; c=relaxed/simple;
	bh=QnfwVPV7sl+XBZzzZ+jUFbEpa7KtnzFZK0GxLBS3hSs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fK/qWN4TW16DsnbrGLiBxdsGeAPmP4BxHuIEN6EY+EX8s0vdWIxc8XSNXf29lGP4QyqLHUTkTgwdeq94napGtf6MUM/n8pzSeQNvE+56hLzUnMsxdVWH5EXNHAWTWJLb7TFU3VNZp6RGlELmlfbrs6PgRbNg1a9uXVh2+Wd+Azo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ENG7PRGQ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ENG7PRGQ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b72ef3455so19110945e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Sep 2025 01:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756802176; x=1757406976; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QH+dNhuwk1lL/MGBDy4gK3rPW79vkNW7Vepzh60wxeY=;
        b=ENG7PRGQTj/xbeHGJTGCdFO2BryXM31uFX+W0tZ2BFk6MEDCuTO4ZBIguGWKjrFxyu
         uFBxNlNP5KbSZDxK4pFDK67gYhwyLn+1692jJ2mbRsl3VP6NxSSFpTkyONt5fqCx1tot
         9Sinc8bZheofIwnQ9YeWgG3szPHLsX4IRVHhYL9WPmv7LwTvtnkrUtTKwoPdBRq8xnAf
         nHZsz0jGcCCFZ6VIg7rOCf7t0fC0RUBy604MH5YQj4RZ/yvHuwD37k8k4lZY+5cN3o2w
         x20/G/kwTmynbrc/qCkOcWMtyEcvYWrnv56WftP69ozgCNWkUgl7g6SNdFaOpHWwybjN
         CBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756802176; x=1757406976;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QH+dNhuwk1lL/MGBDy4gK3rPW79vkNW7Vepzh60wxeY=;
        b=CjVLXqKRbVmYSrdgTWcitq7UmGfOs/Lj3RvfvC6w3T2ULoWVGaHasaKkCwbL3Uhc8Y
         xYcao1aKC7xeRDJTpVs+jzheUWA/Njwm91YacMPtwnrKiqYWUWWZLR7bH6SkgAt+GM97
         TAKlm9SHcE/rkk2IKpNTKKuSLNlC+ANdQ3DCa+lY344LFLbLY5MRhVtKlHPapmGTYYZA
         dub+HUyUZowq59cT6W0AaCNxxvzG2G/+pSNVuK2hwiWSqzgDGaip/jmIwL0Jdnkcfh6M
         /htjWn+g8fC0RbePIH4EHf4pcFSPBCIp96M3ov42ITwRdRQf4IcCqRcORbE17e1B/Sd0
         XSuA==
X-Forwarded-Encrypted: i=1; AJvYcCUFAbyDOn77/84MU5ntEp4aopzbnE+uZ80m6BudF+KZ6WVS2rycKRrZU8MqHA6fMkT6G27o/7yESIsnn0CBGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8tYyuiSD9KWA/qKtvvoGSK0bv7fFP5BHTD298ixJ79YYCTWYu
	KMgdewDkDr1RgI5htyulYdvv9lmumtBX21x/BuCuG8eoQKzm6EPEkhLE6+QC+VI/AsS5ewkKoXr
	uEWKfWwrI4c0AGSBX2w==
X-Google-Smtp-Source: AGHT+IFrwiLMwac2efeWQGD8tg+3earadoHpSjr59iffX99070qwvna5zy2O9EDiYznHm5rt2CVI2cPNwcE5eb8=
X-Received: from wmbep10.prod.google.com ([2002:a05:600c:840a:b0:458:bed1:8923])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c8:b0:45b:7c09:bc0e with SMTP id 5b1f17b1804b1-45b8549c7admr85100405e9.0.1756802175884;
 Tue, 02 Sep 2025 01:36:15 -0700 (PDT)
Date: Tue, 02 Sep 2025 08:36:11 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHqstmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwMj3dzEgpxU3Zz85OyU1ALdAt1ES2ODVAsz02RzsyQloK6CotS0zAq widGxtbUAO4ntmWEAAAA=
X-Change-Id: 20250902-maple-lockdep-p-a930e865c76b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=QnfwVPV7sl+XBZzzZ+jUFbEpa7KtnzFZK0GxLBS3hSs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBotqx/CYGhzcPznFiE7UDh9XQoTakkyebBpyup4
 FA6tih9P9+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaLasfwAKCRAEWL7uWMY5
 RszmD/0RBaQV9WIxAvZ+VnmbMFTKWuCAP44AGbTl/3sQk4GNwQFQY9uNosttG4sVrjzvQo6CTyW
 ssJ6yEm0Q6z6beDpkId7DyPz22AG9PkO3nLxJaI4tge9qKiw7MPDxBhMDBxirdYiD8VBhMqICaW
 RQJ3GrQrlFmgfmxgF/P2Lq7tVEuevZQ6Y63z5/iNW7b0HM/a3cRaJj1wKSqvkGL+3Dy6GsKBSAj
 jsofZrZAXvHnbRViM86JVCRcK8Rl61lRiaMAC3iMbhV3molQB5qWSEQFBscIkLoa6UBLhKvLuUC
 PvU2199QpdCFl3rM0ahASdsYrb0hDkTUljpLu4SOv5hGDqNofoSLg0TqG4CyVevrnmNXynEEY5F
 1twK6PR3dbAhfKze01E6Y8cTRxgeJtgOR6xgLV59rnY1Jhb7n83QZdODGrKnbFpIG9Gq2YMQB1T
 wbTbMi2yVf9ZxlI5ZF2aGhPuIHMtFx8kc5iigDyHNLojAnN8IeN26oGF2jgUJgvUMGdVnaXOd+/
 bSIsPhTcucBM5bW1YKhe2Ya4XH3nGT5eDwAUfIL7wUinYIayPZeUe/oL/5f3MninIpDJg7phLyH
 8oCWYTXP7b/Pd44KqJIdOgcSPrWZACiOi+Wn3joeYeNQxwsL9Zx8y+KYwazcLdY7MqunZopAdj8 ZrYZJc1g8fHGUPQ==
X-Mailer: b4 0.14.2
Message-ID: <20250902-maple-lockdep-p-v1-1-3ae5a398a379@google.com>
Subject: [PATCH] maple_tree: remove lockdep_map_p typedef
From: Alice Ryhl <aliceryhl@google.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Danilo Krummrich <dakr@kernel.org>, maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Having the ma_external_lock field exist when CONFIG_LOCKDEP=n isn't used
anywhere, so just get rid of it. This also avoids generating a typedef
called lockdep_map_p that could overlap with typedefs in other header
files.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Originally sent as
https://lore.kernel.org/all/20250819-maple-tree-v2-1-229b48657bab@google.com/

But I'm moving it out of that series as it did not have the intended
effect on the Rust bindgen output. However, I still think it makes sense
as a pure cleanup patch.
---
 include/linux/maple_tree.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index bafe143b1f783202e27b32567fffee4149e8e266..8244679ba1758235e049acbaedee62aae5c0e226 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -194,7 +194,6 @@ enum store_type {
 #define MAPLE_RESERVED_RANGE	4096
 
 #ifdef CONFIG_LOCKDEP
-typedef struct lockdep_map *lockdep_map_p;
 #define mt_lock_is_held(mt)                                             \
 	(!(mt)->ma_external_lock || lock_is_held((mt)->ma_external_lock))
 
@@ -207,7 +206,6 @@ typedef struct lockdep_map *lockdep_map_p;
 
 #define mt_on_stack(mt)			(mt).ma_external_lock = NULL
 #else
-typedef struct { /* nothing */ } lockdep_map_p;
 #define mt_lock_is_held(mt)		1
 #define mt_write_lock_is_held(mt)	1
 #define mt_set_external_lock(mt, lock)	do { } while (0)
@@ -230,8 +228,10 @@ typedef struct { /* nothing */ } lockdep_map_p;
  */
 struct maple_tree {
 	union {
-		spinlock_t	ma_lock;
-		lockdep_map_p	ma_external_lock;
+		spinlock_t		ma_lock;
+#ifdef CONFIG_LOCKDEP
+		struct lockdep_map	*ma_external_lock;
+#endif
 	};
 	unsigned int	ma_flags;
 	void __rcu      *ma_root;

---
base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
change-id: 20250902-maple-lockdep-p-a930e865c76b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

