Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB84B338916
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616976; cv=none; b=SEdjmDC78rh+PZxXBYFjAN2DvowBZMPZr6DcIib0B994D6BCS+B792zM18S7YfSc79UxzQFoH9vKrdsrEipAC0OSEHSgme8pnB1l08zLVEb5F+YF+8eLznduk1p4G8JcEA5c5ZeOpAG7oriiKwcSchOzu+KymH+6S1fLSlgwoIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616976; c=relaxed/simple;
	bh=ZtVeIpLbZbRHLv0qnvkpGpXOzl8W4beEW1S836HpcKs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dwVPjNGRoLLTMqpn5PVuERzPcLM34eFGZ8tLB7gH9Ptm71Wdt/RkWPEtsFOYSvxO5mf5V/De7yjGFibkbK3tZDocOqg53jlbzhcC3UJXVmYSemszD4E1/hZBMorxbM12wH1MNqTDI7iXLULb5uIvI00tFSfmWo9q6iFtI1R9rek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U7uS+Gix; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U7uS+Gix"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47d17fff653so52245005e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616970; x=1768221770; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N/6p9+3zFT+pXOB5xIp5iscxGdhhlxgF1ZZ055O0bx4=;
        b=U7uS+GixZ0EXbsB2iZ1PS+Ny+tthf5a96XWtFBidXBVrVhx9CYc+ia02DTzG3Tkb3H
         Sss46pQ3ZvN/S/Y3j+5pV+VbCeMbC+LpCJhdjJciqDnVJzBnNeQRJqCf8mJjtbP1GrBY
         oKs88jPYShFxGHrTO+LT3oY7wV6cPv+UW5Wdd503ciJfsODpyRS76ZdINtjEshNpzhxr
         7izGX2u4cP2td00i/H5MSqelRc5+mPjsLHYIKCzUxJbOXUCoQtKnqpdc+jQbCCwY+whO
         OclxWM8fLo5RH46rmrix+f/3KjZ3ptFF29pIpgFax6jPiaRnWhWeSbaXOFtyq9Y0DuUY
         ULhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616970; x=1768221770;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/6p9+3zFT+pXOB5xIp5iscxGdhhlxgF1ZZ055O0bx4=;
        b=SEkFtDM6m11cFKC+I8n0RwaVfovR14ylPVPwDw2zQgWonoR2JT/nVhCDEROvOc2QSQ
         KN8lDJqgM3hoJ31Ebvn1dULzB+MboXVCKdSQC9MZYW715nPwmoKDruyXNuW55l26Do64
         Xz84SGJbtecalIJSJ8Z1t5OGWA1KqS3/J2iAI5nDZLVe77E85TXiiosSKLTOyyGMEkp3
         9JNCB+JADAnTuSN0x++bfpTWTlVJEA7W8i3guaQUi2Esfyr6hTr2NohRMjUzkRjpc+DY
         XSYWqqlpkXnneLbtxcCe7+8FyLqfVUIhfNTOnmB9gMXENXIMhpjyw2T5/mDi9ZM8mE/E
         2WfQ==
X-Gm-Message-State: AOJu0Yx4OJDCX08Srv2SY1n8LYKnUPiznIyrzPrqTxK9CuAq6/oEQSoZ
	EnJO1PJ+o64ICQUh8h/QLX6KYfBClAUpETNwG62VM1WG8G0zcNjPsrgtwmJLGoDguBbNJTN+aTt
	kJprFFJyhqYmrFpBZHczOW8lDHg+ZOwWp8KPG6xuBBX6bF7Q/j8KzyAt2YDRLRn0X6N93iH/XLW
	Li7/86jzPU5BCSylOwniF+k3w7YEGbepgdP5RmYUV0LNQzHuvDyA71pTFwDlqhlcM=
X-Google-Smtp-Source: AGHT+IETa/hEWjMBhnF0d8WRBl40INbYkGYyHJlmgRMipa/f36ZHBxCi7TH7KrU7ORnLh3lKyY28tyx716Hp7LU=
X-Received: from wmbgx15.prod.google.com ([2002:a05:600c:858f:b0:47a:8fa6:6a57])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348a:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-47d1958a755mr666630925e9.21.1767616970141;
 Mon, 05 Jan 2026 04:42:50 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:22 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ZtVeIpLbZbRHLv0qnvkpGpXOzl8W4beEW1S836HpcKs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G7HHV1hOF1selWjLuapzFMt5JzyFUKOcHRi
 Cq9svoQWfqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxuwAKCRAEWL7uWMY5
 Rn8HD/9JFPomOCnyNnaOJ4yutqOp78L87AVh5prWRZNaud7QdVjx8emnMRRVBjXNV+u/nx1eYre
 WsTFbpHIZE5W14ekKt8C0rtRC6vvVz0LTzGPV706KDJ8TkNsXSUz7kFikT9B3EmXrWjeYKT2Mld
 PyINeAr0Yv+39dr122h528kXEJm+1cEYsC1iaqZY3g5Pfvytd4e0n44NrJ4HE2LIrP2QYK5kvqx
 Lk4lsVXEQAvA2xZFiSnzysgYHOQPB5hkkMbbEFFCQT4PFFf0bPoWtKsLj+k8b1EbQC58lDqh6+5
 NY6kwR24fCbCCu8W7/ctJl1dKz54J0aJ7qB9y3LLvVU9UiLSriAPUtbU2InYrxdDfcZmFlFWFjN
 uuatpK3SrnrQXp/OhtVRMePjmFEpCK0kxfoDCEPO2JHgeZ0tGukErnz6SR39vUoV0izSix2biOb
 Z1ip1WqJRLeuol1lQr/TRdwJEqNmpSYcYz+z4CBrapAVsHikEL1Lg65GuIMdy4PpBsS5uANuuvU
 SUBWPj7eDwjfho3sqkjzIcNx+ZRqy+02bm9swjiET581uiAO3e4leqkZNfa9dOY0OrGjXgVmbHE
 JuRZ748CUXWKdHVcf4PMou4BJ0m/cUdtilLHP4N2FWEHERDMuGwTNTvbFOVh6SWUlAHZRD3VQMn wEjIdWoZGaNaCYQ==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-9-51da5f454a67@google.com>
Subject: [PATCH v2 09/27] rust: jump_label: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Jason Baron <jbaron@akamai.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
---
 rust/helpers/jump_label.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/jump_label.c b/rust/helpers/jump_label.c
index fc1f1e0df08e79c0f06ac46cb6729a08deb7bd41..7ca384e73121820d882fde645a80cf718e6d9fbd 100644
--- a/rust/helpers/jump_label.c
+++ b/rust/helpers/jump_label.c
@@ -7,7 +7,7 @@
 #include <linux/jump_label.h>
 
 #ifndef CONFIG_JUMP_LABEL
-int rust_helper_static_key_count(struct static_key *key)
+__rust_helper int rust_helper_static_key_count(struct static_key *key)
 {
 	return static_key_count(key);
 }

-- 
2.52.0.351.gbe84eed79e-goog

