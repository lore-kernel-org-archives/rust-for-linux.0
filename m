Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B783382D8
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132950; cv=none; b=Vv0v4VKee8CnH44q9VvQJ1Nlzbc1z9iTerTjEYUx632L6cmbgfBvPwUeerBPvxs8goHcHlAJX+PVjtRNIBDo26A9UpN26bUL4qGAzg4/w7AIiq5RAy+Z/qx1zVBS3ZPQJ+NOhVfUnBCuPM2upjdA3ZiFcf9qwXhqM7MzehYYUyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132950; c=relaxed/simple;
	bh=gX7Iy759WYxoMCv7ndNoCCuupIybm1v0rA7xgwJ/b9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GyLxcDkhprMjg3AEQsUSv1mvvWxhOZXebedLHyfE7ylG8dwjuPgfgbkSvwj4VO/dm2RNMj4b+tLYsuF1E8rWAh4YPUeIMVPfXSRqZ0nzOKPHdevNOQBMoMOezzdMSY5P/Kc2Y+D4iAHT9TqzfyqcrwsM6CB8Eo5RdVkF/KZX11k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBugysQl; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBugysQl"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b25dd7ab33so420695285a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132942; x=1768737742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BMIKXAXniZuvKRl633D19ynJhJpEhy1emvggU7dsEJs=;
        b=NBugysQlTklEOPlIsaBrcYysyfdVeEEMqPwbDPRmfvFO08+LZwzBNrER5PLxfwDKrk
         tkuDbT4fZw8i35mg2/tIfjlSJKwwDj7SvvkLpTmd06eR4XgWsqs+4DtOgSt7OCZJFEA8
         426LR5V1k5MEfQMMJO7a5XDjZKSIralRAU6+iHLnUSLmzu8/VjAaZoaZF7VrtOAleDOa
         oHimFyFhxL3FL9I6I+JCJhYQlpZo19Hcs75+oh5CDEqJxVY/1gQ65yF8a+Vc/IeOPiaa
         OED8UpsJrTduemjp4TChsBsWCz2JXARlmuuEvY0xx9rsIJrVVcusfbrJYZ4d42H23LeK
         C66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132942; x=1768737742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BMIKXAXniZuvKRl633D19ynJhJpEhy1emvggU7dsEJs=;
        b=onzR4R9HtRFQwFklM0R2Q4BmkDWsgH2EKW9BG5s6cWIsl6q44TPB1h+U2q/0QShxyM
         iw8eiNDJlMqAqr9AHzhKUC/mvmTLxIPREw00xN+oZFrlkBulTDAhbDTgnQdw2SVtI12U
         GEOeLnweXZ4anotDwLqvaTmHNksg9wYkxRewdRRB9T9lZ54UBpG76fRIEq0T6O5PXmSO
         IJEkJAFwbEtrM/VGGT7h6GYDVmLdJXbOKx1M/2HEP3wTSqPmuo6ykow6zJ89K273b9az
         POpBcDgifsmrXnxRQ2DxiIDaoONeYMxxVcdpONJX3+XM8llb9p4bjAam4tHjsFcE/ytX
         YbNg==
X-Gm-Message-State: AOJu0YzRwloDGqo+EzNA1MbdWMAjv7Zb01lBMQA80Jl83YK+6wESztBh
	lMcM203RKYAZJ7Q7jM4kgxPxj8tNjEhcfp1pCw5/d9Rdw9nVD+9JwpfV
X-Gm-Gg: AY/fxX7by6dOHOcX7flNoszS/Qaov/KhOLNb2GVcyNZBe4cE6BYzOWKAuuXAP5TZ+hP
	gkvnmRKmKipLe4E0350mXu3FfJPvLCo5MagJNbev96kYJVganQkjUackJgOch6PH73lg838vzrW
	Q+v19VHUHYnLoMWt9pd/3Zo8QilJCzf6H+X0wZcw+5Cy2xyzxZfCdciqqK46FTYlP+CVGFdBai2
	jZRU98L+WgkuUZNxezISCPvfz4RsV/Mbn4t/7iPTzpBTqekTznt/3mgx/6fHbfPzztMToCJisjG
	qOm/zd4SNIrfE4TxmiP9gNzaQxgRW8So+e3zdBrioqalhsuQDXjt0GLr8BzAdAgbYi4guftAtxH
	QUIaWHwdibvma98EUknXrBN3Rkmp3zbV990whonU6IYVPaZ7xlEP658OVl3AEJM4wiqfeCQX1wd
	t6cDIhXNIYC9+MF20twnr0VThpLjce4KTXuelaVz9dUMhceGkkLtfletVs3Z9d9FSXMCVaGDdEZ
	vT/KAGKRizfq54=
