Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79417370D6E;
	Thu, 10 Sep 2026 23:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082429; cv=pass; b=AE3XaN7mJ4GL9n+BOCAt+ppFVb+2aulM28VHBg60yVM+dpEZ56Oja33wtq3K66+5ShiiKEr0VscEy6IPMQy+E3c18xO9UKF2aYOROhRCPc0PykC6wWymQFRts3lQkaKnDTZsFvh0bLLDD2ku0ReK+xHuWTcd1Jmy0SHR9FIsxlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082429; c=relaxed/simple;
	bh=pcE0l/tn3Wq8uejNfCTycfx1GuqzrRT0owXDnlhmIqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jqND1BbXc4VA8+b5IHw4J/U6QXIlKHFGcrtS9jjwmxjyMSdlEXkuomMRmBS+aapR8NRzP3t1p0fSP7vKOCZG3aHq4+5OZc9fsXZXtKwtRNpXGxIqJWZ9chv2T7t6hdjYAW6dW+dCp6/EvX95LybxEi1Q7t6RnCyBJ6PUj2P220Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=ciFY4bB3; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="ciFY4bB3"
ARC-Seal: i=1; a=rsa-sha256; t=1789082411; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dICRLHWmFcJhW7Li1ZKAzPR9SeXMIVisP7+e2dML8eh4sl0I8v9AcF9fCZxU6WK04oumBuz5HE/ww02tZgE0fEGUzR6+J0T9Al8c2X4iKLZWmUU2KCq5prNo+Gdobu0Lb4/XQESKZBGrulK8DCgQaCn2UodByaI8fkUCBe5mf6Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789082411; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=187CcQoCTRoovqrYNY1ZOziIvuACVyaVv/zhl3TFBHo=; 
	b=WxJctdud6S257OVprHvf/uHhZ6DVm1Lwatid089fv+9G6u/egv/baA43bJ62WnP4fRpNxnHR7CgzX4qJY9HUnxkCzNzONUST6G+nBhE/KmgWh6k+PJobC07IFeXvbiNwkmND2SCfbYcBkahAd0hh3YuYLkIsyL8BuJX3dWJo/Gc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789082411;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=187CcQoCTRoovqrYNY1ZOziIvuACVyaVv/zhl3TFBHo=;
	b=ciFY4bB3qD9m6kx1lqTEnWt6pK5J0lbPf4yzPuKIzH8R4lZDDNbw2M6PUh15nd53
	p9+Ys7jNdMedS+9oMTHf7vkyXsgOgVlMsS+KOZJNJKK0xXpY8l2ZIFrXyqLIjGANbv1
	gopBfsPfIPDQGrv+tSlI715Jvr/sdsnBoSTgZp8E=
Received: by mx.zohomail.com with SMTPS id 1789082409978286.37295934064014;
	Thu, 10 Sep 2026 16:20:09 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Thu, 10 Sep 2026 16:20:04 -0700
Subject: [PATCH] MAINTAINERS: add rust-for-linux list for Tyr
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-add-list-for-tyr-v1-1-cd74ff2c1f8a@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gaa4v8q4kJtqgFRSUUU8e4Wl
 28x80BgFQ7QJA8onxJkWyMoTWCc+3ViFBcN1tjC1GRwyLB3DhcJB/pN8bgV88oPoy2qkogglru
 yl+u/tt37fknBLAplAAAA
X-Change-ID: 20260910-b4-add-list-for-tyr-58fbc2687111
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=980;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=pcE0l/tn3Wq8uejNfCTycfx1GuqzrRT0owXDnlhmIqc=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFmLrTWW2czvqfat4FMqna64MnXClvLtqaw13y4158xzd
 fW+0JPRUcrCIMbFICumyHLW3qhHvOq9ke78/80wc1iZQIYwcHEKwEQ4PRj+F63n3VhlzmiiwnrI
 ernuyVoX48eGzn6v1hvs/6Jywk9pIcP/2EWXDkk3vVrn+EXz/60VohHPjx2fvjxb6P2MwshNAkp
 pHAA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Tyr is a Rust DRM driver and Tyr patches are reviewed on the
rust-for-linux mailing list. Add the list to the Tyr MAINTAINERS entry so
that scripts/get_maintainer.pl and b4 prep --auto-to-cc include it.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2389df80ba50..04709f381d04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2333,6 +2333,7 @@ ARM MALI TYR DRM DRIVER
 M:	Daniel Almeida <daniel.almeida@collabora.com>
 M:	Alice Ryhl <aliceryhl@google.com>
 L:	dri-devel@lists.freedesktop.org
+L:	rust-for-linux@vger.kernel.org
 S:	Supported
 W:	https://rust-for-linux.com/tyr-gpu-driver
 W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html

---
base-commit: 73e5616f3d197c1af5a04a481fe0f13aa3913bd1
change-id: 20260910-b4-add-list-for-tyr-58fbc2687111

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

