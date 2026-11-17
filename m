Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943962;
	b=M/ovv0PEbssUBBXgimhZDyJ9zBeJB/O5ZZ1fMp7R+RNmaOwdQQzva6bzxfDKD8eW8lwG
	 gtyIpKQcvMeJLdbW0K4mp4IC1KC7AG+vKEBUSQpv/MAhupilPf/o6VX+7NDh4gOw4yPcj
	 LfTJhNRtdVxZd5wIxlMLL5qu8x/L4OVB+5w1kdJcL82OOZKDi20QC9ef+3QA5TBEEJs5a
	 aVCfHmZcTIgi4TUIDQOiVl/P9xetPlZINFA6V4zj32ZaRcuP5BNIxCJ5RfQekAm0Nb1Ck
	 BwKARp2M0FMPWtxjxESLfbtNks+UrwpsPO6vDm6WO7dtjmrAe+5L+/WVcTeDGxZRG2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=sEdsgEuo8ODT+rI1rQ1WVM7pBhVs1i3Hp1pw+AHwR1c=;
	b=ggBJ8hnLFExv2bRTG/NWbwuFDrcqNH5kemZxEfIFzHLMPfj60F8D6BDq1dFC0Q4gOKDq
	 DlvCtofb6G22Q6A4KRqjcqEN35aXdunGlRMs0YsWFfqZ3UjtKGKMGrz2FHl7z+fEtXykS
	 f+k2zsbLDI6PEgqwT1SIRAvsPtOnAbuzY5lWACuPz1KeXKFQq+2+prOWtFJscg0jFtRFJ
	 igpXhD/FN9tL3xx23GQ+nZoeETtQ2YaIzDB2AzmCa3Uv+EbZSnu+k+7IzfWLiHBAgGzHq
	 B9EUXKWAaTX7uAzM6bujuHaVJ8sx07XUkZjQGvsAabmTvcxhGZe49JDKZVQVkfYTEEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iBl5NfRd;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D25A60A5BD2
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 19:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D25A60A5BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iBl5NfRd
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c50657eaef0so4522066b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 11:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794943960; x=1795548760; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEdsgEuo8ODT+rI1rQ1WVM7pBhVs1i3Hp1pw+AHwR1c=;
        b=iBl5NfRdf5cWA59IJIb08trlhqEfUF3MHKNPKAS1DywmemLi225mbyoiazWQV2Hd/G
         uE+acbsK9lrJU1KLQuGHaG3iy0VdZPiZF2fwknbpUT24LTHpMiBqlQq+NEXA4PhRdfHd
         iLQmLvF52RBPz8Y7psq53+eVKT2y5ggUMtk8ZAKsSkRytoau4sPV+jDdXLXPbOi86bG8
         nrONNNJ/yNH63VOVmh9r2O9t2gOaZy+IIdzUZKBfxBCC9muQRwCIrbyhoMkTCFiwUWJK
         3wLLe6R1hWW27KKYd7bX2w47bhvdo45Ujc/Z912zbctkn0eJuL6052BNwW1O8Jd2+ePy
         CpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943960; x=1795548760;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEdsgEuo8ODT+rI1rQ1WVM7pBhVs1i3Hp1pw+AHwR1c=;
        b=fsl6tufR0wN+h+nPm0WAZZSo2nOcILXa4/SbzetWU0iBBaElgD0Zn/Kik776dm3wYi
         v8PN/cLtFrvv6czDvVr4v6WFNUCR5fJhsq9LN9awK2/6vuf6ai76M20u2d4dMUAeiXC1
         WvEydP6XNf9chqabkh+Q9lOK7S5/4vspI7NCa8++KcxL+JDCVf9Hp/g9O/jX4EsGelw2
         yVc5XeKTrS50a9zkaU3ktA2EbpERqAY0oOLTDcfowZTn3JsR0SjRoBWx5XQmsWy8I7U/
         UyGnlNjZNkX/zs4PkoDvbfqkHOQoI8dqunex++fbWxd8PbbErLaAc4tJqq2O68u0Dmqg
         1lIw==
