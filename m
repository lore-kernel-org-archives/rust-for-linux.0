Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EFE17C98
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Oct 2024 02:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729479541; cv=none; b=OE4bLMp9ob1Y0h3XcMSG59xJfHHZ8/KUSa+wb6ZNHhBFjhrP/FFDeLyjEz9enMzYuCz89PPWeIksJk7Wjp6jl8j6+KPG/Ofmgkk+R7fkY7xCjadcsdY9ovq2HiEv76/3rlZ7X+mqLxSMuYILtaYihzlrLy92ltRALSHA4nLLggQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729479541; c=relaxed/simple;
	bh=dIC+uLt+xVKeZdOxVLR8e7CA29JLUuQTL+T5h6yjDfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hq5YNlBHgMzwVQBsb5ar8+21PtU2qxg6GeETzZXZJsI2sE8AuhmVPKmahSbgBEz1PSV7ynmTLE9jn0OdyXxmVbtloH8kmfXNpUnW6C0t+IgFrsngZCyrm7wdmckPFdr/pd2pBZZVxN59seuzNzXfF+yicKy8pJ4HIS42c62YEk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHpixGY2; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHpixGY2"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ead1edbf1dso985335a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Oct 2024 19:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729479539; x=1730084339; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MI6nkK6SC5fsP6aQGGMBTer+9mTULKIy1wHeCqmlx6M=;
        b=FHpixGY2Yu59FaKZca7GUMYNRbcwb+D1YE0CfRFmRbXNpkrMgOzzEYDQNs8QR89kxD
         2OYx7jXRdN60b6fZn3gJ0vcuuxHEF/m2pY93lumNYDbH4GD57PlNRnMSxaA7bGuxGfnm
         gM+PXFfbeHeZAfrNbu4b5PxK8sCMKXWGAo7YP0zePRHuuTCzCohGaajPdTpdSmy1ntuA
         pXYOlh0ou+TqKllyRT9E4FjV4QSXLoqT+E5peb5xy7KQZtZC+DY8DtMcW5z19I25iSUo
         qGKILZFTfbHZdn/BmImU41D52a6UeAOtim2bPD3F7T53BFNSvxChgzlTjrDDiriomd7J
         SLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729479539; x=1730084339;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MI6nkK6SC5fsP6aQGGMBTer+9mTULKIy1wHeCqmlx6M=;
        b=X9QnrOWOpo62DZJ5pzJksrbWW57oLDKG3EtREY/v9OENgreVnUG/VWmN6WnVfgzWXT
         7cKG2/PZu32bV7gGkJFUjjA5fBOGkUYV0eC1bsw4d6mm73/DxbI7imbKHneCqeQVSPgc
         T9oMkrZpHLrF9yPca7XWq2Ox7c1IkJz3AZHGoreUPJDiI7YbBfXYYNycr4HYZ6hdhSWX
         3vSn4syEf73KXSONqwXWv3rQR+KFt2uQ9WWHKlF73ccQO7PV0mT3QSeYB/kYH7blPhOQ
         WNAhouB+1mg2fCd9slQJR6idnTquMy+yKyn5JADQ1EfhjJqcGP8jTYZgcIdVymB7Td0p
         +B8A==
X-Gm-Message-State: AOJu0YxC19+2isA/YAe2WORTcULaiyHlHu/1mKx5koGQC+Z6YEBiG7s7
	/G/T3o6Iu3XC36ZwsBsYk2Y2d191RIUKNWazcYup8fZgs93XxmmgYfKyU8Tl
X-Google-Smtp-Source: AGHT+IE84LTmqSETlWOoCdeYwhS3c8Uw41Ng4f3INC40Oz0dhWGW699SiCdoanLKfBiQGRByedVlVg==
X-Received: by 2002:a05:6a21:394c:b0:1d9:261c:5943 with SMTP id adf61e73a8af0-1d92c49b0b2mr16378294637.10.1729479538692;
        Sun, 20 Oct 2024 19:58:58 -0700 (PDT)
Received: from ohnotp ([2001:f70:860:4100:e712:ac1a:da07:2e53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0ad42sm16233695ad.75.2024.10.20.19.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 19:58:58 -0700 (PDT)
Date: Mon, 21 Oct 2024 11:58:47 +0900
From: Yutaro Ohno <yutaro.ono.418@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>
Subject: [PATCH v2] rust: kernel: fix THIS_MODULE header path in ThisModule
 doc comment
Message-ID: <ZxXDZwxWgoEiIYkj@ohnotp>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The doc comment for `ThisModule` incorrectly states the C header file
for `THIS_MODULE` as `include/linux/export.h`, while the correct path is
`include/linux/init.h`. This is because `THIS_MODULE` was moved in
commit 5b20755b7780 ("init: move THIS_MODULE from <linux/export.h> to
<linux/init.h>").

Update the doc comment for `ThisModule` to reflect the correct header
file path for `THIS_MODULE`.

Fixes: 5b20755b7780 ("init: move THIS_MODULE from <linux/export.h> to <linux/init.h>")
Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

v2:
- Add Fixes tag.

---
 rust/kernel/lib.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b5f4b3ce6b48..032c9089e686 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -83,7 +83,7 @@ pub trait Module: Sized + Sync + Send {
 
 /// Equivalent to `THIS_MODULE` in the C API.
 ///
-/// C header: [`include/linux/export.h`](srctree/include/linux/export.h)
+/// C header: [`include/linux/init.h`](srctree/include/linux/init.h)
 pub struct ThisModule(*mut bindings::module);
 
 // SAFETY: `THIS_MODULE` may be used from all threads within a module.
-- 
2.47.0

