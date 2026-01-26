Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318CF20A5F3;
	Mon, 26 Jan 2026 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438817; cv=none; b=RjLbJXd+G+ui+uvKhrufJZ4vt+8u4Ji2BCxi0RS7ttbsn+BPkVGrsyK7YuHyEEHjoHvOl4C64KPl9D9QNvUKO6ynj79b0BrL9Zbg7EaicSzneyU3VLfMV5Sgt3BnZ7t6W1NuKZXzx981UKLyDYSBmbrz1BZoYqxQnP9XQDM5ugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438817; c=relaxed/simple;
	bh=zbPfomhDH982DqiaQ36wykTKcGkxY+/yoAlAmyb7Des=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i428xr9VuBr09TbzaupriPqdgGrF2Tpjb5C79cQJMZQjgq0ozpXzglubV4Eawx1PfozoGHAX4U7ttDLCAXhCU3j+eNdRjGBbTj6WKe0Hwcgnp+Un4ZZ9P7CC8FxP6IykMJUY2xx2RAbLIfhxQk9yLfF8Z3SMf9I4GKxi4JiFe4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byDqwG5e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byDqwG5e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6919AC116C6;
	Mon, 26 Jan 2026 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769438817;
	bh=zbPfomhDH982DqiaQ36wykTKcGkxY+/yoAlAmyb7Des=;
	h=From:Date:Subject:To:Cc:From;
	b=byDqwG5eqSBRaUXVZiS02B9GXjGi+NnhVXtkKx82CkcxCpNHzZo9Ot0PNXN9bwAq8
	 ybZYEh6sSESZLMLzA2hZKwix05Ck/NeFy0a0KI5cbqq082nl9Aw9X1oPFTMe5/ZehO
	 j2xFG5C7b6I4eCDJovfllfosa1KVZ1h2dNDjV1EqxQ5WgOzAgVUCS9EG6eRx+XAOkw
	 9+YhRfHV40hPWekKX7B4TXCuA/NmmxpbdhnNpUQTLSiLp+hAH15Sgtxf48SHiGdLoI
	 RYJt5NeC9WxbGG3/qbUKs1eN1qdbVyUFIuIEGQiFXa3JjI53cBTJdOqz74+m9x/Wjl
	 /SR41k8UlxKNw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 26 Jan 2026 09:46:53 -0500
Subject: [PATCH] MAINTAINERS: mailmap: update Tamir Duberstein's email
 address
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-tamird-kernel-org-v1-1-b390d329b0b9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBBG4VeRWTugodG2ryJdqPm100uUiYogv
 ruxXX6LczYKUEGge7KRYpEgg4/I04TaZ+17sLhoMpkpstwUPNVfUcdvqMeHB+35Upqyu8Ja624
 Uu1HRyfp7Vo+/w9y80E7niPb9AMZKlM91AAAA
X-Change-ID: 20260126-tamird-kernel-org-4727f8e555d9
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1769438815; l=1384;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=zbPfomhDH982DqiaQ36wykTKcGkxY+/yoAlAmyb7Des=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIFEKFpUjBw/UMK06tDoUK/ERjw/bEo1rcnjOpLQ+4MiEvUw3WqlkTh8aqpVudrJEsqCCdqW3U+
 0FTmRVWIdKgI=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Update Tamir Duberstein's email address to `@kernel.org`.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 4a8a160f28ed..e8a03e193854 100644
--- a/.mailmap
+++ b/.mailmap
@@ -797,6 +797,7 @@ Sven Eckelmann <sven@narfation.org> <sven@open-mesh.com>
 Sven Peter <sven@kernel.org> <sven@svenpeter.dev>
 Szymon Wilczek <swilczek.lx@gmail.com> <szymonwilczek@gmx.com>
 Takashi YOSHII <takashi.yoshii.zj@renesas.com>
+Tamir Duberstein <tamird@kernel.org> <tamird@gmail.com>
 Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> <tamizhr@codeaurora.org>
 Taniya Das <quic_tdas@quicinc.com> <tdas@codeaurora.org>
 Tanzir Hasan <tanzhasanwork@gmail.com> <tanzirh@google.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 2547f8f6f662..17057b5d0168 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28355,7 +28355,7 @@ F:	lib/xarray.c
 F:	tools/testing/radix-tree
 
 XARRAY API [RUST]
-M:	Tamir Duberstein <tamird@gmail.com>
+M:	Tamir Duberstein <tamird@kernel.org>
 M:	Andreas Hindborg <a.hindborg@kernel.org>
 L:	rust-for-linux@vger.kernel.org
 S:	Supported

---
base-commit: e741e19d7691c5e6f5c2bbff980d835dccb86054
change-id: 20260126-tamird-kernel-org-4727f8e555d9

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

