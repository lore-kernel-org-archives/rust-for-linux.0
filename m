Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC38278158
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 03:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761105214; cv=none; b=XOKm45sgReLN3vi7ykowB2JChphEN/zDXwEFmO4EIc/4lzA2MHvfZf49xPrLK4ONm/K3ZMG8grBnpCuehpGWg4B/+4g967/2KVAiYgAovZWH5/eiSAeJGkx1QXMPL649JXjW/+JHdVtMWQUhdT0afVi390cG7/XLdiG1vRo6QSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761105214; c=relaxed/simple;
	bh=NEOZ5UcQs9qWpUuFkJ3z//mwBi0OwNepB3WYde0vNFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSVZpASskdIBA4KFgyLTZhRVB9BfwDlZZ1eKJmh2ziZyMf2yoJrNQ9ixLbLjCiFjNWou3tqzALREL4TOExRB7o0dK2qltaiSR9iX02J2RFDVkZ4KAo6kVb41h3viyBpMw6cUMyj9mtWJJOGvGrwwF23aEyJrOu0dA99Op9vK2lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lb9qpOFo; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lb9qpOFo"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-88f86727622so915513885a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 20:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761105211; x=1761710011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UNHVbXF1l9vxAaVojg+MHbup3Odhk55doJucb7FZw8c=;
        b=lb9qpOFoMKxxvDU4kP2Xljs56ANwI2kLj3ULkO10gL15qT8/9URJsJ3zRtQcRbEXe/
         H3lJrXXk9WOX5ouyDXoqNDeW8hUnUt05D0kNc6y2niNZqOmIUKtkswmX+pB2ZAlMY50d
         Dl7zA97nRIDTFBVlt6thvNP4259KlpqxDxOG+1xV80XYYKDRKVwGXznGpwt9W2P3lDZM
         y15dbMVNx8ABa+0q7fZhAtl8ekF2BX8aY8WMrCWBWA9/H4eUmOIG2iFb03NdQUiFGZ7u
         maLNo6g0IUTURjt6BilwkSicepq8+hbC9dAvuKF4YS0QdR3xyEPcgBwjFtqGBma89/82
         5Pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105211; x=1761710011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNHVbXF1l9vxAaVojg+MHbup3Odhk55doJucb7FZw8c=;
        b=bCY/cXZ9fhxbLtUyABFc1eIJf27bemWfZMc1AC/avJi2L2eaeZqmAadJRyAlxAkdPV
         m9RoorsMV8bb8Ua0XRAYafwmSPLhKXRgzNZtB8iYMGuI/pngvjAzB2RfaHqUYOGathnH
         m5DQxBkVPF+PkmhP8uTypXSjra6oYy403ZPJ3gupFvBy1sEk4OzNcJjV6KUtVjOi0/nb
         HsD+/W6BipN0kaXJR5ti9fNUlDFE6Yy9gvkSgaro4dWGB8eeyP1vroMY29dZrP+hEIKk
         w3ar2z7eArkP1GEkx29BUO6DMKiN+mqNlG/fGD83VmiUICo/IQGsWUIUUuW9u5skf68A
         wfOw==
X-Gm-Message-State: AOJu0Yz2PgFq9UysNOhYfs5TnxHWXFxH4uniVd5l2qEllU3Nu0bjVIqI
	4YE+dVb4vtTEuvR0PHNgbsRJZjKnvJwjKYGtQk3jmUZjo3kZUGJQ3JQG
