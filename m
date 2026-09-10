Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18C35476EA;
	Thu, 10 Sep 2026 17:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059969; cv=none; b=PA6rWjciOiDgHJc/eSrPHBESFaZFifU0JwEZHtoYDpuljcZ2GVA03k817fJvJiLgy6/vnWyWirc9DDtXC2ufvZJnk3vmr7Zzl+YF5ocoTepy9YskVOSOGQC9fEF6X76TZjuNxjBronQzB5Ad2/eal+eztisEIekNNWjoNitsZYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059969; c=relaxed/simple;
	bh=D8kzOhtZNgalaZW/BREDdjgWIkSZ998vKcdeRRSZrIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O6Y23/HJnMjBRnJKj/1YP+48DJaQpU6VBSDWwt4wiGnsXF6moZNI2IxWsRRmMdtFL7ulz/adD9dfKUZjTxgML4hj03YQqd3iyFjf/1/3gLQftGYHM2Lj38hc7SFWDAiLrrdzFzXQm9GhPJ5Zj0dXPIuLItQinCuMPqd9SiYa0xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzI1uSvo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzI1uSvo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF0E1F000FF;
	Thu, 10 Sep 2026 17:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789059955;
	bh=SdlcoQDN0jkt/DkUUNNZAWMgxLwuEsMvjVDP8/JRjqc=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=PzI1uSvoubbNpFeg8w/de1uR4A19/6lpGYtd9iweN2VWg5h2DQw36nOfOUZpLJH8G
	 1Znrh6sH8g2oYG63gd2QiiJVbVxgNO66TsVJGXtcJSYRvcwcblzgbbppJt+HVUwaBh
	 IV6EN5IJKbdcTKEAhoVFegTdmw6iAL4qcmRIclXT4aV1aypeOVXAKgKtUXTbjuyc2h
	 ffFjFdevY4oyjXQ+al0k/3Sm8c+l3i8sRCJbr89gZK+Ll7RTo5fqFsqtXUpMTl1c0c
	 9j6aMeBBLZUVukE57YBRoDaWl26uedGySYRFsQrViXtybyroLxholWuOigb8NwV6em
	 Bas2GpDbU07YA==
From: Gary Guo <gary@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: bitfield: remove unnecessary `#[allow]`
Date: Thu, 10 Sep 2026 18:05:42 +0100
Message-ID: <20260910170542.92010-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

The `#[allow(non_camel_case_types)]` was there because register names can
be commonly SCREAMING_CASE and thus not CamelCase. However, when a bitfield
type is created by itself, this justification does not apply. Thus, remove
it.

Users that want to use non-standard styles can add the `#[allow]`
themselves. For example, the invocation of `bitfield!` inside `register!`
macro carry this annotation.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/bitfield.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 15c78790e151..8d7d78175336 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -295,7 +295,6 @@ macro_rules! bitfield {
         $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty) { $($fields:tt)* }
     ) => {
         $crate::bitfield!(@core
-            #[allow(non_camel_case_types)]
             $(#[$attr])* $vis $name $storage
         );
         $crate::bitfield!(@fields $vis $name $storage { $($fields)* });

base-commit: 73e5616f3d197c1af5a04a481fe0f13aa3913bd1
-- 
2.54.0

