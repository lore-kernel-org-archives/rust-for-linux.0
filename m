Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5579273D9F
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 20:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252722; cv=none; b=YZI8AgPQdJ4qb/wyduuDJMg028ZIBOc0doEn7CtCTJb8mlB7tFccKAxiK2Or3wlyOPDyrdoy3+vwbSRgdHy636omzKoIkY3F8/2Ql6CHF26Ahe2HkfTaL81e8S9CysfM8DqakrFVhvFw1FoVKYzGciwRvNIRYGuz0Bac0fkR5V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252722; c=relaxed/simple;
	bh=DJWdQiAIjZ0x6xqn9K9EvnwCkqDW3FIUIy/iqVqJsi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUjr1n4WpseWq9sf21mqspH4KL7/ZXmkC6rbnf7GtvFQIgGlV+UqHWcs20VCltQRJ2B0YbnZFlHwrJqb6xPw0NHJt0ohdns6UEZR02XVQtK7cHGeMiuzvUNDzsqOn3aWHjPSjPJXRkc2kjpQ85zOThM1sJFA3JRq/G4z3bvUSfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f963R5Xu; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f963R5Xu"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63c31c20b64so2380396a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 13:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761252719; x=1761857519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAPXNY+YzoexJ0d/TkSSgHS667VNidACYdJWMiQnzPM=;
        b=f963R5Xuov1yCJTSjhUsZPQdZTWaANJlOonkvPJzJwL2lbEmqg6vC+3dnA6Gc2o5fK
         hdCtG+N2zcmwJBw7X+bfetDlb2f2Xjg4R81fFMetWBJMV+LxMs+TRd9SmwzeTpqc4xOB
         L5q6sDtJstT1yHmrycq6DZhI8D/Znd6agJPlO8Nq8SxmOq1n5CebBp96kq1CWlQ3TXkt
         cawXUyD2pUvE5JVZWPh2DzsmlgEm3m57SbScV/Piocnvg8Kg9JiGB6iobgjeIBCERfsZ
         D8/bhy3cV4X4JNLfCoSx6A/+nCgwtg3DyVlbn5SwXjySQ0S8WAKyDmfpSZ/edsqx+QLc
         1uGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252719; x=1761857519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAPXNY+YzoexJ0d/TkSSgHS667VNidACYdJWMiQnzPM=;
        b=uiJ2wYrOfv6m4F61kpWjf2mDY0AIoCSC/9eKHrmJPk5/jM94ZGUTeZlfYtGapUMs6d
         +2JL59uIYUrafZXBDevcBw+fAhGOj4YmRdS1uvs7RYRfrEv6k4qGJtgAQ2n2UMWBdWQN
         6ZKCCnhJNo9NjPtjboXy0edcoYrJXBVK1zSQNRc135PJdsBxQ2t9Y/B87YkOQtfrXVkl
         GbU3nXA11Qil+hX8ZRboG9+YO6DhXyKrV6eEaR2gjpWYa9Wiv9oYyxxDKTwlwjwHu5H+
         S4DEyZncf+zmT84jVkPzQ7/NemQXv0kig7SBnfmTUz7VCjfzTCYfQw/Mzg304ygoGSU+
         FwRA==
X-Forwarded-Encrypted: i=1; AJvYcCUO2KudKQb/wN2tI7Jz9ZMheZ/pwuaH4VefgyjMcqfMbJ4PccqBcF9EJ7OqCnpRkFRcrpnABS3jDUvyveKs7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp+g76m/8Nc/zZGL2rzYm6PW7lXpwJG2qZhh0MnkNSzLV49LDx
	vRX+9KKeBPUCJTjw/GIt8n+lLgjfHnr+HsALOeiAJkGGNkyuvlhjIxlh
X-Gm-Gg: ASbGncsijruy+hfjzenWWLNOvpY0AoWqhmToQTPVE8os7Ij9+BZvopa15ECVxJKnKnH
	D+3PmigSO7vLP375zcZxiWb/LhB1KLJBOPu8jGZR8U9AeM+sKnsNAUbyEAMH6IGsOuj2JVUV9jR
	OkTqh+hf+7z5ns7DWSv121/IbtXvPMKFP7UkwpjMAFB5w2d/7e7x2fPe2SkzEencvxtVdf2Bgky
	jUxCOUw0lXVOQtY4T01WmC0ElUw3bPQ5mKL1lurwfl0IHFx9GRFLzzCB5PJ20kfAIhv2vLM8LOj
	Z8iT+qdql7w+ricEYL5LkOq58CSlkyo8Ui5UdK598OCLoAXis/6WOSSv/9rtr/nJ5Tor9l0dO2K
	SsJ0TKEEpVTxLOgTPiHcaEk7vqAFTInmudNyOYtnI60eB8QjFGu1lp5b5hV7voCsbxBqXa3TeGu
	pRZSEnSu/hwz8x/UUYyA==
X-Google-Smtp-Source: AGHT+IFOkN+DkcmLNJzRNIqysto7sYM8LlsTGTSLlhGfULzr9KAi+B1XnIznbLvzFcpxukEGtb28dQ==
X-Received: by 2002:a05:6402:51d1:b0:63c:3efe:d996 with SMTP id 4fb4d7f45d1cf-63c3efeee79mr22748502a12.20.1761252718877;
        Thu, 23 Oct 2025 13:51:58 -0700 (PDT)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb3299sm2564120a12.2.2025.10.23.13.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 13:51:58 -0700 (PDT)
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
Subject: [PATCH v2 3/3] nova: Update the nova todo list
Date: Thu, 23 Oct 2025 22:51:37 +0200
Message-ID: <20251023205146.196042-3-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
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
index 48b20656dcb1..be8063030d44 100644
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
2.51.1

