Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77A53128B2;
	Thu,  7 May 2026 23:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196799; cv=pass; b=KXR1g6t0HZ45wSfabMhiZMFmTAoZC3dBYH2+Ru2gmVIqTAXCXwCWx/Le8/B8nHyCIDb7HxrsoRjEEoOhvm8wm95DVOjC7ZGt9ng1MaY88ytV/esfCNL2LnUqwd6ggZdcFR+t90oByFE7RwXmogo7jbyFwjqQkZHCE3cLhVpVpEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196799; c=relaxed/simple;
	bh=VM+IQ7Rou3qRlGMYo50nl9JASON5yKjR8Jf2rjqkHMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oV33OzMn7Cj8u0Z+f0E0jfzS7/Wb2yEhv02x+0rCbj4CfLfUt7/hLnQ2gCRXt5t8x1YYgvTVHeb/iND4BZVrkbQ6W2IJUBBU+ZaZ7d/ZUklEvzDDi5OyAGYxsBlyu/FTIWbOvSOMYDwUUstfAx1j6a2+vmC3wN0kIMHu/xF4fos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=Mo9N+WCi; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Mo9N+WCi"
ARC-Seal: i=1; a=rsa-sha256; t=1778196765; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WvVL8phvZR0VPyplkOLu1nEXMtdUkgnEhpQPjC5spVZn/6nDERtv48C1rvhvyqlRd3+EzGt0KSbrWQpXxuso/SWzRAlFPpgkY/ZiNNnbbg//TJjSeBi6NLvaV7aYmMy+nqqrEqYmztEsQODGeVoxRm5MG9RydjCTh5hd5YMirAY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778196765; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0UlbuoJOpWJO9LmwFxWlvdYkZE8HSkEeJJElxb5VGTI=; 
	b=UV9nwN9GM94DEbqxsbxCaCZl74HAqDElQ+ehxtLRy7KEo4oqhKndGVsPQVfBL6PBSeMJZP/+VaPBSoO69mSSuMeX3b4TM7RJ8TOKkMj4IYmQY3jq1S5q2SI0jYi78FMQEmikDmAoX+rYzSYSKavlZJKjtgFkuVnMo84sQofUOsc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778196765;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=0UlbuoJOpWJO9LmwFxWlvdYkZE8HSkEeJJElxb5VGTI=;
	b=Mo9N+WCiIoOjoBPFky7Izz246sxFrA8lQrxNvNENPIUNntltUV4IgZD9mkbI+CWH
	nvNQE3y+KEB37MV9CARgm1O5ro/WquMFlIfpJ0xrW2AwsCbvd2DkljM/vf/tLpDxYXG
	HkLqN8KTmmsgYGOvZnGV441xRbgVpJfHaNgO7N+U=
Received: by mx.zohomail.com with SMTPS id 1778196764054628.3617629136472;
	Thu, 7 May 2026 16:32:44 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Thu, 07 May 2026 16:32:39 -0700
Subject: [PATCH 1/7] mm: rust: add pgprot_noncached helper
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-tyr-mmap-v1-1-eec048a23c25@collabora.com>
References: <20260507-tyr-mmap-v1-0-eec048a23c25@collabora.com>
In-Reply-To: <20260507-tyr-mmap-v1-0-eec048a23c25@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com, 
 acourbot@nvidia.com, work@onurozkan.dev, alvin.sun@linux.dev, 
 Laura Nao <laura.nao@collabora.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=+mpm0JxqkEncuLxmzYLQSpzrEq2zrX8fexEElroeW4A=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJl/FSW9vF/HnN1WZlhpk7f97HIBMxevOFbuL0JvXTe1H
 Dkbef94RykLgxgXg6yYIstZe6Me8ar3Rrrz/zfDzGFlAhnCwMUpABP55MLwz85R6pV83PpVbp0W
 T5vurtpksyJEVq6Be/EjTctmm9llQYwM6z1lFy3JOfMiPa/6VfSZLyc6pI32fr664IHvvpkOu2W
 r2AA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

From: Daniel Almeida <daniel.almeida@collabora.com>

Expose pgprot_noncached() to Rust code through a small helper wrapper.

Rust drivers that insert raw PFN mappings into userspace MMIO VMAs need
to derive an appropriate non-cached pgprot before calling helpers such
as vmf_insert_pfn_prot(). pgprot_noncached() is currently inaccessible
from Rust because it is provided through C helpers/macros rather than a
normal exported symbol.

Add a Rust helper wrapper so Rust MMIO mmap paths can construct
non-cached page protections for device mappings.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 rust/helpers/mm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
index b5540997bd20..22194d3196d2 100644
--- a/rust/helpers/mm.c
+++ b/rust/helpers/mm.c
@@ -48,3 +48,8 @@ __rust_helper void rust_helper_vma_end_read(struct vm_area_struct *vma)
 {
 	vma_end_read(vma);
 }
+
+__rust_helper pgprot_t rust_helper_pgprot_noncached(pgprot_t prot)
+{
+	return pgprot_noncached(prot);
+}

-- 
2.53.0

