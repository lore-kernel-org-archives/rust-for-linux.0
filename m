Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2C528002B;
	Mon, 22 Dec 2025 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406148; cv=none; b=G3Fo+ia5j/FwdPB5hT7vzOBP+NpQZK5kp9hTznEEK4z8gki3s0tri0KusnHJpptqwfu8k0Nu0WinjMC7Mh445xT0MeBysHEk69zL1YNpxbl35aysN7r8IW7ccW293JV+P6S4nQukXPoz+mB2MdrniplKzTLN36MsTWYBkLbhPSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406148; c=relaxed/simple;
	bh=D82nTyV6ostXKP7Kbs7sqnP3ZPnTuhubxgq5+C7JvIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BMf/OwHR8Df+/ep695IIYY/W8Ejao/MlBsMDU3PdRhoBqoKyFAZ8BX8J18su5gRa0OgMlvQZk4Yoga+fzdMvaumugHvKsV4OjVMyjme3gWYqnvYbcZaaFNqjd0PRSylc9Zx4jNurD+XobKu9wf/DGZhzstG6QEvaHrRL2Homof0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htGkntT4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htGkntT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362C9C4CEF1;
	Mon, 22 Dec 2025 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766406147;
	bh=D82nTyV6ostXKP7Kbs7sqnP3ZPnTuhubxgq5+C7JvIM=;
	h=From:Date:Subject:To:Cc:From;
	b=htGkntT4GIRdqWLmPZUgfQ7DNrGNXsfm8K674Ok4c1XLEf3FnORI6uZdzmYkHlihk
	 6kIZq+ZtGQb6C1aI6qq5enb0BrBwFd41ylkLe9Z7EqaZFegwUvhs73uMIKi7rBLE+z
	 PoIU7LlwQc2PHTbBJTpvPdq8woTrLnuyip4yZelOAWJCVTASsoFZUILOnTzk6Prwaw
	 0tR/kkwoZXHf34Ty4HFXHlf9df5Tg/eAis8AGglcJqlbfbaOZ9Ow+isA4JK1lZP3/O
	 oAXj6fpBCXFxCJtUEQufo0WtclI5fs5Z4ejbGz/500o2tN21MeFAqwyKg63w3Uaz42
	 jPQseYS53my9A==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:22:17 +0100
Subject: [PATCH] rust_binder: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-staging-v1-1-974149ba4a79@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrBvQEZV6ldKFxt84LlLJRBHEu
 xvr8lu8d5AiCJTa7KCATVR+PqF4ZWSnzjsYGZKJc64KZjZWYzAaOyfeGbxr2wPN0JSglCwBo+z
 /3ef7WNd+ho33g87zAonIrl9wAAAA
X-Change-ID: 20251222-cstr-staging-e96cbee7d73e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406143; l=1119;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Jhaxrh/vAvIW+kSySxjCdU4WNc73XMIJzaudtjIprXA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPqEpBK7eIimZxQAngtbE2z2BrhCAYLnDO4iDQBw4zBLw0CYMvoGCHBzWiStLNYQ/brz3Ycowkj
 /izd/xvxd/Qk=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/android/binder/rust_binder_main.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index c79a9e742240..519bc2fb310d 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -288,7 +288,7 @@ fn init(_module: &'static kernel::ThisModule) -> Result<Self> {
 
         pr_warn!("Loaded Rust Binder.");
 
-        BINDER_SHRINKER.register(kernel::c_str!("android-binder"))?;
+        BINDER_SHRINKER.register(c"android-binder")?;
 
         // SAFETY: The module is being loaded, so we can initialize binderfs.
         unsafe { kernel::error::to_result(binderfs::init_rust_binderfs())? };

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cstr-staging-e96cbee7d73e

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

