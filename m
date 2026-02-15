Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0205A1A2389;
	Sun, 15 Feb 2026 20:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771187914; cv=none; b=BX68+/dfgY8T/f8nHSXA+irj+wfrDlPSyniPlgL+1mE1bJRVUMpg9VQgYmytDMKYWcrmZfN2flZXZFnWxVDvpGnR59Ieu4YDA3i6tXYKApfHimWbTrUYl/6v8D10WiPfBERIZeV2UKeNCylde9qp4Bc0jgT+DtTd4PxD+DoDMB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771187914; c=relaxed/simple;
	bh=VY675eYjUZoQ4qasLUHxqAfaPONWkaQKRn1p4ewIiX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PNR8bMTnTnAxE6C2EDHI9/053yhEmhFRCyFL+Jg/cs3vTn3E2L+rj+LW3qtT99HegjFuiJqeipmhSXkBCnL+WttRFFmV3UasvwiHGZK/MWyzZGiXBhK77eTKDXeMbyXErG/alqG6Ux9BA08bB3DhFm8SJg9JTbaqhtWJ2RBs338=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPROKVQO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPROKVQO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4022DC4CEF7;
	Sun, 15 Feb 2026 20:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771187913;
	bh=VY675eYjUZoQ4qasLUHxqAfaPONWkaQKRn1p4ewIiX0=;
	h=From:Date:Subject:To:Cc:From;
	b=qPROKVQOfsvp8hw2yYOFMlSXNeUhOhJZJ+rBqstP7KjnLP6Uj+IREAXLGwmOK2Xcs
	 kEDmOFAIvW/SrdrqHqKEQRFAhFdTzB3o0q8MrVCVkqLI5yCZ6dQbSe4g+ppWDiS75i
	 B8dk5iGPly8GH8tHf2cl1iGAkppSoLHJinHjm2UZeXVIis22rsxyL5rm83WOlfrvc/
	 8BAJtBJejOY+aSvWHntdaUq1mDqO9fJTbFI/8lVeiAaHOQFAs/pE7VXXZtaP32VNpH
	 cLpE392mjue+2hISXPva+sLE6IeDAGuRTk0oEtpBqVBcAA2O+NF6el3cIbd99+4syd
	 wNzcU7RV1OVuQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:38:24 +0100
Subject: [PATCH] rust: sync: add `UniqueArc::as_ptr`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-unique-arc-as-ptr-v1-1-bdf4b3174475@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL8ukmkC/x3MQQ5AMBBA0avIrE3SjpBwFbGodjCbYopIxN01l
 m/x/wOJVThBVzygfEmSNWbYsgC/uDgzSsgGMtQYsjWeUfaT0alHl3A7FCvikUwbAtsRcrcpT3L
 /z3543w/YUS16YwAAAA==
X-Change-ID: 20260215-unique-arc-as-ptr-32eb209dde1b
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=VY675eYjUZoQ4qasLUHxqAfaPONWkaQKRn1p4ewIiX0=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpki7AkFq9rNTOFwjBQlqp9xrTzfNPLCL5yVZtA
 xbfxv8rVWuJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIuwAAKCRDhuBo+eShj
 d66GD/46TY/72vEJalvIh/Ft3CviQezfiuysuBDuAC0CktNJb6X+l9tRXsv14MAl0c+u5POTrlj
 FRAG1o12KPLRG/aFG3uicvehQxjGygEFaOF8K7j73QsbzA/G0lTM4nHgF6sdRsLn/eTeBwi1Eeb
 PE/6p/IRLYKn7RzzT0VhhzOukKDbA2mMZU2x9TpaxqgjtTuITm8I37GHzylycG6BdaO3A6c+lOx
 FIR+ji/UBmpjOdmId3fRzOa3GRHjXmustk/sgITd75pe1HWWd6Zqd7F8M71d2bz+GHPOdy6FSdf
 OeQ9jeqVaE1PKJoNktTIIUFzpcoqDJLU0h6rxYD0HitDp+C/swEzkx2eWG5jvaJEGW1xhoBoE5m
 WEBtY1rMLHDgolmH/g4xZmblWkM5IjsIvaJj7gt4e6M3wMDQFjEvSygMlQ+cVyW292BTUaP2Vp+
 OImPT2VP97qCMvHuXAubsWM1BAc9Ejp+DQWIWGoElc3UGgbnHbTiTRrYFP9SP/1RWDmVq07MKJ7
 +Hrdx95OmKokw6HTNGtsyA8kW2YLshIJW5rBfZuGxLGJvuzC52Ca8yNlFN+ICQ1TJGIIk4EjerH
 uAOMMc2bGUTdg7xAexs2yeW2jNBAZRkaQ5Q2o3o5zktKIgxUxcODH38csWZbarmdaA8BxjVwpQB
 WkJmiGbEuZEAPCA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a method to `UniqueArc` for getting a raw pointer. The implementation
defers to the `Arc` implementation of the same method.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/arc.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 289f77abf415a..9c70fdd39bd2f 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -770,6 +770,11 @@ pub fn new_uninit(flags: Flags) -> Result<UniqueArc<MaybeUninit<T>>, AllocError>
             inner: unsafe { Arc::from_inner(KBox::leak(inner).into()) },
         })
     }
+
+    /// Return a raw pointer to the data in this unique arc.
+    pub fn as_ptr(&self) -> *const T {
+        Arc::as_ptr(&self.inner)
+    }
 }
 
 impl<T> UniqueArc<MaybeUninit<T>> {

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260215-unique-arc-as-ptr-32eb209dde1b

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


