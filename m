Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9692346FAA
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057771; cv=none; b=HXv0LkZpWdZq5nM+zDdqqu5cnMrJuyNEeL6jHPxykUCDOjGdp7/4oehzKHPas7EsyqzJ25smeIsaBYcf9JwKwvXbjiMlUkaOyIDy5qYUNTvHD+ZImRKyfhNFT0YvywuMQVE8hOPQt+dsZ0plwll29dYeQCqhRSilnEVVkc4Tg2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057771; c=relaxed/simple;
	bh=W71manYc49CiWAv2i0/k3IAXEeJXVcWy8Fdli+uPecw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SNifQVWGRjekqNAttX7aVBBipavynfIQOB+CTRexgTBiCNpsbT60VOVFhXKL3DzPsM6OIn8wvfYcqUg9fIXoWlYJdwggz+dqIJ70CWPKBe+maGJ/5nCmU9QIUfTYxO85CrRK/6HkzeUik6MEY2f0zXBltNRxB95xFWAFauASvDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYKGo33d; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYKGo33d"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b7be7496dso3001606e87.0
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 07:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768057768; x=1768662568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7uhurcFR9DbDTq+yEkMv+ps4y/ZlCrnBHcpx9/LZbw=;
        b=OYKGo33dtgLdkgKac80pkbkYmnbrFzqEO1eS/KWpZ4yFjK32T2d2xTreoU50aGtuzW
         WU+wcNxprqAvr15C2z04ol6rrhdEVOwOCWUwQSmud/iG4OQ9lSPZKgvGA6ngiprcp9Xz
         8l5B5loCR9LAykT2P06D50TacVt79ajwTvZGjVXi+PmzEj8Cop77Oz5zSvh1C44IJuWg
         QNWbOB334llV5Qxc0ir2AeDRZcV6t/gap1mjkbTJn1VNDGOpBLq49kgf3NoPEi6WCcXM
         OObSJNYt83hW4JShSY13ywOzNotM34DF5/dVGS6jRYxpCxY++CkMys3moz9fr+R9HikS
         +71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057768; x=1768662568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c7uhurcFR9DbDTq+yEkMv+ps4y/ZlCrnBHcpx9/LZbw=;
        b=OQoUw1UuN5iNf8yYoKMdrlaVCaRq0FYWZQAmmNNv46UUC1j1gfGtyPwIzCbCm20JQy
         xYnSKqnmlEyQsB56aTu8q3VHPlfq5W8DDTBVtj4niuIb4UdNl5H8sI4OvGd5iVCq7Feu
         U0ElVI5EeQyadYPlRlMYQY226Uajq6ljBZ/qUh3NteGjg/uwnKs7fGYh/njI+xBX1ut5
         Jwww6Bigh3cUxpTcZRGiFswzYXJKQ4jPYuds5MhxSM9ZTkw/xK2NaYrXT2A/QJMlHqEu
         I5ByS+4aVze03Xw6gmY+x+op0Hq9wBxuCKqPYJ4gymuswEvLb0lPR16chsjDJBEym11f
         7N7w==
X-Forwarded-Encrypted: i=1; AJvYcCUKlTbWcW09+u4ydRaaTk8QLwEOgYHfQxqJMOYiOMUjLuSyzdwXO9XDeFsEYthRYrBSzKOJ8jg06TsPZm47aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBD8KHPuUbZexnNqKFrkDHuwxQMxHFCbHvlm/WSm0hfWLBrLPh
	jsIfgP+S7AMdGxBD73ZKODvY3UA2qtO4fAEcgtKfQrqad4m2fLatSH9a
X-Gm-Gg: AY/fxX7ZsjAXP/I11z3XnpfTxlH7jvjUmnrw2mkkMJBJ5C4hhcMUNJTBY6sRqdIixwA
	ujtNJy9YjC020HTm7S+7DxDK/MHLglbN7zyYyuiPugp7xJAwYutqgDVgs5licY4hFapRKc4JJ3h
	eYqRNWaX4y/P6l6nLP71lf977XCk9f7RLySqjLKFcWeKUdNxsUrCDNBGMT72/JUdbnbfgX6U2Fz
	oy121dZ9Im+MfbeSVQmkHXVFKDdIZ7h7eD2WZAdsZ19CNU+Zr1NTpWdayEp7oonBWVgDWDXwsSe
	LKjdcy/4J9xJ1cLbED0N235NvdftrGfiyWu5n/OqrvTBTuAJ01nnqZXCPoM7HXbXF+X3MUpG4t6
	QCGMY+Qgm/Gf8QG6SP/cCUCrF+Qu8W8WGlIHiPhBpyQrkwHzMEB7Jg3VNazDkexcQNr/4bVERlC
	7mVs/cHJ1AFwnf267OwCV/igxgf2z3HWQfnqs+1jpb+uXX/y7tf3bUfVaGDzqoCdV6VFw4ozvq
X-Google-Smtp-Source: AGHT+IEb5d+vaUkZpyBGq+p43WuUE9Ufr+umE708zZAN3Ro/I3sh2nhVyXVGVrxWTqDPfClDb90idA==
X-Received: by 2002:ac2:443b:0:b0:59b:70e7:4128 with SMTP id 2adb3069b0e04-59b70e74285mr2359072e87.53.1768057767898;
        Sat, 10 Jan 2026 07:09:27 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-148-7.bb.dnainternet.fi. [37.33.148.7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b75543a64sm2137059e87.49.2026.01.10.07.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 07:09:26 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 10 Jan 2026 17:08:06 +0200
Subject: [PATCH RFC v3 08/15] rust: firmware: use THIS_MODULE over
 LocalModule for name
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-this_module_fix-v3-8-97a3d9c14e8b@gmail.com>
References: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com>
In-Reply-To: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768057742; l=820;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=W71manYc49CiWAv2i0/k3IAXEeJXVcWy8Fdli+uPecw=;
 b=TI2FZYAl41BCzRj1MSNDkzQDfQwog9xX66xfNZZ1pkWkh8jNuIQdCerLykM46eYcWqAczB9aJ
 vKnPExldgPFCeNcqUBG3nc2rFIsDDwEfn0QDI1LdCeaw7ubXjJM3bIL
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

THIS_MODULE now contains also name so there is no need to use
LocalModule anymore. LocalModule will be removed in future.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 rust/kernel/firmware.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 71168d8004e2..2702f01c0403 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -206,7 +206,7 @@ macro_rules! module_firmware {
             const __MODULE_FIRMWARE_PREFIX: &'static $crate::str::CStr = if cfg!(MODULE) {
                 c""
             } else {
-                <LocalModule as $crate::ModuleMetadata>::NAME
+                crate::THIS_MODULE::name()
             };
 
             #[link_section = ".modinfo"]

-- 
2.43.0

