Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5309A3612F6
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841316; cv=none; b=fQbE74Zi2O6ZEqsvG4inKimGJPRYMMHLVLPnqlrDtlvXqV4XjyoJ0/L5bIgKptrbfpxlvbzUaJBfxsvckdq/S2l8QVK0SXekKH5HHHuqbuF0+lwzq/Xo0g5c28PuDU6upZCXN4DDhsP22SZXzz3YQjMycgAryNHTYzr30SwA0TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841316; c=relaxed/simple;
	bh=fgB/iwLbohKh980nUt8XO9waGZx3cLIN28KQTHavg30=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nAKWD79NmGuZFUrarAaKw30STkA8/jXIBFCP7fA79Ci1+zKDsFbkv3atECuP+vkB8k3mHcwWxeGvrI4cgvlQs+nRXAEfh2MQT4fZ+xyfxezYJxoBJNZP+2vxGgovSn9tot+uCHAopnox25iwOMu9wv86ILsDVLPVjMpzvPW9BaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CVkWbQQ5; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CVkWbQQ5"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-65a1b27b84cso4820048a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 02:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771841314; x=1772446114; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wlxVSXIBEWmbvlrro6jhFkd5VzymdyQh6rt270iLHWc=;
        b=CVkWbQQ5Nw2UzIg13fmKwYYfkto5D7nCK/icW4sK686SZ9DPetQkW+7B4p2h7XZuJH
         neivNcqMbqScTwxXHzxnnw3HEkZ59mUCzeZsYmHEyPO5HUYeBJLAvZHX1lo94oprRoGe
         OgqnS+flELXLDswvPqhFXrAsjC3p4p5WTohXOuXBXUQAQQZTgxFtPO6j82n16g407gPW
         /Z9uHcIb97QafON2taanvFk1Ub21TLAQ/XQQudi4WBqHAVnfHuVmmcmMyIqgd57y7MDn
         Nw5I6nxO1DrjEr1Q6vck+uulfmQAGuuTT1B4epH25GqxzkN348gGagNn0yX6T7OLbR79
         Yblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771841314; x=1772446114;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlxVSXIBEWmbvlrro6jhFkd5VzymdyQh6rt270iLHWc=;
        b=opXkUGmDJMFQ56zgbBbtK+HyRvqM5lJi7/FHaEmU6F7DHtzc+/TURJBN9TTGU/G1kP
         1quteVEikBKhLS1hsGKMkBZHMXa3heX/kaG7JGHWwMdOOmYzmQ59qS2SsbozQF0FoCfS
         uLyZa/cmKzjXrZqk2OtfoJxPMFIL4LXiQsq8OSX+5SmkRLOf//nCSQ2Wzi8JPcpfZiTE
         A3OiUaKzbFT7Yt0wALrqOnKC+OhyCuSJ/XCm57XzE3rqDEZiO8wvGEuctqSbmjjd3k+R
         FIlEfhTSpIkfCYmRxrvV8W0R33SuWWozPzFdMGftt/HI7597GIxWeM0V7b9x4tXRBG6v
         LEtw==
X-Forwarded-Encrypted: i=1; AJvYcCUpPnFU2iE90iuePqzp1f/fFswDvjf/LxA4ho9LaPFZefQWJNVFIP3rF3QjLmsycXB5V68xgthvwtfrN+KHSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaQZuA6iEL0DnNvLbEuGGsLQfyb85gi6SPCai9P6DNQa1ZXjf/
	83xmwylpKTb7dGFPcMPMn6bim18gufQH/oI7Z93GucgWkWmfUVIJn0ocJAKNBGnaWgd9JE8iTy/
	Dwj5h4Pr2WoEsNFffcQ==
X-Received: from edbbc7.prod.google.com ([2002:a05:6402:2047:b0:654:503e:5179])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4017:b0:65c:2120:4055 with SMTP id 4fb4d7f45d1cf-65ea4ef5fc1mr4684466a12.17.1771841313635;
 Mon, 23 Feb 2026 02:08:33 -0800 (PST)
