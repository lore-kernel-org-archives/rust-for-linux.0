Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202892DF138
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762285090; cv=none; b=Q0D4mKRdWwyWybjPqrJwSUlfMwHZtVQq1xQmLcfK0+U4vUJvyHUZh3Axk/GUhMBxPENdYq7dEQNT6/4Lw/0O00OSMkBfRqBjGY4pbKdD9kFoNNYrJF61PeObCH/kE0bep5ws4OhCbO1TpkCFE6Kr9x3SaTO4HnP452yhICdIe5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762285090; c=relaxed/simple;
	bh=5W8zvHEGFk7W8lcQQ51BUT76U5kQ6osgcX9DQnxB/Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1/4fVc55R8qMpt8ds3Ba5rt2VHCST+bgD4bhys8sIMGqirvxEer4KHdTL8uR2/UVIYTzEb0i32lMkf5BeWvdx89jtTfli2JLML0yFo9qXKLlyOvPjwMYbyTfAduQ2yM9fV8TtLXNn4uzmcbuzXUc45/4nnGp0pIgz75QGhEMpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YO13qzGY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YO13qzGY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47754b9b050so9398745e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 11:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762285087; x=1762889887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+vu3BFi3eMkE8uZDd0o1RrqC7gSQvZv7E8xHlJ1qM4=;
        b=YO13qzGYagGV3Qe7yiMsMTnKPlD2qIs/XToDPOdCAXGsgCcFMhKKFFvke1HQZfJ+G6
         D0F0YOeAab6njCqlymHHPaU4+U11aUwgDsZByiADargQT2AWh+cO6PbZJG/Q4nbNFBZt
         SW7zNopxEBqCb6JU1BoSgg/cHFzjwoBpjvT6V8SF7CIVdjhe2Z0Tcr3zLCEsSGCF6nMQ
         /C4OLXJYkOl7yNkkYRhxjgmHhsptIaNAqYlxqcaXytWHrHpML/6SPqEN/l/rkKfTVxVd
         Fxt6cpdeNEShRapjJo+2CRZ+GZte0RA8crNERH25U3FmCN5qY2SwdZ0H1rMfBmW2dDQm
         d2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762285087; x=1762889887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+vu3BFi3eMkE8uZDd0o1RrqC7gSQvZv7E8xHlJ1qM4=;
        b=KxsxtUmre6yUO32X5tYF65lL8d0yHni25zfU5ZsVDpviDSjRJcSVQXPHRrT7Kcz2rh
         OrwuNArUyZbnyHj8dURiuTo4dP2gGZBLp8Xc7FquDiHOVIYPPDtl1aoNtucpGONTZrCW
         6FzxewEMQdGlq7L/JBbMPxIpa4PD0WZLlPiZCDRuKmwfxxfrqOSjRzuxvXlswr3DgLAN
         wQvEA1P3RifRBSerBlbcVI14DCluaN+P0D1wDWgfaapxIlpgo5xk0hrLAuejlDGLOO8i
         tdqzdOx91n/+uDx/rsGU5KxsoOZgl8lGQvVPrdLpAPwhFtbXi5qJMTAabLdN3wVZan+v
         EdzA==
X-Forwarded-Encrypted: i=1; AJvYcCX4wEcetu8agdS+OIM6rN5PsZZ7SB+12iulsbue46mb9p98RwsisUdQJU6cnddT9fWPBfKYKDmsMxTsNVRdxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr20YN4MwcwNZ/5HcKdkA2bHY3G0go9eHwy3KSc2+SwwjzRZGw
	pjH6LG/vgGefuAWqFr2rt1zqn02UUhD/8MzkL7zv5mLW48DW6f1AzRTE
X-Gm-Gg: ASbGncvpOXDgmQ8vrEGP4he9TvKAlRay1fyTi0Nop/mUcvwomqjgV1AvBkkWMikDtA4
	BnEEG/8sqYqKfHRFVHvD+M3ltQT3iXE8/UB0MbY5wxYzgl94V52yasiTKso3kxDJhn35dJ2tN0q
	KbC2dsVv7EtRh63lSYu1ReoE3ktckY+SE6qGpGuYzItpjRQXLWCbg7vveSuJFUvSCqgkCeyvWqg
	S7X/fSkAemHOsfip6gqBApme/0D6oSqx3lc+YA3Kkr71cs/RJ8exbfqrnX6Is2fFIxvIWL+HOeL
	uZs3jkkKPkrjogmBDmkUYpDEBqNbSMz4S3Dr+Ttmus3BpUsWRLbM46/XxkqMt5M9Gh8TJxkGjTA
	eOVKAJJuUtF1jtuHSShA36NIVbxZxUyHttkndFkqjoF/rip5qBzqFFD2FRtry3623s/PnfhKjke
	Q+bgk5GATNIcjCgZPMuIx9S1yU6Txl
X-Google-Smtp-Source: AGHT+IGSD5JKDCdaTTmAp0MYMS91XvkPp8oz/dP1zmqG4g5rPRzVgWr7fySwvEo5EuPqrlAAIl7B9Q==
X-Received: by 2002:a05:600c:4444:b0:46e:477a:f3dd with SMTP id 5b1f17b1804b1-4775ce2878cmr4985525e9.36.1762285087353;
        Tue, 04 Nov 2025 11:38:07 -0800 (PST)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce3ef38sm5549195e9.17.2025.11.04.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 11:38:07 -0800 (PST)
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Subject: [PATCH v3 4/4] nova: Update the nova todo list
Date: Tue,  4 Nov 2025 20:37:51 +0100
Message-ID: <20251104193756.57726-4-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
References: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small patch updates the nova todo list to
remove some tasks that have been solved lately:
* COHA is solved in this patch series
* TRSM was solved recently [1]

[1] https://lore.kernel.org/rust-for-linux/DCEJ9SV4LBJL.11EUZVXX6EB9H@nvidia.com/

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index c55c7bedbfdf..35cc7c31d423 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -44,25 +44,6 @@ automatically generates the corresponding mappings between a value and a number.
 | Complexity: Beginner
 | Link: https://docs.rs/num/latest/num/trait.FromPrimitive.html
 
-Conversion from byte slices for types implementing FromBytes [TRSM]
--------------------------------------------------------------------
-
-We retrieve several structures from byte streams coming from the BIOS or loaded
-firmware. At the moment converting the bytes slice into the proper type require
-an inelegant `unsafe` operation; this will go away once `FromBytes` implements
-a proper `from_bytes` method.
-
-| Complexity: Beginner
-
-CoherentAllocation improvements [COHA]
---------------------------------------
-
-`CoherentAllocation` needs a safe way to write into the allocation, and to
-obtain slices within the allocation.
-
-| Complexity: Beginner
-| Contact: Abdiel Janulgue
-
 Generic register abstraction [REGA]
 -----------------------------------
 
-- 
2.51.2

