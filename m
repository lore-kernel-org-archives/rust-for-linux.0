Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142B72405FD
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 16:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715991; cv=none; b=c28FDyV7BQgoxixNTOBYYTXWS7ixO7xrBVAQhtcOc8VNpNfMfMGCWA8ZXrFeval5imbQLhBQh3jkKfNDLo5KHne/WXKhG4eLn/6PhQNkyh9rLEt9wYvaCYUhvyfmrgCG1Q/+/ni0by7gQB2tAfBWZihYtaXb0qHv129bBYPEkTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715991; c=relaxed/simple;
	bh=NbSZJOFudokz6C+njmD0VOJLlYmt/34Y4GRpm6Ry5SM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnJvjdEbnUFYj+rQZUgS+JyZxI9p8B1KwJEwN46RHTSdOQZtp1YlzAlbIj3GE/3e9iGniknjbOStz4R5QWZpMhrDIDsH/Ggd3Ty2fhJwObgaTAPeaY5x/rMndrH8tR4Qz7OTHjjYzk68qghyDJ+Whn7Iy5UX+NQCVOJb1+cHA0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVUmsUD0; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVUmsUD0"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37a3a4d3d53so13716131fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 08:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767715988; x=1768320788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJEsrOJPO59o/eeH09HtsmYQCeq/k0b3qKzFe+dbMbk=;
        b=TVUmsUD080N+VrEELv+AkezLiDaQ6Otrk1yY8QOuSjHSZ0ZqqSxIioidlP7yDfI9Vp
         bgI1E6XOWA7aveE1+I/Pe38MlHLIuZrKmoKrjt2uyrI59zoGjOOzSWvY0QHFnmqvZrjF
         +8s9p68R0Kfjy3+LxwGR35xMS80s6ciB6TQliS3TIlK1tiY8EtFlmvexq2GVKqIWV0aQ
         6VsyntkP3duobEpnjX34tceKtYbUCNhxX3v4uqwsYgWZVe915ZAeQvYePAX6C/arjC8+
         yaP6ccsQLK4TXPH9d43rmNtl4xGAkgv8yMcmHRW/iwYc4W4eyjaqZN6MCIxRMzm4dHe+
         bNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715988; x=1768320788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hJEsrOJPO59o/eeH09HtsmYQCeq/k0b3qKzFe+dbMbk=;
        b=qmnVXFazhn84M7TJgm41fJZkUVdt0Nx84LaBGBuyj1W/HmFl+Xicsu8gPFYoTl0MkZ
         /AogaoMqHSocIGdi8NPp3wGLr1RzPF3Jx/19dkUEi3QAflPtUHY4YGRCiJQKqQaIAveo
         9JYi2Z3FQrv4KOt8Uf3o7A0/f4pxKgihvrVQVcTFcqUNcY2LywLlB+TGEDdLl5sEz4ck
         ps5Buj3Vhu/LWUtNDQ1Ug3yrh/xwbyKTd5qr3lsL609Lub7FVKSe6ucsUqVdH841/rlK
         CLAI7tQVF7mw/XYmT7iJZECTZ0k2lriibpOJS3brT+yOMoyodN0ubBV2Eg+WlWjx2RkI
         MEsg==
X-Forwarded-Encrypted: i=1; AJvYcCXpbN0OeGXXfaq3ONiupW96KIsVGeMrQDp1W9K3MURgOC1/TUrxZ+oYoiycPn266ttLP/bM+tCA7qC167JO8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxz3MfzaTlKNU5u/ji6MQIq9ztrQqEFevVk7g/JeNBlas8S7z1
	j3kC7o1gLydCL7+6IGf46WaQR8x2hP2XQhsFDN4ZMfgGYRpRQl8YaHTE
X-Gm-Gg: AY/fxX7EV9BB8ZRSNgUyG+YDahx27fqi/sQ8wg/9SimJC1BBg3AvZjgZhOGL44ZOFOW
	tWvOe0/SNQNAoGtZAfZODOnUNukagRMd44pleeqY1FbkNH311Be3CrWhDVEFmNhba5XhhRuGZf3
	ZR5t+mtUBoe9fqdt2GsbcAbejTmifHjmANmMg+rfhZRZn6QfKuFjaOgBbtFB1sgnUZ0z8qAzjIk
	lobaSoX9Q/PLpRh1NbWLu6orOsV/kSHwpKo6Ejx8tddUdwjIzTf8GqV3TI9IjzNmXSYVJbtaLcA
	MkHKLRIxdiL2wG5VzjB5BXAXxVpuuMGlH3OxZP2k+dz4b4an4ycdsc/kh6XWzo7qn1pjaszNQ5u
	PpAE+KcONi18yS0WH3JhoD2bNzADt1ND3aZcM2yCDfALZF1KxRxDeTbus/FhLLCloAUinhEB6Sg
	m7kNSZRs8Ojxt5lJ6XOOywH1XWoTgOSWFVavf4OCAeUgTfNz33e5ca0RrWAxkO5TJlU3E09c5MX
	3W0hw==
X-Google-Smtp-Source: AGHT+IHKaBOSwm4vp1JX09Pd02uyRduDey+97mZMIBnf1kbFiov8dfuABleYNBj8DwXxWVRLUyVm9w==
X-Received: by 2002:a05:651c:1542:b0:37a:2c11:2c5c with SMTP id 38308e7fff4ca-382eaae3114mr10488351fa.37.1767715987833;
        Tue, 06 Jan 2026 08:13:07 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-180-149.bb.dnainternet.fi. [37.33.180.149])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb91dfbdsm5256091fa.44.2026.01.06.08.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:13:07 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Tue, 06 Jan 2026 18:11:39 +0200
Subject: [PATCH RFC v2 01/11] rust: enable const_refs_to_static feature
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-this_module_fix-v2-1-842ac026f00b@gmail.com>
References: <20260106-this_module_fix-v2-0-842ac026f00b@gmail.com>
In-Reply-To: <20260106-this_module_fix-v2-0-842ac026f00b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767715983; l=837;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=NbSZJOFudokz6C+njmD0VOJLlYmt/34Y4GRpm6Ry5SM=;
 b=Gfhq34snEkIsncWb/32XzJ7mDnGJI9NzJRtuJ5elT9FOTK96SZFBM57vqx6E+sIWZvobIIJuP
 PN2M73QNsKNDRKn+ZIbZM0I884SvUA/BxyVpF2M3n+Jph1Hj6VPLvXV
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

Enable the const_refs_to_static Rust feature to allow taking
references to static items in const contexts. This is required for
using ThisModule when constructing static Rust structures.

The Rust support already relies on features available in Rust 1.83, and
const_refs_to_static has been available since Rust 1.78.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 rust/kernel/lib.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6d637e2fed1b..510d4bfc7c2b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -36,6 +36,7 @@
 #![feature(const_option)]
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
+#![feature(const_refs_to_static)]
 //
 // Expected to become stable.
 #![feature(arbitrary_self_types)]

-- 
2.43.0

