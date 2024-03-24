Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C3D63B
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Mar 2024 01:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711242566; cv=none; b=EPfiZD/T5bI+2Z5QOtC+xtV6FkLY7ctTgrXN3av4Nq6Sqi/nANIBolD3qzqstjXGUuL7386ECmM4+nhstxQsEwlbOptc/EvBPw4EijIWcg3UMKCClWtjYqme11j5E73w8mgEisZEOC6qDANPPjhf6GScftd8rpI/i5jm6+HciTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711242566; c=relaxed/simple;
	bh=oDKBENy6pbQVmmqZAlcCoiyfMf+7oPBZlqAh/Hlnu0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NiWAanvy34/9LVLmp2w74iQX60xNwXqulOKDNOCiS5GcJDDJhVnFAgmKIA249yinUGZAA1XVP/T9ZK9LOBCgcfsjNLkj43BH84K1CegGR8M/xaT1AwehjxVDHIQegyZ71C3pE7reNgRj/AvCIkTSs+HFPGT9RMPc9ueEHANhCJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9ZrKQCU; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9ZrKQCU"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-29c5f8bc830so2205721a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Mar 2024 18:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711242564; x=1711847364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eg/08sygVYxZI1R+T69PzP0x7q1E48x491HGAwJrhwg=;
        b=U9ZrKQCU/Tqw+Tt459FqN+Qy6JxS9kONOm1jzREzWtbTBgmXG+16bZyGHdDZ5RyRAL
         M5c3wjhW56Ss/Igl6aYBuuDnU2KZN932WudwiG9IVxyhQ4CkUSTy7XQlpADDXAhMkiUw
         iO4ujkkjJ9YhsOPD5Tf2kNNbbxObMFwXKBbYH2e978R/s1ztTt4s1FTgN+HedIDJ1lAQ
         T51J7ActtryboIfpF2vMEcom47ElFMKnQwKsQJ7XEV9yrEXBb8xqlgbjcEt6yyfLZxy4
         8PeYMg13V5KQvK0/jd2KQKCNv3jrxJdBiupN0Qm2qoJ9kYghdanqwjgJajdayT4OSUq4
         ckxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711242564; x=1711847364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eg/08sygVYxZI1R+T69PzP0x7q1E48x491HGAwJrhwg=;
        b=AUKjbQjL/JOFjk20PCJy5UGYdgH0lTW/6djmZnWYccnTy8PNAcK61uTt3eEBpxuU5c
         /qpNQcrUxxYgHYyv5QQnWqdcA8Y+duWjGhY9YSayObO/EiQl+7c8D3jfUnOTym06h/Ry
         EFnXUxVqUnWEDbJ9zA+1lLXk6DSvkp3iK2lr372VzloRmfRP9Cvk4PToYEl/P+aSBS2C
         hYdY0bFVXoPABxsUrgMVxb/YL7c9UYVEd+GQUafUnt09nvbBszPhecbRrrg0W/P26v8T
         vfYr64wFlGYw8tTt17CJG9f6NDIW6YFJutO6OPV/PiY0X14aBXFcgQjqcOHQQV0OwNzD
         aptg==
X-Forwarded-Encrypted: i=1; AJvYcCW7VYuR4mASSr7v8INeMvA1QRTD5PlywqLnKifIBoGyzEOr1hjnZLa2VeO3vwyYkXbNOnFICfThh8sJhcRTy1Bz0U3YT9mZV+Da4L7BRKs=
X-Gm-Message-State: AOJu0Yxo1Pvtd+7NhwCvgD/5S9EwBpb0Mo/kZOygm23bdZkQhr8oetcP
	PHaS4enFBzECdGJtkCMFvqBcqyr3AFWn4LvADvH7+ghp8knXjBbMgVt3Ni87MNs=
X-Google-Smtp-Source: AGHT+IE8iZpZ4cCoR7uNnDAja6YkWpW85aSfl5yR3OlsmQ5tpgT66SXojyW4mtyhqh/NeN4qatpMqQ==
X-Received: by 2002:a17:902:ea08:b0:1e0:a525:25d8 with SMTP id s8-20020a170902ea0800b001e0a52525d8mr3067590plg.19.1711242563943;
        Sat, 23 Mar 2024 18:09:23 -0700 (PDT)
Received: from localhost.localdomain (36-231-152-158.dynamic-ip.hinet.net. [36.231.152.158])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e0287592c4sm2195444pln.267.2024.03.23.18.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 18:09:23 -0700 (PDT)
From: Bo-Wei Chen <tim.chenbw@gmail.com>
To: ojeda@kernel.org,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Bo-Wei Chen <tim.chenbw@gmail.com>
Subject: [PATCH v2] Documentation: rust: Fix improper rendering in arch support page
Date: Sun, 24 Mar 2024 09:09:15 +0800
Message-ID: <20240324010915.3089934-1-tim.chenbw@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix improper rendering of table cell(empty bullet list).
Rendering as a dash with the backslash escapes [1].

[1]: https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#escaping-mechanism

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1069
Signed-off-by: Bo-Wei Chen <tim.chenbw@gmail.com>
---
Changes in v2:
- Use backslash escape, instead of the code blocks.
- Link to v1: https://lore.kernel.org/rust-for-linux/20240323074006.2940679-1-tim.chenbw@gmail.com/

 Documentation/rust/arch-support.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 73203ba1e901..1b7d2323f385 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``loongarch``  Maintained        -
+``loongarch``  Maintained        \-
 ``um``         Maintained        ``x86_64`` only.
 ``x86``        Maintained        ``x86_64`` only.
 =============  ================  ==============================================
-- 
2.42.0

