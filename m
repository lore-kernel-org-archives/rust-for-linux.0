Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B60F34889F
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898332; cv=none; b=k2FAhsM4ZHX3/VnEvG3HPqaSJkz2hk/KfGaIb82tZkYbAEHn/cUsv1nEMoFHccO+yhF6z1m73aUjxAuPOP58LjuLqK1o9/HGGTzPtjQYlFWRcgegd67n+7JhaE9vU/zcl+lAQ0oNoZHEr/bIcz9o34FQz9kgAkg4OY4Xu9WNVAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898332; c=relaxed/simple;
	bh=lXR3Ma+I33V3Jf/pfylAs8varbYnhbu9R4uU93f7VPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNQho4l2H1NJ+2n+5VbNViN6RjKPQQl7J/c2elaAdevNrp1/jhjjzSqEi58WoJJsiVodSOpSj7rwJG5OAxKjUuTYwFoGjId1OdYIFG+mm1HQHBKYh6h6lkmDn5NH6rzaDys4L5owXI9dkGarP/s1ec2b0D0nd5bGp0JyOrspPRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29f2676bb21so51347405ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:38:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898329; x=1769503129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ai8xrbD1D9tiWYgy1snG9o9/fCZi/EtirUQvTWRvH8E=;
        b=b9sq1ToySMalXFyrtoZ75dXvPk2HsiWxJGMWC4OYLLihAV2b2fwYfzaZCXVrcAVOMp
         z4eF0Kmt/+6rVVPkaNdNMmpxVkKZ+YJc/fuRzDo8pjCp0fm5WeAf1lbO/W85f2872A05
         PnEh8aBXdwsFvJgmwlk1k8Ir/fszMqkE7+HsHT1SqYOZ7GKCD5n9B0+G9Rjr9c7vQp1Q
         y2i8ZrMsciE1R0f8WA7ySRROqdDLsGpFbhXI4nhKXaWsCTGWs7u6DsFfzvEkjoNmNuEh
         EeaHgsyC+UKUrLm2bg/lGkNfEQrEKfs1QS6KKFbPjDe254hBREJ/8pF+iPtuhrPMoV9n
         QY7A==
X-Gm-Message-State: AOJu0YyDRehta2fetA0B65+WRgBkR518lcTXCqOTe37OXvu4V8bJBox6
	CBX8d9mi7XZZMXjvIL4iVR6PZzK93nWEC6mgUfgYMfbsmzT5AxA9VNfTO69E3Q==
X-Gm-Gg: AZuq6aJD09SzKzJrlqNHb0o2wXj6XHNg3gqcm8xHeAvIceEgBK7e9LehmFekvRHE2NI
	5dDDbrqCHKQS33gJ+Dzj8Y5Fo5zX51nUH1N8oHCLBpKVDEXE9Zw4tmd7qP90ilBgXjEN9KHvVvl
	kYXdzRFHVOOSEs7AZSlyiyg3w6AJlOvc3KJ2WyRwHYjdf9KfUiogPBbZnRJelrC9nxOHc4TWUR2
	ZTAwBpwd74kAoRAuTL625EmpqNxL0Lvs9oyqs54q90XqEhzFxYOrVPNTanafmbxfor9llnl4VkN
	jtKW6/2yW+LOaFQVomDv19lImIL8RiLxT3F35ADGK9olvAJ/fGlHZM03Q0W/m7TAKUhxzQlxvUP
	aUpUu9oTKwEwALA1frKci7xMCOPzb/oHqK7mD7oNOr30urqVK9v3Hxit3d26/XHI9V6lmn7OHOc
	gh86GnJd6g9gPBGD6Fl20=
X-Received: by 2002:a17:903:247:b0:298:3892:3279 with SMTP id d9443c01a7336-2a71887c4a7mr137423255ad.17.1768898329429;
        Tue, 20 Jan 2026 00:38:49 -0800 (PST)
Received: from localhost.localdomain ([45.142.165.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm115114625ad.23.2026.01.20.00.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:38:48 -0800 (PST)
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
Subject: [PATCH v2 3/7] rust: block: mq: use pin_init::zeroed() for tag_set
Date: Tue, 20 Jan 2026 16:38:19 +0800
Message-ID: <20260120083824.477339-4-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120083824.477339-1-sunke@kylinos.cn>
References: <20260120083824.477339-1-sunke@kylinos.cn>
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
 rust/kernel/block/mq/tag_set.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/block/mq/tag_set.rs b/rust/kernel/block/mq/tag_set.rs
index c3cf56d52beec..dae9df408a862 100644
--- a/rust/kernel/block/mq/tag_set.rs
+++ b/rust/kernel/block/mq/tag_set.rs
@@ -38,9 +38,7 @@ pub fn new(
         num_tags: u32,
         num_maps: u32,
     ) -> impl PinInit<Self, error::Error> {
-        // SAFETY: `blk_mq_tag_set` only contains integers and pointers, which
-        // all are allowed to be 0.
-        let tag_set: bindings::blk_mq_tag_set = unsafe { core::mem::zeroed() };
+        let tag_set: bindings::blk_mq_tag_set = pin_init::zeroed();
         let tag_set: Result<_> = core::mem::size_of::<RequestDataWrapper>()
             .try_into()
             .map(|cmd_size| {
-- 
2.43.0

