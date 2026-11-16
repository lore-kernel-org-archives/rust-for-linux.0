Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858632;
	b=Ra3ESEcffyaTkgRRdEQ2SVeaJYXcd48kQqKMkHH6G85sRIrQvZz6CwFAV7+hv+LM4SN3
	 hb36nm0PdSQf3lYOueE28UGMB3ZbGUUyFWKt2MHzR/hPe5bG+5wuaGzQbvuGkpy9PiAMg
	 akebARz02s9qz7FTPCqrq0msM7dxc5FsOsjiACab1zkTnXpj7uM7mYYRGaw8ZNSHMudGd
	 GaACZfzkGZTmt3Xfr53P3uYN8jr6aG+XJB3aR1LkMeAoqQIZbrsvcodGSK6kO9S1jwqjj
	 3ldfzmtBjgGp1zYS+W9aNhzIb5zSNMB6EwELfsjrhYqTCFypOB6A+uo1XMNffPnLisQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eFdg050KOzhqiZr8wAb8DDApASy+byey6lJxXjWxoKM=;
	b=jm+ZcpVJlKbinjpOV5waL1EZJbKv3o0yld0zpMe/lAUbSFT8Te/Pky/1lJMXwS6iR0SW
	 V/5J+to8ubvRGa6rDZMjdk3ELegUg5T+VJbSM4JKHJptby8qEGBymWiPvIDQH5XgYgzLW
	 TWIbqPUTVOCSAwavin3C0sj/b8AUV6mZnJ9m2D1eX+LhmuD0ogYZBNGOE0QDJr04a523t
	 3jssqEN2G4Ghs2JxSZrjS27i3WE04LAhVSuNQmOvLJn98VFPHLreOVkhWQxeGOSag6lVl
	 2s5jZD6nIqbEGxOhOoTb27AGN8w94907zd0mO7R/HTFYL6CD1+wBMaa/IYNKo2yDuQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVPMv5Jj;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEB9606A322
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 19:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEB9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVPMv5Jj
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso3472250e87.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 11:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794858631; x=1795463431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFdg050KOzhqiZr8wAb8DDApASy+byey6lJxXjWxoKM=;
        b=fVPMv5Jjqv7rtUacwUWwxgzGUKh0kbGrQvPDNKQgdg3PfGugNot89oLZEB9uDECq20
         kt4Ze77lLAUWZGkp14AN3KdOXlAaFBy6L1ueciTnmSBmoUb4pfdFZ98zR+pQ9zsJLHRz
         5nDBMJrkRJwuttQU+Ggvi+BNlUX+jFGCDohXhNdYfz9d/+lXqn41DpMVBBRMcPxA2dno
         u6/HTzFgpjeTl4aZ6r6xtb4uuwBS8N/HMAuLQlBTlSa72iUI06FvQ+5ohd4heLO/y1MN
         fbABCiqCeEaaoSb85YjVoN+hfHep4gg/mFfBJr21Bw4mkQbFo0cZxdcylKM74107fVf6
         7G1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858631; x=1795463431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFdg050KOzhqiZr8wAb8DDApASy+byey6lJxXjWxoKM=;
        b=b61MgihDkgQxmJZeoNggRMXdRFx1vRT+aT4Ps9ugDbGcxZGQmT/H/qElBrJRJo+FKd
         1OrePc6JM5UPreovpWC0yAmPmC58EZ/Trij1BOsY8/dgeWn7BDZTgEB4GT4uQsC/90r6
         Iyzn7vWwjvqGrEFO5h+jSxkoFN/FsAvIXNje7aHLsIFH14l/WDunpO/cEQJgslaecWFA
         96oEz9PtYf2NmN4Ce2zF8J1fh+O/I5CwGBP7jB5WYqiYkHMA2AuUthDfDT6onzz6nc/q
         MpPAJzOqvBb/B3MyPZDTG8idMIMSeXgWVyO0lvgKX/dJEK4d2LHK3kba9ue3SyZIxVUP
         vzlw==
X-Gm-Message-State: APuU4Z/LgYEOKePErvqreWh+V+92251VhWiff9RtpoSxMT0nq+WE0iR2
	i62aGFYGRFa51ax3FCjbYJa/uOqk3JRkB2OCehHb/vWTUnt3+zjomQE9benPZhrgUbU=
X-Gm-Gg: AYBFou16r0/6zwuqOuL/YVvy4woORuJbw0nVKI4dEZ/6GSZtF71ih6NCZLgxpCabny1
	zJozL03+zaos1F0IqpJxnqDrpf3vJMPXay1x0QmrrJaQRFmPm+Bd3CByjQd1eEOmbFplpHeTJjJ
	VFkqrpcc/Me23k+yJ3+SziU9t5/Uiieg+zXJ0vnyaUOBDfFWDIXeySja+MzY2Nu1n1uodYpKYg8
	QFS0RBBxxfo779bduh96K6R0PXu6xJCqV2LNvVAz8rE2h98ztOljC1tNEkWSL5j0jYAgzOSlfhf
	MvWiuEwl1M6K4LxgKLWnU/CLK/pgVD7bOC8fGniWBgt5lRuVlmSdZ/4xyK9ZTJdfcnJGNhGmeR7
	zDU9kTvztJlypHCI1dCxAYy7KYGQDU0Xdkv9N9nNFs8JBvWzswQ0WydmxHCCbBNA9Lr0e2r3VAP
	hVBx0WRI1kbABDF7suHN88Q9XvGmfqOx0ewkN/PJFK9LlmDC0eq1K882p/gFRYU9rCy3Ct1XDYw
	zvVUtrBlrWiSAAOv+qbn3Z+JF8Ao5QmiUxZBoLn+qx/k81GIILytqfgcj796hKxO6SOcjAT7VM3
	RnZh5wAdIH8NEXj8XNQHIKusvkkCj1RL496r0bg=
X-Received: by 2002:ac2:568a:0:b0:5bf:cf80:aa76 with SMTP id 2adb3069b0e04-5c170435903mr4496087e87.0.1794858630530;
        Mon, 16 Nov 2026 11:50:30 -0800 (PST)
Received: from IuseArchBTW ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d1ff0sm35700701fa.32.2026.11.16.11.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:50:30 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rust: sync: atomic: Fix typo in SAFETY comment for `isize`
Date: Mon, 16 Nov 2026 21:50:09 +0200
Message-ID: <20261116195011.24156-2-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116195011.24156-1-mbkchelofficialdev@gmail.com>
References: <20261116195011.24156-1-mbkchelofficialdev@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SAFETY comment for the `AtomicAdd<isize>` impl of `isize` says
the result is a valid `usize`. Fix it to say `isize`.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
 rust/kernel/sync/atomic/predefine.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 3d63f40791fa..61394a32951a 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -106,7 +106,7 @@ unsafe impl super::AtomicType for isize {
     type Repr = isize_atomic_repr;
 }
 
-// SAFETY: The wrapping add result of two `isize_atomic_repr`s is a valid `usize`.
+// SAFETY: The wrapping add result of two `isize_atomic_repr`s is a valid `isize`.
 unsafe impl super::AtomicAdd<isize> for isize {
     fn rhs_into_delta(rhs: isize) -> isize_atomic_repr {
         rhs as isize_atomic_repr
-- 
2.56.1

