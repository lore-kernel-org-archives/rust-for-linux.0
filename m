Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495AA63D7
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Dec 2023 05:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ObZgNKz/"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b9e2a014e8so2258041b6e.2
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Dec 2023 21:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702878742; x=1703483542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvwPqpJZdoxCPgLCCQ91PkXr1gejT72qQ4VC8gFnpTs=;
        b=ObZgNKz/KunM5NI1SyLCI8fpB66IPjnAWaclin0co5L0JZD0OTsNoCq9ezPsHxHi/L
         DYtnTtm1VDvRx7snOQPMMoI4ojK/HfBI9CUNhIfROMuYslozdVYxohXSZIyo7jrLYYjG
         gnKeINiTqU9jj20nuGamiKApUij7SwiY26p8nGeaYHmlfiRcEje1mVGEX3fMxuyBuqQo
         XqVdBOOjPEWvh4BXd0qDym8YMlo6fOatDdWd8N2naieYU5SLUQgIUiYE+fLnrw7A7e61
         uLi8R311klXTZIDbxjq1hxsEW/2Uw/uCf8asTT5bAmOaG6a4OPo+q5JAwI1fcCai/9Q2
         E9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702878742; x=1703483542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvwPqpJZdoxCPgLCCQ91PkXr1gejT72qQ4VC8gFnpTs=;
        b=klax/+IbqFXqCAq/e0GGQxuadHzULZS19SgKAP0YQRzl+MJnMRMmRoWpwZTFH4x4RS
         L5N8D2lVnnrnFXWskvYt3I65Nr9pCNIkiIq53vPRe6Kd6DY0s//MGPobD/R2DIm1sxO2
         eEuqmuqDCLNUWFP4aNR+/x0b8NRpBpLssRU0aDkYNr+7ar7fXYvpwF4S2AgHhZD7KWUQ
         OVEopHzsgRRbQyNkcgOYW1mPhr75MoqMK7zZZDimSjSFBspM+cM5LVATCWS6Tq9eUzGt
         iduc/nMhxJc92RRRH0xbQXDcc0CbX/uxLxy/GbC3nlcIiWFHBr1N4rUmtLkcKhs0IJkG
         Fn1A==
X-Gm-Message-State: AOJu0YyKbWcYXAQztOAwFIljKw7mdzgbJwaryyxCC/iiyip2d4eBpOhJ
	AgFPdPH9PSyFWT1FTlWIM668WA==
X-Google-Smtp-Source: AGHT+IHWHiyRld+78HNnonHpwfExXg/FXJeL90CmfG3Tsyqw7E5D1sTLDotXmziyEbh9oFThjWFZvA==
X-Received: by 2002:a05:6808:17a0:b0:3b9:d53f:452a with SMTP id bg32-20020a05680817a000b003b9d53f452amr20483672oib.70.1702878742764;
        Sun, 17 Dec 2023 21:52:22 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a0021d300b006ce77ffcc75sm16344940pfj.165.2023.12.17.21.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 21:52:22 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V3] docs: rust: Document the rustupoverride target
Date: Mon, 18 Dec 2023 11:22:16 +0530
Message-Id: <c22eca4c308b72cdf750087622b61d3839ca40cc.1702878682.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the newly added Make target: rustupoverride.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2->V3:
- Remove the O= part and document rustupoverride target.

 Documentation/rust/quick-start.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index f382914f4191..c13e2e479e29 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -33,10 +33,9 @@ A particular version of the Rust compiler is required. Newer versions may or
 may not work because, for the moment, the kernel depends on some unstable
 Rust features.
 
-If ``rustup`` is being used, enter the checked out source code directory
-and run::
+If ``rustup`` is being used, run the following Make target::
 
-	rustup override set $(scripts/min-tool-version.sh rustc)
+	make LLVM=1 rustupoverride
 
 This will configure your working directory to use the correct version of
 ``rustc`` without affecting your default toolchain. If you are not using
-- 
2.31.1.272.g89b43f80a514

