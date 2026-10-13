Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FB230C345
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895082; cv=none; b=DJIc6ls4ENWq/IR13LJ+HF3qOeoMt6ouWzhYSfOXzf9DhptLtf/nLTptfnPxVGZmsSk3P90Xb9mZV3JVZFzcQu2T2fdUfu1zw/iqQSRZq3Sz2vBgjSKSx2XQajtAbhlpGUcMPQH8jS/TXrUSGrkHnB0/mCM8dPpNsiQ5l8fuORU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895082; c=relaxed/simple;
	bh=2tGE2WmnEPNrFWjCnZF0aEJIboQP/aokgDBBfAOAMqs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Wh7vnfowEUO3ggQjhpf/daPz9Jpr5Ve4cNji/aMiQ9llL4CNiDMzH1+4AHqcAENavP9GFGC1on9kpXW9Wd8ci9ON848xO6WXvmP9A5LPp4swyeBNIiMKi79xyZ1C2sTRgtj5ukSlezzxd/ZhTCO8zMWE+kUoLnej5A0OWkq0yK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sf3P9Sj0; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sf3P9Sj0"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c7fe9736eso2319452f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791895077; x=1792499877; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t9hNMOCJ4m5JaN9ocfveJBsLQeWWGZWvML3Wuv2Y8vk=;
        b=sf3P9Sj0YaGITSw+gh6slntLUvYb9SAADO/ttS49F1JWDuEcZQyQdrB61phCe8Il+H
         i/eTJkbjqwnrobdPJmcqQl65cSl0quqZeklnVoIRKmiHgA8msBNbLrrQswRrnh+BrJS7
         P1B4ZBpQiBvT1bM43g0Mdy73/XXMa/lbe0vU21Gw6x6YmEbTHOA2ydVqajq8eiHf9js1
         ON6Z9/wSoUKU4pGFdinT8rknvbOhNc2SohSJXqoiEIRWMeQT7edkOG2rEugYrhVOgR6j
         8xcGbmTlRGXZkRWe/IvihN8pb5bdWcxG33jBjymPJJEiAfCDm4eT2beNSPbsQ6q3gzfv
         lc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895077; x=1792499877;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9hNMOCJ4m5JaN9ocfveJBsLQeWWGZWvML3Wuv2Y8vk=;
        b=Pr5llKQj6iTDowRpKYo/INxHCOHcopiK09GGohGWEASY+r/NbBuGcTgbD69ETsX4K2
         ZTyIXCxf020pr6ETbf3MVZloftQxLu5H+YClSRwy/BhtMJJVXr86biwj2hj/h3zx92dy
         Y4rIhWnyY/74x0XIAU0BnGUiaKKdSF8K8gzAMTYT3g0iX7V1vsRI80uGZ+dfVLDYfheY
         z8CS8+P44046N5fxttIR8kZh/l1x7aq+3CaeDmL34E5sAiY3O9FMSJliCdjYFW8aGVZJ
         HXnhEspwtXitUdpAf65t5kwThmlB5P+tuecUnW94y8W81pUw9eannP5m7wwzBK+Xppo3
         URAg==
X-Forwarded-Encrypted: i=1; AKwUvBxVsO/go0PJm9HxfrcDt7BSlsn3AL8ze7ZQaBcrK+tjFLy9XVC03vlWcp56jp/pgQRwL9rCL+LWTMmUbZvs9A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLKvByV5/R8cYzJ755ic3B2qAQ1g2zYSdh5OLvX5+LA4nWr7CqU
	rI9uwVIJYR+k1iN/vW8Eug3YetqYfrA9tGP+IjHHoC7qazZHaH5RIQo/VGleaE9vpmd46CKX4Um
	Cr7kcuRQjFvBO9wzvyg==
