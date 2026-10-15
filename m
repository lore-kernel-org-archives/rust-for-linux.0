Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E593033D8;
	Thu, 15 Oct 2026 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071201; cv=none; b=YjI742fD2xagG4JN0GpSHOxf6UoRKM9ouS2+xpPGvG3ocCROdgNocYouFSOj1KY8hEZgpglpPsTjQf8refwvCuHHhqQFijtStJJwG0PBHCe5o3BI7MZqdNv/e/tWg8CHkrdWCAIBxIcJWdFtvBSf3QJJpne1K9Y5vPT9f3fQa5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071201; c=relaxed/simple;
	bh=5BgxENS6U6in+i4rqcWgX7H59IRDjvgj1GlaKeyU1Ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mXVbGFanclX/DJiRc0t3anuVTCCt2zcO5vwxbyyPbzWeM0fdohCOrNLVSqI0BI9b+jj/zdRmHuGvSIff3TTgMkgKYDGHGxhKl9XcTkLC6ks/HzS7+NODiJmwCmYvnP/qeboHj+ArhhZr9KkRbPPjZYxyg0ME4wlH+07KtGEu1JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ZIHsI0h+; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ZIHsI0h+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=XDiPejxR1lgMFrxkIRsl7SfT4Fx5u6WjBTcNmbbgPsA=; b=ZIHsI0h+nJgbkM4vgDRxtJ0BO3
	FrPxFLoxVW/per4eKKTEctzfsAipZL/g2g37C0iNLatQ51JPC4z41NjkQQ5VQ4B2U91tMUuhhot+z
	4UEzayurmYRN9UD8jDRW7Jjxjl8Hx5Ju+EL3VAFFqbBtnV6sjhhqbM1PxE3o8CgZ9yVaWL0eYATpj
	n0KsTRywdM7qlupF8FxYu1Yvcw2rdKD8qjZrMOqwKucwQmI9wZdZTJ//GEQbxpKZZ952DOAucqmJw
	HGdBQinq13okJeJqu0wOCvmV0RozGsQ0rjbhkh0Emfn6mspbRzYt6QYo8A2MEqPDA0qLv67Jrzj/x
	u3/iYdSQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xHLZu-005E8d-2n;
	Thu, 15 Oct 2026 13:33:03 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Oct 2026 06:20:38 -0700
Subject: [PATCH] configfs: zero the write buffer on allocation
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-configfs_kzalloc-v1-1-17c1ba6db062@debian.org>
X-B4-Tracking: v=1; b=H4sIACXT0GoC/yXMUQ6CMAwA0Ks0/WYJAxWyqxhjttJhlWxkVUIk3
 N2on+/nbahchBUdbFh4EZWc0IGtAOnm08hGBnSATd2cbG2PJhwM5RRljHp9vP00ZTLk27bru54
 GClgBzoWjrL/1fPlbX+HO9PxWuO8fWikNsncAAAA=
X-Change-ID: 20261015-b4-configfs_kzalloc-ca337878cdcb
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Gary Guo <gary@garyguo.net>, Priya Bala Govindasamy <pgovind2@uci.edu>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=leitao@debian.org;
 h=from:subject:message-id; bh=5BgxENS6U6in+i4rqcWgX7H59IRDjvgj1GlaKeyU1Ig=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq0NYJFB9C/ov8B9GlBNmNZA/V7i5vD8br0M8yb
 vv3tXQ4P/qJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCatDWCQAKCRA1o5Of/Hh3
 bfCOEACsxjqSz1B2EKFZOZcNOCLMfv7bsba8IRiykXe4kZHP88x753mSODuI9dygTRhdjpchlfF
 Xyhe2nmej4TBJXLtJZZB3xWKZAca2IblWs851eR7/2uf4qt7ABdw91rXx7qSoLdFJBdAJ+FnDL9
 wC6C2z2iX0PviaW+4O4gULKIUDf2vUi1bBUT2MPykC2Gr0A43mjtVBMxMe4ZlbkprNodYacKvnD
 mYz3PVCwwxbhLDvMDiAX+HGZHsLH3uD0ZN9U8aYjRj+yaDrHYbaT2uqzQRg3RMFPzYb0Efxypyl
 uN6mk7tW05UZYlbB2F0IHpDn5qHR9hVLtCmNeytYg3CQCvzkBVPEYiOWFd8oiCtjW4p5wz++vg9
 /j0jtKt1FE3DcUaMF9stKay/EAytAmy5Qe4Hb1JQ69qN+HLi6TfxXYEpwZJc9hmS5EJ2CLMMYkI
 srgfLkDQWBpiLHZ3UrrVbj5KvRFSSee3sZoHVGAwFyjmNvNLoM+S6km7XOWKzKWm2bETsI4vqHF
 2jgIMczVG++cpcU9oHftPnWl1o14BOaXD7RvGqTkQmq57EL2I68kpcr3ov4CabFgPuuybjfapkw
 1bXqwr/GIgxzISQ8P77StZM1HdLp9HSFXw7mnY5CFUTo4QrNXRrvgn+Zxkkg+2XuY58OzUqdNmt
 QtWY+PYE3AQBiWQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

fill_write_buffer() allocates the per-open buffer page with kmalloc()
and initializes only the bytes copied from userspace plus the
terminating NUL. fill_read_buffer() reuses that page if it is already
allocated.

After a write, a read on the same file descriptor therefore passes
->show() a page that still holds stale heap data. A ->show() that
returns only what it wrote never notices, but one that returns a length
covering bytes it did not write leaks that data to userspace.

The Rust bindings are exposed more directly: ->show() receives the page
as an &mut [u8; PAGE_SIZE], so a driver can read the uninitialized
bytes.

fill_read_buffer() already allocates the same page with kzalloc(). Do
the same here, so the page is initialized whichever path allocates it.
The cost is zeroing one page the first time a file is written.

Link: https://lore.kernel.org/r/cover.1790981219.git.pgovind2@uci.edu
Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 fs/configfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/configfs/file.c b/fs/configfs/file.c
index 6460b000c593..a4b58616352c 100644
--- a/fs/configfs/file.c
+++ b/fs/configfs/file.c
@@ -184,7 +184,7 @@ static int fill_write_buffer(struct configfs_buffer *buffer,
 	int copied;
 
 	if (!buffer->page)
-		buffer->page = kmalloc(PAGE_SIZE, GFP_KERNEL);
+		buffer->page = kzalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!buffer->page)
 		return -ENOMEM;
 

---
base-commit: 21671ce5ad38e0543331604bd96144d4d0d3b421
change-id: 20261015-b4-configfs_kzalloc-ca337878cdcb

Best regards,
--  
Breno Leitao <leitao@debian.org>

