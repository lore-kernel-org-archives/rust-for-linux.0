Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5256037BE64
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 12:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107818; cv=none; b=SM49MkhrtVv23ddbBn7ry0hbxkDrdbE58lSs3I2RGWOmBl1WbXrms4Xa8EB2iTIgWRIxBeDjG+Qr/dtkE45RqRcdjUUfQaO1vMMfPWi5JndXiMHU8CRSGgtm32rJG30vuo6qZYy231P04RDNI2jaaBJvjzwfJ6wyidmK0Iau4cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107818; c=relaxed/simple;
	bh=fEd0t1V6bkOZttyrDh/1JRorwh9mWZ48DdawWXYzJvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZyCSmM4j3f0vhCp9dE7uJKB3PNNdn605wkmtk/iokGYmZN0IvRRiilcZz4GzwjdGsQ28WzyzrRCbDGPw1LQNY1ZcDK0OJ4pTjqSS+7KABltRpTSSZHQggrQ026pxVOdTTfR8SX8wBZiGWOBkpSI1Z0L7QEbdU3jmYp2+UgpktII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJZtIaWu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJZtIaWu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a9296b3926so6023775ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 04:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772107817; x=1772712617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WJMaL3zGQA/HaZ0LWiZYoTYzh8nrGdpaNK5Wc0hqnE=;
        b=TJZtIaWufkznpNk2W4PtuUw3qB7gJz7IusplQ/8vRvj1/T6zAmgSSxWwUee7lsDW7U
         LUxGYI9SpDDxXfb/7YHXibgNACDr6FireJ6dUCM+jki5SOU6yPwKZDzdH/PSmWB9gLyc
         mHLdnL6d0Akk0frjDcnVtR5R/Jntcm+fWhddsU3Q6HXdHSrIcNGjjYqDU2OrJMBTe8T8
         Xui3BHlZhsf/mNqhD94EQFGbG8jeuAZjT0cQ9bReCuimG6tXDzUOpS47YjCfP6KJAJ7t
         MyM5sIRLZbx0L6CalZmG1Fb4Cr+FLkktOgWN71pUgSeVrMXxNiTD0ntzhb8KVtWe+43n
         pM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772107817; x=1772712617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7WJMaL3zGQA/HaZ0LWiZYoTYzh8nrGdpaNK5Wc0hqnE=;
        b=jWk4uSS+QkPhJde5AlXopuO0tjffW/zFUCJVoFVPExQYrKWvqt8/9odyg5K40ybDuj
         ao7LEjl+JfG3uafGHf9Bc3J3iQ3WABWFccEh88suDMaIXmkmhM2F+BY7AWZ/w1KDccYI
         +Va0qfDYk4HAQ1/HMQkvaDQB4cwE91fh07LGbuAn6qrbkpLbU7nnB/xH3obR46IXO3sb
         nHgULnJYlEMqBu2bG55eNJrNUyC/eoaIUlRZnMOhu2X06iAAL+KbJH9/qGXQ0oy4TQve
         lKzCiQUZwB/iMuAWV7u21iX7Yuj0FGSe89qvVyela8huiWXeXKF22a13q5veD82NBQKr
         APWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqzeBBHlAULW4kDjKQOllWao9pay9BWMH/ukegn+yaVSPXj8fyKNRS63rrd0MEsRjLcJlIggrXuTMAaNgE9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvtDlAPuqK1tbJZ2RRpCjnLkPA27hwH9pP/ma4fI3GUnT21Vl4
	zvMBjIUKQbXq1bpOBjYKWQKpVG9Zbkh91YQ9q+ek0EssahYgp9Aqn46Y
X-Gm-Gg: ATEYQzwsJ9AfRFWwc6WdGCHG8I2LtwcjUBcUKFOu1lqmqLNAGzcSCRQeOJCNI9BmMeu
	pVrXdPWmSlCuveXNwAZPfQobpH4V0y4hRwk49b24UtBl/zz1ZM/oyrclVHTFXqeKdRIyHSK3oll
	LRJfK7d/j6YO1hz2bPZYSEtfwX+L0oZZLB7IKlXymhgrC9yEO9rKI1wrvMtsAWDraNAM4gzKTe8
	mnajzqWE2hRnoKof8EtnVwfPakc/V599y8sxi7SqxHSqtjxOUE5a972hwjiuT6O+wyp092P4ili
	c+H36ddPXSfazV9K7SCb0Ng7COpWLmayFhNSFWvV1B+tWggjhM0foxTt1LjepB+cGE/jJzgU24o
	UaKLzkjF33JO6QgERUWxqC0xAVUkocBJDmpoizNr/6kqJJ//ho4TLcJAvkwaif6fWsurZ6rzsw0
	vBfAUtVHfNB6aB6J+0QyTEJDa4
X-Received: by 2002:a17:902:ef49:b0:2ab:230f:1cde with SMTP id d9443c01a7336-2ae03270d36mr21866685ad.17.1772107816533;
        Thu, 26 Feb 2026 04:10:16 -0800 (PST)
Received: from archlinux ([103.208.68.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6cd476sm24199525ad.75.2026.02.26.04.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:10:16 -0800 (PST)
From: Adarsh Das <adarshdas950@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH 4/4] rust: time: add `pr_warn_once!` for clamped delta in `fsleep`
Date: Thu, 26 Feb 2026 17:38:48 +0530
Message-ID: <20260226120848.82891-5-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226120848.82891-1-adarshdas950@gmail.com>
References: <20260226120848.82891-1-adarshdas950@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a warning when the delta is clamped to the maximum value and remove the TODO comment.

Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 rust/kernel/time/delay.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/time/delay.rs b/rust/kernel/time/delay.rs
index b5b1b42797a0..0965fcb6eb80 100644
--- a/rust/kernel/time/delay.rs
+++ b/rust/kernel/time/delay.rs
@@ -35,7 +35,7 @@ pub fn fsleep(delta: Delta) {
     let delta = if (Delta::ZERO..=MAX_DELTA).contains(&delta) {
         delta
     } else {
-        // TODO: Add WARN_ONCE() when it's supported.
+        crate::pr_warn_once!("delta out of range, clamping to maximum\n");
         MAX_DELTA
     };
 
-- 
2.53.0

