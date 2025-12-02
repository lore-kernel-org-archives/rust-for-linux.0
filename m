Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAAB2DF6EA
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704274; cv=none; b=iujW0lqyxGDX1xk0p8cfVU8oT3pG1U/JkpkYqYCoPXhauTWGrUTd9fHgSQOkG5lVQ4cnBv1NDqqJE8EXMLD5vFScQ9YUD50k71OGSp4fvTvK5jMje9h2lDEnC5YcBOLJTifiXEJ4CG2C9IA7vP9n62Xom0zDpycrsYk2NPvUojk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704274; c=relaxed/simple;
	bh=KrTcPRj3kk8ecxiZ6V2FePs0o0lFQY4TeRIDSk6mtks=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P+R/bsu6rG/2MjeFYsIyNgRBpKxeRz8G+O7lKS7ln0915wmtwo/n8GRZZprvW+xK3ZjDWxG1QYon8LpqbI8yIzVBF6MsgQhBw/4paJ2PqDmzDTpSNLUhYLwJbrNEUe+dD428zRyMSXNh/W9skskFlZMKbCOHZulPQ3T6+Za/aKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GcK5Z+47; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GcK5Z+47"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42e2e2389aeso1603619f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704270; x=1765309070; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=35fE5jiNN4qN1heeykpDeyMnAdG2GzW9esF/MwfbKHE=;
        b=GcK5Z+47y2cUNEpmlETSZbYMOixfZQXXJlym5+zLOV9w/Ac0DvD3xucxuWsAs33PxW
         brOTxhWMq8wRtgSK4VmUrbXT5PpplIZNytkdDPscls9/M3OLQo9jwdYBoQFjfbNxPSCe
         kuYXFl1dacGs7KY+uPnsD/deGXRE6P+zpehSQL28qPNe0CUYNgcIJVss//W9+OTXzzUh
         yizUm49anbqdNf1e2SAU5kM0jmGQOsUPYWpVH0QIeJV50Zn3mzb+g+KdcSuk+XUyuBL7
         25fOhKrY+m5fvMCc/02y8vsIcfPgb4fdmND9DkBQ0mWXQTcA54ZrcX1ykTje8+KXHcGC
         QULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704270; x=1765309070;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35fE5jiNN4qN1heeykpDeyMnAdG2GzW9esF/MwfbKHE=;
        b=QNtjHSb4OtI8If/Id7kDeRqSlsV/DEMsX+y4cI8c1fnpfFe6EF2TKlqdg7naU5suuk
         ovXUSLjK7mTfjVJHF4RjEP1mWfiV4sZzUVL6LPANykE1/k4lvTVcRIJsZ+bse3uUJjGL
         oqVkauqsZew4uMXR0mv2JEVCVKZwhdANWs1/ZgkP50B+UkDpsvDSFmwHynsZXO5gNsis
         YXjhqUt/eT28llS4a7ufew7z0uqaXrqz/sT5r4dF3ba53FuzYmByLxRFnKnqI/ruHEKJ
         VC/8UMzscJVCrp5Gr/g2J1dq2IN5f8FMB48Vo3A817Z2zm0TSXLouGyNu0s0pAOqDpdE
         19lA==
X-Gm-Message-State: AOJu0YwpOCA0co/Va4N4U1v7WcKArVv+qbPIKTklUYxOPCtRuANp4plf
	O5q1H2YCq2ULgodqNxUOEyncGimobHHkOvpoNPKpDtdKz3kF1UqRVwW5+Ymecw98gjcq33OS0yv
	UaAJp7UEZzMqyqoQcbDyTvctiEMhSFu6VQPxZmQOeE4W9AOHVhhi+jnPwfzG3LuhnhuyKtqn2Jq
	Z+O9tN+tmA9e9GOP5Z3M89tiz3s7r8/JErja9om7vNeeKAHRQ0GdrE+CZXKeHoI8I=
X-Google-Smtp-Source: AGHT+IHzyc4+lsVIW+GXbX2eeHAyTIHI5LBqCm7Z6BNxznU4WRlrlO9iqtoyaHP11iCUYlkvqJM76J5Ksasm4So=
X-Received: from wrqb12.prod.google.com ([2002:a5d:40cc:0:b0:42b:2fcc:57d1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:3113:b0:42b:3d7c:c7cf with SMTP id ffacd0b85a97d-42f7221c33dmr413625f8f.15.1764704270240;
 Tue, 02 Dec 2025 11:37:50 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:25 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=KrTcPRj3kk8ecxiZ6V2FePs0o0lFQY4TeRIDSk6mtks=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AGmF4ZqM29Fv0IkANgi1X9ydX71ofLn1Tym
 9KMrKMktRWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ABgAKCRAEWL7uWMY5
 Rn+vD/9wm02QonXpBBrLuDaCzqFVePM4Wg8JnPZY10dRetVt7m37oEykkkA4DEzOKS2CEuMr1MX
 wYzzL1AfIB0+fTZWaKYFqiwL/Gak7LrvWSIpEe54sQlfJ2S1lBynaTtsC13kkLxZHDOMosbMgXA
 2dgJP+PddAiX07Z4fXrJdmsOV0tgpuQCTXsZv5NAP/qRZwt65ifXmfMrUBRG03Ua/pRKM/nIyXD
 w28bpHdgCGID5csRpVYH3Z9EX8fJNrdwntDh1YTi7fmUc4vdMb1cNqrADq6nS5vHRKL2gAgwplC
 U2vAjKNgE0knwrXf5yisSiAlwYjEMVSGzGL/0Vlcb9FhnGGIXS13vgnJVkJt58x4HVt04x24rx2
 xxAMju68UcCyWyV1ihu2PBTyWED/Hgww0f7uGgSOW1ZYvMU+5EvDXqM4sAF29n82XarB7QdrOGt
 77Yy7I5ttfxLN4ldV2oluP+Sb/3RRhNfWNRTB7GImN4GIw+j621oofzF7dt1w4Y0XRxQrTkBXO3
 C+K9Xz1vX83SqNTvmRrROtyBecqzF/I6CiV8HoeknRyZ8NvqgaWaoTDXWWip5hmRWa1nJhmrAxh
 Cpg5kkL133cuXrgD7tCfNxBr+4Ak1C3IUehdLZ/mGAc/fIVBw+huyOFmNs/wpltAwlC8xLwTi+3 4Z+siIayCb5pu4Q==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-1-a2e13cbc17a6@google.com>
Subject: [PATCH 01/46] rust: auxiliary: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Leon Romanovsky <leon@kernel.org>
---
 rust/helpers/auxiliary.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/helpers/auxiliary.c b/rust/helpers/auxiliary.c
index 8b5e0fea449367ce6f462b421fa37a12a0ec11cf..dd1c130843a09a5688d5f7b620f2dc709a5ac5cd 100644
--- a/rust/helpers/auxiliary.c
+++ b/rust/helpers/auxiliary.c
@@ -2,12 +2,14 @@
 
 #include <linux/auxiliary_bus.h>
 
-void rust_helper_auxiliary_device_uninit(struct auxiliary_device *adev)
+__rust_helper void
+rust_helper_auxiliary_device_uninit(struct auxiliary_device *adev)
 {
 	return auxiliary_device_uninit(adev);
 }
 
-void rust_helper_auxiliary_device_delete(struct auxiliary_device *adev)
+__rust_helper void
+rust_helper_auxiliary_device_delete(struct auxiliary_device *adev)
 {
 	return auxiliary_device_delete(adev);
 }

-- 
2.52.0.158.g65b55ccf14-goog

