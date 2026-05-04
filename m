Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D123E2751;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909889; cv=none; b=gHhIE0EnQN/ToFAzNKHYeIvYfp5tRrSnw8kQH86E0txo3OW3bUCfbSh0NaiS5lzR9xS65rlMtUa4fVXpTkrXa/8MZNBqjlcZsjN73MkMRb5Oxk9P/3EMJgkXjeV7waNWHB+y2av0mRbJ+i8n/PBgFB1m1rCsLx86mTzJif7QOA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909889; c=relaxed/simple;
	bh=OEd0+YSd1pN5VoGvQ/n7JNcZR0hP8+/xnr6xw2USiE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dD2d6P/9h5jEy/ce2jyrAYuYv0/xU+teiQ5U0eWXk2LiyTzrNYHriaWyVA7o7lMhXi3PNPPW7LHDGUcEUvbapEiO8Xt++4Us2ou8g/PLU2CZWB/hY1ZZkSWmT8Ow1RbKRf9177Mc/Uncwr8nuCiqXXtdOAqiZEwvn1+RBoXDvUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sg57eCot; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sg57eCot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D5DC4AF09;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777909889;
	bh=OEd0+YSd1pN5VoGvQ/n7JNcZR0hP8+/xnr6xw2USiE8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sg57eCot01ZLChJqbjVpoUAx92w/zRFOxNOcirL1v6iav2txuPjuEcpV16h3gOUkz
	 FjqlxhcpiB5IrZeoAELx1n/Zv8+b2ZRAV456ezJwH+V1Ylp9xMGY7zlJNF4vCLHkkn
	 6aOrnkSlj5/NAg2FTTSU9n4OPjrClFp839lIsh6Ji2ezYGqnxRQczop9Gy+mWy4bfc
	 VEKOFdigFTDuVRyVh4MliXtC127PpzM1ef/mC9BUhz+fhoN3GpdC4/xquSz4Fy7wqd
	 z+B/bH+ku5FcHZq2WoOMRJmb72cUSO3kessWuBqfmhmbiprpbNQhp9bAerf5zK+j7B
	 gh0prL4yMCPlA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wJvZv-0000000EyE7-3JAH;
	Mon, 04 May 2026 17:51:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH 8/9] docs: maintainers_include: don't ignore invalid profile entries
Date: Mon,  4 May 2026 17:51:17 +0200
Message-ID: <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777908711.git.mchehab+huawei@kernel.org>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Currently, there is a "P" entry for Rust pin-point that is
neither a valid ReST file nor an hyperlink. While the real
fix there would be to ensure that the documentation can be
properly seen at documentation, add a logic to handle it as
a file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 50359b125db0..bbdadf2aa4f3 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -197,6 +197,8 @@ class MaintainersParser:
                 if match:
                     entry = match.group(1).strip()
                     self.profile_entries[self.subsystem_name] = entry
+                else:
+                    self.profile_entries[self.subsystem_name] = f"``{details}``"
 
         details = self.linkify(details)
 
@@ -276,6 +278,8 @@ class MaintainersProfile(Include):
 
             if entry.startswith("http"):
                 output += f"- `{profile} <{entry}>`_\n"
+            elif entry.startswith("`"):
+                output += f"- {profile}: {entry}\n"
             else:
                 output += f"- :doc:`{profile} <{entry}>`\n"
 
-- 
2.54.0

