Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2C31F428C
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 21:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743630100; cv=none; b=OUSXe5PiKpq2YCN+RN+159s2WrrjklB6ARgGupH5kouyn9meezDE0kBhzi9r6H7fCF0SHo2APUdK8HEPXCKf0ENLfGQTFqgIQaPzXxOGbWD/5P7XIkTUrLUfa9z3UOStvjE/ENN1i6iP4KiD4N9Epv/lay8k22jCPZECCbRCrn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743630100; c=relaxed/simple;
	bh=vShHOWeitIbxplb9p87vnjIjjfuH54NQw+mD4RqzBcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5RTT7I7sC+PYaJ6BJYegIrGSRJwgFXGdIc7UYtWEZFa1hRD6mtfhZqSINacEqwxcaMWnbfHm4tpzkFhz14dYw7KWDSDWLHzoTUUXP2VllXolTDIiD69BxPdbh4x0UV0ArKtzDsKbJAKNdF+UV+sjCazXNMImgEuJNrR1TqbgT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YEGzVDuK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YEGzVDuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743630097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5nfhRkfaRcNmMXeHmWOJewhTgQsNNEyzLVy0F5Lha0=;
	b=YEGzVDuKNBLR78Mio7W4dTfZ/ijzkWkvXfiE6+6ZDl4cZAL9SHEDChuVelNdCrYqFJxVAR
	SpCd37591aRDE1FhGdVj7Z1spFj8DwM3cjaR7YVWx/Kx3hUFhy0D7gYrfrjW/vvow43kk3
	7wZEMhdZbuBvSdmeta4JjWcD0mcvctQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687--R6tZeW9NKOMopszrX3KMw-1; Wed,
 02 Apr 2025 17:41:34 -0400
X-MC-Unique: -R6tZeW9NKOMopszrX3KMw-1
X-Mimecast-MFC-AGG-ID: -R6tZeW9NKOMopszrX3KMw_1743630092
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B2AC1800263;
	Wed,  2 Apr 2025 21:41:32 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.95])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 35CCA3000704;
	Wed,  2 Apr 2025 21:41:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH 4/6] rust: hrtimer: Add HrTimerClockBase::time()
Date: Wed,  2 Apr 2025 17:40:32 -0400
Message-ID: <20250402214109.653341-5-lyude@redhat.com>
In-Reply-To: <20250402214109.653341-1-lyude@redhat.com>
References: <20250402214109.653341-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This adds a wrapper for the get_time() callback contained within a
hrtimer_clock_base struct. We'll use this in the next commit in order to
implement HrTimerCallbackContext::forward_now().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index f633550882247..521ff1a8a5aa8 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -186,6 +186,16 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::hrtimer_clock_base) -> &'a Self {
         // - Our data layout is equivalent to said struct via our type invariants.
         unsafe { &*ptr.cast() }
     }
+
+    /// Retrieve the current time from this [`HrTimerClockBase`].
+    fn time(&self) -> Ktime {
+        // SAFETY: This callback is initialized to a valid NonNull function for as long as this type
+        // is exposed to users.
+        let get_time_fn = unsafe { (*self.0.get()).get_time.unwrap_unchecked() };
+
+        // SAFETY: This FFI function has no special requirements
+        Ktime::from_raw(unsafe { get_time_fn() })
+    }
 }
 
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].
-- 
2.48.1