X-Google-Smtp-Source: AGHT+IHBMClMCNeu/ARCCCNlUxAJJXoFR6QM6EukP5+kwlGhsB9OzLFpbW9xsW6hrd6erv8mPvUUXg==
X-Received: by 2002:a05:620a:191d:b0:8b2:1568:82e8 with SMTP id af79cd13be357-8c38936f0a2mr2164480885a.35.1768132941885;
        Sun, 11 Jan 2026 04:02:21 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f530a1asm1234173085a.38.2026.01.11.04.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:21 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id E344AF40068;
	Sun, 11 Jan 2026 07:02:20 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 11 Jan 2026 07:02:20 -0500
X-ME-Sender: <xms:TJFjaaszubS_TV3yy0Fccl1SIjt3XsaujGiTlQwsgXqy3OhM1JfaAg>
    <xme:TJFjaXBxfJlNFxQhUq15qHLrwJLyz_LUdvGJvbDE7TFN5MkecaTBs0OeQjcMgsZ6k
    RB5amQzVdqMZROthFqGNVXRffqQp2Cqsa1njZFRXnuzYfjh_mDaFGE>
X-ME-Received: <xmr:TJFjaVb30fWeO5qVmRGnjF1i7xTaedXtMPHIg-zhU1SWKPNAMhK_sH3C>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:TJFjaR_zmJk70yegpOeu_O2BfS7NV8nSFNdOhyJyYnOlvdCIqNhTIQ>
    <xmx:TJFjaRjmcuddYQHa76ou6DK5XkC6zTrKqKRKhfoFrIh0Lhs15kkfNw>
    <xmx:TJFjaUjGS5Qy1GJyfknmaRDH6CjMATMavwsdZyp3s034-BzggD16fg>
    <xmx:TJFjaX44xOh3VVGgYmmAop_45a3bGWfmi5rfg1ERTOlP6bz1_t1GWg>
    <xmx:TJFjaWSN248zGrb1VrJhmJDo5EnehITJaFqYYK-7lOHyC8823TerKBo6>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:20 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
	"Ingo Molnar" <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Will Deacon" <will@kernel.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 04/36] rust: sync: Implement Unpin for ARef
Date: Sun, 11 Jan 2026 20:01:37 +0800
Message-ID: <20260111120209.6133-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111120209.6133-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
 <20260111120209.6133-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Ryhl <aliceryhl@google.com>

The default implementation of Unpin for ARef<T> is conditional on T
being Unpin due to its PhantomData<T> field. However, this is overly
strict as pointers to T are legal to move even if T itself cannot move.

Since commit 66f1ea83d9f8 ("rust: lock: Add a Pin<&mut T> accessor")
this causes build failures when combined with a Mutex that contains an
field ARef<T>, because almost any type that ARef is used with is !Unpin.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251218-unpin-for-aref-v2-1-30d77129cbc6@google.com
---
 rust/kernel/sync/aref.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index 0d24a0432015..0616c0353c2b 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -83,6 +83,9 @@ unsafe impl<T: AlwaysRefCounted + Sync + Send> Send for ARef<T> {}
 // example, when the reference count reaches zero and `T` is dropped.
 unsafe impl<T: AlwaysRefCounted + Sync + Send> Sync for ARef<T> {}
 
+// Even if `T` is pinned, pointers to `T` can still move.
+impl<T: AlwaysRefCounted> Unpin for ARef<T> {}
+
 impl<T: AlwaysRefCounted> ARef<T> {
     /// Creates a new instance of [`ARef`].
     ///
-- 
2.51.0

