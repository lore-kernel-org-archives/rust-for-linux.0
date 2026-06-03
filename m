Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449EF39890A
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jun 2026 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496456; cv=none; b=RjGeqXC1JQcCM1MQGgtQuMvdhZIWRHYyszsCKMOQgz3/G+bkxCzGVOimFL5pnS5in6SuKl4es8HRqI/Qe1aUwjPoAye/EtLUMx22cLamC8Y5n03JlCv2lijKbYKNfLSo8Cy41XK0CKfzOrA0Q7j2d+BkIEgc3Ztht96A2LY9LAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496456; c=relaxed/simple;
	bh=ZSLPqVt61lctJzxaTevXiN/ykp7A7nTIEl3D0342UJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VdwVmGgpYB2KDE7mK19rFZAW2+MstDpzg/qOvAaO0Ba8I05CIPkLEUyJHrOIgE1ZsJPaKct3wFmjUxsfCD7h4MTVljA3Q+RyWYjV/tOfIJCkw14UQrCjb3Q6oc0n7cEpVsMZue/qVLzaGyeCOIW1Ncmrxm/jNOHrAW+NXe+xImk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Acpba8M8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Acpba8M8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4908b92904fso74666595e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jun 2026 07:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780496454; x=1781101254; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=58tXNk3LREvDeN550oLDB8Z8oduiuPvGtjNz4oAA8zg=;
        b=Acpba8M8TTiT31lp7nWg1TRDZdoaADBD+NCOXPpSWLtAuSzgidHD2QPsSbkch2MRO0
         QFYgVUHNOo9aBlIR7/yB7prqbhHnQxxYjMB7yItiigCLZjJbxZ+Lk+EbcPNaUqHbqX0+
         FrTIcvemV0s0t9SU33HmuFr18ztHgDZGym3CkOF7/JaOn0l5XWHr1AzeCNWkMflr8LPf
         nHu8+xprRCh+RRJUdmsdXSNeDg7CbOAVlcTHmKssiK7I+dYPKOZ06rZd92WEYY4jYTRX
         4NHCIQGx9YTh6bQUV8Dajqnp/NkCVN+VJDizPvVj3JCPYry9/974GDzWN3jqUwXngWAL
         +MTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496454; x=1781101254;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58tXNk3LREvDeN550oLDB8Z8oduiuPvGtjNz4oAA8zg=;
        b=By0DrazhDrLO+csh6PrySc2Jb6G37+yWweewWVgootK14VUuY21Fi1UVTq7paVib2p
         slCmzrpGusph2SYn/S5Pdjtld7Q1hIHHm4aV6BKllp9rNYl0CmRHnJr2Ej4cAQOzHQny
         fBOiQEJ21bovUl+9Ul5TzHl5dGB9gTosjMEhwVHgDph83kvfM0Fc8JFROm/dSkXnKOF6
         AUKod7T0upVWPVm1u64/iP1WVciudrTagiB60bnJBgdST1X/r+rMlHRj4X/4sZOBE3IL
         vz1I8IImhBqpGdNVdCmop/ydy4e1UCJYZp1gO+MkctvpxBaE+/RlsFCVFZWQMrVlmPNt
         +ulg==
X-Gm-Message-State: AOJu0Yy0Zx1fMmlomf/5pDWXJWxtd/HGg17u8AoFA6Y6IXIZ3Kr8r6CX
	IG8Ph8wKNjcVoKC5692JAPWscMDDSvC1HgfyIE5QV/tOVRKB2WcoelU2
X-Gm-Gg: Acq92OF2mC4y2e+StwdSbaHwxvEqrRlb1dFKJ0Y8dLTmQA0FvEeXSNswv6HT68c8fCv
	4luysLtU/279onkX0JR0ChXPIptb/2mGU1V8nPGeShoB3ZuCJVHyT4J0xIL2qsFAN5lYhBos/Dn
	USxQ1PNI/Z0qRvVUBy+kFQmdrjiGwLCzqaOJM4oCxaDYXv4eZv7HQEq+LowzQkJeqfkcWKQfEgB
	YsnUMqzVEbrsrANiQ4MpWscxYBWkDHrT+jcbZ4oMD+rp6yxnpiQbIetpIYLeJGHjzJlqIUAhLzU
	Pp5M9NK9P6dubOPkKLGWXwc0l/niYMwC4q10kekmbDKgMvQUYI9ehdGYsphYhdhhBCWPgGsZAN3
	E/UdyGunyPYEqChePc+ZvZZ0Lk8eHGUhY8qsj5nTmoC2mgOu4A5wV9xy1pCL8KuB7giKtccWsvt
	MGh9KrE7Qm0vFpq9c10WaPl15Lh1N1j9k8NCIbdCAYNQ==