X-Forwarded-Encrypted: i=1; AL+hErFoVfjjaGk3Q+7Ufy2i3BforM8qphvb7woqBFNWwK2LutGHjQGN4Qc5AzgpRLW3yKuWAIJ449Th1zn8SmmrCg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sp/15RX/2E8Qx4QxrSLrXv/f8YLGGsnVNTV6dOzt1sxVD3miq
	bXaeaAo1HnSIc8q0S3rzTimeG9nUDCSh2c0wUNfhxMLkVtXn3dr3tDDNc4xqP1NXqz9cfGBNemY
	lod9TMzrS2XCklx/ixg==
X-Received: from ejeck9-n1.prod.google.com ([2002:a17:907:e1c9:10b0:c46:aa24:8716])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72cf:b0:c2e:2252:6ddb with SMTP id a640c23a62f3a-c510e19b51dmr22046066b.10.1794943960151;
 Tue, 17 Nov 2026 11:32:40 -0800 (PST)
Date: Tue, 17 Nov 2026 19:32:21 +0000
In-Reply-To: <20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=fHxqvSNi6j+mg7W4SOrkydkocL0Pw6SV4czczy3ta6w=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/KvQUDExEsHiZ6Cbk1w6CzxYFmFSS4BSPnhEk
 MSLEGspzROJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCavyr0AAKCRAEWL7uWMY5
 Ro49EACB0ftf0GHD6NVKJk8qoRRSAA8NtLcQxD9TKYzGe5l1VQ2v/ZRDvNthAokzdRvaDp8M5PW
 1IvhSetFJ1EPRT9FlJXK2lAOTgNOjbV31SMgyfAeog3PyR/AAEA3mJegzv0uA8x2BFW2ftoq9ez
 ftvL5TL/kRzHs/YDi6niQqRXc3GlcM1r3KgpKlj0pw1CgsDeZsfeW4DA8zi20tZ0dVQy8k6SN74
 rnpMamiABEsq9czO0k0TAIo2PdqLkksEo7LJrATWxZZbSw91E7qLnu7xVAqb6VQqH8KVjDyFQ4L
 3D90Xoq/m9Rzqv9GUeIsTH+oGkRb3rFkj5NdcdOybMq8+orYHWW+qHORyYvOBdGdzy8ICUh66XI
 2O+Mez/FxA2cxniGl8lj6y0zYwl9OSQE+6w7sOXqEYHamldd+54o0hcZQIXUFNk3WaA8PnqKRFp
 agH5mLLhUCQo0e1DL5UHQxBjwRtmyqQZ44vAMgM8d4wFArAd38y2VLOKLic+hHzm7WcRo1p27P7
 gq6FHPM27S4LPzaN3Kl94tyFAKa4gt1bju+FU6AXnvDVFK+fY+Gs3Hf2GAH8Kyv5Xpmh0pFcwiV
 O4rKaY4DkUE50L1H+Gl6XcUjAkTinnrj9ZXxVMj4eaxEwyvrozh91m1ow3Ep9bEm3FNtth4J59R iniBlvdTGiEmd5A==
X-Mailer: b4 0.14.3
Message-ID: <20261117-tyr-remap-2mb-v1-4-2a8efd4c8180@google.com>
Subject: [PATCH 4/4] drm/tyr: vm: check the remaining length in pt_unmap()
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sami Tolvanen <samitolvanen@google.com>

pt_unmap() subtracts each unmapped chunk from the remaining length and
relies on unmap_pages() never unmapping more than it was asked to.

Check this subtraction and fail with EINVAL on underflow.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
[aliceryhl: use safe casts instead of 'as']
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/tyr/vm.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index bcc864b17428..acbca552d133 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -41,6 +41,7 @@
         ARM64LPAES1, //
     },
     new_mutex,
+    num::casts::FromSafeCast,
     prelude::*,
     ptr::{
         Alignable,
@@ -1063,8 +1064,9 @@ fn pt_unmap(dev: &Device, pt: &IoPageTable<'_, ARM64LPAES1>, range: Range<u64>)
             return Err(EINVAL);
         }
 
-        bytes_left_to_unmap -= unmapped as u64;
-        iova += unmapped as u64;
+        let unmapped = u64::from_safe_cast(unmapped);
+        bytes_left_to_unmap = bytes_left_to_unmap.checked_sub(unmapped).ok_or(EINVAL)?;
+        iova += unmapped;
     }
 
     Ok(())

-- 
2.56.1.703.gf848ed807c-goog

