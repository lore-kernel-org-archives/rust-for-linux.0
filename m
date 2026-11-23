Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795472822;
	b=l379hHa/DrV3dKCESYpA8/1/4zLwbqrjhguwXUGLC03ODA+l6hciAWNSOJn5haF5Ne1B
	 xqZ4PpP+e+Z7vBviYaFxiSWk6qGjG8z749+fK7s/D3GLSE3ny8U8VzLfJyTfj4/B5FQZ4
	 fJ5YEZW77O2oNK0ss7IwKo09aTXp9YLlX6OiMd7v/Ybggl9dXbT/YfmHio2aJYpppMIH5
	 mU/mL7MCsjUopXy2mlAixrBS9YBmVuVLPulUXyWNQ8Mi9HVXs3r/CtMNJ+/SCnFamIn/y
	 zJYLWSTzDm1oP0pkUgBa5X4/4QT5C0WVlk3ffzMtaIhrRLSdAcBlukKRWTRYJ6OoVYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jfGbsdBX2Mvxzr2Wtx175xx4xQStNQ0eUZXCme1c1Vo=;
	b=IKLSUhx/O1c+V2TboJ5gUVqg5ghJOj58Bhf+tz655zKAQuu/5Wb6AZ6dPlJBV3v+HCjw
	 F+7py+iHIDfpatsxKIwZTJEDO1wNWhoYf2oMjrmK77SZPLBUPVQYJ3PYmhPgt1E5Yu4C7
	 6H2KvUchbphQud2abS+bm9GJdLn3KFUJUCzNJZb3r/ZLdzWTcesFDIw7cfcF9AcRii9IF
	 lcRwhysJVtngxWGioWY7ayw84lVa2tCgnds9OjZD6NBvHnj8XPAQXQTUinG4ItVj0AUCz
	 OpNqp7pITpAkr21xJ9pS6ql6nQ5BXT0/D9PKeUS54qQGpE7Dplq1IgzCqqZWw1yHeJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=koUG4bpF;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDD1606A33F
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 22:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EDD1606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=koUG4bpF
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91f0274f88cso53613196d6.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 14:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795472820; x=1796077620; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jfGbsdBX2Mvxzr2Wtx175xx4xQStNQ0eUZXCme1c1Vo=;
        b=koUG4bpFoOw905e3gI81+803t7YepcQxyROkM1o3yHaO/xoL+NpIysBNPV2SWJy3zc
         v4Ccm3WF3y2wqk3wYyhz2I1mXCvDPNpEuo1lrjwvES5FKD3H8JKZ7+naFQ2KmIpEJl16
         /FYae572jcq8gGfQfsR6JRb4vhAugpKpCaadhIhu5E+MN7WxHZLLMc4s9xxHthpGR29G
         qdJSs6PQ8h0TWwV2J0i+qApLLtwnbTWHTT72dUx0g0cZLG5Nb71VIyYbHjF32a5/VGod
         +j9xW9oFe9Q0Mer/7W6f1sOQloF9oZIgsp2LR0TPpSvXcgGOqnzniCKSfTpW0yUXbT+R
         lBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795472820; x=1796077620;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jfGbsdBX2Mvxzr2Wtx175xx4xQStNQ0eUZXCme1c1Vo=;
        b=SSoItUqjegsuzH27aD/Qe1sSsHMN1OTTkFHKq8unCprROhbg3BNCJlA/Wk4PmmJySh
         Yu/okxCjv4fsm/+QmDcQF9H7YWCnQmRSQYWezxe+Su1N3h3HYedpgKJvBfnzlvd7qDrp
         J6lGkeGPegVqU6cD1oZmz4V7oOm04oZdXOESNdpBlG/HhzEg08g44gbqp46ikAwPLCcY
         8pmhQv8CnKamrk2SPf63pIdty9OTeJpqFqC62O/QP/sUUzrObfNG1Yf/KfF5WZhEBmcU
         dib5BS1kZo5I/7g//7XNG74C+Qi3VnPyXSPjABWB0f88oEEdQbOpX0fEECw/t+fJy3r3
         txTQ==
X-Gm-Message-State: APuU4Z8D3w7BvP3pfI8By7ls53JYbONTnQO08g+c3B13C1FwkItjbKSJ
	aLTzHuemi5gAEBrYwA4p1dp2RQku8PLATErzAxKH6Ean68Y79XijOefse1PGhNYhEA8=
