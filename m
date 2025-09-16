Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3751829D26C
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758027685; cv=none; b=JTyRO7B1hodo60iAnASSg7xYGmJFLEvUEROewwxulUy1umSC6ACuo+e/g8rPme2CUPIoteg98e555HyA1gUnqlZY2gEFSbBWFn2Ki73Cff7CwRzuX9ddZ7wXFgnR/uRzc0F5DF8tx/ab1cH8HzK1Kr9+j3tKcGRJ/TmZozu31+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758027685; c=relaxed/simple;
	bh=ijEVJ3RCDJHNXQSSFS2h6wbG7e51k5u2dlJCJBgiy94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TvFJwZfGDTVHoSMQKInuhaRImQE/PkecBiYgk8ZAfJZCj0SWuEiE+91QQ5KiOaUo6QN0i/ltaQwXK4FOdHsLKO8voOuKErVGohUswnBqXsPbUUNquy5Joai+asc100FmKpD72Sm+l9HnwVqJsNI0+m/rdhgpvXkvU0dGM2W7B8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzEv9oYr; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzEv9oYr"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-32e1c68d806so2088993a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 06:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758027684; x=1758632484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RP5wUBXQx/eVCQg8WvT3qU6fnoKH5dLQkp1auUt9HmA=;
        b=fzEv9oYrGOKxnRLT+oN4dF5WW2SwbOxcL16eJfm0vD3p641F+CiBkkLqufh9O8p14h
         xSV8P19Er6Qlf+s4K5KVrmNcsw2d/p+F4QwMc31xfqruEzeSdQJxEVAALYg/w1N0eZd5
         Kyjc53TSLPmolVt5fIh6BOMlTvEviBfsIiYoTiSmiEUXxdFAMvjOGiKGqn4rxkXH0fpz
         1Y2emm33TeEaq6xW2RXh1CjCRhB5xkc+4CtVDvdj3jIUl9nOgnyIeVnb/Qejv4zPL9iG
         GOZF7FA3flN9N9Nzb2kYXPCNv1XYc5fKtmCdlQkcasFepJHharhD1r7WDK6HCMViFX+w
         wX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758027684; x=1758632484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RP5wUBXQx/eVCQg8WvT3qU6fnoKH5dLQkp1auUt9HmA=;
        b=uMzUI8y+vzIRjdz6Hl5LoqLA4jeyZSLmWOGT4QWBvq6Ylw83Tm6eQZHxs3lvWCzrYq
         +0hkHOjSX/DdjJMU9gS9be9+5emrieOORkKfv9ZwPvGV6DpK1j81jMCGHJITzQmOMb5d
         jMDXZklBXXYLJydED6XjoozJQYCrhEUdPLEzXuU/X6zlDCvfDpyOeink89wyW+gCq/1D
         yeK2orACrik48Tlhon7d4AYr00KNaK953V9dsetyEo+imZ3Tw4QWAOaL9ijIBe/I0YCZ
         IUO6UhohcrvYfbCiLMoVbTliI9KpS8dBtdAfVOTdZuPLNrLu6vy4mfLnNbwj4cQJkOv8
         RR8w==
X-Forwarded-Encrypted: i=1; AJvYcCWf3MnO7S7OLX0D2alItNgaEUTvT6mpZTv8syFsID5+1I6dAnyUUmzOWtfebpmy6HiHD/4CeRVVcTWanaqPdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNlaMkePAWrevuEwoy0ePkvLy/90W7u9PjHCkrrBsL9mhV2GAr
	b5cqFI2TceIhJJyRJGugJ3nlJRH7Uhy5z2H82rcqhW4z3a10SzmgblA=
X-Gm-Gg: ASbGnctEl9dykELB4fjpgnn0SB6bRQ6bNM08KAR1LTfjwR2pSx5vOLH2ZK6o2f0OKfS
	urCTknXAnSgAMcrrrcvwmrFQeb6upYomRPgd7lwxeDB2YqybLiqK/gyTJYk0GUTVXnAZYr2eO4K
	FM1RuCJvrZXCzRBtn5K9U9X5q8swQ7uaxyu3QUgAZLP67oThdV0ZCMlxKvTSUdJx2QEocBz5jub
	ga/cFK8yC5gtH+1DMI43/ZpxxXyjZkoDB9F5pJSm+2ZCX2eilNG9RGLwjn8pWwFmM+w7cCOnNkD
	LGzivxgiDV7XOzUf0n2lSaAN48GwGd3VNHibuZOvFzMrIo5E9QmdQGSazApMvj0bs4xdIuYoCui
	apMkxmqdYK5YAMFq215bnzmbUQb+RNdFXkU7Ua7vHZKvAuGcQElv+VKsxot+a9KS7WgpqZMN38a
	UjmbYLRhuc6PUU3TvgMNJH+vXV75BSLUo=
X-Google-Smtp-Source: AGHT+IEC7TPSUCMJ+hGpDzxTsleVcYPGSvPYPtbVhAREzZU+U2F/nc42NnIvVKgmDSI3sK1x+yqX7g==
X-Received: by 2002:a17:90a:d40c:b0:32b:cb15:5fdc with SMTP id 98e67ed59e1d1-32de4fba102mr18651053a91.30.1758027683204;
        Tue, 16 Sep 2025 06:01:23 -0700 (PDT)
Received: from codespaces-8c10cd.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32e1e5ad768sm9345943a91.0.2025.09.16.06.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:01:22 -0700 (PDT)
From: JaimeF <jaimefine6@gmail.com>
To: gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaime Fan <jaimefine6@gmail.com>,
	onur-ozkan <work@onurozkan.dev>
Subject: [PATCH v2] rust: auxiliary: fix "initialialized" typo
Date: Tue, 16 Sep 2025 13:01:03 +0000
Message-ID: <20250916130103.22946-1-jaimefine6@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jaime Fan <jaimefine6@gmail.com>

Fixes a spelling mistake in a comment: "initialialized" → "initialized".
This improves clarity in the documentation and avoids confusion for readers.

Suggested-by: onur-ozkan <work@onurozkan.dev>
Link: https://github.com/Rust-for-Linux/linux/issues/1187
Signed-off-by: Jaime Fan <jaimefine6@gmail.com>
---
v2:
  - Fixed Signed-off-by name to match From: line
  - Added explanatory changelog paragraph before tags
  
 rust/kernel/auxiliary.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 58be09871397..129eae8ff2e7 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -317,12 +317,12 @@ pub fn new(parent: &device::Device, name: &CStr, id: u32, modname: &CStr) -> Res
 
         // SAFETY:
         // - `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`, which has
-        //   been initialialized,
+        //   been initialized,
         // - `modname.as_char_ptr()` is a NULL terminated string.
         let ret = unsafe { bindings::__auxiliary_device_add(adev, modname.as_char_ptr()) };
         if ret != 0 {
             // SAFETY: `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`,
-            // which has been initialialized.
+            // which has been initialized.
             unsafe { bindings::auxiliary_device_uninit(adev) };
 
             return Err(Error::from_errno(ret));
-- 
2.50.1

