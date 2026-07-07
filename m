Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BFD3DA5D9
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418827; cv=none; b=pKJkfvhASsb9nRa9GaXaInCKVVHfAwob8fpYOQ9Ipfr9Vi7/9xaR69X3LflYt2+RokzvM7Muk3pV74yIS/dL3aO/xcs4whay6wVjO04Xwr0qQD8ymAwgUr6DtdTBZLVMlEKmbg3O89vs8yFbXKHGj1Pwp8bLT5QH0Z8cwS1w6gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418827; c=relaxed/simple;
	bh=RS5WghBoQ7SOPxImRlNnAIx9AmdQTNrNBGCO/1hgT/k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lCsM1H1U7Vq863TJE4k3Lw3oZRqPUYuTAC/6yY0NcCLsBkevgwTxmSrz0JJKN36/PFG5tzf60of4D8uTMEBaUJWd96S+Z4sepORbSvEsibfM1b4Gu7xXBrkjfzT3Owc2HY26cz8XcXPTySyZAZeDe6NcMayWUCteuiwkz9gfvp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CBMzUulg; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CBMzUulg"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-698b9b2edc8so3444099a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 03:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783418824; x=1784023624; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o7Ki2zX534fStAfxGw0c20KuG6VQUZF7NBkD6lX3kkI=;
        b=CBMzUulgGlDHr9N76mecOsog+oKLHgtS8AcW+SCxYos5C0FG54/+dYtQSw4s0kAGzh
         dWgLWp8QDs2sFKrpqJ7s8CpJW8hQHlbfVodOF0LD8CyAbXkB55aOfR3Tm/Q6bcF+09wF
         oqMXiI2UD+KEP0Sf4ByvbGQFgc3VOMrrW11lJAqR9ObtGJRd5uQzUHCB6+cRNWLhInuw
         Paoj2flDRRMvMkjk9Bb1saQlEp9ksZuJxBsLOioML2sRONVDhsznRr1AwpJp4wEVc9jd
         rFlhdWMDRUD/MXcPgjItppCgV5+WPnJfrcFfaX/3hjj8lIvsNDz8Sc7aG1+LxuXKVrrO
         Mzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783418824; x=1784023624;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7Ki2zX534fStAfxGw0c20KuG6VQUZF7NBkD6lX3kkI=;
        b=HghuWxCQgR7LFbADqpm0rEoNHJWcJBbUcN4tNBJ4ZAwdxuBb3eRj3qC6dcMZ1R1KCG
         iBBG/fKuFfU+iiQ3jy4fnQKDe21mpVWOqVzLZEc7Obj1yjIZSjvE4KTCRflXTfVb4+Tv
         eU1jEhKJtz2PxOBfLd7osd+jZ/jSrzBBQy6usjF8ntnN72eP68n6Sk+V+Ftxw9vLrPXn
         5VkvRf5xiYxmelYTH3yDDnPdv+MrapiXocNWMX7er8M3oU4M7R43QADxGYhGsGtUZmN7
         FLWHZE3enEr9tbb+uZRy6lPuEgoXYr8JQfa+tZHKYFt1uXo/NFu2d+3rL+uqJlQV7DME
         CNMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3eQsbWa06pgwb/ykavfiiTQ+hZNzhSTDxzeNSbsaPaWpkE9qg2p38ETKFlZT8tdwk9m/TVgLpROATIGzysQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtic0YXg3KnmMk7iPr5zZkTdsGYbs7So4/HSjZ22DZNnoKiYZg
	FvOFBms5n25hv28fkLndU6ZUlT57/KEgqGLFSUqx+woEdGXfPvywRNmGr2wjTqxte4XyWCFyIkP
	Oct1exSHSioCLlP6/1A==
X-Received: from edj6-n1.prod.google.com ([2002:a05:6402:3246:10b0:698:ade3:944c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:d808:0:b0:691:7054:8c6b with SMTP id 4fb4d7f45d1cf-69a85c0d531mr1628080a12.19.1783418822940;
 Tue, 07 Jul 2026 03:07:02 -0700 (PDT)
Date: Tue, 07 Jul 2026 10:06:49 +0000
In-Reply-To: <20260707-binder-netlink-v7-0-42b40e4b1ac8@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260707-binder-netlink-v7-0-42b40e4b1ac8@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=RS5WghBoQ7SOPxImRlNnAIx9AmdQTNrNBGCO/1hgT/k=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqTM/CTOCFIGfOWbtQIJseXIjoYT8qqPAFg2nIh
 foBmrN1tWaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCakzPwgAKCRAEWL7uWMY5
 Rq+2D/0chlC7qlnjbUK2UYRKffaYbX2DAEndG05brPRM+lboAxIutX3fvkKDRtFiGk0r4lS0pXg
 XJyMGdhBPlpo62siJWvpPlA1j2Qn8GB1y1nYV80GWdbfoBGo+j3G+SJuwvTWxTO97GtSE6/oBQT
 1Pe3FcdQ1HpSamgdr13LOcv0qPxBpoU0zaZ8B4F0wwBatOzCQNgmFTlWEgPar9dsWdlGXCcdSb1
 7c8J8oa0PIZ7hgPAMehih9MxjOiaGzvlsBwDIbB1YdX4CRyOzkkcjt5C+p/mgls/seODoirM8oz
 mkoE5CyP6OQRywFaZWWGLGUVW93qPqTzcBy2K3QGm9IHkPvSXj9xJOVOzMFKgdtyId3El0dEDGW
 QXucCgKtYPdx2fxdv+k1PkCx2gNUWzAUaP2ap4RjlbeT52lbOcqVc9dp8m2E3ynih9hEes9OLjd
 EmC2QkdtZlt6d/ZIaJFUl9tRl3GmBClbDB/r5T+8JXuon4zMny87JVfDQf7tdMCKBmkXBiW4Uin
 0ccuqydDCQXAeHz9j2uKYTgDjt6dUQWmUyQJos95lGkV0T1z0BZQDMU1iiCCE7qKw/4v/MiObuk
 G/mWhY5RpmDdc38O/gYKiStbgUw50+BAbxKUeoWoHi13zmGTByjpPIE0djjfGMIdUoTHmxVCU5y /YjiPGamBVvNCZQ==
X-Mailer: b4 0.14.3
Message-ID: <20260707-binder-netlink-v7-1-42b40e4b1ac8@google.com>
Subject: [PATCH v7 1/3] rust: net: add rust/kernel/net to NETWORKING [GENERAL]
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Lunn <andrew@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

To ensure that networking code can be found in a single shared place,
add it to the relevant NETWORKING entry. The net.rs file is moved into
the net/ directory so that it's included under the MAINTAINERS entry
without needing a separate rust/kernel/net.rs entry.

Reviewed-by: Carlos Llamas <cmllamas@google.com>
Acked-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                        | 2 ++
 rust/kernel/{net.rs => net/mod.rs} | 0
 2 files changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..303a06da4279 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18849,6 +18849,8 @@ F:	include/uapi/linux/sctp.h
 F:	lib/net_utils.c
 F:	lib/random32.c
 F:	net/
+F:	rust/helpers/net/
+F:	rust/kernel/net/
 F:	samples/pktgen/
 F:	tools/net/
 F:	tools/testing/selftests/net/
diff --git a/rust/kernel/net.rs b/rust/kernel/net/mod.rs
similarity index 100%
rename from rust/kernel/net.rs
rename to rust/kernel/net/mod.rs

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

