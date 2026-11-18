Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001075;
	b=MkqLft1e606g9uhDSYQWfqHj5AH6A3bDhdJaTD6lMzhGag8X2mJkITKMov3kSaICg1vK
	 TMoZ7RreDcaf5VLUxzxag1l1as02C/2JkReP93RHfbzDrHJK5nfOm4JzzhVMcX7yHNaez
	 eCI77hkaooXKH+PLZMp5zV/oXdui2rfwTIwdKaUKeOiLWPGZu2dCFa+wNRGchPvGFqC4g
	 lCjbrBEmQ58UioL5DdhkNocPzzmiCloTlEmmrqIujOWJA+10l0d20sqS7TYIlYRuDACJJ
	 pcdnEZwLOIGNITwPbC9YxXwnsMgjyfY++KSv2ZUFHBlYO+i0UENxCgcPzWcWBTNgYLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=NgxcydZ7W7diTZLrEW7mmD64GYiEJTtactewUU2r9BU=;
	b=eUi+mGR3avw6TvQTqOgTYdi4rKECDmSSocjyLm+bcjdX9pstxpqVOo6ZZLkKOeMz4yKt
	 zgAORrcwMNtfycMIi26nIDLEec5eshsvYxJFlP2xi8/RL+sRll+nx1GPoxo9nKz1VC4qE
	 1LGibN4DOajHXcuZdkLdDfiYSKXJMpEPmD159GBpNYMu906dyU56WYSzlr9PnKCXveWni
	 sQBKhDhd+tsF7NprTT4fAVvJq+JrrtxTVMRpzN9KLP/Vl8PyV0Z1DYZSKvmjxT5o48yED
	 m/CraSwwv90q3Dn1gY1rvYaR/L8wmyG/cNak1Dv9Zijb5X6rvhbzdZVyHpVaMjQz7yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nTYKR7vS;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931A5606A320
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 11:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 931A5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nTYKR7vS
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so861926f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795001073; x=1795605873; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgxcydZ7W7diTZLrEW7mmD64GYiEJTtactewUU2r9BU=;
        b=nTYKR7vSpmKhR0Ssct/nW+P9T+b621hzUsbStNf5cIUdGf5KKRDXanH0lgGuqHHc4q
         8pLVSBHj0W6WuX6nG1UR0s49rfRBqocVJ5vxatLU5NG2qdVRRNt8pTocYZvE4Zf8697o
         uuuKUOsSwQ8NXC8aTTtAXN0qfkkug4m+Jy3TNcVyaCvq4Wz1HQzYvAQYbx5ClmMXPxPf
         Of4kXO5JFsIZssgaXv0hkJP4Vhn4pbaz7L32Fumg1gQVL2aFbIqwebA2Hpz3IsG9xaAY
         NwLNyJUm7Ie0m7ccBlkQIdrTmjimOJJxznjQqL7DhuyskKymiEOn9Zyyxh+wZumNfM8m
         al8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001073; x=1795605873;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgxcydZ7W7diTZLrEW7mmD64GYiEJTtactewUU2r9BU=;
        b=rViPf9EfzIKiD58wpcaHom0xa9mBvCMBvaM0C62GM8nBD28ZCJQR4uFPGHIBIUevGe
         kDP0vSMp27hoGemqw8i2fn5pF2cZK7XtwOvRYd7ryW235sD5ylmmD8yuN6Jkf2v75L5D
         waRrMN1xhm754oFcF5MLVgDBxh3NSaGpcKJWcQnyf7JPI8xEgWP7P0S+lvvcOxKjoaiE
         na8edBUe/TyIoB8p0l/hk7b5RUhiyasIDE6LpsxxPKYhsBgxbJICp90AIh/PgS6SHCxQ
         UBj4czVT4hgxxTifiHRVGirURIfccPhMjUY9MjwbuhN2X1ntwTe+6BFXk9r1W+2xGTGE
         dgOg==
X-Forwarded-Encrypted: i=1; AL+hErGi5k8y59/TMhq0zzH/TCNMBbu+rT6zRY7nW1i9ba4WK/krgaP2A2nyIraehoT7HZFbDFm5Q1tKDYu9lnhi9w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8rT+btmNJCLi7Nm5FkntOSgX5TMIps0ApQxRJ9Z4KVy/O2iI4/
	T4cFYS7OpZSOuez3osBjnSZhUIVS61uUJ47WiPYhZ7FlfZEKD4JFy8V4y23mx1sP+MznnAE2u2I
	d5QNBv56kz+O07XOrFQ==
