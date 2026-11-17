Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958745;
	b=QaJOICS5V+NH03oXaax7IWRlFPN6nSF0qQmZU4G8gc3na5A7D4KSjbglrxo74BWAtc0j
	 gcHB8B+2jTyAQml6DUZY5MsuTwh62aAvX/KCfonem8iLID/UiDFLC/KY1/uTXGO7A3qKD
	 RgPOJ+K+OV0yTcirZjTKox4WuZ5EO3gaTgytINT8zuNBjEGYXTXAfSvy7q2yVrS0lb+aC
	 L62YQlk7SO/K6NAypiJW52JhKe4V+WldG/4KFLDBgHRAdpI+UxJ2ql/epXNIfG2hbvH+U
	 YvnpOyYFh3QAi2JCG7vjySTcq7NjAhkm6NfIiTQgjEFL5fi+8Ac262Tzejx03JZEJoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=13rJ6qcrw0C+RVUGD6P0swGO3LEvWo1pHbPZ4Y4exz8=;
	b=OoJT2GM3KupGvlrmLmh/aYcgl+V2/mxFdH1XBy0j48UIlIXwtw40Cf+eDKOmijJ049y7
	 ur1ygoz1x6nU8FXLxweuBB7LFKnk3TrCXIvyowyENnhDZELmDmOC2qqPBR4YSvQM4MlQg
	 5jq58FavmRHRlRw+90vJj/6fqzCjbiUl4CeB07f5r/6RJPREHI7D6C3BMJ+4u747dy8Gz
	 Pw072PfhNhke/8qlqkViY4JeTUgHbyRO7i26u6VKo5SgOLXGNjDx8/GfaVsXt69fUw0xd
	 9hHWlUnii8HRCRU1npnwA8FkSfV6KC/z6ExgMGJkZ/06VQ6HD+qjlTx4CLEJQY+nBCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMNSOLwp;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422F8606A32A
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 23:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 422F8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMNSOLwp
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so546999eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 15:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794958744; x=1795563544; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=13rJ6qcrw0C+RVUGD6P0swGO3LEvWo1pHbPZ4Y4exz8=;
        b=JMNSOLwpwVPcqvk4AqGGxHoPyDbAzA95QH4DGL4r6iXLrbGoTNoTOai3VAvbEoznFF
         gB1l2Qck+SEXBGkmcStMzta6SEs7Od6ZImCs9GoAVPWsSA2ho6P1SgTjx5hhxrhtRtju
         OZ1WGbP/NV4FW1h3+YxQcgHMNksJVaoNiivk22EtZ0PwpXAFxX0VHzPML9jq1AbGrYAu
         IjLSS7W+loAKuYijjk+VZBD1EngHrQa6AQjG4yCIcPN9VouYBi+dRjviumyjdsfGTtTB
         PXeADQXEIBWVWDqa1RZFKOkoxIgHIwzxJ+5bfa39UXbAMe6yTyYOOifdH8UUsW962xM7
         yS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958744; x=1795563544;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13rJ6qcrw0C+RVUGD6P0swGO3LEvWo1pHbPZ4Y4exz8=;
        b=bKYYsAF9cbJVILCzGW+Cpp5v+VRGUNUe87yEpIzA6fBZArxtIDA22QuqwerOXhEmXB
         2VQ2UbO+fRd0oxewFJzRC3fU3kWhHuj/h2nRAp/zNAyOHvyXcQTkfRX4d2sXZIy1NChd
         J0p826wBaTSDr5XuzSaeilA2FdtXBFT9oASSPOZtSy5rQ0Wyx1Okp7k95Asa2/TllHYe
         YX5TKy9FHMK3x/asGywrKuaYkQsZvWuUsMLyfHFBxXmaJ53G2qQtro/EYKRfXE5gqjci
         wdUOeEAxXKdOzgrJxwHitCcbDBjWPmaZU3lEFfBGso3+6vJ4pXyP9zx23B8MZY8m3KGc
         OaTQ==
X-Forwarded-Encrypted: i=1; AL+hErFKz7r3sVCFSLrQobAsigcSqE52O2ZmKLqtl0SbaVSFX4lO7sNQMd+z/uxqcW+DY4M8hI2Z8wvdMHtiStQNFQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+eS6XLiJC+qP7gJnCiqrVvUcmcNeU5569oSYUDoz8/wYQeZQGB
	bTdqA/JaTsRKiBQfBeAdKH9FA5k/A4QglnC4QV0oXaRRQSH8fagMrSYWvHGkiiUKUxS+qXAxRt1
	KT3AM+Ve36EEL5w==
X-Received: from dyblf35.prod.google.com ([2002:a05:7301:a23:b0:381:d719:7923])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:420b:b0:381:ad6f:75e3 with SMTP id 5a478bee46e88-38280269c9dmr923584eec.6.1794958743665;
 Tue, 17 Nov 2026 15:39:03 -0800 (PST)
Date: Tue, 17 Nov 2026 23:39:00 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117233901.2212899-1-cmllamas@google.com>
Subject: [PATCH] MAINTAINERS: add rust-for-linux list to binder
From: Carlos Llamas <cmllamas@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"

Now that the legacy C binder driver has been dropped in commit
fd2bc059ed46 ("binder: rm -f binder.c"), drivers/android/ consists
of only the rust binder so add rust-for-linux@vger.kernel.org to the
ANDROID DRIVERS entry.

Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..64cd892b2516 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2062,6 +2062,7 @@ M:	Christian Brauner <christian@brauner.io>
 M:	Carlos Llamas <cmllamas@google.com>
 M:	Alice Ryhl <aliceryhl@google.com>
 L:	linux-kernel@vger.kernel.org
+L:	rust-for-linux@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
 F:	Documentation/netlink/specs/binder.yaml
-- 
2.56.1.703.gf848ed807c-goog

