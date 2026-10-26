Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013388;
	b=OVDVGXY2piayVw5+hDRtpZ4rTs+A+aspBtWJt2MQbuagXDZg2e/Ut2CM6hJF0tmXk51Y
	 txBMLZhOIKSXpUDNBwAmJTPaAK5ikyztr0aLi4fJELiaNS28hfn+i+r/dCsCWgL1I0AAP
	 N75Tx5ODhp5JKJknZ4oQuoadPkfRcSnfojmuqenYkupfVSD3257R6WZFvMr6EKtbboTfh
	 RNxPf/KkL83aOO0ckd0oVkGQKH4UQhwTjcsVu86a5gxRhHshi88v5CJUw490qIkLofjPK
	 Ro+/xVO1uUd15u/gzZsXdK2h36fHwAyfyf63ODBX1lg9B7jXH8zeP2S/dhPonD6OS4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013388;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wMWk2QBzc/k11mU8+J7Vc+JEj/manwM7jfMzKktKbQ4=;
	b=jc0NOzjLhGCrn0GJbo5sGA2YiHw0uEQoC0HUO2SSyNH3KtZcPk0gJ4MRVom0LBQN2cib
	 zpVWX8ZDP40U4UaIw5cWFT5ZrP7usAD62InNexTubVPYtc4GdF+DuGmXRRonYaiUUA8yj
	 1yZu+xuiphk3bX2gzSVAHVwQotIpEuVcbgSu0Dm7xqtKAQLsUEIyKM8KkSWTy2KbVpPYI
	 4XUPHmjBc/CKD4BnUAwoSR7UhHeNg8a8857Z/J4wlPM4u0lAwqtBFux+i4+aRk2/0NeW3
	 pQoopIUaSIam9VtXWaH4BeasL6o05kOwBBQh/xnzxy+lh/QC4jf1ZKHYdJ3GkmU8TjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=gl7BUZ7Y;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SIh40PWD;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC38606A934
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 11:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC38606A934
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=gl7BUZ7Y;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SIh40PWD
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id F3E2AEC03D5
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 07:14:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 26 Oct 2026 07:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793013268;
	 x=1793099668; bh=wMWk2QBzc/k11mU8+J7Vc+JEj/manwM7jfMzKktKbQ4=; b=
	gl7BUZ7YPVhNB5rq+prprPpBsDenOoqh4kiFqlAMGFsIM7F7TnXppoyZI9kKJ03j
	7rxyKBSEdx28Gz95I7apnEQnjqXhvUij0Htx8lIpZq4LvH9gBAC+s0Ms6gLVBxBl
	+cEenbHG0jMhl86zEnVRusTrzsgGgN9R4ycg9snF8kL/YxZFgzxGbbKN20kx+xF4
	jADG+dyqQrRfIihi3ON5gH50Z741vfJtqkfRXGOKq4X7ZurQ8Yt6Xip5MBOuhIsM
	fQJqafMXjhjriOUfvT9KFsWm7Zj4XcurZXkoLGllNC3Ey7RI7gl632M39+uHjkN0
	SpyPcBFVBvaa1BfCRfYLQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793013268; x=
	1793099668; bh=wMWk2QBzc/k11mU8+J7Vc+JEj/manwM7jfMzKktKbQ4=; b=S
	Ih40PWDTSCSWv6Ewhhc+NrXfe+/njL7SxOSIUoT5ZOx8Z6dYRc0xFvPy1Yd9oTBt
	tElYD1hUvZo9u4ARh5Bna/8kUD/4qW3p3/DNfKtc+XaU0PbOt20HneJ2ia8mS5rY
	IN2ReEUu1srxhHRC1e6Q7SBkWXcZGn4bRpequOaHNoVAA9XnIIX0R2Da2eVsjmnL
	PEJcFIk4hJPMV8AnLscAWBmEhar1iGr/iQaFaO5Wky3/fkwYMtXDN3mlYhcs6sFy
	hNhsXE7+907Zvczz7qSfs8U3gpkyEieV0vtK/EIEBSQhgivqWVOK/E399VnCbUBW
	WJR7pXDvqFSFRP6Fb9k1g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793013268; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:ivwnFtR9AEcTN8S3wUI4nvQwBWmYUVfdL3UdEgyLFK033Xu
	qp4ILTQknyYy3YjFNXLqeizXffHkGWqvs2dWltGlGjWIPsZDrhIzH4CNa9EY4DBI
	oEk3vL54g1HkxnfRl+qNOaMPznj75PKpmQ9YI/0T75+3mU2lP+yQYgalCFWQbkOv
	4tCsmuQq2BdcziUUr86Xr5BN8Z6/WWU+YK4rN5PfxIZKblHa130TekcwwwSCWRo/
	9RPZ4nubzppYxyoqLYtKtkEqtHB0UdpresgsY2wsFlfCyHkjFpYzeFAimw95KL12
	VpwWxpenwlm26fQp1APKYVTODObOEglMS1ggjWA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:jhkHhppJqQtpvIORZ0m7bw5Zchtarf+6FInu/L/t1u4=:MlSvXvPWcJt+BaFTASaZQoR1XXvhfb0wshpk6x749as=;
