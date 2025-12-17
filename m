Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D5034DCCE
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 17:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765993033; cv=none; b=LRqtmIMGgwZBwojmjF2xjfwkUGIksbM7s+nySz4R2LYsrMlV+H9VprNxRuuWrL0JGIUfU+yo1QHnr15ilyPkIGVjXFJgQ+WCxnAatsWs0C0dG8SV1d5saGd+VzV5VHJhgiwgIDJujMEB1P2WypqzjpRPbPMiZtSu9/Nm/wKKS5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765993033; c=relaxed/simple;
	bh=PTm5AFbcURYDMprm93HPMXPf8o1B2T7ywE+peDAQtF4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=U+wUvzzzj2UfkckqL/DHFekWIc6UevzT1klgq01YN0SpF5if/rey6xm1h/pYsL9rKtj6wXpWqqkDUjwKHUdZ27uuLV0swAjkwuJm6uGwhJpWt67lPRmvy8BuKTbkR+AAYmXVzRqJtZ9us1zmdmOciFizPhai5UYrr7njs3rFJHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kAwvOLfw; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kAwvOLfw"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43065ad16a8so2349251f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 09:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765993029; x=1766597829; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zikkTM8bLj1uPik3DewvI79yYVX7e21yz86z3WZ2LwA=;
        b=kAwvOLfwdxHCnDahIOdMfNAvyCLFRXWHp7rbwS3cC++g40MiohyPX/Zq55zyJSoEe8
         Oo9dlUvAOkCeILSLgrnDSr59CxczKKvffWYCw1y8Lsbthdo6pjIImfdGGLiTWIGpYE8C
         b9qjIb/EyA6DFFdUBufKyUsTXOwIncK2sxO9f0b3OfK6Zc4ArfaIw8+1BxzJJr/TAdyV
         CAVvzDNvpIymyasSiUEYwk+IOReLOl+1l5UlHjHMeBNXIjCdbT3604n8/GxPpYK+XHuS
         YE6wZGHGqVGWvmSENH9AefByjvInI8bjH7COBZ9k8UOaJr1evsUlbG7p0jZPQEJpS/mD
         en7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765993029; x=1766597829;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zikkTM8bLj1uPik3DewvI79yYVX7e21yz86z3WZ2LwA=;
        b=mYCfvvE0hRiF9LQVdqe3zgsqDh9hmat3zb+u8FwF1IXTGi2y2KbpJoIF22HeNmHjSi
         WvwksIcqTUWeJYmEyMa/a5L9E5YeOt6jtRINYPl1etFTCWxy4f93qWoj3skPIohMbetj
         E2VrRYbn3YMenWmUdcnTs+ajMWfrfXeTYnGLVnSnnzS5Kru7CZRkPS63L4LDRGGYYSxQ
         lP+gs/OPHpxEBC85OuDyeNcd862c1Xuv+s7UQETgyvQOLkAgW2OGX7yzbkdvmsZlepjB
         cj+l7rqFIqL2m5H/oNnRg9igd3VYJNEnJ63qyI1+pDJ8N7dnEHIJ514nY3GsN73nYIW4
         vRfg==
X-Forwarded-Encrypted: i=1; AJvYcCXFCM1FcL5iM9eUELrYQaWP1p/6nIKufvOooqZklchpeSKCuBpj1NBz8sheQxUQGEuaWodv6AbyKh0tTgMzKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJVCveYJlbKaXeZwSyuF5SxoKqbwDao167JDtWDzBUrPJQNecW
	2xnzd/SgRCxR9YKN0YOU6knHBR/aQhik45pBct2qPi2tZziWJSo854wYoGW7cQsyx1IOO2RF8cY
	yDnpfRClvbOoH3gN5fg==
X-Google-Smtp-Source: AGHT+IGdg8q1/NNZFtLFkf8JteeAxs1cK9VpyqzkmmmlPRGHTPGDzmcxvt8saFf/+JYSqLKHH0qdMbFJ9KPfgY4=
X-Received: from wrig10.prod.google.com ([2002:a5d:64ea:0:b0:430:f6ec:8016])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c9:b0:430:fdfc:7deb with SMTP id ffacd0b85a97d-430fdfc80e4mr11516780f8f.35.1765993028827;
 Wed, 17 Dec 2025 09:37:08 -0800 (PST)
