Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4463B1A0BED;
	Fri, 20 Dec 2024 06:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675955; cv=none; b=hAT5uv0woh0S2rHHUb+m8Re6BMJwRlYHRN4/9YSA1/ghhrBHXzu3Ln0kwqaO7A45biugedEh302Acb9fEeSMREksIqWTq3oZ6Y7oQwFUfXegNfCEYRUwrWe1O9TdjhW6sqRkost8IgABfMyuf5ltcamQ0sXN4bYlqtNJQ8Fr16M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675955; c=relaxed/simple;
	bh=NRfX1HJo/E3SylB6SdeYq/1KilQUuAAVBNBp1f10Xnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWJmTE5uI1s+Sk0qugNN6h9GNXBLV21jFLBWfnr1yjFAXk54IT7VgIwyS2MB3LBWT4gJrYdegUdM3kPz96r/AFIUKmEfqsmGZJwhgPmuMhZzL/AqCcbjYWR3dlFoueRNYLUuSl2y2H92+9cPXm8YeuYe5RRvWig1yBNrjlmHOOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezTFaGDX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezTFaGDX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21669fd5c7cso14807185ad.3;
        Thu, 19 Dec 2024 22:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734675953; x=1735280753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXNqMl/E8m/Z0sNggtfd3XtS0BOEJiLoNQQLccgib2E=;
        b=ezTFaGDXbeIzwt+u+8dEzeO1IvcObjKB41wi6UItZsEVGGAzdkU0APJFUh6V6kEE4j
         UPc8q9531e3H7pJjlBfpvR43PmNNOjpj9Xn8VEgLsppsTE7wnrRfXPle+F7xPTtHCB2s
         scl/rm+/iJgQPjhwc48RVSJtKv2gumafZe4cqvd6fEN5gVWWuEky5kxd7glbhYqgH1Jy
         o1T6kU2f8/LVbiQf8kGUve4ap4poDSR4g9ogyryoBML0f/B0i40QznPzyiP7K2Z1Suo5
         FUl8l9X9ofU5BPutsuG9DYIYwL82Jl+1QtSeKQQLmZP2+A7uM5/qcB9WJFrUED/TkLSp
         tLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734675953; x=1735280753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXNqMl/E8m/Z0sNggtfd3XtS0BOEJiLoNQQLccgib2E=;
        b=MoQAIREp/m4B43x83RIATrCt4caWiPgGGbeTs6tOAMWrY1S6Id03ST5frCncdlZ2tk
         jXQ6d/3ZDrB5DSrJqjfth5QS0F1MrLn8cn1iIe5/cOsOcOlFZL5fFXeCVkqEXPniFUTQ
         g9K3HqaJmDfdB8NUQCY9pkSBKPbr6LrillUq8R/HlDT31MT4CH4aYoX3Tca0zATSduTU
         iYs0cUAmNdD8l1Kw21Pqz4nUAklExKk1qATyXRBQ01QkrPL3RhepcfOuEvlor6mrtNa0
         j3zSVc/nkfjR2gcTCwXGEqFZyAPXbhZbed9ev8m0WX5J0hgCjyTXLqXIZWo+hmG7Xhpe
         TxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWwWldABXKHqIHMqFY64o6raxC8yW+5GFesFzy8w4hc1uf9jpDrLYqof3S2Zl9S2T/InML/x4Cj0EmmEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxINzjsjb2pfHqCDWlTO1aNcRXRtvKBhjfAbUTN6pJkfooatHZ4
	rtMKUkO127GpAX+cQDMX712FHUJV8s/qsQ9u7VJSwaKq0QXVxs0k
X-Gm-Gg: ASbGncudRESZiPRnbTXJ1K2ZUFyw7crmxlbOgPzMYXjlxIcRiQmVEp1e4mtAvmyLutz
	1OmAX1qMm5OD5TYI723mJl2y/BR7jC9y5dxs8lbtSEAaEtz4OGKBM+RKRT5FSGxnaSUAASmP64L
	NBQDJzDW2Jeb8Di1S7Jw+0Qoc6KKfnTz4Z2M5V//nU/VYFXyBIRhw47Cp67RKqdrx8Jmn4gc5Qe
	QLLmiMkDzCzYoBbfvJNCdSpxfRiFjeYLmmy7t25Sul8c1cXFe2zv5XnsHlTsL0mxg4=
X-Google-Smtp-Source: AGHT+IGf3rSak54xec9cFBbFmWV8Y83jtfACYfhQ5UFK+mzED4zkbFeV3t1fBRJj2ZGE7387DRAuCg==
X-Received: by 2002:a17:902:e890:b0:215:b468:1a33 with SMTP id d9443c01a7336-219e6e8c921mr23110415ad.4.1734675953462;
        Thu, 19 Dec 2024 22:25:53 -0800 (PST)
Received: from lordgoatius.hsd1.or.comcast.net ([2601:1c1:8502:a6c0::b10a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca007f3sm22001755ad.228.2024.12.19.22.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:25:53 -0800 (PST)
From: Jimmy Ostler <jtostler1@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Filipe Xavier <felipe_life@live.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Daniel Sedlak <daniel@sedlak.dev>,
	Alex Mantel <alexmantel93@mailbox.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jimmy Ostler <jtostler1@gmail.com>
Subject: [PATCH v4 2/3] rust: error: Update 'stack_try_pin_init' example
Date: Thu, 19 Dec 2024 22:25:32 -0800
Message-ID: <ec8badbe94c5e78f22315325a7f2ae96129d6a65.1734674670.git.jtostler1@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734674670.git.jtostler1@gmail.com>
References: <cover.1734674670.git.jtostler1@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change documentation imports to use `kernel::alloc::AllocError`,
because `KBox::new()` now returns that, instead of the 'core'
`AllocError`.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Jimmy Ostler <jtostler1@gmail.com>
---
 rust/kernel/init.rs | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 347049df556b..3d099908dbd5 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -290,9 +290,16 @@ macro_rules! stack_pin_init {
 ///
 /// ```rust,ignore
 /// # #![expect(clippy::disallowed_names)]
-/// # use kernel::{init, pin_init, stack_try_pin_init, init::*, sync::Mutex, new_mutex};
+/// # use kernel::{init,
+/// #   pin_init,
+/// #   stack_try_pin_init,
+/// #   init::*,
+/// #   sync::Mutex,
+/// #   new_mutex,
+/// #   alloc::AllocError
+/// # };
 /// # use macros::pin_data;
-/// # use core::{alloc::AllocError, pin::Pin};
+/// # use core::pin::Pin;
 /// #[pin_data]
 /// struct Foo {
 ///     #[pin]
@@ -316,9 +323,16 @@ macro_rules! stack_pin_init {
 ///
 /// ```rust,ignore
 /// # #![expect(clippy::disallowed_names)]
-/// # use kernel::{init, pin_init, stack_try_pin_init, init::*, sync::Mutex, new_mutex};
+/// # use kernel::{init,
+/// #   pin_init,
+/// #   stack_try_pin_init,
+/// #   init::*,
+/// #   sync::Mutex,
+/// #   new_mutex,
+/// #   alloc::AllocError
+/// # };
 /// # use macros::pin_data;
-/// # use core::{alloc::AllocError, pin::Pin};
+/// # use core::pin::Pin;
 /// #[pin_data]
 /// struct Foo {
 ///     #[pin]
-- 
2.47.1