X-ME-Sender: <xms:FDbfar-ZsKnRPw_c9VSs8r2L7yrftKZkrbzWvDQX0H01AnkjmYV-Bw>
    <xme:FDbfarpXkRaWIPQs9P9xbqTIhL865cG8C0851RHgzOnX6TFhL3ptUUFxEurUnrT3i
    JC1yA-CvBjS4y69am1t7PGApaRLv_2aixyHvughO5c4aqRj0VPHny8>
X-ME-Received: <xmr:FDbfahi26KTtqsKyoSTezOxnvwQsrQOK5pErbSfOV4z8rSfYB5GQuZ6qD_OFPYLA9pyCrglXA3wlhXKJGC3MVYyWrfPAL6_dwt0>
X-ME-Proxy-Cause: dmFkZTEJEe4lYJFZf35sqXvTkf/+FJZOVL5vXl5n8ZkihoXFI0gO4o4MNvWHnv9OUtdI0k
    qKYYtghlgaPjzVLzakzYFMYlDoscvLZaDmH9JgnVB6TEajVdPQBP0iPSjovFVToShdfnos
    iJnVSxPDvCOuXl0afcTiVCdPwUzFvTPs3hT8qjZioPFfrV4Bh64zX13y85ih6zKswmpdg5
    PlyULiSwNtP11my2lmQ/1bbf01CxjDrro/uhf2m2QTjp1ou/m3DRj5UJg6RDgO0gDNEo0H
    fUYT/WoU96E/gGZwZ62GDjD/jxuD5zWv08TEK7s1Yu62eUghpHJQh37M2hFyYSC6ijk+WK
    lZXPmrtF11UT6M2zBcv7gopzN2Jjw1qvCs3pPtjNGVPcgqNnIYfeVC9N7DeeAKxVjWzn51
    LXtWgtWoxkKGUzDcoAt+xWE0xF+B8tOx3YIR5hVgLt0SrMBX1jKxVnDf7yUx+bVWUeKpja
    WQXguDFJ8Ikhr2o1Yf7cFCp0vU8aEdAyASVXjyripGlDwKM53sQL23gbpl+NQWbekDBW9M
    /iL6e2Qwl5hx+zS0MMYH0R1NDGeashJjpZhw1jXMiLejM/k0HF3ksZbwLCPjLeAA+tnuz4
    uzArSZ3ImQdYHs/8VaGWWlOtjkpJmv/cGIPrargDa9BcOpBno6EfnM0niVxA
X-ME-Proxy: <xmx:FDbfahApq2oWKRPtuZBTEYZOVlFLx5J0vNONg-Qld5fB83XSFFrLlg>
    <xmx:FDbfansuTbszqlrYxQFC_JiYH1F4Go1U-Igjs3GvsYpAT43MXXp2yg>
    <xmx:FDbfaj5eTJohKiY_Ezaaaw9avA2QCGb7umaWm3z5QYVMs6bZuanAJA>
    <xmx:FDbfapf6SEQOCifjiG1AOTKGZ5LNzPY_ljUSVzbSQnkGGaRevNO28g>
    <xmx:FDbfajKmlwGbbT7tKCb4iSQkDi-WqvS6yGSzOYG8r2nFjLyAE10Et4YX>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Oct 2026 07:14:27 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 26 Oct 2026 12:14:10 +0100
Subject: [PATCH 3/3] rust: drm: gem: shmem: Do not free SG table of
 imported objects
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rust-drm-gem-shmem-imported-sgt-v1-3-36f15ace04b1@jannau.net>
References: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
In-Reply-To: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Janne Grunau <j@jananu.net>, Sami Tolvanen <samitolvanen@google.com>, 
 Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, stable+noautosel@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=MlSvXvPWcJt+BaFTASaZQoR1XXvhfb0wshpk6x749as=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqz7ZlyiDtycLs3yq1w2/WWVvK61VvMJY5nt0poj+WXec
 jWS9792lLIwiHExyIopsiRpv+xgWF2jGFP7IAxmDisTyBAGLk4BmEhBAyPDj7dPJvrqTV/BHTr5
 lG1olJatfHKz4K4VXcYfVd3sHhubMzLsvSi6wyb3l+RFqUlBV3MdOn691vvwrm45462/6czNbSf
 ZAQ==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

GEM shmem objects imported through gem_prime_import_sg_table wrapping
drm_gem_shmem_prime_import_sg_table() do not own their SG table.
SGTableMap::drop() must not free it since it will be freed on exporter
side once the DMAbuf is not used anymore.

Fixes: 616c229ab010 ("rust: drm: gem: Introduce shmem::Object::sg_table()")
Cc: <stable+noautosel@kernel.org> # no in-tree users
Signed-off-by: Janne Grunau <j@jannau.net>
---
 rust/kernel/drm/gem/shmem.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 1df3554893cc..d0f89ad2202f 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -596,9 +596,13 @@ impl<T: DriverObject> Drop for SGTableMap<T> {
     fn drop(&mut self) {
         // SAFETY: `obj` is always valid via our type invariants
         let obj = unsafe { self.obj.as_ref() };
+        if obj.is_imported() {
+            return;
+        }
         let _lock = DmaResvGuard::new(obj);
 
         // SAFETY: We acquired the lock needed for calling this function above
+        // and the GEM object is not imported.
         unsafe { bindings::__drm_gem_shmem_free_sgt_locked(obj.as_raw_shmem()) };
     }
 }

-- 
2.56.0

