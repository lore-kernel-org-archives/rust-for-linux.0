Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4443254A6
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704329; cv=none; b=l5hjuX2ecP4AplI/RIRaGgN9MNENpMZVWMxwJKXsFMz75MI47xfFB+HyXsVRk4PtBvNsg0vWHpIEhBj3hiIdeTdbl64BigKSD6QpnsTQbhDvytxz4g8gkjfPy3f6BnTczdrXQ12gjAZngA6IPH5q/BTYPzvLn7qqpIYtPEt7rAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704329; c=relaxed/simple;
	bh=H4iaBBTlhvHCEryCjQFMltQR7e05Fh09B4dM7j/Rqpc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oonCq0N1tmLL6IrGWxUzsFMUzQSOXFQ8CFJc3uFU/TfLGIVCj9KnOhClfcCho+OPjjhm5f+eQV3dmvCmhyW3uI5s7O4Ohb5XrnZql+FS0rpwpelmZTq/hJIrIGRKZ3zHdhHBknKjYj/0pweqNX2wCGbhLQ45cJX9NAydjgytx94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DcDb6OLz; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DcDb6OLz"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6450e804cd9so5473587a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704326; x=1765309126; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7c+Qkndh1wtrCANM0QTrcfgR7cYUUNANvU6GXMtJovo=;
        b=DcDb6OLzF9SxRnSwBHnXvl2LP0XUGjVXl+8buHf37czqwRfpaeLtWgI5DbMY3KsJeJ
         OZ/fvzkkRzOwEWfszZX7Z+J63rwrkQikthzFt9rZD0YpX37ngL4X9YVycnH0iPkLgBXk
         MB3QljMfGkbA3sYE3IhFDB4ugC02U5O6KzVuz8D4cvROyC/6QXD05dgSDs90i0O3faW+
         VN8kTz4zqJ7OLj18P64fkiJOXH9yhzO/ClswrCQIq7ApCOXLHNkWjXTVEzSyUtjY8KCP
         uivJi++2mU1/R0Wtea69uc+cTTyUnWHextbALg9/9LmXaSVdVws8ATyF07xtjC63tWh7
         zhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704326; x=1765309126;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7c+Qkndh1wtrCANM0QTrcfgR7cYUUNANvU6GXMtJovo=;
        b=nKTTFC184aT5/zZEdRTb+6aVFPLEjJy78/Bv71N1XIGppbGsm9fhjyzeBO9XygrvRX
         BNdYZLI0Tpj9mRWaJDtwJi4OC6hRQDBrVifVbVm709u55IlG4D6ljpE+nNW4RPfdhKYT
         8uHnyPzYUS2gvPe2KtHf8GzsupqQiFhPV24U3dL0t4cLLWptIxGBOzn1TbPTRfaEGHBQ
         JE5eLwlrFruYROK5VWIh5XqRxVRnSVAYEJxXr4kOMC+EmLJ/CVkBrWJcRgo4hDCq80dQ
         UgsqL3dkaqmle1sY2MHO1LvxY0btNV13CCWSP2xcnVok/NUWTLWyTq/WxqelxSgOIxnb
         dJHA==
X-Gm-Message-State: AOJu0YwT72pg3qT+zpAycowPT6FhgfMoZyISpkCOqOTWFG2vaptdkzSk
	UGrzywDpATiwZHaHyE/iN8V+jSimHcZIqOYcmWYRaigFtjBP5+FwdPAXE3aajfVyp0y/pyOHTSy
	AweIWMsRzn7xGAniCG6D3qf2oTVnKSCmEs1CvCNAuT1KZSV3fo2gxacN1VuDlJvMNQqbp5qGSI+
	Ni6IW90SAPNwh0fWhnDt3RLcXKgMYiUlDbQbQMdnZBZOZ98yJCgCCYkDbLS7Ojzvg=
X-Google-Smtp-Source: AGHT+IH1FNX4pO0fJdY3R3ClHdd/TtBuRnnBE4PcG+zysrs71gOUglmOKornsqNxKpbo6MHTmNNfswsZlhs62Hw=
X-Received: from ejcti14.prod.google.com ([2002:a17:907:c20e:b0:b73:79f8:d4b5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d03:b0:b72:6d3e:848f with SMTP id a640c23a62f3a-b76715ab9f6mr5143870166b.19.1764704325934;
 Tue, 02 Dec 2025 11:38:45 -0800 (PST)
Date: Tue, 02 Dec 2025 19:38:08 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=835; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=H4iaBBTlhvHCEryCjQFMltQR7e05Fh09B4dM7j/Rqpc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0ALw9xRxs3yeSyc4DhwiBD9bWAc1PfE5x2uG
 elwmIzeDfiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACwAKCRAEWL7uWMY5
 Ru0HD/9faKljgYx2I0IQcXScwNqbmWoNZht0bhOyo3Wt98SKnkD7xDWcUBzKavMxEfzKQmhDE+I
 BfbE10P3wz5/TrGVL2zQ+phu+5JSWI+4WnZp27g3zPYZdAm1U/xue71fZ2UPGAtscUgao7VfIHo
 JWqF8jS1hIxTXGQwOMR46epETkxdVYhKfYAGc1x7hKpIaJ1YWIifdQseR0h+v71NspxP544JAjg
 1B/cGRFtQfje8IofU2y7pOg8mSI6GrAzeSFNOSn4V5oWF0nk8dK8PPPbsZkqZab/G/N876QRw3p
 T5BuaDUKTDr5v7AQfD1SNe7VlR+IOo9CP1h2WIdrrxhiKjCLu+VdIDD4HzbSCquHf7JaG4cOT5l
 jL1NFBH4f7PpJbgpczXAMqB3w1sFT9KQYjNuaeXnf4Z+2ExIM5CcFNdE/0wAOjz+qjLpVIkMlq9
 ssexYO4Jcw2qKnpw5P+eLxA3GuKyTbD73fBEQWWx5HVWGNmQCfgl7GiC4qJaHMg4Jm+sC0nlcjv
 SCsLvdpfcKApwFRMCcySGN+1KwrZ1i/Sc+HSDgXcXKYywCKGk0tzC97EOVIm7P/GZJYhSFFtMnG
 8yDVNpA9zdi6zTT6kTY+G9xCpmB4GE6iaD/lxalnvCxs09/u5B2AzYKV66jNb5roQ8IyjnJNb6w Yr7Rmd9R96Zk/0g==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-44-a2e13cbc17a6@google.com>
Subject: [PATCH 44/46] rust: wait: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
---
 rust/helpers/wait.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/wait.c b/rust/helpers/wait.c
index ae48e33d9da3b0a780722b79b89d8d766efae17b..2dde1e4517809d20d09cb9a355f8005fcb160d4a 100644
--- a/rust/helpers/wait.c
+++ b/rust/helpers/wait.c
@@ -2,7 +2,7 @@
 
 #include <linux/wait.h>
 
-void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
+__rust_helper void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
 {
 	init_wait(wq_entry);
 }

-- 
2.52.0.158.g65b55ccf14-goog

