Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885AD20B806
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742298728; cv=none; b=jKE2Tg+yDrj6wMnNva+l8kYcSjG+cdtfit2VyteGAFrqyBSYMU3bdPWEQI1CozF5Y7NIH/ZAs/YQYqODNdFjrYEdJT6aHONJNuShkY1QTSkQ8hRb78GgJJ23TCbc7eYu5+TLsJo7ZaYvI3MBGFZNMH80ZFjIGjN1f87pTImmPKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742298728; c=relaxed/simple;
	bh=LlFQ6OvYGbUt6MCGuSx23PZIigfDNBT0i4vyidNAkp0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nkbe9fOQ7tqF8oJsePoJF7t+d/n4e0T6c18C4L6lQH6V1jQDZOj01Jkpg+zdAWxK+qTu1fbriHV2bdjHRZ+xwm8y6iSKJKkVtxa7/QTrgHsZnGq42hCzZ/UWbiag9L1nBJsSeYcbfZwxJDKe/eQAGLmMOdH8zjVom140EsnodhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PO23g+F/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PO23g+F/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224191d92e4so103907125ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 04:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742298723; x=1742903523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqQw43mLNdk4RGf4hzRLUcoMNPzaWJ7WBFpnNihOCEU=;
        b=PO23g+F/eZcQlAZ8txe7sqOTnjDJplkAwOzifiJZFW/iMH4cJ/kx2fr5rd4Bv1c1yk
         USbn3OG9++0Riys7UXMCZ3Enrzt/MuobDGOyl8hHYkIoRc0dfX5EAnCwI4ALNmcaPsSQ
         8Oz3W5n1drLJwXXe2kJ8NhDxV3wm7WvmpP6wwSC9OwUuAJNHdba1E4GLg7xwRtZMGSAx
         ogp63+0gg/9Hm+dHy84hE+OloMgi6lyIsk6+BDFbVJJpPiZcT3ChYnhPdYCLDOhM6Lta
         VnhwE02KhNlUaEmnZKEDOlMFJFVG1+RgGFJDnncC2C/k8eba6ayZB6Y6/rMLPe2CUTx6
         nx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742298723; x=1742903523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqQw43mLNdk4RGf4hzRLUcoMNPzaWJ7WBFpnNihOCEU=;
        b=G0NdaU9ozDRwZM+tGMEeievNJP5nnJOkfdd9XlAEpNfnikVuqVEhrXudqM3OsP4Z/w
         CKZiHFdl91hbdjTtrf2+esXARxsBnoNvowVYkf0z7r3xH7DmKWTmZ9h9INjTjxnkLmf+
         HiSnZEbR2PDdCSfGSqfAC8fU87Xl7tQlW8LfBqLZLAs+EvBeD9MO4bHQf7kQJrceMXQc
         DQqvlXj5eSZ4QXfrusig96lIiFsvOd1dhn5UnX220Brrw2delUEZCpRHIxhUIX0fXVU/
         GXrhoKIee8HEgGhDzc0VfaXjtxxDVagYFuH48CQ5aWumt64HPYviRphUJWul8b9XKpz4
         by6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIab/WZX89CnsJN5oZYZVTGytU1ZzVKptT64RelLRqii5g4/8xkACdK+cH+WwrLvZfwYzEKLch1AwjlIxR1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJFqvpaCZQF8bRkYVtepE7NT/eBy3gCZwtw37khL6D5wtdfOn
	81VHaRmRQv1hRGEwIHgzVkfK/cI8MBre+2K/aqRET6U5sEm7FG8y7UWeHb8mWSGLhsbBIfsHmPl
	F
X-Gm-Gg: ASbGnctg/fLGLx/OaYWpxDxSk2zMqFODblgU3Vd5F9lr7H6ku3mJyd1tBeRea/foRS4
	M5hRROryc1eAya76VoIui9TaBERQwCOnXVSW9LjNAMZMClx8lYXMpSSov5xV5O0P4SOncfVpHIr
	M7U3y0o0luoLn0M0wkLMpselJr5suhLj7bSBNo5LrRyH2iX2+x3tjdhAegbHeUNyPQaKu1BFyFm
	oQW9dwJxJPdFN+WCzCLfCMuxK85gES4cQCE1vmar0eTHWgAYRXF8r411tHxRUTK24GYmE2rL4vn
	ATtIE5PpCMOwe631TY4VNvzwO5la5PS4hluospAqu3b7FA==
X-Google-Smtp-Source: AGHT+IHR3Ra9GbL7M0mpcaPU8xBsJRCbItcu9BQ6LIdVNRTHi2iS+SQD83bYoZBSaU1ohrQWzaWstw==
X-Received: by 2002:a05:6a20:d80f:b0:1ee:b8ec:7062 with SMTP id adf61e73a8af0-1f5c11e5dddmr23171575637.25.1742298722889;
        Tue, 18 Mar 2025 04:52:02 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711557ee8sm9669695b3a.52.2025.03.18.04.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 04:52:02 -0700 (PDT)
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
Subject: [PATCH V3 2/2] MAINTAINERS: Add entry for Rust bitmap API
Date: Tue, 18 Mar 2025 17:21:50 +0530
Message-Id: <cddb90075c7f892e30f5039c3b3d14e6a239d915.1742296835.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1742296835.git.viresh.kumar@linaro.org>
References: <cover.1742296835.git.viresh.kumar@linaro.org>
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
index 315cff76df29..c55db52590cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4026,6 +4026,12 @@ M:	Yury Norov <yury.norov@gmail.com>
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

