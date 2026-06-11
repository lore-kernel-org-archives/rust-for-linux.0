Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500CF2248A8
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 05:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157355; cv=none; b=TakR+lmBE7Te5MAGNG4VcebrA6S+fSLTqYBm8N9/kxIhrnrp7DPeCgv3idK22YES/TEUr0vu4xbMoyiCqGQHl0vKH8CzHloVA153JWVfUsSrkgkyh/VdqudJ0CB09V5sNbayRRWSQf/CJ+47o1niCma/KwidtqizcgRaUJ4sm9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157355; c=relaxed/simple;
	bh=JFhqxligailgi5q2CGz4/viNZv6xiNQslsOcz87o8BA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EQ/gWbXxqkqKlNoCeNJ+79Ahk3oAwMxP9COuZAIcUVoWCdjuBHOUNl4fjFvXQ4m3QMpargEzBQpwAJ7oNmfrniaPC/CzIbl5FBHJXpSyw/rrDgfKZq2Z1U0XQG4XA87RG36PMjlB+aIXyKBAyfammpkBLmtHPeRIUwnbX3tLw7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLE6LZjN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLE6LZjN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE85F1F00893;
	Thu, 11 Jun 2026 05:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157354;
	bh=ynP3fMizEVJICcQr4G3VZcPjIHI+b+OsgKdSqE7qjKg=;
	h=From:To:Cc:Subject:Date;
	b=OLE6LZjNyTzZ9DwJd2H3RwzfGdQCmIzC5IyPllrhaj57+ESRTSe+9fIXWS8BsH1GO
	 Akvxr2DUgM6V+KADsnH9LJiExGkuCRzjW51MlsGjPlHypxw+o+U8wJn99vxnPoLXWt
	 tznHaa2BKhagUO3XctG2gAAzGbFr8HGKKIbV4McBgSMudYjoDmVQiwDcPXH3Fp83k/
	 75ngMB2tEGAEC07BbTNOEB/llDDj2UlDTlbP8oCM4nvDzxk3HVAyAY0KGoab1x2eey
	 YrfQ3P+Ut1bHl7UD+BRuaqPfKJ+KsrWJfS71D8bmkutScxeCXrpAN9T2iFw7rhPQba
	 yFzJBONtaJWiQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
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
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/4] MAINTAINERS: add Daniel Almeida as Rust reviewer
Date: Thu, 11 Jun 2026 07:55:35 +0200
Message-ID: <20260611055538.61425-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Daniel has been involved with the Rust for Linux project for more than
three years now. He is the lead of the Tyr driver for Arm Mali GPUs
[1] and submitted many of the core abstractions that drivers need: the
`irq` module, system resources, `IoMem`, the regulator API, the `bits`
module, the basic USB abstractions... He is also working on the initial
Rust V4L2 support [2].

He is already a maintainer and reviewer of several Rust-related entries,
and he has been very active reviewing Rust code in the mailing list.

His experience building Rust drivers and the APIs they require will be
very useful to have around in the future. Thus add him to the `RUST`
entry as reviewer.

Link: https://rust-for-linux.com/tyr-gpu-driver [1]
Link: https://lore.kernel.org/rust-for-linux/20250818-v4l2-v1-0-6887e772aac2@collabora.com/ [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d40e0c606893..5d34aeaa415a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23393,6 +23393,7 @@ R:	Andreas Hindborg <a.hindborg@kernel.org>
 R:	Alice Ryhl <aliceryhl@google.com>
 R:	Trevor Gross <tmgross@umich.edu>
 R:	Danilo Krummrich <dakr@kernel.org>
+R:	Daniel Almeida <daniel.almeida@collabora.com>
 L:	rust-for-linux@vger.kernel.org
 S:	Supported
 W:	https://rust-for-linux.com
-- 
2.54.0