Date: Wed, 17 Dec 2025 17:37:00 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADvqQmkC/x2MywqAIBAAfyX23IIPJOhXooPpWntRUYpA/Pek4
 wzMNKhUmCqsU4NCD1dOcYCcJ3CXjSch+8GghDJSyQXvmDliSAVtoYDaOxFIB28OASPKQ/L7D7e 99w/wjPnhYAAAAA==
X-Change-Id: 20251217-unpin-for-aref-3dc0fe3fd5b0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=PTm5AFbcURYDMprm93HPMXPf8o1B2T7ywE+peDAQtF4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpQuo/ncOeSeeGbDWhLYIHC1yc7SBUwggcEK3Qi
 pcn09EQZdiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaULqPwAKCRAEWL7uWMY5
 RpFbEAC01gWIXqn4qyrDKluRxoh1VeRK61fLwsamQisYY4Kl1k9GZL4Ko2Ix/t09oYdUBc2yon/
 ftZhanxoD4NisioP8SmQXssZOFvEQoEvCiOnXjo25llr/noWgFmvXfq5bcm8xXqLfhqtc8YOs33
 XxNhl41HnVuSNlLzYyPMtYX6LCSmLgBK3NzQVSWJPVNud/PU8JQPeswK7v5fj7bmZL83OhJ160Z
 FSWz56qf1IJrMnynFVy/GpKbyktUuxYeaFKSpOd1mImhGjLEBgPfEtHsR/eaW7S+QwvgwjWMUge
 5ujGbr+Y4syBJvEn6+94sBOqToC6+wlkulyBq9LA3NP3aSYLBT6bkT03vncb4GOymznO7C+on/K
 vnvghorWQypWdvLD2gPi8cRfDZ+E5M1n+A5Mtu+etLuxd1Vr52NcTIxjfisCahT2TjRx2FANRV9
 gwH0GKn14LSsTmjqrZ2bmLq2t9dclb3fZWKGoAfMaKiIlYS35xvzjdR0uzJWSwaBxNbsLknZEr8
 8x5mGYEKWT4qd5v0QvXuOd1MjXuh8M9AAC52AoQi7IEdN+BW0PzquS2jzqRpA82jtdVVqpiyTc6
 weQiRuVzBFZf8tZu1hJs97Go67rXfUdRhmI67CrIBDr+g5v7Grpbx8+5bcP4iOt7qGexAGS2+Rh 3glKx7TUlhYWREQ==
X-Mailer: b4 0.14.2
Message-ID: <20251217-unpin-for-aref-v1-1-84711b747d02@google.com>
Subject: [PATCH] rust: sync: implement Unpin for ARef
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The default implementation of Unpin for ARef<T> is conditional on T
being Unpin due to its PhantomData<T> field. However, this is overly
strict as pointers to T are legal to move even if T itself cannot move.

Since commit 66f1ea83d9f8 ("rust: lock: Add a Pin<&mut T> accessor")
this causes build failures when combined with a Mutex that contains an
field ARef<T>, because almost any type that ARef is used with is !Unpin.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/aref.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index 0d24a0432015d09509a255df0a4f114171ae9fb0..c4be6f5d4884ddd6cbfbd7c27d396310a7cde30e 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -83,6 +83,9 @@ unsafe impl<T: AlwaysRefCounted + Sync + Send> Send for ARef<T> {}
 // example, when the reference count reaches zero and `T` is dropped.
 unsafe impl<T: AlwaysRefCounted + Sync + Send> Sync for ARef<T> {}
 
+// Even if T is pinned, pointers to T can still move.
+impl<T> Unpin for ARef<T> {}
+
 impl<T: AlwaysRefCounted> ARef<T> {
     /// Creates a new instance of [`ARef`].
     ///

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251217-unpin-for-aref-3dc0fe3fd5b0

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

