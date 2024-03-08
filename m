Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D312B2D05F
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Mar 2024 09:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709890621; cv=none; b=CoyJ5Optv6JBAs5HetOn7rWSmfL9oQiMXO/uv9PZoBkiSiL/AyNjO/iDzFSrIiWsBDqHHYFGDBwraL2KfgUAVkrgg+GlxEJZ7i/ucLeRB5sPmHkVnW9UzsNDrUlep/tGPWuHezib9J6fM8mm55GazDwaCLqHMWezYHhoszfQybY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709890621; c=relaxed/simple;
	bh=ARgIYQHmcT3WDCT/C37sjRzjUfl+5mv5bdkO5HSlrZc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OZKh9/qQNTflZnKemmFvHbPjg6QgP63IhvElqH6yEVAocVrZexFebbV0Ur3ayiO1EkYFas4ZbWvl/3INC0LVvlUvp4yE7PN2QaiDF1H9nZ9AOYTnqQc0AT7S/iBxYJNQysQBmnKuxZ54sC9oZDe2pj2wOslHqGwrDrMJ1BnC7f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gt1SFTqi; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gt1SFTqi"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-609ff5727f9so13425697b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Mar 2024 01:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709890619; x=1710495419; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k/FYxEuJJjfDejA1S3OfbTfejCKvINxrPLGNHovjOxc=;
        b=Gt1SFTqiGfL+hs4Aq7UxK8B8pqQPlLlJJxIPqKu4A4ExdvuLK4VtTTwO4lvFa9fxo9
         WYcE4NheSozoZ8ZgA04VOEINvQZYbL+I3NwOywoA0/c9zctlQimChQDv4EzibrN4qeFI
         O/4ReT9K1yw+ond9D84zO7aVUWu0w97ffsKIMx8VP2wnS0JrWPCLW0cqsIMuqIJPqh9i
         LzX3o6XjKZmeUGqY5edgSzN/c7NDIXY9mm+iOh4Z33fyBPORX8/XBrCS7fMbIP4HX+4w
         A4e8iQqSJjLVK8zREin8eM01DECFLcS5PAvY17gZGBy9oEiVP2Iio6xJ8uqMoBbYMe01
         FSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709890619; x=1710495419;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/FYxEuJJjfDejA1S3OfbTfejCKvINxrPLGNHovjOxc=;
        b=F4sUUpVTPEi6mJGqB39R48sn9Lu50bg4wC4Nd9qOJxJuIEE4rLJxh+hljg+ATFG8nf
         UQNSsMepwxPoH3X1CV07s5aTurp0+7pT39IARjPNmlvsHoirp4H8+FpoDEIaSe9bMrnJ
         MTlL9BHu10/2JmX0JRrxqmMoo77cUayuOTVNFMzGR7orJh4owp2lDRGxy4lhOvh15yuj
         LP7kv1Q4ajY91h6Olzlju9Y1QQOjgbWy+GjiUamr/nCBlFRirwDqbNZCRWb9EJo90jRx
         nE5ZpcVm3UGyE03G8TVjuqol5bShZ+YvQ1NOhb2224bdhR0NfPzp9DGRCUUjsNiCa2dj
         LD0Q==
X-Gm-Message-State: AOJu0YzM0Avp3k67kH54pU0x/qXegZHXONlcMKq+HEkPrG4U7N9uxz8G
	jwleb/x84GJONF5wxmWgcktu3tqIXIHr7mbMtG+OsdEDFwvGcfXawNu75BeVK4KdNELFeFo8QHE
	VGC9OH/jKNF60nQ==
X-Google-Smtp-Source: AGHT+IGkL3Ui+SaRSxFgXSCHQwNmZqC+lN7Big70IIcB7TbtSHOU6BLY/t/HxrVy5cmGM1i0ujxLf/IvIE22Ngw=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:4707:b0:609:fdaf:8d0a with SMTP
 id gz7-20020a05690c470700b00609fdaf8d0amr524280ywb.1.1709890618951; Fri, 08
 Mar 2024 01:36:58 -0800 (PST)
Date: Fri,  8 Mar 2024 09:36:31 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ARgIYQHmcT3WDCT/C37sjRzjUfl+5mv5bdkO5HSlrZc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBl6ttfeicdGJCfsaczcFXNtWql+LSBl6Qc4+PnP
 ywKFtoIraSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZerbXwAKCRAEWL7uWMY5
 RnVUD/sHQH5VMR08yYy75nUq6fV+Yv5tkgOTsv2agrrP44YcVQqy7U/melDNm3n8nJYrXh2gOpa
 gOJQ91t+rxLwzIhod7YxtA4+ZXSOmc1MdtahuK7efuKiKgPbmw8Yg58mz5iTmwAkNWhKudF3QM5
 qMw4n2zKKLH2WlyW+y+inDtP0rfZiX82OPgH7fi05cl5dQYCOYWVL6OACSuUE6/gkumY2pCedgK
 Qbe3daRvucMgT/Nk5pumZPMrNXzjxL5yhdjDvL27+AOJDVGtcdAwWbts7TxNFA4yEgA8fmzIEPG
 nclXhKSU4urh3EWFS6qKnAkCOtypDOsGyuwD8Y0shJlBv/XO+CY8rzaSHmO1BJCvMrpax1p/VLa
 YvBi1/hBRo9nkh81dj2TewoATyV5qNCdIVQNKRjptd6/9kaAUslQyaMMK7iG0Z4dCZ48UZftlAj
 9o8SthHY/vY6v/dlm9o2JTm80kYnAA+ybghA38+AbhQUCS7BAJMNXSG8G+DnHB3Mu3SkRIimzi0
 wxNjQ6lWJ/3+wTnmwSXrxdOlnBdCJuolJUS/m0Wx9+5hHdmD47S4BcDyeO8xOJPU0Lu15pa6QpA
 icTa8W/M6KURPPJ3vAATosYGDv++n+tFkRqIHUtvcrSEWORaljgvxYA/9WA47zQK+r6FK6PT/to So5T60HPmXn+V6w==
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240308-constructors-v1-1-4c811342391c@google.com>
Subject: [PATCH] rust: don't select CONSTRUCTORS
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

This was originally part of commit 4b9a68f2e59a0 ("rust: add support for
static synchronisation primitives") from the old Rust branch, which used
module constructors to initialize globals containing various
synchronisation primitives with pin-init. That commit has never been
upstreamed, but the `select CONSTRUCTORS` statement ended up being
included in the patch that initially added Rust support to the Linux
Kernel.

We are not using module constructors, so let's remove the select.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 init/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 8426d59cc634..41f7fb195382 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1903,21 +1903,20 @@ config RUST
 config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
 	depends on !MODVERSIONS
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
-	select CONSTRUCTORS
 	help
 	  Enables Rust support in the kernel.
 
 	  This allows other Rust-related options, like drivers written in Rust,
 	  to be selected.
 
 	  It is also required to be able to load external kernel modules
 	  written in Rust.
 
 	  See Documentation/rust/ for more information.
 
 	  If unsure, say N.

---
base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
change-id: 20240307-constructors-07270b039e2c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

