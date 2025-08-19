Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A812D322DD1
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755599700; cv=none; b=i1pjDqDZ9TIshqkfotS1WpUOqC9Pk53l3ATBE6hvZiaxjgK/bly47CtEIEmgxwauXIDnO3uL0gcagy07MslJjMItQhea3VAy4oQgk0j9iiSGySF5LwVTHuRoHghg/mX/WODUfR2yzTHClwd+9N7wYOyKsju/MEduO1sWXwkccL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755599700; c=relaxed/simple;
	bh=EOiel7LVR149bFLKGxoFqzCvExjuT+NKJ9JARxaqNE0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dwEz4JoPFSfgHGr6NfiydIy4EtnhRYuJCehFeWpRSYx9AZlCT79zg7dNaNSI/OaOqfpQqq2MvpNIMHPsK/R65bIyvc190XJ3C9ArxzvnllfhaTWd8Qjo9CIqEejFgA/YDzHZMGuB65oMh66s60qg78C5u9nTz1lUaWAlc6WSGHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1JqnrJ2R; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1JqnrJ2R"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45a1b0b14daso18757965e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755599697; x=1756204497; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aT2hi3ZyL1ihosw5H2KL076sTulcA2Gel0+KFrHTzHA=;
        b=1JqnrJ2RHz8vVkhqhiT1HqM3qxIVweV4C7Gi3pAf65EjvLyua/6xbkKy7IO1QWbxj8
         PhPJ+5MoFaDcWB/pt0aIU7YEHUwlzGP3FXp2f/KbDGEC8440ult2/nzY00JjaFXjIaI2
         hftG3NEzkOKGJVjXZts5HGnwJlXiDEWjtASDEIaARYYccwnOP5tHeNhPrE8SDmtWujTk
         rOTkrIhqB3KGajqAISQl2cpaNsFzfhSYMjt31s5o6VMChIsUge7XWhimxclLb8cpA0wa
         uVEm17YG7RlXwbGA0VFZK2b2WXfJKqEjmFa8xVhgPhx5VbuGrudlMxomRGXWr3NJ4aQe
         qbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755599697; x=1756204497;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aT2hi3ZyL1ihosw5H2KL076sTulcA2Gel0+KFrHTzHA=;
        b=YVNn3u+4F+ErsTzlrPaXxrkg9k35BpvfGdp8Avsm8vZ++8qgsThPnmuDVHkhZmICvf
         0ogZC3Z5kYjF7W6wgGC4qC3RkGHEETP4IEmfdMzJMNL/iR3mG06XGuP7vsa2ix4vZQwz
         6P0IW+nnDCNrHtD0AYnyW9rZ0XdWVfLY8kJbb78QDNU4qUyNi2bmlx9eRtvZDQCaHigr
         qR356Dwn2YSROYWJATZ670u8XkUO0gaAve61r7i9qI2LhFeOG9XvegqulVH3LYFpMbxK
         eXZDURuoFLdOeAO38xMHtN2ijKKLCjVEMg8pAIUHhQExeHGgGhItg+tn7lsR+XghiNBg
         yXGg==
X-Forwarded-Encrypted: i=1; AJvYcCVa+mmxkE8MFJuhHkxaQzGV/odyQ2usMokhf3Zuf5PURcLKsIeusj8tnAKJAP3a9amtKSiTQrjZZopKny8qFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq2UbQFIhwNCT0MBzx92nFe702RhpbEJc7AgXF8mhznlhQsKSL
	Pu7In2i9gzELzWFf9WPsxApUzaZStFCm87UppIUpIxg9r83agSj4leAeWrPY/BpQLMkJAyMECtu
	1tQGVmj3ebE2vpcWFhQ==