X-Received: from wrvh15.prod.google.com ([2002:a5d:548f:0:b0:48b:11a5:9d99])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:f808:0:b0:48b:910:3598 with SMTP id ffacd0b85a97d-48dba9e6295mr17789668f8f.22.1791895076933;
 Tue, 13 Oct 2026 05:37:56 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:37:53 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACEmzmoC/43NTQ6CMBCG4auQWTumU4x/K+9hWGA7wCTYIW1DM
 IS7WzmBy/dbPN8KiaNwgnu1QuRZkmgoYQ8VuKENPaP40mCNPZMxF3xJ8BzRaUg6im8zY14CTlF
 CTujI1kTM1+50g2JMkTtZdv/ZlB4kZY2f/W6m3/qvPBOawpvasq+tpe7Rq/YjH52+odm27Qt1l UZjywAAAA==
X-Change-Id: 20261007-binder-consolidate-txn-prints-c12311ee8f49
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=2tGE2WmnEPNrFWjCnZF0aEJIboQP/aokgDBBfAOAMqs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqziYjAvUY29PxJ4YC0ENfJZMr1I7+60Ypbp2F6
 TNBcbCO5FuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCas4mIwAKCRAEWL7uWMY5
 RoVhD/9uNfLlY72qIbmEZblgxMCA1NDIUGHmVx1yvl0TYkwsqZLaOMagOa0/W+r8/jvTr92gWPM
 Z9gUhuu2u4hFC9inUdnZV/CiLtkAFdlzHaSfpCde8CAURolFDtuq3ETxLZz5WPpTabQNyDacvBE
 s13h2JvnsPGVJrrQ7uKy5d0MIexwAxkK6Qi1nTcWey6TrtQTPufVJWSsFoV7qquS49Fp120Q4gi
 TJXxtnwCjub99gYtwnq163uMLu+PEImfB2YS8H/lEicSclbos//hBLa00lmMzyCjlk9bIt/Y8gR
 BIRcicFk34xil5TpMGkLD/MZJWo3PSyneoeuwkLifDvsFidEUZk//VpoHh8rkb4wVDAQ5ajIvBz
 K6J+Vvp9ASoQvWoC32q+akeG7hXbXK+RS8usJ6ILvIyxjsIP/v7SaGk6l+3yhCztDxBnR6UFQx2
 UwqKKOKKRkJqKXbsbkf0uC9oI4U7+fliu8u8sCVnaOpsLJpeNQpCgETcKk3Lapu5chdzFYpT7Di
 AwLiZSzEnHd2w6YgyeWMYMgvSoTLBeIll5ZbUChvaaD0mnLTuiD8KdXnrsr8awFDLR0PzN9fswL
 ExxW3c6goMzswv/Hh3/hFCRcLMQQOMiV/36Gz5UTHrykDgHciZPN4ne41zt0a/23ewloJHN3INe gio6KfYiI+wfvlQ==
X-Mailer: b4 0.14.3
Message-ID: <20261013-binder-consolidate-txn-prints-v2-0-cf78927dab23@google.com>
Subject: [PATCH v2 0/3] rust_binder: consolidate transaction failure prints
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This series is split out from "Rate limited printing for Rust" [1] so it
can be routed through char-misc-next independently.

Patch 1 implements ZeroableOption for Error so that Option<Error> can be
stored in structs deriving Zeroable. Patch 2 updates TransactionInfo to
store Option<Error> instead of a raw i32 errno, and Patch 3 consolidates
the transaction failure prints into a single debug print.

Link: https://lore.kernel.org/r/20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com [1]

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Rebase on char-misc-next.
- Expand SAFETY comment on ZeroableOption for Error.
- Pick up Acked-by tag.
- Link to v1: https://lore.kernel.org/r/20261007-binder-consolidate-txn-prints-v1-0-c1032ed3221f@google.com

---
Alice Ryhl (3):
      rust: error: implement ZeroableOption for Error
      rust_binder: store Option<Error> in TransactionInfo
      rust_binder: consolidate transaction failure prints

 drivers/android/binder/error.rs       |  4 --
 drivers/android/binder/thread.rs      | 78 +++++++++++++++--------------------
 drivers/android/binder/transaction.rs | 28 ++++---------
 rust/kernel/error.rs                  |  5 +++
 4 files changed, 48 insertions(+), 67 deletions(-)
---
base-commit: 79e5797d243a466138f641932f81dc69f796060c
change-id: 20261007-binder-consolidate-txn-prints-c12311ee8f49

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

