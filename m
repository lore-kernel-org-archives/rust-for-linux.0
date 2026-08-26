Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A037F442B15
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761758; cv=none; b=eIcZLGlhtKyvf8Iqc6ax8So8jxSy7UoM8aK55juCgKcZ+47Zr7uvglgN+UFM8UVX6GN1A89M5wefXKfINGr93SthIF9vuRy7HN8SKaCr0qXav5sSgfJsjB5kmBHSrHmKtI9paOr/mZjiKzg2SdvBODWCc6mg3kS5ea2l7NVbSWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761758; c=relaxed/simple;
	bh=VoPeEJFFOA99WCBv2l441eSmX/LrsUXL/5BcbQCFCJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f2hPkkH29P8emRBc/BSpWt1wLCw7H3kusQFHX5LQWzj073gvJoNZUXkLoCteFXagO+nLpOnQsQXBpO1ORmcI2BPG2R1M3hSQdiqxKnrWOtIPH7NbJkrGHoJ0FCKDdOAy6n9oTw9Vn9JtvCMRMz2J6xE621HzXgtfIUxU7EeI+i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=TRFaxGZP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="TRFaxGZP"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fde295992so64354f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761755; x=1788366555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUUfLOnlt/aXWI0lKzWi0DQgphBknyLwgroapTBin4o=;
        b=TRFaxGZPhmy9Ee8ZLGmsfoujllaylHSfLIvM/FB1Ied29Nxo5OYjz218wv63nQZy+r
         EJERocAluF0+u7JAr6TDh9veUD59vJi+zAb5vQLHronqiye0wMVS0hgNLzIfPEZsxWFC
         aYlnHmma4/ORB6oJpVziwkWm+wcT/ipjOOUy+tfgrlECnKeiFpJjUQ+sz+daccj+5cv3
         yy6PSoO2JQGIVaFuWU67hcAvnLeM9SPjyx2th12jwmluTGqs/6+eGIPPJRikQEHAFIsz
         W9nDmyXTKQyOKTN0ILV7VlifBTvtMPY+EHQDzybGyc06cLSQ8hIJVq7UX59ZNWZZtwjB
         awnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761755; x=1788366555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUUfLOnlt/aXWI0lKzWi0DQgphBknyLwgroapTBin4o=;
        b=Vnnxs0pkvOSS2BdtsQnhG5jnZwG2LCq1DswS53qaQV61//jNCPQQHtEIq3LIyMnkKm
         /A+qyFktKGyCttgJD/Cdabr++pq+Kk3z3s0wiiW8X+vmDUNLKDv7WQFbwkhOD9RLIX20
         84oDUGi3+r0OPj9R+47S6xmA+C6aRKbunKvwaM/i9UG7oklCfx0QeaLYwSw2nXksC3iB
         7z7tMjN7n1T4W27DK/N14uOHFPqY8RSAUFFGXcz6icDuFDVa8Quhe8eaXMavR71X4NRd
         ZER7zeyxWvNySlHe9v0B9cdpYw1kZtq/MhZyHlgbYcvO5Y/T4xMGaRtRlXs2kyY+ZJn3
         13nA==
X-Gm-Message-State: AFuF++mWI/TrgXrUf5z8ne547TnhbrROc8jqpTH89d1LNrxzFl/1bTFX
	lRVdUTMAoHFnTwnyekHgvJDNFjBQJv+JsXGWCGQLH2qFztt2ehXEtRzFp2oGk3uYl7gN2CFjl1s
	btI8TVZ6X
X-Gm-Gg: AR+sD13SneXYj/gxeQWkAexF5If3s3VfbVm8fBzsm5/nR3Jez/6iChtehXWT81gziuP
	Y2uLka2h5vab9p8jXJVdGLPPsUR9TSnWB5Yond4Lq+Khkd4NJvXTzVrVK2f+AYd44UuKBR9BtoA
	9oM5Q025Y5gvVdC0Ji0y4uqYYsEQNf9zxqfeWsQ8mZ4ZOjaDZaGFGuX6pADtW2IgBsy4WMIFr5V
	RLrGrNq8+InXIDdd1+dFxtgle0RW9NLwrt5Cu43v8ZZ3sneOy1sayf1VASyGSOCcHrg2HtxFP/f
	Ms5OkyWXZgpX2X4UNDwC7JUwuBV4MzfWyPvVZ7z+m+TFGhe6/2SXLp8sAQyfgU0kMAaf2UlCVBK
	TDL3/pj91q5WMLX11uqqNSS58W76B09uOb38tHB3CKRBq9dXbyPFm/QBzA9HMbyIjs8nhZcaf8T
	4mIoAwEmTBxJBL4IR3R/qcqReVZ5nm+0AZE5ArvDxXQEERMFYTmUBgdKw9rOFnbZiAmX6gmicSY
	F4HAa/KedXtHhsCqWZ08o0UxL8Ii9QyawIw
X-Received: by 2002:a05:6000:4711:b0:481:5a46:dbef with SMTP id ffacd0b85a97d-482eab6f628mr454688f8f.5.1787761754870;
        Wed, 26 Aug 2026 09:29:14 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:14 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] rust: workqueue: make OwnedQueue thread-safe
Date: Wed, 26 Aug 2026 17:28:39 +0100
Message-ID: <20260826162851.2497-6-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OwnedQueue only owns a pointer to Queue, whose operations are already
Send and Sync. Propagate those guarantees so drivers can keep an
owned queue in shared device state.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/workqueue/mod.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index e30c21214a81..000a29c9dc1a 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -380,6 +380,12 @@ pub struct OwnedQueue {
     queue: NonNull<Queue>,
 }
 
+// SAFETY: `Queue` operations are thread-safe and ownership may be transferred
+// between threads.
+unsafe impl Send for OwnedQueue {}
+// SAFETY: Shared access only exposes the thread-safe `Queue` API.
+unsafe impl Sync for OwnedQueue {}
+
 impl Deref for OwnedQueue {
     type Target = Queue;
     fn deref(&self) -> &Queue {
