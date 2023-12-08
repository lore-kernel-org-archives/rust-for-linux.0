Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KXF2AQ59"
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75217172E
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Dec 2023 02:18:05 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-58d12b53293so949365eaf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Dec 2023 02:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702030685; x=1702635485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0NmoRHTCNAA7+499JkbNaILAA7b/35IKN2Lx1hQIG3s=;
        b=KXF2AQ59Fi0jagfOvLpUPu0PYkMjscrkMZjs4ncAEagK0RHma78+Vz0G1IZNcbp0qb
         IfBwGDzsFXSbIfOW1xrvp3RP5yBmtFoMYtWRyn8JpB3JPClVRUA5KIDBhX96qtTzebv5
         P+DOTZR0KKR6gr4n/Vfc6OFU8X2V1An4zb3BO4N7TM9VDdcOf0Zv2e73j7mSgY/uIkud
         ZEkla8lLU3ULVTBsN+KWiYYEqwYEFTPoP0nTUL5nFvQ2p4onv0z8KAP2J8HIrNUKZjTe
         UZa2XHE4l5OcnWan2gNkvgicvTwyoDbMpMPdFnFwQACl3ACMreQ5qU/3tCsZpTR+5DQw
         NErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030685; x=1702635485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NmoRHTCNAA7+499JkbNaILAA7b/35IKN2Lx1hQIG3s=;
        b=Oggfty+TkCGI0wycNqzvmoC0DlrYD/7t1csVrNz6VYc+DBnEEFV3VdwdaYUo0tt9dk
         JVRml812YMKiVjlUcTozU88V0zMicOVm4vATlD7BreQZgHUheUoYtv/mybG1NoczzlW2
         IjpwaDe9ZbnKk1ajscknDP8zybjLmR2Hs+9r/GaN2e/eXxLT4xCUK0aQN1/THGl4cg8t
         2zjpQgC4Ga9SvZWBaGHs1i8AopidSlOJJCGhOkTwhY2d4GwRxa/fPJ2cASUpff6DDlTd
         qk/6tw9gNHo+KMgtCUhrcgD4GvTdhD0TCY0obw6D1sufqCdfNG3wE8esWy2hS5P2J5eQ
         Cd+A==
X-Gm-Message-State: AOJu0YyKMFwD/O6pZhqHwcUnSgHOC6h7nXZN8tFp+K8CN0qQFJ4GioE5
	RuvKTJ4EotEai/wmK615fb11Sw==
X-Google-Smtp-Source: AGHT+IGUPMOIa7veeC+WP5/Up7/5mLKPL7gPv1ouzH7ay63AtOjYttMQ4IMHhSTQWYYKskYm9a5FFw==
X-Received: by 2002:a05:6358:2496:b0:170:17ea:f4e8 with SMTP id m22-20020a056358249600b0017017eaf4e8mr3233758rwc.53.1702030684708;
        Fri, 08 Dec 2023 02:18:04 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id k21-20020aa788d5000000b006ce79876f9csm1228840pff.82.2023.12.08.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:18:04 -0800 (PST)
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
	Jonathan Corbet <corbet@lwn.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: rust: Clarify that 'rustup override' applies to build directory
Date: Fri,  8 Dec 2023 15:48:01 +0530
Message-Id: <bf0d4ff21bc25d1ba3a31e49a32bde06dcaf6e44.1702030679.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *

Rustup override is required to be set for the build directory and not
necessarily the kernel source tree (unless the build directory is its
subdir).

Clarify the same in quick-start guide.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/rust/quick-start.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index f382914f4191..a7a08955fe46 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -39,8 +39,13 @@ If ``rustup`` is being used, enter the checked out source code directory
 	rustup override set $(scripts/min-tool-version.sh rustc)
 
 This will configure your working directory to use the correct version of
-``rustc`` without affecting your default toolchain. If you are not using
-``rustup``, fetch a standalone installer from:
+``rustc`` without affecting your default toolchain.
+
+Note that the override applies to the build directory (and its sub-directories).
+If the kernel is built with `O=<build directory>`, the override must be set for
+the build directory instead.
+
+If you are not using ``rustup``, fetch a standalone installer from:
 
 	https://forge.rust-lang.org/infra/other-installation-methods.html#standalone
 
-- 
2.31.1.272.g89b43f80a514