X-Google-Smtp-Source: AGHT+IFOGHcN3UGy6VodHfv2J2ggOgbe86pTWO6txjKCELGMHO36iGV+vPOgfJvJAny0LQ3kLq09givQwoeUMc4=
X-Received: from wmbhj22.prod.google.com ([2002:a05:600c:5296:b0:459:dc8a:ec9f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c92:b0:459:ddad:a3a3 with SMTP id 5b1f17b1804b1-45b43e0acf3mr15822075e9.25.1755599696980;
 Tue, 19 Aug 2025 03:34:56 -0700 (PDT)
Date: Tue, 19 Aug 2025 10:34:46 +0000
In-Reply-To: <20250819-maple-tree-v2-0-229b48657bab@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250819-maple-tree-v2-0-229b48657bab@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=EOiel7LVR149bFLKGxoFqzCvExjuT+NKJ9JARxaqNE0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBopFNJ4MbXWnL5teO5qvs43aMJT0mDzFTXDzw79
 BbWKKmKtB2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaKRTSQAKCRAEWL7uWMY5
 RhYTD/wL2LeD5NE64x8lArC2giqMmSV3REyTMDWOno7w4OdPBRVM/Oz9wWYgLIPTbeV1QmF5Jyk
 0XFENYuN8fmnsFffLrBXTMq6HAdVs2Lbajo5+L4zmGA1gkzlBXbpJG4PfOZ4qvn5Dzkiz1bYbAi
 WhhbeCup3Wjv2LGWY29sPJ/DcWceGwtlfpR+YONXd/b+VJZPR8MWAcVAk3XUQhmSKRHGr9a1xio
 cjWa6Tna348T5l5OKzZxmniidC1Yh+x2ghDuPw2lMyxLGjOvJ5AUSug5VwWHTJ8B51CTGopnW3d
 LaXtTuSEcD4p0/4HQakYfNJBjLug119/pRyALfhYvDz6mYPFLtIJmSV575neg1OhS3UbJjWI9bH
 XDzc93hsgAH9PEOYfSq2DZ4JNvOMOHACzCBdlTWr1lATj2uvnXmMVcFq3MPOVxVVO/gG7RRLbfk
 nJYOGikMz8NZ2gstjBPkWZsVrN4Acir72RBvpbfHv6qTXZgNMwsuIAKfm3krzGCEr7m3Hpgo6+x
 UQeOjkoq02yqNvmFTs4O0hPchVA7rla9sswrJS/qIKIhUyksF6QnOdLtx9Hjpy72ukV2PSBbvEc
 +Fb8UzdjoLFkzjp5Jt/h9BYeap/rzovKPbTyRpCiZzKuxJLoqfEkRkFydZRrjBlqjJjU2Ct9ZNg 8N/gEflH+HHezNA==
X-Mailer: b4 0.14.2
Message-ID: <20250819-maple-tree-v2-5-229b48657bab@google.com>
Subject: [PATCH v2 5/5] rust: maple_tree: add MAINTAINERS entry
From: Alice Ryhl <aliceryhl@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Similar to and just below the existing MAPLE TREE entry.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Liam: I'm not sure what you prefer for the MAINTAINERS entry, so let me
know if you want anything changed. There are also a few other options,
for example, I could just add the files under the existing MAPLE TREE
entry? The get_maintainers script should still send any relevant patches
my way because they also match the RUST entry that has a wildcard on the
rust/ directory.

Which tree does maple tree patches usually land through?

Andrew Ballance: You mentioned being interested in being listed here as
well?
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26053163fe5aed2fc4b4e39d47062c93b873ac13..4a52d884e36eafe1c819227207123c51caf02ee5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14674,6 +14674,16 @@ F:	lib/test_maple_tree.c
 F:	tools/testing/radix-tree/maple.c
 F:	tools/testing/shared/linux/maple_tree.h
 
+MAPLE TREE [RUST]
+M:	Liam R. Howlett <Liam.Howlett@oracle.com>
+M:	Alice Ryhl <aliceryhl@google.com>
+L:	maple-tree@lists.infradead.org
+L:	linux-mm@kvack.org
+L:	rust-for-linux@vger.kernel.org
+S:	Supported
+F:	rust/helpers/maple_tree.c
+F:	rust/kernel/maple_tree.rs
+
 MARDUK (CREATOR CI40) DEVICE TREE SUPPORT
 M:	Rahul Bedarkar <rahulbedarkar89@gmail.com>
 L:	linux-mips@vger.kernel.org

-- 
2.51.0.rc1.167.g924127e9c0-goog

