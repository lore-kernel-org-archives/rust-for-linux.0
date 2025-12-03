Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7A8257423;
	Wed,  3 Dec 2025 22:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800850; cv=none; b=mAMXwThMJ9NuAu8XstFCsSuCQcHRiWO+JdgC5PTMrzCMijwCNOOuzPDS7n4WLkoiz1vgKO4r0JKOxVNQAWRuWOTIZzeA1se+qtw4sn1rjXsRmF6de0fYXKXYRFTQszY/1UrFsMmr2M4md/Ex11Y7C179c6RITJUUINQoRGBosbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800850; c=relaxed/simple;
	bh=hBStdRM9X9Jt48Srj4ZInprCU4w1LOwO5wapy+gyHPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCv6ZLKZySxH1K2woSnQpikPrPmGlV+uuN8AzkaGJluJewYS09SXdogctC4AAbB/VcLvimwJPCjGURTJvyh3gCO9DWiI0MP53LNBL6IhgyW71O4c6FtVza59jhLmdFtLYYL25FJ9i2Ry00HMIMikKhzutfVd+VXmZQ7u5acLPUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imjqwTyz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imjqwTyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC6CC4CEFB;
	Wed,  3 Dec 2025 22:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764800850;
	bh=hBStdRM9X9Jt48Srj4ZInprCU4w1LOwO5wapy+gyHPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=imjqwTyzZv9TOsS9aY7U8iYCdE59jqOhIZeuuIyFp1BaBQX2/qxh/3ocW9X6DuGm2
	 mWmN66FFQvM/klLPlTW3f4nxt17I+PR3V86I/9se7C/x4Y+J7XLXhZDU4tBhiCDW5a
	 4t4nQjtsynw+tELiqwZAabTscay0OgyBAHxg3CfOW4AMp4rNUl1sVGsfcmiKwNTuf9
	 SSxE/mD8z5ticF253cGG5BUvrIHXOQAfp/OxkIl8uueiYTW7VBOdjHAWzawW73eb3L
	 Ct17IDmB5XOUzGrXNY5EgAjyuMGzmzWzSGLTOXhgvBYJW3FKVIhzPYu91WbLdBexdO
	 blPufEVTLFQ7g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 03 Dec 2025 23:26:32 +0100
Subject: [PATCH 02/10] rust: xarray: add debug format for `StoreError`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-xarray-entry-send-v1-2-9e5ffd5e3cf0@kernel.org>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=hBStdRM9X9Jt48Srj4ZInprCU4w1LOwO5wapy+gyHPI=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpMLkrrnqqd5Sd6Ic5e5aBvn1txrqQChgkKEEUi
 PsZvWjtnViJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaTC5KwAKCRDhuBo+eShj
 d/AhEACJOCDpykNiDw9nMM6tndOzrPQvnjYsL9QG1CmukuDpRHL/kI9RXcEN9tTwqmXK7u9AjQj
 StEDhnOmntUzWSt0nw8pmWLE9rTCj47lir8e+N1PV0DBt1d/vJrFENfWQ/l/JUb3DsmHZa9rSIc
 1xXydxKjWQ0ldahuTB5SrjeG5GPNWfN3MzPvhHmBOPC5vu0IDfXrk/OJlh5gAtiZIGeATqtZyU4
 OokAQ36zOd+qSf0J7D52YefDJmsNNlyK+gvJWu7ejCtjghF7GDQEul42PwO2B2qyWR7DJea2icr
 OrSSk/jDNSSHFcZjxFEiDplTF6dgffikA9cZuqVQwLW12SkZ5RR9rCMQBkFOzEItefOBI0d2Lhj
 kcqNHWGsGhSSifIQ1dvKNi/OGYC9wb+Jo/I+9APTHwUCi1YYTTBdkoSpZ0NAQhIpoaMh3K0Vz1k
 YQm+tWQccbc7l3/483/mv0FJpWxEEL914a/GdOLB/c0CMZ0AjSgSQ95XJIdk7Y60yXtS29BcqC6
 P41j3f6DjGaNwpzgAqBAjQhtu9YDwsF4GTmSNuRrlF28MLItDAZPryGD024NsEH0t4/NlnE1ag8
 4rfu9OPMgvYl+0BlKai4WgFsDmrKFgcCWzTo0DB68qdsqSpPq3c8RgDpaGnST+KZZLAkruRPk1K
 eCdz1QsCl6bhZRg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a `Debug` implementation for `StoreError<T>` to enable better error
reporting and debugging. The implementation only displays the `error`
field and omits the `value` field, as `T` may not implement `Debug`.

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


