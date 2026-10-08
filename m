Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83C6443C27
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 23:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791502940; cv=none; b=aBdGZPjsWUPQPIYgeyiQG0NJ6SPdo9nOuzIxPSsH/h9bQe4OyTeHcMYazwzNr3/we2Kka3a6PETdisCdn7M0rcL9ihbWbSa5SXiZv/Eet2klR8E/Y8BqQLsvxY2zX2h6WhLaoEYdozVvQ1ZUTXs0YSxOgiYZy7Qedo8XuhR2hZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791502940; c=relaxed/simple;
	bh=+vej+9871giPRJbvbCo4LpvhWgXeuYpPrYqnj/zi/gg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uxQLJr1Gtcw9/iRvncCxemVQRLWvJ9lwgumpoWUCJne4mfS+KlWS35Hq2Elpbdifnta83cA47V2yeWfJ3M4szl+tOep40cpFBmXf2DNEmMyxcmjqnmv7BhG5uHrzoVzSjs3BURQ6V3Ba7zuOR9TCWtCU0NWtubUQ+HyP5Nyy9gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=IcOEXjeE; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="IcOEXjeE"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14129667240so4036703c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Oct 2026 16:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1791502938; x=1792107738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ty3aggzINGexD0CpWAiQ9OLpBPWfuLnh74sRAfhheq0=;
        b=IcOEXjeEmQ1Af2SB5IPW7KaVjRjj8lkcQ9cpf2xc9+XeOqrj32i8oex+rD1Z2zIpG2
         C1lEuKc00uK3tDsTUv6baTMxVHhYTirjzAKHY/TYZKKB9mHonelFEhb/Ug8PN7Nl9G+l
         2Lu4FgGycwMRoU3+0AJV/BglvQqLcd0od1rpR52VWI6ZSZC4NY5NpkbX+k9/ZGbypkBN
         IrCXKbWlQA2kNZHkZkRSsVz0yLXqDG+u7wET1MLxJ1aTPxPO1irHsBw0CZr4irIsgH8Y
         AgrG7+BjrA1kKvyRiKnLhviacqUAFkrXpdbzWmfHLqcuyZ3LQHIj58gAC0ignu2H3rfW
         UVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791502938; x=1792107738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ty3aggzINGexD0CpWAiQ9OLpBPWfuLnh74sRAfhheq0=;
        b=CAEraPZMwMzbrDmbECRHChO4vHeW1uLUegnNph/b/hUBb/QvZGvIiSQaDN3IvrO0OL
         7n/yWxtCPgQEUtB/zNLbXgNVLYXdvqeUGh8ONPBTLa/Z71znda5s5XkSwZMYPrtjjA2/
         2jPffL/EPoSm8iYx8Sr5rF4Er7+eND7iH+GLWgsvpk89HlEhzY75Jrsxcb+gYZFs20VR
         /fCAqeyXo4wlWTbQqV97ODCKb9haurdTEPsoUF4kQuU+qTUzWYjJ/fOd8mt6dc9Pxk+u
         OSBtQGRb+GcVHSX0Q7FqAfVeAItx4B8d7XLOoRTdVwJODR8p2qfhzlG0C3rP4JCIf6It
         Kc8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1CGFSD5cP0mr4oobM1Ajj4Rb2f0Aj8sOd+rNBVJYOSm20DlwCv0XY2OaexQlWJ5RkGm7UGOgXKNFPSVVkxg==@vger.kernel.org
X-Gm-Message-State: AFuF++luY5DaLV6NmJUz88qnp8OvOiuekWFdmROOPxXkAmwEKAWzTRrV
	oYjn+9WGBFTUeX/0oEGdmCx5nC/hFzX5hQ/Cnsg2Ajo3z7V1hoLTJzLMH1oBox7R26c=
X-Gm-Gg: AYBFou0cTg0ec5dX+yxqr/vMIi/OY/8CKakgG88n/gMMsY9c6Ak50+5tD1oJ/km/I60
	jzl4h1T1w4UAgnEnxSlaAWchHRejNLgcxGlLN8udydZCqY7OFnQY/hkKzJEdBqBrGOgPNxnDmDt
	9outblrWrAGIHxVHLQ2YYr7Ntk5xtgrfHRMt0qy99bs6pgLLwrPwTZY9DI1r0cvuIuAO1Z3XUvZ
	BwIbO1NpBzHQNuMI3JR6rKvLUWzIU1VKQB1fCF2SY+IKdmDC8yqBcLcQE6zKED4eGoNLmd7+/iW
	kCo1+5VbFiFPPXyVf6r+QKrAMEJ3Qy0umeZubc09FEw804d8+FveLac/pdsxnlM/oUm+GRnLpWu
	nmk1KcTlwWrzERR9LK+EfhLqQ4AA4a8snRm74ra3tEStt0f+av7WPq917eduSCUib+mCXRWe6tH
	mDNaGyBYQljzazQHwli9fhtYXP5HAEwBb/AoSqxvDyTXp2CLiAUBbULP+8BlyCcGmcAcXS6mnW9
	hQSaTU+VI6Z9GHtsJt6ww2FGRxSMjWJfQY=
X-Received: by 2002:a05:701b:4553:20b0:14d:5a09:5cd0 with SMTP id a92af1059eb24-16a5ed3d9aamr167116c88.42.1791502937829;
        Thu, 08 Oct 2026 16:42:17 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1699718c547sm1483557c88.3.2026.10.08.16.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 16:42:17 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH] rust: configfs: Fix reference creation from uninitialized data in `Attribute::show`
Date: Thu,  8 Oct 2026 23:42:14 +0000
Message-Id: <687438f7767b2c65d9782d92a6e96387e63adc99.1791501243.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790981219.git.pgovind2@uci.edu>
References: <cover.1790981219.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a configfs attribute is written and then read through the
same open file, the read reuses the buffer allocated for the write.
This buffer is not zero-initialized. Writes to the attribute go
through `fill_write_buffer()`, which allocates
the buffer with `kmalloc`, and initializes only the input bytes
and a trailing NUL byte.
The read in `Attribute::show` callback creates an `&mut [u8; PAGE_SIZE]`
to the buffer. This is unsound because the reference may include
uninitialized bytes.

Fix this by initializing the contents of the buffer to 0 in the
`Attribute::show` callback before creating a
reference to it.

Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")
Reported-by: Dylan Zueck <dzueck@uci.edu>
Assisted-by: LLM
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
 rust/kernel/configfs.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index cd082b83e9e7..3a404e0c54da 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -559,6 +559,11 @@ impl<const ID: u64, O, Data> Attribute<ID, O, Data>
         // the conditions for this call.
         let data: &Data = unsafe { get_group_data(c_group) };
 
+        // SAFETY: The callback's page is writable for PAGE_SIZE bytes.
+        unsafe {
+            core::ptr::write(page.cast::<[u8; PAGE_SIZE]>(), [0u8; PAGE_SIZE]);
+        }
+
         // SAFETY: By function safety requirements, `page` is writable for `PAGE_SIZE`.
         let ret = O::show(data, unsafe { &mut *(page.cast::<[u8; PAGE_SIZE]>()) });
 
-- 
2.34.1