Date: Mon, 23 Feb 2026 10:08:24 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABgnnGkC/3XMQWrDMBCF4asErTNlZjSu5a56j9CFLI8dkcQqV
 jEJwXevEmhLHbJ8D77/arJOUbN521zNpHPMMY1lVNuNCXs/DgqxK9swcoUNCoTjAbKOHeTLGMC
 G3te9KAVlU8znpH0833u7j7L3MX+l6XLPz3R7n5VmAgJxHbK1jNq69yGl4agvIZ3MLTXzLydkX
 HMGBBHfVtZ6RScP3P5xJrfmtnAV17JyT+rDA5cf/opEds2l8Jq4DXXXiK+bf3xZlm9QTlKAaAE AAA==
X-Change-Id: 20250904-clk-send-sync-3cfa7f4e1ce2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1405; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=fgB/iwLbohKh980nUt8XO9waGZx3cLIN28KQTHavg30=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnCcbiIu+R+hONicI/5HczHhqmbqxSjeE33oZ0
 C7LVlUNYxWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZwnGwAKCRAEWL7uWMY5
 RjabEACzuGAOA16XYr7603EjsixgD4+MZeZHTazYT1169bUuHnSo3QoKPuZkN1kdkRtOy6YgOnk
 PpsY6nAPlmM0rSpPPTgq9GIYMuxGj8Ncp+2R84WBToDSn61axTSzHSJsE9iF2fGPtV+yQiQ5vo2
 Wr1RWr1ZfNnK0cHGL8ImbArrHUMZH3C/JAQKwPMFCTVUFH3i0LQlMGy44A8oo0yqQpCgqVJKUuj
 G5GT6RLyPmcLcd+7jsV/qaDOGyc+/gkF/yfTDsk0DV5IhgVqsHG7iO5F3Jl6tbX3JRe0q1UtEVe
 7ApNIttnFsBpF5n49tj+RfyrshVI9EjWZE7f4E0eCo8+MBnNgqRyeJfb7UFPh4W0B/G16NfLu38
 SkMbrLJnalt7IfA2B3/Oi8W1jg5K7Rw0NPuRc0X4ws04qON7jEq3TtAjwuj9vbGWzPOAdDCeP9A
 MpQOXyzsTfF9E4Z3QTFYYYEUiVVzK9takPy8oiYp+1AZEH3zMoRp360GegLQK4X1SHi3MhGUzI6
 wgKiWEBU4vSCqHTmcnMwNtuY7551LnVrn5oHjRH27Fe4muJgovNbenKsfGRx2Ud45xKMiKAUCxR
 AM6DCKpA9r8XIfinK5fFvyADHVdFilFkYAf0KOjo+zqa/h8g6WY6BgUNBLHTi13GZumE7phzwrl HXc+BH6rkn6/Ssg==
X-Mailer: b4 0.14.2
Message-ID: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
Subject: [PATCH v5 0/3] Implement Send and Sync for clk
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="utf-8"

The Clk type is thread-safe, so let's mark it as thread-safe in the type
system. This lets us get rid of hacks in drivers.

For Stephen's clk tree.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v5:
- Rebase on v7.0-rc1.
- Pick up Reviewed-by tags.
- Link to v4: https://lore.kernel.org/r/20260113-clk-send-sync-v4-0-712bc7d94a79@google.com

Changes in v4:
- Pick up Reviewed-by tags.
- Link to v3: https://lore.kernel.org/r/20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com

Changes in v3:
- Rebase on v6.19-rc1.
- Pick up tags.
- Add fix for pwm driver as well.
- Link to v2: https://lore.kernel.org/r/20251020-clk-send-sync-v2-0-44ab533ae084@google.com

Changes in v2:
- Rebase on v6.18-rc1.
- Add patch to tyr driver.
- Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1-48d023320eb8@google.com

---
Alice Ryhl (3):
      rust: clk: implement Send and Sync
      tyr: remove impl Send/Sync for TyrData
      pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData

 drivers/gpu/drm/tyr/driver.rs | 12 ------------
 drivers/pwm/pwm_th1520.rs     | 15 ---------------
 rust/kernel/clk.rs            |  7 +++++++
 3 files changed, 7 insertions(+), 27 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20250904-clk-send-sync-3cfa7f4e1ce2

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

