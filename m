Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9477334692
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616968; cv=none; b=Jwg5ElGa2E1ZHW1cGO4MkCGJOyzqiy9azhD1Cv39BEz9ta24sYmQ2BWh79q1p4PJUfTTqbRJJOlS553kpyRsk1L44gd1KTt/+c3AiFzpmgc4UjfUR6UTnidHdOqWCB5+2Ny9ypYENpXkka602sEkam7iRWGUSxphJpg2qeuJBgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616968; c=relaxed/simple;
	bh=PUaVfADxm6h8vbCgEPN4uYRrRXeaQDcDvuSkPSy/sN8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LgkQ8R1ATEWA/xvndBWYnOKGEMhYLq+YNr/t0EHzLFIfATuAVe59PfN8Ty6cIPCpWv+pdc6p4AVJzu5RKasq7tbDHlTA0EfgU7rjSUAxZuzuZ+s4Voh084y2c4mCI3Bf97gCoTHWuokU52nVZkAtwQQlD0FowqxvG41186q7hJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dJ6422GN; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dJ6422GN"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47d3ffa98fcso58772645e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616965; x=1768221765; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lfsz7W7bHsgp2ag+JLydPJnxlFokS7fxZJMGdwpNQ7g=;
        b=dJ6422GNLoczYjq8u1g1TMJcIZk2eXMy5HhAdrSnnCwaipKYNSO/J6VzVSwH7eztr8
         noHAoNA01sKp92csqk1VRJJ8rzKJbAPmqDUdXkZyKFxIZnHHROCIljSxu/z9HZEdUGyT
         zxsK3EtOHP8ZRQgNBK3PSLNXXRzyTTN6ttX7fkRcAEoMR71XNYtMKPlj73iYxAADzpDB
         9L0nxhVtrfHeWvR5gr0nNwa7BTtL+dPGzA7/srBluv2c6sKdwfypL/21AKITJHMfCAQ/
         q/JoyICeTO+BCG82FZ+1ouGtebTpYGhSwPKdNrxerveuOMpwmE6h8DCmoz8LjwrTG7Yh
         3RQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616965; x=1768221765;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lfsz7W7bHsgp2ag+JLydPJnxlFokS7fxZJMGdwpNQ7g=;
        b=bTX6i+SVIslGs4CYx6+lMsbpUHvzJxgedSa/c/F72xF9gMW547FHjUfTsWizggvTBn
         0Ba0GK04ZcuAVpeuO+M2byt88H7UOEASmAqJS/u7OXAwXTDu7awvffJRd+B+0vH76glT
         Q74p7r4fO+IEEk0jLFYEVg73++1wE2BAgqLZrbBEg8k+WtCy8OrgdYUjaFV7tz1gEVwc
         urb0C9ffpvECNsGANOqNeXjr0J+gkZCpwnnYc9fpp+E5GCc0bKbO4HZSCzveUvI/vxWi
         YOmioYxqya8UQnRIo5Ne9i1ObYypiHhkXmylREx4lsOS2H+40TT3c04zmRGwZ1qL0xpC
         OguQ==
X-Gm-Message-State: AOJu0Yyf6tl44TBXLR/VdZRVs7ngKWRUqT50ZTCWuD0CSDhzEEbPDm5n
	7kGPf05qWt69RfGSqC3K3HOApX4kq6HDvwLFxpJwa41hdBJS62lPfZu8vwJMXg09DyIUI6l0FN4
	ddJiXAQn1NsWCLJXWhPxJY+XogwUno7GRY5pMIlETdsYyGswieTkrdSitaHNuisMkFQXS2/tWBx
	CBlsEpP3LctE8e8x7wUwGi/tseuJoC77adbEMz5p8GH8jIFuvOTgxQqFV/BhzKkNg=
X-Google-Smtp-Source: AGHT+IGLcrbAZq7Q1lJXrMiQqN6XnnfBMZjTIDzFg2dI8kK4owH69aocjIyseb6ZT4bO37PCbX7bdayFO1qQO04=
X-Received: from wmdd17.prod.google.com ([2002:a05:600c:a211:b0:477:a0e9:dc85])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:101:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-47d1957b7c8mr443475745e9.24.1767616965144;
 Mon, 05 Jan 2026 04:42:45 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:18 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=928; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=PUaVfADxm6h8vbCgEPN4uYRrRXeaQDcDvuSkPSy/sN8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G7S79WOylxMn1DLYk8kJo3D/uqUgQmD6Rs3
 C12VL6xJu2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxuwAKCRAEWL7uWMY5
 Rj6qD/4r7cJ5vSCtNonIYotL4+fj+FxSSZ1Vig/9wc9pk31xitULJGeqZV6QGBK69D/Axv9JLiv
 vdag7kQyeQr0IGGmXE+Q+4qirXufXPTx3PlcQdBg30jzV/XMhTrLRklGgn7RNG3G0aBWJTAs6xg
 JOoeJQicAkzc8IWehGvlvExGpqnK88jq9Dg4JWaigel94c6XyaJ3701/8pQQ2e/NjGtGJtT0hXp
 j3jJuTZYoTBMCfP/fowIdnsdG/yVmRJKmvC+A1TKauUKqswX27+ZtDvnte3AFTjXr4cUUg/L+Vs
 nDbfVbHk9JZtqFtnXKhOWd7BBdH0QeoCUhLxfy122SdX+PrRM3miD6d5e9P5vzD1yKsrsNdqDAs
 RAVwpapaE8ohG0/sPO2lPPObBqaml/oXso0DkhsxjBULd0vd2R0p17W6kpUcrmzIRDapCcVsS6z
 DUJ5birP0hHL1gJUHYASbn5+8UDzYn5LuvrM962ILsNY0qyfGGLxwM4SKQ/ELn1g4QA9bwQ+a+g
 Ki2GRUvg1vwHuVTvc6sUseHz6u9nXxay4G6sFWZYMY8HMQiOAkpxeyCcqfBbluiNC1wvenVv3Cg
 ecX4T1Km6mMsxdSpXya9vj45KpjzVy0UdQ1CHbz44Ta4k6YALwFEIkSAFY7HIwpXtv58qfpR5yX kG11InFIRIBxY0A==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-5-51da5f454a67@google.com>
Subject: [PATCH v2 05/27] rust: completion: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
---
 rust/helpers/completion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/completion.c b/rust/helpers/completion.c
index b2443262a2aed30db0084efa00b140d4d5929bf0..0126767cc3bebd56db706048b8bc07c6788de5e2 100644
--- a/rust/helpers/completion.c
+++ b/rust/helpers/completion.c
@@ -2,7 +2,7 @@
 
 #include <linux/completion.h>
 
-void rust_helper_init_completion(struct completion *x)
+__rust_helper void rust_helper_init_completion(struct completion *x)
 {
 	init_completion(x);
 }

-- 
2.52.0.351.gbe84eed79e-goog

