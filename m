Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B3C432BE4
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Sep 2026 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514279; cv=none; b=BpmYSSrtSCaQtYFevMMHME8gypc8IdaWh4LU2oOh8EiCJdYtGQgNi3faGLMWmzKBGPyrb0cMh6ihyJkBQnIkSBUEiVNfdZG4xkjgONnaltvb0Ot7IjG0xHLuG0arR3Oygl0pH0E6k/H3phtA2JP5JZkFUXuZLzQmzdREErvmVe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514279; c=relaxed/simple;
	bh=xMRApOOefKh+DXWFUiesYAqyBRhLIMAPeDp6bjGR/E0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=g8YYgffD26Ydi+MjxddqV5/cHa3EVbeGppxBh1ZJfC9uNCMkq/tOtEcvc9LFsJXLRX+wUyURZIVDgJq0IxVxzID0+Nw/LaDFgtFUmUClR3rbVxoSLdWg8cqmYkHLVbjZB+X55ffPcFDvjDQh+IckhHewSP3rj37tPNFNegew8W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p0d7PNZM; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p0d7PNZM"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c1c4715cf0eso60234766b.2
        for <rust-for-linux@vger.kernel.org>; Fri, 04 Sep 2026 02:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788514276; x=1789119076; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSxr6EgEaJb6EtvYw6qBtHVsWt7JMV5deBRhBdZPZ3c=;
        b=p0d7PNZMLc7JJlHmC43rwcRtPEhOWE68hYRN2985XYVTOg7S76pS7b1dQYx2p94Aaf
         neDpfqbSFdg1TIj0+eKG91FeubmqOhPAs6b/Rvzdz2sdwXYmqpApbISsbJPZyB8KPzpH
         80EULd5rK3XQrXWMH2pjiuxlpCjfJfpTwf7ZdyLlkTVdbFhnBN0zwQNWVQ59Q1magL+Z
         A6oOwd1+tQSVAojYsL08l4NUkbe31I0MPe8jOQieIHxP8YABrwNp351iR4Q5cWN9YpEa
         e11BahHv50zd/CGgQecvlL1XmzOjBZHRxG9K3kP+aBvpsZy1H4P283FRLnyEbxDWR4eK
         t0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514276; x=1789119076;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSxr6EgEaJb6EtvYw6qBtHVsWt7JMV5deBRhBdZPZ3c=;
        b=OQmZ0NfTJPah8l8imXVUxI04EdbVQap5ZnAgWCiRqdOJOgTIZfxEfPqI6CWXXlMk+g
         cCTwQ0/ZjmEZS04WI5cTeAY4fow56x7MwQfxgqiZ6un995X+LgJRx3J1GdbpmfpXAtsg
         NQurIJXoMrGL2+NeeBArVPBVI4y+I5n9Y6h2opqs/4PnDugRd1nWJ9lJVDatTCZW3Gj9
         FGzlWJEONfh5M+In2WQ68oe5ClEE3e9ge8FQwG6HJLhssMJAZhIRle3egqb+OOi5b8nV
         i8iDPwrU48ZYwQepj0rkqmGeBhxSiREWLr7JPodh7o6GqHnfyC2pE5GzA8FX17iLj8oL
         U7YA==
X-Forwarded-Encrypted: i=1; AKwUvBxuzgAXGAqC09jqaJGEStBzg2SmifBa3FifluKLWpgX9XmBN/XhICs4+kYtXK5VW3ofLZw+SY6FxadmmaSTKw==@vger.kernel.org
X-Gm-Message-State: AFuF++lgjDUisX2ZeMr/YK/tjnIP4+Ol5u3MiB2MTqWQqH6dKs0NXlBP
	4Al3Og/lA3mJYPzy86iBp2LpYflJKXaDWsB3KIrN6+JtLunGjsgcJ7mOPZCZSZXZTFkag24Gho1
	nvgywatHIYnNqsM9f3g==
