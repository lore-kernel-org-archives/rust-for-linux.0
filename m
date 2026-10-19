Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452890;
	b=cryAYoF/23c8htfRH+zdQVVKpzxyF75q7xyspoHv0O3PgsmF0i89tRzlBFTQn4ZZV2Vx
	 IyYHOY9RevjeViO1UHMocafEcEOPLLEkG1vj7oDh0B6/n48t3stBnSIU72zQqjYZ2/RL/
	 WUbOF/BWnxJVxJCneZdBAc62RCirc5hhyq+IeDv4X6JQCOHt0DPCiksbYo2dkWa5BA6SN
	 Oo4G1h53cUCQ4cvlBAvVG+Q1ucYpNlo1F3UBG/Li012p0qMNjo5YSFQ6KCx5VJqmmMveo
	 bnpp73Z6CKa1SoeddGQFohRYqhgIBCcTOSvP+HZHpevTtF/QB55fIdMy4T5j550bOlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-B4-Tracking:
	 X-Change-Id:X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=hXRBmypsfSbOoyyjwjH80x+T5tVVukih5UNKVVGaJDg=;
	b=OXCx5L7yDhQeFuPSsHzGrgSwSkI0MFgKHChyqistgTf4+lmdeVxAGMQrUwcYSjOBahBQ
	 1TsIJOSKY1WXymQbkTQTTX21eOvIUWH8Lg7EVJ/txtrjsdcRMuPkQS7O0umV1POCxtaem
	 fk4Ca1D7m6oB74/sePW1/Zn1xZOXWqZn/s8E2/wUoJ/blMuM+y8V7Ymx04zekPc1sDEo+
	 s0YYPlFlqajoXOBOQ1sV7PUMW0s339OgFXKrB5rVP7PolJ6eOIddQb8eRdf+ubn1FeICy
	 KLi2MJRr9OWtNGikgBXUekjFxKgsDGR3ATxo0d3UvZY7k8Z5IUH0urqjQTzXBLuMp7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I4xQTTO+;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF97606A31A
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 23:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF97606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I4xQTTO+
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so3747757c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 16:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792452889; x=1793057689; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXRBmypsfSbOoyyjwjH80x+T5tVVukih5UNKVVGaJDg=;
        b=I4xQTTO+ipoDQptdVEVI96EQ9yhDdfzpc/kVpUvIAGDe86tih6dugo+/28mjuKU1Fh
         D2HZ6UJnKk+awUBrL5HsXrxjEdkL2e3LXWabFpJlf5xdcxsMU8l0IsqH+Jd0pvr3HK1Q
         tRIwT0EV2+LZrjPznJwaP4PFaytfVf99S4ELf1zr1rjXmEzCP8zu5+OB82OKFwmg/iJy
         Hp8ghWALQMrxcPkxrMhDGfb7O0cvjkIkDLxpmGCTEkxwaWAKJ+/TMB7wBMxdGl2bCuxX
         GL1yt4Gr4sRi1r8QrrUs38vQmnniOME4KLgUsWHxiXhpAkU8kNEz5boFXKzW9Cbin08w
         hi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452889; x=1793057689;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXRBmypsfSbOoyyjwjH80x+T5tVVukih5UNKVVGaJDg=;
        b=UgHR8osIQedJQWYUg20QDrsCC6aZB8fMHolknANIMkuveSjH0cURrINzVtBAs9ew6H
         qO+5GIQ4hbnGde11ZHSs2Xrs84KDwBNU79vTMsYhasmwkkEjrpt4kdX0YcFPIzbjvYfE
         7mZxc+ErC4XUFKZl3KWXxiMctUimtQawFYyHiFe0cz/ktLQ+Fx68gWYEqxT8w7Ax+qcT
         +62RkJZj/dg9w0g0cDDhep6Rytun8+ZYeMQ8naP32LS/fWkOlHaRW3Kf0v7EV2Co8T1f
         dUrc9eurJNdljdpB0xCDmOuBG3Psqh/tTO9nG/lJE3zucyWZryi8Q22E8zhZqDlGWGQO
         db0g==
X-Gm-Message-State: AFq9FYK8tG1LMDSp+6sgCNGsoUaqNev11FWBPoM6r4/t8G/lWbcH8mAs
	HDC+E2YoMhOOENWTd20rNGr1UNQH499zBiJKW0C4SmwuBuLDCsOb11l+FRBvzN/6HcVPKbwQJHd
	qg6iIwr6LjjdvVWQ4UlRxXZpo7B5/3w==
X-Received: from dlbur21-n2.prod.google.com ([2002:a05:7022:ea55:20b0:184:b43a:63ac])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:241b:b0:16d:dd5c:4261 with SMTP id a92af1059eb24-18514449a5emr10311455c88.46.1792452888497;
 Mon, 19 Oct 2026 16:34:48 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:34:36 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA2p1moC/x3LMQqAMAxA0atIZgOmglivIg5qU81SpVERSu9uc
 Xx8fgLlKKwwVAkiP6JyhAKqK1j3OWyM4orBNKajhizGWy9cvaCXlxUX19u+teQ8OSjTGfkP5Rm nnD9WpKuuYAAAAA==
X-Change-Id: 20261019-rust-cfi-fixes-bd898391df1d
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=352; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=hXRBmypsfSbOoyyjwjH80x+T5tVVukih5UNKVVGaJDg=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnXVop2PJE5k9Su8bg1QKXcrvTT0qTrs5695d7DtDXpp
 9qpAFb2jlIWBjEuBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjARQUtGhtMdGSfnX824833a
 6TMc/aHvprb5+IgybNz9dFXQy6tbMgMZfrMc/VxyLsN9rd1/i/K8vQrWs3uc1y0sF3A9pc7U9zL ChBcA
X-Mailer: b4 0.14.3
Message-ID: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
Subject: [PATCH 0/3] rust: Fix CFI type mismatches
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"

This series fixes a few CONFIG_CFI indirect call type mismatches that
I've run into while working on Tyr. If we're going to run into a lot
of these in future, perhaps we need a better solution than addressing
them one at a time?

Sami

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-rust-cfi-fixes-bd898391df1d