X-Gm-Gg: ASbGncs7PUxwDuki0rAYPK9exhXKzrDDn0lqPmGpa5xEJ0bMeQhkZFVXRogJVz+3ucO
	pQ9FfxKf6ph2nlcW8XCPYckDE74b86KKi2rAy4vOAbP6NY9Kdo4Pi9ks+RlUyesD+7WkZaih1fH
	48oYPjIBBV1pqev/YkwWezz6kniN7pGH6nkTupsmUg+2wwYcwDdeJ52Ts4Sn5R3BIv9xK1KwvH+
	Zj6sOUdoeTSvog3/SMO+m2zXcZfBbchWuo5FIjyrB7J7XZ1auaj7xQjCRS8gK+F43KPECm25J45
	w+iTgo1uvtbmoT57nRlrkhZur9AWh7RUiMeM7CKcPcmO9DFQhNeX05T5luLKglymydGzLcStQ0o
	G//alAUf7Fauy7K7FNfozavEjf53mm7aNfF0z6Js1FaXFQNNaikZE5GuNDYZHpws8i4klugLV1h
	7APcJG6x6F2mQIf1NqvC2A+/BF43HeyYBPBlf3DMvv/YSXlvBxfUKvKMgw/PJXqNCx1ZumOr8q0
	UZAh0AiUF/F9Fg8r9vrML5NDA==
X-Google-Smtp-Source: AGHT+IEK23rEbmImZjUjZqknwOE+XDHmtcXPf1FHlW5w+b2oVQdPahRq4eJRmv3aAqYbsDBgGjL/aQ==
X-Received: by 2002:a05:620a:2886:b0:863:696d:e37a with SMTP id af79cd13be357-8907030c838mr2419098085a.44.1761105211504;
        Tue, 21 Oct 2025 20:53:31 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cefba763sm890414985a.30.2025.10.21.20.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 20:53:31 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9DF95F40068;
	Tue, 21 Oct 2025 23:53:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 21 Oct 2025 23:53:30 -0400
X-ME-Sender: <xms:OlX4aKfwcUe7u6R_1b5TUBBOomhh6hnwzNOg5WSiArEoPx4c9YG7qw>
    <xme:OlX4aAJA8r4LBTDjEzcW-DUkOSsoy85nL2R3EvfPfW6FnSYCt5YP6F4Tbvs-4LIJh
    RO27y6D8FLF4fI58roWx-rdGffN6WJOMjCbtvy7BqEbOB4oHaNlCA>
X-ME-Received: <xmr:OlX4aBqpYHPIR65WeXF4BytE_rsiCq-VOAJNiKzm06ryabRbUmFeZgOpuT8-EF5r_V5XD4dMKm5Q-e0g7K3MFKrd0W62R7_HG7c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugedvheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeegleejiedthedvheeggfejveefjeejkefgveffieeujefhueeigfegueehgeeg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
    dprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggr
    khhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:OlX4aOU0s4psfU22edkNKXf1-YxQRWwT2tMp9hXZdK3T8JBWayziQw>
    <xmx:OlX4aE32rnV6OL9MxgUIlKbnN98qCE-rmr7VRYa00MQybioKHahiOw>
    <xmx:OlX4aH2o7L5ATeV0BtMVYgiE5jBjZOUxy_X97XhxcxX_MHaFnssEow>
    <xmx:OlX4aLkq_-0jFOFrSYW-X3Xd0xACPlsVLVMAiGf2dufokMjuL0CKGw>
    <xmx:OlX4aAP-rcjdFXfu7xw2QmiALn-fvLwZt5-gBFIN2LV0A0gyMR0I7UXP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Oct 2025 23:53:30 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Maurer <mmaurer@google.com>
Subject: [PATCH 2/3] rust: sync: atomic: Implement Debug for Atomic<Debug>
Date: Tue, 21 Oct 2025 23:53:23 -0400
Message-ID: <20251022035324.70785-3-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022035324.70785-1-boqun.feng@gmail.com>
References: <20251022035324.70785-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If `Atomic<T>` is `Debug` then it's a `debugfs::Writer`, therefore make
it so since 1) debugfs needs to support `Atomic<T>` and 2) it's rather
trivial to implement `Debug` for `Atomic<Debug>`.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 0bc6e7b04d67..3afc376be42d 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -307,6 +307,15 @@ pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
     }
 }
 
+impl<T: AtomicType + core::fmt::Debug> core::fmt::Debug for Atomic<T>
+where
+    T::Repr: AtomicBasicOps,
+{
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        core::fmt::Debug::fmt(&self.load(Relaxed), f)
+    }
+}
+
 impl<T: AtomicType> Atomic<T>
 where
     T::Repr: AtomicExchangeOps,
-- 
2.51.0

