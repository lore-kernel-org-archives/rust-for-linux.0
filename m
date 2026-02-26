Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A053375DD
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 23:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772149666; cv=none; b=sB0KLspB0fScblJax6pbOJlXK1CheRFLE0eigPo0KP83xG4qWctNHXZD7LO1MYRfgo7PpExQRdavFKnpsKl6gyyrgm/gt9MUszQz5Q+3csACl/Ua3lkGXQJlxhmAB5RrW8P94fIUp8Jl75nc+UpkRq0HyUPggHE3OtFd70WVa9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772149666; c=relaxed/simple;
	bh=RHn2hmvCm9HqGAs0R0Q7MI+s5iIBHQPJjHJ3TmmUVZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vslqt9MnvU51IZykXDAC9lTYYlIAJfCNLuj8QzjO2IcEzXz3+x7nlSwQZYnuhYdud3DLObfI1y5Tl+pKOyZWDQp983YUX+1nYjTgvDPefmcOPWHs/KR3+R4QNOEWYXQwmtb7nCFtLXxzfKsJXyLEexZvAhxPHLmqU+ejMKXLe7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5xbapxx; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5xbapxx"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12776bebe9fso2253529c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 15:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772149663; x=1772754463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNVcpj/MlR6xmLdrStuL7mU5hg7ztc2Pvj8nGgrDXrY=;
        b=T5xbapxxHxmnGx3MweLRwo6oFS9rU/w4h0p6yhze7NFBa1KKwaQJfOQGu8XmUTdJsQ
         iKU2J8UvnfKTm97ky0id3EbMHfoCQIyMo+u9k4QzZi+jOgZQ10279SpFIjpWFYJEa/vz
         HoTD4ixtcRN78AS7HaSVhP7UAY4PJlUhCkc1m9Ry+aHHDCD4GxRLcOp166SK565PYYyE
         wR+ux/xxGSsRZX1+JiwGGCMbXPaTXmTAE2dkTgQkTL3mZAjlGmJ1LaOMfdyz8plNTvnr
         Bsv63Vcfn6RoIE9UhvPcRXfnwOAGH6tWNkvvBJbK7Xf0k/Hl7qQfCReYougKQZoBWzWm
         aJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772149663; x=1772754463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sNVcpj/MlR6xmLdrStuL7mU5hg7ztc2Pvj8nGgrDXrY=;
        b=PzqBhH7dBqQ/1X4xCr3cZmjAsiE2V3TiaX1MwLu5asxKjc6rwGf6CbTHnwaTBsy2fZ
         ha2WfltiBk4Votj1opbg5bah4fqC/W5U9EGaU+DnHceoZHhc/5wOvxqe8x3+fj38cM1j
         Hxbe/TaKcou9vAhCXNg9w+dWpXPthMnsojnk26XTPy2t8viWGqTxBpaL7CV4deWS6U1V
         yGjEeJt6xpjI+W0+NZMfigBbm3Y6M/kX1wtjweBHecXWkvgKdiWUKwMLreO/gV9GGRw0
         sQgBW7IXWSHrcSfBeLDT5gX/7XpnUD3vb2du5Qgb7rXw8KZhrSKaBvE9oPZm1EyHG4bB
         7LjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/QZS+15DBIhAM4oJZRvqjvzWgl64T66rWW3rQj6MnOT0rrhWDT0QibVDl/+Wy1looo7jlYqGR6Zso9HTOlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBVXkdyE3ABJ5MRA3srv5H938JZi3Btm+1STNF4EA/HOZ5XcQN
	gRqP3BRMYEXWIilo2vGDJFNfTfpzK63pDVc/kmTVMDa4XGT4VTZ0/alv
