Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726913126D7
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 14:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871031; cv=none; b=itJcQC+oAFdtyc2hdbBsqycrA4DgPRkjsAZUgEpp8GRtouBEf/XZGAwSwLEJSS/b7MwOEieqPyIJ8qyOflmo8P1qORX2UlcVXelwbb2DFI6dviPOE5y4dKXH3LItDYnz1YuY2vvQMmPvD0ln7yQWaW39vsOd3uriJQIBwQ9eh5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871031; c=relaxed/simple;
	bh=IBn3s7dR48AHoJ3Pzsml3XvtbVOaej+/nqZSqE/XgYs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WTBOCLe4fMsLuWMjBme4d9sfJbdpokRZxXna1C3Mt3zcTn9iXMhsMuhmFEJwLEiDrE9+lA5Iv7z67+bDQcjKf89/4xk1btT7fV9Y1pEu9cf4rTDWl7F0Jx72Y4RvLj2P/zJxD47t26QPjcM1mczOZ5LJKjAiHnVSqg5MzeESHYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=darCBIAd; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="darCBIAd"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429be5aee5bso1950443f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 06:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762871028; x=1763475828; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wh3535BciDSZ8H5Ye4tujgraUfcumpYGZ+HQQQL9kno=;
        b=darCBIAdjtAhruxykBIIZLZFJrNW0Ad/opd8JYrMwzfPlrJSouSHCw6kusvRIKi+bu
         ek4UN9lAN98kHUuPy4I8yyLGKb2xSIIl7TTX5Yjhv1V9g0cIaR0jVwSXNtxNfyvTl4NY
         TN1EjUvRjwNMRvkF7S1W1A7E6THnMWjhXBwDPDF52hHdtmsoPlPRHWQZf1hACuK9Xqo0
         zVF05q+b1qqHcH0bol+hOFj/dFpnUSxa1pZlZE8sxxk2899DGuVqz3h1ms6dszFq4akd
         QMuU0lJIoJIT/MpKXeFg6k9jU1N89HeowSn3k0iCmeI6b6Newdnnsi/oR4+tEpyKp42m
         tddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762871028; x=1763475828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wh3535BciDSZ8H5Ye4tujgraUfcumpYGZ+HQQQL9kno=;
        b=guDf5xAJzfP8f2jWa4W3Nt19eHRAQ2RAxPEhKDPeF3RQaxRNR1Sctn0oYEAwrro1Yh
         4a+jHlpzmY8auOdCAAeTxpu3ohW8YQVu5n0eHFHizqgr4ekTwhbTc96CbUS53TwhCrXh
         NSuUETG/hGyUXqYtZVIGgWz0YmLs7mt9LH7vrBKDpcGc/NTfyECgjKE9VLG3TtxfSpGJ
         cQyZYtVn0DUMxittWI/DEud+GpjHh2lpaiEUyPEsciB6vv/EAtFMugiV6MH3krUkVIaY
         kQi7F5p4JnIph3gA/Vi7VGHJ3KNteNZL1pKkq17eOMgDK9iGl4QLKsxJhBQUPV1pYgbj
         mhRA==
X-Forwarded-Encrypted: i=1; AJvYcCXMg/ld/Pfm9i1PJXOLG4zHRWmN22/TPqJTZJMiYOvmwEBFIDZGE+JEiuYc5HdW4UfEB3qahqiCBDWjag9+wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSICXlIdKLIGh9v+RTF/zAwNYuyzYR4FIfG73HXf5lfdDMHTpW
	dDMzgCSjdRji+MP8t840DN4R8h+EdpMq2oT5CDBO8+KkoRMubi8f1MxgaQXtqM/OdEU58QoykGI
	+xXfQG9j2qJy7ImQWUQ==
X-Google-Smtp-Source: AGHT+IGwO+OuWt3zh/4o+kLcFYmMzAzbIBHhauOcZnz7ErY2FoxXjlDIlMacaOviUou60qPv87TPtREZN9KeBZU=
X-Received: from wrvs14.prod.google.com ([2002:a5d:4ece:0:b0:425:f04a:4d98])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2483:b0:42b:3b55:8928 with SMTP id ffacd0b85a97d-42b3b558b82mr7021331f8f.20.1762871027849;
 Tue, 11 Nov 2025 06:23:47 -0800 (PST)
Date: Tue, 11 Nov 2025 14:23:34 +0000
In-Reply-To: <20251111-binder-fix-list-remove-v1-0-8ed14a0da63d@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251111-binder-fix-list-remove-v1-0-8ed14a0da63d@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=IBn3s7dR48AHoJ3Pzsml3XvtbVOaej+/nqZSqE/XgYs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpE0bt1g9lZ+YcNINcULJP4tTjbI73pg1hfY+U1
 HmrSpX4U5WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaRNG7QAKCRAEWL7uWMY5
 RpGnD/0YGlOKLEoF0Nikg/FT2gIa2ITJjO8dajkRQmiWu6QAiDepE/TMkUmEvLoHkFyI9Q+F3N+
 cYcCjXmsPytiMOtsgTb8yCcoOWPvbHXp440hJrrIbVFhrR6yfonevjsxmiNfEodVlKd+7C3Z9jC
 TYMO+zGeD7SE/uz1GBTkb/cw3xMhb1PnyOvemQ2w98hVf2VLOcDnY9YXi+o396OCI6JPqcLklLa
 slG+8JhVixCRpOcW422lPrfR8mvqJC3oPmNj8GiaFCMFyLfr9tuK5Wvtw5iFM7FBYgddh5pdb1/
 5B6Es8696AjrQKcDd8RnHBRiktn2Tnb69cUC9KnVyiWeIjoZf6U1opAcDbEMdqiTWlVZkMizImP
 x3WR8UrbKYhh1L+69IuVAFMrjYdkP9oIEedaL+uq8UuDCo3p+lJ3xlVDvKa0pNwMM8gtLtvNvh1
 1di5ZoTmXzH7lHlkom3qMKwfFvwww+BRvzYkIwhdtO9Ji9C5SGLWDd1GEm4YeEUo5RN0Pm0FTt4
 bdqEMVBmbIi+xFteCLsyGRkbHM4GpHJoNW4WKE86TKzyUqEBAXG7LNuv1J/IR/lajGNOHS9G0jm
 FMxpv/pET2uc7Mt5qVvjkNjIENoo5mD97C7+7hI3PhhIaNVz1eBQIxGUXXfUFPs3NzX6iz4Pc38 HBqnBXqH8PS1zhQ==
X-Mailer: b4 0.14.2
Message-ID: <20251111-binder-fix-list-remove-v1-3-8ed14a0da63d@google.com>
Subject: [PATCH 3/3] rust: list: add warning to List::remove docs about mem::take
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The previous patches in this series illustrate why the List::remove
method is really dangerous. I think the real takeaway here is to replace
the linked lists with a different data structure without this unsafe
footgun, but for now we fix the bugs and add a warning to the docs.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 7355bbac16a7fe7feeb8bc6408671817b186b21d..8349ff32fc37ff7141fb7c62d26653bda6507f91 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -576,6 +576,9 @@ pub fn pop_front(&mut self) -> Option<ListArc<T, ID>> {
     /// This returns `None` if the item is not in the list. (Note that by the safety requirements,
     /// this means that the item is not in any list.)
     ///
+    /// When using this method, be careful with using `mem::take` on the same list as that may
+    /// result in violating the safety requirements of this method.
+    ///
     /// # Safety
     ///
     /// `item` must not be in a different linked list (with the same id).

-- 
2.51.2.1041.gc1ab5b90ca-goog

