Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E59D47DD55;
	Tue,  5 May 2026 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987566; cv=none; b=rU8CKhpHUE5UbyUzJck2Yfe+TERJz9KGyGBR9UuP6ep+QVSDs0wa52jShsznBhsLfn9vF7b4x2OACg/bpCXVrmgYQ5gXaqLco3UbuscVTxwGdnv7xBh6fZtKPH9F5vnuyGBLDyxwqmovU5gzZJTpLDRHb7XszzTkg+bEwMb/p9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987566; c=relaxed/simple;
	bh=wC46UUzd9fgig10J2h6Bx3Jb7hV0ovBK6e+2aW5W3SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oIlYar5R+lCQ0S6ixctm2qbge4/35S56U/r2OJDEG7AFecEeOweYjdhllLwhJg9OVEIZaR0J/gBXXZ+j0U0BYMYVl20brwALVMStXVwgsBXKVrqKPqSMTg5ZMYFryJyH+ZbtxWnT3upXJRSp44LI7jey1DgcGtmfGHw64MQOB+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jn2gwJJE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jn2gwJJE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABA4C2BCB9;
	Tue,  5 May 2026 13:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987565;
	bh=wC46UUzd9fgig10J2h6Bx3Jb7hV0ovBK6e+2aW5W3SE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jn2gwJJENEaPu9naGwW3cXcwRWbYuNW12dPocDApGbRfUaFoWptD7IjUGmsTxH8qg
	 +QzZBBWirz40IcpTPW254/zQgNc4Q4DUgxrib77Fc9ADSt5VgacCmKSHVByWofSOy2
	 IC3H5PosBTmjIFrWSTYA4W9l8fMur2L1JpuDrAqTGNsuBgeTF+WGtsP+iN/Q1UdvhQ
	 agMIjwr/XUDp9P0EU3c+Nw9rP5l3HStLu03QW3jRFgkJpOQqaSG8rCw0+oRsHs8z5Y
	 Sop7CyoSSUQ0co0IGtjsqqoPWEsnRKP2RnIkN33UO8E2PXf5uGjFUk/X4kE9GSzEEP
	 DWoGv5WsZ6oDw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFmm-00000004in3-0b47;
	Tue, 05 May 2026 15:26:04 +0200
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
Subject: [PATCH v2 09/11] docs: maintainers_include: don't ignore invalid profile entries
Date: Tue,  5 May 2026 15:25:56 +0200
Message-ID: <63228e005fcf3dc4583cee06905341e8bce84181.1777987027.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777987027.git.mchehab+huawei@kernel.org>
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Currently, there is a "P" entry for Rust pin-init that is
neither a valid ReST file inside Documentation nor an URL.

A proper fix is to either convert/move the file or point to
a URL. Yet, the parser should be able to pick what's there and
show on its output.

Add a logic to display such files at maintainers-handbook.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 572c382db2c2..74082bf5d4a4 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -240,6 +240,8 @@ class MaintainersParser:
                 if match:
                     entry = match.group(1).strip()
                     self.profile_entries[self.subsystem_name] = entry
+                else:
+                    self.profile_entries[self.subsystem_name] = f"``{details}``"
 
         details = self.linkify(details)
 
@@ -332,6 +334,8 @@ class MaintainersProfile(Include):
 
             if entry.startswith("http"):
                 output += f"- `{profile} <{entry}>`_\n"
+            elif entry.startswith("`"):
+                output += f"- {profile}: {entry}\n"
             else:
                 output += f"- :doc:`{profile} <{entry}>`\n"
 
-- 
2.54.0

