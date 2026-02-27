Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5444B39C636
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184905; cv=none; b=FrLinb9OLM4+yD7zmld1rpVsO5fHbG0H97ogg1yfdYGonVpdXRZKULenX0iqqmhIENUsspgEp2TIxRPo5YNNVQesZ/7yhygON+rq8SqVpRCG5b73JqbjXRWk+l5/eoQ+hemkrbZXiLdgbmRUuZJr9hirIFwzbf9zj3Bs604rVzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184905; c=relaxed/simple;
	bh=hLzY5zvmD9NGFL/EGan3spqDHyPwUqW/W5YLCQQjBy4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lsP53fdQd8T/LvYiouF7B2ikTkyw+9pGaMPDlbc93TgrRx5fGxvPohd7zmDwBia7mB2oPLI0WhXrWF9CiXEOhS1JL9NOX01mT+FAEV+AvMNKDsSgCT3kQn/dJ4akZ1mW6Qt5XLnHPD9fRAbcJ5rA6pO0u3ic8Bci/z5S95aNepU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hX1ZRbko; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hX1ZRbko"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836cf00787so28182805e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 01:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772184903; x=1772789703; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gH25F0zRXqEyqEuX8155mN1kiuKfQU5DG34qSLC8sok=;
        b=hX1ZRbkoq7ZiJhJSQsgFXYHXOCRJOQWRHnQthl4MER2jWrpJyirWg+Ga9HhckelMAQ
         7uqPdltU3VT2n7/+Q58cEZ6CtzvCbnFGlURlJj5tZbG6ef0hsObj6gOBwk1zt0D5iYG7
         cjftAJ5QKj9VZzstmXUhtaAzJIuYDH7RFdrME50LElPgfKtba4Yq/mrtBQuqCjK4TC/y
         4oVEyH2DsQaaAvJZweHLR95hBrci4dI+l0teCln9uhBSMlx25sE3ZLnkimDkuLh+W+fV
         CfMECiQL2GW0ypb3qzujzK4GXCFJwwSUEsG9m3N/nw/8aAcLInW5ztPvt3jES/4uklD7
         vt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772184903; x=1772789703;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gH25F0zRXqEyqEuX8155mN1kiuKfQU5DG34qSLC8sok=;
        b=bZ6z1SEzJiE/q4fTMVarboxCGcwqruKmU+lYXG99abDFfoNrasWDFEDifyg7UJv4V1
         r2y6re0YFAFy48HQxbMEcZjJBS0m79wZCnLJw2uI6/c0fkeDJyrT9GgupVbrev7WgTps
         k2HBOl6kpaAVozbLJY0pOT8DLX9/ryU57YY7+7MSLkJ2GRTH/jB7by0rDSwq+ZcYkgYR
         X70jmSL0wr/tlFgz9Mh33c0eoNRrl35TVKJ7jONFd4PimVNdlgM1YZGvaiGaGjYfrjCd
         xF5IGgIyh6FqsD6PUexqDb8HDap4dy2kRXYkSkvnmiqtHwQnFTmqvegR90eUUA/Vhs9z
         ziUw==
X-Gm-Message-State: AOJu0YyNRYybS/bN4sVQsXcZy8WIONNGSXTwXs571j3RErEQ6ZtfsrkB
	3tI01H4xdXpbgTVPU1aqlvZzpXEhSvu22H4xbN9zYVLtiGElAJdHm+UXQ9N9E16GppfD9UsYOxG
	rzVOBLVEmMDRctOUyWg==
X-Received: from wmxb5-n2.prod.google.com ([2002:a05:600d:8445:20b0:47d:5bef:a379])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d21:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-483c992e3d8mr35720375e9.11.1772184902501;
 Fri, 27 Feb 2026 01:35:02 -0800 (PST)
Date: Fri, 27 Feb 2026 09:34:47 +0000
In-Reply-To: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=792; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=hLzY5zvmD9NGFL/EGan3spqDHyPwUqW/W5YLCQQjBy4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpoWVBVZ7u/UeabYvO45djZDAms4+zz1KiqXoLW
 dti1J0QTGmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaaFlQQAKCRAEWL7uWMY5
 RgMDEACmep1pdPcLODFVSrSiVnKDvgw7hkpRiyov0YpYMyYySpf3B/hrXgfGre9gHXFQ3U5mmmy
 L37uQOCSbcYObR0LkH0Q4XlRrCq7xmh0bKZmt4qZWj4dWr4ggplcSY8A8itfS7rM8TcyhRSQaoT
 4wVuFle9Tx70mcW3ssQRubHCDBVDsGt6wt/bV2mS3bS17e92JMmJ0eekh9xMamLH1iNMVpu3eev
 P0s6JBqCA2/DDbPguMshQIbQPnymg4dk5X0YCvJHNLSC1BeningugHX26S2mjji1K69OXAz/9DY
 C9iaaMmmbOYmhury9SbbpAYFcCzx+ZpU1pG7eGz52szYtSWRjHIesuG9BbGlbMVD+ufwfLN5Hd+
 Qy42W6i/ac+iB496vmwxs0fvGVLE6DZ1gwllMbCf/6U700i7tgWVlOJ+OdG7qFMEwmKvsgdLrOB
 IadjTcEWfJEyJEYrJeCTaPPgtEjQ+MbccpOQSMjp9xYPSR678TO+VqeQs3v2/qQ395lHYJxSbvZ
 vt1MGOGAu+RfjTKOU7hj+/9UF8wndYOzHpVqwOqcdNnzE//dKy14vVyZS3SsLC8py98WX9NR8D8
 deBwYAGO5mU0yktrDY/VECoUq1k7FdfMSdiL+YIoKpTIS5XQ6EnL9nf7KmvRbQugSkplzAToSWM fzl3RfZDhs1xdjg==
X-Mailer: b4 0.14.3
Message-ID: <20260227-close-fd-check-current-v2-2-b3347edbb310@google.com>
Subject: [PATCH v2 2/4] rust: task: implement == operator for Task
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

It's useful to compare if two tasks are the same task or not. Rust
Binder wants this to check if a certain task is equal to the group
leader of current.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/task.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index cc907fb531bc..deb948d99921 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -362,6 +362,15 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
     }
 }
 
+impl PartialEq for Task {
+    #[inline]
+    fn eq(&self, other: &Self) -> bool {
+        ptr::eq(self.as_ptr(), other.as_ptr())
+    }
+}
+
+impl Eq for Task {}
+
 impl Kuid {
     /// Get the current euid.
     #[inline]

-- 
2.53.0.473.g4a7958ca14-goog

