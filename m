Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223D33BB100
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772557; cv=none; b=SI8qaNeHh4x6FhopJRCnmYgCt7NuZCykCCC3vRJw8qI5Zh5rWoFRyjZIDx4fJvkZp8TBhAKnoh+emzInYmfRL6scaDvZxPv5nEXyDs+C0uWBdnMUTH5B7IbYT4WRoCuDjyNWyIac4oBPQ9Cf26lk7GDM8QXdNIM02QbW7j3/eXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772557; c=relaxed/simple;
	bh=wDqQEHeexHbDetU+PIWj4LWacJQ70vCFskpK210m9Uc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ELN41vruwDX96ybWv6Zpf4OdK0k6RB7h9/qyV2Fwm8ROtvpK3f3RmppJhqQoSgvcCu2PCBiaVHgfQ6Q90ubQg1n5e0jbvmTGes1XZQSmaK7CIZi8nE5vvWsR7u68kROfECYBq9JeVeG6GPeYZMnd9t47uoAiWkcPMst9YeTKjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sDC5mqB0; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sDC5mqB0"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c2cad6a0fb0so511143566b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 05:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790772538; x=1791377338; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVNexAVC0V5li+k/F16CN+7KdwSpTXSAvB2yMa317GU=;
        b=sDC5mqB0dbJdeufHtpGZMcCXupPxUd9Isuo/BiH/Gjen74BsGx9v8kvpc3GuWCyUAC
         xXZ/1GKY5ezuTW+TLl7w+jnbd3SITuYQXpnYeAMDWJ7A6GnfIAhXz/3ZNIc92leMxllD
         2MphEcjo8hDYr27jp03LkSQzrbq+38DMKnuQwEwclIAgFEVwTXhEo1issydO3oynfimZ
         mUdQVRWgwTxq7N1ijtHnw1u3yoqkpsZPAaUn+0IIbd9rg/W5CF2j7g+SYlN8/hPbktNx
         6L8KUD5i/EqBUl/iHrKhRLEmGJHKUlhLyZ9RcGK43XW84ov4LH/ByXc1d4QHd9Nv6Vyh
         rXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772538; x=1791377338;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVNexAVC0V5li+k/F16CN+7KdwSpTXSAvB2yMa317GU=;
        b=J8GbWgot2qB5IRxelzzdK8QM7q6TWR3byW7EQV0+PA4CS618A8CSD9pkPgP192XmBo
         CCnb5R5NWcHqPHbxiDMTGBJDI2TNzH4tvf4DpJbHIS1cVAYc83aCnysoEE4eE9Bgrg9N
         wwRPPj0QtQZEoJHj8ARHbpdAtwzCflQ018NA+2Sm6Z/PVtgK83pu6xpGv/34FK4Oi+xB
         +i9ohGHRsG8eWRGkvTJhlGL6V4VnghrwvK6wZ0ea6q6DgKqa4h+1cniPLwBMRcWMp7Cr
         mzuecupOJeyGVw1Gd8s8bZtTeFc6pEst8YyW34jaoYgyURhAKjky3Xq6WjDfC0Gx/j/H
         b1MA==
X-Forwarded-Encrypted: i=1; AKwUvByccT7iucDjm1nEGoOOU2wEVc2KX3pAghtG8w8ONV8rQ4zAI5xcdL44wnLNow07aHduw5jFRIfFl131o5rfyg==@vger.kernel.org
X-Gm-Message-State: AFuF++mEc2p7V9iF9Ac8DTQ2u5FLouKP9Ck2maWmhzQeP+Ax1j7heT2v
	c0inlsEkD9wlTmQIPFSqkq+KvJedob8TV9KE3a5jHF58CnWUIfmXz8jcdm7SZx+KDf1MF4yB7mT
	I6p0JvFR9U3xv3jyuPw==
X-Received: from ejri23.prod.google.com ([2002:a17:906:6997:b0:c2d:23a4:edf3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7208:b0:c2e:969:a4b0 with SMTP id a640c23a62f3a-c2e23cf74d8mr117438966b.38.1790772537773;
 Wed, 30 Sep 2026 05:48:57 -0700 (PDT)
Date: Wed, 30 Sep 2026 12:48:42 +0000
In-Reply-To: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=wDqQEHeexHbDetU+PIWj4LWacJQ70vCFskpK210m9Uc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqvQU2BFFh0KH0ZXKTw+QSI/Cr7JUn+q8DrwVkR
 hgri6PRhn6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCar0FNgAKCRAEWL7uWMY5
 RjJED/93ufabr1xR5jeYtifrnwaBiMPJTpvMKlznunkVDGSVCedE+pbZI5qAODNlXOEBgLw5JUN
 BcyQVHehdoe9AVG+hpLl4cr4jqAKoRle7SW9ul8vVldbKj1bQykmDWXyXvg3ltCr9GxbQff/6lQ
 6V1t0qkZsKq1NinQ1EeAkUKAahD1WzNMjkJSE3die8Qvxh/4V1i5J/zJ2Hev++zuEDs8GhPSzRW
 plD16KFFlLNr+N2CBGxsWIyMjdYEVWaFUaepkED4ibD2aeCF+YvaTV4CDqKHnMDAsrcSzvAKqCg
 a9OrACtcQtSj2c+pMCNTtrsvnnouqcbFv5+qeTec5o0VBcYvx1SwJXIPEYf85sGgA8cIJV9kA6q
 XK0fcHh0lVUVUjeAuwdxkqrY3t7GwtyJLtA+z04VZI99GsAKkGz14bCvstvVuAeEWgcNn1bAbwa
 x7cBhM3hckG7poUlmaOvmVZt2MRUn65QndOSvw//j2KRWD9h1U2YGYvl8flvv6PEjcG0XyuwfGA
 KagFZj9uf8djslrqBmhlBiGyuixFQZ3jLoLVgnkqM6FTXdUx34ctwkoC2zCT3U4cbTc9TCy7G35
 tPrWh1HkqmLSZwDm+ZqtAxTHXZNMXQWx061N4m0OyPjuK6fLJgHMVKEyEzL60QxBa745RYSv2nf IZOpYo4T+9gRj0A==
X-Mailer: b4 0.14.3
Message-ID: <20260930-binder-transaction-log-v1-1-3d832fb30388@google.com>
Subject: [PATCH 1/3] rust_binder: start debug_id at 1
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

In the C Binder driver, debug IDs are allocated with
atomic_inc_return(&binder_last_id), so valid debug IDs start at 1 and 0
is never assigned.

Start NEXT_DEBUG_ID at 1 in Rust Binder as well so that 0 can be used as
a sentinel for an absent or uninitialized debug_id (such as in
TransactionInfo::to_node_debug_id and in transaction log entries).

Assisted-by: LLM
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/rust_binder_main.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index 955c4c348f73..e360df991d51 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -96,7 +96,7 @@ fn default() -> Self {
 };
 
 fn next_debug_id() -> usize {
-    static NEXT_DEBUG_ID: Atomic<usize> = Atomic::new(0);
+    static NEXT_DEBUG_ID: Atomic<usize> = Atomic::new(1);
 
     NEXT_DEBUG_ID.fetch_add(1, Relaxed)
 }

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

