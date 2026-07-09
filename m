Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599CD3E1233
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 20:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630283; cv=none; b=hE2K/OgZyjoouooMoZE+T7xyHep8bYLS93VMRkghXZvslLaPcKcDDyoLb5py4L8Q5bAQKSlmMBya2ptO3SOiRVILfw52Ktrt94RhfmrQguW2RXPLgS0i87OfcNs3fMMx88ok+4hrPm7Ved1YIK9ZaoHWKn5CF2US8B8xrDRmOhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630283; c=relaxed/simple;
	bh=j5uiGUZlYiK4X8diZbyod9LKFymRJA9ctLsVAO2VeQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KVLN+feYSFNGIHcO9kEY3Mb/tg7U4E8FGNo2d4rGSKZSjH5TFcH0pLLSsMNAO7Jt7hCt7q7BVY9W1LZYboqL5OtD/B/PXarZxkiAyWttLVOJEUMa1Nbw5pvS+USYNzar8+g+4HOGKREX0+SGeJbuaZ2m4pU7Wd4AFT7UkOZn2DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEvc6qA6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEvc6qA6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46E81F000E9;
	Thu,  9 Jul 2026 20:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783630282;
	bh=mkCh2ARnwAGF7WfJFFvmU1kNDCZ3LNluNleDbMmeylc=;
	h=From:To:Cc:Subject:Date;
	b=KEvc6qA6wOYteXy21G6bKfK05T9NMVyM9zMCmmmFQ3UCT02TxtGOBwKSXZ9cU5/TC
	 ZqNq5KNP5wYu8y6SX8q3AwxzSLFVhH7nzHJOw709DFvnG2lGLUt8zhWi6R4zFmv3NX
	 lQd5FVLjXYKZijGNt9bxhDXs5bAmdYeDlbwTUBH0Pa7SEnVvMo5eVGCoBz0BiAdRD8
	 XGU9X83kK+b/WNSOjxjyEP22LtrZoEZahBbVCYx2+K2VK4hq3gijwrE3ps06BWIarT
	 iKAe4CL/50hL0YGvgvPx9aWitp+LFQz+f5TSPSUEoI2+zh3PYZkda3j3ZvGiYiScRs
	 Rr3jt1B5taVJw==
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
Subject: [PATCH] docs: rust: quick-start: remove Ubuntu 25.10
Date: Thu,  9 Jul 2026 22:49:26 +0200
Message-ID: <20260709204926.139252-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ubuntu 25.10 is not supported anymore [1].

Thus remove it.

Link: https://ubuntu.com/about/release-cycle [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index a6ec3fa94d33..f79aa3c7138e 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -90,7 +90,7 @@ they should generally work out of the box, e.g.::
 Ubuntu
 ******
 
-Ubuntu 25.10 and 26.04 LTS provide recent Rust releases and thus they should
+Ubuntu 26.04 LTS provides recent Rust releases and thus it should
 generally work out of the box, e.g.::
 
 	apt install rustc rust-src bindgen rustfmt rust-clippy

base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.55.0

