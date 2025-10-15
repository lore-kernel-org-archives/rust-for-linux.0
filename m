Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C702A306B33
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760557840; cv=none; b=YRDvQSzfWb4rw4OWkPZ804h94RnjlOPZiG3205J1ThWAJ0pvPZPgigWyD0M8lRIUKMH+oBb3HMpEX/IEsOFu3esA4tqNWXx4PgeWKSZkTfuI3yyPS74FD2A4FdgwYPf22PvVFgqVnHaPEI2DWDKL3i+jlq67w1NLZM8MG9RKT4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760557840; c=relaxed/simple;
	bh=2Y3BPewHzoxQrWYHdLQuOQCO1qXQbSKpHm7OmAV1I6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruvUzPjTCujez1Bm20b08FcVtIcnTUwEcadX+kuFAt1iWyEees40/rK0OMk7ktudcFnmx0B03K3kZ0+tZSW6785hiP2ow0tTSOIL6c+7ml4kajuHpi/APJbpcGMU7qcz0gS/LMeDaRda3nWnZwD9DlG0xxQiBnqFIPwf+yCp3nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgPPaw/4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgPPaw/4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-426edfffc66so991221f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760557837; x=1761162637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFRVqaDMnH4SBXpwWtqNUxjwC6dLm5pDnJjbqzI+Vnc=;
        b=LgPPaw/45pnYGQ7yfDSNXa9z2rIZetNGGnDfEbET6l+bCMR9eBcyZ8zkcxGT3Q2nAv
         oqpi3MBObFjD+kAqXMblcMxAuPGfo4mTZxSK1jHGjnWPe7OqayWJ9jegJG6IxcXY2nlj
         6IXTGd5OcX+X9oDnnBF5TvjInf4nVtmG2M1/NWcuboioOnNHSWv6gi72Y1UBVqalOW0q
         m9tG9qTJLg4zI5G64XshZTfTjvT1BvdqehUMR8brVsEbZ0rV444ft0BPE+QhtUWeYF+B
         9bs7Bj4MAcOVQBZNzDvOqthX84USGVWuXU6MzBA5qLbrO9KZDYrMt0wa7LcmI5kFw29p
         3xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760557837; x=1761162637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFRVqaDMnH4SBXpwWtqNUxjwC6dLm5pDnJjbqzI+Vnc=;
        b=E4lhh8D4QGHSjEcHTADPmMX6bNOIS7tBojf96VtsF8zfzIja+13mAKPm+AAfy3KI+Z
         ugBrNF9JKyJT55le87+c25/GwMFnA4frDdn3Jd8BdOyodtTfNY7j8WVMQLMFULOdbiwt
         x3nhojf4G8ObukEHYSfkF03nvoRV+397hI948hj7LwYd7AviyvEsmPeb4vXRuNpW6bVv
         AuTMqxp05c4OaI8/fyPJ0rGSnJEQTq3dmlTV+9eYoK3F971lLDRB2+MD+q92gK7k/dtZ
         WeVMJDAMro1UCbxOjzXw15qFeJGEmJAZWcBCQsLvlNN4WUg0uydJDfnrLdH/ytjCjCUt
         UhiA==
X-Forwarded-Encrypted: i=1; AJvYcCV6HODhyMZnZP1n6aWJi8sAGIR5tSidlBa5p55jY/5dj5DU9VvMxLYTuaXiXHNlrtWI9XDn0b0no62AcvxltQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1tr4fnTR0oa5q+XxYI6Me+DcmqbiQTMOmRBrjdQ9Haml7TQeK
	NaHk/spXmbJzjxDenb6RvymbPH7QMRwdnkj9iI0FzJ07NzYWm0PuMoPI
X-Gm-Gg: ASbGnctNkccGXuFxEY2BjXbNrgC46y+OSlrabOD4/Dr2lyfdheFEDbyeT14UYokeFPA
	/0Pc+jLihW27JF+6NeS0Gs/wBQffdcp66wvcvxyVg+wFM8sZRynsvY0ZkmxZj85xMbIf3SLRtqD
	1gUTC+cqZGRX5gZYAvzeQVwzPMxa0WkU64aZzDdnlpuxHkbbqJLh5jx+7TOkXJSa1fCLf/VHNWS
	6XO2hveLUXA5z4DoPWkJlyfQgpSJkLET/62us1eZ8DORdYH3OzKjOv5AeIEyYfP9goNfPgZ5u2J
	M4diGKJ8RtHcM5AyXdx7BTEWGfWT9A11v707EyaYxqhkl2Zq6iVvwPIZjt+jo2WgWVyTS1YlRHE
	3GOQQk7PoU5dFtN5ukP4vOuShCI4V/KvBoQVFtn55N7z/vPWFhNvLk+0cHvovZOjVG1BqQ7lTKC
	HtA62y77KY2VSnHbk=
X-Google-Smtp-Source: AGHT+IFewXtBswgFkJ+PxuKCQAic+eavwTJGRRYaxnccnJwiMsIC69bQdFW+noWi4hvllo/GJsJtPQ==
X-Received: by 2002:a05:6000:40db:b0:3ec:42f9:953e with SMTP id ffacd0b85a97d-426fb6a7131mr971099f8f.7.1760557837106;
        Wed, 15 Oct 2025 12:50:37 -0700 (PDT)
Received: from archito.cern.ch ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm281464675e9.11.2025.10.15.12.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:50:36 -0700 (PDT)
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
Subject: [PATCH 2/2] Update the nova todo list
Date: Wed, 15 Oct 2025 21:49:36 +0200
Message-ID: <20251015194936.121586-2-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small patch updates the nova todo list to
remove some tasks that have been solved lately.

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
2.51.0

