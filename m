Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LSo5XZFI"
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C06C3
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 23:43:57 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6d9f9fbfd11so2250087a34.2
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 23:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702367036; x=1702971836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TOXKU7bsGbNdHwHYKjDdosOGqerCEfbXvQrWb4UvRVA=;
        b=LSo5XZFIc/VUGHNlD/o56Rk2QJkMRRxPmj/6S+vhtduOpSWVmESkYQ4SxUJ442BijS
         aSuqHfvmvWekqgxUN1RxOntxyQNV7MHgOUx5AVlyu8VmbtlvtxkGNscRUmymye7DG7lu
         G86q3j5QMnwUbO9MV7I1EnHQS5IHFOn3Iv63bw5Q8NC03KpdUZEZrUKDJkyyZoD6F0K5
         S5Q1q8D93f0tCHC9EJbcwqOuilkiDujcQFsrelaGsfG0QkaA7GvSRpUu1Fp6jjfhIehN
         onRKLZ3gWOEJ2kDEIz+56bTUzkHnziQlx5EI7IXQA4zsdlhw9zjK3eAvexXyjTVme+Wm
         w+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367036; x=1702971836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOXKU7bsGbNdHwHYKjDdosOGqerCEfbXvQrWb4UvRVA=;
        b=RGJ9ngJ6ilRtxYIhVlxUc8ZrVkhdVePCVo8gVWURNl6vakGM0enwTCcHqgmA/9AAFv
         5bVtlQJZsqxU8xeOU78AyDRZpPDHzXRNYE8pmiPxzI9QsQACN3Unxah1T7CoJGaXTgbF
         U/Lcll9/99kIeY5G5nDzk9YGspApn3w6SJjnYSfTe7PtGv3BMbBeRlGxom/XLor/2Pdt
         u/AS/XPPPmngpqHQQb+FnWfYQifFWK+0/iV+q0gJ/OsNGnWwG23j7SSX/CtJW5WSOZss
         idgG3NvfVqKm6ox2KeGQ8ejQbR42KmN8MwbyLzch4mIkfA3Da19BgYDQhnDZVpP2Jm7f
         1FKw==
X-Gm-Message-State: AOJu0YxurpJofEvoi8sL+gcixgSGpRKsUnIp5B41lkZp20iV/EwmcT0n
	eNpKdF8+6igkbPW38lXI1AWEMg==
X-Google-Smtp-Source: AGHT+IGKLGKqgzeNRv7L+xn0zLYdEZOT4libZggr20dVVKc/KDhBqq0Pl8ckyK54H8v3G3sDD1FWkA==
X-Received: by 2002:a05:6830:615:b0:6d9:f334:f886 with SMTP id w21-20020a056830061500b006d9f334f886mr5749871oti.18.1702367036432;
        Mon, 11 Dec 2023 23:43:56 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id d12-20020a056a0010cc00b006ce61c9495fsm7470500pfu.206.2023.12.11.23.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:43:55 -0800 (PST)
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
Subject: [PATCH V2] docs: rust: Clarify that 'rustup override' applies to build directory
Date: Tue, 12 Dec 2023 13:13:48 +0530
Message-Id: <e2b943eca92abebbf035447b3569f09a7176c770.1702366951.git.viresh.kumar@linaro.org>
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
V2:
- Made few changes based on review comments.

 Documentation/rust/quick-start.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index f382914f4191..7ea931f74e09 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -33,14 +33,18 @@ A particular version of the Rust compiler is required. Newer versions may or
 may not work because, for the moment, the kernel depends on some unstable
 Rust features.
 
-If ``rustup`` is being used, enter the checked out source code directory
-and run::
+If ``rustup`` is being used, enter the kernel build directory (or use
+`--path=<build-dir>` argument to the `set` sub-command) and run::
 
 	rustup override set $(scripts/min-tool-version.sh rustc)
 
 This will configure your working directory to use the correct version of
-``rustc`` without affecting your default toolchain. If you are not using
-``rustup``, fetch a standalone installer from:
+``rustc`` without affecting your default toolchain.
+
+Note that the override applies to the current working directory (and its
+sub-directories).
+
+If you are not using ``rustup``, fetch a standalone installer from:
 
 	https://forge.rust-lang.org/infra/other-installation-methods.html#standalone
 
-- 
2.31.1.272.g89b43f80a514

