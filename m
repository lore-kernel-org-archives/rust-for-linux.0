Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5FC3126C0;
	Fri,  6 Feb 2026 21:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412337; cv=none; b=a2AfT1AgC5IYWi6KRudKKJdggeESFPQlCpnoAfU0Qi98HqVo/hinJHBzax7D7EKfW33Anb2FMus5Gjp+CVrkQ6SR8yWfpuButxmDiMJ8uB7YAeDbNmyp7D87gWSkhRvDestMwnUdf1FgUFz0jmlU0VvbDE8xlGcIZxiFtYlNUzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412337; c=relaxed/simple;
	bh=QeBXOf7iICj0Ad5qHcIJv0VhQMqjDmVdKEV04oiCJGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yl9HdYLvje8k762i3SIMXaUwg4cQ/2MDoyQlCETP0z2OGy6wbR7bQYUUmjIu8TbiPqVhDOtxrYiBFyASJ3kxNSxCOmT4FwnpLq/MvAPTbSRMgWAr3hoMkcAL10Ewg1QbYwru9n+1+Qla/lOuTxDEDfzn3cZ2S5R3NO8DVmdPh1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyhNNPYW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyhNNPYW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9C7C19424;
	Fri,  6 Feb 2026 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770412337;
	bh=QeBXOf7iICj0Ad5qHcIJv0VhQMqjDmVdKEV04oiCJGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nyhNNPYWM1GLHkWakHwZEPnK0d6uMc9aIrhlMgVy6Ek1MlCQInIw9nQ2+5tDDGXCM
	 UTVMUNDqtE/I3UqqIRibXG+c/0vzFycV+Mo5iuc2gtUq56iR+X6GKZwGLSvYFX9FCM
	 Axg2TnM6TObx7sARpC9tLrKUhFKg5bLXy2fjiPc30k5/FQuze9eG5WZbeK/YwZ4P0D
	 nJoltkXEu14Vt+EuDeRamO1iesLgpWanlwPD3LYFHmoyE1njqo81dGYYzv5K33ChAA
	 Guo42yP+3yBmgdH3PVhGebTiUpM3KBSYFEmVkEIi3arR3/bmLNLT9Nv0sgIOq6Fuf7
	 Qywznk0Meef2w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 06 Feb 2026 22:10:48 +0100
Subject: [PATCH v2 02/11] rust: xarray: add debug format for `StoreError`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-xarray-entry-send-v2-2-91c41673fd30@kernel.org>
References: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
In-Reply-To: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=QeBXOf7iICj0Ad5qHcIJv0VhQMqjDmVdKEV04oiCJGE=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBphljieWZ/1recsKiHHbZ5uEHZHRV0mZOSAv6KA
 uaHTggj9BaJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYZY4gAKCRDhuBo+eShj
 d+W1D/4qt398Xrr2oiXr1+jJpcY7mmP72uBRCYxORQ81s2Mg+hCY+dAEYH+h9DRbrOawMCh8S3h
 tz+sMTQFlhUYRHxzdWcgEPxQgBjbjwLytQQskg5tZE/GJFFns3m/EQxCgK0d9HVlp5PmjF1qZvU
 dExZSDPgvbQ8UjCDfxbwSAUUU5qku5iX3wgHImyOVdv1PUOAcQGfIx3Zb0qnzq8WL2IV9SXEXG0
 Mbie9op8xNV2Qu2Nsfph3OXvMjmFDU4LHW7ygdY8i//zLFJsvD89PGqfLW9wPb+ayY2nB5Dbmcy
 8goorUjz/oROTOGXemqz0sfwTcxXQ7A+TD85yjdo5C9Mqm0FZtfVgLzk5ln8TUN+IdEdsdy1XHW
 rDuT+RgGOG7fSX3vAMAFShjyZL4pd1AkDE1yZnweQiVb8yff3mGyfoUxiuAVHP8KWePekmzYZV+
 TePzTqSSMpS1VKz6WmCihK/aU1DesDX177pCT/8iLrmmeR6o2YYi5NvVQdjj+oY+Oib0FvpwMRm
 Ur/l4cHjZ/hZVxNFvlHXaI6xlytrl3P7TeRjcLE2XIJ5c81YdFhKGG/m0J/j0KyQAlfAAvbuAXq
 CObOyfvdTDBR0T5B06gg7md3kl4q78WAhH157iiR2ox9w+KOOMqBBzU2nVJXz6LR5TrkSVl2l2L
 lPaBWzFXq9nxaRA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a `Debug` implementation for `StoreError<T>` to enable better error
reporting and debugging. The implementation only displays the `error`
field and omits the `value` field, as `T` may not implement `Debug`.

Reviewed-by: Gary Guo <gary@garyguo.net>
Acked-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 88625c9abf4ef..d9762c6bef19c 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -193,6 +193,14 @@ pub struct StoreError<T> {
     pub value: T,
 }
 
+impl<T> core::fmt::Debug for StoreError<T> {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        f.debug_struct("StoreError")
+            .field("error", &self.error)
+            .finish()
+    }
+}
+
 impl<T> From<StoreError<T>> for Error {
     fn from(value: StoreError<T>) -> Self {
         value.error

-- 
2.51.2


