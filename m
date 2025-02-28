Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC04F1D8A0D
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 07:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740729426; cv=none; b=oeBomlSdswc3eaFAGGPNE2uNfnlTeSq8+nAyw2XtZHFhgKVB9UzM/57e985X6kJLt+102CeBJ7kOOx4gg+EPQhkd46l/dUgKHlScv6YWBTKB0VkgpeurnV63r5phJ0R+ITZYz//PavnEOHuUTyxDLLKW52rjkw42Xem2kx/YoSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740729426; c=relaxed/simple;
	bh=gmMH+aUJE9Rk1973vUz9hXnl1+2zE7SmywBWSF30UzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nJiuKgfhv4C7CtnOYuTQ9krhRSUoiwFaxtF3dn22npW6194gzVW8nP7zTPX5WZ2pHn4/MQMYbaG5Z+4sZMal+XqDbenWQSCTdDw/s2eWn9gW3p2OVxsnoiM3ddMGY4Xwd4JEavdCpMfrgc/qYTtoe/tcGdxwLl1+84nU8D1emWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N9SIgvPH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N9SIgvPH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-222e8d07dc6so33609405ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 23:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740729424; x=1741334224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WUki+CTmoGzsbV4r0P+sToWHb5wtaj3zroxo9tMJJk=;
        b=N9SIgvPHmHba9/V2cdP4U9JI0Vjr+LutIPQzhKI9Qzx4hBs8fWz1plnND7d7wVcpiN
         TlYOc3FAr//KC5HQH+Avm37rGHVPWRuauv3AkRnIzKMYKavs+N4fF8iP9hRPEjnbPe/4
         isBL+jOtFgd11pHK6pfnDFt6/8TZoEi0tQEYxeROjsS4TX5ABCQFK2GeQLF+9r9cl6Ca
         neGutvNt7BnHGlV51RG9QhW+ybkqxYL05wUTxlTa37waDvtAOW8K8nlvOxK8gVxtCxYf
         HTojvLm9YMiUNLZL8oYPaU7hQRicpBz/hFBlsOLSF8bcO0zqx0NjZbk0KQEZ9stsl3h1
         PXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740729424; x=1741334224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WUki+CTmoGzsbV4r0P+sToWHb5wtaj3zroxo9tMJJk=;
        b=SD8386sG2ER2TOBgLh0Ord2SqVcusguFawI4F9oXq6CkPqE1TZUis2XgNYISCdjZqU
         qUveieEpVhf2ml4nTYEP+F6sYFLCmdIejq94CHFxZhxwlFD6BnBh+uzAqfIjl3530O2C
         BsEvYISdbqqrQ3dJbaa9eZ+TMLN55tseE2L2xrXDcwdvcxP6B/7WlWpo8W4wMeAIPeBB
         RuH3hQ0gyVEZpEiES9pwxTbN9k2PCoHkPpKNUPVYm3Eky2QURt6SWhU2C54Au26EdmCY
         ddcWt6wgsAhL9VffUyxp/ruYoyGM7E0etaBlaYbr7+clTeNwVoh+oqkA6C5+knX0FywS
         rTaA==
X-Forwarded-Encrypted: i=1; AJvYcCVSZXq/ftJh2XrDSyXB2MLSV+hoq9v3Kd2MoB/Uxsrfj/Q30i2QOEfO+vDRZ5Jsj9XXjxKnj2lt+rKPgKCAIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1+C5IZy6wfewJOffm96DgdXadPyv37bljtDHdfV+rW6fcK5cS
	Ca8U+Y67265Y//zziCeC21ATWgavQKA8VmlCIy+YkcypKOe2JLbOKx85TNESPBk=
X-Gm-Gg: ASbGnctkHJaqbM66cwqSdIDX1N4fnHRc/0TadB66JyDzuo/W/3UQ/ggPO4EIK8ZARHF
	VZFMlvufhD+bgl/KGhXfC4HXFJLHkr4TR1h74zTMnTE/YIhDJKmLB+n8U8/aD/8GJQ67bEjgWfM
	4fQDW8/GGPOK8Jww1LNx6qHUUeHMYnF3aZ8RXvDsVyVZSwi1ZwdFDrM22R2w+Vx6kHyrU1Qv7gI
	ZHByvRc9wzCeJz1/E5YHJnX+QxZ4736Ywux+uyJQU297YSI6YyaIopPLmxlD6+QZj/P/R6oR0ne
	l1yJsnTVUxy6k8Gto9hoCmj7Wl0=
X-Google-Smtp-Source: AGHT+IHF0XzUBOQzA4xQaAevOhP/XOeIAlJ08hdOp5noD+m/4qmyWqGwO+BqRhM4PXdmUbApIBe8gQ==
X-Received: by 2002:a17:903:1c9:b0:215:b1e3:c051 with SMTP id d9443c01a7336-2236745595emr42790705ad.11.1740729424024;
        Thu, 27 Feb 2025 23:57:04 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350537b47sm27618385ad.251.2025.02.27.23.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 23:57:03 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: [PATCH V2 2/2] MAINTAINERS: Add entry for Rust bitmap API
Date: Fri, 28 Feb 2025 13:26:47 +0530
Message-Id: <e93666104fa1e4616d88c31e89bacc4415db24af.1740726226.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1740726226.git.viresh.kumar@linaro.org>
References: <cover.1740726226.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the MAINTAINERS file to include the Rust abstractions for bitmap
API.

Yury has indicated that he does not wish to maintain the Rust code but
would like to be listed as a reviewer.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Yury Norov <yury.norov@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec2428b82103..17e98d757b9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4034,6 +4034,12 @@ M:	Yury Norov <yury.norov@gmail.com>
 S:	Maintained
 F:	rust/helpers/cpumask.c
 
+BITMAP API [RUST]
+M:	Viresh Kumar <viresh.kumar@linaro.org> (cpumask)
+R:	Yury Norov <yury.norov@gmail.com>
+S:	Maintained
+F:	rust/kernel/cpumask.rs
+
 BITOPS API
 M:	Yury Norov <yury.norov@gmail.com>
 R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
-- 
2.31.1.272.g89b43f80a514

