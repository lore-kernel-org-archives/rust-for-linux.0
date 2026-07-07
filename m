Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753B93E5A33
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420153; cv=none; b=KLbBplGzJevD+KG7tjlSBUrGb2zJBuNHPSneC/aUiUDE8W9pJZxzymrag71cGs0yc62Ni9Sf7wJP6Sj8AYKc9rvf5kvigswFF+0PcB1vPe8ygIMwydvR9qTBmcsEeiaoef6Qgf8oXvc+JGHwNBRcQYuV/wdLlTEvMocR75bhRf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420153; c=relaxed/simple;
	bh=77gd8sLHGGYa1ItWZpHHokxQqYqSXgxIx09LyazXhuk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aW+SxnUW9SYfG3I2YrDjifcAOyMPSyOH4OdSfieK9Sq+/Eh1s2CnuIlt+wQTPevWfIGISHqhi1uJSeFdFgPJzcWfmlOXRFbX/JkRO1iYcrf+L+CygaVBqMxFGwp7+A3ApYh8zEolEGIGZ18adyYMANuEiH9UnHy9CbYj3OGpkiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ph79rzoy; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ph79rzoy"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-c1265eb65e9so316620466b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 03:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783420147; x=1784024947; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89UGdWX7IUAuzyAdMyxsQmn1RQ4gFTcXBZANZ6d5o34=;
        b=ph79rzoyk/F8MvVyHV/PvyXMy7Y4jS6a8ZOrm5ExWVbuABOLSP4Dsiey3QHtZjTfBq
         hCX0ETgMrQSWXe51sU7II+rGi3ROWlSj1d/S3f2cIyy620tgP6kdTSS+R7VNUapDxt4D
         pwzpCfqgGNPPlRbJOaoy+eNsFAlecldtbHw18cJlXF2KljNVZv4EatvYb83DhJITLeA2
         9n4sK6WMncWPJa0oUugOy822UlSotCJWr7MqdppKcvuSjIClsccDUBzKa3cvLjAcgtUF
         azSeYt+Z/80+2YvvI9ZcVUs9/blH+tRCa5v0n380/l9qmCngPShcnG9L8LHU/FHzJyk8
         5Osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420147; x=1784024947;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89UGdWX7IUAuzyAdMyxsQmn1RQ4gFTcXBZANZ6d5o34=;
        b=Jqq8nckkIREPU9gr04q8K8ayiZPxUkahZ2ZUFkw8f/SDUq+ohEZmwKRnEwAdrl3exx
         BPtHMyH1VHikmzcKHcs+iecvw8rWdB6QY0GUpEwtFFM2W7brYVGrcYNGDw79rlHjRVm9
         pzEVsTST/oKtx9Nlo7ffFx5Ku80Yjwdzj0RtwQaCqgOEi8vbvJrqeJAcCEtATy/fr6Tr
         AMsOXE9y6s29iGYsU4VVG/agUNb3bRue/lDXcOqEd16XzjcYsWl6BBpOwo2Z0JX/74pu
         4mADfhcH+xb6X573lZH02D2iSs2TCv506fHhbmTou0f6o0K+8jBA3wP6PkqwMjHuZ5q+
         bQrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrp+fvqdaYQSyoBjjZyf3S2TowjannVx0H9bdG4Z83rlVvZQ/pFNEtcHzlt68juKzBIOSW6CcqgETJTDAFcSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjsT5gF7AYvs8/MLRyQer7KxvT4ZEQ4ftHAjRsxAeFwnMdEVc0
	FBa8iJ2dXshMsv7xct7/gDhiG1eGH4Hp197o5vX8grGIbs2fZvldO+6TPY/Djf6i8lfJw2iFhbM
	3MP7dd3pwEFbqSzKXYg==
X-Received: from ejdf19.prod.google.com ([2002:a17:906:853:b0:c12:764e:8e83])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3d44:b0:c12:8664:6adc with SMTP id a640c23a62f3a-c15a66b2951mr242076766b.13.1783420146690;
 Tue, 07 Jul 2026 03:29:06 -0700 (PDT)
Date: Tue, 07 Jul 2026 10:28:54 +0000
In-Reply-To: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=77gd8sLHGGYa1ItWZpHHokxQqYqSXgxIx09LyazXhuk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqTNTq3S3UVU3banYFJxyKrB6Wo6WybF4NAee/t
 U5Ez7nOt5WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCakzU6gAKCRAEWL7uWMY5
 RifbEACAot4U0hOB+vr/MgbKeE4QpyFChdPRWamm+JxCpgIrzHs18U/lPz6AzX6x1KN1zDzPF/x
 Or+zluduxMXjqH225NrqcVZgISQ1tHKmkZ1VRct/zIEqa2GfxcHfx2XFKm+Gy8qo1mZPS1mitwl
 5PzTG6SC8/klEsODD9aJB1Hn/thkjIeuNwoV0rDp6ARXqrQiC8up6dSJR3pA9mZkLoWQCh129XA
 uEG/qrO7sIeRObIibw4F2uxmXUx5H6ax0yc8/5NzJr02wJDnC9sWTb5EUDmrbOPfGIiQEeIPJ0n
 pWLtB7haH2kowHCnhJXutYHa24ILqBB4QSYU0bs83YzyHXl5lbhLck8azia+kcWlKU2LYBdtesL
 iDQ4zEY5713k0dlrRsQwwUAv95ggLI1PGM/hQCDN1twzIB6Mr12QPJYx322mtxnDPPsBPpc3Dvc
 LzEwTzW94rJgq3U7NZ6HRtLzcZ5UvhkWsaPCy70oJ5Ak+Y3TWyOj2yJhESPhIeUDQ2GF+WWTaoF
 vZ/ZeE6xIzEijkujDWPe0O8d6av2xArnmaybA3LgY5xkows7PbNrLnJt/9okHZezS0loskGCLG0
 vDFQrzUCzDdEpHRBY8aqv+l2yIcyyepKw6bJVNn5g5jdHw1vo7QOlKEP1AgUkQSKSbylyWAMSyZ pVy9sitiaPLtVdQ==
X-Mailer: b4 0.14.3
Message-ID: <20260707-binder-noderefs-spin-v4-4-7c3c8bc16339@google.com>
Subject: [PATCH v4 4/6] rust_binder: keep NodeDeath in NodeRefInfo during
 process cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

By keeping the NodeDeath inside the NodeRefInfo structure during process
cleanup, we avoid running its destructor under the node_refs lock. It is
still dropped shortly thereafter when the entire rbtree holding the
NodeRefInfo objects is dropped, but that occurs outside of the lock.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 505e0bc52748..410218505417 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1389,13 +1389,11 @@ fn deferred_release(self: Arc<Self>) {
             // SAFETY: We are removing the `NodeRefInfo` from the right node.
             unsafe { info.node_ref2().node.remove_node_info(info) };
 
-            // Remove all death notifications from the nodes (that belong to a different process).
-            let death = if let Some(existing) = info.death().take() {
-                existing
-            } else {
-                continue;
-            };
-            death.set_cleared(false);
+            // Clear death notifications from the nodes (that belong to a different process).
+            // No need to remove them from `info` as we clear info below.
+            if let Some(death) = info.death().as_ref() {
+                death.set_cleared(false);
+            }
         }
 
         // Clean up freeze listeners.

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