X-Received: from ejdo5.prod.google.com ([2002:a17:906:2885:b0:c24:d27c:a6b5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:e158:b0:c26:1649:47b7 with SMTP id a640c23a62f3a-c26164956bamr70235466b.45.1788514275985;
 Fri, 04 Sep 2026 02:31:15 -0700 (PDT)
Date: Fri, 04 Sep 2026 09:31:09 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANyPmmoC/x3MSQqAMAxA0atI1gbiPFxFXNQaNZtWmiKCeHeLy
 7f4/wHlIKwwZg8EvkTFu4Qiz8Aexu2MsiZDSWVLA9XoPIpHjSaKVTQLdaajqultD6k5A29y/79 pft8Pc4IdTF8AAAA=
X-Change-Id: 20260904-no-io-statics-ab07a70358c8
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=xMRApOOefKh+DXWFUiesYAqyBRhLIMAPeDp6bjGR/E0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqmo/eieaguK734PU8bTAf20wlEkY4iEdGsRVw0
 b3U1feX8l+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCapqP3gAKCRAEWL7uWMY5
 RvavD/9HMWozqGXQsDRWI77+/WungadXhjHUdI0YqnPHVw4XudpoA2ZggMBRAcuQtbj4hkKWbN3
 xrUv9gjwsCdJKfhWXkAw5wFu2oB3exQzVkvHdF8nm2EFg0z1NEJjZ9qq9yX+ndTS/wpGreIqeCP
 sLBqiHU7Ai16c3n3gqDTyBswpy5XbJzPa7kj+YuZd0l+7H27Wfe4mW1WiRPmy1jhoAf5MnLqNkX
 AXtUabsLqcA/Qc4gLOY1Bk7L0t3tWPXUPwnJD54h5JZGW192MgLQeCEqpAyXnUaq1gssqr7NQgQ
 qhXW7RWFqC2X87zYOYDSrk8spMzwOMqmZ3tlZpqx1v6t4WAlBijpxjOjjluQp48IWlhLVzE5A63
 U1DtNe8oh/GQuaWWfJ4uuGQyy2BLOwaeYn26BcanWLHarHy3xqqw+v5WoyQsaKxMeKiNn56wckR
 7HwBVwkdd3h17PIJAM5OlHKdhAAmy7KDOiHKWaLsI6gqm1GfOjvt2fSmdFZQUg8j2FdCYcLeDlR
 tE5wc1YYuIIPcAUr4orxgm45K/AcyNNirS3wYpVX1HoNR070vh1+k1BmZytPJ7fkst3eVrJrwWp
 8LfroyM+cCboQODT37SZg1hBq7y+xipQ560dKj4GZGnVrIdw1G+d9NtOgZSe6EHgWYMupouWigG JXeG9xiL800L+6Q==
X-Mailer: b4 0.14.3
Message-ID: <20260904-no-io-statics-v1-1-a2386eb0d255@google.com>
Subject: [PATCH] rust: kbuild: add `no_io_statics` to `core-cfgs`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

In upstream Rust, PR #155625 moved `std::io::Error` into `core` under
the `core_io` feature gate. To support decoding and formatting raw OS
errors (`RawOsError`) from within `core` without depending on OS
facilities, `core` introduced a global atomic pointer:

	static OS_FUNCTIONS: atomic::AtomicPtr<OsFunctions>

At runtime, `std` registers its OS error vtable with this pointer via
`set_functions()`, which uses `core::sync::atomic` to modify the value
of this atomic variable.

To ensure that `core` does not introduce usage of `core::sync::atomic`
into the kernel image, set the `no_io_statics` cfg, which removes this
logic from the build.

Note that changing the `OS_FUNCTIONS` global is only possible via the
unstable `from_raw_os_error_with_functions()` function from `core`,
which is called by `std`. There is no way for us to invoke it from the
kernel, as we do not use `std`.

Link: https://github.com/rust-lang/rust/pull/155625
Link: https://github.com/rust-lang/rust/issues/154046
Link: https://github.com/rust-lang/libs-team/issues/755
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index da1a7409d984..8cbee5b6b0bd 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -75,7 +75,8 @@ endif
 cfgs-to-flags = $(patsubst %,--cfg='%',$1)
 
 core-cfgs := \
-    no_fp_fmt_parse
+    no_fp_fmt_parse \
+    no_io_statics
 
 core-edition := $(if $(call rustc-min-version,108700),2024,2021)
 

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260904-no-io-statics-ab07a70358c8

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

