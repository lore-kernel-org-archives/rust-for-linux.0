Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C91CC15E
	for <rust-for-linux@vger.kernel.org>; Sat, 19 Oct 2024 07:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729322543; cv=none; b=AgcAVieLQhd6Ufr124F0/Ft17skWLkEjJimndfcQesKkdsVk1jWt2jBlju01OqQjjPcMAHxTd8xFPhWNt179WBY2Ex3XEyJ7fr0O1ukRm+YdD1+n/slzLp3MLf9CT71J0LdVPLMDihvUyBD68aYwWLz/Mhd1fUarjmXWK/zSua4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729322543; c=relaxed/simple;
	bh=JMIw6Tah+dF/NE7+ur6PO/TK9IPmMxoPlphA/OE50k0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=noskZ4hhgJiY0D1KmsTqB3qRkMZNgShKhYBIE2Mr4VZTA94r98p662CU+4dqysrSbdNyloyZ4QoHLWeDwCctDSGfN2WZuIKGpu2aay1w+4XO0J28vu6aCd9303uLLINcrgtpA1PH1HNbSIW9hRfkBJ7CjK3JLFA7NTzkygProjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G4WLIHr7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G4WLIHr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729322540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8SJAx6rOLkrSFtDrtkQFfzY4t+GoPsFXLeCYHuZL/IM=;
	b=G4WLIHr7KQK7OKS6mY959BZ3sswFHybP6lEdyUBBqaMEejKl0e3VvnnchRAE3UvBwrq3Yd
	bEADBQmNrAWqfuEQo6InWE6SnECHtdAKtQJMICkmWn6RAp2iU0dTACRcJnZNJFCwXFwPXP
	UotftGiUMHpna3LD7Z5emnOxD4kuhS8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-6gE_9XHOMCiU8PtrYcnKzw-1; Sat, 19 Oct 2024 03:22:19 -0400
X-MC-Unique: 6gE_9XHOMCiU8PtrYcnKzw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43151e4ef43so19926375e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 19 Oct 2024 00:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729322538; x=1729927338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8SJAx6rOLkrSFtDrtkQFfzY4t+GoPsFXLeCYHuZL/IM=;
        b=sQx/guvNquq4du0FEP69gTT1L6jjwURDOxw7tU6HXC4e/ivrX2+52Cqn+mvAp4+N9A
         s1wWx7Ac2EVM0K3MHRuggdNai2fqP048xC+FCy0WCQqUKMgYGvFKlC99M0sh++FWRlJW
         5PmiAhhuJcOaYpS1hdRsk/z3zSrvdG/1RJiPpqOPvcgGjkyP/Z+08GA2IfVMV0ZWEcDM
         J7CibsYpU0KxNmIMggJuxHIMHTIyzIoz2hOxQBd+PNXNe82liSzd1vc7Tti97a1zvFoA
         Zr1dk1jNPCNVxK1fF/CXE3HsxlXjr2jI+4qaOwX8P+swyrb38sLnpmdW92yG7WRGNwOv
         x3pg==
X-Gm-Message-State: AOJu0Ywnlt2Ogm2tl2SanM7ewzv1P/xRyA90+b4uevE5pxpE4HFLnhR8
	BopwvlfAkOLCOzvO7fd4yQxjdy5xwtC9q/hoiwXB6hHbhWKm8MIrC/vlLekl0VNoH2ktw0Y0pMK
	+XseJNeNbjd4EOk0e5Ptwf3c7azK5pk6upPW54sdQ4zPaV7XXCSjDbiSre126V+7nBV4RAtPOJV
	kpVV0BCbrYM1YmOeXqZuzH0L2wwT95DnhrfCG2NpooGTcxDhO7tiE=
X-Received: by 2002:a05:600c:250:b0:431:680e:95d9 with SMTP id 5b1f17b1804b1-431680e9817mr13439085e9.22.1729322537737;
        Sat, 19 Oct 2024 00:22:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6XLwFYfPPq2sYb3dVYWe8YxSWZfBMg1xnOvGY0znfm48GMQ7Kkv/HJlaJzixid29PXVPu4w==
X-Received: by 2002:a05:600c:250:b0:431:680e:95d9 with SMTP id 5b1f17b1804b1-431680e9817mr13438885e9.22.1729322537267;
        Sat, 19 Oct 2024 00:22:17 -0700 (PDT)
Received: from avogadro.local ([151.95.144.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf027a50sm3739849f8f.15.2024.10.19.00.22.15
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 00:22:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: macros: fix documentation of the paste! macro
Date: Sat, 19 Oct 2024 09:22:08 +0200
Message-ID: <20241019072208.1016707-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

One of the example in this section uses a curious mix of the constant
and function declaration syntaxes; fix it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/macros/lib.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 520eae5fd792..d60359880b5a 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -322,7 +322,7 @@ pub fn pinned_drop(args: TokenStream, input: TokenStream) -> TokenStream {
 /// macro_rules! pub_no_prefix {
 ///     ($prefix:ident, $($newname:ident),+) => {
 ///         kernel::macros::paste! {
-///             $(pub(crate) const fn [<$newname:lower:span>]: u32 = [<$prefix $newname:span>];)+
+///             $(pub(crate) const fn [<$newname:lower:span>]() -> u32 { [<$prefix $newname:span>] })+
 ///         }
 ///     };
 /// }
-- 
2.46.2

