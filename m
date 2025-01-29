Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B328419E804
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Jan 2025 21:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738187431; cv=none; b=BY0bDX1mYXbKKK/X5As/0qU5ANyy0d3KbvuRIEIuDSIpCo1RqSfRZOKfyaUKEhxR+oJyCFdm8t54C+5d5Jm5DGBpnHb+ptWQK643fiGPzTKh39eWUwZiCIa9C2NwJ/P64FasPe3RiRQ+Ophnd1UtTpNiKa4NLN4eUgyHr7JRUMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738187431; c=relaxed/simple;
	bh=GCv1BdGhLk979tjwdD7sHi0l76G9SsBFWUxU0e6u/iE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mx784x8lt2dSyMbpvBrD6Uc7xxtb91Ht2BttwXmkCHOo3R9BdUPurYATo70Vjviz4BZlblMnWW6ue9ON5UCCqpfxkTqBSh4WzveA0GfnSEydBIzMPa/vXwNKmITHxBXNUXaMoPFWtqOnFwGfsU1+zpRrocS7YFpmy+EO/aNf33A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=c64uApf4; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="c64uApf4"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-844e161a957so9511939f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Jan 2025 13:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1738187428; x=1738792228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6AAS+zM1KKQALs9Y9hGxYkwdnvHEn+06CSi/EhMJ+kU=;
        b=c64uApf4rs+3yzS0HQsyJrvBVA09ku0RSMYa74LNLp/7xj6J+4T/5Rsr9vmBD7KNo7
         PK9X5iPUz7PXBxqC71sUjB1RgNi0Y5+PtwNAPaISqDU05h5blRRLYtdHAKOKiEZpNCkc
         hjHYoOM0aJ23Tzdw3f9kFEyEJnLUqGpmi4t30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738187428; x=1738792228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AAS+zM1KKQALs9Y9hGxYkwdnvHEn+06CSi/EhMJ+kU=;
        b=GtAVnx8Q+zXdyrxHq+yny6KjQiHdMbG/vNM30aReYj8a8yvReNJGeZleMI1RUN9Vgg
         SN7B+Wd5DC4O7vPyhebCWdaAyR5caOqpPri7qsmAr68VWS24e8/tCNBhugi8eAQCvz9z
         p/RFgQVmk4fgkgNWeTZ+92r+7wqc0E31KRp+1SV6Z9YcB/v7BbSKObLk5uXDEL+uirbR
         zw6mdxywZEZRz0flodk2kqILHZUoRLfQX0P2U5JYlhaa5YjX/bTaaa4eNmvkg7bzuYE5
         tSNm55SWsDKdQrE7MAboGT0eb5kSYA8lrZiXWj4F6Bfw32RyGXySJIq378t4/fcvtgBV
         B++g==
X-Forwarded-Encrypted: i=1; AJvYcCUSBSfjgN9nBwYECaWPTr/ss3dogtRyPtpP3XuWz2hQ90e8Qdit3/J2CMaEKdEWSTh4xNpaUWf52qneUPbCbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiNZJcXCG5IXGW+i4HNozyRPzCwNuh1ebbJE+9iyxi6OmhPIen
	pXYDZpf4TenbHaHxm2Sp4K5HzeOzlx6+J4EwS1/sLWY3us9DnfhPuovcljAzIg==
X-Gm-Gg: ASbGncugeLZRubIngcgD2WLhyVJm9pIZuDZDKbM77GyRjG9TYHTsn92yQP1oBMLy3OQ
	cjKNSPttTrMmYD7se+JjzTBFmu/7mj3bhZZDdrpq/aP/cLHODVQpQKFDY0z1Dm9Ee1nlkRMfMIF
	cbHggIVcT3biR4ccSddYy5JWeam9VkCUPhSz0SCx/+yr2UiWBaB/V3uOIEBdXw1aqO7+xbVnYNy
	S6wj9eNMrh7y+2VzJvDc9fHQwERoHS4mqJw9jEd/HSnMwVZ5IiLyKdM1Po5tR/ntSEgNm57b6Lr
	cD48RL+vp7V+hY49WaXUjyzuG1iOwLwT
X-Google-Smtp-Source: AGHT+IEvJSszsKXHpNKz9g/CRfSxmyXZyJBm+Dxm8K/rY4WK0s24ca0m/ItXgDsI7h5JOofLlACFcw==
X-Received: by 2002:a05:6602:2b10:b0:84c:e8ce:b531 with SMTP id ca18e2360f4ac-85439fbb605mr538809039f.14.1738187427802;
        Wed, 29 Jan 2025 13:50:27 -0800 (PST)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7458ed5csm40202173.29.2025.01.29.13.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:50:27 -0800 (PST)
Sender: Justin Forbes <jmforbes@linuxtx.org>
From: "Justin M. Forbes" <jforbes@fedoraproject.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Justin M. Forbes" <jforbes@fedoraproject.org>
Subject: [PATCH] Add -fzero-init-padding-bits to bindgen_skip_cflags
Date: Wed, 29 Jan 2025 14:50:02 -0700
Message-ID: <20250129215003.1736127-1-jforbes@fedoraproject.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This seems to break the build when building with gcc15.

Unable to generate bindings: ClangDiagnostic("error: unknown argument: '-fzero-init-padding-bits=all'\n")

Signed-off-by: Justin M. Forbes <jforbes@fedoraproject.org>
---
 rust/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/Makefile b/rust/Makefile
index 71a05a3c895a..3c3da7faebb3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -240,6 +240,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-call-used-regs=% -fno-stack-clash-protection \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
+	-fzero-init-padding-bits=% \
 	--param=% --param asan-%
 
 # Derived from `scripts/Makefile.clang`.
-- 
2.47.1

