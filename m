Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AA620E6F3
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 05:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755493489; cv=none; b=pvXL93CmQDAhpcnXy0qLc4phi6N6R9J3DCv/wR7UvYm/pYtb0rGLm8WrZ/ZC3whESWCPDC9cAnLHVFxoNHh6XZ6oU1kt4GKqoHb4U6rXAJBpdcSiw720w817iooymILzopkuwE6WPqzHMdCBeenre/hQaVCkvHJknLKG8cGp404=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755493489; c=relaxed/simple;
	bh=Np2JtEZhbAb5uoGEaYPciogAtFBMcWp3LG/12jgvAOg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mAWyIise0ORD9NAIGLIYQM077sS/oE3JRxW/fIB37JrYvS1ZdCc4ZOmWRI/SAR6vEpxCiIEOeS8qPLMbG+dDvPus/FbKrdPPJNRVh+0yrh7NSYMQkS0kKG/v4uycqrLVaGgcX8WIQSE2SmsqhMcCvKILMLiLNKDyXFBCs9rzL50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=wp2FGLAn; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="wp2FGLAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1755493485; x=1755752685;
	bh=GOJp5lcAFQnSpCcww0lHeF62wqZ2bLfNcJSNvGFsXbE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=wp2FGLAnF5q92ZDyyocTrq4wrDUY1fGJQWhvmqmW+Y5Ek2eldgAAZrClkl0SJm7oe
	 W9G4obAV28H9Fkt24ZcpQ8kZDbgA2BJfL5o1b9/9OkW9SOv1asA5c9t3KoCX/HdLvX
	 /D5j0SqrRKnLw/BCmdwT+6lwJhnRxShJ5cU3j2ClzQr68wzbEGqTtBlGkewgXVRueB
	 YegYDnuWAJRizfmLikLyFvoBBrV4GJFH1CPhpUQYQF+sPP+BfjLmCMEnjr0rBVVJzT
	 T56hYC0nVfNl0DcMUC8QO0G1t28jxOtpD120v2xHPAH3XhgUtE6pXhUYBmCnJFDLHx
	 Wsl5FxOzu/84w==
Date: Mon, 18 Aug 2025 05:04:40 +0000
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [RFC PATCH 2/3] rust: pci: fix incorrect platform references in doc comments
Message-ID: <20250818050251.102399-4-sergeantsagara@protonmail.com>
In-Reply-To: <20250818050251.102399-2-sergeantsagara@protonmail.com>
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: f046a89334b1160c3374f486f65f508121c6e0f2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Substitute 'platform' with 'pci' where appropriate in the comments.

Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Fixes: 1bd8b6b2c5d3 ("rust: pci: add basic PCI device / driver abstractions=
")
Fixes: 18ebb25dfa18 ("rust: pci: implement Driver::unbind()")
---
 rust/kernel/pci.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 887ee611b553..658e806a5da7 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -240,11 +240,11 @@ pub trait Driver: Send {
=20
     /// PCI driver probe.
     ///
-    /// Called when a new platform device is added or discovered.
-    /// Implementers should attempt to initialize the device here.
+    /// Called when a new pci device is added or discovered. Implementers =
should
+    /// attempt to initialize the device here.
     fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> Result=
<Pin<KBox<Self>>>;
=20
-    /// Platform driver unbind.
+    /// PCI driver unbind.
     ///
     /// Called when a [`Device`] is unbound from its bound [`Driver`]. Imp=
lementing this callback
     /// is optional.
--=20
2.49.0