X-Gm-Gg: ATEYQzxY5RdexcVaIY/+7sy2MCzBB2Fn9zioC4n5g4S3Ea/M+LkG4uWNaGNkFCBJPTU
	s5H1cEl1IeMMTst3U2qvXm5vg+/DoBJaqYvAQdk9VSEOWgeIpzdAD316dR6mp1jSQzCIYPYBBHP
	J09L/jUsmf8vuVkXvwBySVoC+Xv85IYmi12OxejPyD6QcLikbc90QynHUroS+5QylNACzz51WEG
	B3GV24QkFWWm4ST+yxVhA+UkRdwRuVm4opkFeh8IdCSXTK5YwPIXZf7ytwSFWbnybvQUTyi0JTP
	QTOd1cCX0STrkcK/WiMnYcrLW9QzjEJMHADzBHfMTSSOvk3nX7F0uWs1K25PYxzma0Rwc7JdW9v
	flN8QXyFSSdBea524+ogNbwIQty//WqlWLbStZ9T3s9vf8sBAKsOEUkr0kjWWNX/M19sDN7nz+i
	RZTXrKmVevMOJFvBalpCjrn8atvMzgu2sKm/Fx0Xod9xIvWdp76UdIxnmg5jCvfywBrt9Rhda7d
	w==
X-Received: by 2002:a05:7022:6986:b0:124:a4cf:ce90 with SMTP id a92af1059eb24-1278fc288e8mr352535c88.1.1772149663234;
        Thu, 26 Feb 2026 15:47:43 -0800 (PST)
Received: from localhost (99-122-55-39.lightspeed.sntcca.sbcglobal.net. [99.122.55.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a5312dsm3296029c88.16.2026.02.26.15.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 15:47:42 -0800 (PST)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	David Gow <davidgow@google.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] rust: module_param: add from_setup_arg() to ModuleParam trait
Date: Thu, 26 Feb 2026 15:47:31 -0800
Message-ID: <20260226234736.428341-6-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226234736.428341-1-thepacketgeek@gmail.com>
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the ModuleParam trait with from_setup_arg(), which constructs
a parameter value from a raw C string pointer received via a __setup
callback during early boot.

The default implementation converts the pointer to a CStr and
delegates to try_from_param_arg(), which handles the parse-from-string
path used by integer types.

StringParam overrides this method to store the raw pointer directly
without parsing, since the pointer originates from static_command_line
and remains valid for the kernel's lifetime.

Also add ModuleParamAccess::set_value() to allow the __setup callback
generated by the module! macro to populate the SetOnce container with
first-write-wins semantics.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 rust/kernel/module_param.rs | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
index 54379a2bba51..5e14dbe03865 100644
--- a/rust/kernel/module_param.rs
+++ b/rust/kernel/module_param.rs
@@ -45,6 +45,21 @@ unsafe impl Sync for ObsKernelParam {}
 pub trait ModuleParam: Sized + Copy {
     /// Parse a parameter argument into the parameter value.
     fn try_from_param_arg(arg: &BStr) -> Result<Self>;
+
+    /// Create a parameter value from a raw `__setup` callback argument.
+    ///
+    /// Default implementation: parse the null-terminated C string via
+    /// [`ModuleParam::try_from_param_arg`]. `StringParam` overrides this to store the pointer
+    /// directly.
+    ///
+    /// # Safety
+    ///
+    /// `val` must point to a valid null-terminated string.
+    unsafe fn from_setup_arg(val: *const c_char) -> Result<Self> {
+        // SAFETY: Caller guarantees `val` points to a valid null-terminated string.
+        let cstr = unsafe { CStr::from_char_ptr(val) };
+        Self::try_from_param_arg(cstr.as_ref())
+    }
 }
 
 /// Set the module parameter from a string.
@@ -226,6 +241,12 @@ fn try_from_param_arg(_arg: &BStr) -> Result<Self> {
         // when using PARAM_OPS_STRING.
         Err(EINVAL)
     }
+
+    unsafe fn from_setup_arg(val: *const c_char) -> Result<Self> {
+        // SAFETY: Caller guarantees `val` points to a valid null-terminated string.
+        // The pointer comes from `static_command_line` which is valid for the kernel's lifetime.
+        Ok(unsafe { StringParam::from_ptr(val) })
+    }
 }
 
 /// A wrapper for kernel parameters.
@@ -266,6 +287,14 @@ pub fn value(&self) -> &T {
     pub const fn as_void_ptr(&self) -> *mut c_void {
         core::ptr::from_ref(self).cast_mut().cast()
     }
+
+    /// Set the parameter value directly.
+    ///
+    /// Returns `true` if successfully set, `false` if already populated
+    /// (first-write-wins semantics via [`SetOnce`]).
+    pub fn set_value(&self, val: T) -> bool {
+        self.value.populate(val)
+    }
 }
 
 #[doc(hidden)]
-- 
2.52.0

