Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF691841
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Mar 2024 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711179635; cv=none; b=SZ1ObdqTsJfL/vmJR5udX1XmfwHHkeRLHIEeM3hWnsKL7q3jEmRL2zN7YCg+t6W8Pb8xXugPma1GHYNTewpze+ZjC3pIkFa7dJTymNMs4mIhCfzC3PmTVJ+aywpS7Udm8lhntB4w+XC3pHiOifQxZYktTDhMaY41PKX5yRnW9+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711179635; c=relaxed/simple;
	bh=MjOXj5qmGrBYgO93Ki0Z5b8h4eoEMgGLlXrm9dIp+8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qgvenj9ZtWjBBOQ39+F/55okYs99QMFGLsf51eZTWjvUpLoOzmvu4su4VzqreTISECOlfnepFChdb9iLTwnwH8WksN0sqOag+3KuvfDNBWW1/UyjxCG1kFBkeaf32bNfnbvOYMOqiGDviWxoqR+anbwXU851P5G4XzveO3MpTbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IP6Ppwyd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IP6Ppwyd"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dee5daa236so20613035ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Mar 2024 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711179633; x=1711784433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17FHxgg9L/Jl/RleBk+W8OQtyM3DyDb0PgEO6viQP+w=;
        b=IP6Ppwyd2nG8Vpy8kcoSbS1sUWg5m+3ofaNz19M94QlOxc/h+RBDLKwxlmX7Pid/2q
         xNOsTmvL8zm7uPYYf5LDfmm9SbC4hUpWiriYk8IhQUw6KmWgCHkcZcFHoMIy6RXp+wpC
         nM+YQahdquCSsTR1nR+3HhTMUXQe+DW5v/zmXqKUGDeyXAWJMz+VclhLrMy7uTDObIpo
         6xqwndSha6uw/TbPRMwaRNUUZPz0KG0jOaspZn57FlRZ3SFhzky3eDkFLfG6JIrAT42C
         xmwgFizAgGgIhwFHQ1cjem5xw1wWHOvMF5nl13Zs8v9C0L+RHpQXMJtDWk5eUzY0vTL5
         SMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711179633; x=1711784433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17FHxgg9L/Jl/RleBk+W8OQtyM3DyDb0PgEO6viQP+w=;
        b=rMp7upBibEQ9Bj5b4awONQB7az/YUzfed5F4vX2Qg40yhM9fgzJKAcvmkM2xw+5DUk
         r3zXQ+T4DltvYQ2qdRNxHlK8GHGipdd0nIKDv1u/luUh51+CPK31QGLD8rKWWNdHtPOh
         W+8BgGRmbm07iHWj9Z+zqRZCmXq7uSNEdeYW6YIDpzwJYRt6JZiFmisDBfFdx0b1Ei95
         1/c25NEJywIeRsEEyiaObuammCwjA/g08jKUjpMEFdVJsujBS5HvDcP3yWzgcyuadvFS
         F2e/+cacIEKvITOQENFg3bJd+U2lfvbc8fj3yTUkQVS8SjuxwoL9VEpM8eIKZdtNNwKA
         cRDw==
X-Forwarded-Encrypted: i=1; AJvYcCUCKhZgs7137uqmdfhUm184N63iule0rlx/XAo2WVtRCsnGD5ZRr3XIyKRjsgX7caBZyTb+OghscK8lS77ggdmam5bRh8kWkq8jAeZVUUc=
X-Gm-Message-State: AOJu0YxD7/9LjASKLmqU7e+24zIJjRhJf0BFV3mfvfCgqkjsjw+gQtUv
	egoLGYGP50pifiMR8qxX1cR+b0YdD6nMRtE5Kj+bkCZx+D24tSeXhvRRFGSM1bU=
X-Google-Smtp-Source: AGHT+IFuyRHF9sqVJoYr8RuqCgoExRHUVpVLXTKzWTk/lLRubf8Iio13+/bewfBSpo7WC76tBnyIkw==
X-Received: by 2002:a17:902:e945:b0:1dd:96ca:e1ae with SMTP id b5-20020a170902e94500b001dd96cae1aemr2557001pll.69.1711179632921;
        Sat, 23 Mar 2024 00:40:32 -0700 (PDT)
Received: from localhost.localdomain (36-231-152-158.dynamic-ip.hinet.net. [36.231.152.158])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001dffa017c5esm969684plh.22.2024.03.23.00.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 00:40:32 -0700 (PDT)
From: Bo-Wei Chen <tim.chenbw@gmail.com>
To: ojeda@kernel.org,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	tim.chenbw@gmail.com
Subject: [PATCH] Documentation: rust: Fix improper rendering in arch support page
Date: Sat, 23 Mar 2024 15:40:06 +0800
Message-ID: <20240323074006.2940679-1-tim.chenbw@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix improper rendering of table cell(empty bullet list). Rendering as a
dash instead.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1069
Signed-off-by: Bo-Wei Chen <tim.chenbw@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 73203ba1e901..c4773d2fce66 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``loongarch``  Maintained        -
+``loongarch``  Maintained        ``-``
 ``um``         Maintained        ``x86_64`` only.
 ``x86``        Maintained        ``x86_64`` only.
 =============  ================  ==============================================
-- 
2.42.0

