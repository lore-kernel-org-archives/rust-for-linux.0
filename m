Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012290;
	b=o5m2dAj++u5ATKqQKgchC26AJt4d4tEXAg4yqRCi4T7wbJQaJviwVT3JYo4JvbYM1293
	 t89Og8bOjLBLLNaHu2Bph0GxBEmdQmggZSm5kv4pIoR5KUXfS28Ne+lli9uovRRkiaWxw
	 mZMVmrViwG/qtSalssr6R7E4L/HOm2g39Tbko5yWUk6OJWpnMeh7iHnZfi6eZbTZQMj+a
	 /ltvJSoGz3YVOyo83/+H7ZKYhbqHY2HZ845g4k3Z3y0pYUYsiLLeYHJtc0Ij6l1YM7877
	 xZLyR2RMQDCCpYiWnkGnBOhV3qXhxVhbnjVjmmXG20Sh6S20tIXsi4Ssg5wv/Q95yAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012290;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XcDe0SmpcANIrDpzAwnOmDX4Xs1qtWaLxh3V8T1jjVY=;
	b=3abivq8ldwSd1c3iClwZGxqcFXxZ2YqRWoOPdGOCnSQnnH4GYyu6R6eWskNlsKpVAAwh
	 /IdpkbhyoGk57CcF3aKGAPtV7HeYxgbKAmtIAJ29Abq9VRxBxr9y5JxT5ITIPE2Kc+I0t
	 4FVTIwvU3SY7rGBIauy6R1sRxN2qjFSUWOdQHl7wM6PJhzx0i33JRq5mBTSSiSn68IBL9
	 8isC3zpu8hyii4Tux3XJ+31OwZcH2g8MpafMVIbgBI7SPgj38+01+NWc8tqPyRx8d32K6
	 QF8co5K3ddoJ/z5zrdFGLonAvPTdNoRIuxO5jzNA2/b7tsJcIlRzZOjXNR+lUUkeSGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5rVw1on;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5693606A331;
	Wed, 18 Nov 2026 14:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5rVw1on
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4651F000C9;
	Wed, 18 Nov 2026 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012290;
	bh=XcDe0SmpcANIrDpzAwnOmDX4Xs1qtWaLxh3V8T1jjVY=;
	h=From:Subject:Date:To:Cc;
	b=h5rVw1onUagBrmhrtKMqzBgMlU58KYisbvjLf4DcGuyY47udJrZ6jf9F+1DlfMFsJ
	 NSrTmoP/GjL6tFf2wnyciGxDC0kXgH711zMl8CYX+UgGUpYjfdrVAE/82/Y8698lBu
	 Wm11CMDzFobDvXCZMyrrGvI+s94lj1uRDgj4/cekKkjdTw/DDinCnZQTQsKcFiAyYh
	 +sQX2FUrslMjOEZV5pT8ORd+KNfIsgkhRiWhWwIseD9+eWVF+CLzl6/XVPUfVuWA4M
	 z9x8sYM5vZMvGoeaPkcaCnMtYDR8XDmFywTwR5FDZli/GHlvGQV4n1x4otGxBb7sxk
	 Hl5WUen5WmPyA==
From: Gary Guo <gary@kernel.org>
Subject: [PATCH 0/3] rust: pin-init: reduce visibility of projection
 methods to declutter rustdoc
Date: Wed, 18 Nov 2026 14:31:19 +0000
Message-Id: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALi2/WoC/yWMQQ7CIBREr9L8tT8KJqT1KsYF0MF+F7QB2jRpe
 ndBl2/y5h2UkQSZHt1BCZtkmWMFdenITza+wTJWJn3TRinV84iNlzR/4AtXnUPo77ADzKAN1de
 SEGT/FZ+vP+fVNb1lmuFsBrtko5/aVBJwXSSyRCkcsRc6zy8cCVZGmAAAAA==
X-Change-ID: 20261118-dev-project-vis-ff83ea9e6926
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795012287; l=1351;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=kFvBYHUBXWXs9SaDQAtEnNtyG7/SiB3hj7W5dkgcI6k=;
 b=87N/rZFfK14p/ipxL4v4wF237HBkdshie7j/9JFi41Fp9z79EV24DTER9AKL1CuRvE/lpiy0n
 tHf7xwUMSjkDtCBBmzqcsDqorq/asyoBoe3j8wSgKcuDeDG1gAKkq9E
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=

Currently all types that use `#[pin_data]` will have projection method
generated and visible in rustdoc. But for many types, all fields are
private and thus these projection methods are not useful as public APIs.

Thus, compute a least upper bound (LUB) of field visibility and use that as
visibility for projection methods instead. This means that if none of the
fields are accessible publicly, the projection methods won't be as well and
thus will be hidden from rustdoc.

We could also just mark these methods as `#[doc(hidden)]` -- but LSPs will
hide these methods too -- and bthese are indeed APIs that people would want
to use.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (3):
      rust: pin-init: internal: allow `clippy::large_unopt_stack_frames`
      rust: pin-init: internal: use visibility of the most visible field for projection
      rust: pin-init: internal: hide `HasPinData` impl

 rust/pin-init/internal/src/init.rs     |  2 +-
 rust/pin-init/internal/src/pin_data.rs | 36 ++++++++++++++++----------
 rust/pin-init/internal/src/util.rs     | 47 +++++++++++++++++++++++++++++++++-
 3 files changed, 69 insertions(+), 16 deletions(-)
---
base-commit: b7218f1996f8491dbe28632b70f444cb73f554df
change-id: 20261118-dev-project-vis-ff83ea9e6926

Best regards,
--  
Gary Guo <gary@garyguo.net>

