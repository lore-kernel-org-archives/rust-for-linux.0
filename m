Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E7B275AFD
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766836830; cv=none; b=ohlF7V01G8wFgEboHj0UNaxs7EPgFrjgMpMZIIJzNWmR5bApipbe2XZTpBd2biJirGHCpKaLeMp8s6wk8lVy8N/4759W4RBIv733SHlTJpSjqX08DFMFNxv9df2tGlYdupD3uDKw1J29nxyhLJx91YEglZrMLd4cLlc8u0ki3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766836830; c=relaxed/simple;
	bh=AFWGLbkRWJTV3azRGHJBzfft5t4VYcRGpJrctz2a3CM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDBVEuWzxfM8pptgErlk07d6lMVoaBhjPu90/lruJBVn8It0NCUjWYpYtKwnnBoKWg42m1C9IWV+ZOxR5Z8EQ3Bhh+P7v48u/JD8J2NKmCZsHQFArBuUMeRlMnzwLKu4SGL1uRAZBezNRUnFgmu188riV1aNB/rOtvTmVzb6ooE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDVdfMrT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDVdfMrT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0c09bb78cso57493385ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 04:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766836829; x=1767441629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vw6SY9UStiOcgMEQgkV7a5z9GXrjOJJZqWGx3Libi+o=;
        b=QDVdfMrTnpfz9UVO66oTQesaV/KAcDnr/p7vxAiZbqDt+JO5xyV8Ah+NCEq/MnnoSK
         +j2VWI4RkLwj5QakSZY6iCpCvnC2IgRoxPJ675X6vkVD1+NOWHXTI/7BKjvAMg0tETVj
         Mn36t8Y8R+HKt1Ec25GphnL+ZwdSNLB7cIGzl167Jg5mIfjmYi8ps1BFIcMu+786qWdE
         opwaGMGk15MO9N9oo1FLocoCiW7cgqZfNC6N4yaSLl0C2U/CFXoREcrTTuE9YcPtUJga
         N8jufh8uGuA5Bb32GJLwgpWi48pjCzIjk4ThQAAcpEVulWDlXa/G3fG1AOPRtGF4C+bl
         NPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766836829; x=1767441629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vw6SY9UStiOcgMEQgkV7a5z9GXrjOJJZqWGx3Libi+o=;
        b=S71sf2qDVIbg8FKmiZBDh/K5q0b4zeY2ZcjxLOH/Tuh2Cg4QutJz54dikWlH1C2vwL
         lv156HN0+/Qvt/f6HLpmCcIGAef8a1Pesi+Zhc5xKdBq78+M96Xi3gtlevqH0ggEV6OA
         FiXvHYDet/Hgi0UZPVzw9Dcwt/cOXLrguPxCLIgPoVJtwyG4E3ERjCK68T2XbSAzUtUv
         Pn6MjuOHD5Yq3ROA1SLJ8I9VAl5BqNY0PmLATkBQtgJR6s5ig3+N/ErhchfuNg/iZk1b
         cUm/JJB8/nK3U2p846h9qCAk4myGUsq5ba7Y//q0d0GlQtROjifh6AlJXUuWtdK6MnBZ
         tH3A==
X-Forwarded-Encrypted: i=1; AJvYcCVu9drhXgFzssqSFfJgdk1SzwAjAAWIRfyY53MGNqU3pniq19nunpx2nr1FNLMK9iYSOhPBZNEUFn/M7Dqaqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6GRyjo+YBpJbRjuiNMz4A/Vu3B5KZsyh10biFtcdQbq8h12LK
	qA+O9zJGezXXf8JA9+43AEsPdkucu3YVjmuJ4APccQBPcT/OPPS1vgsl
X-Gm-Gg: AY/fxX6w9rSfnDKnaOojadFopRdJiEiQSKNWzNXrxWXd0l+dblgANcrlEab7bj5z7cL
	OOEkgU3cNU2RiB+w8TNsMU16rgrLld4VVLR87WIH04X2uFfMuhsK/ETcDVarmb+/ewQaTUMTiZq
	0xvx1Ssa120FCijW75d/tYOsXtr7VBOLfl+Y9mcBdiEjkjmbLYL8BpBhcwehvscrbLTrX//jwQv
	5NBSVQMOjHhUwq31lSzfG4T6UNGtfr0HNGae5OHfZF8RXSg8KezBQ0/aZuTKg3gI3QEIESg0WZG
	ACjfsXo3rrEpfCHoDoaWHwLqDSWCk82HRxztsA0xsKt2y5vZO+4iOg6xM8DBwZhoipUn1Yfy0xZ
	LBbRnEsYxaFzvbpABjveQFyuDtKAfF9lTVLydLBL3jFELRRZHWiA+sNv2oSlPw2XCOU9Id9gONQ
	4OHNTGz/e2vDbT/o8j774s8vExrHvOSOWXKqXGpFua6UebUfYhNHuGffbmdsPRcMpqJrUmNJ92
X-Google-Smtp-Source: AGHT+IET3e/1gpTZXe2/wzXT9fMbbdgZ0Aaw4yoLIf24Lza1zTnz6HFsZfyl5jtmfvWULJUEe0mNFA==
X-Received: by 2002:a17:902:f70d:b0:2a0:fb1c:144e with SMTP id d9443c01a7336-2a2caab67afmr304760695ad.7.1766836828577;
        Sat, 27 Dec 2025 04:00:28 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbcfsm231033165ad.50.2025.12.27.04.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:00:28 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v1 1/4] rust: helpers: Add i8/i16 atomic try_cmpxchg helpers
Date: Sat, 27 Dec 2025 20:59:48 +0900
Message-ID: <20251227115951.1424458-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227115951.1424458-1-fujita.tomonori@gmail.com>
References: <20251227115951.1424458-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add i8/i16 atomic try_cmpxchg helpers that call raw_try_cmpxchg()
macro implementing atomic try_cmpxchg using architecture-specific
instructions.

x86_64 implements try_cmpxchg() with full ordering.

On other architectures, try_cmpxchg() isn't implemented; so calling
try_cmpxchg() ends up using cmpxchg() implementation.

loongarch, arm64, and riscv implement cmpxchg with full ordering.

arm v7 only supports relaxed-ordering cmpxchg; __atomic_op_fence()
macro is used to add barriers before and after the relaxed cmpxchg.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 089f31bc8de8..9d62f659c8d2 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -90,3 +90,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg_relaxed(s16 *ptr, s16 new)
 {
 	return raw_xchg_relaxed(ptr, new);
 }
+
+__rust_helper bool rust_helper_atomic_i8_try_cmpxchg(s8 *ptr, s8 *old, s8 new)
+{
+	return raw_try_cmpxchg(ptr, old, new);
+}
+
+__rust_helper bool rust_helper_atomic_i16_try_cmpxchg(s16 *ptr, s16 *old, s16 new)
+{
+	return raw_try_cmpxchg(ptr, old, new);
+}
-- 
2.43.0