X-Gm-Gg: AZFdTZc11ruksWxHB/iYhgem92TRSidqwKI0FQGOu0XCUoOkEm5T7PQbp2piT0nO7Qj
	5TPDkQDTDNyuBaioFsq1SSfvqyaKYWfSwqSwQNrzz8vHQBr+xxRHe6TsJH/e7GfdQIQ15+ixWqh
	kN80+RQEL46AULE+IQS+/s4Sr7tCiEJb9TTz/v3t0bensY6HmI5sRG2dZ5S7jrHvW/sza+T//17
	QIgg7n9kDW8lCTx+sfTvfTU4nyh681CofkDk9RQXhAzHOqYGUToYpTgM4UCRcOSz+3x5d6u6IB0
	1CMRJ8VCFRm+vr7zXm5tvXxU4WOoIqXVy9Z6gCN8NrDT/x0dFrqorQyW2eIu+JEITepM9MnMGgZ
	cD36A1IoLHWis9tMgljcZDjpWSK18MND0WyTkaQBZ4ftidehYQSMK/wSm0Ls5PFokkp5+1yQv1x
	EXITTMz55RIOENJCClOcDpxx8rdg8YqZwBwrxMuDgZ8wU9Y08UK55NfL2nXgLPqBC05rIHIzWTc
	RkUh8TVMi8CrD2L1z37KgoDqeS0DuWToPzykH0M+mQd1EvhJhdihogMEbkVk6P8PeSXZcH/eepZ
	ZJ20+X0pn9a22/GlOcXouEJGWNXaJYf38U4sZ1BAe14DM8bz9OmVhM48qo1A62IVAU/+3Xxzkj6
	n5dfv9tMbNYpn0Gz1Fy4Lav9+6oP2QudddYY=
X-Received: by 2002:a05:6214:2dc4:b0:91e:9309:ee5e with SMTP id 6a1803df08f44-92134bab602mr245693216d6.56.1795472819936;
        Mon, 23 Nov 2026 14:26:59 -0800 (PST)
Received: from t480.homenet.telecomitalia.it (host-188-12-196-19.business.telecomitalia.it. [188.12.196.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921366d853esm110323466d6.27.2026.11.23.14.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:26:59 -0800 (PST)
From: Andrea Tontini <andreatontinidev@gmail.com>
Date: Mon, 23 Nov 2026 23:26:53 +0100
Subject: [PATCH] rust: workqueue: fix SAFETY comments in Pin<KBox<T>> run()
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rust-workqueue-safety-comment-v1-1-48e4f9b35c30@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQrCMBAG0KuUWTtgBivFq4iLtvmiQZroTOIPp
 Xc3uHybt5JBI4xO3UqKV7SYU4PbdTTfxnQFR99MspejcyKs1Qq/s96fFRVsY0D58pyXBanwYfI
 YgvSD74Xa8VCE+Pn/58u2/QB1EaHbbwAAAA==
X-Change-ID: 20261122-rust-workqueue-safety-comment-4bde8f258d52
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Tejun Heo <tj@kernel.org>, 
 "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
Cc: rust-for-linux@vger.kernel.org, 
 Andrea Tontini <andreatontinidev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795472816; l=2205;
 i=andreatontinidev@gmail.com; s=20261122; h=from:subject:message-id;
 bh=POTJhzMsVUOpjiKPXaYKUKNX4hOhIfKflOm+rJFFZ60=;
 b=GM5VEudTukWFUrHwy5jZ8RCWzbMlLM03jVnLCgCRRzo7i2SHZzqKYzzxAoERlN04LpSMz+z/J
 ib4JfsUKbSbAQYTVxiuOcIuq5qE1qMW/XDX9qwgp3nlqSW9wCRpD91q
X-Developer-Key: i=andreatontinidev@gmail.com; a=ed25519;
 pk=CSxLgnuNkToPv3MqxjqIH6dTDQnEZ+6YXgIW0U5bhEM=

The `WorkItemPointer` implementation for `Pin<KBox<T>>` was copied from
the `Arc<T>` implementation, and the SAFETY comments in its `run()`
function still claim that the pointer comes from `Arc::into_raw`.

However, the matching `RawWorkItem::__enqueue` implementation for
`Pin<KBox<T>>` obtains the pointer from `KBox::into_raw`, which is also
what makes the subsequent `KBox::from_raw` call sound.

Update the comments to reference the correct function. No functional
change.

This patch was prepared with the help of an AI coding assistant (Claude
Code), which found the mismatch and wrote the change; it was reviewed
and build-tested with CLIPPY=1 by the submitter.

Fixes: 47f0dbe8fdc2 ("rust: workqueue: implement `WorkItemPointer` for pointer types")
Signed-off-by: Andrea Tontini <andreatontinidev@gmail.com>
---
 rust/kernel/workqueue.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index a872f9fffb90..3815f08dfc0e 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -890,9 +890,9 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
     unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
         // The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
         let ptr = ptr.cast::<Work<T, ID>>();
-        // SAFETY: This computes the pointer that `__enqueue` got from `Arc::into_raw`.
+        // SAFETY: This computes the pointer that `__enqueue` got from `KBox::into_raw`.
         let ptr = unsafe { T::work_container_of(ptr) };
-        // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
+        // SAFETY: This pointer comes from `KBox::into_raw` and we've been given back ownership.
         let boxed = unsafe { KBox::from_raw(ptr) };
         // SAFETY: The box was already pinned when it was enqueued.
         let pinned = unsafe { Pin::new_unchecked(boxed) };

---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261122-rust-workqueue-safety-comment-4bde8f258d52

Best regards,
--  
Andrea Tontini <andreatontinidev@gmail.com>

