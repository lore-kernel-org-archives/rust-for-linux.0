Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0907336EC0;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309812; cv=none; b=hD/0iAL4njxWOJxlUBDeKf9AT/OSYl2Sj86b4CIHtzksDJc1ojApck87A5w7o+J53qZZFkPUrUdZuuEvXJEbVAXrbLx2gUVayvIg7jBRBlZUrUN3CH73Mar9nQ1psQLYOysDTdf68LPFu9ObGb8fXYAGfxgZ0Sn/luOPYK23G3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309812; c=relaxed/simple;
	bh=l2dzoBjQe6RzrONBJzpxV3PoxTBCSEMgrbS+QMaT4u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ovvfvABRun0hwJXsJqmzOkIP9EwqZHX1LSr7gnSsR9AV65EmMyG+gvPRPXD0sxNzyhCjDD02xadn0F2N8RvorDKbqJlIQHrFg8tvk6nL/HwRS6dw2mflD3yjI3CjRvf6r3Cjs8QM5L6DGpnQeMPkQIWHjzry8JJp8/4MZGUpMF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZ1xLlar; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZ1xLlar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E65DC2BCB2;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778309812;
	bh=l2dzoBjQe6RzrONBJzpxV3PoxTBCSEMgrbS+QMaT4u8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LZ1xLlarnhqwNLzMMaDDfEXfTfQUtHeBRofNH/L/3RQ73dJTNHH7XttDFcGHiVJg8
	 99V+fav3gc0F93wkk8WUbBS2hj2NhCjRrxfyipwid95vOCI9uAWWry8v/ziefzsqZE
	 Z1BPh2ze3NWe4EyxGhwR7Vlg5Fg1o3lncOheUhJTqscV07sGWh+clnkGwrRmwDfUCk
	 Hfs/y20/Dzhn9UzPecrbKDH+LDSsfLgvd7ptotrtXzmeef/T+KJ8geWq0OQusk+f61
	 ty3KyHLv7v+8z5rHeFRXSH2vppCDRYe8Z0dH6H/BLgtlFw4gqIlsdeEMtQYZJ71tJb
	 I2swWeUFnit2Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wLbcI-00000000GIb-29yo;
	Sat, 09 May 2026 08:56:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 01/13] docs: maintainers_include: keep hidden TOC sorted
Date: Sat,  9 May 2026 08:56:34 +0200
Message-ID: <2742993764f2193101536a1cea40e034d75e0539.1778309595.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778309595.git.mchehab+huawei@kernel.org>
References: <cover.1778309595.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There's no practical difference on keeping it sorted, but
it helps a lot when checking for differences after patches
to the tool.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <e6b302f2826e6a5c0124bb33cc517e8b5888252b.1777987027.git.mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 436e7ac42ffc..694cdbdc4caf 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -265,7 +265,7 @@ class MaintainersProfile(Include):
         output += "\n.. toctree::\n"
         output += "   :hidden:\n\n"
 
-        for fname in maint_parser.profile_toc:
+        for fname in sorted(maint_parser.profile_toc):
             output += f"   {fname}\n"
 
         output += "\n"
-- 
2.54.0

