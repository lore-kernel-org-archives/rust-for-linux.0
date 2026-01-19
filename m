Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7F97260A
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 06:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805973; cv=none; b=ujiDb1RnpuiJjRAKmJCK0UoJv968L1DZHY2KNkinGIOb0OpcHO+hIDw7WYL6GoDiqQjjr7Z13xPP4RXR95v3fHL3joy9Xm4es3zxl458JvxkcekJrHD4+bHOTj4tLPtkNyTNaRuheOEWTZYASbVlozGdUrIuxF2Qm0JxOaLjLPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805973; c=relaxed/simple;
	bh=HncLCM/i0azY8TGHA1gYZXz63wJ4CqJseVpPk4Tk4/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vv5Y2AXQHuBPqkyH1pdxi6HHT2RSTcN7EmkPeh5TdPzy5jKUixMhfGzwTGzHn2NnOlGrLwUNH/ZvP6AlOnmCq5HxneOiZYLmtZcRrBqBdkNCe283F2ooR8iqhhy3TvHeEsRDBYNPm6GqGg4WS+n+7HnidJ1oIgnejn/Y3tbX2xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-81f3fba4a11so3843116b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 22:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768805971; x=1769410771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KDFIn7oQCJATg+hF9VvaXBeD4WABHTB354O0/dVM4ho=;
        b=iam3uxoqt0loP4JFs7Hxb9tKl0SDGyCPkLsHJzuRMUIpvVmGkFS1cR5mSenEg9hnWs
         nb3KJ7Zn+zVUVuGtP3jJrA3AHF8a36JHBJJi/pJz6qvs9Ite4648sGjy05F1E/VbAguD
         6Vdi26N7AhXDneYXawOuSgaH8dVPhEade2jokj0y8j8aDIu3ucAak9ob3C5qm50519r/
         lviHdTpDDlB6BfKWDUsYKPIzENVzAGicranYOghjy7PkG6HUUN0RcFmqBGk1U1MpSYlk
         NmXoPUCfLULgIVZlU++uEla9vrdofg1ohfDdxsT22yaRRbuTw1zlRqs6YQexOifnUStK
         ZV+Q==
X-Gm-Message-State: AOJu0YzGM7Xz3iMHCf+VuCt2378RYQ1TNluXjzAYd4JwJiNqiYTIC5mk
	h+zLz7pTbmVj2oTPjsN68jrl+6L91yfiCm/2wF5SEuvrB7yApxs3of3WEmE8w0Ej
X-Gm-Gg: AY/fxX4dDOLR8QEawygv8xUAgqoh+yMhQwgmZ/HHYIPquWM8ZX6zv/AKxKanNbF4Oxf
	tWeRJvATUacBr1GiDIVtMmgzDafqJhv2qOlZgqR9YFDoDJbQl17VsxFFEQFC7Adka0fP+bBWBlh
	L/GFHjeZVWZbCup4qaaXpMn3B/UHc4H5/31jkOvDHVwt/UaZ09rM/0BN0xEf/vWSMRy662Y5yVT
	IL/aAcX/iCE6XiDyX0T90A7L9wDVO4He2PFORc/d/tOYrrceOtGGJh58IQFdJeMjKGv7wtdChWj
	K7hKTm2/8kSAJIx4PH1/zHU341JpflF946ZR/cdyLhHhiet0BMt63/iLR/PljsdH9jbfUlIqWkK
	qSt0WVWoPRhgAth+3hF5hcyyvXmQUVn5LHqUrHCjnJuH32bByl+1LGzoLnQgIBEtXArSn+00E/K
	oXlNcCNzi/HByZdiCV2V3LfX+NZqFX79XJMyW6xleofYBl
X-Received: by 2002:a05:6300:193:b0:34f:ec32:6a3c with SMTP id adf61e73a8af0-38dfe60c922mr9791516637.28.1768805971154;
        Sun, 18 Jan 2026 22:59:31 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d82fsm8161979a12.19.2026.01.18.22.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:59:30 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v1 3/7] rust: block: mq: use pin_init::zeroed() for tag_set
Date: Mon, 19 Jan 2026 14:58:55 +0800
Message-ID: <20260119065859.1914178-4-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119065859.1914178-1-sunke@kylinos.cn>
References: <20260119065859.1914178-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
blk_mq_tag_set initialization.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/block/mq/tag_set.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/block/mq/tag_set.rs b/rust/kernel/block/mq/tag_set.rs
index c3cf56d52beec..6de72b7f61b38 100644
--- a/rust/kernel/block/mq/tag_set.rs
+++ b/rust/kernel/block/mq/tag_set.rs
@@ -38,9 +38,9 @@ pub fn new(
         num_tags: u32,
         num_maps: u32,
     ) -> impl PinInit<Self, error::Error> {
-        // SAFETY: `blk_mq_tag_set` only contains integers and pointers, which
+        // `blk_mq_tag_set` only contains integers and pointers, which
         // all are allowed to be 0.
-        let tag_set: bindings::blk_mq_tag_set = unsafe { core::mem::zeroed() };
+        let tag_set: bindings::blk_mq_tag_set = pin_init::zeroed();
         let tag_set: Result<_> = core::mem::size_of::<RequestDataWrapper>()
             .try_into()
             .map(|cmd_size| {
-- 
2.43.0

