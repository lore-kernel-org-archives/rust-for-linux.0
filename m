Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A931F236B;
	Tue, 21 Jan 2025 19:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737486889; cv=none; b=c4AGacol/EtVoazKYLSd4LSWN4baKBDDLchJKHBB5JxVouuXccZEI85gfaB20lImHE+fN9xqNBfOqL5GxkTM1SbmxKnZ2TVKvsmg3pj7xDZpA43wf+OFRPUNILpCLO7aHmT1R568V1XQ9+clfwQPjuVlFO6Ixje3QXAA/wyE4P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737486889; c=relaxed/simple;
	bh=7y/5voRRl3iVEWd8dd9FMx/aIm3fFsPYaagWFci7DeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gx7beSBu1Xqb99nVIS9s2hqtsORNTCNZlhGHBi3KDikSTUuJ6gmeYechTa/BNnmiZg4V0p7+KctHnG+xQ/TwOr9gLGh1CUKnqmUEGDyj+fpohb4cxPuLGDwtDZeHqVI6pClpRqQN2UKUpIc7jJWVHufc+UAolvI1Z5RDXWTcdg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dbre+miy; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dbre+miy"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401c68b89eso111810e87.0;
        Tue, 21 Jan 2025 11:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737486886; x=1738091686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsTWX9yoQTMgLsmI/WJU+pLJbUvjBW8MdXlesjuHNQQ=;
        b=Dbre+miy4ydHSJPTZJPfdk/M6FxAlz9BUTRVDdC6MiaRhZKPG46TG++TFL2cUfJX9b
         sMY4ohokbVofRcaEMaB0BaA/Z48xzAVYIzWDDISfqm646FRROzahpDNdQgmKLUInGBTn
         KBjbXZWFswG0BkmdDYuOJKzI5XlY5rOUVVdjFEkKnWQlYmNO2PsAAZF1u5iegtcb7Mzp
         Z3YnTSOxIaNrCB4m6qxmYrfG9ikeatmrFAnzKg6RQP8k+Ang4v9bgv5oBNnRTwcocXNp
         tWR7lvevAONYGjhD52FOMWDELueDvCjryhEqsr4xsO+dR32r6Sg5P8CVgtmAmNerhZw+
         HzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737486886; x=1738091686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsTWX9yoQTMgLsmI/WJU+pLJbUvjBW8MdXlesjuHNQQ=;
        b=cpGY5LL/PZRLEGIol27fUiREndGmOIll6khwFKNEUiyEjB4dAU1ld9tu2oofjMUgA4
         Ph/do/C9FBk1hFAjI47p/9NVPtIflrlzvn9T0gsQNv6o7eG2sM01nGtBdKre0LFstTQC
         67O/mx0NIu7vKvtMD/zhaw5oxONinbUuMlQUrhektaW32iBevh0oqETe+peZ5ciNV3Q7
         bxWnUK1GuAivuXtO8ESvqyfqw5LeQG+ZD07DxXLlMroKnCE/CmvciE1uB+axgcnGVbDm
         NKXy4e82iFAeOmI7Y0iytBR8IsoY8rreZpmVyYVXunYGfho42Ibh0XxKUXjXWtrFP6YV
         CFqw==
X-Forwarded-Encrypted: i=1; AJvYcCURTcoMHvYuvV+NW2lHw0CH6UVsiNrkgTVDbWAePIq0Yz3hpRTGBfxiCd7UJktr2h0OQY0WCTvvthqo4O0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoA2WebfWdBubgKEjzX9YuR/41AQxZj1BPBZtCUOrYB/QW63LP
	WOolN/7LlJ1CClMqJ3U4emeWpdBrcGAyJeELhNe9oQYhDkX1zJSjveNx/A==
X-Gm-Gg: ASbGncsg++llS9FckTj5xPo86jVqloDYSrELPfwLRcOMLcjdP5PLG05qORLToP7zLzw
	tsid6MfX9TUagObyZV8XXy3dWUUJA0ohcKchyPekome8jdLhJwJic7RNJYRcnMmFmgBT67aqtLT
	AZqX+v7SBoRM9NNDjCG9uGzGxUYM3Ze0cJdaedPtWQeBugCRHFnyZdEuwrFjKK0CXhuqI51QFeB
	KiOMnrX6ORz6+7znlxwzhxHvWbF3qNt9OI+Mf2bP3uqSS65x2C01tgUBb0fcnMJkYsA90CXEIvn
	LibWQnX4+c/6w6DDDlTXLZj+W+YJPPXPBHH7ECrR
X-Google-Smtp-Source: AGHT+IF59/6VBNX+P87BsR3FzxtMILdr5WUEu2YX+aOjaC1INxGKfOraQULJOOgZMNYW/Q/fUqvlxw==
X-Received: by 2002:a05:6512:1599:b0:540:2add:c1f1 with SMTP id 2adb3069b0e04-542abfb56a9mr9238213e87.18.1737486885553;
        Tue, 21 Jan 2025 11:14:45 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543bb6bf5b1sm56786e87.118.2025.01.21.11.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 11:14:44 -0800 (PST)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com,
	dakr@kernel.org,
	robin.murphy@arm.com,
	aliceryhl@google.com
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	airlied@redhat.com,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v10 1/3] rust: error: Add EOVERFLOW
Date: Tue, 21 Jan 2025 21:14:02 +0200
Message-ID: <20250121191432.1178734-2-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121191432.1178734-1-abdiel.janulgue@gmail.com>
References: <20250121191432.1178734-1-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trivial addition for missing EOVERFLOW error. This is used by a
subsequent patch that might require returning EOVERFLOW as a result
of `checked_mul`.

Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index f6ecf09cb65f..1e510181432c 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -64,6 +64,7 @@ macro_rules! declare_err {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(EOVERFLOW, "Value too large for defined data type.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");
-- 
2.43.0