X-Received: by 2002:a05:600c:c10a:b0:490:b9c3:6c45 with SMTP id 5b1f17b1804b1-490b9c36e39mr31839545e9.18.1780496453582;
        Wed, 03 Jun 2026 07:20:53 -0700 (PDT)
Received: from [172.16.16.15] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b615fac0sm57420215e9.4.2026.06.03.07.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:20:53 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Wed, 03 Jun 2026 16:20:51 +0200
Subject: [PATCH v3] rust-analyzer: update generate_rust_analyzer to pass
 cfg to macros crate
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rust-analyzer-macro-v3-1-9f7fdb4908e5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQqDMBCG4avIrJuSjD+1XfUepYsYJxpQUxIba
 sW7NwoFFy7fD+aZGTw5Qx5uyQyOgvHGDjHSUwKqlUNDzNSxATkWPOcFc28/MjnIbvqSY71UzjJ
 EnZYXXZLWGcTLlyNtPpv6eMZujR+tm7YnQazr3ysPvSCYYFeBWF0zXnOe3ptemu6sbA+rF3BnI
 D82MBqV0nlVk5JCir2xLMsP7B+hI/oAAAA=
X-Change-ID: 20260506-rust-analyzer-macro-22f387f8eff4
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
 Jesung Yang <y.j3ms.n@gmail.com>, David Gow <david@davidgow.net>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496452; l=2077;
 i=maltewechter@gmail.com; s=20260417; h=from:subject:message-id;
 bh=ZSLPqVt61lctJzxaTevXiN/ykp7A7nTIEl3D0342UJE=;
 b=JFrZEIjFXOiTLUi41JfkWba3fTV7metGLKH8V532++u+O4uHyft1tkIvcZnZ++fHQrXAZmZ7q
 I0lQqLkfpXeDTBCX8ESHh1C3JP6N+gt+3f174c/hw0RwJk+Mz2Tjh+r
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=07WplWXZnwyLTMZOHNCIGcpoEutcMXU/JDY6f9VtxSY=

The configuration passed to rust-analyzer for the `macros` create is
different from the configuration used to build the crate. Update
rust-analyzer configuration for the `macros` crate to reflect the
settings used to compile the crate. Without this change, rust-analyzer
does not understand conditional compilation gated by configuration
redicates based on the `CONFIG_*`configuration values in the macros
crate.

Fixes: 36174d16f3ec ("rust: kunit: support KUnit-mapped `assert!` macros in `#[test]`s")
Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
We are currently moving the 'configfs_attrs' macro to a procedual implementation,
with this we wanted to gate the macro on CONFIG_CONFIGFS_FS, since the macros crate is
build with these configurations since 36174d16 ("rust: kunit: support KUnit-mapped `assert!` macros in `#[test]`s").
It compiles but rust-analyzer does not reflect this as adding:
 
    #[cfg(CONFIG_CONFIGFS_FS)]
    mod configfs_attrs;

will _never_ mark configfs_attrs module as included since the cfg's are not passed to
the macros crate.
---
Changes in v3:
- Add fixes tag
- Link to v2: https://lore.kernel.org/r/20260520-rust-analyzer-macro-v2-1-bcf5bdeca1a1@gmail.com

Changes in v2:
- Update commit message
- Link to v1: https://lore.kernel.org/r/20260508-rust-analyzer-macro-v1-1-9122b940d003@gmail.com
---
 scripts/generate_rust_analyzer.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index d5f9a0ca742c..69990a96522e 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -238,6 +238,7 @@ def generate_crates(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
         [std, proc_macro, proc_macro2, quote, syn],
+        cfg=generated_cfg,
     )
 
     build_error = append_crate(

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260506-rust-analyzer-macro-22f387f8eff4

Best regards,
-- 
Malte Wechter <maltewechter@gmail.com>

