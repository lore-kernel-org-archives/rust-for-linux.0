Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E63F217F27;
	Thu, 15 Jan 2026 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768495562; cv=none; b=B/ke1/TJvoskhTzYi+BcdBVa7ESAnb/ggktwUNi8bSKUCMhhpYJEkd6Z1tyPu65iX8QohxMelCs+4dag2drWfo1UDEpZ8rHMN4LuySl2g6ZFBDNd9tT/BycXZPZpdV2DYiI7NJNKd/+SoZa+jJH/JEKe6RFG8MyhiQifIuKNGNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768495562; c=relaxed/simple;
	bh=J19yPgUjCXU9NVCjziekrgAZctyenwC5JuKcLil/HrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d9UZcxDRFcdeisYE+IA/rk5O/GEoE19/hnzbhwQXkbNYxWnbdQXen8LyhwkEfE765ImhCx7+APf6dsog1OY77DUTZzugjMrnsZHcUzaDN5lFSNLvjOpz0kVfkUuX7tRSAN9ZlwQ0wcVoWyuEE0C6HxsRoDezvZMgk5Lqnxf1Yb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rK2EumeM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rK2EumeM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF45C116D0;
	Thu, 15 Jan 2026 16:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768495561;
	bh=J19yPgUjCXU9NVCjziekrgAZctyenwC5JuKcLil/HrA=;
	h=From:Date:Subject:To:Cc:From;
	b=rK2EumeMzdFgJV9CnueO2OIiJZjlgkTqpSpiNGo/0W4CLsH708G5hSh8AJKFRJt+H
	 GjQf6Doww+GCw6W6btE83UjO4AQdApRTeA7LhIAmb4ppgiqKcgyPNJfcqbp7of2OJD
	 gQJt447TqBJM7Bi0qtnsuMo51BYnqi7WolZpCsfHe83nj8EAqRKzNWD4BhYewziJe7
	 cv7A97ojkzrWRZnZGx6qwviUSDMZ6nwhiCQkkxgnb+3kP8xqFvY9q2nv0HHE59leo6
	 VMW8GDc2C8rCIZrAkGh/gjqMlaq48B4+L7fqJxjKKkcFryoGPOj/rmtTd/q1tcncqs
	 Tb5XOfijPYdUg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 15 Jan 2026 11:45:59 -0500
Subject: [PATCH] scripts: generate_rust_analyzer: compile quote with
 correct edition
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-rust-analyzer-quote-edition-v1-1-d492f880dde4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTuQFKrUq4iLtP2jI5LqTCJq6
 d2NuvwW7y1kUIHRvllI8RCTOVX4TUPjOaQTWKZqal27dd53rMUyhxSurzeU72XOYEySa8dDdA5
 956Lf9VQPN0WU5+9+OP5tZbhgzN8lresHcJ6tIn8AAAA=
X-Change-ID: 20260115-rust-analyzer-quote-edition-bf00e950f179
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1768495560; l=993;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=TVDdLDo/VdR3wif6tAhLZFqjmm9w7Pz1oD80pAKmeqA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKzDeh5Hx2sOPf93SIC8gzkhLsb1ImJttjc5oEosPsrBg5/HIC+LEQWaUnQ6/19tDMZn4fRjZvI
 dSeLpyEsV+gU=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

Our copy of the quote crate uses edition 2018, thus generate the correct
rust-analyzer configuration for it.

Fixes: 88de91cc1ce7 ("rust: quote: enable support in kbuild")
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 6061bd6e2ebd..c6a1f1660c0d 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -98,6 +98,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         srctree / "rust" / "quote" / "lib.rs",
         ["alloc", "proc_macro", "proc_macro2"],
         cfg=crates_cfgs["quote"],
+        edition="2018",
     )
 
     append_crate(

---
base-commit: 74e15ac34b098934895fd27655d098971d2b43d9
change-id: 20260115-rust-analyzer-quote-edition-bf00e950f179

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