X-Received: from wrud4.prod.google.com ([2002:a5d:4f84:0:b0:48f:beda:6924])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2383:b0:490:f98f:addd with SMTP id ffacd0b85a97d-4a6331c6cdamr5728890f8f.4.1795001072496;
 Wed, 18 Nov 2026 03:24:32 -0800 (PST)
Date: Wed, 18 Nov 2026 11:24:25 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOiK/WoC/x3MQQqDMBBG4avIrB3IBFpMryJdaPLXzCaVGSiCe
 HdDl9/ivZMcpnB6DScZfur6bR0yDpTr0jawlm6KIT4lxMSrtgJjuOXK6lywFJ4kpIw1iTwy9XQ 3fPT4b+f3dd2c6z16ZgAAAA==
X-Change-Id: 20261029-binder-esrch-is-dead-8109ceb9115c
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=wZRKSXn6TR6MdqwykIO/PARHCDKLEFWKsF5C3d2QD3c=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/YrrtJoXrIaXn2dfYFATxfXU8esNx7i83ho1K
 IYauU+mWy6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav2K6wAKCRAEWL7uWMY5
 RvvbD/9NEP5A+vzaHatKFT8hAu+P+BohRZ9ddIu5EuKxN7Dv8TP7AV1tBovrhxsLz2yCbz6jPgM
 5xkhKoW9gjX0BD4Uum6GqgXa5LJgTpNJeGYaxZ4KhL22x5ACHnepNqGq1CWX/LZXpHUJni0nbwA
 YdOdcm2YzqiVWtl4fQf7Tlrjm4/nON3eyV9W1mLrgHabPsSB7VrHqxgi0Egj6ZuyLMwfRJTwK/p
 1HKXmyOGt4K71MxmiuJC8jsd5tqhwPH8wDyY0nGF5+LP09xgvhXC01fjYj9vKM67l0iuhPrA4SS
 YuUsP2UfGpIbFuzL3UeXs29VgtMUJ4iG/sydfYUp2kPDBCT13MZqkRoGo9QB2wXdofhk/fjxd4N
 dDxh8tSx+r3/A3NN8TEoGhNTVdsgAr+nuqFtrS46yyntbqMv+RKy5kcRVCO+6bmtY9TEjJy06KK
 wuuOuw6Y5855Of0qTGbV6rPH+FyxDFGCIMpz/qIJ22oLdQpZIqV0XVgPF0rfZV6ktSqaaQekDim
 RyBjlOWn0J63yRt4WWfH82cfie6lvMkdAKpKOK3Q4oml0JeVGPbPx+yLTXyGlRbbR9ngoZMVKsy
 p+a7/qiSy0KMp1N9PoCKiK0ffiK8ptzeVo1dBgnU9CeOLBFIfRXy4z8B3hNA06CFLBWLVzq3o9w KO8LOTm+X6DoDDQ==
X-Mailer: b4 0.14.3
Message-ID: <20261118-binder-esrch-is-dead-v1-1-a45bb951fd14@google.com>
Subject: [PATCH] rust_binder: treat ESRCH as BR_DEAD_REPLY instead of BR_FAILED_REPLY
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

When sending a message concurrently with it exiting, the transaction may
fail with ESRCH if the timing is right. Since this is delivered to
userspace as BR_FAILED_REPLY, userspace thinks that something went wrong
with the transaction, but actually the target process just died. This
usually leads to the sender aborting.

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/error.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/error.rs b/drivers/android/binder/error.rs
index acf0aa09c555..00f1519a8d77 100644
--- a/drivers/android/binder/error.rs
+++ b/drivers/android/binder/error.rs
@@ -78,8 +78,12 @@ pub(crate) fn new_frozen_oneway() -> Self {
 impl From<Error> for BinderError {
     #[track_caller]
     fn from(source: Error) -> Self {
+        let reply = match source {
+            ESRCH => BR_DEAD_REPLY,
+            _ => BR_FAILED_REPLY,
+        };
         Self {
-            reply: BR_FAILED_REPLY,
+            reply,
             source: Some(source),
             line: ErrorLocation::caller(),
         }

---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 20261029-binder-esrch-is-dead-8109ceb9115c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

